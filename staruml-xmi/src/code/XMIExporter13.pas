unit XMIExporter13;

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
  XMIExporter,
  Classes, WhiteStarUML_TLB;

type
  // PXMIViewStyleKind
  PXMIViewStyleKind = (skLineColor, skFillColor, skFont, skAutoResize, skAttribute, skOperation, skLiteral, skMessage, skSyncItem);
  PXMIViewStyleKindSet = set of PXMIViewStyleKind;

  // PXMIExporter13
  PXMIExporter13 = class(PXMIExporter)
  private
    FRoseExtended: Boolean;
    // options
    FExportViews: Boolean;
    // internal variable
    ElementCount: Integer;
    CurrentIndex: Integer;
    // XMI enumeration type converting functions
    function ConvertXMIVisibilityKind(Value: string): string;
    function ConvertXMIScopeKind(Value: string): string;
    function ConvertXMIChangeabilityKind(Value: string): string;
    function ConvertXMIOrderingKind(Value: string): string;
    function ConvertXMIAggregationKind(Value: string): string;
    function ConvertXMICallConcurrencyKind(Value: string): string;
    function ConvertXMIParameterDirectionKind(Value: string): string;
    function ConvertXMIPseudostateKind(Value: string): string;
    // prearrangement
    function GetCompositeCollectionCount(Element: IElement; CollectionName: string): Integer;
    function GetExportingElementCount(Element: IElement): Integer;
    // first phase (construct XMI elemet structure)
    procedure ConstructXMIElement(Element: IElement; RefXMIElement: PXMIElement);
    function CreateUMLAssociationXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
    function CreateUMLAssociationClassXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
    function CreateUMLClassXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
    function CreateUMLCompositeStateXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
    function CreateUMLObjectXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
    function CreateUMLLinkXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
    function CreateUMLLinkEndXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
    procedure ComposeModel(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeDiagram(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLActivityGraph(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLAssociation(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLAssociationClass(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLAssociationEnd(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLBehavioralFeature(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLClassifier(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLCollaboration(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLCollaborationInstanceSet(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLCompositeState(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLEnumeration(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLInteraction(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLInteractionInstanceSet(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLLink(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLMessage(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLModelElement(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLNamespace(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLProject(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLState(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLStateMachine(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLStimulus(Element: IElement; RefXMIElement: PXMIElement);
    procedure ComposeUMLTransition(Element: IElement; RefXMIElement: PXMIElement);
    // and so on...
    // second phase (set complete attributes)
    procedure FillOutXMIAttributes(Element: IElement);
    procedure SetAttributesModel(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesExtensibleModel(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLAction(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLActionState(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLActivityGraph(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLActor(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLAssociation(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLAssociationClass(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLAssociationEnd(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLAssociationEndRole(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLAssociationRole(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLAttribute(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLBehavioralFeature(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLCallAction(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLCallEvent(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLChangeEvent(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLClass(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLClassifier(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLClassifierRole(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLCollaboration(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLCollaborationInstanceSet(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLComponent(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLComponentInstance(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLCompositeState(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLCreateAction(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLDependency(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLDestroyAction(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLElement(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLEnumeration(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLEnumerationLiteral(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLEvent(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLException(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLExtend(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLFinalState(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLFeature(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLGeneralizableElement(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLGeneralization(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLInclude(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLInstance(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLInteraction(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLInteractionInstanceSet(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLInterface(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLLink(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLLinkEnd(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLMessage(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLModel(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLModelElement(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLNamespace(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLNode(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLNodeInstance(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLObject(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLOperation(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLPackage(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLParameter(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLPartition(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLPseudostate(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLRealization(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLRelationship(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLReturnAction(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLSendAction(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLSignal(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLSignalEvent(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLSimpleState(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLState(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLStateMachine(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLStateVertex(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLStimulus(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLStructuralFeature(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLSubactivityState(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLSubmachineState(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLSubsystem(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLTemplateParameter(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLTimeEvent(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLTransition(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLUninterpretedAction(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesUMLUseCase(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesDiagram(Element: IElement; RefXMIElement: PXMIElement);
    procedure SetAttributesView(Element: IElement; RefXMIElement: PXMIElement);
    // and so on...
    // view property related
    function GetDiagramElementStylePrefix(View: IView): string;
    function GetXMIViewStyleKindSet(View: IView): PXMIViewStyleKindSet;
    function GetDiagramElementStyleValue(View: IView): string;
    function GetDiagramElementGeometryValue(View: IView): string;
    // 1.3 specific functions
    // (ex) elementResidence related
    procedure ComposeXMIMultiplicity(XMIElement: PXMIElement; Element: IElement; AttrName: string; AttrXMIElemName: string);
    procedure ComposeXMIMultiplicity2(XMIElement: PXMIElement; AttrXMIElemName: string; Value: string);
    procedure ComposeXMIExpression(XMIElement: PXMIElement; Element: IElement; AttrName: string; AttrXMIElemName: string; XMIExpressionName: string);
    procedure ComposeXMIExpression2(XMIElement: PXMIElement; AttrXMIElemName: string; XMIExpressionName: string; Value: string);
    procedure ComposeXMIComponentResident(XMIElement: PXMIElement; Element: IElement);
    procedure ComposeXMITransitionGuard(XMIElement: PXMIElement; Element: IElement);
    function AcquireDataTypeXMIElement(DataTypeName: string; RefXMIElement: PXMIElement): PXMIElement;
    function AcquireParameterXMIElementForTemplateParameter(XMIElement: PXMIElement): PXMIElement;
    function CreateCommentXMIElement(RefXMIElement: PXMIElement; Text: string): PXMIElement;
    function FindTopLevelUMLModel(Project: IUMLProject; ModelName: string): IUMLModel;
    // UML extension related
    function AcquireSteretypeXMIElement(StereotypeName: string; RefXMIElement: PXMIElement): PXMIElement; overload;
    function AcquireSteretypeXMIElement(AStereotype: IStereotype; RefXMIElement: PXMIElement): PXMIElement; overload;
    procedure SetXMIStereotype(RefXMIElement: PXMIElement); overload;
    procedure SetXMIStereotype(RefXMIElement: PXMIElement; StereotypeName: string); overload;
    procedure SetXMIConstrains(RefXMIElement: PXMIElement);
    procedure SetXMITaggedValues(RefXMIElement: PXMIElement);
    procedure SetXMITaggedValue(RefXMIElement: PXMIElement; TaggedValueName: string; Value: string);

    procedure PerformFirstPhase;
    procedure PerformSecondPhase;
  protected
    procedure BuildXMIElements; override;
  public
    constructor Create; override;
    property RoseExtended: Boolean read FRoseExtended write FRoseExtended;
    // options
    property ExportViews: Boolean read FExportViews write FExportViews;
  end;

implementation

uses
  Utilities, NLS_XMIAddIn, Symbols, 
  Graphics, SysUtils, Types;

////////////////////////////////////////////////////////////////////////////////
// PXMIExporter13

constructor PXMIExporter13.Create;
begin
  inherited;
  FXMIVersion := '1.1';
  FUMLVersion := '1.3';
  FUMLNamespace := XMI_NAMESPACE_UML13;
end;

function PXMIExporter13.ConvertXMIVisibilityKind(Value: string): string;
begin
  if Value = 'vkPublic' then Result := 'public'
  else if Value = 'vkProtected' then Result := 'protected'
  else if Value = 'vkPrivate' then Result := 'private'
  else if Value = 'vkPackage' then Result := 'public'
  else Result := '';
end;

function PXMIExporter13.ConvertXMIScopeKind(Value: string): string;
begin
  if Value = 'skInstance' then Result := 'instance'
  else if Value = 'skClassifier' then Result := 'classifier'
  else Result := '';
end;

function PXMIExporter13.ConvertXMIChangeabilityKind(Value: string): string;
begin
  if Value = 'ckChangeable' then Result := 'changeable'
  else if Value = 'ckFrozen' then Result := 'frozen'
  else if Value = 'ckAddOnly' then Result := 'addOnly'
  else Result := '';
end;

function PXMIExporter13.ConvertXMIOrderingKind(Value: string): string;
begin
  if Value = 'okUnordered' then Result := 'unordered'
  else if Value = 'okOrdered' then Result := 'ordered'
  else Result := '';
end;

function PXMIExporter13.ConvertXMIAggregationKind(Value: string): string;
begin
  if Value = 'akNone' then Result := 'none'
  else if Value = 'akAggregate' then Result := 'aggregate'
  else if Value = 'akComposite' then Result := 'composite'
  else Result := '';
end;

function PXMIExporter13.ConvertXMICallConcurrencyKind(Value: string): string;
begin
  if Value = 'cckSequential' then Result := 'sequential'
  else if Value = 'cckGuarded' then Result := 'guarded'
  else if Value = 'cckConcurrent' then Result := 'concurrent'
  else Result := '';
end;

function PXMIExporter13.ConvertXMIParameterDirectionKind(Value: string): string;
begin
  if Value = 'pdkIn' then Result := 'in'
  else if Value = 'pdkInout' then Result := 'inout'
  else if Value = 'pdkOut' then Result := 'out'
  else if Value = 'pdkReturn' then Result := 'return'
  else Result := '';
end;

function PXMIExporter13.ConvertXMIPseudostateKind(Value: string): string;
begin
  if Value = 'pkChoice' then Result := 'branch'
  else if Value = 'pkDeepHistory' then Result := 'deepHistory'
  else if Value = 'pkSynchronization' then Result := '' // join or fork
  else if Value = 'pkInitial' then Result := 'initial'
  else if Value = 'pkJunction' then Result := 'junction'
  else if Value = 'pkShallowHistory' then Result := 'shallowHistory'
  else if Value = 'pkDecision' then Result := 'branch'
  else Result := '';
end;

function PXMIExporter13.GetCompositeCollectionCount(Element: IElement; CollectionName: string): Integer;
var
  C, I: Integer;
begin
  C := 0;
  for I := 0 to Element.MOF_GetCollectionCount(CollectionName) - 1 do
    C := C + GetExportingElementCount(Element.MOF_GetCollectionItem(CollectionName, I));
  Result := C;
end;

function PXMIExporter13.GetExportingElementCount(Element: IElement): Integer;
var
  D: IUMLDiagram;
  US: IUMLStateMachine;
  C: Integer;
begin
  Result := 0;
  if not Assigned(Element) then
    Exit;

  C := 0;
  if FRoseExtended and FExportViews and Element.IsKindOf(ELEM_MODEL) then
    C := C + GetCompositeCollectionCount(Element, UML_PROP_OWNED_DIAGRAMS);
  if Element.IsKindOf(ELEM_DIAGRAM) then begin
    Assert(Element.QueryInterface(IDiagram, D) = S_OK);
    C := C + GetCompositeCollectionCount(D.DiagramView, UML_PROP_OWNED_VIEWS);
  end;
  if Element.IsKindOf(ELEM_VIEW) then
    C := C + GetCompositeCollectionCount(Element, UML_PROP_CONTAINED_VIEWS);
  if Element.IsKindOf(UML_ACTIVITYGRAPH) then
    C := C + GetCompositeCollectionCount(Element, UML_PROP_PARTITIONS);
  if Element.IsKindOf(UML_ASSOCIATION) then
    C := C + GetCompositeCollectionCount(Element, UML_PROP_CONNECTIONS);
  if Element.IsKindOf(UML_ASSOCIATION_END) then
    C := C + GetCompositeCollectionCount(Element, UML_PROP_QUALIFIERS);
  if Element.IsKindOf(UML_BEHAVIORAL_FEATURE) then
    C := C + GetCompositeCollectionCount(Element, UML_PROP_PARAMETERS);
  if Element.IsKindOf(UML_CLASSIFIER) then begin
    C := C + GetCompositeCollectionCount(Element, UML_PROP_ATTRIBUTES);
    C := C + GetCompositeCollectionCount(Element, UML_PROP_OPERATIONS);
    C := C + GetCompositeCollectionCount(Element, UML_PROP_OWNED_COLLABORATIONS);
    C := C + GetCompositeCollectionCount(Element, UML_PROP_OWNED_COLLABORATION_INSTANCE_SETS);
  end;
  if Element.IsKindOf(UML_OPERATION) then begin
    C := C + GetCompositeCollectionCount(Element, UML_PROP_OWNED_COLLABORATIONS);
    C := C + GetCompositeCollectionCount(Element, UML_PROP_OWNED_COLLABORATION_INSTANCE_SETS);
  end;
  if Element.IsKindOf(UML_COLLABORATION) then
    C := C + GetCompositeCollectionCount(Element, UML_PROP_INTERACTIONS);
  if Element.IsKindOf(UML_COLLABORATION_INSTANCESET) then begin
    C := C + GetCompositeCollectionCount(Element, UML_PROP_INTERACTION_INSTANCE_SETS);
    C := C + GetCompositeCollectionCount(Element, UML_PROP_PARTICIPATING_INSTANCES);
    C := C + GetCompositeCollectionCount(Element, UML_PROP_PARTICIPATING_LINKS);
  end;
  if Element.IsKindOf(UML_COMPOSITE_STATE) then
    C := C + GetCompositeCollectionCount(Element, UML_PROP_SUBVERTICES);
  if Element.IsKindOf(UML_ENUMERATION) then
    C := C + GetCompositeCollectionCount(Element, UML_PROP_LITERALS);
  if Element.IsKindOf(UML_INTERACTION) then
    C := C + GetCompositeCollectionCount(Element, UML_PROP_MESSAGES);
  if Element.IsKindOf(UML_INTERACTION_INSTANCESET) then
    C := C + GetCompositeCollectionCount(Element, UML_PROP_PARTICIPATING_STIMULI);
  if Element.IsKindOf(UML_LINK) then
    C := C + GetCompositeCollectionCount(Element, UML_PROP_CONNECTIONS);
//  if Element.IsKindOf(UML_MESSAGE) then
//    C := C + GetCompositeCollectionCount(Element, UML_PROP_ACTIONS);
  if Element.IsKindOf(UML_MODEL_ELEMENT) then begin
    C := C + GetCompositeCollectionCount(Element, UML_PROP_TEMPLATE_PARAMETERS);
    C := C + GetCompositeCollectionCount(Element, UML_PROP_BEHAVIORS);
  end;
  if Element.IsKindOf(UML_NAMESPACE) then
    C := C + GetCompositeCollectionCount(Element, UML_PROP_OWNED_ELEMENTS);
  if Element.IsKindOf(UML_STATE) then begin
    C := C + GetCompositeCollectionCount(Element, UML_PROP_ENTRY_ACTIONS);
    C := C + GetCompositeCollectionCount(Element, UML_PROP_DO_ACTIVITIES);
    C := C + GetCompositeCollectionCount(Element, UML_PROP_EXIT_ACTIONS);
  end;
  if Element.IsKindOf(UML_STATE_MACHINE) then begin
    Assert(Element.QueryInterface(IUMLStateMachine, US) = S_OK);
    if US.Top <> nil then
      C := C + GetExportingElementCount(US.Top) + 1;
    C := C + GetCompositeCollectionCount(Element, UML_PROP_TRANSITIONS);
  end;
//  if Element.IsKindOf(UML_STIMULUS) then
//    C := C + GetCompositeCollectionCount(Element, UML_PROP_ACTIONS);
  if Element.IsKindOf(UML_TRANSITION) then begin
    C := C + GetCompositeCollectionCount(Element, UML_PROP_EFFECTS);
    C := C + GetCompositeCollectionCount(Element, UML_PROP_TRIGGERS);
  end;
  Result := C + 1;
end;

procedure PXMIExporter13.ConstructXMIElement(Element: IElement; RefXMIElement: PXMIElement);
var
  Prj: IUMLProject;
  M, MD: IUMLModel;
  UA: IUMLAssociation;
  UPS: IUMLPseudostate;
  UP1, UP2: IUMLClassifier;
  XE: PXMIElement;
  MetaName: string;
begin
  XE := nil;

  Inc(CurrentIndex);
  StimulateProgressEvent(CurrentIndex, ElementCount, TXT_CREATE_XMI_ELEMENT);

  if not Assigned(Element) then
    Exit;

  MetaName := Element.GetClassName;
  // filter model not satisfy a UML 1.3 meta model. (not create)
  if MetaName = UML_ASSOCIATION then begin
    Assert(Element.QueryInterface(IUMLAssociation, UA) = S_OK);
    Assert(UA.GetConnectionCount = 2);
    UP1 := UA.GetConnectionAt(0).Participant;
    UP2 := UA.GetConnectionAt(1).Participant;
    if (UP1.IsKindOf(UML_PACKAGE) and not UP1.IsKindOf(UML_SUBSYSTEM))
      or (UP2.IsKindOf(UML_PACKAGE) and not UP2.IsKindOf(UML_SUBSYSTEM)) then begin
      Report(MSG_XMI_INVALID_PACKAGE_ASSOCIATION, Element);
      Exit;
    end
  end
  else if MetaName = UML_PSEUDO_STATE then begin
    Assert(Element.QueryInterface(IUMLPseudostate, UPS) = S_OK);
    if UPS.PseudostateKind = pkSynchronization then
      if not (((UPS.GetIncomingCount = 1) and (UPS.GetOutgoingCount >= 2)) or
        ((UPS.GetIncomingCount >= 2) and (UPS.GetOutgoingCount = 1))) then begin
        Report(MSG_XMI_INVALID_SYNCHRONIZATION, Element);
        Exit;
      end;
  end;

  // filter model not satisfy a UML 1.3 Rose Extened meta model. (create and report)
  if FRoseExtended then begin
    // no subject
  end;

  // if element is Diagram or View then create XMI element
  if FRoseExtended and FExportViews then begin
    if Element.IsKindOf(ELEM_DIAGRAM) then XE := CreateXMIElement(NODE_UML_DIAGRAM, Element, nil)
    else if Element.IsKindOf(ELEM_VIEW) then begin
      if not ((MetaName = UML_ASSOCIATION_CLASS_VIEW) or (MetaName = UML_ASSOCIATION_ROLE_VIEW)
        or (MetaName = UML_LINK_VIEW) or (MetaName = UML_NOTE_LINK_VIEW)) then
        XE := CreateXMIElement(NODE_UML_DIAGRAM_ELEMENT, Element, RefXMIElement);
    end
  end;
  // if concerete model element then create XMI element
  if MetaName = UML_ACTION_STATE then XE := CreateXMIElement(NODE_UML_ACTION_STATE, Element, RefXMIElement)
  else if MetaName = UML_ACTIVITYGRAPH then XE := CreateXMIElement(NODE_UML_ACTIVITY_GRAPH, Element, RefXMIElement)
  else if MetaName = UML_ACTOR then XE := CreateXMIElement(NODE_UML_ACTOR, Element, RefXMIElement)
  else if MetaName = UML_ASSOCIATION then XE := CreateUMLAssociationXMIElement(Element, RefXMIElement)
  else if MetaName = UML_ASSOCIATION_CLASS then XE := CreateUMLAssociationClassXMIElement(Element, RefXMIElement)
  else if MetaName = UML_ASSOCIATION_END then XE := CreateXMIElement(NODE_UML_ASSOCIATION_END, Element, RefXMIElement)
  else if MetaName = UML_ASSOCIATION_END_ROLE then XE := CreateXMIElement(NODE_UML_ASSOCIATION_END_ROLE, Element, RefXMIElement)
  else if MetaName = UML_ASSOCIATION_ROLE then XE := CreateXMIElement(NODE_UML_ASSOCIATION_ROLE, Element, RefXMIElement)
  else if MetaName = UML_ATTRIBUTE then XE := CreateXMIElement(NODE_UML_ATTRIBUTE, Element, RefXMIElement)
  else if MetaName = UML_CALL_ACTION then XE := CreateXMIElement(NODE_UML_CALL_ACTION, Element, RefXMIElement)
  else if MetaName = UML_CALL_EVENT then XE := CreateXMIElement(NODE_UML_CALL_EVENT, Element, RefXMIElement)
  else if MetaName = UML_CHANGE_EVENT then XE := CreateXMIElement(NODE_UML_CHANGE_EVENT, Element, RefXMIElement)
  else if MetaName = UML_CLASS then XE := CreateUMLClassXMIElement(Element, RefXMIElement)
  else if MetaName = UML_CLASSIFIER_ROLE then XE := CreateXMIElement(NODE_UML_CLASSIFIER_ROLE, Element, RefXMIElement)
  else if MetaName = UML_COLLABORATION then XE := CreateXMIElement(NODE_UML_COLLABORATION, Element, RefXMIElement)
  else if MetaName = UML_COLLABORATION_INSTANCESET then XE := CreateXMIElement(NODE_UML_COLLABORATION, Element, RefXMIElement)
  else if MetaName = UML_COMPONENT then XE := CreateXMIElement(NODE_UML_COMPONENT, Element, RefXMIElement)
  else if MetaName = UML_COMPONENT_INSTANCE then XE := CreateXMIElement(NODE_UML_COMPONENT_INSTANCE, Element, RefXMIElement)
  else if MetaName = UML_COMPOSITE_STATE then XE := CreateUMLCompositeStateXMIElement(Element, RefXMIElement)
  else if MetaName = UML_CREATE_ACTION then XE := CreateXMIElement(NODE_UML_CREATE_ACTION, Element, RefXMIElement)
  else if MetaName = UML_DEPENDENCY then XE := CreateXMIElement(NODE_UML_DEPENDENCY, Element, RefXMIElement)
  else if MetaName = UML_DESTROY_ACTION then XE := CreateXMIElement(NODE_UML_DESTROY_ACTION, Element, RefXMIElement)
  else if MetaName = UML_GENERALIZATION then XE := CreateXMIElement(NODE_UML_GENERALIZATION, Element, RefXMIElement)
  else if MetaName = UML_ENUMERATION then XE := CreateXMIElement(NODE_UML_CLASS, Element, RefXMIElement)
  else if MetaName = UML_ENUMERATION_LITERAL then XE := CreateXMIElement(NODE_UML_ATTRIBUTE, Element, RefXMIElement)
  else if MetaName = UML_EXCEPTION then begin
    if FRoseExtended then XE := CreateXMIElement(NODE_UML_CLASS, Element, RefXMIElement)
    else XE := CreateXMIElement(NODE_UML_EXCEPTION, Element, RefXMIElement);
  end
  else if MetaName = UML_EXTEND then XE := CreateXMIElement(NODE_UML_EXTEND, Element, RefXMIElement)
  else if MetaName = UML_FINAL_STATE then XE := CreateXMIElement(NODE_UML_FINAL_STATE, Element, RefXMIElement)
  else if MetaName = UML_INCLUDE then XE := CreateXMIElement(NODE_UML_INCLUDE, Element, RefXMIElement)
  else if MetaName = UML_INTERFACE then XE := CreateXMIElement(NODE_UML_INTERFACE, Element, RefXMIElement)
  else if MetaName = UML_INTERACTION then XE := CreateXMIElement(NODE_UML_INTERACTION, Element, RefXMIElement)
  else if MetaName = UML_INTERACTION_INSTANCESET then XE := CreateXMIElement(NODE_UML_INTERACTION, Element, RefXMIElement)
  else if MetaName = UML_LINK then XE := CreateUMLLinkXMIElement(Element, RefXMIElement)
  else if MetaName = UML_LINK_END then XE := CreateUMLLinkEndXMIElement(Element, RefXMIElement)
  else if MetaName = UML_MESSAGE then XE := CreateXMIElement(NODE_UML_MESSAGE, Element, RefXMIElement)
  else if MetaName = UML_MODEL then begin
    if FRoseExtended then begin
      Assert(Element.QueryInterface(IUMLModel, M) = S_OK);
      if (M.Namespace.GetClassName = UML_PROJECT) and ((M.Name = MODEL_LOGICAL_VIEW) or (M.Name = MODEL_DEPLOYMENT_VIEW)) then begin
        // do noting
      end
      else if (M.Namespace.GetClassName = UML_PROJECT) and (M.Name = MODEL_COMPONENT_VIEW) then
        XE := CreateXMIElement(NODE_UML_SUBSYSTEM, Element, RefXMIElement)
      else
        XE := CreateXMIElement(NODE_UML_MODEL, Element, RefXMIElement);
    end
    else
      XE := CreateXMIElement(NODE_UML_MODEL, Element, RefXMIElement);
  end
  else if MetaName = UML_NODE then XE := CreateXMIElement(NODE_UML_NODE, Element, RefXMIElement)
  else if MetaName = UML_NODE_INSTANCE then XE := CreateXMIElement(NODE_UML_NODE_INSTANCE, Element, RefXMIElement)
  else if MetaName = UML_OBJECT then XE := CreateUMLObjectXMIElement(Element, RefXMIElement)
  else if MetaName = UML_OPERATION then XE := CreateXMIElement(NODE_UML_OPERATION, Element, RefXMIElement)
  else if MetaName = UML_PACKAGE then XE := CreateXMIElement(NODE_UML_PACKAGE, Element, RefXMIElement)
  else if MetaName = UML_PARAMETER then XE := CreateXMIElement(NODE_UML_PARAMETER, Element, RefXMIElement)
  else if MetaName = UML_PARTITION then XE := CreateXMIElement(NODE_UML_PARTITION, Element, RefXMIElement)
  else if MetaName = UML_PROJECT then begin
    if FRoseExtended then begin
      Assert(Element.QueryInterface(IUMLProject, Prj) = S_OK);
      M := FindTopLevelUMLModel(Prj, MODEL_LOGICAL_VIEW);
      if M = nil then XE := CreateXMIElement(NODE_UML_MODEL, Element, RefXMIElement)
      else begin
        XE := CreateXMIElementExt(NODE_UML_MODEL, M, RefXMIElement);
        (XE as PXMIElementExt).AddAssociatedElement(Prj);
        MD := FindTopLevelUMLModel(Prj, MODEL_DEPLOYMENT_VIEW);
        if MD <> nil then
          (XE as PXMIElementExt).AddAssociatedElement(MD);
      end;
    end
    else
      XE := CreateXMIElement(NODE_UML_MODEL, Element, RefXMIElement);
  end
  else if MetaName = UML_PSEUDO_STATE then XE := CreateXMIElement(NODE_UML_PSEUDO_STATE, Element, RefXMIElement)
  else if MetaName = UML_REALIZATION then XE := CreateXMIElement(NODE_UML_ABATRACTION, Element, RefXMIElement)
  else if MetaName = UML_RETURN_ACTION then XE := CreateXMIElement(NODE_UML_RETURN_ACTION, Element, RefXMIElement)
  else if MetaName = UML_SEND_ACTION then XE := CreateXMIElement(NODE_UML_SEND_ACTION, Element, RefXMIElement)
  else if MetaName = UML_SIGNAL then begin
    if FRoseExtended then XE := CreateXMIElement(NODE_UML_CLASS, Element, RefXMIElement)
    else XE := CreateXMIElement(NODE_UML_SIGNAL, Element, RefXMIElement)
  end
  else if MetaName = UML_SIGNAL_EVENT then XE := CreateXMIElement(NODE_UML_SIGNAL_EVENT, Element, RefXMIElement)
  else if MetaName = UML_STATE_MACHINE then XE := CreateXMIElement(NODE_UML_STATE_MACHINE, Element, RefXMIElement)
  else if MetaName = UML_STIMULUS then XE := CreateXMIElement(NODE_UML_MESSAGE, Element, RefXMIElement)
  else if MetaName = UML_SUBACTIVITY_STATE then XE := CreateXMIElement(NODE_UML_SUBACTIVITY_STATE, Element, RefXMIElement)
  else if MetaName = UML_SUBMACHINE_STATE then XE := CreateXMIElement(NODE_UML_SUBMACHINE_STATE, Element, RefXMIElement)
  else if MetaName = UML_SUBSYSTEM then XE := CreateXMIElement(NODE_UML_SUBSYSTEM, Element, RefXMIElement)
  else if MetaName = UML_TEMPLATE_PARAMETER then XE := CreateXMIElement(NODE_UML_TEMPLATE_PARAMETER, Element, RefXMIElement)
  else if MetaName = UML_TIME_EVENT then XE := CreateXMIElement(NODE_UML_TIME_EVENT, Element, RefXMIElement)
  else if MetaName = UML_TRANSITION then XE := CreateXMIElement(NODE_UML_TRANSITION, Element, RefXMIElement)
  else if MetaName = UML_UNINTERPRETED_ACTION then XE := CreateXMIElement(NODE_UML_UNINTERPRETED_ACTION, Element, RefXMIElement)
  else if MetaName = UML_USECASE then XE := CreateXMIElement(NODE_UML_USECASE, Element, RefXMIElement)
  ;

  // if element has child elements then compose them
  if XE <> nil then begin
    if Element.IsKindOf(ELEM_MODEL) then ComposeModel(Element, XE);
    if Element.IsKindOf(ELEM_DIAGRAM) then ComposeDiagram(Element, XE);
    if Element.IsKindOf(UML_ACTIVITYGRAPH) then ComposeUMLActivityGraph(Element, XE);
    if Element.IsKindOf(UML_ASSOCIATION) then ComposeUMLAssociation(Element, XE);
    if Element.IsKindOf(UML_ASSOCIATION_CLASS) then ComposeUMLAssociationClass(Element, XE);
    if Element.IsKindOf(UML_ASSOCIATION_END) then ComposeUMLAssociationEnd(Element, XE);
    if Element.IsKindOf(UML_BEHAVIORAL_FEATURE) then ComposeUMLBehavioralFeature(Element, XE);
    if Element.IsKindOf(UML_CLASSIFIER) then ComposeUMLClassifier(Element, XE);
    if Element.IsKindOf(UML_COLLABORATION) then ComposeUMLCollaboration(Element, XE);
    if Element.IsKindOf(UML_COLLABORATION_INSTANCESET) then ComposeUMLCollaborationInstanceSet(Element, XE);
    if Element.IsKindOf(UML_COMPOSITE_STATE) then ComposeUMLCompositeState(Element, XE);
    if Element.IsKindOf(UML_ENUMERATION) then ComposeUMLEnumeration(Element, XE);
    if Element.IsKindOf(UML_INTERACTION) then ComposeUMLInteraction(Element, XE);
    if Element.IsKindOf(UML_INTERACTION_INSTANCESET) then ComposeUMLInteractionInstanceSet(Element, XE);
    if Element.IsKindOf(UML_LINK) then ComposeUMLLink(Element, XE);
    if Element.IsKindOf(UML_MESSAGE) then ComposeUMLMessage(Element, XE);
    if Element.IsKindOf(UML_MODEL_ELEMENT) then ComposeUMLModelElement(Element, XE);
    if Element.IsKindOf(UML_NAMESPACE) then ComposeUMLNamespace(Element, XE);
    if Element.IsKindOf(UML_PROJECT) then ComposeUMLProject(Element, XE);
    if Element.IsKindOf(UML_STATE) then ComposeUMLState(Element, XE);
    if Element.IsKindOf(UML_STATE_MACHINE) then ComposeUMLStateMachine(Element, XE);
    if Element.IsKindOf(UML_STIMULUS) then ComposeUMLStimulus(Element, XE);
    if Element.IsKindOf(UML_TRANSITION) then ComposeUMLTransition(Element, XE);
  end;
end;

function PXMIExporter13.CreateUMLAssociationXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
var
  UA: IUMLAssociation;
begin
  Assert(Element.QueryInterface(IUMLAssociation, UA) = S_OK);
  Result := nil;
  if UA.AssociationClass = nil then
    Result := CreateXMIElement(NODE_UML_ASSOCIATION, Element, RefXMIElement);
end;

function PXMIExporter13.CreateUMLAssociationClassXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
var
  XE: PXMIElementExt;
  UAC: IUMLAssociationClass;
begin
  Assert(Element.QueryInterface(IUMLAssociationClass, UAC) = S_OK);
  XE := CreateXMIElementExt(NODE_UML_ASSOCIATION_CLASS, Element, RefXMIElement);
  XE.AddAssociatedElement(UAC.ClassSide);
  XE.AddAssociatedElement(UAC.AssociationSide);
  Result := XE;
end;

function PXMIExporter13.CreateUMLClassXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
var
  UC: IUMLClass;
begin
  Assert(Element.QueryInterface(IUMLClass, UC) = S_OK);
  Result := nil;
  if UC.AssociationClass = nil then
    Result := CreateXMIElement(NODE_UML_CLASS, Element, RefXMIElement);
end;

function PXMIExporter13.CreateUMLCompositeStateXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
var
  UC: IUMLCompositeState;
begin
  Assert(Element.QueryInterface(IUMLCompositeState, UC) = S_OK);
  if UC.GetSubvertexCount = 0 then
    Result := CreateXMIElement(NODE_UML_SIMPLE_STATE, Element, RefXMIElement)
  else
    Result := CreateXMIElement(NODE_UML_COMPOSITE_STATE, Element, RefXMIElement);
end;

function PXMIExporter13.CreateUMLObjectXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
var
  UO: IUMLObject;
begin
  Assert(Element.QueryInterface(IUMLObject, UO) = S_OK);
  if UO.CollaborationInstanceSet = nil then
    Result := CreateXMIElement(NODE_UML_OBJECT, Element, RefXMIElement)
  else
    Result := CreateXMIElement(NODE_UML_CLASSIFIER_ROLE, Element, RefXMIElement);
end;

function PXMIExporter13.CreateUMLLinkXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
var
  UL: IUMLLink;
begin
  Assert(Element.QueryInterface(IUMLLink, UL) = S_OK);
  if UL.CollaborationInstanceSet = nil then
    Result := CreateXMIElement(NODE_UML_LINK, Element, RefXMIElement)
  else
    Result := CreateXMIElement(NODE_UML_ASSOCIATION_ROLE, Element, RefXMIElement);
end;

function PXMIExporter13.CreateUMLLinkEndXMIElement(Element: IElement; RefXMIElement: PXMIElement): PXMIElement;
var
  ULE: IUMLLinkEnd;
begin
  Assert(Element.QueryInterface(IUMLLinkEnd, ULE) = S_OK);
  if ULE.Link.CollaborationInstanceSet = nil then
    Result := CreateXMIElement(NODE_UML_LINK_END, Element, RefXMIElement)
  else
    Result := CreateXMIElement(NODE_UML_ASSOCIATION_END_ROLE, Element, RefXMIElement);
end;

procedure PXMIExporter13.ComposeModel(Element: IElement; RefXMIElement: PXMIElement);
var
  M: IModel;
  I: Integer;
begin
  Assert(Element.QueryInterface(IModel, M) = S_OK);
  for I := 0 to M.GetOwnedDiagramCount - 1 do
    ConstructXMIElement(M.GetOwnedDiagramAt(I), nil);
end;

procedure PXMIExporter13.ComposeDiagram(Element: IElement; RefXMIElement: PXMIElement);

  procedure ComposeView(View: IView; RefXMIElement: PXMIElement);
  var
    V: IView;
    I: Integer;
  begin
    if not Assigned(View) then
      Exit;
    for I := 0 to View.GetContainedViewCount - 1 do begin
      V := View.GetContainedViewAt(I);
      ConstructXMIElement(V, RefXMIElement);
      ComposeView(V, RefXMIElement);
    end;
  end;

var
  Dgm: IDiagram;
  V: IView;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IDiagram, Dgm) = S_OK);
  if Dgm.DiagramView.GetOwnedViewCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_DIAGRAM_OWNED_ELEMENT, nil, RefXMIElement, False);
    for I := 0 to Dgm.DiagramView.GetOwnedViewCount - 1 do begin
      V := Dgm.DiagramView.GetOwnedViewAt(I);
      ConstructXMIElement(V, XE);
      ComposeView(V, XE);
    end;
  end;
end;

procedure PXMIExporter13.ComposeUMLActivityGraph(Element: IElement; RefXMIElement: PXMIElement);
var
  UA: IUMLActivityGraph;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLActivityGraph, UA) = S_OK);
  if UA.GetPartitionCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_ACTIVITYGRAPH_PARTITION , nil, RefXMIElement, False);
    for I := 0 to UA.GetPartitionCount - 1 do
      ConstructXMIElement(UA.GetPartitionAt(I), XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLAssociation(Element: IElement; RefXMIElement: PXMIElement);
var
  UA: IUMLAssociation;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLAssociation, UA) = S_OK);
  Assert(UA.GetConnectionCount > 0);
  XE := CreateXMIElement(NODE_UML_ASSOCIATION_CONNECTION, nil, RefXMIElement, False);
  for I := 0 to UA.GetConnectionCount - 1 do
    ConstructXMIElement(UA.GetConnectionAt(I), XE);
end;

procedure PXMIExporter13.ComposeUMLAssociationClass(Element: IElement; RefXMIElement: PXMIElement);
var
  UAC: IUMLAssociationClass;
begin
  Assert(Element.QueryInterface(IUMLAssociationClass, UAC) = S_OK);
  ComposeUMLAssociation(UAC.AssociationSide, RefXMIElement);
  ComposeUMLNamespace(UAC.ClassSide, RefXMIElement);
  ComposeUMLClassifier(UAC.ClassSide, RefXMIElement);
end;

procedure PXMIExporter13.ComposeUMLAssociationEnd(Element: IElement; RefXMIElement: PXMIElement);
var
  UA: IUMLAssociationEnd;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLAssociationEnd, UA) = S_OK);
  if UA.GetQualifierCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_ASSOCIATION_END_QUALIFIER, nil, RefXMIElement, False);
    for I := 0 to UA.GetQualifierCount - 1 do
      ConstructXMIElement(UA.GetQualifierAt(I), XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLBehavioralFeature(Element: IElement; RefXMIElement: PXMIElement);
var
  UB: IUMLBehavioralFeature;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLBehavioralFeature, UB) = S_OK);
  if UB.GetParameterCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_BEHAVIORFEATURE_PARAMETER, nil, RefXMIElement, False);
    for I := 0 to UB.GetParameterCount - 1 do
      ConstructXMIElement(UB.GetParameterAt(I), XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLClassifier(Element: IElement; RefXMIElement: PXMIElement);
var
  UC: IUMLClassifier;
  UO: IUMLOperation;
  XE: PXMIElement;
  I, J: Integer;
begin
  Assert(Element.QueryInterface(IUMLClassifier, UC) = S_OK);
  if (UC.GetAttributeCount > 0) or (UC.GetOperationCount > 0) then begin
    XE := AcquireXMIElement(RefXMIElement, NODE_UML_CLASSIFIER_FEATURE , nil, False);
    for I := 0 to UC.GetAttributeCount - 1 do
      ConstructXMIElement(UC.GetAttributeAt(I), XE);
    for I := 0 to UC.GetOperationCount - 1 do
      ConstructXMIElement(UC.GetOperationAt(I), XE);
  end;
  if UC.GetOwnedCollaborationCount > 0 then begin
    XE := AcquireXMIElement(RefXMIElement, NODE_UML_NAMESPACE_OWNED_ELEMENT , nil, False);
    for I := 0 to UC.GetOwnedCollaborationCount - 1 do
      ConstructXMIElement(UC.GetOwnedCollaborationAt(I), XE);
  end;
  if UC.GetOwnedCollaborationInstanceSetCount > 0 then begin
    XE := AcquireXMIElement(RefXMIElement, NODE_UML_NAMESPACE_OWNED_ELEMENT, nil, False);
    for I := 0 to UC.GetOwnedCollaborationInstanceSetCount - 1 do
      ConstructXMIElement(UC.GetOwnedCollaborationInstanceSetAt(I), XE);
  end;
  for I := 0 to UC.GetOperationCount - 1 do begin
    UO := UC.GetOperationAt(I);
    if UO.GetOwnedCollaborationCount > 0 then begin
      XE := AcquireXMIElement(RefXMIElement, NODE_UML_NAMESPACE_OWNED_ELEMENT, nil, False);
      for J := 0 to UO.GetOwnedCollaborationCount - 1 do
        ConstructXMIElement(UO.GetOwnedCollaborationAt(J), XE);
    end;
    if UO.GetOwnedCollaborationInstanceSetCount > 0 then begin
      XE := AcquireXMIElement(RefXMIElement, NODE_UML_NAMESPACE_OWNED_ELEMENT, nil, False);
      for J := 0 to UO.GetOwnedCollaborationInstanceSetCount - 1 do
        ConstructXMIElement(UO.GetOwnedCollaborationInstanceSetAt(J), XE);
    end;
  end;
end;

procedure PXMIExporter13.ComposeUMLCollaboration(Element: IElement; RefXMIElement: PXMIElement);
var
  UC: IUMLCollaboration;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLCollaboration, UC) = S_OK);
  if UC.GetInteractionCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_COLLABORATION_INTERACTION, nil, RefXMIElement, False);
    for I := 0 to UC.GetInteractionCount - 1 do
      ConstructXMIElement(UC.GetInteractionAt(I), XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLCollaborationInstanceSet(Element: IElement; RefXMIElement: PXMIElement);
var
  UC: IUMLCollaborationInstanceSet;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLCollaborationInstanceSet, UC) = S_OK);
  if UC.GetInteractionInstanceSetCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_COLLABORATION_INTERACTION, nil, RefXMIElement, False);
    for I := 0 to UC.GetInteractionInstanceSetCount - 1 do
      ConstructXMIElement(UC.GetInteractionInstanceSetAt(I), XE);
  end;
  if UC.GetParticipatingInstanceCount > 0 then begin
    XE := AcquireXMIElement(RefXMIElement, NODE_UML_NAMESPACE_OWNED_ELEMENT, nil , False);
    for I := 0 to UC.GetParticipatingInstanceCount - 1 do
      ConstructXMIElement(UC.GetParticipatingInstanceAt(I), XE);
  end;
  if UC.GetParticipatingLinkCount > 0 then begin
    XE := AcquireXMIElement(RefXMIElement, NODE_UML_NAMESPACE_OWNED_ELEMENT, nil , False);
    for I := 0 to UC.GetParticipatingLinkCount - 1 do
      ConstructXMIElement(UC.GetParticipatingLinkAt(I), XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLCompositeState(Element: IElement; RefXMIElement: PXMIElement);
var
  UC: IUMLCompositeState;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLCompositeState, UC) = S_OK);
  if UC.GetSubvertexCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_COMPOSITE_STATE_SUBVERTEX, nil, RefXMIElement, False);
    for I := 0 to UC.GetSubvertexCount - 1 do
      ConstructXMIElement(UC.GetSubvertexAt(I), XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLEnumeration(Element: IElement; RefXMIElement: PXMIElement);
var
  UE: IUMLEnumeration;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLEnumeration, UE) = S_OK);
  if UE.GetLiteralCount > 0 then begin
    XE := AcquireXMIElement(RefXMIElement, NODE_UML_CLASSIFIER_FEATURE, nil, False);
    for I := 0 to UE.GetLiteralCount - 1 do
      ConstructXMIElement(UE.GetLiteralAt(I), XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLInteraction(Element: IElement; RefXMIElement: PXMIElement);
var
  UI: IUMLInteraction;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLInteraction, UI) = S_OK);
  if UI.GetMessageCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_INTERACTION_MESSAGE, nil, RefXMIElement, False);
    for I := 0 to UI.GetMessageCount - 1 do
      ConstructXMIElement(UI.GetMessageAt(I), XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLInteractionInstanceSet(Element: IElement; RefXMIElement: PXMIElement);
var
  UI: IUMLInteractionInstanceSet;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLInteractionInstanceSet, UI) = S_OK);
  if UI.GetParticipatingStimulusCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_INTERACTION_MESSAGE, nil, RefXMIElement, False);
    for I := 0 to UI.GetParticipatingStimulusCount - 1 do
      ConstructXMIElement(UI.GetParticipatingStimulusAt(I), XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLLink(Element: IElement; RefXMIElement: PXMIElement);
var
  UL: IUMLLink;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLLink, UL) = S_OK);
  Assert(UL.GetConnectionCount > 0);
  if UL.CollaborationInstanceSet = nil then
    XE := CreateXMIElement(NODE_UML_LINK_CONNECTION, nil, RefXMIElement, False)
  else
    XE := CreateXMIElement(NODE_UML_ASSOCIATION_ROLE_CONNECTION, nil, RefXMIElement, False);
  for I := 0 to UL.GetConnectionCount - 1 do
    ConstructXMIElement(UL.GetConnectionAt(I), XE);
end;

procedure PXMIExporter13.ComposeUMLMessage(Element: IElement; RefXMIElement: PXMIElement);
var
  UM: IUMLMessage;
  XE: PXMIElement;
begin
  Assert(Element.QueryInterface(IUMLMessage, UM) = S_OK);
  if UM.Action <> nil then begin
    XE := CreateXMIElement(NODE_UML_MESSAGE_ACTION, nil, RefXMIElement, False);
    ConstructXMIElement(UM.Action, XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLModelElement(Element: IElement; RefXMIElement: PXMIElement);
var
  UM: IUMLModelElement;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLModelElement, UM) = S_OK);
  if UM.GetTemplateParameterCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_MODEL_ELEMENT_TEMPLATE_PARAMETER, nil, RefXMIElement, False);
    for I := 0 to UM.GetTemplateParameterCount - 1 do
      ConstructXMIElement(UM.GetTemplateParameterAt(I), XE);
  end;
  if UM.GetBehaviorCount > 0 then begin
    if Element.IsKindOf(UML_NAMESPACE) then begin
      XE := AcquireXMIElement(RefXMIElement, NODE_UML_NAMESPACE_OWNED_ELEMENT, nil, False);
      for I := 0 to UM.GetBehaviorCount - 1 do
        ConstructXMIElement(UM.GetBehaviorAt(I), XE);
    end
    else begin
      for I := 0 to UM.GetBehaviorCount - 1 do
        Report(MSG_XMI_INVALID_STATEMACHINE + '(' + UM.GetBehaviorAt(I).Name + ')', UM.GetBehaviorAt(I));
    end;
  end;
end;

procedure PXMIExporter13.ComposeUMLNamespace(Element: IElement; RefXMIElement: PXMIElement);
var
  UN: IUMLNamespace;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLNamespace, UN) = S_OK);
  if UN.GetOwnedElementCount > 0 then begin
    XE := AcquireXMIElement(RefXMIElement, NODE_UML_NAMESPACE_OWNED_ELEMENT, nil, False);
    for I := 0 to UN.GetOwnedElementCount - 1 do
      ConstructXMIElement(UN.GetOwnedElementAt(I), XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLProject(Element: IElement; RefXMIElement: PXMIElement);
var
  Prj: IUMLProject;
  M: IUMLModel;
begin
  if FRoseExtended then begin
    if Element.GetClassName = UML_PROJECT then begin
      Assert(Element.QueryInterface(IUMLProject, Prj) = S_OK);

      M := FindTopLevelUMLModel(Prj, MODEL_LOGICAL_VIEW);
      if M <> nil then begin
        ComposeModel(M, RefXMIElement);
        ComposeUMLModelElement(M, RefXMIElement);
        ComposeUMLNamespace(M, RefXMIElement);
        ComposeUMLClassifier(M, RefXMIElement);
      end;

      M := FindTopLevelUMLModel(Prj, MODEL_DEPLOYMENT_VIEW);
      if M <> nil then begin
        ComposeModel(M, RefXMIElement);
        ComposeUMLModelElement(M, RefXMIElement);
        ComposeUMLNamespace(M, RefXMIElement);
        ComposeUMLClassifier(M, RefXMIElement);
      end;
    end;
  end;
end;

procedure PXMIExporter13.ComposeUMLState(Element: IElement; RefXMIElement: PXMIElement);
var
  US: IUMLState;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLState, US) = S_OK);
  if US.GetEntryActionCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_STATE_ENTRY, nil, RefXMIElement, False);
    for I := 0 to US.GetEntryActionCount - 1 do
      ConstructXMIElement(US.GetEntryActionAt(I), XE);
  end;
  if US.GetExitActionCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_STATE_EXIT, nil, RefXMIElement, False);
    for I := 0 to US.GetExitActionCount - 1 do
      ConstructXMIElement(US.GetExitActionAt(I), XE);
  end;
  if US.GetDoActivityCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_STATE_DO_ACTIVITY, nil, RefXMIElement, False);
    for I := 0 to US.GetDoActivityCount - 1 do
      ConstructXMIElement(US.GetDoActivityAt(I), XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLStateMachine(Element: IElement; RefXMIElement: PXMIElement);
var
  US: IUMLStateMachine;
  XE: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLStateMachine, US) = S_OK);
  if US.Top <> nil then begin
    XE := CreateXMIElement(NODE_UML_STATE_MACHINE_TOP, nil, RefXMIElement, False);
    ConstructXMIElement(US.Top, XE);
  end;
  if US.GetTransitionCount > 0 then begin
    XE := CreateXMIElement(NODE_STATE_MACHINE_TRANSITION, nil, RefXMIElement, False);
    for I := 0 to US.GetTransitionCount - 1 do
      ConstructXMIElement(US.GetTransitionAt(I), XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLStimulus(Element: IElement; RefXMIElement: PXMIElement);
var
  US: IUMLStimulus;
  XE: PXMIElement;
begin
  Assert(Element.QueryInterface(IUMLStimulus, US) = S_OK);
  if US.Action <> nil then begin
    XE := CreateXMIElement(NODE_UML_MESSAGE_ACTION, nil, RefXMIElement, False);
    ConstructXMIElement(US.Action, XE);
  end;
end;

procedure PXMIExporter13.ComposeUMLTransition(Element: IElement; RefXMIElement: PXMIElement);
var
  UT: IUMLTransition;
  XE, XESeq, XEA: PXMIElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLTransition, UT) = S_OK);
  if UT.GetEffectCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_TRANSITION_EFFECT, nil, RefXMIElement, False);
    XESeq := CreateXMIElement(NODE_UML_ACTION_SEQUENCE, nil, XE);
    XEA := CreateXMIElement(NODE_UML_ACTION_SEQUENCE_ACTION, nil, XESeq, False);
    for I := 0 to UT.GetEffectCount - 1 do
      ConstructXMIElement(UT.GetEffectAt(I), XEA);
  end;
  if UT.GetTriggerCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_TRANSITION_TRIGGER, nil, RefXMIElement, False);
    for I := 0 to UT.GetTriggerCount - 1 do
      ConstructXMIElement(UT.GetTriggerAt(I), XE);
  end;
end;

procedure PXMIExporter13.FillOutXMIAttributes(Element: IElement);
var
  XE: PXMIElement;
  MetaName: string;
  UA: IUMLAssociation;
  UC: IUMLClass;
  UM: IUMLModel;
  Prj: IUMLProject;
begin
  MetaName := Element.GetClassName;
  // filter that must not to treat
  if MetaName = UML_ASSOCIATION then begin
    Element.QueryInterface(IUMLAssociation, UA);
    if UA.AssociationClass <> nil then Exit;
  end;
  if MetaName = UML_CLASS then begin
    Element.QueryInterface(IUMLClass, UC);
    if UC.AssociationClass <> nil then Exit;
  end;
  if FRoseExtended and (MetaName = UML_MODEL) then begin
    Element.QueryInterface(IUMLModel, UM);
    if (UM.Namespace.GetClassName = UML_PROJECT) and (UM.Name = MODEL_DEPLOYMENT_VIEW) then begin
      UM.Namespace.QueryInterface(IUMLProject, Prj);
      if FindTopLevelUMLModel(Prj, MODEL_LOGICAL_VIEW) <> nil then
        Exit;
    end;
  end;

  XE := FindXMIElementByElement(Element);
  if XE = nil then Exit;

  Inc(CurrentIndex);
  StimulateProgressEvent(CurrentIndex, ElementCount, TXT_FILLOUT_XMI_ATTRIBUTE);

  // if element is Diagram or View then set it's attributes
  if Element.IsKindOf(ELEM_DIAGRAM) then SetAttributesDiagram(Element, XE)
  else if Element.IsKindOf(ELEM_VIEW) then SetAttributesView(Element, XE)
  // if concerete model element then set it's attributes
  else begin
    if MetaName = UML_ACTION_STATE then SetAttributesUMLActionState(Element, XE)
    else if MetaName = UML_ACTIVITYGRAPH then SetAttributesUMLActivityGraph(Element, XE)
    else if MetaName = UML_ACTOR then SetAttributesUMLActor(Element, XE)
    else if MetaName = UML_ASSOCIATION then SetAttributesUMLAssociation(Element, XE)
    else if MetaName = UML_ASSOCIATION_CLASS then SetAttributesUMLAssociationClass(Element, XE)
    else if MetaName = UML_ASSOCIATION_END then SetAttributesUMLAssociationEnd(Element, XE)
    else if MetaName = UML_ASSOCIATION_END_ROLE then SetAttributesUMLAssociationEndRole(Element, XE)
    else if MetaName = UML_ASSOCIATION_ROLE then SetAttributesUMLAssociationRole(Element, XE)
    else if MetaName = UML_ATTRIBUTE then SetAttributesUMLAttribute(Element, XE)
    else if MetaName = UML_CALL_ACTION then SetAttributesUMLCallAction(Element, XE)
    else if MetaName = UML_CALL_EVENT then SetAttributesUMLCallEvent(Element, XE)
    else if MetaName = UML_CHANGE_EVENT then SetAttributesUMLChangeEvent(Element, XE)
    else if MetaName = UML_CLASS then SetAttributesUMLClass(Element, XE)
    else if MetaName = UML_CLASSIFIER_ROLE then SetAttributesUMLClassifierRole(Element, XE)
    else if MetaName = UML_COLLABORATION then SetAttributesUMLCollaboration(Element, XE)
    else if MetaName = UML_COLLABORATION_INSTANCESET then SetAttributesUMLCollaborationInstanceSet(Element, XE)
    else if MetaName = UML_COMPONENT then SetAttributesUMLComponent(Element, XE)
    else if MetaName = UML_COMPONENT_INSTANCE then SetAttributesUMLComponentInstance(Element, XE)
    else if MetaName = UML_COMPOSITE_STATE then SetAttributesUMLCompositeState(Element, XE)
    else if MetaName = UML_CREATE_ACTION then SetAttributesUMLCreateAction(Element, XE)
    else if MetaName = UML_DEPENDENCY then SetAttributesUMLDependency(Element, XE)
    else if MetaName = UML_DESTROY_ACTION then SetAttributesUMLDestroyAction(Element, XE)
    else if MetaName = UML_ENUMERATION then SetAttributesUMLEnumeration(Element, XE)
    else if MetaName = UML_ENUMERATION_LITERAL then SetAttributesUMLEnumerationLiteral(Element, XE)
    else if MetaName = UML_EVENT then SetAttributesUMLEvent(Element, XE)
    else if MetaName = UML_EXCEPTION then SetAttributesUMLException(Element, XE)
    else if MetaName = UML_EXTEND then SetAttributesUMLExtend(Element, XE)
    else if MetaName = UML_FINAL_STATE then SetAttributesUMLFinalState(Element, XE)
    else if MetaName = UML_GENERALIZATION then SetAttributesUMLGeneralization(Element, XE)
    else if MetaName = UML_INCLUDE then SetAttributesUMLInclude(Element, XE)
    else if MetaName = UML_INTERACTION then SetAttributesUMLInteraction(Element, XE)
    else if MetaName = UML_INTERACTION_INSTANCESET then SetAttributesUMLInteractionInstanceSet(Element, XE)
    else if MetaName = UML_INTERFACE then SetAttributesUMLInterface(Element, XE)
    else if MetaName = UML_OBJECT then SetAttributesUMLObject(Element, XE)
    else if MetaName = UML_LINK then SetAttributesUMLLink(Element, XE)
    else if MetaName = UML_LINK_END then SetAttributesUMLLinkEnd(Element, XE)
    else if MetaName = UML_MODEL then SetAttributesUMLModel(Element, XE)
    else if MetaName = UML_MESSAGE then SetAttributesUMLMessage(Element, XE)
    else if MetaName = UML_NODE then SetAttributesUMLNode(Element, XE)
    else if MetaName = UML_NODE_INSTANCE then SetAttributesUMLNodeInstance(Element, XE)
    else if MetaName = UML_OPERATION then SetAttributesUMLOperation(Element, XE)
    else if MetaName = UML_PACKAGE then SetAttributesUMLPackage(Element, XE)
    else if MetaName = UML_PARAMETER then SetAttributesUMLParameter(Element, XE)
    else if MetaName = UML_PARTITION then SetAttributesUMLPartition(Element, XE)
    else if MetaName = UML_PSEUDO_STATE then SetAttributesUMLPseudostate(Element, XE)
    else if MetaName = UML_REALIZATION then SetAttributesUMLRealization(Element, XE)
    else if MetaName = UML_RETURN_ACTION then SetAttributesUMLReturnAction(Element, XE)
    else if MetaName = UML_SEND_ACTION then SetAttributesUMLSendAction(Element, XE)
    else if MetaName = UML_SIGNAL then SetAttributesUMLSignal(Element, XE)
    else if MetaName = UML_SIGNAL_EVENT then SetAttributesUMLSignalEvent(Element, XE)
    else if MetaName = UML_STATE_MACHINE then SetAttributesUMLStateMachine(Element, XE)
    else if MetaName = UML_STIMULUS then SetAttributesUMLStimulus(Element, XE)
    else if MetaName = UML_SUBACTIVITY_STATE then SetAttributesUMLSubactivityState(Element, XE)
    else if MetaName = UML_SUBMACHINE_STATE then SetAttributesUMLSubmachineState(Element, XE)
    else if MetaName = UML_SUBSYSTEM then SetAttributesUMLSubsystem(Element, XE)
    else if MetaName = UML_TEMPLATE_PARAMETER then SetAttributesUMLTemplateParameter(Element, XE)
    else if MetaName = UML_TIME_EVENT then SetAttributesUMLTimeEvent(Element, XE)
    else if MetaName = UML_TRANSITION then SetAttributesUMLTransition(Element, XE)
    else if MetaName = UML_UNINTERPRETED_ACTION then SetAttributesUMLUninterpretedAction(Element, XE)
    else if MetaName = UML_USECASE then SetAttributesUMLUseCase(Element, XE)
    ;
  end;
end;

procedure PXMIExporter13.SetAttributesModel(Element: IElement; RefXMIElement: PXMIElement);
var
  M: IModel;
  I: Integer;
begin
  Assert(Element.QueryInterface(IModel, M) = S_OK);
  if M.Documentation <> '' then
    SetXMITaggedValue(RefXMIElement, TAG_DOCUMENTATION, M.Documentation);
  for I := 0 to M.GetAttachmentCount - 1 do
    if FRoseExtended then begin
      if PUtility.IsURL(M.GetAttachmentAt(I)) then
        SetXMITaggedValue(RefXMIElement, TAG_ROSE_ATTACH_URL, M.GetAttachmentAt(I))
      else
        SetXMITaggedValue(RefXMIElement, TAG_ROSE_ATTACH_FILE, M.GetAttachmentAt(I));
    end
    else
      SetXMITaggedValue(RefXMIElement, TAG_ATTACHMENT, M.GetAttachmentAt(I));
end;

procedure PXMIExporter13.SetAttributesExtensibleModel(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesModel(Element, RefXMIElement);
  SetXMIStereotype(RefXMIElement);
  SetXMITaggedValues(RefXMIElement);
  SetXMIConstrains(RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLAction(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  ComposeXMIExpression(RefXMIElement, Element, UML_PROP_TARGET, NODE_UML_ACTION_TARGET, NODE_UML_OBJECT_SET_EXPR);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_ASYNCHRONOUS, ATTR_UML_IS_ASYNCHRONOUS);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_STIMULUS, ATTR_UML_STIMULUS);
  ComposeXMIExpression(RefXMIElement, Element, UML_PROP_SCRIPT, NODE_UML_ACTION_SCRIPT, NODE_UML_ACTION_EXPR);
end;

procedure PXMIExporter13.SetAttributesUMLActionState(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLSimpleState(Element, RefXMIElement);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_DYNAMIC, ATTR_UML_IS_DYNAMIC);
  ComposeXMIExpression(RefXMIElement, Element, UML_PROP_DYNAMIC_ARGUMENTS, NODE_UML_ACTION_STATE_ARGS, NODE_UML_ARG_LIST_EXPR);
  ComposeXMIMultiplicity(RefXMIElement, Element, UML_PROP_DYNAMIC_MULTIPLICITY, NODE_UML_ACTION_STATE_MULTIPLICITY);
end;

procedure PXMIExporter13.SetAttributesUMLActivityGraph(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLStateMachine(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLActor(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLClassifier(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLAssociation(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLRelationship(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLAssociationClass(Element: IElement; RefXMIElement: PXMIElement);
var
  UAC: IUMLAssociationClass;
begin
  Assert(Element.QueryInterface(IUMLAssociationClass, UAC) = S_OK);
  SetAttributesUMLAssociation(UAC.AssociationSide, RefXMIElement);
  SetAttributesUMLClass(UAC.ClassSide, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLAssociationEnd(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_NAVIGABLE, ATTR_UML_NAVIGABLE);
  SetXMIAttrEnumAttribute(RefXMIElement, Element, UML_PROP_ORDERING, ATTR_UML_ORDERING, ConvertXMIOrderingKind);
  SetXMIAttrEnumAttribute(RefXMIElement, Element, UML_PROP_AGGREGATION, ATTR_UML_AGGREGATION, ConvertXMIAggregationKind);
  SetXMIAttrEnumAttribute(RefXMIElement, Element, UML_PROP_TARGET_SCOPE, ATTR_UML_TARGET_SCOPE, ConvertXMIScopeKind);
  ComposeXMIMultiplicity(RefXMIElement, Element, UML_PROP_MULTIPLICITY, NODE_UML_ASSOC_END_MULTIPLICITY);
  SetXMIAttrEnumAttribute(RefXMIElement, Element, UML_PROP_CHANGEABILITY, ATTR_UML_CHANGEABILITY, ConvertXMIChangeabilityKind);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_ASSOCIATION, ATTR_UML_ASSOCIATION);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_PARTICIPANT, ATTR_UML_TYPE);
end;

procedure PXMIExporter13.SetAttributesUMLAssociationEndRole(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLAssociationEnd(Element, RefXMIElement);
  ComposeXMIMultiplicity(RefXMIElement, Element, UML_PROP_COLLABORATION_MULTIPLICITY, NODE_UML_ASSOC_END_ROLE_COLL_MULTIPLICITY);
end;

procedure PXMIExporter13.SetAttributesUMLAssociationRole(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLAssociation(Element, RefXMIElement);
  ComposeXMIMultiplicity(RefXMIElement, Element, UML_PROP_MULTIPLICITY, NODE_UML_ASSOC_ROLE_MULTIPLICITY);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_BASE, ATTR_UML_BASE);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_MESSAGES, ATTR_UML_MESSAGE);
end;

procedure PXMIExporter13.SetAttributesUMLAttribute(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLStructuralFeature(Element, RefXMIElement);
  ComposeXMIExpression(RefXMIElement, Element, UML_PROP_INITIAL_VALUE, NODE_UML_ATTR_INITIAL_VALUE, NODE_UML_EXPR);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_ASSOCIATION_END, ATTR_UML_ASSOCIATION_END);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_OWNER, ATTR_UML_OWNER);
end;

procedure PXMIExporter13.SetAttributesUMLBehavioralFeature(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLFeature(Element, RefXMIElement);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_QUERY, ATTR_UML_QUERY);
end;

procedure PXMIExporter13.SetAttributesUMLCallAction(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLAction(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_OPERATION, ATTR_UML_OPERATION);
end;

procedure PXMIExporter13.SetAttributesUMLCallEvent(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLEvent(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_OPERATION, ATTR_UML_OPERATION);
end;

procedure PXMIExporter13.SetAttributesUMLChangeEvent(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLEvent(Element, RefXMIElement);
  ComposeXMIExpression(RefXMIElement, Element, UML_PROP_CHANGE_EXPRESSION, NODE_UML_CHANGE_EVENT_EXPR, NODE_UML_BOOLEAN_EXPR);
end;

procedure PXMIExporter13.SetAttributesUMLClass(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLClassifier(Element, RefXMIElement);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_ACTIVE, ATTR_UML_IS_ACTIVE);
end;

procedure PXMIExporter13.SetAttributesUMLClassifier(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLNamespace(Element, RefXMIElement);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_ASSOCIATIONS, ATTR_UML_PARTICIPANT);
end;

procedure PXMIExporter13.SetAttributesUMLClassifierRole(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLClassifier(Element, RefXMIElement);
  ComposeXMIMultiplicity(RefXMIElement, Element, UML_PROP_MULTIPLICITY, NODE_UML_CLASSIFIER_ROLE_MULTIPLICITY);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_BASE, ATTR_UML_BASE);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_AVAILABLE_FEATURES, ATTR_UML_AVAILABLE_FEATURE);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_SENDER_CLIENT_MESSAGES, ATTR_UML_MESSAGE2);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_RECIEVER_CLIENT_MESSAGES, ATTR_UML_MESSAGE1);
end;

procedure PXMIExporter13.SetAttributesUMLCollaboration(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLNamespace(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLCollaborationInstanceSet(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLComponent(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLClassifier(Element, RefXMIElement);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_DEPLOYMENT_LOCATIONS, ATTR_UML_DEPLOYMENT_LOCATION);
  ComposeXMIComponentResident(RefXMIElement, Element);
end;

procedure PXMIExporter13.SetAttributesUMLComponentInstance(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLInstance(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_NODE_INSTANCE, ATTR_UML_NODE_INSTANCE);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_RESIDENTS, ATTR_UML_RESIDENT);
end;

procedure PXMIExporter13.SetAttributesUMLCompositeState(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLState(Element, RefXMIElement);
  if RefXMIElement.XMIElementName = NODE_UML_COMPOSITE_STATE then
    SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_CONCURRENT, ATTR_UML_IS_CONCURRENT);
end;

procedure PXMIExporter13.SetAttributesUMLCreateAction(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLAction(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_INSTANTIATION, ATTR_UML_INSTANTIATION);
end;

procedure PXMIExporter13.SetAttributesUMLDependency(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLRelationship(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_CLIENT, ATTR_UML_CLIENT);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_SUPPLIER, ATTR_UML_SUPPLIER);
end;

procedure PXMIExporter13.SetAttributesUMLDestroyAction(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLAction(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLElement(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesExtensibleModel(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLEnumeration(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLClassifier(Element, RefXMIElement);
  SetXMIStereotype(RefXMIElement, TYPE_ENUMERATION);
end;

procedure PXMIExporter13.SetAttributesUMLEnumerationLiteral(Element: IElement; RefXMIElement: PXMIElement);
var
  XE: PXMIElement;
  UL: IUMLEnumerationLiteral;
begin
  Assert(Element.QueryInterface(IUMLEnumerationLiteral, UL) = S_OK);
  SetAttributesUMLModelElement(Element, RefXMIElement);
  XE := FindXMIElementByElement(UL.Enumeration);
  Assert(XE <> nil);
  SetXMIAttributeValue(RefXMIElement, ATTR_UML_OWNER, XE.XMIId);
end;

procedure PXMIExporter13.SetAttributesUMLEvent(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_TRANSITION, ATTR_UML_TRANSITION);
end;

procedure PXMIExporter13.SetAttributesUMLException(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLSignal(Element, RefXMIElement);
  if FRoseExtended then
    SetXMIStereotype(RefXMIElement, TYPE_EXCEPTION);
end;

procedure PXMIExporter13.SetAttributesUMLExtend(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLRelationship(Element, RefXMIElement);
  ComposeXMIExpression(RefXMIElement, Element, UML_PROP_CONDITION, NODE_UML_EXTEND_CONDITION, NODE_UML_BOOLEAN_EXPR);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_BASE, ATTR_UML_BASE);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_EXTENSION, ATTR_UML_EXTENSION);
end;

procedure PXMIExporter13.SetAttributesUMLFinalState(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLState(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLFeature(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  SetXMIAttrEnumAttribute(RefXMIElement, Element, UML_PROP_OWNER_SCOPE, ATTR_UML_OWNER_SCOPE, ConvertXMIScopeKind);
end;

procedure PXMIExporter13.SetAttributesUMLGeneralizableElement(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_ROOT, ATTR_UML_ROOT);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_LEAF, ATTR_UML_LEAF);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_ABSTRACT, ATTR_UML_ABSTRACT);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_GENERALIZATIONS, ATTR_UML_GENERAILIZATION);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_SPECIALIZATIONS, ATTR_UML_SPECIALIZATION);
end;

procedure PXMIExporter13.SetAttributesUMLGeneralization(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLRelationship(Element, RefXMIElement);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_DISCRIMINATOR, ATTR_UML_DISCRIMINATOR);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_CHILD, ATTR_UML_CHILD);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_PARENT, ATTR_UML_PARENT);
end;

procedure PXMIExporter13.SetAttributesUMLInclude(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLRelationship(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_BASE, ATTR_UML_BASE);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_ADDITION, ATTR_UML_ADDITION);
end;

procedure PXMIExporter13.SetAttributesUMLInstance(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_CLASSIFIER, ATTR_UML_CLASSIFIER);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_LINK_ENDS, ATTR_UML_LINK_END);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_SENDING_STIMULI, ATTR_UML_STIMULUS3);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_RECIEVING_STIMULI, ATTR_UML_STIMULUS2);
  if Element.MOF_GetAttribute(UML_PROP_IS_MULTIINSTANCE) = UML_VALUE_TRUE then
    SetXMITaggedValue(RefXMIElement, TAG_IS_MULTIINSTANCE, XMI_VALUE_TRUE);
end;

procedure PXMIExporter13.SetAttributesUMLInteraction(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_CONTEXT, ATTR_UML_CONTEXT);
end;

procedure PXMIExporter13.SetAttributesUMLInteractionInstanceSet(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_CONTEXT, ATTR_UML_CONTEXT);
end;

procedure PXMIExporter13.SetAttributesUMLInterface(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLClassifier(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLLink(Element: IElement; RefXMIElement: PXMIElement);
var
  UL: IUMLLink;
begin
  Assert(Element.QueryInterface(IUMLLink, UL) = S_OK);
  if UL.CollaborationInstanceSet = nil then begin
    SetAttributesUMLModelElement(Element, RefXMIElement);
    SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_STIMULI, ATTR_UML_STIMULUS);
  end
  else begin
    SetAttributesUMLModelElement(Element, RefXMIElement);
    SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_STIMULI, ATTR_UML_MESSAGE);
    ComposeXMIMultiplicity2(RefXMIElement, NODE_UML_ASSOC_ROLE_MULTIPLICITY, '1');
  end;
end;

procedure PXMIExporter13.SetAttributesUMLLinkEnd(Element: IElement; RefXMIElement: PXMIElement);
var
  ULE: IUMLLinkEnd;
begin
  Assert(Element.QueryInterface(IUMLLinkEnd, ULE) = S_OK);
  if ULE.Link.CollaborationInstanceSet = nil then begin
    SetAttributesUMLModelElement(Element, RefXMIElement);
    SetXMIAttrReference(RefXMIElement, Element, UML_PROP_INSTANCE, ATTR_UML_INSTANCE);
    SetXMIAttrReference(RefXMIElement, Element, UML_PROP_LINK, ATTR_UML_LINK);
  end
  else begin
    SetAttributesUMLModelElement(Element, RefXMIElement);
    SetXMIAttrReference(RefXMIElement, Element, UML_PROP_INSTANCE, ATTR_UML_TYPE);
    SetXMIAttrReference(RefXMIElement, Element, UML_PROP_LINK, ATTR_UML_ASSOCIATION);
    SetXMIAttributeValue(RefXMIElement, ATTR_UML_NAVIGABLE, XMI_VALUE_FALSE);
    SetXMIAttributeValue(RefXMIElement, ATTR_UML_ORDERING, XMI_VALUE_UNORDERD);
    SetXMIAttributeValue(RefXMIElement, ATTR_UML_AGGREGATION, XMI_VALUE_NONE);
    SetXMIAttributeValue(RefXMIElement, ATTR_UML_TARGET_SCOPE, XMI_VALUE_INSTANCE);
    SetXMIAttributeValue(RefXMIElement, ATTR_UML_CHANGEABILITY, XMI_VALUE_CHANGEABLE);
  end;
end;

procedure PXMIExporter13.SetAttributesUMLMessage(Element: IElement; RefXMIElement: PXMIElement);
var
  UM: IUMLMessage;
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_SENDER, ATTR_UML_SENDER);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_RECIVER, ATTR_UML_RECEIVER);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_INTERACTION, ATTR_UML_INTERACTION);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_COMMUNICATION_CONNECTION, ATTR_UML_COMM_CONN);
  if Element.MOF_GetAttribute(UML_PROP_ARGUMENTS) <> '' then
    SetXMITaggedValue(RefXMIElement, TAG_ARGUMENTS, Element.MOF_GetAttribute(UML_PROP_ARGUMENTS));
  if Element.MOF_GetAttribute(UML_PROP_RETURN) <> '' then
    SetXMITaggedValue(RefXMIElement, TAG_RETURN, Element.MOF_GetAttribute(UML_PROP_RETURN));
  if Element.MOF_GetAttribute(UML_PROP_ITERATION) <> '' then
    SetXMITaggedValue(RefXMIElement, TAG_ITERATION, Element.MOF_GetAttribute(UML_PROP_ITERATION));
  if Element.MOF_GetAttribute(UML_PROP_BRANCH) <> '' then
    SetXMITaggedValue(RefXMIElement, TAG_BRANCH, Element.MOF_GetAttribute(UML_PROP_BRANCH));
  if FRoseExtended then begin
    Assert(Element.QueryInterface(IUMLMessage, UM) = S_OK);
    if UM.Action <> nil then begin
      // if CallAction then do nothing.
      if UM.Action.GetClassName = UML_SEND_ACTION then
        SetXMIStereotype(RefXMIElement, TYPE_ASYNCHRONOUS)
      else if UM.Action.GetClassName = UML_RETURN_ACTION then
        SetXMIStereotype(RefXMIElement, TYPE_RETURN)
      // another idea
      // if UM.Action.GetClassName = 'UMLCallAction' then begin
      //   if UM.Action.IsAsynchronous then
      //     SetXMIStereotype(RefXMIElement, 'procededure_call')
      //   else
      //     SetXMIStereotype(RefXMIElement, 'synchronous')
      // end
      // else if UM.Action.GetClassName = 'UMLSendAction') then
      //   SetXMIStereotype(RefXMIElement, 'asynchronous')
      // else if UM.Action.GetClassName = 'UMLReturnAction' then
      //   SetXMIStereotype(RefXMIElement, 'return')
    end;
  end;
end;

procedure PXMIExporter13.SetAttributesUMLModel(Element: IElement; RefXMIElement: PXMIElement);
var
  UM: IUMLModel;
begin
  SetAttributesUMLPackage(Element, RefXMIElement);
  if FRoseExtended then begin
    Assert(Element.QueryInterface(IUMLModel, UM) = S_OK);
    if (UM.Name = MODEL_USECASE_VIEW) and (UM.Namespace.GetClassName = UML_PROJECT) then
      SetXMIStereotype(RefXMIElement, TYPE_ROSE_USECASE_MODEL)
    else if (UM.Name = MODEL_LOGICAL_VIEW) and (UM.Namespace.GetClassName = UML_PROJECT) then
      SetXMIAttributeValue(RefXMIElement, ATTR_UML_NAME, StarUMLApp.ProjectManager.Project.Title)
    else if (UM.Name = MODEL_COMPONENT_VIEW) and (UM.Namespace.GetClassName = UML_PROJECT) then
      SetXMIAttributeValue(RefXMIElement, ATTR_UML_IS_INSTANTIALBLE, XMI_VALUE_FALSE);
  end;
end;

procedure PXMIExporter13.SetAttributesUMLModelElement(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLElement(Element, RefXMIElement);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_NAME, ATTR_UML_NAME);
  SetXMIAttrEnumAttribute(RefXMIElement, Element, UML_PROP_VISIBILITY, ATTR_UML_VISIBILITY, ConvertXMIVisibilityKind);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_SPECIFICATION, ATTR_UML_SPECIFICATION);
  if RefXMIElement.Parent <> nil then
    SetXMIAttrReference(RefXMIElement, Element, UML_PROP_NAMESPACE, ATTR_UML_NAMESPACE);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_CLIENT_DEPENDENCIES, ATTR_UML_CLIENT_DEPENDENCY);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_SUPPLIER_DEPENDENCIES, ATTR_UML_SUPPLIER_DEPENDENCY);
  // ModelElement.Container (set in SetAttributesComponents)
end;

procedure PXMIExporter13.SetAttributesUMLNamespace(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLGeneralizableElement(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLNode(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLClassifier(Element, RefXMIElement);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_DEPLOYED_COMPONENTS, ATTR_UML_RESIDENT);
end;

procedure PXMIExporter13.SetAttributesUMLNodeInstance(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLInstance(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLObject(Element: IElement; RefXMIElement: PXMIElement);
var
  UO: IUMLObject;
begin
  Assert(Element.QueryInterface(IUMLObject, UO) = S_OK);
  if UO.CollaborationInstanceSet = nil then
    SetAttributesUMLInstance(Element, RefXMIElement)
  else begin
    SetAttributesUMLModelElement(Element, RefXMIElement);
    SetXMIAttrReference(RefXMIElement, Element, UML_PROP_CLASSIFIER, ATTR_UML_BASE);
    SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_LINK_ENDS, ATTR_UML_PARTICIPANT);
    SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_SENDING_STIMULI, ATTR_UML_MESSAGE2);
    SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_RECIEVING_STIMULI, ATTR_UML_MESSAGE1);
    if UO.IsMultiInstance then
      ComposeXMIMultiplicity2(RefXMIElement, NODE_UML_CLASSIFIER_ROLE_MULTIPLICITY, '1..*')
    else
      ComposeXMIMultiplicity2(RefXMIElement, NODE_UML_CLASSIFIER_ROLE_MULTIPLICITY, '1');
    SetXMIAttributeValue(RefXMIElement, ATTR_UML_ROOT, XMI_VALUE_FALSE);
    SetXMIAttributeValue(RefXMIElement, ATTR_UML_LEAF, XMI_VALUE_FALSE);
    SetXMIAttributeValue(RefXMIElement, ATTR_UML_ABSTRACT, XMI_VALUE_FALSE);
  end;
end;

procedure PXMIExporter13.SetAttributesUMLOperation(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLBehavioralFeature(Element, RefXMIElement);
  SetXMIAttrEnumAttribute(RefXMIElement, Element, UML_PROP_CONCURRENCY, ATTR_UML_CONCURRENCY, ConvertXMICallConcurrencyKind);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_ROOT, ATTR_UML_ROOT);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_LEAF, ATTR_UML_LEAF);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_ABSTRACT, ATTR_UML_ABSTRACT);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_SPECIFICATION, ATTR_UML_SPEC);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_OWNER, ATTR_UML_OWNER);
end;

procedure PXMIExporter13.SetAttributesUMLPackage(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLNamespace(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLParameter(Element: IElement; RefXMIElement: PXMIElement);
var
  UP: IUMLParameter;
  XE, XED: PXMIElement;
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  ComposeXMIExpression(RefXMIElement, Element, UML_PROP_DEFAULT_VALUE, NODE_UML_PARAM_DEFAULT, NODE_UML_EXPR);
  SetXMIAttrEnumAttribute(RefXMIElement, Element, UML_PROP_DIRECTION_KIND, ATTR_UML_KIND, ConvertXMIParameterDirectionKind);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_BEHAVIOR_FEATURE, ATTR_UML_BEHAVIORAL_FEATURE);
  Assert(Element.QueryInterface(IUMLParameter, UP) = S_OK);
  if UP.Type_ = nil then begin
    if UP.TypeExpression = '' then
      SetXMIAttributeValue(RefXMIElement, ATTR_UML_TYPE, '')
    else begin
      XED := AcquireDataTypeXMIElement(UP.TypeExpression, RefXMIElement);
      Assert(XED <> nil);
      SetXMIAttributeValue(RefXMIElement, ATTR_UML_TYPE, XED.XMIId);
    end;
  end
  else begin
    XE := FindXMIElementByElement(UP.Type_);
    if XE = nil then begin
      XED := AcquireDataTypeXMIElement(UP.Type_.Name, RefXMIElement);
      Assert(XED <> nil);
      SetXMIAttributeValue(RefXMIElement, ATTR_UML_TYPE, XED.XMIId);
    end
    else
      SetXMIAttributeValue(RefXMIElement, ATTR_UML_TYPE, XE.XMIId);
  end;
end;

procedure PXMIExporter13.SetAttributesUMLPartition(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_ACTIVITY_GRAPH, ATTR_UML_ACTIVITYGRAPH);
end;

procedure PXMIExporter13.SetAttributesUMLPseudostate(Element: IElement; RefXMIElement: PXMIElement);
var
  UP: IUMLPseudostate;
begin
  SetAttributesUMLStateVertex(Element, RefXMIElement);
  Assert(Element.QueryInterface(IUMLPseudostate, UP) = S_OK);
  if Up.PseudostateKind = pkSynchronization then begin
    if (UP.GetIncomingCount = 1) and (UP.GetOutgoingCount >= 2) then
      SetXMIAttributeValue(RefXMIElement, ATTR_UML_KIND, XMI_VALUE_FORK)
    else if (UP.GetIncomingCount >= 2) and (UP.GetOutgoingCount = 1) then
      SetXMIAttributeValue(RefXMIElement, ATTR_UML_KIND, XMI_VALUE_JOIN)
    else begin
      // raise exception
    end;
  end
  else
    SetXMIAttrEnumAttribute(RefXMIElement, Element, UML_PROP_PSEUDOSTATE_KIND, ATTR_UML_KIND, ConvertXMIPseudostateKind);
end;

procedure PXMIExporter13.SetAttributesUMLRealization(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLDependency(Element, RefXMIElement);
  SetXMIStereotype(RefXMIElement, TYPE_REALIZE);
  ComposeXMIExpression(RefXMIElement, Element, UML_PROP_MAPPING, NODE_UML_ABSTRACTION_MAPPING, NODE_UML_MAPPING_EXPR);
end;

procedure PXMIExporter13.SetAttributesUMLRelationship(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLReturnAction(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLAction(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLSendAction(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLAction(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_SIGNAL, ATTR_UML_SIGNAL);
end;

procedure PXMIExporter13.SetAttributesUMLSignal(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLClassifier(Element, RefXMIElement);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_SENDACTIONS, ATTR_UML_SEND_ACTION);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_CONTEXTS, ATTR_UML_CONTEXT);
  if FRoseExtended and not Element.IsKindOf(UML_EXCEPTION) then
    SetXMIStereotype(RefXMIElement, TYPE_SIGNAL);
end;

procedure PXMIExporter13.SetAttributesUMLSignalEvent(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLEvent(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_SIGNAL, ATTR_UML_SIGNAL);
end;

procedure PXMIExporter13.SetAttributesUMLSimpleState(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLState(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLState(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLStateVertex(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_STATE_MACHINE, ATTR_UML_STATE_MACHINE);
end;

procedure PXMIExporter13.SetAttributesUMLStateMachine(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_CONTEXT, ATTR_UML_CONTEXT);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_SUBMACHINE_STATES, ATTR_UML_SUBMACHINE_STATE);
end;

procedure PXMIExporter13.SetAttributesUMLStateVertex(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_CONTAINER_STATE, ATTR_UML_CONTAINER);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_OUTGOINGS, ATTR_UML_OUTGOING);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_INCOMINGS, ATTR_UML_INCOMING);
end;

procedure PXMIExporter13.SetAttributesUMLStimulus(Element: IElement; RefXMIElement: PXMIElement);
var
  US: IUMLStimulus;
begin
  Assert(Element.QueryInterface(IUMLStimulus, US) = S_OK);
  SetAttributesUMLModelElement(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_SENDER, ATTR_UML_SENDER);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_RECIVER, ATTR_UML_RECEIVER);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_COMMUNICATION_LINK, ATTR_UML_COMM_CONN);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_INTERACTION_INSTANCE_SET, ATTR_UML_INTERACTION);
  if Element.MOF_GetAttribute(UML_PROP_ARGUMENTS) <> '' then
    SetXMITaggedValue(RefXMIElement, TAG_ARGUMENTS, Element.MOF_GetAttribute(UML_PROP_ARGUMENTS));
  if Element.MOF_GetAttribute(UML_PROP_RETURN) <> '' then
    SetXMITaggedValue(RefXMIElement, TAG_RETURN, Element.MOF_GetAttribute(UML_PROP_RETURN));
  if Element.MOF_GetAttribute(UML_PROP_ITERATION) <> '' then
    SetXMITaggedValue(RefXMIElement, TAG_ITERATION, Element.MOF_GetAttribute(UML_PROP_ITERATION));
  if Element.MOF_GetAttribute(UML_PROP_BRANCH) <> '' then
    SetXMITaggedValue(RefXMIElement, TAG_BRANCH, Element.MOF_GetAttribute(UML_PROP_BRANCH));
  if FRoseExtended then begin
    if US.Action <> nil then begin
      // if CallAction then do nothing.
      if US.Action.GetClassName = UML_SEND_ACTION then
        SetXMIStereotype(RefXMIElement, TYPE_ASYNCHRONOUS)
      else if US.Action.GetClassName = UML_RETURN_ACTION then
        SetXMIStereotype(RefXMIElement, TYPE_RETURN)
      // another idea
      // if US.Action.GetClassName = 'UMLCallAction' then begin
      //   if US.Action.IsAsynchronous then
      //     SetXMIStereotype(RefXMIElement, 'procededure_call')
      //   else
      //     SetXMIStereotype(RefXMIElement, 'synchronous')
      // end
      // else if US.Action.GetClassName = 'UMLSendAction') then
      //   SetXMIStereotype(RefXMIElement, 'asynchronous')
      // else if US.Action.GetClassName = 'UMLReturnAction' then
      //   SetXMIStereotype(RefXMIElement, 'return')
    end;
  end;
end;

procedure PXMIExporter13.SetAttributesUMLStructuralFeature(Element: IElement; RefXMIElement: PXMIElement);
var
  USF: IUMLStructuralFeature;
  XE, XED: PXMIElement;
begin
  SetAttributesUMLFeature(Element, RefXMIElement);
  ComposeXMIMultiplicity(RefXMIElement, Element, UML_PROP_MULTIPLICITY, NODE_UML_STRUCTURAL_MULTIPLICITY);
  SetXMIAttrEnumAttribute(RefXMIElement, Element, UML_PROP_CHANGEABILITY, ATTR_UML_CHANGEABILITY, ConvertXMIChangeabilityKind);
  SetXMIAttrEnumAttribute(RefXMIElement, Element, UML_PROP_TARGET_SCOPE, ATTR_UML_TARGET_SCOPE, ConvertXMIScopeKind);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_TYPE_, ATTR_UML_TYPE);
  SetXMITaggedValue(RefXMIElement, TAG_ORDERING, ConvertXMIOrderingKind(Element.MOF_GetAttribute(UML_PROP_ORDERING)));
  Assert(Element.QueryInterface(IUMLStructuralFeature, USF) = S_OK);
  if USF.Type_ = nil then begin
    if USF.TypeExpression = '' then
      SetXMIAttributeValue(RefXMIElement, ATTR_UML_TYPE, '')
    else begin
      XED := AcquireDataTypeXMIElement(USF.TypeExpression, RefXMIElement);
      Assert(XED <> nil);
      SetXMIAttributeValue(RefXMIElement, ATTR_UML_TYPE, XED.XMIId);
    end;
  end
  else begin
    XE := FindXMIElementByElement(USF.Type_);
    if XE = nil then begin
      XED := AcquireDataTypeXMIElement(USF.Type_.Name, RefXMIElement);
      Assert(XED <> nil);
      SetXMIAttributeValue(RefXMIElement, ATTR_UML_TYPE, XED.XMIId);
    end
    else
      SetXMIAttributeValue(RefXMIElement, ATTR_UML_TYPE, XE.XMIId);
  end;
end;

procedure PXMIExporter13.SetAttributesUMLSubactivityState(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLSubmachineState(Element, RefXMIElement);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_DYNAMIC, ATTR_UML_IS_DYNAMIC);
  ComposeXMIExpression(RefXMIElement, Element, UML_PROP_DYNAMIC_ARGUMENTS, NODE_UML_SUBACTIVITY_ARGS, NODE_UML_ARG_LIST_EXPR);
  ComposeXMIMultiplicity(RefXMIElement, Element, UML_PROP_DYNAMIC_MULTIPLICITY, NODE_UML_SUBACTIVITY_MULTIPLICITY);
end;

procedure PXMIExporter13.SetAttributesUMLSubmachineState(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLCompositeState(Element, RefXMIElement);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_SUBMACHINE, ATTR_UML_SUBMACHINE);
end;

procedure PXMIExporter13.SetAttributesUMLSubsystem(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLPackage(Element, RefXMIElement);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_IS_INSTANTIABLE, ATTR_UML_IS_INSTANTIALBLE);
end;

procedure PXMIExporter13.SetAttributesUMLTemplateParameter(Element: IElement; RefXMIElement: PXMIElement);
var
  UT: IUMLTemplateParameter;
  XE: PXMIElement;
begin
  SetAttributesUMLElement(Element, RefXMIElement);
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_NAME, ATTR_UML_NAME);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_TEMPLATE, ATTR_UML_MODEL_ELEMENT);
  XE := AcquireParameterXMIElementForTemplateParameter(RefXMIElement);
  SetXMIAttributeValue(RefXMIElement, ATTR_UML_MODEL_ELEM2, XE.XMIId);
  Assert(Element.QueryInterface(IUMLTemplateParameter, UT) = S_OK);
  if UT.DefaultValue <> '' then begin
    XE := AcquireParameterXMIElementForTemplateParameter(RefXMIElement);
    ComposeXMIExpression2(XE, NODE_UML_PARAM_DEFAULT, NODE_UML_EXPR, UT.DefaultValue);
    SetXMIAttributeValue(RefXMIElement, ATTR_UML_DEFAULT_ELEM, XE.XMIId);
  end;
end;

procedure PXMIExporter13.SetAttributesUMLTimeEvent(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLEvent(Element, RefXMIElement);
  ComposeXMIExpression(RefXMIElement, Element, UML_PROP_WHEN, NODE_UML_TIME_EVENT_WHEN, NODE_UML_TIME_EXPR);
end;

procedure PXMIExporter13.SetAttributesUMLTransition(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLModelElement(Element, RefXMIElement);
  ComposeXMITransitionGuard(RefXMIElement, Element);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_STATE_MACHINE, ATTR_UML_STATE_MACHINE);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_SOURCE, ATTR_UML_SOURCE);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_TARGET, ATTR_UML_TARGET);
end;

procedure PXMIExporter13.SetAttributesUMLUninterpretedAction(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLAction(Element, RefXMIElement);
end;

procedure PXMIExporter13.SetAttributesUMLUseCase(Element: IElement; RefXMIElement: PXMIElement);
begin
  SetAttributesUMLClassifier(Element, RefXMIElement);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_EXTENDERS, ATTR_UML_EXTEND2);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_EXTENDS, ATTR_UML_EXTEND);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_INCLUDERS, ATTR_UML_INCLUDE2);
  SetXMIAttrAggregation(RefXMIElement, Element, UML_PROP_INCLUDES, ATTR_UML_INCLUDE);
end;

procedure PXMIExporter13.SetAttributesDiagram(Element: IElement; RefXMIElement: PXMIElement);
var
  Dgm: IDiagram;
  DgmKind: string;
begin
  SetXMIAttrAttribute(RefXMIElement, Element, UML_PROP_NAME, ATTR_UML_NAME);
  Assert(Element.QueryInterface(IDiagram, Dgm) = S_OK);
  DgmKind := Element.GetClassName;
  if DgmKind = UML_CLASS_DIAGRAM then SetXMIAttributeValue(RefXMIElement, ATTR_UML_DIAGRAM_TYPE, DGM_CLASS_DIAGRAM)
  else if DgmKind = UML_USECASE_DIAGRAM then SetXMIAttributeValue(RefXMIElement, ATTR_UML_DIAGRAM_TYPE, DGM_USECASE_DIAGRAM)
  else if DgmKind = UML_SEQUENCE_DIAGRAM then SetXMIAttributeValue(RefXMIElement, ATTR_UML_DIAGRAM_TYPE, DGM_SEQUENCE_DIAGRAM)
  else if DgmKind = UML_SEQUENCE_ROLE_DIAGRAM then SetXMIAttributeValue(RefXMIElement, ATTR_UML_DIAGRAM_TYPE, DGM_SEQUENCE_DIAGRAM)
  else if DgmKind = UML_COLLABORATION_DIAGRAM then SetXMIAttributeValue(RefXMIElement, ATTR_UML_DIAGRAM_TYPE, DGM_COLLABORATION_DIAGRAM)
  else if DgmKind = UML_COLLABORATION_ROLE_DIAGRAM then SetXMIAttributeValue(RefXMIElement, ATTR_UML_DIAGRAM_TYPE, DGM_COLLABORATION_DIAGRAM)
  else if DgmKind = UML_STATECHART_DIAGRAM then SetXMIAttributeValue(RefXMIElement, ATTR_UML_DIAGRAM_TYPE, DGM_STATE_DIAGRAM)
  else if DgmKind = UML_ACTIVITY_DIAGRAM then SetXMIAttributeValue(RefXMIElement, ATTR_UML_DIAGRAM_TYPE, DGM_ACTIVITY_DIAGRAM)
  else if DgmKind = UML_COMPONENT_DIAGRAM then SetXMIAttributeValue(RefXMIElement, ATTR_UML_DIAGRAM_TYPE, DGM_MODULE_DIAGRAM)
  else if DgmKind = UML_DEPLOYMENT_DIAGRAM then SetXMIAttributeValue(RefXMIElement, ATTR_UML_DIAGRAM_TYPE, DGM_DEPLOYMENT_DIAGRAM);
  SetXMIAttributeValue(RefXMIElement, ATTR_TOOL_NAME, XMI_VALUE_ROSE);
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_DIAGRAM_OWNER, ATTR_UML_OWNER);
  if Dgm.Documentation <> '' then
    SetXMITaggedValue(RefXMIElement, TAG_DOCUMENTATION, Dgm.Documentation);
end;

procedure PXMIExporter13.SetAttributesView(Element: IElement; RefXMIElement: PXMIElement);
var
  V: IView;
begin
  Assert(Element.QueryInterface(IView, V) = S_OK);
  SetXMIAttributeValue(RefXMIElement, ATTR_UML_GEOMETRY, GetDiagramElementGeometryValue(V));
  SetXMIAttributeValue(RefXMIElement, ATTR_UML_STYLE, GetDiagramElementStyleValue(V));
  SetXMIAttrReference(RefXMIElement, Element, UML_PROP_MODEL, ATTR_UML_SUBJECT);
end;

function PXMIExporter13.GetDiagramElementStylePrefix(View: IView): string;
var
  VClass: string;
begin
  VClass := View.GetClassName;
  if VClass = UML_ACTION_STATE_VIEW then Result := ''
  else if VClass = UML_ACTOR_VIEW then Result := ''
//  else if VClass = 'UMLAssociationClassView' then Result := ''   // not export
  else if VClass = UML_ASSOCIATION_ROLE_VIEW then Result := ''
  else if VClass = UML_ASSOCIATION_VIEW then Result := VIEW_PREFIX_ASSOCIATION
  else if VClass = UML_CLASS_VIEW then Result := ''
  else if VClass = UML_COL_CLASSIFIER_ROLE_VIEW then Result := ''
//  else if VClass = 'UMLCollaborationInstanceSetView' then Result := ''  // not support
//  else if VClass = 'UMLCollaborationView' then Result := ''   // not support
  else if VClass = UML_COL_MESSAGE_VIEW then Result := ''
  else if VClass = UML_COL_OBJECT_VIEW then Result := ''
  else if VClass = UML_COL_STIMULUS_VIEW then Result := ''
//  else if VClass = 'UMLComponentInstanceView' then Result := ''   // not support
  else if VClass = UML_COMPONENT_VIEW then Result := VIEW_PREFIX_MODULE
  else if VClass = UML_DEPENDENCY_VIEW then Result := VIEW_PREFIX_DEPENDENCY_RELATION
    // also ClassDependency, CategoryDependency, VisibilityRelation ...
  else if VClass = UML_ENUMERATION_VIEW then Result := ''
  else if VClass = UML_EXCEPTION_VIEW then Result := ''
  else if VClass = UML_EXTEND_VIEW then Result := VIEW_PREFIX_DEPENDENCY_RELATION
  else if VClass = UML_FINAL_STATE_VIEW then Result := ''
  else if VClass = UML_GENERALIZATION_VIEW then Result := VIEW_PREFIX_INHERITANCE
  else if VClass = UML_INCLUDE_VIEW then Result := VIEW_PREFIX_DEPENDENCY_RELATION
  else if VClass = UML_INTERFACE_VIEW then Result := ''
//  else if VClass = 'UMLLinkView' then Result := ''    // not support
//  else if VClass = 'UMLModelView' then Result := ''   // not support
//  else if VClass = 'UMLNodeInstanceView' then Result := ''    // not support
  else if VClass = UML_NODE_VIEW then Result := ''
//  else if VClass = 'UMLNoteLinkView' then Result := ''    // not export
  else if VClass = UML_NOTE_VIEW then Result := VIEW_PREFIX_NOTE
  else if VClass = UML_PACKAGE_VIEW then Result := VIEW_PREFIX_CATEGORY
  else if VClass = UML_PSEUDOSTATE_VIEW then Result := ''
  else if VClass = UML_REALIZATION_VIEW then Result := VIEW_PREFIX_REALIZE_RELATION
  else if VClass = UML_SEQ_CLASSIFIER_ROLE_VIEW then Result := ''
  else if VClass = UML_SEQ_MESSAGE_VIEW then Result := ''
  else if VClass = UML_SEQ_OBJECT_VIEW then Result := ''
  else if VClass = UML_SEQ_STIMULUS_VIEW then Result := ''
  else if VClass = UML_SIGNAL_VIEW then Result := ''
  else if VClass = UML_STATE_VIEW then Result := ''
  else if VClass = UML_SUBACTIVITY_STATE_VIEW then Result := ''
  else if VClass = UML_SUBMACHINE_STATE_VIEW then Result := ''
//  else if VClass = 'UMLSubsystemView' then Result := ''   // not support
  else if VClass = UML_SWIMLANE_VIEW then Result := VIEW_PREFIX_SWIMLANE
//  else if VClass = 'UMLTextView' then Result := ''    // not support
  else if VClass = UML_TRANSITION_VIEW then Result := VIEW_PREFIX_TRANSITION
  else if VClass = UML_USECASE_VIEW then Result := ''
  else Result := '';
end;

function PXMIExporter13.GetXMIViewStyleKindSet(View: IView): PXMIViewStyleKindSet;
const
  VKS_STANDARD: PXMIViewStyleKindSet = [skLineColor, skFillColor, skFont, skAutoResize];
var
  VClass: string;
begin
  VClass := View.GetClassName;
  if VClass = UML_ACTION_STATE_VIEW then Result := VKS_STANDARD
  else if VClass = UML_ACTOR_VIEW then Result := VKS_STANDARD + [skAttribute, skOperation]
//  else if VClass = 'UMLAssociationClassView' then Result := []    // not export
  else if VClass = UML_ASSOCIATION_ROLE_VIEW then Result := []
  else if VClass = UML_ASSOCIATION_VIEW then Result := [skLineColor, skFont]
  else if VClass = UML_CLASS_VIEW then Result := VKS_STANDARD + [skAttribute, skOperation]
  else if VClass = UML_COL_CLASSIFIER_ROLE_VIEW then Result := VKS_STANDARD
//  else if VClass = 'UMLCollaborationInstanceSetView' then Result := []    // not support
//  else if VClass = 'UMLCollaborationView' then Result := []   // not support
  else if VClass = UML_COL_MESSAGE_VIEW then Result := [skMessage]
  else if VClass = UML_COL_OBJECT_VIEW then Result := VKS_STANDARD
  else if VClass = UML_COL_STIMULUS_VIEW then Result := [skMessage]
//  else if VClass = 'UMLComponentInstanceView' then Result := []   // not support
  else if VClass = UML_COMPONENT_VIEW then Result := VKS_STANDARD
  else if VClass = UML_DEPENDENCY_VIEW then Result := []
  else if VClass = UML_ENUMERATION_VIEW then Result := VKS_STANDARD + [skLiteral, skOperation]
  else if VClass = UML_EXCEPTION_VIEW then Result := VKS_STANDARD + [skAttribute, skOperation]
  else if VClass = UML_EXTEND_VIEW then Result := []
  else if VClass = UML_FINAL_STATE_VIEW then Result := VKS_STANDARD
  else if VClass = UML_GENERALIZATION_VIEW then Result := []
  else if VClass = UML_INCLUDE_VIEW then Result := []
  else if VClass = UML_INTERFACE_VIEW then Result := VKS_STANDARD + [skAttribute, skOperation]
//  else if VClass = 'UMLLinkView' then Result := []    // not support
//  else if VClass = 'UMLModelView' then Result := []   // not support
//  else if VClass = 'UMLNodeInstanceView' then Result := []    // not support
  else if VClass = UML_NODE_VIEW then Result := VKS_STANDARD
//  else if VClass = 'UMLNoteLinkView' then Result := []    // not export
  else if VClass = UML_NOTE_VIEW then Result := VKS_STANDARD
  else if VClass = UML_PACKAGE_VIEW then Result := []
  else if VClass = UML_PSEUDOSTATE_VIEW then Result := VKS_STANDARD + [skSyncItem]
  else if VClass = UML_REALIZATION_VIEW then Result := []
  else if VClass = UML_SEQ_CLASSIFIER_ROLE_VIEW then Result := VKS_STANDARD
  else if VClass = UML_SEQ_MESSAGE_VIEW then Result := [skMessage]
  else if VClass = UML_SEQ_OBJECT_VIEW then Result := VKS_STANDARD
  else if VClass = UML_SEQ_STIMULUS_VIEW then Result := [skMessage]
  else if VClass = UML_SIGNAL_VIEW then Result := VKS_STANDARD + [skAttribute, skOperation]
  else if VClass = UML_STATE_VIEW then Result := VKS_STANDARD
  else if VClass = UML_SUBACTIVITY_STATE_VIEW then Result := VKS_STANDARD
  else if VClass = UML_SUBMACHINE_STATE_VIEW then Result := VKS_STANDARD
//  else if VClass = 'UMLSubsystemView' then Result := []   // not support
  else if VClass = UML_SWIMLANE_VIEW then Result := []
//  else if VClass = 'UMLTextView' then Result := []    // not support
  else if VClass = UML_TRANSITION_VIEW then Result := []
  else if VClass = UML_USECASE_VIEW then Result := VKS_STANDARD + [skAttribute, skOperation]
  else Result := [];
end;

function PXMIExporter13.GetDiagramElementStyleValue(View: IView): string;

  function GetIndexOfMessage(AInteraction: IUMLInteraction; AMessage: IUMLMessage): Integer;
  var
    I: Integer;
  begin
    Result := -1;
    for I := 0 to AInteraction.GetMessageCount - 1 do begin
      if AInteraction.GetMessageAt(I).GetGuid = AMessage.GetGuid then begin
        Result := I;
        Exit;
      end;
    end;
  end;

  function GetIndexOfStimulus(AInteractionInstanceSet: IUMLInteractionInstanceSet; AStimulus: IUMLStimulus): Integer;
  var
    I: Integer;
  begin
    Result := -1;
    for I := 0 to AInteractionInstanceSet.GetParticipatingStimulusCount - 1 do begin
      if AInteractionInstanceSet.GetParticipatingStimulusAt(I).GetGuid = AStimulus.GetGuid then begin
        Result := I;
        Exit;
      end;
    end;
  end;

const
  FS_BOLD = 1;
  FS_ITALIC = 2;
  FS_UNDERLINE = 4;
  FS_STRIKEOUT = 8;
var
  UM: IUMLMessage;
  US: IUMLStimulus;
  UP: IUMLPseudostate;
  UPV: IUMLPseudostateView;
  ViewStyles: PXMIViewStyleKindSet;
  Prefix, S: string;
  R, G, B: Byte;
begin
  Prefix := GetDiagramElementStylePrefix(View);
  ViewStyles := GetXMIViewStyleKindSet(View);

  S := '';
  if skLineColor in ViewStyles then begin
    PUtility.GetRGBColor(StringToColor(View.LineColor), R, G, B);
    if S <> '' then S := S + ',';
    S := S + 'LineColor.Red=' + IntToStr(R);
    S := S + ',LineColor.Green=' + IntToStr(G);
    S := S + ',LineColor.Blue=' + IntToStr(B);
  end;

  if skFillColor in ViewStyles then begin
    PUtility.GetRGBColor(StringToColor(View.FillColor), R, G, B);
    if S <> '' then S := S + ',';
    S := S + 'FillColor.Red=' + IntToStr(R);
    S := S + ',FillColor.Green=' + IntToStr(G);
    S := S + ',FillColor.Blue=' + IntToStr(B);
  end;

  if skFont in ViewStyles then begin
    PUtility.GetRGBColor(StringToColor(View.FontColor), R, G, B);
    if S <> '' then S := S + ',';
    S := S + 'Font.Red=' + IntToStr(R);
    S := S + ',Font.Green=' + IntToStr(G);
    S := S + ',Font.Blue=' + IntToStr(B);

    S := S + ',Font.FaceName=' + View.FontFace;
    S := S + ',Font.Size=' + IntToStr(View.FontSize);

    if View.FontStyle and FS_BOLD = FS_BOLD then
      S := S + ',Font.Bold=1'
    else
      S := S + ',Font.Bold=0';
    if View.FontStyle and FS_ITALIC = FS_ITALIC then
      S := S + ',Font.Italic=1'
    else
      S := S + ',Font.Italic=0';
    if View.FontStyle and FS_UNDERLINE = FS_UNDERLINE then
      S := S + ',Font.Underline=1'
    else
      S := S + ',Font.Underline=0';
    if View.FontStyle and FS_STRIKEOUT = FS_STRIKEOUT then
      S := S + ',Font.Strikethrough=1'
    else
      S := S + ',Font.Strikethrough=0';
  end;
  if skAutoResize in ViewStyles then begin
    if S <> '' then S := S + ',';
    S := S + 'AutomaticResize=0';
  end;
  if skAttribute in ViewStyles then begin
    if S <> '' then S := S + ',';
    S := S + 'ShowAllAttributes=1';
    if View.MOF_GetAttribute('SuppressAttributes') = UML_VALUE_TRUE then
      S := S + ',SuppressAttributes=1'
    else
      S := S + ',SuppressAttributes=0';
  end;
  if skLiteral in ViewStyles then begin
    if S <> '' then S := S + ',';
    S := S + 'ShowAllAttributes=1';
    if View.MOF_GetAttribute('SuppressLiterals') = UML_VALUE_TRUE then
      S := S + ',SuppressAttributes=1'
    else
      S := S + ',SuppressAttributes=0';
  end;
  if skOperation in ViewStyles then begin
    if S <> '' then S := S + ',';
    S := S + 'ShowAllOperations=1';
    if View.MOF_GetAttribute('SuppressOperations') = UML_VALUE_TRUE then
      S := S + ',SuppressOperations=1'
    else
      S := S + ',SuppressOperations=0';
    if View.MOF_GetAttribute('ShowOperationSignature') = UML_VALUE_TRUE then
      S := S + ',ShowOperationSignature=1'
    else
      S := S + ',ShowOperationSignature=0';
  end;
  if skMessage in ViewStyles then begin
    if S <> '' then S := S + ',';
    if View.Model.QueryInterface(IUMLMessage, UM) = S_OK then
      S := S + 'Message,SQN=' + IntToStr(GetIndexOfMessage(UM.Interaction, UM) + 1)
    else if View.Model.QueryInterface(IUMLStimulus, US) = S_OK then
      S := S + 'Message,SQN=' + IntToStr(GetIndexOfStimulus(US.InteractionInstanceSet, US) + 1)
  end;
  if skSyncItem in ViewStyles then begin
    Assert(View.QueryInterface(IUMLPseudostateView, UPV) = S_OK);
    Assert(View.Model.QueryInterface(IUMLPseudostate, UP) = S_OK);
    if UP.PseudostateKind = pkSynchronization then begin
      if S <> '' then S := S + ',';
      if UPV.Width >= UPV.Height then
        S := S + 'SyncItem,Horizontal=1'
      else
        S := S + 'SyncItem,Horizontal=0'
    end;
  end;
  if S <> '' then S := S + ',';
  if Prefix <> '' then begin
    if S = '' then S := Prefix
    else S := Prefix + ':' + S;
  end;
  Result := S;
end;

function PXMIExporter13.GetDiagramElementGeometryValue(View: IView): string;

  function GetEdgeBoundingBox(EdgeView: IEdgeView): TRect;
  var
    R: TRect;
    I: Integer;
  begin
    R := Rect(EdgeView.Points.GetPointX(0), EdgeView.Points.GetPointY(0),
      EdgeView.Points.GetPointX(0), EdgeView.Points.GetPointY(0));
    for I := 1 to EdgeView.Points.GetPointCount - 1 do
      R := PUtility.UnionRect(R, Point(EdgeView.Points.GetPointX(I), EdgeView.Points.GetPointY(I)));
    Result := R;       
  end;

  function GetSwimlaneViewWidth(SwimlaneView: IUMLSwimlaneView): Integer;
  var
    V: IView;
    USV: IUMLSwimlaneView;
    L: Integer;
    I: Integer;
  begin
    L := 0;
    for I := 0 to SwimlaneView.GetDiagramView.GetOwnedViewCount - 1 do begin
      V := SwimlaneView.GetDiagramView.GetOwnedViewAt(I);
      if V.IsKindOf(UML_SWIMLANE_VIEW) then begin
        V.QueryInterface(IUMLSwimlaneView, USV);
        if (USV.Left < SwimlaneView.Left) and (USV.Left > L) then
          L := USV.Left;
      end;
    end;
    Result := SwimlaneView.Left - L;
  end;

const
  SWIMLANE_MIN_LEFT = 50;
var
  NV: INodeView;
  EV: IEdgeView;
  USV: IUMLSwimlaneView;
  CX, CY: Integer;
  R: TRect;
  W: Integer;
  S: string;
begin
  S := '';
  if View.QueryInterface(IUMLSwimlaneView, USV) = S_OK then begin
    W := GetSwimlaneViewWidth(USV);
    CX := (USV.Left - W) * 3 + W * 3 div 2 - SWIMLANE_MIN_LEFT;
    CY := USV.Top * 3 + USV.Height * 3 div 2;
    S := Format('%d, %d, %d, %d,', [CX, CY, W * 3, USV.Height * 3]);
  end
  else if View.QueryInterface(INodeView, NV) = S_OK then begin
    CX := NV.Left * 3 + NV.Width * 3 div 2;
    CY := NV.Top * 3 + NV.Height * 3 div 2;
    S := Format('%d, %d, %d, %d,', [CX, CY, NV.Width * 3, NV.Height * 3]);
  end
  else if View.QueryInterface(IEdgeView, EV) = S_OK then begin
    R := GetEdgeBoundingBox(EV);
    CX := R.Left * 3 + (R.Right - R.Left) * 3 div 2;
    CY := R.Top * 3 + (R.Bottom - R.Top) * 3 div 2;
    S := Format('%d, %d, %d, %d,', [CX, CY, (R.Right - R.Left) * 3, (R.Bottom - R.Top) * 3]);
  end;
  Result := S;
end;

procedure PXMIExporter13.ComposeXMIMultiplicity(XMIElement: PXMIElement; Element: IElement; AttrName: string; AttrXMIElemName: string);
begin
  ComposeXMIMultiplicity2(XMIElement, AttrXMIElemName, Element.MOF_GetAttribute(AttrName));
end;

procedure PXMIExporter13.ComposeXMIMultiplicity2(XMIElement: PXMIElement; AttrXMIElemName: string; Value: string);

  function GetLower(Str: string): string;
  var
    P: Integer;
    S: string;
  begin
    P := Pos('..', Str);
    if P = 0 then S := Str
    else S := Copy(Str, 1, P - 1);
    if S = '*' then Result := '-1'
    else Result := S;
  end;

  function GetUpper(Str: string): string;
  var
    P: Integer;
    S: string;
  begin
    P := Pos('..', Str);
    if P = 0 then S := Str
    else S := Copy(Str, P + 2, Length(Str) - P - 1);
    if S = '*' then Result := '-1'
    else Result := S;
  end;

var
  XE, XEMulti, XERange, XEMRange: PXMIElement;
  SL: TStringList;
  I: Integer;
begin
  if Value <> '' then begin
    XE := CreateXMIElement(AttrXMIElemName, nil, XMIElement, False);
    XEMulti := CreateXMIElement(NODE_UML_MULTIPLICITY, nil, XE);
    XERange := CreateXMIElement(NODE_UML_MULTI_RANGE, nil, XEMulti, False);
    SL := TStringList.Create;
    try
      SL.Delimiter := ',';
      SL.DelimitedText := Value;
      for I := 0 to SL.Count - 1 do begin
        XEMRange := CreateXMIElement(NODE_UML_MULTIPLICITY_RANGE, nil, XERange);
        SetXMIAttributeValue(XEMRange, ATTR_UML_LOWER, GetLower(SL[I]));
        SetXMIAttributeValue(XEMRange, ATTR_UML_UPPER, GetUpper(SL[I]));
        SetXMIAttributeValue(XEMRange, ATTR_UML_MULTIPLICITY, XEMulti.XMIId);
      end;
    finally
      SL.Free;
    end;
  end;
end;

procedure PXMIExporter13.ComposeXMIExpression(XMIElement: PXMIElement; Element: IElement; AttrName: string; AttrXMIElemName: string; XMIExpressionName: string);
var
  S: string;
begin
  S := Element.MOF_GetAttribute(AttrName);
  if S <> '' then
    ComposeXMIExpression2(XMIElement, AttrXMIElemName, XMIExpressionName, S);
end;

procedure PXMIExporter13.ComposeXMIExpression2(XMIElement: PXMIElement; AttrXMIElemName: string; XMIExpressionName: string; Value: string);
var
  XE, XEE: PXMIElement;
begin
  XE := CreateXMIElement(AttrXMIElemName, nil, XMIElement, False);
  XEE := CreateXMIElement(XMIExpressionName, nil, XE);
  SetXMIAttributeValue(XEE, ATTR_UML_BODY, Value);
end;

procedure PXMIExporter13.ComposeXMIComponentResident(XMIElement: PXMIElement; Element: IElement);
var
  UC: IUMLComponent;
  XE, XER, XEE: PXMIElement;
  RE: IUMLModelElement;
  I: Integer;
begin
  Assert(Element.QueryInterface(IUMLComponent, UC) = S_OK);
  if UC.GetResidentCount > 0 then begin
    XE := CreateXMIElement(NODE_UML_COMPONENT_RESIDENT, nil, XMIElement, False);
    for I := 0 to UC.GetResidentCount - 1 do begin
      RE := UC.GetResidentAt(I);
      XER := CreateXMIElement(NODE_UML_ELEMENT_RESIDENCE, nil, XE);
      XEE := FindXMIElementByElement(RE);
      if XEE <> nil then begin
        AddXMIAttributeValue(XER, ATTR_UML_RESIDENT, XEE.XMIId);
        AddXMIAttributeValue(XEE, ATTR_UML_ELEMENT_RESIDENCE, XER.XMIId);
      end;
      AddXMIAttributeValue(XER, ATTR_UML_IMPL_LOCATION, XMIElement.XMIId);
    end;
  end;
end;

procedure PXMIExporter13.ComposeXMITransitionGuard(XMIElement: PXMIElement; Element: IElement);
var
  UT: IUMLTransition;
  XE, XEG, XEGE, XEE: PXMIElement;
begin
  Assert(Element.QueryInterface(IUMLTransition, UT) = S_OK);
  if UT.GuardCondition <> '' then begin
    XE := CreateXMIElement(NODE_UML_TRANSITION_GUARD, nil, XMIElement, False);
    XEG := CreateXMIElement(NODE_UML_GUARD, nil, XE);
    SetXMIAttributeValue(XEG, ATTR_UML_TRANSITION, XMIElement.XMIId);
    XEGE := CreateXMIElement(NODE_UML_GUARD_EXPR, nil, XEG, False);
    XEE := CreateXMIElement(NODE_UML_BOOLEAN_EXPR, nil, XEGE);
    SetXMIAttributeValue(XEE, ATTR_UML_BODY, UT.GuardCondition);
  end;
end;

function PXMIExporter13.AcquireDataTypeXMIElement(DataTypeName: string; RefXMIElement: PXMIElement): PXMIElement;

  function GetTopPackageXMIElement(XMIElement: PXMIElement): PXMIElement;
  var
    XE: PXMIElement;
  begin
    Assert(XMIElement.TargetElement <> nil);
    if XMIElement.TargetElement.IsKindOf(UML_PACKAGE) then begin
      XE := XMIElement.FindAncestorByUMLElementKind(UML_PACKAGE);
      if XE = nil then Result := XMIElement
      else Result := GetTopPackageXMIElement(XE);
    end
    else begin
      XE := XMIElement.FindAncestorByUMLElementKind(UML_PACKAGE);
      if XE = nil then Result := nil
      else Result := GetTopPackageXMIElement(XE);
    end;
  end;

var
  XEP, XEO: PXMIElement;
  XE: PXMIElement;
  XA: PXMIAttribute;
  I: Integer;
begin
  Assert(RefXMIElement.TargetElement <> nil);
  XEP := GetTopPackageXMIElement(RefXMIElement);
  Assert(XEP <> nil);
  XEO := AcquireXMIElement(XEP, NODE_UML_NAMESPACE_OWNED_ELEMENT, nil, False);
  for I := 0 to XEO.ChildCount - 1 do begin
    XE := XEO.Children[I];
    if XE.XMIElementName = NODE_UML_DATA_TYPE then begin
      XA := XE.FindXMIAttribute(ATTR_UML_NAME);
      Assert(XA <> nil);
      if (XA.ValueCount > 0) and (XA.Values[0] = DataTypeName) then begin
        Result := XE;
        Exit;
      end;
    end;
  end;
  // if not found
  XE := CreateXMIElementExt(NODE_UML_DATA_TYPE, nil, XEO);
  SetXMIAttributeValue(XE, ATTR_UML_NAME, DataTypeName);
  SetXMIAttributeValue(XE, ATTR_UML_VISIBILITY, XMI_VALUE_PUBLIC);
  SetXMIAttributeValue(XE, ATTR_UML_SPECIFICATION, XMI_VALUE_FALSE);
  SetXMIAttributeValue(XE, ATTR_UML_ROOT, XMI_VALUE_FALSE);
  SetXMIAttributeValue(XE, ATTR_UML_LEAF, XMI_VALUE_FALSE);
  SetXMIAttributeValue(XE, ATTR_UML_ABSTRACT, XMI_VALUE_FALSE);
  Result := XE;
end;

function PXMIExporter13.AcquireParameterXMIElementForTemplateParameter(XMIElement: PXMIElement): PXMIElement;
var
  UT: IUMLTemplateParameter;
  XE, XEP, XEO, XED: PXMIElement;
begin
  Assert(XMIElement.TargetElement <> nil);
  Assert(XMIElement.TargetElement.QueryInterface(IUMLTemplateParameter, UT) = S_OK);
  XEP := XMIElement.FindAncestorByUMLElementKind(UML_PACKAGE);
  Assert(XEP <> nil);
  XEO := AcquireXMIElement(XEP, NODE_UML_NAMESPACE_OWNED_ELEMENT, nil, False);
  XE := CreateXMIElementExt(NODE_UML_PARAMETER, nil, XEO);
  SetXMIAttributeValue(XE, ATTR_UML_NAME, UT.Name);
  SetXMIAttributeValue(XE, ATTR_UML_SPECIFICATION, XMI_VALUE_FALSE);
  SetXMIAttributeValue(XE, ATTR_UML_KIND, XMI_VALUE_IN);
  if UT.ParameterType <> '' then begin
    XED := AcquireDataTypeXMIElement(UT.ParameterType, XMIElement);
    SetXMIAttributeValue(XE, ATTR_UML_TYPE, XED.XMIId);
  end;
  Result := XE;
end;

function PXMIExporter13.CreateCommentXMIElement(RefXMIElement: PXMIElement; Text: string): PXMIElement;
var
  XEP, XE: PXMIElement;
begin
  Assert(RefXMIElement.TargetElement <> nil);
  if RefXMIElement.TargetElement.IsKindOf(UML_PACKAGE) then
    XEP := RefXMIElement
  else
    XEP := RefXMIElement.FindAncestorByUMLElementKind(UML_PACKAGE);
  Assert(XEP <> nil);
  XE := CreateXMIElement(NODE_UML_COMMENT, nil, XEP);
  SetXMIAttributeValue(XE, ATTR_UML_NAME, PUtility.EncodeXMLAttributeValue(Text));
  SetXMIAttributeValue(XE, ATTR_UML_VISIBILITY, XMI_VALUE_PUBLIC);
  SetXMIAttributeValue(XE, ATTR_UML_SPECIFICATION, XMI_VALUE_FALSE);
  SetXMIAttributeValue(XE, ATTE_UML_ANNOTATED_ELEM, XEP.XMIId);
  Result := XE;
end;

function PXMIExporter13.FindTopLevelUMLModel(Project: IUMLProject; ModelName: string): IUMLModel;
var
  M: IUMLModel;
  I: Integer;
begin
  Result := nil;
  for I := 0 to Project.GetOwnedElementCount - 1 do
    if Project.GetOwnedElementAt(I).IsKindOf(UML_MODEL) and (Project.GetOwnedElementAt(I).Name = ModelName) then begin
      Project.GetOwnedElementAt(I).QueryInterface(IUMLModel, M);
      Result := M;
      Exit;
    end;
end;

function PXMIExporter13.AcquireSteretypeXMIElement(StereotypeName: string; RefXMIElement: PXMIElement): PXMIElement;
var
  XEP, XEO: PXMIElement;
  XE: PXMIElement;
  XA: PXMIAttribute;
  I: Integer;
begin
  Assert(RefXMIElement.TargetElement <> nil);
  if RefXMIElement.TargetElement.IsKindOf(UML_PACKAGE) then
    XEP := RefXMIElement
  else
    XEP := RefXMIElement.FindAncestorByUMLElementKind(UML_PACKAGE);
  Assert(XEP <> nil);
  XEO := AcquireXMIElement(XEP, NODE_UML_NAMESPACE_OWNED_ELEMENT, nil, False);
  for I := 0 to XEO.ChildCount - 1 do begin
    XE := XEO.Children[I];
    if XE.XMIElementName = NODE_UML_STEREOTYPE then begin
      XA := XE.FindXMIAttribute(ATTR_UML_NAME);
      Assert(XA <> nil);
      if (XA.ValueCount > 0) and (XA.Values[0] = StereotypeName) then begin
        Result := XE;
        Exit;
      end;
    end;
  end;
  // if not found
  XE := CreateXMIElementExt(NODE_UML_STEREOTYPE, nil, XEO);
  SetXMIAttributeValue(XE, ATTR_UML_NAME, StereotypeName);
  Result := XE;
end;

function PXMIExporter13.AcquireSteretypeXMIElement(AStereotype: IStereotype; RefXMIElement: PXMIElement): PXMIElement;
var
  XEP, XEO: PXMIElement;
  XE: PXMIElementExt;
  I: Integer;
begin
  Assert(RefXMIElement.TargetElement <> nil);
  if RefXMIElement.TargetElement.IsKindOf(UML_PACKAGE) then
    XEP := RefXMIElement
  else
    XEP := RefXMIElement.FindAncestorByUMLElementKind(UML_PACKAGE);
  Assert(XEP <> nil);
  XEO := AcquireXMIElement(XEP, NODE_UML_NAMESPACE_OWNED_ELEMENT, nil, False);
  // find XMIElementExt which additional object is AStereotype
  for I := 0 to XEO.ChildCount - 1 do begin
    if XEO.Children[I] is PXMIElementExt then begin
      XE := XEO.Children[I] as PXMIElementExt;
      if XE.AdditionalObj = AStereotype then begin
        Result := XE;
        Exit;
      end;
    end;
  end;
  // if not found
  XE := CreateXMIElementExt(NODE_UML_STEREOTYPE, nil, XEO);
  XE.AdditionalObj := AStereotype;
  SetXMIAttributeValue(XE, ATTR_UML_NAME, AStereotype.Name);
  Result := XE;
end;

procedure PXMIExporter13.SetXMIStereotype(RefXMIElement: PXMIElement);
var
  XE: PXMIElement;
  M: IExtensibleModel;
begin
  if RefXMIElement.TargetElement = nil then Exit;
  if RefXMIElement.TargetElement.QueryInterface(IExtensibleModel, M) = S_OK then begin
    if M.GetStereotype <> nil then begin
      XE := AcquireSteretypeXMIElement(M.GetStereotype, RefXMIElement);
      Assert(XE <> nil);
      AddXMIAttributeValue(XE, ATTR_UML_EXTENDED_ELEMENT, RefXMIElement.XMIId);
    end
    else if M.StereotypeName <> '' then begin
      XE := AcquireSteretypeXMIElement(M.StereotypeName, RefXMIElement);
      Assert(XE <> nil);
      AddXMIAttributeValue(XE, ATTR_UML_EXTENDED_ELEMENT, RefXMIElement.XMIId);
    end;
  end;
  // baseClass
end;

procedure PXMIExporter13.SetXMIStereotype(RefXMIElement: PXMIElement; StereotypeName: string);
var
  XE: PXMIElement;
begin
  Assert(StereotypeName <> '');
  XE := AcquireSteretypeXMIElement(StereotypeName, RefXMIElement);
  Assert(XE <> nil);
  AddXMIAttributeValue(XE, ATTR_UML_EXTENDED_ELEMENT, RefXMIElement.XMIId);
end;

procedure PXMIExporter13.SetXMIConstrains(RefXMIElement: PXMIElement);
var
  XE, XEP, XEO: PXMIElement;
  M: IExtensibleModel;
  C: IConstraint;
  I: Integer;
begin
  Assert(RefXMIElement.TargetElement <> nil);
  Assert(RefXMIElement.TargetElement.QueryInterface(IExtensibleModel, M) = S_OK);
  if RefXMIElement.TargetElement.IsKindOf(UML_PACKAGE) then
    XEP := RefXMIElement
  else
    XEP := RefXMIElement.FindAncestorByUMLElementKind(UML_PACKAGE);
  Assert(XEP <> nil);
  if M.GetConstraintCount > 0 then begin
    XEO := AcquireXMIElement(XEP, NODE_UML_NAMESPACE_OWNED_ELEMENT, nil, False);
    for I := 0 to M.GetConstraintCount - 1 do begin
      C := M.GetConstraintAt(I);
      XE := CreateXMIElement(NODE_UML_CONSTRAINT, nil, XEO);
      SetXMIAttributeValue(XE, ATTR_UML_NAME, C.Name);
      SetXMIAttributeValue(XE, ATTR_UML_VISIBILITY, XMI_VALUE_PUBLIC);
      SetXMIAttributeValue(XE, ATTR_UML_SPECIFICATION, XMI_VALUE_FALSE);
      SetXMIAttributeValue(XE, ATTR_UML_CONSTRAINED_ELEMENT, RefXMIElement.XMIId);
      ComposeXMIExpression2(XE, NODE_UML_CONSTRAINT_BODY, NODE_UML_BOOLEAN_EXPR, C.Body);
      AddXMIAttributeValue(RefXMIElement, ATTR_UML_CONSTRINT, XE.XMIId);
    end;
  end;
end;

procedure PXMIExporter13.SetXMITaggedValues(RefXMIElement: PXMIElement);
var
  XE: PXMIElementExt;
  M: IExtensibleModel;
  T: ITaggedValue;
  I, J: Integer;
begin
  Assert(RefXMIElement.TargetElement <> nil);
  Assert(RefXMIElement.TargetElement.QueryInterface(IExtensibleModel, M) = S_OK);
  for I := 0 to M.GetTaggedValueCount - 1 do begin
    T := M.GetTaggedValueAt(I);
    if T.GetTagDefinition <> nil then begin
      XE := CreateXMIElementExt(NODE_UML_TAGGED_VALUE, nil, nil);
      XE.AdditionalObj := T;
      SetXMIAttributeValue(XE, ATTR_UML_TAG, T.Name);
      if T.GetTagDefinition.TagType in [tkInteger, tkString, tkReal, tkEnumeration] then
        SetXMIAttributeValue(XE, ATTR_UML_VALUE, T.DataValue)
      else if T.GetTagDefinition.TagType = tkBoolean then
        SetXMIAttributeValue(XE, ATTR_UML_VALUE, LowerCase(T.DataValue))
      else if T.GetTagDefinition.TagType = tkReference then begin
        if T.GetReferenceValueCount > 0 then
          SetXMIAttributeValue(XE, ATTR_UML_VALUE, T.GetReferenceValueAt(0).GetGuid)
      end
      else if T.GetTagDefinition.TagType = tkCollection then begin
        for J := 0 to T.GetReferenceValueCount - 1 do
          AddXMIAttributeValue(XE, ATTR_UML_VALUE, T.GetReferenceValueAt(J).GetGuid);
      end;
      SetXMIAttributeValue(XE, ATTR_UML_MODEL_ELEMENT, RefXMIElement.XMIId);
    end;  
  end;
end;

procedure PXMIExporter13.SetXMITaggedValue(RefXMIElement: PXMIElement; TaggedValueName: string; Value: string);
var
  XE: PXMIElement;
begin
  XE := CreateXMIElement(NODE_UML_TAGGED_VALUE, nil, nil);
  SetXMIAttributeValue(XE, ATTR_UML_TAG, TaggedValueName);
  SetXMIAttributeValue(XE, ATTR_UML_VALUE, Value);
  SetXMIAttributeValue(XE, ATTR_UML_MODEL_ELEMENT, RefXMIElement.XMIId);
end;

procedure PXMIExporter13.PerformFirstPhase;
begin
  CurrentIndex := 0;
  ConstructXMIElement(StarUMLApp.GetProject, nil);
end;

procedure PXMIExporter13.PerformSecondPhase;
begin
  CurrentIndex := 0;
  VisitStarUMLModels(StarUMLApp.GetProject, FillOutXMIAttributes);
end;

procedure PXMIExporter13.BuildXMIElements;
begin
  StimulateProgressEvent(0, 100, TXT_PREPARE_EXPORT);
  ElementCount := GetExportingElementCount(StarUMLApp.GetProject);
  PerformFirstPhase;
  StimulateProgressEvent(100, 100, TXT_CREATE_XMI_ELEMENT);
  PerformSecondPhase;
  StimulateProgressEvent(100, 100, TXT_FILLOUT_XMI_ATTRIBUTE);
  StimulateProgressEvent(100, 100, TXT_EXPORT_SUCCEEDE);
end;

// PXMIExporter13
////////////////////////////////////////////////////////////////////////////////

end.
