unit NavBarFrameVclImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CategoryButtons, Generics.Collections, ActnList,
  NavBarFrame, MenuManager, System.Actions;

type
  TNavBarItemVclImpl = class(TNavBarItem)
  private type
    TButtonItemList = TList<TButtonItem>;
  private
    FNavBarItems: TButtonItemList;
  protected
    function GetCaption: string; override;
    procedure SetCaption(ACaption: string); override;
    function GetImageIndex: Integer; override;
    procedure SetImageIndex(AImageIndex: Integer); override;
  public
    constructor Create;
    destructor Destroy; override;
    function Equals(Compared: TObject): Boolean; override;
    procedure AddButtonItem(Item: TButtonItem);
  end;

  TNavBarGroupVclImpl = class(TNavBarGroup)
  private
    FNavBarGroup: TButtonCategory;
    FVisibleButtonsContainer: TButtonCategories;
    FInvisibleButtonsContainer: TButtonCategories;
  protected
    function IsVisible: Boolean; override;
    procedure SetVisible(Visible: Boolean); override;
    function GetCaption: string; override;
    procedure SetCaption(ACaption: string); override;
  public
    function Equals(Compared: TObject): Boolean; override;
    procedure AddItem(AItem: TNavBarItem); override;

    constructor Create(AVisibleButtonsContainer: TButtonCategories;
      AInvisibleButtonsContainer: TButtonCategories);
  end;

  TPaletteNavBarFrameVclImpl = class(TPaletteNavBarFrame, ILookAndFeelChangedListener)
    PaletteNavBar: TCategoryButtons;
    NavBarActions: TActionList;
    TextAction: TAction;
    NoteAction: TAction;
    NoteLinkAction: TAction;
    SubsystemAction: TAction;
    PackageAction: TAction;
    UseCaseAction: TAction;
    ActorAction: TAction;
    ClassAction: TAction;
    InterfaceAction: TAction;
    EnumerationAction: TAction;
    SignalAction: TAction;
    ExceptionAction: TAction;
    ComponentAction: TAction;
    ComponentInstanceAction: TAction;
    NodeAction: TAction;
    NodeInstanceAction: TAction;
    AssociationAction: TAction;
    DirectedAssociationAction: TAction;
    AggregationAction: TAction;
    CompositionAction: TAction;
    GeneralizationAction: TAction;
    DependencyAction: TAction;
    RealizationAction: TAction;
    AssociationClassAction: TAction;
    IncludeAction: TAction;
    ExtendAction: TAction;
    ObjectAction: TAction;
    ClassifierRoleAction: TAction;
    AssociationRoleAction: TAction;
    SelfAssociationRoleAction: TAction;
    LinkAction: TAction;
    SelfLinkAction: TAction;
    MessageAction: TAction;
    ForwardMessageAction: TAction;
    ReverseMessageAction: TAction;
    SelfMessageAction: TAction;
    StimulusAction: TAction;
    ForwardStimulusAction: TAction;
    ReverseStimulusAction: TAction;
    SelfStimulusAction: TAction;
    StateAction: TAction;
    SubmachineStateAction: TAction;
    ActionStateAction: TAction;
    SubactivityStateAction: TAction;
    InitialStateAction: TAction;
    FinalStateAction: TAction;
    JunctionPointAction: TAction;
    ChoicePointAction: TAction;
    ShallowHistoryAction: TAction;
    DeepHistoryAction: TAction;
    SynchronizationAction: TAction;
    DecisionAction: TAction;
    TransitionAction: TAction;
    SelfTransitionAction: TAction;
    VerticalSwimlaneAction: TAction;
    HorizontalSwimlaneAction: TAction;
    ObjectFlowStateAction: TAction;
    FlowFinalStateAction: TAction;
    SystemBoundaryAction: TAction;
    SignalAcceptStateAction: TAction;
    SignalSendStateAction: TAction;
    ArtifactAction: TAction;
    PortAction: TAction;
    PartAction: TAction;
    ConnectorAction: TAction;
    CombinedFragmentAction: TAction;
    InteractionOperandAction: TAction;
    RectangleAction: TAction;
    EllipseAction: TAction;
    RoundedRectangleAction: TAction;
    LineAction: TAction;
    ImageAction: TAction;
    FrameAction: TAction;
    SelectAction: TAction;
    procedure PaletteNavBarCategoryClicked(Sender: TObject;
      const Category: TButtonCategory);
    procedure PaletteNavBarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private type
    TPredefinedInteractionGroups = TDictionary<string, TNavBarGroup>;

    // TInteractionItemsPrototypes = TDictionary<string,TNavBarItem>;
    TInteractionItems = TList<TNavBarItem>;

    TNavItemFromVclComponent = TDictionary<TButtonItem, TNavBarItem>;

    TPredefinedItemData = record
      Caption: String;
      ImageIndex: Integer;
    end;

    // TPredefinedItems = TDictionary<string,TPredefinedItemData>;

    TKeyForCaption = TDictionary<string, string>;
    TNamedInteractionGroups = TDictionary<string, TNavBarGroup>;
    TNamedInteractionItems = TDictionary<string, TNavBarItem>;

  private
    { Private declarations }
    FNavItemFromVclComponent: TNavItemFromVclComponent;
    FInteractionItems: TInteractionItems;
    FInteractionGroups: TInteractionGroups;

    FGroupKeyForCaption: TKeyForCaption;
    FItemKeyForCaption: TKeyForCaption;

    FNamedInteractionGroups: TNamedInteractionGroups;
    FNamedInteractionItems: TNamedInteractionItems;

    FPredefinedInteractionGroups: TPredefinedInteractionGroups;
    FInvisibleButtonCategories: TButtonCategories;
    procedure CreateWrappersForPredefinedElements;
    function CreateNavBarGroupForCategory(Category: TButtonCategory)
      : TNavBarGroup;
    function CreateNavBarItemForButtonItem(AButtonItem: TButtonItem)
      : TNavBarItem;

    function CreateNavBarItemWrapper(ANavBarItem: TButtonItem): TNavBarItem;
    procedure InitPredefinedInteractionKeys;
    procedure SelectSelectNavBarItem(aButtonCategory: TButtonCategory);
    procedure CollapseOtherCategories(aExpandedCategory: TButtonCategory);
    procedure SetLookAndFeel(ALookAndFeelManager: TLookAndFeelManager);

  protected
    procedure SetImageList(ImageList: TImageList); override;
    procedure MainFormReady; override;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure SetActiveGroup(Group: TNavBarGroup); override;
    procedure ActivateSelectHandler(ASetIfNotReady: Boolean); override;
    function GetPredefinedInteractionGroup(Name: String): TNavBarGroup;
      override;
    function GetPredefinedInteractionItem(Name: String): TNavBarItem; override;
    function GetGroups: TInteractionGroups; override;
    function CreateNavBarItem: TNavBarItem; override;
    function CreateNavBarGroup: TNavBarGroup; override;

    procedure SingleUseItemSelected; override;
    procedure MultipleUseItemSelected; override;

    // Interface ILookAndFeelChangedListener
    procedure LookAndFeelChanged(ALookAndFeelManager: TLookAndFeelManager);

  end;

var
  PaletteNavBarFrameVclImpl: TPaletteNavBarFrameVclImpl;

implementation

{$R *.dfm}

uses
  Handlers, StarUMLApp;

procedure MoveButtonCategory(Destination: TButtonCategories;
  CategoryToMove: TButtonCategory);
begin
  if Destination.IndexOf(CategoryToMove.Caption) < 0 then
    Destination.AddItem(CategoryToMove, 0);
end;

constructor TNavBarItemVclImpl.Create;
begin
  FNavBarItems := TButtonItemList.Create;
end;

destructor TNavBarItemVclImpl.Destroy;
var
  ButtonItem: TButtonItem;
begin
  for ButtonItem in FNavBarItems do
    ButtonItem.Free;
  FNavBarItems.Free;
  inherited;
end;

function TNavBarItemVclImpl.GetCaption: string;
begin
  Result := FNavBarItems[0].Caption
end;

procedure TNavBarItemVclImpl.SetCaption(ACaption: string);
var
  NavBarItem: TButtonItem;
begin
  if FNavBarItems[0].Action <> nil then
    (FNavBarItems[0].Action as TCustomAction).Caption := ACaption
  else
    for NavBarItem in FNavBarItems do
      NavBarItem.Caption := ACaption
end;

function TNavBarItemVclImpl.GetImageIndex: Integer;
begin
  Result := FNavBarItems[0].ImageIndex
end;

procedure TNavBarItemVclImpl.SetImageIndex(AImageIndex: Integer);
var
  NavBarItem: TButtonItem;
begin
  if FNavBarItems[0].Action <> nil then
    (FNavBarItems[0].Action as TCustomAction).ImageIndex := AImageIndex
  else
    for NavBarItem in FNavBarItems do
      NavBarItem.ImageIndex := AImageIndex
end;

function TNavBarItemVclImpl.Equals(Compared: TObject): Boolean;
begin
  if Compared is TNavBarItem then
    Result := (Caption = TNavBarItem(Compared).Caption) and
      (ImageIndex = TNavBarItem(Compared).ImageIndex)
  else
    Result := False;
end;

procedure TNavBarItemVclImpl.AddButtonItem(Item: TButtonItem);
begin
  FNavBarItems.Add(Item);
end;


constructor TNavBarGroupVclImpl.Create
  (AVisibleButtonsContainer: TButtonCategories;
  AInvisibleButtonsContainer: TButtonCategories);
begin
  inherited Create;
  FVisibleButtonsContainer := AVisibleButtonsContainer;
  FInvisibleButtonsContainer := AInvisibleButtonsContainer;
end;

function TNavBarGroupVclImpl.IsVisible: Boolean;
begin
  Result := FNavBarGroup.Collection = FVisibleButtonsContainer;
end;

procedure TNavBarGroupVclImpl.SetVisible(Visible: Boolean);
begin
  if Visible then
  begin
    if not IsVisible then
    begin
      MoveButtonCategory(FVisibleButtonsContainer, FNavBarGroup);
    end;
  end
  else
  begin
    if IsVisible then
    begin
      MoveButtonCategory(FInvisibleButtonsContainer, FNavBarGroup);
    end;
  end;

end;

function TNavBarGroupVclImpl.GetCaption: string;
begin
  Result := FNavBarGroup.Caption
end;

procedure TNavBarGroupVclImpl.SetCaption(ACaption: string);
begin
  FNavBarGroup.Caption := ACaption
end;

function TNavBarGroupVclImpl.Equals(Compared: TObject): Boolean;
begin
  if Compared is TNavBarGroup then
    Result := (Caption = TNavBarGroup(Compared).Caption)
  else
    Result := False
end;

procedure TNavBarGroupVclImpl.AddItem(AItem: TNavBarItem);
var
  NavBarItemVclImpl: TNavBarItemVclImpl;
  NewNativeItem: TButtonItem;
begin
  NavBarItemVclImpl := AItem as TNavBarItemVclImpl;
  NewNativeItem := FNavBarGroup.Items.Add;
  NewNativeItem.Assign(NavBarItemVclImpl.FNavBarItems[0]);
  NavBarItemVclImpl.AddButtonItem(NewNativeItem);
  //NewNativeItem.OnClick := PaletteNavBarFrameVclImpl.HandleButtonClicked;
  PaletteNavBarFrameVclImpl.FNavItemFromVclComponent.Add(NewNativeItem, AItem);
end;

constructor TPaletteNavBarFrameVclImpl.Create(AOwner: TComponent);
begin
  inherited;
  FInteractionItems := TInteractionItems.Create;
  FNavItemFromVclComponent := TNavItemFromVclComponent.Create;
  FInvisibleButtonCategories := TButtonCategories.Create(PaletteNavBar);
  FInteractionGroups := TInteractionGroups.Create;

  FGroupKeyForCaption := TKeyForCaption.Create;
  FItemKeyForCaption := TKeyForCaption.Create;

  FNamedInteractionGroups := TNamedInteractionGroups.Create;
  FNamedInteractionItems := TNamedInteractionItems.Create;

  PaletteNavBarFrameVclImpl := self;

end;

destructor TPaletteNavBarFrameVclImpl.Destroy;
var
  // PredefinedInteractionGroup: TPair<string,TNavBarGroup>;
  DynamicGroup: TNavBarGroup;
  // PredefinedInteractionItem: TPair<string,TNavBarItem>;
  DynamicItem: TNavBarItem;

begin
  FPredefinedInteractionGroups.Free;

  for DynamicGroup in FInteractionGroups do
    DynamicGroup.Free;
  FInteractionGroups.Free;

  for DynamicItem in FInteractionItems do
    DynamicItem.Free;
  FInteractionItems.Free;

  FNavItemFromVclComponent.Free;

  FGroupKeyForCaption.Free;
  FItemKeyForCaption.Free;
  FNamedInteractionGroups.Free;
  FNamedInteractionItems.Free;

  inherited;
end;

function TPaletteNavBarFrameVclImpl.CreateNavBarItem: TNavBarItem;
var
  NewItem: TNavBarItemVclImpl;
begin
  NewItem := TNavBarItemVclImpl.Create;
  NewItem.FNavBarItems.Add(TButtonItem.Create(nil));
  //NewItem.FNavBarItems[0].OnClick := HandleButtonClicked;

  FInteractionItems.Add(NewItem);
  FNavItemFromVclComponent.Add(NewItem.FNavBarItems[0], NewItem);
  Result := NewItem;
end;

function TPaletteNavBarFrameVclImpl.CreateNavBarGroup: TNavBarGroup;
begin
  Result := CreateNavBarGroupForCategory(nil);
end;

procedure TPaletteNavBarFrameVclImpl.CreateWrappersForPredefinedElements;
var
  GroupCollectionItem: TCollectionItem;
  ButtonCategory: TButtonCategory;

  ItemCollectionItem: TCollectionItem;
  ButtonItem: TButtonItem;

begin
  for GroupCollectionItem in PaletteNavBar.Categories do
  begin
    ButtonCategory := GroupCollectionItem as TButtonCategory;
    CreateNavBarGroupForCategory(ButtonCategory);

    for ItemCollectionItem in ButtonCategory.Items do
    begin
      ButtonItem := ItemCollectionItem as TButtonItem;
      CreateNavBarItemForButtonItem(ButtonItem);
    end;
  end;

  //PaletteNavBar.Color := StarUMLApplication.LookAndFeelManager.WindowLightColor;

end;

function TPaletteNavBarFrameVclImpl.CreateNavBarGroupForCategory
  (Category: TButtonCategory): TNavBarGroup;
var
  NewGroup: TNavBarGroupVclImpl;
  ExistingGroup: TNavBarGroup;
  GroupKey: string;
  GroupKeyDefined: Boolean;
begin
  Result := nil;

  if Category = nil then
    GroupKeyDefined := False
  else
    GroupKeyDefined := FGroupKeyForCaption.TryGetValue(Category.Caption,
      GroupKey);

  if GroupKeyDefined and FNamedInteractionGroups.TryGetValue(GroupKey,
    ExistingGroup) then
    Exit; // Group wrapper already exists

  // Now a new group wrapper can be created
  NewGroup := TNavBarGroupVclImpl.Create(PaletteNavBar.Categories,
    FInvisibleButtonCategories);

  if Category = nil then // If category not given create as well
    NewGroup.FNavBarGroup := TButtonCategory.Create(FInvisibleButtonCategories)
  else
  begin
    NewGroup.FNavBarGroup := Category;
    // NewGroup.SetVisible(False);
  end;

  NewGroup.FNavBarGroup.Collapsed := True;

  FInteractionGroups.Add(NewGroup);
  if GroupKeyDefined then
    FNamedInteractionGroups.Add(GroupKey, NewGroup);
  Result := NewGroup;
end;

function TPaletteNavBarFrameVclImpl.CreateNavBarItemForButtonItem
  (AButtonItem: TButtonItem): TNavBarItem;
var
  ItemWrapper: TNavBarItem;
  ItemKey: string;
  ExistingItem: TNavBarItem;
begin
  if FItemKeyForCaption.TryGetValue(AButtonItem.Caption, ItemKey) then begin

    // Item already registered
    if FNavItemFromVclComponent.TryGetValue(AButtonItem, ExistingItem) then
      Result := ExistingItem as TNavBarItemVclImpl

    // Item wrapper already exists
    else if FNamedInteractionItems.TryGetValue(ItemKey, ItemWrapper) then begin
      (ItemWrapper as TNavBarItemVclImpl).AddButtonItem(AButtonItem);
      //AButtonItem.OnClick := HandleButtonClicked;
      FNavItemFromVclComponent.Add(AButtonItem, ItemWrapper);
    end
    else
    begin
      ItemWrapper := CreateNavBarItemWrapper(AButtonItem);
      // Item wrapper not defined
      FNamedInteractionItems.Add(ItemKey, ItemWrapper);
    end
  end
  else
  begin
    ItemWrapper := CreateNavBarItemWrapper(AButtonItem); // Item key unknown
  end;

  Result := ItemWrapper;

end;


function TPaletteNavBarFrameVclImpl.CreateNavBarItemWrapper
  (ANavBarItem: TButtonItem): TNavBarItem;
var
  NewItem: TNavBarItemVclImpl;
begin
  NewItem := TNavBarItemVclImpl.Create;
  //NewItem.FNavBarItems.Add(aNavBarItem);
  NewItem.AddButtonItem(ANavBarItem);
  //ANavBarItem.OnClick := HandleButtonClicked;
  FInteractionItems.Add(NewItem);
  FNavItemFromVclComponent.Add(ANavBarItem, NewItem);
  Result := NewItem;
end;


function TPaletteNavBarFrameVclImpl.GetGroups: TInteractionGroups;
begin
  Result := FInteractionGroups;
end;

procedure TPaletteNavBarFrameVclImpl.InitPredefinedInteractionKeys;
type
  TItemDescription = record
    Key: String;
    Caption: String;
    ImageIndex: Integer;
  end;

  TCaptionKeyPair = record
    Caption: String;
    Key: String;
  end;

const
  NumberOfPredefinedItems = 74;
  PredefinedItemKeys: array [1 .. NumberOfPredefinedItems] of TCaptionKeyPair =
    (
    (Caption: 'Text'; Key: TEXT_CREATE_HANDLER ),
    (Caption: 'Note'; Key: NOTE_CREATE_HANDLER),
    (Caption: 'Note Link'; Key: NOTE_LINK_CREATE_HANDLER),
    (Caption: 'Subsystem'; Key: SUBSYSTEM_CREATE_HANDLER),
    (Caption: 'Package'; Key: PACKAGE_CREATE_HANDLER),
    (Caption: 'Use Case'; Key: USE_CASE_CREATE_HANDLER),
    (Caption: 'Actor'; Key: ACTOR_CREATE_HANDLER),
    (Caption: 'Class'; Key: CLASS_CREATE_HANDLER),
    (Caption: 'Interface'; Key: INTERFACE_CREATE_HANDLER),
    (Caption: 'Enumeration'; Key: ENUMERATION_CREATE_HANDLER),
    (Caption: 'Signal'; Key: SIGNAL_CREATE_HANDLER),
    (Caption: 'Exception'; Key: EXCEPTION_CREATE_HANDLER),
    (Caption: 'Component'; Key: COMPONENT_CREATE_HANDLER),
    (Caption: 'Component Instance'; Key: COMPONENT_INSTANCE_CREATE_HANDLER),
    (Caption: 'Node'; Key: NODE_CREATE_HANDLER),
    (Caption: 'Node Instance'; Key: NODE_INSTANCE_CREATE_HANDLER),
    (Caption: 'Association'; Key: ASSOCIATION_CREATE_HANDLER),
    (Caption: 'Directed Association'; Key: DIRECTED_ASSOCIATION_HANDLER),
    (Caption: 'Aggregation'; Key: AGGREGATION_HANDLER),
    (Caption: 'Composition'; Key: COMPOSITION_HANDLER),
    (Caption: 'Generalization'; Key: GENERALIZATION_CREATE_HANDLER),
    (Caption: 'Dependency'; Key: DEPENDENCY_CREATE_HANDLER),
    (Caption: 'Realization'; Key: REALIZATION_CREATE_HANDLER),
    (Caption: 'Association Class'; Key: ASSOCIATION_CLASS_CREATE_HANDLER),
    (Caption: 'Include'; Key: INCLUDE_CREATE_HANDLER),
    (Caption: 'Extend'; Key: EXTEND_CREATE_HANDLER),
    (Caption: 'Object'; Key: OBJECT_CREATE_HANDLER),
    (Caption: 'Classifier Role'; Key: CLASSIFIER_ROLE_CREATE_HANDLER),
    (Caption: 'Association Role'; Key: ASSOCIATION_ROLE_CREATE_HANDLER),
    (Caption: 'Self Association Role'; Key: SELF_ASSOCIATION_ROLE_CREATE_HANDLER),
    (Caption: 'Link'; Key: LINK_CREATE_HANDLER),
    (Caption: 'Self Link'; Key: SELF_LINK_CREATE_HANDLER),
    (Caption: 'Message'; Key: MESSAGE_CREATE_HANDLER),
    (Caption: 'Forward Message'; Key: FORWARD_MESSAGE_CREATE_HANDLER),
    (Caption: 'Reverse Message'; Key: REVERSE_MESSAGE_CREATE_HANDLER),
    (Caption: 'Self Message'; Key: SELF_MESSAGE_CREATE_HANDLER),
    (Caption: 'Stimulus'; Key: STIMULUS_CREATE_HANDLER),
    (Caption: 'Forward Stimulus'; Key: FORWARD_STIMULUS_CREATE_HANDLER),
    (Caption: 'Reverse Stimulus'; Key: REVERSE_STIMULUS_CREATE_HANDLER),
    (Caption: 'Self Stimulus'; Key: SELF_STIMULUS_CREATE_HANDLER),
    (Caption: 'State'; Key: STATE_CREATE_HANDLER),
    (Caption: 'Submachine State'; Key: SUBMACHINE_STATE_CREATE_HANDLER),
    (Caption: 'Action State'; Key: ACTIVITY_CREATE_HANDLER),
    (Caption: 'Subactivity State'; Key: SUBACTIVITY_STATE_CREATE_HANDLER),
    (Caption: 'Initial State'; Key: INITIAL_STATE_CREATE_HANDLER),
    (Caption: 'Final State'; Key: FINAL_STATE_CREATE_HANDLER),
    (Caption: 'Junction Point'; Key: JUNCTION_POINT_CREATE_HANDLER),
    (Caption: 'Choice Point'; Key: CHOICE_POINT_CREATE_HANDLER),
    (Caption: 'Shallow History'; Key: SHALLOW_HISTORY_CREATE_HANDLER),
    (Caption: 'Deep History'; Key: DEEP_HISTORY_CREATE_HANDLER),
    (Caption: 'Synchronization'; Key: SYNCHRONIZATION_CREATE_HANDLER),
    (Caption: 'Decision'; Key: DECISION_CREATE_HANDLER),
    (Caption: 'Transition'; Key: TRANSITION_CREATE_HANDLER),
    (Caption: 'Self Transition'; Key: SELF_TRANSITION_CREATE_HANDLER),
    (Caption: 'Vertical Swimlane'; Key: VERTICAL_SWIMLANE_CREATE_HANDLER),
    (Caption: 'Horizontal Swimlane'; Key: HORIZONTAL_SWIMLANE_CREATE_HANDLER),
    (Caption: 'Object Flow State'; Key: OBJECT_FLOW_STATE_CREATE_HANDLER),
    (Caption: 'Flow Final State'; Key: FLOW_FINAL_STATE_CREATE_HANDLER),
    (Caption: 'System Boundary'; Key: SYSTEM_BOUNDARY_CREATE_HANDLER),
    (Caption: 'Signal Accept State'; Key: SIGNAL_ACCEPT_STATE_CREATE_HANDLER),
    (Caption: 'Signal Send State'; Key: SIGNAL_SEND_STATE_CREATE_HANDLER),
    (Caption: 'Artifact'; Key: ARTIFACT_CREATE_HANDLER),
    (Caption: 'Port'; Key: PORT_CREATE_HANDLER),
    (Caption: 'Part'; Key: PART_CREATE_HANDLER),
    (Caption: 'Connector'; Key: CONNECTOR_CREATE_HANDLER),
    (Caption: 'Combined Fragment'; Key: COMBINED_FRAGMENT_CREATE_HANDLER),
    (Caption: 'Interaction Operand'; Key: INTERACTION_OPERAND_CREATE_HANDLER),
    (Caption: 'Rectangle'; Key: RECTANGLE_CREATE_HANDLER),
    (Caption: 'Ellipse'; Key: ELLIPSE_CREATE_HANDLER),
    (Caption: 'Rounded Rectangle'; Key: ROUND_RECT_CREATE_HANDLER),
    (Caption: 'Line'; Key: LINE_CREATE_HANDLER),
    (Caption: 'Image'; Key: IMAGE_CREATE_HANDLER),
    (Caption: 'Frame'; Key: FRAME_CREATE_HANDLER),
    (Caption: 'Select'; Key: SELECT_HANDLER)

    );

  NumberOfPredefinedGroups = 12;
  PredefinedGroupKeys: array [1 .. NumberOfPredefinedGroups] of TCaptionKeyPair =
  (
    (Caption: 'Annotation'; Key: ANNOTATION_GROUP),
    (Caption: 'Class'; Key: CLASS_GROUP),
    (Caption: 'Use Case'; Key: USE_CASE_GROUP),
    (Caption: 'Component'; Key: COMPONENT_GROUP),
    (Caption: 'Deployment'; Key: DEPLOYMENT_GROUP),
    (Caption: 'Sequence'; Key: SEQUENCE_GROUP),
    (Caption: 'Sequence (Role)'; Key: SEQUENCE_ROLE_GROUP),
    (Caption: 'Collaboration'; Key: COLLABORATION_GROUP),
    (Caption: 'Collaboration (Role)'; Key: COLLABORATION_ROLE_GROUP),
    (Caption: 'Statechart'; Key: STATECHART_GROUP),
    (Caption: 'Activity'; Key: ACTIVITY_GROUP),
    (Caption: 'Composite Structure'; Key: COMPOSITE_STRUCTURE_GROUP)
  );

var

  PredefinedItemKey: TCaptionKeyPair;
  PredefinedGroupKey: TCaptionKeyPair;

begin
  for PredefinedItemKey in PredefinedItemKeys do
    FItemKeyForCaption.Add(PredefinedItemKey.Caption, PredefinedItemKey.Key);

  for PredefinedGroupKey in PredefinedGroupKeys do
    FGroupKeyForCaption.Add(PredefinedGroupKey.Caption, PredefinedGroupKey.Key);

end;


procedure TPaletteNavBarFrameVclImpl.SetImageList(ImageList: TImageList);
begin
  PaletteNavBar.Images := ImageList;
end;

procedure TPaletteNavBarFrameVclImpl.MainFormReady;
begin
  InitPredefinedInteractionKeys;
  CreateWrappersForPredefinedElements;
  // InitPredefinedInteractionGroups;
  //SetLookAndFeel(StarUMLApplication.LookAndFeelManager);
  StarUMLApplication.LookAndFeelManager.RegisterLookAndFeelChangedListener(self);
end;

procedure TPaletteNavBarFrameVclImpl.SelectSelectNavBarItem
  (aButtonCategory: TButtonCategory);
var
  CollectionItem: TCollectionItem;
  ButtonItem: TButtonItem;
  PaletteCategory: TButtonCategory;
begin
  if aButtonCategory = nil then // Try to find a suitable category
  begin
    for CollectionItem in PaletteNavBar.Categories do
    begin
      PaletteCategory := CollectionItem as TButtonCategory;
      if not PaletteCategory.Collapsed then
      begin
        aButtonCategory := PaletteCategory; // Chose first expanded category
        Exit;
      end;
    end;
  end;

  if aButtonCategory = nil then
    Exit; // No suitable category found

  for CollectionItem in aButtonCategory.Items do
  begin
    ButtonItem := CollectionItem as TButtonItem;
    if ButtonItem.ImageIndex = 0 then
    begin
      PaletteNavBar.SelectedItem := ButtonItem;
      Exit;
    end;
  end;
end;

procedure TPaletteNavBarFrameVclImpl.CollapseOtherCategories
  (aExpandedCategory: TButtonCategory);
var
  PaletteCategory: TButtonCategory;
  I: Integer;
begin
  for I := 0 to PaletteNavBar.Categories.Count - 1 do
  begin
    PaletteCategory := PaletteNavBar.Categories.Items[I];
    if PaletteCategory <> aExpandedCategory then
      PaletteCategory.Collapsed := True;
  end;
end;

procedure TPaletteNavBarFrameVclImpl.ActivateSelectHandler
  (ASetIfNotReady: Boolean);
begin
  if ASetIfNotReady = False then
    ButtonClickHandlerReady := False;

  if not ButtonClickHandlerReady then
  begin
    SelectSelectNavBarItem(PaletteNavBar.CurrentCategory);
    SingleUseItemSelected;
    FActionProcessor.ActivateHandler(SELECT_HANDLER)
  end;

end;

procedure TPaletteNavBarFrameVclImpl.SingleUseItemSelected;
begin
  PaletteNavBar.SelectedButtonColor := clAqua;
end;

procedure TPaletteNavBarFrameVclImpl.MultipleUseItemSelected;
begin
  PaletteNavBar.SelectedButtonColor := clGreen;
end;

procedure TPaletteNavBarFrameVclImpl.SetActiveGroup(Group: TNavBarGroup);
var
  VclGroup: TNavBarGroupVclImpl;
begin
  if Group <> nil then
  begin
    VclGroup := Group as TNavBarGroupVclImpl;
    VclGroup.FNavBarGroup.Collapsed := False;
    // CollapseOtherCategories(VclGroup.FNavBarGroup);
    SelectSelectNavBarItem(VclGroup.FNavBarGroup);
  end;
end;

function TPaletteNavBarFrameVclImpl.GetPredefinedInteractionGroup(Name: String)
  : TNavBarGroup;
begin
  Result := FNamedInteractionGroups[Name]
end;

function TPaletteNavBarFrameVclImpl.GetPredefinedInteractionItem(Name: String)
  : TNavBarItem;
begin
  Result := FNamedInteractionItems[Name]
end;

procedure TPaletteNavBarFrameVclImpl.PaletteNavBarCategoryClicked
  (Sender: TObject; const Category: TButtonCategory);
begin
  inherited;
  SelectSelectNavBarItem(Category);
end;

procedure TPaletteNavBarFrameVclImpl.PaletteNavBarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  NavBarItem: TNavBarItem;
  CategoryButtonsSender: TCategoryButtons;
begin
  inherited;
   // PRECONDITIONS
  // Assert(Sender is TButtonItem);
  if Sender is TBasicAction then
    CategoryButtonsSender := (Sender as TBasicAction)
      .ActionComponent as TCategoryButtons
  else
    CategoryButtonsSender := Sender as TCategoryButtons;

  NavBarItem := FNavItemFromVclComponent
    [CategoryButtonsSender.FocusedItem as TButtonItem];
  // PRECONDITIONS

  if NavBarItem.ImageIndex = 0 then // Select item
  begin
    // ButtonClickHandlerReady := False;
    ActivateSelectHandler(False);
    SingleUseItemSelected;
  end
  else
  begin
    if Assigned(FOnButtonClicked) then begin
      FOnButtonClicked(NavBarItem);
      // Some idea: Drag and drop from Tool Palette, possibly in the future
      //        MainForm.WorkingAreaFrame.ActiveDiagramEditor.HandleExternalMouseUp(Sender, Button, Shift, X, Y);
    end;
  end;
  // Mouse up
end;

procedure TPaletteNavBarFrameVclImpl.LookAndFeelChanged
  (ALookAndFeelManager: TLookAndFeelManager);
begin
    SetLookAndFeel(ALookAndFeelManager)
end;

procedure TPaletteNavBarFrameVclImpl.SetLookAndFeel
  (ALookAndFeelManager: TLookAndFeelManager);
var
  GroupCollectionItem: TCollectionItem;
  ButtonCategory: TButtonCategory;

  begin
  PaletteNavBar.Color := ALookAndFeelManager.WindowLightColor;

  for GroupCollectionItem in PaletteNavBar.Categories do
  begin
    ButtonCategory := GroupCollectionItem as TButtonCategory;
    //ButtonCategory.Color := ALookAndFeelManager.WindowLightColor;
    ButtonCategory.Color := ALookAndFeelManager.WindowDarkColor;
    ButtonCategory.GradientColor := ALookAndFeelManager.WindowDarkColor;
    //ButtonCategory.GradientColor := clWhite;
  end

end;



end.

