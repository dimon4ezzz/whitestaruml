unit WSCSharpAddIn_TLB;

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
// File generated on 22/02/2014 13:10:58 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforgeTrunkXE5\staruml-csharp\src\code\CSharpAddIn (1)
// LIBID: {4236BF82-40CE-4D40-BD49-61ADC888A811}
// LCID: 0
// Helpfile:
// HelpString: WSCSharpAddIn Library
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
  WSCSharpAddInMajorVersion = 1;
  WSCSharpAddInMinorVersion = 0;

  LIBID_WSCSharpAddIn: TGUID = '{4236BF82-40CE-4D40-BD49-61ADC888A811}';

  CLASS_CSharpAddInObj: TGUID = '{7425E750-948D-44B0-97D6-2698CFA4F8D0}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  CSharpAddInObj = IStarUMLAddIn;


// *********************************************************************//
// The Class CoCSharpAddInObj provides a Create and CreateRemote method to
// create instances of the default interface IStarUMLAddIn exposed by
// the CoClass CSharpAddInObj. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoCSharpAddInObj = class
    class function Create: IStarUMLAddIn;
    class function CreateRemote(const MachineName: string): IStarUMLAddIn;
  end;

implementation

uses System.Win.ComObj;

class function CoCSharpAddInObj.Create: IStarUMLAddIn;
begin
  Result := CreateComObject(CLASS_CSharpAddInObj) as IStarUMLAddIn;
end;

class function CoCSharpAddInObj.CreateRemote(const MachineName: string): IStarUMLAddIn;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CSharpAddInObj) as IStarUMLAddIn;
end;

end.

