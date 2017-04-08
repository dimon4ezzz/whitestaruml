unit MessageFrame;

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
  Core,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, ExtCtrls, FlatPanel, SaveDialogEx, Menus, MenuManager;

type
  // Enumeration Types
  PInfoMessageKind = (mkGeneral, mkFindResult, mkVerificationResult);

  // TMessagePanel
  TMessagePanel = class(TFrame)
    MessageListView: TListView;
    ClientPanel: TFlatPanel;
    MessageImageList: TImageList;
    SaveMessagesDialog: TSaveDialogEx;
    procedure MessageListViewDblClick(Sender: TObject);
    procedure MessageListViewContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FrameResize(Sender: TObject);
    procedure InformationMessagesButtonClick(Sender: TObject);
  private
    FPopupMenu: TContextMenuHandle;
    FOnBrowseElement: PModelEvent;
    FOnInformationMessagesButtonClicked: TNotifyEvent;
  public
    procedure ClearAllMessages;
    procedure ClearMessages(Kind: PInfoMessageKind);
    procedure AddMessage(Kind: PInfoMessageKind; Text: string; ElementLink: PElement);
    procedure SaveMessages(FileName: string);
    procedure DeleteMessagesLinkedTo(ElementLink: PElement);
    property PopupMenu: TContextMenuHandle read FPopupMenu write FPopupMenu;
    property OnBrowseElement: PModelEvent read FOnBrowseElement write FOnBrowseElement;
    property OnInformationMessagesButtonClicked: TNotifyEvent write FOnInformationMessagesButtonClicked;
  end;

implementation

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TMessagePanel

procedure TMessagePanel.ClearAllMessages;
begin
  MessageListView.Clear;
end;

procedure TMessagePanel.ClearMessages(Kind: PInfoMessageKind);
var
  I: Integer;
  LI: TListItem;
begin
  for I := MessageListView.Items.Count - 1 downto 0 do begin
    LI := MessageListView.Items.Item[I];
    if LI.ImageIndex = Ord(Kind) then
      MessageListView.Items.Delete(I);
  end;
end;

procedure TMessagePanel.AddMessage(Kind: PInfoMessageKind; Text: string; ElementLink: PElement);
var
  Item: TListItem;
begin
  Item := MessageListView.Items.Add;
  Item.ImageIndex := Ord(Kind);
  Item.Caption := Text;
  Item.Data := ElementLink;
end;

procedure TMessagePanel.SaveMessages(FileName: string);
var
  I: Integer;
  Strings: TStringList;
begin
  Strings := TStringList.Create;
  for I := 0 to MessageListView.Items.Count - 1 do
    Strings.Add(MessageListView.Items.Item[I].Caption);
  Strings.SaveToFile(FileName);
  Strings.Free;
end;

procedure TMessagePanel.DeleteMessagesLinkedTo(ElementLink: PElement);
var
  I: Integer;
  LI: TListItem;
begin
  for I := MessageListView.Items.Count - 1 downto 0 do begin
    LI := MessageListView.Items.Item[I];
    If LI.Data = ElementLink then
      MessageListView.Items.Delete(I);
  end;
end;

// TMessagePanel
////////////////////////////////////////////////////////////////////////////////

procedure TMessagePanel.MessageListViewDblClick(Sender: TObject);
begin
  if (MessageListView.Selected <> nil) and (MessageListView.Selected.Data <> nil) then
    if Assigned(FOnBrowseElement) then FOnBrowseElement(Self, MessageListView.Selected.Data);
end;

procedure TMessagePanel.MessageListViewContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  if Assigned(FPopupMenu) then FPopupMenu.PopupFromCursorPos;
end;

procedure TMessagePanel.FrameResize(Sender: TObject);
begin
  MessageListView.Refresh;
end;

procedure TMessagePanel.InformationMessagesButtonClick(Sender: TObject);
begin
  if Assigned(FOnInformationMessagesButtonClicked) then FOnInformationMessagesButtonClicked(Sender);
end;

end.
