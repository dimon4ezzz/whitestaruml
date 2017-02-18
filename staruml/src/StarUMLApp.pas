unit StarUMLApp;

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
  BasicClasses, GraphicClasses, Core, ExtCore, ViewCore, ProjectMgr, UMLModels, UMLAux,
  UMLViews, UMLFacto, SelectionMgr, CmdExec, ClipboardMgr, MenuManager,
  Types, Classes, Graphics, SysUtils, Forms, Messages, Generics.Collections;

type
  // Exceptions
  EUndeletableElement = class(Exception);
  EExpressionInvalid = class(Exception);
  EImproperElement = class(Exception);
  EDirectoryNotFound = class(Exception);
  EInvalidFileName = class(Exception);

  // Event Types
  PEndUpdateEvent = procedure(Sender: TObject; CompletelyRebuild, UseUpdateLock: Boolean) of object;

  // PStarUMLApplication
  PStarUMLApplication = class
  private type
  PDiagramList = TList<PDiagram>;
  private
    ProjectManager: PProjectManager;
    CommandExecutor: PCommandExecutor;
    SelectionManager: PSelectionManager;
    ClipboardManager: PClipboardManager;
    ModelSet: PModelOrderedSet;
    ViewSet: PViewOrderedSet;
    LockUpdate: Boolean;
    LockUpdateDepth: Integer;
    FEventArgModels: PModelOrderedSet;
    FEventArgViews: PViewOrderedSet;
    FEventArgDocument: PDocument;
    FEventArgUnit: PUMLUnitDocument;
    // Event Variables
    FOnSelectionChanged: TNotifyEvent;
    FOnDiagramActivated: TNotifyEvent;
    FOnElementsCreated: PModelsViewsEvent;
    FOnElementsDeleting: PModelsViewsEvent;
    FOnElementsDeleted: TNotifyEvent;
    FOnModelsChanged: PModelsEvent;
    FOnViewsChanged: PViewsEvent;
    FOnDocumentModified: PDocumentEvent;
    FOnDocumentSaved: PDocumentEvent;
    FOnProjectOpened: TNotifyEvent;
    FOnProjectSaved: TNotifyEvent;
    FOnProjectClosing: TNotifyEvent;
    FOnProjectClosed: TNotifyEvent;
    FOnProjectCloseQuery: TCloseQueryEvent;
    FOnUnitSeparated: PUnitEvent;
    FOnUnitMerged: PUnitEvent;
    FOnUnitOpened: PUnitEvent;
    FOnUnitUnloaded: PUnitEvent;
    FOnSavingProgress: PProgressEvent;
    FOnLoadingProgress: PProgressEvent;
    FOnResolvingProgress: PProgressEvent;
    FOnBrowseDiagram: PDiagramEvent;
    FOnSelectModelInExplorer: PModelEvent;
    FOnClipboardDataChanged: PClipboardDataChangedEvent;
    FOnCommandHistoryChanged: TNotifyEvent;
    FOnBeginUpdate: TNotifyEvent;
    FOnEndUpdate: PEndUpdateEvent;
    FOnIncludeProfile: PProfileEvent;
    FOnExcludeProfile: PProfileEvent;
    // Event Propagate Procedures
    procedure SelectionChanged(Sender: TObject);
    procedure DiagramActivated(Sender: TObject);
    procedure ElementsCreated(Sender: TObject; Models: PModelOrderedSet; Views: PViewOrderedSet);
    procedure ElementsDeleting(Sender: TObject; Models: PModelOrderedSet; Views: PViewOrderedSet);
    procedure ElementsDeleted(Sender: TObject);
    procedure ModelsChanged(Sender: TObject; Models: PModelOrderedSet);
    procedure ViewsChanged(Sender: TObject; Views: PViewOrderedSet);
    procedure DocumentModified(Sender: TObject; Document: PDocument);
    procedure DocumentSaved(Sender: TObject; Document: PDocument);
    procedure ProjectOpened(Sender: TObject);
    procedure ProjectSaved(Sender: TObject);
    procedure ProjectClosing(Sender: TObject);
    procedure ProjectCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ProjectClosed(Sender: TObject);
    procedure UnitSeparated(Sender: TObject; APackage: PUMLPackage);
    procedure UnitMerged(Sender: TObject; APackage: PUMLPackage);
    procedure UnitOpened(Sender: TObject; APackage: PUMLPackage);
    procedure ProfileIncluded(Sender: TObject; AProfileName: string);
    procedure ProfileExcluded(Sender: TObject; AProfileName: string);
    procedure SavingProgress(Sender: TObject; Info: string; Max, Progress: Integer);
    procedure LoadingProgress(Sender: TObject; Info: string; Max, Progress: Integer);
    procedure ResolvingProgress(Sender: TObject; Info: string; Max, Progress: Integer);
    procedure ClipboardDataKindChangedHandler(Kind: PClipboardDataKind);
    procedure CommandHistoryChangedHandler(Sender: TObject);
    procedure BrowseDiagram(Diagram: PDiagram);
    procedure SelectModelInExplorer(Model: PModel);
    // Property Setters and Getters
    procedure SetActiveDiagram(Value: PDiagramView);
    function GetActiveDiagram: PDiagramView;
    function GetProject: PUMLProject;
    function GetProjectDocument: PUMLProjectDocument;
    function GetUnitDocument(Index: Integer): PUMLUnitDocument;
    function GetUnitDocumentCount: Integer;
    function GetDocumentElement(Index: Integer): PElement;
    function GetDocumentElementCount: Integer;
    function GetIncludedProfile(Index: Integer): string;
    function GetIncludedProfileCount: Integer;
    function GetSelectedModel(Index: Integer): PModel;
    function GetSelectedModelCount: Integer;
    function GetSelectedView(Index: Integer): PView;
    function GetSelectedViewCount: Integer;
    procedure SetFileName(Value: string);
    function GetFileName: string;
    function GetModified: Boolean;
    function GetUnitsModified: Boolean;
    function GetEventArgModel(Index: Integer): PModel;
    function GetEventArgModelCount: Integer;
    function GetEventArgView(Index: Integer): PView;
    function GetEventArgViewCount: Integer;
    function GetEventArgDocument: PDocument;
    function GetEventArgUnit: PUMLUnitDocument;
    function GetUndoLevel: Integer;
    procedure SetUndoLevel(Value: Integer);
    function GetCreateBackupFile: Boolean;
    procedure SetCreateBackupFile(Value: Boolean);
    function GetClipboardDataKind: PClipboardDataKind;
    function GetClipboardElementKind: string;
    function GetClipboardCopyContext: string;
    function GetLookAndFeelManager: TLookAndFeelManager;
    // Utility Functions
    procedure DetermineDeletingElements(Models: PModelOrderedSet; Views: PViewOrderedSet);
    procedure CheckUndeletableViews(Views: PViewOrderedSet);
    function CheckDeleteUnits(ElementSet: PModelOrderedSet): Boolean;
    procedure CheckUnmovableViews(Views: PViewOrderedSet);
    procedure CheckFileName(FilePath: string);
    function DifferentAttributeExists(ElementSet: POrderedSet; Key, Value: string): Boolean; overload;
    function DifferentAttributeExists(ElementSet: PModelOrderedSet; Key, Value: string): Boolean; overload;
    function DifferentAttributeExists(ElementSet: PViewOrderedSet; Key, Value: string): Boolean; overload;
    procedure ElementModified(Element: PElement); overload;
    procedure ElementModified(ElementSet: POrderedSet); overload;
    procedure ElementModified(ElementSet: PModelOrderedSet); overload;
    procedure ElementModified(ElementSet: PViewOrderedSet); overload;
    procedure CollectElements(Element: PElement; CollectionName: string; ASet: POrderedSet); overload;
    procedure CollectElements(Element: PModel; CollectionName: string; ASet: PModelOrderedSet); overload;
    procedure CollectOwners(Models, Owners: PModelOrderedSet);
    procedure CollectDiagramViews(Views, DiagramViews: PViewOrderedSet);
    procedure CollectModelsOfViews(Views: PViewOrderedSet; Models: PModelOrderedSet);

    class procedure SelectDiagrams(SelectedModel: PModel; SelectedDiagrams: PDiagramList);
    class procedure ShowDiagramSearchFinishedNotification(FoundDiagramsNb: Integer; ModelName: string);

  public
    constructor Create;
    destructor Destroy; override;
    procedure Initialize;
    procedure Finalize;
    procedure Log(Text: string);
    procedure BeginUpdate;
    procedure EndUpdate(CompletelyRebuild: Boolean = False; UseUpdateLock: Boolean = True);
    procedure BeginGrouping;
    procedure EndGrouping;
    procedure OpenURL(URL: string);
    // Project Related
    procedure NewProject(ApproachName: string = '');
    procedure SaveProject;
    procedure SaveProjectAs(FileName: string);
    procedure OpenProject(FileName: string; AFileAccessType: PFileAccessType = fatNormal);
    function CloseProject: Boolean;
    function SeparateUnit(APackage: PUMLPackage; AFileName: string): PUMLUnitDocument;
    procedure MergeUnit(APackage: PUMLPackage);
    function OpenUnit(ABasePackage: PUMLPackage; AFileName: string): PUMLUnitDocument;
    procedure DeleteUnit(APackage: PUMLPackage);
    procedure UnloadUnit(APackage: PUMLPackage);
    procedure SaveUnit(APackage: PUMLPackage);
    procedure SaveUnitAs(APackage: PUMLPackage; AFileName: string);
    procedure SaveAllUnits;
    procedure UpdateDocuments;
    procedure ExportModelFragment(APackage: PUMLPackage; AFileName: string);
    procedure ImportModelFragment(AOwner: PUMLPackage; AFileName: string);
    procedure ImportFramework(AOwner: PUMLPackage; FrameworkName: string);
    procedure IncludeProfile(ProfileName: string);
    procedure ExcludeProfile(ProfileName: string);
    // Edit Related
    procedure ClearHistory;
    procedure Undo;
    procedure Redo;
    function Copy: Boolean;
    function Cut: Boolean;
    procedure CopyDiagram(ADiagramView: PDiagramView);
    procedure CopyDiagramAsBitmap(ADiagramView: PDiagramView);
    procedure CopyActiveDiagram;
    procedure CopyActiveDiagramAsBitmap;
    procedure Paste;
    procedure PasteFormat;
    function CanUndo: Boolean;
    function CanRedo: Boolean;
    function GetUndoName: string;
    function GetRedoName: string;
    procedure NotifyWMDrawClipboard(var Msg: TMessage);
    procedure NotifyWMChangeCBChain(var Msg: TMessage);
    // New Related
    function NewModel(Owner: PModel; ModelKind: string; Argument: Integer = 0; End1: PModel = nil; End2: PModel = nil; InsertIndex: Integer = -1; AuxArg: PModel = nil): PModel;
    function NewExtendedModel(Owner: PModel; Profile: string; ModelPrototype: string; End1: PModel = nil; End2: PModel = nil; InsertIndex: Integer = -1; AuxArg: PModel = nil): PModel;
    function NewModelWithName(Owner: PModel; ModelKind: string; Name: string = ''): PModel;
    function NewView(DiagramView: PDiagramView; Model: PModel; ViewKind: string = ''; End1: PView = nil; End2: PView = nil): PView; overload;
    function NewView(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer; Model: PModel; ViewKind: string = ''): PView; overload;
    function NewDiagram(Owner: PModel; DiagramKind: string; AllowBrowseDiagram: Boolean = True): PDiagram;
    function NewExtendedDiagram(Owner: PModel; Profile: string; DiagramType: string; AllowBrowseDiagram: Boolean = True): PDiagram;
    function NewElement(DiagramView: PDiagramView; ElementKind: string; Argument: Integer = 0; End1: PView = nil; End2: PView = nil): PView; overload;
    function NewElement(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer; ElementKind: string; Argument: Integer = 0): PView; overload;
    function NewExtendedElement(DiagramView: PDiagramView; Profile, ElementPrototype: string; End1: PView = nil; End2: PView = nil): PView; overload;
    function NewExtendedElement(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer; Profile, ElementPrototype: string): PView; overload;
    function NewViewByDragDrop(DiagramView: PDiagramView; Model: PModel; X, Y: Integer): PView;
    procedure NewModelByCopyPaste(AModel, Target: PModel);
    procedure NewViewsByCopyPaste(Views: PViewOrderedSet; Target: PDiagramView);
    // Delete Related
    procedure DeleteModel(Model: PModel);
    procedure DeleteView(View: PView);
    procedure DeleteSelectedModels;
    procedure DeleteSelectedViews;
    procedure DeleteSelectedViewsWithModels;
    // Selection Related
    procedure SelectModel(AModel: PModel; AContextMenuLaunched: Boolean = False);
    procedure DeselectModel(AModel: PModel);
    procedure DeselectModels(Models: PModelOrderedSet);
    procedure SelectView(AView: PView);
    procedure DeselectView(AView: PView);
    procedure DeselectViews(Views: PViewOrderedSet);
    procedure SelectArea(X1, Y1, X2, Y2: Integer);
    procedure SelectAdditionalView(AView: PView);
    procedure SelectAdditionalArea(X1, Y1, X2, Y2: Integer);
    procedure SelectAdditionalModel(AModel: PModel);
    procedure SelectAll;
    procedure DeselectAllViews;
    procedure DeselectAllModels;
    procedure DeselectModelsViews(Models: PModelOrderedSet; Views: PViewOrderedSet);
    procedure DeselectAll;
    procedure CollectSelectedModels(Models: PModelOrderedSet);
    procedure CollectSelectedViews(Views: PViewOrderedSet);
    // View Related
    procedure ChangeViewAttribute(AView: PView; Key: string; Value: string);
    procedure MoveView(AView: PView; DX, DY: Integer);
    procedure MoveViewChangingContainerView(AView: PView; DX, DY: Integer; AContainerView: PView = nil);
    procedure MoveSelectedViews(DX, DY: Integer);
    procedure MoveSelectedViewsChaningContainerView(DX, DY: Integer; AContainerView: PView = nil);
    procedure MoveParasiticView(AParasiticView: PParasiticView; Alpha, Distance: Extended);
    procedure ResizeNode(ANode: PNodeView; Left, Top, Right, Bottom: Integer);
    procedure ReshapeEdge(AEdge: IModifiableEdge; Points: PPoints);
    procedure ReconnectEdge(AEdge: PEdgeView; Points: PPoints; NewParicipant: PView; IsTailSide: Boolean);
    procedure ChangeSelectedViewsLineColor(LineColor: TColor);
    procedure ChangeSelectedViewsFillColor(FillColor: TColor);
    procedure ChangeSelectedViewsFont(Font: TFont; AChangedFontItems: PFontItemKinds);
    procedure ChangeSelectedViewsFontFace(FontFace: string);
    procedure ChangeSelectedViewsFontSize(FontSize: Integer);
    procedure ChangeSelectedEdgesLineStyle(LineStyle: PLineStyleKind);
    procedure ChangeSelectedAnnotationsLineStyle(LineStyle: PLineKind);
    procedure ChangeSelectedViewsFormat(FormatSource: PView);
    procedure ChangeSelectedViewsAttribute(Key: string; Value: string);
    procedure ChangeNoteViewStrings(AView: PUMLCustomTextView; Strs: string);
    procedure SendToBackSelectedViews;
    procedure BringToFrontSelectedViews;
    procedure AlignLeftSelectedViews;
    procedure AlignRightSelectedViews;
    procedure AlignMiddleSelectedViews;
    procedure AlignTopSelectedViews;
    procedure AlignBottomSelectedViews;
    procedure AlignCenterSelectedViews;
    procedure AlignSpaceEvenlyHorizontallySelectedViews;
    procedure AlignSpaceEvenlyVerticallySelectedViews;
    procedure LayoutDiagram(ADiagramView: PDiagramView);
    procedure LayoutActiveDiagram;
    procedure LayoutActiveDiagramWithValidation;
    class function SaveDiagramImageToBitmap(ADiagramView: PDiagramView; FileName: string; ConvertedImage: TGraphic = nil): Boolean;
    class function SaveDiagramImageToJPEG(ADiagramView: PDiagramView; FileName: string): Boolean;
    class function SaveDiagramImageToPNG(ADiagramView: PDiagramView; FileName: string): Boolean;
    class function SaveDiagramImageToMetafile(ADiagramView: PDiagramView; FileName: string; Enhanced: Boolean = False): Boolean;
    // Model Related
    procedure ChangeModelName(AModel: PModel; Name: string);
    procedure ChangeModelStereotype(AExtensibleModel: PExtensibleModel; Profile, Stereotype: string);
    procedure ChangeModelAttribute(AModel: PModel; Key: string; Value: string);
    procedure ChangeModelReference(AModel: PModel; Key: string; Value: PModel);
    procedure ClearCollection(AElement: PModel; Key: string);
    procedure AddCollectionItem(AElement: PElement; Key: string; Value: PModel);
    procedure RemoveCollectionItem(AElement: PElement; Key: string; Value: PModel);
    procedure InsertCollectionItem(AElement: PElement; Key: string; Index: Integer; Value: PModel);
    procedure DeleteCollectionItem(AElement: PElement; Key: string; Index: Integer);
    procedure ChangeCollectionItemOrder(AElement: PElement; ACollectionItem: PElement; Key: string; NewIndex: Integer);
    procedure ChangeTypeExpression(AModel: PModel; TypeExpr: string; TypeRef: PModel);
    procedure ChangeValueExpression(AModel: PModel; ValueExpr: string; ValueRef: PModel);
    procedure ChangeActionKind(AModel: PModel; ActionKind: string);
    procedure ChangeSelectedModelsAttribute(Key: string; Value: string);
    procedure ChangeSelectedModelsStereotype(StereotypeProfile: string; Stereotype: string);
    procedure ChangeDocumentation(Model: PModel; Documentation: string);
    procedure RelocateModel(AModel, Target: PModel);
    procedure FindDiagramsWithSelectedModel;

    // Model Extension Related
    function AddConstraint(AExtensibleModel: PExtensibleModel; AName: string; ABody: string): PConstraint;
    procedure DeleteConstraint(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint);
    procedure ChangeConstraint(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint; AName: string; ABody: string);
    procedure ChangeConstraintOrder(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint; NewIdx: Integer);
    procedure SetDataTaggedValue(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName, AValue: string);
    procedure SetReferenceTaggedValue(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string; AValue: PExtensibleModel);
    procedure AddCollectionTaggedValue(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string; AValue: PExtensibleModel);
    procedure RemoveCollectionTaggedValue(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string; AValue: PExtensibleModel);
    procedure InsertCollectionTaggedValue(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string; Index: Integer; AValue: PExtensibleModel);
    procedure DeleteCollectionTaggedValue(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string; Index: Integer);
    procedure SetTaggedValueAsDefault(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string);
    procedure ChangeCollectionTaggedValueOrder(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string; AValue: PExtensibleModel; NewIdx: Integer);
    procedure ClearAttachments(AModel: PModel);
    procedure AddAttachment(AModel: PModel; Attach: string);
    procedure InsertAttachment(AModel: PModel; Attach: string; Index: Integer);
    procedure DeleteAttachment(AModel: PModel; Index: Integer);
    procedure ChangeAttachment(AModel: PModel; Index: Integer; Attach: string);
    procedure ChangeAttachmentOrder(AModel: PModel; Index: Integer; NewIndex: Integer);
    procedure ApplyGeneralNameExpression(AModel: PUMLElement; Value: string);
    procedure ApplyClassifierRoleExpression(AModel: PUMLClassifierRole; Value: string);
    procedure ApplyInstanceExpression(AModel: PUMLInstance; Value: string);
    procedure ApplyAttributeExpression(AModel: PUMLAttribute; Value: string);
    procedure ApplyOperationExpression(AModel: PUMLOperation; Value: string);
    procedure ApplyMessageExpresstion(AModel: PUMLModelElement; Value: string);
    procedure ChangeModelReferenceWithNamedModelCreating(AModel: PModel; Key: string; Owner: PModel; ModelKind: string; IsClassifier: Boolean; Name: string = '');
    // Selection Related Properties
    property SelectedModels[Index: Integer]: PModel read GetSelectedModel;
    property SelectedModelCount: Integer read GetSelectedModelCount;
    property SelectedViews[Index: Integer]: PView read GetSelectedView;
    property SelectedViewCount: Integer read GetSelectedViewCount;
    property ActiveDiagram: PDiagramView read GetActiveDiagram write SetActiveDiagram;
    // Project Related Properties
    property Project: PUMLProject read GetProject;
    property ProjectDocument: PUMLProjectDocument read GetProjectDocument;
    property UnitDocuments[Index: Integer]: PUMLUnitDocument read GetUnitDocument;
    property UnitDocumentCount: Integer read GetUnitDocumentCount;
    property DocumentElements[Index: Integer]: PElement read GetDocumentElement;
    property DocumentElementCount: Integer read GetDocumentElementCount;
    property IncludedProfiles[Index: Integer]: string read GetIncludedProfile;
    property IncludedProfileCount: Integer read GetIncludedProfileCount;
    property FileName: string read GetFileName write SetFileName;
    property Modified: Boolean read GetModified;
    property UnitsModified: Boolean read GetUnitsModified;
    // Etc Properties
    property EventArgModels[Index: Integer]: PModel read GetEventArgModel;
    property EventArgModelCount: Integer read GetEventArgModelCount;
    property EventArgViews[Index: Integer]: PView read GetEventArgView;
    property EventArgViewCount: Integer read GetEventArgViewCount;
    property EventArgDocument: PDocument read GetEventArgDocument;
    property EventArgUnit: PUMLUnitDocument read GetEventArgUnit;
    property UndoLevel: Integer read GetUndoLevel write SetUndoLevel;
    property CreateBackupFile: Boolean read GetCreateBackupFile write SetCreateBackupFile;
    property ClipboardDataKind: PClipboardDataKind read GetClipboardDataKind;
    property ClipboardElementKind: string read GetClipboardElementKind;
    property ClipboardCopyContext: string read GetClipboardCopyContext;
    property LookAndFeelManager: TLookAndFeelManager read GetLookAndFeelManager;
    // Events
    property OnSelectionChanged: TNotifyEvent read FOnSelectionChanged write FOnSelectionChanged;
    property OnDiagramActivated: TNotifyEvent read FOnDiagramActivated write FOnDiagramActivated;
    property OnElementsCreated: PModelsViewsEvent read FOnElementsCreated write FOnElementsCreated;
    property OnElementsDeleting: PModelsViewsEvent read FOnElementsDeleting write FOnElementsDeleting;
    property OnElementsDeleted: TNotifyEvent read FOnElementsDeleted write FOnElementsDeleted;
    property OnModelsChanged: PModelsEvent read FOnModelsChanged write FOnModelsChanged;
    property OnViewsChanged: PViewsEvent read FOnViewsChanged write FOnViewsChanged;
    property OnDocumentModified: PDocumentEvent read FOnDocumentModified write FOnDocumentModified;
    property OnDocumentSaved: PDocumentEvent read FOnDocumentSaved write FOnDocumentSaved;
    property OnProjectOpened: TNotifyEvent read FOnProjectOpened write FOnProjectOpened;
    property OnProjectSaved: TNotifyEvent read FOnProjectSaved write FOnProjectSaved;
    property OnProjectClosing: TNotifyEvent read FOnProjectClosing write FOnProjectClosing;
    property OnProjectClosed: TNotifyEvent read FOnProjectClosed write FOnProjectClosed;
    property OnProjectCloseQuery: TCloseQueryEvent read FOnProjectCloseQuery write FOnProjectCloseQuery;
    property OnUnitSeparated: PUnitEvent read FOnUnitSeparated write FOnUnitSeparated;
    property OnUnitMerged: PUnitEvent read FOnUnitMerged write FOnUnitMerged;
    property OnUnitOpened: PUnitEvent read FOnUnitOpened write FOnUnitOpened;
    property OnUnitUnloaded: PUnitEvent read FOnUnitUnloaded write FOnUnitUnloaded;
    property OnSavingProgress: PProgressEvent read FOnSavingProgress write FOnSavingProgress;
    property OnLoadingProgress: PProgressEvent read FOnLoadingProgress write FOnLoadingProgress;
    property OnResolvingProgress: PProgressEvent read FOnResolvingProgress write FOnResolvingProgress;
    property OnBrowseDiagram: PDiagramEvent read FOnBrowseDiagram write FOnBrowseDiagram;
    property OnSelectModelInExplorer: PModelEvent read FOnSelectModelInExplorer write FOnSelectModelInExplorer;
    property OnClipboardDataChanged: PClipboardDataChangedEvent read FOnClipboardDataChanged write FOnClipboardDataChanged;
    property OnCommandHistoryChanged: TNotifyEvent read FOnCommandHistoryChanged write FOnCommandHistoryChanged;
    property OnBeginUpdate: TNotifyEvent read FOnBeginUpdate write FOnBeginUpdate;
    property OnEndUpdate: PEndUpdateEvent read FOnEndUpdate write FOnEndUpdate;
    property OnIncludeProfile: PProfileEvent read FOnIncludeProfile write FOnIncludeProfile;
    property OnExcludeProfile: PProfileEvent read FOnExcludeProfile write FOnExcludeProfile;
  end;

var
  StarUMLApplication: PStarUMLApplication;

implementation

uses
  Windows, Dialogs, ShellAPI, System.UITypes, Vcl.Imaging.Jpeg, Vcl.Imaging.pngimage,
  LogMgr, UMLVerify, NLS_StarUML, MainFrm, MessageFrame;


////////////////////////////////////////////////////////////////////////////////
// PStarUMLApplication

constructor PStarUMLApplication.Create;
begin
  ModelSet := PModelOrderedSet.Create;
  ViewSet := PViewOrderedSet.Create;
  LockUpdate := False;
  LockUpdateDepth := 0;
  // ProjectManager
  ProjectManager := PProjectManager.Create;
  ProjectManager.OnDocumentModified := DocumentModified;
  ProjectManager.OnDocumentSaved := DocumentSaved;
  ProjectManager.OnProjectOpened := ProjectOpened;
  ProjectManager.OnProjectSaved := ProjectSaved;
  ProjectManager.OnProjectClosing := ProjectClosing;
  ProjectManager.OnProjectCloseQuery := ProjectCloseQuery;
  ProjectManager.OnProjectClosed := ProjectClosed;
  ProjectManager.OnUnitSeparated := UnitSeparated;
  ProjectManager.OnUnitMerged := UnitMerged;
  ProjectManager.OnUnitOpened := UnitOpened;
  ProjectManager.OnProfileIncluded := ProfileIncluded;
  ProjectManager.OnProfileExcluded := ProfileExcluded;
  ProjectManager.OnSavingProgress := SavingProgress;
  ProjectManager.OnLoadingProgress := LoadingProgress;
  ProjectManager.OnResolvingProgress := ResolvingProgress;
  // CommandExecutor
  CommandExecutor := PCommandExecutor.Create;
  CommandExecutor.OnElementsCreated := ElementsCreated;
  CommandExecutor.OnElementsDeleting := ElementsDeleting;
  CommandExecutor.OnElementsDeleted := ElementsDeleted;
  CommandExecutor.OnModelsChanged := ModelsChanged;
  CommandExecutor.OnViewsChanged := ViewsChanged;
  CommandExecutor.OnCommandHistoryChanged := CommandHistoryChangedHandler;
  // SelectionManager
  SelectionManager := PSelectionManager.Create;
  SelectionManager.OnSelectionChanged := SelectionChanged;
  SelectionManager.OnDiagramActivated := DiagramActivated;
  // ClipboardManager
  ClipboardManager := PClipboardManager.Create;
  ClipboardManager.OnClipboardDataChanged := ClipboardDataKindChangedHandler;
  // Event Arguments
  FEventArgModels := PModelOrderedSet.Create;
  FEventArgViews := PViewOrderedSet.Create;
  FEventArgDocument := nil;
  FEventArgUnit := nil;
end;

destructor PStarUMLApplication.Destroy;
begin
  ProjectManager.Free;
  CommandExecutor.Free;
  SelectionManager.Free;
  ClipboardManager.Free;
  ModelSet.Free;
  ViewSet.Free;
  FEventArgModels.Free;
  FEventArgViews.Free;
  inherited;
end;

procedure PStarUMLApplication.Initialize;
begin
  ClipboardManager.SetHandle(Application.MainForm.Handle);
  ClipboardManager.OpenClipboard;
end;

procedure PStarUMLApplication.Finalize;
begin
  ClipboardManager.CloseClipboard;
end;

procedure PStarUMLApplication.Log(Text: string);
begin
  LogManager.Log(Text);
end;

procedure PStarUMLApplication.BeginUpdate;
begin
  if LockUpdateDepth = 0 then
  begin
    if Assigned(FOnBeginUpdate) then FOnBeginUpdate(Self);
    LockUpdate := True;
  end;
  Inc(LockUpdateDepth);
end;

procedure PStarUMLApplication.EndUpdate(CompletelyRebuild: Boolean = False; UseUpdateLock: Boolean = True);
begin
  Dec(LockUpdateDepth);
  if LockUpdateDepth = 0 then
  begin
    LockUpdate := False;
    if Assigned(FOnEndUpdate) then
      FOnEndUpdate(Self, CompletelyRebuild, UseUpdateLock);
  end;
end;

procedure PStarUMLApplication.BeginGrouping;
begin
  BeginUpdate;
  CommandExecutor.BeginGrouping;
end;

procedure PStarUMLApplication.EndGrouping;
begin
  CommandExecutor.EndGrouping;
  EndUpdate(False, False);
end;

procedure PStarUMLApplication.OpenURL(URL: string);
begin
  ShellExecute(0, 'open', PChar(URL), '', '', SW_SHOWNORMAL);
end;

procedure PStarUMLApplication.SelectionChanged(Sender: TObject);
var
  I: Integer;
begin
  if not LockUpdate and Assigned(FOnSelectionChanged) then
  begin
    FEventArgModels.Clear;
    for I := 0 to SelectionManager.SelectedModelCount - 1 do
      FEventArgModels.Add(SelectionManager.SelectedModels[I]);
    FEventArgViews.Clear;
    for I := 0 to SelectionManager.SelectedViewCount - 1 do
      FEventArgViews.Add(SelectionManager.SelectedViews[I]);
    FOnSelectionChanged(Self);
  end;
end;

procedure PStarUMLApplication.DiagramActivated(Sender: TObject);
begin
  if not LockUpdate and Assigned(FOnDiagramActivated) then
  begin
    FOnDiagramActivated(Self);
  end;
end;

procedure PStarUMLApplication.ElementsCreated(Sender: TObject; Models: PModelOrderedSet; Views: PViewOrderedSet);
begin
  if not LockUpdate and Assigned(FOnElementsCreated) then
  begin
    FEventArgModels.Assign(Models);
    FEventArgViews.Assign(Views);
    FOnElementsCreated(Self, Models, Views);
  end;
end;

procedure PStarUMLApplication.ElementsDeleting(Sender: TObject; Models: PModelOrderedSet; Views: PViewOrderedSet);
begin
  if not LockUpdate and Assigned(FOnElementsDeleting) then
  begin
    FEventArgModels.Assign(Models);
    FEventArgViews.Assign(Views);
    FOnElementsDeleting(Self, Models, Views);
  end;
end;

procedure PStarUMLApplication.ElementsDeleted(Sender: TObject);
begin
  if not LockUpdate and Assigned(FOnElementsDeleted) then
  begin
    FEventArgModels.Clear;
    FEventArgViews.Clear;
    FOnElementsDeleted(Self);
  end;
end;

procedure PStarUMLApplication.ModelsChanged(Sender: TObject; Models: PModelOrderedSet);
begin
  if not LockUpdate and Assigned(FOnModelsChanged) then
  begin
    FEventArgModels.Assign(Models);
    FOnModelsChanged(Self, Models);
  end;
end;

procedure PStarUMLApplication.ViewsChanged(Sender: TObject; Views: PViewOrderedSet);
begin
  if not LockUpdate and Assigned(FOnViewsChanged) then
  begin
    FEventArgViews.Assign(Views);
    FOnViewsChanged(Self, Views);
  end;
end;

procedure PStarUMLApplication.DocumentModified(Sender: TObject; Document: PDocument);
begin
  if not LockUpdate and Assigned(FOnDocumentModified) then
  begin
    FEventArgDocument := Document;
    FOnDocumentModified(Self, Document);
  end;
end;

procedure PStarUMLApplication.DocumentSaved(Sender: TObject; Document: PDocument);
begin
  if not LockUpdate and Assigned(FOnDocumentSaved) then
  begin
    FEventArgDocument := Document;
    FOnDocumentSaved(Self, Document);
  end;
end;

procedure PStarUMLApplication.ProjectOpened(Sender: TObject);
begin
  if not LockUpdate and Assigned(FOnProjectOpened) then
  begin
    FOnProjectOpened(Self);
  end;
end;

procedure PStarUMLApplication.ProjectSaved(Sender: TObject);
begin
  if not LockUpdate and Assigned(FOnProjectSaved) then
  begin
    FOnProjectSaved(Self);
  end;
end;

procedure PStarUMLApplication.ProjectClosing(Sender: TObject);
begin
  if not LockUpdate and Assigned(FOnProjectClosing) then
  begin
    FOnProjectClosing(Self);
  end;
end;

procedure PStarUMLApplication.ProjectCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not LockUpdate and Assigned(FOnProjectCloseQuery) then
    FOnProjectCloseQuery(Self, CanClose);
end;

procedure PStarUMLApplication.ProjectClosed(Sender: TObject);
begin
  if not LockUpdate and Assigned(FOnProjectClosed) then
  begin
    FOnProjectClosed(Self);
  end;
end;

procedure PStarUMLApplication.UnitSeparated(Sender: TObject; APackage: PUMLPackage);
begin
  if not LockUpdate and Assigned(FOnUnitSeparated) then
  begin
    FEventArgModels.Clear;
    FEventArgModels.Add(APackage);
    FEventArgDocument := nil;
    FEventArgUnit := APackage.Document as PUMLUnitDocument;
    FOnUnitSeparated(Self, APackage);
  end;
end;

procedure PStarUMLApplication.UnloadUnit(APackage: PUMLPackage);
var
  FileName: string;
  Owner: PUMLPackage;
  Index: Integer;
  UnitDoc: PUMLUnitDocument;
  ParentUnitDoc: PUMLUnitDocument;
  StubUnit: PUMLUnitStubDocument;
begin
  // Store unit parameters need for the stub
  UnitDoc := APackage.Document as PUMLUnitDocument;
  FileName := UnitDoc.FileName;
  ParentUnitDoc := UnitDoc.ParentUnitDocument;
  Owner := APackage.VirtualNamespace as PUMLPackage;
  Index := Owner.IndexOfOwnedElement(APackage);

  DeleteUnit(APackage);

  // Create stub
  StubUnit := ProjectManager.LoadUnitStub(ParentUnitDoc, Owner, Index,
    ExtractFileName(FileName), ExtractFilePath(FileName));
  FOnUnitUnloaded(Self, StubUnit.DocumentElement as PUMLPackage);
end;

procedure PStarUMLApplication.UnitMerged(Sender: TObject; APackage: PUMLPackage);
begin
  if not LockUpdate and Assigned(FOnUnitMerged) then
  begin
    FEventArgModels.Clear;
    FEventArgModels.Add(APackage);
    FEventArgDocument := nil;
    FEventArgUnit := nil;
    FOnUnitMerged(Self, APackage);
  end;
end;

procedure PStarUMLApplication.UnitOpened(Sender: TObject; APackage: PUMLPackage);
begin
  if not LockUpdate and Assigned(FOnUnitOpened) then
  begin
    FEventArgModels.Clear;
    FEventArgModels.Add(APackage);
    FEventArgDocument := nil;
    FEventArgUnit := APackage.Document as PUMLUnitDocument;
    FOnUnitOpened(Self, APackage);
  end;
end;

procedure PStarUMLApplication.ProfileIncluded(Sender: TObject; AProfileName: string);
begin
  if not LockUpdate and Assigned(FOnIncludeProfile) then
    FOnIncludeProfile(Self, AProfileName);
end;

procedure PStarUMLApplication.ProfileExcluded(Sender: TObject; AProfileName: string);
begin
  if not LockUpdate and Assigned(FOnExcludeProfile) then
    FOnExcludeProfile(Self, AProfileName);
end;

procedure PStarUMLApplication.SavingProgress(Sender: TObject; Info: string; Max, Progress: Integer);
begin
  if not LockUpdate and Assigned(FOnSavingProgress) then
    FOnSavingProgress(Self, Info, Max, Progress);
end;

procedure PStarUMLApplication.LoadingProgress(Sender: TObject; Info: string; Max, Progress: Integer);
begin
  if not LockUpdate and Assigned(FOnLoadingProgress) then
    FOnLoadingProgress(Self, Info, Max, Progress);
end;

procedure PStarUMLApplication.ResolvingProgress(Sender: TObject; Info: string; Max, Progress: Integer);
begin
  if not LockUpdate and Assigned(FOnResolvingProgress) then
    FOnResolvingProgress(Self, Info, Max, Progress);
end;

procedure PStarUMLApplication.ClipboardDataKindChangedHandler(Kind: PClipboardDataKind);
begin
  if not LockUpdate and Assigned(FOnClipboardDataChanged) then
    FOnClipboardDataChanged(Kind);
end;

procedure PStarUMLApplication.CommandHistoryChangedHandler(Sender: TObject);
begin
  if not LockUpdate and Assigned(FOnCommandHistoryChanged) then
    FOnCommandHistoryChanged(Self);
end;

procedure PStarUMLApplication.BrowseDiagram(Diagram: PDiagram);
begin
  if not LockUpdate and Assigned(FOnBrowseDiagram) then
    FOnBrowseDiagram(Self, Diagram);
end;

procedure PStarUMLApplication.SelectModelInExplorer(Model: PModel);
begin
  if not LockUpdate and Assigned(FOnSelectModelInExplorer) then
    FOnSelectModelInExplorer(Self, Model);
end;

procedure PStarUMLApplication.SetFileName(Value: string);
begin
  if ProjectManager.ProjectDocument <> nil then
    ProjectManager.ProjectDocument.FileName := Value;
end;

function PStarUMLApplication.GetFileName: string;
begin
  if ProjectManager.ProjectDocument <> nil then
    Result := ProjectManager.ProjectDocument.FileName
  else
    Result := '';
end;

function PStarUMLApplication.GetModified: Boolean;
begin
  Result := ProjectManager.Modified;
end;

function PStarUMLApplication.GetUnitsModified: Boolean;
begin
  Result := ProjectManager.UnitsModified;
end;

function PStarUMLApplication.GetEventArgModel(Index: Integer): PModel;
begin
  Result := FEventArgModels[Index];
end;

function PStarUMLApplication.GetEventArgModelCount: Integer;
begin
  Result := FEventArgModels.Count;
end;

function PStarUMLApplication.GetEventArgView(Index: Integer): PView;
begin
  Result := FEventArgViews[Index];
end;

function PStarUMLApplication.GetEventArgViewCount: Integer;
begin
  Result := FEventArgViews.Count;
end;

function PStarUMLApplication.GetEventArgDocument: PDocument;
begin
  Result := FEventArgDocument;
end;

function PStarUMLApplication.GetEventArgUnit: PUMLUnitDocument;
begin
  Result := FEventArgUnit;
end;

function PStarUMLApplication.GetUndoLevel: Integer;
begin
  Result := CommandExecutor.UndoLevel;
end;

procedure PStarUMLApplication.SetUndoLevel(Value: Integer);
begin
  CommandExecutor.UndoLevel := Value;
end;

function PStarUMLApplication.GetCreateBackupFile: Boolean;
begin
  Result := ProjectManager.CreackBackupFile;
end;

procedure PStarUMLApplication.SetCreateBackupFile(Value: Boolean);
begin
  ProjectManager.CreackBackupFile := Value;
end;

function PStarUMLApplication.GetClipboardDataKind: PClipboardDataKind;
begin
  Result := ClipboardManager.ClipboardDataKind;
end;

function PStarUMLApplication.GetClipboardElementKind: string;
begin
  Result := ClipboardManager.ClipboardElementKind;
end;

function PStarUMLApplication.GetClipboardCopyContext: string;
begin
  Result := ClipboardManager.ClipboardCopyContext;
end;

function PStarUMLApplication.GetLookAndFeelManager: TLookAndFeelManager;
begin
  Result := MainForm.LookAndFeelManager;
end;

procedure PStarUMLApplication.SetActiveDiagram(Value: PDiagramView);
begin
  SelectionManager.ActiveDiagram := Value;
end;

function PStarUMLApplication.GetActiveDiagram: PDiagramView;
begin
  Result := SelectionManager.ActiveDiagram;
end;

function PStarUMLApplication.GetProject: PUMLProject;
begin
  Result := ProjectManager.Project;
end;

function PStarUMLApplication.GetProjectDocument: PUMLProjectDocument;
begin
  Result := ProjectManager.ProjectDocument;
end;

function PStarUMLApplication.GetUnitDocument(Index: Integer): PUMLUnitDocument;
begin
  Result := ProjectManager.UnitDocuments[Index];
end;

function PStarUMLApplication.GetUnitDocumentCount: Integer;
begin
  Result := ProjectManager.UnitDocumentCount;
end;

function PStarUMLApplication.GetDocumentElement(Index: Integer): PElement;
begin
  Result := ProjectManager.DocumentElements[Index];
end;

function PStarUMLApplication.GetDocumentElementCount: Integer;
begin
  Result := ProjectManager.DocumentElementCount;
end;

function PStarUMLApplication.GetIncludedProfile(Index: Integer): string;
begin
  Result := ProjectManager.IncludedProfiles[Index];
end;

function PStarUMLApplication.GetIncludedProfileCount: Integer;
begin
  Result := ProjectManager.IncludedProfileCount;
end;

function PStarUMLApplication.GetSelectedModel(Index: Integer): PModel;
begin
  Result := SelectionManager.SelectedModels[Index];
end;

function PStarUMLApplication.GetSelectedModelCount: Integer;
begin
  Result := SelectionManager.SelectedModelCount;
end;

function PStarUMLApplication.GetSelectedView(Index: Integer): PView;
begin
  Result := SelectionManager.SelectedViews[Index];
end;

function PStarUMLApplication.GetSelectedViewCount: Integer;
begin
  Result := SelectionManager.SelectedViewCount;
end;

procedure PStarUMLApplication.DetermineDeletingElements(Models: PModelOrderedSet; Views: PViewOrderedSet);
var
  Model: PModel;
  View: PView;
  Changed: Boolean;

  // ---------------------------------------------------------------------------
  // determine model to delete with view (Stimulus and Message)
  // ---------------------------------------------------------------------------
  procedure DetermineModelsThatShouldBeDeletedWithView(ModelSet: PModelOrderedSet; ViewSet: PViewOrderedSet);
  var
    V: PView;
  begin
    for V in ViewSet do
    begin
      if (V is PUMLColMessageView) or (V is PUMLColStimulusView) or
         (V is PUMLSeqMessageView) or (V is PUMLSeqStimulusView) or
         (V is PUMLInteractionOperandView) then
      begin
        ModelSet.Add(V.Model);
      end;
    end;
  end;

  // ---------------------------------------------------------------------------
  // remove undeletable models from Set
  // ---------------------------------------------------------------------------
  function ExcludeUndeletableModel(AModel: PModel; ModelSet: PModelOrderedSet; ViewSet: PViewOrderedSet): Boolean;
  begin
    Result := False;
    // Project cannot be deleted.
    if (AModel is PUMLProject) then
    begin
      ModelSet.Remove(AModel);
      Result := True;
    end
    // AssociationEnd, AssociationEndRole, and LinkEnd can't be deleted standalone
    else if (AModel is PUMLAssociationEndRole) or (AModel is PUMLAssociationEnd)
      or (AModel is PUMLLinkEnd) then
    begin
      if not ModelSet.Contains(AModel.VirtualNamespace) then
      begin
        ModelSet.Remove(AModel);
        Result := True;
      end;
    end
    // Stimulus and Message's Action can't be deleted standalone
    else if (AModel is PUMLAction) and
      (((AModel as PUMLAction).Stimulus <> nil) or ((AModel as PUMLAction).Message <> nil)) then
    begin
      if not ModelSet.Contains(AModel.VirtualNamespace) then
      begin
        ModelSet.Remove(AModel);
        Result := True;
      end;
    end
    // StateMachine's Top can't be deleted standalone
    else if (AModel is PUMLCompositeState)
      and ((AModel as PUMLCompositeState).StateMachine <> nil) then
    begin
      if not ModelSet.Contains(AModel.VirtualNamespace) then
      begin
        ModelSet.Remove(AModel);
        Result := True;
      end;
    end;
  end;

  // ---------------------------------------------------------------------------
  // insert Owned Models into deletion Set
  // ---------------------------------------------------------------------------
  function IncludeModelsOwnedBy(AModel: PModel; ModelSet: PModelOrderedSet; ViewSet: PViewOrderedSet): Boolean;
  var
    C: Integer;
    Model: PModel;
  begin
    C := ModelSet.Count;
    for Model in AModel.VirtualOwnedModels do
      ModelSet.Add(Model);
    Result := (ModelSet.Count <> C);
  end;

  // ---------------------------------------------------------------------------
  // insert all views related to model into set
  // ---------------------------------------------------------------------------
  function IncludeViewsOf(AModel: PModel; ModelSet: PModelOrderedSet; ViewSet: PViewOrderedSet): Boolean;
  var
    C: Integer;
    View: PView;
    Diagram: PDiagram;
  begin
    C := ViewSet.Count;
    for View in AModel.Views do
      ViewSet.Add(View);
    // 모델이 PDiagram인 경우 그것의 DiagramView와 모든 OwnedView들을 추가한다.
    if AModel is PDiagram then begin
      Diagram := AModel as PDiagram;
      ViewSet.Add(Diagram.DiagramView);
      for View in Diagram.DiagramView.OwnedViews do
        ViewSet.Add(View);
    end;
    Result := (ViewSet.Count <> C);
  end;

  // ---------------------------------------------------------------------------
  // insert all edge views connected to view into set
  // ---------------------------------------------------------------------------
  function IncludeEdgeViews(AView: PView; ModelSet: PModelOrderedSet; ViewSet: PViewOrderedSet): Boolean;
  var
    C: Integer;
    V: PView;
    DV: PDiagramView;
  begin
    C := ViewSet.Count;
    DV := AView.GetDiagramView;
    if DV <> nil then begin
      for V in  DV.OwnedViews do begin
        if V is PEdgeView then begin
          if ((V as PEdgeView).Head = AView) or ((V as PEdgeView).Tail = AView) then
            ViewSet.Add(V);
        end;
      end;
    end;
    Result := (ViewSet.Count <> C);
  end;

  // ---------------------------------------------------------------------------
  // insert views to be deleted with model into set
  // ---------------------------------------------------------------------------
  function IncludeRelatedViews(AView: PView; ModelSet: PModelOrderedSet; ViewSet: PViewOrderedSet): Boolean;
  var
    C: Integer;
    V: PView;
  begin
    C := ViewSet.Count;
    if AView is PUMLLinkView then
    begin
      for  V in AView.GetDiagramView.OwnedViews do begin
        if (V is PUMLColStimulusView) and
           ((V as PUMLColStimulusView).HostEdge = AView) then
           ViewSet.Add(V);
      end;
    end
    else if AView is PUMLAssociationRoleView then
    begin
      for V in AView.GetDiagramView.OwnedViews do begin
        if (V is PUMLColMessageView) and
           ((V as PUMLColMessageView).HostEdge = AView) then
           ViewSet.Add(V);
      end;
    end;
    Result := (ViewSet.Count <> C);
  end;

  // ---------------------------------------------------------------------------
  // insert all SubViews into set
  // ---------------------------------------------------------------------------
  function IncludeSubViews(AView: PView; ModelSet: PModelOrderedSet; ViewSet: PViewOrderedSet): Boolean;
  var
    C: Integer;
    SubView: PView;
  begin
    C := ViewSet.Count;
    for SubView in AView.SubViews do
      ViewSet.Add(SubView);
    Result := (ViewSet.Count <> C);
  end;

  // ---------------------------------------------------------------------------
  // remove views contained in read-only document from set
  // ---------------------------------------------------------------------------
  function ExcludeReadOnlyView(AView: PView; ModelSet: PModelOrderedSet; ViewSet: PViewOrderedSet): Boolean;
  var
    Doc: PDocument;
  begin
    Result := False;
    Doc := AView.GetContainingDocument;
    if (Doc <> nil) and (Doc.ReadOnly) then begin
      ViewSet.Remove(AView);
      Result := True;
    end;
  end;

begin
  repeat
     Changed := False;
     for Model in Models do begin

       Changed := Changed or ExcludeUndeletableModel(Model, Models, Views);
       Changed := Changed or IncludeModelsOwnedBy(Model, Models, Views);
       Changed := Changed or IncludeRelationsOf(Model, Models);
       Changed := Changed or IncludeViewsOf(Model, Models, Views);
     end;
  until (not Changed);
  repeat
     Changed := False;
     for View in Views do begin
       Changed := Changed or IncludeSubViews(View, Models, Views);
       Changed := Changed or IncludeEdgeViews(View, Models, Views);
       Changed := Changed or IncludeRelatedViews(View, Models, Views);
       Changed := Changed or ExcludeReadOnlyView(View, Models, Views);
     end;
  until (not Changed);
  DetermineModelsThatShouldBeDeletedWithView(Models, Views);
end;

procedure PStarUMLApplication.CheckUndeletableViews(Views: PViewOrderedSet);
var
  V: PView;
begin
  for V in Views do begin
    if (V.OwnerDiagramView = nil) and not ViewSet.Contains(V.Parent) and (V.ContainerView = nil) then
      raise EUndeletableElement.Create(ERR_SUBVIEW_CANNOT_BE_DELETED);
  end;
end;

function PStarUMLApplication.CheckDeleteUnits(ElementSet: PModelOrderedSet): Boolean;
var
  E: PElement;
  R: Integer;

  function UnitExists(ASet: PElementOrderedSet): Boolean; overload;
  var
    Element: PElement;
  begin
    Result := False;
    for Element in ASet do
      if Element.IsDocumentElement then begin
        Result := True;
        Exit;
      end;
  end;

  function UnitExists(ASet: PModelOrderedSet): Boolean; overload;
  var
    Element: PElement;
  begin
    Result := False;
    for Element in ASet do begin
      if Element.IsDocumentElement then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;

begin
  Result := True;
  if UnitExists(ElementSet) then
  begin
    R := Application.MessageBox(PChar(QUERY_DELETE_UNITS), PChar(Application.Title), MB_ICONQUESTION or MB_YESNO);
    if R = IDYES then
      for E in ElementSet do begin
        if E.IsDocumentElement then
          ProjectManager.MergeUnit(E as PUMLPackage);
      end
    else
      Result := False;
  end
end;

procedure PStarUMLApplication.CheckUnmovableViews(Views: PViewOrderedSet);
  function ContaierViewExistInSet(AContainerView: PView; ASet: PViewOrderedSet): Boolean;
  var
    I: Integer;
    SetElement: PView;
  begin
    Result := False;
    if AContainerView = nil then Exit;
    for I := 0 to ASet.Count - 1 do begin
      SetElement := ASet.Items[I] as PView;
      if SetElement = AContainerView then begin
        Result := True;
        Exit;
      end else Result := ContaierViewExistInSet(AContainerView.ContainerView, ASet);
    end;
  end;
var
  I, J: Integer;
  AView, SetElement: PView;
begin
  for I := Views.Count - 1 downto 0 do begin
    AView := Views.Items[I] as PView;
    if AView.ContainerView = nil then Continue;
    for J := 0 to Views.Count - 1 do begin
      SetElement := Views.Items[J] as PView;
      if SetElement = AView then Continue;
      if AView.ContainerView = SetElement then begin
        Views.Delete(I);
        Break;
      end else begin
        if ContaierViewExistInSet(AView.ContainerView, Views) then begin
          Views.Delete(I);
          Break;
        end;
      end;
    end;
  end;
end;

procedure PStarUMLApplication.CheckFileName(FilePath: string);
const
  NotAvailablesInFileName: array[0..8] of string = ('\', '/', ':', '*', '?', '"', '<', '>', '|');
  NotAvailablesInPath: array[0..5] of string = ('*', '?', '"', '<', '>', '|');
var
  FN: string;
  Dir: string;
  I: Integer;
begin
  FN := ExtractFileName(FilePath);
  Dir := ExtractFilePath(FilePath);
  if (Dir <> '') and (not DirectoryExists(Dir)) then
    raise EDirectoryNotFound.Create(ERR_DIRECTORY_NOT_FOUND);
  if FN = '' then
    raise EInvalidFileName.Create(ERR_INVALID_FILE_NAME);
  for I := 0 to Length(NotAvailablesInPath) - 1 do
    if Pos(NotAvailablesInPath[I], FilePath) > 0 then
      raise EInvalidFileName.Create(ERR_INVALID_FILE_NAME);
  for I := 0 to Length(NotAvailablesInFileName) - 1 do
    if Pos(NotAvailablesInFileName[I], FN) > 0 then
      raise EInvalidFileName.Create(ERR_INVALID_FILE_NAME);
end;

function PStarUMLApplication.DifferentAttributeExists(ElementSet: POrderedSet; Key, Value: string): Boolean;
var
  I: Integer;
  E: PElement;
begin
  Result := False;
  for I := 0 to ElementSet.Count - 1 do
  begin
    E := ElementSet.Items[I] as PElement;
    if (E.MetaClass <> nil) and E.MetaClass.ExistsAttribute(Key) then
    begin
      if E.MOF_GetAttribute(Key) <> Value then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;
end;

function PStarUMLApplication.DifferentAttributeExists(ElementSet: PModelOrderedSet; Key, Value: string): Boolean;
var
  E: PElement;
begin
  Result := False;
  for E in ElementSet do
  begin
    if (E.MetaClass <> nil) and E.MetaClass.ExistsAttribute(Key) then
    begin
      if E.MOF_GetAttribute(Key) <> Value then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;
end;

function PStarUMLApplication.DifferentAttributeExists(ElementSet: PViewOrderedSet; Key, Value: string): Boolean;
var
  E: PElement;
begin
  Result := False;
  for E in ElementSet do
  begin
    if (E.MetaClass <> nil) and E.MetaClass.ExistsAttribute(Key) then
    begin
      if E.MOF_GetAttribute(Key) <> Value then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;
end;

procedure PStarUMLApplication.ElementModified(Element: PElement);
var
  Doc: PDocument;
begin
  if Element <> nil then begin
    Doc := Element.GetContainingDocument;
    if Doc <> nil then begin
      Doc.Modified := True;
    end;
  end;
end;

procedure PStarUMLApplication.ElementModified(ElementSet: POrderedSet);
var
  I: Integer;
begin
  for I := 0 to ElementSet.Count - 1 do
    ElementModified(ElementSet.Items[I] as PElement);
end;

procedure PStarUMLApplication.ElementModified(ElementSet: PModelOrderedSet);
var
  Element: PElement;
begin
  for Element in  ElementSet do
    ElementModified(Element);
end;

procedure PStarUMLApplication.ElementModified(ElementSet: PViewOrderedSet);
var
  Element: PElement;
begin
  for Element in  ElementSet do
    ElementModified(Element);
end;



procedure PStarUMLApplication.CollectElements(Element: PElement; CollectionName: string; ASet: POrderedSet);
var
  I: Integer;
begin
  for I := 0 to Element.MOF_GetCollectionCount(CollectionName) - 1 do
    ASet.Add(Element.MOF_GetCollectionItem(CollectionName, I));
end;

procedure PStarUMLApplication.CollectElements(Element: PModel; CollectionName: string; ASet: PModelOrderedSet);
var
  I: Integer;
begin
  for I := 0 to Element.MOF_GetCollectionCount(CollectionName) - 1 do
    ASet.Add(Element.MOF_GetCollectionItem(CollectionName, I) as PModel);
end;

procedure PStarUMLApplication.CollectOwners(Models, Owners: PModelOrderedSet);
var
  //I: Integer;
  Model: PModel;
begin
  //for I := 0 to Models.Count - 1 do
    //Owners.Add((Models.Items[I] as PModel).VirtualNamespace);
  for Model in Models do
    Owners.Add(Model.VirtualNamespace);

end;

procedure PStarUMLApplication.CollectDiagramViews(Views, DiagramViews: PViewOrderedSet);
var
  I: Integer;
begin
  for I := 0 to Views.Count - 1 do
    DiagramViews.Add((Views.Items[I] as PView).OwnerDiagramView);
end;

procedure PStarUMLApplication.CollectModelsOfViews(Views: PViewOrderedSet; Models: PModelOrderedSet);
var
  I: Integer;
  V: PView;
begin
  for I := 0 to Views.Count - 1 do
  begin
    V := Views.Items[I] as PView;
    if V.Model <> nil then Models.Add(V.Model);
  end;
end;

procedure PStarUMLApplication.NewProject(ApproachName: string = '');
begin
  if CloseProject then
  begin
    ProjectManager.NewProject(ApproachName);
    CommandExecutor.ClearHistory;
  end;
end;

procedure PStarUMLApplication.SaveProject;
begin
  ProjectManager.SaveProject;
  CommandExecutor.ClearHistory;
end;

procedure PStarUMLApplication.SaveProjectAs(FileName: string);
begin
  CheckFileName(FileName);
  ProjectManager.SaveProjectAs(FileName);
  CommandExecutor.ClearHistory;
end;

procedure PStarUMLApplication.OpenProject(FileName: string; AFileAccessType: PFileAccessType = fatNormal);
begin
  if CloseProject then
  begin
    ProjectManager.OpenProject(FileName,AFileAccessType);
    CommandExecutor.ClearHistory;
  end;
end;

function PStarUMLApplication.CloseProject: Boolean;
begin
  Result := False;
  if ProjectManager.ProjectCanClose then begin
    CommandExecutor.ClearHistory;
    Result := ProjectManager.CloseProject;
    if Result then
      SelectionManager.DeselectAll;
  end;
end;

function PStarUMLApplication.SeparateUnit(APackage: PUMLPackage; AFileName: string): PUMLUnitDocument;
var
  AUnit: PUMLUnitDocument;
begin
  CheckFileName(AFileName);
  CheckReadOnly(APackage);
  if (APackage is PUMLProject) or (APackage.IsDocumentElement) then
    raise EImproperElement.Create(ERR_IMPROPER_ELEMENET);
  AUnit := ProjectManager.SeparateUnit(APackage, AFileName);
  AUnit.Modified := True;
  ProjectManager.SaveUnit(APackage);
  ElementModified(APackage.Namespace);
  Result := AUnit;
end;

procedure PStarUMLApplication.MergeUnit(APackage: PUMLPackage);
begin
  CheckReadOnly(APackage.Namespace);
  if (APackage is PUMLProject) or (not APackage.IsDocumentElement) then
    raise EImproperElement.Create(ERR_IMPROPER_ELEMENET);
  ProjectManager.MergeUnit(APackage);
  ElementModified(APackage);
end;

function PStarUMLApplication.OpenUnit(ABasePackage: PUMLPackage; AFileName: string): PUMLUnitDocument;
var
  AUnit: PUMLUnitDocument;
begin
  CheckReadOnly(ABasePackage);
  AUnit := ProjectManager.OpenUnit(ABasePackage, AFileName);
  ElementModified(ABasePackage);
  CommandExecutor.ClearHistory;
  Result := AUnit;
end;

procedure PStarUMLApplication.DeleteUnit(APackage: PUMLPackage);
begin
  CheckReadOnly(APackage.Namespace);
  if (APackage is PUMLProject) or (not APackage.IsDocumentElement) then
    raise EImproperElement.Create(ERR_IMPROPER_ELEMENET);
  if APackage.CanDelete and APackage.IsDocumentElement then
  begin
    ProjectManager.MergeUnit(APackage);
    DeleteModel(APackage);
    CommandExecutor.ClearHistory;
  end;
end;

procedure PStarUMLApplication.SaveUnit(APackage: PUMLPackage);
begin
  if (APackage is PUMLProject) or (not APackage.IsDocumentElement) then
    raise EImproperElement.Create(ERR_IMPROPER_ELEMENET);
  ProjectManager.SaveUnit(APackage);
end;

procedure PStarUMLApplication.SaveUnitAs(APackage: PUMLPackage; AFileName: string);
begin
  CheckFileName(AFileName);
  CheckReadOnly(APackage.Namespace);
  if (APackage is PUMLProject) or (not APackage.IsDocumentElement) then
    raise EImproperElement.Create(ERR_IMPROPER_ELEMENET);
  ProjectManager.SaveUnitAs(APackage, AFileName);
  if APackage.Namespace <> nil then
    ElementModified(APackage.Namespace);
end;

procedure PStarUMLApplication.SaveAllUnits;
begin
  ProjectManager.SaveAllUnits;
end;

procedure PStarUMLApplication.UpdateDocuments;
begin
  ProjectManager.UpdateDocuments;
end;

procedure PStarUMLApplication.ExportModelFragment(APackage: PUMLPackage; AFileName: string);
begin
  CheckFileName(AFileName);
  if APackage is PUMLProject then
    raise EImproperElement.Create(ERR_IMPROPER_ELEMENET);
  ProjectManager.ExportModelFragment(APackage, AFileName);
end;

procedure PStarUMLApplication.ImportModelFragment(AOwner: PUMLPackage; AFileName: string);
begin
  CheckReadOnly(AOwner);
  ProjectManager.ImportModelFragment(AOwner, AFileName);
  ElementModified(AOwner);
end;

procedure PStarUMLApplication.ImportFramework(AOwner: PUMLPackage; FrameworkName: string);
begin
  CheckReadOnly(AOwner);
  ProjectManager.ImportFramework(AOwner, FrameworkName);
  ElementModified(AOwner);
end;

procedure PStarUMLApplication.IncludeProfile(ProfileName: string);
begin
  CheckReadOnly(Project);
  ProjectManager.IncludeProfile(ProfileName);
  ElementModified(Project);
end;

procedure PStarUMLApplication.ExcludeProfile(ProfileName: string);
begin
  CheckReadOnly(Project);
  ProjectManager.ExcludeProfile(ProfileName);
  CommandExecutor.ClearHistory;
  ElementModified(Project);
end;

procedure PStarUMLApplication.ClearHistory;
begin
  CommandExecutor.ClearHistory;
end;

procedure PStarUMLApplication.Undo;
var
  IsGroup: Boolean;
begin
  if CommandExecutor.ToUndoIsGroup then IsGroup := True else IsGroup := False;
  SelectionManager.DeselectAll;
  if IsGroup then BeginUpdate;
  CommandExecutor.Undo;
  if IsGroup then EndUpdate(False, False);
end;

procedure PStarUMLApplication.Redo;
var
  IsGroup: Boolean;
begin
  if CommandExecutor.ToRedoIsGroup then IsGroup := True else IsGroup := False;
  SelectionManager.DeselectAll;
  if IsGroup then BeginUpdate;
  CommandExecutor.Redo;
  if IsGroup then EndUpdate(False, False);
end;

function PStarUMLApplication.Copy: Boolean;
var
  AModel: PModel;
begin
  Result := False;


  // (1) in case of copying view element
  // if ModelExplorer is active prefer copying a model
  if (SelectedViewCount > 0) and not MainForm.IsModelExplorerActive then
  begin
    if (ActiveDiagram <> nil) and (ActiveDiagram.SelectedViewCount > 0) then
      // write view data to clipboard
      if ClipboardManager.SetViewsData(ActiveDiagram, True) then Result := True;
  end
  // (2) in case of copying model element
  else if SelectedModelCount > 0 then
  begin
    if SelectedModelCount = 1 then
    begin
      AModel := SelectedModels[0];
      // write Model Data to Clipboard
      if ClipboardManager.SetModelData(AModel) then
        Result := True;
    end
    else
      ShowMessage(ERR_MODEL_COPY_EXCEEDED);
  end;
end;

function PStarUMLApplication.Cut: Boolean;
begin
  Result := Copy;
  if Result then begin
    if MainForm.IsModelExplorerActive then
      DeleteSelectedModels
    else
      if (SelectedViewCount > 0) then
        DeleteSelectedViews;

  end;
end;

procedure PStarUMLApplication.CopyDiagram(ADiagramView: PDiagramView);
begin
  if (ADiagramView <> nil) and (ADiagramView.OwnedViewCount > 0) then
    ClipboardManager.SetViewsData(ADiagramView, False);
end;

procedure PStarUMLApplication.CopyDiagramAsBitmap(ADiagramView: PDiagramView);
begin
  if (ADiagramView <> nil) and (ADiagramView.OwnedViewCount > 0) then
    ClipboardManager.CopyDiagramAsBitmap(ADiagramView, False);
end;

procedure PStarUMLApplication.CopyActiveDiagram;
begin
  if (ActiveDiagram <> nil) and (ActiveDiagram.OwnedViewCount > 0) then begin
    if ClipboardManager.SetViewsData(ActiveDiagram, False) then SelectAll;
  end;
end;

procedure PStarUMLApplication.CopyActiveDiagramAsBitmap;
begin
  if (ActiveDiagram <> nil) and (ActiveDiagram.OwnedViewCount > 0) then
    ClipboardManager.CopyDiagramAsBitmap(ActiveDiagram, False);
end;

procedure PStarUMLApplication.Paste;
var
  ClipbrdDataKind: PClipboardDataKind;
  Views: PViewOrderedSet;
  AnOwnerDiagram: PDiagramView;
  AModel, AnOwnerModel: PModel;
begin
  ClipbrdDataKind := ClipboardManager.ClipboardDataKind;
  if ClipbrdDataKind = ckView then begin
    if ActiveDiagram <> nil then begin
      AnOwnerDiagram := ActiveDiagram;
      Views := ClipboardManager.GetViewsData;
      if (Views <> nil) and (Views.Count > 0) then
        NewViewsByCopyPaste(Views, AnOwnerDiagram);
      Views.Free;
    end;
  end else if ClipbrdDataKind = ckModel then begin
    if SelectedModelCount = 1 then begin
      AnOwnerModel := SelectedModels[0];
      AModel := ClipboardManager.GetModelData;
      if AModel <> nil then
        NewModelByCopyPaste(AModel, AnOwnerModel);
    end else MessageDlg(ERR_MODEL_PASTE_EXCEEDED, mtError, [mbOK], 0);
  end;
end;

procedure PStarUMLApplication.PasteFormat;
var
  ClipbrdDataKind: PClipboardDataKind;
  Views: PViewOrderedSet;
begin
  Views := ClipboardManager.GetViewsData;
  if Assigned(Views) and (Views.Count > 0) then
    ChangeSelectedViewsFormat(Views[0]);
  Views.Free;
end;

function PStarUMLApplication.CanUndo: Boolean;
begin
  Result := CommandExecutor.CanUndo;
end;

function PStarUMLApplication.CanRedo: Boolean;
begin
  Result := CommandExecutor.CanRedo;
end;

function PStarUMLApplication.GetUndoName: string;
begin
  Result := CommandExecutor.GetUndoName;
end;

function PStarUMLApplication.GetRedoName: string;
begin
  Result := CommandExecutor.GetRedoName;
end;

procedure PStarUMLApplication.NotifyWMDrawClipboard(var Msg: TMessage);
begin
  ClipboardManager.WMDrawClipboardHandler(Msg);
end;

procedure PStarUMLApplication.NotifyWMChangeCBChain(var Msg: TMessage);
begin
  ClipboardManager.WMChangeCBChainHandler(Msg);
end;

function PStarUMLApplication.NewModel(Owner: PModel; ModelKind: string;
  Argument: Integer = 0; End1: PModel = nil; End2: PModel = nil;
  InsertIndex: Integer = -1; AuxArg: PModel = nil): PModel;
var
  M: PModel;
begin
  CheckReadOnly(Owner);
  M := CommandExecutor.NewModel(Owner, ModelKind, Argument, End1, End2, InsertIndex, AuxArg);
  SelectModelInExplorer(M);
  ElementModified(Owner);
  ElementModified(End1);
  ElementModified(End2);
  Result := M;
end;

function PStarUMLApplication.NewExtendedModel(Owner: PModel; Profile: string;
  ModelPrototype: string; End1: PModel = nil; End2: PModel = nil;
  InsertIndex: Integer = -1; AuxArg: PModel = nil): PModel;
var
  M: PModel;
begin
  CheckReadOnly(Owner);
  M := CommandExecutor.NewExtendedModel(Owner, Profile, ModelPrototype, End1, End2, InsertIndex, AuxArg);
  SelectModelInExplorer(M);
  ElementModified(Owner);
  ElementModified(End1);
  ElementModified(End2);
  Result := M;
end;

function PStarUMLApplication.NewModelWithName(Owner: PModel; ModelKind: string; Name: string = ''): PModel;
var
  M: PModel;
begin
  CheckReadOnly(Owner);
  M := CommandExecutor.NewModelWithName(Owner, ModelKind, Name);
  SelectModelInExplorer(M);
  ElementModified(Owner);
  Result := M;
end;

function PStarUMLApplication.NewView(DiagramView: PDiagramView; Model: PModel;
  ViewKind: string = ''; End1: PView = nil; End2: PView = nil): PView;
var
  V: PView;
begin
  CheckReadOnly(DiagramView);
  V := CommandExecutor.NewView(DiagramView, Model, ViewKind, End1, End2);
  ElementModified(DiagramView);
  ElementModified(Model);
  Result := V;
end;

function PStarUMLApplication.NewView(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
  Model: PModel; ViewKind: string = ''): PView;
var
  V: PView;
begin
  CheckReadOnly(DiagramView);
  V := CommandExecutor.NewView(DiagramView, X1, Y1, X2, Y2, Model, ViewKind);
  ElementModified(DiagramView);
  ElementModified(Model);
  Result := V;
end;

function PStarUMLApplication.NewDiagram(Owner: PModel; DiagramKind: string; AllowBrowseDiagram: Boolean = True): PDiagram;
var
  D: PDiagram;
begin
  CheckReadOnly(Owner);
  D := CommandExecutor.NewDiagram(Owner, DiagramKind);
  SelectModelInExplorer(D);
  if AllowBrowseDiagram then BrowseDiagram(D);
  ElementModified(Owner);
  Result := D;
end;

function PStarUMLApplication.NewExtendedDiagram(Owner: PModel; Profile: string; DiagramType: string; AllowBrowseDiagram: Boolean = True): PDiagram;
var
  D: PDiagram;
begin
  CheckReadOnly(Owner);
  D := CommandExecutor.NewExtendedDiagram(Owner, Profile, DiagramType);
  SelectModelInExplorer(D);
  if AllowBrowseDiagram then BrowseDiagram(D);
  ElementModified(Owner);
  Result := D;
end;

function PStarUMLApplication.NewElement(DiagramView: PDiagramView; ElementKind: string;
  Argument: Integer = 0; End1: PView = nil; End2: PView = nil): PView;
var
  V: PView;
begin
  CheckReadOnly(DiagramView);
  V := CommandExecutor.NewElement(DiagramView, ElementKind, Argument, End1, End2);
  ElementModified(DiagramView);
  if V <> nil then begin
    if V.Model <> nil then SelectModelInExplorer(V.Model);
    ElementModified(V.Model);
    if V.Model <> nil then ElementModified(V.Model.VirtualNamespace);
  end;
  if End1 <> nil then ElementModified(End1.Model);
  if End2 <> nil then ElementModified(End2.Model);
  Result := V;
end;

function PStarUMLApplication.NewElement(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
  ElementKind: string; Argument: Integer = 0): PView;
var
  V: PView;
begin
  CheckReadOnly(DiagramView);
  V := CommandExecutor.NewElement(DiagramView, X1, Y1, X2, Y2, ElementKind, Argument);
  ElementModified(DiagramView);
  if V <> nil then begin
    if V.Model <> nil then SelectModelInExplorer(V.Model);
    ElementModified(V.Model);
    if V.Model <> nil then ElementModified(V.Model.VirtualNamespace);
  end;
  if V is PEdgeView then begin
    if (V as PEdgeView).Head <> nil then
      ElementModified((V as PEdgeView).Head.Model);
    if (V as PEdgeView).Tail <> nil then
      ElementModified((V as PEdgeView).Tail.Model);
  end;
  Result := V;
end;

function PStarUMLApplication.NewExtendedElement(DiagramView: PDiagramView;
  Profile, ElementPrototype: string; End1: PView = nil; End2: PView = nil): PView;
var
  V: PView;
begin
  CheckReadOnly(DiagramView);
  V := CommandExecutor.NewExtendedElement(DiagramView, Profile, ElementPrototype, End1, End2);
  ElementModified(DiagramView);
  if V <> nil then begin
    if V.Model <> nil then SelectModelInExplorer(V.Model);
    ElementModified(V.Model);
    if V.Model <> nil then ElementModified(V.Model.VirtualNamespace);
  end;
  if End1 <> nil then ElementModified(End1.Model);
  if End2 <> nil then ElementModified(End2.Model);
  Result := V;
end;

function PStarUMLApplication.NewExtendedElement(DiagramView: PDiagramView;
  X1, Y1, X2, Y2: Integer; Profile, ElementPrototype: string): PView;
var
  V: PView;
begin
  CheckReadOnly(DiagramView);
  V := CommandExecutor.NewExtendedElement(DiagramView, X1, Y1, X2, Y2, Profile, ElementPrototype);
  ElementModified(DiagramView);
  if V <> nil then begin
    if V.Model <> nil then SelectModelInExplorer(V.Model);
    ElementModified(V.Model);
    if V.Model <> nil then ElementModified(V.Model.VirtualNamespace);
  end;
  if V is PEdgeView then begin
    if (V as PEdgeView).Head <> nil then
      ElementModified((V as PEdgeView).Head.Model);
    if (V as PEdgeView).Tail <> nil then
      ElementModified((V as PEdgeView).Tail.Model);
  end;
  Result := V;
end;

function PStarUMLApplication.NewViewByDragDrop(DiagramView: PDiagramView;
  Model: PModel; X, Y: Integer): PView;
var
  V: PView;
begin
  CheckReadOnly(DiagramView);
  V := CommandExecutor.NewViewByDragDrop(DiagramView, Model, X, Y);
  ElementModified(DiagramView);
  MainForm.ActivateWorkingAreaPanel;
  if V <> nil then ElementModified(V.Model);
  if Model <> nil then
    SelectionManager.SelectModel(Model);
  Result := V;
end;

procedure PStarUMLApplication.NewModelByCopyPaste(AModel, Target: PModel);
begin
  CheckReadOnly(Target);
  CommandExecutor.NewModelByCopyPaste(AModel, Target);
  if AModel <> nil then
    SelectModelInExplorer(AModel);
  ElementModified(AModel);
  ElementModified(Target);
end;

procedure PStarUMLApplication.NewViewsByCopyPaste(Views: PViewOrderedSet; Target: PDiagramView);
var
  NewViews: PViewOrderedSet;
begin
  CheckReadOnly(Target);
  NewViews := CommandExecutor.NewViewsByCopyPaste(Views, Target);
  if NewViews <> nil then begin
    ElementModified(Target);
    SelectionManager.SelectMultipleViews(NewViews);
  end;
end;

procedure PStarUMLApplication.DeleteModel(Model: PModel);
var
  Owners: PModelOrderedSet;
  DiagramViews: PViewOrderedSet;
begin
  // Preprocessing
  SelectionManager.DeselectModel(Model);
  ModelSet.Clear;
  ViewSet.Clear;
  ModelSet.Add(Model);
  DetermineDeletingElements(ModelSet, ViewSet);
  Owners := PModelOrderedSet.Create;
  DiagramViews := PViewOrderedSet.Create;
  try
    CollectOwners(ModelSet, Owners);
    CollectDiagramViews(ViewSet, DiagramViews);
    CheckReadOnly(ModelSet);
    CheckReadOnly(Owners);
    // Command execution
    if CheckDeleteUnits(ModelSet) then
    begin
      if (ModelSet.Count + ViewSet.Count) > 0 then
      begin
        CommandExecutor.DeleteElements(ModelSet, ViewSet);
        // Postprocessing
        ElementModified(Owners);
        ElementModified(DiagramViews);
      end;
    end;
  finally
    Owners.Free;
    DiagramViews.Free;
  end;
end;

procedure PStarUMLApplication.DeleteView(View: PView);
var
  DiagramViews: PViewOrderedSet;
begin
  // Preprocessing
  View.Selected := False;
  ModelSet.Clear;
  ViewSet.Clear;
  ViewSet.Add(View);
  CheckUndeletableViews(ViewSet);
  DetermineDeletingElements(ModelSet, ViewSet);
  DiagramViews := PViewOrderedSet.Create;
  try
    CollectDiagramViews(ViewSet, DiagramViews);
    CheckReadOnly(ViewSet);
    CheckReadOnly(DiagramViews);
    // Command execution
    if (ModelSet.Count + ViewSet.Count) > 0 then
    begin
      CommandExecutor.DeleteElements(ModelSet, ViewSet);
      // Postprocessing
      ElementModified(DiagramViews);
    end;
  finally
    DiagramViews.Free;
  end;
end;

procedure PStarUMLApplication.DeleteSelectedModels;
var
  Owners: PModelOrderedSet;
  DiagramViews: PViewOrderedSet;
begin
  // Preprocessing
  ModelSet.Clear;
  ViewSet.Clear;
  SelectionManager.CollectSelectedModels(ModelSet);
  SelectionManager.DeselectAllModels;
  DetermineDeletingElements(ModelSet, ViewSet);
  Owners := PModelOrderedSet.Create;
  DiagramViews := PViewOrderedSet.Create;
  try
    CollectOwners(ModelSet, Owners);
    CollectDiagramViews(ViewSet, DiagramViews);
    CheckReadOnly(ModelSet);
    CheckReadOnly(Owners);
    // Command execution
    if CheckDeleteUnits(ModelSet) then
    begin
      if (ModelSet.Count + ViewSet.Count) > 0 then
      begin
        CommandExecutor.DeleteElements(ModelSet, ViewSet);
        // Postprocessing
        ElementModified(Owners);
        ElementModified(DiagramViews);
      end;
    end;
  finally
    Owners.Free;
    DiagramViews.Free;
  end;
end;

procedure PStarUMLApplication.DeleteSelectedViews;
var
  DiagramViews: PViewOrderedSet;
begin
  // Preprocessing
  ModelSet.Clear;
  ViewSet.Clear;
  SelectionManager.CollectSelectedViews(ViewSet);
  SelectionManager.DeselectAllViews;
  CheckUndeletableViews(ViewSet);
  DetermineDeletingElements(ModelSet, ViewSet);
  DiagramViews := PViewOrderedSet.Create;
  try
    CollectDiagramViews(ViewSet, DiagramViews);
    CheckReadOnly(ViewSet);
    CheckReadOnly(DiagramViews);
    // Command execution
    if (ModelSet.Count + ViewSet.Count) > 0 then
    begin
      CommandExecutor.DeleteElements(ModelSet, ViewSet);
      // Postprocessing
      ElementModified(DiagramViews);
    end;
  finally
    DiagramViews.Free;
  end;
  SelectArea(1,1,1,1); // JS Select workspace after deleting elements
end;

procedure PStarUMLApplication.DeleteSelectedViewsWithModels;
var
  Owners: PModelOrderedSet;
  DiagramViews: PViewOrderedSet;
begin
  // Preprocessing
  ModelSet.Clear;
  ViewSet.Clear;
  SelectionManager.CollectSelectedModels(ModelSet);
  SelectionManager.CollectSelectedViews(ViewSet);
  SelectionManager.DeselectAll;
  CheckUndeletableViews(ViewSet);
  DetermineDeletingElements(ModelSet, ViewSet);
  Owners := PModelOrderedSet.Create;
  DiagramViews := PViewOrderedSet.Create;
  try
    CollectOwners(ModelSet, Owners);
    CollectDiagramViews(ViewSet, DiagramViews);
    CheckReadOnly(ViewSet);
    CheckReadOnly(ModelSet);
    CheckReadOnly(Owners);
    CheckReadOnly(DiagramViews);
    // Command execution
    if CheckDeleteUnits(ModelSet) then
    begin
      if (ModelSet.Count + ViewSet.Count) > 0 then
      begin
        CommandExecutor.DeleteElements(ModelSet, ViewSet);
        // Postprocessing
        ElementModified(Owners);
        ElementModified(DiagramViews);
      end;
    end;
  finally
    Owners.Free;
    DiagramViews.Free;
  end;
  SelectArea(1,1,1,1); // JS: Select workspace after deleting elements
end;

procedure PStarUMLApplication.SelectModel(AModel: PModel; AContextMenuLaunched: Boolean = False);
begin
  //BeginGrouping;
  SelectionManager.SelectModel(AModel,AContextMenuLaunched);
  //EndGrouping;
end;

procedure PStarUMLApplication.DeselectModel(AModel: PModel);
begin
  SelectionManager.DeselectModel(AModel);
end;

procedure PStarUMLApplication.DeselectModels(Models: PModelOrderedSet);
begin
  SelectionManager.DeselectModels(Models);
end;

procedure PStarUMLApplication.SelectView(AView: PView);
begin
  SelectionManager.SelectView(AView);
end;

procedure PStarUMLApplication.DeselectView(AView: PView);
begin
  SelectionManager.DeselectView(AView);
end;

procedure PStarUMLApplication.DeselectViews(Views: PViewOrderedSet);
begin
  SelectionManager.DeselectViews(Views);
end;

procedure PStarUMLApplication.SelectArea(X1, Y1, X2, Y2: Integer);
begin
  SelectionManager.SelectArea(X1, Y1, X2, Y2);
end;

procedure PStarUMLApplication.SelectAdditionalView(AView: PView);
begin
  SelectionManager.SelectAdditionalView(AView);
end;

procedure PStarUMLApplication.SelectAdditionalArea(X1, Y1, X2, Y2: Integer);
begin
  SelectionManager.SelectAdditionalArea(X1, Y1, X2, Y2);
end;

procedure PStarUMLApplication.SelectAdditionalModel(AModel: PModel);
begin
  SelectionManager.SelectAdditionalModel(AModel);
end;

procedure PStarUMLApplication.SelectAll;
begin
  SelectionManager.SelectAll;
end;

procedure PStarUMLApplication.DeselectAllViews;
begin
  SelectionManager.DeselectAllViews;
end;

procedure PStarUMLApplication.DeselectAllModels;
begin
  SelectionManager.DeselectAllModels;
end;

procedure PStarUMLApplication.DeselectModelsViews(Models: PModelOrderedSet; Views: PViewOrderedSet);
begin
  SelectionManager.DeselectModelsViews(Models, Views);
end;

procedure PStarUMLApplication.DeselectAll;
begin
  SelectionManager.DeselectAll;
end;

procedure PStarUMLApplication.CollectSelectedModels(Models: PModelOrderedSet);
begin
  SelectionManager.CollectSelectedModels(Models);
end;

procedure PStarUMLApplication.CollectSelectedViews(Views: PViewOrderedSet);
begin
  SelectionManager.CollectSelectedViews(Views);
end;

procedure PStarUMLApplication.ChangeViewAttribute(AView: PView; Key: string; Value: string);
begin
  ViewSet.Clear;
  ViewSet.Add(AView);
  if DifferentAttributeExists(ViewSet, Key, Value) then
  begin
    CheckReadOnly(AView);
    CommandExecutor.ChangeViewsAttribute(ViewSet, Key, Value);
    ElementModified(AView);
  end;
end;

procedure PStarUMLApplication.MoveView(AView: PView; DX, DY: Integer);
begin
  ViewSet.Clear;
  ViewSet.Add(AView);
  CheckReadOnly(AView);
  CommandExecutor.MoveViews(SelectionManager.ActiveDiagram, ViewSet, DX, DY);
  ElementModified(AView);
end;

procedure PStarUMLApplication.MoveViewChangingContainerView(AView: PView; DX, DY: Integer; AContainerView: PView = nil);
begin
  ViewSet.Clear;
  ViewSet.Add(AView);
  CheckReadOnly(AView);
  if AView.Model <> nil then CheckReadOnly(AView.Model);
  if AContainerView <> nil then
  begin
    CheckReadOnly(AContainerView);
    if AContainerView.Model <> nil then CheckReadOnly(AContainerView.Model);
  end;
  CommandExecutor.MoveViewsChangeContainer(SelectionManager.ActiveDiagram, ViewSet, DX, DY, AContainerView);
  ElementModified(AView);
  ElementModified(AView.Model);
  if AContainerView <> nil then
  begin
    ElementModified(AContainerView);
    ElementModified(AContainerView.Model);
  end;
end;

procedure PStarUMLApplication.MoveSelectedViews(DX, DY: Integer);
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViews(ViewSet);
  CheckReadOnly(ViewSet);
  CheckUnmovableViews(ViewSet);
  CommandExecutor.MoveViews(SelectionManager.ActiveDiagram, ViewSet, DX, DY);
  ElementModified(ViewSet);
end;

procedure PStarUMLApplication.MoveSelectedViewsChaningContainerView(DX, DY: Integer; AContainerView: PView = nil);
begin
  ViewSet.Clear;
  ModelSet.Clear;
  SelectionManager.CollectSelectedViews(ViewSet);
  CollectModelsOfViews(ViewSet, ModelSet);
  CheckReadOnly(ViewSet);
  CheckReadOnly(ModelSet);
  if AContainerView <> nil then
  begin
    CheckReadOnly(AContainerView);
    if AContainerView.Model <> nil then CheckReadOnly(AContainerView.Model);
  end;
  CheckUnmovableViews(ViewSet);
  CommandExecutor.MoveViewsChangeContainer(SelectionManager.ActiveDiagram, ViewSet, DX, DY, AContainerView);
  ElementModified(ViewSet);
  ElementModified(ModelSet);
  if AContainerView <> nil then
  begin
    ElementModified(AContainerView);
    ElementModified(AContainerView.Model);
  end;
end;

procedure PStarUMLApplication.MoveParasiticView(AParasiticView: PParasiticView; Alpha, Distance: Extended);
begin
  CheckReadOnly(AParasiticView);
  CommandExecutor.MoveParasiticView(AParasiticView, Alpha, Distance);
  ElementModified(AParasiticView);
end;

procedure PStarUMLApplication.ResizeNode(ANode: PNodeView; Left, Top, Right, Bottom: Integer);
begin
  CheckReadOnly(ANode);
  if ANode is PUMLInteractionOperandView then
    CommandExecutor.ResizeFragmentedNode(ANode, Rect(Left, Top, Right, Bottom))
  else
    CommandExecutor.ResizeNode(ANode, Rect(Left, Top, Right, Bottom));
  ElementModified(ANode);
end;

procedure PStarUMLApplication.ReshapeEdge(AEdge: IModifiableEdge; Points: PPoints);
begin
  CheckReadOnly(AEdge as PView);
  CommandExecutor.ReshapeEdge(AEdge, Points);
  ElementModified(AEdge as PElement);
end;

procedure PStarUMLApplication.ReconnectEdge(AEdge: PEdgeView; Points: PPoints; NewParicipant: PView; IsTailSide: Boolean);
begin
  CheckReadOnly(AEdge);
  CommandExecutor.ReconnectEdge(AEdge, Points, NewParicipant, IsTailSide);
  ElementModified(AEdge);
end;

procedure PStarUMLApplication.ChangeSelectedViewsLineColor(LineColor: TColor);
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViews(ViewSet);
  if DifferentAttributeExists(ViewSet, 'LineColor', ColorToString(LineColor)) then
  begin
    CheckReadOnly(ViewSet);
    CommandExecutor.ChangeViewsLineColor(ViewSet, LineColor);
    ElementModified(ViewSet);
  end;
end;

procedure PStarUMLApplication.ChangeSelectedViewsFillColor(FillColor: TColor);
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViews(ViewSet);
  if DifferentAttributeExists(ViewSet, 'FillColor', ColorToString(FillColor)) then
  begin
    CheckReadOnly(ViewSet);
    CommandExecutor.ChangeViewsFillColor(ViewSet, FillColor);
    ElementModified(ViewSet);
  end;
end;

procedure PStarUMLApplication.ChangeSelectedViewsFont(Font: TFont; AChangedFontItems: PFontItemKinds);
const
  FontItemKinds: PFontItemKinds = [fiName, fiSize, fiStyle, fiEffect, fiColor];
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViews(ViewSet);
  CheckReadOnly(ViewSet);
  CommandExecutor.ChangeViewsFont(ViewSet, Font, AChangedFontItems);
  ElementModified(ViewSet);
end;

procedure PStarUMLApplication.ChangeSelectedViewsFontFace(FontFace: string);
var
  AFont: TFont;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViews(ViewSet);
  if DifferentAttributeExists(ViewSet, 'FontFace', FontFace) then
  begin
    CheckReadOnly(ViewSet);
    AFont := TFont.Create;
    AFont.Name := FontFace;
    CommandExecutor.ChangeViewsFont(ViewSet, AFont, [fiName]);
    AFont.Free;
    ElementModified(ViewSet);
  end;
end;

procedure PStarUMLApplication.ChangeSelectedViewsFontSize(FontSize: Integer);
var
  AFont: TFont;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViews(ViewSet);
  if DifferentAttributeExists(ViewSet, 'FontSize', IntegerToString(FontSize)) then
  begin
    CheckReadOnly(ViewSet);
    AFont := TFont.Create;
    AFont.Size := FontSize;
    CommandExecutor.ChangeViewsFont(ViewSet, AFont, [fiSize]);
    AFont.Free;
    ElementModified(ViewSet);
  end;
end;

procedure PStarUMLApplication.ChangeSelectedViewsFormat(FormatSource: PView);
const
  FontItemKinds: PFontItemKinds = [fiName, fiSize, fiStyle, fiEffect, fiColor];
var
  Font: TFont;
begin
  ChangeSelectedViewsLineColor(FormatSource.LineColor);
  ChangeSelectedViewsFillColor(FormatSource.FillColor);

  Font := TFont.Create;
  Font.Name := FormatSource.FontFace;
  Font.Size := FormatSource.FontSize;
  Font.Style := FormatSource.FontStyle;
  Font.Color := FormatSource.FontColor;
  ChangeSelectedViewsFont(Font,FontItemKinds);
  Font.Free;

  if FormatSource is PEdgeView then
    ChangeSelectedEdgesLineStyle((FormatSource as PEdgeView).LineStyle);
  if FormatSource is PShapeView then
    ChangeSelectedAnnotationsLineStyle((FormatSource as PShapeView).LineKind);
end;

procedure PStarUMLApplication.ChangeSelectedEdgesLineStyle(LineStyle: PLineStyleKind);
var
  I: Integer;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViews(ViewSet);
  // Filter views that is not decendent of PEdgeView.
  for I := ViewSet.Count - 1 downto 0 do begin
    if not (ViewSet[I] is PEdgeView) then
      ViewSet.Remove(ViewSet[I]);
  end;
  if DifferentAttributeExists(ViewSet, 'LineStyle', LineStyleKindToString(LineStyle)) then
  begin
    CheckReadOnly(ViewSet);
    CommandExecutor.ChangeEdgesLineStyle(ViewSet, LineStyle);
    ElementModified(ViewSet);
  end;
end;

procedure PStarUMLApplication.ChangeSelectedAnnotationsLineStyle(LineStyle: PLineKind);
var
  I: Integer;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViews(ViewSet);
  // Filter views that is not decendent of PEdgeView.
  for I := ViewSet.Count - 1 downto 0 do begin
    if not (ViewSet[I] is PShapeView) then
      ViewSet.Remove(ViewSet[I]);
  end;

  CheckReadOnly(ViewSet);
  CommandExecutor.ChangeAnnotationLineStyle(ViewSet, LineStyle);
  ElementModified(ViewSet);

end;

procedure PStarUMLApplication.ChangeSelectedViewsAttribute(Key: string; Value: string);
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViews(ViewSet);
  if DifferentAttributeExists(ViewSet, Key, Value) then
  begin
    CheckReadOnly(ViewSet);
    CommandExecutor.ChangeViewsAttribute(ViewSet, Key, Value);
    ElementModified(ViewSet);
  end;
end;

procedure PStarUMLApplication.ChangeNoteViewStrings(AView: PUMLCustomTextView; Strs: string);
begin
  ViewSet.Clear;
  ViewSet.Add(AView);
  if Strs = '' then begin
    // DeleteView(AView);
  end
  else if AdjustLineBreaks(AView.Text, tlbsLF) <> AdjustLineBreaks(Strs, tlbsLF) then begin
    CheckReadOnly(AView);
    CommandExecutor.ChangeNoteViewStrings(ViewSet, Strs);
    ElementModified(AView);
  end;
end;

procedure PStarUMLApplication.SendToBackSelectedViews;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViews(ViewSet);
  CheckReadOnly(ViewSet);
  CommandExecutor.SendToBackViews(ViewSet);
  ElementModified(ViewSet);
end;

procedure PStarUMLApplication.BringToFrontSelectedViews;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViews(ViewSet);
  CheckReadOnly(ViewSet);
  CommandExecutor.BringToFrontViews(ViewSet);
  ElementModified(ViewSet);
end;

procedure PStarUMLApplication.AlignLeftSelectedViews;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViewsOfType(ViewSet, PNodeView);
  CheckReadOnly(ViewSet);
  CommandExecutor.AlignViews(ViewSet, akLeft);
  ElementModified(ViewSet);
end;

procedure PStarUMLApplication.AlignRightSelectedViews;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViewsOfType(ViewSet, PNodeView);
  CheckReadOnly(ViewSet);
  CommandExecutor.AlignViews(ViewSet, akRight);
  ElementModified(ViewSet);
end;

procedure PStarUMLApplication.AlignMiddleSelectedViews;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViewsOfType(ViewSet, PNodeView);
  CheckReadOnly(ViewSet);
  CommandExecutor.AlignViews(ViewSet, akMiddle);
  ElementModified(ViewSet);
end;

procedure PStarUMLApplication.AlignTopSelectedViews;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViewsOfType(ViewSet, PNodeView);
  CheckReadOnly(ViewSet);
  CommandExecutor.AlignViews(ViewSet, akTop);
  ElementModified(ViewSet);
end;

procedure PStarUMLApplication.AlignBottomSelectedViews;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViewsOfType(ViewSet, PNodeView);
  CheckReadOnly(ViewSet);
  CommandExecutor.AlignViews(ViewSet, akBottom);
  ElementModified(ViewSet);
end;

procedure PStarUMLApplication.AlignCenterSelectedViews;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViewsOfType(ViewSet, PNodeView);
  CheckReadOnly(ViewSet);
  CommandExecutor.AlignViews(ViewSet, akCenter);
  ElementModified(ViewSet);
end;

procedure PStarUMLApplication.AlignSpaceEvenlyHorizontallySelectedViews;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViewsOfType(ViewSet, PNodeView);
  CheckReadOnly(ViewSet);
  CommandExecutor.AlignViews(ViewSet, akSpaceEvenlyHorizontally);
  ElementModified(ViewSet);
end;

procedure PStarUMLApplication.AlignSpaceEvenlyVerticallySelectedViews;
begin
  ViewSet.Clear;
  SelectionManager.CollectSelectedViewsOfType(ViewSet, PNodeView);
  CheckReadOnly(ViewSet);
  CommandExecutor.AlignViews(ViewSet, akSpaceEvenlyVertically);
  ElementModified(ViewSet);
end;

procedure PStarUMLApplication.LayoutDiagram(ADiagramView: PDiagramView);
begin
  CheckReadOnly(ADiagramView);
  CommandExecutor.LayoutDiagram(ADiagramView);
  ElementModified(ADiagramView);
end;

procedure PStarUMLApplication.LayoutActiveDiagram;
begin
  LayoutDiagram(SelectionManager.ActiveDiagram);
end;

procedure PStarUMLApplication.LayoutActiveDiagramWithValidation;
begin
 if (ActiveDiagram is PUMLSequenceDiagramView) or
   (ActiveDiagram is PUMLSequenceRoleDiagramView)
   then
   MessageDlg(ERR_SEQ_DGM_CMD_NOT_SUPPORT, mtError, [mbOK], 0)
 else
 begin
   LayoutActiveDiagram;
   MainForm.WorkingAreaFrame.RedrawActiveDiagram;
 end;
end;

class function PStarUMLApplication.SaveDiagramImageToBitmap(ADiagramView: PDiagramView; FileName: string; ConvertedImage: TGraphic = nil): Boolean;
var
  ABitmap: Graphics.TBitmap;
begin
  Result := False;
  // Input data validation
  if not Assigned(ADiagramView) then Exit;
  if ADiagramView.OwnedViewCount <= 0 then Exit;
  if FileName = '' then Exit;

  ABitmap := BitmapFromDiagram(ADiagramView);
  if ABitmap = nil then
    ShowMessage(ERR_BITMAP_GEN_ERROR)
  else begin
    try
      // If conversion object is provided, save image converting its format
      if Assigned(ConvertedImage) then begin
        ConvertedImage.Assign(ABitmap);
        ConvertedImage.SaveToFile(FileName);
      end
      else // No conversion, plain bitmap
        ABitmap.SaveToFile(FileName);
      Result := True;
    finally
      ABitmap.Free;
    end;
  end;
end;

class function PStarUMLApplication.SaveDiagramImageToJPEG(ADiagramView: PDiagramView; FileName: string): Boolean;
var
  AJPEGImage: TJPEGImage;
begin
  AJPEGImage := nil;
  try
    AJPEGImage := TJPEGImage.Create;
    Result := SaveDiagramImageToBitmap(ADiagramView,FileName,AJPEGImage);
  finally
    AJPEGImage.Free;
  end;
end;

class function PStarUMLApplication.SaveDiagramImageToPNG(ADiagramView: PDiagramView; FileName: string): Boolean;
var
  APNGImage: TPngImage;
begin
  APNGImage := nil;
  try
    APNGImage := TPngImage.Create;
    Result := SaveDiagramImageToBitmap(ADiagramView,FileName,APNGImage);
  finally
    APNGImage.Free;
  end;
end;

class function PStarUMLApplication.SaveDiagramImageToMetafile(ADiagramView: PDiagramView;
    FileName: string; Enhanced: Boolean = False): Boolean;
var
  AMetafile: TMetafile;
begin
  Result := False;
  if not Assigned(ADiagramView) then Exit;
  if ADiagramView.OwnedViewCount <= 0 then Exit;
  if FileName = '' then Exit;
  AMetafile := MetafileFromDiagram(ADiagramView, False, Enhanced);
  try
    AMetafile.SaveToFile(FileName);
    Result := True;
  finally
    AMetafile.Free;
  end;
end;

procedure PStarUMLApplication.ChangeModelName(AModel: PModel; Name: string);
begin
  ModelSet.Clear;
  ModelSet.Add(AModel);
  if DifferentAttributeExists(ModelSet, 'Name', Name) then
  begin
    CheckNameConflict(AModel, Name);
    CheckNameValidity(Name);
    CheckReadOnly(AModel);
    CommandExecutor.ChangeModelsAttribute(ModelSet, 'Name', Name);
    ElementModified(AModel);
  end;
end;

procedure PStarUMLApplication.ChangeModelStereotype(AExtensibleModel: PExtensibleModel; Profile, Stereotype: string);
begin
  ModelSet.Clear;
  ModelSet.Add(AExtensibleModel);
  if DifferentAttributeExists(ModelSet, 'StereotypeName', Stereotype) or
     DifferentAttributeExists(ModelSet, 'StereotypeProfile', Profile) then
  begin
    CheckReadOnly(AExtensibleModel);
    CommandExecutor.ChangeModelsStereotype(ModelSet, Profile, Stereotype);
    ElementModified(AExtensibleModel);
  end;
end;

procedure PStarUMLApplication.ChangeModelAttribute(AModel: PModel; Key: string; Value: string);
begin
  ModelSet.Clear;
  ModelSet.Add(AModel);
  if DifferentAttributeExists(ModelSet, Key, Value) then
  begin
    CheckReadOnly(AModel);
    CommandExecutor.ChangeModelsAttribute(ModelSet, Key, Value);
    ElementModified(AModel);
  end;
end;

procedure PStarUMLApplication.ChangeModelReference(AModel: PModel; Key: string; Value: PModel);
begin
  ModelSet.Clear;
  ModelSet.Add(AModel);
  if AModel.MOF_GetReference(Key) <> Value then
  begin
    CheckReadOnly(AModel);
    // Changing reference that is connected to readonly element is not allowed.
    CommandExecutor.ChangeModelsReference(ModelSet, Key, Value);
    ElementModified(AModel);
  end;
end;

procedure PStarUMLApplication.ClearCollection(AElement: PModel; Key: string);
begin
  if AElement.MOF_GetCollectionCount(Key) > 0 then
  begin
    CheckReadOnly(AElement);
    // Collection that containing at least one readonly element cannot be cleared.
    ModelSet.Clear;
    CollectElements(AElement, Key, ModelSet);
    CheckReadOnly(ModelSet);
    CommandExecutor.ClearCollection(AElement, Key);
    ElementModified(AElement);
    ElementModified(ModelSet);
  end;
end;

procedure PStarUMLApplication.AddCollectionItem(AElement: PElement; Key: string; Value: PModel);
begin
  if AElement.MOF_IndexOfCollectionItem(Key, Value) < 0 then
  begin
    CheckReadOnly(AElement);
    CommandExecutor.AddCollectionItem(AElement, Key, Value);
    ElementModified(AElement);
    ElementModified(Value);
  end;
end;

procedure PStarUMLApplication.RemoveCollectionItem(AElement: PElement; Key: string; Value: PModel);
begin
  if AElement.MOF_IndexOfCollectionItem(Key, Value) > -1 then
  begin
    CheckReadOnly(AElement);
    // Readonly element cannot be removed from the collection that contains the element.
    CommandExecutor.RemoveCollectionItem(AElement, Key, Value);
    ElementModified(AElement);
    ElementModified(Value);
  end;
end;

procedure PStarUMLApplication.InsertCollectionItem(AElement: PElement; Key: string; Index: Integer; Value: PModel);
begin
  if AElement.MOF_IndexOfCollectionItem(Key, Value) <> Index then
  begin
    CheckReadOnly(AElement);
    CommandExecutor.InsertCollectionItem(AElement, Key, Index, Value);
    ElementModified(AElement);
    ElementModified(Value);
  end;
end;

procedure PStarUMLApplication.DeleteCollectionItem(AElement: PElement; Key: string; Index: Integer);
var
  E: PElement;
begin
  CheckReadOnly(AElement);
  E := AElement.MOF_GetCollectionItem(Key, Index);
  // Readonly element cannot be deleted from the collection.
  CommandExecutor.DeleteCollectionItem(AElement, Key, Index);
  ElementModified(AElement);
  if E <> nil then
    ElementModified(E);
end;

procedure PStarUMLApplication.ChangeCollectionItemOrder(AElement: PElement; ACollectionItem: PElement; Key: string; NewIndex: Integer);
begin
  if AElement.MOF_IndexOfCollectionItem(Key, ACollectionItem) <> NewIndex then
  begin
    CheckReadOnly(AElement);
    CheckReadOnly(ACollectionItem);
    CommandExecutor.ChangeCollectionItemOrder(AElement, ACollectionItem, Key, NewIndex);
    ElementModified(AElement);
    ElementModified(ACollectionItem);
  end;
end;

procedure PStarUMLApplication.ChangeTypeExpression(AModel: PModel; TypeExpr: string; TypeRef: PModel);
var
 CurrentTypeExpression: string;
 CurrentTypeReference: PElement;
begin
  CurrentTypeExpression := AModel.MOF_GetAttribute('TypeExpression');
  CurrentTypeReference := AModel.MOF_GetReference('Type_');
  //if (AModel.MOF_GetAttribute('TypeExpression') <> TypeExpr) or
  //   (AModel.MOF_GetReference('Type_') <> TypeRef) then
  if (CurrentTypeExpression <> TypeExpr)
    or (CurrentTypeReference <> TypeRef) then
  begin
    CheckReadOnly(AModel);
    CommandExecutor.ChangeTypeExpression(AModel, TypeExpr, TypeRef);
    ElementModified(AModel);
  end;
end;

procedure PStarUMLApplication.ChangeValueExpression(AModel: PModel; ValueExpr: string; ValueRef: PModel);
begin
  if (AModel.MOF_GetAttribute('ValueExpression') <> ValueExpr) or
     (AModel.MOF_GetReference('Value') <> ValueRef) then
  begin
    CheckReadOnly(AModel);
    CommandExecutor.ChangeValueExpression(AModel, ValueExpr, ValueRef);
    ElementModified(AModel);
  end;
end;

procedure PStarUMLApplication.ChangeActionKind(AModel: PModel; ActionKind: string);

  function ActionToString(M: PModel): string;
  begin
    if M is PUMLCallAction then
      Result := 'CALL'
    else if M is PUMLSendAction then
      Result := 'SEND'
    else if M is PUMLReturnAction then
      Result := 'RETURN'
    else if M is PUMLCreateAction then
      Result := 'CREATE'
    else if M is PUMLDestroyAction then
      Result := 'DESTROY'
    else
      Result := 'CALL';
  end;

begin
  if ActionToString(AModel.MOF_GetReference('Action') as PModel) <> ActionKind then
  begin
    CheckReadOnly(AModel);
    CommandExecutor.ChangeActionKind(AModel, ActionKind);
    ElementModified(AModel);
  end;
end;

procedure PStarUMLApplication.ChangeSelectedModelsAttribute(Key: string; Value: string);
begin
  ModelSet.Clear;
  SelectionManager.CollectSelectedModels(ModelSet);
  if DifferentAttributeExists(ModelSet, Key, Value) then
  begin
    CheckReadOnly(ModelSet);
    CommandExecutor.ChangeModelsAttribute(ModelSet, Key, Value);
    ElementModified(ModelSet);
  end;
end;

procedure PStarUMLApplication.ChangeSelectedModelsStereotype(StereotypeProfile: string; Stereotype: string);
begin
  ModelSet.Clear;
  SelectionManager.CollectSelectedModels(ModelSet);
  if DifferentAttributeExists(ModelSet, 'StereotypeName', Stereotype) or
     DifferentAttributeExists(ModelSet, 'StereotypeProfile', StereotypeProfile) then
  begin
    CheckReadOnly(ModelSet);
    CommandExecutor.ChangeModelsStereotype(ModelSet, StereotypeProfile, Stereotype);
    ElementModified(ModelSet);
  end;
end;

procedure PStarUMLApplication.ChangeDocumentation(Model: PModel; Documentation: string);
begin
  if AdjustLineBreaks(Model.Documentation, tlbsLF) <> AdjustLineBreaks(Documentation, tlbsLF) then
  begin
    CheckReadOnly(Model);
    CommandExecutor.ChangeDocumentation(Model, Documentation);
    ElementModified(Model);
  end;
end;

procedure PStarUMLApplication.RelocateModel(AModel, Target: PModel);
var
  SourceOwner: PModel;
begin
  SourceOwner := AModel.VirtualNamespace;
  if SourceOwner <> Target then
  begin
    CheckReadOnly(AModel);
    CheckReadOnly(Target);
    ModelSet.Clear;
    ModelSet.Add(AModel);
    CommandExecutor.RelocateModels(ModelSet, Target);
    SelectModelInExplorer(AModel);
    ElementModified(SourceOwner);
    ElementModified(AModel);
    ElementModified(Target);
  end;
end;

procedure PStarUMLApplication.FindDiagramsWithSelectedModel;
var
  SelectedModel: PModel;
  FoundDiagrams: PDiagramList;
  Diagram: PDiagram;
begin
  if (SelectedModelCount = 0) then
    Exit; // Abort if no model selected

  // Init data
  SelectedModel := SelectedModels[0];
  FoundDiagrams := PDiagramList.Create; // List of found diagrams initially empty
  // Select diagrams
  SelectDiagrams(SelectedModel, FoundDiagrams);

  // Show results in Message Panel
  MainForm.MessagePanel.ClearAllMessages;
  for Diagram in FoundDiagrams do
    MainForm.MessagePanel.AddMessage(mkFindResult, Diagram.Pathname, Diagram);

  // Show notification message
  ShowDiagramSearchFinishedNotification(FoundDiagrams.Count, SelectedModel.Name);

  // Clean data
  FoundDiagrams.Free;

end;

class procedure PStarUMLApplication.SelectDiagrams(SelectedModel: PModel; SelectedDiagrams: PDiagramList);
var
  View: PView;
  OwnerDiagramView: PDiagramView;
  OwnerDiagramModel: PDiagram;
begin

  // Select diagrams with model
  for View in SelectedModel.Views do begin // Look for diagrams containing views of given model
    if View.MetaClass.IsKindOf('UMLGeneralNodeView')
      or View.MetaClass.IsKindOf('EdgeView') then begin
      OwnerDiagramView := View.OwnerDiagramView;
      if (OwnerDiagramView <> nil) then begin
        OwnerDiagramModel := OwnerDiagramView.Diagram;
        if (OwnerDiagramModel <> nil)
          and not SelectedDiagrams.Contains(OwnerDiagramModel) then
          SelectedDiagrams.Add(OwnerDiagramModel);
      end;
    end;
  end;

end;

class procedure PStarUMLApplication.ShowDiagramSearchFinishedNotification(FoundDiagramsNb: Integer; ModelName: string);
var
  Plural: string;
  Msg: string;
begin
  // Prepare and show notification message
  if FoundDiagramsNb > 0 then begin
    if FoundDiagramsNb > 1 then
      Plural := 's';
     Msg := Format(TXT_DIAGRAMS_WITH_MODEL_FOUND,
      [FoundDiagramsNb,Plural,ModelName]);
  end
  else
    Msg := Format(TXT_DIAGRAMS_WITH_MODEL_NOT_FOUND, [ModelName]);

  MessageDlg(Msg,mtInformation,[mbOK],0);
end;


function PStarUMLApplication.AddConstraint(AExtensibleModel: PExtensibleModel; AName: string; ABody: string): PConstraint;
var
  C: PConstraint;
begin
  CheckReadOnly(AExtensibleModel);
  C := CommandExecutor.AddConstraint(AExtensibleModel, AName, ABody);
  ElementModified(AExtensibleModel);
  Result := C;
end;

procedure PStarUMLApplication.DeleteConstraint(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint);
begin
  if AExtensibleModel.IndexOfConstraint(AConstraint) > -1 then
  begin
    CheckReadOnly(AExtensibleModel);
    CommandExecutor.DeleteConstraint(AExtensibleModel, AConstraint);
    ElementModified(AExtensibleModel);
  end;
end;

procedure PStarUMLApplication.ChangeConstraint(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint; AName: string; ABody: string);
begin
  if (AExtensibleModel.IndexOfConstraint(AConstraint) > -1) and
     ((AConstraint.Name <> AName) or (AConstraint.Body <> ABody)) then
  begin
    CheckReadOnly(AExtensibleModel);
    CommandExecutor.ChangeConstraint(AExtensibleModel, AConstraint, AName, ABody);
    ElementModified(AExtensibleModel);
  end;
end;

procedure PStarUMLApplication.ChangeConstraintOrder(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint; NewIdx: Integer);
begin
  if AExtensibleModel.IndexOfConstraint(AConstraint) <> NewIdx then
  begin
    CheckReadOnly(AExtensibleModel);
    CommandExecutor.ChangeCollectionItemOrder(AExtensibleModel, AConstraint, 'Constraints', NewIdx);
    ElementModified(AExtensibleModel);
  end;
end;

procedure PStarUMLApplication.SetDataTaggedValue(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName, AValue: string);
begin
  if AdjustLineBreaks(AExtensibleModel.QueryDataTaggedValue(AProfile, ATagDefinitionSet, AName), tlbsLF) <> AdjustLineBreaks(AValue, tlbsLF) then begin
    CheckReadOnly(AExtensibleModel);
    CommandExecutor.SetDataTaggedValue(AExtensibleModel, AProfile, ATagDefinitionSet, AName, AValue);
    ElementModified(AExtensibleModel);
  end;
end;

procedure PStarUMLApplication.SetReferenceTaggedValue(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string; AValue: PExtensibleModel);
var
  TaggedValue: PTaggedValue;
  OldRef: PExtensibleModel;
begin
  if AExtensibleModel.QueryReferenceTaggedValue(AProfile, ATagDefinitionSet, AName) <> AValue then
  begin
    CheckReadOnly(AExtensibleModel);
    TaggedValue := AExtensibleModel.FindTaggedValue(AProfile, ATagDefinitionSet, AName);
    OldRef := nil;
    if (TaggedValue <> nil) and IsReferenceTagType(TaggedValue.GetTagDefinition.TagType) and (TaggedValue.ReferenceValueCount > 0) then
      OldRef := TaggedValue.ReferenceValues[0];
    CommandExecutor.SetReferenceTaggedValue(AExtensibleModel, AProfile, ATagDefinitionSet, AName, AValue);
    ElementModified(AExtensibleModel);
    if AValue <> nil then
      ElementModified(AValue);
    if OldRef <> nil then
      ElementModified(OldRef);
  end;
end;

procedure PStarUMLApplication.AddCollectionTaggedValue(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string; AValue: PExtensibleModel);
begin
  CheckReadOnly(AExtensibleModel);
  CommandExecutor.AddCollectionTaggedValue(AExtensibleModel, AProfile, ATagDefinitionSet, AName, AValue);
  ElementModified(AExtensibleModel);
  ElementModified(AValue);
end;

procedure PStarUMLApplication.RemoveCollectionTaggedValue(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string; AValue: PExtensibleModel);
begin
  CheckReadOnly(AExtensibleModel);
  CommandExecutor.RemoveCollectionTaggedValue(AExtensibleModel, AProfile, ATagDefinitionSet, AName, AValue);
  ElementModified(AExtensibleModel);
  ElementModified(AValue);
end;

procedure PStarUMLApplication.InsertCollectionTaggedValue(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string; Index: Integer; AValue: PExtensibleModel);
begin
  CheckReadOnly(AExtensibleModel);
  CommandExecutor.InsertCollectionTaggedValue(AExtensibleModel, AProfile, ATagDefinitionSet, AName, Index, AValue);
  ElementModified(AExtensibleModel);
  ElementModified(AValue);
end;

procedure PStarUMLApplication.DeleteCollectionTaggedValue(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string; Index: Integer);
var
  T: PTaggedValue;
  M: PExtensibleModel;
begin
  CheckReadOnly(AExtensibleModel);
  M := nil;
  T := AExtensibleModel.FindTaggedValue(AProfile, ATagDefinitionSet, AName);
  if (T <> nil) and (Index >= 0) and (Index <= T.ReferenceValueCount - 1) then
    M := T.ReferenceValues[Index];
  CommandExecutor.DeleteCollectionTaggedValue(AExtensibleModel, AProfile, ATagDefinitionSet, AName, Index);
  ElementModified(AExtensibleModel);
  if M <> nil then
    ElementModified(M);
end;

procedure PStarUMLApplication.ChangeCollectionTaggedValueOrder(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string; AValue: PExtensibleModel; NewIdx: Integer);
begin
  CheckReadOnly(AExtensibleModel);
  CommandExecutor.ChangeCollectionTaggedValueOrder(AExtensibleModel, AProfile, ATagDefinitionSet, AName, AValue, NewIdx);
  ElementModified(AExtensibleModel);
end;

procedure PStarUMLApplication.SetTaggedValueAsDefault(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string);
var
  TaggedValue: PTaggedValue;
  RefList: POrderedSet;
  I: Integer;
begin
  CheckReadOnly(AExtensibleModel);
  TaggedValue := AExtensibleModel.FindTaggedValue(AProfile, ATagDefinitionSet, AName);
  // ASSERTION
  Assert(TaggedValue <> nil);
  // ASSERTION
  RefList := POrderedSet.Create;
  if IsReferenceTagType(TaggedValue.GetTagDefinition.TagType) then
    for I := 0 to TaggedValue.ReferenceValueCount - 1 do
      RefList.Add(TaggedValue.ReferenceValues[I]);
  try
    CommandExecutor.SetTaggedValueAsDefault(AExtensibleModel, AProfile, ATagDefinitionSet, AName);
    ElementModified(AExtensibleModel);
    ElementModified(RefList);
  finally
    RefList.Free;
  end;
end;

procedure PStarUMLApplication.ClearAttachments(AModel: PModel);
begin
  if AModel.Attachments.Count > 0 then
  begin
    CheckReadOnly(AModel);
    CommandExecutor.ClearAttachments(AModel);
    ElementModified(AModel);
  end;
end;

procedure PStarUMLApplication.AddAttachment(AModel: PModel; Attach: string);
begin
  CheckReadOnly(AModel);
  CommandExecutor.AddAttachment(AModel, Attach);
  ElementModified(AModel);
end;

procedure PStarUMLApplication.InsertAttachment(AModel: PModel; Attach: string; Index: Integer);
begin
  CheckReadOnly(AModel);
  CommandExecutor.InsertAttachment(AModel, Attach, Index);
  ElementModified(AModel);
end;

procedure PStarUMLApplication.DeleteAttachment(AModel: PModel; Index: Integer);
begin
  CheckReadOnly(AModel);
  CommandExecutor.DeleteAttachment(AModel, Index);
  ElementModified(AModel);
end;

procedure PStarUMLApplication.ChangeAttachment(AModel: PModel; Index: Integer; Attach: string);
begin
  if AModel.Attachments.Strings[Index] <> Attach then
  begin
    CheckReadOnly(AModel);
    CommandExecutor.ChangeAttachment(AModel, Index, Attach);
    ElementModified(AModel);
  end;
end;

procedure PStarUMLApplication.ChangeAttachmentOrder(AModel: PModel; Index: Integer; NewIndex: Integer);
begin
  if Index <> NewIndex then
  begin
    CheckReadOnly(AModel);
    CommandExecutor.ChangeAttachmentOrder(AModel, Index, NewIndex);
    ElementModified(AModel);
  end;
end;

procedure PStarUMLApplication.ApplyGeneralNameExpression(AModel: PUMLElement; Value: string);
var
  Msg: string;
begin
  Msg := '';
  ModelSet.Clear;
  ModelSet.Add(AModel);
  CheckReadOnly(AModel);
  if CommandExecutor.ApplyGeneralNameExpression(ModelSet, Value, Msg) then
    ElementModified(AModel)
  else begin
    if Msg <> '' then Raise EExpressionInvalid.Create(Msg);
  end;
end;

procedure PStarUMLApplication.ApplyClassifierRoleExpression(AModel: PUMLClassifierRole; Value: string);
var
  Msg: string;
begin
  Msg := '';
  ModelSet.Clear;
  ModelSet.Add(AModel);
  CheckReadOnly(AModel);
  if CommandExecutor.ApplyClassifierRoleExpression(ModelSet, Value, Msg) then
    ElementModified(AModel)
  else begin
    if Msg <> '' then Raise EExpressionInvalid.Create(Msg);
  end;
end;

procedure PStarUMLApplication.ApplyInstanceExpression(AModel: PUMLInstance; Value: string);
var
  Msg: string;
begin
  Msg := '';
  ModelSet.Clear;
  ModelSet.Add(AModel);
  CheckReadOnly(AModel);
  if CommandExecutor.ApplyInstanceExpression(ModelSet, Value, Msg) then
    ElementModified(AModel)
  else begin
    if Msg <> '' then Raise EExpressionInvalid.Create(Msg);
  end;
end;

procedure PStarUMLApplication.ApplyAttributeExpression(AModel: PUMLAttribute; Value: string);
var
  Msg: string;
begin
  Msg := '';
  ModelSet.Clear;
  ModelSet.Add(AModel);
  CheckReadOnly(AModel);
  if CommandExecutor.ApplyAttributeExpression(ModelSet, Value, Msg) then
    ElementModified(AModel)
  else begin
    if Msg <> '' then Raise EExpressionInvalid.Create(Msg);
  end;
end;

procedure PStarUMLApplication.ApplyOperationExpression(AModel: PUMLOperation; Value: string);
var
  Msg: string;
begin
  Msg := '';
  ModelSet.Clear;
  ModelSet.Add(AModel);
  CheckReadOnly(AModel);
  if CommandExecutor.ApplyOperationExpression(ModelSet, Value, Msg) then
    ElementModified(AModel)
  else begin
    if Msg <> '' then Raise EExpressionInvalid.Create(Msg);
  end;
end;

procedure PStarUMLApplication.ApplyMessageExpresstion(AModel: PUMLModelElement; Value: string);
var
  Msg: string;
begin
  Msg := '';
  ModelSet.Clear;
  ModelSet.Add(AModel);
  CheckReadOnly(AModel);
  if CommandExecutor.ApplyMessageExpression(ModelSet, Value, Msg) then
    ElementModified(AModel)
  else begin
    if Msg <> '' then Raise EExpressionInvalid.Create(Msg);
  end;
end;

procedure PStarUMLApplication.ChangeModelReferenceWithNamedModelCreating(AModel: PModel; Key: string; Owner: PModel; ModelKind: string; IsClassifier: Boolean; Name: string = '');
begin
  CheckReadOnly(Owner);
  CheckReadOnly(AModel);
  if IsClassifier and (Owner is PUMLNamespace) then begin
    PreinspectClassifierNameConflict(Owner as PUMLNamespace, Name);
    CheckNameValidity(Name);
  end;
  ModelSet.Clear;
  ModelSet.Add(Owner);
  ModelSet.Add(AModel);
  CommandExecutor.ChangeModelReferenceWithNamedModelCreating(AModel, Key, Owner, ModelKind, Name);
  ElementModified(Owner);
  ElementModified(AModel);
end;

// PStarUMLApplication
////////////////////////////////////////////////////////////////////////////////

initialization
  StarUMLApplication := PStarUMLApplication.Create;
finalization
  StarUMLApplication.Free;
end.
