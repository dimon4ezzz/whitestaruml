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

interface

uses
  Utility,
  Classes, SysUtils, WhiteStarUML_TLB;

type
  // Exceptions
  ENotInitialized = class(Exception);

  // Enumerations
  PMemberOrderKind = (okNotOrder, okPublicFirst, okPrivateFirst);
  PFileNameFormat = (fkSameAsElementName, fkUpperCase, fkLowerCase, fkLowerCaseAndUnderline);

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
    Includes: TStringList;
    { Options }
    FUseTab: Boolean;
    FIdentationSize: Integer;
    FMsSpecific: Boolean;
    FCppNetSpecific: Boolean;
    FGenerateComment: Boolean;
    FOrderMember: PMemberOrderKind;
    FBraceAtNewLine: Boolean;
    FHeaderFileExt: string;
    FBodyFileExt: string;
    FHeaderSubdir: string;
    FBodySubdir: string;
    FPackageAsNamespace: Boolean;
    FRootPackageAsNamespace: Boolean;
    FCreateSubdirectoryForNamespace: Boolean;
    FFileNameFormat: PFileNameFormat;
    FHeaderComment: string;
    FDefaultHeaderIncludes: string;
    FDefaultBodyIncludes: string;
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
    { Auxiliary Functions }
    procedure ClearIncludes;
    procedure AddInclude(FileName: string); overload;
    procedure AddInclude(IncludingClassifier, InclusionClassifier: IUMLClassifier); overload;
    function GetHFileDefinitionName(HeaderFileName: string): string;

    function VisibilityToString(Visibility: UMLVisibilityKind): string;
    function HasNotReturnType(AOperation: IUMLOperation): Boolean;
    function IsVirtualMemberFunction(AOperation: IUMLOperation): Boolean;
    function GetMemberFunctionName(AOperation: IUMLOperation): string;

    function ExistsMemberOnVisibility(AClassifier: IUMLClassifier; Visibility: UMLVisibilityKind): Boolean;
    function ExistsPublicMember(AClassifier: IUMLClassifier): Boolean;
    function ExistsProtectedMember(AClassifier: IUMLClassifier): Boolean;
    function ExistsPrivateMember(AClassifier: IUMLClassifier): Boolean;

    function GetClassTypeKindStr(AClass: IUMLClass): string;
    function GetInheritenceSpecStr(AClassifier: IUMLClassifier): string;

    function GetAttributeTypeStr(AAttribute: IUMLAttribute): string;
    function GetAttributeNameStr(AAttribute: IUMLAttribute): string;

    function GetParameterTypeStr(AParameter: IUMLParameter): string;
    function GetParameterStr(AParameter: IUMLParameter): string;
    function GetOperationTypeStr(AOperation: IUMLOperation): string;
    function GetOperationParametersStr(AOperation: IUMLOperation): string;

    function GetDefOperationName(AOperation: IUMLOperation; Base: IUMLClassifier = nil): string;
    function GetDefStaticDataMemberName(AAttribute: IUMLAttribute): string;
    function GetTopNestingClassifier(BaseClassifier: IUMLClassifier): IUMLClassifier;
    function IsSameTopNestingClassifier(ClassifierA, ClassifierB: IUMLClassifier): Boolean;
    { File-Related Auxiliary Functions }
    function GetFormattedFileName(Name: string): string;
    function GetHeaderFilePath(ModelElem: IUMLModelElement): string;
    function GetBodyFilePath(ModelElem: IUMLModelElement): string;
    function GetHeaderFileName(ModelElem: IUMLModelElement): string;
    function GetBodyFileName(ModelElem: IUMLModelElement): string;
    function GetRelativeCodePath(AModelElem: IUMLModelElement): string;
    procedure CollectPathFragments(Path: string; OutStrings: TStringList);
    procedure CollectNamespaceNames(Path: string; OutStrings: TStringList);
    function NeedBodyFile(ModelElem: IUMLModelElement): Boolean;
    { Abstract Function Collecting Methods }
    function IsSameSignature(OperA, OperB: IUMLOperation): Boolean;
      { do not use following functions directly --}
    function FindSameSignatureOperation(AOperation: IUMLOperation; OperList: TInterfaceList): IUMLOperation;
    procedure CollectOperationsInClass(AClass: IUMLClass; NotImpledOpers: TInterfaceList; ImpledOpers: TInterfaceList; IncludeSelf: Boolean = True);
    procedure CollectOperationsInInterface(AInterface: IUMLInterface; NotImpledOpers: TInterfaceList; ImpledOpers: TInterfaceList);
      { -- do not use upper functions directly }
    procedure CollectNotImplementedOperations(AClass: IUMLClass; NotImpledOpers: TInterfaceList);
    { Common Writing Methods }
    procedure WriteFileHeader(Writer: PStringWriter; AModelElem: IUMLModelElement; IsHeader: Boolean);
    procedure WriteFileFooter(Writer: PStringWriter; AModelElem: IUMLModelElement; IsHeader: Boolean);
    procedure WriteIncludes(Writer: PStringWriter; AModelElem: IUMLModelElement);
    procedure WriteComments(Writer: PStringWriter; Comment: string);
    { Declaration Writing Methods }
    procedure WriteOwnerNamespacesOpen(Writer: PStringWriter; Namespaces: TStringList);
    procedure WriteOwnerNamespacesClose(Writer: PStringWriter; Namespaces: TStringList);
    procedure WriteUsingRelation(Writer: PStringWriter; APackage: IUMLPackage);
    procedure WriteDeclAttribute(Writer: PStringWriter; AAttribute: IUMLAttribute);
    procedure WriteDeclOperation(Writer: PStringWriter; AOperation: IUMLOperation; IsOverrided: Boolean = False);
    procedure WriteDeclAssociationEnd(Writer: PStringWriter; AAssociationEnd: IUMLAssociationEnd);
    procedure WriteDeclMemberOnVisibility(Writer: PStringWriter; AClassifier: IUMLClassifier; Visibility: UMLVisibilityKind);
    procedure WriteDeclPublicMember(Writer: PStringWriter; AClassifier: IUMLClassifier);
    procedure WriteDeclProtectedMember(Writer: PStringWriter; AClassifier: IUMLClassifier);
    procedure WriteDeclPrivateMember(Writer: PStringWriter; AClassifier: IUMLClassifier);
    procedure WriteDeclMemberUnordered(Writer: PStringWriter; AClassifier: IUMLClassifier);
    procedure WriteDeclMember(Writer: PStringWriter; AClassifier: IUMLClassifier);
    procedure WriteDeclClass(Writer: PStringWriter; AClass: IUMLClass);
    procedure WriteDeclInterface(Writer: PStringWriter; AInterface: IUMLInterface);
    procedure WriteDeclEnumeration(Writer: PStringWriter; AEnumeration: IUMLEnumeration);
    procedure WriteDeclDelegate(Writer: PStringWriter; AClass: IUMLClass);
    procedure WriteDeclModelElement(Writer: PStringWriter; AModelElem: IUMLModelElement);
    { Definition Writing Methods }
    procedure WriteDefOperation(Writer: PStringWriter; AOperation: IUMLOperation; ABase: IUMLClassifier = nil);
    procedure WriteDefStaticDataMember(Writer: PStringWriter; AAttribute: IUMLAttribute);
    procedure WriteDefMemberOnVisibility(Writer: PStringWriter; AClassifier: IUMLClassifier; Visibility: UMLVisibilityKind);
    procedure WriteDefMemberUnordered(Writer: PStringWriter; AClassifier: IUMLClassifier);
    procedure WriteDefClass(Writer: PStringWriter; AClass: IUMLClass);
    procedure WriteDefModelElement(Writer: PStringWriter; AModelElem: IUMLModelElement);
    { Miscellaneous Methods }
    procedure ImproperModel(Model: IUMLModelElement; Msg: string);
    procedure Log(Msg: string);
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
    property MsSpecific: Boolean read FMsSpecific write FMsSpecific;
    property CppNetSpecific: Boolean read FCppNetSpecific write FCppNetSpecific;
    property GenerateComment: Boolean read FGenerateComment write FGenerateComment;
    property OrderMember: PMemberOrderKind read FOrderMember write FOrderMember;
    property BraceAtNewLine: Boolean read FBraceAtNewLine write FBraceAtNewLine;
    property HeaderFileExt: string read FHeaderFileExt write FHeaderFileExt;
    property BodyFileExt: string read FBodyFileExt write FBodyFileExt;
    property HeaderSubdir: string read FHeaderSubdir write FHeaderSubdir;
    property BodySubdir: string read FBodySubdir write FBodySubdir;
    property PackageAsNamespace: Boolean read FPackageAsNamespace write FPackageAsNamespace;
    property RootPackageAsNamespace: Boolean read FRootPackageAsNamespace write FRootPackageAsNamespace;
    property CreateSubdirectoryForNamespace: Boolean read FCreateSubdirectoryForNamespace write FCreateSubdirectoryForNamespace;
    property FileNameFormat: PFileNameFormat read FFileNameFormat write FFileNameFormat;
    property HeaderComment: string read FHeaderComment write FHeaderComment;
    property DefaultHeaderIncludes: string read FDefaultHeaderIncludes write FDefaultHeaderIncludes;
    property DefaultBodyIncludes: string read FDefaultBodyIncludes write FDefaultBodyIncludes;
    { Events }
    property OnLog: PLogEvent read FOnLog write FOnLog;
    property OnGeneratingCode: PCodeGeneratingEvent read FOnGeneratingCode write FOnGeneratingCode;
    property OnGenerateCode: PCodeGenerateEvent read FOnGenerateCode write FOnGenerateCode;
 end;

implementation

uses
  Symbols, NLS_CppAddIn,
  FileCtrl, Dialogs;

////////////////////////////////////////////////////////////////////////////////
// PCodeGenerator

constructor PCodeGenerator.Create;
begin
  inherited;
  FTargetElements := TInterfaceList.Create;
  FBaseDirectory := '';
  FBasePackageElement := nil;
  Includes := TStringList.Create;
end;

destructor PCodeGenerator.Destroy;
begin
  FTargetElements.Free;
  FTargetElements := nil;
  Includes.Free;
  Includes := nil;
  inherited;
end;

function PCodeGenerator.GetTargetElementCount: Integer;
begin
  Result := FTargetElements.Count;
end;

function PCodeGenerator.GetTargetElement(Index: Integer): IUMLModelElement;
begin
  Result := FTargetElements.Items[Index] as IUMLModelElement;
end;

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

procedure PCodeGenerator.ClearIncludes;
begin
  Includes.Clear;
end;

procedure PCodeGenerator.AddInclude(FileName: string);
begin
  if Includes.IndexOf(FileName) = -1 then
    Includes.Add(FileName);
end;

procedure PCodeGenerator.AddInclude(IncludingClassifier, InclusionClassifier: IUMLClassifier);
begin
  if not IsSameTopNestingClassifier(IncludingClassifier, InclusionClassifier) then
    AddInclude(GetHeaderFileName(GetTopNestingClassifier(InclusionClassifier)));
end;

function PCodeGenerator.GetHFileDefinitionName(HeaderFileName: string): string;
begin
  Result := '_' + Uppercase(HeaderFileName) + '_H';
end;

function PCodeGenerator.VisibilityToString(Visibility: UMLVisibilityKind): string;
begin
  case Visibility of
    vkPublic: Result := 'public';
    vkProtected: Result := 'protected';
    vkPrivate: Result := 'private';
    else
      Result := '';
  end;
end;

function PCodeGenerator.HasNotReturnType(AOperation: IUMLOperation): Boolean;
begin
  Result := (AOperation.StereotypeName = STEREOTYPE_CREATE)
    or (AOperation.StereotypeName = STEREOTYPE_DESTROY)
    or (AOperation.StereotypeName = STEREOTYPE_CPP_MACRO);
end;

function PCodeGenerator.IsVirtualMemberFunction(AOperation: IUMLOperation): Boolean;
begin
  Result := AOperation.IsAbstract
    or GetBooleanTaggedValue(AOperation, PROFIlE_CPP, TAGSET_CPP_VIRTUAL, TAG_CPP_VIRTUAL);
end;

function PCodeGenerator.GetMemberFunctionName(AOperation: IUMLOperation): string;
begin
  if AOperation.StereotypeName = STEREOTYPE_DESTROY then
    Result := '~' + AOperation.Name
  else if AOperation.StereotypeName = STEREOTYPE_CPP_OPERATOR then
    Result := 'operator ' + AOperation.Name
  else
    Result := AOperation.Name;
end;

function PCodeGenerator.ExistsMemberOnVisibility(AClassifier: IUMLClassifier; Visibility: UMLVisibilityKind): Boolean;

  function IsGeneratableModelElement(M: IUMLModelElement): Boolean;
  begin
    Result := AClassifier.IsKindOf(ELEM_CLASS) or AClassifier.IsKindOf(ELEM_INTERFACE);
  end;

var
  Assoc, OtherSide: IUMLAssociationEnd;
  Cls: IUMLClass;
  Oper: IUMLOperation;
  AbstOpers: TInterfaceList;
  I: Integer;
begin
  Result := False;
  for I := 0 to AClassifier.GetOwnedElementCount - 1 do begin
    if IsGeneratableModelElement(AClassifier.GetOwnedElementAt(I))
      and (AClassifier.GetOwnedElementAt(I).Visibility = Visibility) then begin
      Result := True;
      Exit;
    end;
  end;
  for I := 0 to AClassifier.GetAttributeCount - 1 do
    if AClassifier.GetAttributeAt(I).Visibility = Visibility then begin
      Result := True;
      Exit;
    end;
  for I := 0 to AClassifier.GetOperationCount - 1 do
    if AClassifier.GetOperationAt(I).Visibility = Visibility then begin
      Result := True;
      Exit;
    end;
  for I := 0 to AClassifier.GetAssociationCount - 1 do begin
    Assoc := AClassifier.GetAssociationAt(I);
    OtherSide := Assoc.GetOtherSide;
    if OtherSide.IsNavigable and (OtherSide.Name <> '') and (OtherSide.Visibility = Visibility) then begin
      Result := True;
      Exit;
    end;
  end;

  if AClassifier.QueryInterface(IUMLClass, Cls) = S_OK then begin
    AbstOpers := TInterfaceList.Create;
    try
      CollectNotImplementedOperations(Cls, AbstOpers);
      for I := 0 to AbstOpers.Count - 1 do begin
        Assert(AbstOpers.Items[I].QueryInterface(IUMLOperation, Oper) = S_OK);
        if Oper.Owner.IsKindOf(ELEM_INTERFACE) then begin
          if Visibility = vkPublic then begin
            Result := True;
            Exit;
          end;
        end
        else if Oper.Visibility = Visibility then begin
          Result := True;
          Exit;
        end;
      end;
    finally
      AbstOpers.Free;
    end;
  end;
end;

function PCodeGenerator.ExistsPublicMember(AClassifier: IUMLClassifier): Boolean;
begin
  Result := ExistsMemberOnVisibility(AClassifier, vkPublic);
end;

function PCodeGenerator.ExistsProtectedMember(AClassifier: IUMLClassifier): Boolean;
begin
  Result := ExistsMemberOnVisibility(AClassifier, vkProtected);
end;

function PCodeGenerator.ExistsPrivateMember(AClassifier: IUMLClassifier): Boolean;
begin
  Result := ExistsMemberOnVisibility(AClassifier, vkPrivate);
end;

function PCodeGenerator.GetClassTypeKindStr(AClass: IUMLClass): string;
begin
  if AClass.StereotypeName = STEREOTYPE_CPP_STRUCT then
    Result := 'struct'
  else if AClass.StereotypeName = STEREOTYPE_CPP_UNION then
    Result := 'union'
  else
    Result := 'class';
end;

function PCodeGenerator.GetInheritenceSpecStr(AClassifier: IUMLClassifier): string;
var
  Gen: IUMLGeneralization;
  Dep: IUMLDependency;
  Clsf: IUMLClassifier;
  S: string;
  I: Integer;
begin
  S := '';
  for I := 0 to AClassifier.GetGeneralizationCount - 1 do begin
    Gen := AClassifier.GetGeneralizationAt(I);
    if S <> '' then S := S + ', ';
    if GetBooleanTaggedValue(Gen, PROFILE_CPP, TAGSET_CPP_VIRTUAL, TAG_CPP_VIRTUAL) then
      S := S + 'virtual ';
    S := S + VisibilityToString(Gen.Visibility) + ' ' + Gen.Parent.Name;
    if Gen.Parent.QueryInterface(IUMLClassifier, Clsf) = S_OK then
      AddInclude(AClassifier, Clsf);
  end;
  for I := 0 to AClassifier.GetClientDependencyCount - 1 do begin
    Dep := AClassifier.GetClientDependencyAt(I);
    if Dep.IsKindOf(ELEM_REALIZATION) then begin
      if S <> '' then S := S + ', ';
      if GetBooleanTaggedValue(Dep, PROFILE_CPP, TAGSET_CPP_VIRTUAL, TAG_CPP_VIRTUAL) then
        S := S + 'virtual ';
      S := S + VisibilityToString(Dep.Visibility) + ' ' + Dep.Supplier.Name;
      if Dep.Supplier.QueryInterface(IUMLClassifier, Clsf) = S_OK then
        AddInclude(AClassifier, Clsf);
    end;
  end;
  if S <> '' then
    S := ' : ' + S;
  Result := S;

// (constraint)
// 1. interface의 상속(generalization) 에서는 virtual, visibility가 올수 없다.
// 2. Realization의 경우 Class(Client) - Interface(Supplier)의 경우에만 의미가 있다.
end;

function PCodeGenerator.GetAttributeTypeStr(AAttribute: IUMLAttribute): string;
begin
  if AAttribute.Type_ <> nil then begin
    Result := AAttribute.Type_.Name;
    AddInclude(AAttribute.Owner, AAttribute.Type_);
  end
  else if AAttribute.TypeExpression = '' then
    Result := 'int'
  else
    Result := AAttribute.TypeExpression;
end;

function PCodeGenerator.GetAttributeNameStr(AAttribute: IUMLAttribute): string;
begin
  Result := GetStringTaggedValue(AAttribute, PROFILE_CPP, TAGSET_CPP_POINTER, TAG_CPP_POINTER) + AAttribute.Name;
{
  if GetBooleanTaggedValue(AAttribute, PROFILE_CPP, TAGSET_CPP_POINTER, TAG_CPP_POINTER) then
    Result := '*' + AAttribute.Name
  else if GetBooleanTaggedValue(AAttribute, PROFILE_CPP, TAGSET_CPP_POINTER, TAG_CPP_REFERENCE) then
    Result := '&' + AAttribute.Name
  else
    Result := AAttribute.Name;
}
end;

function PCodeGenerator.GetParameterTypeStr(AParameter: IUMLParameter): string;
var
  Oper: IUMLOperation;
  S: string;
begin
  S := 'int';
  if AParameter.Type_ <> nil then begin
    S := AParameter.Type_.Name;
    if (AParameter.BehavioralFeature <> nil) and (AParameter.BehavioralFeature.QueryInterface(IUMLOperation, Oper) = S_OK) then
      AddInclude(Oper.Owner, AParameter.Type_);
  end
  else if (AParameter.TypeExpression = '') and (AParameter.DirectionKind <> pdkReturn) then
    Log(Format(ERR_PARAMETR_TYPE_NOT_DEFINED, [AParameter.Name]))
  else
    S := AParameter.TypeExpression;
  Result := S;
end;

function PCodeGenerator.GetParameterStr(AParameter: IUMLParameter): string;
var
  S: string;
begin
  S := '';
  if GetBooleanTaggedValue(AParameter, PROFILE_CPP, TAGSET_CPP_CONST, TAG_CPP_CONST) then
    S := S + 'const ';
  S := S + GetParameterTypeStr(AParameter) + ' ';
  if (AParameter.DirectionKind = pdkInOut) or (AParameter.DirectionKind = pdkOut) then
    S := S + '&'
  else if GetStringTaggedValue(AParameter, PROFILE_CPP, TAGSET_CPP_POINTER, TAG_CPP_POINTER) <> '' then
    S := S + GetStringTaggedValue(AParameter, PROFILE_CPP, TAGSET_CPP_POINTER, TAG_CPP_POINTER);
  S := S + AParameter.Name;
  if AParameter.DefaultValue <> '' then
    S := S + ' = ' + AParameter.DefaultValue;
  Result := S;
end;

function PCodeGenerator.GetOperationTypeStr(AOperation: IUMLOperation): string;
var
  Param: IUMLParameter;
  I: Integer;
begin
  Result := 'void';
  for I := 0 to AOperation.GetParameterCount - 1 do begin
    Param := AOperation.GetParameterAt(I);
    if Param.DirectionKind = pdkReturn then begin
      Result := GetParameterTypeStr(Param) + GetStringTaggedValue(Param, PROFILE_CPP, TAGSET_CPP_POINTER, TAG_CPP_POINTER);
      Exit;
    end;
  end;
end;

function PCodeGenerator.GetOperationParametersStr(AOperation: IUMLOperation): string;
var
  Param: IUMLParameter;
  IsMacro: Boolean;
  Added: Boolean;
  S: string;
  I: Integer;
begin
  IsMacro := (AOperation.StereotypeName = STEREOTYPE_CPP_MACRO);
  S := '';
  Added := False;
  for I := 0 to AOperation.GetParameterCount - 1 do begin
    Param := AOperation.GetParameterAt(I);
    if Param.DirectionKind <> pdkReturn then begin
      if Added then S := S + ', ';
      if IsMacro then
        S := S + Param.Name
      else
        S := S + GetParameterStr(Param);
      Added := True;
    end;
  end;
  Result := S;
end;

function PCodeGenerator.GetDefOperationName(AOperation: IUMLOperation; Base: IUMLClassifier = nil): string;
var
  Ns: IUMLNamespace;
  S: string;
begin
  S := GetMemberFunctionName(AOperation);
  if Base = nil then
    Ns := AOperation.Owner
  else
    Ns := Base;
  while (Ns <> nil) and (Ns.IsKindOf(ELEM_CLASS) or Ns.IsKindOf(ELEM_INTERFACE)) do begin
    S := Ns.Name + '::' + S;
    Ns := Ns.Namespace;
  end;
  Result := S;
end;



function PCodeGenerator.GetDefStaticDataMemberName(AAttribute: IUMLAttribute): string;
var
  Ns: IUMLNamespace;
  S: string;
begin
  S := AAttribute.Name;
  Ns := AAttribute.Owner;

  while (Ns <> nil) and (Ns.IsKindOf(ELEM_CLASS) or Ns.IsKindOf(ELEM_INTERFACE)) do begin
    S := Ns.Name + '::' + S;
    Ns := Ns.Namespace;
  end;
  Result := S;
end;


function PCodeGenerator.GetTopNestingClassifier(BaseClassifier: IUMLClassifier): IUMLClassifier;
var
  Ns: IUMLNamespace;
  Clsf: IUMLClassifier;
begin
  Clsf := BaseClassifier;
  Ns := Clsf.Namespace;
  while (Ns <> nil) and (not Ns.IsKindOf(ELEM_PACKAGE)) and
    (Ns.QueryInterface(IUMLClassifier, Clsf) = S_OK) do
    Ns := Clsf.Namespace;
  Result := Clsf;
end;

function PCodeGenerator.IsSameTopNestingClassifier(ClassifierA, ClassifierB: IUMLClassifier): Boolean;
begin
  Result := (GetTopNestingClassifier(ClassifierA) = GetTopNestingClassifier(ClassifierB));
end;

function PCodeGenerator.GetFormattedFileName(Name: string): string;
begin
  case FFileNameFormat of
    fkUpperCase:
      Result := UpperCase(Name);
    fkLowerCase:
      Result := LowerCase(Name);
    fkLowerCaseAndUnderline:
      Result := StringReplace(LowerCase(Name), ' ', '_', [rfReplaceAll]);
    else
      Result := Name;
  end;
end;

function PCodeGenerator.GetHeaderFilePath(ModelElem: IUMLModelElement): string;
var
  SL: TStringList;
  Path: string;
  I: Integer;
begin
  Path := FBaseDirectory;
  if FHeaderSubdir <> '' then
    Path := Path + '\' + FHeaderSubdir;
  if FCreateSubdirectoryForNamespace then begin
    SL := TStringList.Create;
    try
      CollectNamespaceNames(GetRelativeCodePath(ModelElem), SL);
      for I := 0 to SL.Count - 1 do
        Path := Path + '\' + GetFormattedFileName(SL[I]);
    finally
      SL.Free;
    end;
  end;
  Result := Path + '\' + GetFormattedFileName(ModelElem.Name) + HeaderFileExt;
end;

function PCodeGenerator.GetBodyFilePath(ModelElem: IUMLModelElement): string;
var
  SL: TStringList;
  Path: string;
  I: Integer;
begin
  Path := FBaseDirectory;
  if FBodySubdir <> '' then
    Path := Path + '\' + FBodySubdir;
  if FCreateSubdirectoryForNamespace then begin
    SL := TStringList.Create;
    try
      CollectNamespaceNames(GetRelativeCodePath(ModelElem), SL);
      for I := 0 to SL.Count - 1 do
        Path := Path + '\' + GetFormattedFileName(SL[I]);
    finally
      SL.Free;
    end;
  end;
  Result := Path + '\' + GetFormattedFileName(ModelElem.Name) + BodyFileExt;
end;

function PCodeGenerator.GetHeaderFileName(ModelElem: IUMLModelElement): string;
begin
  Result := GetFormattedFileName(ModelElem.Name) + HeaderFileExt;
end;

function PCodeGenerator.GetBodyFileName(ModelElem: IUMLModelElement): string;
begin
  Result := GetFormattedFileName(ModelElem.Name) + BodyFileExt;
end;

function PCodeGenerator.GetRelativeCodePath(AModelElem: IUMLModelElement): string;
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

function PCodeGenerator.NeedBodyFile(ModelElem: IUMLModelElement): Boolean;
var
  AbstOpers: TInterfaceList;
  Cls: IUMLClass;
  Elem: IUMLModelElement;
  I: Integer;
begin
  Result := False;
  if ModelElem.IsKindOf(ELEM_CLASS) then begin
    Assert(ModelElem.QueryInterface(IUMLClass, Cls) = S_OK);

    for I := 0 to Cls.GetAttributeCount - 1 do
      if Cls.GetAttributeAt(I).OwnerScope = skClassifier then begin
        Result := True;
        Exit;
      end;

    for I := 0 to Cls.GetOperationCount - 1 do
      if not Cls.GetOperationAt(I).IsAbstract then begin
        Result := True;
        Exit;
      end;
    for I := 0 to Cls.GetOwnedElementCount - 1 do begin
      Elem := Cls.GetOwnedElementAt(I);
      if NeedBodyFile(Elem) then begin
        Result := True;
        Exit;
      end;
    end;
    AbstOpers := TInterfaceList.Create;
    try
      CollectNotImplementedOperations(Cls, AbstOpers);
      Result := (AbstOpers.Count > 0);
    finally
      AbstOpers.Free;
    end;
  end;
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

procedure PCodeGenerator.WriteFileHeader(Writer: PStringWriter; AModelElem: IUMLModelElement; IsHeader: Boolean);
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
  if IsHeader then
    S := StringReplace(S, STAMP_FILENAME, GetHeaderFileName(AModelElem) , [rfReplaceAll])
  else
    S := StringReplace(S, STAMP_FILENAME, GetBodyFileName(AModelElem) , [rfReplaceAll]);
  S := StringReplace(S, STAMP_ELEMENT, AModelElem.Name, [rfReplaceAll]);
  if S <> '' then begin
    Writer.WriteLine(S);
    Writer.WriteLine;
  end;
  if IsHeader then begin
    Writer.WriteLine('#if !defined(' + GetHFileDefinitionName(AModelElem.Name) + ')');
    Writer.WriteLine('#define ' + GetHFileDefinitionName(AModelElem.Name));
    Writer.WriteLine;
    if FDefaultHeaderIncludes <> '' then
      Writer.WriteLine(FDefaultHeaderIncludes);
    WriteIncludes(Writer, AModelElem);
  end
  else begin
    if FDefaultBodyIncludes <> '' then
      Writer.WriteLine(FDefaultBodyIncludes);
    Writer.WriteLine('#include "%s"', [GetHeaderFileName(AModelElem)]);
    WriteIncludes(Writer, AModelElem);
  end;
  if FCppNetSpecific then
    Writer.WriteLine('#using <mscorlib.dll>');
  Writer.WriteLine;
end;

procedure PCodeGenerator.WriteFileFooter(Writer: PStringWriter; AModelElem: IUMLModelElement; IsHeader: Boolean);
begin
  if IsHeader then begin
    Writer.WriteLine;
    Writer.WriteLine('#endif  //' + GetHFileDefinitionName(AModelElem.Name));
  end;
end;

procedure PCodeGenerator.WriteIncludes(Writer: PStringWriter; AModelElem: IUMLModelElement);
var
  I: Integer;
begin
  for I := 0 to Includes.Count - 1 do begin
    if Includes[I] <> AModelElem.Name then
      Writer.WriteLine('#include "%s"', [Includes[I]]);
  end;
end;

procedure PCodeGenerator.WriteComments(Writer: PStringWriter; Comment: string);
var
  SL: TStringList;
  I: Integer;
begin
  SL := TStringList.Create;
  SL.Text := Comment;
  for I := 0 to SL.Count - 1 do
    Writer.WriteLine('// ' + SL[I]);
  SL.Free;
end;

procedure PCodeGenerator.WriteOwnerNamespacesOpen(Writer: PStringWriter; Namespaces: TStringList);
var
  I: Integer;
begin
  for I := 0 to Namespaces.Count - 1 do begin
    if FBraceAtNewLine then begin
      Writer.WriteLine('namespace %s', [Namespaces[I]]);
      Writer.WriteLine('{');
    end
    else
      Writer.WriteLine('namespace %s {', [Namespaces[I]]);
    Writer.Indent;
  end;
end;

procedure PCodeGenerator.WriteOwnerNamespacesClose(Writer: PStringWriter; Namespaces: TStringList);
var
  I: Integer;
begin
  for I := 0 to Namespaces.Count - 1 do begin
    Writer.Outdent;
    Writer.WriteLine('}');
  end;
end;

procedure PCodeGenerator.WriteUsingRelation(Writer: PStringWriter; APackage: IUMLPackage);
begin
  // nothing
end;

procedure PCodeGenerator.WriteDeclAttribute(Writer: PStringWriter; AAttribute: IUMLAttribute);
var
  BitField: Integer;
begin
  if FGenerateComment then
    WriteComments(Writer, AAttribute.Documentation);
  if FMSSpecific and GetBooleanTaggedValue(AAttribute, PROFILE_CPP, TAGSET_VCPP_EVENT, TAG_CPP___EVENT) then
    Writer.Write('__event ');
  if AAttribute.OwnerScope = skClassifier then
    Writer.Write('static ');
  if AAttribute.Changeability = ckFrozen then
    Writer.Write('const ');
  if GetBooleanTaggedValue(AAttribute, PROFILE_CPP, TAGSET_CPP_MEMBER_DATA, TAG_CPP_MUTABLE) then
    Writer.Write('mutable ');
  if GetBooleanTaggedValue(AAttribute, PROFILE_CPP, TAGSET_CPP_MEMBER_DATA, TAG_CPP_VOLATILE) then
    Writer.Write('volatile ');
  Writer.Write(GetAttributeTypeStr(AAttribute));
  if FMSSpecific and GetBooleanTaggedValue(AAttribute, PROFILE_CPP, TAGSET_VCPP_W64, TAG_CPP___W64) then
    Writer.Write(' __w64');
  Writer.Write(' %s', [GetAttributeNameStr(AAttribute)]);
  BitField := GetIntegerTaggedValue(AAttribute, PROFILE_CPP, TAGSET_CPP_BIT_FIELD, TAG_CPP_BIT_FIELD);
  if BitField > 0 then
    Writer.Write(' : %d', [BitField]);
  //if AAttribute.InitialValue <> '' then
  //  Writer.Write(' = %s', [AAttribute.InitialValue]);
  Writer.WriteLine(';');
// (constraints)
// 1. mutable data member는 static 또는 const 일 수 없다.
// 2. (const/volatile) type name 과 type (const/volatile) name 의 차이점
//    http://msdn.microsoft.com/library/en-us/vclang/html/_pluslang_const_and_volatile_Pointers.asp?frame=true
end;

procedure PCodeGenerator.WriteDeclOperation(Writer: PStringWriter; AOperation: IUMLOperation; IsOverrided: Boolean = False);
var
  Template, Throw: string;
begin
  if FGenerateComment then
    WriteComments(Writer, AOperation.Documentation);
  Template := GetStringTaggedValue(AOperation, PROFIlE_CPP, TAGSET_CPP_MEMBER_FUNCTION, TAG_CPP_FUNCTION_TEMPLATE);
  if Template <> '' then
    Writer.Write('%s ', [Template]);

  if FCppNetSpecific then begin
    if AOperation.StereotypeName = STEREOTYPE_CPP_DELEGATE then
      Writer.Write('__delegate ');
    if GetBooleanTaggedValue(AOperation, PROFILE_CPP, TAGSET_VCPP_MEMBER_FUNCTION, TAG_CPP___PROPERTY) then
      Writer.Write('__property ');
    if AOperation.IsLeaf then Writer.Write('__sealed ');
    if GetBooleanTaggedValue(AOperation, PROFILE_CPP, TAGSET_VCPP_MEMBER_FUNCTION, TAG_CPP___INLINE) then
      Writer.Write('__inline ')
    else if GetBooleanTaggedValue(AOperation, PROFILE_CPP, TAGSET_VCPP_MEMBER_FUNCTION, TAG_CPP___FORCE_INLINE) then
      Writer.Write('__forceinline ');
  end;

  if AOperation.OwnerScope = skClassifier then
    Writer.Write('static ');
  if GetBooleanTaggedValue(AOperation, PROFIlE_CPP, TAGSET_CPP_MEMBER_FUNCTION, TAG_CPP_INLINE) then
    Writer.Write('inline ');
  if not IsOverrided and IsVirtualMemberFunction(AOperation) then
    Writer.Write('virtual ');

  if not HasNotReturnType(AOperation) then
    Writer.Write('%s ' , [GetOperationTypeStr(AOperation)]);

  if FMsSpecific then begin
    if GetBooleanTaggedValue(AOperation, PROFILE_CPP, TAGSET_VCPP_MEMBER_FUNCTION, TAG_CPP___CDECL) then
      Writer.Write('__cdecl ')
    else if GetBooleanTaggedValue(AOperation, PROFILE_CPP, TAGSET_VCPP_MEMBER_FUNCTION, TAG_CPP___STDCALL) then
      Writer.Write('__stdcall ')
    else if GetBooleanTaggedValue(AOperation, PROFILE_CPP, TAGSET_VCPP_MEMBER_FUNCTION, TAG_CPP___FASTCALL) then
      Writer.Write('__fastcall ')
  end;

  Writer.Write(GetMemberFunctionName(AOperation));
  Writer.Write('(%s)', [GetOperationParametersStr(AOperation)]);

  if GetBooleanTaggedValue(AOperation, PROFILE_CPP, TAGSET_CPP_CONST, TAG_CPP_CONST) then
    Writer.Write(' const');
  Throw := GetStringTaggedValue(AOperation, PROFILE_CPP, TAGSET_CPP_MEMBER_FUNCTION, TAG_CPP_THROW);
  if Throw <> '' then
    Writer.Write(' throw(%s)', [Throw]);
  if not IsOverrided and AOperation.IsAbstract then
    Writer.Write(' = 0');
  if AOperation.StereotypeName = STEREOTYPE_CPP_MACRO then
    Writer.WriteLine
  else
    Writer.WriteLine(';');
// (constraints)
// 1. virtual member function은 static일 수 없다.
// 2. pure virtual member function은 virtual member function에만 적용된다.
// 3. virtual member function은 inline function일 수 없다.
// 4. __sealed 는 비순수 virtual 함수에만 적용될 수 있다.
end;

procedure PCodeGenerator.WriteDeclAssociationEnd(Writer: PStringWriter; AAssociationEnd: IUMLAssociationEnd);
var
  OtherSide: IUMLAssociationEnd;
begin
  if FGenerateComment then
    WriteComments(Writer, AAssociationEnd.Documentation);
  OtherSide := AAssociationEnd.GetOtherSide;
  if OtherSide.IsNavigable and (OtherSide.Name <> '') then begin
    if FMSSpecific and GetBooleanTaggedValue(OtherSide, PROFILE_CPP, TAGSET_VCPP_EVENT, TAG_CPP___EVENT) then
      Writer.Write('__event ');
    if OtherSide.Changeability = ckFrozen then
      Writer.Write('const ');
    if GetBooleanTaggedValue(OtherSide, PROFILE_CPP, TAGSET_CPP_MEMBER_DATA, TAG_CPP_MUTABLE) then
      Writer.Write('mutable ');
    if GetBooleanTaggedValue(OtherSide, PROFILE_CPP, TAGSET_CPP_MEMBER_DATA, TAG_CPP_VOLATILE) then
      Writer.Write('volatile ');
    Writer.Write(OtherSide.Participant.Name);
    AddInclude(AAssociationEnd.Participant, OtherSide.Participant);
    if AAssociationEnd.Aggregation <> akComposite then
      Writer.Write(' *%s', [OtherSide.Name])
    else
      Writer.Write(' %s', [OtherSide.Name]);
    Writer.WriteLine(';');
  end;
end;

procedure PCodeGenerator.WriteDeclMemberOnVisibility(Writer: PStringWriter; AClassifier: IUMLClassifier; Visibility: UMLVisibilityKind);
var
  Attr: IUMLAttribute;
  Oper: IUMLOperation;
  Assoc, OtherSide: IUMLAssociationEnd;
  Elem: IUMLModelElement;
  Cls: IUMLClass;
  AbstOpers: TInterfaceList;
  I: Integer;
begin
  for I := 0 to AClassifier.GetOwnedElementCount - 1 do begin
    Elem := AClassifier.GetOwnedElementAt(I);
    if Elem.Visibility = Visibility then
      WriteDeclModelElement(Writer, Elem);
  end;
  for I := 0 to AClassifier.GetAttributeCount - 1 do begin
    Attr := AClassifier.GetAttributeAt(I);
    if Attr.Visibility = Visibility then
      WriteDeclAttribute(Writer, Attr);
  end;
  for I := 0 to AClassifier.GetOperationCount - 1 do begin
    Oper := AClassifier.GetOperationAt(I);
    if Oper.Visibility = Visibility then
      WriteDeclOperation(Writer, Oper);
  end;
  for I := 0 to AClassifier.GetAssociationCount - 1 do begin
    Assoc := AClassifier.GetAssociationAt(I);
    OtherSide := Assoc.GetOtherSide;
    if OtherSide.IsNavigable and (OtherSide.Name <> '') and (OtherSide.Visibility = Visibility) then
      WriteDeclAssociationEnd(Writer, Assoc);
  end;
  if AClassifier.QueryInterface(IUMLClass, Cls) = S_OK then begin
    AbstOpers := TInterfaceList.Create;
    try
      CollectNotImplementedOperations(Cls, AbstOpers);
      for I := 0 to AbstOpers.Count - 1 do begin
        Assert(AbstOpers.Items[I].QueryInterface(IUMLOperation, Oper) = S_OK);
        if Oper.Owner.IsKindOf(ELEM_INTERFACE) then begin
          if Visibility = vkPublic then
            WriteDeclOperation(Writer, Oper, True);
        end
        else if Oper.Visibility = Visibility then
          WriteDeclOperation(Writer, Oper, True);
      end;
    finally
      AbstOpers.Free;
    end;
  end;
end;

procedure PCodeGenerator.WriteDeclPublicMember(Writer: PStringWriter; AClassifier: IUMLClassifier);
begin
  if ExistsPublicMember(AClassifier) then begin
    Writer.WriteLine('public:');
    Writer.Indent;
    WriteDeclMemberOnVisibility(Writer, AClassifier, vkPublic);
    Writer.Outdent;
  end;
end;

procedure PCodeGenerator.WriteDeclProtectedMember(Writer: PStringWriter; AClassifier: IUMLClassifier);
begin
  if ExistsProtectedMember(AClassifier) then begin
    Writer.WriteLine('protected:');
    Writer.Indent;
    WriteDeclMemberOnVisibility(Writer, AClassifier, vkProtected);
    Writer.Outdent;
  end;
end;

procedure PCodeGenerator.WriteDeclPrivateMember(Writer: PStringWriter; AClassifier: IUMLClassifier);
begin
  if ExistsPrivateMember(AClassifier) then begin
    Writer.WriteLine('private:');
    Writer.Indent;
    WriteDeclMemberOnVisibility(Writer, AClassifier, vkPrivate);
    Writer.Outdent;
  end;
end;

procedure PCodeGenerator.WriteDeclMemberUnordered(Writer: PStringWriter; AClassifier: IUMLClassifier);
var
  Attr: IUMLAttribute;
  Oper: IUMLOperation;
  Assoc, OtherSide: IUMLAssociationEnd;
  Elem: IUMLModelElement;
  Cls: IUMLClass;
  AbstOpers: TInterfaceList;
  CurVis: string;
  I: Integer;
begin
  CurVis := '';
  for I := 0 to AClassifier.GetOwnedElementCount - 1 do begin
    Elem := AClassifier.GetOwnedElementAt(I);
    if CurVis <> VisibilityToString(Elem.Visibility) then begin
      CurVis := VisibilityToString(Elem.Visibility);
      Writer.WriteLine('%s:', [CurVis]);
    end;
    Writer.Indent;
    WriteDeclModelElement(Writer, Elem);
    Writer.Outdent;
  end;
  for I := 0 to AClassifier.GetOperationCount - 1 do begin
    Oper := AClassifier.GetOperationAt(I);
    if CurVis <> VisibilityToString(Oper.Visibility) then begin
      CurVis := VisibilityToString(Oper.Visibility);
      Writer.WriteLine('%s:', [CurVis]);
    end;
    Writer.Indent;
    WriteDeclOperation(Writer, Oper);
    Writer.Outdent;
  end;
  for I := 0 to AClassifier.GetAssociationCount - 1 do begin
    Assoc := AClassifier.GetAssociationAt(I);
    OtherSide := Assoc.GetOtherSide;
    if OtherSide.IsNavigable and (OtherSide.Name <> '') then begin
      if CurVis <> VisibilityToString(OtherSide.Visibility) then begin
        CurVis := VisibilityToString(OtherSide.Visibility);
        Writer.WriteLine('%s:', [CurVis]);
      end;
      Writer.Indent;
      WriteDeclAssociationEnd(Writer, Assoc);
      Writer.Outdent;
    end;
  end;
  for I := 0 to AClassifier.GetAttributeCount - 1 do begin
    Attr := AClassifier.GetAttributeAt(I);
    if CurVis <> VisibilityToString(Attr.Visibility) then begin
      CurVis := VisibilityToString(Attr.Visibility);
      Writer.WriteLine('%s:', [CurVis]);
    end;
    Writer.Indent;
    WriteDeclAttribute(Writer, Attr);
    Writer.Outdent;
  end;

  if AClassifier.QueryInterface(IUMLClass, Cls) = S_OK then begin
    AbstOpers := TInterfaceList.Create;
    try
      CollectNotImplementedOperations(Cls, AbstOpers);
      for I := 0 to AbstOpers.Count - 1 do begin
        Assert(AbstOpers.Items[I].QueryInterface(IUMLOperation, Oper) = S_OK);
        if Oper.Owner.IsKindOf(ELEM_INTERFACE) then begin
          if CurVis <> 'public' then begin
            CurVis := 'public';
            Writer.WriteLine('public:', [CurVis]);
          end;
        end
        else begin
          if CurVis <> VisibilityToString(Oper.Visibility) then begin
            CurVis := VisibilityToString(Oper.Visibility);
            Writer.WriteLine('%s:', [CurVis]);
          end;
        end;
        Writer.Indent;
        WriteDeclOperation(Writer, Oper, True);
        Writer.Outdent;
      end;
    finally
      AbstOpers.Free;
    end;
  end;
end;

procedure PCodeGenerator.WriteDeclMember(Writer: PStringWriter; AClassifier: IUMLClassifier);
begin
  case FOrderMember of
    okPublicFirst:
      begin
        WriteDeclPublicMember(Writer, AClassifier);
        WriteDeclProtectedMember(Writer, AClassifier);
        WriteDeclPrivateMember(Writer, AClassifier);
      end;
    okPrivateFirst:
      begin
        WriteDeclPrivateMember(Writer, AClassifier);
        WriteDeclProtectedMember(Writer, AClassifier);
        WriteDeclPublicMember(Writer, AClassifier);
      end;
    okNotOrder:
      begin
        WriteDeclMemberUnordered(Writer, AClassifier);
      end;
  end;
end;

procedure PCodeGenerator.WriteDeclClass(Writer: PStringWriter; AClass: IUMLClass);
var
  TempParam: IUMLTemplateParameter;
  SL: TStringList;
  I: Integer;
begin
  if FGenerateComment then
    WriteComments(Writer, AClass.Documentation);
  if AClass.StereotypeName = STEREOTYPE_CPP_TYPEDEF then begin
    // process typedef
    // it need more consideration
    Exit;
  end
  else if FCppNetSpecific and (AClass.StereotypeName = STEREOTYPE_CPP_DELEGATE) then begin
    WriteDeclDelegate(Writer, AClass);
    Exit;
  end;

  SL := TStringList.Create;
  try
    if FPackageAsNamespace and AClass.Namespace.IsKindOf(ELEM_PACKAGE) then begin
      CollectNamespaceNames(GetRelativeCodePath(AClass), SL);
      WriteOwnerNamespacesOpen(Writer, SL);
    end;

    if AClass.GetTemplateParameterCount > 0 then begin
      Writer.Write('template <');
      for I := 0 to AClass.GetTemplateParameterCount - 1 do begin
        TempParam := AClass.GetTemplateParameterAt(I);
        if I >= 1 then Writer.Write(', ');
        Writer.Write(UMLTemplateParamTypeToCppType(TempParam.ParameterType));
        Writer.Write(' %s', [TempParam.Name]);
      end;
      Writer.Write('> ');
    end;

    if FCppNetSpecific then begin
      if AClass.IsAbstract then Writer.Write('__abstract ');
      if AClass.IsLeaf then Writer.Write('__sealed ');
      if GetBooleanTaggedValue(AClass, PROFILE_CPP, TAGSET_VCPP_GC, TAG_CPP___GC) then
        Writer.Write('__gc ')
      else if GetBooleanTaggedValue(AClass, PROFILE_CPP, TAGSET_VCPP_GC, TAG_CPP___NOGC) then
        Writer.Write('__nogc ')
      else if GetBooleanTaggedValue(AClass, PROFILE_CPP, TAGSET_VCPP_VALUE, TAG_CPP___VALUE) then
        Writer.Write('__value ');
    end;

    if FBraceAtNewLine then begin
      Writer.WriteLine('%s%s %s%s', ['', GetClassTypeKindStr(AClass), AClass.Name, GetInheritenceSpecStr(AClass)]);
      Writer.WriteLine('{');
    end
    else
      Writer.WriteLine('%s%s %s%s {', ['', GetClassTypeKindStr(AClass), AClass.Name, GetInheritenceSpecStr(AClass)]);
    WriteDeclMember(Writer, AClass);
    Writer.WriteLine('};');

    if FPackageAsNamespace and AClass.Namespace.IsKindOf(ELEM_PACKAGE) then
      WriteOwnerNamespacesClose(Writer, SL);
  finally
    SL.Free;
  end;
// (constraints)
// 1. __abstarct와 __sealed는 동시에 올 수 없다.
// 2. __gc, __nogc, __value는 동시에 올 수 없다.
end;

procedure PCodeGenerator.WriteDeclInterface(Writer: PStringWriter; AInterface: IUMLInterface);
var
  SL: TStringList;
  IntfWord: string;
begin
  if FGenerateComment then
    WriteComments(Writer, AInterface.Documentation);
  SL := TStringList.Create;
  try
    if FPackageAsNamespace and AInterface.Namespace.IsKindOf(ELEM_PACKAGE) then begin
      CollectNamespaceNames(GetRelativeCodePath(AInterface), SL);
      WriteOwnerNamespacesOpen(Writer, SL);
    end;

    if FCppNetSpecific then begin
      if GetBooleanTaggedValue(AInterface, PROFILE_CPP, TAGSET_VCPP_GC, TAG_CPP___GC) then
        Writer.Write('__gc ')
      else if GetBooleanTaggedValue(AInterface, PROFILE_CPP, TAGSET_VCPP_GC, TAG_CPP___NOGC) then
        Writer.Write('__nogc ');
    end;

    if FMsSpecific then
      IntfWord := '__interface'
    else
      IntfWord := 'class';

    if FBraceAtNewLine then begin
      Writer.WriteLine('%s%s %s%s', ['', IntfWord, AInterface.Name, GetInheritenceSpecStr(AInterface)]);
      Writer.WriteLine('{');
    end
    else
      Writer.WriteLine('%s%s %s%s {', ['', IntfWord, AInterface.Name, GetInheritenceSpecStr(AInterface)]);
    WriteDeclMember(Writer, AInterface);
    Writer.WriteLine('};');

    if FPackageAsNamespace and AInterface.Namespace.IsKindOf(ELEM_PACKAGE) then
      WriteOwnerNamespacesClose(Writer, SL);
  finally
    SL.Free;
  end;
end;

procedure PCodeGenerator.WriteDeclEnumeration(Writer: PStringWriter; AEnumeration: IUMLEnumeration);
var
  Lit: IUMLEnumerationLiteral;
  SL: TStringList;
  LitVal: string;
  I: Integer;
begin
  if FGenerateComment then
    WriteComments(Writer, AEnumeration.Documentation);
  SL := TStringList.Create;
  try
    if FPackageAsNamespace and AEnumeration.Namespace.IsKindOf(ELEM_PACKAGE) then begin
      CollectNamespaceNames(GetRelativeCodePath(AEnumeration), SL);
      WriteOwnerNamespacesOpen(Writer, SL);
    end;

    if FBraceAtNewLine then begin
      Writer.WriteLine('enum %s', [AEnumeration.Name]);
      Writer.WriteLine('{');
    end
    else
      Writer.WriteLine('enum %s {', [AEnumeration.Name]);
    Writer.Indent;
    for I := 0 to AEnumeration.GetLiteralCount - 1 do begin
      Lit := AEnumeration.GetLiteralAt(I);
      Writer.Write(Lit.Name);
      LitVal := GetStringTaggedValue(Lit, PROFILE_CPP, TAGSET_CPP_ENUM_LITERAL, TAG_CPP_ENUM_LITERAL_VALUE);
      if LitVal <> '' then
        Writer.Write(' = %s', [LitVal]);
      if I <> AEnumeration.GetLiteralCount - 1 then
        Writer.Write(',');
      Writer.WriteLine;
    end;
    Writer.Outdent;
    Writer.WriteLine('};');

    if FPackageAsNamespace and AEnumeration.Namespace.IsKindOf(ELEM_PACKAGE) then
      WriteOwnerNamespacesClose(Writer, SL);
  finally
    SL.Free;
  end;
end;

procedure PCodeGenerator.WriteDeclDelegate(Writer: PStringWriter; AClass: IUMLClass);
begin
  Assert(FCppNetSpecific);
  if AClass.GetOperationCount = 1 then begin
    Writer.Write('__delegate ');
    WriteDeclOperation(Writer, AClass.GetOperationAt(0));
  end
  else
    Log(Format(ERR_INVALID_DELEGATE, [AClass.Name]));
end;

procedure PCodeGenerator.WriteDeclModelElement(Writer: PStringWriter; AModelElem: IUMLModelElement);
var
  Cls: IUMLClass;
  Intf: IUMLInterface;
  Enum: IUMLEnumeration;
begin
  if AModelElem.QueryInterface(IUMLClass, Cls) = S_OK then
    WriteDeclClass(Writer, Cls)
  else if AModelElem.QueryInterface(IUMLInterface, Intf) = S_OK then
    WriteDeclInterface(Writer, Intf)
  else if AModelElem.QueryInterface(IUMLEnumeration, Enum) = S_OK then
    WriteDeclEnumeration(Writer, Enum);
end;

procedure PCodeGenerator.WriteDefOperation(Writer: PStringWriter; AOperation: IUMLOperation; ABase: IUMLClassifier = nil);
begin
  if (AOperation.StereotypeName = STEREOTYPE_CPP_DELEGATE)
    or (AOperation.StereotypeName = STEREOTYPE_CPP_MACRO) then
    Exit;

  if not HasNotReturnType(AOperation) then
    Writer.Write('%s ' , [GetOperationTypeStr(AOperation)]);
  Writer.Write(GetDefOperationName(AOperation, ABase));
  Writer.Write('(%s)', [GetOperationParametersStr(AOperation)]);
  if FBraceAtNewLine then begin
    if GetBooleanTaggedValue(AOperation, PROFILE_CPP, TAGSET_CPP_CONST, TAG_CPP_CONST) then
      Writer.WriteLine(' const')
    else
      Writer.WriteLine;
    Writer.WriteLine('{');
  end
  else begin
    if GetBooleanTaggedValue(AOperation, PROFILE_CPP, TAGSET_CPP_CONST, TAG_CPP_CONST) then
      Writer.WriteLine(' const {')
    else
      Writer.WriteLine(' {');
  end;
  Writer.WriteLine;
  Writer.WriteLine('}');
end;

procedure PCodeGenerator.WriteDefStaticDataMember(Writer: PStringWriter; AAttribute: IUMLAttribute);
begin
  Writer.Write( '%s %s', [AAttribute.TypeExpression, GetDefStaticDataMemberName(AAttribute)] );

  if AAttribute.InitialValue <> '' then
    Writer.Write(' = %s', [AAttribute.InitialValue]);

  Writer.Write(';');
  Writer.WriteLine;
end;

procedure PCodeGenerator.WriteDefMemberOnVisibility(Writer: PStringWriter; AClassifier: IUMLClassifier; Visibility: UMLVisibilityKind);
var
  Cls: IUMLClass;
  Attr: IUMLAttribute;
  Oper: IUMLOperation;
  Elem: IUMLModelElement;
  AbstOpers: TInterfaceList;
  I: Integer;
begin
  // Generate static data members
  for I := 0 to AClassifier.GetAttributeCount - 1 do begin
    Attr := AClassifier.GetAttributeAt(I);
    if (Attr.Visibility = Visibility) and (Attr.OwnerScope = skClassifier) then begin
      WriteDefStaticDataMember(Writer, Attr);
      Writer.WriteLine;
    end;
  end;

  // Generate operations
  for I := 0 to AClassifier.GetOperationCount - 1 do begin
    Oper := AClassifier.GetOperationAt(I);
    if (Oper.Visibility = Visibility) and (not Oper.IsAbstract) then begin
      WriteDefOperation(Writer, Oper);
      Writer.WriteLine;
    end;
  end;
  for I := 0 to AClassifier.GetOwnedElementCount - 1 do begin
    Elem := AClassifier.GetOwnedElementAt(I);
    if Elem.Visibility = Visibility then begin
      WriteDefModelElement(Writer, Elem);
      Writer.WriteLine;
    end;
  end;

  if AClassifier.QueryInterface(IUMLClass, Cls) = S_OK then begin
    AbstOpers := TInterfaceList.Create;
    try
      CollectNotImplementedOperations(Cls, AbstOpers);
      for I := 0 to AbstOpers.Count - 1 do begin
        Assert(AbstOpers.Items[I].QueryInterface(IUMLOperation, Oper) = S_OK);
        if Oper.Owner.IsKindOf(ELEM_INTERFACE) then begin
          if Visibility = vkPublic then begin
            WriteDefOperation(Writer, Oper, AClassifier);
            Writer.WriteLine;
          end;
        end
        else if Oper.Visibility = Visibility then begin
          WriteDefOperation(Writer, Oper, AClassifier);
          Writer.WriteLine;
        end;
      end;
    finally
      AbstOpers.Free;
    end;
  end;
end;

procedure PCodeGenerator.WriteDefMemberUnordered(Writer: PStringWriter; AClassifier: IUMLClassifier);
var
  Cls: IUMLClass;
  Attr: IUMLAttribute;
  AbstOpers: TInterfaceList;
  Oper: IUMLOperation;
  I: Integer;
begin
  // Generate static data members
  for I := 0 to AClassifier.GetAttributeCount - 1 do begin
    Attr := AClassifier.GetAttributeAt(I);
    if (Attr.OwnerScope = skClassifier) then begin
      WriteDefStaticDataMember(Writer, Attr);
      Writer.WriteLine;
    end;
  end;

  for I := 0 to AClassifier.GetOperationCount - 1 do begin
    WriteDefOperation(Writer, AClassifier.GetOperationAt(I));
    Writer.WriteLine;
  end;

  if AClassifier.QueryInterface(IUMLClass, Cls) = S_OK then begin
    AbstOpers := TInterfaceList.Create;
    try
      CollectNotImplementedOperations(Cls, AbstOpers);
      for I := 0 to AbstOpers.Count - 1 do begin
        Assert(AbstOpers.Items[I].QueryInterface(IUMLOperation, Oper) = S_OK);
        WriteDefOperation(Writer, Oper, AClassifier);
        Writer.WriteLine;
      end;
    finally
      AbstOpers.Free;
    end;
  end;
end;

procedure PCodeGenerator.WriteDefClass(Writer: PStringWriter; AClass: IUMLClass);
var
  SL: TStringList;
begin
  if (AClass.StereotypeName = STEREOTYPE_CPP_TYPEDEF) or (FCppNetSpecific
    and (AClass.StereotypeName = STEREOTYPE_CPP_DELEGATE)) then
    Exit;

  SL := TStringList.Create;
  try
    if FPackageAsNamespace then begin
      CollectNamespaceNames(GetRelativeCodePath(AClass), SL);
      WriteOwnerNamespacesOpen(Writer, SL);
    end;

    case FOrderMember of
      okPublicFirst:
        begin
          WriteDefMemberOnVisibility(Writer, AClass, vkPublic);
          WriteDefMemberOnVisibility(Writer, AClass, vkProtected);
          WriteDefMemberOnVisibility(Writer, AClass, vkPrivate);
        end;
      okPrivateFirst:
        begin
          WriteDefMemberOnVisibility(Writer, AClass, vkPrivate);
          WriteDefMemberOnVisibility(Writer, AClass, vkProtected);
          WriteDefMemberOnVisibility(Writer, AClass, vkPublic);
        end;
      okNotOrder:
        begin
          WriteDefMemberUnordered(Writer, AClass);
        end;
    end;

    if FPackageAsNamespace then
      WriteOwnerNamespacesClose(Writer, SL);
  finally
    SL.Free;
  end;
end;

procedure PCodeGenerator.WriteDefModelElement(Writer: PStringWriter; AModelElem: IUMLModelElement);
var
  Cls: IUMLClass;
begin
  if AModelElem.QueryInterface(IUMLClass, Cls) = S_OK then
    WriteDefClass(Writer, Cls);
end;

procedure PCodeGenerator.ImproperModel(Model: IUMLModelElement; Msg: string);
begin
// for Model Verification
end;

procedure PCodeGenerator.Log(Msg: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg);
end;

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
  Writer, SubWriter: PStringWriter;
  I: Integer;
begin
  if not Initialized then
    raise Exception.Create(ERR_CODE_GEN_NOT_INITIALIZED);

  Log(Format(MSG_CODE_GEN_BEGIN, [TargetElementCount]));
  for I := 0 to TargetElementCount - 1 do begin
    if Assigned(FOnGeneratingCode) then
      FOnGeneratingCode(Self, TargetElements[I], I + 1, TargetElementCount);
    try
      Writer := CreateStringWriter;
      SubWriter := CreateStringWriter;
      try
        ClearIncludes;
        WriteDeclModelElement(SubWriter, TargetElements[I]);
        WriteFileHeader(Writer, TargetElements[I], True);
        Writer.Append(SubWriter);
        WriteFileFooter(Writer, TargetElements[I], True);
        Writer.SaveToFile(GetHeaderFilePath(TargetElements[I]));
        if NeedBodyFile(TargetElements[I]) then begin
          Writer.Clear;
          SubWriter.Clear;
          ClearIncludes;
          WriteDefModelElement(SubWriter, TargetElements[I]);
          WriteFileHeader(Writer, TargetElements[I], False);
          Writer.Append(SubWriter);
          WriteFileFooter(Writer, TargetElements[I], False);
          Writer.SaveToFile(GetBodyFilePath(TargetElements[I]));
        end;
      finally
        Writer.Free;
        SubWriter.Free;
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

// PCodeGenerator
////////////////////////////////////////////////////////////////////////////////

end.
