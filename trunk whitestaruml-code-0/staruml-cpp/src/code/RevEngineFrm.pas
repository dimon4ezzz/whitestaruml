unit RevEngineFrm;

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
  RevEngine, Symbols, CppElements, ModelTranslator,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, SelTreeFrame, ShellCtrls,
  ImgList, WhiteStarUML_TLB, ElTree, JvWizard, JvExControls, JvComponent;

type
  // TRevEngineForm
  TRevEngineForm = class(TForm)
    RevWizard: TJvWizard;
    SourceFileSelectionPage: TJvWizardInteriorPage;
    SourceFileListLabel: TLabel;
    AddButton: TButton;
    RemoveButton: TButton;
    ShellTreeView: TShellTreeView;
    SourceFileListView: TListView;
    AddAllButton: TButton;
    PackageSelectionPage: TJvWizardInteriorPage;
    SelectTreeFrame: TSelectTreeFrame;
    SetupOptionPage: TJvWizardInteriorPage;
    DiagramGroupBox: TGroupBox;
    DiagramNameLabel: TLabel;
    DiagramNameExLabel: TLabel;
    OverviewCheckBox: TCheckBox;
    DiagramNameEdit: TEdit;
    ModelGroupBox: TGroupBox;
    VisibilityLabel: TLabel;
    VisbilityBevel: TBevel;
    OmitInitialValueCheckBox: TCheckBox;
    PublicMemberCheckBox: TCheckBox;
    ProtectedMemberCheckBox: TCheckBox;
    PrivateMemberCheckBox: TCheckBox;
    ViewGroupBox: TGroupBox;
    OnlyInheritanceCheckBox: TCheckBox;
    SuppressAttrCheckBox: TCheckBox;
    SuppressOperCheckBox: TCheckBox;
    HideOperationSignatureCheckBox: TCheckBox;
    RefFieldGroupBox: TGroupBox;
    FieldAsAssocRadioButton: TRadioButton;
    FieldAsAttrRadioButton: TRadioButton;
    RunPage: TJvWizardInteriorPage;
    MessageLabel: TLabel;
    SourceFileLabel: TLabel;
    FileNumInfoLabel: TLabel;
    MessageSubLabel: TLabel;
    Bevel1: TBevel;
    ReverseProgressbar: TProgressBar;
    ReverseReportListView: TListView;
    DirectoryLabel: TLabel;
    CurDirLabel: TLabel;
    ProjectStructLabel: TLabel;
    StateMarkImageList: TImageList;
    SelectTreeImageList: TImageList;
    ShellListView: TShellListView;
    { Event Handlers for RevEngineForm }
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    { Event Handlers for SourceFileSelectionPage }
    procedure ShellTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure ShellTreeViewEnter(Sender: TObject);
    procedure ShellListViewAddFolder(Sender: TObject;
      AFolder: TShellFolder; var CanAdd: Boolean);
    procedure ShellListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ShellListViewDblClick(Sender: TObject);
    procedure ShellListViewEnter(Sender: TObject);
    procedure ShellListViewKeyPress(Sender: TObject; var Key: Char);
    procedure SourceFileListViewDblClick(Sender: TObject);
    procedure SourceFileListViewEnter(Sender: TObject);
    procedure SourceFileListViewKeyPress(Sender: TObject; var Key: Char);
    procedure SourceFileListViewSelectItem(Sender: TObject;
      Item: TListItem; Selected: Boolean);
    procedure AddButtonClick(Sender: TObject);
    procedure RemoveButtonClick(Sender: TObject);
    procedure AddAllButtonClick(Sender: TObject);
    { Event Handlers for SourceFileSelectionPage }
    procedure PackageSelectionPageEnterPage(Sender: TObject;
      const Page: TJvWizardCustomPage);
    procedure RunPagePage(Sender: TObject);
    procedure RunPageFinishButtonClick(Sender: TObject; var Stop: Boolean);
    procedure OverviewCheckBoxClick(Sender: TObject);
    procedure SetupOptionPageEnterPage(Sender: TObject;
      const Page: TJvWizardCustomPage);
    procedure SourceFileSelectionPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure PackageSelectionPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure SetupOptionPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
  private
		{ Member Fields }
    RevEngine: PRevEngine;
    FStarUMLApp: IStarUMLApplication;
    { Internal Variables }
    IsOnAddFiles: Boolean;
    IsOnReverse: Boolean;
    { Getter/Setter }
    procedure SetStarUMLApp(Value: IStarUMLApplication);
    { Initialization and Finalization Methods }
    procedure Initialize;
    procedure BeforeShow;
    procedure Finalize;
    { Source File Selection Related Methods }
    function SourceFileIncluded(FilePath: string): Boolean;
    procedure AddFile(FilePath: string);
    procedure AddFiles;
    procedure AddFilesRecursive(Directory: string);
    procedure RemoveFiles;
    { Package Selection Related Methods }
    procedure HandleTVItemSelectedChanged(Sender: TObject; Item: TElTreeItem);
    { Option Seting Related Methods }
    function GetOptionValueAsBoolean(OptionSchema, OptionItem: string): Boolean;
    function GetOptionValueAsString(OptionSchema, OptionItem: string): string;
    function GetOptionValueAsInteger(OptionSchema, OptionItem: string): Integer;
    procedure LoadOptions;
    procedure ApplyOptions;
    { Running Related Methods }
    procedure SetupReverseReportListView;
    procedure Progress(Position, Total: Integer);
    procedure DoReverse;
    procedure Abort;
    { Event Handlers }
    procedure HandleParsing(Sender: TObject; Index, Total: Integer; SourceFileName: string);
    procedure HandleParsed(Sender: TObject; Index, Total: Integer; SourceFileName: string);
    procedure HandleParseError(Sender: TObject; Index, Total: Integer; SourceFileName: string);
    procedure HandleTranslateCppElement(Sender: TObject; CppElement: PCppElement; Index, Total: Integer);
    procedure HandleTranslateItem(Sender: TObject; Item: PTranslateItem; Index, Total: Integer);
    procedure HandleAddUMLElement(Sender: TObject; Element: IUMLElement);
    procedure HandleCreateView(Sender: TObject; View: IView; Index, Total: Integer);
    procedure HandleCreateDiagram(Sender: TObject; Diagram: IDiagram; Index, Total: Integer);
    procedure HandleStepReverse(Sender: TObject; Step: PReverseStep; Parameters: array of const);
    procedure HandleLog(Sender: TObject; Msg: string);
    { UI Upating Methods }
    procedure UpdateUIStatesSourceFileSelectionPage;
    procedure UpdateUIStatesPackageSelectionPage;
    procedure UpdateUIStatesSetupOptionPage;
    { Auxiliary Methods }
    procedure InformMessage(Msg: string);
    procedure ErrorMessage(Msg: string);
    function QueryCancel: Boolean;
    procedure Log(Msg: string);
  public
		{ Properties }
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write SetStarUMLApp;
  end;

implementation

{$R *.dfm}

uses
  Utility, NLS_CppAddIn, NLS;

const
  IDX_FILENAME = 0;
  IDX_FILEPATH = 1;
  HEADER_FILE_EXTS: array[0..3] of string = ('.h', '.hh', '.hpp', '.hxx');
  HEADER_FILE_FILTERS: array[0..3] of string = ('*.h', '*.hh', '*.hpp', '*.hxx');

////////////////////////////////////////////////////////////////////////////////
//  TRevEngineForm

{ Initialization and Finalization Methods }

procedure TRevEngineForm.Initialize;
begin
  RevEngine := PRevEngine.Create;
  RevEngine.OnParsing := HandleParsing;
  RevEngine.OnParsed := HandleParsed;
  RevEngine.OnParseError := HandleParseError;
  RevEngine.OnTranslateCppElement := HandleTranslateCppElement;
  RevEngine.OnTranslateItem := HandleTranslateItem;
  RevEngine.OnAddUMLElement := HandleAddUMLElement;
  RevEngine.OnCreateView := HandleCreateView;
  RevEngine.OnCreateDiagram := HandleCreateDiagram;
  RevEngine.OnStepReverse := HandleStepReverse;
  RevEngine.OnLog := HandleLog;
  FStarUMLApp := nil;
end;

procedure TRevEngineForm.BeforeShow;
begin
  if FStarUMLApp = nil then
    raise ENotInitialized.Create(ERR_DIALOG_NOT_INITIALIZED);
  SelectTreeFrame.Images := SelectTreeImageList;
  SelectTreeFrame.ShowRoot := True;
  SelectTreeFrame.OnTVItemSelectedChange := HandleTVItemSelectedChanged;
  SelectTreeFrame.RootElement := StarUMLApp.GetProject;
  SelectTreeFrame.Filter([ELEM_PACKAGE, ELEM_SUBSYSTEM, ELEM_MODEL]);
  SelectTreeFrame.AddSelectableModel([ELEM_PACKAGE, ELEM_SUBSYSTEM, ELEM_MODEL]);
  SelectTreeFrame.BuildTree;
  LoadOptions;  
end;

procedure TRevEngineForm.Finalize;
begin
  RevEngine.Free;
  RevEngine := nil;
  FStarUMLApp := nil;
end;

{ Getter/Setter }

procedure TRevEngineForm.SetStarUMLApp(Value: IStarUMLApplication);
begin
  FStarUMLApp := Value;
  RevEngine.StarUMLApp := Value;
end;

{ Source File Selection Related Methods }

function TRevEngineForm.SourceFileIncluded(FilePath: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to SourceFileListView.Items.Count - 1 do
    if SourceFileListView.Items[I].SubItems[IDX_FILEPATH] = FilePath then begin
      Result := True;
      Exit;
    end;
end;

procedure TRevEngineForm.AddFile(FilePath: string);
var
  L: TListItem;
begin
  if not SourceFileIncluded(FilePath) then begin
    L := SourceFileListView.Items.Add;
    L.Caption := ExtractFileName(FilePath);
    L.SubItems.Add(ExtractFileDir(FilePath));
    L.SubItems.Add(FilePath);
  end;
end;

procedure TRevEngineForm.AddFiles;
var
  I: Integer;
begin
  for I := 0 to ShellListView.Items.Count - 1 do begin
    if not IsOnAddFiles then Exit;
    if ShellListView.Items[I].Selected then begin
      AddFile(ShellListView.SelectedFolder.PathName);
      ShellListView.Items[I].Selected := False;
    end;
  end;
end;

procedure TRevEngineForm.AddFilesRecursive(Directory: string);

  procedure AppendFilesWithExt(Dir: string; FileFilter: string);
  var
    F: TSearchRec;
  begin
    if FindFirst(Dir + '\' + FileFilter, faArchive, F) = 0 then begin
      AddFile(Dir + '\' + F.Name);
      while FindNext(F) = 0 do
        AddFile(Directory + '\' + F.Name);
      FindClose(F);
    end;
  end;

var
  F: TSearchRec;
  I: Integer;
begin
  if not IsOnAddFiles then Exit;
  for I := 0 to Length(HEADER_FILE_FILTERS) - 1 do
    AppendFilesWithExt(Directory, HEADER_FILE_FILTERS[I]);
  Application.ProcessMessages;
  if FindFirst(Directory + '\*', faDirectory, F) = 0 then begin
    if (F.Name <> '.') and (F.Name <> '..') then
      AddFilesRecursive(Directory + '\' + F.Name);
    while FindNext(F) = 0 do
      if (F.Name <> '.') and (F.Name <> '..') then
        AddFilesRecursive(Directory + '\' + F.Name);
    FindClose(F);
  end;
end;

procedure TRevEngineForm.RemoveFiles;
begin
  SourceFileListView.DeleteSelected;
end;

{ Package Selection Related Methods }

procedure TRevEngineForm.HandleTVItemSelectedChanged(Sender: TObject; Item: TElTreeItem);
begin
  UpdateUIStatesPackageSelectionPage;
end;

function TRevEngineForm.GetOptionValueAsBoolean(OptionSchema, OptionItem: string): Boolean;
begin
  try
    Result := FStarUMLApp.GetOptionValue(OptionSchema, OptionItem);
  except
    Result := False;
    Log(Format(ERR_INVALID_OPTION, [OptionSchema, OptionItem]));
  end;
end;

function TRevEngineForm.GetOptionValueAsString(OptionSchema, OptionItem: string): string;
begin
  try
    Result := FStarUMLApp.GetOptionValue(OptionSchema, OptionItem);
  except
    Result := '';
    Log(Format(ERR_INVALID_OPTION, [OptionSchema, OptionItem]));
  end;
end;

function TRevEngineForm.GetOptionValueAsInteger(OptionSchema, OptionItem: string): Integer;
begin
  try
    Result := FStarUMLApp.GetOptionValue(OptionSchema, OptionItem);
  except
    Result := 0;
    Log(Format(ERR_INVALID_OPTION, [OptionSchema, OptionItem]));
  end;
end;

procedure TRevEngineForm.LoadOptions;
begin
  PublicMemberCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_CREATE_PUBLIC_MEMBER);
  ProtectedMemberCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_CREATE_PROTECTED_MEMBER);
  PrivateMemberCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_CREATE_PRIVATE_MEMBER);
  FieldAsAssocRadioButton.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_FIELD_AS_ASSOC);
  OmitInitialValueCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_OMIT_INITIAL_VALUE);
  DiagramNameEdit.Text := GetOptionValueAsString(OPTION_SCHEMA_CPP, OPT_DIGRAM_NAME);
  SuppressAttrCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_SUPRESS_ATTR);
  SuppressOperCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_SUPRESS_OPER);
  HideOperationSignatureCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_HIDE_OPER_SIGNATURE);
  OnlyInheritanceCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_INHERITANCE_ONLY);
  OverviewCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA_CPP, OPT_CREATE_OVERVIEW);
end;

procedure TRevEngineForm.ApplyOptions;
begin
  RevEngine.TranslatePublicMember := PublicMemberCheckBox.Checked;
  RevEngine.TranslateProtectedMember := ProtectedMemberCheckBox.Checked;
  RevEngine.TranslatePrivateMember := PrivateMemberCheckBox.Checked;
  RevEngine.RefAsAssociation := FieldAsAssocRadioButton.Checked;
  RevEngine.OmitInitialValue := OmitInitialValueCheckBox.Checked;
  RevEngine.DiagramNameStr := DiagramNameEdit.Text;
  RevEngine.SuppressAttributes := SuppressAttrCheckBox.Checked;
  RevEngine.SuppressOperations := SuppressOperCheckBox.Checked;
  RevEngine.HideOperationSignature := HideOperationSignatureCheckBox.Checked;
  RevEngine.CreateOnlyInheritences := OnlyInheritanceCheckBox.Checked;
  RevEngine.CreateOverviewDiagram := OverviewCheckBox.Checked;
end;

procedure TRevEngineForm.SetupReverseReportListView;
var
  L: TListItem;
  I: Integer;
begin
  ReverseReportListView.Clear;
  for I := 0 to RevEngine.SourceFileCount - 1 do begin
    L := ReverseReportListView.Items.Add;
    L.Caption := ExtractFileName(RevEngine.SourceFiles[I]);
    L.SubItems.Add(ExtractFileDir(RevEngine.SourceFiles[I]));
    L.SubItems.Add(TXT_WAITING);
    L.SubItems.Add(RevEngine.SourceFiles[I]);
    L.ImageIndex := IMG_INDEX_WAITING;
    Application.ProcessMessages;
  end;
end;

procedure TRevEngineForm.Progress(Position, Total: Integer);
begin
  ReverseProgressbar.Max := Total;
  ReverseProgressbar.Position := Position;
  Application.ProcessMessages;
end;

procedure TRevEngineForm.DoReverse;
var
  I: Integer;
begin
  for I := 0 to SourceFileListView.Items.Count - 1 do begin
    RevEngine.AddSourceFile(SourceFileListView.Items[I].SubItems[1]);
    Application.ProcessMessages;
  end;
  Assert(PMetaTreeNode(SelectTreeFrame.SelectedItem.Data).ModelElement.IsKindOf('UMLPackage'));
  RevEngine.TopPackage := PMetaTreeNode(SelectTreeFrame.SelectedItem.Data).ModelElement as IUMLPackage;
  SetupReverseReportListView;
  ApplyOptions;
  RevEngine.Reverse;
end;

procedure TRevEngineForm.Abort;
begin
  RevEngine.Abort;
end;

{ Event Handlers }

procedure TRevEngineForm.HandleParsing(Sender: TObject; Index, Total: Integer; SourceFileName: string);
var
  L: TListItem;
begin
  Assert((Index >= 1) and (Index <= ReverseReportListView.Items.Count));
  L := ReverseReportListView.Items[Index - 1];
  L.ImageIndex := IMG_INDEX_ONPARSING;
  L.Selected := True;
  L.Focused := True;
  L.MakeVisible(False);
  L.SubItems[1] := TXT_ANALYZING;
  MessageSubLabel.Caption := SourceFileName;
  FileNumInfoLabel.Caption := Format('( %d / %d )', [Index, Total]);
  Application.ProcessMessages;
end;

procedure TRevEngineForm.HandleParsed(Sender: TObject; Index, Total: Integer; SourceFileName: string);
var
  L: TListItem;
begin
  Assert((Index >= 1) and (Index <= ReverseReportListView.Items.Count));
  L := ReverseReportListView.Items[Index - 1];
  L.ImageIndex := IMG_INDEX_COMPLETE;
  L.SubItems[1] := TXT_ANALYZED;
  Progress(Index, Total);
end;

procedure TRevEngineForm.HandleParseError(Sender: TObject; Index, Total: Integer; SourceFileName: string);
var
  L: TListItem;
begin
  Assert((Index >= 1) and (Index <= ReverseReportListView.Items.Count));
  L := ReverseReportListView.Items[Index - 1];
  L.ImageIndex := IMG_INDEX_ERROR;
  L.SubItems[1] := TXT_ANALYSIS_FAILED;
  Progress(Index, Total);
end;

procedure TRevEngineForm.HandleTranslateCppElement(Sender: TObject; CppElement: PCppElement; Index, Total: Integer);
begin
  Progress(Index, Total);
end;

procedure TRevEngineForm.HandleTranslateItem(Sender: TObject; Item: PTranslateItem; Index, Total: Integer);
begin
  Progress(Index, Total);
end;

procedure TRevEngineForm.HandleAddUMLElement(Sender: TObject; Element: IUMLElement);
begin
  MessageSubLabel.Caption := Format(TXT_ELEMENT_CREATED, [Element.GetClassName, Element.Name]);
  Application.ProcessMessages;
end;

procedure TRevEngineForm.HandleCreateView(Sender: TObject; View: IView; Index, Total: Integer);
begin
  Progress(Index, Total);
  Application.ProcessMessages;
end;

procedure TRevEngineForm.HandleCreateDiagram(Sender: TObject; Diagram: IDiagram; Index, Total: Integer);
begin
  MessageSubLabel.Caption := Format(TXT_DIAGRAM_CREATED, [Index, Total, Diagram.Name]);
end;

procedure TRevEngineForm.HandleStepReverse(Sender: TObject; Step: PReverseStep; Parameters: array of const);
begin
  case Step of
    rsBegin:
      begin
        MessageLabel.Caption := TXT_REVERSE_BEGIN;
        MessageSubLabel.Caption := '';
        Log(Format(MSG_REVERSE_BEGIN, [RevEngine.SourceFileCount]));
        Progress(0, 0);
      end;
    rsParse:
      begin
        MessageLabel.Caption := TXT_ANALYZE_FILE;
        MessageSubLabel.Caption := '';
        Progress(0, 0);
      end;
    rsCreateUMLModel:
      begin
        MessageLabel.Caption := TXT_CREATE_MODEL;
        MessageSubLabel.Caption := '';
        Progress(0, 0);
      end;
    rsReviseReference:
      begin
        MessageLabel.Caption := TXT_REVISE_REFERENCE;
        MessageSubLabel.Caption := '';
        Progress(0, 0);
      end;
    rsUpdateBrowser:
      begin
        MessageLabel.Caption := TXT_UPDATE_BROWSER;
        MessageSubLabel.Caption := TXT_CANT_STOP;
        Progress(100, 100);
      end;
    rsCreateDiagram:
      begin
        MessageLabel.Caption := TXT_CREATE_DIAGRAM;
        MessageSubLabel.Caption := '';
        Progress(0, 0);
      end;
    rsEnd:
      begin
        MessageLabel.Caption := TXT_REVERSE_COMPLETE;
        MessageSubLabel.Caption := TXT_REVERSE_RESULT_DIRECTION;
        Log(MSG_REVERSE_FINISH);
        Progress(100, 100);
        InformMessage(MSG_DLG_REVERSE_COMPLETE);
      end;
    rsAbort:
      begin
        MessageLabel.Caption := TXT_REVERSE_CANCEL;
        MessageSubLabel.Caption := TXT_REVERSE_RESULT_DIRECTION;
        Log(MSG_REVERSE_CANCEL);
        InformMessage(MSG_DLG_REVERSE_CANCEL);
      end;
    rsError:
      begin
        MessageLabel.Caption := TXT_REVERSE_ERROR;
        MessageSubLabel.Caption := TXT_REVERSE_RESULT_DIRECTION;
        Log(Format(ERR_REVERSE_ERROR, Parameters));
        ErrorMessage(Format(ERR_DLG_REVERSE_ERROR, Parameters));
      end;
  end;
end;

procedure TRevEngineForm.HandleLog(Sender: TObject; Msg: string);
begin
  Log(Msg);
end;

{ UI Updating Methods }

procedure TRevEngineForm.UpdateUIStatesSourceFileSelectionPage;
begin
  AddButton.Enabled := not IsOnAddFiles and ShellListView.Focused and (ShellListView.SelCount > 0);
  RemoveButton.Enabled := not IsOnAddFiles and SourceFileListView.Focused and (SourceFileListView.SelCount > 0);
  AddAllButton.Enabled := not IsOnAddFiles and ShellTreeView.Focused and (ShellTreeView.SelectedFolder.IsFolder);
  if IsOnAddFiles or (SourceFileListView.Items.Count = 0) then
    SourceFileSelectionPage.EnabledButtons := SourceFileSelectionPage.EnabledButtons - [bkNext]
  else
    SourceFileSelectionPage.EnabledButtons := SourceFileSelectionPage.EnabledButtons + [bkNext];
end;

procedure TRevEngineForm.UpdateUIStatesPackageSelectionPage;
begin
  if (SelectTreeFrame.SelectedItem <> nil) and
    not PMetaTreeNode(SelectTreeFrame.SelectedItem.Data).ModelElement.IsKindOf('UMLProject') then
    PackageSelectionPage.EnabledButtons := PackageSelectionPage.EnabledButtons + [bkNext]
  else
    PackageSelectionPage.EnabledButtons := PackageSelectionPage.EnabledButtons - [bkNext];
  SelectTreeFrame.SelectTree.FullExpand;
end;

procedure TRevEngineForm.UpdateUIStatesSetupOptionPage;
begin
  DiagramNameEdit.Enabled := OverviewCheckBox.Checked;
  SuppressAttrCheckBox.Enabled := OverviewCheckBox.Checked;
  SuppressOperCheckBox.Enabled := OverviewCheckBox.Checked;
  HideOperationSignatureCheckBox.Enabled := OverviewCheckBox.Checked;
  OnlyInheritanceCheckBox.Enabled := OverviewCheckBox.Checked;
end;

procedure TRevEngineForm.Log(Msg: string);
begin
  FStarUMLApp.Log(Msg);
end;

procedure TRevEngineForm.InformMessage(Msg: string);
begin
  Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_OK + MB_ICONINFORMATION);
end;

procedure TRevEngineForm.ErrorMessage(Msg: string);
begin
  Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_OK + MB_ICONERROR);
end;

function TRevEngineForm.QueryCancel: Boolean;
begin
  Result := (Application.MessageBox(PChar(QUERY_CANCEL_REVERSE), PChar(Application.Title),
    MB_YESNO + MB_ICONQUESTION) = IDYES);
end;

{ Event Handlers for RevEngineForm }

procedure TRevEngineForm.FormCreate(Sender: TObject);
begin
  Initialize;
  NLSManager.SetFile(GetDllPath + '\' + NLS_FILE_NAME);
  NLSManager.TranslateComponent(Self, []);
end;

procedure TRevEngineForm.FormDestroy(Sender: TObject);
begin
  Finalize;
end;

procedure TRevEngineForm.FormShow(Sender: TObject);
begin
  BeforeShow;
end;

{ Event Handlers for SourceFileSelectionPage }

procedure TRevEngineForm.ShellTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  UpdateUIStatesSourceFileSelectionPage;
end;

procedure TRevEngineForm.ShellTreeViewEnter(Sender: TObject);
begin
  UpdateUIStatesSourceFileSelectionPage;
end;

procedure TRevEngineForm.ShellListViewAddFolder(Sender: TObject;
  AFolder: TShellFolder; var CanAdd: Boolean);
var
  FileName: string;
  FileExt: string;
  I: Integer;
begin
  CanAdd := False;
  if not AFolder.IsFolder then
  begin
    FileName := AFolder.PathName;
    FileExt := ExtractFileExt(FileName);
    for I := 0 to Length(HEADER_FILE_EXTS) - 1 do
      if LowerCase(FileExt) = HEADER_FILE_EXTS[I] then begin
        CanAdd := True;
        Break;
      end;
  end;
end;

procedure TRevEngineForm.ShellListViewChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  UpdateUIStatesSourceFileSelectionPage;
end;

procedure TRevEngineForm.ShellListViewDblClick(Sender: TObject);
begin
  if ShellListView.Selected <> nil then
    AddButtonClick(AddButton);
end;

procedure TRevEngineForm.ShellListViewEnter(Sender: TObject);
begin
  UpdateUIStatesSourceFileSelectionPage;
end;

procedure TRevEngineForm.ShellListViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #1 then ShellListView.SelectAll;
end;

procedure TRevEngineForm.SourceFileListViewDblClick(Sender: TObject);
begin
  if SourceFileListView.Selected <> nil then
    RemoveButtonClick(RemoveButton);
end;

procedure TRevEngineForm.SourceFileListViewEnter(Sender: TObject);
begin
  UpdateUIStatesSourceFileSelectionPage;
end;

procedure TRevEngineForm.SourceFileListViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #1 then SourceFileListView.SelectAll;
end;

procedure TRevEngineForm.SourceFileListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  UpdateUIStatesSourceFileSelectionPage;
end;

procedure TRevEngineForm.AddButtonClick(Sender: TObject);
begin
  IsOnAddFiles := True;
  UpdateUIStatesSourceFileSelectionPage;
  try
    AddFiles;
  finally
    IsOnAddFiles := False;
    UpdateUIStatesSourceFileSelectionPage;
  end;    
end;

procedure TRevEngineForm.RemoveButtonClick(Sender: TObject);
begin
  RemoveFiles;
  UpdateUIStatesSourceFileSelectionPage;
end;

procedure TRevEngineForm.AddAllButtonClick(Sender: TObject);
begin
  if ShellTreeView.SelectedFolder.IsFolder then begin
    IsOnAddFiles := True;
    UpdateUIStatesSourceFileSelectionPage;
    try
      AddFilesRecursive(ShellTreeview.SelectedFolder.PathName);
    finally
      IsOnAddFiles := False;
      UpdateUIStatesSourceFileSelectionPage;
    end;
  end;
end;

procedure TRevEngineForm.PackageSelectionPageEnterPage(Sender: TObject;
  const Page: TJvWizardCustomPage);
begin
  UpdateUIStatesPackageSelectionPage;
end;

procedure TRevEngineForm.OverviewCheckBoxClick(Sender: TObject);
begin
  UpdateUIStatesSetupOptionPage;
end;

procedure TRevEngineForm.SetupOptionPageEnterPage(Sender: TObject;
  const Page: TJvWizardCustomPage);
begin
  UpdateUIStatesSetupOptionPage;
end;

procedure TRevEngineForm.RunPagePage(Sender: TObject);
begin
  RevWizard.ButtonFinish.Caption := TXT_STOP + ' (&S)';
  try
    IsOnReverse := True;
    DoReverse;
    IsOnReverse := False;
  finally
    RevWizard.ButtonFinish.Caption := TXT_FINISH + '(&F)';
  end;
end;

procedure TRevEngineForm.RunPageFinishButtonClick(Sender: TObject; var Stop: Boolean);
begin
  if IsOnReverse then begin
    if QueryCancel then begin
      Abort;
      IsOnReverse := False;
    end;
    Stop := True;
  end
  else
    Stop := False;
end;

//  TRevEngineForm
////////////////////////////////////////////////////////////////////////////////

procedure TRevEngineForm.SourceFileSelectionPageCancelButtonClick(
  Sender: TObject; var Stop: Boolean);
begin
  Stop := not QueryCancel;
  if IsOnAddFiles then
    IsOnAddFiles := Stop;
end;

procedure TRevEngineForm.PackageSelectionPageCancelButtonClick(
  Sender: TObject; var Stop: Boolean);
begin
  Stop := not QueryCancel;
end;

procedure TRevEngineForm.SetupOptionPageCancelButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  Stop := not QueryCancel;
end;

end.
