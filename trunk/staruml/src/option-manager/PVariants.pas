unit PVariants;

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
  Classes, Variants, Graphics;

const
  STR_TRUE = 'True';
  STR_FALSE = 'False';

  Colors: array[0..19] of TColor = (
    clBlack, clMaroon, clGreen, clOlive, clNavy,
    clPurple, clTeal, clGray, clSilver, clRed,
    clLime, clYellow, clBlue, clFuchsia, clAqua,
    clWhite, clMoneyGreen, clSkyBlue, clCream, clMedGray);

// Variant type check routine
function IsInteger(V: Variant): Boolean;
function IsReal(V: Variant): Boolean;
function IsBoolean(V: Variant): Boolean;
function IsString(V: Variant): Boolean;
function IsColor(V: Variant): Boolean;
function IsEnumeration(V: Variant; Items: TStrings): Boolean;

// Variant to typed value
function ColorValue(V: Variant): TColor;

// Utilities
function ColorToStr(C: TColor): string;

// etc
procedure ReadNLSColorNames;

var
  ColorNames: array[0..19] of string;

implementation

uses
  NLS_OPTMGR,
  SysUtils;

////////////////////////////////////////////////////////////////////////////////
// Variant type check routine

function IsInteger(V: Variant): Boolean;
var
  D, E: Integer;
begin
  Result := False;
  if VarIsOrdinal(V) and (VarType(V) <> varBoolean) then
    Result := True
  else if VarIsStr(V) then begin
    Val(V, D, E);
    Result := (E = 0);
  end;
end;

function IsReal(V: Variant): Boolean;
var
  S: string;
  R: Extended;
begin
  Result := False;
  if VarIsFloat(V) then
    Result := True
  else if VarIsStr(V) then begin
    S := V;
    Result := TextToFloat(PChar(S), R, fvExtended);
  end;
end;

function IsBoolean(V: Variant): Boolean;
begin
  Result := False;
  if VarType(V) = varBoolean then
    Result := True
  else if VarIsStr(V) then begin
    Result := (V = STR_TRUE) or (V = STR_FALSE);
  end;
end;

function IsString(V: Variant): Boolean;
begin
  Result := VarIsStr(V);
end;

function IsColor(V: Variant): Boolean;
var
  D, E: Integer;
  I: Integer;
begin
  Result := False;
  if VarIsStr(V) then begin
    for I := 0 to Length(ColorNames) - 1 do
      if ColorNames[I] = V then begin
        Result := True;
        Exit;
      end;
    Val(V, D, E);
    Result := (E = 0);
  end;
end;

function IsEnumeration(V: Variant; Items: TStrings): Boolean;
var
  I: Integer;
begin
  Result := False;
  if VarIsStr(V) then begin
    for I := 0 to Items.Count - 1 do
      if Items[I] = V then begin
        Result := True;
        Exit;
      end;
  end;
end;

// Variant type check routine
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Variant to typed value

function ColorValue(V: Variant): TColor;
var
  I, D, E: Integer;
begin
  Result := clNone;
  if VarIsStr(V) then begin

    // hack for jvc color
    //Result := TColor(V);
    //Exit;


    for I := 0 to Length(ColorNames) - 1 do
      if ColorNames[I] = V then begin
        Result := Colors[I];
        Exit;
      end;
    Val(V, D, E);
    if E = 0 then
      Result := D;
  end;
end;

// Variant to typed value
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Utilities

function ColorToStr(C: TColor): string;
begin
  Result := '$' + IntToHex(C, 8);
end;

// Utilities
////////////////////////////////////////////////////////////////////////////////

procedure ReadNLSColorNames;
begin
  ColorNames[0] := TXT_COLOR_BLACK;
  ColorNames[1] := TXT_COLOR_MAROON;
  ColorNames[2] := TXT_COLOR_GREEN;
  ColorNames[3] := TXT_COLOR_OLIVE;
  ColorNames[4] := TXT_COLOR_NAVY;
  ColorNames[5] := TXT_COLOR_PURPLE;
  ColorNames[6] := TXT_COLOR_TEAL;
  ColorNames[7] := TXT_COLOR_GRAY;
  ColorNames[8] := TXT_COLOR_SILVER;
  ColorNames[9] := TXT_COLOR_RED;
  ColorNames[10] := TXT_COLOR_LIME;
  ColorNames[11] := TXT_COLOR_YELLOW;
  ColorNames[12] := TXT_COLOR_BLUE;
  ColorNames[13] := TXT_COLOR_FUCHSIA;
  ColorNames[14] := TXT_COLOR_AQUA;
  ColorNames[15] := TXT_COLOR_WHITE;
  ColorNames[16] := TXT_COLOR_MONEYGREEN;
  ColorNames[17] := TXT_COLOR_SKYBLUE;
  ColorNames[18] := TXT_COLOR_CREAM;
  ColorNames[19] := TXT_COLOR_MEDGRAY;
end;

initialization
  ReadNLSColorNames;
end.
