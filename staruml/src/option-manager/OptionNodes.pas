unit OptionNodes;

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
  OptMgr_TLB, OptionMgrAux,     
  Classes, ComObj, ActiveX, Xmldom, XMLIntf, Msxmldom, XMLDoc, Generics.Collections;

type
  // forward declaration
  POptionItem = class;

  // POptionItem
  POptionItem = class(TAutoIntfObject, IOptionItem)
  private
    FType: OptionType;
    FKey: string;
    FCaption: string;
    FValue: Variant;
    FDefaultValue: Variant;
    FDescription: string;
    FOldValue: Variant;
    FChanged: Boolean;
    procedure SetType(Value: OptionType);
    procedure SetKey(Value: string);
    procedure SetCaption(Value: string);
    function GetValue: OleVariant;
    procedure SetValue(Value: OleVariant);
    function GetDefaultValue: OleVariant;
    procedure SetDefaultValue(Value: OleVariant);
    procedure SetDescription(Value: string);
  protected
    function Get_Type_: OptionType; safecall;
    procedure Set_Type_(Value: OptionType); safecall;
    function Get_Key: WideString; safecall;
    procedure Set_Key(const Value: WideString); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Description: WideString; safecall;
    procedure Set_Description(const Value: WideString); safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(Value: OleVariant); safecall;
    function Get_DefaultValue: OleVariant; safecall;
    procedure Set_DefaultValue(Value: OleVariant); safecall;
    function Get_Changed: WordBool; safecall;
    procedure Set_Changed(Value: WordBool); safecall;
    function AsValidType(Value: OleVariant): OleVariant; virtual; abstract;
    function GetTypeDefaultValue: OleVariant; virtual; abstract;
  public
    function IsValidValue(Value: OleVariant): Boolean; virtual; abstract;
    function ReadFromXMLElement(Element: IXMLNode): Boolean; virtual;
    procedure SetInitalValue(Value: OleVariant);
    procedure RestoreValue;
    property Type_: OptionType read FType write SetType;
    property Key: string read FKey write SetKey;
    property Caption: string read FCaption write SetCaption;
    property Value: OleVariant read GetValue write SetValue;
    property DefaultValue: OleVariant read GetDefaultValue write SetDefaultValue;
    property Description: string read FDescription write SetDescription;
    property Changed: Boolean read FChanged;
  end;

  // POptionClassification
  POptionClassification = class(TAutoIntfObject, IOptionClassification)

  private type
    TOptionItemList = TList<POptionItem>;
    TOptionClassificationEnumerator = class
    private
      FIndex: Integer;
      FOptionClassification: POptionClassification;
    public
      constructor Create(AOptionClassification: POptionClassification);
      function GetCurrent: POptionItem; inline;
      function MoveNext: Boolean;
      property Current: POptionItem read GetCurrent;
    end;


  private
    FCaption: string;
    FDescription: string;
    FOptionItems: TOptionItemList;
    procedure SetCaption(Value: string);
    procedure SetDescription(Value: string);
    function GetOptionItem(Index: Integer): POptionItem;
  protected
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Description: WideString; safecall;
    procedure Set_Description(const Value: WideString); safecall;
    function GetOptionItemCount: Integer; safecall;
    function GetOptionItemAt(Index: Integer): IOptionItem; safecall;
  public
    constructor Create(const TypeLib: ITypeLib; const DispIntf: TGUID);
    destructor Destroy; override;
    procedure ClearOptionItems;
    procedure AddOptionItem(Value: POptionItem);
    procedure RemoveOptionItem(Value: POptionItem);
    procedure InsertOptionItem(Index: Integer; Value: POptionItem);
    procedure DeleteOptionItem(Index: Integer);
    procedure ReadFromXMLElement(Element: IXMLNode);
    function GetEnumerator: TOptionClassificationEnumerator;
    property Caption: string read FCaption write SetCaption;
    property Description: string read FDescription write SetDescription;
    property OptionItemCount: Integer read GetOptionItemCount;
    property OptionItems[Index: Integer]: POptionItem read GetOptionItem;
  end;




  // POptionCategory
  POptionCategory = class(TAutoIntfObject, IOptionCategory)

  private type
    TOptionClassificationList = TList<POptionClassification>;
    TOptionCategoryEnumerator = class
    private
      FIndex: Integer;
      FOptionCategory: POptionCategory;
    public
      constructor Create(AOptionCategory: POptionCategory);
      function GetCurrent: POptionClassification; inline;
      function MoveNext: Boolean;
      property Current: POptionClassification read GetCurrent;
    end;

  private
    FCaption: string;
    FDescription: string;
    FOptionClassifications: TOptionClassificationList;
    procedure SetCaption(Value: string);
    procedure SetDescription(Value: string);
    function GetOptionClassification(Index: Integer): POptionClassification;
  protected
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Description: WideString; safecall;
    procedure Set_Description(const Value: WideString); safecall;
    function GetOptionClassificationCount: Integer; safecall;
    function GetOptionClassificationAt(Index: Integer): IOptionClassification; safecall;
  public
    constructor Create(const TypeLib: ITypeLib; const DispIntf: TGUID);
    destructor Destroy; override;
    procedure ClearOptionClassifications;
    procedure AddOptionClassification(Value: POptionClassification);
    procedure RemoveOptionClassification(Value: POptionClassification);
    procedure InsertOptionClassification(Index: Integer; Value: POptionClassification);
    procedure DeleteOptionClassification(Index: Integer);
    procedure ReadFromXMLElement(Element: IXMLNode);
    function GetEnumerator: TOptionCategoryEnumerator;
    property Caption: string read FCaption write SetCaption;
    property Description: string read FDescription write SetDescription;
    property OptionClassificationCount: Integer read GetOptionClassificationCount;
    property OptionClassifications[Index: Integer]: POptionClassification read GetOptionClassification;
  end;

  // POptionSchema
  POptionSchema = class(TAutoIntfObject, IOptionSchema)

  private type
    TOptionCategoryList = TList<POptionCategory>;
    TOptionSchemaEnumerator = class
    private
      FIndex: Integer;
      FOptionSchema: POptionSchema;
    public
      constructor Create(AOptionSchema: POptionSchema);
      function GetCurrent: POptionCategory; inline;
      function MoveNext: Boolean;
      property Current: POptionCategory read GetCurrent;
    end;

  private
    FID: string;
    FCaption: string;
    FDescription: string;
    FOptionCategorys: TOptionCategoryList;
    procedure SetID(Value: string);
    procedure SetCaption(Value: string);
    procedure SetDescription(Value: string);
    function GetOptionCategory(Index: Integer): POptionCategory;
  protected
    function Get_ID: WideString; safecall;
    procedure Set_ID(const Value: WideString); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function GetOptionCategoryCount: Integer; safecall;
    function Get_Description: WideString; safecall;
    procedure Set_Description(const Value: WideString); safecall;
    function GetOptionCategoryAt(Index: Integer): IOptionCategory; safecall;
  public
    constructor Create(const TypeLib: ITypeLib; const DispIntf: TGUID);
    destructor Destroy; override;
    procedure ClearOptionCategories;
    procedure AddOptionCategory(Value: POptionCategory);
    procedure RemoveOptionCategory(Value: POptionCategory);
    procedure InsertOptionCategory(Index: Integer; Value: POptionCategory);
    procedure DeleteOptionCategory(Index: Integer);
    function FindOptionItem(Key: string): POptionItem;
    function ReadFromXMLElement(Element: IXMLNode): Boolean;
    function GetEnumerator: TOptionSchemaEnumerator;
    property ID: string read FID write SetID;
    property Caption: string read FCaption write SetCaption;
    property Description: string read FDescription write SetDescription;
    property OptionCategoryCount: Integer read GetOptionCategoryCount;
    property OptionCategories[Index: Integer]: POptionCategory read GetOptionCategory;
  end;

  // PEnumerationOptionItem
  PEnumerationOptionItem = class(POptionItem)

  private type
    TEnumerationOptionItemEnumerator = class
    private
      FIndex: Integer;
      FEnumerationOptionItem: PEnumerationOptionItem;
    public
      constructor Create(AEnumerationOptionItem: PEnumerationOptionItem);
      function GetCurrent: string; inline;
      function MoveNext: Boolean;
      property Current: string read GetCurrent;
    end;
  private
    FEnumerationItems: TStringList;
    function GetEnumerationItemCount: Integer;
    function GetEnumerationItem(Index: Integer): string;
  protected
    function AsValidType(Value: OleVariant): OleVariant; override;
    function GetTypeDefaultValue: OleVariant; override;
  public
    constructor Create(const TypeLib: ITypeLib; const DispIntf: TGUID);
    destructor Destroy; override;
    function IsValidValue(Value: OleVariant): Boolean; override;
    function ReadFromXMLElement(Element: IXMLNode): Boolean; override;
    function IndexOfItem(Value: string): Integer;
    function GetEnumerator: TEnumerationOptionItemEnumerator;
    property EnumerationItemCount: Integer read GetEnumerationItemCount;
    property EnumerationItems[Index: Integer]: string read GetEnumerationItem;
    property EnumerationItemValues: TStringList read FEnumerationItems;
  end;

  // PRangeOptionItem
  PRangeOptionItem = class(POptionItem)
  private
    FMinValue, FMaxValue: Integer;
    FStep: Integer;
    procedure SetMinValue(Value: Integer);
    procedure SetMaxValue(Value: Integer);
    procedure SetStep(Value: Integer);
  protected
    function AsValidType(Value: OleVariant): OleVariant; override;
    function GetTypeDefaultValue: OleVariant; override;
  public
    function IsValidValue(Value: OleVariant): Boolean; override;
    function ReadFromXMLElement(Element: IXMLNode): Boolean; override;
    property MinValue: Integer read FMinValue write SetMinValue;
    property MaxValue: Integer read FMaxValue write SetMaxValue;
    property Step: Integer read FStep write SetStep;
  end;

  // PIntegerOptionItem
  PIntegerOptionItem = class(POptionItem)
  protected
    function AsValidType(Value: OleVariant): OleVariant; override;
    function GetTypeDefaultValue: OleVariant; override;
  public
    function IsValidValue(Value: OleVariant): Boolean; override;
  end;

  // PRealOptionItem
  PRealOptionItem = class(POptionItem)
  protected
    function AsValidType(Value: OleVariant): OleVariant; override;
    function GetTypeDefaultValue: OleVariant; override;
  public
    function IsValidValue(Value: OleVariant): Boolean; override;
  end;

  // PStringOptionItem
  PStringOptionItem = class(POptionItem)
  protected
    function AsValidType(Value: OleVariant): OleVariant; override;
    function GetTypeDefaultValue: OleVariant; override;
  public
    function IsValidValue(Value: OleVariant): Boolean; override;
  end;

  // PBooleanOptionItem
  PBooleanOptionItem = class(POptionItem)
  protected
    function AsValidType(Value: OleVariant): OleVariant; override;
    function GetTypeDefaultValue: OleVariant; override;
  public
    function IsValidValue(Value: OleVariant): Boolean; override;
  end;

  // PTextOptionItem
  PTextOptionItem = class(POptionItem)
  protected
    function AsValidType(Value: OleVariant): OleVariant; override;
    function GetTypeDefaultValue: OleVariant; override;
  public
    function IsValidValue(Value: OleVariant): Boolean; override;
  end;

  // PFontNameOptionItem
  PFontNameOptionItem = class(POptionItem)
  protected
    function AsValidType(Value: OleVariant): OleVariant; override;
    function GetTypeDefaultValue: OleVariant; override;
  public
    function IsValidValue(Value: OleVariant): Boolean; override;
  end;

  // PFileNameOptionItem
  PFileNameOptionItem = class(POptionItem)
  protected
    function AsValidType(Value: OleVariant): OleVariant; override;
    function GetTypeDefaultValue: OleVariant; override;
  public
    function IsValidValue(Value: OleVariant): Boolean; override;
  end;

  // PPathNameOptionItem
  PPathNameOptionItem = class(POptionItem)
  protected
    function AsValidType(Value: OleVariant): OleVariant; override;
    function GetTypeDefaultValue: OleVariant; override;
  public
    function IsValidValue(Value: OleVariant): Boolean; override;
  end;

  // PColorOptionItem
  PColorOptionItem = class(POptionItem)
  protected
    function AsValidType(Value: OleVariant): OleVariant; override;
    function GetTypeDefaultValue: OleVariant; override;
  public
    function IsValidValue(Value: OleVariant): Boolean; override;
  end;

implementation

uses
  PVariants, NLS_OPTMGR,
  ComServ, SysUtils, Variants, Graphics, Dialogs;

////////////////////////////////////////////////////////////////////////////////
// POptionItem

procedure POptionItem.SetType(Value: OptionType);
begin
  FType := Value;
end;

procedure POptionItem.SetKey(Value: string);
begin
  FKey := Value;
end;

procedure POptionItem.SetCaption(Value: string);
begin
  FCaption := Value;
end;

function POptionItem.GetValue: OleVariant;
begin
  if IsValidValue(FValue) then
    Result := AsValidType(FValue)
  else begin
    Value := FDefaultValue;
    Result := AsValidType(FValue);
  end;
end;

procedure POptionItem.SetValue(Value: OleVariant);
begin
  if IsValidValue(Value) then begin
    FValue := AsValidType(Value);
    FChanged := (FValue <> FOldValue);
  end;
end;

function POptionItem.GetDefaultValue: OleVariant;
begin
  Result := AsValidType(FDefaultValue);
end;

procedure POptionItem.SetDefaultValue(Value: OleVariant);
begin
  if IsValidValue(Value) then
    FDefaultValue := AsValidType(Value);
end;

procedure POptionItem.SetDescription(Value: string);
begin
  FDescription := Value;
end;

function POptionItem.Get_Type_: OptionType;
begin
  Result := Type_;
end;

procedure POptionItem.Set_Type_(Value: OptionType);
begin
// ReadOnly
end;

function POptionItem.Get_Key: WideString;
begin
  Result := Key;
end;

procedure POptionItem.Set_Key(const Value: WideString);
begin
// ReadOnly
end;

function POptionItem.Get_Caption: WideString;
begin
  Result := Caption;
end;

procedure POptionItem.Set_Caption(const Value: WideString);
begin
  Caption := Value;
end;

function POptionItem.Get_Description: WideString;
begin
  Result := Description;
end;

procedure POptionItem.Set_Description(const Value: WideString);
begin
  Description := Value;
end;

function POptionItem.Get_Value: OleVariant;
begin
  Result := Value;
end;

procedure POptionItem.Set_Value(Value: OleVariant);
begin
  Self.Value := Value;
end;

function POptionItem.Get_DefaultValue: OleVariant;
begin
  Result := DefaultValue;
end;

procedure POptionItem.Set_DefaultValue(Value: OleVariant);
begin
// ReadOnly
end;

function POptionItem.Get_Changed: WordBool;
begin
  Result := Changed;
end;

procedure POptionItem.Set_Changed(Value: WordBool);
begin
// ReadOnly
end;

function POptionItem.ReadFromXMLElement(Element: IXMLNode): Boolean;
begin
  Result := True;
  if not IsOptionItemTypeName(Element.NodeName) then begin
    Result := False;
    Exit;
  end;
  FType := TagToOptionType(Element.NodeName);

  if VarIsNull(Element.Attributes[XOD_ATTRIBUTE_KEY]) then begin
    Result := False;
    Exit;
  end;
  FKey := Element.Attributes[XOD_ATTRIBUTE_KEY];

  if VarIsNull(Element.ChildValues[XOD_ELEMENT_CAPTION]) then
    FCaption := TXT_UNSPECIFIED
  else
    FCaption := Element.ChildValues[XOD_ELEMENT_CAPTION];

  if VarIsNull(Element.ChildValues[XOD_ELEMENT_DEFAULT_VALUE]) then
    DefaultValue := GetTypeDefaultValue
  else
    DefaultValue := Element.ChildValues[XOD_ELEMENT_DEFAULT_VALUE];

  if not IsValidValue(DefaultValue) then begin
    Result := False;
    Exit;
  end;

  Value := DefaultValue;
  FOldValue := DefaultValue;
  FChanged := False;

  if VarIsNull(Element.ChildValues[XOD_ELEMENT_DESCRIPTION]) then
    FDescription := ''
  else
    FDescription := Element.ChildValues[XOD_ELEMENT_DESCRIPTION];
end;

procedure POptionItem.SetInitalValue(Value: OleVariant);
begin
  if VarIsNull(Value) then begin
    POptionManagerMessages.InvalidValue(FCaption);
    Exit;
  end;
  if IsValidValue(Value) then begin
    FChanged := False;
    FValue := AsValidType(Value);
    FOldValue := AsValidType(Value);
  end
  else begin
    FChanged := True;
    FValue := AsValidType(FDefaultValue);
    FOldValue := AsValidType(FDefaultValue);
  end;
end;

procedure POptionItem.RestoreValue;
begin
  FValue := FOldValue;
  FChanged := False;
end;


// POptionItem
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// POptionClassification

constructor POptionClassification.TOptionClassificationEnumerator.Create(
  AOptionClassification: POptionClassification);
begin
  inherited Create;
  FIndex := -1;
  FOptionClassification := AOptionClassification;
end;

function POptionClassification.TOptionClassificationEnumerator.GetCurrent: POptionItem;
begin
  Result := FOptionClassification.OptionItems[FIndex];
end;

function POptionClassification.TOptionClassificationEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FOptionClassification.GetOptionItemCount - 1;
  if Result then
    Inc(FIndex);
end;

function POptionClassification.GetEnumerator: TOptionClassificationEnumerator;
begin
  Result := TOptionClassificationEnumerator.Create(self);
end;

constructor POptionClassification.Create(const TypeLib: ITypeLib; const DispIntf: TGUID);
begin
  inherited Create(TypeLib, DispIntf);
  FOptionItems := TOptionItemList.Create;
end;

destructor POptionClassification.Destroy;
begin
  FOptionItems.Free;
  inherited Destroy;
end;

procedure POptionClassification.SetCaption(Value: string);
begin
  FCaption := Value;
end;

procedure POptionClassification.SetDescription(Value: string);
begin
  FDescription := Value;
end;

function POptionClassification.GetOptionItem(Index: Integer): POptionItem;
begin
  Result := FOptionItems.Items[Index];
end;

function POptionClassification.Get_Caption: WideString;
begin
  Result := Caption;
end;

procedure POptionClassification.Set_Caption(const Value: WideString);
begin
  Caption := Value;
end;

function POptionClassification.Get_Description: WideString;
begin
  Result := Description;
end;

procedure POptionClassification.Set_Description(const Value: WideString);
begin
  Description := Value;
end;

function POptionClassification.GetOptionItemCount: Integer;
begin
  Result := FOptionItems.Count;
end;

function POptionClassification.GetOptionItemAt(Index: Integer): IOptionItem;
begin
  Result := OptionItems[Index];
end;

procedure POptionClassification.ClearOptionItems;
var
  OI: POptionItem;
begin
  for OI in FOptionItems do
    RemoveOptionItem(OI);
end;

procedure POptionClassification.AddOptionItem(Value: POptionItem);
begin
  if Value <> nil then begin
    FOptionItems.Add(Value);
    Value._AddRef;
  end;
end;

procedure POptionClassification.RemoveOptionItem(Value: POptionItem);
begin
  if Value <> nil then begin
    FOptionItems.Remove(Value);
    Value._Release;
  end;
end;

procedure POptionClassification.InsertOptionItem(Index: Integer; Value: POptionItem);
begin
  if Value <> nil then begin
    FOptionItems.Insert(Index, Value);
    Value._AddRef;
  end;
end;

procedure POptionClassification.DeleteOptionItem(Index: Integer);
var
  OI: POptionItem;
begin
  OI := GetOptionItem(Index);
  RemoveOptionItem(OI);
end;

procedure POptionClassification.ReadFromXMLElement(Element: IXMLNode);
var
  OI: POptionItem;
  Child: IXMLNode;
  I: Integer;
begin
  if VarIsNull(Element.ChildValues[XOD_ELEMENT_CAPTION]) then
    FCaption := TXT_UNSPECIFIED
  else
    FCaption := Element.ChildValues[XOD_ELEMENT_CAPTION];
  if VarIsNull(Element.ChildValues[XOD_ELEMENT_DESCRIPTION]) then
    FDescription := ''
  else
    FDescription := Element.ChildValues[XOD_ELEMENT_DESCRIPTION];
  for I := 0 to Element.ChildNodes.Count - 1 do begin
    Child := Element.ChildNodes[I];
    OI := nil;
    if IsOptionItemTypeName(Child.NodeName) then begin
      if Child.NodeName = XOD_ELEMENT_ITEM_INTEGER then begin
        OI := PIntegerOptionItem.Create(ComServer.TypeLib, IOptionItem);
      end
      else if Child.NodeName = XOD_ELEMENT_ITEM_REAL then begin
        OI := PRealOptionItem.Create(ComServer.TypeLib, IOptionItem);
      end
      else if Child.NodeName = XOD_ELEMENT_ITEM_STRING then begin
        OI := PStringOptionItem.Create(ComServer.TypeLib, IOptionItem);
      end
      else if Child.NodeName = XOD_ELEMENT_ITEM_BOOLEAN then begin
        OI := PBooleanOptionItem.Create(ComServer.TypeLib, IOptionItem);
      end
      else if Child.NodeName = XOD_ELEMENT_ITEM_TEXT then begin
        OI := PTextOptionItem.Create(ComServer.TypeLib, IOptionItem);
      end
      else if Child.NodeName = XOD_ELEMENT_ITEM_ENUMERATION then begin
        OI := PEnumerationOptionItem.Create(ComServer.TypeLib, IOptionItem);
      end
      else if Child.NodeName = XOD_ELEMENT_ITEM_RANGE then begin
        OI := PRangeOptionItem.Create(ComServer.TypeLib, IOptionItem);
      end
      else if Child.NodeName = XOD_ELEMENT_ITEM_FONTNAME then begin
        OI := PFontNameOptionItem.Create(ComServer.TypeLib, IOptionItem);
      end
      else if Child.NodeName = XOD_ELEMENT_ITEM_FILENAME then begin
        OI := PFileNameOptionItem.Create(ComServer.TypeLib, IOptionItem);
      end
      else if Child.NodeName = XOD_ELEMENT_ITEM_PATHNAME then begin
        OI := PPathNameOptionItem.Create(ComServer.TypeLib, IOptionItem);
      end
      else if Child.NodeName = XOD_ELEMENT_ITEM_COLOR then begin
        OI := PColorOptionItem.Create(ComServer.TypeLib, IOptionItem);
      end;
      if OI <> nil then begin
        if OI.ReadFromXMLElement(Child) then
          AddOptionItem(OI)
        else
          OI.Free;
      end;
    end;
  end;
end;

// POptionClassification
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// POptionCategory

constructor POptionCategory.TOptionCategoryEnumerator.Create(
  AOptionCategory: POptionCategory);
begin
  inherited Create;
  FIndex := -1;
  FOptionCategory := AOptionCategory;
end;

function POptionCategory.TOptionCategoryEnumerator.GetCurrent: POptionClassification;
begin
  Result := FOptionCategory.OptionClassifications[FIndex];
end;

function POptionCategory.TOptionCategoryEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FOptionCategory.GetOptionClassificationCount - 1;
  if Result then
    Inc(FIndex);
end;

function POptionCategory.GetEnumerator: TOptionCategoryEnumerator;
begin
  Result := TOptionCategoryEnumerator.Create(self);
end;

constructor POptionCategory.Create(const TypeLib: ITypeLib; const DispIntf: TGUID);
begin
  inherited Create(TypeLib, DispIntf);
  FOptionClassifications := TOptionClassificationList.Create;
end;

destructor POptionCategory.Destroy;
begin
  FOptionClassifications.Free;
  inherited Destroy;
end;

procedure POptionCategory.SetCaption(Value: string);
begin
  FCaption := Value;
end;

procedure POptionCategory.SetDescription(Value: string);
begin
  FDescription := Value;
end;

function POptionCategory.GetOptionClassification(Index: Integer): POptionClassification;
begin
  Result := FOptionClassifications.Items[Index];
end;

function POptionCategory.Get_Caption: WideString;
begin
  Result := Caption;
end;

procedure POptionCategory.Set_Caption(const Value: WideString);
begin
  Caption := Value;
end;

function POptionCategory.Get_Description: WideString;
begin
  Result := Description;
end;

procedure POptionCategory.Set_Description(const Value: WideString);
begin
  Description := Value;
end;

function POptionCategory.GetOptionClassificationCount: Integer;
begin
  Result := FOptionClassifications.Count;
end;

function POptionCategory.GetOptionClassificationAt(Index: Integer): IOptionClassification;
begin
  Result := OptionClassifications[Index];
end;

procedure POptionCategory.ClearOptionClassifications;
var
  OC: POptionClassification;
begin
  for OC in FOptionClassifications do
    RemoveOptionClassification(OC);
end;

procedure POptionCategory.AddOptionClassification(Value: POptionClassification);
begin
  if Value <> nil then begin
    FOptionClassifications.Add(Value);
    Value._AddRef;
  end;
end;

procedure POptionCategory.RemoveOptionClassification(Value: POptionClassification);
begin
  if Value <> nil then begin
    FOptionClassifications.Remove(Value);
    Value._Release;
  end;
end;

procedure POptionCategory.InsertOptionClassification(Index: Integer; Value: POptionClassification);
begin
  if Value <> nil then begin
    FOptionClassifications.Insert(Index, Value);
    Value._AddRef;
  end;
end;

procedure POptionCategory.DeleteOptionClassification(Index: Integer);
var
  OC: POptionClassification;
begin
  OC := GetOptionClassification(Index);
  RemoveOptionClassification(OC);
end;

procedure POptionCategory.ReadFromXMLElement(Element: IXMLNode);
var
  OL: POptionClassification;
  Child: IXMLNode;
  I: Integer;
begin
  if VarIsNull(Element.ChildValues[XOD_ELEMENT_CAPTION]) then
    FCaption := TXT_UNSPECIFIED
  else
    FCaption := Element.ChildValues[XOD_ELEMENT_CAPTION];
  if VarIsNull(Element.ChildValues[XOD_ELEMENT_DESCRIPTION]) then
    FDescription := ''
  else
    FDescription := Element.ChildValues[XOD_ELEMENT_DESCRIPTION];
  for I := 0 to Element.ChildNodes.Count - 1 do begin
    Child := Element.ChildNodes[I];
    if Child.NodeName = XOD_ELEMENT_CLASSIFICATION then begin
      OL := POptionClassification.Create(ComServer.TypeLib, IOptionClassification);
      OL.ReadFromXMLElement(Child);
      AddOptionClassification(OL);
    end;
  end;
end;

// POptionCategory
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// POptionSchema

constructor POptionSchema.TOptionSchemaEnumerator.Create(
  AOptionSchema: POptionSchema);
begin
  inherited Create;
  FIndex := -1;
  FOptionSchema := AOptionSchema;
end;

function POptionSchema.TOptionSchemaEnumerator.GetCurrent: POptionCategory;
begin
  Result := FOptionSchema.OptionCategories[FIndex];
end;

function POptionSchema.TOptionSchemaEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FOptionSchema.GetOptionCategoryCount - 1;
  if Result then
    Inc(FIndex);
end;

function POptionSchema.GetEnumerator: TOptionSchemaEnumerator;
begin
  Result := TOptionSchemaEnumerator.Create(self);
end;

constructor POptionSchema.Create(const TypeLib: ITypeLib; const DispIntf: TGUID);
begin
  inherited Create(TypeLib, DispIntf);
  FOptionCategorys := TOptionCategoryList.Create;
end;

destructor POptionSchema.Destroy;
begin
  FOptionCategorys.Free;
  inherited Destroy;
end;

procedure POptionSchema.SetID(Value: string);
begin
  FID := Value;
end;

procedure POptionSchema.SetCaption(Value: string);
begin
  FCaption := Value;
end;

procedure POptionSchema.SetDescription(Value: string);
begin
  FDescription := Value;
end;

function POptionSchema.GetOptionCategory(Index: Integer): POptionCategory;
begin
  Result := FOptionCategorys.Items[Index];
end;

function POptionSchema.Get_Id: WideString; safecall;
begin
  Result := ID;
end;

procedure POptionSchema.Set_ID(const Value: WideString);
begin
// ReadOnly
end;

function POptionSchema.Get_Caption: WideString;
begin
  Result := Caption;
end;

procedure POptionSchema.Set_Caption(const Value: WideString);
begin
  Caption := Value;
end;

function POptionSchema.GetOptionCategoryCount: Integer;
begin
  Result := FOptionCategorys.Count;
end;

function POptionSchema.Get_Description: WideString;
begin
  Result := Description;
end;

procedure POptionSchema.Set_Description(const Value: WideString);
begin
  Description := Value;
end;

function POptionSchema.GetOptionCategoryAt(Index: Integer): IOptionCategory;
begin
  Result := OptionCategories[Index];
end;

procedure POptionSchema.ClearOptionCategories;
var
  I: Integer;
begin
  for I := 0 to OptionCategoryCount - 1 do
    DeleteOptionCategory(I);
end;

procedure POptionSchema.AddOptionCategory(Value: POptionCategory);
begin
  if Value <> nil then begin
    FOptionCategorys.Add(Value);
    Value._AddRef;
  end;
end;

procedure POptionSchema.RemoveOptionCategory(Value: POptionCategory);
begin
  if Value <> nil then begin
    FOptionCategorys.Remove(Value);
    Value._Release;
  end;
end;

procedure POptionSchema.InsertOptionCategory(Index: Integer; Value: POptionCategory);
begin
  if Value <> nil then begin
    FOptionCategorys.Insert(Index, Value);
    Value._AddRef;
  end;
end;

procedure POptionSchema.DeleteOptionCategory(Index: Integer);
var
  OC: POptionCategory;
begin
  OC := GetOptionCategory(Index);
  RemoveOptionCategory(OC);
end;

function POptionSchema.FindOptionItem(Key: string): POptionItem;
var
  Category: POptionCategory;
  Classification: POptionClassification;
  Item: POptionItem;
  I, J, K: Integer;
begin
  Result := nil;
  for I := 0 to OptionCategoryCount - 1 do begin
    Category := OptionCategories[I];
    for J := 0 to Category.OptionClassificationCount - 1 do begin
      Classification := Category.OptionClassifications[J];
      for K := 0 to Classification.OptionItemCount - 1 do begin
        Item := Classification.OptionItems[K];
        if Item.Key = Key then begin
          Result := Item;
          Exit;
        end;
      end;
    end;
  end;
end;

function POptionSchema.ReadFromXMLElement(Element: IXMLNode): Boolean;
var
  OC: POptionCategory;
  HeaderNode, BodyNode: IXMLNode;
  Child: IXMLNode;
  I: Integer;
begin
  Result := True;
  HeaderNode := Element.ChildNodes[XOD_ELEMENT_HEADER];
  if HeaderNode = nil then begin
    Result := False;
    Exit;
  end;
  BodyNode := Element.ChildNodes[XOD_ELEMENT_BODY];
  if BodyNode = nil then begin
    Result := False;
    Exit;
  end;
  if VarIsNull(Element.Attributes[XOD_ATTRIBUTE_ID]) then begin
    Result := False;
    Exit;
  end
  else
    FID := Element.Attributes[XOD_ATTRIBUTE_ID];
  if VarIsNull(HeaderNode.ChildValues[XOD_ELEMENT_CAPTION]) then
    FCaption := TXT_UNSPECIFIED
  else
    FCaption := HeaderNode.ChildValues[XOD_ELEMENT_CAPTION];
  if VarIsNull(HeaderNode.ChildValues[XOD_ELEMENT_DESCRIPTION]) then
    FDescription := ''
  else
    FDescription := HeaderNode.ChildValues[XOD_ELEMENT_DESCRIPTION];
  for I := 0 to BodyNode.ChildNodes.Count - 1 do begin
    Child := BodyNode.ChildNodes[I];
    if Child.NodeName = XOD_ELEMENT_CATEGORY then begin
      OC := POptionCategory.Create(ComServer.TypeLib, IOptionCategory);
      OC.ReadFromXMLElement(Child);
      AddOptionCategory(OC);
    end;
  end;
end;

// POptionSchema
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PEnumerationOptionItem

constructor PEnumerationOptionItem.TEnumerationOptionItemEnumerator.Create(
  AEnumerationOptionItem: PEnumerationOptionItem);
begin
  inherited Create;
  FIndex := -1;
  FEnumerationOptionItem := AEnumerationOptionItem;
end;

function PEnumerationOptionItem.TEnumerationOptionItemEnumerator.GetCurrent:
  string;
begin
  Result := FEnumerationOptionItem.EnumerationItems[FIndex];
end;

function PEnumerationOptionItem.TEnumerationOptionItemEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FEnumerationOptionItem.EnumerationItemCount - 1;
  if Result then
    Inc(FIndex);
end;

function PEnumerationOptionItem.GetEnumerator: TEnumerationOptionItemEnumerator;
begin
  Result := TEnumerationOptionItemEnumerator.Create(self);
end;

constructor PEnumerationOptionItem.Create(const TypeLib: ITypeLib; const DispIntf: TGUID);
begin
  inherited Create(TypeLib, DispIntf);
  FEnumerationItems := TStringList.Create;
end;

destructor PEnumerationOptionItem.Destroy;
begin
  FEnumerationItems.Free;
  inherited Destroy;
end;

function PEnumerationOptionItem.GetEnumerationItemCount: Integer;
begin
  Result := FEnumerationItems.Count;
end;

function PEnumerationOptionItem.GetEnumerationItem(
  Index: Integer): string;
begin
  Result := FEnumerationItems[Index];
end;

function PEnumerationOptionItem.AsValidType(Value: OleVariant): OleVariant;
begin
  Result := VarAsType(Value, varInteger);
end;

function PEnumerationOptionItem.GetTypeDefaultValue: OleVariant;
begin
  Result := 0;
end;

function PEnumerationOptionItem.IsValidValue(Value: OleVariant): Boolean;
var
  V: Integer;
begin
  Result := False;
  if IsInteger(Value) then begin
    V := Value;
    Result := (V >= 0) and (V <= EnumerationItemCount - 1);
  end;
end;

function PEnumerationOptionItem.ReadFromXMLElement(Element: IXMLNode): Boolean;
var
  I: Integer;
  R: Boolean;
begin
  for I := 0 to Element.ChildNodes.Count - 1 do begin
    if Element.ChildNodes[I].NodeName = XOD_ELEMENT_ENUMURATION_ITEM then begin
      FEnumerationItems.Add(Element.ChildNodes[I].NodeValue);
    end;
  end;
  R := inherited ReadFromXMLElement(Element);
  if R then
    Result := IsValidValue(Value)
  else
    Result := False;
end;

function PEnumerationOptionItem.IndexOfItem(Value: string): Integer;
begin
  Result := FEnumerationItems.IndexOf(Value);
end;

// PEnumerationOptionItem
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PRangeOptionItem

procedure PRangeOptionItem.SetMinValue(Value: Integer);
begin
  FMinValue := Value;
end;

procedure PRangeOptionItem.SetMaxValue(Value: Integer);
begin
  FMaxValue := Value;
end;

procedure PRangeOptionItem.SetStep(Value: Integer);
begin
  FStep := Value;
end;

function PRangeOptionItem.AsValidType(Value: OleVariant): OleVariant;
begin
  Result := VarAsType(Value, varInteger);
end;

function PRangeOptionItem.GetTypeDefaultValue: OleVariant;
begin
  Result := 0;
end;

function PRangeOptionItem.IsValidValue(Value: OleVariant): Boolean;
begin
  Result := False;
  if IsInteger(Value) then
    Result := (Value >= MinValue) and (Value <= MaxValue);
end;

function PRangeOptionItem.ReadFromXMLElement(Element: IXMLNode): Boolean;
begin
  if VarIsNull(Element.ChildValues[XOD_ELEMENT_MIN_VALUE]) then begin
    Result := False;
    Exit;
  end;
  if VarIsNull(Element.ChildValues[XOD_ELEMENT_MAX_VALUE]) then begin
    Result := False;
    Exit;
  end;
  if VarIsNull(Element.ChildValues[XOD_ELEMENT_STEP]) then begin
    Result := False;
    Exit;
  end;
  FMinValue := Element.ChildValues[XOD_ELEMENT_MIN_VALUE];
  FMaxValue := Element.ChildValues[XOD_ELEMENT_MAX_VALUE];
  FStep := Element.ChildValues[XOD_ELEMENT_STEP];
  Result := inherited ReadFromXMLElement(Element);
end;

// PRangeOptionItem
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PIntegerOptionItem

function PIntegerOptionItem.AsValidType(Value: OleVariant): OleVariant;
begin
  Result := VarAsType(Value, varInteger);
end;

function PIntegerOptionItem.GetTypeDefaultValue: OleVariant;
begin
  Result := 0;
end;

function PIntegerOptionItem.IsValidValue(Value: OleVariant): Boolean;
begin
  Result := IsInteger(Value);
end;

// PIntegerOptionItem
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PRealOptionItem

function PRealOptionItem.AsValidType(Value: OleVariant): OleVariant;
begin
  Result := VarAsType(Value, varDouble);
end;

function PRealOptionItem.GetTypeDefaultValue: OleVariant;
begin
  Result := 0.0;
end;

function PRealOptionItem.IsValidValue(Value: OleVariant): Boolean;
begin
  Result := IsReal(Value);
end;

// PRealOptionItem
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PStringOptionItem

function PStringOptionItem.AsValidType(Value: OleVariant): OleVariant;
begin
  Result := VarAsType(Value, varOleStr);
end;

function PStringOptionItem.GetTypeDefaultValue: OleVariant;
begin
  Result := '';
end;

function PStringOptionItem.IsValidValue(Value: OleVariant): Boolean;
begin
  Result := IsString(Value);
end;

// PStringOptionItem
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PBooleanOptionItem

function PBooleanOptionItem.AsValidType(Value: OleVariant): OleVariant;
begin
  Result := VarAsType(Value, varBoolean);
end;

function PBooleanOptionItem.GetTypeDefaultValue: OleVariant;
begin
  Result := False;
end;

function PBooleanOptionItem.IsValidValue(Value: OleVariant): Boolean;
begin
  Result := IsBoolean(Value);
end;

// PBooleanOptionItem
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PTextOptionItem

function PTextOptionItem.AsValidType(Value: OleVariant): OleVariant;
begin
  Result := VarAsType(Value, varOleStr);
end;

function PTextOptionItem.GetTypeDefaultValue: OleVariant;
begin
  Result := '';
end;

function PTextOptionItem.IsValidValue(Value: OleVariant): Boolean;
begin
  Result := IsString(Value);
end;

// PTextOptionItem
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PFontNameOptionItem

function PFontNameOptionItem.AsValidType(Value: OleVariant): OleVariant;
begin
  Result := VarAsType(Value, varOleStr);
end;

function PFontNameOptionItem.GetTypeDefaultValue: OleVariant;
begin
  Result := '';
end;

function PFontNameOptionItem.IsValidValue(Value: OleVariant): Boolean;
begin
  Result := IsString(Value);
end;

// PFontNameOptionItem
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PFileNameOptionItem

function PFileNameOptionItem.AsValidType(Value: OleVariant): OleVariant;
begin
  Result := VarAsType(Value, varOleStr);
end;

function PFileNameOptionItem.GetTypeDefaultValue: OleVariant;
begin
  Result := '';
end;

function PFileNameOptionItem.IsValidValue(Value: OleVariant): Boolean;
begin
  Result := IsString(Value);
end;

// PFileNameOptionItem
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PPathNameOptionItem

function PPathNameOptionItem.AsValidType(Value: OleVariant): OleVariant;
begin
  Result := VarAsType(Value, varOleStr);
end;

function PPathNameOptionItem.GetTypeDefaultValue: OleVariant;
begin
  Result := '';
end;

function PPathNameOptionItem.IsValidValue(Value: OleVariant): Boolean;
begin
  Result := IsString(Value);
end;

// PPathNameOptionItem
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PColorOptionItem
//

function PColorOptionItem.AsValidType(Value: OleVariant): OleVariant;
begin
  Result := VarAsType(ColorToStr(ColorValue(Value)), varOleStr);
end;

function PColorOptionItem.GetTypeDefaultValue: OleVariant;
begin
  Result := '#00FFFFFF';
end;

function PColorOptionItem.IsValidValue(Value: OleVariant): Boolean;
begin
  Result := IsColor(Value);
end;

// PColorOptionItem
////////////////////////////////////////////////////////////////////////////////

end.
