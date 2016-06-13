unit PatternAddInFrm;

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
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, TreeViewEx, JvWizard, ImgList,
  Generics.Collections, WhiteStarUML_TLB, PatternDef, JvExControls, JvComponent;

type
   // Forward declaration
  PPatternItemRowBase = class;
  //PPatternItemRow = class;
  PatternRowsList = TList<PPatternItemRowBase>;

  // Exception
  EInvalidParameterValue = class(Exception);

  // TPatternAddInForm
  TPatternAddInForm = class(TForm)
    PatternGenWizard: TJvWizard;
    SelectPatternPage: TJvWizardInteriorPage;
    DescriptionMemo: TMemo;
    PatternTreeView: TTreeView;
    PatternParameterPage: TJvWizardInteriorPage;
    CategoryImageList: TImageList;
    PatternResultPage: TJvWizardInteriorPage;
    BasePanel: TPanel;
    ResultInfoLabel: TLabel;
    DescriptionPanel: TPanel;
    PatternDescriptionLabel: TLabel;
    ParamDescLabel: TLabel;
    PatternMemoBasePanel: TPanel;
    ParameterDescriptionLabel: TLabel;
    PatternTreeLabel: TLabel;
    PatternHelpButton: TButton;
    TreeImage: TImageList;
    PatternNameLabel: TLabel;
    PatternMemo: TMemo;
    ResultInfoListView: TListView;
    PatternParamLabel: TLabel;
    ScriptDebugCheckBox: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PatternTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure PatternParameterPageNextButtonClick(Sender: TObject; var Stop: Boolean);
    procedure PatternResultPageFinishButtonClick(Sender: TObject; var Stop: Boolean);
    procedure SelectPatternPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure PatternTreeViewCollapsed(Sender: TObject; Node: TTreeNode);
    procedure PatternTreeViewExpanded(Sender: TObject; Node: TTreeNode);
    procedure PatternHelpButtonClick(Sender: TObject);
    procedure ScriptDebugCheckBoxClick(Sender: TObject);
  protected
    PatternRows: PatternRowsList;
    FPattern: PatternDef.PPattern;
    procedure BuildPatternTreeView;
    procedure BuildPatternInspectorView(PPN: PPatternNode); virtual; abstract;
    procedure ClearPatternRows;
    procedure ClearInspectorRows; virtual; abstract;
    procedure ApplyPattern;
    procedure ShowDescription(PID: PPattern);
    //function FindPatternRow(Row: TdxInspectorRow): PPatternItemRow;
    function AssignInspectorRowValues: Boolean;
    //function FindPatternRow<T>(Row: T): PPatternItemRow;
  public
    StarUMLApp: IStarUMLApplication;
    property PatternRef: PPattern read FPattern write FPattern;
  end;

  // PPatternItemRowBase
  PPatternItemRowBase = class
  protected
    procedure CreateInspectorRow; virtual; abstract;
    procedure DrawInspector; virtual; abstract;
    function FindExistElement(ElemName: string): IUMLElement;
  public
    procedure AssignParameterValue; virtual;
  end;


var
  PatternAddInForm: TPatternAddInForm;

implementation

uses
  ShellAPI, Symbols, NLS, NLS_PatternAddIn, PatternParamColEditForm;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// PPatternItemRowBase

function PPatternItemRowBase.FindExistElement(ElemName: string): IUMLElement;
var
  Dgm: IDiagram;
  DgmOwner: IModel;
begin
  Result := nil;
  if ElemName = '' then Exit;
  Dgm := PatternAddInForm.StarUMLApp.SelectionManager.ActiveDiagram;
  DgmOwner := Dgm.DiagramOwner;
  Result := DgmOwner.FindByName(ElemName) as IUMLElement;
end;

procedure PPatternItemRowBase.AssignParameterValue;
begin
  // nothing to to
end;

// PPatternItemRowBase
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TPatternAddInForm

procedure TPatternAddInForm.BuildPatternTreeView;

  function BuildTreeNodeRecurse(ATreeNode: TTreeNode; APatternFolder: PPatternFolder): TTreeNode;
  var
    I: Integer;
    TN, SubTN: TTreeNode;
    PN: PPatternNode;
  begin
    TN := PatternTreeView.Items.AddChild(ATreeNode, APatternFolder.Name);
    TN.Data := APatternFolder;
    TN.StateIndex := 3;

    if (APatternFolder.PatternNodeCount = 0) then
      StarUMLApp.Log(Format('Pattern AddIn: Pattern repository %s is empty',[APatternFolder.PathName]))
    else
      for I := 0 to APatternFolder.PatternNodeCount - 1 do
      begin
        PN := APatternFolder.PatternNodes[I];
        if PN is PPatternFolder then
        begin
          BuildTreeNodeRecurse(TN, PN as PPatternFolder);
        end
        else begin
          SubTN := PatternTreeView.Items.AddChild(TN, PN.Name);
          SubTN.Data := PN;
          SubTN.StateIndex := 5;
        end;
      end;

    Result := TN;
  end;
var
  RootTreeNode: TTreeNode;
begin
  PatternTreeView.Items.Clear;
  RootTreeNode := BuildTreeNodeRecurse(nil, PatternManager.PatternRepository);
  if Assigned(RootTreeNode) then // Expand top node
    RootTreeNode.Expand(False);
end;


procedure TPatternAddInForm.ClearPatternRows;
var
  PatternRow: PPatternItemRowBase;
begin
  for PatternRow in PatternRows do
    PatternRow.Free;
  ClearInspectorRows;
  PatternRows.Clear;
end;

procedure TPatternAddInForm.ApplyPattern;
begin
  try
    FPattern.ApplyPattern;
  except on E: Exception do
    Application.MessageBox(PChar(E.Message), PChar(Application.Title),
      MB_OK + MB_ICONERROR);
  end;
end;

procedure TPatternAddInForm.ShowDescription(PID: PPattern);
var
  Param: PPatternParameter;
  TI: TListItem;
  Str, Str2: string;
  I, J: Integer;
begin
  ResultInfoListView.Clear;

  PatternNameLabel.Caption := Format(TXT_PATTERN_NAME, [PID.Name]);
  for I := 0 to PID.PatternParameterCount - 1 do begin
    Str := '';
    Param := PID.Parameters[I];
    TI := ResultInfoListView.Items.Add;
    TI.Caption := Param.Caption;
    case Param.ParamType of
      ptInteger: Str := Str + Param.Value;
      ptBoolean: Str := Str + Param.Value;
      ptString: Str := Str + Param.Value;
      ptEnumeration: Str := Str + Param.Value;
      ptElement:
        begin
          if Param.ElementValueCount > 0 then
            Str := Str + Param.ElementValues[0].Name
          else
            Str := Str + Param.Value;
        end;
      ptElementList:
        begin
          Str2 := '';
          for J := 0 to Param.ElementValueCount - 1 do begin
            Str2 := Str2 + Param.ElementValues[J].Name;
            if J <> Param.ElementValueCount - 1 then Str2 := Str2 + ', ';
          end;
          if Param.Value <> '' then begin
            if Str2 <> '' then Str2 := Str2 + ', ' + Param.Value
            else Str2 := Param.Value;
          end;
          Str := Str + Str2;
        end;
    end;
    TI.SubItems.Add(Str);
  end;
end;

function TPatternAddInForm.AssignInspectorRowValues: Boolean;
var
  ItemRow: PPatternItemRowBase;
begin
  Result := False;
  try
    for ItemRow in PatternRows do
      ItemRow.AssignParameterValue;
    Result := True;
  except on E: EInvalidParameterValue do
    begin
      Application.MessageBox(PChar(E.Message), PChar(Application.Title),
                             MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TPatternAddInForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(GetDllPath + '\' + NLS_FILE_NAME);
  NLSManager.TranslateComponent(Self, []);
  PatternManager := PPatternManager.Create;
  PatternRows := PatternRowsList.Create;
end;

procedure TPatternAddInForm.FormDestroy(Sender: TObject);
begin
  ClearPatternRows;
  PatternRows.Free;
  PatternManager.StarUMLApp := nil;
  PatternManager.Free;
end;

procedure TPatternAddInForm.FormShow(Sender: TObject);
begin
  PatternManager.StarUMLApp := StarUMLApp;
  PatternManager.ScanPatternRepository(GetDllPath + '\');
  BuildPatternTreeView;
  PatternGenWizard.SelectFirstPage;
  SelectPatternPage.EnabledButtons := [bkHelp, bkCancel];
  SelectPatternPage.EnabledButtons := [bkCancel];
  PatternHelpButton.Enabled := False;
end;

procedure TPatternAddInForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PatternMemo.Clear;
  DescriptionMemo.Lines.Clear;
  ClearPatternRows;
end;

procedure TPatternAddInForm.PatternTreeViewChange(Sender: TObject; Node: TTreeNode);
var
  PN: PPatternNode;
  PT: PatternDef.PPattern;
begin
  PN := Node.Data;
  if PN is PatternDef.PPattern then begin
    PT := PN as PatternDef.PPattern;
    DescriptionMemo.Lines.Clear;
    PatternMemo.Clear;
    try
      PT.LoadPattern;

      DescriptionMemo.Lines.Add(PT.Description);
      // 스크롤되어 description이 다 보이지 않는 현상 방지
      DescriptionMemo.SelStart := 0;
      DescriptionMemo.SelLength := 0;
      SelectPatternPage.EnabledButtons := [bkHelp, bkNext, bkCancel];
      SelectPatternPage.EnabledButtons := [bkNext, bkCancel];
      PatternHelpButton.Enabled := True;
      BuildPatternInspectorView(PN);
      PatternRef := PT;
    except on E: Exception do
      begin
        SelectPatternPage.EnabledButtons := [bkHelp, bkCancel];
        PatternHelpButton.Enabled := False;
        Application.MessageBox(PChar(E.Message), PChar(Application.Title),
          MB_OK + MB_ICONERROR);
      end;
    end;
  end else begin
    DescriptionMemo.Lines.Clear;
    SelectPatternPage.EnabledButtons := [bkHelp, bkCancel];
    PatternHelpButton.Enabled := False;
  end;
end;

procedure TPatternAddInForm.PatternParameterPageNextButtonClick(
  Sender: TObject; var Stop: Boolean);
begin
  if AssignInspectorRowValues then ShowDescription(Self.FPattern)
  else Stop := True;
end;

procedure TPatternAddInForm.PatternResultPageFinishButtonClick(
  Sender: TObject; var Stop: Boolean);
begin
  ApplyPattern;
end;

procedure TPatternAddInForm.ScriptDebugCheckBoxClick(Sender: TObject);
begin
  PatternManager.SetScriptDebugging(ScriptDebugCheckBox.Checked);
end;

procedure TPatternAddInForm.SelectPatternPageCancelButtonClick(Sender: TObject; var Stop: Boolean);
begin
  Stop := not (Application.MessageBox(PChar(QUERY_CANCEL_APPLY_PATTERN), PChar(Application.Title),
          MB_YESNO + MB_ICONQUESTION) = IDYES);
end;

procedure TPatternAddInForm.PatternTreeViewCollapsed(Sender: TObject; Node: TTreeNode);
var
  PN: PPatternNode;
begin
  PN := Node.Data;
  if PN is PatternDef.PPatternFolder then Node.StateIndex := 3;
end;

procedure TPatternAddInForm.PatternTreeViewExpanded(Sender: TObject; Node: TTreeNode);
var
  PN: PPatternNode;
begin
  PN := Node.Data;
  if PN is PatternDef.PPatternFolder then Node.StateIndex := 4;
end;

procedure TPatternAddInForm.PatternHelpButtonClick(Sender: TObject);
var
  TN: TTreeNode;
  PN: PPatternNode;
  PT: PPattern;
  HelpFile: string;
begin
  TN := PatternTreeView.Selected;
  if TN = nil then Exit;

  PN := TN.Data;
  if PN is PPattern then begin
    PT := PN as PPattern;
    HelpFile := PT.FullPathName + PT.HelpFile;
    if not FileExists(HelpFile) then begin
      Application.MessageBox(PChar(ERR_HELPFILE_NOT_FOUND), PChar(Application.Title),
        MB_OK + MB_ICONERROR);
      Exit;
    end;

    try
      ShellExecute(0, 'open', PChar(HelpFile), nil, nil, SW_SHOW);
    except on E: Exception do
      Application.MessageBox(PChar(E.Message), PChar(Application.Title),
        MB_OK + MB_ICONERROR);
    end;
  end;
end;

{function TPatternAddInForm.FindPatternRow(Row: TdxInspectorRow): PPatternItemRow;
var
  PatternRowBase: PPatternItemRowBase;
  PatternRow: PPatternItemRow;
begin
  Result := nil;
  for PatternRowBase in PatternRows do begin
    PatternRow := PatternRowBase as PPatternItemRow;
    if PatternRow.InspectorRow = Row then
      Result := PatternRow;
  end;
end;}

// TPatternAddInForm
////////////////////////////////////////////////////////////////////////////////
///
end.

