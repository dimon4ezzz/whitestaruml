unit NLS;

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
  Classes, IniFiles, Graphics;

type
  { TNLSValues }

  TNLSValues = class
  private
    IniFile: TIniFile;
    Section: string;
  public
    constructor Create(AIniFile: TIniFile; ASection: string);
    function ReadInteger(AComponent: TComponent; Key: string; Default: Integer): Integer;
    function ReadBoolean(AComponent: TComponent; Key: string; Default: Boolean): Boolean;
    function ReadString(AComponent: TComponent; Key: string; Default: string): string;
    procedure ReadFont(AComponent: TComponent; AFont: TFont);
    procedure WriteInteger(AComponent: TComponent; Key: string; Value: Integer);
    procedure WriteBoolean(AComponent: TComponent; Key: string; Value: Boolean);
    procedure WriteString(AComponent: TComponent; Key: string; Value: string);
    procedure WriteFont(AComponent: TComponent; AFont: TFont);
  end;

  { TNLSProc }

  TNLSProc = procedure(NLSValues: TNLSValues; AComponent: TComponent);

  { TNLSComponentEntry }

  TNLSComponentEntry = class
  public
    ComponentClass: TComponentClass;
    Recursive: Boolean;
    Importer: TNLSProc;
    Exporter: TNLSProc;
    constructor Create;
  end;

  { TNLSManager }

  TNLSManager = class
  private
    FFileName: string;
    FIsExportMode: Boolean;
    FNLSComponents: TList;
    IniFile: TIniFile;
    function GetNLSComponent(Index: Integer): TNLSComponentEntry;
    function GetNLSComponentCount: Integer;
    function IsIn(AComponentClass: TComponentClass; ComponentClassArray: array of TComponentClass): Boolean;
    procedure ExportComponent(ANLSValues: TNLSValues; AComponent: TComponent; ExcludeComponents: array of TComponentClass);
    procedure ImportComponent(ANLSValues: TNLSValues; AComponent: TComponent; ExcludeComponents: array of TComponentClass);
    procedure ExportString(AIniFile: TIniFile; ASection, AKey, AValue: string);
    procedure ImportString(AIniFile: TIniFile; ASection, AKey: string; var AValue: string; ADefault: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetExportMode;
    procedure SetImportMode;
    procedure SetFile(AFileName: string);
    procedure RegisterNLSComponent(ANLSComponent: TComponentClass; Recursive: Boolean; Importer, Exporter: TNLSProc);
    procedure ReadComponentTranslation(Section: string; AComponent: TComponent);
    procedure TranslateComponent(AComponent: TComponent; ExcludeComponents: array of TComponentClass);
    procedure TranslateString(Section, Key: string; var S: string; DefaultValue: string);
    property FileName: string read FFileName;
    property IsExportMode: Boolean read FIsExportMode;
    property NLSComponents[Index: Integer]: TNLSComponentEntry read GetNLSComponent;
    property NLSComponentCount: Integer read GetNLSComponentCount;
  end;

var
  NLSManager: TNLSManager;

implementation

uses
  SysUtils, Controls, StdCtrls, ExtCtrls, Forms, Menus, Dialogs, Buttons, Mask,
  Grids, CheckLst, Valedit, ComCtrls, SaveDialogEx;

////////////////////////////////////////////////////////////////////////////////
// Utility Functions

function EncodeString(S: string): string;
begin
  S := StringReplace(S, '\', '\\', [rfReplaceAll]);
  S := StringReplace(S, #13, '\r', [rfReplaceAll]);
  S := StringReplace(S, #10, '\n', [rfReplaceAll]);
  Result := S;
end;

function DecodeString(S: string): string;
begin
  S := StringReplace(S, '\r', #13, [rfReplaceAll]);
  S := StringReplace(S, '\n', #10, [rfReplaceAll]);
  S := StringReplace(S, '\\', '\', [rfReplaceAll]);
  Result := S;
end;

// Utility Functions
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TNLSComponentEntry

constructor TNLSComponentEntry.Create;
begin
  inherited;
  ComponentClass := nil;
  Recursive := False;
  Importer := nil;
  Exporter := nil;
end;

// TNLSComponentEntry
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TNLSValues

constructor TNLSValues.Create(AIniFile: TIniFile; ASection: string);
begin
  IniFile := AIniFile;
  Section := ASection;
end;

function TNLSValues.ReadInteger(AComponent: TComponent; Key: string; Default: Integer): Integer;
begin
  Result := IniFile.ReadInteger(Section, AComponent.Name + '.' + Key, Default);
end;

function TNLSValues.ReadBoolean(AComponent: TComponent; Key: string; Default: Boolean): Boolean;
begin
  Result := IniFile.ReadBool(Section, AComponent.Name + '.' + Key, Default);
end;

function TNLSValues.ReadString(AComponent: TComponent; Key: string; Default: string): string;
begin
  Result := DecodeString(IniFile.ReadString(Section, AComponent.Name + '.' + Key, Default));
end;

procedure TNLSValues.ReadFont(AComponent: TComponent; AFont: TFont);
begin
  AFont.Name := IniFile.ReadString(Section, AComponent.Name + '.Font.Name', AFont.Name);
  AFont.Size := IniFile.ReadInteger(Section, AComponent.Name + '.Font.Size', AFont.Size);
  AFont.Charset := IniFile.ReadInteger(Section, AComponent.Name + '.Font.Charset', AFont.Charset);
end;

procedure TNLSValues.WriteInteger(AComponent: TComponent; Key: string; Value: Integer);
begin
  IniFile.WriteInteger(Section, AComponent.Name + '.' + Key, Value);
end;

procedure TNLSValues.WriteBoolean(AComponent: TComponent; Key: string; Value: Boolean);
begin
  IniFile.WriteBool(Section, AComponent.Name + '.' + Key, Value);
end;

procedure TNLSValues.WriteString(AComponent: TComponent; Key: string; Value: string);
begin
  IniFile.WriteString(Section, AComponent.Name + '.' + Key, EncodeString(Value));
end;

procedure TNLSValues.WriteFont(AComponent: TComponent; AFont: TFont);
begin
  IniFile.WriteString(Section, AComponent.Name + '.Font.Name', AFont.Name);
  IniFile.WriteInteger(Section, AComponent.Name + '.Font.Size', AFont.Size);
  IniFile.WriteInteger(Section, AComponent.Name + '.Font.Charset', AFont.Charset);
end;

// TNLSValues
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TNLSManager

constructor TNLSManager.Create;
begin
  inherited;
  FFileName := '';
  FIsExportMode := False;
  FNLSComponents := TList.Create;
  IniFile := nil;
end;

destructor TNLSManager.Destroy;
var
  I: Integer;
  C: TNLSComponentEntry;
begin
  for I := FNLSComponents.Count - 1 downto 0 do
  begin
    C := FNLSComponents.Items[I];
    C.Free;
  end;
  FNLSComponents.Free;
  if IniFile <> nil then
    IniFile.Free;
  inherited;
end;

procedure TNLSManager.SetExportMode;
begin
  FIsExportMode := True;
end;

procedure TNLSManager.SetImportMode;
begin
  FIsExportMode := False;
end;

procedure TNLSManager.SetFile(AFileName: string);
begin
  FFileName := AFileName;
  if IniFile <> nil then
    IniFile.Free;
  IniFile := TIniFile.Create(FFileName);
end;

function TNLSManager.GetNLSComponent(Index: Integer): TNLSComponentEntry;
begin
  Result := FNLSComponents.Items[Index];
end;

function TNLSManager.GetNLSComponentCount: Integer;
begin
  Result := FNLSComponents.Count;
end;

function TNLSManager.IsIn(AComponentClass: TComponentClass; ComponentClassArray: array of TComponentClass): Boolean;
var
  I: Integer;
begin
  for I := 0 to High(ComponentClassArray) do
    if AComponentClass = ComponentClassArray[I] then
    begin
      Result := True;
      Exit;
    end;
  Result := False;
end;

procedure TNLSManager.RegisterNLSComponent(ANLSComponent: TComponentClass; Recursive: Boolean; Importer, Exporter: TNLSProc);
var
  ANLSComponentEntry: TNLSComponentEntry;
begin
  ANLSComponentEntry := TNLSComponentEntry.Create;
  ANLSComponentEntry.ComponentClass := ANLSComponent;
  ANLSComponentEntry.Recursive := Recursive;
  ANLSComponentEntry.Importer := Importer;
  ANLSComponentEntry.Exporter := Exporter;
  FNLSComponents.Add(ANLSComponentEntry);
end;

procedure TNLSManager.ReadComponentTranslation(Section: string; AComponent: TComponent);
var
  I: Integer;
  NLSEntry: TNLSComponentEntry;
  NLSValues: TNLSValues;
begin
  NLSValues := TNLSValues.Create(IniFile, Section);
  try
    if IniFile <> nil then
    begin
      for I := 0 to  NLSComponentCount - 1 do
      begin
        NLSEntry := NLSComponents[I];
        if (AComponent is NLSEntry.ComponentClass) then
        begin
          if Assigned(NLSEntry.Importer) then
            NLSEntry.Importer(NLSValues, AComponent);
        end;
      end;
    end;
  finally
    NLSValues.Free;
  end;
end;

procedure TNLSManager.ExportComponent(ANLSValues: TNLSValues; AComponent: TComponent; ExcludeComponents: array of TComponentClass);
var
  I, J: Integer;
  SubCom: TComponent;
  NLSEntry: TNLSComponentEntry;
begin
  if not IsIn(TComponentClass(AComponent.ClassType), ExcludeComponents) then
  begin
    for I := 0 to NLSComponentCount - 1 do
    begin
      NLSEntry := NLSComponents[I];
      if (AComponent is NLSEntry.ComponentClass) then
      begin
        if Assigned(NLSEntry.Exporter) then
          NLSEntry.Exporter(ANLSValues, AComponent);
        if NLSEntry.Recursive then
        begin
          for J := 0 to AComponent.ComponentCount - 1 do
          begin
            SubCom := AComponent.Components[J];
            if (SubCom.Name <> '') then
              ExportComponent(ANLSValues, SubCom, ExcludeComponents);
          end;
        end;
      end;
    end;
  end;
end;

procedure TNLSManager.ImportComponent(ANLSValues: TNLSValues; AComponent: TComponent; ExcludeComponents: array of TComponentClass);
var
  I, J: Integer;
  SubCom: TComponent;
  NLSEntry: TNLSComponentEntry;
begin
  if not IsIn(TComponentClass(AComponent.ClassType), ExcludeComponents) then
  begin
    for I := 0 to  NLSComponentCount - 1 do
    begin
      NLSEntry := NLSComponents[I];
      if (AComponent is NLSEntry.ComponentClass) then
      begin
        if Assigned(NLSEntry.Importer) then
          NLSEntry.Importer(ANLSValues, AComponent);
        if NLSEntry.Recursive then
        begin
          for J := 0 to AComponent.ComponentCount - 1 do
          begin
            SubCom := AComponent.Components[J];
            if (SubCom.Name <> '') then
              ImportComponent(ANLSValues, SubCom, ExcludeComponents);
          end;
        end;
      end;
    end;
  end;
end;

procedure TNLSManager.ExportString(AIniFile: TIniFile; ASection, AKey, AValue: string);
begin
  AIniFile.WriteString(ASection, AKey, EncodeString(AValue));
end;

procedure TNLSManager.ImportString(AIniFile: TIniFile; ASection, AKey: string; var AValue: string; ADefault: string);
begin
  AValue := DecodeString(AIniFile.ReadString(ASection, AKey, ADefault));
end;

procedure TNLSManager.TranslateComponent(AComponent: TComponent; ExcludeComponents: array of TComponentClass);
var
  NLSValues: TNLSValues;
begin
  NLSValues := TNLSValues.Create(IniFile, AComponent.Name);
  try
    try
      if IniFile <> nil then
      begin
        if FIsExportMode then
          ExportComponent(NLSValues, AComponent, ExcludeComponents)
        else
          ImportComponent(NLSValues, AComponent, ExcludeComponents);
      end;
    except
      // nothing to do.
    end;
  finally
    NLSValues.Free;
  end;
end;

procedure TNLSManager.TranslateString(Section, Key: string; var S: string; DefaultValue: string);
begin
  try
    if IniFile <> nil then
    begin
      if FIsExportMode then
      begin
        S := DefaultValue;
        ExportString(IniFile, Section, Key, S);
      end
      else begin
        ImportString(IniFile, Section, Key, S, DefaultValue);
      end;
    end;
  except
    // nothing to do.
  end;
end;

// TNLSManager
////////////////////////////////////////////////////////////////////////////////

// -----------------------------------------------------------------------------
//                         NLS for Standard Components
// -----------------------------------------------------------------------------

// TForm .......................................................................

procedure NLS_Form_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TForm do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_Form_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TForm do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TFrame ......................................................................

procedure NLS_Frame_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TFrame do
  begin
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_Frame_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TFrame do
  begin
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TMenu (TMainMenu, TPopupMenu) ...............................................

procedure NLS_Menu_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TMenu do
  begin
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_Menu_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TMenu do
  begin
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TMenuItem ...................................................................

procedure NLS_MenuItem_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TMenuItem do
  begin
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
  end;
end;

procedure NLS_MenuItem_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TMenuItem do
  begin
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
  end;
end;

// TLabel ......................................................................

procedure NLS_Label_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TLabel do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_Label_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TLabel do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TEdit .......................................................................

procedure NLS_Edit_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TEdit do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    Text := NLSValues.ReadString(AComponent, 'Text', Text);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
    ImeMode := TImeMode(NLSValues.ReadInteger(AComponent, 'ImeMode', Ord(ImeMode)));
    ImeName := NLSValues.ReadString(AComponent, 'ImeName', ImeName);
  end;
end;

procedure NLS_Edit_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TEdit do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteString(AComponent, 'Text', Text);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
    NLSValues.WriteInteger(AComponent, 'ImeMode', Ord(ImeMode));
    NLSValues.WriteString(AComponent, 'ImeName', ImeName);
  end;
end;

// TMemo .......................................................................

procedure NLS_Memo_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TMemo do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    Lines.Text := NLSValues.ReadString(AComponent, 'Lines.Text', Lines.Text);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
    ImeMode := TImeMode(NLSValues.ReadInteger(AComponent, 'ImeMode', Ord(ImeMode)));
    ImeName := NLSValues.ReadString(AComponent, 'ImeName', ImeName);
  end;
end;

procedure NLS_Memo_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TMemo do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteString(AComponent, 'Lines.Text', Lines.Text);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
    NLSValues.WriteInteger(AComponent, 'ImeMode', Ord(ImeMode));
    NLSValues.WriteString(AComponent, 'ImeName', ImeName);
  end;
end;

// TButton .....................................................................

procedure NLS_Button_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TButton do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_Button_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TButton do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TCheckBox ...................................................................

procedure NLS_CheckBox_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TCheckBox do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_CheckBox_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TCheckBox do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TRadioButton ................................................................

procedure NLS_RadioButton_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TRadioButton do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_RadioButton_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TRadioButton do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TListBox ....................................................................

procedure NLS_ListBox_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TListBox do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    Items.Text := NLSValues.ReadString(AComponent, 'Items.Text', Items.Text);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
    ImeMode := TImeMode(NLSValues.ReadInteger(AComponent, 'ImeMode', Ord(ImeMode)));
    ImeName := NLSValues.ReadString(AComponent, 'ImeName', ImeName);
  end;
end;

procedure NLS_ListBox_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TListBox do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteString(AComponent, 'Items.Text', Items.Text);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
    NLSValues.WriteInteger(AComponent, 'ImeMode', Ord(ImeMode));
    NLSValues.WriteString(AComponent, 'ImeName', ImeName);
  end;
end;

// TComboBox ...................................................................

procedure NLS_ComboBox_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TComboBox do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    Text := NLSValues.ReadString(AComponent, 'Text', Text);
    Items.Text := NLSValues.ReadString(AComponent, 'Items.Text', Items.Text);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
    ImeMode := TImeMode(NLSValues.ReadInteger(AComponent, 'ImeMode', Ord(ImeMode)));
    ImeName := NLSValues.ReadString(AComponent, 'ImeName', ImeName);
  end;
end;

procedure NLS_ComboBox_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TComboBox do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteString(AComponent, 'Text', Text);
    NLSValues.WriteString(AComponent, 'Items.Text', Items.Text);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
    NLSValues.WriteInteger(AComponent, 'ImeMode', Ord(ImeMode));
    NLSValues.WriteString(AComponent, 'ImeName', ImeName);
  end;
end;

// TGroupBox ...................................................................

procedure NLS_GroupBox_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TGroupBox do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_GroupBox_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TGroupBox do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TRadioGroup .................................................................

procedure NLS_RadioGroup_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TRadioGroup do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    Items.Text := NLSValues.ReadString(AComponent, 'Items.Text', Items.Text);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_RadioGroup_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TRadioGroup do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteString(AComponent, 'Items.Text', Items.Text);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TPanel ......................................................................

procedure NLS_Panel_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TPanel do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_Panel_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TPanel do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TOpenDialog ...................................................................

procedure NLS_OpenDialog_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TOpenDialog do
  begin
    Title := NLSValues.ReadString(AComponent, 'Title', Title);
    Filter := NLSValues.ReadString(AComponent, 'Filter', Filter);
  end;
end;

procedure NLS_OpenDialog_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TOpenDialog do
  begin
    NLSValues.WriteString(AComponent, 'Title', Title);
    NLSValues.WriteString(AComponent, 'Filter', Filter);
  end;
end;

// TSaveDialog ...................................................................

procedure NLS_SaveDialog_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TSaveDialog do
  begin
    Title := NLSValues.ReadString(AComponent, 'Title', Title);
    Filter := NLSValues.ReadString(AComponent, 'Filter', Filter);
  end;
end;

procedure NLS_SaveDialog_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TSaveDialog do
  begin
    NLSValues.WriteString(AComponent, 'Title', Title);
    NLSValues.WriteString(AComponent, 'Filter', Filter);
  end;
end;

// -----------------------------------------------------------------------------
//                         NLS for Additional Components
// -----------------------------------------------------------------------------

// TBitBtn .....................................................................

procedure NLS_BitBtn_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TBitBtn do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_BitBtn_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TBitBtn do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TSpeedButton ................................................................

procedure NLS_SpeedButton_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TSpeedButton do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_SpeedButton_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TSpeedButton do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TMaskEdit .......................................................................

procedure NLS_MaskEdit_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TMaskEdit do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    Text := NLSValues.ReadString(AComponent, 'Text', Text);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
    ImeMode := TImeMode(NLSValues.ReadInteger(AComponent, 'ImeMode', Ord(ImeMode)));
    ImeName := NLSValues.ReadString(AComponent, 'ImeName', ImeName);
  end;
end;

procedure NLS_MaskEdit_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TMaskEdit do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteString(AComponent, 'Text', Text);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
    NLSValues.WriteInteger(AComponent, 'ImeMode', Ord(ImeMode));
    NLSValues.WriteString(AComponent, 'ImeName', ImeName);
  end;
end;

// TStringGrid ....................................................................

procedure NLS_StringGrid_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TStringGrid do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_StringGrid_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TStringGrid do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TCheckListBox ....................................................................

procedure NLS_CheckListBox_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TCheckListBox do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    Items.Text := NLSValues.ReadString(AComponent, 'Items.Text', Items.Text);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
    ImeMode := TImeMode(NLSValues.ReadInteger(AComponent, 'ImeMode', Ord(ImeMode)));
    ImeName := NLSValues.ReadString(AComponent, 'ImeName', ImeName);
  end;
end;

procedure NLS_CheckListBox_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TCheckListBox do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteString(AComponent, 'Items.Text', Items.Text);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
    NLSValues.WriteInteger(AComponent, 'ImeMode', Ord(ImeMode));
    NLSValues.WriteString(AComponent, 'ImeName', ImeName);
  end;
end;

// TStaticText ......................................................................

procedure NLS_StaticText_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TStaticText do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_StaticText_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TStaticText do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TValueListEditor ......................................................................

procedure NLS_ValueListEditor_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TValueListEditor do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_ValueListEditor_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TValueListEditor do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TLabeledEdit .......................................................................

procedure NLS_LabeledEdit_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TLabeledEdit do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    EditLabel.Caption := NLSValues.ReadString(AComponent, 'EditLabel.Caption', EditLabel.Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    Text := NLSValues.ReadString(AComponent, 'Text', Text);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
    ImeMode := TImeMode(NLSValues.ReadInteger(AComponent, 'ImeMode', Ord(ImeMode)));
    ImeName := NLSValues.ReadString(AComponent, 'ImeName', ImeName);
  end;
end;

procedure NLS_LabeledEdit_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TLabeledEdit do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'EditLabel.Caption', EditLabel.Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteString(AComponent, 'Text', Text);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
    NLSValues.WriteInteger(AComponent, 'ImeMode', Ord(ImeMode));
    NLSValues.WriteString(AComponent, 'ImeName', ImeName);
  end;
end;

// -----------------------------------------------------------------------------
//                           NLS for Win32 Components
// -----------------------------------------------------------------------------

// TTabControl .................................................................

procedure NLS_TabControl_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TTabControl do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    Tabs.Text := NLSValues.ReadString(AComponent, 'Tabs.Text', Tabs.Text);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_TabControl_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TTabControl do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteString(AComponent, 'Tabs.Text', Tabs.Text);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TPageControl ......................................................................

procedure NLS_PageControl_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TPageControl do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_PageControl_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TPageControl do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TTabSheet ......................................................................

procedure NLS_TabSheet_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TTabSheet do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
  end;
end;

procedure NLS_TabSheet_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TTabSheet do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
  end;
end;

// TProgressBar ................................................................

procedure NLS_ProgressBar_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TProgressBar do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
  end;
end;

procedure NLS_ProgressBar_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TProgressBar do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
  end;
end;

// TRichEdit ...................................................................

procedure NLS_RichEdit_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TRichEdit do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    Lines.Text := NLSValues.ReadString(AComponent, 'Lines.Text', Lines.Text);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
    ImeMode := TImeMode(NLSValues.ReadInteger(AComponent, 'ImeMode', Ord(ImeMode)));
    ImeName := NLSValues.ReadString(AComponent, 'ImeName', ImeName);
  end;
end;

procedure NLS_RichEdit_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TRichEdit do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteString(AComponent, 'Lines.Text', Lines.Text);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
    NLSValues.WriteInteger(AComponent, 'ImeMode', Ord(ImeMode));
    NLSValues.WriteString(AComponent, 'ImeName', ImeName);
  end;
end;

// TTreeView ....................................................................

procedure NLS_TreeView_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TTreeView do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
  end;
end;

procedure NLS_TreeView_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TTreeView do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
  end;
end;

// TListView ....................................................................

procedure NLS_ListView_Import(NLSValues: TNLSValues; AComponent: TComponent);
var
  I: Integer;
begin
  with AComponent as TListView do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
    for I := 0 to NLSValues.ReadInteger(AComponent, 'Columns.Count', Columns.Count) - 1 do
      Column[I].Caption := NLSValues.ReadString(AComponent, 'Column['+IntToStr(I)+'].Caption', Column[I].Caption);
  end;
end;

procedure NLS_ListView_Export(NLSValues: TNLSValues; AComponent: TComponent);
var
  I: Integer;
begin
  with AComponent as TListView do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
    NLSValues.WriteInteger(AComponent, 'Columns.Count', Columns.Count);
    for I := 0 to Columns.Count - 1 do
      NLSValues.WriteString(AComponent, 'Column['+IntToStr(I)+'].Caption', Column[I].Caption);
  end;
end;

// THeaderControl ......................................................................

procedure NLS_HeaderControl_Import(NLSValues: TNLSValues; AComponent: TComponent);
var
  I: Integer;
begin
  with AComponent as THeaderControl do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
    for I := 0 to NLSValues.ReadInteger(AComponent, 'Sections.Count', Sections.Count) - 1 do
      NLSValues.ReadString(AComponent, 'Sections.Items['+IntToStr(I)+'].Text', Sections.Items[I].Text);
  end;
end;

procedure NLS_HeaderControl_Export(NLSValues: TNLSValues; AComponent: TComponent);
var
  I: Integer;
begin
  with AComponent as THeaderControl do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
    NLSValues.WriteInteger(AComponent, 'Sections.Count', Sections.Count);
    for I := 0 to Sections.Count - 1 do
      NLSValues.WriteString(AComponent, 'Sections.Items['+IntToStr(I)+'].Text', Sections.Items[I].Text);
  end;
end;

// TStatusBar ......................................................................

procedure NLS_StatusBar_Import(NLSValues: TNLSValues; AComponent: TComponent);
var
  I: Integer;
begin
  with AComponent as TStatusBar do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
    ParentBiDiMode := NLSValues.ReadBoolean(AComponent, 'ParentBidiMode', ParentBiDiMode);
    if not ParentBiDiMode then
      BiDiMode := TBiDiMode(NLSValues.ReadInteger(AComponent, 'BiDiMode', Ord(BiDiMode)));
    for I := 0 to NLSValues.ReadInteger(AComponent, 'Sections.Count', Panels.Count) - 1 do
      NLSValues.ReadString(AComponent, 'Sections.Items['+IntToStr(I)+'].Text', Panels.Items[I].Text);
  end;
end;

procedure NLS_StatusBar_Export(NLSValues: TNLSValues; AComponent: TComponent);
var
  I: Integer;
begin
  with AComponent as TStatusBar do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
    NLSValues.WriteBoolean(AComponent, 'ParentBiDiMode', ParentBiDiMode);
    NLSValues.WriteInteger(AComponent, 'BiDiMode', Ord(BiDiMode));
    for I := 0 to Panels.Count - 1 do
      NLSValues.WriteString(AComponent, 'Sections.Items['+IntToStr(I)+'].Text', Panels.Items[I].Text);
  end;
end;

// TToolBar ......................................................................

procedure NLS_ToolBar_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TToolBar do
  begin
    Left := NLSValues.ReadInteger(AComponent, 'Left', Left);
    Width := NLSValues.ReadInteger(AComponent, 'Width', Width);
    Top := NLSValues.ReadInteger(AComponent, 'Top', Top);
    Height := NLSValues.ReadInteger(AComponent, 'Height', Height);
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
    ParentFont := NLSValues.ReadBoolean(AComponent, 'ParentFont', ParentFont);
    if not ParentFont then
      NLSValues.ReadFont(AComponent, Font);
  end;
end;

procedure NLS_ToolBar_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TToolBar do
  begin
    NLSValues.WriteInteger(AComponent, 'Left', Left);
    NLSValues.WriteInteger(AComponent, 'Width', Width);
    NLSValues.WriteInteger(AComponent, 'Top', Top);
    NLSValues.WriteInteger(AComponent, 'Height', Height);
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
    NLSValues.WriteBoolean(AComponent, 'ParentFont', ParentFont);
    NLSValues.WriteFont(AComponent, Font);
  end;
end;

// TToolButton ................................................................

procedure NLS_ToolButton_Import(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TToolButton do
  begin
    Caption := NLSValues.ReadString(AComponent, 'Caption', Caption);
    Hint := NLSValues.ReadString(AComponent, 'Hint', Hint);
  end;
end;

procedure NLS_ToolButton_Export(NLSValues: TNLSValues; AComponent: TComponent);
begin
  with AComponent as TToolButton do
  begin
    NLSValues.WriteString(AComponent, 'Caption', Caption);
    NLSValues.WriteString(AComponent, 'Hint', Hint);
  end;
end;

initialization
  NLSManager := TNLSManager.Create;
  NLSManager.RegisterNLSComponent(TForm, True, NLS_Form_Import, NLS_Form_Export);
  NLSManager.RegisterNLSComponent(TFrame, True, NLS_Frame_Import, NLS_Frame_Export);
  NLSManager.RegisterNLSComponent(TMenu, True, NLS_Menu_Import, NLS_Menu_Export);
  NLSManager.RegisterNLSComponent(TMenuItem, False, NLS_MenuItem_Import, NLS_MenuItem_Export);
  NLSManager.RegisterNLSComponent(TLabel, False, NLS_Label_Import, NLS_Label_Export);
  NLSManager.RegisterNLSComponent(TEdit, False, NLS_Edit_Import, NLS_Edit_Export);
  NLSManager.RegisterNLSComponent(TMemo, False, NLS_Memo_Import, NLS_Memo_Export);
  NLSManager.RegisterNLSComponent(TButton, False, NLS_Button_Import, NLS_Button_Export);
  NLSManager.RegisterNLSComponent(TCheckBox, False, NLS_CheckBox_Import, NLS_CheckBox_Export);
  NLSManager.RegisterNLSComponent(TRadioButton, False, NLS_RadioButton_Import, NLS_RadioButton_Export);
  NLSManager.RegisterNLSComponent(TListBox, False, NLS_ListBox_Import, NLS_ListBox_Export);
  NLSManager.RegisterNLSComponent(TComboBox, False, NLS_ComboBox_Import, NLS_ComboBox_Export);
  NLSManager.RegisterNLSComponent(TGroupBox, True, NLS_GroupBox_Import, NLS_GroupBox_Export);
  NLSManager.RegisterNLSComponent(TRadioGroup, True, NLS_RadioGroup_Import, NLS_RadioGroup_Export);
  NLSManager.RegisterNLSComponent(TPanel, True, NLS_Panel_Import, NLS_Panel_Export);
  NLSManager.RegisterNLSComponent(TOpenDialog, True, NLS_OpenDialog_Import, NLS_OpenDialog_Export);
  NLSManager.RegisterNLSComponent(TSaveDialog, True, NLS_SaveDialog_Import, NLS_SaveDialog_Export);
  NLSManager.RegisterNLSComponent(TSaveDialogEx, True, NLS_SaveDialog_Import, NLS_SaveDialog_Export);
  NLSManager.RegisterNLSComponent(TBitBtn, False, NLS_BitBtn_Import, NLS_BitBtn_Export);
  NLSManager.RegisterNLSComponent(TSpeedButton, False, NLS_SpeedButton_Import, NLS_SpeedButton_Export);
  NLSManager.RegisterNLSComponent(TMaskEdit, False, NLS_MaskEdit_Import, NLS_MaskEdit_Export);
  NLSManager.RegisterNLSComponent(TStringGrid, False, NLS_StringGrid_Import, NLS_StringGrid_Export);
  NLSManager.RegisterNLSComponent(TCheckListBox, False, NLS_CheckListBox_Import, NLS_CheckListBox_Export);
  NLSManager.RegisterNLSComponent(TStaticText, False, NLS_StaticText_Import, NLS_StaticText_Export);
  NLSManager.RegisterNLSComponent(TValueListEditor, False, NLS_ValueListEditor_Import, NLS_ValueListEditor_Export);
  NLSManager.RegisterNLSComponent(TLabeledEdit, False, NLS_LabeledEdit_Import, NLS_LabeledEdit_Export);
  NLSManager.RegisterNLSComponent(TTabControl, True, NLS_TabControl_Import, NLS_TabControl_Export);
  NLSManager.RegisterNLSComponent(TPageControl, True, NLS_PageControl_Import, NLS_PageControl_Export);
  NLSManager.RegisterNLSComponent(TTabSheet, True, NLS_TabSheet_Import, NLS_TabSheet_Export);
  NLSManager.RegisterNLSComponent(TProgressBar, False, NLS_ProgressBar_Import, NLS_ProgressBar_Export);
  NLSManager.RegisterNLSComponent(TRichEdit, False, NLS_RichEdit_Import, NLS_RichEdit_Export);
  NLSManager.RegisterNLSComponent(TTreeView, False, NLS_TreeView_Import, NLS_TreeView_Export);
  NLSManager.RegisterNLSComponent(TListView, False, NLS_ListView_Import, NLS_ListView_Export);
  NLSManager.RegisterNLSComponent(THeaderControl, True, NLS_HeaderControl_Import, NLS_HeaderControl_Export);
  NLSManager.RegisterNLSComponent(TStatusBar, True, NLS_StatusBar_Import, NLS_StatusBar_Export);
  NLSManager.RegisterNLSComponent(TToolBar, True, NLS_ToolBar_Import, NLS_ToolBar_Export);
  NLSManager.RegisterNLSComponent(TToolButton, False, NLS_ToolButton_Import, NLS_ToolButton_Export);
finalization
  NLSManager.Free;
end.
