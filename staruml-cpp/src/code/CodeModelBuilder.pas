unit CodeModelBuilder;

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
  CppElements, DirectiveRemover, Utility,
  Classes, SysUtils, PGMR101Lib_TLB;

type
  // PParseErrorRec
  PParseErrorRec = record
    ErrorCode: Integer;
    ErrorLine: Integer;
    ErrorLinePos: Integer;
    ErrorNumChar: Integer;
    ErrorDescription: string;
  end;

  // enumerations
  PDeclarationAttribute =
    // ansi and VC++
    (daConst, daMutable, daAuto, daRegister, daStatic,
    daExtern, daVolatile, daInline, da__Inline, daForceInline,
    daVirtual, daExplicit, daCdecl, daFastcall, daStdcall, daFriend, daEvent,
    // for managed C++
    daAbstract, daDelegate, daGc, daNogc, daPin, daProperty, daSealed, daValue);
  PDeclarationAttributes = set of PDeclarationAttribute;

  // events
  PParseEvent = procedure(Sender: TObject; Index, Total: Integer; SourceFileName: string) of object;
  
  // PCodeModelFactory
  PCodeModelFactory = class
  public
    { Element Creation Methods }
    function CreateBase(ADerivingClassType: PCppClassType): PCppBase;
    function CreateClassType(ADeclaringNamespace: PCppNamespace): PCppClassType; overload;
    function CreateClassType(ADeclaringType: PCppType): PCppClassType; overload;
    function CreateDataMember(ADeclaringClassType: PCppClassType): PCppDataMember;
    function CreateEnumeration(ADeclaringNamespace: PCppNamespace): PCppEnumeration; overload;
    function CreateEnumeration(ADeclaringType: PCppType): PCppEnumeration; overload;
    function CreateEnumerationItem(AEnumeration: PCppEnumeration): PCppEnumerationItem;
    function CreateFriendClass(ADeclaringClassType: PCppClassType): PCppFriendClass;
    function CreateFunctionMember(ADeclaringClassType: PCppClassType): PCppFunctionMember;
    function CreateNamespace(AParent: PCppNamespace): PCppNamespace;
    function CreateNamespaceAlias(ADeclaringNamespace: PCppNamespace): PCppNamespaceAlias; overload;
    function CreateNamespaceAlias(ADeclaringType: PCppType): PCppNamespaceAlias; overload;
    function CreateParameter(AFunctionMember: PCppFunctionMember): PCppParameter; overload;
    function CreateParameter(ATemplate: PCppTemplate): PCppParameter; overload;
    function CreateTemplate(AApplyingType: PCppClassType): PCppTemplate;
    function CreateTypeDef(ADeclaringNamespace: PCppNamespace): PCppTypeDef; overload;
    function CreateTypeDef(ADeclaringClassType: PCppClassType): PCppTypeDef; overload;
    function CreateTypeParameter(ATemplate: PCppTemplate): PCppTypeParameter;
    function CreateUsingDeclaration(ADeclaringNamespace: PCppNamespace): PCppUsingDeclaration;
  end;

  // PCodeModelBuilder
  PCodeModelBuilder = class
  private
    { Member Fields }
    Pgmr: TPgmrExt;
    DirectiveRemover: PDirectiveRemover;
    Factory: PCodeModelFactory;
    FRootNamespace: PCppNamespace;
    ParseErrorRec: PParseErrorRec;
    FSourceFiles: TStringList;
    ScopedTypeList: TStringList;
    { Internal Variables }
    IsOnParsing: Boolean;
    { Events }
    FOnParsing: PParseEvent;
    FOnParsed: PParseEvent;
    FOnParseError: PParseEvent;
    FOnLog: PLogEvent;
    { Private Methods }
    function Initialized: Boolean;
    procedure AssureNodeAs(Node: TGmrNode; NodeName: string); overload;
    procedure AssureNodeAs(Node: TGmrNode; NodeNameList: array of string); overload;
    procedure ResetParseErrorRec;
    procedure Parsing(Index: Integer; Total: Integer; SourceFileName: string);
    procedure Parsed(Index: Integer; Total: Integer; SourceFileName: string);
    procedure ParseError(Index: Integer; Total: Integer; SourceFileName: string);
    procedure Log(Msg: string);
    { Syntax to Code Model Methods }
    procedure AnalyzeProgram(BaseNode: TGmrNode);
    procedure AnalyzeFileScopeDeclInNamespace(BaseNode: TGmrNode; ANamespace: PCppNamespace);
    procedure AnalyzeClassScopeDecl(BaseNode: TGmrNode; AClassType: PCppClassType; var AccessSpec: string);
    procedure AnalyzeDeclarator(BaseNode: TGmrNode; AClassType: PCppClassType; AccessSpec: string; IsFriend: Boolean = False);
    procedure AnalyzeDeclaratorExt(BaseNode: TGmrNode; AClassType: PCppClassType; AccessSpec: string; IsFriend: Boolean = False);
    procedure AnalyzeMemberByProd1(BaseNode: TGmrNode; AClassType: PCppClassType; AccessSpec: string; IsFriend: Boolean = False);
    procedure AnalyzeMemberByProd2(BaseNode: TGmrNode; AClassType: PCppClassType; AccessSpec: string; IsFriend: Boolean = False);
    procedure AnalyzeMemberByProd3(BaseNode: TGmrNode; AClassType: PCppClassType; AccessSpec: string; IsFriend: Boolean = False);
    procedure AnalyzeBase(BaseNode: TGmrNode; DerivingClassType: PCppClassType);
    function AnalyzeClassType(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace): PCppClassType; overload; // with declarator
    function AnalyzeClassType(BaseNode: TGmrNode; DeclaringType: PCppClassType): PCppClassType; overload; // with declarator
    function AnalyzeClassType2(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace): PCppClassType; overload; // with declarator_ext
    function AnalyzeClassType2(BaseNode: TGmrNode; DeclaringType: PCppClassType): PCppClassType; overload; // with declarator_ext
    function AnalyzeEnumeration(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace): PCppEnumeration; overload; // with declarator
    function AnalyzeEnumeration(BaseNode: TGmrNode; DeclaringType: PCppClassType): PCppEnumeration; overload; // with declarator
    function AnalyzeEnumeration2(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace): PCppEnumeration; overload; // with declarator_ext
    function AnalyzeEnumeration2(BaseNode: TGmrNode; DeclaringType: PCppClassType): PCppEnumeration; overload; // with declarator_ext
    procedure AnalyzeEnumerationItem(BaseNode: TGmrNode; Enumeration: PCppEnumeration);
    procedure AnalyzeFriendClass(BaseNode: TGmrNode; DeclaringClassType: PCppClassType);
    procedure AnalyzeEllipsesParameter(BaseNode: TGmrNode; FunctionMember: PCppFunctionMember);
    procedure AnalyzeMacro(BaseNode: TGmrNode; DeclaringType: PCppClassType);
    procedure AnalyzeNamespaceDef(BaseNode: TGmrNode; Parent: PCppNamespace);
    procedure AnalyzeNamespaceAliasDef(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace); overload;
    procedure AnalyzeNamespaceAliasDef(BaseNode: TGmrNode; DeclaringType: PCppType); overload;
    procedure AnalyzeParameter(BaseNode: TGmrNode; FunctionMember: PCppFunctionMember);
    procedure AnalyzeTemplate(BaseNode: TGmrNode; ApplyingType: PCppClassType);
    procedure AnalyzeTemplateTypeParameter(BaseNode: TGmrNode; Template: PCppTemplate);
    procedure AnalyzeTemplateParameter(BaseNode: TGmrNode; Template: PCppTemplate);
    procedure AnalyzeTypeDef(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace); overload; // with declarator
    procedure AnalyzeTypeDef(BaseNode: TGmrNode; DeclaringClassType: PCppClassType); overload; // with declarator
    procedure AnalyzeTypeDef2(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace); overload; // with declarator_ext
    procedure AnalyzeTypeDef2(BaseNode: TGmrNode; DeclaringClassType: PCppClassType); overload; // with declarator_ext
    procedure AnalyzeUsingDecl(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace);
    procedure AnalyzeUsingDirective(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace);
    { Code Model Filling out Methods }
    procedure FillOutBase(BaseNode: TGmrNode; ABase: PCppBase);
    procedure FillOutClassType(BaseNode: TGmrNode; AClassType: PCppClassType); // with declarator
    procedure FillOutClassType2(BaseNode: TGmrNode; AClassType: PCppClassType); // with declarator_ext
    procedure FillOutDataMember(BaseNode: TGmrNode; ADataMember: PCppDataMember);
    procedure FillOutEnumeration(BaseNode: TGmrNode; AEnumeration: PCppEnumeration);
    procedure FillOutEnumeration2(BaseNode: TGmrNode; AEnumeration: PCppEnumeration);
    procedure FillOutEnumerationItem(BaseNode: TGmrNode; AEnumerationItem: PCppEnumerationItem);
    procedure FillOutFunctionMember(BaseNode: TGmrNode; AFunctionMember: PCppFunctionMember);
    procedure FillOutMacro(BaseNode: TGmrNode; AFunctionMember: PCppFunctionMember);
    procedure FillOutMembers(BaseNode: TGmrNode; MemberList: TList; AccessSpec: string);
    procedure FillOutNamespace(BaseNode: TGmrNode; ANamespace: PCppNamespace);
    procedure FillOutNamespaceAlias(BaseNode: TGmrNode; ANamespaceAlias: PCppNamespaceAlias);
    procedure FillOutParameter(BaseNode: TGmrNode; AParameter: PCppParameter);
    procedure FillOutParameterAsTemplateParameter(BaseNode: TGmrNode; AParameter: PCppParameter);
    procedure FillOutTemplate(BaseNode: TGmrNode; ATemplate: PCppTemplate);
    procedure FillOutTypeDefs(BaseNode: TGmrNode; TypeDefList: TList);
    procedure FillOutTypeParameter(BaseNode: TGmrNode; ATypeParameter: PCppTypeParameter);
    procedure FillOutUsingDecl(BaseNode: TGmrNode; AUsingDeclaration: PCppUsingDeclaration);
    procedure FillOutUsingDirective(BaseNode: TGmrNode; AUsingDeclaration: PCppUsingDeclaration);
    { Auxiliary Methods }
    procedure PutDeclarationAttribute(var Attrs: PDeclarationAttributes; Value: string);
    function GetDeclarationAttributes(BaseNode: TGmrNode): PDeclarationAttributes;
    function GetDeclSpecStr(Node: TGmrNode): string;
    procedure ApplyDeclarationAttributesToClassType(BaseNode: TGmrNode; AClassType: PCppClassType);
    procedure ApplyDeclarationAttributesToDataMember(BaseNode: TGmrNode; ADataMember: PCppDataMember);
    procedure ApplyDeclarationAttributesToFunctionMember(BaseNode: TGmrNode; AFunctionMember: PCppFunctionMember);
    procedure ApplyDeclarationAttributesToParameter(BaseNode: TGmrNode; AParameter: PCppParameter);
    function GetClassScopedName(BaseNode: TGmrNode): string;
    function ExtractSimpleTypeName(Node: TGmrNode): string;
    function IsFunctionMember(DeclItemNode: TGmrNode): Boolean;
    function HasClassDefinition(ClassSpecNode: TGmrNode): Boolean;
    procedure CollectDeclItems(Node: TGmrNode; Nodes: PGmrNodeList);
    { Scope-named Type Declaration Handling Methods }
    function IsScopedName(TypeName: string): Boolean;
    function ExtractName(Path: string): string;
    procedure CollectPathFragment(Path: string; SL: TStringList);
    function IsAbsolutePath(Path: string): Boolean;
    function GetAbsolutePath(ANamespace: PCppNamespace): string; overload;
    function GetAbsolutePath(AType: PCppType): string; overload;
    function GetAbsolutePath(DeclaringNamespace: PCppNamespace; ScopedName: string): string; overload;
    function GetAbsolutePath(DeclaringType: PCppType; ScopedName: string): string; overload;

    function SliceHeadOfRelativePath(RelativePath: string): string;
    function SliceTailOfRelativePath(RelativePath: string): string;
    function FindChildNamespace(ParentNamespace: PCppNamespace; Name: string): PCppNamespace;
    function FindDeclaredType(DeclaringNamespace: PCppNamespace; Name: string): PCppType; overload;
    function FindDeclaredType(DeclaringType: PCppType; Name: string): PCppType; overload;
    function FindType(ANamespace: PCppNamespace; RelativePath: string): PCppType; overload;
    function FindType(AType: PCppType; RelativePath: string): PCppType; overload;
    function FindType(AbsolutePath: string): PCppType; overload;
    function FindTypeInScopedTypeList(AbsolutePath: string): PCppType;
    function Registered(AbsolutePath: string): Boolean;
    procedure RegisterType(AbsolutePath: string; AType: PCppType);

    function AcquireNamespace(Parent: PCppNamespace; Name: string): PCppNamespace;
    function AcquireClassType(DeclaringNamespace: PCppNamespace; ScopedName: string): PCppClassType; overload;
    function AcquireClassType(DeclaringType: PCppType; ScopedName: string): PCppClassType; overload;

    function CreateImpliedElements(AbsolutePath: string): PCppElement;
    procedure AssociateTypesParent;
    function BuildSourceFile(SourceFileName: string): Boolean;
  public
		{ Constructor/Destructor }
    constructor Create;
    destructor Destroy; override;
    { Public Methods }
    procedure Clear;
    procedure AddSourceFile(SourceFileName: string);
    procedure Build;
    procedure Abort;
    { Properties }
    property RootNamespace: PCppNamespace read FRootNamespace write FRootNamespace;
    property OnParsing: PParseEvent read FOnParsing write FOnParsing;
    property OnParsed: PParseEvent read FOnParsed write FOnParsed;
    property OnParseError: PParseEvent read FOnParseError write FOnParseError;
    property OnLog: PLogEvent read FOnLog write FOnLog;
  end;

implementation

uses
  Symbols, NLS_CppAddIn,
  Forms, Dialogs;

////////////////////////////////////////////////////////////////////////////////
//  PCodeModelFactory

function PCodeModelFactory.CreateBase(ADerivingClassType: PCppClassType): PCppBase;
var
  Base: PCppBase;
begin
  Base := PCppBase.Create;
  Base.DerivingClassType := ADerivingClassType;
  if (ADerivingClassType.Key = ckClass) or (ADerivingClassType.Key = ckInterface) then
    Base.AccessSpecifier := akPrivate
  else
    Base.AccessSpecifier := akPublic;
  Result := Base;
end;

function PCodeModelFactory.CreateClassType(ADeclaringNamespace: PCppNamespace): PCppClassType;
var
  ClassType: PCppClassType;
begin
  ClassType := PCppClassType.Create;
  ClassType.DeclaringNamespace := ADeclaringNamespace;
  Result := ClassType;
end;

function PCodeModelFactory.CreateClassType(ADeclaringType: PCppType): PCppClassType;
var
  ClassType: PCppClassType;
begin
  ClassType := PCppClassType.Create;
  ClassType.DeclaringType := ADeclaringType;
  Result := ClassType;
end;

function PCodeModelFactory.CreateDataMember(ADeclaringClassType: PCppClassType): PCppDataMember;
var
  DataMember: PCppDataMember;
begin
  DataMember := PCppDataMember.Create;
  DataMember.DeclaringClassType := ADeclaringClassType;
  Result := DataMember;
end;

function PCodeModelFactory.CreateEnumeration(ADeclaringNamespace: PCppNamespace): PCppEnumeration;
var
  Enumeration: PCppEnumeration;
begin
  Enumeration := PCppEnumeration.Create;
  Enumeration.DeclaringNamespace := ADeclaringNamespace;
  Result := Enumeration;
end;

function PCodeModelFactory.CreateEnumeration(ADeclaringType: PCppType): PCppEnumeration;
var
  Enumeration: PCppEnumeration;
begin
  Enumeration := PCppEnumeration.Create;
  Enumeration.DeclaringType := ADeclaringType;
  Result := Enumeration;
end;

function PCodeModelFactory.CreateEnumerationItem(AEnumeration: PCppEnumeration): PCppEnumerationItem;
var
  EnumerationItem: PCppEnumerationItem;
begin
  EnumerationItem := PCppEnumerationItem.Create;
  EnumerationItem.Enumeration := AEnumeration;
  Result := EnumerationItem;
end;

function PCodeModelFactory.CreateFriendClass(ADeclaringClassType: PCppClassType): PCppFriendClass;
var
  FriendClass: PCppFriendClass;
begin
  FriendClass := PCppFriendClass.Create;
  FriendClass.DeclaringClassType := ADeclaringClassType;
  Result := FriendClass;
end;

function PCodeModelFactory.CreateFunctionMember(ADeclaringClassType: PCppClassType): PCppFunctionMember;
var
  FunctionMember: PCppFunctionMember;
begin
  FunctionMember := PCppFunctionMember.Create;
  FunctionMember.DeclaringClassType := ADeclaringClassType;
  Result := FunctionMember;
end;

function PCodeModelFactory.CreateNamespace(AParent: PCppNamespace): PCppNamespace;
var
  ANamespace: PCppNamespace;
begin
  ANamespace := PCppNamespace.Create;
  ANamespace.Parent := AParent;
  Result := ANamespace;
end;

function PCodeModelFactory.CreateNamespaceAlias(ADeclaringNamespace: PCppNamespace): PCppNamespaceAlias;
var
  ANamespaceAlias: PCppNamespaceAlias;
begin
  ANamespaceAlias := PCppNamespaceAlias.Create;
  ANamespaceAlias.DeclaringNamespace := ADeclaringNamespace;
  Result := ANamespaceAlias;
end;

function PCodeModelFactory.CreateNamespaceAlias(ADeclaringType: PCppType): PCppNamespaceAlias;
var
  ANamespaceAlias: PCppNamespaceAlias;
begin
  ANamespaceAlias := PCppNamespaceAlias.Create;
  ANamespaceAlias.DeclaringType := ADeclaringType;
  Result := ANamespaceAlias;
end;

function PCodeModelFactory.CreateParameter(AFunctionMember: PCppFunctionMember): PCppParameter;
var
  AParameter: PCppParameter;
begin
  AParameter := PCppParameter.Create;
  AParameter.FunctionMember := AFunctionMember;
  Result := AParameter;
end;

function PCodeModelFactory.CreateParameter(ATemplate: PCppTemplate): PCppParameter;
var
  AParameter: PCppParameter;
begin
  AParameter := PCppParameter.Create;
  AParameter.Template := ATemplate;
  Result := AParameter;
end;

function PCodeModelFactory.CreateTemplate(AApplyingType: PCppClassType): PCppTemplate;
var
  ATemplate: PCppTemplate;
begin
  ATemplate := PCppTemplate.Create;
  ATemplate.ApplyingType := AApplyingType;
  Result := ATemplate;
end;

function PCodeModelFactory.CreateTypeDef(ADeclaringNamespace: PCppNamespace): PCppTypeDef;
var
  ATypeDef: PCppTypeDef;
begin
  ATypeDef := PCppTypeDef.Create;
  ATypeDef.DeclaringNamespace := ADeclaringNamespace;
  Result := ATypeDef;
end;

function PCodeModelFactory.CreateTypeDef(ADeclaringClassType: PCppClassType): PCppTypeDef;
var
  ATypeDef: PCppTypeDef;
begin
  ATypeDef := PCppTypeDef.Create;
  ATypeDef.DeclaringClassType := ADeclaringClassType;
  Result := ATypeDef;
end;

function PCodeModelFactory.CreateTypeParameter(ATemplate: PCppTemplate): PCppTypeParameter;
var
  ATypeParameter: PCppTypeParameter;
begin
  ATypeParameter := PCppTypeParameter.Create;
  ATypeParameter.Template := ATemplate;
  Result := ATypeParameter;
end;

function PCodeModelFactory.CreateUsingDeclaration(ADeclaringNamespace: PCppNamespace): PCppUsingDeclaration;
var
  AUsingDeclaration: PCppUsingDeclaration;
begin
  AUsingDeclaration := PCppUsingDeclaration.Create;
  AUsingDeclaration.DeclaringNamespace := ADeclaringNamespace;
  Result := AUsingDeclaration;
end;

//  PCodeModelFactory
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//  PCodeModelBuilder

constructor PCodeModelBuilder.Create;
begin
  RootNamespace := nil;
  DirectiveRemover := PDirectiveRemover.Create;
  Pgmr := TPgmrExt.Create(nil);
  Pgmr.SetGrammar(GetDllDirectory + '\' + CPP_GRAMMAR_FILE_NAME);
  Factory := PCodeModelFactory.Create;
  FSourceFiles := TStringList.Create;
  ScopedTypeList := TStringList.Create;
  ScopedTypeList.CaseSensitive := True;
  ResetParseErrorRec;
end;

destructor PCodeModelBuilder.Destroy;
begin
  inherited;
  DirectiveRemover.Free;
  DirectiveRemover := nil;
  Pgmr.Free;
  Pgmr := nil;
  Factory.Free;
  Factory := nil;
  FRootNamespace := nil;
  FSourceFiles.Free;
  FSourceFiles := nil;
  ScopedTypeList.Free;
  ScopedTypeList := nil;
end;

function PCodeModelBuilder.Initialized: Boolean;
begin
  Result := (FRootNamespace <> nil);
end;

procedure PCodeModelBuilder.AssureNodeAs(Node: TGmrNode; NodeName: string);
begin
  if Pgmr.GetNodeName(Node) <> NodeName then
    raise EInvalidNode.Create(Format(ERR_UNEXPECTED_NODE, [Pgmr.GetNodeName(Node), NodeName]));
end;

procedure PCodeModelBuilder.AssureNodeAs(Node: TGmrNode; NodeNameList: array of string);
var
  Found: Boolean;
  S: string;
  I: Integer;
begin
  S := Pgmr.GetNodeName(Node);
  Found := False;
  for I := 0 to Length(NodeNameList) - 1 do
    if NodeNameList[I] = S then begin
      Found := True;
      Break;
    end;
  if not Found then
    raise EInvalidNode.Create(Format(ERR_UNEXPECTED_NODE2, [S]));
end;

procedure PCodeModelBuilder.ResetParseErrorRec;
begin
  ParseErrorRec.ErrorCode := -1;
  ParseErrorRec.ErrorLine := -1;
  ParseErrorRec.ErrorLinePos := -1;
  ParseErrorRec.ErrorNumChar := 0;
  ParseErrorRec.ErrorDescription := '';
end;

procedure PCodeModelBuilder.Parsing(Index: Integer; Total: Integer; SourceFileName: string);
begin
  if Assigned(FOnParsing) then
    FOnParsing(Self, Index, Total, SourceFileName);
end;

procedure PCodeModelBuilder.Parsed(Index: Integer; Total: Integer; SourceFileName: string);
begin
  if Assigned(FOnParsed) then
    FOnParsed(Self, Index, Total, SourceFileName);
end;

procedure PCodeModelBuilder.ParseError(Index: Integer; Total: Integer; SourceFileName: string);
begin
  if Assigned(FOnParseError) then
    FOnParseError(Self, Index, Total, SourceFileName);
end;

procedure PCodeModelBuilder.Log(Msg: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg);
end;

procedure PCodeModelBuilder.AnalyzeProgram(BaseNode: TGmrNode);
var
  NodeFS: TGmrNode;
  I: Integer;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_PROGRAM);
  for I := 0 to Pgmr.GetNumChildren(BaseNode) - 1 do begin
    NodeFS := Pgmr.GetChild(BaseNode, I);
    AssureNodeAs(NodeFS, PGMR_NODE_FILE_SCOPE_DECL);
    AnalyzeFileScopeDeclInNamespace(NodeFS, FRootNamespace);
  end;
end;

procedure PCodeModelBuilder.AnalyzeFileScopeDeclInNamespace(BaseNode: TGmrNode; ANamespace: PCppNamespace);
var
  Child, NodeCls, NodeEnm: TGmrNode;
  S: string;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_FILE_SCOPE_DECL);
  Child := Pgmr.GetChild(BaseNode, 0);
  if Child <> PGMR_NODE_NOT_EXISTS then begin
    S := Pgmr.GetNodeName(Child);
    if S = PGMR_NODE_USING_DIRECTIVE then
      AnalyzeUsingDirective(Child, ANamespace)
    else if S = PGMR_NODE_USING_DECL then
      AnalyzeUsingDecl(Child, ANamespace)
    else if S = PGMR_NODE_NAMESPACE_DEF then
      AnalyzeNamespaceDef(Child, ANamespace)
    else if S = PGMR_NODE_NAMESPACE_ALIAS_DEF then
      AnalyzeNamespaceAliasDef(Child, ANamespace)
    else if S = PGMR_NODE_DECLARATOR then begin
      if Pgmr.ExistsNode(Child, PGMR_NODE_TYPEDEF_TAG) then
        AnalyzeTypeDef(Child, ANamespace)
      else begin
        // case production 1
        if Pgmr.ExistsNode(Child, PGMR_NODE_CLASS_SPEC) then
          AnalyzeClassType(Child, ANamespace)
        else if Pgmr.ExistsNode(Child, PGMR_NODE_ENUM_SPEC) then
          AnalyzeEnumeration(Child, ANamespace);
        // consider delegate?
        // other case ignore.
      end;
      // to do. typename, decl_item....
    end
    else if S = PGMR_NODE_DECLARATOR_EXT then begin
      NodeCls := Pgmr.Find(PGMR_PATH_DECEXT_CLASS_SPEC, Child);
      if NodeCls <> PGMR_NODE_NOT_EXISTS then
        AnalyzeClassType2(Child, ANamespace); // analyze with declarator_ext
      NodeEnm := Pgmr.Find(PGMR_PATH_DECEXT_ENUM_SPEC, Child);
      if NodeEnm <> PGMR_NODE_NOT_EXISTS then
        AnalyzeEnumeration2(Child, ANamespace);  // analyze with declarator_ext
    end
    else if S = PGMR_NODE_RECOVER_IN_FILE_SCOPE_DECL then begin
      // do nothing...
    end;
    // pragma_stmt, likage_spec ignored
  end;
end;

procedure PCodeModelBuilder.AnalyzeClassScopeDecl(BaseNode: TGmrNode; AClassType: PCppClassType; var AccessSpec: string);
var
  Child: TGmrNode;
  S: string;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_CLASS_SCOPE_DECL);
  Child := Pgmr.GetChild(BaseNode, 0);
  if Child <> PGMR_NODE_NOT_EXISTS then begin
    S := Pgmr.GetNodeName(Child);
    if S = PGMR_NODE_ACCESS_DECL then
      AccessSpec := Pgmr.GetValue(Child)
    else if S = PGMR_NODE_FRIEND_DECL then begin
      if Pgmr.ExistsNode(Child, PGMR_NODE_DECLARATOR) then
        AnalyzeDeclarator(Pgmr.Find(PGMR_NODE_DECLARATOR, Child), AClassType, AccessSpec, True)
      else if Pgmr.ExistsNode(Child, PGMR_NODE_DECLARATOR_EXT) then
        AnalyzeDeclarator(Pgmr.Find(PGMR_NODE_DECLARATOR_EXT, Child), AClassType, AccessSpec, True)
      else if Pgmr.ExistsNode(Child, PGMR_NODE_TYPE_NAME) then
        AnalyzeFriendClass(Pgmr.Find(PGMR_NODE_TYPE_NAME, Child), AClassType);
    end
    else if S = PGMR_NODE_DECLARATOR then
      AnalyzeDeclarator(Child, AClassType, AccessSpec)
    else if S = PGMR_NODE_DECLARATOR_EXT then
      AnalyzeDeclaratorExt(Child, AClassType, AccessSpec)    
    else if S = PGMR_NODE_RECOVER_IN_CLASS_SCOPE_DECL then begin
      // do something...
    end;
    // pragma stmt ignored
  end;
end;

procedure PCodeModelBuilder.AnalyzeDeclarator(BaseNode: TGmrNode; AClassType: PCppClassType; AccessSpec: string; IsFriend: Boolean = False);
var
  NodeClassSpec: TGmrNode;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR);
  if Pgmr.ExistsNode(BaseNode, PGMR_NODE_TYPEDEF_TAG) then
    AnalyzeTypeDef(BaseNode, AClassType)
  else begin
    NodeClassSpec := Pgmr.Find(PGMR_NODE_CLASS_SPEC, BaseNode);
    if NodeClassSpec <> PGMR_NODE_NOT_EXISTS then begin
      if IsFriend and (not HasClassDefinition(NodeClassSpec)) then
        AnalyzeFriendClass(NodeClassSpec, AClassType)
      else
        AnalyzeClassType(BaseNode, AClassType);
    end
    else if Pgmr.ExistsNode(BaseNode, PGMR_NODE_ENUM_SPEC) then
      AnalyzeEnumeration(BaseNode, AClassType);
    if (Pgmr.ExistsNode(BaseNode, PGMR_NODE_CLASS_SPEC) or Pgmr.ExistsNode(BaseNode, PGMR_NODE_ENUM_SPEC))
      and Pgmr.ExistsNode(BaseNode, PGMR_NODE_DECL_ITEM_LIST) then
      AnalyzeMemberByProd1(BaseNode, AClassType, AccessSpec, IsFriend)
    else if Pgmr.ExistsNode(BaseNode, PGMR_NODE_TYPE_NAME) and Pgmr.ExistsNode(BaseNode, PGMR_NODE_DECL_ITEM_LIST) then
      AnalyzeMemberByProd2(BaseNode, AClassType, AccessSpec, IsFriend)
    else if Pgmr.ExistsNode(BaseNode, PGMR_NODE_DECL_ITEM) then
      AnalyzeMemberByProd3(BaseNode, AClassType, AccessSpec, IsFriend);
  end;
end;

procedure PCodeModelBuilder.AnalyzeDeclaratorExt(BaseNode: TGmrNode; AClassType: PCppClassType; AccessSpec: string; IsFriend: Boolean = False);
var
  NodeLinedMacro: TGmrNode;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR_EXT);
  NodeLinedMacro := Pgmr.Find(PGMR_NODE_LINED_MACRO_USING, BaseNode);
  if NodeLinedMacro <> PGMR_NODE_NOT_EXISTS then
    AnalyzeMacro(NodeLinedMacro, AClassType)
  else if Pgmr.ExistsNode(BaseNode, PGMR_NODE_TYPEDEF_TAG) then
    AnalyzeTypeDef2(BaseNode, AClassType)
  else begin
    if Pgmr.ExistsNode(BaseNode, PGMR_PATH_DECEXT_CLASS_SPEC) then
      AnalyzeClassType2(BaseNode, AClassType)
    else if Pgmr.ExistsNode(BaseNode, PGMR_PATH_DECEXT_ENUM_SPEC) then
      AnalyzeEnumeration2(BaseNode, AClassType);
{
        if (Pgmr.ExistsNode(BaseNode, PGMR_NODE_CLASS_SPEC) or Pgmr.ExistsNode(BaseNode, PGMR_NODE_ENUM_SPEC))
          and Pgmr.ExistsNode(BaseNode, PGMR_NODE_DECL_ITEM_LIST) then
          AnalyzeMemberByProd1(BaseNode, AClassType, AccessSpec)
        else if Pgmr.ExistsNode(BaseNode, PGMR_NODE_TYPE_NAME) and Pgmr.ExistsNode(BaseNode, PGMR_NODE_DECL_ITEM_LIST) then
          AnalyzeMemberByProd2(BaseNode, AClassType, AccessSpec)
        else if Pgmr.ExistsNode(BaseNode, PGMR_NODE_DECL_ITEM) then
          AnalyzeMemberByProd3(BaseNode, AClassType, AccessSpec);
}
  end;
end;

procedure PCodeModelBuilder.AnalyzeMemberByProd1(BaseNode: TGmrNode; AClassType: PCppClassType; AccessSpec: string; IsFriend: Boolean = False);
var
  MemberList: TList;
  DataMember: PCppDataMember;
  FunctionMember: PCppFunctionMember;
  NodeDeclItem: TGmrNode;
  SID: TGmrSearchID;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR);
  MemberList := TList.Create;
  try
    SID := Pgmr.StartSearch(PGMR_PATH_DECL_ITEM, BaseNode);
    NodeDeclItem := Pgmr.FindNext(SID);
    while NodeDeclItem <> PGMR_NODE_NOT_EXISTS do begin
      if IsFunctionMember(NodeDeclItem) then begin
        FunctionMember := Factory.CreateFunctionMember(AClassType);
        FunctionMember.IsFriend := IsFriend;
        FillOutFunctionMember(NodeDeclItem, FunctionMember);
        MemberList.Add(FunctionMember);
      end
      else begin
        DataMember := Factory.CreateDataMember(AClassType);
        FillOutDataMember(NodeDeclItem, DataMember);
        MemberList.Add(DataMember);
      end;
      NodeDeclItem := Pgmr.FindNext(SID);
    end;
    FillOutMembers(BaseNode, MemberList, AccessSpec);
  finally
    MemberList.Free;
  end;
end;

procedure PCodeModelBuilder.AnalyzeMemberByProd2(BaseNode: TGmrNode; AClassType: PCppClassType; AccessSpec: string; IsFriend: Boolean = False);
begin
  AnalyzeMemberByProd1(BaseNode, AClassType, AccessSpec, IsFriend);
end;

procedure PCodeModelBuilder.AnalyzeMemberByProd3(BaseNode: TGmrNode; AClassType: PCppClassType; AccessSpec: string; IsFriend: Boolean = False);
var
  MemberList: TList;
  FunctionMember: PCppFunctionMember;
  NodeDeclItem: TGmrNode;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR);
  MemberList := TList.Create;
  try
    NodeDeclItem := Pgmr.Find(PGMR_NODE_DECL_ITEM, BaseNode);
    if (NodeDeclItem <> PGMR_NODE_NOT_EXISTS) and IsFunctionMember(NodeDeclItem) then begin
      FunctionMember := Factory.CreateFunctionMember(AClassType);
      FunctionMember.IsFriend := IsFriend;
      FillOutFunctionMember(NodeDeclItem, FunctionMember);
      MemberList.Add(FunctionMember);
    end
  finally
    MemberList.Free;
  end;
end;

procedure PCodeModelBuilder.AnalyzeBase(BaseNode: TGmrNode; DerivingClassType: PCppClassType);
var
  Base: PCppBase;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_INHERITANCE_SPEC);
  Base := Factory.CreateBase(DerivingClassType);
  FillOutBase(BaseNode, Base);
end;

function PCodeModelBuilder.AnalyzeClassType(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace): PCppClassType;
var
  ClassType: PCppClassType;
  NodeClassSpec: TGmrNode;
  ScopedName: string;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR);
  NodeClassSpec := Pgmr.Find(PGMR_NODE_CLASS_SPEC, BaseNode);
  Assert(NodeClassSpec <> PGMR_NODE_NOT_EXISTS);
  ScopedName := GetClassScopedName(NodeClassSpec);
  ClassType := AcquireClassType(DeclaringNamespace, ScopedName);
  FillOutClassType(BaseNode, ClassType);
  Result := ClassType;
end;

function PCodeModelBuilder.AnalyzeClassType(BaseNode: TGmrNode; DeclaringType: PCppClassType): PCppClassType;
var
  ClassType: PCppClassType;
  NodeClassSpec: TGmrNode;
  ScopedName: string;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR);
  NodeClassSpec := Pgmr.Find(PGMR_NODE_CLASS_SPEC, BaseNode);
  Assert(NodeClassSpec <> PGMR_NODE_NOT_EXISTS);
  ScopedName := GetClassScopedName(NodeClassSpec);
  ClassType := AcquireClassType(DeclaringType, ScopedName);
  FillOutClassType(BaseNode, ClassType);
  Result := ClassType;
end;

function PCodeModelBuilder.AnalyzeClassType2(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace): PCppClassType;
var
  ClassType: PCppClassType;
  NodeClassSpec: TGmrNode;
  ScopedName: string;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR_EXT);
  NodeClassSpec := Pgmr.Find(PGMR_PATH_DECEXT_CLASS_SPEC, BaseNode);
  Assert(NodeClassSpec <> PGMR_NODE_NOT_EXISTS);
  ScopedName := GetClassScopedName(NodeClassSpec);
  ClassType := AcquireClassType(DeclaringNamespace, ScopedName);
  FillOutClassType2(BaseNode, ClassType);
  Result := ClassType;
end;

function PCodeModelBuilder.AnalyzeClassType2(BaseNode: TGmrNode; DeclaringType: PCppClassType): PCppClassType;
var
  ClassType: PCppClassType;
  NodeClassSpec: TGmrNode;
  ScopedName: string;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR_EXT);
  NodeClassSpec := Pgmr.Find(PGMR_PATH_DECEXT_CLASS_SPEC, BaseNode);
  Assert(NodeClassSpec <> PGMR_NODE_NOT_EXISTS);
  ScopedName := GetClassScopedName(NodeClassSpec);
  ClassType := AcquireClassType(DeclaringType, ScopedName);
  FillOutClassType2(BaseNode, ClassType);
  Result := ClassType;
end;

function PCodeModelBuilder.AnalyzeEnumeration(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace): PCppEnumeration;
var
  Enumeration: PCppEnumeration;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR);
  Enumeration := Factory.CreateEnumeration(DeclaringNamespace);
  FillOutEnumeration(BaseNode, Enumeration);
  Result := Enumeration;
end;

function PCodeModelBuilder.AnalyzeEnumeration(BaseNode: TGmrNode; DeclaringType: PCppClassType): PCppEnumeration;
var
  Enumeration: PCppEnumeration;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR);
  Enumeration := Factory.CreateEnumeration(DeclaringType);
  FillOutEnumeration(BaseNode, Enumeration);
  Result := Enumeration;
end;

function PCodeModelBuilder.AnalyzeEnumeration2(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace): PCppEnumeration;
var
  Enumeration: PCppEnumeration;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR_EXT);
  Enumeration := Factory.CreateEnumeration(DeclaringNamespace);
  FillOutEnumeration2(BaseNode, Enumeration);
  Result := Enumeration;
end;

function PCodeModelBuilder.AnalyzeEnumeration2(BaseNode: TGmrNode; DeclaringType: PCppClassType): PCppEnumeration;
var
  Enumeration: PCppEnumeration;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR_EXT);
  Enumeration := Factory.CreateEnumeration(DeclaringType);
  FillOutEnumeration2(BaseNode, Enumeration);
  Result := Enumeration;
end;

procedure PCodeModelBuilder.AnalyzeEnumerationItem(BaseNode: TGmrNode; Enumeration: PCppEnumeration);
var
  EnumItem: PCppEnumerationItem;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_ENUM_ENTRY);
  EnumItem := Factory.CreateEnumerationItem(Enumeration);
  FillOutEnumerationItem(BaseNode, EnumItem);
end;

procedure PCodeModelBuilder.AnalyzeFriendClass(BaseNode: TGmrNode; DeclaringClassType: PCppClassType);
var
  FriendClass: PCppFriendClass;
begin
  AssureNodeAs(BaseNode, [PGMR_NODE_TYPE_NAME, PGMR_NODE_CLASS_SPEC]);
  if Pgmr.GetNodeName(BaseNode) = PGMR_NODE_TYPE_NAME then begin
    FriendClass := Factory.CreateFriendClass(DeclaringClassType);
    if Pgmr.ExistsNode(BaseNode, PGMR_PATH_ENUM_REF_NAME) then
      FriendClass.Name := Pgmr.GetNodeValue(BaseNode, PGMR_PATH_ENUM_REF_NAME)
    else if Pgmr.ExistsNode(BaseNode, PGMR_NODE_SCOPED_CLASS_NAME) then
      FriendClass.Name := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_SCOPED_CLASS_NAME)
    else if Pgmr.ExistsNode(BaseNode, PGMR_PATH_TYPENAME_EXPR_NAME) then
      FriendClass.Name := Pgmr.GetNodeValue(BaseNode, PGMR_PATH_TYPENAME_EXPR_NAME)
    else if Pgmr.ExistsNode(BaseNode, PGMR_NODE_SCOPED_NAME) then
      FriendClass.Name := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_SCOPED_NAME);
  end
  else if Pgmr.GetNodeName(BaseNode) = PGMR_NODE_CLASS_SPEC then begin  // i.e PGMR_NODE_CLASS_SPEC
    Assert(not HasClassDefinition(BaseNode));
    FriendClass := Factory.CreateFriendClass(DeclaringClassType);
    FriendClass.Name := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_SCOPED_NAME);
  end;
end;

procedure PCodeModelBuilder.AnalyzeEllipsesParameter(BaseNode: TGmrNode; FunctionMember: PCppFunctionMember);
var
  Parameter: PCppParameter;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_ELLIPSES);
  Parameter := Factory.CreateParameter(FunctionMember);
  Parameter.Name := '...';
end;

procedure PCodeModelBuilder.AnalyzeMacro(BaseNode: TGmrNode; DeclaringType: PCppClassType);
var
  FunctionMember: PCppFunctionMember;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_LINED_MACRO_USING);
  FunctionMember := Factory.CreateFunctionMember(DeclaringType);
  FillOutMacro(BaseNode, FunctionMember);
end;

procedure PCodeModelBuilder.AnalyzeNamespaceDef(BaseNode: TGmrNode; Parent: PCppNamespace);
var
  Namespace: PCppNamespace;
  Name: string;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_NAMESPACE_DEF);
  Name := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_NAMESPACE_NAME);
  Namespace := AcquireNamespace(Parent, Name);
  FillOutNamespace(BaseNode, Namespace);
end;

procedure PCodeModelBuilder.AnalyzeNamespaceAliasDef(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace);
var
  Alias: PCppNamespaceAlias;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_NAMESPACE_ALIAS_DEF);
  Alias := Factory.CreateNamespaceAlias(DeclaringNamespace);
  FillOutNamespaceAlias(BaseNode, Alias);
end;

procedure PCodeModelBuilder.AnalyzeNamespaceAliasDef(BaseNode: TGmrNode; DeclaringType: PCppType);
var
  Alias: PCppNamespaceAlias;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_NAMESPACE_ALIAS_DEF);
  Alias := Factory.CreateNamespaceAlias(DeclaringType);
  FillOutNamespaceAlias(BaseNode, Alias);
end;

procedure PCodeModelBuilder.AnalyzeParameter(BaseNode: TGmrNode; FunctionMember: PCppFunctionMember);
var
  Parameter: PCppParameter;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_ARG_DECL);
  Parameter := Factory.CreateParameter(FunctionMember);
  FillOutParameter(BaseNode, Parameter);
end;

procedure PCodeModelBuilder.AnalyzeTemplate(BaseNode: TGmrNode; ApplyingType: PCppClassType);
var
  Template: PCppTemplate;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_TEMPLATE_SPEC);
  Template := Factory.CreateTemplate(ApplyingType);
  FillOutTemplate(BaseNode, Template);
end;

procedure PCodeModelBuilder.AnalyzeTemplateTypeParameter(BaseNode: TGmrNode; Template: PCppTemplate);
var
  TypeParameter: PCppTypeParameter;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_TEMPLATE_TYPEDEF_ARG);
  TypeParameter := Factory.CreateTypeParameter(Template);
  FillOutTypeParameter(BaseNode, TypeParameter);
end;

procedure PCodeModelBuilder.AnalyzeTemplateParameter(BaseNode: TGmrNode; Template: PCppTemplate);
var
  Parameter: PCppParameter;
begin
  AssureNodeAs(BaseNode, [PGMR_NODE_TEMPLATE_VARDECL_ARG, PGMR_NODE_TEMPLATE_TYPESPEC_ARG]);
  Parameter := Factory.CreateParameter(Template);
  FillOutParameterAsTemplateParameter(BaseNode, Parameter);
end;

procedure PCodeModelBuilder.AnalyzeTypeDef(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace);
var
  Nodes: PGmrNodeList;
  TypeDefList: TList;
  TypeDef: PCppTypeDef;
  Node: TGmrNode;
  I: Integer;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR);
  Assert(Pgmr.ExistsNode(BaseNode, PGMR_NODE_TYPEDEF_TAG));
  Nodes := PGmrNodeList.Create;
  TypeDefList := TList.Create;
  try
    CollectDeclItems(BaseNode, Nodes);
    for I := 0 to Nodes.Count - 1 do begin
      Node := Nodes.Nodes[I];
      TypeDef := Factory.CreateTypeDef(DeclaringNamespace);
      TypeDef.Name := Pgmr.GetNodeValue(Node, PGMR_PATH_DECLARATOR_SIMPLE_NAME);
      TypeDef.TypePointer := Pgmr.GetNodeValue(Node, PGMR_NODE_ITEM_ATTR_LIST);
      TypeDefList.Add(TypeDef);
    end;
    FillOutTypeDefs(BaseNode, TypeDefList);
  finally
    Nodes.Free;
    TypeDefList.Free;
  end;
end;

procedure PCodeModelBuilder.AnalyzeTypeDef(BaseNode: TGmrNode; DeclaringClassType: PCppClassType);
var
  Nodes: PGmrNodeList;
  TypeDefList: TList;
  TypeDef: PCppTypeDef;
  Node: TGmrNode;
  I: Integer;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR);
  Assert(Pgmr.ExistsNode(BaseNode, PGMR_NODE_TYPEDEF_TAG));
  Nodes := PGmrNodeList.Create;
  TypeDefList := TList.Create;
  try
    CollectDeclItems(BaseNode, Nodes);
    for I := 0 to Nodes.Count - 1 do begin
      Node := Nodes.Nodes[I];
      TypeDef := Factory.CreateTypeDef(DeclaringClassType);
      TypeDef.Name := Pgmr.GetNodeValue(Node, PGMR_PATH_DECLARATOR_SIMPLE_NAME);
      TypeDef.TypePointer := Pgmr.GetNodeValue(Node, PGMR_NODE_ITEM_ATTR_LIST);
      TypeDefList.Add(TypeDef);
    end;
    FillOutTypeDefs(BaseNode, TypeDefList);
  finally
    Nodes.Free;
    TypeDefList.Free;
  end;
end;

procedure PCodeModelBuilder.AnalyzeTypeDef2(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace); // with declarator_ext
begin
//
end;

procedure PCodeModelBuilder.AnalyzeTypeDef2(BaseNode: TGmrNode; DeclaringClassType: PCppClassType); // with declarator_ext
begin
//
end;

procedure PCodeModelBuilder.AnalyzeUsingDecl(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace);
var
  UsingDeclaration: PCppUsingDeclaration;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_USING_DECL);
  UsingDeclaration := Factory.CreateUsingDeclaration(DeclaringNamespace);
  FillOutUsingDecl(BaseNode, UsingDeclaration);
end;

procedure PCodeModelBuilder.AnalyzeUsingDirective(BaseNode: TGmrNode; DeclaringNamespace: PCppNamespace);
var
  UsingDeclaration: PCppUsingDeclaration;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_USING_DIRECTIVE);
  UsingDeclaration := Factory.CreateUsingDeclaration(DeclaringNamespace);
  FillOutUsingDirective(BaseNode, UsingDeclaration)
end;

procedure PCodeModelBuilder.FillOutBase(BaseNode: TGmrNode; ABase: PCppBase);
begin
  AssureNodeAs(BaseNode, PGMR_NODE_INHERITANCE_SPEC);
  ABase.IsVirtual := Pgmr.ExistsNode(BaseNode, PGMR_NODE_VIRTUAL_SPEC);
  ABase.AccessSpecifier := StringToAccessSpecifierKind(Pgmr.GetNodeValue(BaseNode, PGMR_NODE_ACCESS_SPEC));
  ABase.Name := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_SCOPED_NAME);
end;

procedure PCodeModelBuilder.FillOutClassType(BaseNode: TGmrNode; AClassType: PCppClassType);
var
  NodeClassSpec, NodeInherit, NodeClassDef: TGmrNode;
  NodeClassScope, NodeTemplate, NodeDeclAttrList: TGmrNode;
  SID: TGmrSearchID;
  Access: string;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR);
  NodeClassSpec := Pgmr.Find(PGMR_NODE_CLASS_SPEC, BaseNode);
  Assert(NodeClassSpec <> PGMR_NODE_NOT_EXISTS);
  // AClassType.Name is set in AcquireClassType
  AClassType.Key := StringToClassKeyKind(Pgmr.GetNodeValue(NodeClassSpec, PGMR_NODE_CLASS_KEY));
  // inheritance
  SID := Pgmr.StartSearch(PGMR_PATH_INHEIRANCE_SPEC , NodeClassSpec);
  NodeInherit := Pgmr.FindNext(SID);
  while NodeInherit <> PGMR_NODE_NOT_EXISTS do begin
    AnalyzeBase(NodeInherit, AClassType);
    NodeInherit := Pgmr.FindNext(SID);
  end;
  // template
  NodeTemplate := Pgmr.Find(PGMR_NODE_TEMPLATE_SPEC, BaseNode);
  if NodeTemplate <> PGMR_NODE_NOT_EXISTS then
    AnalyzeTemplate(NodeTemplate, AClassType);
  // modifiers
  NodeDeclAttrList := Pgmr.Find(PGMR_NODE_DECL_ATTR_LIST, BaseNode);
  if NodeDeclAttrList <> PGMR_NODE_NOT_EXISTS then
    ApplyDeclarationAttributesToClassType(NodeDeclAttrList, AClassType);
  // class declaration body
  NodeClassDef := Pgmr.Find(PGMR_NODE_CLASS_DEFINITION, NodeClassSpec);
  if NodeClassDef <> PGMR_NODE_NOT_EXISTS then begin
    Access := '';
    SID := Pgmr.StartSearch(PGMR_NODE_CLASS_SCOPE_DECL, NodeClassDef);
    NodeClassScope := Pgmr.FindNext(SID);
    while NodeClassScope <> PGMR_NODE_NOT_EXISTS do begin
      AnalyzeClassScopeDecl(NodeClassScope, AClassType, Access);
      NodeClassScope := Pgmr.FindNext(SID);
    end;
  end;
  // class_specifier_list is ignored.


  // (to do)
  // handle type_attr_list

  // more..
end;

procedure PCodeModelBuilder.FillOutClassType2(BaseNode: TGmrNode; AClassType: PCppClassType);
var
  NodeExtHeader, NodeExtBody: TGmrNode;
  NodeClassSpec, NodeInherit, NodeClassDef: TGmrNode;
  NodeClassScope, NodeTemplate, NodeMacroUsingList: TGmrNode;
  SID: TGmrSearchID;
  Access: string;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR_EXT);
  NodeExtHeader := Pgmr.Find(PGMR_NODE_DECLARATOR_EXT_HEADER, BaseNode);
  NodeExtBody := Pgmr.Find(PGMR_NODE_DECLARATOR_EXT_BODY, BaseNode);
  Assert(NodeExtBody <> PGMR_NODE_NOT_EXISTS);
  NodeClassSpec := Pgmr.Find(PGMR_NODE_CLASS_SPEC, NodeExtBody);
  Assert(NodeClassSpec <> PGMR_NODE_NOT_EXISTS);
  // AClassType.Name is set in AcquireClassType
  AClassType.Key := StringToClassKeyKind(Pgmr.GetNodeValue(NodeClassSpec, PGMR_NODE_CLASS_KEY));
  // inheritance
  SID := Pgmr.StartSearch(PGMR_PATH_INHEIRANCE_SPEC , NodeClassSpec);
  NodeInherit := Pgmr.FindNext(SID);
  while NodeInherit <> PGMR_NODE_NOT_EXISTS do begin
    AnalyzeBase(NodeInherit, AClassType);
    NodeInherit := Pgmr.FindNext(SID);
  end;
  if NodeExtHeader <> PGMR_NODE_NOT_EXISTS then begin
    // template
    NodeTemplate := Pgmr.Find(PGMR_NODE_TEMPLATE_SPEC, NodeExtHeader);
    if NodeTemplate <> PGMR_NODE_NOT_EXISTS then
      AnalyzeTemplate(NodeTemplate, AClassType);
    // modifiers
    NodeMacroUsingList := Pgmr.Find(PGMR_NODE_MACRO_USING_LIST, NodeExtHeader);
    if NodeMacroUsingList <> PGMR_NODE_NOT_EXISTS then
      ApplyDeclarationAttributesToClassType(NodeMacroUsingList, AClassType);
  end;      
  // class declaration body
  NodeClassDef := Pgmr.Find(PGMR_NODE_CLASS_DEFINITION, NodeClassSpec);
  if NodeClassDef <> PGMR_NODE_NOT_EXISTS then begin
    Access := '';
    SID := Pgmr.StartSearch(PGMR_NODE_CLASS_SCOPE_DECL, NodeClassDef);
    NodeClassScope := Pgmr.FindNext(SID);
    while NodeClassScope <> PGMR_NODE_NOT_EXISTS do begin
      AnalyzeClassScopeDecl(NodeClassScope, AClassType, Access);
      NodeClassScope := Pgmr.FindNext(SID);
    end;
  end;
  // class_specifier_list is ignored.
      


  // (to do)
  // more...
end;

procedure PCodeModelBuilder.FillOutDataMember(BaseNode: TGmrNode; ADataMember: PCppDataMember);
var
  NodeScopedName: TGmrNode;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECL_ITEM);
  NodeScopedName := PGmr.Find(PGMR_PATH_DECLARATOR_SCOPED_NAME, BaseNode);
  if NodeScopedName <> PGMR_NODE_NOT_EXISTS then begin
    ADataMember.Name := Pgmr.GetNodeValue(NodeScopedName, PGMR_NODE_CLASS_NAME);
    // scoped_qualifier ignored.
  end;
  ADataMember.BitField := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_BIT_OFFSET);
  if Pgmr.ExistsNode(BaseNode, PGMR_PATH_INITIALIZER_EXPR) then
    ADataMember.Initializer := Pgmr.GetNodeValue(BaseNode, PGMR_PATH_INITIALIZER_EXPR)
  else if Pgmr.ExistsNode(BaseNode, PGMR_NODE_INITIALIZER_LIST) then
    ADataMember.Initializer := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_INITIALIZER_LIST)
  else if Pgmr.ExistsNode(BaseNode, PGMR_PATH_INITIALIZER_ARG_LIST) then begin
    // do something...
  end;
  ADataMember.TypePointer := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_ITEM_ATTR_LIST);

  // (to do)
  // handle group_decl_item
  // handle array_spec_list
end;

procedure PCodeModelBuilder.FillOutEnumeration(BaseNode: TGmrNode; AEnumeration: PCppEnumeration);
var
  NodeEnum, NodeEnumEntry: TGmrNode;
  SID: TGmrSearchID;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR);
  NodeEnum := Pgmr.Find(PGMR_NODE_ENUM_SPEC, BaseNode);
  if NodeEnum <> PGMR_NODE_NOT_EXISTS then begin
    AEnumeration.Name := Pgmr.GetNodeValue(NodeEnum, PGMR_NODE_ENUM_NAME);
    SID := Pgmr.StartSearch(PGMR_PATH_ENUM_ENTRY, NodeEnum);
    NodeEnumEntry := Pgmr.FindNext(SID);
    while NodeEnumEntry <> PGMR_NODE_NOT_EXISTS do begin
      AnalyzeEnumerationItem(NodeEnumEntry, AEnumeration);
      NodeEnumEntry := Pgmr.FindNext(SID);
    end;
  end;

  // (to do)
  // handle typedef_tag
end;

procedure PCodeModelBuilder.FillOutEnumeration2(BaseNode: TGmrNode; AEnumeration: PCppEnumeration);
var
  NodeDeclExtBody: TGmrNode;
  NodeEnum, NodeEnumEntry: TGmrNode;
  SID: TGmrSearchID;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR_EXT);
  NodeDeclExtBody := Pgmr.Find(PGMR_NODE_DECLARATOR_EXT_BODY, BaseNode);
  Assert(NodeDeclExtBody <> PGMR_NODE_NOT_EXISTS);
  NodeEnum := Pgmr.Find(PGMR_NODE_ENUM_SPEC, NodeDeclExtBody);
  if NodeEnum <> PGMR_NODE_NOT_EXISTS then begin
    AEnumeration.Name := Pgmr.GetNodeValue(NodeEnum, PGMR_NODE_ENUM_NAME);
    SID := Pgmr.StartSearch(PGMR_PATH_ENUM_ENTRY, NodeEnum);
    NodeEnumEntry := Pgmr.FindNext(SID);
    while NodeEnumEntry <> PGMR_NODE_NOT_EXISTS do begin
      AnalyzeEnumerationItem(NodeEnumEntry, AEnumeration);
      NodeEnumEntry := Pgmr.FindNext(SID);
    end;
  end;

  // (to do)
  // handle typedef_tag
end;

procedure PCodeModelBuilder.FillOutEnumerationItem(BaseNode: TGmrNode; AEnumerationItem: PCppEnumerationItem);
begin
  AssureNodeAs(BaseNode, PGMR_NODE_ENUM_ENTRY);
  AEnumerationItem.Name := PGmr.GetNodeValue(BaseNode, PGMR_NODE_IDENT);
  AEnumerationItem.Value := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_EXPRESSION);
end;

procedure PCodeModelBuilder.FillOutFunctionMember(BaseNode: TGmrNode; AFunctionMember: PCppFunctionMember);
var
  NodeStuff, NodeArgList, NodeArg: TGmrNode;
  NodeScopedName, NodeOpName: TGmrNode;
  I: Integer;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECL_ITEM);
  NodeScopedName := PGmr.Find(PGMR_PATH_DECLARATOR_SCOPED_NAME, BaseNode);
  if NodeScopedName <> PGMR_NODE_NOT_EXISTS then begin
    NodeOpName := Pgmr.Find(PGMR_NODE_OPERATOR_NAME, NodeScopedName);
    if NodeOpName <> PGMR_NODE_NOT_EXISTS then begin
      AFunctionMember.IsOperator := True;
      AFunctionMember.Name := Pgmr.GetValue(NodeOpName);
    end
    else begin
      AFunctionMember.Name := Pgmr.GetNodeValue(NodeScopedName, PGMR_NODE_CLASS_NAME);
      AFunctionMember.IsDestructor := Pgmr.ExistsNode(NodeScopedName, PGMR_NODE_DESTRUCTOR_TAG);
      AFunctionMember.IsConstructor := (AFunctionMember.Name = AFunctionMember.DeclaringClassType.Name)
        and (not AFunctionMember.IsConstructor);
    end;
    // scoped_qualifier ignored.
  end;
  NodeStuff := PGmr.Find(PGMR_NODE_METHOD_STUFF, BaseNode);
  if NodeStuff <> PGMR_NODE_NOT_EXISTS then begin
    NodeArgList := Pgmr.Find(PGMR_NODE_ARG_DECL_LIST, NodeStuff);
    if NodeArgList <> PGMR_NODE_NOT_EXISTS then
      for I := 0 to Pgmr.GetNumChildren(NodeArgList) - 1 do begin
        NodeArg := Pgmr.GetChild(NodeArgList, I);
        if Pgmr.GetNodeName(NodeArg) = PGMR_NODE_ARG_DECL then
          AnalyzeParameter(NodeArg, AFunctionMember)
        else if Pgmr.GetNodeName(NodeArg) = PGMR_NODE_ELLIPSES then
          AnalyzeEllipsesParameter(NodeArg, AFunctionMember);
      end;
    AFunctionMember.IsConst := Pgmr.ExistsNode(NodeStuff, PGMR_NODE_CONST_SPEC);
    AFunctionMember.Throw := Pgmr.GetNodeValue(NodeStuff, PGMR_PATH_THROW_ARG_DECL_LIST);
    AFunctionMember.IsPureVirtual := Pgmr.ExistsNode(NodeStuff, PGMR_NODE_PURE_VIRTUAL);
  end;
  AFunctionMember.ReturnTypePointer := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_ITEM_ATTR_LIST);

  // (to do)
  // handle group_decl_item
end;

procedure PCodeModelBuilder.FillOutMacro(BaseNode: TGmrNode; AFunctionMember: PCppFunctionMember);
var
  Parameter: PCppParameter;
  NodeMacroUsing: TGmrNode;
  NodeMacroParam: TGmrNode;
  SID: TGmrSearchID;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_LINED_MACRO_USING);
  AFunctionMember.IsMacro := True;
  NodeMacroUsing := Pgmr.Find(PGMR_NODE_MACRO_USING, BaseNode);
  if NodeMacroUsing <> PGMR_NODE_NOT_EXISTS then begin
    AFunctionMember.Name := Pgmr.GetNodeValue(NodeMacroUsing, PGMR_NODE_MACRO_NAME);
    SID := Pgmr.StartSearch(PGMR_PATH_MACRO_PARAMETER, NodeMacroUsing);
    NodeMacroParam := Pgmr.FindNext(SID);
    while NodeMacroParam <> PGMR_NODE_NOT_EXISTS do begin
      Parameter := Factory.CreateParameter(AFunctionMember);
      Parameter.Name := Pgmr.GetValue(NodeMacroParam);
      Parameter.Type_ := '';
      NodeMacroParam := Pgmr.FindNext(SID);
    end;
  end;
end;

// for declarator
procedure PCodeModelBuilder.FillOutMembers(BaseNode: TGmrNode; MemberList: TList; AccessSpec: string);

  function GetTypeName(Node: TGmrNode): string;
  var
    NodeClassSpec, NodeEnumSpec, NodeTypeName: TGmrNode;
  begin
    AssureNodeAs(Node, PGMR_NODE_DECLARATOR);
    Result := '';
    NodeClassSpec := Pgmr.Find(PGMR_NODE_CLASS_SPEC, Node);
    if NodeClassSpec <> PGMR_NODE_NOT_EXISTS then begin
      Result := Pgmr.GetNodeValue(NodeClassSpec, PGMR_NODE_SCOPED_NAME);
      Exit;
    end;
    NodeEnumSpec := Pgmr.Find(PGMR_NODE_ENUM_SPEC, Node);
    if NodeEnumSpec <> PGMR_NODE_NOT_EXISTS then begin
      Result := Pgmr.GetNodeValue(NodeEnumSpec, PGMR_NODE_ENUM_NAME);
      Exit;
    end;
    NodeTypeName := Pgmr.Find(PGMR_NODE_TYPE_NAME, Node);
    if NodeTypeName <> PGMR_NODE_NOT_EXISTS then
      Result := Pgmr.GetValue(NodeTypeName); // more consider
  end;

var
  Member: PCppMember;
  NodeDeclAttrList: TGmrNode;
  T: string;
  I: Integer;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR);

  T := GetTypeName(BaseNode);
  for I := 0 to MemberList.Count - 1 do begin
    Member := MemberList.Items[I];
    Member.AccessSpecifier := StringToAccessSpecifierKind(AccessSpec);
    if Member is PCppDataMember then
      (Member as PCppDataMember).Type_ := T
    else if Member is PCppFunctionMember then
      (Member as PCppFunctionMember).ReturnType := T;
  end;

  NodeDeclAttrList := Pgmr.Find(PGMR_NODE_DECL_ATTR_LIST, BaseNode);
  if NodeDeclAttrList <> PGMR_NODE_NOT_EXISTS then begin
    for I := 0 to MemberList.Count - 1 do begin
      Member := MemberList.Items[I];
      if Member is PCppDataMember then
        ApplyDeclarationAttributesToDataMember(NodeDeclAttrList, Member as PCppDataMember)
      else if Member is PCppFunctionMember then
        ApplyDeclarationAttributesToFunctionMember(NodeDeclAttrList, Member as PCppFunctionMember);
    end;
  end;

  // (to do)
  // handle type_attr
  // consider more typenames such enum_reference, class-keyed type, typename_expr
end;

procedure PCodeModelBuilder.FillOutNamespace(BaseNode: TGmrNode; ANamespace: PCppNamespace);
var
  NodeNSBody: TGmrNode;
  I: Integer;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_NAMESPACE_DEF);
  // ANamespace.Name is set in AcquireNamespace
  NodeNSBody := Pgmr.Find(PGMR_NODE_NAMESPACE_BODY, BaseNode);
  if NodeNSBody <> PGMR_NODE_NOT_EXISTS then
    for I := 0 to Pgmr.GetNumChildren(NodeNSBody) - 1 do
      AnalyzeFileScopeDeclInNamespace(Pgmr.GetChild(NodeNSBody, I), ANamespace);
end;

procedure PCodeModelBuilder.FillOutNamespaceAlias(BaseNode: TGmrNode; ANamespaceAlias: PCppNamespaceAlias);
begin
  AssureNodeAs(BaseNode, PGMR_NODE_NAMESPACE_ALIAS_DEF);
  ANamespaceAlias.Name := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_NAMESPACE_ALIAS);
  ANamespaceAlias.Autonym := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_SCOPED_NAME);
end;

procedure PCodeModelBuilder.FillOutParameter(BaseNode: TGmrNode; AParameter: PCppParameter);
var
  NodeDeclAttrList: TGmrNode;
  NodeDeclItem, NodeTypeName, NodeChild: TGmrNode;
  Attrs: PDeclarationAttributes;
  S: string;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_ARG_DECL);
  NodeDeclAttrList := Pgmr.Find(PGMR_NODE_DECL_ATTR_LIST, BaseNode);
  if NodeDeclAttrList <> PGMR_NODE_NOT_EXISTS then begin
    Attrs := GetDeclarationAttributes(NodeDeclAttrList);
    ApplyDeclarationAttributesToParameter(NodeDeclAttrList, AParameter);
  end;

  // production 2, 4
  NodeTypeName := Pgmr.Find(PGMR_NODE_TYPE_NAME, BaseNode);
  if NodeTypeName <> PGMR_NODE_NOT_EXISTS then begin
    NodeChild := Pgmr.GetChild(NodeTypeName, 0);
    S := Pgmr.GetNodeName(NodeChild);
    if S = PGMR_NODE_BASIC_TYPE then
      AParameter.Type_ := Pgmr.GetValue(NodeChild)
    else if S = PGMR_NODE_ENUM_REFERENCE then
      AParameter.Type_ := Pgmr.GetNodeValue(NodeChild, PGMR_NODE_ENUM_NAME)
    else if S = PGMR_NODE_CLASS_KEY then
      AParameter.Type_ := Pgmr.GetNodeValue(NodeTypeName, PGMR_PATH_SCOPED_CLASS_NAME_CLASS_NAME)
    else if S = PGMR_NODE_TYPENAME_EXPR then
      AParameter.Type_ := PGmr.GetNodeValue(NodeChild, PGMR_NODE_SCOPED_NAME)
    else if S = PGMR_NODE_SCOPED_NAME then
      AParameter.Type_ := Pgmr.GetValue(NodeChild)
    else begin
      // uuidof_expr is ignored.
    end;
  end;

  // production 1, 2, 3
  NodeDeclItem := Pgmr.Find(PGMR_NODE_DECL_ITEM, BaseNode);
  if NodeDeclItem <> PGMR_NODE_NOT_EXISTS then begin
    AParameter.TypePointer := Pgmr.GetNodeValue(NodeDeclItem, PGMR_NODE_ITEM_ATTR_LIST);
    AParameter.Name := Pgmr.GetNodeValue(NodeDeclItem, PGMR_NODE_DECLARATOR_NAME);
  end;

  if Pgmr.ExistsNode(BaseNode, PGMR_PATH_INITIALIZER_EXPR) then
    AParameter.DefaultValue := Pgmr.GetNodeValue(BaseNode, PGMR_PATH_INITIALIZER_EXPR)
  else if Pgmr.ExistsNode(BaseNode, PGMR_NODE_INITIALIZER_LIST) then
    AParameter.DefaultValue := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_INITIALIZER_LIST)
  else if Pgmr.ExistsNode(BaseNode, PGMR_PATH_INITIALIZER_ARG_LIST) then begin
    // do something...
  end;

  // (to do)
  // handle array_spec_list
end;

procedure PCodeModelBuilder.FillOutParameterAsTemplateParameter(BaseNode: TGmrNode; AParameter: PCppParameter);

  function GetParameterTypeStr(Node: TGmrNode): string;
  var
    NodeClassSpec, NodeEnumSpec, NodeTypeName: TGmrNode;
  begin
    AssureNodeAs(Node, PGMR_NODE_TYPE_SPEC);
    Result := '';
    NodeClassSpec := Pgmr.Find(PGMR_NODE_CLASS_SPEC, Node);
    if NodeClassSpec <> PGMR_NODE_NOT_EXISTS then begin
      Result := Pgmr.GetNodeValue(NodeClassSpec, PGMR_NODE_SCOPED_NAME);
      Exit;
    end;
    NodeEnumSpec := Pgmr.Find(PGMR_NODE_ENUM_SPEC, Node);
    if NodeEnumSpec <> PGMR_NODE_NOT_EXISTS then begin
      Result := Pgmr.GetNodeValue(NodeEnumSpec, PGMR_NODE_ENUM_NAME);
      Exit;
    end;
    NodeTypeName := Pgmr.Find(PGMR_NODE_TYPE_NAME, Node);
    if NodeEnumSpec <> PGMR_NODE_NOT_EXISTS then
      Result := ExtractSimpleTypeName(NodeTypeName);
  end;

var
  NodeName: string;
  NodeTypeSpec, NodeTempInit: TGmrNode;
begin
  AssureNodeAs(BaseNode, [PGMR_NODE_TEMPLATE_VARDECL_ARG, PGMR_NODE_TEMPLATE_TYPESPEC_ARG]);
  NodeName := Pgmr.GetNodeName(BaseNode);
  if NodeName = PGMR_NODE_TEMPLATE_VARDECL_ARG then
    AParameter.Name := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_IDENT);
  NodeTypeSpec := Pgmr.Find(PGMR_NODE_TYPE_SPEC, BaseNode);
  if NodeTypeSpec <> PGMR_NODE_NOT_EXISTS then
    AParameter.Type_ := GetParameterTypeStr(NodeTypeSpec);
  NodeTempInit := Pgmr.Find(PGMR_NODE_TEMPLATE_INITIALIZER, BaseNode);
  if NodeTempInit <> PGMR_NODE_NOT_EXISTS then begin
    if Pgmr.ExistsNode(NodeTempInit, PGMR_NODE_TYPE_SPEC) then
      AParameter.DefaultValue := Pgmr.GetNodeValue(NodeTempInit, PGMR_NODE_TYPE_SPEC)
    else if Pgmr.ExistsNode(NodeTempInit, PGMR_NODE_EXPRESSION) then
      AParameter.DefaultValue := Pgmr.GetNodeValue(NodeTempInit, PGMR_NODE_EXPRESSION);
  end;
  // (to do)
  // modifier like const, virtual, etc...
end;

procedure PCodeModelBuilder.FillOutTemplate(BaseNode: TGmrNode; ATemplate: PCppTemplate);
var
  NodeTempArg: TGmrNode;
  NodeTypedefArg, NodeVardeclArg, NodeTypespecArg: TGmrNode;
  SID: Integer;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_TEMPLATE_SPEC);
  SID := Pgmr.StartSearch(PGMR_PATH_TEMPLATE_DECL_ARG, BaseNode);
  NodeTempArg := Pgmr.FindNext(SID);
  while NodeTempArg <> PGMR_NODE_NOT_EXISTS do begin
    NodeTypedefArg := Pgmr.Find(PGMR_NODE_TEMPLATE_TYPEDEF_ARG, NodeTempArg);
    if NodeTypedefArg <> PGMR_NODE_NOT_EXISTS then
      AnalyzeTemplateTypeParameter(NodeTypedefArg, ATemplate);
    NodeVardeclArg := Pgmr.Find(PGMR_NODE_TEMPLATE_VARDECL_ARG, NodeTempArg);
    if NodeVardeclArg <> PGMR_NODE_NOT_EXISTS then
      AnalyzeTemplateParameter(NodeVardeclArg, ATemplate);
    NodeTypespecArg := Pgmr.Find(PGMR_NODE_TEMPLATE_TYPESPEC_ARG, NodeTempArg);
    if NodeTypespecArg <> PGMR_NODE_NOT_EXISTS then
      AnalyzeTemplateParameter(NodeTypespecArg, ATemplate);
    NodeTempArg := Pgmr.FindNext(SID);
  end;
  // (to do)
  // handle template_prefix
end;

procedure PCodeModelBuilder.FillOutTypeDefs(BaseNode: TGmrNode; TypeDefList: TList);
var
  Type_: PCppType;
  TypeDef: PCppTypeDef;
  I: Integer;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECLARATOR);
  if TypeDefList.Count > 0 then begin
    Type_ := nil;
    TypeDef := TypeDefList.Items[0];
    if Pgmr.ExistsNode(BaseNode, PGMR_NODE_CLASS_SPEC) then begin
      if TypeDef.DeclaringNamespace <> nil then
        Type_ := AnalyzeClassType(BaseNode, TypeDef.DeclaringNamespace)
      else if TypeDef.DeclaringClassType <> nil then
        Type_ := AnalyzeClassType(BaseNode, TypeDef.DeclaringClassType);
    end
    else if Pgmr.ExistsNode(BaseNode, PGMR_NODE_ENUM_SPEC) then begin
      if TypeDef.DeclaringNamespace <> nil then
        Type_ := AnalyzeEnumeration(BaseNode, TypeDef.DeclaringNamespace)
      else if TypeDef.DeclaringClassType <> nil then
        Type_ := AnalyzeEnumeration(BaseNode, TypeDef.DeclaringClassType);
    end;
    for I := 0 to TypeDefList.Count - 1 do begin
      TypeDef := TypeDefList.Items[I];
      TypeDef.SynonymType := Type_;
      if Pgmr.ExistsNode(BaseNode, PGMR_NODE_TYPE_NAME) then
        TypeDef.Definition := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_TYPE_NAME)
      else
        TypeDef.Definition := '';
    end;
  end;    
end;

procedure PCodeModelBuilder.FillOutTypeParameter(BaseNode: TGmrNode; ATypeParameter: PCppTypeParameter);
var
  NodeTempInit: TGmrNode;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_TEMPLATE_TYPEDEF_ARG);
  ATypeParameter.ArgumentKind := StringToTypeParameterKind(Pgmr.GetNodeValue(BaseNode, PGMR_NODE_TEMPLATE_TYPEDEF_KEY));
  ATypeParameter.Name := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_IDENT);
  NodeTempInit := Pgmr.Find(PGMR_NODE_TEMPLATE_INITIALIZER, BaseNode);
  if NodeTempInit <> PGMR_NODE_NOT_EXISTS then begin
    if Pgmr.ExistsNode(NodeTempInit, PGMR_NODE_TYPE_SPEC) then
      ATypeParameter.Initializer := Pgmr.GetNodeValue(NodeTempInit, PGMR_NODE_TYPE_SPEC)
    else if Pgmr.ExistsNode(NodeTempInit, PGMR_NODE_EXPRESSION) then
      ATypeParameter.Initializer := Pgmr.GetNodeValue(NodeTempInit, PGMR_NODE_EXPRESSION);
  end;
end;

procedure PCodeModelBuilder.FillOutUsingDecl(BaseNode: TGmrNode; AUsingDeclaration: PCppUsingDeclaration);
begin
  AssureNodeAs(BaseNode, PGMR_NODE_USING_DECL);
  AUsingDeclaration.Name := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_SCOPED_NAME);

  // (to do)
  // set Framement property
end;

procedure PCodeModelBuilder.FillOutUsingDirective(BaseNode: TGmrNode; AUsingDeclaration: PCppUsingDeclaration);
begin
  AssureNodeAs(BaseNode, PGMR_NODE_USING_DIRECTIVE);
  AUsingDeclaration.Name := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_SCOPED_NAME);

  // (to do)
  // set Framement property
end;

procedure PCodeModelBuilder.PutDeclarationAttribute(var Attrs: PDeclarationAttributes; Value: string);
begin
  if Value = PGMR_TOKEN_CONST then
    Attrs := Attrs + [daConst]
  else if Value = PGMR_TOKEN_MUTABLE then
    Attrs := Attrs + [daMutable]
  else if Value = PGMR_TOKEN_AUTO then
    Attrs := Attrs + [daAuto]
  else if Value = PGMR_TOKEN_REGISTER then
    Attrs := Attrs + [daRegister]
  else if Value = PGMR_TOKEN_STATIC then
    Attrs := Attrs + [daStatic]
  else if Value = PGMR_TOKEN_EXTERN then
    Attrs := Attrs + [daExtern]
  else if Value = PGMR_TOKEN_VOLATILE then
    Attrs := Attrs + [daVolatile]
  else if Value = PGMR_TOKEN_INLINE then
    Attrs := Attrs + [daInline]
  else if (Value = PGMR_TOKEN__INLINE) or (Value = PGMR_TOKEN___INLINE) then
    Attrs := Attrs + [da__Inline]
  else if Value = PGMR_TOKEN___FORCEINLINE then
    Attrs := Attrs + [daForceInline]
  else if Value = PGMR_TOKEN_VIRTUAL then
    Attrs := Attrs + [daVirtual]
  else if Value = PGMR_TOKEN_EXPLICIT then
    Attrs := Attrs + [daExplicit]
  else if (Value = PGMR_TOKEN__CDECL) or (Value = PGMR_TOKEN___CDECL) then
    Attrs := Attrs + [daCdecl]
  else if (Value = PGMR_TOKEN__FASTCALL) or (Value = PGMR_TOKEN___FASTCALL) then
    Attrs := Attrs + [daFastcall]
  else if (Value = PGMR_TOKEN__STDCALL) or (Value = PGMR_TOKEN___STDCALL) then
    Attrs := Attrs + [daStdcall]
  else if Value = PGMR_TOKEN_FRIEND then
    Attrs := Attrs + [daFriend]
  else if Value = PGMR_TOKEN___EVENT then
    Attrs := Attrs + [daEvent]
  else if Value = PGMR_TOKEN___ABSTRACT then
    Attrs := Attrs + [daAbstract]
  else if Value = PGMR_TOKEN___DELEGATE then
    Attrs := Attrs + [daDelegate]
  else if Value = PGMR_TOKEN___GC then
    Attrs := Attrs + [daGc]
  else if Value = PGMR_TOKEN___NOGC then
    Attrs := Attrs + [daNogc]
  else if Value = PGMR_TOKEN___PIN then
    Attrs := Attrs + [daPin]
  else if Value = PGMR_TOKEN___PROPERTY then
    Attrs := Attrs + [daProperty]
  else if Value = PGMR_TOKEN___SEALED then
    Attrs := Attrs + [daSealed]
  else if Value = PGMR_TOKEN___VALUE then
    Attrs := Attrs + [daValue];
end;

function PCodeModelBuilder.GetDeclarationAttributes(BaseNode: TGmrNode): PDeclarationAttributes;
var
  NodeListItem: TGmrNode;
  Attrs: PDeclarationAttributes;
  I: Integer;
begin
  AssureNodeAs(BaseNode, [PGMR_NODE_DECL_ATTR_LIST, PGMR_NODE_MACRO_USING_LIST]);
  Attrs := [];
  for I := 0 to Pgmr.GetNumChildren(BaseNode) - 1 do begin
    NodeListItem := Pgmr.GetChild(BaseNode, I);
    AssureNodeAs(NodeListItem, [PGMR_NODE_DECL_ATTR, PGMR_NODE_MACRO_USING]);
    PutDeclarationAttribute(Attrs, Pgmr.GetValue(NodeListItem));
  end;
  Result := Attrs;
end;

function PCodeModelBuilder.GetDeclSpecStr(Node: TGmrNode): string;
begin
  if (Pgmr.GetValue(Node) = PGMR_TOKEN__EXPORT)
    or (Pgmr.GetValue(Node) = PGMR_TOKEN___EXPORT) then
    Result := 'dllexport'
  else
    Result := Pgmr.GetNodeValue(Node, PGMR_PATH_DECLSPEC_EXPRESSION);
end;

procedure PCodeModelBuilder.ApplyDeclarationAttributesToClassType(BaseNode: TGmrNode; AClassType: PCppClassType);
var
  Attrs: PDeclarationAttributes;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECL_ATTR_LIST);
  Attrs := GetDeclarationAttributes(BaseNode);
  AClassType.IsAbstract := (daAbstract in Attrs);
  AClassType.IsGc := (daGc in Attrs);
  AClassType.IsNogc := (daNogc in Attrs);
  AClassType.IsSealed := (daSealed in Attrs);
  AClassType.IsValue := (daValue in Attrs);
  AClassType.IsEvent := (daEvent in Attrs);
end;

procedure PCodeModelBuilder.ApplyDeclarationAttributesToDataMember(BaseNode: TGmrNode; ADataMember: PCppDataMember);
var
  NodeBasedExpr, NodeDeclSpec: TGmrNode;
  Attrs: PDeclarationAttributes;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECL_ATTR_LIST);
  Attrs := GetDeclarationAttributes(BaseNode);
  ADataMember.IsConst := (daConst in Attrs);
  ADataMember.IsMutable := (daMutable in Attrs);
  ADataMember.IsVolatile := (daVolatile in Attrs);
  ADataMember.IsStatic := (daStatic in Attrs);
  ADataMember.IsEvent := (daEvent in Attrs);
  ADataMember.IsGc := (daGc in Attrs);
  ADataMember.IsNogc := (daNogc in Attrs);
  NodeBasedExpr := Pgmr.Find(PGMR_PATH_BASED_EXPRESSION, BaseNode);
  if NodeBasedExpr <> PGMR_NODE_NOT_EXISTS then
    ADataMember.Based := Pgmr.GetValue(NodeBasedExpr);
  NodeDeclSpec := Pgmr.Find(PGMR_PATH_DECLSPEC_SPECIFIER, BaseNode);
  if NodeDeclSpec <> PGMR_NODE_NOT_EXISTS then
    ADataMember.Declspec := GetDeclSpecStr(NodeDeclSpec)
  else begin
    NodeDeclSpec := Pgmr.Find(PGMR_PATH_FCT_DECLSPEC_SPECIFIER, BaseNode);
    if NodeDeclSpec <> PGMR_NODE_NOT_EXISTS then
      ADataMember.Declspec := GetDeclSpecStr(NodeDeclSpec);
  end;
end;

procedure PCodeModelBuilder.ApplyDeclarationAttributesToFunctionMember(BaseNode: TGmrNode; AFunctionMember: PCppFunctionMember);
var
  NodeDeclSpec: TGmrNode;
  Attrs: PDeclarationAttributes;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECL_ATTR_LIST);
  Attrs := GetDeclarationAttributes(BaseNode);
  AFunctionMember.IsStatic := (daStatic in Attrs);
  AFunctionMember.IsInline := (daInline in Attrs);
  AFunctionMember.Is__Inline := (da__Inline in Attrs);
  AFunctionMember.IsForceInline := (daForceInline in Attrs);
  AFunctionMember.IsVirtual := (daVirtual in Attrs);
  AFunctionMember.IsFriend := (daFriend in Attrs);
  AFunctionMember.IsSealed := (daSealed in Attrs);
  AFunctionMember.IsEvent := (daEvent in Attrs);
  AFunctionMember.IsProperty := (daProperty in Attrs);
  AFunctionMember.IsDelegate := (daDelegate in Attrs);
  if (daCdecl in Attrs) then
    AFunctionMember.CallingConvention := ckCdecl
  else if (daStdcall in Attrs) then
    AFunctionMember.CallingConvention := ckStdcall
  else if (daFastcall in Attrs) then
    AFunctionMember.CallingConvention := ckFastcall
  else
    AFunctionMember.CallingConvention := ckNotDefined;
  NodeDeclSpec := Pgmr.Find(PGMR_PATH_DECLSPEC_SPECIFIER, BaseNode);
  if NodeDeclSpec <> PGMR_NODE_NOT_EXISTS then
    AFunctionMember.Declspec := GetDeclSpecStr(NodeDeclSpec)
  else begin
    NodeDeclSpec := Pgmr.Find(PGMR_PATH_FCT_DECLSPEC_SPECIFIER, BaseNode);
    if NodeDeclSpec <> PGMR_NODE_NOT_EXISTS then
      AFunctionMember.Declspec := GetDeclSpecStr(NodeDeclSpec);
  end;
end;

procedure PCodeModelBuilder.ApplyDeclarationAttributesToParameter(BaseNode: TGmrNode; AParameter: PCppParameter);
var
  Attrs: PDeclarationAttributes;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_DECL_ATTR_LIST);
  Attrs := GetDeclarationAttributes(BaseNode);
  AParameter.IsConst := (daConst in Attrs);
end;

function PCodeModelBuilder.GetClassScopedName(BaseNode: TGmrNode): string;
begin
  AssureNodeAs(BaseNode, PGMR_NODE_CLASS_SPEC);
  Result := '';
  if Pgmr.ExistsNode(BaseNode, PGMR_NODE_SCOPED_NAME) then
    Result := Pgmr.GetNodeValue(BaseNode, PGMR_NODE_SCOPED_NAME)
  else if Pgmr.ExistsNode(BaseNode, PGMR_PATH_MACRO_SCOPED_NAME) then
    Result := Pgmr.GetNodeValue(BaseNode, PGMR_PATH_MACRO_SCOPED_NAME)
end;

function PCodeModelBuilder.ExtractSimpleTypeName(Node: TGmrNode): string;
var
  Child: TGmrNode;
  S: string;
begin
  AssureNodeAs(Node, PGMR_NODE_TYPE_NAME);
  Child := Pgmr.GetChild(Node, 0);
  if Child <> PGMR_NODE_NOT_EXISTS then begin
    S := Pgmr.GetNodeName(Child);
    if S = PGMR_NODE_BASIC_TYPE then
      Result := Pgmr.GetValue(Child)
    else if S = PGMR_NODE_ENUM_REFERENCE then
      Result := Pgmr.GetNodeValue(Child, PGMR_NODE_ENUM_NAME)
    else if S = PGMR_NODE_CLASS_KEY then
      Result := Pgmr.GetNodeValue(Node, PGMR_NODE_SCOPED_CLASS_NAME)
    else if S = PGMR_NODE_TYPENAME_EXPR then
      Result := Pgmr.GetNodeValue(Child, PGMR_NODE_SCOPED_NAME)
    else if S = PGMR_NODE_UUIDOF_EXPR then
      Result := ''
    else if S = PGMR_NODE_SCOPED_NAME then
      Result := Pgmr.GetValue(Child)
    else
      Result := '';
  end;
end;

function PCodeModelBuilder.IsFunctionMember(DeclItemNode: TGmrNode): Boolean;
begin
  AssureNodeAs(DeclItemNode, PGMR_NODE_DECL_ITEM);
  Result := Pgmr.ExistsNode(DeclItemNode, PGMR_NODE_METHOD_STUFF);
end;

function PCodeModelBuilder.HasClassDefinition(ClassSpecNode: TGmrNode): Boolean;
begin
  AssureNodeAs(ClassSpecNode, PGMR_NODE_CLASS_SPEC);
  Result := Pgmr.ExistsNode(ClassSpecNode, PGMR_NODE_CLASS_SPEC);
end;

procedure PCodeModelBuilder.CollectDeclItems(Node: TGmrNode; Nodes: PGmrNodeList);
var
  NodeDeclItem: TGmrNode;
  SID: TGmrSearchID;
begin
  AssureNodeAs(Node, PGMR_NODE_DECLARATOR);
  Nodes.Clear;
  NodeDeclItem := Pgmr.Find(PGMR_NODE_DECL_ITEM, Node);
  if NodeDeclItem <> PGMR_NODE_NOT_EXISTS then
    Nodes.Add(NodeDeclItem)
  else begin
    SID := PGmr.StartSearch(PGMR_PATH_DECL_ITEM, Node);
    NodeDeclItem := Pgmr.FindNext(SID);
    while NodeDeclItem <> PGMR_NODE_NOT_EXISTS do begin
      Nodes.Add(NodeDeclItem);
      NodeDeclItem := Pgmr.FindNext(SID);
    end;
  end;
end;

function PCodeModelBuilder.IsScopedName(TypeName: string): Boolean;
begin
  Result := (Pos('::', TypeName) <> 0);
end;

function PCodeModelBuilder.ExtractName(Path: string): string;
var
  S: string;
  P: Integer;
begin
  S := Path;
  P := Pos('::', S);
  while P <> 0 do begin
    S := Copy(S, P + 2, Length(S) - 3);
    P := Pos('::', S);
  end;
  Result := S;
end;

procedure PCodeModelBuilder.CollectPathFragment(Path: string; SL: TStringList);
var
  S: string;
  P: Integer;
begin
  Assert(SL <> nil);
  Assert(IsAbsolutePath(Path));
  SL.Clear;
  S := Path;
  P := Pos('::', S);
  while P <> 0 do begin
    SL.Add(Copy(S, 1, P - 1));
    S := Copy(S, P + 2, Length(S) - 3);
    P := Pos('::', S);
  end;
  SL.Add(S);
end;

function PCodeModelBuilder.IsAbsolutePath(Path: string): Boolean;
begin
  Result := (Copy(Path, 1, 2) = '::');
end;

function PCodeModelBuilder.GetAbsolutePath(ANamespace: PCppNamespace): string;
begin
  if ANamespace.Parent = nil then
    Result := ''
  else
    Result := GetAbsolutePath(ANamespace.Parent) + '::' + ANamespace.Name;
end;

function PCodeModelBuilder.GetAbsolutePath(AType: PCppType): string;
begin
  if AType.DeclaringType <> nil then
    Result := GetAbsolutePath(AType.DeclaringType) + '::' + AType.Name
  else if AType.DeclaringNamespace <> nil then
    Result := GetAbsolutePath(AType.DeclaringNamespace) + '::' + AType.Name
  else
    Result := AType.Name;   // unavailable case
end;

function PCodeModelBuilder.GetAbsolutePath(DeclaringNamespace: PCppNamespace; ScopedName: string): string;
begin
  if IsAbsolutePath(ScopedName) then
    Result := ScopedName
  else
    Result := GetAbsolutePath(DeclaringNamespace) + '::' + ScopedName;
end;

function PCodeModelBuilder.GetAbsolutePath(DeclaringType: PCppType; ScopedName: string): string;
begin
  if IsAbsolutePath(ScopedName) then
    Result := ScopedName
  else
    Result := GetAbsolutePath(DeclaringType) + '::' + ScopedName;
end;

function PCodeModelBuilder.SliceHeadOfRelativePath(RelativePath: string): string;
var
  P: Integer;
begin
  Assert(not IsAbsolutePath(RelativePath));
  P := Pos('::', RelativePath);
  if P = 0 then
    Result := RelativePath
  else
    Result := Copy(RelativePath, 1, P - 1);
end;

function PCodeModelBuilder.SliceTailOfRelativePath(RelativePath: string): string;
var
  P: Integer;
begin
  Assert(not IsAbsolutePath(RelativePath));
  P := Pos('::', RelativePath);
  if P = 0 then
    Result := ''
  else
    Result := Copy(RelativePath, P + 2, Length(RelativePath) - P - 1);
end;

function PCodeModelBuilder.FindChildNamespace(ParentNamespace: PCppNamespace; Name: string): PCppNamespace;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ParentNamespace.ChildCount - 1 do
    if ParentNamespace.Children[I].Name = Name then begin
      Result := ParentNamespace.Children[I];
      Exit;
    end;
end;

function PCodeModelBuilder.FindDeclaredType(DeclaringNamespace: PCppNamespace; Name: string): PCppType;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to DeclaringNamespace.TypeCount - 1 do
    if DeclaringNamespace.Types[I].Name = Name then begin
      Result := DeclaringNamespace.Types[I];
      Exit;
    end;
end;

function PCodeModelBuilder.FindDeclaredType(DeclaringType: PCppType; Name: string): PCppType;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to DeclaringType.TypeCount - 1 do
    if DeclaringType.Types[I].Name = Name then begin
      Result := DeclaringType.Types[I];
      Exit;
    end;
end;

function PCodeModelBuilder.FindType(ANamespace: PCppNamespace; RelativePath: string): PCppType;
var
  Head, Tail: string;
  Child: PCppNamespace;
  Type_: PCppType;
begin
  Assert(not IsAbsolutePath(RelativePath));
  Head := SliceHeadOfRelativePath(RelativePath);
  Tail := SliceTailOfRelativePath(RelativePath);
  Type_ := FindDeclaredType(ANamespace, Head);
  Child := FindChildNamespace(ANamespace, Head);
  if Tail = '' then
    Result := Type_
  else begin
    if Type_ <> nil then
      Result := FindType(Type_, Tail)
    else if Child <> nil then
      Result := FindType(Child, Tail)
    else
      Result := nil;
  end;
end;

function PCodeModelBuilder.FindType(AType: PCppType; RelativePath: string): PCppType;
var
  Head, Tail: string;
  Type_: PCppType;
begin
  Assert(not IsAbsolutePath(RelativePath));
  Head := SliceHeadOfRelativePath(RelativePath);
  Tail := SliceTailOfRelativePath(RelativePath);
  Type_ := FindDeclaredType(AType, Head);
  if Tail = '' then
    Result := Type_
  else begin
    if Type_ <> nil then
      Result := FindType(Type_, Tail)
    else
      Result := nil;
  end;
end;

function PCodeModelBuilder.FindType(AbsolutePath: string): PCppType;
var
  RelPath: string;
begin
  Assert(IsAbsolutePath(AbsolutePath));
  RelPath := Copy(AbsolutePath, 3, Length(AbsolutePath) - 2);
  Result := FindType(FRootNamespace, RelPath);
end;

function PCodeModelBuilder.FindTypeInScopedTypeList(AbsolutePath: string): PCppType;
var
  Idx: Integer;
begin
  Assert(IsAbsolutePath(AbsolutePath));
  Result := nil;
  Idx := ScopedTypeList.IndexOf(AbsolutePath);
  if Idx <> -1 then
    Result := ScopedTypeList.Objects[Idx] as PCppType
end;

function PCodeModelBuilder.Registered(AbsolutePath: string): Boolean;
begin
  Result := (FindTypeInScopedTypeList(AbsolutePath) <> nil);
end;

procedure PCodeModelBuilder.RegisterType(AbsolutePath: string; AType: PCppType);
begin
  Assert(IsAbsolutePath(AbsolutePath));
  if not Registered(AbsolutePath) then
    ScopedTypeList.AddObject(AbsolutePath, AType);
end;

function PCodeModelBuilder.AcquireNamespace(Parent: PCppNamespace; Name: string): PCppNamespace;
var
  Child: PCppNamespace;
begin
  Child := FindChildNamespace(Parent, Name);
  if Child = nil then begin
    Child := Factory.CreateNamespace(Parent);
    Child.Name := Name;
  end;
  Result := Child;
end;

function PCodeModelBuilder.AcquireClassType(DeclaringNamespace: PCppNamespace; ScopedName: string): PCppClassType;
var
  ClassType: PCppClassType;
  Type_: PCppType;
  AbsPath: string;
begin
  if ScopedName = '' then begin
    ClassType := Factory.CreateClassType(DeclaringNamespace);
    ClassType.Name := '';
    Result := ClassType;
    Exit;
  end;
  AbsPath := GetAbsolutePath(DeclaringNamespace, ScopedName);
  if IsScopedName(ScopedName) then begin
    Type_ := FindType(AbsPath);
    if Type_ = nil then
      Type_ := FindTypeInScopedTypeList(AbsPath);
    if (Type_ <> nil) and (Type_ is PCppClassType) then begin
      ClassType := Type_ as PCppClassType;
      ClassType.AddDeclaredScope(AbsPath);
      Result := ClassType;
    end
    else begin
      ClassType := PCppClassType.Create;
      ClassType.AddDeclaredScope(GetAbsolutePath(DeclaringNamespace));
      ClassType.Name := ExtractName(ScopedName);
      RegisterType(AbsPath, ClassType);
      Result := ClassType;
    end;
  end
  else begin
    Type_ := FindDeclaredType(DeclaringNamespace, ScopedName);
    if Type_ = nil then
      Type_ := FindTypeInScopedTypeList(AbsPath);
    if (Type_ <> nil) and (Type_ is PCppClassType) then
      Result := Type_ as PCppClassType
    else begin
      ClassType := Factory.CreateClassType(DeclaringNamespace);
      ClassType.Name := ScopedName;
      Result := ClassType;
    end;
  end;
end;

function PCodeModelBuilder.AcquireClassType(DeclaringType: PCppType; ScopedName: string): PCppClassType;
var
  ClassType: PCppClassType;
  Type_: PCppType;
  AbsPath: string;
begin
  if ScopedName = '' then begin
    ClassType := Factory.CreateClassType(DeclaringType);
    ClassType.Name := '';
    Result := ClassType;
    Exit;
  end;
  AbsPath := GetAbsolutePath(DeclaringType, ScopedName);
  if IsScopedName(ScopedName) then begin
    Type_ := FindType(AbsPath);
    if Type_ = nil then
      Type_ := FindTypeInScopedTypeList(AbsPath);
    if (Type_ <> nil) and (Type_ is PCppClassType) then begin
      ClassType := Type_ as PCppClassType;
      ClassType.AddDeclaredScope(GetAbsolutePath(DeclaringType));
      Result := ClassType;
    end
    else begin
      ClassType := PCppClassType.Create;
      ClassType.AddDeclaredScope(GetAbsolutePath(DeclaringType));
      ClassType.Name := ExtractName(ScopedName);
      ScopedTypeList.AddObject(AbsPath, ClassType);
      Result := ClassType;
    end;
  end
  else begin
    Type_ := FindDeclaredType(DeclaringType, ScopedName);
    if Type_ = nil then
      Type_ := FindTypeInScopedTypeList(AbsPath);
    if (Type_ <> nil) and (Type_ is PCppClassType) then
      Result := Type_ as PCppClassType
    else begin
      ClassType := Factory.CreateClassType(DeclaringType);
      ClassType.Name := ScopedName;
      Result := ClassType;
    end;
  end;
end;

function PCodeModelBuilder.CreateImpliedElements(AbsolutePath: string): PCppElement;
var
  SL: TStringList;
  Parent, Child: PCppElement;
  I: Integer;
begin
  Assert(IsAbsolutePath(AbsolutePath));
  SL := TStringList.Create;
  try
    CollectPathFragment(AbsolutePath, SL);
    Parent := FRootNamespace;
    for I := 1 to SL.Count - 2 do begin
      if Parent is PCppNamespace then begin
        Child := FindChildNamespace(Parent as PCppNamespace, SL[I]);
        if Child = nil then
          Child := FindDeclaredType(Parent as PCppNamespace, SL[I]);
        if Child = nil then begin
          Child := Factory.CreateNamespace(Parent as PCppNamespace);
          Child.Name := SL[I];
        end;
      end
      else if Parent is PCppType then begin
        Child := FindDeclaredType(Parent as PCppType, SL[I]);
        if Child = nil then begin
          Child := Factory.CreateClassType(Parent as PCppType);
          Child.Name := SL[I];
        end;
      end;
      Parent := Child;
    end;
    Result := Parent;
  finally
    SL.Free;
  end;
end;

procedure PCodeModelBuilder.AssociateTypesParent;
var
  Parent: PCppElement;
  I: Integer;
begin
  ScopedTypeList.Sort;
  for I := 0 to ScopedTypeList.Count - 1 do begin
    Parent := CreateImpliedElements(ScopedTypeList[I]);
    Assert((Parent is PCppNamespace) or (Parent is PCppType));
    if Parent is PCppNamespace then
      (ScopedTypeList.Objects[I] as PCppType).DeclaringNamespace := Parent as PCppNamespace
    else if Parent is PCppType then
      (ScopedTypeList.Objects[I] as PCppType).DeclaringType := Parent as PCppType;
  end;
end;

procedure PCodeModelBuilder.Clear;
begin
  FSourceFiles.Clear;
  ScopedTypeList.Clear;
end;

procedure PCodeModelBuilder.AddSourceFile(SourceFileName: string);
begin
  if FSourceFiles.IndexOf(SourceFileName) = -1 then
    FSourceFiles.Add(SourceFileName);
end;

procedure PCodeModelBuilder.Build;
var
  I: Integer;
begin
  if not Initialized then
    raise ENotInitialized.Create(ERR_CB_NOT_INITIALIZED);

  IsOnParsing := True;
  try
    for I := 0 to FSourceFiles.Count - 1 do begin
      if IsOnParsing then begin
        Parsing(I + 1, FSourceFiles.Count, FSourceFiles[I]);
        try
          if BuildSourceFile(FSourceFiles[I]) then
            Parsed(I + 1, FSourceFiles.Count, FSourceFiles[I])
          else
            ParseError(I + 1, FSourceFiles.Count, FSourceFiles[I]);
        except
          ParseError(I + 1, FSourceFiles.Count, FSourceFiles[I]);
        end;
      end;
    end;
  finally
    AssociateTypesParent;
    IsOnParsing := False;
  end;
end;

procedure PCodeModelBuilder.Abort;
begin
  IsOnParsing := False;
end;

function PCodeModelBuilder.BuildSourceFile(SourceFileName: string): Boolean;

  function ParseSuccessed(Pgmr: TPgmr): Boolean;
  var
    I: Integer;
  begin
    if Pgmr.Status = pgStatusComplete then begin
      Result := True;
      for I := 0 to Pgmr.GetNumErrors - 1 do
        if Pgmr.GetErrorSeverity(I) <> PGMR_ERR_SEV_RECOVERABLE then begin
          Result := False;
          Exit;
        end;
    end
    else
      Result := False;
  end;

  procedure FillParseErrorRec(Pgmr: TPgmr);
  var
    P: Integer;
  begin
    if Pgmr.GetNumErrors > 0 then begin
      ParseErrorRec.ErrorCode := Pgmr.GetErrorCode(0);
      ParseErrorRec.ErrorDescription := Pgmr.GetErrorDescription(0);
      P := StrToIntDef(Pgmr.GetErrorDetail(0, 'StartPos'), -1);
      ParseErrorRec.ErrorLine := Pgmr.GetInputLineNumber(P);
      ParseErrorRec.ErrorLinePos := P - Pgmr.GetInputLinePos(ParseErrorRec.ErrorLine);
      ParseErrorRec.ErrorNumChar := StrToIntDef(Pgmr.GetErrorDetail(0, 'NumChars'), 0);
    end;
  end;

var
  FilteredSrc: string;
begin
  if not FileExists(SourceFileName) then
    raise EFileNotFound.Create(ERR_FILE_NOT_FOUND);

  ResetParseErrorRec;    
  FilteredSrc := DirectiveRemover.GetFiltedSource(SourceFileName);
  Pgmr.SetInputString(FilteredSrc);
  try
    Pgmr.Parse;
    if ParseSuccessed(Pgmr) then begin
      AnalyzeProgram(Pgmr.GetChild(Pgmr.GetRoot, 0));
      Result := True;
    end
    else begin
      FillParseErrorRec(Pgmr);
      Log(Format(ERR_PARSING_ERROR, [SourceFileName, ParseErrorRec.ErrorDescription, ParseErrorRec.ErrorLine, ParseErrorRec.ErrorLinePos]));
      Result := False;
    end;
  except
    Result := False;
  end;
end;

//  PCodeModelBuilder
////////////////////////////////////////////////////////////////////////////////

end.
