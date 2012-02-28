unit NewProjFrm;

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
  ApprMgr, Core,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls,  ImgList, ToolWin, FlatPanel, FileCtrl,
  {dxPageControl,} {cxPC,} ShellCtrls, Buttons;

const
  DEFAULT_APPROACH_ICON_INDEX = 0;
  DEFAULT_PROJECTFILE_EXT = '.uml';

type
  // Enumeration type
  PProjectActionKind = (akNew, akOpen, akRecent);

  // Event Type
  PRecentFileDeleteEvent = procedure (Sender: TObject; RecentFile: string) of object;

  // TNewProjectForm
  TNewProjectForm = class(TForm)
    ApproachesLargeImageList: TImageList;
    ApproachesSmallImageList: TImageList;
    ToolbarImageList: TImageList;
    NewProjectPageControl: TPageControl;
    ApproachesPage: TTabSheet;
    FileOpenPage: TTabSheet;
    RFileOpenPage: TTabSheet;
    DescriptionLabel: TLabel;
    DescPanel: TFlatPanel;
    DescriptionMemo: TMemo;
    ApproachesListView: TListView;
    SelectApproachCheckBox: TCheckBox;
    ToolBar: TToolBar;
    LargeIconButton: TToolButton;
    SmallIconButton: TToolButton;
    ShellTreeView: TShellTreeView;
    ShellListView: TShellListView;
    RecentListView: TListView;
    FileNoExitDeleteButton: TSpeedButton;
    FileRecentAllDeleteButton: TSpeedButton;
    BlankApproachImage: TImage;
    DefaultApproachIconImage: TImage;
    AcceptButton: TButton;
    CancelButton: TButton;
    HelpButton: TButton;
    FolderLabel: TLabel;
    FileListLabel: TLabel;
    ApproachListLabel: TLabel;
    RecentFileListLabel: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ApproachesListViewChange(Sender: TObject;
      Item: TListItem; Change: TItemChange);
    procedure ApproachesListViewDblClick(Sender: TObject);
    procedure RecentListViewDblClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure ShellListViewDblClick(Sender: TObject);
    procedure RecentListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ShellListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ShellListViewAddFolder(Sender: TObject;
      AFolder: TShellFolder; var CanAdd: Boolean);
    procedure AcceptButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FileNoExitDeleteButtonClick(Sender: TObject);
    procedure FileRecentAllDeleteButtonClick(Sender: TObject);
    procedure NewProjectPageControlChange(Sender: TObject);
    procedure SelectApproachCheckBoxClick(Sender: TObject);
    procedure LargeIconButtonClick(Sender: TObject);
    procedure SmallIconButtonClick(Sender: TObject);
    procedure ShellTreeViewChange(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
    FFileName: string;
    FProjectActionKind: PProjectActionKind;
    FDefaultApproachName: string;
    FDefaultApproachNameBuffer: string;
    FNumberOfRecentProjects: Integer;
    FNumberOfRecentProjectsCount: Integer;
    FOnRecentFileDelete: PRecentFileDeleteEvent;
    procedure AddApproach(AApproach: PApproach);
    procedure AddBlankApproach;
    function GetApproachName: string;
    procedure SetFileName(const Value: string);
    procedure SetDefaultApproachName(Value: string);
    procedure SetDefaultApproachSelection;
    procedure SetNumberOfRecentProjects(Value: Integer);
    procedure OptionRecentFileDelete(Value: Integer);
    procedure DeleteNotExistenceRecentFiles;
    procedure DeleteAllRecentFiles;
    procedure AcceptAction;
    procedure CancelAction;
    procedure UpdateApproachDesciption;
    procedure UpdateAcceptButtonCaption;
    procedure UpdateUIStates;
    procedure UpdateUIStatesApproachesPage;
    procedure UpdateUIStatesFileOpenPage;
    procedure UpdateUIStatesRFileOpenPage;
  public
    { Public declarations }
    procedure UpdateApproaches;
    function Execute: Boolean;
    procedure SaveToRegistry;
    procedure LoadFromRegistry;
    procedure AddRecentFile(FileName: string);
    property ProjectActionKind: PProjectActionKind read FProjectActionKind;
    property ApproachName: string read GetApproachName;
    property FileName: string read FFileName write SetFileName;
    property DefaultApproachName: string read FDefaultApproachName write SetDefaultApproachName;
    property NumberOfRecentProjects: Integer read FNumberOfRecentProjects write SetNumberOfRecentProjects;
    property OnRecentFileDelete: PRecentFileDeleteEvent read FOnRecentFileDelete write FOnRecentFileDelete;
  end;

const
  //RK_LOCATION = '\SOFTWARE\StarUML\';
  RK_LOCATION = RK_BASE_LOCATION;
  RK_NEWPROJECT_DIALOG = 'New Project Dialog';
  RK_NEWPROJECT = 'New Project';
  RK_RECENT_FILES = 'Recent Files';
  RK_RECENT_FILE_COUNT = 'RecentFileCount';

var
  NewProjectForm: TNewProjectForm;

implementation

uses
  Registry, HtmlHlp,
  NLS, NLS_StarUML;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TNewProjectForm

procedure TNewProjectForm.AddApproach(AApproach: PApproach);
var
  L: TListItem;
  Icon: TIcon;
  ImgIndex: Integer;
begin
  if FileExists(AApproach.FileName) then begin
    ImgIndex := DEFAULT_APPROACH_ICON_INDEX;
    if FileExists(AApproach.IconFileName) and (UpperCase(ExtractFileExt(AApproach.IconFileName)) = '.ICO') then begin
      Icon := TIcon.Create;
      try
        Icon.LoadFromFile(AApproach.IconFileName);
        ImgIndex := ApproachesLargeImageList.AddIcon(Icon);
        ApproachesSmallImageList.AddIcon(Icon);
      except
        ImgIndex := DEFAULT_APPROACH_ICON_INDEX;
      end;
      Icon.Free;
    end;
    L := ApproachesListView.Items.Add;
    L.Caption := AApproach.DisplayName;
    L.Data := AApproach;
    L.ImageIndex := ImgIndex;
  end;
end;

procedure TNewProjectForm.AddBlankApproach;
var
  L: TListItem;
  ImgIndex: Integer;
begin
  ImgIndex := ApproachesLargeImageList.AddIcon(BlankApproachImage.Picture.Icon);
  ApproachesSmallImageList.AddIcon(BlankApproachImage.Picture.Icon);
  L := ApproachesListView.Items.Add;
  L.Caption := TXT_BLANK_APPROACH;
  L.Data := nil;
  L.ImageIndex := ImgIndex;
end;

function TNewProjectForm.GetApproachName: string;
var
  L: TListItem;
begin
  L := ApproachesListView.Selected;
  if L = nil then
    Result := ''
  else if L.Data = nil then
    Result := ''
  else
    Result := PApproach(L.Data).Name;
end;

procedure TNewProjectForm.SetFileName(const Value: string);
begin
  FFileName := Value;
end;

procedure TNewProjectForm.SetDefaultApproachName(Value: string);
begin
  if FDefaultApproachName <> Value then FDefaultApproachName := Value;
  FDefaultApproachNameBuffer := Value;
end;

procedure TNewProjectForm.SetDefaultApproachSelection;
begin
  if (ApproachesListView.Selected <> nil) and
     (ApproachesListView.Selected.Data <> nil) then
  begin
    if SelectApproachCheckBox.Checked then
      FDefaultApproachNameBuffer := PApproach(ApproachesListView.Selected.Data).Name
    else
      FDefaultApproachNameBuffer := '';
  end;
end;

procedure TNewProjectForm.SetNumberOfRecentProjects(Value: Integer);
begin
  if FNumberOfRecentProjects <> Value then begin
    if (FNumberOfRecentProjects > Value) then OptionRecentFileDelete(Value);
    FNumberOfRecentProjects := Value;
  end;
end;

procedure TNewProjectForm.OptionRecentFileDelete(Value: Integer);
var
  DeleteCount, I: Integer;
  L: TListItem;
begin
  DeleteCount := Value - FNumberOfRecentProjectsCount;
  for I := RecentListView.Items.Count -1 downto DeleteCount do begin
    L := RecentListView.Items.Item[I];
    if L <> nil then L.Delete;
  end;
end;

procedure TNewProjectForm.DeleteNotExistenceRecentFiles;
var
  L: TListItem;
  I: Integer;
  RecentFile, RecentPath: string;
begin
  for I := RecentListView.Items.Count - 1 downto 0 do begin
    L := RecentListView.Items.Item[I];
    RecentFile := L.Caption;
    RecentPath := L.SubItems.Strings[0];
    if Not FileExists(RecentPath + RecentFile) then begin
      if Assigned(FOnRecentFileDelete) then FOnRecentFileDelete(Self, RecentPath + RecentFile);
      L.Delete;
    end;
  end;
end;

procedure TNewProjectForm.DeleteAllRecentFiles;
var
  L: TListItem;
  I: Integer;
  RecentFile, RecentPath: string;
begin
  for I := RecentListView.Items.Count - 1 downto 0 do begin
    L := RecentListView.Items.Item[I];
    RecentFile := L.Caption;
    RecentPath := L.SubItems.Strings[0];
    if Assigned(FOnRecentFileDelete) then FOnRecentFileDelete(Self, RecentPath + RecentFile );
  end;
  RecentListView.Clear;
end;

procedure TNewProjectForm.AcceptAction;
var
  Str : string;
  L: TListItem;
begin
  if NewProjectPageControl.ActivePage = ApproachesPage then
  begin
    SetDefaultApproachName(FDefaultApproachNameBuffer);
    FProjectActionKind := akNew;
  end
  else if NewProjectPageControl.ActivePage = FileOpenPage then
  begin
    SetFileName(ShellListView.SelectedFolder.PathName);
    FProjectActionKind := akOpen;
  end
  else if NewProjectPageControl.ActivePage = RFileOpenPage then
  begin
    if Assigned(RecentListView.Selected) then
    begin
      L := RecentListView.Selected;
      Str := L.SubItems[0];
      SetFileName(Str + L.Caption);
      FProjectActionKind := akRecent;
    end;
  end
end;

procedure TNewProjectForm.CancelAction;
begin
  if NewProjectPageControl.ActivePage = FileOpenPage then
    SetDefaultApproachName(FDefaultApproachName)
end;

procedure TNewProjectForm.UpdateApproachDesciption;
begin
  if ApproachesListView.Selected = nil then
    DescriptionMemo.Text := ''
  else if ApproachesListView.Selected.Data = nil then
    DescriptionMemo.Text := TXT_BLANK_APPROACH_DESC
  else
    DescriptionMemo.Text := PApproach(ApproachesListView.Selected.Data).Description;
end;

procedure TNewProjectForm.UpdateAcceptButtonCaption;
begin
  if NewProjectPageControl.ActivePage = ApproachesPage then
    AcceptButton.Caption := TXT_OK
  else if NewProjectPageControl.ActivePage = FileOpenPage then
    AcceptButton.Caption := TXT_OPEN
  else if NewProjectPageControl.ActivePage = RFileOpenPage then
    AcceptButton.Caption := TXT_OPEN;
end;

procedure TNewProjectForm.UpdateUIStates;
begin
  if NewProjectPageControl.ActivePage = ApproachesPage then
    UpdateUIStatesApproachesPage
  else if NewProjectPageControl.ActivePage = FileOpenPage then
    UpdateUIStatesFileOpenPage
  else if NewProjectPageControl.ActivePage = RFileOpenPage then
    UpdateUIStatesRFileOpenPage;
end;

procedure TNewProjectForm.UpdateUIStatesApproachesPage;
begin
  AcceptButton.Enabled := (ApproachesListView.Selected <> nil);
  SelectApproachCheckBox.Enabled := (ApproachesListView.Selected <> nil) and
    (ApproachesListView.Selected.Data <> nil);
  SelectApproachCheckBox.Checked := SelectApproachCheckBox.Enabled and
    (PApproach(ApproachesListView.Selected.Data).Name = FDefaultApproachNameBuffer);
  LargeIconButton.Down := (ApproachesListView.ViewStyle = vsIcon);
  SmallIconButton.Down := (ApproachesListView.ViewStyle = vsReport);
end;

procedure TNewProjectForm.UpdateUIStatesFileOpenPage;
begin
  AcceptButton.Enabled := (ShellListView.Selected <> nil);
end;

procedure TNewProjectForm.UpdateUIStatesRFileOpenPage;
begin
  AcceptButton.Enabled := (RecentListView.Selected <> nil);
end;

procedure TNewProjectForm.UpdateApproaches;
var
  I: Integer;
  ApprName: string;
  L, BlankAppr: TListItem;
begin
  ApproachesListView.Clear;
  ApproachesLargeImageList.Clear;
  ApproachesSmallImageList.Clear;
  ApproachesLargeImageList.AddIcon(DefaultApproachIconImage.Picture.Icon);
  ApproachesSmallImageList.AddIcon(DefaultApproachIconImage.Picture.Icon);

  for I := 0 to ApproachManager.ApproachCount - 1 do
    AddApproach(ApproachManager.Approaches[I]);
  AddBlankApproach;

  BlankAppr := nil;
  for I := 0 to ApproachesListView.Items.Count - 1 do begin
    L := ApproachesListView.Items.Item[I];
    if (PApproach(L.Data) <> nil) then begin
      ApprName := PApproach(L.Data).Name;
      if (ApprName = FDefaultApproachName) then
      begin
        L.Selected := True;
        SelectApproachCheckBox.Checked := True;
        Break;
      end;
    end
    else BlankAppr := L;
  end;

  if BlankAppr <> nil then begin
    BlankAppr.Selected := True;
    SetDefaultApproachName('');
  end;
end;

function TNewProjectForm.Execute: Boolean;
begin
  UpdateApproaches;
  Result := (ShowModal = mrOk);
end;

procedure TNewProjectForm.SaveToRegistry;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    // store approach view option in registry
    if Reg.OpenKey(RK_LOCATION + RK_NEWPROJECT_DIALOG, True) then
    begin
      Reg.WriteBool('SmallIcon', SmallIconButton.Down);
      Reg.CloseKey;
    end;
    // store default approach in registry
    Reg.DeleteKey(RK_LOCATION + RK_NEWPROJECT);
    if Reg.OpenKey(RK_LOCATION + RK_NEWPROJECT, True) then
    begin
      Reg.WriteString('DefaultApproach', FDefaultApproachName);
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TNewProjectForm.LoadFromRegistry;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    RecentListView.Clear;
    // get approach view option from registry
    if Reg.OpenKey(RK_LOCATION + RK_NEWPROJECT_DIALOG, False) then
    begin
      if Reg.ReadBool('SmallIcon') then
        SmallIconButtonClick(SmallIconButton)
      else
        LargeIconButtonClick(LargeIconButton);
      Reg.CloseKey;
    end;
    // get default approach information from registry
    if Reg.OpenKey(RK_LOCATION + 'New Project', False) then
    begin
      SetDefaultApproachName(Reg.ReadString('DefaultApproach'));
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TNewProjectForm.AddRecentFile(FileName: string);
var
  L, LI: TListItem;
  RecentFile, RecentPath: string;
  I: Integer;
begin
  // PRECONDITION
  //Assert(RecentListView.Items.Count <= FNumberOfRecentProjects);
  // PRECONDITION

  if (FileName <> '') then
  begin
    RecentFile := ExtractFileName(FileName);
    RecentPath := ExtractFilePath(FileName);

    if RecentListView.Items.Count < FNumberOfRecentProjects then
    begin
      for I := 0 to RecentListView.Items.Count - 1 do
      begin
        L := RecentListView.Items.Item[I];
        if (L.Caption = RecentFile) and (L.SubItems.Strings[0] = RecentPath) then
        begin
          L.Delete;
          Break;
        end;
      end;
      LI := RecentListView.Items.Insert(0);
      LI.Caption := RecentFile;
      LI.SubItems.Append(RecentPath);
    end
    else if RecentListView.Items.Count = FNumberOfRecentProjects then
    begin
      for I := 0 to RecentListView.Items.Count - 1 do
      begin
        L := RecentListView.Items.Item[I];
        if (L.Caption = RecentFile) and (L.SubItems.Strings[0] = RecentPath) then
        begin
          L.Delete;
          LI := RecentListView.Items.Insert(0);
          LI.Caption := RecentFile;
          LI.SubItems.Append(RecentPath);
          Exit;
        end;
      end;

      if RecentListView.Items.Count > 0 then
        RecentListView.Items.Item[RecentListView.Items.Count - 1].Delete;
      LI := RecentListView.Items.Insert(0);
      LI.Caption := RecentFile;
      LI.SubItems.Append(RecentPath);
    end;
  end;
end;

// TNewProjectForm
////////////////////////////////////////////////////////////////////////////////

procedure TNewProjectForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\NEWPRJ.LNG');
  NLSManager.TranslateComponent(Self, []);
  SetDefaultApproachName('');
  LoadFromRegistry;
end;

procedure TNewProjectForm.FormDestroy(Sender: TObject);
begin
  SaveToRegistry;
end;

procedure TNewProjectForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

{ Event Handlers for NewProjectForm }

procedure TNewProjectForm.AcceptButtonClick(Sender: TObject);
begin
  AcceptAction;
end;

procedure TNewProjectForm.CancelButtonClick(Sender: TObject);
begin
  CancelAction;
end;

{ Event Handlers for NewProjectPageControl }

procedure TNewProjectForm.NewProjectPageControlChange(Sender: TObject);
begin
  UpdateAcceptButtonCaption;
  UpdateUIStates;
end;

{ Event Handlers for ApproachesPage }

procedure TNewProjectForm.ApproachesListViewChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  UpdateUIStates;
  UpdateApproachDesciption;
end;

procedure TNewProjectForm.ApproachesListViewDblClick(Sender: TObject);
begin
  if AcceptButton.Enabled then
    AcceptButton.Click;
end;

procedure TNewProjectForm.SelectApproachCheckBoxClick(Sender: TObject);
begin
  SetDefaultApproachSelection;
end;

procedure TNewProjectForm.LargeIconButtonClick(Sender: TObject);
begin
  ApproachesListView.ViewStyle := vsIcon;
  UpdateUIStates;
end;

procedure TNewProjectForm.SmallIconButtonClick(Sender: TObject);
begin
  ApproachesListView.ViewStyle := vsReport;
  UpdateUIStates;
end;

{ Event Handlers for FileOpenPage }

procedure TNewProjectForm.ShellListViewAddFolder(Sender: TObject;
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
    if LowerCase(FileExt) = DEFAULT_PROJECTFILE_EXT then
      CanAdd := True;
  end;
end;

procedure TNewProjectForm.ShellTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  UpdateUIStates;
end;

procedure TNewProjectForm.ShellListViewChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  UpdateUIStates;
end;

procedure TNewProjectForm.ShellListViewDblClick(Sender: TObject);
begin
  if AcceptButton.Enabled then
    AcceptButton.Click;
end;

{ Event Handlers for RFileOpenPage }

procedure TNewProjectForm.RecentListViewChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  UpdateUIStates;
end;

procedure TNewProjectForm.RecentListViewDblClick(Sender: TObject);
begin
  if AcceptButton.Enabled then
    AcceptButton.Click;
end;

procedure TNewProjectForm.FileRecentAllDeleteButtonClick(Sender: TObject);
begin
  DeleteAllRecentFiles;
end;

procedure TNewProjectForm.FileNoExitDeleteButtonClick(Sender: TObject);
begin
  DeleteNotExistenceRecentFiles;
end;

end.
