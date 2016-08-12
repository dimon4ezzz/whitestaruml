unit NewTemplateDlg;

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
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,  Vcl.ImgList, System.Classes,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Dialogs, JvBaseDlg, JvBrowseFolder;

type
  TNewTemplateDialog = class(TForm)
    TopBevel: TBevel;
    ButtonPanel: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    BottomBevel: TBevel;
    TemplateNameLabel: TLabel;
    TemplateNameEdit: TEdit;
    FolderLabel: TLabel;
    FolderEdit: TEdit;
    SpeedButton1: TSpeedButton;
    FolderBrowser: TJvBrowseForFolderDialog;
    procedure TemplateNameEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FolderTBItemClick(Sender: TObject);
    procedure FolderBrowserSelChanged(Sender: TObject);
    procedure TemplateNameEditChange(Sender: TObject);
  private
    FRootDir: String;
    FPath: String;
    procedure SetRootDir(const Value: String);
    procedure ChangePath;
    function GetTemplateName: String;
    { Private declarations }
  public
    { Public declarations }
    function Execute: Boolean;
    property RootDir: String read FRootDir write SetRootDir;
    property TemplateName: String read GetTemplateName;
    property Path: String read FPath;
  end;

implementation

{$R *.dfm}

{ TNewTemplateDialog }

// Impl ........................................................................

procedure TNewTemplateDialog.ChangePath;
begin
  FPath := FolderBrowser.Directory + '\' + TemplateNameEdit.Text;
  FolderEdit.Text := FPath;

end;

function TNewTemplateDialog.Execute: Boolean;
begin
  TemplateNameEdit.Text := '';
  FolderEdit.Text := RootDir;
  FolderBrowser.RootDirectoryPath := RootDir;
  FolderBrowser.Directory := RootDir;

  Result := (ShowModal = mrOK);
end;

procedure TNewTemplateDialog.SetRootDir(const Value: String);
begin
  FRootDir := Value;
end;

// Events ......................................................................

procedure TNewTemplateDialog.TemplateNameEditChange(Sender: TObject);
begin
  OKButton.Enabled := (TemplateNameEdit.Text <> '');
end;

procedure TNewTemplateDialog.TemplateNameEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  ChangePath;
end;

procedure TNewTemplateDialog.FolderTBItemClick(Sender: TObject);
begin
//  FolderBrowser.
  if not FolderBrowser.Execute then
    FolderBrowser.Directory := FolderBrowser.RootDirectoryPath
  else
    ChangePath;
end;

procedure TNewTemplateDialog.FolderBrowserSelChanged(Sender: TObject);
begin
  //
end;

function TNewTemplateDialog.GetTemplateName: String;
begin
  Result := TemplateNameEdit.Text;
end;

end.
