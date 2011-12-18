unit NLS_XMIAddIn;

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
  C_TXT_DUMMY_MODEL = 'Dummy Model';
  C_TXT_COMMON_UNKNOWN = '(Unknown)';
  C_TXT_INVALID_XMI_FILE = 'XMI file is not valid.';
  C_TXT_UNSUPPORT_XMI_VER = '(Notice) XMI file contains information other than '+
                            'UML 1.3 or XMI 1.1 versions. XMI importing may not'+
                            ' be successful. Click the "Cancel" button to cancel import.';
  C_TXT_SELECT_PACKAGE = 'Select package element';
  C_TXT_PREPARE_IMPORT = 'Preparing for XMI import. Please wait.';
  C_TXT_CONVERT_ELEMENT = 'Converting XMI elements to UML elements.';
  C_TXT_CONVERT_PROPERTY = 'Configuring attribute values for UML elements created.';
  C_TXT_PREPARE_IMPORT_DIAGRAM = 'Preparing to generate diagram and view elements.';
  C_TXT_CONVERT_DIAGRAM = 'Generating diagram elements.';
  C_TXT_CONVERT_DIAGRAM_PROPERTY = 'Configuring attribute values for diagram elements.';
  C_TXT_CONVERT_VIEW = 'Generating view elements.';
  C_TXT_CONVERT_VIEW_PROPERTY = 'Configuring attribute values for view elements.';
  C_TXT_IMPORT_FINALIZE = 'Completing XMI import. Please wait.';
  C_TXT_IMPORT_SUCCEEDE = 'XMI import complete.';

  C_TXT_PREPARE_EXPORT = 'Preparing for XMI export. Please wait.';
  C_TXT_CREATE_XMI_ELEMENT = 'Generating XMI elements from model.';
  C_TXT_FILLOUT_XMI_ATTRIBUTE = 'Configuring attribute values for XMI elements created.';
  C_TXT_EXPORT_SUCCEEDE = 'XMI export complete.';

  C_ERR_CANNOT_READ_FILE = 'Cannot read information from XMI file (reason: "%s").';
  C_ERR_PROJECT_NOT_FOUND = 'Project element does not exist.';
  C_ERR_CREATE_ELEM_NO_NAMESPACE = 'Cannot determine Namespace required for generation.';
  C_ERR_CREATE_ELEM_NO_CONTEXT = 'Cannot determine Context required for generation.';
  C_ERR_CREATE_ELEM_NO_OWNER = 'Cannot determine Owner required for generation.';
  C_ERR_CREATE_ELEM_NO_COLLABORATION = 'Cannot determine Collaboration required for generation.';
  C_ERR_CREATE_ELEM_NO_INTERACTION = 'Cannot determine Interaction required for generation.';
  C_ERR_CREATE_ELEM_NO_TOP_STATE = 'Cannot determine Top State.';
  C_ERR_CREATE_ELEM_NO_OWNER_STATE = 'Cannot determine Owner State required for generation.';
  C_ERR_CREATE_ELEM_NO_ACTIVITY_GRAPH = 'Cannot determine Activity Graph required for generation.';
  C_ERR_CREATE_ELEM_NO_CLASSIFIER = 'Cannot determine Classifier required for generation.';
  C_ERR_CREATE_ELEM_NO_ASSOC_END = 'Cannot determine Association End required for generation.';
  C_ERR_CREATE_ELEM_NO_STATE_MACHINE = 'Cannot determine State Machine required for generation.';
  C_ERR_CREATE_ELEM_NO_PARAM = 'Cannot determine upper element required for generation.';
  C_ERR_CREATE_ELEM_NO_TRANSITION = 'Cannot determine Transition required for generation.';
  C_ERR_CREATE_ELEM_NO_CONN = 'Cannot configure connection.';
  C_ERR_CREATE_TEMPLATE_PARAM = 'Template Parameters other than Class or Collaboration elements are not converted.';
  C_ERR_CREATE_ASSOCIATION_ROLE = 'Conversion avaliable only for Association Roles connecting Classifier Roles.';
  C_ERR_ERROR_RAISED = 'Error(s) occurred while exporting XMI.\n\rError message: %s';
  C_ERR_DIRECTORY_NOT_FOUND = 'Cannot find directory';
  C_ERR_INVALID_FILE_NAME = 'Invalid file name.'
                          + #13#10 + 'File name cannot have \\, /, :, *, ?, ", <, >, |';

  C_MSG_XMI_IMPORT = 'Importing XMI:';
  C_MSG_NEW_PROJECT = C_MSG_XMI_IMPORT + 'Importing XMI: New project has been created.';
  C_MSG_NEW_PROJECT_WITH_APPR = C_MSG_NEW_PROJECT + ' (Rational Approach)';
  C_MSG_DUMMY_MODEL_CREATED = C_MSG_XMI_IMPORT + 'UMLModel element "' + C_TXT_DUMMY_MODEL + '" has been created.';
  C_MSG_IMPORT_START = 'Starting XMI import (%s).';
  C_MSG_IMPORT_SUCCEEDE = 'XMI import complete.';
  C_MSG_IMPORT_FAILED = 'Cannot complete XMI import (reason: "%s").';
  C_MSG_IMPORT_FAILED2 = 'Cannot complete XMI import.' + #13#10 +
                       'Refer to the log in the [output window] for details.';
  C_MSG_ELEM_CONVERSION_FAILED = 'Could not convert XMI element "%s" (xmi.id: %s) (reason: "%s").';
  C_MSG_PROP_CONVERSION_FAILED = 'Could not configure attribute values for UML element "%s" (reason: "%s").';
  C_MSG_ELEM_NOT_CONVERT = 'XMI element "%s" is not converted to UML element.';
  C_MSG_ELEM_NOT_SUPPORT = 'XMI element "%s" is not converted.';
  C_MSG_ELEM_NOT_SUPPORT_EMBEDDING = 'Child node %s of XMI node %s is not converted.';
  C_MSG_DIAGRAM_NO_TYPE = 'Diagram type not specified.';
  C_MSG_DIAGRAM_NOT_SUPPORT = '%s type diagram is not generated.';
  C_MSG_DIAGRAM_CONVERSION_FAILED = 'Could not generate %s type diagram (xmi.id: %s) (reason: "%s").';
  C_MSG_DIAGRAM_CONVERSION_FAILED2 = 'Could not generate XMI element "%s" (xmi.id: %s) as diagram element (reason: "%s").';
  C_MSG_VIEW_CONVERSION_FAILED = 'Could not generate %s type view element (xmi.id: %s) (reason: "%s").';
  C_MSG_ELEM_NAME_CHANGED = 'Duplicate or invalid element names have been automatically renamed ("%s" -> "%s").';
  C_MSG_MODEL_ELEM_PROP_NOT_SUPPORT = '"%s" attribute of %s type element is not converted.';
  C_MSG_XMI_INVALID_PACKAGE_ASSOCIATION = 'Associations that connect Package or Model cannot be converted to XMI.';
  C_MSG_XMI_INVALID_STATEMACHINE = 'StateMachine belonging to elements other than Namespace cannot be converted to XMI.';
  C_MSG_XMI_INVALID_SYNCHRONIZATION = 'Synchronization without 1:n or n:1 Transition cannot be converted to XMI.';
  C_MSG_EXPORT_START = 'Starting XMI export (%s).';
  C_MSG_EXPORT_SUCCEEDE = 'XMI export complete.';
  C_MSG_EXPORT_FAILED = 'XMI export failed.';

  C_QUERY_OVERWRITE = '%s already exists.\n\rDo you want to change it?';

const  
  NLS_FILE_NAME = 'XMIADDIN.LNG';

var
  TXT_INVALID_NAME_CHANGE_TO: string;
  TXT_NAME_DISTINGUISHER: string;
  TXT_DUMMY_MODEL: string;
  TXT_COMMON_UNKNOWN: string;
  TXT_INVALID_XMI_FILE: string;
  TXT_UNSUPPORT_XMI_VER: string;
  TXT_SELECT_PACKAGE: string;
  TXT_PREPARE_IMPORT: string;
  TXT_CONVERT_ELEMENT: string;
  TXT_CONVERT_PROPERTY: string;
  TXT_PREPARE_IMPORT_DIAGRAM: string;
  TXT_CONVERT_DIAGRAM: string;
  TXT_CONVERT_DIAGRAM_PROPERTY: string;
  TXT_CONVERT_VIEW: string;
  TXT_CONVERT_VIEW_PROPERTY: string;
  TXT_IMPORT_FINALIZE: string;
  TXT_IMPORT_SUCCEEDE: string;

  TXT_PREPARE_EXPORT: string;
  TXT_CREATE_XMI_ELEMENT: string;
  TXT_FILLOUT_XMI_ATTRIBUTE: string;
  TXT_EXPORT_SUCCEEDE: string;

  ERR_CANNOT_READ_FILE: string;
  ERR_PROJECT_NOT_FOUND: string;
  ERR_CREATE_ELEM_NO_NAMESPACE: string;
  ERR_CREATE_ELEM_NO_CONTEXT: string;
  ERR_CREATE_ELEM_NO_OWNER: string;
  ERR_CREATE_ELEM_NO_COLLABORATION: string;
  ERR_CREATE_ELEM_NO_INTERACTION: string;
  ERR_CREATE_ELEM_NO_TOP_STATE: string;
  ERR_CREATE_ELEM_NO_OWNER_STATE: string;
  ERR_CREATE_ELEM_NO_ACTIVITY_GRAPH: string;
  ERR_CREATE_ELEM_NO_CLASSIFIER: string;
  ERR_CREATE_ELEM_NO_ASSOC_END: string;
  ERR_CREATE_ELEM_NO_STATE_MACHINE: string;
  ERR_CREATE_ELEM_NO_PARAM: string;
  ERR_CREATE_ELEM_NO_TRANSITION: string;
  ERR_CREATE_ELEM_NO_CONN: string;
  ERR_CREATE_TEMPLATE_PARAM: string;
  ERR_CREATE_ASSOCIATION_ROLE: string;
  ERR_ERROR_RAISED: string;
  ERR_DIRECTORY_NOT_FOUND: string;
  ERR_INVALID_FILE_NAME: string;

  MSG_XMI_IMPORT: string;
  MSG_NEW_PROJECT: string;
  MSG_NEW_PROJECT_WITH_APPR: string;
  MSG_DUMMY_MODEL_CREATED: string;
  MSG_IMPORT_START: string;
  MSG_IMPORT_SUCCEEDE: string;
  MSG_IMPORT_FAILED: string;
  MSG_IMPORT_FAILED2: string;
  MSG_ELEM_CONVERSION_FAILED: string;
  MSG_PROP_CONVERSION_FAILED: string;
  MSG_ELEM_NOT_CONVERT: string;
  MSG_ELEM_NOT_SUPPORT: string;
  MSG_ELEM_NOT_SUPPORT_EMBEDDING: string;
  MSG_DIAGRAM_NO_TYPE: string;
  MSG_DIAGRAM_NOT_SUPPORT: string;
  MSG_DIAGRAM_CONVERSION_FAILED: string;
  MSG_DIAGRAM_CONVERSION_FAILED2: string;
  MSG_VIEW_CONVERSION_FAILED: string;
  MSG_ELEM_NAME_CHANGED: string;
  MSG_MODEL_ELEM_PROP_NOT_SUPPORT: string;
  MSG_XMI_INVALID_PACKAGE_ASSOCIATION: string;
  MSG_XMI_INVALID_STATEMACHINE: string;
  MSG_XMI_INVALID_SYNCHRONIZATION: string;
  MSG_EXPORT_START: string;
  MSG_EXPORT_SUCCEEDE: string;
  MSG_EXPORT_FAILED: string;

  QUERY_OVERWRITE: string;

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
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_DUMMY_MODEL', TXT_DUMMY_MODEL, C_TXT_DUMMY_MODEL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COMMON_UNKNOWN', TXT_COMMON_UNKNOWN, C_TXT_COMMON_UNKNOWN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_INVALID_XMI_FILE', TXT_INVALID_XMI_FILE, C_TXT_INVALID_XMI_FILE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_UNSUPPORT_XMI_VER', TXT_UNSUPPORT_XMI_VER, C_TXT_UNSUPPORT_XMI_VER);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_SELECT_PACKAGE', TXT_SELECT_PACKAGE, C_TXT_SELECT_PACKAGE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PREPARE_IMPORT', TXT_PREPARE_IMPORT, C_TXT_PREPARE_IMPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CONVERT_ELEMENT', TXT_CONVERT_ELEMENT, C_TXT_CONVERT_ELEMENT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CONVERT_PROPERTY', TXT_CONVERT_PROPERTY, C_TXT_CONVERT_PROPERTY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PREPARE_IMPORT_DIAGRAM', TXT_PREPARE_IMPORT_DIAGRAM, C_TXT_PREPARE_IMPORT_DIAGRAM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CONVERT_DIAGRAM', TXT_CONVERT_DIAGRAM, C_TXT_CONVERT_DIAGRAM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CONVERT_DIAGRAM_PROPERTY', TXT_CONVERT_DIAGRAM_PROPERTY, C_TXT_CONVERT_DIAGRAM_PROPERTY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CONVERT_VIEW', TXT_CONVERT_VIEW, C_TXT_CONVERT_VIEW);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CONVERT_VIEW_PROPERTY', TXT_CONVERT_VIEW_PROPERTY, C_TXT_CONVERT_VIEW_PROPERTY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_IMPORT_FINALIZE', TXT_IMPORT_FINALIZE, C_TXT_IMPORT_FINALIZE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_IMPORT_SUCCEEDE', TXT_IMPORT_SUCCEEDE, C_TXT_IMPORT_SUCCEEDE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PREPARE_EXPORT', TXT_PREPARE_EXPORT, C_TXT_PREPARE_EXPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CREATE_XMI_ELEMENT', TXT_CREATE_XMI_ELEMENT, C_TXT_CREATE_XMI_ELEMENT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_FILLOUT_XMI_ATTRIBUTE', TXT_FILLOUT_XMI_ATTRIBUTE, C_TXT_FILLOUT_XMI_ATTRIBUTE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_EXPORT_SUCCEEDE', TXT_EXPORT_SUCCEEDE, C_TXT_EXPORT_SUCCEEDE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CANNOT_READ_FILE', ERR_CANNOT_READ_FILE, C_ERR_CANNOT_READ_FILE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_PROJECT_NOT_FOUND', ERR_PROJECT_NOT_FOUND, C_ERR_PROJECT_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_NAMESPACE', ERR_CREATE_ELEM_NO_NAMESPACE, C_ERR_CREATE_ELEM_NO_NAMESPACE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_CONTEXT', ERR_CREATE_ELEM_NO_CONTEXT, C_ERR_CREATE_ELEM_NO_CONTEXT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_OWNER', ERR_CREATE_ELEM_NO_OWNER, C_ERR_CREATE_ELEM_NO_OWNER);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_COLLABORATION', ERR_CREATE_ELEM_NO_COLLABORATION, C_ERR_CREATE_ELEM_NO_COLLABORATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_INTERACTION', ERR_CREATE_ELEM_NO_INTERACTION, C_ERR_CREATE_ELEM_NO_INTERACTION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_TOP_STATE', ERR_CREATE_ELEM_NO_TOP_STATE, C_ERR_CREATE_ELEM_NO_TOP_STATE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_OWNER_STATE', ERR_CREATE_ELEM_NO_OWNER_STATE, C_ERR_CREATE_ELEM_NO_OWNER_STATE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_ACTIVITY_GRAPH', ERR_CREATE_ELEM_NO_ACTIVITY_GRAPH, C_ERR_CREATE_ELEM_NO_ACTIVITY_GRAPH);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_CLASSIFIER', ERR_CREATE_ELEM_NO_CLASSIFIER, C_ERR_CREATE_ELEM_NO_CLASSIFIER);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_ASSOC_END', ERR_CREATE_ELEM_NO_ASSOC_END, C_ERR_CREATE_ELEM_NO_ASSOC_END);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_STATE_MACHINE', ERR_CREATE_ELEM_NO_STATE_MACHINE, C_ERR_CREATE_ELEM_NO_STATE_MACHINE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_PARAM', ERR_CREATE_ELEM_NO_PARAM, C_ERR_CREATE_ELEM_NO_PARAM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_TRANSITION', ERR_CREATE_ELEM_NO_TRANSITION, C_ERR_CREATE_ELEM_NO_TRANSITION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ELEM_NO_CONN', ERR_CREATE_ELEM_NO_CONN, C_ERR_CREATE_ELEM_NO_CONN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_TEMPLATE_PARAM', ERR_CREATE_TEMPLATE_PARAM, C_ERR_CREATE_TEMPLATE_PARAM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CREATE_ASSOCIATION_ROLE', ERR_CREATE_ASSOCIATION_ROLE, C_ERR_CREATE_ASSOCIATION_ROLE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ERROR_RAISED', ERR_ERROR_RAISED, C_ERR_ERROR_RAISED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_DIRECTORY_NOT_FOUND', ERR_DIRECTORY_NOT_FOUND, C_ERR_DIRECTORY_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_FILE_NAME', ERR_INVALID_FILE_NAME, C_ERR_INVALID_FILE_NAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_XMI_IMPORT', MSG_XMI_IMPORT, C_MSG_XMI_IMPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_NEW_PROJECT', MSG_NEW_PROJECT, C_MSG_NEW_PROJECT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_NEW_PROJECT_WITH_APPR', MSG_NEW_PROJECT_WITH_APPR, C_MSG_NEW_PROJECT_WITH_APPR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_DUMMY_MODEL_CREATED', MSG_DUMMY_MODEL_CREATED, C_MSG_DUMMY_MODEL_CREATED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_IMPORT_START', MSG_IMPORT_START, C_MSG_IMPORT_START);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_IMPORT_SUCCEEDE', MSG_IMPORT_SUCCEEDE, C_MSG_IMPORT_SUCCEEDE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_IMPORT_FAILED', MSG_IMPORT_FAILED, C_MSG_IMPORT_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_IMPORT_FAILED2', MSG_IMPORT_FAILED2, C_MSG_IMPORT_FAILED2);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ELEM_CONVERSION_FAILED', MSG_ELEM_CONVERSION_FAILED, C_MSG_ELEM_CONVERSION_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_PROP_CONVERSION_FAILED', MSG_PROP_CONVERSION_FAILED, C_MSG_PROP_CONVERSION_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ELEM_NOT_CONVERT', MSG_ELEM_NOT_CONVERT, C_MSG_ELEM_NOT_CONVERT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ELEM_NOT_SUPPORT', MSG_ELEM_NOT_SUPPORT, C_MSG_ELEM_NOT_SUPPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ELEM_NOT_SUPPORT_EMBEDDING', MSG_ELEM_NOT_SUPPORT_EMBEDDING, C_MSG_ELEM_NOT_SUPPORT_EMBEDDING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_DIAGRAM_NO_TYPE', MSG_DIAGRAM_NO_TYPE, C_MSG_DIAGRAM_NO_TYPE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_DIAGRAM_NOT_SUPPORT', MSG_DIAGRAM_NOT_SUPPORT, C_MSG_DIAGRAM_NOT_SUPPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_DIAGRAM_CONVERSION_FAILED', MSG_DIAGRAM_CONVERSION_FAILED, C_MSG_DIAGRAM_CONVERSION_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_DIAGRAM_CONVERSION_FAILED2', MSG_DIAGRAM_CONVERSION_FAILED2, C_MSG_DIAGRAM_CONVERSION_FAILED2);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VIEW_CONVERSION_FAILED', MSG_VIEW_CONVERSION_FAILED, C_MSG_VIEW_CONVERSION_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ELEM_NAME_CHANGED', MSG_ELEM_NAME_CHANGED, C_MSG_ELEM_NAME_CHANGED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_MODEL_ELEM_PROP_NOT_SUPPORT', MSG_MODEL_ELEM_PROP_NOT_SUPPORT, C_MSG_MODEL_ELEM_PROP_NOT_SUPPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_XMI_INVALID_PACKAGE_ASSOCIATION', MSG_XMI_INVALID_PACKAGE_ASSOCIATION, C_MSG_XMI_INVALID_PACKAGE_ASSOCIATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_XMI_INVALID_STATEMACHINE', MSG_XMI_INVALID_STATEMACHINE, C_MSG_XMI_INVALID_STATEMACHINE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_XMI_INVALID_SYNCHRONIZATION', MSG_XMI_INVALID_SYNCHRONIZATION, C_MSG_XMI_INVALID_SYNCHRONIZATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_EXPORT_START', MSG_EXPORT_START, C_MSG_EXPORT_START);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_EXPORT_SUCCEEDE', MSG_EXPORT_SUCCEEDE, C_MSG_EXPORT_SUCCEEDE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_EXPORT_FAILED', MSG_EXPORT_FAILED, C_MSG_EXPORT_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'QUERY_OVERWRITE', QUERY_OVERWRITE, C_QUERY_OVERWRITE);
end.
