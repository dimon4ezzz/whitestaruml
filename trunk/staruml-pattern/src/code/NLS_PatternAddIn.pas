unit NLS_PatternAddIn;

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

const
  C_TXT_SELECT_PARAM_ELEM = 'Select %s element.';
  C_TXT_SELECT_PARAM_ELEM_LIST = 'Add %s element.';
  C_TXT_PATTERN_NAME = 'Pattern name: %s';

  C_MSG_PATTERN_APPLY_START = 'Starting pattern application. (%s pattern)';
  C_MSG_PATTERN_APPLY_SUCCEED = 'Pattern application complete.';
  C_MSG_PATTERN_APPLY_FAIL = 'Pattern application failed.';
  C_MSG_ELEM_CREATE = '(%s) \\"%s\\" element created.';

  C_ERR_NO_ACTIVE_DGM = 'Cannot apply pattern to the current diagram.' + #13#10 +
                        '(Class, Use Case, Component, or Deployment diagram must be activated.)';
  C_ERR_INVALID_FORMED_XML = 'Invalid XML format for pattern definition file.';
  C_ERR_PATTERN_REPO_NOT_FOUND = 'Cannot find pattern repository folder.';
  C_ERR_INVALID_PARAM_VALUE = '%s parameter value must be %s type.';
  C_ERR_EMPTY_PARAM_VALUE = '%s parameter value not assigned.' + #13#10 +
                            'This type of value cannot be omitted.';
  C_ERR_ELEM_NAME_CONFLICT = '%s parameter value duplicated to an existing element name.';
  C_ERR_JSCRIPT_NOT_FOUND = 'Cannot find pattern definition script file.';
  C_ERR_HELPFILE_NOT_FOUND = 'Cannot find pattern help file.';
  C_ERR_APPLY_PATTERN_FAIL = 'Pattern application failed.' + #13#10 +
                             '(Error message: %s)';

  C_QUERY_CANCEL_APPLY_PATTERN = 'Do you want to cancel pattern application?';

const
  NLS_FILE_NAME = 'PATTERNADDIN.LNG';

var
  ERR_NO_ACTIVE_DGM: string;
  MSG_PATTERN_APPLY_START: string;
  MSG_PATTERN_APPLY_SUCCEED: string;
  MSG_PATTERN_APPLY_FAIL: string;
  MSG_ELEM_CREATE: string;
  TXT_SELECT_PARAM_ELEM: string;
  TXT_SELECT_PARAM_ELEM_LIST: string;
  TXT_PATTERN_NAME: string;
  ERR_INVALID_FORMED_XML: string;
  ERR_PATTERN_REPO_NOT_FOUND: string;
  ERR_INVALID_PARAM_VALUE: string;
  ERR_EMPTY_PARAM_VALUE: string;
  ERR_ELEM_NAME_CONFLICT: string;
  ERR_JSCRIPT_NOT_FOUND: string;
  ERR_HELPFILE_NOT_FOUND: string;
  ERR_APPLY_PATTERN_FAIL: string;
  QUERY_CANCEL_APPLY_PATTERN: string;

  function GetDllPath: string;
  
implementation

uses
  NLS,
  Classes, SysUtils, Windows, ShellCtrls, JvWizard;

const
  NLS_STR_SECTION = 'Strings';

function GetDllPath: string;
var
  ModuleName : array[0..1023] of char;
  Path: string;
begin
  FillChar(ModuleName, Sizeof(ModuleName), #10);
  GetModuleFileName(HInstance, ModuleName, Sizeof(ModuleName));
  Path := ExtractFileDir(ModuleName);
  Result := Path;
end;

// -----------------------------------------------------------------------------
//                           NLS for Other Components
// -----------------------------------------------------------------------------

// TElTree .....................................................................
(*
procedure NLS_ElTree_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TElTree do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
  end;
end;

procedure NLS_ElTree_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TElTree do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
  end;
end;
 *)
// TShellTreeView...............................................................

procedure NLS_ShellTreeView_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TShellTreeView do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
  end;
end;

procedure NLS_ShellTreeView_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TShellTreeView do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
  end;
end;

// TJvWizard ....................................................................

procedure NLS_JvWizard_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TJvWizard do
  begin
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    NLSValues.ReadFont(AComponent, Font);
    ButtonBack.Width := NLSValues.ReadInteger(AComponent, 'ButtonBack.Width', ButtonBack.Width);
    ButtonBack.Caption := NLSValues.ReadString(AComponent, 'ButtonBack.Caption', ButtonBack.Caption);
    ButtonCancel.Width := NLSValues.ReadInteger(AComponent, 'ButtonCancel.Width', ButtonCancel.Width);
    ButtonCancel.Caption := NLSValues.ReadString(AComponent, 'ButtonCancel.Caption', ButtonCancel.Caption);
    ButtonFinish.Width := NLSValues.ReadInteger(AComponent, 'ButtonFinish.Width', ButtonFinish.Width);
    ButtonFinish.Caption := NLSValues.ReadString(AComponent, 'ButtonFinish.Caption', ButtonFinish.Caption);
    ButtonHelp.Width := NLSValues.ReadInteger(AComponent, 'ButtonHelp.Width', ButtonHelp.Width);
    ButtonHelp.Caption := NLSValues.ReadString(AComponent, 'ButtonHelp.Caption', ButtonHelp.Caption);
    ButtonLast.Width := NLSValues.ReadInteger(AComponent, 'ButtonLast.Width', ButtonLast.Width);
    ButtonLast.Caption := NLSValues.ReadString(AComponent, 'ButtonLast.Caption', ButtonLast.Caption);
    ButtonNext.Width := NLSValues.ReadInteger(AComponent, 'ButtonNext.Width', ButtonNext.Width);
    ButtonNext.Caption := NLSValues.ReadString(AComponent, 'ButtonNext.Caption', ButtonNext.Caption);
    ButtonStart.Width := NLSValues.ReadInteger(AComponent, 'ButtonStart.Width', ButtonStart.Width);
    ButtonStart.Caption := NLSValues.ReadString(AComponent, 'ButtonStart.Caption', ButtonStart.Caption);
  end;
end;

procedure NLS_JvWizard_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TJvWizard do
  begin
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteInteger(AComponent, 'ButtonBack.Width', ButtonBack.Width);
    NLSValues.WriteString(AComponent, 'ButtonBack.Caption', ButtonBack.Caption);
    NLSValues.WriteInteger(AComponent, 'ButtonCancel.Width', ButtonCancel.Width);
    NLSValues.WriteString(AComponent, 'ButtonCancel.Caption', ButtonCancel.Caption);
    NLSValues.WriteInteger(AComponent, 'ButtonFinish.Width', ButtonFinish.Width);
    NLSValues.WriteString(AComponent, 'ButtonFinish.Caption', ButtonFinish.Caption);
    NLSValues.WriteInteger(AComponent, 'ButtonHelp.Width', ButtonHelp.Width);
    NLSValues.WriteString(AComponent, 'ButtonHelp.Caption', ButtonHelp.Caption);
    NLSValues.WriteInteger(AComponent, 'ButtonLast.Width', ButtonLast.Width);
    NLSValues.WriteString(AComponent, 'ButtonLast.Caption', ButtonLast.Caption);
    NLSValues.WriteInteger(AComponent, 'ButtonNext.Width', ButtonNext.Width);
    NLSValues.WriteString(AComponent, 'ButtonNext.Caption', ButtonNext.Caption);
    NLSValues.WriteInteger(AComponent, 'ButtonStart.Width', ButtonStart.Width);
    NLSValues.WriteString(AComponent, 'ButtonStart.Caption', ButtonStart.Caption);
  end;
end;

// TJvWizardInteriorPage ........................................................

procedure NLS_JvWizardInteriorPage_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TJvWizardInteriorPage do
  begin
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    NLSValues.ReadFont(AComponent, Font);
    Header.ParentFont := NLSValues.ReadBoolean(AComponent, 'Header.ParentFont', Header.ParentFont);
    Header.Height := NLSValues.ReadInteger(AComponent, 'Header.Height', Header.Height);
    if not Header.ParentFont then
      NLSValues.ReadFont(AComponent, Header.Title.Font);
    Header.Title.Text := NLSValues.ReadString(AComponent, 'Header.Title.Text', Header.Title.Text);
    Header.Title.Indent := NLSValues.ReadInteger(AComponent, 'Header.Title.Indent', Header.Title.Indent);
    if not Header.ParentFont then
      NLSValues.ReadFont(AComponent, Header.SubTitle.Font);
    Header.SubTitle.Text := NLSValues.ReadString(AComponent, 'Header.SubTitle.Text', Header.SubTitle.Text);
    Header.SubTitle.Indent := NLSValues.ReadInteger(AComponent, 'Header.SubTitle.Indent', Header.SubTitle.Indent);
  end;
end;

procedure NLS_JvWizardInteriorPage_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TJvWizardInteriorPage do
  begin
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'Header.ParentFont', Header.ParentFont);
    NLSValues.WriteInteger(AComponent, 'Header.Height', Header.Height);
    NLSValues.WriteFont(AComponent, Header.Title.Font);
    NLSValues.WriteString(AComponent, 'Header.Title.Text', Header.Title.Text);
    NLSValues.WriteInteger(AComponent, 'Header.Title.Indent', Header.Title.Indent);
    NLSValues.WriteFont(AComponent, Header.SubTitle.Font);
    NLSValues.WriteString(AComponent, 'Header.SubTitle.Text', Header.SubTitle.Text);
    NLSValues.WriteInteger(AComponent, 'Header.SubTitle.Indent', Header.SubTitle.Indent);
  end;
end;

initialization
  //NLSManager.SetExportMode;
  NLSManager.SetImportMode;

  { Translate Strings }
  NLSManager.SetFile(GetDllPath + '\' + NLS_FILE_NAME);

  //NLSManager.RegisterNLSComponent(TElTree, False, NLS_ElTree_Import, NLS_ElTree_Export);
  NLSManager.RegisterNLSComponent(TShellTreeView, False, NLS_ShellTreeView_Import, NLS_ShellTreeView_Export);
  NLSManager.RegisterNLSComponent(TJvWizard, True, NLS_JvWizard_Import, NLS_JvWizard_Export);
  NLSManager.RegisterNLSComponent(TJvWizardInteriorPage, True, NLS_JvWizardInteriorPage_Import, NLS_JvWizardInteriorPage_Export);
  
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_NO_ACTIVE_DGM', ERR_NO_ACTIVE_DGM, C_ERR_NO_ACTIVE_DGM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_PATTERN_APPLY_START', MSG_PATTERN_APPLY_START, C_MSG_PATTERN_APPLY_START);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_PATTERN_APPLY_SUCCEED', MSG_PATTERN_APPLY_SUCCEED, C_MSG_PATTERN_APPLY_SUCCEED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_PATTERN_APPLY_FAIL', MSG_PATTERN_APPLY_FAIL, C_MSG_PATTERN_APPLY_FAIL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ELEM_CREATE', MSG_ELEM_CREATE, C_MSG_ELEM_CREATE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_SELECT_PARAM_ELEM', TXT_SELECT_PARAM_ELEM, C_TXT_SELECT_PARAM_ELEM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_SELECT_PARAM_ELEM_LIST', TXT_SELECT_PARAM_ELEM_LIST, C_TXT_SELECT_PARAM_ELEM_LIST);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PATTERN_NAME', TXT_PATTERN_NAME, C_TXT_PATTERN_NAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_FORMED_XML', ERR_INVALID_FORMED_XML, C_ERR_INVALID_FORMED_XML);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_PATTERN_REPO_NOT_FOUND', ERR_PATTERN_REPO_NOT_FOUND, C_ERR_PATTERN_REPO_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_PARAM_VALUE', ERR_INVALID_PARAM_VALUE, C_ERR_INVALID_PARAM_VALUE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_EMPTY_PARAM_VALUE', ERR_EMPTY_PARAM_VALUE, C_ERR_EMPTY_PARAM_VALUE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ELEM_NAME_CONFLICT', ERR_ELEM_NAME_CONFLICT, C_ERR_ELEM_NAME_CONFLICT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_JSCRIPT_NOT_FOUND', ERR_JSCRIPT_NOT_FOUND, C_ERR_JSCRIPT_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_HELPFILE_NOT_FOUND', ERR_HELPFILE_NOT_FOUND, C_ERR_HELPFILE_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_APPLY_PATTERN_FAIL', ERR_APPLY_PATTERN_FAIL, C_ERR_APPLY_PATTERN_FAIL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'QUERY_CANCEL_APPLY_PATTERN', QUERY_CANCEL_APPLY_PATTERN, C_QUERY_CANCEL_APPLY_PATTERN);
end.
