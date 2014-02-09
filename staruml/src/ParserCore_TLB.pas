unit ParserCore_TLB;

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
// File generated on 2/9/2014 1:25:00 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforgeTrunk\staruml\components\parser-core\ParserCore\bin\Release\ParserCore.dll (1)
// LIBID: {1ED9044F-4A24-3F3B-9818-AB8D3D6BE960}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWow64\stdole2.tlb)
//   (2) v2.0 mscorlib, (C:\Windows\Microsoft.NET\Framework\v2.0.50727\mscorlib.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, mscorlib_TLB, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ParserCoreMajorVersion = 1;
  ParserCoreMinorVersion = 1;

  LIBID_ParserCore: TGUID = '{1ED9044F-4A24-3F3B-9818-AB8D3D6BE960}';

  IID_IParserCore: TGUID = '{C2D5AA24-3633-479B-9EA2-5AADBECE1ECE}';
  CLASS_ParserCoreImpl: TGUID = '{72AB6FAC-1910-3F59-AF48-6FDEDC6EB6B7}';
  CLASS_NameExprParserCoreImpl: TGUID = '{41B17622-6FBA-4683-AACD-402F7F021D17}';
  CLASS_AttrExprParserCoreImpl: TGUID = '{90971B47-C855-4E13-96C0-4B2896D03E45}';
  CLASS_MsgExprParserCoreImpl: TGUID = '{822AEBDE-A58E-4A2F-8D21-C676237A8F9A}';
  CLASS_ObjExprParserCoreImpl: TGUID = '{CB20E29D-DC2D-496D-B7FC-5A85D7D2B22E}';
  CLASS_OperExprParserCoreImpl: TGUID = '{0A4BD2B2-518C-48AA-A472-FB8A02296FC6}';
  CLASS_RoleExprParserCoreImpl: TGUID = '{E4D99203-E233-4961-B2C3-9E728E92D980}';
  CLASS_TransExprParserCoreImpl: TGUID = '{958DCE18-DB33-4F20-8ADE-B3B6D97260BF}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IParserCore = interface;
  IParserCoreDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ParserCoreImpl = _Object;
  NameExprParserCoreImpl = IParserCore;
  AttrExprParserCoreImpl = IParserCore;
  MsgExprParserCoreImpl = IParserCore;
  ObjExprParserCoreImpl = IParserCore;
  OperExprParserCoreImpl = IParserCore;
  RoleExprParserCoreImpl = IParserCore;
  TransExprParserCoreImpl = IParserCore;


// *********************************************************************//
// Interface: IParserCore
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C2D5AA24-3633-479B-9EA2-5AADBECE1ECE}
// *********************************************************************//
  IParserCore = interface(IDispatch)
    ['{C2D5AA24-3633-479B-9EA2-5AADBECE1ECE}']
    function Parse(const parserInputData: WideString): WordBool; safecall;
    function FindNodeValue(const searchPath: WideString): WideString; safecall;
    function GetFailMessage: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IParserCoreDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C2D5AA24-3633-479B-9EA2-5AADBECE1ECE}
// *********************************************************************//
  IParserCoreDisp = dispinterface
    ['{C2D5AA24-3633-479B-9EA2-5AADBECE1ECE}']
    function Parse(const parserInputData: WideString): WordBool; dispid 1610743808;
    function FindNodeValue(const searchPath: WideString): WideString; dispid 1610743809;
    function GetFailMessage: WideString; dispid 1610743810;
  end;

// *********************************************************************//
// The Class CoParserCoreImpl provides a Create and CreateRemote method to          
// create instances of the default interface _Object exposed by              
// the CoClass ParserCoreImpl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoParserCoreImpl = class
    class function Create: _Object;
    class function CreateRemote(const MachineName: string): _Object;
  end;

// *********************************************************************//
// The Class CoNameExprParserCoreImpl provides a Create and CreateRemote method to          
// create instances of the default interface IParserCore exposed by              
// the CoClass NameExprParserCoreImpl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNameExprParserCoreImpl = class
    class function Create: IParserCore;
    class function CreateRemote(const MachineName: string): IParserCore;
  end;

// *********************************************************************//
// The Class CoAttrExprParserCoreImpl provides a Create and CreateRemote method to          
// create instances of the default interface IParserCore exposed by              
// the CoClass AttrExprParserCoreImpl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAttrExprParserCoreImpl = class
    class function Create: IParserCore;
    class function CreateRemote(const MachineName: string): IParserCore;
  end;

// *********************************************************************//
// The Class CoMsgExprParserCoreImpl provides a Create and CreateRemote method to          
// create instances of the default interface IParserCore exposed by              
// the CoClass MsgExprParserCoreImpl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMsgExprParserCoreImpl = class
    class function Create: IParserCore;
    class function CreateRemote(const MachineName: string): IParserCore;
  end;

// *********************************************************************//
// The Class CoObjExprParserCoreImpl provides a Create and CreateRemote method to          
// create instances of the default interface IParserCore exposed by              
// the CoClass ObjExprParserCoreImpl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoObjExprParserCoreImpl = class
    class function Create: IParserCore;
    class function CreateRemote(const MachineName: string): IParserCore;
  end;

// *********************************************************************//
// The Class CoOperExprParserCoreImpl provides a Create and CreateRemote method to          
// create instances of the default interface IParserCore exposed by              
// the CoClass OperExprParserCoreImpl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOperExprParserCoreImpl = class
    class function Create: IParserCore;
    class function CreateRemote(const MachineName: string): IParserCore;
  end;

// *********************************************************************//
// The Class CoRoleExprParserCoreImpl provides a Create and CreateRemote method to          
// create instances of the default interface IParserCore exposed by              
// the CoClass RoleExprParserCoreImpl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRoleExprParserCoreImpl = class
    class function Create: IParserCore;
    class function CreateRemote(const MachineName: string): IParserCore;
  end;

// *********************************************************************//
// The Class CoTransExprParserCoreImpl provides a Create and CreateRemote method to          
// create instances of the default interface IParserCore exposed by              
// the CoClass TransExprParserCoreImpl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTransExprParserCoreImpl = class
    class function Create: IParserCore;
    class function CreateRemote(const MachineName: string): IParserCore;
  end;

implementation

uses ComObj;

class function CoParserCoreImpl.Create: _Object;
begin
  Result := CreateComObject(CLASS_ParserCoreImpl) as _Object;
end;

class function CoParserCoreImpl.CreateRemote(const MachineName: string): _Object;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ParserCoreImpl) as _Object;
end;

class function CoNameExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_NameExprParserCoreImpl) as IParserCore;
end;

class function CoNameExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_NameExprParserCoreImpl) as IParserCore;
end;

class function CoAttrExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_AttrExprParserCoreImpl) as IParserCore;
end;

class function CoAttrExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AttrExprParserCoreImpl) as IParserCore;
end;

class function CoMsgExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_MsgExprParserCoreImpl) as IParserCore;
end;

class function CoMsgExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MsgExprParserCoreImpl) as IParserCore;
end;

class function CoObjExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_ObjExprParserCoreImpl) as IParserCore;
end;

class function CoObjExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ObjExprParserCoreImpl) as IParserCore;
end;

class function CoOperExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_OperExprParserCoreImpl) as IParserCore;
end;

class function CoOperExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OperExprParserCoreImpl) as IParserCore;
end;

class function CoRoleExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_RoleExprParserCoreImpl) as IParserCore;
end;

class function CoRoleExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RoleExprParserCoreImpl) as IParserCore;
end;

class function CoTransExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_TransExprParserCoreImpl) as IParserCore;
end;

class function CoTransExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TransExprParserCoreImpl) as IParserCore;
end;

end.
