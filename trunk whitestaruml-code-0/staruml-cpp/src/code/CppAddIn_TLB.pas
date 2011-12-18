unit CppAddIn_TLB;

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
// File generated on 03/12/2011 14:13:57 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\StarUML\staruml-cpp\src\code\CppAddIn (1)
// LIBID: {F536C296-897D-4FC0-9C94-B263A0B350F8}
// LCID: 0
// Helpfile:
// HelpString: CppAddIn Library
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 StarUML, (C:\JS\Delphi\StarUMLFresh\StarUML.exe)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StarUML_TLB, StdVCL, Variants;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CppAddInMajorVersion = 1;
  CppAddInMinorVersion = 0;

  LIBID_CppAddIn: TGUID = '{F536C296-897D-4FC0-9C94-B263A0B350F8}';

  CLASS_CppAddInObj: TGUID = '{34480074-9829-4543-B43D-FF0421F2C8DF}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  CppAddInObj = IStarUMLAddIn;


// *********************************************************************//
// The Class CoCppAddInObj provides a Create and CreateRemote method to
// create instances of the default interface IStarUMLAddIn exposed by
// the CoClass CppAddInObj. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoCppAddInObj = class
    class function Create: IStarUMLAddIn;
    class function CreateRemote(const MachineName: string): IStarUMLAddIn;
  end;

implementation

uses ComObj;

class function CoCppAddInObj.Create: IStarUMLAddIn;
begin
  Result := CreateComObject(CLASS_CppAddInObj) as IStarUMLAddIn;
end;

class function CoCppAddInObj.CreateRemote(const MachineName: string): IStarUMLAddIn;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CppAddInObj) as IStarUMLAddIn;
end;

end.

