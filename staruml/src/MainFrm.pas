unit MainFrm;

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
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, ImgList, dxBar,
  BasicClasses, GraphicClasses, Core, ViewCore, ExtCore, UMLModels, UMLViews,
  UMLAux, Handlers, DiagramEditors, QuickDialogFrm,
  ComCtrls, ToolWin, Menus, dxBarExtItems, Registry, ExtDlgs,
  AreaTitleBar, InspectorFrm, WorkingAreaFrm,
  FlatPanel, CompactFontDlg, SaveDialogEx, DiagramExplorerFrame,
  JvBaseDlg, JvDesktopAlert, cxClasses, AttachEdt, DocuEdt,
  ModelExplorerFrame, MessageFrame, OutputFrame, NavBarFrame,
  NavBarFrameVclImpl, VirtualTrees, PropEdtWithJvclInspector, MenuManager,
  dxDockPanel, dxDockControl, cxLookAndFeelPainters, cxPC, PropEdt;

const
  FILE_EXT_BMP = '.BMP';
  FILE_EXT_JPG = '.JPG';
  FILE_EXT_JPEG = '.JPEG';
  FILE_EXT_PNG = '.PNG';

  MENU_BAR = 0;
  STANDARD_BAR = 1;
  FORMAT_BAR = 2;
  VIEW_BAR = 3;
  ALIGNMENT_BAR = 4;
  STATUS_BAR = 5;

type
  // Enumeration types
  PFrameWindowKind = (fwNone, fwBrowser, fwInspector, fwInformation, fwWorkingArea);

  // Event types
  PModelAddMenuClickEvent = procedure(ModelKind: string; Argument: Integer) of object;
  PModelAddDiagramMenuClickEvent = procedure(DiagramKind: string) of object;
  PCheckTypeMenuClickEvent = procedure(Sender: TObject; Checked: Boolean) of object;
  PWndClipboardEvent = procedure(var Msg: TMessage) of object;
  PWndDropFilesEvent = procedure (var Msg: TWMDROPFILES) of object;
  PZoomEvent = procedure(Sender: TObject; Zoom: Integer) of object;
  PFontFaceEvent = procedure(Sender: TObject; FontFace: string) of object;
  PFontSizeEvent = procedure(Sender: TObject; FontSize: Integer) of object;
  PRecentFileClickEvent = procedure(Sender: TObject; RecentFile: string) of object;
  PRecentFileAddEvent = procedure (Sender: TObject; RecentFile: string) of object;
  PDiagramEditorEvent = procedure(Sender: TObject; DiagramEditor: PDiagramEditor) of object;

  // TMainForm
  TMainForm = class(TForm)
    BarManager: TdxBarManager;
    { File Menu Items }
    FileCreate: TdxBarButton;
    FileMenu: TdxBarSubItem;
    FileNew: TdxBarButton;
    FileOpen: TdxBarButton;
    FileSave: TdxBarButton;
    FileSaveAs: TdxBarButton;
    FileClose: TdxBarButton;
    FileUnits: TdxBarSubItem;
    FileUnitsSeparateUnit: TdxBarButton;
    FileUnitsMergeUnit: TdxBarButton;
    FileUnitsSave: TdxBarButton;
    FileUnitsSaveAs: TdxBarButton;
    FilePrint: TdxBarButton;
    FilePageSetup: TdxBarButton;
    FileImport: TdxBarSubItem;
    FileExport: TdxBarSubItem;
    FileImportModelFragment: TdxBarButton;
    FileImportFramework: TdxBarButton;
    FileExportModelFragment: TdxBarButton;
    FileExportDiagram: TdxBarButton;
    FileRecentFiles: TdxBarSubItem;
    FileExit: TdxBarButton;
    { Edit Menu Items }
    EditMenu: TdxBarSubItem;
    EditUndo: TdxBarButton;
    EditRedo: TdxBarButton;
    EditCut: TdxBarButton;
    EditCopy: TdxBarButton;
    EditCopyDiagram: TdxBarButton;
    EditPaste: TdxBarButton;
    EditPasteFormat: TdxBarButton;
    EditDelete: TdxBarButton;
    EditDeleteFromModel: TdxBarButton;
    EditSelectAll: TdxBarButton;
    EditFind: TdxBarButton;
    EditCopyDiagramAsBitmap: TdxBarButton;
    EditFindDiagramsWithSelectedModel: TdxBarButton;

    { Format Menu Items }
    FormatMenux: TdxBarSubItem;
    FormatFont: TdxBarButton;
    FormatLineColor: TdxBarButton;
    FormatFillColor: TdxBarButton;
    FormatLineStyle: TdxBarSubItem;
    FormatLineStyleRectilinear: TdxBarButton;
    FormatLineStyleOblique: TdxBarButton;
    FormatSuppressAttributes: TdxBarButton;
    FormatSuppressOperations: TdxBarButton;
    FormatSuppressEnumerationLiterals: TdxBarButton;
    FormatStereotypeDisplay: TdxBarSubItem;
    FormatShowOperationSignature: TdxBarButton;
    FormatShowCompartmentVisibility: TdxBarButton;
    FormatShowParentName: TdxBarButton;
    FormatShowCompartmentStereotype: TdxBarButton;
    FormatAlignmentSendToBack: TdxBarButton;
    FormatAlignmentBringToFront: TdxBarButton;
    FormatAlignment: TdxBarSubItem;
    FormatAlignmentLeft: TdxBarButton;
    FormatAlignmentRight: TdxBarButton;
    FormatAlignmentMiddle: TdxBarButton;
    FormatAlignmentTop: TdxBarButton;
    FormatAlignmentBottom: TdxBarButton;
    FormatAlignmentCenter: TdxBarButton;
    FormatAlignmentSpaceEvenlyHorizontally: TdxBarButton;
    FormatAlignmentSpaceEvenlyVertically: TdxBarButton;
    FormatAutoResize: TdxBarButton;
    FormatStereotypeDisplayNone: TdxBarButton;
    FormatStereotypeDisplayText: TdxBarButton;
    FormatStereotypeDisplayIcon: TdxBarButton;
    FormatFontNameCombo: TdxBarFontNameCombo;
    FormatShowProperty: TdxBarButton;
    { Model Menu Items }
    ModelMenu: TdxBarSubItem;
    ModelAdd: TdxBarSubItem;
    ModelAddModel: TdxBarButton;
    ModelAddSubsystem: TdxBarButton;
    ModelAddPackage: TdxBarButton;
    ModelAddClass: TdxBarButton;
    ModelAddInterface: TdxBarButton;
    ModelAddEnumeration: TdxBarButton;
    ModelAddUseCase: TdxBarButton;
    ModelAddActor: TdxBarButton;
    ModelAddAttribute: TdxBarButton;
    ModelAddOperation: TdxBarButton;
    ModelAddTemplateParameter: TdxBarButton;
    ModelAddComponent: TdxBarButton;
    ModelAddComponentInstance: TdxBarButton;
    ModelAddNode: TdxBarButton;
    ModelAddNodeInstance: TdxBarButton;
    ModelAddParameter: TdxBarButton;
    ModelAddSignal: TdxBarButton;
    ModelAddObject: TdxBarButton;
    ModelAddActivityGraph: TdxBarButton;
    ModelAddCollaboration: TdxBarButton;
    ModelAddCollaborationInstanceSet: TdxBarButton;
    ModelAddStateMachine: TdxBarButton;
    ModelAddInteraction: TdxBarButton;
    ModelAddInteractionInstanceSet: TdxBarButton;
    ModelAddActionState: TdxBarButton;
    ModelAddSubactivityState: TdxBarButton;
    ModelAddDecision: TdxBarButton;
    ModelAddInitialState: TdxBarButton;
    ModelAddFinalState: TdxBarButton;
    ModelAddSwimlane: TdxBarButton;
    ModelAddSynchronization: TdxBarButton;
    ModelAddState: TdxBarButton;
    ModelAddSubmachineState: TdxBarButton;
    ModelAddJunctionPoint: TdxBarButton;
    ModelAddChoicePoint: TdxBarButton;
    ModelAddShallowHistory: TdxBarButton;
    ModelAddDeepHistory: TdxBarButton;
    ModelAddEnumerationLiteral: TdxBarButton;
    ModelAddEffect: TdxBarButton;
    ModelAddEntryAction: TdxBarButton;
    ModelAddDoAction: TdxBarButton;
    ModelAddExitAction: TdxBarButton;
    ModelAddSignalEvent: TdxBarButton;
    ModelAddCallEvent: TdxBarButton;
    ModelAddChangeEvent: TdxBarButton;
    ModelAddTimeEvent: TdxBarButton;
    ModelAddClassifierRole: TdxBarButton;
    ModelAddException: TdxBarButton;
    ModelAddDiagram: TdxBarSubItem;
    ModelAddDiagramUsecaseDiagram: TdxBarButton;
    ModelAddDiagramClassDiagram: TdxBarButton;
    ModelAddDiagramSequenceDiagram: TdxBarButton;
    ModelAddDiagramSequenceRoleDiagram: TdxBarButton;
    ModelAddDiagramCollaborationDiagram: TdxBarButton;
    ModelAddDiagramCollaborationRoleDiagram: TdxBarButton;
    ModelAddDiagramStatechartDiagram: TdxBarButton;
    ModelAddDiagramActivityDiagram: TdxBarButton;
    ModelAddDiagramComponentDiagram: TdxBarButton;
    ModelAddDiagramDeploymentDiagram: TdxBarButton;
    ModelProfiles: TdxBarButton;
    ModelConstraints: TdxBarButton;
    ModelTaggedValues: TdxBarButton;
    ModelModelVerification: TdxBarButton;
    { View Menu Items }
    ViewMenu: TdxBarSubItem;
    ViewRefresh: TdxBarButton;
    ViewZoom: TdxBarSubItem;
    ViewZoomFitInWindow: TdxBarButton;
    ViewZoomZoomIn: TdxBarButton;
    ViewZoomZoomOut: TdxBarButton;
    ViewZoom50: TdxBarButton;
    ViewZoom100: TdxBarButton;
    ViewZoom150: TdxBarButton;
    ViewZoom75: TdxBarButton;
    ViewZoom125: TdxBarButton;
    ViewZoom175: TdxBarButton;
    ViewZoom200: TdxBarButton;
    FormatLayoutDiagram: TdxBarButton;
    ViewCloseDiagram: TdxBarButton;
    ViewSelectInModelExplorer: TdxBarButton;
    ViewToolbars: TdxBarSubItem;
    ViewToolbarsStandard: TdxBarButton;
    ViewToolbarsFormat: TdxBarButton;
    ViewToolbarsView: TdxBarButton;
    ViewToolbarsAlignment: TdxBarButton;
    { Tools menu Items }
    ToolsMenu: TdxBarSubItem;
    ToolsOptions: TdxBarButton;
    ToolsAddInManager: TdxBarButton;
    { Help menu Items }
    HelpMenu: TdxBarSubItem;
    HelpAbout: TdxBarButton;
    HelpContents: TdxBarButton;
    { Groups }
    AllModelsGroup: TdxBarGroup;
    NamespacesGroup: TdxBarGroup;
    ClassifiersGroup: TdxBarGroup;
    InstancesGroup: TdxBarGroup;
    BehaviorsGroup: TdxBarGroup;
    FeaturesGroup: TdxBarGroup;
    ActionsGroup: TdxBarGroup;
    EventsGroup: TdxBarGroup;
    AllDiagramsGroup: TdxBarGroup;
    AlwaysGroup: TdxBarGroup;
    ProjectOpenedGroup: TdxBarGroup;
    DiagramActivatedGroup: TdxBarGroup;
    ViewSelectedGroup: TdxBarGroup;
    ModelSelectedGroup: TdxBarGroup;
    UnitSelectedGroup: TdxBarGroup;
    TotalImageList: TImageList;
    { Dialogs }
    SaveDialog: TSaveDialogEx;
    OpenDialog: TOpenDialog;
    SaveUnitDialog: TSaveDialogEx;
    SaveModelFragmentDialog: TSaveDialogEx;
    ImportModelFragmentDialog: TOpenDialog;
    StatusBarInfo: TdxBarStatic;
    StatusBarProgress: TdxBarProgressItem;
    StatusBarModifiedInfo: TdxBarStatic;
    InspectorAttachmentOpen: TdxBarButton;
    InspectorAttachmentAdd: TdxBarButton;
    InspectorAttachmentEdit: TdxBarButton;
    InspectorAttachmentDelete: TdxBarButton;
    InspectorAttachmentMoveUp: TdxBarButton;
    InspectorAttachmentMoveDown: TdxBarButton;
    AttachmentsPopupMenu: TdxBarPopupMenu;
    MessagesPopupMenu: TdxBarPopupMenu;
    MessagesClearAll: TdxBarButton;
    MessagesClearFindResults: TdxBarButton;
    MessagesClearVerificationResults: TdxBarButton;
    MessagesSaveMessages: TdxBarButton;
    ModelExplorerPopupMenu: TdxBarPopupMenu;
    ViewZoomCombo: TdxBarCombo;
    FormatFontSizeCombo: TdxBarCombo;
    DiagramTabPopupMenu: TdxBarPopupMenu;
    ViewCloseAllDiagrams: TdxBarButton;
    DiagramExplorerPopupMenu: TdxBarPopupMenu;
    FileRecentFilesMRU: TdxBarMRUListItem;
    BehavioralDiagramsGroup: TdxBarGroup;
    ExportDiagramDialog: TSaveDialogEx;
    ModelCollectionEditor: TdxBarButton;
    OpenUnitDialog: TOpenDialog;
    FileUnitsDeleteUnit: TdxBarButton;
    DiagramEditorPopupMenu: TdxBarPopupMenu;
    FontDialog: TCompactFontDialog;
    FileSelectProject: TdxBarButton;
    ColorDialog: TColorDialog;
    FileCreatePopupMenu: TdxBarPopupMenu;
    DockingManager: TdxDockingManager;
    DockSite: TdxDockSite;
    dxTabContainerDockSite1: TdxTabContainerDockSite;
    ModelExplorerDockPanel: TdxDockPanel;
    DiagramExplorerDockPanel: TdxDockPanel;
    DiagramExplorer: TDiagramExplorerPanel;
    PropertiesDockPanel: TdxDockPanel;
    WorkingAreaDockPanel: TdxDockPanel;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxVertContainerDockSite2: TdxVertContainerDockSite;
    OutputDockPanel: TdxDockPanel;
    dxTabContainerDockSite2: TdxTabContainerDockSite;
    MessageDockPanel: TdxDockPanel;
    OutputPanel: TOutputPanel;
    DockPanelImageList: TImageList;
    MessagePanel: TMessagePanel;
    dxTabContainerDockSite3: TdxTabContainerDockSite;
    DocumentationDockPanel: TdxDockPanel;
    //PaletteNavBarFrame: TPaletteNavBarFrameTdxImpl;
    AttachmentsDockPanel: TdxDockPanel;
    DocumentationEditor: TDocumentationEditor;
    AttachmentEditor: TAttachmentEditor;
    ViewModelExplorer: TdxBarButton;
    ViewDiagramExplorer: TdxBarButton;
    ViewPropertyEditor: TdxBarButton;
    ViewDocumentationEditor: TdxBarButton;
    ViewAttachmentEditor: TdxBarButton;
    ViewOutputWindow: TdxBarButton;
    ViewMessageWindow: TdxBarButton;
    FormatStereotypeDisplayDecoration: TdxBarButton;
    ModelAddDiagramCompositeStructureDiagram: TdxBarButton;
    ToolBoxDockPanel: TdxDockPanel;
    dxLayoutDockSite4: TdxLayoutDockSite;
    ViewDiagramPages: TdxBarSubItem;
    ViewDiagramPageList: TdxBarListItem;
    ViewToolbox: TdxBarButton;
    WorkingAreaFrame: TWorkingAreaFrame;
    EditGoTo: TdxBarSubItem;
    EditGoToItemList: TdxBarListItem;
    FormatShowExtendedNotation: TdxBarButton;
    ModelProperty: TdxBarButton;
    InspectorFrame: TInspectorFrame;
    FormatWordWrap: TdxBarButton;
    ModelAddObjectFlowState: TdxBarButton;
    ModelAddFlowFinalState: TdxBarButton;
    ModelAddSignalAcceptState: TdxBarButton;
    ModelAddSignalSendState: TdxBarButton;
    ModelAddArtifact: TdxBarButton;
    ModelAddAttributeLink: TdxBarButton;
    ModelAddPort: TdxBarButton;
    ModelAddExtensionPoint: TdxBarButton;
    ModelAddCombinedFragment: TdxBarButton;
    ModelAddInteractionOperand: TdxBarButton;
    ModelAddFrame: TdxBarButton;
    DocumentStateImageList: TImageList;
    DesktopAlert: TJvDesktopAlert;
    ModelExplorer: TModelExplorerPanel;
    ViewToolbarsStatusBar: TdxBarButton;
    ViewUIThemeModern: TdxBarButton;
    ViewUIThemeClassic: TdxBarButton;
    ViewUIThemeNative: TdxBarButton;
    ViewUIThemeGroup: TdxBarGroup;
    ViewUITheme: TdxBarSubItem;
    ExclusiveFileOpen: TdxBarButton;
    FormatAnnotationLineStyle: TdxBarSubItem;
    FormatAnnotationLineStyleSolid: TdxBarButton;
    FormatAnnotationLineStyleDash: TdxBarButton;
    FormatAnnotationLineStyleDot: TdxBarButton;
    FormatAnnotationLineStyleDashDot: TdxBarButton;
    FormatAnnotationLineStyleDashDotDot: TdxBarButton;
    dxLayoutDockSite3: TdxLayoutDockSite;
    ModelAttachments: TdxBarButton;
    FileUnitsOpenUnit: TdxBarButton;
    FileUnitsUnloadUnit: TdxBarButton;
    PaletteNavBarFrame: TPaletteNavBarFrameVclImpl;
    // Event Handlers (On Main Form Menu Item Clicked)
    procedure FileMenuClick(Sender: TObject);
    procedure EditMenuClick(Sender: TObject);
    procedure FormatMenuClick(Sender: TObject);
    procedure FormatCheckTypeMenuClick(Sender: TObject);
    procedure FormatFontNameComboChange(Sender: TObject);
    procedure FormatFontSizeComboChange(Sender: TObject);
    procedure ModelAddMenuClick(Sender: TObject);
    procedure ModelAddDiagramMenuClick(Sender: TObject);
    procedure ModelMenuClick(Sender: TObject);
    procedure ViewCheckTypeMenuClick(Sender: TObject);
    procedure ViewCheckTypeMenuMainFormOnlyClick(Sender: TObject);
    procedure ViewMenuClick(Sender: TObject);
    procedure ViewZoomMenuClick(Sender: TObject);
    procedure ViewZoomComboChange(Sender: TObject);
    procedure ToolsMenuClick(Sender: TObject);
    procedure HelpMenuClick(Sender: TObject);
    procedure FileRecentFilesMRUClick(Sender: TObject);
    // Event Handlers (On Inspector Form Attachment Item Clicked)
    procedure InspectorAttachmentButtonClick(Sender: TObject);
    // Event Handlers (On Information Form Messages Item Clicked)
    procedure InformationMessagesButtonClick(Sender: TObject);
    // Event Handlers (On System Clipboard related events)
    procedure WMDrawClipboardHandler(var Msg: TMessage); message WM_DRAWCLIPBOARD;
    procedure WMChangeCBChainHandler(var Msg: TMessage); message WM_CHANGECBCHAIN;
    // Event Handlers (On File Dropped)
    procedure WMDropFilesHandler(var Msg : TWMDROPFILES); message WM_DROPFILES;
    // Event Handlers (On Main Form Mouse Wheel event)
    procedure MainFormMouseWheelHandler(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    // Event Handlers (On Dock Control Closed)
    procedure DockPanelVisibleChanged(Sender: TdxCustomDockControl);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BarManagerBarVisibleChange(Sender: TdxBarManager; ABar: TdxBar);
    procedure ViewUIThemeModernClick(Sender: TObject);
    procedure ViewUIThemeNativeClick(Sender: TObject);
    procedure ViewUIThemeClassicClick(Sender: TObject);
    procedure WorkingAreaFrameDiagramPageControlChange(Sender: TObject);
    procedure ExclusiveFileOpenClick(Sender: TObject);
    procedure EditFindDiagramsWithSelectedModelClick(Sender: TObject);
    procedure WindowsMessageHandler(var Msg: TMsg; var Handled: Boolean);
    procedure EditGoToPopup(Sender: TObject);
  private
    AllowToTriggerFontFaceChangedEvent: Boolean;
    AllowToTriggerFontSizeChangedEvent: Boolean;
    AllowToTriggerZoomChangedEvent: Boolean;
    AllowToTriggerFormStartedEvent: Boolean;
    //OldBrowserHeight: Integer;
    FActionProcessor: PActionProcessor;
    FFileName: string;
    FIsActivated: Boolean;
    FBrowserVisible: Boolean;
    FInspectorVisible: Boolean;
    FInformationVisible: Boolean;
    FNumberOfRecentProjects: Integer;

    FHoldingKey: Boolean;
    FSpeedMove: Boolean;

    FMenuManager: TMenuHandlesManager;
    FLookAndFeelManager: TLookAndFeelManager;

    // Event Fields (On MainForm's events)
    FOnFileMenuClicked: TNotifyEvent;
    FOnEditFindDiagramsWithSelectedModelClicked: TNotifyEvent;
    FOnEditMenuClicked: TNotifyEvent;
    FOnEditGoToPopup: TNotifyEvent;
    FOnFormatMenuClicked: TNotifyEvent;
    FOnFormatCheckTypeMenuClicked: PCheckTypeMenuClickEvent;
    FOnFontFaceChanged: PFontFaceEvent;
    FOnFontSizeChanged: PFontSizeEvent;
    FOnModelMenuClicked: TNotifyEvent;
    FOnModelAddMenuClicked: TNotifyEvent;
    FOnModelAddDiagramMenuClicked: TNotifyEvent;
    FOnViewMenuClicked: TNotifyEvent;
    FOnViewCheckTypeMenuClicked: PCheckTypeMenuClickEvent;
    FOnZoomChanged: PZoomEvent;
    FOnToolsMenuClicked: TNotifyEvent;
    FOnHelpMenuClicked: TNotifyEvent;
    FOnRecentFileClicked: PRecentFileClickEvent;
    FOnRecentFileAdd: PRecentFileAddEvent;
    FOnActiveFrameChanged: TNotifyEvent;
    FOnStarted: TNotifyEvent;
    FOnDiagramOpen: PDiagramEvent;
    FOnDiagramClose: PDiagramEvent;
    FOnDockPanelVisibleChanged: TdxDockControlNotifyEvent;
    // Event Fields (On InspectorForm Attachment Toolbar's events)
    FOnInspectorAttachmentButtonClicked: TNotifyEvent;
    // Event Fields (On InformationForm Messages Toolbar's events)
    FOnInformationMessagesButtonClicked: TNotifyEvent;
    // Event Fields (On ActionProcessor's events)
    FOnElementCreating: PElementCreateHandlingEvent;
    FOnViewSelecting: PViewSelectingEvent;
    FOnViewDeselecting: TNotifyEvent;
    FOnAllViewsDeselecting: TNotifyEvent;
    FOnAdditionalViewSelecting: TNotifyEvent;
    FOnAreaSelecting: PAreaSelectingEvent;
    FOnViewMoving: PViewMovingEvent;
    FOnViewContainerChanging: PViewContainerChangingEvent;
    FOnSelectedViewsMoving: PSelectedViewsMovingEvent;
    FOnSelectedViewsContainerChanging: PSelectedViewsContainerChangingEvent;
    FOnParasiticViewMoving: PParasiticViewMovingEvent;
    FOnNodeResizing: PNodeResizingEvent;
    FOnEdgeModifying: PEdgeModifyingEvent;
    FOnEdgeReconnecting: PEdgeReconnectingEvent;
    FOnViewDoubleClicked: PViewMouseEvent;
    // Event Fields (On DiagramEditor's events)
    FOnDiagramViewDragOver: PDiagramViewDragOverEvent;
    FOnDiagramViewDragDrop: PDiagramViewDragDropEvent;
    // Event Fields (On Clipboard related)
    FOnWMDrawClipboard: PWndClipboardEvent;
    FOnWMChangeCBChain: PWndClipboardEvent;
    // Event Fields (On File Dropped)
    FOnWMDropFiles: PWndDropFilesEvent;
    // Event Fields (On QuickDialogManager events)
    FOnQuickDlgPopup: PQuickDlgPopupEvent;
    FOnGeneralNameExpressionApplying: PQuickDlgExpressionApplyingEvent;
    FOnClassifierRoleExpressionApplying: PQuickDlgExpressionApplyingEvent;
    FOnInstanceExpressionApplying: PQuickDlgExpressionApplyingEvent;
    FOnAttributeExpressionApplying: PQuickDlgExpressionApplyingEvent;
    FOnOperationExpressionApplying: PQuickDlgExpressionApplyingEvent;
    FOnMessageExpressionApplying: PQuickDlgExpressionApplyingEvent;
    FOnQuickDlgModelCreating: PQuickDlgModelCreatingEvent;
    FOnQuickDlgModelCreatingWithName: PQuickDlgModelCreatingWithNameEvent;
    FOnQuickDlgElementDeleting: PQuickDlgElementDeletingEvent;
    FOnQuickDlgVisibilityChanging: PQuickDlgVisibilityChangingEvent;
    FOnQuickDlgAggregationKindChanging: PQuickDlgAggregationKindChangingEvent;
    FOnQuickDlgNavigableChanging: PQuickDlgNavigableChangingEvent;
    FOnQuickDlgMultiplicityChanging: PQuickDlgMultiplicityChangingEvent;
    FOnQuickDlgActionKindChanging: PQuickDlgActionKindChangingEvent;
    FOnQuickDlgOperationChanging: PQuickDlgOperationChangingEvent;
    FOnQuickDlgSignalChanging: PQuickDlgSignalChangingEvent;
    FOnQuickDlgInstantiationChanging: PQuickDlgInstantiationChangingEvent;
    FOnQuickDlgNoteTextChanging: PQuickDlgNoteTextChangingEvent;
    FOnQuickDlgOrderChanging: PQuickDlgOrderChangingEvent;
    FOnQuickDlgSeqNumberChanging: PQuickDlgSeqNumberChangingEvent;
    FOnQuickDlgObjectClassCreating: PQuickDlgObjectClassCreatingEvent;
    FOnQuickDlgCallActionOperationCreating: PQuickDlgCallActionOperationCreatingEvent;
    // Event Handlers (On DiagramEditor's events)
    //procedure WorkingAreaMouseUpHandler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure WorkingAreaMouseDownHandler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure WorkingAreaMouseMoveHandler(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure WorkingAreaDragOverHandler(Sender, Source: TObject; var Accept: Boolean; var Msg: string);
    procedure WorkingAreaDragDropHandler(X, Y: Integer);
    procedure WorkingAreaDiagramOpenHandler(Sender: TObject; Diagram: PDiagram);
    procedure WorkingAreaDiagramCloseHandler(Sender: TObject; Diagram: PDiagram);
    // Event Handlers (On ActionProcessor's events)
    procedure ActionProcElementCreatingHandler(Sender: TObject; HandlerName: string; X1, Y1, X2, Y2: Integer);
    // procedure ActionProcElementCreatingAbortHandler(Sender: TObject);
    procedure ActionProcViewSelectingHandler(AView: PView);
    procedure ActionProcViewDeselectingHandler(Sender: TObject);
    procedure ActionProcAllViewsDeselectingHandler(Sender: TObject);
    procedure ActionProcAdditionalViewSelectingHandler(Sender: TObject);
    procedure ActionProcAreaSelectingHandler(X1, Y1, X2, Y2: Integer);
    procedure ActionProcQuickDlgPopupHandler(AView: PView; X, Y: Integer);
    procedure ActionProcViewDoubleClickedHandler(Sender: TObject; AView: PView; X, Y: Integer);
    procedure ActionProcViewMovingHandler(View: PView; DX, DY: Integer);
    procedure ActionProcViewContainerChangingHandler(View: PView; DX, DY: Integer; AContainerView: PView);
    procedure ActionProcSelectedViewsMovingHandler(DX, DY: Integer);
    procedure ActionProcSelectedViewsContainerChangingHandler(DX, DY: Integer; AContainerView: PView);
    procedure ActionProcParasiticViewMovingHandler(AParasiticView: PParasiticView; DX, DY: Extended);
    procedure ActionProcNodeResizingHandler(Node: PNodeView; Left, Top, Right, Bottom: Integer);
    procedure ActionProcEdgeModifyingHandler(Edge: IModifiableEdge; Points: PPoints);
    procedure ActionProcEdgeReconnectingHandler(Edge: PEdgeView; Points: PPoints; NewParticipant: PView; IsTailSide: Boolean);
    // Event Handlers (On Quick Dialog Manager)
    procedure QuickDlgGeneralNameExpApplyingHandler(AModel: PModel; Value: string);
    procedure QuickDlgClassifierRoleExpApplyingHandler(AModel: PModel; Value: string);
    procedure QuickDlgInstanceExpApplyingHandler(AModel: PModel; Value: string);
    procedure QuickDlgAttributeExpApplyingHandler(AModel: PModel; Value: string);
    procedure QuickDlgOperationExpApplyingHandler(AModel: PModel; Value: string);
    procedure QuickDlgMessageExpApplyingHandler(AModel: PModel; Value: string);
    procedure QuickDlgModelCreatingHandler(Owner: PModel; ModelKind: string; Argument: Integer = 0; InsertIndex: Integer = -1);
    procedure QuickDlgModelCreatingWithNameHandler(Owner: PModel; ModelKind: string; Name: string = '');
    procedure QuickDlgElementDeletingHandler(AModel: PModel);
    procedure QuickDlgVisibilityChangingHandler(AModel: PModel; Kind: PUMLVisibilityKind);
    procedure QuickDlgAggregationKindChangingHandler(AModel: PModel; Kind: PUMLAggregationKind);
    procedure QuickDlgNavigableChangingHandler(AModel: PModel; IsNavigable: Boolean);
    procedure QuickDlgMultiplicityChangingHandler(AModel: PModel; Str: string);
    procedure QuickDlgActionKindChangingHandler(AModel: PModel; Kind: string);
    procedure QuickDlgOperationChangingHandler(AModel: PModel; AnOp: PUMLOperation);
    procedure QuickDlgSignalChangingHandler(AModel: PModel; ASignal: PUMLSignal);
    procedure QuickDlgInstantiationChangingHandler(AModel: PModel; AInstantiation: PUMLClassifier);
    procedure QuickDlgNoteTextChangingHandler(AView: PUMLCustomTextView; Strs: string);
    procedure QuickDlgOrderChangingHandler(AModel: PModel; AnItem: PModel; Key: string; NewOrder: Integer);
    procedure QuickDlgSeqNumberChangingHandler(AElement: PElement; ACollectionItem: PElement; Key: string; NewIndex: Integer);
    procedure QuickDlgObjectClassCreatingHandler(Owner: PUMLNamespace; AModel: PUMLModelElement; Name: string = '');
    procedure QuickDlgCallActionOperationCreatingHandler(AClassifier: PUMLClassifier; ACallAction: PUMLCallAction; Name: string = '');
    procedure QuickDlgHideHandler(Sender: TObject);
    // INNER Methods
    procedure InitializeActionProcessor;
    procedure InitializeQuickDialogManager;
    procedure SetFileName(Value: string);
    function GetFontFaceComboText: string;
    procedure SetFontFaceComboText(Value: string);
    function GetFontSizeComboText: string;
    procedure SetFontSizeComboText(Value: string);
    function GetZoomComboText: string;
    procedure SetZoomComboText(Value: string);
    procedure SetNumberOfRecentProjects(Value: Integer);
    procedure FontFaceChanged(FontFace: string);
    procedure FontSizeChanged(FontSize: Integer);
    procedure ZoomChanged(Zoom: Integer);
    function GetActiveHandlerName: string;
    procedure ApplyLookAndFeelStyle(LookAndFeelStyle: TcxLookAndFeelStyle);
    procedure HandleKeyDownMessage(Key, Repetitions: Word);

  protected
    procedure Activate; override;
    procedure Deactivate; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetStatusBarInfo(Info: string; Progress: Integer = 0);
    procedure AddRecentFile(FileName: string);
    procedure DeleteRecentFile(FileName: string);
    procedure SaveToRegistry;
    procedure LoadFromRegistry;
    procedure LoadWindowPositionFromRegistry;
    procedure ShowQuickDialog(AView: PView; MousePoint: TPoint; Force: Boolean = False);
    procedure ShowQuickDialogByModelCreation(AView: PView; ArgModel: PModel);
    procedure ShowAlertMsg(AHeaderText: string;AMessageText: string);
    procedure SetAlertLookAndFeel;
    procedure ActivateHandler(HanderName: string);
    procedure AddCreateHandler(HandlerName: string; const ContainerCandidates: array of PClass; SkeletonPaintingKind: PSkeletonPaintingKind);
    function IsModelExplorerActive: Boolean;
    procedure ActivateWorkingAreaPanel;
    procedure ActivateModelExplorerPanel;

    procedure WorkingAreaMouseUpHandler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    property FileName: string read FFileName write SetFileName;
    property FontFaceComboText: string read GetFontFaceComboText write SetFontFaceComboText;
    property FontSizeComboText: string read GetFontSizeComboText write SetFontSizeComboText;
    property ZoomComboText: string read GetZoomComboText write SetZoomComboText;
    property IsActivated: Boolean read FIsActivated;
    property NumberOfRecentProjects: Integer read FNumberOfRecentProjects write SetNumberOfRecentProjects;
    property ActiveHandlerName: string read GetActiveHandlerName;

    property ActionProcessor: PActionProcessor read FActionProcessor;
    property MenuManager: TMenuHandlesManager read FMenuManager write FMenuManager;
    property LookAndFeelManager: TLookAndFeelManager read FLookAndFeelManager;

    // Events (On MainForm's Menu Item Clicked)
    property OnFileMenuClicked: TNotifyEvent write FOnFileMenuClicked;
    property OnEditFindDiagramsWithSelectedModelClicked: TNotifyEvent write FOnEditFindDiagramsWithSelectedModelClicked;
    property OnEditMenuClicked: TNotifyEvent write FOnEditMenuClicked;
    property OnEditGoToPopup: TNotifyEvent write FOnEditGoToPopup;
    property OnFormatMenuClicked: TNotifyEvent write FOnFormatMenuClicked;
    property OnFormatCheckTypeMenuClicked: PCheckTypeMenuClickEvent write FOnFormatCheckTypeMenuClicked;
    property OnFontFaceChanged: PFontFaceEvent read FOnFontFaceChanged write FOnFontFaceChanged;
    property OnFontSizeChanged: PFontSizeEvent read FOnFontSizeChanged write FOnFontSizeChanged;
    property OnModelMenuClicked: TNotifyEvent write FOnModelMenuClicked;
    property OnModelAddMenuClicked: TNotifyEvent write FOnModelAddMenuClicked;
    property OnModelAddDiagramMenuClicked: TNotifyEvent read FOnModelAddDiagramMenuClicked write FOnModelAddDiagramMenuClicked;
    property OnViewMenuClicked: TNotifyEvent write FOnViewMenuClicked;
    property OnViewCheckTypeMenuClicked: PCheckTypeMenuClickEvent write FOnViewCheckTypeMenuClicked;
    property OnZoomChanged: PZoomEvent read FOnZoomChanged write FOnZoomChanged;
    property OnToolsMenuClicked: TNotifyEvent write FOnToolsMenuClicked;
    property OnHelpMenuClicked: TNotifyEvent write FOnHelpMenuClicked;
    property OnRecentFileClicked: PRecentFileClickEvent read FOnRecentFileClicked write FOnRecentFileClicked;
    property OnRecentFileAdd: PRecentFileAddEvent read FOnRecentFileAdd write FOnRecentFileAdd;
    property OnActiveFrameChanged: TNotifyEvent read FOnActiveFrameChanged write FOnActiveFrameChanged;
    property OnStarted: TNotifyEvent read FOnStarted write FOnStarted;
    property OnDiagramOpen: PDiagramEvent read FOnDiagramOpen write FOnDiagramOpen;
    property OnDiagramClose: PDiagramEvent read FOnDiagramClose write FOnDiagramClose;
    property OnDockPanelVisibleChanged: TdxDockControlNotifyEvent read FOnDockPanelVisibleChanged write FOnDockPanelVisibleChanged;
    // Event Fields (On InspectorForm Attachment Toolbar's events)
    property OnInspectorAttachmentButtonClicked: TNotifyEvent write FOnInspectorAttachmentButtonClicked;
    // Event Fields (On InformationForm Messages Toolbar's events)
    property OnInformationMessagesButtonClicked: TNotifyEvent write FOnInformationMessagesButtonClicked;
    // Event (On ActionProcessor's events)
    property OnElementCreating: PElementCreateHandlingEvent write FOnElementCreating;
    property OnViewSelecting: PViewSelectingEvent write FOnViewSelecting;
    property OnViewDeselecting: TNotifyEvent write FOnViewDeselecting;
    property OnAllViewsDeselecting: TNotifyEvent write FOnAllViewsDeselecting;
    property OnAdditionalViewSelecting: TNotifyEvent write FOnAdditionalViewSelecting;
    property OnAreaSelecting: PAreaSelectingEvent write FOnAreaSelecting;
    property OnViewMoving: PViewMovingEvent write FOnViewMoving;
    property OnViewContainerChanging: PViewContainerChangingEvent write FOnViewContainerChanging;
    property OnSelectedViewsMoving: PSelectedViewsMovingEvent write FOnSelectedViewsMoving;
    property OnSelectedViewsContainerChanging: PSelectedViewsContainerChangingEvent write FOnSelectedViewsContainerChanging;
    property OnParasiticViewMoving: PParasiticViewMovingEvent write FOnParasiticViewMoving;
    property OnNodeResizing: PNodeResizingEvent write FOnNodeResizing;
    property OnEdgeModifying: PEdgeModifyingEvent write FOnEdgeModifying;
    property OnEdgeReconnecting: PEdgeReconnectingEvent write FOnEdgeReconnecting;
    property OnViewDoubleClicked: PViewMouseEvent write FOnViewDoubleClicked;
    // Event (On DiagramEditor's events)
    property OnDiagramViewDragOver: PDiagramViewDragOverEvent write FOnDiagramViewDragOver;
    property OnDiagramViewDragDrop: PDiagramViewDragDropEvent write FOnDiagramViewDragDrop;
    // Event (On Message from System Clipboard)
    property OnWMDrawClipboard: PWndClipboardEvent write FOnWMDrawClipboard;
    property OnWMChangeCBChain: PWndClipboardEvent write FOnWMChangeCBChain;
    // Event Fields (On File Dropped)
    property OnWMDropFiles: PWndDropFilesEvent write FOnWMDropFiles;
    // Event (On QuickDialogManager's events)
    property OnQuickDlgPopup: PQuickDlgPopupEvent write FOnQuickDlgPopup;
    property OnGeneralNameExpressionApplying: PQuickDlgExpressionApplyingEvent write FOnGeneralNameExpressionApplying;
    property OnClassifierRoleExpressionApplying: PQuickDlgExpressionApplyingEvent write FOnClassifierRoleExpressionApplying;
    property OnObjectExpressionApplying: PQuickDlgExpressionApplyingEvent write FOnInstanceExpressionApplying;
    property OnAttributeExpressionApplying: PQuickDlgExpressionApplyingEvent write FOnAttributeExpressionApplying;
    property OnOperationExpressionApplying: PQuickDlgExpressionApplyingEvent write FOnOperationExpressionApplying;
    property OnMessageExpressionApplying: PQuickDlgExpressionApplyingEvent write FOnMessageExpressionApplying;
    property OnQuickDlgModelCreating: PQuickDlgModelCreatingEvent write FOnQuickDlgModelCreating;
    property OnQuickDlgModelCreatingWithName: PQuickDlgModelCreatingWithNameEvent write FOnQuickDlgModelCreatingWithName;
    property OnQuickDlgElementDeleting: PQuickDlgElementDeletingEvent write FOnQuickDlgElementDeleting;
    property OnQuickDlgVisibilityChanging: PQuickDlgVisibilityChangingEvent write FOnQuickDlgVisibilityChanging;
    property OnQuickDlgAggregationKindChanging: PQuickDlgAggregationKindChangingEvent write FOnQuickDlgAggregationKindChanging;
    property OnQuickDlgNavigableChanging: PQuickDlgNavigableChangingEvent write FOnQuickDlgNavigableChanging;
    property OnQuickDlgMultiplicityChanging: PQuickDlgMultiplicityChangingEvent write FOnQuickDlgMultiplicityChanging;
    property OnQuickDlgActionKindChanging: PQuickDlgActionKindChangingEvent write FOnQuickDlgActionKindChanging;
    property OnQuickDlgOperationChanging: PQuickDlgOperationChangingEvent write FOnQuickDlgOperationChanging;
    property OnQuickDlgSignalChanging: PQuickDlgSignalChangingEvent write FOnQuickDlgSignalChanging;
    property OnQuickDlgInstantiationChanging: PQuickDlgInstantiationChangingEvent write FOnQuickDlgInstantiationChanging;
    property OnQuickDlgNoteTextChanging: PQuickDlgNoteTextChangingEvent write FOnQuickDlgNoteTextChanging;
    property OnQuickDlgOrderChanging: PQuickDlgOrderChangingEvent write FOnQuickDlgOrderChanging;
    property OnQuickDlgSeqNumberChanging: PQuickDlgSeqNumberChangingEvent write FOnQuickDlgSeqNumberChanging;
    property OnQuickDlgObjectClassCreating: PQuickDlgObjectClassCreatingEvent write FOnQuickDlgObjectClassCreating;
    property OnQuickDlgCallActionOperationCreating: PQuickDlgCallActionOperationCreatingEvent write FOnQuickDlgCallActionOperationCreating;
  end;

var
  MainForm: TMainForm;

const
  //RK_LOCATION = '\SOFTWARE\WhiteStarUML\';
  RK_LOCATION = RK_BASE_LOCATION;
  RK_MAIN = 'Main Window';
  RK_MODELEXPLORER = 'ModelExplorer';
  RK_RECENTFILES = 'Recent Files';
  RK_BARS = 'Bars';
  RK_DOCK = 'Dock';
  RK_COLORDIALOG = 'Color Dialog';
  RK_LOOK_AND_FEEL_MANAGER = 'Look And Feel';
  POSTFIX_HANDLER = 'Handler';

implementation

uses
  System.Types, System.UITypes, StrUtils, Math, ShellAPI,
  StarUMLApp, MenuManagerTdxImpl, UMLFacto, NLS, NLS_StarUML;


{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TMainForm

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited;
  AllowToTriggerFontFaceChangedEvent := True;
  AllowToTriggerFontSizeChangedEvent := True;
  AllowToTriggerZoomChangedEvent := True;
  AllowToTriggerFormStartedEvent := True;

  // ActionProcessor creatioin and settings
  InitializeActionProcessor;

  OnMouseWheel := MainFormMouseWheelHandler;

  WorkingAreaFrame.ImageList := TotalImageList;
  //WorkingAreaFrame.DiagramPopupMenu := DiagramEditorPopupMenu;
  //WorkingAreaFrame.TabPopupMenu := DiagramTabPopupMenu;
  WorkingAreaFrame.OnMouseUp := WorkingAreaMouseUpHandler;
  WorkingAreaFrame.OnMouseMove := WorkingAreaMouseMoveHandler;
  WorkingAreaFrame.OnMouseDown := WorkingAreaMouseDownHandler;
  WorkingAreaFrame.OnDragOver := WorkingAreaDragOverHandler;
  WorkingAreaFrame.OnDragDrop := WorkingAreaDragDropHandler;
  WorkingAreaFrame.OnDiagramOpen := WorkingAreaDiagramOpenHandler;
  WorkingAreaFrame.OnDiagramClose := WorkingAreaDiagramCloseHandler;

  // MenuStateHandler creatioin and Start-time Menu status settings
  BarManager.AutoHideEmptyBars := True;

  FIsActivated := False;
  FBrowserVisible := True;
  FInspectorVisible := True;
  FInformationVisible := True;
  FileName := '';
  NumberOfRecentProjects := 5;

  FHoldingKey := False;
  FSpeedMove := False;

  QuickDialogManager := PQuickDialogManager.Create;
  InitializeQuickDialogManager;

  FMenuManager := TMenuHandlesManagerTdxImpl.Create;
  FLookAndFeelManager := TLookAndFeelManagerTdxImpl.Create(BarManager.LookAndFeel.Painter);
end;

destructor TMainForm.Destroy;
begin
  QuickDialogManager.Free;
  ColorDialog.Free;
  ActionProcessor.Free;
  FMenuManager.Free;
  FLookAndFeelManager.Free;
  inherited;
end;

procedure TMainForm.WorkingAreaMouseUpHandler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Sender is PDiagramEditor then
    ActionProcessor.MouseUp(Sender as PDiagramEditor, (Sender as PDiagramEditor).DiagramView.Canvas, Button, Shift, X, Y);
end;

procedure TMainForm.WorkingAreaMouseDownHandler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Sender is PDiagramEditor then
    ActionProcessor.MouseDown(Sender as PDiagramEditor, (Sender as PDiagramEditor).DiagramView.Canvas, Button, Shift, X, Y);
end;

procedure TMainForm.WorkingAreaMouseMoveHandler(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if Sender is PDiagramEditor then
    ActionProcessor.MouseMove(Sender as PDiagramEditor, (Sender as PDiagramEditor).DiagramView.Canvas, Shift, X, Y);
end;

procedure TMainForm.WorkingAreaDragOverHandler(Sender, Source: TObject; var Accept: Boolean; var Msg: string);
begin
  if Assigned(FOnDiagramViewDragOver) then FOnDiagramViewDragOver(Sender, Source, Accept, Msg);
end;

procedure TMainForm.WorkingAreaFrameDiagramPageControlChange(Sender: TObject);
begin
  WorkingAreaFrame.DiagramPageControlChange(Sender);

end;

procedure TMainForm.WorkingAreaDragDropHandler(X, Y: Integer);
begin
  if Assigned(FOnDiagramViewDragDrop) then FOnDiagramViewDragDrop(X, Y);
end;

procedure TMainForm.WorkingAreaDiagramOpenHandler(Sender: TObject; Diagram: PDiagram);
begin
  if Assigned(FOnDiagramOpen) then
    FOnDiagramOpen(Self, Diagram);
end;

procedure TMainForm.WorkingAreaDiagramCloseHandler(Sender: TObject; Diagram: PDiagram);
begin
  if Assigned(FOnDiagramClose) then
    FOnDiagramClose(Self, Diagram);
end;

procedure TMainForm.ActionProcElementCreatingHandler(Sender: TObject; HandlerName: string; X1, Y1, X2, Y2: Integer);
begin
  if Assigned(FOnElementCreating) then
    FOnElementCreating(Self, HandlerName, X1, Y1, X2, Y2);
end;

{
procedure TMainForm.ActionProcElementCreatingAbortHandler(Sender: TObject);
begin
//  if LockedNavBarItem = nil then
    ActivateSelectHandler;
end;
}

procedure TMainForm.ActionProcViewSelectingHandler(AView: PView);
begin
  if Assigned(FOnViewSelecting) then FOnViewSelecting(AView);
end;

procedure TMainForm.ActionProcViewDeselectingHandler(Sender: TObject);
begin
  if Assigned(FOnViewDeselecting) then FOnViewDeselecting(Sender);
end;

procedure TMainForm.ActionProcAllViewsDeselectingHandler(Sender: TObject);
begin
  if Assigned(FOnAllViewsDeselecting) then FOnAllViewsDeselecting(Sender);
end;

procedure TMainForm.ActionProcAdditionalViewSelectingHandler(Sender: TObject);
begin
  if Assigned(FOnAdditionalViewSelecting) then FOnAdditionalViewSelecting(Sender);
end;

procedure TMainForm.ActionProcAreaSelectingHandler(X1, Y1, X2, Y2: Integer);
begin
  if Assigned(FOnAreaSelecting) then FOnAreaSelecting(X1, Y1, X2, Y2);
end;

procedure TMainForm.ActionProcQuickDlgPopupHandler(AView: PView; X, Y: Integer);
begin
  if Assigned(FOnQuickDlgPopup) then FOnQuickDlgPopup(AView, X, Y);
end;

procedure TMainForm.ActionProcViewDoubleClickedHandler(Sender: TObject; AView: PView; X, Y: Integer);
begin
  if Assigned(FOnViewDoubleClicked) then FOnViewDoubleClicked(Self, AView, X, Y);
end;

procedure TMainForm.ActionProcViewMovingHandler(View: PView; DX, DY: Integer);
begin
  if Assigned(FOnViewMoving) then FOnViewMoving(View, DX, DY);
end;

procedure TMainForm.ActionProcViewContainerChangingHandler(View: PView; DX, DY: Integer; AContainerView: PView);
begin
  if Assigned(FOnViewContainerChanging) then FOnViewContainerChanging(View, DX, DY, AContainerView);
end;

procedure TMainForm.ActionProcSelectedViewsMovingHandler(DX, DY: Integer);
begin
  if Assigned(FOnSelectedViewsMoving) then FOnSelectedViewsMoving(DX, DY);
end;

procedure TMainForm.ActionProcSelectedViewsContainerChangingHandler(DX, DY: Integer; AContainerView: PView);
begin
  if Assigned(FOnSelectedViewsContainerChanging) then FOnSelectedViewsContainerChanging(DX, DY, AContainerView);
end;

procedure TMainForm.ActionProcParasiticViewMovingHandler(AParasiticView: PParasiticView; DX, DY: Extended);
begin
  if Assigned(FOnParasiticViewMoving) then FOnParasiticViewMoving(AParasiticView, DX, DY);
end;

procedure TMainForm.ActionProcNodeResizingHandler(Node: PNodeView; Left, Top, Right, Bottom: Integer);
begin
  if Assigned(FOnNodeResizing) then FOnNodeResizing(Node, Left, Top, Right, Bottom);
end;

procedure TMainForm.ActionProcEdgeModifyingHandler(Edge: IModifiableEdge; Points: PPoints);
begin
  if Assigned(FOnEdgeModifying) then FOnEdgeModifying(Edge, Points);
end;

procedure TMainForm.ActionProcEdgeReconnectingHandler(Edge: PEdgeView; Points: PPoints; NewParticipant: PView; IsTailSide: Boolean);
begin
  if Assigned(FOnEdgeReconnecting) then FOnEdgeReconnecting(Edge, Points, NewParticipant, IsTailSide);
end;

procedure TMainForm.SetFileName(Value: string);
begin
  if FFileName <> Value then
  begin
    FFileName := Value;
    if FFileName <> '' then
      Application.Title := TXT_APPLICATION_TITLE + ' - ' + FFileName
    else
      Application.Title := TXT_APPLICATION_TITLE;
    Caption := Application.Title;
  end;
end;

function TMainForm.GetFontFaceComboText: string;
begin
  Result := FormatFontNameCombo.Text;
end;

procedure TMainForm.SetFontFaceComboText(Value: string);
begin
  AllowToTriggerFontFaceChangedEvent := False;
  FormatFontNameCombo.Text := Value;
  AllowToTriggerFontFaceChangedEvent := True;
end;

function TMainForm.GetFontSizeComboText: string;
begin
  Result := FormatFontSizeCombo.Text;
end;

procedure TMainForm.SetFontSizeComboText(Value: string);
begin
  AllowToTriggerFontSizeChangedEvent := False;
  FormatFontSizeCombo.Text := Value;
  AllowToTriggerFontSizeChangedEvent := True;
end;

function TMainForm.GetZoomComboText: string;
begin
  Result := ViewZoomCombo.Text;
end;

procedure TMainForm.SetZoomComboText(Value: string);
begin
  AllowToTriggerZoomChangedEvent := False;
  ViewZoomCombo.Text := Value;
  AllowToTriggerZoomChangedEvent := True;
end;

procedure TMainForm.SetNumberOfRecentProjects(Value: Integer);
begin
  if FNumberOfRecentProjects <> Value then
  begin
    FNumberOfRecentProjects := Value;
    FileRecentFilesMRU.MaxItemCount := FNumberOfRecentProjects;
  end;
end;

procedure TMainForm.FontFaceChanged(FontFace: string);
begin
  if Assigned(FOnFontFaceChanged) and AllowToTriggerFontFaceChangedEvent then
    FOnFontFaceChanged(Self, FontFace);
end;

procedure TMainForm.FontSizeChanged(FontSize: Integer);
begin
  if Assigned(FOnFontSizeChanged) and AllowToTriggerFontSizeChangedEvent then
    FOnFontSizeChanged(Self, FontSize);
end;

procedure TMainForm.ZoomChanged(Zoom: Integer);
begin
  if Assigned(FOnZoomChanged) and AllowToTriggerZoomChangedEvent then
    FOnZoomChanged(Self, Zoom);
end;

function TMainForm.GetActiveHandlerName: string;
begin
  Result := ActionProcessor.ActiveHandler.HandlerName;
end;

procedure TMainForm.Activate;
begin
  FIsActivated := True;
  inherited;
  //if AllowToTriggerFormStartedEvent and Assigned(FOnStarted) then FOnStarted(Self);
  //AllowToTriggerFormStartedEvent := False;
end;

procedure TMainForm.Deactivate;
begin
  FIsActivated := False;
  inherited;
end;

procedure TMainForm.WMDrawClipboardHandler(var Msg: TMessage);
begin
  inherited;
  if Assigned(FOnWMDrawClipboard) then FOnWMDrawClipboard(Msg);
end;

procedure TMainForm.WMChangeCBChainHandler(var Msg: TMessage);
begin
  inherited;
  if Assigned(FOnWMChangeCBChain) then FOnWMChangeCBChain(Msg);
end;

procedure TMainForm.WMDropFilesHandler(var Msg : TWMDROPFILES);
begin
  inherited;
  if Assigned(FOnWMDropFiles) then FOnWMDropFiles(Msg);
end;

procedure TMainForm.MainFormMouseWheelHandler(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if dxDockingController.ActiveDockControl = WorkingAreaDockPanel then begin
    // Zoom working area
    if (ssCtrl in Shift) and not (ssAlt in Shift) then begin
      if WheelDelta > 0 then
        FOnViewMenuClicked(ViewZoomZoomIn) // Same as zoom in click
      else
        FOnViewMenuClicked(ViewZoomZoomOut) // Same as zoom out click
    end
    else if WorkingAreaFrame.ActiveDiagramEditor <> nil then begin
      if (ssShift in Shift) then
         WorkingAreaFrame.ActiveDiagramEditor.ScrollBy(-(WheelDelta div DEFAULT_WHEEL_DIVIDER), 0)
      else
        WorkingAreaFrame.ActiveDiagramEditor.ScrollBy(0, -(WheelDelta div DEFAULT_WHEEL_DIVIDER));
    end;

    Handled := True;

  end;
end;

procedure TMainForm.DockPanelVisibleChanged(Sender: TdxCustomDockControl);
begin
  if Assigned(FOnDockPanelVisibleChanged) then
    FOnDockPanelVisibleChanged(Sender);
end;

procedure TMainForm.QuickDlgGeneralNameExpApplyingHandler(AModel: PModel; Value: string);
begin
  if Assigned(FOnGeneralNameExpressionApplying) then FOnGeneralNameExpressionApplying(AModel, Value);
end;

procedure TMainForm.QuickDlgClassifierRoleExpApplyingHandler(AModel: PModel; Value: string);
begin
  if Assigned(FOnClassifierRoleExpressionApplying) then FOnClassifierRoleExpressionApplying(AModel, Value);
end;

procedure TMainForm.QuickDlgInstanceExpApplyingHandler(AModel: PModel; Value: string);
begin
  if Assigned(FOnInstanceExpressionApplying) then FOnInstanceExpressionApplying(AModel, Value);
end;

procedure TMainForm.QuickDlgAttributeExpApplyingHandler(AModel: PModel; Value: string);
begin
  if Assigned(FOnAttributeExpressionApplying) then FOnAttributeExpressionApplying(AModel, Value);
end;

procedure TMainForm.QuickDlgOperationExpApplyingHandler(AModel: PModel; Value: string);
begin
  if Assigned(FOnOperationExpressionApplying) then FOnOperationExpressionApplying(AModel, Value);
end;

procedure TMainForm.QuickDlgMessageExpApplyingHandler(AModel: PModel; Value: string);
begin
  if Assigned(FOnMessageExpressionApplying) then FOnMessageExpressionApplying(AModel, Value);
end;

procedure TMainForm.QuickDlgModelCreatingHandler(Owner: PModel; ModelKind: string; Argument: Integer = 0;
  InsertIndex: Integer = -1);
begin
  if Assigned(FOnQuickDlgModelCreating) then FOnQuickDlgModelCreating(Owner, ModelKind, Argument, InsertIndex);
end;

procedure TMainForm.QuickDlgModelCreatingWithNameHandler(Owner: PModel; ModelKind: string; Name: string = '');
begin
  if Assigned(FOnQuickDlgModelCreatingWithName) then FOnQuickDlgModelCreatingWithName(Owner, ModelKind, Name);
end;

procedure TMainForm.QuickDlgElementDeletingHandler(AModel: PModel);
begin
  if Assigned(FOnQuickDlgElementDeleting) then FOnQuickDlgElementDeleting(AModel);
end;

procedure TMainForm.QuickDlgVisibilityChangingHandler(AModel: PModel; Kind: PUMLVisibilityKind);
begin
  if Assigned(FOnQuickDlgVisibilityChanging) then FOnQuickDlgVisibilityChanging(AModel, Kind);
end;

procedure TMainForm.QuickDlgAggregationKindChangingHandler(AModel: PModel; Kind: PUMLAggregationKind);
begin
  if Assigned(FOnQuickDlgAggregationKindChanging) then FOnQuickDlgAggregationKindChanging(AModel, Kind);
end;

procedure TMainForm.QuickDlgNavigableChangingHandler(AModel: PModel; IsNavigable: Boolean);
begin
  if Assigned(FOnQuickDlgNavigableChanging) then FOnQuickDlgNavigableChanging(AModel, IsNavigable);
end;

procedure TMainForm.QuickDlgMultiplicityChangingHandler(AModel: PModel; Str: string);
begin
  if Assigned(FOnQuickDlgMultiplicityChanging) then FOnQuickDlgMultiplicityChanging(AModel, Str);
end;

procedure TMainForm.QuickDlgActionKindChangingHandler(AModel: PModel; Kind: string);
begin
  if Assigned(FOnQuickDlgActionKindChanging) then FOnQuickDlgActionKindChanging(AModel, Kind);
end;

procedure TMainForm.QuickDlgOperationChangingHandler(AModel: PModel; AnOp: PUMLOperation);
begin
  if Assigned(FOnQuickDlgOperationChanging) then FOnQuickDlgOperationChanging(AModel, AnOp);
end;

procedure TMainForm.QuickDlgSignalChangingHandler(AModel: PModel; ASignal: PUMLSignal);
begin
  if Assigned(FOnQuickDlgSignalChanging) then FOnQuickDlgSignalChanging(AModel, ASignal);
end;

procedure TMainForm.QuickDlgInstantiationChangingHandler(AModel: PModel; AInstantiation: PUMLClassifier);
begin
  if Assigned(FOnQuickDlgInstantiationChanging) then FOnQuickDlgInstantiationChanging(AModel, AInstantiation);
end;

procedure TMainForm.QuickDlgNoteTextChangingHandler(AView: PUMLCustomTextView; Strs: string);
begin
  if Assigned(FOnQuickDlgNoteTextChanging) then FOnQuickDlgNoteTextChanging(AView, Strs);
end;

procedure TMainForm.QuickDlgOrderChangingHandler(AModel: PModel; AnItem: PModel; Key: string; NewOrder: Integer);
begin
  if Assigned(FOnQuickDlgOrderChanging) then FOnQuickDlgOrderChanging(AModel, AnItem, Key, NewOrder);
end;

procedure TMainForm.QuickDlgSeqNumberChangingHandler(AElement: PElement; ACollectionItem: PElement; Key: string; NewIndex: Integer);
begin
  if Assigned(FOnQuickDlgSeqNumberChanging) then FOnQuickDlgSeqNumberChanging(AElement, ACollectionItem, Key, NewIndex);
end;

procedure TMainForm.QuickDlgObjectClassCreatingHandler(Owner: PUMLNamespace; AModel: PUMLModelElement; Name: string = '');
begin
  if Assigned(FOnQuickDlgObjectClassCreating) then FOnQuickDlgObjectClassCreating(Owner, AModel, Name);
end;

procedure TMainForm.QuickDlgCallActionOperationCreatingHandler(AClassifier: PUMLClassifier; ACallAction: PUMLCallAction; Name: string = '');
begin
  if Assigned(FOnQuickDlgCallActionOperationCreating) then FOnQuickDlgCallActionOperationCreating(AClassifier, ACallAction, Name);
end;

procedure TMainForm.QuickDlgHideHandler(Sender: TObject);
begin
  SetFocus;
end;

procedure TMainForm.InitializeActionProcessor;
begin
  FActionProcessor := PActionProcessor.Create;
  with ActionProcessor do begin
    OnElementCreating := ActionProcElementCreatingHandler;
    // OnElementCreatingAbort := ActionProcElementCreatingAbortHandler;
    OnViewSelecting := ActionProcViewSelectingHandler;
    OnViewDeselecting := ActionProcViewDeselectingHandler;
    OnAllViewsDeselecting := ActionProcAllViewsDeselectingHandler;
    OnAdditionalViewSelecting := ActionProcAdditionalViewSelectingHandler;
    OnAreaSelecting := ActionProcAreaSelectingHandler;
    OnQuickDlgPopup := ActionProcQuickDlgPopupHandler;
    OnViewMoving := ActionProcViewMovingHandler;
    OnViewContainerChanging := ActionProcViewContainerChangingHandler;
    OnSelectedViewsMoving := ActionProcSelectedViewsMovingHandler;
    OnSelectedViewsContainerChanging := ActionProcSelectedViewsContainerChangingHandler;
    OnParasiticViewMoving := ActionProcParasiticViewMovingHandler;
    OnNodeResizing := ActionProcNodeResizingHandler;
    OnEdgeModifying := ActionProcEdgeModifyingHandler;
    OnEdgeReconnecting := ActionProcEdgeReconnectingHandler;
    OnViewDoubleClicked := ActionProcViewDoubleClickedHandler;
  end;
end;

procedure TMainForm.InitializeQuickDialogManager;
begin
  QuickDialogManager.OnGeneralNameExpApplying := QuickDlgGeneralNameExpApplyingHandler;
  QuickDialogManager.OnOrderChanging := QuickDlgOrderChangingHandler;
  QuickDialogManager.OnModelCreating := QuickDlgModelCreatingHandler;
  QuickDialogManager.OnModelCreatingWithName := QuickDlgModelCreatingWithNameHandler;
  QuickDialogManager.OnElementDeleting := QuickDlgElementDeletingHandler;
  QuickDialogManager.OnClassifierRoleExpApplying := QuickDlgClassifierRoleExpApplyingHandler;
  QuickDialogManager.OnObjectExpApplying := QuickDlgInstanceExpApplyingHandler;
  QuickDialogManager.OnAttributeExpApplying := QuickDlgAttributeExpApplyingHandler;
  QuickDialogManager.OnActionKindChanging := QuickDlgActionKindChangingHandler;
  QuickDialogManager.OnOperationChanging := QuickDlgOperationChangingHandler;
  QuickDialogManager.OnSignalChanging := QuickDlgSignalChangingHandler;
  QuickDialogManager.OnInstantiationChanging := QuickDlgInstantiationChangingHandler;
  QuickDialogManager.OnOperationExpApplying := QuickDlgOperationExpApplyingHandler;
  QuickDialogManager.OnMessageExpApplying := QuickDlgMessageExpApplyingHandler;
  QuickDialogManager.OnVisibilityChanging := QuickDlgVisibilityChangingHandler;
  QuickDialogManager.OnAggregationKindChanging := QuickDlgAggregationKindChangingHandler;
  QuickDialogManager.OnNavigableChanging := QuickDlgNavigableChangingHandler;
  QuickDialogManager.OnMultiplicityChanging := QuickDlgMultiplicityChangingHandler;
  QuickDialogManager.OnNoteTextChanging := QuickDlgNoteTextChangingHandler;
  QuickDialogManager.OnSeqNumberChanging := QuickDlgSeqNumberChangingHandler;
  QuickDialogManager.OnObjectClassCreating := QuickDlgObjectClassCreatingHandler;
  QuickDialogManager.OnCallActionOperationCreating := QuickDlgCallActionOperationCreatingHandler;
  QuickDialogManager.OnQuickDialogHide := QuickDlgHideHandler;
end;

procedure TMainForm.SetStatusBarInfo(Info: string; Progress: Integer = 0);
begin
  BarManager.LockUpdate := True;
  StatusBarInfo.Caption := Info;
  StatusBarProgress.Position := Progress;
  BarManager.LockUpdate := False;
end;

procedure TMainForm.AddRecentFile(FileName: string);
begin
  if (FileName <> '') then
  begin
    FileRecentFilesMRU.AddItem(FileName, nil);
    if Assigned(FOnRecentFileAdd) then FOnRecentFileAdd(Self, FileName);
  end;
end;

procedure TMainForm.DeleteRecentFile(FileName: string);
var
  I: Integer;
  RecentFile: string;
begin
  for I := FileRecentFilesMru.Items.Count - 1 downto 0 do begin
    RecentFile := FileRecentFilesMru.Items.Strings[I];
    if (RecentFile = FileName) then FileRecentFilesMru.Items.Delete(I)
  end;
end;

procedure TMainForm.SaveToRegistry;
var
  Reg: TRegistry;
  I, J: Integer;
  NormalRect: TRect;
  S: string;

  procedure GetRestoredCoord(var R: TRect);
  var
    Struct: TWindowPlacement;
  begin
    with Struct do
    begin
      Length := SizeOf(Struct);
      GetWindowPlacement(Handle, @Struct);
      R := rcNormalPosition;
    end;
  end;

begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    // Main Window
    if Reg.OpenKey(RK_LOCATION + RK_MAIN, True) then
    begin
      Reg.WriteInteger('WindowState', Ord(WindowState));
      // WindowState := wsNormal;
      GetRestoredCoord(NormalRect);
      Reg.WriteInteger('Left', NormalRect.Left);
      Reg.WriteInteger('Top', NormalRect.Top);
      Reg.WriteInteger('Width', Abs(NormalRect.Right - NormalRect.Left) + 1);
      Reg.WriteInteger('Height', Abs(NormalRect.Bottom - NormalRect.Top) + 1);
      Reg.CloseKey;
    end;

    // ModelExplorer Window
    ModelExplorer.SaveToRegistry(RK_LOCATION + RK_MODELEXPLORER);

    // Recent Files
    Reg.DeleteKey(RK_LOCATION + RK_RECENTFILES);
    if Reg.OpenKey(RK_LOCATION + RK_RECENTFILES, True) then
    begin
      Reg.WriteInteger('RecentFileCount', FileRecentFilesMRU.Items.Count);
      for I := 0 to FileRecentFilesMRU.Items.Count - 1 do
        Reg.WriteString('RecentFiles[' + IntToStr(I) + ']', FileRecentFilesMRU.Items[I]);
      Reg.CloseKey;
    end;

    // Color Dialog
    Reg.DeleteKey(RK_LOCATION + RK_COLORDIALOG);
    if Reg.OpenKey(RK_LOCATION + RK_COLORDIALOG, True) then
    begin
      for I := 0 to 15 do begin
        S := ColorDialog.CustomColors.Values['Color' + Chr(65 + I)];
        if S <> '' then begin
          J := StrToInt('0x' + S);
          Reg.WriteInteger('CustomColor' + IntToStr(I), J);
        end;
      end;
      ColorDialog.Free;
      Reg.CloseKey;
    end;
    // Bar
    BarManager.SaveToRegistry(RK_LOCATION + RK_BARS);
    // DockingManager
    DockingManager.SaveLayoutToRegistry(RK_LOCATION + RK_DOCK);

     // Look and Feel Manager
    LookAndFeelManager.SaveToRegistry(RK_LOCATION + RK_LOOK_AND_FEEL_MANAGER);

  finally
    Reg.Free;
  end;
end;

procedure TMainForm.LoadFromRegistry;
var
  Reg: TRegistry;
  I, C, Value: Integer;
  S: string;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    // Main Window
    if Reg.OpenKey(RK_LOCATION + RK_MAIN, False) then
    begin
      Reg.CloseKey;
    end;
    // ModelExplorer Window
    ModelExplorer.LoadFromRegistry(RK_LOCATION + RK_MODELEXPLORER);

    // Recent Files
    if Reg.OpenKey(RK_LOCATION + RK_RECENTFILES, False) then
    begin
      C := Reg.ReadInteger('RecentFileCount');
      for I := C - 1 downto 0 do
      begin
        S := Reg.ReadString('RecentFiles[' + IntToStr(I) + ']');
        FileRecentFilesMRU.AddItem(S, nil);
        FOnRecentFileAdd(Self,S);
      end;
      Reg.CloseKey;
    end;

    // Color Dialog
    if Reg.OpenKey(RK_LOCATION + RK_COLORDIALOG, False) then
    begin
      for I := 0 to 15 do begin
        if Reg.ValueExists('CustomColor' + IntToStr(I)) then begin
          Value := Reg.ReadInteger('CustomColor' + IntToStr(I));
          ColorDialog.CustomColors.Add('Color' + Chr(65 + I) + '=' + IntToHex(Value, 2));
        end
        else ColorDialog.CustomColors.Add('Color' + Chr(65 + I) + '=' + 'FFFFFF')
      end;
      Reg.CloseKey;
    end;
    // Bars
    BarManager.LoadFromRegistry(RK_LOCATION + RK_BARS);
    // DockingManager
    if Reg.KeyExists(RK_LOCATION + RK_DOCK) then
      DockingManager.LoadLayoutFromRegistry(RK_LOCATION + RK_DOCK);

    // Look and Feel Manager
    LookAndFeelManager.LoadFromRegistry(RK_LOCATION + RK_LOOK_AND_FEEL_MANAGER);
  finally
    Reg.Free;
  end;
end;

procedure TMainForm.LoadWindowPositionFromRegistry;
var
  Reg: TRegistry;
  Rect: TRect;
  Monitor: TMonitor;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    // Main Window
    if Reg.OpenKey(RK_LOCATION + RK_MAIN, False) then
    begin
      WindowState := wsNormal;

      // Read previously saved main form position
      Rect.Left := Reg.ReadInteger('Left');
      Rect.Top := Reg.ReadInteger('Top');
      Rect.Width := Reg.ReadInteger('Width');
      Rect.Height := Reg.ReadInteger('Height');

      // Restore it if the values are compatible with current desktop settings
      Monitor := Screen.MonitorFromRect(Rect);
      if Assigned(Monitor) and Monitor.BoundsRect.IntersectsWith(Rect) then begin
        Left := Rect.Left;
        Top := Rect.Top;
        Width := Rect.Width;
        Height := Rect.Height;
      end;

      WindowState := TWindowState(Reg.ReadInteger('WindowState'));
      Reg.CloseKey;
    end else
    begin
      WindowState := wsMaximized;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TMainForm.ShowQuickDialog(AView: PView; MousePoint: TPoint; Force: Boolean = False);
var
  P: TPoint;
begin
  if Assigned(QuickDialogManager) then begin
    P := WorkingAreaFrame.ActiveDiagramEditor.PaintBox.ClientOrigin;
    QuickDialogManager.ShowQuickDialog(AView, P, MousePoint, Force);
  end;
end;

procedure TMainForm.ShowQuickDialogByModelCreation(AView: PView; ArgModel: PModel);
var
  P: TPoint;
begin
  if Assigned(QuickDialogManager) then begin
    P := WorkingAreaFrame.ActiveDiagramEditor.PaintBox.ClientOrigin;
    QuickDialogManager.ShowQuickDialogByModelCreation(AView, ArgModel, P);
  end;
end;

procedure TMainForm.ShowAlertMsg(AHeaderText: string;AMessageText: string);
begin
  DesktopAlert.HeaderText := AHeaderText;
  DesktopAlert.MessageText := AMessageText;
  DesktopAlert.Execute;
end;

procedure TMainForm.SetAlertLookAndFeel;
begin
  DesktopAlert.Colors.CaptionFrom := LookAndFeelManager.CaptionLightColor;
  DesktopAlert.Colors.CaptionTo := LookAndFeelManager.CaptionDarkColor;
  DesktopAlert.Colors.WindowFrom := LookAndFeelManager.WindowLightColor;
  DesktopAlert.Colors.WindowTo := LookAndFeelManager.WindowDarkColor;
end;


procedure TMainForm.ActivateHandler(HanderName: string);
begin
  ActionProcessor.ActivateHandler(HanderName);
end;

procedure TMainForm.AddCreateHandler(HandlerName: string; const ContainerCandidates: array of PClass;
  SkeletonPaintingKind: PSkeletonPaintingKind);
begin
  ActionProcessor.AddCreateHandler(HandlerName, ContainerCandidates, SkeletonPaintingKind);
end;


function TMainForm.IsModelExplorerActive: Boolean;
begin
  Result := dxDockingController.ActiveDockControl = ModelExplorerDockPanel;
end;

procedure TMainForm.ActivateWorkingAreaPanel;
begin
    dxDockingController.ActiveDockControl := WorkingAreaDockPanel;
end;

procedure TMainForm.ActivateModelExplorerPanel;
begin
    dxDockingController.ActiveDockControl := ModelExplorerDockPanel;
end;


procedure TMainForm.FileMenuClick(Sender: TObject);
begin
  if Assigned(FOnFileMenuClicked) then FOnFileMenuClicked(Sender);
end;

procedure TMainForm.EditFindDiagramsWithSelectedModelClick(Sender: TObject);
begin
  if Assigned(FOnEditFindDiagramsWithSelectedModelClicked) then
    FOnEditFindDiagramsWithSelectedModelClicked(Sender);
end;

procedure TMainForm.EditGoToPopup(Sender: TObject);
begin
  if Assigned(FOnEditGoToPopup) then FOnEditGoToPopup(Sender);
end;

procedure TMainForm.EditMenuClick(Sender: TObject);
begin
  if Assigned(FOnEditMenuClicked) then FOnEditMenuClicked(Sender);
end;

procedure TMainForm.ExclusiveFileOpenClick(Sender: TObject);
begin
  if Assigned(FOnFileMenuClicked) then FOnFileMenuClicked(Sender);
end;

procedure TMainForm.FormatMenuClick(Sender: TObject);
begin
  if Assigned(FOnFormatMenuClicked) then FOnFormatMenuClicked(Sender);
end;

procedure TMainForm.FormatCheckTypeMenuClick(Sender: TObject);
begin
  if Assigned(FOnFormatCheckTypeMenuClicked) then
    FOnFormatCheckTypeMenuClicked(Sender, (Sender as TdxBarButton).Down);
end;

procedure TMainForm.FormatFontNameComboChange(Sender: TObject);
begin
  FontFaceChanged(FormatFontNameCombo.Text);
end;

procedure TMainForm.FormatFontSizeComboChange(Sender: TObject);
begin
  try
    if FormatFontSizeCombo.Text <> '' then
      FontSizeChanged(StrToInt(FormatFontSizeCombo.Text));
  except
    MessageDlg(ERR_INVALID_VALUE, mtError, [mbOK], 0);
  end
end;

procedure TMainForm.ModelAddMenuClick(Sender: TObject);
begin
  if Assigned(FOnModelAddMenuClicked) then
    FOnModelAddMenuClicked(Sender);
end;

procedure TMainForm.ModelAddDiagramMenuClick(Sender: TObject);
begin
  if Assigned(FOnModelAddDiagramMenuClicked) then
    FOnModelAddDiagramMenuClicked(Sender);
end;

procedure TMainForm.ModelMenuClick(Sender: TObject);
begin
  if Assigned(FOnModelMenuClicked) then FOnModelMenuClicked(Sender);
end;

procedure TMainForm.ViewCheckTypeMenuClick(Sender: TObject);
begin
  if Assigned(FOnViewCheckTypeMenuClicked) then
    FOnViewCheckTypeMenuClicked(Sender, (Sender as TdxBarButton).Down);
end;

procedure TMainForm.ViewCheckTypeMenuMainFormOnlyClick(Sender: TObject);
begin
  if Sender = ViewToolbarsStandard then BarManager.Bars[STANDARD_BAR].Visible := (Sender as TdxBarButton).Down
  else if Sender = ViewToolbarsFormat then BarManager.Bars[FORMAT_BAR].Visible := (Sender as TdxBarButton).Down
  else if Sender = ViewToolbarsView then BarManager.Bars[VIEW_BAR].Visible := (Sender as TdxBarButton).Down
  else if Sender = ViewToolbarsAlignment then BarManager.Bars[ALIGNMENT_BAR].Visible := (Sender as TdxBarButton).Down
  else if Sender = ViewToolbarsStatusBar then BarManager.Bars[STATUS_BAR].Visible := (Sender as TdxBarButton).Down
end;

procedure TMainForm.ViewMenuClick(Sender: TObject);
begin
  if Assigned(FOnViewMenuClicked) then FOnViewMenuClicked(Sender);
end;

procedure TMainForm.ViewUIThemeClassicClick(Sender: TObject);
begin
  ApplyLookAndFeelStyle(lfsUltraFlat);
end;

procedure TMainForm.ViewUIThemeModernClick(Sender: TObject);
begin
  ApplyLookAndFeelStyle(lfsOffice11);
end;

procedure TMainForm.ViewUIThemeNativeClick(Sender: TObject);
begin
  ApplyLookAndFeelStyle(lfsNative);
end;

procedure TMainForm.ApplyLookAndFeelStyle(LookAndFeelStyle: TcxLookAndFeelStyle);
begin
  if LookAndFeelStyle <> BarManager.LookAndFeel.ActiveStyle then
  begin
    BarManager.LookAndFeel.SetStyle(LookAndFeelStyle);
    DockingManager.LookAndFeel.SetStyle(LookAndFeelStyle);
    LookAndFeelManager.NotifyLookAndFeelChanged;
    SetAlertLookAndFeel;
  end;
end;

procedure TMainForm.ViewZoomMenuClick(Sender: TObject);
begin
  if Sender = ViewZoom50 then ZoomChanged(50)
  else if Sender = ViewZoom75 then ZoomChanged(75)
  else if Sender = ViewZoom100 then ZoomChanged(100)
  else if Sender = ViewZoom125 then ZoomChanged(125)
  else if Sender = ViewZoom150 then ZoomChanged(150)
  else if Sender = ViewZoom175 then ZoomChanged(175)
  else if Sender = ViewZoom200 then ZoomChanged(200)
  else ZoomChanged(100);
end;

procedure TMainForm.ViewZoomComboChange(Sender: TObject);
var
  ZoomVal: Integer;
begin
  try
    ZoomVal := StrToInt(Trim(AnsiReplaceStr(ViewZoomCombo.Text, '%', '')));
    ZoomChanged(ZoomVal);
  except
    MessageDlg(ERR_INVALID_VALUE, mtError, [mbOK], 0);
  end;
end;

procedure TMainForm.ToolsMenuClick(Sender: TObject);
begin
  if Assigned(FOnToolsMenuClicked) then FOnToolsMenuClicked(Sender);
end;

procedure TMainForm.HelpMenuClick(Sender: TObject);
begin
  if Assigned(FOnHelpMenuClicked) then FOnHelpMenuClicked(Sender);
end;

procedure TMainForm.FileRecentFilesMRUClick(Sender: TObject);
var
  AFileName: string;
begin
  AFileName := FileRecentFilesMRU.Items[FileRecentFilesMRU.ItemIndex];
  if FileExists(AFileName) then begin
    if Assigned(FOnRecentFileClicked) then
      FOnRecentFileClicked(Self, AFileName);
  end
  else begin
    MessageDlg(Format(ERR_FILE_NOT_FOUND, [AFileName]), mtError, [mbOK], 0);
  end;
end;

procedure TMainForm.InspectorAttachmentButtonClick(Sender: TObject);
begin
  if Assigned(FOnInspectorAttachmentButtonClicked) then FOnInspectorAttachmentButtonClicked(Sender);
end;

procedure TMainForm.InformationMessagesButtonClick(Sender: TObject);
begin
  if Assigned(FOnInformationMessagesButtonClicked) then FOnInformationMessagesButtonClicked(Sender);
end;

procedure TMainForm.BarManagerBarVisibleChange(Sender: TdxBarManager;
  ABar: TdxBar);
begin
  if ABar = BarManager.Bars[STANDARD_BAR] then
    ViewToolbarsStandard.Down := ABar.Visible
  else if ABar = BarManager.Bars[FORMAT_BAR] then
    ViewToolbarsFormat.Down := ABar.Visible
  else if ABar = BarManager.Bars[VIEW_BAR] then
    ViewToolbarsView.Down := ABar.Visible
  else if ABar = BarManager.Bars[ALIGNMENT_BAR] then
    ViewToolbarsAlignment.Down := ABar.Visible
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  //AttachmentEditor.SetTotalImageList(TotalImageList);
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\MAINFRM.LNG');
  NLSManager.TranslateComponent(Self, [TCompactFontDialog]);
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\FONTDLG.LNG');
  NLSManager.TranslateComponent(FontDialog, []);
  Application.Title := TXT_APPLICATION_TITLE;
  Application.OnMessage := WindowsMessageHandler;
end;

procedure TMainForm.WindowsMessageHandler(var Msg: TMsg; var Handled: Boolean);
const
  RepeatKeyMask = $FFFF;
var
  Key: Word;
  Repetitions: Word;
begin
  case Msg.message of

    WM_KEYDOWN:
    begin
     Key := Msg.wParam;
     Repetitions := Msg.lParam and RepeatKeyMask;
     HandleKeyDownMessage(Key, Repetitions);
    end

  end; // End of case
end;

procedure TMainForm.HandleKeyDownMessage(Key, Repetitions: Word);
var
  DgmEditor: PDiagramEditor;
  CtrlAsyncKeyState: SHORT;
  AltAsyncKeyState: SHORT;
  IsArrowKey: Boolean;
begin
  IsArrowKey := Key in [VK_LEFT,VK_RIGHT,VK_UP,VK_DOWN];
  CtrlAsyncKeyState := GetAsyncKeyState(VK_CONTROL);
  AltAsyncKeyState := GetAsyncKeyState(VK_MENU);

  // Pressed Ctrl + Arrow
  if (CtrlAsyncKeyState <> 0) and (AltAsyncKeyState = 0) and IsArrowKey then begin
    if FHoldingKey then begin // Repetition happened, ready for speed move
      if dxDockingController.ActiveDockControl = WorkingAreaDockPanel then begin
        DgmEditor := WorkingAreaFrame.ActiveDiagramEditor;
        if DgmEditor <> nil then begin
          ActionProcessor.KeyPressedHeld(DgmEditor, DgmEditor.Canvas, Key, Repetitions);
          FSpeedMove := True; // Speed move performed
        end;
      end;
    end
    else
      FHoldingKey := True; // If first time wait for repetition
  end;
end;

procedure TMainForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  DgmEditor: PDiagramEditor;
begin
  if dxDockingController.ActiveDockControl = WorkingAreaDockPanel then begin
    DgmEditor := WorkingAreaFrame.ActiveDiagramEditor;
    if DgmEditor <> nil then
      ActionProcessor.KeyPress(DgmEditor, DgmEditor.Canvas, Key);
  end;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  DgmEditor: PDiagramEditor;
begin
  if dxDockingController.ActiveDockControl = WorkingAreaDockPanel then begin
    DgmEditor := WorkingAreaFrame.ActiveDiagramEditor;
    if DgmEditor <> nil then
      ActionProcessor.KeyDown(DgmEditor, DgmEditor.Canvas, Key, Shift);
  end;
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  DgmEditor: PDiagramEditor;
begin

  // On Key up unsetting KeyPressed handling flags
  FHoldingKey := False;
  // Moving element using pressed key was in action, no need to move element this time
  if FSpeedMove then begin
    FSpeedMove := False;
    Exit;
  end;
{
  if Key = VK_ESCAPE then begin
    if LockHandlerButton.Down then LockHandlerButton.Down := False;
  end;
}
  if dxDockingController.ActiveDockControl = WorkingAreaDockPanel then begin
    DgmEditor := WorkingAreaFrame.ActiveDiagramEditor;
    if DgmEditor <> nil then
      ActionProcessor.KeyUp(DgmEditor, DgmEditor.Canvas, Key, Shift);
  end;


end;

// TMainForm
////////////////////////////////////////////////////////////////////////////////


end.
