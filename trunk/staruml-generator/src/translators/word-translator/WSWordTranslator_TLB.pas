unit WSWordTranslator_TLB;

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
// File generated on 6/7/2015 3:44:27 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforgeTrunkXE5\staruml-generator\src\translators\word-translator\WSWordTranslator (1)
// LIBID: {B50752CF-E0EC-445E-BB82-B32E94A9C878}
// LCID: 0
// Helpfile:
// HelpString: WordTranslator Library
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
  WSWordTranslatorMajorVersion = 1;
  WSWordTranslatorMinorVersion = 0;

  LIBID_WSWordTranslator: TGUID = '{B50752CF-E0EC-445E-BB82-B32E94A9C878}';

  CLASS_WordTranslatorObj: TGUID = '{15EDB416-C580-42FF-925B-D7960AF693A3}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  WordTranslatorObj = ITranslator;


// *********************************************************************//
// The Class CoWordTranslatorObj provides a Create and CreateRemote method to
// create instances of the default interface ITranslator exposed by
// the CoClass WordTranslatorObj. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoWordTranslatorObj = class
    class function Create: ITranslator;
    class function CreateRemote(const MachineName: string): ITranslator;
  end;

implementation

uses System.Win.ComObj;

class function CoWordTranslatorObj.Create: ITranslator;
begin
  Result := CreateComObject(CLASS_WordTranslatorObj) as ITranslator;
end;

class function CoWordTranslatorObj.CreateRemote(const MachineName: string): ITranslator;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WordTranslatorObj) as ITranslator;
end;

end.

