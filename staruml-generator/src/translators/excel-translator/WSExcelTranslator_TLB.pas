unit WSExcelTranslator_TLB;

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
// File generated on 6/7/2015 3:46:36 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforgeTrunkXE5\staruml-generator\src\translators\excel-translator\WSExcelTranslator (1)
// LIBID: {B2C6F7DF-3DD2-4D6B-9951-F608DC6360BD}
// LCID: 0
// Helpfile:
// HelpString: ExcelTranslator Library
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 WSGenerator, (C:\JS\Delphi\WhiteStarDevInstall64\modules\staruml-generator\Generator.dll)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX, WSGenerator_TLB;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  WSExcelTranslatorMajorVersion = 1;
  WSExcelTranslatorMinorVersion = 0;

  LIBID_WSExcelTranslator: TGUID = '{B2C6F7DF-3DD2-4D6B-9951-F608DC6360BD}';

  CLASS_ExcelTranslatorObj: TGUID = '{36DA5BA0-B37E-49A0-8C59-6DACAD880BDE}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  ExcelTranslatorObj = ITranslator;


// *********************************************************************//
// The Class CoExcelTranslatorObj provides a Create and CreateRemote method to
// create instances of the default interface ITranslator exposed by
// the CoClass ExcelTranslatorObj. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoExcelTranslatorObj = class
    class function Create: ITranslator;
    class function CreateRemote(const MachineName: string): ITranslator;
  end;

implementation

uses System.Win.ComObj;

class function CoExcelTranslatorObj.Create: ITranslator;
begin
  Result := CreateComObject(CLASS_ExcelTranslatorObj) as ITranslator;
end;

class function CoExcelTranslatorObj.CreateRemote(const MachineName: string): ITranslator;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ExcelTranslatorObj) as ITranslator;
end;

end.

