unit NLS_RoseAddIn;

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
  C_TXT_INVALID_NAME_CHANGE_TO = 'name-changed';
  C_TXT_NAME_DISTINGUISHER = '_';
  C_TXT_ORIGINAL_WRITTEN = 'Original Written: %s';
  C_TXT_PETAL_VERSION = 'Rose Petal Version: %s';

  C_MSG_FILE_NOT_FOUND = 'File not found.' + #13#10 + '"%s"'; //Err
  C_MSG_NEW_PROJECT = 'New Project created.';
  C_MSG_START_PROCESS = 'Starting Rational Rose file import. (%s)';
  C_MSG_SUCCEED_PROCESS = 'Rational Rose file import complete.';
  C_MSG_PREPARE_PROCESS = 'Preparing for conversion process. Please wait.';
  C_MSG_CONVERT_MODEL = 'Converting model elements.';
  C_MSG_CONVERT_VIEW = 'Converting view elements.';
  C_MSG_CONVERT_PROP = 'Converting attribute values.';

  // MSG_VERSION_WARNING = '';
  C_ERR_IMPORT_FILENAME_EXTENDSION = 'Selected file is not supported (only *.mdl and *.ptl  formats allowed).';
  C_ERR_NULL_OBJECT = '%s element does not exist (null).';   //Err
  C_ERR_EMPTY_DOC = 'Nothing to convert.';
  C_ERR_ELEM_CONVERSION = '%s element "%s" cannot be converted (reason: %s).';
  C_ERR_VIEW_CONVERSION = '%s "%s": "%s" element cannot be converted (reason: %s).';
  C_ERR_INVALID_PARAM = 'Invalid generation parameter.';
  C_ERR_INVALID_ASSOC_ROLE = 'Cannot define Association End.';
  C_ERR_OBJECT_NOT_SUPPORT = 'Object element of State_Machine is not converted.';
  C_ERR_EVENT_NOT_SUPPORT = 'UponEvent type "Action" element of State is not converted.';

  C_ERR_SEND_EVENT_NOT_SUPPORT = 'SendEvent element of Transition is not converted.';
  C_ERR_MODEL_NOT_FOUND = 'Cannot define Model information.';
  C_ERR_PROP_CONVERSION = 'Cannot convert %s element attribute value(s) (reason: %s).';
  C_ERR_UNKNOWN_ELEM = 'Cannot determine element.';
  C_ERR_DATA_TOKEN_VIEW_NOT_SUPPORT = 'Data Token element is not converted.';
  C_ERR_SWIMLANE_NOT_SUPPORT = 'Swimlane element other than ActivityDiagram is not converted.';
  C_ERR_STATE_MACHINE_NOT_SUPPORT = 'State_Machine element under State type element is not converted.';
  C_ERR_STATE_ACTIVITY_NOT_SUPPORT = 'State/Activity element "%s" has been converted to %s element. Sub information may be lost due to the non-standard nature of Rose model.';

  C_MSG_ON_PARSING = 'On analyzing the file...';
  C_MSG_MAKE_NODE = 'On configuring the nodes.';

  C_ERR_NODE_NOT_FOUND = 'Cannot find the node. (%s)';
  C_ERR_REFERENCE_NOT_FOUND = 'Cannot find the object of the property value. (%s.%s)';
  C_ERR_PROPERTY_NOT_FOUND = 'No exist the property value of the given type. (%s.%s / %s)';
  C_ERR_INALID_TYPE = 'Different type of the property. (%s.%s / %s)';
  C_ERR_UNKNOWN_OBJECT = 'Undefined object. (%s)';
  C_ERR_STACK_IS_EMPTY = 'Empty stack.';
  C_ERR_INVALID_PROPERTY_STRUCT = 'Invalid property structure. (%s.%s)';

const
  NLS_FILE_NAME = 'ROSEADDIN.LNG';

var
  TXT_INVALID_NAME_CHANGE_TO: string;
  TXT_NAME_DISTINGUISHER: string;
  TXT_ORIGINAL_WRITTEN: string;
  TXT_PETAL_VERSION: string;

  MSG_FILE_NOT_FOUND: string;
  MSG_NEW_PROJECT: string;
  MSG_START_PROCESS: string;
  MSG_SUCCEED_PROCESS: string;
  MSG_PREPARE_PROCESS: string;
  MSG_CONVERT_MODEL: string;
  MSG_CONVERT_VIEW: string;
  MSG_CONVERT_PROP: string;

  // MSG_VERSION_WARNING = '';
  ERR_IMPORT_FILENAME_EXTENDSION: string;
  ERR_NULL_OBJECT: string;
  ERR_EMPTY_DOC: string;
  ERR_ELEM_CONVERSION: string;
  ERR_VIEW_CONVERSION: string;
  ERR_INVALID_PARAM: string;
  ERR_INVALID_ASSOC_ROLE: string;
  ERR_OBJECT_NOT_SUPPORT: string;
  ERR_EVENT_NOT_SUPPORT: string;
  ERR_SEND_EVENT_NOT_SUPPORT: string;
  ERR_MODEL_NOT_FOUND: string;
  ERR_PROP_CONVERSION: string;
  ERR_UNKNOWN_ELEM: string;
  ERR_DATA_TOKEN_VIEW_NOT_SUPPORT: string;
  ERR_SWIMLANE_NOT_SUPPORT: string;
  ERR_STATE_MACHINE_NOT_SUPPORT: string;
  ERR_STATE_ACTIVITY_NOT_SUPPORT: string;

  MSG_ON_PARSING: string;
  MSG_MAKE_NODE: string;
  ERR_NODE_NOT_FOUND: string;
  ERR_REFERENCE_NOT_FOUND: string;
  ERR_PROPERTY_NOT_FOUND: string;
  ERR_INALID_TYPE: string;
  ERR_UNKNOWN_OBJECT: string;
  ERR_STACK_IS_EMPTY: string;
  ERR_INVALID_PROPERTY_STRUCT: string;

implementation
uses
  NLS, Utilities,
  SysUtils, Windows;

const
  NLS_STR_SECTION = 'Strings';

initialization
  //NLSManager.SetExportMode;
  NLSManager.SetImportMode;

  { Translate Strings }
  NLSManager.SetFile(GetDllPath + '\' + NLS_FILE_NAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_INVALID_NAME_CHANGE_TO', TXT_INVALID_NAME_CHANGE_TO, C_TXT_INVALID_NAME_CHANGE_TO);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_NAME_DISTINGUISHER', TXT_NAME_DISTINGUISHER, C_TXT_NAME_DISTINGUISHER);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ORIGINAL_WRITTEN', TXT_ORIGINAL_WRITTEN, C_TXT_ORIGINAL_WRITTEN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PETAL_VERSION', TXT_PETAL_VERSION, C_TXT_PETAL_VERSION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_FILE_NOT_FOUND', MSG_FILE_NOT_FOUND, C_MSG_FILE_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_NEW_PROJECT', MSG_NEW_PROJECT, C_MSG_NEW_PROJECT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_START_PROCESS', MSG_START_PROCESS, C_MSG_START_PROCESS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_SUCCEED_PROCESS', MSG_SUCCEED_PROCESS, C_MSG_SUCCEED_PROCESS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_PREPARE_PROCESS', MSG_PREPARE_PROCESS, C_MSG_PREPARE_PROCESS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_CONVERT_MODEL', MSG_CONVERT_MODEL, C_MSG_CONVERT_MODEL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_CONVERT_VIEW', MSG_CONVERT_VIEW, C_MSG_CONVERT_VIEW);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_CONVERT_PROP', MSG_CONVERT_PROP, C_MSG_CONVERT_PROP);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_IMPORT_FILENAME_EXTENDSION', ERR_IMPORT_FILENAME_EXTENDSION, C_ERR_IMPORT_FILENAME_EXTENDSION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_NULL_OBJECT', ERR_NULL_OBJECT, C_ERR_NULL_OBJECT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_EMPTY_DOC', ERR_EMPTY_DOC, C_ERR_EMPTY_DOC);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ELEM_CONVERSION', ERR_ELEM_CONVERSION, C_ERR_ELEM_CONVERSION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_VIEW_CONVERSION', ERR_VIEW_CONVERSION, C_ERR_VIEW_CONVERSION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_PARAM', ERR_INVALID_PARAM, C_ERR_INVALID_PARAM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_ASSOC_ROLE', ERR_INVALID_ASSOC_ROLE, C_ERR_INVALID_ASSOC_ROLE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_OBJECT_NOT_SUPPORT', ERR_OBJECT_NOT_SUPPORT, C_ERR_OBJECT_NOT_SUPPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_EVENT_NOT_SUPPORT', ERR_EVENT_NOT_SUPPORT, C_ERR_EVENT_NOT_SUPPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_SEND_EVENT_NOT_SUPPORT', ERR_SEND_EVENT_NOT_SUPPORT, C_ERR_SEND_EVENT_NOT_SUPPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_MODEL_NOT_FOUND', ERR_MODEL_NOT_FOUND, C_ERR_MODEL_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_PROP_CONVERSION', ERR_PROP_CONVERSION, C_ERR_PROP_CONVERSION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_UNKNOWN_ELEM', ERR_UNKNOWN_ELEM, C_ERR_UNKNOWN_ELEM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_DATA_TOKEN_VIEW_NOT_SUPPORT', ERR_DATA_TOKEN_VIEW_NOT_SUPPORT, C_ERR_DATA_TOKEN_VIEW_NOT_SUPPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_SWIMLANE_NOT_SUPPORT', ERR_SWIMLANE_NOT_SUPPORT, C_ERR_SWIMLANE_NOT_SUPPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_STATE_MACHINE_NOT_SUPPORT', ERR_STATE_MACHINE_NOT_SUPPORT, C_ERR_STATE_MACHINE_NOT_SUPPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_STATE_ACTIVITY_NOT_SUPPORT', ERR_STATE_ACTIVITY_NOT_SUPPORT, C_ERR_STATE_ACTIVITY_NOT_SUPPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ON_PARSING', MSG_ON_PARSING, C_MSG_ON_PARSING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_MAKE_NODE', MSG_MAKE_NODE, C_MSG_MAKE_NODE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_NODE_NOT_FOUND', ERR_NODE_NOT_FOUND, C_ERR_NODE_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_REFERENCE_NOT_FOUND', ERR_REFERENCE_NOT_FOUND, C_ERR_REFERENCE_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_PROPERTY_NOT_FOUND', ERR_PROPERTY_NOT_FOUND, C_ERR_PROPERTY_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INALID_TYPE', ERR_INALID_TYPE, C_ERR_INALID_TYPE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_UNKNOWN_OBJECT', ERR_UNKNOWN_OBJECT, C_ERR_UNKNOWN_OBJECT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_STACK_IS_EMPTY', ERR_STACK_IS_EMPTY, C_ERR_STACK_IS_EMPTY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_PROPERTY_STRUCT', ERR_INVALID_PROPERTY_STRUCT, C_ERR_INVALID_PROPERTY_STRUCT);
end.
