unit WINGRAPHVIZLib_TLB;

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
// File generated on 8/16/2011 9:24:35 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\StarUMLFresh\WinGraphviz.dll (1)
// LIBID: {052DB09C-95F7-43BD-B7F8-492373D1151E}
// LCID: 0
// Helpfile: 
// HelpString: WinGraphviz 1.01.7 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// Errors:
//   Hint: Parameter 'Type' of IDOT.ToTextGraph changed to 'Type_'
//   Hint: Parameter 'Type' of IDOT.ToBinaryGraph changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of INEATO.ToTextGraph changed to 'Type_'
//   Hint: Parameter 'Type' of INEATO.ToBinaryGraph changed to 'Type_'
//   Hint: Parameter 'Type' of ITWOPI.ToTextGraph changed to 'Type_'
//   Hint: Parameter 'Type' of ITWOPI.ToBinaryGraph changed to 'Type_'
//   Error creating palette bitmap of (TDOT) : Server C:\JS\Delphi\StarUMLFresh\WinGraphviz.dll contains no icons
//   Error creating palette bitmap of (TNEATO) : Server C:\JS\Delphi\StarUMLFresh\WinGraphviz.dll contains no icons
//   Error creating palette bitmap of (TBinaryImage) : Server C:\JS\Delphi\StarUMLFresh\WinGraphviz.dll contains no icons
//   Error creating palette bitmap of (TTWOPI) : Server C:\JS\Delphi\StarUMLFresh\WinGraphviz.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  WINGRAPHVIZLibMajorVersion = 1;
  WINGRAPHVIZLibMinorVersion = 0;

  LIBID_WINGRAPHVIZLib: TGUID = '{052DB09C-95F7-43BD-B7F8-492373D1151E}';

  IID_IDOT: TGUID = '{A1080582-D33F-486E-BD5F-581989A3C7E9}';
  CLASS_DOT: TGUID = '{55811839-47B0-4854-81B5-0A0031B8ACEC}';
  IID_IBinaryImage: TGUID = '{FFF6CEBE-BD9B-4C3A-A274-12E600B6BD10}';
  IID_ISequentialStream: TGUID = '{0C733A30-2A1C-11CE-ADE5-00AA0044773D}';
  IID_IStream: TGUID = '{0000000C-0000-0000-C000-000000000046}';
  IID_INEATO: TGUID = '{B41D4C33-882C-4534-8352-EE981323CD96}';
  CLASS_NEATO: TGUID = '{1F25D86C-95BC-4E33-A177-EE8DABEF8B04}';
  CLASS_BinaryImage: TGUID = '{6B3F62C8-80CE-470D-B2E4-0BA42A035228}';
  IID_ITWOPI: TGUID = '{B22DD1A2-6884-47AA-9CAA-8E35C1154A5C}';
  CLASS_TWOPI: TGUID = '{684811FB-0523-420F-9E8F-A5452C65A19C}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum GraphvizTypeIndex
type
  GraphvizTypeIndex = TOleEnum;
const
  GRAPHVIZ_ATTRIBUTED_DOT = $00000000;
  GRAPHVIZ_PS = $00000001;
  GRAPHVIZ_PLAIN = $00000006;
  GRAPHVIZ_PLAIN_EXT = $00000007;
  GRAPHVIZ_GIF = $0000000B;
  GRAPHVIZ_JPEG = $0000000C;
  GRAPHVIZ_PNG = $0000000D;
  GRAPHVIZ_WBMP = $0000000E;
  GRAPHVIZ_ISMAP = $00000010;
  GRAPHVIZ_IMAP = $00000011;
  GRAPHVIZ_CMAP = $00000012;
  GRAPHVIZ_VRML = $00000013;
  GRAPHVIZ_SVG = $00000017;
  GRAPHVIZ_SVGZ = $00000018;
  GRAPHVIZ_CANONICAL_DOT = $00000019;
  GRAPHVIZ_EMF = $0000001B;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDOT = interface;
  IDOTDisp = dispinterface;
  IBinaryImage = interface;
  IBinaryImageDisp = dispinterface;
  ISequentialStream = interface;
  IStream = interface;
  INEATO = interface;
  INEATODisp = dispinterface;
  ITWOPI = interface;
  ITWOPIDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DOT = IDOT;
  NEATO = INEATO;
  BinaryImage = IBinaryImage;
  TWOPI = ITWOPI;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PByte1 = ^Byte; {*}

{$ALIGN 8}
  _LARGE_INTEGER = record
    QuadPart: Int64;
  end;

{$ALIGN 8}
  _ULARGE_INTEGER = record
    QuadPart: Largeuint;
  end;

  _FILETIME = record
    dwLowDateTime: LongWord;
    dwHighDateTime: LongWord;
  end;

{$ALIGN 8}
  tagSTATSTG = record
    pwcsName: PWideChar;
    type_: LongWord;
    cbSize: _ULARGE_INTEGER;
    mtime: _FILETIME;
    ctime: _FILETIME;
    atime: _FILETIME;
    grfMode: LongWord;
    grfLocksSupported: LongWord;
    clsid: TGUID;
    grfStateBits: LongWord;
    reserved: LongWord;
  end;


// *********************************************************************//
// Interface: IDOT
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1080582-D33F-486E-BD5F-581989A3C7E9}
// *********************************************************************//
  IDOT = interface(IDispatch)
    ['{A1080582-D33F-486E-BD5F-581989A3C7E9}']
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString; safecall;
    function ToDot(const Source: WideString): WideString; safecall;
    function ToCanon(const Source: WideString): WideString; safecall;
    function ToPlain(const Source: WideString): WideString; safecall;
    function ToPlainExt(const Source: WideString): WideString; safecall;
    function ToSvg(const Source: WideString): WideString; safecall;
    function Validate(const Source: WideString): WordBool; safecall;
    function ToPS(const Source: WideString): WideString; safecall;
    function ToGIF(const Source: WideString): IBinaryImage; safecall;
    function ToPNG(const Source: WideString): IBinaryImage; safecall;
    function ToSVGZ(const Source: WideString): IBinaryImage; safecall;
    function ToVRML(const Source: WideString): WideString; safecall;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage; safecall;
    function ToCMAP(const Source: WideString): WideString; safecall;
    function ToIMAP(const Source: WideString): WideString; safecall;
    function ToISMAP(const Source: WideString): WideString; safecall;
    function ToWBMP(const Source: WideString): IBinaryImage; safecall;
    function ToJPEG(const Source: WideString): IBinaryImage; safecall;
    function Get_Codepage: Integer; safecall;
    procedure Set_Codepage(pVal: Integer); safecall;
    function ToEMF(const Source: WideString): IBinaryImage; safecall;
    property Codepage: Integer read Get_Codepage write Set_Codepage;
  end;

// *********************************************************************//
// DispIntf:  IDOTDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1080582-D33F-486E-BD5F-581989A3C7E9}
// *********************************************************************//
  IDOTDisp = dispinterface
    ['{A1080582-D33F-486E-BD5F-581989A3C7E9}']
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString; dispid 1;
    function ToDot(const Source: WideString): WideString; dispid 2;
    function ToCanon(const Source: WideString): WideString; dispid 3;
    function ToPlain(const Source: WideString): WideString; dispid 4;
    function ToPlainExt(const Source: WideString): WideString; dispid 5;
    function ToSvg(const Source: WideString): WideString; dispid 6;
    function Validate(const Source: WideString): WordBool; dispid 7;
    function ToPS(const Source: WideString): WideString; dispid 8;
    function ToGIF(const Source: WideString): IBinaryImage; dispid 9;
    function ToPNG(const Source: WideString): IBinaryImage; dispid 10;
    function ToSVGZ(const Source: WideString): IBinaryImage; dispid 11;
    function ToVRML(const Source: WideString): WideString; dispid 12;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage; dispid 13;
    function ToCMAP(const Source: WideString): WideString; dispid 14;
    function ToIMAP(const Source: WideString): WideString; dispid 15;
    function ToISMAP(const Source: WideString): WideString; dispid 16;
    function ToWBMP(const Source: WideString): IBinaryImage; dispid 17;
    function ToJPEG(const Source: WideString): IBinaryImage; dispid 18;
    property Codepage: Integer dispid 19;
    function ToEMF(const Source: WideString): IBinaryImage; dispid 20;
  end;

// *********************************************************************//
// Interface: IBinaryImage
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FFF6CEBE-BD9B-4C3A-A274-12E600B6BD10}
// *********************************************************************//
  IBinaryImage = interface(IDispatch)
    ['{FFF6CEBE-BD9B-4C3A-A274-12E600B6BD10}']
    function Save(const FilePath: WideString): WordBool; safecall;
    function Dump(const stream: IStream): WordBool; safecall;
    function Get_type_: WideString; safecall;
    function Get_Picture: IPictureDisp; safecall;
    function ToBase64String: WideString; safecall;
    property type_: WideString read Get_type_;
    property Picture: IPictureDisp read Get_Picture;
  end;

// *********************************************************************//
// DispIntf:  IBinaryImageDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FFF6CEBE-BD9B-4C3A-A274-12E600B6BD10}
// *********************************************************************//
  IBinaryImageDisp = dispinterface
    ['{FFF6CEBE-BD9B-4C3A-A274-12E600B6BD10}']
    function Save(const FilePath: WideString): WordBool; dispid 1;
    function Dump(const stream: IStream): WordBool; dispid 3;
    property type_: WideString readonly dispid 2;
    property Picture: IPictureDisp readonly dispid 4;
    function ToBase64String: WideString; dispid 5;
  end;

// *********************************************************************//
// Interface: ISequentialStream
// Flags:     (0)
// GUID:      {0C733A30-2A1C-11CE-ADE5-00AA0044773D}
// *********************************************************************//
  ISequentialStream = interface(IUnknown)
    ['{0C733A30-2A1C-11CE-ADE5-00AA0044773D}']
    function RemoteRead(out pv: Byte; cb: LongWord; out pcbRead: LongWord): HResult; stdcall;
    function RemoteWrite(var pv: Byte; cb: LongWord; out pcbWritten: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IStream
// Flags:     (0)
// GUID:      {0000000C-0000-0000-C000-000000000046}
// *********************************************************************//
  IStream = interface(ISequentialStream)
    ['{0000000C-0000-0000-C000-000000000046}']
    function RemoteSeek(dlibMove: _LARGE_INTEGER; dwOrigin: LongWord; 
                        out plibNewPosition: _ULARGE_INTEGER): HResult; stdcall;
    function SetSize(libNewSize: _ULARGE_INTEGER): HResult; stdcall;
    function RemoteCopyTo(const pstm: IStream; cb: _ULARGE_INTEGER; out pcbRead: _ULARGE_INTEGER; 
                          out pcbWritten: _ULARGE_INTEGER): HResult; stdcall;
    function Commit(grfCommitFlags: LongWord): HResult; stdcall;
    function Revert: HResult; stdcall;
    function LockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER; dwLockType: LongWord): HResult; stdcall;
    function UnlockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER; dwLockType: LongWord): HResult; stdcall;
    function Stat(out pstatstg: tagSTATSTG; grfStatFlag: LongWord): HResult; stdcall;
    function Clone(out ppstm: IStream): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: INEATO
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B41D4C33-882C-4534-8352-EE981323CD96}
// *********************************************************************//
  INEATO = interface(IDispatch)
    ['{B41D4C33-882C-4534-8352-EE981323CD96}']
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString; safecall;
    function ToCanon(const Source: WideString): WideString; safecall;
    function ToDot(const Source: WideString): WideString; safecall;
    function ToPlain(const Source: WideString): WideString; safecall;
    function ToPlainExt(const Source: WideString): WideString; safecall;
    function ToSvg(const Source: WideString): WideString; safecall;
    function Validate(const Source: WideString): WordBool; safecall;
    function ToPS(const Source: WideString): WideString; safecall;
    function ToGIF(const Source: WideString): IBinaryImage; safecall;
    function ToPNG(const Source: WideString): IBinaryImage; safecall;
    function ToSVGZ(const Source: WideString): IBinaryImage; safecall;
    function ToVRML(const Source: WideString): WideString; safecall;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage; safecall;
    function ToCMAP(const Source: WideString): WideString; safecall;
    function ToIMAP(const Source: WideString): WideString; safecall;
    function ToISMAP(const Source: WideString): WideString; safecall;
    function ToWBMP(const Source: WideString): IBinaryImage; safecall;
    function ToJPEG(const Source: WideString): IBinaryImage; safecall;
    function Get_Codepage: Integer; safecall;
    procedure Set_Codepage(pVal: Integer); safecall;
    function ToEMF(const Source: WideString): IBinaryImage; safecall;
    property Codepage: Integer read Get_Codepage write Set_Codepage;
  end;

// *********************************************************************//
// DispIntf:  INEATODisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B41D4C33-882C-4534-8352-EE981323CD96}
// *********************************************************************//
  INEATODisp = dispinterface
    ['{B41D4C33-882C-4534-8352-EE981323CD96}']
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString; dispid 1;
    function ToCanon(const Source: WideString): WideString; dispid 2;
    function ToDot(const Source: WideString): WideString; dispid 3;
    function ToPlain(const Source: WideString): WideString; dispid 4;
    function ToPlainExt(const Source: WideString): WideString; dispid 5;
    function ToSvg(const Source: WideString): WideString; dispid 6;
    function Validate(const Source: WideString): WordBool; dispid 7;
    function ToPS(const Source: WideString): WideString; dispid 8;
    function ToGIF(const Source: WideString): IBinaryImage; dispid 9;
    function ToPNG(const Source: WideString): IBinaryImage; dispid 10;
    function ToSVGZ(const Source: WideString): IBinaryImage; dispid 11;
    function ToVRML(const Source: WideString): WideString; dispid 12;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage; dispid 13;
    function ToCMAP(const Source: WideString): WideString; dispid 14;
    function ToIMAP(const Source: WideString): WideString; dispid 15;
    function ToISMAP(const Source: WideString): WideString; dispid 16;
    function ToWBMP(const Source: WideString): IBinaryImage; dispid 17;
    function ToJPEG(const Source: WideString): IBinaryImage; dispid 18;
    property Codepage: Integer dispid 19;
    function ToEMF(const Source: WideString): IBinaryImage; dispid 20;
  end;

// *********************************************************************//
// Interface: ITWOPI
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B22DD1A2-6884-47AA-9CAA-8E35C1154A5C}
// *********************************************************************//
  ITWOPI = interface(IDispatch)
    ['{B22DD1A2-6884-47AA-9CAA-8E35C1154A5C}']
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString; safecall;
    function ToDot(const Source: WideString): WideString; safecall;
    function ToCanon(const Source: WideString): WideString; safecall;
    function ToPlain(const Source: WideString): WideString; safecall;
    function ToPlainExt(const Source: WideString): WideString; safecall;
    function ToSvg(const Source: WideString): WideString; safecall;
    function Validate(const Source: WideString): WordBool; safecall;
    function ToPS(const Source: WideString): WideString; safecall;
    function ToGIF(const Source: WideString): IBinaryImage; safecall;
    function ToPNG(const Source: WideString): IBinaryImage; safecall;
    function ToSVGZ(const Source: WideString): IBinaryImage; safecall;
    function ToVRML(const Source: WideString): WideString; safecall;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage; safecall;
    function ToCMAP(const Source: WideString): WideString; safecall;
    function ToIMAP(const Source: WideString): WideString; safecall;
    function ToISMAP(const Source: WideString): WideString; safecall;
    function ToWBMP(const Source: WideString): IBinaryImage; safecall;
    function ToJPEG(const Source: WideString): IBinaryImage; safecall;
    function Get_Codepage: Integer; safecall;
    procedure Set_Codepage(pVal: Integer); safecall;
    function ToEMF(const Source: WideString): IBinaryImage; safecall;
    property Codepage: Integer read Get_Codepage write Set_Codepage;
  end;

// *********************************************************************//
// DispIntf:  ITWOPIDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B22DD1A2-6884-47AA-9CAA-8E35C1154A5C}
// *********************************************************************//
  ITWOPIDisp = dispinterface
    ['{B22DD1A2-6884-47AA-9CAA-8E35C1154A5C}']
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString; dispid 1;
    function ToDot(const Source: WideString): WideString; dispid 2;
    function ToCanon(const Source: WideString): WideString; dispid 3;
    function ToPlain(const Source: WideString): WideString; dispid 4;
    function ToPlainExt(const Source: WideString): WideString; dispid 5;
    function ToSvg(const Source: WideString): WideString; dispid 6;
    function Validate(const Source: WideString): WordBool; dispid 7;
    function ToPS(const Source: WideString): WideString; dispid 8;
    function ToGIF(const Source: WideString): IBinaryImage; dispid 9;
    function ToPNG(const Source: WideString): IBinaryImage; dispid 10;
    function ToSVGZ(const Source: WideString): IBinaryImage; dispid 11;
    function ToVRML(const Source: WideString): WideString; dispid 12;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage; dispid 13;
    function ToCMAP(const Source: WideString): WideString; dispid 14;
    function ToIMAP(const Source: WideString): WideString; dispid 15;
    function ToISMAP(const Source: WideString): WideString; dispid 16;
    function ToWBMP(const Source: WideString): IBinaryImage; dispid 17;
    function ToJPEG(const Source: WideString): IBinaryImage; dispid 18;
    property Codepage: Integer dispid 19;
    function ToEMF(const Source: WideString): IBinaryImage; dispid 20;
  end;

// *********************************************************************//
// The Class CoDOT provides a Create and CreateRemote method to          
// create instances of the default interface IDOT exposed by              
// the CoClass DOT. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDOT = class
    class function Create: IDOT;
    class function CreateRemote(const MachineName: string): IDOT;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDOT
// Help String      : DOT Class
// Default Interface: IDOT
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDOTProperties= class;
{$ENDIF}
  TDOT = class(TOleServer)
  private
    FIntf: IDOT;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TDOTProperties;
    function GetServerProperties: TDOTProperties;
{$ENDIF}
    function GetDefaultInterface: IDOT;
  protected
    procedure InitServerData; override;
    function Get_Codepage: Integer;
    procedure Set_Codepage(pVal: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDOT);
    procedure Disconnect; override;
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString;
    function ToDot(const Source: WideString): WideString;
    function ToCanon(const Source: WideString): WideString;
    function ToPlain(const Source: WideString): WideString;
    function ToPlainExt(const Source: WideString): WideString;
    function ToSvg(const Source: WideString): WideString;
    function Validate(const Source: WideString): WordBool;
    function ToPS(const Source: WideString): WideString;
    function ToGIF(const Source: WideString): IBinaryImage;
    function ToPNG(const Source: WideString): IBinaryImage;
    function ToSVGZ(const Source: WideString): IBinaryImage;
    function ToVRML(const Source: WideString): WideString;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage;
    function ToCMAP(const Source: WideString): WideString;
    function ToIMAP(const Source: WideString): WideString;
    function ToISMAP(const Source: WideString): WideString;
    function ToWBMP(const Source: WideString): IBinaryImage;
    function ToJPEG(const Source: WideString): IBinaryImage;
    function ToEMF(const Source: WideString): IBinaryImage;
    property DefaultInterface: IDOT read GetDefaultInterface;
    property Codepage: Integer read Get_Codepage write Set_Codepage;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDOTProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDOT
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDOTProperties = class(TPersistent)
  private
    FServer:    TDOT;
    function    GetDefaultInterface: IDOT;
    constructor Create(AServer: TDOT);
  protected
    function Get_Codepage: Integer;
    procedure Set_Codepage(pVal: Integer);
  public
    property DefaultInterface: IDOT read GetDefaultInterface;
  published
    property Codepage: Integer read Get_Codepage write Set_Codepage;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoNEATO provides a Create and CreateRemote method to          
// create instances of the default interface INEATO exposed by              
// the CoClass NEATO. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNEATO = class
    class function Create: INEATO;
    class function CreateRemote(const MachineName: string): INEATO;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TNEATO
// Help String      : NEATO Class
// Default Interface: INEATO
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TNEATOProperties= class;
{$ENDIF}
  TNEATO = class(TOleServer)
  private
    FIntf: INEATO;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TNEATOProperties;
    function GetServerProperties: TNEATOProperties;
{$ENDIF}
    function GetDefaultInterface: INEATO;
  protected
    procedure InitServerData; override;
    function Get_Codepage: Integer;
    procedure Set_Codepage(pVal: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: INEATO);
    procedure Disconnect; override;
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString;
    function ToCanon(const Source: WideString): WideString;
    function ToDot(const Source: WideString): WideString;
    function ToPlain(const Source: WideString): WideString;
    function ToPlainExt(const Source: WideString): WideString;
    function ToSvg(const Source: WideString): WideString;
    function Validate(const Source: WideString): WordBool;
    function ToPS(const Source: WideString): WideString;
    function ToGIF(const Source: WideString): IBinaryImage;
    function ToPNG(const Source: WideString): IBinaryImage;
    function ToSVGZ(const Source: WideString): IBinaryImage;
    function ToVRML(const Source: WideString): WideString;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage;
    function ToCMAP(const Source: WideString): WideString;
    function ToIMAP(const Source: WideString): WideString;
    function ToISMAP(const Source: WideString): WideString;
    function ToWBMP(const Source: WideString): IBinaryImage;
    function ToJPEG(const Source: WideString): IBinaryImage;
    function ToEMF(const Source: WideString): IBinaryImage;
    property DefaultInterface: INEATO read GetDefaultInterface;
    property Codepage: Integer read Get_Codepage write Set_Codepage;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TNEATOProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TNEATO
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TNEATOProperties = class(TPersistent)
  private
    FServer:    TNEATO;
    function    GetDefaultInterface: INEATO;
    constructor Create(AServer: TNEATO);
  protected
    function Get_Codepage: Integer;
    procedure Set_Codepage(pVal: Integer);
  public
    property DefaultInterface: INEATO read GetDefaultInterface;
  published
    property Codepage: Integer read Get_Codepage write Set_Codepage;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoBinaryImage provides a Create and CreateRemote method to          
// create instances of the default interface IBinaryImage exposed by              
// the CoClass BinaryImage. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBinaryImage = class
    class function Create: IBinaryImage;
    class function CreateRemote(const MachineName: string): IBinaryImage;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBinaryImage
// Help String      : BinaryImage Class
// Default Interface: IBinaryImage
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TBinaryImageProperties= class;
{$ENDIF}
  TBinaryImage = class(TOleServer)
  private
    FIntf: IBinaryImage;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TBinaryImageProperties;
    function GetServerProperties: TBinaryImageProperties;
{$ENDIF}
    function GetDefaultInterface: IBinaryImage;
  protected
    procedure InitServerData; override;
    function Get_type_: WideString;
    function Get_Picture: IPictureDisp;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IBinaryImage);
    procedure Disconnect; override;
    function Save(const FilePath: WideString): WordBool;
    function Dump(const stream: IStream): WordBool;
    function ToBase64String: WideString;
    property DefaultInterface: IBinaryImage read GetDefaultInterface;
    property type_: WideString read Get_type_;
    property Picture: IPictureDisp read Get_Picture;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TBinaryImageProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TBinaryImage
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TBinaryImageProperties = class(TPersistent)
  private
    FServer:    TBinaryImage;
    function    GetDefaultInterface: IBinaryImage;
    constructor Create(AServer: TBinaryImage);
  protected
    function Get_type_: WideString;
    function Get_Picture: IPictureDisp;
  public
    property DefaultInterface: IBinaryImage read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoTWOPI provides a Create and CreateRemote method to          
// create instances of the default interface ITWOPI exposed by              
// the CoClass TWOPI. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTWOPI = class
    class function Create: ITWOPI;
    class function CreateRemote(const MachineName: string): ITWOPI;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTWOPI
// Help String      : TWOPI Class
// Default Interface: ITWOPI
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTWOPIProperties= class;
{$ENDIF}
  TTWOPI = class(TOleServer)
  private
    FIntf: ITWOPI;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TTWOPIProperties;
    function GetServerProperties: TTWOPIProperties;
{$ENDIF}
    function GetDefaultInterface: ITWOPI;
  protected
    procedure InitServerData; override;
    function Get_Codepage: Integer;
    procedure Set_Codepage(pVal: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ITWOPI);
    procedure Disconnect; override;
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString;
    function ToDot(const Source: WideString): WideString;
    function ToCanon(const Source: WideString): WideString;
    function ToPlain(const Source: WideString): WideString;
    function ToPlainExt(const Source: WideString): WideString;
    function ToSvg(const Source: WideString): WideString;
    function Validate(const Source: WideString): WordBool;
    function ToPS(const Source: WideString): WideString;
    function ToGIF(const Source: WideString): IBinaryImage;
    function ToPNG(const Source: WideString): IBinaryImage;
    function ToSVGZ(const Source: WideString): IBinaryImage;
    function ToVRML(const Source: WideString): WideString;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage;
    function ToCMAP(const Source: WideString): WideString;
    function ToIMAP(const Source: WideString): WideString;
    function ToISMAP(const Source: WideString): WideString;
    function ToWBMP(const Source: WideString): IBinaryImage;
    function ToJPEG(const Source: WideString): IBinaryImage;
    function ToEMF(const Source: WideString): IBinaryImage;
    property DefaultInterface: ITWOPI read GetDefaultInterface;
    property Codepage: Integer read Get_Codepage write Set_Codepage;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTWOPIProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTWOPI
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTWOPIProperties = class(TPersistent)
  private
    FServer:    TTWOPI;
    function    GetDefaultInterface: ITWOPI;
    constructor Create(AServer: TTWOPI);
  protected
    function Get_Codepage: Integer;
    procedure Set_Codepage(pVal: Integer);
  public
    property DefaultInterface: ITWOPI read GetDefaultInterface;
  published
    property Codepage: Integer read Get_Codepage write Set_Codepage;
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoDOT.Create: IDOT;
begin
  Result := CreateComObject(CLASS_DOT) as IDOT;
end;

class function CoDOT.CreateRemote(const MachineName: string): IDOT;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DOT) as IDOT;
end;

procedure TDOT.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{55811839-47B0-4854-81B5-0A0031B8ACEC}';
    IntfIID:   '{A1080582-D33F-486E-BD5F-581989A3C7E9}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDOT.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDOT;
  end;
end;

procedure TDOT.ConnectTo(svrIntf: IDOT);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDOT.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDOT.GetDefaultInterface: IDOT;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TDOT.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDOTProperties.Create(Self);
{$ENDIF}
end;

destructor TDOT.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDOT.GetServerProperties: TDOTProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TDOT.Get_Codepage: Integer;
begin
    Result := DefaultInterface.Codepage;
end;

procedure TDOT.Set_Codepage(pVal: Integer);
begin
  DefaultInterface.Set_Codepage(pVal);
end;

function TDOT.ToTextGraph(const Source: WideString; Type_: Integer): WideString;
begin
  Result := DefaultInterface.ToTextGraph(Source, Type_);
end;

function TDOT.ToDot(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToDot(Source);
end;

function TDOT.ToCanon(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToCanon(Source);
end;

function TDOT.ToPlain(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToPlain(Source);
end;

function TDOT.ToPlainExt(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToPlainExt(Source);
end;

function TDOT.ToSvg(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToSvg(Source);
end;

function TDOT.Validate(const Source: WideString): WordBool;
begin
  Result := DefaultInterface.Validate(Source);
end;

function TDOT.ToPS(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToPS(Source);
end;

function TDOT.ToGIF(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToGIF(Source);
end;

function TDOT.ToPNG(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToPNG(Source);
end;

function TDOT.ToSVGZ(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToSVGZ(Source);
end;

function TDOT.ToVRML(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToVRML(Source);
end;

function TDOT.ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage;
begin
  Result := DefaultInterface.ToBinaryGraph(Source, Type_);
end;

function TDOT.ToCMAP(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToCMAP(Source);
end;

function TDOT.ToIMAP(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToIMAP(Source);
end;

function TDOT.ToISMAP(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToISMAP(Source);
end;

function TDOT.ToWBMP(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToWBMP(Source);
end;

function TDOT.ToJPEG(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToJPEG(Source);
end;

function TDOT.ToEMF(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToEMF(Source);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDOTProperties.Create(AServer: TDOT);
begin
  inherited Create;
  FServer := AServer;
end;

function TDOTProperties.GetDefaultInterface: IDOT;
begin
  Result := FServer.DefaultInterface;
end;

function TDOTProperties.Get_Codepage: Integer;
begin
    Result := DefaultInterface.Codepage;
end;

procedure TDOTProperties.Set_Codepage(pVal: Integer);
begin
  DefaultInterface.Set_Codepage(pVal);
end;

{$ENDIF}

class function CoNEATO.Create: INEATO;
begin
  Result := CreateComObject(CLASS_NEATO) as INEATO;
end;

class function CoNEATO.CreateRemote(const MachineName: string): INEATO;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_NEATO) as INEATO;
end;

procedure TNEATO.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{1F25D86C-95BC-4E33-A177-EE8DABEF8B04}';
    IntfIID:   '{B41D4C33-882C-4534-8352-EE981323CD96}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TNEATO.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as INEATO;
  end;
end;

procedure TNEATO.ConnectTo(svrIntf: INEATO);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TNEATO.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TNEATO.GetDefaultInterface: INEATO;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TNEATO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TNEATOProperties.Create(Self);
{$ENDIF}
end;

destructor TNEATO.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TNEATO.GetServerProperties: TNEATOProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TNEATO.Get_Codepage: Integer;
begin
    Result := DefaultInterface.Codepage;
end;

procedure TNEATO.Set_Codepage(pVal: Integer);
begin
  DefaultInterface.Set_Codepage(pVal);
end;

function TNEATO.ToTextGraph(const Source: WideString; Type_: Integer): WideString;
begin
  Result := DefaultInterface.ToTextGraph(Source, Type_);
end;

function TNEATO.ToCanon(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToCanon(Source);
end;

function TNEATO.ToDot(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToDot(Source);
end;

function TNEATO.ToPlain(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToPlain(Source);
end;

function TNEATO.ToPlainExt(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToPlainExt(Source);
end;

function TNEATO.ToSvg(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToSvg(Source);
end;

function TNEATO.Validate(const Source: WideString): WordBool;
begin
  Result := DefaultInterface.Validate(Source);
end;

function TNEATO.ToPS(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToPS(Source);
end;

function TNEATO.ToGIF(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToGIF(Source);
end;

function TNEATO.ToPNG(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToPNG(Source);
end;

function TNEATO.ToSVGZ(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToSVGZ(Source);
end;

function TNEATO.ToVRML(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToVRML(Source);
end;

function TNEATO.ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage;
begin
  Result := DefaultInterface.ToBinaryGraph(Source, Type_);
end;

function TNEATO.ToCMAP(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToCMAP(Source);
end;

function TNEATO.ToIMAP(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToIMAP(Source);
end;

function TNEATO.ToISMAP(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToISMAP(Source);
end;

function TNEATO.ToWBMP(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToWBMP(Source);
end;

function TNEATO.ToJPEG(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToJPEG(Source);
end;

function TNEATO.ToEMF(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToEMF(Source);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TNEATOProperties.Create(AServer: TNEATO);
begin
  inherited Create;
  FServer := AServer;
end;

function TNEATOProperties.GetDefaultInterface: INEATO;
begin
  Result := FServer.DefaultInterface;
end;

function TNEATOProperties.Get_Codepage: Integer;
begin
    Result := DefaultInterface.Codepage;
end;

procedure TNEATOProperties.Set_Codepage(pVal: Integer);
begin
  DefaultInterface.Set_Codepage(pVal);
end;

{$ENDIF}

class function CoBinaryImage.Create: IBinaryImage;
begin
  Result := CreateComObject(CLASS_BinaryImage) as IBinaryImage;
end;

class function CoBinaryImage.CreateRemote(const MachineName: string): IBinaryImage;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BinaryImage) as IBinaryImage;
end;

procedure TBinaryImage.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{6B3F62C8-80CE-470D-B2E4-0BA42A035228}';
    IntfIID:   '{FFF6CEBE-BD9B-4C3A-A274-12E600B6BD10}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TBinaryImage.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IBinaryImage;
  end;
end;

procedure TBinaryImage.ConnectTo(svrIntf: IBinaryImage);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TBinaryImage.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TBinaryImage.GetDefaultInterface: IBinaryImage;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TBinaryImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TBinaryImageProperties.Create(Self);
{$ENDIF}
end;

destructor TBinaryImage.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TBinaryImage.GetServerProperties: TBinaryImageProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TBinaryImage.Get_type_: WideString;
begin
    Result := DefaultInterface.type_;
end;

function TBinaryImage.Get_Picture: IPictureDisp;
begin
    Result := DefaultInterface.Picture;
end;

function TBinaryImage.Save(const FilePath: WideString): WordBool;
begin
  Result := DefaultInterface.Save(FilePath);
end;

function TBinaryImage.Dump(const stream: IStream): WordBool;
begin
  Result := DefaultInterface.Dump(stream);
end;

function TBinaryImage.ToBase64String: WideString;
begin
  Result := DefaultInterface.ToBase64String;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TBinaryImageProperties.Create(AServer: TBinaryImage);
begin
  inherited Create;
  FServer := AServer;
end;

function TBinaryImageProperties.GetDefaultInterface: IBinaryImage;
begin
  Result := FServer.DefaultInterface;
end;

function TBinaryImageProperties.Get_type_: WideString;
begin
    Result := DefaultInterface.type_;
end;

function TBinaryImageProperties.Get_Picture: IPictureDisp;
begin
    Result := DefaultInterface.Picture;
end;

{$ENDIF}

class function CoTWOPI.Create: ITWOPI;
begin
  Result := CreateComObject(CLASS_TWOPI) as ITWOPI;
end;

class function CoTWOPI.CreateRemote(const MachineName: string): ITWOPI;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TWOPI) as ITWOPI;
end;

procedure TTWOPI.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{684811FB-0523-420F-9E8F-A5452C65A19C}';
    IntfIID:   '{B22DD1A2-6884-47AA-9CAA-8E35C1154A5C}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTWOPI.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ITWOPI;
  end;
end;

procedure TTWOPI.ConnectTo(svrIntf: ITWOPI);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTWOPI.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTWOPI.GetDefaultInterface: ITWOPI;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TTWOPI.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTWOPIProperties.Create(Self);
{$ENDIF}
end;

destructor TTWOPI.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTWOPI.GetServerProperties: TTWOPIProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TTWOPI.Get_Codepage: Integer;
begin
    Result := DefaultInterface.Codepage;
end;

procedure TTWOPI.Set_Codepage(pVal: Integer);
begin
  DefaultInterface.Set_Codepage(pVal);
end;

function TTWOPI.ToTextGraph(const Source: WideString; Type_: Integer): WideString;
begin
  Result := DefaultInterface.ToTextGraph(Source, Type_);
end;

function TTWOPI.ToDot(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToDot(Source);
end;

function TTWOPI.ToCanon(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToCanon(Source);
end;

function TTWOPI.ToPlain(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToPlain(Source);
end;

function TTWOPI.ToPlainExt(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToPlainExt(Source);
end;

function TTWOPI.ToSvg(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToSvg(Source);
end;

function TTWOPI.Validate(const Source: WideString): WordBool;
begin
  Result := DefaultInterface.Validate(Source);
end;

function TTWOPI.ToPS(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToPS(Source);
end;

function TTWOPI.ToGIF(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToGIF(Source);
end;

function TTWOPI.ToPNG(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToPNG(Source);
end;

function TTWOPI.ToSVGZ(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToSVGZ(Source);
end;

function TTWOPI.ToVRML(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToVRML(Source);
end;

function TTWOPI.ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage;
begin
  Result := DefaultInterface.ToBinaryGraph(Source, Type_);
end;

function TTWOPI.ToCMAP(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToCMAP(Source);
end;

function TTWOPI.ToIMAP(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToIMAP(Source);
end;

function TTWOPI.ToISMAP(const Source: WideString): WideString;
begin
  Result := DefaultInterface.ToISMAP(Source);
end;

function TTWOPI.ToWBMP(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToWBMP(Source);
end;

function TTWOPI.ToJPEG(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToJPEG(Source);
end;

function TTWOPI.ToEMF(const Source: WideString): IBinaryImage;
begin
  Result := DefaultInterface.ToEMF(Source);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTWOPIProperties.Create(AServer: TTWOPI);
begin
  inherited Create;
  FServer := AServer;
end;

function TTWOPIProperties.GetDefaultInterface: ITWOPI;
begin
  Result := FServer.DefaultInterface;
end;

function TTWOPIProperties.Get_Codepage: Integer;
begin
    Result := DefaultInterface.Codepage;
end;

procedure TTWOPIProperties.Set_Codepage(pVal: Integer);
begin
  DefaultInterface.Set_Codepage(pVal);
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TDOT, TNEATO, TBinaryImage, TTWOPI]);
end;

end.
