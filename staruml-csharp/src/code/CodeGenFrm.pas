unit CodeGenFrm;

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
  CodeGenerator,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ShellCtrls, SelTreeFrame, JvWizard,
  Spin, ElTree, WhiteStarUML_TLB, ImgList, FlatPanel, JvExControls, JvComponent;

const
  ERR_FORM_NOT_INITIALIZED = 'Dialog is not initialized.';

type
  // Exceptions
  EFormNotInitialized = class(Exception);

  // TCodeGenForm
  TCodeGenForm = class(TForm)
    CodeGenWizard: TJvWizard;
    SelectRootElemPage: TJvWizardInteriorPage;
    SelectRootElemLabel: TLabel;
    SelectRootElemFrame: TSelectTreeFrame;
    SelectElemPage: TJvWizardInteriorPage;
    SelectElemLabel: TLabel;
    SelectElemFrame: TSelectTreeFrame;
    SelectAllButton: TButton;
    DeselectAllButton: TButton;
    SelectTargetDirPage: TJvWizardInteriorPage;
    SelectTargetLabel: TLabel;
    SelectTargetDirTreeView: TShellTreeView;
    SetOptionPage: TJvWizardInteriorPage;
    ExecuteActionPage: TJvWizardInteriorPage;
    CodeGenElemLabel: TLabel;
    FileNumInfoLabel: TLabel;
    CodeGenLabel: TLabel;
    Bevel1: TBevel;
    MessageSubLabel: TLabel;
    CodeGenReportListView: TListView;
    CodeGenProgressbar: TProgressBar;
    StateMarkImageList: TImageList;
    SelectTreeImageList: TImageList;
    GroupBox1: TGroupBox;
    NoNameAssocChkBox: TCheckBox;
    DocToDocChkBox: TCheckBox;
    NilDocChk: TCheckBox;
    MemberCreateChkBox: TCheckBox;
    CodingStyleGroupBox: TGroupBox;
    IndentSizeLabel: TLabel;
    TabSpaceChkBox: TCheckBox;
    SpaceCntSpinEdit: TSpinEdit;
    NewBraceChkBox: TCheckBox;
    HeaderCommentLabel: TLabel;
    HeaderCommentMemo: TMemo;
    CommentDescLabel: TLabel;
    CommentFlatPanel: TFlatPanel;
    HeaderDescMemo: TMemo;
    OutputFileFormatUtf8ChkBox: TCheckBox;
    { Event Handlers for CodeGenForm }
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    { Event Handlers for Wizard Pages }
    procedure SelectElemPageEnterPage(Sender: TObject; const Page: TJvWizardCustomPage);
    procedure SelectRootElemPageEnterPage(Sender: TObject; const Page: TJvWizardCustomPage);
    procedure SelectTargetDirPageEnterPage(Sender: TObject; const Page: TJvWizardCustomPage);
    { Event Handlers for SelectRootElemPage }
    procedure SelectRootElemPageNextButtonClick(Sender: TObject; var Stop: Boolean);
    { Event Handlers for SelectElemPage }
    procedure SelectAllButtonClick(Sender: TObject);
    procedure DeselectAllButtonClick(Sender: TObject);
    procedure SelectElemPageNextButtonClick(Sender: TObject; var Stop: Boolean);
    { Event Handlers for SelectTargetDirPage }
    procedure SelectTargetDirPageNextButtonClick(Sender: TObject; var Stop: Boolean);
    { Event Handlers for SelectTargetDirPage }
    procedure SelectTargetDirTreeViewClick(Sender: TObject);
    { Event Handlers for SetOptionPage }
    procedure SetOptionPageNextButtonClick(Sender: TObject; var Stop: Boolean);
    procedure DocToDocChkBoxClick(Sender: TObject);
    procedure TabSpaceChkBoxClick(Sender: TObject);
    procedure CodeGenWizardCancelButtonClick(Sender: TObject);
    { Event Handlers for CodeGen}
    procedure HandleGenerateCode(Sender: TObject; Model: IUMLModelElement; Idx, Total: Integer; AState: PCodeGenerateKind);
    procedure ExecuteActionPagePage(Sender: TObject);
    procedure CodeGenWizardFinishButtonClick(Sender: TObject);
    procedure SelectRootElemPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure SelectElemPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure SelectTargetDirPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure SetOptionPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure ExecuteActionPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
  private
    { Member Fields }
    FStarUMLApp: IStarUMLApplication;
    CodeGen: PCodeGenerator;
    IsCancel: Boolean;
    { Getter/Setter }
    procedure SetStarUMLApp(Value: IStarUMLApplication);
    { Initialization and Finalization Methods }
    procedure Initialize;
    procedure Finalize;
    procedure BeforeShow;
    { Page Setting Methods }
    procedure SetupSelectRootElemTree(AProject: IUMLProject);
    procedure SetupSelectElemTree;
    procedure SetupDefaultOptions;
    procedure SetupCodeGenReportListView;
    { Option Related Methods }
    function GetOptionValueAsBoolean(OptionSchema, OptionItem: string): Boolean;
    function GetOptionValueAsString(OptionSchema, OptionItem: string): string;
    function GetOptionValueAsInteger(OptionSchema, OptionItem: string): Integer;
    { Auxiliary Methods }
    procedure PropagateCheckState(Item: TElTreeItem);
    procedure Log(Msg: string);
    { Event Handlers }
    procedure HandleSelectRootElemTreeSelectedChange(Sender: TObject; Item: TElTreeItem);
    procedure HandleSelectElemTreeItemChecked(Sender: TObject);
    procedure HandleLog(Sender: TObject; Msg: string);
    { UI Updating Methods }
    procedure UpdateUIStatesSelectRootElemPage;
    procedure UpdateUIStatesSelectElemPage;
    procedure UpdateUIStatesSelectTargetDirPage;
    procedure UpdateUIStatesSelectOptionPage;
    procedure UpdateUIStatesExecuteActionPage;
    procedure SetupCodeGenOptions;
    function GetOutputFilePath(AClassifier: IUMLClassifier; IsHeader: Boolean): string;
    function QueryCancel: Boolean;
    procedure CheckCodeGenCancel;
  public
    { Properties }
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write SetStarUMLApp;
  end;

implementation

{$R *.dfm}

uses
  Symbols,Utility, NLS_CSharpAddIn, NLS;

////////////////////////////////////////////////////////////////////////////////
//  TCodeGenForm

{ Getter/Setter }

procedure TCodeGenForm.SetStarUMLApp(Value: IStarUMLApplication);
begin
  FStarUMLApp := Value;
  CodeGen.StarUMLApp := Value;
end;

{ Initialization and Finalization Methods }

procedure TCodeGenForm.Initialize;
begin
  CodeGen := PCodeGenerator.Create;
  CodeGen.OnLog := HandleLog;
  CodeGen.OnGenerateCode := HandleGenerateCode;
  CodeGen.IsCancel := False;
  IsCancel := False;
  FStarUMLApp := nil;
end;

procedure TCodeGenForm.Finalize;
begin
  CodeGen.Free;
  CodeGen := nil;
  FStarUMLApp := nil;
end;

procedure TCodeGenForm.BeforeShow;
begin
  if (FStarUMLApp = nil) or (FStarUMLApp.GetProject = nil) then
    raise EFormNotInitialized.Create(ERR_FORM_NOT_INITIALIZED);

  SetupSelectRootElemTree(FStarUMLApp.GetProject);
  SetupDefaultOptions;
end;

{ Page Setting Methods }

procedure TCodeGenForm.SetupSelectRootElemTree(AProject: IUMLProject);
var
  SelMgr: ISelectionManager;
  Elem: IModel;
begin
  SelectRootElemFrame.RootElement := AProject;
  SelectRootElemFrame.Images := SelectTreeImageList;
  SelectRootElemFrame.ShowRoot := False;
  SelectRootElemFrame.ShowCheckBox := False;
  SelectRootElemFrame.ShowRootCheckBox := False;
  SelectRootElemFrame.AllowSingleCheckBox := False;
  SelectRootElemFrame.OnTVItemSelectedChange := HandleSelectRootElemTreeSelectedChange;
  SelectRootElemFrame.Filter([ELEM_MODEL, ELEM_SUBSYSTEM, ELEM_PACKAGE]);
  SelectRootElemFrame.BuildTree;
  SelectRootElemFrame.SelectTree.FullExpand;

  SelMgr := FStarUMLApp.SelectionManager;
  if SelMgr.GetSelectedModelCount = 1 then
    Elem := SelMgr.GetSelectedModelAt(0)
  else
    Elem := AProject;

  SelectRootElemFrame.SelectTreeNode(Elem);
  if SelectRootElemFrame.SelectedItem = nil then begin
    if (not Elem.IsKindOf(ELEM_PROJECT)) and (Elem.IsKindOf(ELEM_MODEL_ELEMENT)) then begin
      Elem := (Elem as IUMLModelElement).Namespace;
      SelectRootElemFrame.SelectTreeNode(Elem);
    end;
  end;

  if SelectRootElemFrame.SelectedItem <> nil then
    SelectRootElemPage.EnabledButtons := [bkCancel, bkNext];
end;

procedure TCodeGenForm.SetupSelectElemTree;
var
  Node: TElTreeItem;
  Meta: PMetaTreeNode;
  SelMgr: ISelectionManager;
  I: Integer;
begin
  SelectElemFrame.Images := SelectTreeImageList;
  SelectElemFrame.ShowRoot := False;
  SelectElemFrame.ShowCheckBox := True;
  SelectElemFrame.ShowRootCheckBox := False;
  SelectElemFrame.AllowSingleCheckBox := False;
  SelectElemFrame.OnTVItemChecked := HandleSelectElemTreeItemChecked;
  SelectElemFrame.Filter([ELEM_MODEL, ELEM_SUBSYSTEM, ELEM_PACKAGE, ELEM_CLASS, ELEM_INTERFACE, ELEM_ENUMERATION]);

  SelectElemFrame.ClearAll;
  Node := SelectRootElemFrame.SelectedItem;
  if Node <> nil then begin
    Meta := Node.Data;
    if Meta <> nil then begin
      SelectElemFrame.RootElement := Meta.ModelElement;
      SelectElemFrame.BuildTree;
      SelMgr := StarUMLApp.SelectionManager;
      for I := 0 to SelMgr.GetSelectedModelCount - 1 do
        SelectElemFrame.SelectTreeNode(SelMgr.GetSelectedModelAt(I));
      if SelectElemFrame.CheckedItemCount <= 0 then
        SelectElemFrame.CheckAll;
      SelectElemFrame.SelectTree.FullExpand;
    end;
  end;
end;

procedure TCodeGenForm.SetupDefaultOptions;
begin
  MemberCreateChkBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_CREATE_FILE_MEMBER);
  NoNameAssocChkBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_CREATE_EMPTY_ASSOC_END);
  DocToDocChkBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_CREATE_CSHARP_DOC);
  NilDocChk.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_CREATE_CSHARP_DOC_EMPTY);
  NewBraceChkBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_BRACE_PUT_NEWLINE);
  TabSpaceChkBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_SPACE_INSTEAD_TAB);
  OutputFileFormatUtf8ChkBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_GENERATE_UTF8);
  SpaceCntSpinEdit.Value := GetOptionValueAsInteger(OPTION_SCHEMA, OPTION_SPACE_MAGNITUDE);
  HeaderCommentMemo.Lines.Text := GetOptionValueAsString(OPTION_SCHEMA, OPTION_HEADER_COMMENT);
end;

procedure TCodeGenForm.SetupCodeGenReportListView;
var
  Element: IUMLModelElement;
  L: TListItem;
  I: Integer;
begin
  CodeGenReportListView.Clear;
  for I := 0 to CodeGen.TargetElementCount - 1 do begin
    Element := CodeGen.TargetElements[I];
    L := CodeGenReportListView.Items.Add;
    L.Caption := Element.Name;
    L.SubItems.Add(Element.Pathname);
    L.SubItems.Add(TXT_WAITING);
    L.ImageIndex := IMG_INDEX_WAITING;
    Application.ProcessMessages;
  end;
end;

procedure TCodeGenForm.SetupCodeGenOptions;
var
  XListItem : TListItem;
  I : Integer;
  XUMLModelElement : IUMLModelElement;
begin
  CodeGen.NoProfile := GetOptionValueAsBoolean(OPTION_SCHEMA,OPTION_CREATE_WITH_NO_PROFILE);
  CodeGen.MemberByFile := MemberCreateChkBox.Checked;
  CodeGen.NoNameAssoc := NoNameAssocChkBox.Checked;
  CodeGen.DocToDoc := DocToDocChkBox.Checked;
  CodeGen.NilDoc := NilDocChk.Checked;
  CodeGen.BraceAtNewLine := NewBraceChkBox.Checked;
  CodeGen.TabToSpace := TabSpaceChkBox.Checked;
  CodeGen.GenerateUtf8 := OutputFileFormatUtf8ChkBox.Checked;
  CodeGen.SpaceCnt := SpaceCntSpinEdit.Value;
  CodeGen.HeaderComment := HeaderCommentMemo.Text;
end;

{ Option Related Methods }

function TCodeGenForm.GetOptionValueAsBoolean(OptionSchema, OptionItem: string): Boolean;
begin
  try
    Result := StarUMLApp.GetOptionValue(OptionSchema, OptionItem);
  except
    Result := False;
    Log(Format(ERR_INVALID_OPTION, [OptionSchema, OptionItem]));
  end;
end;

function TCodeGenForm.GetOptionValueAsString(OptionSchema, OptionItem: string): string;
begin
  try
    Result := StarUMLApp.GetOptionValue(OptionSchema, OptionItem);
  except
    Result := '';
    Log(Format(ERR_INVALID_OPTION, [OptionSchema, OptionItem]));
  end;
end;

function TCodeGenForm.GetOptionValueAsInteger(OptionSchema, OptionItem: string): Integer;
begin
  try
    Result := StarUMLApp.GetOptionValue(OptionSchema, OptionItem);
  except
    Result := 0;
    Log(Format(ERR_INVALID_OPTION, [OptionSchema, OptionItem]));
  end;
end;

{ Auxiliary Methods }

procedure TCodeGenForm.PropagateCheckState(Item: TElTreeItem);
begin
  if Item.HasChildren then begin
    if Item.Checked then
      SelectElemFrame.CheckAllChildren(Item)
    else
      SelectElemFrame.UnCheckAllChildren(Item);
  end;
  if Item.Parent <> nil then begin
    if Item.Checked then
      SelectElemFrame.CheckParentAuto(Item)
    else
      SelectElemFrame.UnCheckParentAuto(Item);
  end;
end;

procedure TCodeGenForm.Log(Msg: string);
begin
  StarUMLApp.Log(Msg);
end;

{ Event Handlers }

procedure TCodeGenForm.HandleSelectRootElemTreeSelectedChange(Sender: TObject; Item: TElTreeItem);
begin
  UpdateUIStatesSelectRootElemPage;
end;

procedure TCodeGenForm.HandleSelectElemTreeItemChecked(Sender: TObject);
var
  Item: TElTreeItem;
begin
  if (Sender <> nil) and (Sender is TElTreeItem) then begin
    Item := Sender as TElTreeItem;
    PropagateCheckState(Item);
  end;
  UpdateUIStatesSelectElemPage;
end;

procedure TCodeGenForm.HandleLog(Sender: TObject; Msg: string);
begin
  Log(Msg);
  CheckCodeGenCancel;
end;

{ UI Updating Methods }

procedure TCodeGenForm.UpdateUIStatesSelectRootElemPage;
begin
  if SelectRootElemFrame.SelectedItem = nil then
    SelectRootElemPage.EnabledButtons := SelectRootElemPage.EnabledButtons - [bkNext]
  else
    SelectRootElemPage.EnabledButtons := SelectRootElemPage.EnabledButtons + [bkNext];
end;

procedure TCodeGenForm.UpdateUIStatesSelectElemPage;
begin
  if SelectElemFrame.CheckedItemCount = 0 then
    SelectElemPage.EnabledButtons := SelectElemPage.EnabledButtons - [bkNext]
  else
    SelectElemPage.EnabledButtons := SelectElemPage.EnabledButtons + [bkNext];
end;

procedure TCodeGenForm.UpdateUIStatesSelectTargetDirPage;
var
  SelFolder: TShellFolder;
begin
  SelFolder := SelectTargetDirTreeView.SelectedFolder;
  // more consider ..
  if (SelFolder <> nil) and SelFolder.IsFolder and not (fpReadOnly in SelFolder.Properties) then
    SelectTargetDirPage.EnabledButtons := SelectTargetDirPage.EnabledButtons + [bkNext]
  else
    SelectTargetDirPage.EnabledButtons := SelectTargetDirPage.EnabledButtons - [bkNext];
end;

procedure TCodeGenForm.UpdateUIStatesSelectOptionPage;
begin
// write down code updating user interface state for SelectOptionPage
  NilDocChk.Enabled  := DocToDocChkBox.Checked;
  SpaceCntSpinEdit.Enabled:= TabSpaceChkBox.Checked;
end;

procedure TCodeGenForm.UpdateUIStatesExecuteActionPage;
begin
// write down code updating user interface state for ExecuteActionPage
end;

{ Event Handlers for CodeGenForm }

procedure TCodeGenForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(GetDllPath + '\' + NLS_FILE_NAME);
  NLSManager.TranslateComponent(Self, []);
  Initialize;
end;

procedure TCodeGenForm.FormDestroy(Sender: TObject);
begin
  Finalize;
end;

procedure TCodeGenForm.FormShow(Sender: TObject);
begin
  BeforeShow;
end;

{ Event Handlers for Wizard Pages }

procedure TCodeGenForm.SelectRootElemPageEnterPage(Sender: TObject; const Page: TJvWizardCustomPage);
begin
  UpdateUIStatesSelectRootElemPage;
end;

procedure TCodeGenForm.SelectElemPageEnterPage(Sender: TObject; const Page: TJvWizardCustomPage);
begin
  SetupSelectElemTree;
  UpdateUIStatesSelectElemPage;
end;

procedure TCodeGenForm.SelectTargetDirPageEnterPage(Sender: TObject; const Page: TJvWizardCustomPage);
begin
  UpdateUIStatesSelectTargetDirPage;
end;

{ Event Handlers for SelectRootElemPage }

procedure TCodeGenForm.SelectRootElemPageNextButtonClick(Sender: TObject; var Stop: Boolean);
var
  Node: TElTreeItem;
  Meta: PMetaTreeNode;
  Pkg: IUMLPackage;
begin
  Node := SelectRootElemFrame.SelectedItem;
  if Node <> nil then begin
    Meta := Node.Data;
    if Meta <> nil then begin
      Assert(Meta.ModelElement.QueryInterface(IUMLPackage, Pkg) = S_OK);
      CodeGen.BasePackageElement := Pkg;
    end;
  end;
end;

function TCodeGenForm.GetOutputFilePath(AClassifier: IUMLClassifier; IsHeader: Boolean): string;
var
  S: string;
begin
  S:= copy(AClassifier.Pathname,Pos(CodeGen.BasePackageElement.Pathname,AClassifier.Pathname) + Length(CodeGen.BasePackageElement.Pathname), Length(AClassifier.Pathname) - Length(CodeGen.BasePackageElement.Pathname));
  S := StringReplace(S, '::', '\', [rfReplaceAll]);
  S := CodeGen.BaseDirectory + S;
  S := S + CSHARP_FILE_EXT;
  Result := S;
  
  // (more) Namespace를 디렉토리로 생성 등 고려
end;

{ Event Handlers for SelectElemPage }

procedure TCodeGenForm.SelectAllButtonClick(Sender: TObject);
begin
  SelectElemFrame.CheckAll;
  UpdateUIStatesSelectElemPage;
end;

procedure TCodeGenForm.DeselectAllButtonClick(Sender: TObject);
begin
  SelectElemFrame.UncheckAll;
  UpdateUIStatesSelectElemPage;
end;

procedure TCodeGenForm.SelectElemPageNextButtonClick(Sender: TObject; var Stop: Boolean);
var
  Item: TElTreeItem;
  Meta: PMetaTreeNode;
  I: Integer;
begin
  CodeGen.ClearTargetElements;
  for I := 0 to SelectElemFrame.SelectTree.Items.Count - 1 do
  begin
    Item := SelectElemFrame.SelectTree.Items.Item[I];
    if Item.Checked then
    begin
      Meta := Item.Data;
      CodeGen.AddTargetElement(Meta.ModelElement);
    end;
  end;
end;

{ Event Handlers for SelectTargetDirPage }

procedure TCodeGenForm.SelectTargetDirTreeViewClick(Sender: TObject);
begin
  UpdateUIStatesSelectTargetDirPage;
end;

procedure TCodeGenForm.SelectTargetDirPageNextButtonClick(Sender: TObject; var Stop: Boolean);
begin
  CodeGen.BaseDirectory := SelectTargetDirTreeView.SelectedFolder.PathName;
  UpdateUIStatesSelectOptionPage;
end;

{ Event Handlers for SetOptionPage }

procedure TCodeGenForm.SetOptionPageNextButtonClick(Sender: TObject; var Stop: Boolean);
begin

end;

{ Event Handlers for SelectRunDirPage }

procedure TCodeGenForm.ExecuteActionPagePage(Sender: TObject);
begin
  ExecuteActionPage.EnabledButtons := ExecuteActionPage.EnabledButtons - [bkFinish];
  try
    try
      SetupCodeGenReportListView;
      SetupCodeGenOptions;
      Application.ProcessMessages;
      CodeGen.GenerateCode;
      CodeGenLabel.Caption := TXT_CODE_GEN_COMPLETE;
      MessageSubLabel.Caption := '';
      Application.MessageBox(PChar(MSG_DLG_CODE_GEN_COMPLETE), PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    except
      on E: Exception do begin
        CodeGenLabel.Caption := TXT_CODE_GEN_ERROR;
        MessageSubLabel.Caption := '';
        Application.MessageBox(PChar(Format(MSG_DLG_CODE_GEN_COMPLETE, [E.Message])), PChar(Application.Title), MB_ICONERROR + MB_OK);
      end;
    end;
  finally
    ExecuteActionPage.EnabledButtons := ExecuteActionPage.EnabledButtons + [bkFinish];
  end;
end;

procedure TCodeGenForm.DocToDocChkBoxClick(Sender: TObject);
begin
  UpdateUIStatesSelectOptionPage;
end;

procedure TCodeGenForm.TabSpaceChkBoxClick(Sender: TObject);
begin
  UpdateUIStatesSelectOptionPage;
end;

procedure TCodeGenForm.CodeGenWizardCancelButtonClick(Sender: TObject);
begin
  Self.Close;
end;

{ Event Handlers for CodeGen}

procedure TCodeGenForm.HandleGenerateCode(Sender: TObject; Model: IUMLModelElement; Idx, Total: Integer; AState: PCodeGenerateKind);
var
  Item: TListItem;
begin
  CheckCodeGenCancel;
  Assert(CodeGenReportListView.Items.Count = Total);
  CodeGenProgressbar.Min := 0;
  CodeGenProgressbar.Max := Total;
  CodeGenProgressbar.Position := Idx;
  FileNumInfoLabel.Caption := Format('(%d / %d)', [Idx, Total]);

  Item := CodeGenReportListView.Items[Idx - 1];
  if (Item <> nil) then
  begin
    if AState = cgkClose then
    begin
      Item.ImageIndex := IMG_INDEX_COMPLETE;
      Item.SubItems[1] := TXT_COMPLETE;
    end
    else if AState = cgkError then
    begin
      Item.ImageIndex := IMG_INDEX_ERROR;
      Item.SubItems[1] := TXT_FAIL;
    end;
    CodeGenReportListView.Selected := Item;
    CodeGenReportListView.ItemFocused := Item;
  end;
  CodeGenLabel.Caption := TXT_ON_GENERATING_CODE;
  MessageSubLabel.Caption := Format(TXT_ELEMENT_CODE_GENERATING, [Model.GetMetaClass.Name, Model.Name]);
  Application.ProcessMessages;
end;

procedure TCodeGenForm.CodeGenWizardFinishButtonClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TCodeGenForm.CheckCodeGenCancel;
begin
  CodeGen.IsCancel := IsCancel;
end;

function TCodeGenForm.QueryCancel: Boolean;
begin
  Result := (Application.MessageBox(PChar(QUERY_CANCEL_CODE_GEN), PChar(Application.Title),
    MB_YESNO + MB_ICONQUESTION) = IDYES);
end;

procedure TCodeGenForm.SelectRootElemPageCancelButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  IsCancel := QueryCancel;
  Stop := Not IsCancel;
end;

procedure TCodeGenForm.SelectElemPageCancelButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  IsCancel := QueryCancel;
  Stop := Not IsCancel;
end;

procedure TCodeGenForm.SelectTargetDirPageCancelButtonClick(
  Sender: TObject; var Stop: Boolean);
begin
  IsCancel := QueryCancel;
  Stop := Not IsCancel;
end;

procedure TCodeGenForm.SetOptionPageCancelButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  IsCancel := QueryCancel;
  Stop := Not IsCancel;
end;

procedure TCodeGenForm.ExecuteActionPageCancelButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  IsCancel := QueryCancel;
  Stop := Not IsCancel;
end;

//  TCodeGenForm
////////////////////////////////////////////////////////////////////////////////


end.
