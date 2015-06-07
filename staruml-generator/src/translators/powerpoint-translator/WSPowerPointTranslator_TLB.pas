unit WSPowerPointTranslator_TLB;

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
// File generated on 6/7/2015 3:45:56 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforgeTrunkXE5\staruml-generator\src\translators\powerpoint-translator\WSPowerPointTranslator (1)
// LIBID: {AC9DE618-78D1-483A-B543-5C25D203F893}
// LCID: 0
// Helpfile:
// HelpString: PowerPointTranslator Library
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
  WSPowerPointTranslatorMajorVersion = 1;
  WSPowerPointTranslatorMinorVersion = 0;

  LIBID_WSPowerPointTranslator: TGUID = '{AC9DE618-78D1-483A-B543-5C25D203F893}';

  CLASS_PowerPointTranslatorObj: TGUID = '{14E57C1D-24CA-4013-87E4-B5FA373A976D}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  PowerPointTranslatorObj = ITranslator;


// *********************************************************************//
// The Class CoPowerPointTranslatorObj provides a Create and CreateRemote method to
// create instances of the default interface ITranslator exposed by
// the CoClass PowerPointTranslatorObj. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoPowerPointTranslatorObj = class
    class function Create: ITranslator;
    class function CreateRemote(const MachineName: string): ITranslator;
  end;

implementation

uses System.Win.ComObj;

class function CoPowerPointTranslatorObj.Create: ITranslator;
begin
  Result := CreateComObject(CLASS_PowerPointTranslatorObj) as ITranslator;
end;

class function CoPowerPointTranslatorObj.CreateRemote(const MachineName: string): ITranslator;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PowerPointTranslatorObj) as ITranslator;
end;

end.

