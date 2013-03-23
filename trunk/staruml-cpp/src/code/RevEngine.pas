unit RevEngine;

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
  CppElements, CodeModelBuilder, ModelTranslator, DiagramCreate, Utility,
  Classes, SysUtils, WhiteStarUML_TLB;

type
  // enumerations
  PReverseStep = (rsBegin, rsParse, rsCreateUMLModel, rsReviseReference, rsCreateDiagram, rsUpdateBrowser, rsEnd, rsAbort, rsError);

  // events
  PReverseEvent = procedure(Sender: TObject; Step: PReverseStep; Parameters: array of const) of object;

  // PRevEngine
  PRevEngine = class
  private
		{ Member Fields }
    CodeModelBuilder: PCodeModelBuilder;
    ModelTranslator: PModelTranslator;
    DiagramCreator: PDiagramCreator;
    FStarUMLApp: IStarUMLApplication;
    FSourceFiles: TStringList;
    FTopPackage: IUMLPackage;
    RootNamespace: PCppNamespace;
    { Internal Variables }
    IsOnReverse: Boolean;
    { Options }
    FCreateOverviewDiagram: Boolean;
    { Events }
    FOnParsing: PParseEvent;
    FOnParsed: PParseEvent;
    FOnParseError: PParseEvent;
    FOnTranslateCppElement: PCppElementEvent;
    FOnTranslateItem: PTranslateItemEvent;
    FOnAddUMLElement: PUMLElementEvent;
    FOnCreateView: PViewCreateEvent;
    FOnCreateDiagram: PDiagramCreateEvent;
    FOnStepReverse: PReverseEvent;
    FOnLog: PLogEvent;
    { Property Get/Set }
    procedure SetTopPackage(Value: IUMLPackage);
    procedure SetStarUMLApp(Value: IStarUMLApplication);
    function GetTranslatePublicMember: Boolean;
    function GetTranslateProtectedMember: Boolean;
    function GetTranslatePrivateMember: Boolean;
    function GetRefAsAssociation: Boolean;
    function GetOmitInitialValue: Boolean;
    function GetEnlargeDiagram: Boolean;
    function GetDiagramNameStr: string;
    function GetSuppressAttributes: Boolean;
    function GetSuppressOperations: Boolean;
    function GetHideOperationSignature: Boolean;
    function GetCreateOnlyInheritences: Boolean;
    procedure SetTranslatePublicMember(Value: Boolean);
    procedure SetTranslateProtectedMember(Value: Boolean);
    procedure SetTranslatePrivateMember(Value: Boolean);
    procedure SetRefAsAssociation(Value: Boolean);
    procedure SetOmitInitialValue(Value: Boolean);
    procedure SetEnlargeDiagram(Value: Boolean);
    procedure SetDiagramNameStr(Value: string);
    procedure SetSuppressAttributes(Value: Boolean);
    procedure SetSuppressOperations(Value: Boolean);
    procedure SetHideOperationSignature(Value: Boolean);
    procedure SetCreateOnlyInheritences(Value: Boolean);
    { Private Methods }
    function Initialized: Boolean;
    function GetSourceFileCount: Integer;
    function GetSourceFile(Index: Integer): string;
    procedure CreateRootNamespace;
    procedure ClearCodeModels;
    procedure ReverseStep(Step: PReverseStep); overload;
    procedure ReverseStep(Step: PReverseStep; Parameters: array of const); overload;
    procedure Log(Msg: string);
    { Event Handlers }
    procedure HandleParsing(Sender: TObject; Index: Integer; Total: Integer; SourceFileName: string);
    procedure HandleParsed(Sender: TObject; Index: Integer; Total: Integer; SourceFileName: string);
    procedure HandleParseError(Sender: TObject; Index: Integer; Total: Integer; SourceFileName: string);
    procedure HandleFirstTranslationStep(Sender: TObject);
    procedure HandleSecondTranslationStep(Sender: TObject);
    procedure HandleTranslateCppElement(Sender: TObject; CppElement: PCppElement; Index, Total: Integer);
    procedure HandleTranslateItem(Sender: TObject; Item: PTranslateItem; Index, Total: Integer);
    procedure HandleAddUMLElement(Sender: TObject; Element: IUMLElement);
    procedure HandleCreateView(Sender: TObject; View: IView; Index, Total: Integer);
    procedure HandleCreateDiagam(Sender: TObject; Diagram: IDiagram; Index, Total: Integer);
    procedure HandleLog(Sender: TObject; Msg: string);
  public
		{ Constructor/Destructor }
    constructor Create;
    destructor Destroy; override;
    { Public Methods }
    procedure AddSourceFile(FileName: string);
    procedure Clear;
    procedure Reverse;
    procedure Abort;
    { Properties }
    property SourceFileCount: Integer read GetSourceFileCount;
    property SourceFiles[Index: Integer]: string read GetSourceFile;
    property TopPackage: IUMLPackage read FTopPackage write SetTopPackage;
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write SetStarUMLApp;
    { Options }
    property TranslatePublicMember: Boolean read GetTranslatePublicMember write SetTranslatePublicMember;
    property TranslateProtectedMember: Boolean read GetTranslateProtectedMember write SetTranslateProtectedMember;
    property TranslatePrivateMember: Boolean read GetTranslatePrivateMember write SetTranslatePrivateMember;
    property RefAsAssociation: Boolean read GetRefAsAssociation write SetRefAsAssociation;
    property OmitInitialValue: Boolean read GetOmitInitialValue write SetOmitInitialValue;
    property EnlargeDiagram: Boolean read GetEnlargeDiagram write SetEnlargeDiagram;
    property DiagramNameStr: string read GetDiagramNameStr write SetDiagramNameStr;
    property SuppressAttributes: Boolean read GetSuppressAttributes write SetSuppressAttributes;
    property SuppressOperations: Boolean read GetSuppressOperations write SetSuppressOperations;
    property HideOperationSignature: Boolean read GetHideOperationSignature write SetHideOperationSignature;
    property CreateOnlyInheritences: Boolean read GetCreateOnlyInheritences write SetCreateOnlyInheritences;
    property CreateOverviewDiagram: Boolean read FCreateOverviewDiagram write FCreateOverviewDiagram;
    { Events }
    property OnParsing: PParseEvent read FOnParsing write FOnParsing;
    property OnParsed: PParseEvent read FOnParsed write FOnParsed;
    property OnParseError: PParseEvent read FOnParseError write FOnParseError;
    property OnTranslateCppElement: PCppElementEvent read FOnTranslateCppElement write FOnTranslateCppElement;
    property OnTranslateItem: PTranslateItemEvent read FOnTranslateItem write FOnTranslateItem;
    property OnAddUMLElement: PUMLElementEvent read FOnAddUMLElement write FOnAddUMLElement;
    property OnCreateView: PViewCreateEvent read FOnCreateView write FOnCreateView;
    property OnCreateDiagram: PDiagramCreateEvent read FOnCreateDiagram write FOnCreateDiagram;
    property OnStepReverse: PReverseEvent read FOnStepReverse write FOnStepReverse;
    property OnLog: PLogEvent read FOnLog write FOnLog;
  end;

implementation

uses
  Symbols;

////////////////////////////////////////////////////////////////////////////////
//  PRevEngine

{ Constructor/Destructor }

constructor PRevEngine.Create;
begin
  FSourceFiles := TStringList.Create;
  CodeModelBuilder := PCodeModelBuilder.Create;
  CodeModelBuilder.OnParsing := HandleParsing;
  CodeModelBuilder.OnParsed := HandleParsed;
  CodeModelBuilder.OnParseError := HandleParseError;
  CodeModelBuilder.OnLog := HandleLog;
  ModelTranslator := PModelTranslator.Create;
  ModelTranslator.OnFirstTranslationStep := HandleFirstTranslationStep;
  ModelTranslator.OnSecondTranslationStep := HandleSecondTranslationStep;
  ModelTranslator.OnTranslateCppElement := HandleTranslateCppElement;
  ModelTranslator.OnTranslateItem := HandleTranslateItem;
  ModelTranslator.OnAddUMLElement := HandleAddUMLElement;
  ModelTranslator.OnLog := HandleLog;
  DiagramCreator := PDiagramCreator.Create;
  DiagramCreator.OnCreateView := HandleCreateView;
  DiagramCreator.OnCreateDiagram := HandleCreateDiagam;
  DiagramCreator.OnLog := HandleLog;
  RootNamespace := nil;
  CreateRootNamespace;
end;

destructor PRevEngine.Destroy;
begin
  RootNamespace.Free;
  RootNamespace := nil;
  FSourceFiles.Free;
  FSourceFiles := nil;
  CodeModelBuilder.Free;
  CodeModelBuilder := nil;
  ModelTranslator.Free;
  ModelTranslator := nil;
  DiagramCreator.Free;
  DiagramCreator := nil;
end;

{ Property Get/Set }

procedure PRevEngine.SetTopPackage(Value: IUMLPackage);
begin
  FTopPackage := Value;
  ModelTranslator.BasePackage := Value;
end;

procedure PRevEngine.SetStarUMLApp(Value: IStarUMLApplication);
begin
  FStarUMLApp := Value;
  ModelTranslator.StarUMLApp := Value;
  DiagramCreator.StarUMLApp := Value;
end;

function PRevEngine.GetTranslatePublicMember: Boolean;
begin
  Result := ModelTranslator.TranslatePublicMember;
end;

function PRevEngine.GetTranslateProtectedMember: Boolean;
begin
  Result := ModelTranslator.TranslateProtectedMember;
end;

function PRevEngine.GetTranslatePrivateMember: Boolean;
begin
  Result := ModelTranslator.TranslatePrivateMember;
end;

function PRevEngine.GetRefAsAssociation: Boolean;
begin
  Result := ModelTranslator.RefAsAssociation;
end;

function PRevEngine.GetOmitInitialValue: Boolean;
begin
  Result := ModelTranslator.OmitInitialValue;
end;

function PRevEngine.GetEnlargeDiagram: Boolean;
begin
  Result := DiagramCreator.EnlargeDiagram;
end;

function PRevEngine.GetDiagramNameStr: string;
begin
  Result := DiagramCreator.DiagramNameStr;
end;

function PRevEngine.GetSuppressAttributes: Boolean;
begin
  Result := DiagramCreator.SuppressAttributes;
end;

function PRevEngine.GetSuppressOperations: Boolean;
begin
  Result := DiagramCreator.SuppressOperations;
end;

function PRevEngine.GetHideOperationSignature: Boolean;
begin
  Result := DiagramCreator.HideOperationSignature;
end;

function PRevEngine.GetCreateOnlyInheritences: Boolean;
begin
  Result := DiagramCreator.CreateOnlyInheritences;
end;

procedure PRevEngine.SetTranslatePublicMember(Value: Boolean);
begin
  ModelTranslator.TranslatePublicMember := Value;
end;

procedure PRevEngine.SetTranslateProtectedMember(Value: Boolean);
begin
  ModelTranslator.TranslateProtectedMember := Value;
end;

procedure PRevEngine.SetTranslatePrivateMember(Value: Boolean);
begin
  ModelTranslator.TranslatePrivateMember := Value;
end;

procedure PRevEngine.SetRefAsAssociation(Value: Boolean);
begin
  ModelTranslator.RefAsAssociation := Value;
end;

procedure PRevEngine.SetOmitInitialValue(Value: Boolean);
begin
  ModelTranslator.OmitInitialValue := Value;
end;

procedure PRevEngine.SetEnlargeDiagram(Value: Boolean);
begin
  DiagramCreator.EnlargeDiagram := Value;
end;

procedure PRevEngine.SetDiagramNameStr(Value: string);
begin
  DiagramCreator.DiagramNameStr := Value;
end;

procedure PRevEngine.SetSuppressAttributes(Value: Boolean);
begin
  DiagramCreator.SuppressAttributes := Value;
end;

procedure PRevEngine.SetSuppressOperations(Value: Boolean);
begin
  DiagramCreator.SuppressOperations := Value;
end;

procedure PRevEngine.SetHideOperationSignature(Value: Boolean);
begin
  DiagramCreator.HideOperationSignature := Value;
end;

procedure PRevEngine.SetCreateOnlyInheritences(Value: Boolean);
begin
  DiagramCreator.CreateOnlyInheritences := Value;
end;

{ Private Methods }

function PRevEngine.Initialized: Boolean;
begin
  Result := (FStarUMLApp <> nil) and (FTopPackage <> nil) and (RootNamespace <> nil);
end;

function PRevEngine.GetSourceFileCount: Integer;
begin
  Result := FSourceFiles.Count;
end;

function PRevEngine.GetSourceFile(Index: Integer): string;
begin
  Result := FSourceFiles[Index];
end;

procedure PRevEngine.CreateRootNamespace;
begin
  if RootNamespace = nil then begin
    RootNamespace := PCppNamespace.Create;
    RootNamespace.Name := '';
    RootNamespace.IsUnnamed := True;
    CodeModelBuilder.RootNamespace := RootNamespace;
    ModelTranslator.RootNamespace := RootNamespace;
  end;
end;

procedure PRevEngine.ClearCodeModels;
begin
  RootNamespace.Free;
  RootNamespace := nil;
  CreateRootNamespace;
end;

procedure PRevEngine.ReverseStep(Step: PReverseStep);
begin
  if Assigned(FOnStepReverse) then
    FOnStepReverse(Self, Step, []);
end;

procedure PRevEngine.ReverseStep(Step: PReverseStep; Parameters: array of const);
begin
  if Assigned(FOnStepReverse) then
    FOnStepReverse(Self, Step, Parameters);
end;

procedure PRevEngine.Log(Msg: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg);
end;

procedure PRevEngine.HandleParsing(Sender: TObject; Index: Integer; Total: Integer; SourceFileName: string);
begin
  if Assigned(FOnParsing) then
    FOnParsing(Self, Index, Total, SourceFileName);
end;

procedure PRevEngine.HandleParsed(Sender: TObject; Index: Integer; Total: Integer; SourceFileName: string);
begin
  if Assigned(FOnParsed) then
    FOnParsed(Self, Index, Total, SourceFileName);
end;

procedure PRevEngine.HandleParseError(Sender: TObject; Index: Integer; Total: Integer; SourceFileName: string);
begin
  if Assigned(FOnParseError) then
    FOnParseError(Self, Index, Total, SourceFileName);
end;

procedure PRevEngine.HandleFirstTranslationStep(Sender: TObject);
begin
  ReverseStep(rsCreateUMLModel);
end;

procedure PRevEngine.HandleSecondTranslationStep(Sender: TObject);
begin
  ReverseStep(rsReviseReference);
end;

procedure PRevEngine.HandleTranslateCppElement(Sender: TObject; CppElement: PCppElement; Index, Total: Integer);
begin
  if Assigned(FOnTranslateCppElement) then
    FOnTranslateCppElement(Self, CppElement, Index, Total);
end;

procedure PRevEngine.HandleTranslateItem(Sender: TObject; Item: PTranslateItem; Index, Total: Integer);
begin
  if Assigned(FOnTranslateItem) then
    FOnTranslateItem(Self, Item, Index, Total);
end;

procedure PRevEngine.HandleAddUMLElement(Sender: TObject; Element: IUMLElement);
begin
  if Assigned(FOnAddUMLElement) then
    FOnAddUMLElement(Self, Element);
end;

procedure PRevEngine.HandleCreateView(Sender: TObject; View: IView; Index, Total: Integer);
begin
  if Assigned(FOnCreateView) then
    FOnCreateView(Self, View, Index, Total);
end;

procedure PRevEngine.HandleCreateDiagam(Sender: TObject; Diagram: IDiagram; Index, Total: Integer);
begin
  if Assigned(FOnCreateDiagram) then
    FOnCreateDiagram(Self, Diagram, Index, Total);
end;

procedure PRevEngine.HandleLog(Sender: TObject; Msg: string);
begin
  Log(Msg);
end;

{ Public Methods }

procedure PRevEngine.AddSourceFile(FileName: string);
begin
  if FSourceFiles.IndexOf(FileName) = -1 then
    FSourceFiles.Add(FileName);
end;

procedure PRevEngine.Clear;
begin
  FSourceFiles.Clear;
  ClearCodeModels;
end;

procedure PRevEngine.Reverse;
var
  I: Integer;
begin
  if not Initialized then
    raise ENotInitialized.Create(ERR_RV_NOT_INITIALIZED);

  try
    try
      IsOnReverse := True;
      // 1. start reverse
      if IsOnReverse then begin
        ReverseStep(rsBegin);
        for I := 0 to SourceFileCount - 1 do
          CodeModelBuilder.AddSourceFile(SourceFiles[I]);
      end;

      // 2. build code model
      if IsOnReverse then begin
        ReverseStep(rsParse);
        try
          CodeModelBuilder.Build;
        except
          on E: Exception do
            Log(E.Message);
        end;
      end;

      // 3. translate models
      if IsOnReverse then begin
        StarUMLApp.BeginUpdate;
        try
          try
            ModelTranslator.Translate;
          except
            on E: Exception do
              Log(E.Message);
          end;
        finally
          ReverseStep(rsUpdateBrowser);
          StarUMLApp.EndUpdate2(True, True);
        end;
      end;

      // 4. create diagrams
      if IsOnReverse and FCreateOverviewDiagram then begin
        ReverseStep(rsCreateDiagram);
        try
          DiagramCreator.CreateOverviewDiagrams(FTopPackage);
        except
          on E: Exception do
            Log(E.Message);
        end;
      end;

      // 5. finish reverse
      if IsOnReverse then
        ReverseStep(rsEnd)
      else
        ReverseStep(rsAbort);
    except
      on E: Exception do
        ReverseStep(rsError, [E.Message]);
    end;
  finally
    CodeModelBuilder.Clear;
    IsOnReverse := False;
  end;
end;

procedure PRevEngine.Abort;
begin
  IsOnReverse := False;
  CodeModelBuilder.Abort;
  ModelTranslator.Abort;
  DiagramCreator.Abort;
end;

//  PRevEngine
////////////////////////////////////////////////////////////////////////////////

end.
