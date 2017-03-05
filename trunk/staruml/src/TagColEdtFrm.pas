unit TagColEdtFrm;

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
  ExtCore,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, ImgList, StdCtrls;

const
  DEFAULT_REFERENCETYPE = 'ExtensibleModel';

type
  // exceptions
  EInvalidTagType = class(Exception);

  // events
  PCollectionTaggedValueEvent = procedure(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
    ATagDefintionSetName: string; AName: string; Value: PExtensibleModel) of object;
  PChangeCollectionTaggedValueOrderEvent = procedure(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
    ATagDefintionSetName: string; AName: string; Value: PExtensibleModel; NewIdx: Integer) of object;

  TTaggedValueCollectionEditorForm = class(TForm)
    CloseButton: TButton;
    TagColImageList: TImageList;
    TagColPageControl: TPageControl;
    TagColTabSheet: TTabSheet;
    TagColToolBar: TToolBar;
    AddButton: TToolButton;
    DeleteButton: TToolButton;
    MoveUpButton: TToolButton;
    MoveDownButton: TToolButton;
    TagColListView: TListView;
    procedure FormCreate(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure TagColListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure MoveUpButtonClick(Sender: TObject);
    procedure MoveDownButtonClick(Sender: TObject);
  private
    FModel: PExtensibleModel;
    FTagDefinition: PTagDefinition;
    FReadOnly: Boolean;
    FOnAddCollectionTaggedValue: PCollectionTaggedValueEvent;
    FOnRemoveCollectionTaggedValue: PCollectionTaggedValueEvent;
    FOnChangeCollectionTaggedValueOrder: PChangeCollectionTaggedValueOrderEvent;
    function Initialized: Boolean;
    procedure SetReadOnly(Value: Boolean);
    procedure SetImageList(Value: TImageList);
    function GetProfile: PProfile;
    function GetTagDefinitionSet: PTagDefinitionSet;
    procedure AddCollectionTaggedValue(AValue: PExtensibleModel);
    procedure RemoveCollectionTaggedValue(AValue: PExtensibleModel);
    procedure ChangeCollectionTaggedValueOrder(AValue: PExtensibleModel; NewIdx: Integer);
    procedure UpdateUIState;
  public
    procedure ShowTaggedValueCollection(AModel: PExtensibleModel; ATagDefinition: PTagDefinition);
    procedure UpdateTaggedValueCollection;
    property Model: PExtensibleModel read FModel;
    property TagDefinition: PTagDefinition read FTagDefinition;
    property ImageList: TImageList write SetImageList;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property OnAddCollectionTaggedValue: PCollectionTaggedValueEvent
      read FOnAddCollectionTaggedValue write FOnAddCollectionTaggedValue;
    property OnRemoveCollectionTaggedValue: PCollectionTaggedValueEvent
      read FOnRemoveCollectionTaggedValue write FOnRemoveCollectionTaggedValue;
    property OnChangeCollectionTaggedValueOrder: PChangeCollectionTaggedValueOrderEvent
      read FOnChangeCollectionTaggedValueOrder write FOnChangeCollectionTaggedValueOrder;
  end;

var
  TaggedValueCollectionEditorForm: TTaggedValueCollectionEditorForm;

implementation

{$R *.dfm}

uses
  UMLAux, ElemLstFrm, NLS, NLS_StarUML;

////////////////////////////////////////////////////////////////////////////////
// TTaggedValueCollectionEditorForm

procedure TTaggedValueCollectionEditorForm.FormCreate(Sender: TObject);
begin
  FModel := nil;
  FTagDefinition := nil;
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\TAGCOLED.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

function TTaggedValueCollectionEditorForm.Initialized: Boolean;
begin
  Result := (FModel <> nil) and (FTagDefinition <> nil);
end;

procedure TTaggedValueCollectionEditorForm.SetReadOnly(Value: Boolean);
begin
  FReadOnly := Value;
  UpdateUIState;
end;

procedure TTaggedValueCollectionEditorForm.SetImageList(Value: TImageList);
begin
  TagColListView.SmallImages := Value;
end;

function TTaggedValueCollectionEditorForm.GetProfile: PProfile;
begin
  Result := GetTagDefinitionSet.Profile;
end;

function TTaggedValueCollectionEditorForm.GetTagDefinitionSet: PTagDefinitionSet;
begin
  Result := FTagDefinition.TagDefinitionSet;
end;

procedure TTaggedValueCollectionEditorForm.AddCollectionTaggedValue(AValue: PExtensibleModel);
begin
  if Assigned(FOnAddCollectionTaggedValue) then
    FOnAddCollectionTaggedValue(Self, FModel, GetProfile.Name, GetTagDefinitionSet.Name, FTagDefinition.Name, AValue);
end;

procedure TTaggedValueCollectionEditorForm.RemoveCollectionTaggedValue(AValue: PExtensibleModel);
begin
  if Assigned(FOnRemoveCollectionTaggedValue) then
    FOnRemoveCollectionTaggedValue(Self, FModel, GetProfile.Name, GetTagDefinitionSet.Name, FTagDefinition.Name, AValue);
end;

procedure TTaggedValueCollectionEditorForm.ChangeCollectionTaggedValueOrder(AValue: PExtensibleModel; NewIdx: Integer);
begin
  if Assigned(FOnChangeCollectionTaggedValueOrder) then
    FOnChangeCollectionTaggedValueOrder(Self,FModel, GetProfile.Name, GetTagDefinitionSet.Name, FTagDefinition.Name, AValue, NewIdx);
end;

procedure TTaggedValueCollectionEditorForm.UpdateUIState;
var
  IsWritable: Boolean;
begin
  IsWritable := (not FReadOnly) and (FTagDefinition <> nil) and (not FTagDefinition.Lock);
  AddButton.Enabled := IsWritable;
  DeleteButton.Enabled := (TagColListView.Selected <> nil) and IsWritable;
  MoveUpButton.Enabled := (TagColListView.Selected <> nil) and (TagColListView.ItemIndex > 0) and IsWritable;
  MoveDownButton.Enabled := (TagColListView.Selected <> nil) and (TagColListView.ItemIndex < TagColListView.Items.Count - 1) and IsWritable;
end;

procedure TTaggedValueCollectionEditorForm.ShowTaggedValueCollection(AModel: PExtensibleModel; ATagDefinition: PTagDefinition);
begin
  FModel := AModel;
  FTagDefinition := ATagDefinition;
  if FTagDefinition.TagType <> tkCollection then
    raise EInvalidTagType.Create(ERR_INVALID_TAG_TYPE);
  TagColTabSheet.Caption := FTagDefinition.Name;
  UpdateTaggedValueCollection;
  ShowModal;
  FModel := nil;
  FTagDefinition := nil;
end;

procedure TTaggedValueCollectionEditorForm.UpdateTaggedValueCollection;
var
  T: PTaggedValue;
  V: PExtensibleModel;
  L: TListItem;
begin
  if not Initialized then Exit;
  TagColListView.Clear;
  T := FModel.FindTaggedValue(GetProfile.Name, GetTagDefinitionSet.Name, FTagDefinition.Name);
  if Assigned(T) then begin
    for V in T.ReferenceValues do begin
      L := TagColListView.Items.Add;
      L.Caption := V.Name;
      L.ImageIndex := GetUMLElementImageIndex(V);
      L.Data := V;
    end;
  end;
  UpdateUIState;
end;

// event handlers
procedure TTaggedValueCollectionEditorForm.AddButtonClick(Sender: TObject);
begin
  ElementListForm.ClearListElements;
  if FTagDefinition.ReferenceType = '' then
    ElementListForm.AddListElementsByClass(DEFAULT_REFERENCETYPE, True)
  else
    ElementListForm.AddListElementsByClass(FTagDefinition.ReferenceType, True);
  ElementListForm.AllowNull := False;
  if ElementListForm.Execute(TXT_COLL_TAGGED_VALUE) then begin
    AddCollectionTaggedValue(ElementListForm.SelectedModel as PExtensibleModel);
  end;
end;

procedure TTaggedValueCollectionEditorForm.DeleteButtonClick(Sender: TObject);
begin
  if TagColListView.Selected <> nil then
    RemoveCollectionTaggedValue(PExtensibleModel(TagColListView.Selected.Data));
end;

procedure TTaggedValueCollectionEditorForm.MoveUpButtonClick(Sender: TObject);
begin
  if (TagColListView.Selected <> nil) and (TagColListView.ItemIndex > 0) then
    ChangeCollectionTaggedValueOrder(PExtensibleModel(TagColListView.Selected.Data),
      TagColListView.ItemIndex - 1);
end;

procedure TTaggedValueCollectionEditorForm.MoveDownButtonClick(Sender: TObject);
begin
  if (TagColListView.Selected <> nil) and (TagColListView.ItemIndex < TagColListView.Items.Count - 1) then
    ChangeCollectionTaggedValueOrder(PExtensibleModel(TagColListView.Selected.Data),
      TagColListView.ItemIndex + 1);
end;

procedure TTaggedValueCollectionEditorForm.TagColListViewSelectItem(
  Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  UpdateUIState;
end;

// TTaggedValueCollectionEditorForm
////////////////////////////////////////////////////////////////////////////////

end.
