unit MenuManager;

interface
uses
  Classes, Generics.Collections;

const
  // Menu interaction submenus
  MODEL_ADD_SUBMENU = 'ModelAddSubMenu';
  MODEL_ADD_DIAGRAM_SUBMENU = 'ModelAddDiagramSubMenu';

  // Model Diagram interactions
  MODEL_ADD_USE_CASE_DIAGRAM = 'ModelAddUseCaseDiagram';
  MODEL_ADD_CLASS_DIAGRAM = 'ModelAddClassDiagram';
  MODEL_ADD_SEQUENCE_ROLE_DIAGRAM = 'ModelAddSequenceRoleDiagram';
  MODEL_ADD_SEQUENCE_DIAGRAM = 'ModelAddSequenceDiagram';
  MODEL_ADD_COLLABORATION_ROLE_DIAGRAM = 'ModelAddCollaborationRoleDiagram';
  MODEL_ADD_COLLABORATION_DIAGRAM = 'ModelAddCollaborationDiagram';
  MODEL_ADD_STATE_CHART_DIAGRAM = 'ModelAddStatechartDiagram';
  MODEL_ADD_ACTIVITY_DIAGRAM = 'ModelAddActivityDiagram';
  MODEL_ADD_COMPONENT_DIAGRAM = 'ModelAddComponentDiagram';
  MODEL_ADD_DEPLOYMENT_DIAGRAM = 'ModelAddDeploymentDiagram';
  MODEL_ADD_COMPOSITE_STRUCTURE_DIAGRAM = 'ModelAddCompositeStructureDiagram';

  // Model Menu interactions
  MODEL_ADD_MODEL = 'ModelAddModel';
  MODEL_ADD_SUBSYSTEM = 'ModelAddSubsystem';
  MODEL_ADD_PACKAGE = 'ModelAddPackage';
  MODEL_ADD_CLASS = 'ModelAddClass';
  MODEL_ADD_INTERFACE = 'ModelAddInterface';
  MODEL_ADD_USE_CASE = 'ModelAddUseCase';
  MODEL_ADD_ACTOR = 'ModelAddActor';
  MODEL_ADD_SIGNAL = 'ModelAddSignal';
  MODEL_ADD_EXCEPTION = 'ModelAddException';
  MODEL_ADD_OBJECT = 'ModelAddObject';
  MODEL_ADD_ENUMERATION = 'ModelAddEnumeration';
  MODEL_ADD_COMPONENT = 'ModelAddComponent';
  MODEL_ADD_COMPONENT_INSTANCE = 'ModelAddComponentInstance';
  MODEL_ADD_NODE = 'ModelAddNode';
  MODEL_ADD_NODE_INSTANCE = 'ModelAddNodeInstance';
  MODEL_ADD_OPERATION = 'ModelAddOperation';
  MODEL_ADD_ATTRIBUTE = 'ModelAddAttribute';
  MODEL_ADD_PARAMETER = 'ModelAddParameter';
  MODEL_ADD_TEMPLATE_PARAMETER = 'ModelAddTemplateParameter';
  MODEL_ADD_ENUMERATION_LITERAL = 'ModelAddEnumerationLiteral';
  MODEL_ADD_COLLABORATION = 'ModelAddCollaboration';
  MODEL_ADD_COLLABORATION_INSTANCE_SET = 'ModelAddCollaborationInstanceSet';
  MODEL_ADD_CLASSIFIER_ROLE = 'ModelAddClassifierRole';
  MODEL_ADD_INTERACTION = 'ModelAddInteraction';
  MODEL_ADD_INTERACTION_INSTANCE_SET = 'ModelAddInteractionInstanceSet';
  MODEL_ADD_STATE_MACHINE = 'ModelAddStateMachine';
  MODEL_ADD_ACTIVITY_GRAPH = 'ModelAddActivityGraph';
  MODEL_ADD_STATE = 'ModelAddState';
  MODEL_ADD_SUBMACHINE_STATE = 'ModelAddSubmachineState';
  MODEL_ADD_ACTION_STATE = 'ModelAddActionState';
  MODEL_ADD_SUBACTIVITY_STATE = 'ModelAddSubactivityState';
  MODEL_ADD_FINAL_STATE = 'ModelAddFinalState';
  MODEL_ADD_INITIAL_STATE = 'ModelAddInitialState';
  MODEL_ADD_DECISION = 'ModelAddDecision';
  MODEL_ADD_JUNCTION_POINT = 'ModelAddJunctionPoint';
  MODEL_ADD_CHOICE_POINT = 'ModelAddChoicePoint';
  MODEL_ADD_SHALLOW_HISTORY = 'ModelAddShallowHistory';
  MODEL_ADD_DEEP_HISTORY = 'ModelAddDeepHistory';
  MODEL_ADD_SYNCHRONIZATION = 'ModelAddSynchronization';
  MODEL_ADD_SWIMLANE = 'ModelAddSwimlane';
  MODEL_ADD_EFFECT = 'ModelAddEffect';
  MODEL_ADD_ENTRY_ACTION = 'ModelAddEntryAction';
  MODEL_ADD_DO_ACTION = 'ModelAddDoAction';
  MODEL_ADD_EXIT_ACTION = 'ModelAddExitAction';
  MODEL_ADD_SIGNAL_EVENT = 'ModelAddSignalEvent';
  MODEL_ADD_CALL_EVENT = 'ModelAddCallEvent';
  MODEL_ADD_TIME_EVENT = 'ModelAddTimeEvent';
  MODEL_ADD_CHANGE_EVENT = 'ModelAddChangeEvent';
  MODEL_ADD_OBJECT_FLOW_STATE = 'ModelAddObjectFlowState';
  MODEL_ADD_FLOW_FINAL_STATE = 'ModelAddFlowFinalState';
  MODEL_ADD_SIGNAL_ACCEPT_STATE = 'ModelAddSignalAcceptState';
  MODEL_ADD_SIGNAL_SEND_STATE = 'ModelAddSignalSendState';
  MODEL_ADD_ARTIFACT = 'ModelAddArtifact';
  MODEL_ADD_ATTRIBUTE_LINK = 'ModelAddAttributeLink';
  MODEL_ADD_PORT = 'ModelAddPort';
  MODEL_ADD_EXTENSION_POINT = 'ModelAddExtensionPoint';
  MODEL_ADD_COMBINED_FRAGMENT = 'ModelAddCombinedFragment';
  MODEL_ADD_INTERACTION_OPERAND = 'ModelAddInteractionOperand';

  //Context Menus
  MODEL_EXPLORER_CONTEXT_MENU = 'ModelExplorerContextMenu';
  DIAGRAM_EXPLORER_CONTEXT_MENU = 'DiagramExplorerContextMenu';
  ATTACHMENT_EDITOR_CONTEXT_MENU = 'AttachmentEditorContextMenu';
  MESSAGE_PANEL_CONTEXT_MENU = 'MessagePanelContextMenu';

  // Contect Menu Items
  INSPECTOR_ATTACHMENT_OPEN = 'InspectorAttachmentOpen';
  INSPECTOR_ATTACHMENT_ADD  = 'InspectorAttachmentAdd';
  INSPECTOR_ATTACHMENT_EDIT  = 'InspectorAttachmentEdit';
  INSPECTOR_ATTACHMENT_DELETE = 'InspectorAttachmentDelete';
  INSPECTOR_ATTACHMENT_MOVE_UP = 'InspectorAttachmentMoveUp';
  INSPECTOR_ATTACHMENT_MOVE_DOWN = 'InspectorAttachmentMoveDown';


type

  TMenuElementGroup = class;

  TMenuElementHandle = class abstract
  protected
    function GetCaption: string; virtual; abstract;
    procedure SetCaption(ACaption: string); virtual; abstract;
    function GetVisible: Boolean; virtual; abstract;
    procedure SetVisible(AVisible: Boolean); virtual; abstract;
    function GetEnabled: Boolean; virtual; abstract;
    procedure SetEnabled(AEnabled: Boolean); virtual; abstract;
    function GetImageIndex: Integer; virtual; abstract;
    procedure SetImageIndex(AImageIndex: Integer); virtual; abstract;
    function GetOnClick: TNotifyEvent; virtual; abstract;
    procedure SetOnClick(AOnClickHandler: TNotifyEvent); virtual; abstract;

 public
    property Caption: string read GetCaption write SetCaption;
    property Visible: Boolean read GetVisible write SetVisible;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    property ImageIndex: Integer read GetImageIndex write SetImageIndex;
    property OnClick: TNotifyEvent read GetOnClick write SetOnClick;
  end;

  TMenuElementGroup = class abstract
  protected
    function GetVisible: Boolean; virtual; abstract;
    procedure SetVisible(AVisible: Boolean); virtual; abstract;

  public
    procedure AddElement(AElement: TMenuElementHandle); virtual; abstract;
    function IndexInGroup(AComponent: TComponent): Integer; virtual; abstract;
    property Visible: Boolean read GetVisible write SetVisible;
  end;

  TContextMenuHandle = class abstract
  public
    procedure Popup(X: Integer; Y: Integer); virtual; abstract;
    procedure PopupFromCursorPos; virtual; abstract;

  end;


  TSubmenuHandle = class abstract
  private type
    TContainedElems = TList<TMenuElementHandle>;
  protected
    FContainedElems: TContainedElems;

  public
    constructor Create;
    destructor Destroy; override;
    procedure AddMenuElement(AMenuElement: TMenuElementHandle;
      ANewGroup: Boolean = False); virtual;
  end;

  TMainMenuHandle = class abstract

  end;

  TMenuHandlesManager = class
  protected type
    TSubmenus = TList<TSubmenuHandle>;
  protected
    FSubmenus: TSubmenus;
    //procedure SetOnDiagramMenuInteractionClick(AOnClickHandler: TNotifyEvent); virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;
    procedure MenuFormReady; virtual; abstract;
    function GetGroup(AElement: TMenuElementHandle): TMenuElementGroup;  virtual; abstract;
    function CreateMenuElement: TMenuElementHandle; virtual; abstract;
    function GetSubmenu(ASubmenuName: string): TSubmenuHandle; virtual; abstract;
    function GetContextMenu(AContextMenuName: string): TContextMenuHandle; virtual; abstract;
    function GetPredefinedElement( AElementName: string): TMenuElementHandle; virtual; abstract;
    procedure SetUpdating(AUpdatingState: Boolean); virtual; abstract;
    function FindContainterSubmenu(AMenuElement: TMenuElementHandle): TSubmenuHandle;
    property Updating: Boolean write SetUpdating;
  end;


  TLookAndFeelManager = class;

  // Interface for Look and feel changed callback event
  ILookAndFeelChangedListener = interface
    procedure LookAndFeelChanged(ALookAndFeelManager: TLookAndFeelManager);
  end;

  // Provides look and feel info for components without automatic support for look and feel
  TLookAndFeelManager = class abstract
  private type
    TLookAndFeelChangedListeners = TList<ILookAndFeelChangedListener>;
  private
    FLookAndFeelChangedListeners: TLookAndFeelChangedListeners;
  private protected
    function GetWindowLightColor: Integer; virtual; abstract;
    function GetWindowDarkColor: Integer; virtual; abstract;
    function GetCaptionLightColor: Integer; virtual; abstract;
    function GetCaptionDarkColor: Integer; virtual; abstract;
    function GetFrameColor: Integer; virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;
    procedure InitLookAndFeel; virtual; abstract;
    procedure NotifyLookAndFeelChanged; virtual;

    procedure RegisterLookAndFeelChangedListener
      (ALookAndFeelChangedListener: ILookAndFeelChangedListener);
    procedure UnregisterLookAndFeelChangedListener
      (ALookAndFeelChangedListener: ILookAndFeelChangedListener);

    procedure LoadFromRegistry(Key: string); virtual; abstract;
    procedure SaveToRegistry(Key: string); virtual; abstract;

    property WindowLightColor: Integer read GetWindowLightColor;
    property WindowDarkColor: Integer read GetWindowDarkColor;
    property CaptionLightColor: Integer read GetCaptionLightColor;
    property CaptionDarkColor: Integer read GetCaptionDarkColor;
    property FrameColor: Integer read GetFrameColor;
  end;


implementation

constructor TSubmenuHandle.Create;
begin
   FContainedElems := TContainedElems.Create;
end;

destructor TSubmenuHandle.Destroy;
begin
   FContainedElems.Free;
end;

procedure TSubmenuHandle.AddMenuElement(AMenuElement: TMenuElementHandle;
  ANewGroup: Boolean = False);
begin
  FContainedElems.Add(AMenuElement);
end;

constructor TMenuHandlesManager.Create;
begin
  FSubmenus := TSubmenus.Create;
end;
destructor TMenuHandlesManager.Destroy;
begin
  FSubmenus.Free;
end;

function TMenuHandlesManager.FindContainterSubmenu
  (AMenuElement: TMenuElementHandle): TSubmenuHandle;
var
  Submenu: TSubmenuHandle;
  MenuElement: TMenuElementHandle;
begin
  Result := nil;
  for Submenu in FSubmenus do
    for MenuElement in Submenu.FContainedElems do
      if MenuElement = AMenuElement then begin
        Result := Submenu;
        Exit;
      end;
end;

procedure TLookAndFeelManager.RegisterLookAndFeelChangedListener
      (ALookAndFeelChangedListener: ILookAndFeelChangedListener);
begin
  FLookAndFeelChangedListeners.Add(ALookAndFeelChangedListener);
end;

procedure TLookAndFeelManager.UnregisterLookAndFeelChangedListener
      (ALookAndFeelChangedListener: ILookAndFeelChangedListener);
var
  Status: Integer;
begin
  Status := FLookAndFeelChangedListeners.Remove(ALookAndFeelChangedListener);
  Assert (Status >= 0);
end;

procedure TLookAndFeelManager.NotifyLookAndFeelChanged;
var
  LookAndFeelChangedListener: ILookAndFeelChangedListener;
begin
  for LookAndFeelChangedListener in FLookAndFeelChangedListeners do
    LookAndFeelChangedListener.LookAndFeelChanged(self);
end;


constructor TLookAndFeelManager.Create;
begin
  FLookAndFeelChangedListeners := TLookAndFeelChangedListeners.Create;
end;

destructor TLookAndFeelManager.Destroy;
begin
  FLookAndFeelChangedListeners.Free;
end;


end.
