unit WSJavaAddIn_TLB;

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
// File generated on 23/02/2014 14:10:03 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforgeTrunkXE5\staruml-java\src\code\JavaAddIn (1)
// LIBID: {220A0C57-217D-4130-9B59-2307774BDDEA}
// LCID: 0
// Helpfile:
// HelpString: WSJavaAddIn Library
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWow64\stdole2.tlb)
//   (2) v1.0 WhiteStarUML, (C:\JS\Delphi\WhiteStarDevInstall\WhiteStarUML.exe)
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
  WSJavaAddInMajorVersion = 1;
  WSJavaAddInMinorVersion = 0;

  LIBID_WSJavaAddIn: TGUID = '{220A0C57-217D-4130-9B59-2307774BDDEA}';

  CLASS_JavaAddInObj: TGUID = '{8725EBC0-B0CC-40FF-80CC-32FC1F02F41C}';
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

