unit Symbols;

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
  // XML node names
  NODE_APPROACH = 'APPROACH';
  NODE_ATTACHFILE = 'ATTACHFILE';
  NODE_ATTACHFILES = 'ATTACHFILES';
  NODE_CATEGORY = 'CATEGORY';
  NODE_DATE = 'DATE';
  NODE_DESCRIPTION = 'DESCRIPTION';
  NODE_DIRECTMDAGENERATIONUNIT = 'GENERATORTEMPLATE';
  NODE_DOCUMENTTYPE = 'DOCUMENTTYPE';
  NODE_FORMAT = 'FORMAT';
  NODE_GROUP = 'GROUP';
  NODE_NAME = 'NAME';
  NODE_PARAMETER = 'PARAMETER';
  NODE_PARAMETERS = 'PARAMETERS';
  NODE_PREVIEW = 'PREVIEW';
  NODE_PREVIEWS = 'PREVIEWS';
  NODE_PROFILE = 'PROFILE';
  NODE_PROFILES = 'PROFILES';
  NODE_SAMPLE = 'SAMPLE';
  NODE_TRANSLATORNAME = 'TRANSLATORNAME';
  NODE_TRANSLATORTYPE = 'TRANSLATORTYPE';
  NODE_TUTORIAL = 'TUTORIAL';
  NODE_TYPE = 'TYPE';
  NODE_VALIDATOR = 'VALIDATOR';
  NODE_VERSION = 'VERSION';
  NODE_VALUE = 'VALUE';

  NODE_DIRECTMDABATCH = 'BATCH';
  NODE_TASK = 'TASK';
  NODE_TASKS = 'TASKS';
  NODE_SELECTED = 'SELECTED';
  NODE_GENERATIONUNIT = 'TEMPLATE';

  // XML node values
  VALUE_DOCTYPE_DOCUMENT = 'DOCUMENT';
  VALUE_DOCTYPE_REPORT = 'REPORT';
  VALUE_DOCTYPE_SOURCE = 'CODE';

  VALUE_TRANSTYPE_WORD = 'WORD';
  VALUE_TRANSTYPE_EXCEL = 'EXCEL';
  VALUE_TRANSTYPE_POWERPOINT = 'POWERPOINT';
  VALUE_TRANSTYPE_TEXT = 'TEXT';
  VALUE_TRANSTYPE_COM = 'COM';
  VALUE_TRANSTYPE_SCRIPT = 'SCRIPT';
  VALUE_TRANSTYPE_EXE = 'EXE';

  VALUE_PARAM_STRING = 'STRING';
  VALUE_PARAM_INTEGER = 'INTEGER';
  VALUE_PARAM_BOOLEAN = 'BOOLEAN';
  VALUE_PARAM_ELEMENT = 'ELEMENT';
  VALUE_PARAM_FILENAME = 'FILENAME';
  VALUE_PARAM_PATHNAME = 'PATHNAME';
  VALUE_PARAM_DATE = 'DATE';

  // Symbols in XML files
  SYMBOL_DIRECTMDA = '$TEMPLATES$';
  SYMBOL_GROUP = '$GROUP$';
  SYMBOL_CATEGORY = '$CATEGORY$';
  SYMBOL_NAME = '$NAME$';
  SYMBOL_PATH = '$PATH$';
  SYMBOL_TARGET = '$TARGET$';

  // Registry keys, pathes, values
(*
  PATH_PLASTIC_SOFTWARE = 'SOFTWARE\PLASTIC SOFTWARE';
  KEY_PLASTIC = 'PLASTIC';
  KEY_DIRECT_MDA = 'GENERATOR';
  PATH_PLASTIC = PATH_PLASTIC_SOFTWARE + '\' + KEY_PLASTIC;
  PATH_DIRECT_MDA = PATH_PLASTIC_SOFTWARE + '\' + KEY_DIRECT_MDA;
  VALUE_INSTALL_DIR = 'InstallDir';
*)
  // Directories
  DIR_GENERATION_UNITS = 'Templates';
  DIR_BATCHES = 'Batches';

  // File extensions
  EXT_TDF = '.tdf';
  EXT_BTF = '.btf';

  // Grid column index
  COL_CHECK = 'CheckColumn';
  COL_GROUP = 'GroupColumn';
  COL_CATEGORY = 'CategoryColumn';
  COL_PREVIEW = 'PreviewColumn';
  COL_NAME = 'NameColumn';
  COL_DOC_TYPE = 'DocTypeColumn';
  COL_FORMAT = 'FormatColumn';
  COL_TUTORIAL = 'TutorialColumn';
  COL_PARAMETERS = 'ParametersColumn';

  COL_PROFILE_CHECK = 'CheckColumn';
  COL_PROFILE_ICON = 'ProfileIconColumn';
  COL_PROFILE_NAME = 'ProfileNameColumn';

  COL_PARAM_NAME = 'ParamNameColumn';
  COL_PARAM_TYPE = 'ParamTypeColumn';
  COL_PARAM_VALUE = 'ParamValueColumn';

  COL_EXEC_STATE = 'ExecStateColumn';
  COL_EXEC_GROUP = 'ExecGroupColumn';
  COL_EXEC_CATEGORY = 'ExecCategoryColumn';
  COL_EXEC_DOC_NAME = 'ExecDocNameColumn';
  COL_EXEC_PATH = 'ExecPathColumn';
  COL_EXEC_PROGRESS = 'ExecProgressColumn';
  COL_EXEC_FULL_PATH = 'ExecFullPathColumn';

  // COM name of predefined generators
  GEN_WORD = 'WSWordTranslator.WordTranslatorObj';
  GEN_EXCEL = 'WSExcelTranslator.ExcelTranslatorObj';
  GEN_POWERPOINT = 'WSPowerPointTranslator.PowerPointTranslatorObj';
  GEN_TEXT = 'WSTextTranslator.TextTranslatorObj';

  // Misc
  ENCODING_EUC_KR = 'EUC-KR';
  VER_BATCH = '1.0';
  VER_GENERATION_UNIT = '1.0';
  FRAME_PREFIX = 'BatchFrame';
  BATCH_DEFAULT = 'DIRECTMDA_DEFAULT';

  DEFAULT_FILTERINGSET: array [0..55] of string = (
    'UMLModel', 'UMLSubsystem', 'UMLPackage', 'UMLClass', 'UMLInterface',
    'UMLEnumeration', 'UMLSignal', 'UMLException', 'UMLComponent',
    'UMLComponentInstance', 'UMLNode', 'UMLNodeInstance', 'UMLUseCase', 'UMLActor',
    'UMLActivityGraph', 'UMLStateMachine', 'UMLCompositeState', 'UMLCollaboration',
    'UMLCollaborationInstanceSet', 'UMLInteraction', 'UMLInteractionInstanceSet',
    'UMLActionState', 'UMLSubactivityState', 'UMLPseudostate', 'UMLFinalState',
    'UMLPartition', 'UMLSubmachineState', 'UMLAttribute', 'UMLOperation',
    'UMLParameter', 'UMLTemplateParameter', 'UMLEnumerationLiteral', 'UMLCallAction',
    'UMLSendAction', 'UMLCreateAction', 'UMLDestroyAction', 'UMLReturnAction',
    'UMLUninterpretedAction', 'UMLSignalEvent', 'UMLCallEvent', 'UMLTimeEvent',
    'UMLChangeEvent', 'UMLClassifierRole', 'UMLObject', 'UMLStimulus', 'UMLMessage',
    'UMLClassDiagram', 'UMLUseCaseDiagram', 'UMLSequenceDiagram',
    'UMLSequenceRoleDiagram', 'UMLCollaborationDiagram',
    'UMLCollaborationRoleDiagram', 'UMLStatechartDiagram', 'UMLActivityDiagram',
    'UMLComponentDiagram', 'UMLDeploymentDiagram');

  C_ERR_INVALID_REGISTRATION = 'Improper Serial number.'
    + #13#10 + 'Confirm and retry again.';
  C_ERR_PERSONAL_EDITION = 'It is not available in personal version.';
  C_ERR_TRIAL_EDITION = 'Trial date is expired.';
  C_FIELD_CANNOT_BE_EMPTY = 'Field cannot be empty';
  C_FIELD_AUTO_DERIVE = 'Leave empty to auto derive file name from template name';
  C_ERR_DUPLICATE_TEMPLATE_NAME = 'Template with the same name/group (%s/%s) already exists.';


  GENERATOR_ENGINE_LOCATION = 'modules\staruml-generator';

implementation

end.
