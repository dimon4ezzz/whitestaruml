unit NavBarFrameTdxImpl;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, NavBarFrame, Generics.Collections,
  dxNavBarCollns, cxClasses, dxNavBarBase, ExtCtrls, dxNavBar;

type

  TNavBarItemTdxImpl = class(TNavBarItem)
  private
    FNavBarItem: TdxNavBarItem;
    FOwningTdxControl: Boolean;
  protected
    function GetCaption: string; override;
    procedure SetCaption(ACaption: string); override;
    function GetImageIndex: Integer; override;
    procedure SetImageIndex(AImageIndex: Integer); override;
  public
    destructor Destroy; override;
  end;

  TNavBarGroupTdxImpl = class(TNavBarGroup)
  private
    FNavBarGroup: TdxNavBarGroup;
    FOwningTdxControl: Boolean;
  protected
    function IsVisible: Boolean; override;
    procedure SetVisible(Visible:Boolean); override;
    function GetCaption: string; override;
    procedure SetCaption(ACaption: string); override;
  public
    procedure AddItem(AItem: TNavBarItem); override;
    destructor Destroy; override;
  end;

  
  TPaletteNavBarFrameTdxImpl = class(TPaletteNavBarFrame)
    PaletteNavBar: TdxNavBar;
    AnnotationNavBarGroup: TdxNavBarGroup;
    BuiltInItemsNavBarGroup: TdxNavBarGroup;
    ClassDiagramNavBarGroup: TdxNavBarGroup;
    UseCaseDiagramNavBarGroup: TdxNavBarGroup;
    ComponentDiagramNavBarGroup: TdxNavBarGroup;
    DeploymentDiagramNavBarGroup: TdxNavBarGroup;
    SequenceDiagramNavBarGroup: TdxNavBarGroup;
    SequenceRoleDiagramNavBarGroup: TdxNavBarGroup;
    CollaborationDiagramNavBarGroup: TdxNavBarGroup;
    CollaborationRoleDiagramNavBarGroup: TdxNavBarGroup;
    StatechartDiagramNavBarGroup: TdxNavBarGroup;
    ActivityDiagramNavBarGroup: TdxNavBarGroup;
    CompositeStructureDiagramNavBarGroup: TdxNavBarGroup;
    SelectNavBarItem: TdxNavBarItem;
    TextNavBarItem: TdxNavBarItem;
    NoteNavBarItem: TdxNavBarItem;
    NoteLinkNavBarItem: TdxNavBarItem;
    SubsystemNavBarItem: TdxNavBarItem;
    PackageNavBarItem: TdxNavBarItem;
    ActorNavBarItem: TdxNavBarItem;
    UseCaseNavBarItem: TdxNavBarItem;
    ClassNavBarItem: TdxNavBarItem;
    InterfaceNavBarItem: TdxNavBarItem;
    EnumerationNavBarItem: TdxNavBarItem;
    SignalNavBarItem: TdxNavBarItem;
    ExceptionNavBarItem: TdxNavBarItem;
    ComponentNavBarItem: TdxNavBarItem;
    ComponentInstanceNavBarItem: TdxNavBarItem;
    NodeNavBarItem: TdxNavBarItem;
    NodeInstanceNavBarItem: TdxNavBarItem;
    AssociationNavBarItem: TdxNavBarItem;
    DirectedAssociationNavBarItem: TdxNavBarItem;
    AggregationNavBarItem: TdxNavBarItem;
    CompositionNavBarItem: TdxNavBarItem;
    GeneralizationNavBarItem: TdxNavBarItem;
    DependencyNavBarItem: TdxNavBarItem;
    RealizationNavBarItem: TdxNavBarItem;
    AssociationClassNavBarItem: TdxNavBarItem;
    IncludeNavBarItem: TdxNavBarItem;
    ExtendNavBarItem: TdxNavBarItem;
    ObjectNavBarItem: TdxNavBarItem;
    ClassifierRoleNavBarItem: TdxNavBarItem;
    AssociationRoleNavBarItem: TdxNavBarItem;
    SelfAssociationRoleNavBarItem: TdxNavBarItem;
    LinkNavBarItem: TdxNavBarItem;
    SelfLinkNavBarItem: TdxNavBarItem;
    MessageNavBarItem: TdxNavBarItem;
    ForwardMessageNavBarItem: TdxNavBarItem;
    ReverseMessageNavBarItem: TdxNavBarItem;
    SelfMessageNavBarItem: TdxNavBarItem;
    StimulusNavBarItem: TdxNavBarItem;
    ForwardStimulusNavBarItem: TdxNavBarItem;
    ReverseStimulusNavBarItem: TdxNavBarItem;
    SelfStimulusNavBarItem: TdxNavBarItem;
    StateNavBarItem: TdxNavBarItem;
    SubmachineStateNavBarItem: TdxNavBarItem;
    ActionStateNavBarItem: TdxNavBarItem;
    SubactivityStateNavBarItem: TdxNavBarItem;
    InitialStateNavBarItem: TdxNavBarItem;
    FinalStateNavBarItem: TdxNavBarItem;
    JunctionPointNavBarItem: TdxNavBarItem;
    ChoicePointNavBarItem: TdxNavBarItem;
    ShallowHistoryNavBarItem: TdxNavBarItem;
    DeepHistoryNavBarItem: TdxNavBarItem;
    SynchronizationNavBarItem: TdxNavBarItem;
    DecisionNavBarItem: TdxNavBarItem;
    TransitionNavBarItem: TdxNavBarItem;
    SelfTransitionNavBarItem: TdxNavBarItem;
    HorizontalSwimlaneNavBarItem: TdxNavBarItem;
    VerticalSwimlaneNavBarItem: TdxNavBarItem;
    ObjectFlowStateNavBarItem: TdxNavBarItem;
    FlowFinalStateNavBarItem: TdxNavBarItem;
    SystemBoundaryNavBarItem: TdxNavBarItem;
    SignalAcceptStateNavBarItem: TdxNavBarItem;
    SignalSendStateNavBarItem: TdxNavBarItem;
    ArtifactNavBarItem: TdxNavBarItem;
    PortNavBarItem: TdxNavBarItem;
    PartNavBarItem: TdxNavBarItem;
    ConnectorNavBarItem: TdxNavBarItem;
    CombinedFragmentNavBarItem: TdxNavBarItem;
    InteractionOperandNavBarItem: TdxNavBarItem;
    RectangleNavBarItem: TdxNavBarItem;
    EllipseNavBarItem: TdxNavBarItem;
    RoundRectNavBarItem: TdxNavBarItem;
    LineNavBarItem: TdxNavBarItem;
    ImageNavBarItem: TdxNavBarItem;
    FrameNavBarItem: TdxNavBarItem;

    procedure PaletteNavBarCustomDrawLink(Sender: TObject;
      ACanvas: TCanvas; AViewInfo: TdxNavBarLinkViewInfo;
      var AHandled: Boolean);


  private type
    TPredefinedInteractionGroups = TDictionary<string,TNavBarGroup>;
    TDynamicInteractionGroups = TList<TNavBarGroup>;

    TPredefinedInteractionItems = TDictionary<string,TNavBarItem>;
    TDynamicInteractionItems = TList<TNavBarItem>;

    TNavItemFromTdxComponent = TDictionary<TdxNavBarItem,TNavBarItem>;

  private
    { Private declarations }
    FPredefinedInteractionGroups: TPredefinedInteractionGroups;
    FDynamicInteractionGroups: TDynamicInteractionGroups;
    FPredefinedInteractionItems: TPredefinedInteractionItems;
    FDynamicInteractionItems: TDynamicInteractionItems;
    FNavItemFromTdxComponent: TNavItemFromTdxComponent;

    procedure InitPredefinedInteractionGroups;
    procedure InitPredefinedInteractionItems;
    procedure SelectSelectNavBarItem(NavBarGroup: TdxNavBarGroup);
    function CreateNavBarItem(Item: TdxNavBarItem): TNavBarItem; overload;
    //function CreateNavBarItem( ACaption: string; AImageIndex: Integer)
    //  : TNavBarItem; overload;
    function CreateNavBarGroup(Group: TdxNavBarGroup): TNavBarGroup; overload;
    procedure CustomDrawLink(ACanvas: TCanvas; AViewInfo: TdxNavBarLinkViewInfo;
      var AHandled: Boolean);
    procedure HandleButtonClicked(Sender: TObject);

  protected
    procedure SetImageList(ImageList: TImageList); override;

  public
    { Public declarations }
    procedure SetActiveGroup(Group: TNavBarGroup); override;
    procedure ActivateSelectHandler(ASetIfNotReady: Boolean); override;
    function CreateNavBarItem: TNavBarItem; overload;
    function CreateNavBarGroup: TNavBarGroup; overload;
    function GetPredefinedInteractionGroup(Name: String): TNavBarGroup; override;
    function GetPredefinedInteractionItem(Name: String): TNavBarItem; override;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

  
//var
  //PaletteNavBarFrameTdxImpl: TPaletteNavBarFrameTdxImpl;

implementation

{$R *.dfm}

uses
  CommCtrl, ImgList, Math, InteractionMgr;


function TNavBarItemTdxImpl.GetCaption: string;
begin
  Result := FNavBarItem.Caption
end;

procedure TNavBarItemTdxImpl.SetCaption(ACaption: string);
begin
  FNavBarItem.Caption := ACaption
end;

function TNavBarItemTdxImpl.GetImageIndex: Integer;
begin
  Result := FNavBarItem.SmallImageIndex
end;

procedure TNavBarItemTdxImpl.SetImageIndex(AImageIndex: Integer);
begin
  FNavBarItem.SmallImageIndex := AImageIndex
end;

destructor TNavBarItemTdxImpl.Destroy;
begin
  if FOwningTdxControl then
    FNavBarItem.Free;
  inherited;  
end;



function TNavBarGroupTdxImpl.IsVisible: Boolean;
begin
  Result := FNavBarGroup.Visible
end;
procedure TNavBarGroupTdxImpl.SetVisible( Visible:Boolean);
begin
   FNavBarGroup.Visible := Visible
end;

function TNavBarGroupTdxImpl.GetCaption: string;
begin
  Result := FNavBarGroup.Caption
end;

procedure TNavBarGroupTdxImpl.SetCaption(ACaption: string);
begin
  FNavBarGroup.Caption := ACaption
end;

procedure TNavBarGroupTdxImpl.AddItem(AItem: TNavBarItem);
begin
   FNavBarGroup.CreateLink((AItem as TNavBarItemTdxImpl).FNavBarItem)
end;

destructor TNavBarGroupTdxImpl.Destroy;
begin
  if FOwningTdxControl then
    FNavBarGroup.Free;
  inherited;  
end;

constructor TPaletteNavBarFrameTdxImpl.Create(AOwner: TComponent);
begin
  inherited;
  FDynamicInteractionGroups := TDynamicInteractionGroups.Create;
  InitPredefinedInteractionGroups;
  FDynamicInteractionItems := TDynamicInteractionItems.Create;
  FNavItemFromTdxComponent := TNavItemFromTdxComponent.Create;
  InitPredefinedInteractionItems;



end;
destructor TPaletteNavBarFrameTdxImpl.Destroy;
var
  PredefinedInteractionGroup: TPair<string,TNavBarGroup>;
  DynamicGroup: TNavBarGroup;
  PredefinedInteractionItem: TPair<string,TNavBarItem>;
  DynamicItem: TNavBarItem;

begin
  for PredefinedInteractionGroup in  FPredefinedInteractionGroups do
     PredefinedInteractionGroup.Value.Free;
  FPredefinedInteractionGroups.Free;

  for DynamicGroup in FDynamicInteractionGroups do
    DynamicGroup.Free;
  FDynamicInteractionGroups.Free;

   for PredefinedInteractionItem in  FPredefinedInteractionItems do
     PredefinedInteractionItem.Value.Free;
  FPredefinedInteractionItems.Free;

  for DynamicItem in FDynamicInteractionItems do
    DynamicItem.Free;
  FDynamicInteractionItems.Free;

  FNavItemFromTdxComponent.Free;

  inherited;
end;

function TPaletteNavBarFrameTdxImpl.CreateNavBarItem(Item: TdxNavBarItem): TNavBarItem;
var
  NewItem: TNavBarItemTdxImpl;
begin
  NewItem := TNavBarItemTdxImpl.Create;

  if Item <> nil then
  begin
    NewItem.FNavBarItem := Item;
    NewItem.FOwningTdxControl := false
  end
  else
  begin
    NewItem.FNavBarItem := PaletteNavBar.Items.Add;
    NewItem.FOwningTdxControl := true;
    FDynamicInteractionItems.Add(NewItem);
  end;

  FNavItemFromTdxComponent.Add(NewItem.FNavBarItem,NewItem);
  NewItem.FNavBarItem.OnClick := HandleButtonClicked;
  Result := NewItem;
end;

function TPaletteNavBarFrameTdxImpl.CreateNavBarGroup(Group: TdxNavBarGroup): TNavBarGroup;
var
  NewGroup: TNavBarGroupTdxImpl;
begin
  NewGroup := TNavBarGroupTdxImpl.Create;

  if Group <> nil then
  begin
    NewGroup.FNavBarGroup := Group;
    NewGroup.FOwningTdxControl := false
  end
  else
  begin
    NewGroup.FNavBarGroup := PaletteNavBar.Groups.Add;
    NewGroup.FOwningTdxControl := true;
    FDynamicInteractionGroups.Add(NewGroup);
  end;
  Result := NewGroup;
end;

function TPaletteNavBarFrameTdxImpl.CreateNavBarItem: TNavBarItem;
begin
  Result := CreateNavBarItem(nil)
end;

function TPaletteNavBarFrameTdxImpl.CreateNavBarGroup: TNavBarGroup;
begin
  Result := CreateNavBarGroup(nil)
end;


function TPaletteNavBarFrameTdxImpl.GetPredefinedInteractionGroup(Name: String): TNavBarGroup;
begin
  Result := FPredefinedInteractionGroups[Name]
end;

function TPaletteNavBarFrameTdxImpl.GetPredefinedInteractionItem(Name: String): TNavBarItem;

begin
  Result := FPredefinedInteractionItems[Name]
end;

procedure TPaletteNavBarFrameTdxImpl.ActivateSelectHandler(ASetIfNotReady: Boolean);
begin
  if ASetIfNotReady = false then
    ButtonClickHandlerReady := false;

  if ButtonClickHandlerReady = false then
  begin
    Assert (FActionProcessor <> nil);
    if (PaletteNavBar.ActiveGroup <> nil) then
      SelectSelectNavBarItem(PaletteNavBar.ActiveGroup);
    FActionProcessor.ActivateHandler('SelectCreateHandler');
  end;
end;

procedure TPaletteNavBarFrameTdxImpl.SetImageList(ImageList: TImageList);
begin
  PaletteNavBar.SmallImages := ImageList;
end;

procedure TPaletteNavBarFrameTdxImpl.InitPredefinedInteractionGroups;
const
  NumberOfElements = 12;
begin
  if FPredefinedInteractionGroups <> nil then
    Exit; // Can be initialized only once

  FPredefinedInteractionGroups := TPredefinedInteractionGroups.Create(NumberOfElements);
  FPredefinedInteractionGroups.Add('UseCase', CreateNavBarGroup(UseCaseDiagramNavBarGroup));
  FPredefinedInteractionGroups.Add('Class', CreateNavBarGroup(ClassDiagramNavBarGroup));
  FPredefinedInteractionGroups.Add('SequenceRole', CreateNavBarGroup(SequenceRoleDiagramNavBarGroup));
  FPredefinedInteractionGroups.Add('Sequence', CreateNavBarGroup(SequenceDiagramNavBarGroup));
  FPredefinedInteractionGroups.Add('CollaborationRole', CreateNavBarGroup(CollaborationRoleDiagramNavBarGroup));
  FPredefinedInteractionGroups.Add('Collaboration', CreateNavBarGroup(CollaborationDiagramNavBarGroup));
  FPredefinedInteractionGroups.Add('Statechart', CreateNavBarGroup(StatechartDiagramNavBarGroup));
  FPredefinedInteractionGroups.Add('Activity', CreateNavBarGroup(ActivityDiagramNavBarGroup));
  FPredefinedInteractionGroups.Add('Component', CreateNavBarGroup(ComponentDiagramNavBarGroup));
  FPredefinedInteractionGroups.Add('Deployment', CreateNavBarGroup(DeploymentDiagramNavBarGroup));
  FPredefinedInteractionGroups.Add('CompositeStructure', CreateNavBarGroup(CompositeStructureDiagramNavBarGroup));
  FPredefinedInteractionGroups.Add('Annotation', CreateNavBarGroup(AnnotationNavBarGroup));

end;

procedure TPaletteNavBarFrameTdxImpl.InitPredefinedInteractionItems;
const
  NumberOfElements = 74;
begin
  if FPredefinedInteractionItems <> nil then
    Exit; // Can be initialized only once

  FPredefinedInteractionItems := TPredefinedInteractionItems.Create(NumberOfElements);

  FPredefinedInteractionItems.Add('TextCreateHandler', CreateNavBarItem(TextNavBarItem));
  FPredefinedInteractionItems.Add('NoteCreateHandler', CreateNavBarItem(NoteNavBarItem));
  FPredefinedInteractionItems.Add('NoteLinkCreateHandler', CreateNavBarItem(NoteLinkNavBarItem));
  FPredefinedInteractionItems.Add('SubsystemCreateHandler', CreateNavBarItem(SubsystemNavBarItem));
  FPredefinedInteractionItems.Add('PackageCreateHandler', CreateNavBarItem(PackageNavBarItem));
  FPredefinedInteractionItems.Add('UseCaseCreateHandler', CreateNavBarItem(UsecaseNavBarItem));
  FPredefinedInteractionItems.Add('ActorCreateHandler', CreateNavBarItem(ActorNavBarItem));
  FPredefinedInteractionItems.Add('ClassCreateHandler', CreateNavBarItem(ClassNavBarItem));
  FPredefinedInteractionItems.Add('InterfaceCreateHandler', CreateNavBarItem(InterfaceNavBarItem));
  FPredefinedInteractionItems.Add('EnumerationCreateHandler', CreateNavBarItem(EnumerationNavBarItem));

  FPredefinedInteractionItems.Add('SignalCreateHandler', CreateNavBarItem(SignalNavBarItem));
  FPredefinedInteractionItems.Add('ExceptionCreateHandler', CreateNavBarItem(ExceptionNavBarItem));
  FPredefinedInteractionItems.Add('ComponentCreateHandler', CreateNavBarItem(ComponentNavBarItem));
  FPredefinedInteractionItems.Add('ComponentInstanceCreateHandler', CreateNavBarItem(ComponentInstanceNavBarItem));
  FPredefinedInteractionItems.Add('NodeCreateHandler', CreateNavBarItem(NodeNavBarItem));
  FPredefinedInteractionItems.Add('NodeInstanceCreateHandler', CreateNavBarItem(NodeInstanceNavBarItem));
  FPredefinedInteractionItems.Add('AssociationCreateHandler', CreateNavBarItem(AssociationNavBarItem));
  FPredefinedInteractionItems.Add('DirectedAssociationHandler', CreateNavBarItem(DirectedAssociationNavBarItem));
  FPredefinedInteractionItems.Add('AggregationHandler', CreateNavBarItem(AggregationNavBarItem));
  FPredefinedInteractionItems.Add('CompositionHandler', CreateNavBarItem(CompositionNavBarItem));

  FPredefinedInteractionItems.Add('GeneralizationCreateHandler', CreateNavBarItem(GeneralizationNavBarItem));
  FPredefinedInteractionItems.Add('DependencyCreateHandler', CreateNavBarItem(DependencyNavBarItem));
  FPredefinedInteractionItems.Add('RealizationCreateHandler', CreateNavBarItem(RealizationNavBarItem));
  FPredefinedInteractionItems.Add('AssociationClassCreateHandler', CreateNavBarItem(AssociationClassNavBarItem));
  FPredefinedInteractionItems.Add('IncludeCreateHandler', CreateNavBarItem(IncludeNavBarItem));
  FPredefinedInteractionItems.Add('ExtendCreateHandler', CreateNavBarItem(ExtendNavBarItem));
  FPredefinedInteractionItems.Add('ObjectCreateHandler', CreateNavBarItem(ObjectNavBarItem));
  FPredefinedInteractionItems.Add('ClassifierRoleCreateHandler', CreateNavBarItem(ClassifierRoleNavBarItem));
  FPredefinedInteractionItems.Add('AssociationRoleCreateHandler', CreateNavBarItem(AssociationRoleNavBarItem));
  FPredefinedInteractionItems.Add('SelfAssociationRoleCreateHandler', CreateNavBarItem(SelfAssociationRoleNavBarItem));

  FPredefinedInteractionItems.Add('LinkCreateHandler', CreateNavBarItem(LinkNavBarItem));
  FPredefinedInteractionItems.Add('SelfLinkCreateHandler', CreateNavBarItem(SelfLinkNavBarItem));
  FPredefinedInteractionItems.Add('MessageCreateHandler', CreateNavBarItem(MessageNavBarItem));
  FPredefinedInteractionItems.Add('ForwardMessageCreateHandler', CreateNavBarItem(ForwardMessageNavBarItem));
  FPredefinedInteractionItems.Add('ReverseMessageCreateHandler', CreateNavBarItem(ReverseMessageNavBarItem));
  FPredefinedInteractionItems.Add('SelfMessageCreateHandler', CreateNavBarItem(SelfMessageNavBarItem));
  FPredefinedInteractionItems.Add('StimulusCreateHandler', CreateNavBarItem(StimulusNavBarItem));
  FPredefinedInteractionItems.Add('ForwardStimulusCreateHandler', CreateNavBarItem(ForwardStimulusNavBarItem));
  FPredefinedInteractionItems.Add('ReverseStimulusCreateHandler', CreateNavBarItem(ReverseStimulusNavBarItem));
  FPredefinedInteractionItems.Add('SelfStimulusCreateHandler', CreateNavBarItem(SelfStimulusNavBarItem));

  FPredefinedInteractionItems.Add('StateCreateHandler', CreateNavBarItem(StateNavBarItem));
  FPredefinedInteractionItems.Add('SubmachineStateCreateHandler', CreateNavBarItem(SubmachineStateNavBarItem));
  FPredefinedInteractionItems.Add('ActivityCreateHandler', CreateNavBarItem(ActionStateNavBarItem));
  FPredefinedInteractionItems.Add('SubactivityStateCreateHandler', CreateNavBarItem(SubactivityStateNavBarItem));
  FPredefinedInteractionItems.Add('InitialStateCreateHandler', CreateNavBarItem(InitialStateNavBarItem));
  FPredefinedInteractionItems.Add('FinalStateCreateHandler', CreateNavBarItem(FinalStateNavBarItem));
  FPredefinedInteractionItems.Add('JunctionPointCreateHandler', CreateNavBarItem(JunctionPointNavBarItem));
  FPredefinedInteractionItems.Add('ChoicePointCreateHandler', CreateNavBarItem(ChoicePointNavBarItem));
  FPredefinedInteractionItems.Add('ShallowHistoryCreateHandler', CreateNavBarItem(ShallowHistoryNavBarItem));
  FPredefinedInteractionItems.Add('DeepHistoryCreateHandler', CreateNavBarItem(DeepHistoryNavBarItem));

  FPredefinedInteractionItems.Add('SynchronizationCreateHandler', CreateNavBarItem(SynchronizationNavBarItem));
  FPredefinedInteractionItems.Add('DecisionCreateHandler', CreateNavBarItem(DecisionNavBarItem));
  FPredefinedInteractionItems.Add('TransitionCreateHandler', CreateNavBarItem(TransitionNavBarItem));
  FPredefinedInteractionItems.Add('SelfTransitionCreateHandler', CreateNavBarItem(SelfTransitionNavBarItem));
  FPredefinedInteractionItems.Add('VerticalSwimlaneCreateHandler', CreateNavBarItem(VerticalSwimlaneNavBarItem));
  FPredefinedInteractionItems.Add('HorizontalSwimlaneCreateHandler', CreateNavBarItem(HorizontalSwimlaneNavBarItem));
  FPredefinedInteractionItems.Add('ObjectFlowStateCreateHandler', CreateNavBarItem(ObjectFlowStateNavBarItem));
  FPredefinedInteractionItems.Add('FlowFinalStateCreateHandler', CreateNavBarItem(FlowFinalStateNavBarItem));
  FPredefinedInteractionItems.Add('SystemBoundaryCreateHandler', CreateNavBarItem(SystemBoundaryNavBarItem));
  FPredefinedInteractionItems.Add('SignalAcceptStateCreateHandler', CreateNavBarItem(SignalAcceptStateNavBarItem));

  FPredefinedInteractionItems.Add('SignalSendStateCreateHandler', CreateNavBarItem(SignalSendStateNavBarItem));
  FPredefinedInteractionItems.Add('ArtifactCreateHandler', CreateNavBarItem(ArtifactNavBarItem));
  FPredefinedInteractionItems.Add('PortCreateHandler', CreateNavBarItem(PortNavBarItem));
  FPredefinedInteractionItems.Add('PartCreateHandler', CreateNavBarItem(PartNavBarItem));
  FPredefinedInteractionItems.Add('ConnectorCreateHandler', CreateNavBarItem(ConnectorNavBarItem));
  FPredefinedInteractionItems.Add('CombinedFragmentCreateHandler', CreateNavBarItem(CombinedFragmentNavBarItem));
  FPredefinedInteractionItems.Add('InteractionOperandCreateHandler', CreateNavBarItem(InteractionOperandNavBarItem));
  FPredefinedInteractionItems.Add('RectangleCreateHandler', CreateNavBarItem(RectangleNavBarItem));
  FPredefinedInteractionItems.Add('EllipseCreateHandler', CreateNavBarItem(EllipseNavBarItem));
  FPredefinedInteractionItems.Add('RoundRectCreateHandler', CreateNavBarItem(RoundRectNavBarItem));

  FPredefinedInteractionItems.Add('LineCreateHandler', CreateNavBarItem(LineNavBarItem));
  FPredefinedInteractionItems.Add('ImageCreateHandler', CreateNavBarItem(ImageNavBarItem));
  FPredefinedInteractionItems.Add('FrameCreateHandler', CreateNavBarItem(FrameNavBarItem));
  FPredefinedInteractionItems.Add('SelectCreateHandler', CreateNavBarItem(SelectNavBarItem));

end;


procedure TPaletteNavBarFrameTdxImpl.SetActiveGroup(Group: TNavBarGroup);
begin
    PaletteNavBar.ActiveGroup := (Group as TNavBarGroupTdxImpl).FNavBarGroup;
end;

procedure TPaletteNavBarFrameTdxImpl.PaletteNavBarCustomDrawLink(Sender: TObject; ACanvas: TCanvas;
  AViewInfo: TdxNavBarLinkViewInfo; var AHandled: Boolean);
begin
  Assert (PaletteNavBar.SmallImages <> nil);
  CustomDrawLink(ACanvas, AViewInfo, AHandled);
end;

procedure TPaletteNavBarFrameTdxImpl.SelectSelectNavBarItem(NavBarGroup: TdxNavBarGroup);
var
  Link: TdxNavBarItemLink;
  I: Integer;
begin
  NavBarGroup.SelectedLinkIndex := -1;
  for I := 0 to NavBarGroup.LinkCount - 1 do begin
    Link := NavBarGroup.Links[I];
    if Link.Item = SelectNavBarItem then begin
      NavBarGroup.SelectedLinkIndex := Link.Index;
      Exit;
    end;
  end;
end;

procedure TPaletteNavBarFrameTdxImpl.CustomDrawLink(ACanvas: TCanvas;
  AViewInfo: TdxNavBarLinkViewInfo; var AHandled: Boolean);

  function GetDentedColor(C: TColor): TColor;
  var
    RGB: Integer;
    R, G, B: Integer;
  begin
    RGB := GetSysColor(COLOR_BTNFACE);
    R := Min((RGB div $010000) mod $100 + 21, 255);
    G := Min((RGB div $000100) mod $100 + 21, 255);
    B := Min(RGB mod $100 + 21, 255);
    Result := R * $010000 + G * $000100 + B;
  end;

  function GetRGBColor(Value: TColor): DWORD;
  begin
    Result := ColorToRGB(Value);
    case Result of
      clNone: Result := CLR_NONE;
      clDefault: Result := CLR_DEFAULT;
    end;
  end;

const
  DrawingStyles: array[TDrawingStyle] of Longint = (ILD_FOCUS,
    ILD_SELECTED, ILD_NORMAL, ILD_TRANSPARENT);
  Images: array[TImageType] of Longint = (0, ILD_MASK);

var
  LinkRect, CaptionRect, R: TRect;
  UpperLeftColor, LowerRightColor, FlatColor: TColor;
  Bitmap: TBitmap;
begin
  if (sSelected in AViewInfo.State) or (sPressed in AViewInfo.State) or (sHotTracked in AViewInfo.State) then begin
    R := AViewInfo.Rect;
    LinkRect := Rect(R.Left, R.Top + 1, R.Right, R.Bottom - 1);
    // determine colors
    FlatColor := clBtnFace;
    UpperLeftColor := clBtnHighlight;
    LowerRightColor := clBtnShadow;
    if AViewInfo.Link.IsSelected and (sHotTracked in AViewInfo.State) then begin
      UpperLeftColor := clBtnShadow;
      LowerRightColor := clBtnHighlight;
    end
    else if (sSelected in AViewInfo.State) or (sPressed in AViewInfo.State) then begin
      UpperLeftColor := clBtnShadow;
      LowerRightColor := clBtnHighlight;
      FlatColor := GetDentedColor(clBtnFace);
    end;
    // draw button
    ACanvas.Pen.Color := FlatColor;
    ACanvas.Brush.Color := FlatColor;
    ACanvas.Rectangle(LinkRect);
    ACanvas.Pen.Color := UpperLeftColor;
    ACanvas.MoveTo(LinkRect.Left, LinkRect.Bottom - 1);
    ACanvas.LineTo(LinkRect.Left, LinkRect.Top);
    ACanvas.LineTo(LinkRect.Right - 1, LinkRect.Top);
    ACanvas.Pen.Color := LowerRightColor;
    ACanvas.MoveTo(LinkRect.Left, LinkRect.Bottom - 1);
    ACanvas.LineTo(LinkRect.Right - 1, LinkRect.Bottom - 1);
    ACanvas.LineTo(LinkRect.Right - 1, LinkRect.Top);
    // draw button icon
    R := AViewInfo.ImageRect;
    with AViewInfo.ImageList do
    ImageList_DrawEx(Handle, AViewInfo.ImageIndex, ACanvas.Handle, R.Left, R.Top, 0, 0,
      GetRGBColor(BkColor), GetRGBColor(BlendColor), DrawingStyles[DrawingStyle] or Images[ImageType]);
    // draw caption
    CaptionRect := AViewInfo.CaptionRect;
    if ButtonClickHandlerReady and (CaptionRect.Right + 16 > LinkRect.Right) then
      CaptionRect.Right := LinkRect.Right - 16;
    DrawText(ACanvas.Handle, PChar(AViewInfo.Item.Caption), Length(AViewInfo.Item.Caption), CaptionRect, AViewInfo.GetDrawEdgeFlag + DT_END_ELLIPSIS);
    // draw locking mark
    if ButtonClickHandlerReady and AViewInfo.Link.IsSelected then begin
      Bitmap := TBitmap.Create;
      Bitmap.TransparentMode := tmAuto;
      Bitmap.Transparent := True;
      Bitmap.Mask(Bitmap.TransparentColor);
      AViewInfo.ImageList.GetBitmap(182, Bitmap);
      ACanvas.Draw(CaptionRect.Right + 2, CaptionRect.Top, Bitmap);
      Bitmap.Free;
    end;
    AHandled := True;
  end;
end;

procedure TPaletteNavBarFrameTdxImpl.HandleButtonClicked(Sender: TObject);
begin
 // PRECONDITIONS
  Assert(Sender is TdxNavBarItem);
  // PRECONDITIONS
  if Sender = SelectNavBarItem then
  begin
    //ButtonClickHandlerReady := False;
    ActivateSelectHandler(false);
  end
  else
  begin
    if Assigned(FOnButtonClicked) then
      FOnButtonClicked(FNavItemFromTdxComponent[Sender as TdxNavBarItem]);
  end;

end;


end.
