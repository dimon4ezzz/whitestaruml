unit ProfileSelFrm;

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
  Dialogs, StdCtrls, ExtCtrls, ImgList, WhiteStarUML_TLB,
  NxGridView6, NxColumns6, NxControls6, NxCustomGrid6, NxVirtualGrid6, NxGrid6;

type
  // TProfileSelectorForm
  TProfileSelectorForm = class(TForm)
    HeaderLabel: TLabel;
    Bevel: TBevel;
    AcceptButton: TButton;
    CancelButton: TButton;
    ProfileIconImageList: TImageList;
    DefaultProfileIconImage: TImage;
    ProfileGrid: TNextGrid6;
    ProfileGridView: TNxReportGridView6;
    CheckColumn: TNxCheckBoxColumn6;
    ProfileIconColumn: TNxIconColumn6;
    ProfileNameColumn: TNxTextColumn6;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private type
    ProfileColumn = (ProfileColumnCheck, ProfileColumnIcon, ProfileColumnName);
  private
    FStarUMLApp: IStarUMLApplication;
    FSelectedProfiles: TStringList;
    function Initialized: Boolean;
    function GetSelectedProfileCount: Integer;
    function GetSelectedProfile(Index: Integer): string;
    function IsProfileAvailable(ProfileName: string): Boolean;
    procedure SetSelectedProfiles;
    procedure SetupProfileGrid;
  public
    procedure AddSelectedProfiles(Value: string);
    function Execute: Boolean;
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
    property SelectedProfileCount: Integer read GetSelectedProfileCount;
    property SelectedProfiles[Index: Integer]: string read GetSelectedProfile;
  end;

implementation

{$R *.dfm}

uses
  Utilities, Symbols, NxCells6;

const
  DEFAULT_PROFILE_ICON_INDEX = -1;

////////////////////////////////////////////////////////////////////////////////
// TProfileSelectorForm

function TProfileSelectorForm.Initialized: Boolean;
begin
  Result := Assigned(FStarUMLApp);
end;

function TProfileSelectorForm.GetSelectedProfileCount: Integer;
begin
  Result := FSelectedProfiles.Count;
end;

function TProfileSelectorForm.GetSelectedProfile(Index: Integer): string;
begin
  Result := FSelectedProfiles[Index];
end;

function TProfileSelectorForm.IsProfileAvailable(ProfileName: string): Boolean;
begin
  Result := (FStarUMLApp.ExtensionManager.FindAvailableProfile(ProfileName) <> nil);
end;

procedure TProfileSelectorForm.SetSelectedProfiles;
var
  I: Integer;
  Row: InxCellsRow;
begin
  FSelectedProfiles.Clear;
  for I := 0 to ProfileGrid.RowCount - 1 do begin
    Row := ProfileGrid.Row[I] as InxCellsRow;
    if Row.Cells[Ord(ProfileColumnCheck)].AsBoolean = True then
      FSelectedProfiles.Add(Row.Cells[Ord(ProfileColumnName)].Text);
  end;
end;

procedure TProfileSelectorForm.SetupProfileGrid;
var
  P: IProfile;
  Icon: TIcon;
  ImgIdx: Integer;
  I: Integer;
  Row: InxCellsRow;
begin
  ProfileIconImageList.Clear;
  ProfileIconImageList.AddIcon(DefaultProfileIconImage.Picture.Icon);
  ProfileGrid.ClearRows;

  for I := 0 to FStarUMLApp.ExtensionManager.GetAvailableProfileCount - 1 do begin
    P := FStarUMLApp.ExtensionManager.GetAvailableProfileAt(I);
    ImgIdx := DEFAULT_PROFILE_ICON_INDEX;

    if FileExists(P.IconFile) and (UpperCase(ExtractFileExt(P.IconFile)) = '.ICO') then begin
      Icon := TIcon.Create;
      try
        Icon.LoadFromFile(P.IconFile);
        ImgIdx := ProfileIconImageList.AddIcon(Icon);
      except
        Icon.Free;
      end;
    end;

    Row := ProfileGrid.AddRow;
    Row.Cells[Ord(ProfileColumnIcon)].AsInteger := ImgIdx;
    Row.Cells[Ord(ProfileColumnName)].AsString := P.Name;
    Row.Cells[Ord(ProfileColumnCheck)].AsBoolean := (FSelectedProfiles.IndexOf(P.Name) <> -1);
  end;

  for I := 0 to SelectedProfileCount - 1 do begin
    if not IsProfileAvailable(SelectedProfiles[I]) then begin
      Row := ProfileGrid.AddRow;
      Row.Cells[Ord(ProfileColumnIcon)].AsInteger := DEFAULT_PROFILE_ICON_INDEX;
      Row.Cells[Ord(ProfileColumnName)].AsString := SelectedProfiles[I];
      Row.Cells[Ord(ProfileColumnCheck)].AsBoolean := True;
      Row.Cells[Ord(ProfileColumnCheck)].Color := clGray;
    end;
  end;
end;

procedure TProfileSelectorForm.AddSelectedProfiles(Value: string);
begin
  FSelectedProfiles.Add(Value);
end;

function TProfileSelectorForm.Execute: Boolean;
var
  Accepted: Boolean;
begin
  if not Initialized then
    raise EIntializationException.Create(ERR_NOT_INITIALIZED);
  SetupProfileGrid;
  Accepted := (ShowModal = mrOk);
  if Accepted then
    SetSelectedProfiles;
  Result := Accepted;
end;

// TProfileSelectorForm
////////////////////////////////////////////////////////////////////////////////

procedure TProfileSelectorForm.FormCreate(Sender: TObject);
begin
  FSelectedProfiles := TStringList.Create;
end;

procedure TProfileSelectorForm.FormDestroy(Sender: TObject);
begin
  FSelectedProfiles.Free;
end;

end.
