unit ModelExplorerFrame;

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
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VirtualTrees, ExtCtrls, IniFiles, ImgList, dxBar,
  ActiveX, ComCtrls, ToolWin, System.UITypes, Generics.Collections,
  FlatPanel, BasicClasses, Core, UMLModels;

const
  DEFAULT_FILTERINGSET: array [0..67] of PClass = (
    PUMLModel, PUMLSubsystem, PUMLPackage, PUMLClass, PUMLInterface,
    PUMLEnumeration, PUMLSignal, PUMLException, PUMLComponent,
    PUMLComponentInstance, PUMLNode, PUMLNodeInstance, PUMLUseCase, PUMLActor,
    PUMLActivityGraph, PUMLStateMachine, PUMLCompositeState, PUMLCollaboration,
    PUMLCollaborationInstanceSet, PUMLInteraction, PUMLInteractionInstanceSet,
    PUMLActionState, PUMLSubactivityState, PUMLPseudostate, PUMLFinalState,
    PUMLPartition, PUMLSubmachineState, PUMLAttribute, PUMLOperation,
    PUMLParameter, PUMLTemplateParameter, PUMLEnumerationLiteral, PUMLCallAction,
    PUMLSendAction, PUMLCreateAction, PUMLDestroyAction, PUMLReturnAction,
    PUMLUninterpretedAction, PUMLSignalEvent, PUMLCallEvent, PUMLTimeEvent,
    PUMLChangeEvent, PUMLClassifierRole, PUMLObject, PUMLStimulus, PUMLMessage,
    PUMLClassDiagram, PUMLUseCaseDiagram, PUMLSequenceDiagram,
    PUMLSequenceRoleDiagram, PUMLCollaborationDiagram,
    PUMLCollaborationRoleDiagram, PUMLStatechartDiagram, PUMLActivityDiagram,
    PUMLComponentDiagram, PUMLDeploymentDiagram, PUMLCompositeStructureDiagram,
    PUMLObjectFlowState, PUMLFlowFinalState, PUMLSignalAcceptState, PUMLSignalSendState,
    PUMLArtifact, PUMLAttributeLink, PUMLPort, PUMLCombinedFragment,
    PUMLInteractionOperand, PUMLExtensionPoint, PUMLFrame);

  FULL_FILTERINGSET: array [0..78] of PClass = (
    PUMLModel, PUMLSubsystem, PUMLPackage, PUMLClass, PUMLInterface,
    PUMLEnumeration, PUMLSignal, PUMLException, PUMLComponent,
    PUMLComponentInstance, PUMLNode, PUMLNodeInstance, PUMLUseCase, PUMLActor,
    PUMLActivityGraph, PUMLStateMachine, PUMLCompositeState, PUMLCollaboration,
    PUMLCollaborationInstanceSet, PUMLInteraction, PUMLInteractionInstanceSet,
    PUMLActionState, PUMLSubactivityState, PUMLPseudostate, PUMLFinalState,
    PUMLPartition, PUMLSubmachineState, PUMLAttribute, PUMLOperation,
    PUMLParameter, PUMLTemplateParameter, PUMLEnumerationLiteral, PUMLTransition,
    PUMLCallAction, PUMLSendAction, PUMLCreateAction, PUMLDestroyAction,
    PUMLReturnAction, PUMLUninterpretedAction, PUMLSignalEvent, PUMLCallEvent,
    PUMLTimeEvent, PUMLChangeEvent, PUMLClassifierRole, PUMLObject,
    PUMLDependency, PUMLAssociation, PUMLAssociationClass, PUMLGeneralization,
    PUMLLink, PUMLAssociationRole, PUMLStimulus, PUMLMessage, PUMLInclude,
    PUMLExtend, PUMLRealization, PUMLClassDiagram, PUMLUseCaseDiagram,
    PUMLSequenceDiagram, PUMLSequenceRoleDiagram, PUMLCollaborationDiagram,
    PUMLCollaborationRoleDiagram, PUMLStatechartDiagram, PUMLActivityDiagram,
    PUMLComponentDiagram, PUMLDeploymentDiagram, PUMLCompositeStructureDiagram,
    PUMLObjectFlowState, PUMLFlowFinalState, PUMLSignalAcceptState, PUMLSignalSendState,
    PUMLArtifact, PUMLAttributeLink, PUMLPort, PUMLConnector, PUMLCombinedFragment,
    PUMLInteractionOperand, PUMLExtensionPoint, PUMLFrame);

  BASIC_FILTERINGSET: array [0..67] of PClass = (
    PUMLModel, PUMLSubsystem, PUMLPackage, PUMLClass, PUMLInterface,
    PUMLEnumeration, PUMLSignal, PUMLException, PUMLComponent,
    PUMLComponentInstance, PUMLNode, PUMLNodeInstance, PUMLUseCase, PUMLActor,
    PUMLActivityGraph, PUMLStateMachine, PUMLCompositeState, PUMLCollaboration,
    PUMLCollaborationInstanceSet, PUMLInteraction, PUMLInteractionInstanceSet,
    PUMLActionState, PUMLSubactivityState, PUMLPseudostate, PUMLFinalState,
    PUMLPartition, PUMLSubmachineState, PUMLAttribute, PUMLOperation,
    PUMLParameter, PUMLTemplateParameter, PUMLEnumerationLiteral, PUMLTransition,
    PUMLCallAction, PUMLSendAction, PUMLCreateAction, PUMLDestroyAction,
    PUMLReturnAction, PUMLUninterpretedAction, PUMLSignalEvent, PUMLCallEvent,
    PUMLTimeEvent, PUMLChangeEvent, PUMLClassifierRole, PUMLObject,
    PUMLDependency, PUMLAssociation, PUMLAssociationClass, PUMLGeneralization,
    PUMLLink, PUMLAssociationRole, PUMLStimulus, PUMLMessage, PUMLInclude,
    PUMLExtend, PUMLRealization,
    PUMLObjectFlowState, PUMLFlowFinalState, PUMLSignalAcceptState, PUMLSignalSendState,
    PUMLArtifact, PUMLAttributeLink, PUMLPort, PUMLConnector, PUMLCombinedFragment,
    PUMLInteractionOperand, PUMLExtensionPoint, PUMLFrame);

  CLASSIFIER_FILTERINGSET: array [0..12] of PClass = (
    PUMLModel, PUMLSubsystem, PUMLPackage, PUMLClass, PUMLInterface,
    PUMLEnumeration, PUMLSignal, PUMLException, PUMLComponent, PUMLNode,
    PUMLUseCase, PUMLActor, PUMLArtifact);

  RELATION_FILTERINGSET: array [0..12] of PClass = (
    PUMLTransition, PUMLDependency, PUMLAssociation, PUMLAssociationClass,
    PUMLGeneralization, PUMLLink, PUMLAssociationRole, PUMLStimulus, PUMLMessage,
    PUMLInclude, PUMLExtend, PUMLRealization, PUMLConnector);

  INSTANCE_FILTERINGSET: array[0..2] of PClass = (
    PUMLObject, PUMLComponentInstance, PUMLNodeInstance);

type
  // Event Types
  PElementRelocatingEvent = procedure (Source, Target: PModel) of object;
  PModelIndexChangingEvent = procedure (Sender: TObject; Owner: PModel;
    Owned: PModel; Key: string; NewOrder: Integer) of object;

  // Enumeration Types
  PModelExplorerSortType = (stStorage, stAlphabetic);

  // PMetaNode
  PMetaNode = class
  private
    FModelClass: PClass;
    FCaption: string;
    FImageIndex: Integer;
    FFiltered: Boolean; // True if node is filtered in
    FIndex: Integer;

  public
    constructor Create(AModelClass: PClass; CaptionStr: string; ImgIdx: Integer);
    property ModelClass: PClass read FModelClass;
    property Caption: string read FCaption write FCaption;
    property ImageIndex: Integer read FImageIndex;
    property Filtered: Boolean read FFiltered write FFiltered;
    property Index: Integer read FIndex;
  end;

  // NodeData
  PNodeData = ^TNodeData;
  TNodeData = record
    Model: PModel;
    MetaNode: PMetaNode;
  end;

  // TModelExplorerPanel2
  TModelExplorerPanel = class(TFrame)
    ModelTree: TVirtualStringTree;
    ClientPanel: TFlatPanel;
    DragTimeTimer: TTimer;
    ModelExplorerImageList: TImageList;
    ModelExplorerToolbar: TToolBar;
    SortByStorageOrderItem: TToolButton;
    SortByAlphabeticOrderItem: TToolButton;
    SeparatorItem1: TToolButton;
    FilterElementsItem: TToolButton;
    SeparatorItem2: TToolButton;
    MoveUpItem: TToolButton;
    MoveDownItem: TToolButton;
    procedure ModelTreeGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure ModelTreeGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: TImageIndex);
    procedure SortItemClick(Sender: TObject);
    procedure FilterElementsItemClick(Sender: TObject);
    procedure MoveItemClick(Sender: TObject);
    procedure ModelTreeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ModelTreeDblClick(Sender: TObject);
    procedure ModelTreeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ModelTreeChange(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure ModelTreeDragDrop(Sender: TBaseVirtualTree; Source: TObject;
      DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState;
      Pt: TPoint; var Effect: Integer; Mode: TDropMode);
    procedure ModelTreeDragOver(Sender: TBaseVirtualTree; Source: TObject;
      Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode;
      var Effect: Integer; var Accept: Boolean);
    procedure ModelTreeCollapsed(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure ModelTreeNewText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; NewText: string);
    procedure ModelTreeEditing(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
    procedure ModelTreeEditCancelled(Sender: TBaseVirtualTree;
      Column: TColumnIndex);
    procedure ModelTreeCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure ModelTreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ModelTreeEdited(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex);
    procedure DragTimeTimerTimer(Sender: TObject);
  private type
    PNodeHashTable = TDictionary<string,PVirtualNode>;
  private
    FProject: PUMLProject;
    NodeHashTable: PNodeHashTable;
    FDragSourceNode: PVirtualNode;
    FDropTargetNode: PVirtualNode;
    FMetaNodes: THashedStringList;
    FPopupMenu: TdxBarPopupMenu;
    FAcceptStatus: Boolean;
    FCollapsedTimeFlag: Boolean;
    FSortType: PModelExplorerSortType;
    FShowStereotype: Boolean;
    FOnSortTypeChanged: TNotifyEvent;
    FOnElementSelected: PModelEvent;
    FOnBrowseDiagram: PDiagramEvent;
    FOnElementRelocating: PElementRelocatingEvent;
    FOnModelNameChange: PModelNameEvent;
    FOnElementAttributeChange: PElementAttributeEvent;
    FOnEnableGeneralEditMenu: TNotifyEvent;
    FOnDisableGeneralEditMenu: TNotifyEvent;
    FOnModelIndexChanging: PModelIndexChangingEvent;
    FContextMenuLaunched: Boolean;

    function GetStereotypeText(AModel: PModel): string;
    procedure InitializeMetaNodes;
    procedure FinalizeMetaNodes;
    procedure AddMetaNode(AModelClass: PClass; CaptionStr: string; ImgIdx: Integer);
    function GetMetaNode(Index: Integer): PMetaNode;
    function GetMetaNodeCount: Integer;
    function GetImageList: TCustomImageList;
    function GetStateImageList: TCustomImageList;
    procedure SetImageList(Value: TCustomImageList);
    procedure SetStateImageList(Value: TCustomImageList);
    procedure ClearNodes;
    function CreateNode(ParentNode: PVirtualNode; Model: PModel): PVirtualNode;
    procedure DeleteNode(Node: PVirtualNode);
    procedure UpdateNode(Node: PVirtualNode);
    function FindNode(Model: PModel): PVirtualNode;
    procedure BuildNodes(BaseModel: PModel; BaseNode: PVirtualNode; CompletelyRebuild: Boolean = True);
    procedure SetRelocateTargetNode(Value: PVirtualNode; var Accept: Boolean);
    procedure SetSortType(Value: PModelExplorerSortType);
    procedure SetShowStereotype(Value: Boolean);
    procedure SelectionChanged(Model: PModel);
    procedure EnableGeneralEditMenu;
    procedure DisableGeneralEditMenu;
    procedure DragTimeAutoScroll;
    function IsMousePosTopScrollZone(Y: Integer): Boolean;
    function IsMousePosBottomScrollZone(Y: Integer): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure RefreshNodes;
    procedure Expand(Model: PModel);
    procedure AddModels(Models: PModelOrderedSet);
    procedure DeleteModels(Models: PModelOrderedSet);
    procedure UpdateModels(Models: PModelOrderedSet);
    procedure RebuildAll(CompletelyRebuild: Boolean = True; UseUpdateLock: Boolean = True);
    function Select(AModel: PModel): Boolean;
    function SelectWithFocus(AModel: PModel): Boolean;
    procedure SetNameEditingMode(AModel: PModel);
    procedure ClearFilter;
    procedure AddToFilter(const Classes: array of PClass);
    procedure DeleteFromFilter(const Classes: array of PClass);
    function IsFiltered(Model: PModel): Boolean;
    function FindMetaNode(Model: PModel): PMetaNode;
    function FindMetaNodeByClass(AClass: PClass): PMetaNode;
    procedure SaveToRegistry(Key: string);
    procedure LoadFromRegistry(Key: string);
    property MetaNodes[Index: Integer]: PMetaNode read GetMetaNode;
    property MetaNodeCount: Integer read GetMetaNodeCount;
    property Project: PUMLProject read FProject write FProject;
    property ImageList: TCustomImageList read GetImageList write SetImageList;
    property StateImageList: TCustomImageList read GetStateImageList write SetStateImageList;
    property PopupMenu: TdxBarPopupMenu read FPopupMenu write FPopupMenu;
    property SortType: PModelExplorerSortType read FSortType write SetSortType;
    property ShowStereotype: Boolean read FShowStereotype write SetShowStereotype;
    property OnSortTypeChanged: TNotifyEvent read FOnSortTypeChanged write FOnSortTypeChanged;
    property OnElementSelected: PModelEvent read FOnElementSelected write FOnElementSelected;
    property OnBrowseDiagram: PDiagramEvent read FOnBrowseDiagram write FOnBrowseDiagram;
    property OnElementRelocating: PElementRelocatingEvent write FOnElementRelocating;
    property OnModelNameChange: PModelNameEvent read FOnModelNameChange write FOnModelNameChange;
    property OnElementAttributeChange: PElementAttributeEvent read FOnElementAttributeChange write FOnElementAttributeChange;
    property OnEnableGeneralEditMenu: TNotifyEvent read FOnEnableGeneralEditMenu write FOnEnableGeneralEditMenu;
    property OnDisableGeneralEditMenu: TNotifyEvent read FOnDisableGeneralEditMenu write FOnDisableGeneralEditMenu;
    property OnModelIndexChanging: PModelIndexChangingEvent read FOnModelIndexChanging write FOnModelIndexChanging;
    property ContextMenuLaunched: Boolean read FContextMenuLaunched;
  end;

implementation

uses
  Registry,
   MainFrm, ExtCore, ModelExpFilterFrm, LogMgr, UMLAux;

{$R *.dfm}


////////////////////////////////////////////////////////////////////////////////
// PMetaNode

constructor PMetaNode.Create(AModelClass: PClass; CaptionStr: string; ImgIdx: Integer);
begin
  FModelClass := AModelClass;
  FCaption := CaptionStr;
  FImageIndex := ImgIdx;
  FFiltered := True;
end;

// PMetaNode
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TModelExplorerPanel2

constructor TModelExplorerPanel.Create(AOwner: TComponent);
begin
  inherited;
  ModelTree.NodeDataSize := SizeOf(TNodeData);
  ModelTree.DoubleBuffered := True;
  ModelTree.TreeOptions.AutoOptions := ModelTree.TreeOptions.AutoOptions - [toAutoSort];
  NodeHashTable := PNodeHashTable.Create;
  FMetaNodes := THashedStringList.Create;
  FMetaNodes.CaseSensitive := True;
  FSortType := stStorage;
  FShowStereotype := True;
  FCollapsedTimeFlag := False;
  InitializeMetaNodes;
  ClearFilter;
  AddToFilter(DEFAULT_FILTERINGSET);
end;

destructor TModelExplorerPanel.Destroy;
begin
  Clear;
  FinalizeMetaNodes;
  FMetaNodes.Free;
  NodeHashTable.Free;
  inherited;
end;

function TModelExplorerPanel.GetStereotypeText(AModel: PModel): string;
var
  S: string;
  ME: PUMLModelElement;
begin
  if FShowStereotype then
  begin
    S := '';
    if (AModel is PUMLModelElement) then
    begin
      ME := AModel as PUMLModelElement;
      if Trim(ME.StereotypeName) <> '' then
        S := '<<' + Trim(ME.StereotypeName) + '>> ';
    end;
    Result := S;
  end
  else
    Result := '';
end;

procedure TModelExplorerPanel.InitializeMetaNodes;
begin
  { Registering All Meta Nodes }
  AddMetaNode(PUMLProject,                  'Project',                      5);
  AddMetaNode(PUMLClassDiagram,             'Class Diagram',                91);
  AddMetaNode(PUMLUseCaseDiagram,           'UseCase Diagram',              92);
  AddMetaNode(PUMLSequenceDiagram,          'Sequence Diagram',             93);
  AddMetaNode(PUMLSequenceRoleDiagram,      'Sequence Diagram (Role)',      94);
  AddMetaNode(PUMLCollaborationDiagram,     'Collaboration Diagram',        95);
  AddMetaNode(PUMLCollaborationRoleDiagram, 'Collaboration Diagram (Role)', 96);
  AddMetaNode(PUMLStatechartDiagram,        'Statechart Diagram',           97);
  AddMetaNode(PUMLActivityDiagram,          'Activity Diagram',             98);
  AddMetaNode(PUMLComponentDiagram,         'Component Diagram',            99);
  AddMetaNode(PUMLDeploymentDiagram,        'Deployment Diagram',           100);
  AddMetaNode(PUMLCompositeStructureDiagram,'Composite Structure Diagram',  179);
  AddMetaNode(PUMLModel,                    'Model',                        7);
  AddMetaNode(PUMLSubsystem,                'Subsystem',                    10);
  AddMetaNode(PUMLPackage,                  'Package',                      13);
  AddMetaNode(PUMLClass,                    'Class',                        16);
  AddMetaNode(PUMLInterface,                'Interface',                    17);
  AddMetaNode(PUMLEnumeration,              'Enumeration',                  18);
  AddMetaNode(PUMLSignal,                   'Signal',                       19);
  AddMetaNode(PUMLException,                'Exception',                    20);
  AddMetaNode(PUMLComponent,                'Component',                    21);
  AddMetaNode(PUMLComponentInstance,        'ComponentInstance',            22);
  AddMetaNode(PUMLNode,                     'Node',                         23);
  AddMetaNode(PUMLNodeInstance,             'NodeInstance',                 24);
  AddMetaNode(PUMLUseCase,                  'UseCase',                      25);
  AddMetaNode(PUMLActor,                    'Actor',                        26);
  AddMetaNode(PUMLActivityGraph,            'ActivityGraph',                27);
  AddMetaNode(PUMLStateMachine,             'StateMachine',                 28);
  AddMetaNode(PUMLCompositeState,           'Composite State',              29);
  AddMetaNode(PUMLCollaboration,            'Collaboration',                30);
  AddMetaNode(PUMLCollaborationInstanceSet, 'CollaborationInstanceSet',     31);
  AddMetaNode(PUMLInteraction,              'Interaction',                  32);
  AddMetaNode(PUMLInteractionInstanceSet,   'InteractionInstanceSet',       33);
  AddMetaNode(PUMLActionState,              'ActionState',                  34);
  AddMetaNode(PUMLSubactivityState,         'SubactivityState',             35);
  AddMetaNode(PUMLPSeudostate,              'Pseudostate',                  37);
  AddMetaNode(PUMLFinalState,               'FinalState',                   43);
  AddMetaNode(PUMLPartition,                'Partition',                    44);
  AddMetaNode(PUMLSubmachineState,          'SubmachineState',              45);
  AddMetaNode(PUMLAttribute,                'Attribute',                    46);
  AddMetaNode(PUMLOperation,                'Operation',                    50);
  AddMetaNode(PUMLParameter,                'Parameter',                    54);
  AddMetaNode(PUMLTemplateParameter,        'TemplateParameter',            55);
  AddMetaNode(PUMLEnumerationLiteral,       'EnumerationLiteral',           56);
  AddMetaNode(PUMLTransition,               'Transition',                   57);
  AddMetaNode(PUMLCallAction,               'CallAction',                   59);
  AddMetaNode(PUMLSendAction,               'SendAction',                   60);
  AddMetaNode(PUMLCreateAction,             'CreateAction',                 61);
  AddMetaNode(PUMLDestroyAction,            'DestroyAction',                62);
  AddMetaNode(PUMLReturnAction,             'ReturnAction',                 63);
  AddMetaNode(PUMLUninterpretedAction,      'UninterpretedAction',          64);
  AddMetaNode(PUMLSignalEvent,              'SignalEvent',                  68);
  AddMetaNode(PUMLCallEvent,                'CallEvent',                    69);
  AddMetaNode(PUMLTimeEvent,                'TimeEvent',                    70);
  AddMetaNode(PUMLChangeEvent,              'ChangeEvent',                  71);
  AddMetaNode(PUMLClassifierRole,           'ClassifierRole',               72);
  AddMetaNode(PUMLObject,                   'Object',                       73);
  AddMetaNode(PUMLObjectFlowState,          'ObjectFlowState',              171);
  AddMetaNode(PUMLFlowFinalState,           'FlowFinalState',               166);
  AddMetaNode(PUMLSignalAcceptState,        'SignalAcceptState',            159);
  AddMetaNode(PUMLSignalSendState,          'SignalSendState',              160);
  AddMetaNode(PUMLArtifact,                 'Artifact',                     176);
  AddMetaNode(PUMLAttributeLink,            'AttributeLink',                178);
  AddMetaNode(PUMLPort,                     'Port',                         173);
  AddMetaNode(PUMLCombinedFragment,         'CombinedFragment',             163);
  AddMetaNode(PUMLInteractionOperand,       'InteractionOperand',           169);
  AddMetaNode(PUMLExtensionPoint,           'ExtensionPoint',               177);
  AddMetaNode(PUMLFrame,                    'Frame',                        167);
  AddMetaNode(PUMLDependency,               'Dependency',                   74);
  AddMetaNode(PUMLAssociation,              'Association',                  75);
  AddMetaNode(PUMLAssociationClass,         'AssociationClass',             76);
  AddMetaNode(PUMLGeneralization,           'Generalization',               77);
  AddMetaNode(PUMLLink,                     'Link',                         78);
  AddMetaNode(PUMLAssociationRole,          'AssociationRole',              80);
  AddMetaNode(PUMLStimulus,                 'Stimulus',                     82);
  AddMetaNode(PUMLMessage,                  'Message',                      85);
  AddMetaNode(PUMLInclude,                  'Include',                      88);
  AddMetaNode(PUMLExtend,                   'Extend',                       89);
  AddMetaNode(PUMLRealization,              'Realization',                  90);
  AddMetaNode(PUMLConnector,                'Connector',                    164);
end;

procedure TModelExplorerPanel.FinalizeMetaNodes;
var
  I: Integer;
  MetaNode: PMetaNode;
begin
  for I := MetaNodeCount - 1 downto 0 do begin
    MetaNode := MetaNodes[I];
    MetaNode.Free;
  end;
end;

procedure TModelExplorerPanel.AddMetaNode(AModelClass: PClass; CaptionStr: string; ImgIdx: Integer);
var
  M: PMetaNode;
  Idx: Integer;
begin
  M := PMetaNode.Create(AModelClass, CaptionStr, ImgIdx);
  Idx := FMetaNodes.AddObject(AModelClass.ClassName, M);
  M.FIndex := Idx;
end;

function TModelExplorerPanel.GetMetaNode(Index: Integer): PMetaNode;
begin
  Result := FMetaNodes.Objects[Index] as PMetaNode;
end;

function TModelExplorerPanel.GetMetaNodeCount: Integer;
begin
  Result := FMetaNodes.Count;
end;

function TModelExplorerPanel.GetImageList: TCustomImageList;
begin
  Result := ModelTree.Images;
end;

function TModelExplorerPanel.GetStateImageList: TCustomImageList;
begin
  Result := ModelTree.StateImages;
end;

procedure TModelExplorerPanel.SetImageList(Value: TCustomImageList);
begin
  ModelTree.Images := Value;
end;

procedure TModelExplorerPanel.SetStateImageList(Value: TCustomImageList);
begin
  ModelTree.StateImages := Value;
end;

procedure TModelExplorerPanel.ClearNodes;
begin
  ModelTree.Clear;
  NodeHashTable.Clear;
end;

function TModelExplorerPanel.CreateNode(ParentNode: PVirtualNode; Model: PModel): PVirtualNode;
var
  Node: PVirtualNode;
  NodeData: PNodeData;
  MetaNode: PMetaNode;
begin
  Node := nil;
  MetaNode := FindMetaNode(Model);
  if (MetaNode <> nil) and MetaNode.Filtered then
  begin
    if ParentNode <> nil then
    begin
      Node := ModelTree.AddChild(ParentNode);
      NodeData := ModelTree.GetNodeData(Node);
      NodeData.Model := Model;
      NodeData.MetaNode := MetaNode;
    end
    else begin
      // Create RootNode.
      Node := ModelTree.AddChild(nil);
      NodeData := ModelTree.GetNodeData(Node);
      NodeData.Model := Model;
      NodeData.MetaNode := MetaNode;
    end;

    NodeHashTable.Add(Model.GUID, Node);
  end;
  Result := Node;
end;

procedure TModelExplorerPanel.DeleteNode(Node: PVirtualNode);
var
  I: Integer;
  NodeData: PNodeData;
  FirstChild: PVirtualNode;
  ChildCount: Cardinal;
begin
  if Node <> nil then
  begin
    // Delete child nodes recursively.
    ChildCount := ModelTree.ChildCount[Node];
    for I := 1 to ChildCount do
    begin
      FirstChild := ModelTree.GetFirstChild(Node);
      DeleteNode(FirstChild);
    end;
    NodeData := ModelTree.GetNodeData(Node);
    if Assigned(NodeData.Model) then
      NodeHashTable.Remove(NodeData.Model.GUID);
    ModelTree.DeleteNode(Node);
  end;
end;

procedure TModelExplorerPanel.UpdateNode(Node: PVirtualNode);
begin
  ModelTree.Sort(Node, -1, sdAscending);
  ModelTree.InvalidateNode(Node);
end;

function TModelExplorerPanel.FindNode(Model: PModel): PVirtualNode;
begin
  if Assigned(Model) then
    NodeHashTable.TryGetValue(Model.GUID, Result);
end;

procedure TModelExplorerPanel.BuildNodes(BaseModel: PModel; BaseNode: PVirtualNode; CompletelyRebuild: Boolean = True);
var
  I: Integer;
  Model: PModel;
  Node, N: PVirtualNode;
  NodeData: PNodeData;
begin
  if (BaseModel <> nil) and (BaseNode <> nil) then
  begin
    for I := 0 to BaseModel.VirtualOwnedModelCount - 1 do
    begin
      Model := BaseModel.VirtualOwnedModel[I];
      if CompletelyRebuild then
      begin
        Node := CreateNode(BaseNode, Model);
      end
      else begin
        Node := FindNode(Model);
        if Node = nil then
          Node := CreateNode(BaseNode, Model);
      end;
      BuildNodes(Model, Node, CompletelyRebuild);
    end;

    Node := BaseNode.LastChild;
    while Node <> nil do begin
      NodeData := ModelTree.GetNodeData(Node);
      // ASSERTIONS
      Assert(NodeData <> nil); Assert(NodeData.Model <> nil);
      // ASSERTIONS
      if BaseModel.IndexOfVirtualOwnedModel(NodeData.Model) = -1 then begin
        N := Node.PrevSibling;
        DeleteNode(Node);
        Node := N;
      end
      else
        Node := Node.PrevSibling;
    end;
  end;
end;

procedure TModelExplorerPanel.SetRelocateTargetNode(Value: PVirtualNode; var Accept: Boolean);
var
  SourceNodeData, TargetNodeData: PNodeData;
  Msg: string;
begin
  if FDropTargetNode <> Value then begin
    Msg := '';
    FDropTargetNode := Value;
    SourceNodeData := ModelTree.GetNodeData(FDragSourceNode);
    TargetNodeData := ModelTree.GetNodeData(FDropTargetNode);

    // ASSERTIONS
    Assert(SourceNodeData <> nil); Assert(SourceNodeData.Model <> nil);
    Assert(TargetNodeData <> nil); Assert(TargetNodeData.Model <> nil);
    // ASSERTIONS

    // check avaiable to be droped
    FAcceptStatus := SourceNodeData.Model.CanRelocateTo(TargetNodeData.Model);
  end;
  Accept := FAcceptStatus;
end;

procedure TModelExplorerPanel.SetSortType(Value: PModelExplorerSortType);
begin
  if FSortType <> Value then begin
    FSortType := Value;
    ModelTree.SortTree(-1, sdAscending);
    case FSortType of
      stStorage:
      begin
        SortByStorageOrderItem.Down := True;
        SortByAlphabeticOrderItem.Down := False;
      end;
      stAlphabetic:
      begin
        SortByAlphabeticOrderItem.Down := True;
        SortByStorageOrderItem.Down := False;
      end;
    end;

    if Assigned(FOnSortTypeChanged) then
    begin
      {case FSortType of
        stStorage: SortByStorageOrderItem.Down := True;
        stAlphabetic: SortByAlphabeticOrderItem.Down := True;
      end;}
      FOnSortTypeChanged(Self);
    end;
  end;
end;

procedure TModelExplorerPanel.SetShowStereotype(Value: Boolean);
begin
  if FShowStereotype <> Value then
  begin
    FShowStereotype := Value;
    RefreshNodes;
  end;
end;

procedure TModelExplorerPanel.SelectionChanged(Model: PModel);
begin
  if Assigned(FOnElementSelected) then
    FOnElementSelected(Self, Model);
end;

procedure TModelExplorerPanel.EnableGeneralEditMenu;
begin
  if Assigned(FOnEnableGeneralEditMenu) then
    FOnEnableGeneralEditMenu(Self);
end;

procedure TModelExplorerPanel.DisableGeneralEditMenu;
begin
  if Assigned(FOnDisableGeneralEditMenu) then
    FOnDisableGeneralEditMenu(Self);
end;

procedure TModelExplorerPanel.DragTimeAutoScroll;
var
  Pt: TPoint;
begin
  GetCursorPos(Pt);
  Pt := ModelTree.ScreenToClient(Pt);
  if (GetKeyState(VK_LBUTTON) < 0) and
     (IsMousePosTopScrollZone(Pt.Y) or IsMousePosBottomScrollZone(Pt.Y)) then
  begin
    if not DragTimeTimer.Enabled then
      DragTimeTimer.Enabled := True;
  end
  else if DragTimeTimer.Enabled then begin
      DragTimeTimer.Enabled := False;
      ModelTree.Perform(WM_VSCROLL, SB_ENDSCROLL, 0);
  end;

end;

procedure TModelExplorerPanel.DragTimeTimerTimer(Sender: TObject);
var
  Pt: TPoint;
begin
  GetCursorPos(Pt);
  Pt := ModelTree.ScreenToClient(Pt);
  if DragTimeTimer.Enabled then begin
    if IsMousePosTopScrollZone(Pt.Y) then
      ModelTree.Perform(wm_vscroll, SB_LINEUP, 0)
    else if IsMousePosBottomScrollZone(Pt.Y) then
      ModelTree.Perform(wm_vscroll, SB_LINEDOWN, 0);
  end;
end;

function TModelExplorerPanel.IsMousePosTopScrollZone(Y: Integer): Boolean;
begin
  Result := False;
  if (ModelTree.Top - Y <= 0) and (ModelTree.Top - Y >= -10) then
  begin
    Result := True;
  end;
end;

function TModelExplorerPanel.IsMousePosBottomScrollZone(Y: Integer): Boolean;
begin
  Result := False;
  if ((ModelTree.Top + ModelTree.Height) - Y >= 0) and
     ((ModelTree.Top + ModelTree.Height) - Y <= 10) then
  begin
    Result := True;
  end;
end;

procedure TModelExplorerPanel.Clear;
begin
  ClearNodes;
end;

procedure TModelExplorerPanel.RefreshNodes;
begin
  ModelTree.Repaint;
end;

procedure TModelExplorerPanel.Expand(Model: PModel);
var
  Node: PVirtualNode;
begin
  Node := FindNode(Model);
  if Node <> nil then
    ModelTree.Expanded[Node] := True;
end;

procedure TModelExplorerPanel.AddModels(Models: PModelOrderedSet);
var
  M: PModel;
  Node, ParentNode: PVirtualNode;
  NodeData: PNodeData;
begin
  for M in Models do begin
    Node := FindNode(M);
    if Node = nil then
    begin
      ParentNode := FindNode(M.VirtualNamespace);
      if ParentNode <> nil then begin
        Node := CreateNode(ParentNode, M);
        if Node <> nil then
        begin
          NodeData := ModelTree.GetNodeData(Node);
          BuildNodes(NodeData.Model, Node);
        end;
        // ParentNode.Update;
      end;
    end;
  end;
  ModelTree.SortTree(-1, sdAscending);
end;

procedure TModelExplorerPanel.DeleteModels(Models: PModelOrderedSet);
var
  Node: PVirtualNode;
  Model: PModel;
begin
  for Model in Models do begin
    Node := FindNode(Model);
    if Assigned(Node) then
      DeleteNode(Node);
  end;
  ModelTree.SortTree(-1, sdAscending);
end;

procedure TModelExplorerPanel.UpdateModels(Models: PModelOrderedSet);
var
  Node: PVirtualNode;
  Model: PModel;
begin
  for Model in Models do begin
    Node := FindNode(Model);
    if Node <> nil then
      UpdateNode(Node);
  end;
  ModelTree.SortTree(-1, sdAscending);
end;

procedure TModelExplorerPanel.RebuildAll(CompletelyRebuild, UseUpdateLock: Boolean);
var
  RootNode: PVirtualNode;
begin
  if UseUpdateLock then ModelTree.BeginUpdate;
  if CompletelyRebuild then
  begin
    ClearNodes;
    if FProject <> nil then
    begin
      RootNode := CreateNode(nil, FProject);
      BuildNodes(FProject, RootNode);
    end;
  end
  else begin
    if FProject <> nil then
    begin
      RootNode := FindNode(FProject);
      BuildNodes(FProject, RootNode, False);
    end;
  end;
  ModelTree.SortTree(-1, sdAscending);
  if UseUpdateLock then ModelTree.EndUpdate;
end;

function TModelExplorerPanel.Select(AModel: PModel): Boolean;
var
  Node: PVirtualNode;
begin
  Result := False;
  if AModel <> nil then
  begin
    Node := FindNode(AModel);
    if Node <> nil then
    begin
      ModelTree.Selected[Node] := True;
      ModelTree.FocusedNode := Node;
      Result := True;
    end;
  end;
end;

function TModelExplorerPanel.SelectWithFocus(AModel: PModel): Boolean;
begin
  Result := False;
  if Visible and Enabled then begin
    Result := Select(AModel);
    if ModelTree.Visible and ModelTree.Enabled then
      ModelTree.SetFocus;
  end;
end;

procedure TModelExplorerPanel.SetNameEditingMode(AModel: PModel);
var
  Node: PVirtualNode;
begin
  if not Visible then Exit;
  if AModel <> nil then
  begin
    Node := FindNode(AModel);
    if Node <> nil then
    begin
      ModelTree.FocusedNode := Node;
      ModelTree.EditNode(Node, -1);
    end;
  end
  else begin
    if ModelTree.FocusedNode <> nil then
      ModelTree.EditNode(ModelTree.FocusedNode, -1);
  end;
end;

procedure TModelExplorerPanel.ClearFilter;
var
  I: Integer;
  MetaNode: PMetaNode;
begin
  // set all MeteNode's Filtered to false
  for I := 1 to MetaNodeCount - 1 do
  begin
    MetaNode := MetaNodes[I];
    MetaNode.Filtered := False;
  end;
end;

procedure TModelExplorerPanel.AddToFilter(const Classes: array of PClass);
var
  MetaNode: PMetaNode;
  MetaClass: PClass;
begin
  // if MetaNode's ModelClass is contained in Classes, Filtered is true
  for MetaClass in Classes do begin
    MetaNode := FindMetaNodeByClass(MetaClass);
    if Assigned(MetaNode) then
      MetaNode.Filtered := True;
  end;
end;

procedure TModelExplorerPanel.DeleteFromFilter(const Classes: array of PClass);
var
  MetaNode: PMetaNode;
  MetaClass: PClass;
begin
  // if MetaNode's ModelClass is contained in Classes, Filtered is false
  for MetaClass in Classes do begin
    MetaNode := FindMetaNodeByClass(MetaClass);
    if Assigned(MetaNode) then
      MetaNode.Filtered := False;
  end;
end;

function TModelExplorerPanel.IsFiltered(Model: PModel): Boolean;
var
  MetaNode: PMetaNode;
begin
  Result := False;
  MetaNode := FindMetaNode(Model);
  if MetaNode <> nil then
    Result := MetaNode.Filtered;
end;

function TModelExplorerPanel.FindMetaNode(Model: PModel): PMetaNode;
var
  Idx: Integer;
begin
  Idx := FMetaNodes.IndexOf(Model.ClassName);
  if Idx < 0 then
    Result := nil
  else
    Result := FMetaNodes.Objects[Idx] as PMetaNode;
end;

function TModelExplorerPanel.FindMetaNodeByClass(AClass: PClass): PMetaNode;
var
  Idx: Integer;
begin
  Idx := FMetaNodes.IndexOf(AClass.ClassName);
  if Idx < 0 then
    Result := nil
  else
    Result := FMetaNodes.Objects[Idx] as PMetaNode;
end;

procedure TModelExplorerPanel.SaveToRegistry(Key: string);
var
  Reg: TRegistry;
  I: Integer;
  MetaNode: PMetaNode;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(Key, True) then
    begin
      // Save SortType
      Reg.WriteInteger('SortType', Ord(SortType));
      // Save Filtering
      for I := 0 to MetaNodeCount - 1 do
      begin
        MetaNode := MetaNodes[I];
        Reg.WriteBool('Filter['+MetaNode.Caption+']', MetaNode.Filtered);
      end;
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TModelExplorerPanel.LoadFromRegistry(Key: string);
var
  Reg: TRegistry;
  I: Integer;
  MetaNode: PMetaNode;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(Key, False) then
    begin
      // Load SortType
      try
        SortType := PModelExplorerSortType(Reg.ReadInteger('SortType'));
      except
        SortType := stStorage;
      end;
      // Load Filtering
      for I := 0 to MetaNodeCount - 1 do
      begin
        MetaNode := MetaNodes[I];
        try
          MetaNode.Filtered := Reg.ReadBool('Filter['+MetaNode.Caption+']');
        except
          MetaNode.Filtered := False;
        end;
      end;
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TModelExplorerPanel.ModelTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  NodeData: PNodeData;
  Model: PModel;

  function GetAssociationText(M: PUMLAssociation): string;
  var
    S, C1, C2: string;
  begin
    if M.Connections[0].Participant <> nil then
      C1 := M.Connections[0].Participant.Name;
    if M.Connections[1].Participant <> nil then
      C2 := M.Connections[1].Participant.Name;
    S := '';
    if M.Name <> '' then S := M.Name + ':';
    S := S + '(' + C1 + '-' + C2 + ')';
    Result := GetStereotypeText(M) + S;
  end;

  function GetAssociationClassText(M: PUMLAssociationClass): string;
  var
    S, A1, A2, C1, C2: string;
  begin
    if M.AssociationSide <> nil then
    begin
      if M.AssociationSide.Connections[0].Participant <> nil then
        A1 := M.AssociationSide.Connections[0].Participant.Name;
      if M.AssociationSide.Connections[1].Participant <> nil then
        A2 := M.AssociationSide.Connections[1].Participant.Name;
      if M.AssociationSide.Name <> '' then
        C1 := M.AssociationSide.Name
      else
        C1 := A1 + ':' + A2;
    end;
    if M.ClassSide <> nil then
      C2 := M.ClassSide.Name;
    S := '';
    if M.Name <> '' then S := M.Name + ':';
    S := S + '(' + C1 + '-' + C2 + ')';
    Result := GetStereotypeText(M) + S;
  end;

  function GetDependencyText(M: PUMLDependency): string;
  var
    S, C1, C2: string;
  begin
    if M.Client <> nil then
      C1 := M.Client.Name;
    if M.Supplier <> nil then
      C2 := M.Supplier.Name;
    S := '';
    if M.Name <> '' then S := M.Name + ':';
    S := S + '(' + C1 + '->' + C2 + ')';
    Result := GetStereotypeText(M) + S;
  end;

  function GetLinkText(M: PUMLLink): string;
  var
    S, C1, C2: string;
  begin
    if M.Connections[0].Instance <> nil then
      C1 := M.Connections[0].Instance.Name;
    if M.Connections[1].Instance <> nil then
      C2 := M.Connections[1].Instance.Name;
    S := '';
    if M.Name <> '' then S := M.Name + ':';
    S := S + '(' + C1 + '-' + C2 + ')';
    Result := GetStereotypeText(M) + S;
  end;

  function GetGeneralizationText(M: PUMLGeneralization): string;
  var
    S, C1, C2: string;
  begin
    if M.Child <> nil then
      C1 := M.Child.Name;
    if M.Parent <> nil then
      C2 := M.Parent.Name;
    S := '';
    if M.Name <> '' then S := M.Name + ':';
    S := S + '(' + C1 + '->' + C2 + ')';
    Result := GetStereotypeText(M) + S;
  end;

  function GetMessageText(M: PUMLMessage): string;
  var
    S, C1, C2: string;
  begin
    if M.Sender <> nil then
      C1 := M.Sender.Name;
    if M.Receiver <> nil then
      C2 := M.Receiver.Name;
    S := '';
    if M.Name <> '' then S := M.Name + ':';
    S := S + '(' + C1 + '->' + C2 + ')';
    Result := GetStereotypeText(M) + S;
  end;

  function GetStimulusText(M: PUMLStimulus): string;
  var
    S, C1, C2: string;
  begin
    if M.Sender <> nil then
      C1 := M.Sender.Name;
    if M.Receiver <> nil then
      C2 := M.Receiver.Name;
    S := '';
    if M.Name <> '' then S := M.Name + ':';
    S := S + '(' + C1 + '->' + C2 + ')';
    Result := GetStereotypeText(M) + S;
  end;

  function GetIncludeText(M: PUMLInclude): string;
  var
    S, C1, C2: string;
  begin
    if M.Addition <> nil then
      C1 := M.Addition.Name;
    if M.Base <> nil then
      C2 := M.Base.Name;
    S := '';
    if M.Name <> '' then S := M.Name + ':';
    S := S + '(' + C2 + '->' + C1 + ')';
    Result := GetStereotypeText(M) + S;
  end;

  function GetExtendText(M: PUMLExtend): string;
  var
    S, C1, C2: string;
  begin
    if M.Extension <> nil then
      C1 := M.Extension.Name;
    if M.Base <> nil then
      C2 := M.Base.Name;
    S := '';
    if M.Name <> '' then S := M.Name + ':';
    S := S + '(' + C1 + '->' + C2 + ')';
    Result := GetStereotypeText(M) + S;
  end;

  function GetTransitionText(M: PUMLTransition): string;
  var
    S, C1, C2: string;
  begin
    if M.Source <> nil then
      C1 := M.Source.Name;
    if M.Target <> nil then
      C2 := M.Target.Name;
    S := '';
    if M.Name <> '' then S := M.Name + ':';
    S := S + '(' + C1 + '->' + C2 + ')';
    Result := GetStereotypeText(M) + S;
  end;

  function GetConnectorText(M: PUMLConnector): string;
  var
    S, C1, C2: string;
  begin
    if M.Ends[0].Role <> nil then
      C1 := M.Ends[0].Role.Name;
    if M.Ends[1].Role <> nil then
      C2 := M.Ends[1].Role.Name;
    S := '';
    if M.Name <> '' then S := M.Name + ':';
    S := S + '(' + C1 + '-' + C2 + ')';
    Result := GetStereotypeText(M) + S;
  end;

  function GetInstanceText(M: PUMLInstance): string;
  var
    S: string;
  begin
    S := M.Name;
    if M.Classifier <> nil then
      S := S + ':' + M.Classifier.Name;
    Result := GetStereotypeText(M) + S;
  end;

  function GetClassifierRoleText(M: PUMLClassifierRole): string;
  var
    S: string;
  begin
    S := M.Name;
    if M.Base <> nil then
      S := S + ':' + M.Base.Name;
    Result := GetStereotypeText(M) + S;
  end;

begin
  NodeData := Sender.GetNodeData(Node);
  Model := NodeData.Model;
  if Model <> nil then
  begin
    if ModelTree.IsEditing and (ModelTree.FocusedNode = Node) then
    begin
      if Model is PUMLProject then CellText := (Model as PUMLProject).Title
                              else CellText := GetStereotypeText(Model) + Model.Name;
    end
    else begin
           if Model is PUMLProject          then CellText := (Model as PUMLProject).Title
      else if Model is PUMLDiagram          then CellText := (Model as PUMLDiagram).Name
      else if Model is PUMLOperation        then CellText := (Model as PUMLOperation).Name + '()'
      else if Model is PUMLAssociation      then CellText := GetAssociationText(Model as PUMLAssociation)
      else if Model is PUMLAssociationClass then CellText := GetAssociationClassText(Model as PUMLAssociationClass)
      else if Model is PUMLDependency       then CellText := GetDependencyText(Model as PUMLDependency)
      else if Model is PUMLLink             then CellText := GetLinkText(Model as PUMLLink)
      else if Model is PUMLGeneralization   then CellText := GetGeneralizationText(Model as PUMLGeneralization)
      else if Model is PUMLMessage          then CellText := GetMessageText(Model as PUMLMessage)
      else if Model is PUMLStimulus         then CellText := GetStimulusText(Model as PUMLStimulus)
      else if Model is PUMLInclude          then CellText := GetIncludeText(Model as PUMLInclude)
      else if Model is PUMLExtend           then CellText := GetExtendText(Model as PUMLExtend)
      else if Model is PUMLTransition       then CellText := GetTransitionText(Model as PUMLTransition)
      else if Model is PUMLConnector        then CellText := GetConnectorText(Model as PUMLConnector)
      else if Model is PUMLInstance         then CellText := GetInstanceText(Model as PUMLInstance)
      else if Model is PUMLClassifierRole   then CellText := GetClassifierRoleText(Model as PUMLClassifierRole)
                                            else CellText := GetStereotypeText(Model) + Model.Name;
    end;
  end;
end;

procedure TModelExplorerPanel.ModelTreeGetImageIndex(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
  Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex);
var
  NodeData: PNodeData;
  Model: PModel;

  function GetAttributeImageIndex(M: PUMLAttribute): Integer;
  begin
    case M.Visibility of
      vkPackage:   Result := 49;
      vkPrivate:   Result := 48;
      vkProtected: Result := 47;
      vkPublic:    Result := 46;
      else         Result := -1;
    end;
  end;

  function GetOperationImageIndex(M: PUMLOperation): Integer;
  begin
    case M.Visibility of
      vkPackage:   Result := 53;
      vkPrivate:   Result := 52;
      vkProtected: Result := 51;
      vkPublic:    Result := 50;
      else         Result := -1;
    end;
  end;

  function GetPseudostateImageIndex(M: PUMLPseudostate): Integer;
  begin
    case M.PseudostateKind of
      pkShallowHistory: Result := 41;
      pkDeepHistory: Result := 42;
      pkSynchronization: Result := 38;
      pkInitial: Result := 37;
      pkChoice: Result := 40;
      pkJunction: Result := 39;
      pkDecision: Result := 36;
      else  Result := -1;
    end;
  end;

  function GetUninterpretedActionImageIndex(M: PUMLUninterpretedAction): Integer;
  begin
         if M.EntryState <> nil      then Result := 65
    else if M.DoActivityState <> nil then Result := 66
    else if M.ExitState <> nil       then Result := 67
                                     else Result := 64;
  end;

  function GetExtensibleModelImageIndex(M: PExtensibleModel; DefaultImageIndex: Integer): Integer;
  var
    S: PStereotype;
  begin
    S := M.GetStereotype;
    if (S <> nil) and (S.ImageIndex <> -1) then
      Result := S.ImageIndex
    else
      Result := DefaultImageIndex;
  end;

  function GetStateImageIndex(M: PModel): Integer;
  begin
    if M.ReadOnly then
      Result := 2
    else if M.IsDocumentElement and (M.Document is PUMLUnitStubDocument) then
      Result := 3
    else if (M.IsDocumentElement) and not (M is PUMLProject) then
      Result := 1
    else
      Result := -1;
  end;

begin
  NodeData := Sender.GetNodeData(Node);
  Model := NodeData.Model;
  if Model <> nil then
  begin
    case Kind of
      ikState: begin
        ImageIndex := GetStateImageIndex(Model);
      end;
      ikNormal, ikSelected: begin
             if Model is PUMLAttribute           then ImageIndex := GetAttributeImageIndex(Model as PUMLAttribute)
        else if Model is PUMLOperation           then ImageIndex := GetOperationImageIndex(Model as PUMLOperation)
        else if Model is PUMLPseudostate         then ImageIndex := GetPseudostateImageIndex(Model as PUMLPseudostate)
        else if Model is PUMLUninterpretedAction then ImageIndex := GetUninterpretedActionImageIndex(Model as PUMLUninterpretedAction)
        else if Model is PExtensibleModel        then ImageIndex := GetExtensibleModelImageIndex(Model as PExtensibleModel, NodeData.MetaNode.ImageIndex)
                                                 else ImageIndex := NodeData.MetaNode.ImageIndex;
      end;
    end;
  end;
end;

procedure TModelExplorerPanel.SortItemClick(Sender: TObject);
begin
  if Sender = SortByStorageOrderItem then
    SortType := stStorage
  else if Sender = SortByAlphabeticOrderItem then
    SortType := stAlphabetic
  else
    SortType := stStorage;
end;

procedure TModelExplorerPanel.FilterElementsItemClick(Sender: TObject);
begin
  ModelExplorerFilterForm.ModelExplorer := Self;
  if ModelExplorerFilterForm.Execute then begin
    ModelExplorerFilterForm.ApplyFilterChecks;
    RebuildAll;
    Expand(Project);
  end;
end;

procedure TModelExplorerPanel.MoveItemClick(Sender: TObject);

  function GetMetaCollectionNameStr(Owner, Owned: PModel): string;
  var
    AOwnerMetaClass, AOwnedMetaClass: PMetaClass;
    MetaRef: PMetaReference;
    OtherEnd: PMetaAssociationEnd;
  begin
    Result := '';
    AOwnerMetaClass := Owner.MetaClass;
    AOwnedMetaClass := Owned.MetaClass;

    MetaRef := AOwnedMetaClass.GetContainerRelation(AOwnerMetaClass);
    if MetaRef <> nil then
    begin
      OtherEnd := MetaRef.GetOtherSideEnd;
      if OtherEnd <> nil then Result := OtherEnd.Name;
    end;
  end;

  function GetPrevItemIndex(AOwner, AModel: PModel; ColName: string): Integer;
  var
    ElemType: string;
    E: PElement;
    I: Integer;
  begin
    ElemType := AModel.MetaClass.Name;
    Result := -1;
    for I := AOwner.MOF_IndexOfCollectionItem(ColName, AModel) - 1 downto 0 do begin
      E := AOwner.MOF_GetCollectionItem(ColName, I);
      if E.MetaClass.Name = ElemType then begin
        Result := I;
        Exit;
      end;
    end;
  end;

  function GetNextItemIndex(AOwner, AModel: PModel; ColName: string): Integer;
  var
    ElemType: string;
    E: PElement;
    I: Integer;
  begin
    ElemType := AModel.MetaClass.Name;
    Result := -1;
    for I := AOwner.MOF_IndexOfCollectionItem(ColName, AModel) + 1 to AOwner.MOF_GetCollectionCount(ColName) - 1 do begin
      E := AOwner.MOF_GetCollectionItem(ColName, I);
      if E.MetaClass.Name = ElemType then begin
        Result := I;
        Exit;
      end;
    end;
  end;

var
  Node: PVirtualNode;
  NodeData: PNodeData;
  AOwner, AModel: PModel;
  ColNameStr: string;
  Idx: Integer;
begin
  Node := ModelTree.FocusedNode;
  if (SortType = stStorage) and (Node <> nil) then
  begin
    NodeData := ModelTree.GetNodeData(Node);
    if NodeData.Model <> nil then
    begin
      AModel := NodeData.Model;
      if AModel.VirtualNamespace = nil then Exit; // include case AModel is PUMLProject
      AOwner := AModel.VirtualNamespace;
      ColNameStr := GetMetaCollectionNameStr(AOwner, AModel);
      if ColNameStr = '' then Exit;

      Idx := -1;
      if Sender = MoveUpItem then
        Idx := GetPrevItemIndex(AOwner, AModel, ColNameStr)
      else if Sender = MoveDownItem then
        Idx := GetNextItemIndex(AOwner, AModel, ColNameStr);

      if (Idx <> -1) and Assigned(FOnModelIndexChanging) then
        FOnModelIndexChanging(Self, AOwner, AModel, ColNameStr, Idx);
    end;
  end;
end;


// TModelExplorerPanel2
////////////////////////////////////////////////////////////////////////////////

procedure TModelExplorerPanel.ModelTreeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node: PVirtualNode;
begin
  if FCollapsedTimeFlag then begin
    FCollapsedTimeFlag := False;
    Exit;
  end;

  //if not MainForm.IsModelExplorerActive then
  //  MainForm.ActivateModelExplorerPanel;

  // Selection changing
  Node := ModelTree.GetNodeAt(X, Y);

  // Selection init
  if (Node <> nil) and ModelTree.Selected[Node] then
    ModelTree.Selected[Node] := False;
  if Node <> nil then
  begin
    ModelTree.Selected[Node] := True;
    ModelTree.FocusedNode := Node;
  end;

  // Start dragging
  if Button = mbLeft then
  begin
    if ModelTree.Selected[Node] then
    begin
      FContextMenuLaunched := False;
      FDragSourceNode := nil;
      FDropTargetNode := nil;
      FAcceptStatus := False;
      FDragSourceNode := Node;
      BeginDrag(False);
    end;
  // popup menu showing
  end
  else if Button = mbRight then begin
    if Node <> nil then begin
      FContextMenuLaunched := True;
      if Assigned(FPopupMenu) then FPopupMenu.PopupFromCursorPos;
    end;
  end;
end;

procedure TModelExplorerPanel.ModelTreeDblClick(Sender: TObject);
var
  NodeData: PNodeData;
begin
  // in case of diagram node, activate diagram
  if ModelTree.FocusedNode <> nil then begin
    NodeData := ModelTree.GetNodeData(ModelTree.FocusedNode);
    if Assigned(NodeData) and (NodeData.Model is PDiagram) then
      if Assigned(FOnBrowseDiagram) then FOnBrowseDiagram(Self, NodeData.Model as PDiagram);
  end;
end;

procedure TModelExplorerPanel.ModelTreeMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if DragTimeTimer.Enabled then begin
    ModelTree.Perform(wm_vscroll, SB_ENDSCROLL, 0);
    DragTimeTimer.Enabled := False;
  end;
end;

procedure TModelExplorerPanel.ModelTreeChange(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  NodeData: PNodeData;
begin
  // Selection changed
  if Node <> nil then
  begin
    NodeData := ModelTree.GetNodeData(Node);
    if Assigned(NodeData) and Assigned(NodeData.Model) then
      SelectionChanged(NodeData.Model);
    FContextMenuLaunched := False;
  end;
end;

procedure TModelExplorerPanel.ModelTreeDragDrop(Sender: TBaseVirtualTree;
  Source: TObject; DataObject: IDataObject; Formats: TFormatArray;
  Shift: TShiftState; Pt: TPoint; var Effect: Integer; Mode: TDropMode);
var
  SourceNodeData, TargetNodeData: PNodeData;
begin
  if Assigned(FDragSourceNode) and Assigned(FDropTargetNode) then
  begin
    SourceNodeData := ModelTree.GetNodeData(FDragSourceNode);
    TargetNodeData := ModelTree.GetNodeData(FDropTargetNode);
    if Assigned(FOnElementRelocating) then
      FOnElementRelocating(SourceNodeData.Model, TargetNodeData.Model);
  end;
end;

procedure TModelExplorerPanel.ModelTreeDragOver(Sender: TBaseVirtualTree;
  Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint;
  Mode: TDropMode; var Effect: Integer; var Accept: Boolean);
var
  TargetNode: PVirtualNode;
begin
  if FDragSourceNode <> nil then
  begin
    ModelTree.EndEditNode;
    TargetNode := ModelTree.GetNodeAt(Pt.X, Pt.Y);
    DragTimeAutoScroll;
    if Source <> Self then
      Accept := False
    else if TargetNode = nil then
      Accept := False
    else
      SetRelocateTargetNode(TargetNode, Accept);
  end
  else
    Accept := False;
end;

procedure TModelExplorerPanel.ModelTreeCollapsed(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
begin
  FCollapsedTimeFlag := True;
end;

procedure TModelExplorerPanel.ModelTreeNewText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; NewText: string);
var
  NodeData: PNodeData;
  ElemName: String;
begin
  NodeData := ModelTree.GetNodeData(Node);
  if NodeData <> nil then
  begin
    ElemName := Trim(NewText);
    if NodeData.Model is PUMLProject then
    begin
      if ((NodeData.Model as PUMLProject).Title <> ElemName) and Assigned(FOnElementAttributeChange) then
        FOnElementAttributeChange(Self, NodeData.Model, 'Title', ElemName);
    end
    else if NodeData.Model <> nil then
    begin
      if (NodeData.Model.Name <> ElemName) and Assigned(FOnModelNameChange) then
        FOnModelNameChange(Self, NodeData.Model, ElemName);
    end;
  end;
  EnableGeneralEditMenu;
end;

procedure TModelExplorerPanel.ModelTreeEditing(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
begin
  Allowed := True;
  DisableGeneralEditMenu;
end;

procedure TModelExplorerPanel.ModelTreeEditCancelled(
  Sender: TBaseVirtualTree; Column: TColumnIndex);
begin
  EnableGeneralEditMenu;
end;

procedure TModelExplorerPanel.ModelTreeCompareNodes(
  Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
  Column: TColumnIndex; var Result: Integer);
var
  NodeData1, NodeData2: PNodeData;
  I1, I2: Integer;
  R: Integer;

  function CompareIndex(Model1, Model2: PModel): Integer;
  var
    P1, P2: PModel;
    AE1, AE2: PMetaAssociationEnd;
    Idx1, Idx2: Integer;
  begin
    Idx1 := 0; Idx2 := 0;
    P1 := Model1.VirtualNamespace;
    P2 := Model2.VirtualNamespace;
    AE1 := Model1.GetContainerRelation(P1);
    AE2 := Model2.GetContainerRelation(P2);
    if (AE1 <> nil) and (AE2 <> nil) and (AE1.Name = AE2.Name) then
    begin
      if (P1 <> nil) then Idx1 := P1.MOF_IndexOfCollectionItem(AE1.GetOtherSideEnd.Name, Model1);
      if (P2 <> nil) then Idx2 := P2.MOF_IndexOfCollectionItem(AE2.GetOtherSideEnd.Name, Model2);
    end;
    if Idx1 < Idx2 then Result := -1
    else if Idx1 > Idx2 then Result := 1
    else Result := 0;
  end;

begin
  NodeData1 := ModelTree.GetNodeData(Node1);
  NodeData2 := ModelTree.GetNodeData(Node2);
  case FSortType of
    stStorage: begin
      I1 := NodeData1.MetaNode.Index;
      I2 := NodeData2.MetaNode.Index;
      if I1 < I2 then R := -1
      else if I1 > I2 then R := 1
      else R := CompareIndex(NodeData1.Model, NodeData2.Model);
      Result := R;
    end;
    stAlphabetic: begin
      I1 := NodeData1.MetaNode.Index;
      I2 := NodeData2.MetaNode.Index;
      if I1 < I2 then R := -1
      else if I1 > I2 then R := 1
      else R := CompareText(NodeData1.Model.Name, NodeData2.Model.Name);
      Result := R;
    end;
  end;
end;

procedure TModelExplorerPanel.ModelTreeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then ModelTreeDblClick(Self)
end;

procedure TModelExplorerPanel.ModelTreeEdited(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
begin
  EnableGeneralEditMenu;
end;

end.
