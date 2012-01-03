unit WSXMIAddIn_TLB;

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
// File generated on 1/1/2012 2:56:42 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforge\staruml-xmi\src\code\XMIAddIn (1)
// LIBID: {34FFB6B4-3A63-47B6-AA2A-E3993C4CAA46}
// LCID: 0
// Helpfile:
// HelpString: XMIAddIn Library
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 WhiteStarUML, (C:\JS\Delphi\StarUMLFresh\WhiteStarUML.exe)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants, WhiteStarUML_TLB;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  XMIAddInMajorVersion = 1;
  XMIAddInMinorVersion = 0;

  LIBID_XMIAddIn: TGUID = '{34FFB6B4-3A63-47B6-AA2A-E3993C4CAA46}';

  CLASS_XMIAddInObj: TGUID = '{0E725E96-2CB4-49DF-B32A-DCB774A4FAF4}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  XMIAddInObj = IStarUMLAddIn;


// *********************************************************************//
// The Class CoXMIAddInObj provides a Create and CreateRemote method to
// create instances of the default interface IStarUMLAddIn exposed by
// the CoClass XMIAddInObj. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoXMIAddInObj = class
    class function Create: IStarUMLAddIn;
    class function CreateRemote(const MachineName: string): IStarUMLAddIn;
  end;

implementation

uses ComObj;

class function CoXMIAddInObj.Create: IStarUMLAddIn;
begin
  Result := CreateComObject(CLASS_XMIAddInObj) as IStarUMLAddIn;
end;

class function CoXMIAddInObj.CreateRemote(const MachineName: string): IStarUMLAddIn;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_XMIAddInObj) as IStarUMLAddIn;
end;

end.

