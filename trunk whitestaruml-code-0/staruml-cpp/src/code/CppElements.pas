unit CppElements;

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
  Classes, Types;

type
	// Forward declarations
	PCppElement = class;
	PCppNamespace = class;
	PCppMember = class;
	PCppType = class;
	PCppClassType = class;
	PCppEnumeration = class;
	PCppDataMember = class;
	PCppFunctionMember = class;
	PCppTypeDef = class;
	PCppUsingDeclaration = class;
	PCppBase = class;
	PCppTemplate = class;
	PCppAbstractParameter = class;
	PCppParameter = class;
	PCppTypeParameter = class;
	PCppEnumerationItem = class;
	PCppNamespaceAlias = class;
	PCppGlobalDelegateFunction = class;
	PCppFriendClass = class;

	// Enumerations
	PCppAccessSpecifierKind = (akNotDefined, akPrivate, akProtected, akPublic);
	PCppClassKeyKind = (ckClass, ckStruct, ckUnion, ckInterface);
	PCppTypeParameterKind = (tkClass, tkTypeName);
	PCppCallingConventionKind = (ckNotDefined, ckCdecl, ckStdcall, ckFastcall);

  // PVisitor
  PVisitor = class
  public
    procedure Visit(Element: PCppElement); virtual; abstract;
  end;

	// PCppElement
	PCppElement = class
  private
		{ Member Fields }
		FName: string;
		FLine: Integer;
		FOffset: Integer;
		FLength: Integer;
		{ Getter/Setter }
		procedure SetName(Value: string);
		procedure SetLine(Value: Integer);
		procedure SetOffset(Value: Integer);
		procedure SetLength(Value: Integer);
  public
		{ Constructor/Destructor }
		constructor Create; virtual;
		destructor Destroy; override;
		procedure Accept(Visitor: PVisitor); virtual;
		{ Properties }
		property Name: string read FName write SetName;
		property Line: Integer read FLine write SetLine;
		property Offset: Integer read FOffset write SetOffset;
		property Length: Integer read FLength write SetLength;
  end;

	// PCppNamespace
	PCppNamespace = class(PCppElement)
  private
		{ Member Fields }
		FIsUnnamed: Boolean;
		FTypes: TList;
		FParent: PCppNamespace;
		FChildren: TList;
		FUsingDeclarations: TList;
		FTypeDefs: TList;
		FNamespaceAliases: TList;
		FDelegateFunctions: TList;
		{ Getter/Setter }
		procedure SetIsUnnamed(Value: Boolean);
		function GetTypeCount: Integer;
		function GetType(Index: Integer): PCppType;
		procedure SetParent(Value: PCppNamespace);
		function GetChildCount: Integer;
		function GetChild(Index: Integer): PCppNamespace;
		function GetUsingDeclarationCount: Integer;
		function GetUsingDeclaration(Index: Integer): PCppUsingDeclaration;
		function GetTypeDefCount: Integer;
		function GetTypeDef(Index: Integer): PCppTypeDef;
		function GetNamespaceAliasCount: Integer;
		function GetNamespaceAlias(Index: Integer): PCppNamespaceAlias;
		function GetDelegateFunctionCount: Integer;
		function GetDelegateFunction(Index: Integer): PCppGlobalDelegateFunction;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure AddType(Value: PCppType);
		procedure RemoveType(Value: PCppType);
		procedure InsertType(Index: Integer; Value: PCppType);
		procedure DeleteType(Index: Integer);
		procedure AddChild(Value: PCppNamespace);
		procedure RemoveChild(Value: PCppNamespace);
		procedure InsertChild(Index: Integer; Value: PCppNamespace);
		procedure DeleteChild(Index: Integer);
		procedure AddUsingDeclaration(Value: PCppUsingDeclaration);
		procedure RemoveUsingDeclaration(Value: PCppUsingDeclaration);
		procedure InsertUsingDeclaration(Index: Integer; Value: PCppUsingDeclaration);
		procedure DeleteUsingDeclaration(Index: Integer);
		procedure AddTypeDef(Value: PCppTypeDef);
		procedure RemoveTypeDef(Value: PCppTypeDef);
		procedure InsertTypeDef(Index: Integer; Value: PCppTypeDef);
		procedure DeleteTypeDef(Index: Integer);
		procedure AddNamespaceAlias(Value: PCppNamespaceAlias);
		procedure RemoveNamespaceAlias(Value: PCppNamespaceAlias);
		procedure InsertNamespaceAlias(Index: Integer; Value: PCppNamespaceAlias);
		procedure DeleteNamespaceAlias(Index: Integer);
		procedure AddDelegateFunction(Value: PCppGlobalDelegateFunction);
		procedure RemoveDelegateFunction(Value: PCppGlobalDelegateFunction);
		procedure InsertDelegateFunction(Index: Integer; Value: PCppGlobalDelegateFunction);
		procedure DeleteDelegateFunction(Index: Integer);
		procedure Accept(Visitor: PVisitor); override;
		{ Properties }
		property IsUnnamed: Boolean read FIsUnnamed write SetIsUnnamed;
		property TypeCount: Integer read GetTypeCount;
		property Types[Index: Integer]: PCppType read GetType;
		property Parent: PCppNamespace read FParent write SetParent;
		property ChildCount: Integer read GetChildCount;
		property Children[Index: Integer]: PCppNamespace read GetChild;
		property UsingDeclarationCount: Integer read GetUsingDeclarationCount;
		property UsingDeclarations[Index: Integer]: PCppUsingDeclaration read GetUsingDeclaration;
		property TypeDefCount: Integer read GetTypeDefCount;
		property TypeDefs[Index: Integer]: PCppTypeDef read GetTypeDef;
		property NamespaceAliasCount: Integer read GetNamespaceAliasCount;
		property NamespaceAliases[Index: Integer]: PCppNamespaceAlias read GetNamespaceAlias;
		property DelegateFunctionCount: Integer read GetDelegateFunctionCount;
		property DelegateFunctions[Index: Integer]: PCppGlobalDelegateFunction read GetDelegateFunction;
  end;

	// PCppMember
	PCppMember = class(PCppElement)
  private
		{ Member Fields }
		FAccessSpecifier: PCppAccessSpecifierKind;
		FDeclspec: string;
		{ Getter/Setter }
		procedure SetAccessSpecifier(Value: PCppAccessSpecifierKind);
		procedure SetDeclspec(Value: string);
  public
		{ Properties }
		property AccessSpecifier: PCppAccessSpecifierKind read FAccessSpecifier write SetAccessSpecifier;
		property Declspec: string read FDeclspec write SetDeclspec;
  end;

	// PCppType
	PCppType = class(PCppMember)
  private
		{ Member Fields }
		FDeclaredScopes: TStringList;
		FDeclaringNamespace: PCppNamespace;
		FDeclaringType: PCppType;
		FTypes: TList;
		FNamespaceAliases: TList;
		FTypeDefs: TList;
		{ Getter/Setter }
		function GetDeclaredScopeCount: Integer;
		function GetDeclaredScope(Index: Integer): string;
		procedure SetDeclaringNamespace(Value: PCppNamespace);
		procedure SetDeclaringType(Value: PCppType);
		function GetTypeCount: Integer;
		function GetType(Index: Integer): PCppType;
		function GetNamespaceAliasCount: Integer;
		function GetNamespaceAlias(Index: Integer): PCppNamespaceAlias;
		function GetTypeDefCount: Integer;
		function GetTypeDef(Index: Integer): PCppTypeDef;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure AddDeclaredScope(Value: string);
		procedure InsertDeclaredScope(Index: Integer; Value: string);
		procedure DeleteDeclaredScope(Index: Integer);
		procedure AddType(Value: PCppType);
		procedure RemoveType(Value: PCppType);
		procedure InsertType(Index: Integer; Value: PCppType);
		procedure DeleteType(Index: Integer);
		procedure AddNamespaceAlias(Value: PCppNamespaceAlias);
		procedure RemoveNamespaceAlias(Value: PCppNamespaceAlias);
		procedure InsertNamespaceAlias(Index: Integer; Value: PCppNamespaceAlias);
		procedure DeleteNamespaceAlias(Index: Integer);
		procedure AddTypeDef(Value: PCppTypeDef);
		procedure RemoveTypeDef(Value: PCppTypeDef);
		procedure InsertTypeDef(Index: Integer; Value: PCppTypeDef);
		procedure DeleteTypeDef(Index: Integer);
		procedure Accept(Visitor: PVisitor); override;
		{ Properties }
		property DeclaredScopeCount: Integer read GetDeclaredScopeCount;
		property DeclaredScopes[Index: Integer]: string read GetDeclaredScope;
		property DeclaringNamespace: PCppNamespace read FDeclaringNamespace write SetDeclaringNamespace;
		property DeclaringType: PCppType read FDeclaringType write SetDeclaringType;
		property TypeCount: Integer read GetTypeCount;
		property Types[Index: Integer]: PCppType read GetType;
		property NamespaceAliasCount: Integer read GetNamespaceAliasCount;
		property NamespaceAliases[Index: Integer]: PCppNamespaceAlias read GetNamespaceAlias;
		property TypeDefCount: Integer read GetTypeDefCount;
		property TypeDefs[Index: Integer]: PCppTypeDef read GetTypeDef;
  end;

	// PCppClassType
	PCppClassType = class(PCppType)
  private
		{ Member Fields }
		FKey: PCppClassKeyKind;
		FIsAbstract: Boolean;
		FIsGc: Boolean;
		FIsNogc: Boolean;
		FIsSealed: Boolean;
		FIsValue: Boolean;
		FIsEvent: Boolean;
		FBases: TList;
		FDataMembers: TList;
		FFunctionMembers: TList;
		FTemplateDefinition: PCppTemplate;
		FTypeDefs: TList;
		FFriendClasses: TList;
		{ Getter/Setter }
		procedure SetKey(Value: PCppClassKeyKind);
		procedure SetIsAbstract(Value: Boolean);
		procedure SetIsGc(Value: Boolean);
		procedure SetIsNogc(Value: Boolean);
		procedure SetIsSealed(Value: Boolean);
		procedure SetIsValue(Value: Boolean);
		procedure SetIsEvent(Value: Boolean);
		function GetBaseCount: Integer;
		function GetBase(Index: Integer): PCppBase;
		function GetDataMemberCount: Integer;
		function GetDataMember(Index: Integer): PCppDataMember;
		function GetFunctionMemberCount: Integer;
		function GetFunctionMember(Index: Integer): PCppFunctionMember;
		procedure SetTemplateDefinition(Value: PCppTemplate);
		function GetTypeDefCount: Integer;
		function GetTypeDef(Index: Integer): PCppTypeDef;
		function GetFriendClassCount: Integer;
		function GetFriendClass(Index: Integer): PCppFriendClass;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure AddBase(Value: PCppBase);
		procedure RemoveBase(Value: PCppBase);
		procedure InsertBase(Index: Integer; Value: PCppBase);
		procedure DeleteBase(Index: Integer);
		procedure AddDataMember(Value: PCppDataMember);
		procedure RemoveDataMember(Value: PCppDataMember);
		procedure InsertDataMember(Index: Integer; Value: PCppDataMember);
		procedure DeleteDataMember(Index: Integer);
		procedure AddFunctionMember(Value: PCppFunctionMember);
		procedure RemoveFunctionMember(Value: PCppFunctionMember);
		procedure InsertFunctionMember(Index: Integer; Value: PCppFunctionMember);
		procedure DeleteFunctionMember(Index: Integer);
		procedure AddTypeDef(Value: PCppTypeDef);
		procedure RemoveTypeDef(Value: PCppTypeDef);
		procedure InsertTypeDef(Index: Integer; Value: PCppTypeDef);
		procedure DeleteTypeDef(Index: Integer);
		procedure AddFriendClass(Value: PCppFriendClass);
		procedure RemoveFriendClass(Value: PCppFriendClass);
		procedure InsertFriendClass(Index: Integer; Value: PCppFriendClass);
		procedure DeleteFriendClass(Index: Integer);
		procedure Accept(Visitor: PVisitor); override;
		{ Properties }
		property Key: PCppClassKeyKind read FKey write SetKey;
		property IsAbstract: Boolean read FIsAbstract write SetIsAbstract;
		property IsGc: Boolean read FIsGc write SetIsGc;
		property IsNogc: Boolean read FIsNogc write SetIsNogc;
		property IsSealed: Boolean read FIsSealed write SetIsSealed;
		property IsValue: Boolean read FIsValue write SetIsValue;
		property IsEvent: Boolean read FIsEvent write SetIsEvent;
		property BaseCount: Integer read GetBaseCount;
		property Bases[Index: Integer]: PCppBase read GetBase;
		property DataMemberCount: Integer read GetDataMemberCount;
		property DataMembers[Index: Integer]: PCppDataMember read GetDataMember;
		property FunctionMemberCount: Integer read GetFunctionMemberCount;
		property FunctionMembers[Index: Integer]: PCppFunctionMember read GetFunctionMember;
		property TemplateDefinition: PCppTemplate read FTemplateDefinition write SetTemplateDefinition;
		property TypeDefCount: Integer read GetTypeDefCount;
		property TypeDefs[Index: Integer]: PCppTypeDef read GetTypeDef;
		property FriendClassCount: Integer read GetFriendClassCount;
		property FriendClasses[Index: Integer]: PCppFriendClass read GetFriendClass;
  end;

	// PCppEnumeration
	PCppEnumeration = class(PCppType)
  private
		{ Member Fields }
		FItems: TList;
		{ Getter/Setter }
		function GetItemCount: Integer;
		function GetItem(Index: Integer): PCppEnumerationItem;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure AddItem(Value: PCppEnumerationItem);
		procedure RemoveItem(Value: PCppEnumerationItem);
		procedure InsertItem(Index: Integer; Value: PCppEnumerationItem);
		procedure DeleteItem(Index: Integer);
		procedure Accept(Visitor: PVisitor); override;
		{ Properties }
		property ItemCount: Integer read GetItemCount;
		property Items[Index: Integer]: PCppEnumerationItem read GetItem;
  end;

	// PCppDataMember
	PCppDataMember = class(PCppMember)
  private
		{ Member Fields }
		FType_: string;
		FTypePointer: string;
		FIsConst: Boolean;
		FIsStatic: Boolean;
		FIsMutable: Boolean;
		FIsVolatile: Boolean;
		FInitializer: string;
		FBitField: string;
		FIsGc: Boolean;
		FIsNogc: Boolean;
		FIsEvent: Boolean;
		FW64: Boolean;
		FBased: string;
		FDeclaringClassType: PCppClassType;
		{ Getter/Setter }
		procedure SetType_(Value: string);
		procedure SetTypePointer(Value: string);
		procedure SetIsConst(Value: Boolean);
		procedure SetIsStatic(Value: Boolean);
		procedure SetIsMutable(Value: Boolean);
		procedure SetIsVolatile(Value: Boolean);
		procedure SetInitializer(Value: string);
		procedure SetBitField(Value: string);
		procedure SetIsGc(Value: Boolean);
		procedure SetIsNogc(Value: Boolean);
		procedure SetIsEvent(Value: Boolean);
		procedure SetW64(Value: Boolean);
		procedure SetBased(Value: string);
		procedure SetDeclaringClassType(Value: PCppClassType);
  public
		{ Properties }
		property Type_: string read FType_ write SetType_;
		property TypePointer: string read FTypePointer write SetTypePointer;
		property IsConst: Boolean read FIsConst write SetIsConst;
		property IsStatic: Boolean read FIsStatic write SetIsStatic;
		property IsMutable: Boolean read FIsMutable write SetIsMutable;
		property IsVolatile: Boolean read FIsVolatile write SetIsVolatile;
		property Initializer: string read FInitializer write SetInitializer;
		property BitField: string read FBitField write SetBitField;
		property IsGc: Boolean read FIsGc write SetIsGc;
		property IsNogc: Boolean read FIsNogc write SetIsNogc;
		property IsEvent: Boolean read FIsEvent write SetIsEvent;
		property W64: Boolean read FW64 write SetW64;
		property Based: string read FBased write SetBased;
		property DeclaringClassType: PCppClassType read FDeclaringClassType write SetDeclaringClassType;
  end;

	// PCppFunctionMember
	PCppFunctionMember = class(PCppMember)
  private
		{ Member Fields }
		FReturnType: string;
		FReturnTypePointer: string;
		FIsVirtual: Boolean;
		FIsPureVirtual: Boolean;
		FIsStatic: Boolean;
		FIsOperator: Boolean;
		FIsInline: Boolean;
		FIsConst: Boolean;
		FIsConstructor: Boolean;
		FIsDestructor: Boolean;
		FIsFriend: Boolean;
		FIsMacro: Boolean;
		FTemplate: string;
		FThrow: string;
		FIsSealed: Boolean;
		FIsEvent: Boolean;
		FCallingConvention: PCppCallingConventionKind;
		FIsForceInline: Boolean;
		FIs__Inline: Boolean;
		FIsProperty: Boolean;
		FIsDelegate: Boolean;
		FDeclaringClassType: PCppClassType;
		FParameters: TList;
		{ Getter/Setter }
		procedure SetReturnType(Value: string);
		procedure SetReturnTypePointer(Value: string);
		procedure SetIsVirtual(Value: Boolean);
		procedure SetIsPureVirtual(Value: Boolean);
		procedure SetIsStatic(Value: Boolean);
		procedure SetIsOperator(Value: Boolean);
		procedure SetIsInline(Value: Boolean);
		procedure SetIsConst(Value: Boolean);
		procedure SetIsConstructor(Value: Boolean);
		procedure SetIsDestructor(Value: Boolean);
		procedure SetIsFriend(Value: Boolean);
		procedure SetIsMacro(Value: Boolean);
		procedure SetTemplate(Value: string);
		procedure SetThrow(Value: string);
		procedure SetIsSealed(Value: Boolean);
		procedure SetIsEvent(Value: Boolean);
		procedure SetCallingConvention(Value: PCppCallingConventionKind);
		procedure SetIsForceInline(Value: Boolean);
		procedure SetIs__Inline(Value: Boolean);
		procedure SetIsProperty(Value: Boolean);
		procedure SetIsDelegate(Value: Boolean);
		procedure SetDeclaringClassType(Value: PCppClassType);
		function GetParameterCount: Integer;
		function GetParameter(Index: Integer): PCppParameter;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure AddParameter(Value: PCppParameter);
		procedure RemoveParameter(Value: PCppParameter);
		procedure InsertParameter(Index: Integer; Value: PCppParameter);
		procedure DeleteParameter(Index: Integer);
		procedure Accept(Visitor: PVisitor); override;
		{ Properties }
		property ReturnType: string read FReturnType write SetReturnType;
		property ReturnTypePointer: string read FReturnTypePointer write SetReturnTypePointer;
		property IsVirtual: Boolean read FIsVirtual write SetIsVirtual;
		property IsPureVirtual: Boolean read FIsPureVirtual write SetIsPureVirtual;
		property IsStatic: Boolean read FIsStatic write SetIsStatic;
		property IsOperator: Boolean read FIsOperator write SetIsOperator;
		property IsInline: Boolean read FIsInline write SetIsInline;
		property IsConst: Boolean read FIsConst write SetIsConst;
		property IsConstructor: Boolean read FIsConstructor write SetIsConstructor;
		property IsDestructor: Boolean read FIsDestructor write SetIsDestructor;
		property IsFriend: Boolean read FIsFriend write SetIsFriend;
		property IsMacro: Boolean read FIsMacro write SetIsMacro;
		property Template: string read FTemplate write SetTemplate;
		property Throw: string read FThrow write SetThrow;
		property IsSealed: Boolean read FIsSealed write SetIsSealed;
		property IsEvent: Boolean read FIsEvent write SetIsEvent;
		property CallingConvention: PCppCallingConventionKind read FCallingConvention write SetCallingConvention;
		property IsForceInline: Boolean read FIsForceInline write SetIsForceInline;
		property Is__Inline: Boolean read FIs__Inline write SetIs__Inline;
		property IsProperty: Boolean read FIsProperty write SetIsProperty;
		property IsDelegate: Boolean read FIsDelegate write SetIsDelegate;
		property DeclaringClassType: PCppClassType read FDeclaringClassType write SetDeclaringClassType;
		property ParameterCount: Integer read GetParameterCount;
		property Parameters[Index: Integer]: PCppParameter read GetParameter;
  end;

	// PCppTypeDef
	PCppTypeDef = class(PCppElement)
  private
		{ Member Fields }
		FDefinition: string;
		FTypePointer: string;
		FDeclaringNamespace: PCppNamespace;
		FDeclaringClassType: PCppClassType;
		FSynonymType: PCppType;
		{ Getter/Setter }
		procedure SetDefinition(Value: string);
		procedure SetTypePointer(Value: string);
		procedure SetDeclaringNamespace(Value: PCppNamespace);
		procedure SetDeclaringClassType(Value: PCppClassType);
		procedure SetSynonymType(Value: PCppType);
  public
		{ Properties }
		property Definition: string read FDefinition write SetDefinition;
		property TypePointer: string read FTypePointer write SetTypePointer;
		property DeclaringNamespace: PCppNamespace read FDeclaringNamespace write SetDeclaringNamespace;
		property DeclaringClassType: PCppClassType read FDeclaringClassType write SetDeclaringClassType;
		property SynonymType: PCppType read FSynonymType write SetSynonymType;
  end;

	// PCppUsingDeclaration
	PCppUsingDeclaration = class(PCppElement)
  private
		{ Member Fields }
		FIsDirective: Boolean;
		FFragments: TStringList;
		FDeclaringNamespace: PCppNamespace;
		{ Getter/Setter }
		procedure SetIsDirective(Value: Boolean);
		function GetFragmentCount: Integer;
		function GetFragment(Index: Integer): string;
		procedure SetDeclaringNamespace(Value: PCppNamespace);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure AddFragment(Value: string);
		procedure InsertFragment(Index: Integer; Value: string);
		procedure DeleteFragment(Index: Integer);
		{ Properties }
		property IsDirective: Boolean read FIsDirective write SetIsDirective;
		property FragmentCount: Integer read GetFragmentCount;
		property Fragments[Index: Integer]: string read GetFragment;
		property DeclaringNamespace: PCppNamespace read FDeclaringNamespace write SetDeclaringNamespace;
  end;

	// PCppBase
	PCppBase = class(PCppElement)
  private
		{ Member Fields }
		FAccessSpecifier: PCppAccessSpecifierKind;
		FIsVirtual: Boolean;
		FDerivingClassType: PCppClassType;
		{ Getter/Setter }
		procedure SetAccessSpecifier(Value: PCppAccessSpecifierKind);
		procedure SetIsVirtual(Value: Boolean);
		procedure SetDerivingClassType(Value: PCppClassType);
  public
		{ Properties }
		property AccessSpecifier: PCppAccessSpecifierKind read FAccessSpecifier write SetAccessSpecifier;
		property IsVirtual: Boolean read FIsVirtual write SetIsVirtual;
		property DerivingClassType: PCppClassType read FDerivingClassType write SetDerivingClassType;
  end;

	// PCppTemplate
	PCppTemplate = class(PCppElement)
  private
		{ Member Fields }
		FApplyingType: PCppClassType;
		FParameters: TList;
		{ Getter/Setter }
		procedure SetApplyingType(Value: PCppClassType);
		function GetParameterCount: Integer;
		function GetParameter(Index: Integer): PCppAbstractParameter;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure AddParameter(Value: PCppAbstractParameter);
		procedure RemoveParameter(Value: PCppAbstractParameter);
		procedure InsertParameter(Index: Integer; Value: PCppAbstractParameter);
		procedure DeleteParameter(Index: Integer);
		procedure Accept(Visitor: PVisitor); override;
		{ Properties }
		property ApplyingType: PCppClassType read FApplyingType write SetApplyingType;
		property ParameterCount: Integer read GetParameterCount;
		property Parameters[Index: Integer]: PCppAbstractParameter read GetParameter;
  end;

	// PCppAbstractParameter
	PCppAbstractParameter = class(PCppElement)
  private
		{ Member Fields }
		FTemplate: PCppTemplate;
		{ Getter/Setter }
		procedure SetTemplate(Value: PCppTemplate);
  public
		{ Properties }
		property Template: PCppTemplate read FTemplate write SetTemplate;
  end;

	// PCppParameter
	PCppParameter = class(PCppAbstractParameter)
  private
		{ Member Fields }
		FType_: string;
		FTypePointer: string;
		FDefaultValue: string;
		FIsConst: Boolean;
		FFunctionMember: PCppFunctionMember;
		{ Getter/Setter }
		procedure SetType_(Value: string);
		procedure SetTypePointer(Value: string);
		procedure SetDefaultValue(Value: string);
		procedure SetIsConst(Value: Boolean);
		procedure SetFunctionMember(Value: PCppFunctionMember);
  public
		{ Properties }
		property Type_: string read FType_ write SetType_;
		property TypePointer: string read FTypePointer write SetTypePointer;
		property DefaultValue: string read FDefaultValue write SetDefaultValue;
		property IsConst: Boolean read FIsConst write SetIsConst;
		property FunctionMember: PCppFunctionMember read FFunctionMember write SetFunctionMember;
  end;

	// PCppTypeParameter
	PCppTypeParameter = class(PCppAbstractParameter)
  private
		{ Member Fields }
		FArgumentKind: PCppTypeParameterKind;
		FInitializer: string;
		{ Getter/Setter }
		procedure SetArgumentKind(Value: PCppTypeParameterKind);
		procedure SetInitializer(Value: string);
  public
		{ Properties }
		property ArgumentKind: PCppTypeParameterKind read FArgumentKind write SetArgumentKind;
		property Initializer: string read FInitializer write SetInitializer;
  end;

	// PCppEnumerationItem
	PCppEnumerationItem = class(PCppElement)
  private
		{ Member Fields }
		FValue: string;
		FEnumeration: PCppEnumeration;
		{ Getter/Setter }
		procedure SetValue(Value: string);
		procedure SetEnumeration(Value: PCppEnumeration);
  public
		{ Properties }
		property Value: string read FValue write SetValue;
		property Enumeration: PCppEnumeration read FEnumeration write SetEnumeration;
  end;

	// PCppNamespaceAlias
	PCppNamespaceAlias = class(PCppElement)
  private
		{ Member Fields }
		FAutonym: string;
		FDeclaringNamespace: PCppNamespace;
		FDeclaringType: PCppType;
		{ Getter/Setter }
		procedure SetAutonym(Value: string);
		procedure SetDeclaringNamespace(Value: PCppNamespace);
		procedure SetDeclaringType(Value: PCppType);
  public
		{ Properties }
		property Autonym: string read FAutonym write SetAutonym;
		property DeclaringNamespace: PCppNamespace read FDeclaringNamespace write SetDeclaringNamespace;
		property DeclaringType: PCppType read FDeclaringType write SetDeclaringType;
  end;

	// PCppGlobalDelegateFunction
	PCppGlobalDelegateFunction = class(PCppElement)
  private
		{ Member Fields }
		FDeclaringNamespace: PCppNamespace;
		{ Getter/Setter }
		procedure SetDeclaringNamespace(Value: PCppNamespace);
  public
		{ Properties }
		property DeclaringNamespace: PCppNamespace read FDeclaringNamespace write SetDeclaringNamespace;
  end;

	// PCppFriendClass
	PCppFriendClass = class(PCppElement)
  private
		{ Member Fields }
		FDeclaringClassType: PCppClassType;
		{ Getter/Setter }
		procedure SetDeclaringClassType(Value: PCppClassType);
  public
		{ Properties }
		property DeclaringClassType: PCppClassType read FDeclaringClassType write SetDeclaringClassType;
  end;

implementation

/////////////////////////////////////////////////////////////////////////////
//  PCppElement

constructor PCppElement.Create;
begin
  inherited Create;
end;

destructor PCppElement.Destroy;
begin
	inherited;
end;

procedure PCppElement.SetName(Value: string);
begin
  FName := Value;
end;

procedure PCppElement.SetLine(Value: Integer);
begin
  FLine := Value;
end;

procedure PCppElement.SetOffset(Value: Integer);
begin
  FOffset := Value;
end;

procedure PCppElement.SetLength(Value: Integer);
begin
  FLength := Value;
end;

procedure PCppElement.Accept(Visitor: PVisitor);
begin
	Visitor.Visit(Self);
end;

//  PCppElement
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppNamespace

constructor PCppNamespace.Create;
begin
  inherited Create;
	FTypes := TList.Create;
	FParent := nil;
	FChildren := TList.Create;
	FUsingDeclarations := TList.Create;
	FTypeDefs := TList.Create;
	FNamespaceAliases := TList.Create;
	FDelegateFunctions := TList.Create;
end;

destructor PCppNamespace.Destroy;
var
  I: Integer;
begin
	for I := FTypes.Count - 1 downto 0 do begin
		GetType(I).Free;
		FTypes.Delete(I);
	end;
	FTypes.Free;
	FTypes := nil;
	for I := FChildren.Count - 1 downto 0 do begin
		GetChild(I).Free;
		FChildren.Delete(I);
	end;
	FChildren.Free;
	FChildren := nil;
	for I := FUsingDeclarations.Count - 1 downto 0 do begin
		GetUsingDeclaration(I).Free;
		FUsingDeclarations.Delete(I);
	end;
	FUsingDeclarations.Free;
	FUsingDeclarations := nil;
	for I := FTypeDefs.Count - 1 downto 0 do begin
		GetTypeDef(I).Free;
		FTypeDefs.Delete(I);
	end;
	FTypeDefs.Free;
	FTypeDefs := nil;
	for I := FNamespaceAliases.Count - 1 downto 0 do begin
		GetNamespaceAlias(I).Free;
		FNamespaceAliases.Delete(I);
	end;
	FNamespaceAliases.Free;
	FNamespaceAliases := nil;
	for I := FDelegateFunctions.Count - 1 downto 0 do begin
		GetDelegateFunction(I).Free;
		FDelegateFunctions.Delete(I);
	end;
	FDelegateFunctions.Free;
	FDelegateFunctions := nil;
	inherited;
end;

procedure PCppNamespace.SetIsUnnamed(Value: Boolean);
begin
  FIsUnnamed := Value;
end;

function PCppNamespace.GetTypeCount: Integer;
begin
  Result := FTypes.Count;
end;

function PCppNamespace.GetType(Index: Integer): PCppType;
begin
  Result := FTypes[Index];
end;

procedure PCppNamespace.AddType(Value: PCppType);
begin
  if FTypes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypes.Add(Value);
    Value.FDeclaringNamespace := Self;
  end;
end;

procedure PCppNamespace.RemoveType(Value: PCppType);
begin
  if FTypes.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FTypes.Remove(Value);
    Value.FDeclaringNamespace := nil;
  end;
end;

procedure PCppNamespace.InsertType(Index: Integer; Value: PCppType);
begin
  if (Index < 0) or (Index > FTypes.Count - 1) then Exit;
  if FTypes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypes.Insert(Index, Value);
    Value.FDeclaringNamespace := Self;
  end;
end;

procedure PCppNamespace.DeleteType(Index: Integer);
begin
  if (Index < 0) or (Index > FTypes.Count - 1) then Exit;
  RemoveType(GetType(Index));
end;

procedure PCppNamespace.SetParent(Value: PCppNamespace);
begin
  if FParent <> Value then begin
    if FParent <> nil then FParent.FChildren.Remove(Self);
    FParent := Value;
    if FParent <> nil then FParent.FChildren.Add(Self);
  end;
end;

function PCppNamespace.GetChildCount: Integer;
begin
  Result := FChildren.Count;
end;

function PCppNamespace.GetChild(Index: Integer): PCppNamespace;
begin
  Result := FChildren[Index];
end;

procedure PCppNamespace.AddChild(Value: PCppNamespace);
begin
  if FChildren.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FChildren.Add(Value);
    Value.FParent := Self;
  end;
end;

procedure PCppNamespace.RemoveChild(Value: PCppNamespace);
begin
  if FChildren.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FChildren.Remove(Value);
    Value.FParent := nil;
  end;
end;

procedure PCppNamespace.InsertChild(Index: Integer; Value: PCppNamespace);
begin
  if (Index < 0) or (Index > FChildren.Count - 1) then Exit;
  if FChildren.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FChildren.Insert(Index, Value);
    Value.FParent := Self;
  end;
end;

procedure PCppNamespace.DeleteChild(Index: Integer);
begin
  if (Index < 0) or (Index > FChildren.Count - 1) then Exit;
  RemoveChild(GetChild(Index));
end;

function PCppNamespace.GetUsingDeclarationCount: Integer;
begin
  Result := FUsingDeclarations.Count;
end;

function PCppNamespace.GetUsingDeclaration(Index: Integer): PCppUsingDeclaration;
begin
  Result := FUsingDeclarations[Index];
end;

procedure PCppNamespace.AddUsingDeclaration(Value: PCppUsingDeclaration);
begin
  if FUsingDeclarations.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FUsingDeclarations.Add(Value);
    Value.FDeclaringNamespace := Self;
  end;
end;

procedure PCppNamespace.RemoveUsingDeclaration(Value: PCppUsingDeclaration);
begin
  if FUsingDeclarations.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FUsingDeclarations.Remove(Value);
    Value.FDeclaringNamespace := nil;
  end;
end;

procedure PCppNamespace.InsertUsingDeclaration(Index: Integer; Value: PCppUsingDeclaration);
begin
  if (Index < 0) or (Index > FUsingDeclarations.Count - 1) then Exit;
  if FUsingDeclarations.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FUsingDeclarations.Insert(Index, Value);
    Value.FDeclaringNamespace := Self;
  end;
end;

procedure PCppNamespace.DeleteUsingDeclaration(Index: Integer);
begin
  if (Index < 0) or (Index > FUsingDeclarations.Count - 1) then Exit;
  RemoveUsingDeclaration(GetUsingDeclaration(Index));
end;

function PCppNamespace.GetTypeDefCount: Integer;
begin
  Result := FTypeDefs.Count;
end;

function PCppNamespace.GetTypeDef(Index: Integer): PCppTypeDef;
begin
  Result := FTypeDefs[Index];
end;

procedure PCppNamespace.AddTypeDef(Value: PCppTypeDef);
begin
  if FTypeDefs.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypeDefs.Add(Value);
    Value.FDeclaringNamespace := Self;
  end;
end;

procedure PCppNamespace.RemoveTypeDef(Value: PCppTypeDef);
begin
  if FTypeDefs.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FTypeDefs.Remove(Value);
    Value.FDeclaringNamespace := nil;
  end;
end;

procedure PCppNamespace.InsertTypeDef(Index: Integer; Value: PCppTypeDef);
begin
  if (Index < 0) or (Index > FTypeDefs.Count - 1) then Exit;
  if FTypeDefs.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypeDefs.Insert(Index, Value);
    Value.FDeclaringNamespace := Self;
  end;
end;

procedure PCppNamespace.DeleteTypeDef(Index: Integer);
begin
  if (Index < 0) or (Index > FTypeDefs.Count - 1) then Exit;
  RemoveTypeDef(GetTypeDef(Index));
end;

function PCppNamespace.GetNamespaceAliasCount: Integer;
begin
  Result := FNamespaceAliases.Count;
end;

function PCppNamespace.GetNamespaceAlias(Index: Integer): PCppNamespaceAlias;
begin
  Result := FNamespaceAliases[Index];
end;

procedure PCppNamespace.AddNamespaceAlias(Value: PCppNamespaceAlias);
begin
  if FNamespaceAliases.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FNamespaceAliases.Add(Value);
    Value.FDeclaringNamespace := Self;
  end;
end;

procedure PCppNamespace.RemoveNamespaceAlias(Value: PCppNamespaceAlias);
begin
  if FNamespaceAliases.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FNamespaceAliases.Remove(Value);
    Value.FDeclaringNamespace := nil;
  end;
end;

procedure PCppNamespace.InsertNamespaceAlias(Index: Integer; Value: PCppNamespaceAlias);
begin
  if (Index < 0) or (Index > FNamespaceAliases.Count - 1) then Exit;
  if FNamespaceAliases.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FNamespaceAliases.Insert(Index, Value);
    Value.FDeclaringNamespace := Self;
  end;
end;

procedure PCppNamespace.DeleteNamespaceAlias(Index: Integer);
begin
  if (Index < 0) or (Index > FNamespaceAliases.Count - 1) then Exit;
  RemoveNamespaceAlias(GetNamespaceAlias(Index));
end;

function PCppNamespace.GetDelegateFunctionCount: Integer;
begin
  Result := FDelegateFunctions.Count;
end;

function PCppNamespace.GetDelegateFunction(Index: Integer): PCppGlobalDelegateFunction;
begin
  Result := FDelegateFunctions[Index];
end;

procedure PCppNamespace.AddDelegateFunction(Value: PCppGlobalDelegateFunction);
begin
  if FDelegateFunctions.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FDelegateFunctions.Add(Value);
    Value.FDeclaringNamespace := Self;
  end;
end;

procedure PCppNamespace.RemoveDelegateFunction(Value: PCppGlobalDelegateFunction);
begin
  if FDelegateFunctions.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FDelegateFunctions.Remove(Value);
    Value.FDeclaringNamespace := nil;
  end;
end;

procedure PCppNamespace.InsertDelegateFunction(Index: Integer; Value: PCppGlobalDelegateFunction);
begin
  if (Index < 0) or (Index > FDelegateFunctions.Count - 1) then Exit;
  if FDelegateFunctions.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FDelegateFunctions.Insert(Index, Value);
    Value.FDeclaringNamespace := Self;
  end;
end;

procedure PCppNamespace.DeleteDelegateFunction(Index: Integer);
begin
  if (Index < 0) or (Index > FDelegateFunctions.Count - 1) then Exit;
  RemoveDelegateFunction(GetDelegateFunction(Index));
end;

procedure PCppNamespace.Accept(Visitor: PVisitor);
var
  I: Integer;
begin
	inherited;
  for I := 0 to TypeCount - 1 do
		Types[I].Accept(Visitor);
  for I := 0 to ChildCount - 1 do
		Children[I].Accept(Visitor);
  for I := 0 to UsingDeclarationCount - 1 do
		UsingDeclarations[I].Accept(Visitor);
  for I := 0 to TypeDefCount - 1 do
		TypeDefs[I].Accept(Visitor);
  for I := 0 to NamespaceAliasCount - 1 do
		NamespaceAliases[I].Accept(Visitor);
  for I := 0 to DelegateFunctionCount - 1 do
		DelegateFunctions[I].Accept(Visitor);
end;

//  PCppNamespace
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppMember

procedure PCppMember.SetAccessSpecifier(Value: PCppAccessSpecifierKind);
begin
  FAccessSpecifier := Value;
end;

procedure PCppMember.SetDeclspec(Value: string);
begin
  FDeclspec := Value;
end;

//  PCppMember
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppType

constructor PCppType.Create;
begin
  inherited Create;
	FDeclaredScopes := TStringList.Create;
	FDeclaringNamespace := nil;
	FDeclaringType := nil;
	FTypes := TList.Create;
	FNamespaceAliases := TList.Create;
	FTypeDefs := TList.Create;
end;

destructor PCppType.Destroy;
var
  I: Integer;
begin
	FDeclaredScopes.Free;
	FDeclaredScopes := nil;
	for I := FTypes.Count - 1 downto 0 do begin
		GetType(I).Free;
		FTypes.Delete(I);
	end;
	FTypes.Free;
	FTypes := nil;
	for I := FNamespaceAliases.Count - 1 downto 0 do begin
		GetNamespaceAlias(I).Free;
		FNamespaceAliases.Delete(I);
	end;
	FNamespaceAliases.Free;
	FNamespaceAliases := nil;
	FTypeDefs.Free;
	FTypeDefs := nil;
	inherited;
end;

function PCppType.GetDeclaredScopeCount: Integer;
begin
  Result := FDeclaredScopes.Count;
end;

function PCppType.GetDeclaredScope(Index: Integer): string;
begin
  Result := FDeclaredScopes[Index];
end;

procedure PCppType.AddDeclaredScope(Value: string);
begin
  FDeclaredScopes.Add(Value);
end;

procedure PCppType.InsertDeclaredScope(Index: Integer; Value: string);
begin
  FDeclaredScopes.Insert(Index, Value);
end;

procedure PCppType.DeleteDeclaredScope(Index: Integer);
begin
  FDeclaredScopes.Delete(Index);
end;

procedure PCppType.SetDeclaringNamespace(Value: PCppNamespace);
begin
  if FDeclaringNamespace <> Value then begin
    if FDeclaringNamespace <> nil then FDeclaringNamespace.FTypes.Remove(Self);
    FDeclaringNamespace := Value;
    if FDeclaringNamespace <> nil then FDeclaringNamespace.FTypes.Add(Self);
  end;
end;

procedure PCppType.SetDeclaringType(Value: PCppType);
begin
  if FDeclaringType <> Value then begin
    if FDeclaringType <> nil then FDeclaringType.FTypes.Remove(Self);
    FDeclaringType := Value;
    if FDeclaringType <> nil then FDeclaringType.FTypes.Add(Self);
  end;
end;

function PCppType.GetTypeCount: Integer;
begin
  Result := FTypes.Count;
end;

function PCppType.GetType(Index: Integer): PCppType;
begin
  Result := FTypes[Index];
end;

procedure PCppType.AddType(Value: PCppType);
begin
  if FTypes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypes.Add(Value);
    Value.FDeclaringType := Self;
  end;
end;

procedure PCppType.RemoveType(Value: PCppType);
begin
  if FTypes.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FTypes.Remove(Value);
    Value.FDeclaringType := nil;
  end;
end;

procedure PCppType.InsertType(Index: Integer; Value: PCppType);
begin
  if (Index < 0) or (Index > FTypes.Count - 1) then Exit;
  if FTypes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypes.Insert(Index, Value);
    Value.FDeclaringType := Self;
  end;
end;

procedure PCppType.DeleteType(Index: Integer);
begin
  if (Index < 0) or (Index > FTypes.Count - 1) then Exit;
  RemoveType(GetType(Index));
end;

function PCppType.GetNamespaceAliasCount: Integer;
begin
  Result := FNamespaceAliases.Count;
end;

function PCppType.GetNamespaceAlias(Index: Integer): PCppNamespaceAlias;
begin
  Result := FNamespaceAliases[Index];
end;

procedure PCppType.AddNamespaceAlias(Value: PCppNamespaceAlias);
begin
  if FNamespaceAliases.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FNamespaceAliases.Add(Value);
    Value.FDeclaringType := Self;
  end;
end;

procedure PCppType.RemoveNamespaceAlias(Value: PCppNamespaceAlias);
begin
  if FNamespaceAliases.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FNamespaceAliases.Remove(Value);
    Value.FDeclaringType := nil;
  end;
end;

procedure PCppType.InsertNamespaceAlias(Index: Integer; Value: PCppNamespaceAlias);
begin
  if (Index < 0) or (Index > FNamespaceAliases.Count - 1) then Exit;
  if FNamespaceAliases.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FNamespaceAliases.Insert(Index, Value);
    Value.FDeclaringType := Self;
  end;
end;

procedure PCppType.DeleteNamespaceAlias(Index: Integer);
begin
  if (Index < 0) or (Index > FNamespaceAliases.Count - 1) then Exit;
  RemoveNamespaceAlias(GetNamespaceAlias(Index));
end;

function PCppType.GetTypeDefCount: Integer;
begin
  Result := FTypeDefs.Count;
end;

function PCppType.GetTypeDef(Index: Integer): PCppTypeDef;
begin
  Result := FTypeDefs[Index];
end;

procedure PCppType.AddTypeDef(Value: PCppTypeDef);
begin
  if FTypeDefs.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypeDefs.Add(Value);
    Value.FSynonymType := Self;
  end;
end;

procedure PCppType.RemoveTypeDef(Value: PCppTypeDef);
begin
  if FTypeDefs.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FTypeDefs.Remove(Value);
    Value.FSynonymType := nil;
  end;
end;

procedure PCppType.InsertTypeDef(Index: Integer; Value: PCppTypeDef);
begin
  if (Index < 0) or (Index > FTypeDefs.Count - 1) then Exit;
  if FTypeDefs.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypeDefs.Insert(Index, Value);
    Value.FSynonymType := Self;
  end;
end;

procedure PCppType.DeleteTypeDef(Index: Integer);
begin
  if (Index < 0) or (Index > FTypeDefs.Count - 1) then Exit;
  RemoveTypeDef(GetTypeDef(Index));
end;

procedure PCppType.Accept(Visitor: PVisitor);
var
  I: Integer;
begin
	inherited;
  for I := 0 to TypeCount - 1 do
		Types[I].Accept(Visitor);
  for I := 0 to NamespaceAliasCount - 1 do
		NamespaceAliases[I].Accept(Visitor);
end;

//  PCppType
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppClassType

constructor PCppClassType.Create;
begin
  inherited Create;
	FBases := TList.Create;
	FDataMembers := TList.Create;
	FFunctionMembers := TList.Create;
	FTemplateDefinition := nil;
	FTypeDefs := TList.Create;
	FFriendClasses := TList.Create;
end;

destructor PCppClassType.Destroy;
var
  I: Integer;
begin
	for I := FBases.Count - 1 downto 0 do begin
		GetBase(I).Free;
		FBases.Delete(I);
	end;
	FBases.Free;
	FBases := nil;
	for I := FDataMembers.Count - 1 downto 0 do begin
		GetDataMember(I).Free;
		FDataMembers.Delete(I);
	end;
	FDataMembers.Free;
	FDataMembers := nil;
	for I := FFunctionMembers.Count - 1 downto 0 do begin
		GetFunctionMember(I).Free;
		FFunctionMembers.Delete(I);
	end;
	FFunctionMembers.Free;
	FFunctionMembers := nil;
	if FTemplateDefinition <> nil then begin
		FTemplateDefinition.Free;
		FTemplateDefinition := nil;
	end;
	for I := FTypeDefs.Count - 1 downto 0 do begin
		GetTypeDef(I).Free;
		FTypeDefs.Delete(I);
	end;
	FTypeDefs.Free;
	FTypeDefs := nil;
	for I := FFriendClasses.Count - 1 downto 0 do begin
		GetFriendClass(I).Free;
		FFriendClasses.Delete(I);
	end;
	FFriendClasses.Free;
	FFriendClasses := nil;
	inherited;
end;

procedure PCppClassType.SetKey(Value: PCppClassKeyKind);
begin
  FKey := Value;
end;

procedure PCppClassType.SetIsAbstract(Value: Boolean);
begin
  FIsAbstract := Value;
end;

procedure PCppClassType.SetIsGc(Value: Boolean);
begin
  FIsGc := Value;
end;

procedure PCppClassType.SetIsNogc(Value: Boolean);
begin
  FIsNogc := Value;
end;

procedure PCppClassType.SetIsSealed(Value: Boolean);
begin
  FIsSealed := Value;
end;

procedure PCppClassType.SetIsValue(Value: Boolean);
begin
  FIsValue := Value;
end;

procedure PCppClassType.SetIsEvent(Value: Boolean);
begin
  FIsEvent := Value;
end;

function PCppClassType.GetBaseCount: Integer;
begin
  Result := FBases.Count;
end;

function PCppClassType.GetBase(Index: Integer): PCppBase;
begin
  Result := FBases[Index];
end;

procedure PCppClassType.AddBase(Value: PCppBase);
begin
  if FBases.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FBases.Add(Value);
    Value.FDerivingClassType := Self;
  end;
end;

procedure PCppClassType.RemoveBase(Value: PCppBase);
begin
  if FBases.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FBases.Remove(Value);
    Value.FDerivingClassType := nil;
  end;
end;

procedure PCppClassType.InsertBase(Index: Integer; Value: PCppBase);
begin
  if (Index < 0) or (Index > FBases.Count - 1) then Exit;
  if FBases.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FBases.Insert(Index, Value);
    Value.FDerivingClassType := Self;
  end;
end;

procedure PCppClassType.DeleteBase(Index: Integer);
begin
  if (Index < 0) or (Index > FBases.Count - 1) then Exit;
  RemoveBase(GetBase(Index));
end;

function PCppClassType.GetDataMemberCount: Integer;
begin
  Result := FDataMembers.Count;
end;

function PCppClassType.GetDataMember(Index: Integer): PCppDataMember;
begin
  Result := FDataMembers[Index];
end;

procedure PCppClassType.AddDataMember(Value: PCppDataMember);
begin
  if FDataMembers.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FDataMembers.Add(Value);
    Value.FDeclaringClassType := Self;
  end;
end;

procedure PCppClassType.RemoveDataMember(Value: PCppDataMember);
begin
  if FDataMembers.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FDataMembers.Remove(Value);
    Value.FDeclaringClassType := nil;
  end;
end;

procedure PCppClassType.InsertDataMember(Index: Integer; Value: PCppDataMember);
begin
  if (Index < 0) or (Index > FDataMembers.Count - 1) then Exit;
  if FDataMembers.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FDataMembers.Insert(Index, Value);
    Value.FDeclaringClassType := Self;
  end;
end;

procedure PCppClassType.DeleteDataMember(Index: Integer);
begin
  if (Index < 0) or (Index > FDataMembers.Count - 1) then Exit;
  RemoveDataMember(GetDataMember(Index));
end;

function PCppClassType.GetFunctionMemberCount: Integer;
begin
  Result := FFunctionMembers.Count;
end;

function PCppClassType.GetFunctionMember(Index: Integer): PCppFunctionMember;
begin
  Result := FFunctionMembers[Index];
end;

procedure PCppClassType.AddFunctionMember(Value: PCppFunctionMember);
begin
  if FFunctionMembers.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FFunctionMembers.Add(Value);
    Value.FDeclaringClassType := Self;
  end;
end;

procedure PCppClassType.RemoveFunctionMember(Value: PCppFunctionMember);
begin
  if FFunctionMembers.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FFunctionMembers.Remove(Value);
    Value.FDeclaringClassType := nil;
  end;
end;

procedure PCppClassType.InsertFunctionMember(Index: Integer; Value: PCppFunctionMember);
begin
  if (Index < 0) or (Index > FFunctionMembers.Count - 1) then Exit;
  if FFunctionMembers.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FFunctionMembers.Insert(Index, Value);
    Value.FDeclaringClassType := Self;
  end;
end;

procedure PCppClassType.DeleteFunctionMember(Index: Integer);
begin
  if (Index < 0) or (Index > FFunctionMembers.Count - 1) then Exit;
  RemoveFunctionMember(GetFunctionMember(Index));
end;

procedure PCppClassType.SetTemplateDefinition(Value: PCppTemplate);
begin
  if FTemplateDefinition <> Value then begin
    if FTemplateDefinition <> nil then FTemplateDefinition.FApplyingType := nil;
    FTemplateDefinition := Value;
    if FTemplateDefinition <> nil then FTemplateDefinition.FApplyingType := Self;
  end;
end;

function PCppClassType.GetTypeDefCount: Integer;
begin
  Result := FTypeDefs.Count;
end;

function PCppClassType.GetTypeDef(Index: Integer): PCppTypeDef;
begin
  Result := FTypeDefs[Index];
end;

procedure PCppClassType.AddTypeDef(Value: PCppTypeDef);
begin
  if FTypeDefs.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypeDefs.Add(Value);
    Value.FDeclaringClassType := Self;
  end;
end;

procedure PCppClassType.RemoveTypeDef(Value: PCppTypeDef);
begin
  if FTypeDefs.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FTypeDefs.Remove(Value);
    Value.FDeclaringClassType := nil;
  end;
end;

procedure PCppClassType.InsertTypeDef(Index: Integer; Value: PCppTypeDef);
begin
  if (Index < 0) or (Index > FTypeDefs.Count - 1) then Exit;
  if FTypeDefs.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypeDefs.Insert(Index, Value);
    Value.FDeclaringClassType := Self;
  end;
end;

procedure PCppClassType.DeleteTypeDef(Index: Integer);
begin
  if (Index < 0) or (Index > FTypeDefs.Count - 1) then Exit;
  RemoveTypeDef(GetTypeDef(Index));
end;

function PCppClassType.GetFriendClassCount: Integer;
begin
  Result := FFriendClasses.Count;
end;

function PCppClassType.GetFriendClass(Index: Integer): PCppFriendClass;
begin
  Result := FFriendClasses[Index];
end;

procedure PCppClassType.AddFriendClass(Value: PCppFriendClass);
begin
  if FFriendClasses.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FFriendClasses.Add(Value);
    Value.FDeclaringClassType := Self;
  end;
end;

procedure PCppClassType.RemoveFriendClass(Value: PCppFriendClass);
begin
  if FFriendClasses.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FFriendClasses.Remove(Value);
    Value.FDeclaringClassType := nil;
  end;
end;

procedure PCppClassType.InsertFriendClass(Index: Integer; Value: PCppFriendClass);
begin
  if (Index < 0) or (Index > FFriendClasses.Count - 1) then Exit;
  if FFriendClasses.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FFriendClasses.Insert(Index, Value);
    Value.FDeclaringClassType := Self;
  end;
end;

procedure PCppClassType.DeleteFriendClass(Index: Integer);
begin
  if (Index < 0) or (Index > FFriendClasses.Count - 1) then Exit;
  RemoveFriendClass(GetFriendClass(Index));
end;

procedure PCppClassType.Accept(Visitor: PVisitor);
var
  I: Integer;
begin
	inherited;
  for I := 0 to BaseCount - 1 do
		Bases[I].Accept(Visitor);
  for I := 0 to DataMemberCount - 1 do
		DataMembers[I].Accept(Visitor);
  for I := 0 to FunctionMemberCount - 1 do
		FunctionMembers[I].Accept(Visitor);
  if TemplateDefinition <> nil then
		TemplateDefinition.Accept(Visitor);
  for I := 0 to TypeDefCount - 1 do
		TypeDefs[I].Accept(Visitor);
  for I := 0 to FriendClassCount - 1 do
		FriendClasses[I].Accept(Visitor);
end;

//  PCppClassType
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppEnumeration

constructor PCppEnumeration.Create;
begin
  inherited Create;
	FItems := TList.Create;
end;

destructor PCppEnumeration.Destroy;
var
  I: Integer;
begin
	for I := FItems.Count - 1 downto 0 do begin
		GetItem(I).Free;
		FItems.Delete(I);
	end;
	FItems.Free;
	FItems := nil;
	inherited;
end;

function PCppEnumeration.GetItemCount: Integer;
begin
  Result := FItems.Count;
end;

function PCppEnumeration.GetItem(Index: Integer): PCppEnumerationItem;
begin
  Result := FItems[Index];
end;

procedure PCppEnumeration.AddItem(Value: PCppEnumerationItem);
begin
  if FItems.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FItems.Add(Value);
    Value.FEnumeration := Self;
  end;
end;

procedure PCppEnumeration.RemoveItem(Value: PCppEnumerationItem);
begin
  if FItems.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FItems.Remove(Value);
    Value.FEnumeration := nil;
  end;
end;

procedure PCppEnumeration.InsertItem(Index: Integer; Value: PCppEnumerationItem);
begin
  if (Index < 0) or (Index > FItems.Count - 1) then Exit;
  if FItems.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FItems.Insert(Index, Value);
    Value.FEnumeration := Self;
  end;
end;

procedure PCppEnumeration.DeleteItem(Index: Integer);
begin
  if (Index < 0) or (Index > FItems.Count - 1) then Exit;
  RemoveItem(GetItem(Index));
end;

procedure PCppEnumeration.Accept(Visitor: PVisitor);
var
  I: Integer;
begin
	inherited;
  for I := 0 to ItemCount - 1 do
		Items[I].Accept(Visitor);
end;

//  PCppEnumeration
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppDataMember

procedure PCppDataMember.SetType_(Value: string);
begin
  FType_ := Value;
end;

procedure PCppDataMember.SetTypePointer(Value: string);
begin
  FTypePointer := Value;
end;

procedure PCppDataMember.SetIsConst(Value: Boolean);
begin
  FIsConst := Value;
end;

procedure PCppDataMember.SetIsStatic(Value: Boolean);
begin
  FIsStatic := Value;
end;

procedure PCppDataMember.SetIsMutable(Value: Boolean);
begin
  FIsMutable := Value;
end;

procedure PCppDataMember.SetIsVolatile(Value: Boolean);
begin
  FIsVolatile := Value;
end;

procedure PCppDataMember.SetInitializer(Value: string);
begin
  FInitializer := Value;
end;

procedure PCppDataMember.SetBitField(Value: string);
begin
  FBitField := Value;
end;

procedure PCppDataMember.SetIsGc(Value: Boolean);
begin
  FIsGc := Value;
end;

procedure PCppDataMember.SetIsNogc(Value: Boolean);
begin
  FIsNogc := Value;
end;

procedure PCppDataMember.SetIsEvent(Value: Boolean);
begin
  FIsEvent := Value;
end;

procedure PCppDataMember.SetW64(Value: Boolean);
begin
  FW64 := Value;
end;

procedure PCppDataMember.SetBased(Value: string);
begin
  FBased := Value;
end;

procedure PCppDataMember.SetDeclaringClassType(Value: PCppClassType);
begin
  if FDeclaringClassType <> Value then begin
    if FDeclaringClassType <> nil then FDeclaringClassType.FDataMembers.Remove(Self);
    FDeclaringClassType := Value;
    if FDeclaringClassType <> nil then FDeclaringClassType.FDataMembers.Add(Self);
  end;
end;

//  PCppDataMember
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppFunctionMember

constructor PCppFunctionMember.Create;
begin
  inherited Create;
	FDeclaringClassType := nil;
	FParameters := TList.Create;
end;

destructor PCppFunctionMember.Destroy;
var
  I: Integer;
begin
	for I := FParameters.Count - 1 downto 0 do begin
		GetParameter(I).Free;
		FParameters.Delete(I);
	end;
	FParameters.Free;
	FParameters := nil;
	inherited;
end;

procedure PCppFunctionMember.SetReturnType(Value: string);
begin
  FReturnType := Value;
end;

procedure PCppFunctionMember.SetReturnTypePointer(Value: string);
begin
  FReturnTypePointer := Value;
end;

procedure PCppFunctionMember.SetIsVirtual(Value: Boolean);
begin
  FIsVirtual := Value;
end;

procedure PCppFunctionMember.SetIsPureVirtual(Value: Boolean);
begin
  FIsPureVirtual := Value;
end;

procedure PCppFunctionMember.SetIsStatic(Value: Boolean);
begin
  FIsStatic := Value;
end;

procedure PCppFunctionMember.SetIsOperator(Value: Boolean);
begin
  FIsOperator := Value;
end;

procedure PCppFunctionMember.SetIsInline(Value: Boolean);
begin
  FIsInline := Value;
end;

procedure PCppFunctionMember.SetIsConst(Value: Boolean);
begin
  FIsConst := Value;
end;

procedure PCppFunctionMember.SetIsConstructor(Value: Boolean);
begin
  FIsConstructor := Value;
end;

procedure PCppFunctionMember.SetIsDestructor(Value: Boolean);
begin
  FIsDestructor := Value;
end;

procedure PCppFunctionMember.SetIsFriend(Value: Boolean);
begin
  FIsFriend := Value;
end;

procedure PCppFunctionMember.SetIsMacro(Value: Boolean);
begin
  FIsMacro := Value;
end;

procedure PCppFunctionMember.SetTemplate(Value: string);
begin
  FTemplate := Value;
end;

procedure PCppFunctionMember.SetThrow(Value: string);
begin
  FThrow := Value;
end;

procedure PCppFunctionMember.SetIsSealed(Value: Boolean);
begin
  FIsSealed := Value;
end;

procedure PCppFunctionMember.SetIsEvent(Value: Boolean);
begin
  FIsEvent := Value;
end;

procedure PCppFunctionMember.SetCallingConvention(Value: PCppCallingConventionKind);
begin
  FCallingConvention := Value;
end;

procedure PCppFunctionMember.SetIsForceInline(Value: Boolean);
begin
  FIsForceInline := Value;
end;

procedure PCppFunctionMember.SetIs__Inline(Value: Boolean);
begin
  FIs__Inline := Value;
end;

procedure PCppFunctionMember.SetIsProperty(Value: Boolean);
begin
  FIsProperty := Value;
end;

procedure PCppFunctionMember.SetIsDelegate(Value: Boolean);
begin
  FIsDelegate := Value;
end;

procedure PCppFunctionMember.SetDeclaringClassType(Value: PCppClassType);
begin
  if FDeclaringClassType <> Value then begin
    if FDeclaringClassType <> nil then FDeclaringClassType.FFunctionMembers.Remove(Self);
    FDeclaringClassType := Value;
    if FDeclaringClassType <> nil then FDeclaringClassType.FFunctionMembers.Add(Self);
  end;
end;

function PCppFunctionMember.GetParameterCount: Integer;
begin
  Result := FParameters.Count;
end;

function PCppFunctionMember.GetParameter(Index: Integer): PCppParameter;
begin
  Result := FParameters[Index];
end;

procedure PCppFunctionMember.AddParameter(Value: PCppParameter);
begin
  if FParameters.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FParameters.Add(Value);
    Value.FFunctionMember := Self;
  end;
end;

procedure PCppFunctionMember.RemoveParameter(Value: PCppParameter);
begin
  if FParameters.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FParameters.Remove(Value);
    Value.FFunctionMember := nil;
  end;
end;

procedure PCppFunctionMember.InsertParameter(Index: Integer; Value: PCppParameter);
begin
  if (Index < 0) or (Index > FParameters.Count - 1) then Exit;
  if FParameters.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FParameters.Insert(Index, Value);
    Value.FFunctionMember := Self;
  end;
end;

procedure PCppFunctionMember.DeleteParameter(Index: Integer);
begin
  if (Index < 0) or (Index > FParameters.Count - 1) then Exit;
  RemoveParameter(GetParameter(Index));
end;

procedure PCppFunctionMember.Accept(Visitor: PVisitor);
var
  I: Integer;
begin
	inherited;
  for I := 0 to ParameterCount - 1 do
		Parameters[I].Accept(Visitor);
end;

//  PCppFunctionMember
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppTypeDef

procedure PCppTypeDef.SetDefinition(Value: string);
begin
  FDefinition := Value;
end;

procedure PCppTypeDef.SetTypePointer(Value: string);
begin
  FTypePointer := Value;
end;

procedure PCppTypeDef.SetDeclaringNamespace(Value: PCppNamespace);
begin
  if FDeclaringNamespace <> Value then begin
    if FDeclaringNamespace <> nil then FDeclaringNamespace.FTypeDefs.Remove(Self);
    FDeclaringNamespace := Value;
    if FDeclaringNamespace <> nil then FDeclaringNamespace.FTypeDefs.Add(Self);
  end;
end;

procedure PCppTypeDef.SetDeclaringClassType(Value: PCppClassType);
begin
  if FDeclaringClassType <> Value then begin
    if FDeclaringClassType <> nil then FDeclaringClassType.FTypeDefs.Remove(Self);
    FDeclaringClassType := Value;
    if FDeclaringClassType <> nil then FDeclaringClassType.FTypeDefs.Add(Self);
  end;
end;

procedure PCppTypeDef.SetSynonymType(Value: PCppType);
begin
  if FSynonymType <> Value then begin
    if FSynonymType <> nil then FSynonymType.FTypeDefs.Remove(Self);
    FSynonymType := Value;
    if FSynonymType <> nil then FSynonymType.FTypeDefs.Add(Self);
  end;
end;

//  PCppTypeDef
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppUsingDeclaration

constructor PCppUsingDeclaration.Create;
begin
  inherited Create;
	FFragments := TStringList.Create;
	FDeclaringNamespace := nil;
end;

destructor PCppUsingDeclaration.Destroy;
begin
	FFragments.Free;
	FFragments := nil;
	inherited;
end;

procedure PCppUsingDeclaration.SetIsDirective(Value: Boolean);
begin
  FIsDirective := Value;
end;

function PCppUsingDeclaration.GetFragmentCount: Integer;
begin
  Result := FFragments.Count;
end;

function PCppUsingDeclaration.GetFragment(Index: Integer): string;
begin
  Result := FFragments[Index];
end;

procedure PCppUsingDeclaration.AddFragment(Value: string);
begin
  FFragments.Add(Value);
end;

procedure PCppUsingDeclaration.InsertFragment(Index: Integer; Value: string);
begin
  FFragments.Insert(Index, Value);
end;

procedure PCppUsingDeclaration.DeleteFragment(Index: Integer);
begin
  FFragments.Delete(Index);
end;

procedure PCppUsingDeclaration.SetDeclaringNamespace(Value: PCppNamespace);
begin
  if FDeclaringNamespace <> Value then begin
    if FDeclaringNamespace <> nil then FDeclaringNamespace.FUsingDeclarations.Remove(Self);
    FDeclaringNamespace := Value;
    if FDeclaringNamespace <> nil then FDeclaringNamespace.FUsingDeclarations.Add(Self);
  end;
end;

//  PCppUsingDeclaration
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppBase

procedure PCppBase.SetAccessSpecifier(Value: PCppAccessSpecifierKind);
begin
  FAccessSpecifier := Value;
end;

procedure PCppBase.SetIsVirtual(Value: Boolean);
begin
  FIsVirtual := Value;
end;

procedure PCppBase.SetDerivingClassType(Value: PCppClassType);
begin
  if FDerivingClassType <> Value then begin
    if FDerivingClassType <> nil then FDerivingClassType.FBases.Remove(Self);
    FDerivingClassType := Value;
    if FDerivingClassType <> nil then FDerivingClassType.FBases.Add(Self);
  end;
end;

//  PCppBase
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppTemplate

constructor PCppTemplate.Create;
begin
  inherited Create;
	FApplyingType := nil;
	FParameters := TList.Create;
end;

destructor PCppTemplate.Destroy;
var
  I: Integer;
begin
	for I := FParameters.Count - 1 downto 0 do begin
		GetParameter(I).Free;
		FParameters.Delete(I);
	end;
	FParameters.Free;
	FParameters := nil;
	inherited;
end;

procedure PCppTemplate.SetApplyingType(Value: PCppClassType);
begin
  if FApplyingType <> Value then begin
    if FApplyingType <> nil then FApplyingType.FTemplateDefinition := nil;
    FApplyingType := Value;
    if FApplyingType <> nil then FApplyingType.FTemplateDefinition := Self;
  end;
end;

function PCppTemplate.GetParameterCount: Integer;
begin
  Result := FParameters.Count;
end;

function PCppTemplate.GetParameter(Index: Integer): PCppAbstractParameter;
begin
  Result := FParameters[Index];
end;

procedure PCppTemplate.AddParameter(Value: PCppAbstractParameter);
begin
  if FParameters.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FParameters.Add(Value);
    Value.FTemplate := Self;
  end;
end;

procedure PCppTemplate.RemoveParameter(Value: PCppAbstractParameter);
begin
  if FParameters.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FParameters.Remove(Value);
    Value.FTemplate := nil;
  end;
end;

procedure PCppTemplate.InsertParameter(Index: Integer; Value: PCppAbstractParameter);
begin
  if (Index < 0) or (Index > FParameters.Count - 1) then Exit;
  if FParameters.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FParameters.Insert(Index, Value);
    Value.FTemplate := Self;
  end;
end;

procedure PCppTemplate.DeleteParameter(Index: Integer);
begin
  if (Index < 0) or (Index > FParameters.Count - 1) then Exit;
  RemoveParameter(GetParameter(Index));
end;

procedure PCppTemplate.Accept(Visitor: PVisitor);
var
  I: Integer;
begin
	inherited;
  for I := 0 to ParameterCount - 1 do
		Parameters[I].Accept(Visitor);
end;

//  PCppTemplate
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppAbstractParameter

procedure PCppAbstractParameter.SetTemplate(Value: PCppTemplate);
begin
  if FTemplate <> Value then begin
    if FTemplate <> nil then FTemplate.FParameters.Remove(Self);
    FTemplate := Value;
    if FTemplate <> nil then FTemplate.FParameters.Add(Self);
  end;
end;

//  PCppAbstractParameter
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppParameter

procedure PCppParameter.SetType_(Value: string);
begin
  FType_ := Value;
end;

procedure PCppParameter.SetTypePointer(Value: string);
begin
  FTypePointer := Value;
end;

procedure PCppParameter.SetDefaultValue(Value: string);
begin
  FDefaultValue := Value;
end;

procedure PCppParameter.SetIsConst(Value: Boolean);
begin
  FIsConst := Value;
end;

procedure PCppParameter.SetFunctionMember(Value: PCppFunctionMember);
begin
  if FFunctionMember <> Value then begin
    if FFunctionMember <> nil then FFunctionMember.FParameters.Remove(Self);
    FFunctionMember := Value;
    if FFunctionMember <> nil then FFunctionMember.FParameters.Add(Self);
  end;
end;

//  PCppParameter
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppTypeParameter

procedure PCppTypeParameter.SetArgumentKind(Value: PCppTypeParameterKind);
begin
  FArgumentKind := Value;
end;

procedure PCppTypeParameter.SetInitializer(Value: string);
begin
  FInitializer := Value;
end;

//  PCppTypeParameter
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppEnumerationItem

procedure PCppEnumerationItem.SetValue(Value: string);
begin
  FValue := Value;
end;

procedure PCppEnumerationItem.SetEnumeration(Value: PCppEnumeration);
begin
  if FEnumeration <> Value then begin
    if FEnumeration <> nil then FEnumeration.FItems.Remove(Self);
    FEnumeration := Value;
    if FEnumeration <> nil then FEnumeration.FItems.Add(Self);
  end;
end;

//  PCppEnumerationItem
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppNamespaceAlias

procedure PCppNamespaceAlias.SetAutonym(Value: string);
begin
  FAutonym := Value;
end;

procedure PCppNamespaceAlias.SetDeclaringNamespace(Value: PCppNamespace);
begin
  if FDeclaringNamespace <> Value then begin
    if FDeclaringNamespace <> nil then FDeclaringNamespace.FNamespaceAliases.Remove(Self);
    FDeclaringNamespace := Value;
    if FDeclaringNamespace <> nil then FDeclaringNamespace.FNamespaceAliases.Add(Self);
  end;
end;

procedure PCppNamespaceAlias.SetDeclaringType(Value: PCppType);
begin
  if FDeclaringType <> Value then begin
    if FDeclaringType <> nil then FDeclaringType.FNamespaceAliases.Remove(Self);
    FDeclaringType := Value;
    if FDeclaringType <> nil then FDeclaringType.FNamespaceAliases.Add(Self);
  end;
end;

//  PCppNamespaceAlias
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppGlobalDelegateFunction

procedure PCppGlobalDelegateFunction.SetDeclaringNamespace(Value: PCppNamespace);
begin
  if FDeclaringNamespace <> Value then begin
    if FDeclaringNamespace <> nil then FDeclaringNamespace.FDelegateFunctions.Remove(Self);
    FDeclaringNamespace := Value;
    if FDeclaringNamespace <> nil then FDeclaringNamespace.FDelegateFunctions.Add(Self);
  end;
end;

//  PCppGlobalDelegateFunction
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCppFriendClass

procedure PCppFriendClass.SetDeclaringClassType(Value: PCppClassType);
begin
  if FDeclaringClassType <> Value then begin
    if FDeclaringClassType <> nil then FDeclaringClassType.FFriendClasses.Remove(Self);
    FDeclaringClassType := Value;
    if FDeclaringClassType <> nil then FDeclaringClassType.FFriendClasses.Add(Self);
  end;
end;

//  PCppFriendClass
/////////////////////////////////////////////////////////////////////////////


end.
