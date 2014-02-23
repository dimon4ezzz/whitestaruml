unit CodeGenerator;

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
  PCodeGenerator.StripGeneric - This function takes in a type as a string
  and removes the generics section of it. It is used to fix the filename
  before it gets written.
  Example: input: TestClass<T> output:TestClass
  
}

interface

uses
  Utility, WhiteStarUML_TLB,
  Classes;

type
  // Events
  PLogEvent = procedure(Sender: TObject; Msg: string) of object;
  PCodeGeneratingEvent = procedure(Sender: TObject; Model: IUMLModelElement; Pos, Max: Integer) of object;
  PCodeGenerateEvent = procedure(Sender: TObject; Model: IUMLModelElement; Pos, Max: Integer; Success: Boolean) of object;

  // PCodeGenerator
  PCodeGenerator = class
  private
		{ Private Member Fields }
    FStarUMLApp: IStarUMLApplication;
    FBaseDirectory: string;
    FBasePackageElement: IUMLPackage;
    FTargetElements: TInterfaceList;
    { Options }
    FAlsoGenerateUnnamedAssoc: Boolean;
    FUseTab: Boolean;
    FIdentationSize: Integer;
    FBraceAtNewLine: Boolean;
    FHeaderComment: string;
    FGenJavaDoc: Boolean;
    FGenEmptyJavaDoc: Boolean;
    { Events }
    FOnLog: PLogEvent;
    FOnGeneratingCode: PCodeGeneratingEvent;
    FOnGenerateCode: PCodeGenerateEvent;
    { Getter/Setter }
    function GetTargetElementCount: Integer;
    function GetTargetElement(Index: Integer): IUMLModelElement;
    { Private Methods }
    function Initialized: Boolean;
    function CreateStringWriter(InitialIndentCount: Integer = 0): PStringWriter;
    { Tagged Value Accessing Methods }
    function GetStringTaggedValue(AExtModel: IExtensibleModel; Profile: string; TagDefSet: string; TagName: string): string;
    function GetBooleanTaggedValue(AExtModel: IExtensibleModel; Profile: string; TagDefSet: string; TagName: string): Boolean;
    function GetIntegerTaggedValue(AExtModel: IExtensibleModel; Profile: string; TagDefSet: string; TagName: string): Integer;
    { Miscellaneous Methods }
    procedure ImproperModel(Model: IUMLModelElement; Msg: string);
    procedure Log(Msg: string);
    { Auxiliary Functions }
    function VisibilityToString(Visibility: UMLVisibilityKind): string;
    function GetRelativePath(AModelElem: IUMLModelElement): string;
    procedure CollectPathFragments(Path: string; OutStrings: TStringList);
    procedure CollectNamespaceNames(Path: string; OutStrings: TStringList);
    function GetSourceFilePath(AClassifier: IUMLClassifier): string;
    function UMLPathToJavaPath(Path: string): string;
    function GetParentPackage(AClassifier: IUMLClassifier): IUMLPackage;
    function IsImported(Client, Supplier: IUMLClassifier): Boolean;
    function GetExtendsClause(AClassifier: IUMLClassifier): string;
    function GetImplementsClause(AClass: IUMLClass): string;
    function GetTypeStr(AAttribute: IUMLAttribute): string; overload;
    function GetTypeStr(AAssocEnd: IUMLAssociationEnd): string; overload;
    function GetParameterTypeStr(AParameter: IUMLParameter): string;
    function GetReturnTypeStr(AOperation: IUMLOperation): string;
    function GetParametersClause(AOperation: IUMLOperation): string;
    function NameUnnamedAssocEnd(AAssocEnd: IUMLAssociationEnd): string;
    function IsSameSignature(OperA, OperB: IUMLOperation): Boolean;
      { do not use following functions directly --}
    function FindSameSignatureOperation(AOperation: IUMLOperation; OperList: TInterfaceList): IUMLOperation;
    procedure CollectOperationsInClass(AClass: IUMLClass; NotImpledOpers: TInterfaceList; ImpledOpers: TInterfaceList; IncludeSelf: Boolean = True);
    procedure CollectOperationsInInterface(AInterface: IUMLInterface; NotImpledOpers: TInterfaceList; ImpledOpers: TInterfaceList);
      { -- do not use upper functions directly }
    procedure CollectNotImplementedOperations(AClass: IUMLClass; NotImpledOpers: TInterfaceList);
    { Writing Methods }
    procedure WriteFileHeader(Writer: PStringWriter; AModelElem: IUMLModelElement);
    procedure WriteJavaDoc(Writer: PStringWriter; AClassifier: IUMLClassifier; var JavaDocWrited: Boolean); overload;
    procedure WriteJavaDoc(Writer: PStringWriter; AAttribute: IUMLAttribute; var JavaDocWrited: Boolean); overload;
    procedure WriteJavaDoc(Writer: PStringWriter; AAssocEnd: IUMLAssociationEnd; var JavaDocWrited: Boolean); overload;
    procedure WriteJavaDoc(Writer: PStringWriter; AOperation: IUMLOperation; var JavaDocWrited: Boolean); overload;
    procedure WritePackageDeclaration(Writer: PStringWriter; AClassifier: IUMLClassifier);
    procedure WriteImportStatements(Writer: PStringWriter; AClassifier: IUMLClassifier);
    procedure WriteAttribute(Writer: PStringWriter; AAttribute: IUMLAttribute; var DefWrited: Boolean);
    procedure WriteAssociationEnd(Writer: PStringWriter; AAssocEnd: IUMLAssociationEnd; var DefWrited: Boolean);
    procedure WriteOperation(Writer: PStringWriter; AOperation: IUMLOperation; var DefWrited: Boolean; IsOverrided: Boolean = False);
    procedure WriteMembers(Writer: PStringWriter; AClassifier: IUMLClassifier);
    procedure WriteClassDefinition(Writer: PStringWriter; AClass: IUMLClass);
    procedure WriteInterfaceDefinition(Writer: PStringWriter; AInterface: IUMLInterface);
    {CODE MINION HELPER FUNCTIONS}
    function StripGeneric(typeWithGenerics: string):string;
  public
		{ Constructor/Destructor }
    constructor Create;
    destructor Destroy; override;
    { Public Methods }
    procedure AddTargetElement(Value: IUMLModelElement);
    procedure ClearTargetElements;
    procedure GenerateCode;
    { Properties }
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
    property BaseDirectory: string read FBaseDirectory write FBaseDirectory;
    property BasePackageElement: IUMLPackage read FBasePackageElement write FBasePackageElement;
    property TargetElementCount: Integer read GetTargetElementCount;
    property TargetElements[Index: Integer]: IUMLModelElement read GetTargetElement;
    { Properties for Options }
    property UseTab: Boolean read FUseTab write FUseTab;
    property IdentationSize: Integer read FIdentationSize write FIdentationSize;
    property BraceAtNewLine: Boolean read FBraceAtNewLine write FBraceAtNewLine;
    property HeaderComment: string read FHeaderComment write FHeaderComment;
    property AlsoGenerateUnnamedAssoc: Boolean read FAlsoGenerateUnnamedAssoc write FAlsoGenerateUnnamedAssoc;
    property GenJavaDoc: Boolean read FGenJavaDoc write FGenJavaDoc;
    property GenEmptyJavaDoc: Boolean read FGenEmptyJavaDoc write FGenEmptyJavaDoc;
    { Events }
    property OnLog: PLogEvent read FOnLog write FOnLog;
    property OnGeneratingCode: PCodeGeneratingEvent read FOnGeneratingCode write FOnGeneratingCode;
    property OnGenerateCode: PCodeGenerateEvent read FOnGenerateCode write FOnGenerateCode;
  end;

implementation

uses
  Symbols, NLS_JavaAddIn,
  SysUtils, Math, Dialogs, StrUtils;

{ Constructor/Destructor }

constructor PCodeGenerator.Create;
begin
  inherited;
  FTargetElements := TInterfaceList.Create;
  FBaseDirectory := '';
  FBasePackageElement := nil;
end;

destructor PCodeGenerator.Destroy;
begin
  FStarUMLApp := nil;
  FTargetElements.Free;
  FTargetElements := nil;
  inherited;
end;

{ Getter/Setter }

function PCodeGenerator.GetTargetElementCount: Integer;
begin
  Result := FTargetElements.Count;
end;

function PCodeGenerator.GetTargetElement(Index: Integer): IUMLModelElement;
begin
  Result := FTargetElements.Items[Index] as IUMLModelElement;
end;

{ Private Methods }

function PCodeGenerator.Initialized: Boolean;
begin
  Result := (FStarUMLApp <> nil) and (FBaseDirectory <> '') and (FBasePackageElement <> nil);
end;

function PCodeGenerator.CreateStringWriter(InitialIndentCount: Integer = 0): PStringWriter;
var
  Writer: PStringWriter;
begin
  Writer := PStringWriter.Create;
  Writer.UseTab := FUseTab;
  Writer.IndentationSize := FIdentationSize;
  Writer.IndentationCount := InitialIndentCount;
  Result := Writer;
end;

{ Tagged Value Accessing Methods }

function PCodeGenerator.GetStringTaggedValue(AExtModel: IExtensibleModel; Profile: string; TagDefSet: string; TagName: string): string;
begin
  try
    Result := AExtModel.GetTaggedValueAsString(Profile, TagDefSet, TagName);
  except
    Result := '';
    if StarUMLApp.ExtensionManager.FindIncludedProfile(Profile) <> nil then begin
      if StarUMLApp.ExtensionManager.FindTagDefinition(Profile, TagDefSet, TagName) = nil then
        Log(Format(ERR_TAG_DEFINITION_NOT_DEFINED, [Profile, TagName]))
      else
        Log(Format(ERR_CANNOT_READ_TAG_VALUE, [Profile, TagName]));
    end;
  end;
end;

function PCodeGenerator.GetBooleanTaggedValue(AExtModel: IExtensibleModel; Profile: string; TagDefSet: string; TagName: string): Boolean;
begin
  try
    Result := AExtModel.GetTaggedValueAsBoolean(Profile, TagDefSet, TagName);
  except
    Result := False;
    if StarUMLApp.ExtensionManager.FindIncludedProfile(Profile) <> nil then begin
      if StarUMLApp.ExtensionManager.FindTagDefinition(Profile, TagDefSet, TagName) = nil then
        Log(Format(ERR_TAG_DEFINITION_NOT_DEFINED, [Profile, TagName]))
      else
        Log(Format(ERR_CANNOT_READ_TAG_VALUE, [Profile, TagName]));
    end;
  end;
end;

function PCodeGenerator.GetIntegerTaggedValue(AExtModel: IExtensibleModel; Profile: string; TagDefSet: string; TagName: string): Integer;
begin
  try
    Result := AExtModel.GetTaggedValueAsInteger(Profile, TagDefSet, TagName);
  except
    Result := 0;
    if StarUMLApp.ExtensionManager.FindIncludedProfile(Profile) <> nil then begin
      if StarUMLApp.ExtensionManager.FindTagDefinition(Profile, TagDefSet, TagName) = nil then
        Log(Format(ERR_TAG_DEFINITION_NOT_DEFINED, [Profile, TagName]))
      else
        Log(Format(ERR_CANNOT_READ_TAG_VALUE, [Profile, TagName]));
    end;
  end;
end;

{ Miscellaneous Methods }

procedure PCodeGenerator.ImproperModel(Model: IUMLModelElement; Msg: string);
begin
// for Model Verification
end;

procedure PCodeGenerator.Log(Msg: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg);
end;

{ Auxiliary Functions }

function PCodeGenerator.VisibilityToString(Visibility: UMLVisibilityKind): string;
begin
  case Visibility of
    vkPublic: Result := 'public';
    vkProtected: Result := 'protected';
    vkPrivate: Result := 'private';
    else
      Result := 'public';
  end;
end;

function PCodeGenerator.GetRelativePath(AModelElem: IUMLModelElement): string;
var
  ElemLen, BaseLen: Integer;
begin
  BaseLen := Length(FBasePackageElement.Pathname);
  ElemLen := Length(AModelElem.Pathname);
  Result := Copy(AModelElem.Pathname, BaseLen + 1, ElemLen - BaseLen);
end;

procedure PCodeGenerator.CollectPathFragments(Path: string; OutStrings: TStringList);
begin
  Assert(Copy(Path, 1, 2) = '::');
  OutStrings.Text := StringReplace(Path, '::', #13, [rfReplaceAll]);
  OutStrings.Delete(0);
end;

procedure PCodeGenerator.CollectNamespaceNames(Path: string; OutStrings: TStringList);
begin
  CollectPathFragments(Path, OutStrings);
  OutStrings.Delete(OutStrings.Count - 1);
end;

{
 This function returns the destination path of a file.
 NO IDEA WHY THEY NAMED IT GET SOURCE FILE PATH.
}
function PCodeGenerator.GetSourceFilePath(AClassifier: IUMLClassifier): string;
var
  SL: TStringList;
  Path: string;
  I: Integer;
begin
  Path := FBaseDirectory;
  SL := TStringList.Create;
  try
    CollectNamespaceNames(GetRelativePath(AClassifier), SL);
    for I := 0 to SL.Count - 1 do
      Path := Path + '\' + SL[I];
  finally
    SL.Free;
  end;
  {CODE MINION}
  // Remove the generics symbol from the path to prevent
  // problems when writing the class.
  Result := Path + '\' + StripGeneric(AClassifier.Name) + '.java';

  // Before
  //Result := Path + '\' + AClassifier.Name + '.java';
end;

function PCodeGenerator.UMLPathToJavaPath(Path: string): string;
var
  S: string;
begin
  S := Path;
  if (Length(S) > 2) and (Copy(S, 1, 2) = '::') then
    S := Copy(Path, 3, Length(S) - 2);
  Result := StringReplace(S, '::', '.', [rfReplaceAll]);
end;

function PCodeGenerator.GetParentPackage(AClassifier: IUMLClassifier): IUMLPackage;
var
  Pkg: IUMLPackage;
  Clsf: IUMLClassifier;
begin
  if AClassifier.Namespace = nil then
    Result := nil
  else if AClassifier.Namespace.QueryInterface(IUMLPackage, Pkg) = S_OK then
    Result := Pkg
  else if AClassifier.Namespace.QueryInterface(IUMLClassifier, Clsf) = S_OK then
    Result := GetParentPackage(Clsf)
  else
    Result := nil;
end;

function PCodeGenerator.IsImported(Client, Supplier: IUMLClassifier): Boolean;
var
  ClientPkg, SupplierPkg: IUMLPackage;
  Dep: IUMLDependency;
  I: Integer;
begin
  Result := False;
  ClientPkg := GetParentPackage(Client);
  SupplierPkg := GetParentPackage(Supplier);

  for I := 0 to Client.GetClientDependencyCount - 1 do begin
    Dep := Client.GetClientDependencyAt(I);
    if Dep.StereotypeName = STD_STEREOTYPE_IMPORT then
      if (Dep.Supplier.GetGuid = Supplier.GetGuid) or ((SupplierPkg <> nil) and (Dep.Supplier.GetGuid = SupplierPkg.GetGuid)) then begin
        Result := True;
        Exit;
      end;
  end;
  for I := 0 to ClientPkg.GetClientDependencyCount - 1 do begin
    Dep := ClientPkg.GetClientDependencyAt(I);
    if Dep.StereotypeName = STD_STEREOTYPE_IMPORT then
      if (Dep.Supplier.GetGuid = Supplier.GetGuid) or ((SupplierPkg <> nil) and (Dep.Supplier.GetGuid = SupplierPkg.GetGuid)) then begin
        Result := True;
        Exit;
      end;
  end
end;

function PCodeGenerator.GetExtendsClause(AClassifier: IUMLClassifier): string;
var
  Gen: IUMLGeneralization;
  ParentClsf: IUMLClassifier;
  S: string;
  I: Integer;
begin
  S := '';
  for I := 0 to AClassifier.GetGeneralizationCount - 1 do begin
    Gen := AClassifier.GetGeneralizationAt(I);
    if S <> '' then
      S := S + ', ';
    if (AClassifier.Namespace = Gen.Parent.Namespace) or
      ((Gen.Parent.QueryInterface(IUMLClassifier, ParentClsf) = S_OK) and IsImported(AClassifier, ParentClsf)) then
      S := S + Gen.Parent.Name
    else
      S := S + UMLPathToJavaPath(GetRelativePath(Gen.Parent));
  end;
  if S <> '' then
    S := ' extends ' + S;
  Result := S;
end;

function PCodeGenerator.GetImplementsClause(AClass: IUMLClass): string;
var
  Rel: IUMLRealization;
  SupClsf: IUMLClassifier;
  S: string;
  I: Integer;
begin
  S := '';
  for I := 0 to AClass.GetClientDependencyCount - 1 do begin
    if AClass.GetClientDependencyAt(I).QueryInterface(IUMLRealization, Rel) = S_OK then begin
      if S <> '' then
        S := S + ', ';
      if (AClass.Namespace = Rel.Supplier) or
        ((Rel.Supplier.QueryInterface(IUMLClassifier, SupClsf) = S_OK) and IsImported(AClass, SupClsf)) then
        S := S + Rel.Supplier.Name
      else
        S := S + UMLPathToJavaPath(GetRelativePath(Rel.Supplier));
    end;
  end;
  if S <> '' then
    S := ' implements ' + S;
  Result := S;
end;

function PCodeGenerator.GetTypeStr(AAttribute: IUMLAttribute): string;
var
  S: string;
  I: Integer;
begin
  if AAttribute.Type_ <> nil then begin
    if (AAttribute.Type_.Namespace = AAttribute.Owner.Namespace) or IsImported(AAttribute.Owner, AAttribute.Type_) then
      S := AAttribute.Type_.Name
    else
      S := UMLPathToJavaPath(GetRelativePath(AAttribute.Type_));
  end
  else begin
    if AAttribute.TypeExpression = '' then
      S := 'Object'
    else
      S := AAttribute.TypeExpression;
  end;
  for I := 0 to GetIntegerTaggedValue(AAttribute, PROFILE_JAVA15, TAGSET_DIMEN, TAG_DIMEN) - 1 do
    S := S + '[]';
  // (to do) collection

  {CODE MINION}
  // Remove the generics clause, just testing.
  //S := StripGeneric(S);
  Result := S;
end;

function PCodeGenerator.GetTypeStr(AAssocEnd: IUMLAssociationEnd): string;
var
  S: string;
  I: Integer;
begin
  if (AAssocEnd.Participant.Namespace = AAssocEnd.GetOtherSide.Participant.Namespace) or IsImported(AAssocEnd.GetOtherSide.Participant, AAssocEnd.Participant) then
    S := AAssocEnd.Participant.Name
  else
    S := UMLPathToJavaPath(GetRelativePath(AAssocEnd.Participant));
  for I := 0 to GetIntegerTaggedValue(AAssocEnd, PROFILE_JAVA15, TAGSET_DIMEN, TAG_DIMEN) - 1 do
    S := S + '[]';
  // (to do) collection
  Result := S;
end;

function PCodeGenerator.GetParameterTypeStr(AParameter: IUMLParameter): string;
var
  Oper: IUMLOperation;
  S: string;
  I: Integer;
begin
  Assert(AParameter.BehavioralFeature.QueryInterface(IUMLOperation, Oper) = S_OK);
  if AParameter.BehavioralFeature.QueryInterface(IUMLOperation, Oper) = S_OK then begin
    if AParameter.Type_ <> nil then begin
      if (AParameter.Type_.Namespace = Oper.Owner.Namespace) or IsImported(Oper.Owner, AParameter.Type_) then
        S := AParameter.Type_.Name
      else
        S := UMLPathToJavaPath(GetRelativePath(AParameter.Type_));
    end
    else begin
      if AParameter.TypeExpression = '' then
        S := 'Object'
      else
        S := AParameter.TypeExpression;
    end;
  end;
  for I := 0 to GetIntegerTaggedValue(AParameter, PROFILE_JAVA15, TAGSET_DIMEN, TAG_DIMEN) - 1 do
    S := S + '[]';
  // (to do) collection
  Result := S;
end;

function PCodeGenerator.GetReturnTypeStr(AOperation: IUMLOperation): string;
var
  Param: IUMLParameter;
  I: Integer;
begin
  Result := 'void';
  for I := 0 to AOperation.GetParameterCount - 1 do begin
    Param := AOperation.GetParameterAt(I);
    if (Param.DirectionKind = pdkReturn) and ((Param.Type_ <> nil) or (Param.TypeExpression <> '')) then begin
      Result := GetParameterTypeStr(Param);
      Exit;
    end;
  end;
end;

function PCodeGenerator.GetParametersClause(AOperation: IUMLOperation): string;
var
  Param: IUMLParameter;
  S: string;
  I: Integer;
begin
  S := '';
  for I := 0 to AOperation.GetParameterCount - 1 do begin
    Param := AOperation.GetParameterAt(I);
    if Param.DirectionKind <> pdkReturn then begin
      if S <> '' then
        S := S + ', ';
      if GetBooleanTaggedValue(Param, PROFILE_JAVA15, TAGSET_PARAM, TAG_FINAL) then
        S := S + 'final ';
      S := S + Format('%s %s', [GetParameterTypeStr(Param), Param.Name]);
    end;
  end;
  Result := S;
end;

function PCodeGenerator.NameUnnamedAssocEnd(AAssocEnd: IUMLAssociationEnd): string;
var
  AClassifier: IUMLClassifier;
  Idx: Integer;
begin
  Assert(AAssocEnd.Name = '');
  AClassifier := AAssocEnd.GetOtherSide.Participant;
  Idx := AClassifier.IndexOfAssociation(AAssocEnd.GetOtherSide) + 1;
  Result := Format('Unnamed%d', [Idx]);
end;

function PCodeGenerator.IsSameSignature(OperA, OperB: IUMLOperation): Boolean;

  function IsSameParameterShape(ParamA, ParamB: IUMLParameter): Boolean;
  begin
    Result := (ParamA.Name = ParamB.Name) and (ParamA.DirectionKind = ParamB.DirectionKind)
      and (ParamA.Type_ = ParamB.Type_) and (ParamA.TypeExpression = ParamB.TypeExpression)
      and (ParamA.DefaultValue = ParamB.DefaultValue);
  end;

var
  I: Integer;
begin
  Assert(OperA <> nil);
  Assert(OperB <> nil);
  Result := True;
  if OperA.Name <> OperB.Name then begin
    Result := False;
    Exit;
  end;
  if OperA.GetParameterCount <> OperB.GetParameterCount then begin
    Result := False;
    Exit;
  end;
  for I := 0 to OperA.GetParameterCount - 1 do
    if not IsSameParameterShape(OperA.GetParameterAt(I), OperB.GetParameterAt(I)) then begin
      Result := False;
      Exit;
    end;
end;

function PCodeGenerator.FindSameSignatureOperation(AOperation: IUMLOperation; OperList: TInterfaceList): IUMLOperation;
var
  Oper: IUMLOperation;
  I: Integer;
begin
  Result := nil;
  for I := 0 to OperList.Count - 1 do begin
    Assert(OperList.Items[I].QueryInterface(IUMLOperation, Oper) = S_OK);
    if IsSameSignature(AOperation, Oper) then begin
      Result := Oper;
      Exit;
    end;
  end;
end;

procedure PCodeGenerator.CollectOperationsInClass(AClass: IUMLClass; NotImpledOpers: TInterfaceList; ImpledOpers: TInterfaceList; IncludeSelf: Boolean = True);
var
  Oper, NimpOper: IUMLOperation;
  Parent, Base: IUMLModelElement;
  ParentClass: IUMLClass;
  BaseIntf: IUMLInterface;
  I: Integer;
begin
  if IncludeSelf then
    for I := 0 to AClass.GetOperationCount - 1 do begin
      Oper := AClass.GetOperationAt(I);
      if Oper.IsAbstract then begin
        if FindSameSignatureOperation(Oper, ImpledOpers) = nil then
          NotImpledOpers.Add(Oper);
      end
      else begin
        NimpOper := FindSameSignatureOperation(Oper, NotImpledOpers);
        if NimpOper <> nil then
          NotImpledOpers.Remove(NimpOper);
        ImpledOpers.Add(Oper);
      end;
    end;
  for I := 0 to AClass.GetGeneralizationCount - 1 do begin
    Parent := AClass.GetGeneralizationAt(I).Parent;
    if Parent.QueryInterface(IUMLClass, ParentClass) = S_OK then
      CollectOperationsInClass(ParentClass, NotImpledOpers, ImpledOpers);
  end;
  for I := 0 to AClass.GetClientDependencyCount - 1 do
    if AClass.GetClientDependencyAt(I).IsKindOf(ELEM_REALIZATION) then begin
      Base := AClass.GetClientDependencyAt(I).Supplier;
      if Base.QueryInterface(IUMLInterface, BaseIntf) = S_OK then
        CollectOperationsInInterface(BaseIntf, NotImpledOpers, ImpledOpers);
    end;
end;

procedure PCodeGenerator.CollectOperationsInInterface(AInterface: IUMLInterface; NotImpledOpers: TInterfaceList; ImpledOpers: TInterfaceList);
var
  Oper: IUMLOperation;
  Parent: IUMLModelElement;
  ParentIntf: IUMLInterface;
  I: Integer;
begin
  for I := 0 to AInterface.GetOperationCount - 1 do begin
    Oper := AInterface.GetOperationAt(I);
    if FindSameSignatureOperation(Oper, ImpledOpers) = nil then
      NotImpledOpers.Add(Oper);
  end;
  for I := 0 to AInterface.GetGeneralizationCount - 1 do begin
    Parent := AInterface.GetGeneralizationAt(I).Parent;
    if Parent.QueryInterface(IUMLInterface, ParentIntf) = S_OK then
      CollectOperationsInInterface(ParentIntf, NotImpledOpers, ImpledOpers);
  end;
end;

procedure PCodeGenerator.CollectNotImplementedOperations(AClass: IUMLClass; NotImpledOpers: TInterfaceList);
var
  ImpledOpers: TInterfaceList;
begin
  ImpledOpers := TInterfaceList.Create;
  try
    NotImpledOpers.Clear;
    CollectOperationsInClass(AClass, NotImpledOpers, ImpledOpers, False);
  finally
    ImpledOpers.Free;
  end;
end;

procedure PCodeGenerator.WriteFileHeader(Writer: PStringWriter; AModelElem: IUMLModelElement);
const
  STARUML_HEADER_STAMP = '____STARUML_HEADER_STAMP_';
  STAMP_PROJECT = STARUML_HEADER_STAMP + 'PROJECT';
  STAMP_DATE = STARUML_HEADER_STAMP + 'DATE';
  STAMP_COMPANY = STARUML_HEADER_STAMP + 'COMPANY';
  STAMP_AUTHOR = STARUML_HEADER_STAMP + 'AUTHOR';
  STAMP_COPYRIGHT = STARUML_HEADER_STAMP + 'COPYRIGHT';
  STAMP_FILENAME = STARUML_HEADER_STAMP + 'FILENAME';
  STAMP_ELEMENT = STARUML_HEADER_STAMP + 'ELEMENT';
  STAMP_SYMBOL = STARUML_HEADER_STAMP + 'SYMBOL';
var
  Proj: IUMLProject;
  Clsf: IUMLClassifier;
  S: string;
begin
  Proj := FStarUMLApp.ProjectManager.Project;
  S := HeaderComment;
  // first, replace with project
  S := StringReplace(S, '@@', STAMP_SYMBOL, [rfReplaceAll]);
  S := StringReplace(S, '@p', STAMP_PROJECT, [rfReplaceAll]);
  S := StringReplace(S, '@d', STAMP_DATE, [rfReplaceAll]);
  S := StringReplace(S, '@c', STAMP_COMPANY, [rfReplaceAll]);
  S := StringReplace(S, '@a', STAMP_AUTHOR, [rfReplaceAll]);
  S := StringReplace(S, '@r', STAMP_COPYRIGHT, [rfReplaceAll]);
  S := StringReplace(S, '@f', STAMP_FILENAME, [rfReplaceAll]);
  S := StringReplace(S, '@e', STAMP_ELEMENT, [rfReplaceAll]);
  // second, replace with content
  S := StringReplace(S, STAMP_SYMBOL, '@', [rfReplaceAll]);
  S := StringReplace(S, STAMP_PROJECT, Proj.Title, [rfReplaceAll]);
  S := StringReplace(S, STAMP_DATE, DateTimeToStr(Date), [rfReplaceAll]);
  S := StringReplace(S, STAMP_COMPANY, Proj.Company, [rfReplaceAll]);
  S := StringReplace(S, STAMP_AUTHOR, Proj.Author, [rfReplaceAll]);
  S := StringReplace(S, STAMP_COPYRIGHT, Proj.Copyright, [rfReplaceAll]);
  if AModelElem.QueryInterface(IUMLClassifier, Clsf) = S_OK then
    S := StringReplace(S, STAMP_FILENAME, ExtractFileName(GetSourceFilePath(Clsf)), [rfReplaceAll])
  else
    S := StringReplace(S, STAMP_FILENAME, 'Unexpected element', [rfReplaceAll]);
  S := StringReplace(S, STAMP_ELEMENT, AModelElem.Name, [rfReplaceAll]);
  if S <> '' then begin
    Writer.WriteLine(S);
    Writer.WriteLine;
  end;
end;

procedure PCodeGenerator.WriteJavaDoc(Writer: PStringWriter; AClassifier: IUMLClassifier; var JavaDocWrited: Boolean);
var
  SL: TStringList;
  I: Integer;
begin
  JavaDocWrited := False;
  SL := TStringList.Create;
  try
    if AClassifier.Documentation = '' then begin
      if FGenEmptyJavaDoc then begin
        Writer.WriteLine(JAVA_DOC_EMPTY);
        JavaDocWrited := True;
      end;
    end
    else begin
      SL.Text := AClassifier.Documentation;
      Writer.WriteLine('/**');
      for I := 0 to SL.Count - 1 do
        Writer.WriteLine(' * %s', [SL[I]]);
      Writer.WriteLine('**/');
      JavaDocWrited := True;
    end;
  finally
    SL.Free;
  end;
end;

procedure PCodeGenerator.WriteJavaDoc(Writer: PStringWriter; AAttribute: IUMLAttribute; var JavaDocWrited: Boolean);
var
  SL: TStringList;
  I: Integer;
begin
  JavaDocWrited := False;
  SL := TStringList.Create;
  try
    if AAttribute.Documentation = '' then begin
      if FGenEmptyJavaDoc then begin
        Writer.WriteLine(JAVA_DOC_EMPTY);
        JavaDocWrited := True;
      end;
    end
    else begin
      SL.Text := AAttribute.Documentation;
      Writer.WriteLine('/**');
      for I := 0 to SL.Count - 1 do
        Writer.WriteLine(' * %s', [SL[I]]);
      Writer.WriteLine('**/');
      JavaDocWrited := True;
    end;
  finally
    SL.Free;
  end;
end;

procedure PCodeGenerator.WriteJavaDoc(Writer: PStringWriter; AAssocEnd: IUMLAssociationEnd; var JavaDocWrited: Boolean);
var
  SL: TStringList;
  I: Integer;
begin
  JavaDocWrited := False;
  SL := TStringList.Create;
  try
    if AAssocEnd.Documentation = '' then begin
      if FGenEmptyJavaDoc then begin
        Writer.WriteLine(JAVA_DOC_EMPTY);
        JavaDocWrited := True;
      end;
    end
    else begin
      SL.Text := AAssocEnd.Documentation;
      Writer.WriteLine('/**');
      for I := 0 to SL.Count - 1 do
        Writer.WriteLine(' * %s', [SL[I]]);
      Writer.WriteLine('**/');
      JavaDocWrited := True;
    end;
  finally
    SL.Free;
  end;
end;

procedure PCodeGenerator.WriteJavaDoc(Writer: PStringWriter; AOperation: IUMLOperation; var JavaDocWrited: Boolean);

  function GetParamJavaDoc(AParameter: IUMLParameter; MaxParamNameLen: Integer): string;
  var
    SL: TStringList;
    S: string;
    I: Integer;
  begin
    S := '';
    SL := TStringList.Create;
    try
      S := Format('@param    %s', [AParameter.Name]);
      SL.Text := AParameter.Documentation;
      for I := 0 to SL.Count - 1 do begin
        if I = 0 then
          S := S + StringOfChar(' ', MaxParamNameLen + 12 - Length(S)) + SL[0]
        else
          S := S + #13#10 + StringOfChar(' ', MaxParamNameLen + 12) + SL[I];
      end;
      Result := S;
    finally
      SL.Free;
    end;
  end;

  function GetRetParamJavaDoc(AParameter: IUMLParameter): string;
  var
    SL: TStringList;
    S: string;
    I: Integer;
  begin
    S := '';
    SL := TStringList.Create;
    try
      S := 'return   ';
      SL.Text := AParameter.Documentation;
      for I := 0 to SL.Count - 1 do begin
        if I = 0 then
          S := S + SL[0]
        else
          S := S + #13#10 + StringOfChar(' ', 9) + SL[I];
      end;
    finally
      SL.Free;
    end;
    Result := S;
  end;

  function ExistsParameterDoc(Op: IUMLOperation): Boolean;
  var
    P: IUMLParameter;
    I: Integer;
  begin
    Result := False;
    for I := 0 to AOperation.GetParameterCount - 1 do begin
      P := AOperation.GetParameterAt(I);
      if P.Documentation <> '' then begin
        Result := True;
        Exit;
      end;
    end;
  end;

var
  SL: TStringList;
  Param, RetParam: IUMLParameter;
  MaxParamLen: Integer;
  ParamCount: Integer;
  I, J: Integer;
begin
  JavaDocWrited := False;
  if (AOperation.Documentation = '') and (not ExistsParameterDoc(AOperation)) then begin
    if FGenEmptyJavaDoc then begin
      Writer.WriteLine(JAVA_DOC_EMPTY);
      JavaDocWrited := True;
    end;      
  end
  else begin
    SL := TStringList.Create;
    try
      SL.Text := AOperation.Documentation;
      Writer.WriteLine('/**');
      for I := 0 to SL.Count - 1 do
        Writer.WriteLine(' * %s', [SL[I]]);
      RetParam := nil;

      MaxParamLen := 0;
      ParamCount := 0;
      for I := 0 to AOperation.GetParameterCount - 1 do begin
        Param := AOperation.GetParameterAt(I);
        if Param.DirectionKind <> pdkReturn then begin
          MaxParamLen := Max(MaxParamLen, Length(Param.Name));
          Inc(ParamCount);
        end;
      end;

      if ParamCount > 0 then
        Writer.WriteLine(' *');
      for I := 0 to AOperation.GetParameterCount - 1 do begin
        Param := AOperation.GetParameterAt(I);
        if Param.DirectionKind = pdkReturn then
          RetParam := Param
        else begin
          SL.Text := GetParamJavaDoc(Param, MaxParamLen);
          for J := 0 to SL.Count - 1 do
            Writer.WriteLine(' * %s', [SL[J]]);
        end;
      end;
      if (RetParam <> nil) and (RetParam.Documentation <> '') then begin
        Writer.WriteLine(' *');
        SL.Text := GetRetParamJavaDoc(RetParam);
        for J := 0 to SL.Count - 1 do
          Writer.WriteLine(' * %s', [SL[J]]);
      end;
      Writer.WriteLine('**/');
      JavaDocWrited := True;
    finally
      SL.Free;
    end;
  end;    
end;

procedure PCodeGenerator.WritePackageDeclaration(Writer: PStringWriter; AClassifier: IUMLClassifier);
var
  Pkg: IUMLPackage;
begin
  if AClassifier.Namespace.QueryInterface(IUMLPackage, Pkg) = S_OK then
    if Pkg <> FBasePackageElement then begin
      if Writer.Writed then
        Writer.WriteLine;
      Writer.WriteLine('package %s;', [UMLPathToJavaPath(GetRelativePath(Pkg))]);
    end;
end;

procedure PCodeGenerator.WriteImportStatements(Writer: PStringWriter; AClassifier: IUMLClassifier);

  procedure WriteImportStatement(Writer: PStringWriter; AClassifier: IUMLClassifier; var Imported: Boolean);
  var
    Dep: IUMLDependency;
    Pkg: IUMLPackage;
    Clsf: IUMLClassifier;
    I: Integer;
    FFName: string;
  begin
    for I := 0 to AClassifier.GetClientDependencyCount - 1 do begin
      Dep := AClassifier.GetClientDependencyAt(I);
      if Dep.StereotypeName = STD_STEREOTYPE_IMPORT then begin
        if Dep.Supplier.QueryInterface(IUMLPackage, Pkg) = S_OK then begin
          FFName := UMLPathToJavaPath(GetRelativePath(Pkg));

          if (Pos('..', FFName) > 0)
            or (Trim(FFName) = '')
            or (Trim(FFName) = '.')
            or (FFName[Length(FFName)] = #46)
            or ((Length(FFName) > 0) and (FFName[1] = '.'))
            then
            Log(Format(MSG_CODE_GEN_IMPORT_NONAME, [ Pkg.GetMetaClass.Name, Dep.Supplier.Pathname]))
          else
            Writer.WriteLine('import %s.*;', [FFName]);
          Imported := True;
        end
        else if Dep.Supplier.QueryInterface(IUMLClassifier, Clsf) = S_OK then begin // not package
          FFName := UMLPathToJavaPath(GetRelativePath(Clsf));
          if (Pos('..', FFName) > 0)
            or (Trim(FFName) = '')
            or (Trim(FFName) = '.')
            or (FFName[Length(FFName)] = #46)
            or ((Length(FFName) > 0) and (FFName[1] = '.'))
            then
            Log(Format(MSG_CODE_GEN_IMPORT_NONAME, [Clsf.GetMetaClass.Name, Dep.Supplier.Pathname]))
          else
            Writer.WriteLine('import %s;', [FFName]);
          Imported := True;
        end;
      end;
    end;
  end;

var
  Pkg: IUMLPackage;
  Imported: Boolean;
begin
  Imported := False;
  if Writer.Writed then
    Writer.WriteLine;
  if AClassifier.Namespace.QueryInterface(IUMLPackage, Pkg) = S_OK then
    WriteImportStatement(Writer, Pkg, Imported);
  WriteImportStatement(Writer, AClassifier, Imported);
end;

procedure PCodeGenerator.WriteAttribute(Writer: PStringWriter; AAttribute: IUMLAttribute; var DefWrited: Boolean);
var
  JavaDocWrited: Boolean;
begin
  JavaDocWrited := False;
  if DefWrited then
    Writer.WriteLine;
  if FGenJavaDoc then
    WriteJavaDoc(Writer, AAttribute, JavaDocWrited);
  Writer.Write(VisibilityToString(AAttribute.Visibility) + ' ');
  if AAttribute.OwnerScope = skClassifier then
    Writer.Write('static ');
  if AAttribute.Changeability = ckFrozen then
    Writer.Write('final ');
  if GetBooleanTaggedValue(AAttribute, PROFILE_JAVA15, TAGSET_FIELD, TAG_TRANSIENT) then
    Writer.Write('transient ');
  if GetBooleanTaggedValue(AAttribute, PROFILE_JAVA15, TAGSET_FIELD, TAG_VOLATILE) then
    Writer.Write('volatile ');
  Writer.Write(GetTypeStr(AAttribute) + ' ');
  Writer.Write(AAttribute.Name);
  if AAttribute.InitialValue <> '' then
    // CODE MINION
    // Add check for enums, if it is an enum then
    // we dont write the '='
    if(AnsiCompareStr(GetTypeStr(AAttribute) , 'enum') = 0) then
       Writer.Write(' %s', [AAttribute.InitialValue])
    else
      Writer.Write(' = %s', [AAttribute.InitialValue]);
  Writer.WriteLine(';');
  DefWrited := DefWrited or JavaDocWrited;
end;

procedure PCodeGenerator.WriteAssociationEnd(Writer: PStringWriter; AAssocEnd: IUMLAssociationEnd; var DefWrited: Boolean);
var
  JavaDocWrited: Boolean;
begin
  JavaDocWrited := False;
  if DefWrited then
    Writer.WriteLine;
  if FGenJavaDoc then
    WriteJavaDoc(Writer, AAssocEnd, JavaDocWrited);
  Writer.Write(VisibilityToString(AAssocEnd.Visibility) + ' ');
  if AAssocEnd.Changeability = ckFrozen then
    Writer.Write('final ');
  if GetBooleanTaggedValue(AAssocEnd, PROFILE_JAVA15, TAGSET_FIELD, TAG_TRANSIENT) then
    Writer.Write('transient ');
  if GetBooleanTaggedValue(AAssocEnd, PROFILE_JAVA15, TAGSET_FIELD, TAG_VOLATILE) then
    Writer.Write('volatile ');
  Writer.Write(GetTypeStr(AAssocEnd) + ' ');
  if AAssocEnd.Name = '' then
    Writer.WriteLine(Format('%s;', [NameUnnamedAssocEnd(AAssocEnd)]))
  else
    Writer.WriteLine(Format('%s;', [AAssocEnd.Name]));
  DefWrited := DefWrited or JavaDocWrited;
end;

procedure PCodeGenerator.WriteOperation(Writer: PStringWriter; AOperation: IUMLOperation; var DefWrited: Boolean; IsOverrided: Boolean = False);
var
  Throws: string;
  JavaDocWrited: Boolean;
begin
  JavaDocWrited := False;
  if DefWrited then
    Writer.WriteLine;
  if FGenJavaDoc then
    WriteJavaDoc(Writer, AOperation, JavaDocWrited);
  Writer.Write(VisibilityToString(AOperation.Visibility) + ' ');
  if AOperation.IsAbstract and (not IsOverrided) then
    Writer.Write('abstract ');
  if AOperation.OwnerScope = skClassifier then
    Writer.Write('static ');
  if AOperation.IsLeaf then
    Writer.Write('final ');
  if GetBooleanTaggedValue(AOperation, PROFILE_JAVA, TAGSET_OPERATION, TAG_NATIVE) then
    Writer.Write('native ');
  if GetBooleanTaggedValue(AOperation, PROFILE_JAVA15, TAGSET_STRICTFP, TAG_STRICTFP) then
    Writer.Write('strictfp ');
  if AOperation.Concurrency = cckGuarded then
    Writer.Write('synchronized ');
  Writer.Write(GetReturnTypeStr(AOperation) + ' ');
  Writer.Write('%s(%s)', [AOperation.Name, GetParametersClause(AOperation)]);
  Throws := GetStringTaggedValue(AOperation, PROFILE_JAVA15, TAGSET_OPERATION, TAG_THROWS);
  if Throws <> '' then
    Writer.Write(' throws %s', [Throws]);
  if AOperation.Owner.IsKindOf('UMLClass') and (IsOverrided or (not AOperation.IsAbstract)) then begin
    if FBraceAtNewLine then
      Writer.WriteLine
    else
      Writer.Write(' ');
    Writer.WriteLine('{');
    Writer.WriteLine;
    Writer.WriteLine('}');
    DefWrited := True;
  end
  else begin
    Writer.WriteLine(';');
    DefWrited := DefWrited or JavaDocWrited;
  end;
end;

procedure PCodeGenerator.WriteMembers(Writer: PStringWriter; AClassifier: IUMLClassifier);
var
  NotImplOpers: TInterfaceList;
  Assoc, OtherSide: IUMLAssociationEnd;
  Cls: IUMLClass;
  Intf: IUMLInterface;
  Oper: IUMLOperation;
  DefWrited: Boolean;
  I: Integer;
begin
  DefWrited := False;
  for I := 0 to AClassifier.GetAttributeCount - 1 do
    WriteAttribute(Writer, AClassifier.GetAttributeAt(I), DefWrited);
  for I := 0 to AClassifier.GetAssociationCount - 1 do begin
    Assoc := AClassifier.GetAssociationAt(I);
    OtherSide := Assoc.GetOtherSide;
    if OtherSide.IsNavigable and ((OtherSide.Name <> '') or FAlsoGenerateUnnamedAssoc) then
      WriteAssociationEnd(Writer, OtherSide, DefWrited);
  end;

  for I := 0 to AClassifier.GetOperationCount - 1 do
    WriteOperation(Writer, AClassifier.GetOperationAt(I), DefWrited);
  if AClassifier.QueryInterface(IUMLClass, Cls) = S_OK then begin
    NotImplOpers := TInterfaceList.Create;
    try
      CollectNotImplementedOperations(Cls, NotImplOpers);
      for I := 0 to NotImplOpers.Count - 1 do begin
        if NotImplOpers.Items[I].QueryInterface(IUMLOperation, Oper) = S_OK then
          WriteOperation(Writer, Oper, DefWrited, True);
      end;
    finally
      NotImplOpers.Free;
    end;
  end;

  for I := 0 to AClassifier.GetOwnedElementCount - 1 do begin
    if AClassifier.GetOwnedElementAt(I).QueryInterface(IUMLClass, Cls) = S_OK then begin
      WriteClassDefinition(Writer, Cls);
    end
    else if AClassifier.GetOwnedElementAt(I).QueryInterface(IUMLInterface, Intf) = S_OK then begin
      WriteInterfaceDefinition(Writer, Intf);
    end;
  end;
end;

procedure PCodeGenerator.WriteClassDefinition(Writer: PStringWriter; AClass: IUMLClass);
var
  JavaDocWrited: Boolean;
begin

  if Trim(AClass.Name) = '' then
  begin
    Log(Format(MSG_CODE_GEN_NONAME, [AClass.GetMetaClass.Name, AClass.Pathname]));
    Exit;
  end;

  if Writer.Writed then
    Writer.WriteLine;
  JavaDocWrited := False;
  if FGenJavaDoc then
    WriteJavaDoc(Writer, AClass, JavaDocWrited);
  Writer.Write(VisibilityToString(AClass.Visibility) + ' ');
  if GetBooleanTaggedValue(AClass, PROFILE_JAVA15, TAGSET_CLASS, TAG_STATIC) then
    Writer.Write('static ');
  if AClass.IsAbstract then
    Writer.Write('abstract ');
  if AClass.IsLeaf then
    Writer.Write('final ');
  if GetBooleanTaggedValue(AClass, PROFILE_JAVA15, TAGSET_STRICTFP, TAG_STRICTFP) then
    Writer.Write('strictfp ');
  Writer.Write('class %s', [AClass.Name]);
  Writer.Write(GetExtendsClause(AClass));
  Writer.Write(GetImplementsClause(AClass));
  if FBraceAtNewLine then
    Writer.WriteLine
  else
    Writer.Write(' ');
  Writer.WriteLine('{');
  Writer.Indent;
  WriteMembers(Writer, AClass);
  Writer.Outdent;
  Writer.WriteLine('}');
end;

procedure PCodeGenerator.WriteInterfaceDefinition(Writer: PStringWriter; AInterface: IUMLInterface);
var
  JavaDocWrited: Boolean;
begin
  if Writer.Writed then
    Writer.WriteLine;
  JavaDocWrited := False;
  if FGenJavaDoc then
    WriteJavaDoc(Writer, AInterface, JavaDocWrited);
  Writer.Write(VisibilityToString(AInterface.Visibility) + ' ');
  if GetBooleanTaggedValue(AInterface, PROFILE_JAVA15, TAGSET_STRICTFP, TAG_STRICTFP) then
    Writer.Write('strictfp ');
  Writer.Write('interface %s', [AInterface.Name]);
  Writer.Write(GetExtendsClause(AInterface));
  if FBraceAtNewLine then
    Writer.WriteLine
  else
    Writer.Write(' ');
  Writer.WriteLine('{');
  Writer.Indent;
  WriteMembers(Writer, AInterface);
  Writer.Outdent;
  Writer.WriteLine('}');
end;

{ Public Methods }

procedure PCodeGenerator.AddTargetElement(Value: IUMLModelElement);
begin
  if FTargetElements.IndexOf(Value) = -1 then
    FTargetElements.Add(Value);
end;

procedure PCodeGenerator.ClearTargetElements;
begin
  FTargetElements.Clear;
end;

procedure PCodeGenerator.GenerateCode;
var
  Writer: PStringWriter;
  Cls: IUMLClass;
  Intf: IUMLInterface;
  I: Integer;
begin
  if not Initialized then
    raise Exception.Create(ERR_CODE_GEN_NOT_INITIALIZED);

  Log(Format(MSG_CODE_GEN_BEGIN, [TargetElementCount]));
  for I := 0 to TargetElementCount - 1 do begin
    if Assigned(FOnGeneratingCode) then
      FOnGeneratingCode(Self, TargetElements[I], I + 1, TargetElementCount);

    if Trim(TargetElements[I].Name) = '' then
    begin
      Log(Format(MSG_CODE_GEN_NONAME, [TargetElements[I].GetMetaClass.Name, TargetElements[I].Pathname]));
      OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, False);
      Continue;
    end;
///////////////////// 상위 Namesapce의 이름이 '' 일경우 하위 는 생성 않함
    if (TargetElements[I].IsKindOf('UMLClassifier')) and (Pos('\\',GetSourceFilePath(TargetElements[I] as IUMLClassifier)) > 0) then
    begin
      Log(Format(MSG_CODE_GEN_NAMESPACE_NONAME, [TargetElements[I].GetMetaClass.Name, TargetElements[I].Pathname]));
      OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, False);
      Continue;
    end;

    try
      Writer := CreateStringWriter;
      try
        if TargetElements[I].QueryInterface(IUMLClass, Cls) = S_OK then begin
          WriteFileHeader(Writer, Cls);
          WritePackageDeclaration(Writer, Cls);
          WriteImportStatements(Writer, Cls);
          WriteClassDefinition(Writer, Cls);
          Writer.SaveToFile(GetSourceFilePath(Cls));
        end
        else if TargetElements[I].QueryInterface(IUMLInterface, Intf) = S_OK then begin
          WriteFileHeader(Writer, Intf);
          WritePackageDeclaration(Writer, Intf);
          WriteImportStatements(Writer, Intf);
          WriteInterfaceDefinition(Writer, Intf);
          Writer.SaveToFile(GetSourceFilePath(Intf));
        end;
      finally
        Writer.Free;
      end;
      if Assigned(FOnGenerateCode) then
        FOnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, True);
    except
      on E: Exception do begin
        Log(Format(ERR_CODE_GEN_ERROR, [TargetElements[I].Name, E.Message]));
        if Assigned(FOnGenerateCode) then
          FOnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, False);
      end;
    end;
  end;
  Log(MSG_CODE_GEN_FINISH);
end;

{CODE MINION HELPER FUNCTIONS}
{ This function takes in a type and removes the generics section from
 it. This is done because  during my modification of the parser the
 generics clause is inserted as part of the type, however this is not
 a desirable outcome since we want to use the type for creating
 relations and files among others.
 }
function PCodeGenerator.StripGeneric(typeWithGenerics: string):string;
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

end.
