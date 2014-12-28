unit OptionMgr;

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

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  OptionNodes, OptMgr_TLB,
  Classes, SysUtils, ComObj, ActiveX, Generics.Collections;

const
  EXT_DIR = 'modules';
  OPTION_EXTENSION = 'opt';

type
  // POptionManager
  POptionManager = class(TAutoObject, IOptionManager)

  private type
    TOptionSchemataList = TList<POptionSchema>;

  private
    Initialized: Boolean;
    FOptionSchemata: TOptionSchemataList;
    FSchemataRegPath: string;
    FDefaultSchemaID: string;
    FOptionsRegPath: string;
    procedure SetSchemataRegPath(Value: string);
    procedure SetDefaultSchemaID(Value: string);
    procedure SetOptionsRegPath(Value: string);
    function GetOptionSchema(Index: Integer): POptionSchema;
    function ReadSchemaFile(SchemaFileName: string): POptionSchema;
    function GetOptionItemChanged: Boolean;
  protected
    function Get_SchemataRegPath: WideString; safecall;
    procedure Set_SchemataRegPath(const Value: WideString); safecall;
    function Get_DefaultSchemaID: WideString; safecall;
    procedure Set_DefaultSchemaID(const Value: WideString); safecall;
    function Get_OptionsRegPath: WideString; safecall;
    procedure Set_OptionsRegPath(const Value: WideString); safecall;
    function ShowDialog: WordBool; safecall;
    function GetOptionSchemaCount: Integer; safecall;
    function GetOptionSchemaAt(Index: Integer): IOptionSchema; safecall;
    function FindOptionItem(const SchemaID: WideString; const Key: WideString): IOptionItem; safecall;
    procedure InitOptionManager(const SchemataRegPath: WideString; const OptionsRegPath: WideString;
                        const DefaultSchemaID: WideString); safecall;
    function GetOptionValue(const SchemaID: WideString; const Key: WideString): OleVariant; safecall;
    procedure LoadOptionValues; safecall;
    procedure SaveOptionValues; safecall;
  public
    procedure Initialize; override;
    destructor Destroy; override;
    procedure ClearOptionSchemata;
    procedure AddOptionSchema(Value: POptionSchema);
    procedure RemoveOptionSchema(Value: POptionSchema);
    procedure InsertOptionSchema(Index: Integer; Value: POptionSchema);
    procedure DeleteOptionSchema(Index: Integer);
    function FindOptionSchema(SchemaID: string): POptionSchema;
    procedure ReadSchemata;
    procedure LoadOptions;
    procedure SaveOptions;
    procedure SetToDefaultValues;
    procedure RestoreValues;
    property SchemataRegPath: string read FSchemataRegPath write SetSchemataRegPath;
    property DefaultSchemaID: string read FDefaultSchemaID write SetDefaultSchemaID;
    property OptionsRegPath: string read FOptionsRegPath write SetOptionsRegPath;
    property OptionSchemaCount: Integer read GetOptionSchemaCount;
    property OptionSchemata[Index: Integer]: POptionSchema read GetOptionSchema;
    property OptionItemChanged: Boolean read GetOptionItemChanged;
  end;

implementation

uses
  OptionDialogFrm, OptionMgrAux, NLS_OPTMGR,
  System.Win.ComServ, Dialogs, Forms, Registry, Variants, Xmldom, XMLIntf, Msxmldom, XMLDoc,
  OptionDialogFrmWithJvclInspector;

////////////////////////////////////////////////////////////////////////////////
// POptionManager

procedure POptionManager.Initialize;
begin
  inherited Initialize;
  FOptionSchemata := TOptionSchemataList.Create;
  Initialized := False;
end;

destructor POptionManager.Destroy;
begin
  // No need to free object in list, because TAutoIntfObject count reference
  // and object is automatically freed when the reference count drops to zero.
  FOptionSchemata.Free;
  inherited Destroy;
end;

procedure POptionManager.SetSchemataRegPath(Value: string);
begin
  FSchemataRegPath := Value;
end;

procedure POptionManager.SetDefaultSchemaID(Value: string);
begin
  FDefaultSchemaID := Value;
end;

procedure POptionManager.SetOptionsRegPath(Value: string);
begin
  FOptionsRegPath := Value;
end;

function POptionManager.GetOptionSchema(Index: Integer): POptionSchema;
begin
  Result := POptionSchema(FOptionSchemata.Items[Index]);
end;

function POptionManager.ReadSchemaFile(SchemaFileName: string): POptionSchema;
var
  Doc: TXMLDocument;
  SchemaNode: IXMLNode;
  OS: POptionSchema;
begin
  Result := nil;
  if not FileExists(SchemaFileName) then
    Exit;
  Doc := TXMLDocument.Create(Application);
  try
    Doc.LoadFromFile(SchemaFileName);
    Doc.Active := True;
    SchemaNode := Doc.DocumentElement;
    if SchemaNode.NodeName = XOD_ELEMENT_SCHEMA then begin
      OS := POptionSchema.Create(ComServer.TypeLib, IOptionSchema);
      if OS.ReadFromXMLElement(SchemaNode) then
        Result := OS
      else begin
        OS.Free;
        Result := nil;
      end;
    end;
  except
    on EDOMParseError do begin
      POptionManagerMessages.InvalidXMLFormat(SchemaFileName);
      Result := nil;
    end;
  end;
  Doc.Free;
end;

function POptionManager.GetOptionItemChanged: Boolean;
var
  OS: POptionSchema;
  OC: POptionCategory;
  OL: POptionClassification;
  OI: POptionItem;
  //I, J, K, L: Integer;
begin
  Result := False;
  //for I := 0 to OptionSchemaCount - 1 do begin
  //  OS := OptionSchemata[I];
  for OS in FOptionSchemata do begin

    //for J := 0 to OS.OptionCategoryCount - 1 do begin
      //OC := OS.OptionCategories[J];
    for OC in OS do begin

      //for K := 0 to OC.OptionClassificationCount - 1 do begin
        //OL := OC.OptionClassifications[K];
      for OL in OC do begin

        //for L := 0 to OL.OptionItemCount - 1 do begin
          //OI := OL.OptionItems[L];
        for OI in OL do begin

          if OI.Changed then begin
            Result := True;
            Exit;
          end;
        end;
      end;
    end;
  end;
end;

function POptionManager.Get_SchemataRegPath: WideString;
begin
  Result := SchemataRegPath;
end;

procedure POptionManager.Set_SchemataRegPath(const Value: WideString);
begin
// ReadOnly
end;

function POptionManager.Get_DefaultSchemaID: WideString;
begin
  Result := DefaultSchemaID;
end;

procedure POptionManager.Set_DefaultSchemaID(const Value: WideString);
begin
// ReadOnly
end;

function POptionManager.Get_OptionsRegPath: WideString;
begin
  Result := OptionsRegPath;
end;

procedure POptionManager.Set_OptionsRegPath(const Value: WideString);
begin
// ReadOnly
end;

function POptionManager.ShowDialog: WordBool;
var
  Dialog: POptionDialog;
begin
  Result := False;
  if Initialized then begin
//    LoadOptions;
    //Dialog := POptionDialogWithTdxInspector.Create(Self);
    Dialog := POptionDialogWithJvclInspector.Create(Self);
    Result := Dialog.Execute;
    Dialog.Free;
  end;
end;

function POptionManager.GetOptionSchemaCount: Integer;
begin
  Result := FOptionSchemata.Count;
end;

function POptionManager.GetOptionSchemaAt(Index: Integer): IOptionSchema;
begin
  Result := OptionSchemata[Index];
end;

function POptionManager.FindOptionItem(const SchemaID: WideString; const Key: WideString): IOptionItem;
var
  OS: POptionSchema;
begin
  Result := nil;
  if not Initialized then
    raise EOptionManagerException.Create(ERR_NOT_INITIALIZED);
  OS := FindOptionSchema(SchemaID);
  if OS <> nil then
    Result := OS.FindOptionItem(Key);
end;

procedure POptionManager.InitOptionManager(const SchemataRegPath: WideString; const OptionsRegPath: WideString; const DefaultSchemaID: WideString);
begin
  Initialized := True;
  if (SchemataRegPath = '') or (OptionsRegPath = '') or (DefaultSchemaID = '') then
    Initialized := False;
  FSchemataRegPath := SchemataRegPath;
  FOptionsRegPath := OptionsRegPath;
  FDefaultSchemaID := DefaultSchemaID;
  ReadSchemata;
end;

function POptionManager.GetOptionValue(const SchemaID: WideString; const Key: WideString): OleVariant;
var
  OI: IOptionItem;
begin
  OI := FindOptionItem(SchemaID, Key);
  if OI = nil then
    Result := Null
  else
    Result := OI.Value;
end;

procedure POptionManager.LoadOptionValues;
begin
  LoadOptions;
end;

procedure POptionManager.SaveOptionValues;
begin
  SaveOptions;
end;

procedure POptionManager.ClearOptionSchemata;
var
  I: Integer;
begin
  for I := 0 to OptionSchemaCount - 1 do
    DeleteOptionSchema(I);
end;

procedure POptionManager.AddOptionSchema(Value: POptionSchema);
begin
  if Value <> nil then begin
    FOptionSchemata.Add(Value);
    (Value as IOptionSchema)._AddRef;
  end;
end;

procedure POptionManager.RemoveOptionSchema(Value: POptionSchema);
begin
  if Value <> nil then begin
    FOptionSchemata.Remove(Value);
    (Value as IOptionSchema)._Release;
  end;
end;

procedure POptionManager.InsertOptionSchema(Index: Integer; Value: POptionSchema);
begin
  if Value <> nil then begin
    FOptionSchemata.Insert(Index, Value);
    (Value as IOptionSchema)._AddRef;
  end;
end;

procedure POptionManager.DeleteOptionSchema(Index: Integer);
var
  OS: POptionSchema;
begin
  OS := GetOptionSchema(Index);
  RemoveOptionSchema(OS);
end;

function POptionManager.FindOptionSchema(SchemaID: string): POptionSchema;
var
  OS: POptionSchema;
  I: Integer;
begin
  Result := nil;
  for I := 0 to OptionSchemaCount - 1 do begin
    OS := OptionSchemata[I];
    if OS.ID = SchemaID then begin
      Result := OS;
      Exit;
    end;
  end;
end;

procedure POptionManager.ReadSchemata;
(*
var
  Reg: TRegistry;
  RootPath: string;
  KeyNames: TStringList;  // is optionschema
  OSFileName: string;
  OS: POptionSchema;
  I: Integer;
begin
  if not Initialized then
    Exit;
  Reg := TRegistry.Create;
  KeyNames := TStringList.Create;
  try
    Reg.RootKey := GetRootKey(FSchemataRegPath);
    if Reg.RootKey <> HKEY_UNKNOWN then begin
      RootPath := GetRegistryKey(FSchemataRegPath);
      if Reg.OpenKey(RootPath, False) then begin
        if Reg.HasSubKeys then
          Reg.GetKeyNames(KeyNames);
        Reg.CloseKey;
        for I := 0 to KeyNames.Count - 1 do begin
          if Reg.OpenKey(RootPath + REG_DELIMITER + KeyNames[I], False) then begin
            OSFileName := Reg.ReadString(REG_VALUE_FILENAME);
            if OSFileName <> '' then begin
              OS := ReadSchemaFile(OSFileName);
              if OS <> nil then
                AddOptionSchema(OS);
            end;
            Reg.CloseKey;
          end;
        end;
      end;
    end;
  finally
    KeyNames.Free;
    Reg.Free;
  end;
end;
*)
  procedure LoadFiles(Path: String);
  var
    SearchRec: TSearchRec;
    OptionName, OSFileName: string;
    OS: POptionSchema;
  begin
    // files
    if FindFirst(Path + '\*' + OPTION_EXTENSION, faArchive, SearchRec) = 0 then begin
      repeat
        OptionName := Copy(SearchRec.Name, 1, Length(SearchRec.Name)-Length('.'+OPTION_EXTENSION));
        OSFileName := Path + '\' + OptionName + '.' + OPTION_EXTENSION;

        OS := ReadSchemaFile(OSFileName);
        if OS <> nil then AddOptionSchema(OS);
      until FindNext(SearchRec) <> 0;
    end;

    // folders
    if FindFirst(Path + '\*', faDirectory, SearchRec) = 0 then begin
      repeat
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
          LoadFiles(Path + '\' + SearchRec.Name);
      until FindNext(SearchRec) <> 0;
    end;
  end;

begin
  LoadFiles(GetDllPath+'\'+EXT_DIR);
end;

procedure POptionManager.LoadOptions;
var
  Reg: TRegistry;
  RootPath: string;
  KeyNames: TStringList;  // is optionschema
  ValueNames: TStringList;  // is optionitem
  OS: POptionSchema;
  OI: POptionItem;
  I, J: Integer;
begin
  if not Initialized then
    Exit;
  Reg := TRegistry.Create;
  KeyNames := TStringList.Create;
  ValueNames := TStringList.Create;
  try
    Reg.RootKey := GetRootKey(FOptionsRegPath);
    if Reg.RootKey <> HKEY_UNKNOWN then begin
      RootPath := GetRegistryKey(FOptionsRegPath);
      if Reg.OpenKey(RootPath, True) then begin
        if Reg.HasSubKeys then
          Reg.GetKeyNames(KeyNames);
        Reg.CloseKey;
        for I := 0 to KeyNames.Count - 1 do begin
          OS := FindOptionSchema(KeyNames[I]);
          if OS <> nil then
            if Reg.OpenKey(RootPath + REG_DELIMITER + KeyNames[I], False) then begin
              Reg.GetValueNames(ValueNames);
              for J := 0 to ValueNames.Count - 1 do begin
                OI := OS.FindOptionItem(ValueNames[J]);
                if OI <> nil then begin
                  OI.SetInitalValue(Reg.ReadString(ValueNames[J]));
                end;
              end;
              Reg.CloseKey;
            end;
        end;
      end;
    end;
  finally
    KeyNames.Free;
    ValueNames.Free;
    Reg.Free;
  end;
end;

procedure POptionManager.SaveOptions;
var
  Reg: TRegistry;
  RootPath: string;
  SchemaPath: string;
  OS: POptionSchema;
  OC: POptionCategory;
  OL: POptionClassification;
  OI: POptionItem;
  I, J, K, L: Integer;
begin
  if not Initialized then
    Exit;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := GetRootKey(FOptionsRegPath);
    if Reg.RootKey <> HKEY_UNKNOWN then begin
      RootPath := GetRegistryKey(FOptionsRegPath);
      for I := 0 to OptionSchemaCount - 1 do begin
        OS := OptionSchemata[I];
        SchemaPath := RootPath + REG_DELIMITER + OS.ID;
        if Reg.OpenKey(SchemaPath, True) then begin
          for J := 0 to OS.OptionCategoryCount - 1 do begin
            OC := OS.OptionCategories[J];
            for K := 0 to OC.OptionClassificationCount - 1 do begin
              OL := OC.OptionClassifications[K];
             for L := 0 to OL.OptionItemCount - 1 do begin
                OI := OL.OptionItems[L];
                if not Reg.ValueExists(OI.Key) then
                  Reg.WriteString(OI.Key, OI.Value)
                else if OI.Changed then begin
                  Reg.WriteString(OI.Key, OI.Value);
                  OI.SetInitalValue(OI.Value);
                end;
              end;
            end;
          end;
          Reg.CloseKey;
        end;
      end;
    end;
  finally
    Reg.Free;
  end;
end;

procedure POptionManager.SetToDefaultValues;
var
  OS: POptionSchema;
  OC: POptionCategory;
  OL: POptionClassification;
  OI: POptionItem;
  I, J, K, L: Integer;
begin
  for I := 0 to OptionSchemaCount - 1 do begin
    OS := OptionSchemata[I];
    for J := 0 to OS.OptionCategoryCount - 1 do begin
      OC := OS.OptionCategories[J];
      for K := 0 to OC.OptionClassificationCount - 1 do begin
        OL := OC.OptionClassifications[K];
        for L := 0 to OL.OptionItemCount - 1 do begin
          OI := OL.OptionItems[L];
          OI.Value := OI.DefaultValue;
        end;
      end;
    end;
  end;
end;

procedure POptionManager.RestoreValues;
var
  OS: POptionSchema;
  OC: POptionCategory;
  OL: POptionClassification;
  OI: POptionItem;
  I, J, K, L: Integer;
begin
  for I := 0 to OptionSchemaCount - 1 do begin
    OS := OptionSchemata[I];
    for J := 0 to OS.OptionCategoryCount - 1 do begin
      OC := OS.OptionCategories[J];
      for K := 0 to OC.OptionClassificationCount - 1 do begin
        OL := OC.OptionClassifications[K];
        for L := 0 to OL.OptionItemCount - 1 do begin
          OI := OL.OptionItems[L];
          OI.RestoreValue;
        end;
      end;
    end;
  end;
end;

// POptionManager
////////////////////////////////////////////////////////////////////////////////

initialization
  TAutoObjectFactory.Create(ComServer, POptionManager, Class_OptionManager,
    ciSingleInstance, tmApartment);

end.
