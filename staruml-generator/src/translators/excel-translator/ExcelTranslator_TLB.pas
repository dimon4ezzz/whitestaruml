unit ExcelTranslator_TLB;

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
// File generated on 7/30/2012 8:24:41 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforge\staruml-generator\src\translators\excel-translator\ExcelTranslator (1)
// LIBID: {B2C6F7DF-3DD2-4D6B-9951-F608DC6360BD}
// LCID: 0
// Helpfile:
// HelpString: ExcelTranslator Library
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
  ExcelTranslatorMajorVersion = 1;
  ExcelTranslatorMinorVersion = 0;

  LIBID_ExcelTranslator: TGUID = '{B2C6F7DF-3DD2-4D6B-9951-F608DC6360BD}';

  IID_IExcelTranslatorObj: TGUID = '{D518D1E5-2AB5-46AD-9E39-3BA61C47C8A8}';
  CLASS_ExcelTranslatorObj: TGUID = '{36DA5BA0-B37E-49A0-8C59-6DACAD880BDE}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IExcelTranslatorObj = interface;
  IExcelTranslatorObjDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  ExcelTranslatorObj = IExcelTranslatorObj;


// *********************************************************************//
// Interface: IExcelTranslatorObj
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D518D1E5-2AB5-46AD-9E39-3BA61C47C8A8}
// *********************************************************************//
  IExcelTranslatorObj = interface(IDispatch)
    ['{D518D1E5-2AB5-46AD-9E39-3BA61C47C8A8}']
  end;

// *********************************************************************//
// DispIntf:  IExcelTranslatorObjDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D518D1E5-2AB5-46AD-9E39-3BA61C47C8A8}
// *********************************************************************//
  IExcelTranslatorObjDisp = dispinterface
    ['{D518D1E5-2AB5-46AD-9E39-3BA61C47C8A8}']
  end;

// *********************************************************************//
// The Class CoExcelTranslatorObj provides a Create and CreateRemote method to
// create instances of the default interface IExcelTranslatorObj exposed by
// the CoClass ExcelTranslatorObj. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoExcelTranslatorObj = class
    class function Create: IExcelTranslatorObj;
    class function CreateRemote(const MachineName: string): IExcelTranslatorObj;
  end;

implementation

uses ComObj;

class function CoExcelTranslatorObj.Create: IExcelTranslatorObj;
begin
  Result := CreateComObject(CLASS_ExcelTranslatorObj) as IExcelTranslatorObj;
end;

class function CoExcelTranslatorObj.CreateRemote(const MachineName: string): IExcelTranslatorObj;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ExcelTranslatorObj) as IExcelTranslatorObj;
end;

end.

