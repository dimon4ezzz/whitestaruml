unit Generator_TLB;

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
// File generated on 2005-10-26 ¿ÀÈÄ 4:43:01 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\StarUML\modules\org.staruml.generator\Generator.dll (1)
// LIBID: {F8FC212E-DE4B-4CE2-BB29-F5EB248F3946}
// LCID: 0
// Helpfile: 
// HelpString: StarUML Generator Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// Parent TypeLibrary:
//   (0) v1.0 PowerPointTranslator, (D:\PLASTIC_CVS\plastic\generator\src\translators\powerpoint-translator\PowerPointTranslator.tlb)
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
  GeneratorMajorVersion = 1;
  GeneratorMinorVersion = 0;

  LIBID_Generator: TGUID = '{F8FC212E-DE4B-4CE2-BB29-F5EB248F3946}';

  IID_IGeneratorProcessor: TGUID = '{00C6167E-D50D-4851-B189-08E61E51F5A1}';
  CLASS_GeneratorProcessor: TGUID = '{240D97F3-D51C-4D2D-B3B5-3D7196C132EE}';
  IID_ITranslator: TGUID = '{AE6B46B5-83DC-4DF3-8287-2D50A36F5244}';
  IID_ILogger: TGUID = '{9E624710-F63D-4B1A-828D-90A2A2018E41}';
  IID_IHashTable: TGUID = '{43A0E95F-CB27-4D2E-9702-6476C19C9B1D}';
  CLASS_HashTable: TGUID = '{C559E4F4-11A3-4474-BC89-710B840BACC8}';
  IID_IGeneratorApplication: TGUID = '{0DFD8452-B67D-47DA-BB3D-1E285F48AD86}';
  CLASS_GeneratorApplication: TGUID = '{B6D17E11-A166-4F6C-AA6F-32CEC2968BA4}';
  CLASS_LogAdaptor: TGUID = '{347C57B6-FF56-4578-8568-D5B55F53857D}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum LogMessageKind
type
  LogMessageKind = TOleEnum;
const
  lmNormal = $00000000;
  lmInformation = $00000001;
  lmWarning = $00000002;
  lmError = $00000003;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IGeneratorProcessor = interface;
  IGeneratorProcessorDisp = dispinterface;
  ITranslator = interface;
  ITranslatorDisp = dispinterface;
  ILogger = interface;
  ILoggerDisp = dispinterface;
  IHashTable = interface;
  IHashTableDisp = dispinterface;
  IGeneratorApplication = interface;
  IGeneratorApplicationDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  GeneratorProcessor = IGeneratorProcessor;
  HashTable = IHashTable;
  GeneratorApplication = IGeneratorApplication;
  LogAdaptor = ILogger;


// *********************************************************************//
// Interface: IGeneratorProcessor
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {00C6167E-D50D-4851-B189-08E61E51F5A1}
// *********************************************************************//
  IGeneratorProcessor = interface(IDispatch)
    ['{00C6167E-D50D-4851-B189-08E61E51F5A1}']
    function ExecuteBatch(const Path: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGeneratorProcessorDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {00C6167E-D50D-4851-B189-08E61E51F5A1}
// *********************************************************************//
  IGeneratorProcessorDisp = dispinterface
    ['{00C6167E-D50D-4851-B189-08E61E51F5A1}']
    function ExecuteBatch(const Path: WideString): WordBool; dispid 1;
  end;

// *********************************************************************//
// Interface: ITranslator
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {AE6B46B5-83DC-4DF3-8287-2D50A36F5244}
// *********************************************************************//
  ITranslator = interface(IDispatch)
    ['{AE6B46B5-83DC-4DF3-8287-2D50A36F5244}']
    function Execute(const Args: IHashTable; out ResultValues: IHashTable): WordBool; safecall;
    procedure SetLogger(const Logger: ILogger); safecall;
    function GetGeneratedFileCount: Integer; safecall;
    function GetGeneratedFileAt(Index: Integer): WideString; safecall;
    procedure Abort; safecall;
  end;

// *********************************************************************//
// DispIntf:  ITranslatorDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {AE6B46B5-83DC-4DF3-8287-2D50A36F5244}
// *********************************************************************//
  ITranslatorDisp = dispinterface
    ['{AE6B46B5-83DC-4DF3-8287-2D50A36F5244}']
    function Execute(const Args: IHashTable; out ResultValues: IHashTable): WordBool; dispid 1;
    procedure SetLogger(const Logger: ILogger); dispid 2;
    function GetGeneratedFileCount: Integer; dispid 3;
    function GetGeneratedFileAt(Index: Integer): WideString; dispid 4;
    procedure Abort; dispid 5;
  end;

// *********************************************************************//
// Interface: ILogger
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9E624710-F63D-4B1A-828D-90A2A2018E41}
// *********************************************************************//
  ILogger = interface(IDispatch)
    ['{9E624710-F63D-4B1A-828D-90A2A2018E41}']
    procedure Log(const Msg: WideString; MsgKind: LogMessageKind); safecall;
    procedure Progress(Position: Integer; Max: Integer); safecall;
    procedure Notify(const Msg: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  ILoggerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9E624710-F63D-4B1A-828D-90A2A2018E41}
// *********************************************************************//
  ILoggerDisp = dispinterface
    ['{9E624710-F63D-4B1A-828D-90A2A2018E41}']
    procedure Log(const Msg: WideString; MsgKind: LogMessageKind); dispid 1;
    procedure Progress(Position: Integer; Max: Integer); dispid 2;
    procedure Notify(const Msg: WideString); dispid 3;
  end;

// *********************************************************************//
// Interface: IHashTable
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {43A0E95F-CB27-4D2E-9702-6476C19C9B1D}
// *********************************************************************//
  IHashTable = interface(IDispatch)
    ['{43A0E95F-CB27-4D2E-9702-6476C19C9B1D}']
    function Get(const Key: WideString): WideString; safecall;
    procedure Put(const Key: WideString; const Value: WideString); safecall;
    procedure Clear; safecall;
  end;

// *********************************************************************//
// DispIntf:  IHashTableDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {43A0E95F-CB27-4D2E-9702-6476C19C9B1D}
// *********************************************************************//
  IHashTableDisp = dispinterface
    ['{43A0E95F-CB27-4D2E-9702-6476C19C9B1D}']
    function Get(const Key: WideString): WideString; dispid 1;
    procedure Put(const Key: WideString; const Value: WideString); dispid 2;
    procedure Clear; dispid 3;
  end;

// *********************************************************************//
// Interface: IGeneratorApplication
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0DFD8452-B67D-47DA-BB3D-1E285F48AD86}
// *********************************************************************//
  IGeneratorApplication = interface(IDispatch)
    ['{0DFD8452-B67D-47DA-BB3D-1E285F48AD86}']
  end;

// *********************************************************************//
// DispIntf:  IGeneratorApplicationDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0DFD8452-B67D-47DA-BB3D-1E285F48AD86}
// *********************************************************************//
  IGeneratorApplicationDisp = dispinterface
    ['{0DFD8452-B67D-47DA-BB3D-1E285F48AD86}']
  end;

// *********************************************************************//
// The Class CoGeneratorProcessor provides a Create and CreateRemote method to          
// create instances of the default interface IGeneratorProcessor exposed by              
// the CoClass GeneratorProcessor. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGeneratorProcessor = class
    class function Create: IGeneratorProcessor;
    class function CreateRemote(const MachineName: string): IGeneratorProcessor;
  end;

// *********************************************************************//
// The Class CoHashTable provides a Create and CreateRemote method to          
// create instances of the default interface IHashTable exposed by              
// the CoClass HashTable. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoHashTable = class
    class function Create: IHashTable;
    class function CreateRemote(const MachineName: string): IHashTable;
  end;

// *********************************************************************//
// The Class CoGeneratorApplication provides a Create and CreateRemote method to          
// create instances of the default interface IGeneratorApplication exposed by              
// the CoClass GeneratorApplication. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGeneratorApplication = class
    class function Create: IGeneratorApplication;
    class function CreateRemote(const MachineName: string): IGeneratorApplication;
  end;

// *********************************************************************//
// The Class CoLogAdaptor provides a Create and CreateRemote method to          
// create instances of the default interface ILogger exposed by              
// the CoClass LogAdaptor. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLogAdaptor = class
    class function Create: ILogger;
    class function CreateRemote(const MachineName: string): ILogger;
  end;

implementation

uses ComObj;

class function CoGeneratorProcessor.Create: IGeneratorProcessor;
begin
  Result := CreateComObject(CLASS_GeneratorProcessor) as IGeneratorProcessor;
end;

class function CoGeneratorProcessor.CreateRemote(const MachineName: string): IGeneratorProcessor;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_GeneratorProcessor) as IGeneratorProcessor;
end;

class function CoHashTable.Create: IHashTable;
begin
  Result := CreateComObject(CLASS_HashTable) as IHashTable;
end;

class function CoHashTable.CreateRemote(const MachineName: string): IHashTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_HashTable) as IHashTable;
end;

class function CoGeneratorApplication.Create: IGeneratorApplication;
begin
  Result := CreateComObject(CLASS_GeneratorApplication) as IGeneratorApplication;
end;

class function CoGeneratorApplication.CreateRemote(const MachineName: string): IGeneratorApplication;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_GeneratorApplication) as IGeneratorApplication;
end;

class function CoLogAdaptor.Create: ILogger;
begin
  Result := CreateComObject(CLASS_LogAdaptor) as ILogger;
end;

class function CoLogAdaptor.CreateRemote(const MachineName: string): ILogger;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_LogAdaptor) as ILogger;
end;

end.
