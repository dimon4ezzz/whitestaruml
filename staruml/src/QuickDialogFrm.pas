unit QuickDialogFrm;

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
  Dialogs, ImgList, StdCtrls, ExtCtrls, Buttons,
  Core, ViewCore, UMLModels, UMLViews, QuickDialogFrmTdxBase, JvComponentBase,
  JvBalloonHint;

const
  CLASSIFIER_HINT =
    '<<stereotype>> name' +#13#10+
    'or'+#13#10+
    'notation target'+#13#10#13#10+
    '[notations]'+#13#10+
    '<=,=>,--,<-,->,<>-,-<>,<*>-,-<*>'+#13#10+
    '<--,-->,)-,-(,@-,-@'+#13#10+
    '()-,-(),<i-,-i>,<e-,-e> (Usecase diagram only)';

  STATE_HINT =
  '<<stereotype>> name' +#13#10+
  'or'+#13#10+
  'notation target'+#13#10#13#10+
  '[notations]'+#13#10+
  '<-<>,-><>,<-,->,-*,-(H),-(h),-(H*),-(h*),-@';

  OBJECT_HINT =
  '<<stereotype>> name : type' +#13#10+
  'or'+#13#10+
  'notation target.stimulus'+#13#10#13#10+
  '[notations]'+#13#10+
  '<-,->,<->';

  CLASSIFIER_ROLE_HINT =
  '<<stereotype>> name OR shorten creation' +#13#10+
  'or'+#13#10+
  'notation target.message'+#13#10#13#10+
  '[notations]'+#13#10+
  '<-,->,<->';

  MESSAGE_HINT =
  '<<stereotype>> *[iteration][condition] return := messageName(arguments)' +#13#10+
  'or'+#13#10+
  'notation target.stimulus'+#13#10#13#10+
  '[notations]'+#13#10+
  '<-,->,<~,~>,<_,_>,<-> (Sequence diagram only)';

type
  // Event Types
  PQuickDlgExpressionApplyingEvent = procedure(AModel: PModel; Value: string) of object;
  PQuickDlgModelCreatingEvent = procedure(Owner: PModel; ModelKind: string; Argument: Integer = 0; InsertIndex: Integer = -1) of object;
  PQuickDlgModelCreatingWithNameEvent = procedure (Owner: PModel; ModelKind: string; Name: string = '') of object;
  PQuickDlgElementDeletingEvent = procedure(AModel: PModel) of object;
  PQuickDlgOrderChangingEvent = procedure(AModel: PModel; AnItem: PModel; Key: string; NewOrder: Integer) of object;
  PQuickDlgVisibilityChangingEvent = procedure(AModel: PModel; Kind: PUMLVisibilityKind) of object;
  PQuickDlgMultiplicityChangingEvent = procedure(AModel: PModel; Value: string) of object;
  PQuickDlgAggregationKindChangingEvent = procedure(AModel: PModel; Kind: PUMLAggregationKind) of object;
  PQuickDlgNavigableChangingEvent = procedure(AModel: PModel; IsNavigable: Boolean) of object;
  PQuickDlgActionKindChangingEvent = procedure(AModel: PModel; Kind: string) of object;
  PQuickDlgOperationChangingEvent = procedure(AModel: PModel; AnOp: PUMLOperation) of object;
  PQuickDlgSignalChangingEvent = procedure(AModel: PModel; ASignal: PUMLSignal) of object;
  PQuickDlgInstantiationChangingEvent = procedure(AModel: PModel; AInstantiation: PUMLClassifier) of object;
  PQuickDlgNoteTextChangingEvent = procedure(AView: PUMLCustomTextView; Text: string) of object;
  PQuickDlgSeqNumberChangingEvent = procedure(AElement: PElement; ACollectionItem: PElement; Key: string; NewIndex: Integer) of object;
  PQuickDlgObjectClassCreatingEvent = procedure(Owner: PUMLNamespace; AModel: PUMLModelElement; Name: string = '') of object;
  PQuickDlgCallActionOperationCreatingEvent = procedure(AClassifier: PUMLClassifier; ACallAction: PUMLCallAction; Name: string = '') of object;
  (*
  PQuickDlgObjectExpApplyingWithNewEvent = procedure(Sender: TObject; Owner: PUMLNamespace; AModel: PUMLModelElement; Value: string) of object;
  *)
  
  // TQuickDialogForm { Visual Components Pool }
  TQuickDialogForm = class(TQuickDialogFormTdxBase)
    LeftPanel: TPanel;
    MiddlePanel: TPanel;
    RightPanel: TPanel;
    LeftButton1: TSpeedButton;
    LeftButton2: TSpeedButton;
    RightButton1: TSpeedButton;
    RightButton2: TSpeedButton;
    RightButton3: TSpeedButton;
    RightButton4: TSpeedButton;
    NameEdit: TMemo;
    ComboBox: TComboBox;
    QuickDialogImages: TImageList;
    BasePanel: TPanel;
    HintImageList: TImageList;
    BalloonHint2: TBalloonHint;
    BalloonHint: TJvBalloonHint;
    procedure FormCreate(Sender: TObject);
  end;

  // Forward declarations
  PAbstractQuickDialog = class;
  PGeneralQuickDialog = class;
  PSubsystemQuickDialog = class;
  PClassifierQuickDialog = class;
  PAssociationEndQuickDialog = class;
  PStateQuickDialog = class;
  PFeatureQuickDialog = class;
  PMessageQuickDialog = class;
  PNoteQuickDialog = class;

  // PQuickDialogClass
  PQuickDialogClass = class of PAbstractQuickDialog;

  // PQuickDialogManager
  PQuickDialogManager = class
  private
    FClientOrigin: TPoint;
    FMousePos: TPoint;
    FZoomRatedMousePos: TPoint;
    FNextQuickDialogClass: PQuickDialogClass;
    FNextView: PView;
    FNextModel: PModel;
    FNextIndex: Integer;
    // outgoing event fields
    FOnGeneralNameExpApplying: PQuickDlgExpressionApplyingEvent;
    FOnClassifierRoleExpApplying: PQuickDlgExpressionApplyingEvent;
    FOnInstanceExpApplying: PQuickDlgExpressionApplyingEvent;
    FOnAttributeExpApplying: PQuickDlgExpressionApplyingEvent;
    FOnOperationExpApplying: PQuickDlgExpressionApplyingEvent;
    FOnMessageExpApplying: PQuickDlgExpressionApplyingEvent;
    FOnModelCreating: PQuickDlgModelCreatingEvent;
    FOnModelCreatingWithName: PQuickDlgModelCreatingWithNameEvent;
    FOnElementDeleting: PQuickDlgElementDeletingEvent;
    FOnOrderChanging: PQuickDlgOrderChangingEvent;
    FOnVisibilityChanging: PQuickDlgVisibilityChangingEvent;
    FOnMultiplicityChanging: PQuickDlgMultiplicityChangingEvent;
    FOnAggregationKindChanging: PQuickDlgAggregationKindChangingEvent;
    FOnNavigableChanging: PQuickDlgNavigableChangingEvent;
    FOnActionKindChanging: PQuickDlgActionKindChangingEvent;
    FOnOperationChanging: PQuickDlgOperationChangingEvent;
    FOnSignalChanging: PQuickDlgSignalChangingEvent;
    FOnInstantiationChanging: PQuickDlgInstantiationChangingEvent;
    FOnNoteTextChanging: PQuickDlgNoteTextChangingEvent;
    FOnSeqNumberChanging: PQuickDlgSeqNumberChangingEvent;
    FOnObjectClassCreating: PQuickDlgObjectClassCreatingEvent;
    FOnCallActionOperationCreating: PQuickDlgCallActionOperationCreatingEvent;
    FOnQuickDialogHide: TNotifyEvent;
    (*
    FOnObjectExpApplyingWithNew: PQuickDlgObjectExpApplyingWithNewEvent;
    *)
    function GetFitQuickDialog(var AView: PView; var AModel: PModel; var Idx: Integer;
        Force: Boolean = False): PQuickDialogClass;
    function GetFitQuickDialogByModel(var OwnerView: PView; ArgModel: PModel; var Idx: Integer): PQuickDialogClass;
    function GetFromSubsystemView(AView: PUMLSubsystemView; var AModel: PModel; var Idx: Integer): PQuickDialogClass;
    function GetFromClassifierView(AView: PUMLClassifierView; var AModel: PModel; var Idx: Integer): PQuickDialogClass;
    function GetFromEnumerationView(AView: PUMLEnumerationView; var AModel: PModel; var Idx: Integer): PQuickDialogClass;
    function GetFromStateView(AView: PUMLCustomStateView; var AModel: PModel; var Idx: Integer;
        Force: Boolean = False): PQuickDialogClass;
    function GetFromAssociationView(AView: PUMLAssociationView; var AModel: PModel;
        Force: Boolean = False): PQuickDialogClass;
    function GetFromLinkView(AView: PUMLLinkView; var AModel: PModel; Force: Boolean = False): PQuickDialogClass;
    function GetFromAssociationLabelView(var AView: PView; var AModel: PModel): PQuickDialogClass;
    function GetFromLinkLabelView(var AView: PView; var AModel: PModel): PQuickDialogClass;
    procedure SetMousePos(AView: PView; MousePos: TPoint);
  protected
    // quick dialog event handling procedures { unit-scope }
    procedure GeneralNameExpApplying(AModel: PModel; Value: string);
    procedure ClassifierRoleExpApplying(AModel: PModel; Value: string);
    procedure InstanceExpApplying(AModel: PModel; Value: string);
    procedure AttributeExpApplying(AModel: PModel; Value: string);
    procedure OperationExpApplying(AModel: PModel; Value: string);
    procedure MessageExpApplying(AModel: PModel; Value: string);
    procedure ModelCreatingHandler(Owner: PModel; ModelKind: string; Argument: Integer = 0; InsertIndex: Integer = -1);
    procedure ModelCreatingWithNameHandler(Owner: PModel; ModelKind: string; Name: string = '');
    procedure ElementDeletingHandler(AModel: PModel);
    procedure OrderChangingHandler(AModel: PModel; AnItem: PModel; Key: string; NewOrder: Integer);
    procedure VisibilityChangingHandler(AModel: PModel; Kind: PUMLVisibilityKind);
    procedure MultiplicityChangingHandler(AModel: PModel; Value: string);
    procedure AggregationKindChangingHandler(AModel: PModel; Kind: PUMLAggregationKind);
    procedure NavigableChanging(AModel: PModel; IsNavigable: Boolean);
    procedure OperationChangingHandler(AModel: PModel; AnOp: PUMLOperation);
    procedure SignalChangingHandler(AModel: PModel; ASignal: PUMLSignal);
    procedure InstantiationChangingHandler(AModel: PModel; AInstantiation: PUMLClassifier);
    procedure NoteTextChanging(AView: PUMLCustomTextView; Value: string);
    procedure SeqNumberChanging(AElement: PElement; ACollectionItem: PElement; Key: string; NewIndex: Integer);
    procedure ObjectClassCreatingHandler(Owner: PUMLNamespace; AModel: PUMLModelElement; Name: string = '');
    procedure CallActionOperationCreatingHandler(AClassifier: PUMLClassifier; ACallAction: PUMLCallAction; Name: string = '');
    procedure QuickDialogHideHandler(Sender: TObject);
    (*
    procedure ObjectExpApplyingWithNew(Sender: TObject; Owner: PUMLNamespace; AModel: PUMLModelElement; Value: string);
    *)
    procedure QuickDialogDestoryHandler(Sender: TObject);
    procedure ShowAnotherQuickDialog(Sender: PAbstractQuickDialog; QuickDialogClass: PQuickDialogClass;
        AView: PView; AModel: PModel = nil; Idx: Integer = -1);
  public
    procedure ShowQuickDialog(AView: PView; OriginVal, MouseVal: TPoint; Force: Boolean = False);
    procedure ShowQuickDialogByModelCreation(OwnerView: PView; ArgModel: PModel; OriginVal: TPoint);
    // outgoing event properties
    property OnGeneralNameExpApplying: PQuickDlgExpressionApplyingEvent write FOnGeneralNameExpApplying;
    property OnClassifierRoleExpApplying: PQuickDlgExpressionApplyingEvent write FOnClassifierRoleExpApplying;
    property OnObjectExpApplying: PQuickDlgExpressionApplyingEvent write FOnInstanceExpApplying;
    property OnAttributeExpApplying: PQuickDlgExpressionApplyingEvent write FOnAttributeExpApplying;
    property OnOperationExpApplying: PQuickDlgExpressionApplyingEvent write FOnOperationExpApplying;
    property OnMessageExpApplying: PQuickDlgExpressionApplyingEvent write FOnMessageExpApplying;
    property OnModelCreating: PQuickDlgModelCreatingEvent write FOnModelCreating;
    property OnModelCreatingWithName: PQuickDlgModelCreatingWithNameEvent write FOnModelCreatingWithName;
    property OnElementDeleting: PQuickDlgElementDeletingEvent write FOnElementDeleting;
    property OnOrderChanging: PQuickDlgOrderChangingEvent write FOnOrderChanging;
    property OnVisibilityChanging: PQuickDlgVisibilityChangingEvent write FOnVisibilityChanging;
    property OnMultiplicityChanging: PQuickDlgMultiplicityChangingEvent write FOnMultiplicityChanging;
    property OnAggregationKindChanging: PQuickDlgAggregationKindChangingEvent write FOnAggregationKindChanging;
    property OnNavigableChanging: PQuickDlgNavigableChangingEvent write FOnNavigableChanging;
    property OnActionKindChanging: PQuickDlgActionKindChangingEvent write FOnActionKindChanging;
    property OnOperationChanging: PQuickDlgOperationChangingEvent write FOnOperationChanging;
    property OnSignalChanging: PQuickDlgSignalChangingEvent write FOnSignalChanging;
    property OnInstantiationChanging: PQuickDlgInstantiationChangingEvent write FOnInstantiationChanging;
    property OnNoteTextChanging: PQuickDlgNoteTextChangingEvent write FOnNoteTextChanging;
    property OnSeqNumberChanging: PQuickDlgSeqNumberChangingEvent write FOnSeqNumberChanging;
    property OnObjectClassCreating: PQuickDlgObjectClassCreatingEvent write FOnObjectClassCreating;
    property OnCallActionOperationCreating: PQuickDlgCallActionOperationCreatingEvent write FOnCallActionOperationCreating;
    property OnQuickDialogHide: TNotifyEvent read FOnQuickDialogHide write FOnQuickDialogHide;
    (*
    property OnObjectExpApplyingWithNew: PQuickDlgObjectExpApplyingWithNewEvent write FOnObjectExpApplyingWithNew;
    *)
  end;

  // PAbstractQuickDialog { Logical abstract class }
  PAbstractQuickDialog = class(TQuickDialogForm)
  private
    procedure SetFormRegion;
  protected
    FManager: PQuickDialogManager;
    FView: PView;
    FClientOrigin: TPoint;
    FMousePos: TPoint;
    FOriginalString: string;
    FShowedError: Boolean;
    FKeyUpOnly: Boolean;
    procedure AfterConstructionProc; virtual; {abstract} { visual components visibility }
    procedure SetComponentsSizeAndPosition; virtual; {abstract} { visual components size/position }
    procedure SetQuickDialogData; virtual; {abstract} { display current element's values to quick dialog form }
    procedure SetNameEditData; virtual; {abstract}
    procedure Initialize; virtual; {abstract}
    procedure AssignNameEditValue; virtual; {abstract}
    function GetEditTextWidth: Integer; virtual;
    // event handlers
    procedure FormShowHandler(Sender: TObject); virtual;
    procedure FormCloseHandler(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivateHandler(Sender: TObject); virtual;
    procedure LeftButton1ClickHandler(Sender: TObject); virtual; {abstract}
    procedure LeftButton2ClickHandler(Sender: TObject); virtual; {abstract}
    procedure RightButton1ClickHandler(Sender: TObject); virtual; {abstract}
    procedure RightButton2ClickHandler(Sender: TObject); virtual; {abstract}
    procedure RightButton3ClickHandler(Sender: TObject); virtual; {abstract}
    procedure RightButton4ClickHandler(Sender: TObject); virtual; {abstract}
    procedure NameEditKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState); virtual; {abstract}
    procedure NameEditKeyUpHandler(Sender: TObject; var Key: Word; Shift: TShiftState); virtual; {abstract}
    procedure NameEditEnterHandler(Sender: TObject); virtual; {abstract}
    procedure NameEditChangeHandler(Sender: TObject);
    procedure ComboBoxEnterHandler(Sender: TObject); virtual; {abstract}
    procedure ComboBoxClickHandler(Sender: TObject); virtual; {abstract}
    procedure ComboBoxKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState); virtual; {abstract}
    procedure ComboBox2EnterHandler(Sender: TObject); virtual; {abstract}
    procedure ComboBox2ClickHandler(Sender: TObject); virtual; {abstract}
    procedure ComboBox2KeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState); virtual; {abstract}
    procedure VisibilityMenuItemClicked(Sender: TObject); virtual; {abstract}
    procedure AssociationKindMenuItemClicked(Sender: TObject); virtual; {abstract}
    procedure AssociationNavigableMenuItemClicked(Sender: TObject); virtual; {abstract}
    // event handling procedures
    function CheckAndApplyNameEditStrChanging: Boolean; virtual; {abstract}
    procedure FormHidingProc(Key: Word; Shift: TShiftState);
    procedure HidingWithEscapeKey; virtual;
    procedure HidingWithReturnKey; virtual; {abstract}
    procedure HidingWithCtrlReturnKey; virtual; {abstract}
    procedure HidingWithUpArrowKey; virtual; {abstract}
    procedure HidingWithCtrlUpArrowKey; virtual; {abstract}
    procedure HidingWithDownArrowKey; virtual; {abstract}
    procedure HidingWithCtrlDownArrowKey; virtual; {abstract}
    procedure HidingWithInsertKey; virtual; {abstract}
    procedure HidingWithCtrlDeleteKey; virtual; {abstract}
  public
    constructor Create(Manager: PQuickDialogManager); reintroduce; overload;
    procedure SetQuickDialog(AManager: PQuickDialogManager; AView: PView; AModel: PModel = nil; Idx: Integer = -1); virtual;
    property ClientOrigin: TPoint read FClientOrigin write FClientOrigin;
    property MousePos: TPoint read FMousePos write FMousePos;
  end;

  // PGeneralQuickDialog
  PGeneralQuickDialog = class(PAbstractQuickDialog)
  private
    FModel: PModel;
    FCompartmentItemIndex: Integer;
    FVisibilityKind: PUMLVisibilityKind;
    procedure SetVisibilityData;
  protected
    procedure AfterConstructionProc; override;
    procedure SetComponentsSizeAndPosition; override;
    procedure SetQuickDialogData; override;
    procedure Initialize; override;
    procedure SetNameEditData; override;
    procedure AssignNameEditValue; override;
    // event handlers
    procedure LeftButton2ClickHandler(Sender: TObject); override;
    procedure NameEditKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState); override;
    procedure NameEditKeyUpHandler(Sender: TObject; var Key: Word; Shift: TShiftState); override;
    procedure VisibilityMenuItemClicked(Sender: TObject); override;
    // event handling procedures
    function CheckAndApplyNameEditStrChanging: Boolean; override;
    procedure HidingWithReturnKey; override;
    procedure HidingWithCtrlReturnKey; override;

    procedure ShowInformationHint;
  public
    procedure SetQuickDialog(AManager: PQuickDialogManager; AView: PView; AModel: PModel = nil; Idx: Integer = -1); override;
  end;

  // PSubsystemQuickDialog
  PSubsystemQuickDialog = class(PGeneralQuickDialog)
  protected
    procedure AfterConstructionProc; override;
    procedure SetComponentsSizeAndPosition; override;
    procedure Initialize; override;
    // event handlers
    procedure RightButton2ClickHandler(Sender: TObject); override;
    // event handling procedures
    procedure HidingWithDownArrowKey; override;
  end;

  // PCustomObjectQuickDialog
  PCustomObjectQuickDialog = class(PSubsystemQuickDialog)
  private
    function GetParentNamespace(AModel: PModel): PUMLNamespace;
    procedure ApplyStrChanging;
  protected
    procedure Initialize; override;
    // event handlers
    procedure RightButton2ClickHandler(Sender: TObject); override;
    // event handling procedures
    procedure HidingWithDownArrowKey; override;
  end;
  (*
  PCustomObjectQuickDialog2 = class(PGeneralQuickDialog)
  private
    FOriginalClassifier: PUMLClassifier;
    function GetNameEditClassifierStr(NameEditStr: string): string;
    function ExecuteNamespaceSelector(Title: string = ''): PUMLNamespace;
  protected
    procedure Initialize; override;
    function CheckAndApplyNameEditStrChanging: Boolean; override;
  end;
  *)
  // PClassifierQuickDialog
  PClassifierQuickDialog = class(PSubsystemQuickDialog)
  protected
    procedure AfterConstructionProc; override;
    procedure SetComponentsSizeAndPosition; override;
    procedure Initialize; override;
    // event handlers
    procedure RightButton1ClickHandler(Sender: TObject); override;
    procedure RightButton2ClickHandler(Sender: TObject); override;
    // event handling procedures
    procedure HidingWithDownArrowKey; override;
  end;

  // PAssociationEndQuickDialog
  PAssociationEndQuickDialog = class(PGeneralQuickDialog)
  private
    FAggregationKind: PUMLAggregationKind;
    FIsNavigable: Boolean;
    FMultiplicity: string;
    procedure SetAggregationData;
    procedure SetNavigableData;
    procedure SetMultiplicityData;
  protected
    procedure AfterConstructionProc; override;
    procedure SetComponentsSizeAndPosition; override;
    procedure SetQuickDialogData; override;
    procedure Initialize; override;
    // event handlers
    procedure LeftButton1ClickHandler(Sender: TObject); override;
    procedure LeftButton2ClickHandler(Sender: TObject); override;
    procedure NameEditKeyUpHandler(Sender: TObject; var Key: Word; Shift: TShiftState); override;
    procedure NameEditEnterHandler(Sender: TObject); override;
    procedure ComboBoxEnterHandler(Sender: TObject); override;
    procedure ComboBoxClickHandler(Sender: TObject); override;
    procedure ComboBoxKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState); override;
    procedure AssociationKindMenuItemClicked(Sender: TObject); override;
    procedure AssociationNavigableMenuItemClicked(Sender: TObject); override;
    // event handling procedures
    procedure CheckAndApplyMultiplicityStrChanging;
    procedure HidingWithReturnKey; override;
  end;

  // PStateQuickDialog
  PStateQuickDialog = class(PClassifierQuickDialog)
  protected
    procedure AfterConstructionProc; override;
    procedure SetComponentsSizeAndPosition; override;
    procedure Initialize; override;
    // event handlers
    procedure RightButton1ClickHandler(Sender: TObject); override;
    procedure RightButton2ClickHandler(Sender: TObject); override;
    procedure RightButton3ClickHandler(Sender: TObject); override;
    // event handling procedures
    procedure HidingWithDownArrowKey; override;
  end;

  // Enumeration type
  QuickDlgActionKind = (qdlgNone, qdlgEntry, qdlgDo, qdlgExit);

  // PFeatureQuickDialog
  PFeatureQuickDialog = class(PStateQuickDialog)
  private
    procedure SetAttributeNameEditData;
    procedure SetOperationNameEditData;
    procedure AddAttribute;
    procedure AddOperation;
    procedure AddLiteral;
    procedure AddAction;
    procedure InsertAttribute;
    procedure InsertOperation;
    procedure InsertLiteral;
    procedure InsertAction;
    procedure RemoveAttribute;
    procedure RemoveOperation;
    procedure RemoveLiteral;
    procedure RemoveAction;
    procedure ShiftUpAttribute;
    procedure ShiftUpOperation;
    procedure ShiftUpLiteral;
    procedure ShiftUpAction;
    procedure ShiftDownAttribute;
    procedure ShiftDownOperation;
    procedure ShiftDownLiteral;
    procedure ShiftDownAction;
    procedure ShowUpperAttribute;
    procedure ShowUpperOperation;
    procedure ShowUpperLiteral;
    procedure ShowUpperAction;
    procedure ShowLowerAttribute;
    procedure ShowLowerOperation;
    procedure ShowLowerLiteral;
    procedure ShowLowerAction;
    function GetActionKind(OwnerModel: PUMLState; AModel: PUMLAction; var Idx: Integer): QuickDlgActionKind;
  protected
    procedure AfterConstructionProc; override;
    procedure SetComponentsSizeAndPosition; override;
    procedure Initialize; override;
    procedure SetNameEditData; override;
    // event handlers
    procedure RightButton1ClickHandler(Sender: TObject); override;
    procedure RightButton2ClickHandler(Sender: TObject); override;
    procedure RightButton3ClickHandler(Sender: TObject); override;
    procedure RightButton4ClickHandler(Sender: TObject); override;
    // event handling procedures
    function CheckAndApplyNameEditStrChanging: Boolean; override;
    procedure HidingWithCtrlReturnKey; override;
    procedure HidingWithUpArrowKey; override;
    procedure HidingWithCtrlUpArrowKey; override;
    procedure HidingWithDownArrowKey; override;
    procedure HidingWithCtrlDownArrowKey; override;
    procedure HidingWithInsertKey; override;
    procedure HidingWithCtrlDeleteKey; override;
  end;

  // PMessageQuickDialog
  PMessageQuickDialog = class(PGeneralQuickDialog)
  private
    FOperation: PUMLOperation;
    FSignal: PUMLSignal;
    FInstantiation: PUMLClassifier;
    function GetActionModel(AModel: PModel): PUMLAction;
    function GetClassifierModel(AModel: PModel): PUMLClassifier;
  protected
    procedure AfterConstructionProc; override;
    procedure SetComponentsSizeAndPosition; override;
    procedure Initialize; override;
    procedure SetNameEditData; override;
    procedure AssignNameEditValue; override;
    // event handlers
    procedure LeftButton1ClickHandler(Sender: TObject); override;
    procedure RightButton1ClickHandler(Sender: TObject); override;
    // event handling procedures
    function CheckAndApplyNameEditStrChanging: Boolean; override;
  end;

  // PColMessageQuickDialog
  PColMessageQuickDialog = class(PMessageQuickDialog)
  private
    FSequenceNumber: Integer;
    procedure SetSequenceNumber;
  protected
    procedure AfterConstructionProc; override;
    procedure SetComponentsSizeAndPosition; override;
    procedure SetQuickDialogData; override;
    procedure Initialize; override;
    // event handlers
    procedure ComboBoxEnterHandler(Sender: TObject); override;
    procedure ComboBoxClickHandler(Sender: TObject); override;
    procedure ComboBoxKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState); override;
  end;

  // PNoteQuickDialog
  PNoteQuickDialog = class(PAbstractQuickDialog)
  protected
    function GetEditTextWidth: Integer; override;
    procedure AfterConstructionProc; override;
    procedure SetComponentsSizeAndPosition; override;
    procedure SetQuickDialogData; override;
    procedure Initialize; override;
    procedure SetNameEditData; override;
    procedure AssignNameEditValue; override;
    // event handlers
    procedure FormShowHandler(Sender: TObject); override;
    procedure FormDeactivateHandler(Sender: TObject); override;
    procedure NameEditKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState); override;
    procedure NameEditKeyUpHandler(Sender: TObject; var Key: Word; Shift: TShiftState); override;
    // event handling procedures
    function CheckAndApplyNameEditStrChanging: Boolean; override;
    procedure HidingWithCtrlReturnKey; override;
  end;

var
  QuickDialogManager: PQuickDialogManager;

implementation

uses
  System.Types, System.UITypes, Math,
  GraphicClasses, BasicClasses, UMLAux, ElemLstFrm, ElemSelFrm, ModelExplorerFrame,
  NLS_StarUML, ShortenSyntaxMgr, InputBox, StarUMLApp;

const
  NAME_EDIT_DEFAULT_WIDTH: Integer = 130;
  NAME_EDIT_DEFAULT_HEIGHT: Integer = 21;
  COMBO_BOX_DEFAULT_WIDTH: Integer = 45;
  BUTTON_WIDTH: Integer = 21;
  BUTTON_HEIGHT: Integer = 21;
  BUTTON_MARGIN: Integer = 1;

var
  ShortenSyntaxManager: PShortenSyntaxManager;
  // Classifer
  ClassifierHintKey: TStringList;
  ClassifierHintValue: TStringList;

  // State
  StateHintKey: TStringList;
  StateHintValue: TStringList;

  // Object
  ObjectHintKey: TStringList;
  ObjectHintValue: TStringList;

  // Message
  MessageHintKey: TStringList;
  MessageHintValue: TStringList;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// Utility function

function GetZoomRate(AZoomFactor: PZoomFactor): Real;
begin
  Result := AZoomFactor.Numer / AZoomFactor.Denom;
end;

function QueryInput(ATitle: string; ACaption: string; var Str: string): Boolean;
var
  Input: TInputBox;
  B: Boolean;
begin
  Input := TInputBox.Create(nil);
  try
    Input.Title := ATitle;
    Input.Caption := ACaption;
    Input.OKButtonCaption := TXT_OK;
    Input.CancelButtonCaption := TXT_CANCEL; 
    Input.Value := Str;
    B := Input.Execute;
    if B then
      Str := Input.Value;
    Result := B;
  finally
    Input.Free;
  end;
end;

// Utility function
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PQuickDialogManager

procedure PQuickDialogManager.ShowQuickDialog(AView: PView; OriginVal, MouseVal: TPoint; Force: Boolean = False);
var
  QuickDialog: PAbstractQuickDialog;
  QuickDialogClass: PQuickDialogClass;
  AModel: PModel;
  Idx: Integer;
begin
  if not Assigned(AView) then Exit;
  FClientOrigin := OriginVal;
  SetMousePos(AView, MouseVal);
  FNextQuickDialogClass := nil;

  Idx := -1;
  AModel := nil;
  QuickDialogClass := GetFitQuickDialog(AView, AModel, Idx, Force);
  if Assigned(QuickDialogClass) then begin
    try
      QuickDialog := QuickDialogClass.Create(Self);
      QuickDialog.OnDestroy := QuickDialogDestoryHandler;
      QuickDialog.OnHide := QuickDialogHideHandler;
      QuickDialog.ClientOrigin := FClientOrigin;
      QuickDialog.MousePos := FMousePos;
      QuickDialog.SetQuickDialog(Self, AView, AModel, Idx);
      QuickDialog.Show;
    except on Exception do
    end;
  end;
end;

procedure PQuickDialogManager.ShowQuickDialogByModelCreation(OwnerView: PView;
  ArgModel: PModel; OriginVal: TPoint);
var
  QuickDialog: PAbstractQuickDialog;
  QuickDialogClass: PQuickDialogClass;
  Idx: Integer;
begin
  if (OwnerView = nil) or (ArgModel = nil)  then Exit;

  Idx := -1;
  FClientOrigin := OriginVal;
  FNextQuickDialogClass := nil;

  QuickDialogClass := GetFitQuickDialogByModel(OwnerView, ArgModel, Idx);
  if Assigned(QuickDialogClass) then begin
    try
      QuickDialog := QuickDialogClass.Create(Self);
      QuickDialog.OnDestroy := QuickDialogDestoryHandler;
      QuickDialog.OnHide := QuickDialogHideHandler;
      QuickDialog.ClientOrigin := FClientOrigin;
      QuickDialog.MousePos := Point(0, 0);
      QuickDialog.SetQuickDialog(Self, OwnerView, ArgModel, Idx);
      QuickDialog.Show;
    except on Exception do
    end;
  end;
end;

function PQuickDialogManager.GetFitQuickDialog(var AView: PView; var AModel: PModel;
    var Idx: Integer; Force: Boolean = False): PQuickDialogClass;
var
  QDlg: PQuickDialogClass;
begin
  QDlg := nil;
  Result := nil;

  if (AView is PUMLNoteView) or (AView is PUMLTextView) then QDlg := PNoteQuickDialog
  else begin
    if not Assigned(AView.Model) then Exit;
    try
      // Subsystem view: Subsytem, Operation?
      if (AView is PUMLSubsystemView)
      then QDlg := GetFromSubsystemView(AView as PUMLSubsystemView, AModel, Idx)
      // General type views
      else if (AView is PUMLPackageView) or
              (AView is PUMLCustomComponentView) or
              (AView is PUMLCustomNodeView) or
              (AView is PUMLCollaborationView) or
              (AView is PUMLCollaborationInstanceSetView) or
              //(AView is PUMLPseudoStateView) or
              (AView is PUMLActionStateView) or
              (AView is PUMLSubactivityStateView) or
              (AView is PUMLSwimlaneView) or
              (AView is PUMLGeneralizationView) or
              (AView is PUMLDependencyView) or
              (AView is PUMLRealizationView) or
              (AView is PUMLIncludeView) or
              (AView is PUMLExtendView) or
              (AView is PUMLTransitionView) or
              (AView is PUMLObjectFlowStateView) or
              (AView is PUMLSignalAcceptStateView) or
              (AView is PUMLSignalSendStateView) or
              (AView is PUMLPortView) or
              (AView is PUMLConnectorView)
      then QDlg := PGeneralQuickDialog
      // ClassifierRole, Object type view
      else if (AView is PUMLCustomColObjectView) or
              (AView is PUMLCustomSeqObjectView)
      then QDlg := PCustomObjectQuickDialog
      // Classifier type view: Classifier, Attribute, Operation?
      else if (AView is PUMLClassifierView)
      then QDlg := GetFromClassifierView(AView as PUMLClassifierView, AModel, Idx)
      // Enumeration view: Enumeration, Literal, Operation?
      else if (AView is PUMLEnumerationView)
      then QDlg := GetFromEnumerationView(AView as PUMLEnumerationView, AModel, Idx)
      // Association view : Association, AssociationEnd?
      else if (AView is PUMLAssociationView)
      then QDlg := GetFromAssociationView(AView as PUMLAssociationView, AModel, Force)
      // Link view: Link, LinkEnd?
      else if (AView is PUMLLinkView)
      then QDlg := GetFromLinkView(AView as PUMLLinkView, AModel, Force)
      // State, Submachine view: State, Action?
      else if (AView is PUMLCustomStateView)
      then QDlg := GetFromStateView(AView as PUMLCustomStateView, AModel, Idx, Force)
      // Stimulus, Message view
      else if (AView is PUMLCustomColMessageView)
      then QDlg := PColMessageQuickDialog
      else if (AView is PUMLCustomSeqMessageView)
      then QDlg := PMessageQuickDialog
      // EdgeLabel view: show parent Edge view element's Quick dialog
      else if (AView is PEdgeLabelView) then begin
        if AView.Parent is PUMLAssociationView
        then QDlg := GetFromAssociationLabelView(AView, AModel)
        else if AView.Parent is PUMLLinkView
        then QDlg := GetFromLinkLabelView(AView, AModel)
        else begin
          AView := AView.Parent;
          QDlg := GetFitQuickDialog(AView, AModel, Idx);
        end;
      end else if (AView is PNodeLabelView) then begin
        AView := AView.Parent;
        QDlg := GetFitQuickDialog(AView, AModel, Idx);
      end;
    except on Exception do QDlg := nil; 
    end;
  end;

  Result := QDlg;
end;

function PQuickDialogManager.GetFitQuickDialogByModel(var OwnerView: PView; ArgModel: PModel;
  var Idx: Integer): PQuickDialogClass;
var
  AttrCompart: PUMLAttributeCompartmentView;
  OpCompart: PUMLOperationCompartmentView;
  LiteralCompart: PUMLEnumerationLiteralCompartmentView;
  InternalCompart: PUMLInternalTransitionCompartmentView;
  OwnerModel: PModel;
  I: Integer;
begin
  Result := nil;
  // Attribute
  if ArgModel is PUMLAttribute then begin
    if not (OwnerView is PUMLClassifierView) then Exit;
    AttrCompart := (OwnerView as PUMLClassifierView).AttributeCompartment;
    if (AttrCompart.Visible) and (AttrCompart.CompartmentItemCount > 0) then begin
      OwnerModel := OwnerView.Model;
      if OwnerModel is PUMLClassifier then begin
        for I := (OwnerModel as PUMLClassifier).AttributeCount - 1 downto 0 do begin
          if (OwnerModel as PUMLClassifier).Attributes[I] = ArgModel then begin
            Idx := I;
            Result := PFeatureQuickDialog;
            Exit;
          end;
        end;
      end;
    end;
  // Operation
  end else if ArgModel is PUMLOperation then begin
    OpCompart := nil;
    if OwnerView is PUMLClassifierView then
      OpCompart := (OwnerView as PUMLClassifierView).OperationCompartment
    else if OwnerView is PUMLSubsystemView then
      OpCompart := (OwnerView as PUMLSubsystemView).OperationCompartment
    else if OwnerView is PUMLEnumerationView then
      OpCompart := (OwnerView as PUMLEnumerationView).OperationCompartment;

    if not Assigned(OpCompart) then Exit;
    if (OpCompart.Visible) and (OpCompart.CompartmentItemCount > 0) then begin
      OwnerModel := OwnerView.Model;
      if OwnerModel is PUMLClassifier then begin
        for I := (OwnerModel as PUMLClassifier).OperationCount - 1 downto 0 do begin
          if (OwnerModel as PUMLClassifier).Operations[I] = ArgModel then begin
            Idx := I;
            Result := PFeatureQuickDialog;
            Exit;
          end;
        end;
      end;
    end;
  // EnumerationLiteral
  end else if ArgModel is PUMLEnumerationLiteral then begin
    if not (OwnerView is PUMLEnumerationView) then Exit;
    LiteralCompart := (OwnerView as PUMLEnumerationView).EnumerationLiteralCompartment;
    if (LiteralCompart.Visible) and (LiteralCompart.CompartmentItemCount > 0) then begin
      OwnerModel := OwnerView.Model;
      if OwnerModel is PUMLEnumeration then begin
        for I := (OwnerModel as PUMLEnumeration).LiteralCount - 1 downto 0 do begin
          if (OwnerModel as PUMLEnumeration).Literals[I] = ArgModel then begin
            Idx := I;
            Result := PFeatureQuickDialog;
            Exit;
          end;
        end;
      end;
    end;
  // UninterpretedAction
  end else if ArgModel is PUMLUninterpretedAction then begin
    if not (OwnerView is PUMLCustomStateView) then Exit;
    InternalCompart := (OwnerView as PUMLCustomStateView).InternalTransitionCompartment;
    if (InternalCompart.Visible) and (InternalCompart.CompartmentItemCount > 0) then begin
      OwnerModel := OwnerView.Model;
      if OwnerModel is PUMLCompositeState then begin
        for I := (OwnerModel as PUMLCompositeState).EntryActionCount - 1 downto 0 do begin
          if (OwnerModel as PUMLCompositeState).EntryActions[I] = ArgModel then begin
            Idx := I;
            Result := PFeatureQuickDialog;
            Exit;
          end;
        end;
        Idx := (OwnerModel as PUMLCompositeState).EntryActionCount;
        for I := (OwnerModel as PUMLCompositeState).DoActivityCount - 1 downto 0 do begin
          if (OwnerModel as PUMLCompositeState).DoActivities[I] = ArgModel then begin
            Idx := Idx + I;
            Result := PFeatureQuickDialog;
            Exit;
          end;
        end;
        Idx := Idx + (OwnerModel as PUMLCompositeState).DoActivityCount;
        for I := (OwnerModel as PUMLCompositeState).ExitActionCount - 1 downto 0 do begin
          if (OwnerModel as PUMLCompositeState).ExitActions[I] = ArgModel then begin
            Idx := Idx + I;
            Result := PFeatureQuickDialog;
            Exit;
          end;
        end;
      end;
    end;
  end;
end;

function PQuickDialogManager.GetFromSubsystemView(AView: PUMLSubsystemView;
    var AModel: PModel; var Idx: Integer): PQuickDialogClass;
var
  OpCompart: PUMLOperationCompartmentView;
  ACanvas: PCanvas;
begin
  Result := nil;
  OpCompart := AView.OperationCompartment;
  ACanvas := GetOwnerDiagramView(AView).Canvas;
  // Operation
  if (OpCompart.Visible) and (OpCompart.CompartmentItemCount > 0) then begin
    Idx := OpCompart.GetCompertmentItemIndexByPoint(ACanvas, FZoomRatedMousePos);
    if Idx >= 0 then begin
      AModel := (AView.Model as PUMLSubsystem).Operations[Idx];
      Result := PFeatureQuickDialog;
      Exit;
    end;
  end;
  // Subsystem
  Result := PSubsystemQuickDialog;
end;

function PQuickDialogManager.GetFromClassifierView(AView: PUMLClassifierView;
    var AModel: PModel; var Idx: Integer): PQuickDialogClass;
var
  AttrCompart: PUMLAttributeCompartmentView;
  OpCompart: PUMLOperationCompartmentView;
  ACanvas: PCanvas;
begin
  Result := nil;
  ACanvas := GetOwnerDiagramView(AView).Canvas;
  // Attribute
  AttrCompart := AView.AttributeCompartment;
  if (AttrCompart.Visible) and (AttrCompart.CompartmentItemCount > 0) then begin
    Idx := AttrCompart.GetCompertmentItemIndexByPoint(ACanvas, FZoomRatedMousePos);
    if Idx >= 0 then begin
      AModel := (AView.Model as PUMLClassifier).Attributes[Idx];
      Result := PFeatureQuickDialog;
      Exit;
    end;
  end;
  // Operation
  OpCompart := AView.OperationCompartment;
  if (OpCompart.Visible) and (OpCompart.CompartmentItemCount > 0) then begin
    Idx := OpCompart.GetCompertmentItemIndexByPoint(ACanvas, FZoomRatedMousePos);
    if Idx >= 0 then begin
      AModel := (AView.Model as PUMLClassifier).Operations[Idx];
      Result := PFeatureQuickDialog;
      Exit;
    end;
  end;
  // Classifier
  Result := PClassifierQuickDialog;
end;

function PQuickDialogManager.GetFromEnumerationView(AView: PUMLEnumerationView;
    var AModel: PModel; var Idx: Integer): PQuickDialogClass;
var
  LiteralCompart: PUMLEnumerationLiteralCompartmentView;
  OpCompart: PUMLOperationCompartmentView;
  ACanvas: PCanvas;
begin
  Result := nil;
  ACanvas := GetOwnerDiagramView(AView).Canvas;
  // Attribute
  LiteralCompart := AView.EnumerationLiteralCompartment;
  if (LiteralCompart.Visible) and (LiteralCompart.CompartmentItemCount > 0) then begin
    Idx := LiteralCompart.GetCompertmentItemIndexByPoint(ACanvas, FZoomRatedMousePos);
    if Idx >= 0 then begin
      AModel := (AView.Model as PUMLEnumeration).Literals[Idx];
      Result := PFeatureQuickDialog;
      Exit;
    end;
  end;
  // Operation
  OpCompart := AView.OperationCompartment;
  if (OpCompart.Visible) and (OpCompart.CompartmentItemCount > 0) then begin
    Idx := OpCompart.GetCompertmentItemIndexByPoint(ACanvas, FZoomRatedMousePos);
    if Idx >= 0 then begin
      AModel := (AView.Model as PUMLEnumeration).Operations[Idx];
      Result := PFeatureQuickDialog;
      Exit;
    end;
  end;
  // Classifier
  Result := PClassifierQuickDialog;
end;

function PQuickDialogManager.GetFromStateView(AView: PUMLCustomStateView;
    var AModel: PModel; var Idx: Integer; Force: Boolean = False): PQuickDialogClass;
var
  ACanvas: PCanvas;
  NameCompart: PUMLNameCompartmentView;
  InternalCompart: PUMLInternalTransitionCompartmentView;
  TempModel: PUMLCompositeState;
  EntryCount, DoCount, ExitCount: Integer;
begin
  if Force then begin
    Result := PStateQuickDialog;
    Exit;
  end;

  Result := nil;
  ACanvas := GetOwnerDiagramView(AView).Canvas;
  NameCompart := AView.NameCompartment;
  // State
  if NameCompart.ContainsPoint(ACanvas, FZoomRatedMousePos.X, FZoomRatedMousePos.Y) then
    Result := PStateQuickDialog
  else begin
    // InternalTransitionCompartment
    InternalCompart := AView.InternalTransitionCompartment;
    if (InternalCompart.Visible) and (InternalCompart.CompartmentItemCount > 0) then begin
      Idx := InternalCompart.GetCompertmentItemIndexByPoint(ACanvas, FZoomRatedMousePos);
      if Idx >= 0 then begin
        TempModel := AView.Model as PUMLCompositeState;
        EntryCount := TempModel.EntryActionCount;
        DoCount := TempModel.DoActivityCount;
        ExitCount := TempModel.ExitActionCount;
        if Idx < EntryCount then AModel := TempModel.EntryActions[Idx]
        else if (Idx - EntryCount < DoCount) then AModel := TempModel.DoActivities[Idx - EntryCount]
        else if (Idx - EntryCount - DoCount < ExitCount) then AModel := TempModel.ExitActions[Idx - EntryCount - DoCount]
        else Exit;
        Result := PFeatureQuickDialog;
      end;
    end;
  end;
end;

function PQuickDialogManager.GetFromAssociationView(AView: PUMLAssociationView;
    var AModel: PModel; Force: Boolean = False): PQuickDialogClass;
var
  Points: PPoints;
  L1, L2, L3: Integer;
  MinValue : Integer;
  MidPointIndex : Integer;
  MidPoint : TPoint;
begin
  if Force then begin
    Result := PGeneralQuickDialog;
    Exit;
  end;

  Result := nil;
  Points := AView.Points;
  if Points.Count > 2 then MidPointIndex := Trunc(Points.Count / 2)
  else MidPointIndex := 0;
  MidPoint.X := Trunc((Points.Points[MidPointIndex].X + Points.Points[MidPointIndex+1].X)/2);
  MidPoint.Y := Trunc((Points.Points[MidPointIndex].Y + Points.Points[MidPointIndex+1].Y)/2);
  with Points do begin
    L1 := Trunc(sqrt(sqr(Points[0].X - FZoomRatedMousePos.X) + sqr(Points[0].Y - FZoomRatedMousePos.Y)));
    L2 := Trunc(sqrt(sqr(Points[Count-1].X - FZoomRatedMousePos.X) + sqr(Points[Count-1].Y - FZoomRatedMousePos.Y)));
    L3 := Trunc(sqrt(sqr(MidPoint.X - FZoomRatedMousePos.X) + sqr(MidPoint.Y - FZoomRatedMousePos.Y)));
  end;
  MinValue := Min(Min(L1, L2), L3);
  // Association
  if MinValue = L3 then Result := PGeneralQuickDialog
  // AssociationEnd
  else begin
    // Tail (Starting Point)
    if MinValue = L1 then begin
      AModel := (AView.Model as PUMLAssociation).Connections[0];
      Result := PAssociationEndQuickDialog;
    // Head (Ending Point)
    end else if MinValue = L2 then begin
      AModel := (AView.Model as PUMLAssociation).Connections[1];
      Result := PAssociationEndQuickDialog;
    end;
  end;
end;

function PQuickDialogManager.GetFromLinkView(AView: PUMLLinkView; var AModel: PModel;
    Force: Boolean = False): PQuickDialogClass;
var
  Points: PPoints;
  L1, L2, L3: Integer;
  MinValue : Integer;
  MidPointIndex : Integer;
  MidPoint : TPoint;
begin
  if Force then begin
    Result := PGeneralQuickDialog;
    Exit;
  end;

  Result := PGeneralQuickDialog;
  Points := AView.Points;
  if Points.Count > 2 then MidPointIndex := Trunc(Points.Count / 2)
  else MidPointIndex := 0;
  MidPoint.X := Trunc((Points.Points[MidPointIndex].X + Points.Points[MidPointIndex+1].X)/2);
  MidPoint.Y := Trunc((Points.Points[MidPointIndex].Y + Points.Points[MidPointIndex+1].Y)/2);
  with Points do begin
    L1 := Trunc(sqrt(sqr(Points[0].X - FZoomRatedMousePos.X) + sqr(Points[0].Y - FZoomRatedMousePos.Y)));
    L2 := Trunc(sqrt(sqr(Points[Count-1].X - FZoomRatedMousePos.X) + sqr(Points[Count-1].Y - FZoomRatedMousePos.Y)));
    L3 := Trunc(sqrt(sqr(MidPoint.X - FZoomRatedMousePos.X) + sqr(MidPoint.Y - FZoomRatedMousePos.Y)));
  end;
  MinValue := Min(Min(L1, L2), L3);
  // LinkEnd
  if MinValue <> L3 then begin
    if MinValue = L1 then AModel := (AView.Model as PUMLLink).Connections[0]
    else if MinValue = L2 then AModel := (AView.Model as PUMLLink).Connections[1];
  end;
end;

function PQuickDialogManager.GetFromAssociationLabelView(var AView: PView; var AModel: PModel): PQuickDialogClass;
var
  EdgeLbl: PEdgeLabelView;
  AssocView: PUMLAssociationView;
begin
  Result := nil;
  EdgeLbl := AView as PEdgeLabelView;
  AssocView := EdgeLbl.Parent as PUMLAssociationView;
  // AssociationEnd (Head)
  if (AssocView.HeadRoleNameLabel = EdgeLbl) or
     (AssocView.HeadMultiplicityLabel = EdgeLbl) or
     (AssocView.HeadPropertyLabel = EdgeLbl)
  then begin
    AView := EdgeLbl.Parent;
    AModel := (AView.Model as PUMLAssociation).Connections[1];
    Result := PAssociationEndQuickDialog;
  // AssociationEnd (Tail)
  end else if (AssocView.TailRoleNameLabel = EdgeLbl) or
              (AssocView.TailMultiplicityLabel = EdgeLbl) or
              (AssocView.TailPropertyLabel = EdgeLbl)
  then begin
    AView := EdgeLbl.Parent;
    AModel := (AView.Model as PUMLAssociation).Connections[0];
    Result := PAssociationEndQuickDialog;
  // Association
  end else begin
    AView := EdgeLbl.Parent;
    Result := PGeneralQuickDialog;
  end;
end;

function PQuickDialogManager.GetFromLinkLabelView(var AView: PView; var AModel: PModel): PQuickDialogClass;
var
  EdgeLbl: PEdgeLabelView;
  LinkView: PUMLLinkView;
begin
  Result := PGeneralQuickDialog;
  EdgeLbl := AView as PEdgeLabelView;
  LinkView := EdgeLbl.Parent as PUMLLinkView;
  AView := LinkView;
  if LinkView.HeadEndLabel = EdgeLbl then
    AModel := (AView.Model as PUMLLink).Connections[1]
  else if LinkView.TailEndLabel = EdgeLbl then
    AModel := (AView.Model as PUMLLink).Connections[0]
end;

procedure PQuickDialogManager.SetMousePos(AView: PView; MousePos: TPoint);
var
  DgmView: PDiagramView;
  ZRate: Real;
begin
  FMousePos := MousePos;
  ZRate := 1;
  DgmView := GetOwnerDiagramView(AView);
  if DgmView <> nil then
    ZRate := GetZoomRate(DgmView.Canvas.ZoomFactor);
  if ZRate <> 1 then begin
    FZoomRatedMousePos.X := Trunc(MousePos.X / ZRate);
    FZoomRatedMousePos.Y := Trunc(MousePos.Y / ZRate);
  end else begin
    FZoomRatedMousePos := MousePos;
  end;
end;

procedure PQuickDialogManager.GeneralNameExpApplying(AModel: PModel; Value: string);
begin
  if Assigned(FOnGeneralNameExpApplying) then FOnGeneralNameExpApplying(AModel, Value);
end;

procedure PQuickDialogManager.ClassifierRoleExpApplying(AModel: PModel; Value: string);
begin
  if Assigned(FOnClassifierRoleExpApplying) then FOnClassifierRoleExpApplying(AModel, Value);
end;

procedure PQuickDialogManager.InstanceExpApplying(AModel: PModel; Value: string);
begin
  if Assigned(FOnInstanceExpApplying) then FOnInstanceExpApplying(AModel, Value);
end;

procedure PQuickDialogManager.AttributeExpApplying(AModel: PModel; Value: string);
begin
  if Assigned(FOnAttributeExpApplying) then FOnAttributeExpApplying(AModel, Value);
end;

procedure PQuickDialogManager.OperationExpApplying(AModel: PModel; Value: string);
begin
  if Assigned(FOnOperationExpApplying) then FOnOperationExpApplying(AModel, Value);
end;

procedure PQuickDialogManager.MessageExpApplying(AModel: PModel; Value: string);
begin
  if Assigned(FOnMessageExpApplying) then FOnMessageExpApplying(AModel, Value);
end;

procedure PQuickDialogManager.ModelCreatingHandler(Owner: PModel; ModelKind: string;
    Argument: Integer = 0; InsertIndex: Integer = -1);
begin
  if Assigned(FOnModelCreating) then FOnModelCreating(Owner, ModelKind, Argument, InsertIndex);
end;

procedure PQuickDialogManager.ModelCreatingWithNameHandler(Owner: PModel; ModelKind: string; Name: string = '');
begin
  if Assigned(FOnModelCreatingWithName) then FOnModelCreatingWithName(Owner, ModelKind, Name);
end;

procedure PQuickDialogManager.ElementDeletingHandler(AModel: PModel);
begin
  if Assigned(FOnElementDeleting) then FOnElementDeleting(AModel);
end;

procedure PQuickDialogManager.OrderChangingHandler(AModel: PModel; AnItem: PModel;
    Key: string; NewOrder: Integer);
begin
  if Assigned(FOnOrderChanging) then FOnOrderChanging(AModel, AnItem, Key, NewOrder);
end;

procedure PQuickDialogManager.VisibilityChangingHandler(AModel: PModel; Kind: PUMLVisibilityKind);
begin
  if Assigned(FOnVisibilityChanging) then FOnVisibilityChanging(AModel, Kind);
end;

procedure PQuickDialogManager.MultiplicityChangingHandler(AModel: PModel; Value: string);
begin
  if Assigned(FOnMultiplicityChanging) then FOnMultiplicityChanging(AModel, Value);
end;

procedure PQuickDialogManager.AggregationKindChangingHandler(AModel: PModel; Kind: PUMLAggregationKind);
begin
  if Assigned(FOnAggregationKindChanging) then FOnAggregationKindChanging(AModel, Kind);
end;

procedure PQuickDialogManager.NavigableChanging(AModel: PModel; IsNavigable: Boolean);
begin
  if Assigned(FOnNavigableChanging) then FOnNavigableChanging(AModel, IsNavigable);
end;

procedure PQuickDialogManager.OperationChangingHandler(AModel: PModel; AnOp: PUMLOperation);
begin
  if Assigned(FOnOperationChanging) then FOnOperationChanging(AModel, AnOp);
end;

procedure PQuickDialogManager.SignalChangingHandler(AModel: PModel; ASignal: PUMLSignal);
begin
  if Assigned(FOnSignalChanging) then FOnSignalChanging(AModel, ASignal);
end;

procedure PQuickDialogManager.InstantiationChangingHandler(AModel: PModel; AInstantiation: PUMLClassifier);
begin
  if Assigned(FOnInstantiationChanging) then FOnInstantiationChanging(AModel, AInstantiation);
end;

procedure PQuickDialogManager.NoteTextChanging(AView: PUMLCustomTextView; Value: string);
begin
  if Assigned(FOnNoteTextChanging) then FOnNoteTextChanging(AView, Value);
end;

procedure PQuickDialogManager.SeqNumberChanging(AElement: PElement; ACollectionItem: PElement; Key: string; NewIndex: Integer);
begin
  if Assigned(FOnSeqNumberChanging) then FOnSeqNumberChanging(AElement, ACollectionItem, Key, NewIndex);
end;

procedure PQuickDialogManager.ObjectClassCreatingHandler(Owner: PUMLNamespace; AModel: PUMLModelElement; Name: string = '');
begin
  if Assigned(FOnObjectClassCreating) then FOnObjectClassCreating(Owner, AModel, Name);
end;

procedure PQuickDialogManager.CallActionOperationCreatingHandler(AClassifier: PUMLClassifier; ACallAction: PUMLCallAction; Name: string = '');
begin
  if Assigned(FOnCallActionOperationCreating) then FOnCallActionOperationCreating(AClassifier, ACallAction, Name);
end;

procedure PQuickDialogManager.QuickDialogHideHandler(Sender: TObject);
begin
  if Assigned(FOnQuickDialogHide) then FOnQuickDialogHide(Self);
end;

(*
procedure PQuickDialogManager.ObjectExpApplyingWithNew(Sender: TObject; Owner: PUMLNamespace;
  AModel: PUMLModelElement; Value: string);
begin
  if Assigned(FOnObjectExpApplyingWithNew) then FOnObjectExpApplyingWithNew(Sender, Owner, AModel, Value);
end;
*)
procedure PQuickDialogManager.QuickDialogDestoryHandler(Sender: TObject);
var
  QuickDialog: PAbstractQuickDialog;
begin
  if not Assigned(FNextView) then Exit;
  if Assigned(FNextQuickDialogClass) then begin
    try
      QuickDialog := FNextQuickDialogClass.Create(Self);
      QuickDialog.OnDestroy := QuickDialogDestoryHandler;
      QuickDialog.OnHide := QuickDialogHideHandler;
      QuickDialog.ClientOrigin := FClientOrigin;
      QuickDialog.MousePos := FMousePos;
      QuickDialog.SetQuickDialog(Self, FNextView, FNextModel, FNextIndex);
      QuickDialog.Show;
      FNextQuickDialogClass := nil;
    except on Exception do
    end;
  end;
end;

procedure PQuickDialogManager.ShowAnotherQuickDialog(Sender: PAbstractQuickDialog;
    QuickDialogClass: PQuickDialogClass; AView: PView; AModel: PModel = nil; Idx: Integer = -1);
begin
  FNextQuickDialogClass := QuickDialogClass;
  FNextView := AView;
  FNextModel := AModel;
  FNextIndex := Idx;
  Sender.Close;
end;

// PQuickDialogManager
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAbstractQuickDialog

constructor PAbstractQuickDialog.Create(Manager: PQuickDialogManager);
begin
  Create(Application);
  FManager := Manager;
  FShowedError := False;
  FKeyUpOnly := True;

  Self.OnShow := FormShowHandler;
  Self.OnClose := FormCloseHandler;
  Self.OnDeactivate := FormDeactivateHandler;
  Self.LeftButton1.OnClick := LeftButton1ClickHandler;
  Self.LeftButton2.OnClick := LeftButton2ClickHandler;
  Self.RightButton1.OnClick := RightButton1ClickHandler;
  Self.RightButton2.OnClick := RightButton2ClickHandler;
  Self.RightButton3.OnClick := RightButton3ClickHandler;
  Self.RightButton4.OnClick := RightButton4ClickHandler;
  Self.NameEdit.OnKeyDown := NameEditKeyDownHandler;
  Self.NameEdit.OnKeyUp := NameEditKeyUpHandler;
  Self.NameEdit.OnEnter := NameEditEnterHandler;
  Self.NameEdit.OnChange := NameEditChangeHandler;
  Self.ComboBox.OnEnter := ComboBoxEnterHandler;
  Self.ComboBox.OnClick := ComboBoxClickHandler;
  Self.ComboBox.OnKeyDown := ComboBoxKeyDownHandler;
  Self.VisibilityPrivate.OnClick := VisibilityMenuItemClicked;
  Self.VisibilityProtected.OnClick := VisibilityMenuItemClicked;
  Self.VisibilityPublic.OnClick := VisibilityMenuItemClicked;
  Self.VisibilityPackage.OnClick := VisibilityMenuItemClicked;
  Self.Association.OnClick := AssociationKindMenuItemClicked;
  Self.Aggregation.OnClick := AssociationKindMenuItemClicked;
  Self.Composition.OnClick := AssociationKindMenuItemClicked;
  Self.Navigable.OnClick := AssociationNavigableMenuItemClicked;

  AfterConstructionProc;
end;

procedure PAbstractQuickDialog.SetQuickDialog(AManager: PQuickDialogManager;
    AView: PView; AModel: PModel = nil; Idx: Integer = -1);
begin
  FView := AView;
  SetComponentsSizeAndPosition;
  SetQuickDialogData;
end;

procedure PAbstractQuickDialog.SetFormRegion;
var
  X, Y: Integer;
  FullRgn, ClientRgn, ControlRgn: THandle;
begin
  { except Visible Visual Controls, make Form range transparent }
  FullRgn := CreateRectRgn(0, 0, Width, Height);
  ClientRgn := CreateRectRgn(0, 0, Width, Height);
  CombineRgn(FullRgn, FullRgn, ClientRgn, RGN_DIFF);
  if ClientRgn > 0 then DeleteObject(ClientRgn);

  if BasePanel.Visible then begin
    X := BasePanel.Left;
    Y := BasePanel.Top;
    ControlRgn := CreateRectRgn(X, Y, X + BasePanel.Width, Y + BasePanel.Height);
    CombineRgn(FullRgn, FullRgn, ControlRgn, RGN_OR);
    if ControlRgn > 0 then DeleteObject(ControlRgn);
  end else begin
    if LeftPanel.Visible then begin
      X := LeftPanel.Left;
      Y := LeftPanel.Top;
      ControlRgn := CreateRectRgn(X, Y, X + LeftPanel.Width, Y + LeftPanel.Height);
      CombineRgn(FullRgn, FullRgn, ControlRgn, RGN_OR);
      if ControlRgn > 0 then DeleteObject(ControlRgn);
    end;
    if MiddlePanel.Visible then begin
      X := MiddlePanel.Left;
      Y := MiddlePanel.Top;
      ControlRgn := CreateRectRgn(X, Y, X + MiddlePanel.Width, Y + MiddlePanel.Height);
      CombineRgn(FullRgn, FullRgn, ControlRgn, RGN_OR);
      if ControlRgn > 0 then DeleteObject(ControlRgn);
    end;
    if RightPanel.Visible then begin
      X := RightPanel.Left;
      Y := RightPanel.Top;
      ControlRgn := CreateRectRgn(X, Y, X + RightPanel.Width, Y + RightPanel.Height);
      CombineRgn(FullRgn, FullRgn, ControlRgn, RGN_OR);
      if ControlRgn > 0 then DeleteObject(ControlRgn);
    end;
  end;
  SetWindowRgn(Handle, FullRgn, True);
  if FullRgn > 0 then DeleteObject(FullRgn);
end;

procedure PAbstractQuickDialog.AfterConstructionProc;
begin
  // no implementation
end;

procedure PAbstractQuickDialog.SetComponentsSizeAndPosition;
begin
  // no implementation
end;

procedure PAbstractQuickDialog.SetQuickDialogData;
begin
  // no implementation
end;

procedure PAbstractQuickDialog.Initialize;
begin
  // no implementation
end;

procedure PAbstractQuickDialog.SetNameEditData;
begin
  // no implementation
end;

procedure PAbstractQuickDialog.AssignNameEditValue;
begin
  // no implementation
end;

function PAbstractQuickDialog.GetEditTextWidth: Integer;
var
  OriginFont: TFont;
begin
  OriginFont := Self.Canvas.Font;
  try
    Self.Canvas.Font := NameEdit.Font;
    Result := Self.Canvas.TextWidth(NameEdit.Text);
  finally
    Self.Canvas.Font := OriginFont;
  end;
end;

procedure PAbstractQuickDialog.FormShowHandler(Sender: TObject);
begin
  SetFormRegion;
  try
    if NameEdit.Visible then begin
      NameEdit.Perform(EM_SETMARGINS, EC_LEFTMARGIN, MakeLong(0, 0));
      NameEdit.Perform(EM_SETMARGINS, EC_RIGHTMARGIN, MakeLong(0, 0));
      NameEdit.SetFocus;
      NameEdit.SelLength := 0;
      NameEdit.SelStart := Length(NameEdit.Text);
      NameEdit.SelectAll;
    end else if ComboBox.Visible then begin
      if ComboBox.ItemIndex < 0 then begin
        ComboBox.SetFocus;
        ComboBox.SelLength := 0;
        ComboBox.SelStart := Length(ComboBox.Text);
        if ComboBox.Text <> '' then ComboBox.SelectAll;
      end;
    end;
  except on Exception do
  end;
end;

procedure PAbstractQuickDialog.FormCloseHandler(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;;
end;

procedure PAbstractQuickDialog.FormDeactivateHandler(Sender: TObject);
begin
  if Self.Visible then begin
    FShowedError := False;
    FormHidingProc(VK_RETURN, []);
    if FShowedError then begin
      FShowedError := False;
      Self.Show;
    end;
  end;
end;

procedure PAbstractQuickDialog.LeftButton1ClickHandler(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.LeftButton2ClickHandler(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.RightButton1ClickHandler(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.RightButton2ClickHandler(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.RightButton3ClickHandler(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.RightButton4ClickHandler(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.NameEditKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.NameEditKeyUpHandler(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.NameEditEnterHandler(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.NameEditChangeHandler(Sender: TObject);
var
  TextWidth, W: Integer;
begin
  TextWidth := GetEditTextWidth;
  { Size }
  NameEdit.Width := Min(Max(TextWidth + (NameEdit.Font.Size * 2), NameEdit.Width), 10000);

  if MiddlePanel.Visible then
    MiddlePanel.Width := NameEdit.Width + (BUTTON_MARGIN * 2);
  if BasePanel.Visible then begin
    W := NameEdit.Width + (BUTTON_MARGIN * 4);
    if LeftButton1.Visible then W := W + BUTTON_WIDTH;
    if LeftButton2.Visible then W := W + BUTTON_WIDTH;
    if RightButton1.Visible and (RightButton1.Parent = BasePanel) then W := W + BUTTON_WIDTH;
    if ComboBox.Visible then W := W + ComboBox.Width;
    BasePanel.Width := W;
  end;
  { Position }
  if ComboBox.Visible and (ComboBox.Left > NameEdit.Left) then
    ComboBox.Left := NameEdit.Left + NameEdit.Width;
  if RightPanel.Visible then
    RightPanel.Left := LeftPanel.Width + MiddlePanel.Width;
  if RightButton1.Visible and (RightButton1.Parent = BasePanel) then
    RIghtButton1.Left := NameEdit.Left + NameEdit.Width;

  if BasePanel.Visible then W := BasePanel.Width * 2
  else begin
    W := 0;
    if LeftPanel.Visible then W := LeftPanel.Width;
    if MiddlePanel.Visible then W := W + MiddlePanel.Width;
    if RightPanel.Visible then W := W + RightPanel.Width;
    W := W * 2;
  end;
  Self.Width := W;

  SetFormRegion;
end;

procedure PAbstractQuickDialog.ComboBoxEnterHandler(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.ComboBoxClickHandler(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.ComboBoxKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.ComboBox2EnterHandler(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.ComboBox2ClickHandler(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.ComboBox2KeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.VisibilityMenuItemClicked(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.AssociationKindMenuItemClicked(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.AssociationNavigableMenuItemClicked(Sender: TObject);
begin
  // no implementation
end;

procedure PAbstractQuickDialog.FormHidingProc(Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then HidingWithEscapeKey
  else if Key = VK_UP then begin
    if ssCtrl in Shift then HidingWithCtrlUpArrowKey
    else HidingWithUpArrowKey;
  end else if Key = VK_DOWN then begin
    if ssCtrl in Shift then HidingWithCtrlDownArrowKey
    else HidingWithDownArrowKey;
  end else if (Key = VK_INSERT) and not(ssShift in Shift) then HidingWithInsertKey
  else if (Key = VK_DELETE) and (ssCtrl in Shift) then HidingWithCtrlDeleteKey
  else if Key = VK_RETURN then begin
    if ssCtrl in Shift then HidingWithCtrlReturnKey
    else HidingWithReturnKey;
  end;
end;

function PAbstractQuickDialog.CheckAndApplyNameEditStrChanging: Boolean;
begin
  Result := True;
  // no implementation
end;

procedure PAbstractQuickDialog.HidingWithEscapeKey;
begin
  Self.Close;
end;

procedure PAbstractQuickDialog.HidingWithReturnKey;
begin
  // do nothing
end;

procedure PAbstractQuickDialog.HidingWithCtrlReturnKey;
begin
  // do nothing
end;

procedure PAbstractQuickDialog.HidingWithUpArrowKey;
begin
  // do nothing
end;

procedure PAbstractQuickDialog.HidingWithCtrlUpArrowKey;
begin
  // do nothing
end;

procedure PAbstractQuickDialog.HidingWithDownArrowKey;
begin
  // do nothing
end;

procedure PAbstractQuickDialog.HidingWithCtrlDownArrowKey;
begin
  // do nothing
end;

procedure PAbstractQuickDialog.HidingWithInsertKey;
begin
  // do nothing
end;

procedure PAbstractQuickDialog.HidingWithCtrlDeleteKey;
begin
  // do nothing
end;

// PAbstractQuickDialog
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PGeneralQuickDialog

procedure PGeneralQuickDialog.SetQuickDialog(AManager: PQuickDialogManager;
    AView: PView; AModel: PModel = nil; Idx: Integer = -1);
begin
  if Assigned(AModel) then FModel := AModel
  else FModel := AView.Model;
  FCompartmentItemIndex := Idx;
  inherited;
end;

procedure PGeneralQuickDialog.AfterConstructionProc;
begin
  LeftButton1.Visible := False;
  ComboBox.Visible := False;
  RightPanel.Visible := False;
end;

procedure PGeneralQuickDialog.SetComponentsSizeAndPosition;
var
  ADiagram: PDiagramView;
  NodeView: PUMLGeneralNodeView;
  NameCompart: PUMLNameCompartmentView;
  ZRate: Real;
begin
  ADiagram := GetOwnerDiagramView(FView);
  ZRate := GetZoomRate(ADiagram.Canvas.ZoomFactor);
  if (FView is PUMLSwimlaneView) or (FView is PUMLPortView) or (FView is PUMLGeneralEdgeView) then begin
    BasePanel.Visible := True;
    LeftButton2.Parent := BasePanel;
    NameEdit.Parent := BasePanel;
    LeftPanel.Visible := False;
    MiddlePanel.Visible := False;
    NameEdit.Alignment := taLeftJustify;
    { Size }
    NameEdit.Width := NAME_EDIT_DEFAULT_WIDTH;
    NameEdit.Height := NAME_EDIT_DEFAULT_HEIGHT;
    BasePanel.Width := BUTTON_WIDTH + NameEdit.Width + (BUTTON_MARGIN * 4);
    BasePanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 4);
    Self.Width := BasePanel.Width * 2;
    Self.Height := BasePanel.Height * 2;
    { Position }
    BasePanel.Left := 0;
    BasePanel.Top := 0;
    LeftButton2.Left := BUTTON_MARGIN;
    LeftButton2.Top := BUTTON_MARGIN;
    NameEdit.Left := LeftButton2.Left + LeftButton2.Width;
    NameEdit.Top := BUTTON_MARGIN;
    if FView is PUMLPortView then begin
      Left := ClientOrigin.X + (FView as PUMLPortView).NameLabel.Left;
      Top := ClientOrigin.Y + (FView as PUMLPortView).NameLabel.Top;
    end
    else begin
      Left := ClientOrigin.X + MousePos.X;
      Top := ClientOrigin.Y + MousePos.Y;
    end;      
  end else if FView is PUMLGeneralNodeView then begin
    NodeView := FView as PUMLGeneralNodeView;
    NameCompart := NodeView.NameCompartment;
    LeftPanel.Visible := True;
    MiddlePanel.Visible := True;
    LeftPanel.Parent := Self;
    MiddlePanel.Parent := Self;
    LeftButton2.Parent := LeftPanel;
    NameEdit.Parent := MiddlePanel;
    BasePanel.Visible := False;
    NameEdit.Alignment := taCenter;
    { Size }
    LeftPanel.Width := BUTTON_WIDTH + (BUTTON_MARGIN * 2);
    LeftPanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 2);
    NameEdit.Width := Trunc((NodeView.Right - NodeView.Left) * ZRate - 3);
    NameEdit.Height := Trunc(NameCompart.Height * ZRate);
    MiddlePanel.Width := NameEdit.Width + (BUTTON_MARGIN * 2);
    MiddlePanel.Height := NameEdit.Height + (BUTTON_MARGIN * 2);
    Self.Width := (LeftPanel.Width + MiddlePanel.Width) * 2;
    Self.Height := Max(LeftPanel.Height, MiddlePanel.Height) * 2;
    { Position }
    LeftPanel.Left := 0;
    LeftPanel.Top := 0;
    LeftButton2.Left := 0;
    LeftButton2.Top := 0;
    MiddlePanel.Left := LeftPanel.Width;
    MiddlePanel.Top := 0;
    NameEdit.Left := BUTTON_MARGIN;
    NameEdit.Top := BUTTON_MARGIN;

    if (FView is PUMLComponentView) or
       (FView is PUMLComponentInstanceView) then
    begin
      Left := ClientOrigin.X + Trunc((FView as PUMLGeneralNodeView).Left * ZRate) + 1;
    end else begin
      Left := ClientOrigin.X + Trunc(NameCompart.Left * ZRate) + 1;
    end;
    Left := Left - LeftPanel.Width;
    Top := ClientOrigin.Y + Trunc(NameCompart.Top * ZRate);
  end else begin // Error protection code
    Left := -1000;
    Top := -1000;
  end;
end;

procedure PGeneralQuickDialog.SetQuickDialogData;
begin
  Initialize;
  SetVisibilityData;
  SetNameEditData;
  AssignNameEditValue;
end;

procedure PGeneralQuickDialog.Initialize;
begin
  NameEdit.Clear;
  NameEdit.ReadOnly := False;
  FOriginalString := '';
  //NameEdit.Color := FView.FillColor;
  LeftButton2.Glyph := nil;
  NameEdit.Font.Name := Self.Font.Name;
  NameEdit.Font.Size := Self.Font.Size;
  NameEdit.Font.Style := Self.Font.Style;
  LeftButton2.Hint := 'Visibility';
  if FModel is PUMLObject then NameEdit.Hint := OBJECT_HINT//'<<stereotype>> name : type'
  else if FModel is PUMLClassifierRole then NameEdit.Hint := CLASSIFIER_ROLE_HINT//'<<stereotype>> name : type'
  else NameEdit.Hint := '<<stereotype>> name';
end;

procedure PGeneralQuickDialog.SetVisibilityData;
begin
  FVisibilityKind := (FModel as PUMLModelElement).Visibility;
  case FVisibilityKind of
    vkPublic: QuickDialogImages.GetBitmap(0, LeftButton2.Glyph);
    vkProtected: QuickDialogImages.GetBitmap(1, LeftButton2.Glyph);
    vkPrivate: QuickDialogImages.GetBitmap(2, LeftButton2.Glyph);
    vkPackage: QuickDialogImages.GetBitmap(3, LeftButton2.Glyph);
  end;
end;

procedure PGeneralQuickDialog.SetNameEditData;
var
  StereotypeStr: string;
  AClassifier: PUMLClassifier;
begin
  StereotypeStr := '';
  StereotypeStr := (FModel as PUMLModelElement).StereotypeName;
  if StereotypeStr <> '' then FOriginalString := '<<' + StereotypeStr + '>> ';
  FOriginalString := FOriginalString + FModel.Name;
  if FModel is PUMLObject then begin
    AClassifier := (FModel as PUMLObject).Classifier;
    if Assigned(AClassifier) then FOriginalString := FOriginalString + ': ' + AClassifier.Name;
  end else if FModel is PUMLClassifierRole then begin
    AClassifier := (FModel as PUMLClassifierRole).Base;
    if Assigned(AClassifier) then FOriginalString := FOriginalString + ': ' + AClassifier.Name;
  end;
end;

procedure PGeneralQuickDialog.AssignNameEditValue;
var
  ZRate: Real;
begin
  NameEdit.Clear;
  if FOriginalString <> '' then begin
    NameEdit.Font.Name := FView.FontFace;
    //NameEdit.Font.Color := FView.FontColor;
    NameEdit.Font.Style := FView.FontStyle;
    if FView is PUMLGeneralNodeView then begin
      ZRate := GetZoomRate(FView.GetDiagramView.Canvas.ZoomFactor);
      NameEdit.Font.Size := Trunc(FView.FontSize * ZRate);
    end;
    NameEdit.Text := FOriginalString;
  end;
end;

procedure PGeneralQuickDialog.LeftButton2ClickHandler(Sender: TObject);
var
  L, T: Integer;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;

  AssociationGroupHandle.Visible := False;
  VisibilityGroupHandle.Visible := True;
  // Popup Visibility Menu
  L := Left + LeftButton2.Left;
  if BasePanel.Visible then
    T := Top + BasePanel.Top + BasePanel.Height
  else T := Top + LeftPanel.Top + LeftPanel.Height;
  QuickDialogPopupHandle.Popup(L, T);
end;

procedure PGeneralQuickDialog.NameEditKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  NewShift: TShiftState;
begin
  FKeyUpOnly := False;
  if (Key = VK_RETURN) and (ssCtrl in Shift) then NameEdit.ReadOnly := True;
  if ((Key = Ord('A')) or (Key = Ord('a'))) and (ssCtrl in Shift) and not (ssAlt in Shift) then
    NameEdit.SelectAll; // Ctrl + A
end;

procedure PGeneralQuickDialog.NameEditKeyUpHandler(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key <> 229 then
    ShowInformationHint;

  if NameEdit.ReadOnly then NameEdit.ReadOnly := False;
  if not FKeyUpOnly then begin  // Key up only(in case of error message window closed) is not executed
    if (Key = VK_ESCAPE) or (Key = VK_RETURN) or (Key = VK_INSERT) or (Key = VK_DELETE) or
       (Key = VK_UP) or (Key = VK_DOWN)
    then FormHidingProc(Key, Shift);
  end;
  FKeyUpOnly := True;
end;

procedure PGeneralQuickDialog.VisibilityMenuItemClicked(Sender: TObject);
var
  Idx: Integer;
  Kind: PUMLVisibilityKind;
begin
  Idx := VisibilityGroupHandle.IndexInGroup(Sender as TComponent);
  if Idx >= 0 then begin
    Kind := PUMLVisibilityKind(Idx);
    if FVisibilityKind <> Kind then begin
      LeftButton2.Glyph := nil;
      FManager.VisibilityChangingHandler(FModel, Kind);
      SetVisibilityData;
    end;
  end;
end;

function PGeneralQuickDialog.CheckAndApplyNameEditStrChanging: Boolean;
var
  Str: string;
begin
  Result := True;
  if NameEdit.Modified then begin
    Str := Trim(NameEdit.Text);

    // if input text is short creation syntax, execute short creation process
    if not ShortenSyntaxManager.Execute(FModel, Str) then begin
      // unless, execute below
      try
        if FModel is PUMLClassifierRole then
          FManager.ClassifierRoleExpApplying(FModel, Str)
        else if (FModel is PUMLObject) or (FModel is PUMLNodeInstance) then
          FManager.InstanceExpApplying(FModel, Str)
        else
          FManager.GeneralNameExpApplying(FModel, Str);
      except on E: Exception do
        begin
          FShowedError := True;
          ShowMessagePos(E.Message, Self.Left, Self.Top);
          Result := False;
          Exit;
        end;
      end;
      FOriginalString := Str;
      NameEdit.Modified := False;
    end;
  end;
end;

procedure PGeneralQuickDialog.HidingWithReturnKey;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  Self.Close;
end;

procedure PGeneralQuickDialog.HidingWithCtrlReturnKey;
begin
  HidingWithReturnKey;
end;

// PGeneralQuickDialog
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PSubsystemQuickDialog

procedure PSubsystemQuickDialog.AfterConstructionProc;
begin
  LeftButton1.Visible := False;
  ComboBox.Visible := False;
  RightButton1.Visible := False;
  RightButton3.Visible := False;
  RightButton4.Visible := False;
  LeftPanel.Parent := Self;
  MiddlePanel.Parent := Self;
  RightPanel.Parent := Self;
  BasePanel.Visible := False;
  NameEdit.Alignment := taCenter;
  { Size }
  LeftPanel.Width := BUTTON_WIDTH + (BUTTON_MARGIN * 2);
  LeftPanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 2);
  RightPanel.Width := BUTTON_WIDTH + (BUTTON_MARGIN * 2);
  RightPanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 2);
  { Position }
  LeftPanel.Left := 0;
  LeftPanel.Top := 0;
  LeftButton2.Left := 0;
  LeftButton2.Top := 0;
  MiddlePanel.Left := LeftPanel.Width;
  MiddlePanel.Top := 0;
  NameEdit.Left := BUTTON_MARGIN;
  NameEdit.Top := BUTTON_MARGIN;
  RightPanel.Top := 0;
  RightButton2.Left := 0;
  RightButton2.Top := 0;
end;

procedure PSubsystemQuickDialog.SetComponentsSizeAndPosition;
var
  ADiagram: PDiagramView;
  NodeView: PUMLGeneralNodeView;
  NameCompart: PUMLNameCompartmentView;
  ZRate: Real;
begin
  ADiagram := GetOwnerDiagramView(FView);
  ZRate := GetZoomRate(ADiagram.Canvas.ZoomFactor);
  NodeView := FView as PUMLGeneralNodeView;
  NameCompart := NodeView.NameCompartment;
  { Size }
  NameEdit.Width := Trunc((NodeView.Right - NodeView.Left) * ZRate - 3);
  NameEdit.Height := Trunc(NameCompart.Height * ZRate);
  MiddlePanel.Width := NameEdit.Width + (BUTTON_MARGIN * 2);
  MiddlePanel.Height := NameEdit.Height + (BUTTON_MARGIN * 2);
  Self.Width := (LeftPanel.Width + MiddlePanel.Width + RightPanel.Width) * 2;
  Self.Height := Max(LeftPanel.Height, MiddlePanel.Height) * 2;
  { Position }
  RightPanel.Left := LeftPanel.Width + MiddlePanel.Width;
  Left := ClientOrigin.X + Trunc(NameCompart.Left * ZRate);
  Left := Left - LeftPanel.Width;
  Top := ClientOrigin.Y + Trunc(NameCompart.Top * ZRate);
end;

procedure PSubsystemQuickDialog.Initialize;
begin
  inherited;
  RightButton2.Glyph := nil;
  QuickDialogImages.GetBitmap(8, RightButton2.Glyph);
  RightButton2.Hint := TXT_ADD_OPERATION;
end;

procedure PSubsystemQuickDialog.RightButton2ClickHandler(Sender: TObject);
var
  OpCompart: PUMLOperationCompartmentView;
  AModel: PModel;
  Idx: Integer;
begin
  { add Operation to Subsystem }
  OpCompart := (FView as PUMLSubsystemView).OperationCompartment;
  if OpCompart.Visible then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    FManager.ModelCreatingHandler(FModel, 'Operation');
    Idx := OpCompart.CompartmentItemCount - 1;
    AModel := (FModel as PUMLSubsystem).Operations[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
  end else begin
    FManager.ModelCreatingHandler(FModel, 'Operation');
  end;
end;

procedure PSubsystemQuickDialog.HidingWithDownArrowKey;
var
  OpCompart: PUMLOperationCompartmentView;
  AModel: PModel;
begin
  { show QuickDialog for Operation }
  OpCompart := (FView as PUMLSubsystemView).OperationCompartment;
  if (OpCompart.Visible) and (OpCompart.CompartmentItemCount > 0) then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    AModel := (FModel as PUMLSubsystem).Operations[0];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, 0);
  end;
end;

// PSubsystemQuickDialog
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PCustomObjectQuickDialog

function PCustomObjectQuickDialog.GetParentNamespace(AModel: PModel): PUMLNamespace;
var
  NS: PModel;
begin
  Result := nil;
  if AModel <> nil then begin
    NS := AModel.VirtualNamespace;
    if (NS is PUMLNamespace) and not (NS is PUMLCollaboration) then
      Result := NS as PUMLNamespace
    else
      Result := GetParentNamespace(NS);
  end;
end;

procedure PCustomObjectQuickDialog.ApplyStrChanging;
  function GetLastColonPos(Str: string): Integer;
  var
    C: Integer;
  begin
    C := 0;
    while Pos(':', Str) > 0 do
    begin
      C := Pos(':', Str);
      Str[C] := ' ';
    end;
    Result := C;
  end;
var
  Str: string;
  Idx: Integer;
  Elem: PUMLClassifier;
begin
  Str := Trim(NameEdit.Text);
  Idx := GetLastColonPos(Str);
  if Idx > 0 then Str := Copy(Str, 1, Idx - 1);
  if FModel is PUMLObject then
    Elem := (FModel as PUMLObject).Classifier
  else if FModel is PUMLClassifierRole then
    Elem := (FModel as PUMLClassifierRole).Base
  else begin
    Assert(False); // Flow should not get here?
    Elem := nil;
  end;
  if Elem <> nil then NameEdit.Text := Str + ': ' + Elem.Name;
end;

procedure PCustomObjectQuickDialog.Initialize;
begin
  inherited;
  RightButton2.Glyph := nil;
  RightButton2.Hint := '';
  QuickDialogImages.GetBitmap(21, RightButton2.Glyph);
  RightButton2.Hint := TXT_ADD_CLASS;
end;

procedure PCustomObjectQuickDialog.RightButton2ClickHandler(Sender: TObject);
var
  AOwner: PUMLNamespace;
  NameStr: string;
begin
  { add Class element and set Base|Classifier reference }

  NameStr := '';
  if QueryInput(TXT_INPUT_ELEM_NAME, TXT_INPUT_CLASS_NAME, NameStr) and (NameStr <> '') then
  begin
    AOwner := GetParentNamespace(FModel);
    // Assertion
    Assert(AOwner <> nil);
    // Assertion
    if AOwner <> nil then begin
      FManager.ObjectClassCreatingHandler(AOwner, FModel as PUMLModelElement, NameStr);
      ApplyStrChanging;
    end;
  end;
end;

procedure PCustomObjectQuickDialog.HidingWithDownArrowKey;
begin
  // nothing to do
end;

// PCustomObjectQuickDialog
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PClassifierQuickDialog

procedure PClassifierQuickDialog.AfterConstructionProc;
begin
  LeftButton1.Visible := False;
  ComboBox.Visible := False;
  RightButton3.Visible := False;
  RightButton4.Visible := False;
  LeftPanel.Parent := Self;
  MiddlePanel.Parent := Self;
  RightPanel.Parent := Self;
  BasePanel.Visible := False;
  NameEdit.Alignment := taCenter;
  { Size }
  LeftPanel.Width := BUTTON_WIDTH + (BUTTON_MARGIN * 2);
  LeftPanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 2);
  RightPanel.Width := (BUTTON_WIDTH * 2) + (BUTTON_MARGIN * 2);
  RightPanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 2);
  { Position }
  LeftPanel.Left := 0;
  LeftPanel.Top := 0;
  LeftButton2.Left := 0;
  LeftButton2.Top := 0;
  MiddlePanel.Left := LeftPanel.Width;
  MiddlePanel.Top := 0;
  NameEdit.Left := BUTTON_MARGIN;
  NameEdit.Top := BUTTON_MARGIN;
  RightPanel.Top := 0;
  RightButton1.Left := 0;
  RightButton1.Top := 0;
  RightButton2.Left := BUTTON_WIDTH;
  RightButton2.Top := 0;
end;

procedure PClassifierQuickDialog.SetComponentsSizeAndPosition;
var
  ADiagram: PDiagramView;
  NodeView: PUMLGeneralNodeView;
  NameCompart: PUMLNameCompartmentView;
  ZRate: Real;
begin
  ADiagram := GetOwnerDiagramView(FView);
  ZRate := GetZoomRate(ADiagram.Canvas.ZoomFactor);
  NodeView := FView as PUMLGeneralNodeView;
  NameCompart := NodeView.NameCompartment;
  { Size }
  NameEdit.Width := Trunc((NodeView.Right - NodeView.Left) * ZRate - 3);
  NameEdit.Height := Trunc(NameCompart.Height * ZRate);
  MiddlePanel.Width := NameEdit.Width + (BUTTON_MARGIN * 2);
  MiddlePanel.Height := NameEdit.Height + (BUTTON_MARGIN * 2);
  Self.Width := (LeftPanel.Width + MiddlePanel.Width + RightPanel.Width) * 2;
  Self.Height := Max(LeftPanel.Height, MiddlePanel.Height) * 2;
  { Position }
  RightPanel.Left := LeftPanel.Width + MiddlePanel.Width;
  Left := ClientOrigin.X + Trunc(NameCompart.Left * ZRate) + 1;
  Left := Left - LeftPanel.Width;
  Top := ClientOrigin.Y + Trunc(NameCompart.Top * ZRate);
end;

procedure PClassifierQuickDialog.Initialize;
begin
  NameEdit.Clear;
  NameEdit.ReadOnly := False;
  FOriginalString := '';
  //NameEdit.Color := FView.FillColor;
  LeftButton2.Glyph := nil;
  LeftButton2.Hint := 'Visibility';
  NameEdit.Hint := CLASSIFIER_HINT;//'<<stereotype>> name' +#13#10+ CLASSIFIER_SHORT_CREATION_HINT;
  RightButton1.Glyph := nil;
  if FModel is PUMLEnumeration then begin
    QuickDialogImages.GetBitmap(9, RightButton1.Glyph);
    RightButton1.Hint := TXT_ADD_LITERAL;
  end else begin
    QuickDialogImages.GetBitmap(7, RightButton1.Glyph);
    RightButton1.Hint := TXT_ADD_ATTRIBUTE;
  end;
  RightButton2.Glyph := nil;
  QuickDialogImages.GetBitmap(8, RightButton2.Glyph);
  RightButton2.Hint := TXT_ADD_OPERATION;
end;

procedure PClassifierQuickDialog.RightButton1ClickHandler(Sender: TObject);
var
  AttrCompart: PUMLAttributeCompartmentView;
  LiteralCompart: PUMLEnumerationLiteralCompartmentView;
  Idx: Integer;
  AModel: PModel;
begin
  { add Attribute/EnumerationLiteral to Classifier }
  if FModel is PUMLEnumeration then begin
    LiteralCompart := (FView as PUMLEnumerationView).EnumerationLiteralCompartment;
    if LiteralCompart.Visible then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      FManager.ModelCreatingHandler(FModel, 'EnumerationLiteral');
      Idx := LiteralCompart.CompartmentItemCount - 1;
      AModel := (FModel as PUMLEnumeration).Literals[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end else begin
      FManager.ModelCreatingHandler(FModel, 'EnumerationLiteral');
    end;
  end else begin
    AttrCompart := (FView as PUMLClassifierView).AttributeCompartment;
    if AttrCompart.Visible then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      FManager.ModelCreatingHandler(FModel, 'Attribute');
      Idx := AttrCompart.CompartmentItemCount - 1;
      AModel := (FModel as PUMLClassifier).Attributes[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end else begin
      FManager.ModelCreatingHandler(FModel, 'Attribute');
    end;
  end;
end;

procedure PClassifierQuickDialog.RightButton2ClickHandler(Sender: TObject);
var
  OpCompart: PUMLOperationCompartmentView;
  AModel: PModel;
  Idx: Integer;
begin
  { add Operation to Classifier }
  if FModel is PUMLEnumeration then
    OpCompart := (FView as PUMLEnumerationView).OperationCompartment
  else OpCompart := (FView as PUMLClassifierView).OperationCompartment;

  if OpCompart.Visible then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    FManager.ModelCreatingHandler(FModel, 'Operation');
    Idx := OpCompart.CompartmentItemCount - 1;
    if FModel is PUMLEnumeration then AModel := (FModel as PUMLEnumeration).Operations[Idx]
    else AModel := (FModel as PUMLClassifier).Operations[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
  end else begin
    FManager.ModelCreatingHandler(FModel, 'Operation');
  end;
end;

procedure PClassifierQuickDialog.HidingWithDownArrowKey;
var
  AttrCompart: PUMLAttributeCompartmentView;
  OpCompart: PUMLOperationCompartmentView;
  LiteralCompart: PUMLEnumerationLiteralCompartmentView;
  AModel: PModel;
begin
  { Attribute | EnumerationLiteral }
  if FModel is PUMLEnumeration then begin
    LiteralCompart := (FView as PUMLEnumerationView).EnumerationLiteralCompartment;
    if (LiteralCompart.Visible) and (LiteralCompart.CompartmentItemCount > 0) then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      AModel := (FModel as PUMLEnumeration).Literals[0];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, 0);
      Exit;
    end;
  end else begin
    AttrCompart := (FView as PUMLClassifierView).AttributeCompartment;
    if (AttrCompart.Visible) and (AttrCompart.CompartmentItemCount > 0) then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      AModel := (FModel as PUMLClassifier).Attributes[0];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, 0);
      Exit;
    end;
  end;
  { Operation }
  if FView is PUMLEnumerationView then
    OpCompart := (FView as PUMLEnumerationView).OperationCompartment
  else OpCompart := (FView as PUMLClassifierView).OperationCompartment;
  if (OpCompart.Visible) and (OpCompart.CompartmentItemCount > 0) then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    AModel := (FModel as PUMLClassifier).Operations[0];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, 0);
  end;
end;

// PClassifierQuickDialog
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAssociationEndQuickDialog

procedure PAssociationEndQuickDialog.AfterConstructionProc;
begin
  RightPanel.Visible := False;
  LeftButton1.Parent := BasePanel;
  LeftButton2.Parent := BasePanel;
  LeftButton2.Parent := BasePanel;
  NameEdit.Parent := BasePanel;
  ComboBox.Parent := BasePanel;
  LeftPanel.Visible := False;
  MiddlePanel.Visible := False;
  { Size }
  NameEdit.Width := NAME_EDIT_DEFAULT_WIDTH;
  NameEdit.Height := NAME_EDIT_DEFAULT_HEIGHT;
  ComboBox.Width := COMBO_BOX_DEFAULT_WIDTH;
  BasePanel.Width := (BUTTON_WIDTH * 2) + NameEdit.Width + ComboBox.Width + (BUTTON_MARGIN * 4);
  BasePanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 4);
  Self.Width := BasePanel.Width * 2;
  Self.Height := BasePanel.Height * 2;
  { Position }
  BasePanel.Left := 0;
  BasePanel.Top := 0;
  LeftButton1.Left := BUTTON_MARGIN;
  LeftButton1.Top := BUTTON_MARGIN;
  LeftButton2.Left := LeftButton1.Left + LeftButton1.Width;
  LeftButton2.Top := BUTTON_MARGIN;
  NameEdit.Left := LeftButton2.Left + LeftButton2.Width;
  NameEdit.Top := BUTTON_MARGIN;
  ComboBox.Left := NameEdit.Left + NameEdit.Width;
  ComboBox.Top := BUTTON_MARGIN;
end;

procedure PAssociationEndQuickDialog.SetComponentsSizeAndPosition;
begin
  Left := ClientOrigin.X + MousePos.X;
  Top := ClientOrigin.Y + MousePos.Y;
end;

procedure PAssociationEndQuickDialog.SetQuickDialogData;
begin
  inherited;
  SetAggregationData;
  SetNavigableData;
  SetMultiplicityData;
end;

procedure PAssociationEndQuickDialog.Initialize;
begin
  inherited;
  ComboBox.Text := '';
  LeftButton1.Glyph := nil;
  LeftButton1.Hint := 'AggregationKind & Navigability';
  ComboBox.Hint := 'Multiplicity';
end;

procedure PAssociationEndQuickDialog.SetAggregationData;
begin
  FAggregationKind := (FModel as PUMLAssociationEnd).Aggregation;
  case FAggregationKind of
    akNone: QuickDialogImages.GetBitmap(4, LeftButton1.Glyph);
    akAggregate: QuickDialogImages.GetBitmap(5, LeftButton1.Glyph);
    akComposite: QuickDialogImages.GetBitmap(6, LeftButton1.Glyph);
  end;
end;

procedure PAssociationEndQuickDialog.SetNavigableData;
begin
  FIsNavigable := (FModel as PUMLAssociationEnd).IsNavigable;
  Navigable.Down := FIsNavigable;
end;

procedure PAssociationEndQuickDialog.SetMultiplicityData;
begin
  FMultiplicity := (FModel as PUMLAssociationEnd).Multiplicity;
  ComboBox.Text := FMultiplicity;
end;

procedure PAssociationEndQuickDialog.LeftButton1ClickHandler(Sender: TObject);
var
  L, T: Integer;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  CheckAndApplyMultiplicityStrChanging;
  VisibilityGroupHandle.Visible := False;
  AssociationGroupHandle.Visible := True;
  // Popup Aggregation Kind Menu
  L := Left + LeftButton1.Left;
  T := Top + BasePanel.Top + BasePanel.Height;
  QuickDialogPopupHandle.Popup(L, T);
end;

procedure PAssociationEndQuickDialog.LeftButton2ClickHandler(Sender: TObject);
begin
  CheckAndApplyMultiplicityStrChanging;
  inherited;
end;

procedure PAssociationEndQuickDialog.NameEditKeyUpHandler(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  NameEdit.ReadOnly := False;
  if not FKeyUpOnly then begin  // Key up only(if error message window is closed) is not executed
    if (Key = VK_ESCAPE) or (Key = VK_RETURN)
    then FormHidingProc(Key, Shift);
  end;
  FKeyUpOnly := True;
end;

procedure PAssociationEndQuickDialog.NameEditEnterHandler(Sender: TObject);
begin
  CheckAndApplyMultiplicityStrChanging;
end;

procedure PAssociationEndQuickDialog.ComboBoxEnterHandler(Sender: TObject);
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
end;

procedure PAssociationEndQuickDialog.ComboBoxClickHandler(Sender: TObject);
begin
  CheckAndApplyMultiplicityStrChanging;
end;

procedure PAssociationEndQuickDialog.ComboBoxKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) or (Key = VK_RETURN)
  then FormHidingProc(Key, Shift);
end;

procedure PAssociationEndQuickDialog.AssociationKindMenuItemClicked(Sender: TObject);
var
  Idx: Integer;
  Kind: PUMLAggregationKind;
begin
  Idx := AssociationGroupHandle.IndexInGroup(Sender as TComponent);
  if Idx >= 0 then begin
    Kind := PUMLAggregationKind(Idx);
    if FAggregationKind <> Kind then begin
      LeftButton1.Glyph := nil;
      FManager.AggregationKindChangingHandler(FModel, Kind);
      SetAggregationData;
    end;
  end;
end;

procedure PAssociationEndQuickDialog.AssociationNavigableMenuItemClicked(Sender: TObject);
begin
  if FIsNavigable <> Navigable.Down then begin
    FManager.NavigableChanging(FModel, Navigable.Down);
    SetNavigableData;
  end;
end;

procedure PAssociationEndQuickDialog.CheckAndApplyMultiplicityStrChanging;
var
  Str: string;
begin
  Str := Trim(ComboBox.Text);
  if Trim(FMultiplicity) <> Str then begin
    FManager.MultiplicityChangingHandler(FModel, Str);
    FMultiplicity := Str;
  end;
end;

procedure PAssociationEndQuickDialog.HidingWithReturnKey;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  CheckAndApplyMultiplicityStrChanging;
  Self.Close;
end;

// PAssociationEndQuickDialog
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// PStateQuickDialog

procedure PStateQuickDialog.AfterConstructionProc;
begin
  LeftButton1.Visible := False;
  ComboBox.Visible := False;
  RightButton4.Visible := False;
  LeftPanel.Parent := Self;
  MiddlePanel.Parent := Self;
  RightPanel.Parent := Self;
  BasePanel.Visible := False;
  NameEdit.Alignment := taCenter;
  { Size }
  LeftPanel.Width := BUTTON_WIDTH + (BUTTON_MARGIN * 2);
  LeftPanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 2);
  RightPanel.Width := (BUTTON_WIDTH * 3) + (BUTTON_MARGIN * 2);
  RightPanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 2);
  { Position }
  LeftPanel.Left := 0;
  LeftPanel.Top := 0;
  LeftButton2.Left := 0;
  LeftButton2.Top := 0;
  MiddlePanel.Left := LeftPanel.Width;
  MiddlePanel.Top := 0;
  NameEdit.Left := BUTTON_MARGIN;
  NameEdit.Top := BUTTON_MARGIN;
  RightPanel.Top := 0;
  RightButton1.Left := 0;
  RightButton1.Top := 0;
  RightButton2.Left := BUTTON_WIDTH;
  RightButton2.Top := 0;
  RightButton3.Left := BUTTON_WIDTH * 2;
  RightButton3.Top := 0;
end;

procedure PStateQuickDialog.SetComponentsSizeAndPosition;
var
  ADiagram: PDiagramView;
  NodeView: PUMLGeneralNodeView;
  NameCompart: PUMLNameCompartmentView;
  ZRate: Real;
begin
  ADiagram := GetOwnerDiagramView(FView);
  ZRate := GetZoomRate(ADiagram.Canvas.ZoomFactor);
  NodeView := FView as PUMLGeneralNodeView;
  NameCompart := NodeView.NameCompartment;
  { Size }
  NameEdit.Width := Trunc((NodeView.Right - NodeView.Left) * ZRate - 3);
  NameEdit.Height := Trunc(NameCompart.Height * ZRate);
  MiddlePanel.Width := NameEdit.Width + (BUTTON_MARGIN * 2);
  MiddlePanel.Height := NameEdit.Height + (BUTTON_MARGIN * 2);
  Self.Width := (LeftPanel.Width + MiddlePanel.Width + RightPanel.Width) * 2;
  Self.Height := Max(LeftPanel.Height, MiddlePanel.Height) * 2;
  { Position }
  RightPanel.Left := LeftPanel.Width + MiddlePanel.Width;
  Left := ClientOrigin.X + Trunc(NameCompart.Left * ZRate) + 1;
  Left := Left - LeftPanel.Width;
  Top := ClientOrigin.Y + Trunc(NameCompart.Top * ZRate);
end;

procedure PStateQuickDialog.Initialize;
begin
  NameEdit.Clear;
  NameEdit.ReadOnly := False;
  FOriginalString := '';
  //NameEdit.Color := FView.FillColor;
  LeftButton2.Glyph := nil;
  LeftButton2.Hint := 'Visibility';
  NameEdit.Hint := STATE_HINT;//'<<stereotype>> name';
  RightButton1.Glyph := nil;
  RightButton2.Glyph := nil;
  RightButton3.Glyph := nil;
  QuickDialogImages.GetBitmap(10, RightButton1.Glyph);
  QuickDialogImages.GetBitmap(11, RightButton2.Glyph);
  QuickDialogImages.GetBitmap(12, RightButton3.Glyph);
  RightButton1.Hint := TXT_ADD_ENTRY_ACTION;
  RightButton2.Hint := TXT_ADD_DO_ACTION;
  RightButton3.Hint := TXT_ADD_EXIT_ACTION;
end;

procedure PStateQuickDialog.RightButton1ClickHandler(Sender: TObject);
var
  Idx: Integer;
  AModel: PModel;
  InternalCompart: PUMLInternalTransitionCompartmentView;
begin
  { add EntryAction }
  InternalCompart := (FView as PUMLCustomStateView).InternalTransitionCompartment;
  if InternalCompart.Visible then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    FManager.ModelCreatingHandler(FModel, 'UninterpretedAction', 0);
    Idx := (FModel as PUMLCompositeState).EntryActionCount - 1;
    AModel := (FModel as PUMLCompositeState).EntryActions[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
  end else begin
    FManager.ModelCreatingHandler(FModel, 'UninterpretedAction', 0);
  end;
end;

procedure PStateQuickDialog.RightButton2ClickHandler(Sender: TObject);
var
  Idx: Integer;
  AModel: PModel;
  InternalCompart: PUMLInternalTransitionCompartmentView;
begin
  { add EntryAction }
  InternalCompart := (FView as PUMLCustomStateView).InternalTransitionCompartment;
  if InternalCompart.Visible then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    FManager.ModelCreatingHandler(FModel, 'UninterpretedAction', 1);
    Idx := (FModel as PUMLCompositeState).DoActivityCount - 1;
    AModel := (FModel as PUMLCompositeState).DoActivities[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
  end else begin
    FManager.ModelCreatingHandler(FModel, 'UninterpretedAction', 1);
  end;
end;

procedure PStateQuickDialog.RightButton3ClickHandler(Sender: TObject);
var
  Idx: Integer;
  AModel: PModel;
  InternalCompart: PUMLInternalTransitionCompartmentView;
begin
  { add EntryAction }
  InternalCompart := (FView as PUMLCustomStateView).InternalTransitionCompartment;
  if InternalCompart.Visible then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    FManager.ModelCreatingHandler(FModel, 'UninterpretedAction', 2);
    Idx := (FModel as PUMLCompositeState).ExitActionCount - 1;
    AModel := (FModel as PUMLCompositeState).ExitActions[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
  end else begin
    FManager.ModelCreatingHandler(FModel, 'UninterpretedAction', 2);
  end;
end;

procedure PStateQuickDialog.HidingWithDownArrowKey;
var
  AModel: PModel;
  InternalCompart: PUMLInternalTransitionCompartmentView;
begin
  InternalCompart := (FView as PUMLCustomStateView).InternalTransitionCompartment;
  if (InternalCompart.Visible) and (InternalCompart.CompartmentItemCount > 0) then begin
    if (FModel as PUMLCompositeState).EntryActionCount > 0 then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      AModel := (FModel as PUMLCompositeState).EntryActions[0];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, 0);
    end else if (FModel as PUMLCompositeState).DoActivityCount > 0 then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      AModel := (FModel as PUMLCompositeState).DoActivities[0];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, 0);
    end else if (FModel as PUMLCompositeState).ExitActionCount > 0 then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      AModel := (FModel as PUMLCompositeState).ExitActions[0];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, 0);
    end;
  end;
end;

// PStateQuickDialog
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PFeatureQuickDialog

procedure PFeatureQuickDialog.SetAttributeNameEditData;
var
  AttrModel: PUMLAttribute;
  TypeStr: string;
  MultiStr: string;
  InitStr: string;
begin
  TypeStr := '';
  MultiStr := '';
  InitStr := '';

  AttrModel := FModel as PUMLAttribute;
  if Assigned(AttrModel.Type_) then TypeStr := Trim(AttrModel.Type_.Name)
  else TypeStr := Trim(AttrModel.TypeExpression);
  MultiStr := Trim(AttrModel.Multiplicity);
  InitStr := Trim(AttrModel.InitialValue);
  if TypeStr <> '' then FOriginalString := FOriginalString + ': ' + TypeStr;
  if MultiStr <> '' then begin
    FOriginalString := FOriginalString + '[' + MultiStr;
    if AttrModel.Ordering = okOrdered then FOriginalString := FOriginalString + ' ordered';
    FOriginalString := FOriginalString + ']';
  end;
  if InitStr <> '' then FOriginalString := FOriginalString + ' = ' + InitStr;
end;

procedure PFeatureQuickDialog.SetOperationNameEditData;
var
  OpModel: PUMLOperation;
  Param: PUMLParameter;
  ParamStr: string;
  IsReturn: Boolean;
  RetStr: string;
  I: Integer;
begin
  ParamStr := '';
  RetStr := '';
  IsReturn := False;

  OpModel := FModel as PUMLOperation;
  for I := 0 to OpModel.ParameterCount - 1 do begin
    Param := OpModel.Parameters[I];
    if (IsReturn = False) and (Param.DirectionKind = pdkReturn) then begin
      IsReturn := True;
      if Assigned(Param.Type_) then RetStr := Param.Type_.Name
      else RetStr := Param.TypeExpression;
    end else begin
      if ParamStr <> '' then ParamStr := ParamStr + ', ';
      case Param.DirectionKind of
        pdkIn: {do nothing};
        pdkOut: ParamStr := ParamStr + 'out ';
        pdkInout: ParamStr := ParamStr + 'inout ';
      end;
      ParamStr := ParamStr + Param.Name;
      if Assigned(Param.Type_) then ParamStr := ParamStr + ': ' + Param.Type_.Name
      else if Trim(Param.TypeExpression) <> '' then ParamStr := ParamStr + ': ' + Param.TypeExpression;
      if Trim(Param.DefaultValue) <> '' then ParamStr := ParamStr + ' = ' + Param.DefaultValue;
    end;
  end;
  FOriginalString := FOriginalString + '(' + ParamStr + ')';
  if RetStr <> '' then FOriginalString := FOriginalString + ': ' + RetStr;
end;

procedure PFeatureQuickDialog.AddAttribute;
var
  OwnerModel: PUMLClassifier;
  Idx: Integer;
  AModel: PModel;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  Self.Hide;
  OwnerModel := (FModel as PUMLAttribute).Owner;
  Idx := FCompartmentItemIndex + 1;
  FManager.ModelCreatingHandler(OwnerModel, 'Attribute', 0, Idx);
  AModel := OwnerModel.Attributes[Idx];
  FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
end;

procedure PFeatureQuickDialog.AddOperation;
var
  OwnerModel: PUMLClassifier;
  Idx: Integer;
  AModel: PModel;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  Self.Hide;
  OwnerModel := (FModel as PUMLOperation).Owner;
  Idx := FCompartmentItemIndex + 1;
  FManager.ModelCreatingHandler(OwnerModel, 'Operation', 0, Idx);
  AModel := OwnerModel.Operations[Idx];
  FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
end;

procedure PFeatureQuickDialog.AddLiteral;
var
  OwnerModel: PUMLEnumeration;
  Idx: Integer;
  AModel: PModel;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  Self.Hide;
  OwnerModel := (FModel as PUMLEnumerationLiteral).Enumeration;
  Idx := FCompartmentItemIndex + 1;
  FManager.ModelCreatingHandler(OwnerModel, 'EnumerationLiteral', 0, Idx);
  AModel := OwnerModel.Literals[Idx];
  FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
end;

procedure PFeatureQuickDialog.AddAction;
var
  OwnerModel: PUMLState;
  Idx: Integer;
  AModel: PModel;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  Self.Hide;
  OwnerModel := (FView as PUMLCustomStateView).Model as PUMLState;
  Idx := OwnerModel.IndexOfEntryAction(FModel as PUMLUninterpretedAction);
  if Idx >= 0 then begin
    Inc(Idx);
    FManager.ModelCreatingHandler(OwnerModel, 'UninterpretedAction', 0, Idx);
    AModel := OwnerModel.EntryActions[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
  Idx := OwnerModel.IndexOfDoActivity(FModel as PUMLUninterpretedAction);
  if Idx >= 0 then begin
    Inc(Idx);
    FManager.ModelCreatingHandler(OwnerModel, 'UninterpretedAction', 1, Idx);
    AModel := OwnerModel.DoActivities[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
  Idx := OwnerModel.IndexOfExitAction(FModel as PUMLUninterpretedAction);
  if Idx >= 0 then begin
    Inc(Idx);
    FManager.ModelCreatingHandler(OwnerModel, 'UninterpretedAction', 2, Idx);
    AModel := OwnerModel.ExitActions[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
end;

procedure PFeatureQuickDialog.InsertAttribute;
var
  OwnerModel: PUMLClassifier;
  Idx: Integer;
  AModel: PModel;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  Self.Hide;
  OwnerModel := (FModel as PUMLAttribute).Owner;
  Idx := FCompartmentItemIndex;
  FManager.ModelCreatingHandler(OwnerModel, 'Attribute', 0, Idx);
  AModel := OwnerModel.Attributes[Idx];
  FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
end;

procedure PFeatureQuickDialog.InsertOperation;
var
  OwnerModel: PUMLClassifier;
  Idx: Integer;
  AModel: PModel;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  Self.Hide;
  OwnerModel := (FModel as PUMLOperation).Owner;
  Idx := FCompartmentItemIndex;
  FManager.ModelCreatingHandler(OwnerModel, 'Operation', 0, Idx);
  AModel := OwnerModel.Operations[Idx];
  FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
end;

procedure PFeatureQuickDialog.InsertLiteral;
var
  OwnerModel: PUMLEnumeration;
  Idx: Integer;
  AModel: PModel;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  Self.Hide;
  OwnerModel := (FModel as PUMLEnumerationLiteral).Enumeration;
  Idx := FCompartmentItemIndex;
  FManager.ModelCreatingHandler(OwnerModel, 'EnumerationLiteral', 0, Idx);
  AModel := OwnerModel.Literals[idx];
  FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
end;

procedure PFeatureQuickDialog.InsertAction;
var
  OwnerModel: PUMLState;
  Idx: Integer;
  AModel: PModel;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  Self.Hide;
  OwnerModel := (FView as PUMLCustomStateView).Model as PUMLState;
  Idx := OwnerModel.IndexOfEntryAction(FModel as PUMLUninterpretedAction);
  if Idx >= 0 then begin
    FManager.ModelCreatingHandler(OwnerModel, 'UninterpretedAction', 0, Idx);
    AModel := OwnerModel.EntryActions[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
  Idx := OwnerModel.IndexOfDoActivity(FModel as PUMLUninterpretedAction);
  if Idx >= 0 then begin
    FManager.ModelCreatingHandler(OwnerModel, 'UninterpretedAction', 1, Idx);
    AModel := OwnerModel.DoActivities[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
  Idx := OwnerModel.IndexOfExitAction(FModel as PUMLUninterpretedAction);
  if Idx >= 0 then begin
    FManager.ModelCreatingHandler(OwnerModel, 'UninterpretedAction', 2, Idx);
    AModel := OwnerModel.ExitActions[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
end;

procedure PFeatureQuickDialog.RemoveAttribute;
var
  OwnerModel: PUMLClassifier;
  Idx: Integer;
  AModel: PModel;
  OpCompart: PUMLOperationCompartmentView;
begin
  Self.Hide;
  OwnerModel := (FModel as PUMLAttribute).Owner;
  FManager.ElementDeletingHandler(FModel);
  Idx := FCompartmentItemIndex;
  if Idx < OwnerModel.AttributeCount then begin
    AModel := OwnerModel.Attributes[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
  OpCompart := (FView as PUMLClassifierView).OperationCompartment;
  if (OpCompart.Visible) and (OpCompart.CompartmentItemCount > 0) then begin
    Idx := 0;
    AModel := OwnerModel.Operations[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
  if Idx > 0 then begin
    Dec(Idx);
    AModel := OwnerModel.Attributes[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
  FManager.ShowAnotherQuickDialog(Self, PClassifierQuickDialog, FView, OwnerModel);
end;

procedure PFeatureQuickDialog.RemoveOperation;
var
  OwnerModel: PUMLClassifier;
  Idx: Integer;
  AModel: PModel;
  LiteralCompart: PUMLEnumerationLiteralCompartmentView;
  AttrCompart: PUMLAttributeCompartmentView;
begin
  Self.Hide;
  OwnerModel := (FModel as PUMLOperation).Owner;
  FManager.ElementDeletingHandler(FModel);
  Idx := FCompartmentItemIndex;
  if Idx < OwnerModel.OperationCount then begin
    AModel := OwnerModel.Operations[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
  if Idx > 0 then begin
    Dec(Idx);
    AModel := OwnerModel.Operations[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
  if FView is PUMLEnumerationView then begin
    LiteralCompart := (FView as PUMLEnumerationView).EnumerationLiteralCompartment;
    if (LiteralCompart.Visible) and (LiteralCompart.CompartmentItemCount > 0) then begin
      Idx := LiteralCompart.CompartmentItemCount - 1;
      AModel := (OwnerModel as PUMLEnumeration).Literals[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
      Exit;
    end;
  end else if FView is PUMLClassifierView then begin
    AttrCompart := (FView as PUMLClassifierView).AttributeCompartment;
    if (AttrCompart.Visible) and (AttrCompart.CompartmentItemCount > 0) then begin
      Idx := AttrCompart.CompartmentItemCount - 1;
      AModel := OwnerModel.Attributes[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
      Exit;
    end;
  end;
  FManager.ShowAnotherQuickDialog(Self, PClassifierQuickDialog, FView, OwnerModel);
end;

procedure PFeatureQuickDialog.RemoveLiteral;
var
  OwnerModel: PUMLEnumeration;
  Idx: Integer;
  AModel: PModel;
  OpCompart: PUMLOperationCompartmentView;
begin
  Self.Hide;
  OwnerModel := (FModel as PUMLEnumerationLiteral).Enumeration;
  FManager.ElementDeletingHandler(FModel);
  Idx := FCompartmentItemIndex;
  if Idx < OwnerModel.LiteralCount then begin
    AModel := OwnerModel.Literals[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
  OpCompart := (FView as PUMLEnumerationView).OperationCompartment;
  if (OpCompart.Visible) and (OpCompart.CompartmentItemCount > 0) then begin
    Idx := 0;
    AModel := OwnerModel.Operations[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
  if Idx > 0 then begin
    Dec(Idx);
    AModel := OwnerModel.Literals[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    Exit;
  end;
  FManager.ShowAnotherQuickDialog(Self, PClassifierQuickDialog, FView, OwnerModel);
end;

procedure PFeatureQuickDialog.RemoveAction;
var
  OwnerModel: PUMLState;
  Idx: Integer;
  AModel: PModel;
  EntryCount, DoCount, ExitCount: Integer;
  Kind: QuickDlgActionKind;
begin
  Self.Hide;
  OwnerModel := (FView as PUMLCustomStateView).Model as PUMLState;
  Kind := GetActionKind(OwnerModel, FModel as PUMLAction, Idx);

  FManager.ElementDeletingHandler(FModel);
  EntryCount := OwnerModel.EntryActionCount;
  DoCount := OwnerModel.DoActivityCount;
  ExitCount := OwnerModel.ExitActionCount;
  if Kind = qdlgEntry then begin
    if Idx < EntryCount then begin
      AModel := OwnerModel.EntryActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
      Exit;
    end else if DoCount > 0 then begin
      AModel := OwnerModel.DoActivities[0];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, EntryCount);
      Exit;
    end else if ExitCount > 0 then begin
      AModel := OwnerModel.ExitActions[0];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, EntryCount);
      Exit;
    end else if Idx > 0 then begin
      Dec(Idx);
      AModel := OwnerModel.EntryActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
      Exit;
    end;
  end;
  if Kind = qdlgDo then begin
    if Idx < DoCount then begin
      AModel := OwnerModel.DoActivities[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, EntryCount + Idx);
      Exit;
    end else if ExitCount > 0 then begin
      AModel := OwnerModel.ExitActions[0];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, EntryCount + DoCount);
      Exit;
    end else if DoCount > 0 then begin
      Dec(Idx);
      AModel := OwnerModel.DoActivities[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, EntryCount + Idx);
      Exit;
    end else if EntryCount > 0 then begin
      Idx := EntryCount - 1;
      AModel := OwnerModel.EntryActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
      Exit;
    end;
  end;
  if Kind = qdlgExit then begin
    if Idx < ExitCount then begin
      AModel := OwnerModel.ExitActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, EntryCount + DoCount + Idx);
      Exit;
    end else if ExitCount > 0 then begin
      Dec(Idx);
      AModel := OwnerModel.ExitActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, EntryCount + DoCount + Idx);
      Exit;
    end else if DoCount > 0 then begin
      Idx := DoCount - 1;
      AModel := OwnerModel.DoActivities[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, EntryCount + Idx);
      Exit;
    end else if EntryCount > 0 then begin
      Idx := EntryCount - 1;
      AModel := OwnerModel.EntryActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
      Exit;
    end;
  end;
  FManager.ShowAnotherQuickDialog(Self, PStateQuickDialog, FView, OwnerModel);
end;

procedure PFeatureQuickDialog.ShiftUpAttribute;
var
  OwnerModel: PUMLClassifier;
  Idx: Integer;
begin
  OwnerModel := (FModel as PUMLAttribute).Owner;
  Idx := FCompartmentItemIndex;
  if Idx > 0 then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    Dec(Idx);
    FManager.OrderChangingHandler(OwnerModel, FModel, 'Attributes', Idx);
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, FModel, Idx);
  end;
end;

procedure PFeatureQuickDialog.ShiftUpOperation;
var
  OwnerModel: PUMLClassifier;
  Idx: Integer;
begin
  OwnerModel := (FModel as PUMLOperation).Owner;
  Idx := FCompartmentItemIndex;
  if Idx > 0 then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    Dec(Idx);
    FManager.OrderChangingHandler(OwnerModel, FModel, 'Operations', Idx);
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, FModel, Idx);
  end;
end;

procedure PFeatureQuickDialog.ShiftUpLiteral;
var
  OwnerModel: PUMLEnumeration;
  Idx: Integer;
begin
  OwnerModel := (FModel as PUMLEnumerationLiteral).Enumeration;
  Idx := FCompartmentItemIndex;
  if Idx > 0 then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    Dec(Idx);
    FManager.OrderChangingHandler(OwnerModel, FModel, 'Literals', Idx);
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, FModel, Idx);
  end;
end;

procedure PFeatureQuickDialog.ShiftUpAction;
var
  OwnerModel: PUMLState;
  Idx: Integer;
  Kind: QuickDlgActionKind;
begin
  OwnerModel := (FView as PUMLCustomStateView).Model as PUMLState;
  Kind := GetActionKind(OwnerModel, FModel as PUMLAction, Idx);
  if Idx > 0 then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    if Kind = qdlgEntry then begin
      Dec(Idx);
      FManager.OrderChangingHandler(OwnerModel, FModel, 'EntryActions', Idx);
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, FModel, Idx);
    end else if Kind = qdlgDo then begin
      Dec(Idx);
      FManager.OrderChangingHandler(OwnerModel, FModel, 'DoActivities', Idx);
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, FModel, Idx);
    end else if Kind =qdlgExit then begin
      Dec(Idx);
      FManager.OrderChangingHandler(OwnerModel, FModel, 'ExitActions', Idx);
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, FModel, Idx);
    end;
  end;
end;

procedure PFeatureQuickDialog.ShiftDownAttribute;
var
  OwnerModel: PUMLClassifier;
  Idx: Integer;
begin
  OwnerModel := (FModel as PUMLAttribute).Owner;
  Idx := FCompartmentItemIndex;
  if Idx < OwnerModel.AttributeCount - 1 then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    FManager.OrderChangingHandler(OwnerModel, FModel, 'Attributes', Idx + 1);
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, FModel, Idx + 1);
  end;
end;

procedure PFeatureQuickDialog.ShiftDownOperation;
var
  OwnerModel: PUMLClassifier;
  Idx: Integer;
begin
  OwnerModel := (FModel as PUMLOperation).Owner;
  Idx := FCompartmentItemIndex;
  if Idx < OwnerModel.OperationCount - 1 then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    FManager.OrderChangingHandler(OwnerModel, FModel, 'Operations', Idx + 1);
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, FModel, Idx + 1);
  end;
end;

procedure PFeatureQuickDialog.ShiftDownLiteral;
var
  OwnerModel: PUMLEnumeration;
  Idx: Integer;
begin
  OwnerModel := (FModel as PUMLEnumerationLiteral).Enumeration;
  Idx := FCompartmentItemIndex;
  if Idx < OwnerModel.LiteralCount - 1 then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    FManager.OrderChangingHandler(OwnerModel, FModel, 'Literals', Idx + 1);
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, FModel, Idx + 1);
  end;
end;

procedure PFeatureQuickDialog.ShiftDownAction;
var
  OwnerModel: PUMLState;
  Idx: Integer;
  EntryCount, DoCount, ExitCount: Integer;
  Kind: QuickDlgActionKind;
begin
  OwnerModel := (FView as PUMLCustomStateView).Model as PUMLState;
  Kind := GetActionKind(OwnerModel, FModel as PUMLAction, Idx);
  EntryCount := OwnerModel.EntryActionCount;
  DoCount := OwnerModel.DoActivityCount;
  ExitCount := OwnerModel.ExitActionCount;

  if Kind = qdlgEntry then begin
    if Idx < EntryCount - 1 then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      FManager.OrderChangingHandler(OwnerModel, FModel, 'EntryActions', Idx + 1);
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, FModel, Idx + 1);
    end;
  end else if Kind = qdlgDo then begin
    if Idx < DoCount - 1 then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      FManager.OrderChangingHandler(OwnerModel, FModel, 'DoActivities', Idx + 1);
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, FModel, Idx + 1);
    end;
  end else if Kind =qdlgExit then begin
    if Idx < ExitCount - 1 then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      FManager.OrderChangingHandler(OwnerModel, FModel, 'ExitActions', Idx + 1);
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, FModel, Idx + 1);
    end;
  end;
end;

procedure PFeatureQuickDialog.ShowUpperAttribute;
var
  OwnerModel: PUMLClassifier;
  AModel: PModel;
  Idx: Integer;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  Self.Hide;
  OwnerModel := (FModel as PUMLAttribute).Owner;
  Idx := FCompartmentItemIndex;
  if Idx > 0 then begin
    AModel := OwnerModel.Attributes[Idx - 1];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx - 1);
  end else begin
    FManager.ShowAnotherQuickDialog(Self, PClassifierQuickDialog, FView, OwnerModel);
  end;
end;

procedure PFeatureQuickDialog.ShowUpperOperation;
var
  OwnerModel: PUMLClassifier;
  AModel: PModel;
  Idx: Integer;
  LiteralCompart: PUMLEnumerationLiteralCompartmentView;
  AttrCompart: PUMLAttributeCompartmentView;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  Self.Hide;

  OwnerModel := (FModel as PUMLOperation).Owner;
  Idx := FCompartmentItemIndex;
  if Idx > 0 then begin
    AModel := OwnerModel.Operations[Idx -1];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx - 1);
    Exit;
  end;
  if FView is PUMLEnumerationView then begin
    LiteralCompart := (FView as PUMLEnumerationView).EnumerationLiteralCompartment;
    if (LiteralCompart.Visible) and (LiteralCompart.CompartmentItemCount > 0) then begin
      Idx := (OwnerModel as PUMLEnumeration).LiteralCount - 1;
      AModel := (OwnerModel as PUMLEnumeration).Literals[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
      Exit;
    end;
  end else if FView is PUMLClassifierView then begin
    AttrCompart := (FView as PUMLClassifierView).AttributeCompartment;
    if (AttrCompart.Visible) and (AttrCompart.CompartmentItemCount > 0) then begin
      Idx := OwnerModel.AttributeCount - 1;
      AModel := OwnerModel.Attributes[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
      Exit;
    end;
  end;
  if OwnerModel is PUMLSubsystem then
    FManager.ShowAnotherQuickDialog(Self, PSubsystemQuickDialog, FView, OwnerModel)
  else FManager.ShowAnotherQuickDialog(Self, PClassifierQuickDialog, FView, OwnerModel);
end;

procedure PFeatureQuickDialog.ShowUpperLiteral;
var
  OwnerModel: PUMLEnumeration;
  Idx: Integer;
  AModel: PModel;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  Self.Hide;

  OwnerModel := (FModel as PUMLEnumerationLiteral).Enumeration;
  Idx := FCompartmentItemIndex;
  if Idx > 0 then begin
    AModel := OwnerModel.Literals[Idx -1];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx - 1);
  end else begin
    FManager.ShowAnotherQuickDialog(Self, PClassifierQuickDialog, FView, OwnerModel);
  end;
end;

procedure PFeatureQuickDialog.ShowUpperAction;
var
  OwnerModel: PUMLState;
  Idx: Integer;
  AModel: PModel;
  Kind: QuickDlgActionKind;
  EntryCount, DoCount: Integer;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
  Self.Hide;

  OwnerModel := (FView as PUMLCustomStateView).Model as PUMLState;
  Kind := GetActionKind(OwnerModel, FModel as PUMLAction, Idx);
  EntryCount := OwnerModel.EntryActionCount;
  DoCount := OwnerModel.DoActivityCount;
  if Kind = qdlgEntry then begin
    if Idx > 0 then begin
      Dec(Idx);
      AModel := OwnerModel.EntryActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end else begin
      FManager.ShowAnotherQuickDialog(Self, PStateQuickDialog, FView, OwnerModel);
    end;
  end else if Kind = qdlgDo then begin
    if Idx > 0 then begin
      Dec(Idx);
      AModel := OwnerModel.DoActivities[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end else if EntryCount > 0 then begin
      Idx := EntryCount - 1;
      AModel := OwnerModel.EntryActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end else begin
      FManager.ShowAnotherQuickDialog(Self, PStateQuickDialog, FView, OwnerModel);
    end;
  end else if Kind =qdlgExit then begin
    if Idx > 0 then begin
      Dec(Idx);
      AModel := OwnerModel.ExitActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end else if DoCount > 0 then begin
      Idx := DoCount - 1;
      AModel := OwnerModel.DoActivities[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end else if EntryCount > 0 then begin
      Idx := EntryCount - 1;
      AModel := OwnerModel.EntryActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end else begin
      FManager.ShowAnotherQuickDialog(Self, PStateQuickDialog, FView, OwnerModel);
    end;
  end;
end;

procedure PFeatureQuickDialog.ShowLowerAttribute;
var
  OwnerModel: PUMLClassifier;
  OpCompart: PUMLOperationCompartmentView;
  AModel: PModel;
  Idx: Integer;
begin
  OwnerModel := (FModel as PUMLAttribute).Owner;
  Idx := FCompartmentItemIndex;
  if Idx < OwnerModel.AttributeCount - 1 then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    Inc(Idx);
    AModel := OwnerModel.Attributes[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
  end else begin
    OpCompart := (FView as PUMLClassifierView).OperationCompartment;
    if (OpCompart.Visible) and (OpCompart.CompartmentItemCount > 0) then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      Idx := 0;
      AModel := OwnerModel.Operations[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end;
  end;
end;

procedure PFeatureQuickDialog.ShowLowerOperation;
var
  OwnerModel: PUMLClassifier;
  AModel: PModel;
  Idx: Integer;
begin
  OwnerModel := (FModel as PUMLOperation).Owner;
  Idx := FCompartmentItemIndex;
  if Idx < OwnerModel.OperationCount - 1 then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    Inc(Idx);
    AModel := OwnerModel.Operations[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
  end;
end;

procedure PFeatureQuickDialog.ShowLowerLiteral;
var
  OwnerModel: PUMLEnumeration;
  OpCompart: PUMLOperationCompartmentView;
  AModel: PModel;
  Idx: Integer;
begin
  OwnerModel := (FModel as PUMLEnumerationLiteral).Enumeration;
  Idx := FCompartmentItemIndex;
  if Idx < OwnerModel.LiteralCount - 1 then begin
    if not CheckAndApplyNameEditStrChanging then Exit;
    Self.Hide;
    Inc(Idx);
    AModel := OwnerModel.Literals[Idx];
    FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
  end else begin
    OpCompart := (FView as PUMLEnumerationView).OperationCompartment;
    if (OpCompart.Visible) and (OpCompart.CompartmentItemCount > 0) then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      Idx := 0;
      AModel := OwnerModel.Operations[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end;
  end;
end;

procedure PFeatureQuickDialog.ShowLowerAction;
var
  OwnerModel: PUMLState;
  Idx: Integer;
  AModel: PModel;
  Kind: QuickDlgActionKind;
  EntryCount, DoCount, ExitCount: Integer;
begin
  OwnerModel := (FView as PUMLCustomStateView).Model as PUMLState;
  Kind := GetActionKind(OwnerModel, FModel as PUMLAction, Idx);
  EntryCount := OwnerModel.EntryActionCount;
  DoCount := OwnerModel.DoActivityCount;
  ExitCount := OwnerModel.ExitActionCount;
  if Kind = qdlgEntry then begin
    if Idx < EntryCount - 1 then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      Inc(Idx);
      AModel := OwnerModel.EntryActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end else if DoCount > 0 then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      Idx := 0;
      AModel := OwnerModel.DoActivities[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end else if ExitCount > 0 then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      Idx := 0;
      AModel := OwnerModel.ExitActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end;
  end else if Kind = qdlgDo then begin
    if Idx < DoCount - 1 then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      Inc(Idx);
      AModel := OwnerModel.DoActivities[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end else if ExitCount > 0 then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      Idx := 0;
      AModel := OwnerModel.ExitActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end;
  end else if Kind =qdlgExit then begin
    if Idx < ExitCount - 1 then begin
      if not CheckAndApplyNameEditStrChanging then Exit;
      Self.Hide;
      Inc(Idx);
      AModel := OwnerModel.ExitActions[Idx];
      FManager.ShowAnotherQuickDialog(Self, PFeatureQuickDialog, FView, AModel, Idx);
    end;
  end;
end;

function PFeatureQuickDialog.GetActionKind(OwnerModel: PUMLState; AModel: PUMLAction; var Idx: Integer): QuickDlgActionKind;
begin
  Result := qdlgNone;
  Idx := OwnerModel.IndexOfEntryAction(AModel);
  if Idx >= 0 then Result := qdlgEntry
  else begin
    Idx := OwnerModel.IndexOfDoActivity(AModel);
    if Idx >= 0 then Result := qdlgDo
    else begin
      Idx := OwnerModel.IndexOfExitAction(AModel);
      if Idx >= 0 then Result := qdlgExit;
    end;
  end;
end;

procedure PFeatureQuickDialog.AfterConstructionProc;
begin
  LeftButton1.Visible := False;
  ComboBox.Visible := False;
  LeftPanel.Parent := Self;
  MiddlePanel.Parent := Self;
  RightPanel.Parent := Self;
  BasePanel.Visible := False;
  { Size }
  LeftPanel.Width := BUTTON_WIDTH + (BUTTON_MARGIN * 2);
  LeftPanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 2);
  RightPanel.Width := (BUTTON_WIDTH * 4) + (BUTTON_MARGIN * 2);
  RightPanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 2);
  { Position }
  LeftPanel.Left := 0;
  LeftPanel.Top := 0;
  LeftButton2.Left := 0;
  LeftButton2.Top := 0;
  MiddlePanel.Left := LeftPanel.Width;
  MiddlePanel.Top := 0;
  NameEdit.Left := BUTTON_MARGIN;
  NameEdit.Top := BUTTON_MARGIN;
  RightPanel.Top := 0;
  RightButton1.Left := 0;
  RightButton1.Top := 0;
  RightButton2.Left := BUTTON_WIDTH;
  RightButton2.Top := 0;
  RightButton3.Left := BUTTON_WIDTH * 2;
  RightButton3.Top := 0;
  RightButton4.Left := BUTTON_WIDTH * 3;
  RightButton4.Top := 0;
end;

procedure PFeatureQuickDialog.SetComponentsSizeAndPosition;
var
  ADiagram: PDiagramView;
  NodeView: PUMLGeneralNodeView;
  AttrCompart: PUMLAttributeCompartmentView;
  LiteralCompart: PUMLEnumerationLiteralCompartmentView;
  OpCompart: PUMLOperationCompartmentView;
  InternalCompart: PUMLInternalTransitionCompartmentView;
  ZRate: Real;
  Idx: Integer;
  Y, H: Integer;
  ARect: TRect;
  OwnerState: PUMLState;
  Kind: QuickDlgActionKind;
  EntryCount, DoCount: Integer;
begin
  ADiagram := GetOwnerDiagramView(FView);
  ZRate := GetZoomRate(ADiagram.Canvas.ZoomFactor);
  NodeView := FView as PUMLGeneralNodeView;
  Idx := FCompartmentItemIndex;
  if FModel is PUMLAttribute then begin
    AttrCompart := (FView as PUMLClassifierView).AttributeCompartment;
    ARect := AttrCompart.GetCompartmentItemBoundingBox(ADiagram.Canvas, Idx);
  end else if FModel is PUMLOperation then begin
    OpCompart := nil;
    if FView is PUMLClassifierView then
      OpCompart := (FView as PUMLClassifierView).OperationCompartment
    else if FView is PUMLEnumerationView then
      OpCompart := (FView as PUMLEnumerationView).OperationCompartment
    else if FView is PUMLSubsystemView then
      OpCompart := (FView as PUMLSubsystemView).OperationCompartment;
    if Assigned(OpCompart) then
      ARect := OpCompart.GetCompartmentItemBoundingBox(ADiagram.Canvas, Idx);
  end else if FModel is PUMLEnumerationLiteral then begin
    LiteralCompart := (FView as PUMLEnumerationView).EnumerationLiteralCompartment;
    ARect := LiteralCompart.GetCompartmentItemBoundingBox(ADiagram.Canvas, Idx)
  end else if FModel is PUMLUninterpretedAction then begin
    OwnerState := (FView as PUMLCustomStateView).Model as PUMLState;
    Kind := GetActionKind(OwnerState, FModel as PUMLAction, Idx);
    EntryCount := OwnerState.EntryActionCount;
    DoCount := OwnerState.DoActivityCount;
    if Kind = qdlgDo then Idx := Idx + EntryCount
    else if Kind = qdlgExit then Idx := Idx + EntryCount + DoCount;
    InternalCompart := (FView as PUMLCustomStateView).InternalTransitionCompartment;
    ARect := InternalCompart.GetCompartmentItemBoundingBox(ADiagram.Canvas, Idx);
  end;
  Y := ARect.Top;
  H := ARect.Bottom - ARect.Top + 4;
  { Size }
  NameEdit.Width := Trunc((NodeView.Right - NodeView.Left) * ZRate - 3);
  NameEdit.Height := Trunc(H * ZRate);
  MiddlePanel.Width := NameEdit.Width + (BUTTON_MARGIN * 2);
  MiddlePanel.Height := NameEdit.Height + (BUTTON_MARGIN * 2);
  Self.Width := (LeftPanel.Width + MiddlePanel.Width + RightPanel.Width) * 2;
  Self.Height := Max(LeftPanel.Height, MiddlePanel.Height) * 2;
  { Position }
  RightPanel.Left := LeftPanel.Width + MiddlePanel.Width;
  Left := ClientOrigin.X + Trunc(NodeView.Left * ZRate) + 1;
  Left := Left - LeftPanel.Width;
  Top := ClientOrigin.Y + Trunc(Y * ZRate);
end;

procedure PFeatureQuickDialog.Initialize;
begin
  NameEdit.Clear;
  NameEdit.ReadOnly := False;
  FOriginalString := '';
  //NameEdit.Color := FView.FillColor;
  LeftButton2.Glyph := nil;
  LeftButton2.Hint := 'Visibility';
  RightButton1.Glyph := nil;
  RightButton2.Glyph := nil;
  RightButton3.Glyph := nil;
  RightButton4.Glyph := nil;
  QuickDialogImages.GetBitmap(13, RightButton1.Glyph);
  QuickDialogImages.GetBitmap(14, RightButton2.Glyph);
  QuickDialogImages.GetBitmap(15, RightButton3.Glyph);
  QuickDialogImages.GetBitmap(16, RightButton4.Glyph);
  if FModel is PUMLAttribute then begin
    NameEdit.Hint := '<<stereotype>> name : type [multiplicity ordered] = initialValue';
    RightButton1.Hint := TXT_ADD_ATTRIBUTE;
    RightButton2.Hint := TXT_REMOVE_ATTRIBUTE;
    RightButton3.Hint := TXT_MOVE_UP;
    RightButton4.Hint := TXT_MOVE_DOWN;
  end else if FModel is PUMLOperation then begin
    NameEdit.Hint := '<<stereotype>> name (parameters) : returnType';
    RightButton1.Hint := TXT_ADD_OPERATION;
    RightButton2.Hint := TXT_REMOVE_OPERATION;
    RightButton3.Hint := TXT_MOVE_UP;
    RightButton4.Hint := TXT_MOVE_DOWN;
  end else if FModel is PUMLEnumerationLiteral then begin
    NameEdit.Hint := '<<stereotype>> name';
    RightButton1.Hint := TXT_ADD_LITERAL;
    RightButton2.Hint := TXT_REMOVE_LITERAL;
    RightButton3.Hint := TXT_MOVE_UP;
    RightButton4.Hint := TXT_MOVE_DOWN;
  end else if FModel is PUMLUninterpretedAction then begin
    NameEdit.Hint := '<<stereotype>> name';
    RightButton1.Hint := TXT_ADD_ACTION;
    RightButton2.Hint := TXT_REMOVE_REMOVE;
    RightButton3.Hint := TXT_MOVE_UP;
    RightButton4.Hint := TXT_MOVE_DOWN;
  end;
end;

procedure PFeatureQuickDialog.SetNameEditData;
begin
  inherited;
  if FModel is PUMLAttribute then
    SetAttributeNameEditData
  else if FModel is PUMLOperation then
    SetOperationNameEditData;

  //StarUMLApplication.SelectModel(FModel);

  //else if FModel is PUMLEnumerationLiteral then SetEnumerationLiteralNameEditData
  //else if FModel is PUMLUninterpretedAction then SetActionNameEditData;
end;

procedure PFeatureQuickDialog.RightButton1ClickHandler(Sender: TObject);
begin
  if FModel is PUMLAttribute then AddAttribute
  else if FModel is PUMLOperation then AddOperation
  else if FModel is PUMLEnumerationLiteral then AddLiteral
  else if FModel is PUMLUninterpretedAction then AddAction;
end;

procedure PFeatureQuickDialog.RightButton2ClickHandler(Sender: TObject);
begin
  if FModel is PUMLAttribute then RemoveAttribute
  else if FModel is PUMLOperation then RemoveOperation
  else if FModel is PUMLEnumerationLiteral then RemoveLiteral
  else if FModel is PUMLUninterpretedAction then RemoveAction;
end;

procedure PFeatureQuickDialog.RightButton3ClickHandler(Sender: TObject);
begin
  if FModel is PUMLAttribute then ShiftUpAttribute
  else if FModel is PUMLOperation then ShiftUpOperation
  else if FModel is PUMLEnumerationLiteral then ShiftUpLiteral
  else if FModel is PUMLUninterpretedAction then ShiftUpAction;
end;

procedure PFeatureQuickDialog.RightButton4ClickHandler(Sender: TObject);
begin
  if FModel is PUMLAttribute then ShiftDownAttribute
  else if FModel is PUMLOperation then ShiftDownOperation
  else if FModel is PUMLEnumerationLiteral then ShiftDownLiteral
  else if FModel is PUMLUninterpretedAction then ShiftDownAction;
end;

function PFeatureQuickDialog.CheckAndApplyNameEditStrChanging: Boolean;
var
  Str: string;
begin
  Result := True;
  if NameEdit.Modified then begin
    Str := Trim(NameEdit.Text);
    try
      if FModel is PUMLAttribute then FManager.AttributeExpApplying(FModel, Str)
      else if FModel is PUMLOperation then FManager.OperationExpApplying(FModel, Str)
      else FManager.GeneralNameExpApplying(FModel, Str);
    except on E: Exception do
      begin
        FShowedError := True;
        ShowMessagePos(E.Message, Self.Left, Self.Top);
        Result := False;
        Exit;
      end;
    end;
    NameEdit.Modified := False;
  end;
end;

procedure PFeatureQuickDialog.HidingWithCtrlReturnKey;
begin
  if FModel is PUMLAttribute then AddAttribute
  else if FModel is PUMLOperation then AddOperation
  else if FModel is PUMLEnumerationLiteral then AddLiteral
  else if FModel is PUMLUninterpretedAction then AddAction;
end;

procedure PFeatureQuickDialog.HidingWithUpArrowKey;
begin
  if FModel is PUMLAttribute then ShowUpperAttribute
  else if FModel is PUMLOperation then ShowUpperOperation
  else if FModel is PUMLEnumerationLiteral then ShowUpperLiteral
  else if FModel is PUMLUninterpretedAction then ShowUpperAction;
end;

procedure PFeatureQuickDialog.HidingWithCtrlUpArrowKey;
begin
  RightButton3ClickHandler(Self);
end;

procedure PFeatureQuickDialog.HidingWithDownArrowKey;
begin
  if FModel is PUMLAttribute then ShowLowerAttribute
  else if FModel is PUMLOperation then ShowLowerOperation
  else if FModel is PUMLEnumerationLiteral then ShowLowerLiteral
  else if FModel is PUMLUninterpretedAction then ShowLowerAction;
end;

procedure PFeatureQuickDialog.HidingWithCtrlDownArrowKey;
begin
  RightButton4ClickHandler(Self);
end;

procedure PFeatureQuickDialog.HidingWithInsertKey;
begin
  if FModel is PUMLAttribute then InsertAttribute
  else if FModel is PUMLOperation then InsertOperation
  else if FModel is PUMLEnumerationLiteral then InsertLiteral
  else if FModel is PUMLUninterpretedAction then InsertAction;
end;

procedure PFeatureQuickDialog.HidingWithCtrlDeleteKey;
begin
  RightButton2ClickHandler(Self);
end;

// PFeatureQuickDialog
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PMessageQuickDialog

procedure PMessageQuickDialog.AfterConstructionProc;
begin
  (*
  RightPanel.Visible := False;
  ComboBox.Visible := False;
  LeftButton1.Parent := BasePanel;
  LeftButton2.Parent := BasePanel;
  NameEdit.Parent := BasePanel;
  LeftPanel.Visible := False;
  MiddlePanel.Visible := False;
  { Size }
  NameEdit.Width := NAME_EDIT_DEFAULT_WIDTH;
  NameEdit.Height := NAME_EDIT_DEFAULT_HEIGHT;
  BasePanel.Width := (BUTTON_WIDTH * 2) + NameEdit.Width + (BUTTON_MARGIN * 4);
  BasePanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 4);
  Self.Width := BasePanel.Width * 2;
  Self.Height := BasePanel.Height * 2;
  { Position }
  BasePanel.Left := 0;
  BasePanel.Top := 0;
  LeftButton1.Left := BUTTON_MARGIN;
  LeftButton1.Top := BUTTON_MARGIN;
  LeftButton2.Left := LeftButton1.Left + LeftButton1.Width;
  LeftButton2.Top := BUTTON_MARGIN;
  NameEdit.Left := LeftButton2.Left + LeftButton2.Width;
  NameEdit.Top := BUTTON_MARGIN;
  *)
  ComboBox.Visible := False;
  RightButton2.Visible := False;
  RightButton3.Visible := False;
  RightButton4.Visible := False;
  LeftButton1.Parent := BasePanel;
  LeftButton2.Parent := BasePanel;
  NameEdit.Parent := BasePanel;
  RightButton1.Parent := BasePanel;
  LeftPanel.Visible := False;
  MiddlePanel.Visible := False;
  RightPanel.Visible := False;
  { Size }
  NameEdit.Width := NAME_EDIT_DEFAULT_WIDTH;
  NameEdit.Height := NAME_EDIT_DEFAULT_HEIGHT;
  BasePanel.Width := (BUTTON_WIDTH * 3) + NameEdit.Width + (BUTTON_MARGIN * 4);
  BasePanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 4);
  Self.Width := BasePanel.Width * 2;
  Self.Height := BasePanel.Height * 2;
  { Position }
  BasePanel.Left := 0;
  BasePanel.Top := 0;
  LeftButton1.Left := BUTTON_MARGIN;
  LeftButton1.Top := BUTTON_MARGIN;
  LeftButton2.Left := LeftButton1.Left + LeftButton1.Width;
  LeftButton2.Top := BUTTON_MARGIN;
  NameEdit.Left := LeftButton2.Left + LeftButton2.Width;
  NameEdit.Top := BUTTON_MARGIN;
  RightButton1.Left := NameEdit.Left + NameEdit.Width;
  RightButton1.Top := BUTTON_MARGIN;
end;

procedure PMessageQuickDialog.SetComponentsSizeAndPosition;
var
  ADiagram: PDiagramView;
  ZRate: Real;
  X, Y, C: Integer;
begin
  ADiagram := GetOwnerDiagramView(FView);
  ZRate := GetZoomRate(ADiagram.Canvas.ZoomFactor);
  X := MousePos.X;
  Y := MousePos.Y;
  if FView is PUMLCustomSeqMessageView then begin
    if Assigned ((FView as PUMLCustomSeqMessageView).NameLabel) then begin
      X := ((FView as PUMLCustomSeqMessageView).NameLabel).Left;
      Y := ((FView as PUMLCustomSeqMessageView).NameLabel).Top;
    end else begin
      C := (FView as PUMLCustomSeqMessageView).Points.Count;
      if C = 0 then Inc(C);
      X := ((FView as PUMLCustomSeqMessageView).Points.Points[0].X +
            (FView as PUMLCustomSeqMessageView).Points.Points[C - 1].X) div 2;
      Y := (FView as PUMLCustomSeqMessageView).Points.Points[0].Y;
      Y := Y - BasePanel.Height;
    end;
  end;
  Left := ClientOrigin.X + Trunc(X * ZRate);
  Top := ClientOrigin.Y + Trunc(Y * ZRate);
end;

function PMessageQuickDialog.GetActionModel(AModel: PModel): PUMLAction;
begin
  Result := nil;
  if AModel is PUMLMessage then Result := (AModel as PUMLMessage).Action
  else if AModel is PUMLStimulus then Result := (AModel as PUMLStimulus).Action;
end;

function PMessageQuickDialog.GetClassifierModel(AModel: PModel): PUMLClassifier;
var
  ARole: PUMLClassifierRole;
  AnIns: PUMLInstance;
begin
  Result := nil;
  if AModel is PUMLMessage then begin
    ARole := (AModel as PUMLMessage).Receiver;
    if Assigned(ARole) then Result := ARole.Base;
  end else if AModel is PUMLStimulus then begin
    AnIns := (AModel as PUMLStimulus).Receiver;
    if Assigned(AnIns) then Result := AnIns.Classifier;
  end;
end;

procedure PMessageQuickDialog.Initialize;
begin
  FOriginalString := '';
  NameEdit.Clear;
  LeftButton1.Glyph := nil;
  LeftButton2.Glyph := nil;
  RightButton1.Glyph := nil;
  QuickDialogImages.GetBitmap(20, LeftButton1.Glyph); 
  QuickDialogImages.GetBitmap(22, RightButton1.Glyph);
  FOperation := nil;
  FSignal := nil;
  FInstantiation := nil;
  LeftButton1.Hint := '';
  LeftButton2.Hint := 'Visibility';
  NameEdit.Hint := MESSAGE_HINT;//'<<stereotype>> *[iteration][condition] return := messageName(arguments)';
  //LeftButton1.Enabled := True;
end;

procedure PMessageQuickDialog.SetNameEditData;
var
  StereotypeStr, NameStr: string;
  IteStr, BranchStr, ArgStr, RetStr: string;
  AnAction: PUMLAction;
  AClassifier: PUMLClassifier;
  AMessage: PUMLMessage;
  AStimulus: PUMLStimulus;
begin
  StereotypeStr := '';
  NameStr := '';
  AnAction := GetActionModel(FModel);
  if Assigned(AnAction) then begin
    if AnAction is PUMLCallAction then begin
      FOperation := (AnAction as PUMLCallAction).Operation;
      if Assigned(FOperation) then NameStr := FOperation.Name;
      AClassifier := GetClassifierModel(FModel);
      //QuickDialogImages.GetBitmap(17, LeftButton1.Glyph); 
      if Assigned(AClassifier) then begin
        LeftButton1.Hint := TXT_CALL_ACTION_OPERATION;
        //LeftButton1.Enabled := True;
        RightButton1.Hint := TXT_ADD_OPERATION;
      end else begin
        LeftButton1.Hint := TXT_CALL_ACTION_OPERATION_WARN;
        //LeftButton1.Enabled := False;
        RightButton1.Hint := TXT_CALL_ACTION_OPERATION_WARN;
      end;
    end else if AnAction is PUMLSendAction then begin
      FSignal := (AnAction as PUMLSendAction).Signal;
      if Assigned(FSignal) then NameStr := FSignal.Name;
      //QuickDialogImages.GetBitmap(18, LeftButton1.Glyph);
      LeftButton1.Hint := TXT_SEND_ACTION_SIGNAL;
      RightButton1.Hint := TXT_CALL_ACTION_WARN;
    end else if AnAction is PUMLCreateAction then begin
      FInstantiation := (AnAction as PUMLCreateAction).Instantiation;
      if Assigned(FInstantiation) then NameStr := FInstantiation.Name;
      //QuickDialogImages.GetBitmap(19, LeftButton1.Glyph); 
      LeftButton1.Hint := TXT_CREATE_ACTION_INSTANTIATION;
      RightButton1.Hint := TXT_CALL_ACTION_WARN;
    end else begin
      //QuickDialogImages.GetBitmap(, LeftButton1.Glyph);
      LeftButton1.Hint := TXT_CREATE_ACTION_INSTANTIATION_WARN;
      //LeftButton1.Enabled := False;
      RightButton1.Hint := TXT_CALL_ACTION_WARN;
    end;
  end else begin
    //QuickDialogImages.GetBitmap(13, LeftButton1.Glyph);
    LeftButton1.Hint := TXT_ACTION_WARN;
    //LeftButton1.Enabled := False;
    RightButton1.Hint := TXT_ACTION_WARN;
  end;
  
  StereotypeStr := (FModel as PUMLModelElement).StereotypeName;
  if StereotypeStr <> '' then FOriginalString := '<<' + StereotypeStr + '>> ';
  if FModel is PUMLMessage then begin
    AMessage := FModel as PUMLMessage;
    if AMessage.Iteration <> '' then IteStr := '*[' + AMessage.Iteration + ']';
    if AMessage.Branch <> '' then BranchStr := '[' + AMessage.Branch + ']';
    if NameStr = '' then NameStr := AMessage.Name;
    if AMessage.Arguments <> '' then ArgStr := '(' + AMessage.Arguments + ')';
    if AMessage.Return <> '' then RetStr := AMessage.Return + ' := ';
  end else if FModel is PUMLStimulus then begin
    AStimulus := FModel as PUMLStimulus;
    if AStimulus.Iteration <> '' then IteStr := '*[' + AStimulus.Iteration + ']';
    if AStimulus.Branch <> '' then BranchStr := '[' + AStimulus.Branch + ']';
    if NameStr = '' then NameStr := AStimulus.Name;
    if AStimulus.Arguments <> '' then ArgStr := '(' + AStimulus.Arguments + ')';
    if AStimulus.Return <> '' then RetStr := AStimulus.Return + ' := ';
  end;
  // Formatting
  if NameStr = '' then begin
    RetStr := '';
    ArgStr := '';
  end;
  FOriginalString := FOriginalString + IteStr + BranchStr;
  if (IteStr <> '') or (BranchStr <> '') then FOriginalString := FOriginalString + ' ' + RetStr
  else FOriginalString := FOriginalString + RetStr;
  if (IteStr <> '') or (BranchStr <> '') then begin
    if RetStr <> '' then FOriginalString := FOriginalString + NameStr
    else FOriginalString := FOriginalString + ' ' + NameStr;
  end else FOriginalString := FOriginalString + NameStr;
  if (IteStr <> '') or (BranchStr <> '') then begin
    if (RetStr <> '') or (NameStr <> '') then FOriginalString := FOriginalString + ArgStr
    else FOriginalString := FOriginalString + ' ' + ArgStr;
  end else FOriginalString := FOriginalString + ArgStr;
end;

procedure PMessageQuickDialog.AssignNameEditValue;
begin
  NameEdit.Clear;
  if FOriginalString <> '' then begin
    NameEdit.Font.Name := FView.FontFace;
    //NameEdit.Font.Color := FView.FontColor;
    NameEdit.Font.Size := Self.Font.Size;
    NameEdit.Font.Style := FView.FontStyle;
    NameEdit.Text := FOriginalString;
  end;
end;

procedure PMessageQuickDialog.LeftButton1ClickHandler(Sender: TObject);
var
  AnAction: PUMLAction;
  AClassifier: PUMLClassifier;
  //AnOp: PUMLOperation;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;

  AnAction := GetActionModel(FModel);
  AClassifier := GetClassifierModel(FModel);
  if Assigned(AnAction) then begin
    // Operation
    if (AnAction is PUMLCallAction) and Assigned(AClassifier) then begin
      ElementListForm.ClearListElements;
      ElementListForm.AddListElementsByCollection(AClassifier, 'Operations', True);
      ElementListForm.AllowNull := True;
      ElementListForm.Left := Self.Left + BasePanel.Left + LeftButton1.Left;
      ElementListForm.Top := Self.Top + BasePanel.Top + BasePanel.Height;
      if ElementListForm.Execute(MSG_SELECT_OPERATION) then begin
        if ElementListForm.SelectedModel <> FOperation then begin
          if (ElementListForm.SelectedModel is PUMLOperation) or (ElementListForm.SelectedModel = nil) then begin
            FManager.OperationChangingHandler(GetActionModel(FModel), ElementListForm.SelectedModel as PUMLOperation);
            FOperation := ElementListForm.SelectedModel as PUMLOperation;
            SetQuickDialogData;
          end;
        end;
      end;
    // Signal
    end else if AnAction is PUMLSendAction then begin
      ElementSelectorForm.Filter(CLASSIFIER_FILTERINGSET);
      ElementSelectorForm.ClearSelectableModels;
      ElementSelectorForm.AddSelectableModel(PUMLSignal);
      ElementSelectorForm.AllowNull := True;
      ElementSelectorForm.Left := Self.Left + BasePanel.Left + LeftButton1.Left;
      ElementSelectorForm.Top := Self.Top + BasePanel.Top + BasePanel.Height;
      if ElementSelectorForm.Execute(MSG_SELECT_SIGNAL) then begin
        if ElementSelectorForm.SelectedModel <> FSignal then begin
          if (ElementSelectorForm.SelectedModel is PUMLSignal) or (ElementSelectorForm.SelectedModel = nil) then begin
            FManager.SignalChangingHandler(GetActionModel(FModel), ElementSelectorForm.SelectedModel as PUMLSignal);
            FSignal := ElementSelectorForm.SelectedModel as PUMLSignal;
            SetQuickDialogData;
          end;
        end;
      end;
    // Instantiation
    end else if AnAction is PUMLCreateAction then begin
      ElementSelectorForm.Filter(CLASSIFIER_FILTERINGSET);
      ElementSelectorForm.ClearSelectableModels;
      ElementSelectorForm.AddSelectableModels(CLASSIFIER_FILTERINGSET);
      ElementSelectorForm.AllowNull := True;
      ElementSelectorForm.Left := Self.Left + BasePanel.Left + LeftButton1.Left;
      ElementSelectorForm.Top := Self.Top + BasePanel.Top + BasePanel.Height;
      if ElementSelectorForm.Execute(MSG_SELECT_INSTANTIATION) then begin
        if ElementSelectorForm.SelectedModel <> FInstantiation then begin
          if (ElementSelectorForm.SelectedModel is PUMLClassifier) or (ElementSelectorForm.SelectedModel = nil) then begin
            FManager.InstantiationChangingHandler(GetActionModel(FModel), ElementSelectorForm.SelectedModel as PUMLClassifier);
            FInstantiation := ElementSelectorForm.SelectedModel as PUMLClassifier;
            SetQuickDialogData;
          end;
        end;
      end;
    end else begin
      // abnormal case
    end;
  end;
end;

procedure PMessageQuickDialog.RightButton1ClickHandler(Sender: TObject);
var
  NameStr: string;
  AnAction: PUMLAction;
  AClassifier: PUMLClassifier;
begin
  if not CheckAndApplyNameEditStrChanging then Exit;

  AnAction := GetActionModel(FModel);
  AClassifier := GetClassifierModel(FModel);
  if Assigned(AnAction) and (AnAction is PUMLCallAction) and Assigned(AClassifier) then
  begin
    NameStr := '';
    if QueryInput(TXT_INPUT_ELEM_NAME, TXT_INPUT_OPERATION_NAME, NameStr) and (NameStr <> '') then
    begin
      FManager.CallActionOperationCreatingHandler(AClassifier, AnAction as PUMLCallAction, NameStr);
      SetNameEditData;
      AssignNameEditValue;      
    end;
  end;
end;

function PMessageQuickDialog.CheckAndApplyNameEditStrChanging: Boolean;
var
  Str: string;
begin
  Result := True;
  Str := Trim(NameEdit.Text);
  if Trim(FOriginalString) <> Str then begin

    // if input text is short creattion syntax, execute short creation process
    if not ShortenSyntaxManager.Execute(FModel, Str) then begin
      // unless, execute below

      try
        FManager.MessageExpApplying(FModel, Str);
      except on E: Exception do
        begin
          FShowedError := True;
          ShowMessagePos(E.Message, Self.Left, Self.Top);
          Result := False;
          Exit;
        end;
      end;
      FOriginalString := Str;

    end;
  end;
end;

// PMessageQuickDialog
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PColMessageQuickDialog

procedure PColMessageQuickDialog.AfterConstructionProc;
begin
  inherited;
  ComboBox.Visible := True;
  ComboBox.Parent := BasePanel;
  { Size }
  ComboBox.Width := COMBO_BOX_DEFAULT_WIDTH;
  ComboBox.Height := NAME_EDIT_DEFAULT_HEIGHT;
  BasePanel.Width := (BUTTON_WIDTH * 3) + ComboBox.Width + NameEdit.Width + (BUTTON_MARGIN * 4);
  BasePanel.Height := BUTTON_HEIGHT + (BUTTON_MARGIN * 4);
  Self.Width := BasePanel.Width * 2;
  Self.Height := BasePanel.Height * 2;
  { Position }
  BasePanel.Left := 0;
  BasePanel.Top := 0;
  LeftButton1.Left := BUTTON_MARGIN;
  LeftButton1.Top := BUTTON_MARGIN;
  LeftButton2.Left := LeftButton1.Left + LeftButton1.Width;
  LeftButton2.Top := BUTTON_MARGIN;
  ComboBox.Left := LeftButton2.Left + LeftButton2.Width;
  ComboBox.Top := BUTTON_MARGIN;
  NameEdit.Left := ComboBox.Left + ComboBox.Width;
  NameEdit.Top := BUTTON_MARGIN;
  RightButton1.Left := NameEdit.Left + NameEdit.Width;
  RightButton1.Top := BUTTON_MARGIN;
end;

procedure PColMessageQuickDialog.SetComponentsSizeAndPosition;
var
  ADiagram: PDiagramView;
  ZRate: Real;
  X, Y: Integer;
begin
  ADiagram := GetOwnerDiagramView(FView);
  ZRate := GetZoomRate(ADiagram.Canvas.ZoomFactor);
  X := MousePos.X;
  Y := MousePos.Y;
  if FView is PUMLCustomColMessageView then begin
    X := (FView as PUMLCustomColMessageView).Left;
    Y := (FView as PUMLCustomColMessageView).Top;
    Y := Y - BasePanel.Height;
  end;
  Left := ClientOrigin.X + Trunc(X * ZRate);
  Top := ClientOrigin.Y + Trunc(Y * ZRate);
end;

procedure PColMessageQuickDialog.SetQuickDialogData;
begin
  inherited;
  SetSequenceNumber;
end;

procedure PColMessageQuickDialog.Initialize;
begin
  inherited;
  ComboBox.Text := '';
  ComboBox.Clear;
  ComboBox.Hint := 'Sequence Number';
end;

procedure PColMessageQuickDialog.SetSequenceNumber;
var
  ASet: PUMLInteractionInstanceSet;
  AInter: PUMLInteraction;
  C, I: Integer;
begin
  FSequenceNumber := -1;
  C := 0;
  if FModel is PUMLStimulus then begin
    ASet := (FModel as PUMLStimulus).InteractionInstanceSet;
    if Assigned(ASet) then begin
      C := ASet.MOF_GetCollectionCount('ParticipatingStimuli');
      FSequenceNumber := ASet.IndexOfParticipatingStimulus(FModel as PUMLStimulus) + 1;
    end;
  end else if FModel is PUMLMessage then begin
    AInter := (FModel as PUMLMessage).Interaction;
    if Assigned(AInter) then begin
      C := AInter.MessageCount;
      FSequenceNumber := AInter.IndexOfMessage(FModel as PUMLMessage) + 1;
    end;
  end;
  for I := 0 to C - 1 do ComboBox.Items.Add(IntToStr(I + 1));
  if FSequenceNumber > -1 then ComboBox.ItemIndex := FSequenceNumber - 1;
end;

procedure PColMessageQuickDialog.ComboBoxEnterHandler(Sender: TObject);
begin
  if not CheckAndApplyNameEditStrChanging then Exit;
end;

procedure PColMessageQuickDialog.ComboBoxClickHandler(Sender: TObject);
var
  Idx: Integer;
  AElem: PUMLModelElement;
begin
  Idx := ComboBox.ItemIndex;
  if Idx < 0 then Exit;
  Inc(Idx);
  if Idx <> FSequenceNumber then begin
    if FModel is PUMLStimulus then begin
      AElem := (FModel as PUMLStimulus).InteractionInstanceSet;
      FManager.SeqNumberChanging(AElem, FModel, 'ParticipatingStimuli', Idx - 1);
      FSequenceNumber := Idx;
    end else if FModel is PUMLMessage then begin
      AElem := (FModel as PUMLMessage).Interaction;
      FManager.SeqNumberChanging(AElem, FModel, 'Messages', Idx - 1);
      FSequenceNumber := Idx;
    end;
  end;
end;

procedure PColMessageQuickDialog.ComboBoxKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) or (Key = VK_RETURN) then FormHidingProc(Key, Shift);
end;

// PColMessageQuickDialog
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PNoteQuickDialog

function PNoteQuickDialog.GetEditTextWidth: Integer;
var
  I, L: Integer;
  OriginFont: TFont;
begin
  L := 0;
  OriginFont := Self.Canvas.Font;
  try
    Self.Canvas.Font := NameEdit.Font;
    for I := 0 to NameEdit.Lines.Count - 1 do begin
      L := Max(L, Self.Canvas.TextWidth(NameEdit.Lines.Strings[I]));
    end;
    Result := L;
  finally
    Self.Canvas.Font := OriginFont;
  end;
end;

procedure PNoteQuickDialog.AfterConstructionProc;
begin
  LeftPanel.Visible := False;
  RightPanel.Visible := False;
  MiddlePanel.Parent := Self;
  ComboBox.Visible := False;
  MiddlePanel.Visible := True;
  NameEdit.Visible := True;
  BasePanel.Visible := False;
  NameEdit.WantReturns := True;
  { Position }
  MiddlePanel.Left := 0;
  MiddlePanel.Top := 0;
  NameEdit.Left := BUTTON_MARGIN;
  NameEdit.Top := BUTTON_MARGIN;
end;

procedure PNoteQuickDialog.SetComponentsSizeAndPosition;
var
  ADiagram: PDiagramView;
  TextView: PUMLCustomTextView;
  ZRate: Real;
begin
  ADiagram := GetOwnerDiagramView(FView);
  ZRate := GetZoomRate(ADiagram.Canvas.ZoomFactor);
  TextView := FView as PUMLCustomTextView;
  { Size }
  NameEdit.Width := Trunc((TextView.Right - TextView.Left) * ZRate);
  NameEdit.Height := Trunc((TextView.Bottom - TextView.Top) * ZRate);
  MiddlePanel.Width := NameEdit.Width + (BUTTON_MARGIN * 2);
  MiddlePanel.Height := NameEdit.Height + (BUTTON_MARGIN * 2);
  Self.Width := MiddlePanel.Width * 2;
  Self.Height := MiddlePanel.Height * 2;
  { Position }
  Left := ClientOrigin.X + Trunc(TextView.Left * ZRate);
  Top := ClientOrigin.Y + Trunc(TextView.Top * ZRate);
end;

procedure PNoteQuickDialog.SetQuickDialogData;
begin
  Initialize;
  SetNameEditData;
  AssignNameEditValue;
end;

procedure PNoteQuickDialog.Initialize;
begin
  FOriginalString := '';
  NameEdit.Clear;
  //NameEdit.Color := FView.FillColor;
  NameEdit.Hint := 'text';
end;

procedure PNoteQuickDialog.SetNameEditData;
begin
  FOriginalString := TrimRight((FView as PUMLCustomTextView).Text);
end;

procedure PNoteQuickDialog.AssignNameEditValue;
var
  ZRate: Real;
begin
  NameEdit.Clear;
  if FOriginalString <> '' then begin
    ZRate := GetZoomRate(FView.GetDiagramView.Canvas.ZoomFactor);
    NameEdit.Font.Size := Trunc(FView.FontSize * ZRate);
    NameEdit.Font.Name := FView.FontFace;
    NameEdit.Font.Color := FView.FontColor;
    NameEdit.Font.Style := FView.FontStyle;
    NameEdit.Lines.Add(FOriginalString);
  end;
end;

procedure PNoteQuickDialog.FormShowHandler(Sender: TObject);
begin
  SetFormRegion;
  try
    NameEdit.SetFocus;
    NameEdit.SelLength := 0;
    if NameEdit.Text <> '' then
      NameEdit.SelStart := Length(NameEdit.Text) - 2;// - 4;
  except on Exception do
  end;
end;

procedure PNoteQuickDialog.FormDeactivateHandler(Sender: TObject);
begin
  if Self.Visible then FormHidingProc(VK_RETURN, [ssCtrl]);
end;

procedure PNoteQuickDialog.NameEditKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (ssCtrl in Shift) then NameEdit.ReadOnly := True;
  if ((Key = 65) or (Key = 97)) and (ssCtrl in Shift) and not (ssAlt in Shift)then NameEdit.SelectAll; // Ctrl + A
end;

procedure PNoteQuickDialog.NameEditKeyUpHandler(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if NameEdit.ReadOnly then NameEdit.ReadOnly := False;
  if (Key = VK_ESCAPE) or (Key = VK_RETURN)
  then FormHidingProc(Key, Shift);
end;

function PNoteQuickDialog.CheckAndApplyNameEditStrChanging: Boolean;
var
  Str: string;
begin
  Result := True;
  Str := TrimRight(NameEdit.Lines.Text);
  if Str <> FOriginalString then begin
    FManager.NoteTextChanging(FView as PUMLCustomTextView, Str);
    NameEdit.Modified := False;
  end;
end;

procedure PNoteQuickDialog.HidingWithCtrlReturnKey;
begin
  CheckAndApplyNameEditStrChanging;
  Self.Hide;
end;

// PNoteQuickDialog
////////////////////////////////////////////////////////////////////////////////

procedure PGeneralQuickDialog.ShowInformationHint;
var
  S, E, I: Integer;
  Str: String;
  HintText, HintParam: String;
  HintKey, HintValue: TStringList;
begin
  E := NameEdit.SelStart;
  Str := Copy(NameEdit.Text, 1, E);
  HintText := '';

  if (FModel is PUMLClassifier) and (not (FModel is PUMLClassifierRole)) then begin
    HintKey := ClassifierHintKey;
    HintValue := ClassifierHintValue;
    HintParam := ''
  end
  else if FModel is PUMLState then begin
    HintKey := StateHintKey;
    HintValue := StateHintValue;
    HintParam := ''
  end
  else if (FModel is PUMLObject) or (FModel is PUMLClassifierRole) then begin
    HintKey := ObjectHintKey;
    HintValue := ObjectHintValue;
    HintParam := 'object.message'
  end
  else if (FModel is PUMLStimulus) or (FModel is PUMLMessage) then begin
    HintKey := MessageHintKey;
    HintValue := MessageHintValue;
    HintParam := 'object.message'
  end
  else
    Exit;

  for I := 0 to HintKey.Count-1 do
    if (Pos(Str, HintKey.Strings[I]) = 1) or (Str = '') then
      HintText := HintText + Format('%s%s : %s'#13#10, [HintKey.Strings[I], HintParam, HintValue[I]]);

  if HintText <> '' then begin
    BalloonHint.ActivateHint(NameEdit, HintText, 'Guide', 4000);
  //BalloonHint2.Description := HintText;
  //BalloonHint2.ShowHint(NameEdit);
  end;
end;

procedure TQuickDialogForm.FormCreate(Sender: TObject);
begin
  inherited;
  QuickDialogBarManager.Images := QuickDialogImages;
end;

initialization
  ShortenSyntaxManager := PShortenSyntaxManager.Create;

  // Classifer
  ClassifierHintKey := TStringList.Create;
  ClassifierHintKey.Add('<=');
  ClassifierHintKey.Add('=>');
  ClassifierHintKey.Add('--');
  ClassifierHintKey.Add('<-');
  ClassifierHintKey.Add('->');
  ClassifierHintKey.Add('<>-');
  ClassifierHintKey.Add('-<>');
  ClassifierHintKey.Add('<*>-');
  ClassifierHintKey.Add('-<*>');
  ClassifierHintKey.Add('<--');
  ClassifierHintKey.Add('-->');
  ClassifierHintKey.Add(')-');
  ClassifierHintKey.Add('-(');
  ClassifierHintKey.Add('@-');
  ClassifierHintKey.Add('-@');
  ClassifierHintKey.Add('()-');
  ClassifierHintKey.Add('-()');
  ClassifierHintKey.Add('<i-');
  ClassifierHintKey.Add('-i>');
  ClassifierHintKey.Add('<e-');
  ClassifierHintKey.Add('-e>');

  ClassifierHintValue := TStringList.Create;
  ClassifierHintValue.Add('generalized from current');
  ClassifierHintValue.Add('generalizing current');
  ClassifierHintValue.Add('associated with current');
  ClassifierHintValue.Add('associating with current');
  ClassifierHintValue.Add('associated with current');
  ClassifierHintValue.Add('aggregated to current');
  ClassifierHintValue.Add('aggregating current');
  ClassifierHintValue.Add('composing current');
  ClassifierHintValue.Add('composed of current');
  ClassifierHintValue.Add('depending on current');
  ClassifierHintValue.Add('depended by current');
  ClassifierHintValue.Add('requiring current');
  ClassifierHintValue.Add('required by current');
  ClassifierHintValue.Add('realizing current');
  ClassifierHintValue.Add('realized by current');
  ClassifierHintValue.Add('actor communicating with current');
  ClassifierHintValue.Add('usecase communicating with current');
  ClassifierHintValue.Add('including current');
  ClassifierHintValue.Add('included by current');
  ClassifierHintValue.Add('extending current');
  ClassifierHintValue.Add('extendedy by current');

  // State
  StateHintKey := TStringList.Create;
  StateHintKey.Add('<-');
  StateHintKey.Add('->');
  StateHintKey.Add('-*');
  StateHintKey.Add('-@');
  StateHintKey.Add('<-<>');
  StateHintKey.Add('-><>');
  StateHintKey.Add('-(H)');
  StateHintKey.Add('-(h)');
  StateHintKey.Add('-(H*)');
  StateHintKey.Add('-(h*)');
  StateHintKey.Add('<-|');
  StateHintKey.Add('->|');

  StateHintValue := TStringList.Create;
  StateHintValue.Add('transition to current');
  StateHintValue.Add('transition from current');
  StateHintValue.Add('initial transiting to current');
  StateHintValue.Add('endpoint transiting from current');
  StateHintValue.Add('decision transiting to current');
  StateHintValue.Add('decision transiting from current');
  StateHintValue.Add('history transiting from current');
  StateHintValue.Add('history transiting from current');
  StateHintValue.Add('deep history transiting from current');
  StateHintValue.Add('deep history transiting from current');
  StateHintValue.Add('join to current');
  StateHintValue.Add('fork from current');

  // Object
  ObjectHintKey := TStringList.Create;
  ObjectHintKey.Add('<-');
  ObjectHintKey.Add('->');
  ObjectHintKey.Add('<->');

  ObjectHintValue := TStringList.Create;
  ObjectHintValue.Add('messge from object/role');
  ObjectHintValue.Add('message to object/role');
  ObjectHintValue.Add('message with return');

  // Message
  MessageHintKey := TStringList.Create;
  MessageHintKey.Add('<-');
  MessageHintKey.Add('->');
  MessageHintKey.Add('<->');
  MessageHintKey.Add('<~');
  MessageHintKey.Add('~>');
  MessageHintKey.Add('<_');
  MessageHintKey.Add('_>');

  MessageHintValue := TStringList.Create;
  MessageHintValue.Add('sub-message from object');
  MessageHintValue.Add('sub-message to object');
  MessageHintValue.Add('sub-message with return');
  MessageHintValue.Add('messge from object before current');
  MessageHintValue.Add('messge to object before current');
  MessageHintValue.Add('messge from object after current');
  MessageHintValue.Add('messge to object after current');

finalization
  ShortenSyntaxManager.Free;

  // Classifer
  ClassifierHintKey.Free;
  ClassifierHintValue.Free;

  // State
  StateHintKey.Free;
  StateHintValue.Free;

  // Object
  ObjectHintKey.Free;
  ObjectHintValue.Free;

  // Message
  MessageHintKey.Free;
  MessageHintValue.Free;
end.

