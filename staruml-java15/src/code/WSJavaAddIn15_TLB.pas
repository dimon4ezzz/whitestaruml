unit WSJavaAddIn15_TLB;

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
// File generated on 13/04/2014 14:41:24 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforgeTrunkXE5\staruml-java15\src\code\JavaAddIn (1)
// LIBID: {0C706822-DF79-43A6-8624-5E2C58CB30FE}
// LCID: 0
// Helpfile:
// HelpString: JavaAddIn Library
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWow64\stdole2.tlb)
//   (2) v1.0 WhiteStarUML, (C:\JS\Delphi\WhiteStarUML-NoInstall\WhiteStarUML.exe)
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
  WSJavaAddIn15MajorVersion = 1;
  WSJavaAddIn15MinorVersion = 0;

  LIBID_WSJavaAddIn15: TGUID = '{0C706822-DF79-43A6-8624-5E2C58CB30FE}';

  CLASS_JavaAddInObj: TGUID = '{034E2838-F3C6-4D8D-9A5A-544996B6948E}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  JavaAddInObj = IStarUMLAddIn;


// *********************************************************************//
// The Class CoJavaAddInObj provides a Create and CreateRemote method to
// create instances of the default interface IStarUMLAddIn exposed by
// the CoClass JavaAddInObj. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoJavaAddInObj = class
    class function Create: IStarUMLAddIn;
    class function CreateRemote(const MachineName: string): IStarUMLAddIn;
  end;

implementation

uses System.Win.ComObj;

class function CoJavaAddInObj.Create: IStarUMLAddIn;
begin
  Result := CreateComObject(CLASS_JavaAddInObj) as IStarUMLAddIn;
end;

class function CoJavaAddInObj.CreateRemote(const MachineName: string): IStarUMLAddIn;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_JavaAddInObj) as IStarUMLAddIn;
end;

end.

