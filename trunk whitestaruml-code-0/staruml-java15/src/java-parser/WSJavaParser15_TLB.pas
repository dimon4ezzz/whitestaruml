unit WSJavaParser15_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 17244 $
// File generated on 4/21/2012 6:21:22 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforge\staruml-java15\src\java-parser\JavaParser (1)
// LIBID: {0FD60EAA-AA6A-4894-B7AB-035F67E7B208}
// LCID: 0
// Helpfile:
// HelpString: JavaParser Library
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  WSJavaParser15MajorVersion = 1;
  WSJavaParser15MinorVersion = 0;

  LIBID_WSJavaParser15: TGUID = '{0FD60EAA-AA6A-4894-B7AB-035F67E7B208}';

  IID_IJavaParserObj: TGUID = '{5DD0F86C-AD7B-4024-B0A9-8D10194BE79A}';
  DIID_IJavaParserObjEvents: TGUID = '{7F8D581D-252E-4DE9-9F08-E3C79462D590}';
  CLASS_JavaParserObj: TGUID = '{430031A0-C036-4DF8-BF8B-7F2446FD333E}';
  IID_IJavaElement: TGUID = '{D7439CFF-3A53-4982-86A9-53B4D44A5670}';
  IID_IJavaCompilationUnit: TGUID = '{E0DC3BC8-762F-4363-9452-2E3882050F1E}';
  IID_IJavaMember: TGUID = '{62C7410A-CC64-4694-8945-265F29E5E33F}';
  IID_IJavaImport: TGUID = '{B99D6AC0-4B72-443D-99FB-F5C3934DA8F7}';
  IID_IJavaInitializer: TGUID = '{772C9110-0A24-434C-8F22-4775BE9F7A9D}';
  IID_IJavaField: TGUID = '{CB91C272-9F61-4CF4-A52B-680BFE1B5E15}';
  IID_IJavaMethod: TGUID = '{029D880D-BFAF-4740-9F48-8E7EE5C5509E}';
  IID_IJavaPackage: TGUID = '{203D877E-DCF1-41F5-9438-1F7E84C5B0CB}';
  IID_IJavaType: TGUID = '{631EDBBD-780F-410F-ACB6-081FFB309EA5}';
  IID_IJavaPackageDeclaration: TGUID = '{F4A34E4E-E32C-44EF-B07B-BFEE2CDB3206}';
  IID_IJavaParameter: TGUID = '{6E0FC72C-FF73-4CA9-9A53-DC7001878909}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library
// *********************************************************************//
// Constants for enum VisibilityKind
type
  VisibilityKind = TOleEnum;
const
  vkPublic = $00000000;
  vkProtected = $00000001;
  vkPrivate = $00000002;
  vkPackage = $00000003;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IJavaParserObj = interface;
  IJavaParserObjDisp = dispinterface;
  IJavaParserObjEvents = dispinterface;
  IJavaElement = interface;
  IJavaElementDisp = dispinterface;
  IJavaCompilationUnit = interface;
  IJavaCompilationUnitDisp = dispinterface;
  IJavaMember = interface;
  IJavaMemberDisp = dispinterface;
  IJavaImport = interface;
  IJavaImportDisp = dispinterface;
  IJavaInitializer = interface;
  IJavaInitializerDisp = dispinterface;
  IJavaField = interface;
  IJavaFieldDisp = dispinterface;
  IJavaMethod = interface;
  IJavaMethodDisp = dispinterface;
  IJavaPackage = interface;
  IJavaPackageDisp = dispinterface;
  IJavaType = interface;
  IJavaTypeDisp = dispinterface;
  IJavaPackageDeclaration = interface;
  IJavaPackageDeclarationDisp = dispinterface;
  IJavaParameter = interface;
  IJavaParameterDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  JavaParserObj = IJavaParserObj;


// *********************************************************************//
// Interface: IJavaParserObj
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5DD0F86C-AD7B-4024-B0A9-8D10194BE79A}
// *********************************************************************//
  IJavaParserObj = interface(IDispatch)
    ['{5DD0F86C-AD7B-4024-B0A9-8D10194BE79A}']
    function Parse(const FileName: WideString): WordBool; safecall;
    function GetPackageCount: Integer; safecall;
    function GetPackageAt(Index: Integer): IJavaPackage; safecall;
    function GetCompilationUnitCount: Integer; safecall;
    function GetCompilationUnitAt(Index: Integer): IJavaCompilationUnit; safecall;
    procedure Clear; safecall;
    function Get_ErrorLinePos: Integer; safecall;
    function Get_ErrorLine: Integer; safecall;
    function Get_ErrorDescription: WideString; safecall;
    function Get_ErrorNumChar: Integer; safecall;
    property ErrorLinePos: Integer read Get_ErrorLinePos;
    property ErrorLine: Integer read Get_ErrorLine;
    property ErrorDescription: WideString read Get_ErrorDescription;
    property ErrorNumChar: Integer read Get_ErrorNumChar;
  end;

// *********************************************************************//
// DispIntf:  IJavaParserObjDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5DD0F86C-AD7B-4024-B0A9-8D10194BE79A}
// *********************************************************************//
  IJavaParserObjDisp = dispinterface
    ['{5DD0F86C-AD7B-4024-B0A9-8D10194BE79A}']
    function Parse(const FileName: WideString): WordBool; dispid 1;
    function GetPackageCount: Integer; dispid 4;
    function GetPackageAt(Index: Integer): IJavaPackage; dispid 5;
    function GetCompilationUnitCount: Integer; dispid 6;
    function GetCompilationUnitAt(Index: Integer): IJavaCompilationUnit; dispid 7;
    procedure Clear; dispid 8;
    property ErrorLinePos: Integer readonly dispid 2;
    property ErrorLine: Integer readonly dispid 3;
    property ErrorDescription: WideString readonly dispid 9;
    property ErrorNumChar: Integer readonly dispid 10;
  end;

// *********************************************************************//
// DispIntf:  IJavaParserObjEvents
// Flags:     (0)
// GUID:      {7F8D581D-252E-4DE9-9F08-E3C79462D590}
// *********************************************************************//
  IJavaParserObjEvents = dispinterface
    ['{7F8D581D-252E-4DE9-9F08-E3C79462D590}']
  end;

// *********************************************************************//
// Interface: IJavaElement
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D7439CFF-3A53-4982-86A9-53B4D44A5670}
// *********************************************************************//
  IJavaElement = interface(IDispatch)
    ['{D7439CFF-3A53-4982-86A9-53B4D44A5670}']
    function Get_Name: WideString; safecall;
    function Get_Documentation: WideString; safecall;
    function Get_Line: Integer; safecall;
    function Get_Offset: Integer; safecall;
    function Get_Length: Integer; safecall;
    property Name: WideString read Get_Name;
    property Documentation: WideString read Get_Documentation;
    property Line: Integer read Get_Line;
    property Offset: Integer read Get_Offset;
    property Length: Integer read Get_Length;
  end;

// *********************************************************************//
// DispIntf:  IJavaElementDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D7439CFF-3A53-4982-86A9-53B4D44A5670}
// *********************************************************************//
  IJavaElementDisp = dispinterface
    ['{D7439CFF-3A53-4982-86A9-53B4D44A5670}']
    property Name: WideString readonly dispid 2;
    property Documentation: WideString readonly dispid 3;
    property Line: Integer readonly dispid 4;
    property Offset: Integer readonly dispid 5;
    property Length: Integer readonly dispid 6;
  end;

// *********************************************************************//
// Interface: IJavaCompilationUnit
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E0DC3BC8-762F-4363-9452-2E3882050F1E}
// *********************************************************************//
  IJavaCompilationUnit = interface(IDispatch)
    ['{E0DC3BC8-762F-4363-9452-2E3882050F1E}']
    function Get_FileName: WideString; safecall;
    function GetImportCount: Integer; safecall;
    function GetImportAt(Index: Integer): IJavaImport; safecall;
    function GetDeclaredTypeCount: Integer; safecall;
    function GetDeclaredTypeAt(Index: Integer): IJavaType; safecall;
    function Get_Package: IJavaPackage; safecall;
    function Get_PackageDeclaration: IJavaPackageDeclaration; safecall;
    property FileName: WideString read Get_FileName;
    property Package: IJavaPackage read Get_Package;
    property PackageDeclaration: IJavaPackageDeclaration read Get_PackageDeclaration;
  end;

// *********************************************************************//
// DispIntf:  IJavaCompilationUnitDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E0DC3BC8-762F-4363-9452-2E3882050F1E}
// *********************************************************************//
  IJavaCompilationUnitDisp = dispinterface
    ['{E0DC3BC8-762F-4363-9452-2E3882050F1E}']
    property FileName: WideString readonly dispid 1;
    function GetImportCount: Integer; dispid 3;
    function GetImportAt(Index: Integer): IJavaImport; dispid 4;
    function GetDeclaredTypeCount: Integer; dispid 6;
    function GetDeclaredTypeAt(Index: Integer): IJavaType; dispid 7;
    property Package: IJavaPackage readonly dispid 8;
    property PackageDeclaration: IJavaPackageDeclaration readonly dispid 9;
  end;

// *********************************************************************//
// Interface: IJavaMember
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {62C7410A-CC64-4694-8945-265F29E5E33F}
// *********************************************************************//
  IJavaMember = interface(IJavaElement)
    ['{62C7410A-CC64-4694-8945-265F29E5E33F}']
    function Get_Visibility: VisibilityKind; safecall;
    function Get_IsAbstract: WordBool; safecall;
    function Get_IsFinal: WordBool; safecall;
    function Get_IsNative: WordBool; safecall;
    function Get_IsStatic: WordBool; safecall;
    function Get_IsStrictfp: WordBool; safecall;
    function Get_IsSynchronized: WordBool; safecall;
    function Get_IsVolatile: WordBool; safecall;
    function Get_IsTransient: WordBool; safecall;
    property Visibility: VisibilityKind read Get_Visibility;
    property IsAbstract: WordBool read Get_IsAbstract;
    property IsFinal: WordBool read Get_IsFinal;
    property IsNative: WordBool read Get_IsNative;
    property IsStatic: WordBool read Get_IsStatic;
    property IsStrictfp: WordBool read Get_IsStrictfp;
    property IsSynchronized: WordBool read Get_IsSynchronized;
    property IsVolatile: WordBool read Get_IsVolatile;
    property IsTransient: WordBool read Get_IsTransient;
  end;

// *********************************************************************//
// DispIntf:  IJavaMemberDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {62C7410A-CC64-4694-8945-265F29E5E33F}
// *********************************************************************//
  IJavaMemberDisp = dispinterface
    ['{62C7410A-CC64-4694-8945-265F29E5E33F}']
    property Visibility: VisibilityKind readonly dispid 1;
    property IsAbstract: WordBool readonly dispid 7;
    property IsFinal: WordBool readonly dispid 8;
    property IsNative: WordBool readonly dispid 9;
    property IsStatic: WordBool readonly dispid 10;
    property IsStrictfp: WordBool readonly dispid 12;
    property IsSynchronized: WordBool readonly dispid 13;
    property IsVolatile: WordBool readonly dispid 14;
    property IsTransient: WordBool readonly dispid 33;
    property Name: WideString readonly dispid 2;
    property Documentation: WideString readonly dispid 3;
    property Line: Integer readonly dispid 4;
    property Offset: Integer readonly dispid 5;
    property Length: Integer readonly dispid 6;
  end;

// *********************************************************************//
// Interface: IJavaImport
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B99D6AC0-4B72-443D-99FB-F5C3934DA8F7}
// *********************************************************************//
  IJavaImport = interface(IJavaElement)
    ['{B99D6AC0-4B72-443D-99FB-F5C3934DA8F7}']
    function Get_CompilationUnit: IJavaCompilationUnit; safecall;
    function Get_IsOnDemand: WordBool; safecall;
    function GetPathFragmentCount: Integer; safecall;
    function GetPathFragmentAt(Index: Integer): WideString; safecall;
    property CompilationUnit: IJavaCompilationUnit read Get_CompilationUnit;
    property IsOnDemand: WordBool read Get_IsOnDemand;
  end;

// *********************************************************************//
// DispIntf:  IJavaImportDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B99D6AC0-4B72-443D-99FB-F5C3934DA8F7}
// *********************************************************************//
  IJavaImportDisp = dispinterface
    ['{B99D6AC0-4B72-443D-99FB-F5C3934DA8F7}']
    property CompilationUnit: IJavaCompilationUnit readonly dispid 1;
    property IsOnDemand: WordBool readonly dispid 8;
    function GetPathFragmentCount: Integer; dispid 9;
    function GetPathFragmentAt(Index: Integer): WideString; dispid 10;
    property Name: WideString readonly dispid 2;
    property Documentation: WideString readonly dispid 3;
    property Line: Integer readonly dispid 4;
    property Offset: Integer readonly dispid 5;
    property Length: Integer readonly dispid 6;
  end;

// *********************************************************************//
// Interface: IJavaInitializer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {772C9110-0A24-434C-8F22-4775BE9F7A9D}
// *********************************************************************//
  IJavaInitializer = interface(IJavaMember)
    ['{772C9110-0A24-434C-8F22-4775BE9F7A9D}']
    function Get_Body: WideString; safecall;
    function Get_DeclaringType: IJavaType; safecall;
    property Body: WideString read Get_Body;
    property DeclaringType: IJavaType read Get_DeclaringType;
  end;

// *********************************************************************//
// DispIntf:  IJavaInitializerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {772C9110-0A24-434C-8F22-4775BE9F7A9D}
// *********************************************************************//
  IJavaInitializerDisp = dispinterface
    ['{772C9110-0A24-434C-8F22-4775BE9F7A9D}']
    property Body: WideString readonly dispid 11;
    property DeclaringType: IJavaType readonly dispid 15;
    property Visibility: VisibilityKind readonly dispid 1;
    property IsAbstract: WordBool readonly dispid 7;
    property IsFinal: WordBool readonly dispid 8;
    property IsNative: WordBool readonly dispid 9;
    property IsStatic: WordBool readonly dispid 10;
    property IsStrictfp: WordBool readonly dispid 12;
    property IsSynchronized: WordBool readonly dispid 13;
    property IsVolatile: WordBool readonly dispid 14;
    property IsTransient: WordBool readonly dispid 33;
    property Name: WideString readonly dispid 2;
    property Documentation: WideString readonly dispid 3;
    property Line: Integer readonly dispid 4;
    property Offset: Integer readonly dispid 5;
    property Length: Integer readonly dispid 6;
  end;

// *********************************************************************//
// Interface: IJavaField
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CB91C272-9F61-4CF4-A52B-680BFE1B5E15}
// *********************************************************************//
  IJavaField = interface(IJavaMember)
    ['{CB91C272-9F61-4CF4-A52B-680BFE1B5E15}']
    function Get_Type_: WideString; safecall;
    function Get_InitializerExpression: WideString; safecall;
    function Get_DeclaringType: IJavaType; safecall;
    function Get_TypeDimension: Integer; safecall;
    property Type_: WideString read Get_Type_;
    property InitializerExpression: WideString read Get_InitializerExpression;
    property DeclaringType: IJavaType read Get_DeclaringType;
    property TypeDimension: Integer read Get_TypeDimension;
  end;

// *********************************************************************//
// DispIntf:  IJavaFieldDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CB91C272-9F61-4CF4-A52B-680BFE1B5E15}
// *********************************************************************//
  IJavaFieldDisp = dispinterface
    ['{CB91C272-9F61-4CF4-A52B-680BFE1B5E15}']
    property Type_: WideString readonly dispid 11;
    property InitializerExpression: WideString readonly dispid 15;
    property DeclaringType: IJavaType readonly dispid 16;
    property TypeDimension: Integer readonly dispid 17;
    property Visibility: VisibilityKind readonly dispid 1;
    property IsAbstract: WordBool readonly dispid 7;
    property IsFinal: WordBool readonly dispid 8;
    property IsNative: WordBool readonly dispid 9;
    property IsStatic: WordBool readonly dispid 10;
    property IsStrictfp: WordBool readonly dispid 12;
    property IsSynchronized: WordBool readonly dispid 13;
    property IsVolatile: WordBool readonly dispid 14;
    property IsTransient: WordBool readonly dispid 33;
    property Name: WideString readonly dispid 2;
    property Documentation: WideString readonly dispid 3;
    property Line: Integer readonly dispid 4;
    property Offset: Integer readonly dispid 5;
    property Length: Integer readonly dispid 6;
  end;

// *********************************************************************//
// Interface: IJavaMethod
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {029D880D-BFAF-4740-9F48-8E7EE5C5509E}
// *********************************************************************//
  IJavaMethod = interface(IJavaMember)
    ['{029D880D-BFAF-4740-9F48-8E7EE5C5509E}']
    function Get_IsConstructor: WordBool; safecall;
    function Get_ReturnType: WideString; safecall;
    function Get_Body: WideString; safecall;
    function Get_DeclaringType: IJavaType; safecall;
    function GetExceptionCount: Integer; safecall;
    function GetExceptionAt(Index: Integer): WideString; safecall;
    function GetParameterCount: Integer; safecall;
    function GetParameterAt(Index: Integer): IJavaParameter; safecall;
    function Get_ReturnTypeDimension: Integer; safecall;
    property IsConstructor: WordBool read Get_IsConstructor;
    property ReturnType: WideString read Get_ReturnType;
    property Body: WideString read Get_Body;
    property DeclaringType: IJavaType read Get_DeclaringType;
    property ReturnTypeDimension: Integer read Get_ReturnTypeDimension;
  end;

// *********************************************************************//
// DispIntf:  IJavaMethodDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {029D880D-BFAF-4740-9F48-8E7EE5C5509E}
// *********************************************************************//
  IJavaMethodDisp = dispinterface
    ['{029D880D-BFAF-4740-9F48-8E7EE5C5509E}']
    property IsConstructor: WordBool readonly dispid 11;
    property ReturnType: WideString readonly dispid 15;
    property Body: WideString readonly dispid 16;
    property DeclaringType: IJavaType readonly dispid 17;
    function GetExceptionCount: Integer; dispid 18;
    function GetExceptionAt(Index: Integer): WideString; dispid 19;
    function GetParameterCount: Integer; dispid 20;
    function GetParameterAt(Index: Integer): IJavaParameter; dispid 21;
    property ReturnTypeDimension: Integer readonly dispid 24;
    property Visibility: VisibilityKind readonly dispid 1;
    property IsAbstract: WordBool readonly dispid 7;
    property IsFinal: WordBool readonly dispid 8;
    property IsNative: WordBool readonly dispid 9;
    property IsStatic: WordBool readonly dispid 10;
    property IsStrictfp: WordBool readonly dispid 12;
    property IsSynchronized: WordBool readonly dispid 13;
    property IsVolatile: WordBool readonly dispid 14;
    property IsTransient: WordBool readonly dispid 33;
    property Name: WideString readonly dispid 2;
    property Documentation: WideString readonly dispid 3;
    property Line: Integer readonly dispid 4;
    property Offset: Integer readonly dispid 5;
    property Length: Integer readonly dispid 6;
  end;

// *********************************************************************//
// Interface: IJavaPackage
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {203D877E-DCF1-41F5-9438-1F7E84C5B0CB}
// *********************************************************************//
  IJavaPackage = interface(IJavaElement)
    ['{203D877E-DCF1-41F5-9438-1F7E84C5B0CB}']
    function Get_Path: WideString; safecall;
    function Get_IsDefaultPackage: WordBool; safecall;
    function Get_SuperPackage: IJavaPackage; safecall;
    function GetSubPackageCount: Integer; safecall;
    function GetSubPackageAt(Index: Integer): IJavaPackage; safecall;
    function GetCompilationUnitCount: Integer; safecall;
    function GetCompilationUnitAt(Index: Integer): IJavaCompilationUnit; safecall;
    function GetTypeCount: Integer; safecall;
    function GetTypeAt(Index: Integer): IJavaType; safecall;
    property Path: WideString read Get_Path;
    property IsDefaultPackage: WordBool read Get_IsDefaultPackage;
    property SuperPackage: IJavaPackage read Get_SuperPackage;
  end;

// *********************************************************************//
// DispIntf:  IJavaPackageDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {203D877E-DCF1-41F5-9438-1F7E84C5B0CB}
// *********************************************************************//
  IJavaPackageDisp = dispinterface
    ['{203D877E-DCF1-41F5-9438-1F7E84C5B0CB}']
    property Path: WideString readonly dispid 1;
    property IsDefaultPackage: WordBool readonly dispid 7;
    property SuperPackage: IJavaPackage readonly dispid 9;
    function GetSubPackageCount: Integer; dispid 10;
    function GetSubPackageAt(Index: Integer): IJavaPackage; dispid 11;
    function GetCompilationUnitCount: Integer; dispid 12;
    function GetCompilationUnitAt(Index: Integer): IJavaCompilationUnit; dispid 13;
    function GetTypeCount: Integer; dispid 14;
    function GetTypeAt(Index: Integer): IJavaType; dispid 19;
    property Name: WideString readonly dispid 2;
    property Documentation: WideString readonly dispid 3;
    property Line: Integer readonly dispid 4;
    property Offset: Integer readonly dispid 5;
    property Length: Integer readonly dispid 6;
  end;

// *********************************************************************//
// Interface: IJavaType
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {631EDBBD-780F-410F-ACB6-081FFB309EA5}
// *********************************************************************//
  IJavaType = interface(IJavaMember)
    ['{631EDBBD-780F-410F-ACB6-081FFB309EA5}']
    function Get_IsClass: WordBool; safecall;
    function Get_IsInterface: WordBool; safecall;
    function Get_IsLocal: WordBool; safecall;
    function Get_IsMember: WordBool; safecall;
    function GetSuperInterfaceCount: Integer; safecall;
    function GetSuperInterfaceAt(Index: Integer): WideString; safecall;
    function Get_CompilationUnit: IJavaCompilationUnit; safecall;
    function Get_Package: IJavaPackage; safecall;
    function Get_DeclaringType: IJavaType; safecall;
    function GetInitializerCount: Integer; safecall;
    function GetInitializerAt(Index: Integer): IJavaInitializer; safecall;
    function GetFieldCount: Integer; safecall;
    function GetFieldAt(Index: Integer): IJavaField; safecall;
    function GetMethodCount: Integer; safecall;
    function GetMethodAt(Index: Integer): IJavaMethod; safecall;
    function GetTypeCount: Integer; safecall;
    function GetTypeAt(Index: Integer): IJavaType; safecall;
    function Get_SuperClass: WideString; safecall;
    property IsClass: WordBool read Get_IsClass;
    property IsInterface: WordBool read Get_IsInterface;
    property IsLocal: WordBool read Get_IsLocal;
    property IsMember: WordBool read Get_IsMember;
    property CompilationUnit: IJavaCompilationUnit read Get_CompilationUnit;
    property Package: IJavaPackage read Get_Package;
    property DeclaringType: IJavaType read Get_DeclaringType;
    property SuperClass: WideString read Get_SuperClass;
  end;

// *********************************************************************//
// DispIntf:  IJavaTypeDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {631EDBBD-780F-410F-ACB6-081FFB309EA5}
// *********************************************************************//
  IJavaTypeDisp = dispinterface
    ['{631EDBBD-780F-410F-ACB6-081FFB309EA5}']
    property IsClass: WordBool readonly dispid 11;
    property IsInterface: WordBool readonly dispid 15;
    property IsLocal: WordBool readonly dispid 16;
    property IsMember: WordBool readonly dispid 17;
    function GetSuperInterfaceCount: Integer; dispid 20;
    function GetSuperInterfaceAt(Index: Integer): WideString; dispid 21;
    property CompilationUnit: IJavaCompilationUnit readonly dispid 22;
    property Package: IJavaPackage readonly dispid 23;
    property DeclaringType: IJavaType readonly dispid 24;
    function GetInitializerCount: Integer; dispid 25;
    function GetInitializerAt(Index: Integer): IJavaInitializer; dispid 26;
    function GetFieldCount: Integer; dispid 27;
    function GetFieldAt(Index: Integer): IJavaField; dispid 28;
    function GetMethodCount: Integer; dispid 29;
    function GetMethodAt(Index: Integer): IJavaMethod; dispid 30;
    function GetTypeCount: Integer; dispid 31;
    function GetTypeAt(Index: Integer): IJavaType; dispid 32;
    property SuperClass: WideString readonly dispid 18;
    property Visibility: VisibilityKind readonly dispid 1;
    property IsAbstract: WordBool readonly dispid 7;
    property IsFinal: WordBool readonly dispid 8;
    property IsNative: WordBool readonly dispid 9;
    property IsStatic: WordBool readonly dispid 10;
    property IsStrictfp: WordBool readonly dispid 12;
    property IsSynchronized: WordBool readonly dispid 13;
    property IsVolatile: WordBool readonly dispid 14;
    property IsTransient: WordBool readonly dispid 33;
    property Name: WideString readonly dispid 2;
    property Documentation: WideString readonly dispid 3;
    property Line: Integer readonly dispid 4;
    property Offset: Integer readonly dispid 5;
    property Length: Integer readonly dispid 6;
  end;

// *********************************************************************//
// Interface: IJavaPackageDeclaration
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F4A34E4E-E32C-44EF-B07B-BFEE2CDB3206}
// *********************************************************************//
  IJavaPackageDeclaration = interface(IJavaElement)
    ['{F4A34E4E-E32C-44EF-B07B-BFEE2CDB3206}']
    function Get_CompilationUnit: IJavaCompilationUnit; safecall;
    property CompilationUnit: IJavaCompilationUnit read Get_CompilationUnit;
  end;

// *********************************************************************//
// DispIntf:  IJavaPackageDeclarationDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F4A34E4E-E32C-44EF-B07B-BFEE2CDB3206}
// *********************************************************************//
  IJavaPackageDeclarationDisp = dispinterface
    ['{F4A34E4E-E32C-44EF-B07B-BFEE2CDB3206}']
    property CompilationUnit: IJavaCompilationUnit readonly dispid 7;
    property Name: WideString readonly dispid 2;
    property Documentation: WideString readonly dispid 3;
    property Line: Integer readonly dispid 4;
    property Offset: Integer readonly dispid 5;
    property Length: Integer readonly dispid 6;
  end;

// *********************************************************************//
// Interface: IJavaParameter
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6E0FC72C-FF73-4CA9-9A53-DC7001878909}
// *********************************************************************//
  IJavaParameter = interface(IJavaElement)
    ['{6E0FC72C-FF73-4CA9-9A53-DC7001878909}']
    function Get_Type_: WideString; safecall;
    function Get_TypeDimension: Integer; safecall;
    function Get_Method: IJavaMethod; safecall;
    function Get_IsFinal: WordBool; safecall;
    property Type_: WideString read Get_Type_;
    property TypeDimension: Integer read Get_TypeDimension;
    property Method: IJavaMethod read Get_Method;
    property IsFinal: WordBool read Get_IsFinal;
  end;

// *********************************************************************//
// DispIntf:  IJavaParameterDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6E0FC72C-FF73-4CA9-9A53-DC7001878909}
// *********************************************************************//
  IJavaParameterDisp = dispinterface
    ['{6E0FC72C-FF73-4CA9-9A53-DC7001878909}']
    property Type_: WideString readonly dispid 7;
    property TypeDimension: Integer readonly dispid 8;
    property Method: IJavaMethod readonly dispid 9;
    property IsFinal: WordBool readonly dispid 1;
    property Name: WideString readonly dispid 2;
    property Documentation: WideString readonly dispid 3;
    property Line: Integer readonly dispid 4;
    property Offset: Integer readonly dispid 5;
    property Length: Integer readonly dispid 6;
  end;

// *********************************************************************//
// The Class CoJavaParserObj provides a Create and CreateRemote method to
// create instances of the default interface IJavaParserObj exposed by
// the CoClass JavaParserObj. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoJavaParserObj = class
    class function Create: IJavaParserObj;
    class function CreateRemote(const MachineName: string): IJavaParserObj;
  end;

implementation

uses ComObj;

class function CoJavaParserObj.Create: IJavaParserObj;
begin
  Result := CreateComObject(CLASS_JavaParserObj) as IJavaParserObj;
end;

class function CoJavaParserObj.CreateRemote(const MachineName: string): IJavaParserObj;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_JavaParserObj) as IJavaParserObj;
end;

end.

