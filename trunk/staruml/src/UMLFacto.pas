unit UMLFacto;

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
  Core, ViewCore, UMLModels, UMLViews,
  Types, Graphics, SysUtils;

const
  FA_PSEUDOSTATE_DECISION = 0;
  FA_PSEUDOSTATE_INITIALSTATE = 1;
  FA_PSEUDOSTATE_SYNCHRONIZATION = 2;
  FA_PSEUDOSTATE_JUNCTIONPOINT = 3;
  FA_PSEUDOSTATE_CHOICEPOINT = 4;
  FA_PSEUDOSTATE_DEEPHISTORY = 5;
  FA_PSEUDOSTATE_SHALLOWHISTORY = 6;

  FA_UNINTERPRETEDACTION_ENTRY = 0;
  FA_UNINTERPRETEDACTION_DO = 1;
  FA_UNINTERPRETEDACTION_EXIT = 2;

  FA_STIMULUS_CALLACTION = 0;
  FA_STIMULUS_SENDACTION = 1;
  FA_STIMULUS_RETURNACTION = 2;
  FA_STIMULUS_CREATEACTION = 3;
  FA_STIMULUS_DESTROYACTION = 4;
  FA_REVERSE_STIMULUS_CALLACTION = 5;
  FA_REVERSE_STIMULUS_SENDACTION = 6;
  FA_REVERSE_STIMULUS_RETURNACTION = 7;
  FA_REVERSE_STIMULUS_CREATEACTION = 8;
  FA_REVERSE_STIMULUS_DESTROYACTION = 9;

  FA_MESSAGE_CALLACTION = 0;
  FA_MESSAGE_SENDACTION = 1;
  FA_MESSAGE_RETURNACTION = 2;
  FA_MESSAGE_CREATEACTION = 3;
  FA_MESSAGE_DESTROYACTION = 4;
  FA_REVERSE_MESSAGE_CALLACTION = 5;
  FA_REVERSE_MESSAGE_SENDACTION = 6;
  FA_REVERSE_MESSAGE_RETURNACTION = 7;
  FA_REVERSE_MESSAGE_CREATEACTION = 8;
  FA_REVERSE_MESSAGE_DESTROYACTION = 9;

  FA_DIRECTED_ASSOCIATION = 1;
  FA_AGGREGATION = 2;
  FA_COMPOSITION = 3;

  FA_SWIMLANE_VERTICAL = 0;
  FA_SWIMLANE_HORIZONTAL = 1;

  EK_TEXT = 'Text';
  EK_NOTE = 'Note';
  EK_NOTELINK = 'NoteLink';
  EK_MODEL = 'Model';
  EK_SUBSYSTEM = 'Subsystem';
  EK_PACKAGE = 'Package';
  EK_CLASS = 'Class';
  EK_INTERFACE = 'Interface';
  EK_ENUMERATION = 'Enumeration';
  EK_SIGNAL = 'Signal';
  EK_EXCEPTION = 'Exception';
  EK_COMPONENT = 'Component';
  EK_COMPONENTINSTANCE = 'ComponentInstance';
  EK_NODE = 'Node';
  EK_NODEINSTANCE = 'NodeInstance';
  EK_ACTOR = 'Actor';
  EK_USECASE = 'UseCase';
  EK_STATEMACHINE = 'StateMachine';
  EK_ACTIVITYGRAPH = 'ActivityGraph';
  EK_COLLABORATION = 'Collaboration';
  EK_COLLABORATIONINSTANCESET = 'CollaborationInstanceSet';
  EK_INTERACTION = 'Interaction';
  EK_INTERACTIONINSTANCESET = 'InteractionInstanceSet';
  EK_COMPOSITESTATE = 'CompositeState';
  EK_STATE = 'State';
  EK_ACTIONSTATE = 'ActionState';
  EK_ACTIVITY = 'Activity';
  EK_SUBACTIVITYSTATE = 'SubactivityState';
  EK_PSEUDOSTATE = 'Pseudostate';
  EK_FINALSTATE = 'FinalState';
  EK_PARTITION = 'Partition';
  EK_SWIMLANE = 'Swimlane';
  EK_SUBMACHINESTATE = 'SubmachineState';
  EK_ATTRIBUTE = 'Attribute';
  EK_OPERATION = 'Operation';
  EK_PARAMETER = 'Parameter';
  EK_TEMPLATEPARAMETER = 'TemplateParameter';
  EK_ENUMERATIONLITERAL = 'EnumerationLiteral';
  EK_UNINTERPRETEDACTION = 'UninterpretedAction';
  EK_SIGNALEVENT = 'SignalEvent';
  EK_CALLEVENT = 'CallEvent';
  EK_TIMEEVENT = 'TimeEvent';
  EK_CHANGEEVENT = 'ChangeEvent';
  EK_CLASSIFIERROLE = 'ClassifierRole';
  EK_OBJECT = 'Object';
  EK_TRANSITION = 'Transition';
  EK_DEPENDENCY = 'Dependency';
  EK_ASSOCIATION = 'Association';
  EK_ASSOCIATIONCLASS = 'AssociationClass';
  EK_GENERALIZATION = 'Generalization';
  EK_LINK = 'Link';
  EK_ASSOCIATIONROLE = 'AssociationRole';
  EK_STIMULUS = 'Stimulus';
  EK_MESSAGE = 'Message';
  EK_INCLUDE = 'Include';
  EK_EXTEND = 'Extend';
  EK_REALIZATION = 'Realization';
  EK_OBJECTFLOWSTATE = 'ObjectFlowState';
  EK_FLOWFINALSTATE = 'FlowFinalState';
  EK_SYSTEMBOUNDARY = 'SystemBoundary';
  EK_SIGNALACCEPTSTATE = 'SignalAcceptState';
  EK_SIGNALSENDSTATE = 'SignalSendState';
  EK_ARTIFACT = 'Artifact';
  EK_ATTRIBUTELINK = 'AttributeLink';
  EK_PORT = 'Port';
  EK_PART = 'Part';
  EK_CONNECTOR = 'Connector';
  EK_COMBINEDFRAGMENT = 'CombinedFragment';
  EK_INTERACTIONOPERAND = 'InteractionOperand';
  EK_FRAME = 'Frame';
  EK_EXTENSIONPOINT = 'ExtensionPoint';
  EK_RECTANGLE = 'Rectangle';
  EK_ELLIPSE = 'Ellipse';
  EK_ROUNDRECT = 'RoundRect';
  EK_LINE = 'Line';
  EK_IMAGE = 'Image';

  VK_MODEL_VIEW = 'ModelView';
  VK_SUBSYSTEM_VIEW = 'SubsystemView';
  VK_PACKAGE_VIEW = 'PackageView';
  VK_CLASS_VIEW = 'ClassView';
  VK_INTERFACE_VIEW = 'InterfaceView';
  VK_ENUMERATION_VIEW = 'EnumerationView';
  VK_EXCEPTION_VIEW = 'ExceptionView';
  VK_SIGNAL_VIEW = 'SignalView';
  VK_COMPONENT_VIEW = 'ComponentView';
  VK_COMPONENTINSTANCE_VIEW = 'ComponentInstanceView';
  VK_NODE_VIEW = 'NodeView';
  VK_NODEINSTANCE_VIEW = 'NodeInstanceView';
  VK_ACTOR_VIEW = 'ActorView';
  VK_USECASE_VIEW = 'UseCaseView';
  VK_COLLABORATION_VIEW = 'CollaborationView';
  VK_COLLABORATIONINSTANCESET_VIEW = 'CollaborationInstanceSetView';
  VK_SUBACTIVITYSTATE_VIEW = 'SubactivityStateView';
  VK_ACTIONSTATE_VIEW = 'ActionStateView';
  VK_ACTIVITY_VIEW = 'ActivityView';
  VK_PSEUDOSTATE_VIEW = 'PseudostateView';
  VK_FINALSTATE_VIEW = 'FinalStateView';
  VK_SWIMLANE_VIEW = 'SwimlaneView';
  VK_PARTITION_VIEW = 'PartitionView';
  VK_SUBMACHINESTATE_VIEW = 'SubmachineStateView';
  VK_COMPOSITESTATE_VIEW = 'CompositeStateView';
  VK_STATE_VIEW = 'StateView';
  VK_CLASSIFIERROLE_VIEW = 'ClassifierRoleView';
  VK_OBJECT_VIEW = 'ObjectView';
  VK_TRANSITION_VIEW = 'TransitionView';
  VK_REALIZATION_VIEW = 'RealizationView';
  VK_DEPENDENCY_VIEW = 'DependencyView';
  VK_ASSOCIATIONROLE_VIEW = 'AssociationRoleView';
  VK_ASSOCIATION_VIEW = 'AssociationView';
  VK_ASSOCIATIONCLASS_VIEW = 'AssociationClassView';
  VK_GENERALIZATION_VIEW = 'GeneralizationView';
  VK_LINK_VIEW = 'LinkView';
  VK_STIMULUS_VIEW = 'StimulusView';
  VK_MESSAGE_VIEW = 'MessageView';
  VK_INCLUDE_VIEW = 'IncludeView';
  VK_EXTEND_VIEW = 'ExtendView';
  VK_NOTE_VIEW = 'NoteView';
  VK_NOTELINK_VIEW = 'NoteLinkView';
  VK_TEXT_VIEW = 'TextView';
  VK_OBJECTFLOWSTATE_VIEW = 'ObjectFlowStateView';
  VK_FLOWFINALSTATE_VIEW = 'FlowFinalStateView';
  VK_ARTIFACT_VIEW = 'ArtifactView';
  VK_PORT_VIEW = 'PortView';
  VK_PART_VIEW = 'PartView';
  VK_COMBINEDFRAGMENT_VIEW = 'CombinedFragmentView';
  VK_INTERACTIONOPERAND_VIEW = 'InteractionOperandView';
  VK_SYSTEMBOUNDARY_VIEW = 'SystemBoundaryView';
  VK_SIGNALACCEPTSTATE_VIEW = 'SignalAcceptStateView';
  VK_SIGNALSENDSTATE_VIEW = 'SignalSendStateView';
  VK_CONNECTOR_VIEW = 'ConnectorView';
  VK_FRAME_VIEW = 'FrameView';
  VK_RECTANGLE_VIEW = 'RectangleView';
  VK_ELLIPSE_VIEW = 'EllipseView';
  VK_ROUNDRECT_VIEW = 'RoundRectView';
  VK_LINE_VIEW = 'LineView';
  VK_IMAGE_VIEW = 'ImageView';

  DK_CLASS_DIAGRAM = 'ClassDiagram';
  DK_USECASE_DIAGRAM = 'UseCaseDiagram';
  DK_SEQUENCE_DIAGRAM = 'SequenceDiagram';
  DK_SEQUENCEROLE_DIAGRAM = 'SequenceRoleDiagram';
  DK_COLLABORATION_DIAGRAM = 'CollaborationDiagram';
  DK_COLLABORATIONROLE_DIAGRAM = 'CollaborationRoleDiagram';
  DK_STATECHART_DIAGRAM = 'StatechartDiagram';
  DK_ACTIVITY_DIAGRAM = 'ActivityDiagram';
  DK_COMPONENT_DIAGRAM = 'ComponentDiagram';
  DK_DEPLOYMENT_DIAGRAM = 'DeploymentDiagram';
  DK_COMPOSITESTRUCTURE_DIAGRAM = 'CompositeStructureDiagram';

type
  // Exceptions
  EUMLFactoryError = class(Exception);
  EUMLFactoryParamError = class(EUMLFactoryError);
  EUMLFactoryLinkError = class(EUMLFactoryError);
  EUMLFactoryCreateError = class(EUMLFactoryError);

  // PUMLFactory
  PUMLFactory = class
  private
    procedure AssignNewName(Model: PModel; BaseName: string);
    procedure CheckParamError(Expr: Boolean);
    procedure CheckLinkError(Expr: Boolean);
    procedure CheckCreateError(Expr: Boolean; ErrorMessage: string);
  public
    function CreateModel(Owner: PModel; ModelKind: string; NamePrefix: string; Argument: Integer = 0;
      End1: PModel = nil; End2: PModel = nil; InsertIndex: Integer = -1; AuxArg: PModel = nil): PModel; overload;
    function CreateModel(Owner: PModel; ModelKind: string; Argument: Integer = 0;
      End1: PModel = nil; End2: PModel = nil; InsertIndex: Integer = -1; AuxArg: PModel = nil): PModel; overload;
    function CreateView(DiagramView: PDiagramView; Model: PModel;
      ViewKind: string = ''; End1: PView = nil; End2: PView = nil;
      X1: Integer = 0; Y1: Integer = 0; X2: Integer = 0; Y2: Integer = 0;
      Argument: Integer = 0): PView; overload;
    function CreateView(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
      Model: PModel; ViewKind: string = ''; Argument: Integer = 0): PView; overload;
    function CreateDiagram(Owner: PModel; DiagramKind: string; NamePrefix: string;
      var CreatedModel: PModel): PDiagram; overload;
    function CreateDiagram(Owner: PModel; DiagramKind: string;
      var CreatedModel: PModel): PDiagram; overload;
    function CreateElement(DiagramView: PDiagramView; ElementKind: string;
      Argument: Integer = 0; End1: PView = nil; End2: PView = nil): PView; overload;
    function CreateElement(DiagramView: PDiagramView; ElementKind: string;
      NamePrefix: string; Argument: Integer = 0; End1: PView = nil; End2: PView = nil): PView; overload;
    function CreateElement(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
      ElementKind: string; Argument: Integer = 0): PView; overload;
    function CreateElement(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
      ElementKind: string; NamePrefix: string; Argument: Integer = 0): PView; overload;
  end;

var
  // Option Variables
  OptionDefaultAttrVisibility: PUMLVisibilityKind;
  OptionDefaultOperVisibility: PUMLVisibilityKind;
  OptionDefaultFillColor: TColor;
  OptionDefaultLineColor: TColor;
  OptionDefaultFontFace: string;
  OptionDefaultFontSize: Integer;
  OptionDefaultFontColor: TColor;
  OptionLineStyle: PLineStyleKind;
  OptionStereotypeDisplay: PUMLStereotypeDisplayKind;
  OptionShowParentName: Boolean;
  OptionAutoResize: Boolean;
  OptionShowCompartmentVisibility: Boolean;
  OptionShowCompartmentStereotype: Boolean;
  OptionShowOperationSignature: Boolean;
  OptionShowProperty: Boolean;
  OptionSuppressAttributes: Boolean;
  OptionSuppressOperations: Boolean;
  OptionEnumerationSuppressLiterals: Boolean;
  OptionActorStereotypeDisplay: PUMLStereotypeDisplayKind;
  OptionActorSuppressAttributes: Boolean;
  OptionActorSuppressOperations: Boolean;
  OptionUseCaseStereotypeDisplay: PUMLStereotypeDisplayKind;
  OptionUseCaseSuppressAttributes: Boolean;
  OptionUseCaseSuppressOperations: Boolean;
  OptionInterfaceStereotypeDisplay: PUMLStereotypeDisplayKind;
  OptionInterfaceSuppressAttributes: Boolean;
  OptionInterfaceSuppressOperations: Boolean;
  OptionArtifactStereotypeDisplay: PUMLStereotypeDisplayKind;
  OptionArtifactSuppressAttributes: Boolean;
  OptionArtifactSuppressOperations: Boolean;
  OptionComponentStereotypeDisplay: PUMLStereotypeDisplayKind;
  OptionNodeStereotypeDisplay: PUMLStereotypeDisplayKind;
  OptionShowSequenceNumber: Boolean;
  OptionMessageSignature: PUMLMessageSignatureKind;
  OptionShowActivation: Boolean;
  OptionWordWrapByDefault: Boolean;

  // UMLFactory Instance
  UMLFactory: PUMLFactory;

implementation

uses
  BasicClasses, GraphicClasses, NLS_StarUML, ContributorMgr,
  Math, StarUMLApp;

////////////////////////////////////////////////////////////////////////////////
// PUMLFactory

// -----------------------------------------------------------------------------
// auto naming to model element
// -----------------------------------------------------------------------------
procedure PUMLFactory.AssignNewName(Model: PModel; BaseName: string);

  function ExistModelName(OwnedModel: PModel; Name: string): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 0 to OwnedModel.VirtualOwnedModelCount - 1 do
      if OwnedModel.VirtualOwnedModel[I].Name = Name then begin
        Result := True;
        Exit;
      end;
  end;

var
  NewName: string;
  Prefix: string;
  I: Integer;
begin
  if Model.VirtualNamespace <> nil then begin
    Prefix := ContributorManager.IssueElementNamePrefix(Model, BaseName);
    if Prefix <> BaseName then begin
      NewName := Prefix;
      if not ExistModelName(Model.VirtualNamespace, NewName) then begin
        Model.Name := Prefix;
        Exit;
      end;
    end;
    I := 0;
    repeat
      I := I + 1;
      NewName := Prefix + IntToStr(I);
    until not ExistModelName(Model.VirtualNamespace, NewName);
    Model.Name := NewName;
  end
  else begin
    Model.Name := BaseName + '1';
  end;
end;

// -----------------------------------------------------------------------------
// check error, if any, occur Exception
// -----------------------------------------------------------------------------
procedure PUMLFactory.CheckParamError(Expr: Boolean);
begin
  if not Expr then
    raise EUMLFactoryParamError.Create(ERR_FACTORY_PARAM);
end;

procedure PUMLFactory.CheckLinkError(Expr: Boolean);
begin
  if not Expr then
    raise EUMLFactoryLinkError.Create(ERR_FACTORY_LINK);
end;

procedure PUMLFactory.CheckCreateError(Expr: Boolean; ErrorMessage: string);
begin
  if not Expr then
    raise EUMLFactoryCreateError.Create(ErrorMessage);
end;

function PUMLFactory.CreateModel(Owner: PModel; ModelKind: string; Argument: Integer = 0;
  End1: PModel = nil; End2: PModel = nil; InsertIndex: Integer = -1; AuxArg: PModel = nil): PModel;
begin
  Result := CreateModel(Owner, ModelKind, ModelKind, Argument, End1, End2, InsertIndex, AuxArg);
end;

// -----------------------------------------------------------------------------
// Model Element Creation function
// --------------------------------
// - Owner:       element which contains element to be going to be creatd
// - ModelKind:   kind(or type) name of model to be going to be created
// - NamePrefix:  name prefix of model to be going to be created
// - Argument:    additional arguments to create model element
// - End1, End2:  in case of creating element to connect two models, they mean two models
// - InsertIndex: insertion position in model element containing element to be created
//                (if value is -1, add to last)
// -----------------------------------------------------------------------------
function PUMLFactory.CreateModel(Owner: PModel; ModelKind: string;
  NamePrefix: string; Argument: Integer = 0; End1: PModel = nil;
  End2: PModel = nil; InsertIndex: Integer = -1; AuxArg: PModel = nil): PModel;
var
  M: PModel;

  procedure InsertToOwner(OwnerModel, OwnedModel: PModel; Relation: string;
    Index: Integer);
  begin
    if Index < 0 then
      OwnerModel.MOF_AddCollectionItem(Relation, OwnedModel)
    else
      OwnerModel.MOF_InsertCollectionItem(Relation, Index, OwnedModel);
  end;

begin
  // Model
  if ModelKind = EK_MODEL then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLModel') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Subsystem
  else if ModelKind = EK_SUBSYSTEM then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLSubsystem') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Package
  else if ModelKind = EK_PACKAGE then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLPackage') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Class
  else if ModelKind = EK_CLASS then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLClass') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Interface
  else if ModelKind = EK_INTERFACE then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLInterface') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Enumeration
  else if ModelKind = EK_ENUMERATION then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLEnumeration') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Signal
  else if ModelKind = EK_SIGNAL then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLSignal') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Exception
  else if ModelKind = EK_EXCEPTION then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLException') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Component
  else if ModelKind = EK_COMPONENT then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLComponent') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // ComponentInstance
  else if ModelKind = EK_COMPONENTINSTANCE then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLComponentInstance') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Node
  else if ModelKind = EK_NODE then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLNode') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // NodeInstance
  else if ModelKind = EK_NODEINSTANCE then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLNodeInstance') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Actor
  else if ModelKind = EK_ACTOR then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLActor') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // UseCase
  else if ModelKind = EK_USECASE then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLUseCase') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // StateMachine
  else if ModelKind = EK_STATEMACHINE then begin
    CheckParamError(Owner is PUMLModelElement);
    M := MetaModel.CreateInstance('UMLStateMachine') as PModel;
    (M as PUMLStateMachine).Top := MetaModel.CreateInstance('UMLCompositeState') as PUMLCompositeState;
    (M as PUMLStateMachine).Top.Name := 'TOP';
    InsertToOwner(Owner, M, 'Behaviors', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // ActivityGraph
  else if ModelKind = EK_ACTIVITYGRAPH then begin
    CheckParamError(Owner is PUMLModelElement);
    M := MetaModel.CreateInstance('UMLActivityGraph') as PModel;
    (M as PUMLActivityGraph).Top := MetaModel.CreateInstance('UMLCompositeState') as PUMLCompositeState;
    (M as PUMLActivityGraph).Top.Name := 'TOP';
    InsertToOwner(Owner, M, 'Behaviors', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Collaboration
  else if ModelKind = EK_COLLABORATION then begin
    CheckParamError((Owner is PUMLClassifier) or (Owner is PUMLOperation));
    M := MetaModel.CreateInstance('UMLCollaboration') as PModel;
    InsertToOwner(Owner, M, 'OwnedCollaborations', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // CollaborationInstanceSet
  else if ModelKind = EK_COLLABORATIONINSTANCESET then begin
    CheckParamError((Owner is PUMLClassifier) or (Owner is PUMLOperation));
    M := MetaModel.CreateInstance('UMLCollaborationInstanceSet') as PModel;
    InsertToOwner(Owner, M, 'OwnedCollaborationInstanceSets', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Interaction
  else if ModelKind = EK_INTERACTION then begin
    CheckParamError(Owner is PUMLCollaboration);
    M := MetaModel.CreateInstance('UMLInteraction') as PModel;
    InsertToOwner(Owner, M, 'Interactions', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // InteractionInstanceSet
  else if ModelKind = EK_INTERACTIONINSTANCESET then begin
    CheckParamError(Owner is PUMLCollaborationInstanceSet);
    M := MetaModel.CreateInstance('UMLInteractionInstanceSet') as PModel;
    InsertToOwner(Owner, M, 'InteractionInstanceSets', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // CompositeState, State
  else if (ModelKind = EK_COMPOSITESTATE) or (ModelKind = EK_STATE) then begin
    CheckParamError((Owner is PUMLCompositeState) or (Owner is PUMLStateMachine));
    M := MetaModel.CreateInstance('UMLCompositeState') as PModel;
    if Owner is PUMLCompositeState then
      InsertToOwner(Owner, M, 'Subvertices', InsertIndex)
    else if Owner is PUMLStateMachine then
      InsertToOwner((Owner as PUMLStateMachine).Top, M, 'Subvertices', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // ActionState, Activity
  else if (ModelKind = EK_ACTIONSTATE) or (ModelKind = EK_ACTIVITY) then begin
    CheckParamError((Owner is PUMLCompositeState) or (Owner is PUMLStateMachine));
    M := MetaModel.CreateInstance('UMLActionState') as PModel;
    if Owner is PUMLCompositeState then
      InsertToOwner(Owner, M, 'Subvertices', InsertIndex)
    else if Owner is PUMLStateMachine then
      InsertToOwner((Owner as PUMLStateMachine).Top, M, 'Subvertices', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // SubactivityState
  else if ModelKind = EK_SUBACTIVITYSTATE then begin
    CheckParamError((Owner is PUMLCompositeState) or (Owner is PUMLStateMachine));
    M := MetaModel.CreateInstance('UMLSubactivityState') as PModel;
    if Owner is PUMLCompositeState then
      InsertToOwner(Owner, M, 'Subvertices', InsertIndex)
    else if Owner is PUMLStateMachine then
      InsertToOwner((Owner as PUMLStateMachine).Top, M, 'Subvertices', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Pseudostate
  else if ModelKind = EK_PSEUDOSTATE then begin
    CheckParamError((Owner is PUMLCompositeState) or (Owner is PUMLStateMachine));
    M := MetaModel.CreateInstance('UMLPseudostate') as PModel;
    case Argument of
      FA_PSEUDOSTATE_DECISION:        (M as PUMLPseudostate).PseudostateKind := pkDecision;
      FA_PSEUDOSTATE_INITIALSTATE:    (M as PUMLPseudostate).PseudostateKind := pkInitial;
      FA_PSEUDOSTATE_SYNCHRONIZATION: (M as PUMLPseudostate).PseudostateKind := pkSynchronization;
      FA_PSEUDOSTATE_JUNCTIONPOINT:   (M as PUMLPseudostate).PseudostateKind := pkJunction;
      FA_PSEUDOSTATE_CHOICEPOINT:     (M as PUMLPseudostate).PseudostateKind := pkChoice;
      FA_PSEUDOSTATE_DEEPHISTORY:     (M as PUMLPseudostate).PseudostateKind := pkDeepHistory;
      FA_PSEUDOSTATE_SHALLOWHISTORY:  (M as PUMLPseudostate).PseudostateKind := pkShallowHistory;
    end;
    if Owner is PUMLCompositeState then
      InsertToOwner(Owner, M, 'Subvertices', InsertIndex)
    else if Owner is PUMLStateMachine then
      InsertToOwner((Owner as PUMLStateMachine).Top, M, 'Subvertices', InsertIndex);
    case Argument of
      FA_PSEUDOSTATE_DECISION:        AssignNewName(M, 'Decision');
      FA_PSEUDOSTATE_INITIALSTATE:    AssignNewName(M, 'Initial');
      FA_PSEUDOSTATE_SYNCHRONIZATION: AssignNewName(M, 'Synchronization');
      FA_PSEUDOSTATE_JUNCTIONPOINT:   AssignNewName(M, 'Junction');
      FA_PSEUDOSTATE_CHOICEPOINT:     AssignNewName(M, 'Choice');
      FA_PSEUDOSTATE_DEEPHISTORY:     AssignNewName(M, 'DeepHistory');
      FA_PSEUDOSTATE_SHALLOWHISTORY:  AssignNewName(M, 'ShallowHistory');
    end;
  end
  // FinalState
  else if ModelKind = EK_FINALSTATE then begin
    CheckParamError((Owner is PUMLCompositeState) or (Owner is PUMLStateMachine));
    M := MetaModel.CreateInstance('UMLFinalState') as PModel;
    if Owner is PUMLCompositeState then
      InsertToOwner(Owner, M, 'Subvertices', InsertIndex)
    else if Owner is PUMLStateMachine then
      InsertToOwner((Owner as PUMLStateMachine).Top, M, 'Subvertices', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Partition, Swimlane
  else if (ModelKind = EK_PARTITION) or (ModelKind = EK_SWIMLANE) then begin
    CheckParamError(Owner is PUMLActivityGraph);
    M := MetaModel.CreateInstance('UMLPartition') as PModel;
    InsertToOwner(Owner, M, 'Partitions', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // SubmachineState
  else if ModelKind = EK_SUBMACHINESTATE then begin
    CheckParamError((Owner is PUMLCompositeState) or (Owner is PUMLStateMachine));
    M := MetaModel.CreateInstance('UMLSubmachineState') as PModel;
    if Owner is PUMLCompositeState then
      InsertToOwner(Owner, M, 'Subvertices', InsertIndex)
    else if Owner is PUMLStateMachine then
      InsertToOwner((Owner as PUMLStateMachine).Top, M, 'Subvertices', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Attribute
  else if ModelKind = EK_ATTRIBUTE then begin
    CheckParamError((Owner is PUMLClassifier) or (Owner is PUMLAssociationEnd));
    M := MetaModel.CreateInstance('UMLAttribute') as PModel;
    if Owner is PUMLClassifier then begin
      InsertToOwner(Owner, M, 'Attributes', InsertIndex);
      AssignNewName(M, NamePrefix);
    end
    else if Owner is PUMLAssociationEnd then begin
      InsertToOwner(Owner, M, 'Qualifiers', InsertIndex);
      AssignNewName(M, 'Qualifier');
    end;
  end
  // Operation
  else if ModelKind = EK_OPERATION then begin
    CheckParamError(Owner is PUMLClassifier);
    M := MetaModel.CreateInstance('UMLOperation') as PModel;
    InsertToOwner(Owner, M, 'Operations', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Parameter
  else if ModelKind = EK_PARAMETER then begin
    CheckParamError(Owner is PUMLBehavioralFeature);
    M := MetaModel.CreateInstance('UMLParameter') as PModel;
    InsertToOwner(Owner, M, 'Parameters', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // TemplateParameter
  else if ModelKind = EK_TEMPLATEPARAMETER then begin
    CheckParamError((Owner is PUMLClass) or (Owner is PUMLCollaboration));
    M := MetaModel.CreateInstance('UMLTemplateParameter') as PModel;
    InsertToOwner(Owner, M, 'TemplateParameters', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // EnumerationLiteral
  else if ModelKind = EK_ENUMERATIONLITERAL then begin
    CheckParamError(Owner is PUMLEnumeration);
    M := MetaModel.CreateInstance('UMLEnumerationLiteral') as PModel;
    InsertToOwner(Owner, M, 'Literals', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // UninterpretedAction
  else if ModelKind = EK_UNINTERPRETEDACTION then begin
    CheckParamError((Owner is PUMLStateVertex) or (Owner is PUMLTransition));
    M := MetaModel.CreateInstance('UMLUninterpretedAction') as PModel;
    if Owner is PUMLStateVertex then begin
      case Argument of
        FA_UNINTERPRETEDACTION_ENTRY: begin
          InsertToOwner(Owner, M, 'EntryActions', InsertIndex);
          AssignNewName(M, 'EntryAction');
        end;
        FA_UNINTERPRETEDACTION_DO: begin
          InsertToOwner(Owner, M, 'DoActivities', InsertIndex);
          AssignNewName(M, 'DoAction');
        end;
        FA_UNINTERPRETEDACTION_EXIT: begin
          InsertToOwner(Owner, M, 'ExitActions', InsertIndex);
          AssignNewName(M, 'ExitAction');
        end;
      end;
    end
    else if Owner is PUMLTransition then begin
      InsertToOwner(Owner, M, 'Effects', InsertIndex);
      AssignNewName(M, 'Effect');
    end;
  end
  // SignalEvent
  else if ModelKind = EK_SIGNALEVENT then begin
    CheckParamError(Owner is PUMLTransition);
    M := MetaModel.CreateInstance('UMLSignalEvent') as PModel;
    InsertToOwner(Owner, M, 'Triggers', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // CallEvent
  else if ModelKind = EK_CALLEVENT then begin
    CheckParamError(Owner is PUMLTransition);
    M := MetaModel.CreateInstance('UMLCallEvent') as PModel;
    InsertToOwner(Owner, M, 'Triggers', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // TimeEvent
  else if ModelKind = EK_TIMEEVENT then begin
    CheckParamError(Owner is PUMLTransition);
    M := MetaModel.CreateInstance('UMLTimeEvent') as PModel;
    InsertToOwner(Owner, M, 'Triggers', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // ChangeEvent
  else if ModelKind = EK_CHANGEEVENT then begin
    CheckParamError(Owner is PUMLTransition);
    M := MetaModel.CreateInstance('UMLChangeEvent') as PModel;
    InsertToOwner(Owner, M, 'Triggers', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // ClassifierRole
  else if ModelKind = EK_CLASSIFIERROLE then begin
    CheckParamError((Owner is PUMLCollaboration) or (Owner is PUMLInteraction));
    M := MetaModel.CreateInstance('UMLClassifierRole') as PModel;
    if Owner is PUMLCollaboration then
      InsertToOwner(Owner, M, 'OwnedElements', InsertIndex)
    else if Owner is PUMLInteraction then
      InsertToOwner((Owner as PUMLInteraction).Context, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // Object
  else if ModelKind = EK_OBJECT then begin
    CheckParamError((Owner is PUMLNamespace) or (Owner is PUMLCollaborationInstanceSet)
      or (Owner is PUMLInteractionInstanceSet));
    M := MetaModel.CreateInstance('UMLObject') as PModel;
    if Owner is PUMLNamespace then
      InsertToOwner(Owner, M, 'OwnedElements', InsertIndex)
    else if Owner is PUMLCollaborationInstanceSet then
      InsertToOwner(Owner, M, 'ParticipatingInstances', InsertIndex)
    else if Owner is PUMLInteractionInstanceSet then
      InsertToOwner((Owner as PUMLInteractionInstanceSet).Context, M, 'ParticipatingInstances', InsertIndex);
    AssignNewName(M, NamePrefix);
  end
  // ObjectFlowState
  else if ModelKind = EK_OBJECTFLOWSTATE then begin
    CheckParamError((Owner is PUMLCompositeState) or (Owner is PUMLStateMachine));
    M := MetaModel.CreateInstance('UMLObjectFlowState') as PModel;
    if Owner is PUMLCompositeState then
      InsertToOwner(Owner, M, 'Subvertices', InsertIndex)
    else if Owner is PUMLStateMachine then
      InsertToOwner((Owner as PUMLStateMachine).Top, M, 'Subvertices', InsertIndex);
    AssignNewName(M, ModelKind);
  end
  // FlowFinalState
  else if ModelKind = EK_FLOWFINALSTATE then begin
    CheckParamError((Owner is PUMLCompositeState) or (Owner is PUMLStateMachine));
    M := MetaModel.CreateInstance('UMLFlowFinalState') as PModel;
    if Owner is PUMLCompositeState then
      InsertToOwner(Owner, M, 'Subvertices', InsertIndex)
    else if Owner is PUMLStateMachine then
      InsertToOwner((Owner as PUMLStateMachine).Top, M, 'Subvertices', InsertIndex);
    AssignNewName(M, ModelKind);
  end
  // SignalAcceptState
  else if ModelKind = EK_SIGNALACCEPTSTATE then begin
    CheckParamError((Owner is PUMLCompositeState) or (Owner is PUMLStateMachine));
    M := MetaModel.CreateInstance('UMLSignalAcceptState') as PModel;
    if Owner is PUMLCompositeState then
      InsertToOwner(Owner, M, 'Subvertices', InsertIndex)
    else if Owner is PUMLStateMachine then
      InsertToOwner((Owner as PUMLStateMachine).Top, M, 'Subvertices', InsertIndex);
    AssignNewName(M, ModelKind);
  end
  // SignalSendState
  else if ModelKind = EK_SIGNALSENDSTATE then begin
    CheckParamError((Owner is PUMLCompositeState) or (Owner is PUMLStateMachine));
    M := MetaModel.CreateInstance('UMLSignalSendState') as PModel;
    if Owner is PUMLCompositeState then
      InsertToOwner(Owner, M, 'Subvertices', InsertIndex)
    else if Owner is PUMLStateMachine then
      InsertToOwner((Owner as PUMLStateMachine).Top, M, 'Subvertices', InsertIndex);
    AssignNewName(M, ModelKind);
  end
  // Artifact
  else if ModelKind = EK_ARTIFACT then begin
    CheckParamError(Owner is PUMLNamespace);
    M := MetaModel.CreateInstance('UMLArtifact') as PModel;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
    AssignNewName(M, ModelKind);
  end
  // AttributeLink
  else if ModelKind = EK_ATTRIBUTELINK then begin
    CheckParamError(Owner is PUMLInstance);
    M := MetaModel.CreateInstance('UMLAttributeLink') as PModel;
    InsertToOwner(Owner, M, 'Slots', InsertIndex);
    AssignNewName(M, ModelKind);
  end
  // Port
  else if ModelKind = EK_PORT then begin
    CheckParamError(Owner is PUMLClassifier);
    M := MetaModel.CreateInstance('UMLPort') as PModel;
    InsertToOwner(Owner, M, 'OwnedPorts', InsertIndex);
    AssignNewName(M, ModelKind);
  end
  // CombinedFragment
  else if ModelKind = EK_COMBINEDFRAGMENT then begin
    CheckParamError((Owner is PUMLInteraction) or (Owner is PUMLInteractionInstanceSet)
      or (Owner is PUMLInteractionOperand));
    M := MetaModel.CreateInstance('UMLCombinedFragment') as PModel;
    InsertToOwner(Owner, M, 'Fragments', InsertIndex);
    AssignNewName(M, ModelKind);
  end
  // InteractionOperand
  else if ModelKind = EK_INTERACTIONOPERAND then begin
    CheckParamError(Owner is PUMLCombinedFragment);
    M := MetaModel.CreateInstance('UMLInteractionOperand') as PModel;
    InsertToOwner(Owner, M, 'Operands', InsertIndex);
    AssignNewName(M, ModelKind);
  end
  // ExtensionPoint
  else if ModelKind = EK_EXTENSIONPOINT then begin
    CheckParamError(Owner is PUMLUseCase);
    M := MetaModel.CreateInstance('UMLExtensionPoint') as PModel;
    InsertToOwner(Owner, M, 'ExtensionPoints', InsertIndex);
    AssignNewName(M, ModelKind);
  end
  // Frame
  else if ModelKind = EK_FRAME then begin
    CheckParamError((Owner is PUMLInteraction) or (Owner is PUMLInteractionInstanceSet));
    M := MetaModel.CreateInstance('UMLFrame') as PModel;
    InsertToOwner(Owner, M, 'OwnedFrames', InsertIndex);
    AssignNewName(M, ModelKind);
    if (Owner is PUMLInteraction) or (Owner is PUMLInteractionInstanceSet) then
      M.MOF_SetAttribute('FrameKind', 'sd');
  end
  // Transition
  else if ModelKind = EK_TRANSITION then begin
    CheckParamError(Owner is PUMLStateMachine);
    CheckLinkError((End1 is PUMLStateVertex) and (End2 is PUMLStateVertex));
    M := MetaModel.CreateInstance('UMLTransition') as PModel;
    (M as PUMLTransition).Source := End1 as PUMLStateVertex;
    (M as PUMLTransition).Target := End2 as PUMLStatevertex;
    InsertToOwner(Owner, M, 'Transitions', InsertIndex);
  end
  // Dependency
  else if ModelKind = EK_DEPENDENCY then begin
    CheckParamError(Owner is PUMLNamespace);
    CheckLinkError((End1 is PUMLModelElement) and (End2 is PUMLModelElement));
    M := MetaModel.CreateInstance('UMLDependency') as PModel;
    (M as PUMLDependency).Client := End1 as PUMLModelElement;
    (M as PUMLDependency).Supplier := End2 as PUMLModelElement;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
  end
  // Association
  else if ModelKind = EK_ASSOCIATION then begin
    CheckParamError(Owner is PUMLNamespace);
    CheckLinkError((End1 is PUMLClassifier) and (End2 is PUMLClassifier));
    M := MetaModel.CreateInstance('UMLAssociation') as PModel;
    (M as PUMLAssociation).AddConnection(MetaModel.CreateInstance('UMLAssociationEnd') as PUMLAssociationEnd);
    (M as PUMLAssociation).AddConnection(MetaModel.CreateInstance('UMLAssociationEnd') as PUMLAssociationEnd);
    (M as PUMLAssociation).Connections[0].Participant := End1 as PUMLClassifier;
    (M as PUMLAssociation).Connections[1].Participant := End2 as PUMLClassifier;
    case Argument of
      FA_DIRECTED_ASSOCIATION: begin
        (M as PUMLAssociation).Connections[0].IsNavigable := False;
        (M as PUMLAssociation).Connections[1].IsNavigable := True;
      end;
      FA_AGGREGATION: begin
        (M as PUMLAssociation).Connections[0].IsNavigable := True;
        (M as PUMLAssociation).Connections[1].IsNavigable := True;
        (M as PUMLAssociation).Connections[1].Aggregation := akAggregate;
      end;
      FA_COMPOSITION: begin
        (M as PUMLAssociation).Connections[0].IsNavigable := True;
        (M as PUMLAssociation).Connections[1].IsNavigable := True;
        (M as PUMLAssociation).Connections[1].Aggregation := akComposite;
      end;
    else
      (M as PUMLAssociation).Connections[0].IsNavigable := True;
      (M as PUMLAssociation).Connections[1].IsNavigable := True;
    end;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
  end
  // AssociationClass
  else if ModelKind = EK_ASSOCIATIONCLASS then begin
    CheckParamError(Owner is PUMLNamespace);
    CheckLinkError(((End1 is PUMLAssociation) and (End2 is PUMLClass)) or
                   ((End1 is PUMLClass) and (End2 is PUMLAssociation)));
    if (End1 is PUMLAssociation) and (End2 is PUMLClass) then
    begin
      CheckCreateError((End1 as PUMLAssociation).AssociationClass = nil, ERR_FACTORY_ASSOCIATIONCLASS);
      CheckCreateError((End2 as PUMLClass).AssociationClass = nil, ERR_FACTORY_ASSOCIATIONCLASS);
    end
    else begin
      CheckCreateError((End1 as PUMLClass).AssociationClass = nil, ERR_FACTORY_ASSOCIATIONCLASS);
      CheckCreateError((End2 as PUMLAssociation).AssociationClass = nil, ERR_FACTORY_ASSOCIATIONCLASS);
    end;
    M := MetaModel.CreateInstance('UMLAssociationClass') as PModel;
    if (End1 is PUMLAssociation) then begin
      (M as PUMLAssociationClass).AssociationSide := End1 as PUMLAssociation;
      (M as PUMLAssociationClass).ClassSide := End2 as PUMLClass;
    end
    else begin
      (M as PUMLAssociationClass).AssociationSide := End2 as PUMLAssociation;
      (M as PUMLAssociationClass).ClassSide := End1 as PUMLClass;
    end;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
  end
  // Generalization
  else if ModelKind = EK_GENERALIZATION then begin
    CheckParamError(Owner is PUMLNamespace);
    CheckLinkError((End1 is PUMLGeneralizableElement) and (End2 is PUMLGeneralizableElement));
    M := MetaModel.CreateInstance('UMLGeneralization') as PModel;
    (M as PUMLGeneralization).Child := End1 as PUMLGeneralizableElement;
    (M as PUMLGeneralization).Parent := End2 as PUMLGeneralizableElement;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
  end
  // Link
  else if ModelKind = EK_LINK then begin
    CheckParamError((Owner is PUMLCollaborationInstanceSet)
      or (Owner is PUMLInteractionInstanceSet)
      or (Owner is PUMLNamespace));
    CheckLinkError((End1 is PUMLInstance) and (End2 is PUMLInstance));
    M := MetaModel.CreateInstance('UMLLink') as PModel;
    (M as PUMLLink).AddConnection(MetaModel.CreateInstance('UMLLinkEnd') as PUMLLinkEnd);
    (M as PUMLLink).AddConnection(MetaModel.CreateInstance('UMLLinkEnd') as PUMLLinkEnd);
    (M as PUMLLink).Connections[0].Instance := End1 as PUMLInstance;
    (M as PUMLLink).Connections[1].Instance := End2 as PUMLInstance;
    if Owner is PUMLCollaborationInstanceSet then
      InsertToOwner(Owner, M, 'ParticipatingLinks', InsertIndex)
    else if Owner is PUMLInteractionInstanceSet then
      InsertToOwner((Owner as PUMLInteractionInstanceSet).Context, M, 'ParticipatingLinks', InsertIndex)
    else if Owner is PUMLNamespace then
      InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
  end
  // AssociationRole
  else if ModelKind = EK_ASSOCIATIONROLE then begin
    CheckParamError((Owner is PUMLCollaboration) or (Owner is PUMLInteraction));
    CheckLinkError((End1 is PUMLClassifierRole) and (End2 is PUMLClassifierRole));
    M := MetaModel.CreateInstance('UMLAssociationRole') as PModel;
    (M as PUMLAssociationRole).AddConnection(MetaModel.CreateInstance('UMLAssociationEndRole') as PUMLAssociationEndRole);
    (M as PUMLAssociationRole).AddConnection(MetaModel.CreateInstance('UMLAssociationEndRole') as PUMLAssociationEndRole);
    (M as PUMLAssociationRole).Connections[0].Participant := End1 as PUMLClassifierRole;
    (M as PUMLAssociationRole).Connections[0].IsNavigable := True;
    (M as PUMLAssociationRole).Connections[1].Participant := End2 as PUMLClassifierRole;
    (M as PUMLAssociationRole).Connections[1].IsNavigable := True;
    if Owner is PUMLCollaboration then
      InsertToOwner(Owner, M, 'OwnedElements', InsertIndex)
    else if Owner is PUMLInteraction then
      InsertToOwner((Owner as PUMLInteraction).Context, M, 'OwnedElements', InsertIndex);
  end
  // Stimulus
  else if ModelKind = EK_STIMULUS then begin
    CheckParamError(Owner is PUMLInteractionInstanceSet);
    CheckParamError((AuxArg = nil) or (AuxArg is PUMLLink));
    CheckLinkError((End1 is PUMLInstance) and (End2 is PUMLInstance));
    M := MetaModel.CreateInstance('UMLStimulus') as PModel;
    case Argument of
      FA_STIMULUS_CALLACTION: begin
        (M as PUMLStimulus).Action := MetaModel.CreateInstance('UMLCallAction') as PUMLAction;
        (M as PUMLStimulus).Sender := End1 as PUMLInstance;
        (M as PUMLStimulus).Receiver := End2 as PUMLInstance;
      end;
      FA_STIMULUS_SENDACTION: begin
        (M as PUMLStimulus).Action := MetaModel.CreateInstance('UMLSendAction') as PUMLAction;
        (M as PUMLStimulus).Sender := End1 as PUMLInstance;
        (M as PUMLStimulus).Receiver := End2 as PUMLInstance;
      end;
      FA_STIMULUS_RETURNACTION: begin
        (M as PUMLStimulus).Action := MetaModel.CreateInstance('UMLReturnAction') as PUMLAction;
        (M as PUMLStimulus).Sender := End1 as PUMLInstance;
        (M as PUMLStimulus).Receiver := End2 as PUMLInstance;
      end;
      FA_STIMULUS_CREATEACTION: begin
        (M as PUMLStimulus).Action := MetaModel.CreateInstance('UMLCreateAction') as PUMLAction;
        (M as PUMLStimulus).Sender := End1 as PUMLInstance;
        (M as PUMLStimulus).Receiver := End2 as PUMLInstance;
      end;
      FA_STIMULUS_DESTROYACTION: begin
        (M as PUMLStimulus).Action := MetaModel.CreateInstance('UMLDestroyAction') as PUMLAction;
        (M as PUMLStimulus).Sender := End1 as PUMLInstance;
        (M as PUMLStimulus).Receiver := End2 as PUMLInstance;
      end;
      FA_REVERSE_STIMULUS_CALLACTION: begin
        (M as PUMLStimulus).Action := MetaModel.CreateInstance('UMLCallAction') as PUMLAction;
        (M as PUMLStimulus).Receiver := End1 as PUMLInstance;
        (M as PUMLStimulus).Sender := End2 as PUMLInstance;
      end;
      FA_REVERSE_STIMULUS_SENDACTION: begin
        (M as PUMLStimulus).Action := MetaModel.CreateInstance('UMLSendAction') as PUMLAction;
        (M as PUMLStimulus).Receiver := End1 as PUMLInstance;
        (M as PUMLStimulus).Sender := End2 as PUMLInstance;
      end;
      FA_REVERSE_STIMULUS_RETURNACTION: begin
        (M as PUMLStimulus).Action := MetaModel.CreateInstance('UMLReturnAction') as PUMLAction;
        (M as PUMLStimulus).Receiver := End1 as PUMLInstance;
        (M as PUMLStimulus).Sender := End2 as PUMLInstance;
      end;
      FA_REVERSE_STIMULUS_CREATEACTION: begin
        (M as PUMLStimulus).Action := MetaModel.CreateInstance('UMLCreateAction') as PUMLAction;
        (M as PUMLStimulus).Receiver := End1 as PUMLInstance;
        (M as PUMLStimulus).Sender := End2 as PUMLInstance;
      end;
      FA_REVERSE_STIMULUS_DESTROYACTION: begin
        (M as PUMLStimulus).Action := MetaModel.CreateInstance('UMLDestroyAction') as PUMLAction;
        (M as PUMLStimulus).Receiver := End1 as PUMLInstance;
        (M as PUMLStimulus).Sender := End2 as PUMLInstance;
      end;
    end;
    (M as PUMLStimulus).Action.Name := '';
    (M as PUMLStimulus).CommunicationLink := AuxArg as PUMLLink;
    InsertToOwner(Owner, M, 'ParticipatingStimuli', InsertIndex);
  end
  // Message
  else if ModelKind = EK_MESSAGE then begin
    CheckParamError(Owner is PUMLInteraction);
    CheckParamError((AuxArg = nil) or (AuxArg is PUMLAssociationRole));
    CheckLinkError((End1 is PUMLClassifierRole) and (End2 is PUMLClassifierRole));
    M := MetaModel.CreateInstance('UMLMessage') as PModel;
    case Argument of
      FA_MESSAGE_CALLACTION: begin
        (M as PUMLMessage).Action := MetaModel.CreateInstance('UMLCallAction') as PUMLAction;
        (M as PUMLMessage).Sender := End1 as PUMLClassifierRole;
        (M as PUMLMessage).Receiver := End2 as PUMLClassifierRole;
      end;
      FA_MESSAGE_SENDACTION: begin
        (M as PUMLMessage).Action := MetaModel.CreateInstance('UMLSendAction') as PUMLAction;
        (M as PUMLMessage).Sender := End1 as PUMLClassifierRole;
        (M as PUMLMessage).Receiver := End2 as PUMLClassifierRole;
      end;
      FA_MESSAGE_RETURNACTION: begin
        (M as PUMLMessage).Action := MetaModel.CreateInstance('UMLReturnAction') as PUMLAction;
        (M as PUMLMessage).Sender := End1 as PUMLClassifierRole;
        (M as PUMLMessage).Receiver := End2 as PUMLClassifierRole;
      end;
      FA_MESSAGE_CREATEACTION: begin
        (M as PUMLMessage).Action := MetaModel.CreateInstance('UMLCreateAction') as PUMLAction;
        (M as PUMLMessage).Sender := End1 as PUMLClassifierRole;
        (M as PUMLMessage).Receiver := End2 as PUMLClassifierRole;
      end;
      FA_MESSAGE_DESTROYACTION: begin
        (M as PUMLMessage).Action := MetaModel.CreateInstance('UMLDestroyAction') as PUMLAction;
        (M as PUMLMessage).Sender := End1 as PUMLClassifierRole;
        (M as PUMLMessage).Receiver := End2 as PUMLClassifierRole;
      end;
      FA_REVERSE_MESSAGE_CALLACTION: begin
        (M as PUMLMessage).Action := MetaModel.CreateInstance('UMLCallAction') as PUMLAction;
        (M as PUMLMessage).Receiver := End1 as PUMLClassifierRole;
        (M as PUMLMessage).Sender := End2 as PUMLClassifierRole;
      end;
      FA_REVERSE_MESSAGE_SENDACTION: begin
        (M as PUMLMessage).Action := MetaModel.CreateInstance('UMLSendAction') as PUMLAction;
        (M as PUMLMessage).Receiver := End1 as PUMLClassifierRole;
        (M as PUMLMessage).Sender := End2 as PUMLClassifierRole;
      end;
      FA_REVERSE_MESSAGE_RETURNACTION: begin
        (M as PUMLMessage).Action := MetaModel.CreateInstance('UMLReturnAction') as PUMLAction;
        (M as PUMLMessage).Receiver := End1 as PUMLClassifierRole;
        (M as PUMLMessage).Sender := End2 as PUMLClassifierRole;
      end;
      FA_REVERSE_MESSAGE_CREATEACTION: begin
        (M as PUMLMessage).Action := MetaModel.CreateInstance('UMLCreateAction') as PUMLAction;
        (M as PUMLMessage).Receiver := End1 as PUMLClassifierRole;
        (M as PUMLMessage).Sender := End2 as PUMLClassifierRole;
      end;
      FA_REVERSE_MESSAGE_DESTROYACTION: begin
        (M as PUMLMessage).Action := MetaModel.CreateInstance('UMLDestroyAction') as PUMLAction;
        (M as PUMLMessage).Receiver := End1 as PUMLClassifierRole;
        (M as PUMLMessage).Sender := End2 as PUMLClassifierRole;
      end;
    end;
    (M as PUMLMessage).Action.Name := '';
    (M as PUMLMessage).CommunicationConnection := AuxArg as PUMLAssociationRole;
    InsertToOwner(Owner, M, 'Messages', InsertIndex);
  end
  // Include
  else if ModelKind = EK_INCLUDE then begin
    CheckParamError(Owner is PUMLNamespace);
    CheckLinkError((End1 is PUMLUseCase) and (End2 is PUMLUseCase));
    M := MetaModel.CreateInstance('UMLInclude') as PModel;
    (M as PUMLInclude).Base := End1 as PUMLUseCase;
    (M as PUMLInclude).Addition := End2 as PUMLUseCase;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
  end
  // Extend
  else if ModelKind = EK_EXTEND then begin
    CheckParamError(Owner is PUMLNamespace);
    CheckLinkError((End1 is PUMLUseCase) and (End2 is PUMLUseCase));
    M := MetaModel.CreateInstance('UMLExtend') as PModel;
    (M as PUMLExtend).Base := End2 as PUMLUseCase;
    (M as PUMLExtend).Extension := End1 as PUMLUseCase;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
  end
  // Realization
  else if ModelKind = EK_REALIZATION then begin
    CheckParamError(Owner is PUMLNamespace);
    CheckLinkError((End1 is PUMLModelElement) and (End2 is PUMLModelElement));
    M := MetaModel.CreateInstance('UMLRealization') as PModel;
    (M as PUMLRealization).Client := End1 as PUMLModelElement;
    (M as PUMLRealization).Supplier := End2 as PUMLModelElement;
    InsertToOwner(Owner, M, 'OwnedElements', InsertIndex);
  end
  // Connector
  else if ModelKind = 'Connector' then begin
    CheckParamError(Owner is PUMLClassifier);
    CheckLinkError((End1 is PUMLFeature) and (End2 is PUMLFeature)
      and not (End1 is PUMLConnector) and not (End2 is PUMLConnector));
    M := MetaModel.CreateInstance('UMLConnector') as PModel;
    (M as PUMLConnector).AddEnd(MetaModel.CreateInstance('UMLConnectorEnd') as PUMLConnectorEnd);
    (M as PUMLConnector).AddEnd(MetaModel.CreateInstance('UMLConnectorEnd') as PUMLConnectorEnd);
    (M as PUMLConnector).Ends[0].Role := End1 as PUMLFeature;
    (M as PUMLConnector).Ends[1].Role := End2 as PUMLFeature;
    InsertToOwner(Owner, M, 'OwnedConnectors', InsertIndex);
  end
  else begin
    M := nil;
  end;
  // Applying Initial Option Value.
  if M <> nil then
  begin
    if M is PUMLAttribute then
    begin
      M.MOF_SetAttribute('Visibility', UMLVisibilityKindToString(OptionDefaultAttrVisibility));
    end;
    if M is PUMLOperation then
    begin
      M.MOF_SetAttribute('Visibility', UMLVisibilityKindToString(OptionDefaultOperVisibility));
    end;
  end;

  Result := M;
end;

// -----------------------------------------------------------------------------
// View Element Creation function
// ------------------------------
// - DiagramView: diagram view which contains view to be going to be created
// - Model:       model corresponding to view
// - ViewKind:    kind(or type) name to be created
// - End1, End2:  in case of creating view connecting two views,
//                they means two views.
// -----------------------------------------------------------------------------
function PUMLFactory.CreateView(DiagramView: PDiagramView; Model: PModel;
  ViewKind: string = ''; End1: PView = nil; End2: PView = nil; X1: Integer = 0;
  Y1: Integer = 0; X2: Integer = 0; Y2: Integer = 0; Argument: Integer = 0): PView;

  // infer ViewKind by Model type
  function DeriveViewKind(M: PModel): string;
  begin
    if      M is PUMLModel                      then Result := VK_MODEL_VIEW
    else if M is PUMLSubsystem                  then Result := VK_SUBSYSTEM_VIEW
    else if M is PUMLPackage                    then Result := VK_PACKAGE_VIEW
    else if M is PUMLClass                      then Result := VK_CLASS_VIEW
    else if M is PUMLInterface                  then Result := VK_INTERFACE_VIEW
    else if M is PUMLEnumeration                then Result := VK_ENUMERATION_VIEW
    else if M is PUMLException                  then Result := VK_EXCEPTION_VIEW
    else if M is PUMLSignal                     then Result := VK_SIGNAL_VIEW
    else if M is PUMLComponent                  then Result := VK_COMPONENT_VIEW
    else if M is PUMLComponentInstance          then Result := VK_COMPONENTINSTANCE_VIEW
    else if M is PUMLNode                       then Result := VK_NODE_VIEW
    else if M is PUMLNodeInstance               then Result := VK_NODEINSTANCE_VIEW
    else if M is PUMLActor                      then Result := VK_ACTOR_VIEW
    else if M is PUMLUseCase                    then Result := VK_USECASE_VIEW
    else if M is PUMLCollaboration              then Result := VK_COLLABORATION_VIEW
    else if M is PUMLCollaborationInstanceSet   then Result := VK_COLLABORATIONINSTANCESET_VIEW
    else if M is PUMLSubactivityState           then Result := VK_SUBACTIVITYSTATE_VIEW
    else if M is PUMLSignalAcceptState          then Result := VK_SIGNALACCEPTSTATE_VIEW
    else if M is PUMLSignalSendState            then Result := VK_SIGNALSENDSTATE_VIEW
    else if M is PUMLActionState                then Result := VK_ACTIONSTATE_VIEW
    else if M is PUMLPseudostate                then Result := VK_PSEUDOSTATE_VIEW
    else if M is PUMLFlowFinalState             then Result := VK_FLOWFINALSTATE_VIEW
    else if M is PUMLFinalState                 then Result := VK_FINALSTATE_VIEW
    else if M is PUMLPartition                  then Result := VK_PARTITION_VIEW
    else if M is PUMLSubmachineState            then Result := VK_SUBMACHINESTATE_VIEW
    else if M is PUMLCompositeState             then Result := VK_COMPOSITESTATE_VIEW
    else if M is PUMLClassifierRole             then Result := VK_CLASSIFIERROLE_VIEW
    else if M is PUMLObject                     then Result := VK_OBJECT_VIEW
    else if M is PUMLTransition                 then Result := VK_TRANSITION_VIEW
    else if M is PUMLRealization                then Result := VK_REALIZATION_VIEW
    else if M is PUMLDependency                 then Result := VK_DEPENDENCY_VIEW
    else if M is PUMLAssociationRole            then Result := VK_ASSOCIATIONROLE_VIEW
    else if M is PUMLAssociation                then Result := VK_ASSOCIATION_VIEW
    else if M is PUMLAssociationClass           then Result := VK_ASSOCIATIONCLASS_VIEW
    else if M is PUMLGeneralization             then Result := VK_GENERALIZATION_VIEW
    else if M is PUMLLink                       then Result := VK_LINK_VIEW
    else if M is PUMLStimulus                   then Result := VK_STIMULUS_VIEW
    else if M is PUMLMessage                    then Result := VK_MESSAGE_VIEW
    else if M is PUMLInclude                    then Result := VK_INCLUDE_VIEW
    else if M is PUMLExtend                     then Result := VK_EXTEND_VIEW
    else if M is PUMLObjectFlowState            then Result := VK_OBJECTFLOWSTATE_VIEW
    else if M is PUMLArtifact                   then Result := VK_ARTIFACT_VIEW
    else if M is PUMLPort                       then Result := VK_PORT_VIEW
    else if M is PUMLAttribute                  then Result := VK_PART_VIEW
    else if M is PUMLConnector                  then Result := VK_CONNECTOR_VIEW
    else if M is PUMLCombinedFragment           then Result := VK_COMBINEDFRAGMENT_VIEW
    else if M is PUMLInteractionOperand         then Result := VK_INTERACTIONOPERAND_VIEW
    else if M is PUMLFrame                      then Result := VK_FRAME_VIEW    
    else Result := '';
  end;

  procedure SetPseudostateViewSize(V: PUMLPseudoStateView; Width: Integer; Height: Integer);
  var
    M: PUMLPseudoState;
  begin
    if V.Model = nil then Exit;
    M := V.Model as PUMLPseudoState;
    case M.PseudostateKind of
      pkChoice:
        begin
          V.Width := Max(Width, DEFAULT_CHOICEPOINT_WIDTH);
          V.Height := Max(Height, DEFAULT_CHOICEPOINT_HEIGHT);
        end;
      pkDeepHistory:
        begin
          V.Width := Max(Width, DEFAULT_DEEPHISTORY_WIDTH);
          V.Height := Max(Height, DEFAULT_DEEPHISTORY_HEIGHT);
        end;
      pkSynchronization:
        begin
          V.Width := Max(Width, DEFAULT_SYNCHRONIZATION_WIDTH);
          V.Height := Max(Height, DEFAULT_SYNCHRONIZATION_HEIGHT);
        end;
      pkInitial:
        begin
          V.Width := Max(Width, DEFAULT_INITIALSTATE_WIDTH);
          V.Height := Max(Height, DEFAULT_INITIALSTATE_HEIGHT);
        end;
      pkJunction:
        begin
          V.Width := Max(Width, DEFAULT_JUNCTIONPOINT_WIDTH);
          V.Height := Max(Height, DEFAULT_JUNCTIONPOINT_HEIGHT);
        end;
      pkShallowHistory:
        begin
          V.Width := Max(Width, DEFAULT_SHALLOWHISTORY_WIDTH);
          V.Height := Max(Height, DEFAULT_SHALLOWHISTORY_HEIGHT);
        end;
      pkDecision:
        begin
          V.Width := Max(Width, DEFAULT_DECISION_WIDTH);
          V.Height := Max(Height, DEFAULT_DECISION_HEIGHT);
        end;
    end;
  end;

var
  ConView: PView;  
  V, V1, V2: PView;
  W, H: Integer;
  Idx: Integer;
  I: Integer;
begin
  V := nil;
  W := Abs(X2 - X1);
  H := Abs(Y2 - Y1);
  V1 := DiagramView.GetViewAt(DiagramView.Canvas, X1, Y1);
  V2 := DiagramView.GetViewAt(DiagramView.Canvas, X2, Y2);
  if ViewKind = '' then ViewKind := DeriveViewKind(Model);
  // NoteView
  if ViewKind = VK_NOTE_VIEW then begin
    V := MetaModel.CreateInstance('UMLNoteView') as PView;
    V.Model := nil;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLNoteView).Width := Max(W, DEFAULT_NOTE_WIDTH);
    (V as PUMLNoteView).Height := Max(H, DEFAULT_NOTE_HEIGHT);
  end
  // NoteLinkView
  else if ViewKind = VK_NOTELINK_VIEW then begin
    CheckLinkError(((End1 <> nil) and (End2 is PUMLNoteView)) or
      ((End1 is PUMLNoteView) and (End2 <> nil)));
    V := MetaModel.CreateInstance('UMLNoteLinkView') as PView;
    V.Model := nil;
    V.Setup;
    (V as PUMLNoteLinkView).Head := End1; // Noted Element
    (V as PUMLNoteLinkView).Tail := End2; // Note
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // TextView
  else if ViewKind = VK_TEXT_VIEW then begin
    V := MetaModel.CreateInstance('UMLTextView') as PView;
    V.Model := nil;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLTextView).Text := DEFAULT_TEXT_CAPTION;
    (V as PUMLTextView).Width := Max(W, DEFAULT_TEXT_WIDTH);
    (V as PUMLTextView).Height := Max(H, DEFAULT_TEXT_HEIGHT);
  end
  // ModelView
  else if ViewKind = VK_MODEL_VIEW then begin
    CheckParamError(Model is PUMLModel);
    V := MetaModel.CreateInstance('UMLModelView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLModelView).Width := Max(W, DEFAULT_MODEL_WIDTH);
    (V as PUMLModelView).Height := Max(H, DEFAULT_MODEL_HEIGHT);
  end
  // SubsystemView
  else if ViewKind = VK_SUBSYSTEM_VIEW then begin
    CheckParamError(Model is PUMLSubsystem);
    V := MetaModel.CreateInstance('UMLSubsystemView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLSubsystemView).Width := Max(W, DEFAULT_SUBSYSTEM_WIDTH);
    (V as PUMLSubsystemView).Height := Max(H, DEFAULT_SUBSYSTEM_HEIGHT);
  end
  // PackageView
  else if ViewKind = VK_PACKAGE_VIEW then begin
    CheckParamError(Model is PUMLPackage);
    V := MetaModel.CreateInstance('UMLPackageView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLPackageView).Width := Max(W, DEFAULT_PACKAGE_WIDTH);
    (V as PUMLPackageView).Height := Max(H, DEFAULT_PACKAGE_HEIGHT);
  end
  // ClassView
  else if ViewKind = VK_CLASS_VIEW then begin
    CheckParamError(Model is PUMLClass);
    V := MetaModel.CreateInstance('UMLClassView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLClassView).Width := Max(W, DEFAULT_CLASS_WIDTH);
    (V as PUMLClassView).Height := Max(H, DEFAULT_CLASS_HEIGHT);
  end
  // InterfaceView
  else if ViewKind = VK_INTERFACE_VIEW then begin
    CheckParamError(Model is PUMLInterface);
    V := MetaModel.CreateInstance('UMLInterfaceView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLInterfaceView).Width := Max(W, DEFAULT_INTERFACE_WIDTH);
    (V as PUMLInterfaceView).Height := Max(H, DEFAULT_INTERFACE_HEIGHT);
  end
  // EnumerationView
  else if ViewKind = VK_ENUMERATION_VIEW then begin
    CheckParamError(Model is PUMLEnumeration);
    V := MetaModel.CreateInstance('UMLEnumerationView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLEnumerationView).Width := Max(W, DEFAULT_ENUMERATION_WIDTH);
    (V as PUMLEnumerationView).Height := Max(H, DEFAULT_ENUMERATION_HEIGHT);
  end
  // SignalView
  else if ViewKind = VK_SIGNAL_VIEW then begin
    CheckParamError(Model is PUMLSignal);
    V := MetaModel.CreateInstance('UMLSignalView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLSignalView).Width := Max(W, DEFAULT_SIGNAL_WIDTH);
    (V as PUMLSignalView).Height := Max(H, DEFAULT_SIGNAL_HEIGHT);
  end
  // ExceptionView
  else if ViewKind = VK_EXCEPTION_VIEW then begin
    CheckParamError(Model is PUMLException);
    V := MetaModel.CreateInstance('UMLExceptionView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLExceptionView).Width := Max(W, DEFAULT_EXCEPTION_WIDTH);
    (V as PUMLExceptionView).Height := Max(H, DEFAULT_EXCEPTION_HEIGHT);
  end
  // ComponentView
  else if ViewKind = VK_COMPONENT_VIEW then begin
    CheckParamError(Model is PUMLComponent);
    V := MetaModel.CreateInstance('UMLComponentView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLComponentView).Width := Max(W, DEFAULT_COMPONENT_WIDTH);
    (V as PUMLComponentView).Height := Max(H, DEFAULT_COMPONENT_HEIGHT);
  end
  // ComponentInstanceView
  else if ViewKind = VK_COMPONENTINSTANCE_VIEW then begin
    CheckParamError(Model is PUMLComponentInstance);
    V := MetaModel.CreateInstance('UMLComponentInstanceView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLComponentInstanceView).Width := Max(W, DEFAULT_COMPONENTINSTANCE_WIDTH);
    (V as PUMLComponentInstanceView).Height := Max(H, DEFAULT_COMPONENTINSTANCE_HEIGHT);
  end
  // NodeView
  else if ViewKind = VK_NODE_VIEW then begin
    CheckParamError(Model is PUMLNode);
    V := MetaModel.CreateInstance('UMLNodeView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLNodeView).Width := Max(W, DEFAULT_NODE_WIDTH);
    (V as PUMLNodeView).Height := Max(H, DEFAULT_NODE_HEIGHT);
  end
  // NodeInstanceView
  else if ViewKind = VK_NODEINSTANCE_VIEW then begin
    CheckParamError(Model is PUMLNodeInstance);
    V := MetaModel.CreateInstance('UMLNodeInstanceView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLNodeInstanceView).Width := Max(W, DEFAULT_NODEINSTANCE_WIDTH);
    (V as PUMLNodeInstanceView).Height := Max(H, DEFAULT_NODEINSTANCE_HEIGHT);
  end
  // ActorView
  else if ViewKind = VK_ACTOR_VIEW then begin
    CheckParamError(Model is PUMLActor);
    V := MetaModel.CreateInstance('UMLActorView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLActorView).Width := Max(W, DEFAULT_ACTOR_WIDTH);
    (V as PUMLActorView).Height := Max(H, DEFAULT_ACTOR_HEIGHT);
  end
  // UseCaseView
  else if ViewKind = VK_USECASE_VIEW then begin
    CheckParamError(Model is PUMLUseCase);
    V := MetaModel.CreateInstance('UMLUseCaseView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLUsecaseView).Width := Max(W, DEFAULT_USECASE_WIDTH);
    (V as PUMLUsecaseView).Height := Max(H, DEFAULT_USECASE_HEIGHT);
  end
  // CollaborationView
  else if ViewKind = VK_COLLABORATION_VIEW then begin
    CheckParamError(Model is PUMLCollaboration);
    V := MetaModel.CreateInstance('UMLCollaborationView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLCollaborationView).Width := Max(W, DEFAULT_COLLABORATION_WIDTH);
    (V as PUMLCollaborationView).Height := Max(H, DEFAULT_COLLABORATION_HEIGHT);
  end
  // CollaborationInstanceSetView
  else if ViewKind = VK_COLLABORATIONINSTANCESET_VIEW then begin
    CheckParamError(Model is PUMLCollaborationInstanceSet);
    V := MetaModel.CreateInstance('UMLCollaborationInstanceSetView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLCollaborationInstanceSetView).Width := Max(W, DEFAULT_COLLABORATIONINSTANCESET_WIDTH);
    (V as PUMLCollaborationInstanceSetView).Height := Max(H, DEFAULT_COLLABORATIONINSTANCESET_HEIGHT);
  end
  // ActionStateView, ActivityView
  else if (ViewKind = VK_ACTIONSTATE_VIEW) or (ViewKind = VK_ACTIVITY_VIEW) then begin
    CheckParamError(Model is PUMLActionState);
    V := MetaModel.CreateInstance('UMLActionStateView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLActionStateView).Width := Max(W, DEFAULT_ACTIONSTATE_WIDTH);
    (V as PUMLActionStateView).Height := Max(H, DEFAULT_ACTIONSTATE_HEIGHT);
  end
  // SubactivityStateView
  else if ViewKind = VK_SUBACTIVITYSTATE_VIEW then begin
    CheckParamError(Model is PUMLSubactivityState);
    V := MetaModel.CreateInstance('UMLSubactivityStateView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLSubactivityStateView).Width := Max(W, DEFAULT_SUBACTIVITYSTATE_WIDTH);
    (V as PUMLSubactivityStateView).Height := Max(H, DEFAULT_SUBACTIVITYSTATE_HEIGHT);
  end
  // PseudostateView
  else if ViewKind = VK_PSEUDOSTATE_VIEW then begin
    CheckParamError(Model is PUMLPseudostate);
    V := MetaModel.CreateInstance('UMLPseudostateView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    SetPseudostateViewSize(V as PUMLPseudostateView, W, H);
  end
  // FinalStateView
  else if ViewKind = VK_FINALSTATE_VIEW then begin
    CheckParamError(Model is PUMLFinalState);
    V := MetaModel.CreateInstance('UMLFinalStateView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLFinalStateView).Width := Max(W, DEFAULT_FINALSTATE_WIDTH);
    (V as PUMLFinalStateView).Height := Max(H, DEFAULT_FINALSTATE_HEIGHT);
  end
  // SwimlaneView, PartitionView
  else if (ViewKind = VK_SWIMLANE_VIEW) or (ViewKind = VK_PARTITION_VIEW) then begin
    CheckParamError(Model is PUMLPartition);
    V := MetaModel.CreateInstance('UMLSwimlaneView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    case Argument of
      FA_SWIMLANE_VERTICAL:
        begin
          (V as PUMLSwimlaneView).Direction := slkVertical;
          (V as PUMLSwimlaneView).Width := Max(W, DEFAULT_VERT_SWIMLANE_WIDTH);
          (V as PUMLSwimlaneView).Height := Max(H, DEFAULT_VERT_SWIMLANE_HEIGHT);
        end;
      FA_SWIMLANE_HORIZONTAL:
        begin
          (V as PUMLSwimlaneView).Direction := slkHorizontal;
          (V as PUMLSwimlaneView).Width := Max(W, DEFAULT_HORIZ_SWIMLANE_WIDTH);
          (V as PUMLSwimlaneView).Height := Max(H, DEFAULT_HORIZ_SWIMLANE_HEIGHT);
        end;
    end;
  end
  // SubmachineStateView
  else if ViewKind = VK_SUBMACHINESTATE_VIEW then begin
    CheckParamError(Model is PUMLSubmachineState);
    V := MetaModel.CreateInstance('UMLSubmachineStateView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLSubmachineStateView).Width := Max(W, DEFAULT_SUBMACHINESTATE_WIDTH);
    (V as PUMLSubmachineStateView).Height := Max(H, DEFAULT_SUBMACHINESTATE_HEIGHT);
  end
  // CompositeStateView, StateView
  else if (ViewKind = VK_COMPOSITESTATE_VIEW) or (ViewKind = VK_STATE_VIEW) then begin
    CheckParamError(Model is PUMLCompositeState);
    V := MetaModel.CreateInstance('UMLStateView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLStateView).Width := Max(W, DEFAULT_STATE_WIDTH);
    (V as PUMLStateView).Height := Max(H, DEFAULT_STATE_HEIGHT);
  end
  // ClassifierRoleView
  else if ViewKind = VK_CLASSIFIERROLE_VIEW then begin
    CheckParamError((DiagramView.Diagram is PUMLSequenceRoleDiagram) or
      (DiagramView.Diagram is PUMLCollaborationRoleDiagram));
    CheckParamError(Model is PUMLClassifierRole);
    if DiagramView.Diagram is PUMLSequenceRoleDiagram then
      V := MetaModel.CreateInstance('UMLSeqClassifierRoleView') as PView
    else if DiagramView.Diagram is PUMLCollaborationRoleDiagram then
      V := MetaModel.CreateInstance('UMLColClassifierRoleView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    if DiagramView.Diagram is PUMLSequenceRoleDiagram then begin
      Idx := -1;
      for I := 0 to DiagramView.OwnedViewCount - 1 do begin
        if DiagramView.OwnedView[I] is PUMLSeqMessageView then begin
          Idx := I;
          Break;
        end;
      end;
      if Idx = -1 then
        DiagramView.AddOwnedView(V)
      else
        DiagramView.InsertOwnedView(Idx, V);
    end
    else
      DiagramView.AddOwnedView(V);
    if DiagramView.Diagram is PUMLSequenceRoleDiagram then begin
      (V as PUMLSeqClassifierRoleView).Width := Max(W, DEFAULT_SEQCLASSIFIERROLE_WIDTH);
      (V as PUMLSeqClassifierRoleView).Height := Max(H, DEFAULT_SEQCLASSIFIERROLE_HEIGHT);
    end
    else if DiagramView.Diagram is PUMLCollaborationRoleDiagram then begin
      (V as PUMLColClassifierRoleView).Width := Max(W, DEFAULT_COLCLASSIFIERROLE_WIDTH);
      (V as PUMLColClassifierRoleView).Height := Max(H, DEFAULT_COLCLASSIFIERROLE_HEIGHT);
    end;
  end
  // ObjectView
  else if ViewKind = VK_OBJECT_VIEW then begin
    CheckParamError((DiagramView.Diagram is PUMLClassDiagram) or
      (DiagramView.Diagram is PUMLUseCaseDiagram) or
      (DiagramView.Diagram is PUMLComponentDiagram) or
      (DiagramView.Diagram is PUMLDeploymentDiagram) or
      (DiagramView.Diagram is PUMLSequenceDiagram) or
      (DiagramView.Diagram is PUMLCollaborationDiagram));
    CheckParamError(Model is PUMLObject);
    if DiagramView.Diagram is PUMLSequenceDiagram then
      V := MetaModel.CreateInstance('UMLSeqObjectView') as PView
    else if DiagramView.Diagram is PUMLCollaborationDiagram then
      V := MetaModel.CreateInstance('UMLColObjectView') as PView
    else
      V := MetaModel.CreateInstance('UMLColObjectView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    if DiagramView.Diagram is PUMLSequenceDiagram then begin
      Idx := -1;
      for I := 0 to DiagramView.OwnedViewCount - 1 do begin
        if DiagramView.OwnedView[I] is PUMLSeqStimulusView then begin
          Idx := I;
          Break;
        end;
      end;
      if Idx = -1 then
        DiagramView.AddOwnedView(V)
      else
        DiagramView.InsertOwnedView(Idx, V);
    end
    else
      DiagramView.AddOwnedView(V);
    if DiagramView.Diagram is PUMLSequenceDiagram then begin
      (V as PUMLSeqObjectView).Width := Max(W, DEFAULT_SEQOBJECT_WIDTH);
      (V as PUMLSeqObjectView).Height := Max(H, DEFAULT_SEQOBJECT_HEIGHT);
    end
    else if DiagramView.Diagram is PUMLCollaborationDiagram then begin
      (V as PUMLColObjectView).Width := Max(W, DEFAULT_COLOBJECT_WIDTH);
      (V as PUMLColObjectView).Height := Max(H, DEFAULT_COLOBJECT_HEIGHT);
    end
    else begin
      (V as PUMLColObjectView).Width := Max(W, DEFAULT_COLOBJECT_WIDTH);
      (V as PUMLColObjectView).Height := Max(H, DEFAULT_COLOBJECT_HEIGHT);
    end;
  end
  // ObjectFlowStateView
  else if ViewKind = VK_OBJECTFLOWSTATE_VIEW then begin
    CheckParamError(Model is PUMLObjectFlowState);
    V := MetaModel.CreateInstance('UMLObjectFlowStateView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLObjectFlowStateView).Width := Max(W, DEFAULT_OBJECTFLOWSTATE_WIDTH);
    (V as PUMLObjectFlowStateView).Height := Max(H, DEFAULT_OBJECTFLOWSTATE_HEIGHT);
  end
  // FlowFinalStateView
  else if ViewKind = VK_FLOWFINALSTATE_VIEW then begin
    CheckParamError(Model is PUMLFlowFinalState);
    V := MetaModel.CreateInstance('UMLFlowFinalStateView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLFlowFinalStateView).Width := Max(W, DEFAULT_FLOWFINALSTATE_WIDTH);
    (V as PUMLFlowFinalStateView).Height := Max(H, DEFAULT_FLOWFINALSTATE_HEIGHT);
  end
  // ArtifactView
  else if ViewKind = VK_ARTIFACT_VIEW then begin
    CheckParamError(Model is PUMLArtifact);
    V := MetaModel.CreateInstance('UMLArtifactView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLArtifactView).Width := Max(W, DEFAULT_ARTIFACT_WIDTH);
    (V as PUMLArtifactView).Height := Max(H, DEFAULT_ARTIFACT_HEIGHT);
  end
  // PortView
  else if ViewKind = VK_PORT_VIEW then begin
    CheckParamError(Model is PUMLPort);
    CheckParamError((V1 <> nil) and (V1.Model <> nil) and (V1.Model is PUMLClassifier));
    V := MetaModel.CreateInstance('UMLPortView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLPortView).Width := Max(W, DEFAULT_PORT_WIDTH);
    (V as PUMLPortView).Height := Max(H, DEFAULT_PORT_HEIGHT);
    V1.AddContainedView(V);
  end
  // PartView
  else if ViewKind = VK_PART_VIEW then begin
    CheckParamError(Model is PUMLAttribute);
    CheckParamError((V1 <> nil) and (V1.Model <> nil) and (V1.Model is PUMLClassifier));
    V := MetaModel.CreateInstance('UMLPartView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLPartView).Width := Max(W, DEFAULT_PART_WIDTH);
    (V as PUMLPartView).Height := Max(H, DEFAULT_PART_HEIGHT);
    V1.AddContainedView(V);
  end
  // CombinedFragmentView
  else if ViewKind = VK_COMBINEDFRAGMENT_VIEW then begin
    CheckParamError(Model is PUMLCombinedFragment);
    V := MetaModel.CreateInstance('UMLCombinedFragmentView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLCombinedFragmentView).Width := Max(W, DEFAULT_COMBINEDFRAGMENT_WIDTH);
    (V as PUMLCombinedFragmentView).Height := Max(H, DEFAULT_COMBINEDFRAGMENT_HEIGHT);
  end
  // InteractionOperandView
  else if ViewKind = VK_INTERACTIONOPERAND_VIEW then begin
    CheckParamError(Model is PUMLInteractionOperand);
    V := MetaModel.CreateInstance('UMLInteractionOperandView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLInteractionOperandView).Width := Max(W, DEFAULT_INTERACTIONOPERAND_WIDTH);
    (V as PUMLInteractionOperandView).Height := Max(H, DEFAULT_INTERACTIONOPERAND_HEIGHT);
  end
  // TransitionView
  else if ViewKind = VK_TRANSITION_VIEW then begin
    CheckParamError(Model is PUMLTransition);
    CheckLinkError((End1 <> nil) and (End2 <> nil));
    V := MetaModel.CreateInstance('UMLTransitionView') as PView;
    V.Model := Model;
    V.Setup;
    (V as PUMLTransitionView).Tail := End1; // Source
    (V as PUMLTransitionView).Head := End2; // Target
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // DependencyView
  else if ViewKind = VK_DEPENDENCY_VIEW then begin
    CheckParamError(Model is PUMLDependency);
    CheckLinkError((End1 <> nil) and (End2 <> nil));
    V := MetaModel.CreateInstance('UMLDependencyView') as PView;
    V.Model := Model;
    V.Setup;
    (V as PUMLDependencyView).Tail := End1; // Client
    (V as PUMLDependencyView).Head := End2; // Supplier
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // AssociationView
  else if ViewKind = VK_ASSOCIATION_VIEW then begin
    CheckParamError(Model is PUMLAssociation);
    CheckLinkError((End1 <> nil) and (End2 <> nil));
    V := MetaModel.CreateInstance('UMLAssociationView') as PView;
    V.Model := Model;
    V.Setup;
    (V as PUMLAssociationView).Tail := End1; // Connection[0]
    (V as PUMLAssociationView).Head := End2; // Connection[1]
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // AssociationClassView
  else if ViewKind = VK_ASSOCIATIONCLASS_VIEW then begin
    CheckParamError(Model is PUMLAssociationClass);
    CheckLinkError(((End1 is PUMLAssociationView) and (End2 is PUMLClassView)) or
      ((End1 is PUMLClassView) and (End2 is PUMLAssociationView)));
    V := MetaModel.CreateInstance('UMLAssociationClassView') as PView;
    V.Model := Model;
    V.Setup;
    if End1 is PUMLAssociationView then begin
      (V as PUMLAssociationClassView).Tail := End1; // Association
      (V as PUMLAssociationClassView).Head := End2; // Class
    end
    else begin
      (V as PUMLAssociationClassView).Tail := End2; // Association
      (V as PUMLAssociationClassView).Head := End1; // Class
    end;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // GeneralizationView
  else if ViewKind = VK_GENERALIZATION_VIEW then begin
    CheckParamError(Model is PUMLGeneralization);
    CheckLinkError((End1 <> nil) and (End2 <> nil));
    V := MetaModel.CreateInstance('UMLGeneralizationView') as PView;
    V.Model := Model;
    V.Setup;
    (V as PUMLGeneralizationView).Tail := End1; // Child
    (V as PUMLGeneralizationView).Head := End2; // Parent
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // LinkView
  else if ViewKind = VK_LINK_VIEW then begin
    CheckParamError(Model is PUMLLink);
    CheckLinkError((End1 <> nil) and (End2 <> nil));
    V := MetaModel.CreateInstance('UMLLinkView') as PView;
    V.Model := Model;
    V.Setup;
    (V as PUMLLinkView).Tail := End1; // Connection[0]
    (V as PUMLLinkView).Head := End2; // Connection[1]
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // AssociationRoleView
  else if ViewKind = VK_ASSOCIATIONROLE_VIEW then begin
    CheckParamError(Model is PUMLAssociationRole);
    CheckLinkError((End1 <> nil) and (End2 <> nil));
    V := MetaModel.CreateInstance('UMLAssociationRoleView') as PView;
    V.Model := Model;
    V.Setup;
    (V as PUMLAssociationRoleView).Tail := End1; // Connection[0]
    (V as PUMLAssociationRoleView).Head := End2; // Connection[1]
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // StimulusView
  else if ViewKind = VK_STIMULUS_VIEW then begin
    CheckParamError(Model is PUMLStimulus);
    if DiagramView.Diagram is PUMLSequenceDiagram then begin
      CheckLinkError((End1 <> nil) and (End2 <> nil));
      V := MetaModel.CreateInstance('UMLSeqStimulusView') as PView;
      (V as PUMLSeqStimulusView).Tail := (End1 as PUMLSeqObjectView).LifeLine; // Sender
      (V as PUMLSeqStimulusView).Head := (End2 as PUMLSeqObjectView).LifeLine; // Receiver
    end
    else if DiagramView.Diagram is PUMLCollaborationDiagram then begin
      CheckLinkError(End1 is PUMLLinkView);
      V := MetaModel.CreateInstance('UMLColStimulusView') as PView;
      (V as PUMLColStimulusView).HostEdge := End1 as PUMLLinkView;
      (V as PUMLColStimulusView).Alpha := PI / 2;
      (V as PUMLColStimulusView).Distance := 10;
    end;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // MessageView
  else if ViewKind = VK_MESSAGE_VIEW then begin
    CheckParamError(Model is PUMLMessage);
    if DiagramView.Diagram is PUMLSequenceRoleDiagram then begin
      CheckLinkError((End1 <> nil) and (End2 <> nil));
      V := MetaModel.CreateInstance('UMLSeqMessageView') as PView;
      (V as PUMLSeqMessageView).Tail := (End1 as PUMLSeqClassifierRoleView).LifeLine; // Sender;
      (V as PUMLSeqMessageView).Head := (End2 as PUMLSeqClassifierRoleView).LifeLine; // Receiver;
    end
    else if DiagramView.Diagram is PUMLCollaborationRoleDiagram then begin
      CheckLinkError(End1 is PUMLAssociationRoleView);
      V := MetaModel.CreateInstance('UMLColMessageView') as PView;
      (V as PUMLColMessageView).HostEdge := End1 as PUMLAssociationRoleView;
      (V as PUMLColMessageView).Alpha := PI / 2;
      (V as PUMLColMessageView).Distance := 10;
    end;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // IncludeView
  else if ViewKind = VK_INCLUDE_VIEW then begin
    CheckParamError(Model is PUMLInclude);
    CheckLinkError((End1 <> nil) and (End2 <> nil));
    V := MetaModel.CreateInstance('UMLIncludeView') as PView;
    V.Model := Model;
    V.Setup;
    (V as PUMLIncludeView).Head := End2; // Base
    (V as PUMLIncludeView).Tail := End1; // Addition
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // ExtendView
  else if ViewKind = VK_EXTEND_VIEW then begin
    CheckParamError(Model is PUMLExtend);
    CheckLinkError((End1 <> nil) and (End2 <> nil));
    V := MetaModel.CreateInstance('UMLExtendView') as PView;
    V.Model := Model;
    V.Setup;
    (V as PUMLExtendView).Head := End2; // Base
    (V as PUMLExtendView).Tail := End1; // Extension
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // RealizationView
  else if ViewKind = VK_REALIZATION_VIEW then begin
    CheckParamError(Model is PUMLRealization);
    CheckLinkError((End1 <> nil) and (End2 <> nil));
    V := MetaModel.CreateInstance('UMLRealizationView') as PView;
    V.Model := Model;
    V.Setup;
    (V as PUMLRealizationView).Tail := End1; // Client
    (V as PUMLRealizationView).Head := End2; // Supplier
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // SystemBoundaryView
  else if ViewKind = VK_SYSTEMBOUNDARY_VIEW then begin
    V := MetaModel.CreateInstance('UMLSystemBoundaryView') as PView;
    V.Model := nil;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLSystemBoundaryView).Caption := DEFAULT_SYSTEMBOUNDARY_CAPTION;
    (V as PUMLSystemBoundaryView).Width := Max(W, DEFAULT_SYSTEMBOUNDARY_WIDTH);
    (V as PUMLSystemBoundaryView).Height := Max(H, DEFAULT_SYSTEMBOUNDARY_HEIGHT);
  end
  // SignalAcceptStateView
  else if ViewKind = VK_SIGNALACCEPTSTATE_VIEW then begin
    CheckParamError(Model is PUMLSignalAcceptState);
    V := MetaModel.CreateInstance('UMLSignalAcceptStateView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLSignalAcceptStateView).Width := Max(W, DEFAULT_SIGNALACCEPTSTATE_WIDTH);
    (V as PUMLSignalAcceptStateView).Height := Max(H, DEFAULT_SIGNALACCEPTSTATE_HEIGHT);
  end
  // SignalSendStateView
  else if ViewKind = VK_SIGNALSENDSTATE_VIEW then begin
    CheckParamError(Model is PUMLSignalSendState);
    V := MetaModel.CreateInstance('UMLSignalSendStateView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLSignalSendStateView).Width := Max(W, DEFAULT_SIGNALSENDSTATE_WIDTH);
    (V as PUMLSignalSendStateView).Height := Max(H, DEFAULT_SIGNALSENDSTATE_HEIGHT);
  end
  // ConnectorView
  else if ViewKind = VK_CONNECTOR_VIEW  then begin
    CheckParamError(Model is PUMLConnector);
    CheckLinkError((End1 <> nil) and (End2 <> nil));
    V := MetaModel.CreateInstance('UMLConnectorView') as PView;
    V.Model := Model;
    V.Setup;
    (V as PUMLConnectorView).Tail := End1; // Ends[0]
    (V as PUMLConnectorView).Head := End2; // Ends[1]
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
  end
  // FrameView
  else if ViewKind = VK_FRAME_VIEW then begin
    V := MetaModel.CreateInstance('UMLFrameView') as PView;
    V.Model := Model;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PUMLFrameView).Width := Max(W, DEFAULT_FRAME_WIDTH);
    (V as PUMLFrameView).Height := Max(H, DEFAULT_FRAME_HEIGHT);
  end
  // RectangleView
  else if ViewKind = VK_RECTANGLE_VIEW then begin
    V := MetaModel.CreateInstance('RectangleView') as PView;
    V.Model := nil;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PRectangleView).Width := Max(W, DEFAULT_SHAPE_WIDTH);
    (V as PRectangleView).Height := Max(H, DEFAULT_SHAPE_HEIGHT);
  end
  // EllipseView
  else if ViewKind = VK_ELLIPSE_VIEW then begin
    V := MetaModel.CreateInstance('EllipseView') as PView;
    V.Model := nil;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PEllipseView).Width := Max(W, DEFAULT_SHAPE_WIDTH);
    (V as PEllipseView).Height := Max(H, DEFAULT_SHAPE_HEIGHT);
  end
  // RoundRectView
  else if ViewKind = VK_ROUNDRECT_VIEW then begin
    V := MetaModel.CreateInstance('RoundRectView') as PView;
    V.Model := nil;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PRoundRectView).Width := Max(W, DEFAULT_SHAPE_WIDTH);
    (V as PRoundRectView).Height := Max(H, DEFAULT_SHAPE_HEIGHT);
  end
  // LineView
  else if ViewKind = VK_LINE_VIEW then begin
    V := MetaModel.CreateInstance('LineView') as PView;
    V.Model := nil;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PLineView).Width := Max(W, DEFAULT_SHAPE_WIDTH);
    (V as PLineView).Height := Max(H, DEFAULT_SHAPE_HEIGHT);
  end
  // Image
  else if ViewKind = VK_IMAGE_VIEW then begin
    V := MetaModel.CreateInstance('ImageView') as PView;
    V.Model := nil;
    V.Setup;
    V.Initialize(DiagramView.Canvas, X1, Y1, X2, Y2);
    DiagramView.AddOwnedView(V);
    (V as PImageView).Width := Max(W, DEFAULT_IMAGE_WIDTH);
    (V as PImageView).Height := Max(H, DEFAULT_IMAGE_HEIGTH);
  end
  else begin
    V := nil;
  end;
  // Applying Initial Option Value.
  if V <> nil then begin
    V.FillColor := OptionDefaultFillColor;
    V.LineColor := OptionDefaultLineColor;
    V.FontFace := OptionDefaultFontFace;
    V.FontSize := OptionDefaultFontSize;
    V.FontColor := OptionDefaultFontColor;
    if V.MetaClass.ExistsAttribute('LineStyle') then
      V.MOF_SetAttribute('LineStyle', LineStyleKindToString(OptionLineStyle));
    if V.MetaClass.ExistsAttribute('StereotypeDisplay') then
      V.MOF_SetAttribute('StereotypeDisplay', UMLStereotypeDisplayKindToString(OptionStereotypeDisplay));
    if V.MetaClass.ExistsAttribute('ShowParentName') then
      V.MOF_SetAttribute('ShowParentName', BooleanToString(OptionShowParentName));
    if V.MetaClass.ExistsAttribute('AutoResize') then
      V.MOF_SetAttribute('AutoResize', BooleanToString(OptionAutoResize));
    if V.MetaClass.ExistsAttribute('ShowCompartmentVisibility') then
      V.MOF_SetAttribute('ShowCompartmentVisibility', BooleanToString(OptionShowCompartmentVisibility));
    if V.MetaClass.ExistsAttribute('ShowCompartmentStereotype') then
      V.MOF_SetAttribute('ShowCompartmentStereotype', BooleanToString(OptionShowCompartmentStereotype));
    if V.MetaClass.ExistsAttribute('ShowOperationSignature') then
      V.MOF_SetAttribute('ShowOperationSignature', BooleanToString(OptionShowOperationSignature));
    if V.MetaClass.ExistsAttribute('ShowProperty') then
      V.MOF_SetAttribute('ShowProperty', BooleanToString(OptionShowProperty));
    if V.MetaClass.ExistsAttribute('SuppressAttributes') then
      V.MOF_SetAttribute('SuppressAttributes', BooleanToString(OptionSuppressAttributes));
    if V.MetaClass.ExistsAttribute('SuppressOperations') then
      V.MOF_SetAttribute('SuppressOperations', BooleanToString(OptionSuppressOperations));
    if V.MetaClass.ExistsAttribute('WordWrap') then
      V.MOF_SetAttribute('WordWrap', BooleanToString(OptionWordWrapByDefault));

    if V is PUMLEnumerationView then
      V.MOF_SetAttribute('SuppressLiterals', BooleanToString(OptionEnumerationSuppressLiterals));

    if V is PUMLActorView then
    begin
      V.MOF_SetAttribute('StereotypeDisplay', UMLStereotypeDisplayKindToString(OptionActorStereotypeDisplay));
      V.MOF_SetAttribute('SuppressAttributes', BooleanToString(OptionActorSuppressAttributes));
      V.MOF_SetAttribute('SuppressOperations', BooleanToString(OptionActorSuppressOperations));
    end;

    if V is PUMLUseCaseView then
    begin
      V.MOF_SetAttribute('StereotypeDisplay', UMLStereotypeDisplayKindToString(OptionUseCaseStereotypeDisplay));
      V.MOF_SetAttribute('SuppressAttributes', BooleanToString(OptionUseCaseSuppressAttributes));
      V.MOF_SetAttribute('SuppressOperations', BooleanToString(OptionUseCaseSuppressOperations));
    end;

    if V is PUMLInterfaceView then
    begin
      V.MOF_SetAttribute('StereotypeDisplay', UMLStereotypeDisplayKindToString(OptionInterfaceStereotypeDisplay));
      V.MOF_SetAttribute('SuppressAttributes', BooleanToString(OptionInterfaceSuppressAttributes));
      V.MOF_SetAttribute('SuppressOperations', BooleanToString(OptionInterfaceSuppressOperations));
    end;

    if V is PUMLArtifactView then
    begin
      V.MOF_SetAttribute('StereotypeDisplay', UMLStereotypeDisplayKindToString(OptionArtifactStereotypeDisplay));
      V.MOF_SetAttribute('SuppressAttributes', BooleanToString(OptionArtifactSuppressAttributes));
      V.MOF_SetAttribute('SuppressOperations', BooleanToString(OptionArtifactSuppressOperations));
    end;

    if (V is PUMLComponentView) or (V is PUMLComponentInstanceView) then
    begin
      V.MOF_SetAttribute('StereotypeDisplay', UMLStereotypeDisplayKindToString(OptionComponentStereotypeDisplay));
    end;

    if (V is PUMLNodeView) or (V is PUMLNodeInstanceView) then
    begin
      V.MOF_SetAttribute('StereotypeDisplay', UMLStereotypeDisplayKindToString(OptionNodeStereotypeDisplay));
    end;
  end;
  Result := V;
end;

// -----------------------------------------------------------------------------
// View element creation function
// ------------------------------
// - DiagramView:    diagram view which contains view to be created
// - X1, Y1, X2, Y2: coordination to create view
//                   view size or position of two views for connecting elements
// - Model:          model corresponding to view to be created
// - ViewKind:       kind(or type) name to be created
// -----------------------------------------------------------------------------
function PUMLFactory.CreateView(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
  Model: PModel; ViewKind: string = ''; Argument: Integer = 0): PView;
var
  V, End1, End2: PView;
begin
  End1 := DiagramView.GetViewAt(DiagramView.Canvas, X1, Y1);
  End2 := DiagramView.GetViewAt(DiagramView.Canvas, X2, Y2);
  V := CreateView(DiagramView, Model, ViewKind, End1, End2, X1, Y1, X2, Y2, Argument);
  Result := V;
end;

function PUMLFactory.CreateDiagram(Owner: PModel; DiagramKind: string;
  var CreatedModel: PModel): PDiagram;
begin
  Result := CreateDiagram(Owner, DiagramKind, DiagramKind, CreatedModel);
end;

// -----------------------------------------------------------------------------
// Diagram element creation function
// ----------------------------------------
// - Owner:        element which contains diagram to be created
// - ModelKind:    kind(or type) name of diagram to be created
// - CreatedModel: additional creation model elements exist
//                 in case of creating diagram in Any Owner
//                 (e.g. Collaboration, Interaction, ...)
// -----------------------------------------------------------------------------
function PUMLFactory.CreateDiagram(Owner: PModel; DiagramKind: string; NamePrefix: string;
  var CreatedModel: PModel): PDiagram;
var
  M, N: PModel;
  DM: PUMLDiagram; // Diagram model
  DV: PUMLDiagramView; // Diagram view
begin
  // PRECONDITION
  Assert(Owner <> nil);
  // PRECONDITION
  DM := MetaModel.CreateInstance('UML' + DiagramKind) as PUMLDiagram;
  DV := MetaModel.CreateInstance('UML' + DiagramKind + 'View') as PUMLDiagramView;
  DM.DiagramView := DV;
  // ClassDiagram
  if DiagramKind = DK_CLASS_DIAGRAM then begin
    Owner.AddOwnedDiagram(DM);
    CreatedModel := nil;
  end
  // UseCaseDiagram
  else if DiagramKind = DK_USECASE_DIAGRAM then begin
    Owner.AddOwnedDiagram(DM);
    CreatedModel := nil;
  end
  // SequenceDiagram
  else if DiagramKind = DK_SEQUENCE_DIAGRAM then begin
    if (Owner is PUMLInteractionInstanceSet) then begin
      Owner.AddOwnedDiagram(DM);
      CreatedModel := nil;
    end
    else if (Owner is PUMLCollaborationInstanceSet) then begin
      M := CreateModel(Owner, EK_INTERACTIONINSTANCESET);
      M.AddOwnedDiagram(DM);
      CreatedModel := M;
    end
    else begin
      M := CreateModel(Owner, EK_COLLABORATIONINSTANCESET);
      N := CreateModel(M, EK_INTERACTIONINSTANCESET);
      N.AddOwnedDiagram(DM);
      CreatedModel := M;
    end;
    with DM as PUMLSequenceDiagram do begin
      ShowSequenceNumber := OptionShowSequenceNumber;
      MessageSignature := OptionMessageSignature;
      ShowActivation := OptionShowActivation;
    end;
  end
  // SequenceRoleDiagram
  else if DiagramKind = DK_SEQUENCEROLE_DIAGRAM then begin
    if (Owner is PUMLInteraction) then begin
      Owner.AddOwnedDiagram(DM);
      CreatedModel := nil;
    end
    else if (Owner is PUMLCollaboration) then begin
      M := CreateModel(Owner, EK_INTERACTION);
      M.AddOwnedDiagram(DM);
      CreatedModel := M;
    end
    else begin
      M := CreateModel(Owner, EK_COLLABORATION);
      N := CreateModel(M, EK_INTERACTION);
      N.AddOwnedDiagram(DM);
      CreatedModel := M;
    end;
    with DM as PUMLSequenceRoleDiagram do begin
      ShowSequenceNumber := OptionShowSequenceNumber;
      MessageSignature := OptionMessageSignature;
      ShowActivation := OptionShowActivation;
    end;
  end
  // CollaborationDiagram
  else if DiagramKind = DK_COLLABORATION_DIAGRAM then begin
    if (Owner is PUMLInteractionInstanceSet) then begin
      Owner.AddOwnedDiagram(DM);
      CreatedModel := nil;
    end
    else if (Owner is PUMLCollaborationInstanceSet) then begin
      M := CreateModel(Owner, EK_INTERACTIONINSTANCESET);
      M.AddOwnedDiagram(DM);
      CreatedModel := M;
    end
    else begin
      M := CreateModel(Owner, EK_COLLABORATIONINSTANCESET);
      N := CreateModel(M, EK_INTERACTIONINSTANCESET);
      N.AddOwnedDiagram(DM);
      CreatedModel := M;
    end;
    with DM as PUMLCollaborationDiagram do begin
      ShowSequenceNumber := OptionShowSequenceNumber;
      MessageSignature := OptionMessageSignature;
    end;
  end
  // CollaborationRoleDiagram
  else if DiagramKind = DK_COLLABORATIONROLE_DIAGRAM then begin
    if (Owner is PUMLInteraction) then begin
      Owner.AddOwnedDiagram(DM);
      CreatedModel := nil;
    end
    else if (Owner is PUMLCollaboration) then begin
      M := CreateModel(Owner, EK_INTERACTION);
      M.AddOwnedDiagram(DM);
      CreatedModel := M;
    end
    else begin
      M := CreateModel(Owner, EK_COLLABORATION);
      N := CreateModel(M, EK_INTERACTION);
      N.AddOwnedDiagram(DM);
      CreatedModel := M;
    end;
    with DM as PUMLCollaborationRoleDiagram do begin
      ShowSequenceNumber := OptionShowSequenceNumber;
      MessageSignature := OptionMessageSignature;
    end;
  end
  // StatechartDiagram
  else if DiagramKind = DK_STATECHART_DIAGRAM then begin
    if (Owner is PUMLStateMachine) then begin
      Owner.AddOwnedDiagram(DM);
      CreatedModel := nil;
    end
    else begin
      M := CreateModel(Owner, EK_STATEMACHINE);
      M.AddOwnedDiagram(DM);
      CreatedModel := M;
    end;
  end
  // ActivityDiagram
  else if DiagramKind = DK_ACTIVITY_DIAGRAM then begin
    if (Owner is PUMLActivityGraph) then begin
      Owner.AddOwnedDiagram(DM);
      CreatedModel := nil;
    end
    else begin
      M := CreateModel(Owner, EK_ACTIVITYGRAPH);
      M.AddOwnedDiagram(DM);
      CreatedModel := M;
    end;
  end
  // ComponentDiagram
  else if DiagramKind = DK_COMPONENT_DIAGRAM then begin
    Owner.AddOwnedDiagram(DM);
    CreatedModel := nil;
  end
  // DeploymentDiagram
  else if DiagramKind = DK_DEPLOYMENT_DIAGRAM then begin
    Owner.AddOwnedDiagram(DM);
    CreatedModel := nil;
  end
  // CompositeStructureDiagram
  else if DiagramKind = DK_COMPOSITESTRUCTURE_DIAGRAM then begin
    Owner.AddOwnedDiagram(DM);
    CreatedModel := nil;
  end
  else begin
    CreatedModel := nil;
    // raise an exception.
  end;
  Result := DM;
  AssignNewName(DM, NamePrefix);
end;

function PUMLFactory.CreateElement(DiagramView: PDiagramView; ElementKind: string;
  Argument: Integer = 0; End1: PView = nil; End2: PView = nil): PView;
begin
  Result := CreateElement(DiagramView, ElementKind, ElementKind, Argument, End1, End2);
end;

// -----------------------------------------------------------------------------
// fuction to create View and Model together
// -----------------------------------------
// - DiagramView:    diagram view which contains view to be created
// - ElementKind:    kind(or type)'s name of element to be created
// - NamePrefix:     name prefix of model to be created
// - Argument:       additional argument to create model element
// - End1, End2:     two view elements to which created view connects
// -----------------------------------------------------------------------------
function PUMLFactory.CreateElement(DiagramView: PDiagramView; ElementKind: string;
  NamePrefix: string; Argument: Integer = 0; End1: PView = nil; End2: PView = nil): PView;
var
  Owner, E1, E2: PModel;
  M: PModel;
  V: PView;
begin
  Owner := DiagramView.Diagram.DiagramOwner;
  E1 := nil; E2 := nil;
  if End1 <> nil then E1 := End1.Model;
  if End2 <> nil then E2 := End2.Model;
  M := CreateModel(Owner, ElementKind, NamePrefix, Argument, E1, E2);
  V := CreateView(DiagramView, M, ElementKind + 'View', End1, End2);
  Result := V;
end;

function PUMLFactory.CreateElement(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
  ElementKind: string; Argument: Integer = 0): PView;
begin
  Result := CreateElement(DiagramView, X1, Y1, X2, Y2, ElementKind, ElementKind, Argument);
  //StarUMLApplication.SelectView(Result);
end;

// -----------------------------------------------------------------------------
// function to create view and model together
// ------------------------------------------
// - DiagramView:    diagram view which contains view to be created
// - X1, Y1, X2, Y2: coordination in which view will be create
//                   view's size or two position in which two views exist
// - ElementKind:    kind(or type)'s name of element to be created
// - NamePrefix:     prefix name of model to be created
// - Argument:       additional arguement to create model element
// -----------------------------------------------------------------------------
function PUMLFactory.CreateElement(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
  ElementKind: string; NamePrefix: string; Argument: Integer = 0): PView;
var
  V1, V2, B1, B2, End1, End2: PView;
  Owner, E1, E2: PModel;
  V: PView;
  M: PModel;
begin
  E1 := nil; E2 := nil;
  Owner := DiagramView.Diagram.DiagramOwner;
  V1 := DiagramView.GetViewAt(DiagramView.Canvas, X1, Y1);
  V2 := DiagramView.GetViewAt(DiagramView.Canvas, X2, Y2);
  // Stimulus in Collaboration Diagram
  if (ElementKind = EK_STIMULUS) and (DiagramView.Diagram is PUMLCollaborationDiagram) then begin
    CheckParamError(V1 is PUMLLinkView);
    End1 := V1;
    End2 := nil;
    E1 := (V1 as PUMLLinkView).Tail.Model;
    E2 := (V1 as PUMLLinkView).Head.Model;
    M := CreateModel(Owner, ElementKind, NamePrefix, Argument, E1, E2);
    V := CreateView(DiagramView, M, ElementKind + 'View', End1, End2, X1, Y1, X2, Y2);
    (M as PUMLStimulus).CommunicationLink := End1.Model as PUMLLink;
  end
  // Message in Collaboration Role Diagram
  else if (ElementKind = EK_MESSAGE) and (DiagramView.Diagram is PUMLCollaborationRoleDiagram) then begin
    CheckParamError(V1 is PUMLAssociationRoleView);
    End1 := V1;
    End2 := nil;
    E1 := (V1 as PUMLAssociationRoleView).Tail.Model;
    E2 := (V1 as PUMLAssociationRoleView).Head.Model;
    M := CreateModel(Owner, ElementKind, NamePrefix, Argument, E1, E2);
    V := CreateView(DiagramView, M, ElementKind + 'View', End1, End2, X1, Y1, X2, Y2);
    (M as PUMLMessage).CommunicationConnection := End1.Model as PUMLAssociationRole;
  end
  // Stimulus in Sequence Diagram
  else if (ElementKind = EK_STIMULUS) and (DiagramView.Diagram is PUMLSequenceDiagram) then begin
    CheckParamError((V1 is PUMLSeqObjectView) or (V1 is PUMLActivationView){ or (V1 is PUMLSeqStimulusView)});
    CheckParamError((V2 is PUMLSeqObjectView) or (V2 is PUMLActivationView){ or (V2 is PUMLSeqStimulusView)});
    End1 := V1; End2 := V2;
    if V1 is PUMLActivationView then begin
      B1 := DiagramView.GetBottomViewAt(DiagramView.Canvas, X1, Y1);
      if B1 is PUMLSeqObjectView then End1 := B1;
    end;
    if V2 is PUMLActivationView then begin
      B2 := DiagramView.GetBottomViewAt(DiagramView.Canvas, X2, Y2);
      if B2 is PUMLSeqObjectView then End2 := B2;
    end;
    // Todo. if V1, V2 = PUMLSeqStimulusView ?
    if End1 <> nil then E1 := End1.Model;
    if End2 <> nil then E2 := End2.Model;
    M := CreateModel(Owner, ElementKind, NamePrefix, Argument, E1, E2);
    V := CreateView(DiagramView, M, ElementKind + 'View', End1, End2, X1, Y1, X2, Y2);
  end
  // Message in SequenceRole Diagram
  else if (ElementKind = EK_MESSAGE) and (DiagramView.Diagram is PUMLSequenceRoleDiagram) then begin
    CheckParamError((V1 is PUMLSeqClassifierRoleView) or (V1 is PUMLActivationView){ or (V1 is PUMLSeqMessageView)});
    CheckParamError((V2 is PUMLSeqClassifierRoleView) or (V2 is PUMLActivationView){ or (V2 is PUMLSeqMessageView)});
    End1 := V1; End2 := V2;
    if V1 is PUMLActivationView then begin
      B1 := DiagramView.GetBottomViewAt(DiagramView.Canvas, X1, Y1);
      if B1 is PUMLSeqClassifierRoleView then End1 := B1;
    end;
    if V2 is PUMLActivationView then begin
      B2 := DiagramView.GetBottomViewAt(DiagramView.Canvas, X2, Y2);
      if B2 is PUMLSeqClassifierRoleView then End2 := B2;
    end;
    // Todo. if V1, V2 = PUMLSeqMessageView ?
    if End1 <> nil then E1 := End1.Model;
    if End2 <> nil then E2 := End2.Model;
    M := CreateModel(Owner, ElementKind, NamePrefix, Argument, E1, E2);
    V := CreateView(DiagramView, M, ElementKind + 'View', End1, End2, X1, Y1, X2, Y2);
  end
  // Creating CompositeState(State), SubmachineState, Pseudostate, FinalState on a CompositeState
  else if ((ElementKind = EK_COMPOSITESTATE) or (ElementKind = EK_STATE)
    or (ElementKind = EK_PSEUDOSTATE) or (ElementKind = EK_FINALSTATE)
    or (ElementKind = EK_SUBMACHINESTATE)) and (V1 is PUMLStateView) then
  begin
    Owner := (V1 as PUMLStateView).Model;
    M := CreateModel(Owner, ElementKind, NamePrefix, Argument);
    V := CreateView(DiagramView, M, ElementKind + 'View', nil, nil, X1, Y1, X2, Y2);
    (V1 as PUMLStateView).AddContainedView(V);
  end
  // Port
  else if ElementKind = EK_PORT then
  begin
    CheckParamError((V1 <> nil) and (V1.Model <> nil) and (V1.Model is PUMLClassifier));
    Owner := V1.Model;
    M := CreateModel(Owner, ElementKind, Argument);
    V := CreateView(DiagramView, M, ElementKind + 'View', nil, nil, X1, Y1, X2, Y2, Argument);
  end
  // Part
  else if ElementKind = EK_PART then
  begin
    CheckParamError((V1 <> nil) and (V1.Model <> nil) and (V1.Model is PUMLClassifier));
    Owner := V1.Model;
    M := CreateModel(Owner, EK_ATTRIBUTE, Argument);
    V := CreateView(DiagramView, M, VK_PART_VIEW, nil, nil, X1, Y1, X2, Y2, Argument);
  end
  // CombinedFragment
  else if ElementKind = EK_COMBINEDFRAGMENT then
  begin
    if V1 is PUMLInteractionOperandView then
      Owner := (V1 as PUMLInteractionOperandView).Model;
    M := CreateModel(Owner, ElementKind, Argument);
    V := CreateView(DiagramView, M, ElementKind + 'View', nil, nil, X1, Y1, X2, Y2, Argument);
    if V1 is PUMLInteractionOperandView then
      (V1 as PUMLInteractionOperandView).AddContainedView(V);
    CreateElement(DiagramView, X1, Y1, X2, Y2, EK_INTERACTIONOPERAND);
  end
  // InteractionOperand
  else if ElementKind = EK_INTERACTIONOPERAND then
  begin
    CheckParamError((V1 is PUMLCombinedFragmentView) or ((V1 is PUMLInteractionOperandView)
      and (V1.ContainerView is PUMLCombinedFragmentView)));
    if (V1 is PUMLInteractionOperandView) and (V1.ContainerView is PUMLCombinedFragmentView) then
      Owner := V1.ContainerView.Model
    else
      Owner := V1.Model;
    M := CreateModel(Owner, ElementKind, Argument);
    V := CreateView(DiagramView, M, ElementKind + 'View', nil, nil, X1, Y1, X2, Y2, Argument);
    if (V1 is PUMLinteractionOperandView) and (V1.ContainerView is PUMLCombinedFragmentView) then
      V1.ContainerView.AddContainedView(V)
    else
      V1.AddContainedView(V);
  end
  else begin
    End1 := V1;
    End2 := V2;
    if End1 <> nil then E1 := End1.Model;
    if End2 <> nil then E2 := End2.Model;
    M := CreateModel(Owner, ElementKind, NamePrefix, Argument, E1, E2);
    V := CreateView(DiagramView, M, ElementKind + 'View', End1, End2, X1, Y1, X2, Y2, Argument);
  end;
  Result := V;
end;

// PUMLFactory
////////////////////////////////////////////////////////////////////////////////

initialization
  // Initialize option variables.
  OptionDefaultAttrVisibility := vkPublic;
  OptionDefaultOperVisibility := vkPublic;
  OptionDefaultFillColor := clWhite;
  OptionDefaultLineColor := clBlack;
  OptionDefaultFontFace := 'Tahoma';
  OptionDefaultFontSize :=  8;
  OptionDefaultFontColor := clBlack;
  OptionLineStyle := lsOblique;
  OptionStereotypeDisplay := sdkLabel;
  OptionShowParentName := False;
  OptionAutoResize := False;
  OptionShowCompartmentVisibility := True;
  OptionShowCompartmentStereotype := True;
  OptionShowOperationSignature := True;
  OptionShowProperty := False;
  OptionSuppressAttributes := False;
  OptionSuppressOperations := False;
  OptionEnumerationSuppressLiterals := False;
  OptionActorStereotypeDisplay := sdkLabel;
  OptionActorSuppressAttributes := True;
  OptionActorSuppressOperations := True;
  OptionUseCaseStereotypeDisplay := sdkLabel;
  OptionUseCaseSuppressAttributes := True;
  OptionUseCaseSuppressOperations := True;
  OptionInterfaceStereotypeDisplay := sdkIcon;
  OptionInterfaceSuppressAttributes := True;
  OptionInterfaceSuppressOperations := True;
  OptionArtifactStereotypeDisplay := sdkDecoration;
  OptionArtifactSuppressAttributes := True;
  OptionArtifactSuppressOperations := True;
  OptionComponentStereotypeDisplay := sdkLabel;
  OptionNodeStereotypeDisplay := sdkLabel;
  OptionShowSequenceNumber := True;
  OptionShowActivation := True;
  OptionMessageSignature := mskNameAndType;
  OptionWordWrapByDefault := False;
  // Create UMLFactory instance
  UMLFactory := PUMLFactory.Create;
finalization
  UMLFactory.Free;
end.

