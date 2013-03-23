unit JavaElementsAuto;

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
  RevCore, JavaElements,
  Classes, ComObj, ActiveX, WSJavaParser_TLB;

type
	// forward declarations
	PJavaElementAuto = class;
	PJavaCompilationUnitAuto = class;
	PJavaFieldAuto = class;
	PJavaImportAuto = class;
	PJavaInitializerAuto = class;
	PJavaMemberAuto = class;
	PJavaMethodAuto = class;
	PJavaPackageAuto = class;
	PJavaTypeAuto = class;
	PJavaPackageDeclarationAuto = class;
	PJavaParameterAuto = class;

	PJavaElementAuto = class(PAutoObject, IJavaElement)
  protected
		function Get_Name: WideString; safecall;
		function Get_Documentation: WideString; safecall;
		function Get_Line: Integer; safecall;
		function Get_Offset: Integer; safecall;
		function Get_Length: Integer; safecall;
  end;

	PJavaCompilationUnitAuto = class(PAutoObject, IJavaCompilationUnit)
  protected
		function Get_FileName: WideString; safecall;
		function GetImportCount: Integer; safecall;
		function GetImportAt(Index: Integer): IJavaImport; safecall;
		function Get_Package: IJavaPackage; safecall;
		function GetDeclaredTypeCount: Integer; safecall;
		function GetDeclaredTypeAt(Index: Integer): IJavaType; safecall;
		function Get_PackageDeclaration: IJavaPackageDeclaration; safecall;
  end;

	PJavaMemberAuto = class(PJavaElementAuto, IJavaMember)
  protected
		function Get_Visibility: VisibilityKind; safecall;
		function Get_IsAbstract: WordBool; safecall;
		function Get_IsFinal: WordBool; safecall;
		function Get_IsNative: WordBool; safecall;
		function Get_IsStatic: WordBool; safecall;
		function Get_IsStrictfp: WordBool; safecall;
		function Get_IsSynchronized: WordBool; safecall;
		function Get_IsTransient: WordBool; safecall;
		function Get_IsVolatile: WordBool; safecall;
  end;

	PJavaFieldAuto = class(PJavaMemberAuto, IJavaField)
  protected
		function Get_Type_: WideString; safecall;
		function Get_TypeDimension: Integer; safecall;
		function Get_InitializerExpression: WideString; safecall;
		function Get_DeclaringType: IJavaType; safecall;
  end;

	PJavaImportAuto = class(PJavaElementAuto, IJavaImport)
  protected
		function Get_IsOnDemand: WordBool; safecall;
		function GetPathFragmentCount: Integer; safecall;
		function GetPathFragmentAt(Index: Integer): WideString; safecall;
		function Get_CompilationUnit: IJavaCompilationUnit; safecall;
  end;

	PJavaInitializerAuto = class(PJavaMemberAuto, IJavaInitializer)
  protected
		function Get_Body: WideString; safecall;
		function Get_DeclaringType: IJavaType; safecall;
  end;

	PJavaMethodAuto = class(PJavaMemberAuto, IJavaMethod)
  protected
		function Get_IsConstructor: WordBool; safecall;
		function GetExceptionCount: Integer; safecall;
		function GetExceptionAt(Index: Integer): WideString; safecall;
		function Get_ReturnType: WideString; safecall;
		function Get_ReturnTypeDimension: Integer; safecall;
		function Get_Body: WideString; safecall;
		function Get_DeclaringType: IJavaType; safecall;
		function GetParameterCount: Integer; safecall;
		function GetParameterAt(Index: Integer): IJavaParameter; safecall;
  end;

	PJavaPackageAuto = class(PJavaElementAuto, IJavaPackage)
  protected
		function Get_Path: WideString; safecall;
		function Get_IsDefaultPackage: WordBool; safecall;
		function GetCompilationUnitCount: Integer; safecall;
		function GetCompilationUnitAt(Index: Integer): IJavaCompilationUnit; safecall;
		function GetTypeCount: Integer; safecall;
		function GetTypeAt(Index: Integer): IJavaType; safecall;
		function Get_SuperPackage: IJavaPackage; safecall;
		function GetSubPackageCount: Integer; safecall;
		function GetSubPackageAt(Index: Integer): IJavaPackage; safecall;
  end;

	PJavaTypeAuto = class(PJavaMemberAuto, IJavaType)
  protected
		function Get_IsClass: WordBool; safecall;
		function Get_IsInterface: WordBool; safecall;
		function Get_IsLocal: WordBool; safecall;
		function Get_IsMember: WordBool; safecall;
		function Get_SuperClass: WideString; safecall;
		function GetSuperInterfaceCount: Integer; safecall;
		function GetSuperInterfaceAt(Index: Integer): WideString; safecall;
		function GetFieldCount: Integer; safecall;
		function GetFieldAt(Index: Integer): IJavaField; safecall;
		function GetMethodCount: Integer; safecall;
		function GetMethodAt(Index: Integer): IJavaMethod; safecall;
		function GetInitializerCount: Integer; safecall;
		function GetInitializerAt(Index: Integer): IJavaInitializer; safecall;
		function Get_DeclaringType: IJavaType; safecall;
		function GetTypeCount: Integer; safecall;
		function GetTypeAt(Index: Integer): IJavaType; safecall;
		function Get_Package: IJavaPackage; safecall;
		function Get_CompilationUnit: IJavaCompilationUnit; safecall;
  end;

	PJavaPackageDeclarationAuto = class(PJavaElementAuto, IJavaPackageDeclaration)
  protected
		function Get_CompilationUnit: IJavaCompilationUnit; safecall;
  end;

	PJavaParameterAuto = class(PJavaElementAuto, IJavaParameter)
  protected
		function Get_Type_: WideString; safecall;
		function Get_TypeDimension: Integer; safecall;
		function Get_IsFinal: WordBool; safecall;
		function Get_Method: IJavaMethod; safecall;
  end;

implementation

/////////////////////////////////////////////////////////////////////////////
// PJavaElementAuto

function PJavaElementAuto.Get_Name: WideString;
begin
  Result := (FTargetObject as PJavaElement).Name;
end;

function PJavaElementAuto.Get_Documentation: WideString;
begin
  Result := (FTargetObject as PJavaElement).Documentation;
end;

function PJavaElementAuto.Get_Line: Integer;
begin
  Result := (FTargetObject as PJavaElement).Line;
end;

function PJavaElementAuto.Get_Offset: Integer;
begin
  Result := (FTargetObject as PJavaElement).Offset;
end;

function PJavaElementAuto.Get_Length: Integer;
begin
  Result := (FTargetObject as PJavaElement).Length;
end;

// PJavaElementAuto
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PJavaCompilationUnitAuto

function PJavaCompilationUnitAuto.Get_FileName: WideString;
begin
  Result := (FTargetObject as PJavaCompilationUnit).FileName;
end;

function PJavaCompilationUnitAuto.GetImportCount: Integer;
begin
  Result := (FTargetObject as PJavaCompilationUnit).ImportCount;
end;

function PJavaCompilationUnitAuto.GetImportAt(Index: Integer): IJavaImport;
var
  R: PJavaImport;
begin
  R := (FTargetObject as PJavaCompilationUnit).Imports[Index];
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaImport;
end;

function PJavaCompilationUnitAuto.Get_Package: IJavaPackage;
var
  R: PJavaPackage;
begin
  R := (FTargetObject as PJavaCompilationUnit).Package;
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaPackage;
end;

function PJavaCompilationUnitAuto.GetDeclaredTypeCount: Integer;
begin
  Result := (FTargetObject as PJavaCompilationUnit).DeclaredTypeCount;
end;

function PJavaCompilationUnitAuto.GetDeclaredTypeAt(Index: Integer): IJavaType;
var
  R: PJavaType;
begin
  R := (FTargetObject as PJavaCompilationUnit).DeclaredTypes[Index];
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaType;
end;

function PJavaCompilationUnitAuto.Get_PackageDeclaration: IJavaPackageDeclaration;
var
  R: PJavaPackageDeclaration;
begin
  R := (FTargetObject as PJavaCompilationUnit).PackageDeclaration;
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaPackageDeclaration;
end;

// PJavaCompilationUnitAuto
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PJavaFieldAuto

function PJavaFieldAuto.Get_Type_: WideString;
begin
  Result := (FTargetObject as PJavaField).Type_;
end;

function PJavaFieldAuto.Get_TypeDimension: Integer;
begin
  Result := (FTargetObject as PJavaField).TypeDimension;
end;

function PJavaFieldAuto.Get_InitializerExpression: WideString;
begin
  Result := (FTargetObject as PJavaField).InitializerExpression;
end;

function PJavaFieldAuto.Get_DeclaringType: IJavaType;
var
  R: PJavaType;
begin
  R := (FTargetObject as PJavaField).DeclaringType;
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaType;
end;

// PJavaFieldAuto
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PJavaImportAuto

function PJavaImportAuto.Get_IsOnDemand: WordBool;
begin
  Result := (FTargetObject as PJavaImport).IsOnDemand;
end;

function PJavaImportAuto.GetPathFragmentCount: Integer;
begin
  Result := (FTargetObject as PJavaImport).PathFragmentCount;
end;

function PJavaImportAuto.GetPathFragmentAt(Index: Integer): WideString;
begin
  Result := (FTargetObject as PJavaImport).PathFragments[Index];
end;

function PJavaImportAuto.Get_CompilationUnit: IJavaCompilationUnit;
var
  R: PJavaCompilationUnit;
begin
  R := (FTargetObject as PJavaImport).CompilationUnit;
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaCompilationUnit;
end;

// PJavaImportAuto
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PJavaInitializerAuto

function PJavaInitializerAuto.Get_Body: WideString;
begin
  Result := (FTargetObject as PJavaInitializer).Body;
end;

function PJavaInitializerAuto.Get_DeclaringType: IJavaType;
var
  R: PJavaType;
begin
  R := (FTargetObject as PJavaInitializer).DeclaringType;
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaType;
end;

// PJavaInitializerAuto
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PJavaMemberAuto

function PJavaMemberAuto.Get_Visibility: VisibilityKind;
begin
  Result := Ord((FTargetObject as PJavaMember).Visibility);
end;

function PJavaMemberAuto.Get_IsAbstract: WordBool;
begin
  Result := (FTargetObject as PJavaMember).IsAbstract;
end;

function PJavaMemberAuto.Get_IsFinal: WordBool;
begin
  Result := (FTargetObject as PJavaMember).IsFinal;
end;

function PJavaMemberAuto.Get_IsNative: WordBool;
begin
  Result := (FTargetObject as PJavaMember).IsNative;
end;

function PJavaMemberAuto.Get_IsStatic: WordBool;
begin
  Result := (FTargetObject as PJavaMember).IsStatic;
end;

function PJavaMemberAuto.Get_IsStrictfp: WordBool;
begin
  Result := (FTargetObject as PJavaMember).IsStrictfp;
end;

function PJavaMemberAuto.Get_IsSynchronized: WordBool;
begin
  Result := (FTargetObject as PJavaMember).IsSynchronized;
end;

function PJavaMemberAuto.Get_IsTransient: WordBool;
begin
  Result := (FTargetObject as PJavaMember).IsTransient;
end;

function PJavaMemberAuto.Get_IsVolatile: WordBool;
begin
  Result := (FTargetObject as PJavaMember).IsVolatile;
end;

// PJavaMemberAuto
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PJavaMethodAuto

function PJavaMethodAuto.Get_IsConstructor: WordBool;
begin
  Result := (FTargetObject as PJavaMethod).IsConstructor;
end;

function PJavaMethodAuto.GetExceptionCount: Integer;
begin
  Result := (FTargetObject as PJavaMethod).ExceptionCount;
end;

function PJavaMethodAuto.GetExceptionAt(Index: Integer): WideString;
begin
  Result := (FTargetObject as PJavaMethod).Exceptions[Index];
end;

function PJavaMethodAuto.Get_ReturnType: WideString;
begin
  Result := (FTargetObject as PJavaMethod).ReturnType;
end;

function PJavaMethodAuto.Get_ReturnTypeDimension: Integer;
begin
  Result := (FTargetObject as PJavaMethod).ReturnTypeDimension;
end;

function PJavaMethodAuto.Get_Body: WideString;
begin
  Result := (FTargetObject as PJavaMethod).Body;
end;

function PJavaMethodAuto.Get_DeclaringType: IJavaType;
var
  R: PJavaType;
begin
  R := (FTargetObject as PJavaMethod).DeclaringType;
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaType;
end;

function PJavaMethodAuto.GetParameterCount: Integer;
begin
  Result := (FTargetObject as PJavaMethod).ParameterCount;
end;

function PJavaMethodAuto.GetParameterAt(Index: Integer): IJavaParameter;
var
  R: PJavaParameter;
begin
  R := (FTargetObject as PJavaMethod).Parameters[Index];
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaParameter;
end;

// PJavaMethodAuto
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PJavaPackageAuto

function PJavaPackageAuto.Get_Path: WideString;
begin
  Result := (FTargetObject as PJavaPackage).Path;
end;

function PJavaPackageAuto.Get_IsDefaultPackage: WordBool;
begin
  Result := (FTargetObject as PJavaPackage).IsDefaultPackage;
end;

function PJavaPackageAuto.GetCompilationUnitCount: Integer;
begin
  Result := (FTargetObject as PJavaPackage).CompilationUnitCount;
end;

function PJavaPackageAuto.GetCompilationUnitAt(Index: Integer): IJavaCompilationUnit;
var
  R: PJavaCompilationUnit;
begin
  R := (FTargetObject as PJavaPackage).CompilationUnits[Index];
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaCompilationUnit;
end;

function PJavaPackageAuto.GetTypeCount: Integer;
begin
  Result := (FTargetObject as PJavaPackage).TypeCount;
end;

function PJavaPackageAuto.GetTypeAt(Index: Integer): IJavaType;
var
  R: PJavaType;
begin
  R := (FTargetObject as PJavaPackage).Types[Index];
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaType;
end;

function PJavaPackageAuto.Get_SuperPackage: IJavaPackage;
var
  R: PJavaPackage;
begin
  R := (FTargetObject as PJavaPackage).SuperPackage;
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaPackage;
end;

function PJavaPackageAuto.GetSubPackageCount: Integer;
begin
  Result := (FTargetObject as PJavaPackage).SubPackageCount;
end;

function PJavaPackageAuto.GetSubPackageAt(Index: Integer): IJavaPackage;
var
  R: PJavaPackage;
begin
  R := (FTargetObject as PJavaPackage).SubPackages[Index];
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaPackage;
end;

// PJavaPackageAuto
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PJavaTypeAuto

function PJavaTypeAuto.Get_IsClass: WordBool;
begin
  Result := (FTargetObject as PJavaType).IsClass;
end;

function PJavaTypeAuto.Get_IsInterface: WordBool;
begin
  Result := (FTargetObject as PJavaType).IsInterface;
end;

function PJavaTypeAuto.Get_IsLocal: WordBool;
begin
  Result := (FTargetObject as PJavaType).IsLocal;
end;

function PJavaTypeAuto.Get_IsMember: WordBool;
begin
  Result := (FTargetObject as PJavaType).IsMember;
end;

function PJavaTypeAuto.Get_SuperClass: WideString;
begin
  Result := (FTargetObject as PJavaType).SuperClass;
end;

function PJavaTypeAuto.GetSuperInterfaceCount: Integer;
begin
  Result := (FTargetObject as PJavaType).SuperInterfaceCount;
end;

function PJavaTypeAuto.GetSuperInterfaceAt(Index: Integer): WideString;
begin
  Result := (FTargetObject as PJavaType).SuperInterfaces[Index];
end;

function PJavaTypeAuto.GetFieldCount: Integer;
begin
  Result := (FTargetObject as PJavaType).FieldCount;
end;

function PJavaTypeAuto.GetFieldAt(Index: Integer): IJavaField;
var
  R: PJavaField;
begin
  R := (FTargetObject as PJavaType).Fields[Index];
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaField;
end;

function PJavaTypeAuto.GetMethodCount: Integer;
begin
  Result := (FTargetObject as PJavaType).MethodCount;
end;

function PJavaTypeAuto.GetMethodAt(Index: Integer): IJavaMethod;
var
  R: PJavaMethod;
begin
  R := (FTargetObject as PJavaType).Methods[Index];
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaMethod;
end;

function PJavaTypeAuto.GetInitializerCount: Integer;
begin
  Result := (FTargetObject as PJavaType).InitializerCount;
end;

function PJavaTypeAuto.GetInitializerAt(Index: Integer): IJavaInitializer;
var
  R: PJavaInitializer;
begin
  R := (FTargetObject as PJavaType).Initializers[Index];
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaInitializer;
end;

function PJavaTypeAuto.Get_DeclaringType: IJavaType;
var
  R: PJavaType;
begin
  R := (FTargetObject as PJavaType).DeclaringType;
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaType;
end;

function PJavaTypeAuto.GetTypeCount: Integer;
begin
  Result := (FTargetObject as PJavaType).TypeCount;
end;

function PJavaTypeAuto.GetTypeAt(Index: Integer): IJavaType;
var
  R: PJavaType;
begin
  R := (FTargetObject as PJavaType).Types[Index];
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaType;
end;

function PJavaTypeAuto.Get_Package: IJavaPackage;
var
  R: PJavaPackage;
begin
  R := (FTargetObject as PJavaType).Package;
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaPackage;
end;

function PJavaTypeAuto.Get_CompilationUnit: IJavaCompilationUnit;
var
  R: PJavaCompilationUnit;
begin
  R := (FTargetObject as PJavaType).CompilationUnit;
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaCompilationUnit;
end;

// PJavaTypeAuto
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PJavaPackageDeclarationAuto

function PJavaPackageDeclarationAuto.Get_CompilationUnit: IJavaCompilationUnit;
var
  R: PJavaCompilationUnit;
begin
  R := (FTargetObject as PJavaPackageDeclaration).CompilationUnit;
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaCompilationUnit;
end;

// PJavaPackageDeclarationAuto
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// PJavaParameterAuto

function PJavaParameterAuto.Get_Type_: WideString;
begin
  Result := (FTargetObject as PJavaParameter).Type_;
end;

function PJavaParameterAuto.Get_TypeDimension: Integer;
begin
  Result := (FTargetObject as PJavaParameter).TypeDimension;
end;

function PJavaParameterAuto.Get_IsFinal: WordBool;
begin
  Result := (FTargetObject as PJavaParameter).IsFinal;
end;

function PJavaParameterAuto.Get_Method: IJavaMethod;
var
  R: PJavaMethod;
begin
  R := (FTargetObject as PJavaParameter).Method;
  if R = nil then Result := nil
  else
    Result := R.AutomationObject as IJavaMethod;
end;

// PJavaParameterAuto
/////////////////////////////////////////////////////////////////////////////

procedure RegisterAutomationClasses;
begin
  ClassRegistry.RegisterClass(PJavaElement, PJavaElementAuto, IID_IJavaElement);
  ClassRegistry.RegisterClass(PJavaCompilationUnit, PJavaCompilationUnitAuto, IID_IJavaCompilationUnit);
  ClassRegistry.RegisterClass(PJavaField, PJavaFieldAuto, IID_IJavaField);
  ClassRegistry.RegisterClass(PJavaImport, PJavaImportAuto, IID_IJavaImport);
  ClassRegistry.RegisterClass(PJavaInitializer, PJavaInitializerAuto, IID_IJavaInitializer);
  ClassRegistry.RegisterClass(PJavaMember, PJavaMemberAuto, IID_IJavaMember);
  ClassRegistry.RegisterClass(PJavaMethod, PJavaMethodAuto, IID_IJavaMethod);
  ClassRegistry.RegisterClass(PJavaPackage, PJavaPackageAuto, IID_IJavaPackage);
  ClassRegistry.RegisterClass(PJavaType, PJavaTypeAuto, IID_IJavaType);
  ClassRegistry.RegisterClass(PJavaPackageDeclaration, PJavaPackageDeclarationAuto, IID_IJavaPackageDeclaration);
  ClassRegistry.RegisterClass(PJavaParameter, PJavaParameterAuto, IID_IJavaParameter);
end;

initialization
  RegisterAutomationClasses;

end.
