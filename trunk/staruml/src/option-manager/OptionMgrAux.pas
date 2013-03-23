unit OptionMgrAux;

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
  OptMgr_TLB,
  Classes, SysUtils, Graphics, Windows,
  Xmldom, XMLIntf, Msxmldom, XMLDoc{, dxInspRw};

const
  OPTION_SCHEMA_FILE_EXT = 'xml';

  XOD_ELEMENT_SCHEMA = 'OPTIONSCHEMA';
  XOD_ELEMENT_HEADER = 'HEADER';
  XOD_ELEMENT_BODY = 'BODY';
  XOD_ELEMENT_CATEGORY = 'OPTIONCATEGORY';
  XOD_ELEMENT_CLASSIFICATION = 'OPTIONCLASSIFICATION';
  XOD_ELEMENT_UNKNOWN = '';
  XOD_ELEMENT_ITEM = 'OPTIONITEM';
  XOD_ELEMENT_ITEM_INTEGER = 'OPTIONITEM-INTEGER';
  XOD_ELEMENT_ITEM_REAL = 'OPTIONITEM-REAL';
  XOD_ELEMENT_ITEM_STRING = 'OPTIONITEM-STRING';
  XOD_ELEMENT_ITEM_BOOLEAN = 'OPTIONITEM-BOOLEAN';
  XOD_ELEMENT_ITEM_TEXT = 'OPTIONITEM-TEXT';
  XOD_ELEMENT_ITEM_ENUMERATION = 'OPTIONITEM-ENUMERATION';
  XOD_ELEMENT_ITEM_RANGE = 'OPTIONITEM-RANGE';
  XOD_ELEMENT_ITEM_FONTNAME = 'OPTIONITEM-FONTNAME';
  XOD_ELEMENT_ITEM_FILENAME = 'OPTIONITEM-FILENAME';
  XOD_ELEMENT_ITEM_PATHNAME = 'OPTIONITEM-PATHNAME';
  XOD_ELEMENT_ITEM_COLOR = 'OPTIONITEM-COLOR';
  XOD_ELEMENT_CAPTION = 'CAPTION';
  XOD_ELEMENT_TYPE = 'TYPE';
  XOD_ELEMENT_DEFAULT_VALUE = 'DEFAULTVALUE';
  XOD_ELEMENT_DESCRIPTION = 'DESCRIPTION';
  XOD_ELEMENT_MIN_VALUE = 'MINVALUE';
  XOD_ELEMENT_MAX_VALUE = 'MAXVALUE';
  XOD_ELEMENT_STEP = 'STEP';
  XOD_ELEMENT_ENUMURATION_ITEM = 'ENUMERATIONITEM';
  XOD_ATTRIBUTE_ID = 'id';
  XOD_ATTRIBUTE_KEY = 'key';

  OPTIONITEM_TYPES: array[0..10] of string =
    (XOD_ELEMENT_ITEM_INTEGER, XOD_ELEMENT_ITEM_REAL, XOD_ELEMENT_ITEM_STRING,
     XOD_ELEMENT_ITEM_BOOLEAN, XOD_ELEMENT_ITEM_TEXT, XOD_ELEMENT_ITEM_ENUMERATION,
     XOD_ELEMENT_ITEM_RANGE, XOD_ELEMENT_ITEM_FONTNAME, XOD_ELEMENT_ITEM_FILENAME, XOD_ELEMENT_ITEM_PATHNAME,
     XOD_ELEMENT_ITEM_COLOR);

  VALUE_TRUE = 'True';
  VALUE_FALSE = 'False';

  SCHEMA_IMAGE = 0;
  SCHEMA_OPEN_IMAGE = 1;
  CATEGORY_OPEN_IMAGE = 2;

  DESC_HKEY_CLASSES_ROOT = 'HKEY_CLASSES_ROOT';
  DESC_HKEY_CURRENT_USER = 'HKEY_CURRENT_USER';
  DESC_HKEY_LOCAL_MACHINE = 'HKEY_LOCAL_MACHINE';
  DESC_HKEY_USERS = 'HKEY_USERS';
  DESC_HKEY_CURRENT_CONFIG = 'HKEY_CURRENT_CONFIG';
  HKEY_UNKNOWN = DWORD($00000000);
  REG_VALUE_FILENAME = 'FileName';
  REG_DELIMITER = '\';

type
  // EOptionManagerException
  EOptionManagerException = class(Exception);

  // PDirectoryDialog
  PDirectoryDialog = class(TComponent)
  private
    FTitle: string;
    FDirName: string;
  public
    function Execute: Boolean;
    property Title: string read FTitle write FTitle;
    property DirName: string read FDirName;
  end;

  // POptionManagerMessages
  POptionManagerMessages = class
  public
    class procedure InvalidXMLFormat(FileName: string);
    class procedure InvalidValue(OptionItemName: string);
  end;

function TagToOptionType(Value: string): OptionType;
function IsOptionItemTypeName(Value: string): Boolean;
function IsValidType(Value: Variant; Type_: OptionType): Boolean;
function GetRootKey(Path: string): HKey;
function GetRegistryKey(Path: string): string;
function GetDllPath: string;

implementation

uses
  NLS_OPTMGR,
  Forms, Dialogs, Variants, ShellAPI, ShlObj;

////////////////////////////////////////////////////////////////////////////////
// PDirectoryDialog

function PDirectoryDialog.Execute: Boolean;
var
  lpItemID: PItemIDList;
  BrowseInfo: TBrowseInfo;
  DisplayName: array[0..MAX_PATH] of Char;
  TempPath: array[0..MAX_PATH] of Char;
begin
  FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
  BrowseInfo.hwndOwner := Application.Handle;
  BrowseInfo.pszDisplayName := @DisplayName;
  BrowseInfo.lpszTitle := PChar(FTitle);
  BrowseInfo.ulFlags := BIF_RETURNONLYFSDIRS;
  lpItemID := SHBrowseForFolder(BrowseInfo);
  Result := not (lpItemId = nil);
  if lpItemId <> nil then begin
    SHGetPathFromIDList(lpItemID, TempPath);
    FDirName := TempPath;
    GlobalFreePtr(lpItemID);
  end;
end;

// PDirectoryDialog
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// POptionManagerMessages

class procedure POptionManagerMessages.InvalidXMLFormat(FileName: string);
begin
  ShowMessage('Invalid XML File Format : ' + FileName);
end;

class procedure POptionManagerMessages.InvalidValue(OptionItemName: string);
begin
  ShowMessage('Invalid Value : ' + OptionItemName);
end;

// POptionManagerMessages
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Utilities

function TagToOptionType(Value: string): OptionType;
begin
  if Value = XOD_ELEMENT_ITEM_INTEGER then
    Result := otInteger
  else if Value = XOD_ELEMENT_ITEM_REAL then
    Result := otReal
  else if Value = XOD_ELEMENT_ITEM_STRING then
    Result := otString
  else if Value = XOD_ELEMENT_ITEM_BOOLEAN then
    Result := otBoolean
  else if Value = XOD_ELEMENT_ITEM_TEXT then
    Result := otText
  else if Value = XOD_ELEMENT_ITEM_ENUMERATION then
    Result := otEnumeration
  else if Value = XOD_ELEMENT_ITEM_FONTNAME then
    Result := otFontName
  else if Value = XOD_ELEMENT_ITEM_FILENAME then
    Result := otFileName
  else if Value = XOD_ELEMENT_ITEM_PATHNAME then
    Result := otPathName
  else if Value = XOD_ELEMENT_ITEM_COLOR then
    Result := otColor
  else if Value = XOD_ELEMENT_ITEM_RANGE then
    Result := otRange
  else
    Result := otString;
end;

function IsOptionItemTypeName(Value: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Length(OPTIONITEM_TYPES) - 1 do
    if Value = OPTIONITEM_TYPES[I] then begin
      Result := True;
      Exit;
    end;
end;

function IsValidType(Value: Variant; Type_: OptionType): Boolean;
var
  Vt: TVarType;
begin
  Vt := VarType(Value);
  if (Vt = varNull) or (Vt = varEmpty) then begin
    Result := False;
    Exit;
  end;
  case Type_ of
    otInteger, otRange:
      Result := VarIsOrdinal(Value);
    otReal:
      Result := VarIsFloat(Value);
    otString, otText, otFileName, otPathName, otColor:
      Result := VarIsStr(Value);
    otBoolean:
      Result := VarIsType(Value, varBoolean);
    otEnumeration:
      Result := VarIsOrdinal(Value);
    else
      Result := False;
  end;
end;

function GetRootKey(Path: string): HKey;
var
  S: string;
  P: Integer;
begin
  Result := HKEY_UNKNOWN;
  P := Pos(REG_DELIMITER, Path);
  if P > 0 then begin
    S := Copy(Path, 1, P - 1);
    if S = DESC_HKEY_CLASSES_ROOT then
      Result := HKEY_CLASSES_ROOT
    else if S = DESC_HKEY_CURRENT_USER then
      Result := HKEY_CURRENT_USER
    else if S = DESC_HKEY_LOCAL_MACHINE then
      Result := HKEY_LOCAL_MACHINE
    else if S = DESC_HKEY_USERS then
      Result := HKEY_USERS
    else if S = DESC_HKEY_CURRENT_CONFIG then
      Result := HKEY_CURRENT_CONFIG
  end;
end;

function GetRegistryKey(Path: string): string;
var
  P: Integer;
  S, R: string;
begin
  Result := Path;
  if GetRootKey(Path) = HKEY_UNKNOWN then
    Exit;
  S := Path;
  P := Pos(REG_DELIMITER, S);
  S := Copy(S, P + 1, Length(S) - P);
  R := '';
  repeat
    P := Pos(REG_DELIMITER, S);
    if P = 0 then
      R := R + REG_DELIMITER + S
    else begin
      R := R + REG_DELIMITER + Copy(S, 1, P - 1);
      S := Copy(S, P + 1, Length(S) - P);
    end;
  until P = 0;
  Result := R;
end;

function GetDllPath: string;
var
  ModuleName : array[0..1023] of char;
  Path: string;
begin
  FillChar(ModuleName, Sizeof(ModuleName), #10);
  GetModuleFileName(HInstance, ModuleName, Sizeof(ModuleName));
  Path := ExtractFileDir(ModuleName);
  Result := Path;
end;

// Utilities
////////////////////////////////////////////////////////////////////////////////

end.
