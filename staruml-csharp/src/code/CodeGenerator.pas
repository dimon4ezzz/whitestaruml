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
  PCodeGenerateKind = (cgkReady, cgkGen, cgkFile, cgkClose, cgkEnd, cgkError);

  // Events
  PLogEvent = procedure(Sender: TObject; Msg: string) of object;
  PCodeGenerateEvent = procedure(Sender: TObject; Model: IUMLModelElement; Idx, Total: Integer; AState: PCodeGenerateKind) of object;

  // PAbstractOperation
  PAbstractOperation = ^RecAbstractOperation;
  RecAbstractOperation = record
    UMLClassifier: IUMLClassifier;
    UMLOperation: IUMLOperation;
  end;

  // PCodeGenerator
  PCodeGenerator = class
  private
		{ Private Member Fields }
    FStarUMLApp: IStarUMLApplication;
    FBaseDirectory: string;
    FBasePackageElement: IUMLPackage;
    FTargetElements: TInterfaceList;
    FWriter : PStringWriter;
    { Events }
    FOnGenerateCode : PCodeGenerateEvent;
    FOnLog: PLogEvent;
    { Options }
    FNoProfile: Boolean;
    FMemberByFile: Boolean;
    FNoNameAssoc: Boolean;
    FDocToDoc: Boolean;
    FNilDoc: Boolean;
    FTabToSpace: Boolean;
    FSpaceCnt: Integer;
    FBraceAtNewLine: Boolean;
    FCSharpFileExt: string;
    FHeaderComment: string;
    FIsCancel : Boolean;
    { Getter/Setter }
    function GetTargetElementCount: Integer;
    function GetTargetElement(Index: Integer): IUMLModelElement;
    { Private Methods }
    function Initialized: Boolean;
    { Auxiliary Functions }
    function VisibilityToString(AUMLModelElement: IUMLModelElement): string;
    function GetClassTypeKindStr(AClass: IUMLClass): string;
    function GetInheritenceSpecStr(AClassifier: IUMLClassifier): string;
    function GetAttributeTypeStr(AAttribute: IUMLAttribute): string;
    function GetParameterTypeStr(AParameter: IUMLParameter): string;
    function GetParameterStr(AParameter: IUMLParameter): string;
    function GetOperationTypeStr(AOperation: IUMLOperation): string;
    function GetOperationParametersStr(AOperation: IUMLOperation): string;
    function GetOutputFilePath(AClassifier: IUMLClassifier): string;
    function GetOutputUsingName(AClassifier: IUMLClassifier): string;
    { Declaration Writing Methods }
    procedure WriteDeclAttribute(AAttribute: IUMLAttribute);
    procedure WriteDeclOperation(AOperation: IUMLOperation; IsNotParentOpreation: Boolean = True);
    procedure WriteDeclAssociationEnd(AAssociationEnd: IUMLAssociationEnd);
    procedure WriteDeclMember(AClassifier: IUMLClassifier);
    procedure WriteDeclClass(AClass: IUMLClass; IsInnerClass: Boolean = False);
    procedure WriteDeclInterface(AInterface: IUMLInterface);
    procedure WriteDeclEnumeration(AEnumeration: IUMLEnumeration);
    procedure WriteDeclNamespace(AClassifier: IUMLClassifier);
    procedure WriteDeclIndexerProperty(AOperation: IUMLOperation);
    procedure WriteDeclEvent(AOperation: IUMLOperation);
    procedure WriteDeclMethod(AOperation: IUMLOperation; IsNotParentOpreation:Boolean = True);
    // and so on..
    procedure WriteFileHeader(AModelElem: IUMLModelElement);

    procedure CreateFolder(APackage: IUMLPackage);
    { Miscellaneous Methods }
    procedure ImproperModel(Model: IUMLModelElement; Msg: string);
    procedure Log(Msg: string);

    function NewToString(AUMLModelElement: IUMLModelElement): string;
    function UnsafeToString(AUMLModelElement: IUMLModelElement): string;
    function EnumBaseTypeToString(AUMLModelElement: IUMLModelElement): string;
    function AbstractToString(AUMLModelElement: IUMLModelElement): string;
    function SealedToString(AUMLModelElement: IUMLModelElement): string;
    function ReadonlyToString(AUMLModelElement: IUMLModelElement): string;
    function StaticToString(AUMLModelElement: IUMLElement): string;
    function VolatileToString(AUMLModelElement: IUMLModelElement): string;
    function AttributeInitValueToString(AAttribute: IUMLAttribute): string;
    function ExternToString(AOperation: IUMLOperation): string;
    function OverrideToString(AOperation: IUMLOperation): string;
    function VirtualToString(AOperation: IUMLOperation): string;
    function GetAssociationEndTypeStr(AAssociationEnd: IUMLAssociationEnd): string;
    function GetConstructorInitializer(AOperation: IUMLOperation): string;
    function GetExImplicit(AOpertaion: IUMLOperation): string;

    procedure SetBrace;
    procedure CloseBrace;
    procedure SetupWriter;
    procedure CloseWriter(AClassifier: IUMLClassifier);
    procedure WriteDeclNamespaceEndBrace(AClassifier: IUMLClassifier);
    procedure WriteDeclDelegate(AClass: IUMLClass);
    procedure WriterDeclAbstractMember(AClass: IUMLClass);
    procedure GetAbstractOperationByClass(AClassifier: IUMLClassifier; AOperationList :TList);
    procedure GetAbstractOperationByInterface(AClassifier: IUMLClassifier; AOperationList :TList);
    procedure WriteDeclOperationByInterface(AOperation: IUMLOperation);
    procedure WriteDeclOperationByAbstractClass(AOperation: IUMLOperation);
    function IsSameSignature(OperA, OperB: IUMLOperation): Boolean;
    function FindSameSignatureOperation(AOperation: IUMLOperation;
      AClass: IUMLClass): IUMLOperation;
    function GetBooleanTaggedValue(AExtModel: IExtensibleModel; Profile,
      TagDefSet, TagName: string): Boolean;
    function GetIntegerTaggedValue(AExtModel: IExtensibleModel; Profile,
      TagDefSet, TagName: string): Integer;
    function GetStringTaggedValue(AExtModel: IExtensibleModel; Profile,
      TagDefSet, TagName: string): string;
    procedure WriteCSharpDoc(AModel: IModel);
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
    property NoProfile: Boolean read FNoProfile write FNoProfile;
    property BraceAtNewLine: Boolean read FBraceAtNewLine write FBraceAtNewLine;
    property MemberByFile: Boolean read FMemberByFile write FMemberByFile;
    property NoNameAssoc: Boolean read FNoNameAssoc write FNoNameAssoc;
    property DocToDoc: Boolean read FDocToDoc write FDocToDoc;
    property NilDoc: Boolean read FNilDoc write FNilDoc;
    property TabToSpace: Boolean read FTabToSpace write FTabToSpace;
    property SpaceCnt: Integer read FSpaceCnt write FSpaceCnt;
    property HeaderComment: string read FHeaderComment write FHeaderComment;
    property CSharpFileExt: string read FCSharpFileExt write FCSharpFileExt;
    property Writer: PStringWriter read FWriter write FWriter;
    property IsCancel: Boolean read FIsCancel write FIsCancel;
    property OnGenerateCode: PCodeGenerateEvent read FOnGenerateCode write FOnGenerateCode;
    property OnLog: PLogEvent read FOnLog write FOnLog;
  end;

implementation

uses
  Symbols, Dialogs, NLS_CSharpAddIn;

////////////////////////////////////////////////////////////////////////////////
// PCodeGenerator

constructor PCodeGenerator.Create;
begin
  FTargetElements := TInterfaceList.Create;
  FBaseDirectory := '';
  FBasePackageElement := nil;
  FCSharpFileExt := CSHARP_FILE_EXT;
  FWriter := PStringWriter.Create;
end;

destructor PCodeGenerator.Destroy;
begin
  FTargetElements.Free;
  FTargetElements := nil;
  FWriter.Free;
  FWriter := nil;
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

function PCodeGenerator.GetConstructorInitializer(AOperation:IUMLOperation): string;
begin
  if Length(GetStringTaggedValue(AOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_CONSTRUCTOR_INITVALUE)) > 0 then
    Result := ':' + GetStringTaggedValue(AOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_CONSTRUCTOR_INITVALUE)
  else
    Result := '';
end;

function PCodeGenerator.GetExImplicit(AOpertaion: IUMLOperation):string;
begin
  if GetBooleanTaggedValue(AOpertaion, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_IMPLICIT) then
    Result := 'implicit'
  else if GetBooleanTaggedValue(AOpertaion, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_EXPLICIT) then
    Result := 'explicit'
  else
    Result := '';
end;

function PCodeGenerator.GetStringTaggedValue(AExtModel: IExtensibleModel; Profile: string; TagDefSet: string; TagName: string): string;
begin
  try
    Result := AExtModel.GetTaggedValueAsString(Profile, TagDefSet, TagName);
  except
    Result := '';
    if (StarUMLApp.ExtensionManager.FindIncludedProfile(Profile) <> nil) and Not NoProfile then begin
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
    if (StarUMLApp.ExtensionManager.FindIncludedProfile(Profile) <> nil) and Not NoProfile then begin
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
    if (StarUMLApp.ExtensionManager.FindIncludedProfile(Profile) <> nil) and Not NoProfile then begin
      if StarUMLApp.ExtensionManager.FindTagDefinition(Profile, TagDefSet, TagName) = nil then
        Log(Format(ERR_TAG_DEFINITION_NOT_DEFINED, [Profile, TagName]))
      else
        Log(Format(ERR_CANNOT_READ_TAG_VALUE, [Profile, TagName]));
    end;
  end;
end;

function PCodeGenerator.Initialized: Boolean;
begin
  Result := (FStarUMLApp <> nil) and (FBaseDirectory <> '') and (FBasePackageElement <> nil);
end;

function PCodeGenerator.VisibilityToString(AUMLModelElement: IUMLModelElement): string;
var
  S: string;
begin
  if AUMLModelElement.IsKindOf(ELEM_OPERATION) then
    if (AUMLModelElement as IUMLOperation).Owner.IsKindOf(ELEM_INTERFACE) then
    begin
      Result := '';
      exit;
    end;

  case AUMLModelElement.Visibility of
    vkPublic: S := 'public';
    vkProtected: S := 'protected';
    vkPrivate: S := 'private';
  end;

  if GetBooleanTaggedValue(AUMLModelElement, CSHARP_PROFILE_NAME, TAGSET_CSHARP_CLASS_MEMBER, TAG_CSHARP_INTERNAL) then
    if AUMLModelElement.Visibility = vkProtected then
      S := 'protected internal'
    else
      S := 'internal';

  Result := S;
end;

function PCodeGenerator.ExternToString(AOperation: IUMLOperation): string;
begin
  if GetBooleanTaggedValue(AOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_EXTERN) then
    Result := 'extern'
  else
    Result := '';
end;

function PCodeGenerator.VirtualToString(AOperation: IUMLOperation): string;
begin
  if GetBooleanTaggedValue(AOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_VIRTUAL) then
    Result := 'virtual'
  else
    Result := '';
end;

function PCodeGenerator.OverrideToString(AOperation: IUMLOperation): string;
begin
  if GetBooleanTaggedValue(AOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_OVERRIDE) then
    Result := 'override'
  else
    Result := '';
end;

function PCodeGenerator.AttributeInitValueToString(AAttribute: IUMLAttribute): string;
begin
  if Length(AAttribute.InitialValue) > 0 then
   Result := ' = ' + AAttribute.InitialValue
  else
    Result := '';
end;

function PCodeGenerator.StaticToString(AUMLModelElement: IUMLElement): string;
begin
  if AUMLModelElement.IsKindOf(ELEM_FEATURE) then
    if (AUMLModelElement as IUMLFeature).OwnerScope = skClassifier then
      Result := 'static'
    else
      Result := ''
  else if AUMLModelElement.IsKindOf(ELEM_ASSOCIATIONEND) then
    if GetBooleanTaggedValue(AUMLModelElement, CSHARP_PROFILE_NAME, TAGSET_CSHARP_EXTEND, TAG_CSHARP_STATIC) then
      Result := 'static'
    else
      Result := '';
end;

function PCodeGenerator.ReadonlyToString(AUMLModelElement: IUMLModelElement): string;
begin

  if AUMLModelElement.IsKindOf(ELEM_ATTRIBUTE) then
    if (AUMLModelElement as IUMLAttribute).Changeability = ckFrozen then
      Result := 'readonly'
    else
      Result := ''
  else if AUMLModelElement.IsKindOf(ELEM_ASSOCIATIONEND) then
    if (AUMLModelElement as IUMLAssociationEnd).Changeability = ckFrozen then
      Result := 'readonly'
    else
      Result := '';
end;

function PCodeGenerator.VolatileToString(AUMLModelElement:IUMLModelElement): string;
begin
 if GetBooleanTaggedValue(AUMLModelElement, CSHARP_PROFILE_NAME, TAGSET_CSHARP_FIELD, TAG_CSHARP_VOLATILE) then
    Result := 'volatile'
  else
    Result := '';
end;

function PCodeGenerator.EnumBaseTypeToString(AUMLModelElement: IUMLModelElement): string;
begin
  Result := GetStringTaggedValue(AUMLModelElement, CSHARP_PROFILE_NAME, TAGSET_CSHARP_ENUM, TAG_CSHARP_ENUM_BASETYPE);
end;

function PCodeGenerator.AbstractToString(AUMLModelElement: IUMLModelElement): string;
begin
if AUMLModelElement.isKindOf(ELEM_CLASS) then
    if (AUMLModelElement as IUMLClass).IsAbstract then
      Result := 'abstract'
    else
      Result := ''
  else if AUMLModelElement.isKindOf(ELEM_OPERATION) then
   if (AUMLModelElement as IUMLOperation).IsAbstract then
      Result := 'abstract'
    else
      Result := ''
end;

function PCodeGenerator.SealedToString(AUMLModelElement:IUMLModelElement): string;
begin
  if AUMLModelElement.isKindOf(ELEM_CLASS) then
    if (AUMLModelElement as IUMLClass).IsLeaf then
      Result := 'sealed'
    else
      Result := ''
  else if AUMLModelElement.isKindOf(ELEM_OPERATION) then
   if (AUMLModelElement as IUMLOperation).IsLeaf then
      Result := 'sealed'
    else
      Result := ''
end;


function PCodeGenerator.NewToString(AUMLModelElement: IUMLModelElement): string;
var
  XStr: string;
begin
  XStr := AUMLModelElement.Pathname;
  if GetBooleanTaggedValue(AUMLModelElement, CSHARP_PROFILE_NAME, TAGSET_CSHARP_EXTEND, TAG_CSHARP_NEW) then
    Result := 'new'
  else
    Result := '';
end;

function PCodeGenerator.UnsafeToString(AUMLModelElement: IUMLModelElement): string;
begin

  if GetBooleanTaggedValue(AUMLModelElement, CSHARP_PROFILE_NAME, TAGSET_CSHARP_EXTEND, TAG_CSHARP_UNSAFE) then
    Result := 'unsafe'
  else
    Result := '';

  Result := '';
end;

function PCodeGenerator.GetClassTypeKindStr(AClass: IUMLClass): string;
begin
  if AClass.StereotypeName = STEREOTYPE_CSHARP_STRUCT then
    Result := 'struct'
  else
    Result := 'class';
end;

function PCodeGenerator.GetInheritenceSpecStr(AClassifier: IUMLClassifier): string;
var
  XUMLGen: IUMLGeneralization;
  XUMLDep: IUMLDependency;
  S: string;
  I: Integer;
begin

  S := '';
  for I := 0 to AClassifier.GetGeneralizationCount - 1 do begin
    XUMLGen := AClassifier.GetGeneralizationAt(I);
    if S <> '' then
      S := S + ', ' + XUMLGen.Parent.Name
    else
      S := ': ' + XUMLGen.Parent.Name;
  end;

  for I := 0 to AClassifier.GetClientDependencyCount - 1 do begin
    XUMLDep := AClassifier.GetClientDependencyAt(I);
    if XUMLDep.IsKindOf(ELEM_REALIZATION) then begin
      if S <> '' then
        S := S + ', ' + XUMLDep.Supplier.Name
      else
        S := ': ' + XUMLDep.Supplier.Name;
    end;
  end;

  Result := S;
end;
function PCodeGenerator.GetAssociationEndTypeStr(AAssociationEnd: IUMLAssociationEnd): string;
var
  S: string;
  Count: Integer;
  I: Integer;
begin
  S := AAssociationEnd.Participant.Name;
  Count := GetIntegerTaggedValue(AAssociationEnd, CSHARP_PROFILE_NAME, TAGSET_CSHARP_DIMENSION, TAG_CSHARP_DIMENSION);

  if Count > 0 then;
    for I := 0 to Count -1 do
      S := S + '[]';

  Result := S;
end;

function PCodeGenerator.GetAttributeTypeStr(AAttribute: IUMLAttribute): string;
var
  S: string;
  Count: Integer;
  I: Integer;
begin
  if AAttribute.Type_ <> nil then
    S := AAttribute.Type_.Name
  else if AAttribute.TypeExpression = '' then
    S := 'object'
  else
    S := AAttribute.TypeExpression;

  Count := GetIntegerTaggedValue(AAttribute, CSHARP_PROFILE_NAME, TAGSET_CSHARP_DIMENSION, TAG_CSHARP_DIMENSION);
  if Count > 0 then;
    for I:=0 to Count -1 do
      S := S + '[]';

  Result := S;
end;

function PCodeGenerator.GetParameterTypeStr(AParameter: IUMLParameter): string;
var
  S: string;
  I: Integer;
  Count: Integer;
begin
  if AParameter.DirectionKind = pdkInout then
    S := 'ref '
  else if AParameter.DirectionKind = pdkOut then
    S := 'out '
  else if GetBooleanTaggedValue(AParameter, CSHARP_PROFILE_NAME, TAGSET_CSHARP_PARAMETER , TAG_CSHARP_PARAMS) then
    S := 'params ';

  if AParameter.Type_ <> nil then
    S := S + AParameter.Type_.Name
  else if AParameter.TypeExpression = '' then
    raise Exception.Create(AParameter.Pathname)
  else
    S := S + AParameter.TypeExpression;

  Count := GetIntegerTaggedValue(AParameter, CSHARP_PROFILE_NAME, TAGSET_CSHARP_DIMENSION, TAG_CSHARP_DIMENSION);
  if Count > 0 then;
    for I:=0 to Count -1 do
      S := S + '[]';

  Result := S;
end;

function PCodeGenerator.GetParameterStr(AParameter: IUMLParameter): string;
var
  S: string;
begin
  S := '';
  S := GetParameterTypeStr(AParameter) + ' ';
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
      Result := GetParameterTypeStr(Param);
      Exit;
    end;
  end;

  if GetExImplicit(AOperation) <> '' then
    Result := '';

end;

function PCodeGenerator.GetOperationParametersStr(AOperation: IUMLOperation): string;
var
  Param: IUMLParameter;
  Added: Boolean;
  S: string;
  I: Integer;
begin
  S := '';
  Added := False;
  for I := 0 to AOperation.GetParameterCount - 1 do begin
    Param := AOperation.GetParameterAt(I);
    if Param.DirectionKind <> pdkReturn then begin
      if Added then S := S + ', ';
      S := S + GetParameterStr(Param);
      Added := True;
    end;
  end;
  Result := S;
end;

function PCodeGenerator.GetOutputFilePath(AClassifier: IUMLClassifier): string;
var
  S: string;
begin
  S := copy(AClassifier.Pathname,Pos(FBasePackageElement.Pathname, AClassifier.Pathname) + Length(FBasePackageElement.Pathname), Length(AClassifier.Pathname) - Length(FBasePackageElement.Pathname));
  S := StringReplace(S, '::', '\', [rfReplaceAll]);
  S := FBaseDirectory  + S;
  S := S + FCSharpFileExt;
  Result := S;
  // (more) Namespace를 디렉토리로 생성 등 고려
end;

function PCodeGenerator.GetOutputUsingName(AClassifier: IUMLClassifier): string;
var
  S: string;
begin
  S := copy(AClassifier.Pathname,Pos(FBasePackageElement.Pathname, AClassifier.Pathname) + Length(FBasePackageElement.Pathname), Length(AClassifier.Pathname) - Length(FBasePackageElement.Pathname));
  S := StringReplace(S, '::', '.', [rfReplaceAll]);
  if Pos('.',S) = 1 then
    S:= Copy(S,2,Length(S)-1);
  Result := S;
end;

procedure PCodeGenerator.SetBrace;
begin

  if FBraceAtNewLine then
  begin
    FWriter.WriteLine;
    FWriter.Write('{');
  end
  else
    FWriter.Write('{');

  FWriter.WriteLine;
  FWriter.Indent;
end;

procedure PCodeGenerator.CloseBrace;
begin
  FWriter.Outdent;
  FWriter.WriteLine('}');
end;


procedure PCodeGenerator.WriteDeclAttribute(AAttribute: IUMLAttribute);
begin
  WriteCSharpDoc(AAttribute);

  if GetBooleanTaggedValue(AAttribute, CSHARP_PROFILE_NAME, TAGSET_CSHARP_FIELD, TAG_CSHARP_CONST) then
    FWriter.WriteLine('%s %s %s %s %s %s;', [NewToString(AAttribute), VisibilityToString(AAttribute), 'const', GetAttributeTypeStr(AAttribute), AAttribute.Name, AttributeInitValueToString(AAttribute)])
  else
    FWriter.WriteLine('%s %s %s %s %s %s %s %s %s;', [NewToString(AAttribute), VisibilityToString(AAttribute), UnsafeToString(AAttribute), StaticToString(AAttribute), ReadonlyToString(AAttribute), VolatileToString(AAttribute), GetAttributeTypeStr(AAttribute), AAttribute.Name, AttributeInitValueToString(AAttribute)]);
end;

procedure PCodeGenerator.WriteDeclIndexerProperty(AOperation: IUMLOperation);
var
  isNotInterface: Boolean;
begin
  isNotInterface := Not AOperation.Owner.IsKindOf(ELEM_INTERFACE);

  WriteDeclMethod(AOperation);
  if AOperation.StereotypeName = STEREOTYPE_CSHARP_INDEXER then
    FWriter.Write('[%s]', [GetOperationParametersStr(AOperation)]);

  if GetBooleanTaggedValue(AOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_GET) or GetBooleanTaggedValue(AOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_SET) then
  begin
    SetBrace;

    if GetBooleanTaggedValue(AOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_GET) then
    begin
      FWriter.Write('get');
      if isNotInterface then
      begin
        SetBrace;
        CloseBrace;
      end
      else
        FWriter.WriteLine(';');
    end;

    if GetBooleanTaggedValue(AOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_SET) then
    begin
      FWriter.Write('set');
      if isNotInterface then
      begin
        SetBrace;
        CloseBrace;
      end
      else
        FWriter.WriteLine(';');
    end;
    CloseBrace;
  end
  else
    if isNotInterface then
    begin
      SetBrace;
      CloseBrace;
    end
    else
      FWriter.WriteLine(';');
end;

procedure PCodeGenerator.WriteDeclEvent(AOperation: IUMLOperation);
var
  isNotInterface: Boolean;
begin
  isNotInterface := Not AOperation.Owner.IsKindOf(ELEM_INTERFACE);
  WriteDeclMethod(AOperation);

  if GetBooleanTaggedValue(AOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_ADD) or GetBooleanTaggedValue(AOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_REMOVE) then
  begin
    SetBrace;
    if GetBooleanTaggedValue(AOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_GET) then
    begin
      FWriter.Write('add');
      if isNotInterface then
      begin
        SetBrace;
        CloseBrace;
      end
      else
        FWriter.WriteLine(';');
    end;

  if GetBooleanTaggedValue(AOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_SET) then
    begin
      FWriter.Write('remove');
      if isNotInterface then
      begin
        SetBrace;
        CloseBrace;
      end
      else
        FWriter.WriteLine(';');
    end;
    CloseBrace;
  end
  else
    if isNotInterface then
    begin
      SetBrace;
      CloseBrace;
    end
    else
      FWriter.WriteLine(';');

end;

procedure PCodeGenerator.WriteDeclMethod(AOperation: IUMLOperation; IsNotParentOpreation: Boolean = True);
begin
  if IsNotParentOpreation then
  begin
    FWriter.Write('%s %s %s %s %s %s %s %s %s %s ',[NewToString(AOperation), VisibilityToString(AOperation), StaticToString(AOperation), VirtualToString(AOperation), SealedToString(AOperation), OverrideToString(AOperation), AbstractToString(AOperation), ExternToString(AOperation), UnsafeToString(AOperation), GetOperationTypeStr(AOperation)]);
    FWriter.Write(AOperation.Name);
  end
  else if AOperation.IsAbstract then
  begin // Abstract Class
    FWriter.Write('%s %s %s %s %s %s %s %s %s %s ',[NewToString(AOperation), VisibilityToString(AOperation), StaticToString(AOperation), VirtualToString(AOperation), SealedToString(AOperation), OverrideToString(AOperation), 'override', ExternToString(AOperation), UnsafeToString(AOperation), GetOperationTypeStr(AOperation)]);
    FWriter.Write(AOperation.Name);
  end
  else
  begin // Interface
    FWriter.Write('%s %s %s %s %s %s %s %s %s %s ',[NewToString(AOperation), VisibilityToString(AOperation), StaticToString(AOperation), VirtualToString(AOperation), SealedToString(AOperation), OverrideToString(AOperation), AbstractToString(AOperation), ExternToString(AOperation), UnsafeToString(AOperation), GetOperationTypeStr(AOperation)]);
    FWriter.Write(AOperation.Owner.Name + '.' + AOperation.Name);
  end;


end;

procedure PCodeGenerator.WriteDeclOperation(AOperation: IUMLOperation; IsNotParentOpreation: Boolean = True);
var
  isNotInterface: Boolean;
begin
  WriteCSharpDoc(AOperation);
  isNotInterface := (Not (AOperation.Owner.IsKindOf(ELEM_INTERFACE) or AOperation.IsAbstract )) and IsNotParentOpreation;

  if AOperation.StereotypeName = STEREOTYPE_CSHARP_INDEXER then
    WriteDeclIndexerProperty(AOperation)
  else if AOperation.StereotypeName = STEREOTYPE_CSHARP_OPERATOR then
  begin
    FWriter.Write('%s %s %s %s %s %s %s ',['public', StaticToString(AOperation), ExternToString(AOperation), UnsafeToString(AOperation), GetExImplicit(AOperation), GetOperationTypeStr(AOperation), 'operator']);
    FWriter.Write(AOperation.Name);
    FWriter.Write('(%s)', [GetOperationParametersStr(AOperation)]);
    if isNotInterface then
    begin
      SetBrace;
      CloseBrace;
    end
    else
      FWriter.WriteLine(';');
  end
  else if AOperation.StereotypeName = STEREOTYPE_CSHARP_PROPERTY then
    WriteDeclIndexerProperty(AOperation)
  else if AOperation.StereotypeName = STEREOTYPE_CSHARP_EVENT then
    WriteDeclEvent(AOperation)
  else if AOperation.StereotypeName = STEREOTYPE_UMLSTD_CREATE then
  begin
    FWriter.Write('%s %s %s %s %s ',[VisibilityToString(AOperation), StaticToString(AOperation), AbstractToString(AOperation), ExternToString(AOperation), UnsafeToString(AOperation)]);
    FWriter.Write(AOperation.Name);
    FWriter.Write('(%s)', [GetOperationParametersStr(AOperation)]);
    FWriter.Write(GetConstructorInitializer(AOperation));
    if isNotInterface then
    begin
      SetBrace;
      CloseBrace;
    end
    else
      FWriter.WriteLine(';');
  end
  else if AOperation.StereotypeName = STEREOTYPE_UMLSTD_DESTROY then
  begin
    FWriter.Write('%s %s ',[ExternToString(AOperation), UnsafeToString(AOperation)]);
    FWriter.Write('~' + AOperation.Name);
    FWriter.Write('()');
    if isNotInterface then
    begin
      SetBrace;
      CloseBrace;
    end
    else
      FWriter.WriteLine(';');
  end
  else // method
  begin
    WriteDeclMethod(AOperation,IsNotParentOpreation);
    FWriter.Write('(%s)', [GetOperationParametersStr(AOperation)]);
    if isNotInterface or Not IsNotParentOpreation then
    begin
      SetBrace;
      CloseBrace;
    end
    else
      FWriter.WriteLine(';');
  end;
end;


procedure PCodeGenerator.WriteDeclOperationByInterface(AOperation: IUMLOperation);
begin
  WriteDeclOperation(AOperation,False);
end;

procedure PCodeGenerator.WriteDeclOperationByAbstractClass(AOperation: IUMLOperation);
begin
  WriteDeclOperation(AOperation,False);
end;

procedure PCodeGenerator.WriteDeclAssociationEnd(AAssociationEnd: IUMLAssociationEnd);
var
  XUMLAssociationEndName: string;
begin
  WriteCSharpDoc(AAssociationEnd);

  XUMLAssociationEndName := AAssociationEnd.Name;
  if Length(XUMLAssociationEndName) = 0 then
  begin
    XUMLAssociationEndName := 'UnspecifiedType' + IntToStr(AAssociationEnd.GetOtherSide.Participant.IndexOfAssociation(AAssociationEnd.GetOtherSide) + 1);
  end;

  if GetBooleanTaggedValue(AAssociationEnd, CSHARP_PROFILE_NAME, TAGSET_CSHARP_FIELD, TAG_CSHARP_CONST) then
    FWriter.WriteLine('%s %s %s %s %s;', [NewToString(AAssociationEnd), VisibilityToString(AAssociationEnd), 'const', GetAssociationEndTypeStr(AAssociationEnd), XUMLAssociationEndName])
  else
    FWriter.WriteLine('%s %s %s %s %s %s %s %s;', [NewToString(AAssociationEnd), VisibilityToString(AAssociationEnd), UnsafeToString(AAssociationEnd), StaticToString(AAssociationEnd), ReadonlyToString(AAssociationEnd), VolatileToString(AAssociationEnd), GetAssociationEndTypeStr(AAssociationEnd), XUMLAssociationEndName]);
end;


procedure PCodeGenerator.WriteDeclMember(AClassifier: IUMLClassifier);
var
  XUMLAttribute: IUMLAttribute;
  XUMLAssociationEnd: IUMLAssociationEnd;
  XUMLOperation: IUMLOperation;
  XUMLClass: IUMLClass;
  I: Integer;
begin

  // Attribute
  for I := 0 to AClassifier.GetAttributeCount - 1 do
  begin
    XUMLAttribute := AClassifier.GetAttributeAt(I);
    WriteDeclAttribute(XUMLAttribute);
  end;

  for I := 0 to AClassifier.GetAssociationCount - 1 do
  begin
    XUMLAssociationEnd := AClassifier.GetAssociationAt(I).GetOtherSide;
// 이름 없는 Assocation 생성 로직 부여할것
    if XUMLAssociationEnd.IsNavigable and ((XUMLAssociationEnd.Name <> '') or (FNoNameAssoc)) then
      WriteDeclAssociationEnd(XUMLAssociationEnd);
  end;

  // Operation
  for I := 0 to AClassifier.GetOperationCount - 1 do
  begin
    XUMLOperation := AClassifier.GetOperationAt(I);
    WriteDeclOperation( XUMLOperation);
  end;

  // Innerclass...
  for I := 0 to AClassifier.GetOwnedElementCount -1 do
  begin
    if AClassifier.IsKindOf(ELEM_CLASS) and AClassifier.GetOwnedElementAt(I).IsKindOf(ELEM_CLASS) and (AClassifier.StereotypeName <> STEREOTYPE_CSHARP_STRUCT) then
    begin
      XUMLClass := AClassifier.GetOwnedElementAt(I) as IUMLClass;
      WriteDeclClass(XUMLClass, True);
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

function PCodeGenerator.FindSameSignatureOperation(AOperation: IUMLOperation; AClass: IUMLClass): IUMLOperation;
var
  Oper: IUMLOperation;
  I: Integer;
begin
  Result := nil;

  for I := 0 to AClass.GetOperationCount - 1 do begin
    Assert( AClass.GetOperationAt(I).QueryInterface(IUMLOperation, Oper) = S_OK);
    if IsSameSignature(AOperation, Oper) then begin
      Result := Oper;
      Exit;
    end;
  end;
end;

procedure PCodeGenerator.WriterDeclAbstractMember(AClass: IUMLClass);
var
  OperationList: TList;
  XOperationRec: PAbstractOperation;
  XUMLClassifier: IUMLClassifier;
  XUMLOperation: IUMLOperation;
  I: Integer;
begin
  OperationList := TList.Create;

  if AClass.IsAbstract then
  begin
    GetAbstractOperationByInterface(AClass, OperationList);
  end
  else
  begin
    GetAbstractOperationByClass(AClass, OperationList);
    GetAbstractOperationByInterface(AClass, OperationList);
  end;

  for I := 0 to OperationList.Count -1 do
  begin
    XOperationRec := OperationList.Items[I];
    XUMLClassifier := XOperationRec^.UMLClassifier;
    XUMLOperation := XOperationRec^.UMLOperation;
    if FindSameSignatureOperation(XUMLOperation,AClass) = nil then
    begin
      if XUMLClassifier.IsKindOf(ELEM_INTERFACE) then
      begin
        WriteDeclOperationByInterface(XUMLOperation);
      end
      else if XUMLClassifier.IsKindOf(ELEM_CLASS) then
      begin
        WriteDeclOperationByAbstractClass(XUMLOperation);
      end;
    end;
    Dispose(XOperationRec); // finally 로 고칠때 수정할것
  end;
end;

procedure PCodeGenerator.WriteFileHeader(AModelElem: IUMLModelElement);
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
  Pkg: IUMLPackage;
  S: string;
begin
  if IsCancel then exit;
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
  if AModelElem.QueryInterface(IUMLPackage, Pkg) = S_OK then
  begin
    S := StringReplace(S, STAMP_FILENAME, FBasePackageElement.Name + FCSharpFileExt, [rfReplaceAll]);
    S := StringReplace(S, STAMP_ELEMENT, AModelElem.Name, [rfReplaceAll]);
  end
  else if AModelElem.QueryInterface(IUMLClassifier, Clsf) = S_OK then
  begin
    S := StringReplace(S, STAMP_FILENAME, ExtractFileName(GetOutputFilePath(Clsf)), [rfReplaceAll]);
    S := StringReplace(S, STAMP_ELEMENT, AModelElem.Name, [rfReplaceAll]);
  end;

  if S <> '' then
  begin
    Writer.WriteLine(S);
    Writer.WriteLine;
  end;
end;

procedure PCodeGenerator.GetAbstractOperationByClass(AClassifier: IUMLClassifier; AOperationList: TList);
var
  I, J: Integer;
  XUMLClassifier: IUMLClassifier;
  XRec: PAbstractOperation;
  YRec: PAbstractOperation;
  IsNewClassifier: Boolean;
begin

  IsNewClassifier := true;

  for I := 0 to AClassifier.GetGeneralizationCount - 1 do
  begin
    if AClassifier.GetGeneralizationAt(I).Parent.IsKindOf(ELEM_CLASS) then
    begin
      XUMLClassifier := AClassifier.GetGeneralizationAt(I).Parent as IUMLClassifier;
      for J :=0 to AOperationList.Count -1 do
      begin
        YRec := AOperationList.Items[J];
        if YRec^.UMLClassifier.Pathname = XUMLClassifier.Pathname then
          IsNewClassifier := false;
      end;
      if IsNewClassifier then
      begin
        if XUMLClassifier.IsAbstract then
        begin
          for J := 0 to XUMLClassifier.GetOperationCount - 1 do
          begin
            if XUMLClassifier.GetOperationAt(J).IsAbstract then
            begin
              New(XRec);
              XRec^.UMLClassifier := XUMLClassifier;
              XRec^.UMLOperation := XUMLClassifier.GetOperationAt(J);
              AOperationList.Add(XRec);
            end;
          end; // For j
          GetAbstractOperationByClass(XUMLClassifier, AOperationList);
        end; // Is NewClassifier
      end;
    end;
  end; // For I
end;

procedure PCodeGenerator.GetAbstractOperationByInterface(AClassifier: IUMLClassifier; AOperationList: TList);
var
  XUMLInterface: IUMLInterface;
  XRec: PAbstractOperation;
  YRec: PAbstractOperation;
  IsNewClassifier: Boolean;
  XUMLDependency: IUMLDependency;
  XUMLModelElement: IUMLModelElement;
  I, J: Integer;
begin

  IsNewClassifier := true;
  // AClassifier = Interface
  if AClassifier.IsKindOf(ELEM_INTERFACE) then
    for I:= 0 to AClassifier.GetGeneralizationCount -1 do
    begin
      if AClassifier.GetGeneralizationAt(I).Parent.IsKindOf(ELEM_INTERFACE) then
      begin
        XUMLInterface := AClassifier.GetGeneralizationAt(I).Parent as IUMLInterface;
        for J :=0 to AOperationList.Count -1 do
        begin
          YRec := AOperationList.Items[J];
          if YRec^.UMLClassifier.Pathname = XUMLInterface.Pathname then
            IsNewClassifier := false;
        end;

        if IsNewClassifier then
        begin
          for J:= 0 to XUMLInterface.GetOperationCount -1 do
          begin
            New(XRec);
            XRec^.UMLClassifier := XUMLInterface as IUMLClassifier;
            XRec^.UMLOperation := XUMLInterface.GetOperationAt(J);
            AOperationList.Add(XRec);
          end; // For j
          GetAbstractOperationByInterface(XUMLInterface, AOperationList);
         end; // IsNewClassifier
      end;
    end; // For I

  // AClassifier = Class
  if AClassifier.IsKindOf(ELEM_CLASS) then
    for I := 0 to AClassifier.GetClientDependencyCount - 1 do
    begin
      XUMLDependency := AClassifier.GetClientDependencyAt(I);
      XUMLModelElement := XUMLDependency.Supplier;
      if XUMLDependency.IsKindOf(ELEM_REALIZATION) and XUMLModelElement.IsKindOf(ELEM_INTERFACE) then
      begin
        XUMLInterface := XUMLModelElement as IUMLInterface;
        for J :=0 to AOperationList.Count -1 do
        begin
          YRec := AOperationList.Items[J];
          if YRec^.UMLClassifier.Pathname = XUMLInterface.Pathname then
            IsNewClassifier := false;
        end;

        if IsNewClassifier then
        begin
          for J := 0 to XUMLInterface.GetOperationCount - 1 do
          begin
            New(XRec);
            XRec^.UMLClassifier := XUMLInterface as IUMLClassifier;
            XRec^.UMLOperation := XUMLInterface.GetOperationAt(J);
            AOperationList.Add(XRec);
          end; // for J
          GetAbstractOperationByInterface(XUMLInterface, AOperationList);
        end; // IsNewClassifier
      end; // if realization
    end; // for I
end;

procedure PCodeGenerator.WriteDeclNamespace(AClassifier: IUMLClassifier);
var
  ParentUMLPackage: IUMLPackage;
  XUMLModelElement: IUMLModelElement;
  UsingName: string;
  XName: string;
  S: string;
  I: Integer;
  IsWriteUsing: boolean;
begin
  UsingName := '';
  IsWriteUsing := False;

  S := copy(AClassifier.Pathname, Pos(FBasePackageElement.Pathname, AClassifier.Pathname) + Length(FBasePackageElement.Pathname) + 2, Length(AClassifier.Pathname) - Length(FBasePackageElement.Pathname) - Length(AClassifier.Name) - 4);
  S := StringReplace(S, '::', '.', [rfReplaceAll]);

  //Using Dec도 넣어줄것
  if AClassifier.Namespace.IsKindOf(ELEM_PACKAGE) then
  begin
    XName := AClassifier.Namespace.Name;
    XName := AClassifier.Name;
    ParentUMLPackage := AClassifier.Namespace as IUMLPackage;
    for I:= 0 to ParentUMLPackage.GetClientDependencyCount -1 do
    begin
      XUMLModelElement := ParentUMLPackage.GetClientDependencyAt(I).Supplier;
      if XUMLModelElement.IsKindOf(ELEM_CLASSIFIER) and (ParentUMLPackage.GetClientDependencyAt(I).StereotypeName = STEREOTYPE_UMLSTD_IMPORT) then
        UsingName := GetOutputUsingName(XUMLModelElement as IUMLClassifier);

      if (Pos('..', UsingName) > 0)
        or (Trim(UsingName) = '')
        or (Trim(UsingName) = '.')
        or (UsingName[Length(UsingName)] = #46)
        or ((Length(UsingName) > 0) and (UsingName[1] = '.'))
        then
        Log(Format(MSG_CODE_GEN_IMPORT_NONAME, [ParentUMLPackage.GetMetaClass.Name, XUMLModelElement.Pathname]))
      else if Length(Trim(UsingName)) > 0 then
      begin
        FWriter.WriteLine('using ' + UsingName + ';');
        IsWriteUsing := True;
      end;
      UsingName := '';
    end;
  end;

  for I:= 0 to AClassifier.GetClientDependencyCount -1 do
  begin
    XUMLModelElement := AClassifier.GetClientDependencyAt(I).Supplier;
    if XUMLModelElement.IsKindOf(ELEM_CLASSIFIER) and (AClassifier.GetClientDependencyAt(I).StereotypeName = STEREOTYPE_UMLSTD_IMPORT) then
      UsingName := GetOutputUsingName(XUMLModelElement as IUMLClassifier);

    if (Pos('..', UsingName) > 0)
      or (Trim(UsingName) = '')
      or (Trim(UsingName) = '.')
      or (UsingName[Length(UsingName)] = #46)
      or ((Length(UsingName) > 0) and (UsingName[1] = '.'))
      then
      Log(Format(MSG_CODE_GEN_IMPORT_NONAME, [ParentUMLPackage.GetMetaClass.Name, XUMLModelElement.Pathname]))
    else if Length(Trim(UsingName)) > 0 then
    begin
      FWriter.WriteLine('using ' + UsingName + ';');
      IsWriteUsing := True;
    end;
    UsingName := '';
  end;
  if IsWriteUsing then
    FWriter.WriteLine('');

  WriteCSharpDoc(AClassifier.Namespace);
  if Length(S) > 0 then
  begin
    S := 'namespace ' + S;
    FWriter.Write(S);
    SetBrace;
  end;
  WriteCSharpDoc(AClassifier);
end;
procedure PCodeGenerator.WriteDeclNamespaceEndBrace(AClassifier: IUMLClassifier);
var
  S: string;
begin

  S := copy(AClassifier.Pathname, Pos(FBasePackageElement.Pathname, AClassifier.Pathname) + Length(FBasePackageElement.Pathname) + 2,Length(AClassifier.Pathname) - Length(FBasePackageElement.Pathname) - Length(AClassifier.Name) - 4);
  S := StringReplace(S, '::', '.', [rfReplaceAll]);

  if Length(S) > 0 then
  begin
    CloseBrace;
  end;
end;

procedure PCodeGenerator.WriteDeclDelegate(AClass: IUMLClass);
var
  XUMLOperation: IUMLOperation;
begin
  SetupWriter;
  WriteDeclNamespace(AClass);
/////
  if AClass.GetOperationCount = 0 then
  begin
    raise Exception.Create(AClass.Name + '는 Opration 없는 Deleagete입니다.');
    Exit;
  end;

  XUMLOperation := AClass.GetOperationAt(0);
  FWriter.Write('%s %s %s %s ',[NewToString(XUMLOperation), VisibilityToString(XUMLOperation), 'delegate', GetOperationTypeStr(XUMLOperation)]);
  FWriter.Write(XUMLOperation.Name);
  FWriter.Write('(%s);', [GetOperationParametersStr(XUMLOperation)]);
  WriteDeclNamespaceEndBrace(AClass);
  CloseWriter(AClass);
end;

procedure PCodeGenerator.WriteDeclClass(AClass: IUMLClass; IsInnerClass: Boolean = False);
begin
  if IsCancel then exit;

  if Trim(AClass.Name) = '' then
  begin
    Log(Format(MSG_CODE_GEN_NONAME, [AClass.GetMetaClass.Name, AClass.Pathname]));
    Exit;
  end;

  if AClass.StereotypeName = STEREOTYPE_CSHARP_DELEGATE then
  begin
    WriteDeclDelegate(AClass);
    Exit;
  end;

  SetupWriter;
  if Not IsInnerClass then
    WriteDeclNamespace(AClass);

  FWriter.Write('%s %s %s %s %s %s %s %s', [NewToString(AClass), VisibilityToString(AClass), AbstractToString(AClass) , SealedToString(AClass),UnsafeToString(AClass), GetClassTypeKindStr(AClass), AClass.Name, GetInheritenceSpecStr(AClass)]);
  SetBrace;
  WriteDeclMember(AClass);
  WriterDeclAbstractMember(AClass);
  CloseBrace;

  if Not IsInnerClass then
  begin
    WriteDeclNamespaceEndBrace(AClass);
    CloseWriter(AClass);
  end;
end;

procedure PCodeGenerator.SetupWriter;
begin
  if FWriter = nil then
  begin
    FWriter := PStringWriter.Create;
    FWriter.TabToSpace := FTabToSpace;
    FWriter.SpaceCnt := FSpaceCnt;
  end;
end;

procedure PCodeGenerator.CloseWriter(AClassifier: IUMLClassifier);
begin
  if FMemberByFile then
  begin
    FWriter.SaveToFile(GetOutputFilePath(AClassifier));
    FWriter.Clear;
  end
  else
  begin
    FWriter.WriteLine;
  end;
end;

procedure PCodeGenerator.WriteCSharpDoc(AModel: IModel);
var
  CSharpDoc: TStringList;
  I: Integer;
begin
  CSharpDoc := TStringList.Create;
  try
    if DocToDoc then
    begin
      if (AModel.Documentation = '') then
      begin
        if NilDoc then
          FWriter.WriteLine(TXT_CODE_GEN_NIL_CSHARPDOC);
      end
      else
      begin
        CSharpDoc.Text := AModel.Documentation;

        FWriter.WriteLine(TXT_CODE_GEN_CSHARPDOC_BEGIN);
        for I := 0 to CSharpDoc.Count - 1 do
          FWriter.WriteLine('/// ' + CSharpDoc.Strings[I]);
        FWriter.WriteLine(TXT_CODE_GEN_CSHARPDOC_END);
      end;
    end;
  finally
    CSharpDoc.Free;
  end;
end;

procedure PCodeGenerator.WriteDeclInterface(AInterface: IUMLInterface);
begin
  if IsCancel then exit;
  SetupWriter;
  WriteDeclNamespace(AInterface);
  FWriter.Write('%s %s %s %s %s %s %s %s ', [NewToString(AInterface), VisibilityToString(AInterface), AbstractToString(AInterface), SealedToString(AInterface), UnsafeToString(AInterface), 'interface' ,AInterface.Name, GetInheritenceSpecStr(AInterface)]);
  SetBrace;

  WriteDeclMember( AInterface);
  CloseBrace;

  WriteDeclNamespaceEndBrace(AInterface);
  CloseWriter(AInterface);
end;

procedure PCodeGenerator.WriteDeclEnumeration(AEnumeration: IUMLEnumeration);
var
  Lit: IUMLEnumerationLiteral;
  LitVal: string;
  I: Integer;
begin
  if IsCancel then exit;
  SetupWriter;
  WriteDeclNamespace(AEnumeration);
  FWriter.Write('%s %s enum %s %s', [NewToString(AEnumeration), VisibilityToString(AEnumeration), AEnumeration.Name, EnumBaseTypeToString(AEnumeration)]);
  SetBrace;

  for I := 0 to AEnumeration.GetLiteralCount - 1 do
  begin
    Lit := AEnumeration.GetLiteralAt(I);
    FWriter.Write(Lit.Name);
    LitVal := GetStringTaggedValue(Lit, CSHARP_PROFILE_NAME, TAGSET_CSHARP_ENUM_LITERAL, TAG_CSHARP_ENUM_LITERAL_VALUE);
    if LitVal <> '' then
      FWriter.Write(' = %s', [LitVal]);
    if I <> AEnumeration.GetLiteralCount - 1 then
      FWriter.Write(',');
    FWriter.WriteLine;
  end;

  CloseBrace;
  WriteDeclNamespaceEndBrace(AEnumeration);
  CloseWriter(AEnumeration);
end;

procedure PCodeGenerator.CreateFolder(APackage: IUMLPackage);
var
  Dir: string;
begin
  if IsCancel then exit;
  Dir := StringReplace(GetOutputFilePath(APackage), CSHARP_FILE_EXT, '', [rfReplaceAll]);
  if not DirectoryExists(Dir) then
    if not ForceDirectories(Dir) then
      raise Exception.Create('Directory Create Error');

end;

procedure PCodeGenerator.ImproperModel(Model: IUMLModelElement; Msg: string);
begin
// for Model Verification
// interface opertion.isLeef = false (O)
// class.abstract opertion.Visiablity = private (X)
// interface 는 class를 상속 받을수 없다 (0)
// CSharpStruct 상속 될수 없다.
// CSharpStruct abstract 일수 없다.
// CSharpStruct Operation 은 abstract일수 없다.
// Keywork 문자가 Identy name으로 사용될수 없다.
// CSharpStruct는 Inclass 갖을수 없다.
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
  Cls: IUMLClass;
  Enum: IUMLEnumeration;
  XUMLInterface: IUMLInterface;
  Pkg : IUMLPackage;
  I: Integer;
begin
  if IsCancel then exit;

  if not Initialized then
    raise Exception.Create(ERR_CODE_GEN_NOT_INITIALIZED);

  if not FMemberByFile then
  begin
    if Trim(FBasePackageElement.Name) = '' then
    begin
      Log(Format(MSG_CODE_GEN_NONAME, [FBasePackageElement.GetMetaClass.Name , FBasePackageElement.Pathname]));
      for I := 0 to TargetElementCount - 1 do
      begin
        OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, cgkError);
      end;
      exit;
    end;
    WriteFileHeader(FBasePackageElement);
  end;
  for I := 0 to TargetElementCount - 1 do
  begin
    if IsCancel then exit;

    if Trim(TargetElements[I].Name) = '' then
    begin
      Log(Format(MSG_CODE_GEN_NONAME, [TargetElements[I].GetMetaClass.Name, TargetElements[I].Pathname]));
      OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, cgkError);
      Continue;
    end;
///////////////////// 상위 Namesapce의 이름이 '' 일경우 하위 는 생성 않함
    if (TargetElements[I].IsKindOf('UMLClassifier')) and (Pos('\\',GetOutputFilePath(TargetElements[I] as IUMLClassifier)) > 0) then
    begin
      Log(Format(MSG_CODE_GEN_NAMESPACE_NONAME, [TargetElements[I].GetMetaClass.Name, TargetElements[I].Pathname]));
      OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, cgkError);
      Continue;
    end;

    try
      OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount,cgkGen);
      if TargetElements[I].QueryInterface(IUMLInterface, XUMLInterface) = S_OK then
      begin
        OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, cgkFile);
        if FMemberByFile then
          WriteFileHeader(XUMLInterface);
        WriteDeclInterface(XUMLInterface);
        OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, cgkClose);
      end
      else if TargetElements[I].QueryInterface(IUMLClass, Cls) = S_OK then
      begin
        OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, cgkFile);
        if FMemberByFile then
          WriteFileHeader(Cls);
        WriteDeclClass(Cls);
        OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, cgkClose);
      end
      else if TargetElements[I].QueryInterface(IUMLEnumeration, Enum) = S_OK then
      begin
        OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, cgkFile);
        if FMemberByFile then
          WriteFileHeader(Enum);
        WriteDeclEnumeration(Enum);
        OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, cgkClose);
      end
      else if TargetElements[I].QueryInterface(IUMLPackage, Pkg) = S_OK then
      begin
        OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, cgkFile);
        CreateFolder(Pkg);
        OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, cgkClose);
      end;
      OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, cgkEnd);
    except
      on E: Exception do begin
        Log(Format(ERR_CODE_GEN_ERROR, [TargetElements[I].Name, E.Message]));
        OnGenerateCode(Self, TargetElements[I], I + 1, TargetElementCount, cgkError);
      end;
    end;
  end;

  if not FMemberByFile then
  begin
    if IsCancel then exit;
    FWriter.SaveToFile(FBaseDirectory + '\' +FBasePackageElement.Name + FCSharpFileExt, True);
    FWriter.Clear;
  end;

  Log(MSG_CODE_GEN_FINISH);
end;
// PCodeGenerator
////////////////////////////////////////////////////////////////////////////////
end.
