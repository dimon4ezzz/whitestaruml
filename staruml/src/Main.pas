unit Main;

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
  BasicClasses, GraphicClasses, Core, ExtCore, ViewCore, UMLModels, UMLViews, UMLAux,
  ClipboardMgr, UMLVerify, DiagramEditors, AttachEdt,
  Classes, Windows, Controls, Forms, Messages, dxBar, dxDockControl, dxDockPanel;

type
  // Enumeration type
  PZoomType = (ztZoomIn, ztZoomOut, ztZoomFitInWindow, ztZoomValue);

  // PMain
  PMain = class
    // {Initializations and Finalizations)
    procedure Initialize_BeforeMainFormShow;
    procedure Initialize_FirstMainFormAppears;
    procedure Initialize_WhenApplicationStartedByUser;
    procedure Finalize_BeforeMainFormClose;
    procedure Finalize_AfterMainFormClose;

    // (for Application)
    procedure ApplicationActivateHandler(Sender: TObject);
    procedure ApplicationDeactivateHandler(Sender: TObject);
    procedure ApplicationMinimizeHandler(Sender: TObject);
    procedure ApplicationRestoreHandler(Sender: TObject);
    // (for MainForm)
    procedure MainFormShowHandler(Sender: TObject);
    procedure MainFormStartedHandler(Sender: TObject);
    procedure MainFormCloseHandler(Sender: TObject; var Action: TCloseAction);
    procedure MainFormCloseQueryHandler(Sender: TObject; var CanClose: Boolean);
    procedure MainFormActivateHandler(Sender: TObject);
    procedure MainFormDeactivateHandler(Sender: TObject);
    procedure MainFormBrowserCloseHandler(Sender: TObject);
    procedure MainFormInspectorCloseHandler(Sender: TObject);
    procedure MainFormInformationCloseHandler(Sender: TObject);
    procedure MainFormFileMenuClickedHandler(Sender: TObject);
    procedure MainFormEditMenuClickedHandler(Sender: TObject);
    procedure MainFormFormatMenuClickedHandler(Sender: TObject);
    procedure MainFormFormatCheckTypeMenuClickedHandler(Sender: TObject; Checked: Boolean);
    procedure MainFormFormatFontFaceChangedHandler(Sender: TObject; FontFace: string);
    procedure MainFormFormatFontSizeChangedHandler(Sender: TObject; FontSize: Integer);
    procedure MainFormModelMenuClickedHandler(Sender: TObject);
    procedure MainFormViewMenuClickedHandler(Sender: TObject);
    procedure MainFormViewCheckTypeMenuClickedHandler(Sender: TObject; Checked: Boolean);
    procedure MainFormZoomChangedHandler(Sender: TObject; Zoom: Integer);
    procedure MainFormToolsMenuClickedHandler(Sender: TObject);
    procedure MainFormHelpMenuClickedHandler(Sender: TObject);
    procedure MainFormRecentFileClickedHandler(Sender: TObject; RecentFile: string);
    procedure MainFormRecentFileAddHandler(Sender: TObject; RecentFile: string);
    procedure MainFormInspectorAttachmentButtonClickedHandler(Sender: TObject);
    procedure MainFormInformationMessagesButtonClickedHandler(Sender: TObject);

    procedure MainFormDiagramOpenHandler(Sender: TObject; Diagram: PDiagram);
    procedure MainFormDiagramCloseHandler(Sender: TObject; Diagram: PDiagram);
    procedure MainFormActiveDockControlChangedHandler(Sender: TObject);
    procedure MainFormActiveDiagramEditorChangedHandler(Sender: TObject; DiagramEditor: PDiagramEditor);
    procedure MainFormDockPanelVisibleChangedHandler(Sender: TdxCustomDockControl);
    procedure MainFormDiagramMapFormMouseMoveHandler(Sender: TObject; DX, DY: Integer);
    procedure MainFormDiagramTabPopupMenuPopupHandler(Sender: TObject);

    procedure MainFormDiagramViewDragOveredHandler(Sender, Source: TObject; var Accept: Boolean; var Msg: string);
    procedure MainFormDiagramViewDragDropHandler(X, Y: Integer);
    procedure MainFormViewSelectingHandler(AView: PView);
    procedure MainFormViewDeselectingHandler(Sender: TObject);
    procedure MainFormAllViewsDeselectingHandler(Sender: TObject);
    procedure MainFormAdditionalViewSelectingHandler(Sender: TObject);
    procedure MainFormAreaSelectingHandler(X1, Y1, X2, Y2: Integer);
    procedure MainFormViewMovingHandler(View: PView; DX, DY: Integer);
    procedure MainFormViewContainerChangingHandler(View: PView; DX, DY: Integer; AContainerView: PView);
    procedure MainFormSelectedViewsMovingHandler(DX, DY: Integer);
    procedure MainFormSelectedViewsContainerChangingHandler(DX, DY: Integer; AContainerView: PView);
    procedure MainFormParasiticViewMovingHandler(AParasiticView: PParasiticView; DX, DY: Extended);
    procedure MainFormNodeResizingHandler(Node: PNodeView; Left, Top, Right, Bottom: Integer);
    procedure MainFormEdgeModifyingHandler(Edge: PEdgeView; Points: PPoints);
    procedure MainFormEdgeReonnectingHandler(Edge: PEdgeView; Points: PPoints; NewParticipant: PView; IsTailSide: Boolean);
    procedure MainFormViewDoubleClickedHandler(Sender: TObject; AView: PView; X, Y: Integer);
    procedure MainFormQuickDlgPopup(AView: PView; X, Y: Integer);

    procedure MainFormWMDrawClipboardHandler(var Msg: TMessage);
    procedure MainFormWMChangeCBChainHandler(var Msg: TMessage);
    procedure MainFormWMDropFilesHandler(var Msg: TWMDROPFILES);

    procedure MainFormQuickDlgGeneralNameExpressionApplyingHandler(AModel: PModel; Value: string);
    procedure MainFormQuickDlgClassifierRoleExpressionApplyingHandler(AModel: PModel; Value: string);
    procedure MainFormQuickDlgObjectExpressionApplyingHandler(AModel: PModel; Value: string);
    procedure MainFormQuickDlgAttributeExpressionApplyingHandler(AModel: PModel; Value: string);
    procedure MainFormQuickDlgOperationExpressionApplyingHandler(AModel: PModel; Value: string);
    procedure MainFormQuickDlgMessageExpressionApplyingHandler(AModel: PModel; Value: string);
    procedure MainFormQuickDlgModelCreatingHandler(Owner: PModel; ModelKind: string; Argument: Integer = 0; InsertIndex: Integer = -1);
    procedure MainFormQuickDlgModelCreatingWithNameHandler(Owner: PModel; ModelKind: string; Name: string = '');
    procedure MainFormQuickDlgElementDeletingHandler(AModel: PModel);
    procedure MainFormQuickDlgVisibilityChangedHandler(AModel: PModel; Kind: PUMLVisibilityKind);
    procedure MainFormQuickDlgAggregationKindChangingHandler(AModel: PModel; Kind: PUMLAggregationKind);
    procedure MainFormQuickDlgNavigableChangingHandler(AModel: PModel; IsNavigable: Boolean);
    procedure MainFormQuickDlgMultiplicityChangingHandler(AModel: PModel; Str: string);
    procedure MainFormQuickDlgActionKindChangingHandler(AModel: PModel; Kind: string);
    procedure MainFormQuickDlgOperationChangingHandler(AModel: PModel; AnOp: PUMLOperation);
    procedure MainFormQuickDlgSignalChangingHandler(AModel: PModel; AnOp: PUMLSignal);
    procedure MainFormQuickDlgInstantiationChangingHandler(AModel: PModel; AnOp: PUMLClassifier);
    procedure MainFormQuickDlgNoteTextChangingHandler(AView: PUMLCustomTextView; Strs: string);
    procedure MainFormQuickDlgOrderChangingHandler(AModel: PModel; AnItem: PModel; Key: string; NewOrder: Integer);
    procedure MainFormQuickDlgSeqNumberChangingHandler(AElement: PElement; ACollectionItem: PElement; Key: string; NewIndex: Integer);
    procedure MainFormQuickDlgObjectClassCreatingHandler(Owner: PUMLNamespace; AModel: PUMLModelElement; Name: string = '');
    procedure MainFormQuickDlgCallActionOperationCreatingHandler(AClassifier: PUMLClassifier; ACallAction: PUMLCallAction; Name: string = '');

    // (for InteractionManager)
    procedure InteractionManagerModelAddingHandler(Sender: TObject; ModelKind: string; Argument: Integer);
    procedure InteractionManagerDiagramAddingHandler(Sender: TObject; DiagramKind: string);
    procedure InteractionManagerExtendedModelAddingHandler(Sender: TObject; ProfileName: string; ModelPrototypeName: string);
    procedure InteractionManagerExtendedDiagramAddingHandler(Sender: TObject; ProfileName: string; DiagramTypeName: string);
    procedure InteractionManagerElementCreatingHandler(Sender: TObject; ElementKind: string; Argument: Integer; X1, Y1, X2, Y2: Integer);
    procedure InteractionManagerExtElementCreatingHandler(Sender: TObject; ProfileName: string; ElementPrototypeName: string; X1, Y1, X2, Y2: Integer);

    // (for NewProjectForm)
    procedure NewProjFormRecentFileDeleteHandler(Sender: TObject; RecentFile: string);

    // (for BrowserForm)
    procedure BrowserFormElementSelectedHandler(Sender: TObject; Element: PModel);
    procedure BrowserFormElementRelocatingHandler(Source, Target: PModel);
    procedure BrowserFormModelNameChangeHandler(Sender: TObject; Model: PModel; Name: string);
    procedure BrowserFormElementAttributeChangeHandler(Sender: TObject; Element: PElement; Key, Value: string);
    procedure BrowserFormDiagramSelectedHandler(Sender: TObject);
    procedure BrowserFormEnableGeneralEditMenu(Sender: TObject);
    procedure BrowserFormDisableGeneralEditMenu(Sender: TObject);
    procedure BrowserFormModelIndexChangingHandler(Sender: TObject; Owner: PModel; Owned: PModel; Key: string; NewOrder: Integer);

    // (for InspectorForm)
    procedure InspectorFormNameChanged(Sender: TObject; Element: PElement; Name: string);
    procedure InspectorFormAttributeChanged(Sender: TObject; Element: PElement; Key, Value: string);
    procedure InspectorFormElementsAttributeChanged(Sender: TObject; ElementSet: POrderedSet; Key, Value: string);
    procedure InspectorFormReferenceChanged(Sender: TObject; Element: PElement; Key: string; Value: PElement);
    procedure InspectorFormTypeExpressionChanged(Sender: TObject; Element: PElement; Key, TypeExpr: string; TypeRef: PElement);
    procedure InspectorFormElementsStereotypeChanged(Sender: TObject; ElementSet: POrderedSet; StereotypeProfile: string; Stereotype: string);
    procedure InspectorFormActionKindChanged(Sender: TObject; Element: PElement; ActionKind: string);
    procedure InspectorFormValueExpressionChanged(Sender: TObject; Element: PElement; Key, ValueExpr: string; ValueRef: PElement);
    procedure InspectorFormCollectionItemCreated(Sender: TObject; AOwner: PModel; ACollectionName: string; AModelType: string; Argument: Integer);
    procedure InspectorFormCollectionItemDeleted(Sender: TObject; AOwner: PModel; ACollectionName: string; AModel: PModel);
    procedure InspectorFormCollectionItemAdded(Sender: TObject; AOwner: PModel; ACollectionName: string; AModel: PModel);
    procedure InspectorFormCollectionItemRemoved(Sender: TObject; AOwner: PModel; ACollectionName: string; AModel: PModel);
    procedure InspectorFormCollectionItemOrderChanged(Sender: TObject; AOwner: PModel; ACollectionName: string; AModel: PModel; NewIdx: Integer);
    procedure InspectorFormCollectionItemSelected(Sender: TObject; AOwner: PModel; ACollectionName: string; AModel: PModel);
    procedure InspectorFormCollectionItemNameChanged(Sender: TObject; AModel: PModel; Value: string);
    procedure InspectorFormConstraintCreated(Sender: TObject; AModelElement: PUMLModelElement; AName: string; ABody: string);
    procedure InspectorFormConstraintDeleted(Sender: TObject; AModelElement: PUMLModelElement; AConstraint: PConstraint);
    procedure InspectorFormConstraintChanged(Sender: TObject; AModelElement: PUMLModelElement; AConstraint: PConstraint; AName: string; ABody: string);
    procedure InspectorFormConstraintOrderChanged(Sender: TObject; AModelElement: PUMLModelElement; AConstraint: PConstraint; NewIdx: Integer);
    procedure InspectorFormDataTaggedValueChanged(Sender: TObject; AModel: PExtensibleModel; AProfileName: string; ATagDefinitionSetName: string; AName: string; Value: string);
    procedure InspectorFormReferenceTaggedValueChanged(Sender: TObject; AModel: PExtensibleModel; AProfileName: string; ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel);
    procedure InspectorFormCollectionTaggedValueAdd(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
      ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel);
    procedure InspectorFormCollectionTaggedValueRemove(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
      ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel);
    procedure InspectorFormCollectionTaggedValueOrderChanged(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
      ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel; NewIdx: Integer);
    procedure InspectorFormSetTaggedValueAsDefault(Sender: TObject; AModel: PExtensibleModel; AProfileName: string; ATagDefinitionSetName: string; AName: string);
    procedure InspectorFormAttachmentOpen(Sender: TObject; Attachment: string; Kind: PAttachmentKind);
    procedure InspectorFormAttachmentAdd(Sender: TObject; AModel: PModel; Attachment: string);
    procedure InspectorFormAttachmentDelete(Sender: TObject; AModel: PModel; Index: Integer);
    procedure InspectorFormAttachmentChange(Sender: TObject; AModel: PModel; Index: Integer; Attachment: string);
    procedure InspectorFormAttachmentOrderChange(Sender: TObject; AModel: PModel; Index: Integer; NewIndex: Integer);
    procedure InspectorFormDocumentationChanged(Sender: TObject; Element: PModel; Documentation: string);
    procedure InspectorFormPropertySelected(Sender: TObject; PropertyName: string);

    // (for InformationForm)
    procedure InformationFormBrowseElement(Sender: TObject; Model: PModel);

    // (for ProfileManagerForm)
    procedure ProfileManagerFormProfileInclude(Sender: TObject; ProfileName: string);
    procedure ProfileManagerFormProfileExclude(Sender: TObject; ProfileName: string);

    // (for StarUMLApplication)
    procedure DocumentModifiedHandler(Sender: TObject; Document: PDocument);
    procedure DocumentSavedHandler(Sender: TObject; Document: PDocument);
    procedure ProjectOpenedHandler(Sender: TObject);
    procedure ProjectSavedHandler(Sender: TObject);
    procedure ProjectClosingHandler(Sender: TObject);
    procedure ProjectClosedHandler(Sender: TObject);
    procedure ProjectCloseQueryHandler(Sender: TObject; var CanClose: Boolean);
    procedure UnitSeparatedHandler(Sender: TObject; APackage: PUMLPackage);
    procedure UnitMergedHandler(Sender: TObject; APackage: PUMLPackage);
    procedure UnitOpenedHandler(Sender: TObject; APackage: PUMLPackage);
    procedure SavingProgressHandler(Sender: TObject; Info: string; Max, Progress: Integer);
    procedure LoadingProgressHandler(Sender: TObject; Info: string; Max, Progress: Integer);
    procedure ResolvingProgressHandler(Sender: TObject; Info: string; Max, Progress: Integer);
    procedure ElementsCreatedHandler(Sender: TObject; Models: PModelOrderedSet; Views: PViewOrderedSet);
    procedure ElementsDeletingHandler(Sender: TObject; Models: PModelOrderedSet; Views: PViewOrderedSet);
    procedure ElementsDeletedHandler(Sender: TObject);
    procedure SelectionChangedHandler(Sender: TObject);
    procedure DiagramActivatedHandler(Sender: TObject);
    procedure ViewsChangedHandler(Sender: TObject; Views: PViewOrderedSet);
    procedure ModelsChangedHandler(Sender: TObject; Models: PModelOrderedSet);
    procedure BrowseDiagramHandler(Sender: TObject; Diagram: PDiagram);
    procedure SelectModelInExplorer(Sender: TObject; Model: PModel);
    procedure ClipboardDataChangedHandler(Kind: PClipboardDataKind);
    procedure CommandHistoryChangedHandler(Sender: TObject);
    procedure BeginUpdateHandler(Sender: TObject);
    procedure EndUpdateHandler(Sender: TObject; CompletelyRebuild, UseUpdateLock: Boolean);
    procedure ProfileIncludedHandler(Sender: TObject; AProfileName: string);
    procedure ProfileExcludedHandler(Sender: TObject; AProfileName: string);

    // (for LogManager)
    procedure LogHandler(Sender: TObject; Log: string);

    // (for FindForm)
    procedure FindStarted(Sender: TObject);
    procedure FindFinished(Sender: TObject);
    procedure ModelElementFound(Sender: TObject; AModel: PModel);

    // (for UMLVerifier)
    procedure BeginVerificationHandler(Sender: TObject);
    procedure EndVerificationHandler(Sender: TObject);
    procedure BeginVerifyItemHandler(Sender: TObject; VerifyItem: PUMLVerifyItem);
    procedure EndVerifyItemHandler(Sender: TObject; VerifyItem: PUMLVerifyItem);
    procedure VerifiedHandler(Sender: TObject; VerifyItem: PUMLVerifyItem; Model: PModel);
    procedure VerificationFailedHandler(Sender: TObject; VerifyItem: PUMLVerifyItem; Model: PModel);

    // (for AddInManager)
    procedure AddInManagerMessageHandler(str: string);
  private
    // Utility Methods connecting Event Handler
    procedure ConnectHandlersOnApplicationEvents;
    procedure ConnectHandlersOnMainFormEvents;
    procedure ConnectHandlersOnNewProjectFormEvents;
    procedure ConnectHandlersOnBrowserFormEvents;
    procedure ConnectHandlersOnInspectorFormEvents;
    procedure ConnectHandlersOnInformationFormEvents;
    procedure ConnectHandlersOnStarUMLApplicationEvents;
    procedure ConnectHandlersOnProfileManagerFormEvents;
    procedure ConnectHandlersOnLogManagerEvents;
    procedure ConnectHandlersOnFindFormEvents;
    procedure ConnectHandlersOnUMLVerifierEvents;
    procedure ConnectHandlersOnInteractionManagerEvents;

    procedure ExecuteSaveAllUnits;

    // Utility Methods processing Menu Action
    procedure ExecuteFileNew;
    procedure ExecuteFileSelectProject;
    procedure ExecuteFileOpen(AFileAccessType: PFileAccessType);
    procedure ExecuteFileSave;
    procedure ExecuteFileSaveAs;
    procedure ExecuteFileClose;
    procedure ExecuteFileUnitsSeparateUnit;
    procedure ExecuteFileUnitsMergeUnit;
    procedure ExecuteFileUnitsOpenUnit;
    procedure ExecuteFileUnitsDeleteUnit;
    procedure ExecuteFileUnitsSave;
    procedure ExecuteFileUnitsSaveAs;
    procedure ExecuteFileImportFramework;
    procedure ExecuteFileImportModelFragment;
    procedure ExecuteFileExportModelFragment;
    procedure ExecuteFileExportDiagram;
    procedure ExecuteFilePrint;
    procedure ExecuteFilePageSetup;
    procedure ExecuteEditUndo;
    procedure ExecuteEditRedo;
    procedure ExecuteFormatFont;
    procedure ExecuteFormatLineColor;
    procedure ExecuteFormatFillColor;
    procedure ExecuteModelProfiles;
    procedure ExecuteViewRefresh;
    procedure ExecuteViewZoom(AType: PZoomType; ZoomValue: Integer);
    procedure ExecuteViewDiagramPageList(ABarItem: TdxBarListItem);
    procedure ExecuteToolsOptions;
    procedure ExecuteToolsAddInManager;
    function ExecuteFileOpenWithParam: Boolean;

    procedure ApplyOptionValues;

    // Auxiliary methods
    procedure PopupQuickDialog(AView: PView; X, Y: Integer; OnElementCreating: Boolean = False);
    procedure PopupQuickDialogForSubElement(OwnerModel: PModel; ModelKind: string; Argument: Integer);
    procedure ProcessDoubleClickAction(AView: PView; X, Y: Integer);
    procedure ProcessPropertyAction;
    procedure BrowseElement(AModel: PModel); overload;
    procedure BrowseElement(PathName: string); overload;
    procedure SelectModelExplorerDockPanel(AModel: PModel);
  public
    constructor Create;
    destructor Destroy; override;
  end;

  // PMainFormMenuStateHandler
  PMainFormMenuStateHandler = class
  private
    FGeneralEditMenuEnabled: Boolean;
    procedure SetGeneralEditMenuEnabled(Value: Boolean);
  public
    constructor Create;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure SetProjectOpenedGroup(Enable: Boolean);
    procedure SetDiagramActivatedGroup(Enable: Boolean);
    procedure SetViewSelectedGroup(Enable: Boolean);
    procedure SetModelSelectedGroup(Enable: Boolean);
    procedure SetUnitSelectedGroup(Enable: Boolean);
    procedure UpdateTopLevelMenus;
    procedure UpdateFileMenus;
    procedure UpdateEditMenus;
    procedure UpdateFormatMenus;
    procedure UpdateModelMenus;
    procedure UpdateViewMenus;
    procedure UpdateStatusBar;
    function IsEditDeleteFromModelEnabled: Boolean;
    function IsEditCutEnabled: Boolean;
    function IsEditCopyEnabled: Boolean;
    property GeneralEditMenuEnabled: Boolean read FGeneralEditMenuEnabled
      write SetGeneralEditMenuEnabled;
  end;

  // Miscellaneous Functions
  procedure UpdateDocumentElements;
  procedure ReloadDocumentElements;

var
  MenuStateHandler: PMainFormMenuStateHandler;
  IsPersonalEdition: Boolean;
  IsTrialEdition: Boolean;

implementation

uses
  StarUMLApp, FrwMgr, LogMgr, UMLFacto, CmdExec, HtmlHlp, ApprMgr, InteractionMgr,
  ContributorMgr, MainFrm, InspectorFrm, ColEdtFrm, AboutFrm, MessageFrame,
  ProfileMgrFrm, OptionDeps, NewProjFrm, ImportFrameworkFrm, AddInMgr, ConstEdtFrm,
  AddInMgrFrm, FindFrm, ElemSelFrm, PrintFrm, PageSetupFrm, ModelVerifierFrm,
  ElemLstFrm, DiagramMapFrm, EventPub, TagEdtFrm, TagColEdtFrm, NLS_StarUML,
  Dialogs, Math, ExtCtrls, SysUtils, Registry, Graphics, JPEG, CompactFontDlg,
  ShellAPI, ComServ, NLS, SaveDialogEx, XMLDom, MenuManager, ModelExplorerFrame,
  // for test
  ExtDlgs, JVStrings;

const
  FILE_EXT_JS = '.JS';
  FILE_EXT_VBS = '.VBS';
  SCRIPT_JS = 'JScript';
  SCRIPT_VBS = 'VBScript';

////////////////////////////////////////////////////////////////////////////////
// PMain

constructor PMain.Create;
begin
  MenuStateHandler := PMainFormMenuStateHandler.Create;
  InteractionManager := PInteractionManager.Create;

  // connect to Event-Handlers
  ConnectHandlersOnApplicationEvents;
  ConnectHandlersOnMainFormEvents;
  ConnectHandlersOnNewProjectFormEvents;
  ConnectHandlersOnBrowserFormEvents;
  ConnectHandlersOnInspectorFormEvents;
  ConnectHandlersOnInformationFormEvents;
  ConnectHandlersOnStarUMLApplicationEvents;
  ConnectHandlersOnProfileManagerFormEvents;
  ConnectHandlersOnLogManagerEvents;
  ConnectHandlersOnFindFormEvents;
  ConnectHandlersOnUMLVerifierEvents;
  ConnectHandlersOnInteractionManagerEvents;
end;

destructor PMain.Destroy;
begin
  MenuStateHandler.Free;
  InteractionManager.Free;
  inherited;
end;

procedure PMain.Initialize_BeforeMainFormShow;
begin
  ExtensionManager.LoadProfiles;
  FrameworkManager.LoadFrameworks;
  ApproachManager.LoadApproaches;
  ContributorManager.ReadContributorsFile;
  ContributorManager.LoadFromRegistry;


  MainForm.LoadFromRegistry;
  MenuStateHandler.BeginUpdate;
  MenuStateHandler.SetProjectOpenedGroup(False);
  MenuStateHandler.SetUnitSelectedGroup(False);
  MenuStateHandler.SetDiagramActivatedGroup(False);
  MenuStateHandler.SetModelSelectedGroup(False);
  MenuStateHandler.SetViewSelectedGroup(False);
  MenuStateHandler.EndUpdate;


  // Options Initialization
  OptionDepository.LoadOptionValues;
  ApplyOptionValues;
  EventPublisher.NotifyEvent(EK_OPTIONS_APPLIED);

   // GUI Initialization

  MainForm.PaletteNavBarFrame.SetSharedComponents(MainForm.ActionProcessor,MainForm.TotalImageList);
  //MainForm.LookAndFeelManager.InitLookAndFeel;
  MainForm.InspectorFrame.PropertyEditor.MainFormReady;
  InteractionManager.MenuManager := MainForm.MenuManager;
  MainForm.MenuManager.MenuFormReady;

  //MainForm.LookAndFeelManager.NotifyLookAndFeelChanged;
  MainForm.LookAndFeelManager.InitLookAndFeel;

  MainForm.ModelExplorer.ImageList := MainForm.TotalImageList;
  MainForm.ModelExplorer.StateImageList := MainForm.DocumentStateImageList;
  MainForm.ModelExplorer.PopupMenu := MainForm.ModelExplorerPopupMenu;

  MainForm.DiagramExplorer.ImageList := MainForm.TotalImageList;
  //MainForm.DiagramExplorer.PopupMenu := MainForm.DiagramExplorerPopupMenu;
  MainForm.DiagramExplorer.PopupMenu := MainForm.MenuManager.GetContextMenu(DIAGRAM_EXPLORER_CONTEXT_MENU);

  MainForm.AttachmentEditor.ImageList := MainForm.TotalImageList;

  //-- MainForm.InformationFrame.MessagePanel.PopupMenu := MainForm.MessagesPopupMenu;
  //MainForm.MessagePanel.PopupMenu := MainForm.MessagesPopupMenu;
  MainForm.MessagePanel.PopupMenu := MainForm.MenuManager.GetContextMenu(MESSAGE_PANEL_CONTEXT_MENU);

  ElementSelectorForm.ImageList := MainForm.TotalImageList;
  ElementListForm.ImageList := MainForm.TotalImageList;
  //MainForm.AttachmentEditor.PopupMenu := MainForm.AttachmentsPopupMenu;
  MainForm.AttachmentEditor.PopupMenu := MainForm.MenuManager.GetContextMenu(ATTACHMENT_EDITOR_CONTEXT_MENU);
  CollectionEditorForm.ImageList := MainForm.TotalImageList;
  TaggedValueCollectionEditorForm.ImageList := MainForm.TotalImageList;

  MainForm.InspectorFrame.InitializeUserInterfaces;
  MainForm.AttachmentEditor.InitializeUserInterface;


  // GUI Interactions Setup
  InteractionManager.BuildInteractions;

  // Re-Translate MainForm.BarManager (BarManager¿« Bars[].Caption¿Ã Registryø°
  // (therefore stored, must retranslate after loading from registry)
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\MAINFRM.LNG');
  NLSManager.ReadComponentTranslation('MainForm', MainForm.BarManager);


  // Application Initialization
  StarUMLApplication.Initialize;
end;

procedure PMain.Initialize_FirstMainFormAppears;
begin
  // Add-Ins Loading
  AddInManager := PAddInManager.Create;
  AddInManager.OnMessage := AddInManagerMessageHandler;
  AddInManager.LoadAddIns;

  // executions in same time program starting
  MainForm.LoadWindowPositionFromRegistry;
  MenuStateHandler.BeginUpdate;
  if Assigned(StarUMLApplication.Project) then begin // added for Add-In
    MenuStateHandler.SetProjectOpenedGroup(False);
    MenuStateHandler.SetProjectOpenedGroup(True);
  end;
  if Assigned(StarUMLApplication.ActiveDiagram) then begin // added for Add-In
    MenuStateHandler.SetDiagramActivatedGroup(False);
    MenuStateHandler.SetDiagramActivatedGroup(True);
  end;
  MenuStateHandler.UpdateTopLevelMenus;
  MenuStateHandler.UpdateFileMenus;
  MenuStateHandler.UpdateEditMenus;
  MenuStateHandler.UpdateFormatMenus;
  MenuStateHandler.UpdateModelMenus;
  MenuStateHandler.UpdateStatusBar;
  //MenuStateHandler.UpdateViewMenus;
  MenuStateHandler.EndUpdate;

  if (ComServer.StartMode = smStandalone) then
    Initialize_WhenApplicationStartedByUser;

  DragAcceptFiles(MainForm.Handle, True);
end;

procedure PMain.Initialize_WhenApplicationStartedByUser;
begin
  if not ExecuteFileOpenWithParam then
  begin
    if OptionDepository.ShowNewDialog then
        ExecuteFileSelectProject;
  end;
end;

procedure PMain.Finalize_BeforeMainFormClose;
begin
  //StarUMLApplication.Finalize;

  OptionDepository.SaveOptionValues;

  //-- MainForm.BrowserFrame.OnElementSelected := nil;
  MainForm.ModelExplorer.OnElementSelected := nil;
  MainForm.DiagramExplorer.OnElementSelected := nil;

  // Release Resources
  AddInManager.Free;
  MainForm.SaveToRegistry;
  ContributorManager.SaveToRegistry;
end;

procedure PMain.Finalize_AfterMainFormClose;
begin
  StarUMLApplication.Finalize;
end;

procedure PMain.ApplicationActivateHandler(Sender: TObject);
begin
  try
    ReloadDocumentElements;
    UpdateDocumentElements;
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateFileMenus;
    MenuStateHandler.UpdateEditMenus;
    MenuStateHandler.UpdateStatusBar;
    MenuStateHandler.EndUpdate;
    EventPublisher.NotifyEvent(EK_APPLICATION_ACTIVATE);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ApplicationDeactivateHandler(Sender: TObject);
begin
  try
    EventPublisher.NotifyEvent(EK_APPLICATION_DEACTIVATE);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ApplicationMinimizeHandler(Sender: TObject);
begin
  try
    EventPublisher.NotifyEvent(EK_APPLICATION_MINIMIZE);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ApplicationRestoreHandler(Sender: TObject);
begin
  try
    ReloadDocumentElements;
    UpdateDocumentElements;
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateEditMenus;
    MenuStateHandler.EndUpdate;
    EventPublisher.NotifyEvent(EK_APPLICATION_RESTORE);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormShowHandler(Sender: TObject);
begin
  // Empty.
  Initialize_FirstMainFormAppears;
end;

procedure PMain.MainFormStartedHandler(Sender: TObject);
begin
  //Initialize_FirstMainFormAppears;
end;

procedure PMain.MainFormCloseHandler(Sender: TObject; var Action: TCloseAction);
begin
  Finalize_BeforeMainFormClose;
  Action := caFree;
end;

procedure PMain.MainFormCloseQueryHandler(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := StarUMLApplication.CloseProject;
end;

procedure PMain.MainFormActivateHandler(Sender: TObject);
begin
  try
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateEditMenus;
    MenuStateHandler.EndUpdate;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormDeactivateHandler(Sender: TObject);
begin
  try
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateEditMenus;
    MenuStateHandler.EndUpdate;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormBrowserCloseHandler(Sender: TObject);
begin
  try
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateViewMenus;
    MenuStateHandler.EndUpdate;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormInspectorCloseHandler(Sender: TObject);
begin
  try
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateViewMenus;
    MenuStateHandler.EndUpdate;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormInformationCloseHandler(Sender: TObject);
begin
  try
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateViewMenus;
    MenuStateHandler.EndUpdate;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormFileMenuClickedHandler(Sender: TObject);
begin
  try
    with MainForm do begin
      if Sender = FileCreate then ExecuteFileNew
      else if Sender = FileNew then ExecuteFileNew
      else if Sender = FileSelectProject then ExecuteFileSelectProject
      else if Sender = FileOpen then ExecuteFileOpen(fatNormal)
      else if Sender = ExclusiveFileOpen then ExecuteFileOpen(fatExclusive)
      else if Sender = FileSave then ExecuteFileSave
      else if Sender = FileSaveAs then ExecuteFileSaveAs
      else if Sender = FileClose then ExecuteFileClose
      else if Sender = FileUnitsSeparateUnit then begin
        // BEGIN (PERSONAL EDITION TEMPORAL CODE)
        if IsPersonalEdition then begin
          MessageDlg(MSG_PERSONAL_EDITION_IS_NOT_ALLOWED, mtInformation, [mbOK], 0);
          Exit;
        end;
        // END (PERSONAL EDITION TEMPORAL CODE)
        ExecuteFileUnitsSeparateUnit;
      end
      else if Sender = FileUnitsMergeUnit then begin
        // BEGIN (PERSONAL EDITION TEMPORAL CODE)
        if IsPersonalEdition then begin
          MessageDlg(MSG_PERSONAL_EDITION_IS_NOT_ALLOWED, mtInformation, [mbOK], 0);
          Exit;
        end;
        // END (PERSONAL EDITION TEMPORAL CODE)
        ExecuteFileUnitsMergeUnit;
      end
      else if Sender = FileUnitsDeleteUnit then begin
        // BEGIN (PERSONAL EDITION TEMPORAL CODE)
        if IsPersonalEdition then begin
          MessageDlg(MSG_PERSONAL_EDITION_IS_NOT_ALLOWED, mtInformation, [mbOK], 0);
          Exit;
        end;
        // END (PERSONAL EDITION TEMPORAL CODE)
        ExecuteFileUnitsDeleteUnit;
      end
      else if Sender = FileUnitsSave then begin
        // BEGIN (PERSONAL EDITION TEMPORAL CODE)
        if IsPersonalEdition then begin
          MessageDlg(MSG_PERSONAL_EDITION_IS_NOT_ALLOWED, mtInformation, [mbOK], 0);
          Exit;
        end;
        // END (PERSONAL EDITION TEMPORAL CODE)
        ExecuteFileUnitsSave;
      end
      else if Sender = FileUnitsSaveAs then begin
        // BEGIN (PERSONAL EDITION TEMPORAL CODE)
        if IsPersonalEdition then begin
          MessageDlg(MSG_PERSONAL_EDITION_IS_NOT_ALLOWED, mtInformation, [mbOK], 0);
          Exit;
        end;
        // END (PERSONAL EDITION TEMPORAL CODE)
        ExecuteFileUnitsSaveAs;
      end
      else if Sender = FileImportModelFragment then begin
        // BEGIN (PERSONAL EDITION TEMPORAL CODE)
        if IsPersonalEdition then begin
          MessageDlg(MSG_PERSONAL_EDITION_IS_NOT_ALLOWED, mtInformation, [mbOK], 0);
          Exit;
        end;
        // END (PERSONAL EDITION TEMPORAL CODE)
        ExecuteFileImportModelFragment;
      end
      else if Sender = FileImportFramework then ExecuteFileImportFramework
      else if Sender = FileExportModelFragment then begin
        // BEGIN (PERSONAL EDITION TEMPORAL CODE)
        if IsPersonalEdition then begin
          MessageDlg(MSG_PERSONAL_EDITION_IS_NOT_ALLOWED, mtInformation, [mbOK], 0);
          Exit;
        end;
        // END (PERSONAL EDITION TEMPORAL CODE)
        ExecuteFileExportModelFragment;
      end
      else if Sender = FileExportDiagram then ExecuteFileExportDiagram
      else if Sender = FilePrint then ExecuteFilePrint
      else if Sender = FilePageSetup then ExecuteFilePageSetup
      else if Sender = FileExit then MainForm.Close;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormEditMenuClickedHandler(Sender: TObject);
begin
  try
    with MainForm do begin
           if Sender = EditUndo                then ExecuteEditUndo
      else if Sender = EditRedo                then ExecuteEditRedo
      else if Sender = EditCut                 then StarUMLApplication.Cut
      else if Sender = EditCopy                then StarUMLApplication.Copy
      else if Sender = EditCopyDiagram         then StarUMLApplication.CopyActiveDiagram
      else if Sender = EditCopyDiagramAsBitmap then StarUMLApplication.CopyActiveDiagramAsBitmap
      else if Sender = EditPaste               then StarUMLApplication.Paste
      else if Sender = EditDelete              then StarUMLApplication.DeleteSelectedViews
      else if Sender = EditDeleteFromModel     then StarUMLApplication.DeleteSelectedViewsWithModels
      else if Sender = EditFind                then FindForm.Execute
      else if Sender = EditSelectAll           then StarUMLApplication.SelectAll;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormFormatMenuClickedHandler(Sender: TObject);
begin
  try
    with MainForm do begin
      if Sender = FormatFont then ExecuteFormatFont
      else if Sender = FormatLineColor then ExecuteFormatLineColor
      else if Sender = FormatFillColor then ExecuteFormatFillColor
      else if Sender = FormatLineStyleRectilinear then
        StarUMLApplication.ChangeSelectedEdgesLineStyle(lsRectilinear)
      else if Sender = FormatLineStyleOblique then
        StarUMLApplication.ChangeSelectedEdgesLineStyle(lsOblique)
      else if Sender = FormatStereotypeDisplayNone then
        StarUMLApplication.ChangeSelectedViewsAttribute('StereotypeDisplay', 'sdkNone')
      else if Sender = FormatStereotypeDisplayText then
        StarUMLApplication.ChangeSelectedViewsAttribute('StereotypeDisplay', 'sdkLabel')
      else if Sender = FormatStereotypeDisplayIcon then
        StarUMLApplication.ChangeSelectedViewsAttribute('StereotypeDisplay', 'sdkIcon')
      else if Sender = FormatStereotypeDisplayDecoration then
        StarUMLApplication.ChangeSelectedViewsAttribute('StereotypeDisplay', 'sdkDecoration')
      else if Sender = FormatAlignmentSendToBack then
      begin
        if (StarUMLApplication.ActiveDiagram is PUMLSequenceDiagramView) or
           (StarUMLApplication.ActiveDiagram is PUMLSequenceRoleDiagramView)
        then
          MessageDlg(ERR_SEQ_DGM_CMD_NOT_SUPPORT, mtError, [mbOK], 0)
        else
          StarUMLApplication.SendToBackSelectedViews;
      end
      else if Sender = FormatAlignmentBringToFront then
      begin
        if (StarUMLApplication.ActiveDiagram is PUMLSequenceDiagramView) or
           (StarUMLApplication.ActiveDiagram is PUMLSequenceRoleDiagramView)
        then
          MessageDlg(ERR_SEQ_DGM_CMD_NOT_SUPPORT, mtError, [mbOK], 0)
        else
          StarUMLApplication.BringToFrontSelectedViews;
      end
      else if Sender = FormatAlignmentLeft then
        StarUMLApplication.AlignLeftSelectedViews
      else if Sender = FormatAlignmentRight then
        StarUMLApplication.AlignRightSelectedViews
      else if Sender = FormatAlignmentMiddle then
        StarUMLApplication.AlignMiddleSelectedViews
      else if Sender = FormatAlignmentTop then
        StarUMLApplication.AlignTopSelectedViews
      else if Sender = FormatAlignmentBottom then
        StarUMLApplication.AlignBottomSelectedViews
      else if Sender = FormatAlignmentCenter then
        StarUMLApplication.AlignCenterSelectedViews
      else if Sender = FormatAlignmentSpaceEvenlyHorizontally then
        StarUMLApplication.AlignSpaceEvenlyHorizontallySelectedViews
      else if Sender = FormatAlignmentSpaceEvenlyVertically then
        StarUMLApplication.AlignSpaceEvenlyVerticallySelectedViews
      else if Sender = FormatLayoutDiagram then
        StarUMLApplication.LayoutActiveDiagramWithValidation
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormFormatCheckTypeMenuClickedHandler(Sender: TObject; Checked: Boolean);
var
  Str: string;
begin
  try
    Str := BooleanToString(Checked);
    with MainForm do begin
      if Sender = FormatSuppressAttributes then
        StarUMLApplication.ChangeSelectedViewsAttribute('SuppressAttributes', Str)
      else if Sender = FormatSuppressOperations then
        StarUMLApplication.ChangeSelectedViewsAttribute('SuppressOperations', Str)
      else if Sender = FormatSuppressEnumerationLiterals then
        StarUMLApplication.ChangeSelectedViewsAttribute('SuppressLiterals', Str)
      else if Sender = FormatWordWrap then
        StarUMLApplication.ChangeSelectedViewsAttribute('WordWrap', Str)
      else if Sender = FormatShowParentName then
        StarUMLApplication.ChangeSelectedViewsAttribute('ShowParentName', Str)
      else if Sender = FormatShowOperationSignature then
        StarUMLApplication.ChangeSelectedViewsAttribute('ShowOperationSignature', Str)
      else if Sender = FormatShowProperty then
        StarUMLApplication.ChangeSelectedViewsAttribute('ShowProperty', Str)
      else if Sender = FormatShowCompartmentVisibility then
        StarUMLApplication.ChangeSelectedViewsAttribute('ShowCompartmentVisibility', Str)
      else if Sender = FormatShowCompartmentStereotype then
        StarUMLApplication.ChangeSelectedViewsAttribute('ShowCompartmentStereotype', Str)
      else if Sender = FormatAutoResize then
        StarUMLApplication.ChangeSelectedViewsAttribute('AutoResize', Str)
      else if Sender = FormatShowExtendedNotation then
        StarUMLApplication.ChangeSelectedViewsAttribute('ShowExtendedNotation', Str);
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormFormatFontFaceChangedHandler(Sender: TObject; FontFace: string);
begin
  try
    StarUMLApplication.ChangeSelectedViewsFontFace(FontFace);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormFormatFontSizeChangedHandler(Sender: TObject; FontSize: Integer);
begin
  try
    StarUMLApplication.ChangeSelectedViewsFontSize(FontSize);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormModelMenuClickedHandler(Sender: TObject);
begin
  try
    with MainForm do begin
      if Sender = ModelCollectionEditor then
      begin
        if (StarUMLApplication.SelectedModelCount = 1) and
           (StarUMLApplication.SelectedModels[0] is PExtensibleModel)
        then
          //-- MainForm.InspectorFrame.ShowCollectionEditor
          CollectionEditorForm.ShowCollection(StarUMLApplication.SelectedModels[0])
        else
          MessageDlg(ERR_DIAGRAM_NO_COLLECTIONS, mtError, [mbOK], 0);
      end
      else if Sender = ModelConstraints then
      begin
        if (StarUMLApplication.SelectedModelCount = 1) and
           (StarUMLApplication.SelectedModels[0] is PExtensibleModel)
        then begin
          //-- MainForm.InspectorFrame.ShowConstraintsEditor
          ConstraintEditorForm.UpdateConstraints;
          ConstraintEditorForm.Show;
          //--
        end
        else
          MessageDlg(ERR_DIAGRAM_NO_CONSTRAINTS, mtError, [mbOK], 0);
      end
      else if Sender = ModelTaggedValues then
      begin
        if (StarUMLApplication.SelectedModelCount = 1) and
           (StarUMLApplication.SelectedModels[0] is PExtensibleModel)
        then
          //-- MainForm.InspectorFrame.ShowTaggedValuesEditor
          TaggedValueEditorForm.ShowTaggedValues(StarUMLApplication.SelectedModels[0] as PExtensibleModel)
        else
          MessageDlg(ERR_DIAGRAM_NO_TAGGEDVALUES, mtError, [mbOK], 0);
      end
      else if Sender = ModelProfiles then
      begin
        ExecuteModelProfiles;
      end
      else if Sender = ModelModelVerification then
      begin
        // BEGIN (PERSONAL EDITION TEMPORAL CODE)
        if IsPersonalEdition then begin
          MessageDlg(MSG_PERSONAL_EDITION_IS_NOT_ALLOWED, mtInformation, [mbOK], 0);
          Exit;
        end;
        // END (PERSONAL EDITION TEMPORAL CODE)
        ModelVerifierForm.ShowModal;
      end
      else if Sender = ModelProperty then
      begin
        ProcessPropertyAction;
      end;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormViewMenuClickedHandler(Sender: TObject);
begin
  try
    with MainForm do begin
      if Sender = ViewCloseDiagram then begin
        MainForm.WorkingAreaFrame.CloseActiveDiagram;
      end
      else if Sender = ViewCloseAllDiagrams then begin
        MainForm.WorkingAreaFrame.CloseAllDiagrams;
      end
      else if Sender = ViewSelectInModelExplorer then begin
        if MainForm.ModelExplorerDockPanel.Visible then
        begin
          dxDockingController.ActiveDockControl := MainForm.ModelExplorerDockPanel;
          MainForm.ModelExplorer.SelectWithFocus(StarUMLApplication.SelectedModels[0]);
        end;
      end
      else if Sender = ViewRefresh then ExecuteViewRefresh
      else if Sender = ViewZoomZoomIn then ExecuteViewZoom(ztZoomIn, 0)
      else if Sender = ViewZoomZoomOut then ExecuteViewZoom(ztZoomOut, 0)
      else if Sender = ViewZoomFitInWindow then ExecuteViewZoom(ztZoomFitInWindow, 0)
      else if Sender = ViewDiagramPageList then
        ExecuteViewDiagramPageList(Sender as TdxBarListItem);
    end;

    with MainForm.WorkingAreaFrame do begin
      if Sender = ViewRefresh then
        ExecuteViewRefresh;
    end;

  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormViewCheckTypeMenuClickedHandler(Sender: TObject; Checked: Boolean);

  function IsDockPanelVisibleMenu(Obj: TObject): Boolean;
  begin
    with MainForm do
      Result := (Obj = ViewModelExplorer) or (Obj = ViewDiagramExplorer)
        or (Obj = ViewPropertyEditor) or (Obj = ViewDocumentationEditor)
        or (Obj = ViewAttachmentEditor) or (Obj = ViewOutputWindow)
        or (Obj = ViewMessageWindow) or (Obj = ViewToolbox);
  end;

var
  TargetDockPanel: TdxDockPanel;
begin
  try
    with MainForm do begin
      if IsDockPanelVisibleMenu(Sender) then begin
        TargetDockPanel := nil;
        if Sender = ViewModelExplorer            then TargetDockPanel := ModelExplorerDockPanel
        else if Sender = ViewDiagramExplorer     then TargetDockPanel := DiagramExplorerDockPanel
        else if Sender = ViewPropertyEditor      then TargetDockPanel := PropertiesDockPanel
        else if Sender = ViewDocumentationEditor then TargetDockPanel := DocumentationDockPanel
        else if Sender = ViewAttachmentEditor    then TargetDockPanel := AttachmentsDockPanel
        else if Sender = ViewOutputWindow        then TargetDockPanel := OutputDockPanel
        else if Sender = ViewMessageWindow       then TargetDockPanel := MessageDockPanel
        else if Sender = ViewToolbox             then TargetDockPanel := ToolboxDockPanel;
        if TargetDockPanel <> nil then begin
          if TargetDockPanel.AutoHide then
            TargetDockPanel.AutoHide := False;
          TargetDockPanel.Visible := Checked;
        end;
      end;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormZoomChangedHandler(Sender: TObject; Zoom: Integer);
begin
  try
    ExecuteViewZoom(ztZoomValue, Zoom);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormToolsMenuClickedHandler(Sender: TObject);
begin
  try
    with MainForm do begin
      if Sender = ToolsOptions then ExecuteToolsOptions
      else if Sender = ToolsAddInManager then ExecuteToolsAddInManager;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormHelpMenuClickedHandler(Sender: TObject);
begin
  try
    with MainForm do begin
      if Sender = HelpContents then begin
        ShowStarUMLHelpPage;
      end
      {else if Sender = HelpStarUMLOnTheWeb then begin
        ShellExecute(0, 'open', 'http://www.staruml.com', '', '', SW_SHOWNORMAL);
      end}
      else if Sender = HelpAbout then begin
        AboutForm.ShowModal;
      end
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormRecentFileClickedHandler(Sender: TObject; RecentFile: string);
begin
  try
    StarUMLApplication.OpenProject(RecentFile,fatNormal);
    MainForm.WorkingAreaFrame.OpenAllDefaultDiagrams;
    MainForm.AddRecentFile(StarUMLApplication.FileName);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InteractionManagerModelAddingHandler(Sender: TObject; ModelKind: string; Argument: Integer);
var
  Owner: PModel;
begin
  try
    Owner := StarUMLApplication.SelectedModels[0];
    StarUMLApplication.NewModel(Owner, ModelKind, Argument);
    // set created element(TreeNode)'s name editable
    if MainForm.ModelExplorerDockPanel.Visible then
      MainForm.ModelExplorer.SetNameEditingMode(nil);
    PopupQuickDialogForSubElement(Owner, ModelKind, Argument);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InteractionManagerDiagramAddingHandler(Sender: TObject; DiagramKind: string);
var
  Owner: PModel;
begin
  try
    Owner := StarUMLApplication.SelectedModels[0];
    StarUMLApplication.NewDiagram(Owner, DiagramKind);
    // set created element(TreeNode)'s name editable
    MainForm.ModelExplorer.SetNameEditingMode(nil);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InteractionManagerExtendedModelAddingHandler(Sender: TObject; ProfileName: string; ModelPrototypeName: string);
var
  Owner: PModel;
  ModelPrototype: PModelPrototype;
begin
  try
    Owner := StarUMLApplication.SelectedModels[0];
    ModelPrototype := ExtensionManager.FindModelPrototype(ProfileName, ModelPrototypeName);
    if ModelPrototype <> nil then begin
      StarUMLApplication.NewExtendedModel(Owner, ProfileName, ModelPrototype.Name);
      // set created element(TreeNode)'s name editable
      MainForm.ModelExplorer.SetNameEditingMode(nil);
      PopupQuickDialogForSubElement(Owner, ModelPrototype.BaseModel, ModelPrototype.Argument);
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InteractionManagerExtendedDiagramAddingHandler(Sender: TObject; ProfileName: string; DiagramTypeName: string);
var
  DiagramType: PDiagramType;
  Owner: PModel;
begin
  try
    Owner := StarUMLApplication.SelectedModels[0];
    DiagramType := ExtensionManager.FindDiagramType(ProfileName, DiagramTypeName);
    if DiagramType <> nil then begin
      StarUMLApplication.NewExtendedDiagram(Owner, ProfileName, DiagramTypeName);
      // set created element(TreeNode)'s name editable
      MainForm.ModelExplorer.SetNameEditingMode(nil);
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InteractionManagerElementCreatingHandler(Sender: TObject; ElementKind: string;
  Argument: Integer; X1, Y1, X2, Y2: Integer);
var
  V: PView;
  // for test
  ImageDlg: TOpenPictureDialog;
  Stream: TStringStream;
  Bitmap: TBitmap;
  Metafile: TMetafile;
  FileExt: string;
begin
  try
    if StarUMLApplication.ActiveDiagram <> nil then begin
      V := StarUMLApplication.NewElement(StarUMLApplication.ActiveDiagram, X1, Y1, X2, Y2, ElementKind, Argument);

      // for test
      if V is PImageView then begin
        ImageDlg := TOpenPictureDialog.Create(Application);
        ImageDlg.Filter := 'All image files (*.bmp;*.emf;*.wmf)|*.bmp;*.emf;*.wmf';
        if ImageDlg.Execute then begin
          Stream := TStringStream.Create('');
          FileExt := LowerCase(ExtractFileExt(ImageDlg.FileName));
          if (FileExt = '.emf') or (FileExt = '.wmf') then begin
            Metafile := TMetafile.Create;
            Metafile.LoadFromFile(ImageDlg.FileName);
            Metafile.SaveToStream(Stream);
            StarUMLApplication.ChangeViewAttribute(V, 'Type_', 'ikMetafile');
            StarUMLApplication.ChangeViewAttribute(V, 'ImageData', B64Encode(Stream.DataString));
            Metafile.Free;
          end
          else if FileExt = '.bmp' then begin
            Bitmap := TBitmap.Create;
            Bitmap.LoadFromFile(ImageDlg.FileName);
            Bitmap.SaveToStream(Stream);
            StarUMLApplication.ChangeViewAttribute(V, 'Type_', 'ikBitmap');
            StarUMLApplication.ChangeViewAttribute(V, 'ImageData', B64Encode(Stream.DataString));
            Bitmap.Free;
          end;
          Stream.Free;
        end;
      end;

      if V <> nil then
        PopupQuickDialog(V, X1, Y1, True);
    end;
  except on
    //E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
    E: Exception do MainForm.ShowAlertMsg(C_ERR_DIAGRAM,E.Message);
  end;
end;

procedure PMain.InteractionManagerExtElementCreatingHandler(Sender: TObject;
  ProfileName: string; ElementPrototypeName: string; X1, Y1, X2, Y2: Integer);
var
  V: PView;
begin
  try
    if StarUMLApplication.ActiveDiagram <> nil then begin
      V := StarUMLApplication.NewExtendedElement(StarUMLApplication.ActiveDiagram, X1, Y1, X2, Y2, ProfileName, ElementPrototypeName);
      if V <> nil then
        PopupQuickDialog(V, X1, Y1, True);
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.NewProjFormRecentFileDeleteHandler(Sender: TObject; RecentFile: string);
begin
  MainForm.DeleteRecentFile(RecentFile);
end;

procedure PMain.MainFormRecentFileAddHandler(Sender: TObject; RecentFile: string);
begin
  NewProjectForm.AddRecentFile(RecentFile);
end;

procedure PMain.MainFormInspectorAttachmentButtonClickedHandler(Sender: TObject);
begin
  try
    with MainForm do begin
      if Sender = InspectorAttachmentOpen then
        MainForm.AttachmentEditor.OpenAttachment
      else if Sender = InspectorAttachmentAdd then
        MainForm.AttachmentEditor.AddAttachment
      else if Sender = InspectorAttachmentDelete then
        MainForm.AttachmentEditor.DeleteAttachment
      else if Sender = InspectorAttachmentEdit then
        MainForm.AttachmentEditor.EditAttachment
      else if Sender = InspectorAttachmentMoveUp then
        MainForm.AttachmentEditor.MoveUpItem
      else if Sender = InspectorAttachmentMoveDown then
        MainForm.AttachmentEditor.MoveDownItem;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormInformationMessagesButtonClickedHandler(Sender: TObject);
begin
  try
    with MainForm do begin
      if Sender = MessagesClearAll then
        //-- MainForm.InformationFrame.ClearAllMessages
        MainForm.MessagePanel.ClearAllMessages
      else if Sender = MessagesClearFindResults then
        //-- MainForm.InformationFrame.ClearMessages(mkFindResult)
        MainForm.MessagePanel.ClearMessages(mkFindResult)
      else if Sender = MessagesClearVerificationResults then
        //-- MainForm.InformationFrame.ClearMessages(mkVerificationResult)
        MainForm.MessagePanel.ClearMessages(mkVerificationResult)
      else if Sender = MessagesSaveMessages then begin
        try
          if MainForm.MessagePanel.SaveMessagesDialog.Execute then
            //--MainForm.InformationFrame.SaveMessages(MainForm.InformationFrame.SaveMessagesDialog.FileName);
            MainForm.MessagePanel.SaveMessages(MainForm.MessagePanel.SaveMessagesDialog.FileName);
        except
          on SaveDialogEx.EDirectoryNotFound do MessageDlg(ERR_DIRECTORY_NOT_FOUND, mtError, [mbOK], 0);
          on SaveDialogEx.EInvalidFileName do MessageDlg(ERR_INVALID_FILE_NAME, mtError, [mbOK], 0);
        end;
      end;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormDiagramOpenHandler(Sender: TObject; Diagram: PDiagram);
begin
  try
    if MainForm.WorkingAreaFrame.OpenedDiagramCount = 1 then begin
      MenuStateHandler.BeginUpdate;
      MenuStateHandler.UpdateFileMenus;
      MenuStateHandler.UpdateEditMenus;
      MenuStateHandler.EndUpdate;
      InteractionManager.ChangePaletteVisibility(Diagram as PUMLDiagram);
    end;
    MainForm.PaletteNavBarFrame.ActivateSelectHandler(false);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormDiagramCloseHandler(Sender: TObject; Diagram: PDiagram);
begin
  try
    if MainForm.WorkingAreaFrame.OpenedDiagramCount = 1 then
      InteractionManager.ChangePaletteVisibility(nil);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormActiveDockControlChangedHandler(Sender: TObject);
begin
  try
    MenuStateHandler.BeginUpdate;
    // General Edit Menu Status Setting
    MenuStateHandler.GeneralEditMenuEnabled := True;
    if (dxDockingController.ActiveDockControl = MainForm.PropertiesDockPanel) or
       (dxDockingController.ActiveDockControl = MainForm.DocumentationDockPanel) or
       (dxDockingController.ActiveDockControl = MainForm.AttachmentsDockPanel) then
    begin
      MenuStateHandler.GeneralEditMenuEnabled := False;
    end;
    // Update Menus
    MenuStateHandler.UpdateFileMenus;
    MenuStateHandler.UpdateEditMenus;
    MenuStateHandler.EndUpdate;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormActiveDiagramEditorChangedHandler(Sender: TObject; DiagramEditor: PDiagramEditor);
begin
  try
    if DiagramEditor <> nil then
    begin
      StarUMLApplication.ActiveDiagram := DiagramEditor.DiagramView;
      MainForm.PaletteNavBarFrame.ActivateSelectHandler(false);
      InteractionManager.ChangePaletteVisibility(DiagramEditor.DiagramView.Diagram as PUMLDiagram);
      MenuStateHandler.BeginUpdate;
      MenuStateHandler.UpdateViewMenus;
      MenuStateHandler.EndUpdate;
    end
    else begin
      StarUMLApplication.ActiveDiagram := nil;
    end;
    // show diagram name/pathname on DockPanel Caption
    if DiagramEditor <> nil then
    begin
      MainForm.WorkingAreaDockPanel.Caption :=
        StarUMLApplication.ActiveDiagram.Diagram.Name +
        ' (' + ExtractTailPath(StarUMLApplication.ActiveDiagram.Diagram.DiagramOwner.Pathname) + ')';
    end
    else
      MainForm.WorkingAreaDockPanel.Caption := '';
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormDockPanelVisibleChangedHandler(Sender: TdxCustomDockControl);
begin
  MenuStateHandler.UpdateViewMenus;
end;

procedure PMain.MainFormDiagramMapFormMouseMoveHandler(Sender: TObject; DX, DY: Integer);
begin
  if MainForm.WorkingAreaFrame.ActiveDiagramEditor <> nil then begin
    MainForm.WorkingAreaFrame.ActiveDiagramEditor.ScrollBy(DX, DY);
  end;
end;

procedure PMain.MainFormDiagramTabPopupMenuPopupHandler(Sender: TObject);
var
  I: Integer;
  D: PDiagram;
begin
  MainForm.ViewDiagramPageList.Items.Clear;
  for I := 0 to MainForm.WorkingAreaFrame.OpenedDiagramCount - 1 do
  begin
    D := MainForm.WorkingAreaFrame.OpenedDiagrams[I];
    MainForm.ViewDiagramPageList.Items.AddObject(D.Name
      + ' (' + ExtractTailPath(D.DiagramOwner.Pathname) + ')' , D);
    if MainForm.WorkingAreaFrame.ActiveDiagram = D then
      MainForm.ViewDiagramPageList.ItemIndex := I;
  end;
end;

procedure PMain.MainFormDiagramViewDragOveredHandler(Sender, Source: TObject; var Accept: Boolean; var Msg: string);
var
  DragSource: PModel;
  DropTarget: PDiagramView;
begin
  try
    if Source <> MainForm.ModelExplorer then begin
      Accept := False;
      Exit;
    end;

    // PRECONDITION
    Assert(StarUMLApplication.SelectedModelCount = 1);
    Assert(StarUMLApplication.ActiveDiagram <> nil);
    // PRECONDITION
    DragSource := StarUMLApplication.SelectedModels[0];
    DropTarget := StarUMLApplication.ActiveDiagram;
    Accept := DropTarget.CanAcceptModel(DragSource);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormDiagramViewDragDropHandler(X, Y: Integer);
var
  AModel: PModel;
begin
  try
    // PRECONDITION
    Assert(StarUMLApplication.SelectedModelCount = 1);
    // PRECONDITION
    if StarUMLApplication.SelectedModelCount = 1 then begin
      AModel := StarUMLApplication.SelectedModels[0];
      StarUMLApplication.NewViewByDragDrop(StarUMLApplication.ActiveDiagram, AModel, X, Y);
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormViewSelectingHandler(AView: PView);
begin
  try
    if AView <> nil then StarUMLApplication.SelectView(AView);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormViewDeselectingHandler(Sender: TObject);
begin
  try
    if Sender <> nil then StarUMLApplication.DeselectView(Sender as PView);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormAllViewsDeselectingHandler(Sender: TObject);
begin
  try
    StarUMLApplication.DeselectAll;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormAdditionalViewSelectingHandler(Sender: TObject);
begin
  try
    if Sender <> nil then StarUMLApplication.SelectAdditionalView(Sender as PView);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormAreaSelectingHandler(X1, Y1, X2, Y2: Integer);
begin
  try
    StarUMLApplication.SelectArea(X1, Y1, X2, Y2);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormViewMovingHandler(View: PView; DX, DY: Integer);
begin
  try
    if View <> nil then StarUMLApplication.MoveView(View, DX, DY);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormViewContainerChangingHandler(View: PView; DX, DY: Integer; AContainerView: PView);
begin
  try
    if View <> nil then StarUMLApplication.MoveViewChangingContainerView(View, DX, DY, AContainerView);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormSelectedViewsMovingHandler(DX, DY: Integer);
begin
  try
    StarUMLApplication.MoveSelectedViews(DX, DY);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormSelectedViewsContainerChangingHandler(DX, DY: Integer; AContainerView: PView);
begin
  try
    StarUMLApplication.MoveSelectedViewsChaningContainerView(DX, DY, AContainerView);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormParasiticViewMovingHandler(AParasiticView: PParasiticView;
    DX, DY: Extended);
begin
  try
    if AParasiticView <> nil then StarUMLApplication.MoveParasiticView(AParasiticView, DX, DY);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormNodeResizingHandler(Node: PNodeView; Left, Top, Right, Bottom: Integer);
begin
  try
    if Node <> nil then StarUMLApplication.ResizeNode(Node, Left, Top, Right, Bottom);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormEdgeModifyingHandler(Edge: PEdgeView; Points: PPoints);
begin
  try
    if Edge <> nil then StarUMLApplication.ReshapeEdge(Edge, Points);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormEdgeReonnectingHandler(Edge: PEdgeView; Points: PPoints; NewParticipant: PView; IsTailSide: Boolean);
begin
  try
    if Edge <> nil then StarUMLApplication.ReconnectEdge(Edge, Points, NewParticipant, IsTailSide);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormViewDoubleClickedHandler(Sender: TObject; AView: PView; X, Y: Integer);
begin
  try
    ProcessDoubleClickAction(AView, X, Y);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgPopup(AView: PView; X, Y: Integer);
begin
  PopupQuickDialog(AView, X, Y);
end;

procedure PMain.MainFormWMDrawClipboardHandler(var Msg: TMessage);
begin
  try
    StarUMLApplication.NotifyWMDrawClipboard(Msg);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormWMChangeCBChainHandler(var Msg: TMessage);
begin
  try
    StarUMLApplication.NotifyWMChangeCBChain(Msg);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormWMDropFilesHandler(var Msg: TWMDROPFILES);
var
  FN: array [0..255] of Char;
  FileName, FileExt: String;
begin
  DragQueryFile(Msg.Drop, 0, FN, SizeOf(FN));
  FileName := FN;
  if FileName <> '' then begin
    FileExt := LowerCase(ExtractFileExt(FileName));
    if FileExt = '.uml' then begin
      StarUMLApplication.OpenProject(FileName);
      MainForm.WorkingAreaFrame.OpenAllDefaultDiagrams;
      MainForm.AddRecentFile(StarUMLApplication.FileName);
    end;
  end;
  DragFinish(Msg.Drop);
end;

procedure PMain.MainFormQuickDlgGeneralNameExpressionApplyingHandler(AModel: PModel; Value: string);
begin
  // * on Exception, process in QuickDialogFrm
  if AModel is PUMLElement then
    StarUMLApplication.ApplyGeneralNameExpression(AModel as PUMLElement, Value);
end;

procedure PMain.MainFormQuickDlgClassifierRoleExpressionApplyingHandler(AModel: PModel; Value: string);
begin
  // * on Exception, process in QuickDialogFrm
  if AModel is PUMLClassifierRole then
    StarUMLApplication.ApplyClassifierRoleExpression(AModel as PUMLClassifierRole, Value);
end;

procedure PMain.MainFormQuickDlgObjectExpressionApplyingHandler(AModel: PModel; Value: string);
begin
  // * on Exception, process in QuickDialogFrm
  if AModel is PUMLObject then
    StarUMLApplication.ApplyObjectExpression(AModel as PUMLObject, Value);
end;

procedure PMain.MainFormQuickDlgAttributeExpressionApplyingHandler(AModel: PModel; Value: string);
begin
  // * on Exception, process in QuickDialogFrm
  if AModel is PUMLAttribute then
    StarUMLApplication.ApplyAttributeExpression(AModel as PUMLAttribute, Value);
end;

procedure PMain.MainFormQuickDlgOperationExpressionApplyingHandler(AModel: PModel; Value: string);
begin
  // * on Exception, process in QuickDialogFrm
  if AModel is PUMLOperation then
    StarUMLApplication.ApplyOperationExpression(AModel as PUMLOperation, Value);
end;

procedure PMain.MainFormQuickDlgMessageExpressionApplyingHandler(AModel: PModel; Value: string);
begin
  // * on Exception, process in QuickDialogFrm
  if (AModel is PUMLMessage) or (AModel is PUMLStimulus) then
    StarUMLApplication.ApplyMessageExpresstion(AModel as PUMLModelElement, Value);
end;

procedure PMain.MainFormQuickDlgModelCreatingHandler(Owner: PModel; ModelKind: string; Argument: Integer = 0;
  InsertIndex: Integer = -1);
begin
  try
    // PRECONDITION
    Assert(Owner <> nil);
    // PRECONDITION
    StarUMLApplication.NewModel(Owner, ModelKind, Argument, nil, nil, InsertIndex);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgModelCreatingWithNameHandler(Owner: PModel; ModelKind: string; Name: string = '');
begin
  try
    // PRECONDITION
    Assert(Owner <> nil);
    // PRECONDITION
    StarUMLApplication.NewModelWithName(Owner, ModelKind, Name);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgElementDeletingHandler(AModel: PModel);
begin
  try
    StarUMLApplication.DeleteModel(AModel);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgVisibilityChangedHandler(AModel: PModel; Kind: PUMLVisibilityKind);
var
  V: string;
begin
  try
    V := UMLVisibilityKindToString(Kind);
    StarUMLApplication.ChangeModelAttribute(AModel, 'Visibility', V);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgAggregationKindChangingHandler(AModel: PModel; Kind: PUMLAggregationKind);
var
  Str: string;
begin
  try
    Str := UMLAggregationKindToString(Kind);
    StarUMLApplication.ChangeModelAttribute(AModel, 'Aggregation', Str);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgNavigableChangingHandler(AModel: PModel; IsNavigable: Boolean);
var
  Str: string;
begin
  try
    Str := BooleanToString(IsNavigable);
    StarUMLApplication.ChangeModelAttribute(AModel, 'IsNavigable', Str);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgMultiplicityChangingHandler(AModel: PModel; Str: string);
begin
  try
    StarUMLApplication.ChangeModelAttribute(AModel, 'Multiplicity', Str);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgActionKindChangingHandler(AModel: PModel; Kind: string);
begin
  try
    StarUMLApplication.ChangeActionKind(AModel, Kind);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgOperationChangingHandler(AModel: PModel; AnOp: PUMLOperation);
begin
  try
    StarUMLApplication.ChangeModelReference(AModel, 'Operation', AnOp);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgSignalChangingHandler(AModel: PModel; AnOp: PUMLSignal);
begin
  try
    StarUMLApplication.ChangeModelReference(AModel, 'Signal', AnOp);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgInstantiationChangingHandler(AModel: PModel; AnOp: PUMLClassifier);
begin
  try
    StarUMLApplication.ChangeModelReference(AModel, 'Instantiation', AnOp);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgNoteTextChangingHandler(AView: PUMLCustomTextView; Strs: string);
begin
  try
    StarUMLApplication.ChangeNoteViewStrings(AView, Strs);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgOrderChangingHandler(AModel: PModel; AnItem: PModel; Key: string; NewOrder: Integer);
begin
  try
    StarUMLApplication.ChangeCollectionItemOrder(AModel, AnItem, Key, NewOrder);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgSeqNumberChangingHandler(AElement: PElement; ACollectionItem: PElement; Key: string; NewIndex: Integer);
begin
  try
    StarUMLApplication.ChangeCollectionItemOrder(AElement, ACollectionItem, Key, NewIndex);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgObjectClassCreatingHandler(Owner: PUMLNamespace; AModel: PUMLModelElement; Name: string = '');
begin
  try
    if AModel is PUMLObject then
      StarUMLApplication.ChangeModelReferenceWithNamedModelCreating(AModel, 'Classifier', Owner, 'Class', True, Name)
    else if AModel is PUMLClassifierRole then
      StarUMLApplication.ChangeModelReferenceWithNamedModelCreating(AModel, 'Base', Owner, 'Class', True, Name);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.MainFormQuickDlgCallActionOperationCreatingHandler(AClassifier: PUMLClassifier; ACallAction: PUMLCallAction; Name: string = '');
begin
  try
    StarUMLApplication.ChangeModelReferenceWithNamedModelCreating(ACallAction, 'Operation', AClassifier, 'Operation', False, Name);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.BrowserFormElementSelectedHandler(Sender: TObject; Element: PModel);
var
  ContextMenuLaunched: Boolean;
begin
  try
    ContextMenuLaunched := False;

    if Sender is TModelExplorerPanel then
      ContextMenuLaunched := (Sender as TModelExplorerPanel).ContextMenuLaunched;


    StarUMLApplication.SelectModel(Element,ContextMenuLaunched);
    //if (Element <> nil) and (Element.ViewCount > 0) then
    //  StarUMLApplication.SelectView(Element.Views[0]);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.BrowserFormElementRelocatingHandler(Source, Target: PModel);
begin
  try
    StarUMLApplication.RelocateModel(Source, Target);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.BrowserFormModelNameChangeHandler(Sender: TObject; Model: PModel; Name: string);
begin
  try
    if Model is PUMLModelElement then
      StarUMLApplication.ApplyGeneralNameExpression(Model as PUMLElement, Name)
    else
      StarUMLApplication.ChangeModelName(Model, Name);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.BrowserFormElementAttributeChangeHandler(Sender: TObject; Element: PElement; Key, Value: string);
begin
  try
    StarUMLApplication.ChangeModelAttribute(Element as PModel, Key, Value);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.BrowserFormDiagramSelectedHandler(Sender: TObject);
begin
  if Sender is PUMLDiagramView then
  begin
    MainForm.WorkingAreaFrame.OpenDiagram((Sender as PDiagramView).Diagram);
  end;
end;

procedure PMain.BrowserFormEnableGeneralEditMenu(Sender: TObject);
begin
  try
    MenuStateHandler.GeneralEditMenuEnabled := True;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.BrowserFormDisableGeneralEditMenu(Sender: TObject);
begin
  try
    MenuStateHandler.GeneralEditMenuEnabled := False;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.BrowserFormModelIndexChangingHandler(Sender: TObject; Owner: PModel;
  Owned: PModel; Key: string; NewOrder: Integer);
begin
  try
    StarUMLApplication.ChangeCollectionItemOrder(Owner, Owned, Key, NewOrder);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormNameChanged(Sender: TObject; Element: PElement; Name: string);
begin
  try
    StarUMLApplication.ChangeModelName(Element as PModel, Name);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormAttributeChanged(Sender: TObject; Element: PElement; Key, Value: string);
begin
  try
    StarUMLApplication.ChangeModelAttribute(Element as PModel, Key, Value);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormElementsAttributeChanged(Sender: TObject; ElementSet: POrderedSet; Key, Value: string);
begin
  try
    StarUMLApplication.ChangeSelectedModelsAttribute(Key, Value);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormReferenceChanged(Sender: TObject; Element: PElement; Key: string; Value: PElement);
begin
  try
    StarUMLApplication.ChangeModelReference(Element as PModel, Key, Value as PModel);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormTypeExpressionChanged(Sender: TObject; Element: PElement; Key, TypeExpr: string; TypeRef: PElement);
begin
  try
    StarUMLApplication.ChangeTypeExpression(Element as PModel, TypeExpr, TypeRef as PModel);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormElementsStereotypeChanged(Sender: TObject; ElementSet: POrderedSet; StereotypeProfile: string; Stereotype: string);
begin
  try
    StarUMLApplication.ChangeSelectedModelsStereotype(StereotypeProfile, Stereotype);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormActionKindChanged(Sender: TObject; Element: PElement; ActionKind: string);
begin
  try
    StarUMLApplication.ChangeActionKind(Element as PModel, ActionKind);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormValueExpressionChanged(Sender: TObject; Element: PElement; Key, ValueExpr: string; ValueRef: PElement);
begin
  try
    StarUMLApplication.ChangeValueExpression(Element as PModel, ValueExpr, ValueRef as PModel);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormCollectionItemCreated(Sender: TObject; AOwner: PModel; ACollectionName: string; AModelType: string; Argument: Integer);
begin
  try
    StarUMLApplication.NewModel(AOwner, AModelType, Argument);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormCollectionItemDeleted(Sender: TObject; AOwner: PModel; ACollectionName: string; AModel: PModel);
begin
  try
    StarUMLApplication.DeleteModel(AModel);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormCollectionItemAdded(Sender: TObject; AOwner: PModel; ACollectionName: string; AModel: PModel);
begin
  try
    StarUMLApplication.AddCollectionItem(AOwner, ACollectionName, AModel);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormCollectionItemRemoved(Sender: TObject; AOwner: PModel; ACollectionName: string; AModel: PModel);
begin
  try
    StarUMLApplication.RemoveCollectionItem(AOwner, ACollectionName, AModel);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormCollectionItemOrderChanged(Sender: TObject; AOwner: PModel; ACollectionName: string; AModel: PModel; NewIdx: Integer);
begin
  try
    StarUMLApplication.ChangeCollectionItemOrder(AOwner, AModel, ACollectionName, NewIdx);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormCollectionItemSelected(Sender: TObject; AOwner: PModel; ACollectionName: string; AModel: PModel);
begin
  try
    StarUMLApplication.SelectModel(AModel);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormCollectionItemNameChanged(Sender: TObject; AModel: PModel; Value: string);
begin
  try
    StarUMLApplication.ChangeModelName(AModel, Value);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormConstraintCreated(Sender: TObject; AModelElement: PUMLModelElement; AName: string; ABody: string);
begin
  try
    StarUMLApplication.AddConstraint(AModelElement, AName, ABody);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormConstraintDeleted(Sender: TObject; AModelElement: PUMLModelElement; AConstraint: PConstraint);
begin
  try
    StarUMLApplication.DeleteConstraint(AModelElement, AConstraint);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormConstraintChanged(Sender: TObject; AModelElement: PUMLModelElement; AConstraint: PConstraint; AName: string; ABody: string);
begin
  try
    StarUMLApplication.ChangeConstraint(AModelElement, AConstraint, AName, ABody);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormConstraintOrderChanged(Sender: TObject; AModelElement: PUMLModelElement; AConstraint: PConstraint; NewIdx: Integer);
begin
  try
    StarUMLApplication.ChangeConstraintOrder(AModelElement, AConstraint, NewIdx);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormDataTaggedValueChanged(Sender: TObject; AModel: PExtensibleModel; AProfileName: string; ATagDefinitionSetName: string; AName: string; Value: string);
begin
  try
    StarUMLApplication.SetDataTaggedValue(AModel, AProfileName, ATagDefinitionSetName, AName, Value);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormReferenceTaggedValueChanged(Sender: TObject; AModel: PExtensibleModel; AProfileName: string; ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel);
begin
  try
    StarUMLApplication.SetReferenceTaggedValue(AModel, AProfileName, ATagDefinitionSetName, AName, Value);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormCollectionTaggedValueAdd(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
  ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel);
begin
  try
    StarUMLApplication.AddCollectionTaggedValue(AModel, AProfileName, ATagDefinitionSetName, AName, Value);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormCollectionTaggedValueRemove(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
  ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel);
begin
  try
    StarUMLApplication.RemoveCollectionTaggedValue(AModel, AProfileName, ATagDefinitionSetName, AName, Value);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormCollectionTaggedValueOrderChanged(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
  ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel; NewIdx: Integer);
begin
  try
    StarUMLApplication.ChangeCollectionTaggedValueOrder(AModel, AProfileName, ATagDefinitionSetName, AName, Value, NewIdx);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormSetTaggedValueAsDefault(Sender: TObject; AModel: PExtensibleModel; AProfileName: string; ATagDefinitionSetName: string; AName: string);
begin
  try
    StarUMLApplication.SetTaggedValueAsDefault(AModel, AProfileName, ATagDefinitionSetName, AName);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormAttachmentOpen(Sender: TObject; Attachment: string; Kind: PAttachmentKind);
var
  OpenResult: Integer;
begin
  try
    case Kind of
      akFile:
        begin
          if FileExists(Attachment) then begin
            OpenResult := ShellExecute(0, 'open', PChar(Attachment),'','',SW_SHOWNORMAL);
            if OpenResult <= 32 then begin
              if OpenResult = SE_ERR_NOASSOC then
                Application.MessageBox(PChar(ERR_NOAPPLICATION_ASSOCIATED), PChar(Application.Title))
              else
                Application.MessageBox(PChar(ERR_ATTACH_CANNOT_OPEN), PChar(Application.Title))
            end;
          end
          else
            Application.MessageBox(PChar(ERR_ATTACH_FILE_NOT_FOUND), PChar(Application.Title));
        end;
      akURL:
        begin
          StarUMLApplication.OpenURL(Attachment);
        end;
      akElement:
        begin
          BrowseElement(Attachment);
        end;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormAttachmentAdd(Sender: TObject; AModel: PModel; Attachment: string);
begin
  try
    StarUMLApplication.AddAttachment(AModel, Attachment);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormAttachmentDelete(Sender: TObject; AModel: PModel; Index: Integer);
begin
  try
    StarUMLApplication.DeleteAttachment(AModel, Index);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormAttachmentChange(Sender: TObject; AModel: PModel; Index: Integer; Attachment: string);
begin
  try
    StarUMLApplication.ChangeAttachment(AModel, Index, Attachment);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormAttachmentOrderChange(Sender: TObject; AModel: PModel; Index: Integer; NewIndex: Integer);
begin
  try
    StarUMLApplication.ChangeAttachmentOrder(AModel, Index, NewIndex);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormDocumentationChanged(Sender: TObject; Element: PModel; Documentation: string);
begin
  try
    StarUMLApplication.ChangeDocumentation(Element, Documentation);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InspectorFormPropertySelected(Sender: TObject; PropertyName: string);
begin
  try
    // MainForm.UMLAdvisor.BrowseUMLAdvice(PropertyName);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.InformationFormBrowseElement(Sender: TObject; Model: PModel);
begin
  try
    BrowseElement(Model);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ProfileManagerFormProfileInclude(Sender: TObject; ProfileName: string);
begin
  try
    StarUMLApplication.IncludeProfile(ProfileName);

    MainForm.InspectorFrame.Inspect;
    MainForm.AttachmentEditor.Inspect;
    MainForm.DocumentationEditor.Inspect;
    ConstraintEditorForm.Inspect;
    CollectionEditorForm.Inspect;
    TaggedValueEditorForm.Inspect;

  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ProfileManagerFormProfileExclude(Sender: TObject; ProfileName: string);
begin
  try
    StarUMLApplication.ExcludeProfile(ProfileName);

    MainForm.InspectorFrame.Inspect;
    MainForm.AttachmentEditor.Inspect;
    MainForm.DocumentationEditor.Inspect;
    ConstraintEditorForm.Inspect;
    CollectionEditorForm.Inspect;
    TaggedValueEditorForm.Inspect;

  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

{
procedure PMain.InspectorFormDocumentationChange(Sender: TObject; Element: PModel; Documentation: TStrings);
begin
  StarUMLApplication.ChangeDocumentation(Element, Documentation.Text);
end;

}

procedure PMain.SelectionChangedHandler(Sender: TObject);
var
  I: Integer;
  M: PModel;
begin
  try
    // Apply Changes in Inspector
    MainForm.InspectorFrame.ApplyChanges;
    MainForm.DocumentationEditor.ApplyChanges;

    MainForm.WorkingAreaFrame.RedrawActiveDiagram;

    MainForm.InspectorFrame.ClearInspectingElements;
    MainForm.AttachmentEditor.TargetModel := nil;
    MainForm.DocumentationEditor.InspectingElement := nil;
    ConstraintEditorForm.ConstrainedElement := nil;
    TaggedValueEditorForm.Model := nil;

    // Inspect
    if StarUMLApplication.SelectedModelCount = 1 then
    begin
      M := StarUMLApplication.SelectedModels[0];
      if M is PUMLModelElement then
      begin
        ConstraintEditorForm.ConstrainedElement := M as PUMLModelElement;
        TaggedValueEditorForm.Model := M as PExtensibleModel;
      end;
      MainForm.DocumentationEditor.InspectingElement := M;
      MainForm.AttachmentEditor.TargetModel := M;
    end
    else begin
      // ...
    end;


    for I := 0 to StarUMLApplication.SelectedModelCount - 1 do
      MainForm.InspectorFrame.AddInspectingElement(StarUMLApplication.SelectedModels[I]);

    MainForm.InspectorFrame.Inspect;
    MainForm.AttachmentEditor.Inspect;
    MainForm.DocumentationEditor.Inspect;
    ConstraintEditorForm.Inspect;
    TaggedValueEditorForm.Inspect;

    // Setting Go To Items
    if StarUMLApplication.SelectedModelCount = 1 then
    begin
      M := StarUMLApplication.SelectedModels[0];
      MainForm.EditGoToItemList.Items.Clear;
      for I := 0 to M.Attachments.Count - 1 do
      begin
        MainForm.EditGoToItemList.Items.AddObject(M.Attachments.Strings[I], nil)
      end;
    end;

    // Setting Menu Status
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.SetUnitSelectedGroup((StarUMLApplication.SelectedModelCount = 1) and
      StarUMLApplication.SelectedModels[0].IsDocumentElement and
      (not (StarUMLApplication.SelectedModels[0] is PUMLProject)));
    MenuStateHandler.SetModelSelectedGroup(StarUMLApplication.SelectedModelCount = 1);
    MenuStateHandler.SetViewSelectedGroup(StarUMLApplication.SelectedViewCount > 0);
    MenuStateHandler.UpdateFileMenus;
    MenuStateHandler.UpdateEditMenus;
    MenuStateHandler.UpdateFormatMenus;
    MenuStateHandler.UpdateModelMenus;
    MenuStateHandler.UpdateStatusBar;
    MenuStateHandler.EndUpdate;
    EventPublisher.NotifyEvent(EK_SELECTION_CHANGED);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.DiagramActivatedHandler(Sender: TObject);
begin
  try
    if StarUMLApplication.ActiveDiagram <> nil then begin
      MainForm.WorkingAreaFrame.UpdateActiveDiagram;
      MainForm.WorkingAreaFrame.RedrawActiveDiagram;
      EventPublisher.NotifyEvent(EK_DIAGRAM_ACTIVATED);
    end;
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.SetDiagramActivatedGroup(StarUMLApplication.ActiveDiagram <> nil);
    MenuStateHandler.UpdateTopLevelMenus;
    MenuStateHandler.UpdateEditMenus;
    MenuStateHandler.EndUpdate;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ElementsCreatedHandler(Sender: TObject; Models: PModelOrderedSet; Views: PViewOrderedSet);

  procedure CollectDiagrams(AModel: PModel; Diagrams: POrderedSet);
  var
    I: Integer;
  begin
    for I := 0 to AModel.OwnedDiagramCount - 1 do
      Diagrams.Add(AModel.OwnedDiagrams[I]);
    for I := 0 to AModel.VirtualOwnedModelCount - 1 do
      CollectDiagrams(AModel.VirtualOwnedModels[I], Diagrams);
  end;

var
  Diagrams: POrderedSet;
  I: Integer;
begin
  try
  {
    for I := 0 to Models.Count - 1 do begin
      AModel := Models.Items[I] as PModel;
      AModel.UpdateViews;
      if Assigned(AModel.VirtualNamespace) then AModel.VirtualNamespace.UpdateViews;
    end;
    for I := 0 to Views.Count - 1 do begin
      AView := Views.Items[I] as PView;
      AView.Update;
    end;
  }
    MainForm.WorkingAreaFrame.UpdateActiveDiagram;
    MainForm.WorkingAreaFrame.RedrawActiveDiagram;

    //-- MainForm.BrowserFrame.AddModels(Models);
    Screen.Cursor := crHourGlass;
    MainForm.ModelExplorer.AddModels(Models);
    Diagrams := POrderedSet.Create;
    try
      for I := 0 to Models.Count - 1 do begin
        if Models.Items[I] is PDiagram then
          Diagrams.Add(Models.Items[I])
        else
          CollectDiagrams(Models.Items[I] as PModel, Diagrams);
      end;
      for I := 0 to Diagrams.Count - 1 do
        if Diagrams.Items[I] is PUMLDiagram then
          MainForm.DiagramExplorer.AddDiagram(Diagrams.Items[I] as PUMLDiagram);
    finally
      Diagrams.Free;
    end;
    Screen.Cursor := crDefault;
    //--

    MainForm.InspectorFrame.UpdateInspector;
    MainForm.AttachmentEditor.UpdateAttachments;
    MainForm.DocumentationEditor.UpdateDocumentation;
    ConstraintEditorForm.UpdateConstraints;
    CollectionEditorForm.UpdateCollection;
    TaggedValueEditorForm.UpdateTaggedValues;

    EventPublisher.NotifyEvent(EK_ELEMENTS_ADDED);
    // if Models.Count > 0 then MainForm.BrowserFrame.Select(Models.Items[0] as PModel);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ElementsDeletingHandler(Sender: TObject; Models: PModelOrderedSet; Views: PViewOrderedSet);
var
  I: Integer;
begin
  try
    if Models.Count > 0 then
    begin
      //--MainForm.BrowserFrame.DeleteModels(Models);
      Screen.Cursor := crHourGlass;
      MainForm.ModelExplorer.DeleteModels(Models);
      for I := 0 to Models.Count - 1 do begin
        if Models.Items[I] is PUMLDiagram then begin
         MainForm.DiagramExplorer.DeleteDiagram(Models.Items[I] as PUMLDiagram);
        end;
      end;
      Screen.Cursor := crDefault;
      //--.
    end;

    // if model is going to be deleted, remove Diagram Tab
    for I := 0 to Models.Count - 1 do
    begin
      if Models.Items[I] is PUMLDiagram then
        MainForm.WorkingAreaFrame.CloseDiagram(Models.Items[I] as PUMLDiagram);
      //--MainForm.InformationFrame.DeleteMessagesLinkedTo(Models.Items[I] as PElement);
      MainForm.MessagePanel.DeleteMessagesLinkedTo(Models.Items[I] as PElement);
    end;
    // if model is going to be deleted, exclude from selection
    StarUMLApplication.DeselectModelsViews(Models, Views);

    MainForm.InspectorFrame.UpdateInspector;
    MainForm.AttachmentEditor.UpdateAttachments;
    MainForm.DocumentationEditor.UpdateDocumentation;
    ConstraintEditorForm.UpdateConstraints;
    CollectionEditorForm.UpdateCollection;
    TaggedValueEditorForm.UpdateTaggedValues;

    EventPublisher.NotifyEvent(EK_ELEMENTS_DELETING);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ElementsDeletedHandler(Sender: TObject);
begin
  try
    MainForm.WorkingAreaFrame.UpdateActiveDiagram;
    MainForm.WorkingAreaFrame.RedrawActiveDiagram;
    // MainForm.InspectorFrame.ClearInspectingElements;
    // MainForm.InspectorFrame.Inspect;

    MainForm.InspectorFrame.UpdateInspector;
    MainForm.AttachmentEditor.UpdateAttachments;
    MainForm.DocumentationEditor.UpdateDocumentation;
    ConstraintEditorForm.UpdateConstraints;
    CollectionEditorForm.UpdateCollection;
    TaggedValueEditorForm.UpdateTaggedValues;

    EventPublisher.NotifyEvent(EK_ELEMENTS_DELETED);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ModelsChangedHandler(Sender: TObject; Models: PModelOrderedSet);
var
  I: Integer;
  ASet: PModelOrderedSet;
begin
  try
  {
    for I := 0 to Models.Count - 1 do begin
      (Models.Items[I] as PModel).UpdateViews;
      if (Models.Items[I] as PModel).VirtualNamespace <> nil then
        (Models.Items[I] as PModel).VirtualNamespace.UpdateViews;
      if (Models.Items[I] is PUMLDiagram) then begin
        (Models.Items[I] as PUMLDiagram).DiagramView.Update;
      end;
    end;
  }
    MainForm.WorkingAreaFrame.UpdateDiagramTabs;
    MainForm.WorkingAreaFrame.UpdateActiveDiagram;
    MainForm.WorkingAreaFrame.RedrawActiveDiagram;

    //-- MainForm.BrowserFrame.UpdateModels(Models);
    ASet := PModelOrderedSet.Create;
    try
      ASet.Assign(Models);
      Screen.Cursor := crHourGlass;
      for I := 0 to ASet.Count - 1 do
      begin
        if ASet.Items[I] is PUMLDiagram then
        begin
          MainForm.DiagramExplorer.UpdateDiagram(ASet.Items[I] as PUMLDiagram);
        end;
      end;
      for I := 0 to ASet.Count - 1 do
      begin
        IncludeRelationsOf(ASet.Items[I] as PModel, ASet);
      end;
      MainForm.ModelExplorer.UpdateModels(ASet);
      Screen.Cursor := crDefault;
    finally
      ASet.Free;
    end;
    //--

    MainForm.InspectorFrame.UpdateInspector;
    MainForm.AttachmentEditor.UpdateAttachments;
    MainForm.DocumentationEditor.UpdateDocumentation;
    ConstraintEditorForm.UpdateConstraints;
    CollectionEditorForm.UpdateCollection;
    TaggedValueEditorForm.UpdateTaggedValues;

    EventPublisher.NotifyEvent(EK_MODELS_CHANGED);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.BrowseDiagramHandler(Sender: TObject; Diagram: PDiagram);
begin
  try
    if Diagram <> nil then
      MainForm.WorkingAreaFrame.OpenDiagram(Diagram);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.SelectModelInExplorer(Sender: TObject; Model: PModel);
begin
  try
    if Model <> nil then
      //-- MainForm.BrowserFrame.Select(Model);
      MainForm.ModelExplorer.Select(Model);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ClipboardDataChangedHandler(Kind: PClipboardDataKind);
begin
  try
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateEditMenus;
    MenuStateHandler.EndUpdate;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.CommandHistoryChangedHandler(Sender: TObject);
begin
  try
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateEditMenus;
    MenuStateHandler.EndUpdate;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.BeginUpdateHandler(Sender: TObject);
begin
  try
  {
    StarUMLApplication.DeselectAll;
    MainForm.InspectorFrame.ClearInspectingElements;
    MainForm.InspectorFrame.Inspect;
  }
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.EndUpdateHandler(Sender: TObject; CompletelyRebuild, UseUpdateLock: Boolean);
var
  SelectedModel: PModel;
begin
  try
    StarUMLApplication.UpdateDocuments;

    //--MainForm.BrowserFrame.RebuildAll(CompletelyRebuild, UseUpdateLock);
    Screen.Cursor := crHourGlass;

    MainForm.ModelExplorer.RebuildAll(CompletelyRebuild, UseUpdateLock);
    SelectedModel := StarUMLApplication.SelectedModels[0];
    if SelectedModel <> nil then
      MainForm.ModelExplorer.Expand(SelectedModel);

    MainForm.DiagramExplorer.RebuildAll;
    Screen.Cursor := crDefault;
    //--

    MainForm.WorkingAreaFrame.UpdateActiveDiagram;
    MainForm.WorkingAreaFrame.RedrawActiveDiagram;

    MainForm.InspectorFrame.UpdateInspector;
    MainForm.AttachmentEditor.UpdateAttachments;
    MainForm.DocumentationEditor.UpdateDocumentation;
    ConstraintEditorForm.UpdateConstraints;
    CollectionEditorForm.UpdateCollection;
    TaggedValueEditorForm.UpdateTaggedValues;

    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateTopLevelMenus;
    MenuStateHandler.UpdateFileMenus;
    MenuStateHandler.UpdateEditMenus;
    MenuStateHandler.UpdateFormatMenus;
    MenuStateHandler.UpdateModelMenus;
    MenuStateHandler.UpdateViewMenus;
    MenuStateHandler.UpdateStatusBar;
    MenuStateHandler.EndUpdate;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ProfileIncludedHandler(Sender: TObject; AProfileName: string);
begin
  try
    MenuStateHandler.UpdateModelMenus;
    MainForm.ModelExplorer.Repaint;
    MainForm.WorkingAreaFrame.UpdateAllDiagrams;
    if StarUMLApplication.ActiveDiagram <> nil then begin
      InteractionManager.ChangePaletteVisibility(StarUMLApplication.ActiveDiagram.Diagram as PUMLDiagram);
      MainForm.WorkingAreaFrame.RedrawActiveDiagram;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ProfileExcludedHandler(Sender: TObject; AProfileName: string);
begin
  try
    MenuStateHandler.UpdateModelMenus;
    MainForm.ModelExplorer.Refresh;
    MainForm.WorkingAreaFrame.UpdateAllDiagrams;
    if StarUMLApplication.ActiveDiagram <> nil then begin
      InteractionManager.ChangePaletteVisibility(StarUMLApplication.ActiveDiagram.Diagram as PUMLDiagram);
      MainForm.WorkingAreaFrame.RedrawActiveDiagram;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ViewsChangedHandler(Sender: TObject; Views: PViewOrderedSet);
var
  I: Integer;
begin
  try
    for I := 0 to Views.Count - 1 do
      (Views.Items[I] as PView).Update;
    MainForm.WorkingAreaFrame.RedrawActiveDiagram;
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateFormatMenus;
    MenuStateHandler.EndUpdate;
    EventPublisher.NotifyEvent(EK_VIEWS_CHANGED);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.DocumentModifiedHandler(Sender: TObject; Document: PDocument);
begin
  try
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateStatusBar;
    MenuStateHandler.EndUpdate;
    EventPublisher.NotifyEvent(EK_DOCUMENT_MODIFIED);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.DocumentSavedHandler(Sender: TObject; Document: PDocument);
begin
  try
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateStatusBar;
    MenuStateHandler.EndUpdate;
    EventPublisher.NotifyEvent(EK_DOCUMENT_SAVED);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ProjectOpenedHandler(Sender: TObject);
var
  Doc: PDocument;
begin
  try
    //-- MainForm.BrowserFrame.Project := StarUMLApplication.Project;
    MainForm.ModelExplorer.Project := StarUMLApplication.Project;
    MainForm.DiagramExplorer.Project := StarUMLApplication.Project;

    if StarUMLApplication.Project = nil then
    begin
      MainForm.ModelExplorer.Clear;
      MainForm.DiagramExplorer.Clear;

    end
    else begin
      // RebuildAll;
      Screen.Cursor := crHourGlass;
      MainForm.ModelExplorer.RebuildAll;
      MainForm.DiagramExplorer.RebuildAll;
      Screen.Cursor := crDefault;
    end;
    //--

    MainForm.InspectorFrame.Project := StarUMLApplication.Project;

    //-- MainForm.BrowserFrame.SelectInModelExplorer(StarUMLApplication.Project);
    SelectModelExplorerDockPanel(StarUMLApplication.Project);
    if StarUMLApplication.DocumentElementCount <> 0 then begin
      Doc := (StarUMLApplication.DocumentElements[0]).Document;
      if (Doc <> nil) and Doc.ReadOnly then
        MainForm.FileName := ExtractFileName(StarUMLApplication.FileName) + ' ' + TXT_DOC_STATUS_READONLY
      else if (Doc <> nil) and Doc.ExclusiveFileAccess then
        MainForm.FileName := ExtractFileName(StarUMLApplication.FileName) + ' ' + TXT_DOC_STATUS_EXCLUSIVE_FILE_OPEN
      else
        MainForm.FileName := ExtractFileName(StarUMLApplication.FileName);
    end;
    if MainForm.Visible then MainForm.WorkingAreaFrame.UpdateAllDiagrams;

    MenuStateHandler.BeginUpdate;
    MenuStateHandler.SetProjectOpenedGroup(True);
    MenuStateHandler.UpdateTopLevelMenus;
    MenuStateHandler.UpdateStatusBar;
    MenuStateHandler.EndUpdate;

    EventPublisher.NotifyEvent(EK_PROJECT_OPENED);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ProjectSavedHandler(Sender: TObject);
begin
  try
    MainForm.FileName := ExtractFileName(StarUMLApplication.FileName);
    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateEditMenus;
    MenuStateHandler.UpdateStatusBar;
    MenuStateHandler.EndUpdate;
    EventPublisher.NotifyEvent(EK_PROJECT_SAVED);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ProjectClosingHandler(Sender: TObject);
begin
  try
    MainForm.WorkingAreaFrame.CloseAllDiagrams;
    EventPublisher.NotifyEvent(EK_PROJECT_CLOSING);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ProjectClosedHandler(Sender: TObject);
begin
  try

    //-- MainForm.BrowserFrame.Project := nil;
    MainForm.ModelExplorer.Project := nil;
    MainForm.DiagramExplorer.Project := nil;
    MainForm.ModelExplorer.Clear;
    MainForm.DiagramExplorer.Clear;
    //--

    MainForm.InspectorFrame.ClearInspectingElements;
    MainForm.AttachmentEditor.TargetModel := nil;
    MainForm.DocumentationEditor.InspectingElement := nil;
    ConstraintEditorForm.ConstrainedElement := nil;
    CollectionEditorForm.Model := nil;
    TaggedValueEditorForm.Model := nil;

    // MainForm.InspectorFrame.ClearCollectionEditor;
    CollectionEditorForm.ClearCollection;
    MainForm.InspectorFrame.Inspect;
    MainForm.AttachmentEditor.Inspect;
    MainForm.DocumentationEditor.Inspect;
    ConstraintEditorForm.Inspect;
    CollectionEditorForm.Inspect;
    TaggedValueEditorForm.Inspect;
    MainForm.FileName := ExtractFileName(StarUMLApplication.FileName);

    MainForm.MessagePanel.ClearAllMessages;

    MenuStateHandler.BeginUpdate;
    MenuStateHandler.SetProjectOpenedGroup(False);
    MenuStateHandler.SetUnitSelectedGroup(False);
    MenuStateHandler.SetDiagramActivatedGroup(False);
    MenuStateHandler.UpdateTopLevelMenus;
    MenuStateHandler.UpdateStatusBar;
    MenuStateHandler.EndUpdate;

    EventPublisher.NotifyEvent(EK_PROJECT_CLOSED);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ProjectCloseQueryHandler(Sender: TObject; var CanClose: Boolean);
var
  R: Integer;
begin
  try
    if StarUMLApplication.Modified then begin
      R := Application.MessageBox(PChar(QUERY_SAVE_MODIFICATION), PChar(Application.Title),
        MB_ICONQUESTION or MB_YESNOCANCEL);
      if R = IDYES then begin
        ExecuteFileSave;
        if StarUMLApplication.Modified then
          CanClose := False
        else
          CanClose := True;
      end
      else if R = IDNO then
        CanClose := True
      else if R = IDCANCEL then
        CanClose := False;
    end
    else
      CanClose := True;
  except
    on  E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      CanClose := False;
    end;
  end;
end;

procedure PMain.UnitSeparatedHandler(Sender: TObject; APackage: PUMLPackage);
var
  Models: PModelOrderedSet;
begin
  try
    if Assigned(APackage) then begin
      Models := PModelOrderedSet.Create;
      Models.Clear;
      try
        Models.Add(APackage);
        //-- MainForm.BrowserFrame.UpdateModels(Models);
        MainForm.ModelExplorer.UpdateModels(Models);
        //--
        EventPublisher.NotifyEvent(EK_UNIT_SEPARATED);
      finally
        Models.Free;
      end;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.UnitMergedHandler(Sender: TObject; APackage: PUMLPackage);
var
  Models: PModelOrderedSet;
begin
  try
    if Assigned(APackage) then begin
      Models := PModelOrderedSet.Create;
      Models.Clear;
      try
        Models.Add(APackage);
        //--MainForm.BrowserFrame.UpdateModels(Models);
        MainForm.ModelExplorer.UpdateModels(Models);
        //--
        EventPublisher.NotifyEvent(EK_UNIT_MERGED);
      finally
        Models.Free;
      end;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.UnitOpenedHandler(Sender: TObject; APackage: PUMLPackage);
begin
  try
    //--MainForm.BrowserFrame.RebuildAll;
    Screen.Cursor := crHourGlass;
    MainForm.ModelExplorer.RebuildAll;
    MainForm.DiagramExplorer.RebuildAll;
    Screen.Cursor := crDefault;
    //--
    EventPublisher.NotifyEvent(EK_UNIT_OPENED);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.SavingProgressHandler(Sender: TObject; Info: string; Max, Progress: Integer);
var
  P: Integer;
begin
  try
    P := Round((Progress / Max) * 100);
    if Progress < Max then begin
      MainForm.SetStatusBarInfo(Info + ' ' + MSG_STATUS_FILE_SAVING, P);
      Screen.Cursor := crHourGlass;
    end
    else begin
      MainForm.SetStatusBarInfo(Info + ' ' + MSG_STATUS_FILE_SAVING_COMPLETE, P);
      MainForm.SetStatusBarInfo(Info + ' ' + MSG_STATUS_FILE_SAVING_COMPLETE, 0);
      LogManager.Log(Info + ' ' + MSG_STATUS_FILE_SAVING_COMPLETE);
      Screen.Cursor := crDefault;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.LoadingProgressHandler(Sender: TObject; Info: string; Max, Progress: Integer);
var
  P: Integer;
begin
  try
    P := Round((Progress / Max) * 100);
    if Progress < Max then begin
      MainForm.SetStatusBarInfo(Info + ' ' + MSG_STATUS_FILE_LOADING, P);
      Screen.Cursor := crHourGlass;
    end
    else begin
      MainForm.SetStatusBarInfo(Info + ' ' + MSG_STATUS_FILE_LOADING_COMPLETE, P);
      MainForm.SetStatusBarInfo(Info + ' ' + MSG_STATUS_FILE_LOADING_COMPLETE, 0);
      LogManager.Log(Info + ' ' + MSG_STATUS_FILE_LOADING_COMPLETE);
      Screen.Cursor := crDefault;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ResolvingProgressHandler(Sender: TObject; Info: string; Max, Progress: Integer);
var
  P: Integer;
begin
  try
    P := Round((Progress / Max) * 100);
    if Progress < Max then begin
      MainForm.SetStatusBarInfo(MSG_STATUS_REFERENCE_RESOLVING, P);
      Screen.Cursor := crHourGlass;
    end
    else begin
      MainForm.SetStatusBarInfo(MSG_STATUS_REFERENCE_RESOLVING_COMPLETE, P);
      MainForm.SetStatusBarInfo(MSG_STATUS_REFERENCE_RESOLVING_COMPLETE, 0);
      Screen.Cursor := crDefault;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.LogHandler(Sender: TObject; Log: string);
begin
  try
    //--MainForm.InformationFrame.Output(Log);
    MainForm.OutputPanel.Output(Log);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.FindStarted(Sender: TObject);
begin
  try
    //--MainForm.InformationFrame.ClearMessages(mkFindResult);
    MainForm.MessagePanel.ClearMessages(mkFindResult);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.FindFinished(Sender: TObject);
begin
  try
    if MainForm.Visible then begin
      with MainForm do begin
        if not MessageDockPanel.Visible then
          MessageDockPanel.Visible := True;
        if MessageDockPanel.ParentDockControl is TdxTabContainerDockSite then
          (MessageDockPanel.ParentDockControl as TdxTabContainerDockSite).ActiveChild := MessageDockPanel;
        MessageDlg(Format(MSG_ELEMENTS_FOUND, [FindForm.FoundedElementCount]), mtInformation, [mbOK], 0);
        dxDockingController.ActiveDockControl := MessageDockPanel;
        MessagePanel.SetFocus;
      end;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ModelElementFound(Sender: TObject; AModel: PModel);
begin
  try
    //--MainForm.InformationFrame.AddMessage(mkFindResult, '(' + AModel.MetaClass.Name + ') ' + AModel.Pathname, AModel);
    MainForm.MessagePanel.AddMessage(mkFindResult, '(' + AModel.MetaClass.Name + ') ' + AModel.Pathname, AModel);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.BeginVerificationHandler(Sender: TObject);
begin
  try
    //--MainForm.InformationFrame.ClearMessages(mkVerificationResult);
    MainForm.MessagePanel.ClearMessages(mkVerificationResult);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.EndVerificationHandler(Sender: TObject);
var
  Failed: Integer;
begin
  try
    ModelVerifierForm.VerifyingRuleNameLabel.Caption := '';
    ModelVerifierForm.VerifyingElementNameLabel.Caption := '';

    Failed := UMLVerifier.VerificationFailedCount;
    if Failed > 0 then
      MessageDlg(Format(MSG_VERIFICATION_FAILED, [Failed]), mtInformation, [mbOK], 0)
    else
      MessageDlg(MSG_VERIFICATION_ALL_PASSED, mtInformation, [mbOK], 0);

    ModelVerifierForm.VerificationProgressBar.Position := 0;
    //if MainForm.Visible then
    MainForm.MessagePanel.Show;
    begin
      {
      if not MainForm.InformationVisible then
        MainForm.InformationVisible := True;
      }
      //--MainForm.InformationFrame.SetFocusOnMessagePanel;
      //MainForm.MessagePanel.SetFocus;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.BeginVerifyItemHandler(Sender: TObject; VerifyItem: PUMLVerifyItem);
begin
  try
    ModelVerifierForm.VerifyingRuleNameLabel.Caption := VerifyItem.Title;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.EndVerifyItemHandler(Sender: TObject; VerifyItem: PUMLVerifyItem);
var
  P: Integer;
begin
  try
    P := Round((UMLVerifier.IndexOfVerifyItem(VerifyItem) / (UMLVerifier.VerifyItemCount-1)) * 100);
    ModelVerifierForm.VerificationProgressBar.Position := P;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.VerifiedHandler(Sender: TObject; VerifyItem: PUMLVerifyItem; Model: PModel);
begin
  try
    ModelVerifierForm.VerifyingElementNameLabel.Caption := Model.Pathname;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.VerificationFailedHandler(Sender: TObject; VerifyItem: PUMLVerifyItem; Model: PModel);
var
  S: string;
begin
  try
    ModelVerifierForm.VerificationFailedCountLabel.Caption := IntToStr(UMLVerifier.VerificationFailedCount) + ' item(s)';
    S := '';
    if Model <> nil then S := '(' + Model.Name + ') ';
    S := S + VerifyItem.Title;
    //--MainForm.InformationFrame.AddMessage(mkVerificationResult, S, Model);
    MainForm.MessagePanel.AddMessage(mkVerificationResult, S, Model);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.AddInManagerMessageHandler(str: string);
begin
  try
    LogManager.Log(str);
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
// Inner utility methods

procedure PMain.ConnectHandlersOnApplicationEvents;
begin
  with Application do
  begin
    OnActivate := ApplicationActivateHandler;
    OnDeactivate := ApplicationDeactivateHandler;
    OnMinimize := ApplicationMinimizeHandler;
    OnRestore := ApplicationRestoreHandler;
  end;
end;

procedure PMain.ConnectHandlersOnMainFormEvents;
begin
  with MainForm do begin
    OnShow := MainFormShowHandler;
    OnStarted := MainFormStartedHandler;
    OnClose := MainFormCloseHandler;
    OnCloseQuery := MainFormCloseQueryHandler;
    OnActivate := MainFormActivateHandler;
    OnDeactivate := MainFormDeactivateHandler;
    OnViewSelecting := MainFormViewSelectingHandler;
    OnViewDeselecting := MainFormViewDeselectingHandler;
    OnAllViewsDeselecting := MainFormAllViewsDeselectingHandler;
    OnAdditionalViewSelecting := MainFormAdditionalViewSelectingHandler;
    OnAreaSelecting := MainFormAreaSelectingHandler;
    OnViewMoving := MainFormViewMovingHandler;
    OnViewContainerChanging := MainFormViewContainerChangingHandler;
    OnSelectedViewsMoving := MainFormSelectedViewsMovingHandler;
    OnSelectedViewsContainerChanging := MainFormSelectedViewsContainerChangingHandler;
    OnParasiticViewMoving := MainFormParasiticViewMovingHandler;
    OnNodeResizing := MainFormNodeResizingHandler;
    OnEdgeModifying := MainFormEdgeModifyingHandler;
    OnEdgeReconnecting := MainFormEdgeReonnectingHandler;
    OnViewDoubleClicked := MainFormViewDoubleClickedHandler;
    OnFileMenuClicked := MainFormFileMenuClickedHandler;
    OnEditMenuClicked := MainFormEditMenuClickedHandler;
    OnFormatMenuClicked := MainFormFormatMenuClickedHandler;
    OnFormatCheckTypeMenuClicked := MainFormFormatCheckTypeMenuClickedHandler;
    OnFontFaceChanged := MainFormFormatFontFaceChangedHandler;
    OnFontSizeChanged := MainFormFormatFontSizeChangedHandler;
    OnModelMenuClicked := MainFormModelMenuClickedHandler;
    OnViewMenuClicked := MainFormViewMenuClickedHandler;
    WorkingAreaFrame.OnViewMenuClicked := MainFormViewMenuClickedHandler;
    OnViewCheckTypeMenuClicked := MainFormViewCheckTypeMenuClickedHandler;
    OnZoomChanged := MainFormZoomChangedHandler;
    OnToolsMenuClicked := MainFormToolsMenuClickedHandler;
    OnHelpMenuClicked := MainFormHelpMenuClickedHandler;
    OnRecentFileAdd := MainFormRecentFileAddHandler;
    OnRecentFileClicked := MainFormRecentFileClickedHandler;
    OnInspectorAttachmentButtonClicked := MainFormInspectorAttachmentButtonClickedHandler;
    MainForm.OnInformationMessagesButtonClicked := MainFormInformationMessagesButtonClickedHandler;
    OnDiagramViewDragOver := MainFormDiagramViewDragOveredHandler;
    OnDiagramViewDragDrop := MainFormDiagramViewDragDropHandler;
    OnGeneralNameExpressionApplying := MainFormQuickDlgGeneralNameExpressionApplyingHandler;
    OnClassifierRoleExpressionApplying := MainFormQuickDlgClassifierRoleExpressionApplyingHandler;
    OnObjectExpressionApplying := MainFormQuickDlgObjectExpressionApplyingHandler;
    OnAttributeExpressionApplying := MainFormQuickDlgAttributeExpressionApplyingHandler;
    OnOperationExpressionApplying := MainFormQuickDlgOperationExpressionApplyingHandler;
    OnMessageExpressionApplying := MainFormQuickDlgMessageExpressionApplyingHandler;
    OnQuickDlgModelCreating := MainFormQuickDlgModelCreatingHandler;
    OnQuickDlgModelCreatingWithName := MainFormQuickDlgModelCreatingWithNameHandler;
    OnQuickDlgElementDeleting := MainFormQuickDlgElementDeletingHandler;
    OnQuickDlgVisibilityChanging := MainFormQuickDlgVisibilityChangedHandler;
    OnQuickDlgAggregationKindChanging := MainFormQuickDlgAggregationKindChangingHandler;
    OnQuickDlgNavigableChanging := MainFormQuickDlgNavigableChangingHandler;
    OnQuickDlgMultiplicityChanging := MainFormQuickDlgMultiplicityChangingHandler;
    OnQuickDlgActionKindChanging := MainFormQuickDlgActionKindChangingHandler;
    OnQuickDlgOperationChanging := MainFormQuickDlgOperationChangingHandler;
    OnQuickDlgSignalChanging := MainFormQuickDlgSignalChangingHandler;
    OnQuickDlgInstantiationChanging := MainFormQuickDlgInstantiationChangingHandler;
    OnQuickDlgNoteTextChanging := MainFormQuickDlgNoteTextChangingHandler;
    OnQuickDlgSeqNumberChanging := MainFormQuickDlgSeqNumberChangingHandler;
    OnQuickDlgOrderChanging := MainFormQuickDlgOrderChangingHandler;
    OnQuickDlgObjectClassCreating := MainFormQuickDlgObjectClassCreatingHandler;
    OnQuickDlgCallActionOperationCreating := MainFormQuickDlgCallActionOperationCreatingHandler;
    OnWMDrawClipboard := MainFormWMDrawClipboardHandler;
    OnWMDropFiles := MainFormWMDropFilesHandler;
    OnWMChangeCBChain := MainFormWMChangeCBChainHandler;
    WorkingAreaFrame.OnActiveDiagramEditorChanged := MainFormActiveDiagramEditorChangedHandler;
    //DiagramTabPopupMenu.OnPopup := MainFormDiagramTabPopupMenuPopupHandler;
    DiagramMapForm.OnDiagramMapMove := MainFormDiagramMapFormMouseMoveHandler;
    DockingManager.OnActiveDockControlChanged := MainFormActiveDockControlChangedHandler;
    OnDockPanelVisibleChanged := MainFormDockPanelVisibleChangedHandler;
    OnDiagramOpen := MainFormDiagramOpenHandler;
    OnDiagramClose := MainFormDiagramCloseHandler;
    OnQuickDlgPopup := MainFormQuickDlgPopup;
  end;
end;

procedure PMain.ConnectHandlersOnNewProjectFormEvents;
begin
  with NewProjectForm do begin
    OnRecentFileDelete := NewProjFormRecentFileDeleteHandler;
  end;
end;

procedure PMain.ConnectHandlersOnBrowserFormEvents;
begin
  with MainForm do begin
    //-- OnElementSelected := BrowserFormElementSelectedHandler;
    ModelExplorer.OnElementSelected := BrowserFormElementSelectedHandler;
    DiagramExplorer.OnElementSelected  := BrowserFormElementSelectedHandler;
    //-- OnElementRelocating := BrowserFormElementRelocatingHandler;
    ModelExplorer.OnElementRelocating  := BrowserFormElementRelocatingHandler;
    //-- OnModelNameChange := BrowserFormModelNameChangeHandler;
    ModelExplorer.OnModelNameChange := BrowserFormModelNameChangeHandler;
    DiagramExplorer.OnModelNameChange := BrowserFormModelNameChangeHandler;
    //-- OnElementAttributeChange := BrowserFormElementAttributeChangeHandler;
    ModelExplorer.OnElementAttributeChange := BrowserFormElementAttributeChangeHandler;
    //-- OnBrowseDiagram := BrowseDiagramHandler;
    ModelExplorer.OnBrowseDiagram := BrowseDiagramHandler;
    DiagramExplorer.OnBrowseDiagram := BrowseDiagramHandler;
    //-- OnEnableGeneralEditMenu := BrowserFormEnableGeneralEditMenu;
    ModelExplorer.OnEnableGeneralEditMenu := BrowserFormEnableGeneralEditMenu;
    DiagramExplorer.OnEnableGeneralEditMenu := BrowserFormEnableGeneralEditMenu;
    //-- OnDisableGeneralEditMenu := BrowserFormDisableGeneralEditMenu;
    ModelExplorer.OnDisableGeneralEditMenu := BrowserFormDisableGeneralEditMenu;
    DiagramExplorer.OnDisableGeneralEditMenu := BrowserFormDisableGeneralEditMenu;
    //-- OnModelIndexChanging := BrowserFormModelIndexChangingHandler;
    ModelExplorer.OnModelIndexChanging:= BrowserFormModelIndexChangingHandler;
  end;
end;

procedure PMain.ConnectHandlersOnInspectorFormEvents;
begin
  with MainForm.InspectorFrame do begin
    OnNameChange := InspectorFormNameChanged;
    OnAttributeChange := InspectorFormAttributeChanged;
    OnElementsAttributeChange := InspectorFormElementsAttributeChanged;
    OnReferenceChange := InspectorFormReferenceChanged;
    OnTypeExpressionChange := InspectorFormTypeExpressionChanged;
    OnElementsStereotypeChange := InspectorFormElementsStereotypeChanged;
    OnActionKindChange := InspectorFormActionKindChanged;
    OnPropertySelected := InspectorFormPropertySelected;
    OnValueExpressionChange := InspectorFormValueExpressionChanged;
  end;

  // Attachment Editor
  MainForm.AttachmentEditor.OnAttachmentOpen := InspectorFormAttachmentOpen;
  MainForm.AttachmentEditor.OnAttachmentAdd := InspectorFormAttachmentAdd;
  MainForm.AttachmentEditor.OnAttachmentDelete := InspectorFormAttachmentDelete;
  MainForm.AttachmentEditor.OnAttachmentChange := InspectorFormAttachmentChange;
  MainForm.AttachmentEditor.OnAttachmentOrderChange := InspectorFormAttachmentOrderChange;

  // Documentation Editor
  MainForm.DocumentationEditor.OnDocumentationChange := InspectorFormDocumentationChanged;
  // Collection Editor
  CollectionEditorForm.OnCollectionItemCreate := InspectorFormCollectionItemCreated;
  CollectionEditorForm.OnCollectionItemDelete := InspectorFormCollectionItemDeleted;
  CollectionEditorForm.OnCollectionItemAdd := InspectorFormCollectionItemAdded;
  CollectionEditorForm.OnCollectionItemRemove := InspectorFormCollectionItemRemoved;
  CollectionEditorForm.OnCollectionItemOrderChange := InspectorFormCollectionItemOrderChanged;
  CollectionEditorForm.OnCollectionItemSelected := InspectorFormCollectionItemSelected;
  CollectionEditorForm.OnCollectionItemNameChanged := InspectorFormCollectionItemNameChanged;
  // Constraint Editor
  ConstraintEditorForm.OnConstraintCreate := InspectorFormConstraintCreated;
  ConstraintEditorForm.OnConstraintDelete := InspectorFormConstraintDeleted;
  ConstraintEditorForm.OnConstraintChange := InspectorFormConstraintChanged;
  ConstraintEditorForm.OnConstraintOrderChange := InspectorFormConstraintOrderChanged;

  // TaggedValue Editor
  TaggedValueEditorForm.OnDataTaggedValueChange := InspectorFormDataTaggedValueChanged;
  TaggedValueEditorForm.OnReferenceTaggedValueChange := InspectorFormReferenceTaggedValueChanged;
  TaggedValueEditorForm.OnAddCollectionTaggedValue := InspectorFormCollectionTaggedValueAdd;
  TaggedValueEditorForm.OnRemoveCollectionTaggedValue := InspectorFormCollectionTaggedValueRemove;
  TaggedValueEditorForm.OnChangeCollectionTaggedValueOrder := InspectorFormCollectionTaggedValueOrderChanged;
  TaggedValueEditorForm.OnSetTaggedValueAsDefault := InspectorFormSetTaggedValueAsDefault;

end;

procedure PMain.ConnectHandlersOnInformationFormEvents;
begin
  MainForm.MessagePanel.OnBrowseElement := InformationFormBrowseElement;
end;

procedure PMain.ConnectHandlersOnStarUMLApplicationEvents;
begin
  with StarUMLApplication do begin
    OnSelectionChanged := SelectionChangedHandler;
    OnDiagramActivated := DiagramActivatedHandler;
    OnElementsCreated := ElementsCreatedHandler;
    OnElementsDeleting := ElementsDeletingHandler;
    OnElementsDeleted := ElementsDeletedHandler;
    OnModelsChanged := ModelsChangedHandler;
    OnViewsChanged := ViewsChangedHandler;
    OnDocumentModified := DocumentModifiedHandler;
    OnDocumentSaved := DocumentSavedHandler;
    OnProjectOpened := ProjectOpenedHandler;
    OnProjectSaved := ProjectSavedHandler;
    OnProjectClosing := ProjectClosingHandler;
    OnProjectClosed := ProjectClosedHandler;
    OnProjectCloseQuery := ProjectCloseQueryHandler;
    OnSavingProgress := SavingProgressHandler;
    OnLoadingProgress := LoadingProgressHandler;
    OnResolvingProgress := ResolvingProgressHandler;
    OnBrowseDiagram := BrowseDiagramHandler;
    OnSelectModelInExplorer := SelectModelInExplorer;
    OnUnitSeparated := UnitSeparatedHandler;
    OnUnitMerged := UnitMergedHandler;
    OnUnitOpened := UnitOpenedHandler;
    OnClipboardDataChanged := ClipboardDataChangedHandler;
    OnCommandHistoryChanged := CommandHistoryChangedHandler;
    OnBeginUpdate := BeginUpdateHandler;
    OnEndUpdate := EndUpdateHandler;
    OnIncludeProfile := ProfileIncludedHandler;
    OnExcludeProfile := ProfileExcludedHandler;
  end;
end;

procedure PMain.ConnectHandlersOnProfileManagerFormEvents;
begin
  ProfileManagerForm.OnProfileInclude := ProfileManagerFormProfileInclude;
  ProfileManagerForm.OnProfileExclude := ProfileManagerFormProfileExclude;
end;

procedure PMain.ConnectHandlersOnLogManagerEvents;
begin
  LogManager.OnLog := LogHandler;
end;

procedure PMain.ConnectHandlersOnFindFormEvents;
begin
  FindForm.OnFindStarted := FindStarted;
  FindForm.OnFindFinished := FindFinished;
  FindForm.OnModelElementFound := ModelElementFound;
end;

procedure PMain.ConnectHandlersOnUMLVerifierEvents;
begin
  UMLVerifier.OnBeginVerification := BeginVerificationHandler;
  UMLVerifier.OnEndVerification := EndVerificationHandler;
  UMLVerifier.OnBeginVerifyItem := BeginVerifyItemHandler;
  UMLVerifier.OnEndVerifyItem := EndVerifyItemHandler;
  UMLVerifier.OnVerified := VerifiedHandler;
  UMLVerifier.OnVerificationFailed := VerificationFailedHandler;
end;

procedure PMain.ConnectHandlersOnInteractionManagerEvents;
begin
  InteractionManager.OnModelAdding := InteractionManagerModelAddingHandler;
  InteractionManager.OnDiagramAdding := InteractionManagerDiagramAddingHandler;
  InteractionManager.OnExtModelAdding := InteractionManagerExtendedModelAddingHandler;
  InteractionManager.OnExtDiagramAdding := InteractionManagerExtendedDiagramAddingHandler;
  InteractionManager.OnElementCreating := InteractionManagerElementCreatingHandler;
  InteractionManager.OnExtElementCreating := InteractionManagerExtElementCreatingHandler;
end;

procedure PMain.ExecuteSaveAllUnits;
var
  R: Integer;
begin
  if StarUMLApplication.UnitsModified then
  begin
    R :=Application.MessageBox(PChar(QUERY_SAVE_CHANGED_UNITS),
      PChar(Application.Title), MB_ICONQUESTION or MB_YESNO);
    if R = IDYES then
      StarUMLApplication.SaveAllUnits;
  end;
  UpdateDocumentElements;
end;

procedure PMain.ExecuteFileNew;
begin
  try
    if NewProjectForm.DefaultApproachName = '' then
      StarUMLApplication.NewProject
    else begin
      StarUMLApplication.NewProject(NewProjectForm.DefaultApproachName);
      MainForm.WorkingAreaFrame.OpenAllDefaultDiagrams;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ExecuteFileSelectProject;
begin
  if NewProjectForm.Execute then begin
    case NewProjectForm.ProjectActionKind of
      akNew: begin
        try
          if NewProjectForm.ApproachName = '' then
          begin
            StarUMLApplication.NewProject;
          end else
          begin
            // if default approach setting is changed,
            // Main's DefaultApproach property is set to changed value
            StarUMLApplication.NewProject(NewProjectForm.ApproachName);
            MainForm.WorkingAreaFrame.OpenAllDefaultDiagrams;
          end;
        except on
          E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
        end;
      end;

      akOpen: begin
       try
          StarUMLApplication.OpenProject(NewProjectForm.FileName);
          MainForm.WorkingAreaFrame.OpenAllDefaultDiagrams;
          MainForm.AddRecentFile(StarUMLApplication.FileName);
        except on
          E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
        end;
      end;

      akRecent: begin
        try
          StarUMLApplication.OpenProject(NewProjectForm.FileName);
          MainForm.WorkingAreaFrame.OpenAllDefaultDiagrams;
          MainForm.AddRecentFile(StarUMLApplication.FileName);
        except on
          E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
        end;
      end;
    end;
  end;
end;

procedure PMain.ExecuteFileOpen(AFileAccessType: PFileAccessType);
begin
  if MainForm.OpenDialog.Execute then
  begin
    try
      StarUMLApplication.OpenProject(MainForm.OpenDialog.FileName,AFileAccessType);
      MainForm.WorkingAreaFrame.OpenAllDefaultDiagrams;
      MainForm.AddRecentFile(StarUMLApplication.FileName);
    except
      on E: EDOMParseError do begin
        MessageDlg(ERR_INVALID_MODEL_FILE + #13#10 + E.Message, mtError, [mbOK], 0);
        Screen.Cursor := crDefault;
        MainForm.SetStatusBarInfo('', 0);
        StarUMLApplication.NewProject('');
      end;
      on EReadOnlyFile do begin
        Screen.Cursor := crDefault;
        MainForm.SetStatusBarInfo('', 0);
        StarUMLApplication.NewProject('');
      end;
    end;
  end;
end;

procedure PMain.ExecuteFileSave;
begin
  if (StarUMLApplication.FileName <> '') then
  begin
    if StarUMLApplication.Modified then
    begin
      StarUMLApplication.SaveProject;
      ExecuteSaveAllUnits;
    end;
  end
  else begin
    MainForm.SaveDialog.FileName := StarUMLApplication.Project.Title;
    try
      if MainForm.SaveDialog.Execute then
      begin
        StarUMLApplication.SaveProjectAs(MainForm.SaveDialog.FileName);
        MainForm.AddRecentFile(StarUMLApplication.FileName);
        ExecuteSaveAllUnits;
      end;
    except
      on SaveDialogEx.EDirectoryNotFound do MessageDlg(ERR_DIRECTORY_NOT_FOUND, mtError, [mbOK], 0);
      on SaveDialogEx.EInvalidFileName do MessageDlg(ERR_INVALID_FILE_NAME, mtError, [mbOK], 0);
    end;
  end;
  UpdateDocumentElements;
end;

procedure PMain.ExecuteFileSaveAs;
begin
  MainForm.SaveDialog.FileName := StarUMLApplication.FileName;
  try
    if MainForm.SaveDialog.Execute then
    begin
      StarUMLApplication.SaveProjectAs(MainForm.SaveDialog.FileName);
      MainForm.AddRecentFile(StarUMLApplication.FileName);
      ExecuteSaveAllUnits;
    end;
  except
    on SaveDialogEx.EDirectoryNotFound do MessageDlg(ERR_DIRECTORY_NOT_FOUND, mtError, [mbOK], 0);
    on SaveDialogEx.EInvalidFileName do MessageDlg(ERR_INVALID_FILE_NAME, mtError, [mbOK], 0);
  end;
  UpdateDocumentElements;
end;

procedure PMain.ExecuteFileClose;
begin
  StarUMLApplication.CloseProject;
end;

procedure PMain.ExecuteFileUnitsSeparateUnit;
var
  Pkg: PUMLPackage;
begin
  if (StarUMLApplication.SelectedModelCount = 1) and
     (StarUMLApplication.SelectedModels[0] is PUMLPackage) then
  begin
    try
      CheckReadOnly(StarUMLApplication.SelectedModels[0]);
      Pkg := StarUMLApplication.SelectedModels[0] as PUMLPackage;
      MainForm.SaveUnitDialog.FileName := Pkg.Name;
      if MainForm.SaveUnitDialog.Execute then
        StarUMLApplication.SeparateUnit(Pkg, MainForm.SaveUnitDialog.FileName);
    except
      on SaveDialogEx.EDirectoryNotFound do MessageDlg(ERR_DIRECTORY_NOT_FOUND, mtError, [mbOK], 0);
      on SaveDialogEx.EInvalidFileName do MessageDlg(ERR_INVALID_FILE_NAME, mtError, [mbOK], 0);
      on EReadOnlyDocument do MessageDlg(C_ERR_READONLY, mtError, [mbOK], 0);
    end;
  end;
end;

procedure PMain.ExecuteFileUnitsMergeUnit;
begin
  if (StarUMLApplication.SelectedModelCount = 1) and
     (StarUMLApplication.SelectedModels[0] is PUMLPackage) then
  begin
    if StarUMLApplication.SelectedModels[0].IsDocumentElement then begin
      try
        CheckReadOnly((StarUMLApplication.SelectedModels[0] as PUMLPackage).Namespace);
      except
        on EReadOnlyDocument do MessageDlg(C_ERR_READONLY, mtError, [mbOK], 0);
      end;
      StarUMLApplication.MergeUnit(StarUMLApplication.SelectedModels[0] as PUMLPackage);
    end;
  end;
end;

procedure PMain.ExecuteFileUnitsOpenUnit;
var
  AUnit: PUMLUnitDocument;
begin
  if (StarUMLApplication.SelectedModelCount = 1) and
     (StarUMLApplication.SelectedModels[0] is PUMLPackage) then
  begin
    try
      CheckReadOnly(StarUMLApplication.SelectedModels[0] as PUMLPackage);
      MainForm.OpenUnitDialog.FileName := '';
      if MainForm.OpenUnitDialog.Execute then
      begin
        AUnit := StarUMLApplication.OpenUnit(StarUMLApplication.SelectedModels[0] as PUMLPackage,
        MainForm.OpenUnitDialog.FileName);
        MainForm.ModelExplorer.Expand(StarUMLApplication.SelectedModels[0]);
        StarUMLApplication.SelectModel(AUnit.DocumentElement as PModel);
        SelectModelExplorerDockPanel(AUnit.DocumentElement as PModel);
      end;
    except
      on EReadOnlyDocument do MessageDlg(C_ERR_READONLY, mtError, [mbOK], 0);
    end;
  end;
end;

procedure PMain.ExecuteFileUnitsDeleteUnit;
var
  R: Integer;
  AUnit: PUMLUnitDocument;
begin
  if (StarUMLApplication.SelectedModelCount = 1) and
     (StarUMLApplication.SelectedModels[0] is PUMLPackage) then
  begin
    try
      CheckReadOnly((StarUMLApplication.SelectedModels[0] as PUMLPackage).Namespace);
    except
      on EReadOnlyDocument do MessageDlg(C_ERR_READONLY, mtError, [mbOK], 0);
    end;
    AUnit := (StarUMLApplication.SelectedModels[0] as PUMLPackage).Document as PUMLUnitDocument;
    R := Application.MessageBox(PChar(ExtractFileName(AUnit.FileName) + ' ' + QUERY_DELETE_UNIT), PChar(Application.Title),
      MB_ICONQUESTION or MB_YESNO);
    if R = IDYES then
    begin
      StarUMLApplication.DeleteUnit(AUnit.DocumentElement as PUMLPackage);
    end;
  end;
end;

procedure PMain.ExecuteFileUnitsSave;
begin
  if (StarUMLApplication.SelectedModelCount = 1) and
     (StarUMLApplication.SelectedModels[0] is PUMLPackage) then
  begin
    StarUMLApplication.SaveUnit(StarUMLApplication.SelectedModels[0] as PUMLPackage);
  end;
  UpdateDocumentElements;
end;

procedure PMain.ExecuteFileUnitsSaveAs;
begin
  if (StarUMLApplication.SelectedModelCount = 1) and
     (StarUMLApplication.SelectedModels[0] is PUMLPackage) then
  begin
    if StarUMLApplication.SelectedModels[0].IsDocumentElement then begin
      try
        CheckReadOnly((StarUMLApplication.SelectedModels[0] as PUMLPackage).Namespace);
        MainForm.SaveUnitDialog.FileName := StarUMLApplication.SelectedModels[0].Document.FileName;
        if MainForm.SaveUnitDialog.Execute then
          StarUMLApplication.SaveUnitAs(StarUMLApplication.SelectedModels[0] as PUMLPackage,
            MainForm.SaveUnitDialog.FileName);
      except
        on SaveDialogEx.EDirectoryNotFound do MessageDlg(ERR_DIRECTORY_NOT_FOUND, mtError, [mbOK], 0);
        on SaveDialogEx.EInvalidFileName do MessageDlg(ERR_INVALID_FILE_NAME, mtError, [mbOK], 0);
        on EReadOnlyDocument do MessageDlg(C_ERR_READONLY, mtError, [mbOK], 0);
      end;
    end;
  end;
  UpdateDocumentElements;
end;

procedure PMain.ExecuteFileImportFramework;
begin
  if ImportFrameworkForm.Execute then begin
    ElementSelectorForm.Filter([PUMLProject, PUMLModel, PUMLSubsystem, PUMLPackage]);
    ElementSelectorForm.ClearSelectableModels;
    ElementSelectorForm.AddSelectableModel(PUMLProject);
    ElementSelectorForm.AddSelectableModel(PUMLModel);
    ElementSelectorForm.AddSelectableModel(PUMLSubsystem);
    ElementSelectorForm.AddSelectableModel(PUMLPackage);
    ElementSelectorForm.AllowNull := False;
    if ElementSelectorForm.Execute(MSG_ELEMSELTTL_IMPORT_FRAMEWORK) then begin
      try
        CheckReadOnly(ElementSelectorForm.SelectedModel);
      except
        on EReadOnlyDocument do MessageDlg(C_ERR_READONLY, mtError, [mbOK], 0);
      end;
      StarUMLApplication.ImportFramework(ElementSelectorForm.SelectedModel as PUMLPackage, ImportFrameworkForm.FrameworkName);

      //-- MainForm.BrowserFrame.RebuildAll;
      Screen.Cursor := crHourGlass;
      MainForm.ModelExplorer.RebuildAll;
      MainForm.DiagramExplorer.RebuildAll;
      Screen.Cursor := crDefault;
      //--

      MainForm.ModelExplorer.Expand(ElementSelectorForm.SelectedModel);
      ElementSelectorForm.AllowNull := True;
    end;
  end;
end;

procedure PMain.ExecuteFileImportModelFragment;
begin
  if MainForm.ImportModelFragmentDialog.Execute then begin
    ElementSelectorForm.Filter([PUMLProject, PUMLModel, PUMLSubsystem, PUMLPackage]);
    ElementSelectorForm.ClearSelectableModels;
    ElementSelectorForm.AddSelectableModel(PUMLProject);
    ElementSelectorForm.AddSelectableModel(PUMLModel);
    ElementSelectorForm.AddSelectableModel(PUMLSubsystem);
    ElementSelectorForm.AddSelectableModel(PUMLPackage);
    ElementSelectorForm.AllowNull := False;
    if ElementSelectorForm.Execute(MSG_ELEMSELTTL_IMPORT_MODELFRAGMENT) then begin
      try
        CheckReadOnly(ElementSelectorForm.SelectedModel);
      except
        on EReadOnlyDocument do MessageDlg(C_ERR_READONLY, mtError, [mbOK], 0);
      end;
      StarUMLApplication.ImportModelFragment(ElementSelectorForm.SelectedModel as PUMLPackage, MainForm.ImportModelFragmentDialog.FileName);

      //-- MainForm.BrowserFrame.RebuildAll;
      Screen.Cursor := crHourGlass;
      MainForm.ModelExplorer.RebuildAll;
      MainForm.DiagramExplorer.RebuildAll;
      Screen.Cursor := crDefault;
      //--

      MainForm.ModelExplorer.Expand(ElementSelectorForm.SelectedModel);
      ElementSelectorForm.AllowNull := True;
    end;
  end;
end;

procedure PMain.ExecuteFileExportModelFragment;
begin
  if (StarUMLApplication.SelectedModelCount = 1) and
     (StarUMLApplication.SelectedModels[0] is PUMLPackage) then
  begin
    try
      if MainForm.SaveModelFragmentDialog.Execute then
        StarUMLApplication.ExportModelFragment(StarUMLApplication.SelectedModels[0] as PUMLPackage,
                                               MainForm.SaveModelFragmentDialog.FileName);
    except
      on SaveDialogEx.EDirectoryNotFound do MessageDlg(ERR_DIRECTORY_NOT_FOUND, mtError, [mbOK], 0);
      on SaveDialogEx.EInvalidFileName do MessageDlg(ERR_INVALID_FILE_NAME, mtError, [mbOK], 0);
    end;

  end;
end;

procedure PMain.ExecuteFileExportDiagram;
var
  ADiagramView: PDiagramView;
  Idx: Integer;
begin
  if not Assigned(StarUMLApplication.ActiveDiagram) then begin
    MessageDlg(ERR_DGM_EXPORT_NO_OPENED_DGM, mtError, [mbOK], 0);
    Exit;
  end;
  ADiagramView := StarUMLApplication.ActiveDiagram;
  if ADiagramView.OwnedViewCount > 0 then begin
    MainForm.ExportDiagramDialog.FileName := ADiagramView.Diagram.Name;
    try
      if MainForm.ExportDiagramDialog.Execute then begin
        Idx := MainForm.ExportDiagramDialog.FilterIndex;
        if (Idx = 1) or (Idx = 2) then // JPEG
          StarUMLApplication.SaveDiagramImageToJPEG(ADiagramView, MainForm.ExportDiagramDialog.FileName)
        else if Idx = 3 then           // BITMAP
          StarUMLApplication.SaveDiagramImageToBitmap(ADiagramView, MainForm.ExportDiagramDialog.FileName)
        else if Idx = 4 then           // METAFILE (Enhanced)
          StarUMLApplication.SaveDiagramImageToMetafile(ADiagramView, MainForm.ExportDiagramDialog.FileName, True)
        else if Idx = 5 then           // METAFILE
          StarUMLApplication.SaveDiagramImageToMetafile(ADiagramView, MainForm.ExportDiagramDialog.FileName, False);
      end;
    except
      on SaveDialogEx.EDirectoryNotFound do MessageDlg(ERR_DIRECTORY_NOT_FOUND, mtError, [mbOK], 0);
      on SaveDialogEx.EInvalidFileName do MessageDlg(ERR_INVALID_FILE_NAME, mtError, [mbOK], 0);
    end;
  end else begin
    MessageDlg(ERR_DGM_EXPORT_EMPTY_DGM, mtError, [mbOK], 0);
  end;
end;

procedure PMain.ExecuteFilePrint;
var
  AProject: PUMLProject;

  procedure AddDiagramsToPrintForm(AModel: PModel; APrintForm: TPrintForm);
  var
    TempModel: PModel;
    I: Integer;
  begin
    for I := 0 to AModel.VirtualOwnedModelCount - 1 do begin
      TempModel := AModel.VirtualOwnedModels[I];
      if TempModel is PUMLDiagram then
        APrintForm.AddDiagram((TempModel as PUMLDiagram).DiagramView);
      if TempModel.VirtualOwnedModelCount > 0 then
        AddDiagramsToPrintForm(TempModel, APrintForm);
    end;
  end;

begin
  if Assigned(PrintForm) then begin
    AProject := StarUMLApplication.Project;
    PrintForm.Initialize;
    PrintForm.Project := AProject;
    AddDiagramsToPrintForm(AProject, PrintForm);
    if StarUMLApplication.ActiveDiagram <> nil then
      PrintForm.ActiveDiagramView := StarUMLApplication.ActiveDiagram;
    PrintForm.ShowModal;
  end;
end;

procedure PMain.ExecuteFilePageSetup;
begin
  if Assigned(PageSetupForm) then PageSetupForm.ShowModal;
end;

procedure PMain.ExecuteEditUndo;
begin
  StarUMLApplication.Undo;
  MainForm.WorkingAreaFrame.RedrawActiveDiagram;
end;

procedure PMain.ExecuteEditRedo;
begin
  StarUMLApplication.Redo;
  MainForm.WorkingAreaFrame.RedrawActiveDiagram;
end;

procedure PMain.ExecuteFormatFont;
var
  FontItems: PFontItemKinds;
  V: PView;
  FontName: string;
  FontSize: Integer;
  FontColor: TColor;
  FontStyle: TFontStyles;
  FontEffect: TFontStyles;
  NCFontName, NCFontSize, NCFontColor, NCFontStyle, NCFontEffect: Boolean;
  StyleDisabled: Boolean;
  I: Integer;
begin
  if StarUMLApplication.SelectedViewCount = 0 then
    Exit;
  // Get selected view's font infomation;
  V := StarUMLApplication.SelectedViews[0];
  FontName := V.FontFace;
  FontSize := V.FontSize;
  FontColor := V.FontColor;
  FontStyle := V.FontStyle * [fsBold, fsItalic];
  FontEffect := V.FontStyle * [fsUnderline, fsStrikeOut];
  NCFontName := False;
  NCFontSize := False;
  NCFontColor := False;
  NCFontStyle := False;
  NCFontEffect := False;
  StyleDisabled := not ((V is PUMLCustomTextView) or (V is PUMLSystemBoundaryView));
  for I := 1 to StarUMLApplication.SelectedViewCount - 1 do begin
    V := StarUMLApplication.SelectedViews[I];
    if V.FontFace <> FontName then NCFontName := True;
    if V.FontSize <> FontSize then NCFontSize := True;
    if V.FontColor <> FontColor then NCFontColor := True;
    if (V.FontStyle * [fsBold, fsItalic]) <> FontStyle then NCFontStyle := True;
    if (V.FontStyle * [fsUnderline, fsStrikeOut]) <> FontEffect then NCFontEffect := True;
    if not (V is PUMLCustomTextView) then
      StyleDisabled := True;
  end;

  // Execute font dialog
  with MainForm do begin
    FontDialog.DisableParts := [];
    FontDialog.IndeterminateParts := [];
    if StyleDisabled then
      FontDialog.DisableParts := [fpFontStyle, fpFontEffect];
    FontDialog.Font.Name := FontName;
    FontDialog.Font.Size := FontSize;
    FontDialog.Font.Color := FontColor;
    FontDialog.Font.Style := FontStyle;
    if NCFontName then
      FontDialog.IndeterminateParts := FontDialog.IndeterminateParts + [fpFontName];
    if NCFontSize then
      FontDialog.IndeterminateParts := FontDialog.IndeterminateParts + [fpFontSize];
    if NCFontColor then
      FontDialog.IndeterminateParts := FontDialog.IndeterminateParts + [fpFontColor];
    if NCFontStyle then
      FontDialog.IndeterminateParts := FontDialog.IndeterminateParts + [fpFontStyle];
    if NCFontEffect then
      FontDialog.IndeterminateParts := FontDialog.IndeterminateParts + [fpFontEffect];

    if FontDialog.Execute then begin
      FontItems := [];
      if not (fpFontName in FontDialog.IndeterminateParts) then
        FontItems := FontItems + [fiName];
      if not (fpFontSize in FontDialog.IndeterminateParts) then
        FontItems := FontItems + [fiSize];
      if not (fpFontColor in FontDialog.IndeterminateParts) then
        FontItems := FontItems + [fiColor];
      if not (fpFontStyle in FontDialog.DisableParts) and not (fpFontStyle in FontDialog.IndeterminateParts) then
        FontItems := FontItems + [fiStyle];
      if not (fpFontEffect in FontDialog.DisableParts) and not (fpFontEffect in FontDialog.IndeterminateParts) then
        FontItems := FontItems + [fiEffect];
      StarUMLApplication.ChangeSelectedViewsFont(FontDialog.Font, FontItems);
    end;
  end;
end;

procedure PMain.ExecuteFormatLineColor;
begin
  if StarUMLApplication.SelectedViewCount = 0 then
    Exit;
  with MainForm.ColorDialog do begin
    Color := StarUMLApplication.SelectedViews[0].LineColor;
    if Execute then StarUMLApplication.ChangeSelectedViewsLineColor(Color);
  end;
end;

procedure PMain.ExecuteFormatFillColor;
begin
  if StarUMLApplication.SelectedViewCount = 0 then
    Exit;
  with MainForm.ColorDialog do begin
    Color := StarUMLApplication.SelectedViews[0].FillColor;
    if Execute then StarUMLApplication.ChangeSelectedViewsFillColor(Color);
  end;
end;

procedure PMain.ExecuteModelProfiles;
begin
  ProfileManagerForm.ShowProfiles;
end;

procedure PMain.ExecuteViewRefresh;
begin
  MainForm.WorkingAreaFrame.UpdateActiveDiagram;
  MainForm.WorkingAreaFrame.RedrawActiveDiagram;
end;

procedure PMain.ExecuteViewZoom(AType: PZoomType; ZoomValue: Integer);
var
  CurrentZoom, NewZoom: Integer;
  BoundingRect, ScrollClientRect: TRect;
  X, Y, CX, CY: Integer;

  function CalcFittingZoomPercent(Basis, Actual: Integer): Integer;
  var
    P: Real;
  begin
    P := (Basis / Actual) * 100;
    Result := Trunc(P);
  end;

begin
  // Zoom is available from 10% to 200%
  if MainForm.WorkingAreaFrame.ActiveDiagramEditor <> nil then begin
    CurrentZoom := MainForm.WorkingAreaFrame.ActiveDiagramEditor.ZoomPercent;
    NewZoom := 100;
    case AType of
      ztZoomIn: NewZoom := Min(200, CurrentZoom + 5);
      ztZoomOut: NewZoom := Max(10, CurrentZoom - 5);
      ztZoomFitInWindow: begin
        BoundingRect := MainForm.WorkingAreaFrame.ActiveDiagramEditor.DiagramView.GetBoundingBox(MainForm.WorkingAreaFrame.ActiveDiagramEditor.DiagramView.Canvas);
        ScrollClientRect := MainForm.WorkingAreaFrame.ActiveDiagramEditor.ScrollBox.ClientRect;
        X := BoundingRect.Right;
        Y := BoundingRect.Bottom;
        CX := ScrollClientRect.Right;
        CY := ScrollClientRect.Bottom;
        if (X <= CX) and (Y <= CY) then
          NewZoom := 100
        else if (X > CX) and (Y <= CY) then
          NewZoom := CalcFittingZoomPercent(CX, X)
        else if (X <= CX) and (Y > CY) then
          NewZoom := CalcFittingZoomPercent(CY, Y)
        else begin
          if (X - CX) > (Y - CY) then
            NewZoom := CalcFittingZoomPercent(CX, X)
          else
            NewZoom := CalcFittingZoomPercent(CY, Y);
        end;
        MainForm.WorkingAreaFrame.ActiveDiagramEditor.ScrollBox.HorzScrollBar.Position := 0;
        MainForm.WorkingAreaFrame.ActiveDiagramEditor.ScrollBox.VertScrollBar.Position := 0;
      end;
      ztZoomValue: NewZoom := Min(200, Max(10, ZoomValue));
    end;
    MainForm.WorkingAreaFrame.ActiveDiagramEditor.ZoomPercent := NewZoom;
    MainForm.WorkingAreaFrame.RedrawActiveDiagram;

    MenuStateHandler.BeginUpdate;
    MenuStateHandler.UpdateViewMenus;
    MenuStateHandler.EndUpdate;

  end;
end;

procedure PMain.ExecuteViewDiagramPageList(ABarItem: TdxBarListItem);
var
  D: PDiagram;
begin
  if MainForm.ViewDiagramPageList.ItemIndex > -1 then
  begin
    D := MainForm.ViewDiagramPageList.Items.Objects[MainForm.ViewDiagramPageList.ItemIndex] as PDiagram;
    MainForm.WorkingAreaFrame.OpenDiagram(D);
  end;
end;

procedure PMain.ExecuteToolsOptions;
begin
  if OptionDepository.ShowDialog then
  begin
    ApplyOptionValues;
    EventPublisher.NotifyEvent(EK_OPTIONS_APPLIED);
  end;
end;

procedure PMain.ExecuteToolsAddInManager;
begin
  AddInMgrForm.ShowModal;
end;

function PMain.ExecuteFileOpenWithParam: Boolean;
var
  FileName, FileExt: string;
begin
  Result := False;
  if ParamCount = 1 then begin
    FileName := ParamStr(1);
    if FileName <> '' then begin
      FileExt := LowerCase(ExtractFileExt(FileName));
      if FileExt = '.uml' then begin
        StarUMLApplication.OpenProject(FileName);
        MainForm.WorkingAreaFrame.OpenAllDefaultDiagrams;
        MainForm.AddRecentFile(StarUMLApplication.FileName);
        Result := True;
      end;
    end;
  end;
end;

procedure PMain.ApplyOptionValues;
begin
  MainForm.NumberOfRecentProjects := OptionDepository.NumberOfRecentProjects;
  NewProjectForm.NumberOfRecentProjects := OptionDepository.NumberOfRecentProjects;
  StarUMLApplication.UndoLevel := OptionDepository.UndoLevel;
  StarUMLApplication.CreateBackupFile := OptionDepository.CreateBackupFile;
  MainForm.ModelExplorer.ShowStereotype := OptionDepository.BrowserShowStereotype;
  CollectionEditorForm.ShowStereotype := OptionDepository.ColEdtShowStereotype;
  CollectionEditorForm.ShowVisibilityIcon := OptionDepository.ColEdtShowVisibilityIcon;
  CollectionEditorForm.ShowNameOnly := OptionDepository.ColEdtShowNameOnly;
  MainForm.WorkingAreaFrame.DiagramWidth := OptionDepository.DefaultDiagramWidth;
  MainForm.WorkingAreaFrame.DiagramHeight := OptionDepository.DefaultDiagramHeight;
  MainForm.WorkingAreaFrame.GridWidth := OptionDepository.GridWidth;
  MainForm.WorkingAreaFrame.GridHeight := OptionDepository.GridHeight;
  MainForm.WorkingAreaFrame.ShowGrid := OptionDepository.ShowGrid;
  OptionDefaultAttrVisibility := PUMLVisibilityKind(OptionDepository.DefaultAttrVisibility);
  OptionDefaultOperVisibility := PUMLVisibilityKind(OptionDepository.DefaultOperVisibility);
  OptionDefaultFillColor := OptionDepository.DefaultFillColor;
  OptionDefaultLineColor := OptionDepository.DefaultLineColor;
  OptionDefaultFontFace := OptionDepository.DefaultFontFace;
  OptionDefaultFontSize :=  OptionDepository.DefaultFontSize;
  OptionDefaultFontColor := OptionDepository.DefaultFontColor;
  OptionLineStyle := PLineStyleKind(OptionDepository.LineStyle);
  OptionStereotypeDisplay := PUMLStereotypeDisplayKind(OptionDepository.StereotypeDisplay);
  OptionShowParentName := OptionDepository.ShowParentName;
  OptionAutoResize := OptionDepository.AutoResize;
  OptionShowCompartmentVisibility := OptionDepository.ShowCompartmentVisibility;
  OptionShowCompartmentStereotype := OptionDepository.ShowCompartmentStereotype;
  OptionShowOperationSignature := OptionDepository.ShowOperationSignature;
  OptionShowProperty := OptionDepository.ShowProperty;
  OptionSuppressAttributes := OptionDepository.SuppressAttributes;
  OptionSuppressOperations := OptionDepository.SuppressOperations;
  OptionEnumerationSuppressLiterals := OptionDepository.EnumerationSuppressLiterals;
  OptionActorStereotypeDisplay := PUMLStereotypeDisplayKind(OptionDepository.ActorStereotypeDisplay);
  OptionActorSuppressAttributes := OptionDepository.ActorSuppressAttributes;
  OptionActorSuppressOperations := OptionDepository.ActorSuppressOperations;
  OptionUseCaseStereotypeDisplay := PUMLStereotypeDisplayKind(OptionDepository.UseCaseStereotypeDisplay);
  OptionUseCaseSuppressAttributes := OptionDepository.UsecaseSuppressAttributes;
  OptionUseCaseSuppressOperations := OptionDepository.UsecaseSuppressOperations;
  OptionInterfaceStereotypeDisplay := PUMLStereotypeDisplayKind(OptionDepository.InterfaceStereotypeDisplay);
  OptionInterfaceSuppressAttributes := OptionDepository.InterfaceSuppressAttributes;
  OptionInterfaceSuppressOperations := OptionDepository.InterfaceSuppressOperations;
  OptionArtifactStereotypeDisplay := PUMLStereotypeDisplayKind(OptionDepository.ArtifactStereotypeDisplay);
  OptionArtifactSuppressAttributes := OptionDepository.ArtifactSuppressAttributes;
  OptionArtifactSuppressOperations := OptionDepository.ArtifactSuppressOperations;
  OptionComponentStereotypeDisplay := PUMLStereotypeDisplayKind(OptionDepository.ComponentStereotypeDisplay);
  OptionNodeStereotypeDisplay := PUMLStereotypeDisplayKind(OptionDepository.NodeStereotypeDisplay);
  OptionShowSequenceNumber := OptionDepository.ShowSequnceNumber;
  OptionMessageSignature := PUMLMessageSignatureKind(OptionDepository.MessageSignature);
  OptionShowActivation := OptionDepository.ShowActivation;
  OptionHelpUrl := OptionDepository.HelpUrl;
  OptionWordWrapByDefault := OptionDepository.WordWrapByDefault;
end;

procedure PMain.PopupQuickDialog(AView: PView; X, Y: Integer; OnElementCreating: Boolean = False);
var
  P: TPoint;
  C: Integer;
begin
  if AView = nil then Exit;
  if OnElementCreating then begin
    if AView is PUMLCustomSeqMessageView then begin
      C := (AView as PEdgeView).Points.Count;
      P := (AView as PEdgeView).Points.Points[C - 1];
      MainForm.ShowQuickDialog(AView, P, True);
    end
    else if (AView is PNodeView) and not (AView is PUMLCustomColMessageView) then
      MainForm.ShowQuickDialog(AView, Point(X, Y));
  end
  else
    MainForm.ShowQuickDialog(AView, Point(X, Y));
end;

procedure PMain.PopupQuickDialogForSubElement(OwnerModel: PModel; ModelKind: string; Argument: Integer);
var
  DgmView: PDiagramView;
  SelView: PView;
  ArgModel: PModel;
  P, P_LT, P_RB: TPoint;
begin
  if (ModelKind = 'Operation') or
     (ModelKind = 'Attribute') or
     (ModelKind = 'EnumerationLiteral') or
     ((ModelKind = 'UninterpretedAction') and (Argument >= 0))
  then begin
    DgmView := StarUMLApplication.ActiveDiagram;
    if DgmView <> nil then begin
      GetCursorPos(P);
      with MainForm.WorkingAreaFrame do begin
        P_LT := MainForm.WorkingAreaFrame.ClientToScreen(Point(Left, Top));
        P_RB := MainForm.WorkingAreaFrame.ClientToScreen(Point(Left + Width, Top + Height));
        if (P.X >= P_LT.X) and (P.X <= P_RB.X) and
           (P.Y >= P_LT.Y) and (P.Y <= P_RB.Y) then
        begin
          if StarUMLApplication.SelectedViewCount = 1 then begin
            SelView := StarUMLApplication.SelectedViews[0];
            if SelView.Model = OwnerModel then begin
              if StarUMLApplication.EventArgModelCount = 1 then begin
                ArgModel := StarUMLApplication.EventArgModels[0];
                MainForm.ShowQuickDialogByModelCreation(SelView, ArgModel);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure PMain.ProcessDoubleClickAction(AView: PView; X, Y: Integer);
begin
  if AView = nil then
    Exit;
  PopupQuickDialog(AView, X, Y);
  // reserved for double click action customization
end;

procedure PMain.ProcessPropertyAction;
begin
  if StarUMLApplication.SelectedModelCount = 0 then
    Exit;
  MainForm.InspectorFrame.SetFocusOnPropertyEditor;
  // reserved for menu property action customization
end;

procedure PMain.BrowseElement(AModel: PModel);
begin
  if AModel <> nil then begin
    if AModel is PDiagram then
    begin
      MainForm.WorkingAreaFrame.OpenDiagram(AModel as PDiagram);
    end
    else begin
      if AModel.ViewCount > 0 then
      begin
        MainForm.WorkingAreaFrame.OpenDiagram(AModel.View[0].GetDiagramView.Diagram);
      end;
    end;
    SelectModelExplorerDockPanel(AModel);
  end;
end;

procedure PMain.BrowseElement(PathName: string);
var
  M: PModel;
begin
  M := StarUMLApplication.Project.FindByRelativePathname(PathName);
  if M <> nil then
    BrowseElement(M);
end;

procedure PMain.SelectModelExplorerDockPanel(AModel: PModel);
begin
  // Is ModelExplorerDockPanel inside tab panel?
  if (MainForm.ModelExplorerDockPanel.TabContainer = nil)
    // Is ModelExplorerDockPanel active panel?
    or (MainForm.ModelExplorerDockPanel.TabContainer.ActiveChild =
      MainForm.ModelExplorerDockPanel ) then

     if MainForm.ModelExplorerDockPanel.Visible then begin
        if  MainForm.ModelExplorerDockPanel.Showing then
          MainForm.ModelExplorer.SelectWithFocus(AModel);
        MainForm.ModelExplorer.Expand(AModel);
     end;


end;

// Inner utility methods
////////////////////////////////////////////////////////////////////////////////

// PMain
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// PMainFormMenuStateHandler

constructor PMainFormMenuStateHandler.Create;
begin
  inherited;
  FGeneralEditMenuEnabled := True;
  BeginUpdate;
  MainForm.AlwaysGroup.Visible := ivAlways;
  MainForm.AlwaysGroup.Enabled := True;
  //UpdateTopLevelMenus;
  //UpdateViewMenus;
  EndUpdate;
end;

procedure PMainFormMenuStateHandler.SetGeneralEditMenuEnabled(Value: Boolean);
begin
  if FGeneralEditMenuEnabled <> Value then
  begin
    FGeneralEditMenuEnabled := Value;
    UpdateEditMenus;
  end;
end;

procedure PMainFormMenuStateHandler.BeginUpdate;
begin
  MainForm.BarManager.LockUpdate := True;
end;

procedure PMainFormMenuStateHandler.EndUpdate;
begin
  MainForm.BarManager.LockUpdate := False;
end;

procedure PMainFormMenuStateHandler.SetProjectOpenedGroup(Enable: Boolean);
begin
  MainForm.ProjectOpenedGroup.Enabled := Enable;
end;

procedure PMainFormMenuStateHandler.SetDiagramActivatedGroup(Enable: Boolean);
begin
  MainForm.DiagramActivatedGroup.Enabled := Enable;
end;

procedure PMainFormMenuStateHandler.SetViewSelectedGroup(Enable: Boolean);
begin
  MainForm.ViewSelectedGroup.Enabled := Enable;
end;

procedure PMainFormMenuStateHandler.SetModelSelectedGroup(Enable: Boolean);
begin
  MainForm.ModelSelectedGroup.Enabled := Enable;
end;

procedure PMainFormMenuStateHandler.SetUnitSelectedGroup(Enable: Boolean);
begin
  MainForm.UnitSelectedGroup.Enabled := Enable;
end;

procedure PMainFormMenuStateHandler.UpdateTopLevelMenus;
begin
  with MainForm do
  begin
    FileMenu.Visible := ivAlways;
    if StarUMLApplication.Project <> nil then
    begin
      EditMenu.Visible := ivAlways;
      ModelMenu.Visible := ivAlways;
    end
    else begin
      EditMenu.Visible := ivNever;
      ModelMenu.Visible := ivNever;
    end;
    if StarUMLApplication.ActiveDiagram <> nil then
      FormatMenu.Visible := ivAlways
    else
      FormatMenu.Visible := ivNever;
    ViewMenu.Visible := ivAlways;
    ToolsMenu.Visible := ivAlways;
    HelpMenu.Visible := ivAlways;
  end;
end;

procedure PMainFormMenuStateHandler.UpdateFileMenus;
var
  Doc: PDocument;
begin
  with MainForm do
  begin
    FileUnitsSeparateUnit.Enabled :=
      (StarUMLApplication.SelectedModelCount = 1) and
      (StarUMLApplication.SelectedModels[0] is PUMLPackage) and
      (not StarUMLApplication.SelectedModels[0].IsDocumentElement);
    FileExportModelFragment.Enabled :=
      (StarUMLApplication.SelectedModelCount = 1) and
      (StarUMLApplication.SelectedModels[0] is PUMLPackage) and
      (not (StarUMLApplication.SelectedModels[0] is PUMLProject));
    if StarUMLApplication.DocumentElementCount <> 0 then begin
      Doc := (StarUMLApplication.DocumentElements[0]).Document;
      FileSave.Enabled := (Doc.ReadOnly = False);
    end;
  end;
end;

procedure PMainFormMenuStateHandler.UpdateEditMenus;
var
  MC: Integer;
  AD: PDiagramView;
  CBKind: PClipboardDataKind;
  CBElemKind: string;
  CBCopyContext: string;
begin
  MC := StarUMLApplication.SelectedModelCount;
  AD := StarUMLApplication.ActiveDiagram;
  with MainForm do
  begin
    // Determine Undo
    EditUndo.Enabled :=
      GeneralEditMenuEnabled and
      MainForm.IsActivated and
      StarUMLApplication.CanUndo;
    // Determine Redo
    EditRedo.Enabled :=
      GeneralEditMenuEnabled and
      MainForm.IsActivated and
      StarUMLApplication.CanRedo;
    // Determine Delete
    EditDelete.Enabled :=
      GeneralEditMenuEnabled and
      MainForm.IsActivated and
      ((AD <> nil) and (AD.CanDeleteViews));
    // Determine Delete from Model
    {EditDeleteFromModel.Enabled :=
      MainForm.IsActivated and
      ((MC > 0) and StarUMLApplication.SelectedModels[0].CanDelete);}
    EditDeleteFromModel.Enabled := IsEditDeleteFromModelEnabled;
    // Determine SelectAll
    EditSelectAll.Enabled :=
      GeneralEditMenuEnabled and
      MainForm.IsActivated and
      (AD <> nil);
    // Delermine CopyDiagram
    EditCopyDiagram.Enabled :=
      MainForm.IsActivated and
      (AD <> nil) and
      (AD.OwnedViewCount > 0);
    // Delermine CopyDiagramAsBitmap
    EditCopyDiagramAsBitmap.Enabled :=
      MainForm.IsActivated and
      (AD <> nil) and
      (AD.OwnedViewCount > 0);
    // Determine Copy
    {EditCopy.Enabled :=
      GeneralEditMenuEnabled and
      MainForm.IsActivated and
      (((MC = 1) and (StarUMLApplication.SelectedModels[0].CanCopy)) or
      ((AD <> nil) and (AD.CanCopyViews)));}

    EditCopy.Enabled := IsEditCopyEnabled;
    // Determine Cut
    {EditCut.Enabled :=
      GeneralEditMenuEnabled and
      MainForm.IsActivated and
      (((MC = 1) and (StarUMLApplication.SelectedModels[0].CanCopy)  and (StarUMLApplication.SelectedModels[0].CanDelete)) or
      ((AD <> nil) and (AD.CanCopyViews) and (AD.CanDeleteViews)));}
    // Determine Paste
    EditCut.Enabled := IsEditCutEnabled;
    EditPaste.Enabled := False;
    CBKind := StarUMLApplication.ClipboardDataKind;
    CBElemKind := StarUMLApplication.ClipboardElementKind;
    CBCopyContext := StarUMLApplication.ClipboardCopyContext;
    case CBKind of
      ckView: begin
        EditPaste.Enabled :=
          GeneralEditMenuEnabled and
          {MainForm.IsActivated and}
          (AD <> nil) and
          AD.CanPasteViews(CBElemKind, CBCopyContext);
      end;
      ckModel: begin
        EditPaste.Enabled :=
          GeneralEditMenuEnabled and
          {MainForm.IsActivated and}
          (MC = 1) and
          StarUMLApplication.SelectedModels[0].CanPaste(CBElemKind, CBCopyContext);
      end;
    end;
    // Determine Go To
    EditGoTo.Enabled :=
      MainForm.IsActivated and (MC = 1);
  end;
end;

function PMainFormMenuStateHandler.IsEditDeleteFromModelEnabled: Boolean;
begin
  with StarUMLApplication do
    Result := {MainForm.IsActivated and}
      ((SelectedModelCount > 0) and SelectedModels[0].CanDelete);
end;

function PMainFormMenuStateHandler.IsEditCutEnabled: Boolean;
begin
  with StarUMLApplication do
    Result := GeneralEditMenuEnabled {and MainForm.IsActivated} and
      (((SelectedModelCount = 1) and (SelectedModels[0].CanCopy) and
          (SelectedModels[0].CanDelete)) or
        ((ActiveDiagram <> nil) and (ActiveDiagram.CanCopyViews)
        and (ActiveDiagram.CanDeleteViews)));

  end;

function PMainFormMenuStateHandler.IsEditCopyEnabled: Boolean;
begin
  with StarUMLApplication do
    Result := GeneralEditMenuEnabled {and MainForm.IsActivated} and
      (((SelectedModelCount = 1) and (SelectedModels[0].CanCopy)) or
        ((ActiveDiagram <> nil) and (ActiveDiagram.CanCopyViews)));

end;

procedure PMainFormMenuStateHandler.UpdateFormatMenus;
const
  NOT_ASSIGNED = '(not-assigned)';

var
  I: Integer;
  V: PView;
  NodeCount: Integer;
  ELine, EStereo, EAttr, EOper, ELiter, EParent, EProp, EOperSig, EComVisi, EComStereo, EAuto, EExtNot, EWordWrap: Boolean;
  VLine, VStereo, VAttr, VOper, VLiter, VParent, VProp, VOperSig, VComVisi, VComStereo, VAuto, VExtNot, VWordWrap: string;
  VFontFace, VFontSize: string;

  function MergeStringValue(Base, Addition: string): string;
  begin
    if Base = NOT_ASSIGNED then Result := Addition
    else if Base = ''           then Result := ''
    else if Base = Addition     then Result := Base
    else if Base <> Addition    then Result := ''
                                else Result := '';
  end;

begin
  NodeCount := 0;
  ELine := False;
  EStereo := False;
  EAttr := False;
  EOper := False;
  ELiter := False;
  EParent := False;
  EOperSig := False;
  EProp := False;
  EComVisi := False;
  EComStereo := False;
  EExtNot := False;
  EAuto := False;
  EWordWrap := False;
  VLine := NOT_ASSIGNED;
  VStereo := NOT_ASSIGNED;
  VAttr := NOT_ASSIGNED;
  VOper := NOT_ASSIGNED;
  VLiter := NOT_ASSIGNED;
  VParent := NOT_ASSIGNED;
  VOperSig := NOT_ASSIGNED;
  VProp := NOT_ASSIGNED;
  VComVisi := NOT_ASSIGNED;
  VComStereo := NOT_ASSIGNED;
  VExtNot := NOT_ASSIGNED;
  VAuto := NOT_ASSIGNED;
  VWordWrap := NOT_ASSIGNED;
  VFontFace := NOT_ASSIGNED;
  VFontSize := NOT_ASSIGNED;
  with MainForm do
  begin
    // Initialization
    FormatLineStyle.Enabled := False;
    FormatLineStyleRectilinear.Enabled := False;
    FormatLineStyleOblique.Enabled := False;
    FormatStereotypeDisplay.Enabled := False;
    FormatStereotypeDisplayNone.Enabled := False;
    FormatStereotypeDisplayText.Enabled := False;
    FormatStereotypeDisplayIcon.Enabled := False;
    FormatSuppressAttributes.Enabled := False;
    FormatSuppressOperations.Enabled := False;
    FormatSuppressEnumerationLiterals.Enabled := False;
    FormatShowParentName.Enabled := False;
    FormatShowOperationSignature.Enabled := False;
    FormatShowProperty.Enabled := False;
    FormatShowCompartmentVisibility.Enabled := False;
    FormatShowCompartmentStereotype.Enabled := False;
    FormatAutoResize.Enabled := False;
    FormatShowExtendedNotation.Enabled := False;
    FormatWordWrap.Enabled := False;
    FormatAlignmentLeft.Enabled := False;
    FormatAlignmentRight.Enabled := False;
    FormatAlignmentMiddle.Enabled := False;
    FormatAlignmentTop.Enabled := False;
    FormatAlignmentBottom.Enabled := False;
    FormatAlignmentCenter.Enabled := False;
    FormatAlignmentSpaceEvenlyHorizontally.Enabled := False;
    FormatAlignmentSpaceEvenlyVertically.Enabled := False;
    // Determining enables and checks
    for I := 0 to StarUMLApplication.SelectedViewCount - 1 do
    begin
      V := StarUMLApplication.SelectedViews[I];
      if V is PNodeView then Inc(NodeCount);
      VFontFace := MergeStringValue(VFontFace, V.MOF_GetAttribute('FontFace'));
      VFontSize := MergeStringValue(VFontSize, V.MOF_GetAttribute('FontSize'));
      if V.MetaClass.ExistsAttribute('LineStyle') then begin
        ELine := True;
        VLine := MergeStringValue(VLine, V.MOF_GetAttribute('LineStyle'));
      end;
      if V.MetaClass.ExistsAttribute('StereotypeDisplay') then begin
        EStereo := True;
        VStereo := MergeStringValue(VStereo, V.MOF_GetAttribute('StereotypeDisplay'));
      end;
      if V.MetaClass.ExistsAttribute('SuppressAttributes') then begin
        EAttr := True;
        VAttr := MergeStringValue(VAttr, V.MOF_GetAttribute('SuppressAttributes'));
      end;
      if V.MetaClass.ExistsAttribute('SuppressOperations') then begin
        EOper := True;
        VOper := MergeStringValue(VOper, V.MOF_GetAttribute('SuppressOperations'));
      end;
      if V.MetaClass.ExistsAttribute('SuppressLiterals') then begin
        ELiter := True;
        VLiter := MergeStringValue(VLiter, V.MOF_GetAttribute('SuppressLiterals'));
      end;
      if V.MetaClass.ExistsAttribute('ShowParentName') then begin
        EParent := True;
        VParent := MergeStringValue(VParent, V.MOF_GetAttribute('ShowParentName'));
      end;
      if V.MetaClass.ExistsAttribute('ShowOperationSignature') then begin
        EOperSig := True;
        VOperSig := MergeStringValue(VOperSig, V.MOF_GetAttribute('ShowOperationSignature'));
      end;
      if V.MetaClass.ExistsAttribute('ShowProperty') then begin
        EProp := True;
        VProp := MergeStringValue(VProp, V.MOF_GetAttribute('ShowProperty'));
      end;
      if V.MetaClass.ExistsAttribute('ShowCompartmentVisibility') then begin
        EComVisi := True;
        VComVisi := MergeStringValue(VComVisi, V.MOF_GetAttribute('ShowCompartmentVisibility'));
      end;
      if V.MetaClass.ExistsAttribute('ShowCompartmentStereotype') then begin
        EComStereo := True;
        VComStereo := MergeStringValue(VComStereo, V.MOF_GetAttribute('ShowCompartmentStereotype'));
      end;
      if V.MetaClass.ExistsAttribute('ShowExtendedNotation') then begin
        EExtNot := True;
        VExtNot := MergeStringValue(VExtNot, V.MOF_GetAttribute('ShowExtendedNotation'));
      end;
      if V.MetaClass.ExistsAttribute('AutoResize') then begin
        EAuto := True;
        VAuto := MergeStringValue(VAuto, V.MOF_GetAttribute('AutoResize'));
      end;
      if V.MetaClass.ExistsAttribute('WordWrap') then begin
        EWordWrap := True;
        VWordWrap := MergeStringValue(VWordWrap, V.MOF_GetAttribute('WordWrap'));
      end;
    end;
    // Setting enables
    FormatLineStyle.Enabled := ELine;
    FormatLineStyleRectilinear.Enabled := ELine;
    FormatLineStyleOblique.Enabled := ELine;
    FormatStereotypeDisplay.Enabled := EStereo;
    FormatStereotypeDisplayNone.Enabled := EStereo;
    FormatStereotypeDisplayText.Enabled := EStereo;
    FormatStereotypeDisplayIcon.Enabled := EStereo;
    FormatSuppressAttributes.Enabled := EAttr;
    FormatSuppressOperations.Enabled := EOper;
    FormatSuppressEnumerationLiterals.Enabled := ELiter;
    FormatShowParentName.Enabled := EParent;
    FormatShowOperationSignature.Enabled := EOperSig;
    FormatShowProperty.Enabled := EProp;
    FormatShowCompartmentVisibility.Enabled := EComVisi;
    FormatShowCompartmentStereotype.Enabled := EComStereo;
    FormatShowExtendedNotation.Enabled := EExtNot;
    FormatAutoResize.Enabled := EAuto;
    FormatWordWrap.Enabled := EWordWrap;
    FormatAlignmentLeft.Enabled := (NodeCount > 1);
    FormatAlignmentRight.Enabled := (NodeCount > 1);
    FormatAlignmentMiddle.Enabled := (NodeCount > 1);
    FormatAlignmentTop.Enabled := (NodeCount > 1);
    FormatAlignmentBottom.Enabled := (NodeCount > 1);
    FormatAlignmentCenter.Enabled := (NodeCount > 1);
    FormatAlignmentSpaceEvenlyHorizontally.Enabled := (NodeCount > 1);
    FormatAlignmentSpaceEvenlyVertically.Enabled := (NodeCount > 1);
    // Setting checks
    if VLine = 'lsRectilinear' then begin
      FormatLineStyleRectilinear.Down := True;
      FormatLineStyleOblique.Down := False;
    end
    else if VLine = 'lsOblique' then begin
      FormatLineStyleRectilinear.Down := False;
      FormatLineStyleOblique.Down := True;;
    end
    else begin
      FormatLineStyleRectilinear.Down := False;
      FormatLineStyleOblique.Down := False;
    end;
    if VStereo = 'sdkLabel' then begin
      FormatStereotypeDisplayNone.Down := False;
      FormatStereotypeDisplayText.Down := True;
      FormatStereotypeDisplayIcon.Down := False;
      FormatStereotypeDisplayDecoration.Down := False;
    end
    else if VStereo = 'sdkIcon' then begin
      FormatStereotypeDisplayNone.Down := False;
      FormatStereotypeDisplayText.Down := False;
      FormatStereotypeDisplayIcon.Down := True;
      FormatStereotypeDisplayDecoration.Down := False;
    end
    else if VStereo = 'sdkNone' then begin
      FormatStereotypeDisplayNone.Down := True;
      FormatStereotypeDisplayText.Down := False;
      FormatStereotypeDisplayIcon.Down := False;
      FormatStereotypeDisplayDecoration.Down := False;
    end
    else if VStereo = 'sdkDecoration' then begin
      FormatStereotypeDisplayNone.Down := False;
      FormatStereotypeDisplayText.Down := False;
      FormatStereotypeDisplayIcon.Down := False;
      FormatStereotypeDisplayDecoration.Down := True;
    end
    else begin
      FormatStereotypeDisplayNone.Down := False;
      FormatStereotypeDisplayText.Down := False;
      FormatStereotypeDisplayIcon.Down := False;
    end;
    FormatSuppressAttributes.Down := (VAttr = 'True');
    FormatSuppressOperations.Down := (VOper = 'True');
    FormatSuppressEnumerationLiterals.Down := (VLiter = 'True');
    FormatShowParentName.Down := (VParent = 'True');
    FormatShowOperationSignature.Down := (VOperSig = 'True');
    FormatShowProperty.Down := (VProp = 'True');
    FormatShowCompartmentVisibility.Down := (VComVisi = 'True');
    FormatShowCompartmentStereotype.Down := (VComStereo = 'True');
    FormatShowExtendedNotation.Down := (VExtNot = 'True');
    FormatAutoResize.Down := (VAuto = 'True');
    FormatWordWrap.Down := (VWordWrap = 'True');
    // Updating ComboBoxes
    if VFontFace = NOT_ASSIGNED then FontFaceComboText := ''
                                else FontFaceComboText := VFontFace;
    if VFontSize = NOT_ASSIGNED then FontSizeComboText := ''
                                else FontSizeComboText := VFontSize;
  end;
end;

procedure PMainFormMenuStateHandler.UpdateModelMenus;
var
  M: PModel;
begin
  with MainForm do
  begin
    ModelAdd.Enabled := False;
    ModelAddDiagram.Enabled := False;
    AllModelsGroup.Visible := ivAlways;
    AllModelsGroup.Visible := ivNever;
    AllDiagramsGroup.Visible := ivAlways;
    AllDiagramsGroup.Visible := ivNever;
    if StarUMLApplication.SelectedModelCount = 1 then
    begin
      M := StarUMLApplication.SelectedModels[0];
      if M is PUMLProject then begin
        ModelAdd.Enabled := True;
        NamespacesGroup.Visible := ivAlways;
      end
      else if M is PUMLModel then begin
        ModelAdd.Enabled := True;
        NamespacesGroup.Visible := ivAlways;
        ClassifiersGroup.Visible := ivAlways;
        InstancesGroup.Visible := ivAlways;
        BehaviorsGroup.Visible := ivAlways;
        ModelAddPort.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        AllDiagramsGroup.Visible := ivAlways;
      end
      else if M is PUMLSubsystem then begin
        ModelAdd.Enabled := True;
        NamespacesGroup.Visible := ivAlways;
        ClassifiersGroup.Visible := ivAlways;
        InstancesGroup.Visible := ivAlways;
        BehaviorsGroup.Visible := ivAlways;
        ModelAddOperation.Visible := ivAlways;
        ModelAddPort.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        AllDiagramsGroup.Visible := ivAlways;
      end
      else if M is PUMLPackage then begin
        ModelAdd.Enabled := True;
        NamespacesGroup.Visible := ivAlways;
        ClassifiersGroup.Visible := ivAlways;
        InstancesGroup.Visible := ivAlways;
        BehaviorsGroup.Visible := ivAlways;
        ModelAddPort.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        AllDiagramsGroup.Visible := ivAlways;
      end
      else if M is PUMLClass then begin
        ModelAdd.Enabled := True;
        FeaturesGroup.Visible := ivAlways;
        BehaviorsGroup.Visible := ivAlways;
        ModelAddTemplateParameter.Visible := ivAlways;
        ModelAddClass.Visible := ivAlways;
        ModelAddInterface.Visible := ivAlways;
        ModelAddSignal.Visible := ivAlways;
        ModelAddException.Visible := ivAlways;
        ModelAddEnumeration.Visible := ivAlways;
        ModelAddPort.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        BehavioralDiagramsGroup.Visible := ivAlways;
      end
      else if M is PUMLInterface then begin
        ModelAdd.Enabled := True;
        FeaturesGroup.Visible := ivAlways;
        BehaviorsGroup.Visible := ivAlways;
        ModelAddPort.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        BehavioralDiagramsGroup.Visible := ivAlways;
      end
      else if M is PUMLEnumeration then begin
        ModelAdd.Enabled := True;
        BehaviorsGroup.Visible := ivAlways;
        ModelAddOperation.Visible := ivAlways;
        ModelAddEnumerationLiteral.Visible := ivAlways;
        ModelAddPort.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        BehavioralDiagramsGroup.Visible := ivAlways;
      end
      else if M is PUMLException then begin
        ModelAdd.Enabled := True;
        FeaturesGroup.Visible := ivAlways;
        BehaviorsGroup.Visible := ivAlways;
        ModelAddPort.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        BehavioralDiagramsGroup.Visible := ivAlways;
      end
      else if M is PUMLSignal then begin
        ModelAdd.Enabled := True;
        FeaturesGroup.Visible := ivAlways;
        BehaviorsGroup.Visible := ivAlways;
        ModelAddPort.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        BehavioralDiagramsGroup.Visible := ivAlways;
      end
      else if M is PUMLComponent then begin
        ModelAdd.Enabled := True;
        FeaturesGroup.Visible := ivAlways;
        BehaviorsGroup.Visible := ivAlways;
        ModelAddPort.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        BehavioralDiagramsGroup.Visible := ivAlways;
      end
      else if M is PUMLNode then begin
        ModelAdd.Enabled := True;
        BehaviorsGroup.Visible := ivAlways;
        ModelAddAttribute.Visible := ivAlways;
        ModelAddPort.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        BehavioralDiagramsGroup.Visible := ivAlways;
      end
      else if M is PUMLUseCase then begin
        ModelAdd.Enabled := True;
        FeaturesGroup.Visible := ivAlways;
        BehaviorsGroup.Visible := ivAlways;
        ModelAddPort.Visible := ivAlways;
        ModelAddExtensionPoint.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        BehavioralDiagramsGroup.Visible := ivAlways;
      end
      else if M is PUMLActor then begin
        ModelAdd.Enabled := True;
        FeaturesGroup.Visible := ivAlways;
        BehaviorsGroup.Visible := ivAlways;
        ModelAddPort.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        BehavioralDiagramsGroup.Visible := ivAlways;
      end
      else if M is PUMLActivityGraph then begin
        ModelAdd.Enabled := True;
        ModelAddSwimlane.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        ModelAddDiagramActivityDiagram.Visible := ivAlways;
      end
      else if M is PUMLStateMachine then begin
        ModelAddDiagram.Enabled := True;
        ModelAddDiagramStatechartDiagram.Visible := ivAlways;
      end
      else if M is PUMLCompositeState then begin
        ModelAdd.Enabled := True;
        ActionsGroup.Visible := ivAlways;
        if (M as PUMLCompositeState).StateMachine is PUMLActivityGraph then begin
          ModelAddActionState.Visible := ivAlways;
          ModelAddSubactivityState.Visible := ivAlways;
          ModelAddInitialState.Visible := ivAlways;
          ModelAddFinalState.Visible := ivAlways;
          ModelAddSynchronization.Visible := ivAlways;
          ModelAddDecision.Visible := ivAlways;
          ModelAddObjectFlowState.Visible := ivAlways;
          ModelAddFlowFinalState.Visible := ivAlways;
          ModelAddSignalAcceptState.Visible := ivAlways;
          ModelAddSignalSendState.Visible := ivAlways;
        end
        else begin
          ModelAddState.Visible := ivAlways;
          ModelAddSubmachineState.Visible := ivAlways;
          ModelAddShallowHistory.Visible := ivAlways;
          ModelAddDeepHistory.Visible := ivAlways;
          ModelAddChoicePoint.Visible := ivAlways;
          ModelAddJunctionPoint.Visible := ivAlways;
          ModelAddInitialState.Visible := ivAlways;
          ModelAddFinalState.Visible := ivAlways;
          ModelAddSynchronization.Visible := ivAlways;
          ModelAddFlowFinalState.Visible := ivAlways;
        end;
      end
      else if M is PUMLCollaboration then begin
        ModelAdd.Enabled := True;
        ModelAddTemplateParameter.Visible := ivAlways;
        ModelAddInteraction.Visible := ivAlways;
        ModelAddClassifierRole.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        ModelAddDiagramSequenceRoleDiagram.Visible := ivAlways;
        ModelAddDiagramCollaborationRoleDiagram.Visible := ivAlways;
      end
      else if M is PUMLCollaborationInstanceSet then begin
        ModelAdd.Enabled := True;
        ModelAddInteractionInstanceSet.Visible := ivAlways;
        ModelAddObject.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        ModelAddDiagramSequenceDiagram.Visible := ivAlways;
        ModelAddDiagramCollaborationDiagram.Visible := ivAlways;
      end
      else if M is PUMLInteraction then begin
        ModelAdd.Enabled := True;
        ModelAddCombinedFragment.Visible := ivAlways;
        ModelAddFrame.Visible := ivAlways;
        if (M as PUMLInteraction).OwnedDiagramCount = 0 then begin
          ModelAddDiagram.Enabled := True;
          ModelAddDiagramSequenceRoleDiagram.Visible := ivAlways;
          ModelAddDiagramCollaborationRoleDiagram.Visible := ivAlways;
        end;
      end
      else if M is PUMLInteractionInstanceSet then begin
        ModelAdd.Enabled := True;
        ModelAddCombinedFragment.Visible := ivAlways;
        ModelAddFrame.Visible := ivAlways;
        if (M as PUMLInteractionInstanceSet).OwnedDiagramCount = 0 then begin
          ModelAddDiagram.Enabled := True;
          ModelAddDiagramSequenceDiagram.Visible := ivAlways;
          ModelAddDiagramCollaborationDiagram.Visible := ivAlways;
        end;
      end
      else if M is PUMLActionState then begin
        ModelAdd.Enabled := True;
        ActionsGroup.Visible := ivAlways;
      end
      else if M is PUMLSubactivityState then begin
        ModelAdd.Enabled := True;
        ActionsGroup.Visible := ivAlways;
      end
      else if M is PUMLFinalState then begin
        ModelAdd.Enabled := True;
        ActionsGroup.Visible := ivAlways;
      end
      else if M is PUMLSubmachineState then begin
        ModelAdd.Enabled := True;
        ActionsGroup.Visible := ivAlways;
      end
      else if M is PUMLOperation then begin
        ModelAdd.Enabled := True;
        BehaviorsGroup.Visible := ivAlways;
        ModelAddParameter.Visible := ivAlways;
        ModelAddDiagram.Enabled := True;
        BehavioralDiagramsGroup.Visible := ivAlways;
      end
      else if M is PUMLTransition then begin
        ModelAdd.Enabled := True;
        EventsGroup.Visible := ivAlways;
        ModelAddEffect.Visible := ivAlways;
      end
      else if M is PUMLInstance then begin
        ModelAdd.Enabled := True;
        ModelAddAttributeLink.Visible := ivAlways;
      end
      else if M is PUMLCombinedFragment then begin
        ModelAdd.Enabled := True;
        ModelAddInteractionOperand.Visible := ivAlways;
      end
      else if M is PUMLInteractionOperand then begin
        ModelAdd.Enabled := True;
        ModelAddCombinedFragment.Visible := ivAlways;
      end;
      InteractionManager.SetExtMenuButtonsState(M);
    end;
  end;
end;

procedure PMainFormMenuStateHandler.UpdateViewMenus;
begin
  with MainForm do
  begin
    ViewModelExplorer.Down := ModelExplorerDockPanel.Visible or ModelExplorerDockPanel.AutoHide;
    ViewDiagramExplorer.Down := DiagramExplorerDockPanel.Visible or DiagramExplorerDockPanel.AutoHide;
    ViewPropertyEditor.Down := PropertiesDockPanel.Visible or PropertiesDockPanel.AutoHide;
    ViewDocumentationEditor.Down := DocumentationDockPanel.Visible or DocumentationDockPanel.AutoHide;
    ViewAttachmentEditor.Down := AttachmentsDockPanel.Visible or AttachmentsDockPanel.AutoHide;
    ViewOutputWindow.Down := OutputDockPanel.Visible or OutputDockPanel.AutoHide;
    ViewMessageWindow.Down := MessageDockPanel.Visible or MessageDockPanel.AutoHide;
    ViewToolbox.Down := ToolboxDockPanel.Visible or ToolboxDockPanel.AutoHide;
    ViewToolbarsStandard.Down := BarManager.Bars[STANDARD_BAR].Visible;
    ViewToolbarsFormat.Down := BarManager.Bars[FORMAT_BAR].Visible;
    ViewToolbarsView.Down := BarManager.Bars[VIEW_BAR].Visible;
    ViewToolbarsAlignment.Down := BarManager.Bars[ALIGNMENT_BAR].Visible;
    ViewToolbarsStatusBar.Down := BarManager.Bars[STATUS_BAR].Visible;
    if WorkingAreaFrame.ActiveDiagramEditor <> nil then
      ZoomComboText := IntToStr(WorkingAreaFrame.ActiveDiagramEditor.ZoomPercent) + '%'
    else
      ZoomComboText := '100%';
  end;
end;

procedure PMainFormMenuStateHandler.UpdateStatusBar;
var
  M: PModel;
  S: string;
begin
  with MainForm do
  begin
    // Update Modified.
    if StarUMLApplication.Modified then
      StatusBarModifiedInfo.Caption := MSG_DOCUMENT_MODIFIED
    else
      StatusBarModifiedInfo.Caption := '';
    // Update Status Info.
    if StarUMLApplication.SelectedModelCount = 0 then begin
      StatusBarInfo.Caption := '';
    end
    else if StarUMLApplication.SelectedModelCount = 1 then begin
      try
        M := StarUMLApplication.SelectedModels[0];
        if M.IsDocumentElement then begin
          if M.Document is PUMLProjectDocument then S := TXT_DOC_TYPE_PROJECT
          else if M.Document is PUMLUnitDocument then S := TXT_DOC_TYPE_UNIT;
          S := S + ' ' + M.Document.FileName;
          if M.Document.Modified then S := S + ' (' + MSG_DOCUMENT_MODIFIED + ')'
          else if M.Document.ReadOnly then S := S + ' ' + TXT_DOC_STATUS_READONLY;
        end
        else begin
          S := '(' + M.MetaClass.Name + ') ' + M.Pathname;
        end;
        StatusBarInfo.Caption := S;
      except
        StatusBarInfo.Caption := '';
      end;
    end
    else begin
      StatusBarInfo.Caption := TXT_ELEM_SEL_MULTIPLE;
    end;
  end;
end;

// PMainFormMenuStateHandler
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Miscellaneous Functions

procedure UpdateDocumentElements;
var
  I: Integer;
  ASet: PModelOrderedSet;
  Doc: PDocument;
begin
  try
    StarUMLApplication.UpdateDocuments;
    if StarUMLApplication.DocumentElementCount <> 0 then begin
      Doc := (StarUMLApplication.DocumentElements[0]).Document;
      if Doc <> nil then begin
        if Doc.ReadOnly then MainForm.FileName := ExtractFileName(Doc.FileName) + ' ' + TXT_DOC_STATUS_READONLY
        else begin
          MainForm.FileName := '';
          MainForm.FileName := ExtractFileName(Doc.FileName);
        end;
      end;
    end;
    ASet := PModelOrderedSet.Create;
    try
      for I := 0 to StarUMLApplication.DocumentElementCount - 1 do
        ASet.Add(StarUMLApplication.DocumentElements[I] as PModel);

      Screen.Cursor := crHourGlass;
      MainForm.ModelExplorer.UpdateModels(ASet);
      Screen.Cursor := crDefault;

      MainForm.InspectorFrame.UpdateInspector;
      MainForm.AttachmentEditor.UpdateAttachments;
      MainForm.DocumentationEditor.UpdateDocumentation;
      ConstraintEditorForm.UpdateConstraints;
      CollectionEditorForm.UpdateCollection;
      TaggedValueEditorForm.UpdateTaggedValues;

    finally
      ASet.Free;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure ReloadDocumentElements;
var
  I, C, R: Integer;
  Doc: PDocument;
  Str: string;
  ExtModified: Boolean;
begin
  try
    ExtModified := False;
    StarUMLApplication.UpdateDocuments;
    C := StarUMLApplication.DocumentElementCount;
    for I := 0 to C - 1 do begin
      Doc := (StarUMLApplication.DocumentElements[I]).Document;
      if Doc.ExternallyModified then begin
        ExtModified := True;
        if Str <> '' then Str := Str + #13#10;
        Str := Str + Doc.FileName;
        Doc.ExternallyModified := False;
      end;
    end;
    if ExtModified then begin
      Str := Str + #13#10 + QUERY_RELOAD_PROJECT;
      R :=Application.MessageBox(PChar(Str), PChar(Application.Title), MB_ICONQUESTION or MB_YESNO);
      if R = IDYES then begin
        StarUMLApplication.OpenProject(StarUMLApplication.ProjectDocument.FileName);
        MainForm.WorkingAreaFrame.OpenAllDefaultDiagrams;
      end;
    end;
  except on
    E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

// Miscellaneous Functions
////////////////////////////////////////////////////////////////////////////////

end.
