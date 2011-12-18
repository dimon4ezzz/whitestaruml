unit ElemLstFrm;

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
  BasicClasses, Core, UMLModels,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, FlatPanel;

type
  TElementListForm = class(TForm)
    ElementListView: TListView;
    OKButton: TButton;
    CancelButton: TButton;
    SepBevel: TBevel;
    NotSpecCheckBox: TCheckBox;
    HelpButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ElementListViewClick(Sender: TObject);
    procedure NotSpecCheckBoxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ElementListViewDblClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
  private
    FAllowNull: Boolean;
    ElementList: TStringList;
    FReservedModelToSelect: PModel;
    procedure SetAllowNull(Value: Boolean);
    procedure SetImageList(Value: TImageList);
    function NotSpecified: Boolean;
    function GetSelectedModel: PModel;
    function GetListItem(AModel: PModel): TListItem;
    procedure UpdateElementListView;
    procedure UpdateUIStates;
    function GetExpression(AModel: PModel): string;
  public
    procedure ClearListElements;
    procedure AddListElement(AModel: PModel);
    procedure AddListElementsByCollection(AModel: PModel; CollectionName: string; CollectInherited: Boolean = False);
    procedure AddListElementsByClass(MetaClassName: string; InclusiveInstance: Boolean = False);
    procedure SetReservedModelToSelect(AModel: PModel);
    function Execute(Title: string = ''): Boolean;
    property AllowNull: Boolean read FAllowNull write SetAllowNull;
    property SelectedModel: PModel read GetSelectedModel;
    property ImageList: TImageList write SetImageList;
  end;

  // Utilities
  function ExtractHeadPath(Pathname: string): string;

var
  ElementListForm: TElementListForm;

implementation

uses
  UMLAux, HtmlHlp, NLS, NLS_StarUML;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TElementListForm

procedure TElementListForm.FormCreate(Sender: TObject);
begin
  ElementList := TStringList.Create;
  FAllowNull := True;
  FReservedModelToSelect := nil;
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\ELEMLST.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

procedure TElementListForm.FormDestroy(Sender: TObject);
begin
  ElementList.Free;
end;

procedure TElementListForm.FormShow(Sender: TObject);
var Item: TListItem;
begin
  NotSpecCheckBox.Checked := False;
  if FReservedModelToSelect <> nil then begin
    ElementListView.SetFocus;
    Item := GetListItem(FReservedModelToSelect);
    if Item <> nil then ElementListView.Selected := Item;
    FReservedModelToSelect := nil;
    UpdateUIStates;
  end;
end;

procedure TElementListForm.ElementListViewClick(Sender: TObject);
begin
  UpdateUIStates;
end;

procedure TElementListForm.ElementListViewDblClick(Sender: TObject);
begin
  UpdateUIStates;
  if OkButton.Enabled then
    OkButton.Click;
end;

procedure TElementListForm.NotSpecCheckBoxClick(Sender: TObject);
begin
  if not NotSpecified then
    ElementListView.Selected := nil;
  UpdateUIStates;
end;

procedure TElementListForm.UpdateElementListView;
var
  I: Integer;
  L: TListItem;
begin
  ElementListView.Items.BeginUpdate;
  ElementListView.Items.Clear;
  for I := 0 to ElementList.Count - 1 do
  begin
    L := ElementListView.Items.Add;
    L.Caption := ElementList.Strings[I];
    L.Data := ElementList.Objects[I];
    L.ImageIndex := GetUMLElementImageIndex(ElementList.Objects[I] as PModel);
  end;
  ElementListview.Items.EndUpdate;
end;

procedure TElementListForm.UpdateUIStates;
begin
  ElementListView.Enabled := not NotSpecified;
  if NotSpecified then
    ElementListView.Color := clBtnFace
  else
    ElementListView.Color := clWindow;
  OkButton.Enabled := NotSpecified
    or ((not NotSpecified) and (ElementListView.Selected <> nil));
end;

function TElementListForm.GetExpression(AModel: PModel): string;
begin
  if AModel is PUMLModelElement then
    Result := UMLElementToExpression(AModel as PUMLModelElement, True, False, True, True)
  else
    Result := AModel.Name;
end;

procedure TElementListForm.ClearListElements;
begin
  ElementList.Clear;
end;

procedure TElementListForm.AddListElement(AModel: PModel);
begin
  ElementList.AddObject(GetExpression(AModel), AModel);
end;

procedure TElementListForm.AddListElementsByCollection(AModel: PModel; CollectionName: string; CollectInherited: Boolean = False);
var
  Items: POrderedSet;
  I: Integer;
  M: PModel;

begin
  Items := POrderedSet.Create;
  try
    Items.Clear;
    if CollectInherited then
      CollectAllInheritedItems(AModel as PUMLGeneralizableElement, CollectionName, Items)
    else
      CollectAllItems(AModel, CollectionName, Items);
    for I := 0 to Items.Count - 1 do
    begin
      M := Items.Items[I] as PModel;
      ElementList.AddObject(GetExpression(M), M);
    end;
  finally
    Items.Free;
  end;
end;

procedure TElementListForm.AddListElementsByClass(MetaClassName: string; InclusiveInstance: Boolean = False);
var
  MC: PMetaClass;
  I: Integer;
  M: PModel;
begin
  MC := MetaModel.FindMetaClass(MetaClassName);
  if MC <> nil then
  begin
    if InclusiveInstance then
      for I := 0 to MC.InclusiveInstanceCount - 1 do
      begin
        M := MC.InclusiveInstances[I] as PModel;
        ElementList.AddObject(GetExpression(M), M);
      end
    else
      for I := 0 to MC.InstanceCount - 1 do
      begin
        M := MC.Instances[I] as PModel;
        ElementList.AddObject(GetExpression(M), M);
      end;
  end;
end;

procedure TElementListForm.SetReservedModelToSelect(AModel: PModel);
begin
  if FReservedModelToSelect <> AModel then FReservedModelToSelect := AModel;
end;

procedure TElementListForm.SetAllowNull(Value: Boolean);
begin
  if FAllowNull <> Value then
  begin
    FAllowNull := Value;
    NotSpecCheckBox.Visible := FAllowNull;
  end;
end;

procedure TElementListForm.SetImageList(Value: TImageList);
begin
  ElementListView.SmallImages := Value;
end;

function TElementListForm.NotSpecified: Boolean;
begin
  Result := NotSpecCheckBox.Checked;
end;

function TElementListForm.GetSelectedModel: PModel;
var
  L: TListItem;
begin
  Result := nil;
  if NotSpecified then Exit;
  L := ElementListView.Selected;
  if (L <> nil) and (L.Data <> nil) then Result := L.Data
end;

function TElementListForm.GetListItem(AModel: PModel): TListItem;
var
  I: Integer;
  Item: TListItem;
begin
  Result := nil;
  for I := 0 to ElementListView.Items.Count - 1 do begin
    Item := ElementListView.Items[I];
    if Item.Data = AModel then begin
      Result := Item;
      Break;
    end;
  end;
end;

function TElementListForm.Execute(Title: string = ''): Boolean;
begin
  UpdateElementListView;
  UpdateUIStates;
  if Title = '' then Caption := MSG_ELEMSELECTOR_DEFAULT_TITLE
                else Caption := Title;
  Result := (ShowModal = mrOk);
end;

// TElementListForm
////////////////////////////////////////////////////////////////////////////////

function ExtractHeadPath(Pathname: string): string;

  function SubExtract(P: string): string;
  var
    Idx: Integer;
  begin
    Idx := Pos(PATH_DELIMITER, P);
    if Idx = 0 then
      Result := ''
    else
      Result := '::' + ExtractHeadName(P) + SubExtract(ExtractTailPath(P));
  end;

begin
  Result := SubExtract(ExtractTailPath(Pathname));
end;

procedure TElementListForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

end.
