unit AddInMgrFrm;

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
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Vcl.Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  AddInMgr, ImgList;

type
  // TAddInMgrForm
  TAddInMgrForm = class(TForm)
    DescLabel: TLabel;
    AddInListView: TListView;
    SepBevel: TBevel;
    OKButton: TButton;
    CancelButton: TButton;
    AddInImages: TImageList;
    HelpButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
  private
    HintWidth: Integer;
    OldHintWindowClass: THintWindowClass;
    OldShowHintEventHandler: TShowHintEvent;
    FOnMessage: PAddInRelMsgOccuredEvent;
    procedure MakeListViewItem(AnAddIn: PAddIn);
    procedure DisplayListItemHint(Sender: TObject; Item: TListItem; var InfoTip: string);
    procedure FormShowHintHandler(var HintStr: string; var CanShow: Boolean; var HintInfo: Vcl.Controls.THintInfo);
  public
    property OnMessage: PAddInRelMsgOccuredEvent write FOnMessage;
  end;

  // PAddInMgrHintWindow
  PAddInMgrHintWindow = class(THintWindow)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  AddInMgrForm: TAddInMgrForm;
const
  HINT_FONT_SIZE = 10;

implementation

uses
  Math, HtmlHlp, NLS;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TAddInMgrForm

procedure TAddInMgrForm.MakeListViewItem(AnAddIn: PAddIn);
var
  AddInName: string;
  AddInVersion: string;
  AnItem: TListItem;
  ImageIndex: Integer;
begin
  try
    AddInName := AnAddIn.DisplayName;
    AddInVersion:= AnAddIn.Version;
    AnItem := AddInListView.Items.Add;
    AnItem.Caption := AddInName;
    AnItem.Checked := AnAddIn.IsActive;
    AnItem.SubItems.Add(AddInVersion);
    AnItem.Data := AnAddIn;
    AnItem.ImageIndex := -1;
    if Assigned(AnAddIn.Icon) then begin
      ImageIndex := AddInImages.AddIcon(AnAddIn.Icon);
      AnItem.ImageIndex := ImageIndex;
    end;
  except on Exception do
    if Assigned(FOnMessage) then FOnMessage('Internal Error');
  end;
end;

procedure TAddInMgrForm.DisplayListItemHint(Sender: TObject; Item: TListItem; var InfoTip: string);
var
  Str, TempStr: string;
  AddIn: PAddIn;
  MaxWidth: Integer;
  OldSize: Integer;
begin
  if Assigned(Item) then begin
    AddIn := Item.Data;
    if Assigned(AddIn) then begin
      OldSize := Canvas.Font.Size;
      Canvas.Font.Size := HINT_FONT_SIZE;
      TempStr := 'Add-In Name - ' + AddIn.AddInName;
      MaxWidth := Canvas.TextWidth(TempStr);
      Str := TempStr + #13;
      TempStr := 'Display Name - ' + AddIn.DisplayName;
      MaxWidth := Max(MaxWidth, Canvas.TextWidth(TempStr));
      Str := Str + TempStr + #13;
      TempStr := 'Company - ' + AddIn.Company;
      MaxWidth := Max(MaxWidth, Canvas.TextWidth(TempStr));
      Str := Str + TempStr + #13;
      TempStr := 'Copyright - ' + AddIn.Copyright;
      MaxWidth := Max(MaxWidth, Canvas.TextWidth(TempStr));
      Str := Str + TempStr + #13;
      TempStr := 'Version - ' + AddIn.Version;
      MaxWidth := Max(MaxWidth, Canvas.TextWidth(TempStr));
      Str := Str + TempStr + #13;
      TempStr := 'COM Object - ' + AddIn.COMSvrName;
      MaxWidth := Max(MaxWidth, Canvas.TextWidth(TempStr));
      Str := Str + TempStr + #13;
      TempStr := 'Installed Dir - ' + AddIn.InstalledDir;
      MaxWidth := Max(MaxWidth, Canvas.TextWidth(TempStr));
      Str := Str + TempStr;
      InfoTip := Str;
      HintWidth := MaxWidth;
      Canvas.Font.Size := OldSize;
    end;
  end;
end;

procedure TAddInMgrForm.FormShowHintHandler(var HintStr: string; var CanShow: Boolean; var HintInfo: Vcl.Controls.THintInfo);
begin
  //HintInfo.HintColor := $9acd32;
  HintInfo.HintMaxWidth := HintWidth;
end;

// TAddInMgrForm
////////////////////////////////////////////////////////////////////////////////

procedure TAddInMgrForm.FormCreate(Sender: TObject);
begin
  AddInListView.OnInfoTip := DisplayListItemHint;
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\ADDINMGR.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

procedure TAddInMgrForm.FormShow(Sender: TObject);
var
  I: Integer;
  AnAddIn: PAddIn;
  OldShowHint: Boolean;
begin
  AddInListView.Clear;
  for I := 0 to AddInManager.AddInsCount - 1 do begin
    AnAddIn := AddInManager.AddIn[I] as PAddIn;
    MakeListViewItem(AnAddIn);
  end;
  // Hint customizing
  OldShowHint := Application.ShowHint;
  OldHintWindowClass := HintWindowClass;
  OldShowHintEventHandler := Application.OnShowHint;
  Application.ShowHint := False;
  Application.OnShowHint := FormShowHintHandler;
  HintWindowClass := PAddInMgrHintWindow;
  Application.ShowHint := OldShowHint;
end;

procedure TAddInMgrForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  OldShowHint: Boolean;
begin
  OldShowHint := Application.ShowHint;
  Application.ShowHint := False;
  if Assigned(OldHintWindowClass) then HintWindowClass := OldHintWindowClass;
  Application.OnShowHint := OldShowHintEventHandler;
  Application.ShowHint := OldShowHint;
end;

procedure TAddInMgrForm.OKButtonClick(Sender: TObject);
var
  I: Integer;
  AnItem: TListItem;
  AnAddIn: PAddIn;
begin
  try
    for I := 0 to AddInListView.Items.Count - 1 do begin
      AnItem := AddInListView.Items[I];
      AnAddIn := AnItem.Data;
      AnAddIn.IsActive := AnItem.Checked;
    end;
    Close;
  except on Exception do
    ShowMessage('Internal Error');
  end;
end;

procedure TAddInMgrForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

////////////////////////////////////////////////////////////////////////////////
// PAddInMgrHintWindow

constructor PAddInMgrHintWindow.Create(AOwner: TComponent);
begin
  inherited;
  Canvas.Font.Size := HINT_FONT_SIZE;
end;

// PAddInMgrHintWindow
////////////////////////////////////////////////////////////////////////////////

procedure TAddInMgrForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

end.
