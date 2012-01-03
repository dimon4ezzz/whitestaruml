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
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ShellCtrls, SelTreeFrame,
  Spin, ElTree, WhiteStarUML_TLB, ImgList, FlatPanel, JvWizard, JvExControls,
  JvComponent;

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
    OptionPageControl: TPageControl;
    OptionTabSheet: TTabSheet;
    CodingStyleGroupBox: TGroupBox;
    IndentSizeLabel: TLabel;
    UseSpaceCheckBox: TCheckBox;
    IndentSizeSpinEdit: TSpinEdit;
    BraceCheckBox: TCheckBox;
    CodeGenGroup: TGroupBox;
    HeaderExtLabel: TLabel;
    BodyExtLabel: TLabel;
    FileNameFormatLabel: TLabel;
    HeaderExtComboBox: TComboBox;
    BodyExtComboBox: TComboBox;
    HeaderDirEdit: TEdit;
    BodyDirEdit: TEdit;
    FileNameFormatComboBox: TComboBox;
    HeaderDirCheckBox: TCheckBox;
    BodyDirCheckBox: TCheckBox;
    CommentTabSheet: TTabSheet;
    HeaderCommentMemo: TMemo;
    HeaderCommentLabel: TLabel;
    DefaultIncludeLabel: TLabel;
    DefaultHeaderIncludeMemo: TMemo;
    CommentDescLabel: TLabel;
    BodyIncludeLabel: TLabel;
    DefaultBodyIncludeMemo: TMemo;
    CreateSubDirForNamespaceCheckBox: TCheckBox;
    CodeGenGroupBox: TGroupBox;
    PackageAsNamesapceCheckBox: TCheckBox;
    MemberOrderComboBox: TComboBox;
    MemberOrderLabel: TLabel;
    MsSpecificCheckBox: TCheckBox;
    ManagedCppCheckBox: TCheckBox;
    CommentFlatPanel: TFlatPanel;
    HeaderDescMemo: TMemo;
    NamingLabel: TLabel;
    NamingComboBox: TComboBox;
    GenerateCommentCheckBox: TCheckBox;
    { Event Handlers for CodeGenForm }
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    { Event Handlers for Wizard Pages }
    procedure WizardPageCancelButtonClick(Sender: TObject; var Stop: Boolean);
    { Event Handlers for SelectRootElemPage }
    procedure SelectRootElemPageEnterPage(Sender: TObject; const Page: TJvWizardCustomPage);
    procedure SelectRootElemPageNextButtonClick(Sender: TObject; var Stop: Boolean);
    { Event Handlers for SelectElemPage }
    procedure SelectElemPageEnterPage(Sender: TObject; const Page: TJvWizardCustomPage);
    procedure SelectAllButtonClick(Sender: TObject);
    procedure DeselectAllButtonClick(Sender: TObject);
    procedure SelectElemPageNextButtonClick(Sender: TObject; var Stop: Boolean);
    { Event Handlers for SelectTargetDirPage }
    procedure SelectTargetDirPageEnterPage(Sender: TObject; const Page: TJvWizardCustomPage);
    procedure SelectTargetDirPageNextButtonClick(Sender: TObject; var Stop: Boolean);
    procedure SelectTargetDirTreeViewClick(Sender: TObject);
    { Event Handlers for SetOptionPage }
    procedure SetOptionPageEnterPage(Sender: TObject; const Page: TJvWizardCustomPage);
    procedure HeaderDirCheckBoxClick(Sender: TObject);
    procedure BodyDirCheckBoxClick(Sender: TObject);
    procedure UseSpaceCheckBoxClick(Sender: TObject);
    procedure MsSpecificCheckBoxClick(Sender: TObject);
    procedure SetOptionPageNextButtonClick(Sender: TObject; var Stop: Boolean);
    { Event Handlers for ExecuteActionPage }
    procedure ExecuteActionPagePage(Sender: TObject);
    procedure ExecuteActionPageFinishButtonClick(Sender: TObject; var Stop: Boolean);
  private
    { Member Fields }
    FStarUMLApp: IStarUMLApplication;
    CodeGen: PCodeGenerator;

    { Getter/Setter }
    procedure SetStarUMLApp(Value: IStarUMLApplication);

    { Initialization and Finalization Methods }
    procedure Initialize;
    procedure Finalize;
    procedure BeforeShow;

    { Page Setting Methods }
    procedure SetupSelectRootElemTree(AProject: IUMLProject);
    procedure SetupSelectElemTree;
    procedure SetupCodeGenReportListView;

    { Option Related Methods }
    function GetOptionValueAsBoolean(OptionSchema, OptionItem: string): Boolean;
    function GetOptionValueAsString(OptionSchema, OptionItem: string): string;
    function GetOptionValueAsInteger(OptionSchema, OptionItem: string): Integer;
    procedure LoadDefaultOptions;
    procedure ApplyOptionToCodeGen;

    { Auxiliary Methods }
    function QuestionCancel: Boolean;
    procedure PropagateCheckState(Item: TElTreeItem);
    procedure Log(Msg: string);

    { Main Methods }
    procedure DoCodeGen;

    { Event Handlers }
    procedure HandleSelectRootElemTreeSelectedChange(Sender: TObject; Item: TElTreeItem);
    procedure HandleSelectElemTreeItemChecked(Sender: TObject);
    procedure HandleLog(Sender: TObject; Msg: string);
    procedure HandleGeneratingCode(Sender: TObject; Model: IUMLModelElement; Pos, Max: Integer);
    procedure HandleGenerateCode(Sender: TObject; Model: IUMLModelElement; Pos, Max: Integer; Success: Boolean);

    { UI Updating Methods }
    procedure UpdateUIStatesSelectRootElemPage;
    procedure UpdateUIStatesSelectElemPage;
    procedure UpdateUIStatesSelectTargetDirPage;
    procedure UpdateUIStatesSelectOptionPage;
  public
    { Properties }
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write SetStarUMLApp;
  end;

implementation

{$R *.dfm}

uses
  Symbols, Utility, NLS_CppAddIn, NLS;

////////////////////////////////////////////////////////////////////////////////
//  TCodeGenForm

{ Initialization and Finalization Methods }

procedure TCodeGenForm.Initialize;
begin
  CodeGen := PCodeGenerator.Create;
  CodeGen.OnLog := HandleLog;
  CodeGen.OnGeneratingCode := HandleGeneratingCode;
  CodeGen.OnGenerateCode := HandleGenerateCode;
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
    raise ENotInitialized.Create(ERR_DIALOG_NOT_INITIALIZED);
  SetupSelectRootElemTree(FStarUMLApp.GetProject);
end;

{ Getter/Setter }

procedure TCodeGenForm.SetStarUMLApp(Value: IStarUMLApplication);
begin
  FStarUMLApp := Value;
  CodeGen.StarUMLApp := Value;
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
  SelectElemFrame.Filter([ELEM_MODEL, ELEM_SUBSYSTEM, ELEM_PACKAGE, ELEM_CLASS,
    ELEM_INTERFACE, ELEM_ENUMERATION]);

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

procedure TCodeGenForm.LoadDefaultOptions;
begin
  HeaderExtComboBox.Text := GetOptionValueAsString(OPTION_SCHEMA_CPP, OPT_HEADER_FILE_EXT);
  BodyExtComboBox.Text := GetOptionValueAsString(OPTION_SCHEMA_CPP, OPT_BODY_FILE_EXT);
  HeaderDirEdit.Text := GetOptionValueAsString(OPTION_SCHEMA_CPP, OPT_HEADER_SUB_DIRECTORY);
  BodyDirEdit.Text := GetOptionValueAsString(OPTION_SCHEMA_CPP, OPT_BODY_SUB_DIRECTORY);
  HeaderDirCheckBox.Checked := (HeaderDirEdit.Text <> '');
  BodyDirCheckBox.Checked := (BodyDirEdit.Text <> '');
  FileNameFormatComboBox.ItemIndex := GetOptionValueAsInteger(OPTION_SCHEMA_CPP, OPT_FILE_NAME_FORMAT);
  CreateSubDirForNamespaceCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_NAMESPACE_AS_SUB_DIRECTORY);
  PackageAsNamesapceCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_PACKAGE_AS_NAMESPACE);
  MsSpecificCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_MS_SPECIFIC);
  ManagedCppCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_MANAGED_CPP);
  GenerateCommentCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_GENERATE_COMMENT);
  MemberOrderComboBox.ItemIndex := GetOptionValueAsInteger(OPTION_SCHEMA_CPP, OPT_MEMBER_ORDER);
  UseSpaceCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_USE_SPACE);
  IndentSizeSpinEdit.Value := GetOptionValueAsInteger(OPTION_SCHEMA_CPP, OPT_SPACE_MAGNITUDE);
  BraceCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_BRACE_PUT_NEWLINE);
  HeaderCommentMemo.Lines.Text := GetOptionValueAsString(OPTION_SCHEMA_CPP, OPT_HEADER_COMMENT);
  DefaultHeaderIncludeMemo.Lines.Text := GetOptionValueAsString(OPTION_SCHEMA_CPP, OPT_DEFAULT_HEADER_INCLUDE);
  DefaultBodyIncludeMemo.Lines.Text := GetOptionValueAsString(OPTION_SCHEMA_CPP, OPT_DEFAULT_BODY_INCLUDE);
//  OPT_CREATE_WITH_NO_PROFILE = 'CREATE_WITH_NO_PROFILE';
end;

procedure TCodeGenForm.ApplyOptionToCodeGen;

  function IntegerToFileNameFormat(Value: Integer): PFileNameFormat;
  begin
    case Value of
      0: Result := fkSameAsElementName;
      1: Result := fkLowerCase;
      2: Result := fkUpperCase;
      3: Result := fkLowerCaseAndUnderline;
      else Result := fkSameAsElementName;
    end;
  end;

  function IntegerToMemberOrderKind(Value: Integer): PMemberOrderKind;
  begin
    case Value of
      0: Result := okPublicFirst;
      1: Result := okPrivateFirst;
      2: Result := okNotOrder;
      else Result := okPublicFirst;
    end;
  end;

begin
  CodeGen.HeaderFileExt := HeaderExtComboBox.Text;
  CodeGen.BodyFileExt := BodyExtComboBox.Text;
  CodeGen.HeaderSubdir := HeaderDirEdit.Text;
  CodeGen.BodySubdir := BodyDirEdit.Text;
  CodeGen.FileNameFormat := IntegerToFileNameFormat(FileNameFormatComboBox.ItemIndex);
  CodeGen.PackageAsNamespace := PackageAsNamesapceCheckBox.Checked;
  CodeGen.CreateSubdirectoryForNamespace := CodeGen.PackageAsNamespace and CreateSubDirForNamespaceCheckBox.Checked;
  CodeGen.UseTab := not UseSpaceCheckBox.Checked;
  CodeGen.IdentationSize := IndentSizeSpinEdit.Value;
  CodeGen.BraceAtNewLine := BraceCheckBox.Checked;
  CodeGen.MsSpecific := MsSpecificCheckBox.Checked;
  CodeGen.CppNetSpecific := CodeGen.MsSpecific and ManagedCppCheckBox.Checked;
  CodeGen.GenerateComment := GenerateCommentCheckBox.Checked;
  CodeGen.OrderMember := IntegerToMemberOrderKind(MemberOrderComboBox.ItemIndex);
  CodeGen.HeaderComment := HeaderCommentMemo.Text;
  CodeGen.DefaultHeaderIncludes := DefaultHeaderIncludeMemo.Text;
  CodeGen.DefaultBodyIncludes := DefaultBodyIncludeMemo.Text;
end;

{ Auxiliary Methods }

function TCodeGenForm.QuestionCancel: Boolean;
begin
  Result := (Application.MessageBox(PChar(QUERY_CANCEL_CODE_GEN), PChar(Application.Title),
    MB_YESNO + MB_ICONQUESTION) = IDYES);
end;

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

{ Main Methods }

procedure TCodeGenForm.DoCodeGen;
begin
  ExecuteActionPage.EnabledButtons := ExecuteActionPage.EnabledButtons - [bkFinish];
  try
    try
      SetupCodeGenReportListView;
      Application.ProcessMessages;
      CodeGen.GenerateCode;
      CodeGenLabel.Caption := TXT_CODE_GEN_COMPLETE;
      MessageSubLabel.Caption := '';
      Application.MessageBox(PChar(MSG_DLG_CODE_GEN_COMPLETE), PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    except
      on E: Exception do begin
        CodeGenLabel.Caption := TXT_CODE_GEN_ERROR;
        MessageSubLabel.Caption := '';
        Application.MessageBox(PChar(Format(ERR_DLG_CODE_GEN_ERROR, [E.Message])), PChar(Application.Title), MB_ICONERROR + MB_OK);
      end;
    end;
  finally
    ExecuteActionPage.EnabledButtons := ExecuteActionPage.EnabledButtons + [bkFinish];
  end;
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
end;

procedure TCodeGenForm.HandleGeneratingCode(Sender: TObject; Model: IUMLModelElement; Pos, Max: Integer);
var
  Item: TListItem;
begin
  Assert(CodeGenReportListView.Items.Count = Max);
  Item := CodeGenReportListView.Items[Pos - 1];
  if Item <> nil then begin
    Item.ImageIndex := IMG_INDEX_ONGENERATING;
    Item.SubItems[1] := TXT_GENERATING;
    CodeGenReportListView.Selected := Item;
    CodeGenReportListView.ItemFocused := Item;
  end;
  CodeGenLabel.Caption := TXT_ON_GENERATING_CODE;
  MessageSubLabel.Caption := Format(TXT_ELEMENT_CODE_GENERATING, [Model.GetMetaClass.Name, Model.Name]);
  Application.ProcessMessages;
end;

procedure TCodeGenForm.HandleGenerateCode(Sender: TObject; Model: IUMLModelElement; Pos, Max: Integer; Success: Boolean);
var
  Item: TListItem;
begin
  Assert(CodeGenReportListView.Items.Count = Max);
  CodeGenProgressbar.Min := 0;
  CodeGenProgressbar.Max := Max;
  CodeGenProgressbar.Position := Pos;
  FileNumInfoLabel.Caption := Format('(%d / %d)', [Pos, Max]);
  Item := CodeGenReportListView.Items[Pos - 1];
  if Item <> nil then begin
    if Success then begin
      Item.ImageIndex := IMG_INDEX_COMPLETE;
      Item.SubItems[1] := TXT_COMPLETE;
    end
    else begin
      Item.ImageIndex := IMG_INDEX_ERROR;
      Item.SubItems[1] := TXT_ERROR;
    end;
    CodeGenReportListView.Selected := Item;
    CodeGenReportListView.ItemFocused := Item;
  end;
  CodeGenLabel.Caption := TXT_ON_GENERATING_CODE;
  MessageSubLabel.Caption := Format(TXT_ELEMENT_CODE_GENERATING, [Model.GetMetaClass.Name, Model.Name]);
  Application.ProcessMessages;
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
  HeaderDirEdit.Enabled := HeaderDirCheckBox.Checked;
  BodyDirEdit.Enabled := BodyDirCheckBox.Checked;
  IndentSizeLabel.Enabled := UseSpaceCheckBox.Checked;
  IndentSizeSpinEdit.Enabled := UseSpaceCheckBox.Checked;
  ManagedCppCheckBox.Enabled := MsSpecificCheckBox.Checked;
end;

{ Event Handlers for CodeGenForm }

procedure TCodeGenForm.FormCreate(Sender: TObject);
begin
  Initialize;
  NLSManager.SetFile(GetDllPath + '\' + NLS_FILE_NAME);
  NLSManager.TranslateComponent(Self, []);
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

procedure TCodeGenForm.WizardPageCancelButtonClick(Sender: TObject; var Stop: Boolean);
begin
  Stop := not QuestionCancel;
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
  for I := 0 to SelectElemFrame.SelectTree.Items.Count - 1 do begin
    Item := SelectElemFrame.SelectTree.Items.Item[I];
    if Item.Checked then begin
      Meta := Item.Data;
      if Meta.ModelElement.IsKindOf(ELEM_CLASS) or Meta.ModelElement.IsKindOf(ELEM_INTERFACE)
        or Meta.ModelElement.IsKindOf(ELEM_ENUMERATION) then
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
end;

{ Event Handlers for SetOptionPage }

procedure TCodeGenForm.SetOptionPageEnterPage(Sender: TObject; const Page: TJvWizardCustomPage);
begin
  LoadDefaultOptions;
  UpdateUIStatesSelectOptionPage;
end;

procedure TCodeGenForm.HeaderDirCheckBoxClick(Sender: TObject);
begin
  UpdateUIStatesSelectOptionPage;
end;

procedure TCodeGenForm.BodyDirCheckBoxClick(Sender: TObject);
begin
  UpdateUIStatesSelectOptionPage;
end;

procedure TCodeGenForm.UseSpaceCheckBoxClick(Sender: TObject);
begin
  UpdateUIStatesSelectOptionPage;
end;

procedure TCodeGenForm.MsSpecificCheckBoxClick(Sender: TObject);
begin
  UpdateUIStatesSelectOptionPage;
end;

procedure TCodeGenForm.SetOptionPageNextButtonClick(Sender: TObject; var Stop: Boolean);
begin
  ApplyOptionToCodeGen;
end;

{ Event Handlers for ExecuteActionPage }

procedure TCodeGenForm.ExecuteActionPagePage(Sender: TObject);
begin
  DoCodeGen;
end;

procedure TCodeGenForm.ExecuteActionPageFinishButtonClick(Sender: TObject; var Stop: Boolean);
begin
  Stop := True;
  Close;
end;

//  TCodeGenForm
////////////////////////////////////////////////////////////////////////////////

end.
