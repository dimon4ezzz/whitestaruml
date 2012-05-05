unit RevEngModelTranslate;

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

{
  DATE: July 31, 2011
  AUTHOR: FRANK E. HERNANDEZ
  A.K.A: CODE MINION
  
  MODIFICATIONS:
  PModelFinder.StripGeneric - This function takes in a type as a string
  and removes the generics section of it. It is used to fix the filename
  before it gets written.
  Example: input: TestClass<T> output:TestClass

  Changed PModelFinder.FindTypeModel to save the name of the models and
  replace the names for the non-generics version. This names are used for
  finding associations with other classes. After the function is finished
  the names are reset to their initial values.

  PModelFinder.FindTypeModelBasedOnTypeDeclarations - Added a work-around
  for dealing with generics. Since generics is part of the name we can no
  longer use the UMLPackage.FindByName function to find the associated classes
  because it wont match. This work-around iterates through every owned elemtent
  of the package and checks against a non-generic version of the element.

  PModelTranslator.TranslateFieldAsAssoc - Made some modifications to
  this function to create Aggregations instead of association. 

}
interface

uses
  WSJavaParser15_TLB, WhiteStarUML_TLB,
  Classes, SysUtils, StrUtils;

const
  {CODE MINION}
  PATH_DELIMITER = '::';

type
  // forward declarations
  PTranslateItem = class;

  // enumerations
  PTranslateItemKind = (tkExtends, tkImplements, tkFieldType, tkFieldAsAssoc,
    tkReturnType, tkParameterType, tkPackageImport, tkMethodJavaDoc);

  // exceptions
  ETranslatingAborted = class(Exception);

  // events
  PUMLElementEvent = procedure(Sender: TObject; Element: IUMLElement) of object;
  PJavaElementEvent = procedure(Sender: TObject; JavaElememt: IJavaElement; Index, Total: Integer) of object;
  PTranslateItemEvent = procedure(Sender: TObject; TranslateItem: PTranslateItem; Index, Total: Integer) of object;
  PMessageEvent = procedure(Sender: TObject; Kind: InformationMessageKind; Text: string; ElementLink: IElement) of object;
  PLogEvent = procedure(Sender: TObject; Msg: string) of object;

  // PTranslateItem
  PTranslateItem = class
  private
    FTranslateItemKind: PTranslateItemKind;
    FJavaElement: IJavaElement;
    FUMLElement: IUMLElement;
  public
    constructor Create(ATranslateItemKind: PTranslateItemKind; AJavaElement: IJavaElement;
      AUMLElement: IUMLElement);
    property TranslateItemKind: PTranslateItemKind read FTranslateItemKind;
    property JavaElement: IJavaElement read FJavaElement;
    property UMLElement: IUMLElement read FUMLElement;
  end;

  // PModelFinder
  PModelFinder = class
  private
    FTopPackage: IUMLPackage;
    procedure SetTopPackage(Value: IUMLPackage);
    function IsQualifiedTypeName(TypeExpr: string): Boolean;
    function IsKindOfType(M: IModel): Boolean;
    function GetModelNamespace(CodePath: string): string;
    function GetModelPath(CodePath: string): string;
    function FindTypeModelInImportsByName(BaseJavaType: IJavaType; TypeExpr: string): IModel;
    function FindTypeModelInImportsByPath(BaseJavaType: IJavaType; TypeExpr: string): IModel;
    function FindTypeModelInSuperType(BaseUMLClassifier: IUMLClassifier; TypeExpr: string): IModel;
    function FindTypeModelBasedOnMemberClass(BaseJavaType: IJavaType; BaseUMLClassifier: IUMLClassifier; TypeExpr: string): IModel;
    function FindTypeModelBasedOnTypeDeclarations(BaseJavaType: IJavaType; BaseUMLClassifier: IUMLClassifier; TypeExpr: string): IModel;
    {CODE MINION HELPER FUNCTIONS}
    function StripGeneric(typeWithGenerics: string):string;
    //function FindByName(BaseUMLClassifier: IModel; AName: string): IModel;
    function FindByName(BaseUMLClassifier: IUMLClassifier; AName: string): IModel;
    //function FindByRelativePathname(BaseUMLClassifier: IModel; RelPath: string): IModel;
    function FindByRelativePathname(BaseUMLClassifier: IUMLClassifier; RelPath: string): IModel;
    function ExtractHeadName(Pathname: string): string;
    function ExtractTailPath(Pathname: string): string;
  public
    function FindTypeModel(BaseJavaType: IJavaType; BaseUMLClassifier: IUMLClassifier; TypeExpr: string): IUMLClassifier;
    function FindPackage(ImportExpr: string): IUMLPackage;
    property TopPackage: IUMLPackage read FTopPackage write SetTopPackage;
  end;

  // PModelTranslator
  PModelTranslator = class
  private
    Parser: IJavaParserObj;
    StarUMLApp: IStarUMLApplication;
    ModelFinder: PModelFinder;
    FTopPackage: IUMLPackage;
    FElements: TInterfaceList;
    TranslateItems: TList;
    // internal variable
    TransJavaTotal: Integer;
    TransJavaCount: Integer;
    IsOnTranslating: Boolean;
    // options
    FTranslatePublicMember: Boolean;
    FTranslatePackageMember: Boolean;
    FTranslateProtectedMember: Boolean;
    FTranslatePrivateMember: Boolean;
    FRefAsAssociation: Boolean;
    FOmitInitialValue: Boolean;
    FReverseJavaDoc: Boolean;
    // events
    FOn1stStepTranslating: TNotifyEvent;
    FOn2ndStepTranslating: TNotifyEvent;
    FOnAddUMLElement: PUMLElementEvent;
    FOnTranslateJavaElement: PJavaElementEvent;
    FOnTranslateTransItem: PTranslateItemEvent;
    FOnMessage: PMessageEvent;
    FOnLog: PLogEvent;
    // getter-setter
    procedure SetTopPackage(Value: IUMLPackage);
    // UML model translating related methods (1st step)
    procedure Translate1stStep;
    procedure TranslatePackage(APackage: IJavaPackage; Parent: IUMLNameSpace);
    procedure TranslateType(AType: IJavaType; Parent: IUMLNameSpace);
    procedure TranslateClass(AClass: IJavaType; Parent: IUMLNameSpace);
    procedure TranslateInterface(AInterface: IJavaType; Parent: IUMLNameSpace);
    procedure TranslateField(AField: IJavaField; Parent: IUMLClassifier);
    procedure TranslateMethod(AMethod: IJavaMethod; Parent: IUMLClassifier);
    procedure TranslateParameter(AParameter: IJavaParameter; Parent: IUMLOperation);
    procedure RegisterTranslateItem(ATranslateItemKind: PTranslateItemKind; AJavaElement: IJavaElement;
      AUMLElement: IUMLElement);
    // UML model translating related methods (2nd step)
    procedure Translate2ndStep;
    procedure TranslateExtends(AItem: PTranslateItem);
    procedure TranslateImplements(AItem: PTranslateItem);
    procedure TranslateFieldType(AItem: PTranslateItem);
    procedure TranslateFieldAsAssoc(AItem: PTranslateItem);
    procedure TranslateMethodReturnType(AItem: PTranslateItem);
    procedure TranslateParameterType(AItem: PTranslateItem);
    procedure TranslatePackageImport(AItem: PTranslateItem);
    procedure TranslateMethodJavaDoc(AItem: PTranslateItem);
    // auxiliary functions
    procedure CheckTranslatingAborted;
    function GetOwnerPackage(AClassifier: IUMLClassifier): IUMLPackage;
    procedure NamingSafely(ANamespace: IUMLNamespace; Name: string);
    function ExistsImportDependency(ClientPackage, SupplierPackage: IUMLPackage): Boolean;
    function GetJavaDocStr(CommentStr: string): string;
    procedure ReadJavaDocStr(UMLOperation: IUMLOperation; CommentStr: string);
    procedure EvaluateJavaElementCount;
    // event raising related
    procedure UMLElementAdded(Element: IUMLElement);
    procedure JavaElementTranslated(Element: IJavaElement);
    procedure AddMessage(Kind: InformationMessageKind; Text: string; ElementLink: IElement);
    procedure Log(Msg: string);

  public
    constructor Create(AParser: IJavaParserObj; AStarUMLApp: IStarUMLApplication);
    destructor Destroy; override;
    procedure Clear;
    procedure Translate;
    procedure Abort;
    // properties
    property TopPackage: IUMLPackage read FTopPackage write SetTopPackage;
    // options
    property TranslatePublicMember: Boolean read FTranslatePublicMember write FTranslatePublicMember;
    property TranslatePackageMember: Boolean read FTranslatePackageMember write FTranslatePackageMember;
    property TranslateProtectedMember: Boolean read FTranslateProtectedMember write FTranslateProtectedMember;
    property TranslatePrivateMember: Boolean read FTranslatePrivateMember write FTranslatePrivateMember;
    property RefAsAssociation: Boolean read FRefAsAssociation write FRefAsAssociation;
    property OmitInitialValue: Boolean read FOmitInitialValue write FOmitInitialValue;
    property ReverseJavaDoc: Boolean read FReverseJavaDoc write FReverseJavaDoc;
    // events
    property On1stStepTranslating: TNotifyEvent read FOn1stStepTranslating write FOn1stStepTranslating;
    property On2ndStepTranslating: TNotifyEvent read FOn2ndStepTranslating write FOn2ndStepTranslating;
    property OnAddUMLElement: PUMLElementEvent read FOnAddUMLElement write FOnAddUMLElement;
    property OnTranslateJavaElement: PJavaElementEvent read FOnTranslateJavaElement write FOnTranslateJavaElement;
    property OnTranslateTransItem: PTranslateItemEvent read FOnTranslateTransItem write FOnTranslateTransItem;
    property OnMessage: PMessageEvent read FOnMessage write FOnMessage;
    property OnLog: PLogEvent read FOnLog write FOnLog;
  end;

implementation

uses
  JavaDoc, Symbols,
  NLS_JavaAddIn;

/////////////////////////////////////////////////////////////////////////////
// PTranslateItem

constructor PTranslateItem.Create(ATranslateItemKind: PTranslateItemKind; AJavaElement: IJavaElement;
  AUMLElement: IUMLElement);
begin
  FTranslateItemKind := ATranslateItemKind;
  FJavaElement := AJavaElement;
  FUMLElement := AUMLElement;
end;

// PTranslateItem
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PModelFinder

procedure PModelFinder.SetTopPackage(Value: IUMLPackage);
begin
  FTopPackage := Value;
end;

function PModelFinder.IsQualifiedTypeName(TypeExpr: string): Boolean;
begin
  Result := (Pos('.', TypeExpr) > 0);
end;

function PModelFinder.IsKindOfType(M: IModel): Boolean;
begin
  Result := (M.IsKindOf(ELEM_CLASS) or M.IsKindOf(ELEM_INTERFACE));
end;

function PModelFinder.GetModelNamespace(CodePath: string): string;
var
  ST: TStringList;
  S: string;
  I: Integer;
begin
  ST := TStringList.Create;
  try
    ST.Delimiter := '.';
    ST.DelimitedText := CodePath;
    Assert(ST.Count > 0);
    S := ST[0];
    for I := 1 to ST.Count - 2 do
      S := S + '::' + ST[I];
  finally
    ST.Free;
  end;
  Result := S;
end;

function PModelFinder.GetModelPath(CodePath: string): string;
var
  ST: TStringList;
  S: string;
  I: Integer;
begin
  ST := TStringList.Create;
  try
    ST.Delimiter := '.';
    ST.DelimitedText := CodePath;
    Assert(ST.Count > 0);
    S := ST[0];
    for I := 1 to ST.Count - 1 do
      S := S + '::' + ST.Strings[I];
  finally
    ST.Free;
  end;
  Result := S;
end;

function PModelFinder.FindTypeModelInImportsByName(BaseJavaType: IJavaType; TypeExpr: string): IModel;
var
  JI: IJavaImport;
  M: IModel;
  I: Integer;
begin
  Assert(BaseJavaType <> nil);
  Result := nil;

  // CODE MINION
  // Replaced to handle generics.
  for I := 0 to BaseJavaType.CompilationUnit.GetImportCount - 1 do begin
    JI := BaseJavaType.CompilationUnit.GetImportAt(I);
    // find in type-import-on-demand
    if JI.IsOnDemand then begin
      M := FindByRelativePathname(FTopPackage, GetModelNameSpace(JI.Name) + '::' + TypeExpr);
      if (M <> nil) and IsKindOfType(M) then begin
        Result := M;
        Exit;
      end;
    end

    // find in single-type-import
    else begin
      if JI.GetPathFragmentAt(JI.GetPathFragmentCount - 1) = TypeExpr then begin
        M := FindByRelativePathname(FTopPackage, GetModelPath(JI.Name));
        if (M <> nil) and IsKindOfType(M) then begin
          Result := M;
          Exit;
        end;
      end;
    end;
  end;

{
  for I := 0 to BaseJavaType.CompilationUnit.GetImportCount - 1 do begin
    JI := BaseJavaType.CompilationUnit.GetImportAt(I);
    // find in type-import-on-demand
    if JI.IsOnDemand then begin
      M := FTopPackage.FindByRelativePathname(GetModelNameSpace(JI.Name) + '::' + TypeExpr);
      if (M <> nil) and IsKindOfType(M) then begin
        Result := M;
        Exit;
      end;
    end

    // find in single-type-import
    else begin
      if JI.GetPathFragmentAt(JI.GetPathFragmentCount - 1) = TypeExpr then begin
        M := FTopPackage.FindByRelativePathname(GetModelPath(JI.Name));
        if (M <> nil) and IsKindOfType(M) then begin
          Result := M;
          Exit;
        end;
      end;
    end;
  end;
}

  // CODE MINION
  // Replaced to handle generics.
  for I := 0 to Length(AUTO_IMPORTS) - 1 do begin
    M := FindByRelativePathname(FTopPackage, GetModelNameSpace(AUTO_IMPORTS[I]) + '::' + TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
  end;

{
  for I := 0 to Length(AUTO_IMPORTS) - 1 do begin
    M := FTopPackage.FindByRelativePathname(GetModelNameSpace(AUTO_IMPORTS[I]) + '::' + TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
  end;
}
end;

function PModelFinder.FindTypeModelInImportsByPath(BaseJavaType: IJavaType; TypeExpr: string): IModel;
var
  JI: IJavaImport;
  M: IModel;
  I: Integer;
begin
  Assert(BaseJavaType <> nil);
  Result := nil;
  for I := 0 to BaseJavaType.CompilationUnit.GetImportCount - 1 do begin
    JI := BaseJavaType.CompilationUnit.GetImportAt(I);

    // if TypeExpr is 'Pacakage.Type' format then need not search,
    // because it will be found in 'FindTypeModelBasedOn...' method (from TopPackage).

    // if TypeExpr is 'Type.Type' format
    M := FindByRelativePathname(FTopPackage, GetModelNameSpace(JI.Name) + '::' + GetModelPath(TypeExpr));
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
  end;
  for I := 0 to Length(AUTO_IMPORTS) - 1 do begin
    M := FindByRelativePathname(FTopPackage, GetModelNameSpace(AUTO_IMPORTS[I]) + '::' + GetModelPath(TypeExpr));
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
  end;

{
    // if TypeExpr is 'Type.Type' format
    M := FTopPackage.FindByRelativePathname(GetModelNameSpace(JI.Name) + '::' + GetModelPath(TypeExpr));
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
  end;
  for I := 0 to Length(AUTO_IMPORTS) - 1 do begin
    M := FTopPackage.FindByRelativePathname(GetModelNameSpace(AUTO_IMPORTS[I]) + '::' + GetModelPath(TypeExpr));
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
  end;
}
end;

function PModelFinder.FindTypeModelInSuperType(BaseUMLClassifier: IUMLClassifier; TypeExpr: string): IModel;
var
  M: IModel;
  ME: IUMLModelElement;
  GE: IUMLGeneralizableElement;
  I: Integer;
begin
  Result := nil;

  // CODE MINION
  // Replaced to handle generics.
  for I := 0 to BaseUMLClassifier.GetGeneralizationCount - 1 do begin
    GE := BaseUMLClassifier.GetGeneralizationAt(I).Parent;
    if IsQualifiedTypeName(TypeExpr) then
      M := FindByRelativePathname(GE as IUMLClassifier, GetModelPath(TypeExpr))
    else
      M := FindByName(GE as IUMLClassifier, TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;

{
  for I := 0 to BaseUMLClassifier.GetGeneralizationCount - 1 do begin
    GE := BaseUMLClassifier.GetGeneralizationAt(I).Parent;
    if IsQualifiedTypeName(TypeExpr) then
      M := GE.FindByRelativePathname(GetModelPath(TypeExpr))
    else
      M := GE.FindByName(TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
}
    if GE.IsKindOf(ELEM_CLASSIFIER) then begin
      M := FindTypeModelInSuperType(GE as IUMLClassifier, TypeExpr);
      if (M <> nil) and IsKindOfType(M) then begin
        Result := M;
        Exit;
      end;
    end;
  end;

  // CODE MINION
  // Replaced to handle generics.
  for I := 0 to BaseUMLClassifier.GetClientDependencyCount - 1 do begin
    if BaseUMLClassifier.GetClientDependencyAt(I).IsKindOf(ELEM_REALIZATION) then begin
      ME := BaseUMLClassifier.GetClientDependencyAt(I).Supplier;
      if IsQualifiedTypeName(TypeExpr) then
        M := FindByRelativePathname(ME as IUMLCLassifier, GetModelPath(TypeExpr))
      else
        M := FindByName(ME as IUMLClassifier, TypeExpr);
      if (M <> nil) and IsKindOfType(M) then begin
        Result := M;
        Exit;
      end;
      if ME.IsKindOf(ELEM_CLASSIFIER) then begin
        M := FindTypeModelInSuperType(ME as IUMLClassifier, TypeExpr);
        if (M <> nil) and IsKindOfType(M) then begin
          Result := M;
          Exit;
        end;
      end;
    end;
  end;

{
  for I := 0 to BaseUMLClassifier.GetClientDependencyCount - 1 do begin
    if BaseUMLClassifier.GetClientDependencyAt(I).IsKindOf(ELEM_REALIZATION) then begin
      ME := BaseUMLClassifier.GetClientDependencyAt(I).Supplier;
      if IsQualifiedTypeName(TypeExpr) then
        M := ME.FindByRelativePathname(GetModelPath(TypeExpr))
      else
        M := ME.FindByName(TypeExpr);
      if (M <> nil) and IsKindOfType(M) then begin
        Result := M;
        Exit;
      end;
      if ME.IsKindOf(ELEM_CLASSIFIER) then begin
        M := FindTypeModelInSuperType(ME as IUMLClassifier, TypeExpr);
        if (M <> nil) and IsKindOfType(M) then begin
          Result := M;
          Exit;
        end;
      end;
    end;
  end;
}
end;

function PModelFinder.FindTypeModelBasedOnMemberClass(BaseJavaType: IJavaType; BaseUMLClassifier: IUMLClassifier; TypeExpr: string): IModel;
var
  MPath: string;
  M: IModel;
  N: IUMLNamespace;
  tempName : string; // Used to hold the old name before checking
begin
  Assert(BaseJavaType <> nil);
  Assert(BaseJavaType.Package = nil);
  Assert((BaseUMLClassifier <> nil) and IsKindOfType(BaseUMLClassifier));

  Result := nil;

  // if qualified type name like 'java.util.vector'
  if IsQualifiedTypeName(TypeExpr) then begin
    MPath := GetModelPath(TypeExpr);
    // CODE MINION
    // Replaced to handle generics
    // first, find in it's descendant
    M := FindByRelativePathname(BaseUMLClassifier, MPath);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;

{
    // first, find in it's descendant
    M := BaseUMLClassifier.FindByRelativePathname(MPath);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
 }   
    // find in owner-type going back to the owner-package
    N := BaseUMLClassifier;
    while (N <> nil) and IsKindOfType(N) do begin
      // CODE MINION
      // Replaced to handle generics.
      M := FindByRelativePathname(N as IUMLClassifier , MPath);
{
      M := N.FindByRelativePathname(MPath);
}
      if (M <> nil) and IsKindOfType(M) then begin
        Result := M;
        Exit;
      end;
      // find in super-type
      if N.IsKindOf(ELEM_CLASSIFIER) then begin
        M := FindTypeModelInSuperType(N as IUMLClassifier, TypeExpr);
        if (M <> nil) and IsKindOfType(M) then begin
          Result := M;
          Exit;
        end;
      end;
      N := N.Namespace;
    end;
    // find in owner-package
    if (N <> nil) and N.IsKindOf(ELEM_PACKAGE) then begin
      // CODE MINION
      // Replaced to handle generics.
      M := FindByRelativePathname(N as IUMLClassifier, MPath);
{
      M := N.FindByRelativePathname(MPath);
}
      if (M <> nil) and IsKindOfType(M) then begin
        Result := M;
        Exit;
      end;
    end;
    // CODE MINION
    // Replaced to handle generics.
    // find in top package
    M := FindByRelativePathname(FTopPackage, MPath);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;

{
    // find in top package
    M := FTopPackage.FindByRelativePathname(MPath);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
}
    // find in imported packages
    M := FindTypeModelInImportsByPath(BaseJavaType, TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
  end

  // if just only name
  else begin
    //CODE MINION
    // Replaced to handle generics.
    // first, compare with BaseUMLClassifier itself
    if StripGeneric(BaseUMLClassifier.Name) = StripGeneric(TypeExpr) then begin
      Result := BaseUMLClassifier;
      Exit;
    end;

{
    if BaseUMLClassifier.Name = TypeExpr then begin
      Result := BaseUMLClassifier;
      Exit;
    end;
}

    // CODE MINION
    // Replaced to handle generics.
    // find in it's descendant
    M := FindByName(BaseUMLClassifier, TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      // Return name value back
      Result := M;
      Exit;
    end;

{
    // find in it's descendant
    M := BaseUMLClassifier.FindByName(TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      // Return name value back
      Result := M;
      Exit;
    end;
}
    // CODE MINION
    // Replaced to handle generics.
    // find in owner-type going back to the owner-package
    N := BaseUMLClassifier;
    while (N <> nil) and IsKindOfType(N) do begin
      M := FindByName(N as IUMLClassifier, TypeExpr);
      if (M <> nil) and IsKindOfType(M) then begin
        Result := M;
        Exit;
      end;

{
      M := N.FindByName(TypeExpr);
      if (M <> nil) and IsKindOfType(M) then begin
        Result := M;
        Exit;
      end;
}
      // find in super-type
      if N.IsKindOf(ELEM_CLASSIFIER) then begin
        M := FindTypeModelInSuperType(N as IUMLClassifier, TypeExpr);
        if (M <> nil) and IsKindOfType(M) then begin
          Result := M;
          Exit;
        end;
      end;
      N := N.Namespace;
    end;
    // CODE MINION
    // Replaced to handle generics.
    // find in owner-package
    if (N <> nil) and N.IsKindOf(ELEM_PACKAGE) then begin
      M := FindByName(N as IUMLClassifier, TypeExpr);
      if (M <> nil) and IsKindOfType(M) then begin
        Result := M;
        Exit;
      end;
    end;

{
    // find in owner-package
    if (N <> nil) and N.IsKindOf(ELEM_PACKAGE) then begin
      M := N.FindByName(TypeExpr);
      if (M <> nil) and IsKindOfType(M) then begin
        Result := M;
        Exit;
      end;
    end;
}
    // find in imported packages
    M := FindTypeModelInImportsByName(BaseJavaType, TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
  end;
end;

function PModelFinder.FindTypeModelBasedOnTypeDeclarations(BaseJavaType: IJavaType; BaseUMLClassifier: IUMLClassifier; TypeExpr: string): IModel;
var
  UMLPackage: IUMLPackage;
  MPath: string;
  M: IModel;
  tempName :string; // added to store the old name CODE MINION
  I: Integer;
begin
  Assert(BaseJavaType <> nil);
  Assert(BaseJavaType.Package <> nil);
  Assert((BaseUMLClassifier <> nil) and IsKindOfType(BaseUMLClassifier));
  Assert(BaseUMLClassifier.Namespace.QueryInterface(IUMLPackage, UMLPackage) = S_OK);

  Result := nil;
  // if qualified type name like 'java.util.vector'
  if IsQualifiedTypeName(TypeExpr) then begin
    // first, find in it's descendant
    MPath := GetModelPath(TypeExpr);
    M := FindByRelativePathname(BaseUMLClassifier, MPath);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;

{
  if IsQualifiedTypeName(TypeExpr) then begin
    M := BaseUMLClassifier.FindByRelativePathname(MPath);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
}
    // find in super-type
    M := FindTypeModelInSuperType(BaseUMLClassifier, TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
    // CODE MINION
    // Replaced by personal function to handle
    // generics.
    // find in owner-package
    M := FindByRelativePathname(UMLPackage, MPath);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;

{
    // find in owner-package
    M := UMLPackage.FindByRelativePathname(MPath);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
}
    // CODE MINION
    // Replaced by personal function to handle
    // generics.

    // find in top package
    M := FindByRelativePathname(FTopPackage, MPath);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;

{
    // find in top package
    M := FTopPackage.FindByRelativePathname(MPath);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
}
    // find in imports
    M := FindTypeModelInImportsByPath(BaseJavaType, TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
  end
  // if just only name
  else begin
    // CODE MINION
    // Replaced by personal function to handle
    // generics.
    // first, compare with BaseUMLClassifier itself
    if StripGeneric(BaseUMLClassifier.Name) = StripGeneric(TypeExpr) then begin
      Result := BaseUMLClassifier;
      Exit;
    end;

{
    // first, compare with BaseUMLClassifier itself
    if BaseUMLClassifier.Name = TypeExpr then begin
      Result := BaseUMLClassifier;
      Exit;
    end;
}
    // CODE MINION
    // Replaced by personal function to handle
    // generics.
    M := FindByName(BaseUMLClassifier, TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      // Return name value back
      Result := M;
      Exit;
    end;

{    M := BaseUMLClassifier.FindByName(TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      // Return name value back
      Result := M;
      Exit;
    end;
}
    // find in super-type
    M := FindTypeModelInSuperType(BaseUMLClassifier, TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;

{
    // WORK-AROUND #1
    // AUTHOR: CODE MINION
    // This is used to check a package memeber's without checking
    // the generics tag as part of the name.
    UMLPackage.Name := StripGeneric(UMLPackage.Name);
    for I := 0 to UMLPackage.GetOwnedElementCount - 1 do begin
    M := UMLPackage.GetOwnedElementAt(I);
    if StripGeneric(M.Name) = TypeExpr then begin
      Result := M;
      Exit;
    end;
  end;
}
    // WORK-AROUND #1
    // AUTHOR: CODE MINION
    // This is used to check a package memeber's without checking
    // the generics tag as part of the name.
    // find in owner-package
    M := FindByName(UMLPackage, TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
{
    // Replaced By WORK-AROUND #1
    // REMOVED BY : CODE MINION
    // find in owner-package
    M := UMLPackage.FindByName(TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
}    // find in imports
    M := FindTypeModelInImportsByName(BaseJavaType, TypeExpr);
    if (M <> nil) and IsKindOfType(M) then begin
      Result := M;
      Exit;
    end;
  end;
end;

function PModelFinder.FindTypeModel(BaseJavaType: IJavaType; BaseUMLClassifier: IUMLClassifier; TypeExpr: string): IUMLClassifier;
var
  M: IModel;
  // CODE MINION
  tempName: string;
  tempTypeExpr: string;
begin
  Assert(FTopPackage <> nil);
  Result := nil;
  // Save the name of the UMLClassifier.
  tempName := BaseUMLClassifier.Name;
  // Replace the name of the UMLClassifier with non-generic version.
  BaseUMLClassifier.Name := StripGeneric(BaseUMLClassifier.Name);
  // Save TypeExpr
  tempTypeExpr := TypeExpr;
  // Replace TypeExpr with non generic version.
  TypeExpr := StripGeneric(TypeExpr);

  if BaseJavaType.Package = nil then
    M := FindTypeModelBasedOnMemberClass(BaseJavaType, BaseUMLClassifier, TypeExpr)
  else
    M := FindTypeModelBasedOnTypeDeclarations(BaseJavaType, BaseUMLClassifier, TypeExpr);
  if M <> nil then
    M.QueryInterface(IUMLClassifier, Result);

  // Restore Values
  BaseUMLClassifier.Name := tempName;
  TypeExpr := tempTypeExpr;

end;

function PModelFinder.FindPackage(ImportExpr: string): IUMLPackage;
var
  M: IModel;
begin
  Result := nil;
  M := FTopPackage.FindByRelativePathname(GetModelNamespace(ImportExpr));
  if (M <> nil) and M.IsKindOf(ELEM_PACKAGE) then
    M.QueryInterface(IUMLPackage, Result);
end;

//CODE MINION
// Helper Functions
function PModelFinder.FindByName(BaseUMLClassifier: IUMLClassifier; AName: string): IModel;
var
  I: Integer;
  M: IModel;
begin
  for I := 0 to BaseUMLClassifier.GetOwnedElementCount - 1 do begin
    M := BaseUMLClassifier.GetOwnedElementAt(I);
    if StripGeneric(M.Name) = StripGeneric(AName) then begin
      Result := M;
      Exit;
    end;
  end;

  Result := nil;
end;

// Function taken from the Core.pass file of StarUML.
// Needed to overload this function for my generics.
function PModelFinder.FindByRelativePathname(BaseUMLClassifier: IUMLClassifier; RelPath: string): IModel;
var
  M: IModel;
begin
  if ExtractTailPath(RelPath) = '' then begin
    Result := FindByName(BaseUMLClassifier, RelPath);
  end
  else begin
    M := FindByName(BaseUMLClassifier, ExtractHeadName(RelPath));
    if M = nil then
      Result := nil
    else
      Result := FindByRelativePathname(M as IUMLClassifier, ExtractTailPath(RelPath));
  end;
end;

// Function taken from the Core.pass file of StarUML.
// Needed to overload this function for my generics.
function PModelFinder.ExtractHeadName(Pathname: string): string;
var
  Idx: Integer;
begin
  Idx := Pos(PATH_DELIMITER, Pathname);
  if Idx = 0 then
    Result := Pathname
  else
    Result := Copy(Pathname, 0, Idx - 1);
end;

// Function taken from the Core.pass file of StarUML.
// Needed to overload this function for my generics.
function PModelFinder.ExtractTailPath(Pathname: string): string;
var
  Idx: Integer;
begin
  Idx := Pos(PATH_DELIMITER, Pathname);
  if Idx = 0 then
    Result := ''
  else
    Result := Copy(Pathname, Idx + 2, Length(Pathname) - Idx - 1);
end;


// This function strips the generics tags <> from the class leaving
// just the name.
function PModelFinder.StripGeneric(typeWithGenerics: string):string;
var
  genericStart, stringSize : integer;
  typeFixed : string;

begin
  typeFixed := typeWithGenerics;
  // Get the position of the '<' this means the start of the generics.
  genericStart := Pos('<', typeWithGenerics);
  // If genericStart is 0 it means that this type does not support generics.
  if(genericStart <> 0) then
  begin

    // Get the size of the old string.
    stringSize := Length(typeWithGenerics);
    // calcualte new length without generics
    stringSize := stringSize - (stringSize - (genericStart -1));
    // If it has generics then create a substring of the name that does not
    // contains the generics portion.
    // Create new string.
    typeFixed := LeftStr(typeWithGenerics, stringSize);

    // Remove white spaces.
    typeFixed := Trim(typeFixed);

    //Result := typeFixed;
    end;

    Result := typeFixed;
end;

// PModelFinder
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PModelTranslator

constructor PModelTranslator.Create(AParser: IJavaParserObj; AStarUMLApp: IStarUMLApplication);
begin
  Parser := AParser;
  FElements := TInterfaceList.Create;
  TranslateItems := TList.Create;
  ModelFinder := PModelFinder.Create;
  StarUMLApp := AStarUMLApp;
  TransJavaTotal := 0;
  TransJavaCount := 0;
  IsOnTranslating := False;
end;

destructor PModelTranslator.Destroy;
begin
  Clear;
  FElements.Free;
  TranslateItems.Free;
  ModelFinder.Free;
  inherited;
end;

procedure PModelTranslator.SetTopPackage(Value: IUMLPackage);
begin
  FTopPackage := Value;
  ModelFinder.TopPackage := Value;
end;

procedure PModelTranslator.Translate1stStep;
var
  I: Integer;
begin
  EvaluateJavaElementCount;
  CheckTranslatingAborted;
  for I := 0 to Parser.GetPackageCount - 1 do
    TranslatePackage(Parser.GetPackageAt(I), FTopPackage);
end;

procedure PModelTranslator.TranslatePackage(APackage: IJavaPackage; Parent: IUMLNameSpace);
var
  UMLPackage: IUMLPackage;
  I: Integer;
begin
  CheckTranslatingAborted;
  if APackage.IsDefaultPackage then begin
    // types
    for I := 0 to APackage.GetTypeCount - 1 do
      TranslateType(APackage.GetTypeAt(I), Parent);
    // imports
    if APackage.GetCompilationUnitCount > 0 then
      RegisterTranslateItem(tkPackageImport, APackage, FTopPackage);
  end
  else begin
    UMLPackage := StarUMLApp.UMLFactory.CreatePackage(Parent);
    NamingSafely(UMLPackage, APackage.Name);
    if FReverseJavaDoc then
      UMLPackage.Documentation := GetJavaDocStr(APackage.Documentation);
    UMLElementAdded(UMLPackage);
    // subpackages
    for I := 0 to APackage.GetSubPackageCount - 1 do
      TranslatePackage(APackage.GetSubPackageAt(I), UMLPackage);
    // types
    for I := 0 to APackage.GetTypeCount - 1 do
      TranslateType(APackage.GetTypeAt(I), UMLPackage);
    // imports
    if APackage.GetCompilationUnitCount > 0 then
      RegisterTranslateItem(tkPackageImport, APackage, UMLPackage);
  end;
  JavaElementTranslated(APackage);
end;

procedure PModelTranslator.TranslateType(AType: IJavaType; Parent: IUMLNameSpace);
begin
  CheckTranslatingAborted;
  if AType.IsClass then
    TranslateClass(AType, Parent)
  else if AType.IsInterface then
    TranslateInterface(AType, Parent);
end;

procedure PModelTranslator.TranslateClass(AClass: IJavaType; Parent: IUMLNameSpace);
var
  UMLClass: IUMLClass;
  I: Integer;
begin
  Assert(AClass.IsClass);
  CheckTranslatingAborted;
  UMLClass := StarUMLApp.UMLFactory.CreateClass(Parent);
  NamingSafely(UMLClass, AClass.Name);
  UMLClass.Visibility := AClass.Visibility;
  if AClass.IsStrictfp then
    UMLClass.SetTaggedValueAsBoolean(PROFILE_JAVA15, TAGSET_STRICTFP, TAG_STRICTFP, True);
  if AClass.IsStatic then
    UMLClass.SetTaggedValueAsBoolean(PROFILE_JAVA15, TAGSET_CLASS, TAG_STATIC, True);
  UMLClass.IsLeaf := AClass.IsFinal;
  UMLClass.IsAbstract := AClass.IsAbstract;
  if FReverseJavaDoc then
    UMLClass.Documentation := GetJavaDocStr(AClass.Documentation);
  if AClass.SuperClass <> '' then
    RegisterTranslateItem(tkExtends, AClass, UMLClass);
  if AClass.GetSuperInterfaceCount > 0 then
    RegisterTranslateItem(tkImplements, AClass, UMLClass);
  UMLElementAdded(UMLClass);
  // fields
  for I := 0 to AClass.GetFieldCount - 1 do begin
    if FTranslatePublicMember and (AClass.GetFieldAt(I).Visibility = vkPublic) then
      TranslateField(AClass.GetFieldAt(I), UMLClass)
    else if FTranslatePackageMember and (AClass.GetFieldAt(I).Visibility = vkPackage) then
      TranslateField(AClass.GetFieldAt(I), UMLClass)
    else if FTranslateProtectedMember and (AClass.GetFieldAt(I).Visibility = vkProtected) then
      TranslateField(AClass.GetFieldAt(I), UMLClass)
    else if FTranslatePrivateMember and (AClass.GetFieldAt(I).Visibility = vkPrivate) then
      TranslateField(AClass.GetFieldAt(I), UMLClass);
  end;
  // methods
  for I := 0 to AClass.GetMethodCount - 1 do begin
    if FTranslatePublicMember and (AClass.GetMethodAt(I).Visibility = vkPublic) then
      TranslateMethod(AClass.GetMethodAt(I), UMLClass)
    else if FTranslatePackageMember and (AClass.GetMethodAt(I).Visibility = vkPackage) then
      TranslateMethod(AClass.GetMethodAt(I), UMLClass)
    else if FTranslateProtectedMember and (AClass.GetMethodAt(I).Visibility = vkProtected) then
      TranslateMethod(AClass.GetMethodAt(I), UMLClass)
    else if FTranslatePrivateMember and (AClass.GetMethodAt(I).Visibility = vkPrivate) then
      TranslateMethod(AClass.GetMethodAt(I), UMLClass);
  end;
  // types
  for I := 0 to AClass.GetTypeCount - 1 do begin
    if FTranslatePublicMember and (AClass.GetTypeAt(I).Visibility = vkPublic) then
      TranslateType(AClass.GetTypeAt(I), UMLClass)
    else if FTranslatePackageMember and (AClass.GetTypeAt(I).Visibility = vkPackage) then
      TranslateType(AClass.GetTypeAt(I), UMLClass)
    else if FTranslateProtectedMember and (AClass.GetTypeAt(I).Visibility = vkProtected) then
      TranslateType(AClass.GetTypeAt(I), UMLClass)
    else if FTranslatePrivateMember and (AClass.GetTypeAt(I).Visibility = vkPrivate) then
      TranslateType(AClass.GetTypeAt(I), UMLClass);
  end;
  JavaElementTranslated(AClass);
end;

procedure PModelTranslator.TranslateInterface(AInterface: IJavaType; Parent: IUMLNameSpace);
var
  UMLInterface: IUMLInterface;
  I: Integer;
begin
  Assert(AInterface.IsInterface);
  CheckTranslatingAborted;
  UMLInterface := StarUMLApp.UMLFactory.CreateInterface(Parent);
  NamingSafely(UMLInterface, AInterface.Name);
  if AInterface.IsStrictfp then
    UMLInterface.SetTaggedValueAsBoolean(PROFILE_JAVA15, TAGSET_STRICTFP, TAG_STRICTFP, True);
  if FReverseJavaDoc then
    UMLInterface.Documentation := GetJavaDocStr(AInterface.Documentation);
  if AInterface.GetSuperInterfaceCount > 0 then
    RegisterTranslateItem(tkExtends, AInterface, UMLInterface);
  UMLElementAdded(UMLInterface);
  // methods
  for I := 0 to AInterface.GetMethodCount - 1 do begin
    if FTranslatePublicMember and (AInterface.GetMethodAt(I).Visibility = vkPublic) then
      TranslateMethod(AInterface.GetMethodAt(I), UMLInterface)
    else if FTranslatePackageMember and (AInterface.GetMethodAt(I).Visibility = vkPackage) then
      TranslateMethod(AInterface.GetMethodAt(I), UMLInterface)
    else if FTranslateProtectedMember and (AInterface.GetMethodAt(I).Visibility = vkProtected) then
      TranslateMethod(AInterface.GetMethodAt(I), UMLInterface)
    else if FTranslatePrivateMember and (AInterface.GetMethodAt(I).Visibility = vkPrivate) then
      TranslateMethod(AInterface.GetMethodAt(I), UMLInterface);
  end;
  // types
  for I := 0 to AInterface.GetTypeCount - 1 do begin
    if FTranslatePublicMember and (AInterface.GetTypeAt(I).Visibility = vkPublic) then
      TranslateType(AInterface.GetTypeAt(I), UMLInterface)
    else if FTranslatePackageMember and (AInterface.GetTypeAt(I).Visibility = vkPackage) then
      TranslateType(AInterface.GetTypeAt(I), UMLInterface)
    else if FTranslateProtectedMember and (AInterface.GetTypeAt(I).Visibility = vkProtected) then
      TranslateType(AInterface.GetTypeAt(I), UMLInterface)
    else if FTranslatePrivateMember and (AInterface.GetTypeAt(I).Visibility = vkPrivate) then
      TranslateType(AInterface.GetTypeAt(I), UMLInterface);
  end;
  JavaElementTranslated(AInterface);
end;

procedure PModelTranslator.TranslateField(AField: IJavaField; Parent: IUMLClassifier);
var
  UMLAttribute: IUMLAttribute;
begin
  CheckTranslatingAborted;
  if FRefAsAssociation then begin
    RegisterTranslateItem(tkFieldAsAssoc, AField, Parent);
  end
  else begin
    UMLAttribute := StarUMLApp.UMLFactory.CreateAttribute(Parent);
    UMLAttribute.Name := AField.Name;
    RegisterTranslateItem(tkFieldType, AField, UMLAttribute);
    UMLAttribute.Visibility := AField.Visibility;
    if AField.IsStatic then
      UMLAttribute.OwnerScope := skClassifier;
    if AField.IsFinal then
      UMLAttribute.Changeability := ckFrozen;
    if AField.IsTransient then
      UMLAttribute.SetTaggedValueAsBoolean(PROFILE_JAVA15, TAGSET_FIELD, TAG_TRANSIENT, True);
    if AField.IsVolatile then
      UMLAttribute.SetTaggedValueAsBoolean(PROFILE_JAVA15, TAGSET_FIELD, TAG_VOLATILE, True);
    if not FOmitInitialValue then
      UMLAttribute.InitialValue := AField.InitializerExpression;
    if FReverseJavaDoc then
      UMLAttribute.Documentation := GetJavaDocStr(AField.Documentation);
    UMLElementAdded(UMLAttribute);
  end;
  JavaElementTranslated(AField);
end;

procedure PModelTranslator.TranslateMethod(AMethod: IJavaMethod; Parent: IUMLClassifier);
var
  UMLOperation: IUMLOperation;
  Throws: string;
  I: Integer;
begin
  CheckTranslatingAborted;
  UMLOperation := StarUMLApp.UMLFactory.CreateOperation(Parent);
  UMLOperation.Name := AMethod.Name;
  if AMethod.ReturnType <> '' then
    RegisterTranslateItem(tkReturnType, AMethod, UMLOperation);
  UMLOperation.Visibility := AMethod.Visibility;
  UMLOperation.IsAbstract := AMethod.IsAbstract;
  if AMethod.IsStatic then
    UMLOperation.OwnerScope := skClassifier;
  UMLOperation.IsLeaf := AMethod.IsFinal;
  if AMethod.IsNative then
    UMLOperation.SetTaggedValueAsBoolean(PROFILE_JAVA15, TAGSET_OPERATION, TAG_NATIVE, True);
  if AMethod.IsStrictfp then
    UMLOperation.SetTaggedValueAsBoolean(PROFILE_JAVA15, TAGSET_STRICTFP, TAG_STRICTFP, True);
  if AMethod.IsSynchronized then
    UMLOperation.Concurrency := cckGuarded;
  if AMethod.GetExceptionCount > 0 then begin
    Throws := AMethod.GetExceptionAt(0);
    for I := 1 to AMethod.GetExceptionCount - 1 do
      Throws := Throws + ', ' + AMethod.GetExceptionAt(I);
    UMLOperation.SetTaggedValueAsString(PROFILE_JAVA15, TAGSET_OPERATION, TAG_THROWS, Throws);
  end;
  if AMethod.IsConstructor then
    UMLOperation.SetStereotype2(PROFILE_STANDARD, STD_STEREOTYPE_CREATE);
  UMLElementAdded(UMLOperation);
  for I := 0 to AMethod.GetParameterCount - 1 do
    TranslateParameter(AMethod.GetParameterAt(I), UMLOperation);
  if FReverseJavaDoc then
    RegisterTranslateItem(tkMethodJavaDoc, AMethod, UMLOperation);
  JavaElementTranslated(AMethod);
end;

procedure PModelTranslator.TranslateParameter(AParameter: IJavaParameter; Parent: IUMLOperation);
var
  UMLParameter: IUMLParameter;
begin
  CheckTranslatingAborted;
  UMLParameter := StarUMLApp.UMLFactory.CreateParameter(Parent);
  UMLParameter.Name := AParameter.Name;
  RegisterTranslateItem(tkParameterType, AParameter, UMLParameter);
  if AParameter.IsFinal then
    UMLParameter.SetTaggedValueAsBoolean(PROFILE_JAVA15, TAGSET_PARAM, TAG_FINAL, True);
  UMLElementAdded(UMLParameter);
  JavaElementTranslated(AParameter);
end;

procedure PModelTranslator.RegisterTranslateItem(ATranslateItemKind: PTranslateItemKind; AJavaElement: IJavaElement;
  AUMLElement: IUMLElement);
var
  T: PTranslateItem;
begin
  T := PTranslateItem.Create(ATranslateItemKind, AJavaElement, AUMLElement);
  TranslateItems.Add(T);
end;

procedure PModelTranslator.Translate2ndStep;
var
  T: PTranslateItem;
  C: Integer;
  I: Integer;
begin
  C := 0;

  // 2-1. translate inheritance relations
  for I := 0 to TranslateItems.Count - 1 do begin
    CheckTranslatingAborted;
    T := TranslateItems.Items[I];
    if T.TranslateItemKind in [tkExtends, tkImplements] then begin
      C := C + 1;
      case T.TranslateItemKind of
        tkExtends:
          TranslateExtends(T);
        tkImplements:
          TranslateImplements(T);
      end;
      if Assigned(FOnTranslateTransItem) then
        FOnTranslateTransItem(Self, T, C, TranslateItems.Count);
    end;
  end;

  // 2-2. tranlate other items
  for I := 0 to TranslateItems.Count - 1 do begin
    CheckTranslatingAborted;
    T := TranslateItems.Items[I];
    if T.TranslateItemKind in [tkFieldType, tkFieldAsAssoc, tkReturnType, tkParameterType, tkPackageImport, tkMethodJavaDoc] then begin
      C := C + 1;
      case T.TranslateItemKind of
        tkMethodJavaDoc:
          TranslateMethodJavaDoc(T);
        tkFieldType:
          TranslateFieldType(T);
        tkFieldAsAssoc:
          TranslateFieldAsAssoc(T);
        tkReturnType:
          TranslateMethodReturnType(T);
        tkParameterType:
          TranslateParameterType(T);
        tkPackageImport:
          TranslatePackageImport(T);
      end;
      if Assigned(FOnTranslateTransItem) then
        FOnTranslateTransItem(Self, T, C, TranslateItems.Count);
    end;
  end;
end;

procedure PModelTranslator.TranslateExtends(AItem: PTranslateItem);
var
  AType: IJavaType;
  UMLClass: IUMLClass;
  UMLInterface: IUMLInterface;
  UMLGeneralization: IUMLGeneralization;
  Owner: IUMLPackage;
  SuperClass, SuperInterface: IUMLClassifier;
  I: Integer;
begin
  Assert(AItem.JavaElement.QueryInterface(IJavaType, AType) = S_OK);
  if AType.IsClass then begin
    Assert(AItem.UMLElement.QueryInterface(IUMLClass, UMLClass) = S_OK);
    Assert(AType.SuperClass <> '');
    SuperClass := ModelFinder.FindTypeModel(AType, UMLClass, AType.SuperClass);
    if SuperClass = nil then
      AddMessage(mkGeneral, Format(ERR_REVERSE_NO_SUPER_CLASS
      , [UMLClass.Name, AType.SuperClass]), UMLClass)
    else begin
      Owner := GetOwnerPackage(UMLClass);
      if Owner = nil then
        Owner := FTopPackage;
      UMLGeneralization := StarUMLApp.UMLFactory.CreateGeneralization(Owner, SuperClass, UMLClass);
      UMLElementAdded(UMLGeneralization);
    end;
  end
  else if AType.IsInterface then begin
    Assert(AItem.UMLElement.QueryInterface(IUMLInterface, UMLInterface) = S_OK);
    Assert(AType.GetSuperInterfaceCount > 0);
    for I := 0 to AType.GetSuperInterfaceCount - 1 do begin
      SuperInterface := ModelFinder.FindTypeModel(AType, UMLInterface, AType.GetSuperInterfaceAt(I));
      if SuperInterface = nil then
        AddMessage(mkGeneral, Format(ERR_REVERSE_NO_SUPER_INTERFACE
        , [UMLInterface.Name, AType.GetSuperInterfaceAt(I)]), UMLInterface)
      else begin
        Owner := GetOwnerPackage(UMLInterface);
        if Owner = nil then
          Owner := FTopPackage;
        UMLGeneralization := StarUMLApp.UMLFactory.CreateGeneralization(Owner, SuperInterface, UMLInterface);
        UMLElementAdded(UMLGeneralization);
      end;
    end;
  end;
end;

procedure PModelTranslator.TranslateImplements(AItem: PTranslateItem);
var
  AType: IJavaType;
  UMLClass: IUMLClass;
  UMLRealization: IUMLRealization;
  Owner: IUMLPackage;
  SuperInterface: IUMLClassifier;
  I: Integer;
begin
  Assert(AItem.JavaElement.QueryInterface(IJavaType, AType) = S_OK);
  if AType.IsClass then begin
    Assert(AItem.UMLElement.QueryInterface(IUMLClass, UMLClass) = S_OK);
    Assert(AType.GetSuperInterfaceCount > 0);
    for I := 0 to AType.GetSuperInterfaceCount - 1 do begin
      SuperInterface := ModelFinder.FindTypeModel(AType, UMLClass, AType.GetSuperInterfaceAt(I));
      if SuperInterface = nil then
        AddMessage(mkGeneral, Format(ERR_REVERSE_NO_SUPER_INTERFACE2
        , [UMLClass.Name, AType.GetSuperInterfaceAt(I)]), UMLClass)
      else begin
        Owner := GetOwnerPackage(UMLClass);
        if Owner = nil then
          Owner := FTopPackage;
        UMLRealization := StarUMLApp.UMLFactory.CreateRealization(Owner, UMLClass, SuperInterface);
        UMLElementAdded(UMLRealization);
      end;
    end;
  end;
end;

procedure PModelTranslator.TranslateFieldType(AItem: PTranslateItem);
var
  AField: IJavaField;
  UMLAttribute: IUMLAttribute;
  M: IUMLClassifier;
begin
  Assert(AItem.JavaElement.QueryInterface(IJavaField, AField) = S_OK);
  Assert(AItem.UMLElement.QueryInterface(IUMLAttribute, UMLAttribute) = S_OK);
  M := ModelFinder.FindTypeModel(AField.DeclaringType, UMLAttribute.Owner, AField.Type_);
  if M <> nil then
    UMLAttribute.Type_ := M
  else
    UMLAttribute.TypeExpression := AField.Type_;
  if AField.TypeDimension <> 0 then begin
    UMLAttribute.Multiplicity := '*';
    UMLAttribute.SetTaggedValueAsInteger(PROFILE_JAVA15, TAGSET_DIMEN, TAG_DIMEN, AField.TypeDimension);
  end;
end;

procedure PModelTranslator.TranslateFieldAsAssoc(AItem: PTranslateItem);
var
  AField: IJavaField;
  UMLClassifier: IUMLClassifier;
  UMLAssoc: IUMLAssociation;
  OwnAssocEnd, OtherAssocEnd: IUMLAssociationEnd;
  UMLAttribute: IUMLAttribute;
  Owner: IUMLPackage;
  M: IUMLClassifier;
begin
  Assert(AItem.JavaElement.QueryInterface(IJavaField, AField) = S_OK);
  Assert(AItem.UMLElement.QueryInterface(IUMLClassifier, UMLClassifier) = S_OK);
  M := ModelFinder.FindTypeModel(AField.DeclaringType, UMLClassifier, AField.Type_);
  if M <> nil then begin
    Owner := GetOwnerPackage(UMLClassifier);
    if Owner = nil then
      Owner := FTopPackage;
    UMLAssoc := StarUMLApp.UMLFactory.CreateAssociation(Owner, UMLClassifier, M);
    OwnAssocEnd := UMLAssoc.GetConnectionAt(0);
    OtherAssocEnd := UMLAssoc.GetConnectionAt(1);
    OwnAssocEnd.IsNavigable := False;
    OtherAssocEnd.Name := AField.Name;
    OtherAssocEnd.Visibility := AField.Visibility;
    // CODE MINION
    // In java the associations should be aggregations
    // Instead of an association, we will create an agregation.
    //OwnAssocEnd.Aggregation:= akAggregate;
    // Also we dont need the relation to be navigable.
    //OtherAssocEnd.IsNavigable := false;
    
    if AField.TypeDimension <> 0 then begin
      OtherAssocEnd.Multiplicity := '*';
      OtherAssocEnd.SetTaggedValueAsInteger(PROFILE_JAVA15, TAGSET_DIMEN, TAG_DIMEN, AField.TypeDimension);
    end;
    if AField.IsFinal then
      OtherAssocEnd.Changeability := ckFrozen;
    if AField.IsTransient then
      OtherAssocEnd.SetTaggedValueAsBoolean(PROFILE_JAVA15, TAGSET_FIELD, TAG_TRANSIENT, True);
    if AField.IsVolatile then
      OtherAssocEnd.SetTaggedValueAsBoolean(PROFILE_JAVA15, TAGSET_FIELD, TAG_VOLATILE, True);
    if FReverseJavaDoc then
      OtherAssocEnd.Documentation := GetJavaDocStr(AField.Documentation);
    UMLElementAdded(UMLAssoc);
  end
  else begin
    UMLAttribute := StarUMLApp.UMLFactory.CreateAttribute(UMLClassifier);
    UMLAttribute.Name := AField.Name;
    UMLAttribute.TypeExpression := AField.Type_;
    if AField.TypeDimension <> 0 then begin
      UMLAttribute.Multiplicity := '*';
      UMLAttribute.SetTaggedValueAsInteger(PROFILE_JAVA15, TAGSET_DIMEN, TAG_DIMEN, AField.TypeDimension);
    end;
    UMLAttribute.Visibility := AField.Visibility;
    if AField.IsStatic then
      UMLAttribute.OwnerScope := skClassifier;
    if AField.IsFinal then
      UMLAttribute.Changeability := ckFrozen;
    if AField.IsTransient then
      UMLAttribute.SetTaggedValueAsBoolean(PROFILE_JAVA15, TAGSET_FIELD, TAG_TRANSIENT, True);
    if AField.IsVolatile then
      UMLAttribute.SetTaggedValueAsBoolean(PROFILE_JAVA15, TAGSET_FIELD, TAG_VOLATILE, True);
    if not FOmitInitialValue then
      UMLAttribute.InitialValue := AField.InitializerExpression;
    if FReverseJavaDoc then
      UMLAttribute.Documentation := GetJavaDocStr(AField.Documentation);
    UMLElementAdded(UMLAttribute);
  end;
end;

procedure PModelTranslator.TranslateMethodReturnType(AItem: PTranslateItem);
var
  AMethod: IJavaMethod;
  UMLOperation: IUMLOperation;
  UMLParameter: IUMLParameter;
  M: IUMLClassifier;
begin
  Assert(AItem.JavaElement.QueryInterface(IJavaMethod, AMethod) = S_OK);
  Assert(AItem.UMLElement.QueryInterface(IUMLOperation, UMLOperation) = S_OK);
  if AMethod.IsConstructor or (AMethod.ReturnType = 'void') then
    Exit;
  M := ModelFinder.FindTypeModel(AMethod.DeclaringType, UMLOperation.Owner, AMethod.ReturnType);
  UMLParameter := StarUMLApp.UMLFactory.CreateParameter(UMLOperation);
  UMLParameter.Name := 'return';
  UMLParameter.DirectionKind := pdkReturn;
  if M <> nil then
    UMLParameter.Type_ := M
  else
    UMLParameter.TypeExpression := AMethod.ReturnType;
  if AMethod.ReturnTypeDimension <> 0 then
    UMLParameter.SetTaggedValueAsInteger(PROFILE_JAVA15, TAGSET_DIMEN, TAG_DIMEN, AMethod.ReturnTypeDimension);
  UMLElementAdded(UMLParameter);
end;

procedure PModelTranslator.TranslateParameterType(AItem: PTranslateItem);
var
  AParameter: IJavaParameter;
  UMLParameter: IUMLParameter;
  M: IUMLClassifier;
begin
  Assert(AItem.JavaElement.QueryInterface(IJavaParameter, AParameter) = S_OK);
  Assert(AItem.UMLElement.QueryInterface(IUMLParameter, UMLParameter) = S_OK);
  M := ModelFinder.FindTypeModel(AParameter.Method.DeclaringType, (UMLParameter.BehavioralFeature as IUMLOperation).Owner, AParameter.Type_);
  if M <> nil  then
    UMLParameter.Type_ := M
  else
    UMLParameter.TypeExpression := AParameter.Type_;
  if AParameter.TypeDimension <> 0 then
    UMLParameter.SetTaggedValueAsInteger(PROFILE_JAVA15, TAGSET_DIMEN, TAG_DIMEN, AParameter.TypeDimension);
end;

procedure PModelTranslator.TranslatePackageImport(AItem: PTranslateItem);
var
  APackage: IJavaPackage;
  JCompUnit: IJavaCompilationUnit;
  UMLPackage, P: IUMLPackage;
  UMLDependency: IUMLDependency;
  I, J: Integer;
begin
  Assert(AItem.JavaElement.QueryInterface(IJavaPackage, APackage) = S_OK);
  Assert(AItem.UMLElement.QueryInterface(IUMLPackage, UMLPackage) = S_OK);
  for I := 0 to APackage.GetCompilationUnitCount - 1 do begin
    JCompUnit := APackage.GetCompilationUnitAt(I);
    for J := 0 to JCompUnit.GetImportCount - 1 do begin
      P := ModelFinder.FindPackage(JCompUnit.GetImportAt(J).Name);
      if (P <> nil) and not ExistsImportDependency(UMLPackage, P) then begin
        UMLDependency := StarUMLApp.UMLFactory.CreateDependency(UMLPackage, UMLPackage, P);
        UMLDependency.SetStereotype2(PROFILE_STANDARD, STD_STEREOTYPE_IMPORT);
        UMLElementAdded(UMLDependency);
      end;
    end;
  end;
end;

procedure PModelTranslator.TranslateMethodJavaDoc(AItem: PTranslateItem);
var
  AMethod: IJavaMethod;
  UMLOperation: IUMLOperation;
begin
  Assert(AItem.JavaElement.QueryInterface(IJavaMethod, AMethod) = S_OK);
  Assert(AItem.UMLElement.QueryInterface(IUMLOperation, UMLOperation) = S_OK);
  ReadJavaDocStr(UMLOperation, AMethod.Documentation);
end;

procedure PModelTranslator.CheckTranslatingAborted;
begin
  if not IsOnTranslating then
    raise ETranslatingAborted.Create(MSG_TRANS_ABORT);
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
    AddMessage(mkGeneral, Format(MSG_ELEMENT_NAME_CHANGED, [Name, S]), ANamespace);
  ANameSpace.Name := S;
end;

function PModelTranslator.ExistsImportDependency(ClientPackage, SupplierPackage: IUMLPackage): Boolean;
var
  D: IUMLDependency;
  I: Integer;
begin
  Result := False;
  for I := 0 to ClientPackage.GetClientDependencyCount - 1 do begin
    D := ClientPackage.GetClientDependencyAt(I);
    if (D.Supplier.GetGuid = SupplierPackage.GetGuid) and (D.StereotypeProfile = PROFILE_STANDARD)
      and (D.StereotypeName = STD_STEREOTYPE_IMPORT) then begin
      Result := True;
      Exit;
    end;
  end;
end;

function PModelTranslator.GetJavaDocStr(CommentStr: string): string;
var
  JavaDocReader: PJavaDocReader;
  DC: PJavaDocComment;
begin
  JavaDocReader := PJavaDocReader.Create;
  DC := JavaDocReader.ReadJavaDocComment(CommentStr);
  if DC = nil then Result := ''
  else Result := DC.Text;
  DC.Free;
  JavaDocReader.Free;
end;

procedure PModelTranslator.ReadJavaDocStr(UMLOperation: IUMLOperation; CommentStr: string);
var
  JavaDocReader: PJavaDocReader;
  DC: PJavaDocComment;
  ParamTag: PParamTag;
  ReturnTag: PReturnTag;
  Param: IUMLParameter;
  I, J: Integer;
begin
  JavaDocReader := PJavaDocReader.Create;
  DC := JavaDocReader.ReadJavaDocComment(CommentStr);
  if DC <> nil then begin
    UMLOperation.Documentation := DC.Text;
    for I := 0 to DC.TagCount - 1 do begin
      if DC.Tags[I] is PParamTag then begin
        ParamTag := DC.Tags[I] as PParamTag;
        for J := 0 to UMLOperation.GetParameterCount - 1 do begin
          Param := UMLOperation.GetParameterAt(J);
          if (Param.Name = ParamTag.Name) and (Param.DirectionKind <> pdkReturn) then
            Param.Documentation := ParamTag.Description;
        end;
      end
      else if DC.Tags[I] is PReturnTag then begin
        ReturnTag := DC.Tags[I] as PReturnTag;
        for J := 0 to UMLOperation.GetParameterCount - 1 do begin
          Param := UMLOperation.GetParameterAt(J);
          if Param.DirectionKind = pdkReturn then
            Param.Documentation := ReturnTag.Description;
        end;
      end;
    end;
  end;
end;

procedure PModelTranslator.EvaluateJavaElementCount;

  function GetJavaElementCount(AType: IJavaType): Integer; overload;
  var
    Count, I: Integer;
  begin
    Count := 0;
    for I := 0 to AType.GetFieldCount - 1 do begin
      if FTranslatePublicMember and (AType.GetFieldAt(I).Visibility = vkPublic) then Inc(Count)
      else if FTranslatePackageMember and (AType.GetFieldAt(I).Visibility = vkPackage) then Inc(Count)
      else if FTranslateProtectedMember and (AType.GetFieldAt(I).Visibility = vkProtected) then Inc(Count)
      else if FTranslatePrivateMember and (AType.GetFieldAt(I).Visibility = vkPrivate) then Inc(Count);
    end;
    for I := 0 to AType.GetMethodCount - 1 do begin
      if FTranslatePublicMember and (AType.GetMethodAt(I).Visibility = vkPublic) then
        Count := Count + AType.GetMethodAt(I).GetParameterCount + 1
      else if FTranslatePackageMember and (AType.GetMethodAt(I).Visibility = vkPackage) then
        Count := Count + AType.GetMethodAt(I).GetParameterCount + 1
      else if FTranslateProtectedMember and (AType.GetMethodAt(I).Visibility = vkProtected) then
        Count := Count + AType.GetMethodAt(I).GetParameterCount + 1
      else if FTranslatePrivateMember and (AType.GetMethodAt(I).Visibility = vkPrivate) then
        Count := Count + AType.GetMethodAt(I).GetParameterCount + 1;
    end;
    for I := 0 to AType.GetTypeCount - 1 do begin
      if FTranslatePublicMember and (AType.GetTypeAt(I).Visibility = vkPublic) then
        Count := Count + GetJavaElementCount(AType.GetTypeAt(I)) + 1
      else if FTranslatePackageMember and (AType.GetTypeAt(I).Visibility = vkPackage) then
        Count := Count + GetJavaElementCount(AType.GetTypeAt(I)) + 1
      else if FTranslateProtectedMember and (AType.GetTypeAt(I).Visibility = vkProtected) then
        Count := Count + GetJavaElementCount(AType.GetTypeAt(I)) + 1
      else if FTranslatePrivateMember and (AType.GetTypeAt(I).Visibility = vkPrivate) then
        Count := Count + GetJavaElementCount(AType.GetTypeAt(I)) + 1;
    end;
    Result := Count;
  end;

  function GetJavaElementCount(APackage: IJavaPackage): Integer; overload;
  var
    Count, I: Integer;
  begin
    Count := 0;
    for I := 0 to APackage.GetSubPackageCount - 1 do
      Count := Count + GetJavaElementCount(APackage.GetSubPackageAt(I)) + 1;
    for I := 0 to APackage.GetTypeCount - 1 do
      Count := Count + GetJavaElementCount(APackage.GetTypeAt(I)) + 1;
    Result := Count;
  end;

var
  C, I: Integer;
begin
  C := Parser.GetPackageCount;
  for I := 0 to Parser.GetPackageCount - 1 do begin
    C := C + GetJavaElementCount(Parser.GetPackageAt(I));
  end;
  TransJavaTotal := C;
  TransJavaCount := 0;
end;

procedure PModelTranslator.UMLElementAdded(Element: IUMLElement);
begin
  FElements.Add(Element);
  if Assigned(FOnAddUMLElement) then
    FOnAddUMLElement(Self, Element);
end;

procedure PModelTranslator.JavaElementTranslated(Element: IJavaElement);
begin
  TransJavaCount := TransJavaCount + 1;
  if Assigned(FOnTranslateJavaElement) then
    FOnTranslateJavaElement(Self, Element, TransJavaCount, TransJavaTotal);
end;

procedure PModelTranslator.AddMessage(Kind: InformationMessageKind; Text: string; ElementLink: IElement);
begin
  if Assigned(FOnMessage) then
    FOnMessage(Self, Kind, Text, ElementLink);
end;

procedure PModelTranslator.Log(Msg: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg);
end;

procedure PModelTranslator.Clear;
var
  I: Integer;
begin
  for I := TranslateItems.Count - 1 downto 0 do begin
    PTranslateItem(TranslateItems[I]).Free;
    TranslateItems.Delete(I);
  end;
  FElements.Clear;
end;

procedure PModelTranslator.Translate;
begin
  IsOnTranslating := True;
  try
    try
      Clear;
      if Assigned(FOn1stStepTranslating) then
        FOn1stStepTranslating(Self);
      Translate1stStep;
      if Assigned(FOn2ndStepTranslating) then
        FOn2ndStepTranslating(Self);
      Translate2ndStep;
    except
      on ETranslatingAborted do begin
        // aborted
      end;
    end;
  finally
    Clear;
    IsOnTranslating := False;
  end;
end;

procedure PModelTranslator.Abort;
begin
  IsOnTranslating := False;
end;


// PModelTranslator
/////////////////////////////////////////////////////////////////////////////

end.
