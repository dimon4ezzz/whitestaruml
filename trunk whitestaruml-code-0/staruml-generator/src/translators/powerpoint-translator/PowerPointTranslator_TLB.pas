unit PowerPointTranslator_TLB;

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

// PASTLWTR : 1.2
// File generated on 2005-10-26 ¿ÀÈÄ 4:15:47 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\PLASTIC_CVS\plastic\generator\src\translators\powerpoint-translator\PowerPointTranslator.tlb (1)
// LIBID: {DB39449E-A29E-4641-8A78-4A597B304D1A}
// LCID: 0
// Helpfile: 
// HelpString: PowerPointTranslator Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
//   (2) v1.0 Generator, (C:\Program Files\StarUML\modules\org.staruml.generator\Generator.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Generator_TLB, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  PowerPointTranslatorMajorVersion = 1;
  PowerPointTranslatorMinorVersion = 0;

  LIBID_PowerPointTranslator: TGUID = '{DB39449E-A29E-4641-8A78-4A597B304D1A}';

  IID_IPowerPointTranslatorObj: TGUID = '{3AD006D8-8E12-4440-A3DC-BB722EDE5BB2}';
  CLASS_PowerPointTranslatorObj: TGUID = '{A368F46A-99A0-4F97-BCD7-4404F2AA76DF}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IPowerPointTranslatorObj = interface;
  IPowerPointTranslatorObjDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  PowerPointTranslatorObj = IPowerPointTranslatorObj;


// *********************************************************************//
// Interface: IPowerPointTranslatorObj
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3AD006D8-8E12-4440-A3DC-BB722EDE5BB2}
// *********************************************************************//
  IPowerPointTranslatorObj = interface(IDispatch)
    ['{3AD006D8-8E12-4440-A3DC-BB722EDE5BB2}']
  end;

// *********************************************************************//
// DispIntf:  IPowerPointTranslatorObjDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3AD006D8-8E12-4440-A3DC-BB722EDE5BB2}
// *********************************************************************//
  IPowerPointTranslatorObjDisp = dispinterface
    ['{3AD006D8-8E12-4440-A3DC-BB722EDE5BB2}']
  end;

// *********************************************************************//
// The Class CoPowerPointTranslatorObj provides a Create and CreateRemote method to          
// create instances of the default interface IPowerPointTranslatorObj exposed by              
// the CoClass PowerPointTranslatorObj. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPowerPointTranslatorObj = class
    class function Create: IPowerPointTranslatorObj;
    class function CreateRemote(const MachineName: string): IPowerPointTranslatorObj;
  end;

implementation

uses ComObj;

class function CoPowerPointTranslatorObj.Create: IPowerPointTranslatorObj;
begin
  Result := CreateComObject(CLASS_PowerPointTranslatorObj) as IPowerPointTranslatorObj;
end;

class function CoPowerPointTranslatorObj.CreateRemote(const MachineName: string): IPowerPointTranslatorObj;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PowerPointTranslatorObj) as IPowerPointTranslatorObj;
end;

end.
