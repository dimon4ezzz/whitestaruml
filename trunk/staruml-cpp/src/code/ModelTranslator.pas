unit ModelTranslator;

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
  CppElements, Utility,
  Classes, SysUtils, WhiteStarUML_TLB;

type
  // forward declarations
  PTranslateItem = class;

  // Enumerations
  PTranslateItemKind = (tkBase, tkFieldType, tkFieldAsAssoc, tkReturnType,
    tkParameterType, tkNamespaceUsing, tkTypedefSynonym, tkFriendClass);

  // Exceptions
  ETranslatingAborted = class(Exception);

  // Events
  PUMLElementEvent = procedure(Sender: TObject; Element: IUMLElement) of object;
  PCppElementEvent = procedure(Sender: TObject; CppElement: PCppElement; Index, Total: Integer) of object;
  PMessageEvent = procedure(Sender: TObject; Kind: InformationMessageKind; Text: string; ElementLink: IElement) of object;
  PTranslateItemEvent = procedure(Sender: TObject; Item: PTranslateItem; Index, Total: Integer) of object;

  // PElementCounter
  PElementCounter = class(PVisitor)
  private
    FCount: Integer;
  public
    procedure Clear;
    procedure Visit(Element: PCppElement); override;
    property Count: Integer read FCount;
  end;

  // PTypeTranslation
  PTypeTranslation = class
  private
    FCppType: PCppType;
    FUMLClassifier: IUMLClassifier;
  public
    constructor Create(ACppType: PCppType; AUMLClassifier: IUMLClassifier);
    property CppType: PCppType read FCppType;
    property UMLClassifier: IUMLClassifier read FUMLClassifier;
  end;

  // PTranslateItem
  PTranslateItem = class
  private
    FTranslateItemKind: PTranslateItemKind;
    FCppElement: PCppElement;
    FUMLElement: IUMLElement;
  public
    constructor Create(ATranslateItemKind: PTranslateItemKind; ACppElement: PCppElement;
      AUMLElement: IUMLElement);
    property TranslateItemKind: PTranslateItemKind read FTranslateItemKind;
    property CppElement: PCppElement read FCppElement;
    property UMLElement: IUMLElement read FUMLElement;
  end;

  // PModelFinder
  PModelFinder = class
  private
    { Member Field }
    FTopPackage: IUMLPackage;
    { Private Methods }
    function Initialized: Boolean;
    { Auxiliary Functions }
    function IsAbsolutePath(Path: string): Boolean;
    function IsTypeElement(Element: IUMLModelElement): Boolean;
    function GetPackage(AClassifier: IUMLClassifier): IUMLPackage;
    function GetNamespace(AClassType: PCppClassType): PCppNamespace;
    function FindByRelativePath(Element: IUMLModelElement; Path: string): IUMLClassifier;
    function FindPackage(BasePackage: IUMLPackage; NamespacePath: string): IUMLPackage;
    { Type Searching Methods with Relative Path }
    function FindClassifierInGlobalScope(TypeExpr: string): IUMLClassifier;
    function FindClassifierInClassScope(BaseClassifier: IUMLClassifier; TypeExpr: string): IUMLClassifier;
    function FindClassifierInBaseClassScope(BaseClassifier: IUMLClassifier; TypeExpr: string): IUMLClassifier;
    function FindClassifierInNamespace(BasePackage: IUMLPackage; TypeExpr: string): IUMLClassifier;
    function FindClassifierInUsingDirectives(BasePackage: IUMLPackage; TypeExpr: string; RefNamespace: PCppNamespace): IUMLClassifier;
    function FindClassifierInDeclaredScope(BaseClassType: PCppClassType; TypeExpr: string): IUMLClassifier;
  public
    function FindClassifier(BaseClassType: PCppClassType; BaseClassifier: IUMLClassifier;
      TypeExpr: string): IUMLClassifier; overload;
    property TopPackage: IUMLPackage read FTopPackage write FTopPackage;
  end;

  // PModelTranslator
  PModelTranslator = class
  private
		{ Member Fields }
    FStarUMLApp: IStarUMLApplication;
    FRootNamespace: PCppNamespace;
    FBasePackage: IUMLPackage;
    TranslateItems: TList;
    TypeTranslations: TList;
    ModelFinder: PModelFinder;
    { Options }
    FTranslatePublicMember: Boolean;
    FTranslatePackageMember: Boolean;
    FTranslateProtectedMember: Boolean;
    FTranslatePrivateMember: Boolean;
    FRefAsAssociation: Boolean;
    FOmitInitialValue: Boolean;
    { Events }
    FOnAddUMLElement: PUMLElementEvent;
    FOnTranslateCppElement: PCppElementEvent;
    FOnTranslateItem: PTranslateItemEvent;
    FOnMessage: PMessageEvent;
    FOnFirstTranslationStep: TNotifyEvent;
    FOnSecondTranslationStep: TNotifyEvent;
    FOnLog: PLogEvent;
    { Internal Variables }
    IsOnTranslating: Boolean;
    TransCppTotal: Integer;
    TransCppCount: Integer;
    { Property Get/Set }
    procedure SetBasePackage(Value: IUMLPackage);
    { Private Methods }
    function Initialized: Boolean;
    procedure ClearTranslateItems;
    procedure ClearTypeTranslations;
    procedure Log(Msg: string);
    { Type Translation Functions }
    function AccessSpecToUMLVisibilityKind(Value: PCppAccessSpecifierKind; DefaultAccessSpec: UMLVisibilityKind): UMLVisibilityKind;
    { Auxiliary Functions }
    procedure CheckTranslatingAborted;
    procedure NamingSafely(ANamespace: IUMLNamespace; Name: string);
    function IsTranslateTarget(AMember: PCppMember): Boolean;
    function EvaluateCppElementCount: Integer;
    procedure RegisterTranslateItem(ATranslateItemKind: PTranslateItemKind; ACppElement: PCppElement;
      AUMLElement: IUMLElement);
    procedure RegisterTypeTranslation(ACppType: PCppType; AUMLClassifier: IUMLClassifier);
    function FindUMLClassifierWithCppType(ACppType: PCppType): IUMLClassifier;
    function GetOwnerPackage(AClassifier: IUMLClassifier): IUMLPackage;
    function GetDefaultMemberVisibility(AClassifier: IUMLClassifier): UMLVisibilityKind;

    procedure AddMessage(Kind: InformationMessageKind; Text: string; ElementLink: IElement);
    procedure UMLElementAdded(Element: IUMLElement);
    procedure CppElementTranslated(Element: PCppElement);
    procedure TranslateItemTranslated(Item: PTranslateItem; Index, Total: Integer);
    { UML Model Translating Related Methods (1st step) }
    procedure Translate1stStep;
    procedure TranslateCppNamespace(ANamespace: PCppNamespace; Owner: IUMLNamespace);
    procedure TranslateCppNamespaceAlias(ANamespaceAlias: PCppNamespaceAlias; Owner: IUMLNamespace);
    procedure TranslateCppType(AType: PCppType; Owner: IUMLNamespace);
    procedure TranslateCppClassTypeAsClass(AClassType: PCppClassType; Owner: IUMLNamespace);
    procedure TranslateCppClassTypeAsInterface(AClassType: PCppClassType; Owner: IUMLNamespace);
    procedure TranslateCppDataMember(ADataMember: PCppDataMember; Owner: IUMLClassifier);
    procedure TranslateCppFriendClass(AFriendClass: PCppFriendClass; Owner: IUMLClassifier);
    procedure TranslateCppFunctionMember(AFunctionMember: PCppFunctionMember; Owner: IUMLClassifier);
    procedure TranslateCppParameter(AParameter: PCppParameter; Operation: IUMLOperation); overload;
    procedure TranslateCppEnumeration(AEnumeration: PCppEnumeration; Owner: IUMLNamespace);
    procedure TranslateCppEnumerationItem(AEnumerationItem: PCppEnumerationItem; Enumeration: IUMLEnumeration);
    procedure TranslateCppTemplate(ATemplate: PCppTemplate; Owner: IUMLClass);
    procedure TranslateCppParameter(AParameter: PCppParameter; Owner: IUMLClass); overload;
    procedure TranslateCppTypeParameter(ATypeParameter: PCppTypeParameter; Owner: IUMLClass);
    procedure TranslateCppGlobalDelegateFunction(ADelegateFunction: PCppGlobalDelegateFunction; Owner: IUMLNamespace);
    procedure TranslateCppTypeDef(ATypedef: PCppTypeDef; Owner: IUMLNamespace);
    procedure SetUMLAttributeProperty(ADataMember: PCppDataMember; AAttribute: IUMLAttribute);
    { UML Model Translating Related Methods (1st step) }
    procedure Translate2ndStep;
    procedure TranslateBase(AItem: PTranslateItem);
    procedure TranslateFieldType(AItem: PTranslateItem);
    procedure TranslateFieldAsAssoc(AItem: PTranslateItem);
    procedure TranslateFriendClass(AItem: PTranslateItem);
    procedure TranslateReturnType(AItem: PTranslateItem);
    procedure TranslateParameterType(AItem: PTranslateItem);
    procedure TranslateNamespaceUsing(AItem: PTranslateItem);
    procedure TranslateTypedefSynonym(AItem: PTranslateItem);
  public
		{ Constructor/Destructor }
    constructor Create;
    destructor Destroy; override;
    procedure Translate;
    procedure Abort;
    { Properties }
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
    property RootNamespace: PCppNamespace read FRootNamespace write FRootNamespace;
    property BasePackage: IUMLPackage read FBasePackage write SetBasePackage;
    { Options }
    property TranslatePublicMember: Boolean read FTranslatePublicMember write FTranslatePublicMember;
    property TranslatePackageMember: Boolean read FTranslatePackageMember write FTranslatePackageMember;
    property TranslateProtectedMember: Boolean read FTranslateProtectedMember write FTranslateProtectedMember;
    property TranslatePrivateMember: Boolean read FTranslatePrivateMember write FTranslatePrivateMember;
    property RefAsAssociation: Boolean read FRefAsAssociation write FRefAsAssociation;
    property OmitInitialValue: Boolean read FOmitInitialValue write FOmitInitialValue;
    { Events }
    property OnAddUMLElement: PUMLElementEvent read FOnAddUMLElement write FOnAddUMLElement;
    property OnTranslateCppElement: PCppElementEvent read FOnTranslateCppElement write FOnTranslateCppElement;
    property OnTranslateItem: PTranslateItemEvent read FOnTranslateItem write FOnTranslateItem;
    property OnMessage: PMessageEvent read FOnMessage write FOnMessage;
    property OnFirstTranslationStep: TNotifyEvent read FOnFirstTranslationStep write FOnFirstTranslationStep;
    property OnSecondTranslationStep: TNotifyEvent read FOnSecondTranslationStep write FOnSecondTranslationStep;
    property OnLog: PLogEvent read FOnLog write FOnLog;
  end;

implementation

uses
  NLS_CppAddIn, Symbols;

/////////////////////////////////////////////////////////////////////////////
// PElementCounter

procedure PElementCounter.Clear;
begin
  FCount := 0;
end;

procedure PElementCounter.Visit(Element: PCppElement);
begin
  Inc(FCount);
end;

// PElementCounter
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PTranslateItem

constructor PTranslateItem.Create(ATranslateItemKind: PTranslateItemKind; ACppElement: PCppElement;
  AUMLElement: IUMLElement);
begin
  FTranslateItemKind := ATranslateItemKind;
  FCppElement := ACppElement;
  FUMLElement := AUMLElement;
end;

// PTranslateItem
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PTypeTranslation

constructor PTypeTranslation.Create(ACppType: PCppType; AUMLClassifier: IUMLClassifier);
begin
  FCppType := ACppType;
  FUMLClassifier := AUMLClassifier;
end;

// PTypeTranslation
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PModelFinder

function PModelFinder.Initialized: Boolean;
begin
  Result := (FTopPackage <> nil);
end;

function PModelFinder.IsAbsolutePath(Path: string): Boolean;
begin
  Result := (Copy(Path, 1, 2) = '::');
end;

function PModelFinder.IsTypeElement(Element: IUMLModelElement): Boolean;
begin
  Result := Element.IsKindOf(ELEM_CLASS)
    or Element.IsKindOf(ELEM_INTERFACE)
    or Element.IsKindOf(ELEM_ENUMERATION);
end;

function PModelFinder.GetPackage(AClassifier: IUMLClassifier): IUMLPackage;
var
  Pkg: IUMLPackage;
  N: IUMLNamespace;
begin
  Result := nil;
  N := AClassifier;
  while (N <> nil) and (not N.IsKindOf(ELEM_PACKAGE)) do
    N := N.Namespace;
  if (N <> nil) and (N.QueryInterface(IUMLPackage, Pkg) = S_OK) then
    Result := Pkg;
end;

function PModelFinder.GetNamespace(AClassType: PCppClassType): PCppNamespace;
var
  CppType: PCppType;
begin
  CppType := AClassType;
  while (CppType.DeclaringType <> nil) and (CppType.DeclaringNamespace = nil) do
    CppType := CppType.DeclaringType;
  Result := CppType.DeclaringNamespace;
end;

function PModelFinder.FindByRelativePath(Element: IUMLModelElement; Path: string): IUMLClassifier;
var
  E: IUMLModelElement;
  Cls: IUMLClassifier;
  M: IModel;
begin
  Assert(not IsAbsolutePath(Path));
  Result := nil;
  M := Element.FindByRelativePathname(Path);
  if (M <> nil) and (M.QueryInterface(IUMLModelElement, E) = S_OK) then
    if IsTypeElement(E) then begin
      Assert(E.QueryInterface(IUMLClassifier, Cls) = S_OK);
      Result := Cls;
      Exit;
    end;
end;

function PModelFinder.FindPackage(BasePackage: IUMLPackage; NamespacePath: string): IUMLPackage;
var
  M: IModel;
  Pkg: IUMLPackage;
  RelPath: string;
begin
  Assert(FTopPackage <> nil);
  Result := nil;
  if IsAbsolutePath(NamespacePath) then begin
    RelPath := Copy(NamespacePath, 3, Length(NamespacePath) - 2);   // check if NamespacePath = '::'
    M := FTopPackage.FindByRelativePathname(RelPath);
    if (M <> nil) and (M.QueryInterface(IUMLPackage, Pkg) = S_OK) then begin
      Result := Pkg;
      Exit;
    end;
  end
  else begin
    M := BasePackage.FindByRelativePathname(NamespacePath);
    if (M <> nil) and (M.QueryInterface(IUMLPackage, Pkg) = S_OK) then begin
      Result := Pkg;
      Exit;
    end;
  end;
end;

function PModelFinder.FindClassifierInGlobalScope(TypeExpr: string): IUMLClassifier;
var
  Path: string;
begin
  if IsAbsolutePath(TypeExpr) then
    Path := Copy(TypeExpr, 3, Length(TypeExpr) - 2)   // check if TypeExpr = '::'
  else
    Path := TypeExpr;
  Result := FindByRelativePath(FTopPackage, Path);
end;

// Naming Searching Step 1. 현재 type의 class-scope에서 찾는다.
function PModelFinder.FindClassifierInClassScope(BaseClassifier: IUMLClassifier; TypeExpr: string): IUMLClassifier;
var
  Cls, OwnerType: IUMLClassifier;
begin
  Assert(IsTypeElement(BaseClassifier));
  Assert(not IsAbsolutePath(TypeExpr));

  Result := nil;
  if BaseClassifier.Name = TypeExpr then begin
    Result := BaseClassifier;
    Exit;
  end;
  Cls := FindByRelativePath(BaseClassifier, TypeExpr);
  if Cls <> nil then begin
    Result := Cls;
    Exit;
  end;
  if IsTypeElement(BaseClassifier.Namespace) then begin
    BaseClassifier.Namespace.QueryInterface(IUMLClassifier, OwnerType);
    Result := FindClassifierInClassScope(OwnerType, TypeExpr);
  end;
end;

// Naming Searching Step 2. 현재 type의 base type들을 따라서 해당 type의 class-scope에서 찾는다.
function PModelFinder.FindClassifierInBaseClassScope(BaseClassifier: IUMLClassifier; TypeExpr: string): IUMLClassifier;
var
  Parent: IUMLGeneralizableElement;
  Intf: IUMLInterface;
  Cls, BaseType: IUMLClassifier;
  Rel: IUMLRealization;
  I: Integer;
begin
  Assert(IsTypeElement(BaseClassifier));
  Assert(not IsAbsolutePath(TypeExpr));

  Result := nil;
  for I := 0 to BaseClassifier.GetGeneralizationCount - 1 do begin
    Parent := BaseClassifier.GetGeneralizationAt(I).Parent;
    if IsTypeElement(Parent) then begin
      Parent.QueryInterface(IUMLClassifier, BaseType);
      Cls := FindClassifierInClassScope(BaseType, TypeExpr);
      if Cls <> nil then begin
        Result := Cls;
        Exit;
      end;
      Cls := FindClassifierInBaseClassScope(BaseType, TypeExpr);
      if Cls <> nil then begin
        Result := Cls;
        Exit;
      end;
    end;
  end;

  for I := 0 to BaseClassifier.GetClientDependencyCount - 1 do begin
    if BaseClassifier.GetClientDependencyAt(I).QueryInterface(IUMLRealization, Rel) = S_OK then begin
      if Rel.Supplier.QueryInterface(IUMLInterface, Intf) = S_OK then begin
        Cls := FindClassifierInClassScope(Intf, TypeExpr);
        if Cls <> nil then begin
          Result := Cls;
          Exit;
        end;
        Cls := FindClassifierInBaseClassScope(Intf, TypeExpr);
        if Cls <> nil then begin
          Result := Cls;
          Exit;
        end;
      end;
    end;
  end;
end;

// Naming Searching Step 3. using declaration을 포함하여 현재 namespace에서 찾는다.
// Naming Searching Step 4. namespace의 parent namespace들을 따라서 해당 namespace의 scope에서 찾는다. (using declaration 포함)
function PModelFinder.FindClassifierInNamespace(BasePackage: IUMLPackage; TypeExpr: string): IUMLClassifier;
var
  Pkg: IUMLPackage;
  Cls: IUMLClassifier;
begin
  Cls := FindByRelativePath(BasePackage, TypeExpr);
  if Cls <> nil then begin
    Result := Cls;
    Exit;
  end;

  if (BasePackage.Namespace <> nil) and (BasePackage <> FTopPackage) then begin
    BasePackage.Namespace.QueryInterface(IUMLPackage, Pkg);
    Result := FindClassifierInNamespace(Pkg, TypeExpr);
  end;

// (todo) using declaration 차리 추가
end;

// Naming Searching Step 5. 현재 namespace의 using directive에서 찾는다.
// Naming Searching Step 6. namespace의 parent namespace들을 따라서 해당 namespace의 using directive에서 찾는다.
function PModelFinder.FindClassifierInUsingDirectives(BasePackage: IUMLPackage; TypeExpr: string; RefNamespace: PCppNamespace): IUMLClassifier;
var
  Using: PCppUsingDeclaration;
  Pkg: IUMLPackage;
  Cls: IUMLClassifier;
  I: Integer;
begin
  Result := nil;
  for I := 0 to RefNamespace.UsingDeclarationCount - 1 do begin
    Using := RefNamespace.UsingDeclarations[I];
    Pkg := FindPackage(BasePackage, Using.Name);
    if Pkg <> nil then begin
      Cls := FindByRelativePath(Pkg, TypeExpr);
      if Cls <> nil then begin
        Result := Cls;
        Exit;
      end;
    end;
  end;

  if (BasePackage.Namespace <> nil) and (BasePackage <> FTopPackage) and (RefNamespace.Parent <> nil) then begin
    BasePackage.Namespace.QueryInterface(IUMLPackage, Pkg);
    Result := FindClassifierInUsingDirectives(Pkg, TypeExpr, RefNamespace.Parent);
  end;
end;

// Extra Searching Rule. 분산 선언된 parent namespace와 parent class에서 찾는다.
function PModelFinder.FindClassifierInDeclaredScope(BaseClassType: PCppClassType; TypeExpr: string): IUMLClassifier;
var
  Cls: IUMLClassifier;
  Path: string;
  I: Integer;
begin
  Assert(not IsAbsolutePath(TypeExpr));
  for I := 0 to BaseClassType.DeclaredScopeCount - 1 do begin
    Path := BaseClassType.DeclaredScopes[I] + '::' + TypeExpr;
    Cls := FindClassifierInGlobalScope(Path);
    if Cls <> nil then begin
      Result := Cls;
      Exit;
    end;
  end;
end;

function PModelFinder.FindClassifier(BaseClassType: PCppClassType; BaseClassifier: IUMLClassifier; TypeExpr: string): IUMLClassifier;
var
  Cls: IUMLClassifier;
begin
  Result := nil;
  if not Initialized then
    raise Exception.Create('');
  if IsAbsolutePath(TypeExpr) then
    Result := FindClassifierInGlobalScope(TypeExpr)
  else begin
    Cls := FindClassifierInClassScope(BaseClassifier, TypeExpr);
    if Cls <> nil then begin
      Result := Cls;
      Exit;
    end;
    Cls := FindClassifierInBaseClassScope(BaseClassifier, TypeExpr);
    if Cls <> nil then begin
      Result := Cls;
      Exit;
    end;
    Cls := FindClassifierInNamespace(GetPackage(BaseClassifier), TypeExpr);
    if Cls <> nil then begin
      Result := Cls;
      Exit;
    end;
    if BaseClassType <> nil then begin
      Cls := FindClassifierInUsingDirectives(GetPackage(BaseClassifier), TypeExpr, GetNamespace(BaseClassType));
      if Cls <> nil then begin
        Result := Cls;
        Exit;
      end;
      Cls := FindClassifierInDeclaredScope(BaseClassType, TypeExpr);
      if Cls <> nil then begin
        Result := Cls;
        Exit;
      end;
    end;
  end;
end;

// PModelFinder
/////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//  PModelTranslator

{ Constructor/Destructor }

constructor PModelTranslator.Create;
begin
  FStarUMLApp := nil;
  FRootNamespace := nil;
  FBasePackage := nil;
  TranslateItems := TList.Create;
  TypeTranslations := TList.Create;
  ModelFinder := PModelFinder.Create;
end;

destructor PModelTranslator.Destroy;
begin
  inherited;
  FStarUMLApp := nil;
  FRootNamespace := nil;
  ClearTranslateItems;
  TranslateItems.Free;
  TranslateItems := nil;
  ClearTypeTranslations;
  TypeTranslations.Free;
  TypeTranslations := nil;
end;

{ Property Get/Set }

procedure PModelTranslator.SetBasePackage(Value: IUMLPackage);
begin
  FBasePackage := Value;
  ModelFinder.TopPackage := Value;
end;

{ Private Methods }

function PModelTranslator.Initialized: Boolean;
begin
  Result := (FStarUMLApp <> nil) and (FRootNamespace <> nil) and (FBasePackage <> nil);
end;

procedure PModelTranslator.ClearTranslateItems;
var
  I: Integer;
begin
  for I := TranslateItems.Count - 1 downto 0 do begin
    PTranslateItem(TranslateItems[I]).Free;
    TranslateItems.Delete(I);
  end;
end;

procedure PModelTranslator.ClearTypeTranslations;
var
  I: Integer;
begin
  for I := TypeTranslations.Count - 1 downto 0 do begin
    PTypeTranslation(TypeTranslations[I]).Free;
    TypeTranslations.Delete(I);
  end;
end;

procedure PModelTranslator.Log(Msg: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg);
end;

function PModelTranslator.AccessSpecToUMLVisibilityKind(Value: PCppAccessSpecifierKind; DefaultAccessSpec: UMLVisibilityKind): UMLVisibilityKind;
begin
  Result := vkPrivate;
  case Value of
    akPrivate: Result := vkPrivate;
    akProtected: Result := vkProtected;
    akPublic: Result := vkPublic;
    akNotDefined: Result := DefaultAccessSpec;
  end;
end;

{ Auxiliary Functions }

procedure PModelTranslator.CheckTranslatingAborted;
begin
  if not IsOnTranslating then
    raise ETranslatingAborted.Create(ERR_MODEL_TRANSLATION_CANCED);
end;

procedure PModelTranslator.NamingSafely(ANamespace: IUMLNamespace; Name: string);
var
  Parent: IUMLNamespace;
  Count: Integer;
  M: IModel;
  S: string;
begin
  Parent := ANamespace.Namespace;
  Count := 0;
  S := Name;
  M := Parent.FindByName(S);
  while M <> nil do begin
    Inc(Count);
    S := Name + '_' + IntToStr(Count);
    M := Parent.FindByName(S);
  end;
  if S <> Name then
    Log(Format(MSG_ELEMENT_NAME_CHANGED, [Name, S]));
  ANameSpace.Name := S;
end;

function PModelTranslator.IsTranslateTarget(AMember: PCppMember): Boolean;
begin
  Result := False;
  case AMember.AccessSpecifier of
    akPrivate: Result := FTranslatePrivateMember;
    akProtected: Result := FTranslateProtectedMember;
    akPublic: Result := FTranslatePublicMember;
    akNotDefined: Result := FTranslatePublicMember; // more consideration...
  end;
end;

function PModelTranslator.EvaluateCppElementCount: Integer;
var
  Counter: PElementCounter;
begin
  Counter := PElementCounter.Create;
  try
    Counter.Clear;
    FRootNamespace.Accept(Counter);
    Result := Counter.Count;
  finally
    Counter.Free;
  end;
end;

procedure PModelTranslator.RegisterTranslateItem(ATranslateItemKind: PTranslateItemKind; ACppElement: PCppElement;
  AUMLElement: IUMLElement);
var
  T: PTranslateItem;
begin
  T := PTranslateItem.Create(ATranslateItemKind, ACppElement, AUMLElement);
  TranslateItems.Add(T);
end;

procedure PModelTranslator.RegisterTypeTranslation(ACppType: PCppType; AUMLClassifier: IUMLClassifier);
var
  T: PTypeTranslation;
begin
  T := PTypeTranslation.Create(ACppType, AUMLClassifier);
  TypeTranslations.Add(T);
end;

function PModelTranslator.FindUMLClassifierWithCppType(ACppType: PCppType): IUMLClassifier;
var
  T: PTypeTranslation;
  I: Integer;
begin
  Result := nil;
  for I := 0 to TypeTranslations.Count - 1 do begin
    T := PTypeTranslation(TypeTranslations[I]);
    if T.CppType = ACppType then begin
      Result := T.UMLClassifier;
    end;
  end;
end;

function PModelTranslator.GetOwnerPackage(AClassifier: IUMLClassifier): IUMLPackage;
var
  N: IUMLNamespace;
begin
  Result := nil;
  N := AClassifier.Namespace;
  while N <> nil do begin
    if N.IsKindOf(ELEM_PACKAGE) then begin
      Result := N as IUMLPackage;
      Exit;
    end;
    N := N.Namespace;
  end;
end;

function PModelTranslator.GetDefaultMemberVisibility(AClassifier: IUMLClassifier): UMLVisibilityKind;
var
  UMLClass: IUMLClass;
  UMLInterface: IUMLInterface;
begin
  if AClassifier.QueryInterface(IUMLClass, UMLClass) = S_OK then begin
    if (UMLClass.StereotypeName = STEREOTYPE_CPP_STRUCT) or (UMLClass.StereotypeName = STEREOTYPE_CPP_UNION) then
      Result := vkPublic
    else
      Result := vkPrivate
  end
  else if AClassifier.QueryInterface(IUMLInterface, UMLInterface) = S_OK then
    Result := vkPublic
  else
    Result := vkPublic;
end;

procedure PModelTranslator.AddMessage(Kind: InformationMessageKind; Text: string; ElementLink: IElement);
begin
  if Assigned(FOnMessage) then
    FOnMessage(Self, Kind, Text, ElementLink);
end;

procedure PModelTranslator.UMLElementAdded(Element: IUMLElement);
begin
  if Assigned(FOnAddUMLElement) then
    FOnAddUMLElement(Self, Element)
end;

procedure PModelTranslator.CppElementTranslated(Element: PCppElement);
begin
  Inc(TransCppCount);
  if Assigned(FOnTranslateCppElement) then
    FOnTranslateCppElement(Self, Element, TransCppCount, TransCppTotal);
end;

procedure PModelTranslator.TranslateItemTranslated(Item: PTranslateItem; Index, Total: Integer);
begin
  if Assigned(FOnTranslateItem) then
    FOnTranslateItem(Self, Item, Index, Total);
end;

{ UML Model Translating Related Methods (1st step) }

procedure PModelTranslator.Translate1stStep;
begin
  TransCppTotal := EvaluateCppElementCount;
  TransCppCount := 0;
  CheckTranslatingAborted;
  if Assigned(FOnFirstTranslationStep) then
    FOnFirstTranslationStep(Self);
  TranslateCppNamespace(FRootNamespace, FBasePackage);
end;

procedure PModelTranslator.TranslateCppNamespace(ANamespace: PCppNamespace; Owner: IUMLNamespace);
var
  UMLPackage: IUMLPackage;
  I: Integer;
begin
  CheckTranslatingAborted;
  if ANamespace.IsUnnamed then
    Owner.QueryInterface(IUMLPackage, UMLPackage)
  else begin
    UMLPackage := FStarUMLApp.UMLFactory.CreatePackage(Owner);
    NamingSafely(UMLPackage, ANamespace.Name);
    UMLElementAdded(UMLPackage);
  end;

  for I := 0 to ANamespace.ChildCount - 1 do
    TranslateCppNamespace(ANamespace.Children[I], UMLPackage);
  for I := 0 to ANamespace.TypeCount - 1 do
    if IsTranslateTarget(ANamespace.Types[I]) then
      TranslateCppType(ANamespace.Types[I], UMLPackage);
  for I := 0 to ANamespace.NamespaceAliasCount - 1 do
    TranslateCppNamespaceAlias(ANamespace.NamespaceAliases[I], UMLPackage);
  for I := 0 to ANamespace.DelegateFunctionCount - 1 do
    TranslateCppGlobalDelegateFunction(ANamespace.DelegateFunctions[I], UMLPackage);
  for I := 0 to ANamespace.UsingDeclarationCount - 1 do
    RegisterTranslateItem(tkNamespaceUsing, ANamespace.UsingDeclarations[I], UMLPackage);
  for I := 0 to ANamespace.TypeDefCount - 1 do
    TranslateCppTypeDef(ANamespace.TypeDefs[I], UMLPackage);

  CppElementTranslated(ANamespace);
end;

procedure PModelTranslator.TranslateCppNamespaceAlias(ANamespaceAlias: PCppNamespaceAlias; Owner: IUMLNamespace);
begin
//
end;

procedure PModelTranslator.TranslateCppType(AType: PCppType; Owner: IUMLNamespace);
var
  C: PCppClassType;
begin
  CheckTranslatingAborted;
  if AType is PCppClassType then begin
    C := AType as PCppClassType;
    if C.Key = ckInterface then
      TranslateCppClassTypeAsInterface(C, Owner)
    else
      TranslateCppClassTypeAsClass(C, Owner);
  end
  else if AType is PCppEnumeration then
    TranslateCppEnumeration(AType as PCppEnumeration, Owner);
end;

procedure PModelTranslator.TranslateCppClassTypeAsClass(AClassType: PCppClassType; Owner: IUMLNamespace);
var
  UMLClass: IUMLClass;
  Clsf: IUMLClassifier;
  I: Integer;
begin
  UMLClass := FStarUMLApp.UMLFactory.CreateClass(Owner);
  NamingSafely(UMLClass, AClassType.Name);
  UMLElementAdded(UMLClass);
  RegisterTypeTranslation(AClassType, UMLClass);
  if AClassType.Key = ckStruct then
    UMLClass.SetStereotype2(PROFILE_CPP, STEREOTYPE_CPP_STRUCT)
  else if AClassType.Key = ckUnion then
    UMLClass.SetStereotype2(PROFILE_CPP, STEREOTYPE_CPP_UNION);
  if Owner.QueryInterface(IUMLClassifier, Clsf) = S_OK then
    UMLClass.Visibility := AccessSpecToUMLVisibilityKind(AClassType.AccessSpecifier, GetDefaultMemberVisibility(Clsf))
  else
    UMLClass.Visibility := AccessSpecToUMLVisibilityKind(AClassType.AccessSpecifier, vkPublic);
  UMLClass.IsAbstract := AClassType.IsAbstract;
  if AClassType.IsGc then
    UMLClass.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_GC, TAG_CPP___GC, True);
  if AClassType.IsNogc then
    UMLClass.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_GC, TAG_CPP___NOGC, True);
  UMLClass.IsLeaf := AClassType.IsSealed;
  if AClassType.IsValue then
    UMLClass.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_VALUE, TAG_CPP___VALUE, True);
  if AClassType.Declspec <> '' then
    UMLClass.SetTaggedValueAsString(PROFILE_CPP, TAGSET_VCPP_DECLSPEC, TAG_CPP___DECLSPEC, AClassType.Declspec);

  if AClassType.BaseCount > 0 then
    RegisterTranslateItem(tkBase, AClassType, UMLClass);
  for I := 0 to AClassType.DataMemberCount - 1 do
    if IsTranslateTarget(AClassType.DataMembers[I]) then
      TranslateCppDataMember(AClassType.DataMembers[I], UMLClass);
  for I := 0 to AClassType.FunctionMemberCount - 1 do
    if IsTranslateTarget(AClassType.FunctionMembers[I]) then
      TranslateCppFunctionMember(AClassType.FunctionMembers[I], UMLClass);
  for I := 0 to AClassType.TypeCount - 1 do
    if IsTranslateTarget(AClassType.Types[I]) then
      TranslateCppType(AClassType.Types[I], UMLClass);
  if AClassType.TemplateDefinition <> nil then
    TranslateCppTemplate(AClassType.TemplateDefinition, UMLClass);
  for I := 0 to AClassType.TypeDefCount - 1 do
    TranslateCppTypeDef(AClassType.TypeDefs[I], UMLClass);
  for I := 0 to AClassType.FriendClassCount - 1 do
    TranslateCppFriendClass(AClassType.FriendClasses[I], UMLClass);

  // NamespaceAlias

  CppElementTranslated(AClassType);
end;

procedure PModelTranslator.TranslateCppClassTypeAsInterface(AClassType: PCppClassType; Owner: IUMLNamespace);
var
  UMLInterface: IUMLInterface;
  Clsf: IUMLClassifier;
  I: Integer;
begin
  Assert(AClassType.Key = ckInterface);

  UMLInterface := FStarUMLApp.UMLFactory.CreateInterface(Owner);
  NamingSafely(UMLInterface, AClassType.Name);
  UMLElementAdded(UMLInterface);
  RegisterTypeTranslation(AClassType, UMLInterface);
  if Owner.QueryInterface(IUMLClassifier, Clsf) = S_OK then
    UMLInterface.Visibility := AccessSpecToUMLVisibilityKind(AClassType.AccessSpecifier, GetDefaultMemberVisibility(Clsf))
  else
    UMLInterface.Visibility := AccessSpecToUMLVisibilityKind(AClassType.AccessSpecifier, vkPublic);
  if AClassType.IsGc then
    UMLInterface.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_GC, TAG_CPP___GC, True);
  if AClassType.IsNogc then
    UMLInterface.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_GC, TAG_CPP___NOGC, True);
  if AClassType.IsEvent then
    UMLInterface.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_EVENT, TAG_CPP___EVENT, True);
  if AClassType.Declspec <> '' then
    UMLInterface.SetTaggedValueAsString(PROFILE_CPP, TAGSET_VCPP_DECLSPEC, TAG_CPP___DECLSPEC, AClassType.Declspec);

  if AClassType.BaseCount > 0 then
    RegisterTranslateItem(tkBase, AClassType, UMLInterface);
  for I := 0 to AClassType.DataMemberCount - 1 do
    if IsTranslateTarget(AClassType.DataMembers[I]) then
      TranslateCppDataMember(AClassType.DataMembers[I], UMLInterface);
  for I := 0 to AClassType.FunctionMemberCount - 1 do
    if IsTranslateTarget(AClassType.FunctionMembers[I]) then
      TranslateCppFunctionMember(AClassType.FunctionMembers[I], UMLInterface);
  for I := 0 to AClassType.TypeCount - 1 do
    if IsTranslateTarget(AClassType.Types[I]) then
      TranslateCppType(AClassType.Types[I], UMLInterface);
  for I := 0 to AClassType.TypeDefCount - 1 do
    TranslateCppTypeDef(AClassType.TypeDefs[I], UMLInterface);
  for I := 0 to AClassType.FriendClassCount - 1 do
    TranslateCppFriendClass(AClassType.FriendClasses[I], UMLInterface);

  // NamespaceAlias

  CppElementTranslated(AClassType);
end;

procedure PModelTranslator.TranslateCppDataMember(ADataMember: PCppDataMember; Owner: IUMLClassifier);
var
  UMLAttribute: IUMLAttribute;
begin
  CheckTranslatingAborted;
  if FRefAsAssociation then
    RegisterTranslateItem(tkFieldAsAssoc, ADataMember, Owner)
  else begin
    UMLAttribute := FStarUMLApp.UMLFactory.CreateAttribute(Owner);
    UMLAttribute.Name := ADataMember.Name;
    UMLElementAdded(UMLAttribute);
    RegisterTranslateItem(tkFieldType, ADataMember, UMLAttribute);
    SetUMLAttributeProperty(ADataMember, UMLAttribute);
    CppElementTranslated(ADataMember);
  end;
end;

procedure PModelTranslator.TranslateCppFriendClass(AFriendClass: PCppFriendClass; Owner: IUMLClassifier);
begin
  CheckTranslatingAborted;
  RegisterTranslateItem(tkFriendClass, AFriendClass, Owner);
end;

procedure PModelTranslator.TranslateCppFunctionMember(AFunctionMember: PCppFunctionMember; Owner: IUMLClassifier);
var
  UMLOperation: IUMLOperation;
  I: Integer;
begin
  CheckTranslatingAborted;
  UMLOperation := FStarUMLApp.UMLFactory.CreateOperation(Owner);
  UMLOperation.Name := AFunctionMember.Name;
  UMLElementAdded(UMLOperation);
  if AFunctionMember.IsMacro then
    UMLOperation.SetStereotype2(PROFILE_CPP, STEREOTYPE_CPP_MACRO);
  if AFunctionMember.ReturnType <> '' then
    RegisterTranslateItem(tkReturnType, AFunctionMember, UMLOperation);
  UMLOperation.Visibility := AccessSpecToUMLVisibilityKind(AFunctionMember.AccessSpecifier, GetDefaultMemberVisibility(Owner));
  if AFunctionMember.IsVirtual then
    UMLOperation.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_CPP_VIRTUAL, TAG_CPP_VIRTUAL, True);
  UMLOperation.IsAbstract := AFunctionMember.IsPureVirtual;
  if AFunctionMember.IsStatic then
    UMLOperation.OwnerScope := skClassifier;
  if AFunctionMember.IsOperator then
    UMLOperation.SetStereotype2(PROFILE_CPP, STEREOTYPE_CPP_OPERATOR);
  if AFunctionMember.IsInline then
    UMLOperation.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_CPP_MEMBER_FUNCTION, TAG_CPP_INLINE, True);
  if AFunctionMember.IsConst then
    UMLOperation.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_CPP_CONST, TAG_CPP_CONST, True);
  if AFunctionMember.IsConstructor then
    UMLOperation.SetStereotype2(PROFILE_STANDARD, STEREOTYPE_CREATE);
  if AFunctionMember.IsDestructor then
    UMLOperation.SetStereotype2(PROFILE_STANDARD, STEREOTYPE_DESTROY);
  if AFunctionMember.IsFriend then
    UMLOperation.SetStereotype2(PROFILE_STANDARD, STEREOTYPE_CPP_FRIEND);
  if AFunctionMember.Template <> '' then
    UMLOperation.SetTaggedValueAsString(PROFILE_CPP, TAGSET_CPP_MEMBER_FUNCTION, TAG_CPP_FUNCTION_TEMPLATE, AFunctionMember.Template);
  if AFunctionMember.Throw <> '' then
    UMLOperation.SetTaggedValueAsString(PROFILE_CPP, TAGSET_CPP_MEMBER_FUNCTION, TAG_CPP_THROW, AFunctionMember.Throw);
  UMLOperation.IsLeaf := AFunctionMember.IsSealed;
  if AFunctionMember.IsEvent then
    UMLOperation.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_EVENT, TAG_CPP___EVENT, True);
  case AFunctionMember.CallingConvention of
    // ckNotDefined: nothing
    ckCdecl:
      UMLOperation.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_MEMBER_FUNCTION, TAG_CPP___CDECL, True);
    ckStdcall:
      UMLOperation.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_MEMBER_FUNCTION, TAG_CPP___STDCALL, True);
    ckFastcall:
      UMLOperation.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_MEMBER_FUNCTION, TAG_CPP___FASTCALL, True);
  end;
  if AFunctionMember.IsForceInline then
    UMLOperation.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_MEMBER_FUNCTION, TAG_CPP___FORCE_INLINE, True);
  if AFunctionMember.Is__Inline then
    UMLOperation.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_MEMBER_FUNCTION, TAG_CPP___INLINE, True);
  if AFunctionMember.IsProperty then
    UMLOperation.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_MEMBER_FUNCTION, TAG_CPP___PROPERTY, True);
  if AFunctionMember.Declspec <> '' then
    UMLOperation.SetTaggedValueAsString(PROFILE_CPP, TAGSET_VCPP_DECLSPEC, TAG_CPP___DECLSPEC, AFunctionMember.Declspec);

  // Delegate 처리 (CppElementTranslated 2번 호출?)

  for I := 0 to AFunctionMember.ParameterCount - 1 do
    TranslateCppParameter(AFunctionMember.Parameters[I], UMLOperation);

  CppElementTranslated(AFunctionMember);
end;

procedure PModelTranslator.TranslateCppParameter(AParameter: PCppParameter; Operation: IUMLOperation);
var
  UMLParameter: IUMLParameter;
begin
  CheckTranslatingAborted;
  UMLParameter := FStarUMLApp.UMLFactory.CreateParameter(Operation);
  UMLParameter.Name := AParameter.Name;
  UMLElementAdded(UMLParameter);
  RegisterTranslateItem(tkParameterType, AParameter, UMLParameter);
  if AParameter.IsConst then
    UMLParameter.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_CPP_CONST, TAG_CPP_CONST, True);
  UMLParameter.DefaultValue := AParameter.DefaultValue;
  CppElementTranslated(AParameter);
end;

procedure PModelTranslator.TranslateCppEnumeration(AEnumeration: PCppEnumeration; Owner: IUMLNamespace);
var
  UMLEnum: IUMLEnumeration;
  I: Integer;
begin
  UMLEnum := FStarUMLApp.UMLFactory.CreateEnumeration(Owner);
  NamingSafely(UMLEnum, AEnumeration.Name);
  UMLElementAdded(UMLEnum);
  RegisterTypeTranslation(AEnumeration, UMLEnum);

  for I := 0 to AEnumeration.ItemCount - 1 do
    TranslateCppEnumerationItem(AEnumeration.Items[I], UMLEnum);
end;

procedure PModelTranslator.TranslateCppEnumerationItem(AEnumerationItem: PCppEnumerationItem; Enumeration: IUMLEnumeration);
var
  UMLEnumLiteral: IUMLEnumerationLiteral;
begin
  UMLEnumLiteral := FStarUMLApp.UMLFactory.CreateEnumerationLiteral(Enumeration);
  UMLEnumLiteral.Name := AEnumerationItem.Name;
  if AEnumerationItem.Value <> '' then
    UMLEnumLiteral.SetTaggedValueAsString(PROFILE_CPP, TAGSET_CPP_ENUM_LITERAL, TAG_CPP_ENUM_LITERAL_VALUE, AEnumerationItem.Value);
end;

procedure PModelTranslator.TranslateCppTemplate(ATemplate: PCppTemplate; Owner: IUMLClass);
var
  Param: PCppAbstractParameter;
  I: Integer;
begin
  for I := 0 to ATemplate.ParameterCount - 1 do begin
    Param := ATemplate.Parameters[I];
    if Param is PCppParameter then
      TranslateCppParameter(Param as PCppParameter, Owner)
    else if Param is PCppTypeParameter then
      TranslateCppTypeParameter(Param as PCppTypeParameter, Owner);
  end;
end;

procedure PModelTranslator.TranslateCppParameter(AParameter: PCppParameter; Owner: IUMLClass);
var
  UMLTemplateParam: IUMLTemplateParameter;
begin
  UMLTemplateParam := FStarUMLApp.UMLFactory.CreateTemplateParameter(Owner);
  UMLTemplateParam.Name := AParameter.Name;
  UMLElementAdded(UMLTemplateParam);
  UMLTemplateParam.ParameterType := AParameter.Type_;  
  UMLTemplateParam.DefaultValue := AParameter.DefaultValue;
  CppElementTranslated(AParameter);
end;

procedure PModelTranslator.TranslateCppTypeParameter(ATypeParameter: PCppTypeParameter; Owner: IUMLClass);
var
  UMLTemplateParam: IUMLTemplateParameter;
begin
  UMLTemplateParam := FStarUMLApp.UMLFactory.CreateTemplateParameter(Owner);
  UMLTemplateParam.Name := ATypeParameter.Name;
  UMLElementAdded(UMLTemplateParam);
  case ATypeParameter.ArgumentKind of
    tkClass:
      UMLTemplateParam.ParameterType := 'class';
    tkTypeName:
      UMLTemplateParam.ParameterType := 'typename';
  end;
end;

procedure PModelTranslator.TranslateCppGlobalDelegateFunction(ADelegateFunction: PCppGlobalDelegateFunction; Owner: IUMLNamespace);
var
  UMLClass: IUMLClass;
begin
  UMLClass := FStarUMLApp.UMLFactory.CreateClass(Owner);
  NamingSafely(UMLClass, ADelegateFunction.Name);
  UMLElementAdded(UMLClass);

  // create operation for delegate

  CppElementTranslated(ADelegateFunction);
end;

procedure PModelTranslator.TranslateCppTypeDef(ATypedef: PCppTypeDef; Owner: IUMLNamespace);
var
  UMLClass: IUMLClass;
begin
  UMLClass := FStarUMLApp.UMLFactory.CreateClass(Owner);
  NamingSafely(UMLClass, ATypeDef.Name);
  UMLElementAdded(UMLClass);
  UMLClass.SetStereotype2(PROFILE_CPP, STEREOTYPE_CPP_TYPEDEF);
  if ATypedef.TypePointer <> '' then
    UMLClass.SetTaggedValueAsString(PROFILE_CPP, TAGSET_CPP_TYPEDEF, TAG_CPP_TYPEDEF_POINTER, ATypedef.TypePointer);
  if (ATypedef.SynonymType <> nil) or (ATypedef.Definition <> '') then
    RegisterTranslateItem(tkTypedefSynonym, ATypeDef, UMLClass);
  CppElementTranslated(ATypeDef);
end;

procedure PModelTranslator.SetUMLAttributeProperty(ADataMember: PCppDataMember; AAttribute: IUMLAttribute);
begin
  AAttribute.Visibility := AccessSpecToUMLVisibilityKind(ADataMember.AccessSpecifier, GetDefaultMemberVisibility(AAttribute.Owner));
  if ADataMember.IsConst then
    AAttribute.Changeability := ckFrozen;
  if ADataMember.IsStatic then
    AAttribute.OwnerScope := skClassifier;
  if ADataMember.IsMutable then
    AAttribute.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_CPP_MEMBER_DATA, TAG_CPP_MUTABLE, True);
  if ADataMember.IsVolatile then
    AAttribute.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_CPP_MEMBER_DATA, TAG_CPP_VOLATILE, True);
  if ADataMember.BitField <> '' then
    AAttribute.SetTaggedValueAsInteger(PROFILE_CPP, TAGSET_CPP_BIT_FIELD, TAG_CPP_BIT_FIELD, StrToIntDef(ADataMember.BitField, 0));
  if ADataMember.IsGc then
    AAttribute.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_GC, TAG_CPP___GC, True);
  if ADataMember.IsNoGc then
    AAttribute.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_GC, TAG_CPP___NOGC, True);
  if ADataMember.IsEvent then
    AAttribute.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_EVENT, TAG_CPP___EVENT, True);
  if ADataMember.W64 then
    AAttribute.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_W64, TAG_CPP___W64, True);
  if ADataMember.Based <> '' then
    AAttribute.SetTaggedValueAsString(PROFILE_CPP, TAGSET_VCPP_BASED, TAG_CPP___BASED, ADataMember.Based);
  if ADataMember.Declspec <> '' then
    AAttribute.SetTaggedValueAsString(PROFILE_CPP, TAGSET_VCPP_DECLSPEC, TAG_CPP___DECLSPEC, ADataMember.Declspec);
end;

procedure PModelTranslator.Translate2ndStep;
var
  T: PTranslateItem;
  C, Total: Integer;
  I: Integer;
begin
  if Assigned(FOnSecondTranslationStep) then
    FOnSecondTranslationStep(Self);

  C := 0;
  Total := TranslateItems.Count;

  // 2-1. translate inheritance relations
  for I := 0 to TranslateItems.Count - 1 do begin
    CheckTranslatingAborted;
    T := TranslateItems.Items[I];
    if T.TranslateItemKind = tkBase then begin
      TranslateBase(T);
      Inc(C);
      TranslateItemTranslated(T, C, Total);
    end;
  end;

  // 2-2. tranlate other items
  for I := 0 to TranslateItems.Count - 1 do begin
    CheckTranslatingAborted;
    T := TranslateItems.Items[I];
    if T.TranslateItemKind in [tkFieldType, tkFieldAsAssoc, tkReturnType,
      tkParameterType, tkNamespaceUsing, tkTypedefSynonym, tkFriendClass] then begin
      case T.TranslateItemKind of
        tkFieldType:
          TranslateFieldType(T);
        tkFieldAsAssoc:
          TranslateFieldAsAssoc(T);
        tkReturnType:
          TranslateReturnType(T);
        tkParameterType:
          TranslateParameterType(T);
        tkNamespaceUsing:
          TranslateNamespaceUsing(T);
        tkTypedefSynonym:
          TranslateTypedefSynonym(T);
        tkFriendClass:
          TranslateFriendClass(T);          
      end;
      Inc(C);
      TranslateItemTranslated(T, C, Total);
    end;
  end;
end;

procedure PModelTranslator.TranslateBase(AItem: PTranslateItem);
var
  ClassType: PCppClassType;
  Base: PCppBase;
  Clsf: IUMLClassifier;
  Cls, BaseCls: IUMLClass;
  Intf, BaseIntf: IUMLInterface;
  Gen: IUMLGeneralization;
  Rel: IUMLRealization;
  I: Integer;
begin
  Assert(AItem.CppElement is PCppClassType);

  ClassType := AItem.CppElement as PCppClassType;
  if AItem.UMLElement.QueryInterface(IUMLClass, Cls) = S_OK then begin
    for I := 0 to ClassType.BaseCount - 1 do begin
      Base := ClassType.Bases[I];
      Clsf := ModelFinder.FindClassifier(ClassType, Cls, Base.Name);
      if Clsf = nil then
        Log(Format(ERR_REVERSE_NO_SUPER_CLASS, [Cls.Name, Base.Name]))
      else begin
        if Clsf.QueryInterface(IUMLClass, BaseCls) = S_OK then begin
          Gen := FStarUMLApp.UMLFactory.CreateGeneralization(GetOwnerPackage(Cls), BaseCls, Cls);   // more... as package
          Gen.Visibility := AccessSpecToUMLVisibilityKind(Base.AccessSpecifier, GetDefaultMemberVisibility(Cls));
          if Base.IsVirtual then
            Gen.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_CPP_VIRTUAL, TAG_CPP_VIRTUAL, True);
          UMLElementAdded(Gen);
        end
        else if Clsf.QueryInterface(IUMLInterface, BaseIntf) = S_OK then begin
          Rel := FStarUMLApp.UMLFactory.CreateRealization(GetOwnerPackage(Cls), Cls, BaseIntf);
          Rel.Visibility := AccessSpecToUMLVisibilityKind(Base.AccessSpecifier, GetDefaultMemberVisibility(Cls));
          if Base.IsVirtual then
            Rel.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_CPP_VIRTUAL, TAG_CPP_VIRTUAL, True);
          UMLElementAdded(Rel);
        end
        else
          Log(Format(ERR_REVERSE_NO_SUPER_CLASS, [Cls.Name, Base.Name]));
      end;
    end;
  end

  else if AItem.UMLElement.QueryInterface(IUMLInterface, Intf) = S_OK then begin
    for I := 0 to ClassType.BaseCount - 1 do begin
      Base := ClassType.Bases[I];
      Clsf := ModelFinder.FindClassifier(ClassType, Intf, Base.Name);
      if Cls = nil then
        Log(Format(ERR_REVERSE_NO_SUPER_INTERFACE, [Intf.Name, Base.Name]))
      else begin
        if Cls.QueryInterface(IUMLInterface, BaseIntf) = S_OK then begin
          Gen := FStarUMLApp.UMLFactory.CreateGeneralization(GetOwnerPackage(Intf), BaseIntf, Intf);   // more... as package
          Gen.Visibility := AccessSpecToUMLVisibilityKind(Base.AccessSpecifier, vkPublic);
          if Base.IsVirtual then
            Gen.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_CPP_VIRTUAL, TAG_CPP_VIRTUAL, True);
          UMLElementAdded(Gen);
        end
        else
          Log(Format(ERR_REVERSE_NO_SUPER_INTERFACE, [Intf.Name, Base.Name]));
      end;
    end;
  end
  else
    raise Exception.Create('');
end;

procedure PModelTranslator.TranslateFieldType(AItem: PTranslateItem);
var
  DataMember: PCppDataMember;
  Attr: IUMLAttribute;
  Clsf: IUMLClassifier;
begin
  Assert(AItem.CppElement is PCppDataMember);
  Assert(AItem.UMLElement.QueryInterface(IUMLAttribute, Attr) = S_OK);

  DataMember := AItem.CppElement as PCppDataMember;
  AItem.UMLElement.QueryInterface(IUMLAttribute, Attr);
  Attr.Type_ := nil;
  Attr.TypeExpression := '';
  if DataMember.Type_ <> '' then begin
    Clsf := ModelFinder.FindClassifier(DataMember.DeclaringClassType, Attr.Owner, DataMember.Type_);
    if Clsf = nil then
      Attr.TypeExpression := DataMember.Type_
    else
      Attr.Type_ := Clsf;
    if DataMember.TypePointer <> '' then
      Attr.SetTaggedValueAsString(PROFILE_CPP, TAGSET_CPP_POINTER, TAG_CPP_POINTER, DataMember.TypePointer);
  end;
// (todo) Type Dimension / Pointer type
end;

procedure PModelTranslator.TranslateFieldAsAssoc(AItem: PTranslateItem);
var
  DataMember: PCppDataMember;
  Clsf, ClsfOther: IUMLClassifier;
  Assoc: IUMLAssociation;
  OwnAssocEnd, OtherAssocEnd: IUMLAssociationEnd;
  Attr: IUMLAttribute;
begin
  Assert(AItem.CppElement is PCppDataMember);
  Assert(AItem.UMLElement.QueryInterface(IUMLClassifier, Clsf) = S_OK);

  DataMember := AItem.CppElement as PCppDataMember;
  AItem.UMLElement.QueryInterface(IUMLClassifier, Clsf);
  if DataMember.Type_ <> '' then begin
    ClsfOther := ModelFinder.FindClassifier(DataMember.DeclaringClassType, Clsf, DataMember.Type_);
    if ClsfOther = nil then begin
      Attr := FStarUMLApp.UMLFactory.CreateAttribute(Clsf);
      Attr.Name := DataMember.Name;
      Attr.Type_ := nil;
      Attr.TypeExpression := DataMember.Type_;
      if DataMember.TypePointer <> '' then
        Attr.SetTaggedValueAsString(PROFILE_CPP, TAGSET_CPP_POINTER, TAG_CPP_POINTER, DataMember.TypePointer);
      UMLElementAdded(Attr);
      SetUMLAttributeProperty(DataMember, Attr);
    end
    else begin
      Assoc := FStarUMLApp.UMLFactory.CreateAssociation(GetOwnerPackage(Clsf), Clsf, ClsfOther);
      OwnAssocEnd := Assoc.GetConnectionAt(0);
      OtherAssocEnd := Assoc.GetConnectionAt(1);
      OwnAssocEnd.IsNavigable := False;
      OtherAssocEnd.Name := DataMember.Name;
      OtherAssocEnd.Visibility := AccessSpecToUMLVisibilityKind(DataMember.AccessSpecifier, GetDefaultMemberVisibility(Clsf));
      if DataMember.TypePointer <> '' then
        OtherAssocEnd.SetTaggedValueAsString(PROFILE_CPP, TAGSET_CPP_POINTER, TAG_CPP_POINTER, DataMember.TypePointer);
      UMLElementAdded(Assoc);
      // Type Dimension?
      if DataMember.IsConst then
        OtherAssocEnd.Changeability := ckFrozen;
      if DataMember.IsStatic then
        OtherAssocEnd.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_CPP_STATIC, TAG_CPP_STATIC, True);
      if DataMember.IsMutable then
        OtherAssocEnd.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_CPP_MEMBER_DATA, TAG_CPP_MUTABLE, True);
      if DataMember.IsVolatile then
        OtherAssocEnd.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_CPP_MEMBER_DATA, TAG_CPP_VOLATILE, True);
      if DataMember.IsGc then
        OtherAssocEnd.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_GC, TAG_CPP___GC, True);
      if DataMember.IsNoGc then
        OtherAssocEnd.SetTaggedValueAsBoolean(PROFILE_CPP, TAGSET_VCPP_GC, TAG_CPP___NOGC, True);
      if DataMember.Declspec <> '' then
        OtherAssocEnd.SetTaggedValueAsString(PROFILE_CPP, TAGSET_VCPP_DECLSPEC, TAG_CPP___DECLSPEC, DataMember.Declspec);
    end;
  end;    
end;

procedure PModelTranslator.TranslateFriendClass(AItem: PTranslateItem);
var
  FriendClass: PCppFriendClass;
  Cls, Friend: IUMLClassifier;
  Dependency: IUMLDependency;
begin
  Assert(AItem.CppElement is PCppFriendClass);
  Assert(AItem.UMLElement.QueryInterface(IUMLClassifier, Cls) = S_OK);

  FriendClass := AItem.CppElement as PCppFriendClass;
  AItem.UMLElement.QueryInterface(IUMLClassifier, Cls);
  if FriendClass.Name <> '' then begin
    Friend := ModelFinder.FindClassifier(FriendClass.DeclaringClassType, Cls, FriendClass.Name);
    if Friend <> nil then begin
      Dependency := FStarUMLApp.UMLFactory.CreateDependency(Cls.Namespace, Cls, Friend);
      Dependency.SetStereotype2(PROFILE_CPP, STEREOTYPE_CPP_FRIEND);
    end;
  end;
end;

procedure PModelTranslator.TranslateReturnType(AItem: PTranslateItem);
var
  FunctionMember: PCppFunctionMember;
  Oper: IUMLOperation;
  Cls: IUMLClassifier;
  Param: IUMLParameter;
begin
  Assert(AItem.CppElement is PCppFunctionMember);
  Assert(AItem.UMLElement.QueryInterface(IUMLOperation, Oper) = S_OK);

  FunctionMember := AItem.CppElement as PCppFunctionMember;
  AItem.UMLElement.QueryInterface(IUMLOperation, Oper);
  if FunctionMember.IsConstructor or FunctionMember.IsDestructor then
    Exit;

  Param := FStarUMLApp.UMLFactory.CreateParameter(Oper);
  Param.Name := 'return';
  Param.DirectionKind := pdkReturn;
  Param.Type_ := nil;
  Param.TypeExpression := '';
  if FunctionMember.ReturnType <> '' then begin
    Cls := ModelFinder.FindClassifier(FunctionMember.DeclaringClassType, Oper.Owner, FunctionMember.ReturnType);
    if Cls = nil then
      Param.TypeExpression := FunctionMember.ReturnType
    else
      Param.Type_ := Cls;
    if FunctionMember.ReturnTypePointer <> '' then
      Param.SetTaggedValueAsString(PROFILE_CPP, TAGSET_CPP_POINTER, TAG_CPP_POINTER, FunctionMember.ReturnTypePointer);
  end;
  // type dimension , pointer
  UMLElementAdded(Param);
end;

procedure PModelTranslator.TranslateParameterType(AItem: PTranslateItem);
var
  Parameter: PCppParameter;
  Param: IUMLParameter;
  Cls: IUMLClassifier;
begin
  Assert(AItem.CppElement is PCppParameter);
  Assert(AItem.UMLElement.QueryInterface(IUMLParameter, Param) = S_OK);

  Parameter := AItem.CppElement as PCppParameter;
  AItem.UMLElement.QueryInterface(IUMLParameter, Param);
  Param.Type_ := nil;
  Param.TypeExpression := '';
  if Parameter.Type_ <> '' then begin
    Cls := ModelFinder.FindClassifier(Parameter.FunctionMember.DeclaringClassType,
      (Param.BehavioralFeature as IUMLOperation).Owner, Parameter.Type_);
    if Cls = nil then
      Param.TypeExpression := Parameter.Type_
    else
      Param.Type_ := Cls;
    if Parameter.TypePointer <> '' then
      Param.SetTaggedValueAsString(PROFILE_CPP, TAGSET_CPP_POINTER, TAG_CPP_POINTER, Parameter.TypePointer);
  end;
  // type dimension
end;

procedure PModelTranslator.TranslateNamespaceUsing(AItem: PTranslateItem);
begin
//
end;

procedure PModelTranslator.TranslateTypedefSynonym(AItem: PTranslateItem);
var
  Typedef: PCppTypedef;
  Cls: IUMLClass;
  Synonym: IUMLClassifier;  // indeed, autonym
  Dependency: IUMLDependency;
begin
  Assert(AItem.CppElement is PCppTypedef);
  Assert(AItem.UMLElement.QueryInterface(IUMLClass, Cls) = S_OK);
  Typedef := AItem.CppElement as PCppTypedef;
  AItem.UMLElement.QueryInterface(IUMLClass, Cls);
  if Typedef.SynonymType <> nil then
    Synonym := FindUMLClassifierWithCppType(Typedef.SynonymType)
  else if Typedef.Definition <> '' then
    Synonym := ModelFinder.FindClassifier(nil, Cls, Typedef.Definition);
  if Synonym <> nil then begin
    Dependency := FStarUMLApp.UMLFactory.CreateDependency(Cls.Namespace, Cls, Synonym);
    Dependency.SetStereotype2(PROFILE_CPP, STEREOTYPE_CPP_SYNONYM);
    UMLElementAdded(Dependency);
  end;
  if Typedef.Definition <> '' then
    Cls.SetTaggedValueAsString(PROFILE_CPP, TAGSET_CPP_TYPEDEF, TAG_CPP_TYPEDEF_DEFINITION, Typedef.Definition);
end;

procedure PModelTranslator.Translate;
begin
  if not Initialized then
    raise ENotInitialized.Create(ERR_MT_NOT_INITIALIZED);
  IsOnTranslating := True;
  try
    try
      ClearTranslateItems;
      if IsOnTranslating then
        Translate1stStep;
      if IsOnTranslating then
        Translate2ndStep;
    except
      on ETranslatingAborted do begin
      // do nothing
      end;
    end;
  finally
    ClearTranslateItems;
    ClearTypeTranslations;    
    IsOnTranslating := False;
  end;
end;

procedure PModelTranslator.Abort;
begin
  IsOnTranslating := False;
end;

//  PModelTranslator
////////////////////////////////////////////////////////////////////////////////

end.
