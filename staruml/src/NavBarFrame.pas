unit NavBarFrame;

interface

uses
  Classes, Controls, Forms, Generics.Collections, Handlers;

const
  ANNOTATION_GROUP = 'Annotation';
  CLASS_GROUP = 'Class';
  USE_CASE_GROUP = 'UseCase';
  COMPONENT_GROUP = 'Component';
  DEPLOYMENT_GROUP = 'Deployment';
  SEQUENCE_GROUP = 'Sequence';
  SEQUENCE_ROLE_GROUP = 'SequenceRole';
  COLLABORATION_GROUP = 'Collaboration';
  COLLABORATION_ROLE_GROUP = 'CollaborationRole';
  STATECHART_GROUP = 'Statechart';
  ACTIVITY_GROUP = 'Activity';
  COMPOSITE_STRUCTURE_GROUP = 'CompositeStructure';


type
  // Abstract representation of an item in the navigation palette
  TNavBarItem = class abstract
  //class operator Equal(a, b: TNavBarItem) : Boolean;
  private
    //FImageIndex: Integer;

  protected
    function GetCaption: string; virtual; abstract;
    procedure SetCaption(ACaption: string); virtual; abstract;
    function GetImageIndex: Integer; virtual; abstract;
    procedure SetImageIndex(AImageIndex: Integer); virtual; abstract;
    //function GetImageIndex: Integer; virtual; abstract;
    //procedure SetImageIndex(aIndex: Integer); virtual; abstract;
  public
    //class operator Equal(Left: TNavBarItem; Right: TNavBarItem): Boolean;
    //function EqualTo(Compared: TNavBarItem): Boolean; virtual; abstract;
    property Caption: string read GetCaption write SetCaption;
    property ImageIndex: Integer read GetImageIndex write SetImageIndex;

  end;

  // Abstract representation of an item group in the navigation palette
  TNavBarGroup = class abstract
  protected
    function IsVisible: Boolean; virtual; abstract;
    procedure SetVisible(Visible:Boolean); virtual; abstract;
    function GetCaption: string; virtual; abstract;
    procedure SetCaption(ACaption: string); virtual; abstract;
  public
    //function EqualTo(Compared: TNavBarGroup): Boolean; virtual; abstract;
    procedure AddItem(AItem: TNavBarItem);  virtual; abstract;
    property Visible: Boolean read IsVisible write SetVisible;
    property Caption: string read GetCaption write SetCaption;
  end;

  // External event for item button click
  TButtonClickedEvent = procedure(Sender: TNavBarItem) of object;

  TInteractionGroups = TList<TNavBarGroup>;

  // Frame holder for the palette component
  TPaletteNavBarFrame = class(TFrame)
    // Event Handlers (On Main Form Palette Item Clicked)
    procedure HandlerButtonClick(Sender: TObject);
    procedure PaletteNavBarActiveGroupChanged(Sender: TObject);

  //public type
  //  TInteractionGroups = TList<TNavBarGroup>;
  private
    { Private declarations }
    FOnPaletteChanged: TNotifyEvent;
    FOnHandlerButtonClicked: TNotifyEvent;
    FButtonClickHandlerReady: Boolean;
  protected
    FActionProcessor: PActionProcessor;
    FOnButtonClicked: TButtonClickedEvent;
    procedure SetImageList(ImageList: TImageList); virtual; abstract;
    procedure MainFormReady; virtual; // Initalization of the main form ended
    function GetGroups: TInteractionGroups; virtual; abstract;

  public
    { Public declarations }
    //constructor Create(AOwner: TComponent); override;
    //destructor Destroy; override;
    procedure ActivateSelectHandler(ASetIfNotReady: Boolean); virtual; abstract;
    function CreateNavBarItem: TNavBarItem; virtual; abstract;
    //function CreateNavBarItem( ACaption: string; AImageIndex: Integer)
    //  : TNavBarItem; overload; virtual; abstract;
    function CreateNavBarGroup: TNavBarGroup; virtual; abstract;
    function GetPredefinedInteractionGroup(Name: String): TNavBarGroup; virtual; abstract;
    function GetPredefinedInteractionItem(Name: String): TNavBarItem; virtual; abstract;
    procedure SetActiveGroup(Group: TNavBarGroup); virtual; abstract;
    procedure SetSharedComponents(ActionProc: PActionProcessor; ImageList: TImageList);
    property Groups: TInteractionGroups read GetGroups;
    property OnPaletteChanged: TNotifyEvent read FOnPaletteChanged write FOnPaletteChanged;
    property OnHandlerButtonClicked: TNotifyEvent read FOnHandlerButtonClicked write FOnHandlerButtonClicked;
    property OnButtonClicked: TButtonClickedEvent read FOnButtonClicked write FOnButtonClicked;
    property ButtonClickHandlerReady: Boolean read FButtonClickHandlerReady write FButtonClickHandlerReady;
  published
    property ActionProcessor: PActionProcessor  read FActionProcessor write FActionProcessor;

  end;

implementation

{$R *.dfm}


procedure TPaletteNavBarFrame.SetSharedComponents(ActionProc: PActionProcessor; ImageList: TImageList);
begin
  FActionProcessor := ActionProc;
  SetImageList(ImageList);
  MainFormReady;
 end;

 procedure TPaletteNavBarFrame.MainFormReady;
 begin
   // Do nothing by default
 end;

 procedure TPaletteNavBarFrame.HandlerButtonClick(Sender: TObject);
begin
  if Assigned(FOnHandlerButtonClicked) then
    FOnHandlerButtonClicked(Sender);
end;


procedure TPaletteNavBarFrame.PaletteNavBarActiveGroupChanged(Sender: TObject);
begin
  if FActionProcessor <> nil then
    if Assigned(FOnPaletteChanged) then
      FOnPaletteChanged(Sender);
end;





end.
