unit GmrNodes;

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
  Classes, Types;

type
	// Forward declarations
	NASTNode = class;
	NDesign = class;
	NProperty = class;
	NNode = class;
	NNodeChild = class;
	NObject = class;
	NLiteral = class;
	NList = class;
	NLiteralChild = class;
	NValue = class;
	NLocation = class;
	NTuple = class;
	NTag = class;
	NStringLiteral = class;
	NFloat = class;
	NInteger = class;
	NBoolean = class;
	NHeader = class;

	// Enumerations

	// NASTNode
	NASTNode = class
  private
		{ Member Fields }
		FLevel: Integer;
		{ Getter/Setter }
		procedure Set_Level(Value: Integer);
  public
		{ Properties }
		property Level: Integer read FLevel write Set_Level;
  end;

	// NDesign
	NDesign = class(NASTNode)
  private
		{ Member Fields }
		FObject: NObject;
		{ Getter/Setter }
		procedure Set_Object(Value: NObject);
  public
		{ Constructor/Destructor }
		constructor Create;
		destructor Destroy; override;
		{ Properties }
		property Object_: NObject read FObject write Set_Object;
  end;

	// NProperty
	NProperty = class(NASTNode)
  private
		{ Member Fields }
		FName: string;
		FNode: NNode;
		{ Getter/Setter }
		procedure Set_Name(Value: string);
		procedure Set_Node(Value: NNode);
  public
		{ Constructor/Destructor }
		constructor Create;
		destructor Destroy; override;
		{ Properties }
		property Name: string read FName write Set_Name;
		property Node: NNode read FNode write Set_Node;
  end;

	// NNode
	NNode = class(NASTNode)
  private
		{ Member Fields }
		FChild: NNodeChild;
		{ Getter/Setter }
		procedure Set_Child(Value: NNodeChild);
  public
		{ Constructor/Destructor }
		constructor Create;
		destructor Destroy; override;
		{ Properties }
		property Child: NNodeChild read FChild write Set_Child;
  end;

	// NNodeChild
	NNodeChild = class(NASTNode)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// NObject
	NObject = class(NNodeChild)
  private
		{ Member Fields }
		FName: string;
		FParams: TStringList;
		FTag: Integer;
		FProperties: TList;
		{ Getter/Setter }
		procedure Set_Name(Value: string);
		function Get_ParamCount: Integer;
		function Get_Param(Index: Integer): string;
		procedure Set_Tag(Value: Integer);
		function Get_PropertyCount: Integer;
		function Get_Property(Index: Integer): NProperty;
  public
		{ Constructor/Destructor }
		constructor Create;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Param(Value: string);
		procedure Insert_Param(Index: Integer; Value: string);
		procedure Delete_Param(Index: Integer);
		procedure Add_Property(Value: NProperty);
		procedure Remove_Property(Value: NProperty);
		procedure Insert_Property(Index: Integer; Value: NProperty);
		procedure Delete_Property(Index: Integer);
		{ Properties }
		property Name: string read FName write Set_Name;
		property ParamCount: Integer read Get_ParamCount;
		property Params[Index: Integer]: string read Get_Param;
		property Tag: Integer read FTag write Set_Tag;
		property PropertyCount: Integer read Get_PropertyCount;
		property Properties[Index: Integer]: NProperty read Get_Property;
  end;

	// NLiteral
	NLiteral = class(NNodeChild)
  private
		{ Member Fields }
		FChild: NLiteralChild;
		{ Getter/Setter }
		procedure Set_Child(Value: NLiteralChild);
  public
		{ Constructor/Destructor }
		constructor Create;
		destructor Destroy; override;
		{ Properties }
		property Child: NLiteralChild read FChild write Set_Child;
  end;

	// NList
	NList = class(NNodeChild)
  private
		{ Member Fields }
		FItems: TList;
		{ Getter/Setter }
		function Get_ItemCount: Integer;
		function Get_Item(Index: Integer): NNode;
  public
		{ Constructor/Destructor }
		constructor Create;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Item(Value: NNode);
		procedure Remove_Item(Value: NNode);
		procedure Insert_Item(Index: Integer; Value: NNode);
		procedure Delete_Item(Index: Integer);
		{ Properties }
		property ItemCount: Integer read Get_ItemCount;
		property Items[Index: Integer]: NNode read Get_Item;
  end;

	// NLiteralChild
	NLiteralChild = class(NASTNode)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// NValue
	NValue = class(NLiteralChild)
  private
		{ Member Fields }
		FValue: string;
		{ Getter/Setter }
		procedure Set_Value(Value: string);
  public
		{ Properties }
		property Value: string read FValue write Set_Value;
  end;

	// NLocation
	NLocation = class(NLiteralChild)
  private
		{ Member Fields }
		FX: Integer;
		FY: Integer;
		{ Getter/Setter }
		procedure Set_X(Value: Integer);
		procedure Set_Y(Value: Integer);
  public
		{ Properties }
		property X: Integer read FX write Set_X;
		property Y: Integer read FY write Set_Y;
  end;

	// NTuple
	NTuple = class(NLiteralChild)
  private
		{ Member Fields }
		FStrValue: string;
		FIntValue: Integer;
		{ Getter/Setter }
		procedure Set_StrValue(Value: string);
		procedure Set_IntValue(Value: Integer);
  public
		{ Properties }
		property StrValue: string read FStrValue write Set_StrValue;
		property IntValue: Integer read FIntValue write Set_IntValue;
  end;

	// NTag
	NTag = class(NLiteralChild)
  private
		{ Member Fields }
		FValue: Integer;
		{ Getter/Setter }
		procedure Set_Value(Value: Integer);
  public
		{ Properties }
		property Value: Integer read FValue write Set_Value;
  end;

	// NStringLiteral
	NStringLiteral = class(NLiteralChild)
  private
		{ Member Fields }
		FValue: string;
		{ Getter/Setter }
		procedure Set_Value(Value: string);
  public
		{ Properties }
		property Value: string read FValue write Set_Value;
  end;

	// NFloat
	NFloat = class(NLiteralChild)
  private
		{ Member Fields }
		FValue: Real;
		{ Getter/Setter }
		procedure Set_Value(Value: Real);
  public
		{ Properties }
		property Value: Real read FValue write Set_Value;
  end;

	// NInteger
	NInteger = class(NLiteralChild)
  private
		{ Member Fields }
		FValue: Integer;
		{ Getter/Setter }
		procedure Set_Value(Value: Integer);
  public
		{ Properties }
		property Value: Integer read FValue write Set_Value;
  end;

	// NBoolean
	NBoolean = class(NLiteralChild)
  private
		{ Member Fields }
		FValue: Boolean;
		{ Getter/Setter }
		procedure Set_Value(Value: Boolean);
  public
		{ Properties }
		property Value: Boolean read FValue write Set_Value;
  end;

	// NHeader
	NHeader = class(NASTNode)
  private
		{ Member Fields }
		FObject: NObject;
		{ Getter/Setter }
		procedure Set_Object(Value: NObject);
  public
		{ Constructor/Destructor }
		constructor Create;
		destructor Destroy; override;
		{ Properties }
		property Object_: NObject read FObject write Set_Object;
  end;

implementation

/////////////////////////////////////////////////////////////////////////////
//  NASTNode

procedure NASTNode.Set_Level(Value: Integer);
begin
  FLevel := Value;
end;

//  NASTNode
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NDesign

constructor NDesign.Create;
begin
  inherited Create;
	FObject := nil;
end;

destructor NDesign.Destroy;
begin
	if FObject <> nil then begin
		FObject.Free;
		FObject := nil;
	end;
	inherited;
end;

procedure NDesign.Set_Object(Value: NObject);
begin
  if FObject <> Value then begin
    FObject := Value;
  end;
end;

//  NDesign
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NProperty

constructor NProperty.Create;
begin
  inherited Create;
	FNode := nil;
end;

destructor NProperty.Destroy;
begin
	if FNode <> nil then begin
		FNode.Free;
		FNode := nil;
	end;
	inherited;
end;

procedure NProperty.Set_Name(Value: string);
begin
  FName := Value;
end;

procedure NProperty.Set_Node(Value: NNode);
begin
  if FNode <> Value then begin
    FNode := Value;
  end;
end;

//  NProperty
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NNode

constructor NNode.Create;
begin
  inherited Create;
	FChild := nil;
end;

destructor NNode.Destroy;
begin
	if FChild <> nil then begin
		FChild.Free;
		FChild := nil;
	end;
	inherited;
end;

procedure NNode.Set_Child(Value: NNodeChild);
begin
  if FChild <> Value then begin
    FChild := Value;
  end;
end;

//  NNode
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NNodeChild

//  NNodeChild
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NObject

constructor NObject.Create;
begin
  inherited Create;
	FParams := TStringList.Create;
	FProperties := TList.Create;
end;

destructor NObject.Destroy;
var
  I: Integer;
begin
	FParams.Free;
	FParams := nil;
	for I := FProperties.Count - 1 downto 0 do begin
		Get_Property(I).Free;
		FProperties.Delete(I);
	end;
	FProperties.Free;
	FProperties := nil;
	inherited;
end;

procedure NObject.Set_Name(Value: string);
begin
  FName := Value;
end;

function NObject.Get_ParamCount: Integer;
begin
  Result := FParams.Count;
end;

function NObject.Get_Param(Index: Integer): string;
begin
  Result := FParams[Index];
end;

procedure NObject.Add_Param(Value: string);
begin
  FParams.Add(Value);
end;

procedure NObject.Insert_Param(Index: Integer; Value: string);
begin
  FParams.Insert(Index, Value);
end;

procedure NObject.Delete_Param(Index: Integer);
begin
  FParams.Delete(Index);
end;

procedure NObject.Set_Tag(Value: Integer);
begin
  FTag := Value;
end;

function NObject.Get_PropertyCount: Integer;
begin
  Result := FProperties.Count;
end;

function NObject.Get_Property(Index: Integer): NProperty;
begin
  Result := FProperties[Index];
end;

procedure NObject.Add_Property(Value: NProperty);
begin
  if FProperties.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FProperties.Add(Value);
  end;
end;

procedure NObject.Remove_Property(Value: NProperty);
begin
  if FProperties.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FProperties.Remove(Value);
  end;
end;

procedure NObject.Insert_Property(Index: Integer; Value: NProperty);
begin
  if FProperties.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FProperties.Insert(Index, Value);
  end;
end;

procedure NObject.Delete_Property(Index: Integer);
begin
  if (Index < 0) or (Index > FProperties.Count - 1) then Exit;
  Remove_Property(Get_Property(Index));
end;

//  NObject
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NLiteral

constructor NLiteral.Create;
begin
  inherited Create;
	FChild := nil;
end;

destructor NLiteral.Destroy;
begin
	if FChild <> nil then begin
		FChild.Free;
		FChild := nil;
	end;
	inherited;
end;

procedure NLiteral.Set_Child(Value: NLiteralChild);
begin
  if FChild <> Value then begin
    FChild := Value;
  end;
end;

//  NLiteral
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NList

constructor NList.Create;
begin
  inherited Create;
	FItems := TList.Create;
end;

destructor NList.Destroy;
var
  I: Integer;
begin
	for I := FItems.Count - 1 downto 0 do begin
		Get_Item(I).Free;
		FItems.Delete(I);
	end;
	FItems.Free;
	FItems := nil;
	inherited;
end;

function NList.Get_ItemCount: Integer;
begin
  Result := FItems.Count;
end;

function NList.Get_Item(Index: Integer): NNode;
begin
  Result := FItems[Index];
end;

procedure NList.Add_Item(Value: NNode);
begin
  if FItems.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FItems.Add(Value);
  end;
end;

procedure NList.Remove_Item(Value: NNode);
begin
  if FItems.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FItems.Remove(Value);
  end;
end;

procedure NList.Insert_Item(Index: Integer; Value: NNode);
begin
  if FItems.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FItems.Insert(Index, Value);
  end;
end;

procedure NList.Delete_Item(Index: Integer);
begin
  if (Index < 0) or (Index > FItems.Count - 1) then Exit;
  Remove_Item(Get_Item(Index));
end;

//  NList
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NLiteralChild

//  NLiteralChild
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NValue

procedure NValue.Set_Value(Value: string);
begin
  FValue := Value;
end;

//  NValue
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NLocation

procedure NLocation.Set_X(Value: Integer);
begin
  FX := Value;
end;

procedure NLocation.Set_Y(Value: Integer);
begin
  FY := Value;
end;

//  NLocation
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NTuple

procedure NTuple.Set_StrValue(Value: string);
begin
  FStrValue := Value;
end;

procedure NTuple.Set_IntValue(Value: Integer);
begin
  FIntValue := Value;
end;

//  NTuple
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NTag

procedure NTag.Set_Value(Value: Integer);
begin
  FValue := Value;
end;

//  NTag
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NStringLiteral

procedure NStringLiteral.Set_Value(Value: string);
begin
  FValue := Value;
end;

//  NStringLiteral
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NFloat

procedure NFloat.Set_Value(Value: Real);
begin
  FValue := Value;
end;

//  NFloat
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NInteger

procedure NInteger.Set_Value(Value: Integer);
begin
  FValue := Value;
end;

//  NInteger
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NBoolean

procedure NBoolean.Set_Value(Value: Boolean);
begin
  FValue := Value;
end;

//  NBoolean
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  NHeader

constructor NHeader.Create;
begin
  inherited Create;
	FObject := nil;
end;

destructor NHeader.Destroy;
begin
	if FObject <> nil then begin
		FObject.Free;
		FObject := nil;
	end;
	inherited;
end;

procedure NHeader.Set_Object(Value: NObject);
begin
  if FObject <> Value then begin
    FObject := Value;
  end;
end;

//  NHeader
/////////////////////////////////////////////////////////////////////////////


end.
