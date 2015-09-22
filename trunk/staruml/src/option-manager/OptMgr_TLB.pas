unit OptMgr_TLB;

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
// File generated on 5/10/2015 6:31:49 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\JS\Delphi\WhiteStarSourceforgeTrunkXE5\staruml\src\option-manager\OptMgr (1)
// LIBID: {84BEB7B3-6221-43ED-B410-E83A5D83CED9}
// LCID: 0
// Helpfile:
// HelpString: General Option Manager Library
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  OptMgrMajorVersion = 1;
  OptMgrMinorVersion = 0;

  LIBID_OptMgr: TGUID = '{84BEB7B3-6221-43ED-B410-E83A5D83CED9}';

  IID_IOptionItem: TGUID = '{C8E6BA96-EE0F-463E-B9BC-776C15167809}';
  IID_IOptionClassification: TGUID = '{A2FB7B59-01A9-4929-BC56-79A699A35E90}';
  IID_IOptionCategory: TGUID = '{C6C2AE66-AEE8-43C0-AA77-081646262CF2}';
  IID_IOptionSchema: TGUID = '{DA4FB79C-B8B5-4573-98E8-8CB2ECFA0406}';
  IID_IOptionManager: TGUID = '{D041BEEF-82ED-4A66-843A-4D08339C228D}';
  CLASS_OptionManager: TGUID = '{9890E665-379A-4DFD-A6B4-884A8D5AEAEF}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library
// *********************************************************************//
// Constants for enum OptionType
type
  OptionType = TOleEnum;
const
  otInteger = $00000000;
  otReal = $00000001;
  otString = $00000002;
  otBoolean = $00000003;
  otText = $00000004;
  otEnumeration = $00000005;
  otFileName = $00000006;
  otPathName = $00000007;
  otColor = $00000008;
  otRange = $00000009;
  otFontName = $0000000A;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IOptionItem = interface;
  IOptionItemDisp = dispinterface;
  IOptionClassification = interface;
  IOptionClassificationDisp = dispinterface;
  IOptionCategory = interface;
  IOptionCategoryDisp = dispinterface;
  IOptionSchema = interface;
  IOptionSchemaDisp = dispinterface;
  IOptionManager = interface;
  IOptionManagerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  OptionManager = IOptionManager;


// *********************************************************************//
// Interface: IOptionItem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C8E6BA96-EE0F-463E-B9BC-776C15167809}
// *********************************************************************//
  IOptionItem = interface(IDispatch)
    ['{C8E6BA96-EE0F-463E-B9BC-776C15167809}']
    function Get_Type_: OptionType; safecall;
    procedure Set_Type_(Value: OptionType); safecall;
    function Get_Key: WideString; safecall;
    procedure Set_Key(const Value: WideString); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(Value: OleVariant); safecall;
    function Get_DefaultValue: OleVariant; safecall;
    procedure Set_DefaultValue(Value: OleVariant); safecall;
    function Get_Description: WideString; safecall;
    procedure Set_Description(const Value: WideString); safecall;
    function Get_Changed: WordBool; safecall;
    procedure Set_Changed(Value: WordBool); safecall;
    property Type_: OptionType read Get_Type_ write Set_Type_;
    property Key: WideString read Get_Key write Set_Key;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Value: OleVariant read Get_Value write Set_Value;
    property DefaultValue: OleVariant read Get_DefaultValue write Set_DefaultValue;
    property Description: WideString read Get_Description write Set_Description;
    property Changed: WordBool read Get_Changed write Set_Changed;
  end;

// *********************************************************************//
// DispIntf:  IOptionItemDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C8E6BA96-EE0F-463E-B9BC-776C15167809}
// *********************************************************************//
  IOptionItemDisp = dispinterface
    ['{C8E6BA96-EE0F-463E-B9BC-776C15167809}']
    property Type_: OptionType dispid 1;
    property Key: WideString dispid 2;
    property Caption: WideString dispid 3;
    property Value: OleVariant dispid 4;
    property DefaultValue: OleVariant dispid 5;
    property Description: WideString dispid 6;
    property Changed: WordBool dispid 7;
  end;

// *********************************************************************//
// Interface: IOptionClassification
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A2FB7B59-01A9-4929-BC56-79A699A35E90}
// *********************************************************************//
  IOptionClassification = interface(IDispatch)
    ['{A2FB7B59-01A9-4929-BC56-79A699A35E90}']
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Description: WideString; safecall;
    procedure Set_Description(const Value: WideString); safecall;
    function GetOptionItemCount: Integer; safecall;
    function GetOptionItemAt(Index: Integer): IOptionItem; safecall;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Description: WideString read Get_Description write Set_Description;
  end;

// *********************************************************************//
// DispIntf:  IOptionClassificationDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A2FB7B59-01A9-4929-BC56-79A699A35E90}
// *********************************************************************//
  IOptionClassificationDisp = dispinterface
    ['{A2FB7B59-01A9-4929-BC56-79A699A35E90}']
    property Caption: WideString dispid 1;
    property Description: WideString dispid 2;
    function GetOptionItemCount: Integer; dispid 3;
    function GetOptionItemAt(Index: Integer): IOptionItem; dispid 4;
  end;

// *********************************************************************//
// Interface: IOptionCategory
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C6C2AE66-AEE8-43C0-AA77-081646262CF2}
// *********************************************************************//
  IOptionCategory = interface(IDispatch)
    ['{C6C2AE66-AEE8-43C0-AA77-081646262CF2}']
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Description: WideString; safecall;
    procedure Set_Description(const Value: WideString); safecall;
    function GetOptionClassificationCount: Integer; safecall;
    function GetOptionClassificationAt(Index: Integer): IOptionClassification; safecall;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Description: WideString read Get_Description write Set_Description;
  end;

// *********************************************************************//
// DispIntf:  IOptionCategoryDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C6C2AE66-AEE8-43C0-AA77-081646262CF2}
// *********************************************************************//
  IOptionCategoryDisp = dispinterface
    ['{C6C2AE66-AEE8-43C0-AA77-081646262CF2}']
    property Caption: WideString dispid 1;
    property Description: WideString dispid 2;
    function GetOptionClassificationCount: Integer; dispid 3;
    function GetOptionClassificationAt(Index: Integer): IOptionClassification; dispid 4;
  end;

// *********************************************************************//
// Interface: IOptionSchema
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DA4FB79C-B8B5-4573-98E8-8CB2ECFA0406}
// *********************************************************************//
  IOptionSchema = interface(IDispatch)
    ['{DA4FB79C-B8B5-4573-98E8-8CB2ECFA0406}']
    function Get_ID: WideString; safecall;
    procedure Set_ID(const Value: WideString); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Description: WideString; safecall;
    procedure Set_Description(const Value: WideString); safecall;
    function GetOptionCategoryCount: Integer; safecall;
    function GetOptionCategoryAt(Index: Integer): IOptionCategory; safecall;
    property ID: WideString read Get_ID write Set_ID;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Description: WideString read Get_Description write Set_Description;
  end;

// *********************************************************************//
// DispIntf:  IOptionSchemaDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DA4FB79C-B8B5-4573-98E8-8CB2ECFA0406}
// *********************************************************************//
  IOptionSchemaDisp = dispinterface
    ['{DA4FB79C-B8B5-4573-98E8-8CB2ECFA0406}']
    property ID: WideString dispid 1;
    property Caption: WideString dispid 3;
    property Description: WideString dispid 4;
    function GetOptionCategoryCount: Integer; dispid 5;
    function GetOptionCategoryAt(Index: Integer): IOptionCategory; dispid 6;
  end;

// *********************************************************************//
// Interface: IOptionManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D041BEEF-82ED-4A66-843A-4D08339C228D}
// *********************************************************************//
  IOptionManager = interface(IDispatch)
    ['{D041BEEF-82ED-4A66-843A-4D08339C228D}']
    function Get_SchemataRegPath: WideString; safecall;
    procedure Set_SchemataRegPath(const Value: WideString); safecall;
    function Get_OptionsRegPath: WideString; safecall;
    procedure Set_OptionsRegPath(const Value: WideString); safecall;
    function Get_DefaultSchemaID: WideString; safecall;
    procedure Set_DefaultSchemaID(const Value: WideString); safecall;
    function GetOptionSchemaCount: Integer; safecall;
    function GetOptionSchemaAt(Index: Integer): IOptionSchema; safecall;
    procedure InitOptionManager(const SchemataRegPath: WideString;
                                const OptionsRegPath: WideString; const DefaultSchemaID: WideString); safecall;
    function FindOptionItem(const SchemaID: WideString; const Key: WideString): IOptionItem; safecall;
    function ShowDialog: WordBool; safecall;
    function GetOptionValue(const SchemaID: WideString; const Key: WideString): OleVariant; safecall;
    procedure LoadOptionValues; safecall;
    procedure SaveOptionValues; safecall;
    property SchemataRegPath: WideString read Get_SchemataRegPath write Set_SchemataRegPath;
    property OptionsRegPath: WideString read Get_OptionsRegPath write Set_OptionsRegPath;
    property DefaultSchemaID: WideString read Get_DefaultSchemaID write Set_DefaultSchemaID;
  end;

// *********************************************************************//
// DispIntf:  IOptionManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D041BEEF-82ED-4A66-843A-4D08339C228D}
// *********************************************************************//
  IOptionManagerDisp = dispinterface
    ['{D041BEEF-82ED-4A66-843A-4D08339C228D}']
    property SchemataRegPath: WideString dispid 1;
    property OptionsRegPath: WideString dispid 2;
    property DefaultSchemaID: WideString dispid 3;
    function GetOptionSchemaCount: Integer; dispid 4;
    function GetOptionSchemaAt(Index: Integer): IOptionSchema; dispid 5;
    procedure InitOptionManager(const SchemataRegPath: WideString;
                                const OptionsRegPath: WideString; const DefaultSchemaID: WideString); dispid 6;
    function FindOptionItem(const SchemaID: WideString; const Key: WideString): IOptionItem; dispid 7;
    function ShowDialog: WordBool; dispid 8;
    function GetOptionValue(const SchemaID: WideString; const Key: WideString): OleVariant; dispid 9;
    procedure LoadOptionValues; dispid 10;
    procedure SaveOptionValues; dispid 11;
  end;

// *********************************************************************//
// The Class CoOptionManager provides a Create and CreateRemote method to
// create instances of the default interface IOptionManager exposed by
// the CoClass OptionManager. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoOptionManager = class
    class function Create: IOptionManager;
    class function CreateRemote(const MachineName: string): IOptionManager;
  end;

implementation

uses System.Win.ComObj;

class function CoOptionManager.Create: IOptionManager;
begin
  Result := CreateComObject(CLASS_OptionManager) as IOptionManager;
end;

class function CoOptionManager.CreateRemote(const MachineName: string): IOptionManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OptionManager) as IOptionManager;
end;

end.

