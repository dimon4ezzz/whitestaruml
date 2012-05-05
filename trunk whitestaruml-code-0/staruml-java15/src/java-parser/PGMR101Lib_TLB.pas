unit PGMR101Lib_TLB;

{******************************************************************************}
{                                                                              }
{                StarUML - The Open Source UML/MDA Platform.                   }
{                                                                              }
{              Copyright (C) 2002-2005 - Plastic Software, Inc.                }
{                                                                              }
{                                                                              }
{ This program is free software; you can redistribute it and/or modify it      }
{ under the terms of the GNU General Public License as published by the Free   }
{ Software Foundation; either version 2 of the License, or (at your option)    }
{ any later version.                                                           }
{                                                                              }
{ This program is distributed in the hope that it will be useful, but WITHOUT  }
{ ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        }
{ FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     }
{ more details.                                                                }
{                                                                              }
{ You should have received a copy of the GNU General Public License along with }
{ this program; if not, write to the Free Software Foundation, Inc., 51        }
{ Franklin St, Fifth Floor, Boston, MA 02110-1301 USA                          }
{                                                                              }
{ Linking StarUML statically or dynamically with other modules is making a     }
{ combined work based on StarUML. Thus, the terms and conditions of the GNU    }
{ General Public License cover the whole combination.                          }
{                                                                              }
{ In addition, as a special exception, Plastic Software give you permission to }
{ combine StarUML program with free software programs or libraries that are    }
{ released under the GNU LGPL/Mozilla/Apache/BSD and with code included in the }
{ standard release of ExpressBar, ExpressNavBar, ExpressInspector,             }
{ ExpressPageControl, ProGrammar, NextGrid under the commercial license (or    }
{ modified versions of such code, with unchanged license). You may copy and    }
{ distribute such a system following the terms of the GNU GPL for StarUML and  }
{ the licenses of the other code concerned, provided that you include the      }
{ source code of that other code when and as the GNU GPL requires distribution }
{ of source code. Plastic Software also give you permission to combine StarUML }
{ program with dynamically linking plug-in (or add-in) programs that are       }
{ released under the GPL-incompatible and proprietary license.                 }
{                                                                              }
{ Note that people who make modified versions of StarUML are not obligated to  }
{ grant this special exception for their modified versions; it is their choice }
{ whether to do so. The GNU General Public License gives permission to release }
{ a modified version without this exception; this exception also makes it      }
{ possible to release a modified version which carries forward this exception. }
{******************************************************************************}

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

// PASTLWTR : $Revision: 1.2 $
// File generated on 2002-10-04 ���� 6:03:20 from Type Library described below.

// ************************************************************************  //
// Type Lib: d:\Program Files\ProGrammar\lib\Pgmr101.tlb (1)
// LIBID: {11D80594-533C-11D4-B97E-004005F9CBA4}
// LCID: 0
// Helpfile: d:\Program Files\ProGrammar\lib\Pgmr101.hlp
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  PGMR101LibMajorVersion = 1;
  PGMR101LibMinorVersion = 0;

  LIBID_PGMR101Lib: TGUID = '{11D80594-533C-11D4-B97E-004005F9CBA4}';

  DIID__DPgmr: TGUID = '{11D80595-533C-11D4-B97E-004005F9CBA4}';
  DIID__DPgmrEvents: TGUID = '{11D80596-533C-11D4-B97E-004005F9CBA4}';
  CLASS_Pgmr: TGUID = '{11D80597-533C-11D4-B97E-004005F9CBA4}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum PGStatus
type
  PGStatus = TOleEnum;
const
  pgStatusUnknown = $00000000;
  pgStatusComplete = $00000001;
  pgStatusError = $00000002;
  pgStatusBreak = $00000003;
  pgStatusExternal = $00000004;

// Constants for enum PGEvent
type
  PGEvent = TOleEnum;
const
  pgEventUnknown = $00000000;
  pgEventPush = $00000001;
  pgEventParse = $00000002;
  pgEventFail = $00000004;
  pgEventInputPos = $00000100;
  pgEventStep = $00000200;
  pgEventStepInc = $00000400;
  pgEventStackAll = $00000007;

// Constants for enum PGAttr
type
  PGAttr = TOleEnum;
const
  pgAttrBacktrack = $00002000;
  pgAttrHidden = $00000002;
  pgAttrMatchCase = $00000004;
  pgAttrShowDelimiters = $00000400;
  pgAttrShowLiterals = $00000100;
  pgAttrShowRepeaters = $00001000;
  pgAttrTerminal = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _DPgmr = dispinterface;
  _DPgmrEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Pgmr = _DPgmr;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PWideString1 = ^WideString; {*}


// *********************************************************************//
// DispIntf:  _DPgmr
// Flags:     (4112) Hidden Dispatchable
// GUID:      {11D80595-533C-11D4-B97E-004005F9CBA4}
// *********************************************************************//
  _DPgmr = dispinterface
    ['{11D80595-533C-11D4-B97E-004005F9CBA4}']
    property Status: PGStatus dispid 1;
    property PGParseEntireInput: WordBool dispid 2;
    procedure EndSearch(SearchID: Integer); dispid 3;
    function FailCurrSymbol: WordBool; dispid 4;
    function Find(const SearchPattern: WideString; StartNodeID: Integer): Integer; dispid 5;
    function FindNext(SearchID: Integer): Integer; dispid 6;
    function GetAPIVersion: WideString; dispid 7;
    function GetChild(NodeID: Integer; ChildIndex: Integer): Integer; dispid 8;
    function GetCurrBreakpointID: Integer; dispid 9;
    function GetCurrEventType: PGEvent; dispid 10;
    function GetCurrInputPos: Integer; dispid 11;
    function GetCurrStatus: PGStatus; dispid 12;
    function GetCurrStep: Integer; dispid 13;
    function GetCurrSymbolID: Integer; dispid 14;
    function GetDefStartSymbolID: Integer; dispid 15;
    function GetErrorCode(ErrorIndex: Smallint): Integer; dispid 16;
    function GetErrorDescription(ErrorIndex: Smallint): WideString; dispid 17;
    function GetErrorDetail(ErrorIndex: Smallint; const DetailName: WideString): WideString; dispid 18;
    function GetErrorDetails(ErrorIndex: Smallint): WideString; dispid 19;
    function GetErrorSeverity(ErrorIndex: Smallint): Integer; dispid 20;
    function GetGrammarVersion: WideString; dispid 21;
    function GetInputBuffer(Position: Integer; NumChars: Integer): WideString; dispid 22;
    function GetInputChar(Position: Integer): Smallint; dispid 23;
    function GetInputFilename: WideString; dispid 24;
    function GetInputLength: Integer; dispid 25;
    function GetLabel(NodeID: Integer): WideString; dispid 26;
    function GetInputLine(LineNumber: Integer): WideString; dispid 27;
    function GetInputLineNumber(Position: Integer): Integer; dispid 28;
    function GetInputLinePos(LineNumber: Integer): Integer; dispid 29;
    function GetInputNumLines: Integer; dispid 30;
    function GetNextSibling(NodeID: Integer): Integer; dispid 31;
    function GetNodeDepth(NodeID: Integer): Integer; dispid 32;
    function GetNodeIndex(NodeID: Integer): Integer; dispid 33;
    function GetNodeSymbolID(NodeID: Integer): Integer; dispid 34;
    function GetNumChildren(NodeID: Integer): Integer; dispid 35;
    function GetNumDescendants(NodeID: Integer): Integer; dispid 36;
    function GetNumErrors: Integer; dispid 37;
    function GetNumNodes: Integer; dispid 38;
    function GetParent(NodeID: Integer): Integer; dispid 39;
    function GetParserVersion: WideString; dispid 40;
    function GetPrevSibling(NodeID: Integer): Integer; dispid 41;
    function GetRoot: Integer; dispid 42;
    function GetSpaceChars: WideString; dispid 43;
    function GetSpaceSymbolID: Integer; dispid 44;
    function GetStackAttr(AttrID: PGAttr): WordBool; dispid 45;
    function GetStackItemData(SearchPrevious: Smallint): Integer; dispid 46;
    function GetCurrNodeID: Integer; dispid 47;
    function GetStartSymbolID: Integer; dispid 48;
    function GetSymbolID(const SymbolName: WideString): Integer; dispid 49;
    function GetSymbolName(SymbolID: Integer): WideString; dispid 50;
    function GetValue(NodeID: Integer): WideString; dispid 51;
    function GetValuePos(NodeID: Integer): Integer; dispid 52;
    function GetValueSize(NodeID: Integer): Integer; dispid 53;
    function IsLeafNode(NodeID: Integer): WordBool; dispid 54;
    function LoadBinaryGrammar(var GrammarBuffer: WideString): WordBool; dispid 55;
    function LoadFromCache(const CachePathName: WideString): WordBool; dispid 56;
    function Parse: PGStatus; dispid 57;
    function ParseCurrSymbol(NumChars: Integer): WordBool; dispid 58;
    procedure RemoveAllBreakpoints; dispid 59;
    procedure RemoveBreakpoint(BreakpointID: Integer); dispid 60;
    function SaveToCache(const CachePathName: WideString): WordBool; dispid 61;
    function SetBreakpoint(EventMask: PGEvent; EventParam: Integer): Integer; dispid 62;
    function SetGrammar(const GrammarPathName: WideString): WordBool; dispid 63;
    function SetInputFilename(const PathName: WideString): WordBool; dispid 64;
    function SetInputString(const InputString: WideString): WordBool; dispid 65;
    procedure SetStackItemData(ItemData: Integer); dispid 66;
    function SetStartSymbol(SymbolID: Integer): WordBool; dispid 67;
    function StartSearch(const SearchPattern: WideString; StartNodeID: Integer): Integer; dispid 68;
    function PostErrorsFromTree: WordBool; dispid 69;
    function GetDefProjectDir: WideString; dispid 70;
    function EndParse: PGStatus; dispid 71;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  _DPgmrEvents
// Flags:     (4096) Dispatchable
// GUID:      {11D80596-533C-11D4-B97E-004005F9CBA4}
// *********************************************************************//
  _DPgmrEvents = dispinterface
    ['{11D80596-533C-11D4-B97E-004005F9CBA4}']
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TPgmr
// Help String      : ProGrammar 1.01 ActiveX Control
// Default Interface: _DPgmr
// Def. Intf. DISP? : Yes
// Event   Interface: _DPgmrEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TPgmr = class(TOleControl)
  private
    FIntf: _DPgmr;
    function  GetControlInterface: _DPgmr;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure EndSearch(SearchID: Integer);
    function FailCurrSymbol: WordBool;
    function Find(const SearchPattern: WideString; StartNodeID: Integer): Integer;
    function FindNext(SearchID: Integer): Integer;
    function GetAPIVersion: WideString;
    function GetChild(NodeID: Integer; ChildIndex: Integer): Integer;
    function GetCurrBreakpointID: Integer;
    function GetCurrEventType: PGEvent;
    function GetCurrInputPos: Integer;
    function GetCurrStatus: PGStatus;
    function GetCurrStep: Integer;
    function GetCurrSymbolID: Integer;
    function GetDefStartSymbolID: Integer;
    function GetErrorCode(ErrorIndex: Smallint): Integer;
    function GetErrorDescription(ErrorIndex: Smallint): WideString;
    function GetErrorDetail(ErrorIndex: Smallint; const DetailName: WideString): WideString;
    function GetErrorDetails(ErrorIndex: Smallint): WideString;
    function GetErrorSeverity(ErrorIndex: Smallint): Integer;
    function GetGrammarVersion: WideString;
    function GetInputBuffer(Position: Integer; NumChars: Integer): WideString;
    function GetInputChar(Position: Integer): Smallint;
    function GetInputFilename: WideString;
    function GetInputLength: Integer;
    function GetLabel(NodeID: Integer): WideString;
    function GetInputLine(LineNumber: Integer): WideString;
    function GetInputLineNumber(Position: Integer): Integer;
    function GetInputLinePos(LineNumber: Integer): Integer;
    function GetInputNumLines: Integer;
    function GetNextSibling(NodeID: Integer): Integer;
    function GetNodeDepth(NodeID: Integer): Integer;
    function GetNodeIndex(NodeID: Integer): Integer;
    function GetNodeSymbolID(NodeID: Integer): Integer;
    function GetNumChildren(NodeID: Integer): Integer;
    function GetNumDescendants(NodeID: Integer): Integer;
    function GetNumErrors: Integer;
    function GetNumNodes: Integer;
    function GetParent(NodeID: Integer): Integer;
    function GetParserVersion: WideString;
    function GetPrevSibling(NodeID: Integer): Integer;
    function GetRoot: Integer;
    function GetSpaceChars: WideString;
    function GetSpaceSymbolID: Integer;
    function GetStackAttr(AttrID: PGAttr): WordBool;
    function GetStackItemData(SearchPrevious: Smallint): Integer;
    function GetCurrNodeID: Integer;
    function GetStartSymbolID: Integer;
    function GetSymbolID(const SymbolName: WideString): Integer;
    function GetSymbolName(SymbolID: Integer): WideString;
    function GetValue(NodeID: Integer): WideString;
    function GetValuePos(NodeID: Integer): Integer;
    function GetValueSize(NodeID: Integer): Integer;
    function IsLeafNode(NodeID: Integer): WordBool;
    function LoadBinaryGrammar(var GrammarBuffer: WideString): WordBool;
    function LoadFromCache(const CachePathName: WideString): WordBool;
    function Parse: PGStatus;
    function ParseCurrSymbol(NumChars: Integer): WordBool;
    procedure RemoveAllBreakpoints;
    procedure RemoveBreakpoint(BreakpointID: Integer);
    function SaveToCache(const CachePathName: WideString): WordBool;
    function SetBreakpoint(EventMask: PGEvent; EventParam: Integer): Integer;
    function SetGrammar(const GrammarPathName: WideString): WordBool;
    function SetInputFilename(const PathName: WideString): WordBool;
    function SetInputString(const InputString: WideString): WordBool;
    procedure SetStackItemData(ItemData: Integer);
    function SetStartSymbol(SymbolID: Integer): WordBool;
    function StartSearch(const SearchPattern: WideString; StartNodeID: Integer): Integer;
    function PostErrorsFromTree: WordBool;
    function GetDefProjectDir: WideString;
    function EndParse: PGStatus;
    procedure AboutBox;
    property  ControlInterface: _DPgmr read GetControlInterface;
    property  DefaultInterface: _DPgmr read GetControlInterface;
  published
    property  TabStop;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  Visible;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property Status: TOleEnum index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property PGParseEntireInput: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'Plastic';

implementation

uses ComObj;

procedure TPgmr.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{11D80597-533C-11D4-B97E-004005F9CBA4}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004005*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TPgmr.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _DPgmr;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TPgmr.GetControlInterface: _DPgmr;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TPgmr.EndSearch(SearchID: Integer);
begin
  DefaultInterface.EndSearch(SearchID);
end;

function TPgmr.FailCurrSymbol: WordBool;
begin
  Result := DefaultInterface.FailCurrSymbol;
end;

function TPgmr.Find(const SearchPattern: WideString; StartNodeID: Integer): Integer;
begin
  Result := DefaultInterface.Find(SearchPattern, StartNodeID);
end;

function TPgmr.FindNext(SearchID: Integer): Integer;
begin
  Result := DefaultInterface.FindNext(SearchID);
end;

function TPgmr.GetAPIVersion: WideString;
begin
  Result := DefaultInterface.GetAPIVersion;
end;

function TPgmr.GetChild(NodeID: Integer; ChildIndex: Integer): Integer;
begin
  Result := DefaultInterface.GetChild(NodeID, ChildIndex);
end;

function TPgmr.GetCurrBreakpointID: Integer;
begin
  Result := DefaultInterface.GetCurrBreakpointID;
end;

function TPgmr.GetCurrEventType: PGEvent;
begin
  Result := DefaultInterface.GetCurrEventType;
end;

function TPgmr.GetCurrInputPos: Integer;
begin
  Result := DefaultInterface.GetCurrInputPos;
end;

function TPgmr.GetCurrStatus: PGStatus;
begin
  Result := DefaultInterface.GetCurrStatus;
end;

function TPgmr.GetCurrStep: Integer;
begin
  Result := DefaultInterface.GetCurrStep;
end;

function TPgmr.GetCurrSymbolID: Integer;
begin
  Result := DefaultInterface.GetCurrSymbolID;
end;

function TPgmr.GetDefStartSymbolID: Integer;
begin
  Result := DefaultInterface.GetDefStartSymbolID;
end;

function TPgmr.GetErrorCode(ErrorIndex: Smallint): Integer;
begin
  Result := DefaultInterface.GetErrorCode(ErrorIndex);
end;

function TPgmr.GetErrorDescription(ErrorIndex: Smallint): WideString;
begin
  Result := DefaultInterface.GetErrorDescription(ErrorIndex);
end;

function TPgmr.GetErrorDetail(ErrorIndex: Smallint; const DetailName: WideString): WideString;
begin
  Result := DefaultInterface.GetErrorDetail(ErrorIndex, DetailName);
end;

function TPgmr.GetErrorDetails(ErrorIndex: Smallint): WideString;
begin
  Result := DefaultInterface.GetErrorDetails(ErrorIndex);
end;

function TPgmr.GetErrorSeverity(ErrorIndex: Smallint): Integer;
begin
  Result := DefaultInterface.GetErrorSeverity(ErrorIndex);
end;

function TPgmr.GetGrammarVersion: WideString;
begin
  Result := DefaultInterface.GetGrammarVersion;
end;

function TPgmr.GetInputBuffer(Position: Integer; NumChars: Integer): WideString;
begin
  Result := DefaultInterface.GetInputBuffer(Position, NumChars);
end;

function TPgmr.GetInputChar(Position: Integer): Smallint;
begin
  Result := DefaultInterface.GetInputChar(Position);
end;

function TPgmr.GetInputFilename: WideString;
begin
  Result := DefaultInterface.GetInputFilename;
end;

function TPgmr.GetInputLength: Integer;
begin
  Result := DefaultInterface.GetInputLength;
end;

function TPgmr.GetLabel(NodeID: Integer): WideString;
begin
  Result := DefaultInterface.GetLabel(NodeID);
end;

function TPgmr.GetInputLine(LineNumber: Integer): WideString;
begin
  Result := DefaultInterface.GetInputLine(LineNumber);
end;

function TPgmr.GetInputLineNumber(Position: Integer): Integer;
begin
  Result := DefaultInterface.GetInputLineNumber(Position);
end;

function TPgmr.GetInputLinePos(LineNumber: Integer): Integer;
begin
  Result := DefaultInterface.GetInputLinePos(LineNumber);
end;

function TPgmr.GetInputNumLines: Integer;
begin
  Result := DefaultInterface.GetInputNumLines;
end;

function TPgmr.GetNextSibling(NodeID: Integer): Integer;
begin
  Result := DefaultInterface.GetNextSibling(NodeID);
end;

function TPgmr.GetNodeDepth(NodeID: Integer): Integer;
begin
  Result := DefaultInterface.GetNodeDepth(NodeID);
end;

function TPgmr.GetNodeIndex(NodeID: Integer): Integer;
begin
  Result := DefaultInterface.GetNodeIndex(NodeID);
end;

function TPgmr.GetNodeSymbolID(NodeID: Integer): Integer;
begin
  Result := DefaultInterface.GetNodeSymbolID(NodeID);
end;

function TPgmr.GetNumChildren(NodeID: Integer): Integer;
begin
  Result := DefaultInterface.GetNumChildren(NodeID);
end;

function TPgmr.GetNumDescendants(NodeID: Integer): Integer;
begin
  Result := DefaultInterface.GetNumDescendants(NodeID);
end;

function TPgmr.GetNumErrors: Integer;
begin
  Result := DefaultInterface.GetNumErrors;
end;

function TPgmr.GetNumNodes: Integer;
begin
  Result := DefaultInterface.GetNumNodes;
end;

function TPgmr.GetParent(NodeID: Integer): Integer;
begin
  Result := DefaultInterface.GetParent(NodeID);
end;

function TPgmr.GetParserVersion: WideString;
begin
  Result := DefaultInterface.GetParserVersion;
end;

function TPgmr.GetPrevSibling(NodeID: Integer): Integer;
begin
  Result := DefaultInterface.GetPrevSibling(NodeID);
end;

function TPgmr.GetRoot: Integer;
begin
  Result := DefaultInterface.GetRoot;
end;

function TPgmr.GetSpaceChars: WideString;
begin
  Result := DefaultInterface.GetSpaceChars;
end;

function TPgmr.GetSpaceSymbolID: Integer;
begin
  Result := DefaultInterface.GetSpaceSymbolID;
end;

function TPgmr.GetStackAttr(AttrID: PGAttr): WordBool;
begin
  Result := DefaultInterface.GetStackAttr(AttrID);
end;

function TPgmr.GetStackItemData(SearchPrevious: Smallint): Integer;
begin
  Result := DefaultInterface.GetStackItemData(SearchPrevious);
end;

function TPgmr.GetCurrNodeID: Integer;
begin
  Result := DefaultInterface.GetCurrNodeID;
end;

function TPgmr.GetStartSymbolID: Integer;
begin
  Result := DefaultInterface.GetStartSymbolID;
end;

function TPgmr.GetSymbolID(const SymbolName: WideString): Integer;
begin
  Result := DefaultInterface.GetSymbolID(SymbolName);
end;

function TPgmr.GetSymbolName(SymbolID: Integer): WideString;
begin
  Result := DefaultInterface.GetSymbolName(SymbolID);
end;

function TPgmr.GetValue(NodeID: Integer): WideString;
begin
  Result := DefaultInterface.GetValue(NodeID);
end;

function TPgmr.GetValuePos(NodeID: Integer): Integer;
begin
  Result := DefaultInterface.GetValuePos(NodeID);
end;

function TPgmr.GetValueSize(NodeID: Integer): Integer;
begin
  Result := DefaultInterface.GetValueSize(NodeID);
end;

function TPgmr.IsLeafNode(NodeID: Integer): WordBool;
begin
  Result := DefaultInterface.IsLeafNode(NodeID);
end;

function TPgmr.LoadBinaryGrammar(var GrammarBuffer: WideString): WordBool;
begin
  Result := DefaultInterface.LoadBinaryGrammar(GrammarBuffer);
end;

function TPgmr.LoadFromCache(const CachePathName: WideString): WordBool;
begin
  Result := DefaultInterface.LoadFromCache(CachePathName);
end;

function TPgmr.Parse: PGStatus;
begin
  Result := DefaultInterface.Parse;
end;

function TPgmr.ParseCurrSymbol(NumChars: Integer): WordBool;
begin
  Result := DefaultInterface.ParseCurrSymbol(NumChars);
end;

procedure TPgmr.RemoveAllBreakpoints;
begin
  DefaultInterface.RemoveAllBreakpoints;
end;

procedure TPgmr.RemoveBreakpoint(BreakpointID: Integer);
begin
  DefaultInterface.RemoveBreakpoint(BreakpointID);
end;

function TPgmr.SaveToCache(const CachePathName: WideString): WordBool;
begin
  Result := DefaultInterface.SaveToCache(CachePathName);
end;

function TPgmr.SetBreakpoint(EventMask: PGEvent; EventParam: Integer): Integer;
begin
  Result := DefaultInterface.SetBreakpoint(EventMask, EventParam);
end;

function TPgmr.SetGrammar(const GrammarPathName: WideString): WordBool;
begin
  Result := DefaultInterface.SetGrammar(GrammarPathName);
end;

function TPgmr.SetInputFilename(const PathName: WideString): WordBool;
begin
  Result := DefaultInterface.SetInputFilename(PathName);
end;

function TPgmr.SetInputString(const InputString: WideString): WordBool;
begin
  Result := DefaultInterface.SetInputString(InputString);
end;

procedure TPgmr.SetStackItemData(ItemData: Integer);
begin
  DefaultInterface.SetStackItemData(ItemData);
end;

function TPgmr.SetStartSymbol(SymbolID: Integer): WordBool;
begin
  Result := DefaultInterface.SetStartSymbol(SymbolID);
end;

function TPgmr.StartSearch(const SearchPattern: WideString; StartNodeID: Integer): Integer;
begin
  Result := DefaultInterface.StartSearch(SearchPattern, StartNodeID);
end;

function TPgmr.PostErrorsFromTree: WordBool;
begin
  Result := DefaultInterface.PostErrorsFromTree;
end;

function TPgmr.GetDefProjectDir: WideString;
begin
  Result := DefaultInterface.GetDefProjectDir;
end;

function TPgmr.EndParse: PGStatus;
begin
  Result := DefaultInterface.EndParse;
end;

procedure TPgmr.AboutBox;
begin
  DefaultInterface.AboutBox;
end;

procedure Register;
begin
  RegisterComponents('StarUML',[TPgmr]);
end;

end.
