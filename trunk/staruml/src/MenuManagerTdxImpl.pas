unit MenuManagerTdxImpl;

interface
uses
  Classes, MenuManager, dxBar, cxLookAndFeelPainters, Generics.Collections;

type
  TMenuElementHandleTdxImpl = class (TMenuElementHandle)
  private
    FMenuButton: TdxBarButton;
    FOnClick: TNotifyEvent; // External click handler
    constructor Create (AMenuButton: TdxBarButton = nil);

  protected
    function GetCaption: string; override;
    procedure SetCaption(ACaption: string); override;
    function GetVisible: Boolean; override;
    procedure SetVisible(AVisible: Boolean); override;
    function GetEnabled: Boolean; override;
    procedure SetEnabled(AEnabled: Boolean); override;
    function GetImageIndex: Integer; override;
    procedure SetImageIndex(AImageIndex: Integer); override;
    function GetOnClick: TNotifyEvent; override;
    procedure SetOnClick(AOnClickHandler: TNotifyEvent); override;
  end;

  TContextMenuHandleTdxImpl = class (TContextMenuHandle)
  private
    FPopupMenu: TdxBarPopupMenu;
    constructor Create(AContextMenu: TdxBarPopupMenu);
  public
    procedure Popup(X: Integer; Y: Integer); override;
    procedure PopupFromCursorPos; override;

  end;

  TMenuElementGroupTdxImpl = class (TMenuElementGroup)
  private
    FGroup: TdxBarGroup;
    constructor Create(AGroup: TdxBarGroup);
  protected
    function GetVisible: Boolean; override;
    procedure SetVisible(AVisible: Boolean); override;
   public
    procedure AddElement(AElement: TMenuElementHandle); override;
    function IndexInGroup(AComponent: TComponent): Integer; override;
  end;



  TSubmenuHandleTdxImpl = class (TSubmenuHandle)
  private
    FSubMenu :TdxBarSubItem;
  public
    procedure AddMenuElement(AMenuElement: TMenuElementHandle); override;
  end;

  TMenuHandlesManagerTdxImpl = class (TMenuHandlesManager)
  private type
    //TMenuItems = TList<TMenuElementHandle>;
    TMenuItemFromTdxComponent = TDictionary<TdxBarButton, TMenuElementHandle>;
    TPredefinedMenuItemFromLabel = TDictionary<string,TMenuElementHandle>;
    TGroupFromNativeGroup = TDictionary<TdxBarGroup,TMenuElementGroup>;

    TSubmenuFromLabel = TDictionary<string, TSubmenuHandle>;
    //TSubmenus = TList<TSubmenuHandle>;
    TContextMenus = TList<TContextMenuHandle>;
    TContextMenuFromLabel = TDictionary<string,TContextMenuHandle>;
  private
    FMenuItemFromTdxComponent: TMenuItemFromTdxComponent;
    FPredefinedMenuItemFromLabel: TPredefinedMenuItemFromLabel;
    FSubmenuFromLabel: TSubmenuFromLabel;
    FGroupFromNativeGroup: TGroupFromNativeGroup;
    FContextMenuFromLabel: TContextMenuFromLabel;
    //FOnDiagramMenuInteractionClick: TNotifyEvent;

    procedure MakeSubmenu(ALabel: string; ANativeSubmenu: TdxBarSubItem);
    procedure InitSubmenus;
    procedure MakeItem (ALabel: string; ANativeItem: TdxBarButton);
    procedure InitPredefinedDiagramMenuInteractions;
    procedure InitPredefinedModelMenuInteractions;
    procedure InitPredefinedContextMenuItems;
    procedure InitPredefinedContextMenus;
    function GetContainerMenuBarGroup(Button: TdxBarButton): TdxBarGroup;
    //procedure DiagramMenuInteractionClickHandler(Sender: TObject);
    procedure ClickHandler(Sender: TObject);
  //protected
    //procedure SetOnDiagramMenuInteractionClick(AOnClickHandler: TNotifyEvent); override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure MenuFormReady; override;
    function CreateMenuElement: TMenuElementHandle; override;
    function CreateMenuElementWrapper(AButton: TdxBarButton): TMenuElementHandle;
    function CreateGroupWrapper(AGroup: TdxBarGroup): TMenuElementGroup;
    function CreateContextMenuWrapper(ALabel: string; AContextMenu: TdxBarPopupMenu): TContextMenuHandle;
    function GetGroup(AElement: TMenuElementHandle): TMenuElementGroup; override;
    function GetSubmenu(ASubmenuName: string): TSubmenuHandle; override;
    function GetContextMenu(AContextMenuName: string): TContextMenuHandle; override;
    function GetPredefinedElement( AElementName: string): TMenuElementHandle; override;
    procedure SetUpdating(AUpdatingState: Boolean); override;

    //property OnDiagramMenuInteractionClick: TNotifyEvent write SetOnDiagramMenuInteractionClick;

  end;

  // Provides look and feel info for components without automatic support for look and feel
  TLookAndFeelManagerTdxImpl = class(TLookAndFeelManager)
  private const
    ModernStyle = 0;
    ClassicStyle = 1;
    NativeStyle = 2;
    UIThemeValueTag = 'UITheme';
  private
    FPainter: TcxCustomLookAndFeelPainter;
  private protected
    function GetWindowLightColor: Integer; override;
    function GetWindowDarkColor: Integer; override;
    function GetCaptionLightColor: Integer; override;
    function GetCaptionDarkColor: Integer; override;
    function GetFrameColor: Integer; override;
  public
    constructor Create (APainter: TcxCustomLookAndFeelPainter);
    procedure InitLookAndFeel; override;
    procedure NotifyLookAndFeelChanged; override;

    procedure LoadFromRegistry(Key: string); override;
    procedure SaveToRegistry(Key: string); override;

  end;

implementation

uses
  Windows, Registry, MainFrm;


/////////////////////////////////
// TMenuElementHandleTdxImpl

constructor TMenuElementHandleTdxImpl.Create(AMenuButton: TdxBarButton = nil);
begin
  if AMenuButton = nil then
    FMenuButton := TdxBarButton.Create(MainForm)
  else
    FMenuButton := AMenuButton;
end;

function TMenuElementHandleTdxImpl.GetCaption: string;
begin
  Result := FMenuButton.Caption
end;

procedure TMenuElementHandleTdxImpl.SetCaption(ACaption: string);
begin
  FMenuButton.Caption := ACaption
end;

function TMenuElementHandleTdxImpl.GetVisible: Boolean;
begin
  Result := FMenuButton.Visible = ivAlways;
end;

procedure TMenuElementHandleTdxImpl.SetVisible(AVisible: Boolean);
begin
  case AVisible of
    True: FMenuButton.Visible := ivAlways;
    False: FMenuButton.Visible := ivNever;
  end;
end;

function TMenuElementHandleTdxImpl.GetEnabled: Boolean;
begin
  Result := FMenuButton.Enabled
end;

procedure TMenuElementHandleTdxImpl.SetEnabled(AEnabled: Boolean);
begin
  FMenuButton.Enabled := AEnabled
end;



function TMenuElementHandleTdxImpl.GetImageIndex: Integer;
begin
  Result := FMenuButton.ImageIndex
end;

procedure TMenuElementHandleTdxImpl.SetImageIndex(AImageIndex: Integer);
begin
  FMenuButton.ImageIndex := AImageIndex
end;

function TMenuElementHandleTdxImpl.GetOnClick: TNotifyEvent;
begin
  Result := FOnClick
end;

procedure TMenuElementHandleTdxImpl.SetOnClick(AOnClickHandler: TNotifyEvent);
begin
  FOnClick := AOnClickHandler
end;

// TMenuElementHandleTdxImpl
/////////////////////////////////


/////////////////////////////////
// TContextMenuHandleTdxImpl

constructor TContextMenuHandleTdxImpl.Create(AContextMenu: TdxBarPopupMenu);
begin
  FPopupMenu := AContextMenu;
end;


procedure TContextMenuHandleTdxImpl.Popup(X: Integer; Y: Integer);
begin
  FPopupMenu.Popup(X,Y);
end;

procedure TContextMenuHandleTdxImpl.PopupFromCursorPos;
begin
  FPopupMenu.PopupFromCursorPos;
end;

// TContextMenuHandleTdxImpl
/////////////////////////////////


//////////////////////////////////
// TMenuElementGroupTdxImpl

constructor TMenuElementGroupTdxImpl.Create(AGroup: TdxBarGroup);
begin
  FGroup := AGroup;
end;

function TMenuElementGroupTdxImpl.GetVisible: Boolean;
begin
  Result := FGroup.Visible = ivAlways;
end;

procedure TMenuElementGroupTdxImpl.SetVisible(AVisible: Boolean);
begin
  case AVisible of
    True: FGroup.Visible := ivAlways;
    False: FGroup.Visible := ivNever;
  end;

end;

procedure TMenuElementGroupTdxImpl.AddElement(AElement: TMenuElementHandle);
begin
end;

function TMenuElementGroupTdxImpl.IndexInGroup(AComponent: TComponent): Integer;
begin
  Result := FGroup.IndexOf(AComponent as TdxBarComponent);
  //Result := FGroup.IndexOf(AComponent);
end;

/////////////////////////////////
// TSubmenuHandleTdxImpl

procedure TSubmenuHandleTdxImpl.AddMenuElement(AMenuElement: TMenuElementHandle);
var
  MenuLink: TdxBarItemLink;
begin
  MenuLink := FSubMenu.ItemLinks.Add;
  MenuLink.Item := (AMenuElement as TMenuElementHandleTdxImpl).FMenuButton;
  MenuLink.BeginGroup := FContainedElems.Count > 0;
  inherited;
end;


// TSubmenuHandleTdxImpl
/////////////////////////////////

/////////////////////////////////
// TMenuHandlesManagerTdxImpl

constructor TMenuHandlesManagerTdxImpl.Create;
begin
  inherited;
  FMenuItemFromTdxComponent := TMenuItemFromTdxComponent.Create(256);
  FPredefinedMenuItemFromLabel := TPredefinedMenuItemFromLabel.Create(16);
  FSubmenuFromLabel := TSubmenuFromLabel.Create(2);
  FGroupFromNativeGroup := TGroupFromNativeGroup.Create(4);
  FContextMenuFromLabel := TContextMenuFromLabel.Create;
end;

destructor TMenuHandlesManagerTdxImpl.Destroy;
var
  MenuItem: TMenuElementHandle;
  Submenu: TSubmenuHandle;
  ElementGroup: TMenuElementGroup;
  FContextMenu: TContextMenuHandle;

begin
  for MenuItem in FMenuItemFromTdxComponent.Values do
    MenuItem.Free;
  FMenuItemFromTdxComponent.Free;

  FPredefinedMenuItemFromLabel.Free;

  for Submenu in FSubmenuFromLabel.Values do
    Submenu.Free;
  FSubmenuFromLabel.Free;

  for ElementGroup in FGroupFromNativeGroup.Values do
    ElementGroup.Free;
  FGroupFromNativeGroup.Free;

  for FContextMenu in FContextMenuFromLabel.Values do
    FContextMenu.Free;
  FContextMenuFromLabel.Free;

end;

procedure TMenuHandlesManagerTdxImpl.MenuFormReady;
begin
  InitPredefinedContextMenus;
  InitPredefinedContextMenuItems;
  InitSubmenus;
  InitPredefinedDiagramMenuInteractions;
  InitPredefinedModelMenuInteractions;
end;

function TMenuHandlesManagerTdxImpl.CreateMenuElement: TMenuElementHandle;
begin
  Result := CreateMenuElementWrapper(nil);
end;

function TMenuHandlesManagerTdxImpl.CreateMenuElementWrapper
  (AButton: TdxBarButton) : TMenuElementHandle;
var
  NewMenuElement: TMenuElementHandleTdxImpl;
begin
  NewMenuElement := TMenuElementHandleTdxImpl.Create(AButton);

  // Update click handler
  if Assigned(NewMenuElement.FMenuButton.OnClick) then
    NewMenuElement.OnClick := NewMenuElement.FMenuButton.OnClick;
  NewMenuElement.FMenuButton.OnClick := ClickHandler;

  FMenuItemFromTdxComponent.Add(NewMenuElement.FMenuButton, NewMenuElement);
  Result := NewMenuElement;
end;

function TMenuHandlesManagerTdxImpl.CreateGroupWrapper(AGroup: TdxBarGroup)
  : TMenuElementGroup;
var
  ElementGroup: TMenuElementGroupTdxImpl;
begin
  ElementGroup := TMenuElementGroupTdxImpl.Create(AGroup);
  //ElementGroup.FGroup := AGroup;
  FGroupFromNativeGroup.Add(ElementGroup.FGroup, ElementGroup);
  Result := ElementGroup;
end;

function TMenuHandlesManagerTdxImpl.CreateContextMenuWrapper(ALabel: string; AContextMenu: TdxBarPopupMenu): TContextMenuHandle;
var
  ContextMenu: TContextMenuHandleTdxImpl;

begin
  ContextMenu := TContextMenuHandleTdxImpl.Create(AContextMenu);
  FContextMenuFromLabel.Add(ALabel,ContextMenu);
  Result := ContextMenu
end;

procedure TMenuHandlesManagerTdxImpl.MakeSubmenu(ALabel: string; ANativeSubmenu: TdxBarSubItem);
var
  Submenu: TSubmenuHandleTdxImpl;
begin
  Submenu := TSubmenuHandleTdxImpl.Create;
  Submenu.FSubMenu := ANativeSubmenu;
  FSubmenuFromLabel.Add(ALabel,Submenu);
end;

procedure TMenuHandlesManagerTdxImpl.InitSubmenus;
begin
  MakeSubmenu(MODEL_ADD_SUBMENU,MainForm.ModelAdd);
  MakeSubmenu(MODEL_ADD_DIAGRAM_SUBMENU,MainForm.ModelAddDiagram);
end;


procedure TMenuHandlesManagerTdxImpl.MakeItem
  (ALabel: string; ANativeItem: TdxBarButton);
var
  MenuItem: TMenuElementHandle;
begin
  MenuItem := CreateMenuElementWrapper(ANativeItem);
  FPredefinedMenuItemFromLabel.Add(ALabel,MenuItem);
end;


procedure TMenuHandlesManagerTdxImpl.InitPredefinedDiagramMenuInteractions;
begin
  with MainForm do begin
    MakeItem(MODEL_ADD_USE_CASE_DIAGRAM,ModelAddDiagramUseCaseDiagram);
    MakeItem(MODEL_ADD_CLASS_DIAGRAM,ModelAddDiagramClassDiagram);
    MakeItem(MODEL_ADD_SEQUENCE_ROLE_DIAGRAM,ModelAddDiagramSequenceRoleDiagram);
    MakeItem(MODEL_ADD_SEQUENCE_DIAGRAM,ModelAddDiagramSequenceDiagram);
    MakeItem(MODEL_ADD_COLLABORATION_ROLE_DIAGRAM,ModelAddDiagramCollaborationRoleDiagram);
    MakeItem(MODEL_ADD_COLLABORATION_DIAGRAM,ModelAddDiagramCollaborationDiagram);
    MakeItem(MODEL_ADD_STATE_CHART_DIAGRAM,ModelAddDiagramStatechartDiagram);
    MakeItem(MODEL_ADD_ACTIVITY_DIAGRAM,ModelAddDiagramActivityDiagram);
    MakeItem(MODEL_ADD_COMPONENT_DIAGRAM,ModelAddDiagramComponentDiagram);
    MakeItem(MODEL_ADD_DEPLOYMENT_DIAGRAM,ModelAddDiagramDeploymentDiagram);
    MakeItem(MODEL_ADD_COMPOSITE_STRUCTURE_DIAGRAM,ModelAddDiagramCompositeStructureDiagram);
  end;

end;

procedure TMenuHandlesManagerTdxImpl.InitPredefinedModelMenuInteractions;
begin
  with MainForm do begin
    MakeItem(MODEL_ADD_MODEL,ModelAddModel);
    MakeItem(MODEL_ADD_SUBSYSTEM,ModelAddSubsystem);
    MakeItem(MODEL_ADD_PACKAGE,ModelAddPackage);
    MakeItem(MODEL_ADD_CLASS,ModelAddClass);
    MakeItem(MODEL_ADD_INTERFACE,ModelAddInterface);
    MakeItem(MODEL_ADD_USE_CASE,ModelAddUseCase);
    MakeItem(MODEL_ADD_ACTOR,ModelAddActor);
    MakeItem(MODEL_ADD_SIGNAL,ModelAddSignal);
    MakeItem(MODEL_ADD_EXCEPTION,ModelAddException);
    MakeItem(MODEL_ADD_OBJECT,ModelAddObject);
    MakeItem(MODEL_ADD_ENUMERATION,ModelAddEnumeration);
    MakeItem(MODEL_ADD_COMPONENT,ModelAddComponent);
    MakeItem(MODEL_ADD_COMPONENT_INSTANCE,ModelAddComponentInstance);
    MakeItem(MODEL_ADD_NODE,ModelAddNode);
    MakeItem(MODEL_ADD_NODE_INSTANCE,ModelAddNodeInstance);
    MakeItem(MODEL_ADD_OPERATION,ModelAddOperation);
    MakeItem(MODEL_ADD_ATTRIBUTE,ModelAddAttribute);
    MakeItem(MODEL_ADD_PARAMETER,ModelAddParameter);
    MakeItem(MODEL_ADD_TEMPLATE_PARAMETER,ModelAddTemplateParameter);
    MakeItem(MODEL_ADD_ENUMERATION_LITERAL,ModelAddEnumerationLiteral);
    MakeItem(MODEL_ADD_COLLABORATION,ModelAddCollaboration);
    MakeItem(MODEL_ADD_COLLABORATION_INSTANCE_SET,ModelAddCollaborationInstanceSet);
    MakeItem(MODEL_ADD_CLASSIFIER_ROLE,ModelAddClassifierRole);
    MakeItem(MODEL_ADD_INTERACTION,ModelAddInteraction);
    MakeItem(MODEL_ADD_INTERACTION_INSTANCE_SET,ModelAddInteractionInstanceSet);
    MakeItem(MODEL_ADD_STATE_MACHINE,ModelAddStateMachine);
    MakeItem(MODEL_ADD_ACTIVITY_GRAPH,ModelAddActivityGraph);
    MakeItem(MODEL_ADD_STATE,ModelAddState);
    MakeItem(MODEL_ADD_SUBMACHINE_STATE,ModelAddSubmachineState);
    MakeItem(MODEL_ADD_ACTION_STATE,ModelAddActionState);
    MakeItem(MODEL_ADD_SUBACTIVITY_STATE,ModelAddSubactivityState);
    MakeItem(MODEL_ADD_FINAL_STATE,ModelAddFinalState);
    MakeItem(MODEL_ADD_INITIAL_STATE,ModelAddInitialState);
    MakeItem(MODEL_ADD_DECISION,ModelAddDecision);
    MakeItem(MODEL_ADD_JUNCTION_POINT,ModelAddJunctionPoint);
    MakeItem(MODEL_ADD_CHOICE_POINT,ModelAddChoicePoint);
    MakeItem(MODEL_ADD_SHALLOW_HISTORY,ModelAddShallowHistory);
    MakeItem(MODEL_ADD_DEEP_HISTORY,ModelAddDeepHistory);
    MakeItem(MODEL_ADD_SYNCHRONIZATION,ModelAddSynchronization);
    MakeItem(MODEL_ADD_SWIMLANE,ModelAddSwimlane);
    MakeItem(MODEL_ADD_EFFECT,ModelAddEffect);
    MakeItem(MODEL_ADD_ENTRY_ACTION,ModelAddEntryAction);
    MakeItem(MODEL_ADD_DO_ACTION,ModelAddDoAction);
    MakeItem(MODEL_ADD_EXIT_ACTION,ModelAddExitAction);
    MakeItem(MODEL_ADD_SIGNAL_EVENT,ModelAddSignalEvent);
    MakeItem(MODEL_ADD_CALL_EVENT,ModelAddCallEvent);
    MakeItem(MODEL_ADD_TIME_EVENT,ModelAddTimeEvent);
    MakeItem(MODEL_ADD_CHANGE_EVENT,ModelAddChangeEvent);
    MakeItem(MODEL_ADD_OBJECT_FLOW_STATE,ModelAddObjectFlowState);
    MakeItem(MODEL_ADD_FLOW_FINAL_STATE,ModelAddFlowFinalState);
    MakeItem(MODEL_ADD_SIGNAL_ACCEPT_STATE,ModelAddSignalAcceptState);
    MakeItem(MODEL_ADD_SIGNAL_SEND_STATE,ModelAddSignalSendState);
    MakeItem(MODEL_ADD_ARTIFACT,ModelAddArtifact);
    MakeItem(MODEL_ADD_ATTRIBUTE_LINK,ModelAddAttributeLink);
    MakeItem(MODEL_ADD_PORT,ModelAddPort);
    MakeItem(MODEL_ADD_EXTENSION_POINT,ModelAddExtensionPoint);
    MakeItem(MODEL_ADD_COMBINED_FRAGMENT,ModelAddCombinedFragment);
    MakeItem(MODEL_ADD_INTERACTION_OPERAND,ModelAddInteractionOperand);
  end;
end;

procedure TMenuHandlesManagerTdxImpl.InitPredefinedContextMenuItems;
begin
  with MainForm do begin
    MakeItem(INSPECTOR_ATTACHMENT_OPEN,InspectorAttachmentOpen);
    MakeItem(INSPECTOR_ATTACHMENT_ADD,InspectorAttachmentAdd);
    MakeItem(INSPECTOR_ATTACHMENT_EDIT,InspectorAttachmentEdit);
    MakeItem(INSPECTOR_ATTACHMENT_DELETE,InspectorAttachmentDelete);
    MakeItem(INSPECTOR_ATTACHMENT_MOVE_UP,InspectorAttachmentMoveUp);
    MakeItem(INSPECTOR_ATTACHMENT_MOVE_DOWN,InspectorAttachmentMoveDown);
  end;
end;


procedure TMenuHandlesManagerTdxImpl.InitPredefinedContextMenus;
begin
  CreateContextMenuWrapper(MODEL_EXPLORER_CONTEXT_MENU,MainFrm.MainForm.ModelExplorerPopupMenu);
  CreateContextMenuWrapper(DIAGRAM_EXPLORER_CONTEXT_MENU,MainForm.DiagramExplorerPopupMenu);
  CreateContextMenuWrapper(ATTACHMENT_EDITOR_CONTEXT_MENU,MainForm.AttachmentsPopupMenu);
  CreateContextMenuWrapper(MESSAGE_PANEL_CONTEXT_MENU,MainForm.MessagesPopupMenu);
end;



function TMenuHandlesManagerTdxImpl.GetSubmenu(ASubmenuName: string): TSubmenuHandle;
begin
  Result := FSubmenuFromLabel[ASubmenuName]
end;

function TMenuHandlesManagerTdxImpl.GetContextMenu(AContextMenuName: string): TContextMenuHandle;
begin
  Result := FContextMenuFromLabel[AContextMenuName]
end;

function TMenuHandlesManagerTdxImpl.GetPredefinedElement( AElementName: string): TMenuElementHandle;
begin
  Result := FPredefinedMenuItemFromLabel[AElementName]
end;

procedure TMenuHandlesManagerTdxImpl.ClickHandler(Sender: TObject);
var
  MenuElement: TMenuElementHandle;
begin
  MenuElement := FMenuItemFromTdxComponent[Sender as TdxBarButton];
  if Assigned(MenuElement.OnClick) then
      MenuElement.OnClick(MenuElement);
end;

function TMenuHandlesManagerTdxImpl.GetGroup(AElement: TMenuElementHandle): TMenuElementGroup;
var
  ElementImpl: TMenuElementHandleTdxImpl;
  ElementGroup: TdxBarGroup;
  ElementGroupWrapper: TMenuElementGroup;

begin
  Result := nil;
  ElementImpl := AElement as TMenuElementHandleTdxImpl;
  ElementGroup := GetContainerMenuBarGroup(ElementImpl.FMenuButton);
  if ElementGroup <> nil then begin
    if FGroupFromNativeGroup.TryGetValue(ElementGroup, ElementGroupWrapper) then
      Result := ElementGroupWrapper // Wrapper for element already created
    else
      Result := CreateGroupWrapper(ElementGroup);
  end;
end;

procedure TMenuHandlesManagerTdxImpl.SetUpdating(AUpdatingState: Boolean);
begin
    MainForm.BarManager.LockUpdate := AUpdatingState
end;


function TMenuHandlesManagerTdxImpl.GetContainerMenuBarGroup(Button: TdxBarButton): TdxBarGroup;
var
  Group: TdxBarGroup;
  I: Integer;
begin
  Result := nil;
  for I := 0 to Button.BarManager.GroupCount - 1 do begin
    Group := Button.BarManager.Groups[I];
    if Group.IndexOf(Button) <> -1 then begin
      Result := Group;
      Exit;
    end;
  end;
end;


// TMenuHandlesManagerTdxImpl
/////////////////////////////////



/////////////////////////////////
// TLookAndFeelManagerTdxImpl

constructor TLookAndFeelManagerTdxImpl.Create (APainter: TcxCustomLookAndFeelPainter);
begin
  inherited Create;
  FPainter := APainter;
end;

procedure TLookAndFeelManagerTdxImpl.InitLookAndFeel;
begin
  MainForm.LookAndFeelManager.NotifyLookAndFeelChanged;
  MainForm.SetAlertLookAndFeel;
end;

procedure TLookAndFeelManagerTdxImpl.NotifyLookAndFeelChanged;
begin
  FPainter := MainForm.BarManager.LookAndFeel.Painter;
  inherited;
end;

procedure TLookAndFeelManagerTdxImpl.LoadFromRegistry(Key: string);
var
  Reg: TRegistry;
  Style: Integer;
begin
  // Read UI style from Registry
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(Key, False) then begin
      try
        Style := Reg.ReadInteger(UIThemeValueTag);
      except
        Style := ModernStyle;
      end;
      Reg.CloseKey;
    end
    else
      Style := ModernStyle;
  finally
    Reg.Free;
  end;

  // Set UI style
  case Style of
    ModernStyle: MainForm.ViewUIThemeModern.Click;
    ClassicStyle: MainForm.ViewUIThemeClassic.Click;
    NativeStyle: MainForm.ViewUIThemeNative.Click;
 end;

end;

procedure TLookAndFeelManagerTdxImpl.SaveToRegistry(Key: string);
const
  NoStyle = -1;
var
  Reg: TRegistry;
  Style: Integer;
begin
   // Identify UI Style
  Style := NoStyle; // Dummy init value
  if MainForm.ViewUIThemeModern.Down then
    Style := ModernStyle
  else if MainForm.ViewUIThemeClassic.Down then
    Style := ClassicStyle
  else if MainForm.ViewUIThemeNative.Down then
    Style := NativeStyle;

  if Style <> NoStyle then begin // Style was correctly set
    // Write UI style to Registry
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(Key, True) then begin
        Reg.WriteInteger(UIThemeValueTag, Style);
        Reg.CloseKey;
      end;
    finally
      Reg.Free;
    end;
  end;
 end;

function TLookAndFeelManagerTdxImpl.GetWindowLightColor: Integer;
begin
  Result := FPainter.DefaultTabColor;
end;

function TLookAndFeelManagerTdxImpl.GetWindowDarkColor: Integer;
begin
  Result := FPainter.DefaultHeaderBackgroundColor;
end;

function TLookAndFeelManagerTdxImpl.GetCaptionLightColor: Integer;
begin
  Result := FPainter.DefaultHeaderColor;
end;

function TLookAndFeelManagerTdxImpl.GetCaptionDarkColor: Integer;
begin
  Result := FPainter.DefaultHeaderBackgroundColor
end;

function TLookAndFeelManagerTdxImpl.GetFrameColor: Integer;
begin
  Result := FPainter.DefaultFilterBoxColor;
end;

// TLookAndFeelManagerTdxImpl
/////////////////////////////////
///
end.
