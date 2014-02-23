unit JavaElements;

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
  RevCore,
  Classes, ComObj, ActiveX, WSJavaParser15_TLB;
  
type
	// forward declarations
	PJavaElement = class;
	PJavaCompilationUnit = class;
	PJavaField = class;
	PJavaImport = class;
	PJavaInitializer = class;
	PJavaMember = class;
	PJavaMethod = class;
	PJavaPackage = class;
	PJavaType = class;
	PJavaPackageDeclaration = class;
	PJavaParameter = class;

	// enumerations
	PVisibilityKind = (vkPublic, vkProtected, vkPrivate, vkPackage);

	// PJavaElement
	PJavaElement = class(PObject)
  private
		FName: string;
		FDocumentation: string;
		FLine: Integer;
		FOffset: Integer;
		FLength: Integer;
		procedure SetName(Value: string);
		procedure SetDocumentation(Value: string);
		procedure SetLine(Value: Integer);
		procedure SetOffset(Value: Integer);
		procedure SetLength(Value: Integer);
  public
		property Name: string read FName write SetName;
		property Documentation: string read FDocumentation write SetDocumentation;
		property Line: Integer read FLine write SetLine;
		property Offset: Integer read FOffset write SetOffset;
		property Length: Integer read FLength write SetLength;
  end;

	// PJavaCompilationUnit
	PJavaCompilationUnit = class(PObject)
  private
		FFileName: string;
		FImports: TList;
		FPackage: PJavaPackage;
		FDeclaredTypes: TList;
		FPackageDeclaration: PJavaPackageDeclaration;
		procedure SetFileName(Value: string);
		function GetImportCount: Integer;
		function GetImport(Index: Integer): PJavaImport;
		procedure SetPackage(Value: PJavaPackage);
		function GetDeclaredTypeCount: Integer;
		function GetDeclaredType(Index: Integer): PJavaType;
		procedure SetPackageDeclaration(Value: PJavaPackageDeclaration);
  public
		constructor Create; override;
		destructor Destroy; override;
		procedure AddImport(Value: PJavaImport);
		procedure RemoveImport(Value: PJavaImport);
		procedure InsertImport(Index: Integer; Value: PJavaImport);
		procedure DeleteImport(Index: Integer);
		procedure AddDeclaredType(Value: PJavaType);
		procedure RemoveDeclaredType(Value: PJavaType);
		procedure InsertDeclaredType(Index: Integer; Value: PJavaType);
		procedure DeleteDeclaredType(Index: Integer);
		property FileName: string read FFileName write SetFileName;
		property ImportCount: Integer read GetImportCount;
		property Imports[Index: Integer]: PJavaImport read GetImport;
		property Package: PJavaPackage read FPackage write SetPackage;
		property DeclaredTypeCount: Integer read GetDeclaredTypeCount;
		property DeclaredTypes[Index: Integer]: PJavaType read GetDeclaredType;
		property PackageDeclaration: PJavaPackageDeclaration read FPackageDeclaration write SetPackageDeclaration;
  end;

	// PJavaMember
	PJavaMember = class(PJavaElement)
  private
		FVisibility: PVisibilityKind;
		FIsAbstract: Boolean;
		FIsFinal: Boolean;
		FIsNative: Boolean;
		FIsStatic: Boolean;
		FIsStrictfp: Boolean;
		FIsSynchronized: Boolean;
		FIsTransient: Boolean;
		FIsVolatile: Boolean;
		procedure SetVisibility(Value: PVisibilityKind);
		procedure SetIsAbstract(Value: Boolean);
		procedure SetIsFinal(Value: Boolean);
		procedure SetIsNative(Value: Boolean);
		procedure SetIsStatic(Value: Boolean);
		procedure SetIsStrictfp(Value: Boolean);
		procedure SetIsSynchronized(Value: Boolean);
		procedure SetIsTransient(Value: Boolean);
		procedure SetIsVolatile(Value: Boolean);
  public
		property Visibility: PVisibilityKind read FVisibility write SetVisibility;
		property IsAbstract: Boolean read FIsAbstract write SetIsAbstract;
		property IsFinal: Boolean read FIsFinal write SetIsFinal;
		property IsNative: Boolean read FIsNative write SetIsNative;
		property IsStatic: Boolean read FIsStatic write SetIsStatic;
		property IsStrictfp: Boolean read FIsStrictfp write SetIsStrictfp;
		property IsSynchronized: Boolean read FIsSynchronized write SetIsSynchronized;
		property IsTransient: Boolean read FIsTransient write SetIsTransient;
		property IsVolatile: Boolean read FIsVolatile write SetIsVolatile;
  end;

	// PJavaField
	PJavaField = class(PJavaMember)
  private
		FType_: string;
		FTypeDimension: Integer;
		FInitializerExpression: string;
		FDeclaringType: PJavaType;
		procedure SetType_(Value: string);
		procedure SetTypeDimension(Value: Integer);
		procedure SetInitializerExpression(Value: string);
		procedure SetDeclaringType(Value: PJavaType);
  public
		property Type_: string read FType_ write SetType_;
		property TypeDimension: Integer read FTypeDimension write SetTypeDimension;
		property InitializerExpression: string read FInitializerExpression write SetInitializerExpression;
		property DeclaringType: PJavaType read FDeclaringType write SetDeclaringType;
  end;

	// PJavaImport
	PJavaImport = class(PJavaElement)
  private
		FIsOnDemand: Boolean;
		FPathFragments: TStringList;
		FCompilationUnit: PJavaCompilationUnit;
		procedure SetIsOnDemand(Value: Boolean);
		function GetPathFragmentCount: Integer;
		function GetPathFragment(Index: Integer): string;
		procedure SetCompilationUnit(Value: PJavaCompilationUnit);
  public
		constructor Create; override;
		destructor Destroy; override;
		procedure AddPathFragment(Value: string);
		procedure InsertPathFragment(Index: Integer; Value: string);
		procedure DeletePathFragment(Index: Integer);
		property IsOnDemand: Boolean read FIsOnDemand write SetIsOnDemand;
		property PathFragmentCount: Integer read GetPathFragmentCount;
		property PathFragments[Index: Integer]: string read GetPathFragment;
		property CompilationUnit: PJavaCompilationUnit read FCompilationUnit write SetCompilationUnit;
  end;

	// PJavaInitializer
	PJavaInitializer = class(PJavaMember)
  private
		FBody: string;
		FDeclaringType: PJavaType;
		procedure SetBody(Value: string);
		procedure SetDeclaringType(Value: PJavaType);
  public
		property Body: string read FBody write SetBody;
		property DeclaringType: PJavaType read FDeclaringType write SetDeclaringType;
  end;

	// PJavaMethod
	PJavaMethod = class(PJavaMember)
  private
		FIsConstructor: Boolean;
		FExceptions: TStringList;
		FReturnType: string;
		FReturnTypeDimension: Integer;
		FBody: string;
		FDeclaringType: PJavaType;
		FParameters: TList;
		procedure SetIsConstructor(Value: Boolean);
		function GetExceptionCount: Integer;
		function GetException(Index: Integer): string;
		procedure SetReturnType(Value: string);
		procedure SetReturnTypeDimension(Value: Integer);
		procedure SetBody(Value: string);
		procedure SetDeclaringType(Value: PJavaType);
		function GetParameterCount: Integer;
		function GetParameter(Index: Integer): PJavaParameter;
  public
		constructor Create; override;
		destructor Destroy; override;
		procedure AddException(Value: string);
		procedure InsertException(Index: Integer; Value: string);
		procedure DeleteException(Index: Integer);
		procedure AddParameter(Value: PJavaParameter);
		procedure RemoveParameter(Value: PJavaParameter);
		procedure InsertParameter(Index: Integer; Value: PJavaParameter);
		procedure DeleteParameter(Index: Integer);
		property IsConstructor: Boolean read FIsConstructor write SetIsConstructor;
		property ExceptionCount: Integer read GetExceptionCount;
		property Exceptions[Index: Integer]: string read GetException;
		property ReturnType: string read FReturnType write SetReturnType;
		property ReturnTypeDimension: Integer read FReturnTypeDimension write SetReturnTypeDimension;
		property Body: string read FBody write SetBody;
		property DeclaringType: PJavaType read FDeclaringType write SetDeclaringType;
		property ParameterCount: Integer read GetParameterCount;
		property Parameters[Index: Integer]: PJavaParameter read GetParameter;
  end;

	// PJavaPackage
	PJavaPackage = class(PJavaElement)
  private
		FPath: string;
		FIsDefaultPackage: Boolean;
		FCompilationUnits: TList;
		FTypes: TList;
		FSuperPackage: PJavaPackage;
		FSubPackages: TList;
		procedure SetPath(Value: string);
		procedure SetIsDefaultPackage(Value: Boolean);
		function GetCompilationUnitCount: Integer;
		function GetCompilationUnit(Index: Integer): PJavaCompilationUnit;
		function GetTypeCount: Integer;
		function GetType(Index: Integer): PJavaType;
		procedure SetSuperPackage(Value: PJavaPackage);
		function GetSubPackageCount: Integer;
		function GetSubPackage(Index: Integer): PJavaPackage;
  public
		constructor Create; override;
		destructor Destroy; override;
		procedure AddCompilationUnit(Value: PJavaCompilationUnit);
		procedure RemoveCompilationUnit(Value: PJavaCompilationUnit);
		procedure InsertCompilationUnit(Index: Integer; Value: PJavaCompilationUnit);
		procedure DeleteCompilationUnit(Index: Integer);
		procedure AddType(Value: PJavaType);
		procedure RemoveType(Value: PJavaType);
		procedure InsertType(Index: Integer; Value: PJavaType);
		procedure DeleteType(Index: Integer);
		procedure AddSubPackage(Value: PJavaPackage);
		procedure RemoveSubPackage(Value: PJavaPackage);
		procedure InsertSubPackage(Index: Integer; Value: PJavaPackage);
		procedure DeleteSubPackage(Index: Integer);
		property Path: string read FPath write SetPath;
		property IsDefaultPackage: Boolean read FIsDefaultPackage write SetIsDefaultPackage;
		property CompilationUnitCount: Integer read GetCompilationUnitCount;
		property CompilationUnits[Index: Integer]: PJavaCompilationUnit read GetCompilationUnit;
		property TypeCount: Integer read GetTypeCount;
		property Types[Index: Integer]: PJavaType read GetType;
		property SuperPackage: PJavaPackage read FSuperPackage write SetSuperPackage;
		property SubPackageCount: Integer read GetSubPackageCount;
		property SubPackages[Index: Integer]: PJavaPackage read GetSubPackage;
  end;

	// PJavaType
	PJavaType = class(PJavaMember)
  private
		FIsClass: Boolean;
		FIsInterface: Boolean;
		FIsLocal: Boolean;
		FIsMember: Boolean;
		FSuperClass: string;
		FSuperInterfaces: TStringList;
		FFields: TList;
		FMethods: TList;
		FInitializers: TList;
		FDeclaringType: PJavaType;
		FTypes: TList;
		FPackage: PJavaPackage;
		FCompilationUnit: PJavaCompilationUnit;
		procedure SetIsClass(Value: Boolean);
		procedure SetIsInterface(Value: Boolean);
		procedure SetIsLocal(Value: Boolean);
		procedure SetIsMember(Value: Boolean);
		procedure SetSuperClass(Value: string);
		function GetSuperInterfaceCount: Integer;
		function GetSuperInterface(Index: Integer): string;
		function GetFieldCount: Integer;
		function GetField(Index: Integer): PJavaField;
		function GetMethodCount: Integer;
		function GetMethod(Index: Integer): PJavaMethod;
		function GetInitializerCount: Integer;
		function GetInitializer(Index: Integer): PJavaInitializer;
		procedure SetDeclaringType(Value: PJavaType);
		function GetTypeCount: Integer;
		function GetType(Index: Integer): PJavaType;
		procedure SetPackage(Value: PJavaPackage);
		procedure SetCompilationUnit(Value: PJavaCompilationUnit);
  public
		constructor Create; override;
		destructor Destroy; override;
		procedure AddSuperInterface(Value: string);
		procedure InsertSuperInterface(Index: Integer; Value: string);
		procedure DeleteSuperInterface(Index: Integer);
		procedure AddField(Value: PJavaField);
		procedure RemoveField(Value: PJavaField);
		procedure InsertField(Index: Integer; Value: PJavaField);
		procedure DeleteField(Index: Integer);
		procedure AddMethod(Value: PJavaMethod);
		procedure RemoveMethod(Value: PJavaMethod);
		procedure InsertMethod(Index: Integer; Value: PJavaMethod);
		procedure DeleteMethod(Index: Integer);
		procedure AddInitializer(Value: PJavaInitializer);
		procedure RemoveInitializer(Value: PJavaInitializer);
		procedure InsertInitializer(Index: Integer; Value: PJavaInitializer);
		procedure DeleteInitializer(Index: Integer);
		procedure AddType(Value: PJavaType);
		procedure RemoveType(Value: PJavaType);
		procedure InsertType(Index: Integer; Value: PJavaType);
		procedure DeleteType(Index: Integer);
		property IsClass: Boolean read FIsClass write SetIsClass;
		property IsInterface: Boolean read FIsInterface write SetIsInterface;
		property IsLocal: Boolean read FIsLocal write SetIsLocal;
		property IsMember: Boolean read FIsMember write SetIsMember;
		property SuperClass: string read FSuperClass write SetSuperClass;
		property SuperInterfaceCount: Integer read GetSuperInterfaceCount;
		property SuperInterfaces[Index: Integer]: string read GetSuperInterface;
		property FieldCount: Integer read GetFieldCount;
		property Fields[Index: Integer]: PJavaField read GetField;
		property MethodCount: Integer read GetMethodCount;
		property Methods[Index: Integer]: PJavaMethod read GetMethod;
		property InitializerCount: Integer read GetInitializerCount;
		property Initializers[Index: Integer]: PJavaInitializer read GetInitializer;
		property DeclaringType: PJavaType read FDeclaringType write SetDeclaringType;
		property TypeCount: Integer read GetTypeCount;
		property Types[Index: Integer]: PJavaType read GetType;
		property Package: PJavaPackage read FPackage write SetPackage;
		property CompilationUnit: PJavaCompilationUnit read FCompilationUnit write SetCompilationUnit;
  end;

	// PJavaPackageDeclaration
	PJavaPackageDeclaration = class(PJavaElement)
  private
		FCompilationUnit: PJavaCompilationUnit;
		procedure SetCompilationUnit(Value: PJavaCompilationUnit);
  public
		property CompilationUnit: PJavaCompilationUnit read FCompilationUnit write SetCompilationUnit;
  end;

	// PJavaParameter
	PJavaParameter = class(PJavaElement)
  private
		FType_: string;
		FTypeDimension: Integer;
		FIsFinal: Boolean;
		FMethod: PJavaMethod;
		procedure SetType_(Value: string);
		procedure SetTypeDimension(Value: Integer);
		procedure SetIsFinal(Value: Boolean);
		procedure SetMethod(Value: PJavaMethod);
  public
		property Type_: string read FType_ write SetType_;
		property TypeDimension: Integer read FTypeDimension write SetTypeDimension;
		property IsFinal: Boolean read FIsFinal write SetIsFinal;
		property Method: PJavaMethod read FMethod write SetMethod;
  end;

implementation

uses
  System.Types;

/////////////////////////////////////////////////////////////////////////////
// TJavaElement

procedure PJavaElement.SetName(Value : string);
begin
  FName := Value;
end;

procedure PJavaElement.SetDocumentation(Value : string);
begin
  FDocumentation := Value;
end;

procedure PJavaElement.SetLine(Value : Integer);
begin
  FLine := Value;
end;

procedure PJavaElement.SetOffset(Value : Integer);
begin
  FOffset := Value;
end;

procedure PJavaElement.SetLength(Value : Integer);
begin
  FLength := Value;
end;

// TJavaElement
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// TJavaCompilationUnit

constructor PJavaCompilationUnit.Create;
begin
  inherited Create;
	FImports := TList.Create;
	FDeclaredTypes := TList.Create;
end;

destructor PJavaCompilationUnit.Destroy;
var
  I: Integer;
begin
	for I := FImports.Count - 1 downto 0 do begin
		GetImport(I).Free;
		FImports.Delete(I);
	end;
	FImports.Free;
	FDeclaredTypes.Free;
	inherited;
end;

procedure PJavaCompilationUnit.SetFileName(Value : string);
begin
  FFileName := Value;
end;

function PJavaCompilationUnit.GetImportCount: Integer;
begin
  Result := FImports.Count;
end;

function PJavaCompilationUnit.GetImport(Index: Integer): PJavaImport;
begin
  Result := FImports[Index];
end;

procedure PJavaCompilationUnit.AddImport(Value: PJavaImport);
begin
  if FImports.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FImports.Add(Value);
    Value.FCompilationUnit := Self;
  end;
end;

procedure PJavaCompilationUnit.RemoveImport(Value: PJavaImport);
begin
  if FImports.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FImports.Remove(Value);
    Value.FCompilationUnit := nil;
  end;
end;

procedure PJavaCompilationUnit.InsertImport(Index: Integer; Value: PJavaImport);
begin
  if (Index < 0) or (Index > FImports.Count - 1) then Exit;
  if FImports.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FImports.Insert(Index, Value);
    Value.FCompilationUnit := Self;
  end;
end;

procedure PJavaCompilationUnit.DeleteImport(Index: Integer);
begin
  if (Index < 0) or (Index > FImports.Count - 1) then Exit;
  RemoveImport(GetImport(Index));
end;

procedure PJavaCompilationUnit.SetPackage(Value: PJavaPackage);
begin
  if FPackage <> Value then begin
    if Package <> nil then FPackage.FCompilationUnits.Remove(Self);
    FPackage := Value;
    if FPackage <> nil then FPackage.FCompilationUnits.Add(Self);
  end;
end;

function PJavaCompilationUnit.GetDeclaredTypeCount: Integer;
begin
  Result := FDeclaredTypes.Count;
end;

function PJavaCompilationUnit.GetDeclaredType(Index: Integer): PJavaType;
begin
  Result := FDeclaredTypes[Index];
end;

procedure PJavaCompilationUnit.AddDeclaredType(Value: PJavaType);
begin
  if FDeclaredTypes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FDeclaredTypes.Add(Value);
    Value.FCompilationUnit := Self;
  end;
end;

procedure PJavaCompilationUnit.RemoveDeclaredType(Value: PJavaType);
begin
  if FDeclaredTypes.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FDeclaredTypes.Remove(Value);
    Value.FCompilationUnit := nil;
  end;
end;

procedure PJavaCompilationUnit.InsertDeclaredType(Index: Integer; Value: PJavaType);
begin
  if (Index < 0) or (Index > FDeclaredTypes.Count - 1) then Exit;
  if FDeclaredTypes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FDeclaredTypes.Insert(Index, Value);
    Value.FCompilationUnit := Self;
  end;
end;

procedure PJavaCompilationUnit.DeleteDeclaredType(Index: Integer);
begin
  if (Index < 0) or (Index > FDeclaredTypes.Count - 1) then Exit;
  RemoveDeclaredType(GetDeclaredType(Index));
end;

procedure PJavaCompilationUnit.SetPackageDeclaration(Value: PJavaPackageDeclaration);
begin
  if FPackageDeclaration <> Value then begin
    if FPackageDeclaration <> nil then FPackageDeclaration.FCompilationUnit := nil;
    FPackageDeclaration := Value;
    if FPackageDeclaration <> nil then FPackageDeclaration.FCompilationUnit := Self;
  end;
end;

// TJavaCompilationUnit
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// TJavaField

procedure PJavaField.SetType_(Value : string);
begin
  FType_ := Value;
end;

procedure PJavaField.SetTypeDimension(Value : Integer);
begin
  FTypeDimension := Value;
end;

procedure PJavaField.SetInitializerExpression(Value : string);
begin
  FInitializerExpression := Value;
end;

procedure PJavaField.SetDeclaringType(Value: PJavaType);
begin
  if FDeclaringType <> Value then begin
    if DeclaringType <> nil then FDeclaringType.FFields.Remove(Self);
    FDeclaringType := Value;
    if FDeclaringType <> nil then FDeclaringType.FFields.Add(Self);
  end;
end;

// TJavaField
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// TJavaImport

constructor PJavaImport.Create;
begin
  inherited Create;
	FPathFragments := TStringList.Create;
end;

destructor PJavaImport.Destroy;
begin
	FPathFragments.Free;
	inherited;
end;

procedure PJavaImport.SetIsOnDemand(Value : Boolean);
begin
  FIsOnDemand := Value;
end;

function PJavaImport.GetPathFragmentCount: Integer;
begin
  Result := FPathFragments.Count;
end;

function PJavaImport.GetPathFragment(Index: Integer): string;
begin
  Result := FPathFragments[Index];
end;

procedure PJavaImport.AddPathFragment(Value: string);
begin
  FPathFragments.Add(Value);
end;

procedure PJavaImport.InsertPathFragment(Index: Integer; Value: string);
begin
  FPathFragments.Insert(Index, Value);
end;

procedure PJavaImport.DeletePathFragment(Index: Integer);
begin
  FPathFragments.Delete(Index);
end;

procedure PJavaImport.SetCompilationUnit(Value: PJavaCompilationUnit);
begin
  if FCompilationUnit <> Value then begin
    if CompilationUnit <> nil then FCompilationUnit.FImports.Remove(Self);
    FCompilationUnit := Value;
    if FCompilationUnit <> nil then FCompilationUnit.FImports.Add(Self);
  end;
end;

// TJavaImport
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// TJavaInitializer

procedure PJavaInitializer.SetBody(Value : string);
begin
  FBody := Value;
end;

procedure PJavaInitializer.SetDeclaringType(Value: PJavaType);
begin
  if FDeclaringType <> Value then begin
    if DeclaringType <> nil then FDeclaringType.FInitializers.Remove(Self);
    FDeclaringType := Value;
    if FDeclaringType <> nil then FDeclaringType.FInitializers.Add(Self);
  end;
end;

// TJavaInitializer
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// TJavaMember

procedure PJavaMember.SetVisibility(Value : PVisibilityKind);
begin
  FVisibility := Value;
end;

procedure PJavaMember.SetIsAbstract(Value : Boolean);
begin
  FIsAbstract := Value;
end;

procedure PJavaMember.SetIsFinal(Value : Boolean);
begin
  FIsFinal := Value;
end;

procedure PJavaMember.SetIsNative(Value : Boolean);
begin
  FIsNative := Value;
end;

procedure PJavaMember.SetIsStatic(Value : Boolean);
begin
  FIsStatic := Value;
end;

procedure PJavaMember.SetIsStrictfp(Value : Boolean);
begin
  FIsStrictfp := Value;
end;

procedure PJavaMember.SetIsSynchronized(Value : Boolean);
begin
  FIsSynchronized := Value;
end;

procedure PJavaMember.SetIsTransient(Value : Boolean);
begin
  FIsTransient := Value;
end;

procedure PJavaMember.SetIsVolatile(Value : Boolean);
begin
  FIsVolatile := Value;
end;

// TJavaMember
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// TJavaMethod

constructor PJavaMethod.Create;
begin
  inherited Create;
	FExceptions := TStringList.Create;
	FParameters := TList.Create;
end;

destructor PJavaMethod.Destroy;
var
  I: Integer;
begin
	FExceptions.Free;
	for I := FParameters.Count - 1 downto 0 do begin
		GetParameter(I).Free;
		FParameters.Delete(I);
	end;
	FParameters.Free;
	inherited;
end;

procedure PJavaMethod.SetIsConstructor(Value : Boolean);
begin
  FIsConstructor := Value;
end;

function PJavaMethod.GetExceptionCount: Integer;
begin
  Result := FExceptions.Count;
end;

function PJavaMethod.GetException(Index: Integer): string;
begin
  Result := FExceptions[Index];
end;

procedure PJavaMethod.AddException(Value: string);
begin
  FExceptions.Add(Value);
end;

procedure PJavaMethod.InsertException(Index: Integer; Value: string);
begin
  FExceptions.Insert(Index, Value);
end;

procedure PJavaMethod.DeleteException(Index: Integer);
begin
  FExceptions.Delete(Index);
end;

procedure PJavaMethod.SetReturnType(Value : string);
begin
  FReturnType := Value;
end;

procedure PJavaMethod.SetReturnTypeDimension(Value : Integer);
begin
  FReturnTypeDimension := Value;
end;

procedure PJavaMethod.SetBody(Value : string);
begin
  FBody := Value;
end;

procedure PJavaMethod.SetDeclaringType(Value: PJavaType);
begin
  if FDeclaringType <> Value then begin
    if DeclaringType <> nil then FDeclaringType.FMethods.Remove(Self);
    FDeclaringType := Value;
    if FDeclaringType <> nil then FDeclaringType.FMethods.Add(Self);
  end;
end;

function PJavaMethod.GetParameterCount: Integer;
begin
  Result := FParameters.Count;
end;

function PJavaMethod.GetParameter(Index: Integer): PJavaParameter;
begin
  Result := FParameters[Index];
end;

procedure PJavaMethod.AddParameter(Value: PJavaParameter);
begin
  if FParameters.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FParameters.Add(Value);
    Value.FMethod := Self;
  end;
end;

procedure PJavaMethod.RemoveParameter(Value: PJavaParameter);
begin
  if FParameters.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FParameters.Remove(Value);
    Value.FMethod := nil;
  end;
end;

procedure PJavaMethod.InsertParameter(Index: Integer; Value: PJavaParameter);
begin
  if (Index < 0) or (Index > FParameters.Count - 1) then Exit;
  if FParameters.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FParameters.Insert(Index, Value);
    Value.FMethod := Self;
  end;
end;

procedure PJavaMethod.DeleteParameter(Index: Integer);
begin
  if (Index < 0) or (Index > FParameters.Count - 1) then Exit;
  RemoveParameter(GetParameter(Index));
end;

// TJavaMethod
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// TJavaPackage

constructor PJavaPackage.Create;
begin
  inherited Create;
	FCompilationUnits := TList.Create;
	FTypes := TList.Create;
	FSubPackages := TList.Create;
end;

destructor PJavaPackage.Destroy;
var
  I: Integer;
begin
	FCompilationUnits.Free;
	for I := FTypes.Count - 1 downto 0 do begin
		GetType(I).Free;
		FTypes.Delete(I);
	end;
	FTypes.Free;
	for I := FSubPackages.Count - 1 downto 0 do begin
		GetSubPackage(I).Free;
		FSubPackages.Delete(I);
	end;
	FSubPackages.Free;
	inherited;
end;

procedure PJavaPackage.SetPath(Value : string);
begin
  FPath := Value;
end;

procedure PJavaPackage.SetIsDefaultPackage(Value : Boolean);
begin
  FIsDefaultPackage := Value;
end;

function PJavaPackage.GetCompilationUnitCount: Integer;
begin
  Result := FCompilationUnits.Count;
end;

function PJavaPackage.GetCompilationUnit(Index: Integer): PJavaCompilationUnit;
begin
  Result := FCompilationUnits[Index];
end;

procedure PJavaPackage.AddCompilationUnit(Value: PJavaCompilationUnit);
begin
  if FCompilationUnits.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FCompilationUnits.Add(Value);
    Value.FPackage := Self;
  end;
end;

procedure PJavaPackage.RemoveCompilationUnit(Value: PJavaCompilationUnit);
begin
  if FCompilationUnits.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FCompilationUnits.Remove(Value);
    Value.FPackage := nil;
  end;
end;

procedure PJavaPackage.InsertCompilationUnit(Index: Integer; Value: PJavaCompilationUnit);
begin
  if (Index < 0) or (Index > FCompilationUnits.Count - 1) then Exit;
  if FCompilationUnits.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FCompilationUnits.Insert(Index, Value);
    Value.FPackage := Self;
  end;
end;

procedure PJavaPackage.DeleteCompilationUnit(Index: Integer);
begin
  if (Index < 0) or (Index > FCompilationUnits.Count - 1) then Exit;
  RemoveCompilationUnit(GetCompilationUnit(Index));
end;

function PJavaPackage.GetTypeCount: Integer;
begin
  Result := FTypes.Count;
end;

function PJavaPackage.GetType(Index: Integer): PJavaType;
begin
  Result := FTypes[Index];
end;

procedure PJavaPackage.AddType(Value: PJavaType);
begin
  if FTypes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypes.Add(Value);
    Value.FPackage := Self;
  end;
end;

procedure PJavaPackage.RemoveType(Value: PJavaType);
begin
  if FTypes.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FTypes.Remove(Value);
    Value.FPackage := nil;
  end;
end;

procedure PJavaPackage.InsertType(Index: Integer; Value: PJavaType);
begin
  if (Index < 0) or (Index > FTypes.Count - 1) then Exit;
  if FTypes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypes.Insert(Index, Value);
    Value.FPackage := Self;
  end;
end;

procedure PJavaPackage.DeleteType(Index: Integer);
begin
  if (Index < 0) or (Index > FTypes.Count - 1) then Exit;
  RemoveType(GetType(Index));
end;

procedure PJavaPackage.SetSuperPackage(Value: PJavaPackage);
begin
  if FSuperPackage <> Value then begin
    if SuperPackage <> nil then FSuperPackage.FSubPackages.Remove(Self);
    FSuperPackage := Value;
    if FSuperPackage <> nil then FSuperPackage.FSubPackages.Add(Self);
  end;
end;

function PJavaPackage.GetSubPackageCount: Integer;
begin
  Result := FSubPackages.Count;
end;

function PJavaPackage.GetSubPackage(Index: Integer): PJavaPackage;
begin
  Result := FSubPackages[Index];
end;

procedure PJavaPackage.AddSubPackage(Value: PJavaPackage);
begin
  if FSubPackages.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FSubPackages.Add(Value);
    Value.FSuperPackage := Self;
  end;
end;

procedure PJavaPackage.RemoveSubPackage(Value: PJavaPackage);
begin
  if FSubPackages.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FSubPackages.Remove(Value);
    Value.FSuperPackage := nil;
  end;
end;

procedure PJavaPackage.InsertSubPackage(Index: Integer; Value: PJavaPackage);
begin
  if (Index < 0) or (Index > FSubPackages.Count - 1) then Exit;
  if FSubPackages.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FSubPackages.Insert(Index, Value);
    Value.FSuperPackage := Self;
  end;
end;

procedure PJavaPackage.DeleteSubPackage(Index: Integer);
begin
  if (Index < 0) or (Index > FSubPackages.Count - 1) then Exit;
  RemoveSubPackage(GetSubPackage(Index));
end;

// TJavaPackage
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// TJavaType

constructor PJavaType.Create;
begin
  inherited Create;
	FSuperInterfaces := TStringList.Create;
	FFields := TList.Create;
	FMethods := TList.Create;
	FInitializers := TList.Create;
	FTypes := TList.Create;
end;

destructor PJavaType.Destroy;
var
  I: Integer;
begin
	FSuperInterfaces.Free;
	for I := FFields.Count - 1 downto 0 do begin
		GetField(I).Free;
		FFields.Delete(I);
	end;
	FFields.Free;
	for I := FMethods.Count - 1 downto 0 do begin
		GetMethod(I).Free;
		FMethods.Delete(I);
	end;
	FMethods.Free;
	for I := FInitializers.Count - 1 downto 0 do begin
		GetInitializer(I).Free;
		FInitializers.Delete(I);
	end;
	FInitializers.Free;
	for I := FTypes.Count - 1 downto 0 do begin
		GetType(I).Free;
		FTypes.Delete(I);
	end;
	FTypes.Free;
	inherited;
end;

procedure PJavaType.SetIsClass(Value : Boolean);
begin
  FIsClass := Value;
end;

procedure PJavaType.SetIsInterface(Value : Boolean);
begin
  FIsInterface := Value;
end;

procedure PJavaType.SetIsLocal(Value : Boolean);
begin
  FIsLocal := Value;
end;

procedure PJavaType.SetIsMember(Value : Boolean);
begin
  FIsMember := Value;
end;

procedure PJavaType.SetSuperClass(Value : string);
begin
  FSuperClass := Value;
end;

function PJavaType.GetSuperInterfaceCount: Integer;
begin
  Result := FSuperInterfaces.Count;
end;

function PJavaType.GetSuperInterface(Index: Integer): string;
begin
  Result := FSuperInterfaces[Index];
end;

procedure PJavaType.AddSuperInterface(Value: string);
begin
  FSuperInterfaces.Add(Value);
end;

procedure PJavaType.InsertSuperInterface(Index: Integer; Value: string);
begin
  FSuperInterfaces.Insert(Index, Value);
end;

procedure PJavaType.DeleteSuperInterface(Index: Integer);
begin
  FSuperInterfaces.Delete(Index);
end;

function PJavaType.GetFieldCount: Integer;
begin
  Result := FFields.Count;
end;

function PJavaType.GetField(Index: Integer): PJavaField;
begin
  Result := FFields[Index];
end;

procedure PJavaType.AddField(Value: PJavaField);
begin
  if FFields.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FFields.Add(Value);
    Value.FDeclaringType := Self;
  end;
end;

procedure PJavaType.RemoveField(Value: PJavaField);
begin
  if FFields.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FFields.Remove(Value);
    Value.FDeclaringType := nil;
  end;
end;

procedure PJavaType.InsertField(Index: Integer; Value: PJavaField);
begin
  if (Index < 0) or (Index > FFields.Count - 1) then Exit;
  if FFields.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FFields.Insert(Index, Value);
    Value.FDeclaringType := Self;
  end;
end;

procedure PJavaType.DeleteField(Index: Integer);
begin
  if (Index < 0) or (Index > FFields.Count - 1) then Exit;
  RemoveField(GetField(Index));
end;

function PJavaType.GetMethodCount: Integer;
begin
  Result := FMethods.Count;
end;

function PJavaType.GetMethod(Index: Integer): PJavaMethod;
begin
  Result := FMethods[Index];
end;

procedure PJavaType.AddMethod(Value: PJavaMethod);
begin
  if FMethods.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FMethods.Add(Value);
    Value.FDeclaringType := Self;
  end;
end;

procedure PJavaType.RemoveMethod(Value: PJavaMethod);
begin
  if FMethods.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FMethods.Remove(Value);
    Value.FDeclaringType := nil;
  end;
end;

procedure PJavaType.InsertMethod(Index: Integer; Value: PJavaMethod);
begin
  if (Index < 0) or (Index > FMethods.Count - 1) then Exit;
  if FMethods.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FMethods.Insert(Index, Value);
    Value.FDeclaringType := Self;
  end;
end;

procedure PJavaType.DeleteMethod(Index: Integer);
begin
  if (Index < 0) or (Index > FMethods.Count - 1) then Exit;
  RemoveMethod(GetMethod(Index));
end;

function PJavaType.GetInitializerCount: Integer;
begin
  Result := FInitializers.Count;
end;

function PJavaType.GetInitializer(Index: Integer): PJavaInitializer;
begin
  Result := FInitializers[Index];
end;

procedure PJavaType.AddInitializer(Value: PJavaInitializer);
begin
  if FInitializers.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FInitializers.Add(Value);
    Value.FDeclaringType := Self;
  end;
end;

procedure PJavaType.RemoveInitializer(Value: PJavaInitializer);
begin
  if FInitializers.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FInitializers.Remove(Value);
    Value.FDeclaringType := nil;
  end;
end;

procedure PJavaType.InsertInitializer(Index: Integer; Value: PJavaInitializer);
begin
  if (Index < 0) or (Index > FInitializers.Count - 1) then Exit;
  if FInitializers.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FInitializers.Insert(Index, Value);
    Value.FDeclaringType := Self;
  end;
end;

procedure PJavaType.DeleteInitializer(Index: Integer);
begin
  if (Index < 0) or (Index > FInitializers.Count - 1) then Exit;
  RemoveInitializer(GetInitializer(Index));
end;

procedure PJavaType.SetDeclaringType(Value: PJavaType);
begin
  if FDeclaringType <> Value then begin
    if DeclaringType <> nil then FDeclaringType.FTypes.Remove(Self);
    FDeclaringType := Value;
    if FDeclaringType <> nil then FDeclaringType.FTypes.Add(Self);
  end;
end;

function PJavaType.GetTypeCount: Integer;
begin
  Result := FTypes.Count;
end;

function PJavaType.GetType(Index: Integer): PJavaType;
begin
  Result := FTypes[Index];
end;

procedure PJavaType.AddType(Value: PJavaType);
begin
  if FTypes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypes.Add(Value);
    Value.FDeclaringType := Self;
  end;
end;

procedure PJavaType.RemoveType(Value: PJavaType);
begin
  if FTypes.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FTypes.Remove(Value);
    Value.FDeclaringType := nil;
  end;
end;

procedure PJavaType.InsertType(Index: Integer; Value: PJavaType);
begin
  if (Index < 0) or (Index > FTypes.Count - 1) then Exit;
  if FTypes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTypes.Insert(Index, Value);
    Value.FDeclaringType := Self;
  end;
end;

procedure PJavaType.DeleteType(Index: Integer);
begin
  if (Index < 0) or (Index > FTypes.Count - 1) then Exit;
  RemoveType(GetType(Index));
end;

procedure PJavaType.SetPackage(Value: PJavaPackage);
begin
  if FPackage <> Value then begin
    if Package <> nil then FPackage.FTypes.Remove(Self);
    FPackage := Value;
    if FPackage <> nil then FPackage.FTypes.Add(Self);
  end;
end;

procedure PJavaType.SetCompilationUnit(Value: PJavaCompilationUnit);
begin
  if FCompilationUnit <> Value then begin
    if CompilationUnit <> nil then FCompilationUnit.FDeclaredTypes.Remove(Self);
    FCompilationUnit := Value;
    if FCompilationUnit <> nil then FCompilationUnit.FDeclaredTypes.Add(Self);
  end;
end;

// TJavaType
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// TJavaPackageDeclaration

procedure PJavaPackageDeclaration.SetCompilationUnit(Value: PJavaCompilationUnit);
begin
  if FCompilationUnit <> Value then begin
    if FCompilationUnit <> nil then FCompilationUnit.FPackageDeclaration := nil;
    FCompilationUnit := Value;
    if FCompilationUnit <> nil then FCompilationUnit.FPackageDeclaration := Self;
  end;
end;

// TJavaPackageDeclaration
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// TJavaParameter

procedure PJavaParameter.SetType_(Value : string);
begin
  FType_ := Value;
end;

procedure PJavaParameter.SetTypeDimension(Value : Integer);
begin
  FTypeDimension := Value;
end;

procedure PJavaParameter.SetIsFinal(Value : Boolean);
begin
  FIsFinal := Value;
end;

procedure PJavaParameter.SetMethod(Value: PJavaMethod);
begin
  if FMethod <> Value then begin
    if Method <> nil then FMethod.FParameters.Remove(Self);
    FMethod := Value;
    if FMethod <> nil then FMethod.FParameters.Add(Self);
  end;
end;

// TJavaParameter
/////////////////////////////////////////////////////////////////////////////


end.
