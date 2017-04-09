unit PropEdt;

{ ****************************************************************************** }
{ }
{ StarUML - The Open Source UML/MDA Platform. }
{ }
{ Copyright (C) 2002-2005 - Plastic Software, Inc. }
{ }
{ }
{ This program is free software; you can redistribute it and/or modify it }
{ under the terms of the GNU General Public License as published by the Free }
{ Software Foundation; either version 2 of the License, or (at your option) }
{ any later version. }
{ }
{ This program is distributed in the hope that it will be useful, but WITHOUT }
{ ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or }
{ FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for }
{ more details. }
{ }
{ You should have received a copy of the GNU General Public License along with }
{ this program; if not, write to the Free Software Foundation, Inc., 51 }
{ Franklin St, Fifth Floor, Boston, MA 02110-1301 USA }
{ }
{ Linking StarUML statically or dynamically with other modules is making a }
{ combined work based on StarUML. Thus, the terms and conditions of the GNU }
{ General Public License cover the whole combination. }
{ }
{ In addition, as a special exception, Plastic Software give you permission to }
{ combine StarUML program with free software programs or libraries that are }
{ released under the GNU LGPL/Mozilla/Apache/BSD and with code included in the }
{ standard release of ExpressBar, ExpressNavBar, ExpressInspector, }
{ ExpressPageControl, ProGrammar, NextGrid under the commercial license (or }
{ modified versions of such code, with unchanged license). You may copy and }
{ distribute such a system following the terms of the GNU GPL for StarUML and }
{ the licenses of the other code concerned, provided that you include the }
{ source code of that other code when and as the GNU GPL requires distribution }
{ of source code. Plastic Software also give you permission to combine StarUML }
{ program with dynamically linking plug-in (or add-in) programs that are }
{ released under the GPL-incompatible and proprietary license. }
{ }
{ Note that people who make modified versions of StarUML are not obligated to }
{ grant this special exception for their modified versions; it is their choice }
{ whether to do so. The GNU General Public License gives permission to release }
{ a modified version without this exception; this exception also makes it }
{ possible to release a modified version which carries forward this exception. }
{ ****************************************************************************** }

// =============================================================================
//
// GUI component development notice
// --------------------------------
//
// (1) GUI component is inherited from TCustomPanel.
// (2) The visibility of OnEnter and OnExit Events is public.
// (3) catch OnEnter, OnExit Events of controls contained in GUI component,
// let self to fire OnEnter, OnExit events
// (4) set BevelInner, BevelOuter to 'bvNone'
//
// =============================================================================

interface

uses
  BasicClasses, Core, Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, ImgList, ExtCtrls, FlatPanel, Generics.Collections;

type
  // Forward Declarations;
  TPropertyEditor = class;

  // PRowKind
  PRowKind = (
  rkTextRow, //  row for the editing and display of text information
  rkTextButtonRow, // text with a button
  rkChoiceRow, // image + text combo choice
  rkCheckRow, //  row with a check box, shows boolean values
  rkTextChoiceRow // combo box as an inplace editor
  );

  // Events
  PPropertySelectedEvent = procedure(Sender: TObject;
    PropertyName: string) of object;


  // PProperty
  // Representation of a property as a pair of strings Key - RowItemValues
  PProperty = class
  public
    Key: string; // Property key
    Category: string; // Property category (group)
    Caption: string;  // Property caption, related to key
    RowKind: PRowKind; // Property kind -> PRowKind
    RowEditable: Boolean;
    IsUnique: Boolean;
    OnlyTheSameKind: Boolean;
    ImageIndex: Integer; // Index of image in RowImageList shown with Property Caption
    Locked: Boolean;
    RowItemValues: TStrings; // Property values
    RowItemImages: TImageList; // Images associated with Property values
    RowItemImageIndexes: TStrings;
    constructor Create(AKey, ACategory, ACaption: string; ARowKind: PRowKind);
    destructor Destroy; override;
  end;

  TPropertyList = TList<PProperty>;

  // PPropertySpecifier
  // Container and factory used to create, store
  // and pass through function calls properties (PProperty)
  PPropertySpecifier = class
  private
    FProperties: TPropertyList;
    function GetProperty(Index: Integer): PProperty;
    function GetPropertyCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    // Drop properties references without destroying them
    procedure ClearProperties;

    // Destroy contained properties
    procedure EmptyProperties;

    // Check for the presence of a property with given key
    function ContainsProperty(AKey: string): Boolean;

    // Creates a property and adds it to the container
    function DefineProperty(AKey, ACategory, ACaption: string;
      ARowKind: PRowKind): PProperty;

    // Access to properties by index
    /// <link>aggregation</link>
    property Properties[Index: Integer]: PProperty read GetProperty;
    property PropertyCount: Integer read GetPropertyCount;
  end;

  // PAbstractPropertyAdaptor
  PAbstractPropertyAdaptor = class abstract
  private
    FPropertyEditor: TPropertyEditor;
  protected
    FReadOnly: Boolean;
  public
    // Get properties related to given element
    procedure SpecifyProperties(AElement: PElement;
      APropertySpecifier: PPropertySpecifier); virtual; abstract;
    function GetPropertyValue(AElement: PElement; Key: string): string;
      virtual; abstract;
    procedure SetPropertyValue(AElementSet: PElementOrderedSet; Key: string;
      Value: string); virtual; abstract;
    procedure PropertyButtonClicked(AElementSet: PElementOrderedSet; Key: string);
      virtual; abstract;
    property ReadOnly: Boolean read FReadOnly;
    property PropertyEditor: TPropertyEditor read FPropertyEditor;
  end;

  TPropertyEditor = class (TFrame)
    RowImageList: TImageList;
    AggregationImageList: TImageList;
    VisibilityImageList: TImageList;
    ClientPanel: TFlatPanel;
    PsedostatsImageList: TImageList;
    ActionKindImageList: TImageList;
  private
    FInspectingElementsModified: Boolean;

    procedure SetReadOnly(Value: Boolean);
    function GetInspectingElement(Index: Integer): PElement;
    function GetInspectingElementCount: Integer;
    procedure SetPropertyAdaptor(Value: PAbstractPropertyAdaptor);
    procedure EmptyPropertyList;
    procedure CollectProperties;
    procedure IntersectWithProperties(APropertySpecifier: PPropertySpecifier;
      IsDiffKind: Boolean);

  protected
    PropertyList: TPropertyList;
    FReadOnly: Boolean;
    FPropertyAdaptor: PAbstractPropertyAdaptor;
    FInspectingElements: PElementOrderedSet;
    FOnPropertySelected: PPropertySelectedEvent;

    // Setup Inspector rows basing on properties stored in PropertyList
    procedure SetupRows; virtual; abstract;

    procedure SetEnabled(Value: Boolean); override; abstract;

    // Utilities

  // If there is more than one inspecting (inspected?) element
  // and if they have different values for the same property with given key
  // property's value is returned as empty string ('')
  // otherwise as the actual one
  function MixPropertyValue(AKey: string): string;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ClearInspectingElements;
    procedure AddInspectingElement(AElement: PElement);
    procedure RemoveInspectingElement(AElement: PElement);
    procedure InspectElements;

    // Initialization of main form completed
    procedure MainFormReady; virtual; abstract;

    // Fetch values of existing properties using PropertyAdaptor.GetPropertyValue
    procedure UpdateProperties; virtual; abstract;

    // Commit changes
    procedure ApplyChanges; virtual; abstract;

    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property InspectingElements[Index: Integer]
      : PElement read GetInspectingElement;
    property InspectingElementCount: Integer read GetInspectingElementCount;
    property PropertyAdaptor
      : PAbstractPropertyAdaptor read FPropertyAdaptor write
      SetPropertyAdaptor;
    property OnPropertySelected
      : PPropertySelectedEvent read FOnPropertySelected
      write FOnPropertySelected;
  end;

implementation

{$R *.dfm}


/// /////////////////////////////////////////////////////////////////////////////
// PProperty

constructor PProperty.Create(AKey, ACategory, ACaption: string;
  ARowKind: PRowKind);
begin
  Key := AKey;
  Category := ACategory;
  Caption := ACaption;
  RowKind := ARowKind;
  RowEditable := True;
  IsUnique := False;
  OnlyTheSameKind := False;
  ImageIndex := -1;
  RowItemValues := TStringList.Create;
  RowItemImageIndexes := TStringList.Create;
end;

destructor PProperty.Destroy;
begin
  RowItemValues.Free;
  RowItemValues := nil;
  RowItemImageIndexes.Free;
  RowItemImageIndexes := nil;
  inherited;
end;

// PProperty
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PPropertySpecifier

constructor PPropertySpecifier.Create;
begin
  inherited;
  FProperties := TPropertyList.Create;
end;

destructor PPropertySpecifier.Destroy;
begin
  EmptyProperties;
  inherited;
end;

function PPropertySpecifier.GetProperty(Index: Integer): PProperty;
begin
  Result := FProperties[Index];
end;

function PPropertySpecifier.GetPropertyCount: Integer;
begin
  Result := FProperties.Count;
end;

procedure PPropertySpecifier.ClearProperties;
begin
  FProperties.Clear;
end;

procedure PPropertySpecifier.EmptyProperties;
var
  P: PProperty;
begin
  for P in FProperties do
    P.Free;
  FProperties.Clear;
end;

function PPropertySpecifier.ContainsProperty(AKey: string): Boolean;
var
  P: PProperty;
begin
  for P in FProperties do
  begin
    if P.Key = AKey then
    begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

function PPropertySpecifier.DefineProperty(AKey, ACategory, ACaption: string;
  ARowKind: PRowKind): PProperty;
var
  P: PProperty;
begin
  P := PProperty.Create(AKey, ACategory, ACaption, ARowKind);
  FProperties.Add(P);
  Result := P;
end;

// PPropertySpecifier
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// TPropertyEditor

constructor TPropertyEditor.Create(AOwner: TComponent);
begin
  inherited;
  PropertyList := TPropertyList.Create;
  FInspectingElements := PElementOrderedSet.Create;

end;

destructor TPropertyEditor.Destroy;
begin
  EmptyPropertyList;
  PropertyList.Free;
  PropertyList := nil;
  FInspectingElements.Free;
  FInspectingElements := nil;
  inherited;
end;

procedure TPropertyEditor.SetReadOnly(Value: Boolean);
begin
  FReadOnly := Value;
  FPropertyAdaptor.FReadOnly := Value;
  InspectElements;
end;

function TPropertyEditor.GetInspectingElement(Index: Integer): PElement;
begin
  Result := FInspectingElements[Index] as PElement;
end;

function TPropertyEditor.GetInspectingElementCount: Integer;
begin
  Result := FInspectingElements.Count;
end;

procedure TPropertyEditor.SetPropertyAdaptor(Value: PAbstractPropertyAdaptor);
begin
  if FPropertyAdaptor <> Value then
  begin
    if FPropertyAdaptor <> nil then
      FPropertyAdaptor.FPropertyEditor := nil;
    FPropertyAdaptor := Value;
    if FPropertyAdaptor <> nil then
      FPropertyAdaptor.FPropertyEditor := Self;
  end;
end;

procedure TPropertyEditor.EmptyPropertyList;
var
  P: PProperty;
begin
  for P in PropertyList do
    P.Free;
  PropertyList.Clear;
end;

procedure TPropertyEditor.CollectProperties;
var
  I: Integer;
  IsDiffKind: Boolean; // True, if given two elements are qualified as of different kind
  FirstElement: PElement;
  NextElement: PElement;
  PropertySpecifier: PPropertySpecifier;

begin
  PropertySpecifier := nil;
  EmptyPropertyList;
  // Inspecting single element
  if FInspectingElements.Count >= 1 then
  begin
    PropertySpecifier := PPropertySpecifier.Create;
    FirstElement := FInspectingElements[0] as PElement;
    PropertyAdaptor.SpecifyProperties(FirstElement, PropertySpecifier);
    PropertyList.AddRange(PropertySpecifier.FProperties);
    PropertySpecifier.ClearProperties;

    // Inspecting multiple elements
    if InspectingElementCount > 1 then
    begin
      // Intersect properties of first element with that of consequent elements
      IsDiffKind := False;
      // Check properties for every other element in FInspectingElements
      for I := 1 to FInspectingElements.Count - 1 do
      begin
        NextElement := FInspectingElements[I] as PElement;
        // Check for kind reliationship basing on PElement.MetaClass attribute
        // with first element properties
        IsDiffKind := IsDiffKind or
          (NextElement.MetaClass.Name <> FirstElement.MetaClass.Name);

        PropertySpecifier.EmptyProperties;
        PropertyAdaptor.SpecifyProperties(NextElement, PropertySpecifier);

        // Show only common properties
        IntersectWithProperties(PropertySpecifier, IsDiffKind);
      end;
    end;
  end;
  PropertySpecifier.Free;
end;

procedure TPropertyEditor.IntersectWithProperties(APropertySpecifier: PPropertySpecifier;
  IsDiffKind: Boolean);
var
  I: Integer;
  P: PProperty;
begin
  //for P in PropertyList do
  for I := PropertyList.Count - 1 downto 0 do // Reverse iteration needed to remove items from the end
  begin
    // Remove property from PropertyList if:
    // is not present in the given property specifier list
    // or is unique
    // or is of a different MetaClass kind and only the same kind is accepted
    P := PropertyList.Items[I];
    if (not APropertySpecifier.ContainsProperty(P.Key)) or P.IsUnique or
      (IsDiffKind and P.OnlyTheSameKind) then
    begin
      PropertyList.Delete(I);
      P.Free;
    end;
  end;
end;

procedure TPropertyEditor.ClearInspectingElements;
begin
  FInspectingElements.Clear;
  FInspectingElementsModified := True;
end;

procedure TPropertyEditor.AddInspectingElement(AElement: PElement);
begin
  FInspectingElements.Add(AElement);
  FInspectingElementsModified := True;
end;

procedure TPropertyEditor.RemoveInspectingElement(AElement: PElement);
begin
  FInspectingElements.Remove(AElement);
  FInspectingElementsModified := True;
end;

procedure TPropertyEditor.InspectElements;
begin
  if FInspectingElementsModified then begin
    CollectProperties;
    SetupRows;
    UpdateProperties;
    FInspectingElementsModified := False;
  end;
end;

// If there is more than one inspecting (inspected?) element
// and if they have different values for the same property with given key
// property's value is returned as empty string ('')
// otherwise as the actual one
function TPropertyEditor.MixPropertyValue(AKey: string): string;
var
  J: Integer;
  E: PElement;
  S: string;
begin
  E := FInspectingElements[0] as PElement;
  S := PropertyAdaptor.GetPropertyValue(E, AKey);
  for J := 1 to FInspectingElements.Count - 1 do
  begin
    E := FInspectingElements[J] as PElement;
    if S <> PropertyAdaptor.GetPropertyValue(E, AKey) then
    begin
      Result := '';
      Exit;
    end;
  end;
  Result := S;
end;


// TPropertyEditor
/// /////////////////////////////////////////////////////////////////////////////

end.
