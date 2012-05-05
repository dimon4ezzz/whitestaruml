unit NLS_JavaAddIn;

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
  // Texts
  C_TXT_WAITING = 'Wating';
  C_TXT_GENERATING = 'Generating....';
  C_TXT_FAIL = 'Fail';
  C_TXT_COMPLETE = 'Complete';
  C_TXT_ERROR = 'Error';
  C_TXT_ANALYZING = 'Analyzing...';
  C_TXT_ANALYZED = 'Complete';
  C_TXT_ANALYSIS_FAILED = 'Failed';
  C_TXT_EXECUTE = 'Run';
  C_TXT_NEXT = 'Next';
  C_TXT_STOP = 'Stop';
  C_TXT_FINISH = 'Finish';

  // Dialog Captions (CodeGenForm)
  C_TXT_ON_GENERATING_CODE = 'Generating Java code.';
  C_TXT_CODE_GEN_COMPLETE = 'Java code generated successfully.';
  C_TXT_CODE_GEN_CANCEL = 'Java code generation has been cancelled.';
  C_TXT_CODE_GEN_ERROR = 'Java code generation has been aborted by error.';
  C_TXT_ELEMENT_CODE_GENERATING = 'Generating (%s) %s to source file.';
  C_TXT_ELEMENT_CODE_GENERATED = 'Generated (%s) %s to source file.';

  // Dialog Captions (RevEngineForm)
  C_TXT_REVERSE_BEGIN = 'Starting Java reverse engineering.';
  C_TXT_ANALYZE_FILE = 'Analyzing the source files.';
  C_TXT_CREATE_MODEL = 'Creating UML model elements from the analized result.';
  C_TXT_REVISE_REFERENCE = 'The relationships of generated elements are configuring, and revising references.';
  C_TXT_CREATE_DIAGRAM = 'Creating Diagrams.';
  C_TXT_UPDATE_BROWSER = 'Updating Model Browser.';
  C_TXT_CANT_STOP = '(Can''t cancel reverse engineering in this process.)';
  C_TXT_REVERSE_COMPLETE = 'Java reverse engineering has been completed successfully.';
  C_TXT_REVERSE_RESULT_DIRECTION = 'Refer the occurred event to Information window.';
  C_TXT_REVERSE_CANCEL = 'Java reverse engineering has been cancelled.';
  C_TXT_ELEMENT_CREATED = '(%s) %s has been created.';
  C_TXT_DIAGRAM_CREATED = '(%d / %d) %s diagram has been generated.';
  C_TXT_REVERSE_ERROR = 'Java reverse engineering has been aborted by error.';

  // Log Messages (Common)
  C_ERR_INVALID_OPTION = 'The option item has not been defined or wrong.'
    + #13#10 + '(%s - %s)';
  C_ERR_TAG_DEFINITION_NOT_DEFINED = '"%s" Tag has not been defined to Profile "%s".';
  C_ERR_CANNOT_READ_TAG_VALUE = 'Can''t read "%s" tagged value of the Profile "%s".';

  // Log Messages (Code Generator)
  C_MSG_CODE_GEN_BEGIN = 'Starting Java code generation. (%d elements)';
  C_MSG_CODE_GEN_FINISH = 'Java code generated successfully.';
  C_MSG_CODE_GEN_CANCEL = 'Java code generation has been cancelled by user.'
    + #13#10 + '(Generated file cannot be deleted.)';
  C_ERR_CODE_GEN_ERROR = 'Error occurred in the process of generating a code.(%s)'
    + #13#10 + 'message : %s';
  C_ERR_CODE_GEN_ERROR2 = 'Error occurred in the process of generating a code.'
    + #13#10 + 'message : %s';

  // Log Messages (Reverse Engine)
  C_MSG_REVERSE_BEGIN = 'Starting Java reverse engineering. (%d files)';
  C_MSG_REVERSE_FINISH = 'Java reverse engineering has been completed successfully.';
  C_MSG_REVERSE_CANCEL = 'Java reverse engineering has been canceled by user.'
    + #13#10 + '(Elements that have already been generated are not deleted.)';
  C_ERR_REVERSE_NO_SUPER_INTERFACE2 = 'Since there is not SuperInterface "%s" of Class "%s", failed to have Realization.';
  C_MSG_CODE_GEN_NONAME = 'Cannot generate code due to unspecified a name of the element. (%s) location : %s';
  C_MSG_CODE_GEN_NAMESPACE_NONAME = 'Cannot generate code due to unspecified a name of Namespace of the element. (%s) location : %s';
  C_MSG_CODE_GEN_IMPORT_NONAME = 'A name of Dependency Supplier of the element doesn''t exist. (%s) Dependency location : %s';
  C_ERR_PARSING_ERROR = 'Syntax error ( %s )' + #13#10 + 'Description : %s' + #13#10 + 'Location : %dLine %dColumn';
  C_MSG_ELEMENT_NAME_CHANGED = 'The name of "%s" has been changed to  "%s" by duplicated name of the element.';
  C_ERR_REVERSE_NO_SUPER_CLASS = 'Since there is not SuperClass "%s" of Class "%s", failed to have Generalization.';
  C_ERR_REVERSE_NO_SUPER_INTERFACE = 'Since there is not SuperInterface "%s" of Interface "%s", failed to have Generalization.';
  C_ERR_REVERSE_ERROR = 'Error occurred during reverse engineering.' + #13#10 + 'Error message : %s';

  // Information Messages
  C_MSG_DLG_CODE_GEN_COMPLETE = C_MSG_CODE_GEN_FINISH;
  C_MSG_DLG_CODE_GEN_CANCEL = C_MSG_CODE_GEN_CANCEL;
  C_MSG_DLG_REVERSE_COMPLETE = C_MSG_REVERSE_FINISH;
  C_MSG_DLG_REVERSE_CANCEL = C_MSG_REVERSE_CANCEL;

  // Error Message
  C_ERR_DLG_CODE_GEN_ERROR = C_ERR_CODE_GEN_ERROR2;
  C_ERR_DLG_REVERSE_ERROR = C_ERR_REVERSE_ERROR;
  C_ERR_CODE_GEN_PROFILE_NOT_LOADED = 'Java Profile has not been included.'
    + #13#10 + 'Generate code after including the profile to the project'
    + #13#10 + '(check the "Generate codes even when there is no profile" option to generate codes without the profile).';
  C_ERR_PROFILE_NOT_DEFINED = 'Java Profile is not installed in system.'
    + #13#10 + 'Install Java Profile to reverse engineer Java.';

  // Queries
  C_QUERY_CANCEL_CODE_GEN = 'Do you want to cancel Java code generation?';
  C_QUERY_CANCEL_REVERSE = 'Do you want to cancel Java reverse engineering?';
  C_QUERY_REVERSE_PROFILE_LOAD = 'To Java reverse engineering, Java Profile is needed.'
    + #13#10 + 'Do you want to include Java Profile to the current project?';

const
  NLS_FILE_NAME = 'JAVAADDIN.LNG';

var
  MSG_CODE_GEN_BEGIN: string;
  MSG_CODE_GEN_FINISH: string;
  MSG_CODE_GEN_CANCEL: string;
  ERR_CODE_GEN_ERROR: string;
  ERR_CODE_GEN_ERROR2: string;
  MSG_REVERSE_BEGIN: string;
  MSG_REVERSE_FINISH: string;
  MSG_REVERSE_CANCEL: string;
  MSG_ELEMENT_NAME_CHANGED: string;
  ERR_PARSING_ERROR: string;
  ERR_REVERSE_NO_SUPER_CLASS: string;
  ERR_REVERSE_NO_SUPER_INTERFACE: string;
  ERR_REVERSE_NO_SUPER_INTERFACE2: string;
  MSG_CODE_GEN_NONAME: string;
  MSG_CODE_GEN_NAMESPACE_NONAME: string;    
  MSG_CODE_GEN_IMPORT_NONAME: string;
  ERR_REVERSE_ERROR: string;
  ERR_INVALID_OPTION: string;
  ERR_TAG_DEFINITION_NOT_DEFINED: string;
  ERR_CANNOT_READ_TAG_VALUE: string;
  TXT_WAITING: string;
  TXT_GENERATING: string;
  TXT_FAIL: string;
  TXT_COMPLETE: string;
  TXT_ERROR: string;
  TXT_ANALYZING: string;
  TXT_ANALYZED: string;
  TXT_ANALYSIS_FAILED: string;
  TXT_EXECUTE: string;
  TXT_NEXT: string;
  TXT_EXECUTE2: string;
  TXT_NEXT2: string;
  TXT_STOP: string;
  TXT_FINISH: string;
  TXT_ON_GENERATING_CODE: string;
  TXT_CODE_GEN_COMPLETE: string;
  TXT_CODE_GEN_CANCEL: string;
  TXT_CODE_GEN_ERROR: string;
  TXT_ELEMENT_CODE_GENERATING: string;
  TXT_ELEMENT_CODE_GENERATED: string;
  TXT_REVERSE_BEGIN: string;
  TXT_ANALYZE_FILE: string;
  TXT_CREATE_MODEL: string;
  TXT_REVISE_REFERENCE: string;
  TXT_CREATE_DIAGRAM: string;
  TXT_UPDATE_BROWSER: string;
  TXT_CANT_STOP: string;
  TXT_REVERSE_COMPLETE: string;
  TXT_REVERSE_RESULT_DIRECTION: string;
  TXT_REVERSE_CANCEL: string;
  TXT_ELEMENT_CREATED: string;
  TXT_DIAGRAM_CREATED: string;
  TXT_REVERSE_ERROR: string;
  MSG_DLG_CODE_GEN_COMPLETE: string;
  MSG_DLG_CODE_GEN_CANCEL: string;
  MSG_DLG_REVERSE_COMPLETE: string;
  MSG_DLG_REVERSE_CANCEL: string;
  ERR_DLG_CODE_GEN_ERROR: string;
  ERR_DLG_REVERSE_ERROR: string;
  QUERY_CANCEL_REVERSE: string;
  QUERY_REVERSE_PROFILE_LOAD: string;
  ERR_CODE_GEN_PROFILE_NOT_LOADED: string;
  ERR_PROFILE_NOT_DEFINED: string;
  QUERY_CANCEL_CODE_GEN: string;

  function GetDllPath: string;

implementation

uses
  NLS,
  Classes, SysUtils, Windows,  ShellCtrls, JvWizard, ElTree;

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

  NLSManager.RegisterNLSComponent(TElTree, False, NLS_ElTree_Import, NLS_ElTree_Export);
  NLSManager.RegisterNLSComponent(TShellTreeView, False, NLS_ShellTreeView_Import, NLS_ShellTreeView_Export);
  NLSManager.RegisterNLSComponent(TJvWizard, True, NLS_JvWizard_Import, NLS_JvWizard_Export);
  NLSManager.RegisterNLSComponent(TJvWizardInteriorPage, True, NLS_JvWizardInteriorPage_Import, NLS_JvWizardInteriorPage_Export);

  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_CODE_GEN_BEGIN', MSG_CODE_GEN_BEGIN, C_MSG_CODE_GEN_BEGIN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_CODE_GEN_FINISH', MSG_CODE_GEN_FINISH, C_MSG_CODE_GEN_FINISH);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_CODE_GEN_CANCEL', MSG_CODE_GEN_CANCEL, C_MSG_CODE_GEN_CANCEL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CODE_GEN_ERROR', ERR_CODE_GEN_ERROR, C_ERR_CODE_GEN_ERROR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CODE_GEN_ERROR2', ERR_CODE_GEN_ERROR2, C_ERR_CODE_GEN_ERROR2);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_REVERSE_BEGIN', MSG_REVERSE_BEGIN, C_MSG_REVERSE_BEGIN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_REVERSE_FINISH', MSG_REVERSE_FINISH, C_MSG_REVERSE_FINISH);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_REVERSE_CANCEL', MSG_REVERSE_CANCEL, C_MSG_REVERSE_CANCEL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ELEMENT_NAME_CHANGED', MSG_ELEMENT_NAME_CHANGED, C_MSG_ELEMENT_NAME_CHANGED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_PARSING_ERROR', ERR_PARSING_ERROR, C_ERR_PARSING_ERROR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_REVERSE_NO_SUPER_CLASS', ERR_REVERSE_NO_SUPER_CLASS, C_ERR_REVERSE_NO_SUPER_CLASS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_REVERSE_NO_SUPER_INTERFACE', ERR_REVERSE_NO_SUPER_INTERFACE, C_ERR_REVERSE_NO_SUPER_INTERFACE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_REVERSE_NO_SUPER_INTERFACE2', ERR_REVERSE_NO_SUPER_INTERFACE2, C_ERR_REVERSE_NO_SUPER_INTERFACE2);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_CODE_GEN_NONAME', MSG_CODE_GEN_NONAME, C_MSG_CODE_GEN_NONAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_CODE_GEN_NAMESPACE_NONAME', MSG_CODE_GEN_NAMESPACE_NONAME, C_MSG_CODE_GEN_NAMESPACE_NONAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_CODE_GEN_IMPORT_NONAME', MSG_CODE_GEN_IMPORT_NONAME, C_MSG_CODE_GEN_IMPORT_NONAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_REVERSE_ERROR', ERR_REVERSE_ERROR, C_ERR_REVERSE_ERROR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_OPTION', ERR_INVALID_OPTION, C_ERR_INVALID_OPTION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_TAG_DEFINITION_NOT_DEFINED', ERR_TAG_DEFINITION_NOT_DEFINED, C_ERR_TAG_DEFINITION_NOT_DEFINED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CANNOT_READ_TAG_VALUE', ERR_CANNOT_READ_TAG_VALUE, C_ERR_CANNOT_READ_TAG_VALUE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_WAITING', TXT_WAITING, C_TXT_WAITING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_GENERATING', TXT_GENERATING, C_TXT_GENERATING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_FAIL', TXT_FAIL, C_TXT_FAIL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COMPLETE', TXT_COMPLETE, C_TXT_COMPLETE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ERROR', TXT_ERROR, C_TXT_ERROR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ANALYZING', TXT_ANALYZING, C_TXT_ANALYZING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ANALYZED', TXT_ANALYZED, C_TXT_ANALYZED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ANALYSIS_FAILED', TXT_ANALYSIS_FAILED, C_TXT_ANALYSIS_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_EXECUTE', TXT_EXECUTE, C_TXT_EXECUTE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_NEXT', TXT_NEXT, C_TXT_NEXT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_STOP', TXT_STOP, C_TXT_STOP);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_FINISH', TXT_FINISH, C_TXT_FINISH);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ON_GENERATING_CODE', TXT_ON_GENERATING_CODE, C_TXT_ON_GENERATING_CODE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CODE_GEN_COMPLETE', TXT_CODE_GEN_COMPLETE, C_TXT_CODE_GEN_COMPLETE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CODE_GEN_CANCEL', TXT_CODE_GEN_CANCEL, C_TXT_CODE_GEN_CANCEL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CODE_GEN_ERROR', TXT_CODE_GEN_ERROR, C_TXT_CODE_GEN_ERROR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEMENT_CODE_GENERATING', TXT_ELEMENT_CODE_GENERATING, C_TXT_ELEMENT_CODE_GENERATING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEMENT_CODE_GENERATED', TXT_ELEMENT_CODE_GENERATED, C_TXT_ELEMENT_CODE_GENERATED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REVERSE_BEGIN', TXT_REVERSE_BEGIN, C_TXT_REVERSE_BEGIN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ANALYZE_FILE', TXT_ANALYZE_FILE, C_TXT_ANALYZE_FILE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CREATE_MODEL', TXT_CREATE_MODEL, C_TXT_CREATE_MODEL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REVISE_REFERENCE', TXT_REVISE_REFERENCE, C_TXT_REVISE_REFERENCE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CREATE_DIAGRAM', TXT_CREATE_DIAGRAM, C_TXT_CREATE_DIAGRAM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_UPDATE_BROWSER', TXT_UPDATE_BROWSER, C_TXT_UPDATE_BROWSER);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CANT_STOP ', TXT_CANT_STOP , C_TXT_CANT_STOP );
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REVERSE_COMPLETE', TXT_REVERSE_COMPLETE, C_TXT_REVERSE_COMPLETE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REVERSE_RESULT_DIRECTION', TXT_REVERSE_RESULT_DIRECTION, C_TXT_REVERSE_RESULT_DIRECTION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REVERSE_CANCEL', TXT_REVERSE_CANCEL, C_TXT_REVERSE_CANCEL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEMENT_CREATED', TXT_ELEMENT_CREATED, C_TXT_ELEMENT_CREATED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_DIAGRAM_CREATED', TXT_DIAGRAM_CREATED, C_TXT_DIAGRAM_CREATED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REVERSE_ERROR', TXT_REVERSE_ERROR, C_TXT_REVERSE_ERROR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_DLG_CODE_GEN_COMPLETE', MSG_DLG_CODE_GEN_COMPLETE, C_MSG_DLG_CODE_GEN_COMPLETE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_DLG_CODE_GEN_CANCEL', MSG_DLG_CODE_GEN_CANCEL, C_MSG_DLG_CODE_GEN_CANCEL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_DLG_REVERSE_COMPLETE', MSG_DLG_REVERSE_COMPLETE, C_MSG_DLG_REVERSE_COMPLETE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_DLG_REVERSE_CANCEL', MSG_DLG_REVERSE_CANCEL, C_MSG_DLG_REVERSE_CANCEL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_DLG_CODE_GEN_ERROR', ERR_DLG_CODE_GEN_ERROR, C_ERR_DLG_CODE_GEN_ERROR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_DLG_REVERSE_ERROR', ERR_DLG_REVERSE_ERROR, C_ERR_DLG_REVERSE_ERROR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'QUERY_CANCEL_REVERSE', QUERY_CANCEL_REVERSE, C_QUERY_CANCEL_REVERSE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'QUERY_REVERSE_PROFILE_LOAD', QUERY_REVERSE_PROFILE_LOAD, C_QUERY_REVERSE_PROFILE_LOAD);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CODE_GEN_PROFILE_NOT_LOADED', ERR_CODE_GEN_PROFILE_NOT_LOADED, C_ERR_CODE_GEN_PROFILE_NOT_LOADED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_PROFILE_NOT_DEFINED', ERR_PROFILE_NOT_DEFINED, C_ERR_PROFILE_NOT_DEFINED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'QUERY_CANCEL_CODE_GEN', QUERY_CANCEL_CODE_GEN, C_QUERY_CANCEL_CODE_GEN);
end.
