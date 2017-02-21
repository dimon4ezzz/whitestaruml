unit Handlers;

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
  Types, Classes, Controls,
  BasicClasses, GraphicClasses, Core, ViewCore, UMLModels, UMLViews, DiagramEditors;

  const

  // Mavigation items

  TEXT_CREATE_HANDLER = 'TextCreateHandler';
  NOTE_CREATE_HANDLER = 'NoteCreateHandler';
  NOTE_LINK_CREATE_HANDLER = 'NoteLinkCreateHandler';
  SUBSYSTEM_CREATE_HANDLER = 'SubsystemCreateHandler';
  PACKAGE_CREATE_HANDLER = 'PackageCreateHandler';
  USE_CASE_CREATE_HANDLER = 'UseCaseCreateHandler';
  ACTOR_CREATE_HANDLER = 'ActorCreateHandler';
  CLASS_CREATE_HANDLER = 'ClassCreateHandler';
  INTERFACE_CREATE_HANDLER = 'InterfaceCreateHandler';
  ENUMERATION_CREATE_HANDLER = 'EnumerationCreateHandler';
  SIGNAL_CREATE_HANDLER = 'SignalCreateHandler';
  EXCEPTION_CREATE_HANDLER = 'ExceptionCreateHandler';
  COMPONENT_CREATE_HANDLER = 'ComponentCreateHandler';
  COMPONENT_INSTANCE_CREATE_HANDLER = 'ComponentInstanceCreateHandler';
  NODE_CREATE_HANDLER = 'NodeCreateHandler';
  NODE_INSTANCE_CREATE_HANDLER = 'NodeInstanceCreateHandler';
  ASSOCIATION_CREATE_HANDLER = 'AssociationCreateHandler';
  DIRECTED_ASSOCIATION_HANDLER = 'DirectedAssociationHandler';
  AGGREGATION_HANDLER = 'AggregationHandler';
  COMPOSITION_HANDLER = 'CompositionHandler';
  GENERALIZATION_CREATE_HANDLER = 'GeneralizationCreateHandler';
  DEPENDENCY_CREATE_HANDLER = 'DependencyCreateHandler';
  REALIZATION_CREATE_HANDLER = 'RealizationCreateHandler';
  ASSOCIATION_CLASS_CREATE_HANDLER = 'AssociationClassCreateHandler';
  INCLUDE_CREATE_HANDLER = 'IncludeCreateHandler';
  EXTEND_CREATE_HANDLER = 'ExtendCreateHandler';
  OBJECT_CREATE_HANDLER = 'ObjectCreateHandler';
  CLASSIFIER_ROLE_CREATE_HANDLER = 'ClassifierRoleCreateHandler';
  ASSOCIATION_ROLE_CREATE_HANDLER = 'AssociationRoleCreateHandler';
  SELF_ASSOCIATION_ROLE_CREATE_HANDLER = 'SelfAssociationRoleCreateHandler';
  LINK_CREATE_HANDLER = 'LinkCreateHandler';
  SELF_LINK_CREATE_HANDLER = 'SelfLinkCreateHandler';
  MESSAGE_CREATE_HANDLER = 'MessageCreateHandler';
  FORWARD_MESSAGE_CREATE_HANDLER = 'ForwardMessageCreateHandler';
  REVERSE_MESSAGE_CREATE_HANDLER = 'ReverseMessageCreateHandler';
  SELF_MESSAGE_CREATE_HANDLER = 'SelfMessageCreateHandler';
  STIMULUS_CREATE_HANDLER = 'StimulusCreateHandler';
  FORWARD_STIMULUS_CREATE_HANDLER = 'ForwardStimulusCreateHandler';
  REVERSE_STIMULUS_CREATE_HANDLER = 'ReverseStimulusCreateHandler';
  SELF_STIMULUS_CREATE_HANDLER = 'SelfStimulusCreateHandler';
  STATE_CREATE_HANDLER = 'StateCreateHandler';
  SUBMACHINE_STATE_CREATE_HANDLER = 'SubmachineStateCreateHandler';
  ACTIVITY_CREATE_HANDLER = 'ActivityCreateHandler';
  SUBACTIVITY_STATE_CREATE_HANDLER = 'SubactivityStateCreateHandler';
  INITIAL_STATE_CREATE_HANDLER = 'InitialStateCreateHandler';
  FINAL_STATE_CREATE_HANDLER = 'FinalStateCreateHandler';
  JUNCTION_POINT_CREATE_HANDLER = 'JunctionPointCreateHandler';
  CHOICE_POINT_CREATE_HANDLER = 'ChoicePointCreateHandler';
  SHALLOW_HISTORY_CREATE_HANDLER = 'ShallowHistoryCreateHandler';
  DEEP_HISTORY_CREATE_HANDLER = 'DeepHistoryCreateHandler';
  SYNCHRONIZATION_CREATE_HANDLER = 'SynchronizationCreateHandler';
  DECISION_CREATE_HANDLER = 'DecisionCreateHandler';
  TRANSITION_CREATE_HANDLER = 'TransitionCreateHandler';
  SELF_TRANSITION_CREATE_HANDLER = 'SelfTransitionCreateHandler';
  VERTICAL_SWIMLANE_CREATE_HANDLER = 'VerticalSwimlaneCreateHandler';
  HORIZONTAL_SWIMLANE_CREATE_HANDLER = 'HorizontalSwimlaneCreateHandler';
  OBJECT_FLOW_STATE_CREATE_HANDLER = 'ObjectFlowStateCreateHandler';
  FLOW_FINAL_STATE_CREATE_HANDLER = 'FlowFinalStateCreateHandler';
  SYSTEM_BOUNDARY_CREATE_HANDLER = 'SystemBoundaryCreateHandler';
  SIGNAL_ACCEPT_STATE_CREATE_HANDLER = 'SignalAcceptStateCreateHandler';
  SIGNAL_SEND_STATE_CREATE_HANDLER = 'SignalSendStateCreateHandler';
  ARTIFACT_CREATE_HANDLER = 'ArtifactCreateHandler';
  PORT_CREATE_HANDLER = 'PortCreateHandler';
  PART_CREATE_HANDLER = 'PartCreateHandler';
  CONNECTOR_CREATE_HANDLER = 'ConnectorCreateHandler';
  COMBINED_FRAGMENT_CREATE_HANDLER = 'CombinedFragmentCreateHandler';
  INTERACTION_OPERAND_CREATE_HANDLER = 'InteractionOperandCreateHandler';
  RECTANGLE_CREATE_HANDLER = 'RectangleCreateHandler';
  ELLIPSE_CREATE_HANDLER = 'EllipseCreateHandler';
  ROUND_RECT_CREATE_HANDLER = 'RoundRectCreateHandler';
  LINE_CREATE_HANDLER = 'LineCreateHandler';
  IMAGE_CREATE_HANDLER = 'ImageCreateHandler';
  FRAME_CREATE_HANDLER = 'FrameCreateHandler';
  SELECT_HANDLER = 'SelectHandler';


type
  // Forward declarations
  PActionProcessor = class;
  PSelectHandler = class;
  PCreateHandler = class;
  PManipulator = class;
  PManipulatorBinder = class;
  PManipulatableNotifier = class;
  PContainmentHandlingProxy = class;

  // Enumeration types
  PSelectMode = (smNone, smSelectArea, smIndividual, smAdditional, smGrouping);
  PSkeletonPaintingKind = (spRect, spLine);
  PEdgeSelectLocation = (slTail, slHead, slLine);
  PDirectionKind = (dkLeft, dkRight, dkUp, dkDown);

  // Event types
  PElementCreateHandlingEvent = procedure(Sender: TObject; HandlerName: string; X1, Y1, X2, Y2: Integer) of object;
  PViewSelectingEvent = procedure(AView: PView) of object;
  PAreaSelectingEvent = procedure(X1, Y1, X2, Y2: Integer) of object;
  PQuickDlgPopupEvent = procedure (AView: PView; DX, DY: Integer) of object;
  PViewMovingEvent = procedure(AView: PView; DX, DY: Integer) of object;
  PViewContainerChangingEvent = procedure(AView: PView; DX, DY: Integer; AContainerView: PView) of object;
  PSelectedViewsMovingEvent = procedure(DX, DY: Integer) of object;
  PSelectedViewsContainerChangingEvent = procedure(DX, DY: Integer; AContainerView: PView) of object;
  PParasiticViewMovingEvent = procedure(AParasiticView: PParasiticView; DX, DY: Extended) of object;
  PNodeResizingEvent = procedure(ANode: PNodeView; Left, Top, Right, Bottom: Integer) of object;
  PEdgeModifyingEvent = procedure(AEdge: IModifiableEdge; Points: PPoints) of object;
  PEdgeReconnectingEvent = procedure(AEdge: PEdgeView; Points: PPoints; NewParticipant: PView; IsTailSide: Boolean) of object;
  PViewMouseEvent = procedure(Sender: TObject; AView: PView; X, Y: Integer) of object;

  // PHandler
  PHandler = class
  protected
    FHandlerName: string;
    FContainerView: PView;
    procedure CheckContainingBox(Sender: PDiagramView; Canvas: PCanvas; X, Y: Integer); virtual; abstract;
  public
    // Properties
    property HandlerName: string read FHandlerName;
    // Mouse down/up/move services
    procedure MouseDown(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); virtual; abstract;
    procedure MouseMove(Sender: PDiagramEditor; Canvas: PCanvas; Shift: TShiftState; X, Y: Integer); virtual; abstract;
    procedure MouseUp(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); virtual; abstract;
    // Key press/down/up services
    procedure KeyPress(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Char); virtual; abstract;
    procedure KeyPressedHeld(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Repetitions: Integer); virtual; abstract;
    procedure KeyDown(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState); virtual; abstract;
    procedure KeyUp(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState); virtual; abstract;
  end;

  // PSelectHandler
  PSelectHandler = class(PHandler)
  private
    FView: PView;
    FDragged: Boolean;
    FMode: PSelectMode;
    FBoundingBox: TRect;
    FX1, FY1, FX2, FY2: Integer;  // for not grided coordinates
    GX1, GY1, GX2, GY2: Integer;  // for grided coordinates
    FManipulator: PManipulator;
    FManipulatorBinder: PManipulatorBinder;
    FManipulatableNotifier: PManipulatableNotifier;
    FDoubleClicked: Boolean;
    // For Paint Scrolled Area
    FRangeRect: TRect;
    // For handling containment
    FContainmentHandlingProxy: PContainmentHandlingProxy;
    // Events Fields (View selecting events)
    FOnViewSelecting: PViewSelectingEvent;
    FOnViewDeselecting: TNotifyEvent;
    FOnAdditionalViewSelecting: TNotifyEvent;
    FOnAreaSelecting: PAreaSelectingEvent;
    FOnQuickDlgPopup: PQuickDlgPopupEvent;
    FOnViewDoubleClicked: PViewMouseEvent;
    // Events Fields (View modifying events)
    FOnViewMoving: PViewMovingEvent;
    FOnViewContainerChanging: PViewContainerChangingEvent;
    FOnSelectedViewsMoving: PSelectedViewsMovingEvent;
    FOnSelectedViewsContainerChanging: PSelectedViewsContainerChangingEvent;
    FOnParasiticViewMoving: PParasiticViewMovingEvent;
    FOnNodeResizing: PNodeResizingEvent;
    FOnEdgeModifying: PEdgeModifyingEvent;
    FOnEdgeReconnecting: PEdgeReconnectingEvent;
    // Event making procedures (View selecting related)
    procedure SelectView(View: PView);
    procedure DeselectView(View: PView);
    procedure SelectAdditionalView(View: PView);
    procedure SelectArea(X1, Y1, X2, Y2: Integer);
    // Event making procedures (View modifying related)
    procedure MoveView(View: PView; DX, DY: Integer);
    procedure ChangeViewContainer(View: PView; DX, DY: Integer; AContainerView: PView);
    procedure MoveSelectedViews(DX, DY: Integer);
    procedure ChangeSelectedViewsContainer(DX, DY: Integer; AContainerView: PView);
    procedure MoveParasiticView(AParasiticView: PParasiticView; DX, DY: Extended);
    procedure ResizeNode(Node: PNodeView; Left, Top, Right, Bottom: Integer);
    procedure ModifyEdge(Edge: IModifiableEdge; Points: PPoints);
    procedure ReconnectEdge(Edge: PEdgeView; Points: PPoints; NewParticipant: PView; IsTailSide: Boolean);
    // For Paint Scrolled Area
    procedure DrawRangeRect(ADiagramEditor: PDiagramEditor; Canvas: PCanvas);
    // Etc (utility)
    function HasTheSameContainerView(AViewSet: POrderedSet): Boolean;
    function IsPointInSelectionLine(Sender: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer): Boolean;
  protected
    procedure CheckContainingBox(Sender: PDiagramView; Canvas: PCanvas; X, Y: Integer); override;
  public
    constructor Create(HandlerName: string);
    destructor Destroy; override;
    // Mouse down/up/move services
    procedure MouseDown(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Sender: PDiagramEditor; Canvas: PCanvas; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    // Key press/down/up services
    procedure KeyPress(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Char); override;
    procedure KeyPressedHeld(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Repetitions: Integer); override;
    procedure KeyDown(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState); override;
    // Events (View selecting related)
    property OnViewSelecting: PViewSelectingEvent write FOnViewSelecting;
    property OnViewDeselecting: TNotifyEvent write FOnViewDeselecting;
    property OnAdditionalViewSelecting: TNotifyEvent write FOnAdditionalViewSelecting;
    property OnAreaSelecting: PAreaSelectingEvent write FOnAreaSelecting;
    property OnQuickDlgPopup: PQuickDlgPopupEvent write FOnQuickDlgPopup;
    // Events (View modifying related)
    property OnViewMoving: PViewMovingEvent write FOnViewMoving;
    property OnViewContainerChanging: PViewContainerChangingEvent write FOnViewContainerChanging;
    property OnSelectedViewsMoving: PSelectedViewsMovingEvent write FOnSelectedViewsMoving;
    property OnSelectedViewsContainerChanging: PSelectedViewsContainerChangingEvent write FOnSelectedViewsContainerChanging;
    property OnParasiticViewMoving: PParasiticViewMovingEvent write FOnParasiticViewMoving;
    property OnNodeResizing: PNodeResizingEvent write FOnNodeResizing;
    property OnEdgeModifying: PEdgeModifyingEvent write FOnEdgeModifying;
    property OnEdgeReconnecting: PEdgeReconnectingEvent write FOnEdgeReconnecting;
    property OnViewDoubleClicked: PViewMouseEvent read FOnViewDoubleClicked write FOnViewDoubleClicked;
  end;

  // PCreateHandler
  PCreateHandler = class(PHandler)
  private
    FX1, FY1, FX2, FY2: Integer;
    FSkeletonPaintingKind: PSkeletonPaintingKind;
    FContainerCandidates: array of PClass;
    // For Paint Scrolled Area
    FSkeletonRect: TRect;
    // Event Fields
    FOnElementCreating: PElementCreateHandlingEvent;
//    FOnElementCreatingAbort: PElementCreatingAbortEvent;
    procedure PaintSkeleton(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
    procedure CreateElement(DiagramView: PDiagramView; Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
    // For Paint Scrolled Area
    procedure DrawNodeSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas);
    procedure DrawEdgeSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas);
  protected
    procedure CheckContainingBox(Sender: PDiagramView; Canvas: PCanvas; X, Y: Integer); override;
  public
    constructor Create(HandlerName: string; const ContainerCandidates: array of PClass; SkeletonPaintingKind: PSkeletonPaintingKind);
    // Mouse down/up/move services
    procedure MouseDown(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Sender: PDiagramEditor; Canvas: PCanvas; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    // Key press/down/up services
    procedure KeyPress(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Char); override;
    procedure KeyPressedHeld(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Repetitions: Integer); override;
    procedure KeyDown(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState); override;
    property OnElementCreating: PElementCreateHandlingEvent read FOnElementCreating write FOnElementCreating;
//    property OnElementCreatingAbort: PElementCreatingAbortEvent read FOnElementCreatingAbort write FOnElementCreatingAbort;
  end;

  // PActionProcessor
  PActionProcessor = class
  private
    FHandlerList: TList;
    FActiveHandler: PHandler;
    // Event Fields (Model/View creating event)
    FOnElementCreating: PElementCreateHandlingEvent;
//    FOnElementCreatingAbort: PElementCreatingAbortEvent;
    // Event Fields (View selecting events)
    FOnViewSelecting: PViewSelectingEvent;
    FOnViewDeselecting: TNotifyEvent;
    FOnAllViewsDeselecting: TNotifyEvent;
    FOnAdditionalViewSelecting: TNotifyEvent;
    FOnAreaSelecting: PAreaSelectingEvent;
    FOnQuickDlgPopup: PQuickDlgPopupEvent;
    FOnViewDoubleClicked: PViewMouseEvent;
    // Event Fields (View modifying events)
    FOnViewMoving: PViewMovingEvent;
    FOnViewContainerChanging: PViewContainerChangingEvent;
    FOnSelectedViewsMoving: PSelectedViewsMovingEvent;
    FOnSelectedViewsContainerChanging: PSelectedViewsContainerChangingEvent;
    FOnParasiticViewMoving: PParasiticViewMovingEvent;
    FOnNodeResizing: PNodeResizingEvent;
    FOnEdgeModifying: PEdgeModifyingEvent;
    FOnEdgeReconnecting: PEdgeReconnectingEvent;
    // Event Handler (on CreateHandler's event)
    procedure ElementCreatingHandler(Sender: TObject; HandlerName: string; X1, Y1, X2, Y2: Integer);
//    procedure ElementCreatingAbortHandler(Sender: TObject);
    // Event Handlers (on SelectHandler's view selecting events)
    procedure ViewSelectingHandler(AView: PView);
    procedure ViewDeselectingHandler(Sender: TObject);
    // procedure AllViewsDeselectingHandler(Sender: TObject);
    procedure AdditionalViewSelectingHandler(Sender: TObject);
    procedure AreaSelectingHandler(X1, Y1, X2, Y2: Integer);
    procedure QuickDlgPopupHandler(AView: PView; X, Y: Integer);
    procedure ViewDoubleClickedHandler(Sender: TObject; AView: PView; X, Y: Integer);
    // Event Handlers (on SelectHandler's view modifying events)
    procedure ViewMovingHandler(View: PView; DX, DY: Integer);
    procedure ViewContainerChangingHandler(View: PView; DX, DY: Integer; AContainerView: PView);
    procedure SelectedViewsMovingHandler(DX, DY: Integer);
    procedure SelectedViewsContainerChangingHandler(DX, DY: Integer; AContainerView: PView);
    procedure ParasiticViewMovingHandler(AParasiticView: PParasiticView; DX, DY: Extended);
    procedure NodeResizingHandler(Node: PNodeView; Left, Top, Right, Bottom: Integer);
    procedure EdgeModifyingHandler(Edge: IModifiableEdge; Points: PPoints);
    procedure EdgeReconnectingHandler(Edge: PEdgeView; Points: PPoints; NewParticipant: PView; IsTailSide: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
    // CreateHandler adding service
    procedure AddCreateHandler(HandlerName: string; const ContainerCandidates: array of PClass;
      SkeletonPaintingKind: PSkeletonPaintingKind);
    // Handler activating service
    procedure ActivateHandler(HandlerName: string);
    // Mouse down/up/move services
    procedure MouseDown(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseUp(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseMove(Sender: PDiagramEditor; Canvas: PCanvas; Shift: TShiftState; X, Y: Integer);
    // Key press/down/up services
    procedure KeyPress(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Char);
    procedure KeyPressedHeld(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Repetitions: Integer);
    procedure KeyDown(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState);
    procedure KeyUp(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState);
    // Properties
    property ActiveHandler: PHandler read FActiveHandler;
    // Event (Model/View creating event)
    property OnElementCreating: PElementCreateHandlingEvent write FOnElementCreating;
    // property OnElementCreatingAbort: PElementCreatingAbortEvent write FOnElementCreatingAbort;
    // Events (View selecting events)
    property OnViewSelecting: PViewSelectingEvent write FOnViewSelecting;
    property OnViewDeselecting: TNotifyEvent write FOnViewDeselecting;
    property OnAllViewsDeselecting: TNotifyEvent write FOnAllViewsDeselecting;
    property OnAdditionalViewSelecting: TNotifyEvent write FOnAdditionalViewSelecting;
    property OnAreaSelecting: PAreaSelectingEvent write FOnAreaSelecting;
    property OnQuickDlgPopup: PQuickDlgPopupEvent write FOnQuickDlgPopup;
    property OnViewDoubleClicked: PViewMouseEvent read FOnViewDoubleClicked write FOnViewDoubleClicked;
    // Evnets (View modifying events)
    property OnViewMoving: PViewMovingEvent write FOnViewMoving;
    property OnViewContainerChanging: PViewContainerChangingEvent write FOnViewContainerChanging;
    property OnSelectedViewsMoving: PSelectedViewsMovingEvent write FOnSelectedViewsMoving;
    property OnSelectedViewsContainerChanging: PSelectedViewsContainerChangingEvent write FOnSelectedViewsContainerChanging;
    property OnParasiticViewMoving: PParasiticViewMovingEvent write FOnParasiticViewMoving;
    property OnNodeResizing: PNodeResizingEvent write FOnNodeResizing;
    property OnEdgeModifying: PEdgeModifyingEvent write FOnEdgeModifying;
    property OnEdgeReconnecting: PEdgeReconnectingEvent write FOnEdgeReconnecting;
  end;

  // PManipulator
  PManipulator = class abstract
  private
    FHandler: PSelectHandler;
  protected
    FX1, FY1, FX2, FY2: Integer;
    FDragged: Boolean;
    procedure BeginManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer); virtual; abstract;
    procedure PaintSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas); virtual; abstract;
    procedure MoveSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; var DX: Integer; var DY: Integer); virtual; abstract;
    procedure EndManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; DX, DY: Integer); virtual; abstract;
  public
    constructor Create(Handler: PSelectHandler);
    procedure MouseDown(Sender: PDiagramEditor; AView: PView; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseMove(Sender: PDiagramEditor; AView: PView; Canvas: PCanvas; Shift: TShiftState; X, Y: Integer);
    procedure MouseUp(Sender: PDiagramEditor; AView: PView; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  end;

  // PNodeManipulator
  PNodeManipulator = class(PManipulator)
  protected
    FMovable: PMovableMode;
    FSizable: PSizableMode;
    FSelectedPtType: PCornerType;
    FLeft, FRight, FTop, FBottom: Integer;
    FMinRect: TRect;
    FOriginRect: TRect;
    FMinX, FMinY: Integer;
    FRatio: Extended;
    procedure RestrictNode(R: TRect);
  protected
    function GetPermittedRegion(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView): TRect; virtual;
    procedure BeginManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer); override;
    procedure PaintSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas); override;
    procedure MoveSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; var DX: Integer; var DY: Integer); override;
    procedure EndManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; DX, DY: Integer); override;
  end;

  // PEdgeManipulator
  PEdgeManipulator = class(PManipulator)
  private
    FPoints: PPoints;
    FOriginPoints: PPoints;
    FSelectedIndex: Integer;
    FEdgeSelectLocation: PEdgeSelectLocation;
    FStyle: PLineStyleKind;
    // not used now.
    procedure FitToGrid(APoints: PPoints; AGridFactor: PGridFactor);
  protected
    procedure BeginManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer); override;
    procedure PaintSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas); override;
    procedure MoveSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; var DX: Integer; var DY: Integer); override;
    procedure EndManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; DX, DY: Integer); override;
  public
    constructor Create(Handler: PSelectHandler);
    destructor Destroy; override;
  end;

  // PParasiticManipulator
  PParasiticManipulator = class(PNodeManipulator)
  protected
    procedure EndManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; DX, DY: Integer); override;
  end;

  // PUMLCustomSeqMessageManipulator
  PUMLCustomSeqMessageManipulator = class(PManipulator)
  private
    X1, Y1, X2, Y2: Integer;
    FSelectedIndex: Integer;
  protected
    procedure BeginManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer); override;
    procedure PaintSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas); override;
    procedure MoveSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; var DX: Integer; var DY: Integer); override;
    procedure EndManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; DX, DY: Integer); override;
  end;

  // PUMLCustomColMessageManipulator
  PUMLCustomColMessageManipulator = class(PParasiticManipulator)
  private
    HeadPoint, TailPoint: TPoint;
  protected
    procedure BeginManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer); override;
    procedure PaintSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas); override;
    procedure MoveSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; var DX: Integer; var DY: Integer); override;
    procedure EndManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; DX, DY: Integer); override;
  end;

  // PUMLQualifiedAssociationEdgeManipulator
  PUMLQualifiedAssociationEdgeManipulator = class(PEdgeManipulator)
  protected
    procedure BeginManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer); override;
  end;

  // PUMLPortManipulator
  PUMLPortManipulator = class(PNodeManipulator)
  protected
    function GetPermittedRegion(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView): TRect; override;
  end;

  // PEdgeManipulator
  PLineManipulator = class(PManipulator)
  private const
    NO_ENDPOINT_SELECTED = -1;
  private
    FPoints: PPoints;
    FOriginPoints: PPoints;
    FSelectedIndex: Integer;
    FEdgeSelectLocation: PEdgeSelectLocation;
    // not used now.
    procedure FitToGrid(APoints: PPoints; AGridFactor: PGridFactor);
  protected
    procedure BeginManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer); override;
    procedure PaintSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas); override;
    procedure MoveSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; var DX: Integer; var DY: Integer); override;
    procedure EndManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; DX, DY: Integer); override;
  public
    constructor Create(Handler: PSelectHandler);
    destructor Destroy; override;
  end;

  // PManipulatorBinder
  PManipulatorBinder = class
  private
    FNodeManipulator: PNodeManipulator;
    FEdgeManipulator: PEdgeManipulator;
    FParasiticManipulator: PParasiticManipulator;
    FCustomSeqMessageManipulator: PUMLCustomSeqMessageManipulator;
    FCustomColMessageManipulator: PUMLCustomColMessageManipulator;
    FQualifiedAssociationEdgeManipulator: PUMLQualifiedAssociationEdgeManipulator;
    FPortManipulator: PUMLPortManipulator;
    FLineManipulator: PLineManipulator;
  public
    constructor Create(Handler: PSelectHandler);
    destructor Destroy; override;
    function Bind(View: PView): PManipulator;
  end;

  // PManupulatableNotifier
  // (Set cursor when user move mouse point on view)
  PManipulatableNotifier = class
  public
    procedure MouseMove(Sender: PDiagramEditor; Canvas: PCanvas; Shift: TShiftState; X, Y: Integer);
  end;

  // PContainmentHandlingProxy (Singleton Class)
  PContainmentHandlingProxy = class
  private
    FActivated: Boolean;
    FContainerView: PView;
    function CanBeContainedAt(AView, TargetView: PView): Boolean; overload;
    function CanBeContainedAt(AViewSet: POrderedSet; TargetView: PView): Boolean; overload;
  public
    constructor Create;
    procedure BeginHandling;
    procedure MouseMoveHandling(Canvas: PCanvas; AView: PView; TargetView: PView); overload;
    procedure MouseMoveHandling(Canvas: PCanvas; AViewSet: POrderedSet; TargetView: PView); overload;
    procedure MouseUpHandling(Canvas: PCanvas);
    procedure EndHandling;
    property Activated: Boolean read FActivated;
    property ContainerView: PView read FContainerView;
  end;

  // auxiliary functions
  function GetDistance(NodeView1, NodeView2: PNodeView): Integer;
  function GetCenterPoint(AMsgView: PUMLCustomSeqMessageView): TPoint;
  function IsLinked(MsgA, MsgB: PUMLCustomSeqMessageView): Boolean;
  function IsOverlapedXPos(MsgA, MsgB: PUMLCustomSeqMessageView): Boolean;
  function GetPrevSeqObjectView(AObjView: PUMLCustomSeqObjectView): PUMLCustomSeqObjectView;
  function GetNextSeqObjectView(AObjView: PUMLCustomSeqObjectView): PUMLCustomSeqObjectView;
  function GetFirstSeqMessageView(AObjView: PUMLCustomSeqObjectView): PUMLCustomSeqMessageView;
  function GetNextSeqMessageView(AMsgView: PUMLCustomSeqMessageView): PUMLCustomSeqMessageView;
  function GetPrevSeqMessageView(AMsgView: PUMLCustomSeqMessageView): PUMLCustomSeqMessageView;
  function GetUpperSeqMessageView(AMsgView: PUMLCustomSeqMessageView): PUMLCustomSeqMessageView;
  function GetLowerSeqMessageView(AMsgView: PUMLCustomSeqMessageView): PUMLCustomSeqMessageView;
  function GetInvokingObjectView(AMsgView: PUMLCustomSeqMessageView): PUMLCustomSeqObjectView;
  function FindNearestSequenceView(AView: PView; Direction: PDirectionKind): PView;
  function FindNearestNodeView(ANodeView: PNodeView; Direction: PDirectionKind): PNodeView;
  function FindNearestView(AView: PView; Direction: PDirectionKind): PView;

implementation

uses
  UMLAux, UMLFacto, NavBarFrame,
  Windows, Graphics, Forms, SysUtils, Math;

////////////////////////////////////////////////////////////////////////////////
// PSelectHandler

constructor PSelectHandler.Create(HandlerName: string);
begin
  FHandlerName := HandlerName;
  FManipulatorBinder := PManipulatorBinder.Create(Self);
  FManipulatableNotifier := PManipulatableNotifier.Create;
  FContainmentHandlingProxy := PContainmentHandlingProxy.Create;
end;

destructor PSelectHandler.Destroy;
begin
  if FManipulatorBinder <> nil then FManipulatorBinder.Free;
  if FManipulatableNotifier <> nil then FManipulatableNotifier.Free;
  FContainmentHandlingProxy.Free;
  inherited;
end;

procedure PSelectHandler.SelectView(View: PView);
begin
  if Assigned(FOnViewSelecting) then FOnViewSelecting(View);
end;

procedure PSelectHandler.DeselectView(View: PView);
begin
  if Assigned(FOnViewDeselecting) then FOnViewDeselecting(View);
end;

procedure PSelectHandler.SelectAdditionalView(View: PView);
begin
  if Assigned(FOnAdditionalViewSelecting) then FOnAdditionalViewSelecting(View);
end;

procedure PSelectHandler.SelectArea(X1, Y1, X2, Y2: Integer);
begin
  if Assigned(FOnAreaSelecting) then FOnAreaSelecting(X1, Y1, X2, Y2);
end;

procedure PSelectHandler.MoveView(View: PView; DX, DY: Integer);
begin
  if Assigned(FOnViewMoving) then FOnViewMoving(View, DX, DY);
end;

procedure PSelectHandler.ChangeViewContainer(View: PView; DX, DY: Integer; AContainerView: PView);
begin
  if Assigned(FOnViewContainerChanging) then FOnViewContainerChanging(View, DX, DY, FContainmentHandlingProxy.FContainerView);
end;

procedure PSelectHandler.MoveSelectedViews(DX, DY: Integer);
begin
  if Assigned(FOnSelectedViewsMoving) then FOnSelectedViewsMoving(DX, DY);
end;

procedure PSelectHandler.ChangeSelectedViewsContainer(DX, DY: Integer; AContainerView: PView);
begin
  if Assigned(FOnSelectedViewsContainerChanging) then FOnSelectedViewsContainerChanging(DX, DY, AContainerView);
end;

procedure PSelectHandler.MoveParasiticView(AParasiticView: PParasiticView; DX, DY: Extended);
begin
  if Assigned(FOnParasiticViewMoving) then FOnParasiticViewMoving(AParasiticView, DX, DY);
end;

procedure PSelectHandler.ResizeNode(Node: PNodeView; Left, Top, Right, Bottom: Integer);
begin
  if Assigned(FOnNodeResizing) then FOnNodeResizing(Node, Left, Top, Right, Bottom);
end;

procedure PSelectHandler.ModifyEdge(Edge: IModifiableEdge; Points: PPoints);
begin
  if Assigned(FOnEdgeModifying) then FOnEdgeModifying(Edge, Points);
end;

procedure PSelectHandler.ReconnectEdge(Edge: PEdgeView; Points: PPoints; NewParticipant: PView; IsTailSide: Boolean);
begin
  if Assigned(FOnEdgeReconnecting) then FOnEdgeReconnecting(Edge, Points, NewParticipant, IsTailSide);
end;

procedure PSelectHandler.DrawRangeRect(ADiagramEditor: PDiagramEditor; Canvas: PCanvas);
begin
  DrawRange(Canvas, FRangeRect.Left, FRangeRect.Top, FRangeRect.Right, FRangeRect.Bottom);
end;

function PSelectHandler.HasTheSameContainerView(AViewSet: POrderedSet): Boolean;
var
  C: PView;
  I: Integer;
begin
  Result := True;
  if AViewSet.Count > 1 then begin
    C := (AViewSet.Items[0] as PView).ContainerView;
    for I := 1 to AViewSet.Count - 1 do
      if (AViewSet.Items[I] as PView).ContainerView <> C then begin
        Result := False;
        Exit;
      end;
  end;
end;

function PSelectHandler.IsPointInSelectionLine(Sender: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer): Boolean;
var
  ZX, ZY: Integer;
  ZR: TRect;
begin
  Result := False;
  if (AView = nil) or (not AView.Selected) then Exit;

  ZX := X;  ZY := Y;
  CoordRevTransform(Sender.ZoomFactor, NOGRID, ZX, ZY);

  if AView is PNodeView then begin
    ZR := AView.GetBoundingBox(Canvas);
    CoordTransform(Sender.ZoomFactor, NOGRID, ZR);
    if not PointInRect(ZR, Point(X, Y)) and (AView as PNodeView).ContainsPoint(Canvas, Point(ZX, ZY)) then
      Result := True;
  end
  else if AView is PEdgeView then
    Result := AView.ContainsPoint(Canvas, Point(ZX, ZY));
end;

procedure PSelectHandler.CheckContainingBox(Sender: PDiagramView; Canvas: PCanvas; X, Y: Integer);
begin
end;

// (Notice) Choice of coordinates in PSelectHandler
// -------------------------------------------------
// 1. Seleting behavior
//    - Zoom only applied coordinate
//    - Use FX1, FY1, FX2, FY2 variable
// 2. Moving behavior with multiple selected views
//    - Zoom and grid applied coordinate
//    - Use GX1, GY1, GX2, GY2 variable
// 3. Manipulating bevaior with one selected view
//    - Propagate coordinate to PManipulator as it is
//    - Convert in PManipulator or it's subclasses

procedure PSelectHandler.MouseDown(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  VS: POrderedSet;
  ZX, ZY: Integer;
  BX, BY: Integer;
  I: Integer;
begin
  if (Button <> mbLeft) and (Button <> mbRight) then Exit;

  // ZoomFactor only applied coordinates.
  ZX := X;  ZY := Y;
  CoordRevTransform(Sender.ZoomFactor, NOGRID, ZX, ZY);
  // ZoomFactor and GridFactor applied coordinates
  BX := X;  BY := Y;
  CoordRevTransform(Sender.ZoomFactor, Sender.GridFactor, BX, BY);

  FX1 := ZX;  FY1 := ZY;
  FX2 := ZX;  FY2 := ZY;
  GX1 := BX;  GY1 := BY;
  GX2 := BX;  GY2 := BY;

  FDragged := False;
  FDoubleClicked := False;

  if (Sender.DiagramView.SelectedViewCount = 1) and IsPointInSelectionLine(Sender, Canvas, Sender.DiagramView.SelectedView[0], X, Y) then
    FView := Sender.DiagramView.SelectedView[0]
  else
    FView := Sender.DiagramView.GetViewAt(Canvas, ZX, ZY);

  if Button = mbLeft then begin
    // Area selection mode
    if FView = nil then
      FMode := smSelectArea
    // Not Area selection mode
    else begin
      // View selection/deselection
      if (ssShift in Shift) then begin
        // Shift + Mouse left button down
        if FView.Selected then DeselectView(FView)
        else SelectAdditionalView(FView);
      end
      else begin
        // Only mouse left button down
        if not FView.Selected then SelectView(FView);
      end;
      // Selected View(s) modifying mode
      if (Sender.DiagramView.SelectedViewCount > 0) and (ssShift in Shift) then
        FMode := smAdditional
      else if Sender.DiagramView.SelectedViewCount = 1 then begin
        // One view selected
        FMode := smIndividual;
        if (ssDouble in Shift) and (ssLeft in Shift) then begin
          FDoubleClicked := True;
        end;          
        FManipulator := FManipulatorBinder.Bind(FView);
        // propagate mouse down event to suitable manipulator
        if FManipulator <> nil then FManipulator.MouseDown(Sender, FView, Canvas, Button, Shift, X, Y);
        // Intermin code (Refactoring needed)
        if FManipulator is PNodeManipulator then begin
          if FView.ContainerChangeable and ((FManipulator as PNodeManipulator).FSelectedPtType = ctElse) then
            FContainmentHandlingProxy.BeginHandling;
        end;
      end
      else if Sender.DiagramView.SelectedViewCount > 1 then begin
        FMode := smGrouping;
        // Multiple views selected
        FBoundingBox := Sender.DiagramView.GetSelectedBoundingBox(Canvas);
        VS := POrderedSet.Create;
        for I := 0 to Sender.DiagramView.SelectedViewCount - 1 do
          VS.Add(Sender.DiagramView.SelectedView[I]);
        if HasTheSameContainerView(VS) then
          FContainmentHandlingProxy.BeginHandling;
        VS.Free;
      end
      else begin
        // no selected view
        FMode := smNone;
      end;
    end;
  end else if Button = mbRight then begin
    if FView = nil then begin
      Sender.DiagramView.DeselectAll;
      SelectArea(FX1, FY1, FX2, FY2); // Diagram is selected
                                      //* usage of SelectArea mode is improper
                                      //* use this once because proper external interface doesn't exist
    end
    else if not FView.Selected then SelectView(FView);
    FMode := smNone;
  end;
  if Assigned(FContainerView) then FContainerView := nil;
end;

procedure PSelectHandler.MouseMove(Sender: PDiagramEditor; Canvas: PCanvas; Shift: TShiftState; X, Y: Integer);
var
  ZX, ZY: Integer;
  BX, BY: Integer;
  DX, DY: Integer;
  VS: POrderedSet;
  V: PView;
  I: Integer;
begin
  // if not mouse left button downed then exit
  if not (ssLeft in Shift) then begin
    FManipulatableNotifier.MouseMove(Sender, Canvas, Shift, X, Y);
    Exit;
  end;

  // ZoomFactor only applied coordinates.
  ZX := X;  ZY := Y;
  CoordRevTransform(Sender.ZoomFactor, NOGRID, ZX, ZY);
  // ZoomFactor and GridFactor applied coordinates
  BX := X;  BY := Y;
  CoordRevTransform(Sender.ZoomFactor, Sender.GridFactor, BX, BY);

  // Area selected mode
  if FMode = smSelectArea then begin
    // Erase exist bounding box
    DrawRange(Canvas, FX1, FY1, FX2, FY2);
    FX2 := ZX; FY2 := ZY;
    // Correct selection area not to stray from canvas
    if FX2 < 0 then FX2 := 0
    else if FX2 > Sender.DiagramWidth then FX2 := Sender.DiagramWidth;
    if FY2 < 0 then FY2 := 0
    else if FY2 > Sender.DiagramHeight then FY2 := Sender.DiagramHeight;
    // Draw new bounding box
    DrawRange(Canvas, FX1 , FY1, FX2, FY2);
    if Sender.Scrolled then begin
      FRangeRect := Rect(FX1, FY1, FX2, FY2);
      Sender.HandingPaintProc := DrawRangeRect;
    end;
  end
  else begin
    // Multiple views selected mode
    if FMode = smGrouping then begin

      // Test containment relation (Refactoring needed)
      V := Sender.DiagramView.GetViewAt(Canvas, ZX, ZY);
      VS := POrderedSet.Create;
      for I := 0 to Sender.DiagramView.SelectedViewCount - 1 do
        VS.Add(Sender.DiagramView.SelectedView[I]);
      FContainmentHandlingProxy.MouseMoveHandling(Canvas, VS, V);
      VS.Free;

      DX := BX - GX2; DY := BY - GY2;
      GX2 := BX; GY2 := BY;
      if FDragged then begin
        // in dragging
        with FBoundingBox do
          // Erase existing bounding box
          DrawRange(Canvas, Left, Top, Right, Bottom)
      end
      else begin
        // at starting of drag
        FDragged := True;
      end;
      // Move bounding box and draw it
      with FBoundingBox do begin
        Left := Left + DX;
        Top := Top + DY;
        Right := Right + DX;
        Bottom := Bottom + DY;

        // Correct bouding box not to stray from canvas
        if Left < 0 then begin
          GX2 := BX - Left;
          Right := Right - Left;
          Left := 0;
        end;
        if Right > Sender.DiagramWidth then begin
          GX2 := BX - (Right - Sender.DiagramWidth);
          Left := Sender.DiagramWidth - (Right - Left);
          Right := Sender.DiagramWidth;
        end;
        if Top < 0 then begin
          GY2 := BY - Top;
          Bottom := Bottom - Top;
          Top := 0;
        end;
        if Bottom > Sender.DiagramHeight then begin
          GY2 := BY - (Bottom - Sender.DiagramHeight);
          Top := Sender.DiagramHeight - (Bottom - Top);
          Bottom := Sender.DiagramHeight;
        end;

        DrawRange(Canvas, Left, Top, Right, Bottom);
        if Sender.Scrolled then begin
          FRangeRect := Rect(Left, Top, Right, Bottom);
          Sender.HandingPaintProc := DrawRangeRect;
        end;
      end;
    end
    // Single view selected mode
    else if FMode = smIndividual then begin
      // propagate mouse move event to suitable manipulator
      // [Notice] Each manipulator must translate coordinates.
      if FManipulator <> nil then FManipulator.MouseMove(Sender, FView, Canvas, Shift, X, Y);
      // Test containment relation (Refactoring needed)
      if FManipulator is PNodeManipulator then begin
        with FManipulator as PNodeManipulator do
          if FView.ContainerChangeable and (FSelectedPtType = ctElse) and ((FX1 <> FX2) or (FY1 <> FY2)) then begin
            V := Sender.DiagramView.GetViewAt(Canvas, ZX, ZY);
            FContainmentHandlingProxy.MouseMoveHandling(Canvas, FView, V);
          end;
      end;
    end;
  end;
end;

procedure PSelectHandler.MouseUp(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ZX, ZY: Integer;
begin
  // if not mouse left button downed then exit
  if Button <> mbLeft then Exit;

  ZX := X;  ZY := Y;
  CoordRevTransform(Sender.ZoomFactor, NOGRID, ZX, ZY);
  // Area selected mode
  if FMode = smSelectArea then begin
    // Erase existing boundign box
    DrawRange(Canvas, FX1, FY1, FX2, FY2);
    NormalizeRect(FX1, FY1, FX2, FY2);
    if not (ssShift in Shift) then Sender.DiagramView.DeselectAll;
    SelectArea(FX1, FY1, FX2, FY2);
  end
  // Multiple views selected mode
  else if FMode = smGrouping then begin
    if FDragged then begin
      // Erase existing boundign box
      with FBoundingBox do DrawRange(Canvas, Left, Top, Right, Bottom);
    end
    else if not (ssShift in Shift) then begin
      SelectView(FView);
    end;
    FContainmentHandlingProxy.MouseUpHandling(Canvas);
    // Selected views moved
    if (GX2 <> GX1) or (GY2 <> GY1) then begin
      if FContainmentHandlingProxy.Activated and (Sender.DiagramView.SelectedView[0].ContainerView <> FContainmentHandlingProxy.ContainerView) then
        ChangeSelectedViewsContainer(GX2 - GX1, GY2 - GY1, FContainmentHandlingProxy.ContainerView)
      else
        MoveSelectedViews(GX2 - GX1, GY2 - GY1);
    end;
    FContainmentHandlingProxy.EndHandling;
  end
  // Single view selected mode
  else if FMode = smIndividual then begin
    // Test containment relation (Refactoring needed)
    if FManipulator is PNodeManipulator then
      if (FManipulator as PNodeManipulator).FSelectedPtType = ctElse then begin
        FContainmentHandlingProxy.MouseUpHandling(Canvas);
      end;
    // propagate mouse up event to suitable manipulator
    if FManipulator <> nil then FManipulator.MouseUp(Sender, FView, Canvas, Button, Shift, X, Y);
    if FContainmentHandlingProxy.Activated then FContainmentHandlingProxy.EndHandling;
    if FDoubleClicked and Assigned(FOnViewDoubleClicked) then
      FOnViewDoubleClicked(Self, FView, X, Y);
    FDoubleClicked := False;
  end;

  FMode := smNone;
end;

procedure PSelectHandler.KeyPress(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Char);
begin
  // reserved.
end;

procedure PSelectHandler.KeyPressedHeld(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Repetitions: Integer);
  procedure SetFactor(var DX, DY: Integer);
  const
    SpeedFactor = 16;
  begin
    DX := Sender.GridFactor.Width * SpeedFactor;
    DY := Sender.GridFactor.Height * SpeedFactor;
  end;
var
  DX, DY: Integer;
begin
    SetFactor(DX, DY);
    if Key = VK_LEFT then
      MoveSelectedViews(-DX, 0)
    else if Key = VK_RIGHT then
      MoveSelectedViews(DX, 0)
    else if Key = VK_UP then
      MoveSelectedViews(0, -DY)
    else if Key = VK_DOWN then
      MoveSelectedViews(0, DY);
end;

procedure PSelectHandler.KeyDown(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState);
begin
  // reserved.
end;

procedure PSelectHandler.KeyUp(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState);

  function IsArrowKey(AKey: Word): Boolean;
  begin
    Result := (AKey = VK_LEFT) or (AKey = VK_RIGHT) or (AKey = VK_UP) or (AKey = VK_DOWN);
  end;

  function IsNodeResizingBehavior: Boolean;
  begin
    Result := (Sender.DiagramView.SelectedViewCount = 1)
      and (Sender.DiagramView.SelectedView[0] is PNodeView)
      and (ssShift in Shift) and IsArrowKey(Key);
  end;

  function IsViewsMovingBehavior: Boolean;
  begin
    Result := (Sender.DiagramView.SelectedViewCount > 0)
      and (ssCtrl in Shift) and IsArrowKey(Key);
  end;

  function IsViewSelectionChangingBehavior: Boolean;
  begin
    Result := (Shift = []) and IsArrowKey(Key);
  end;

  function IsQuickDialogLaunchingBehavior: Boolean;
  begin
    Result := (Sender.DiagramView.SelectedViewCount = 1)
      and Assigned(FOnQuickDlgPopup) and (Key = VK_RETURN);
  end;

  procedure SetFactor(var DX, DY: Integer);
  begin
    DX := Sender.GridFactor.Width;
    DY := Sender.GridFactor.Height;
    if ssAlt in Shift then begin
      DX := 1;
      DY := 1;
    end;
  end;

  function GetCenterOfEdge(EdgeView: PEdgeView): TPoint;
  var
    P1, P2: TPoint;
    X, Y, X1, Y1, X2, Y2: Integer;
  begin
    P1 := EdgeView.Points.PointData[(EdgeView.Points.Count - 1) div 2];
    P2 := EdgeView.Points.PointData[(EdgeView.Points.Count - 1) div 2 + 1];
    X1 := P1.X; Y1 := P1.Y; X2 := P2.X; Y2 := P2.Y;
    NormalizeRect(X1, Y1, X2, Y2);
    X := X1 + (X2 - X1) div 2;
    Y := Y1 + (Y2 - Y1) div 2;
    Result := Point(X, Y);
  end;

var
  DiagramView: PDiagramView;
  NodeView: PNodeView;
  EdgeView: PEdgeView;
  V, NearestView: PView;
  P: TPoint;
  DX, DY: Integer;
begin
  DiagramView := Sender.DiagramView;
  if IsViewSelectionChangingBehavior then begin
    NearestView := nil;
    if DiagramView.SelectedViewCount = 1 then begin
      V := DiagramView.SelectedView[0];
      if Key = VK_LEFT then
        NearestView := FindNearestView(V, dkLeft)
      else if Key = VK_RIGHT then
        NearestView := FindNearestView(V, dkRight)
      else if Key = VK_UP then
        NearestView := FindNearestView(V, dkUp)
      else if Key = VK_DOWN then
        NearestView := FindNearestView(V, dkDown);
    end;
    if NearestView <> nil then begin
      SelectView(NearestView);
      Sender.FocusOnView(NearestView);
    end;
  end
  else if IsViewsMovingBehavior then begin
    SetFactor(DX, DY);
    if Key = VK_LEFT then
      MoveSelectedViews(-DX, 0)
    else if Key = VK_RIGHT then
      MoveSelectedViews(DX, 0)
    else if Key = VK_UP then
      MoveSelectedViews(0, -DY)
    else if Key = VK_DOWN then
      MoveSelectedViews(0, DY);
  end
  else if IsNodeResizingBehavior then begin
    SetFactor(DX, DY);
    NodeView := Sender.DiagramView.SelectedView[0] as PNodeView;
    if Key = VK_LEFT then
      ResizeNode(NodeView, NodeView.Left, NodeView.Top, NodeView.Right - DX, NodeView.Bottom)
    else if Key = VK_RIGHT then
      ResizeNode(NodeView, NodeView.Left, NodeView.Top, NodeView.Right + DX, NodeView.Bottom)
    else if Key = VK_UP then
      ResizeNode(NodeView, NodeView.Left, NodeView.Top, NodeView.Right, NodeView.Bottom - DY)
    else if Key = VK_DOWN then
      ResizeNode(NodeView, NodeView.Left, NodeView.Top, NodeView.Right, NodeView.Bottom + DY);
  end
  else if IsQuickDialogLaunchingBehavior then begin
    V := Sender.DiagramView.SelectedView[0];
    if V is PNodeView then begin
      NodeView := V as PNodeView;
      FOnQuickDlgPopup(V, NodeView.Left, NodeView.Top);
    end
    else if V is PEdgeView then begin
      EdgeView := V as PEdgeView;
      P := GetCenterOfEdge(EdgeView);
      FOnQuickDlgPopup(V, P.X, P.Y);
    end;
  end;
end;

// PSelectHandler
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PCreateHandler

constructor PCreateHandler.Create(HandlerName: string; const ContainerCandidates: array of PClass;
  SkeletonPaintingKind: PSkeletonPaintingKind);
var
  I: Integer;
begin
  FHandlerName := HandlerName;
  FSkeletonPaintingKind := SkeletonPaintingKind;
  for I := Low(ContainerCandidates) to High(ContainerCandidates) do begin
    SetLength(FContainerCandidates, Length(ContainerCandidates));
    FContainerCandidates[I] := ContainerCandidates[I];
  end;
end;

procedure PCreateHandler.PaintSkeleton(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
begin
  if FSkeletonPaintingKind = spRect then
    DrawRange(Canvas, X1, Y1, X2, Y2)
  else
    DrawDottedLine(Canvas, X1, Y1, X2, Y2);
end;

procedure PCreateHandler.CreateElement(DiagramView: PDiagramView; Canvas: PCanvas; X1, Y1, X2, Y2: Integer);

  function IsRelationKind(ElementKind: string): Boolean;
  begin
    Result := (ElementKind = 'NoteLink')
      or (ElementKind = 'Transition')
      or (ElementKind = 'Dependency')
      or (ElementKind = 'Association')
      or (ElementKind = 'AssociationClass')
      or (ElementKind = 'Generalization')
      or (ElementKind = 'Link')
      or (ElementKind = 'AssociationRole')
      or (ElementKind = 'Stimulus')
      or (ElementKind = 'Message')
      or (ElementKind = 'Include')
      or (ElementKind = 'Extend')
      or (ElementKind = 'Realization')
      or (ElementKind = 'Connector');
  end;

var
  End1, End2: PView;
  B1, B2: PView;
  Msg: string;
begin
{
  if FContainerView <> nil then begin
    FContainerView.EraseContainingBox(FContainerView.GetDiagramView.Canvas);
    FContainerView := nil;
  end;
  // check connectable
  if IsRelationKind(FElementKind) then begin
    End1 := DiagramView.GetViewAt(Canvas, X1, Y1);
    End2 := DiagramView.GetViewAt(Canvas, X2, Y2);

    if FElementKind = 'Stimulus' then begin
      if DiagramView is PUMLSequenceDiagramView then begin
        if End1 is PUMLActivationView then begin
          B1 := DiagramView.GetBottomViewAt(DiagramView.Canvas, X1, Y1);
          if B1 is PUMLSeqObjectView then End1 := B1;
        end;
        if End2 is PUMLActivationView then begin
          B2 := DiagramView.GetBottomViewAt(DiagramView.Canvas, X2, Y2);
          if B2 is PUMLSeqObjectView then End2 := B2;
        end;
      end;
    end
    else if FElementKind = 'Message' then begin
      if DiagramView is PUMLSequenceRoleDiagramView then begin
        if End1 is PUMLActivationView then begin
          B1 := DiagramView.GetBottomViewAt(DiagramView.Canvas, X1, Y1);
          if B1 is PUMLSeqClassifierRoleView then End1 := B1;
        end;
        if End2 is PUMLActivationView then begin
          B2 := DiagramView.GetBottomViewAt(DiagramView.Canvas, X2, Y2);
          if B2 is PUMLSeqClassifierRoleView then End2 := B2;
        end;
      end;
    end;

    if not CheckLinkable(DiagramView, FElementKind, End1, End2, Msg) then begin
      if Msg <> '' then
        Application.MessageBox(PChar(Msg), PChar(Application.Title));
      if Assigned(FOnElementCreatingAbort) then
        FOnElementCreatingAbort(Self);
      Exit;
    end;
  end;
}

  if Assigned(FOnElementCreating) then
    FOnElementCreating(Self, FHandlerName, X1, Y1, X2, Y2);
end;

procedure PCreateHandler.DrawNodeSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas);
begin
  DrawRange(Canvas, FSkeletonRect.Left, FSkeletonRect.Top, FSkeletonRect.Right, FSkeletonRect.Bottom);
end;

procedure PCreateHandler.DrawEdgeSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas);
begin
  DrawDottedLine(Canvas, FSkeletonRect.Left, FSkeletonRect.Top, FSkeletonRect.Right, FSkeletonRect.Bottom);
end;

procedure PCreateHandler.CheckContainingBox(Sender: PDiagramView; Canvas: PCanvas; X, Y: Integer);
var
  AView: PView;
  I: Integer;
begin
  AView := Sender.GetViewAt(Canvas, X, Y);
  if (AView <> nil) and (AView is PUMLStateView) then begin
    if AView = FContainerView then Exit;
    if FContainerView <> nil then begin
      FContainerView.EraseContainingBox(Canvas);
      FContainerView := nil;
    end;
    for I := 0 to High(FContainerCandidates) do begin
      if AView is FContainerCandidates[I] then begin
        AView.DrawContainingBox(Canvas);
        FContainerView := AView;
        Exit;
      end;
    end;
  end else begin
    if FContainerView <> nil then begin
      FContainerView.EraseContainingBox(Canvas);
      FContainerView := nil;
    end;
  end;
end;

procedure PCreateHandler.MouseDown(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  BX, BY: Integer;
begin
  if Button = mbLeft then begin
    // ZoomFactor and GridFactor applied coordinates
    BX := X;  BY := Y;
    CoordRevTransform(Sender.ZoomFactor, Sender.GridFactor, BX, BY);

    FX1 := BX; FY1 := BY; FX2 := BX; FY2 := BY;
  end;
end;

procedure PCreateHandler.MouseMove(Sender: PDiagramEditor; Canvas: PCanvas; Shift: TShiftState; X, Y: Integer);
var
  ZX, ZY: Integer;
  BX, BY: Integer;
begin
  // ZoomFactor only applied coordinates.
  ZX := X;  ZY := Y;
  CoordRevTransform(Sender.ZoomFactor, NOGRID, ZX, ZY);

  // ZoomFactor and GridFactor applied coordinates
  BX := X;  BY := Y;
  CoordRevTransform(Sender.ZoomFactor, Sender.GridFactor, BX, BY);

  // if is in ContainerView, draw ContainingBox
  CheckContainingBox(Sender.DiagramView, Canvas, BX, BY);

  if ssLeft in Shift then begin
    // Erase existing silhouette
    PaintSkeleton(Canvas, FX1, FY1, FX2, FY2);
    if FSkeletonPaintingKind = spRect then begin
      FX2 := BX; FY2 := BY;
    end
    else begin
      FX2 := ZX; FY2 := ZY;
    end;

    // Correct coordinate not to stray from canvas
    if FX2 < 0 then FX2 := 0
    else if FX2 > Sender.DiagramWidth then FX2 := Sender.DiagramWidth;
    if FY2 < 0 then FY2 := 0
    else if FY2 > Sender.DiagramHeight then FY2 := Sender.DiagramHeight;

    // Draw new silhouette
    PaintSkeleton(Canvas, FX1, FY1, FX2, FY2);
    if Sender.Scrolled then begin
      FSkeletonRect := Rect(FX1, FY1, FX2, FY2);
      if FSkeletonPaintingKind = spRect then
        Sender.HandingPaintProc := DrawNodeSkeleton
      else
        Sender.HandingPaintProc := DrawEdgeSkeleton;
    end;
  end;
end;

procedure PCreateHandler.MouseUp(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PaintSkeleton(Canvas, FX1, FY1, FX2, FY2);
  if Button = mbLeft then CreateElement(Sender.DiagramView, Canvas, FX1, FY1, FX2, FY2);
end;

procedure PCreateHandler.KeyPress(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Char);
begin
  // reserved.
end;

procedure PCreateHandler.KeyPressedHeld(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Repetitions: Integer);
begin
  // reserved.
end;

procedure PCreateHandler.KeyDown(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState);
begin
  // reserved.
end;

procedure PCreateHandler.KeyUp(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState);
begin
  // reserved.
end;

// PCreateHandler
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PActionProcessor

constructor PActionProcessor.Create;
var
  ASelectHandler: PSelectHandler;
begin
  FHandlerList := TList.Create;
  FActiveHandler := nil;
  // Select Handler Initialization
  ASelectHandler := PSelectHandler.Create(SELECT_HANDLER);
  ASelectHandler.OnViewSelecting := ViewSelectingHandler;
  ASelectHandler.OnViewDeselecting := ViewDeselectingHandler;
  ASelectHandler.OnAdditionalViewSelecting := AdditionalViewSelectingHandler;
  ASelectHandler.OnAreaSelecting := AreaSelectingHandler;
  ASelectHandler.OnViewMoving := ViewMovingHandler;
  ASelectHandler.OnViewContainerChanging := ViewContainerChangingHandler;
  ASelectHandler.OnSelectedViewsMoving := SelectedViewsMovingHandler;
  ASelectHandler.OnSelectedViewsContainerChanging := SelectedViewsContainerChangingHandler;
  ASelectHandler.OnParasiticViewMoving := ParasiticViewMovingHandler;
  ASelectHandler.OnNodeResizing := NodeResizingHandler;
  ASelectHandler.OnEdgeModifying := EdgeModifyingHandler;
  ASelectHandler.OnEdgeReconnecting := EdgeReconnectingHandler;
  ASelectHandler.OnQuickDlgPopup := QuickDlgPopupHandler;
  ASelectHandler.OnViewDoubleClicked := ViewDoubleClickedHandler;
  FHandlerList.Add(ASelectHandler);
end;

destructor PActionProcessor.Destroy;
var
  I: Integer;
  H: PHandler;
begin
  if FHandlerList <> nil then begin
    for I := FHandlerList.Count - 1 downto 0 do begin
      H := FHandlerList.Items[I];
      if H <> nil then H.Free;
    end;
    FHandlerList.Free;
  end;
  inherited;
end;

procedure PActionProcessor.ElementCreatingHandler(Sender: TObject; HandlerName: string; X1, Y1, X2, Y2: Integer);
begin
  if Assigned(FOnElementCreating) then FOnElementCreating(Self, HandlerName, X1, Y1, X2, Y2);
end;

{
procedure PActionProcessor.ElementCreatingAbortHandler(Sender: TObject);
begin
  if Assigned(FOnElementCreatingAbort) then FOnElementCreatingAbort(Self);
end;
}

procedure PActionProcessor.ViewSelectingHandler(AView: PView);
begin
  if Assigned(FOnViewSelecting) then FOnViewSelecting(AView);
end;

procedure PActionProcessor.ViewDeselectingHandler(Sender: TObject);
begin
  if Assigned(FOnViewDeselecting) then FOnViewDeselecting(Sender);
end;

//procedure PActionProcessor.AllViewsDeselectingHandler(Sender: TObject);
//begin
//  if Assigned(FOnAllViewsDeselecting) then FOnAllViewsDeselecting(Sender);
//end;

procedure PActionProcessor.AdditionalViewSelectingHandler(Sender: TObject);
begin
  if Assigned(FOnAdditionalViewSelecting) then FOnAdditionalViewSelecting(Sender);
end;

procedure PActionProcessor.AreaSelectingHandler(X1, Y1, X2, Y2: Integer);
begin
  if Assigned(FOnAreaSelecting) then FOnAreaSelecting(X1, Y1, X2, Y2);
end;

procedure PActionProcessor.QuickDlgPopupHandler(AView: PView; X, Y: Integer);
begin
  if Assigned(FOnQuickDlgPopup) then FOnQuickDlgPopup(AView, X, Y); 
end;

procedure PActionProcessor.ViewDoubleClickedHandler(Sender: TObject; AView: PView; X, Y: Integer);
begin
  if Assigned(FOnViewDoubleClicked) then FOnViewDoubleClicked(Self, AView, X, Y);
end;

procedure PActionProcessor.ViewMovingHandler(View: PView; DX, DY: Integer);
begin
  if Assigned(FOnViewMoving) then FOnViewMoving(View, DX, DY);
end;

procedure PActionProcessor.ViewContainerChangingHandler(View: PView; DX, DY: Integer; AContainerView: PView);
begin
  if Assigned(FOnViewContainerChanging) then FOnViewContainerChanging(View, DX, DY, AContainerView);
end;

procedure PActionProcessor.SelectedViewsMovingHandler(DX, DY: Integer);
begin
  if Assigned(FOnSelectedViewsMoving) then FOnSelectedViewsMoving(DX, DY);
end;

procedure PActionProcessor.SelectedViewsContainerChangingHandler(DX, DY: Integer; AContainerView: PView);
begin
  if Assigned(FOnSelectedViewsContainerChanging) then FOnSelectedViewsContainerChanging(DX, DY, AContainerView);
end;

procedure PActionProcessor.ParasiticViewMovingHandler(AParasiticView: PParasiticView; DX, DY: Extended);
begin
  if Assigned(FOnParasiticViewMoving) then FOnParasiticViewMoving(AParasiticView, DX, DY);
end;

procedure PActionProcessor.NodeResizingHandler(Node: PNodeView; Left, Top, Right, Bottom: Integer);
begin
  if Assigned(FOnNodeResizing) then FOnNodeResizing(Node, Left, Top, Right, Bottom);
end;

procedure PActionProcessor.EdgeModifyingHandler(Edge: IModifiableEdge; Points: PPoints);
begin
  if Assigned(FOnEdgeModifying) then FOnEdgeModifying(Edge, Points);
end;

procedure PActionProcessor.EdgeReconnectingHandler(Edge: PEdgeView; Points: PPoints; NewParticipant: PView; IsTailSide: Boolean);
begin
  if Assigned(FOnEdgeReconnecting) then FOnEdgeReconnecting(Edge, Points, NewParticipant, IsTailSide);
end;

procedure PActionProcessor.AddCreateHandler(HandlerName: string; const ContainerCandidates: array of PClass;
  SkeletonPaintingKind: PSkeletonPaintingKind);
var
  H: PCreateHandler;
begin
  H := PCreateHandler.Create(HandlerName, ContainerCandidates, SkeletonPaintingKind);
  H.OnElementCreating := ElementCreatingHandler;
  // H.OnElementCreatingAbort := ElementCreatingAbortHandler;
  FHandlerList.Add(H);
end;

procedure PActionProcessor.ActivateHandler(HandlerName: string);
var
  I: Integer;
  AHandler: PHandler;
  Kind: string;
  TmpFlag: Boolean;
begin
  TmpFlag := False;
  HandlerName := Trim(HandlerName);
  for I := 0 to FHandlerList.Count - 1 do begin
    AHandler := FHandlerList.Items[I];
    Kind := AHandler.FHandlerName;
    if Kind = HandlerName then begin
      if FActiveHandler <> AHandler then FActiveHandler := AHandler;
      TmpFlag := True;
      break;
    end;
  end;
  // POSTCONDITION
  Assert(TmpFlag);
  // POSTCONDITION
end;

procedure PActionProcessor.MouseDown(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FActiveHandler <> nil then
    FActiveHandler.MouseDown(Sender, Canvas, Button, Shift, X, Y);
end;

procedure PActionProcessor.MouseMove(Sender: PDiagramEditor; Canvas: PCanvas; Shift: TShiftState; X, Y: Integer);
begin
  if FActiveHandler <> nil then
    FActiveHandler.MouseMove(Sender, Canvas, Shift, X, Y);
end;

procedure PActionProcessor.MouseUp(Sender: PDiagramEditor; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FActiveHandler <> nil then
    FActiveHandler.MouseUp(Sender, Canvas, Button, Shift, X, Y);
end;

procedure PActionProcessor.KeyPress(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Char);
begin
  if FActiveHandler <> nil then
    FActiveHandler.KeyPress(Sender, Canvas, Key);
end;

procedure PActionProcessor.KeyPressedHeld(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Repetitions: Integer);
begin
  if FActiveHandler <> nil then
    FActiveHandler.KeyPressedHeld(Sender, Canvas, Key, Repetitions);
end;

procedure PActionProcessor.KeyDown(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState);
begin
  if FActiveHandler <> nil then
    FActiveHandler.KeyDown(Sender, Canvas, Key, Shift);
end;

procedure PActionProcessor.KeyUp(Sender: PDiagramEditor; Canvas: PCanvas; var Key: Word; Shift: TShiftState);
begin
  if FActiveHandler <> nil then
    FActiveHandler.KeyUp(Sender, Canvas, Key, Shift);
end;

// PActionProcessor
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PManipulator

constructor PManipulator.Create(Handler: PSelectHandler);
begin
  FHandler := Handler;
end;

procedure PManipulator.MouseDown(Sender: PDiagramEditor; AView: PView; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ZX, ZY: Integer;
begin
  BeginManipulate(Sender, Canvas, AView, X, Y);
  FDragged := False;

  // ZoomFactor only applied coordinates.
  ZX := X;  ZY := Y;
  CoordRevTransform(Sender.ZoomFactor, NOGRID, ZX, ZY);

  FX1 := ZX; FY1 := ZY; FX2 := ZX; FY2 := ZY;
end;

procedure PManipulator.MouseMove(Sender: PDiagramEditor; AView: PView; Canvas: PCanvas; Shift: TShiftState; X, Y: Integer);
var
  ZX, ZY: Integer;
  DX, DY: Integer;
begin
  // ZoomFactor only applied coordinates.
  ZX := X;  ZY := Y;
  CoordRevTransform(Sender.ZoomFactor, NOGRID, ZX, ZY);

  DX := ZX - FX2;
  DY := ZY - FY2;

  if FDragged then
    PaintSkeleton(Sender, Canvas)
  else begin
    if (DX <> 0) or (DY <> 0) then
      FDragged := True;
  end;
  MoveSkeleton(Sender, Canvas, AView, DX, DY);

  FX2 := FX2 + DX;
  FY2 := FY2 + DY;

  if FDragged then begin
    PaintSkeleton(Sender, Canvas);
    if Sender.Scrolled then
      Sender.HandingPaintProc := PaintSkeleton;
  end;      
end;

procedure PManipulator.MouseUp(Sender: PDiagramEditor; AView: PView; Canvas: PCanvas; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FDragged then
    PaintSkeleton(Sender, Canvas);
  EndManipulate(Sender, Canvas, AView, FX2 - FX1, FY2 - FY1);
end;

// PManipulator
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PNodeManipulator

procedure PNodeManipulator.RestrictNode(R: TRect);
begin
  if FSelectedPtType = ctElse then begin
    if FLeft < R.Left then begin
      FRight := FRight + R.Left - FLeft;
      FLeft := R.Left;
    end
    else if FRight > R.Right then begin
      FLeft := FLeft + R.Right - FRight;
      FRight := R.Right;
    end;
    if FTop < R.Top then begin
      FBottom := FBottom + R.Top - FTop;
      FTop := R.Top;
    end
    else if FBottom > R.Bottom then begin
      FTop := FTop + R.Bottom - FBottom;
      FBottom := R.Bottom;
    end;
  end
  else begin
    if FLeft < R.Left then FLeft := R.Left;
    if FRight > R.Right then FRight := R.Right;
    if FTop < R.Top then FTop := R.Top;
    if FBottom > R.Bottom then FBottom := R.Bottom;
  end;
end;

function PNodeManipulator.GetPermittedRegion(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView): TRect;
begin
  Result := Rect(0, 0, ADiagramEditor.DiagramWidth, ADiagramEditor.DiagramHeight);
end;

procedure PNodeManipulator.BeginManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer);
var
  P: TPoint;
  R, ZR: TRect;
  MiddleX, MiddleY: Integer;
  ZX, ZY: Integer;
begin
  FMinX := (AView as PNodeView).MinWidth; FMinY := (AView as PNodeView).MinHeight;
  if (AView as PNodeView).AutoResize then
    FSizable := szNone
  else
    FSizable := (AView as PNodeView).Sizable;
  FMovable := (AView as PNodeView).Movable;

  // ZoomFactor only applied coordinates.
  ZX := X;  ZY := Y;
  CoordRevTransform(ADiagramEditor.ZoomFactor, NOGRID, ZX, ZY);

  R := AView.GetBoundingBox(Canvas);
  FOriginRect := R;
  FLeft := R.Left; FTop := R.Top; FRight := R.Right; FBottom := R.Bottom;

  if FSizable = szRatio then
    FRatio := (R.Right - R.Left) / (R.Bottom - R.Top);

  P := Point(X, Y);
  ZR := R;
  CoordTransform(ADiagramEditor.ZoomFactor, NOGRID, ZR);
  MiddleX := (ZR.Left + ZR.Right) div 2; MiddleY := (ZR.Top + ZR.Bottom) div 2;

  FSelectedPtType := ctElse;
  case FSizable of
    szNone:
      FSelectedPtType := ctElse;
    szFree, szRatio:
      begin
        if EqualPt(Point(ZR.Left - DEFAULT_HALF_HIGHLIGHTER_SIZE, ZR.Top - DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
          FSelectedPtType := ctLT
        else if EqualPt(Point(ZR.Right + DEFAULT_HALF_HIGHLIGHTER_SIZE, ZR.Top - DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
          FSelectedPtType := ctRT
        else if EqualPt(Point(ZR.Left - DEFAULT_HALF_HIGHLIGHTER_SIZE, ZR.Bottom + DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
          FSelectedPtType := ctLB
        else if EqualPt(Point(ZR.Right + DEFAULT_HALF_HIGHLIGHTER_SIZE, ZR.Bottom + DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
          FSelectedPtType := ctRB
        else if EqualPt(Point(ZR.Left - DEFAULT_HALF_HIGHLIGHTER_SIZE, MiddleY), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
          FSelectedPtType := ctLM
        else if EqualPt(Point(ZR.Right + DEFAULT_HALF_HIGHLIGHTER_SIZE, MiddleY), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
          FSelectedPtType := ctRM
        else if EqualPt(Point(MiddleX, ZR.Top - DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
          FSelectedPtType := ctMT
        else if EqualPt(Point(MiddleX, ZR.Bottom + DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
          FSelectedPtType := ctMB;
      end;
    szHorz:
      begin
        if EqualPt(Point(ZR.Left - DEFAULT_HALF_HIGHLIGHTER_SIZE, MiddleY), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
          FSelectedPtType := ctLM
        else if EqualPt(Point(ZR.Right + DEFAULT_HALF_HIGHLIGHTER_SIZE, MiddleY), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
          FSelectedPtType := ctRM;
      end;
    szVert:
      begin
        if EqualPt(Point(MiddleX, ZR.Top - DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
          FSelectedPtType := ctMT
        else if EqualPt(Point(MiddleX, ZR.Bottom + DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
          FSelectedPtType := ctMB;
      end;
  end;
  case FSelectedPtType of
    ctLT, ctMT, ctLM: FMinRect := Rect(FRight-FMinX+1, FBottom-FMinY+1, FRight, FBottom);
    ctRB, ctMB, ctRM: FMinRect := Rect(FLeft, FTop, FLeft+FMinX-1, FTop+FMinY-1);
    ctRT: FMinRect := Rect(FLeft, FBottom-FMinY+1, FLeft+FMinX-1, FBottom);
    ctLB: FMinRect := Rect(FRight-FMinX+1, FTop, FRight, FTop+FMinY-1);
  end;
  case FSelectedPtType of
    ctLT: Screen.Cursor := crSizeNWSE;
    ctRB: Screen.Cursor := crSizeNWSE;
    ctRT: Screen.Cursor := crSizeNESW;
    ctLB: Screen.Cursor := crSizeNESW;
    ctMT, ctMB: Screen.Cursor := crSizeNS;
    ctLM, ctRM: Screen.Cursor := crSizeWE;
  end;
end;

procedure PNodeManipulator.PaintSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas);
begin
  if (FMovable <> mmNone) or (FSizable <> szNone) then DrawRange(Canvas, FLeft, FTop, FRight, FBottom);
end;

procedure PNodeManipulator.MoveSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; var DX: Integer; var DY: Integer);

  function GridFitX(X: Integer): Integer;
  begin
    Result := X - (X mod ADiagramEditor.GridFactor.Width);
  end;

  function GridFitY(Y: Integer): Integer;
  begin
    Result := Y - (Y mod ADiagramEditor.GridFactor.Height);
  end;

  procedure ResizeSkeletonLeft;
  begin
    // if move over the minimum left boundary
    if FLeft + DX >= FMinRect.Left then begin
      DX := FMinRect.Left - FLeft;
      FLeft := FMinRect.Left;
    end
    // if move in original left line
    else if (FLeft + DX >= FOriginRect.Left) and (FLeft + DX <= GridFitX(FOriginRect.Left) + ADiagramEditor.GridFactor.Width) then begin
      DX := FOriginRect.Left - FLeft;
      FLeft := FOriginRect.Left;
    end
    else begin
      DX := DX - ((FLeft + DX) - GridFitX(FLeft + DX));
      FLeft := GridFitX(FLeft + DX);
    end;
  end;

  procedure ResizeSkeletonRight;
  begin
    // if move over the minimum right boundary
    if (FRight + DX <= FMinRect.Right) or (GridFitX(FRight + DX) <= FMinRect.Right) then begin
      DX := FMinRect.Right - FRight;
      FRight := FMinRect.Right;
    end
    // if move in original right line
    else if (FRight + DX >= FOriginRect.Right) and (FRight + DX <= GridFitX(FOriginRect.Right) + ADiagramEditor.GridFactor.Width) then begin
      DX := FOriginRect.Right - FRight;
      FRight := FOriginRect.Right;
    end
    else begin
      DX := DX - ((FRight + DX) - GridFitX(FRight + DX));
      FRight := GridFitX(FRight + DX);
    end;
  end;

  procedure ResizeSkeletonTop;
  begin
    // if move over the minimum top boundary
    if FTop + DY >= FMinRect.Top then begin
      DY := FMinRect.Top - FTop;
      FTop := FMinRect.Top;
    end
    // if move in original top line
    else if (FTop + DY >= FOriginRect.Top) and (FTop + DY <= GridFitY(FOriginRect.Top) + ADiagramEditor.GridFactor.Height) then begin
      DY := FOriginRect.Top - FTop;
      FTop := FOriginRect.Top;
    end
    else begin
      DY := DY - ((FTop + DY) - GridFitY(FTop + DY));
      FTop := GridFitY(FTop + DY);
    end;
  end;

  procedure ResizeSkeletonBottom;
  begin
    // if move over the minimum bottom boundary
    if (FBottom + DY <= FMinRect.Bottom) or (GridFitY(FBottom + DY) <= FMinRect.Bottom) then begin
      DY := FMinRect.Bottom - FBottom;
      FBottom := FMinRect.Bottom;
    end
    // if move in original bottom line
    else if (FBottom + DY >= FOriginRect.Bottom) and (FBottom + DY <= GridFitY(FOriginRect.Bottom) + ADiagramEditor.GridFactor.Height) then begin
      DY := FOriginRect.Bottom - FBottom;
      FBottom := FOriginRect.Bottom;
    end
    else begin
      DY := DY - ((FBottom + DY) - GridFitY(FBottom + DY));
      FBottom := GridFitY(FBottom + DY);
    end;
  end;

  procedure MoveSkeletonHorz;
  begin
    if (FLeft + DX >= FOriginRect.Left) and (FLeft + DX <= GridFitX(FOriginRect.Left) + ADiagramEditor.GridFactor.Width) then begin
      DX := FOriginRect.Left - FLeft;
      FLeft := FOriginRect.Left;
      FRight := FOriginRect.Right;
    end
    else begin
      DX := DX - ((FLeft + DX) - GridFitX(FLeft + DX));
      FLeft := GridFitX(FLeft + DX);
      FRight := FLeft + (FOriginRect.Right - FOriginRect.Left);
    end;
  end;

  procedure MoveSkeletonVert;
  begin
    if (FTop + DY >= FOriginRect.Top) and (FTop + DY <= GridFitY(FOriginRect.Top) + ADiagramEditor.GridFactor.Height) then begin
      DY := FOriginRect.Top - FTop;
      FTop := FOriginRect.Top;
      FBottom := FOriginRect.Bottom;
    end
    else begin
      DY := DY - ((FTop + DY) - GridFitY(FTop + DY));
      FTop := GridFitY(FTop + DY);
      FBottom := FTop + (FOriginRect.Bottom - FOriginRect.Top);
    end;
  end;

var
  HorizSizable, VertSizable: Boolean;
begin
  HorizSizable := (FSizable = szHorz) or (FSizable = szRatio) or (FSizable = szFree);
  VertSizable := (FSizable = szVert) or (FSizable = szRatio) or (FSizable = szFree);
  case FSelectedPtType of
    ctLT:
      begin
        if HorizSizable then ResizeSkeletonLeft;
        if VertSizable then ResizeSkeletonTop;
      end;
    ctRT:
      begin
        if HorizSizable then ResizeSkeletonRight;
        if VertSizable then ResizeSkeletonTop;
      end;
    ctLB:
      begin
        if HorizSizable then ResizeSkeletonLeft;
        if VertSizable then ResizeSkeletonBottom;
      end;
    ctRB:
      begin
        if HorizSizable then ResizeSkeletonRight;
        if VertSizable then ResizeSkeletonBottom;
      end;
    ctLM:
      if HorizSizable then ResizeSkeletonLeft;
    ctRM:
      if HorizSizable then ResizeSkeletonRight;
    ctMT:
      if VertSizable then ResizeSkeletonTop;
    ctMB:
      if VertSizable then ResizeSkeletonBottom;
    ctElse:
      case FMovable of
        mmHorz: MoveSkeletonHorz;
        mmVert: MoveSkeletonVert;
        mmFree:
          begin
            MoveSkeletonHorz;
            MoveSkeletonVert;
          end;
      end;
  end;
  RestrictNode(GetPermittedRegion(ADiagramEditor, Canvas, AView));
end;

procedure PNodeManipulator.EndManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; DX, DY: Integer);
var
  R: TRect;
  C: PView;
begin
  if (FMovable <> mmNone) or (FSizable <> szNone) then begin
    RestrictNode(GetPermittedRegion(ADiagramEditor, Canvas, AView));
    if FSelectedPtType = ctElse then begin
      R := AView.GetBoundingBox(Canvas);
      DX := FLeft - R.Left; DY := FTop - R.Top;
      if FHandler <> nil then begin
        C := FHandler.FContainmentHandlingProxy.ContainerView;
        if AView.ContainerChangeable and (AView.ContainerView <> C) then begin
          case FMovable of
            mmHorz: if DX <> 0 then FHandler.ChangeViewContainer(AView, DX, 0, C);
            mmVert: if DY <> 0 then FHandler.ChangeViewContainer(AView, 0, DY, C);
            mmFree: if (DX <> 0) or (DY <> 0) then FHandler.ChangeViewContainer(AView, DX, DY, C);
          end
        end
        else begin
          case FMovable of
            mmHorz: if DX <> 0 then FHandler.MoveView(AView, DX, 0);
            mmVert: if DY <> 0 then FHandler.MoveView(AView, 0, DY);
            mmFree: if (DX <> 0) or (DY <> 0) then FHandler.MoveView(AView, DX, DY);
          end
        end;
      end;
    end
    else begin
      if FHandler <> nil then FHandler.ResizeNode(AView as PNodeView, FLeft, FTop, FRight, FBottom);
    end;
  end;
  Screen.Cursor := crDefault;
end;

// PNodeManipulator
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PEdgeManipulator

constructor PEdgeManipulator.Create(Handler: PSelectHandler);
begin
  inherited;
  FPoints := PPoints.Create;
  FOriginPoints := PPoints.Create;
end;

destructor PEdgeManipulator.Destroy;
begin
  FPoints.Free;
  FOriginPoints.Free;
  inherited;
end;

procedure PEdgeManipulator.FitToGrid(APoints: PPoints; AGridFactor: PGridFactor);
var
  I: Integer;
begin
  // Because end of edge must be fit to BoundingBox of node and not be under influence of grid
  for I := 1 to APoints.Count - 2 do
    APoints.PointData[I] := Point(APoints.PointData[I].X - APoints.PointData[I].X mod AGridFactor.Width,
                        APoints.PointData[I].Y - APoints.PointData[I].Y mod AGridFactor.Height);

end;

procedure PEdgeManipulator.BeginManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer);
var
  L: PEdgeView;
  ZX, ZY: Integer;
begin
  // ZoomFactor only applied coordinates.
  ZX := X;  ZY := Y;
  CoordRevTransform(ADiagramEditor.ZoomFactor, NOGRID, ZX, ZY);

  L := AView as PEdgeView;
  FPoints.Assign(L.Points);
  FStyle := (AView as PEdgeView).LineStyle;

  if FStyle = lsRectilinear then begin
    // select point or line
    FSelectedIndex := L.SelectedPoint(Canvas, Point(ZX, ZY));
    // decide location-kind of selected point
    if FSelectedIndex = 0 then
      FEdgeSelectLocation := slTail
    else if FSelectedIndex = FPoints.Count - 1 then
      FEdgeSelectLocation := slHead
    else begin
      FEdgeSelectLocation := slLine;
      if FSelectedIndex = -1 then
        FSelectedIndex := L.ContainedIndex(Canvas, Point(ZX, ZY));
    end;
  end
  else begin
    // select point or line or add point
    FSelectedIndex := L.SelectedPoint(Canvas, Point(ZX, ZY));
    if FSelectedIndex <> 0 then
      FPoints.PointData[0] := GetCenter(L.Tail.GetBoundingBox(Canvas));
    if FSelectedIndex <> FPoints.Count - 1 then
      FPoints.PointData[FPoints.Count - 1] := GetCenter(L.Head.GetBoundingBox(Canvas));
    if FSelectedIndex = -1 then begin
      FSelectedIndex := L.ContainedIndex(Canvas, Point(ZX, ZY));
      Inc(FSelectedIndex);
      FPoints.Insert(FSelectedIndex, Point(ZX, ZY));
    end;

    // decide location-kind of selected point
    if FSelectedIndex = 0 then
      FEdgeSelectLocation := slTail
    else if FSelectedIndex = FPoints.Count - 1 then
      FEdgeSelectLocation := slHead
    else
      FEdgeSelectLocation := slLine;
  end;

  // set cursor
  if FEdgeSelectLocation = slLine then
    Screen.Cursor := crDefault
  else
    Screen.Cursor := crHandPoint;

  FOriginPoints.Assign(FPoints);
end;

procedure PEdgeManipulator.PaintSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas);
begin
  DrawDottedLine(Canvas, FPoints);
end;

procedure PEdgeManipulator.MoveSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; var DX: Integer; var DY: Integer);

  function GridFitX(X: Integer): Integer;
  begin
    Result := X - (X mod ADiagramEditor.GridFactor.Width);
  end;

  function GridFitY(Y: Integer): Integer;
  begin
    Result := Y - (Y mod ADiagramEditor.GridFactor.Height);
  end;

  procedure PutPointBoundsOnCanvas(var P: TPoint);
  begin
    if P.X < 0 then P.X := 0
    else if P.X > ADiagramEditor.DiagramWidth then P.X := ADiagramEditor.DiagramWidth;
    if P.Y < 0 then P.Y := 0
    else if P.Y > ADiagramEditor.DiagramHeight then P.Y := ADiagramEditor.DiagramHeight;
  end;

var
  P, P1, P2: TPoint;
  OP, OP1, OP2: TPoint;
begin
  if FStyle = lsRectilinear then begin
    // Get points at end of the selected line
    P1 := FPoints.PointData[FSelectedIndex];
    if FEdgeSelectLocation = slHead then
      P2 := FPoints.PointData[FSelectedIndex - 1]
    else
      P2 := FPoints.PointData[FSelectedIndex + 1];
    OP1 := FOriginPoints.PointData[FSelectedIndex];
    if FEdgeSelectLocation = slHead then
      OP2 := FOriginPoints.PointData[FSelectedIndex - 1]
    else
      OP2 := FOriginPoints.PointData[FSelectedIndex + 1];

    // if move front-end or rear-end point
    if (FEdgeSelectLocation = slTail) or (FEdgeSelectLocation = slHead) then begin
      if (P1.X + DX >= OP1.X) and (P1.X + DX <= GridFitX(OP1.X) + ADiagramEditor.GridFactor.Width) then begin
        DX := OP1.X - P1.X;
        P1.X := OP1.X;
      end
      else begin
        DX := DX - ((P1.X + DX) - GridFitX(P1.X + DX));
        P1.X := GridFitX(P1.X + DX);
      end;
      if (P1.Y + DY >= OP1.Y) and (P1.Y + DY <= GridFitY(OP1.Y) + ADiagramEditor.GridFactor.Height) then begin
        DY := OP1.Y - P1.Y;
        P1.Y := OP1.Y;
      end
      else begin
        DY := DY - ((P1.Y + DY) - GridFitY(P1.Y + DY));
        P1.Y := GridFitY(P1.Y + DY);
      end;
      if OP1.X = OP2.X then
        P2.X := P1.X;
      if OP1.Y = OP2.Y then
        P2.Y := P1.Y;
    end

    // if move line
    else begin

      // if vertical line selected, move skeleton
      if P1.X = P2.X then begin
        if (P1.X + DX >= OP1.X) and (P1.X + DX <= GridFitX(OP1.X) + ADiagramEditor.GridFactor.Width) then begin
          DX := OP1.X - P1.X;
          P1.X := OP1.X;
        end
        else begin
          DX := DX - ((P1.X + DX) - GridFitX(P1.X + DX));
          P1.X := GridFitX(P1.X + DX);
        end;
        P2.X := P1.X;
      end

      // if horizontal line selected, move skeleton
      else if P1.Y = P2.Y then begin
        if (P1.Y + DY >= OP1.Y) and (P1.Y + DY <= GridFitY(OP1.Y) + ADiagramEditor.GridFactor.Height) then begin
          DY := OP1.Y - P1.Y;
          P1.Y := OP1.Y;
        end
        else begin
          DY := DY - ((P1.Y + DY) - GridFitY(P1.Y + DY));
          P1.Y := GridFitY(P1.Y + DY);
        end;
        P2.Y := P1.Y;
      end;
    end;

    if ((FEdgeSelectLocation = slLine) and (FSelectedIndex = 0)) or
      ((FEdgeSelectLocation = slHead) and (FPoints.Count = 2)) then begin
      FPoints.Insert(0, FPoints.PointData[0]);
      FOriginPoints.Insert(0, FPoints.PointData[0]);
      Inc(FSelectedIndex);
    end
    else if ((FEdgeSelectLocation = slLine) and (FSelectedIndex = FPoints.Count - 2)) or
      ((FEdgeSelectLocation = slTail) and (FPoints.Count = 2)) then begin
      FPoints.Insert(FSelectedIndex + 1, FPoints.PointData[FSelectedIndex + 1]);
      FOriginPoints.Insert(FSelectedIndex + 1, FPoints.PointData[FSelectedIndex + 1]);
    end;

    // Modify points not to stray from Canvas
    PutPointBoundsOnCanvas(P1);
    PutPointBoundsOnCanvas(P2);

    // Re-assign selected points to modified.
    FPoints.PointData[FSelectedIndex] := P1;
    if FEdgeSelectLocation = slHead then
      FPoints.PointData[FSelectedIndex - 1] := P2
    else
      FPoints.PointData[FSelectedIndex + 1] := P2;
  end
  else begin
    // Get selected point
    P := Point(FPoints.PointData[FSelectedIndex].X, FPoints.PointData[FSelectedIndex].Y);
    OP := Point(FOriginPoints.PointData[FSelectedIndex].X, FOriginPoints.PointData[FSelectedIndex].Y);

    // Move skeleton
    if (P.X + DX >= OP.X) and (P.X + DX <= GridFitX(OP.X) + ADiagramEditor.GridFactor.Width) then begin
      DX := OP.X - P.X;
      P.X := OP.X;
    end
    else begin
      DX := DX - ((P.X + DX) - GridFitX(P.X + DX));
      P.X := GridFitX(P.X + DX);
    end;

    if (P.Y + DY >= OP.Y) and (P.Y + DY <= GridFitY(OP.Y) + ADiagramEditor.GridFactor.Height) then begin
      DY := OP.Y - P.Y;
      P.Y := OP.Y;
    end
    else begin
      DY := DY - ((P.Y + DY) - GridFitY(P.Y + DY));
      P.Y := GridFitY(P.Y + DY);
    end;

    // Modify point not to stray from Canvas
    PutPointBoundsOnCanvas(P);

    // Re-assign selected point to modified.
    FPoints.PointData[FSelectedIndex] := P;
  end;
end;

procedure PEdgeManipulator.EndManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; DX, DY: Integer);
var
  V, OldPart: PView;
begin
  if (DX <> 0) or (DY <> 0) then begin
    if FStyle = lsRectilinear then
      FPoints.ReduceOrthoLine
    else FPoints.ReduceLine;
    if FHandler <> nil then begin
      if FEdgeSelectLocation = slLine then
        FHandler.ModifyEdge(AView as PEdgeView, FPoints)
      else begin
        V := ADiagramEditor.DiagramView.GetBottomViewAt(Canvas,
          FPoints.PointData[FSelectedIndex].X, FPoints.PointData[FSelectedIndex].Y);
        if FEdgeSelectLocation = slTail then
          OldPart := (AView as PEdgeView).Tail
        else
          OldPart := (AView as PEdgeView).Head;
        if V <> nil then begin
          if V = OldPart then
            FHandler.ModifyEdge(AView as PEdgeView, FPoints)
          else
            FHandler.ReconnectEdge(AView as PEdgeView, FPoints, V, FEdgeSelectLocation = slTail);
        end;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;

// PEdgeManipulator
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PParasiticManipulator

procedure PParasiticManipulator.EndManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; DX, DY: Integer);
var
  P1, P2: TPoint;
  A, D: Extended;
  MidPointIndex: Integer;
  ANodeParasiticView: PNodeParasiticView;
  AEdgeParasiticView: PEdgeParasiticView;
  Node: PNodeView;
  Edge: PEdgeView;
begin
  // if there isn't anything moved, exit
  if (DX = 0) and (DY = 0) then Exit;
  // if target is NodeParasiticView
  if AView is PNodeParasiticView then begin
    ANodeParasiticView := (AView as PNodeParasiticView);
    Node := ANodeParasiticView.HostNode;
    if Node = nil then Node := ANodeParasiticView.Parent as PNodeView;
    P1.X := (Node.Left + Node.Right) div 2;
    P1.Y := (Node.Top + Node.Bottom) div 2;
    P2 := P1;
  end
  // if target is EdgeParasiticView
  else if AView is PEdgeParasiticView then begin
    AEdgeParasiticView := (AView as PEdgeParasiticView);
    Edge := AEdgeParasiticView.HostEdge;
    if Edge = nil then Edge := AEdgeParasiticView.Parent as PEdgeView;
    with Edge.Points do begin
      case AEdgeParasiticView.EdgePosition of
        epHead: begin
          P1 := PointData[Count-1];
          P2 := PointData[Count-2];
        end;
        epTail: begin
          P1 := PointData[0];
          P2 := PointData[1];
        end;
        epMiddle: begin
          MidPointIndex := Count div 2;
          if Count mod 2 = 0 then MidPointIndex := MidPointIndex - 1;

          P1 := PointData[MidPointIndex];
          P2 := PointData[MidPointIndex+1];

          if Count mod 2 = 0 then begin
            P1.X := Trunc((P1.X + P2.X) / 2);
            P1.Y := Trunc((P1.Y + P2.Y) / 2);
          end
        end;
      end;
    end;
  end;
  GetPolar(Rect(P1.X, P1.Y, P2.X, P2.Y), Point(FLeft + (FRight - FLeft) div 2, FTop + (FBottom - FTop) div 2), A, D);
  if FHandler <> nil then FHandler.MoveParasiticView(AView as PParasiticView, A, D);
end;

// PParasiticManipulator
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomSeqMessageManipulator

procedure PUMLCustomSeqMessageManipulator.BeginManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer);
var
  SeqMsg: PUMLCustomSeqMessageView;
  ZX, ZY: Integer;
begin
  // ZoomFactor only applied coordinates.
  ZX := X;  ZY := Y;
  CoordRevTransform(ADiagramEditor.ZoomFactor, NOGRID, ZX, ZY);

  SeqMsg := AView as PUMLCustomSeqMessageView;
  X1 := SeqMsg.Points.PointData[0].X;
  Y1 := SeqMsg.Points.PointData[0].Y;
  X2 := SeqMsg.Points.PointData[SeqMsg.Points.Count - 1].X;
  Y2 := SeqMsg.Points.PointData[SeqMsg.Points.Count - 1].Y;

  FSelectedIndex := SeqMsg.SelectedPoint(Canvas, Point(ZX, ZY));
end;

procedure PUMLCustomSeqMessageManipulator.PaintSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas);
begin
  DrawDottedLine(Canvas, X1, Y2, X2, Y2);
end;

procedure PUMLCustomSeqMessageManipulator.MoveSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; var DX: Integer; var DY: Integer);
begin
  Y1 := Y1 + DY;
  Y2 := Y2 + DY;
  if FSelectedIndex = 0 then
    X1 := X1 + DX
  else if FSelectedIndex >= 1 then  // consider self-message
    X2 := X2 + DX;
end;

procedure PUMLCustomSeqMessageManipulator.EndManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; DX, DY: Integer);
var
  NewPart: PView;
  NewPoints: PPoints;
begin
  if (DX = 0) and (DY = 0) then Exit;
  NewPoints := PPoints.Create;
  NewPoints.Clear;
  NewPoints.Add(Point(X1, Y1));
  NewPoints.Add(Point(X2, Y2));
  if FHandler <> nil then begin
    if FSelectedIndex = 0 then begin
      NewPart := ADiagramEditor.DiagramView.GetBottomViewAt(Canvas, X1, Y1);
      if (NewPart <> nil) and (NewPart is PUMLCustomSeqObjectView) then begin
        NewPart := (NewPart as PUMLCustomSeqObjectView).LifeLine;
        if (AView as PEdgeView).Tail = NewPart then
          FHandler.ModifyEdge(AView as PEdgeView, NewPoints)
        else
          FHandler.ReconnectEdge(AView as PEdgeView, NewPoints, NewPart, True);
      end;
    end
    else if FSelectedIndex >= 1 then begin
      NewPart := ADiagramEditor.DiagramView.GetBottomViewAt(Canvas, X2, Y2);
      if (NewPart <> nil) and (NewPart is PUMLCustomSeqObjectView) then begin
        NewPart := (NewPart as PUMLCustomSeqObjectView).LifeLine;
        if (AView as PEdgeView).Head = NewPart then
          FHandler.ModifyEdge(AView as PEdgeView, NewPoints)
        else
          FHandler.ReconnectEdge(AView as PEdgeView, NewPoints, NewPart, False);
      end;
    end
    else
      FHandler.ModifyEdge(AView as PEdgeView, NewPoints);
  end;
  NewPoints.Free;
end;

// PUMLCustomSeqMessageManipulator
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomColMessageManipulator

procedure PUMLCustomColMessageManipulator.BeginManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer);
var
  ColMsg: PUMLCustomColMessageView;
  R: TRect;
begin
  ColMsg := AView as PUMLCustomColMessageView;

  FMinX := ColMsg.MinWidth; FMinY := ColMsg.MinHeight;
  FSizable := szNone;
  FMovable := ColMsg.Movable;

  R := Rect(ColMsg.Left, ColMsg.Top, ColMsg.Right, ColMsg.Bottom);
  FOriginRect := R;
  FLeft := R.Left; FTop := R.Top; FRight := R.Right; FBottom := R.Bottom;
  FSelectedPtType := ctElse;

  HeadPoint := ColMsg.HeadPoint;
  TailPoint := ColMsg.TailPoint;
end;

procedure PUMLCustomColMessageManipulator.PaintSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas);
begin
  DrawDottedLine(Canvas, HeadPoint.X, HeadPoint.Y, TailPoint.X, TailPoint.Y);
end;

procedure PUMLCustomColMessageManipulator.MoveSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; var DX: Integer; var DY: Integer);
begin
  inherited;
  TailPoint.X := TailPoint.X + DX;
  TailPoint.Y := TailPoint.Y + DY;
  HeadPoint.X := HeadPoint.X + DX;
  HeadPoint.Y := HeadPoint.Y + DY;
end;

procedure PUMLCustomColMessageManipulator.EndManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; DX, DY: Integer);
var
  ColMsg: PUMLCustomColMessageView;
  Edge: PEdgeView;
  P1, P2: TPoint;
  A, D: Extended;
  MidPointIndex: Integer;
begin
  // if there isn't anything moved, exit
  if (DX = 0) and (DY = 0) then Exit;
  ColMsg := (AView as PUMLCustomColMessageView);
  Edge := ColMsg.HostEdge;
  if Edge = nil then Edge := ColMsg.Parent as PEdgeView;
  with Edge.Points do begin
    MidPointIndex := Count div 2;
    if Count mod 2 = 0 then MidPointIndex := MidPointIndex - 1;
    P1 := PointData[MidPointIndex];
    P2 := PointData[MidPointIndex+1];
    P1.X := Trunc((P1.X + P2.X) / 2);
    P1.Y := Trunc((P1.Y + P2.Y) / 2);
  end;
  GetPolar(Rect(P1.X, P1.Y, P2.X, P2.Y), Point(FLeft + (FRight - FLeft) div 2, FTop + (FBottom - FTop) div 2), A, D);
  if FHandler <> nil then FHandler.MoveParasiticView(ColMsg, A, D);
end;

// PUMLCustomColMessageManipulator
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLQualifiedAssociationEdgeManipulator

procedure PUMLQualifiedAssociationEdgeManipulator.BeginManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer);
var
  L: PUMLAssociationView;
  ZX, ZY: Integer;
begin
  // ZoomFactor only applied coordinates.
  ZX := X;  ZY := Y;
  CoordRevTransform(ADiagramEditor.ZoomFactor, NOGRID, ZX, ZY);

  L := AView as PUMLAssociationView;
  FPoints.Assign(L.Points);
  FStyle := (AView as PEdgeView).LineStyle;

  if FStyle = lsRectilinear then begin
    // select point or line
    FSelectedIndex := L.SelectedPoint(Canvas, Point(ZX, ZY));
    // decide location-kind of selected point
    if FSelectedIndex = 0 then
      FEdgeSelectLocation := slTail
    else if FSelectedIndex = FPoints.Count - 1 then
      FEdgeSelectLocation := slHead
    else begin
      FEdgeSelectLocation := slLine;
      if FSelectedIndex = -1 then
        FSelectedIndex := L.ContainedIndex(Canvas, Point(ZX, ZY));
    end;
  end
  else begin
    // select point or line or add point
    FSelectedIndex := L.SelectedPoint(Canvas, Point(ZX, ZY));
    if FSelectedIndex <> 0 then begin
      if L.TailQualifierCompartment.Visible then
        FPoints.PointData[0] := GetCenter(L.TailQualifierCompartment.GetBoundingBox(Canvas))
      else
        FPoints.PointData[0] := GetCenter(L.Tail.GetBoundingBox(Canvas));
    end;
    if FSelectedIndex <> FPoints.Count - 1 then begin
      if L.HeadQualifierCompartment.Visible then
        FPoints.PointData[FPoints.Count-1] := GetCenter(L.HeadQualifierCompartment.GetBoundingBox(Canvas))
      else
        FPoints.PointData[FPoints.Count-1] := GetCenter(L.Head.GetBoundingBox(Canvas));
    end;

    if FSelectedIndex = -1 then begin
      FSelectedIndex := L.ContainedIndex(Canvas, Point(ZX, ZY));
      Inc(FSelectedIndex);
      FPoints.Insert(FSelectedIndex, Point(ZX, ZY));
    end;

    // decide location-kind of selected point
    if FSelectedIndex = 0 then
      FEdgeSelectLocation := slTail
    else if FSelectedIndex = FPoints.Count - 1 then
      FEdgeSelectLocation := slHead
    else
      FEdgeSelectLocation := slLine;
  end;

  // set cursor
  if FEdgeSelectLocation = slLine then
    Screen.Cursor := crDefault
  else
    Screen.Cursor := crHandPoint;

  FOriginPoints.Assign(FPoints);
end;

// PUMLQualifiedAssociationEdgeManipulator
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLPortManipulator

function PUMLPortManipulator.GetPermittedRegion(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView): TRect;
var
  R: TRect;
begin
  if AView.ContainerView = nil then
    Result := inherited GetPermittedRegion(ADiagramEditor, Canvas, AView)
  else begin
    R := AView.ContainerView.GetBoundingBox(Canvas);
    R.Left := R.Left - PORT_MINWIDTH div 2;
    R.Right := R.Right + PORT_MINWIDTH div 2;
    R.Top := R.Top - PORT_MINHEIGHT div 2;
    R.Bottom := R.Bottom + PORT_MINHEIGHT div 2;
    Result := R;
  end;    
end;

// PUMLPortManipulator
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PLineManipulator

constructor PLineManipulator.Create(Handler: PSelectHandler);
begin
  inherited;
  FPoints := PPoints.Create;
  FOriginPoints := PPoints.Create;
end;

destructor PLineManipulator.Destroy;
begin
  FPoints.Free;
  FOriginPoints.Free;
  inherited;
end;

procedure PLineManipulator.FitToGrid(APoints: PPoints; AGridFactor: PGridFactor);
var
  I: Integer;
begin
  // Because end of edge must be fit to BoundingBox of node and not be under influence of grid
  for I := 1 to APoints.Count - 2 do
    APoints.PointData[I] := Point(APoints.PointData[I].X - APoints.PointData[I].X mod AGridFactor.Width,
                        APoints.PointData[I].Y - APoints.PointData[I].Y mod AGridFactor.Height);

end;

procedure PLineManipulator.BeginManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; X, Y: Integer);
var
  L: PLineView;
  ZX, ZY: Integer;
  ProbedPoint: TPoint;
begin
  // ZoomFactor only applied coordinates.
  ZX := X;  ZY := Y;
  CoordRevTransform(ADiagramEditor.ZoomFactor, NOGRID, ZX, ZY);

  L := AView as PLineView;
  FPoints.Assign(L.Points);

  ProbedPoint := Point(ZX + DEFAULT_HALF_HIGHLIGHTER_SIZE, ZY + DEFAULT_HALF_HIGHLIGHTER_SIZE);
  if EqualPt(ProbedPoint,FPoints.PointData[0]) then
    FSelectedIndex := 0
  else if EqualPt(ProbedPoint, FPoints.PointData[1]) then
    FSelectedIndex := 1
  else
    FSelectedIndex := NO_ENDPOINT_SELECTED;

  // set cursor
  Screen.Cursor := crHandPoint;

  // Remember also inital points
  FOriginPoints.Assign(FPoints);
end;

procedure PLineManipulator.PaintSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas);
begin
  DrawDottedLine(Canvas, FPoints);
end;

procedure PLineManipulator.MoveSkeleton(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; var DX: Integer; var DY: Integer);

  function GridFitX(X: Integer): Integer;
  begin
    Result := X - (X mod ADiagramEditor.GridFactor.Width);
  end;

  function GridFitY(Y: Integer): Integer;
  begin
    Result := Y - (Y mod ADiagramEditor.GridFactor.Height);
  end;

  procedure PutPointBoundsOnCanvas(var P: TPoint);
  begin
    if P.X < 0 then P.X := 0
    else if P.X > ADiagramEditor.DiagramWidth then P.X := ADiagramEditor.DiagramWidth;
    if P.Y < 0 then P.Y := 0
    else if P.Y > ADiagramEditor.DiagramHeight then P.Y := ADiagramEditor.DiagramHeight;
  end;

  procedure SetSkeletonEndPoint(PointIndex: Integer);
  var
    P: TPoint;
    OP: TPoint;
  begin
   // Get selected point
    P := Point(FPoints.PointData[PointIndex].X, FPoints[PointIndex].Y);
    OP := Point(FOriginPoints[PointIndex].X, FOriginPoints[PointIndex].Y);

    // Move skeleton
    if (P.X + DX >= OP.X) and (P.X + DX <= GridFitX(OP.X) + ADiagramEditor.GridFactor.Width) then begin
      DX := OP.X - P.X;
      P.X := OP.X;
    end
    else begin
      DX := DX - ((P.X + DX) - GridFitX(P.X + DX));
      P.X := GridFitX(P.X + DX);
    end;

    if (P.Y + DY >= OP.Y) and (P.Y + DY <= GridFitY(OP.Y) + ADiagramEditor.GridFactor.Height) then begin
      DY := OP.Y - P.Y;
      P.Y := OP.Y;
    end
    else begin
      DY := DY - ((P.Y + DY) - GridFitY(P.Y + DY));
      P.Y := GridFitY(P.Y + DY);
    end;

    // Modify point not to stray from Canvas
    PutPointBoundsOnCanvas(P);
    FPoints[PointIndex] := P;
  end;

var
  I: Integer;
begin
  if FSelectedIndex = NO_ENDPOINT_SELECTED then begin
    for I := 0 to FPoints.Count - 1 do
        SetSkeletonEndPoint(I);
  end
  else
    SetSkeletonEndPoint(FSelectedIndex);
end;



procedure PLineManipulator.EndManipulate(ADiagramEditor: PDiagramEditor; Canvas: PCanvas; AView: PView; DX, DY: Integer);
var
  V, OldPart: PView;
  LineView: PLineView;
begin
  if (DX <> 0) or (DY <> 0) then begin
    LineView := AView as PLineView;
    FPoints.ReduceLine;
    if FSelectedIndex = NO_ENDPOINT_SELECTED then
      FHandler.MoveView(AView, DX, DY)
    else
      FHandler.ModifyEdge(LineView, FPoints)
    (*else begin
      LineView := AView as PLineView;
      if FSelectedIndex = 0 then
        FHandler.ResizeNode(LineView, LineView.Left + DX, LineView.Top + DY,
          LineView.Right, LineView.Bottom)
      else
        FHandler.ResizeNode(LineView, LineView.Left, LineView.Top,
          LineView.Right + DX, LineView.Bottom + DY);
    end;*)

    (*if FHandler <> nil then begin
      if FEdgeSelectLocation = slLine then
        FHandler.ModifyEdge(AView as PLineView, FPoints)
      else begin
        V := ADiagramEditor.DiagramView.GetBottomViewAt(Canvas,
          FPoints.Points[FSelectedIndex].X, FPoints.Points[FSelectedIndex].Y);
        if V <> nil then begin
          if V = OldPart then
            FHandler.ModifyEdge(AView as PLineView, FPoints)
          else
            FHandler.ReconnectEdge(AView as PLineView, FPoints, V, FEdgeSelectLocation = slTail);
        end;
      end;
    end;*)
  end;
  Screen.Cursor := crDefault;
end;

// PLineManipulator
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PManipulatorBinder

constructor PManipulatorBinder.Create(Handler: PSelectHandler);
begin
  FNodeManipulator := PNodeManipulator.Create(Handler);
  FEdgeManipulator := PEdgeManipulator.Create(Handler);
  FParasiticManipulator := PParasiticManipulator.Create(Handler);
  FCustomSeqMessageManipulator := PUMLCustomSeqMessageManipulator.Create(Handler);
  FCustomColMessageManipulator := PUMLCustomColMessageManipulator.Create(Handler);
  FQualifiedAssociationEdgeManipulator := PUMLQualifiedAssociationEdgeManipulator.Create(Handler);
  FPortManipulator := PUMLPortManipulator.Create(Handler);
  FLineManipulator := PLineManipulator.Create(Handler);
end;

destructor PManipulatorBinder.Destroy;
begin
  FNodeManipulator.Free;
  FEdgeManipulator.Free;
  FParasiticManipulator.Free;
  FCustomSeqMessageManipulator.Free;
  FCustomColMessageManipulator.Free;
  FQualifiedAssociationEdgeManipulator.Free;
  FPortManipulator.Free;
  FLineManipulator.Free;
  inherited;
end;

function PManipulatorBinder.Bind(View: PView): PManipulator;
begin
  Result := nil;
  if View is PUMLAssociationView then begin
    if (View as PUMLAssociationView).HeadQualifierCompartment.Visible or
      (View as PUMLAssociationView).TailQualifierCompartment.Visible then Result := FQualifiedAssociationEdgeManipulator
    else Result := FEdgeManipulator;
  end
  else if View is PUMLCustomSeqMessageView then Result := FCustomSeqMessageManipulator
  else if View is PUMLCustomColMessageView then Result := FCustomColMessageManipulator
  else if View is PUMLPortView then Result := FPortManipulator
  else if View is PParasiticView then Result := FParasiticManipulator
  else if View is PLineView then Result := FLineManipulator
  else if View is PNodeView then Result := FNodeManipulator
  else if View is PEdgeView then Result := FEdgeManipulator
end;

// PManipulatorBinder
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PManipulatableNotifier

procedure PManipulatableNotifier.MouseMove(Sender: PDiagramEditor; Canvas: PCanvas; Shift: TShiftState; X, Y: Integer);
var
  V: PView;
  LV: PLineView;
  NV: PNodeView;
  EV: PEdgeView;
  ZX, ZY: Integer;
  ZR: TRect;
  P, ZP1, ZP2: TPoint;
  B: Boolean;
  MX, MY: Integer;
  SelectionType: PCornerType;
begin
  if Sender.DiagramView.SelectedViewCount <> 1 then begin
    Screen.Cursor := crDefault;
    Exit;
  end;

  ZX := X;  ZY := Y;
  CoordRevTransform(Sender.ZoomFactor, NOGRID, ZX, ZY);

  V := Sender.DiagramView.SelectedView[0];
  P := Point(X, Y);

  if V is PLineView then begin
    LV := V as PLineView;
    ZP1 := LV.Points.PointData[0];
    ZP2 := LV.Points.PointData[LV.Points.Count - 1];
    CoordTransform(Sender.ZoomFactor, NOGRID, ZP1);
    CoordTransform(Sender.ZoomFactor, NOGRID, ZP2);

    if EqualPt(ZP1, P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
      Screen.Cursor := crHandPoint
    else if EqualPt(ZP2, P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
      Screen.Cursor := crHandPoint
    else
      Screen.Cursor := crDefault;
  end

  else if V is PNodeView then begin
    NV := V as PNodeView;

    ZR := V.GetBoundingBox(Canvas);
    CoordTransform(Sender.ZoomFactor, NOGRID, ZR);
    MX := (ZR.Left + ZR.Right) div 2; MY := (ZR.Top + ZR.Bottom) div 2;

    B := True;
    SelectionType := ctElse;
    if (NV.Sizable = szNone) or NV.AutoResize then begin
      SelectionType := ctElse; B := False;
    end;
    if B and ((NV.Sizable = szFree) or (NV.Sizable = szRatio)) then begin
      if EqualPt(Point(ZR.Left - DEFAULT_HALF_HIGHLIGHTER_SIZE, ZR.Top - DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then begin
        SelectionType := ctLT; B := False;
      end
      else if EqualPt(Point(ZR.Right + DEFAULT_HALF_HIGHLIGHTER_SIZE, ZR.Top - DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then begin
        SelectionType := ctRT; B := False;
      end
      else if EqualPt(Point(ZR.Left - DEFAULT_HALF_HIGHLIGHTER_SIZE, ZR.Bottom + DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then begin
        SelectionType := ctLB; B := False;
      end
      else if EqualPt(Point(ZR.Right + DEFAULT_HALF_HIGHLIGHTER_SIZE, ZR.Bottom + DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then begin
        SelectionType := ctRB; B := False;
      end;
    end;
    if B and ((NV.Sizable = szFree) or (NV.Sizable = szVert)) then begin
      if EqualPt(Point(MX, ZR.Top - DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then begin
        SelectionType := ctMT; B := False;
      end
      else if EqualPt(Point(MX, ZR.Bottom + DEFAULT_HALF_HIGHLIGHTER_SIZE), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then begin
        SelectionType := ctMB; B := False;
      end;
    end;
    if B and ((NV.Sizable = szFree) or (NV.Sizable = szHorz)) then begin
      if EqualPt(Point(ZR.Left - DEFAULT_HALF_HIGHLIGHTER_SIZE, MY), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then begin
        SelectionType := ctLM; B := False;
      end
      else if EqualPt(Point(ZR.Right + DEFAULT_HALF_HIGHLIGHTER_SIZE, MY), P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then begin
        SelectionType := ctRM; B := False;
      end;
    end;
    if B then SelectionType := ctElse;

    case SelectionType of
      ctLT: Screen.Cursor := crSizeNWSE;
      ctRB: Screen.Cursor := crSizeNWSE;
      ctRT: Screen.Cursor := crSizeNESW;
      ctLB: Screen.Cursor := crSizeNESW;
      ctMT, ctMB: Screen.Cursor := crSizeNS;
      ctLM, ctRM: Screen.Cursor := crSizeWE;
      ctElse: Screen.Cursor := crDefault;
    end;
  end

  else if V is PEdgeView then begin
    EV := V as PEdgeView;
    ZP1 := EV.Points.PointData[0];
    ZP2 := EV.Points.PointData[EV.Points.Count - 1];
    CoordTransform(Sender.ZoomFactor, NOGRID, ZP1);
    CoordTransform(Sender.ZoomFactor, NOGRID, ZP2);

    if EqualPt(ZP1, P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
      Screen.Cursor := crHandPoint
    else if EqualPt(ZP2, P, DEFAULT_HALF_HIGHLIGHTER_SIZE) then
      Screen.Cursor := crHandPoint
    else
      Screen.Cursor := crDefault;
  end;
end;

// PManipulatableNotifier
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PContainmentHandlingProxy

constructor PContainmentHandlingProxy.Create;
begin
  FContainerView := nil;
  FActivated := True;
end;

function PContainmentHandlingProxy.CanBeContainedAt(AView, TargetView: PView): Boolean;
begin
  if (AView = nil) or (TargetView = nil) or (AView.Model = nil) or (TargetView.Model = nil) then begin
    Result := False;
    Exit;
  end;

  Result := TargetView.CanContainView(AView) and TargetView.Model.CanContain(AView.Model);
end;

function PContainmentHandlingProxy.CanBeContainedAt(AViewSet: POrderedSet; TargetView: PView): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to AViewSet.Count - 1 do
    if not CanBeContainedAt(AViewSet.Items[I] as PView, TargetView) then begin
      Result := False;
      Exit;
    end;
end;

procedure PContainmentHandlingProxy.BeginHandling;
begin
  FContainerView := nil;
  FActivated := True;
end;

procedure PContainmentHandlingProxy.MouseMoveHandling(Canvas: PCanvas; AView: PView; TargetView: PView);
begin
  if not FActivated or (AView = nil) then Exit;
  if FContainerView <> nil then
    FContainerView.EraseContainingBox(Canvas);
  if TargetView = nil then
    FContainerView := nil
  else if CanBeContainedAt(AView, TargetView) then
    FContainerView := TargetView
  else
    FContainerView := AView.ContainerView;
  if FContainerView <> nil then
    FContainerView.DrawContainingBox(Canvas);
end;

procedure PContainmentHandlingProxy.MouseMoveHandling(Canvas: PCanvas; AViewSet: POrderedSet; TargetView: PView);
begin
  if not FActivated or (AViewSet.Count = 0) then Exit;
  if FContainerView <> nil then
    FContainerView.EraseContainingBox(Canvas);
  if TargetView = nil then
    FContainerView := nil
  else if CanBeContainedAt(AViewSet, TargetView) then
    FContainerView := TargetView
  else
    FContainerView := (AViewSet.Items[0] as PView).ContainerView;
  if FContainerView <> nil then
    FContainerView.DrawContainingBox(Canvas);
end;

procedure PContainmentHandlingProxy.MouseUpHandling(Canvas: PCanvas);
begin
  if not FActivated then Exit;
  if FContainerView <> nil then
    FContainerView.EraseContainingBox(Canvas);
end;

procedure PContainmentHandlingProxy.EndHandling;
begin
  FActivated := False;
  FContainerView := nil;
end;

// PContainmentHandlingProxy
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Auxiliary functions

function GetDistance(NodeView1, NodeView2: PNodeView): Integer;
var
  R1, R2: TRect;
  CP1, CP2: TPoint;
  Junc1, Junc2: TPoint;
begin
  R1 := Rect(NodeView1.Left, NodeView1.Top, NodeView1.Right, NodeView1.Bottom);
  R2 := Rect(NodeView2.Left, NodeView2.Top, NodeView2.Right, NodeView2.Bottom);
  CP1 := GetCenter(R1);
  CP2 := GetCenter(R2);
  Junc1 := Junction(R1, CP2);
  Junc2 := Junction(R2, CP1);
  Result := Round(Sqrt(Sqr(Junc1.X - Junc2.X) + Sqr(Junc1.Y - Junc2.Y)));
end;

function GetCenterPoint(AMsgView: PUMLCustomSeqMessageView): TPoint;
var
  P: TPoint;
begin
  P.X := (AMsgView.Points.PointData[0].X + AMsgView.Points.PointData[AMsgView.Points.Count - 1].X) div 2;
  P.Y := AMsgView.Points.PointData[0].Y;
  Result := P;
end;

function IsLinked(MsgA, MsgB: PUMLCustomSeqMessageView): Boolean;
begin
  Result := (MsgA.Head = MsgB.Head) or (MsgA.Head = MsgB.Tail) or (MsgA.Tail = MsgB.Head) or (MsgA.Tail = MsgB.Tail);
end;

function IsOverlapedXPos(MsgA, MsgB: PUMLCustomSeqMessageView): Boolean;

  procedure Swap(var A: Integer; var B: Integer);
  var
    T: Integer;
  begin
    T := A;
    A := B;
    B := T;
  end;

var
  XA1, XA2, XB1, XB2: Integer;
begin
  if (MsgA.Head = MsgA.Tail) or (MsgB.Head = MsgB.Tail) then
    Result := False
  else begin
    XA1 := ((MsgA.Head as PUMLLifeLineView).Left + (MsgA.Head as PUMLLifeLineView).Right) div 2;
    XA2 := ((MsgA.Tail as PUMLLifeLineView).Left + (MsgA.Tail as PUMLLifeLineView).Right) div 2;
    if XA1 > XA2 then
      Swap(XA1, XA2);
    XB1 := ((MsgB.Head as PUMLLifeLineView).Left + (MsgB.Head as PUMLLifeLineView).Right) div 2;
    XB2 := ((MsgB.Tail as PUMLLifeLineView).Left + (MsgB.Tail as PUMLLifeLineView).Right) div 2;
    if XB1 > XB2 then
      Swap(XB1, XB2);
    Result := ((XA1 >= XB1) and (XA2 <= XB2)) or ((XB1 >= XA1) and (XB2 <= XA2));
  end;    
end;

function GetPrevSeqObjectView(AObjView: PUMLCustomSeqObjectView): PUMLCustomSeqObjectView;
var
  DgmView: PDiagramView;
  MaxRight: Integer;
  Obj, PrevObj: PUMLCustomSeqObjectView;
  I: Integer;
begin
  Result := AObjView;
  DgmView := AObjView.OwnerDiagramView;
  if DgmView = nil then Exit;
  MaxRight := Low(Integer);
  PrevObj := nil;
  for I := 0 to DgmView.OwnedViewCount - 1 do
    if DgmView.OwnedView[I] is PUMLCustomSeqObjectView then begin
      Obj := DgmView.OwnedView[I] as PUMLCustomSeqObjectView;
      if (Obj <> AObjView) and (Obj.Right < AObjView.Right) and (Obj.Right > MaxRight) then begin
        PrevObj := Obj;
        MaxRight := Obj.Right;
      end;
    end;
  Result := PrevObj;
end;

function GetNextSeqObjectView(AObjView: PUMLCustomSeqObjectView): PUMLCustomSeqObjectView;
var
  DgmView: PDiagramView;
  MinLeft: Integer;
  Obj, NextObj: PUMLCustomSeqObjectView;
  I: Integer;
begin
  Result := AObjView;
  DgmView := AObjView.OwnerDiagramView;
  if DgmView = nil then Exit;
  MinLeft := High(Integer);
  NextObj := nil;
  for I := 0 to DgmView.OwnedViewCount - 1 do
    if DgmView.OwnedView[I] is PUMLCustomSeqObjectView then begin
      Obj := DgmView.OwnedView[I] as PUMLCustomSeqObjectView;
      if (Obj <> AObjView) and (Obj.Left > AObjView.Left) and (Obj.Left < MinLeft) then begin
        NextObj := Obj;
        MinLeft := Obj.Left;
      end;
    end;
  Result := NextObj;
end;

function GetFirstSeqMessageView(AObjView: PUMLCustomSeqObjectView): PUMLCustomSeqMessageView;
var
  DgmView: PDiagramView;
  Msg: PUMLCustomSeqMessageView;
  TailObj: PUMLCustomSeqObjectView;
  I: Integer;
begin
  Result := nil;
  DgmView := AObjView.OwnerDiagramView;
  if DgmView = nil then Exit;
  for I := 0 to DgmView.OwnedViewCount - 1 do
    if DgmView.OwnedView[I] is PUMLCustomSeqMessageView then begin
      Msg := DgmView.OwnedView[I] as PUMLCustomSeqMessageView;
      TailObj := (Msg.Tail as PUMLLifeLineView).Parent as PUMLCustomSeqObjectView;
      if TailObj = AObjView then begin
        Result := Msg;
        Exit;
      end;
    end;
end;

function GetNextSeqMessageView(AMsgView: PUMLCustomSeqMessageView): PUMLCustomSeqMessageView;
var
  DgmView: PDiagramView;
  V: PUMLCustomSeqMessageView;
  C: TPoint;
  Idx: Integer;
  I: Integer;
begin
  Result := AMsgView;
  DgmView := AMsgView.OwnerDiagramView;
  if DgmView = nil then
    Exit;
  Idx := DgmView.IndexOfOwnedView(AMsgView);
  // ASSERTIONS
  Assert(Idx <> -1);
  // ASSERTIONS
  C := GetCenterPoint(AMsgView);
  for I := Idx + 1 to DgmView.OwnedViewCount - 1 do
    if DgmView.OwnedView[I] is PUMLCustomSeqMessageView then begin
      V := DgmView.OwnedView[I] as PUMLCustomSeqMessageView;
      if IsLinked(AMsgView, V) and (GetCenterPoint(V).X >= C.X) then begin
        Result := DgmView.OwnedView[I] as PUMLCustomSeqMessageView;
        Exit;
      end;  
    end;
end;

function GetPrevSeqMessageView(AMsgView: PUMLCustomSeqMessageView): PUMLCustomSeqMessageView;
var
  DgmView: PDiagramView;
  V: PUMLCustomSeqMessageView;
  C: TPoint;
  Idx: Integer;
  I: Integer;
begin
  Result := AMsgView;
  DgmView := AMsgView.OwnerDiagramView;
  if DgmView = nil then
    Exit;
  Idx := DgmView.IndexOfOwnedView(AMsgView);
  // ASSERTIONS
  Assert(Idx <> -1);
  // ASSERTIONS
  C := GetCenterPoint(AMsgView);
  for I := Idx - 1 downto 0 do
    if DgmView.OwnedView[I] is PUMLCustomSeqMessageView then begin
      V := DgmView.OwnedView[I] as PUMLCustomSeqMessageView;
      if IsLinked(AMsgView, V) and (GetCenterPoint(V).X <= C.X) then begin
        Result := DgmView.OwnedView[I] as PUMLCustomSeqMessageView;
        Exit;
      end;
    end;
end;

function GetUpperSeqMessageView(AMsgView: PUMLCustomSeqMessageView): PUMLCustomSeqMessageView;
var
  DgmView: PDiagramView;
  V: PUMLCustomSeqMessageView;
  Idx: Integer;
  I: Integer;
begin
  Result := AMsgView;
  DgmView := AMsgView.OwnerDiagramView;
  if DgmView = nil then
    Exit;
  Idx := DgmView.IndexOfOwnedView(AMsgView);
  // ASSERTIONS
  Assert(Idx <> -1);
  // ASSERTIONS
  for I := Idx - 1 downto 0 do
    if DgmView.OwnedView[I] is PUMLCustomSeqMessageView then begin
      V := DgmView.OwnedView[I] as PUMLCustomSeqMessageView;
      if IsOverlapedXPos(V, AMsgView) then begin
        Result := V;
        Exit;
      end;
    end;
end;
    
function GetLowerSeqMessageView(AMsgView: PUMLCustomSeqMessageView): PUMLCustomSeqMessageView;
var
  DgmView: PDiagramView;
  V: PUMLCustomSeqMessageView;
  Idx: Integer;
  I: Integer;
begin
  Result := AMsgView;
  DgmView := AMsgView.OwnerDiagramView;
  if DgmView = nil then
    Exit;
  Idx := DgmView.IndexOfOwnedView(AMsgView);
  // ASSERTIONS
  Assert(Idx <> -1);
  // ASSERTIONS
  for I := Idx + 1 to DgmView.OwnedViewCount - 1 do
    if DgmView.OwnedView[I] is PUMLCustomSeqMessageView then begin
      V := DgmView.OwnedView[I] as PUMLCustomSeqMessageView;
      if IsOverlapedXPos(V, AMsgView) then begin
        Result := V;
        Exit;
      end;
    end;
end;

function GetInvokingObjectView(AMsgView: PUMLCustomSeqMessageView): PUMLCustomSeqObjectView;
begin
  Result := (AMsgView.Tail as PUMLLifeLineView).Parent as PUMLCustomSeqObjectView;
end;

function FindNearestSequenceView(AView: PView; Direction: PDirectionKind): PView;
var
  ObjView: PUMLCustomSeqObjectView;
  MsgView: PUMLCustomSeqMessageView;
  V: PView;
begin
  V := AView;
  if AView is PUMLCustomSeqObjectView then begin
    ObjView := AView as PUMLCustomSeqObjectView;
    case Direction of
      dkLeft:   V := GetPrevSeqObjectView(ObjView);
      dkRight:  V := GetNextSeqObjectView(ObjView);
      dkDown:   V := GetFirstSeqMessageView(ObjView);
    end;
  end
  else if AView is PUMLCustomSeqMessageView then begin
    MsgView := AView as PUMLCustomSeqMessageView;
    case Direction of
      dkLeft:   V := GetPrevSeqMessageView(MsgView);
      dkRight:  V := GetNextSeqMessageView(MsgView);
      dkDown:   V := GetLowerSeqMessageView(MsgView);
      dkUp:
        begin
          V := GetUpperSeqMessageView(MsgView);
          if V = MsgView then
            V := GetInvokingObjectView(MsgView);
        end;
    end;
  end;
  if V = nil then
    V := AView;
  Result := V;
end;

function FindNearestNodeView(ANodeView: PNodeView; Direction: PDirectionKind): PNodeView;

  function GetFirstNodeView(ADiagramView: PDiagramView): PNodeView;
  var
    V: PView;
    I: Integer;
  begin
    Result := nil;
    for I := 0 to ADiagramView.OwnedViewCount - 1 do begin
      V := ADiagramView.OwnedView[I];
      if V is PNodeView then begin
        Result := V as PNodeView;
        Exit;
      end;
    end;
  end;

var
  DgmView: PDiagramView;
  NearestView, V: PNodeView;
  MinDist, Dist: Integer;
  I: Integer;
begin
  Result := ANodeView;
  if ANodeView.OwnerDiagramView = nil then
    Exit;
  DgmView := ANodeView.OwnerDiagramView;
  MinDist := High(Integer);
  NearestView := nil;
  for I := 0 to DgmView.OwnedViewCount - 1 do
    if (DgmView.OwnedView[I] is PNodeView) then begin
      V := DgmView.OwnedView[I] as PNodeView;
      if V <> ANodeView then begin
        Dist := GetDistance(V, ANodeView);
        if (Direction = dkLeft) and (V.Right < ANodeView.Left) and (Dist < MinDist) then begin
          NearestView := V;
          MinDist := Dist;
        end
        else if (Direction = dkRight) and (V.Left > ANodeView.Right) and (Dist < MinDist) then begin
          NearestView := V;
          MinDist := Dist;
        end
        else if (Direction = dkUp) and (V.Bottom < ANodeView.Top) and (Dist < MinDist) then begin
          NearestView := V;
          MinDist := Dist;
        end
        else if (Direction = dkDown) and (V.Top > ANodeView.Bottom) and (Dist < MinDist) then begin
          NearestView := V;
          MinDist := Dist;
        end;
      end;
    end;
  if NearestView = nil then
    NearestView := GetFirstNodeView(DgmView);
  if NearestView = nil then
    NearestView := ANodeView;    
  Result := NearestView;
end;

function FindNearestView(AView: PView; Direction: PDirectionKind): PView;
begin
  Result := AView;
  if (AView is PUMLCustomSeqObjectView) or (AView is PUMLCustomSeqMessageView) then
    Result := FindNearestSequenceView(AView, Direction)
  else if AView is PNodeView then
    Result := FindNearestNodeView(AView as PNodeView, Direction);
end;

// Auxiliary functions
////////////////////////////////////////////////////////////////////////////////

end.
