unit RoseImportFrm;

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
  Dialogs, StdCtrls, ComCtrls, ExtCtrls,
  WhiteStarUML_TLB, PetalDoc, RoseToStarUML, Buttons, XPMan;

type
  // TRoseImportForm
  TRoseImportForm = class(TForm)
    FileLocationLabel: TLabel;
    FileLocationEdit: TEdit;
    OptionGroup: TGroupBox;
    ExecuteButton: TButton;
    CancelButton: TButton;
    OpenDialog: TOpenDialog;
    ProgressBar: TProgressBar;
    ProgressMessageLabel: TLabel;
    InstanceToRoleCheck: TCheckBox;
    MakeDiagramViewCheck: TCheckBox;
    DecoBevel: TBevel;
    AddToAttachmentCheck: TCheckBox;
    FileOpenButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FileOpenButtonClick(Sender: TObject);
    procedure ExecuteButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FileLocationEditChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FPetalDoc: RPetalDocument;
    FRoseToStarUMLAdapter: RoseStarUMLAdapter;
    DialogForm: TRoseImportForm;
    procedure ErrorMessage(Msg: string);
    procedure UpdateUIStates;
    function CheckFileExistence(FN: string): Boolean;
    function CheckFileNameExtendsion(FN: string): Boolean;
    function NewProject: Boolean;
    procedure BeginExecution;
    procedure AfterExecution;
    function PetalDocReadFile(FN: string): Boolean;
    // event handler
    procedure LogEventHandler(Sender: TObject; Msg: string);
    procedure ProgressEventHandler(Sender: TObject; Pos: Integer; Max: Integer; Msg: string);
  public
    StarUMLApp: IStarUMLApplication;
  end;

var
  RoseImportForm: TRoseImportForm;

implementation

uses
  Symbols, NLS, NLS_RoseAddIn, Utilities;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TXMIImportForm

procedure TRoseImportForm.LogEventHandler(Sender: TObject; Msg: string);
begin
  if Msg <> '' then StarUMLApp.Log(Msg);
end;

procedure TRoseImportForm.ProgressEventHandler(Sender: TObject; Pos: Integer; Max: Integer; Msg: string);
begin
  if (ProgressMessageLabel.Caption <> Msg) and (Msg <> '') then begin
    ProgressMessageLabel.Caption := Msg;
  end;

  if Max <> 0 then begin
    if Pos > Max then Pos := Max;
    ProgressBar.Position := Trunc(Pos * 100 / Max);
  end else begin
    ProgressBar.Position := ProgressBar.Min;
  end;

  Application.ProcessMessages;
end;

procedure TRoseImportForm.ErrorMessage(Msg: string);
begin
  Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_OK + MB_ICONERROR);
end;

procedure TRoseImportForm.UpdateUIStates;
begin
  ExecuteButton.Enabled := (FileLocationEdit.Text <> '');
end;

function TRoseImportForm.CheckFileExistence(FN: string): Boolean;
begin
  Result := False;
  if FN <> '' then Result := FileExists(FN);
end;

function TRoseImportForm.CheckFileNameExtendsion(FN: string): Boolean;
var
  strExt: string;
begin
  Result := False;
  strExt := ExtractFileExt(FN);
  if (strExt = '.mdl') or (strExt = UpperCase('.mdl'))or (strExt = '.ptl') or (strExt = UpperCase('.ptl')) then begin
    Result := true;
  end;
end;

function TRoseImportForm.NewProject: Boolean;
var
  PjtMgr: IProjectManager;
begin
  Result := False;

  PjtMgr := StarUMLApp.ProjectManager;
  PjtMgr.CloseProject;
  if PjtMgr.Project <> nil then Exit;

  PjtMgr.NewProjectByApproach(APPROACH_RATIONAL);
  StarUMLApp.Log(MSG_NEW_PROJECT);
  Result := True;
end;

procedure TRoseImportForm.BeginExecution;
begin
  Screen.Cursor := crHourGlass;
  FPetalDoc := RPetalDocument.Create;
  FPetalDoc.OnProgress := ProgressEventHandler;
  FPetalDoc.OnLog := LogEventHandler;
  FRoseToStarUMLAdapter := RoseStarUMLAdapter.Create(StarUMLApp);
  FRoseToStarUMLAdapter.OnLog := LogEventHandler;
  FRoseToStarUMLAdapter.OnProgress := ProgressEventHandler;
  FRoseToStarUMLAdapter.InstanceToRoleOption := InstanceToRoleCheck.Checked;
  FRoseToStarUMLAdapter.MakeDiagramViewOption := MakeDiagramViewCheck.Checked;
  FRoseToStarUMLAdapter.AddFilePathOption := AddToAttachmentCheck.Checked;
  StarUMLApp.BeginUpdate;
end;

procedure TRoseImportForm.AfterExecution;
begin
  StarUMLApp.EndUpdate2(True, True);
  FPetalDoc.Free;
  FRoseToStarUMLAdapter.Free;
  Screen.Cursor := crDefault;
end;

function TRoseImportForm.PetalDocReadFile(FN: string): Boolean;
begin
  Result := False;
  try
    FPetalDoc.ReadFromFile(FN);
    Result := True;
  except on E: Exception do
    StarUMLApp.Log(E.Message);
  end;
end;

// TXMIImportForm
////////////////////////////////////////////////////////////////////////////////

procedure TRoseImportForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(GetDllPath + '\' + NLS_FILE_NAME);
  NLSManager.TranslateComponent(Self, []);
end;

procedure TRoseImportForm.FormDestroy(Sender: TObject);
begin
  StarUMLApp := nil;
  DialogForm.Free;
end;

procedure TRoseImportForm.FileOpenButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then begin
    FileLocationEdit.Text := '';
    FileLocationEdit.Text := OpenDialog.FileName;
  end;
end;

procedure TRoseImportForm.CancelButtonClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TRoseImportForm.ExecuteButtonClick(Sender: TObject);
var
  FN: string;
begin
  ExecuteButton.Enabled := False;
  CancelButton.Enabled := False;
  FN := FileLocationEdit.Text;
  if CheckFileNameExtendsion(FN) then begin
    if CheckFileExistence(FN) then begin
      if not NewProject then Exit;
      StarUMLApp.Log(Format(MSG_START_PROCESS, [FN]));
      BeginExecution;
      try
        if PetalDocReadFile(FN) then begin
          try
           //* check file validity
            FRoseToStarUMLAdapter.Convert(FN, FPetalDoc);
            StarUMLApp.Log(MSG_SUCCEED_PROCESS);
          except on E: Exception do
            StarUMLApp.Log(E.Message);
          end;
        end;
      finally
        AfterExecution;
        Self.Close;
      end;
    end else begin
      ErrorMessage(Format(MSG_FILE_NOT_FOUND, [FN]));
    end;
  end else begin
    ErrorMessage(Format(ERR_IMPORT_FILENAME_EXTENDSION, [FN]));
  end;
end;

procedure TRoseImportForm.FileLocationEditChange(Sender: TObject);
begin
  UpdateUIStates;
end;

procedure TRoseImportForm.FormShow(Sender: TObject);
begin
  UpdateUIStates;
end;

end.
