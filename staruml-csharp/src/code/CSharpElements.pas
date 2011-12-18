unit CSharpElements;

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
	// Forward Class declarations
	PCSharpElement = class;
	PCSharpParameter = class;
	PCSharpMember = class;
	PCSharpClassTypeMember = class;
	PCSharpOperator = class;
	PCSharpProperty = class;
	PCSharpEvent = class;
	PCSharpConstructor = class;
	PCSharpClassType = class;
	PCSharpField = class;
	PCSharpNamespace = class;
	PCSharpUsing = class;

	// Enumerations
	PAccessibilityKind = (akPublic, akProtected, akInternal, akPrivate, akProtectedInternal);
	PClassTypeMemberKind = (cmkMethod, cmkProperty, cmkIndexer, cmkEvent, cmkOperator, cmkConstructor, cmkDestructor);
	PConversionOperatorKind = (cokImplicit, cokExplicit, cokNone);
	PMemberKind = (mkStruct, mkEnumeration, mkClass, mkInterface, mkDelegate);
	PParameterModifierKind = (pmkRef, pmkOut, pmkParams, pmkIn);
	PPropertyAccessorKind = (pakSet, pakGet, pakSetGet, pakNone);
	PEventAccessorKind = (eakAdd, eakRemove, eakAddRemove, eakNone);
	PConstructorInitializerKind = (cikBase, cikThis, cikNone);

	// PCSharpElement
	PCSharpElement = class
  private
		{ Member Fields }
		FName: string;
		FDocumentation: string;
		FLine: Integer;
		FOffset: Integer;
		FLength: Integer;
		{ Getter/Setter }
		procedure Set_Name(Value: string);
		procedure Set_Documentation(Value: string);
		procedure Set_Line(Value: Integer);
		procedure Set_Offset(Value: Integer);
		procedure Set_Length(Value: Integer);
  public
		{ Constructor/Destructor }
		constructor Create; virtual;
		destructor Destroy; override;
		{ Properties }
		property Name: string read FName write Set_Name;
		property Documentation: string read FDocumentation write Set_Documentation;
		property Line: Integer read FLine write Set_Line;
		property Offset: Integer read FOffset write Set_Offset;
		property Length: Integer read FLength write Set_Length;
  end;

	// PCSharpParameter
	PCSharpParameter = class(PCSharpElement)
  private
		{ Member Fields }
		FType: string;
		FTypeDimension: Integer;
		FCSharpParmeterModifier: PParameterModifierKind;
		FDefaultValue: string;
		FClassTypeMember: PCSharpClassTypeMember;
		{ Getter/Setter }
		procedure Set_Type(Value: string);
		procedure Set_TypeDimension(Value: Integer);
		procedure Set_CSharpParmeterModifier(Value: PParameterModifierKind);
		procedure Set_DefaultValue(Value: string);
		procedure Set_ClassTypeMember(Value: PCSharpClassTypeMember);
  public
		{ Properties }
		property Type_: string read FType write Set_Type;
		property TypeDimension: Integer read FTypeDimension write Set_TypeDimension;
		property CSharpParmeterModifier: PParameterModifierKind read FCSharpParmeterModifier write Set_CSharpParmeterModifier;
		property DefaultValue: string read FDefaultValue write Set_DefaultValue;
		property ClassTypeMember: PCSharpClassTypeMember read FClassTypeMember write Set_ClassTypeMember;
  end;

	// PCSharpMember
	PCSharpMember = class(PCSharpElement)
  private
		{ Member Fields }
		FAccessibility: PAccessibilityKind;
		FIsSafe: Boolean;
		FIsNew: Boolean;
		{ Getter/Setter }
		procedure Set_Accessibility(Value: PAccessibilityKind);
		procedure Set_IsSafe(Value: Boolean);
		procedure Set_IsNew(Value: Boolean);
  public
		{ Properties }
		property Accessibility: PAccessibilityKind read FAccessibility write Set_Accessibility;
		property IsSafe: Boolean read FIsSafe write Set_IsSafe;
		property IsNew: Boolean read FIsNew write Set_IsNew;
  end;

	// PCSharpClassTypeMember
	PCSharpClassTypeMember = class(PCSharpMember)
  private
		{ Member Fields }
		FCSharpClassTypeMemberKind: PClassTypeMemberKind;
		FIsStatic: Boolean;
		FIsExtern: Boolean;
		FReturnType: string;
		FReturnTypeDimension: Integer;
		FBody: string;
		FIsSealed: Boolean;
		FExceptions: TStringList;
		FIsOverride: Boolean;
		FIsAbstract: Boolean;
		FIsVirtual: Boolean;
		FParameters: TList;
		FClassType_: PCSharpClassType;
		{ Getter/Setter }
		procedure Set_CSharpClassTypeMemberKind(Value: PClassTypeMemberKind);
		procedure Set_IsStatic(Value: Boolean);
		procedure Set_IsExtern(Value: Boolean);
		procedure Set_ReturnType(Value: string);
		procedure Set_ReturnTypeDimension(Value: Integer);
		procedure Set_Body(Value: string);
		procedure Set_IsSealed(Value: Boolean);
		function Get_ExceptionCount: Integer;
		function Get_Exception(Index: Integer): string;
		procedure Set_IsOverride(Value: Boolean);
		procedure Set_IsAbstract(Value: Boolean);
		procedure Set_IsVirtual(Value: Boolean);
		function Get_ParameterCount: Integer;
		function Get_Parameter(Index: Integer): PCSharpParameter;
		procedure Set_ClassType_(Value: PCSharpClassType);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Exception(Value: string);
		procedure Insert_Exception(Index: Integer; Value: string);
		procedure Delete_Exception(Index: Integer);
		procedure Add_Parameter(Value: PCSharpParameter);
		procedure Remove_Parameter(Value: PCSharpParameter);
		procedure Insert_Parameter(Index: Integer; Value: PCSharpParameter);
		procedure Delete_Parameter(Index: Integer);
		{ Properties }
		property CSharpClassTypeMemberKind: PClassTypeMemberKind read FCSharpClassTypeMemberKind write Set_CSharpClassTypeMemberKind;
		property IsStatic: Boolean read FIsStatic write Set_IsStatic;
		property IsExtern: Boolean read FIsExtern write Set_IsExtern;
		property ReturnType: string read FReturnType write Set_ReturnType;
		property ReturnTypeDimension: Integer read FReturnTypeDimension write Set_ReturnTypeDimension;
		property Body: string read FBody write Set_Body;
		property IsSealed: Boolean read FIsSealed write Set_IsSealed;
		property ExceptionCount: Integer read Get_ExceptionCount;
		property Exceptions[Index: Integer]: string read Get_Exception;
		property IsOverride: Boolean read FIsOverride write Set_IsOverride;
		property IsAbstract: Boolean read FIsAbstract write Set_IsAbstract;
		property IsVirtual: Boolean read FIsVirtual write Set_IsVirtual;
		property ParameterCount: Integer read Get_ParameterCount;
		property Parameters[Index: Integer]: PCSharpParameter read Get_Parameter;
		property ClassType_: PCSharpClassType read FClassType_ write Set_ClassType_;
  end;

	// PCSharpOperator
	PCSharpOperator = class(PCSharpClassTypeMember)
  private
		{ Member Fields }
		FCSharpConversionOperatiorKind: PConversionOperatorKind;
		{ Getter/Setter }
		procedure Set_CSharpConversionOperatiorKind(Value: PConversionOperatorKind);
  public
		{ Properties }
		property CSharpConversionOperatiorKind: PConversionOperatorKind read FCSharpConversionOperatiorKind write Set_CSharpConversionOperatiorKind;
  end;

	// PCSharpProperty
	PCSharpProperty = class(PCSharpClassTypeMember)
  private
		{ Member Fields }
		FCSharpPropertyAccessorKind: PPropertyAccessorKind;
		{ Getter/Setter }
		procedure Set_CSharpPropertyAccessorKind(Value: PPropertyAccessorKind);
  public
		{ Properties }
		property CSharpPropertyAccessorKind: PPropertyAccessorKind read FCSharpPropertyAccessorKind write Set_CSharpPropertyAccessorKind;
  end;

	// PCSharpEvent
	PCSharpEvent = class(PCSharpClassTypeMember)
  private
		{ Member Fields }
		FCSharpEventAccessorKind: PEventAccessorKind;
		{ Getter/Setter }
		procedure Set_CSharpEventAccessorKind(Value: PEventAccessorKind);
  public
		{ Properties }
		property CSharpEventAccessorKind: PEventAccessorKind read FCSharpEventAccessorKind write Set_CSharpEventAccessorKind;
  end;

	// PCSharpConstructor
	PCSharpConstructor = class(PCSharpClassTypeMember)
  private
		{ Member Fields }
		FCSharpConstructorInitializerKind: PConstructorInitializerKind;
		FCSharpConstructorInitializerArgumentses: TStringList;
		{ Getter/Setter }
		procedure Set_CSharpConstructorInitializerKind(Value: PConstructorInitializerKind);
		function Get_CSharpConstructorInitializerArgumentsCount: Integer;
		function Get_CSharpConstructorInitializerArguments(Index: Integer): string;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_CSharpConstructorInitializerArguments(Value: string);
		procedure Insert_CSharpConstructorInitializerArguments(Index: Integer; Value: string);
		procedure Delete_CSharpConstructorInitializerArguments(Index: Integer);
		{ Properties }
		property CSharpConstructorInitializerKind: PConstructorInitializerKind read FCSharpConstructorInitializerKind write Set_CSharpConstructorInitializerKind;
		property CSharpConstructorInitializerArgumentsCount: Integer read Get_CSharpConstructorInitializerArgumentsCount;
		property CSharpConstructorInitializerArgumentses[Index: Integer]: string read Get_CSharpConstructorInitializerArguments;
  end;

	// PCSharpClassType
	PCSharpClassType = class(PCSharpMember)
  private
		{ Member Fields }
		FCSharpMemberKind: PMemberKind;
		FExtend: string;
		FImplements: TStringList;
		FIsSealed: Boolean;
		FIsAbstract: Boolean;
		FClassTypeMembers: TList;
		FOuterClass: PCSharpClassType;
		FInnerClasses: TList;
		FFields: TList;
		FNamespace: PCSharpNamespace;
		{ Getter/Setter }
		procedure Set_CSharpMemberKind(Value: PMemberKind);
		procedure Set_Extend(Value: string);
		function Get_ImplementCount: Integer;
		function Get_Implement(Index: Integer): string;
		procedure Set_IsSealed(Value: Boolean);
		procedure Set_IsAbstract(Value: Boolean);
		function Get_ClassTypeMemberCount: Integer;
		function Get_ClassTypeMember(Index: Integer): PCSharpClassTypeMember;
		procedure Set_OuterClass(Value: PCSharpClassType);
		function Get_InnerClassCount: Integer;
		function Get_InnerClass(Index: Integer): PCSharpClassType;
		function Get_FieldCount: Integer;
		function Get_Field(Index: Integer): PCSharpField;
		procedure Set_Namespace(Value: PCSharpNamespace);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Implement(Value: string);
		procedure Insert_Implement(Index: Integer; Value: string);
		procedure Delete_Implement(Index: Integer);
		procedure Add_ClassTypeMember(Value: PCSharpClassTypeMember);
		procedure Remove_ClassTypeMember(Value: PCSharpClassTypeMember);
		procedure Insert_ClassTypeMember(Index: Integer; Value: PCSharpClassTypeMember);
		procedure Delete_ClassTypeMember(Index: Integer);
		procedure Add_InnerClass(Value: PCSharpClassType);
		procedure Remove_InnerClass(Value: PCSharpClassType);
		procedure Insert_InnerClass(Index: Integer; Value: PCSharpClassType);
		procedure Delete_InnerClass(Index: Integer);
		procedure Add_Field(Value: PCSharpField);
		procedure Remove_Field(Value: PCSharpField);
		procedure Insert_Field(Index: Integer; Value: PCSharpField);
		procedure Delete_Field(Index: Integer);
		{ Properties }
		property CSharpMemberKind: PMemberKind read FCSharpMemberKind write Set_CSharpMemberKind;
		property Extend: string read FExtend write Set_Extend;
		property ImplementCount: Integer read Get_ImplementCount;
		property Implements[Index: Integer]: string read Get_Implement;
		property IsSealed: Boolean read FIsSealed write Set_IsSealed;
		property IsAbstract: Boolean read FIsAbstract write Set_IsAbstract;
		property ClassTypeMemberCount: Integer read Get_ClassTypeMemberCount;
		property ClassTypeMembers[Index: Integer]: PCSharpClassTypeMember read Get_ClassTypeMember;
		property OuterClass: PCSharpClassType read FOuterClass write Set_OuterClass;
		property InnerClassCount: Integer read Get_InnerClassCount;
		property InnerClasses[Index: Integer]: PCSharpClassType read Get_InnerClass;
		property FieldCount: Integer read Get_FieldCount;
		property Fields[Index: Integer]: PCSharpField read Get_Field;
		property Namespace: PCSharpNamespace read FNamespace write Set_Namespace;
  end;

	// PCSharpField
	PCSharpField = class(PCSharpMember)
  private
		{ Member Fields }
		FType: string;
		FTypeDimension: Integer;
		FIsVolatile: Boolean;
		FIsReadOnly: Boolean;
		FIsStatic: Boolean;
		FIsConstant: Boolean;
		FInitializerExpression: string;
		FClassType_: PCSharpClassType;
		{ Getter/Setter }
		procedure Set_Type(Value: string);
		procedure Set_TypeDimension(Value: Integer);
		procedure Set_IsVolatile(Value: Boolean);
		procedure Set_IsReadOnly(Value: Boolean);
		procedure Set_IsStatic(Value: Boolean);
		procedure Set_IsConstant(Value: Boolean);
		procedure Set_InitializerExpression(Value: string);
		procedure Set_ClassType_(Value: PCSharpClassType);
  public
		{ Properties }
		property Type_: string read FType write Set_Type;
		property TypeDimension: Integer read FTypeDimension write Set_TypeDimension;
		property IsVolatile: Boolean read FIsVolatile write Set_IsVolatile;
		property IsReadOnly: Boolean read FIsReadOnly write Set_IsReadOnly;
		property IsStatic: Boolean read FIsStatic write Set_IsStatic;
		property IsConstant: Boolean read FIsConstant write Set_IsConstant;
		property InitializerExpression: string read FInitializerExpression write Set_InitializerExpression;
		property ClassType_: PCSharpClassType read FClassType_ write Set_ClassType_;
  end;

	// PCSharpNamespace
	PCSharpNamespace = class(PCSharpElement)
  private
		{ Member Fields }
		FIsDefault: Boolean;
		FSuperNamespace: PCSharpNamespace;
		FSubNamespaces: TList;
		FClassType_s: TList;
		FUsings: TList;
		{ Getter/Setter }
		procedure Set_IsDefault(Value: Boolean);
		procedure Set_SuperNamespace(Value: PCSharpNamespace);
		function Get_SubNamespaceCount: Integer;
		function Get_SubNamespace(Index: Integer): PCSharpNamespace;
		function Get_ClassType_Count: Integer;
		function Get_ClassType_(Index: Integer): PCSharpClassType;
		function Get_UsingCount: Integer;
		function Get_Using(Index: Integer): PCSharpUsing;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_SubNamespace(Value: PCSharpNamespace);
		procedure Remove_SubNamespace(Value: PCSharpNamespace);
		procedure Insert_SubNamespace(Index: Integer; Value: PCSharpNamespace);
		procedure Delete_SubNamespace(Index: Integer);
		procedure Add_ClassType_(Value: PCSharpClassType);
		procedure Remove_ClassType_(Value: PCSharpClassType);
		procedure Insert_ClassType_(Index: Integer; Value: PCSharpClassType);
		procedure Delete_ClassType_(Index: Integer);
		procedure Add_Using(Value: PCSharpUsing);
		procedure Remove_Using(Value: PCSharpUsing);
		procedure Insert_Using(Index: Integer; Value: PCSharpUsing);
		procedure Delete_Using(Index: Integer);
		{ Properties }
		property IsDefault: Boolean read FIsDefault write Set_IsDefault;
		property SuperNamespace: PCSharpNamespace read FSuperNamespace write Set_SuperNamespace;
		property SubNamespaceCount: Integer read Get_SubNamespaceCount;
		property SubNamespaces[Index: Integer]: PCSharpNamespace read Get_SubNamespace;
		property ClassType_Count: Integer read Get_ClassType_Count;
		property ClassType_s[Index: Integer]: PCSharpClassType read Get_ClassType_;
		property UsingCount: Integer read Get_UsingCount;
		property Usings[Index: Integer]: PCSharpUsing read Get_Using;
  end;

	// PCSharpUsing
	PCSharpUsing = class(PCSharpElement)
  private
		{ Member Fields }
		FNamespacePath: string;
		FUsingAlias: string;
		FNamespace: PCSharpNamespace;
		{ Getter/Setter }
		procedure Set_NamespacePath(Value: string);
		procedure Set_UsingAlias(Value: string);
		procedure Set_Namespace(Value: PCSharpNamespace);
  public
		{ Properties }
		property NamespacePath: string read FNamespacePath write Set_NamespacePath;
		property UsingAlias: string read FUsingAlias write Set_UsingAlias;
		property Namespace: PCSharpNamespace read FNamespace write Set_Namespace;
  end;

implementation

/////////////////////////////////////////////////////////////////////////////
//  PCSharpElement

constructor PCSharpElement.Create;
begin
  inherited Create;
end;

destructor PCSharpElement.Destroy;
begin
	inherited;
end;

procedure PCSharpElement.Set_Name(Value: string);
begin
  FName := Value;
end;

procedure PCSharpElement.Set_Documentation(Value: string);
begin
  FDocumentation := Value;
end;

procedure PCSharpElement.Set_Line(Value: Integer);
begin
  FLine := Value;
end;

procedure PCSharpElement.Set_Offset(Value: Integer);
begin
  FOffset := Value;
end;

procedure PCSharpElement.Set_Length(Value: Integer);
begin
  FLength := Value;
end;

//  PCSharpElement
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCSharpParameter

procedure PCSharpParameter.Set_Type(Value: string);
begin
  FType := Value;
end;

procedure PCSharpParameter.Set_TypeDimension(Value: Integer);
begin
  FTypeDimension := Value;
end;

procedure PCSharpParameter.Set_CSharpParmeterModifier(Value: PParameterModifierKind);
begin
  FCSharpParmeterModifier := Value;
end;

procedure PCSharpParameter.Set_DefaultValue(Value: string);
begin
  FDefaultValue := Value;
end;

procedure PCSharpParameter.Set_ClassTypeMember(Value: PCSharpClassTypeMember);
begin
  if FClassTypeMember <> Value then begin
    if FClassTypeMember <> nil then FClassTypeMember.FParameters.Remove(Self);
    FClassTypeMember := Value;
    if FClassTypeMember <> nil then FClassTypeMember.FParameters.Add(Self);
  end;
end;

//  PCSharpParameter
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCSharpMember

procedure PCSharpMember.Set_Accessibility(Value: PAccessibilityKind);
begin
  FAccessibility := Value;
end;

procedure PCSharpMember.Set_IsSafe(Value: Boolean);
begin
  FIsSafe := Value;
end;

procedure PCSharpMember.Set_IsNew(Value: Boolean);
begin
  FIsNew := Value;
end;

//  PCSharpMember
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCSharpClassTypeMember

constructor PCSharpClassTypeMember.Create;
begin
  inherited Create;
	FExceptions := TStringList.Create;
	FParameters := TList.Create;
	FClassType_ := nil;
end;

destructor PCSharpClassTypeMember.Destroy;
var
  I: Integer;
begin
	FExceptions.Free;
	FExceptions := nil;
	for I := FParameters.Count - 1 downto 0 do begin
		Get_Parameter(I).Free;
		FParameters.Delete(I);
	end;
	FParameters.Free;
	FParameters := nil;
	inherited;
end;

procedure PCSharpClassTypeMember.Set_CSharpClassTypeMemberKind(Value: PClassTypeMemberKind);
begin
  FCSharpClassTypeMemberKind := Value;
end;

procedure PCSharpClassTypeMember.Set_IsStatic(Value: Boolean);
begin
  FIsStatic := Value;
end;

procedure PCSharpClassTypeMember.Set_IsExtern(Value: Boolean);
begin
  FIsExtern := Value;
end;

procedure PCSharpClassTypeMember.Set_ReturnType(Value: string);
begin
  FReturnType := Value;
end;

procedure PCSharpClassTypeMember.Set_ReturnTypeDimension(Value: Integer);
begin
  FReturnTypeDimension := Value;
end;

procedure PCSharpClassTypeMember.Set_Body(Value: string);
begin
  FBody := Value;
end;

procedure PCSharpClassTypeMember.Set_IsSealed(Value: Boolean);
begin
  FIsSealed := Value;
end;

function PCSharpClassTypeMember.Get_ExceptionCount: Integer;
begin
  Result := FExceptions.Count;
end;

function PCSharpClassTypeMember.Get_Exception(Index: Integer): string;
begin
  Result := FExceptions[Index];
end;

procedure PCSharpClassTypeMember.Add_Exception(Value: string);
begin
  FExceptions.Add(Value);
end;

procedure PCSharpClassTypeMember.Insert_Exception(Index: Integer; Value: string);
begin
  FExceptions.Insert(Index, Value);
end;

procedure PCSharpClassTypeMember.Delete_Exception(Index: Integer);
begin
  FExceptions.Delete(Index);
end;

procedure PCSharpClassTypeMember.Set_IsOverride(Value: Boolean);
begin
  FIsOverride := Value;
end;

procedure PCSharpClassTypeMember.Set_IsAbstract(Value: Boolean);
begin
  FIsAbstract := Value;
end;

procedure PCSharpClassTypeMember.Set_IsVirtual(Value: Boolean);
begin
  FIsVirtual := Value;
end;

function PCSharpClassTypeMember.Get_ParameterCount: Integer;
begin
  Result := FParameters.Count;
end;

function PCSharpClassTypeMember.Get_Parameter(Index: Integer): PCSharpParameter;
begin
  Result := FParameters[Index];
end;

procedure PCSharpClassTypeMember.Add_Parameter(Value: PCSharpParameter);
begin
  if FParameters.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FParameters.Add(Value);
    Value.FClassTypeMember := Self;
  end;
end;

procedure PCSharpClassTypeMember.Remove_Parameter(Value: PCSharpParameter);
begin
  if FParameters.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FParameters.Remove(Value);
    Value.FClassTypeMember := nil;
  end;
end;

procedure PCSharpClassTypeMember.Insert_Parameter(Index: Integer; Value: PCSharpParameter);
begin
  if (Index < 0) or (Index > FParameters.Count - 1) then Exit;
  if FParameters.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FParameters.Insert(Index, Value);
    Value.FClassTypeMember := Self;
  end;
end;

procedure PCSharpClassTypeMember.Delete_Parameter(Index: Integer);
begin
  if (Index < 0) or (Index > FParameters.Count - 1) then Exit;
  Remove_Parameter(Get_Parameter(Index));
end;

procedure PCSharpClassTypeMember.Set_ClassType_(Value: PCSharpClassType);
begin
  if FClassType_ <> Value then begin
    if FClassType_ <> nil then FClassType_.FClassTypeMembers.Remove(Self);
    FClassType_ := Value;
    if FClassType_ <> nil then FClassType_.FClassTypeMembers.Add(Self);
  end;
end;

//  PCSharpClassTypeMember
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCSharpOperator

procedure PCSharpOperator.Set_CSharpConversionOperatiorKind(Value: PConversionOperatorKind);
begin
  FCSharpConversionOperatiorKind := Value;
end;

//  PCSharpOperator
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCSharpProperty

procedure PCSharpProperty.Set_CSharpPropertyAccessorKind(Value: PPropertyAccessorKind);
begin
  FCSharpPropertyAccessorKind := Value;
end;

//  PCSharpProperty
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCSharpEvent

procedure PCSharpEvent.Set_CSharpEventAccessorKind(Value: PEventAccessorKind);
begin
  FCSharpEventAccessorKind := Value;
end;

//  PCSharpEvent
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCSharpConstructor

constructor PCSharpConstructor.Create;
begin
  inherited Create;
	FCSharpConstructorInitializerArgumentses := TStringList.Create;
end;

destructor PCSharpConstructor.Destroy;
begin
	FCSharpConstructorInitializerArgumentses.Free;
	FCSharpConstructorInitializerArgumentses := nil;
	inherited;
end;

procedure PCSharpConstructor.Set_CSharpConstructorInitializerKind(Value: PConstructorInitializerKind);
begin
  FCSharpConstructorInitializerKind := Value;
end;

function PCSharpConstructor.Get_CSharpConstructorInitializerArgumentsCount: Integer;
begin
  Result := FCSharpConstructorInitializerArgumentses.Count;
end;

function PCSharpConstructor.Get_CSharpConstructorInitializerArguments(Index: Integer): string;
begin
  Result := FCSharpConstructorInitializerArgumentses[Index];
end;

procedure PCSharpConstructor.Add_CSharpConstructorInitializerArguments(Value: string);
begin
  FCSharpConstructorInitializerArgumentses.Add(Value);
end;

procedure PCSharpConstructor.Insert_CSharpConstructorInitializerArguments(Index: Integer; Value: string);
begin
  FCSharpConstructorInitializerArgumentses.Insert(Index, Value);
end;

procedure PCSharpConstructor.Delete_CSharpConstructorInitializerArguments(Index: Integer);
begin
  FCSharpConstructorInitializerArgumentses.Delete(Index);
end;

//  PCSharpConstructor
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCSharpClassType

constructor PCSharpClassType.Create;
begin
  inherited Create;
	FImplements := TStringList.Create;
	FClassTypeMembers := TList.Create;
	FOuterClass := nil;
	FInnerClasses := TList.Create;
	FFields := TList.Create;
	FNamespace := nil;
end;

destructor PCSharpClassType.Destroy;
var
  I: Integer;
begin
	FImplements.Free;
	FImplements := nil;
	for I := FClassTypeMembers.Count - 1 downto 0 do begin
		Get_ClassTypeMember(I).Free;
		FClassTypeMembers.Delete(I);
	end;
	FClassTypeMembers.Free;
	FClassTypeMembers := nil;
	for I := FInnerClasses.Count - 1 downto 0 do begin
		Get_InnerClass(I).Free;
		FInnerClasses.Delete(I);
	end;
	FInnerClasses.Free;
	FInnerClasses := nil;
	for I := FFields.Count - 1 downto 0 do begin
		Get_Field(I).Free;
		FFields.Delete(I);
	end;
	FFields.Free;
	FFields := nil;
	inherited;
end;

procedure PCSharpClassType.Set_CSharpMemberKind(Value: PMemberKind);
begin
  FCSharpMemberKind := Value;
end;

procedure PCSharpClassType.Set_Extend(Value: string);
begin
  FExtend := Value;
end;

function PCSharpClassType.Get_ImplementCount: Integer;
begin
  Result := FImplements.Count;
end;

function PCSharpClassType.Get_Implement(Index: Integer): string;
begin
  Result := FImplements[Index];
end;

procedure PCSharpClassType.Add_Implement(Value: string);
begin
  FImplements.Add(Value);
end;

procedure PCSharpClassType.Insert_Implement(Index: Integer; Value: string);
begin
  FImplements.Insert(Index, Value);
end;

procedure PCSharpClassType.Delete_Implement(Index: Integer);
begin
  FImplements.Delete(Index);
end;

procedure PCSharpClassType.Set_IsSealed(Value: Boolean);
begin
  FIsSealed := Value;
end;

procedure PCSharpClassType.Set_IsAbstract(Value: Boolean);
begin
  FIsAbstract := Value;
end;

function PCSharpClassType.Get_ClassTypeMemberCount: Integer;
begin
  Result := FClassTypeMembers.Count;
end;

function PCSharpClassType.Get_ClassTypeMember(Index: Integer): PCSharpClassTypeMember;
begin
  Result := FClassTypeMembers[Index];
end;

procedure PCSharpClassType.Add_ClassTypeMember(Value: PCSharpClassTypeMember);
begin
  if FClassTypeMembers.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FClassTypeMembers.Add(Value);
    Value.FClassType_ := Self;
  end;
end;

procedure PCSharpClassType.Remove_ClassTypeMember(Value: PCSharpClassTypeMember);
begin
  if FClassTypeMembers.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FClassTypeMembers.Remove(Value);
    Value.FClassType_ := nil;
  end;
end;

procedure PCSharpClassType.Insert_ClassTypeMember(Index: Integer; Value: PCSharpClassTypeMember);
begin
  if (Index < 0) or (Index > FClassTypeMembers.Count - 1) then Exit;
  if FClassTypeMembers.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FClassTypeMembers.Insert(Index, Value);
    Value.FClassType_ := Self;
  end;
end;

procedure PCSharpClassType.Delete_ClassTypeMember(Index: Integer);
begin
  if (Index < 0) or (Index > FClassTypeMembers.Count - 1) then Exit;
  Remove_ClassTypeMember(Get_ClassTypeMember(Index));
end;

procedure PCSharpClassType.Set_OuterClass(Value: PCSharpClassType);
begin
  if FOuterClass <> Value then begin
    if FOuterClass <> nil then FOuterClass.FInnerClasses.Remove(Self);
    FOuterClass := Value;
    if FOuterClass <> nil then FOuterClass.FInnerClasses.Add(Self);
  end;
end;

function PCSharpClassType.Get_InnerClassCount: Integer;
begin
  Result := FInnerClasses.Count;
end;

function PCSharpClassType.Get_InnerClass(Index: Integer): PCSharpClassType;
begin
  Result := FInnerClasses[Index];
end;

procedure PCSharpClassType.Add_InnerClass(Value: PCSharpClassType);
begin
  if FInnerClasses.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FInnerClasses.Add(Value);
    Value.FOuterClass := Self;
  end;
end;

procedure PCSharpClassType.Remove_InnerClass(Value: PCSharpClassType);
begin
  if FInnerClasses.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FInnerClasses.Remove(Value);
    Value.FOuterClass := nil;
  end;
end;

procedure PCSharpClassType.Insert_InnerClass(Index: Integer; Value: PCSharpClassType);
begin
  if (Index < 0) or (Index > FInnerClasses.Count - 1) then Exit;
  if FInnerClasses.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FInnerClasses.Insert(Index, Value);
    Value.FOuterClass := Self;
  end;
end;

procedure PCSharpClassType.Delete_InnerClass(Index: Integer);
begin
  if (Index < 0) or (Index > FInnerClasses.Count - 1) then Exit;
  Remove_InnerClass(Get_InnerClass(Index));
end;

function PCSharpClassType.Get_FieldCount: Integer;
begin
  Result := FFields.Count;
end;

function PCSharpClassType.Get_Field(Index: Integer): PCSharpField;
begin
  Result := FFields[Index];
end;

procedure PCSharpClassType.Add_Field(Value: PCSharpField);
begin
  if FFields.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FFields.Add(Value);
    Value.FClassType_ := Self;
  end;
end;

procedure PCSharpClassType.Remove_Field(Value: PCSharpField);
begin
  if FFields.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FFields.Remove(Value);
    Value.FClassType_ := nil;
  end;
end;

procedure PCSharpClassType.Insert_Field(Index: Integer; Value: PCSharpField);
begin
  if (Index < 0) or (Index > FFields.Count - 1) then Exit;
  if FFields.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FFields.Insert(Index, Value);
    Value.FClassType_ := Self;
  end;
end;

procedure PCSharpClassType.Delete_Field(Index: Integer);
begin
  if (Index < 0) or (Index > FFields.Count - 1) then Exit;
  Remove_Field(Get_Field(Index));
end;

procedure PCSharpClassType.Set_Namespace(Value: PCSharpNamespace);
begin
  if FNamespace <> Value then begin
    if FNamespace <> nil then FNamespace.FClassType_s.Remove(Self);
    FNamespace := Value;
    if FNamespace <> nil then FNamespace.FClassType_s.Add(Self);
  end;
end;

//  PCSharpClassType
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCSharpField

procedure PCSharpField.Set_Type(Value: string);
begin
  FType := Value;
end;

procedure PCSharpField.Set_TypeDimension(Value: Integer);
begin
  FTypeDimension := Value;
end;

procedure PCSharpField.Set_IsVolatile(Value: Boolean);
begin
  FIsVolatile := Value;
end;

procedure PCSharpField.Set_IsReadOnly(Value: Boolean);
begin
  FIsReadOnly := Value;
end;

procedure PCSharpField.Set_IsStatic(Value: Boolean);
begin
  FIsStatic := Value;
end;

procedure PCSharpField.Set_IsConstant(Value: Boolean);
begin
  FIsConstant := Value;
end;

procedure PCSharpField.Set_InitializerExpression(Value: string);
begin
  FInitializerExpression := Value;
end;

procedure PCSharpField.Set_ClassType_(Value: PCSharpClassType);
begin
  if FClassType_ <> Value then begin
    if FClassType_ <> nil then FClassType_.FFields.Remove(Self);
    FClassType_ := Value;
    if FClassType_ <> nil then FClassType_.FFields.Add(Self);
  end;
end;

//  PCSharpField
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCSharpNamespace

constructor PCSharpNamespace.Create;
begin
  inherited Create;
	FSuperNamespace := nil;
	FSubNamespaces := TList.Create;
	FClassType_s := TList.Create;
	FUsings := TList.Create;
end;

destructor PCSharpNamespace.Destroy;
var
  I: Integer;
begin
	for I := FSubNamespaces.Count - 1 downto 0 do begin
		Get_SubNamespace(I).Free;
		FSubNamespaces.Delete(I);
	end;
	FSubNamespaces.Free;
	FSubNamespaces := nil;
	for I := FClassType_s.Count - 1 downto 0 do begin
		Get_ClassType_(I).Free;
		FClassType_s.Delete(I);
	end;
	FClassType_s.Free;
	FClassType_s := nil;
	for I := FUsings.Count - 1 downto 0 do begin
		Get_Using(I).Free;
		FUsings.Delete(I);
	end;
	FUsings.Free;
	FUsings := nil;
	inherited;
end;

procedure PCSharpNamespace.Set_IsDefault(Value: Boolean);
begin
  FIsDefault := Value;
end;

procedure PCSharpNamespace.Set_SuperNamespace(Value: PCSharpNamespace);
begin
  if FSuperNamespace <> Value then begin
    if FSuperNamespace <> nil then FSuperNamespace.FSubNamespaces.Remove(Self);
    FSuperNamespace := Value;
    if FSuperNamespace <> nil then FSuperNamespace.FSubNamespaces.Add(Self);
  end;
end;

function PCSharpNamespace.Get_SubNamespaceCount: Integer;
begin
  Result := FSubNamespaces.Count;
end;

function PCSharpNamespace.Get_SubNamespace(Index: Integer): PCSharpNamespace;
begin
  Result := FSubNamespaces[Index];
end;

procedure PCSharpNamespace.Add_SubNamespace(Value: PCSharpNamespace);
begin
  if FSubNamespaces.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FSubNamespaces.Add(Value);
    Value.FSuperNamespace := Self;
  end;
end;

procedure PCSharpNamespace.Remove_SubNamespace(Value: PCSharpNamespace);
begin
  if FSubNamespaces.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FSubNamespaces.Remove(Value);
    Value.FSuperNamespace := nil;
  end;
end;

procedure PCSharpNamespace.Insert_SubNamespace(Index: Integer; Value: PCSharpNamespace);
begin
  if (Index < 0) or (Index > FSubNamespaces.Count - 1) then Exit;
  if FSubNamespaces.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FSubNamespaces.Insert(Index, Value);
    Value.FSuperNamespace := Self;
  end;
end;

procedure PCSharpNamespace.Delete_SubNamespace(Index: Integer);
begin
  if (Index < 0) or (Index > FSubNamespaces.Count - 1) then Exit;
  Remove_SubNamespace(Get_SubNamespace(Index));
end;

function PCSharpNamespace.Get_ClassType_Count: Integer;
begin
  Result := FClassType_s.Count;
end;

function PCSharpNamespace.Get_ClassType_(Index: Integer): PCSharpClassType;
begin
  Result := FClassType_s[Index];
end;

procedure PCSharpNamespace.Add_ClassType_(Value: PCSharpClassType);
begin
  if FClassType_s.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FClassType_s.Add(Value);
    Value.FNamespace := Self;
  end;
end;

procedure PCSharpNamespace.Remove_ClassType_(Value: PCSharpClassType);
begin
  if FClassType_s.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FClassType_s.Remove(Value);
    Value.FNamespace := nil;
  end;
end;

procedure PCSharpNamespace.Insert_ClassType_(Index: Integer; Value: PCSharpClassType);
begin
  if (Index < 0) or (Index > FClassType_s.Count - 1) then Exit;
  if FClassType_s.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FClassType_s.Insert(Index, Value);
    Value.FNamespace := Self;
  end;
end;

procedure PCSharpNamespace.Delete_ClassType_(Index: Integer);
begin
  if (Index < 0) or (Index > FClassType_s.Count - 1) then Exit;
  Remove_ClassType_(Get_ClassType_(Index));
end;

function PCSharpNamespace.Get_UsingCount: Integer;
begin
  Result := FUsings.Count;
end;

function PCSharpNamespace.Get_Using(Index: Integer): PCSharpUsing;
begin
  Result := FUsings[Index];
end;

procedure PCSharpNamespace.Add_Using(Value: PCSharpUsing);
begin
  if FUsings.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FUsings.Add(Value);
    Value.FNamespace := Self;
  end;
end;

procedure PCSharpNamespace.Remove_Using(Value: PCSharpUsing);
begin
  if FUsings.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FUsings.Remove(Value);
    Value.FNamespace := nil;
  end;
end;

procedure PCSharpNamespace.Insert_Using(Index: Integer; Value: PCSharpUsing);
begin
  if (Index < 0) or (Index > FUsings.Count - 1) then Exit;
  if FUsings.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FUsings.Insert(Index, Value);
    Value.FNamespace := Self;
  end;
end;

procedure PCSharpNamespace.Delete_Using(Index: Integer);
begin
  if (Index < 0) or (Index > FUsings.Count - 1) then Exit;
  Remove_Using(Get_Using(Index));
end;

//  PCSharpNamespace
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCSharpUsing

procedure PCSharpUsing.Set_NamespacePath(Value: string);
begin
  FNamespacePath := Value;
end;

procedure PCSharpUsing.Set_UsingAlias(Value: string);
begin
  FUsingAlias := Value;
end;

procedure PCSharpUsing.Set_Namespace(Value: PCSharpNamespace);
begin
  if FNamespace <> Value then begin
    if FNamespace <> nil then FNamespace.FUsings.Remove(Self);
    FNamespace := Value;
    if FNamespace <> nil then FNamespace.FUsings.Add(Self);
  end;
end;

//  PCSharpUsing
/////////////////////////////////////////////////////////////////////////////


end.