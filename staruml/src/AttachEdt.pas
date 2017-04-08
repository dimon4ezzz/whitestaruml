unit AttachEdt;

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
  Core, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, ExtCtrls, FlatPanel, Menus, ToolWin, MenuManager;

type
  // Enumeration Types
  PAttachmentKind = (akFile, akURL, akElement);

  // Event Types
  PAttachmentOpenEvent = procedure(Sender: TObject; Attachment: string; Kind: PAttachmentKind) of object;
  PAttachmentAddEvent = procedure(Sender: TObject; AModel: PModel; Attachment: string) of object;
  PAttachmentDeleteEvent = procedure(Sender: TObject; AModel: PModel; Index: Integer) of object;
  PAttachmentChangeEvent = procedure(Sender: TObject; AModel: PModel; Index: Integer; Attachment: string) of object;
  PAttachmentOrderChangeEvent = procedure(Sender: TObject; AModel: PModel; Index: Integer; NewIndex: Integer) of object;
  PAttachmentSelectedEvent = procedure (Sender: TObject; SelectedIndex: Integer) of object;

  // TAttachmentEditor
  TAttachmentEditor = class(TFrame)
    AttachmentListView: TListView;
    SysFileIconImageList: TImageList;
    ListViewFileIconImageList: TImageList;
    AttachmentsImageList: TImageList;
    ClientPanel: TFlatPanel;
    BasicFileIconImageList: TImageList;
    AttachmentsToolbar: TToolBar;
    OpenAttachmentItem: TToolButton;
    AddAttachmentItem: TToolButton;
    DeleteAttachmentItem: TToolButton;
    EditAttachmentItem: TToolButton;
    MoveAttachmentUpItem: TToolButton;
    MoveAttachmentDownItem: TToolButton;
    procedure OpenAttachmentItemClick(Sender: TObject);
    procedure AddAttachmentItemClick(Sender: TObject);
    procedure DeleteAttachmentItemClick(Sender: TObject);
    procedure EditAttachmentItemClick(Sender: TObject);
    procedure MoveAttachmentUpItemClick(Sender: TObject);
    procedure MoveAttachmentDownItemClick(Sender: TObject);
    procedure AttachmentListViewContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure AttachmentListViewDblClick(Sender: TObject);
  private
    FTargetModel: PModel;
    FPopupMenu: TContextMenuHandle;
    FReadOnly: Boolean;
    FOnAttachmentOpen: PAttachmentOpenEvent;
    FOnAttachmentAdd: PAttachmentAddEvent;
    FOnAttachmentDelete: PAttachmentDeleteEvent;
    FOnAttachmentChange: PAttachmentChangeEvent;
    FOnAttachmentOrderChange: PAttachmentOrderChangeEvent;
    FOnAttachmentSelected: PAttachmentSelectedEvent;
    FInspectorAttachmentOpen: TMenuElementHandle;
    FInspectorAttachmentAdd: TMenuElementHandle;
    FInspectorAttachmentEdit: TMenuElementHandle;
    FInspectorAttachmentDelete: TMenuElementHandle;
    FInspectorAttachmentMoveUp: TMenuElementHandle;
    FInspectorAttachmentMoveDown: TMenuElementHandle;
    //FTotalImageList: TImageList;
    procedure SetTargetModel(Value: PModel);
    function IndexOf(Value: string): Integer;
    function IsURL(Str: string): Boolean;
    procedure AppendAttachment(Value: string);
    procedure ListViewChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure EnterHandler(Sender: TObject);
    procedure SetReadOnly(Value: Boolean);
    function GetSelectedIndex: Integer;
    procedure UpdateAttachmentPopupMenuStatus;
    procedure UpdateUIState;
    procedure SetImageList(Value: TCustomImageList);
  protected
    procedure SetEnabled(Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Inspect;
    procedure UpdateAttachments;
    procedure SetFocusOnAttachmentList;
    procedure OpenAttachment;
    procedure AddAttachment;
    procedure DeleteAttachment;
    procedure EditAttachment;
    procedure MoveUpItem;
    procedure MoveDownItem;
    procedure InitializeUserInterface;
    //procedure SetTotalImageList(AImageList: TImageList);
    property TargetModel: PModel read FTargetModel write SetTargetModel;
    property SelectedIndex: Integer read GetSelectedIndex;
    property PopupMenu: TContextMenuHandle read FPopupMenu write FPopupMenu;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property OnAttachmentOpen: PAttachmentOpenEvent read FOnAttachmentOpen write FOnAttachmentOpen;
    property OnAttachmentAdd: PAttachmentAddEvent read FOnAttachmentAdd write FOnAttachmentAdd;
    property OnAttachmentDelete: PAttachmentDeleteEvent read FOnAttachmentDelete write FOnAttachmentDelete;
    property OnAttachmentChange: PAttachmentChangeEvent read FOnAttachmentChange write FOnAttachmentChange;
    property OnAttachmentOrderChange: PAttachmentOrderChangeEvent read FOnAttachmentOrderChange write FOnAttachmentOrderChange;
    property OnAttachmentSelected: PAttachmentSelectedEvent read FOnAttachmentSelected write FOnAttachmentSelected;
    property ImageList: TCustomImageList write SetImageList;
  end;

  // Utility functions
  function GetModelFromGuid(aValue: string): PModel;
  function GetModelCaption(AModel: PModel): string;
  function GetModelParamsFromGuid(aValue: string;
    var aModelCaption: string; var aModelUrl: string): Boolean;
  function GetModelUrlFromGuid(aValue: string): string;

implementation

{$R *.dfm}

uses
  MainFrm, AttachItemEdtFrm,
  ShellAPI, StarUMLApp;

const
  APPENDED_ICON_COUNT = 3;
  ICON_IDX_UNKNOWN = 0;
  ICON_IDX_URL = 1;
  ICON_IDX_ELEMENT = 2;
  //ELEMENT_MARK = 'element://';


// Utility functions
procedure ReplaceModelNameWithGuid(var Attachment: string);
var
  M: PModel;
begin
  if IsElement(Attachment) then begin
    M := StarUMLApplication.Project.FindByRelativePathname
      (Copy(Attachment, Length(ELEMENT_MARK)+1, Length(Attachment) - Length(ELEMENT_MARK)));
    if M <> nil then
      Attachment := ELEMENT_MARK + M.GUID;
  end;
  end;

function GetModelFromGuid(aValue: string): PModel;
var
  ElementId: string;
begin
  Result := nil;
  if IsElement(aValue) then begin

    ElementId := Copy(aValue, Length(ELEMENT_MARK)+1, Length(aValue)
      - Length(ELEMENT_MARK));

    // Is it GUID?
    Result := MetaModel.FindInstanceByGuid(ElementId) as PModel;
    if Result = nil then  // Not Guid, try to decode it as relative path
      Result := StarUMLApplication.Project.FindByRelativePathname(ElementId);
  end;
end;

function GetModelUrl(AModel: PModel): string;
begin
  if Assigned(AModel) then
    Result := ELEMENT_MARK + ExtractTailPath(AModel.Pathname)
  else
    Result := '';
end;

function GetModelCaption(AModel: PModel): string;
begin
  if Assigned(AModel) then
    Result := AModel.Name + ' (' + AModel.MetaClass.Name + ')'
  else
    Result := ''
end;

function GetModelParamsFromGuid(aValue: string;
  var aModelCaption: string; var aModelUrl: string): Boolean;
var
  M: PModel;
begin
  M := GetModelFromGuid(aValue);
  if Assigned(M) then begin
    aModelCaption := GetModelCaption(M);
    aModelUrl := GetModelUrl(M);
    Result := True;
  end
  else
    Result := False;

end;

function GetModelUrlFromGuid(aValue: string): string;
var
  M: PModel;
begin
  M := GetModelFromGuid(aValue);
  Result := GetModelUrl(M);
 end;


////////////////////////////////////////////////////////////////////////////////
// TAttachmentEditor

constructor TAttachmentEditor.Create(AOwner: TComponent);
begin
  inherited;
  //InitializeUserInterface;

end;

procedure TAttachmentEditor.InitializeUserInterface;
var
  FileInfo: TSHFileInfo;
  ImageListHandle: THandle;
begin
  ImageListHandle := SHGetFileInfo('',
                           0,
                           FileInfo,
                           SizeOf(FileInfo),
                           SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  SysFileIconImageList.Handle := ImageListHandle;
  SysFileIconImageList.Width := GetSystemMetrics(SM_CXSMICON);
  SysFileIconImageList.Height := GetSystemMetrics(SM_CYSMICON);

  AttachmentListView.DoubleBuffered := True;
  AttachmentListView.OnContextPopup := AttachmentListViewContextPopup;
  AttachmentListView.OnEnter := EnterHandler;
  AttachmentListView.OnChange := ListViewChange;

  //AttachListViewPopupMenu.Images := MainForm.TotalImageList;

  FInspectorAttachmentOpen := MainForm.MenuManager.GetPredefinedElement(INSPECTOR_ATTACHMENT_OPEN);
  FInspectorAttachmentOpen.OnClick := OpenAttachmentItemClick;
  FInspectorAttachmentAdd := MainForm.MenuManager.GetPredefinedElement(INSPECTOR_ATTACHMENT_ADD);
  FInspectorAttachmentAdd.OnClick := AddAttachmentItemClick;
  FInspectorAttachmentEdit := MainForm.MenuManager.GetPredefinedElement(INSPECTOR_ATTACHMENT_EDIT);
  FInspectorAttachmentEdit.OnClick := EditAttachmentItemClick;
  FInspectorAttachmentDelete := MainForm.MenuManager.GetPredefinedElement(INSPECTOR_ATTACHMENT_DELETE);
  FInspectorAttachmentDelete.OnClick := DeleteAttachmentItemClick;
  FInspectorAttachmentMoveUp := MainForm.MenuManager.GetPredefinedElement(INSPECTOR_ATTACHMENT_MOVE_UP);
  FInspectorAttachmentMoveUp.OnClick := MoveAttachmentUpItemClick;
  FInspectorAttachmentMoveDown := MainForm.MenuManager.GetPredefinedElement(INSPECTOR_ATTACHMENT_MOVE_DOWN);
  FInspectorAttachmentMoveDown.OnClick := MoveAttachmentDownItemClick;

end;

{procedure TAttachmentEditor.SetTotalImageList(AImageList: TImageList);
begin
  //AttachListViewPopupMenu.Images := AImageList
end;}

procedure TAttachmentEditor.SetTargetModel(Value: PModel);
begin
  if Visible then
    FTargetModel := Value
   else
    FTargetModel := nil;
end;

function TAttachmentEditor.IndexOf(Value: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to AttachmentListView.Items.Count - 1 do
    if AttachmentListView.Items[I].SubItems[0] = Value then begin
      Result := I;
      Exit;
    end;
end;

function TAttachmentEditor.IsURL(Str: string): Boolean;
begin
  Result := (Pos('://', Str) > 0);
end;

procedure TAttachmentEditor.AppendAttachment(Value: string);
var
  FileInfo: TSHFileInfo;
  ListItem: TListItem;
  ItemCaption: string;
  ItemUrl: string;
  AreParamsOk: Boolean;
begin
  ListItem := AttachmentListView.Items.Add;

  if IsElement(Value) then begin
    AreParamsOk := GetModelParamsFromGuid(Value, ItemCaption, ItemUrl);
    if AreParamsOk then begin
      ListItem.Caption := ItemCaption;
      Value := ItemUrl;
    end
    else
      ListItem.Caption := '(element does not exist)';

    ListItem.ImageIndex := ICON_IDX_ELEMENT;
  end
  else if IsURL(Value) then begin
    ListItem.Caption := Value;
    ListItem.ImageIndex := ICON_IDX_URL;
  end
  else if FileExists(Value) then begin
    ListItem.Caption := ExtractFileName(Value);
    SHGetFileInfo(PChar(Value), 0, FileInfo, SizeOf(FileInfo), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
    ListItem.ImageIndex := FileInfo.iIcon + APPENDED_ICON_COUNT;
  end
  else begin
    ListItem.Caption := Value;
    ListItem.ImageIndex := ICON_IDX_UNKNOWN;
  end;
  ListItem.SubItems.Add(Value);
end;

procedure TAttachmentEditor.ListViewChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  if Assigned(FOnAttachmentSelected) then
    FOnAttachmentSelected(Self, Item.Index);
  UpdateUIState;
end;

procedure TAttachmentEditor.EnterHandler(Sender: TObject);
begin
  if Assigned(OnEnter) then OnEnter(Sender);
end;

procedure TAttachmentEditor.SetReadOnly(Value: Boolean);
begin
  FReadOnly := Value;
  UpdateUIState;
end;

function TAttachmentEditor.GetSelectedIndex: Integer;
begin
  if AttachmentListView.Selected <> nil then
    Result := AttachmentListView.Selected.Index
  else
    Result := -1;
end;

procedure TAttachmentEditor.SetEnabled(Value: Boolean);
begin
  inherited;
  UpdateUIState;
end;

procedure TAttachmentEditor.UpdateAttachmentPopupMenuStatus;
var
  M, S: Boolean;
  C: Integer;
begin

  M := TargetModel <> nil;
  S := SelectedIndex > -1;
  C := 0;
  if TargetModel <> nil then
    C := TargetModel.Attachments.Count;
  //MainForm.BarManager.LockUpdate := True;
  MainForm.MenuManager.Updating := True;
  {MainForm.InspectorAttachmentOpen.Enabled := Enabled and S;
  MainForm.InspectorAttachmentAdd.Enabled := Enabled and (not ReadOnly) and M;
  MainForm.InspectorAttachmentEdit.Enabled := Enabled and (not ReadOnly) and M and S;
  MainForm.InspectorAttachmentDelete.Enabled := Enabled and (not ReadOnly) and M and S;
  MainForm.InspectorAttachmentMoveUp.Enabled := Enabled and (not ReadOnly) and M and S and (SelectedIndex > 0);
  MainForm.InspectorAttachmentMoveDown.Enabled := Enabled and (not ReadOnly) and M and S and (SelectedIndex < C - 1);}
  FInspectorAttachmentOpen.Enabled := Enabled and S;
  FInspectorAttachmentAdd.Enabled := Enabled and (not ReadOnly) and M;
  FInspectorAttachmentEdit.Enabled := Enabled and (not ReadOnly) and M and S;
  FInspectorAttachmentDelete.Enabled := Enabled and (not ReadOnly) and M and S;
  FInspectorAttachmentMoveUp.Enabled := Enabled and (not ReadOnly) and M and S and (SelectedIndex > 0);
  FInspectorAttachmentMoveDown.Enabled := Enabled and (not ReadOnly) and M and S and (SelectedIndex < C - 1);
  //MainForm.BarManager.LockUpdate := False;
  MainForm.MenuManager.Updating := False;
  {PopupOpen.Enabled := Enabled and S;
  PopupAdd.Enabled := Enabled and (not ReadOnly) and M;
  PopupEdit.Enabled := Enabled and (not ReadOnly) and M and S;
  PopupDelete.Enabled := Enabled and (not ReadOnly) and M and S;
  PopupMoveUp.Enabled := Enabled and (not ReadOnly) and M and S and (SelectedIndex > 0);
  PopupMoveDown.Enabled := Enabled and (not ReadOnly) and M and S and (SelectedIndex < C - 1);}
end;

procedure TAttachmentEditor.UpdateUIState;
var
  Openable: Boolean;
  M, S: Boolean;
  C: Integer;
begin
  M := (TargetModel <> nil);
  S := (SelectedIndex > -1);
  C := 0;
  if TargetModel <> nil then
    C := TargetModel.Attachments.Count;
  //AttachmentsToolbar.BeginUpdate;
  Openable := (AttachmentListView.Selected <> nil)
    and (IsURL(AttachmentListView.Selected.Caption) or FileExists(AttachmentListView.Selected.Caption));
  OpenAttachmentItem.Enabled := Enabled and S and Openable;
  AddAttachmentItem.Enabled := Enabled and (not ReadOnly) and M;
  EditAttachmentItem.Enabled := Enabled and (not ReadOnly) and M and S;
  DeleteAttachmentItem.Enabled := Enabled and (not ReadOnly) and M and S;
  MoveAttachmentUpItem.Enabled := Enabled and (not ReadOnly) and M and S and (SelectedIndex > 0);
  MoveAttachmentDownItem.Enabled := Enabled and (not ReadOnly) and M and S and (SelectedIndex < C - 1);
  //AttachmentsToolbar.EndUpdate;
  if Enabled then
    AttachmentListView.Color := clWindow
  else
    AttachmentListView.Color := clBtnFace;
  AttachmentListView.Enabled := Enabled;
  // Update PopupMenu
  UpdateAttachmentPopupMenuStatus;
end;

procedure TAttachmentEditor.Inspect;
begin
  if Visible then
    UpdateAttachments;
end;

procedure TAttachmentEditor.UpdateAttachments;
var
  I: Integer;
begin
  AttachmentListView.Clear;
  if FTargetModel <> nil then
    for I := 0 to FTargetModel.Attachments.Count - 1 do
    begin
      AppendAttachment(FTargetModel.Attachments[I]);
    end;
  ListViewFileIconImageList.Assign(BasicFileIconImageList);
  ListViewFileIconImageList.AddImages(SysFileIconImageList);
  UpdateUIState;
  if FTargetModel <> nil then
    ReadOnly := FTargetModel.ReadOnly
  else
    ReadOnly := True;
end;

procedure TAttachmentEditor.SetFocusOnAttachmentList;
begin
  // Is AttachmentsDockPanel inside tab panel?
  if (MainForm.AttachmentsDockPanel.TabContainer <> nil) then begin
    // Set AttachmentsDockPanel active panel
    MainForm.AttachmentsDockPanel.TabContainer.ActiveChild :=
      MainForm.AttachmentsDockPanel;
  end;
  // Now focus can be set
  if MainForm.AttachmentsDockPanel.Visible then
    AttachmentListView.SetFocus;
end;

procedure TAttachmentEditor.OpenAttachment;
var
  Attachment: string;
  Kind: PAttachmentKind;
begin
  if AttachmentListView.ItemIndex <> -1 then begin
    Attachment := AttachmentListView.Selected.SubItems[0];
    if IsElement(Attachment) then begin
      Kind := akElement;
      Attachment := Copy(Attachment, 11, Length(Attachment) - 10);
    end
    else if IsURL(Attachment) then
      Kind := akURL
    else
      Kind := akFile;
    if Assigned(FOnAttachmentOpen) then
      FOnAttachmentOpen(Self, Attachment, Kind);
  end;
end;

procedure TAttachmentEditor.AddAttachment;
var
  Attachment: string;
begin
  AttachmentItemEditForm.Location := 'http://';
  if AttachmentItemEditForm.Execute then begin
    if AttachmentListView.Visible then
      AttachmentListView.SetFocus;
    Attachment := AttachmentItemEditForm.Location;
    ReplaceModelNameWithGuid(Attachment);
  end;

  if Assigned(FOnAttachmentAdd) then
      FOnAttachmentAdd(Self, FTargetModel, Attachment);

  AttachmentListView.ItemIndex := AttachmentListView.Items.Count - 1;

end;

procedure TAttachmentEditor.DeleteAttachment;
var
  I: Integer;
begin
  if AttachmentListView.ItemIndex <> -1 then begin
    I := AttachmentListView.ItemIndex;
    AttachmentListView.DeleteSelected;
    if Assigned(FOnAttachmentDelete) then
      FOnAttachmentDelete(Self, FTargetModel, I);
    if I > AttachmentListView.Items.Count - 1 then
      AttachmentListView.ItemIndex := AttachmentListView.Items.Count - 1
    else
      AttachmentListView.ItemIndex := I;
  end;
end;

procedure TAttachmentEditor.EditAttachment;
var
  ListItem: TListItem;
  Attachment: string;
  I: Integer;
begin
  if AttachmentListView.ItemIndex <> -1 then begin
    I := AttachmentListView.ItemIndex;
    ListItem := AttachmentListView.Selected;
    AttachmentItemEditForm.Location := ListItem.SubItems[0];
    if AttachmentItemEditForm.Execute then begin
      Attachment := AttachmentItemEditForm.Location;
      ReplaceModelNameWithGuid(Attachment);
      if Assigned(FOnAttachmentChange) then
        FOnAttachmentChange(Self, FTargetModel, I, Attachment);
      AttachmentListView.ItemIndex := I;
    end;
  end;
end;

procedure TAttachmentEditor.MoveUpItem;
var
  I: Integer;
begin
  if AttachmentListView.ItemIndex <> -1 then begin
    I := AttachmentListView.ItemIndex;
    if (I >= 1) and (I <= AttachmentListView.Items.Count - 1) then
      if Assigned(FOnAttachmentOrderChange) then
        FOnAttachmentOrderChange(Self, FTargetModel, I, I - 1);
    AttachmentListView.ItemIndex := I - 1;
  end;
end;

procedure TAttachmentEditor.MoveDownItem;
var
  I: Integer;
begin
  if AttachmentListView.ItemIndex <> -1 then begin
    I := AttachmentListView.ItemIndex;
    if (I >= 0) and (I <= AttachmentListView.Items.Count - 2) then
      if Assigned(FOnAttachmentOrderChange) then
        FOnAttachmentOrderChange(Self, FTargetModel, I, I + 1);
    AttachmentListView.ItemIndex := I + 1;
  end;
end;

// Toolbar Event Handlers
procedure TAttachmentEditor.OpenAttachmentItemClick(Sender: TObject);
begin
  OpenAttachment;
end;

procedure TAttachmentEditor.AddAttachmentItemClick(Sender: TObject);
begin
  AddAttachment;
end;

procedure TAttachmentEditor.DeleteAttachmentItemClick(Sender: TObject);
begin
  DeleteAttachment;
end;

procedure TAttachmentEditor.EditAttachmentItemClick(Sender: TObject);
begin
  EditAttachment;
end;

procedure TAttachmentEditor.MoveAttachmentUpItemClick(Sender: TObject);
begin
  MoveUpItem;
end;

procedure TAttachmentEditor.MoveAttachmentDownItemClick(Sender: TObject);
begin
  MoveDownItem;
end;

// ListView Event handlers
procedure TAttachmentEditor.AttachmentListViewContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  if Assigned(FPopupMenu) then
    FPopupMenu.PopupFromCursorPos;
end;

procedure TAttachmentEditor.AttachmentListViewDblClick(Sender: TObject);
begin
  if AttachmentListView.Selected <> nil then begin
    OpenAttachment;
  end;
end;

procedure TAttachmentEditor.SetImageList(Value: TCustomImageList);
begin
  //AttachListViewPopupMenu.Images := Value;
end;


// TAttachmentEditor
////////////////////////////////////////////////////////////////////////////////

end.
