unit UMLProps;

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
  BasicClasses, Core, PropEdt,
  Controls;

type
  // Event Types
  PNameChangeEvent = procedure(Sender: TObject; Element: PElement; Name: string) of object;
  PElementsStereotypeChangeEvent = procedure(Sender: TObject; ElementSet: POrderedSet; StereotypeProfile: string; Stereotype: string) of object;
  PAttributeChangeEvent = procedure(Sender: TObject; Element: PElement; Key, Value: string) of object;
  PElementsAttributeChangeEvent = procedure(Sender: TObject; ElementSet: POrderedSet; Key, Value: string) of object;
  PReferenceChangeEvent = procedure(Sender: TObject; Element: PElement; Key: string; Value: PElement) of object;
  PTypeExpressionChangeEvent = procedure(Sender: TObject; Element: PElement; Key, TypeExpr: string; TypeRef: PElement) of object;
  PValueExpressionChangeEvent = procedure(Sender: TObject; Element: PElement; Key, ValueExpr: string; ValueRef: PElement) of object;
  PCollectionEditEvent = procedure(Sender: TObject; Element: PElement; Key: string) of object;
  PActionKindChangeEvent = procedure(Sender: TObject; Element: PElement; ActionKind: string) of object;

  // PUMLPropertyAdaptor
  PUMLPropertyAdaptor = class(PAbstractPropertyAdaptor)
  private
    TempSet: POrderedSet;
    FVisibilityKindImages: TImageList;
    FAggregationKindImages: TImageList;
    FPseudostaateKindImages: TImageList;
    FActionKindImages: TImageList;
    FOnNameChange: PNameChangeEvent;
    FOnElementsStereotypeChange: PElementsStereotypeChangeEvent;
    FOnAttributeChange: PAttributeChangeEvent;
    FOnElementsAttributeChange: PElementsAttributeChangeEvent;
    FOnReferenceChange: PReferenceChangeEvent;
    FOnTypeExpressionChange: PTypeExpressionChangeEvent;
    FOnValueExpressionChange: PValueExpressionChangeEvent;
    FOnCollectionEdit: PCollectionEditEvent;
    FOnActionKindChange: PActionKindChangeEvent;
    procedure NameChange(Element: PElement; Name: string);
    procedure ElementsStereotypeChange(ElementSet: POrderedSet; StereotypeProfile: string; Stereotype: string);
    procedure AttributeChange(Element: PElement; Key, Value: string);
    procedure ElementsAttributeChange(ElementSet: POrderedSet; Key, Value: string);
    procedure ReferenceChange(Element: PElement; Key: string; Value: PElement);
    procedure TypeExpressionChange(Element: PElement; Key, TypeExpr: string; TypeRef: PElement);
    procedure ValueExpressionChange(Element: PElement; Key, ValueExpr: string; ValueRef: PElement);
    procedure ActionKindChange(Element: PElement; ActionKind: string);
    procedure CollectionEdit(Element: PElement; Key: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure SpecifyProperties(AElement: PElement; APropertySpecifier: PPropertySpecifier); override;
    function GetPropertyValue(AElement: PElement; Key: string): string; override;
    procedure SetPropertyValue(AElementSet: POrderedSet; Key: string; Value: string); override;
    procedure PropertyButtonClicked(AElementSet: POrderedSet; Key: string); override;
    property VisibilityKindImages: TImageList write FVisibilityKindImages;
    property AggregationKindImages: TImageList write FAggregationKindImages;
    property PseudostaateKindImages: TImageList write FPseudostaateKindImages;
    property ActionKindImages: TImageList write FActionKindImages;
    property OnNameChange: PNameChangeEvent read FOnNameChange write FOnNameChange;
    property OnElementsStereotypeChange: PElementsStereotypeChangeEvent read FOnElementsStereotypeChange write FOnElementsStereotypeChange;
    property OnAttributeChange: PAttributeChangeEvent read FOnAttributeChange write FOnAttributeChange;
    property OnElementsAttributeChange: PElementsAttributeChangeEvent read FOnElementsAttributeChange write FOnElementsAttributeChange;
    property OnReferenceChange: PReferenceChangeEvent read FOnReferenceChange write FOnReferenceChange;
    property OnTypeExpressionChange: PTypeExpressionChangeEvent read FOnTypeExpressionChange write FOnTypeExpressionChange;
    property OnValueExpressionChange: PValueExpressionChangeEvent read FOnValueExpressionChange write FOnValueExpressionChange;
    property OnCollectionEdit: PCollectionEditEvent read FOnCollectionEdit write FOnCollectionEdit;
    property OnActionKindChange: PActionKindChangeEvent read FOnActionKindChange write FOnActionKindChange;
  end;

implementation

uses
  ExtCore, UMLModels, ModelExplorerFrame, ElemSelFrm, ElemLstFrm, StereoSelFrm,
  NLS_StarUML,
  SysUtils;

const
  GENERAL_ROW_IMAGEINDEX = 0;
  NONEDITABLE_ROW_IMAGEINDEX = 1;
  CHOICE_ROW_IMAGEINDEX = 2;
  COLLECTION_ROW_IMAGEINDEX = 3;

////////////////////////////////////////////////////////////////////////////////
// PUMLPropertyAdaptor

procedure PUMLPropertyAdaptor.NameChange(Element: PElement; Name: string);
begin
  if Assigned(FOnNameChange) then
    FOnNameChange(Self, Element, Name);
end;

procedure PUMLPropertyAdaptor.ElementsStereotypeChange(ElementSet: POrderedSet; StereotypeProfile: string; Stereotype: string);
begin
  if Assigned(FOnElementsStereotypeChange) then
    FOnElementsStereotypeChange(Self, ElementSet, StereotypeProfile, Stereotype);
end;

procedure PUMLPropertyAdaptor.AttributeChange(Element: PElement; Key, Value: string);
begin
  if Assigned(FOnAttributeChange) then
    FOnAttributeChange(Self, Element, Key, Value);
end;

procedure PUMLPropertyAdaptor.ElementsAttributeChange(ElementSet: POrderedSet; Key, Value: string);
begin
  if Assigned(FOnElementsAttributeChange) then
    FOnElementsAttributeChange(Self, ElementSet, Key, Value);
end;

procedure PUMLPropertyAdaptor.ReferenceChange(Element: PElement; Key: string; Value: PElement);
begin
  if Assigned(FOnReferenceChange) then
    FOnReferenceChange(Self, Element, Key, Value);
end;

procedure PUMLPropertyAdaptor.TypeExpressionChange(Element: PElement; Key, TypeExpr: string; TypeRef: PElement);
begin
  if Assigned(FOnTypeExpressionChange) then
    FOnTypeExpressionChange(Self, Element, Key, TypeExpr, TypeRef);
end;

procedure PUMLPropertyAdaptor.ValueExpressionChange(Element: PElement; Key, ValueExpr: string; ValueRef: PElement);
begin
  if Assigned(FOnValueExpressionChange) then
    FOnValueExpressionChange(Self, Element, Key, ValueExpr, ValueRef);
end;

procedure PUMLPropertyAdaptor.ActionKindChange(Element: PElement; ActionKind: string);
begin
  if Assigned(FOnActionKindChange) then
    FOnActionKindChange(Self, Element, ActionKind);
end;

procedure PUMLPropertyAdaptor.CollectionEdit(Element: PElement; Key: string);
begin
  if Assigned(FOnCollectionEdit) then
    FOnCollectionEdit(Self, Element, Key);
end;

constructor PUMLPropertyAdaptor.Create;
begin
  inherited;
  TempSet := POrderedSet.Create;
end;

destructor PUMLPropertyAdaptor.Destroy;
begin
  TempSet.Free;
  inherited;
end;

procedure PUMLPropertyAdaptor.SpecifyProperties(AElement: PElement; APropertySpecifier: PPropertySpecifier);
var
  ElementName: string;
  P: PProperty;

  procedure DefineNameProperty(Key, Category, Caption: string);
  begin
    P := APropertySpecifier.DefineProperty(Key, Category, Caption, rkTextRow);
    P.IsUnique := True;
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end;

  procedure DefineVisibilityProperty(Key, Category, Caption: string; IsUnique: Boolean);
  begin
    P := APropertySpecifier.DefineProperty(Key, Category, Caption, rkChoiceRow);
    P.RowEditable := False;
    P.RowItemValues.Add('PUBLIC');
    P.RowItemValues.Add('PROTECTED');
    P.RowItemValues.Add('PRIVATE');
    P.RowItemValues.Add('PACKAGE');
    P.IsUnique := IsUnique;
    P.ImageIndex := CHOICE_ROW_IMAGEINDEX;
    P.RowItemImages := FVisibilityKindImages;
  end;

  procedure DefineAggregationProperty(Key, Category, Caption: string; IsUnique: Boolean);
  begin
    P := APropertySpecifier.DefineProperty(Key, Category, Caption, rkChoiceRow);
    P.RowEditable := False;
    P.RowItemValues.Add('NONE');
    P.RowItemValues.Add('AGGREGATE');
    P.RowItemValues.Add('COMPOSITE');
    P.IsUnique := IsUnique;
    P.ImageIndex := CHOICE_ROW_IMAGEINDEX;
    P.RowItemImages := FAggregationKindImages;
  end;

  procedure DefineChangeabilityProperty(Key, Category, Caption: string; IsUnique: Boolean);
  begin
    P := APropertySpecifier.DefineProperty(Key, Category, Caption, rkChoiceRow);
    P.RowEditable := False;
    P.RowItemValues.Add('CHANGEABLE');
    P.RowItemValues.Add('FROZEN');
    P.RowItemValues.Add('ADDONLY');
    P.IsUnique := IsUnique;
    P.ImageIndex := CHOICE_ROW_IMAGEINDEX;
  end;

  procedure DefineScopeKindProperty(Key, Category, Caption: string; IsUnique: Boolean);
  begin
    P := APropertySpecifier.DefineProperty(Key, Category, Caption, rkChoiceRow);
    P.RowEditable := False;
    P.RowItemValues.Add('INSTANCE');
    P.RowItemValues.Add('CLASSIFIER');
    P.IsUnique := IsUnique;
    P.ImageIndex := CHOICE_ROW_IMAGEINDEX;
  end;

  procedure DefineOrderingProperty(Key, Category, Caption: string; IsUnique: Boolean);
  begin
    P := APropertySpecifier.DefineProperty(Key, Category, Caption, rkChoiceRow);
    P.RowEditable := False;
    P.RowItemValues.Add('UNORDERED');
    P.RowItemValues.Add('ORDERED');
    P.IsUnique := IsUnique;
    P.ImageIndex := CHOICE_ROW_IMAGEINDEX;
  end;

  procedure DefineMultiplicityProperty(Key, Category, Caption: string; IsUnique: Boolean);
  begin
    P := APropertySpecifier.DefineProperty(Key, Category, Caption, rkTextChoiceRow);
    P.RowItemValues.Add('0..1');
    P.RowItemValues.Add('1');
    P.RowItemValues.Add('0..*');
    P.RowItemValues.Add('1..*');
    P.RowItemValues.Add('*');
    P.IsUnique := IsUnique;
    P.ImageIndex := CHOICE_ROW_IMAGEINDEX;
  end;

  procedure DefineAttributesProperty;
  begin
    P := APropertySpecifier.DefineProperty('Attributes', 'General', 'Attributes', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
  end;

  procedure DefineOperationsProperty;
  begin
    P := APropertySpecifier.DefineProperty('Operations', 'General', 'Operations', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
  end;

  procedure DefineTemplateParametersProperty;
  begin
    P := APropertySpecifier.DefineProperty('TemplateParameters', 'Detail', 'TemplateParameters', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
  end;

  procedure DefineConcurrencyProperty;
  begin
    P := APropertySpecifier.DefineProperty('Concurrency', 'Detail', 'Concurrency', rkChoiceRow);
    P.RowEditable := False;
    P.RowItemValues.Add('SEQUENTIAL');
    P.RowItemValues.Add('GUARDED');
    P.RowItemValues.Add('CONCURRENT');
    P.ImageIndex := CHOICE_ROW_IMAGEINDEX;
  end;

  procedure DefineDirectionKindProperty;
  begin
    P := APropertySpecifier.DefineProperty('DirectionKind', 'Detail', 'DirectionKind', rkChoiceRow);
    P.RowEditable := False;
    P.RowItemValues.Add('IN');
    P.RowItemValues.Add('INOUT');
    P.RowItemValues.Add('OUT');
    P.RowItemValues.Add('RETURN');
    P.ImageIndex := CHOICE_ROW_IMAGEINDEX;
  end;

  procedure DefinePseudostateKindProperty;
  begin
    P := APropertySpecifier.DefineProperty('PseudostateKind', 'Detail', 'PseudostateKind', rkChoiceRow);
    P.RowEditable := False;
    P.RowItemValues.Add('DECISION');
    P.RowItemValues.Add('INITIAL');
    P.RowItemValues.Add('SYNCHRONIZATION');
    P.RowItemValues.Add('JUNCTION');
    P.RowItemValues.Add('CHOICE');
    P.RowItemValues.Add('SHALLOWHISTORY');
    P.RowItemValues.Add('DEEPHISTORY');
    P.ImageIndex := CHOICE_ROW_IMAGEINDEX;
    P.RowItemImages := FPseudostaateKindImages;
  end;

  procedure DefineParameterTypeProperty;
  begin
    P := APropertySpecifier.DefineProperty('ParameterType', 'General', 'ParameterType', rkTextChoiceRow);
    P.RowEditable := True;
    P.RowItemValues.Add('Integer');
    P.RowItemValues.Add('Boolean');
    P.RowItemValues.Add('Real');
    P.RowItemValues.Add('String');
    P.RowItemValues.Add('Package');
    P.RowItemValues.Add('Class');
    P.RowItemValues.Add('Interface');
    P.RowItemValues.Add('Attribute');
    P.RowItemValues.Add('Operation');
    P.ImageIndex := CHOICE_ROW_IMAGEINDEX;
  end;

  procedure DefineActionKindProperty(Key, Category, Caption: string);
  begin
    P := APropertySpecifier.DefineProperty(Key, Category, Caption, rkChoiceRow);
    P.RowEditable := False;
    P.RowItemValues.Add('CALL');
    P.RowItemValues.Add('SEND');
    P.RowItemValues.Add('RETURN');
    P.RowItemValues.Add('CREATE');
    P.RowItemValues.Add('DESTROY');
    P.ImageIndex := CHOICE_ROW_IMAGEINDEX;
    P.RowItemImages := FActionKindImages;
    P.RowItemImageIndexes.Add('0');
    P.RowItemImageIndexes.Add('1');
    P.RowItemImageIndexes.Add('2');
    P.RowItemImageIndexes.Add('3');
    P.RowItemImageIndexes.Add('4');
  end;

  procedure DefineMessageSignatureKindProperty;
  begin
    P := APropertySpecifier.DefineProperty('MessageSignature', 'Detail', 'MessageSignature', rkChoiceRow);
    P.RowEditable := False;
    P.RowItemValues.Add('NONE');
    P.RowItemValues.Add('TYPEONLY');
    P.RowItemValues.Add('NAMEONLY');
    P.RowItemValues.Add('NAMEANDTYPE');
    P.ImageIndex := CHOICE_ROW_IMAGEINDEX;
  end;

  procedure DefineDefaultDiagramProperty;
  begin
    P := APropertySpecifier.DefineProperty('DefaultDiagram', 'General', 'DefaultDiagram', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end;

  procedure DefineInteractionOperatorKindProperty;
  begin
    P := APropertySpecifier.DefineProperty('InteractionOperator', 'General', 'InteractionOperator', rkChoiceRow);
    P.RowEditable := False;
    P.RowItemValues.Add('seq');
    P.RowItemValues.Add('alt');
    P.RowItemValues.Add('opt');
    P.RowItemValues.Add('break');
    P.RowItemValues.Add('par');
    P.RowItemValues.Add('strict');
    P.RowItemValues.Add('loop');
    P.RowItemValues.Add('region');
    P.RowItemValues.Add('neg');
    P.RowItemValues.Add('assert');
    P.RowItemValues.Add('ignore');
    P.RowItemValues.Add('consider');
    P.ImageIndex := CHOICE_ROW_IMAGEINDEX;
  end;

  procedure SpecifyPropertiesOfModelElement;
  begin
    DefineNameProperty('Name', 'General', 'Name');
    P := APropertySpecifier.DefineProperty('Stereotype', 'General', 'Stereotype', rkTextButtonRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P.OnlyTheSameKind := True;
    DefineVisibilityProperty('Visibility', 'General', 'Visibility', False);
    P := APropertySpecifier.DefineProperty('IsSpecification', 'Detail', 'IsSpecification', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end;

  procedure SpecifyPropertiesOfGeneralizableElement;
  begin
    P := APropertySpecifier.DefineProperty('IsAbstract', 'General', 'IsAbstract', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('IsRoot', 'Detail', 'IsRoot', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('IsLeaf', 'Detail', 'IsLeaf', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end;

  procedure SpecifyPropertiesOfInstance;
  begin
    P := APropertySpecifier.DefineProperty('Classifier', 'General', 'Classifier', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Slots', 'General', 'Slots', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('IsMultiInstance', 'Detail', 'IsMultiInstance', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end;

  procedure SpecifyPropertiesOfState;
  begin
    P := APropertySpecifier.DefineProperty('EntryActions', 'General', 'EntryActions', rkTextButtonRow);
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
    P.RowEditable := False;
    P.IsUnique := True;
    P := APropertySpecifier.DefineProperty('DoActions', 'General', 'DoActions', rkTextButtonRow);
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
    P.RowEditable := False;
    P.IsUnique := True;
    P := APropertySpecifier.DefineProperty('ExitActions', 'General', 'ExitActions', rkTextButtonRow);
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
    P.RowEditable := False;
    P.IsUnique := True;
  end;

  procedure SpecifyPropertiesOfCompositeState;
  begin
    P := APropertySpecifier.DefineProperty('IsConcurrent', 'Detail', 'IsConcurrent', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end;

  procedure SpecifyPropertiesOfActionState;
  begin
    P := APropertySpecifier.DefineProperty('IsDynamic', 'Detail', 'IsDynamic', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('DynamicArguments', 'Detail', 'DynamicArguments', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    DefineMultiplicityProperty('DynamicMultiplicity', 'Detail', 'DynamicMultiplicity', False);
  end;

  procedure SpecifyPropertiesOfAssociation;
  begin
    DefineNameProperty('End1.Name', 'General (End1)', 'End1.Name');
    DefineVisibilityProperty('End1.Visibility', 'General (End1)', 'End1.Visibility', True);
    P := APropertySpecifier.DefineProperty('End1.IsNavigable', 'General (End1)', 'End1.IsNavigable', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P.IsUnique := True;
    DefineAggregationProperty('End1.Aggregation', 'General (End1)', 'End1.Aggregation', True);
    DefineMultiplicityProperty('End1.Multiplicity', 'General (End1)', 'End1.Multiplicity', True);
    P := APropertySpecifier.DefineProperty('End1.Participant', 'General (End1)', 'End1.Participant', rkTextRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;

    DefineNameProperty('End2.Name', 'General (End2)', 'End2.Name');
    DefineVisibilityProperty('End2.Visibility', 'General (End2)', 'End2.Visibility', True);
    P := APropertySpecifier.DefineProperty('End2.IsNavigable', 'General (End2)', 'End2.IsNavigable', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P.IsUnique := True;
    DefineAggregationProperty('End2.Aggregation', 'General (End2)', 'End2.Aggregation', True);
    DefineMultiplicityProperty('End2.Multiplicity', 'General (End2)', 'End2.Multiplicity', True);
    P := APropertySpecifier.DefineProperty('End2.Participant', 'General (End2)', 'End2.Participant', rkTextRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;

    DefineOrderingProperty('End1.Ordering', 'Detail (End1)', 'End1.Ordering', True);
    DefineScopeKindProperty('End1.TargetScope', 'Detail (End1)', 'End1.TargetScope', True);
    DefineChangeabilityProperty('End1.Changeability', 'Detail (End1)', 'End1.Changeability', True);
    P := APropertySpecifier.DefineProperty('End1.Qualifiers', 'Detail (End1)', 'End1.Qualifiers', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;

    DefineOrderingProperty('End2.Ordering', 'Detail (End2)', 'End2.Ordering', True);
    DefineScopeKindProperty('End2.TargetScope', 'Detail (End2)', 'End2.TargetScope', True);
    DefineChangeabilityProperty('End2.Changeability', 'Detail (End2)', 'End2.Changeability', True);
    P := APropertySpecifier.DefineProperty('End2.Qualifiers', 'Detail (End2)', 'End2.Qualifiers', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
  end;

  procedure SpecifyPropertiesOfLink;
  begin
    DefineNameProperty('End1.Name', 'General (End1)', 'End1.Name');
    DefineVisibilityProperty('End1.Visibility', 'General (End1)', 'End1.Visibility', True);

    DefineNameProperty('End2.Name', 'General (End2)', 'End2.Name');
    DefineVisibilityProperty('End2.Visibility', 'General (End2)', 'End2.Visibility', True);
  end;

  procedure SpecifyPropertiesOfDependency;
  begin
    P := APropertySpecifier.DefineProperty('Client', 'General', 'Client', rkTextRow);
    P.RowEditable := False;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Supplier', 'General', 'Supplier', rkTextRow);
    P.RowEditable := False;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Mapping', 'Detail', 'Mapping', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end;

  procedure SpecifyPropertiesOfAssociationEnd;
  begin
    P := APropertySpecifier.DefineProperty('IsNavigable', 'General ', 'IsNavigable', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    DefineAggregationProperty('Aggregation', 'General ', 'Aggregation', False);
    DefineMultiplicityProperty('Multiplicity', 'General ', 'Multiplicity', False);
    P := APropertySpecifier.DefineProperty('Participant', 'General ', 'Participant', rkTextRow);
    P.RowEditable := False;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
    DefineOrderingProperty('Ordering', 'Detail ', 'Ordering', False);

    DefineScopeKindProperty('TargetScope', 'Detail ', 'TargetScope', False);
    DefineChangeabilityProperty('Changeability', 'Detail ', 'Changeability', False);
    P := APropertySpecifier.DefineProperty('Qualifiers', 'Detail ', 'Qualifiers', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
  end;

  procedure SpecifyPropertiesOfAction;
  begin
    P := APropertySpecifier.DefineProperty('Target', 'Detail', 'Target', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('IsAsynchronous', 'Detail', 'IsAsynchronous', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Script', 'Detail', 'Script', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end;

  procedure SpecifyPropertiesOfMessage;
  begin
    DefineActionKindProperty('ActionKind', 'General', 'ActionKind');
    P := APropertySpecifier.DefineProperty('Arguments', 'Detail', 'Arguments', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Return', 'Detail', 'Return', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Iteration', 'Detail', 'Iteration', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Branch', 'Detail', 'Branch', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end;

  procedure SpecifyPropertiesOfDiagram;
  begin
    P := APropertySpecifier.DefineProperty('DiagramType', 'General', 'DiagramType', rkTextRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
  end;

  procedure SpecifyPropertiesOfInteractionDiagram;
  begin
    P := APropertySpecifier.DefineProperty('ShowSequenceNumber', 'Detail', 'ShowSequenceNumber', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    DefineMessageSignatureKindProperty;
  end;

  procedure SpecifyPropertiesOfSequenceDiagram;
  begin
    P := APropertySpecifier.DefineProperty('ShowActivation', 'Detail', 'ShowActivation', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end;

  procedure SpecifyPropertiesOfConnector;
  begin
    DefineNameProperty('End1.Name', 'General (End1)', 'End1.Name');
    DefineVisibilityProperty('End1.Visibility', 'General (End1)', 'End1.Visibility', True);
    DefineMultiplicityProperty('End1.Multiplicity', 'General (End1)', 'End1.Multiplicity', True);
    P := APropertySpecifier.DefineProperty('End1.Role', 'General (End1)', 'End1.Role', rkTextRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;

    DefineNameProperty('End2.Name', 'General (End2)', 'End2.Name');
    DefineVisibilityProperty('End2.Visibility', 'General (End2)', 'End2.Visibility', True);
    DefineMultiplicityProperty('End2.Multiplicity', 'General (End2)', 'End2.Multiplicity', True);
    P := APropertySpecifier.DefineProperty('End2.Role', 'General (End2)', 'End2.Role', rkTextRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;

    P := APropertySpecifier.DefineProperty('End1.IsOrdered', 'Detail (End1)', 'End1.IsOrdered', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('End1.IsUnique', 'Detail (End1)', 'End1.IsUnique', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;

    P := APropertySpecifier.DefineProperty('End2.IsOrdered', 'Detail (End2)', 'End2.IsOrdered', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('End2.IsUnique', 'Detail (End2)', 'End2.IsUnique', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end;

  procedure SpecifyPropertiesOfConnectorEnd;
  begin
    DefineMultiplicityProperty('Multiplicity', 'General', 'Multiplicity', True);
    P := APropertySpecifier.DefineProperty('Role', 'General', 'Role', rkTextRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('IsOrdered', 'Detail', 'IsOrdered', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('IsUnique', 'Detail', 'IsUnique', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end;
  
begin
  ElementName := AElement.MetaClass.Name;
  if ElementName = 'UMLProject' then begin
    P := APropertySpecifier.DefineProperty('Title', 'General', 'Title', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Author', 'General', 'Author', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Company', 'General', 'Company', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Copyright', 'General', 'Copyright', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLModel' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
  end
  else if ElementName = 'UMLSubsystem' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    DefineOperationsProperty;
    P := APropertySpecifier.DefineProperty('IsInstantiable', 'Detail', 'IsInstantiable', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLPackage' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
  end
  else if ElementName = 'UMLClass' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    DefineAttributesProperty;
    DefineOperationsProperty;
    DefineTemplateParametersProperty;
    P := APropertySpecifier.DefineProperty('IsActive', 'Detail', 'IsActive', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLInterface' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    DefineAttributesProperty;
    DefineOperationsProperty;
  end
  else if ElementName = 'UMLEnumeration' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    P := APropertySpecifier.DefineProperty('Literals', 'General', 'Literals', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
    DefineOperationsProperty;
  end
  else if ElementName = 'UMLSignal' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    DefineAttributesProperty;
    DefineOperationsProperty;
  end
  else if ElementName = 'UMLException' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    DefineAttributesProperty;
    DefineOperationsProperty;
  end
  else if ElementName = 'UMLComponent' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    DefineAttributesProperty;
    DefineOperationsProperty;
    P := APropertySpecifier.DefineProperty('Residents', 'General', 'Residents', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLComponentInstance' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfInstance;
  end
  else if ElementName = 'UMLNode' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    DefineAttributesProperty;
    P := APropertySpecifier.DefineProperty('DeployedComponents', 'General', 'DeployedComponents', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('DeployedArtifacts', 'General', 'DeployedArtifacts', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLNodeInstance' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfInstance;
  end
  else if ElementName = 'UMLUseCase' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    DefineAttributesProperty;
    DefineOperationsProperty;
    P := APropertySpecifier.DefineProperty('ExtensionPoints', 'General', 'ExtensionPoints', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLActor' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    DefineAttributesProperty;
    DefineOperationsProperty;
  end
  else if ElementName = 'UMLActivityGraph' then begin
    SpecifyPropertiesOfModelElement;
  end
  else if ElementName = 'UMLStateMachine' then begin
    SpecifyPropertiesOfModelElement;
  end
  else if ElementName = 'UMLCompositeState' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfState;
    SpecifyPropertiesOfCompositeState;
  end
  else if ElementName = 'UMLCollaboration' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    DefineTemplateParametersProperty;
  end
  else if ElementName = 'UMLCollaborationInstanceSet' then begin
    SpecifyPropertiesOfModelElement;
  end
  else if ElementName = 'UMLInteraction' then begin
    SpecifyPropertiesOfModelElement;
  end
  else if ElementName = 'UMLInteractionInstanceSet' then begin
    SpecifyPropertiesOfModelElement;
  end
  else if ElementName = 'UMLActionState' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfState;
    SpecifyPropertiesOfActionState;
  end
  else if ElementName = 'UMLSubactivityState' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfState;
    SpecifyPropertiesOfCompositeState;
    SpecifyPropertiesOfActionState;
    P := APropertySpecifier.DefineProperty('SubMachine', 'General', 'SubMachine', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;    
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLPseudostate' then begin
    SpecifyPropertiesOfModelElement;
    DefinePseudostateKindProperty;
  end
  else if ElementName = 'UMLFinalState' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfState;
  end
  else if ElementName = 'UMLPartition' then begin
    SpecifyPropertiesOfModelElement;
  end
  else if ElementName = 'UMLSubmachineState' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfState;
    SpecifyPropertiesOfCompositeState;
    P := APropertySpecifier.DefineProperty('SubMachine', 'General', 'SubMachine', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLAttribute' then begin
    SpecifyPropertiesOfModelElement;
    P := APropertySpecifier.DefineProperty('Type', 'General', 'Type', rkTextButtonRow);
    P.IsUnique := True;
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('InitialValue', 'General', 'InitialValue', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    DefineChangeabilityProperty('Changeability', 'Detail', 'Changeability', False);
    DefineScopeKindProperty('TargetScope', 'Detail', 'TargetScope', False);
    DefineOrderingProperty('Ordering', 'Detail', 'Ordering', False);
    DefineMultiplicityProperty('Multiplicity', 'Detail', 'Multiplicity', False);
    DefineScopeKindProperty('OwnerScope', 'Detail', 'OwnerScope', False);
  end
  else if ElementName = 'UMLOperation' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    DefineScopeKindProperty('OwnerScope', 'Detail', 'OwnerScope', False);
    P := APropertySpecifier.DefineProperty('Parameters', 'General', 'Parameters', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Specification', 'Detail', 'Specification', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('IsQuery', 'Detail', 'IsQuery', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    DefineConcurrencyProperty;
    P := APropertySpecifier.DefineProperty('RaisedSignals', 'Detail', 'RaisedSignals', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLParameter' then begin
    SpecifyPropertiesOfModelElement;
    P := APropertySpecifier.DefineProperty('Type', 'General', 'Type', rkTextButtonRow);
    P.IsUnique := True;
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('DefaultValue', 'General', 'DefaultValue', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    DefineDirectionKindProperty;
  end
  else if ElementName = 'UMLTemplateParameter' then begin
    DefineNameProperty('Name', 'General', 'Name');
    DefineParameterTypeProperty;
    P := APropertySpecifier.DefineProperty('DefaultValue', 'General', 'DefaultValue', rkTextRow);
    P.IsUnique := True;
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLEnumerationLiteral' then begin
    SpecifyPropertiesOfModelElement;
  end
  else if ElementName = 'UMLTransition' then begin
    SpecifyPropertiesOfModelElement;
    P := APropertySpecifier.DefineProperty('GuardCondition', 'General', 'GuardCondition', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Effects', 'General', 'Effects', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Triggers', 'General', 'Triggers', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := COLLECTION_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLCallAction' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfAction;
    P := APropertySpecifier.DefineProperty('Operation', 'Detail', 'Operation', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLSendAction' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfAction;
    P := APropertySpecifier.DefineProperty('Signal', 'Detail', 'Signal', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLCreateAction' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfAction;
    P := APropertySpecifier.DefineProperty('Instantiation', 'Detail', 'Instantiation', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLDestroyAction' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfAction;
  end
  else if ElementName = 'UMLReturnAction' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfAction;
  end
  else if ElementName = 'UMLUninterpretedAction' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfAction;
  end
  else if ElementName = 'UMLSignalEvent' then begin
    SpecifyPropertiesOfModelElement;
  end
  else if ElementName = 'UMLCallEvent' then begin
    SpecifyPropertiesOfModelElement;
  end
  else if ElementName = 'UMLTimeEvent' then begin
    SpecifyPropertiesOfModelElement;
    P := APropertySpecifier.DefineProperty('When', 'Detail', 'When', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLChangeEvent' then begin
    SpecifyPropertiesOfModelElement;
    P := APropertySpecifier.DefineProperty('ChangeExpression', 'Detail', 'ChangeExpression', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLClassifierRole' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    DefineMultiplicityProperty('Multiplicity', 'Detail', 'Multiplicity', False);
    P := APropertySpecifier.DefineProperty('Base', 'General', 'Base', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLObject' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfInstance;
  end
  else if ElementName = 'UMLObjectFlowState' then begin
    SpecifyPropertiesOfModelElement;
    P := APropertySpecifier.DefineProperty('Type', 'General', 'Type', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
    SpecifyPropertiesOfState;
    P := APropertySpecifier.DefineProperty('IsSynch', 'Detail', 'IsSynch', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLFlowFinalState' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfState;
  end
  else if ElementName = 'UMLSignalAcceptState' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfState;
    SpecifyPropertiesOfActionState;
  end
  else if ElementName = 'UMLSignalSendState' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfState;
    SpecifyPropertiesOfActionState;
  end
  else if ElementName = 'UMLArtifact' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfGeneralizableElement;
    DefineAttributesProperty;
    DefineOperationsProperty;
  end
  else if ElementName = 'UMLAttributeLink' then begin
    SpecifyPropertiesOfModelElement;
    P := APropertySpecifier.DefineProperty('Value', 'General', 'Value', rkTextButtonRow);
    P.IsUnique := True;
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Attribute', 'General', 'Attribute', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLPort' then begin
    SpecifyPropertiesOfModelElement;
    P := APropertySpecifier.DefineProperty('Type', 'General', 'Type', rkTextButtonRow);
    P.IsUnique := True;
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('IsService', 'General', 'IsService', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('IsBehavior', 'General', 'IsBehavior', rkCheckRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    DefineChangeabilityProperty('Changeability', 'Detail', 'Changeability', False);
    DefineScopeKindProperty('TargetScope', 'Detail', 'TargetScope', False);
    DefineOrderingProperty('Ordering', 'Detail', 'Ordering', False);
    DefineMultiplicityProperty('Multiplicity', 'Detail', 'Multiplicity', False);
    DefineScopeKindProperty('OwnerScope', 'Detail', 'OwnerScope', False);
  end
  else if ElementName = 'UMLCombinedFragment' then begin
    SpecifyPropertiesOfModelElement;
    DefineInteractionOperatorKindProperty;
  end
  else if ElementName = 'UMLInteractionOperand' then begin
    SpecifyPropertiesOfModelElement;
    P := APropertySpecifier.DefineProperty('Guard', 'General', 'Guard', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLExtensionPoint' then begin
    SpecifyPropertiesOfModelElement;
    P := APropertySpecifier.DefineProperty('Location', 'General', 'Location', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLFrame' then begin
    SpecifyPropertiesOfModelElement;
    P := APropertySpecifier.DefineProperty('FrameKind', 'General', 'FrameKind', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('RepresentedElement', 'Detail', 'RepresentedElement', rkTextButtonRow);
    P.RowEditable := False;
    P.IsUnique := True;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLDependency' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfDependency;
  end
  else if ElementName = 'UMLAssociation' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfAssociation;
  end
  else if ElementName = 'UMLAssociationClass' then begin
    // None.
  end
  else if ElementName = 'UMLGeneralization' then begin
    SpecifyPropertiesOfModelElement;
    P := APropertySpecifier.DefineProperty('Parent', 'General', 'Parent', rkTextRow);
    P.RowEditable := False;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Child', 'General', 'Child', rkTextRow);
    P.RowEditable := False;
    P.ImageIndex := NONEDITABLE_ROW_IMAGEINDEX;
    P := APropertySpecifier.DefineProperty('Discriminator', 'Detail', 'Discriminator', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLLink' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfLink;
  end
  else if ElementName = 'UMLAssociationRole' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfAssociation;
    DefineMultiplicityProperty('Multiplicity', 'Detail', 'Multiplicity', False);
  end
  else if ElementName = 'UMLStimulus' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfMessage;
  end
  else if ElementName = 'UMLMessage' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfMessage;
  end
  else if ElementName = 'UMLInclude' then begin
    SpecifyPropertiesOfModelElement;
  end
  else if ElementName = 'UMLExtend' then begin
    SpecifyPropertiesOfModelElement;
    P := APropertySpecifier.DefineProperty('Condition', 'General', 'Condition', rkTextRow);
    P.ImageIndex := GENERAL_ROW_IMAGEINDEX;
  end
  else if ElementName = 'UMLRealization' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfDependency;
  end
  else if ElementName = 'UMLConnector' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfConnector;
  end
  else if ElementName = 'UMLAssociationEnd' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfAssociationEnd;
  end
  else if ElementName = 'UMLAssociationEndRole' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfAssociationEnd;
    DefineMultiplicityProperty('CollaborationMultiplicity', 'Detail', 'CollaborationMultiplicity', False);
  end
  else if ElementName = 'UMLLinkEnd' then begin
    SpecifyPropertiesOfModelElement;
  end
  else if ElementName = 'UMLConnectorEnd' then begin
    SpecifyPropertiesOfModelElement;
    SpecifyPropertiesOfConnectorEnd;
  end
  else if ElementName = 'UMLClassDiagram' then begin
    DefineNameProperty('Name', 'General', 'Name');
    SpecifyPropertiesOfDiagram;
    DefineDefaultDiagramProperty;
  end
  else if ElementName = 'UMLUseCaseDiagram' then begin
    DefineNameProperty('Name', 'General', 'Name');
    SpecifyPropertiesOfDiagram;
    DefineDefaultDiagramProperty;
  end
  else if ElementName = 'UMLComponentDiagram' then begin
    DefineNameProperty('Name', 'General', 'Name');
    SpecifyPropertiesOfDiagram;
    DefineDefaultDiagramProperty;
  end
  else if ElementName = 'UMLDeploymentDiagram' then begin
    DefineNameProperty('Name', 'General', 'Name');
    SpecifyPropertiesOfDiagram;
    DefineDefaultDiagramProperty;
  end
  else if ElementName = 'UMLSequenceDiagram' then begin
    DefineNameProperty('Name', 'General', 'Name');
    SpecifyPropertiesOfDiagram;
    SpecifyPropertiesOfInteractionDiagram;
    SpecifyPropertiesOfSequenceDiagram;
  end
  else if ElementName = 'UMLCollaborationDiagram' then begin
    DefineNameProperty('Name', 'General', 'Name');
    SpecifyPropertiesOfDiagram;
    SpecifyPropertiesOfInteractionDiagram;
  end
  else if ElementName = 'UMLSequenceRoleDiagram' then begin
    DefineNameProperty('Name', 'General', 'Name');
    SpecifyPropertiesOfDiagram;
    SpecifyPropertiesOfInteractionDiagram;
    SpecifyPropertiesOfSequenceDiagram;
  end
  else if ElementName = 'UMLCollaborationRoleDiagram' then begin
    DefineNameProperty('Name', 'General', 'Name');
    SpecifyPropertiesOfDiagram;
    SpecifyPropertiesOfInteractionDiagram;
  end
  else if ElementName = 'UMLActivityDiagram' then begin
    DefineNameProperty('Name', 'General', 'Name');
    SpecifyPropertiesOfDiagram;
  end
  else if ElementName = 'UMLStatechartDiagram' then begin
    DefineNameProperty('Name', 'General', 'Name');
    SpecifyPropertiesOfDiagram;
  end
  else if ElementName = 'UMLCompositeStructureDiagram' then begin
    DefineNameProperty('Name', 'General', 'Name');
    SpecifyPropertiesOfDiagram;
    DefineDefaultDiagramProperty;
  end
end;

function PUMLPropertyAdaptor.GetPropertyValue(AElement: PElement; Key: string): string;

  function VisibilityToPropertyValue(Value: string): string;
  begin
    if Value = 'vkPublic' then
      Result := 'PUBLIC'
    else if Value = 'vkProtected' then
      Result := 'PROTECTED'
    else if Value = 'vkPrivate' then
      Result := 'PRIVATE'
    else if Value = 'vkPackage' then
      Result := 'PACKAGE'
    else
      Result := 'PUBLIC';
  end;

  function AggregationKindToPropertyValue(Value: string): string;
  begin
    if Value = 'akNone' then
      Result := 'NONE'
    else if Value = 'akAggregate' then
      Result := 'AGGREGATE'
    else if Value = 'akComposite' then
      Result := 'COMPOSITE'
    else
      Result := 'NONE';
  end;

  function CallConcurrencyKindToPropertyValue(Value: string): string;
  begin
    if Value = 'cckSequential' then
      Result := 'SEQUENTIAL'
    else if Value = 'cckGuarded' then
      Result := 'GUARDED'
    else if Value = 'cckConcurrent' then
      Result := 'CONCURRENT'
    else
      Result := 'SEQUENTIAL';
  end;

  function ChangeableKindToPropertyValue(Value: string): string;
  begin
    if Value = 'ckChangeable' then
      Result := 'CHANGEABLE'
    else if Value = 'ckFrozen' then
      Result := 'FROZEN'
    else if Value = 'ckAddOnly' then
      Result := 'ADDONLY'
    else
      Result := 'CHANGEABLE';
  end;

  function OrderingKindToPropertyValue(Value: string): string;
  begin
    if Value = 'okUnordered' then
      Result := 'UNORDERED'
    else if Value = 'okOrdered' then
      Result := 'ORDERED'
    else
      Result := 'UNORDERED';
  end;

  function ParameterDirectionKindToPropertyValue(Value: string): string;
  begin
    if Value = 'pdkIn' then
      Result := 'IN'
    else if Value = 'pdkInout' then
      Result := 'INOUT'
    else if Value = 'pdkOut' then
      Result := 'OUT'
    else if Value = 'pdkReturn' then
      Result := 'RETURN'
    else
      Result := 'IN';
  end;

  function ScopeKindToPropertyValue(Value: string): string;
  begin
    if Value = 'skInstance' then
      Result := 'INSTANCE'
    else if Value = 'skClassifier' then
      Result := 'CLASSIFIER'
    else
      Result := 'INSTANCE';
  end;

  function PseudostateKindToPropertyValue(Value: string): string;
  begin
    if Value = 'pkChoice' then
      Result := 'CHOICE'
    else if Value = 'pkDeepHistory' then
      Result := 'DEEPHISTORY'
    else if Value = 'pkSynchronization' then
      Result := 'SYNCHRONIZATION'
    else if Value = 'pkInitial' then
      Result := 'INITIAL'
    else if Value = 'pkJunction' then
      Result := 'JUNCTION'
    else if Value = 'pkShallowHistory' then
      Result := 'SHALLOWHISTORY'
    else if Value = 'pkDecision' then
      Result := 'DECISION'
    else
      Result := 'CHOICE';
  end;

  function ActionToPropertyValue(Value: PUMLAction): string;
  begin
    if Value is PUMLCallAction then
      Result := 'CALL'
    else if Value is PUMLSendAction then
      Result := 'SEND'
    else if Value is PUMLCreateAction then
      Result := 'CREATE'
    else if Value is PUMLDestroyAction then
      Result := 'DESTROY'
    else if Value is PUMLReturnAction then
      Result := 'RETURN'
    else
      Result := '';
  end;

  function MessageSignatureToPropertyValue(Value: string): string;
  begin
    if Value = 'mskNone' then
      Result := 'NONE'
    else if Value = 'mskTypeOnly' then
      Result := 'TYPEONLY'
    else if Value = 'mskNameOnly' then
      Result := 'NAMEONLY'
    else if Value = 'mskNameAndType' then
      Result := 'NAMEANDTYPE'
    else
      Result := 'NONE'
  end;

  function InteractionOperatorKindToPropertyValue(Value: string): string;
  begin
    if Value = 'iokSeq' then
      Result := 'seq'
    else if Value = 'iokAlt' then
      Result := 'alt'
    else if Value = 'iokOpt' then
      Result := 'opt'
    else if Value = 'iokBreak' then
      Result := 'break'
    else if Value = 'iokPar' then
      Result := 'par'
    else if Value = 'iokStrict' then
      Result := 'strict'
    else if Value = 'iokLoop' then
      Result := 'loop'
    else if Value = 'iokRegion' then
      Result := 'region'
    else if Value = 'iokNeg' then
      Result := 'neg'
    else if Value = 'iokAssert' then
      Result := 'assert'
    else if Value = 'iokIgnore' then
      Result := 'ignore'
    else if Value = 'iokConsider' then
      Result := 'consider'
    else
      Result := 'seq';
  end;

  function GetCollectionStr(AElement: PElement; Key: string): string;
  var
    C: Integer;
  begin
    C := AElement.MOF_GetCollectionCount(Key);
    Result := Format('(Collection)[%d]', [C]);
  end;

begin
  if Key = 'Name' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Visibility' then begin
    Result := VisibilityToPropertyValue(AElement.MOF_GetAttribute(Key));
  end
  else if Key = 'Stereotype' then begin
    Result := (AElement as PUMLModelElement).StereotypeName;
  end
  else if Key = 'IsSpecification' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'IsSynch' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
   else if Key = 'IsAbstract' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'IsRoot' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'IsLeaf' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Attributes' then begin
    Result := GetCollectionStr(AElement, 'Attributes');
  end
  else if Key = 'Operations' then begin
    Result := GetCollectionStr(AElement, 'Operations');
  end
  else if Key = 'TemplateParameters' then begin
    Result := GetCollectionStr(AElement, 'TemplateParameters');
  end
  else if Key = 'IsActive' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Literals' then begin
    Result := GetCollectionStr(AElement, 'Literals');
  end
  else if Key = 'Residents' then begin
    Result := GetCollectionStr(AElement, 'Residents');
  end
  else if Key = 'Classifier' then begin
    if (AElement as PUMLInstance).Classifier <> nil then
      Result := (AElement as PUMLInstance).Classifier.Name
    else
      Result := '';
  end
  else if Key = 'IsMultiInstance' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'DeployedComponents' then begin
    Result := GetCollectionStr(AElement, 'DeployedComponents');
  end
  else if Key = 'DeployedArtifacts' then begin
    Result := GetCollectionStr(AElement, 'DeployedArtifacts');
  end
  else if Key = 'IsInstantiable' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'EntryActions' then begin
    Result := GetCollectionStr(AElement, 'EntryActions');
  end
  else if Key = 'DoActions' then begin
    Result := GetCollectionStr(AElement, 'DoActivities');
  end
  else if Key = 'ExitActions' then begin
    Result := GetCollectionStr(AElement, 'ExitActions');
  end
  else if Key = 'IsDynamic' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'DynamicArguments' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'DynamicMultiplicity' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'IsConcurrent' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'PseudostateKind' then begin
    Result := PseudostateKindToPropertyValue(AElement.MOF_GetAttribute(Key));
  end
  else if Key = 'Type' then begin
    Result := '';
    if AElement is PUMLStructuralFeature then begin
      if (AElement as PUMLStructuralFeature).Type_ <> nil then
        Result := (AElement as PUMLStructuralFeature).Type_.Name
      else
        Result := (AElement as PUMLStructuralFeature).TypeExpression;
    end
    else if AElement is PUMLParameter then begin
      if (AElement as PUMLParameter).Type_ <> nil then
        Result := (AElement as PUMLParameter).Type_.Name
      else
        Result := (AElement as PUMLParameter).TypeExpression;
    end
    else if AElement is PUMLObjectFlowState then begin
      if (AElement as PUMLObjectFlowState).Type_ <> nil then
        Result := (AElement as PUMLObjectFlowState).Type_.Name
      else
        Result := '';
    end;
  end
  else if Key = 'InitialValue' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Changeability' then begin
    Result := ChangeableKindToPropertyValue(AElement.MOF_GetAttribute(Key));
  end
  else if Key = 'TargetScope' then begin
    Result := ScopeKindToPropertyValue(AElement.MOF_GetAttribute(Key));
  end
  else if Key = 'Ordering' then begin
    Result := OrderingKindToPropertyValue(AElement.MOF_GetAttribute(Key));
  end
  else if Key = 'Multiplicity' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Participant' then begin
    if (AElement as PUMLAssociationEnd).Participant <> nil then
      Result := (AElement as PUMLAssociationEnd).Participant.Name
    else
      Result := '';
  end
  else if Key = 'IsNavigable' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Aggregation' then begin
    Result := AggregationKindToPropertyValue(AElement.MOF_GetAttribute(Key));
  end
  else if Key = 'Qualifiers' then begin
    Result := GetCollectionStr(AElement, 'Qualifiers');
  end
  else if Key = 'CollaborationMultiplicity' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'OwnerScope' then begin
    Result := ScopeKindToPropertyValue(AElement.MOF_GetAttribute(Key));
  end
  else if Key = 'Parameters' then begin
    Result := GetCollectionStr(AElement, 'Parameters');
  end
  else if Key = 'Specification' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Concurrency' then begin
    Result := CallConcurrencyKindToPropertyValue(AElement.MOF_GetAttribute(Key));
  end
  else if Key = 'IsQuery' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'DefaultValue' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'DirectionKind' then begin
    Result := ParameterDirectionKindToPropertyValue(AElement.MOF_GetAttribute(Key));
  end
  else if Key = 'GuardCondition' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Effects' then begin
    Result := GetCollectionStr(AElement, 'Effects');
  end
  else if Key = 'Triggers' then begin
    Result := GetCollectionStr(AElement, 'Triggers');
  end
  else if Key = 'Target' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'IsAsynchronous' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Script' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'When' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'ChangeExpression' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Client' then begin
    if (AElement as PUMLDependency).Client <> nil then
      Result := (AElement as PUMLDependency).Client.Name
    else
      Result := '';
  end
  else if Key = 'Supplier' then begin
    if (AElement as PUMLDependency).Supplier <> nil then
      Result := (AElement as PUMLDependency).Supplier.Name
    else
      Result := '';
  end
  else if Key = 'Parent' then begin
    if (AElement as PUMLGeneralization).Parent <> nil then
      Result := (AElement as PUMLGeneralization).Parent.Name
    else
      Result := '';
  end
  else if Key = 'Child' then begin
    if (AElement as PUMLGeneralization).Child <> nil then
      Result := (AElement as PUMLGeneralization).Child.Name
    else
      Result := '';
  end
  else if Key = 'Discriminator' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'End1.Name' then begin
    if AElement is PUMLAssociation then
      Result := (AElement as PUMLAssociation).Connections[0].MOF_GetAttribute('Name')
    else if AElement is PUMLLink then
      Result := (AElement as PUMLLink).Connections[0].MOF_GetAttribute('Name')
    else if AElement is PUMLConnector then
      Result := (AElement as PUMLConnector).Ends[0].MOF_GetAttribute('Name');
  end
  else if Key = 'End1.Visibility' then begin
    if AElement is PUMLAssociation then
      Result := VisibilityToPropertyValue((AElement as PUMLAssociation).Connections[0].MOF_GetAttribute('Visibility'))
    else if AElement is PUMLLink then
      Result := VisibilityToPropertyValue((AElement as PUMLLink).Connections[0].MOF_GetAttribute('Visibility'))
    else if AElement is PUMLConnector then
      Result := VisibilityToPropertyValue((AElement as PUMLConnector).Ends[0].MOF_GetAttribute('Visibility'));
  end
  else if Key = 'End1.IsNavigable' then begin
    Result := (AElement as PUMLAssociation).Connections[0].MOF_GetAttribute('IsNavigable');
  end
  else if Key = 'End1.Aggregation' then begin
    Result := AggregationKindToPropertyValue((AElement as PUMLAssociation).Connections[0].MOF_GetAttribute('Aggregation'));
  end
  else if Key = 'End1.Multiplicity' then begin
    if AElement is PUMLAssociation then
      Result := (AElement as PUMLAssociation).Connections[0].MOF_GetAttribute('Multiplicity')
    else if AElement is PUMLConnector then
      Result := (AElement as PUMLConnector).Ends[0].MOF_GetAttribute('Multiplicity');
  end
  else if Key = 'End1.Participant' then begin
    if (AElement as PUMLAssociation).Connections[0].Participant <> nil then
      Result := (AElement as PUMLAssociation).Connections[0].Participant.Name
    else
      Result := '';
  end
  else if Key = 'End1.Ordering' then begin
    Result := OrderingKindToPropertyValue((AElement as PUMLAssociation).Connections[0].MOF_GetAttribute('Ordering'));
  end
  else if Key = 'End1.TargetScope' then begin
    Result := ScopeKindToPropertyValue((AElement as PUMLAssociation).Connections[0].MOF_GetAttribute('TargetScope'));
  end
  else if Key = 'End1.Changeability' then begin
    Result := ChangeableKindToPropertyValue((AElement as PUMLAssociation).Connections[0].MOF_GetAttribute('Changeability'));
  end
  else if Key = 'End1.Qualifiers' then begin
    if AElement is PUMLAssociation then
      Result := GetCollectionStr((AElement as PUMLAssociation).Connections[0], 'Qualifiers')
    else
      Result := GetCollectionStr((AElement as PUMLLink).Connections[0], 'Qualifiers');
  end
  else if Key = 'End2.Name' then begin
    if AElement is PUMLAssociation then
      Result := (AElement as PUMLAssociation).Connections[1].MOF_GetAttribute('Name')
    else if AElement is PUMLLink then
      Result := (AElement as PUMLLink).Connections[1].MOF_GetAttribute('Name')
    else if AElement is PUMLConnector then
      Result := (AElement as PUMLConnector).Ends[1].MOF_GetAttribute('Name');
  end
  else if Key = 'End2.Visibility' then begin
    if AElement is PUMLAssociation then
      Result := VisibilityToPropertyValue((AElement as PUMLAssociation).Connections[1].MOF_GetAttribute('Visibility'))
    else if AElement is PUMLLink then
      Result := VisibilityToPropertyValue((AElement as PUMLLink).Connections[1].MOF_GetAttribute('Visibility'))
    else if AElement is PUMLConnector then
      Result := VisibilityToPropertyValue((AElement as PUMLConnector).Ends[1].MOF_GetAttribute('Visibility'));
  end
  else if Key = 'End2.IsNavigable' then begin
    Result := (AElement as PUMLAssociation).Connections[1].MOF_GetAttribute('IsNavigable');
  end
  else if Key = 'End2.Aggregation' then begin
    Result := AggregationKindToPropertyValue((AElement as PUMLAssociation).Connections[1].MOF_GetAttribute('Aggregation'));
  end
  else if Key = 'End2.Multiplicity' then begin
    if AElement is PUMLAssociation then
      Result := (AElement as PUMLAssociation).Connections[1].MOF_GetAttribute('Multiplicity')
    else if AElement is PUMLConnector then
      Result := (AElement as PUMLConnector).Ends[1].MOF_GetAttribute('Multiplicity');
  end
  else if Key = 'End2.Participant' then begin
    if (AElement as PUMLAssociation).Connections[1].Participant <> nil then
      Result := (AElement as PUMLAssociation).Connections[1].Participant.Name
    else
      Result := '';
  end
  else if Key = 'End2.Ordering' then begin
    Result := OrderingKindToPropertyValue((AElement as PUMLAssociation).Connections[1].MOF_GetAttribute('Ordering'));
  end
  else if Key = 'End2.TargetScope' then begin
    Result := ScopeKindToPropertyValue((AElement as PUMLAssociation).Connections[1].MOF_GetAttribute('TargetScope'));
  end
  else if Key = 'End2.Changeability' then begin
    Result := ChangeableKindToPropertyValue((AElement as PUMLAssociation).Connections[1].MOF_GetAttribute('Changeability'));
  end
  else if Key = 'End2.Qualifiers' then begin
    if AElement is PUMLAssociation then
      Result := GetCollectionStr((AElement as PUMLAssociation).Connections[1], 'Qualifiers')
    else
      Result := GetCollectionStr((AElement as PUMLLink).Connections[1], 'Qualifiers');
  end
  else if Key = 'Operation' then begin
    if (AElement as PUMLCallAction).Operation <> nil then
      Result := (AElement as PUMLCallAction).Operation.Name
    else
      Result := '';
  end
  else if Key = 'Signal' then begin
    if (AElement as PUMLSendAction).Signal <> nil then
      Result := (AElement as PUMLSendAction).Signal.Name
    else
      Result := '';
  end
  else if Key = 'Condition' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Mapping' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Title' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Author' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Company' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Copyright' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'RaisedSignals' then begin
    Result := GetCollectionStr(AElement, 'RaisedSignals');
  end
  else if Key = 'ActionKind' then begin
    Result := '';
    if AElement is PUMLMessage then
      Result := ActionToPropertyValue((AElement as PUMLMessage).Action)
    else if AElement is PUMLStimulus then
      Result := ActionToPropertyValue((AElement as PUMLStimulus).Action);
  end
  else if Key = 'ParameterType' then begin
    Result := AElement.MOF_GetAttribute('ParameterType');
  end
  else if Key = 'SubMachine' then begin
    Result := '';
    if AElement is PUMLSubMachineState then begin
      if (AElement as PUMLSubMachineState).Submachine <> nil then
        Result := (AElement as PUMLSubMachineState).Submachine.MOF_GetAttribute('Name')
    end
    else if AElement is PUMLSubactivityState then begin
      if (AElement as PUMLSubactivityState).Submachine <> nil then
        Result := (AElement as PUMLSubactivityState).Submachine.MOF_GetAttribute('Name');
    end;
  end
  else if Key = 'Base' then begin
    Result := '';
    if AElement is PUMLClassifierRole then
      if (AElement as PUMLClassifierRole).Base <> nil then
        Result := (AElement as PUMLClassifierRole).Base.MOF_GetAttribute('Name');
  end
  else if Key = 'Instantiation' then begin
    if (AElement as PUMLCreateAction).Instantiation <> nil then
      Result := (AElement as PUMLCreateAction).Instantiation.Name
    else
      Result := '';
  end
  else if Key = 'ShowSequenceNumber' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'MessageSignature' then begin
    Result := MessageSignatureToPropertyValue(AElement.MOF_GetAttribute(Key));
  end
  else if Key = 'ShowActivation' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'DefaultDiagram' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Arguments' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Return' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Iteration' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Branch' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'DiagramType' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Slots' then begin
    Result := GetCollectionStr(AElement, 'Slots');
  end
  else if Key = 'Value' then begin
    Result := '';
    if (AElement as PUMLAttributeLink).Value_ <> nil then
      Result := (AElement as PUMLAttributeLink).Value_.Name
    else
      Result := (AElement as PUMLAttributeLink).ValueExpression;
  end
  else if Key = 'Attribute' then begin
    if (AElement as PUMLAttributeLink).Attribute <> nil then
      Result := (AElement as PUMLAttributeLink).Attribute.Name
    else
      Result := '';
  end
  else if Key = 'IsService' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'IsBehavior' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'Role' then begin
    if (AElement as PUMLConnectorEnd).Role <> nil then
      Result := (AElement as PUMLConnectorEnd).Role.Name
    else
      Result := '';
  end
  else if Key = 'IsOrdered' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'IsUnique' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'End1.Role' then begin
    if (AElement as PUMLConnector).Ends[0].Role <> nil then
      Result := (AElement as PUMLConnector).Ends[0].Role.Name
    else
      Result := '';
  end
  else if Key = 'End1.IsOrdered' then begin
    Result := (AElement as PUMLConnector).Ends[0].MOF_GetAttribute('IsOrdered');
  end
  else if Key = 'End1.IsUnique' then begin
    Result := (AElement as PUMLConnector).Ends[0].MOF_GetAttribute('IsUnique');
  end
  else if Key = 'End2.Role' then begin
    if (AElement as PUMLConnector).Ends[1].Role <> nil then
      Result := (AElement as PUMLConnector).Ends[1].Role.Name
    else
      Result := '';
  end
  else if Key = 'End2.IsOrdered' then begin
    Result := (AElement as PUMLConnector).Ends[1].MOF_GetAttribute('IsOrdered');
  end
  else if Key = 'End2.IsUnique' then begin
    Result := (AElement as PUMLConnector).Ends[1].MOF_GetAttribute('IsUnique');
  end
  else if Key = 'InteractionOperator' then begin
    Result := InteractionOperatorKindToPropertyValue(AElement.MOF_GetAttribute(Key));
  end
  else if Key = 'Guard' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'ExtensionPoints' then begin
    Result := GetCollectionStr(AElement, 'ExtensionPoints');
  end
  else if Key = 'Location' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end
  else if Key = 'RepresentedElement' then begin
    if (AElement as PUMLFrame).RepresentedElement <> nil then
      Result := (AElement as PUMLFrame).RepresentedElement.Name
    else
      Result := '';
  end
  else if Key = 'FrameKind' then begin
    Result := AElement.MOF_GetAttribute(Key);
  end;
end;

procedure PUMLPropertyAdaptor.SetPropertyValue(AElementSet: POrderedSet; Key: string; Value: string);

  function PropertyValueToVisibility(Value: string): string;
  begin
    if Value = 'PUBLIC' then
      Result := 'vkPublic'
    else if Value = 'PROTECTED' then
      Result := 'vkProtected'
    else if Value = 'PRIVATE' then
      Result := 'vkPrivate'
    else if Value = 'PACKAGE' then
      Result := 'vkPackage'
    else
      Result := 'vkPublic';
  end;

  function PropertyValueToAggregationKind(Value: string): string;
  begin
    if Value = 'NONE' then
      Result := 'akNone'
    else if Value = 'AGGREGATE' then
      Result := 'akAggregate'
    else if Value = 'COMPOSITE' then
      Result := 'akComposite'
    else
      Result := 'akNone';
  end;

  function PropertyValueToCallConcurrencyKind(Value: string): string;
  begin
    if Value = 'SEQUENTIAL' then
      Result := 'cckSequential'
    else if Value = 'GUARDED' then
      Result := 'cckGuarded'
    else if Value = 'CONCURRENT' then
      Result := 'cckConcurrent'
    else
      Result := 'cckSequential';
  end;

  function PropertyValueToChangeableKind(Value: string): string;
  begin
    if Value = 'CHANGEABLE' then
      Result := 'ckChangeable'
    else if Value = 'FROZEN' then
      Result := 'ckFrozen'
    else if Value = 'ADDONLY' then
      Result := 'ckAddOnly'
    else
      Result := 'ckChangeable';
  end;

  function PropertyValueToOrderingKind(Value: string): string;
  begin
    if Value = 'UNORDERED' then
      Result := 'okUnordered'
    else if Value = 'ORDERED' then
      Result := 'okOrdered'
    else
      Result := 'okUnordered';
  end;

  function PropertyValueToParameterDirectionKind(Value: string): string;
  begin
    if Value = 'IN' then
      Result := 'pdkIn'
    else if Value = 'INOUT' then
      Result := 'pdkInout'
    else if Value = 'OUT' then
      Result := 'pdkOut'
    else if Value = 'RETURN' then
      Result := 'pdkReturn'
    else
      Result := 'pdkIn';
  end;

  function PropertyValueToScopeKind(Value: string): string;
  begin
    if Value = 'INSTANCE' then
      Result := 'skInstance'
    else if Value = 'CLASSIFIER' then
      Result := 'skClassifier'
    else
      Result := 'skInstance';
  end;

  function PropertyValueToPseudostateKind(Value: string): string;
  begin
    if Value = 'CHOICE' then
      Result := 'pkChoice'
    else if Value = 'DEEPHISTORY' then
      Result := 'pkDeepHistory'
    else if Value = 'SYNCHRONIZATION' then
      Result := 'pkSynchronization'
    else if Value = 'INITIAL' then
      Result := 'pkInitial'
    else if Value = 'JUNCTION' then
      Result := 'pkJunction'
    else if Value = 'SHALLOWHISTORY' then
      Result := 'pkShallowHistory'
    else if Value = 'DECISION' then
      Result := 'pkDecision'
    else
      Result := 'pkChoice';
  end;

  function PropertyValueToMessageSignatureKind(Value: string): string;
  begin
    if Value = 'NONE' then
      Result := 'mskNone'
    else if Value = 'TYPEONLY' then
      Result := 'mskTypeOnly'
    else if Value = 'NAMEONLY' then
      Result := 'mskNameOnly'
    else if Value = 'NAMEANDTYPE' then
      Result := 'mskNameAndType'
    else
      Result := 'mskNone';
  end;

  function PropertyValueToInteractionOperatorKind(Value: string): string;
  begin
    if Value = 'seq' then
      Result := 'iokSeq'
    else if Value = 'alt' then
      Result := 'iokAlt'
    else if Value = 'opt' then
      Result := 'iokOpt'
    else if Value = 'break' then
      Result := 'iokBreak'
    else if Value = 'par' then
      Result := 'iokPar'
    else if Value = 'strict' then
      Result := 'iokStrict'
    else if Value = 'loop' then
      Result := 'iokLoop'
    else if Value = 'region' then
      Result := 'iokRegion'
    else if Value = 'neg' then
      Result := 'iokNeg'
    else if Value = 'assert' then
      Result := 'iokAssert'
    else if Value = 'ignore' then
      Result := 'iokIgnore'
    else if Value = 'consider' then
      Result := 'iokConsider'
    else
      Result := 'iokSeq';
  end;

  procedure AssociationLinkConnectorEndChange(AElement: PElement; ConnIdx: Integer; AKey, AValue: string);
  var
    Element: PElement;
  begin
    Element := nil;
    if AElement is PUMLAssociation then
      Element := (AElement as PUMLAssociation).Connections[ConnIdx]
    else if AElement is PUMLLink then
      Element := (AElement as PUMLLink).Connections[ConnIdx]
    else if AElement is PUMLConnector then
      Element := (AElement as PUMLConnector).Ends[ConnIdx];
    if Element <> nil then
      AttributeChange(Element, AKey, AValue);
  end;

var
  S: PStereotype;
begin
  if Key = 'Name' then begin
    if AElementSet.Count = 1 then
      NameChange(AElementSet.Items[0] as PElement, Value);
  end
  else if Key = 'Visibility' then begin
    ElementsAttributeChange(AElementSet, Key, PropertyValueToVisibility(Value));
  end
  else if Key = 'Stereotype' then begin
    S := ExtensionManager.FindFirstStereotype(Value, (AElementSet.Items[0] as PExtensibleModel).MetaClass.Name);
    if S <> nil then
      ElementsStereotypeChange(AElementSet, S.Profile.Name, Value)
    else
      ElementsStereotypeChange(AElementSet, '', Value)
  end
  else if Key = 'IsSpecification' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'IsAbstract' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'IsRoot' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'IsLeaf' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Attributes' then begin
    // Collection
  end
  else if Key = 'Operations' then begin
    // Collection
  end
  else if Key = 'TemplateParameters' then begin
    // Collection
  end
  else if Key = 'IsActive' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Literals' then begin
    // Collection
  end
  else if Key = 'Residents' then begin
    // Collection
  end
  else if Key = 'Classifier' then begin
    // Reference
  end
  else if Key = 'IsMultiInstance' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'DeployedComponents' then begin
    // Collection
  end
  else if Key = 'DeployedArtifacts' then begin
    // Collection
  end
  else if Key = 'IsInstantiable' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'EntryActions' then begin
    // Collection
  end
  else if Key = 'DoActions' then begin
    // Collection
  end
  else if Key = 'ExitActions' then begin
    // Collection
  end
  else if Key = 'IsDynamic' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'DynamicArguments' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'DynamicMultiplicity' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'IsConcurrent' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'PseudostateKind' then begin
    ElementsAttributeChange(AElementSet, Key, PropertyValueToPseudostateKind(Value));
  end
  else if Key = 'Type' then begin
    if AElementSet.Count = 1 then
      TypeExpressionChange(AElementSet.Items[0] as PElement, Key, Value, nil);
  end
  else if Key = 'InitialValue' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Changeability' then begin
    ElementsAttributeChange(AElementSet, Key, PropertyValueToChangeableKind(Value));
  end
  else if Key = 'TargetScope' then begin
    ElementsAttributeChange(AElementSet, Key, PropertyValueToScopeKind(Value));
  end
  else if Key = 'Ordering' then begin
    ElementsAttributeChange(AElementSet, Key, PropertyValueToOrderingKind(Value));
  end
  else if Key = 'Multiplicity' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Participant' then begin
    // Readonly
  end
  else if Key = 'IsNavigable' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Aggregation' then begin
    ElementsAttributeChange(AElementSet, Key, PropertyValueToAggregationKind(Value));
  end
  else if Key = 'Qualifiers' then begin
    // Collection
  end
  else if Key = 'CollaborationMultiplicity' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'OwnerScope' then begin
    ElementsAttributeChange(AElementSet, Key, PropertyValueToScopeKind(Value));
  end
  else if Key = 'Parameters' then begin
    // Collection
  end
  else if Key = 'Specification' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Concurrency' then begin
    ElementsAttributeChange(AElementSet, Key, PropertyValueToCallConcurrencyKind(Value));
  end
  else if Key = 'IsQuery' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'DefaultValue' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'DirectionKind' then begin
    ElementsAttributeChange(AElementSet, Key, PropertyValueToParameterDirectionKind(Value));
  end
  else if Key = 'GuardCondition' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Effects' then begin
    // Collection
  end
  else if Key = 'Triggers' then begin
    // Collection
  end
  else if Key = 'Target' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'IsAsynchronous' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Script' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'When' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'ChangeExpression' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Client' then begin
    // Readonly
  end
  else if Key = 'Supplier' then begin
    // Readonly
  end
  else if Key = 'Parent' then begin
    // Readonly
  end
  else if Key = 'Child' then begin
    // Readonly
  end
  else if Key = 'Discriminator' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'End1.Name' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 0, 'Name', Value);
  end
  else if Key = 'End1.Visibility' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 0, 'Visibility', PropertyValueToVisibility(Value));
  end
  else if Key = 'End1.IsNavigable' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 0, 'IsNavigable', Value);
  end
  else if Key = 'End1.Aggregation' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 0, 'Aggregation', PropertyValueToAggregationKind(Value));
  end
  else if Key = 'End1.Multiplicity' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 0, 'Multiplicity', Value);
  end
  else if Key = 'End1.Participant' then begin
    // Readonly
  end
  else if Key = 'End1.Ordering' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 0, 'Ordering', PropertyValueToOrderingKind(Value));
  end
  else if Key = 'End1.TargetScope' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 0, 'TargetScope', PropertyValueToScopeKind(Value));
  end
  else if Key = 'End1.Changeability' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 0, 'Changeability', PropertyValueToChangeableKind(Value));
  end
  else if Key = 'End1.Qualifiers' then begin
    // Collection
  end
  else if Key = 'End2.Name' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 1, 'Name', Value);
  end
  else if Key = 'End2.Visibility' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 1, 'Visibility', PropertyValueToVisibility(Value));
  end
  else if Key = 'End2.IsNavigable' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 1, 'IsNavigable', Value);
  end
  else if Key = 'End2.Aggregation' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 1, 'Aggregation', PropertyValueToAggregationKind(Value));
  end
  else if Key = 'End2.Multiplicity' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 1, 'Multiplicity', Value);
  end
  else if Key = 'End2.Participant' then begin
    // Readonly
  end
  else if Key = 'End2.Ordering' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 1, 'Ordering', PropertyValueToOrderingKind(Value));
  end
  else if Key = 'End2.TargetScope' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 1, 'TargetScope', PropertyValueToScopeKind(Value));
  end
  else if Key = 'End2.Changeability' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement , 1, 'Changeability', PropertyValueToChangeableKind(Value));
  end
  else if Key = 'End2.Qualifiers' then begin
    // Collection
  end
  else if Key = 'Instantiation' then begin
    // Reference
  end
  else if Key = 'Operation' then begin
    // Reference
  end
  else if Key = 'Signal' then begin
    // Reference
  end
  else if Key = 'Condition' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Mapping' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Title' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Author' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Company' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Copyright' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'RaisedSignals' then begin
    // Collection
  end
  else if Key = 'ActionKind' then begin
    if AElementSet.Count = 1 then
      ActionKindChange(AElementSet.Items[0] as PElement, Value);
  end
  else if Key = 'ParameterType' then begin
    if AElementSet.Count = 1 then
      AttributeChange(AElementSet.Items[0] as PElement, Key, Value);
  end
  else if Key = 'Submachine' then begin
    // Reference
  end
  else if Key = 'Base' then begin
    // Reference
  end
  else if Key = 'ShowSequenceNumber' then begin
    if AElementSet.Count = 1 then
      AttributeChange(AElementSet.Items[0] as PElement, Key, Value);
  end
  else if Key = 'MessageSignature' then begin
    if AElementSet.Count = 1 then
      AttributeChange(AElementSet.Items[0] as PElement, Key, PropertyValueToMessageSignatureKind(Value));
  end
  else if Key = 'ShowActivation' then begin
    if AElementSet.Count = 1 then
      AttributeChange(AElementSet.Items[0] as PElement, Key, Value);
  end
  else if Key = 'DefaultDiagram' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Arguments' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Return' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Iteration' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Branch' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'DiagramType' then begin
    // Readonly
  end
  else if Key = 'Slots' then begin
    // Collection
  end
  else if Key = 'Value' then begin
    if AElementSet.Count = 1 then
      ValueExpressionChange(AElementSet.Items[0] as PElement, Key, Value, nil);
  end
  else if Key = 'Attribute' then begin
    // Reference
  end
  else if Key = 'IsService' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'IsBehavior' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'Role' then begin
    // Readonly
  end
  else if Key = 'IsOrdered' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'IsUnique' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'End1.Role' then begin
    // Readonly
  end
  else if Key = 'End1.IsOrdered' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement, 0, 'IsOrdered', Value);
  end
  else if Key = 'End1.IsUnique' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement, 0, 'IsUnique', Value);
  end
  else if Key = 'End2.Role' then begin
    // Readonly
  end
  else if Key = 'End2.IsOrdered' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement, 1, 'IsOrdered', Value);
  end
  else if Key = 'End2.IsUnique' then begin
    if AElementSet.Count = 1 then
      AssociationLinkConnectorEndChange(AElementSet.Items[0] as PElement, 1, 'IsUnique', Value);
  end
  else if Key = 'InteractionOperator' then begin
    ElementsAttributeChange(AElementSet, Key, PropertyValueToInteractionOperatorKind(Value));
  end
  else if Key = 'Guard' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'ExtensionPoints' then begin
    // Collection
  end
  else if Key = 'Location' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end
  else if Key = 'RepresentedElement' then begin
    // Reference
  end
  else if Key = 'FrameKind' then begin
    ElementsAttributeChange(AElementSet, Key, Value);
  end;
end;

procedure PUMLPropertyAdaptor.PropertyButtonClicked(AElementSet: POrderedSet; Key: string);


  // Find suitable UMLClassifier as owner of operation
  // when edit 'Operation' propery of UMLCallAction
  function GetSuitableClassifier(CallAction: PUMLCallAction): PUMLClassifier;
  begin
    Result := nil;
    if (CallAction.Message <> nil) then begin
      // ASSERTIONS
      Assert(CallAction.Message.Receiver <> nil, 'Invalid Message Structure.');
      // ASSERTIONS
      Result := CallAction.Message.Receiver.Base;
    end
    else if (CallAction.Stimulus <> nil) then begin
      // ASSERTIONS
      Assert(CallAction.Stimulus.Receiver <> nil, 'Invalid Stimulus Structure.');
      // ASSERTIONS
      Result := CallAction.Stimulus.Receiver.Classifier;
    end;
  end;

var
  Elem: PModel;
  TypeElem: PUMLClassifier;
  TypeElem2: PUMLOperation;
  ValueElem: PUMLInstance;
  Attr: PUMLAttribute;
begin
{
  (Non-Collection kind)
  -------------------
  Type (of Parameter, Attribute)
  Classifier
  Instantiation
  Operation
  Signal
  Submachine
  Base
  Stereotype
  Value
  Attribute
  RepresentedElement

  (Collection kind)
  ---------------
  Attributes
  Operations
  TemplateParameters
  Literals
  Residents
  DeployedComponents
  EntryActions
  DoActions
  ExitActions
  Parameters
  RaisedSignals
  Effects
  Triggers
  End1.Qualfiers
  End2.Qualfiers
  Qualifiers
  Slots
  ExtensionPoints
}

  if not FReadOnly then begin
    // (Non-collection kind)
    if Key = 'Type' then begin
      if AElementSet.Count = 1 then begin
        Elem := AElementSet.Items[0] as PModel;
        if Elem is PUMLObjectFlowState then begin
          // <Selectable Element> PUMLClassifier inherited
          ElementSelectorForm.Filter(CLASSIFIER_FILTERINGSET);
          ElementSelectorForm.ClearSelectableModels;
          ElementSelectorForm.AddSelectableModels(CLASSIFIER_FILTERINGSET);
          if ElementSelectorForm.Execute then
            ReferenceChange(AElementSet.Items[0] as PElement, 'Type_', ElementSelectorForm.SelectedModel);
        end
        else begin
          // <Selectable Element> PUMLClassifier inherited
          ElementSelectorForm.Filter(CLASSIFIER_FILTERINGSET);
          ElementSelectorForm.ClearSelectableModels;
          ElementSelectorForm.AddSelectableModels(CLASSIFIER_FILTERINGSET);

          TypeElem := nil;
          if Elem is PUMLAttribute then TypeElem := (Elem as PUMLAttribute).Type_
          else if Elem is PUMLParameter then TypeElem := (Elem as PUMLParameter).Type_;
          if TypeElem <> nil then ElementSelectorForm.SetReservedModelToSelect(TypeElem);

          if ElementSelectorForm.Execute(TXT_ELEMSELTTL_TYPE, True) then begin
            TypeExpressionChange(AElementSet.Items[0] as PElement, Key, ElementSelectorForm.SelectedName, ElementSelectorForm.SelectedModel);
          end;
        end;
      end;
    end
    else if Key = 'Classifier' then begin
      if AElementSet.Count = 1 then begin
        // <Selectable Element> PUMLClassifier inherited
        ElementSelectorForm.Filter(CLASSIFIER_FILTERINGSET);
        ElementSelectorForm.ClearSelectableModels;
        ElementSelectorForm.AddSelectableModels(CLASSIFIER_FILTERINGSET);
        if ElementSelectorForm.Execute then begin
          ReferenceChange(AElementSet.Items[0] as PElement, 'Classifier', ElementSelectorForm.SelectedModel);
        end;
      end;
    end
    else if Key = 'Instantiation' then begin
      if AElementSet.Count = 1 then begin
        // <Selectable Element> PUMLClassifier inherited
        ElementSelectorForm.Filter(CLASSIFIER_FILTERINGSET);
        ElementSelectorForm.ClearSelectableModels;
        ElementSelectorForm.AddSelectableModels(CLASSIFIER_FILTERINGSET);
        if ElementSelectorForm.Execute(TXT_ELEMSELTTL_INSTANTIATION) then begin
          ReferenceChange(AElementSet.Items[0] as PElement, 'Instantiation', ElementSelectorForm.SelectedModel);
        end;
      end;
    end
    else if Key = 'Operation' then begin
      if AElementSet.Count = 1 then begin
        // <Selectable Element> PUMLOperation (in SendAction.Message.Base / SendAction.Stimulus.Classifier)
        if AElementSet.Items[0] is PUMLCallAction then begin
          ElementListForm.ClearListElements;
          ElementListForm.AddListElementsByCollection(GetSuitableClassifier(AElementSet.Items[0] as PUMLCallAction), 'Operations', True);
          ElementListForm.AllowNull := True;

          Elem := AElementSet.Items[0] as PModel;
          //TypeElem := nil;
          TypeElem2 := (Elem as PUMLCallAction).Operation;
          if TypeElem2 <> nil then ElementListForm.SetReservedModelToSelect(TypeElem2);

          if ElementListForm.Execute(TXT_ELEMLSTTTL_OPERATION) then begin
            ReferenceChange(AElementSet.Items[0] as PElement, 'Operation', ElementListForm.SelectedModel);
          end;
        end;
      end;
    end
    else if Key = 'Signal' then begin
      if AElementSet.Count = 1 then begin
        // <Selectable Element> PUMLSignal inherited
        ElementListForm.ClearListElements;
        ElementListForm.AddListElementsByClass('UMLSignal', True);
        ElementListForm.AllowNull := True;
        if ElementListForm.Execute(TXT_ELEMLSTTTL_SIGNAL) then begin
          ReferenceChange(AElementSet.Items[0] as PElement, 'Signal', ElementListForm.SelectedModel);
        end;
      end;
    end
    else if Key = 'SubMachine' then begin
      if AElementSet.Count = 1 then begin
        // <Selectable Element> PUMLStateMachine inherited
        ElementListForm.ClearListElements;
        ElementListForm.AddListElementsByClass('UMLStateMachine', True);
        ElementListForm.AllowNull := True;
        if ElementListForm.Execute(TXT_ELEMLSTTTL_SUBMACHINE) then begin
          ReferenceChange(AElementSet.Items[0] as PElement, 'Submachine', ElementListForm.SelectedModel);
        end;
      end;
    end
    else if Key = 'Base' then begin
      if AElementSet.Count = 1 then begin
        // <Selectable Element> PUMLClassifier inherited
        ElementSelectorForm.Filter(CLASSIFIER_FILTERINGSET);
        ElementSelectorForm.ClearSelectableModels;
        ElementSelectorForm.AddSelectableModels(CLASSIFIER_FILTERINGSET);
        if ElementSelectorForm.Execute(TXT_ELEMSELTTL_BASE) then begin
          ReferenceChange(AElementSet.Items[0] as PElement, 'Base', ElementSelectorForm.SelectedModel);
        end;
      end;
    end
    else if Key = 'Stereotype' then begin
      if StereotypeSelectorForm.Execute(AElementSet) then begin
        ElementsStereotypeChange(AElementSet, StereotypeSelectorForm.ProfileName, StereotypeSelectorForm.StereotypeName);
      end;
    end
    else if Key = 'Value' then begin
      if AElementSet.Count = 1 then begin
        // <Selectable Element> PUMLAttribute
        if AElementSet.Items[0] is PUMLAttributeLink then begin
          ElementListForm.ClearListElements;
          ElementListForm.AddListElementsByClass('UMLInstance', True);
          ElementListForm.AllowNull := True;
          ValueElem := (AElementSet.Items[0] as PUMLAttributeLink).Value_;
          if ValueElem <> nil then ElementListForm.SetReservedModelToSelect(ValueElem);
          if ElementListForm.Execute(TXT_ELEMLSTTTL_VALUE) then begin
            if ElementListForm.SelectedModel = nil then
              ValueExpressionChange(AElementSet.Items[0] as PElement, Key, '', nil)
            else
              ValueExpressionChange(AElementSet.Items[0] as PElement, Key, ElementListForm.SelectedModel.Name, ElementListForm.SelectedModel);
          end;
        end;
      end;
    end
    else if Key = 'Attribute' then begin
      if AElementSet.Count = 1 then begin
        // <Selectable Element> PUMLAttribute
        if AElementSet.Items[0] is PUMLAttributeLink then begin
          ElementListForm.ClearListElements;
          ElementListForm.AddListElementsByCollection((AElementSet.Items[0] as PUMLAttributeLink).Instance.Classifier, 'Attributes', True);
          ElementListForm.AllowNull := True;
          Attr := (AElementSet.Items[0] as PUMLAttributeLink).Attribute;
          if Attr <> nil then ElementListForm.SetReservedModelToSelect(Attr);
          if ElementListForm.Execute(TXT_ELEMLSTTTL_ATTRIBUTE) then begin
            ReferenceChange(AElementSet.Items[0] as PElement, 'Attribute', ElementListForm.SelectedModel);
          end;
        end;
      end;
    end
    else if Key = 'RepresentedElement' then begin
      if AElementSet.Count = 1 then begin
        // <Selectable Element> PUMLElement inherited
        ElementSelectorForm.Filter(BASIC_FILTERINGSET);
        ElementSelectorForm.ClearSelectableModels;
        ElementSelectorForm.AddSelectableModels(BASIC_FILTERINGSET);
        if ElementSelectorForm.Execute then begin
          ReferenceChange(AElementSet.Items[0] as PElement, 'RepresentedElement', ElementSelectorForm.SelectedModel);
        end;
      end;
    end
  end; // of if not FReadOnly then

  // (Collection kind)
  if Key = 'Attributes' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'Operations' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'TemplateParameters' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'Literals' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'Residents' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'DeployedComponents' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'DeployedArtifacts' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'EntryActions' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'DoActions' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'ExitActions' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'Parameters' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'RaisedSignals' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'Effects' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'Triggers' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'End1.Qualifiers' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'End2.Qualifiers' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'Qualifiers' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'Slots' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end
  else if Key = 'ExtensionPoints' then begin
    if AElementSet.Count = 1 then
      CollectionEdit(AElementSet.Items[0] as PElement, Key);
  end;
end;

// PUMLPropertyAdaptor
////////////////////////////////////////////////////////////////////////////////

end.
