unit ColEdtFrm;

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
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, ExtDlgs;

type
  // enumerations
  PItemTypeKind = (itFile, itImageFile);

  // TCollectionEditorForm
  TCollectionEditorForm = class(TForm)
    CollectionPageControl: TPageControl;
    CollectionTabSheet: TTabSheet;
    TagColToolBar: TToolBar;
    AddButton: TToolButton;
    DeleteButton: TToolButton;
    MoveUpButton: TToolButton;
    MoveDownButton: TToolButton;
    CollectionListView: TListView;
    ColImageList: TImageList;
    AcceptButton: TButton;
    CancelButton: TButton;
    OpenPictureDialog: TOpenPictureDialog;
    OpenDialog: TOpenDialog;
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CollectionListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    FItemType: PItemTypeKind;
    function GetTitle: string;
    procedure SetTitle(Value: string);
    function GetCollectionName: string;
    procedure SetCollectionName(Value: string);
    function GetItemCount: Integer;
    function GetItem(Index: Integer): string;
    procedure UpdateUIStates;
  public
    procedure ClearItems;
    procedure AddItem(Value: string);
    function Execute: Boolean;
    property ItemType: PItemTypeKind read FItemType write FItemType;
    property Title: string read GetTitle write SetTitle;
    property CollectionName: string read GetCollectionName write SetCollectionName;
    property ItemCount: Integer read GetItemCount;
    property Items[Index: Integer]: string read GetItem;
  end;

implementation

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TCollectionEditorForm

function TCollectionEditorForm.GetTitle: string;
begin
  Result := Caption;
end;

procedure TCollectionEditorForm.SetTitle(Value: string);
begin
  Caption := Value;
end;

function TCollectionEditorForm.GetCollectionName: string;
begin
  Result := CollectionTabSheet.Caption;
end;

procedure TCollectionEditorForm.SetCollectionName(Value: string);
begin
  CollectionTabSheet.Caption := Value;
end;

function TCollectionEditorForm.GetItemCount: Integer;
begin
  Result := CollectionListView.Items.Count;
end;

function TCollectionEditorForm.GetItem(Index: Integer): string;
begin
  Result := CollectionListView.Items[Index].Caption;
end;

procedure TCollectionEditorForm.UpdateUIStates;
begin
  DeleteButton.Enabled := (CollectionListView.Selected <> nil);
end;

procedure TCollectionEditorForm.ClearItems;
begin
  CollectionListView.Items.Clear;
end;

procedure TCollectionEditorForm.AddItem(Value: string);
var
  L: TListItem;
begin
  L := CollectionListView.Items.Add;
  L.Caption := Value;
end;

function TCollectionEditorForm.Execute: Boolean;
begin
  Result := (ShowModal = mrOk);
end;

// TCollectionEditorForm
////////////////////////////////////////////////////////////////////////////////

procedure TCollectionEditorForm.AddButtonClick(Sender: TObject);
var
  L: TListItem;
  I: Integer;
begin
  case ItemType of
    itFile:
      begin
        if OpenDialog.Execute then
          for I := 0 to OpenDialog.Files.Count - 1 do begin
            L := CollectionListView.Items.Add;
            L.Caption := OpenDialog.Files[I];
          end;
      end;
    itImageFile:
      begin
        if OpenPictureDialog.Execute then
          for I := 0 to OpenPictureDialog.Files.Count - 1 do begin
            L := CollectionListView.Items.Add;
            L.Caption := OpenPictureDialog.Files[I];
          end;
      end;
  end;
end;

procedure TCollectionEditorForm.DeleteButtonClick(Sender: TObject);
begin
  CollectionListView.DeleteSelected;
end;

procedure TCollectionEditorForm.FormShow(Sender: TObject);
begin
  UpdateUIStates;
end;

procedure TCollectionEditorForm.CollectionListViewChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  UpdateUIStates;
end;

end.
