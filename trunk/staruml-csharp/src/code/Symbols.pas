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

uses
  Windows;

const
  // Internal error messages
  ERR_DIALOG_NOT_INITIALIZED = 'Dialog is not initialized.';

  // UML elements
  ELEM_PROJECT = 'UMLProject';
  ELEM_MODEL = 'UMLModel';
  ELEM_SUBSYSTEM = 'UMLSubsystem';
  ELEM_PACKAGE = 'UMLPackage';
  ELEM_COMPONENT = 'UMLComponent';
  ELEM_CLASS = 'UMLClass';
  ELEM_INTERFACE = 'UMLInterface';
  ELEM_NAMESPACE = 'UMLNamespace';
  ELEM_REALIZATION = 'UMLRealization';
  ELEM_MODEL_ELEMENT ='UMLModelElement';
  ELEM_ENUMERATION = 'UMLEnumeration';
  ELEM_OPERATION = 'UMLOperation';
  ELEM_FEATURE = 'UMLFeature';
  ELEM_ASSOCIATIONEND = 'UMLAssociationEnd';
  ELEM_ATTRIBUTE = 'UMLAttribute';
  ELEM_CLASSIFIER = 'UMLClassifier';

  // Profile
  CSHARP_PROFILE_NAME = 'CSharp';
  PROFILE_STANDARD = 'UMLStandard';

  STEREOTYPE_CSHARP_STRUCT = 'CSharpStruct';
  STEREOTYPE_CSHARP_DELEGATE = 'CSharpDelegate';
  STEREOTYPE_CSHARP_OPERATOR = 'CSharpOperator';
  STEREOTYPE_CSHARP_INDEXER = 'CSharpIndexer';
  STEREOTYPE_CSHARP_PROPERTY = 'CSharpProperty';
  STEREOTYPE_CSHARP_EVENT = 'CSharpEvent';
  STEREOTYPE_UMLSTD_IMPORT = 'import';
  STEREOTYPE_UMLSTD_CREATE = 'create';
  STEREOTYPE_UMLSTD_DESTROY = 'destroy';

  TAGSET_CSHARP_OPERATION = 'CSharpOperation';
  TAGSET_CSHARP_EXTEND = 'CSharpExtend';
  TAGSET_CSHARP_FIELD = 'CSharpField';
  TAGSET_CSHARP_ENUM = 'CSharpEnumeration';
  TAGSET_CSHARP_ENUM_LITERAL = 'CSharpEnumerationLiteral';
  TAGSET_CSHARP_CLASS_MEMBER = 'CSharpClassMember';
  TAGSET_CSHARP_DIMENSION = 'CSharpDimension';
  TAGSET_CSHARP_PARAMETER = 'CSharpParameter';

  TAG_CSHARP_VIRTUAL = 'CSharpVirtual';
  TAG_CSHARP_EXTERN = 'CSharpExtern';
  TAG_CSHARP_OVERRIDE = 'CSharpOverride';
  TAG_CSHARP_CONST = 'CSharpConst';
  TAG_CSHARP_VOLATILE = 'CSharpVolatile';
  TAG_CSHARP_ENUM_BASETYPE = 'CSharpBasetype';
  TAG_CSHARP_ENUM_LITERAL_VALUE = 'CShapEnumLiteralValue';
  TAG_CSHARP_INTERNAL = 'CSharpInternal';
  TAG_CSHARP_NEW = 'CSharpNew';
  TAG_CSHARP_UNSAFE = 'CSharpUnsafe';
  TAG_CSHARP_DIMENSION = 'CSharpDimension';
  TAG_CSHARP_GET = 'CSharpGetter';
  TAG_CSHARP_SET = 'CSharpSetter';
  TAG_CSHARP_ADD = 'CSharpAdd';
  TAG_CSHARP_REMOVE = 'CSharpRemove';
  TAG_CSHARP_CONSTRUCTOR_INITVALUE = 'CSharpConstructorInitializer';
  TAG_CSHARP_EXPLICIT = 'CSharpExplicit';
  TAG_CSHARP_IMPLICIT = 'CSharpImplicit';
  TAG_CSHARP_STATIC = 'CSharpStatic';
  TAG_CSHARP_PARAMS = 'CSharpParams';

  // Option
  OPTION_SCHEMA = 'StarUML.CSharp';
  OPTION_CREATE_WITH_NO_PROFILE = 'CREATE_WITH_NO_PROFILE';
  OPTION_CREATE_FILE_MEMBER = 'CREATE_FILE_MEMBER';
  OPTION_CREATE_EMPTY_ASSOC_END = 'CREATE_EMPTY_ASSOC_END';
  OPTION_CREATE_CSHARP_DOC = 'CREATE_CSHARP_DOC';
  OPTION_CREATE_CSHARP_DOC_EMPTY = 'CREATE_CSHARP_DOC_EMPTY';
  OPTION_BRACE_PUT_NEWLINE = 'BRACE_PUT_NEWLINE';
  OPTION_SPACE_INSTEAD_TAB = 'SPACE_INSTEAD_TAB';
  OPTION_SPACE_MAGNITUDE = 'SPACE_MAGNITUDE';
  OPTION_HEADER_COMMENT = 'HEADER_COMMENT';

  OPTION_REVERSE_CSHARPDOC = 'REVERSE_CSHARPDOC';
  OPTION_OMIT_INITIAL_VALUE = 'OMIT_INITIAL_VALUE';
  OPTION_CREATE_PUBLIC_MEMBER = 'CREATE_PUBLIC_MEMBER';
  OPTION_CREATE_INTERNAL_MEMBER = 'CREATE_INTERNAL_MEMBER';
  OPTION_CREATE_PROTECTED_MEMBER = 'CREATE_PROTECTED_MEMBER';
  OPTION_CREATE_PRIVATE_MEMBER = 'CREATE_PRIVATE_MEMBER';
  OPTION_FIELD_AS_ASSOC = 'FIELD_AS_ASSOC';
  OPTION_CREATE_OVERVIEW = 'CREATE_OVERVIEW';
  OPTION_DIGRAM_NAME = 'DIGRAM_NAME';
  OPTION_SUPRESS_ATTR = 'SUPRESS_ATTR';
  OPTION_SUPRESS_OPER = 'SUPRESS_OPER';
  OPTION_HIDE_OPER_SIGNATURE = 'HIDE_OPER_SIGNATURE';
  OPTION_INHERITANCE_ONLY = 'INHERITANCE_ONLY';

  // XML
  NODE_BODY = 'BODY';
  NODE_FRAMEWORKS = 'FRAMEWORKMODELS';
  NODE_UNIT = 'UNIT';

  // Programmar Node Names
  PGMR_NODE_USING_DIRECTIVE         = 'using_directive';
  PGMR_NODE_NAMESPACE_DECLARATION   = 'namespace_declaration';
  PGMR_NODE_TYPE_DECLARATION        = 'type_declaration';

  //PGMR_NODE_USING_DIRECTIVE
  PGMR_NODE_USING_ALIAS_DIRECTIVE     = 'using_alias_directive';
  PGMR_NODE_USING_NAMESPACE_DIRECTIVE = 'using_namespace_directive';

  // type_declaration
  PGMR_NODE_CLASS_DECLARATION       = 'class_declaration';
  PGMR_NODE_STRUCT_DECLARATION      = 'struct_declaration';
  PGMR_NODE_INTERFACE_DECLARATION   = 'interface_declaration';
  PGMR_NODE_ENUM_DECLARATION        = 'enum_declaration';
  PGMR_NODE_DELEGATE_DECLARATION    = 'delegate_declaration';

  // class_member_declaration
  PGMR_NODE_CONSTANT_DECLARATION              = 'constant_declaration';
  PGMR_NODE_FIELD_DECLARATION                 = 'field_declaration';
  PGMR_NODE_METHOD_DECLARATION                = 'method_declaration';
  PGMR_NODE_PROPERTY_DECLARATION              = 'property_declaration';
  PGMR_NODE_EVENT_DECLARATION                 = 'event_declaration';
  PGMR_NODE_INDEXER_DECLARATION               = 'indexer_declaration';
  PGMR_NODE_OPERATOR_DECLARATION              = 'operator_declaration';
  PGMR_NODE_CONSTRUCTOR_DECLARATION           = 'constructor_declaration';
  PGMR_NODE_DESTRUCTOR_DECLARATION            = 'destructor_declaration';
  PGMR_NODE_STATIC_CONSTRUCTOR_DECLARATION    = 'static_constructor_declaration';

  //interface_member_declaration
  PGMR_NODE_INTERFACE_METHOD_DECLARATION      = 'interface_method_declaration';
  PGMR_NODE_INTERFACE_PROPERTY_DECLARATION    = 'interface_property_declaration';
  PGMR_NODE_INTERFACE_EVENT_DECLARATION       = 'interface_event_declaration';
  PGMR_NODE_INTERFACE_INDEXER_DECLARATION     = 'interface_indexer_declaration';
  PGMR_NODE_BLOCK_COMMENT                     = 'block_comment';
  PGMR_NODE_LINE_COMMENT                      = 'line_comment';
  PGMR_NODE_DISREGARDED_SYMBOL                = 'disregarded_symbol';

  // etc
  CSHARP_GRAMMAR_FILE_NAME = 'CS.GMR';
  CSHARP_GRAMMAR_FILE_LOCATION = 'modules\staruml-csharp';
  CSHARP_FILE_EXT = '.cs';
  CSHARP_INDEXER_NAME = 'this';
  CSHARP_DOC_BEGIN = '<summary>';
  CSHARP_DOC_END = '</summary>';
  PGMR_ERR_STARTPOS = 'StartPos';
  PGMR_ERR_NUMCHAR = 'NumChars';
  PGMR_NODE_NOT_EXISTS = 0;
  C_ERR_FILE_NOT_FOUND = ' file not found.';

  // Images index
  IMG_INDEX_WAITING = 0;
  IMG_INDEX_ONPARSING = 1;
  IMG_INDEX_ONGENERATING = 1;
  IMG_INDEX_COMPLETE = 2;
  IMG_INDEX_ERROR = 3;

  // Log Messages
  // => NLS Âü°í

  TXT_CODE_GEN_NIL_CSHARPDOC = '/// <summary></summary>';
  TXT_CODE_GEN_CSHARPDOC_BEGIN = '/// <summary>';
  TXT_CODE_GEN_CSHARPDOC_END = '/// </summary>';

implementation

end.
