unit WSPatternAddIn_TLB;

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
// File generated on 1/1/2012 5:26:53 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforge\staruml-pattern\src\code\PatternAddIn (1)
// LIBID: {CA6CC208-A65A-44AD-8DA1-19E23BC277F6}
// LCID: 0
// Helpfile:
// HelpString: WSPatternAddIn Library
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
  WSPatternAddInMajorVersion = 1;
  WSPatternAddInMinorVersion = 0;

  LIBID_WSPatternAddIn: TGUID = '{CA6CC208-A65A-44AD-8DA1-19E23BC277F6}';

  CLASS_PatternAddInObj: TGUID = '{B0C63703-EB4D-499F-B196-6DCAE5D402EC}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  PatternAddInObj = IStarUMLAddIn;


// *********************************************************************//
// The Class CoPatternAddInObj provides a Create and CreateRemote method to
// create instances of the default interface IStarUMLAddIn exposed by
// the CoClass PatternAddInObj. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoPatternAddInObj = class
    class function Create: IStarUMLAddIn;
    class function CreateRemote(const MachineName: string): IStarUMLAddIn;
  end;

implementation

uses ComObj;

class function CoPatternAddInObj.Create: IStarUMLAddIn;
begin
  Result := CreateComObject(CLASS_PatternAddInObj) as IStarUMLAddIn;
end;

class function CoPatternAddInObj.CreateRemote(const MachineName: string): IStarUMLAddIn;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PatternAddInObj) as IStarUMLAddIn;
end;

end.

