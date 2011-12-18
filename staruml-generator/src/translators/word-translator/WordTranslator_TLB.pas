unit WordTranslator_TLB;

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
// File generated on 2005-10-25 ¿ÀÀü 11:34:02 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\PLASTIC_CVS\plastic\generator\src\translators\word-translator\WordTranslator.tlb (1)
// LIBID: {4D324ECE-F049-40C9-8054-CAB2615BF716}
// LCID: 0
// Helpfile: 
// HelpString: WordTranslator Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  WordTranslatorMajorVersion = 1;
  WordTranslatorMinorVersion = 0;

  LIBID_WordTranslator: TGUID = '{4D324ECE-F049-40C9-8054-CAB2615BF716}';

  IID_IWordTranslatorObj: TGUID = '{64F82205-5A1A-482D-A643-1E6A0BAA11FC}';
  CLASS_WordTranslatorObj: TGUID = '{C98DDB62-E8E2-4F50-9C90-BB39ED2AA301}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IWordTranslatorObj = interface;
  IWordTranslatorObjDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  WordTranslatorObj = IWordTranslatorObj;


// *********************************************************************//
// Interface: IWordTranslatorObj
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {64F82205-5A1A-482D-A643-1E6A0BAA11FC}
// *********************************************************************//
  IWordTranslatorObj = interface(IDispatch)
    ['{64F82205-5A1A-482D-A643-1E6A0BAA11FC}']
  end;

// *********************************************************************//
// DispIntf:  IWordTranslatorObjDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {64F82205-5A1A-482D-A643-1E6A0BAA11FC}
// *********************************************************************//
  IWordTranslatorObjDisp = dispinterface
    ['{64F82205-5A1A-482D-A643-1E6A0BAA11FC}']
  end;

// *********************************************************************//
// The Class CoWordTranslatorObj provides a Create and CreateRemote method to          
// create instances of the default interface IWordTranslatorObj exposed by              
// the CoClass WordTranslatorObj. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoWordTranslatorObj = class
    class function Create: IWordTranslatorObj;
    class function CreateRemote(const MachineName: string): IWordTranslatorObj;
  end;

implementation

uses ComObj;

class function CoWordTranslatorObj.Create: IWordTranslatorObj;
begin
  Result := CreateComObject(CLASS_WordTranslatorObj) as IWordTranslatorObj;
end;

class function CoWordTranslatorObj.CreateRemote(const MachineName: string): IWordTranslatorObj;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WordTranslatorObj) as IWordTranslatorObj;
end;

end.
