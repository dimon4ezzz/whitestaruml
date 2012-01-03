unit XMIExportFrm;

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
  Dialogs, StdCtrls, WhiteStarUML_TLB, ComCtrls, ExtCtrls, Buttons;

type
  //Exceptions
  EDirectoryNotFound = class(Exception);
  EInvalidFileName = class(Exception);

  // TXMIExportForm
  TXMIExportForm = class(TForm)
    ExecuteButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    XMIVersionGroupBox: TGroupBox;
    OptionGroupBox: TGroupBox;
    ExportViewsCheckBox: TCheckBox;
    UUIDCheckBox: TCheckBox;
    TimestampCheckBox: TCheckBox;
    ProgressMessageLabel: TLabel;
    ProgressBar: TProgressBar;
    FileSaveDialog: TSaveDialog;
    XMI13RadioButton: TRadioButton;
    XMI13RoseRadioButton: TRadioButton;
    FileNameLabel: TLabel;
    FileNameEdit: TEdit;
    FileSaveButton: TButton;
    procedure ExecuteButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FileSaveButtonClick(Sender: TObject);
    procedure XMI13RadioButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure XMI13RoseRadioButtonClick(Sender: TObject);
    procedure FileNameEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FStarUMLApp: IStarUMLApplication;
    procedure ProgressEventHandler(Pos: Integer; Max: Integer; Msg: string);
    procedure UpdateUIStates;
    procedure CheckFileName(FilePath: string);
  public
    function Execute: Boolean;
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
  end;

var
  XMIExportForm: TXMIExportForm;

implementation

uses
  XMIExporter, XMIExporter13, NLS_XMIAddIn, NLS, Utilities;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TXMIExportForm

procedure TXMIExportForm.ProgressEventHandler(Pos: Integer; Max: Integer; Msg: string);
begin
  if (ProgressMessageLabel.Caption <> Msg) and (Msg <> '') then
    ProgressMessageLabel.Caption := Msg;
  if Max <> 0 then ProgressBar.Position := Trunc(Pos * 100 / Max)
  else ProgressBar.Position := ProgressBar.Min;
  Application.ProcessMessages;
end;

procedure TXMIExportForm.UpdateUIStates;
begin
  ExecuteButton.Enabled := (FileNameEdit.Text <> '');
  ExportViewsCheckBox.Enabled := XMI13RoseRadioButton.Checked;
end;

function TXMIExportForm.Execute: Boolean;
begin
  Result := (ShowModal = mrOk);
end;

// TXMIExportForm
////////////////////////////////////////////////////////////////////////////////


procedure TXMIExportForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(GetDllPath + '\' + NLS_FILE_NAME);
  NLSManager.TranslateComponent(Self, []);
end;

procedure TXMIExportForm.ExecuteButtonClick(Sender: TObject);
var
  XMIExporter13: PXMIExporter13;
  Path: string;
  FN: string;
begin
  CheckFileName(FileNameEdit.Text);
  Path := ExtractFilePath(FileNameEdit.Text);
  FN := ExtractFileExt(FileNameEdit.Text);
  if Path = '' then
    FileNameEdit.Text := GetCurrentDir + '\' + FileNameEdit.Text;

  if FN = '' then
    FileNameEdit.Text := ChangeFileExt(FileNameEdit.Text, '.xml');

  if FileExists(FileNameEdit.Text) then begin
    if Application.MessageBox(PChar(Format(QUERY_OVERWRITE, [FileNameEdit.Text])),
      PChar(Application.Title), MB_ICONQUESTION + MB_YESNO) = IDNO then
      Exit;
  end;

  ExecuteButton.Enabled := False;
  CancelButton.Enabled := False;
  XMIExporter13 := PXMIExporter13.Create;
  try
    XMIExporter13.StarUMLApp := StarUMLApp;
    XMIExporter13.RoseExtended := XMI13RoseRadioButton.Checked;
    XMIExporter13.ExportViews := ExportViewsCheckBox.Checked;
    XMIExporter13.CreateUUID := UUIDCheckBox.Checked;
    XMIExporter13.CreateTimeStamp := TimestampCheckBox.Checked;
    XMIExporter13.OnProgress := ProgressEventHandler;
    try
      Screen.Cursor := crHourGlass;
      XMIExporter13.ExportToFile(FileNameEdit.Text);
      Screen.Cursor := crDefault;
      Application.MessageBox(PChar(MSG_EXPORT_SUCCEEDE),
        PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
      Close;
    except
      on E: Exception do begin
        Application.MessageBox(PChar(Format(ERR_ERROR_RAISED, [E.Message])),
          PChar(Application.Title), MB_ICONERROR + MB_OK);
        CancelButton.Enabled := True;
      end;
    end;
  finally
    XMIExporter13.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TXMIExportForm.CancelButtonClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TXMIExportForm.FileSaveButtonClick(Sender: TObject);
begin
  if FileSaveDialog.Execute then
    FileNameEdit.Text := FileSaveDialog.FileName;
end;

procedure TXMIExportForm.FormShow(Sender: TObject);
var
  FileName: string;
begin
  UpdateUIStates;
  FileName := FStarUMLapp.ProjectManager.Project.Title;
  FileNameEdit.Text := GetCurrentDir + '\' + ChangeFileExt(FileName, '.xml');
end;

procedure TXMIExportForm.XMI13RadioButtonClick(Sender: TObject);
begin
  UpdateUIStates;
end;

procedure TXMIExportForm.XMI13RoseRadioButtonClick(Sender: TObject);
begin
  UpdateUIStates;
end;

procedure TXMIExportForm.FileNameEditChange(Sender: TObject);
begin
  UpdateUIStates;
end;

procedure TXMIExportForm.CheckFileName(FilePath: string);
const
  NotAvailablesInFileName: array[0..8] of string = ('\', '/', ':', '*', '?', '"', '<', '>', '|');
  NotAvailablesInPath: array[0..5] of string = ('*', '?', '"', '<', '>', '|');
var
  FN: string;
  Dir: string;
  I: Integer;
begin
  FN := ExtractFileName(FilePath);
  Dir := ExtractFilePath(FilePath);
  if (Dir <> '') and (not DirectoryExists(Dir)) then
    raise EDirectoryNotFound.Create(ERR_DIRECTORY_NOT_FOUND);
  if FN = '' then
    raise EInvalidFileName.Create(ERR_INVALID_FILE_NAME);
  for I := 0 to Length(NotAvailablesInPath) - 1 do
    if Pos(NotAvailablesInPath[I], FilePath) > 0 then
      raise EInvalidFileName.Create(ERR_INVALID_FILE_NAME);
  for I := 0 to Length(NotAvailablesInFileName) - 1 do
    if Pos(NotAvailablesInFileName[I], FN) > 0 then
      raise EInvalidFileName.Create(ERR_INVALID_FILE_NAME);
end;

end.
