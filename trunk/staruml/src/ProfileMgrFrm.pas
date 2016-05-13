unit ProfileMgrFrm;

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
  Core, ExtCore,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ImgList, ToolWin, FlatPanel;
  
type
  // Events
  PProfileIncludeEvent = procedure(Sender: TObject; ProfileName: string) of object;
  PProfileExcludeEvent = procedure(Sender: TObject; ProfileName: string) of object;

  // TProfileManagerForm
  TProfileManagerForm = class(TForm)
    CloseButton: TButton;
    ExcludeButton: TButton;
    IncludeButton: TButton;
    AllProfilesLabel: TLabel;
    IncludedProfilesLabel: TLabel;
    Description: TLabel;
    SepBevel: TBevel;
    AllProfilesListView: TListView;
    IncludedProfilesListView: TListView;
    ProfilesSmallImageList: TImageList;
    DefaultProfileIconImage: TImage;
    ToolBar: TToolBar;
    LargeIconButton: TToolButton;
    SmallIconButton: TToolButton;
    ToolBarImageList: TImageList;
    ProfilesLargeImageList: TImageList;
    HelpButton: TButton;
    DescPanel: TFlatPanel;
    DescMemo: TMemo;
    procedure IncludeButtonClick(Sender: TObject);
    procedure ExcludeButtonClick(Sender: TObject);
    procedure AllProfilesListViewClick(Sender: TObject);
    procedure IncludedProfilesListViewClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure AllProfilesListViewDblClick(Sender: TObject);
    procedure IncludedProfilesListViewDblClick(Sender: TObject);
    procedure IconButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HelpButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AllProfilesListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure IncludedProfilesListViewChange(Sender: TObject;
      Item: TListItem; Change: TItemChange);
  private
    FOnProfileInclude: PProfileIncludeEvent;
    FOnProfileExclude: PProfileExcludeEvent;
    procedure UpdateUIState;
    procedure AddProfile(AProfile: PProfile);
    procedure UpdateProfiles;
    procedure IncludeProfile;
    procedure ExcludeProfile;
  public
    procedure ShowProfiles;
    procedure SaveToRegistry;
    procedure LoadFromRegistry;
    property OnProfileInclude: PProfileIncludeEvent read FOnProfileInclude write FOnProfileInclude;
    property OnProfileExclude: PProfileExcludeEvent read FOnProfileExclude write FOnProfileExclude;
  end;

const
  //RK_LOCATION = '\SOFTWARE\StarUML\';
  RK_LOCATION = RK_BASE_LOCATION;
  RK_PROFILEMANAGER = 'Profile Manager';

var
  ProfileManagerForm: TProfileManagerForm;

implementation

{$R *.dfm}

uses
  StarUMLApp, NLS, NLS_StarUML,
  Registry, HtmlHlp;

const
  DEFAULT_PROFILE_ICON_INDEX = 0;

////////////////////////////////////////////////////////////////////////////////
// TProfileManagerForm

procedure TProfileManagerForm.IncludeButtonClick(Sender: TObject);
begin
  IncludeProfile;
end;

procedure TProfileManagerForm.ExcludeButtonClick(Sender: TObject);
begin
  ExcludeProfile;
end;

procedure TProfileManagerForm.AllProfilesListViewClick(Sender: TObject);
begin
  IncludedProfilesListView.Selected := nil;
  UpdateUIState;
end;

procedure TProfileManagerForm.IncludedProfilesListViewClick(
  Sender: TObject);
begin
  AllProfilesListView.Selected := nil;
  UpdateUIState;
end;

procedure TProfileManagerForm.AllProfilesListViewChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  UpdateUIState;
end;

procedure TProfileManagerForm.IncludedProfilesListViewChange(
  Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  UpdateUIState;
end;

procedure TProfileManagerForm.AllProfilesListViewDblClick(Sender: TObject);
begin
  IncludeProfile;
end;

procedure TProfileManagerForm.IncludedProfilesListViewDblClick(
  Sender: TObject);
begin
  ExcludeProfile;
end;

procedure TProfileManagerForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TProfileManagerForm.UpdateUIState;
begin
  IncludeButton.Enabled := (AllProfilesListView.Selected <> nil) and (not StarUMLApplication.Project.ReadOnly);
  ExcludeButton.Enabled := (IncludedProfilesListView.Selected <> nil) and (not StarUMLApplication.Project.ReadOnly);
  if AllProfilesListView.Selected <> nil then
    DescMemo.Text := PProfile(AllProfilesListView.Selected.Data).Description
  else if IncludedProfilesListView.Selected <> nil then
    DescMemo.Text := PProfile(IncludedProfilesListView.Selected.Data).Description
  else
    DescMemo.Text := '';
end;

procedure TProfileManagerForm.AddProfile(AProfile: PProfile);
var
  L: TListItem;
  Icon: TIcon;
  ImgIndex: Integer;
begin
  if FileExists(AProfile.FileName) then begin
    ImgIndex := DEFAULT_PROFILE_ICON_INDEX;
    if FileExists(AProfile.IconFile) and (UpperCase(ExtractFileExt(AProfile.IconFile)) = '.ICO') then begin
      Icon := TIcon.Create;
      try
        Icon.LoadFromFile(AProfile.IconFile);
        ImgIndex := ProfilesSmallImageList.AddIcon(Icon);
        ProfilesLargeImageList.AddIcon(Icon);
      except
        ImgIndex := DEFAULT_PROFILE_ICON_INDEX;
      end;
      Icon.Free;
    end;
    if ExtensionManager.FindIncludedProfile(AProfile.Name) <> nil then
      L := IncludedProfilesListView.Items.Add
    else
      L := AllProfilesListView.Items.Add;
    L.Caption := AProfile.DisplayName;
    L.Data := AProfile;
    L.ImageIndex := ImgIndex;
  end;
end;

procedure TProfileManagerForm.UpdateProfiles;
var
  I: Integer;
begin
  AllProfilesListView.Clear;
  IncludedProfilesListView.Clear;
  ProfilesSmallImageList.Clear;
  ProfilesSmallImageList.AddIcon(DefaultProfileIconImage.Picture.Icon);
  ProfilesLargeImageList.Clear;
  ProfilesLargeImageList.AddIcon(DefaultProfileIconImage.Picture.Icon);
  for I := 0 to ExtensionManager.AvailableProfileCount - 1 do begin
    AddProfile(ExtensionManager.AvailableProfiles[I]);
  end;
  UpdateUIState;
end;

procedure TProfileManagerForm.IncludeProfile;
var
  P: PProfile;
  S: TListItem;
begin
  S := AllProfilesListView.Selected;
  if Assigned(S) and not StarUMLApplication.Project.ReadOnly then begin
    P := PProfile(S.Data);
    if Assigned(FOnProfileInclude) then
      FOnProfileInclude(Self, P.Name);
    UpdateProfiles;
    UpdateUIState;
  end;
end;

procedure TProfileManagerForm.ExcludeProfile;
var
  P: PProfile;
  S: TListItem;
  R: Integer;
begin
  S := IncludedProfilesListView.Selected;
  if (S <> nil) and (not StarUMLApplication.Project.ReadOnly) then begin
    R := Application.MessageBox(PChar(QUERY_REMOVE_PROFILE), PChar(Application.Title),
      MB_ICONQUESTION or MB_YESNO);
    if R = IDYES then begin
      P := PProfile(S.Data);
      if Assigned(FOnProfileExclude) then
        FOnProfileExclude(Self, P.Name);
      UpdateProfiles;
      UpdateUIState;
    end;
  end;
end;

procedure TProfileManagerForm.ShowProfiles;
begin
  UpdateProfiles;
  ShowModal;
end;

procedure TProfileManagerForm.SaveToRegistry;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(RK_LOCATION + RK_PROFILEMANAGER, True) then
    begin
      Reg.WriteBool('SmallIcon', SmallIconButton.Down);
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TProfileManagerForm.LoadFromRegistry;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(RK_LOCATION + RK_PROFILEMANAGER, False) then
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

// TProfileManagerForm
////////////////////////////////////////////////////////////////////////////////

procedure TProfileManagerForm.IconButtonClick(Sender: TObject);
begin
  if Sender = LargeIconButton then
  begin
    AllProfilesListView.ViewStyle := vsIcon;
    IncludedProfilesListView.ViewStyle := vsIcon;
    SmallIconButton.Down := False;
    LargeIconButton.Down := True;
  end
  else if Sender = SmallIconButton then
  begin
    AllProfilesListView.ViewStyle := vsReport;
    IncludedProfilesListView.ViewStyle := vsReport;
    SmallIconButton.Down := True;
    LargeIconButton.Down := False;
  end
end;

procedure TProfileManagerForm.FormShow(Sender: TObject);
begin
  LoadFromRegistry;
end;

procedure TProfileManagerForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveToRegistry;
end;

procedure TProfileManagerForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

procedure TProfileManagerForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\PROFMGR.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

end.
