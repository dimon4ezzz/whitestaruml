unit WSTextTranslator_TLB;

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
// File generated on 8/11/2012 9:31:13 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforge\staruml-generator\src\translators\text-translator\TextTranslator (1)
// LIBID: {929ACC4C-40C7-4BF9-B678-5CD3DE9C4E6E}
// LCID: 0
// Helpfile:
// HelpString: TextTranslator Library
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
  WSTextTranslatorMajorVersion = 1;
  WSTextTranslatorMinorVersion = 0;

  LIBID_WSTextTranslator: TGUID = '{929ACC4C-40C7-4BF9-B678-5CD3DE9C4E6E}';

  IID_ITextTranslatorObj: TGUID = '{0603EA84-39B6-4671-8A4A-D010EAC16071}';
  CLASS_TextTranslatorObj: TGUID = '{D3ACBB57-8C1D-4DE4-BAEF-9248A1887D73}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  ITextTranslatorObj = interface;
  ITextTranslatorObjDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  TextTranslatorObj = ITextTranslatorObj;


// *********************************************************************//
// Interface: ITextTranslatorObj
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0603EA84-39B6-4671-8A4A-D010EAC16071}
// *********************************************************************//
  ITextTranslatorObj = interface(IDispatch)
    ['{0603EA84-39B6-4671-8A4A-D010EAC16071}']
  end;

// *********************************************************************//
// DispIntf:  ITextTranslatorObjDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0603EA84-39B6-4671-8A4A-D010EAC16071}
// *********************************************************************//
  ITextTranslatorObjDisp = dispinterface
    ['{0603EA84-39B6-4671-8A4A-D010EAC16071}']
  end;

// *********************************************************************//
// The Class CoTextTranslatorObj provides a Create and CreateRemote method to
// create instances of the default interface ITextTranslatorObj exposed by
// the CoClass TextTranslatorObj. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoTextTranslatorObj = class
    class function Create: ITextTranslatorObj;
    class function CreateRemote(const MachineName: string): ITextTranslatorObj;
  end;

implementation

uses ComObj;

class function CoTextTranslatorObj.Create: ITextTranslatorObj;
begin
  Result := CreateComObject(CLASS_TextTranslatorObj) as ITextTranslatorObj;
end;

class function CoTextTranslatorObj.CreateRemote(const MachineName: string): ITextTranslatorObj;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TextTranslatorObj) as ITextTranslatorObj;
end;

end.

