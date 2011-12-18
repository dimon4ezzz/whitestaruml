unit TextTranslator_TLB;

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
// File generated on 2005-10-26 ¿ÀÈÄ 6:51:46 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\PLASTIC_CVS\plastic\generator\src\translators\text-translator\TextTranslator.tlb (1)
// LIBID: {54615F56-374B-4648-BB66-AB6B1CD2727E}
// LCID: 0
// Helpfile: 
// HelpString: TextTranslator Library
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
  TextTranslatorMajorVersion = 1;
  TextTranslatorMinorVersion = 0;

  LIBID_TextTranslator: TGUID = '{54615F56-374B-4648-BB66-AB6B1CD2727E}';

  IID_ITextTranslatorObj: TGUID = '{0603EA84-39B6-4671-8A4A-D010EAC16071}';
  CLASS_TextTranslatorObj: TGUID = '{A28FC332-ADFD-415D-BFCF-3793E6A7918F}';
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
