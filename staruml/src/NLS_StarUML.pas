unit NLS_StarUML;

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
  Classes, SysUtils, IniFiles, NLS, dxBar, ComCtrls,{dxPageControl,} {TB2Toolbar, TB2Item,}
  AreaTitleBar, FlatPanel, CompactFontDlg{, dxNavBar, dxNavBarCollns, dxNavBarStyles}{, cxPC};

const
  // Common
  C_TXT_ELEM_SEL_NOTHING = '(Nothing Selected)';
  C_TXT_ELEM_SEL_MULTIPLE = '(Multiple Elements Selected)';
  C_TXT_PROGRAM_NAME = 'WhiteStarUML';
  C_TXT_UNTITILED_PRJ = 'Untitled';
  C_TXT_DECIMAL_SEPARATOR = '.';
  C_ERR_FILE_NOT_FOUND = 'File not found (%s)';
  C_ERR_INVALID_VALUE = 'Invalid value.';
  C_ERR_INTERNAL_ERROR = 'Internal error';
  C_ERR_OUT_OF_RANGE = 'Out of range';
  C_ERR_READING_DATA = 'Data reading error';

  // WhiteStarUML
  C_TXT_APPLICATION_TITLE = 'WhiteStarUML';
  C_MSG_PERSONAL_EDITION_NOTIFICATION = 'This is a Personal Edition of StarUML. This free Personal Edition may not be used for commercial purposes. To find out what constitues commercial purposes or to purchase a full retail version of StarUML, please contact Plastic Software, Inc.';
  C_MSG_TRIAL_EXPIRED = 'Evaluation period expired on %s for this evaluation copy of StarUML.'
    + #13#10 + 'For more information on purchasing the product or product specifications, please contact Plastic Software Co., Ltd.';
  C_ERR_INVALID_REGISTRATION = 'Product registration information is incorrect.'
    + #13#10 + 'Please check and try again.';

  // AddInMgr
  C_MSG_ADDIN_LOADED = 'Add-In "%s" is loaded successfully.';
  C_MSG_ADDIN_ACTIVATED = 'Add-In "%s" is activated.';
  C_MSG_ADDIN_DEACTIVATED = 'Add-In "%s" is deactivated.';
  C_MSG_ADDIN_MENU_CONFIGURED = 'Add-In "%s" menu is registered successfully.';
  C_ERR_ADDIN_LOAD_FAILED = 'Failed to load the Add-In "%s". %s';
  C_ERR_ADDIN_REGKEY = 'Cannot read the Add-In information from the system registry.';
  C_ERR_ADDIN_ITEM_REGKEY = '(Reason) Unable to read the registry key.';
  C_ERR_ADDIN_ITEM_REGVALUE = '(Reason) Unable to read the registry value "%s".';
  C_ERR_ADDIN_MENU_CONFIG_FAILED = 'Failed to register the Add-In "%s" menu. %s';
  C_ERR_ADDIN_MENUFILE_NOT_EXIST = '(Reason) The menu file "%s" is missing or corrupt.';
  C_ERR_ADDIN_MENUFILE_INVALID = '(Reason) The menu file "%s" is invalid.';
  C_ERR_ADDIN_COMOBJ_CREATION = '(Reason) Unable to create the COM object "%s".';
  C_ERR_ADDIN_COMOBJ_INVALID_PROGID = '(Reason) Unable to determine the COM object¡¯s Programmatic ID.';
  C_ERR_ADDIN_COMOBJ_MSG_SENDING = 'Unable to deliver message to the COM object "%s".';
  C_ERR_ADDIN_SCRIPT_EXECUTION = 'Failed to run script "%s".';
  C_ERR_ADDIN_HELPFILE_CANNOT_OPEN ='Unable to open the help file "%s".';
  C_ERR_ADDIN_HELPFILE_INVALID = 'The help file "%s" is an unsupported format.';
  C_TXT_ADDIN_HELPFILE_DISPLAYNAME = '%s Help';

  // ApprMgr
  C_MSG_APPROACH_LOADED = 'The Approach "%s" is loaded successfully.';
  C_ERR_APPROACH_LOAD_FAILED = 'Failed to load the Approach "%s".';

  // ClipboardMgr
  C_ERR_CLIPBRD_REG_FORMAT = 'Unable to register the clipboard format.';
  C_ERR_CLIPBRD_MENU_EXECUTION = 'Unable to execute the clipboard menu.';

  // CmdExec
  C_ERR_CMD_EXPRESSION_PARSING = 'Enter the syntax correctly.';
  C_ERR_CMD_CANNOT_FIND_BASEELEMENT = 'Cannot find the Base element "%s".';
  C_ERR_CMD_CANNOT_FIND_CLASSIFIER = 'Cannot find the Classifier element "%s".';

  // ColEdtFrm
  C_TXT_COLLEDIT_TITLE = 'Collection Editor';
  C_TXT_COLLEDIT_NO_MODEL = 'No Model';
  C_TXT_COLLEDIT_NO_ROLENAME = '<none>';
  C_MSG_COLLEDIT_SELECT_RESIDENT = 'Select a Resident.';
  C_MSG_COLLEDIT_SELECT_COMPONENT = 'Select the Component to deploy.';
  C_MSG_COLLEDIT_SELECT_ARTIFACT = 'Select an Artifact.';
  C_MSG_COLLEDIT_SELECT_SIGNAL = 'Select a Signal.';

  // ConstEdtFrm
  C_TXT_CONSTREDIT_TITILE = 'Constraint Editor';
  C_TXT_CONSTREDIT_NO_MODEL = 'Nothing Selected';
  C_TXT_CONSTREDIT_MULTILINE = '(Multi-line)';

  // ContributorMgr
  C_ERR_INVALID_CONTRIBUTORS_FILE = 'Contributors file is invalid.';

  // Core
  C_ERR_ELEM_INVALID_NAME = 'Element name cannot contain "::".';
  C_ERR_SAVE_READONLY_FILE = 'The file %s is a read-only file and cannot be saved.';

  // ElemLstFrm, ElemSelFrm
  C_MSG_ELEMSELECTOR_DEFAULT_TITLE = 'Select a model element.';

  // ExtCore
  C_MSG_PROFILE_NOT_FOUND = 'Invalid Profile.';
  C_MSG_INVALID_CLASS_NAME = 'Invalid Class name.';
  C_MSG_PROFILE_CANNOT_EXCLUDE = 'Cannot exclude the profile. This profile may currently be in use by a read-only element.';
  C_MSG_PROFILE_LOADED = 'The Profile "%s" is loaded successfully.';
  C_ERR_PROFILE_LOAD_FAILED = 'Failed to load the Profile "%s".';
  //MSG_ILLEGAL_OPERATION_TO_TAGTYPE = 'Illegal property/operation to the tagtype.';

  // FrwMgr
  C_MSG_FRAMEWORK_LOADED = 'The Framework "%s" is loaded successfully.';
  C_ERR_FRAMEWORK_LOAD_FAILED = 'Failed to load the Framework "%s".';

  // InformationFrm
  C_ERR_UMLADVISOR_FILE_NOT_FOUND = 'Cannot find UML advisor contents file(UMLAdvices.xml).';

  // Main
  C_MSG_DOCUMENT_MODIFIED = 'Modified';
  C_MSG_STATUS_FILE_LOADING = 'Reading file(s).';
  C_MSG_STATUS_FILE_LOADING_COMPLETE = 'File reading complete.';
  C_MSG_STATUS_FILE_SAVING = 'Saving file(s).';
  C_MSG_STATUS_FILE_SAVING_COMPLETE = 'File saving complete.';
  C_MSG_STATUS_REFERENCE_RESOLVING = 'Resolving references.';
  C_MSG_STATUS_REFERENCE_RESOLVING_COMPLETE = 'Reference resolving complete.';
  C_MSG_ELEMENTS_FOUND = '%d elements found.';
  C_MSG_VERIFICATION_FAILED = '%d element(s) did not pass verification. Please check the Message window.';
  C_MSG_VERIFICATION_ALL_PASSED = 'All elements passed verification.';
  C_MSG_ELEMSELTTL_IMPORT_FRAMEWORK = 'Select a Package where the Framework will be imported to.';
  C_MSG_ELEMSELTTL_IMPORT_MODELFRAGMENT = 'Select a Package where the Model Fragment will be imported to';
  C_MSG_PERSONAL_EDITION_IS_NOT_ALLOWED = 'This feature is not supported in the Personal Edition.'
                                        + #13#10 + 'To use this feature, please contact Plastic Software, Inc.';
  C_QUERY_SAVE_MODIFICATION = 'Save the changes?';
  C_QUERY_SAVE_CHANGED_UNITS = 'Save all modified Units as well?';
  C_QUERY_DELETE_UNIT = 'Delete the Unit?';
  C_QUERY_RELOAD_PROJECT = 'The file(s) has been changed outside of the program.' + #13#10 +
                         'Reload the Project?';
  C_ERR_DIAGRAM = 'Diagram Error';
  C_ERR_DIAGRAM_NO_COLLECTIONS = 'Diagram do not have Collections.';
  C_ERR_DIAGRAM_NO_CONSTRAINTS = 'Diagram do not have Constraints.';
  C_ERR_DIAGRAM_NO_TAGGEDVALUES = 'Diagram do not have Tagged Values.';
  C_ERR_ATTACH_FILE_NOT_FOUND = 'Cannot find attachment.';
  C_ERR_ATTACH_CANNOT_OPEN = 'Cannot open attachment.';
  C_ERR_NOAPPLICATION_ASSOCIATED = 'No application associated to open the file.';
  C_ERR_SEQ_DGM_CMD_NOT_SUPPORT = 'This command cannot be used on the Sequence Diagram.';
  C_ERR_DGM_EXPORT_NO_OPENED_DGM = 'No opened diagram.' + #13#10 +
                                 'Open the diagram you want to export.';
  C_ERR_DGM_EXPORT_EMPTY_DGM = 'Empty diagram.';
  C_ERR_INVALID_MODEL_FILE = 'Failed to open the model file. Invalid file format.';
  C_TXT_DOC_TYPE_PROJECT = '[Project]';
  C_TXT_DOC_TYPE_UNIT = '[Unit]';
  C_TXT_DOC_STATUS_READONLY = '(Readonly)';
  C_TXT_DOC_STATUS_EXCLUSIVE_FILE_OPEN = '(Exclusive file open)';

  // NewProjFrm
  C_TXT_BLANK_APPROACH = 'Empty Project';
  C_TXT_BLANK_APPROACH_DESC = 'Blank project.';
  C_TXT_OK = 'OK';
  C_TXT_OPEN = 'Open';
  C_TXT_CANCEL = 'Cancel';

  // StarUMLApp
  C_ERR_READONLY = 'Readonly elements cannot be modified.';
  C_ERR_SUBVIEW_CANNOT_BE_DELETED = 'This is a View element that cannot be deleted individually.';
  C_QUERY_DELETE_UNITS = 'There are Units in the elements to be deleted. To delete the Units, you must perform a merge the Unit first.'
                       + #13#10 + 'Do you want to merge the Units and then delete?';
  C_ERR_MODEL_COPY_EXCEEDED = 'Too many elements to copy.';
  C_ERR_MODEL_PASTE_EXCEEDED = 'Too many elements selected.';
  C_ERR_IMPROPER_ELEMENET = 'This is not an element appropriate for carrying out the command.';
  C_ERR_DIRECTORY_NOT_FOUND = 'Directory not found.';
  C_ERR_INVALID_FILE_NAME = 'Invalid file name.'
                          + #13#10 + 'File name cannot contains the following charactors: \, /, :, *, ?, ", <, >, |';
  C_ERR_BITMAP_GEN_ERROR = 'Bitmap file could not be generated.'
                          + #13#10 + 'Use Model-Verify command to check for diagram errors.';

   C_TXT_DIAGRAMS_WITH_MODEL_FOUND = 'Found %d diagram%s with element %s. Check the Messages panel.';
   C_TXT_DIAGRAMS_WITH_MODEL_NOT_FOUND = 'No diagram found with element %s.';

  // PageSetupFrm, PrintFrm
  C_ERR_MARGIN_OVERFLOW = 'The value for margins exceeds the limit.';
  C_ERR_CANNOT_READ_PRINTINFO = 'Cannot read Printer Information.';
  C_TXT_PRINTER_STATUS_READY = 'Ready';
  C_TXT_PRINTER_STATUS_PAUSED = 'Paused';
  C_TXT_PRINTER_STATUS_ERROR = 'Error';
  C_TXT_PRINTER_STATUS_PENDING_DELETION = 'Pending deleting';
  C_TXT_PRINTER_STATUS_PAPER_JAM = 'Paper jam';
  C_TXT_PRINTER_STATUS_PAPER_OUT ='Paper out';
  C_TXT_PRINTER_STATUS_MANUAL_FEED = 'Manual feed';
  C_TXT_PRINTER_STATUS_PAPER_PROBLEM = 'Paper problem';
  C_TXT_PRINTER_STATUS_OFFLINE = 'Offline';
  C_TXT_PRINTER_STATUS_IO_ACTIVE = 'IO active';
  C_TXT_PRINTER_STATUS_BUSY = 'Busy';
  C_TXT_PRINTER_STATUS_PRINTING = 'Printing';
  C_TXT_PRINTER_STATUS_OUTPUT_BIN_FULL = 'Output bin full';
  C_TXT_PRINTER_STATUS_NOT_AVAILABLE = 'Not available';
  C_TXT_PRINTER_STATUS_WAITING = 'Waiting';
  C_TXT_PRINTER_STATUS_PROCESSING = 'Processing';
  C_TXT_PRINTER_STATUS_INITIALIZING = 'Initializing';
  C_TXT_PRINTER_STATUS_WARMING_UP = 'Warming up';
  C_TXT_PRINTER_STATUS_TONER_LOW = 'Toner low';
  C_TXT_PRINTER_STATUS_NO_TONER = 'No toner';
  C_TXT_PRINTER_STATUS_PAGE_PUNT = 'Page punt';
  C_TXT_PRINTER_STATUS_USER_INTERVENTION = 'User Intervention';
  C_TXT_PRINTER_STATUS_OUT_OF_MEMORY = 'Out of memory';
  C_TXT_PRINTER_STATUS_DOOR_OPEN = 'Door open';
  C_TXT_PRINTER_STATUS_SERVER_UNKNOWN = 'Server unknown';
  C_TXT_PRINTER_STATUS_POWER_SAVE = 'Power save';
  C_TXT_PRINT_STATUS = 'Status:  ';
  C_TXT_PRINT_LOCATION = 'Location:  ';
  C_TXT_PRINT_STATUS_ERROR = 'Error';
  C_TXT_PRINT_LOCATION_ERROR = 'Error';
  C_TXT_PRINT_STATUS_UNKNOWN = 'Unknown';
  C_TXT_PRINT_LOCATION_UNKNOWN = 'Unknown';
  C_TXT_PRINT_PAGE = 'Page';

  // ProfileMgrFrm
  C_QUERY_REMOVE_PROFILE = 'If you delete the Profile, some Stereotypes, Datatypes, Tagged Values, etc. ' +
                         'may no longer be displayed properly.' + #13#10 +  'Do you want to delete it?';

  // ProjectMgr
  C_ERR_FILE_LOADING_FAILED = 'Cannot load the file "%s".';
  C_ERR_PROFILE_NOT_FOUND = 'Cannot find the Profile "%s".';

  // QuickDialogFrm
  C_TXT_ADD_CLASS = 'Add Class';
  C_TXT_ADD_OPERATION = 'Add Operation';
  C_TXT_REMOVE_OPERATION = 'Delete Operation';
  C_TXT_ADD_ATTRIBUTE = 'Add Attribute';
  C_TXT_REMOVE_ATTRIBUTE = 'Delete Attribute';
  C_TXT_ADD_LITERAL = 'Add Literal';
  C_TXT_REMOVE_LITERAL = 'Delete Literal';
  C_TXT_ADD_ACTION = 'Add Action';
  C_TXT_REMOVE_REMOVE = 'Delete Action';
  C_TXT_ADD_ENTRY_ACTION = 'Add EntryAction';
  C_TXT_ADD_DO_ACTION = 'Add DoAction';
  C_TXT_ADD_EXIT_ACTION = 'Add ExitAction';
  C_TXT_MOVE_UP = 'Move Up';
  C_TXT_MOVE_DOWN = 'Move Down';
  C_TXT_CALL_ACTION_OPERATION = 'Select an Operation';
  C_TXT_CALL_ACTION_OPERATION_WARN = 'This will be executed only if the Receiver element has a Base/Classifier reference value.';
  C_TXT_SEND_ACTION_SIGNAL = 'Select a Signal';
  C_TXT_CREATE_ACTION_INSTANTIATION = 'Select an Instantiation';
  C_TXT_CREATE_ACTION_INSTANTIATION_WARN = 'This will be executed only in case of Call/Send/CreateAction.';
  C_TXT_CALL_ACTION_WARN = 'This will be executed only in the case of a CallAction.';
  C_TXT_ACTION_WARN = 'This will be executed only if an Action element(s) is present.';
  C_TXT_INPUT_ELEM_NAME = 'Enter element name';
  C_TXT_INPUT_CLASS_NAME = 'Enter a name for the Class.';
  C_TXT_INPUT_OPERATION_NAME = 'Enter a name for the Operation.' + #13#10 +
                               '(Full expression is not supported)';
  C_MSG_SELECT_OPERATION = 'Select an Operation.';
  C_MSG_SELECT_SIGNAL = 'Select a Signal.';
  C_MSG_SELECT_INSTANTIATION = 'Select a Classifier.';

  // StereoSelFrm
  C_TXT_NO_STEREOTYPE = '(No stereotype)';
  C_TXT_NOT_DEFINED_STEREOTYPE = '(Undefined stereotype)';

  C_TXT_DESC_NO_STEREOTYPE = 'No stereotype has been entered.';
  C_TXT_DESC_NOT_DEFINED_STEREOTYPE = 'This stereotype is user-specified and not defined any included Profiles.';
  C_TXT_DESC_PRIFILE_EXCLUDED_STEREOTYPE = 'The profile in which this stereotype is defined has not been installed on the system or is not included in the current project.'
                                         + #13#10 + 'Open the Profile Manager and check whether the profile has been installed or included.';

  // TagColEdtFrm
  C_ERR_INVALID_TAG_TYPE = 'Invalid TagDefinition.';
  C_TXT_COLL_TAGGED_VALUE = 'Collection Tagged Value';

  // TagEdtFrm
  C_TXT_TITLE_TAGGEDVALUEEDITORFORM = 'Tagged Value Editor';
  C_TXT_TAGGED_VALUE = 'Tagged Value';
  C_TXT_TAGGEDVALUE_TEXT = '(Text)..';
  C_TXT_TAGGEDVALUE_COLLECTION = '(Collection)..';

  // UMLAdvisorFrame
  C_TXT_UML_ADV_NOT_FOUND_TITLE = 'Issue not found.';
  C_TXT_UML_ADV_NOT_FOUND_CONTENT = 'Could not find the advices on "%s".';

  // UMLAux
  C_ERR_NAME_CONFLICT = 'Name conflict.';
  C_ERR_CANNOT_CREATE_RELATION = 'The following two elements cannot be connected by %s.';
  C_ERR_INVALID_RELATION = 'Invalid relation.';
  C_ERR_CANNOT_CREATE_STIMULUS = 'Unable to connect Stimulus.';
  C_ERR_CANNOT_CREATE_MESSAGE = 'Unable to connect Message.';
  C_TXT_REL_TRANSITION = 'Transition';
  C_TXT_REL_DEPENDENCY = 'Dependency';
  C_TXT_REL_ASSOCIATION = 'Association';
  C_TXT_REL_ASSOCIATIONCLASS = 'AssociationClass';
  C_TXT_REL_GENERALIZATION = 'Generalization';
  C_TXT_REL_LINK = 'Link';
  C_TXT_REL_ASSOCIATION_ROLE = 'AssociationRole';
  C_TXT_REL_STIMULUS = 'Stimulus';
  C_TXT_REL_MESSSAGE = 'Message';
  C_TXT_REL_INCLUDE = 'Include';
  C_TXT_REL_EXTEND = 'Extend';
  C_TXT_REL_REALIZATION = 'Realization';
  C_TXT_REL_CONNECTOR = 'Connector';

  // UMLFacto
  C_ERR_FACTORY_PARAM = 'Invalid arguments to create element(s).';
  C_ERR_FACTORY_LINK = 'Connect elements exactly.';
  C_ERR_FACTORY_ASSOCIATIONCLASS = 'Only one AssociationClass is allowed for a pair of Class and Association.';

  // UMLProps
  C_TXT_ELEMSELTTL_TYPE = 'Select a Type.';
  C_TXT_ELEMSELTTL_CLASSIFIER = 'Select a Classifier.';
  C_TXT_ELEMSELTTL_INSTANTIATION = 'Select a Classifier.';
  C_TXT_ELEMSELTTL_BASE = 'Select a Classifier.';
  C_TXT_ELEMLSTTTL_VALUE = 'Select a Value.';
  C_TXT_ELEMLSTTTL_OPERATION = 'Select an Operation.';
  C_TXT_ELEMLSTTTL_SIGNAL = 'Select a Signal.';
  C_TXT_ELEMLSTTTL_SUBMACHINE = 'Select a Submachine.';
  C_TXT_ELEMLSTTTL_ATTRIBUTE = 'Select an Attribute.';

  // UMLVerify
  C_MSG_VERIFY_ASSOCIATION_1 = 'The AssociationEnds must have a unqiue name within the Association.';
  C_MSG_VERIFY_ASSOCIATION_2 = 'At most one AssociationEnd may be an aggregation or composition within an Assocation.';
  C_MSG_VERIFY_BEHAVIORALFEATURE_1 = 'All Parameters should have a unique name.';
  C_MSG_VERIFY_CLASSIFIER_1 = 'No Attributes may have the same name within a Classifier.';
  C_MSG_VERIFY_CLASSIFIER_2 = 'No opposite AssociationEnds may have the same name.';
  C_MSG_VERIFY_CLASSIFIER_3 = 'The name of an Attribute may not be the same as the name of an opposite AssociationEnd or an element contained in the Classifier.';
  C_MSG_VERIFY_CLASSIFIER_4 = 'The name of an opposite AssociationEnd may not be the same as the name of an element or its Attributes contained in the Classifier.';
  C_MSG_VERIFY_GENERALIZABLEELEMENT_1 = 'A root cannot have more generatlized elements.';
  C_MSG_VERIFY_GENERALIZABLEELEMENT_2 = 'A leaf cannot have more specialized elements.';
  C_MSG_VERIFY_GENERALIZABLEELEMENT_3 = 'Circular inheritance is not allowed.';
  C_MSG_VERIFY_INTERFACE_1 = 'All Features in an Interface must be Public.';
  C_MSG_VERIFY_COMPONENTINSTANCE_1 = 'A ComponentInstance must assign exactly one Component as its origin.';
  C_MSG_VERIFY_NODEINSTANCE_1 = 'A NodeInstance must assign exactly one Node as its origin.';
  C_MSG_VERIFY_ASSOCIATIONENDROLE_1 = 'AssociationEndRoles must be connected to a ClassifierRole.';
  C_MSG_VERIFY_CLASSIFIERROLE_1 = 'A ClassifierRole cannot have any Features of its own.';
  C_MSG_VERIFY_CLASSIFIERROLE_2 = 'A ClassifierRole cannot be a role for another ClassifierRole.';
  C_MSG_VERIFY_MESSAGE_1 = 'The sender and the receiver of a Message must participate in the Collaboration which defines the context of the Interaction.';
  C_MSG_VERIFY_ACTOR_1 = 'Actors can only have Associations to UseCases, Classes, or Subsystems.';
  C_MSG_VERIFY_COMPOSITESTATE_1 = 'A CompositeState can have at most one Initial state.';
  C_MSG_VERIFY_COMPOSITESTATE_2 = 'A CompositeState can have at most one Deep history.';
  C_MSG_VERIFY_COMPOSITESTATE_3 = 'A CompositeState can have at most one Shallow history.';
  C_MSG_VERIFY_COMPOSITESTATE_4 = 'A concurrent composite state must have at least two composite states.';
  C_MSG_VERIFY_COMPOSITESTATE_5 = 'A concurrent state can only have composite states as its substates.';
  C_MSG_VERIFY_FINALSTATE_1 = 'A Final state cannot have outgoing transitions.';
  C_MSG_VERIFY_PSEUDOSTATE_1 = 'An Initial state can have at most one outgoing transition and no incoming transitions.';
  C_MSG_VERIFY_PSEUDOSTATE_2 = 'History states can have at most one outgoing transition.';
  C_MSG_VERIFY_PSEUDOSTATE_3 = 'A junction vertex must have at least one incoming transition and one outgoing transition.';
  C_MSG_VERIFY_PSEUDOSTATE_4 = 'A choice vertex must have at least one incoming transition and one outgoing transition.';
  C_MSG_VERIFY_STATEMACHINE_1 = 'A StateMachine may be aggregated within either a Classifier or a BehavioralFeature.';
  C_MSG_VERIFY_STATEMACHINE_2 = 'A top state is always a composite.';
  C_MSG_VERIFY_STATEMACHINE_3 = 'A top state cannot have parents.';
  C_MSG_VERIFY_STATEMACHINE_4 = 'The top state cannot be the source of a transition.';
  C_MSG_VERIFY_SUBMACHINESTATE_1 = 'A SubmachineState cannot be concurrent.';
  C_MSG_VERIFY_TRANSITION_1 = 'A transition to a pseudostate cannot have a Trigger.';
  C_MSG_VERIFY_ACTIVITYGRAPH_1 = 'The ActivityGraph can describe the dynamic behavior of one of the following: Package, Classifier, or BehavioralFeature.';
  C_MSG_VERIFY_ACTIONSTATE_1 = 'No ActionState may have internal transitions, exit actions, and do activities.';
  C_MSG_VERIFY_ACTIONSTATE_2 = 'A transition from an ActionState cannot have a trigger event.';
  C_MSG_VERIFY_SUBACTIVITYSTATE_1 = 'A SubactivityState must have an association to the ActivityGraph.';

  // TrialDlgFrm
  C_TXT_UNTIL_EXPIRATION = '%d days remains';
  C_TXT_EXPIRED = 'Evaluation period expired.';

var
  TXT_ELEM_SEL_NOTHING: string;
  TXT_ELEM_SEL_MULTIPLE: string;
  TXT_PROGRAM_NAME: string;
  TXT_UNTITILED_PRJ: string;
  TXT_DECIMAL_SEPARATOR: string;
  ERR_FILE_NOT_FOUND: string;
  ERR_INVALID_VALUE: string;
  ERR_INTERNAL_ERROR: string;
  ERR_OUT_OF_RANGE: string;
  ERR_READING_DATA: string;
  TXT_APPLICATION_TITLE: string;
  MSG_PERSONAL_EDITION_NOTIFICATION: string;
  MSG_TRIAL_EXPIRED: string;
  ERR_INVALID_REGISTRATION: string;
  MSG_ADDIN_LOADED: string;
  MSG_ADDIN_ACTIVATED: string;
  MSG_ADDIN_DEACTIVATED: string;
  MSG_ADDIN_MENU_CONFIGURED: string;
  ERR_ADDIN_LOAD_FAILED: string;
  ERR_ADDIN_REGKEY: string;
  ERR_ADDIN_ITEM_REGKEY: string;
  ERR_ADDIN_ITEM_REGVALUE: string;
  ERR_ADDIN_MENU_CONFIG_FAILED: string;
  ERR_ADDIN_MENUFILE_NOT_EXIST: string;
  ERR_ADDIN_MENUFILE_INVALID: string;
  ERR_ADDIN_COMOBJ_CREATION: string;
  ERR_ADDIN_COMOBJ_INVALID_PROGID: string;
  ERR_ADDIN_COMOBJ_MSG_SENDING: string;
  ERR_ADDIN_SCRIPT_EXECUTION: string;
  ERR_ADDIN_HELPFILE_CANNOT_OPEN: string;
  ERR_ADDIN_HELPFILE_INVALID: string;
  TXT_ADDIN_HELPFILE_DISPLAYNAME: string;
  MSG_APPROACH_LOADED: string;
  ERR_APPROACH_LOAD_FAILED: string;
  ERR_CLIPBRD_REG_FORMAT: string;
  ERR_CLIPBRD_MENU_EXECUTION: string;
  ERR_CMD_EXPRESSION_PARSING: string;
  ERR_CMD_CANNOT_FIND_BASEELEMENT: string;
  ERR_CMD_CANNOT_FIND_CLASSIFIER: string;
  TXT_COLLEDIT_TITLE: string;
  TXT_COLLEDIT_NO_MODEL: string;
  TXT_COLLEDIT_NO_ROLENAME: string;
  MSG_COLLEDIT_SELECT_RESIDENT: string;
  MSG_COLLEDIT_SELECT_COMPONENT: string;
  MSG_COLLEDIT_SELECT_ARTIFACT: string;
  MSG_COLLEDIT_SELECT_SIGNAL: string;
  TXT_CONSTREDIT_TITILE: string;
  TXT_CONSTREDIT_NO_MODEL: string;
  TXT_CONSTREDIT_MULTILINE: string;
  ERR_INVALID_CONTRIBUTORS_FILE: string;
  ERR_ELEM_INVALID_NAME: string;
  ERR_SAVE_READONLY_FILE: string;
  MSG_ELEMSELECTOR_DEFAULT_TITLE: string;
  MSG_PROFILE_NOT_FOUND: string;
  MSG_INVALID_CLASS_NAME: string;
  MSG_PROFILE_CANNOT_EXCLUDE: string;
  MSG_PROFILE_LOADED: string;
  ERR_PROFILE_LOAD_FAILED: string;
  MSG_FRAMEWORK_LOADED: string;
  ERR_FRAMEWORK_LOAD_FAILED: string;
  ERR_UMLADVISOR_FILE_NOT_FOUND: string;
  MSG_DOCUMENT_MODIFIED: string;
  MSG_STATUS_FILE_LOADING: string;
  MSG_STATUS_FILE_LOADING_COMPLETE: string;
  MSG_STATUS_FILE_SAVING: string;
  MSG_STATUS_FILE_SAVING_COMPLETE: string;
  MSG_STATUS_REFERENCE_RESOLVING: string;
  MSG_STATUS_REFERENCE_RESOLVING_COMPLETE: string;
  MSG_ELEMENTS_FOUND: string;
  MSG_VERIFICATION_FAILED: string;
  MSG_VERIFICATION_ALL_PASSED: string;
  MSG_ELEMSELTTL_IMPORT_FRAMEWORK: string;
  MSG_ELEMSELTTL_IMPORT_MODELFRAGMENT: string;
  MSG_PERSONAL_EDITION_IS_NOT_ALLOWED: string;
  QUERY_SAVE_MODIFICATION: string;
  QUERY_SAVE_CHANGED_UNITS: string;
  QUERY_DELETE_UNIT: string;
  QUERY_RELOAD_PROJECT: string;
  ERR_DIAGRAM_NO_COLLECTIONS: string;
  ERR_DIAGRAM_NO_CONSTRAINTS: string;
  ERR_DIAGRAM_NO_TAGGEDVALUES: string;
  ERR_ATTACH_FILE_NOT_FOUND: string;
  ERR_ATTACH_CANNOT_OPEN: string;
  ERR_NOAPPLICATION_ASSOCIATED: string;
  ERR_SEQ_DGM_CMD_NOT_SUPPORT: string;
  ERR_DGM_EXPORT_NO_OPENED_DGM: string;
  ERR_DGM_EXPORT_EMPTY_DGM: string;
  ERR_INVALID_MODEL_FILE: string;  
  TXT_DOC_TYPE_PROJECT: string;
  TXT_DOC_TYPE_UNIT: string;
  TXT_DOC_STATUS_READONLY: string;
  TXT_DOC_STATUS_EXCLUSIVE_FILE_OPEN: string;
  TXT_BLANK_APPROACH: string;
  TXT_BLANK_APPROACH_DESC: string;
  TXT_OK: string;
  TXT_OPEN: string;
  TXT_CANCEL: string;
  ERR_READONLY: string;
  ERR_SUBVIEW_CANNOT_BE_DELETED: string;
  QUERY_DELETE_UNITS: string;
  ERR_MODEL_COPY_EXCEEDED: string;
  ERR_MODEL_PASTE_EXCEEDED: string;
  ERR_IMPROPER_ELEMENET: string;
  ERR_DIRECTORY_NOT_FOUND: string;
  ERR_INVALID_FILE_NAME: string;
  ERR_BITMAP_GEN_ERROR: string;
  TXT_DIAGRAMS_WITH_MODEL_FOUND: string;
  TXT_DIAGRAMS_WITH_MODEL_NOT_FOUND: string;
  ERR_MARGIN_OVERFLOW: string;
  ERR_CANNOT_READ_PRINTINFO: string;
  TXT_PRINTER_STATUS_READY: string;
  TXT_PRINTER_STATUS_PAUSED: string;
  TXT_PRINTER_STATUS_ERROR: string;
  TXT_PRINTER_STATUS_PENDING_DELETION: string;
  TXT_PRINTER_STATUS_PAPER_JAM: string;
  TXT_PRINTER_STATUS_PAPER_OUT: string;
  TXT_PRINTER_STATUS_MANUAL_FEED: string;
  TXT_PRINTER_STATUS_PAPER_PROBLEM: string;
  TXT_PRINTER_STATUS_OFFLINE: string;
  TXT_PRINTER_STATUS_IO_ACTIVE: string;
  TXT_PRINTER_STATUS_BUSY: string;
  TXT_PRINTER_STATUS_PRINTING: string;
  TXT_PRINTER_STATUS_OUTPUT_BIN_FULL: string;
  TXT_PRINTER_STATUS_NOT_AVAILABLE: string;
  TXT_PRINTER_STATUS_WAITING: string;
  TXT_PRINTER_STATUS_PROCESSING: string;
  TXT_PRINTER_STATUS_INITIALIZING: string;
  TXT_PRINTER_STATUS_WARMING_UP: string;
  TXT_PRINTER_STATUS_TONER_LOW: string;
  TXT_PRINTER_STATUS_NO_TONER: string;
  TXT_PRINTER_STATUS_PAGE_PUNT: string;
  TXT_PRINTER_STATUS_USER_INTERVENTION: string;
  TXT_PRINTER_STATUS_OUT_OF_MEMORY: string;
  TXT_PRINTER_STATUS_DOOR_OPEN: string;
  TXT_PRINTER_STATUS_SERVER_UNKNOWN: string;
  TXT_PRINTER_STATUS_POWER_SAVE: string;
  TXT_PRINT_STATUS: string;
  TXT_PRINT_LOCATION: string;
  TXT_PRINT_STATUS_ERROR: string;
  TXT_PRINT_LOCATION_ERROR: string;
  TXT_PRINT_STATUS_UNKNOWN: string;
  TXT_PRINT_LOCATION_UNKNOWN: string;
  TXT_PRINT_PAGE: string;
  QUERY_REMOVE_PROFILE: string;
  ERR_FILE_LOADING_FAILED: string;
  ERR_PROFILE_NOT_FOUND: string;
  TXT_ADD_CLASS: string;
  TXT_ADD_OPERATION: string;
  TXT_REMOVE_OPERATION: string;
  TXT_ADD_ATTRIBUTE: string;
  TXT_REMOVE_ATTRIBUTE: string;
  TXT_ADD_LITERAL: string;
  TXT_REMOVE_LITERAL: string;
  TXT_ADD_ACTION: string;
  TXT_REMOVE_REMOVE: string;
  TXT_ADD_ENTRY_ACTION: string;
  TXT_ADD_DO_ACTION: string;
  TXT_ADD_EXIT_ACTION: string;
  TXT_MOVE_UP: string;
  TXT_MOVE_DOWN: string;
  TXT_CALL_ACTION_OPERATION: string;
  TXT_CALL_ACTION_OPERATION_WARN: string;
  TXT_SEND_ACTION_SIGNAL: string;
  TXT_CREATE_ACTION_INSTANTIATION: string;
  TXT_CREATE_ACTION_INSTANTIATION_WARN: string;
  TXT_ACTION_WARN: string;
  TXT_CALL_ACTION_WARN: string;
  TXT_INPUT_ELEM_NAME: string;
  TXT_INPUT_CLASS_NAME: string;
  TXT_INPUT_OPERATION_NAME: string;
  MSG_SELECT_OPERATION: string;
  MSG_SELECT_SIGNAL: string;
  MSG_SELECT_INSTANTIATION: string;
  TXT_NO_STEREOTYPE: string;
  TXT_NOT_DEFINED_STEREOTYPE: string;
  TXT_DESC_NO_STEREOTYPE: string;
  TXT_DESC_NOT_DEFINED_STEREOTYPE: string;
  TXT_DESC_PRIFILE_EXCLUDED_STEREOTYPE: string;
  ERR_INVALID_TAG_TYPE: string;
  TXT_COLL_TAGGED_VALUE: string;
  TXT_TITLE_TAGGEDVALUEEDITORFORM: string;
  TXT_TAGGED_VALUE: string;
  TXT_TAGGEDVALUE_TEXT: string;
  TXT_TAGGEDVALUE_COLLECTION: string;
  TXT_UML_ADV_NOT_FOUND_TITLE: string;
  TXT_UML_ADV_NOT_FOUND_CONTENT: string;
  ERR_NAME_CONFLICT: string;
  ERR_CANNOT_CREATE_RELATION: string;
  ERR_INVALID_RELATION: string;
  ERR_CANNOT_CREATE_STIMULUS: string;
  ERR_CANNOT_CREATE_MESSAGE: string;
  TXT_REL_TRANSITION: string;
  TXT_REL_DEPENDENCY: string;
  TXT_REL_ASSOCIATION: string;
  TXT_REL_ASSOCIATIONCLASS: string;
  TXT_REL_GENERALIZATION: string;
  TXT_REL_LINK: string;
  TXT_REL_ASSOCIATION_ROLE: string;
  TXT_REL_STIMULUS: string;
  TXT_REL_MESSSAGE: string;
  TXT_REL_INCLUDE: string;
  TXT_REL_EXTEND: string;
  TXT_REL_REALIZATION: string;
  TXT_REL_CONNECTOR: string;
  ERR_FACTORY_PARAM: string;
  ERR_FACTORY_LINK: string;
  ERR_FACTORY_ASSOCIATIONCLASS: string;
  TXT_ELEMSELTTL_TYPE: string;
  TXT_ELEMSELTTL_CLASSIFIER: string;
  TXT_ELEMSELTTL_INSTANTIATION: string;
  TXT_ELEMSELTTL_BASE: string;
  TXT_ELEMLSTTTL_VALUE: string;
  TXT_ELEMLSTTTL_OPERATION: string;
  TXT_ELEMLSTTTL_SIGNAL: string;
  TXT_ELEMLSTTTL_SUBMACHINE: string;
  TXT_ELEMLSTTTL_ATTRIBUTE: string;
  ERR_CANNOT_MOVE_BACK: string;
  ERR_CANNOT_MOVE_FORWARD: string;
  ERR_CANNOT_REFRESH_PAGE: string;
  MSG_VERIFY_ASSOCIATION_1: string;
  MSG_VERIFY_ASSOCIATION_2: string;
  MSG_VERIFY_BEHAVIORALFEATURE_1: string;
  MSG_VERIFY_CLASSIFIER_1: string;
  MSG_VERIFY_CLASSIFIER_2: string;
  MSG_VERIFY_CLASSIFIER_3: string;
  MSG_VERIFY_CLASSIFIER_4: string;
  MSG_VERIFY_GENERALIZABLEELEMENT_1: string;
  MSG_VERIFY_GENERALIZABLEELEMENT_2: string;
  MSG_VERIFY_GENERALIZABLEELEMENT_3: string;
  MSG_VERIFY_INTERFACE_1: string;
  MSG_VERIFY_COMPONENTINSTANCE_1: string;
  MSG_VERIFY_NODEINSTANCE_1: string;
  MSG_VERIFY_ASSOCIATIONENDROLE_1: string;
  MSG_VERIFY_CLASSIFIERROLE_1: string;
  MSG_VERIFY_CLASSIFIERROLE_2: string;
  MSG_VERIFY_MESSAGE_1: string;
  MSG_VERIFY_ACTOR_1: string;
  MSG_VERIFY_COMPOSITESTATE_1: string;
  MSG_VERIFY_COMPOSITESTATE_2: string;
  MSG_VERIFY_COMPOSITESTATE_3: string;
  MSG_VERIFY_COMPOSITESTATE_4: string;
  MSG_VERIFY_COMPOSITESTATE_5: string;
  MSG_VERIFY_FINALSTATE_1: string;
  MSG_VERIFY_PSEUDOSTATE_1: string;
  MSG_VERIFY_PSEUDOSTATE_2: string;
  MSG_VERIFY_PSEUDOSTATE_3: string;
  MSG_VERIFY_PSEUDOSTATE_4: string;
  MSG_VERIFY_STATEMACHINE_1: string;
  MSG_VERIFY_STATEMACHINE_2: string;
  MSG_VERIFY_STATEMACHINE_3: string;
  MSG_VERIFY_STATEMACHINE_4: string;
  MSG_VERIFY_SUBMACHINESTATE_1: string;
  MSG_VERIFY_TRANSITION_1: string;
  MSG_VERIFY_ACTIVITYGRAPH_1: string;
  MSG_VERIFY_ACTIONSTATE_1: string;
  MSG_VERIFY_ACTIONSTATE_2: string;
  MSG_VERIFY_SUBACTIVITYSTATE_1: string;
  TXT_UNTIL_EXPIRATION: string;
  TXT_EXPIRED: string;

implementation

uses
  Forms;

const
  NLS_STR_SECTION = 'Strings';

// TdxBarManager ---------------------------------------------------------------

procedure NLS_dxBarManager_Import(NLSValues: TNLSValues; AComponent: TComponent);
var
  I: Integer;
begin
  with AComponent as TdxBarManager do
  begin
    UseSystemFont := NLSValues.ReadBoolean(AComponent, 'UseSystemFont', UseSystemFont);
    if not UseSystemFont then
      NLSValues.ReadFont(AComponent, Font);
    for I := 0 to NLSValues.ReadInteger(AComponent, 'Bars.Count', 0) - 1 do
      Bars.Items[I].Caption := NLSValues.ReadString(AComponent, 'Bars.Items['+IntToStr(I)+'].Caption', Bars.Items[I].Caption);
  end;
end;

procedure NLS_dxBarManager_Export(NLSValues: TNLSValues; AComponent: TComponent);
var
  I: Integer;
begin
  with AComponent as TdxBarManager do
  begin
    NLSValues.WriteBoolean(AComponent, 'UseSystemFont', UseSystemFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteInteger(AComponent, 'Bars.Count', Bars.Count);
    for I := 0 to Bars.Count - 1 do
      NLSValues.WriteString(AComponent, 'Bars.Items['+IntToStr(I)+'].Caption', Bars.Items[I].Caption);
  end;
end;

// TdxBarItem ------------------------------------------------------------------

procedure NLS_dxBarItem_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TdxBarItem do
  begin
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
  end;
end;

procedure NLS_dxBarItem_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TdxBarItem do
  begin
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
  end;
end;

// TdxPageControl ------------------------------------------------------------------

procedure NLS_dxPageControl_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TPageControl do
  begin
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_dxPageControl_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TPageControl do
  begin
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TTabSheet -----------------------------------------------------------------

procedure NLS_dxTabSheet_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TTabSheet do
  begin
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
  end;
end;

procedure NLS_dxTabSheet_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TTabSheet do
  begin
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
  end;
end;

// TTBToolBar ---------------------------------------------------------------------

{procedure NLS_TBToolBar_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TTBToolBar do
  begin
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
  end;
end;

procedure NLS_TBToolBar_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TTBToolBar do
  begin
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
  end;
end;

// TTBItem ---------------------------------------------------------------------

procedure NLS_TBItem_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TTBItem do
  begin
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
  end;
end;

procedure NLS_TBItem_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TTBItem do
  begin
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
  end;
end;}

// TAreaTitleBar ---------------------------------------------------------------

procedure NLS_AreaTitleBar_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TAreaTitleBar do
  begin
    Title := NLSValues.ReadString(AComponent, 'Title', Title);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
  end;
end;

procedure NLS_AreaTitleBar_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TAreaTitleBar do
  begin
    NLSValues.WriteString(AComponent, 'Title', Title);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
  end;
end;

// TFlatPanel ..................................................................

procedure NLS_FlatPanel_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TFlatPanel do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_FlatPanel_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TFlatPanel do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TCompactFontDialog ..................................................................

procedure NLS_CompactFontDialog_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TCompactFontDialog do
  begin
    PreviewString := NLSValues.ReadString(AComponent, 'PreviewString', PreviewString);
    ColorNameBlack := NLSValues.ReadString(AComponent, 'ColorNameBlack', ColorNameBlack);
    ColorNameMaroon := NLSValues.ReadString(AComponent, 'ColorNameMaroon', ColorNameMaroon);
    ColorNameGreen := NLSValues.ReadString(AComponent, 'ColorNameGreen', ColorNameGreen);
    ColorNameOlive := NLSValues.ReadString(AComponent, 'ColorNameOlive', ColorNameOlive);
    ColorNameNavy := NLSValues.ReadString(AComponent, 'ColorNameNavy', ColorNameNavy);
    ColorNamePurple := NLSValues.ReadString(AComponent, 'ColorNamePurple', ColorNamePurple);
    ColorNameTeal := NLSValues.ReadString(AComponent, 'ColorNameTeal', ColorNameTeal);
    ColorNameGray := NLSValues.ReadString(AComponent, 'ColorNameGray', ColorNameGray);
    ColorNameSilver := NLSValues.ReadString(AComponent, 'ColorNameSilver', ColorNameSilver);
    ColorNameRed := NLSValues.ReadString(AComponent, 'ColorNameRed', ColorNameRed);
    ColorNameLime := NLSValues.ReadString(AComponent, 'ColorNameLime', ColorNameLime);
    ColorNameYellow := NLSValues.ReadString(AComponent, 'ColorNameYellow', ColorNameYellow);
    ColorNameBlue := NLSValues.ReadString(AComponent, 'ColorNameBlue', ColorNameBlue);
    ColorNameFuchsia := NLSValues.ReadString(AComponent, 'ColorNameFuchsia', ColorNameFuchsia);
    ColorNameAqua := NLSValues.ReadString(AComponent, 'ColorNameAqua', ColorNameAqua);
    ColorNameWhite := NLSValues.ReadString(AComponent, 'ColorNameWhite', ColorNameWhite);
    DefaultColorString := NLSValues.ReadString(AComponent, 'DefaultColorString', DefaultColorString);
    CustomColorString := NLSValues.ReadString(AComponent, 'CustomColorString', CustomColorString);
  end;
end;

procedure NLS_CompactFontDialog_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TCompactFontDialog do
  begin
    NLSValues.WriteString(AComponent, 'PreviewString', PreviewString);
    NLSValues.WriteString(AComponent, 'ColorNameBlack', ColorNameBlack);
    NLSValues.WriteString(AComponent, 'ColorNameMaroon', ColorNameMaroon);
    NLSValues.WriteString(AComponent, 'ColorNameGreen', ColorNameGreen);
    NLSValues.WriteString(AComponent, 'ColorNameOlive', ColorNameOlive);
    NLSValues.WriteString(AComponent, 'ColorNameNavy', ColorNameNavy);
    NLSValues.WriteString(AComponent, 'ColorNamePurple', ColorNamePurple);
    NLSValues.WriteString(AComponent, 'ColorNameTeal', ColorNameTeal);
    NLSValues.WriteString(AComponent, 'ColorNameGray', ColorNameGray);
    NLSValues.WriteString(AComponent, 'ColorNameSilver', ColorNameSilver);
    NLSValues.WriteString(AComponent, 'ColorNameRed', ColorNameRed);
    NLSValues.WriteString(AComponent, 'ColorNameLime', ColorNameLime);
    NLSValues.WriteString(AComponent, 'ColorNameYellow', ColorNameYellow);
    NLSValues.WriteString(AComponent, 'ColorNameBlue', ColorNameBlue);
    NLSValues.WriteString(AComponent, 'ColorNameFuchsia', ColorNameFuchsia);
    NLSValues.WriteString(AComponent, 'ColorNameAqua', ColorNameAqua);
    NLSValues.WriteString(AComponent, 'ColorNameWhite', ColorNameWhite);
    NLSValues.WriteString(AComponent, 'DefaultColorString', DefaultColorString);
    NLSValues.WriteString(AComponent, 'CustomColorString', CustomColorString);
  end;
end;
{
// TdxNavBar -------------------------------------------------------------------

procedure NLS_dxNavBar_Import(NLSValues: TNLSValues; AComponent: TComponent);

  procedure ReadBaseNavBarStyle(Style: TdxBaseNavBarStyle; StyleName: string);
  begin
    Style.Font.Name := NLSValues.ReadString(AComponent, AComponent.Name + 'DefaultStyles.' + StyleName + '.Font.Name', Style.Font.Name);
    Style.Font.Size := NLSValues.ReadInteger(AComponent, AComponent.Name + 'DefaultStyles.' + StyleName + '.Font.Size', Style.Font.Size);
    Style.Font.CharSet := NLSValues.ReadInteger(AComponent, AComponent.Name + 'DefaultStyles.' + StyleName + '.Font.Charset', Style.Font.Charset);
  end;

begin
  with AComponent as TdxNavBar do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ReadBaseNavBarStyle(DefaultStyles.Background, 'Background');
    ReadBaseNavBarStyle(DefaultStyles.Button, 'Button');
    ReadBaseNavBarStyle(DefaultStyles.ButtonPressed, 'ButtonPressed');
    ReadBaseNavBarStyle(DefaultStyles.ButtonHotTracked, 'ButtonHotTracked');
    ReadBaseNavBarStyle(DefaultStyles.DropTargetGroup, 'DropTargetGroup');
    ReadBaseNavBarStyle(DefaultStyles.DropTargetLink, 'DropTargetLink');
    ReadBaseNavBarStyle(DefaultStyles.GroupBackground, 'GroupBackground');
    ReadBaseNavBarStyle(DefaultStyles.GroupHeader, 'GroupHeader');
    ReadBaseNavBarStyle(DefaultStyles.GroupHeaderActive, 'GroupHeaderActive');
    ReadBaseNavBarStyle(DefaultStyles.GroupHeaderHotTracked, 'GroupHeaderHotTracked');
    ReadBaseNavBarStyle(DefaultStyles.GroupHeaderPressed, 'GroupHeaderPressed');
    ReadBaseNavBarStyle(DefaultStyles.Hint, 'Hint');
    ReadBaseNavBarStyle(DefaultStyles.Item, 'Item');
    ReadBaseNavBarStyle(DefaultStyles.ItemDisabled, 'ItemDisabled');
    ReadBaseNavBarStyle(DefaultStyles.ItemHotTracked, 'ItemHotTracked');
    ReadBaseNavBarStyle(DefaultStyles.ItemPressed, 'ItemPressed');
  end;
end;

procedure NLS_dxNavBar_Export(NLSValues: TNLSValues; AComponent: TComponent);

  procedure WriteBaseNavBarStyle(Style: TdxBaseNavBarStyle; StyleName: string);
  begin
    NLSValues.WriteString(AComponent, AComponent.Name + 'DefaultStyles.' + StyleName + '.Font.Name', Style.Font.Name);
    NLSValues.WriteInteger(AComponent, AComponent.Name + 'DefaultStyles.' + StyleName + '.Font.Size', Style.Font.Size);
    NLSValues.WriteInteger(AComponent, AComponent.Name + 'DefaultStyles.' + StyleName + '.Font.Charset', Style.Font.Charset);
  end;

begin
  with AComponent as TdxNavBar do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    WriteBaseNavBarStyle(DefaultStyles.Background, 'Background');
    WriteBaseNavBarStyle(DefaultStyles.Button, 'Button');
    WriteBaseNavBarStyle(DefaultStyles.ButtonPressed, 'ButtonPressed');
    WriteBaseNavBarStyle(DefaultStyles.ButtonHotTracked, 'ButtonHotTracked');
    WriteBaseNavBarStyle(DefaultStyles.DropTargetGroup, 'DropTargetGroup');
    WriteBaseNavBarStyle(DefaultStyles.DropTargetLink, 'DropTargetLink');
    WriteBaseNavBarStyle(DefaultStyles.GroupBackground, 'GroupBackground');
    WriteBaseNavBarStyle(DefaultStyles.GroupHeader, 'GroupHeader');
    WriteBaseNavBarStyle(DefaultStyles.GroupHeaderActive, 'GroupHeaderActive');
    WriteBaseNavBarStyle(DefaultStyles.GroupHeaderHotTracked, 'GroupHeaderHotTracked');
    WriteBaseNavBarStyle(DefaultStyles.GroupHeaderPressed, 'GroupHeaderPressed');
    WriteBaseNavBarStyle(DefaultStyles.Hint, 'Hint');
    WriteBaseNavBarStyle(DefaultStyles.Item, 'Item');
    WriteBaseNavBarStyle(DefaultStyles.ItemDisabled, 'ItemDisabled');
    WriteBaseNavBarStyle(DefaultStyles.ItemHotTracked, 'ItemHotTracked');
    WriteBaseNavBarStyle(DefaultStyles.ItemPressed, 'ItemPressed');
  end;
end;

// TdxNavBarGroup --------------------------------------------------------------

procedure NLS_dxNavBarGroup_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TdxNavBarGroup do
  begin
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
  end;
end;

procedure NLS_dxNavBarGroup_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TdxNavBarGroup do
  begin
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
  end;
end;

// TdxNavBarItem ---------------------------------------------------------------

procedure NLS_dxNavBarItem_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TdxNavBarItem do
  begin
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
  end;
end;

procedure NLS_dxNavBarItem_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TdxNavBarItem do
  begin
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
  end;
end;
}
function IsExportMode: Boolean;
begin
  if (ParamCount > 0) and ((ParamStr(1) = '-export') or (ParamStr(1) = '-e')) then
    Result := True
  else
    Result := False;
end;

initialization
  // Translation.
  if IsExportMode then
    NLSManager.SetExportMode
  else
    NLSManager.SetImportMode;
  // Register NLS Components
  NLSManager.RegisterNLSComponent(TdxBarManager, False, NLS_dxBarManager_Import, NLS_dxBarManager_Export);
  NLSManager.RegisterNLSComponent(TdxBarItem, False, NLS_dxBarItem_Import, NLS_dxBarItem_Export);
  NLSManager.RegisterNLSComponent(TPageControl, True, NLS_dxPageControl_Import, NLS_dxPageControl_Export);
  NLSManager.RegisterNLSComponent(TTabSheet, True, NLS_dxTabSheet_Import, NLS_dxTabSheet_Export);
  //NLSManager.RegisterNLSComponent(TTBToolBar, True, NLS_TBToolBar_Import, NLS_TBToolBar_Export);
  //NLSManager.RegisterNLSComponent(TTBItem, False, NLS_TBItem_Import, NLS_TBItem_Export);
  NLSManager.RegisterNLSComponent(TAreaTitleBar, False, NLS_AreaTitleBar_Import, NLS_AreaTitleBar_Export);
  NLSManager.RegisterNLSComponent(TFlatPanel, True, NLS_FlatPanel_Import, NLS_FlatPanel_Export);
  NLSManager.RegisterNLSComponent(TCompactFontDialog, True, NLS_CompactFontDialog_Import, NLS_CompactFontDialog_Export);
  //NLSManager.RegisterNLSComponent(TdxNavBar, False, NLS_dxNavBar_Import, NLS_dxNavBar_Export);
  //NLSManager.RegisterNLSComponent(TdxNavBarGroup, False, NLS_dxNavBarGroup_Import, NLS_dxNavBarGroup_Export);
  //NLSManager.RegisterNLSComponent(TdxNavBarItem, False, NLS_dxNavBarItem_Import, NLS_dxNavBarItem_Export);
  // Translate Strings
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\STRS.LNG');
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEM_SEL_NOTHING', TXT_ELEM_SEL_NOTHING, C_TXT_ELEM_SEL_NOTHING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEM_SEL_MULTIPLE', TXT_ELEM_SEL_MULTIPLE, C_TXT_ELEM_SEL_MULTIPLE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PROGRAM_NAME', TXT_PROGRAM_NAME, C_TXT_PROGRAM_NAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_UNTITILED_PRJ', TXT_UNTITILED_PRJ, C_TXT_UNTITILED_PRJ);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_DECIMAL_SEPARATOR', TXT_DECIMAL_SEPARATOR, C_TXT_DECIMAL_SEPARATOR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_FILE_NOT_FOUND', ERR_FILE_NOT_FOUND, C_ERR_FILE_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_VALUE', ERR_INVALID_VALUE, C_ERR_INVALID_VALUE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INTERNAL_ERROR', ERR_INTERNAL_ERROR, C_ERR_INTERNAL_ERROR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_OUT_OF_RANGE', ERR_OUT_OF_RANGE, C_ERR_OUT_OF_RANGE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_READING_DATA', ERR_READING_DATA, C_ERR_READING_DATA);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_APPLICATION_TITLE', TXT_APPLICATION_TITLE, C_TXT_APPLICATION_TITLE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_PERSONAL_EDITION_NOTIFICATION', MSG_PERSONAL_EDITION_NOTIFICATION, C_MSG_PERSONAL_EDITION_NOTIFICATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_TRIAL_EXPIRED', MSG_TRIAL_EXPIRED, C_MSG_TRIAL_EXPIRED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_REGISTRATION', ERR_INVALID_REGISTRATION, C_ERR_INVALID_REGISTRATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ADDIN_LOADED', MSG_ADDIN_LOADED, C_MSG_ADDIN_LOADED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ADDIN_ACTIVATED', MSG_ADDIN_ACTIVATED, C_MSG_ADDIN_ACTIVATED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ADDIN_DEACTIVATED', MSG_ADDIN_DEACTIVATED, C_MSG_ADDIN_DEACTIVATED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ADDIN_MENU_CONFIGURED', MSG_ADDIN_MENU_CONFIGURED, C_MSG_ADDIN_MENU_CONFIGURED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ADDIN_LOAD_FAILED', ERR_ADDIN_LOAD_FAILED, C_ERR_ADDIN_LOAD_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ADDIN_REGKEY', ERR_ADDIN_REGKEY, C_ERR_ADDIN_REGKEY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ADDIN_ITEM_REGKEY', ERR_ADDIN_ITEM_REGKEY, C_ERR_ADDIN_ITEM_REGKEY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ADDIN_ITEM_REGVALUE', ERR_ADDIN_ITEM_REGVALUE, C_ERR_ADDIN_ITEM_REGVALUE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ADDIN_MENU_CONFIG_FAILED', ERR_ADDIN_MENU_CONFIG_FAILED, C_ERR_ADDIN_MENU_CONFIG_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ADDIN_MENUFILE_NOT_EXIST', ERR_ADDIN_MENUFILE_NOT_EXIST, C_ERR_ADDIN_MENUFILE_NOT_EXIST);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ADDIN_MENUFILE_INVALID', ERR_ADDIN_MENUFILE_INVALID, C_ERR_ADDIN_MENUFILE_INVALID);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ADDIN_COMOBJ_CREATION', ERR_ADDIN_COMOBJ_CREATION, C_ERR_ADDIN_COMOBJ_CREATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ADDIN_COMOBJ_INVALID_PROGID', ERR_ADDIN_COMOBJ_INVALID_PROGID, C_ERR_ADDIN_COMOBJ_INVALID_PROGID);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ADDIN_COMOBJ_MSG_SENDING', ERR_ADDIN_COMOBJ_MSG_SENDING, C_ERR_ADDIN_COMOBJ_MSG_SENDING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ADDIN_SCRIPT_EXECUTION', ERR_ADDIN_SCRIPT_EXECUTION, C_ERR_ADDIN_SCRIPT_EXECUTION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ADDIN_HELPFILE_CANNOT_OPEN', ERR_ADDIN_HELPFILE_CANNOT_OPEN, C_ERR_ADDIN_HELPFILE_CANNOT_OPEN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ADDIN_HELPFILE_INVALID', ERR_ADDIN_HELPFILE_INVALID, C_ERR_ADDIN_HELPFILE_INVALID);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ADDIN_HELPFILE_DISPLAYNAME', TXT_ADDIN_HELPFILE_DISPLAYNAME, C_TXT_ADDIN_HELPFILE_DISPLAYNAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_APPROACH_LOADED', MSG_APPROACH_LOADED, C_MSG_APPROACH_LOADED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_APPROACH_LOAD_FAILED', ERR_APPROACH_LOAD_FAILED, C_ERR_APPROACH_LOAD_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CLIPBRD_REG_FORMAT', ERR_CLIPBRD_REG_FORMAT, C_ERR_CLIPBRD_REG_FORMAT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CLIPBRD_MENU_EXECUTION', ERR_CLIPBRD_MENU_EXECUTION, C_ERR_CLIPBRD_MENU_EXECUTION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CMD_EXPRESSION_PARSING', ERR_CMD_EXPRESSION_PARSING, C_ERR_CMD_EXPRESSION_PARSING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CMD_CANNOT_FIND_BASEELEMENT', ERR_CMD_CANNOT_FIND_BASEELEMENT, C_ERR_CMD_CANNOT_FIND_BASEELEMENT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CMD_CANNOT_FIND_CLASSIFIER', ERR_CMD_CANNOT_FIND_CLASSIFIER, C_ERR_CMD_CANNOT_FIND_CLASSIFIER);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLLEDIT_TITLE', TXT_COLLEDIT_TITLE, C_TXT_COLLEDIT_TITLE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLLEDIT_NO_MODEL', TXT_COLLEDIT_NO_MODEL, C_TXT_COLLEDIT_NO_MODEL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLLEDIT_NO_ROLENAME', TXT_COLLEDIT_NO_ROLENAME, C_TXT_COLLEDIT_NO_ROLENAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_COLLEDIT_SELECT_RESIDENT', MSG_COLLEDIT_SELECT_RESIDENT, C_MSG_COLLEDIT_SELECT_RESIDENT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_COLLEDIT_SELECT_COMPONENT', MSG_COLLEDIT_SELECT_COMPONENT, C_MSG_COLLEDIT_SELECT_COMPONENT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_COLLEDIT_SELECT_ARTIFACT', MSG_COLLEDIT_SELECT_ARTIFACT, C_MSG_COLLEDIT_SELECT_ARTIFACT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_COLLEDIT_SELECT_SIGNAL', MSG_COLLEDIT_SELECT_SIGNAL, C_MSG_COLLEDIT_SELECT_SIGNAL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CONSTREDIT_TITILE', TXT_CONSTREDIT_TITILE, C_TXT_CONSTREDIT_TITILE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CONSTREDIT_NO_MODEL', TXT_CONSTREDIT_NO_MODEL, C_TXT_CONSTREDIT_NO_MODEL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CONSTREDIT_MULTILINE', TXT_CONSTREDIT_MULTILINE, C_TXT_CONSTREDIT_MULTILINE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_CONTRIBUTORS_FILE', ERR_INVALID_CONTRIBUTORS_FILE, C_ERR_INVALID_CONTRIBUTORS_FILE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ELEM_INVALID_NAME', ERR_ELEM_INVALID_NAME, C_ERR_ELEM_INVALID_NAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_SAVE_READONLY_FILE', ERR_SAVE_READONLY_FILE, C_ERR_SAVE_READONLY_FILE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ELEMSELECTOR_DEFAULT_TITLE', MSG_ELEMSELECTOR_DEFAULT_TITLE, C_MSG_ELEMSELECTOR_DEFAULT_TITLE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_PROFILE_NOT_FOUND', MSG_PROFILE_NOT_FOUND, C_MSG_PROFILE_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_INVALID_CLASS_NAME', MSG_INVALID_CLASS_NAME, C_MSG_INVALID_CLASS_NAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_PROFILE_CANNOT_EXCLUDE', MSG_PROFILE_CANNOT_EXCLUDE, C_MSG_PROFILE_CANNOT_EXCLUDE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_PROFILE_LOADED', MSG_PROFILE_LOADED, C_MSG_PROFILE_LOADED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_PROFILE_LOAD_FAILED', ERR_PROFILE_LOAD_FAILED, C_ERR_PROFILE_LOAD_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_FRAMEWORK_LOADED', MSG_FRAMEWORK_LOADED, C_MSG_FRAMEWORK_LOADED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_FRAMEWORK_LOAD_FAILED', ERR_FRAMEWORK_LOAD_FAILED, C_ERR_FRAMEWORK_LOAD_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_UMLADVISOR_FILE_NOT_FOUND', ERR_UMLADVISOR_FILE_NOT_FOUND, C_ERR_UMLADVISOR_FILE_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_DOCUMENT_MODIFIED', MSG_DOCUMENT_MODIFIED, C_MSG_DOCUMENT_MODIFIED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_STATUS_FILE_LOADING', MSG_STATUS_FILE_LOADING, C_MSG_STATUS_FILE_LOADING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_STATUS_FILE_LOADING_COMPLETE', MSG_STATUS_FILE_LOADING_COMPLETE, C_MSG_STATUS_FILE_LOADING_COMPLETE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_STATUS_FILE_SAVING', MSG_STATUS_FILE_SAVING, C_MSG_STATUS_FILE_SAVING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_STATUS_FILE_SAVING_COMPLETE', MSG_STATUS_FILE_SAVING_COMPLETE, C_MSG_STATUS_FILE_SAVING_COMPLETE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_STATUS_REFERENCE_RESOLVING', MSG_STATUS_REFERENCE_RESOLVING, C_MSG_STATUS_REFERENCE_RESOLVING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_STATUS_REFERENCE_RESOLVING_COMPLETE', MSG_STATUS_REFERENCE_RESOLVING_COMPLETE, C_MSG_STATUS_REFERENCE_RESOLVING_COMPLETE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ELEMENTS_FOUND', MSG_ELEMENTS_FOUND, C_MSG_ELEMENTS_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFICATION_FAILED', MSG_VERIFICATION_FAILED, C_MSG_VERIFICATION_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFICATION_ALL_PASSED', MSG_VERIFICATION_ALL_PASSED, C_MSG_VERIFICATION_ALL_PASSED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ELEMSELTTL_IMPORT_FRAMEWORK', MSG_ELEMSELTTL_IMPORT_FRAMEWORK, C_MSG_ELEMSELTTL_IMPORT_FRAMEWORK);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_ELEMSELTTL_IMPORT_MODELFRAGMENT', MSG_ELEMSELTTL_IMPORT_MODELFRAGMENT, C_MSG_ELEMSELTTL_IMPORT_MODELFRAGMENT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_PERSONAL_EDITION_IS_NOT_ALLOWED', MSG_PERSONAL_EDITION_IS_NOT_ALLOWED, C_MSG_PERSONAL_EDITION_IS_NOT_ALLOWED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'QUERY_SAVE_MODIFICATION', QUERY_SAVE_MODIFICATION, C_QUERY_SAVE_MODIFICATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'QUERY_SAVE_CHANGED_UNITS', QUERY_SAVE_CHANGED_UNITS, C_QUERY_SAVE_CHANGED_UNITS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'QUERY_DELETE_UNIT', QUERY_DELETE_UNIT, C_QUERY_DELETE_UNIT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'QUERY_RELOAD_PROJECT', QUERY_RELOAD_PROJECT, C_QUERY_RELOAD_PROJECT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_DIAGRAM_NO_COLLECTIONS', ERR_DIAGRAM_NO_COLLECTIONS, C_ERR_DIAGRAM_NO_COLLECTIONS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_DIAGRAM_NO_CONSTRAINTS', ERR_DIAGRAM_NO_CONSTRAINTS, C_ERR_DIAGRAM_NO_CONSTRAINTS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_DIAGRAM_NO_TAGGEDVALUES', ERR_DIAGRAM_NO_TAGGEDVALUES, C_ERR_DIAGRAM_NO_TAGGEDVALUES);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ATTACH_FILE_NOT_FOUND', ERR_ATTACH_FILE_NOT_FOUND, C_ERR_ATTACH_FILE_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_ATTACH_CANNOT_OPEN', ERR_ATTACH_CANNOT_OPEN, C_ERR_ATTACH_CANNOT_OPEN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_NOAPPLICATION_ASSOCIATED', ERR_NOAPPLICATION_ASSOCIATED, C_ERR_NOAPPLICATION_ASSOCIATED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_SEQ_DGM_CMD_NOT_SUPPORT', ERR_SEQ_DGM_CMD_NOT_SUPPORT, C_ERR_SEQ_DGM_CMD_NOT_SUPPORT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_DGM_EXPORT_NO_OPENED_DGM', ERR_DGM_EXPORT_NO_OPENED_DGM, C_ERR_DGM_EXPORT_NO_OPENED_DGM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_DGM_EXPORT_EMPTY_DGM', ERR_DGM_EXPORT_EMPTY_DGM, C_ERR_DGM_EXPORT_EMPTY_DGM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_MODEL_FILE', ERR_INVALID_MODEL_FILE, C_ERR_INVALID_MODEL_FILE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_DOC_TYPE_PROJECT', TXT_DOC_TYPE_PROJECT, C_TXT_DOC_TYPE_PROJECT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_DOC_TYPE_UNIT', TXT_DOC_TYPE_UNIT, C_TXT_DOC_TYPE_UNIT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_DOC_STATUS_READONLY', TXT_DOC_STATUS_READONLY, C_TXT_DOC_STATUS_READONLY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_DOC_STATUS_EXCLUSIVE_FILE_OPEN', TXT_DOC_STATUS_EXCLUSIVE_FILE_OPEN, C_TXT_DOC_STATUS_EXCLUSIVE_FILE_OPEN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_BLANK_APPROACH', TXT_BLANK_APPROACH, C_TXT_BLANK_APPROACH);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_BLANK_APPROACH_DESC', TXT_BLANK_APPROACH_DESC, C_TXT_BLANK_APPROACH_DESC);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_OK', TXT_OK, C_TXT_OK);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_OPEN', TXT_OPEN, C_TXT_OPEN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CANCEL', TXT_CANCEL, C_TXT_CANCEL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_READONLY', ERR_READONLY, C_ERR_READONLY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_SUBVIEW_CANNOT_BE_DELETED', ERR_SUBVIEW_CANNOT_BE_DELETED, C_ERR_SUBVIEW_CANNOT_BE_DELETED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'QUERY_DELETE_UNITS', QUERY_DELETE_UNITS, C_QUERY_DELETE_UNITS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_MODEL_COPY_EXCEEDED', ERR_MODEL_COPY_EXCEEDED, C_ERR_MODEL_COPY_EXCEEDED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_MODEL_PASTE_EXCEEDED', ERR_MODEL_PASTE_EXCEEDED, C_ERR_MODEL_PASTE_EXCEEDED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_IMPROPER_ELEMENET', ERR_IMPROPER_ELEMENET, C_ERR_IMPROPER_ELEMENET);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_DIRECTORY_NOT_FOUND', ERR_DIRECTORY_NOT_FOUND, C_ERR_DIRECTORY_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_FILE_NAME', ERR_INVALID_FILE_NAME, C_ERR_INVALID_FILE_NAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_BITMAP_GEN_ERROR', ERR_BITMAP_GEN_ERROR, C_ERR_BITMAP_GEN_ERROR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_DIAGRAMS_WITH_MODEL_FOUND', TXT_DIAGRAMS_WITH_MODEL_FOUND, C_TXT_DIAGRAMS_WITH_MODEL_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_DIAGRAMS_WITH_MODEL_NOT_FOUND', TXT_DIAGRAMS_WITH_MODEL_NOT_FOUND, C_TXT_DIAGRAMS_WITH_MODEL_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_MARGIN_OVERFLOW', ERR_MARGIN_OVERFLOW, C_ERR_MARGIN_OVERFLOW);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CANNOT_READ_PRINTINFO', ERR_CANNOT_READ_PRINTINFO, C_ERR_CANNOT_READ_PRINTINFO);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_READY', TXT_PRINTER_STATUS_READY, C_TXT_PRINTER_STATUS_READY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_PAUSED', TXT_PRINTER_STATUS_PAUSED, C_TXT_PRINTER_STATUS_PAUSED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_ERROR', TXT_PRINTER_STATUS_ERROR, C_TXT_PRINTER_STATUS_ERROR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_PENDING_DELETION', TXT_PRINTER_STATUS_PENDING_DELETION, C_TXT_PRINTER_STATUS_PENDING_DELETION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_PAPER_JAM', TXT_PRINTER_STATUS_PAPER_JAM, C_TXT_PRINTER_STATUS_PAPER_JAM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_PAPER_OUT', TXT_PRINTER_STATUS_PAPER_OUT, C_TXT_PRINTER_STATUS_PAPER_OUT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_MANUAL_FEED', TXT_PRINTER_STATUS_MANUAL_FEED, C_TXT_PRINTER_STATUS_MANUAL_FEED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_PAPER_PROBLEM', TXT_PRINTER_STATUS_PAPER_PROBLEM, C_TXT_PRINTER_STATUS_PAPER_PROBLEM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_OFFLINE', TXT_PRINTER_STATUS_OFFLINE, C_TXT_PRINTER_STATUS_OFFLINE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_IO_ACTIVE', TXT_PRINTER_STATUS_IO_ACTIVE, C_TXT_PRINTER_STATUS_IO_ACTIVE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_BUSY', TXT_PRINTER_STATUS_BUSY, C_TXT_PRINTER_STATUS_BUSY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_PRINTING', TXT_PRINTER_STATUS_PRINTING, C_TXT_PRINTER_STATUS_PRINTING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_OUTPUT_BIN_FULL', TXT_PRINTER_STATUS_OUTPUT_BIN_FULL, C_TXT_PRINTER_STATUS_OUTPUT_BIN_FULL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_NOT_AVAILABLE', TXT_PRINTER_STATUS_NOT_AVAILABLE, C_TXT_PRINTER_STATUS_NOT_AVAILABLE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_WAITING', TXT_PRINTER_STATUS_WAITING, C_TXT_PRINTER_STATUS_WAITING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_PROCESSING', TXT_PRINTER_STATUS_PROCESSING, C_TXT_PRINTER_STATUS_PROCESSING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_INITIALIZING', TXT_PRINTER_STATUS_INITIALIZING, C_TXT_PRINTER_STATUS_INITIALIZING);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_WARMING_UP', TXT_PRINTER_STATUS_WARMING_UP, C_TXT_PRINTER_STATUS_WARMING_UP);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_TONER_LOW', TXT_PRINTER_STATUS_TONER_LOW, C_TXT_PRINTER_STATUS_TONER_LOW);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_NO_TONER', TXT_PRINTER_STATUS_NO_TONER, C_TXT_PRINTER_STATUS_NO_TONER);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_PAGE_PUNT', TXT_PRINTER_STATUS_PAGE_PUNT, C_TXT_PRINTER_STATUS_PAGE_PUNT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_USER_INTERVENTION', TXT_PRINTER_STATUS_USER_INTERVENTION, C_TXT_PRINTER_STATUS_USER_INTERVENTION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_OUT_OF_MEMORY', TXT_PRINTER_STATUS_OUT_OF_MEMORY, C_TXT_PRINTER_STATUS_OUT_OF_MEMORY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_DOOR_OPEN', TXT_PRINTER_STATUS_DOOR_OPEN, C_TXT_PRINTER_STATUS_DOOR_OPEN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_SERVER_UNKNOWN', TXT_PRINTER_STATUS_SERVER_UNKNOWN, C_TXT_PRINTER_STATUS_SERVER_UNKNOWN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINTER_STATUS_POWER_SAVE', TXT_PRINTER_STATUS_POWER_SAVE, C_TXT_PRINTER_STATUS_POWER_SAVE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINT_STATUS', TXT_PRINT_STATUS, C_TXT_PRINT_STATUS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINT_LOCATION', TXT_PRINT_LOCATION, C_TXT_PRINT_LOCATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINT_STATUS_ERROR', TXT_PRINT_STATUS_ERROR, C_TXT_PRINT_STATUS_ERROR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINT_LOCATION_ERROR', TXT_PRINT_LOCATION_ERROR, C_TXT_PRINT_LOCATION_ERROR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINT_STATUS_UNKNOWN', TXT_PRINT_STATUS_UNKNOWN, C_TXT_PRINT_STATUS_UNKNOWN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINT_LOCATION_UNKNOWN', TXT_PRINT_LOCATION_UNKNOWN, C_TXT_PRINT_LOCATION_UNKNOWN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_PRINT_PAGE', TXT_PRINT_PAGE, C_TXT_PRINT_PAGE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'QUERY_REMOVE_PROFILE', QUERY_REMOVE_PROFILE, C_QUERY_REMOVE_PROFILE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_FILE_LOADING_FAILED', ERR_FILE_LOADING_FAILED, C_ERR_FILE_LOADING_FAILED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_PROFILE_NOT_FOUND', ERR_PROFILE_NOT_FOUND, C_ERR_PROFILE_NOT_FOUND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ADD_CLASS', TXT_ADD_CLASS, C_TXT_ADD_CLASS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ADD_OPERATION', TXT_ADD_OPERATION, C_TXT_ADD_OPERATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REMOVE_OPERATION', TXT_REMOVE_OPERATION, C_TXT_REMOVE_OPERATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ADD_ATTRIBUTE', TXT_ADD_ATTRIBUTE, C_TXT_ADD_ATTRIBUTE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REMOVE_ATTRIBUTE', TXT_REMOVE_ATTRIBUTE, C_TXT_REMOVE_ATTRIBUTE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ADD_LITERAL', TXT_ADD_LITERAL, C_TXT_ADD_LITERAL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REMOVE_LITERAL', TXT_REMOVE_LITERAL, C_TXT_REMOVE_LITERAL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ADD_ACTION', TXT_ADD_ACTION, C_TXT_ADD_ACTION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REMOVE_REMOVE', TXT_REMOVE_REMOVE, C_TXT_REMOVE_REMOVE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ADD_ENTRY_ACTION', TXT_ADD_ENTRY_ACTION, C_TXT_ADD_ENTRY_ACTION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ADD_DO_ACTION', TXT_ADD_DO_ACTION, C_TXT_ADD_DO_ACTION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ADD_EXIT_ACTION', TXT_ADD_EXIT_ACTION, C_TXT_ADD_EXIT_ACTION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_MOVE_UP', TXT_MOVE_UP, C_TXT_MOVE_UP);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_MOVE_DOWN', TXT_MOVE_DOWN, C_TXT_MOVE_DOWN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CALL_ACTION_OPERATION', TXT_CALL_ACTION_OPERATION, C_TXT_CALL_ACTION_OPERATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CALL_ACTION_OPERATION_WARN', TXT_CALL_ACTION_OPERATION_WARN, C_TXT_CALL_ACTION_OPERATION_WARN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_SEND_ACTION_SIGNAL', TXT_SEND_ACTION_SIGNAL, C_TXT_SEND_ACTION_SIGNAL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CREATE_ACTION_INSTANTIATION', TXT_CREATE_ACTION_INSTANTIATION, C_TXT_CREATE_ACTION_INSTANTIATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CREATE_ACTION_INSTANTIATION_WARN', TXT_CREATE_ACTION_INSTANTIATION_WARN, C_TXT_CREATE_ACTION_INSTANTIATION_WARN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ACTION_WARN', TXT_ACTION_WARN, C_TXT_ACTION_WARN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_CALL_ACTION_WARN', TXT_CALL_ACTION_WARN, C_TXT_CALL_ACTION_WARN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_INPUT_ELEM_NAME', TXT_INPUT_ELEM_NAME, C_TXT_INPUT_ELEM_NAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_INPUT_CLASS_NAME', TXT_INPUT_CLASS_NAME, C_TXT_INPUT_CLASS_NAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_INPUT_OPERATION_NAME', TXT_INPUT_OPERATION_NAME, C_TXT_INPUT_OPERATION_NAME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_SELECT_OPERATION', MSG_SELECT_OPERATION, C_MSG_SELECT_OPERATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_SELECT_SIGNAL', MSG_SELECT_SIGNAL, C_MSG_SELECT_SIGNAL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_SELECT_INSTANTIATION', MSG_SELECT_INSTANTIATION, C_MSG_SELECT_INSTANTIATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_NO_STEREOTYPE', TXT_NO_STEREOTYPE, C_TXT_NO_STEREOTYPE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_NOT_DEFINED_STEREOTYPE', TXT_NOT_DEFINED_STEREOTYPE, C_TXT_NOT_DEFINED_STEREOTYPE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_DESC_NO_STEREOTYPE', TXT_DESC_NO_STEREOTYPE, C_TXT_DESC_NO_STEREOTYPE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_DESC_NOT_DEFINED_STEREOTYPE', TXT_DESC_NOT_DEFINED_STEREOTYPE, C_TXT_DESC_NOT_DEFINED_STEREOTYPE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_DESC_PRIFILE_EXCLUDED_STEREOTYPE', TXT_DESC_PRIFILE_EXCLUDED_STEREOTYPE, C_TXT_DESC_PRIFILE_EXCLUDED_STEREOTYPE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_TAG_TYPE', ERR_INVALID_TAG_TYPE, C_ERR_INVALID_TAG_TYPE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLL_TAGGED_VALUE', TXT_COLL_TAGGED_VALUE, C_TXT_COLL_TAGGED_VALUE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_TITLE_TAGGEDVALUEEDITORFORM', TXT_TITLE_TAGGEDVALUEEDITORFORM, C_TXT_TITLE_TAGGEDVALUEEDITORFORM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_TAGGED_VALUE', TXT_TAGGED_VALUE, C_TXT_TAGGED_VALUE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_TAGGEDVALUE_TEXT', TXT_TAGGEDVALUE_TEXT, C_TXT_TAGGEDVALUE_TEXT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_TAGGEDVALUE_COLLECTION', TXT_TAGGEDVALUE_COLLECTION, C_TXT_TAGGEDVALUE_COLLECTION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_UML_ADV_NOT_FOUND_TITLE', TXT_UML_ADV_NOT_FOUND_TITLE, C_TXT_UML_ADV_NOT_FOUND_TITLE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_UML_ADV_NOT_FOUND_CONTENT', TXT_UML_ADV_NOT_FOUND_CONTENT, C_TXT_UML_ADV_NOT_FOUND_CONTENT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_NAME_CONFLICT', ERR_NAME_CONFLICT, C_ERR_NAME_CONFLICT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CANNOT_CREATE_RELATION', ERR_CANNOT_CREATE_RELATION, C_ERR_CANNOT_CREATE_RELATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_INVALID_RELATION', ERR_INVALID_RELATION, C_ERR_INVALID_RELATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CANNOT_CREATE_STIMULUS', ERR_CANNOT_CREATE_STIMULUS, C_ERR_CANNOT_CREATE_STIMULUS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_CANNOT_CREATE_MESSAGE', ERR_CANNOT_CREATE_MESSAGE, C_ERR_CANNOT_CREATE_MESSAGE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REL_TRANSITION', TXT_REL_TRANSITION, C_TXT_REL_TRANSITION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REL_DEPENDENCY', TXT_REL_DEPENDENCY, C_TXT_REL_DEPENDENCY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REL_ASSOCIATION', TXT_REL_ASSOCIATION, C_TXT_REL_ASSOCIATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REL_ASSOCIATIONCLASS', TXT_REL_ASSOCIATIONCLASS, C_TXT_REL_ASSOCIATIONCLASS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REL_GENERALIZATION', TXT_REL_GENERALIZATION, C_TXT_REL_GENERALIZATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REL_LINK', TXT_REL_LINK, C_TXT_REL_LINK);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REL_ASSOCIATION_ROLE', TXT_REL_ASSOCIATION_ROLE, C_TXT_REL_ASSOCIATION_ROLE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REL_STIMULUS', TXT_REL_STIMULUS, C_TXT_REL_STIMULUS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REL_MESSSAGE', TXT_REL_MESSSAGE, C_TXT_REL_MESSSAGE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REL_INCLUDE', TXT_REL_INCLUDE, C_TXT_REL_INCLUDE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REL_EXTEND', TXT_REL_EXTEND, C_TXT_REL_EXTEND);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REL_REALIZATION', TXT_REL_REALIZATION, C_TXT_REL_REALIZATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_REL_CONNECTOR', TXT_REL_CONNECTOR, C_TXT_REL_CONNECTOR);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_FACTORY_PARAM', ERR_FACTORY_PARAM, C_ERR_FACTORY_PARAM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_FACTORY_LINK', ERR_FACTORY_LINK, C_ERR_FACTORY_LINK);
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_FACTORY_ASSOCIATIONCLASS', ERR_FACTORY_ASSOCIATIONCLASS, C_ERR_FACTORY_ASSOCIATIONCLASS);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEMSELTTL_TYPE', TXT_ELEMSELTTL_TYPE, C_TXT_ELEMSELTTL_TYPE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEMSELTTL_CLASSIFIER', TXT_ELEMSELTTL_CLASSIFIER, C_TXT_ELEMSELTTL_CLASSIFIER);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEMSELTTL_INSTANTIATION', TXT_ELEMSELTTL_INSTANTIATION, C_TXT_ELEMSELTTL_INSTANTIATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEMSELTTL_BASE', TXT_ELEMSELTTL_BASE, C_TXT_ELEMSELTTL_BASE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEMLSTTTL_VALUE', TXT_ELEMLSTTTL_VALUE, C_TXT_ELEMLSTTTL_VALUE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEMLSTTTL_OPERATION', TXT_ELEMLSTTTL_OPERATION, C_TXT_ELEMLSTTTL_OPERATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEMLSTTTL_SIGNAL', TXT_ELEMLSTTTL_SIGNAL, C_TXT_ELEMLSTTTL_SIGNAL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEMLSTTTL_SUBMACHINE', TXT_ELEMLSTTTL_SUBMACHINE, C_TXT_ELEMLSTTTL_SUBMACHINE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_ELEMLSTTTL_ATTRIBUTE', TXT_ELEMLSTTTL_ATTRIBUTE, C_TXT_ELEMLSTTTL_ATTRIBUTE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_ASSOCIATION_1', MSG_VERIFY_ASSOCIATION_1, C_MSG_VERIFY_ASSOCIATION_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_ASSOCIATION_2', MSG_VERIFY_ASSOCIATION_2, C_MSG_VERIFY_ASSOCIATION_2);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_BEHAVIORALFEATURE_1', MSG_VERIFY_BEHAVIORALFEATURE_1, C_MSG_VERIFY_BEHAVIORALFEATURE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_CLASSIFIER_1', MSG_VERIFY_CLASSIFIER_1, C_MSG_VERIFY_CLASSIFIER_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_CLASSIFIER_2', MSG_VERIFY_CLASSIFIER_2, C_MSG_VERIFY_CLASSIFIER_2);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_CLASSIFIER_3', MSG_VERIFY_CLASSIFIER_3, C_MSG_VERIFY_CLASSIFIER_3);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_CLASSIFIER_4', MSG_VERIFY_CLASSIFIER_4, C_MSG_VERIFY_CLASSIFIER_4);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_GENERALIZABLEELEMENT_1', MSG_VERIFY_GENERALIZABLEELEMENT_1, C_MSG_VERIFY_GENERALIZABLEELEMENT_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_GENERALIZABLEELEMENT_2', MSG_VERIFY_GENERALIZABLEELEMENT_2, C_MSG_VERIFY_GENERALIZABLEELEMENT_2);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_GENERALIZABLEELEMENT_3', MSG_VERIFY_GENERALIZABLEELEMENT_3, C_MSG_VERIFY_GENERALIZABLEELEMENT_3);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_INTERFACE_1', MSG_VERIFY_INTERFACE_1, C_MSG_VERIFY_INTERFACE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_COMPONENTINSTANCE_1', MSG_VERIFY_COMPONENTINSTANCE_1, C_MSG_VERIFY_COMPONENTINSTANCE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_NODEINSTANCE_1', MSG_VERIFY_NODEINSTANCE_1, C_MSG_VERIFY_NODEINSTANCE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_ASSOCIATIONENDROLE_1', MSG_VERIFY_ASSOCIATIONENDROLE_1, C_MSG_VERIFY_ASSOCIATIONENDROLE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_CLASSIFIERROLE_1', MSG_VERIFY_CLASSIFIERROLE_1, C_MSG_VERIFY_CLASSIFIERROLE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_CLASSIFIERROLE_2', MSG_VERIFY_CLASSIFIERROLE_2, C_MSG_VERIFY_CLASSIFIERROLE_2);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_MESSAGE_1', MSG_VERIFY_MESSAGE_1, C_MSG_VERIFY_MESSAGE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_ACTOR_1', MSG_VERIFY_ACTOR_1, C_MSG_VERIFY_ACTOR_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_COMPOSITESTATE_1', MSG_VERIFY_COMPOSITESTATE_1, C_MSG_VERIFY_COMPOSITESTATE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_COMPOSITESTATE_2', MSG_VERIFY_COMPOSITESTATE_2, C_MSG_VERIFY_COMPOSITESTATE_2);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_COMPOSITESTATE_3', MSG_VERIFY_COMPOSITESTATE_3, C_MSG_VERIFY_COMPOSITESTATE_3);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_COMPOSITESTATE_4', MSG_VERIFY_COMPOSITESTATE_4, C_MSG_VERIFY_COMPOSITESTATE_4);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_COMPOSITESTATE_5', MSG_VERIFY_COMPOSITESTATE_5, C_MSG_VERIFY_COMPOSITESTATE_5);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_FINALSTATE_1', MSG_VERIFY_FINALSTATE_1, C_MSG_VERIFY_FINALSTATE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_PSEUDOSTATE_1', MSG_VERIFY_PSEUDOSTATE_1, C_MSG_VERIFY_PSEUDOSTATE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_PSEUDOSTATE_2', MSG_VERIFY_PSEUDOSTATE_2, C_MSG_VERIFY_PSEUDOSTATE_2);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_PSEUDOSTATE_3', MSG_VERIFY_PSEUDOSTATE_3, C_MSG_VERIFY_PSEUDOSTATE_3);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_PSEUDOSTATE_4', MSG_VERIFY_PSEUDOSTATE_4, C_MSG_VERIFY_PSEUDOSTATE_4);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_STATEMACHINE_1', MSG_VERIFY_STATEMACHINE_1, C_MSG_VERIFY_STATEMACHINE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_STATEMACHINE_2', MSG_VERIFY_STATEMACHINE_2, C_MSG_VERIFY_STATEMACHINE_2);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_STATEMACHINE_3', MSG_VERIFY_STATEMACHINE_3, C_MSG_VERIFY_STATEMACHINE_3);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_STATEMACHINE_4', MSG_VERIFY_STATEMACHINE_4, C_MSG_VERIFY_STATEMACHINE_4);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_SUBMACHINESTATE_1', MSG_VERIFY_SUBMACHINESTATE_1, C_MSG_VERIFY_SUBMACHINESTATE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_TRANSITION_1', MSG_VERIFY_TRANSITION_1, C_MSG_VERIFY_TRANSITION_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_ACTIVITYGRAPH_1', MSG_VERIFY_ACTIVITYGRAPH_1, C_MSG_VERIFY_ACTIVITYGRAPH_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_ACTIONSTATE_1', MSG_VERIFY_ACTIONSTATE_1, C_MSG_VERIFY_ACTIONSTATE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_ACTIONSTATE_2', MSG_VERIFY_ACTIONSTATE_2, C_MSG_VERIFY_ACTIONSTATE_2);
  NLSManager.TranslateString(NLS_STR_SECTION, 'MSG_VERIFY_SUBACTIVITYSTATE_1', MSG_VERIFY_SUBACTIVITYSTATE_1, C_MSG_VERIFY_SUBACTIVITYSTATE_1);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_UNTIL_EXPIRATION', TXT_UNTIL_EXPIRATION, C_TXT_UNTIL_EXPIRATION);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_EXPIRED', TXT_EXPIRED, C_TXT_EXPIRED);
end.
