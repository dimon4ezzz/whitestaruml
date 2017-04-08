unit InspectorFrm;

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

// =============================================================================
//
// DOCKING FORM component development notice
// -----------------------------------------
//
//   (1) Tag property means whether current DOCKING FORM is Active or not.
//       - if Tag='1', 'Active'
//       - if Tag='0', 'Deactive'
//   (2) set BorderWidth to '1'. (this prevent that GrabberBar and
//       internal GUI component are wholly attached out in docking.)
//   (3) catch GUI component's OnEnter, OnExit Events in current Form
//       - in case of OnEnter, set to Active status(Tag=1),
//       - in case of OnExit, set to Deactive status(Tag=0).
//   (4) add IsActive function.
//   (5) add OnActive, OnDeactive Events
//
// =============================================================================

interface

uses
  BasicClasses, Core, ExtCore, UMLModels, PropEdt, PropEdtWithJvclInspector, UMLProps, ElemSelFrm,
  Classes, Forms, Controls, ImgList, ExtCtrls, Registry, Windows,
  StdCtrls, AreaTitleBar, FlatPanel;

type
  // PSelectionKind
  PInspectorStatusKind = (isNothingSelected, isSingleSelected, isMultiSelected);

  // TInspectorFrame
  TInspectorFrame = class(TFrame)
    ClientPanel: TPanel;
    PageControlImageList: TImageList;
    InspectorTitleBarGapPanel: TPanel;
    SelectionTextGapPanel: TPanel;
    PropertyEditor: TPropertyEditorWithJvclInspector;
    SelectionTextPanel: TFlatPanel;
    SelectionText: TLabel;
    procedure FrameResize(Sender: TObject);
  private
    UMLPropertyAdaptor: PUMLPropertyAdaptor;
    FInspectorStatus: PInspectorStatusKind;
    FReadOnly: Boolean;
    FOnNameChange: PNameChangeEvent;
    FOnAttributeChange: PAttributeChangeEvent;
    FOnElementsAttributeChange: PElementsAttributeChangeEvent;
    FOnReferenceChange: PReferenceChangeEvent;
    FOnTypeExpressionChange: PTypeExpressionChangeEvent;
    FOnElementsStereotypeChange: PElementsStereotypeChangeEvent;
    FOnActionKindChange: PActionKindChangeEvent;
    FOnPropertySelected: PPropertySelectedEvent;
    FOnValueExpressionChange: PValueExpressionChangeEvent;
    procedure InitializePropertyEditor;
    procedure InitializePropertyAdaptor;
    procedure NameChanged(Element: PElement; Name: string);
    procedure AttributeChanged(Element: PElement; Key, Value: string);
    procedure ElementsAttributeChanged(ElementSet: PElementOrderedSet; Key, Value: string);
    procedure ReferenceChanged(Element: PElement; Key: string; Value: PElement);
    procedure TypeExpressionChanged(Element: PElement; Key, TypeExpr: string; TypeRef: PElement);
    procedure ElementsStereotypeChanged(ElementSet: PElementOrderedSet; StereotypeProfile: string; Stereotype: string);
    procedure ActionKindChanged(Element: PElement; ActionKind: string);
    procedure ValueExpressionChanged(Element: PElement; Key, ValueExpr: string; ValueRef: PElement);
    procedure UMLPropertyAdaptorNameChange(Sender: TObject; Element: PElement; Name: string);
    procedure UMLPropertyAdaptorElementsStereotypeChange(Sender: TObject; ElementSet: PElementOrderedSet; StereotypeProfile: string; Stereotype: string);
    procedure UMLPropertyAdaptorAttributeChange(Sender: TObject; Element: PElement; Key, Value: string);
    procedure UMLPropertyAdaptorElementsAttributeChange(Sender: TObject; ElementSet: PElementOrderedSet; Key, Value: string);
    procedure UMLPropertAdaptorReferenceChange(Sender: TObject; Element: PElement; Key: string; Value: PElement);
    procedure UMLPropertyAdaptorTypeExpressionChange(Sender: TObject; Element: PElement; Key, TypeExpr: string; TypeRef: PElement);
    procedure UMLPropertyAdaptorActionKindChange(Sender: TObject; Element: PElement; ActionKind: string);
    procedure UMLPropertyAdaptorCollectionEdit(Sender: TObject; Element: PElement; Key: string);
    procedure UMLPropertyAdaptorValueExpressionChange(Sender: TObject; Element: PElement; Key, ValueExpr: string; ValueRef: PElement);
    procedure SetProject(Project: PUMLProject);
    function GetProject: PUMLProject;
    function GetInspectingElement(Index: Integer): PModel;
    function GetInspectingElementCount: Integer;
    procedure SetInspectorStatus(Value: PInspectorStatusKind);
    procedure SetReadOnly(Value: Boolean);
    procedure UpdateUIStatus;
    procedure UpdateSelectionText;
    procedure PropertySelectHandler(Sender: TObject; PropertyName: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure InitializeUserInterfaces;
    procedure ClearInspectingElements;
    procedure AddInspectingElement(Elem: PModel);
    procedure RemoveInspectingElement(Elem: PModel);
    procedure Inspect;
    procedure UpdateInspector;
    procedure SetFocusOnPropertyEditor;
    procedure ApplyChanges;
    property Project: PUMLProject read GetProject write SetProject;
    property InspectingElements[Index: Integer]: PModel read GetInspectingElement;
    property InspectingElementCount: Integer read GetInspectingElementCount;
    property InspectorStatus: PInspectorStatusKind read FInspectorStatus write SetInspectorStatus;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property OnNameChange: PNameChangeEvent read FOnNameChange write FOnNameChange;
    property OnAttributeChange: PAttributeChangeEvent read FOnAttributeChange write FOnAttributeChange;
    property OnElementsAttributeChange: PElementsAttributeChangeEvent read FOnElementsAttributeChange write FOnElementsAttributeChange;
    property OnReferenceChange: PReferenceChangeEvent read FOnReferenceChange write FOnReferenceChange;
    property OnTypeExpressionChange: PTypeExpressionChangeEvent read FOnTypeExpressionChange write FOnTypeExpressionChange;
    property OnElementsStereotypeChange: PElementsStereotypeChangeEvent read FOnElementsStereotypeChange write FOnElementsStereotypeChange;
    property OnActionKindChange: PActionKindChangeEvent read FOnActionKindChange write FOnActionKindChange;
    property OnPropertySelected: PPropertySelectedEvent read FOnPropertySelected write FOnPropertySelected;
    property OnValueExpressionChange: PValueExpressionChangeEvent read FOnValueExpressionChange write FOnValueExpressionChange;
  end;

const
  RK_ROOT: HKEY = HKEY_CURRENT_USER;
  //RK_LOCATION: string = '\SOFTWARE\StarUML\';
  RK_LOCATION = RK_BASE_LOCATION;
  RK_INSPECTOR: string = 'Inspector Window';

implementation

uses
  dxDockControl, MainFrm, ColEdtFrm, ElemLstFrm, NLS_StarUML, Graphics,
  SysUtils, Dialogs;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TInspectorFrame

constructor TInspectorFrame.Create(AOwner: TComponent);
begin
  inherited;
  FInspectorStatus := isNothingSelected;
end;

destructor TInspectorFrame.Destroy;
begin
  UMLPropertyAdaptor.Free;
  inherited;
end;

procedure TInspectorFrame.InitializePropertyEditor;
begin
  PropertyEditor.OnPropertySelected := PropertySelectHandler;
end;

procedure TInspectorFrame.InitializePropertyAdaptor;
begin
  // Connecting EventHanders for UMLPropertyAdaptor
  UMLPropertyAdaptor := PUMLPropertyAdaptor.Create;
  UMLPropertyAdaptor.VisibilityKindImages := PropertyEditor.VisibilityImageList;
  UMLPropertyAdaptor.AggregationKindImages := PropertyEditor.AggregationImageList;
  UMLPropertyAdaptor.PseudostaateKindImages := PropertyEditor.PsedostatsImageList;
  UMLPropertyAdaptor.ActionKindImages := PropertyEditor.ActionKindImageList;
  UMLPropertyAdaptor.OnNameChange := UMLPropertyAdaptorNameChange;
  UMLPropertyAdaptor.OnElementsStereotypeChange := UMLPropertyAdaptorElementsStereotypeChange;
  UMLPropertyAdaptor.OnAttributeChange := UMLPropertyAdaptorAttributeChange;
  UMLPropertyAdaptor.OnElementsAttributeChange := UMLPropertyAdaptorElementsAttributeChange;
  UMLPropertyAdaptor.OnReferenceChange := UMLPropertAdaptorReferenceChange;
  UMLPropertyAdaptor.OnTypeExpressionChange := UMLPropertyAdaptorTypeExpressionChange;
  UMLPropertyAdaptor.OnActionKindChange := UMLPropertyAdaptorActionKindChange;
  UMLPropertyAdaptor.OnCollectionEdit := UMLPropertyAdaptorCollectionEdit;
  UMLPropertyAdaptor.OnValueExpressionChange := UMLPropertyAdaptorValueExpressionChange;
  PropertyEditor.PropertyAdaptor := UMLPropertyAdaptor;
end;

procedure TInspectorFrame.NameChanged(Element: PElement; Name: string);
begin
  if Assigned(FOnNameChange) then
    FOnNameChange(Self, Element, Name);
end;

procedure TInspectorFrame.AttributeChanged(Element: PElement; Key, Value: string);
begin
  if Assigned(FOnAttributeChange) then
    FOnAttributeChange(Self, Element, Key, Value);
end;

procedure TInspectorFrame.ElementsAttributeChanged(ElementSet: PElementOrderedSet; Key, Value: string);
begin
  if Assigned(FOnElementsAttributeChange) then
    FOnElementsAttributeChange(Self, ElementSet, Key, Value);
end;

procedure TInspectorFrame.ReferenceChanged(Element: PElement; Key: string; Value: PElement);
begin
  if Assigned(FOnReferenceChange) then
    FOnReferenceChange(Self, Element, Key, Value);
end;

procedure TInspectorFrame.TypeExpressionChanged(Element: PElement; Key, TypeExpr: string; TypeRef: PElement);
begin
  if Assigned(FOnTypeExpressionChange) then
    FOnTypeExpressionChange(Self, Element, Key, TypeExpr, TypeRef);
end;

procedure TInspectorFrame.ElementsStereotypeChanged(ElementSet: PElementOrderedSet; StereotypeProfile: string; Stereotype: string);
begin
  if Assigned(FOnElementsStereotypeChange) then
    FOnElementsStereotypeChange(Self, ElementSet, StereotypeProfile, Stereotype);
end;

procedure TInspectorFrame.ActionKindChanged(Element: PElement; ActionKind: string);
begin
  if Assigned(FOnActionKindChange) then
    FOnActionKindChange(Self, Element, ActionKind);
end;

procedure TInspectorFrame.ValueExpressionChanged(Element: PElement; Key, ValueExpr: string; ValueRef: PElement);
begin
  if Assigned(FOnValueExpressionChange) then
    FOnValueExpressionChange(Self, Element, Key, ValueExpr, ValueRef);
end;

procedure TInspectorFrame.UMLPropertyAdaptorNameChange(Sender: TObject; Element: PElement; Name: string);
begin
  NameChanged(Element, Name);
end;

procedure TInspectorFrame.UMLPropertyAdaptorElementsStereotypeChange(Sender: TObject; ElementSet: PElementOrderedSet; StereotypeProfile: string; Stereotype: string);
begin
  ElementsStereotypeChanged(ElementSet, StereotypeProfile, Stereotype);
end;

procedure TInspectorFrame.UMLPropertyAdaptorAttributeChange(Sender: TObject; Element: PElement; Key, Value: string);
begin
  AttributeChanged(Element, Key, Value);
end;

procedure TInspectorFrame.UMLPropertyAdaptorElementsAttributeChange(Sender: TObject; ElementSet: PElementOrderedSet; Key, Value: string);
begin
  ElementsAttributeChanged(ElementSet, Key, Value);
end;

procedure TInspectorFrame.UMLPropertAdaptorReferenceChange(Sender: TObject; Element: PElement; Key: string; Value: PElement);
begin
  ReferenceChanged(Element, Key, Value);
end;

procedure TInspectorFrame.UMLPropertyAdaptorTypeExpressionChange(Sender: TObject; Element: PElement; Key, TypeExpr: string; TypeRef: PElement);
begin
  TypeExpressionChanged(Element, Key, TypeExpr, TypeRef);
end;

procedure TInspectorFrame.UMLPropertyAdaptorActionKindChange(Sender: TObject; Element: PElement; ActionKind: string);
begin
  ActionKindChanged(Element, ActionKind);
end;

procedure TInspectorFrame.UMLPropertyAdaptorCollectionEdit(Sender: TObject; Element: PElement; Key: string);
begin
  CollectionEditorForm.ShowCollection(Element as PModel, Key);
end;

procedure TInspectorFrame.UMLPropertyAdaptorValueExpressionChange(Sender: TObject; Element: PElement; Key, ValueExpr: string; ValueRef: PElement);
begin
  ValueExpressionChanged(Element, Key, ValueExpr, ValueRef);
end;

procedure TInspectorFrame.SetProject(Project: PUMLProject);
begin
  ElementSelectorForm.Project := Project;
end;

function TInspectorFrame.GetProject: PUMLProject;
begin
  Result := ElementSelectorForm.Project;
end;

function TInspectorFrame.GetInspectingElement(Index: Integer): PModel;
begin
  Result := PropertyEditor.InspectingElements[Index] as PModel;
end;

function TInspectorFrame.GetInspectingElementCount: Integer;
begin
  Result := PropertyEditor.InspectingElementCount;
end;

procedure TInspectorFrame.SetInspectorStatus(Value: PInspectorStatusKind);
begin
  FInspectorStatus := Value;
  case FInspectorStatus of
    isNothingSelected: begin
      PropertyEditor.Enabled := False;
    end;
    isSingleSelected: begin
      PropertyEditor.Enabled := True;
    end;
    isMultiSelected:  begin
      PropertyEditor.Enabled := True;
    end;
  end;
end;

procedure TInspectorFrame.SetReadOnly(Value: Boolean);
begin
  if FReadOnly <> Value then begin
    FReadOnly := Value;
    PropertyEditor.ReadOnly := FReadOnly;
  end;
end;

procedure TInspectorFrame.UpdateUIStatus;
var
  I: Integer;
  D: PDocument;
begin
  if InspectingElementCount = 0 then
  begin
    InspectorStatus := isNothingSelected;
    ReadOnly := False;
  end
  else if InspectingElementCount = 1 then
  begin
    InspectorStatus := isSingleSelected;
    D := InspectingElements[0].GetContainingDocument;
    if D <> nil then ReadOnly := D.ReadOnly;
  end
  else begin
    InspectorStatus := isMultiSelected;
    ReadOnly := False;
    for I := 0 to InspectingElementCount - 1 do
    begin
      D := InspectingElements[I].GetContainingDocument;
      if D <> nil then ReadOnly := ReadOnly or D.ReadOnly;
    end;
  end;
  UpdateSelectionText;
end;

procedure TInspectorFrame.UpdateSelectionText;
var
  M: PModel;

  procedure AutoSizeSelectionText;
  var
    DC: HDC;
    SaveFont: HFont;
    TextSize: TSize;
  begin
    DC := GetDC(0);
    SaveFont := SelectObject(DC, SelectionText.Font.Handle);
    GetTextExtentPoint32(DC, PChar(SelectionText.Caption), Length(SelectionText.Caption), TextSize);
    SelectObject(DC, SaveFont);
    ReleaseDC(0, DC);
    if ClientWidth > BorderWidth * 2 then
      SelectionText.SetBounds(SelectionText.Left, SelectionText.Top,
        (TextSize.CX + 1) mod (ClientWidth - BorderWidth * 2) + (GetSystemMetrics(SM_CXBORDER) * 4),
        TextSize.CY * ((TextSize.CX + 1) div (ClientWidth - BorderWidth * 2) + 1) + (GetSystemMetrics(SM_CYBORDER) * 4));
  end;

begin
  case InspectingElementCount of
    0:
      SelectionText.Caption := ' ' + TXT_ELEM_SEL_NOTHING;
    1:
      begin
        M := InspectingElements[0] as PModel;
        SelectionText.Caption := ' (' + Copy(M.ClassName, 2, Length(M.ClassName) - 1) + ') ' + M.Name;
      end;
    else
      SelectionText.Caption := ' ' + TXT_ELEM_SEL_MULTIPLE;
  end;
  // if want to wordwrap model name with TStaticText, use the following function.
  // AutoSizeSelectionText;
end;

procedure TInspectorFrame.PropertySelectHandler(Sender: TObject; PropertyName: string);
begin
  if Assigned(FOnPropertySelected) then
    FOnPropertySelected(Self, PropertyName);
end;

procedure TInspectorFrame.InitializeUserInterfaces;
begin
  InitializePropertyEditor;
  InitializePropertyAdaptor;
{
  SelectionText.Font.Name := 'Tahoma';
  SelectionText.Font.Size := 8;
  SelectionText.Font.Style := [fsBold];
}
end;

procedure TInspectorFrame.ClearInspectingElements;
begin
  PropertyEditor.ClearInspectingElements;
  // DocumentationEditor.InspectingElement := nil;
  // AttachmentEditor.TargetModel := nil;
end;

procedure TInspectorFrame.AddInspectingElement(Elem: PModel);
begin
  PropertyEditor.AddInspectingElement(Elem);
  if PropertyEditor.InspectingElementCount = 1 then begin
    // AttachmentEditor.TargetModel := Elem;
    // DocumentationEditor.InspectingElement := Elem;
  end
  else begin
    // AttachmentEditor.TargetModel := nil;
    // DocumentationEditor.InspectingElement := nil;
  end;
end;

procedure TInspectorFrame.RemoveInspectingElement(Elem: PModel);
begin
  PropertyEditor.RemoveInspectingElement(Elem);
  // AttachmentEditor.TargetModel := nil;
  // DocumentationEditor.InspectingElement := nil;
end;

procedure TInspectorFrame.Inspect;
begin
  if Visible then begin
    PropertyEditor.InspectElements;
    UpdateSelectionText;
    UpdateUIStatus;
  end;
end;

procedure TInspectorFrame.UpdateInspector;
begin
  PropertyEditor.UpdateProperties;
  UpdateSelectionText;
  UpdateUIStatus;
end;

procedure TInspectorFrame.SetFocusOnPropertyEditor;
var
  TabContainer : TdxTabContainerDockSite;
begin
  TabContainer := MainForm.PropertiesDockPanel.TabContainer;
  // Is PropertiesDockPanel inside tab panel?
  if Assigned (TabContainer) then begin
    // Set PropertiesDockPanel active panel
    TabContainer.ActiveChild := MainForm.PropertiesDockPanel;
  end;
  // Now focus can be set
  if MainForm.PropertiesDockPanel.Visible then
    PropertyEditor.SetFocus;
end;

procedure TInspectorFrame.ApplyChanges;
begin
  PropertyEditor.ApplyChanges;
end;

// TInspectorFrame
////////////////////////////////////////////////////////////////////////////////

procedure TInspectorFrame.FrameResize(Sender: TObject);
begin
  UpdateSelectionText;
end;

end.

