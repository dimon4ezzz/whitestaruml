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

uses Windows;

const
  // Option related
  OPTION_SCHEMA = 'StarUML.Java15';
  OPTION_KEY_ASSOC = 'CREATE_EMPTY_ASSOC_END';
  OPTION_KEY_SPACE = 'SPACE_INSTEAD_TAB';
  OPTION_KEY_SPACE_MAG = 'SPACE_MAGNITUDE';
  OPTION_KEY_BRACE = 'BRACE_PUT_NEWLINE';
  OPTION_KEY_DOC = 'CREATE_JAVA_DOC';
  OPTION_KEY_EMPTY_DOC = 'CREATE_JAVA_DOC_EMPTY';
  OPTION_KEY_INNER = 'CREATE_INNER_CLASS';
  OPTION_KEY_HIERARCHY = 'CREATE_HIERARCHY';
  OPTION_KEY_PACK_ROOT = 'CREATE_PACKAGE_ROOT';
  OPTION_KEY_PACKAGE_DECL = 'CREATE_PACKAGE_DECL';
  OPTION_KEY_IMPORT = 'CREATE_IMPORT_DECL'; { unused }
  OPTION_KEY_ON_DEMAND = 'IMPORT_DECL_ON_DEMAND'; { unused }
  OPTION_KEY_NO_PROFILE = 'CREATE_WITH_NO_PROFILE';
  OPTION_KEY_FILE_DESC = 'CREATE_FILE_DESC';
  OPTION_KEY_PUBLIC_MEMBER = 'CREATE_PUBLIC_MEMBER';
  OPTION_KEY_PACKAGE_MEMBER = 'CREATE_PACKAGE_MEMBER';
  OPTION_KEY_PROTECTED_MEMBER = 'CREATE_PROTECTED_MEMBER';
  OPTION_KEY_PRIVATE_MEMBER = 'CREATE_PRIVATE_MEMBER';
  OPTION_KEY_OMIT_INIT = 'OMIT_INITIAL_VALUE';
  OPTION_KEY_REV_JAVADOC = 'REVERSE_JAVADOC';
  OPTION_KEY_FIELD_AS_ASSOC = 'FIELD_AS_ASSOC';
  OPTION_KEY_OVERVIEW = 'CREATE_OVERVIEW';
  OPTION_KEY_ENLARGE = 'ENLARGE_DIAGRAM';
  OPTION_KEY_DGM_NAME = 'DIGRAM_NAME';
  OPTION_KEY_SUPP_ATTR = 'SUPRESS_ATTR';
  OPTION_KEY_SUPP_OPER = 'SUPRESS_OPER';
  OPTION_KEY_HIDE_SIG = 'HIDE_OPER_SIGNATURE';
  OPTION_KEY_INHER_ONLY = 'INHERITANCE_ONLY';
  OPTION_HEADER_COMMENT = 'HEADER_COMMENT';
  OPT_GENERATE_OPERATION_IMPLEMENTATION = 'GENERATE_OPERATION_IMPLEMENTATION';

  //Profile
  PROFILE_STANDARD = 'UMLStandard';
  //PROFILE_JAVA = 'Java';
  PROFILE_JAVA15 = 'Java';
  STD_STEREOTYPE_IMPORT = 'import';
  STD_STEREOTYPE_CREATE = 'create';
  TAGSET_DEFAULT = 'Default';
  TAGSET_CLASS = 'JavaClass';
  TAGSET_DIMEN = 'JavaDimensions';
  TAGSET_PARAM = 'JavaParameter';
  TAGSET_STRICTFP = 'JavaStrictfp';
  TAGSET_FIELD = 'JavaField';
  TAGSET_OPERATION = 'JavaOperation';
  TAG_STANDARD_IMPLEMENTATION = 'Implementation';
  TAG_STATIC = 'JavaStatic';
  TAG_STRICTFP = 'JavaStrictfp';
  TAG_TRANSIENT = 'JavaTransient';
  TAG_VOLATILE = 'JavaVolatile';
  TAG_COLLECTION = 'JavaCollection';
  TAG_DIMEN = 'JavaDimensions';
  TAG_NATIVE = 'JavaNative';
  TAG_FINAL = 'JavaFinal';
  TAG_THROWS = 'JavaThrows';

  // JavaDoc
  JAVA_DOC_START = '/**';
  JAVA_DOC_LINE  = ' * ';
  JAVA_DOC_END   = ' */'#13#10;
  JAVA_DOC_EMPTY = '/** */';

  // UML elements
  ELEM_PROJECT = 'UMLProject';
  ELEM_MODEL = 'UMLModel';
  ELEM_SUBSYSTEM = 'UMLSubsystem';
  ELEM_PACKAGE = 'UMLPackage';
  ELEM_CLASS = 'UMLClass';
  ELEM_INTERFACE = 'UMLInterface';
  ELEM_NAMESPACE = 'UMLNamespace';
  ELEM_STRUCTURAL_FEATURE = 'UMLStructuralFeature';
  ELEMN_ASSOCIATION_END = 'UMLAssociationEnd';
  ELEM_REALIZATION = 'UMLRealization';
  ELEM_OPERATION = 'UMLOperation';
  ELEM_GENERALIZABLE_ELEMENT = 'UMLGeneralizableElement';
  ELEM_CLASSIFIER = 'UMLClassifier';
  ELEM_MODEL_ELEMENT = 'UMLModelElement';
  ELEM_ENUMERATION = 'UMLEnumeration';  

  ELEM_TYPE_PACKAGE = 1; // UMLProject, UMLModel, UMLSubsystem, UMLPackage
  ELEM_TYPE_CLASS = 2;   // UMLClass, UMLInterface
  ELEM_TYPE_ELSE = 3;    // Else

  // File
  JAVA_FILE_EXT = '.java';
  // Images index
  IMG_INDEX_WAITING = 0;
  IMG_INDEX_ONPARSING = 1;
  IMG_INDEX_ONGENERATING = 1;
  IMG_INDEX_COMPLETE = 2;
  IMG_INDEX_ERROR = 3;

  // XML
  NODE_BODY = 'BODY';
  NODE_FRAMEWORKS = 'FRAMEWORKMODELS';
  NODE_UNIT = 'UNIT';

  AUTO_IMPORTS: array[0..2] of string = ('java.*', 'java.lang.*', 'java.io.*');
  MSG_TRANS_ABORT = 'Translating aborted';

  // Error messages
  ERR_DIALOG_NOT_INITIALIZED = 'Dialog is not initialized.';
  ERR_CODE_GEN_NOT_INITIALIZED = 'Code generator is not initialized';

implementation

end.
