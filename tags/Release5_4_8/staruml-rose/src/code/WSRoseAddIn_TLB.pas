unit WSRoseAddIn_TLB;

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
// File generated on 1/1/2012 4:46:31 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforge\staruml-rose\src\code\RoseAddIn (1)
// LIBID: {A5C0474D-A3F2-4784-95E1-3629D439644F}
// LCID: 0
// Helpfile:
// HelpString: WSRoseAddIn Library
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
  WSRoseAddInMajorVersion = 1;
  WSRoseAddInMinorVersion = 0;

  LIBID_WSRoseAddIn: TGUID = '{A5C0474D-A3F2-4784-95E1-3629D439644F}';

  CLASS_RoseAddInObj: TGUID = '{AD36BDD6-CE9C-44CD-8D65-440C16EDBF4C}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  RoseAddInObj = IStarUMLAddIn;


// *********************************************************************//
// The Class CoRoseAddInObj provides a Create and CreateRemote method to
// create instances of the default interface IStarUMLAddIn exposed by
// the CoClass RoseAddInObj. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoRoseAddInObj = class
    class function Create: IStarUMLAddIn;
    class function CreateRemote(const MachineName: string): IStarUMLAddIn;
  end;

implementation

uses ComObj;

class function CoRoseAddInObj.Create: IStarUMLAddIn;
begin
  Result := CreateComObject(CLASS_RoseAddInObj) as IStarUMLAddIn;
end;

class function CoRoseAddInObj.CreateRemote(const MachineName: string): IStarUMLAddIn;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RoseAddInObj) as IStarUMLAddIn;
end;

end.

