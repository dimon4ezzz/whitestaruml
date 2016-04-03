unit RevEngWizardFrm;

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

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  RevEng, SelTreeFrame, WhiteStarUML_TLB,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvWizard, ComCtrls, ShellCtrls, ImgList, ExtCtrls, ElTree,
  JvExControls, JvComponent;

type
  PParseStateKind = (psParsing, psParsed, psError);

  TRevEngWizardForm = class(TForm)
    RevWizard: TJvWizard;
    SelectSourceFilePage: TJvWizardInteriorPage;
    AddButton: TButton;
    RemoveButton: TButton;
    ShellTreeView: TShellTreeView;
    SourceFileListView: TListView;
    AddAllButton: TButton;
    SourceFileListLabel: TLabel;
    SelectPackagePage: TJvWizardInteriorPage;
    SetupOptionPage: TJvWizardInteriorPage;
    RunPage: TJvWizardInteriorPage;
    ReverseProgressbar: TProgressBar;
    MessageLabel: TLabel;
    DiagramGroupBox: TGroupBox;
    OverviewCheckBox: TCheckBox;
    ModelGroupBox: TGroupBox;
    ViewGroupBox: TGroupBox;
    OnlyInheritanceCheckBox: TCheckBox;
    SuppressAttrCheckBox: TCheckBox;
    SuppressOperCheckBox: TCheckBox;
    SelectTreeImageList: TImageList;
    ReverseReportListView: TListView;
    SourceFileLabel: TLabel;
    FileNumInfoLabel: TLabel;
    MessageSubLabel: TLabel;
    Bevel1: TBevel;
    StateMarkImageList: TImageList;
    SelectTreeFrame: TSelectTreeFrame;
    DiagramNameLabel: TLabel;
    DiagramNameEdit: TEdit;
    DiagramNameExLabel: TLabel;
    RefFieldGroupBox: TGroupBox;
    FieldAsAssocRadioButton: TRadioButton;
    FieldAsAttrRadioButton: TRadioButton;
    OmitInitialValueCheckBox: TCheckBox;
    ReverseJavaDocCheckBox: TCheckBox;
    HideOperationSignatureCheckBox: TCheckBox;
    VisibilityLabel: TLabel;
    VisbilityBevel: TBevel;
    PackageMemberCheckBox: TCheckBox;
    PublicMemberCheckBox: TCheckBox;
    ProtectedMemberCheckBox: TCheckBox;
    PrivateMemberCheckBox: TCheckBox;
    ShellListView: TShellListView;
    DirectoryLabel: TLabel;
    CurDirLabel: TLabel;
    ProjectStructLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SetupOptionPageEnterPage(Sender: TObject;
      const Page: TJvWizardCustomPage);
    procedure SetupOptionPageExitPage(Sender: TObject;
      const Page: TJvWizardCustomPage);
    procedure ShellTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure AddButtonClick(Sender: TObject);
    procedure RunPagePage(Sender: TObject);
    procedure AddAllButtonClick(Sender: TObject);
    procedure RemoveButtonClick(Sender: TObject);
    procedure SelectSourceFilePageEnterPage(Sender: TObject;
      const Page: TJvWizardCustomPage);
    procedure SourceFileListViewSelectItem(Sender: TObject;
      Item: TListItem; Selected: Boolean);
    procedure SourceFileListViewEnter(Sender: TObject);
    procedure ShellTreeViewEnter(Sender: TObject);
    procedure SelectPackagePageEnterPage(Sender: TObject;
      const Page: TJvWizardCustomPage);
    procedure RunPageFinishButtonClick(Sender: TObject; var Stop: Boolean);
    procedure OverviewCheckBoxClick(Sender: TObject);
    procedure SourceFileListViewKeyPress(Sender: TObject; var Key: Char);
    procedure SelectSourceFilePageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure SelectPackagePageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure SetupOptionPageCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure SourceFileListViewDblClick(Sender: TObject);
    procedure ShellListViewAddFolder(Sender: TObject;
      AFolder: TShellFolder; var CanAdd: Boolean);
    procedure ShellListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ShellListViewDblClick(Sender: TObject);
    procedure ShellListViewEnter(Sender: TObject);
    procedure ShellListViewKeyPress(Sender: TObject; var Key: Char);
  private
    { Private Members }
    FJavaReverse: PJavaReverse;
    FStarUMLApp: IStarUMLApplication;
    { Internal Variables }
    IsOnAddFile: Boolean;
    IsOnReverse: Boolean;
    { Initialization and Finalization Methods }
    procedure InitProc;
    procedure FinishProc;
    { Source File Selection Related Methods }
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
    procedure ApplyOptionsToRevEngine;
    { Auxiliary Methods }
    procedure Log(Msg: string);
    function QueryCancel: Boolean;
    { Reverse Action Related Methods }
    procedure SetupReverseReportListView;
    procedure ReportReverseStep(Step: PReverseStep);
    procedure ReportParseState(FilePath: string; State: PParseStateKind; Index, Total: Integer);
    function CheckJavaProfileImported: Boolean;
    procedure DoReverse;
    procedure AbortReverse;
    { UI Updating Methods }
    procedure UpdateUIStatesSelectSourceFilePage;
    procedure UpdateUIStatesSelectPackagePage;
    procedure UpdateUIStatesSetupOptionPage;
    { Event Handlers }
    procedure HandleTVItemSelectedChanged(Sender: TObject; Item: TElTreeItem);
    procedure HandleReverseStepPassed(Sender: TObject; Step: PReverseStep);
    procedure HandleReverseProgressed(Sender: TObject; Percent: Integer);
    procedure HandleFileParsing(Sender: TObject; FileName: string; Index, Total: Integer; Success: Boolean = True);
    procedure HandleFileParsed(Sender: TObject; FileName: string; Index, Total: Integer; Success: Boolean = True);
    procedure HandleUMLElementAdded(Sender: TObject; Element: IUMLElement);
    procedure HandleUMLViewAdded(Sender: TObject; View: IView; Index, Total: Integer);
    procedure HandleUMLDiagramCreate(Sender: TObject; Diagram: IUMLDiagram; Index, Total: Integer);
  public
    { Properties }
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
  end;

implementation

{$R *.dfm}

uses
  RevEngModelTranslate, Symbols, NLS_JavaAddIn, NLS;

/////////////////////////////////////////////////////////////////////////////
// TReverseWizardForm

{ Initialization and Finalization Methods }

procedure TRevEngWizardForm.InitProc;
begin
  FJavaReverse := PJavaReverse.Create;
  FJavaReverse.OnPassReverseStep := HandleReverseStepPassed;
  FJavaReverse.OnProgress := HandleReverseProgressed;
  FJavaReverse.OnParsingFile := HandleFileParsing;
  FJavaReverse.OnParseFile := HandleFileParsed;
  FJavaReverse.OnAddUMLElement := HandleUMLElementAdded;
  FJavaReverse.OnAddUMLView := HandleUMLViewAdded;
  FJavaReverse.OnCreateUMLDiagram := HandleUMLDiagramCreate;
  SelectTreeFrame.Images := SelectTreeImageList;
  SelectTreeFrame.ShowRoot := True;
  SelectTreeFrame.OnTVItemSelectedChange := HandleTVItemSelectedChanged;
  SelectTreeFrame.RootElement := FStarUMLApp.GetProject;
  SelectTreeFrame.Filter([ELEM_PACKAGE, ELEM_SUBSYSTEM, ELEM_MODEL]);
  SelectTreeFrame.AddSelectableModel([ELEM_PACKAGE, ELEM_SUBSYSTEM, ELEM_MODEL]);
  SelectTreeFrame.BuildTree;
  LoadDefaultOptions;
end;

procedure TRevEngWizardForm.FinishProc;
begin
  FJavaReverse.Free;
  FJavaReverse := nil;
  StarUMLApp := nil;
end;

{ Source File Selection Related Methods }

function TRevEngWizardForm.SourceFileIncluded(FilePath: string): Boolean;
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

procedure TRevEngWizardForm.AddFile(FilePath: string);
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

procedure TRevEngWizardForm.AddFiles;
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

procedure TRevEngWizardForm.RemoveFiles;
begin
  SourceFileListView.DeleteSelected;
end;

procedure TRevEngWizardForm.AddFilesInDirectory(Dir: string);
var
  F: TSearchRec;
begin
  if not IsOnAddFile then Exit;
  if FindFirst(Dir + '\*' + JAVA_FILE_EXT, faArchive, F) = 0 then begin
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

{ Option Related Methods }

function TRevEngWizardForm.GetOptionValueAsBoolean(OptionSchema, OptionItem: string): Boolean;
begin
  try
    Result := FStarUMLApp.GetOptionValue(OptionSchema, OptionItem);
  except
    Result := False;
    Log(Format(ERR_INVALID_OPTION, [OptionSchema, OptionItem]));
  end;
end;

function TRevEngWizardForm.GetOptionValueAsString(OptionSchema, OptionItem: string): string;
begin
  try
    Result := FStarUMLApp.GetOptionValue(OptionSchema, OptionItem);
  except
    Result := '';
    Log(Format(ERR_INVALID_OPTION, [OptionSchema, OptionItem]));
  end;
end;

function TRevEngWizardForm.GetOptionValueAsInteger(OptionSchema, OptionItem: string): Integer;
begin
  try
    Result := FStarUMLApp.GetOptionValue(OptionSchema, OptionItem);
  except
    Result := 0;
    Log(Format(ERR_INVALID_OPTION, [OptionSchema, OptionItem]));
  end;
end;

procedure TRevEngWizardForm.LoadDefaultOptions;
begin
  PublicMemberCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_KEY_PUBLIC_MEMBER);
  PackageMemberCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_KEY_PACKAGE_MEMBER);
  ProtectedMemberCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_KEY_PROTECTED_MEMBER);
  PrivateMemberCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_KEY_PRIVATE_MEMBER);
  OmitInitialValueCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_KEY_OMIT_INIT);
  ReverseJavaDocCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_KEY_REV_JAVADOC);
  FieldAsAttrRadioButton.Checked := not GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_KEY_FIELD_AS_ASSOC);
  FieldAsAssocRadioButton.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_KEY_FIELD_AS_ASSOC);
  DiagramNameEdit.Text := GetOptionValueAsString(OPTION_SCHEMA, OPTION_KEY_DGM_NAME);
  SuppressAttrCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_KEY_SUPP_ATTR);
  SuppressOperCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_KEY_SUPP_OPER);
  HideOperationSignatureCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_KEY_HIDE_SIG);
  OnlyInheritanceCheckBox.Checked := GetOptionValueAsBoolean(OPTION_SCHEMA, OPTION_KEY_INHER_ONLY);
end;

procedure TRevEngWizardForm.ApplyOptionsToRevEngine;
begin
  FJavaReverse.TranslatePublicMember := PublicMemberCheckBox.Checked;
  FJavaReverse.TranslatePackageMember := PackageMemberCheckBox.Checked;
  FJavaReverse.TranslateProtectedMember := ProtectedMemberCheckBox.Checked;
  FJavaReverse.TranslatePrivateMember := PrivateMemberCheckBox.Checked;
  FJavaReverse.RefAsAssociation := FieldAsAssocRadioButton.Checked;
  FJavaReverse.CreateOverviewDiagram := OverviewCheckBox.Checked;
  FJavaReverse.DiagramNameStr := DiagramNameEdit.Text;
  FJavaReverse.SuppressAttributes := SuppressAttrCheckBox.Checked;
  FJavaReverse.SuppressOperations := SuppressOperCheckBox.Checked;
  FJavaReverse.ShowOperationSignature := not HideOperationSignatureCheckBox.Checked;
  FJavaReverse.CreateOnlyInheritences := OnlyInheritanceCheckBox.Checked;
  FJavaReverse.OmitInitialValue := OmitInitialValueCheckBox.Checked;
  FJavaReverse.ReverseJavaDoc := ReverseJavaDocCheckBox.Checked;
end;

{ Auxiliary Methods }

procedure TRevEngWizardForm.Log(Msg: string);
begin
  FStarUMLApp.Log(Msg);
end;

function TRevEngWizardForm.QueryCancel: Boolean;
begin
  Result := (Application.MessageBox(PChar(QUERY_CANCEL_REVERSE), PChar(Application.Title),
    MB_YESNO + MB_ICONQUESTION) = IDYES);
end;

{ Reverse Action Related Methods }

procedure TRevEngWizardForm.SetupReverseReportListView;
var
  L: TListItem;
  I: Integer;
begin
  ReverseReportListView.Clear;
  for I := 0 to FJavaReverse.SourceFileCount - 1 do begin
    L := ReverseReportListView.Items.Add;
    L.Caption := ExtractFileName(FJavaReverse.SourceFiles[I]);
    L.SubItems.Add(ExtractFileDir(FJavaReverse.SourceFiles[I]));
    L.SubItems.Add(TXT_WAITING);
    L.SubItems.Add(FJavaReverse.SourceFiles[I]);
    L.ImageIndex := IMG_INDEX_WAITING;
  end;
end;

procedure TRevEngWizardForm.ReportReverseStep(Step: PReverseStep);
begin
  case Step of
    rsBegin:
      begin
        MessageLabel.Caption := TXT_REVERSE_BEGIN;
        MessageSubLabel.Caption := '';
      end;
    rsParse:
      begin
        MessageLabel.Caption := TXT_ANALYZE_FILE;
        MessageSubLabel.Caption := '';
      end;
    rsCreateUMLModel:
      begin
        MessageLabel.Caption := TXT_CREATE_MODEL;
        MessageSubLabel.Caption := '';
        FileNumInfoLabel.Caption := '';
      end;
    rsReviseReference:
      begin
        MessageLabel.Caption := TXT_REVISE_REFERENCE;
        MessageSubLabel.Caption := '';
      end;
    rsCreateDiagram:
      begin
        MessageLabel.Caption := TXT_CREATE_DIAGRAM;
        MessageSubLabel.Caption := '';
      end;
    rsUpdateBrowser:
      begin
        MessageLabel.Caption := TXT_UPDATE_BROWSER;
        MessageSubLabel.Caption := TXT_CANT_STOP;
      end;
    rsEnd:
      begin
        MessageLabel.Caption := TXT_REVERSE_COMPLETE;
        MessageSubLabel.Caption := TXT_REVERSE_RESULT_DIRECTION;
        Application.MessageBox(PChar(MSG_DLG_REVERSE_COMPLETE), PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
        SetActiveWindow(Handle); // Make sure this form is on the top
      end;
    rsAbort:
      begin
        MessageLabel.Caption := TXT_REVERSE_CANCEL;
        MessageSubLabel.Caption := '';
        FileNumInfoLabel.Caption := '';
        Application.MessageBox(PChar(C_MSG_DLG_REVERSE_CANCEL), PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
        SetActiveWindow(Handle); // Make sure this form is on the top
      end;
    rsError:
      begin
        MessageLabel.Caption := TXT_REVERSE_ERROR;
        MessageSubLabel.Caption := TXT_REVERSE_RESULT_DIRECTION;
        Application.MessageBox(PChar(TXT_REVERSE_ERROR), PChar(Application.Title), MB_ICONERROR + MB_OK);
        SetActiveWindow(Handle); // Make sure this form is on the top
      end;
  end;
end;

procedure TRevEngWizardForm.ReportParseState(FilePath: string; State: PParseStateKind; Index, Total: Integer);
var
  L: TListItem;
  I: Integer;
begin
  FileNumInfoLabel.Caption := Format('(%d / %d)', [Index, Total]);
  for I := 0 to ReverseReportListView.Items.Count - 1 do begin
    L := ReverseReportListView.Items[I];
    if L.SubItems[2] = FilePath then begin
      case State of
        psParsing:
          begin
            L.SubItems[1] := TXT_ANALYZING;
            L.ImageIndex := IMG_INDEX_ONPARSING;
          end;
        psParsed:
          begin
            L.SubItems[1] := TXT_ANALYZED;
            L.ImageIndex := IMG_INDEX_COMPLETE;
          end;
        psError:
          begin
            L.SubItems[1] := TXT_ANALYSIS_FAILED;
            L.ImageIndex := IMG_INDEX_ERROR;
          end;
      end;
      ReverseReportListView.Selected := L;
      ReverseReportListView.ItemFocused := L;
      L.MakeVisible(False);
      Exit;
    end;
  end;
end;

function TRevEngWizardForm.CheckJavaProfileImported: Boolean;
var
  P: IProfile;
begin
  if FStarUMLApp.ExtensionManager.FindIncludedProfile(PROFILE_JAVA15) = nil then begin
    P := FStarUMLApp.ExtensionManager.FindAvailableProfile(PROFIlE_JAVA15);
    if P <> nil then begin
      if Application.MessageBox(C_QUERY_REVERSE_PROFILE_LOAD, PChar(Application.Title),
        MB_YESNO + MB_ICONQUESTION) = IDYES then begin
        FStarUMLApp.ExtensionManager.IncludeProfile(PROFILE_JAVA15);
        Result := True;
      end
      else
        Result := False;
    end
    else begin
      Application.MessageBox(C_ERR_PROFILE_NOT_DEFINED, PChar(Application.Title),
        MB_OK + MB_ICONWARNING);
      Result := False;
    end;
  end
  else
    Result := True;
end;

procedure TRevEngWizardForm.DoReverse;
var
  I: Integer;
begin
  if CheckJavaProfileImported then begin
    try
      ApplyOptionsToRevEngine;
      for I := 0 to SourceFileListView.Items.Count - 1 do begin
        FJavaReverse.AddSourceFile(SourceFileListView.Items[I].SubItems[1]);
        Application.ProcessMessages;
      end;
      Assert(PMetaTreeNode(SelectTreeFrame.SelectedItem.Data).ModelElement.IsKindOf(ELEM_PACKAGE));
      FJavaReverse.TopPackage := PMetaTreeNode(SelectTreeFrame.SelectedItem.Data).ModelElement as IUMLPackage;
      SetupReverseReportListView;
      FJavaReverse.Reverse;
    except
      on E: Exception do begin
        Log(Format(ERR_REVERSE_ERROR, [E.Message]));
        Application.MessageBox(PChar(Format(ERR_DLG_REVERSE_ERROR, [E.Message])), PChar(Application.Title), MB_ICONERROR + MB_OK);
      end;
    end;      
  end
  else
    AbortReverse;
end;

procedure TRevEngWizardForm.AbortReverse;
begin
  FJavaReverse.Abort;
end;

{ UI Updating Methods }

procedure TRevEngWizardForm.UpdateUIStatesSelectSourceFilePage;
begin
  AddButton.Enabled := not IsOnAddFile and ShellListView.Focused and (ShellListView.SelCount > 0);
  RemoveButton.Enabled := not IsOnAddFile and SourceFileListView.Focused and (SourceFileListView.SelCount > 0);
  AddAllButton.Enabled := not IsOnAddFile and ShellTreeView.Focused and (ShellTreeView.SelectedFolder.IsFolder);
  if IsOnAddFile or (SourceFileListView.Items.Count = 0) then
    SelectSourceFilePage.EnabledButtons := SelectSourceFilePage.EnabledButtons - [bkNext]
  else
    SelectSourceFilePage.EnabledButtons := SelectSourceFilePage.EnabledButtons + [bkNext];
end;

procedure TRevEngWizardForm.UpdateUIStatesSelectPackagePage;
begin
  if (SelectTreeFrame.SelectedItem <> nil) and
    not PMetaTreeNode(SelectTreeFrame.SelectedItem.Data).ModelElement.IsKindOf(ELEM_PROJECT) then
    SelectPackagePage.EnabledButtons := SelectPackagePage.EnabledButtons + [bkNext]
  else
    SelectPackagePage.EnabledButtons := SelectPackagePage.EnabledButtons - [bkNext];
  SelectTreeFrame.SelectTree.FullExpand;
end;

procedure TRevEngWizardForm.UpdateUIStatesSetupOptionPage;
begin
  SuppressAttrCheckBox.Enabled := OverviewCheckBox.Checked;
  SuppressOperCheckBox.Enabled := OverviewCheckBox.Checked;
  HideOperationSignatureCheckBox.Enabled := OverviewCheckBox.Checked;
  OnlyInheritanceCheckBox.Enabled := OverviewCheckBox.Checked;
  DiagramNameLabel.Enabled := OverviewCheckBox.Checked;
  DiagramNameEdit.Enabled := OverviewCheckBox.Checked;
  DiagramNameExLabel.Enabled := OverviewCheckBox.Checked;
end;

{ Event Handlers }

procedure TRevEngWizardForm.HandleTVItemSelectedChanged(Sender: TObject; Item: TElTreeItem);
begin
  UpdateUIStatesSelectPackagePage;
end;

procedure TRevEngWizardForm.HandleReverseStepPassed(Sender: TObject; Step: PReverseStep);
begin
  ReportReverseStep(Step);
  Application.ProcessMessages;
end;

procedure TRevEngWizardForm.HandleReverseProgressed(Sender: TObject; Percent: Integer);
begin
  ReverseProgressbar.Position := Percent;
  Application.ProcessMessages;
end;

procedure TRevEngWizardForm.HandleFileParsing(Sender: TObject; FileName: string; Index, Total: Integer; Success: Boolean = True);
begin
  ReportParseState(FileName, psParsing, Index, Total);
  MessageSubLabel.Caption := FileName;
  Application.ProcessMessages;
end;

procedure TRevEngWizardForm.HandleFileParsed(Sender: TObject; FileName: string; Index, Total: Integer; Success: Boolean = True);
begin
  if Success then
    ReportParseState(FileName, psParsed, Index, Total)
  else
    ReportParseState(FileName, psError, Index, Total);
  Application.ProcessMessages;
end;

procedure TRevEngWizardForm.HandleUMLElementAdded(Sender: TObject; Element: IUMLElement);
begin
  MessageSubLabel.Caption := Format(TXT_ELEMENT_CREATED, [Element.GetClassName, Element.Name]);
  Application.ProcessMessages;
end;

procedure TRevEngWizardForm.HandleUMLViewAdded(Sender: TObject; View: IView; Index, Total: Integer);
begin
  Application.ProcessMessages;
end;

procedure TRevEngWizardForm.HandleUMLDiagramCreate(Sender: TObject; Diagram: IUMLDiagram; Index, Total: Integer);
begin
  MessageSubLabel.Caption := Format(TXT_DIAGRAM_CREATED, [Index, Total, Diagram.Name]);
  Application.ProcessMessages;
end;

// TReverseWizardForm
/////////////////////////////////////////////////////////////////////////////

// event handlers for form
procedure TRevEngWizardForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(GetDllPath + '\' + NLS_FILE_NAME);
  NLSManager.TranslateComponent(Self, []);
end;

procedure TRevEngWizardForm.FormShow(Sender: TObject);
begin
  InitProc;
end;

procedure TRevEngWizardForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinishProc;
  Action := caFree;
end;

// event handlers for SelectSourceFilePage
procedure TRevEngWizardForm.ShellTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  UpdateUIStatesSelectSourceFilePage;
end;

procedure TRevEngWizardForm.ShellListViewAddFolder(Sender: TObject;
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
    if LowerCase(FileExt) = '.java' then
      CanAdd := True
    else
      CanAdd := False;
  end;
end;

procedure TRevEngWizardForm.ShellListViewChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  UpdateUIStatesSelectSourceFilePage;
end;

procedure TRevEngWizardForm.ShellListViewDblClick(Sender: TObject);
begin
  if ShellListView.Selected <> nil then
    AddButtonClick(AddButton);
end;

procedure TRevEngWizardForm.ShellListViewEnter(Sender: TObject);
begin
  UpdateUIStatesSelectSourceFilePage;
end;

procedure TRevEngWizardForm.ShellListViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #1 then ShellListView.SelectAll;
end;

procedure TRevEngWizardForm.AddButtonClick(Sender: TObject);
begin
  IsOnAddFile := True;
  UpdateUIStatesSelectSourceFilePage;
  try
    AddFiles;
  finally
    IsOnAddFile := False;
    UpdateUIStatesSelectSourceFilePage;
  end;
end;

procedure TRevEngWizardForm.AddAllButtonClick(Sender: TObject);
begin
  if ShellTreeView.SelectedFolder.IsFolder then begin
    IsOnAddFile := True;
    UpdateUIStatesSelectSourceFilePage;
    try
      AddFilesInDirectory(ShellTreeview.SelectedFolder.PathName);
    finally
      IsOnAddFile := False;
      UpdateUIStatesSelectSourceFilePage;
    end;
  end;
end;

procedure TRevEngWizardForm.RemoveButtonClick(Sender: TObject);
begin
  RemoveFiles;
  UpdateUIStatesSelectSourceFilePage;
end;

procedure TRevEngWizardForm.SelectSourceFilePageEnterPage(Sender: TObject;
  const Page: TJvWizardCustomPage);
begin
  UpdateUIStatesSelectSourceFilePage;
end;

procedure TRevEngWizardForm.SourceFileListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  UpdateUIStatesSelectSourceFilePage;
end;

procedure TRevEngWizardForm.SourceFileListViewEnter(Sender: TObject);
begin
  UpdateUIStatesSelectSourceFilePage;
end;

procedure TRevEngWizardForm.ShellTreeViewEnter(Sender: TObject);
begin
  UpdateUIStatesSelectSourceFilePage;
end;

procedure TRevEngWizardForm.SourceFileListViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #1 then SourceFileListView.SelectAll;
end;

procedure TRevEngWizardForm.SourceFileListViewDblClick(Sender: TObject);
begin
  if SourceFileListView.Selected <> nil then
    RemoveButtonClick(RemoveButton);
end;

procedure TRevEngWizardForm.SelectSourceFilePageCancelButtonClick(
  Sender: TObject; var Stop: Boolean);
begin
  Stop := not QueryCancel;
  if IsOnAddFile then
    IsOnAddFile := Stop;
end;

// event handlers for SelectPackagePage
procedure TRevEngWizardForm.SelectPackagePageEnterPage(Sender: TObject;
  const Page: TJvWizardCustomPage);
begin
  UpdateUIStatesSelectPackagePage;
end;

procedure TRevEngWizardForm.SelectPackagePageCancelButtonClick(
  Sender: TObject; var Stop: Boolean);
begin
  Stop := not QueryCancel;
end;

// event handlers for SetupOptionPage
procedure TRevEngWizardForm.SetupOptionPageEnterPage(Sender: TObject;
  const Page: TJvWizardCustomPage);
begin
  RevWizard.ButtonNext.Caption := TXT_EXECUTE + '(&R)';
  UpdateUIStatesSetupOptionPage;
end;

procedure TRevEngWizardForm.SetupOptionPageExitPage(Sender: TObject;
  const Page: TJvWizardCustomPage);
begin
  RevWizard.ButtonNext.Caption := TXT_NEXT + '(&N)';
end;

procedure TRevEngWizardForm.OverviewCheckBoxClick(Sender: TObject);
begin
  UpdateUIStatesSetupOptionPage;
end;

procedure TRevEngWizardForm.SetupOptionPageCancelButtonClick(
  Sender: TObject; var Stop: Boolean);
begin
  Stop := not QueryCancel;
end;

// event handlers for RunPage
procedure TRevEngWizardForm.RunPagePage(Sender: TObject);
begin
  RevWizard.ButtonFinish.Caption := TXT_STOP + '(&S)';
  IsOnReverse := True;
  try
    DoReverse;
  finally
    IsOnReverse := False;
    RevWizard.ButtonFinish.Caption := TXT_FINISH + '(&F)';
  end;    
end;

procedure TRevEngWizardForm.RunPageFinishButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  if IsOnReverse then begin
    if QueryCancel then begin
      AbortReverse;
      IsOnReverse := False;
    end;
    Stop := True;
  end
  else
    Stop := False;
end;

end.
