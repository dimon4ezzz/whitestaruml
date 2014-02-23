unit RevEng;

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
  RevEngModelTranslate, RevEngDiagramCreate, WSJavaParser15_TLB, WhiteStarUML_TLB,
  Classes, SysUtils;

type
  // enumerations
  PReverseStep = (rsBegin, rsParse, rsCreateUMLModel, rsReviseReference, rsCreateDiagram, rsUpdateBrowser, rsEnd, rsAbort, rsError);

  // events
  PReverseStepEvent = procedure(Sender: TObject; Step: PReverseStep) of object;
  PReverseProgressEvent = procedure(Sender: TObject; Percent: Integer) of object;
  PParseEvent = procedure(Sender: TObject; FileName: string; Index, Total: Integer; Success: Boolean = True) of object;

  // PJavaReverse
  PJavaReverse = class
  private
    Parser: IJavaParserObj;
    StarUMLApp: IStarUMLApplication;
    FSourceFiles: TStringList;
    FTopPackage: IUMLPackage;
    ModelTranslator: PModelTranslator;
    DiagramCreator: PDiagramCreator;
    Packages: TInterfaceList;
    // variables
    IsOnReverse: Boolean;
    // options
    FCreateOverviewDiagram: Boolean;
    // events
    FOnPassReverseStep: PReverseStepEvent;
    FOnProgress: PReverseProgressEvent;
    FOnParsingFile: PParseEvent;
    FOnParseFile: PParseEvent;
    FOnAddUMLElement: PUMLElementEvent;
    FOnAddUMLView: PUMLViewEvent;
    FOnCreateUMLDiagram: PUMLDiagramCreatingEvent;
    // property getter-setter
    function GetSourceFileCount: Integer;
    function GetSourceFile(Index: Integer): string;
    procedure SetTopPackage(Value: IUMLPackage);
    function GetTranslatePublicMember: Boolean;
    procedure SetTranslatePublicMember(Value: Boolean);
    function GetTranslatePackageMember: Boolean;
    procedure SetTranslatePackageMember(Value: Boolean);
    function GetTranslateProtectedMember: Boolean;
    procedure SetTranslateProtectedMember(Value: Boolean);
    function GetTranslatePrivateMember: Boolean;
    procedure SetTranslatePrivateMember(Value: Boolean);
    function GetRefAsAssociation: Boolean;
    procedure SetRefAsAssociation(Value: Boolean);
    procedure SetCreateOverviewDiagram(Value: Boolean);
    function GetEnlargeDiagram: Boolean;
    procedure SetEnlargeDiagram(Value: Boolean);
    function GetDiagramNameStr: string;
    procedure SetDiagramNameStr(Value: string);
    function GetSuppressAttributes: Boolean;
    procedure SetSuppressAttributes(Value: Boolean);
    function GetSuppressOperations: Boolean;
    procedure SetSuppressOperations(Value: Boolean);
    function GetShowOperationSignature: Boolean;
    procedure SetShowOperationSignature(Value: Boolean);
    function GetCreateOnlyInheritences: Boolean;
    procedure SetCreateOnlyInheritences(Value: Boolean);
    function GetOmitInitialValue: Boolean;
    procedure SetOmitInitialValue(Value: Boolean);
    function GetReverseJavaDoc: Boolean;
    procedure SetReverseJavaDoc(Value: Boolean);
    // event raising related methods
    procedure ReverseStepPassed(Step: PReverseStep);
    procedure ReverseProgressed(Step: PReverseStep; Percent: Integer);
    // event handlers
    procedure Handle1stStepTranslating(Sender: TObject);
    procedure Handle2ndStepTranslating(Sender: TObject);
    procedure HandleUMLElementAdded(Sender: TObject; Element: IUMLElement);
    procedure HandleJavaElementTranslated(Sender: TObject; Element: IJavaElement; Index, Total: Integer);
    procedure HandleTransItemTranslated(Sender: TObject; TranslateItem: PTranslateItem; Index, Total: Integer);
    procedure HandleTransMessage(Sender: TObject; Kind: InformationMessageKind; Text: string; ElementLink: IElement);
    procedure HandleUMLViewAdded(Sender: TObject; View: IView; Index, Total: Integer);
    procedure HandleUMLDiagramCreate(Sender: TObject; Diagram: IUMLDiagram; Index, Total: Integer);
    procedure HandleLog(Sender: TObject; Msg: string);
    // information
    procedure AddMessage(Kind: InformationMessageKind; Text: string; ElementLink: IElement);
    procedure Log(Text: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddSourceFile(FileName: string);
    procedure RemoveSourceFile(FileName: string);
    procedure DeleteSourceFile(Index: Integer);
    procedure Clear;
    procedure Reverse;
    procedure Abort;
    property SourceFileCount: Integer read GetSourceFileCount;
    property SourceFiles[Index: Integer]: string read GetSourceFile;
    property TopPackage: IUMLPackage read FTopPackage write SetTopPackage;
    // options
    property TranslatePublicMember: Boolean read GetTranslatePublicMember write SetTranslatePublicMember;
    property TranslatePackageMember: Boolean read GetTranslatePackageMember write SetTranslatePackageMember;
    property TranslateProtectedMember: Boolean read GetTranslateProtectedMember write SetTranslateProtectedMember;
    property TranslatePrivateMember: Boolean read GetTranslatePrivateMember write SetTranslatePrivateMember;
    property RefAsAssociation: Boolean read GetRefAsAssociation write SetRefAsAssociation;
    property CreateOverviewDiagram: Boolean read FCreateOverviewDiagram write SetCreateOverviewDiagram;
    property EnlargeDiagram: Boolean read GetEnlargeDiagram write SetEnlargeDiagram;
    property DiagramNameStr: string read GetDiagramNameStr write SetDiagramNameStr;
    property SuppressAttributes: Boolean read GetSuppressAttributes write SetSuppressAttributes;
    property SuppressOperations: Boolean read GetSuppressOperations write SetSuppressOperations;
    property ShowOperationSignature: Boolean read GetShowOperationSignature write SetShowOperationSignature; 
    property CreateOnlyInheritences: Boolean read GetCreateOnlyInheritences write SetCreateOnlyInheritences;
    property OmitInitialValue: Boolean read GetOmitInitialValue write SetOmitInitialValue;
    property ReverseJavaDoc: Boolean read GetReverseJavaDoc write SetReverseJavaDoc;
    // events
    property OnPassReverseStep: PReverseStepEvent read FOnPassReverseStep write FOnPassReverseStep;
    property OnProgress: PReverseProgressEvent read FOnProgress write FOnProgress;
    property OnParsingFile: PParseEvent read FOnParsingFile write FOnParsingFile;
    property OnParseFile: PParseEvent read FOnParseFile write FOnParseFile;
    property OnAddUMLElement: PUMLElementEvent read FOnAddUMLElement write FOnAddUMLElement;
    property OnAddUMLView: PUMLViewEvent read FOnAddUMLView write FOnAddUMLView;
    property OnCreateUMLDiagram: PUMLDiagramCreatingEvent read FOnCreateUMLDiagram write FOnCreateUMLDiagram;
  end;

implementation

uses
  Windows, Forms, Dialogs,
  RevEngWizardFrm, Symbols, NLS_JavaAddIn, JavaAddInObj;

/////////////////////////////////////////////////////////////////////////////
// PJavaReverse

constructor PJavaReverse.Create;
begin
  StarUMLApp := GetStarUMLApplication;
  Parser := CoJavaParserObj.Create;
  ModelTranslator := PModelTranslator.Create(Parser, StarUMLApp);
  DiagramCreator := PDiagramCreator.Create(StarUMLApp);
  FSourceFiles := TStringList.Create;
  Packages := TInterfaceList.Create;
  ModelTranslator.On1stStepTranslating := Handle1stStepTranslating;
  ModelTranslator.On2ndStepTranslating := Handle2ndStepTranslating;
  ModelTranslator.OnAddUMLElement := HandleUMLElementAdded;
  ModelTranslator.OnTranslateJavaElement := HandleJavaElementTranslated;
  ModelTranslator.OnTranslateTransItem := HandleTransItemTranslated;
  ModelTranslator.OnMessage := HandleTransMessage;
  ModelTranslator.OnLog := HandleLog;
  DiagramCreator.OnAddUMLView := HandleUMLViewAdded;
  DiagramCreator.OnCreateUMLDiagram := HandleUMLDiagramCreate;
end;

destructor PJavaReverse.Destroy;
begin
  Clear;
  FSourceFiles.Free;
  ModelTranslator.Free;
  DiagramCreator.Free;
  Packages.Free;
  StarUMLApp := nil;
  Parser := nil;
  inherited;
end;

function PJavaReverse.GetSourceFileCount: Integer;
begin
  Result := FSourceFiles.Count;
end;

function PJavaReverse.GetSourceFile(Index: Integer): string;
begin
  Result := FSourceFiles[Index];
end;

procedure PJavaReverse.SetTopPackage(Value: IUMLPackage);
begin
  FTopPackage := Value;
  ModelTranslator.TopPackage := Value;
end;

function PJavaReverse.GetTranslatePublicMember: Boolean;
begin
  Result := ModelTranslator.TranslatePublicMember;
end;

procedure PJavaReverse.SetTranslatePublicMember(Value: Boolean);
begin
  ModelTranslator.TranslatePublicMember := Value;
end;

function PJavaReverse.GetTranslatePackageMember: Boolean;
begin
  Result := ModelTranslator.TranslatePackageMember;
end;

procedure PJavaReverse.SetTranslatePackageMember(Value: Boolean);
begin
  ModelTranslator.TranslatePackageMember := Value;
end;

function PJavaReverse.GetTranslateProtectedMember: Boolean;
begin
  Result := ModelTranslator.TranslateProtectedMember;
end;

procedure PJavaReverse.SetTranslateProtectedMember(Value: Boolean);
begin
  ModelTranslator.TranslateProtectedMember := Value;
end;

function PJavaReverse.GetTranslatePrivateMember: Boolean;
begin
  Result := ModelTranslator.TranslatePrivateMember;
end;

procedure PJavaReverse.SetTranslatePrivateMember(Value: Boolean);
begin
  ModelTranslator.TranslatePrivateMember := Value;
end;

function PJavaReverse.GetRefAsAssociation: Boolean;
begin
  Result := ModelTranslator.RefAsAssociation;
end;

procedure PJavaReverse.SetRefAsAssociation(Value: Boolean);
begin
  ModelTranslator.RefAsAssociation := Value;
end;

procedure PJavaReverse.SetCreateOverviewDiagram(Value: Boolean);
begin
  FCreateOverviewDiagram := Value;
end;

function PJavaReverse.GetEnlargeDiagram: Boolean;
begin
  Result := DiagramCreator.EnlargeDiagram;
end;

procedure PJavaReverse.SetEnlargeDiagram(Value: Boolean);
begin
  DiagramCreator.EnlargeDiagram := Value;
end;

function PJavaReverse.GetDiagramNameStr: string;
begin
  Result := DiagramCreator.DiagramNameStr;
end;

procedure PJavaReverse.SetDiagramNameStr(Value: string);
begin
  DiagramCreator.DiagramNameStr := Value;
end;

function PJavaReverse.GetSuppressAttributes: Boolean;
begin
  Result := DiagramCreator.SuppressAttributes;
end;

procedure PJavaReverse.SetSuppressAttributes(Value: Boolean);
begin
  DiagramCreator.SuppressAttributes := Value;
end;

function PJavaReverse.GetSuppressOperations: Boolean;
begin
  Result := DiagramCreator.SuppressOperations;
end;

procedure PJavaReverse.SetSuppressOperations(Value: Boolean);
begin
  DiagramCreator.SuppressOperations := Value;
end;

function PJavaReverse.GetShowOperationSignature: Boolean;
begin
  Result := DiagramCreator.ShowOperationSignature;
end;

procedure PJavaReverse.SetShowOperationSignature(Value: Boolean);
begin
  DiagramCreator.ShowOperationSignature := Value;
end;

function PJavaReverse.GetCreateOnlyInheritences: Boolean;
begin
  Result := DiagramCreator.CreateOnlyInheritences;
end;

procedure PJavaReverse.SetCreateOnlyInheritences(Value: Boolean);
begin
  DiagramCreator.CreateOnlyInheritences := Value;
end;

function PJavaReverse.GetOmitInitialValue: Boolean;
begin
  Result := ModelTranslator.OmitInitialValue;
end;

procedure PJavaReverse.SetOmitInitialValue(Value: Boolean);
begin
  ModelTranslator.OmitInitialValue := Value;
end;

function PJavaReverse.GetReverseJavaDoc: Boolean;
begin
  Result := ModelTranslator.ReverseJavaDoc;
end;

procedure PJavaReverse.SetReverseJavaDoc(Value: Boolean);
begin
  ModelTranslator.ReverseJavaDoc := Value;
end;

procedure PJavaReverse.ReverseStepPassed(Step: PReverseStep);
begin
  if Assigned(FOnPassReverseStep) then
    FOnPassReverseStep(Self, Step);
end;

procedure PJavaReverse.ReverseProgressed(Step: PReverseStep; Percent: Integer);
begin
  if Assigned(FOnProgress) then
    FOnProgress(Self, Percent);
end;
{
// orogin
procedure PJavaReverse.ReverseProgressed(Step: PReverseStep; Percent: Integer);
const
  PC_PARSE = 45;
  PC_CREATE_MODEL = 20;
  PC_REVISE_REF = 20;
  PC_UPD_BROWSER = 5;
  PC_DIAGRAM = 10;
  PC_PARSE_NODGM = 50;
  PC_CREATE_MODEL_NODGM = 25;
  PC_REVISE_REF_NODGM = 20;
  PC_UPD_BROWSER_NODGM = 5;
var
  Pc: Integer;
begin
  if CreateOverviewDiagram then
    case Step of
      rsParse:
        Pc := Percent * PC_PARSE div 100;
      rsCreateUMLModel:
        Pc := Percent * PC_CREATE_MODEL div 100 + PC_PARSE;
      rsReviseReference:
        Pc := Percent * PC_REVISE_REF div 100 + PC_PARSE + PC_CREATE_MODEL;
      rsUpdateBrowser:
        Pc := PC_PARSE + PC_CREATE_MODEL + PC_REVISE_REF;
      rsCreateDiagram:
        Pc := Percent * PC_DIAGRAM div 100 + PC_PARSE + PC_CREATE_MODEL + PC_REVISE_REF + PC_UPD_BROWSER;
      else
        Pc := Percent;
    end
  else
    case Step of
      rsParse:
        Pc := Percent * PC_PARSE_NODGM div 100;
      rsCreateUMLModel:
        Pc := Percent * PC_CREATE_MODEL_NODGM div 100 + PC_PARSE_NODGM;
      rsReviseReference:
        Pc := Percent * PC_REVISE_REF_NODGM div 100 + PC_PARSE_NODGM + PC_CREATE_MODEL_NODGM;
      rsUpdateBrowser:
        Pc := 100;
      else
        Pc := Percent;
    end;
  if Assigned(FOnProgress) then
    FOnProgress(Self, Pc);
end;
}

procedure PJavaReverse.Handle1stStepTranslating(Sender: TObject);
begin
  ReverseStepPassed(rsCreateUMLModel);
end;

procedure PJavaReverse.Handle2ndStepTranslating(Sender: TObject);
begin
  ReverseStepPassed(rsReviseReference);
end;

procedure PJavaReverse.HandleUMLElementAdded(Sender: TObject; Element: IUMLElement);
begin
  if Element.IsKindOf(ELEM_PACKAGE) then
    Packages.Add(Element);
  if Assigned(FOnAddUMLElement) then
    FOnAddUMLElement(Self, Element);
end;

procedure PJavaReverse.HandleJavaElementTranslated(Sender: TObject; Element: IJavaElement; Index, Total: Integer);
begin
  ReverseProgressed(rsCreateUMLModel, Index * 100 div Total);
end;

procedure PJavaReverse.HandleTransItemTranslated(Sender: TObject; TranslateItem: PTranslateItem; Index, Total: Integer);
begin
  ReverseProgressed(rsReviseReference, Index * 100 div Total);
end;

procedure PJavaReverse.HandleTransMessage(Sender: TObject; Kind: InformationMessageKind; Text: string; ElementLink: IElement);
begin
  AddMessage(Kind, Text, ElementLink);
end;

procedure PJavaReverse.HandleUMLViewAdded(Sender: TObject; View: IView; Index, Total: Integer);
begin
  ReverseProgressed(rsCreateDiagram, Index * 100 div Total);
  if Assigned(FOnAddUMLView) then
    FOnAddUMLView(Self, View, Index, Total);
end;

procedure PJavaReverse.HandleUMLDiagramCreate(Sender: TObject; Diagram: IUMLDiagram; Index, Total: Integer);
begin
  if Assigned(FOnCreateUMLDiagram) then
    FOnCreateUMLDiagram(Self, Diagram, Index, Total);
end;

procedure PJavaReverse.HandleLog(Sender: TObject; Msg: string);
begin
  Log(Msg);
end;

procedure PJavaReverse.AddMessage(Kind: InformationMessageKind; Text: string; ElementLink: IElement);
begin
  StarUMLApp.AddMessageItem(Kind, Text, ElementLink);
end;

procedure PJavaReverse.Log(Text: string);
begin
  StarUMLApp.Log(Text);
end;

procedure PJavaReverse.AddSourceFile(FileName: string);
begin
  if FSourceFiles.IndexOf(FileName) = -1 then
    FSourceFiles.Add(FileName)
end;

procedure PJavaReverse.RemoveSourceFile(FileName: string);
var
  Index: Integer;
begin
  Index := FSourceFiles.IndexOf(FileName);
  if Index <> -1 then
    FSourceFiles.Delete(Index);
end;

procedure PJavaReverse.DeleteSourceFile(Index: Integer);
begin
  FSourceFiles.Delete(Index)
end;

procedure PJavaReverse.Clear;
begin
  FSourceFiles.Clear;
  Packages.Clear;
  Parser.Clear;
  DiagramCreator.Clear;
  ModelTranslator.Clear;
end;

procedure PJavaReverse.Reverse;
var
  I: Integer;
begin
  try
    IsOnReverse := True;
    try

      // 1. begin
      ReverseStepPassed(rsBegin);
      Log(Format(MSG_REVERSE_BEGIN, [SourceFileCount]));

      // 2. parse
      ReverseStepPassed(rsParse);
      for I := 0 to SourceFileCount - 1 do begin
        if IsOnReverse then begin
          if Assigned(FOnParsingFile) then
            FOnParsingFile(Self, SourceFiles[I], I + 1, SourceFileCount);
          if Parser.Parse(SourceFiles[I]) then begin
            if Assigned(FOnParseFile) then
              FOnParseFile(Self, SourceFiles[I], I + 1, SourceFileCount);
          end
          else begin
            Log(Format(ERR_PARSING_ERROR,
              [SourceFiles[I], Parser.ErrorDescription, Parser.ErrorLine, Parser.ErrorLinePos]));
            if Assigned(FOnParseFile) then
              FOnParseFile(Self, SourceFiles[I], I + 1, SourceFileCount, False);
          end;
          ReverseProgressed(rsParse, (I + 1) * 100 div SourceFileCount);
        end;
      end;

      // 3,4. translate
      if IsOnReverse then begin
        StarUMLApp.BeginUpdate;
        try
          ModelTranslator.Translate;
        finally
          ReverseStepPassed(rsUpdateBrowser);
          StarUMLApp.EndUpdate2(True, True);
          ReverseProgressed(rsUpdateBrowser, 100);
        end;
      end;

      // 5. create overview diagram
      if IsOnReverse and FCreateOverviewDiagram then begin
        ReverseStepPassed(rsCreateDiagram);
        if DiagramCreator.OverviewDiagramRequired(FTopPackage) then
          DiagramCreator.AddPackage(FTopPackage);
        for I := 0 to Packages.Count - 1 do
          if DiagramCreator.OverviewDiagramRequired(Packages[I] as IUMLPackage) then
            DiagramCreator.AddPackage(Packages[I] as IUMLPackage);
        DiagramCreator.CreateOverviewDiagrams;
      end;

      // 6. end
      if IsOnReverse then begin
        ReverseStepPassed(rsEnd);
        ReverseProgressed(rsEnd, 100);
        Log(MSG_REVERSE_FINISH);
      end
      else begin
        ReverseStepPassed(rsAbort);
        Log(MSG_REVERSE_CANCEL);
      end;

    except
      on E:Exception do begin
        Log(Format(ERR_REVERSE_ERROR, [E.Message]));
        ReverseStepPassed(rsError);
      end;
    end;
  finally
    Clear;
    IsOnReverse := False;
  end;
end;

procedure PJavaReverse.Abort;
begin
  IsOnReverse := False;
  ModelTranslator.Abort;
  DiagramCreator.Abort;
end;

// PJavaReverse
/////////////////////////////////////////////////////////////////////////////

end.
