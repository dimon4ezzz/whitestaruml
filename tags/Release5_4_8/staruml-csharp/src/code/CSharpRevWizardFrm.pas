unit CSharpRevWizardFrm;

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
  CSharpReverseEngine, Symbols, Utility,
  ImgList, Controls, ComCtrls, ExtCtrls, StdCtrls, Forms, Classes,
  Windows, Messages, SysUtils, Variants, Graphics,
  Dialogs, JvWizard,  ElXPThemedControl,
  ElTree, WhiteStarUML_TLB, FileCtrl, SelTreeFrame, ShellCtrls, JvExControls,
  JvComponent;

type
  // EFormNotInitialized
  EFormNotInitialized = class(Exception);

  // TCSharpRevWizardForm
  TRevEngineForm = class(TForm)
    RevWizard: TJvWizard;
    RevSrcSelectJvWizardPage: TJvWizardInteriorPage;
    AddFileBtn: TButton;
    DeleteFileBtn: TButton;
    ShellTreeView: TShellTreeView;
    SourceFileListView: TListView;
    AllAddFileBtn: TButton;
    RevModelSelectJvWizardPage: TJvWizardInteriorPage;
    RevExecJvWizardPage: TJvWizardInteriorPage;
    RevOptSelectJvWizardPage: TJvWizardInteriorPage;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SelectTreeFrame: TSelectTreeFrame;
    StateMarkImageList: TImageList;
    SelectTreeImageList: TImageList;
    RefFieldGroupBox: TGroupBox;
    FieldAsAssocRadioButton: TRadioButton;
    FieldAsAttrRadioButton: TRadioButton;
    DiagramGroupBox: TGroupBox;
    DiagramNameLabel: TLabel;
    DiagramNameExLabel: TLabel;
    OverviewCheckBox: TCheckBox;
    DiagramNameEdit: TEdit;
    ViewGroupBox: TGroupBox;
    OnlyInheritanceCheckBox: TCheckBox;
    SuppressAttrCheckBox: TCheckBox;
    SuppressOperCheckBox: TCheckBox;
    HideOperationSignatureCheckBox: TCheckBox;
    ModelGroupBox: TGroupBox;
    VisibilityLabel: TLabel;
    VisbilityBevel: TBevel;
    OmitInitialValueCheckBox: TCheckBox;
    ReverseCsDocCheckBox: TCheckBox;
    InternalMemberCheckBox: TCheckBox;
    PublicMemberCheckBox: TCheckBox;
    ProtectedMemberCheckBox: TCheckBox;
    PrivateMemberCheckBox: TCheckBox;
    SourceFileLabel: TLabel;
    ReverseReportListView: TListView;
    FileNumInfoLabel: TLabel;
    MessageLabel: TLabel;
    MessageSubLabel: TLabel;
    Bevel1: TBevel;
    ReverseProgressbar: TProgressBar;
    ShellListView: TShellListView;
    procedure ShellTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure AddFileBtnClick(Sender: TObject);
    procedure AllAddFileBtnClick(Sender: TObject);
    procedure DeleteFileBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RevExecJvWizardPagePage(Sender: TObject);
    procedure RevWizardFinishButtonClick(Sender: TObject);
    procedure ShellTreeViewEnter(Sender: TObject);
    procedure SourceFileListViewEnter(Sender: TObject);
    procedure SourceFileListViewKeyPress(Sender: TObject; var Key: Char);
    procedure SourceFileListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RevSrcSelectJvWizardPagePage(Sender: TObject);
    procedure RevModelSelectJvWizardPagePage(Sender: TObject);
    procedure SourceFileListViewDblClick(Sender: TObject);
    procedure OverviewCheckBoxClick(Sender: TObject);
    procedure RevOptSelectJvWizardPageEnterPage(Sender: TObject;
      const Page: TJvWizardCustomPage);
    procedure RevOptSelectJvWizardPageExitPage(Sender: TObject;
      const Page: TJvWizardCustomPage);
    procedure RevSrcSelectJvWizardPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure RevModelSelectJvWizardPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure RevExecJvWizardPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure RevOptSelectJvWizardPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure ShellListViewAddFolder(Sender: TObject;
      AFolder: TShellFolder; var CanAdd: Boolean);
    procedure ShellListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ShellListViewDblClick(Sender: TObject);
    procedure ShellListViewEnter(Sender: TObject);
    procedure ShellListViewKeyPress(Sender: TObject; var Key: Char);
  private
    { Private Fields }
    RevEngine: PRevEngine;
    FStarUMLApp: IStarUMLApplication;
    { Internal Variables }
    IsOnAddFile: Boolean;
    IsCancel: Boolean;
    { Initialization and Finalization Methods }
    procedure Initialize;
    procedure Finalize;
    procedure BeforeShow;
    { Page Setting Methods }
    procedure SetupSelectTreeFrame;
    procedure SetupReverseReportListView;
    { Source File Selection Related Methods }
    procedure UpdateFileListView;
    function SourceFileIncluded(FilePath: string): Boolean;
    procedure AddFile(FilePath: string);
    procedure AddFiles;
    procedure RemoveFiles;
    procedure AddFilesInDirectory(Dir: string);
    { Option Related Methods }
    function GetOptionValueAsBoolean(OptionSchema, OptionItem: string): Boolean;
    function GetOptionValueAsString(OptionSchema, OptionItem: string): string;
    function GetOptionValueAsInteger(OptionSchema, OptionItem: string): Integer;
    procedure LoadDefaultOptions;
    procedure ApplyOptionToRevEngine;
    { Auxiliary Methods }
    procedure Log(Msg: string);
    function QueryCancel: Boolean;
    procedure Progress(Index, Total: Integer);
    { Main Method }
    procedure DoReverse;
    { Event Handlers }
    procedure HandleTVItemSelectedChanged(Sender: TObject; Item: TElTreeItem);
    procedure HandleFileParsing(Sender: TObject; FileName: string; Index, Total: Integer; State: PParseProcessKind);
    procedure HandleUMLElementCreate(Sender: TObject; Index, Total: Integer; ProcessType: Boolean = True);
    procedure HandleUMLDiagramCreate(Sender: TObject; Index, Total: Integer; ProcessType: Boolean = True);
    procedure HandleViewCreate(Sender: TObject; View: IView; Index, Total: Integer);
    { UI Updating Methods }
    procedure UpdateUIStatesRevSrcSelectJvWizardPage;
    procedure UpdateUIStatesRevModelSelectJvWizardPage;
    procedure UpdateUIStatesRevOptSelectJvWizardPage;
    procedure HandleLog(Sender: TObject; Msg: string);
  public
    { Properties }
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
  end;

implementation

{$R *.dfm}
uses
  CSharpElements, NLS_CSharpAddIn, NLS;

////////////////////////////////////////////////////////////////////////////////
// TRevEngineForm

procedure TRevEngineForm.Initialize;
begin
  RevEngine := PRevEngine.Create;
  RevEngine.OnParsingFile := HandleFileParsing;
  RevEngine.OnUMLElementCreate := HandleUMLElementCreate;
  RevEngine.OnUMLDiagramCreate := HandleUMLDiagramCreate;
  RevEngine.OnCreateView := HandleViewCreate;  
  RevEngine.OnLog := HandleLog;
  FStarUMLApp := nil;
end;

procedure TRevEngineForm.Finalize;
begin
  RevEngine.Free;
  RevEngine := nil;
  FStarUMLApp := nil;
end;

procedure TRevEngineForm.BeforeShow;
begin
  if (FStarUMLApp = nil) or (FStarUMLApp.GetProject = nil) then
    raise EFormNotInitialized.Create(ERR_DIALOG_NOT_INITIALIZED);
  SetupSelectTreeFrame;
  LoadDefaultOptions;
end;

procedure TRevEngineForm.SetupSelectTreeFrame;
begin
  SelectTreeFrame.Images := SelectTreeImageList;
  SelectTreeFrame.ShowRoot := True;
  SelectTreeFrame.OnTVItemSelectedChange := HandleTVItemSelectedChanged;
  SelectTreeFrame.RootElement := FStarUMLApp.GetProject;
  SelectTreeFrame.Filter([ELEM_PACKAGE, ELEM_SUBSYSTEM, ELEM_MODEL]);
  SelectTreeFrame.AddSelectableModel([ELEM_PACKAGE, ELEM_SUBSYSTEM, ELEM_MODEL]);
  SelectTreeFrame.BuildTree;
end;

procedure TRevEngineForm.SetupReverseReportListView;
var
  L: TListItem;
  I: Integer;
begin
  ReverseReportListView.Clear;
  for I := 0 to RevEngine.SourceFiles.Count - 1 do begin  // replace as RevEngine.SourceFileCount
    L := ReverseReportListView.Items.Add;
    L.Caption := ExtractFileName(RevEngine.SourceFiles[I]);
    L.SubItems.Add(ExtractFileDir(RevEngine.SourceFiles[I]));
    L.SubItems.Add(TXT_WAITING);
    L.SubItems.Add(RevEngine.SourceFiles[I]);
    L.ImageIndex := IMG_INDEX_WAITING;
  end;
end;

procedure TRevEngineForm.UpdateFileListView;
var
  SelectedFolder: TShellFolder;
  L: TListItem;
  F: TSearchRec;
begin
  SelectedFolder := ShellTreeView.SelectedFolder;
  if (SelectedFolder <> nil) and (SelectedFolder.IsFolder) then begin
    ShellListView.Clear;
    if FindFirst(SelectedFolder.PathName + '\*' + CSHARP_FILE_EXT, faAnyFile, F) = 0 then begin
      try
        L := ShellListView.Items.Add;
        L.Caption := F.Name;
        L.SubItems.Add(SelectedFolder.PathName + '\' + F.Name);
        while FindNext(F) = 0 do begin
          L := ShellListView.Items.Add;
          L.Caption := F.Name;
          L.SubItems.Add(SelectedFolder.PathName + '\' + F.Name);
        end;
      finally
        FindClose(F);
      end;
    end;
  end;
end;

function TRevEngineForm.SourceFileIncluded(FilePath: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to SourceFileListView.Items.Count - 1 do
    if SourceFileListView.Items[I].SubItems[1] = FilePath then begin
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
    if not IsOnAddFile then Exit;
    if ShellListView.Items[I].Selected then begin
      AddFile(ShellListView.SelectedFolder.PathName);
      ShellListView.Items[I].Selected := False;
    end;
  end;
end;

procedure TRevEngineForm.RemoveFiles;
begin
  SourceFileListView.DeleteSelected;
  UpdateUIStatesRevSrcSelectJvWizardPage;
end;

procedure TRevEngineForm.AddFilesInDirectory(Dir: string);
var
  F: TSearchRec;
begin
  if not IsOnAddFile then Exit;
  if FindFirst(Dir + '\*' + CSHARP_FILE_EXT, faArchive, F) = 0 then begin
    try
      AddFile(Dir + '\' + F.Name);
      while FindNext(F) = 0 do begin
        AddFile(Dir + '\' + F.Name);
        Application.ProcessMessages;
      end;
    finally
      FindClose(F);
    end;
  end;
  if FindFirst(Dir + '\*', faDirectory, F) = 0 then begin
    try
      if (F.Name <> '.') and (F.Name <> '..') then
        AddFilesInDirectory(Dir + '\' + F.Name);
      while FindNext(F) = 0 do
        if (F.Name <> '.') and (F.Name <> '..') then
          AddFilesInDirectory(Dir + '\' + F.Name);
    finally
      FindClose(F);
    end;
  end;
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

procedure TRevEngineForm.LoadDefaultOptions;
begin
  ReverseCsDocCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_REVERSE_CSHARPDOC);
  OmitInitialValueCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_OMIT_INITIAL_VALUE);
  PublicMemberCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_CREATE_PUBLIC_MEMBER);
  InternalMemberCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_CREATE_INTERNAL_MEMBER);
  ProtectedMemberCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_CREATE_PROTECTED_MEMBER);
  PrivateMemberCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_CREATE_PRIVATE_MEMBER);
  FieldAsAttrRadioButton.Checked := not GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_FIELD_AS_ASSOC);
  FieldAsAssocRadioButton.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_FIELD_AS_ASSOC);
  OverviewCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_CREATE_OVERVIEW);
  DiagramNameEdit.Text := GetOptionValueAsString(OPTION_SCHEMA, OPTION_DIGRAM_NAME);
  SuppressAttrCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_SUPRESS_ATTR);
  SuppressOperCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_SUPRESS_OPER);
  HideOperationSignatureCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_HIDE_OPER_SIGNATURE);
  OnlyInheritanceCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_INHERITANCE_ONLY);
end;

procedure TRevEngineForm.ApplyOptionToRevEngine;
begin
  RevEngine.DocChk := ReverseCsDocCheckBox.Checked;
  RevEngine.FieldInitValChk := OmitInitialValueCheckBox.Checked;
  RevEngine.PublicChk := PublicMemberCheckBox.Checked;
  RevEngine.InternalChk := InternalMemberCheckBox.Checked;
  RevEngine.ProtectedChk := ProtectedMemberCheckBox.Checked;
  RevEngine.PrivateChk := PrivateMemberCheckBox.Checked;
  RevEngine.RefFieldTypeChk := FieldAsAssocRadioButton.Checked;
  RevEngine.DefaultViewChk := OverviewCheckBox.Checked;
  RevEngine.DefaultViewText := DiagramNameEdit.Text;
  RevEngine.HiddenClsAttrChk := SuppressAttrCheckBox.Checked;
  RevEngine.HiddenClsOprChk := SuppressOperCheckBox.Checked;
  RevEngine.HiddenOprChk := HideOperationSignatureCheckBox.Checked;
  RevEngine.ViewOnlyGNRLChk := OnlyInheritanceCheckBox.Checked;
end;

procedure TRevEngineForm.Log(Msg: string);
begin
  FStarUMLApp.Log(Msg);
end;

function TRevEngineForm.QueryCancel: Boolean;
begin
  Result := (Application.MessageBox(PChar(QUERY_CANCEL_REVERSE), PChar(Application.Title),
    MB_YESNO + MB_ICONQUESTION) = IDYES);
end;

procedure TRevEngineForm.Progress(Index, Total: Integer);
begin
  ReverseProgressbar.Max := Total;
  ReverseProgressbar.Position := Index;
  Application.ProcessMessages;
end;

procedure TRevEngineForm.DoReverse;
var
  I: Integer;
begin
//  RevExecJvWizardPage.EnabledButtons := RevExecJvWizardPage.EnabledButtons - [bkFinish];
  try
    try
      for I := 0 to SourceFileListView.Items.Count - 1 do begin
        RevEngine.SourceFiles.Add(SourceFileListView.Items[I].SubItems[1]); // replace with RevEngine.AddSourceFile
        Application.ProcessMessages;
      end;
      Assert(PMetaTreeNode(SelectTreeFrame.SelectedItem.Data).ModelElement.IsKindOf(ELEM_PACKAGE));
      RevEngine.RootUMLPackage := PMetaTreeNode(SelectTreeFrame.SelectedItem.Data).ModelElement as IUMLPackage;
      ApplyOptionToRevEngine;
      SetupReverseReportListView;
      Application.ProcessMessages;
      Log(Format(MSG_REVERSE_BEGIN,[ReverseReportListView.Items.Count]));
      RevEngine.Reverse;
      if IsCancel then exit;
      Log(MSG_REVERSE_FINISH);
      MessageLabel.Caption := TXT_REVERSE_COMPLETE;
      MessageSubLabel.Caption := TXT_REVERSE_RESULT_DIRECTION;
      ReverseProgressbar.Position := ReverseProgressbar.Max;
      if IsCancel then exit;
      Application.MessageBox(PChar(MSG_DLG_REVERSE_COMPLETE), PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    except
      on E: Exception do begin
        MessageLabel.Caption := TXT_REVERSE_ERROR;
        MessageSubLabel.Caption := TXT_REVERSE_RESULT_DIRECTION;
        Application.MessageBox(PChar(Format(ERR_DLG_REVERSE_ERROR, [E.Message])), PChar(Application.Title), MB_ICONERROR + MB_OK);
      end;
    end;
  finally
    RevExecJvWizardPage.VisibleButtons := [bkFinish];
    RevExecJvWizardPage.EnabledButtons := RevExecJvWizardPage.EnabledButtons + [bkFinish];
  end;
end;

procedure TRevEngineForm.HandleTVItemSelectedChanged(Sender: TObject; Item: TElTreeItem);
begin
  UpdateUIStatesRevModelSelectJvWizardPage;
end;

procedure TRevEngineForm.HandleFileParsing(Sender: TObject; FileName: string; Index, Total: Integer; State: PParseProcessKind);
var
  L: TListItem;
begin
  L := ReverseReportListView.Items[Index];
  Assert(L <> nil);
  RevEngine.IsCancel := IsCancel;
  case State of
    ppkRead, ppkParse:
      begin
        L.SubItems[1] := TXT_ANALYZING;
        L.ImageIndex := IMG_INDEX_ONPARSING;
      end;
    ppkClose:
      begin
        L.SubItems[1] := TXT_ANALYZED;
        L.ImageIndex := IMG_INDEX_COMPLETE;
      end;
    ppkError:
      begin
        L.SubItems[1] := TXT_ANAYSIS_FAIL;
        L.ImageIndex := IMG_INDEX_ERROR;
      end;
  end;
  ReverseReportListView.Selected := L;
  ReverseReportListView.ItemFocused := L;
  L.MakeVisible(True);
  if State = ppkRead then begin
    MessageLabel.Caption := TXT_ANALYZE_FILE;
    MessageSubLabel.Caption := FileName;
  end
  else if State in [ppkClose, ppkError] then begin
    FileNumInfoLabel.Caption := Format('(%d / %d)', [Index + 1, Total]);
    ReverseProgressbar.Max := Total;
    ReverseProgressbar.Position := Index + 1;
  end;
  Application.ProcessMessages;
end;

procedure TRevEngineForm.HandleUMLElementCreate(Sender: TObject; Index, Total: Integer; ProcessType: Boolean = True);
begin
  RevEngine.IsCancel := IsCancel;
  if ProcessType then begin
    MessageLabel.Caption := TXT_CREATE_MODEL;
    MessageSubLabel.Caption := (Sender as PCSharpElement).Name;
  end
  else begin
    if MessageLabel.Caption = TXT_CREATE_MODEL then
      ReverseProgressbar.Position := 0;
    MessageLabel.Caption := TXT_REVICE_REFERECE;
    MessageSubLabel.Caption := (Sender as PClassName).Name;
  end;
  ReverseProgressbar.Max := Total;
  ReverseProgressbar.Position := ReverseProgressbar.Position + Index;
  Application.ProcessMessages;
end;

procedure TRevEngineForm.HandleUMLDiagramCreate(Sender: TObject; Index, Total: Integer; ProcessType: Boolean = True);
begin
  RevEngine.IsCancel := IsCancel;
  MessageLabel.Caption := TXT_CREATE_DIAGRAM;
  MessageSubLabel.Caption := (Sender as PClassName).Name;
  Application.ProcessMessages;
end;

procedure TRevEngineForm.HandleViewCreate(Sender: TObject; View: IView; Index, Total: Integer);
begin
  Progress(Index, Total);
end;

procedure TRevEngineForm.HandleLog(Sender: TObject; Msg: string);
begin
  Log(Msg);
end;

procedure TRevEngineForm.UpdateUIStatesRevSrcSelectJvWizardPage;
begin
  AddFileBtn.Enabled := not IsOnAddFile and ShellListView.Focused and (ShellListView.SelCount > 0);
  DeleteFileBtn.Enabled := not IsOnAddFile and SourceFileListView.Focused and (SourceFileListView.SelCount > 0);
  AllAddFileBtn.Enabled := not IsOnAddFile and ShellTreeView.Focused and (ShellTreeView.SelectedFolder.IsFolder);
  if IsOnAddFile or (SourceFileListView.Items.Count = 0) then
    RevSrcSelectJvWizardPage.EnabledButtons := RevSrcSelectJvWizardPage.EnabledButtons - [bkNext]
  else
    RevSrcSelectJvWizardPage.EnabledButtons := RevSrcSelectJvWizardPage.EnabledButtons + [bkNext];
end;

procedure TRevEngineForm.UpdateUIStatesRevModelSelectJvWizardPage;
begin
  if (SelectTreeFrame.SelectedItem <> nil) and
    not PMetaTreeNode(SelectTreeFrame.SelectedItem.Data).ModelElement.IsKindOf(ELEM_PROJECT) then
    RevModelSelectJvWizardPage.EnabledButtons := RevModelSelectJvWizardPage.EnabledButtons + [bkNext]
  else
    RevModelSelectJvWizardPage.EnabledButtons := RevModelSelectJvWizardPage.EnabledButtons - [bkNext];
  SelectTreeFrame.SelectTree.FullExpand;
end;

procedure TRevEngineForm.UpdateUIStatesRevOptSelectJvWizardPage;
begin
  SuppressAttrCheckBox.Enabled := OverviewCheckBox.Checked;
  SuppressOperCheckBox.Enabled := OverviewCheckBox.Checked;
  HideOperationSignatureCheckBox.Enabled := OverviewCheckBox.Checked;
  OnlyInheritanceCheckBox.Enabled := OverviewCheckBox.Checked;
  DiagramNameLabel.Enabled := OverviewCheckBox.Checked;
  DiagramNameEdit.Enabled := OverviewCheckBox.Checked;
  DiagramNameExLabel.Enabled := OverviewCheckBox.Checked;
end;

procedure TRevEngineForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(GetDllPath + '\' + NLS_FILE_NAME);
  NLSManager.TranslateComponent(Self, []);
  Initialize;
end;

procedure TRevEngineForm.FormDestroy(Sender: TObject);
begin
  Finalize;
end;

procedure TRevEngineForm.FormShow(Sender: TObject);
begin
  BeforeShow;
end;

{ Event Handlers for RevSrcSelectJvWizardPage }

procedure TRevEngineForm.RevSrcSelectJvWizardPagePage(Sender: TObject);
begin
  UpdateUIStatesRevSrcSelectJvWizardPage;
end;

procedure TRevEngineForm.ShellTreeViewChange(Sender: TObject; Node: TTreeNode);
begin
  UpdateFileListView;
  UpdateUIStatesRevSrcSelectJvWizardPage;
end;

procedure TRevEngineForm.ShellTreeViewEnter(Sender: TObject);
begin
  UpdateUIStatesRevSrcSelectJvWizardPage;
end;

procedure TRevEngineForm.SourceFileListViewEnter(Sender: TObject);
begin
  UpdateUIStatesRevSrcSelectJvWizardPage;
end;

procedure TRevEngineForm.SourceFileListViewKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #1 then SourceFileListView.SelectAll;
end;

procedure TRevEngineForm.SourceFileListViewSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  UpdateUIStatesRevSrcSelectJvWizardPage;
end;

procedure TRevEngineForm.SourceFileListViewDblClick(Sender: TObject);
begin
  if SourceFileListView.Selected <> nil then
    DeleteFileBtnClick(DeleteFileBtn);
  UpdateUIStatesRevSrcSelectJvWizardPage;
end;

procedure TRevEngineForm.AddFileBtnClick(Sender: TObject);
begin
  IsOnAddFile := True;
  try
    UpdateUIStatesRevSrcSelectJvWizardPage;
    AddFiles;
  finally
    IsOnAddFile := False;
    UpdateUIStatesRevSrcSelectJvWizardPage;
  end;
end;

procedure TRevEngineForm.AllAddFileBtnClick(Sender: TObject);
begin
  if ShellTreeView.SelectedFolder.IsFolder then begin
    IsOnAddFile := True;
    try
      UpdateUIStatesRevSrcSelectJvWizardPage;
      AddFilesInDirectory(ShellTreeView.SelectedFolder.PathName);
    finally
      IsOnAddFile := False;
      UpdateUIStatesRevSrcSelectJvWizardPage;
    end;
  end;
end;

procedure TRevEngineForm.DeleteFileBtnClick(Sender: TObject);
begin
  RemoveFiles;
end;

{ Event Handlers for RevModelSelectJvWizardPage }

procedure TRevEngineForm.RevModelSelectJvWizardPagePage(Sender: TObject);
begin
  UpdateUIStatesRevModelSelectJvWizardPage;
end;

{ Event Handlers for RevOptSelectJvWizardPage }

procedure TRevEngineForm.RevOptSelectJvWizardPageEnterPage(Sender: TObject;
  const Page: TJvWizardCustomPage);
begin
  RevWizard.ButtonNext.Caption := TXT_EXECUTE + '(&R)';
  UpdateUIStatesRevOptSelectJvWizardPage;
end;

procedure TRevEngineForm.RevOptSelectJvWizardPageExitPage(Sender: TObject;
  const Page: TJvWizardCustomPage);
begin
  RevWizard.ButtonNext.Caption := TXT_NEXT + '(&N)';
end;

procedure TRevEngineForm.OverviewCheckBoxClick(Sender: TObject);
begin
  UpdateUIStatesRevOptSelectJvWizardPage;
end;

{ Event Handlers for RevExecJvWizardPage }

procedure TRevEngineForm.RevExecJvWizardPagePage(Sender: TObject);
begin
  RevWizard.ButtonCancel.Caption := TXT_STOP + '(&S)';
  RevExecJvWizardPage.VisibleButtons := [bkCancel];
  RevExecJvWizardPage.EnabledButtons := [bkCancel];
//  IsOnReverse := True;
  try
    DoReverse;
  finally
//    IsOnReverse := False;
    RevExecJvWizardPage.VisibleButtons := RevExecJvWizardPage.VisibleButtons - [bkCancel];
    RevExecJvWizardPage.EnabledButtons := RevExecJvWizardPage.VisibleButtons - [bkCancel];
    RevWizard.ButtonFinish.Caption := TXT_FINISH + '(&F)';
  end;
end;

procedure TRevEngineForm.RevWizardFinishButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TRevEngineForm.RevSrcSelectJvWizardPageCancelButtonClick(
  Sender: TObject; var Stop: Boolean);
begin
  IsCancel := QueryCancel;
  Stop := Not IsCancel;
end;

procedure TRevEngineForm.RevModelSelectJvWizardPageCancelButtonClick(
  Sender: TObject; var Stop: Boolean);
begin
  IsCancel := QueryCancel;
  Stop := Not IsCancel;
end;

procedure TRevEngineForm.RevExecJvWizardPageCancelButtonClick(
  Sender: TObject; var Stop: Boolean);
begin
  IsCancel := QueryCancel;
  Stop := Not IsCancel;
  if IsCancel then
    Log(MSG_REVERSE_CANCEL);
end;

procedure TRevEngineForm.RevOptSelectJvWizardPageCancelButtonClick(
  Sender: TObject; var Stop: Boolean);
begin
  IsCancel := QueryCancel;
  Stop := Not IsCancel;
end;
// TRevEngineForm
////////////////////////////////////////////////////////////////////////////////
procedure TRevEngineForm.ShellListViewAddFolder(Sender: TObject;
  AFolder: TShellFolder; var CanAdd: Boolean);
var
  FileName: string;
  FileExt: string;
begin
  CanAdd := False;
  if not AFolder.IsFolder then
  begin
    FileName := AFolder.PathName;
    FileExt := ExtractFileExt(FileName);
    if LowerCase(FileExt) = '.cs' then
      CanAdd := True
    else
      CanAdd := False;
  end;
end;

procedure TRevEngineForm.ShellListViewChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  UpdateUIStatesRevSrcSelectJvWizardPage;
end;

procedure TRevEngineForm.ShellListViewDblClick(Sender: TObject);
begin
  if ShellListView.Selected <> nil then
    AddFileBtnClick(AddFileBtn);
end;

procedure TRevEngineForm.ShellListViewEnter(Sender: TObject);
begin
  UpdateUIStatesRevSrcSelectJvWizardPage;
end;

procedure TRevEngineForm.ShellListViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #1 then ShellListView.SelectAll;
end;

end.
