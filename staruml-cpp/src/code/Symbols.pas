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
  // Profile
  PROFILE_STANDARD = 'UMLStandard';
  PROFILE_CPP = 'Cpp';
  STEREOTYPE_CPP_DELEGATE = 'CppDelegate';
  STEREOTYPE_CPP_FRIEND = 'CppFriend';
  STEREOTYPE_CPP_MACRO = 'CppMacro';
  STEREOTYPE_CPP_OPERATOR = 'CppOperator';
  STEREOTYPE_CPP_STRUCT = 'CppStruct';
  STEREOTYPE_CPP_SYNONYM = 'CppSynonym';
  STEREOTYPE_CPP_TYPEDEF = 'CppTypedef';
  STEREOTYPE_CPP_UNION = 'CppUnion';
  STEREOTYPE_CREATE = 'create';
  STEREOTYPE_DESTROY = 'destroy';
  TAGSET_CPP_BIT_FIELD = 'CppBitField';
  TAGSET_CPP_CONST = 'CppConst';
  TAGSET_CPP_ENUM_LITERAL = 'CppEnumLiteral';
  TAGSET_CPP_MEMBER_DATA = 'CppMemberData';
  TAGSET_CPP_MEMBER_FUNCTION = 'CppMemberFunction';
  TAGSET_CPP_POINTER = 'CppPointer';
  TAGSET_CPP_STATIC = 'CppStatic';
  TAGSET_CPP_TYPEDEF = 'CppTypedef';
  TAGSET_CPP_VIRTUAL = 'CppVirtual';
  TAGSET_VCPP_BASED = 'VCppBased';
  TAGSET_VCPP_DECLSPEC = 'VCppDeclspec';
  TAGSET_VCPP_EVENT = 'VCppEvent';
  TAGSET_VCPP_GC = 'VCppGc';
  TAGSET_VCPP_MEMBER_FUNCTION = 'VCppMemberFunction';
  TAGSET_VCPP_VALUE = 'VCppValue';
  TAGSET_VCPP_W64 = 'VCppW64';
  TAG_CPP___BASED = 'Cpp__Based';
  TAG_CPP___CDECL = 'Cpp__Cdecl';
  TAG_CPP___DECLSPEC = 'Cpp__Declspec';
  TAG_CPP___EVENT = 'Cpp__Event';
  TAG_CPP___FASTCALL = 'Cpp__Fastcall';
  TAG_CPP___GC = 'Cpp__Gc';
  TAG_CPP___INLINE = 'Cpp__Inline';
  TAG_CPP___FORCE_INLINE = 'Cpp__ForceInline';
  TAG_CPP___NOGC = 'Cpp__Nogc';
  TAG_CPP___PROPERTY = 'Cpp__Property';
  TAG_CPP___STDCALL = 'Cpp__Stdcall';
  TAG_CPP___VALUE = 'Cpp__Value';
  TAG_CPP___W64 = 'Cpp__W64';
  TAG_CPP_BIT_FIELD = 'CppBitField';
  TAG_CPP_CONST = 'CppConst';
  TAG_CPP_ENUM_LITERAL_VALUE = 'CppEnumLiteralValue';
  TAG_CPP_FUNCTION_TEMPLATE = 'CppFunctionTemplate';
  TAG_CPP_INLINE = 'CppInline';
  TAG_CPP_MUTABLE = 'CppMutable';
  TAG_CPP_POINTER = 'CppPointer';
  TAG_CPP_STATIC = 'CppStatic';
  TAG_CPP_THROW = 'CppThrow';
  TAG_CPP_TYPEDEF_DEFINITION = 'CppTypedefDefinition';
  TAG_CPP_TYPEDEF_POINTER = 'CppTypedefPointer';
  TAG_CPP_VIRTUAL = 'CppVirtual';
  TAG_CPP_VOLATILE = 'CppVolatile';

  // UML model elements
  ELEM_CLASS = 'UMLClass';
  ELEM_CLASSIFIER = 'UMLClassifier';
  ELEM_ENUMERATION = 'UMLEnumeration';
  ELEM_INTERFACE = 'UMLInterface';
  ELEM_MODEL = 'UMLModel';
  ELEM_MODEL_ELEMENT = 'UMLModelElement';
  ELEM_NAMESPACE = 'UMLNamespace';
  ELEM_PACKAGE = 'UMLPackage';
  ELEM_PROJECT = 'UMLProject';
  ELEM_REALIZATION = 'UMLRealization';
  ELEM_SUBSYSTEM = 'UMLSubsystem';

  // UML view elements
  ELEM_ASSOCIATION_VIEW = 'UMLAssociationView';
  ELEM_CLASS_VIEW = 'UMLClassView';
  ELEM_CLASSIFIER_VIEW = 'UMLClassifierView';
  ELEM_DEPENDENCY_VIEW = 'UMLDependencyView';
  ELEM_ENUMERATION_VIEW = 'UMLEnumerationView';


  // UML predefined types
  TYPE_INTEGER = 'Integer';
  TYPE_BOOLEAN = 'Boolean';
  TYPE_REAL = 'Real';
  TYPE_STRING = 'String';
  TYPE_PACKAGE = 'Package';
  TYPE_CLASS = 'Class';
  TYPE_INTERFACE = 'Interface';
  TYPE_TYPE = 'Type';

  // XML
  NODE_BODY = 'BODY';
  NODE_FRAMEWORKS = 'FRAMEWORKMODELS';
  NODE_UNIT = 'UNIT';

  // Programmar Node Names
  PGMR_NODE_ACCESS_DECL = 'access_decl';
  PGMR_NODE_ACCESS_SPEC = 'access_spec';
  PGMR_NODE_ARG_DECL = 'arg_decl';
  PGMR_NODE_ARG_DECL_LIST = 'arg_decl_list';
  PGMR_NODE_ARG_LIST = 'arg_list';
  PGMR_NODE_BASED_SPECIFIER = 'based_specifier';
  PGMR_NODE_BASIC_TYPE = 'basic_type';
  PGMR_NODE_BIT_OFFSET = 'bit_offset';
  PGMR_NODE_CLASS_DEFINITION = 'class_definition';
  PGMR_NODE_CLASS_KEY = 'class_key';
  PGMR_NODE_CLASS_NAME = 'class_name';
  PGMR_NODE_CLASS_SCOPE_DECL = 'class_scope_decl';
  PGMR_NODE_CLASS_SCOPE_DECL_LIST = 'class_scope_decl_list';
  PGMR_NODE_CLASS_SPEC = 'class_spec';
  PGMR_NODE_CONST_SPEC = 'const_spec';
  PGMR_NODE_DECLARATOR = 'declarator';
  PGMR_NODE_DECLARATOR_EXT = 'declarator_ext';
  PGMR_NODE_DECLARATOR_EXT_BODY = 'declarator_ext_body';
  PGMR_NODE_DECLARATOR_EXT_HEADER = 'declarator_ext_header';
  PGMR_NODE_DECLARATOR_NAME = 'declarator_name';
  PGMR_NODE_DECL_ATTR = 'decl_attr';
  PGMR_NODE_DECL_ATTR_LIST = 'decl_attr_list';
  PGMR_NODE_DECL_ITEM = 'decl_item';
  PGMR_NODE_DECL_ITEM_LIST = 'decl_item_list';
  PGMR_NODE_ELLIPSES = 'ellipses';
  PGMR_NODE_DECLSPEC_SPECIFIER = 'declspec_specifier';
  PGMR_NODE_DESTRUCTOR_TAG = 'destructor_tag';
  PGMR_NODE_ENUM_ENTRY = 'enum_entry';
  PGMR_NODE_ENUM_LIST = 'enum_list';
  PGMR_NODE_ENUM_NAME = 'enum_name';
  PGMR_NODE_ENUM_REFERENCE = 'enum_reference';
  PGMR_NODE_ENUM_SPEC = 'enum_spec';
  PGMR_NODE_EXPRESSION = 'expression';
  PGMR_NODE_FCT_SPECIFIER = 'fct_specifier';
  PGMR_NODE_FRIEND_DECL = 'friend_decl';
  PGMR_NODE_FILE_SCOPE_DECL = 'file_scope_decl';
  PGMR_NODE_IDENT = 'ident';
  PGMR_NODE_ITEM_ATTR_LIST = 'item_attr_list';
  PGMR_NODE_INHERITANCE_SPEC_LIST = 'inheritance_spec_list';
  PGMR_NODE_INHERITANCE_SPEC = 'inheritance_spec';
  PGMR_NODE_INITIALIZER = 'initializer';
  PGMR_NODE_INITIALIZER_LIST = 'initializer_list';
  PGMR_NODE_LINED_MACRO_USING = 'lined_macro_using';
  PGMR_NODE_MACRO_NAME = 'macro_name';
  PGMR_NODE_MACRO_PARAMETER = 'macro_parameter';
  PGMR_NODE_MACRO_PARAMETERS = 'macro_parameters';
  PGMR_NODE_MACRO_USING = 'macro_using';
  PGMR_NODE_MACRO_USING_LIST = 'macro_using_list';  
  PGMR_NODE_METHOD_STUFF = 'method_stuff';
  PGMR_NODE_NAMESPACE_ALIAS = 'namespace_alias';
  PGMR_NODE_NAMESPACE_ALIAS_DEF = 'namespace_alias_def';
  PGMR_NODE_NAMESPACE_BODY = 'namespace_body';
  PGMR_NODE_NAMESPACE_DEF = 'namespace_def';
  PGMR_NODE_NAMESPACE_NAME = 'namespace_name';
  PGMR_NODE_OPERATOR_NAME = 'operator_name';
  PGMR_NODE_PROGRAM = 'program';
  PGMR_NODE_PURE_VIRTUAL = 'pure_virtual';
  PGMR_NODE_RECOVER_IN_CLASS_SCOPE_DECL = 'RECOVER_IN_CLASS_SCOPE_DECL';
  PGMR_NODE_RECOVER_IN_FILE_SCOPE_DECL = 'RECOVER_IN_FILE_SCOPE_DECL';
  PGMR_NODE_SCOPED_CLASS_NAME = 'scoped_class_name';
  PGMR_NODE_SCOPED_NAME = 'scoped_name';
  PGMR_NODE_SIMPLE_EXPRESSION = 'simple_expression';
  PGMR_NODE_STORAGE_CLASS_SPEC = 'storage_class_spec';
  PGMR_NODE_TEMPLATE_DECL_ARG = 'template_decl_arg';
  PGMR_NODE_TEMPLATE_DECL_ARG_LIST = 'template_decl_arg_list';
  PGMR_NODE_TEMPLATE_INITIALIZER = 'template_initializer';
  PGMR_NODE_TEMPLATE_SPEC = 'template_spec';
  PGMR_NODE_TEMPLATE_TYPEDEF_ARG = 'template_typedef_arg';
  PGMR_NODE_TEMPLATE_TYPEDEF_KEY = 'template_typedef_key';
  PGMR_NODE_TEMPLATE_TYPESPEC_ARG = 'teplate_typespec_arg';
  PGMR_NODE_TEMPLATE_VARDECL_ARG = 'template_vardecl_arg';
  PGMR_NODE_THROW_DECL = 'throw_decl';
  PGMR_NODE_TYPE_NAME = 'type_name';
  PGMR_NODE_TYPE_SPEC = 'type_spec';
  PGMR_NODE_TYPEDEF_TAG = 'typedef_tag';
  PGMR_NODE_TYPENAME_EXPR = 'typename_expr';
  PGMR_NODE_USING_DECL = 'using_decl';
  PGMR_NODE_USING_DIRECTIVE = 'using_directive';
  PGMR_NODE_UUIDOF_EXPR = 'uuidof_expr';
  PGMR_NODE_VIRTUAL_SPEC = 'virtual_spec';

  // Token (ClassKey / TemplateTypeDefKey)
  PGMR_TOKEN_CLASS = 'class';
  PGMR_TOKEN_INTERFACE = 'interface';
  PGMR_TOKEN__INTERFACE = '_interface';
  PGMR_TOKEN___INTERFACE = '__interface';
  PGMR_TOKEN_STRUCT = 'struct';
  PGMR_TOKEN_UNION = 'union';
  PGMR_TOKEN_TYPENAME = 'typename';

  // Token (Access Specifier)
  PGMR_TOKEN_PUBLIC = 'public';
  PGMR_TOKEN_PROTECTED = 'protected';
  PGMR_TOKEN_PRIVATE = 'private';

  // Token (Declaration Attribute)
  PGMR_TOKEN___ABSTRACT = '__abstract';
  PGMR_TOKEN___CDECL = '__cdecl';
  PGMR_TOKEN___DELEGATE = '__delegate';
  PGMR_TOKEN___EVENT = '__event';
  PGMR_TOKEN___EXPORT = '__export';
  PGMR_TOKEN___FASTCALL = '__fastcall';
  PGMR_TOKEN___FORCEINLINE = '__forceinline';
  PGMR_TOKEN___GC = '__gc';
  PGMR_TOKEN___NOGC = '__nogc';
  PGMR_TOKEN___INLINE = '__inline';
  PGMR_TOKEN___PIN = '__pin';
  PGMR_TOKEN___PROPERTY = '__property';
  PGMR_TOKEN___SEALED = '__sealed';
  PGMR_TOKEN___STDCALL = '__stdcall';
  PGMR_TOKEN___VALUE = '__value';
  PGMR_TOKEN__CDECL = '_cdecl';
  PGMR_TOKEN__EXPORT = '_export';
  PGMR_TOKEN__FASTCALL = '_fastcall';
  PGMR_TOKEN__INLINE = '_inline';
  PGMR_TOKEN__STDCALL = '_stdcall';
  PGMR_TOKEN_AUTO = 'auto';
  PGMR_TOKEN_CONST = 'const';
  PGMR_TOKEN_EXPLICIT = 'explicit';
  PGMR_TOKEN_EXTERN = 'extern';
  PGMR_TOKEN_FRIEND = 'friend';
  PGMR_TOKEN_INLINE = 'inline';
  PGMR_TOKEN_MUTABLE = 'mutable';
  PGMR_TOKEN_REGISTER = 'register';
  PGMR_TOKEN_STATIC = 'static';
  PGMR_TOKEN_VIRTUAL = 'virtual';
  PGMR_TOKEN_VOLATILE = 'volatile';

  // Programmar Search Patterns
  PGMR_PATH_FS_NAMESPACE_DEF = PGMR_NODE_FILE_SCOPE_DECL + '.' + PGMR_NODE_NAMESPACE_DEF;
  PGMR_PATH_ENUM_ENTRY = PGMR_NODE_ENUM_LIST + '.' + PGMR_NODE_ENUM_ENTRY;
  PGMR_PATH_CLASS_SCOPE_DECL = PGMR_NODE_CLASS_DEFINITION + '.' + PGMR_NODE_CLASS_SCOPE_DECL;
  PGMR_PATH_DECL_ITEM = PGMR_NODE_DECL_ITEM_LIST + '.' + PGMR_NODE_DECL_ITEM;
  PGMR_PATH_ARG_DECL = PGMR_NODE_ARG_DECL_LIST + '.' + PGMR_NODE_ARG_DECL;

  PGMR_PATH_BASED_EXPRESSION = PGMR_NODE_DECL_ATTR + '.' + PGMR_NODE_BASED_SPECIFIER + '.' + PGMR_NODE_SIMPLE_EXPRESSION;
  PGMR_PATH_DECEXT_CLASS_SPEC = PGMR_NODE_DECLARATOR_EXT_BODY + '.' + PGMR_NODE_CLASS_SPEC;
  PGMR_PATH_DECEXT_ENUM_SPEC = PGMR_NODE_DECLARATOR_EXT_BODY + '.' + PGMR_NODE_ENUM_SPEC;
  PGMR_PATH_DECLARATOR_SCOPED_NAME = PGMR_NODE_DECLARATOR_NAME + '.' + PGMR_NODE_SCOPED_NAME;
  PGMR_PATH_DECLARATOR_SIMPLE_NAME = PGMR_PATH_DECLARATOR_SCOPED_NAME + '.' + PGMR_NODE_CLASS_NAME;
  PGMR_PATH_DECLSPEC_SPECIFIER = PGMR_NODE_DECL_ATTR + '.' + PGMR_NODE_DECLSPEC_SPECIFIER;
  PGMR_PATH_DECLSPEC_EXPRESSION = PGMR_NODE_DECLSPEC_SPECIFIER + '.' + PGMR_NODE_SIMPLE_EXPRESSION;
  PGMR_PATH_ENUM_REF_NAME = PGMR_NODE_ENUM_REFERENCE + '.' + PGMR_NODE_ENUM_NAME;
  PGMR_PATH_FCT_DECLSPEC_SPECIFIER = PGMR_NODE_DECL_ATTR + '.' + PGMR_NODE_FCT_SPECIFIER + '.' + PGMR_NODE_DECLSPEC_SPECIFIER;
  PGMR_PATH_MACRO_PARAMETER = PGMR_NODE_MACRO_PARAMETERS + '.' + PGMR_NODE_MACRO_PARAMETER;
  PGMR_PATH_MACRO_SCOPED_NAME = PGMR_NODE_MACRO_USING_LIST + '.' + PGMR_NODE_MACRO_USING + '.' + PGMR_NODE_SCOPED_NAME;
  PGMR_PATH_INHEIRANCE_SPEC = PGMR_NODE_INHERITANCE_SPEC_LIST + '.' + PGMR_NODE_INHERITANCE_SPEC;
  PGMR_PATH_INITIALIZER_ARG_LIST = PGMR_NODE_INITIALIZER + '.' + PGMR_NODE_ARG_LIST;
  PGMR_PATH_INITIALIZER_EXPR = PGMR_NODE_INITIALIZER + '.' + PGMR_NODE_EXPRESSION;
  PGMR_PATH_INITIALIZER_LIST = PGMR_NODE_INITIALIZER + '.' + PGMR_NODE_INITIALIZER_LIST;
  PGMR_PATH_SCOPED_CLASS_NAME_CLASS_NAME = PGMR_NODE_SCOPED_CLASS_NAME + '.' + PGMR_NODE_CLASS_NAME;
  PGMR_PATH_TEMPLATE_DECL_ARG = PGMR_NODE_TEMPLATE_DECL_ARG_LIST + '.' + PGMR_NODE_TEMPLATE_DECL_ARG;
  PGMR_PATH_THROW_ARG_DECL_LIST = PGMR_NODE_THROW_DECL + '.' + PGMR_NODE_ARG_DECL_LIST;
  PGMR_PATH_TYPENAME_EXPR_NAME = PGMR_NODE_TYPENAME_EXPR + '.' + PGMR_NODE_SCOPED_NAME;

  OPTION_SCHEMA_CPP = 'StarUML.Cpp';
  // Option Item Names(for CodeGen)
  OPT_BODY_FILE_EXT = 'BODY_FILE_EXT';
  OPT_BODY_SUB_DIRECTORY = 'BODY_SUB_DIRECTORY';
  OPT_BRACE_PUT_NEWLINE = 'BRACE_PUT_NEWLINE';
  OPT_CREATE_WITH_NO_PROFILE = 'CREATE_WITH_NO_PROFILE';
  OPT_DEFAULT_HEADER_INCLUDE = 'DEFAULT_HEADER_INCLUDE';
  OPT_DEFAULT_BODY_INCLUDE = 'DEFAULT_BODY_INCLUDE';
  OPT_FILE_NAME_FORMAT = 'FILE_NAME_FORMAT';
  OPT_HEADER_COMMENT = 'HEADER_COMMENT';
  OPT_HEADER_FILE_EXT = 'HEADER_FILE_EXT';
  OPT_HEADER_SUB_DIRECTORY = 'HEADER_SUB_DIRECTORY';
  OPT_MANAGED_CPP = 'MANAGED_CPP';
  OPT_GENERATE_COMMENT = 'GENERATE_COMMENT';
  OPT_MEMBER_ORDER = 'MEMBER_ORDER';
  OPT_MS_SPECIFIC = 'MS_SPECIFIC';
  OPT_NAMESPACE_AS_SUB_DIRECTORY = 'NAMESPACE_AS_SUB_DIRECTORY';
  OPT_PACKAGE_AS_NAMESPACE = 'PACKAGE_AS_NAMESPACE';
  OPT_SPACE_MAGNITUDE = 'SPACE_MAGNITUDE';
  OPT_USE_SPACE = 'USE_SPACE';
  // Option Item Names(for Reverse)
  OPT_CREATE_PUBLIC_MEMBER = 'CREATE_PUBLIC_MEMBER';
  OPT_CREATE_PROTECTED_MEMBER = 'CREATE_PROTECTED_MEMBER';
  OPT_CREATE_PRIVATE_MEMBER = 'CREATE_PRIVATE_MEMBER';
  OPT_OMIT_INITIAL_VALUE = 'OMIT_INITIAL_VALUE';
  OPT_FIELD_AS_ASSOC = 'FIELD_AS_ASSOC';
  OPT_CREATE_OVERVIEW = 'CREATE_OVERVIEW';
  OPT_DIGRAM_NAME = 'DIGRAM_NAME';
  OPT_SUPRESS_ATTR = 'SUPRESS_ATTR';
  OPT_SUPRESS_OPER = 'SUPRESS_OPER';
  OPT_HIDE_OPER_SIGNATURE = 'HIDE_OPER_SIGNATURE';
  OPT_INHERITANCE_ONLY = 'INHERITANCE_ONLY';

  // Images index
  IMG_INDEX_WAITING = 0;
  IMG_INDEX_ONPARSING = 1;
  IMG_INDEX_ONGENERATING = 1;
  IMG_INDEX_COMPLETE = 2;
  IMG_INDEX_ERROR = 3;

  // etc
  CPP_GRAMMAR_FILE_NAME = 'cpp.gmr';
  PP_GRAMMAR_FILE_NAME = 'Preprocess.gmr';
  CPP_GRAMMAR_FILE_LOCATION = 'modules\staruml-cpp';
  PGMR_ERR_STARTPOS = 'StartPos';
  PGMR_ERR_NUMCHAR = 'NumChars';
  PGMR_NODE_NOT_EXISTS = 0;
  C_ERR_FILE_NOT_FOUND = ' file not found.';

  // Programmar Parsing Error Severity
  PGMR_ERR_SEV_FATAL = 0;
  PGMR_ERR_SEV_SEVERE = 1;
  PGMR_ERR_SEV_UNRECOVERABLE = 2;
  PGMR_ERR_SEV_RECOVERABLE = 3;

  // Internal Error Messages
  ERR_CB_NOT_INITIALIZED = 'CodeModelBuilder component is not initialized.';
  ERR_MT_NOT_INITIALIZED = 'ModelTranslator component is not initialized.';
  ERR_DC_NOT_INITIALIZED = 'DiagramCreator component is not initialized.';
  ERR_RV_NOT_INITIALIZED = 'Reverse engine is not initialized.';
  ERR_DIALOG_NOT_INITIALIZED = 'Dialog is not initialized.';
  ERR_INVALID_ROW = 'Invalid text row.';
  ERR_INVALID_COLUMN = 'Invalid text column.';
  ERR_FILE_NOT_FOUND = 'File not found.';
  ERR_UNEXPECTED_NODE = '"%s" is unexpected node.' + #13 + 'Node "%s" expected';
  ERR_UNEXPECTED_NODE2 = '"%s" is unexptected node.';
  ERR_INVALID_NODE_STRUCTURE = 'Invalid node structure.';
  ERR_MODEL_TRANSLATION_CANCED = 'Model translation is canceled.';

implementation

end.
