unit DiagramCreate;

{******************************************************************************}
{                                                                              }
{                StarUML - The Open Source UML/MDA Platform.                   }
{                                                                              }
{              Copyright (C) 2002-2005 - Plastic Software, Inc.                }
{                                                                              }
{                                                                              }
{ This program is free software; you can redistribute it and/or modify it      }
{ under the terms of the GNU General Public License as published by the Free   }
{ Software Foundation; either version 2 of the License, or (at your option)    }
{ any later version.                                                           }
{                                                                              }
{ This program is distributed in the hope that it will be useful, but WITHOUT  }
{ ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        }
{ FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     }
{ more details.                                                                }
{                                                                              }
{ You should have received a copy of the GNU General Public License along with }
{ this program; if not, write to the Free Software Foundation, Inc., 51        }
{ Franklin St, Fifth Floor, Boston, MA 02110-1301 USA                          }
{                                                                              }
{ Linking StarUML statically or dynamically with other modules is making a     }
{ combined work based on StarUML. Thus, the terms and conditions of the GNU    }
{ General Public License cover the whole combination.                          }
{                                                                              }
{ In addition, as a special exception, Plastic Software give you permission to }
{ combine StarUML program with free software programs or libraries that are    }
{ released under the GNU LGPL/Mozilla/Apache/BSD and with code included in the }
{ standard release of ExpressBar, ExpressNavBar, ExpressInspector,             }
{ ExpressPageControl, ProGrammar, NextGrid under the commercial license (or    }
{ modified versions of such code, with unchanged license). You may copy and    }
{ distribute such a system following the terms of the GNU GPL for StarUML and  }
{ the licenses of the other code concerned, provided that you include the      }
{ source code of that other code when and as the GNU GPL requires distribution }
{ of source code. Plastic Software also give you permission to combine StarUML }
{ program with dynamically linking plug-in (or add-in) programs that are       }
{ released under the GPL-incompatible and proprietary license.                 }
{                                                                              }
{ Note that people who make modified versions of StarUML are not obligated to  }
{ grant this special exception for their modified versions; it is their choice }
{ whether to do so. The GNU General Public License gives permission to release }
{ a modified version without this exception; this exception also makes it      }
{ possible to release a modified version which carries forward this exception. }
{******************************************************************************}

interface

uses
  Utility,
  Classes, WhiteStarUML_TLB;

type
  // events
  PViewCreateEvent = procedure(Sender: TObject; View: IView; Index, Total: Integer) of object;
  PDiagramCreateEvent = procedure(Sender: TObject; Diagram: IDiagram; Index, Total: Integer) of object;

  // PDiagramCreator
  PDiagramCreator = class
  private
    FStarUMLApp: IStarUMLApplication;
    { Internal Variables }
    IsOnCreating: Boolean;
    ViewCount: Integer;
    CurViewPos: Integer;
    { Options }
    FEnlargeDiagram: Boolean;
    FDiagramNameStr: string;
    FSuppressAttributes: Boolean;
    FSuppressOperations: Boolean;
    FHideOperationSignature: Boolean;
    FCreateOnlyInheritences: Boolean;
    { Events }
    FOnCreateView: PViewCreateEvent;
    FOnCreateDiagram: PDiagramCreateEvent;
    FOnLog: PLogEvent;
  private
    { Private Methods }
    function Initialized: Boolean;
    function OverviewDiagramRequired(P: IUMLPackage): Boolean;
    function EvaluateCreatingViewCount(P: IUMLPackage): Integer;
    procedure CollectPackage(UMLPackage: IUMLPackage; PackageList: TInterfaceList);
    function CreateOverviewDiagram(UMLPackage: IUMLPackage): IUMLDiagram;
    procedure DiagramCreate(Diagram: IDiagram; Index, Total: Integer);
    procedure Log(Msg: string);
  public
    { Constructor/Destructor }
    constructor Create;
    destructor Destroy; override;
    { Public Methods }
    procedure CreateOverviewDiagrams(BasePackage: IUMLPackage);
    procedure Abort;
    { Properties }
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
    { Options }
    property EnlargeDiagram: Boolean read FEnlargeDiagram write FEnlargeDiagram;
    property DiagramNameStr: string read FDiagramNameStr write FDiagramNameStr;
    property SuppressAttributes: Boolean read FSuppressAttributes write FSuppressAttributes;
    property SuppressOperations: Boolean read FSuppressOperations write FSuppressOperations;
    property HideOperationSignature: Boolean read FHideOperationSignature write FHideOperationSignature;
    property CreateOnlyInheritences: Boolean read FCreateOnlyInheritences write FCreateOnlyInheritences;
    { Events }
    property OnCreateView: PViewCreateEvent read FOnCreateView write FOnCreateView;
    property OnCreateDiagram: PDiagramCreateEvent read FOnCreateDiagram write FOnCreateDiagram;
    property OnLog: PLogEvent read FOnLog write FOnLog;
  end;

implementation

uses
  Symbols,
  SysUtils, Forms;

/////////////////////////////////////////////////////////////////////////////
// PDiagramCreator

constructor PDiagramCreator.Create;
begin
  FStarUMLApp := nil;
end;

destructor PDiagramCreator.Destroy;
begin
  FStarUMLApp := nil;
  inherited;
end;

function PDiagramCreator.Initialized: Boolean;
begin
  Result := (FStarUMLApp <> nil);
end;

function PDiagramCreator.OverviewDiagramRequired(P: IUMLPackage): Boolean;
var
  M: IUMLModelElement;
  I: Integer;
begin
  Result := False;
  for I := 0 to P.GetOwnedElementCount - 1 do begin
    M := P.GetOwnedElementAt(I);
    if M.IsKindOf(ELEM_CLASS) or M.IsKindOf(ELEM_INTERFACE) or M.IsKindOf(ELEM_ENUMERATION) then begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure PDiagramCreator.CollectPackage(UMLPackage: IUMLPackage; PackageList: TInterfaceList);
var
  SubPkg: IUMLPackage;
  I: Integer;
begin
  if OverviewDiagramRequired(UMLPackage) then
    PackageList.Add(UMLPackage);
  for I := 0 to UMLPackage.GetOwnedElementCount - 1 do
    if UMLPackage.GetOwnedElementAt(I).QueryInterface(IUMLPackage, SubPkg) = S_OK then
      CollectPackage(SubPkg, PackageList);
end;

function PDiagramCreator.EvaluateCreatingViewCount(P: IUMLPackage): Integer;
var
  M: IUMLModelElement;
  C, I: Integer;
begin
  C := 0;
  for I := 0 to P.GetOwnedElementCount - 1 do begin
    M := P.GetOwnedElementAt(I);
    if M.IsKindOf(ELEM_CLASS) or M.IsKindOf(ELEM_INTERFACE) or M.IsKindOf(ELEM_ENUMERATION) then
      Inc(C);
  end;
  Result := C;
end;

function PDiagramCreator.CreateOverviewDiagram(UMLPackage: IUMLPackage): IUMLDiagram;
var
  Dgm: IUMLClassDiagram;
  DgmView: IDiagramView;
  M: IUMLModelElement;
  V: IView;
  I: Integer;
begin
  FStarUMLApp.BeginUpdate;
  try
    Dgm := FStarUMLApp.UMLFactory.CreateClassDiagram(UMLPackage);
    Dgm.Name := StringReplace(FDiagramNameStr, '%s', UMLPackage.Name, [rfReplaceAll]);
    DgmView := Dgm.DiagramView;
    for I := 0 to UMLPackage.GetOwnedElementCount - 1 do begin
      M := UMLPackage.GetOwnedElementAt(I);
      if M.IsKindOf(ELEM_CLASS) or M.IsKindOf(ELEM_INTERFACE) or M.IsKindOf(ELEM_ENUMERATION) then begin
        V := DgmView.CreateViewOf(M, 0, 0);
        Inc(CurViewPos);
        if Assigned(FOnCreateView) then
          FOnCreateView(Self, V, CurViewPos, ViewCount);
        if V.IsKindOf(ELEM_CLASSIFIER_VIEW) then begin
          (V as IUMLClassifierView).SuppressAttributes := FSuppressAttributes;
          (V as IUMLClassifierView).SuppressOperations := FSuppressOperations;
          (V as IUMLClassifierView).ShowOperationSignature := not FHideOperationSignature;
        end
        else if V.IsKindOf(ELEM_ENUMERATION_VIEW) then begin
          (V as IUMLEnumerationView).SuppressLiterals := FSuppressAttributes;
          (V as IUMLEnumerationView).SuppressOperations := FSuppressOperations;
          (V as IUMLEnumerationView).ShowOperationSignature := not FHideOperationSignature;
        end;
      end;
    end;
    if FCreateOnlyInheritences then
      for I := DgmView.GetOwnedViewCount - 1 downto 0 do begin
        V := DgmView.GetOwnedViewAt(I);
        if V.IsKindOf(ELEM_ASSOCIATION_VIEW) or V.IsKindOf(ELEM_DEPENDENCY_VIEW) then
          FStarUMLApp.DeleteView(V);
      end;
  finally
    FStarUMLApp.EndUpdate2(True, True);
  end;
  FStarUMLApp.OpenDiagram(Dgm);
  Application.ProcessMessages;
  DgmView.LayoutDiagram;
  Result := Dgm;
end;

procedure PDiagramCreator.DiagramCreate(Diagram: IDiagram; Index, Total: Integer);
begin
  if Assigned(FOnCreateDiagram) then
    FOnCreateDiagram(Self, Diagram, Index, Total);
end;

procedure PDiagramCreator.Log(Msg: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg);
end;

procedure PDiagramCreator.CreateOverviewDiagrams(BasePackage: IUMLPackage);
var
  Packages: TInterfaceList;
  Pkg: IUMLPackage;
  Dgm: IUMLDiagram;
  I: Integer;
begin
  if not Initialized then
    raise ENotInitialized.Create(ERR_DC_NOT_INITIALIZED);

  Packages := TInterfaceList.Create;
  try
    CollectPackage(BasePackage, Packages);
    ViewCount := 0;
    for I := 0 to Packages.Count - 1 do
      if Packages.Items[I].QueryInterface(IUMLPackage, Pkg) = S_OK then
        ViewCount := ViewCount + EvaluateCreatingViewCount(Pkg);
    IsOnCreating := True;
    CurViewPos := 0;
    try
      for I := 0 to Packages.Count - 1 do begin
        if not IsOnCreating then
          Break;
        if Packages.Items[I].QueryInterface(IUMLPackage, Pkg) = S_OK then begin
          Dgm := CreateOverviewDiagram(Pkg);
          DiagramCreate(Dgm, I + 1, Packages.Count);
        end;
      end;
    finally
      ViewCount := 0;
      CurViewPos := 0;
      IsOnCreating := False;
    end;
  finally
    Packages.Free;
  end;
end;

procedure PDiagramCreator.Abort;
begin
  IsOnCreating := False;
end;

// PDiagramCreator
/////////////////////////////////////////////////////////////////////////////

end.
