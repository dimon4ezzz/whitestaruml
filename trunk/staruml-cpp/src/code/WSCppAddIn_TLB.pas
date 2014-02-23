unit WSCppAddIn_TLB;

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

// $Rev: 52393 $
// File generated on 21/02/2014 21:33:29 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforgeTrunkXE5\staruml-cpp\src\code\CppAddIn (1)
// LIBID: {D571B8DA-75B5-40D7-A52E-5184E479F6A1}
// LCID: 0
// Helpfile:
// HelpString: WSCppAddIn Library
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWow64\stdole2.tlb)
//   (2) v1.0 WhiteStarUML, (C:\JS\Delphi\WhiteStarDevInstall\WhiteStarUML.exe)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, WhiteStarUML_TLB, Winapi.ActiveX;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  WSCppAddInMajorVersion = 1;
  WSCppAddInMinorVersion = 0;

  LIBID_WSCppAddIn: TGUID = '{D571B8DA-75B5-40D7-A52E-5184E479F6A1}';

  CLASS_CppAddInObj: TGUID = '{13C97EB7-019B-451E-8F96-AFD898782208}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  CppAddInObj = IStarUMLAddIn;


// *********************************************************************//
// The Class CoCppAddInObj provides a Create and CreateRemote method to
// create instances of the default interface IStarUMLAddIn exposed by
// the CoClass CppAddInObj. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoCppAddInObj = class
    class function Create: IStarUMLAddIn;
    class function CreateRemote(const MachineName: string): IStarUMLAddIn;
  end;

implementation

uses System.Win.ComObj;

class function CoCppAddInObj.Create: IStarUMLAddIn;
begin
  Result := CreateComObject(CLASS_CppAddInObj) as IStarUMLAddIn;
end;

class function CoCppAddInObj.CreateRemote(const MachineName: string): IStarUMLAddIn;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CppAddInObj) as IStarUMLAddIn;
end;

end.

