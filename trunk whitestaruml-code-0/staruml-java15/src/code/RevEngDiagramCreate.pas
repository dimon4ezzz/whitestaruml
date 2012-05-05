unit RevEngDiagramCreate;

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
  Classes, WhiteStarUML_TLB;

type
  // events
  PUMLViewEvent = procedure(Sender: TObject; View: IView; Index, Total: Integer) of object;
  PUMLDiagramCreatingEvent = procedure(Sender: TObject; Diagram: IUMLDiagram; Index, Total: Integer) of object;

  // PDiagramCreator
  PDiagramCreator = class
  private
    StarUMLApp: IStarUMLApplication;
    FPackages: TInterfaceList;
    // internal variable
    IsOnCreating: Boolean;
    ViewCount: Integer;
    CurViewIndex: Integer;
    // options
    FEnlargeDiagram: Boolean;
    FDiagramNameStr: string;
    FSuppressAttributes: Boolean;
    FSuppressOperations: Boolean;
    FShowOperationSignature: Boolean;
    FCreateOnlyInheritences: Boolean;
    // events
    FOnAddUMLView: PUMLViewEvent;
    FOnCreateUMLDiagram: PUMLDiagramCreatingEvent;
  private
    function EvaluateViewCount: Integer;
    function CreateOverviewDiagram(UMLPackage: IUMLPackage): IUMLDiagram;
  public
    constructor Create(AStarUMLApp: IStarUMLApplication);
    destructor Destroy; override;
    procedure Clear;
    procedure AddPackage(Value: IUMLPackage);
    procedure RemovePackage(Value: IUMLPackage);
    function OverviewDiagramRequired(P: IUMLPackage): Boolean;
    procedure CreateOverviewDiagrams;
    procedure Abort;
    property EnlargeDiagram: Boolean read FEnlargeDiagram write FEnlargeDiagram;
    property DiagramNameStr: string read FDiagramNameStr write FDiagramNameStr;
    property SuppressAttributes: Boolean read FSuppressAttributes write FSuppressAttributes;
    property SuppressOperations: Boolean read FSuppressOperations write FSuppressOperations;
    property ShowOperationSignature: Boolean read FShowOperationSignature write FShowOperationSignature;
    property CreateOnlyInheritences: Boolean read FCreateOnlyInheritences write FCreateOnlyInheritences;
    property OnAddUMLView: PUMLViewEvent read FOnAddUMLView write FOnAddUMLView;
    property OnCreateUMLDiagram: PUMLDiagramCreatingEvent read FOnCreateUMLDiagram write FOnCreateUMLDiagram;
  end;

implementation

uses
  SysUtils;

/////////////////////////////////////////////////////////////////////////////
// PDiagramCreator

constructor PDiagramCreator.Create(AStarUMLApp: IStarUMLApplication);
begin
  StarUMLApp := AStarUMLApp;
  FPackages := TInterfaceList.Create;
end;

destructor PDiagramCreator.Destroy;
begin
  FPackages.Free;
  StarUMLApp := nil;
end;

function PDiagramCreator.EvaluateViewCount: Integer;

  function GetClassifierCount(UMLPackage: IUMLPackage): Integer;
  var
    M: IUMLModelElement;
    Count: Integer;
    I: Integer;
  begin
    Count := 0;
    for I := 0 to UMLPackage.GetOwnedElementCount - 1 do begin
      M := UMLPackage.GetOwnedElementAt(I);
      if M.IsKindOf('UMLClass') or M.IsKindOf('UMLInterface') then
        Inc(Count);
    end;
    Result := Count;
  end;

var
  Pkg: IUMLPackage;
  Count: Integer;
  I: Integer;
begin
  Count := 0;
  for I := 0 to FPackages.Count - 1 do begin
    if FPackages.Items[I].QueryInterface(IUMLPackage, Pkg) = S_OK then
      Count := Count + GetClassifierCount(Pkg);
  end;
  Result := Count;
end;

function PDiagramCreator.CreateOverviewDiagram(UMLPackage: IUMLPackage): IUMLDiagram;
var
  Dgm: IUMLClassDiagram;
  DgmView: IDiagramView;
  M: IUMLModelElement;
  V: IView;
  I: Integer;
begin
  StarUMLApp.BeginUpdate;
  try
    Dgm := StarUMLApp.UMLFactory.CreateClassDiagram(UMLPackage);
    Dgm.Name := StringReplace(FDiagramNameStr, '%s', UMLPackage.Name, [rfReplaceAll]);
    DgmView := Dgm.DiagramView;
    for I := 0 to UMLPackage.GetOwnedElementCount - 1 do begin
      M := UMLPackage.GetOwnedElementAt(I);
      if M.IsKindOf('UMLClass') or M.IsKindOf('UMLInterface') then begin
        Inc(CurViewIndex);
        V := DgmView.CreateViewOf(M, 0, 0);
        if Assigned(FOnAddUMLView) then
          FOnAddUMLView(Self, V, CurViewIndex, ViewCount);
        if V.IsKindOf('UMLClassView') then begin
          (V as IUMLClassView).SuppressAttributes := FSuppressAttributes;
          (V as IUMLClassView).SuppressOperations := FSuppressOperations;
        end;
        (V as IUMLClassifierView).ShowOperationSignature := FShowOperationSignature;
      end;
    end;
    if FCreateOnlyInheritences then
      for I := DgmView.GetOwnedViewCount - 1 downto 0 do begin
        V := DgmView.GetOwnedViewAt(I);
        if V.IsKindOf('UMLAssociationView') or V.IsKindOf('UMLDependencyView') then
          StarUMLApp.DeleteView(V);
      end;
  finally
    StarUMLApp.EndUpdate2(True, True);
  end;
  StarUMLApp.OpenDiagram(Dgm);
  DgmView.LayoutDiagram;
  Result := Dgm;
end;

procedure PDiagramCreator.Clear;
begin
  FPackages.Clear;
end;

procedure PDiagramCreator.AddPackage(Value: IUMLPackage);
begin
  if FPackages.IndexOf(Value) = -1 then
    FPackages.Add(Value);
end;

procedure PDiagramCreator.RemovePackage(Value: IUMLPackage);
var
  Idx: Integer;
begin
  Idx := FPackages.IndexOf(Value);
  if Idx <> -1 then
    FPackages.Delete(Idx);
end;

function PDiagramCreator.OverviewDiagramRequired(P: IUMLPackage): Boolean;
var
  M: IUMLModelElement;
  I: Integer;
begin
  Result := False;
  for I := 0 to P.GetOwnedElementCount - 1 do begin
    M := P.GetOwnedElementAt(I);
    if M.IsKindOf('UMLClass') or M.IsKindOf('UMLInterface') then begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure PDiagramCreator.CreateOverviewDiagrams;
var
  Pkg: IUMLPackage;
  Dgm: IUMLDiagram;
  I: Integer;
begin
  ViewCount := EvaluateViewCount;
  CurViewIndex := 0;
  IsOnCreating := True;
  try
    for I := 0 to FPackages.Count - 1 do begin
      Assert(FPackages.Items[I].QueryInterface(IUMLPackage, Pkg) = S_OK);
      if IsOnCreating then begin
        Dgm := CreateOverviewDiagram(Pkg);
        if (Dgm <> nil) and Assigned(FOnCreateUMLDiagram) then
          FOnCreateUMLDiagram(Self, Dgm, I + 1, FPackages.Count);
      end;
    end;
  finally
    ViewCount := 0;
    CurViewIndex := 0;
    IsOnCreating := False;
  end;
end;

procedure PDiagramCreator.Abort;
begin
  IsOnCreating := False;
end;

// PDiagramCreator
/////////////////////////////////////////////////////////////////////////////

end.
