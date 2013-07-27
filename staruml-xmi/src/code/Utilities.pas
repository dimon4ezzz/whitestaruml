unit Utilities;

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

interface

uses
  XMLDoc, XMLIntf, WhiteStarUML_TLB, Classes, Graphics, Types;

type
  PStrArray = array of string;

  // PXMLUtil
  PXMLUtil = class
  private
    FXMLDocument: TXMLDocument;
    procedure SetXMLDocument(Value: TXMLDocument);
    function GetRootNode: IXMLNode;
  public
    function FindFirstNode(Parent: IXMLNode; NodeName: string; Recursive: Boolean = False): IXMLNode;
    function FindSecondNode(Parent: IXMLNode; NodeName: string): IXMLNode;
    function FindFirstParentNode(Node: IXMLNode; NodeName: string): IXMLNode;
    function GetParentNode(Node: IXMLNode): IXMLNode;
    function GetNodeValue(Node: IXMLNode): string;
    function GetAttributeValue(Node: IXMLNode; Attr: string): string;
    function GetAttributeValueFromSubNode(Node: IXMLNode; Attr: string): string;
    property XMLDocument: TXMLDocument read FXMLDocument write SetXMLDocument;
    property RootNode: IXMLNode read GetRootNode;
  end;

  // PAppUtil
  PAppUtil = class
  private
    FStarUMLApp: IStarUMLApplication;
  public
    procedure AddLog(Str: string);
    procedure AddMessage(Str: string; Elem: IElement);
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
  end;

  // PUtility
  PUtility = class
    class function EncodeXMLAttributeValue(Value: string): string;
    class function IsURL(Value: string): Boolean;
    class procedure GetRGBColor(Color: TColor; out Red: Byte; out Green: Byte; out Blue: Byte);
    class function UnionRect(Rt: TRect; Pt: TPoint): TRect;
    class function GetDayOfWeekName(D: TDateTime): string;
    class function GetMonthName(D: TDateTime): string;
  end;
  
  // Utility methods
  function StringToAggregation(Attr: string): UMLAggregationKind;
  function StringToBoolean(Attr: string): Boolean;
  function StringToBoolean2(Str: string): Boolean;
  function StringToCallConcurrency(Attr: string): UMLCallConcurrencyKind;
  function StringToChangeable(Attr: string): UMLChangeableKind;
  function StringToOrdering(Attr: string): UMLOrderingKind;
  function StringToParameterDirection(Attr: string): UMLParameterDirectionKind;
  function StringToPseudostate(Attr: string): UMLPseudostateKind;
  function StringToScope(Attr: string): UMLScopeKind;
  function StringToVisibility(Attr: string): UMLVisibilityKind;
  function StringToMessageKind(Str: string): UMLFactoryMessageKind;
  function StringToColor(B, G, R: string): string;
  function StringToFontStyle(B, I, U, S: string): string;
  function SplitStringWithMatch(Str: string; Match: string): PStrArray;
  function RationalRoseGeometryCalc(CenterPoint, CenterSize: Integer): Integer;
  function IsContainedCoordinate(OwnerArr, OwnedArr: PStrArray): Boolean;
  function GetArrayValue(Arr: PStrArray; Idx: Integer): Integer;
  function GetDllPath: string;
  function RemoveBraceFromName(Val: string): string;
  function RemoveSlashFromName(Val: string): string;
  function CheckUMLElemNameValidation(Val: string): Boolean;
  function ConflictNameToNewName(Elem: IUMLModelElement; Val: string): string;
  function GetProgramName: string;

var
  XMLUtil: PXMLUtil;
  AppUtil: PAppUtil;

implementation

uses
  SysUtils, Windows, HTTPUtil, DateUtils,
  Symbols, NLS_XMIAddIn;


////////////////////////////////////////////////////////////////////////////////
// PXMLUtil

procedure PXMLUtil.SetXMLDocument(Value: TXMLDocument);
begin
  if FXMLDocument <> Value then FXMLDocument := Value;
end;

function PXMLUtil.GetRootNode: IXMLNode;
begin
  Result := nil;
  try
    if Assigned(FXMLDocument) then Result := FXMLDocument.DocumentElement;
  except
    // nothing to do
  end;
end;

function PXMLUtil.FindFirstNode(Parent: IXMLNode; NodeName: string; Recursive: Boolean = False): IXMLNode;
var
  SN: IXMLNode;
  I: Integer;
begin
  Result := nil;
  try
    if NodeName <> '' then begin
      if Parent = nil then Parent := RootNode;
      if Parent <> nil then begin
        Result := Parent.ChildNodes.FindNode(NodeName);
        if (Result = nil) and Recursive then begin
          for I := 0 to Parent.ChildNodes.Count - 1 do begin
            SN := Parent.ChildNodes.Nodes[I];
            Result := FindFirstNode(SN, NodeName, Recursive);
            if Result <> nil then Exit;
          end;
        end;
      end;
    end;
  except
    // nothing to do
  end;
end;

function PXMLUtil.FindSecondNode(Parent: IXMLNode; NodeName: string): IXMLNode;
var
  I: Integer;
  F: Boolean;
begin
  Result := nil;
  try
    if NodeName <> '' then begin
      if Parent = nil then Parent := RootNode;
      if Parent <> nil then begin
        F := False;
        for I := 0 to Parent.ChildNodes.Count - 1 do begin
          if Parent.ChildNodes.Nodes[I].NodeName = NodeName then begin
            if not F then F := True
            else begin
              Result := Parent.ChildNodes.Nodes[I];
              Break;
            end;
          end;
        end;
      end;
    end;
  except
    // nothing to do
  end;
end;

function PXMLUtil.FindFirstParentNode(Node: IXMLNode; NodeName: string): IXMLNode;
var ParentNode: IXMLNode;
begin
  Result := nil;
  try
    if Node <> nil then begin
      ParentNode := Node.ParentNode;
      if ParentNode <> nil then begin
        if ParentNode.NodeName = NodeName then begin
          Result := ParentNode;
          Exit;
        end;
        Result := FindFirstParentNode(ParentNode, NodeName);
      end;
    end;
  except 
    // nothing to do
  end;
end;

function PXMLUtil.GetParentNode(Node: IXMLNode): IXMLNode;
begin
  Result := nil;
  try
    if Node <> nil then Result := Node.ParentNode;
  except
    // nothing to do
  end;
end;

function PXMLUtil.GetNodeValue(Node: IXMLNode): string;
begin
  Result := '';
  try
    if Node <> nil then begin
      if (Node.NodeType = ntElement) then
        Result := Node.NodeValue
      else if (Node.NodeType = ntText) or
              (Node.NodeType = ntCData) then
        Result := Node.Text;
      Result := Trim(Result);
    end;
  except
    // nothing to do
  end;
end;

function PXMLUtil.GetAttributeValue(Node: IXMLNode; Attr: string): string;
begin
  Result := '';
  try
    if Attr <> '' then begin
      if Node = nil then Node := RootNode;
      if (Node <> nil) and Node.HasAttribute(Attr) then
        Result := Trim(Node.Attributes[Attr]);
    end;
  except
    // nothing to do
  end;
end;

function PXMLUtil.GetAttributeValueFromSubNode(Node: IXMLNode; Attr: string): string;
var
  I: Integer;
  SubNode: IXMLNode;
begin
  Result := '';
  try
    if (Node <> nil) and (Attr <> '') then begin
      for I := 0 to Node.ChildNodes.Count - 1 do begin
        SubNode := Node.ChildNodes.Nodes[I];
        if SubNode.HasAttribute(Attr) then begin
          Result := Trim(SubNode.Attributes[Attr]);
          Break;
        end;
      end;
    end;
  except
    // nothing to do
  end;
end;

// PXMLUtil
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAppUtil

procedure PAppUtil.AddLog(Str: string);
begin
  try
    if Assigned(FStarUMLApp) then FStarUMLApp.Log(Str);
  except
  end;
end;

procedure PAppUtil.AddMessage(Str: string; Elem: IElement);
begin
  try
    if Assigned(FStarUMLApp) and (Elem <> nil) then
      FStarUMLApp.AddMessageItem(mkGeneral, Str, Elem);
  except
  end;
end;

// PAppUtil
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUnitility

class function PUtility.EncodeXMLAttributeValue(Value: string): string;
var
  S: string;
begin
  //S := HTMLEscape(UTF8Encode(Value));
  S := HTMLEscape(Value);
  S := StringReplace(S, #9, '&#x0009;', [rfReplaceAll]);
  S := StringReplace(S, #10, '&#x000a;', [rfReplaceAll]);
  S := StringReplace(S, #13, '&#x000d;', [rfReplaceAll]);
  Result := S;
end;

class function PUtility.IsURL(Value: string): Boolean;
begin
  Result := (Pos('://', Value) <> 0);
end;

class procedure PUtility.GetRGBColor(Color: TColor; out Red: Byte; out Green: Byte; out Blue: Byte);
begin
  Red := Color mod 256;
  Green := (Color div 256) mod 256;
  Blue := (Color div 65536) mod 256;
end;

class function PUtility.UnionRect(Rt: TRect; Pt: TPoint): TRect;
var
  R: TRect;
begin
  R := Rt;
  if Pt.X < R.Left then R.Left := Pt.X;
  if Pt.Y < R.Top then R.Top := Pt.Y;
  if Pt.X > R.Right then R.Right := Pt.X;
  if Pt.Y > R.Bottom then R.Bottom := Pt.Y;
  Result := R;
end;

class function PUtility.GetDayOfWeekName(D: TDateTime): string;
begin
  case DayOfWeek(D) of
    1: Result := 'Sun';
    2: Result := 'Mon';
    3: Result := 'Tue';
    4: Result := 'Wed';
    5: Result := 'Thu';
    6: Result := 'Fri';
    7: Result := 'Sat';
  end;
end;

class function PUtility.GetMonthName(D: TDateTime): string;
begin
  case MonthOf(D) of
    1: Result := 'Jan';
    2: Result := 'Feb';
    3: Result := 'Mar';
    4: Result := 'Apr';
    5: Result := 'May';
    6: Result := 'Jun';
    7: Result := 'Jul';
    8: Result := 'Aug';
    9: Result := 'Sep';
    10: Result := 'Oct';
    11: Result := 'Nov';
    12: Result := 'Dec';
  end;
end;

// PUnitility
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Utility methods

function StringToAggregation(Attr: string): UMLAggregationKind;
begin
  Attr := LowerCase(Attr);
  if Attr = 'aggregate' then Result := akAggregate
  else if Attr = 'composite' then Result := akComposite
  else Result := akNone;
end;

function StringToBoolean(Attr: string): Boolean;
begin
  Attr := LowerCase(Attr);
  if Attr = 'true' then Result := true
  else Result := false;
end;

function StringToBoolean2(Str: string): Boolean;
begin
  Str := Trim(Str);
  if Str = '1' then Result := true
  else Result := false;
end;

function StringToCallConcurrency(Attr: string): UMLCallConcurrencyKind;
begin
  Attr := LowerCase(Attr);
  if Attr = 'guarded' then Result := cckGuarded
  else if Attr = 'concurrent' then Result := cckConcurrent
  else Result := cckSequential;
end;

function StringToChangeable(Attr: string): UMLChangeableKind;
begin
  Attr := LowerCase(Attr);
  if Attr = 'frozen' then Result := ckFrozen
  else if Attr = 'addonly' then Result := ckAddOnly
  else Result := ckChangeable;
end;

function StringToOrdering(Attr: string): UMLOrderingKind;
begin
  Attr := LowerCase(Attr);
  if (Attr = 'ordered') or (Attr = 'sorted') then Result := okOrdered
  else Result := okUnordered;
end;

function StringToParameterDirection(Attr: string): UMLParameterDirectionKind;
begin
  Attr := LowerCase(Attr);
  if Attr = 'inout' then Result := pdkInout
  else if Attr = 'out' then Result := pdkOut
  else if Attr = 'return' then Result := pdkReturn
  else Result := pdkIn;
end;

function StringToPseudostate(Attr: string): UMLPseudostateKind;
begin
  Attr := LowerCase(Attr);
  if Attr = 'deephistory' then Result := pkDeepHistory
  else if Attr = 'initial' then Result := pkInitial
  else if Attr = 'junction' then Result := pkJunction
  else if Attr = 'shallowhistory' then Result := pkShallowHistory
  else if Attr = 'join' then Result := pkSynchronization
  else if Attr = 'fork' then Result := pkSynchronization
  else if Attr = 'branch' then Result := pkDecision
  else Result := pkChoice;
end;

function StringToScope(Attr: string): UMLScopeKind;
begin
  Attr := LowerCase(Attr);
  if Attr = 'classifier' then Result := skClassifier
  else Result := skInstance;
end;

function StringToVisibility(Attr: string): UMLVisibilityKind;
begin
  Attr := LowerCase(Attr);
  if Attr = 'private' then Result := vkPrivate
  else if Attr = 'protected' then Result := vkProtected
  else Result := vkPublic;
end;

function StringToMessageKind(Str: string): UMLFactoryMessageKind;
begin
  Str := LowerCase(Str);
  if Str = 'asynchronous' then Result := mkSendAction
  else if Str = 'return' then Result := mkReturnAction
  else Result := mkCallAction;
end;

function StringToColor(B, G, R: string): string;
var
  BV, GV, RV: Integer;
begin
  Result := '';
  if (B = '') or (G = '') or (R = '') then Exit;
  BV := StrToInt(B);
  GV := StrToInt(G);
  RV := StrToInt(R);
  if (BV < 0) or (BV > 255) then Exit;
  if (GV < 0) or (GV > 255) then Exit;
  if (RV < 0) or (RV > 255) then Exit;
  Result := IntToStr((BV * 256 * 256) + (GV * 256) + RV);
end;

function StringToFontStyle(B, I, U, S: string): string;
var
  BV, IV, UV, SV: Integer;
  Ret: Integer;
begin
  Result := '';
  if (B = '') and (I = '') and (U = '') and (S = '') then Exit;
  if B <> '' then BV := StrToInt(B) else BV := 0;
  if I <> '' then IV := StrToInt(I) else IV := 0;
  if U <> '' then UV := StrToInt(U) else UV := 0;
  if S <> '' then SV := StrToInt(S) else SV := 0;
  Ret := 0;
  if BV = 1 then Ret := 1;
  if IV = 1 then Ret := Ret + 2;
  if UV = 1 then Ret := Ret + 4;
  if SV = 1 then Ret := Ret + 8;
  Result := IntToStr(Ret);
end;

function SplitStringWithMatch(Str: string; Match: string): PStrArray;
  function CountMatchString(Str, SubStr: string): Integer;
  var
    C: Integer;
  begin
    C := 0;
    while Pos(SubStr, Str) > 0 do
    begin
      Inc(C);
      Str[Pos(SubStr, Str)] := '$';
    end;
    Result := C;
  end;

var
  I, C, P1, P2: Integer;
  Ret: PStrArray;
  Temp: string;
begin
  Str := StringReplace(Str, #13, '', [rfReplaceAll, rfIgnoreCase]);
  Str := StringReplace(Str, #10, ' ', [rfReplaceAll, rfIgnoreCase]);
  SetLength(Ret, 0);
  Result := Ret;
  C := CountMatchString(Str, Match);
  if C = 0 then begin
    SetLength(Ret, 1);
    Ret[0] := Str;
    Result := Ret;
    Exit;
  end;
  if C > 0 then begin
    SetLength(Ret, C + 1);
    P1 := 0;
    for I := 0 to C - 1 do begin
      P2 := Pos(Match, Str);
      Temp := Trim(Copy(Str, P1 + 1, (P2 - P1 - 1)));
      Str[P2] := '$';
      Ret[I] := Temp;
      P1 := P2;
    end;
    Temp := Trim(Copy(Str, P1 + 1, Length(Str)));
    Ret[C] := Temp;
  end;
  Result := Ret;
end;

function RationalRoseGeometryCalc(CenterPoint, CenterSize: Integer): Integer;
begin
  Result := CenterPoint - (CenterSize div 2);
end;

function IsContainedCoordinate(OwnerArr, OwnedArr: PStrArray): Boolean;
var
  L, T, R, B: Integer;
  L2, T2, R2, B2: Integer;
  HCheck, VCheck: Boolean;
begin
  Result := False;
  L := RationalRoseGeometryCalc(GetArrayValue(OwnerArr, 1), GetArrayValue(OwnerArr, 3));
  T := RationalRoseGeometryCalc(GetArrayValue(OwnerArr, 2), GetArrayValue(OwnerArr, 4));
  R := L + GetArrayValue(OwnerArr, 3);
  B := T + GetArrayValue(OwnerArr, 4);
  L2 := RationalRoseGeometryCalc(GetArrayValue(OwnedArr, 1), GetArrayValue(OwnedArr, 3));
  T2 := RationalRoseGeometryCalc(GetArrayValue(OwnedArr, 2), GetArrayValue(OwnedArr, 4));
  R2 := L2 + GetArrayValue(OwnedArr, 3);
  B2 := T2 + GetArrayValue(OwnedArr, 4);
  HCheck := False; VCheck := False;
  if (L2 > L) and (L2 < R) then HCheck := True;
  if (R2 > L) and (R2 < R) then HCheck := True;
  if (T2 > T) and (T2 < B) then VCheck := True;
  if (B2 > T) and (B2 < B) then VCheck := True;
  if HCheck and VCheck then Result := True; 
end;

function GetArrayValue(Arr: PStrArray; Idx: Integer): Integer;
begin
  Result := 0;
  try
    if Length(Arr) >= Idx then Result := StrToInt(Arr[Idx - 1]);
  except
  end
end;

function GetDllPath: string;
var
  ModuleName : array[0..254] of char;
  Path: string;
begin
  FillChar(ModuleName, Sizeof(ModuleName), #10);
  GetModuleFileName(HInstance, ModuleName, Sizeof(ModuleName));
  Path := ExtractFileDir(ModuleName);
  Result := Path;
end;

function RemoveBraceFromName(Val: string): string;
var
  P1, P2: Integer;
begin
  Result := Val;
  P1 := Pos('{', Val);
  P2 := Pos('}', Val);
  if (P1 = 1) and (P2 > 2) then begin
    Result := Trim(Copy(Val, P2 + 1, Length(Val)));
    if Result = '' then Result := Trim(Copy(Val, P1 + 1, P2 - P1 - 1));
  end;
end;

function RemoveSlashFromName(Val: string): string;
begin
  Result := Trim(Val);
  if Pos('/', Val) = 1 then begin
    if Length(Val) > 1 then Result := Copy(Val, 2, Length(Val) - 1);
  end;
end;

function CheckUMLElemNameValidation(Val: string): Boolean;
const
  NotAllowedChars: array[0..4] of string = ('<', '>', '&', '"', ':');
var
  I: Integer;
begin
  Result := True;
  for I := 0 to High(NotAllowedChars) do
  begin
    if Pos(NotAllowedChars[I], Val) > 0 then begin
      Result := False;
      Break;
    end;
  end;
end;

function ConflictNameToNewName(Elem: IUMLModelElement; Val: string): string;
var
  Ret: string;
begin
  Result := Val;
  if Val <> '' then begin
    Ret := Val;
    try
      while Elem.Namespace.ContainsName(Ret) do
        Ret := Ret + TXT_NAME_DISTINGUISHER;
      Result := Ret;
    except on Exception do
    end;
  end;
end;

function GetProgramName: string;
const
  CallingProcessHandle = 0;
var
  NameInput: array [1 .. MAX_PATH] of WideChar;
  FileNameLength: Cardinal;
begin
    FileNameLength := GetModuleFileName(CallingProcessHandle, @NameInput, MAX_PATH);
    if FileNameLength > 0 then
      Result := ExtractFileName(WideCharToString(@NameInput));
end;

// Utility methods
////////////////////////////////////////////////////////////////////////////////

initialization
  XMLUtil := PXMLUtil.Create;
  AppUtil := PAppUtil.Create;
finalization
  XMLUtil.Free;
  AppUtil.Free;
end.
