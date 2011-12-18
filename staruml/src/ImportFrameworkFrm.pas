unit ImportFrameworkFrm;

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
  FrwMgr, Core,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ImgList, ToolWin, FlatPanel;

const
  DEFAULT_FRAMEWORK_ICON_INDEX = 0;

type
  TImportFrameworkForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel: TBevel;
    FrameworksListView: TListView;
    FrameworksLabel: TLabel;
    DescriptionLabel: TLabel;
    HelpButton: TButton;
    FrameworksLargeImageList: TImageList;
    DefaultFrameworkIconImage: TImage;
    ToolBar: TToolBar;
    LargeIconButton: TToolButton;
    SmallIconButton: TToolButton;
    ToolbarImageList: TImageList;
    FrameworksSmallImageList: TImageList;
    DescPanel: TFlatPanel;
    DescriptionMemo: TMemo;
    procedure FrameworksListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure IconButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HelpButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure UpdateUIState;
    procedure AddFramework(AFramework: PFramework);
    function GetFrameworkName: string;
  public
    procedure UpdateFrameworks;
    function Execute: Boolean;
    procedure SaveToRegistry;
    procedure LoadFromRegistry;
    property FrameworkName: string read GetFrameworkName;
  end;

const
  //RK_LOCATION = '\SOFTWARE\StarUML\';
  RK_LOCATION = RK_BASE_LOCATION;
  RK_IMPORTFRAMEWORK = 'Import Framework Dialog';

var
  ImportFrameworkForm: TImportFrameworkForm;

implementation

uses
  Registry, HtmlHlp, NLS;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TImportFrameworkForm

procedure TImportFrameworkForm.FrameworksListViewChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  UpdateUIState;
end;

procedure TImportFrameworkForm.UpdateUIState;
begin
  OkButton.Enabled := (FrameworksListView.Selected <> nil);
  if FrameworksListView.Selected = nil then
    DescriptionMemo.Text := ''
  else
    DescriptionMemo.Text := PFramework(FrameworksListView.Selected.Data).Description;
end;

procedure TImportFrameworkForm.AddFramework(AFramework: PFramework);
var
  L: TListItem;
  Icon: TIcon;
  ImgIndex: Integer;
begin
  if FileExists(AFramework.FileName) then begin
    ImgIndex := DEFAULT_FRAMEWORK_ICON_INDEX;
    if FileExists(AFramework.IconFileName) and (UpperCase(ExtractFileExt(AFramework.IconFileName)) = '.ICO') then begin
      Icon := TIcon.Create;
      try
        Icon.LoadFromFile(AFramework.IconFileName);
        ImgIndex := FrameworksLargeImageList.AddIcon(Icon);
        FrameworksSmallImageList.AddIcon(Icon);
      except
        ImgIndex := DEFAULT_FRAMEWORK_ICON_INDEX;
      end;
      Icon.Free;
    end;
    L := FrameworksListView.Items.Add;
    L.Caption := AFramework.DisplayName;
    L.Data := AFramework;
    L.ImageIndex := ImgIndex;
  end;
end;

function TImportFrameworkForm.GetFrameworkName: string;
var
  L: TListItem;
begin
  L := FrameworksListView.Selected;
  if L = nil then
    Result := ''
  else
    Result := PFramework(L.Data).Name;
end;

procedure TImportFrameworkForm.UpdateFrameworks;
var
  I: Integer;
begin
  FrameworksListView.Clear;
  FrameworksLargeImageList.Clear;
  FrameworksSmallImageList.Clear;
  FrameworksLargeImageList.AddIcon(DefaultFrameworkIconImage.Picture.Icon);
  FrameworksSmallImageList.AddIcon(DefaultFrameworkIconImage.Picture.Icon);
  for I := 0 to FrameworkManager.FrameworkCount - 1 do
    AddFramework(FrameworkManager.Frameworks[I]);
end;

function TImportFrameworkForm.Execute: Boolean;
begin
  UpdateFrameworks;
  Result := (ShowModal = mrOk);
end;

procedure TImportFrameworkForm.SaveToRegistry;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(RK_LOCATION + RK_IMPORTFRAMEWORK, True) then
    begin
      Reg.WriteBool('SmallIcon', SmallIconButton.Down);
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TImportFrameworkForm.LoadFromRegistry;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(RK_LOCATION + RK_IMPORTFRAMEWORK, False) then
    begin
      if Reg.ReadBool('SmallIcon') then
        IconButtonClick(SmallIconButton)
      else
        IconButtonClick(LargeIconButton);
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

// TImportFrameworkForm
////////////////////////////////////////////////////////////////////////////////

procedure TImportFrameworkForm.IconButtonClick(Sender: TObject);
begin
  if Sender = LargeIconButton then
  begin
    FrameworksListView.ViewStyle := vsIcon;
    SmallIconButton.Down := False;
    LargeIconButton.Down := True;
  end
  else if Sender = SmallIconButton then
  begin
    FrameworksListView.ViewStyle := vsReport;
    SmallIconButton.Down := True;
    LargeIconButton.Down := False;
  end
end;

procedure TImportFrameworkForm.FormShow(Sender: TObject);
begin
  LoadFromRegistry;
end;

procedure TImportFrameworkForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveToRegistry;
end;

procedure TImportFrameworkForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

procedure TImportFrameworkForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\IMPORTFW.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

end.
