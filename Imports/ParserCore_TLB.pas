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

// $Rev: 52393 $
// File generated on 1/30/2016 12:51:40 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforgeTrunkXE5\staruml\components\parser-core\ParserCore\bin\Release\ParserCore.tlb (1)
// LIBID: {A5D0740F-EC13-4236-BBC6-9FD1D78BD0AA}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
//   (3) v1.1 WhiteStarUML, (C:\JS\Delphi\WhiteStarDevInstall64\WhiteStarUML.exe)
// SYS_KIND: SYS_WIN32
// Errors:
//   Error creating palette bitmap of (TNameExprParserCoreImpl) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TAttrExprParserCoreImpl) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TMsgExprParserCoreImpl) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TObjExprParserCoreImpl) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TOperExprParserCoreImpl) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TRoleExprParserCoreImpl) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TTransExprParserCoreImpl) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TNxParser) : Server mscoree.dll contains no icons
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, mscorlib_TLB, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, WhiteStarUML_TLB, 
Winapi.ActiveX;
  

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
  ParserCoreMinorVersion = 3;

  LIBID_ParserCore: TGUID = '{A5D0740F-EC13-4236-BBC6-9FD1D78BD0AA}';

  IID_IParserCore: TGUID = '{C2D5AA24-3633-479B-9EA2-5AADBECE1ECE}';
  CLASS_NameExprParserCoreImpl: TGUID = '{41B17622-6FBA-4683-AACD-402F7F021D17}';
  CLASS_AttrExprParserCoreImpl: TGUID = '{90971B47-C855-4E13-96C0-4B2896D03E45}';
  CLASS_MsgExprParserCoreImpl: TGUID = '{822AEBDE-A58E-4A2F-8D21-C676237A8F9A}';
  CLASS_ObjExprParserCoreImpl: TGUID = '{CB20E29D-DC2D-496D-B7FC-5A85D7D2B22E}';
  CLASS_OperExprParserCoreImpl: TGUID = '{0A4BD2B2-518C-48AA-A472-FB8A02296FC6}';
  CLASS_RoleExprParserCoreImpl: TGUID = '{E4D99203-E233-4961-B2C3-9E728E92D980}';
  CLASS_TransExprParserCoreImpl: TGUID = '{958DCE18-DB33-4F20-8ADE-B3B6D97260BF}';
  IID_INxParser: TGUID = '{DD062285-0F54-4871-9F59-42A3BA4C46AF}';
  CLASS_NxParser: TGUID = '{88EDE9D0-6E37-4B00-86D7-B689C9748661}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IParserCore = interface;
  IParserCoreDisp = dispinterface;
  INxParser = interface;
  INxParserDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  NameExprParserCoreImpl = IParserCore;
  AttrExprParserCoreImpl = IParserCore;
  MsgExprParserCoreImpl = IParserCore;
  ObjExprParserCoreImpl = IParserCore;
  OperExprParserCoreImpl = IParserCore;
  RoleExprParserCoreImpl = IParserCore;
  TransExprParserCoreImpl = IParserCore;
  NxParser = INxParser;


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
// Interface: INxParser
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DD062285-0F54-4871-9F59-42A3BA4C46AF}
// *********************************************************************//
  INxParser = interface(IDispatch)
    ['{DD062285-0F54-4871-9F59-42A3BA4C46AF}']
    function Parse(const fileName: WideString; const builder: IExprBuilder): WordBool; safecall;
    function GetFailMessage: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  INxParserDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DD062285-0F54-4871-9F59-42A3BA4C46AF}
// *********************************************************************//
  INxParserDisp = dispinterface
    ['{DD062285-0F54-4871-9F59-42A3BA4C46AF}']
    function Parse(const fileName: WideString; const builder: IExprBuilder): WordBool; dispid 1610743808;
    function GetFailMessage: WideString; dispid 1610743809;
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
// OLE Server Proxy class declaration
// Server Object    : TNameExprParserCoreImpl
// Help String      : 
// Default Interface: IParserCore
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TNameExprParserCoreImpl = class(TOleServer)
  private
    FIntf: IParserCore;
    function GetDefaultInterface: IParserCore;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IParserCore);
    procedure Disconnect; override;
    function Parse(const parserInputData: WideString): WordBool;
    function FindNodeValue(const searchPath: WideString): WideString;
    function GetFailMessage: WideString;
    property DefaultInterface: IParserCore read GetDefaultInterface;
  published
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
// OLE Server Proxy class declaration
// Server Object    : TAttrExprParserCoreImpl
// Help String      : 
// Default Interface: IParserCore
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAttrExprParserCoreImpl = class(TOleServer)
  private
    FIntf: IParserCore;
    function GetDefaultInterface: IParserCore;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IParserCore);
    procedure Disconnect; override;
    function Parse(const parserInputData: WideString): WordBool;
    function FindNodeValue(const searchPath: WideString): WideString;
    function GetFailMessage: WideString;
    property DefaultInterface: IParserCore read GetDefaultInterface;
  published
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
// OLE Server Proxy class declaration
// Server Object    : TMsgExprParserCoreImpl
// Help String      : 
// Default Interface: IParserCore
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TMsgExprParserCoreImpl = class(TOleServer)
  private
    FIntf: IParserCore;
    function GetDefaultInterface: IParserCore;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IParserCore);
    procedure Disconnect; override;
    function Parse(const parserInputData: WideString): WordBool;
    function FindNodeValue(const searchPath: WideString): WideString;
    function GetFailMessage: WideString;
    property DefaultInterface: IParserCore read GetDefaultInterface;
  published
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
// OLE Server Proxy class declaration
// Server Object    : TObjExprParserCoreImpl
// Help String      : 
// Default Interface: IParserCore
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TObjExprParserCoreImpl = class(TOleServer)
  private
    FIntf: IParserCore;
    function GetDefaultInterface: IParserCore;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IParserCore);
    procedure Disconnect; override;
    function Parse(const parserInputData: WideString): WordBool;
    function FindNodeValue(const searchPath: WideString): WideString;
    function GetFailMessage: WideString;
    property DefaultInterface: IParserCore read GetDefaultInterface;
  published
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
// OLE Server Proxy class declaration
// Server Object    : TOperExprParserCoreImpl
// Help String      : 
// Default Interface: IParserCore
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TOperExprParserCoreImpl = class(TOleServer)
  private
    FIntf: IParserCore;
    function GetDefaultInterface: IParserCore;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IParserCore);
    procedure Disconnect; override;
    function Parse(const parserInputData: WideString): WordBool;
    function FindNodeValue(const searchPath: WideString): WideString;
    function GetFailMessage: WideString;
    property DefaultInterface: IParserCore read GetDefaultInterface;
  published
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
// OLE Server Proxy class declaration
// Server Object    : TRoleExprParserCoreImpl
// Help String      : 
// Default Interface: IParserCore
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TRoleExprParserCoreImpl = class(TOleServer)
  private
    FIntf: IParserCore;
    function GetDefaultInterface: IParserCore;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IParserCore);
    procedure Disconnect; override;
    function Parse(const parserInputData: WideString): WordBool;
    function FindNodeValue(const searchPath: WideString): WideString;
    function GetFailMessage: WideString;
    property DefaultInterface: IParserCore read GetDefaultInterface;
  published
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


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTransExprParserCoreImpl
// Help String      : 
// Default Interface: IParserCore
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TTransExprParserCoreImpl = class(TOleServer)
  private
    FIntf: IParserCore;
    function GetDefaultInterface: IParserCore;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IParserCore);
    procedure Disconnect; override;
    function Parse(const parserInputData: WideString): WordBool;
    function FindNodeValue(const searchPath: WideString): WideString;
    function GetFailMessage: WideString;
    property DefaultInterface: IParserCore read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoNxParser provides a Create and CreateRemote method to          
// create instances of the default interface INxParser exposed by              
// the CoClass NxParser. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNxParser = class
    class function Create: INxParser;
    class function CreateRemote(const MachineName: string): INxParser;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TNxParser
// Help String      : 
// Default Interface: INxParser
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TNxParser = class(TOleServer)
  private
    FIntf: INxParser;
    function GetDefaultInterface: INxParser;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: INxParser);
    procedure Disconnect; override;
    function Parse(const fileName: WideString; const builder: IExprBuilder): WordBool;
    function GetFailMessage: WideString;
    property DefaultInterface: INxParser read GetDefaultInterface;
  published
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

class function CoNameExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_NameExprParserCoreImpl) as IParserCore;
end;

class function CoNameExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_NameExprParserCoreImpl) as IParserCore;
end;

procedure TNameExprParserCoreImpl.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{41B17622-6FBA-4683-AACD-402F7F021D17}';
    IntfIID:   '{C2D5AA24-3633-479B-9EA2-5AADBECE1ECE}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TNameExprParserCoreImpl.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IParserCore;
  end;
end;

procedure TNameExprParserCoreImpl.ConnectTo(svrIntf: IParserCore);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TNameExprParserCoreImpl.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TNameExprParserCoreImpl.GetDefaultInterface: IParserCore;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TNameExprParserCoreImpl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TNameExprParserCoreImpl.Destroy;
begin
  inherited Destroy;
end;

function TNameExprParserCoreImpl.Parse(const parserInputData: WideString): WordBool;
begin
  Result := DefaultInterface.Parse(parserInputData);
end;

function TNameExprParserCoreImpl.FindNodeValue(const searchPath: WideString): WideString;
begin
  Result := DefaultInterface.FindNodeValue(searchPath);
end;

function TNameExprParserCoreImpl.GetFailMessage: WideString;
begin
  Result := DefaultInterface.GetFailMessage;
end;

class function CoAttrExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_AttrExprParserCoreImpl) as IParserCore;
end;

class function CoAttrExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AttrExprParserCoreImpl) as IParserCore;
end;

procedure TAttrExprParserCoreImpl.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{90971B47-C855-4E13-96C0-4B2896D03E45}';
    IntfIID:   '{C2D5AA24-3633-479B-9EA2-5AADBECE1ECE}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAttrExprParserCoreImpl.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IParserCore;
  end;
end;

procedure TAttrExprParserCoreImpl.ConnectTo(svrIntf: IParserCore);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAttrExprParserCoreImpl.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAttrExprParserCoreImpl.GetDefaultInterface: IParserCore;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TAttrExprParserCoreImpl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TAttrExprParserCoreImpl.Destroy;
begin
  inherited Destroy;
end;

function TAttrExprParserCoreImpl.Parse(const parserInputData: WideString): WordBool;
begin
  Result := DefaultInterface.Parse(parserInputData);
end;

function TAttrExprParserCoreImpl.FindNodeValue(const searchPath: WideString): WideString;
begin
  Result := DefaultInterface.FindNodeValue(searchPath);
end;

function TAttrExprParserCoreImpl.GetFailMessage: WideString;
begin
  Result := DefaultInterface.GetFailMessage;
end;

class function CoMsgExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_MsgExprParserCoreImpl) as IParserCore;
end;

class function CoMsgExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MsgExprParserCoreImpl) as IParserCore;
end;

procedure TMsgExprParserCoreImpl.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{822AEBDE-A58E-4A2F-8D21-C676237A8F9A}';
    IntfIID:   '{C2D5AA24-3633-479B-9EA2-5AADBECE1ECE}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMsgExprParserCoreImpl.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IParserCore;
  end;
end;

procedure TMsgExprParserCoreImpl.ConnectTo(svrIntf: IParserCore);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMsgExprParserCoreImpl.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMsgExprParserCoreImpl.GetDefaultInterface: IParserCore;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TMsgExprParserCoreImpl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TMsgExprParserCoreImpl.Destroy;
begin
  inherited Destroy;
end;

function TMsgExprParserCoreImpl.Parse(const parserInputData: WideString): WordBool;
begin
  Result := DefaultInterface.Parse(parserInputData);
end;

function TMsgExprParserCoreImpl.FindNodeValue(const searchPath: WideString): WideString;
begin
  Result := DefaultInterface.FindNodeValue(searchPath);
end;

function TMsgExprParserCoreImpl.GetFailMessage: WideString;
begin
  Result := DefaultInterface.GetFailMessage;
end;

class function CoObjExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_ObjExprParserCoreImpl) as IParserCore;
end;

class function CoObjExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ObjExprParserCoreImpl) as IParserCore;
end;

procedure TObjExprParserCoreImpl.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{CB20E29D-DC2D-496D-B7FC-5A85D7D2B22E}';
    IntfIID:   '{C2D5AA24-3633-479B-9EA2-5AADBECE1ECE}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TObjExprParserCoreImpl.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IParserCore;
  end;
end;

procedure TObjExprParserCoreImpl.ConnectTo(svrIntf: IParserCore);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TObjExprParserCoreImpl.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TObjExprParserCoreImpl.GetDefaultInterface: IParserCore;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TObjExprParserCoreImpl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TObjExprParserCoreImpl.Destroy;
begin
  inherited Destroy;
end;

function TObjExprParserCoreImpl.Parse(const parserInputData: WideString): WordBool;
begin
  Result := DefaultInterface.Parse(parserInputData);
end;

function TObjExprParserCoreImpl.FindNodeValue(const searchPath: WideString): WideString;
begin
  Result := DefaultInterface.FindNodeValue(searchPath);
end;

function TObjExprParserCoreImpl.GetFailMessage: WideString;
begin
  Result := DefaultInterface.GetFailMessage;
end;

class function CoOperExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_OperExprParserCoreImpl) as IParserCore;
end;

class function CoOperExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OperExprParserCoreImpl) as IParserCore;
end;

procedure TOperExprParserCoreImpl.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0A4BD2B2-518C-48AA-A472-FB8A02296FC6}';
    IntfIID:   '{C2D5AA24-3633-479B-9EA2-5AADBECE1ECE}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TOperExprParserCoreImpl.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IParserCore;
  end;
end;

procedure TOperExprParserCoreImpl.ConnectTo(svrIntf: IParserCore);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TOperExprParserCoreImpl.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TOperExprParserCoreImpl.GetDefaultInterface: IParserCore;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TOperExprParserCoreImpl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TOperExprParserCoreImpl.Destroy;
begin
  inherited Destroy;
end;

function TOperExprParserCoreImpl.Parse(const parserInputData: WideString): WordBool;
begin
  Result := DefaultInterface.Parse(parserInputData);
end;

function TOperExprParserCoreImpl.FindNodeValue(const searchPath: WideString): WideString;
begin
  Result := DefaultInterface.FindNodeValue(searchPath);
end;

function TOperExprParserCoreImpl.GetFailMessage: WideString;
begin
  Result := DefaultInterface.GetFailMessage;
end;

class function CoRoleExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_RoleExprParserCoreImpl) as IParserCore;
end;

class function CoRoleExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RoleExprParserCoreImpl) as IParserCore;
end;

procedure TRoleExprParserCoreImpl.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{E4D99203-E233-4961-B2C3-9E728E92D980}';
    IntfIID:   '{C2D5AA24-3633-479B-9EA2-5AADBECE1ECE}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRoleExprParserCoreImpl.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IParserCore;
  end;
end;

procedure TRoleExprParserCoreImpl.ConnectTo(svrIntf: IParserCore);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRoleExprParserCoreImpl.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRoleExprParserCoreImpl.GetDefaultInterface: IParserCore;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRoleExprParserCoreImpl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TRoleExprParserCoreImpl.Destroy;
begin
  inherited Destroy;
end;

function TRoleExprParserCoreImpl.Parse(const parserInputData: WideString): WordBool;
begin
  Result := DefaultInterface.Parse(parserInputData);
end;

function TRoleExprParserCoreImpl.FindNodeValue(const searchPath: WideString): WideString;
begin
  Result := DefaultInterface.FindNodeValue(searchPath);
end;

function TRoleExprParserCoreImpl.GetFailMessage: WideString;
begin
  Result := DefaultInterface.GetFailMessage;
end;

class function CoTransExprParserCoreImpl.Create: IParserCore;
begin
  Result := CreateComObject(CLASS_TransExprParserCoreImpl) as IParserCore;
end;

class function CoTransExprParserCoreImpl.CreateRemote(const MachineName: string): IParserCore;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TransExprParserCoreImpl) as IParserCore;
end;

procedure TTransExprParserCoreImpl.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{958DCE18-DB33-4F20-8ADE-B3B6D97260BF}';
    IntfIID:   '{C2D5AA24-3633-479B-9EA2-5AADBECE1ECE}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTransExprParserCoreImpl.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IParserCore;
  end;
end;

procedure TTransExprParserCoreImpl.ConnectTo(svrIntf: IParserCore);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTransExprParserCoreImpl.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTransExprParserCoreImpl.GetDefaultInterface: IParserCore;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TTransExprParserCoreImpl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TTransExprParserCoreImpl.Destroy;
begin
  inherited Destroy;
end;

function TTransExprParserCoreImpl.Parse(const parserInputData: WideString): WordBool;
begin
  Result := DefaultInterface.Parse(parserInputData);
end;

function TTransExprParserCoreImpl.FindNodeValue(const searchPath: WideString): WideString;
begin
  Result := DefaultInterface.FindNodeValue(searchPath);
end;

function TTransExprParserCoreImpl.GetFailMessage: WideString;
begin
  Result := DefaultInterface.GetFailMessage;
end;

class function CoNxParser.Create: INxParser;
begin
  Result := CreateComObject(CLASS_NxParser) as INxParser;
end;

class function CoNxParser.CreateRemote(const MachineName: string): INxParser;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_NxParser) as INxParser;
end;

procedure TNxParser.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88EDE9D0-6E37-4B00-86D7-B689C9748661}';
    IntfIID:   '{DD062285-0F54-4871-9F59-42A3BA4C46AF}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TNxParser.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as INxParser;
  end;
end;

procedure TNxParser.ConnectTo(svrIntf: INxParser);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TNxParser.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TNxParser.GetDefaultInterface: INxParser;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TNxParser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TNxParser.Destroy;
begin
  inherited Destroy;
end;

function TNxParser.Parse(const fileName: WideString; const builder: IExprBuilder): WordBool;
begin
  Result := DefaultInterface.Parse(fileName, builder);
end;

function TNxParser.GetFailMessage: WideString;
begin
  Result := DefaultInterface.GetFailMessage;
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TNameExprParserCoreImpl, TAttrExprParserCoreImpl, TMsgExprParserCoreImpl, TObjExprParserCoreImpl, 
    TOperExprParserCoreImpl, TRoleExprParserCoreImpl, TTransExprParserCoreImpl, TNxParser]);
end;

end.
