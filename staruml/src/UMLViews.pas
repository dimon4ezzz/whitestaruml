unit UMLViews;

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

// NOTICE ----------------------------------------------------------------------
//
//         implementation for SETUP function and INITIALIZE...
//         ------------------------------------------------------------
//
// (1) SETUP function create SUBVIEWs and assign to appropriate PROPERTY
//
// (2) in case of creating SUBVIEW, must not use ".Create", but use "MetaModel.CreateInstance"
//
// (3) SETUP can intialize SUBVIEW's PROPERTY.
//     But, for stored PROPERTY (that is, non Transient).
//     if violate it, views loaded from file may seem improper
//
// (4) INITIALIZE... function is called in SET... .
//     e.g.)
//     procedure PUMLNameCompartmentView.InitializeNameLabel(ALabel: PLabelView);
//     begin
//       ALabel.Selectable := False;
//       ALabel.HorzAlignment := haCenter;
//       ALabel.VertAlignment := vaTop;
//       ALabel.ParentLineColor := True;
//       ALabel.ParentFillColor := True;
//       ALabel.ParentFontFace := True;
//       ALabel.ParentFontSize := True;
//       ALabel.ParentFontColor := True;
//       ALabel.ParentFontStyle := True;
//     end;
//     ...
//     procedure PUMLNameCompartmentView.SetNameLabel(Value: PLabelView);
//     begin
//       if FNameLabel <> Value then begin
//         RemoveSubView(FNameLabel);
//         FNameLabel := Value;
//         InitializeNameLabel(FNameLabel);
//         AddSubView(FNameLabel);
//       end;
//     end;
//
//  (5) set PROPERTY values not stored (that is, non Transient) in INITIALIZE... function.
//      if set property value which will be stored, view status loaded from file may be damaged.
// -----------------------------------------------------------------------------

interface

uses
  Classes, Types, Windows, SysUtils, Graphics,
  BasicClasses, GraphicClasses, Core, ExtCore, ViewCore, UMLModels;


const
  // Compartment Margin(Use this in CompartmentView)
  COMPARTMENT_LABEL_INTERVAL = 0;
  COMPARTMENT_LEFT_MARGIN = 5;
  COMPARTMENT_RIGHT_MARGIN = 5;
  COMPARTMENT_TOP_MARGIN = 4;
  COMPARTMENT_BOTTOM_MARGIN = 4;

  // When use compartment, leave spaces below CompartmentView
  COMPARTMENT_INTERVAL = 2;

  // When use a sequence of labels, leave space after LabelView
  LABEL_INTERVAL = 3;

  // GeneralNode Minimum Size (Mostly General Node Views)
  GENERALNODE_MINWIDTH = 30;
  GENERALNODE_MINHEIGHT = 20;

  // Classifer minimum size
  CLASSIFIER_MINWIDTH = 40;
  CLASSIFIER_MINHEIGHT = 30;

  // Minimum size of iconic view
  ICONICVIEW_MINWIDTH = 10;
  ICONICVIEW_MINHEIGHT = 10;

  // Minim size of decoration view
  DECORATIONVIEW_MINWIDTH = CLASSIFIER_MINWIDTH;
  DECORATIONVIEW_MINHEIGHT = CLASSIFIER_MINHEIGHT;

  // Decoration icon size
  DECORATION_ICON_MARGIN = 3;
  DECORATION_ICON_WIDTH = 28;
  DECORATION_ICON_HEIGHT = 28;

  // Minimum Size and other numerical value of Views
  PACKAGE_MINWIDTH = 50;
  PACKAGE_MINHEIGHT = 40;
  PACKAGE_TAB_HEIGHT = 15;

  CLASS_ACTIVE_VERTLINE_WIDTH = 2;

  INTERFACE_ICONMINWIDTH = 20;
  INTERFACE_ICONMINHEIGHT = 20;

  USECASE_ICONMINWIDTH = 70;
  USECASE_ICONMINHEIGHT = 32;

  ACTOR_RATIO_PERCENT = 48;
  ACTOR_ICONMINHEIGHT = 55;
  ACTOR_ICONMINWIDTH = ACTOR_ICONMINHEIGHT * ACTOR_RATIO_PERCENT div 100;

  USECASE_MINWIDTH = 70;
  USECASE_MINHEIGHT = 32;
  USECASE_MINRATIO_PERCENT = 1;   // Not used yet. RATIO = WIDTH / HEIGHT
  USECASE_MAXRATIO_PERCENT = 1;

  ARTIFACT_RATIO_PERCENT = 85;
  ARTIFACT_ICONMINHEIGHT = 35;
  ARTIFACT_ICONMINWIDTH = ARTIFACT_ICONMINHEIGHT * ARTIFACT_RATIO_PERCENT div 100;

  COLLABORATION_MINHEIGHT = USECASE_MINHEIGHT;
  COLLABORATION_MINWIDTH = USECASE_MINWIDTH;

  COMPONENT_MINWIDTH = GENERALNODE_MINWIDTH;
  COMPONENT_MINHEIGHT = 45;
  COMPONENT_STATIC_MARGIN = 20;
  COMPONENT_BALANCED_HEIGHT = 45;
  COMPONENT_RECT_INDENT = 10;

  NODE_MINWIDTH = 45;
  NODE_MINHEIGHT = 45;
  NODE_STATIC_MARGIN = 10;

  TEMPLATEPARAMETERCOMPARTMENT_OVERLAP = 5;
  TEMPLATEPARAMETERCOMPARTMENT_LEFT_MARGIN = 20;
  TEMPLATEPARAMETERCOMPARTMENT_RIGHT_OCCUPY = 10;

  ACTIVATION_MINWIDTH = 14;
  ACTIVATION_MINHEIGHT = 25;
  LIFELINE_MINWIDTH = 10; // should be even number
  LIFELINE_MINHEIGHT = 50;
  SEQ_OBJECT_MINHEIGHT = 40;
  SEQ_OBJECT_MINWIDTH = 30;
  MULTI_OBJECT_MARGIN = 5;
  SELF_MESSAGE_WIDTH = 30;
  SELF_MESSAGE_HEIGHT = 20;
  SEQ_OBJECT_MESSAGE_MIN_INTERVAL = 10;

  STATE_MINWIDTH = 60;
  STATE_MINHEIGHT = 40;
  STATE_ROUND = 20;
  STATE_DECOMPOSIT_INDICATOR_HEIGHT = 16;
  STATE_DECOMPOSIT_INDICATOR_WIDTH = 30;
  INITIALSTATE_MINWIDTHH = 20;
  INITIALSTATE_MINHEIGHT = 20;
  FINALSTATE_MINWIDTHH = 26;
  FINALSTATE_MINHEIGHT = 26;
  HISTORYSTATE_MINWIDTHH = 26;
  HISTORYSTATE_MINHEIGHT = 26;
  SYNCHRONIZATION_MINLENGTH = 70;
  SYNCHRONIZATION_MINTHICK = 6;
  JUNCTION_MINWIDTH = 15;
  JUNCTION_MINHEIGHT = 15;
  CHOICE_MINWIDTH = 15;
  CHOICE_MINHEIGHT = 15;
  DECISION_MINWIDTH = 21;
  DECISION_MINHEIGHT = 21;
  SELFTRANSITION_DISTANCE = 30;
  FLOWFINALSTATE_MINWIDTH = 26;
  FLOWFINALSTATE_MINHEIGHT = 26;

  SWIMLANE_HORIZ_LEFT = 50;
  SWIMLANE_VERT_TOP = 50;
  SWIMLANE_VERT_MINWIDTH = 50;
  SWIMLANE_VERT_MINHEIGHT = 300;
  SWIMLANE_HORIZ_MINWIDTH = SWIMLANE_VERT_MINHEIGHT;
  SWIMLANE_HORIZ_MINHEIGHT = SWIMLANE_VERT_MINWIDTH;
  SWIMLANE_HEADER_TOP_MARGIN = 4;
  SWIMLANE_HEADER_BOTTOM_MARGIN = 4;
  SWIMLANE_HEADER_LEFT_MARGIN = 10;
  SWIMLANE_HEADER_RIGHT_MARGIN = 10;
  SWIMLANE_PEN_WIDTH = 2;

  CUSTOM_TEXT_MINWIDTH = 5;
  CUSTOM_TEXT_MINHEIGHT = 5;

  NOTE_MINWIDTH = 50;
  NOTE_MINHEIGHT = 20;
  NOTE_FOLDING_SIZE = 10;

  SYSTEMBOUNDARY_MINWIDTH = 40;
  SYSTEMBOUNDARY_MINHEIGHT = 40;

  PORT_MINWIDTH = 14;
  PORT_MINHEIGHT = 14;

  FRAME_MINWIDTH = 80;
  FRAME_MINHEIGHT = 50;
  FRAME_CONTENT_MINWIDTH = 10;
  FRAME_CONTENT_MINHEIGHT = 30;

  COMBINEDFRAGMENT_MINWIDTH = FRAME_MINWIDTH;
  COMBINEDFRAGMENT_MINHEIGHT = FRAME_MINHEIGHT;
  COMBINEDFRAGMENT_CONTENT_MINWIDTH = FRAME_CONTENT_MINWIDTH;
  COMBINEDFRAGMENT_CONTENT_MINHEIGHT = FRAME_CONTENT_MINHEIGHT;

  INTERACTIONOPERAND_MINWIDTH = COMBINEDFRAGMENT_MINWIDTH;
  INTERACTIONOPERAND_MINHEIGHT = COMBINEDFRAGMENT_CONTENT_MINHEIGHT;
  INTERACTIONOPERAND_GUARD_HORZ_MARGIN = 20;
  INTERACTIONOPERAND_GUARD_VERT_MARGIN = 15;

  IMAGE_EMPTY_MINWIDTH = 40;
  IMAGE_EMPTY_MINHEIGHT = 40;
  IMAGE_MINWIDTH = 5;
  IMAGE_MINHEIGHT = 5;

  // Default size of Views
  DEFAULT_PACKAGE_WIDTH = 120;
  DEFAULT_PACKAGE_HEIGHT = 70;
  DEFAULT_MODEL_WIDTH = DEFAULT_PACKAGE_WIDTH;
  DEFAULT_MODEL_HEIGHT = DEFAULT_PACKAGE_HEIGHT;
  DEFAULT_SUBSYSTEM_WIDTH = DEFAULT_PACKAGE_WIDTH;
  DEFAULT_SUBSYSTEM_HEIGHT = DEFAULT_PACKAGE_HEIGHT;
  DEFAULT_CLASS_WIDTH = 80; //66;
  DEFAULT_CLASS_HEIGHT = 42;
  DEFAULT_INTERFACE_WIDTH = 45;
  DEFAULT_INTERFACE_HEIGHT = 45;
  DEFAULT_ENUMERATION_WIDTH = DEFAULT_CLASS_WIDTH;
  DEFAULT_ENUMERATION_HEIGHT = DEFAULT_CLASS_HEIGHT;
  DEFAULT_SIGNAL_WIDTH = DEFAULT_CLASS_WIDTH;
  DEFAULT_SIGNAL_HEIGHT = DEFAULT_CLASS_HEIGHT;
  DEFAULT_EXCEPTION_WIDTH = DEFAULT_CLASS_WIDTH;
  DEFAULT_EXCEPTION_HEIGHT = DEFAULT_CLASS_HEIGHT;
  DEFAULT_COMPONENT_WIDTH = 100;
  DEFAULT_COMPONENT_HEIGHT = 45;
  DEFAULT_COMPONENTINSTANCE_WIDTH = DEFAULT_COMPONENT_WIDTH;
  DEFAULT_COMPONENTINSTANCE_HEIGHT = DEFAULT_COMPONENT_HEIGHT;
  DEFAULT_NODE_WIDTH = 85;
  DEFAULT_NODE_HEIGHT = 55;
  DEFAULT_NODEINSTANCE_WIDTH = DEFAULT_NODE_WIDTH;
  DEFAULT_NODEINSTANCE_HEIGHT = DEFAULT_NODE_HEIGHT;
  DEFAULT_ACTOR_WIDTH = 48;
  DEFAULT_ACTOR_HEIGHT = 78;
  DEFAULT_USECASE_WIDTH = 95;
  DEFAULT_USECASE_HEIGHT = 45;
  DEFAULT_COLLABORATION_WIDTH = 125;
  DEFAULT_COLLABORATION_HEIGHT = 45;
  DEFAULT_COLLABORATIONINSTANCESET_WIDTH = DEFAULT_COLLABORATION_WIDTH;
  DEFAULT_COLLABORATIONINSTANCESET_HEIGHT = DEFAULT_COLLABORATION_HEIGHT;
  DEFAULT_COLOBJECT_WIDTH = 70;
  DEFAULT_COLOBJECT_HEIGHT = 40;
  DEFAULT_SEQOBJECT_WIDTH = 70;
  DEFAULT_SEQOBJECT_HEIGHT = 350;
  DEFAULT_COLCLASSIFIERROLE_WIDTH = DEFAULT_COLOBJECT_WIDTH;
  DEFAULT_COLCLASSIFIERROLE_HEIGHT = DEFAULT_COLOBJECT_HEIGHT;
  DEFAULT_SEQCLASSIFIERROLE_WIDTH = DEFAULT_SEQOBJECT_WIDTH;
  DEFAULT_SEQCLASSIFIERROLE_HEIGHT = DEFAULT_SEQOBJECT_HEIGHT;
  DEFAULT_STATE_WIDTH = 80;
  DEFAULT_STATE_HEIGHT = 40;
  DEFAULT_SUBMACHINESTATE_WIDTH = DEFAULT_STATE_WIDTH;
  DEFAULT_SUBMACHINESTATE_HEIGHT = 50;
  DEFAULT_INITIALSTATE_WIDTH = 20;
  DEFAULT_INITIALSTATE_HEIGHT = 20;
  DEFAULT_JUNCTIONPOINT_WIDTH = 15;
  DEFAULT_JUNCTIONPOINT_HEIGHT = 15;
  DEFAULT_CHOICEPOINT_WIDTH = 15;
  DEFAULT_CHOICEPOINT_HEIGHT = 15;
  DEFAULT_DECISION_WIDTH = 50;
  DEFAULT_DECISION_HEIGHT = 30;
  DEFAULT_SHALLOWHISTORY_WIDTH = 26;
  DEFAULT_SHALLOWHISTORY_HEIGHT = 26;
  DEFAULT_DEEPHISTORY_WIDTH = 26;
  DEFAULT_DEEPHISTORY_HEIGHT = 26;
  DEFAULT_SYNCHRONIZATION_WIDTH = 70;
  DEFAULT_SYNCHRONIZATION_HEIGHT = 6;
  DEFAULT_FINALSTATE_WIDTH = 26;
  DEFAULT_FINALSTATE_HEIGHT = 26;
  DEFAULT_ACTIONSTATE_WIDTH = 90;
  DEFAULT_ACTIONSTATE_HEIGHT = 40;
  DEFAULT_SUBACTIVITYSTATE_WIDTH = 95;
  DEFAULT_SUBACTIVITYSTATE_HEIGHT = 45;
  DEFAULT_VERT_SWIMLANE_WIDTH = 200;
  DEFAULT_VERT_SWIMLANE_HEIGHT = 500;
  DEFAULT_HORIZ_SWIMLANE_WIDTH = DEFAULT_VERT_SWIMLANE_HEIGHT;
  DEFAULT_HORIZ_SWIMLANE_HEIGHT = DEFAULT_VERT_SWIMLANE_WIDTH;
  DEFAULT_NOTE_WIDTH = 50;
  DEFAULT_NOTE_HEIGHT = 30;
  DEFAULT_TEXT_WIDTH = 20;
  DEFAULT_TEXT_HEIGHT = 10;
  DEFAULT_OBJECTFLOWSTATE_WIDTH = 60;
  DEFAULT_OBJECTFLOWSTATE_HEIGHT = 40;
  DEFAULT_FLOWFINALSTATE_WIDTH = 26;
  DEFAULT_FLOWFINALSTATE_HEIGHT = 26;
  DEFAULT_SYSTEMBOUNDARY_WIDTH = 200;
  DEFAULT_SYSTEMBOUNDARY_HEIGHT = 300;
  DEFAULT_SIGNALACCEPTSTATE_WIDTH = 100;
  DEFAULT_SIGNALACCEPTSTATE_HEIGHT = 41;
  DEFAULT_SIGNALSENDSTATE_WIDTH = 100;
  DEFAULT_SIGNALSENDSTATE_HEIGHT = 41;
  DEFAULT_ARTIFACT_WIDTH = DEFAULT_CLASS_WIDTH;
  DEFAULT_ARTIFACT_HEIGHT = DEFAULT_CLASS_HEIGHT;
  DEFAULT_PORT_WIDTH = PORT_MINWIDTH;
  DEFAULT_PORT_HEIGHT = PORT_MINHEIGHT;
  DEFAULT_PART_WIDTH = 70;
  DEFAULT_PART_HEIGHT = 40;
  DEFAULT_FRAME_WIDTH = 150;
  DEFAULT_FRAME_HEIGHT = 120;
  DEFAULT_COMBINEDFRAGMENT_WIDTH = DEFAULT_FRAME_WIDTH;
  DEFAULT_COMBINEDFRAGMENT_HEIGHT = DEFAULT_FRAME_HEIGHT;
  DEFAULT_INTERACTIONOPERAND_WIDTH = INTERACTIONOPERAND_MINWIDTH;
  DEFAULT_INTERACTIONOPERAND_HEIGHT = 50;
  DEFAULT_SHAPE_WIDTH = 50;
  DEFAULT_SHAPE_HEIGHT = 50;
  DEFAULT_IMAGE_WIDTH = 80;
  DEFAULT_IMAGE_HEIGTH = 90;

  DEFAULT_TEXT_CAPTION = 'Text';
  DEFAULT_SYSTEMBOUNDARY_CAPTION = 'System';
  TEXT_NOIMAGE = 'No Image';
  
type
  // Forward Declarations
  PUMLListCompartmentView = class;
  PUMLEnumerationLiteralCompartmentView = class;
  PUMLAttributeCompartmentView = class;
  PUMLOperationCompartmentView = class;
  PUMLTemplateParameterCompartmentView = class;
  PUMLLifeLineView = class;
  PUMLActivationView = class;
  PUMLSeqMessageView = class;

  // Enumeration Types
  PUMLStereotypeDisplayKind = (sdkLabel, sdkIcon, sdkNone, sdkDecoration);
  PUMLSwimlaneDirectionKind = (slkVertical, slkHorizontal);
  PLineKind = (lkSolid, lkDash, lkDot, lkDashDot, lkDashDotDot, lkInsideFrame);
  PArrowheadStyleKind = (askNone, askTriangle, askOpen, askStealth, askDiamond, askOval);
  PImageKind = (ikNone, ikBitmap, ikMetafile);

  // Delegation Types
  PDrawingProcedure = procedure(Canvas: PCanvas; R: TRect) of object;

  {****************************************************************************}
  {*                                                                          *}
  {*                              PARTIAL VIEWS                               *}
  {*                                                                          *}
  {****************************************************************************}

  // PUMLNameCompartmentView
  PUMLNameCompartmentView = class(PNodeView)
  private
    FNameLabel: PLabelView;
    FStereotypeLabel: PLabelView;
    FPropertyLabel: PLabelView;
    FDecorationIconProc: PDrawingProcedure;
    FWordWrap: Boolean;
    procedure InitializeNameLabel(ALabel: PLabelView);
    procedure InitializeStereotypeLabel(ALabel: PLabelView);
    procedure InitializePropertyLabel(ALabel: PLabelView);
    function GetShowProperty: Boolean;
    function GetStereotypeDisplay: PUMLStereotypeDisplayKind;
    function IsDecorationView: Boolean;
    procedure SetNameLabel(Value: PLabelView);
    procedure SetStereotypeLabel(Value: PLabelView);
    procedure SetPropertyLabel(Value: PLabelView);
    procedure SetWordWrap(Value: Boolean);
  protected
    procedure AfterLoad(Reader: PObjectReader); override;
    procedure SetWidth(Value: Integer); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure DrawObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property NameLabel: PLabelView read FNameLabel write SetNameLabel;
    property StereotypeLabel: PLabelView read FStereotypeLabel write SetStereotypeLabel;
    property PropertyLabel: PLabelView read FPropertyLabel write SetPropertyLabel;
    property ShowProperty: Boolean read GetShowProperty;  // TRANSIENT
    property WordWrap: Boolean read FWordWrap write SetWordWrap;  // TRANSIENT
    property StereotypeDisplay: PUMLStereotypeDisplayKind read GetStereotypeDisplay;  // TRANSIENT
    property DecorationIconProc: PDrawingProcedure read FDecorationIconProc write FDecorationIconProc;  // TRANSIENT
  end;

  // PUMLListCompartmentView
  PUMLListCompartmentView = class(PNodeView)
  private
    FHeader: string;
    ListItemTopPosList: TStringList;
    function GetShowProperty: Boolean;
    function GetTextWidth(Canvas: PCanvas; Text: string; AFontStyle: TFontStyles): Integer;
    function GetTextHeight(Canvas: PCanvas; Text: string; AFontStyle: TFontStyles): Integer;
  protected
    // Check existence of Model in implemention of following functions.
    function GetCompartmentItemCount: Integer; virtual; abstract;
    function GetCompartmentItemText(Index: Integer): string; virtual; abstract;
    function GetCompartmentItemFontStyle(Index: Integer): TFontStyles; virtual;
    // If override 'ArrangeObject' then overriding following function is points to be duly considered.
    function GetCompartmentItemRect(Canvas: PCanvas; Index: Integer): TRect; virtual;
    procedure DrawCompartmentItem(Canvas: PCanvas; Index: Integer); virtual;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure DrawObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    destructor Destroy; override;
    function GetCompartmentItemBoundingBox(Canvas: PCanvas; Index: Integer): TRect;
    function GetCompertmentItemIndexByPoint(Canvas: PCanvas; Point: TPoint): Integer;
    property CompartmentItemCount: Integer read GetCompartmentItemCount;
    property CompartmentItemText[Index: Integer]: string read GetCompartmentItemText;
    property CompartmentItemFontStyle[Index: Integer]: TFontStyles read GetCompartmentItemFontStyle;
    property ShowProperty: Boolean read GetShowProperty;
    property Header: string read FHeader write FHeader;    
  end;

  {****************************************************************************}
  {*                                                                          *}
  {*                              COMMON VIEWS                                *}
  {*                                                                          *}
  {****************************************************************************}

  // PUMLGeneralNodeView
  PUMLGeneralNodeView = class(PNodeView)
  private
    FStereotypeDisplay: PUMLStereotypeDisplayKind;
    FShowParentName: Boolean;
    FShowProperty: Boolean;
    FNameCompartment: PUMLNameCompartmentView;
    FStereotypeIcon: TGraphic;
    FStereotypeIconMinWidth: Integer;
    FStereotypeIconMinHeight: Integer;
    FWordWrap: Boolean;
    procedure InitializeNameCompartment(ANameCompartment: PUMLNameCompartmentView);
    procedure SetStereotypeDisplay(Value: PUMLStereotypeDisplayKind);
    procedure SetShowParentName(Value: Boolean);
    procedure SetShowProperty(Value: Boolean);
    procedure SetNameCompartment(Value: PUMLNameCompartmentView);
    procedure SetWordWrap(Value: Boolean);
  protected
    // Make use of following functions to arrange view that own compartments and draw atypical
    procedure MeasureObjectMinSize(Compartments: array of PUMLListCompartmentView; DefaultMinWidth, DefaultMinHeight: Integer;
      AdditionalWidth: Integer = 0; AdditionalHeight: Integer = 0);
    procedure MeasureIconicObjectMinSize(Compartments: array of PUMLListCompartmentView; DefaultMinWidth, DefaultMinHeight, IconMinWidth, IconMinHeight: Integer);
    procedure ArrangeCompartments(Compartments: array of PUMLListCompartmentView; Bound: TRect);
    procedure ArrangeIconicCompartments(Compartments: array of PUMLListCompartmentView; Bound: TRect);
    // Make use of following functions to arrange view that own compartments in general
    procedure ArrangeObjectWithCompartments(Compartments: array of PUMLListCompartmentView; DefaultMinWidth, DefaultMinHeight: Integer);
    procedure ArrangeIconicObjectWithCompartments(Compartments: array of PUMLListCompartmentView; DefaultMinWidth, DefaultMinHeight, IconMinWidth, IconMinHeight: Integer);
    // Drawing style queries
    function IsIconicView: Boolean; virtual;
    function IsDecorationView: Boolean; virtual;
    // Icon drawing methods
    procedure DrawStereotypeIcon(Canvas: PCanvas; R: TRect);
    procedure DrawDecorationIcon(Canvas: PCanvas; R: TRect); virtual;
    // Object drawing methods
    procedure DrawIconicObject(Canvas: PCanvas); virtual;
    procedure DrawDecorationObject(Canvas: PCanvas); virtual;
    procedure DrawNoModeledMark(Canvas: PCanvas); override;
    // Object arranging methods
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); virtual;
    procedure ArrangeDecorationObject(Canvas: PCanvas); virtual;
    // Etc
    procedure DelimitContainingBoundary(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Draw(Canvas: PCanvas); override;
    procedure Arrange(Canvas: PCanvas); override;
    procedure Update; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property StereotypeDisplay: PUMLStereotypeDisplayKind read FStereotypeDisplay write SetStereotypeDisplay;
    property ShowParentName: Boolean read FShowParentName write SetShowParentName;
    property ShowProperty: Boolean read FShowProperty write SetShowProperty;
    property NameCompartment: PUMLNameCompartmentView read FNameCompartment write SetNameCompartment;
    property StereotypeIcon: TGraphic read FStereotypeIcon write FStereotypeIcon;  // TRANSIENT
    property WordWrap: Boolean read FWordWrap write SetWordWrap;
  end;

  // PUMLGeneralEdgeView
  PUMLGeneralEdgeView = class(PEdgeView)
  private
    FShowProperty: Boolean;
    FNameLabel: PEdgeLabelView;
    FStereotypeLabel: PEdgeLabelView;
    FPropertyLabel: PEdgeLabelView;
    procedure InitializeNameLabel(AEdgeLabel: PEdgeLabelView);
    procedure InitializeStereotypeLabel(AEdgeLabel: PEdgeLabelView);
    procedure InitializePropertyLabel(AEdgeLabel: PEdgeLabelView);
    procedure SetShowProperty(Value: Boolean);
    procedure SetNameLabel(Value: PEdgeLabelView);
    procedure SetStereotypeLabel(Value: PEdgeLabelView);
    procedure SetPropertyLabel(Value: PEdgeLabelView);
  protected
    procedure AfterLoad(Reader: PObjectReader); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property ShowProperty: Boolean read FShowProperty write SetShowProperty;
    property NameLabel: PEdgeLabelView read FNameLabel write SetNameLabel;
    property StereotypeLabel: PEdgeLabelView read FStereotypeLabel write SetStereotypeLabel;
    property PropertyLabel: PEdgeLabelView read FPropertyLabel write SetPropertyLabel;
  end;

  // PUMLAttributeCompartmentView
  PUMLAttributeCompartmentView = class(PUMLListCompartmentView)
  private
    function GetShowVisibility: Boolean;
    function GetShowStereotype: Boolean;
  protected
    function GetCompartmentItemCount: Integer; override;
    function GetCompartmentItemText(Index: Integer): string; override;
    function GetCompartmentItemFontStyle(Index: Integer): TFontStyles; override;
    procedure DrawObject(Canvas: PCanvas); override;
    property ShowVisibility: Boolean read GetShowVisibility;
    property ShowStereotype: Boolean read GetShowStereotype;
  public
    constructor Create; override;
  end;

  // PUMLOperationCompartmentView
  PUMLOperationCompartmentView = class(PUMLListCompartmentView)
  private
    function GetShowVisibility: Boolean;
    function GetShowStereotype: Boolean;
    function GetShowSignature: Boolean;
  protected
    function GetCompartmentItemCount: Integer; override;
    function GetCompartmentItemText(Index: Integer): string; override;
    function GetCompartmentItemFontStyle(Index: Integer): TFontStyles; override;
    procedure DrawObject(Canvas: PCanvas); override;
    property ShowVisibility: Boolean read GetShowVisibility;
    property ShowStereotype: Boolean read GetShowStereotype;
    property ShowSignature: Boolean read GetShowSignature;
  public
    constructor Create; override;
  end;

  // PUMLEnumerationLiteralCompartmentView
  PUMLEnumerationLiteralCompartmentView = class(PUMLListCompartmentView)
  private
    function GetShowVisibility: Boolean;
    function GetShowStereotype: Boolean;
  protected
    function GetCompartmentItemCount: Integer; override;
    function GetCompartmentItemText(Index: Integer): string; override;
    procedure DrawObject(Canvas: PCanvas); override;
    property ShowVisibility: Boolean read GetShowVisibility;
    property ShowStereotype: Boolean read GetShowStereotype;
  public
    constructor Create; override;
  end;

  // PUMLTemplateParameterCompartmentView
  PUMLTemplateParameterCompartmentView = class(PUMLListCompartmentView)
  protected
    function GetCompartmentItemCount: Integer; override;
    function GetCompartmentItemText(Index: Integer): string; override;
    procedure DrawObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
  end;

  // PUMLQualifierCompartmentView
  PUMLQualifierCompartmentView = class(PUMLListCompartmentView)
  private
    function GetShowVisibility: Boolean;
    function GetShowStereotype: Boolean;
  protected
    function GetCompartmentItemCount: Integer; override;
    function GetCompartmentItemText(Index: Integer): string; override;
    function GetCompartmentItemFontStyle(Index: Integer): TFontStyles; override;
    procedure DrawObject(Canvas: PCanvas); override;
    property ShowVisibility: Boolean read GetShowVisibility;
    property ShowStereotype: Boolean read GetShowStereotype;
  public
    constructor Create; override;
  end;

  // PUMLInternalTransitionCompartmentView
  PUMLInternalTransitionCompartmentView = class(PUMLListCompartmentView)
  protected
    function GetCompartmentItemCount: Integer; override;
    function GetCompartmentItemText(Index: Integer): string; override;
    procedure DrawObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
  end;

  // PUMLResidentCompartmentView
  PUMLResidentCompartmentView = class(PUMLListCompartmentView)
  protected
    function GetCompartmentItemCount: Integer; override;
    function GetCompartmentItemText(Index: Integer): string; override;
    procedure DrawObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
  end;

  // PUMLDeployedComponentCompartmentView
  PUMLDeployedComponentCompartmentView = class(PUMLListCompartmentView)
  protected
    function GetCompartmentItemCount: Integer; override;
    function GetCompartmentItemText(Index: Integer): string; override;
    procedure DrawObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
  end;

  // PUMLDeployedArtifactCompartmentView
  PUMLDeployedArtifactCompartmentView = class(PUMLListCompartmentView)
  protected
    function GetCompartmentItemCount: Integer; override;
    function GetCompartmentItemText(Index: Integer): string; override;
    procedure DrawObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
  end;

  // PUMLSlotCompartmentView
  PUMLSlotCompartmentView = class(PUMLListCompartmentView)
  protected
    function GetCompartmentItemCount: Integer; override;
    function GetCompartmentItemText(Index: Integer): string; override;
    procedure DrawObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
  end;

  // PUMLExtensionPointCompartmentView
  PUMLExtensionPointCompartmentView = class(PUMLListCompartmentView)
  protected
    function GetCompartmentItemCount: Integer; override;
    function GetCompartmentItemText(Index: Integer): string; override;
    procedure DrawObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
  end;

  // PUMLClassifierView
  PUMLClassifierView = class(PUMLGeneralNodeView)
  private
    FShowOperationSignature: Boolean;
    FShowCompartmentStereotype: Boolean;
    FShowCompartmentVisibility: Boolean;
    FAttributeCompartment: PUMLAttributeCompartmentView;
    FOperationCompartment: PUMLOperationCompartmentView;
    procedure InitializeAttributeCompartment(AAttributeCompartment: PUMLAttributeCompartmentView);
    procedure InitializeOperationCompartment(AOperationCompartment: PUMLOperationCompartmentView);
    procedure SetSuppressAttributes(Value: Boolean);
    procedure SetSuppressOperations(Value: Boolean);
    function GetSuppressAttributes: Boolean;
    function GetSuppressOperations: Boolean;
    procedure SetShowOperationSignature(Value: Boolean);
    procedure SetShowCompartmentStereotype(Value: Boolean);
    procedure SetShowCompartmentVisibility(Value: Boolean);
    procedure SetAttributeCompartment(Value: PUMLAttributeCompartmentView);
    procedure SetOperationCompartment(Value: PUMLOperationCompartmentView);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
    procedure ArrangeDecorationObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property SuppressAttributes: Boolean read GetSuppressAttributes write SetSuppressAttributes;
    property SuppressOperations: Boolean read GetSuppressOperations write SetSuppressOperations;
    property ShowOperationSignature: Boolean read FShowOperationSignature write SetShowOperationSignature;
    property ShowCompartmentStereotype: Boolean read FShowCompartmentStereotype write SetShowCompartmentStereotype;
    property ShowCompartmentVisibility: Boolean read FShowCompartmentVisibility write SetShowCompartmentVisibility;
    property AttributeCompartment: PUMLAttributeCompartmentView read FAttributeCompartment write SetAttributeCompartment;
    property OperationCompartment: PUMLOperationCompartmentView read FOperationCompartment write SetOperationCompartment;
  end;

  {****************************************************************************}
  {*                                                                          *}
  {*                      CLASS DIAGRAM RELATED VIEWS                         *}
  {*                                                                          *}
  {****************************************************************************}

  // PUMLPackageView
  PUMLPackageView = class(PUMLGeneralNodeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    procedure Update; override;
  end;

  // PUMLSubsystemView
  PUMLSubsystemView = class(PUMLPackageView)
  private
    FShowOperationSignature: Boolean;
    FShowCompartmentStereotype: Boolean;
    FShowCompartmentVisibility: Boolean;
    FOperationCompartment: PUMLOperationCompartmentView;
    procedure InitializeOperationCompartment(AOperationCompartment: PUMLOperationCompartmentView);
    procedure SetSuppressOperations(Value: Boolean);
    function GetSuppressOperations: Boolean;
    procedure SetShowOperationSignature(Value: Boolean);
    procedure SetShowCompartmentStereotype(Value: Boolean);
    procedure SetShowCompartmentVisibility(Value: Boolean);
    procedure SetOperationCompartment(Value: PUMLOperationCompartmentView);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
    procedure ArrangeDecorationObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property SuppressOperations: Boolean read GetSuppressOperations write SetSuppressOperations;
    property ShowOperationSignature: Boolean read FShowOperationSignature write SetShowOperationSignature;
    property ShowCompartmentStereotype: Boolean read FShowCompartmentStereotype write SetShowCompartmentStereotype;
    property ShowCompartmentVisibility: Boolean read FShowCompartmentVisibility write SetShowCompartmentVisibility;
    property OperationCompartment: PUMLOperationCompartmentView read FOperationCompartment write SetOperationCompartment;
  end;

  // PUMLModelView
  PUMLModelView = class(PUMLPackageView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
  public
    procedure Update; override;
  end;

  // PUMLEnumerationView
  PUMLEnumerationView = class(PUMLGeneralNodeView)
  private
    FShowOperationSignature: Boolean;
    FShowCompartmentStereotype: Boolean;
    FShowCompartmentVisibility: Boolean;
    FEnumerationLiteralCompartment: PUMLEnumerationLiteralCompartmentView;
    FOperationCompartment: PUMLOperationCompartmentView;
    procedure InitializeLiteralCompartment(ALiteralCompartment: PUMLEnumerationLiteralCompartmentView);
    procedure InitializeOperationCompartment(AOperationCompartment: PUMLOperationCompartmentView);
    procedure SetSuppressLiterals(Value: Boolean);
    procedure SetSuppressOperations(Value: Boolean);
    function GetSuppressLiterals: Boolean;
    function GetSuppressOperations: Boolean;
    procedure SetShowOperationSignature(Value: Boolean);
    procedure SetShowCompartmentStereotype(Value: Boolean);
    procedure SetShowCompartmentVisibility(Value: Boolean);
    procedure SetEnumerationLiteralCompartment(Value: PUMLEnumerationLiteralCompartmentView);
    procedure SetOperationCompartment(Value: PUMLOperationCompartmentView);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
    procedure ArrangeDecorationObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property SuppressLiterals: Boolean read GetSuppressLiterals write SetSuppressLiterals;
    property SuppressOperations: Boolean read GetSuppressOperations write SetSuppressOperations;
    property ShowOperationSignature: Boolean read FShowOperationSignature write SetShowOperationSignature;
    property ShowCompartmentStereotype: Boolean read FShowCompartmentStereotype write SetShowCompartmentStereotype;
    property ShowCompartmentVisibility: Boolean read FShowCompartmentVisibility write SetShowCompartmentVisibility;
    property EnumerationLiteralCompartment: PUMLEnumerationLiteralCompartmentView read FEnumerationLiteralCompartment write SetEnumerationLiteralCompartment;
    property OperationCompartment: PUMLOperationCompartmentView read FOperationCompartment write SetOperationCompartment;
  end;

  // PUMLClassView
  PUMLClassView = class(PUMLClassifierView)
  private
    FTemplateParameterCompartment: PUMLTemplateParameterCompartmentView;
    procedure InitializeTemplateParameterCompartment(ATemplateParameterCompartment: PUMLTemplateParameterCompartmentView);
    procedure SetTemplateParameterCompartment(Value: PUMLTemplateParameterCompartmentView);
    function IsActiveClass: Boolean;
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
    procedure ArrangeDecorationObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property TemplateParameterCompartment: PUMLTemplateParameterCompartmentView read FTemplateParameterCompartment write SetTemplateParameterCompartment;
  end;

  // PUMLInterfaceView
  PUMLInterfaceView = class(PUMLClassifierView)
  private
    function GetIconRect: TRect;
    procedure CollectSupplierRealizationViews(RealizationViews: POrderedSet);
    procedure CollectSupplierDependencyViews(DependencyViews: POrderedSet);
    procedure DrawBallNotation(Canvas: PCanvas; R: TRect);
    procedure DrawSocketNotation(Canvas: PCanvas; SupplierDependencyViews: POrderedSet);
    procedure DrawBallAndSocketNotation(Canvas: PCanvas; SupplierDependencyViews: POrderedSet);
    procedure DrawDefaultIconicObject(Canvas: PCanvas);
    procedure ArrangeDefaultIconicObject(Canvas: PCanvas);
  protected
    function IsIconicView: Boolean; override;
    function IsDecorationView: Boolean; override;
    procedure DrawDecorationIcon(Canvas: PCanvas; R: TRect); override;
    procedure DrawIconicObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
  public
    procedure Update; override;
    property IconRect: TRect read GetIconRect;  // trial
  end;

  // PUMLSignalView
  PUMLSignalView = class(PUMLClassifierView)
  public
    procedure Update; override;
  end;

  // PUMLExceptionView
  PUMLExceptionView = class(PUMLSignalView)
  public
    procedure Update; override;
  end;

  // PUMLArtifactView
  PUMLArtifactView = class(PUMLClassifierView)
  private
    procedure DrawDefaultIconicObject(Canvas: PCanvas);
  protected
    function IsIconicView: Boolean; override;
    function IsDecorationView: Boolean; override;
    procedure DrawDecorationIcon(Canvas: PCanvas; R: TRect); override;
    procedure DrawIconicObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
  public
    procedure Update; override;
  end;

  // PUMLGeneralizationView
  PUMLGeneralizationView = class(PUMLGeneralEdgeView)
  public
    constructor Create; override;
  end;

  // PUMLRealizationView
  PUMLRealizationView = class(PUMLGeneralEdgeView)
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
  end;

  // PUMLDependencyView
  PUMLDependencyView = class(PUMLGeneralEdgeView)
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
  end;

  // PUMLAssociationView
  PUMLAssociationView = class(PUMLGeneralEdgeView)
  private
    FShowCompartmentStereotype: Boolean;
    FShowCompartmentVisibility: Boolean;
    FHeadRoleNameLabel: PEdgeLabelView;
    FTailRoleNameLabel: PEdgeLabelView;
    FHeadMultiplicityLabel: PEdgeLabelView;
    FTailMultiplicityLabel: PEdgeLabelView;
    FHeadPropertyLabel: PEdgeLabelView;
    FTailPropertyLabel: PEdgeLabelView;
    FHeadQualifierCompartment: PUMLQualifierCompartmentView;
    FTailQualifierCompartment: PUMLQualifierCompartmentView;
    procedure InitializeRoleNameLabel(ARoleNameLabel: PEdgeLabelView);
    procedure InitializeMultiplicityLabel(AMultiplicityLabel: PEdgeLabelView);
    procedure InitializePropertyLabel(APropertyLabel: PEdgeLabelView);
    procedure InitializeQualifierCompartment(AQualifierCompartment: PUMLQualifierCompartmentView);
    procedure SetShowCompartmentStereotype(Value: Boolean);
    procedure SetShowCompartmentVisibility(Value: Boolean);
    procedure SetHeadRoleNameLabel(Value: PEdgeLabelView);
    procedure SetTailRoleNameLabel(Value: PEdgeLabelView);
    procedure SetHeadMultiplicityLabel(Value: PEdgeLabelView);
    procedure SetTailMultiplicityLabel(Value: PEdgeLabelView);
    procedure SetHeadPropertyLabel(Value: PEdgeLabelView);
    procedure SetTailPropertyLabel(Value: PEdgeLabelView);
    procedure SetHeadQualifierCompartment(Value: PUMLQualifierCompartmentView);
    procedure SetTailQualifierCompartment(Value: PUMLQualifierCompartmentView);
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property HeadRoleNameLabel: PEdgeLabelView read FHeadRoleNameLabel write SetHeadRoleNameLabel;
    property TailRoleNameLabel: PEdgeLabelView read FTailRoleNameLabel write SetTailRoleNameLabel;
    property HeadMultiplicityLabel: PEdgeLabelView read FHeadMultiplicityLabel write SetHeadMultiplicityLabel;
    property TailMultiplicityLabel: PEdgeLabelView read FTailMultiplicityLabel write SetTailMultiplicityLabel;
    property HeadPropertyLabel: PEdgeLabelView read FHeadPropertyLabel write SetHeadPropertyLabel;
    property TailPropertyLabel: PEdgeLabelView read FTailPropertyLabel write SetTailPropertyLabel;
    property HeadQualifierCompartment: PUMLQualifierCompartmentView read FHeadQualifierCompartment write SetHeadQualifierCompartment;
    property TailQualifierCompartment: PUMLQualifierCompartmentView read FTailQualifierCompartment write SetTailQualifierCompartment;
    property ShowCompartmentStereotype: Boolean read FShowCompartmentStereotype write SetShowCompartmentStereotype;
    property ShowCompartmentVisibility: Boolean read FShowCompartmentVisibility write SetShowCompartmentVisibility;
  end;

  // PUMLAssociationClassView
  PUMLAssociationClassView = class(PEdgeView)
  public
    constructor Create; override;
  end;

  {****************************************************************************}
  {*                                                                          *}
  {*                COMPONENT/DEPLOYMENT DIAGRAM RELATED VIEWS                *}
  {*                                                                          *}
  {****************************************************************************}

  // PUMLCustomComponentView
  PUMLCustomComponentView = class(PUMLGeneralNodeView)
  protected
    function IsDecorationView: Boolean; override;
    procedure DrawObject(Canvas: PCanvas); override;
    procedure DrawDecorationObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  end;

  // PUMLComponentView
  PUMLComponentView = class(PUMLCustomComponentView)
  private
    FResidentCompartment: PUMLResidentCompartmentView;
    procedure InitializeResidentCompartment(AResidentCompartment: PUMLResidentCompartmentView);
    procedure SetResidentCompartment(Value: PUMLResidentCompartmentView);
  protected
    procedure AfterLoad(Reader: PObjectReader); override;
    procedure DrawDecorationIcon(Canvas: PCanvas; R: TRect); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeDecorationObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property ResidentCompartment: PUMLResidentCompartmentView read FResidentCompartment write SetResidentCompartment;
  end;

  // PUMLComponentInstanceView
  PUMLComponentInstanceView = class(PUMLCustomComponentView)
  protected
    procedure DrawDecorationIcon(Canvas: PCanvas; R: TRect); override;
  public
    procedure Setup; override;
    procedure Update; override;
  end;

  // PUMLCustomNodeView
  PUMLCustomNodeView = class(PUMLGeneralNodeView)
  protected
    function IsDecorationView: Boolean; override;
    procedure DrawObject(Canvas: PCanvas); override;
    procedure DrawDecorationObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  end;

  // PUMLNodeView
  PUMLNodeView = class(PUMLCustomNodeView)
  private
    FDeployedComponentCompartment: PUMLDeployedComponentCompartmentView;
    FDeployedArtifactCompartment: PUMLDeployedArtifactCompartmentView;
    procedure InitializeDeployedComponentCompartment(ADeployedComponentCompartment: PUMLDeployedComponentCompartmentView);
    procedure InitializeDeployedArtifactCompartment(ADeployedArtifactCompartment: PUMLDeployedArtifactCompartmentView);
    procedure SetDeployedComponentCompartment(Value: PUMLDeployedComponentCompartmentView);
    procedure SetDeployedArtifactCompartment(Value: PUMLDeployedArtifactCompartmentView);
  protected
    procedure AfterLoad(Reader: PObjectReader); override;
    procedure DrawDecorationIcon(Canvas: PCanvas; R: TRect); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
    procedure ArrangeDecorationObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property DeployedComponentCompartment: PUMLDeployedComponentCompartmentView read FDeployedComponentCompartment write SetDeployedComponentCompartment;
    property DeployedArtifactCompartment: PUMLDeployedArtifactCompartmentView read FDeployedArtifactCompartment write SetDeployedArtifactCompartment;
  end;

  // PUMLNodeInstanceView
  PUMLNodeInstanceView = class(PUMLCustomNodeView)
  protected
    procedure DrawDecorationIcon(Canvas: PCanvas; R: TRect); override;
  public
    procedure Setup; override;
    procedure Update; override;
  end;

  {****************************************************************************}
  {*                                                                          *}
  {*                     USE CASE DIAGRAM RELATED VIEWS                       *}
  {*                                                                          *}
  {****************************************************************************}

  // PUMLActorView
  PUMLActorView = class(PUMLClassifierView)
  protected
    function IsDecorationView: Boolean; override;
    procedure DrawDecorationIcon(Canvas: PCanvas; R: TRect); override;
    procedure DrawObject(Canvas: PCanvas); override;
    procedure DrawDecorationObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    procedure Setup; override;
  end;

  // PUMLUseCaseView
  PUMLUseCaseView = class(PUMLClassifierView)
  private
    FExtensionPointCompartment: PUMLExtensionPointCompartmentView;
    procedure InitializeExtensionPointCompartment(AExtensionPointCompartment: PUMLExtensionPointCompartmentView);
    procedure SetExtensionPointCompartment(Value: PUMLExtensionPointCompartmentView);
  protected
    procedure AfterLoad(Reader: PObjectReader); override;
    function IsIconicView: Boolean; override;
    function IsDecorationView: Boolean; override;
    procedure DrawDecorationIcon(Canvas: PCanvas; R: TRect); override;
    procedure DrawObject(Canvas: PCanvas); override;
    procedure DrawIconicObject(Canvas: PCanvas); override;
    procedure DrawDecorationObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
    procedure ArrangeDecorationObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property ExtensionPointCompartment: PUMLExtensionPointCompartmentView read FExtensionPointCompartment write SetExtensionPointCompartment;
  end;

  // PUMLIncludeView
  PUMLIncludeView = class(PUMLGeneralEdgeView)
  public
    constructor Create; override;
    procedure Update; override;
  end;

  // PUMLExtendView
  PUMLExtendView = class(PUMLGeneralEdgeView)
  public
    constructor Create; override;
    procedure Update; override;
  end;

  // PUMLSystemBoundaryView
  PUMLSystemBoundaryView = class(PNodeView)
  private
    FCaption: string;
    procedure SetCaption(Value: string);
  public
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    property Caption: string read FCaption write SetCaption;
  end;

  {****************************************************************************}
  {*                                                                          *}
  {*                      SEQUENCE DIAGRAM RELATED VIEWS                      *}
  {*                                                                          *}
  {****************************************************************************}

  // PUMLLifeLineView
  PUMLLifeLineView = class(PNodeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    function ContainsPoint(Canvas: PCanvas; P: TPoint): Boolean; override;
    function GetActivationAt(YPosition: Integer): PUMLActivationView;
  end;

  // PUMLCustomSeqObjectView
  PUMLCustomSeqObjectView = class(PUMLGeneralNodeView)
  private
    FLifeLine: PUMLLifeLineView;
    procedure InitializeLifeLine(ALifeLine: PUMLLifeLineView);
    procedure SetLifeLine(Value: PUMLLifeLineView);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure DrawDecorationObject(Canvas: PCanvas); override;
    procedure DrawActorShapeObject(Canvas: PCanvas);
    procedure DrawNoModeledMark(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeActorShapeObject(Canvas: PCanvas);
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
    procedure ArrangeDecorationObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property LifeLine: PUMLLifeLineView read FLifeLine write SetLifeLine;
  end;

  // PUMLSeqObjectView
  PUMLSeqObjectView = class(PUMLCustomSeqObjectView)
  private
    function IsActiveObject: Boolean;
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    procedure Setup; override;
    procedure Update; override;
  end;

  // PUMLSeqClassifierRoleView
  PUMLSeqClassifierRoleView = class(PUMLCustomSeqObjectView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    procedure Setup; override;
    procedure Update; override;
  end;

  // PUMLActivationView
  PUMLActivationView = class(PNodeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
  end;

  // PUMLCustomSeqMessageView
  PUMLCustomSeqMessageView = class(PEdgeView)
  private
    FNameLabel: PEdgeLabelView;
    FStereotypeLabel: PEdgeLabelView;
    FPropertyLabel: PEdgeLabelView;
    FActivation: PUMLActivationView;
    FShowProperty: Boolean;
    procedure InitializeNameLabel(AEdgeLabel: PEdgeLabelView);
    procedure InitializeStereotypeLabel(AEdgeLabel: PEdgeLabelView);
    procedure InitializePropertyLabel(AEdgeLabel: PEdgeLabelView);
    procedure InitializeActivation(AActivation: PUMLActivationView);
    procedure SetNameLabel(Value: PEdgeLabelView);
    procedure SetStereotypeLabel(Value: PEdgeLabelView);
    procedure SetPropertyLabel(Value: PEdgeLabelView);
    procedure SetActivation(Value: PUMLActivationView);
    procedure SetShowProperty(Value: Boolean);
    procedure RegulateSequenceNumber;
  protected
    procedure AfterLoad(Reader: PObjectReader); override;
    procedure ChangePoints(APoints: PPoints); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Initialize(Canvas: PCanvas; X1, Y1, X2, Y2: Integer); override;
    procedure Setup; override;
    procedure Arrange(Canvas: PCanvas); override;
    procedure Update; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property NameLabel: PEdgeLabelView read FNameLabel write SetNameLabel;
    property StereotypeLabel: PEdgeLabelView read FStereotypeLabel write SetStereotypeLabel;
    property PropertyLabel: PEdgeLabelView read FPropertyLabel write SetPropertyLabel;
    property Activation: PUMLActivationView read FActivation write SetActivation;
    property ShowProperty: Boolean read FShowProperty write SetShowProperty;
  end;

  // PUMLSeqMessageView
  PUMLSeqMessageView = class(PUMLCustomSeqMessageView)
  end;

  // PUMLSeqStimulusView
  PUMLSeqStimulusView = class(PUMLCustomSeqMessageView)
  end;

  // PUMLCustomFrameView
  PUMLCustomFrameView = class(PNodeView)
  private
    FNameLabel: PLabelView;
    FFrameTypeLabel: PLabelView;
    procedure InitializeFrameTypeLabel(ALabel: PLabelView);
    procedure InitializeNameLabel(ALabel: PLabelView);
    procedure SetNameLabel(Value: PLabelView);
    procedure SetFrameTypeLabel(Value: PLabelView);
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure DrawObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property NameLabel: PLabelView read FNameLabel write SetNameLabel;
    property FrameTypeLabel: PLabelView read FFrameTypeLabel write SetFrameTypeLabel;
  end;

  // PUMLFrameView
  PUMLFrameView = class(PUMLCustomFrameView)
  public
    procedure Update; override;
  end;

  // PUMLCombindFragmentView
  PUMLCombinedFragmentView = class(PUMLCustomFrameView)
  private
    function GetInteractionOperatorText: string;
    procedure CarryOnInteractionOperandViews;
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    procedure Update; override;
  end;

  // PUMLInteractionOperandView
  PUMLInteractionOperandView = class(PNodeView)
  private
    FGuardLabel: PLabelView;
    procedure InitializeGuardLabel(ALabel: PLabelView);
    procedure SetGuardLabel(Value: PLabelView);
    function IsTopInterationOperandView: Boolean;
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure DrawObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function IsDrawDeferred: Boolean; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property GuardLabel: PLabelView read FGuardLabel write SetGuardLabel;
  end;

  {****************************************************************************}
  {*                                                                          *}
  {*                   COLLABORATION DIAGRAM RELATED VIEWS                    *}
  {*                                                                          *}
  {****************************************************************************}

  // PUMLCollaborationView
  PUMLCollaborationView = class(PUMLGeneralNodeView)
  private
    FTemplateParameterCompartment: PUMLTemplateParameterCompartmentView;
    procedure InitializeTemplateParameterCompartment(ATemplateParameterCompartment: PUMLTemplateParameterCompartmentView);
    procedure SetTemplateParameterCompartment(Value: PUMLTemplateParameterCompartmentView);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
    procedure ArrangeDecorationObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property TemplateParameterCompartment: PUMLTemplateParameterCompartmentView read FTemplateParameterCompartment write SetTemplateParameterCompartment;
  end;

  // PUMLCollaborationInstanceSetView
  PUMLCollaborationInstanceSetView = class(PUMLGeneralNodeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
  end;

  // PUMLCustomColObjectView
  PUMLCustomColObjectView = class(PUMLGeneralNodeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure DrawActorShapeObject(Canvas: PCanvas);
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeActorShapeObject(Canvas: PCanvas);
  end;

  // PUMLColObjectView
  PUMLColObjectView = class(PUMLCustomColObjectView)
  private
    FSlotCompartment: PUMLSlotCompartmentView;
    procedure InitializeSlotCompartment(ASlotCompartment: PUMLSlotCompartmentView);
    procedure SetSlotCompartment(Value: PUMLSlotCompartmentView);
    function IsActiveObject: Boolean;
  protected
    procedure AfterLoad(Reader: PObjectReader); override;
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
    procedure ArrangeDecorationObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property SlotCompartment: PUMLSlotCompartmentView read FSlotCompartment write SetSlotCompartment;
  end;

  // PUMLColClassifierRoleView
  PUMLColClassifierRoleView = class(PUMLCustomColObjectView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    procedure Setup; override;
    procedure Update; override;
  end;

  // PUMLLinkView
  PUMLLinkView = class(PUMLGeneralEdgeView)
  private
    FHeadEndLabel: PEdgeLabelView;
    FTailEndLabel: PEdgeLabelView;
    procedure InitializeEndLabel(AEndLabel: PEdgeLabelView);
    procedure SetHeadEndLabel(Value: PEdgeLabelView);
    procedure SetTailEndLabel(Value: PEdgeLabelView);
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property HeadEndLabel: PEdgeLabelView read FHeadEndLabel write SetHeadEndLabel;
    property TailEndLabel: PEdgeLabelView read FTailEndLabel write SetTailEndLabel;
  end;

  // PUMLAssociationRoleView
  PUMLAssociationRoleView = class(PUMLAssociationView)
  end;

  // PUMLCustomColMessageView
  PUMLCustomColMessageView = class(PEdgeNodeView)
  private
    FHeadPoint, FTailPoint: TPoint;
    ArrowPoint1, ArrowPoint2: TPoint;
    FShowProperty: Boolean;
    FNameLabel: PNodeLabelView;
    FStereotypeLabel: PNodeLabelView;
    FPropertyLabel: PNodeLabelView;
    procedure InitializeNameLabel(AEdgeLabel: PNodeLabelView);
    procedure InitializeStereotypeLabel(AEdgeLabel: PNodeLabelView);
    procedure InitializePropertyLabel(AEdgeLabel: PNodeLabelView);
    procedure SetNameLabel(Value: PNodeLabelView);
    procedure SetStereotypeLabel(Value: PNodeLabelView);
    procedure SetPropertyLabel(Value: PNodeLabelView);
    procedure SetShowProperty(Value: Boolean);
    procedure CalcPosition(Canvas: PCanvas);
  protected
    procedure AfterLoad(Reader: PObjectReader); override;
    procedure DrawSelection(Canvas: PCanvas); override;
    procedure DrawObject(Canvas: PCanvas); override;
    procedure MovePosition(Canvas: PCanvas; DX, DY: Integer); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function GetBoundingBox(Canvas: PCanvas): TRect; override;
    function ContainsPoint(Canvas: PCanvas; P: TPoint): Boolean; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property NameLabel: PNodeLabelView read FNameLabel write SetNameLabel;
    property StereotypeLabel: PNodeLabelView read FStereotypeLabel write SetStereotypeLabel;
    property PropertyLabel: PNodeLabelView read FPropertyLabel write SetPropertyLabel;
    property HeadPoint: TPoint read FHeadPoint write FHeadPoint;
    property TailPoint: TPoint read FTailPoint write FTailPoint;
    property ShowProperty: Boolean read FShowProperty write SetShowProperty;
  end;

  // PUMLColMessageView
  PUMLColMessageView = class(PUMLCustomColMessageView)
  end;

  // PUMLColStimulusView
  PUMLColStimulusView = class(PUMLCustomColMessageView)
  end;

  {****************************************************************************}
  {*                                                                          *}
  {*               STATECHART/ACTIVITY DIAGRAM RELATED VIEWS                  *}
  {*                                                                          *}
  {****************************************************************************}

  // PUMLCustomStateView
  PUMLCustomStateView = class(PUMLGeneralNodeView)
  private
    FInternalTransitionCompartment: PUMLInternalTransitionCompartmentView;
    procedure InitializeInternalTransitionCompartment(AInternalTransitionCompartment: PUMLInternalTransitionCompartmentView);
    procedure SetInternalTransitionCompartment(Value: PUMLInternalTransitionCompartmentView);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
    procedure ArrangeDecorationObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property InternalTransitionCompartment: PUMLInternalTransitionCompartmentView
        read FInternalTransitionCompartment write SetInternalTransitionCompartment;
  end;

  // PUMLStateView
  PUMLStateView = class(PUMLCustomStateView)
  protected
    procedure DelimitContainingBoundary(Canvas: PCanvas); override;
  public
    procedure Update; override;
    function CanContainViewKind(Kind: string): Boolean; override;
  end;

  // PUMLSubmachineStateView
  PUMLSubmachineStateView = class(PUMLCustomStateView)
  private
    FIncludeLabel: PLabelView;
    procedure InitializeIncludeLabel(AIncludeLabel: PLabelView);
    procedure SetIncludeLabel(Value: PLabelView);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
    procedure ArrangeIconicObject(Canvas: PCanvas); override;
    procedure ArrangeDecorationObject(Canvas: PCanvas); override;
  public
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property IncludeLabel: PLabelView read FIncludeLabel write SetIncludeLabel;
  end;

  // PUMLPseudostateView
  PUMLPseudostateView = class(PNodeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure DrawNoModeledMark(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  end;

  // PUMLFinalStateView
  PUMLFinalStateView = class(PNodeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure DrawNoModeledMark(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  end;

  // PUMLActionStateView
  PUMLActionStateView = class(PUMLGeneralNodeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  end;

  // PUMLSubactivityStateView
  PUMLSubactivityStateView = class(PUMLActionStateView)
  private
    FIncludeLabel: PLabelView;
    procedure InitializeIncludeLabel(AIncludeLabel: PLabelView);
    procedure SetIncludeLabel(Value: PLabelView);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property IncludeLabel: PLabelView read FIncludeLabel write SetIncludeLabel;
  end;

  // PUMLSwimlaneView
  PUMLSwimlaneView = class(PNodeView)
  private
    FNameLabel: PLabelView;
    FDirection: PUMLSwimlaneDirectionKind;
    procedure InitializeNameLabel(ANameLabel: PLabelView);
    procedure SetNameLabel(Value: PLabelView);
    procedure SetDirection(Value: PUMLSwimlaneDirectionKind);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure DrawNoModeledMark(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property NameLabel: PLabelView read FNameLabel write SetNameLabel;
    property Direction: PUMLSwimlaneDirectionKind read FDirection write SetDirection;
  end;

  // PUMLTransitionView
  PUMLTransitionView = class(PUMLGeneralEdgeView)
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Update; override;
  end;

  // PUMLObjectFlowStateView
  PUMLObjectFlowStateView = class(PUMLGeneralNodeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
  public
    procedure Setup; override;
    procedure Update; override;
  end;

  // PUMLFlowFinalStateView
  PUMLFlowFinalStateView = class(PNodeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure DrawNoModeledMark(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  end;

  // PUMLSignalAcceptStateView
  PUMLSignalAcceptStateView = class(PUMLGeneralNodeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  end;

  // PUMLSignalSendStateView
  PUMLSignalSendStateView = class(PUMLGeneralNodeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  end;

  {****************************************************************************}
  {*                                                                          *}
  {*               COMPOSITE STRUCTURE DIAGRAM RELATED VIEWS                  *}
  {*                                                                          *}
  {****************************************************************************}

  // PUMLPortView
  PUMLPortView = class(PNodeView)
  private
    FNameLabel: PNodeLabelView;
    FStereotypeLabel: PNodeLabelView;
    FPropertyLabel: PNodeLabelView;
    FShowProperty: Boolean;
    procedure InitializeNameLabel(ANodeLabel: PNodeLabelView);
    procedure InitializeStereotypeLabel(ANodeLabel: PNodeLabelView);
    procedure InitializePropertyLabel(ANodeLabel: PNodeLabelView);
    procedure SetNameLabel(Value: PNodeLabelView);
    procedure SetStereotypeLabel(Value: PNodeLabelView);
    procedure SetPropertyLabel(Value: PNodeLabelView);
    procedure SetShowProperty(Value: Boolean);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property NameLabel: PNodeLabelView read FNameLabel write SetNameLabel;
    property StereotypeLabel: PNodeLabelView read FStereotypeLabel write SetStereotypeLabel;
    property PropertyLabel: PNodeLabelView read FPropertyLabel write SetPropertyLabel;
    property ShowProperty: Boolean read FShowProperty write SetShowProperty;
  end;

  // PUMLPartView
  PUMLPartView = class(PUMLGeneralNodeView)
  private
    function IsContainedByReference: Boolean;
  protected
    procedure DrawObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Update; override;
  end;

  // PUMLConnectorView
  PUMLConnectorView = class(PUMLGeneralEdgeView)
  private
    FHeadRoleNameLabel: PEdgeLabelView;
    FTailRoleNameLabel: PEdgeLabelView;
    FHeadMultiplicityLabel: PEdgeLabelView;
    FTailMultiplicityLabel: PEdgeLabelView;
    procedure InitializeRoleNameLabel(ARoleNameLabel: PEdgeLabelView);
    procedure InitializeMultiplicityLabel(AMultiplicityLabel: PEdgeLabelView);
    procedure SetHeadRoleNameLabel(Value: PEdgeLabelView);
    procedure SetTailRoleNameLabel(Value: PEdgeLabelView);
    procedure SetHeadMultiplicityLabel(Value: PEdgeLabelView);
    procedure SetTailMultiplicityLabel(Value: PEdgeLabelView);
  public
    constructor Create; override;
    procedure Setup; override;
    procedure Update; override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property HeadRoleNameLabel: PEdgeLabelView read FHeadRoleNameLabel write SetHeadRoleNameLabel;
    property TailRoleNameLabel: PEdgeLabelView read FTailRoleNameLabel write SetTailRoleNameLabel;
    property HeadMultiplicityLabel: PEdgeLabelView read FHeadMultiplicityLabel write SetHeadMultiplicityLabel;
    property TailMultiplicityLabel: PEdgeLabelView read FTailMultiplicityLabel write SetTailMultiplicityLabel;
  end;

  {****************************************************************************}
  {*                                                                          *}
  {*                             AUXILIARY VIEWS                              *}
  {*                                                                          *}
  {****************************************************************************}

  // PUMLCustomTextView
  PUMLCustomTextView = class(PNodeView)
  private
    FLines: TStrings;
    procedure SetText(Value: string);
    function GetText: string;
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    destructor Destroy; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    property Text: string read GetText write SetText;
    property Lines: TStrings read FLines;
  end;

  // PUMLTextView
  PUMLTextView = class(PUMLCustomTextView)
  end;

  // PUMLNoteView
  PUMLNoteView = class(PUMLCustomTextView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  end;

  // PUMLNoteLinkView
  PUMLNoteLinkView = class(PEdgeView)
  protected
    procedure DrawNoModeledMark(Canvas: PCanvas); override;
  public
    constructor Create; override;
  end;

  {****************************************************************************}
  {*                                                                          *}
  {*                             GENERAL SHAPE VIEWS                          *}
  {*                                                                          *}
  {****************************************************************************}

  // PShapeView
  PShapeView = class(PNodeView)
  private
    FLineWidth: Integer;
    FLineKind: PLineKind;
    procedure SetLineWidth(Value: Integer);
    procedure SetLineKind(Value: PLineKind);
    function LineKindToPenStyle(Value: PLineKind): TPenStyle;
  protected
    procedure AssignShapeStyleToCanvas(Canvas: PCanvas);
  public
    constructor Create; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    property LineWidth: Integer read FLineWidth write SetLineWidth;
    property LineKind: PLineKind read FLineKind write SetLineKind;
  end;

  // PRectangleView
  PRectangleView = class(PShapeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
  end;

  // PEllipseView
  PEllipseView = class(PShapeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
  end;

  // PRoundRectView
  PRoundRectView = class(PShapeView)
  protected
    procedure DrawObject(Canvas: PCanvas); override;
  end;

  // PLineView
  PLineView = class(PShapeView, IModifiableEdge)
  private
    FPoints: PPoints;
    FBeginArrowheadStyle: PArrowheadStyleKind;
    FEndArrowheadStyle: PArrowheadStyleKind;
    function GetPoints: PPoints;
    procedure SetPoints(Value: PPoints);
    procedure SetBeginArrowheadStyle(Value: PArrowheadStyleKind);
    procedure SetEndArrowheadStyle(Value: PArrowheadStyleKind);
  protected
    procedure DrawSelection(Canvas: PCanvas); override;
    procedure DrawObject(Canvas: PCanvas); override;
    procedure MovePosition(Canvas: PCanvas; DX, DY: Integer); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public

    // IInterface functions
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    constructor Create; override;
    destructor Destroy; override;
    procedure Initialize(Canvas: PCanvas; X1, Y1, X2, Y2: Integer); override;
    function OverlapRect(Canvas: PCanvas; R: TRect): Boolean; override;
    function ContainsPoint(Canvas: PCanvas; P: TPoint): Boolean; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    property BeginArrowheadStyle: PArrowheadStyleKind read FBeginArrowheadStyle write SetBeginArrowheadStyle;
    property EndArrowheadStyle: PArrowheadStyleKind read FEndArrowheadStyle write SetEndArrowheadStyle;
    property Points: PPoints read GetPoints write SetPoints;
  end;

  // PImageView
  PImageView = class(PShapeView)
  private
    Picture: TGraphic;
    FType: PImageKind;
    FImageData: string;
    FMaintainAspectRatio: Boolean;
    procedure SetType(Value: PImageKind);
    function GetImageData: string;
    procedure SetImageData(Value: string);
    procedure SetMaintainAspectRatio(Value: Boolean);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Update; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    property Type_: PImageKind read FType write SetType;
    property ImageData: string read GetImageData write SetImageData;
    property MaintainAspectRatio: Boolean read FMaintainAspectRatio write SetMaintainAspectRatio; 
  end;

  {****************************************************************************}
  {*                                                                          *}
  {*                             UML DIAGRAM VIEWS                            *}
  {*                                                                          *}
  {****************************************************************************}

  // PUMLDiagramView
  PUMLDiagramView = class(PDiagramView)
  protected
    procedure ReorderByViewKind(PrecedentViewKinds: array of PElementClass);
  public
    function CanOwnViewKind(Kind: string): Boolean; override;
    function CanCopyViews: Boolean; override;
    function CanAcceptModel(Model: PModel): Boolean; override;
  end;

  // PUMLClassDiagramView
  PUMLClassDiagramView = class(PUMLDiagramView)
  public
    function CanOwnViewKind(Kind: string): Boolean; override;
    function CanAcceptModel(Model: PModel): Boolean; override;
    function CanPasteViews(Kind, CopyContext: string): Boolean; override;
  end;

  // PUMLUseCaseDiagramView
  PUMLUseCaseDiagramView = class(PUMLDiagramView)
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    function CanOwnViewKind(Kind: string): Boolean; override;
    function CanAcceptModel(Model: PModel): Boolean; override;
    function CanPasteViews(Kind, CopyContext: string): Boolean; override;
  end;

  // PUMLSequenceDiagramView
  PUMLSequenceDiagramView = class(PUMLDiagramView)
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    function CanOwnViewKind(Kind: string): Boolean; override;
    function CanAcceptModel(Model: PModel): Boolean; override;
    function CanPasteViews(Kind, CopyContext: string): Boolean; override;
  end;

  // PUMLSequenceRoleDiagramView
  PUMLSequenceRoleDiagramView = class(PUMLDiagramView)
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    function CanOwnViewKind(Kind: string): Boolean; override;
    function CanAcceptModel(Model: PModel): Boolean; override;
    function CanPasteViews(Kind, CopyContext: string): Boolean; override;
  end;

  // PUMLCollaborationDiagramView
  PUMLCollaborationDiagramView = class(PUMLDiagramView)
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    function CanOwnViewKind(Kind: string): Boolean; override;
    function CanAcceptModel(Model: PModel): Boolean; override;
    function CanPasteViews(Kind, CopyContext: string): Boolean; override;
  end;

  // PUMLCollaborationRoleDiagramView
  PUMLCollaborationRoleDiagramView = class(PUMLDiagramView)
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    function CanOwnViewKind(Kind: string): Boolean; override;
    function CanAcceptModel(Model: PModel): Boolean; override;
    function CanPasteViews(Kind, CopyContext: string): Boolean; override;
  end;

  // PUMLStatechartDiagramView
  PUMLStatechartDiagramView = class(PUMLDiagramView)
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    function CanOwnViewKind(Kind: string): Boolean; override;
    function CanAcceptModel(Model: PModel): Boolean; override;
    function CanPasteViews(Kind, CopyContext: string): Boolean; override;
  end;

  // PUMLActivityDiagramView
  PUMLActivityDiagramView = class(PUMLDiagramView)
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    function CanOwnViewKind(Kind: string): Boolean; override;
    function CanAcceptModel(Model: PModel): Boolean; override;
    function CanPasteViews(Kind, CopyContext: string): Boolean; override;
  end;

  // PUMLComponentDiagramView
  PUMLComponentDiagramView = class(PUMLDiagramView)
  public
    function CanOwnViewKind(Kind: string): Boolean; override;
    function CanAcceptModel(Model: PModel): Boolean; override;
    function CanPasteViews(Kind, CopyContext: string): Boolean; override;
  end;

  // PUMLDeploymentDiagramView
  PUMLDeploymentDiagramView = class(PUMLDiagramView)
  public
    function CanOwnViewKind(Kind: string): Boolean; override;
    function CanAcceptModel(Model: PModel): Boolean; override;
    function CanPasteViews(Kind, CopyContext: string): Boolean; override;
  end;

  // PUMLCompositeStructureDiagramView
  PUMLCompositeStructureDiagramView = class(PUMLDiagramView)
  public
    function CanOwnViewKind(Kind: string): Boolean; override;
    function CanAcceptModel(Model: PModel): Boolean; override;
    function CanPasteViews(Kind, CopyContext: string): Boolean; override;
  end;

  {****************************************************************************}
  {*                                                                          *}
  {*                               CONSTRAINTS                                *}
  {*                                                                          *}
  {****************************************************************************}

  // Enumeration Conversion Routines
  function UMLStereotypeDisplayKindToString(Value: PUMLStereotypeDisplayKind): string;
  function StringToUMLStereotypeDisplayKind(Value: string): PUMLStereotypeDisplayKind;
  function UMLSwimlaneDirectionKindToString(Value: PUMLSwimlaneDirectionKind): string;
  function StringToUMLSwimlaneDirectionKind(Value: string): PUMLSwimlaneDirectionKind;
  function LineKindToString(Value: PLineKind): string;
  function StringToLineKind(Value: string): PLineKind;
  function ArrowheadStyleKindToString(Value: PArrowheadStyleKind): string;
  function StringToArrowheadStyleKind(Value: string): PArrowheadStyleKind;
  function ImageKindToString(Value: PImageKind): string;
  function StringToImageKind(Value: string): PImageKind;

  // Label Text Taking Routines
  function GetPropertyString(M: PExtensibleModel; PresetProps: TStringList = nil): string;

  // Graphic Image Making Routines
  function MetafileFromDiagram(ADiagramView: PDiagramView; SelectedViewsOnly, Enhanced: Boolean): TMetafile;
  function BitmapFromDiagram(ADiagramView: PDiagramView; SelectedViewsOnly: Boolean = False): Graphics.TBitmap;

implementation

uses
  System.UITypes, Math, Dialogs, JvStrings;

////////////////////////////////////////////////////////////////////////////////
// Procedures and Functions

function VisibilityToSymbol(VK: PUMLVisibilityKind): string;
begin
  case VK of
    vkPublic: Result := '+';
    vkProtected: Result := '#';
    vkPrivate: Result := '-';
    vkPackage: Result := '~';
  else
    Result := '';
  end;
end;

function GetTheta(X1, Y1, X2, Y2 : Extended) : Extended;
var
  X, Y, th : Extended;
begin
  X := X1 - X2;
  Y := Y1 - Y2;
  th := ArcTan(abs(Y) / (abs(X) + 0.0000000001));
  if (X > 0) then
    if (Y > 0) then
      th := pi - th
    else
      th := th + pi
  else if (Y < 0) then
    th := 2 * pi - th;
  result := th;
end;

// Procedures and Functions
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLNameCompartmentView

constructor PUMLNameCompartmentView.Create;
begin
  inherited;
  FNameLabel := nil;
  FStereotypeLabel := nil;
  FPropertyLabel := nil;
  Selectable := False;
  ParentLineColor := True;
  ParentFillColor := True;
  ParentFontFace := True;
  ParentFontSize := True;
  ParentFontColor := True;
  ParentFontStyle := True;
end;

procedure PUMLNameCompartmentView.InitializeNameLabel(ALabel: PLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ALabel.Selectable := False;
  ALabel.HorzAlignment := haCenter;
  ALabel.VertAlignment := vaTop;
  ALabel.ParentLineColor := True;
  ALabel.ParentFillColor := True;
  ALabel.ParentFontFace := True;
  ALabel.ParentFontSize := True;
  ALabel.ParentFontColor := True;
  ALabel.ParentFontStyle := False;
end;

procedure PUMLNameCompartmentView.InitializeStereotypeLabel(ALabel: PLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ALabel.Selectable := False;
  ALabel.HorzAlignment := haCenter;
  ALabel.VertAlignment := vaTop;
  ALabel.ParentLineColor := True;
  ALabel.ParentFillColor := True;
  ALabel.ParentFontFace := True;
  ALabel.ParentFontSize := True;
  ALabel.ParentFontColor := True;
  ALabel.ParentFontStyle := True;
end;

procedure PUMLNameCompartmentView.InitializePropertyLabel(ALabel: PLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ALabel.Selectable := False;
  ALabel.HorzAlignment := haCenter;
  ALabel.VertAlignment := vaTop;
  ALabel.ParentLineColor := True;
  ALabel.ParentFillColor := True;
  ALabel.ParentFontFace := True;
  ALabel.ParentFontSize := True;
  ALabel.ParentFontColor := True;
  ALabel.ParentFontStyle := True;
end;

function PUMLNameCompartmentView.GetShowProperty: Boolean;
begin
  Result := False;
  if Parent is PUMLGeneralNodeView then
    Result := (Parent as PUMLGeneralNodeView).ShowProperty;
end;

function PUMLNameCompartmentView.GetStereotypeDisplay: PUMLStereotypeDisplayKind;
begin
  Result := sdkLabel;
  if Parent is PUMLGeneralNodeView then
    Result := (Parent as PUMLGeneralNodeView).StereotypeDisplay;
end;

function PUMLNameCompartmentView.IsDecorationView: Boolean;
begin
  Result := False;
  if Parent is PUMLGeneralNodeView then
    Result := (Parent as PUMLGeneralNodeView).IsDecorationView;
end;

procedure PUMLNameCompartmentView.SetNameLabel(Value: PLabelView);
begin
  if FNameLabel <> Value then begin
    RemoveSubView(FNameLabel);
    FNameLabel := Value;
    if FNameLabel <> nil then InitializeNameLabel(FNameLabel);
    AddSubView(FNameLabel);
  end;
end;

procedure PUMLNameCompartmentView.SetStereotypeLabel(Value: PLabelView);
begin
  if FStereotypeLabel <> Value then begin
    RemoveSubView(FStereotypeLabel);
    FStereotypeLabel := Value;
    if FStereotypeLabel <> nil then InitializeStereotypeLabel(FStereotypeLabel);
    AddSubView(FStereotypeLabel);
  end;
end;

procedure PUMLNameCompartmentView.SetPropertyLabel(Value: PLabelView);
begin
  if FPropertyLabel <> Value then begin
    RemoveSubView(FPropertyLabel);
    FPropertyLabel := Value;
    if FPropertyLabel <> nil then InitializePropertyLabel(FPropertyLabel);
    AddSubView(FPropertyLabel);
  end;
end;

procedure PUMLNameCompartmentView.SetWordWrap(Value: Boolean);
begin
  if FWordWrap <> Value then begin
    FWordWrap := Value;
    if FNameLabel <> nil then
      FNameLabel.WordWrap := FWordWrap;
  end;
end;

procedure PUMLNameCompartmentView.AfterLoad(Reader: PObjectReader);
begin
  inherited;
  // StarUML
  if PropertyLabel = nil then begin
    PropertyLabel := MetaModel.CreateInstance('LabelView') as PLabelView;
  end;
end;

procedure PUMLNameCompartmentView.SetWidth(Value: Integer);
begin
  inherited;
  if NameLabel <> nil then NameLabel.Width := Width - COMPARTMENT_LEFT_MARGIN * 2;
  if StereotypeLabel <> nil then StereotypeLabel.Width := Width - COMPARTMENT_LEFT_MARGIN * 2;
  if PropertyLabel <> nil then PropertyLabel.Width := Width - COMPARTMENT_LEFT_MARGIN * 2;
end;

procedure PUMLNameCompartmentView.Update;
begin
  if Model = nil then Exit;
  inherited;
end;

procedure PUMLNameCompartmentView.ArrangeObject(Canvas: PCanvas);
var
  Y: Integer;
  W, H: Integer;
  R: Integer;
begin
  W := 0; H := 0;
  R := Right;
  if IsDecorationView then
    R := Right - DECORATION_ICON_WIDTH - DECORATION_ICON_MARGIN;
  Y := Top + COMPARTMENT_TOP_MARGIN;
  // Arrange StereotypeLabel
  FStereotypeLabel.Visible := FStereotypeLabel.Text <> '';
  if FStereotypeLabel.Visible then begin
    FStereotypeLabel.Left := Left + COMPARTMENT_LEFT_MARGIN;
    FStereotypeLabel.Top := Y;
    FStereotypeLabel.Right := R - COMPARTMENT_RIGHT_MARGIN;
    Y := Y + FStereotypeLabel.Height + COMPARTMENT_LABEL_INTERVAL;
    H := H + FStereotypeLabel.Height + COMPARTMENT_LABEL_INTERVAL;
    W := Max(W, FStereotypeLabel.MinWidth);
  end;
  // Arrange NameLabel
  FNameLabel.Left := Left + COMPARTMENT_LEFT_MARGIN;
  FNameLabel.Top := Y;
  FNameLabel.Right := R - COMPARTMENT_RIGHT_MARGIN;
  H := H + FNameLabel.Height;
  W := Max(W, FNameLabel.MinWidth);
  FPropertyLabel.Visible := ShowProperty and (FPropertyLabel.Text <> '');
  if FPropertyLabel.Visible then begin
    Y := Y + FNameLabel.Height + COMPARTMENT_LABEL_INTERVAL;
    FPropertyLabel.Left := Left + COMPARTMENT_LEFT_MARGIN;
    FPropertyLabel.Top := Y;
    FPropertyLabel.Right := R - COMPARTMENT_RIGHT_MARGIN;
    H := H + FPropertyLabel.Height;
    W := Max(W, FPropertyLabel.MinWidth);
  end;
  // Decoration Icon
  if IsDecorationView then begin
    W := W + DECORATION_ICON_WIDTH + DECORATION_ICON_MARGIN;
    H := Max(H, DECORATION_ICON_HEIGHT);
  end;
  MinHeight := H + COMPARTMENT_TOP_MARGIN + COMPARTMENT_BOTTOM_MARGIN;
  MinWidth := W + COMPARTMENT_LEFT_MARGIN + COMPARTMENT_RIGHT_MARGIN;
  Height := MinHeight;
end;

procedure PUMLNameCompartmentView.DrawObject(Canvas: PCanvas);
var
  X, Y: Integer;
begin
  inherited;
  if IsDecorationView and Assigned(DecorationIconProc) then begin
    X := Right - DECORATION_ICON_WIDTH - COMPARTMENT_RIGHT_MARGIN;
    Y := Top + COMPARTMENT_TOP_MARGIN;
    DecorationIconProc(Canvas, Rect(X, Y, X + DECORATION_ICON_WIDTH, Y + DECORATION_ICON_HEIGHT));
  end;
end;

procedure PUMLNameCompartmentView.Setup;
begin
  // WARNING -------------------------------------------------------------------
  // DO NOT ASSIGN SUBVIEW'S "TRANSIENT" PROPERTIES IN "SETUP" PROCEDURE.
  // IF YOU NEED TO ASSIGN SUBVIEW'S "TRANSIENT" PROPERTIES, MAKE A INITIALIZE
  // PROCEDURE AND PLACE IT IN SETTER PROCEDURE OF THE PROPERTY.
  // ---------------------------------------------------------------------------
  inherited;
  NameLabel := MetaModel.CreateInstance('LabelView') as PLabelView;
  StereotypeLabel := MetaModel.CreateInstance('LabelView') as PLabelView;
  PropertyLabel := MetaModel.CreateInstance('LabelView') as PLabelView;
end;

function PUMLNameCompartmentView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'NameLabel' then begin
    Result := NameLabel;
  end
  else if Name = 'StereotypeLabel' then begin
    Result := StereotypeLabel;
  end
  else if Name = 'PropertyLabel' then begin
    Result := PropertyLabel;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLNameCompartmentView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'NameLabel' then begin
    NameLabel := Value as PLabelView;
  end
  else if Name = 'StereotypeLabel' then begin
    StereotypeLabel := Value as PLabelView;
  end
  else if Name = 'PropertyLabel' then begin
    PropertyLabel := Value as PLabelView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLNameCompartmentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLListCompartmentView

constructor PUMLListCompartmentView.Create;
begin
  inherited;
  ListItemTopPosList := TStringList.Create;
end;

destructor PUMLListCompartmentView.Destroy;
begin
  ListItemTopPosList.Free;
  inherited;
end;

function PUMLListCompartmentView.GetShowProperty: Boolean;
begin
  Result := False;
  if Parent is PUMLGeneralNodeView then
    Result := (Parent as PUMLGeneralNodeView).ShowProperty
  else if Parent is PUMLGeneralEdgeView then
    Result := (Parent as PUMLGeneralEdgeView).ShowProperty;
end;

function PUMLListCompartmentView.GetTextWidth(Canvas: PCanvas; Text: string; AFontStyle: TFontStyles): Integer;
var
  F: PFontRec;
begin
  StoreFont(Canvas, F);
  AssignStyleToCanvas(Canvas);
  AssignFontToCanvas(Canvas);
  Canvas.Font.Style := AFontStyle;
  Result := Canvas.TextWidth(Text);
  RestoreFont(Canvas, F);
end;

function PUMLListCompartmentView.GetTextHeight(Canvas: PCanvas; Text: string; AFontStyle: TFontStyles): Integer;
var
  F: PFontRec;
begin
  StoreFont(Canvas, F);
  AssignStyleToCanvas(Canvas);
  AssignFontToCanvas(Canvas);
  Canvas.Font.Style := AFontStyle;
  Result := Canvas.TextHeight('^_');
  RestoreFont(Canvas, F);
end;

function PUMLListCompartmentView.GetCompartmentItemFontStyle(Index: Integer): TFontStyles;
begin
  Result := [];
end;

function PUMLListCompartmentView.GetCompartmentItemRect(Canvas: PCanvas; Index: Integer): TRect;
var
  Y: Integer;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION
  AssignFontToCanvas(Canvas);
  AssignStyleToCanvas(Canvas);
  Y := StrToInt(ListItemTopPosList.Strings[Index]);
  Result := Rect(Left + COMPARTMENT_LEFT_MARGIN, Y,
    Right - COMPARTMENT_RIGHT_MARGIN, Y + GetTextHeight(Canvas, GetCompartmentItemText(Index),GetCompartmentItemFontStyle(Index)));
end;

procedure PUMLListCompartmentView.DrawCompartmentItem(Canvas: PCanvas; Index: Integer);
var
  F: PFontRec;
  R: TRect;
begin
  StoreFont(Canvas, F);
  R := GetCompartmentItemRect(Canvas, Index);
  Canvas.Font.Style := GetCompartmentItemFontStyle(Index);
  Canvas.TextOut(R.Left, R.Top, GetCompartmentItemText(Index));
  RestoreFont(Canvas, F);
end;

procedure PUMLListCompartmentView.ArrangeObject(Canvas: PCanvas);
var
  I: Integer;
  W, H: Integer;
begin
  inherited;
  AssignFontToCanvas(Canvas);
  AssignStyleToCanvas(Canvas);
  ListItemTopPosList.Clear;
  W := 0; H := 0;
  if FHeader <> '' then begin
    W := GetTextWidth(Canvas, FHeader, [fsBold]);
    H := GetTextHeight(Canvas, FHeader, [fsBold]);
  end;
  for I := 0 to GetCompartmentItemCount - 1 do begin
    ListItemTopPosList.Add(IntToStr(Top + COMPARTMENT_TOP_MARGIN + H));
    W := Max(W, GetTextWidth(Canvas, GetCompartmentItemText(I), GetCompartmentItemFontStyle(I)));
    H := H + GetTextHeight(Canvas, GetCompartmentItemText(I), GetCompartmentItemFontStyle(I)) + COMPARTMENT_LABEL_INTERVAL;
  end;
  H := H - COMPARTMENT_LABEL_INTERVAL;
  MinWidth := W + COMPARTMENT_LEFT_MARGIN + COMPARTMENT_RIGHT_MARGIN;
  MinHeight := H + COMPARTMENT_TOP_MARGIN + COMPARTMENT_BOTTOM_MARGIN;
  Height := MinHeight;
end;

procedure PUMLListCompartmentView.DrawObject(Canvas: PCanvas);
var
  L: Integer;
  I: Integer;
begin
  AssignFontToCanvas(Canvas);
  AssignStyleToCanvas(Canvas);
  for I := 0 to GetCompartmentItemCount - 1 do
    DrawCompartmentItem(Canvas, I);
  if FHeader <> '' then begin
    Canvas.Font.Style := [fsBold];
    L := Left + (Width - GetTextWidth(Canvas, FHeader, [fsBold])) div 2;
    Canvas.TextOut(L, Top + COMPARTMENT_TOP_MARGIN, FHeader);
  end;    
end;

function PUMLListCompartmentView.GetCompartmentItemBoundingBox(Canvas: PCanvas; Index: Integer): TRect;
begin
  Result := GetCompartmentItemRect(Canvas, Index);
end;

function PUMLListCompartmentView.GetCompertmentItemIndexByPoint(Canvas: PCanvas; Point: TPoint): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to GetCompartmentItemCount - 1 do
    if PtInRect(GetCompartmentItemRect(Canvas, I), Point) then begin
      Result := I;
      Exit;
    end;
end;

// PUMLListCompartmentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLGeneralNodeView

constructor PUMLGeneralNodeView.Create;
begin
  inherited;
  FNameCompartment := nil;
  FStereotypeDisplay := sdkLabel;
  FShowParentName := False;
  FShowProperty := False;
  FStereotypeIcon := nil;
  FStereotypeIconMinWidth := 0;
  FStereotypeIconMinHeight := 0;
  FWordWrap := False;
end;

procedure PUMLGeneralNodeView.Setup;
begin
  inherited;
  NameCompartment := MetaModel.CreateInstance('UMLNameCompartmentView') as PUMLNameCompartmentView;
  NameCompartment.Setup;
end;

procedure PUMLGeneralNodeView.SetStereotypeDisplay(Value: PUMLStereotypeDisplayKind);
begin
  if FStereotypeDisplay <> Value then begin
    FStereotypeDisplay := Value;
  end;
end;

procedure PUMLGeneralNodeView.InitializeNameCompartment(ANameCompartment: PUMLNameCompartmentView);
begin
  // INITIALIZE "TRANSIENT" PROPERTIES.
  ANameCompartment.Selectable := False;
  ANameCompartment.ParentLineColor := True;
  ANameCompartment.ParentFillColor := True;
  ANameCompartment.ParentFontFace := True;
  ANameCompartment.ParentFontSize := True;
  ANameCompartment.ParentFontColor := True;
  ANameCompartment.ParentFontStyle := True;
end;

procedure PUMLGeneralNodeView.SetShowParentName(Value: Boolean);
begin
  if FShowParentName <> Value then begin
    FShowParentName := Value;
  end;
end;

procedure PUMLGeneralNodeView.SetShowProperty(Value: Boolean);
begin
  if FShowProperty <> Value then begin
    FShowProperty := Value;
  end;
end;

procedure PUMLGeneralNodeView.SetNameCompartment(Value: PUMLNameCompartmentView);
begin
  if FNameCompartment <> Value then begin
    RemoveSubView(FNameCompartment);
    FNameCompartment := Value;
    if FNameCompartment <> nil then begin
      InitializeNameCompartment(FNameCompartment);
      FNameCompartment.WordWrap := FWordWrap;
    end;
    AddSubView(FNameCompartment);
  end;
end;

procedure PUMLGeneralNodeView.SetWordWrap(Value: Boolean);
begin
  if FWordWrap <> Value then begin
    FWordWrap := Value;
    if FNameCompartment <> nil then
      FNameCompartment.WordWrap := FWordWrap;
  end;
end;

procedure PUMLGeneralNodeView.DrawStereotypeIcon(Canvas: PCanvas; R: TRect);
var
  IR, RR: Integer;
  W, H: Integer;
  X, Y: Integer;
begin
  // PRECONDITION
  Assert((R.Bottom - R.Top) <> 0, 'Arrange object needed');
  Assert(FStereotypeIconMinHeight > 0, 'Stereotype icon minimum height not specified.');
  Assert(FStereotypeIcon <> nil);
  // PRECONDITION
  RR := (R.Right - R.Left) * 100 div (R.Bottom - R.Top);
  IR := FStereotypeIconMinWidth * 100 div FStereotypeIconMinHeight;
  if RR >= IR then begin
    H := (R.Bottom - R.Top);
    W := H * IR div 100;
    X := R.Left + (R.Right - R.Left - W) div 2;
    Y := R.Top;
  end
  else begin
    W := (R.Right - R.Left);
    H := W * 100 div IR;
    Y := R.Top + (R.Bottom - R.Top - H) div 2;
    X := R.Left;
  end;
  Canvas.StretchDraw(Rect(X, Y, X + W, Y + H), FStereotypeIcon);
end;

procedure PUMLGeneralNodeView.DrawDecorationIcon(Canvas: PCanvas; R: TRect);
begin
  if FStereotypeIcon <> nil then
    DrawStereotypeIcon(Canvas, R);
end;

procedure PUMLGeneralNodeView.MeasureObjectMinSize(Compartments: array of PUMLListCompartmentView; DefaultMinWidth, DefaultMinHeight: Integer;
  AdditionalWidth: Integer = 0; AdditionalHeight: Integer = 0);
var
  W, H: Integer;
  I: Integer;
begin
  W := NameCompartment.MinWidth;
  H := NameCompartment.MinHeight + COMPARTMENT_INTERVAL;
  for I := 0 to Length(Compartments) - 1 do begin
    if Compartments[I].Visible then begin
      W := Max(W, Compartments[I].MinWidth);
      H := H + Compartments[I].MinHeight + COMPARTMENT_INTERVAL;
    end;
  end;
  MinWidth := Max(W + AdditionalWidth, DefaultMinWidth);
  MinHeight := Max(H + AdditionalHeight, DefaultMinHeight);
end;

procedure PUMLGeneralNodeView.MeasureIconicObjectMinSize(Compartments: array of PUMLListCompartmentView; DefaultMinWidth, DefaultMinHeight, IconMinWidth, IconMinHeight: Integer);
var
  W, H: Integer;
  I: Integer;
begin
  W := Max(NameCompartment.MinWidth, IconMinWidth);
  H := IconMinHeight + NameCompartment.MinHeight + COMPARTMENT_INTERVAL;
  for I := 0 to Length(Compartments) - 1 do begin
    if Compartments[I].Visible then begin
      W := Max(W, Compartments[I].MinWidth);
      H := H + Compartments[I].MinHeight + COMPARTMENT_INTERVAL;
    end;
  end;
  MinWidth := Max(W, DefaultMinWidth);
  MinHeight := Max(H, DefaultMinHeight);
end;

procedure PUMLGeneralNodeView.ArrangeCompartments(Compartments: array of PUMLListCompartmentView; Bound: TRect);
var
  Y: Integer;
  I: Integer;
begin
  NameCompartment.Left := Bound.Left;
  NameCompartment.Right := Bound.Right;
  NameCompartment.Top := Bound.Top;
  Y := NameCompartment.Bottom + COMPARTMENT_INTERVAL;
  for I := 0 to Length(Compartments) - 1 do begin
    Compartments[I].Left := Bound.Left;
    Compartments[I].Right := Bound.Right;
    Compartments[I].Top := Y;
    if Compartments[I].Visible then
      Y := Compartments[I].Bottom + COMPARTMENT_INTERVAL;
  end;
end;

procedure PUMLGeneralNodeView.ArrangeIconicCompartments(Compartments: array of PUMLListCompartmentView; Bound: TRect);
var
  Y: Integer;
  I: Integer;
begin
  Y := Bottom;
  for I := Length(Compartments) - 1 downto 0 do begin
    Compartments[I].Left := Bound.Left;
    Compartments[I].Right := Bound.Right;
    if Compartments[I].Visible then begin
      Compartments[I].Top := Y - Compartments[I].Height - COMPARTMENT_INTERVAL;
      Y := Y - Compartments[I].Height - COMPARTMENT_INTERVAL;
    end
    else
      Compartments[I].Top := Y - Compartments[I].Height;
  end;
  NameCompartment.Left := Bound.Left;
  NameCompartment.Right := Bound.Right;
  NameCompartment.Top := Y - NameCompartment.Height - COMPARTMENT_INTERVAL;
end;

procedure PUMLGeneralNodeView.ArrangeObjectWithCompartments(Compartments: array of PUMLListCompartmentView; DefaultMinWidth, DefaultMinHeight: Integer);
begin
  MeasureObjectMinSize(Compartments, DefaultMinWidth, DefaultMinHeight);
  ArrangeCompartments(Compartments, Rect(Left, Top, Right, Bottom));
end;

procedure PUMLGeneralNodeView.ArrangeIconicObjectWithCompartments(Compartments: array of PUMLListCompartmentView; DefaultMinWidth, DefaultMinHeight, IconMinWidth, IconMinHeight: Integer);
begin
  MeasureIconicObjectMinSize(Compartments, DefaultMinWidth, DefaultMinHeight, IconMinWidth, IconMinHeight);
  ArrangeIconicCompartments(Compartments, Rect(Left, Top, Right, Bottom));
end;

function PUMLGeneralNodeView.IsIconicView: Boolean;
begin
  Result := (FStereotypeIcon <> nil) and (FStereotypeDisplay = sdkIcon);
end;

function PUMLGeneralNodeView.IsDecorationView: Boolean;
begin
  Result := (FStereotypeIcon <> nil) and (FStereotypeDisplay = sdkDecoration);
end;

procedure PUMLGeneralNodeView.DrawIconicObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  DrawStereotypeIcon(Canvas, Rect(Left, Top, Right, NameCompartment.Top));
end;

procedure PUMLGeneralNodeView.DrawDecorationObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
end;

procedure PUMLGeneralNodeView.DrawNoModeledMark(Canvas: PCanvas);
begin
  DrawModelExcludedMark(Canvas, Left + Width * 3 div 4, Top + Height * 1 div 4);
end;

procedure PUMLGeneralNodeView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeObjectWithCompartments([], GENERALNODE_MINWIDTH, GENERALNODE_MINHEIGHT);
end;

procedure PUMLGeneralNodeView.ArrangeIconicObject(Canvas: PCanvas);
begin
  if AutoResize then begin
    Width := MinWidth;
    Height := MinHeight;
  end;
  ArrangeIconicObjectWithCompartments([], ICONICVIEW_MINWIDTH, ICONICVIEW_MINHEIGHT, FStereotypeIconMinWidth, FStereotypeIconMinHeight);
end;

procedure PUMLGeneralNodeView.ArrangeDecorationObject(Canvas: PCanvas);
begin
  if AutoResize then begin
    Width := MinWidth;
    Height := MinHeight;
  end;
  ArrangeObjectWithCompartments([], DECORATIONVIEW_MINWIDTH, DECORATIONVIEW_MINHEIGHT);
end;

procedure PUMLGeneralNodeView.DelimitContainingBoundary(Canvas: PCanvas);
var
  R, VR: TRect;
  I: Integer;
begin
  R := Rect(Left, Top, Right, Bottom);
  for I := 0 to ContainedViewCount - 1 do begin
    if ContainedViews[I].ContainerExtending then begin
      VR := ContainedViews[I].GetBoundingBox(Canvas);
      VR := Rect(VR.Left - COMPARTMENT_LEFT_MARGIN, VR.Top - COMPARTMENT_TOP_MARGIN,
        VR.Right + COMPARTMENT_RIGHT_MARGIN, VR.Bottom + COMPARTMENT_BOTTOM_MARGIN);
      R := GraphicClasses.UnionRect(R, VR);
    end;
  end;
  Left := R.Left;
  Right := R.Right;
  Top := R.Top;
  Bottom := R.Bottom;
end;

procedure PUMLGeneralNodeView.Draw(Canvas: PCanvas);
var
  I: Integer;
begin
  if Visible then begin
    Arrange(Canvas);
    // edited by hskim 2005.08.09 begin
    if ShowExtendedNotation and IsExtendedView then
      DrawExtendedView(Canvas)
    // edited by hskim 2005.08.09 end
    else begin
      if IsIconicView then
        DrawIconicObject(Canvas)
      else if IsDecorationView then
        DrawDecorationObject(Canvas)
      else
        DrawObject(Canvas);
      for I := 0 to SubViewCount - 1 do
        SubView[I].Draw(Canvas);
    end;
    if Model = nil then
      DrawNoModeledMark(Canvas);
  end;
end;

procedure PUMLGeneralNodeView.Arrange(Canvas: PCanvas);
var
  I: Integer;
begin
  // edited by hskim 2005.08.09 begin
  if ShowExtendedNotation and IsExtendedView then
  // edited by hskim 2005.08.09 end
    ArrangeExtendedView(Canvas)
  else begin
    for I := 0 to SubViewCount - 1 do
      SubView[I].Arrange(Canvas);
    DelimitContainingBoundary(Canvas);
    if IsIconicView then
      ArrangeIconicObject(Canvas)
    else if IsDecorationView then
      ArrangeDecorationObject(Canvas)
    else
      ArrangeObject(Canvas);
  end;
end;

procedure PUMLGeneralNodeView.Update;
var
  M: PUMLModelElement;
  Classifier: PUMLClassifier;
  S: PStereotype;
  I: Integer;
begin
  if Model = nil then Exit;
  inherited;
  // for Name
  M := (Model as PUMLModelElement);
  // Updating Name
  if NameCompartment.NameLabel.Text <> M.Name then begin
    if M is PUMLClassifier then begin
      Classifier := M as PUMLClassifier;
      for I := 0 to Classifier.TypedFeatureCount - 1 do
        Classifier.TypedFeatures[I].UpdateViews;
      for I := 0 to Classifier.TypedParameterCount - 1 do
        Classifier.TypedParameters[I].UpdateViews;
    end;
  end;
  if ShowParentName and (M.VirtualNameSpace <> nil) then
    NameCompartment.NameLabel.Text := M.VirtualNameSpace.Name + '::' + M.Name
  else
    NameCompartment.NameLabel.Text := M.Name;
  // for Stereotype
  FStereotypeIcon := nil;
  FStereotypeIconMinWidth := 0;
  FStereotypeIconMinHeight := 0;
  S := ExtensionManager.FindStereotype(M.StereotypeProfile, M.StereotypeName, M.MetaClass.Name);
  if S <> nil then begin
    FStereotypeIcon := S.Icon;
    FStereotypeIconMinWidth := S.IconMinWidth;
    FStereotypeIconMinHeight := S.IconMinHeight;
  end;
  if (M.StereotypeName = '') or (FStereotypeDisplay = sdkNone) or IsIconicView then
    NameCompartment.StereotypeLabel.Text := ''
  else
    NameCompartment.StereotypeLabel.Text := '<<' + M.StereotypeName + '>>';
  NameCompartment.PropertyLabel.Text := GetPropertyString(M);
  NameCompartment.DecorationIconProc := DrawDecorationIcon;
end;

function PUMLGeneralNodeView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'StereotypeDisplay' then begin
    Result := UMLStereotypeDisplayKindToString(StereotypeDisplay);
  end
  else if Name = 'ShowParentName' then begin
    Result := BooleanToString(ShowParentName);
  end
  else if Name = 'ShowProperty' then begin
    Result := BooleanToString(ShowProperty);
  end
  else if Name = 'WordWrap' then begin
    Result := BooleanToString(WordWrap);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PUMLGeneralNodeView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'StereotypeDisplay' then begin
    StereotypeDisplay := StringToUMLStereotypeDisplayKind(Value);
  end
  else if Name = 'ShowParentName' then begin
    ShowParentName := StringToBoolean(Value);
  end
  else if Name = 'ShowProperty' then begin
    ShowProperty := StringToBoolean(Value);
  end
  else if Name = 'WordWrap' then begin
    WordWrap := StringToBoolean(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PUMLGeneralNodeView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'NameCompartment' then begin
    Result := NameCompartment;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLGeneralNodeView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'NameCompartment' then begin
    NameCompartment := Value as PUMLNameCompartmentView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLGeneralNodeView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLGeneralEdgeView

constructor PUMLGeneralEdgeView.Create;
begin
  inherited;
  FShowProperty := False;
  FNameLabel := nil;
  FStereotypeLabel := nil;
  FPropertyLabel := nil;
end;

procedure PUMLGeneralEdgeView.Setup;
begin
  inherited;
  NameLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  NameLabel.EdgePosition := epMiddle;
  NameLabel.Distance := 15;
  NameLabel.Alpha := PI / 2;
  NameLabel.Model := Model;
  StereotypeLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  StereotypeLabel.EdgePosition := epMiddle;
  StereotypeLabel.Distance := 30;
  StereotypeLabel.Alpha := PI / 2;
  StereotypeLabel.Model := Model;
  PropertyLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  PropertyLabel.EdgePosition := epMiddle;
  PropertyLabel.Distance := 15;
  PropertyLabel.Alpha := - PI / 2;
  PropertyLabel.Model := Model;
end;

procedure PUMLGeneralEdgeView.InitializeNameLabel(AEdgeLabel: PEdgeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AEdgeLabel.Selectable := True;
  AEdgeLabel.HorzAlignment := haCenter;
  AEdgeLabel.VertAlignment := vaTop;
  AEdgeLabel.ParentLineColor := False;
  AEdgeLabel.ParentFillColor := False;
  AEdgeLabel.ParentFontFace := False;
  AEdgeLabel.ParentFontSize := False;
  AEdgeLabel.ParentFontColor := False;
  AEdgeLabel.ParentFontStyle := False;
end;

procedure PUMLGeneralEdgeView.InitializeStereotypeLabel(AEdgeLabel: PEdgeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AEdgeLabel.Selectable := True;
  AEdgeLabel.HorzAlignment := haCenter;
  AEdgeLabel.VertAlignment := vaTop;
  AEdgeLabel.ParentLineColor := False;
  AEdgeLabel.ParentFillColor := False;
  AEdgeLabel.ParentFontFace := False;
  AEdgeLabel.ParentFontSize := False;
  AEdgeLabel.ParentFontColor := False;
  AEdgeLabel.ParentFontStyle := False;
end;

procedure PUMLGeneralEdgeView.InitializePropertyLabel(AEdgeLabel: PEdgeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AEdgeLabel.Selectable := True;
  AEdgeLabel.HorzAlignment := haCenter;
  AEdgeLabel.VertAlignment := vaTop;
  AEdgeLabel.ParentLineColor := False;
  AEdgeLabel.ParentFillColor := False;
  AEdgeLabel.ParentFontFace := False;
  AEdgeLabel.ParentFontSize := False;
  AEdgeLabel.ParentFontColor := False;
  AEdgeLabel.ParentFontStyle := False;
end;

procedure PUMLGeneralEdgeView.SetShowProperty(Value: Boolean);
begin
  if FShowProperty <> Value then begin
    FShowProperty := Value;
  end;
end;

procedure PUMLGeneralEdgeView.SetNameLabel(Value: PEdgeLabelView);
begin
  if FNameLabel <> Value then begin
    RemoveSubView(FNameLabel);
    FNameLabel := Value;
    if FNameLabel <> nil then InitializeNameLabel(FNameLabel);
    AddSubView(FNameLabel);
  end;
end;

procedure PUMLGeneralEdgeView.SetStereotypeLabel(Value: PEdgeLabelView);
begin
  if FStereotypeLabel <> Value then begin
    RemoveSubView(FStereotypeLabel);
    FStereotypeLabel := Value;
    if FStereotypeLabel <> nil then InitializeStereotypeLabel(FStereotypeLabel);
    AddSubView(FStereotypeLabel);
  end;
end;

procedure PUMLGeneralEdgeView.SetPropertyLabel(Value: PEdgeLabelView);
begin
  if FPropertyLabel <> Value then begin
    RemoveSubView(FPropertyLabel);
    FPropertyLabel := Value;
    if FPropertyLabel <> nil then InitializePropertyLabel(FPropertyLabel);
    AddSubView(FPropertyLabel);
  end;
end;

procedure PUMLGeneralEdgeView.Update;
var
  M: PUMLModelElement;
begin
  if Model = nil then Exit;
  inherited;
  FNameLabel.Text := Model.Name;
  if Model is PUMLModelElement then begin
    M := Model as PUMLModelElement;
    if M.StereotypeName = '' then
      FStereotypeLabel.Text := ''
    else
      FStereotypeLabel.Text := '<<' + M.StereotypeName + '>>';
    FPropertyLabel.Text := GetPropertyString(M);
  end;
end;

procedure PUMLGeneralEdgeView.AfterLoad(Reader: PObjectReader);
begin
  inherited;
  // StarUML
  if PropertyLabel = nil then begin
    PropertyLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
    PropertyLabel.EdgePosition := epMiddle;
    PropertyLabel.Distance := 15;
    PropertyLabel.Alpha := - PI / 2;
    PropertyLabel.Model := Model;
  end;
end;

procedure PUMLGeneralEdgeView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  NameLabel.Visible := (NameLabel.Text <> '');
  StereotypeLabel.Visible := (StereotypeLabel.Text <> '');
  PropertyLabel.Visible := ShowProperty and (PropertyLabel.Text <> '');
end;

function PUMLGeneralEdgeView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'ShowProperty' then begin
    Result := BooleanToString(ShowProperty);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PUMLGeneralEdgeView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'ShowProperty' then begin
    ShowProperty := StringToBoolean(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PUMLGeneralEdgeView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'NameLabel' then begin
    Result := NameLabel;
  end
  else if Name = 'StereotypeLabel' then begin
    Result := StereotypeLabel;
  end
  else if Name = 'PropertyLabel' then begin
    Result := PropertyLabel;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLGeneralEdgeView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'NameLabel' then begin
    NameLabel := Value as PEdgeLabelView;
  end
  else if Name = 'StereotypeLabel' then begin
    StereotypeLabel := Value as PEdgeLabelView;
  end
  else if Name = 'PropertyLabel' then begin
    PropertyLabel := Value as PEdgeLabelView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLGeneralEdgeView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAttributeCompartmentView

constructor PUMLAttributeCompartmentView.Create;
begin
  inherited;
  Selectable := False;
end;

function PUMLAttributeCompartmentView.GetShowVisibility: Boolean;
begin
  Result := True;
  if Parent is PUMLClassifierView then
    Result := (Parent as PUMLClassifierView).ShowCompartmentVisibility;
end;

function PUMLAttributeCompartmentView.GetShowStereotype: Boolean;
begin
  Result := True;
  if Parent is PUMLClassifierView then
    Result := (Parent as PUMLClassifierView).ShowCompartmentStereotype;
end;

function PUMLAttributeCompartmentView.GetCompartmentItemCount: Integer;
begin
  Result := 0;
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLClassifier);
  // ASSERTION
  Result := (Model as PUMLClassifier).AttributeCount;
end;

function PUMLAttributeCompartmentView.GetCompartmentItemText(Index: Integer): string;
var
  M: PUMLAttribute;
  SL: TStringList;
  S, PS: string;
  Ordering: string;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION

  Result := '';
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLClassifier);
  // ASSERTION

  M := (Model as PUMLClassifier).Attributes[Index];

  S := '';
  // Stereotype
  if ShowStereotype then begin
    if M.StereotypeName <> '' then S := S + '<<' + M.StereotypeName + '>>';
  end;
  // Visibility Symbol
  if ShowVisibility then begin
    S := S + VisibilityToSymbol(M.Visibility);
  end;
  // Name
  S := S + M.Name;
  // Type
  if Assigned(M.Type_) then
    S := S + ': ' + M.Type_.Name
  else if Trim(M.TypeExpression) <> '' then
    S := S + ': ' + M.TypeExpression;
  // Multiplicity
  if M.Ordering = okOrdered then Ordering := ' ordered' else Ordering := '';
  if Trim(M.Multiplicity) <> '' then begin
    S := S + '[' + M.Multiplicity + Ordering + ']';
  end;
  // Initial Value
  if M.InitialValue <> '' then
    S := S + ' = ' + M.InitialValue;
  // Changability & Properties
  if ShowProperty then begin
    SL := TStringList.Create;
    try
      if M.Changeability = ckFrozen then
        SL.Add('frozen')
      else if M.Changeability = ckAddOnly then
        SL.Add('addOnly');
      PS := GetPropertyString(M, SL);
      if PS <> '' then
        S := S + ' ' + PS;
    finally
      SL.Free;
    end;
  end;
  Result := S;
end;

function PUMLAttributeCompartmentView.GetCompartmentItemFontStyle(Index: Integer): TFontStyles;
var
  M: PUMLAttribute;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION

  Result := [];
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLClassifier);
  // ASSERTION

  M := (Model as PUMLClassifier).Attributes[Index];
  if M.OwnerScope = skClassifier then Result := [fsUnderline]
                                 else Result := [];
end;

procedure PUMLAttributeCompartmentView.DrawObject(Canvas: PCanvas);
begin
  inherited;
  Canvas.MoveTo(Left, Top);
  Canvas.LineTo(Right, Top);
end;

// PUMLAttributeCompartmentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLOperationCompartmentView

constructor PUMLOperationCompartmentView.Create;
begin
  inherited;
  Selectable := False;
end;

function PUMLOperationCompartmentView.GetShowVisibility: Boolean;
begin
  Result := True;
  if Parent is PUMLClassifierView then
    Result := (Parent as PUMLClassifierView).ShowCompartmentVisibility
  else if Parent is PUMLSubsystemView then
    Result := (Parent as PUMLSubsystemView).ShowCompartmentVisibility
  else if Parent is PUMLEnumerationView then
    Result := (Parent as PUMLEnumerationView).ShowCompartmentVisibility;
  // or using MOF is available.
end;

function PUMLOperationCompartmentView.GetShowStereotype: Boolean;
begin
  Result := True;
  if Parent is PUMLClassifierView then
    Result := (Parent as PUMLClassifierView).ShowCompartmentStereotype
  else if Parent is PUMLSubsystemView then
    Result := (Parent as PUMLSubsystemView).ShowCompartmentStereotype
  else if Parent is PUMLEnumerationView then
    Result := (Parent as PUMLEnumerationView).ShowCompartmentStereotype;
end;

function PUMLOperationCompartmentView.GetShowSignature: Boolean;
begin
  Result := True;
  if Parent is PUMLClassifierView then
    Result := (Parent as PUMLClassifierView).ShowOperationSignature
  else if Parent is PUMLSubsystemView then
    Result := (Parent as PUMLSubsystemView).ShowOperationSignature
  else if Parent is PUMLEnumerationView then
    Result := (Parent as PUMLEnumerationView).ShowOperationSignature;
end;

function PUMLOperationCompartmentView.GetCompartmentItemCount: Integer;
begin
  Result := 0;
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLClassifier);
  // ASSERTION
  Result := (Model as PUMLClassifier).OperationCount;
end;

function PUMLOperationCompartmentView.GetCompartmentItemText(Index: Integer): string;
var
  M: PUMLOperation;
  MParam: PUMLParameter;
  S, PS: string;
  RetStr: string;
  Sig, Ret: Boolean;
  I: Integer;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION
  Result := '';

  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLClassifier);
  // ASSERTION

  M := (Model as PUMLClassifier).Operations[Index];
  S := '';
  // Stereotype
  if ShowStereotype then begin
    if M.StereotypeName <> '' then S := S + '<<' + M.StereotypeName + '>>';
  end;
  // Visibility Symbol
  if ShowVisibility then begin
    S := S + VisibilityToSymbol(M.Visibility);
  end;
  S := S + M.Name;
  // Signature
  if ShowSignature then begin
    RetStr := '';
    Sig := False;
    Ret := False;
    S := S + '(';
    for I := 0 to M.ParameterCount - 1 do begin
      MParam := M.Parameters[I];
      if (not Ret) and (MParam.DirectionKind = pdkReturn) then begin
        Ret := True;
        if Assigned(MParam.Type_) then
          RetStr := MParam.Type_.Name
        else
          RetStr := MParam.TypeExpression;
      end
      else begin
        if Sig then
          S := S + ', ';
        Sig := True;
        case MParam.DirectionKind of
          pdkIn: S := S + ''; // ommitted
          pdkOut: S := S + 'out ';
          pdkInout: S := S + 'inout ';
        end;
        S := S + MParam.Name;
        if Assigned(MParam.Type_) then S := S + ': ' + MParam.Type_.Name
        else if Trim(MParam.TypeExpression) <> '' then S := S + ': ' + MParam.TypeExpression;
        if Trim(MParam.DefaultValue) <> '' then S := S + ' = ' + MParam.DefaultValue;
      end;
    end;
    S := S + ')';
    if RetStr <> '' then
      S := S + ': ' + RetStr;
  end
  else
    S := S + '()';
  // Raised Signals
  if M.RaisedSignalCount > 0 then begin
    S := S + ' raises ' + M.RaisedSignals[0].Name;
    for I := 1 to M.RaisedSignalCount - 1 do
      S := S + ', ' + M.RaisedSignals[I].Name;
  end;
  // Properties
  if ShowProperty then begin
    PS := GetPropertyString(M);
    if PS <> '' then
      S := S + ' ' + PS;
  end;      
  Result := S;
end;

function PUMLOperationCompartmentView.GetCompartmentItemFontStyle(Index: Integer): TFontStyles;
var
  M: PUMLOperation;
  S: TFontStyles;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION
  Result := [];

  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLClassifier);
  // ASSERTION

  M := (Model as PUMLClassifier).Operations[Index];
  S := [];
  if M.OwnerScope = skClassifier then
    S := S + [fsUnderline];
  if M.IsAbstract then
    S := S + [fsItalic];
  Result := S;
end;

procedure PUMLOperationCompartmentView.DrawObject(Canvas: PCanvas);
begin
  inherited;
  Canvas.MoveTo(Left, Top);
  Canvas.LineTo(Right, Top);
end;

// PUMLOperationCompartmentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLEnumerationLiteralCompartmentView

constructor PUMLEnumerationLiteralCompartmentView.Create;
begin
  inherited;
  Selectable := False;
end;

function PUMLEnumerationLiteralCompartmentView.GetShowVisibility: Boolean;
begin
  Result := True;
  if Parent is PUMLEnumerationView then
    Result := (Parent as PUMLEnumerationView).ShowCompartmentVisibility;
end;

function PUMLEnumerationLiteralCompartmentView.GetShowStereotype: Boolean;
begin
  Result := True;
  if Parent is PUMLEnumerationView then
    Result := (Parent as PUMLEnumerationView).ShowCompartmentStereotype;
end;

function PUMLEnumerationLiteralCompartmentView.GetCompartmentItemCount: Integer;
begin
  Result := 0;
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLEnumeration);
  // ASSERTION
  Result := (Model as PUMLEnumeration).LiteralCount;
end;

function PUMLEnumerationLiteralCompartmentView.GetCompartmentItemText(Index: Integer): string;
var
  M: PUMLEnumerationLiteral;
  S, PS: string;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION
  Result := '';

  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLEnumeration);
  // ASSERTION

  M := (Model as PUMLEnumeration).Literals[Index];
  S := '';
  // Stereotype
  if ShowStereotype then begin
    if M.StereotypeName <> '' then S := S + '<<' + M.StereotypeName + '>>';
  end;
  // Visibility Symbol
  if ShowVisibility then begin
    S := S + VisibilityToSymbol(M.Visibility);
  end;
  S := S + M.Name;
  // Properties
  if ShowProperty then begin
    PS := GetPropertyString(M);
    if PS <> '' then
      S := S + ' ' + PS;
  end;
  Result := S;
end;

procedure PUMLEnumerationLiteralCompartmentView.DrawObject(Canvas: PCanvas);
begin
  inherited;
  Canvas.MoveTo(Left, Top);
  Canvas.LineTo(Right, Top);
end;

// PUMLEnumerationLiteralCompartmentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLTemplateParameterCompartmentView

constructor PUMLTemplateParameterCompartmentView.Create;
begin
  inherited;
  Selectable := False;
end;

function PUMLTemplateParameterCompartmentView.GetCompartmentItemCount: Integer;
begin
  Result := 0;
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLModelElement);
  // ASSERTION
  Result := (Model as PUMLModelElement).TemplateParameterCount;
end;

function PUMLTemplateParameterCompartmentView.GetCompartmentItemText(Index: Integer): string;
var
  M: PUMLTemplateParameter;
  S, PS: string;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION
  Result := '';

  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLModelElement);
  // ASSERTION

  M := (Model as PUMLModelElement).TemplateParameters[Index];
  S := '';

  S := M.Name;
  if M.ParameterType <> '' then
    S := S + ' : ' + M.ParameterType;
  if M.DefaultValue <> '' then
    S := S + ' = ' + M.DefaultValue;
  if ShowProperty then begin
    PS := GetPropertyString(M);
    if PS <> '' then
      S := S + ' ' + PS;
  end;      

  Result := S;
end;

procedure PUMLTemplateParameterCompartmentView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Pen.Style := psDot;
  Canvas.Rectangle(Left, Top, Right, Bottom);
  Canvas.Pen.Style := psSolid;
  inherited;
end;

// PUMLTemplateParameterCompartmentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLClassifierView

constructor PUMLClassifierView.Create;
begin
  inherited;
  FAttributeCompartment := nil;
  FOperationCompartment := nil;
  FShowCompartmentStereotype := True;
  FShowCompartmentVisibility := True;
  FShowOperationSignature := True;
end;

procedure PUMLClassifierView.Setup;
begin
  inherited;
  NameCompartment.NameLabel.FontStyle := [fsBold];
  AttributeCompartment := MetaModel.CreateInstance('UMLAttributeCompartmentView') as PUMLAttributeCompartmentView;
  AttributeCompartment.Model := Model;
  OperationCompartment := MetaModel.CreateInstance('UMLOperationCompartmentView') as PUMLOperationCompartmentView;
  OperationCompartment.Model := Model;
end;

procedure PUMLClassifierView.InitializeAttributeCompartment(AAttributeCompartment: PUMLAttributeCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AAttributeCompartment.Selectable := False;
  AAttributeCompartment.ParentLineColor := True;
  AAttributeCompartment.ParentFillColor := True;
  AAttributeCompartment.ParentFontFace := True;
  AAttributeCompartment.ParentFontSize := True;
  AAttributeCompartment.ParentFontColor := True;
  AAttributeCompartment.ParentFontStyle := True;
end;

procedure PUMLClassifierView.InitializeOperationCompartment(AOperationCompartment: PUMLOperationCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AOperationCompartment.Selectable := False;
  AOperationCompartment.ParentLineColor := True;
  AOperationCompartment.ParentFillColor := True;
  AOperationCompartment.ParentFontFace := True;
  AOperationCompartment.ParentFontSize := True;
  AOperationCompartment.ParentFontColor := True;
  AOperationCompartment.ParentFontStyle := False;
end;

procedure PUMLClassifierView.SetSuppressAttributes(Value: Boolean);
begin
  AttributeCompartment.Visible := not Value;
end;

procedure PUMLClassifierView.SetSuppressOperations(Value: Boolean);
begin
  OperationCompartment.Visible := not Value;
end;

function PUMLClassifierView.GetSuppressAttributes: Boolean;
begin
  Result := not AttributeCompartment.Visible;
end;

function PUMLClassifierView.GetSuppressOperations: Boolean;
begin
  Result := not OperationCompartment.Visible;
end;

procedure PUMLClassifierView.SetShowOperationSignature(Value: Boolean);
begin
  if FShowOperationSignature <> Value then
    FShowOperationSignature := Value;
end;

procedure PUMLClassifierView.SetShowCompartmentStereotype(Value: Boolean);
begin
  if FShowCompartmentStereotype <> Value then
    FShowCompartmentStereotype := Value;
end;

procedure PUMLClassifierView.SetShowCompartmentVisibility(Value: Boolean);
begin
  if FShowCompartmentVisibility <> Value then
    FShowCompartmentVisibility := Value;
end;

procedure PUMLClassifierView.SetAttributeCompartment(Value: PUMLAttributeCompartmentView);
begin
  if FAttributeCompartment <> Value then begin
    RemoveSubView(FAttributeCompartment);
    FAttributeCompartment := Value;
    if FAttributeCompartment <> nil then InitializeAttributeCompartment(FAttributeCompartment);
    AddSubView(FAttributeCompartment);
  end;
end;

procedure PUMLClassifierView.SetOperationCompartment(Value: PUMLOperationCompartmentView);
begin
  if FOperationCompartment <> Value then begin
    RemoveSubView(FOperationCompartment);
    FOperationCompartment := Value;
    if FOperationCompartment <> nil then InitializeOperationCompartment(FOperationCompartment);
    AddSubView(FOperationCompartment);
  end;
end;

procedure PUMLClassifierView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
end;

procedure PUMLClassifierView.Update;
var
  M: PUMLClassifier;
begin
  if Model = nil then Exit;
  inherited;
  M := (Model as PUMLClassifier);
  if M.IsAbstract then
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle + [fsItalic]
  else
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle - [fsItalic];
  FAttributeCompartment.Update;
  FOperationCompartment.Update;
end;

procedure PUMLClassifierView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeObjectWithCompartments([AttributeCompartment, OperationCompartment], CLASSIFIER_MINWIDTH, CLASSIFIER_MINHEIGHT);
end;

procedure PUMLClassifierView.ArrangeIconicObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeIconicObjectWithCompartments([AttributeCompartment, OperationCompartment], ICONICVIEW_MINWIDTH, ICONICVIEW_MINHEIGHT, FStereotypeIconMinWidth, FStereotypeIconMinWidth);
end;

procedure PUMLClassifierView.ArrangeDecorationObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeObjectWithCompartments([AttributeCompartment, OperationCompartment], DECORATIONVIEW_MINWIDTH, DECORATIONVIEW_MINHEIGHT);
end;

function PUMLClassifierView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'SuppressAttributes' then begin
    Result := BooleanToString(SuppressAttributes);
  end
  else if Name = 'SuppressOperations' then begin
    Result := BooleanToString(SuppressOperations);
  end
  else if Name = 'ShowOperationSignature' then begin
    Result := BooleanToString(ShowOperationSignature);
  end
  else if Name = 'ShowCompartmentStereotype' then begin
    Result := BooleanToString(ShowCompartmentStereotype);
  end
  else if Name = 'ShowCompartmentVisibility' then begin
    Result := BooleanToString(ShowCompartmentVisibility);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PUMLClassifierView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'SuppressAttributes' then begin
    SuppressAttributes := StringToBoolean(Value);
  end
  else if Name = 'SuppressOperations' then begin
    SuppressOperations := StringToBoolean(Value);
  end
  else if Name = 'ShowOperationSignature' then begin
    ShowOperationSignature := StringToBoolean(Value);
  end
  else if Name = 'ShowCompartmentStereotype' then begin
    ShowCompartmentStereotype := StringToBoolean(Value);
  end
  else if Name = 'ShowCompartmentVisibility' then begin
    ShowCompartmentVisibility := StringToBoolean(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PUMLClassifierView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'AttributeCompartment' then begin
    Result := AttributeCompartment;
  end
  else if Name = 'OperationCompartment' then begin
    Result := OperationCompartment;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLClassifierView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'AttributeCompartment' then begin
    AttributeCompartment := Value as PUMLAttributeCompartmentView;
  end
  else if Name = 'OperationCompartment' then begin
    OperationCompartment := Value as PUMLOperationCompartmentView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLClassifierView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLPackageView

procedure PUMLPackageView.DrawObject(Canvas: PCanvas);
var
  TabRightX, TabBottomY: Integer;
begin
  AssignStyleToCanvas(Canvas);
  TabRightX := Left + (Right - Left) * 2 div 5;
  TabBottomY := Top + PACKAGE_TAB_HEIGHT;
  Canvas.Rectangle(Left, Top, TabRightX, TabBottomY);
  Canvas.Rectangle(Left, TabBottomY-1, Right, Bottom);
end;

procedure PUMLPackageView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  MinWidth := Max(NameCompartment.MinWidth, PACKAGE_MINWIDTH);
  MinHeight := Max(PACKAGE_TAB_HEIGHT + NameCompartment.MinHeight + COMPARTMENT_INTERVAL, PACKAGE_MINHEIGHT);
  NameCompartment.Top := Top + PACKAGE_TAB_HEIGHT;
end;

procedure PUMLPackageView.Update;
var
  M: PUMLPackage;
begin
  if Model = nil then Exit;
  inherited;
  M := (Model as PUMLPackage);
  if M.IsAbstract then
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle + [fsItalic]
  else
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle - [fsItalic];
end;

// PUMLPackageView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSubsystemView

constructor PUMLSubsystemView.Create;
begin
  inherited;
  FOperationCompartment := nil;
  FShowCompartmentStereotype := True;
  FShowCompartmentVisibility := True;
  FShowOperationSignature := True;
end;

procedure PUMLSubsystemView.InitializeOperationCompartment(AOperationCompartment: PUMLOperationCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AOperationCompartment.Selectable := False;
  AOperationCompartment.ParentLineColor := True;
  AOperationCompartment.ParentFillColor := True;
  AOperationCompartment.ParentFontFace := True;
  AOperationCompartment.ParentFontSize := True;
  AOperationCompartment.ParentFontColor := True;
  AOperationCompartment.ParentFontStyle := False;
end;

procedure PUMLSubsystemView.SetSuppressOperations(Value: Boolean);
begin
  OperationCompartment.Visible := not Value;
end;

function PUMLSubsystemView.GetSuppressOperations: Boolean;
begin
  Result := not OperationCompartment.Visible;
end;

procedure PUMLSubsystemView.SetShowOperationSignature(Value: Boolean);
begin
  if FShowOperationSignature <> Value then
    FShowOperationSignature := Value;
end;

procedure PUMLSubsystemView.SetShowCompartmentStereotype(Value: Boolean);
begin
  if FShowCompartmentStereotype <> Value then
    FShowCompartmentStereotype := Value;
end;

procedure PUMLSubsystemView.SetShowCompartmentVisibility(Value: Boolean);
begin
  if FShowCompartmentVisibility <> Value then
    FShowCompartmentVisibility := Value;
end;

procedure PUMLSubsystemView.SetOperationCompartment(Value: PUMLOperationCompartmentView);
begin
  if FOperationCompartment <> Value then begin
    RemoveSubView(FOperationCompartment);
    FOperationCompartment := Value;
    if FOperationCompartment <> nil then InitializeOperationCompartment(FOperationCompartment);
    AddSubView(FOperationCompartment);
  end;
end;

procedure PUMLSubsystemView.DrawObject(Canvas: PCanvas);
var
  TextBoxRight_X: Integer;
begin
  inherited;
  TextBoxRight_X := Left + (Right - Left) * 2 div 5;
  Canvas.PolyLine([Point(TextBoxRight_X-8, Top+3), Point(TextBoxRight_X-8, Top+7)]);
  Canvas.MoveTo(TextBoxRight_X-11, Top+11);
  Canvas.LineTo(TextBoxRight_X-11, Top+7);
  Canvas.LineTo(TextBoxRight_X-5, Top+7);

  Canvas.MoveTo(TextBoxRight_X-5, Top+11);
  Canvas.LineTo(TextBoxRight_X-5, Top+7);
  Canvas.LineTo(TextBoxRight_X-11, Top+7);
end;

procedure PUMLSubsystemView.ArrangeObject(Canvas: PCanvas);
var
  W, H: Integer;
begin
  inherited;
  W := Max(MinWidth, OperationCompartment.MinWidth);
  H := PACKAGE_TAB_HEIGHT + NameCompartment.MinHeight + COMPARTMENT_INTERVAL;
  if OperationCompartment.Visible then
    H := H + OperationCompartment.MinHeight + COMPARTMENT_INTERVAL;
  MinWidth := Max(W, PACKAGE_MINWIDTH);
  MinHeight := Max(H, PACKAGE_MINHEIGHT);
  OperationCompartment.Left := Left;
  OperationCompartment.Top := NameCompartment.Bottom + COMPARTMENT_INTERVAL;
  OperationCompartment.Right := Right;
end;

procedure PUMLSubsystemView.ArrangeIconicObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeIconicObjectWithCompartments([OperationCompartment], ICONICVIEW_MINWIDTH, ICONICVIEW_MINHEIGHT, FStereotypeIconMinWidth, FStereotypeIconMinWidth);
end;

procedure PUMLSubsystemView.Setup;
begin
  inherited;
  NameCompartment.NameLabel.FontStyle := [fsBold];
  OperationCompartment := MetaModel.CreateInstance('UMLOperationCompartmentView') as PUMLOperationCompartmentView;
  OperationCompartment.Model := Model;
end;

procedure PUMLSubsystemView.ArrangeDecorationObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeObjectWithCompartments([OperationCompartment], GENERALNODE_MINWIDTH, GENERALNODE_MINHEIGHT);
end;

procedure PUMLSubsystemView.Update;
var
  M: PUMLSubsystem;
begin
  if Model = nil then Exit;
  inherited;
  M := (Model as PUMLSubsystem);
  if M.IsAbstract then
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle + [fsItalic]
  else
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle - [fsItalic];
  OperationCompartment.Update;
end;

function PUMLSubsystemView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'SuppressOperations' then begin
    Result := BooleanToString(SuppressOperations);
  end
  else if Name = 'ShowOperationSignature' then begin
    Result := BooleanToString(ShowOperationSignature);
  end
  else if Name = 'ShowCompartmentStereotype' then begin
    Result := BooleanToString(ShowCompartmentStereotype);
  end
  else if Name = 'ShowCompartmentVisibility' then begin
    Result := BooleanToString(ShowCompartmentVisibility);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PUMLSubsystemView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'SuppressOperations' then begin
    SuppressOperations := StringToBoolean(Value);
  end
  else if Name = 'ShowOperationSignature' then begin
    ShowOperationSignature := StringToBoolean(Value);
  end
  else if Name = 'ShowCompartmentStereotype' then begin
    ShowCompartmentStereotype := StringToBoolean(Value);
  end
  else if Name = 'ShowCompartmentVisibility' then begin
    ShowCompartmentVisibility := StringToBoolean(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PUMLSubsystemView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'OperationCompartment' then begin
    Result := OperationCompartment;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLSubsystemView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'OperationCompartment' then begin
    OperationCompartment := Value as PUMLOperationCompartmentView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLSubsystemView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLModelView

procedure PUMLModelView.DrawObject(Canvas: PCanvas);
var
  TabRightX: Integer;
begin
  inherited;
  TabRightX := Left + (Right - Left) * 2 div 5;
  Canvas.PolyLine([Point(TabRightX-9, Top+3), Point(TabRightX-15, Top+10),
                   Point(TabRightX-3, Top+10), Point(TabRightX-9, Top+3)]);
end;

procedure PUMLModelView.Update;
var
  M: PUMLModel;
begin
  if Model = nil then Exit;
  inherited;
  M := (Model as PUMLModel);
  if M.IsAbstract then
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle + [fsItalic]
  else
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle - [fsItalic];
end;

// PUMLModelView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLEnumerationView

constructor PUMLEnumerationView.Create;
begin
  inherited;
  FEnumerationLiteralCompartment := nil;
  FOperationCompartment := nil;
end;

procedure PUMLEnumerationView.InitializeLiteralCompartment(ALiteralCompartment: PUMLEnumerationLiteralCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ALiteralCompartment.Selectable := False;
  ALiteralCompartment.ParentLineColor := True;
  ALiteralCompartment.ParentFillColor := True;
  ALiteralCompartment.ParentFontFace := True;
  ALiteralCompartment.ParentFontSize := True;
  ALiteralCompartment.ParentFontColor := True;
  ALiteralCompartment.ParentFontStyle := True;
end;

procedure PUMLEnumerationView.InitializeOperationCompartment(AOperationCompartment: PUMLOperationCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AOperationCompartment.Selectable := False;
  AOperationCompartment.ParentLineColor := True;
  AOperationCompartment.ParentFillColor := True;
  AOperationCompartment.ParentFontFace := True;
  AOperationCompartment.ParentFontSize := True;
  AOperationCompartment.ParentFontColor := True;
  AOperationCompartment.ParentFontStyle := False;
end;

procedure PUMLEnumerationView.SetSuppressLiterals(Value: Boolean);
begin
  EnumerationLiteralCompartment.Visible := not Value;
end;

procedure PUMLEnumerationView.SetSuppressOperations(Value: Boolean);
begin
  OperationCompartment.Visible := not Value;
end;

function PUMLEnumerationView.GetSuppressLiterals: Boolean;
begin
  Result := not EnumerationLiteralCompartment.Visible;
end;

function PUMLEnumerationView.GetSuppressOperations: Boolean;
begin
  Result := not OperationCompartment.Visible;
end;

procedure PUMLEnumerationView.SetShowOperationSignature(Value: Boolean);
begin
  if FShowOperationSignature <> Value then
    FShowOperationSignature := Value;
end;

procedure PUMLEnumerationView.SetShowCompartmentStereotype(Value: Boolean);
begin
  if FShowCompartmentStereotype <> Value then
    FShowCompartmentStereotype := Value;
end;

procedure PUMLEnumerationView.SetShowCompartmentVisibility(Value: Boolean);
begin
  if FShowCompartmentVisibility <> Value then
    FShowCompartmentVisibility := Value;
end;

procedure PUMLEnumerationView.SetEnumerationLiteralCompartment(Value: PUMLEnumerationLiteralCompartmentView);
begin
  if FEnumerationLiteralCompartment <> Value then begin
    RemoveSubView(FEnumerationLiteralCompartment);
    FEnumerationLiteralCompartment := Value;
    if FEnumerationLiteralCompartment <> nil then InitializeLiteralCompartment(FEnumerationLiteralCompartment);
    AddSubView(FEnumerationLiteralCompartment);
  end;
end;

procedure PUMLEnumerationView.SetOperationCompartment(Value: PUMLOperationCompartmentView);
begin
  if FOperationCompartment <> Value then begin
    RemoveSubView(FOperationCompartment);
    FOperationCompartment := Value;
    if FOperationCompartment <> nil then InitializeOperationCompartment(FOperationCompartment);
    AddSubView(FOperationCompartment);
  end;
end;

procedure PUMLEnumerationView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
end;

procedure PUMLEnumerationView.Update;
var
  M: PUMLEnumeration;
begin
  if Model = nil then Exit;
  inherited;
  if IsIconicView then
    NameCompartment.StereotypeLabel.Text := ''
  else
    NameCompartment.StereotypeLabel.Text := '<<enumeration>>';
  M := (Model as PUMLEnumeration);
  if M.IsAbstract then
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle + [fsItalic]
  else
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle - [fsItalic];
  FEnumerationLiteralCompartment.Update;
  FOperationCompartment.Update;
end;

procedure PUMLEnumerationView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeObjectWithCompartments([EnumerationLiteralCompartment, OperationCompartment], CLASSIFIER_MINWIDTH, CLASSIFIER_MINHEIGHT);
end;

procedure PUMLEnumerationView.ArrangeIconicObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeIconicObjectWithCompartments([EnumerationLiteralCompartment, OperationCompartment], ICONICVIEW_MINWIDTH, ICONICVIEW_MINHEIGHT, INTERFACE_ICONMINWIDTH, INTERFACE_ICONMINHEIGHT);
end;

procedure PUMLEnumerationView.ArrangeDecorationObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeObjectWithCompartments([EnumerationLiteralCompartment, OperationCompartment], CLASSIFIER_MINWIDTH, CLASSIFIER_MINHEIGHT);
end;

procedure PUMLEnumerationView.Setup;
begin
  inherited;
  NameCompartment.NameLabel.FontStyle := [fsBold];
  EnumerationLiteralCompartment := MetaModel.CreateInstance('UMLEnumerationLiteralCompartmentView') as PUMLEnumerationLiteralCompartmentView;
  EnumerationLiteralCompartment.Model := Model;
  OperationCompartment := MetaModel.CreateInstance('UMLOperationCompartmentView') as PUMLOperationCompartmentView;
  OperationCompartment.Model := Model;
end;

function PUMLEnumerationView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'SuppressLiterals' then begin
    Result := BooleanToString(SuppressLiterals);
  end
  else if Name = 'SuppressOperations' then begin
    Result := BooleanToString(SuppressOperations);
  end
  else if Name = 'ShowOperationSignature' then begin
    Result := BooleanToString(ShowOperationSignature);
  end
  else if Name = 'ShowCompartmentStereotype' then begin
    Result := BooleanToString(ShowCompartmentStereotype);
  end
  else if Name = 'ShowCompartmentVisibility' then begin
    Result := BooleanToString(ShowCompartmentVisibility);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PUMLEnumerationView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'SuppressLiterals' then begin
    SuppressLiterals := StringToBoolean(Value);
  end
  else if Name = 'SuppressOperations' then begin
    SuppressOperations := StringToBoolean(Value);
  end
  else if Name = 'ShowOperationSignature' then begin
    ShowOperationSignature := StringToBoolean(Value);
  end
  else if Name = 'ShowCompartmentStereotype' then begin
    ShowCompartmentStereotype := StringToBoolean(Value);
  end
  else if Name = 'ShowCompartmentVisibility' then begin
    ShowCompartmentVisibility := StringToBoolean(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PUMLEnumerationView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'EnumerationLiteralCompartment' then begin
    Result := EnumerationLiteralCompartment;
  end
  else if Name = 'OperationCompartment' then begin
    Result := OperationCompartment;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLEnumerationView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'EnumerationLiteralCompartment' then begin
    EnumerationLiteralCompartment := Value as PUMLEnumerationLiteralCompartmentView;
  end
  else if Name = 'OperationCompartment' then begin
    OperationCompartment := Value as PUMLOperationCompartmentView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLEnumerationView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLClassView

constructor PUMLClassView.Create;
begin
  inherited;
  FTemplateParameterCompartment := nil;
end;

procedure PUMLClassView.InitializeTemplateParameterCompartment(ATemplateParameterCompartment: PUMLTemplateParameterCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ATemplateParameterCompartment.Selectable := False;
  ATemplateParameterCompartment.ParentLineColor := True;
  ATemplateParameterCompartment.ParentFillColor := True;
  ATemplateParameterCompartment.ParentFontFace := True;
  ATemplateParameterCompartment.ParentFontSize := True;
  ATemplateParameterCompartment.ParentFontColor := True;
  ATemplateParameterCompartment.ParentFontStyle := True;
end;

procedure PUMLClassView.SetTemplateParameterCompartment(Value: PUMLTemplateParameterCompartmentView);
begin
  if FTemplateParameterCompartment <> Value then begin
    RemoveSubView(FTemplateParameterCompartment);
    FTemplateParameterCompartment := Value;
    if FTemplateParameterCompartment <> nil then InitializeTemplateParameterCompartment(FTemplateParameterCompartment);
    AddSubView(FTemplateParameterCompartment);
  end;
end;

function PUMLClassView.IsActiveClass: Boolean;
begin
  Result := False;
  if (Model <> nil) and (Model is PUMLClass) then
    Result := (Model as PUMLClass).IsActive;
end;

procedure PUMLClassView.DrawObject(Canvas: PCanvas);
var
  R: TRect;
begin
  AssignStyleToCanvas(Canvas);
  if TemplateParameterCompartment.Visible then begin
    R.Left := Left;
    R.Top := Top + TemplateParameterCompartment.Height - TEMPLATEPARAMETERCOMPARTMENT_OVERLAP;
    R.Right := Right - TEMPLATEPARAMETERCOMPARTMENT_RIGHT_OCCUPY;
    R.Bottom := Bottom;
  end
  else begin
    R.Left := Left;
    R.Top := Top;
    R.Right := Right;
    R.Bottom := Bottom;
  end;
  Canvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
  if IsActiveClass then begin
    Canvas.MoveTo(R.Left + CLASS_ACTIVE_VERTLINE_WIDTH, R.Top);
    Canvas.LineTo(R.Left + CLASS_ACTIVE_VERTLINE_WIDTH, R.Bottom);
    Canvas.MoveTo(R.Right - CLASS_ACTIVE_VERTLINE_WIDTH - 1, R.Top);
    Canvas.LineTo(R.Right - CLASS_ACTIVE_VERTLINE_WIDTH - 1, R.Bottom);
  end;
end;

procedure PUMLClassView.ArrangeObject(Canvas: PCanvas);
var
  R: TRect;
begin
  inherited;
  MeasureObjectMinSize([AttributeCompartment, OperationCompartment], GENERALNODE_MINWIDTH, GENERALNODE_MINHEIGHT);
  if TemplateParameterCompartment.Visible then begin
    MinWidth := Max(MinWidth, TemplateParameterCompartment.MinWidth) + TEMPLATEPARAMETERCOMPARTMENT_LEFT_MARGIN + TEMPLATEPARAMETERCOMPARTMENT_RIGHT_OCCUPY;
    MinHeight := MinHeight + TemplateParameterCompartment.MinHeight - TEMPLATEPARAMETERCOMPARTMENT_OVERLAP;
  end;
  if IsActiveClass then
    MinWidth := MinWidth + CLASS_ACTIVE_VERTLINE_WIDTH * 2;

  R := Rect(Left, Top, Right, Bottom);
  TemplateParameterCompartment.Left := Right - TEMPLATEPARAMETERCOMPARTMENT_RIGHT_OCCUPY - TemplateParameterCompartment.MinWidth;
  TemplateParameterCompartment.Top := Top;
  TemplateParameterCompartment.Right := Right;
  if TemplateParameterCompartment.Visible then
    R := Rect(R.Left, R.Top + TemplateParameterCompartment.Height - TEMPLATEPARAMETERCOMPARTMENT_OVERLAP,
      R.Right - TEMPLATEPARAMETERCOMPARTMENT_RIGHT_OCCUPY, R.Bottom);
  if IsActiveClass then begin
    R.Left := R.Left + CLASS_ACTIVE_VERTLINE_WIDTH;
    R.Right := R.Right - CLASS_ACTIVE_VERTLINE_WIDTH;
  end;
  ArrangeCompartments([AttributeCompartment, OperationCompartment], R);
end;

procedure PUMLClassView.ArrangeIconicObject(Canvas: PCanvas);
begin
  inherited;
  TemplateParameterCompartment.Visible := False;
end;

procedure PUMLClassView.ArrangeDecorationObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeObject(Canvas);
end;

procedure PUMLClassView.Setup;
begin
  inherited;
  TemplateParameterCompartment := MetaModel.CreateInstance('UMLTemplateParameterCompartmentView') as PUMLTemplateParameterCompartmentView;
  TemplateParameterCompartment.Model := Model;
end;

procedure PUMLClassView.Update;
begin
  if Model = nil then Exit;
  inherited;
  TemplateParameterCompartment.Visible := ((Model as PUMLClass).TemplateParameterCount > 0);
  if (Model as PUMLClass).TemplateParameterCount > 0 then  TemplateParameterCompartment.Update;
end;

function PUMLClassView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'TemplateParameterCompartment' then begin
    Result := TemplateParameterCompartment;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLClassView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'TemplateParameterCompartment' then begin
    TemplateParameterCompartment := Value as PUMLTemplateParameterCompartmentView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLClassView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLInterfaceView

function PUMLInterfaceView.GetIconRect: TRect;
var
  IR, RR: Integer;
  W, H: Integer;
  X, Y: Integer;
begin
  RR := (Right - Left) * 100 div (NameCompartment.Top - Top);
  IR := 100;
  if RR >= IR then begin
    H := (NameCompartment.Top - Top);
    W := H * IR div 100;
    X := Left + (Right - Left - W) div 2;
    Y := Top;
  end
  else begin
    W := (Right - Left);
    H := W * 100 div IR;
    Y := Top + (NameCompartment.Top - Top - H) div 2;
    X := Left;
  end;
  Result := Rect(X, Y, X + W, Y + H);
end;

procedure PUMLInterfaceView.CollectSupplierRealizationViews(RealizationViews: POrderedSet);
var
  V: PView;
  I: Integer;
begin
  RealizationViews.Clear;
  for I := 0 to OwnerDiagramView.OwnedViewCount - 1 do begin
    V := OwnerDiagramView.OwnedView[I];
    if (V is PUMLRealizationView) and ((V as PUMLRealizationView).Head = Self) then
      RealizationViews.Add(V);

    // trials
    if (V is PUMLGeneralizationView) and
       (((V as PUMLGeneralizationView).Head = Self) or ((V as PUMLGeneralizationView).Tail = Self)) then
      RealizationViews.Add(V);

    if (V is PUMLAssociationView) and
       (((V as PUMLAssociationView).Head = Self) or ((V as PUMLAssociationView).Tail = Self)) then
      RealizationViews.Add(V);
      
  end;
end;

procedure PUMLInterfaceView.CollectSupplierDependencyViews(DependencyViews: POrderedSet);
var
  V: PView;
  I: Integer;
begin
  DependencyViews.Clear;
  for I := 0 to OwnerDiagramView.OwnedViewCount - 1 do begin
    V := OwnerDiagramView.OwnedView[I];
    if (V is PUMLDependencyView) and ((V as PUMLDependencyView).Head = Self) then
      DependencyViews.Add(V);
  end;
end;

procedure PUMLInterfaceView.DrawBallNotation(Canvas: PCanvas; R: TRect);
begin
  Canvas.Ellipse(R.Left, R.Top, R.Right, R.Bottom);
end;

procedure PUMLInterfaceView.DrawSocketNotation(Canvas: PCanvas; SupplierDependencyViews: POrderedSet);
var
  V: PUMLDependencyView;
  R: TRect;
  B, C, P, Q: TPoint;
  IR, RR: Integer;
  H, W, X, Y: Integer;
  T: Integer;
  I: Integer;
begin
  RR := (Right - Left) * 100 div (NameCompartment.Top - Top);
  IR := 100;
  if RR >= IR then begin
    H := (NameCompartment.Top - Top);
    W := H * IR div 100;
    X := Left + (Right - Left - W) div 2;
    Y := Top;
  end
  else begin
    W := (Right - Left);
    H := W * 100 div IR;
    Y := Top + (NameCompartment.Top - Top - H) div 2;
    X := Left;
  end;
  // R := Rect(X, Y, X + W, Y + H);
  R := self.GetIconRect;  // trial

  C := GetCenter(R);
  for I := 0 to SupplierDependencyViews.Count - 1 do begin
    V := SupplierDependencyViews.Items[I] as PUMLDependencyView;
    // ASSERTIONS
    //Assert(V.Tail = Self);
    // ASSERTIONS
    B := Junction(R, V.Points.Points[V.Points.Count - 1]);
    if (B.X = R.Right) and (B.Y >= R.Top) and (B.Y <= R.Bottom) then begin
      T := C.Y - B.Y;
      P := Point(C.X + T, R.Bottom);
      Q := Point(C.X - T, R.Top);
    end
    else if (B.Y = R.Top) and (B.X >= R.Left) and (B.X <= R.Right) then begin
      T := C.X - B.X;
      P := Point(R.Right, C.Y - T);
      Q := Point(R.Left, C.Y + T);
    end
    else if (B.X = R.Left) and (B.Y >= R.Top) and (B.Y <= R.Bottom) then begin
      T := B.Y - C.Y;
      P := Point(C.X - T, R.Top);
      Q := Point(C.X + T, R.Bottom);
    end
    else if (B.Y = R.Bottom) and (B.X >= R.Left) and (B.X <= R.Right) then begin
      T := B.X - C.X;
      P := Point(R.Left, C.Y + T);
      Q := Point(R.Right, C.Y - T);
    end
    else begin
      // Unknown points
    end;
    Canvas.Arc(R.Left, R.Top, R.Right, R.Bottom, P.X, P.Y, Q.X, Q.Y);
  end;
end;

procedure PUMLInterfaceView.DrawBallAndSocketNotation(Canvas: PCanvas; SupplierDependencyViews: POrderedSet);
var
  R: TRect;
begin
  R := GetIconRect;
  R := Rect(R.Left + 3, R.Top + 3, R.Right - 3, R.Bottom - 3);
  DrawBallNotation(Canvas, R);
  DrawSocketNotation(Canvas, SupplierDependencyViews);
end;

procedure PUMLInterfaceView.DrawDefaultIconicObject(Canvas: PCanvas);
var
  DepViews: POrderedSet;
  RelViews: POrderedSet;
begin
  // PRECONDITION
  Assert((NameCompartment.Top - Top) <> 0, 'Arrange object needed');
  // PRECONDITION
  DepViews := POrderedSet.Create;
  RelViews := POrderedSet.Create;
  try
    CollectSupplierDependencyViews(DepViews);
    CollectSupplierRealizationViews(RelViews);
    if (DepViews.Count > 0) and (RelViews.Count > 0) then
      DrawBallAndSocketNotation(Canvas, DepViews)
    else if DepViews.Count > 0 then
      DrawSocketNotation(Canvas, DepViews)
    else
      DrawBallNotation(Canvas, GetIconRect);
  finally
    DepViews.Free;
    RelViews.Free;
  end;
end;

procedure PUMLInterfaceView.ArrangeDefaultIconicObject(Canvas: PCanvas);
begin
  ArrangeIconicObjectWithCompartments([AttributeCompartment, OperationCompartment], ICONICVIEW_MINWIDTH, ICONICVIEW_MINHEIGHT, INTERFACE_ICONMINWIDTH, INTERFACE_ICONMINHEIGHT);
end;

function PUMLInterfaceView.IsIconicView: Boolean;
begin
  Result := StereotypeDisplay = sdkIcon;
end;

function PUMLInterfaceView.IsDecorationView: Boolean;
begin
  Result := StereotypeDisplay = sdkDecoration;
end;

procedure PUMLInterfaceView.DrawDecorationIcon(Canvas: PCanvas; R: TRect);
var
  C: TPoint;
begin
  if StereotypeIcon = nil then begin
    C := CenterPoint(R);
    Canvas.Ellipse(C.X - 7, C.Y - 7, C.X + 7, C.Y + 7);
  end
  else
    DrawStereotypeIcon(Canvas, R);
end;

procedure PUMLInterfaceView.DrawIconicObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  if StereotypeIcon = nil then
    DrawDefaultIconicObject(Canvas)
  else
    DrawStereotypeIcon(Canvas, Rect(Left, Top, Right, NameCompartment.Top));
end;

procedure PUMLInterfaceView.ArrangeIconicObject(Canvas: PCanvas);
begin
  if StereotypeIcon = nil then
    ArrangeDefaultIconicObject(Canvas)
  else
    inherited;
end;

procedure PUMLInterfaceView.Update;
begin
  if Model = nil then Exit;
  inherited;
  if StereotypeDisplay = sdkIcon then
    NameCompartment.StereotypeLabel.Text := ''
  else
    NameCompartment.StereotypeLabel.Text := '<<interface>>';
end;

// PUMLInterfaceView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSignalView

procedure PUMLSignalView.Update;
begin
  if Model = nil then Exit;
  inherited;
  if IsIconicView then
    NameCompartment.StereotypeLabel.Text := ''
  else
    NameCompartment.StereotypeLabel.Text := '<<signal>>';
end;

// PUMLSignalView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLExceptionView

procedure PUMLExceptionView.Update;
begin
  if Model = nil then Exit;
  inherited;
  if IsIconicView then
    NameCompartment.StereotypeLabel.Text := ''
  else
    NameCompartment.StereotypeLabel.Text := '<<exception>>';
end;

// PUMLExceptionView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLArtifactView

procedure DrawArtifact(Canvas: PCanvas; R: TRect);
var
  W, H: Integer;
  X, Y: Integer;
begin
  W := R.Right - R.Left;
  H := R.Bottom - R.Top;
  X := R.Right - W * 30 div 100;
  Y := R.Top + W * 30 div 100;
  Canvas.Polygon([Point(R.Left, R.Top), Point(X, R.Top), Point(R.Right, Y), Point(R.Right, R.Bottom), Point(R.Left, R.Bottom)]);
  Canvas.Polygon([Point(X, R.Top), Point(X, Y), Point(R.Right, Y)]);
end;

procedure PUMLArtifactView.DrawDefaultIconicObject(Canvas: PCanvas);
var
  R: TRect;
  W: Integer;
begin
  R := Rect(Left, Top, Right, NameCompartment.Top);
  if ((R.Right - R.Left) * 100 div (R.Bottom - R.Top)) >= ARTIFACT_RATIO_PERCENT then begin
    W := ARTIFACT_RATIO_PERCENT * (R.Bottom - R.Top) div 100;
    R.Left := R.Left + ((Right - Left) - W) div 2;
    R.Right := R.Left + W;
  end;
  DrawArtifact(Canvas, R);
end;

function PUMLArtifactView.IsIconicView: Boolean;
begin
  Result := FStereotypeDisplay = sdkIcon;
end;

function PUMLArtifactView.IsDecorationView: Boolean;
begin
  Result := FStereotypeDisplay = sdkDecoration;
end;

procedure PUMLArtifactView.DrawDecorationIcon(Canvas: PCanvas; R: TRect);
begin
  if FStereotypeIcon = nil then begin
    Canvas.Polygon([Point(R.Left + 8, R.Top + 5), Point(R.Right - 11, R.Top + 5),
      Point(R.Right - 6, R.Top + 10), Point(R.Right - 6, R.Bottom - 5),
      Point(R.Left + 8, R.Bottom - 5), Point(R.Left + 8, R.Top + 5)]);
    Canvas.Polygon([Point(R.Right - 11, R.Top + 5), Point(R.Right - 6, R.Top + 10),
      Point(R.Right - 11, R.Top + 10), Point(R.Right - 11, R.Top + 5)]);
  end
  else
    DrawStereotypeIcon(Canvas, R);
end;

procedure PUMLArtifactView.DrawIconicObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  if StereotypeIcon = nil then
    DrawDefaultIconicObject(Canvas)
  else
    DrawStereotypeIcon(Canvas, Rect(Left, Top, Right, NameCompartment.Top));
end;

procedure PUMLArtifactView.ArrangeIconicObject(Canvas: PCanvas);
begin
  if StereotypeIcon = nil then
    ArrangeIconicObjectWithCompartments([AttributeCompartment, OperationCompartment], ICONICVIEW_MINWIDTH, ICONICVIEW_MINHEIGHT, ARTIFACT_ICONMINHEIGHT, ARTIFACT_ICONMINHEIGHT)
  else
    inherited;
end;

procedure PUMLArtifactView.Update;
begin
  if Model = nil then Exit;
  inherited;
  if IsIconicView then
    NameCompartment.StereotypeLabel.Text := ''
  else
    NameCompartment.StereotypeLabel.Text := '<<artifact>>';
end;

// PUMLArtifactView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PQualifierCompartment

constructor PUMLQualifierCompartmentView.Create;
begin
  inherited;
  Selectable := True;
  Sizable := szNone;
  Movable := mmNone;
end;

function PUMLQualifierCompartmentView.GetShowVisibility: Boolean;
begin
  Result := True;
  if Parent is PUMLAssociationView then
    Result := (Parent as PUMLAssociationView).ShowCompartmentVisibility;
end;

function PUMLQualifierCompartmentView.GetShowStereotype: Boolean;
begin
  Result := True;
  if Parent is PUMLAssociationView then
    Result := (Parent as PUMLAssociationView).ShowCompartmentStereotype;
end;

function PUMLQualifierCompartmentView.GetCompartmentItemCount: Integer;
begin
  Result := 0;
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLAssociationEnd);
  // ASSERTION
  Result := (Model as PUMLAssociationEnd).QualifierCount;
end;

function PUMLQualifierCompartmentView.GetCompartmentItemText(Index: Integer): string;
var
  M: PUMLAttribute;
  S, PS: string;
  Ordering: string;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION
  Result := '';

  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLAssociationEnd);
  // ASSERTION

  M := (Model as PUMLAssociationEnd).Qualifiers[Index];

  S := '';
  // Stereotype
  if ShowStereotype then begin
    if M.StereotypeName <> '' then S := S + '<<' + M.StereotypeName + '>>';
  end;
  // Visibility Symbol
  if ShowVisibility then begin
    S := S + VisibilityToSymbol(M.Visibility);
  end;
  // Name
  S := S + M.Name;
  // Type
  if Assigned(M.Type_) then
    S := S + ' : ' + M.Type_.Name
  else if Trim(M.TypeExpression) <> '' then
    S := S + ' : ' + M.TypeExpression;
  // Multiplicity
  if M.Ordering = okOrdered then Ordering := ' ordered' else Ordering := '';
  if Trim(M.Multiplicity) <> '' then begin
    S := S + '[' + M.Multiplicity + Ordering + ']';
  end;
  // Initial Value
  if M.InitialValue <> '' then
    S := S + ' = ' + M.InitialValue;
  // Properties
  if ShowProperty then begin
    PS := GetPropertyString(M);
    if PS <> '' then
      S := S + ' ' + PS;
  end;      
  Result := S;
end;

function PUMLQualifierCompartmentView.GetCompartmentItemFontStyle(Index: Integer): TFontStyles;
var
  M: PUMLAttribute;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION

  Result := [];
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLAssociationEnd);
  // ASSERTION

  M := (Model as PUMLAssociationEnd).Qualifiers[Index];
  if M.OwnerScope = skClassifier then Result := [fsUnderline]
                                 else Result := [];
end;

procedure PUMLQualifierCompartmentView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
  inherited;
end;

// PQualifierCompartment
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLInternalTransitionCompartmentView

constructor PUMLInternalTransitionCompartmentView.Create;
begin
  inherited;
  Selectable := False;
end;

function PUMLInternalTransitionCompartmentView.GetCompartmentItemCount: Integer;
begin
  Result := 0;
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLState);
  // ASSERTION
  Result := (Model as PUMLState).EntryActionCount
    + (Model as PUMLState).DoActivityCount
    + (Model as PUMLState).ExitActionCount;
end;

function PUMLInternalTransitionCompartmentView.GetCompartmentItemText(Index: Integer): string;
var
  M: PUMLAction;
  EC, DC, XC: Integer;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION
  Result := '';

  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLState);
  // ASSERTION

  EC := (Model as PUMLState).EntryActionCount;
  DC := (Model as PUMLState).DoActivityCount;
  XC := (Model as PUMLState).ExitActionCount;
  if (Index >= 0) and (Index <= EC - 1) then begin
    M := (Model as PUMLState).EntryActions[Index];
    Result := 'entry' + '/' + M.Name;
  end
  else if (Index >= EC) and (Index <= EC + DC - 1) then begin
    M := (Model as PUMLState).DoActivities[Index - EC];
    Result := 'do' + '/' + M.Name;
  end
  else if (Index >= EC + DC) and (Index <= EC + DC + XC - 1) then begin
    M := (Model as PUMLState).ExitActions[Index - EC - DC];
    Result := 'exit' + '/' + M.Name;
  end;
end;

procedure PUMLInternalTransitionCompartmentView.DrawObject(Canvas: PCanvas);
begin
  if CompartmentItemCount > 0 then begin
    inherited;
    Canvas.MoveTo(Left, Top);
    Canvas.LineTo(Right, Top);
  end;
end;

// PUMLInternalTransitionCompartmentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLResidentCompartmentView

constructor PUMLResidentCompartmentView.Create;
begin
  inherited;
  Selectable := False;
end;

function PUMLResidentCompartmentView.GetCompartmentItemCount: Integer;
begin
  Result := 0;
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLComponent);
  // ASSERTION
  Result := (Model as PUMLComponent).ResidentCount;
end;

function PUMLResidentCompartmentView.GetCompartmentItemText(Index: Integer): string;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION
  Result := '';

  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLComponent);
  // ASSERTION
  Result := (Model as PUMLComponent).Residents[Index].Name;
end;

procedure PUMLResidentCompartmentView.DrawObject(Canvas: PCanvas);
begin
  if CompartmentItemCount > 0 then begin
    inherited;
    Canvas.MoveTo(Left, Top);
    Canvas.LineTo(Right, Top);
  end;
end;

// PUMLInternalTransitionCompartmentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDeployedComponentCompartmentView

constructor PUMLDeployedComponentCompartmentView.Create;
begin
  inherited;
  Selectable := False;
end;

function PUMLDeployedComponentCompartmentView.GetCompartmentItemCount: Integer;
begin
  Result := 0;
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLNode);
  // ASSERTION
  Result := (Model as PUMLNode).DeployedComponentCount;
end;

function PUMLDeployedComponentCompartmentView.GetCompartmentItemText(Index: Integer): string;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION
  Result := '';

  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLNode);
  // ASSERTION
  Result := (Model as PUMLNode).DeployedComponents[Index].Name;
end;

procedure PUMLDeployedComponentCompartmentView.DrawObject(Canvas: PCanvas);
begin
  if CompartmentItemCount > 0 then begin
    inherited;
    Canvas.MoveTo(Left, Top);
    Canvas.LineTo(Right, Top);
  end;
end;

// PUMLDeployedComponentCompartmentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDeployedArtifactCompartmentView

constructor PUMLDeployedArtifactCompartmentView.Create;
begin
  inherited;
  Selectable := False;
end;

function PUMLDeployedArtifactCompartmentView.GetCompartmentItemCount: Integer;
begin
  Result := 0;
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLNode);
  // ASSERTION
  Result := (Model as PUMLNode).DeployedArtifactCount;
end;

function PUMLDeployedArtifactCompartmentView.GetCompartmentItemText(Index: Integer): string;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION
  Result := '';

  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLNode);
  // ASSERTION
  Result := (Model as PUMLNode).DeployedArtifacts[Index].Name;
end;

procedure PUMLDeployedArtifactCompartmentView.DrawObject(Canvas: PCanvas);
begin
  if CompartmentItemCount > 0 then begin
    inherited;
    Canvas.MoveTo(Left, Top);
    Canvas.LineTo(Right, Top);
  end;
end;

// PUMLDeployedComponentCompartmentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSlotCompartmentView

constructor PUMLSlotCompartmentView.Create;
begin
  inherited;
  Selectable := False;
end;

function PUMLSlotCompartmentView.GetCompartmentItemCount: Integer;
begin
  Result := 0;
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLInstance);
  // ASSERTION
  Result := (Model as PUMLInstance).SlotCount;
end;

function PUMLSlotCompartmentView.GetCompartmentItemText(Index: Integer): string;
var
  AttrLink: PUMLAttributeLink;
  S: string;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION
  Result := '';

  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLInstance);
  // ASSERTION
  AttrLink := (Model as PUMLInstance).Slots[Index];
  if AttrLink.Attribute <> nil then
    S := AttrLink.Attribute.Name
  else
    S := AttrLink.Name;
  if AttrLink.ValueExpression <> '' then
    S := S + ' = ' + AttrLink.ValueExpression;
  Result := S;
end;

procedure PUMLSlotCompartmentView.DrawObject(Canvas: PCanvas);
begin
  if CompartmentItemCount > 0 then begin
    inherited;
    Canvas.MoveTo(Left, Top);
    Canvas.LineTo(Right, Top);
  end;
end;

// PUMLSlotCompartmentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLExtensionPointCompartmentView

constructor PUMLExtensionPointCompartmentView.Create;
begin
  inherited;
  Selectable := False;
end;

function PUMLExtensionPointCompartmentView.GetCompartmentItemCount: Integer;
begin
  Result := 0;
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLUseCase);
  // ASSERTION
  Result := (Model as PUMLUseCase).ExtensionPointCount;
end;

function PUMLExtensionPointCompartmentView.GetCompartmentItemText(Index: Integer): string;
var
  ExtPoint: PUMLExtensionPoint;
  S: string;
begin
  // PRECONDITION
  Assert((Index >= 0) and (Index <= GetCompartmentItemCount - 1));
  // PRECONDITION
  if Model = nil then Exit;
  // ASSERTION
  Assert(Model is PUMLUseCase);
  // ASSERTION
  ExtPoint := (Model as PUMLUseCase).ExtensionPoints[Index];
  S := ExtPoint.Name;
  if ExtPoint.Location <> '' then
    S := S + ': ' + ExtPoint.Location;
  Result := S;
end;

procedure PUMLExtensionPointCompartmentView.DrawObject(Canvas: PCanvas);
begin
  if CompartmentItemCount > 0 then begin
    inherited;
    Canvas.MoveTo(Left, Top);
    Canvas.LineTo(Right, Top);
  end;
end;

// PUMLExtensionPointCompartmentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLGeneralizationView

constructor PUMLGeneralizationView.Create;
begin
  inherited;
  LineMode := lmSolid;
  HeadEndStyle := esTriangle;
end;

// PUMLGeneralizationView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLRealizationView

constructor PUMLRealizationView.Create;
begin
  inherited;
  LineMode := lmDot;
  HeadEndStyle := esTriangle;
end;

procedure PUMLRealizationView.ArrangeObject(Canvas: PCanvas);
var
  V: PUMLInterfaceView;
  C: Integer;
  P, P2: TPoint;
begin
  inherited;
  LineMode := lmDot;
  HeadEndStyle := esTriangle;
  if Head is PUMLInterfaceView then begin
    V := Head as PUMLInterfaceView;
    if (V.StereotypeDisplay = sdkIcon) and (V.StereotypeIcon = nil) then begin
      LineMode := lmSolid;
      HeadEndStyle := esFlat;

      // trial
      C := Points.Count;
      P := Junction(V.IconRect, self.Points.Points[C-1]);
      Points.Points[C-1] := P;
      if (LineStyle = lsRectilinear) and (C >= 2) then begin
        P2 := Points.Points[C-2];
        if abs(P2.X - P.X) > abs(P2.Y - P.Y) then
          P2.Y := P.Y
        else
          P2.X := P.X;
        Points.Points[C-2] := P2;
      end;

    end;
  end;
end;

// PUMLRealizationView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDependencyView

constructor PUMLDependencyView.Create;
begin
  inherited;
  LineMode := lmDot;
  HeadEndStyle := esStickArrow;
end;

procedure PUMLDependencyView.ArrangeObject(Canvas: PCanvas);
var
  V: PUMLInterfaceView;
  C: Integer;
  P, P2: TPoint;
begin
  inherited;
  LineMode := lmDot;
  HeadEndStyle := esStickArrow;
  if Head is PUMLInterfaceView then begin
    V := Head as PUMLInterfaceView;
    if (V.StereotypeDisplay = sdkIcon) and (V.StereotypeIcon = nil) then begin
      LineMode := lmSolid;
      HeadEndStyle := esFlat;

      // trial
      C := Points.Count;
      P := Junction(V.IconRect, self.Points.Points[C-1]);
      Points.Points[C-1] := P;
      if (LineStyle = lsRectilinear) and (C >= 2) then begin
        P2 := Points.Points[C-2];
        if abs(P2.X - P.X) > abs(P2.Y - P.Y) then
          P2.Y := P.Y
        else
          P2.X := P.X;
        Points.Points[C-2] := P2;
      end;

    end;
  end;
end;

// PUMLDependencyView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAssociationView

constructor PUMLAssociationView.Create;
begin
  inherited;
  FHeadRoleNameLabel := nil;
  FTailRoleNameLabel := nil;
  FHeadMultiplicityLabel := nil;
  FTailMultiplicityLabel := nil;
  FHeadPropertyLabel := nil;
  FTailPropertyLabel := nil;
  FHeadQualifierCompartment := nil;
  FTailQualifierCompartment := nil;
  FShowCompartmentStereotype := True;
  FShowCompartmentVisibility := True;
end;

procedure PUMLAssociationView.Setup;
begin
  inherited;
  HeadRoleNameLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  HeadRoleNameLabel.EdgePosition := epHead;
  HeadRoleNameLabel.Alpha := -PI / 6;
  HeadRoleNameLabel.Distance := 30;
  HeadRoleNameLabel.Model := (Model as PUMLAssociation).Connections[1];

  TailRoleNameLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  TailRoleNameLabel.EdgePosition := epTail;
  TailRoleNameLabel.Alpha := PI / 6;
  TailRoleNameLabel.Distance := 30;
  TailRoleNameLabel.Model := (Model as PUMLAssociation).Connections[0];

  HeadPropertyLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  HeadPropertyLabel.EdgePosition := epHead;
  HeadPropertyLabel.Alpha := -PI / 4;
  HeadPropertyLabel.Distance := 40;
  HeadPropertyLabel.Model := (Model as PUMLAssociation).Connections[1];

  TailPropertyLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  TailPropertyLabel.EdgePosition := epTail;
  TailPropertyLabel.Alpha := PI / 4;
  TailPropertyLabel.Distance := 40;
  TailPropertyLabel.Model := (Model as PUMLAssociation).Connections[0];

  HeadMultiplicityLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  HeadMultiplicityLabel.EdgePosition := epHead;
  HeadMultiplicityLabel.Alpha := PI / 6;
  HeadMultiplicityLabel.Distance := 25;
  HeadMultiplicityLabel.Model := (Model as PUMLAssociation).Connections[1];

  TailMultiplicityLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  TailMultiplicityLabel.EdgePosition := epTail;
  TailMultiplicityLabel.Alpha := -PI / 6;
  TailMultiplicityLabel.Distance := 25;
  TailMultiplicityLabel.Model := (Model as PUMLAssociation).Connections[0];

  HeadQualifierCompartment := MetaModel.CreateInstance('UMLQualifierCompartmentView') as PUMLQualifierCompartmentView;
  HeadQualifierCompartment.Model := (Model as PUMLAssociation).Connections[1];

  TailQualifierCompartment := MetaModel.CreateInstance('UMLQualifierCompartmentView') as PUMLQualifierCompartmentView;
  TailQualifierCompartment.Model := (Model as PUMLAssociation).Connections[0];
end;

procedure PUMLAssociationView.InitializeRoleNameLabel(ARoleNameLabel: PEdgeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ARoleNameLabel.Selectable := True;
  ARoleNameLabel.HorzAlignment := haCenter;
  ARoleNameLabel.VertAlignment := vaTop;
  ARoleNameLabel.ParentLineColor := False;
  ARoleNameLabel.ParentFillColor := False;
  ARoleNameLabel.ParentFontFace := False;
  ARoleNameLabel.ParentFontSize := False;
  ARoleNameLabel.ParentFontColor := False;
  ARoleNameLabel.ParentFontStyle := False;
end;

procedure PUMLAssociationView.InitializeMultiplicityLabel(AMultiplicityLabel: PEdgeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AMultiplicityLabel.Selectable := True;
  AMultiplicityLabel.HorzAlignment := haCenter;
  AMultiplicityLabel.VertAlignment := vaTop;
  AMultiplicityLabel.ParentLineColor := False;
  AMultiplicityLabel.ParentFillColor := False;
  AMultiplicityLabel.ParentFontFace := False;
  AMultiplicityLabel.ParentFontSize := False;
  AMultiplicityLabel.ParentFontColor := False;
  AMultiplicityLabel.ParentFontStyle := False;
end;

procedure PUMLAssociationView.InitializePropertyLabel(APropertyLabel: PEdgeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  APropertyLabel.Selectable := True;
  APropertyLabel.HorzAlignment := haCenter;
  APropertyLabel.VertAlignment := vaTop;
  APropertyLabel.ParentLineColor := False;
  APropertyLabel.ParentFillColor := False;
  APropertyLabel.ParentFontFace := False;
  APropertyLabel.ParentFontSize := False;
  APropertyLabel.ParentFontColor := False;
  APropertyLabel.ParentFontStyle := False;
end;

procedure PUMLAssociationView.InitializeQualifierCompartment(AQualifierCompartment: PUMLQualifierCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AQualifierCompartment.Selectable := True;
  AQualifierCompartment.ParentLineColor := True;
  AQualifierCompartment.ParentFillColor := True;
  AQualifierCompartment.ParentFontFace := True;
  AQualifierCompartment.ParentFontSize := True;
  AQualifierCompartment.ParentFontColor := True;
  AQualifierCompartment.ParentFontStyle := True;
end;

procedure PUMLAssociationView.SetShowCompartmentStereotype(Value: Boolean);
begin
  if FShowCompartmentStereotype <> Value then
    FShowCompartmentStereotype := Value;
end;

procedure PUMLAssociationView.SetShowCompartmentVisibility(Value: Boolean);
begin
  if FShowCompartmentVisibility <> Value then
    FShowCompartmentVisibility := Value;
end;

procedure PUMLAssociationView.SetHeadRoleNameLabel(Value: PEdgeLabelView);
begin
  if FHeadRoleNameLabel <> Value then begin
    RemoveSubView(FHeadRoleNameLabel);
    FHeadRoleNameLabel := Value;
    if FHeadRoleNameLabel <> nil then InitializeRoleNameLabel(FHeadRoleNameLabel);
    AddSubView(FHeadRoleNameLabel);
  end;
end;

procedure PUMLAssociationView.SetTailRoleNameLabel(Value: PEdgeLabelView);
begin
  if FTailRoleNameLabel <> Value then begin
    RemoveSubView(FTailRoleNameLabel);
    FTailRoleNameLabel := Value;
    if FTailRoleNameLabel <> nil then InitializeRoleNameLabel(FTailRoleNameLabel);
    AddSubView(FTailRoleNameLabel);
  end;
end;

procedure PUMLAssociationView.SetHeadMultiplicityLabel(Value: PEdgeLabelView);
begin
  if FHeadMultiplicityLabel <> Value then begin
    RemoveSubView(FHeadMultiplicityLabel);
    FHeadMultiplicityLabel := Value;
    if FHeadMultiplicityLabel <> nil then InitializeMultiplicityLabel(FHeadMultiplicityLabel);
    AddSubView(FHeadMultiplicityLabel);
  end;
end;

procedure PUMLAssociationView.SetTailMultiplicityLabel(Value: PEdgeLabelView);
begin
  if FTailMultiplicityLabel <> Value then begin
    RemoveSubView(FTailMultiplicityLabel);
    FTailMultiplicityLabel := Value;
    if FTailMultiplicityLabel <> nil then InitializeMultiplicityLabel(FTailMultiplicityLabel);
    AddSubView(FTailMultiplicityLabel);
  end;
end;

procedure PUMLAssociationView.SetHeadPropertyLabel(Value: PEdgeLabelView);
begin
  if FHeadPropertyLabel <> Value then begin
    RemoveSubView(FHeadPropertyLabel);
    FHeadPropertyLabel := Value;
    if FHeadPropertyLabel <> nil then InitializePropertyLabel(FHeadPropertyLabel);
    AddSubView(FHeadPropertyLabel);
  end;
end;

procedure PUMLAssociationView.SetTailPropertyLabel(Value: PEdgeLabelView);
begin
  if FTailPropertyLabel <> Value then begin
    RemoveSubView(FTailPropertyLabel);
    FTailPropertyLabel := Value;
    if FTailPropertyLabel <> nil then InitializePropertyLabel(FTailPropertyLabel);
    AddSubView(FTailPropertyLabel);
  end;
end;

procedure PUMLAssociationView.SetHeadQualifierCompartment(Value: PUMLQualifierCompartmentView);
begin
  if FHeadQualifierCompartment <> Value then begin
    RemoveSubView(FHeadQualifierCompartment);
    FHeadQualifierCompartment := Value;
    if FHeadQualifierCompartment <> nil then InitializeQualifierCompartment(FHeadQualifierCompartment);
    AddSubView(FHeadQualifierCompartment);
  end;
end;

procedure PUMLAssociationView.SetTailQualifierCompartment(Value: PUMLQualifierCompartmentView);
begin
  if FTailQualifierCompartment <> Value then begin
    RemoveSubView(FTailQualifierCompartment);
    FTailQualifierCompartment := Value;
    if FTailQualifierCompartment <> nil then InitializeQualifierCompartment(FTailQualifierCompartment);
    AddSubView(FTailQualifierCompartment);
  end;
end;

procedure PUMLAssociationView.ArrangeObject(Canvas: PCanvas);

  procedure ArrrangeQualifierCompartment(ConnectionNum: Integer);
  var
    QV: PUMLQualifierCompartmentView;
    NV: PNodeView;
    JP: Integer;
    P, PN, P1: TPoint;
    DX, DY: Integer;
  begin
    if ConnectionNum = 0 then begin // tail
      QV := FTailQualifierCompartment;
      NV := Tail as PNodeView;
      P1 := Points.Points[1];
      JP := 0;
    end
    else begin  // head
      QV := FHeadQualifierCompartment;
      NV := Head as PNodeView;
      P1 := Points.Points[Points.Count - 2];
      JP := Points.Count - 1;
    end;
    if QV.Visible then begin
      PN := Junction(NV.GetBoundingBox(Canvas), P1);
      DX := Abs(P1.X - PN.X);
      DY := Abs(P1.Y - PN.Y);

      // stick to right side of Node
      if (PN.X <= P1.X) and (DX >= DY) then begin
        QV.Left := NV.Right - 1;
        QV.Top := PN.Y - QV.Height div 2;
      end
      // stick to top side of Node
      else if (PN.Y >= P1.Y) and (DY > DX) then begin
        QV.Left := PN.X - QV.Width div 2;
        QV.Top := NV.Top - QV.Height + 2;
      end
      // stick to left side of Node
      else if (PN.X > P1.X) and (DX >= DY) then begin
        QV.Left := NV.Left - QV.Width + 2;
        QV.Top := PN.Y - QV.Height div 2;
      end
      // stick to bottom side of Node
      else if (PN.Y < P1.Y) and (DY > DX) then begin
        QV.Left := PN.X - QV.Width div 2;
        QV.Top := NV.Bottom - 1;
      end;

      P := Junction(QV.GetBoundingBox(Canvas), P1);
      Points.Points[JP] := P;

      QV.Width := QV.MinWidth;
      QV.Height := QV.MinHeight;
    end;
  end;

var
  H, T: PView;
begin
  inherited;
  ArrrangeQualifierCompartment(1);
  ArrrangeQualifierCompartment(0);

  T := nil; H := nil;
  if FTailQualifierCompartment.Visible then begin
    T := Tail;
    Tail := FTailQualifierCompartment;
  end;
  if FHeadQualifierCompartment.Visible then begin
    H := Head;
    Head := FHeadQualifierCompartment;
  end;
  if LineStyle = lsOblique then
    RecalcOblique(Canvas)
  else
    RecalcRectilinear(Canvas);
  if FTailQualifierCompartment.Visible then
    Tail := T;
  if FHeadQualifierCompartment.Visible then
    Head := H;
end;

procedure PUMLAssociationView.Update;
var
  Con1, Con2: PUMLAssociationEnd;
  SL: TStringList;
  S: string;
begin
  if Model = nil then Exit;
  inherited;
  Con1 := (Model as PUMLAssociation).Connections[0]; // Tail-side
  Con2 := (Model as PUMLAssociation).Connections[1]; // Head-side
  // Qualifier Compartments
  HeadQualifierCompartment.Visible := (Con2.QualifierCount > 0);
  TailQualifierCompartment.Visible := (Con1.QualifierCount > 0);
  HeadQualifierCompartment.Update;
  TailQualifierCompartment.Update;
  // Navigability
  if Con1.IsNavigable and (not Con2.IsNavigable) then
  begin
    TailEndStyle := esStickArrow;
    HeadEndStyle := esFlat;
    // Aggregation (Connection1)
    if Con1.Aggregation = akAggregate then
      TailEndStyle := esArrowDiamond
    else if Con1.Aggregation = akComposite then
      TailEndStyle := esArrowFilledDiamond;
    // Aggregation (Connection2)
    if Con2.Aggregation = akAggregate then
      HeadEndStyle := esDiamond
    else if Con2.Aggregation = akComposite then
      HeadEndStyle := esFilledDiamond;
  end
  else if (not Con1.IsNavigable) and Con2.IsNavigable then
  begin
    TailEndStyle := esFlat;
    HeadEndStyle := esStickArrow;
    // Aggregation (Connection1)
    if Con1.Aggregation = akAggregate then
      TailEndStyle := esDiamond
    else if Con1.Aggregation = akComposite then
      TailEndStyle := esFilledDiamond;
    // Aggregation (Connection2)
    if Con2.Aggregation = akAggregate then
      HeadEndStyle := esArrowDiamond
    else if Con2.Aggregation = akComposite then
      HeadEndStyle := esArrowFilledDiamond;
  end
  else begin
    TailEndStyle := esFlat;
    HeadEndStyle := esFlat;
    // Aggregation (Connection1)
    if Con1.Aggregation = akAggregate then
      TailEndStyle := esDiamond
    else if Con1.Aggregation = akComposite then
      TailEndStyle := esFilledDiamond;
    // Aggregation (Connection2)
    if Con2.Aggregation = akAggregate then
      HeadEndStyle := esDiamond
    else if Con2.Aggregation = akComposite then
      HeadEndStyle := esFilledDiamond;
  end;
  // RoleName (Connection1)
  S := VisibilityToSymbol(Con1.Visibility);
  S := S + Con1.Name;
  if Con1.TargetScope = skClassifier then
    TailRoleNameLabel.FontStyle := TailRoleNameLabel.FontStyle + [fsUnderline]
  else
    TailRoleNameLabel.FontStyle := TailRoleNameLabel.FontStyle - [fsUnderline];
  if Con1.Name <> '' then begin
    TailRoleNameLabel.Visible := True;
    TailRoleNameLabel.Text := S;
  end
  else begin
    TailRoleNameLabel.Visible := False;
  end;
  // RoleName (Connection2)
  S := VisibilityToSymbol(Con2.Visibility);
  S := S + Con2.Name;
  if Con2.TargetScope = skClassifier then
    HeadRoleNameLabel.FontStyle := HeadRoleNameLabel.FontStyle + [fsUnderline]
  else
    HeadRoleNameLabel.FontStyle := HeadRoleNameLabel.FontStyle - [fsUnderline];
  if Con2.Name <> '' then begin
    HeadRoleNameLabel.Visible := True;
    HeadRoleNameLabel.Text := S;
  end
  else begin
    HeadRoleNameLabel.Visible := False;
  end;
  // Multiplicity (Connection1)
  if Con1.Multiplicity = '' then TailMultiplicityLabel.Visible := False
                            else TailMultiplicityLabel.Visible := True;
  TailMultiplicityLabel.Text := Con1.Multiplicity;
  // Multiplicity (Connection2)
  if Con2.Multiplicity = '' then HeadMultiplicityLabel.Visible := False
                            else HeadMultiplicityLabel.Visible := True;
  HeadMultiplicityLabel.Text := Con2.Multiplicity;

  SL := TStringList.Create;
  try
    // Property (Connection1)
    if Con1.Ordering = okOrdered then
      SL.Add('ordered');
    if Con1.Changeability = ckFrozen then
      SL.Add('frozen')
    else if Con1.Changeability = ckAddOnly then
      SL.Add('addOnly');
    S := GetPropertyString(Con1, SL);
    TailPropertyLabel.Text := S;
    TailPropertyLabel.Visible := ShowProperty and (TailPropertyLabel.Text <> '');
    // Property (Connection2)
    SL.Clear;
    if Con2.Ordering = okOrdered then
      SL.Add('ordered');
    if Con2.Changeability = ckFrozen then
      SL.Add('frozen')
    else if Con2.Changeability = ckAddOnly then
      SL.Add('addOnly');
    S := GetPropertyString(Con2, SL);
    HeadPropertyLabel.Text := S;
    HeadPropertyLabel.Visible := ShowProperty and (HeadPropertyLabel.Text <> '');
  finally
    SL.Free;
  end;
end;

function PUMLAssociationView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'ShowCompartmentStereotype' then begin
    Result := BooleanToString(ShowCompartmentStereotype);
  end
  else if Name = 'ShowCompartmentVisibility' then begin
    Result := BooleanToString(ShowCompartmentVisibility);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PUMLAssociationView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'ShowCompartmentStereotype' then begin
    ShowCompartmentStereotype := StringToBoolean(Value);
  end
  else if Name = 'ShowCompartmentVisibility' then begin
    ShowCompartmentVisibility := StringToBoolean(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PUMLAssociationView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'HeadRoleNameLabel' then begin
    Result := HeadRoleNameLabel;
  end
  else if Name = 'TailRoleNameLabel' then begin
    Result := TailRoleNameLabel;
  end
  else if Name = 'HeadMultiplicityLabel' then begin
    Result := HeadMultiplicityLabel;
  end
  else if Name = 'TailMultiplicityLabel' then begin
    Result := TailMultiplicityLabel;
  end
  else if Name = 'HeadPropertyLabel' then begin
    Result := HeadPropertyLabel;
  end
  else if Name = 'TailPropertyLabel' then begin
    Result := TailPropertyLabel;
  end
  else if Name = 'HeadQualifierCompartment' then begin
    Result := HeadQualifierCompartment;
  end
  else if Name = 'TailQualifierCompartment' then begin
    Result := TailQualifierCompartment;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLAssociationView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'HeadRoleNameLabel' then begin
    HeadRoleNameLabel := Value as PEdgeLabelView;
  end
  else if Name = 'TailRoleNameLabel' then begin
    TailRoleNameLabel := Value as PEdgeLabelView;
  end
  else if Name = 'HeadMultiplicityLabel' then begin
    HeadMultiplicityLabel := Value as PEdgeLabelView;
  end
  else if Name = 'TailMultiplicityLabel' then begin
    TailMultiplicityLabel := Value as PEdgeLabelView;
  end
  else if Name = 'HeadPropertyLabel' then begin
    HeadPropertyLabel := Value as PEdgeLabelView;
  end
  else if Name = 'TailPropertyLabel' then begin
    TailPropertyLabel := Value as PEdgeLabelView;
  end
  else if Name = 'HeadQualifierCompartment' then begin
    HeadQualifierCompartment := Value as PUMLQualifierCompartmentView;
  end
  else if Name = 'TailQualifierCompartment' then begin
    TailQualifierCompartment := Value as PUMLQualifierCompartmentView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLAssociationView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAssociationClassView

constructor PUMLAssociationClassView.Create;
begin
  inherited;
  LineMode := lmDot;
  HeadEndStyle := esFlat;
end;

// PUMLAssociationClassView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomComponentView

function PUMLCustomComponentView.IsDecorationView: Boolean;
begin
  Result := FStereotypeDisplay = sdkDecoration;
end;

procedure PUMLCustomComponentView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left + COMPONENT_RECT_INDENT, Top, Right, Bottom);
  Canvas.Rectangle(Left, Top + 7, Left + 20, Top + 17);
  Canvas.Rectangle(Left, Top + 27, Left + 20, Top + 37);
end;

procedure PUMLCustomComponentView.DrawDecorationObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
end;

procedure PUMLCustomComponentView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  MinWidth := NameCompartment.MinWidth + COMPONENT_STATIC_MARGIN;
  MinHeight := Max(COMPONENT_MINHEIGHT, NameCompartment.MinHeight);
  NameCompartment.Left := Left + COMPONENT_STATIC_MARGIN;
  NameCompartment.Top := Top;
  NameCompartment.Right := Right;
end;

// PUMLCustomComponentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLComponontNode

constructor PUMLComponentView.Create;
begin
  inherited;
  FResidentCompartment := nil;
end;

procedure PUMLComponentView.InitializeResidentCompartment(AResidentCompartment: PUMLResidentCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AResidentCompartment.Selectable := False;
  AResidentCompartment.ParentLineColor := True;
  AResidentCompartment.ParentFillColor := True;
  AResidentCompartment.ParentFontFace := True;
  AResidentCompartment.ParentFontSize := True;
  AResidentCompartment.ParentFontColor := True;
  AResidentCompartment.ParentFontStyle := True;
  AResidentCompartment.Header := 'residents';
end;

procedure PUMLComponentView.SetResidentCompartment(Value: PUMLResidentCompartmentView);
begin
  if FResidentCompartment <> Value then begin
    RemoveSubView(FResidentCompartment);
    FResidentCompartment := Value;
    if FResidentCompartment <> nil then InitializeResidentCompartment(FResidentCompartment);
    AddSubView(FResidentCompartment);
  end;
end;

procedure PUMLComponentView.AfterLoad(Reader: PObjectReader);
begin
  inherited;
  // StarUML
  if ResidentCompartment = nil then begin
    ResidentCompartment := MetaModel.CreateInstance('UMLResidentCompartmentView') as PUMLResidentCompartmentView;
    ResidentCompartment.Model := Model;
  end;
end;

procedure PUMLComponentView.DrawDecorationIcon(Canvas: PCanvas; R: TRect);
begin
  if FStereotypeIcon = nil then begin
    AssignStyleToCanvas(Canvas);
    Canvas.Rectangle(R.Left + 9, R.Top + 5, R.Left + 22, R.Top + 21);
    Canvas.Rectangle(R.Left + 6, R.Top + 8, R.Left + 13, R.Top + 12);
    Canvas.Rectangle(R.Left + 6, R.Top + 14, R.Left + 13, R.Top + 18);
  end
  else
    DrawStereotypeIcon(Canvas, R);
end;

procedure PUMLComponentView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  MinWidth := Max(NameCompartment.MinWidth + COMPONENT_STATIC_MARGIN, ResidentCompartment.MinWidth + COMPONENT_RECT_INDENT);
  if ResidentCompartment.Visible then
    MinHeight := Max(NameCompartment.MinHeight, COMPONENT_BALANCED_HEIGHT) + ResidentCompartment.MinHeight
  else
    MinHeight := Max(NameCompartment.MinHeight, COMPONENT_MINHEIGHT);
  NameCompartment.Left := Left + COMPONENT_STATIC_MARGIN;
  NameCompartment.Top := Top;
  NameCompartment.Right := Right;
  if ResidentCompartment.Visible then begin
    ResidentCompartment.Left := Left + COMPONENT_RECT_INDENT;
    ResidentCompartment.Top := Top + Max(NameCompartment.MinHeight, COMPONENT_BALANCED_HEIGHT);
    ResidentCompartment.Right := Right;
  end;
end;

procedure PUMLComponentView.ArrangeDecorationObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeObjectWithCompartments([ResidentCompartment], DECORATIONVIEW_MINWIDTH, DECORATIONVIEW_MINHEIGHT);
end;

procedure PUMLComponentView.ArrangeIconicObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeIconicObjectWithCompartments([ResidentCompartment], ICONICVIEW_MINWIDTH, ICONICVIEW_MINHEIGHT, FStereotypeIconMinWidth, FStereotypeIconMinHeight);
end;

procedure PUMLComponentView.Setup;
begin
  inherited;
  ResidentCompartment := MetaModel.CreateInstance('UMLResidentCompartmentView') as PUMLResidentCompartmentView;
  ResidentCompartment.Model := Model;
  NameCompartment.NameLabel.FontStyle := [fsBold];
end;

procedure PUMLComponentView.Update;
var
  M: PUMLComponent;
  I: Integer;
begin
  if Model = nil then Exit;
  inherited;
  M := (Model as PUMLComponent);
  if M.IsAbstract then
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle + [fsItalic]
  else
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle - [fsItalic];
  if (StereotypeDisplay = sdkDecoration) and (M.StereotypeName = '') then
    NameCompartment.StereotypeLabel.Text := '<<component>>';
  ResidentCompartment.Visible := (M.ResidentCount > 0);    
  for I := 0 to M.InstanceCount - 1 do
    if M.Instances[I] is PUMLComponentInstance then
      (M.Instances[I] as PUMLComponentInstance).UpdateViews;
end;

function PUMLComponentView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'ResidentCompartment' then begin
    Result := ResidentCompartment;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLComponentView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'ResidentCompartment' then begin
    ResidentCompartment := Value as PUMLResidentCompartmentView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLComponentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLComponentInstanceView

procedure PUMLComponentInstanceView.DrawDecorationIcon(Canvas: PCanvas; R: TRect);
begin
  if FStereotypeIcon = nil then begin
    AssignStyleToCanvas(Canvas);
    Canvas.Rectangle(R.Left + 9, R.Top + 5, R.Left + 22, R.Top + 21);
    Canvas.Rectangle(R.Left + 6, R.Top + 8, R.Left + 13, R.Top + 12);
    Canvas.Rectangle(R.Left + 6, R.Top + 14, R.Left + 13, R.Top + 18);
    Canvas.MoveTo(R.Left + 15, R.Top + 17);
    Canvas.LineTo(R.Left + 20, R.Top + 17);
  end
  else
    DrawStereotypeIcon(Canvas, R);
end;

procedure PUMLComponentInstanceView.Setup;
begin
  inherited;
  NameCompartment.NameLabel.FontStyle := [fsUnderline];
end;

procedure PUMLComponentInstanceView.Update;
var
  M: PUMLComponentInstance;
begin
  if Model = nil then Exit;
  inherited;
  M := Model as PUMLComponentInstance;
  if M.Classifier <> nil then
    NameCompartment.NameLabel.Text := NameCompartment.NameLabel.Text + ':' + M.Classifier.Name;
end;

// PUMLComponentInstanceView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomNodeView

function PUMLCustomNodeView.IsDecorationView: Boolean;
begin
  Result := FStereotypeDisplay = sdkDecoration;
end;

procedure PUMLCustomNodeView.DrawObject(Canvas: PCanvas);
var
  R, B: Integer;
begin
  AssignStyleToCanvas(Canvas);

  R := Right - 1; B := Bottom - 1;
  Canvas.Polygon([Point(Left, Top+NODE_STATIC_MARGIN), Point(R-NODE_STATIC_MARGIN, Top+NODE_STATIC_MARGIN),
                  Point(R-NODE_STATIC_MARGIN, B), Point(Left, B)]);
  Canvas.Polygon([Point(Left, Top+NODE_STATIC_MARGIN), Point(Left+NODE_STATIC_MARGIN, Top),
                  Point(R, Top), Point(R-NODE_STATIC_MARGIN, Top+NODE_STATIC_MARGIN)]);
  Canvas.Polygon([Point(R, Top), Point(R-NODE_STATIC_MARGIN, Top+NODE_STATIC_MARGIN),
                  Point(R-NODE_STATIC_MARGIN, B), Point(R, B-NODE_STATIC_MARGIN)]);
end;

procedure PUMLCustomNodeView.DrawDecorationObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
end;

procedure PUMLCustomNodeView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  MinWidth := Max(NODE_MINWIDTH, NameCompartment.MinWidth + NODE_STATIC_MARGIN);
  MinHeight := Max(NODE_MINHEIGHT, NameCompartment.MinHeight + NODE_STATIC_MARGIN);
  NameCompartment.Left := Left;
  NameCompartment.Top := Top + NODE_STATIC_MARGIN;
  NameCompartment.Right := Right - NODE_STATIC_MARGIN;
end;

// PUMLCustomNodeView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLNodeView

constructor PUMLNodeView.Create;
begin
  inherited;
  FDeployedComponentCompartment := nil;
  FDeployedArtifactCompartment := nil;
end;

procedure PUMLNodeView.InitializeDeployedComponentCompartment(ADeployedComponentCompartment: PUMLDeployedComponentCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ADeployedComponentCompartment.Selectable := False;
  ADeployedComponentCompartment.ParentLineColor := True;
  ADeployedComponentCompartment.ParentFillColor := True;
  ADeployedComponentCompartment.ParentFontFace := True;
  ADeployedComponentCompartment.ParentFontSize := True;
  ADeployedComponentCompartment.ParentFontColor := True;
  ADeployedComponentCompartment.ParentFontStyle := True;
  ADeployedComponentCompartment.Header := 'components';
end;

procedure PUMLNodeView.InitializeDeployedArtifactCompartment(ADeployedArtifactCompartment: PUMLDeployedArtifactCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ADeployedArtifactCompartment.Selectable := False;
  ADeployedArtifactCompartment.ParentLineColor := True;
  ADeployedArtifactCompartment.ParentFillColor := True;
  ADeployedArtifactCompartment.ParentFontFace := True;
  ADeployedArtifactCompartment.ParentFontSize := True;
  ADeployedArtifactCompartment.ParentFontColor := True;
  ADeployedArtifactCompartment.ParentFontStyle := True;
  ADeployedArtifactCompartment.Header := 'artifacts';
end;

procedure PUMLNodeView.SetDeployedComponentCompartment(Value: PUMLDeployedComponentCompartmentView);
begin
  if FDeployedComponentCompartment <> Value then begin
    RemoveSubView(FDeployedComponentCompartment);
    FDeployedComponentCompartment := Value;
    if FDeployedComponentCompartment <> nil then InitializeDeployedComponentCompartment(FDeployedComponentCompartment);
    AddSubView(FDeployedComponentCompartment);
  end;
end;

procedure PUMLNodeView.SetDeployedArtifactCompartment(Value: PUMLDeployedArtifactCompartmentView);
begin
  if FDeployedArtifactCompartment <> Value then begin
    RemoveSubView(FDeployedArtifactCompartment);
    FDeployedArtifactCompartment := Value;
    if FDeployedArtifactCompartment <> nil then InitializeDeployedArtifactCompartment(FDeployedArtifactCompartment);
    AddSubView(FDeployedArtifactCompartment);
  end;
end;

procedure PUMLNodeView.AfterLoad(Reader: PObjectReader);
begin
  inherited;
  // StarUML
  if DeployedComponentCompartment = nil then begin
    DeployedComponentCompartment := MetaModel.CreateInstance('UMLDeployedComponentCompartmentView') as PUMLDeployedComponentCompartmentView;
    DeployedComponentCompartment.Model := Model;
  end;
  if DeployedArtifactCompartment = nil then begin
    DeployedArtifactCompartment := MetaModel.CreateInstance('UMLDeployedArtifactCompartmentView') as PUMLDeployedArtifactCompartmentView;
    DeployedArtifactCompartment.Model := Model;
  end;
end;

procedure PUMLNodeView.DrawDecorationIcon(Canvas: PCanvas; R: TRect);
begin
  if FStereotypeIcon = nil then begin
    AssignStyleToCanvas(Canvas);
    Canvas.Rectangle(R.Left + 3, R.Top + 10, R.Left + 20, R.Top + 21);
    Canvas.Polygon([Point(R.Left + 3, R.Top + 10), Point(R.Left + 8, R.Top + 5),
      Point(R.Left + 24, R.Top + 5), Point(R.Left + 19, R.Top + 10)]);
    Canvas.Polygon([Point(R.Left + 19, R.Top + 10), Point(R.Left + 24, R.Top + 5),
      Point(R.Left + 24, R.Top + 15), Point(R.Left + 19, R.Top + 20)]);
  end
  else
    DrawStereotypeIcon(Canvas, R);
end;

procedure PUMLNodeView.ArrangeObject(Canvas: PCanvas);
var
  R: TRect;
begin
  inherited;
  MeasureObjectMinSize([DeployedComponentCompartment, DeployedArtifactCompartment], NODE_MINWIDTH, NODE_MINHEIGHT, NODE_STATIC_MARGIN, NODE_STATIC_MARGIN);
  R := Rect(Left, Top + NODE_STATIC_MARGIN, Right - NODE_STATIC_MARGIN, Bottom);
  ArrangeCompartments([DeployedComponentCompartment, DeployedArtifactCompartment], R);
end;

procedure PUMLNodeView.ArrangeIconicObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeIconicObjectWithCompartments([DeployedComponentCompartment, DeployedArtifactCompartment], NODE_MINWIDTH, NODE_MINHEIGHT, FStereotypeIconMinWidth, FStereotypeIconMinHeight);
end;

procedure PUMLNodeView.ArrangeDecorationObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeObjectWithCompartments([DeployedComponentCompartment, DeployedArtifactCompartment], NODE_MINWIDTH, NODE_MINHEIGHT);
end;

procedure PUMLNodeView.Setup;
begin
  inherited;
  DeployedComponentCompartment := MetaModel.CreateInstance('UMLDeployedComponentCompartmentView') as PUMLDeployedComponentCompartmentView;
  DeployedComponentCompartment.Model := Model;
  DeployedArtifactCompartment := MetaModel.CreateInstance('UMLDeployedArtifactCompartmentView') as PUMLDeployedArtifactCompartmentView;
  DeployedArtifactCompartment.Model := Model;
  NameCompartment.NameLabel.FontStyle := [fsBold];
end;

procedure PUMLNodeView.Update;
var
  M: PUMLNode;
  I: Integer;
begin
  if Model = nil then Exit;
  inherited;
  M := (Model as PUMLNode);
  if M.IsAbstract then
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle + [fsItalic]
  else
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle - [fsItalic];
  DeployedComponentCompartment.Visible := (M.DeployedComponentCount > 0);
  DeployedArtifactCompartment.Visible := (M.DeployedArtifactCount > 0);    
  for I := 0 to M.InstanceCount - 1 do
    if M.Instances[I] is PUMLNodeInstance then
      (M.Instances[I] as PUMLNodeInstance).UpdateViews;
end;

function PUMLNodeView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'DeployedComponentCompartment' then begin
    Result := DeployedComponentCompartment;
  end
  else if Name = 'DeployedArtifactCompartment' then begin
    Result := DeployedArtifactCompartment;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLNodeView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'DeployedComponentCompartment' then begin
    DeployedComponentCompartment := Value as PUMLDeployedComponentCompartmentView;
  end
  else if Name = 'DeployedArtifactCompartment' then begin
    DeployedArtifactCompartment := Value as PUMLDeployedArtifactCompartmentView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLNodeView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLNodeInstanceView

procedure PUMLNodeInstanceView.DrawDecorationIcon(Canvas: PCanvas; R: TRect);
begin
  if FStereotypeIcon = nil then begin
    AssignStyleToCanvas(Canvas);
    Canvas.Rectangle(R.Left + 3, R.Top + 10, R.Left + 20, R.Top + 21);
    Canvas.Polygon([Point(R.Left + 3, R.Top + 10), Point(R.Left + 8, R.Top + 5),
      Point(R.Left + 24, R.Top + 5), Point(R.Left + 19, R.Top + 10)]);
    Canvas.Polygon([Point(R.Left + 19, R.Top + 10), Point(R.Left + 24, R.Top + 5),
      Point(R.Left + 24, R.Top + 15), Point(R.Left + 19, R.Top + 20)]);
    Canvas.MoveTo(R.Left + 6, R.Top + 17);
    Canvas.LineTo(R.Left + 17, R.Top + 17);
  end
  else
    DrawStereotypeIcon(Canvas, R);
end;

procedure PUMLNodeInstanceView.Setup;
begin
  inherited;
  NameCompartment.NameLabel.FontStyle := [fsUnderline];
end;

procedure PUMLNodeInstanceView.Update;
var
  M: PUMLNodeInstance;
begin
  if Model = nil then Exit;
  inherited;
  M := Model as PUMLNodeInstance;
  if M.Classifier <> nil then
    NameCompartment.NameLabel.Text := NameCompartment.NameLabel.Text + ':' + M.Classifier.Name;
end;

// PUMLNodeInstanceView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActorView

procedure DrawActor(Canvas: PCanvas; ARect: TRect);
var
  CX, W, H: Integer;
  XH, XA, YH, YA, YL: Integer;
begin
  W := ARect.Right - ARect.Left;
  H := ARect.Bottom - ARect.Top;

  XH := W * 16 div 100;
  XA := W * 14 div 100;
  YH := ARect.Top + H * 34 div 100;
  YA := ARect.Top + H * 46 div 100;
  YL := ARect.Top + H * 66 div 100;
  CX := ARect.Left + W div 2;

  // head, body, arm, left leg, right leg
  Canvas.Ellipse(ARect.Left + XH, ARect.Top + 1, ARect.Right - XH, YH);
  Canvas.PolyLine([Point(CX, YH), Point(CX, YL)]);
  Canvas.PolyLine([Point(ARect.Left + XA , YA), Point(ARect.Right - XA, YA)]);
  Canvas.PolyLine([Point(CX, YL), Point(ARect.Left, ARect.Bottom - 1)]);
  Canvas.PolyLine([Point(CX, YL), Point(ARect.Right, ARect.Bottom - 1)]);
end;

function PUMLActorView.IsDecorationView: Boolean;
begin
  Result := FStereotypeDisplay = sdkDecoration;
end;

procedure PUMLActorView.DrawDecorationIcon(Canvas: PCanvas; R: TRect);
var
  RA: TRect;
  W: Integer;
begin
  if FStereotypeIcon = nil then begin
    RA := R;
    if ((RA.Right - RA.Left) * 100 div (RA.Bottom - RA.Top)) >= ACTOR_RATIO_PERCENT then begin
      W := ACTOR_RATIO_PERCENT * (RA.Bottom - RA.Top) div 100;
      RA.Left := RA.Left + ((R.Right - R.Left) - W) div 2;
      RA.Right := RA.Left + W;
    end;
    DrawActor(Canvas, RA);
  end
  else
    DrawStereotypeIcon(Canvas, R);
end;

procedure PUMLActorView.DrawObject(Canvas: PCanvas);
var
  R: TRect;
  W: Integer;
begin
  AssignStyleToCanvas(Canvas);
  R := Rect(Left, Top, Right, NameCompartment.Top);
  if ((R.Right - R.Left) * 100 div (R.Bottom - R.Top)) >= ACTOR_RATIO_PERCENT then begin
    W := ACTOR_RATIO_PERCENT * (R.Bottom - R.Top) div 100;
    R.Left := R.Left + ((Right - Left) - W) div 2;
    R.Right := R.Left + W;
  end;
  DrawActor(Canvas, R);
end;

procedure PUMLActorView.DrawDecorationObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
end;

procedure PUMLActorView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeIconicObjectWithCompartments([AttributeCompartment, OperationCompartment], ICONICVIEW_MINWIDTH, ICONICVIEW_MINHEIGHT, ACTOR_ICONMINWIDTH, ACTOR_ICONMINHEIGHT);
end;

procedure PUMLActorView.Setup;
begin
  inherited;
  SuppressAttributes := True;
  SuppressOperations := True;
end;

// PUMLActorNodeNode
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLUseCaseView

constructor PUMLUseCaseView.Create;
begin
  inherited;
  FExtensionPointCompartment := nil;
end;

procedure PUMLUseCaseView.InitializeExtensionPointCompartment(AExtensionPointCompartment: PUMLExtensionPointCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  FExtensionPointCompartment.Selectable := False;
  FExtensionPointCompartment.ParentLineColor := True;
  FExtensionPointCompartment.ParentFillColor := True;
  FExtensionPointCompartment.ParentFontFace := True;
  FExtensionPointCompartment.ParentFontSize := True;
  FExtensionPointCompartment.ParentFontColor := True;
  FExtensionPointCompartment.ParentFontStyle := True;
  FExtensionPointCompartment.Header := 'extension points';
end;

procedure PUMLUseCaseView.SetExtensionPointCompartment(Value: PUMLExtensionPointCompartmentView);
begin
  if FExtensionPointCompartment <> Value then begin
    RemoveSubView(FExtensionPointCompartment);
    FExtensionPointCompartment := Value;
    if FExtensionPointCompartment <> nil then InitializeExtensionPointCompartment(FExtensionPointCompartment);
    AddSubView(FExtensionPointCompartment);
  end;
end;

procedure DrawUseCase(Canvas: PCanvas; ARect: TRect);
var
  RR, IR: Integer;
  W, H, X, Y: Integer;
  R: TRect;
begin
  R := ARect;
  W := R.Right - R.Left;
  H := R.Bottom - R.Top;
  RR := W * 100 div H;
  IR := USECASE_ICONMINWIDTH * 100 div USECASE_ICONMINHEIGHT; 
  if RR >= IR then begin
    H := (R.Bottom - R.Top);
    W := H * IR div 100;
    X := R.Left + (R.Right - R.Left - W) div 2;
    Y := R.Top;
  end
  else begin
    W := (R.Right - R.Left);
    H := W * 100 div IR;
    Y := R.Top + (R.Bottom - R.Top - H) div 2;
    X := R.Left;
  end;
  Canvas.Ellipse(X, Y, X + W, Y + H);
end;

procedure PUMLUseCaseView.AfterLoad(Reader: PObjectReader);
begin
  inherited;
  // StarUML
  if ExtensionPointCompartment = nil then begin
    ExtensionPointCompartment := MetaModel.CreateInstance('UMLExtensionPointCompartmentView') as PUMLExtensionPointCompartmentView;
    ExtensionPointCompartment.Model := Model;
  end;
end;

function PUMLUseCaseView.IsIconicView: Boolean;
begin
  Result := FStereotypeDisplay = sdkIcon;
end;

function PUMLUseCaseView.IsDecorationView: Boolean;
begin
  Result := FStereotypeDisplay = sdkDecoration;
end;

procedure PUMLUseCaseView.DrawDecorationIcon(Canvas: PCanvas; R: TRect);
begin
  if FStereotypeIcon = nil then
    Canvas.Ellipse(R.Left + 2, R.Top + 8, R.Right - 2, R.Bottom - 8)
  else
    DrawStereotypeIcon(Canvas, R);
end;

procedure PUMLUseCaseView.DrawObject(Canvas: PCanvas);
var
  R: TRect;
begin
  AssignStyleToCanvas(Canvas);
  R := Rect(Left, Top, Right, Bottom);
  if ExtensionPointCompartment.Visible then
   R.Bottom := R.Bottom - ExtensionPointCompartment.Height - COMPARTMENT_INTERVAL;
  if OperationCompartment.Visible then
   R.Bottom := R.Bottom - OperationCompartment.Height - COMPARTMENT_INTERVAL;
  if AttributeCompartment.Visible then
   R.Bottom := R.Bottom - AttributeCompartment.Height - COMPARTMENT_INTERVAL;
  Canvas.Ellipse(R.Left, R.Top, R.Right, R.Bottom);
end;

procedure PUMLUseCaseView.DrawIconicObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  if StereotypeIcon = nil then
    DrawUseCase(Canvas, Rect(Left, Top, Right, NameCompartment.Top))
  else
    DrawStereotypeIcon(Canvas, Rect(Left, Top, Right, NameCompartment.Top));
end;

procedure PUMLUseCaseView.DrawDecorationObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
end;

procedure PUMLUseCaseView.ArrangeObject(Canvas: PCanvas);
var
  W, H, Y: Integer;
begin
  // Calculating minimum size <= minimum Namecompartment circumscription size
  // rectangle's circumscription ellipse height and width are rectangle's height and width * Sqrt(2)
  W := Max(Trunc(Sqrt(2) * NameCompartment.MinWidth), USECASE_MINWIDTH);
  if AttributeCompartment.Visible then
    W := Max(W, AttributeCompartment.MinWidth);
  if OperationCompartment.Visible then
    W := Max(W, OperationCompartment.MinWidth);
  if ExtensionPointCompartment.Visible then
    W := Max(W, ExtensionPointCompartment.MinWidth);
  MinWidth := W;

  H := Max(Trunc(Sqrt(2) * NameCompartment.MinHeight + COMPARTMENT_INTERVAL), USECASE_MINHEIGHT);
  if AttributeCompartment.Visible then
    H := H + COMPARTMENT_INTERVAL + AttributeCompartment.MinHeight;
  if OperationCompartment.Visible then
    H := H + COMPARTMENT_INTERVAL + OperationCompartment.MinHeight;
  if ExtensionPointCompartment.Visible then
    H := H + COMPARTMENT_INTERVAL + ExtensionPointCompartment.MinHeight;
  MinHeight := H;

  // Arranging view objects
  Y := Bottom;
  if ExtensionPointCompartment.Visible then begin
    Y := Y - ExtensionPointCompartment.Height - COMPARTMENT_INTERVAL;
    ExtensionPointCompartment.Left := Left;
    ExtensionPointCompartment.Right := Right;
    ExtensionPointCompartment.Top := Y;
  end;
  if OperationCompartment.Visible then begin
    Y := Y - OperationCompartment.Height - COMPARTMENT_INTERVAL;
    OperationCompartment.Left := Left;
    OperationCompartment.Right := Right;
    OperationCompartment.Top := Y;
  end;
  if AttributeCompartment.Visible then begin
    Y := Y - AttributeCompartment.Height - COMPARTMENT_INTERVAL;
    AttributeCompartment.Left := Left;
    AttributeCompartment.Right := Right;
    AttributeCompartment.Top := Y;
  end;
  NameCompartment.Width := Trunc(1 / Sqrt(2) * Width);
  NameCompartment.Left := Left + (Width - NameCompartment.Width) div 2;
  NameCompartment.Top := ((Y + Top) div 2) - (NameCompartment.Height div 2);
end;

procedure PUMLUseCaseView.ArrangeIconicObject(Canvas: PCanvas);
begin
  inherited;
  if StereotypeIcon = nil then
    ArrangeIconicObjectWithCompartments([AttributeCompartment, OperationCompartment, ExtensionPointCompartment], ICONICVIEW_MINWIDTH, ICONICVIEW_MINHEIGHT, USECASE_ICONMINWIDTH, USECASE_ICONMINHEIGHT)
  else
    ArrangeIconicObjectWithCompartments([AttributeCompartment, OperationCompartment, ExtensionPointCompartment], ICONICVIEW_MINWIDTH, ICONICVIEW_MINHEIGHT, FStereotypeIconMinWidth, FStereotypeIconMinHeight)
end;

procedure PUMLUseCaseView.ArrangeDecorationObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeObjectWithCompartments([AttributeCompartment, OperationCompartment, ExtensionPointCompartment], DECORATIONVIEW_MINWIDTH, DECORATIONVIEW_MINHEIGHT);
end;

procedure PUMLUseCaseView.Setup;
begin
  inherited;
  ExtensionPointCompartment := MetaModel.CreateInstance('UMLExtensionPointCompartmentView') as PUMLExtensionPointCompartmentView;
  ExtensionPointCompartment.Model := Model;
  SuppressAttributes := True;
  SuppressOperations := True;
end;

procedure PUMLUseCaseView.Update;
begin
  if Model = nil then Exit;
  inherited;
  ExtensionPointCompartment.Visible := ((Model as PUMLUseCase).ExtensionPointCount > 0);
end;

function PUMLUseCaseView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'ExtensionPointCompartment' then begin
    Result := ExtensionPointCompartment;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLUseCaseView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'ExtensionPointCompartment' then begin
    ExtensionPointCompartment := Value as PUMLExtensionPointCompartmentView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLUseCaseView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLIncludeView

constructor PUMLIncludeView.Create;
begin
  inherited;
  LineMode := lmDot;
  HeadEndStyle := esStickArrow;
end;

procedure PUMLIncludeView.Update;
begin
  if Model = nil then Exit;
  inherited;
  StereotypeLabel.Text := '<<include>>';
end;


// PUMLIncludeView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLExtendView

constructor PUMLExtendView.Create;
begin
  inherited;
  LineMode := lmDot;
  HeadEndStyle := esStickArrow;
end;

procedure PUMLExtendView.Update;
begin
  if Model = nil then Exit;
  inherited;
  StereotypeLabel.Text := '<<extend>>';
end;

// PUMLExtendView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSystemBoundaryView

procedure PUMLSystemBoundaryView.SetCaption(Value: string);
begin
  if FCaption <> Value then
    FCaption := Value;
end;

procedure PUMLSystemBoundaryView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  AssignFontToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
  Canvas.TextOut(Right - COMPARTMENT_RIGHT_MARGIN - Canvas.TextWidth(FCaption), Top + COMPARTMENT_TOP_MARGIN, FCaption);
end;

procedure PUMLSystemBoundaryView.ArrangeObject(Canvas: PCanvas);
var
  W, H: Integer;
begin
  inherited;
  AssignStyleToCanvas(Canvas);
  AssignFontToCanvas(Canvas);
  W := Canvas.TextWidth(FCaption) + COMPARTMENT_LEFT_MARGIN + COMPARTMENT_RIGHT_MARGIN;
  H := Canvas.TextHeight('^_') + COMPARTMENT_TOP_MARGIN + COMPARTMENT_BOTTOM_MARGIN;
  MinWidth := Max(SYSTEMBOUNDARY_MINWIDTH, W);
  MinHeight := Max(SYSTEMBOUNDARY_MINHEIGHT, H);
end;

function PUMLSystemBoundaryView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'Caption' then begin
    Result := Caption;
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PUMLSystemBoundaryView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'Caption' then begin
    Caption := Value;
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

// PUMLSystemBoundaryView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLLifeLineView

constructor PUMLLifeLineView.Create;
begin
  inherited;
  Movable := mmNone;
  Sizable := szVert;
  Selectable := False;
end;

procedure PUMLLifeLineView.DrawObject(Canvas: PCanvas);
var
  I, C: Integer;
  IsDestruction: Boolean;
  V: PUMLCustomSeqMessageView;
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Pen.Style := psDot;
  C := Left + (Width div 2);
  Canvas.PolyLine([Point(C, Top), Point(C, Bottom)]);
  // if Model's Action is PUMLDestroyAction in UMLCustomSeqMessageView connected to self,
  // draw Destruction Mark.
  IsDestruction := False;
  for I := 0 to GetDiagramView.OwnedViewCount - 1 do begin
    if GetDiagramView.OwnedView[I] is PUMLCustomSeqMessageView then begin
      V := GetDiagramView.OwnedView[I] as PUMLCustomSeqMessageView;
      if Model <> nil then begin
        if V.Head = Self then begin
          if (V.Model is PUMLStimulus) and ((V.Model as PUMLStimulus).Action is PUMLDestroyAction) then
            IsDestruction := True;
          if (V.Model is PUMLMessage) and ((V.Model as PUMLMessage).Action is PUMLDestroyAction) then
            IsDestruction := True;
        end;
      end;        
    end;
  end;
  // draw Destruction Mark.
  if IsDestruction then begin
    Canvas.Pen.Style := psSolid;
    Canvas.MoveTo(C - 10, Bottom - 10);
    Canvas.LineTo(C + 10, Bottom + 10);
    Canvas.MoveTo(C + 10, Bottom - 10);
    Canvas.LineTo(C - 10, Bottom + 10);
  end;
end;

procedure PUMLLifeLineView.ArrangeObject(Canvas: PCanvas);
var
  I: Integer;
  MessageView: PUMLCustomSeqMessageView;
  B: Integer;
begin
  inherited;
  MinWidth := 1;
  MinHeight := LIFELINE_MINHEIGHT;
  Width := MinWidth;
  // LifeLine's Height is long to contain all MessageView.
  B := (Parent as PNodeView).Bottom;
  for I := 0 to GetDiagramView.OwnedViewCount - 1 do begin
    if (GetDiagramView.OwnedView[I] is PUMLCustomSeqMessageView) then begin
      MessageView := GetDiagramView.OwnedView[I] as PUMLCustomSeqMessageView;
      if (MessageView.Head = Self) or (MessageView.Tail = Self) then begin
        if MessageView.Activation.Bottom > B then B := MessageView.Activation.Bottom;
      end;
    end;
  end;
  if B > (Parent as PNodeView).Bottom then
    (Parent as PNodeView).Bottom := B + 20;  //
end;

function PUMLLifeLineView.ContainsPoint(Canvas: PCanvas; P: TPoint): Boolean;
var
  C: Integer;
  R: TRect;
begin
  C := LIFELINE_MINWIDTH div 2;
  R := Rect(Left - C, Top, Left + C, Bottom);
  Result := PtInRect(R, P);
end;

// -----------------------------------------------------------------------------
// return the most extruded ActivationView existing at YPosition
// -----------------------------------------------------------------------------
function PUMLLifeLineView.GetActivationAt(YPosition: Integer): PUMLActivationView;
var
  I: Integer;
  Msg: PUMLCustomSeqMessageView;
  FrontMostActivation: PUMLActivationView;
begin
  FrontMostActivation := nil;
  // find the most extruded Activation(FrontMostActivation)
  // regard Activation whose Top position is the lowest as the most extruded Activation
  for I := 0 to GetDiagramView.OwnedViewCount - 1 do begin
    if GetDiagramView.OwnedView[I] is PUMLCustomSeqMessageView then begin
      Msg := GetDiagramView.OwnedView[I] as PUMLCustomSeqMessageView;
      if Msg.Head = Self then begin
        if (Msg.Activation.Visible) and
           (Msg.Activation.Top <= YPosition) and
           (Msg.Activation.Bottom > YPosition) then
        begin
          if FrontMostActivation <> nil then begin
            if Msg.Activation.Top > FrontMostActivation.Top then FrontMostActivation := Msg.Activation;
          end
          else begin
            FrontMostActivation := Msg.Activation;
          end;
        end;
      end;
    end;
  end;
  Result := FrontMostActivation;
end;

// PUMLLifeLineView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomSeqObjectView

constructor PUMLCustomSeqObjectView.Create;
begin
  inherited;
  FLifeLine := nil;
end;

procedure PUMLCustomSeqObjectView.InitializeLifeLine(ALifeLine: PUMLLifeLineView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ALifeLine.Selectable := False;
  ALifeLine.Movable := mmNone;
  ALifeLine.Sizable := szVert;
end;

procedure PUMLCustomSeqObjectView.SetLifeLine(Value: PUMLLifeLineView);
begin
  if FLifeLine <> Value then begin
    RemoveSubView(FLifeLine);
    FLifeLine := Value;
    if FLifeLine <> nil then InitializeLifeLine(FLifeLine);
    AddSubView(FLifeLine);
  end;
end;

procedure PUMLCustomSeqObjectView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, NameCompartment.Bottom);
end;

procedure PUMLCustomSeqObjectView.DrawDecorationObject(Canvas: PCanvas);
begin
  DrawObject(Canvas);
end;

procedure PUMLCustomSeqObjectView.DrawActorShapeObject(Canvas: PCanvas);
var
  R: TRect;
  W: Integer;
begin
  AssignStyleToCanvas(Canvas);
  R := Rect(Left, Top, Right, NameCompartment.Top);
  if ((R.Right - R.Left) * 100 div (R.Bottom - R.Top)) >= ACTOR_RATIO_PERCENT then begin
    W := ACTOR_RATIO_PERCENT * (R.Bottom - R.Top) div 100;
    R.Left := R.Left + ((Right - Left) - W) div 2;
    R.Right := R.Left + W;
  end;
  DrawActor(Canvas, R);
end;

procedure PUMLCustomSeqObjectView.DrawNoModeledMark(Canvas: PCanvas);
begin
  DrawModelExcludedMark(Canvas, Left + Width * 3 div 4, Top + NameCompartment.Height * 1 div 4);
end;

procedure PUMLCustomSeqObjectView.ArrangeObject(Canvas: PCanvas);
begin
  // not inherited (SeqObjectView must not be affected by 'AutoResize' attribute.
  MinWidth := Max(SEQ_OBJECT_MINWIDTH, NameCompartment.MinWidth);
  MinHeight := Max(SEQ_OBJECT_MINHEIGHT, NameCompartment.MinHeight) + LifeLine.MinHeight;
  NameCompartment.Left := Left;
  NameCompartment.Top := Top;
  NameCompartment.Right := Right;
  NameCompartment.Height := SEQ_OBJECT_MINHEIGHT;
  LifeLine.Top := NameCompartment.Bottom + 1;
  LifeLine.Left := Left + (Width div 2);
  LifeLine.Bottom := Bottom;

{
  // Adjust object position to locate over all messages. (omitted)
  ST := Bottom;
  for I := 0 to GetDiagramView.OwnedViewCount - 1 do begin
    if GetDiagramView.OwnedViews[I] is PUMLCustomSeqMessageView then begin
      V := GetDiagramView.OwnedViews[I] as PUMLCustomSeqMessageView;
      if (V.Head = LifeLine) or (V.Tail = LifeLine) then
        if V.Points.Points[0].Y < ST then ST := V.Points.Points[0].Y;
    end;
  end;
  ST := ST - SEQ_OBJECT_MESSAGE_MIN_INTERVAL;
  if NameCompartment.Bottom > ST then begin
    Top := Top - (NameCompartment.Bottom - ST);
    NameCompartment.Top := Top;
    NameCompartment.Bottom := ST;
  end;
}
end;

procedure PUMLCustomSeqObjectView.ArrangeActorShapeObject(Canvas: PCanvas);
begin
  // not inherited (SeqObjectView must not be affected by 'AutoResize' attribute.
  MinWidth := Max(NameCompartment.MinWidth, ACTOR_ICONMINWIDTH);
  MinHeight := NameCompartment.MinHeight + ACTOR_ICONMINHEIGHT + LifeLine.MinHeight;
  NameCompartment.Top := Top + ACTOR_ICONMINHEIGHT;
  NameCompartment.Left := Left;
  NameCompartment.Right := Right;
  LifeLine.Top := NameCompartment.Bottom + 1;
  LifeLine.Left := Left + (Width div 2);
  LifeLine.Bottom := Bottom;
end;

procedure PUMLCustomSeqObjectView.ArrangeIconicObject(Canvas: PCanvas);
begin
  // PRECONDITION
  Assert(IsIconicView, 'Not satisfy condition that call this procedure.');
  // PRECONDITION
  // not inherited (SeqObjectView must not be affected by 'AutoResize' attribute.
  MinHeight := NameCompartment.MinHeight + FStereotypeIconMinHeight + LifeLine.MinHeight;
  NameCompartment.Top := Top + FStereotypeIconMinHeight;
  NameCompartment.Left := Left;
  NameCompartment.Right := Right;
  LifeLine.Top := NameCompartment.Bottom + 1;
  LifeLine.Left := Left + (Width div 2);
  LifeLine.Bottom := Bottom;
end;

procedure PUMLCustomSeqObjectView.ArrangeDecorationObject(Canvas: PCanvas);
begin
  ArrangeObject(Canvas);
end;

procedure PUMLCustomSeqObjectView.Setup;
begin
  inherited;
  LifeLine := MetaModel.CreateInstance('UMLLifeLineView') as PUMLLifeLineView;
  LifeLine.Model := Self.Model;
end;

function PUMLCustomSeqObjectView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'LifeLine' then begin
    Result := LifeLine;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLCustomSeqObjectView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'LifeLine' then begin
    LifeLine := Value as PUMLLifeLineView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLCustomSeqObjectView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSeqObjectView

function PUMLSeqObjectView.IsActiveObject: Boolean;
var
  M: PUMLObject;
begin
  Result := False;
  if (Model <> nil) and (Model is PUMLObject) then begin
    M := Model as PUMLObject;
    if (M.Classifier <> nil) and (M.Classifier is PUMLClass) then
      Result := (M.Classifier as PUMLClass).IsActive;
  end;
end;

procedure PUMLSeqObjectView.DrawObject(Canvas: PCanvas);
var
  M: PUMLObject;
  R: TRect;
begin
  AssignStyleToCanvas(Canvas);
  if Model <> nil then begin
    M := Model as PUMLObject;
    if (M.Classifier <> nil) and (M.Classifier is PUMLActor) then begin
      DrawActorShapeObject(Canvas);
      Exit;
    end;
  end;
  if Model <> nil then begin
    M := Model as PUMLObject;
    R := Rect(Left, Top, Right, NameCompartment.Bottom);
    if M.IsMultiInstance then begin
      Canvas.Rectangle(R.Left + MULTI_OBJECT_MARGIN, R.Top + MULTI_OBJECT_MARGIN,
        R.Right + MULTI_OBJECT_MARGIN, R.Bottom + MULTI_OBJECT_MARGIN);
    end;
  end;
  inherited;
  if IsActiveObject then begin
    Canvas.MoveTo(Left + CLASS_ACTIVE_VERTLINE_WIDTH, NameCompartment.Top);
    Canvas.LineTo(Left + CLASS_ACTIVE_VERTLINE_WIDTH, NameCompartment.Bottom);
    Canvas.MoveTo(Right - CLASS_ACTIVE_VERTLINE_WIDTH - 1, NameCompartment.Top);
    Canvas.LineTo(Right - CLASS_ACTIVE_VERTLINE_WIDTH - 1, NameCompartment.Bottom);
  end;
end;

procedure PUMLSeqObjectView.ArrangeObject(Canvas: PCanvas);
var
  M: PUMLObject;
begin
  if Model <> nil then begin
    M := Model as PUMLObject;
    if (M.Classifier <> nil) and (M.Classifier is PUMLActor) then begin
      ArrangeActorShapeObject(Canvas);
      Exit;
    end
  end;
  inherited;
  if IsActiveObject then begin
    MinWidth := MinWidth + CLASS_ACTIVE_VERTLINE_WIDTH * 2;
    NameCompartment.Left := Left + CLASS_ACTIVE_VERTLINE_WIDTH;
    NameCompartment.Right := Right - CLASS_ACTIVE_VERTLINE_WIDTH;
  end;
end;

procedure PUMLSeqObjectView.Setup;
begin
  inherited;
  NameCompartment.NameLabel.FontStyle := [fsUnderline];
end;

procedure PUMLSeqObjectView.Update;
var
  M: PUMLObject;
  S: string;
begin
  if Model = nil then Exit;
  inherited;
  M := (Model as PUMLObject);
  if ShowParentName and (M.VirtualNameSpace <> nil) then
    S := M.VirtualNameSpace.Name + '::' + M.Name
  else
    S := M.Name;
  if M.Classifier <> nil then
    S := S + ' : ' + M.Classifier.Name;
  NameCompartment.NameLabel.Text := S;
end;

// PUMLSeqObjectView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSeqClassifierRoleView

procedure PUMLSeqClassifierRoleView.DrawObject(Canvas: PCanvas);
var
  M: PUMLClassifierRole;
begin
  if Model <> nil then begin
    M := Model as PUMLClassifierRole;
    if (M.Base <> nil) and (M.Base is PUMLActor) then begin
      DrawActorShapeObject(Canvas);
      Exit;
    end;
  end;
  inherited;
end;

procedure PUMLSeqClassifierRoleView.ArrangeObject(Canvas: PCanvas);
var
  M: PUMLClassifierRole;
begin
  if Model <> nil then begin
    M := Model as PUMLClassifierRole;
    if (M.Base <> nil) and (M.Base is PUMLActor) then begin
      ArrangeActorShapeObject(Canvas);
      Exit;
    end
  end;
  inherited;
end;

procedure PUMLSeqClassifierRoleView.Setup;
begin
  inherited;
  NameCompartment.NameLabel.FontStyle := [fsBold];
end;

procedure PUMLSeqClassifierRoleView.Update;
var
  M: PUMLClassifierRole;
  S: string;
begin
  if Model = nil then Exit;
  inherited;
  M := (Model as PUMLClassifierRole);
  if ShowParentName and (M.VirtualNameSpace <> nil) then
    S := '/' + M.VirtualNameSpace.Name + '::' + M.Name
  else
    S := '/' + M.Name;
  if M.Base <> nil then S := S + ' : ' + M.Base.Name;
  NameCompartment.NameLabel.Text := S;
  if M.IsAbstract then
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle + [fsItalic]
  else
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle - [fsItalic];
end;

// PUMLSeqClassifierRoleView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActivationView

constructor PUMLActivationView.Create;
begin
  inherited;
  MinWidth := ACTIVATION_MINWIDTH;
  MinHeight := ACTIVATION_MINHEIGHT;
  Width := ACTIVATION_MINWIDTH;
  Height := ACTIVATION_MINHEIGHT;
  Sizable := szVert;
  Movable := mmNone;
end;

procedure PUMLActivationView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
end;

procedure PUMLActivationView.ArrangeObject(Canvas: PCanvas);
var
  I: Integer;
  Y: Integer;
  MinimumBottom: Integer;
  Msg: PUMLCustomSeqMessageView;
  MessageView: PUMLCustomSeqMessageView;
  LifeLine: PUMLLifeLineView;
  ParentActivation: PUMLActivationView;
begin
  inherited;
  MinWidth := ACTIVATION_MINWIDTH;
  MinHeight := ACTIVATION_MINHEIGHT;
  MessageView := Parent as PUMLCustomSeqMessageView;
  LifeLine := MessageView.Head as PUMLLifeLineView;
  ParentActivation := LifeLine.GetActivationAt(Top - 1);
  Top := MessageView.Points.Points[MessageView.Points.Count - 1].Y;
  Width := ACTIVATION_MINWIDTH;
  // Left position extrudes a little right than Parent Activation
  if ParentActivation <> nil then
    Left := ParentActivation.Left + (ACTIVATION_MINWIDTH div 2)
  else
    Left := LifeLine.Left - (ACTIVATION_MINWIDTH div 2);

  // if Activation is not shown
  if not Visible then begin
    if ParentActivation <> nil then
      Left := ParentActivation.Left
    else
      Left := LifeLine.Left;
  end
  // if Activation is shown
  else begin
    // Height must wrap all Child Activations at least.
    //   - Child Activation satisfies below conditions
    //     (1) in all current LifeLine's In-coming Messages,
    //     (2) if its head side's y position is between Top and Bottom,
    //     (3) the message's Activation is really Child Activation.
    MinimumBottom := Top + ACTIVATION_MINHEIGHT;
    for I := 0 to GetDiagramView.OwnedViewCount - 1 do begin
      if GetDiagramView.OwnedView[I] is PUMLCustomSeqMessageView then begin
        Msg := GetDiagramView.OwnedView[I] as PUMLCustomSeqMessageView;
        if (Msg.Head = LifeLine) and (Msg <> MessageView) then begin
          Y := Msg.Points.Points[Msg.Points.Count - 1].Y;
          if (Top <= Y) and (Bottom > Y) then begin
            if Msg.Activation.Visible and (Msg.Activation.Bottom > MinimumBottom) then
              MinimumBottom := Msg.Activation.Bottom;
          end;
        end;
      end;
    end;
    if Bottom < MinimumBottom + 3 then
      Bottom := MinimumBottom + 3;
  end;
end;

// PUMLActivationView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomSeqMessageView

constructor PUMLCustomSeqMessageView.Create;
begin
  inherited;
  FNameLabel := nil;
  FStereotypeLabel := nil;
  FPropertyLabel := nil;
  FActivation := nil;
  Self.LineStyle := lsRectilinear;
  FShowProperty := False;
end;

procedure PUMLCustomSeqMessageView.InitializeNameLabel(AEdgeLabel: PEdgeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AEdgeLabel.Selectable := True;
  AEdgeLabel.HorzAlignment := haCenter;
  AEdgeLabel.VertAlignment := vaTop;
  AEdgeLabel.ParentLineColor := False;
  AEdgeLabel.ParentFillColor := False;
  AEdgeLabel.ParentFontFace := False;
  AEdgeLabel.ParentFontSize := False;
  AEdgeLabel.ParentFontColor := False;
  AEdgeLabel.ParentFontStyle := False;
end;

procedure PUMLCustomSeqMessageView.InitializeStereotypeLabel(AEdgeLabel: PEdgeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AEdgeLabel.Selectable := True;
  AEdgeLabel.HorzAlignment := haCenter;
  AEdgeLabel.VertAlignment := vaTop;
  AEdgeLabel.ParentLineColor := False;
  AEdgeLabel.ParentFillColor := False;
  AEdgeLabel.ParentFontFace := False;
  AEdgeLabel.ParentFontSize := False;
  AEdgeLabel.ParentFontColor := False;
  AEdgeLabel.ParentFontStyle := False;
end;

procedure PUMLCustomSeqMessageView.InitializePropertyLabel(AEdgeLabel: PEdgeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AEdgeLabel.Selectable := True;
  AEdgeLabel.HorzAlignment := haCenter;
  AEdgeLabel.VertAlignment := vaTop;
  AEdgeLabel.ParentLineColor := False;
  AEdgeLabel.ParentFillColor := False;
  AEdgeLabel.ParentFontFace := False;
  AEdgeLabel.ParentFontSize := False;
  AEdgeLabel.ParentFontColor := False;
  AEdgeLabel.ParentFontStyle := False;
end;

procedure PUMLCustomSeqMessageView.InitializeActivation(AActivation: PUMLActivationView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AActivation.Sizable := szVert;
  AActivation.Movable := mmNone;
  AActivation.Selectable := True;
  AActivation.ParentLineColor := True;
  AActivation.ParentFillColor := True;
  AActivation.ParentFontFace := True;
  AActivation.ParentFontSize := True;
  AActivation.ParentFontColor := True;
  AActivation.ParentFontStyle := True;
end;

procedure PUMLCustomSeqMessageView.SetNameLabel(Value: PEdgeLabelView);
begin
  if FNameLabel <> Value then begin
    RemoveSubView(FNameLabel);
    FNameLabel := Value;
    if FNameLabel <> nil then InitializeNameLabel(FNameLabel);
    AddSubView(FNameLabel);
  end;
end;

procedure PUMLCustomSeqMessageView.SetStereotypeLabel(Value: PEdgeLabelView);
begin
  if FStereotypeLabel <> Value then begin
    RemoveSubView(FStereotypeLabel);
    FStereotypeLabel := Value;
    if FStereotypeLabel <> nil then InitializeStereotypeLabel(FStereotypeLabel);
    AddSubView(FStereotypeLabel);
  end;
end;

procedure PUMLCustomSeqMessageView.SetPropertyLabel(Value: PEdgeLabelView);
begin
  if FPropertyLabel <> Value then begin
    RemoveSubView(FPropertyLabel);
    FPropertyLabel := Value;
    if FPropertyLabel <> nil then InitializePropertyLabel(FPropertyLabel);
    AddSubView(FPropertyLabel);
  end;
end;

procedure PUMLCustomSeqMessageView.SetActivation(Value: PUMLActivationView);
begin
  if FActivation <> Value then begin
    RemoveSubView(FActivation);
    FActivation := Value;
    if FActivation <> nil then InitializeActivation(FActivation);
    AddSubView(FActivation);
  end;
end;

procedure PUMLCustomSeqMessageView.SetShowProperty(Value: Boolean);
begin
  if FShowProperty <> Value then begin
    FShowProperty := Value;
  end;
end;

procedure PUMLCustomSeqMessageView.RegulateSequenceNumber;
var
  FromLifeLine: PUMLLifeLineView;
  FromActivation: PUMLActivationView;
  Sti: PUMLStimulus;
  Msg: PUMLMessage;
  Inter: PUMLInteraction;
  InterIns: PUMLInteractionInstanceSet;
  DgmView: PDiagramView;
  SN, SN2, C: Integer;

  // (XPos,YPos)점의 위치에 있는 경우 SequenceNumer의 값을 계산하는 함수.
  function GetSequenceNumberByPos(XPos, YPos: Integer): Integer;
  var
    I: Integer;
    V: PUMLCustomSeqMessageView;
    SeqNum: Integer;
  begin
    SeqNum := 0;
    for I := 0 to GetDiagramView.OwnedViewCount - 1 do begin
      if GetDiagramView.OwnedView[I] is PUMLCustomSeqMessageView then begin
        V := GetDiagramView.OwnedView[I] as PUMLCustomSeqMessageView;
        if V.Points.Points[0].Y < YPos then begin
          SeqNum := SeqNum + 1;
        end
        else if V.Points.Points[0].Y = YPos then begin
          if V.Points.Points[0].X < XPos then SeqNum := SeqNum + 1;
        end;
      end;
    end;
    Result := SeqNum;
  end;

begin
  FromLifeLine := Tail as PUMLLifeLineView;
  FromActivation := FromLifeLine.GetActivationAt(Points.Points[0].Y);
  DgmView := GetDiagramView;
  if Model is PUMLStimulus then begin
    Sti := Model as PUMLStimulus;
    InterIns := Sti.InteractionInstanceSet;
    SN := Sti.InteractionInstanceSet.IndexOfParticipatingStimulus(Sti);
  end
  else if Model is PUMLMessage then begin
    Msg := Model as PUMLMessage;
    Inter := Msg.Interaction;
    SN := Msg.Interaction.IndexOfMessage(Msg);
  end;

  // determine SequenceNumber
  SN2 := GetSequenceNumberByPos(Points.Points[0].X, Points.Points[0].Y);
  if SN <> SN2 then begin // if SequenceNumber is changed
    if Model is PUMLStimulus then begin
      // move at OwnerView's Indext to correspond to SequenceNumber
      C := DgmView.IndexOfOwnedView(Sti.InteractionInstanceSet.ParticipatingStimuli[SN2].View[0]);
      if C >= 0 then begin
        DgmView.RemoveOwnedView(Self);
        DgmView.InsertOwnedView(C, Self);
      end;
      // move at InteractionInstanceSet's Indext to correspond to SequenceNumber
      InterIns.RemoveParticipatingStimulus(Sti);
      InterIns.InsertParticipatingStimulus(SN2, Sti);
    end
    else if Model is PUMLMessage then begin
      // change by OwnedView's Indext to correspond to SequenceNumber
      C := DgmView.IndexOfOwnedView(Msg.Interaction.Messages[SN2].View[0]);
      DgmView.RemoveOwnedView(Self);
      DgmView.InsertOwnedView(C, Self);
      // move at Interaction's Indext to correspond to SequenceNumber.
      Inter.RemoveMessage(Msg);
      Inter.InsertMessage(SN2, Msg);
    end;
  end;
end;

procedure PUMLCustomSeqMessageView.AfterLoad(Reader: PObjectReader);
begin
  inherited;
  // StarUML
  if PropertyLabel = nil then begin
  PropertyLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
    PropertyLabel.Model := Model;
    PropertyLabel.HostEdge := Self;
    PropertyLabel.EdgePosition := epMiddle;
    PropertyLabel.Distance := 10;
    PropertyLabel.Alpha := - PI / 2;
  end;
end;

procedure PUMLCustomSeqMessageView.ChangePoints(APoints: PPoints);
begin
  inherited;
  Activation.Top := APoints.Points[0].Y;
end;

procedure PUMLCustomSeqMessageView.ArrangeObject(Canvas: PCanvas);

  procedure FixPointCount(Cnt, XPos, YPos: Integer);
  var
    PI: Integer;
  begin
    if Points.Count <> Cnt then begin
      Points.Clear;
      for PI := 1 to Cnt do Points.Add(Point(XPos, YPos));
    end;
  end;

var
  FromLifeLine, ToLifeLine: PUMLLifeLineView;
  FromActivation, ToActivation: PUMLActivationView;
begin
  NameLabel.Visible := (NameLabel.Text <> '');
  StereotypeLabel.Visible := (StereotypeLabel.Text <> '');

  // default variable values
  LineStyle := lsRectilinear;

  FromLifeLine := Tail as PUMLLifeLineView;
  FromActivation := FromLifeLine.GetActivationAt(Points.Points[0].Y);
  ToLifeLine := Head as PUMLLifeLineView;
  ToActivation := ToLifeLine.GetActivationAt(Points.Points[Points.Count - 1].Y);

  // (1) in case of Self message
  if Head = Tail then begin
    FixPointCount(4, Points.Points[0].X, Points.Points[0].Y);
    if (FromActivation <> nil) and FromActivation.Visible then
      Points.Points[0] := Point(FromActivation.Right, Points.Points[0].Y)
    else
      Points.Points[0] := Point(FromLifeLine.Right, Points.Points[0].Y);
    Points.Points[1] := Point(Points.Points[0].X + SELF_MESSAGE_WIDTH, Points.Points[0].Y);
    Points.Points[2] := Point(Points.Points[0].X + SELF_MESSAGE_WIDTH, Points.Points[0].Y + SELF_MESSAGE_HEIGHT);
    if (ToActivation <> nil) and ToActivation.Visible then
      Points.Points[3] := Point(Activation.Right, Points.Points[0].Y + SELF_MESSAGE_HEIGHT)
    else
      Points.Points[3] := Point((Tail as PUMLLifeLineView).Right, Points.Points[0].Y + SELF_MESSAGE_HEIGHT)
  end
  // (2) in case of left-to-right directed message
  else if Points.Points[1].X > Points.Points[0].X then begin
    FixPointCount(2, Points.Points[0].X, Points.Points[0].Y);
    if (FromActivation <> nil) and FromActivation.Visible then
      Points.Points[0] := Point(FromActivation.Right, Points.Points[0].Y)
    else
      Points.Points[0] := Point(FromLifeLine.Right, Points.Points[0].Y);
    if (ToActivation <> nil) and ToActivation.Visible then
      Points.Points[1] := Point(Activation.Left, Points.Points[0].Y)
    else
      Points.Points[1] := Point((Head as PUMLLifeLineView).Left, Points.Points[0].Y)
  end
  // (3) in case of right-to-left direced message
  else begin
    FixPointCount(2, Points.Points[0].X, Points.Points[0].Y);
    if (FromActivation <> nil) and FromActivation.Visible then
      Points.Points[0] := Point(FromActivation.Left, Points.Points[0].Y)
    else
      Points.Points[0] := Point(FromLifeLine.Left, Points.Points[0].Y);
    if (ToActivation <> nil) and ToActivation.Visible then
      Points.Points[1] := Point(Activation.Right, Points.Points[0].Y)
    else
      Points.Points[1] := Point((Head as PUMLLifeLineView).Right, Points.Points[0].Y)
  end;

  // call Update here because Action's changes are not reflected
  Update;
end;

procedure PUMLCustomSeqMessageView.Initialize(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
begin
  LineStyle := lsRectilinear;
  if Head <> Tail then begin
    Points.Clear;
    Points.Add(Point((Tail as PUMLLifeLineView).Right, Y1));
    Points.Add(Point((Head as PUMLLifeLineView).Left, Y2));
  end
  else begin // Self Message
    Points.Clear;
    Points.Add(Point(X1, Y1));
    Points.Add(Point(X1, Y1));
    Points.Add(Point(X1, Y1));
    Points.Add(Point(X1, Y1));
  end;
end;

procedure PUMLCustomSeqMessageView.Setup;
begin
  inherited;
  Activation := MetaModel.CreateInstance('UMLActivationView') as PUMLActivationView;
  NameLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  NameLabel.Model := Model;
  NameLabel.HostEdge := Self;
  NameLabel.EdgePosition := epMiddle;
  NameLabel.Distance := 10;
  NameLabel.Alpha := PI / 2;
  StereotypeLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  StereotypeLabel.Model := Model;
  StereotypeLabel.HostEdge := Self;
  StereotypeLabel.EdgePosition := epMiddle;
  StereotypeLabel.Distance := 25;
  StereotypeLabel.Alpha := PI / 2;
  PropertyLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  PropertyLabel.Model := Model;
  PropertyLabel.HostEdge := Self;
  PropertyLabel.EdgePosition := epMiddle;
  PropertyLabel.Distance := 10;
  PropertyLabel.Alpha := - PI / 2;
end;

procedure PUMLCustomSeqMessageView.Arrange(Canvas: PCanvas);
begin
  Activation.ArrangeObject(Canvas);
  PropertyLabel.Visible := ShowProperty and (PropertyLabel.Text <> '');
  inherited;
end;

function GetMessageString(MessageOrStimulus: PModel; ShowSequenceNumber: Boolean; SignatureKind: PUMLMessageSignatureKind): string;
var
  S, T: string;
  Action: PUMLAction;
  Iteration, Branch: string;
  Return, Arguments: string;
  SeqNum: Integer;

  function GetReturnType(Op: PUMLOperation): string;
  var
    I: Integer;
  begin
    Result := 'void';
    for I := 0 to Op.ParameterCount - 1 do
      if (Op.Parameters[I].DirectionKind = pdkReturn) and (Op.Parameters[I].TypeExpression <> '') then begin
        Result := Op.Parameters[I].TypeExpression;
        Exit;
      end;
  end;

  function GetOperationString(OpName, Return, Arguments: string; SignatureKind: PUMLMessageSignatureKind; NeedBraces: Boolean = True): string; overload;
  var
    OpStr: string;
  begin
    OpStr := '';
    if OpName <> '' then begin
      if Return <> '' then
        OpStr := OpStr + Return + ' := ';
      OpStr := OpStr + OpName;
      if SignatureKind = mskNone then begin
        if NeedBraces then
          OpStr := OpStr + '()'
      end
      else begin
        if NeedBraces or (Arguments <> '') then
          OpStr := OpStr + '(' + Arguments + ')';
      end;
    end;
    Result := OpStr;
  end;

  function GetOperationString(Op: PUMLOperation; OpName, Return, Arguments: string; SignatureKind: PUMLMessageSignatureKind): string; overload;
  var
    I: Integer;
    PAdded: Boolean;
    NameStr, RetStr, ParamStr, RetTypeStr: string;
  begin
    if Op <> nil then
      NameStr := Op.Name
    else
      NameStr := OpName;
    RetStr := '';
    if Return <> '' then
      RetStr := Return + ' := ';
    RetTypeStr := '';
    if (Return = '') and ((SignatureKind = mskTypeOnly) or (SignatureKind = mskNameAndType)) then
      RetTypeStr := ': ' + GetReturnType(Op);
    if Arguments <> '' then begin
      if SignatureKind = mskNone then
        ParamStr := '()'
      else
        ParamStr := '(' + Arguments + ')'
    end
    else begin
      case SignatureKind of
        mskNone:
          ParamStr := '()';
        mskNameOnly:
          begin
            PAdded := False;
            ParamStr := '(';
            for I := 0 to Op.ParameterCount - 1 do begin
              if Op.Parameters[I].DirectionKind <> pdkReturn then begin
                if PAdded then
                  ParamStr := ParamStr + ', ';
                PAdded := True;
                ParamStr := ParamStr + Op.Parameters[I].Name;
              end;
            end;
            ParamStr := ParamStr + ')';
          end;
        mskTypeOnly:
          begin
            PAdded := False;
            ParamStr := '(';
            for I := 0 to Op.ParameterCount - 1 do begin
              if Op.Parameters[I].DirectionKind <> pdkReturn then begin
                if PAdded then
                  ParamStr := ParamStr + ', ';
                PAdded := True;
                if Op.Parameters[I].TypeExpression = '' then
                  ParamStr := ParamStr + 'void'
                else
                  ParamStr := ParamStr + Op.Parameters[I].TypeExpression;
              end;
            end;
            ParamStr := ParamStr + ')';
          end;
        mskNameAndType:
          begin
            PAdded := False;
            ParamStr := '(';
            for I := 0 to Op.ParameterCount - 1 do begin
              if Op.Parameters[I].DirectionKind <> pdkReturn then begin
                if PAdded then
                  ParamStr := ParamStr + ', ';
                PAdded := True;
                if Op.Parameters[I].TypeExpression = '' then
                  ParamStr := ParamStr + Op.Parameters[I].Name
                else
                  ParamStr := ParamStr + Op.Parameters[I].Name + ': ' + Op.Parameters[I].TypeExpression;
              end;
            end;
            ParamStr := ParamStr + ')';
          end;
      end;
    end;
    Result := RetStr + NameStr + ParamStr + RetTypeStr;
  end;

begin
  S := '';
  if MessageOrStimulus is PUMLStimulus then begin
    Action := (MessageOrStimulus as PUMLStimulus).Action;
    SeqNum := (MessageOrStimulus as PUMLStimulus).InteractionInstanceSet.IndexOfParticipatingStimulus(MessageOrStimulus as PUMLStimulus) + 1;
    Iteration := (MessageOrStimulus as PUMLStimulus).Iteration;
    Branch := (MessageOrStimulus as PUMLStimulus).Branch;
    Return := (MessageOrStimulus as PUMLStimulus).Return;
    Arguments := (MessageOrStimulus as PUMLStimulus).Arguments;
  end
  else if MessageOrStimulus is PUMLMessage then begin
    Action := (MessageOrStimulus as PUMLMessage).Action;
    SeqNum := (MessageOrStimulus as PUMLMessage).Interaction.IndexOfMessage(MessageOrStimulus as PUMLMessage) + 1;
    Iteration := (MessageOrStimulus as PUMLMessage).Iteration;
    Branch := (MessageOrStimulus as PUMLMessage).Branch;
    Return := (MessageOrStimulus as PUMLMessage).Return;
    Arguments := (MessageOrStimulus as PUMLMessage).Arguments;
  end;

  // Sequence Number & Recurrence Part
  if ShowSequenceNumber then
    S := S + IntToStr(SeqNum);
  if Iteration <> '' then
    S := S + ' *[' + Iteration + ']';
  if Branch <> '' then
    S := S + ' [' + Branch + ']';

  // Message Signature Part
  T := MessageOrStimulus.Name;
  if (Action is PUMLCallAction) and ((Action as PUMLCallAction).Operation <> nil) then
    T := GetOperationString((Action as PUMLCallAction).Operation, MessageOrStimulus.Name, Return, Arguments, SignatureKind)
  else if (Action is PUMLSendAction) and ((Action as PUMLSendAction).Signal <> nil) then
    T := GetOperationString((Action as PUMLSendAction).Signal.Name, Return, Arguments, SignatureKind, False)
  else if (Action is PUMLCreateAction) and ((Action as PUMLCreateAction).Instantiation <> nil) then
    T := GetOperationString((Action as PUMLCreateAction).Instantiation.Name, Return, Arguments, SignatureKind, True)
  else if (Action is PUMLSendAction) or (Action is PUMLReturnAction) then
    T := GetOperationString(MessageOrStimulus.Name, Return, Arguments, SignatureKind, False)
  else
    T := GetOperationString(MessageOrStimulus.Name, Return, Arguments, SignatureKind, True);

  if (S <> '') and (T <> '') then
    Result := S + ' : ' + T
  else
    Result := S + T;
end;

procedure PUMLCustomSeqMessageView.Update;
var
  Action: PUMLAction;
  ShowSequenceNumber: Boolean;
  MessageSignature: PUMLMessageSignatureKind;
  ShowActivation: Boolean;
begin
  if Model = nil then Exit;
  inherited;
  ShowSequenceNumber := StringToBoolean(GetDiagramView.Diagram.MOF_GetAttribute('ShowSequenceNumber'));
  MessageSignature := StringToUMLMessageSignatureKind(GetDiagramView.Diagram.MOF_GetAttribute('MessageSignature'));
  ShowActivation := StringToBoolean(GetDiagramView.Diagram.MOF_GetAttribute('ShowActivation'));
  NameLabel.Text := GetMessageString(Model, ShowSequenceNumber, MessageSignature);

  if Model is PUMLStimulus then
    Action := (Model as PUMLStimulus).Action
  else if Model is PUMLMessage then
    Action := (Model as PUMLMessage).Action;

  Activation.Visible := ShowActivation and ((Action is PUMLCallAction) or (Action is PUMLCreateAction) or
    (Action is PUMLDestroyAction));

  if Action is PUMLReturnAction then
    LineMode := lmDot
  else
    LineMode := lmSolid;

  if (Action is PUMLReturnAction) or (Action is PUMLSendAction) then
    HeadEndStyle := esStickArrow
  else if Action.IsAsynchronous then
    HeadEndStyle := esStickArrow
  else
    HeadEndStyle := esSolidArrow;

  if Action is PUMLCreateAction then
    StereotypeLabel.Text := '<<create>>'
  else if Action is PUMLDestroyAction then
    StereotypeLabel.Text := '<<destroy>>'
  else if (Model as PUMLModelElement).StereotypeName <> '' then
    StereotypeLabel.Text := '<<' + (Model as PUMLModelElement).StereotypeName + '>>'
  else
    StereotypeLabel.Text := '';

  PropertyLabel.Text := GetPropertyString(Model as PExtensibleModel);
end;

function PUMLCustomSeqMessageView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'ShowProperty' then begin
    Result := BooleanToString(ShowProperty);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PUMLCustomSeqMessageView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'ShowProperty' then begin
    ShowProperty := StringToBoolean(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PUMLCustomSeqMessageView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'NameLabel' then begin
    Result := NameLabel;
  end
  else if Name = 'StereotypeLabel' then begin
    Result := StereotypeLabel;
  end
  else if Name = 'PropertyLabel' then begin
    Result := PropertyLabel;
  end
  else if Name = 'Activation' then begin
    Result := Activation;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLCustomSeqMessageView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'NameLabel' then begin
    NameLabel := Value as PEdgeLabelView;
  end
  else if Name = 'StereotypeLabel' then begin
    StereotypeLabel := Value as PEdgeLabelView;
  end
  else if Name = 'PropertyLabel' then begin
    PropertyLabel := Value as PEdgeLabelView;
  end
  else if Name = 'Activation' then begin
    Activation := Value as PUMLActivationView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLCustomSeqMessageView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomFrameView

constructor PUMLCustomFrameView.Create;
begin
  inherited;
  FFrameTypeLabel := nil;
  FNameLabel := nil;
end;

procedure PUMLCustomFrameView.InitializeFrameTypeLabel(ALabel: PLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ALabel.Selectable := False;
  ALabel.HorzAlignment := haCenter;
  ALabel.VertAlignment := vaTop;
  ALabel.ParentLineColor := True;
  ALabel.ParentFillColor := True;
  ALabel.ParentFontFace := True;
  ALabel.ParentFontSize := True;
  ALabel.ParentFontColor := True;
  ALabel.ParentFontStyle := False;
end;

procedure PUMLCustomFrameView.InitializeNameLabel(ALabel: PLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ALabel.Selectable := False;
  ALabel.HorzAlignment := haCenter;
  ALabel.VertAlignment := vaTop;
  ALabel.ParentLineColor := True;
  ALabel.ParentFillColor := True;
  ALabel.ParentFontFace := True;
  ALabel.ParentFontSize := True;
  ALabel.ParentFontColor := True;
  ALabel.ParentFontStyle := False;
end;

procedure PUMLCustomFrameView.SetNameLabel(Value: PLabelView);
begin
  if FNameLabel <> Value then begin
    RemoveSubView(FNameLabel);
    FNameLabel := Value;
    if FNameLabel <> nil then InitializeNameLabel(FNameLabel);
    AddSubView(FNameLabel);
  end;
end;

procedure PUMLCustomFrameView.SetFrameTypeLabel(Value: PLabelView);
begin
  if FFrameTypeLabel <> Value then begin
    RemoveSubView(FFrameTypeLabel);
    FFrameTypeLabel := Value;
    if FFrameTypeLabel <> nil then InitializeFrameTypeLabel(FFrameTypeLabel);
    AddSubView(FFrameTypeLabel);
  end;
end;

procedure PUMLCustomFrameView.ArrangeObject(Canvas: PCanvas);
var
  H, W: Integer;
begin
  inherited;
  H := Max(FrameTypeLabel.MinHeight, NameLabel.MinHeight)
    + COMPARTMENT_TOP_MARGIN + COMPARTMENT_BOTTOM_MARGIN;
  MinHeight := Max(H + FRAME_CONTENT_MINHEIGHT, FRAME_MINHEIGHT);
  W := FrameTypeLabel.MinWidth + NameLabel.MinWidth;
  if FrameTypeLabel.Visible and FrameTypeLabel.Visible then
    W := W + LABEL_INTERVAL;
  W := W + COMPARTMENT_LEFT_MARGIN + COMPARTMENT_RIGHT_MARGIN + H div 2;
  MinWidth := Max(W + FRAME_CONTENT_MINWIDTH, FRAME_MINWIDTH);
  FrameTypeLabel.Left := Left + COMPARTMENT_LEFT_MARGIN;
  FrameTypeLabel.Top := Top + COMPARTMENT_TOP_MARGIN;
  FrameTypeLabel.Right := FrameTypeLabel.Left + FrameTypeLabel.MinWidth;
  if FrameTypeLabel.Visible then
    NameLabel.Left := FrameTypeLabel.Right + LABEL_INTERVAL
  else
    NameLabel.Left := Left + COMPARTMENT_LEFT_MARGIN;
  NameLabel.Top := Top + COMPARTMENT_TOP_MARGIN;
  NameLabel.Right := NameLabel.Left + NameLabel.MinWidth;
end;

procedure PUMLCustomFrameView.DrawObject(Canvas: PCanvas);
var
  X, Y, H: Integer;
begin
  AssignStyleToCanvas(Canvas);
  Y := Max(FrameTypeLabel.Bottom, NameLabel.Bottom) + COMPARTMENT_BOTTOM_MARGIN;
  H := Y - Top;
  X := NameLabel.Right + COMPARTMENT_RIGHT_MARGIN + H div 2;
  Canvas.Polyline([Point(Left, Top), Point(Right, Top), Point(Right, Bottom), Point(Left, Bottom), Point(Left, Top)]);
  Canvas.Polygon([Point(Left, Top), Point(Left, Y), Point(X - H div 2, Y),
    Point(X, Top + H div 2), Point(X, Top), Point(Left, Top)]);
end;

procedure PUMLCustomFrameView.Setup;
begin
  // WARNING -------------------------------------------------------------------
  // DO NOT ASSIGN SUBVIEW'S "TRANSIENT" PROPERTIES IN "SETUP" PROCEDURE.
  // IF YOU NEED TO ASSIGN SUBVIEW'S "TRANSIENT" PROPERTIES, MAKE A INITIALIZE
  // PROCEDURE AND PLACE IT IN SETTER PROCEDURE OF THE PROPERTY.
  // ---------------------------------------------------------------------------
  inherited;
  NameLabel := MetaModel.CreateInstance('LabelView') as PLabelView;
  FrameTypeLabel := MetaModel.CreateInstance('LabelView') as PLabelView;
  FrameTypeLabel.FontStyle := [fsBold];
end;

function PUMLCustomFrameView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'NameLabel' then begin
    Result := NameLabel;
  end
  else if Name = 'FrameTypeLabel' then begin
    Result := FrameTypeLabel;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLCustomFrameView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'NameLabel' then begin
    NameLabel := Value as PLabelView;
  end
  else if Name = 'FrameTypeLabel' then begin
    FrameTypeLabel := Value as PLabelView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLCustomFrameView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLFrameView

procedure PUMLFrameView.Update;
var
  M: PUMLFrame;
begin
  if Model = nil then Exit;
  inherited;
  M := Model as PUMLFrame;
  FrameTypeLabel.Text := M.FrameKind;
  if M.Name <> '' then
    NameLabel.Text := Model.Name
  else if M.RepresentedElement <> nil then
    NameLabel.Text := M.RepresentedElement.Name;
end;

// PUMLFrameView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCombinedFragmentView

function PUMLCombinedFragmentView.GetInteractionOperatorText: string;
var
  M: PUMLCombinedFragment;
begin
  Result := '';
  if (Model <> nil) and (Model is PUMLCombinedFragment) then begin
    M := Model as PUMLCombinedFragment;
    case M.InteractionOperator of
      iokSeq: Result := 'seq';
      iokAlt: Result := 'alt';
      iokOpt: Result := 'opt';
      iokBreak: Result := 'break';
      iokPar: Result := 'par';
      iokStrict: Result := 'strict';
      iokLoop: Result := 'loop';
      iokRegion: Result := 'region';
      iokNeg: Result := 'neg';
      iokAssert: Result := 'assert';
      iokIgnore: Result := 'ignore';
      iokConsider: Result := 'consider';
    end;
  end;
end;

function CompareInteractionOperandViewYPosition(Item1, Item2: Pointer): Integer;
var
  V1, V2: PUMLInteractionOperandView;
begin
  V1 := Item1;
  V2 := Item2;
  if V1.Top < V2.Top then Result := -1
  else if V1.Top = V2.Top then Result := 0
  else Result := 1;
end;

procedure PUMLCombinedFragmentView.CarryOnInteractionOperandViews;
var
  InterOpViews: TList;
  FirstIOV, LastIOV: PUMLInteractionOperandView;
  I: Integer;
begin
  if ContainedViewCount > 0 then begin
    InterOpViews := TList.Create;
    try
      for I := 0 to ContainedViewCount - 1 do
        if ContainedViews[I] is PUMLInteractionOperandView then
          InterOpViews.Add(ContainedViews[I]);
      if InterOpViews.Count > 0 then begin
        InterOpViews.Sort(CompareInteractionOperandViewYPosition);
        FirstIOV := InterOpViews[0];
        FirstIOV.Top := Max(FrameTypeLabel.Bottom, NameLabel.Bottom) + COMPARTMENT_BOTTOM_MARGIN;
        for I := 1 to InterOpViews.Count - 1 do
          PUMLInteractionOperandView(InterOpViews[I]).Top := PUMLInteractionOperandView(InterOpViews[I - 1]).Bottom;
        LastIOV := InterOpViews[InterOpViews.Count - 1];
        LastIOV.Bottom := Bottom;
        MinHeight := LastIOV.Top + LastIOV.MinHeight - Top;
      end;
    finally
      InterOpViews.Free;
    end;
  end;
end;

procedure PUMLCombinedFragmentView.ArrangeObject(Canvas: PCanvas);
var
  InterOpView: PUMLInteractionOperandView;
  I: Integer;
begin
  inherited;
  for I := 0 to ContainedViewCount - 1 do
    if ContainedViews[I] is PUMLInteractionOperandView then begin
      InterOpView := ContainedViews[I] as PUMLInteractionOperandView;
      InterOpView.Left := Left;
      InterOpView.Right := Right;
      InterOpView.ArrangeObject(Canvas);
      MinWidth := Max(MinWidth, InterOpView.MinWidth);
    end;
  CarryOnInteractionOperandViews;
end;

procedure PUMLCombinedFragmentView.Update;
begin
  if Model = nil then Exit;
  inherited;
  NameLabel.Text := Model.Name;
  FrameTypeLabel.Text := GetInteractionOperatorText;
  NameLabel.Visible := (NameLabel.Text <> '');
  FrameTypeLabel.Visible := (FrameTypeLabel.Text <> '');
end;

// PUMLCombinedFragmentView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLInteractionOperandView

constructor PUMLInteractionOperandView.Create;
begin
  inherited;
  FGuardLabel := nil;
  Movable := mmVert;
  Sizable := szVert;
  ContainerChangeable := False;
end;

procedure PUMLInteractionOperandView.InitializeGuardLabel(ALabel: PLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ALabel.Selectable := False;
  ALabel.HorzAlignment := haCenter;
  ALabel.VertAlignment := vaTop;
  ALabel.ParentLineColor := True;
  ALabel.ParentFillColor := True;
  ALabel.ParentFontFace := True;
  ALabel.ParentFontSize := True;
  ALabel.ParentFontColor := True;
  ALabel.ParentFontStyle := False;
end;

procedure PUMLInteractionOperandView.SetGuardLabel(Value: PLabelView);
begin
  if FGuardLabel <> Value then begin
    RemoveSubView(FGuardLabel);
    FGuardLabel := Value;
    if FGuardLabel <> nil then InitializeGuardLabel(FGuardLabel);
    AddSubView(FGuardLabel);
  end;
end;

function PUMLInteractionOperandView.IsDrawDeferred: Boolean;
begin
  Result := True;
end;

function PUMLInteractionOperandView.IsTopInterationOperandView: Boolean;
var
  InterOpView: PUMLInteractionOperandView;
  V: PView;
  I: Integer;
begin
  Result := True;
  if ContainerView <> nil then
    for I := 0 to ContainerView.ContainedViewCount - 1 do begin
      V := ContainerView.ContainedViews[I];
      if (V is PUMLInteractionOperandView) and (V <> Self) then begin
        InterOpView := V as PUMLInteractionOperandView;
        if InterOpView.Top < Top then begin
          Result := False;
          Exit;
        end;
      end;
    end;
end;

procedure PUMLInteractionOperandView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  MinWidth := Max(GuardLabel.MinWidth + INTERACTIONOPERAND_GUARD_HORZ_MARGIN * 2, INTERACTIONOPERAND_MINWIDTH);
  MinHeight := Max(GuardLabel.MinHeight + INTERACTIONOPERAND_GUARD_VERT_MARGIN * 2, INTERACTIONOPERAND_MINHEIGHT);
  GuardLabel.Left := Left + INTERACTIONOPERAND_GUARD_HORZ_MARGIN;
  GuardLabel.Top := Top + INTERACTIONOPERAND_GUARD_VERT_MARGIN;
  GuardLabel.Width := GuardLabel.MinWidth;
  GuardLabel.Height := GuardLabel.MinHeight;
end;

procedure PUMLInteractionOperandView.DrawObject(Canvas: PCanvas);
begin
  if not IsTopInterationOperandView then begin
    AssignStyleToCanvas(Canvas);
    Canvas.Pen.Style := psDash;
    Canvas.MoveTo(Left, Top);
    Canvas.LineTo(Right, Top);
  end;    
end;

procedure PUMLInteractionOperandView.Setup;
begin
  // WARNING -------------------------------------------------------------------
  // DO NOT ASSIGN SUBVIEW'S "TRANSIENT" PROPERTIES IN "SETUP" PROCEDURE.
  // IF YOU NEED TO ASSIGN SUBVIEW'S "TRANSIENT" PROPERTIES, MAKE A INITIALIZE
  // PROCEDURE AND PLACE IT IN SETTER PROCEDURE OF THE PROPERTY.
  // ---------------------------------------------------------------------------
  inherited;
  GuardLabel := MetaModel.CreateInstance('LabelView') as PLabelView;
end;

procedure PUMLInteractionOperandView.Update;
var
  M: PUMLInteractionOperand;
begin
  if Model = nil then Exit;
  inherited;
  M := Model as PUMLInteractionOperand;
  if M.Guard = '' then
    GuardLabel.Text := ''
  else
    GuardLabel.Text := '[' + M.Guard + ']';
  GuardLabel.Visible := (GuardLabel.Text <> '');
end;

function PUMLInteractionOperandView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'GuardLabel' then begin
    Result := GuardLabel;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLInteractionOperandView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'GuardLabel' then begin
    GuardLabel := Value as PLabelView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLInteractionOperandView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCollaborationView

constructor PUMLCollaborationView.Create;
begin
  inherited;
  FTemplateParameterCompartment := nil;
end;

procedure PUMLCollaborationView.InitializeTemplateParameterCompartment(ATemplateParameterCompartment: PUMLTemplateParameterCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ATemplateParameterCompartment.Selectable := False;
  ATemplateParameterCompartment.ParentLineColor := True;
  ATemplateParameterCompartment.ParentFillColor := True;
  ATemplateParameterCompartment.ParentFontFace := True;
  ATemplateParameterCompartment.ParentFontSize := True;
  ATemplateParameterCompartment.ParentFontColor := True;
  ATemplateParameterCompartment.ParentFontStyle := True;
end;

procedure PUMLCollaborationView.SetTemplateParameterCompartment(Value: PUMLTemplateParameterCompartmentView);
begin
  if FTemplateParameterCompartment <> Value then begin
    RemoveSubView(FTemplateParameterCompartment);
    FTemplateParameterCompartment := Value;
    if FTemplateParameterCompartment <> nil then InitializeTemplateParameterCompartment(FTemplateParameterCompartment);
    AddSubView(FTemplateParameterCompartment);
  end;
end;

procedure PUMLCollaborationView.DrawObject(Canvas: PCanvas);
var
  R: TRect;
begin
  AssignStyleToCanvas(Canvas);
  if TemplateParameterCompartment.Visible then begin
    R.Left := Left;
    R.Top := Top + TemplateParameterCompartment.Height - TEMPLATEPARAMETERCOMPARTMENT_OVERLAP;
    R.Right := Right - TEMPLATEPARAMETERCOMPARTMENT_RIGHT_OCCUPY;
    R.Bottom := Bottom;
  end
  else
    R := Rect(Left, Top, Right, Bottom);
  Canvas.Pen.Style := psDash;
  Canvas.Ellipse(R.Left, R.Top, R.Right, R.Bottom);
end;

procedure PUMLCollaborationView.ArrangeObject(Canvas: PCanvas);
var
  W, H: Integer;
begin
  // Calculating minimum size <= minimum Nampcompartment's circumscription size
  // rectangle's circumscription's height and width are Sqrt(2) times of rectangle's height and width
  W := Max(Trunc(Sqrt(2) * NameCompartment.MinWidth), COLLABORATION_MINWIDTH);
  H := Max(Trunc(Sqrt(2) * NameCompartment.MinHeight), COLLABORATION_MINHEIGHT);
  if TemplateParameterCompartment.Visible then begin
    W := Max(W, TemplateParameterCompartment.MinWidth);
    W := W + TEMPLATEPARAMETERCOMPARTMENT_LEFT_MARGIN + TEMPLATEPARAMETERCOMPARTMENT_RIGHT_OCCUPY;
    H := H + TemplateParameterCompartment.MinHeight - TEMPLATEPARAMETERCOMPARTMENT_OVERLAP;
  end;
  MinWidth := W;
  MinHeight := H;
  // Arranging view objects.
  if TemplateParameterCompartment.Visible then begin
    TemplateParameterCompartment.Left := Right - TEMPLATEPARAMETERCOMPARTMENT_RIGHT_OCCUPY - TemplateParameterCompartment.MinWidth;
    TemplateParameterCompartment.Top := Top;
    TemplateParameterCompartment.Right := Right;
    NameCompartment.Left := Left;
    NameCompartment.Top := ((Bottom + Top + TemplateParameterCompartment.Height - TEMPLATEPARAMETERCOMPARTMENT_OVERLAP) div 2) - (NameCompartment.Height div 2);
    NameCompartment.Right := Right - TEMPLATEPARAMETERCOMPARTMENT_RIGHT_OCCUPY;
  end
  else begin
    NameCompartment.Left := Left;
    NameCompartment.Top := ((Bottom + Top) div 2) - (NameCompartment.Height div 2);
    NameCompartment.Right := Right;
  end;
end;

procedure PUMLCollaborationView.ArrangeIconicObject(Canvas: PCanvas);
begin
  inherited;
  TemplateParameterCompartment.Visible := False;
end;

procedure PUMLCollaborationView.ArrangeDecorationObject(Canvas: PCanvas);
begin
  inherited;
  TemplateParameterCompartment.Left := Right - TEMPLATEPARAMETERCOMPARTMENT_RIGHT_OCCUPY - TemplateParameterCompartment.MinWidth;
  TemplateParameterCompartment.Top := Top;
  TemplateParameterCompartment.Right := Right;
  NameCompartment.Left := Left;
  if TemplateParameterCompartment.Visible then begin
    NameCompartment.Right := Right - TEMPLATEPARAMETERCOMPARTMENT_RIGHT_OCCUPY;
    NameCompartment.Top := Top + TemplateParameterCompartment.Height - TEMPLATEPARAMETERCOMPARTMENT_OVERLAP;
  end
  else begin
    NameCompartment.Right := Right;
    NameCompartment.Top := Top;
  end;
end;

procedure PUMLCollaborationView.Setup;
begin
  inherited;
  TemplateParameterCompartment := MetaModel.CreateInstance('UMLTemplateParameterCompartmentView') as PUMLTemplateParameterCompartmentView;
  TemplateParameterCompartment.Model := Model;
end;

procedure PUMLCollaborationView.Update;
var
  M: PUMLCollaboration;
begin
  if Model = nil then Exit;
  inherited;
  M := (Model as PUMLCollaboration);
  if M.IsAbstract then
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle + [fsItalic]
  else
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle - [fsItalic];
  TemplateParameterCompartment.Visible := ((Model as PUMLCollaboration).TemplateParameterCount > 0);
  if (Model as PUMLCollaboration).TemplateParameterCount > 0 then  TemplateParameterCompartment.Update;
end;

function PUMLCollaborationView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'TemplateParameterCompartment' then begin
    Result := TemplateParameterCompartment;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLCollaborationView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'TemplateParameterCompartment' then begin
    TemplateParameterCompartment := Value as PUMLTemplateParameterCompartmentView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLCollaborationView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCollaborationInstanceSetView

constructor PUMLCollaborationInstanceSetView.Create;
begin
  inherited;
end;

procedure PUMLCollaborationInstanceSetView.Setup;
begin
  inherited;
  NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle + [fsUnderline];
end;

procedure PUMLCollaborationInstanceSetView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Pen.Style := psDash;
  Canvas.Ellipse(Left, Top, Right, Bottom);
end;

procedure PUMLCollaborationInstanceSetView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  MinWidth := Max(Trunc(Sqrt(2) * NameCompartment.MinWidth), COLLABORATION_MINWIDTH);
  MinHeight := Max(Trunc(Sqrt(2) * NameCompartment.MinHeight), COLLABORATION_MINHEIGHT);

  NameCompartment.Left := Left;
  NameCompartment.Top := ((Bottom + Top) div 2) - (NameCompartment.Height div 2);
end;

// PUMLCollaborationInstanceSetView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomColObjectView

procedure PUMLCustomColObjectView.DrawObject(Canvas: PCanvas);
var
  R: TRect;
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
end;

procedure PUMLCustomColObjectView.DrawActorShapeObject(Canvas: PCanvas);
var
  R: TRect;
  W: Integer;
begin
  AssignStyleToCanvas(Canvas);
  R := Rect(Left, Top, Right, NameCompartment.Top);
  if ((R.Right - R.Left) * 100 div (R.Bottom - R.Top)) >= ACTOR_RATIO_PERCENT then begin
    W := ACTOR_RATIO_PERCENT * (R.Bottom - R.Top) div 100;
    R.Left := R.Left + ((Right - Left) - W) div 2;
    R.Right := R.Left + W;
  end;
  DrawActor(Canvas, R);
end;

procedure PUMLCustomColObjectView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  NameCompartment.Left := Left;
  NameCompartment.Top := Top;
  NameCompartment.Right := Right;
end;

procedure PUMLCustomColObjectView.ArrangeActorShapeObject(Canvas: PCanvas);
begin
  inherited;
  MinWidth := Max(NameCompartment.MinWidth, ACTOR_ICONMINWIDTH);
  MinHeight := NameCompartment.MinHeight + ACTOR_ICONMINHEIGHT;
  NameCompartment.Top := Top + ACTOR_ICONMINHEIGHT;
  NameCompartment.Left := Left;
  NameCompartment.Right := Right;
end;

// PUMLCustomColObjectView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLColObjectView

constructor PUMLColObjectView.Create;
begin
  inherited;
  FSlotCompartment := nil;
end;

procedure PUMLColObjectView.InitializeSlotCompartment(ASlotCompartment: PUMLSlotCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ASlotCompartment.Selectable := False;
  ASlotCompartment.ParentLineColor := True;
  ASlotCompartment.ParentFillColor := True;
  ASlotCompartment.ParentFontFace := True;
  ASlotCompartment.ParentFontSize := True;
  ASlotCompartment.ParentFontColor := True;
  ASlotCompartment.ParentFontStyle := True;
end;

procedure PUMLColObjectView.SetSlotCompartment(Value: PUMLSlotCompartmentView);
begin
  if FSlotCompartment <> Value then begin
    RemoveSubView(FSlotCompartment);
    FSlotCompartment := Value;
    if FSlotCompartment <> nil then InitializeSlotCompartment(FSlotCompartment);
    AddSubView(FSlotCompartment);
  end;
end;

function PUMLColObjectView.IsActiveObject: Boolean;
var
  M: PUMLObject;
begin
  Result := False;
  if (Model <> nil) and (M is PUMLObject) then begin
    M := Model as PUMLObject;
    if (M.Classifier <> nil) and (M.Classifier is PUMLClass) then
      Result := (M.Classifier as PUMLClass).IsActive;
  end;
end;

procedure PUMLColObjectView.AfterLoad(Reader: PObjectReader);
begin
  inherited;
  // StarUML
  if SlotCompartment = nil then begin
    SlotCompartment := MetaModel.CreateInstance('UMLSlotCompartmentView') as PUMLSlotCompartmentView;
    SlotCompartment.Model := Model;
  end;
end;

procedure PUMLColObjectView.DrawObject(Canvas: PCanvas);
var
  M: PUMLObject;
  R: TRect;
begin
  AssignStyleToCanvas(Canvas);
  if Model <> nil then begin
    M := Model as PUMLObject;
    if (M.Classifier <> nil) and (M.Classifier is PUMLActor) then begin
      DrawActorShapeObject(Canvas);
      Exit;
    end;
  end;
  R.Left := Left;
  R.Top := Top;
  R.Right := Right;
  R.Bottom := Bottom;
  if Model <> nil then begin
    if M.IsMultiInstance then begin
      Canvas.Rectangle(R.Left + MULTI_OBJECT_MARGIN, R.Top + MULTI_OBJECT_MARGIN,
        R.Right + MULTI_OBJECT_MARGIN, R.Bottom + MULTI_OBJECT_MARGIN);
    end;
  end;
  Canvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
  if IsActiveObject then begin
    Canvas.MoveTo(Left + CLASS_ACTIVE_VERTLINE_WIDTH, Top);
    Canvas.LineTo(Left + CLASS_ACTIVE_VERTLINE_WIDTH, Bottom);
    Canvas.MoveTo(Right - CLASS_ACTIVE_VERTLINE_WIDTH - 1, Top);
    Canvas.LineTo(Right - CLASS_ACTIVE_VERTLINE_WIDTH - 1, Bottom);
  end;
end;

procedure PUMLColObjectView.ArrangeObject(Canvas: PCanvas);
var
  M: PUMLObject;
  R: TRect;
begin
  inherited;

  if (Model <> nil) and (Model is PUMLObject) then begin
    M := Model as PUMLObject;
    if (M.Classifier <> nil) and (M.Classifier is PUMLActor) then begin
      ArrangeActorShapeObject(Canvas);
      Exit;
    end
  end;

  MeasureObjectMinSize([SlotCompartment], GENERALNODE_MINWIDTH, GENERALNODE_MINHEIGHT);
  if IsActiveObject then
    MinWidth := MinWidth + CLASS_ACTIVE_VERTLINE_WIDTH * 2;
  R := Rect(Left, Top, Right, Bottom);
  if IsActiveObject then begin
    R.Left := R.Left + CLASS_ACTIVE_VERTLINE_WIDTH;
    R.Right := R.Right - CLASS_ACTIVE_VERTLINE_WIDTH;
  end;
  ArrangeCompartments([SlotCompartment], R);
end;

procedure PUMLColObjectView.ArrangeIconicObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeIconicObjectWithCompartments([SlotCompartment], GENERALNODE_MINWIDTH, GENERALNODE_MINHEIGHT, FStereotypeIconMinWidth, FStereotypeIconMinWidth);
end;

procedure PUMLColObjectView.ArrangeDecorationObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeIconicObjectWithCompartments([SlotCompartment], GENERALNODE_MINWIDTH, GENERALNODE_MINHEIGHT, FStereotypeIconMinWidth, FStereotypeIconMinWidth);
end;

procedure PUMLColObjectView.Setup;
begin
  inherited;
  NameCompartment.NameLabel.FontStyle := [fsUnderline];
  SlotCompartment := MetaModel.CreateInstance('UMLSlotCompartmentView') as PUMLSlotCompartmentView;
  SlotCompartment.Model := Model;
end;

procedure PUMLColObjectView.Update;
var
  M: PUMLObject;
  S: string;
begin
  if Model = nil then Exit;
  inherited;
  M := (Model as PUMLObject);
  if ShowParentName and (M.VirtualNameSpace <> nil) then
    S := M.VirtualNameSpace.Name + '::' + M.Name
  else
    S := M.Name;
  if M.Classifier <> nil then S := S + ' : ' + M.Classifier.Name;
  NameCompartment.NameLabel.Text := S;
  SlotCompartment.Visible := (M.SlotCount > 0);
end;

function PUMLColObjectView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'SlotCompartment' then begin
    Result := SlotCompartment;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLColObjectView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'SlotCompartment' then begin
    SlotCompartment := Value as PUMLSlotCompartmentView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLColObjectView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLColClassifierRoleView

procedure PUMLColClassifierRoleView.DrawObject(Canvas: PCanvas);
var
  M: PUMLClassifierRole;
begin
  if Model <> nil then begin
    M := Model as PUMLClassifierRole;
    if (M.Base <> nil) and (M.Base is PUMLActor) then begin
      DrawActorShapeObject(Canvas);
      Exit;
    end;
  end;
  inherited;
end;

procedure PUMLColClassifierRoleView.ArrangeObject(Canvas: PCanvas);
var
  M: PUMLClassifierRole;
begin
  if Model <> nil then begin
    M := Model as PUMLClassifierRole;
    if (M.Base <> nil) and (M.Base is PUMLActor) then begin
      ArrangeActorShapeObject(Canvas);
      Exit;
    end
  end;
  inherited;
end;

procedure PUMLColClassifierRoleView.Setup;
begin
  inherited;
  NameCompartment.NameLabel.FontStyle := [fsBold];
end;

procedure PUMLColClassifierRoleView.Update;
var
  M: PUMLClassifierRole;
  S: string;
begin
  if Model = nil then Exit;
  inherited;
  M := (Model as PUMLClassifierRole);
  if M.Name <> '' then begin
    if ShowParentName and (M.VirtualNameSpace <> nil) then
      S := '/' + M.VirtualNameSpace.Name + '::' + M.Name
    else
      S := '/' + M.Name;
  end;
  if M.Base <> nil then S := S + ' : ' + M.Base.Name;
  NameCompartment.NameLabel.Text := S;
  if M.IsAbstract then
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle + [fsItalic]
  else
    NameCompartment.NameLabel.FontStyle := NameCompartment.NameLabel.FontStyle - [fsItalic];
end;

// PUMLColClassifierRoleView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLLinkView

constructor PUMLLinkView.Create;
begin
  inherited;
  FHeadEndLabel := nil;
  FTailEndLabel := nil;
end;

procedure PUMLLinkView.InitializeEndLabel(AEndLabel: PEdgeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AEndLabel.Selectable := True;
  AEndLabel.HorzAlignment := haCenter;
  AEndLabel.VertAlignment := vaTop;
  AEndLabel.ParentLineColor := False;
  AEndLabel.ParentFillColor := False;
  AEndLabel.ParentFontFace := False;
  AEndLabel.ParentFontSize := False;
  AEndLabel.ParentFontColor := False;
  AEndLabel.ParentFontStyle := False;
end;

procedure PUMLLinkView.SetHeadEndLabel(Value: PEdgeLabelView);
begin
  if FHeadEndLabel <> Value then begin
    RemoveSubView(FHeadEndLabel);
    FHeadEndLabel := Value;
    if FHeadEndLabel <> nil then InitializeEndLabel(FHeadEndLabel);
    AddSubView(FHeadEndLabel);
  end;
end;

procedure PUMLLinkView.SetTailEndLabel(Value: PEdgeLabelView);
begin
  if FTailEndLabel <> Value then begin
    RemoveSubView(FTailEndLabel);
    FTailEndLabel := Value;
    if FTailEndLabel <> nil then InitializeEndLabel(FTailEndLabel);
    AddSubView(FTailEndLabel);
  end;
end;

procedure PUMLLinkView.Setup;
begin
  inherited;
  HeadEndLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  HeadEndLabel.EdgePosition := epHead;
  HeadEndLabel.Alpha := -PI / 6;
  HeadEndLabel.Distance := 30;
  HeadEndLabel.Text := '';
  HeadEndLabel.Model := (Model as PUMLLink).Connections[1];
  TailEndLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  TailEndLabel.EdgePosition := epTail;
  TailEndLabel.Alpha := PI / 6;
  TailEndLabel.Distance := 30;
  TailEndLabel.Text := '';
  TailEndLabel.Model := (Model as PUMLLink).Connections[0];
end;

procedure PUMLLinkView.Update;
var
  M: PUMLLink;
begin
  if Model = nil then Exit;
  inherited;
  M := Model as PUMLLink;
  TailEndLabel.Text := VisibilityToSymbol(M.Connections[0].Visibility) + M.Connections[0].Name;
  HeadEndLabel.Text := VisibilityToSymbol(M.Connections[1].Visibility) + M.Connections[1].Name;
  TailEndLabel.Visible := (M.Connections[0].Name <> '');
  HeadEndLabel.Visible := (M.Connections[1].Name <> '');
end;

function PUMLLinkView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'HeadEndLabel' then begin
    Result := HeadEndLabel;
  end
  else if Name = 'TailEndLabel' then begin
    Result := TailEndLabel;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLLinkView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'HeadEndLabel' then begin
    HeadEndLabel := Value as PEdgeLabelView;
  end
  else if Name = 'TailEndLabel' then begin
    TailEndLabel := Value as PEdgeLabelView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;


// PUMLLinkView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomColMessageView

constructor PUMLCustomColMessageView.Create;
begin
  inherited;
  FNameLabel := nil;
  FStereotypeLabel := nil;
  FPropertyLabel := nil;
  EdgePosition := epMiddle;
  Selectable := True;
  Sizable := szNone;
  Movable := mmFree;
end;

procedure PUMLCustomColMessageView.InitializeNameLabel(AEdgeLabel: PNodeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AEdgeLabel.Selectable := True;
  AEdgeLabel.HorzAlignment := haCenter;
  AEdgeLabel.VertAlignment := vaTop;
  AEdgeLabel.ParentLineColor := False;
  AEdgeLabel.ParentFillColor := False;
  AEdgeLabel.ParentFontFace := False;
  AEdgeLabel.ParentFontSize := False;
  AEdgeLabel.ParentFontColor := False;
  AEdgeLabel.ParentFontStyle := False;
end;

procedure PUMLCustomColMessageView.InitializeStereotypeLabel(AEdgeLabel: PNodeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AEdgeLabel.Selectable := True;
  AEdgeLabel.HorzAlignment := haCenter;
  AEdgeLabel.VertAlignment := vaTop;
  AEdgeLabel.ParentLineColor := False;
  AEdgeLabel.ParentFillColor := False;
  AEdgeLabel.ParentFontFace := False;
  AEdgeLabel.ParentFontSize := False;
  AEdgeLabel.ParentFontColor := False;
  AEdgeLabel.ParentFontStyle := False;
end;

procedure PUMLCustomColMessageView.InitializePropertyLabel(AEdgeLabel: PNodeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AEdgeLabel.Selectable := True;
  AEdgeLabel.HorzAlignment := haCenter;
  AEdgeLabel.VertAlignment := vaTop;
  AEdgeLabel.ParentLineColor := False;
  AEdgeLabel.ParentFillColor := False;
  AEdgeLabel.ParentFontFace := False;
  AEdgeLabel.ParentFontSize := False;
  AEdgeLabel.ParentFontColor := False;
  AEdgeLabel.ParentFontStyle := False;
end;

procedure PUMLCustomColMessageView.SetNameLabel(Value: PNodeLabelView);
begin
  if FNameLabel <> Value then begin
    RemoveSubView(FNameLabel);
    FNameLabel := Value;
    if FNameLabel <> nil then InitializeNameLabel(FNameLabel);
    AddSubView(FNameLabel);
  end;
end;

procedure PUMLCustomColMessageView.SetStereotypeLabel(Value: PNodeLabelView);
begin
  if FStereotypeLabel <> Value then begin
    RemoveSubView(FStereotypeLabel);
    FStereotypeLabel := Value;
    if FStereotypeLabel <> nil then InitializeStereotypeLabel(FStereotypeLabel);
    AddSubView(FStereotypeLabel);
  end;
end;

procedure PUMLCustomColMessageView.SetPropertyLabel(Value: PNodeLabelView);
begin
  if FPropertyLabel <> Value then begin
    RemoveSubView(FPropertyLabel);
    FPropertyLabel := Value;
    if FPropertyLabel <> nil then InitializePropertyLabel(FPropertyLabel);
    AddSubView(FPropertyLabel);
  end;
end;

procedure PUMLCustomColMessageView.SetShowProperty(Value: Boolean);
begin
  if FShowProperty <> Value then begin
    FShowProperty := Value;
  end;
end;

procedure PUMLCustomColMessageView.CalcPosition(Canvas: PCanvas);
var
  P1, P2: TPoint;
  tempP1, tempP2 : TPoint;
  tempTh, tempMiddleX, tempMiddleY, tempX, tempY, tempHPointX, tempHPointY, tempTPointY, tempTPointX : Extended;
  MidPointIndex : Integer;

  RT: TRect;
  A, B, TH, TH1, TH2: Extended;
begin
  MidPointIndex := HostEdge.Points.Count div 2;
  if HostEdge.Points.Count mod 2 = 0 then MidPointIndex := MidPointIndex - 1;
  P1 := HostEdge.Points.Points[MidPointIndex];
  P2 := HostEdge.Points.Points[MidPointIndex+1];
  tempP1 := P1;
  tempP2 := P2;
  // Calc Theta of Link
  tempTh := GetTheta(tempP1.X, tempP1.Y, tempP2.X, tempP2.Y);

  // Calc Head and Tail Points of Message
  tempMiddleX := (tempP1.X + tempP2.X) / 2;
  tempMiddleY := (tempP1.Y + tempP2.Y) / 2;

  tempX := Distance * Cos(tempTh + Alpha);
  tempY := Distance * Sin(tempTh + Alpha);

  tempMiddleX := tempMiddleX + tempX;
  tempMiddleY := tempMiddleY - tempY;

  tempX := 20 * Cos(tempTh);
  tempY := 20 * Sin(tempTh);

  if Model is PUMLStimulus then begin
    if (Model as PUMLStimulus).Sender = (Model as PUMLStimulus).CommunicationLink.Connections[0].Instance then begin
      // Forward Stimulus
      tempHPointX := tempMiddleX + tempX;
      tempHPointY := tempMiddleY - tempY;
      tempTPointX := tempMiddleX - tempX;
      tempTPointY := tempMiddleY + tempY;
    end
    else begin
      // Reverse Stimulus
      tempTPointX := tempMiddleX + tempX;
      tempTPointY := tempMiddleY - tempY;
      tempHPointX := tempMiddleX - tempX;
      tempHPointY := tempMiddleY + tempY;
    end;
  end
  else if Model is PUMLMessage then begin
    if (Model as PUMLMessage).Sender = (Model as PUMLMessage).CommunicationConnection.Connections[0].Participant then begin
      // Forward Message
      tempHPointX := tempMiddleX + tempX;
      tempHPointY := tempMiddleY - tempY;
      tempTPointX := tempMiddleX - tempX;
      tempTPointY := tempMiddleY + tempY;
    end
    else begin
      // Reverse Message
      tempTPointX := tempMiddleX + tempX;
      tempTPointY := tempMiddleY - tempY;
      tempHPointX := tempMiddleX - tempX;
      tempHPointY := tempMiddleY + tempY;
    end;
  end;

  FHeadPoint.X := Trunc(tempHPointX);
  FHeadPoint.Y := Trunc(tempHPointY);
  FTailPoint.X := Trunc(tempTPointX);
  FTailPoint.Y := Trunc(tempTPointY);

  // Calc Arrow Points of Message;
  RT := Rect(FHeadPoint.X, FHeadPoint.Y, FTailPoint.X, FTailPoint.Y);
  A := RT.Bottom - RT.Top;
  B := (RT.Right - RT.Left + 0.00001);
  TH := ArcTan(A / B);
  if ((A < 0) and (B < 0)) or ((A > 0) and (B < 0)) or ((A = 0) and (B < 0)) THen
    TH := TH + 3.141592;
  TH1 := TH - 3.141592 / 8;
  TH2 := TH + 3.141592 / 8;
  ArrowPoint1 := Point(Trunc(12 * Cos(TH1)) + RT.Left, Trunc(12 * Sin(TH1)) + RT.Top);
  ArrowPoint2 := Point(Trunc(12 * Cos(TH2)) + RT.Left, Trunc(12 * Sin(TH2)) + RT.Top);

  Left := Min(FHeadPoint.X, FTailPoint.X);
  Top := Min(FHeadPoint.Y, FTailPoint.Y);
  Right := Max(FHeadPoint.X, FTailPoint.X);
  Bottom := Max(FHeadPoint.Y, FTailPoint.Y);
end;

procedure PUMLCustomColMessageView.AfterLoad(Reader: PObjectReader);
begin
  inherited;
  // StarUML
  if PropertyLabel = nil then begin
    PropertyLabel := MetaModel.CreateInstance('NodeLabelView') as PNodeLabelView;
    PropertyLabel.Model := Self.Model;
    PropertyLabel.Distance := 10;
    PropertyLabel.Alpha := PI / 2;
  end;
end;

procedure PUMLCustomColMessageView.DrawSelection(Canvas: PCanvas);
begin
  DrawHighlighter(Canvas, FHeadPoint.X, FHeadPoint.Y, 3, True, SELECTION_COLOR);
  DrawHighlighter(Canvas, FTailPoint.X, FTailPoint.Y, 3, True, SELECTION_COLOR);
end;

procedure PUMLCustomColMessageView.DrawObject(Canvas: PCanvas);
var
  Action: PUMLAction;
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Brush.Color := BACKGROUND_COLOR;
  if Model is PUMLStimulus then begin
    Action := (Model as PUMLStimulus).Action;
  end
  else if Model is PUMLMessage then begin
    Action := (Model as PUMLMessage).Action;
  end;
  // Message body
  if Action is PUMLReturnAction then
    Canvas.Pen.Style := psDot
  else
    Canvas.Pen.Style := psSolid;
  Canvas.PolyLine([FHeadPoint, FTailPoint]);
  Canvas.Pen.Style := psSolid;
  // Message head
  if (Action is PUMLSendAction) or (Action is PUMLReturnAction) then
    Canvas.Polyline([ArrowPoint1, FHeadPoint, ArrowPoint2])
  else if Action.IsAsynchronous then
    Canvas.Polyline([ArrowPoint1, FHeadPoint, ArrowPoint2])
  else begin
    Canvas.Brush.Color := LineColor;
    Canvas.Polygon([ArrowPoint1, FHeadPoint, ArrowPoint2, ArrowPoint1]);
    Canvas.Brush.Color := FillColor;
  end;
end;

procedure PUMLCustomColMessageView.MovePosition(Canvas: PCanvas; DX, DY: Integer);
begin
  inherited;
  CalcPosition(Canvas);
end;

procedure PUMLCustomColMessageView.ArrangeObject(Canvas: PCanvas);
var
  P, P1, P2: TPoint;
  V: Boolean;
begin
  inherited;
  V := PropertyLabel.Visible;
  NameLabel.Visible := (NameLabel.Text <> '');
  StereotypeLabel.Visible := (StereotypeLabel.Text <> '');
  PropertyLabel.Visible := ShowProperty and (PropertyLabel.Text <> '');
  CalcPosition(Canvas);
  Width := Max(FHeadPoint.X, FTailPoint.X) - Min(FHeadPoint.X, FTailPoint.X);
  Height := Max(FHeadPoint.Y, FTailPoint.Y) - Min(FHeadPoint.Y, FTailPoint.Y);

  // Reassign distance of NameLabel, StereotypeLabel
  if (not V) and PropertyLabel.Visible then begin
    if NameLabel.Distance < 25 then begin
      if StereotypeLabel.Distance <= NameLabel.Distance + 15 then
        StereotypeLabel.Distance := StereotypeLabel.Distance + 15;
      NameLabel.Distance := NameLabel.Distance + 15
    end;
  end;

  // Arrange NameLabel
  P1 := FTailPoint;
  P2 := FHeadPoint;
  P := GetPointAwayLine(P1, P2, NameLabel.Alpha, NameLabel.Distance);
  NameLabel.Left := (P.X + P1.X) - (NameLabel.Width div 2);
  NameLabel.Top := (P.Y + P1.Y) - (NameLabel.Height div 2);
  // Arrange StereotypeLabel
  P := GetPointAwayLine(P1, P2, StereotypeLabel.Alpha, StereotypeLabel.Distance);
  StereotypeLabel.Left := (P.X + P1.X) - (StereotypeLabel.Width div 2);
  StereotypeLabel.Top := (P.Y + P1.Y) - (StereotypeLabel.Height div 2);
  // Arrange ProeprtyLabel
  P := GetPointAwayLine(P1, P2, PropertyLabel.Alpha, PropertyLabel.Distance);
  PropertyLabel.Left := (P.X + P1.X) - (PropertyLabel.Width div 2);
  PropertyLabel.Top := (P.Y + P1.Y) - (PropertyLabel.Height div 2);

  // call Update here because Action's changed are not reflected
  Update;
end;

procedure PUMLCustomColMessageView.Setup;
begin
  inherited;
  NameLabel := MetaModel.CreateInstance('NodeLabelView') as PNodeLabelView;
  NameLabel.Model := Self.Model;
  NameLabel.Distance := 10;
  NameLabel.Alpha := PI / 2;
  StereotypeLabel := MetaModel.CreateInstance('NodeLabelView') as PNodeLabelView;
  StereotypeLabel.Model := Self.Model;
  StereotypeLabel.Distance := 25;
  StereotypeLabel.Alpha := PI / 2;
  PropertyLabel := MetaModel.CreateInstance('NodeLabelView') as PNodeLabelView;
  PropertyLabel.Model := Self.Model;
  PropertyLabel.Distance := 10;
  PropertyLabel.Alpha := PI / 2;
end;

procedure PUMLCustomColMessageView.Update;
var
  Action: PUMLAction;
  ShowSequenceNumber: Boolean;
  MessageSignature: PUMLMessageSignatureKind;
begin
  if Model = nil then Exit;
  inherited;
  ShowSequenceNumber := StringToBoolean(GetDiagramView.Diagram.MOF_GetAttribute('ShowSequenceNumber'));
  MessageSignature := StringToUMLMessageSignatureKind(GetDiagramView.Diagram.MOF_GetAttribute('MessageSignature'));
  NameLabel.Text := GetMessageString(Model, ShowSequenceNumber, MessageSignature);

  if Model is PUMLStimulus then
    Action := (Model as PUMLStimulus).Action
  else if Model is PUMLMessage then
    Action := (Model as PUMLMessage).Action;

  if Action is PUMLCreateAction then
    StereotypeLabel.Text := '<<create>>'
  else if Action is PUMLDestroyAction then
    StereotypeLabel.Text := '<<destroy>>'
  else if (Model as PUMLModelElement).StereotypeName <> '' then
    StereotypeLabel.Text := '<<' + (Model as PUMLModelElement).StereotypeName + '>>'
  else
    StereotypeLabel.Text := '';
  PropertyLabel.Text := GetPropertyString(Model as PExtensibleModel);
end;

function PUMLCustomColMessageView.GetBoundingBox(Canvas: PCanvas): TRect;
var
  R: TRect;
begin
  R := inherited GetBoundingBox(Canvas);
  if NameLabel.Visible then
    R := GraphicClasses.UnionRect(R, NameLabel.GetBoundingBox(Canvas));
  if StereotypeLabel.Visible then
    R := GraphicClasses.UnionRect(R, StereotypeLabel.GetBoundingBox(Canvas));
  if PropertyLabel.Visible then
    R := GraphicClasses.UnionRect(R, PropertyLabel.GetBoundingBox(Canvas));
  Result := R;
end;

function PUMLCustomColMessageView.ContainsPoint(Canvas: PCanvas; P: TPoint): Boolean;
var
  R : TRect;
begin
  R := Rect(FHeadPoint.X, FHeadPoint.Y, FTailPoint.X, FTailPoint.Y);
  Result :=  PtInLine(R, P);
end;

function PUMLCustomColMessageView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'ShowProperty' then begin
    Result := BooleanToString(FShowProperty);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PUMLCustomColMessageView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'ShowProperty' then begin
    FShowProperty := StringToBoolean(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PUMLCustomColMessageView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'NameLabel' then begin
    Result := NameLabel;
  end
  else if Name = 'StereotypeLabel' then begin
    Result := StereotypeLabel;
  end
  else if Name = 'PropertyLabel' then begin
    Result := PropertyLabel;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLCustomColMessageView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'NameLabel' then begin
    NameLabel := Value as PNodeLabelView;
  end
  else if Name = 'StereotypeLabel' then begin
    StereotypeLabel := Value as PNodeLabelView;
  end
  else if Name = 'PropertyLabel' then begin
    PropertyLabel := Value as PNodeLabelView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLCustomColMessageView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomStateView

constructor PUMLCustomStateView.Create;
begin
  inherited;
  FInternalTransitionCompartment := nil;
  MinHeight := STATE_MINHEIGHT;
  MinWidth := STATE_MINWIDTH;
end;

procedure PUMLCustomStateView.InitializeInternalTransitionCompartment(AInternalTransitionCompartment: PUMLInternalTransitionCompartmentView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AInternalTransitionCompartment.Selectable := False;
  AInternalTransitionCompartment.ParentLineColor := True;
  AInternalTransitionCompartment.ParentFillColor := True;
  AInternalTransitionCompartment.ParentFontFace := True;
  AInternalTransitionCompartment.ParentFontSize := True;
  AInternalTransitionCompartment.ParentFontColor := True;
  AInternalTransitionCompartment.ParentFontStyle := True;
end;

procedure PUMLCustomStateView.SetInternalTransitionCompartment(Value: PUMLInternalTransitionCompartmentView);
begin
  if FInternalTransitionCompartment <> Value then begin
    RemoveSubView(FInternalTransitionCompartment);
    FInternalTransitionCompartment := Value;
    if FInternalTransitionCompartment <> nil then InitializeInternalTransitionCompartment(FInternalTransitionCompartment);
    AddSubView(FInternalTransitionCompartment);
  end;
end;

procedure PUMLCustomStateView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.RoundRect(Left, Top, Right, Bottom, STATE_ROUND, STATE_ROUND);
end;

procedure PUMLCustomStateView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeObjectWithCompartments([InternalTransitionCompartment], STATE_MINWIDTH, STATE_MINHEIGHT);
end;

procedure PUMLCustomStateView.ArrangeIconicObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeIconicObjectWithCompartments([InternalTransitionCompartment], ICONICVIEW_MINWIDTH, ICONICVIEW_MINHEIGHT, FStereotypeIconMinWidth, FStereotypeIconMinHeight);
end;

procedure PUMLCustomStateView.ArrangeDecorationObject(Canvas: PCanvas);
begin
  inherited;
  ArrangeObjectWithCompartments([InternalTransitionCompartment], DECORATIONVIEW_MINWIDTH, DECORATIONVIEW_MINHEIGHT);
end;

procedure PUMLCustomStateView.Setup;
begin
  inherited;
  InternalTransitionCompartment := MetaModel.CreateInstance('UMLInternalTransitionCompartmentView') as PUMLInternalTransitionCompartmentView;
  InternalTransitionCompartment.Model := Model;
end;

function PUMLCustomStateView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'InternalTransitionCompartment' then
    Result := InternalTransitionCompartment
  else
    Result := inherited MOF_GetReference(Name);
end;

procedure PUMLCustomStateView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'InternalTransitionCompartment' then
    InternalTransitionCompartment := Value as PUMLInternalTransitionCompartmentView
  else
    inherited MOF_SetReference(Name, Value);
end;

// PUMLCustomStateView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLStateView

procedure PUMLStateView.DelimitContainingBoundary(Canvas: PCanvas);
var
  R, CR: TRect;
  DX, DY: Integer;
  I: Integer;
begin
  // Recalculate subview's position not to enter the name area
  if ContainedViewCount > 0 then begin
    R := Rect(Left + COMPARTMENT_LEFT_MARGIN, Top + NameCompartment.Height + COMPARTMENT_INTERVAL + COMPARTMENT_TOP_MARGIN,
      Right - COMPARTMENT_RIGHT_MARGIN, Bottom - COMPARTMENT_BOTTOM_MARGIN);
    CR := ContainedViews[0].GetBoundingBox(Canvas);
    for I := 1 to ContainedViewCount - 1 do
      CR := GraphicClasses.UnionRect(CR, ContainedViews[I].GetBoundingBox(Canvas));
    DX := Max(R.Left + COMPARTMENT_LEFT_MARGIN - CR.Left, 0);
    DY := Max(R.Top + COMPARTMENT_TOP_MARGIN - CR.Top, 0);
    if (DX > 0) or (DY > 0) then
      for I := 0 to ContainedViewCount - 1 do
        if (ContainedViews[I].GetBoundingBox(Canvas).Left < R.Left) or
           (ContainedViews[I].GetBoundingBox(Canvas).Top < R.Top) then
          ContainedViews[I].Move(Canvas, DX, DY);
    for I := 0 to ContainedViewCount - 1 do
      R := GraphicClasses.UnionRect(R, ContainedViews[I].GetBoundingBox(Canvas));
    Right := R.Right + COMPARTMENT_RIGHT_MARGIN;
    Bottom := R.Bottom + COMPARTMENT_BOTTOM_MARGIN;
  end;
end;

procedure PUMLStateView.Update;
begin
  if Model = nil then Exit;
  inherited;
  InternalTransitionCompartment.Update;
end;

function PUMLStateView.CanContainViewKind(Kind: string): Boolean;
var
  MC: PMetaClass;
begin
  Result := False;
  MC := MetaModel.FindMetaClass(Kind);
  if MC <> nil then
  begin
    if MC.IsKindOf('UMLCustomStateView') or
       MC.IsKindOf('UMLPseudostateView') or
       MC.IsKindOf('UMLFinalStateView') then
      Result := True;
  end;
end;

// PUMLStateView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSubmachineState

procedure PUMLSubmachineStateView.InitializeIncludeLabel(AIncludeLabel: PLabelView);
begin
  AIncludeLabel.Selectable := False;
  AIncludeLabel.HorzAlignment := haCenter;
  AIncludeLabel.VertAlignment := vaTop;
  AIncludeLabel.ParentLineColor := True;
  AIncludeLabel.ParentFillColor := True;
  AIncludeLabel.ParentFontFace := True;
  AIncludeLabel.ParentFontSize := True;
  AIncludeLabel.ParentFontColor := True;
  AIncludeLabel.ParentFontStyle := True;
end;

procedure PUMLSubmachineStateView.SetIncludeLabel(Value: PLabelView);
begin
  if FIncludeLabel <> Value then begin
    RemoveSubView(FIncludeLabel);
    FIncludeLabel := Value;
    if FIncludeLabel <> nil then InitializeIncludeLabel(FIncludeLabel);
    AddSubView(FIncludeLabel);
  end;
end;

procedure PUMLSubmachineStateView.DrawObject(Canvas: PCanvas);
begin
  inherited;
  if IncludeLabel.Visible then begin
    Canvas.MoveTo(Left, IncludeLabel.Top - COMPARTMENT_TOP_MARGIN);
    Canvas.LineTo(Right, IncludeLabel.Top - COMPARTMENT_TOP_MARGIN);
  end;
  Canvas.Ellipse(Right-26, Bottom-16, Right-20, Bottom-10);
  Canvas.PolyLine([Point(Right-20, Bottom-13), Point(Right-14, Bottom-13)]);
  Canvas.Ellipse(Right-14, Bottom-16, Right-8, Bottom-10);
end;

procedure PUMLSubmachineStateView.ArrangeObject(Canvas: PCanvas);
var
  W, H: Integer;
  Y: Integer;
begin
  inherited;
  W := MinWidth;
  W := Max(W, STATE_DECOMPOSIT_INDICATOR_WIDTH);
  H := MinHeight + STATE_DECOMPOSIT_INDICATOR_HEIGHT;
  Y := NameCompartment.Bottom;
  if IncludeLabel.Visible then begin
    W := Max(W, IncludeLabel.MinWidth + COMPARTMENT_LEFT_MARGIN + COMPARTMENT_RIGHT_MARGIN);
    H := H + COMPARTMENT_TOP_MARGIN + IncludeLabel.MinHeight + COMPARTMENT_BOTTOM_MARGIN +COMPARTMENT_INTERVAL;
  end;
  MinWidth := W;
  MinHeight := H;

  if IncludeLabel.Visible then begin
    IncludeLabel.Left := Left + COMPARTMENT_LEFT_MARGIN;
    IncludeLabel.Top := NameCompartment.Bottom + COMPARTMENT_INTERVAL + COMPARTMENT_TOP_MARGIN;
    IncludeLabel.Right := Right - COMPARTMENT_RIGHT_MARGIN;
    Y := Y + COMPARTMENT_TOP_MARGIN + IncludeLabel.Height + COMPARTMENT_BOTTOM_MARGIN + COMPARTMENT_INTERVAL;
  end;
  InternalTransitionCompartment.Left := Left;
  InternalTransitionCompartment.Top := Y;
  InternalTransitionCompartment.Right := Right;
end;

procedure PUMLSubmachineStateView.ArrangeIconicObject(Canvas: PCanvas);
begin
  inherited;
  IncludeLabel.Visible := False;
end;

procedure PUMLSubmachineStateView.ArrangeDecorationObject(Canvas: PCanvas);
begin
  inherited;
  IncludeLabel.Visible := False;
end;

procedure PUMLSubmachineStateView.Setup;
begin
  inherited;
  IncludeLabel := MetaModel.CreateInstance('LabelView') as PLabelView;
end;

procedure PUMLSubmachineStateView.Update;
var
  M: PUMLSubmachineState;
begin
  if Model = nil then Exit;
  inherited;
  M := Model as PUMLSubmachineState;
  if (M.EntryActionCount + M.DoActivityCount + M.ExitActionCount > 0) then
    InternalTransitionCompartment.Update;
  if M.Submachine <> nil then
    IncludeLabel.Text := 'include / ' + M.Submachine.Name
  else
    IncludeLabel.Text := '';
  IncludeLabel.Visible := (M.Submachine <> nil);
end;

function PUMLSubmachineStateView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'IncludeLabel' then
    Result := IncludeLabel
  else
    Result := inherited MOF_GetReference(Name);
end;

procedure PUMLSubmachineStateView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'IncludeLabel' then
    IncludeLabel := Value as PLabelView
  else
    inherited MOF_SetReference(Name, Value);
end;

// PUMLSubmachineStateView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLPseudostateView

procedure PUMLPseudostateView.DrawObject(Canvas: PCanvas);
var
  M: PUMLPseudostate;
  X, Y: Integer;
begin
  M := (Model as PUMLPseudostate);
  AssignStyleToCanvas(Canvas);
  case M.PseudostateKind of
    pkInitial: begin
      Canvas.Brush.Color := LineColor;
      Canvas.Ellipse(Left, Top, Right, Bottom);
    end;
    pkShallowHistory: begin
      Canvas.Brush.Color := BACKGROUND_COLOR;
      Canvas.Ellipse(Left, Top, Right, Bottom);
      Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      X := Left + (Width - Canvas.TextWidth('H')) div 2;
      Y := Top + (Height - Canvas.TextHeight('H')) div 2;
      Canvas.TextOut(X, Y, 'H');
    end;
    pkDeepHistory: begin
      Canvas.Brush.Color := BACKGROUND_COLOR;
      Canvas.Ellipse(Left, Top, Right, Bottom);
      Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      X := Left + (Width - Canvas.TextWidth('H*')) div 2;
      Y := Top + (Height - Canvas.TextHeight('H*')) div 2;
      Canvas.TextOut(X, Y, 'H*');
    end;
    pkSynchronization: begin
      Canvas.Pen.Color := LineColor;
      Canvas.Pen.Style := psSolid;
      Canvas.Brush.Color := LineColor;
      if Abs(Right - Left) >= Abs(Bottom - Top) then begin
        Canvas.Rectangle(Left, Top, Right, Top + SYNCHRONIZATION_MINTHICK);
      end
      else begin
        Canvas.Rectangle(Left, Top, Left + SYNCHRONIZATION_MINTHICK, Bottom);
      end;
    end;
    pkJunction: begin
      Canvas.Brush.Color := LineColor;
      Canvas.Pen.Color := LineColor;
      Canvas.Ellipse(Left, Top, Right, Bottom);
    end;
    pkChoice: begin
      Canvas.Ellipse(Left, Top, Right, Bottom);
    end;
    pkDecision: begin
      X := Left + (Width div 2);
      Y := Top + (Height div 2);
      Canvas.Polygon([Point(Left, Y), Point(X, Top), Point(Right, Y), Point(X, Bottom), Point(Left, Y)]);
    end;
  end;
end;

procedure PUMLPseudostateView.DrawNoModeledMark(Canvas: PCanvas);
begin
  DrawModelExcludedMark(Canvas, Left + Width * 3 div 4, Top + Height * 1 div 4);
end;

procedure PUMLPseudostateView.ArrangeObject(Canvas: PCanvas);
var
  M: PUMLPseudostate;
begin
  inherited;
  M := (Model as PUMLPseudostate);
  case M.PseudostateKind of
    pkInitial: begin
      Sizable := szNone;
      MinWidth := INITIALSTATE_MINWIDTHH;
      MinHeight := INITIALSTATE_MINHEIGHT;
      Width := MinWidth;
      Height := MinHeight;
    end;
    pkShallowHistory: begin
      Sizable := szNone;
      MinWidth := HISTORYSTATE_MINWIDTHH;
      MinHeight := HISTORYSTATE_MINHEIGHT;
      Width := MinWidth;
      Height := MinHeight;
    end;
    pkDeepHistory: begin
      Sizable := szNone;
      MinWidth := HISTORYSTATE_MINWIDTHH;
      MinHeight := HISTORYSTATE_MINHEIGHT;
      Width := MinWidth;
      Height := MinHeight;
    end;
    pkSynchronization: begin
      Sizable := szFree;
      if Height > Width then begin
        // Vertical Synchronization
        MinWidth := SYNCHRONIZATION_MINTHICK;
        MinHeight := SYNCHRONIZATION_MINLENGTH;
        Width := MinWidth;
      end
      else begin
        // Horizontal Synchronization
        MinWidth := SYNCHRONIZATION_MINLENGTH;
        MinHeight := SYNCHRONIZATION_MINTHICK;
        Height := MinHeight;
      end;
    end;
    pkJunction: begin
      Sizable := szNone;
      MinWidth := JUNCTION_MINWIDTH;
      MinHeight := JUNCTION_MINHEIGHT;
      Width := MinWidth;
      Height := MinHeight;
    end;
    pkChoice: begin
      Sizable := szNone;
      MinWidth := CHOICE_MINWIDTH;
      MinHeight := CHOICE_MINHEIGHT;
      Width := MinWidth;
      Height := MinHeight;
    end;
    pkDecision: begin
      Sizable := szFree;
      MinWidth := DECISION_MINWIDTH;
      MinHeight := DECISION_MINHEIGHT;
    end;
  end;
end;

// PUMLPseudostateView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLFinalStateView

procedure PUMLFinalStateView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Brush.Color := BACKGROUND_COLOR;
  Canvas.Ellipse(Left, Top, Right, Bottom);
  Canvas.Brush.Color := LineColor;
  Canvas.Pen.Color := LineColor;
  Canvas.Ellipse(Left+5, Top+5, Right-5, Bottom-5);
end;

procedure PUMLFinalStateView.DrawNoModeledMark(Canvas: PCanvas);
begin
  DrawModelExcludedMark(Canvas, Left + Width * 3 div 4, Top + Height * 1 div 4);
end;

procedure PUMLFinalStateView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  Sizable := szNone;
  MinWidth := FINALSTATE_MINWIDTHH;
  MinHeight := FINALSTATE_MINHEIGHT;
  Width := MinWidth;
  Height := MinHeight;
end;

// PUMLFinalStateView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActionStateView

procedure PUMLActionStateView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);

  // draw outer line
  if Width div 3 > Height then
    Canvas.RoundRect(Left, Top, Right, Bottom, Height, Height)
  else
    Canvas.RoundRect(Left, Top, Right, Bottom, Width div 3, Height);
end;

procedure PUMLActionStateView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  if MinWidth div 3 > MinHeight then
    MinWidth := MinWidth + MinHeight div 2
  else
    MinWidth := MinWidth + MinWidth div 6;
end;

// PUMLActionStateView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSubactivityStateView

procedure PUMLSubactivityStateView.InitializeIncludeLabel(AIncludeLabel: PLabelView);
begin
  AIncludeLabel.Selectable := False;
  AIncludeLabel.HorzAlignment := haCenter;
  AIncludeLabel.VertAlignment := vaTop;
  AIncludeLabel.ParentLineColor := True;
  AIncludeLabel.ParentFillColor := True;
  AIncludeLabel.ParentFontFace := True;
  AIncludeLabel.ParentFontSize := True;
  AIncludeLabel.ParentFontColor := True;
  AIncludeLabel.ParentFontStyle := True;
end;

procedure PUMLSubactivityStateView.SetIncludeLabel(Value: PLabelView);
begin
  if FIncludeLabel <> Value then begin
    RemoveSubView(FIncludeLabel);
    FIncludeLabel := Value;
    if FIncludeLabel <> nil then InitializeIncludeLabel(FIncludeLabel);
    AddSubView(FIncludeLabel);
  end;
end;

procedure PUMLSubactivityStateView.DrawObject(Canvas: PCanvas);
var
  A, B: Integer;
  CX, CY, CX1, CX2: Integer;
  X, Y, X1, X2: Integer;
begin
  AssignStyleToCanvas(Canvas);

  // draw outer line
  if Width div 3 > Height then
    Canvas.RoundRect(Left, Top, Right, Bottom, Height, Height)
  else
    Canvas.RoundRect(Left, Top, Right, Bottom, Width div 3, Height);

  // draw include-compartment boundary line
  if IncludeLabel.Visible then begin
    if Width div 3 > Height then
      A := Height div 2
    else
      A := Width div 6;
    B := Height div 2;
    CX1 := Left + A;
    CX2 := Right - A;
    CY := Top + B;
    Y := IncludeLabel.Top - COMPARTMENT_TOP_MARGIN;
    X1 := Trunc(CX1 - A * Sqrt(Sqr(B) - Sqr(Y - CY)) / B);
    X2 := Trunc(CX2 + A * Sqrt(Sqr(B) - Sqr(Y - CY)) / B);
    Canvas.MoveTo(X1, Y);
    Canvas.LineTo(X2, Y);
  end;

  // draw subactivity icon
  if Width div 3 > Height then
    A := Height div 2
  else
    A := Width div 6;
  B := Height div 2;
  CX := Right - A;
  CY := Top + B;
  Y := Bottom - 8;
  X := Trunc(CX + A * Sqrt(Sqr(B) - Sqr(Y - CY)) / B);
  Canvas.RoundRect(X - 28, Y, X - 20, Y - 6, 5, 5);  // left-lower state
  Canvas.RoundRect(X - 14, Y - 10, X - 6, Y - 4, 5, 5);  // X-upper state
  Canvas.PolyLine([Point(X - 20, Y - 4), Point(X - 14, Y - 6)]);
//  Canvas.PolyLine([Point(Right - 18, Bottom - 13), Point(Right - 14, Bottom - 12), Point(Right - 17, Bottom - 8)]);
end;

procedure PUMLSubactivityStateView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  MinHeight := MinHeight + STATE_DECOMPOSIT_INDICATOR_HEIGHT;
  MinWidth := Max(MinWidth, STATE_DECOMPOSIT_INDICATOR_WIDTH);
  if IncludeLabel.Visible then begin
    MinWidth := Max(MinWidth, IncludeLabel.MinWidth + COMPARTMENT_LEFT_MARGIN + COMPARTMENT_RIGHT_MARGIN);
    MinHeight := MinHeight + COMPARTMENT_TOP_MARGIN + IncludeLabel.MinHeight + COMPARTMENT_BOTTOM_MARGIN +COMPARTMENT_INTERVAL;
  end;
  if MinWidth div 3 > MinHeight then
    MinWidth := MinWidth + MinHeight div 2
  else
    MinWidth := MinWidth + MinWidth div 6;
  if IncludeLabel.Visible then begin
    IncludeLabel.Left := Left + COMPARTMENT_LEFT_MARGIN;
    IncludeLabel.Top := NameCompartment.Bottom + COMPARTMENT_INTERVAL + COMPARTMENT_TOP_MARGIN;
    IncludeLabel.Right := Right - COMPARTMENT_RIGHT_MARGIN;
  end;
end;

procedure PUMLSubactivityStateView.Setup;
begin
  inherited;
  IncludeLabel := MetaModel.CreateInstance('LabelView') as PLabelView;
end;

procedure PUMLSubactivityStateView.Update;
var
  M: PUMLSubactivityState;
begin
  if Model = nil then Exit;
  inherited;
  M := Model as PUMLSubactivityState;
  if M.Submachine <> nil then
    IncludeLabel.Text := 'include / ' + M.Submachine.Name
  else
    IncludeLabel.Text := '';
  IncludeLabel.Visible := (M.Submachine <> nil);
end;

function PUMLSubactivityStateView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'IncludeLabel' then
    Result := IncludeLabel
  else
    Result := inherited MOF_GetReference(Name);
end;

procedure PUMLSubactivityStateView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'IncludeLabel' then
    IncludeLabel := Value as PLabelView
  else
    inherited MOF_SetReference(Name, Value);
end;

// PUMLSubactivityStateView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSwimlaneView

constructor PUMLSwimlaneView.Create;
begin
  inherited;
  FNameLabel := nil;
end;

procedure PUMLSwimlaneView.InitializeNameLabel(ANameLabel: PLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ANameLabel.Selectable := False;
  ANameLabel.HorzAlignment := haCenter;
  ANameLabel.VertAlignment := vaTop;
  ANameLabel.ParentLineColor := True;
  ANameLabel.ParentFillColor := True;
  ANameLabel.ParentFontFace := True;
  ANameLabel.ParentFontSize := True;
  ANameLabel.ParentFontColor := True;
  ANameLabel.ParentFontStyle := True;
end;

procedure PUMLSwimlaneView.SetNameLabel(Value: PLabelView);
begin
  if FNameLabel <> Value then begin
    RemoveSubView(FNameLabel);
    FNameLabel := Value;
    if FNameLabel <> nil then InitializeNameLabel(FNameLabel);
    AddSubView(FNameLabel);
  end;
end;

procedure PUMLSwimlaneView.SetDirection(Value: PUMLSwimlaneDirectionKind);
begin
  if FDirection <> Value then begin
    FDirection := Value;
  end;
end;

procedure PUMLSwimlaneView.DrawObject(Canvas: PCanvas);
var
  H, W: Integer;
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Pen.Width := SWIMLANE_PEN_WIDTH;
  if Direction = slkVertical then begin
    H := Top + NameLabel.Height + SWIMLANE_HEADER_TOP_MARGIN + SWIMLANE_HEADER_BOTTOM_MARGIN;
    Canvas.Rectangle(Left, Top, Right, H);
    Canvas.PolyLine([Point(Left, Bottom), Point(Left, Top), Point(Right - 1, Top), Point(Right - 1, Bottom)]);
  end
  else begin
    W := Left + NameLabel.Width + SWIMLANE_HEADER_TOP_MARGIN + SWIMLANE_HEADER_BOTTOM_MARGIN;
    Canvas.Rectangle(Left, Top, W, Bottom);
    Canvas.PolyLine([Point(Right, Top), Point(Left, Top), Point(Left, Bottom - 1), Point(Right, Bottom - 1)]);
  end;    
  Canvas.Pen.Width := 1;
end;

procedure PUMLSwimlaneView.DrawNoModeledMark(Canvas: PCanvas);
begin
  DrawModelExcludedMark(Canvas, Left + Width div 2, Top + Height div 2);
end;

procedure PUMLSwimlaneView.ArrangeObject(Canvas: PCanvas);
var
  W, H: Integer;
begin
  // not inherited (SwimlaneView must not be affected by 'AutoResize' attribute.
  if Direction = slkVertical then begin
    NameLabel.Direction := dkHorizontal;
    W := NameLabel.MinWidth + SWIMLANE_HEADER_LEFT_MARGIN + SWIMLANE_HEADER_RIGHT_MARGIN;
    MinWidth := Max(W, SWIMLANE_VERT_MINWIDTH);
    H := NameLabel.MinHeight + SWIMLANE_HEADER_TOP_MARGIN + SWIMLANE_HEADER_BOTTOM_MARGIN;
    MinHeight := Max(H, SWIMLANE_VERT_MINHEIGHT);
    NameLabel.Width := NameLabel.MinWidth;
    NameLabel.Height := NameLabel.MinHeight;
    NameLabel.Left := Left;
    NameLabel.Right := Right;
    NameLabel.Top := Top + SWIMLANE_HEADER_TOP_MARGIN;
  end
  else begin
    NameLabel.Direction := dkVertical;
    W := NameLabel.MinWidth + SWIMLANE_HEADER_TOP_MARGIN + SWIMLANE_HEADER_BOTTOM_MARGIN;
    MinWidth := Max(W, SWIMLANE_HORIZ_MINWIDTH);
    H := NameLabel.MinHeight + SWIMLANE_HEADER_LEFT_MARGIN + SWIMLANE_HEADER_RIGHT_MARGIN;
    MinHeight := Max(H, SWIMLANE_HORIZ_MINHEIGHT);
    NameLabel.Width := NameLabel.MinWidth;
    NameLabel.Height := NameLabel.MinHeight;
    NameLabel.Left := Left + SWIMLANE_HEADER_TOP_MARGIN;
    NameLabel.Top := Top;
    NameLabel.Bottom := Bottom;
  end;
end;

procedure PUMLSwimlaneView.Setup;
begin
  inherited;
  NameLabel := MetaModel.CreateInstance('LabelView') as PLabelView;
end;

procedure PUMLSwimlaneView.Update;
var
  N: string;
begin
  if Model = nil then Exit;
  inherited;
  N := Model.Name;
  NameLabel.Text := N;
  NameLabel.Visible := (NameLabel.Text <> '');
end;

function PUMLSwimlaneView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'Direction' then begin
    Result := UMLSwimlaneDirectionKindToString(FDirection);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PUMLSwimlaneView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'Direction' then begin
    FDirection := StringToUMLSwimlaneDirectionKind(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PUMLSwimlaneView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'NameLabel' then
    Result := NameLabel
  else Result := inherited MOF_GetReference(Name);
end;

procedure PUMLSwimlaneView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'NameLabel' then
    NameLabel := Value as PLabelView
  else inherited MOF_SetReference(Name, Value);
end;

// PUMLSwimlaneView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLTransitionView

constructor PUMLTransitionView.Create;
begin
  inherited;
  HeadEndStyle := esStickArrow;
end;

procedure PUMLTransitionView.ArrangeObject(Canvas: PCanvas);
{
var
  StateView: PUMLStateView;
  HalfWidth, HalfHeight: Integer;
  Right, Bottom: Integer;
  Pt: TPoint;
  I: Integer;
}
begin
  inherited;
{
  // Case of Self Transition
  if Head = Tail then begin
    // PRECONDITION
    Assert(Head is PUMLStateView);
    // PRECONDITION
    StateView := Head as PUMLStateView;
    for I := 1 to Points.Count - 1 do begin
      Pt := Points.Points[I];
      if (Pt.X > StateView.Left) and (Pt.X < StateView.Right) and
         (Pt.Y > StateView.Top) and (Pt.Y < StateView.Bottom) then begin
        Points.Clear;
        Right := StateView.Right;
        Bottom := StateView.Bottom;
        HalfWidth := Trunc((StateView.Right - StateView.Left)/2);
        HalfHeight := Trunc((StateView.Bottom - StateView.Top)/2);
        Pt.X := Right; Pt.Y := Bottom - HalfHeight;
        Points.Add(Pt);
        Pt.X := Pt.X + SELFTRANSITION_DISTANCE;
        Points.Add(Pt);
        Pt.Y := Bottom + SELFTRANSITION_DISTANCE;
        Points.Add(Pt);
        Pt.X := Right - HalfWidth;
        Points.Add(Pt);
        Pt.Y := Bottom;
        Points.Add(Pt);
        Break;
      end;
    end;
  end;
}
end;

procedure PUMLTransitionView.Update;
var
  M: PUMLTransition;
  S: string;
  I: Integer;
begin
  if Model = nil then Exit;
  inherited;
  // ASSERTION
  Assert(Model is PUMLTransition, 'Wrong model assigned');
  // ASSERTION
  M := Model as PUMLTransition;
  if M.StereotypeName <> '' then
    FStereotypeLabel.Text := '<<' + M.StereotypeName + '>>';

  S := '';
  for I := 0 to M.TriggerCount - 1 do begin
    S := S + M.Triggers[I].Name;
    if I < M.TriggerCount - 1 then
      S := S + ', '
    else
      S := S + ' ';
  end;
  if M.GuardCondition <> '' then
    S := S + '[ ' + M.GuardCondition + ' ] ';
  if M.EffectCount > 0 then begin
    S := S + '/ ';
    for I := 0 to M.EffectCount - 1 do begin
      S := S + M.Effects[I].Name;
      if I < M.EffectCount - 1 then
        S := S + ', '
    end;
  end;

  if S = '' then
    S := M.Name
  else if M.Name <> '' then
    S := M.Name + ' : ' + S;

  FNameLabel.Text := S;

  if (M.Source is PUMLObjectFlowState) or (M.Target is PUMLObjectFlowState) then
    LineMode := lmDot
  else
    LineMode := lmSolid;
end;

// PUMLTransitionView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLObjectFlowStateView

procedure PUMLObjectFlowStateView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
end;

procedure PUMLObjectFlowStateView.Setup;
begin
  inherited;
  // more consider
  NameCompartment.NameLabel.FontStyle := [fsUnderline];
end;

procedure PUMLObjectFlowStateView.Update;
var
  M: PUMLObjectFlowState;
  S: string;
begin
  if Model = nil then Exit;
  inherited;
  // ASSERTIONS
  Assert(Model is PUMLObjectFlowState);
  // ASSERTIONS
  M := Model as PUMLObjectFlowState;
  S := '';
  if M.Type_ <> nil then
    S := S + M.Type_.Name;
  if M.Name <> '' then begin
    if S <> '' then
      S := S + ' ';
    S := S + '[' + M.Name + ']';
  end;
  NameCompartment.NameLabel.Text := S;
end;

// PUMLObjectFlowStateView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLFlowFinalStateView

procedure PUMLFlowFinalStateView.DrawObject(Canvas: PCanvas);
var
  P: TPoint;
  D: Integer;
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Brush.Color := BACKGROUND_COLOR;
  Canvas.Ellipse(Left, Top, Right, Bottom);
  P := CenterPoint(Rect(Left, Top, Right, Bottom));
  D := Round(Sqrt(2) * Width / 4);
  Canvas.MoveTo(P.X - D + 1, P.Y - D + 1);
  Canvas.LineTo(P.X + D, P.Y + D);
  Canvas.MoveTo(P.X + D, P.Y - D + 1);
  Canvas.LineTo(P.X - D + 1, P.Y + D);
end;

procedure PUMLFlowFinalStateView.DrawNoModeledMark(Canvas: PCanvas);
begin
  DrawModelExcludedMark(Canvas, Left + Width * 3 div 4, Top + Height * 1 div 4);
end;

procedure PUMLFlowFinalStateView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  Sizable := szNone;
  MinWidth := FLOWFINALSTATE_MINWIDTH;
  MinHeight := FLOWFINALSTATE_MINHEIGHT;
  Width := MinWidth;
  Height := MinHeight;
end;

// PUMLFlowFinalStateView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSignalAcceptStateView

procedure PUMLSignalAcceptStateView.DrawObject(Canvas: PCanvas);
begin
  inherited;
  AssignStyleToCanvas(Canvas);
  Canvas.Polygon([Point(Left, Top), Point(Right, Top),  Point(Right, Bottom), Point(Left, Bottom),
    Point(Left + Height div 2, Top + Height div 2)]);

end;

procedure PUMLSignalAcceptStateView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  NameCompartment.Left := Left + Height div 2;
  MinWidth := NameCompartment.MinWidth + Height div 2;
  NameCompartment.Width := Width - Height div 2; 
end;

// PUMLSignalAcceptStateView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSignalSendStateView

procedure PUMLSignalSendStateView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Polygon([Point(Left, Top), Point(Left, Bottom), Point(Right - Height div 2, Bottom),
    Point(Right, Top + Height div 2), Point(Right - Height div 2, Top)]);
end;

procedure PUMLSignalSendStateView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  MinWidth := NameCompartment.MinWidth + Height div 2;
  NameCompartment.Width := Width - Height div 2;
end;

// PUMLSignalSendStateView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLPortView

constructor PUMLPortView.Create;
begin
  inherited;
  FNameLabel := nil;
  FStereotypeLabel := nil;
  FPropertyLabel := nil;
  Selectable := True;
  Sizable := szNone;
  Movable := mmFree;
  ContainerChangeable := False;
  ContainerExtending := False;
end;

procedure PUMLPortView.InitializeNameLabel(ANodeLabel: PNodeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ANodeLabel.Selectable := True;
  ANodeLabel.HorzAlignment := haCenter;
  ANodeLabel.VertAlignment := vaTop;
  ANodeLabel.ParentLineColor := False;
  ANodeLabel.ParentFillColor := False;
  ANodeLabel.ParentFontFace := False;
  ANodeLabel.ParentFontSize := False;
  ANodeLabel.ParentFontColor := False;
  ANodeLabel.ParentFontStyle := False;
end;

procedure PUMLPortView.InitializeStereotypeLabel(ANodeLabel: PNodeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ANodeLabel.Selectable := True;
  ANodeLabel.HorzAlignment := haCenter;
  ANodeLabel.VertAlignment := vaTop;
  ANodeLabel.ParentLineColor := False;
  ANodeLabel.ParentFillColor := False;
  ANodeLabel.ParentFontFace := False;
  ANodeLabel.ParentFontSize := False;
  ANodeLabel.ParentFontColor := False;
  ANodeLabel.ParentFontStyle := False;
end;

procedure PUMLPortView.InitializePropertyLabel(ANodeLabel: PNodeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ANodeLabel.Selectable := True;
  ANodeLabel.HorzAlignment := haCenter;
  ANodeLabel.VertAlignment := vaTop;
  ANodeLabel.ParentLineColor := False;
  ANodeLabel.ParentFillColor := False;
  ANodeLabel.ParentFontFace := False;
  ANodeLabel.ParentFontSize := False;
  ANodeLabel.ParentFontColor := False;
  ANodeLabel.ParentFontStyle := False;
end;

procedure PUMLPortView.SetNameLabel(Value: PNodeLabelView);
begin
  if FNameLabel <> Value then begin
    RemoveSubView(FNameLabel);
    FNameLabel := Value;
    if FNameLabel <> nil then InitializeNameLabel(FNameLabel);
    AddSubView(FNameLabel);
  end;
end;

procedure PUMLPortView.SetStereotypeLabel(Value: PNodeLabelView);
begin
  if FStereotypeLabel <> Value then begin
    RemoveSubView(FStereotypeLabel);
    FStereotypeLabel := Value;
    if FStereotypeLabel <> nil then InitializeStereotypeLabel(FStereotypeLabel);
    AddSubView(FStereotypeLabel);
  end;
end;

procedure PUMLPortView.SetPropertyLabel(Value: PNodeLabelView);
begin
  if FPropertyLabel <> Value then begin
    RemoveSubView(FPropertyLabel);
    FPropertyLabel := Value;
    if FPropertyLabel <> nil then InitializePropertyLabel(FPropertyLabel);
    AddSubView(FPropertyLabel);
  end;
end;

procedure PUMLPortView.SetShowProperty(Value: Boolean);
begin
  if FShowProperty <> Value then begin
    FShowProperty := Value;
  end;
end;

procedure PUMLPortView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
end;

function Junction2(R: TRect; P: TPoint): TPoint;
var
  Lean: Real;
  C: TPoint;
  CP: array[0..3] of TPoint;
  MD, D: Real;
  Idx, I: Integer;
begin
  C.X := (R.Left + R.Right) div 2;
  C.Y := (R.Top + R.Bottom) div 2;

  if (C.X = P.X) or (C.Y = P.Y) then begin
    Result := OrthoJunction(R, P);
    Exit;
  end;

  Lean := (P.Y - C.Y) / (P.X - C.X);
  // contact points
  CP[0] := Point(R.Left, Round(Lean * (R.Left - C.X) + C.Y)); // left
  CP[1] := Point(R.Right, Round(Lean * (R.Right - C.X) + C.Y));  // right
  CP[2] := Point(Round((R.Top - C.Y) / Lean + C.X), R.Top);  // top
  CP[3] := Point(Round((R.Bottom - C.Y) / Lean + C.X), R.Bottom); // bottom

  if PtInRect(R, P) then begin
    Idx := 0;
    MD := Sqrt(Sqr(CP[0].X - P.X) + Sqr(CP[0].Y - P.Y));
    for I := 1 to 3 do begin
      D := Sqrt(Sqr(CP[I].X - P.X) + Sqr(CP[I].Y - P.Y));
      if D < MD then begin
        MD := D;
        Idx := I;
      end;
    end;
    Result := CP[Idx];
  end
  else begin
    GraphicClasses.NormalizeRect(C.X, C.Y, P.X, P.Y);
    I := -1;
    repeat
      Inc(I);
    until (((R.Left <= CP[I].X) and (CP[I].X <= R.Right) and
           (R.Top <= CP[I].Y) and (CP[I].Y <= R.Bottom) and
           (C.X <= CP[I].X) and (CP[I].X <= P.X) and
           (C.Y <= CP[I].Y) and (CP[I].Y <= P.Y)) or (I > 4) );

    if I > 3 then
      Result := Point((R.Left + R.Right) div 2, (R.Top + R.Bottom) div 2)
    else
      Result := CP[I];
  end;
end;

procedure PUMLPortView.ArrangeObject(Canvas: PCanvas);
var
  R: TRect;
  C, P: TPoint;
begin
  inherited;
  MinWidth := PORT_MINWIDTH;
  MinHeight := PORT_MINHEIGHT;
  if ContainerView <> nil then begin
    R := ContainerView.GetBoundingBox(Canvas);
    C := CenterPoint(Rect(Left, Top, Right, Bottom));
    P := Junction2(R, C);
    Left := P.X - PORT_MINWIDTH div 2;
    Top := P.Y - PORT_MINHEIGHT div 2;
    Right := P.X + PORT_MINWIDTH div 2;
    Bottom := P.Y + PORT_MINHEIGHT div 2;
  end;
  NameLabel.Visible := (NameLabel.Text <> '');
  StereotypeLabel.Visible := (StereotypeLabel.Text <> '');
  PropertyLabel.Visible := (PropertyLabel.Text <> '');
end;

procedure PUMLPortView.Setup;
begin
  inherited;
  NameLabel := MetaModel.CreateInstance('NodeLabelView') as PNodeLabelView;
  NameLabel.Model := Self.Model;
  NameLabel.Distance := 20;
  NameLabel.Alpha := 3 * PI / 4;
  StereotypeLabel := MetaModel.CreateInstance('NodeLabelView') as PNodeLabelView;
  StereotypeLabel.Model := Self.Model;
  StereotypeLabel.Distance := 35;
  StereotypeLabel.Alpha := 3 * PI / 4;
  PropertyLabel := MetaModel.CreateInstance('NodeLabelView') as PNodeLabelView;
  PropertyLabel.Model := Self.Model;
  PropertyLabel.Distance := 20;
  PropertyLabel.Alpha := -3 * PI / 4;
end;

procedure PUMLPortView.Update;
var
  M: PUMLPort;
begin
  if Model = nil then Exit;
  inherited;
  M := Model as PUMLPort;
  NameLabel.Text := M.Name;
  if M.StereotypeName <> '' then
    StereotypeLabel.Text := '<<' + M.StereotypeName + '>>'
  else
    StereotypeLabel.Text := '';
  PropertyLabel.Text := GetPropertyString(M);
end;

function PUMLPortView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'ShowProperty' then begin
    Result := BooleanToString(FShowProperty);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PUMLPortView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'ShowProperty' then begin
    FShowProperty := StringToBoolean(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PUMLPortView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'NameLabel' then begin
    Result := NameLabel;
  end
  else if Name = 'StereotypeLabel' then begin
    Result := StereotypeLabel;
  end
  else if Name = 'PropertyLabel' then begin
    Result := PropertyLabel;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLPortView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'NameLabel' then begin
    NameLabel := Value as PNodeLabelView;
  end
  else if Name = 'StereotypeLabel' then begin
    StereotypeLabel := Value as PNodeLabelView;
  end
  else if Name = 'PropertyLabel' then begin
    PropertyLabel := Value as PNodeLabelView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLPortView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLPartView

constructor PUMLPartView.Create;
begin
  inherited;
  ContainerChangeable := False;
end;

function PUMLPartView.IsContainedByReference: Boolean;

  function GetOtherSide(AssocEnd: PUMLAssociationEnd): PUMLAssociationEnd;
  begin
    if AssocEnd.Association.Connections[0] = AssocEnd then
      Result := AssocEnd.Association.Connections[1]
    else
      Result := AssocEnd.Association.Connections[0];
  end;

var
  M: PUMLAttribute;
  AssocEnd, OtherSide: PUMLAssociationEnd;
  I: Integer;
begin
  Result := False;
  if Model = nil then Exit;
  M := Model as PUMLAttribute;
  if M.Type_ <> nil then begin
    for I := 0 to M.Type_.AssociationCount - 1 do begin
      AssocEnd := M.Type_.Associations[I];
      OtherSide := GetOtherSide(AssocEnd);
      if (AssocEnd.Name = M.Name) and (OtherSide.Participant = M.Owner) then begin
        if OtherSide.Aggregation = akComposite then
          Result := False
        else
          Result := True;
        Exit;
      end;
    end;
  end;
end;

procedure PUMLPartView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  if IsContainedByReference then
    Canvas.Pen.Style := psDot
  else
    Canvas.Pen.Style := psSolid;
  Canvas.Rectangle(Left, Top, Right, Bottom);
end;

procedure PUMLPartView.Update;
var
  M: PUMLAttribute;
  S: string;
begin
  if Model = nil then Exit;
  inherited;
  M := Model as PUMLAttribute;
  S := M.Name;
  if M.Type_ <> nil then
    S := S + ': ' + M.Type_.Name
  else if M.TypeExpression <> '' then
    S := S + ': ' + M.TypeExpression;
  if M.Multiplicity <> '' then
    S := S + '[' + M.Multiplicity + ']';
  NameCompartment.NameLabel.Text := S;
end;

// PUMLPartView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLConnectorView

constructor PUMLConnectorView.Create;
begin
  inherited;
  FHeadRoleNameLabel := nil;
  FTailRoleNameLabel := nil;
  FHeadMultiplicityLabel := nil;
  FTailMultiplicityLabel := nil;
end;

procedure PUMLConnectorView.Setup;
begin
  inherited;
  HeadRoleNameLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  HeadRoleNameLabel.EdgePosition := epHead;
  HeadRoleNameLabel.Alpha := -PI / 6;
  HeadRoleNameLabel.Distance := 30;
  HeadRoleNameLabel.Model := (Model as PUMLConnector).Ends[1];

  TailRoleNameLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  TailRoleNameLabel.EdgePosition := epTail;
  TailRoleNameLabel.Alpha := PI / 6;
  TailRoleNameLabel.Distance := 30;
  TailRoleNameLabel.Model := (Model as PUMLConnector).Ends[0];

  HeadMultiplicityLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  HeadMultiplicityLabel.EdgePosition := epHead;
  HeadMultiplicityLabel.Alpha := PI / 6;
  HeadMultiplicityLabel.Distance := 25;
  HeadMultiplicityLabel.Model := (Model as PUMLConnector).Ends[1];

  TailMultiplicityLabel := MetaModel.CreateInstance('EdgeLabelView') as PEdgeLabelView;
  TailMultiplicityLabel.EdgePosition := epTail;
  TailMultiplicityLabel.Alpha := -PI / 6;
  TailMultiplicityLabel.Distance := 25;
  TailMultiplicityLabel.Model := (Model as PUMLConnector).Ends[0];

  TailEndStyle := esFlat;
  HeadEndStyle := esFlat;
end;

procedure PUMLConnectorView.InitializeRoleNameLabel(ARoleNameLabel: PEdgeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  ARoleNameLabel.Selectable := True;
  ARoleNameLabel.HorzAlignment := haCenter;
  ARoleNameLabel.VertAlignment := vaTop;
  ARoleNameLabel.ParentLineColor := False;
  ARoleNameLabel.ParentFillColor := False;
  ARoleNameLabel.ParentFontFace := False;
  ARoleNameLabel.ParentFontSize := False;
  ARoleNameLabel.ParentFontColor := False;
  ARoleNameLabel.ParentFontStyle := False;
end;

procedure PUMLConnectorView.InitializeMultiplicityLabel(AMultiplicityLabel: PEdgeLabelView);
begin
  // INITIALIZE ONLY "TRANSIENT" PROPERTIES.
  AMultiplicityLabel.Selectable := True;
  AMultiplicityLabel.HorzAlignment := haCenter;
  AMultiplicityLabel.VertAlignment := vaTop;
  AMultiplicityLabel.ParentLineColor := False;
  AMultiplicityLabel.ParentFillColor := False;
  AMultiplicityLabel.ParentFontFace := False;
  AMultiplicityLabel.ParentFontSize := False;
  AMultiplicityLabel.ParentFontColor := False;
  AMultiplicityLabel.ParentFontStyle := False;
end;

procedure PUMLConnectorView.SetHeadRoleNameLabel(Value: PEdgeLabelView);
begin
  if FHeadRoleNameLabel <> Value then begin
    RemoveSubView(FHeadRoleNameLabel);
    FHeadRoleNameLabel := Value;
    if FHeadRoleNameLabel <> nil then InitializeRoleNameLabel(FHeadRoleNameLabel);
    AddSubView(FHeadRoleNameLabel);
  end;
end;

procedure PUMLConnectorView.SetTailRoleNameLabel(Value: PEdgeLabelView);
begin
  if FTailRoleNameLabel <> Value then begin
    RemoveSubView(FTailRoleNameLabel);
    FTailRoleNameLabel := Value;
    if FTailRoleNameLabel <> nil then InitializeRoleNameLabel(FTailRoleNameLabel);
    AddSubView(FTailRoleNameLabel);
  end;
end;

procedure PUMLConnectorView.SetHeadMultiplicityLabel(Value: PEdgeLabelView);
begin
  if FHeadMultiplicityLabel <> Value then begin
    RemoveSubView(FHeadMultiplicityLabel);
    FHeadMultiplicityLabel := Value;
    if FHeadMultiplicityLabel <> nil then InitializeMultiplicityLabel(FHeadMultiplicityLabel);
    AddSubView(FHeadMultiplicityLabel);
  end;
end;

procedure PUMLConnectorView.SetTailMultiplicityLabel(Value: PEdgeLabelView);
begin
  if FTailMultiplicityLabel <> Value then begin
    RemoveSubView(FTailMultiplicityLabel);
    FTailMultiplicityLabel := Value;
    if FTailMultiplicityLabel <> nil then InitializeMultiplicityLabel(FTailMultiplicityLabel);
    AddSubView(FTailMultiplicityLabel);
  end;
end;

procedure PUMLConnectorView.Update;
var
  Con1, Con2: PUMLConnectorEnd;
  S: string;
begin
  if Model = nil then Exit;
  inherited;
  Con1 := (Model as PUMLConnector).Ends[0]; // Tail-side
  Con2 := (Model as PUMLConnector).Ends[1]; // Head-side
  // RoleName (Connection1)
  S := VisibilityToSymbol(Con1.Visibility);
  S := S + Con1.Name;
  if Con1.Name <> '' then begin
    TailRoleNameLabel.Visible := True;
    TailRoleNameLabel.Text := S;
  end
  else begin
    TailRoleNameLabel.Visible := False;
  end;
  // RoleName (Connection2)
  S := VisibilityToSymbol(Con2.Visibility);
  S := S + Con2.Name;
  if Con2.Name <> '' then begin
    HeadRoleNameLabel.Visible := True;
    HeadRoleNameLabel.Text := S;
  end
  else begin
    HeadRoleNameLabel.Visible := False;
  end;
  // Multiplicity (Connection1)
  if Con1.Multiplicity = '' then TailMultiplicityLabel.Visible := False
                            else TailMultiplicityLabel.Visible := True;
  TailMultiplicityLabel.Text := Con1.Multiplicity;
  // Multiplicity (Connection2)
  if Con2.Multiplicity = '' then HeadMultiplicityLabel.Visible := False
                            else HeadMultiplicityLabel.Visible := True;
  HeadMultiplicityLabel.Text := Con2.Multiplicity;
end;

function PUMLConnectorView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'HeadRoleNameLabel' then begin
    Result := HeadRoleNameLabel;
  end
  else if Name = 'TailRoleNameLabel' then begin
    Result := TailRoleNameLabel;
  end
  else if Name = 'HeadMultiplicityLabel' then begin
    Result := HeadMultiplicityLabel;
  end
  else if Name = 'TailMultiplicityLabel' then begin
    Result := TailMultiplicityLabel;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PUMLConnectorView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'HeadRoleNameLabel' then begin
    HeadRoleNameLabel := Value as PEdgeLabelView;
  end
  else if Name = 'TailRoleNameLabel' then begin
    TailRoleNameLabel := Value as PEdgeLabelView;
  end
  else if Name = 'HeadMultiplicityLabel' then begin
    HeadMultiplicityLabel := Value as PEdgeLabelView;
  end
  else if Name = 'TailMultiplicityLabel' then begin
    TailMultiplicityLabel := Value as PEdgeLabelView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PUMLConnectionView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomTextView

constructor PUMLCustomTextView.Create;
begin
  inherited;
  FLines := TStringList.Create;
end;

destructor PUMLCustomTextView.Destroy;
begin
  FLines.Free;
  inherited;
end;

procedure PUMLCustomTextView.SetText(Value: string);
begin
  if FLines.Text <> Value then begin
    FLines.Text := Value;
  end;
end;

function PUMLCustomTextView.GetText: string;
begin
  Result := FLines.Text;
end;

procedure PUMLCustomTextView.DrawObject(Canvas: PCanvas);
var
  I: Integer;
begin
  AssignFontToCanvas(Canvas);
  for I := 0 to FLines.Count - 1 do begin
    Canvas.TextOut(Left + COMPARTMENT_LEFT_MARGIN, Top + COMPARTMENT_TOP_MARGIN + I * (Canvas.TextHeight('^_') + 2), Lines.Strings[I]);
  end;
end;

procedure PUMLCustomTextView.ArrangeObject(Canvas: PCanvas);
var
  W, H: Integer;
  I: Integer;
begin
  inherited;
  AssignFontToCanvas(Canvas);
  W := 0;
  for I := 0 to FLines.Count - 1 do
    W := Max(W, Canvas.TextWidth(Lines.Strings[I]));
  H := Lines.Count * (Canvas.TextHeight('^_') + 2);

  W := W + COMPARTMENT_LEFT_MARGIN + COMPARTMENT_RIGHT_MARGIN;
  H := H + COMPARTMENT_TOP_MARGIN + COMPARTMENT_BOTTOM_MARGIN;
  MinWidth := Max(CUSTOM_TEXT_MINWIDTH, W);
  MinHeight := Max(CUSTOM_TEXT_MINHEIGHT, H);
end;

function PUMLCustomTextView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'Text' then begin
    Result := Text;
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PUMLCustomTextView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'Text' then begin
    Text := Value;
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

// PUMLCustomTextView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLTextView

// PUMLTextView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLNoteView

procedure PUMLNoteView.DrawObject(Canvas: PCanvas);
var
  R, B: Integer;
begin
  AssignStyleToCanvas(Canvas);
  R := Right - 1; B := Bottom - 1;
  Canvas.PolyGon([Point(Left, Top), Point(R - NOTE_FOLDING_SIZE, Top),
                   Point(R, Top + NOTE_FOLDING_SIZE),
                   Point(R, B),
                   Point(Left, B),
                   Point(Left, Top)]);
  Canvas.PolyGon([Point(R - NOTE_FOLDING_SIZE, Top),
                   Point(R - NOTE_FOLDING_SIZE, Top + NOTE_FOLDING_SIZE),
                   Point(R, Top + NOTE_FOLDING_SIZE)]);
  inherited;
end;

procedure PUMLNoteView.ArrangeObject(Canvas: PCanvas);
var
  W, H: Integer;
  I: Integer;
begin
  inherited;
  AssignFontToCanvas(Canvas);
  W := 0;
  for I := 0 to FLines.Count - 1 do
    W := Max(W, Canvas.TextWidth(Lines.Strings[I]));
  H := Lines.Count * (Canvas.TextHeight('^_') + 2);

  W := W + COMPARTMENT_LEFT_MARGIN + COMPARTMENT_RIGHT_MARGIN + NOTE_FOLDING_SIZE;
  H := H + COMPARTMENT_TOP_MARGIN + COMPARTMENT_BOTTOM_MARGIN;
  MinWidth := Max(NOTE_MINWIDTH, W);
  MinHeight := Max(NOTE_MINHEIGHT, H);
end;

// PUMLNoteView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLNoteLinkView

constructor PUMLNoteLinkView.Create;
begin
  inherited;
  LineMode := lmDot;
end;

procedure PUMLNoteLinkView.DrawNoModeledMark(Canvas: PCanvas);
begin
// do not draw.
end;

// PUMLNoteLinkView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PShapeView

constructor PShapeView.Create;
begin
  inherited;
  FLineKind := lkSolid;
  FLineWidth := 1;
end;

procedure PShapeView.SetLineWidth(Value: Integer);
begin
  if FLineWidth <> Value then begin
    FLineWidth := Value;
  end;
end;

procedure PShapeView.SetLineKind(Value: PLineKind);
begin
  if FLineKind <> Value then begin
    FLineKind := Value;
  end;
end;

function PShapeView.LineKindToPenStyle(Value: PLineKind): TPenStyle;
begin
  case Value of
    lkSolid: Result := psSolid;
    lkDash: Result := psDash;
    lkDot: Result := psDot;
    lkDashDot: Result := psDashDot;
    lkDashDotDot: Result := psDashDotDot;
    lkInsideFrame: Result := psInsideFrame;
  end;
end;

procedure PShapeView.AssignShapeStyleToCanvas(Canvas: PCanvas);
begin
  Canvas.Pen.Width := LineWidth;
  Canvas.Pen.Style := LineKindToPenStyle(LineKind);
end;

function PShapeView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'LineWidth' then begin
    Result := IntegerToString(LineWidth);
  end
  else if Name = 'LineKind' then begin
    Result := LineKindToString(LineKind);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PShapeView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'LineWidth' then begin
    LineWidth := StringToInteger(Value);
  end
  else if Name = 'LineKind' then begin
    LineKind := StringToLineKind(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

// PShapeView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PRectangleView

procedure PRectangleView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  AssignShapeStyleToCanvas(Canvas);
  Canvas.Rectangle(Left, Top, Right, Bottom);
end;

// PRectangleView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PEllipseView

procedure PEllipseView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  AssignShapeStyleToCanvas(Canvas);
  Canvas.Ellipse(Left, Top, Right, Bottom);
end;

// PEllipseView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PRoundRectView

procedure PRoundRectView.DrawObject(Canvas: PCanvas);
var
  R: Integer;
begin
  AssignStyleToCanvas(Canvas);
  AssignShapeStyleToCanvas(Canvas);
  R := Max(Width, Height);
  Canvas.RoundRect(Left, Top, Right, Bottom, R div 6, R div 6);
end;

// PRoundRectView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PLineView

// Implementation of IInterface functions
function PLineView.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function PLineView._AddRef: Integer;
begin
  Result := 1;
end;

function PLineView._Release: Integer;
begin
  Result := 0;
end;

constructor PLineView.Create;
begin
  inherited;
  FPoints := PPoints.Create;
  FBeginArrowheadStyle := askNone;
  FEndArrowheadStyle := askTriangle;
end;

destructor PLineView.Destroy;
begin
  FPoints.Free;
  FPoints := nil;
  inherited;
end;

procedure PLineView.Initialize(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
begin
  FPoints.Clear;
  FPoints.Add(Point(X1, Y1));
  FPoints.Add(Point(X2, Y2));
  inherited;
end;

function PLineView.ContainsPoint(Canvas: PCanvas; P: TPoint): Boolean;
var
  R: TRect;
  X1, Y1, X2, Y2: Integer;
begin
  X1 := FPoints.Points[0].X;
  Y1 := FPoints.Points[0].Y;
  X2 := FPoints.Points[1].X;
  Y2 := FPoints.Points[1].Y;
  R := Rect(X1, Y1, X2, Y2);
  Result := PtInLine(R, P);
end;

function PLineView.OverlapRect(Canvas: PCanvas; R: TRect): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to FPoints.Count - 2 do
    if RectInLine(R, Point(FPoints.Points[I].X, FPoints.Points[I].Y),
                     Point(FPoints.Points[I + 1].X, FPoints.Points[I + 1].Y)) then begin
      Result := True;
      Exit;
    end;
end;

function PLineView.GetPoints: PPoints;
begin
  Result := FPoints;
end;

procedure PLineView.SetPoints(Value: PPoints);
begin
  if (Value <> FPoints) and (Value <> nil) then begin
    FPoints.Assign(Value);
  end;
end;

procedure PLineView.SetBeginArrowheadStyle(Value: PArrowheadStyleKind);
begin
  if FBeginArrowheadStyle <> Value then begin
    FBeginArrowheadStyle := Value;
  end;
end;

procedure PLineView.SetEndArrowheadStyle(Value: PArrowheadStyleKind);
begin
  if FEndArrowheadStyle <> Value then begin
    FEndArrowheadStyle := Value;
  end;
end;

procedure PLineView.DrawSelection(Canvas: PCanvas);
var
  I: Integer;
begin
  for I := 0 to FPoints.Count - 1 do
    DrawHighlighter(Canvas, FPoints.Points[I].X, FPoints.Points[I].Y, DEFAULT_HALF_HIGHLIGHTER_SIZE, not ReadOnly, SELECTION_COLOR);
end;

procedure PLineView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  AssignShapeStyleToCanvas(Canvas);
  Canvas.MoveTo(FPoints.Points[0].X, FPoints.Points[0].Y);
  Canvas.LineTo(FPoints.Points[1].X, FPoints.Points[1].Y);
end;

procedure PLineView.MovePosition(Canvas: PCanvas; DX, DY: Integer);
var
  I: Integer;
  Point: Types.TPoint;
begin
  if (DX <> 0) or (DY <> 0) then begin
    for I := 0 to FPoints.Count - 1 do begin
      Point.X := FPoints.Points[I].X + DX;
      Point.Y := FPoints.Points[I].Y + DY;
      FPoints.Points[I] := Point;
    end;
  end;
end;

procedure PLineView.ArrangeObject(Canvas: PCanvas);
var
  X1, Y1, X2, Y2: Integer;
begin
  X1 := FPoints.Points[0].X;
  Y1 := FPoints.Points[0].Y;
  X2 := FPoints.Points[1].X;
  Y2 := FPoints.Points[1].Y;
  //GraphicClasses.NormalizeRect(X1, Y1, X2, Y2);
  Left := X1;
  Top := Y1;
  Right := X2;
  Bottom := Y2;
end;

function PLineView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'Points' then begin
    Result := PointsToString(FPoints);
  end
  else if Name = 'BeginArrowheadStyle' then begin
    Result := ArrowheadStyleKindToString(BeginArrowheadStyle);
  end
  else if Name = 'EndArrowheadStyle' then begin
    Result := ArrowheadStyleKindToString(EndArrowheadStyle);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PLineView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'Points' then begin
    StringToPoints(Value, FPoints);
  end
  else if Name = 'BeginArrowheadStyle' then begin
    BeginArrowheadStyle := StringToArrowheadStyleKind(Value);
  end
  else if Name = 'EndArrowheadStyle' then begin
    EndArrowheadStyle := StringToArrowheadStyleKind(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

// PLineView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PImageView

constructor PImageView.Create;
begin
  inherited;
  Picture := nil;
  FType := ikNone;
  FMaintainAspectRatio := True;
end;

destructor PImageView.Destroy;
begin
  if Picture <> nil then
    Picture.Free;
  inherited;
end;

procedure PImageView.SetType(Value: PImageKind);
begin
  if Value <> FType then begin
    FType := Value;
  end;
end;

function PImageView.GetImageData: string;
begin
  if FImageData = '' then
    Result := FImageData
  else
    Result := B64Encode(FImageData);
end;

procedure PImageView.SetImageData(Value: string);
var
  S: string;
begin
  if Value = '' then
    S := Value
  else
    S := B64Decode(Value);
  if S <> FImageData then begin
    FImageData := S;
  end;
end;

procedure PImageView.SetMaintainAspectRatio(Value: Boolean);
begin
  if Value <> FMaintainAspectRatio then begin
    FMaintainAspectRatio := Value;
  end;
end;

procedure PImageView.DrawObject(Canvas: PCanvas);
var
  X, Y: Integer;
begin
  AssignStyleToCanvas(Canvas);
  AssignFontToCanvas(Canvas);
  if Picture = nil then begin
    Canvas.Pen.Color := clGray;
    Canvas.Pen.Style := psDot;
    Canvas.Brush.Color := $00F0F0F0;
    Canvas.Rectangle(Left, Top, Right, Bottom);
    Canvas.Font.Color := clGray;
    Canvas.Font.Style := [fsBold];
    X := Left + ((Width - Canvas.TextWidth(TEXT_NOIMAGE)) div 2);
    Y := Top + ((Height - Canvas.TextHeight(TEXT_NOIMAGE)) div 2);
    Canvas.TextOut(X, Y, TEXT_NOIMAGE);
  end
  else
    Canvas.StretchDraw(Rect(Left, Top, Right, Bottom), Picture);
end;

procedure PImageView.ArrangeObject(Canvas: PCanvas);
var
  RR: Integer;
begin
  if Picture = nil then begin
    MinWidth := Max(Canvas.TextWidth(TEXT_NOIMAGE) + 10, IMAGE_EMPTY_MINWIDTH);
    MinHeight := Max(Canvas.TextHeight(TEXT_NOIMAGE) + 10, IMAGE_EMPTY_MINHEIGHT);
  end
  else begin
    MinWidth := IMAGE_MINWIDTH;
    MinHeight := IMAGE_MINHEIGHT;
    if AutoResize then begin
      Width := Picture.Width;
      Height := Picture.Height;
    end;
  end;
  if (Picture <> nil) and FMaintainAspectRatio and not AutoResize then begin
    RR := Picture.Width * 100 div Picture.Height;
    Height := Width * 100 div RR;
  end;
end;

procedure PImageView.Update;
var
  Stream: TStringStream;
begin
  if Picture <> nil then begin
    Picture.Free;
    Picture := nil;
  end;
  if ImageData <> '' then begin
    if FType = ikBitmap then begin
      Picture := TBitmap.Create;
      Stream := TStringStream.Create(FImageData);
      try
        Stream.Position := 0;
        (Picture as TBitmap).LoadFromStream(Stream);
      finally
        Stream.Free;
      end;
    end
    else if FType = ikMetafile then begin
      Picture := TMetafile.Create;
      Stream := TStringStream.Create(FImageData);
      try
        Stream.Position := 0;
        (Picture as TMetafile).LoadFromStream(Stream);
      finally
        Stream.Free;
      end;
    end;
  end;
end;

function PImageView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'Type_' then begin
    Result := ImageKindToString(Type_);
  end
  else if Name = 'ImageData' then begin
    Result := ImageData;
  end
  else if Name = 'MaintainAspectRatio' then begin
    Result := BooleanToString(MaintainAspectRatio);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PImageView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'Type_' then begin
    Type_ := StringToImageKind(Value);
  end
  else if Name = 'ImageData' then begin
    ImageData := Value;
  end
  else if Name = 'MaintainAspectRatio' then begin
    MaintainAspectRatio := StringToBoolean(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

// PImageView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDiagramView

procedure PUMLDiagramView.ReorderByViewKind(PrecedentViewKinds: array of PElementClass);
var
  Views: TList;
  VClass: PElementClass;
  V: PView;
  I, J: Integer;
begin
  Views := TList.Create;
  try
    for I := 0 to OwnedViewCount - 1 do
      Views.Add(OwnedView[I]);
    for I := Length(PrecedentViewKinds) - 1 downto 0 do begin
      VClass := PrecedentViewKinds[I];
      for J := Views.Count - 1 downto 0 do begin
        V := Views[J];
        if V is VClass then begin
          RemoveOwnedView(V);
          InsertOwnedView(0, V);
        end;
      end;
    end;
  finally
    Views.Free;
  end;
end;

function PUMLDiagramView.CanOwnViewKind(Kind: string): Boolean;
begin
  if (Kind = 'UMLTextView') or
     (Kind = 'UMLNoteView') or
     (Kind = 'UMLNoteLinkView') or
     (Kind = 'ShapeView') then
    Result := True
  else
    Result := inherited CanOwnViewKind(Kind);
end;

function PUMLDiagramView.CanCopyViews: Boolean;
var
  I, C: Integer;
begin
  C := 0;
  for I := 0 to SelectedViewCount - 1 do
    if (SelectedViews[I] is PNodeView) and not(SelectedViews[I] is PParasiticView) and SelectedViews[I].ContainerChangeable
    then Inc(C);
  Result := (C > 0);
end;

function PUMLDiagramView.CanAcceptModel(Model: PModel): Boolean;
begin
  Result := False;
end;

// PUMLDiagramView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLClassDiagramView

function PUMLClassDiagramView.CanOwnViewKind(Kind: string): Boolean;
begin
  if (Kind = 'UMLModelView') or
     (Kind = 'UMLSubsystemView') or
     (Kind = 'UMLPackageView') or
     (Kind = 'UMLClassView') or
     (Kind = 'UMLInterfaceView') or
     (Kind = 'UMLEnumerationView') or
     (Kind = 'UMLSignalView') or
     (Kind = 'UMLExceptionView') or
     (Kind = 'UMLActorView') or
     (Kind = 'UMLUseCaseView') or
     (Kind = 'UMLComponentView') or
     (Kind = 'UMLNodeView') or
     (Kind = 'UMLComponentInstanceView') or
     (Kind = 'UMLNodeInstanceView') or
     (Kind = 'UMLColObjectView') or
     (Kind = 'UMLCollaborationView') or
     (Kind = 'UMLCollaborationInstanceSetView') or
     (Kind = 'UMLAssociationView') or
     (Kind = 'UMLGeneralizationView') or
     (Kind = 'UMLDependencyView') or
     (Kind = 'UMLRealizationView') or
     (Kind = 'UMLAssociationClassView') or
     (Kind = 'UMLIncludeView') or
     (Kind = 'UMLExtendView') or
     (Kind = 'UMLLinkView') then
    Result := True
  else
    Result := inherited CanOwnViewKind(Kind);
end;

function PUMLClassDiagramView.CanAcceptModel(Model: PModel): Boolean;
begin
  if (Model is PUMLProject) then
    Result := False
  else if (Model is PUMLModel) or
    (Model is PUMLSubsystem) or
    (Model is PUMLPackage) or
    (Model is PUMLClass) or
    (Model is PUMLInterface) or
    (Model is PUMLEnumeration) or
    (Model is PUMLSignal) or
    (Model is PUMLException) or
    (Model is PUMLUseCase) or
    (Model is PUMLActor) or
    (Model is PUMLComponent) or
    (Model is PUMLNode) or
    (Model is PUMLComponentInstance) or
    (Model is PUMLNodeInstance) or
    (Model is PUMLObject) or
    (Model is PUMLCollaboration) or
    (Model is PUMLCollaborationInstanceSet) or
    (Model is PUMLArtifact) or
    (Model is PUMLAttribute) or
    (Model is PUMLPort) or

    (Model is PUMLDependency) or
    (Model is PUMLGeneralization) or
    (Model is PUMLAssociation) or
    (Model is PUMLAssociationClass) or
    (Model is PUMLLink) or
    (Model is PUMLInclude) or
    (Model is PUMLExtend) or
    (Model is PUMLRealization) or
    (Model is PUMLConnector) then

    Result := True
  else
    Result := inherited CanAcceptModel(Model);
end;

function PUMLClassDiagramView.CanPasteViews(Kind, CopyContext: string): Boolean;
begin
  if (Kind = 'UMLClassDiagramView') or
     (Kind = 'UMLUseCaseDiagramView') or
     (Kind = 'UMLComponentDiagramView') or
     (Kind = 'UMLDeploymentDiagramView') or
     (Kind = 'UMLCompositeStructureDiagramView') then
    Result := True
  else
    Result := False;
end;

// PUMLClassDiagramView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLUseCaseDiagramView

procedure PUMLUseCaseDiagramView.ArrangeObject(Canvas: PCanvas);
begin
  ReorderByViewKind([PUMLSystemBoundaryView]);
end;

function PUMLUseCaseDiagramView.CanOwnViewKind(Kind: string): Boolean;
begin
  if (Kind = 'UMLModelView') or
     (Kind = 'UMLSubsystemView') or
     (Kind = 'UMLPackageView') or
     (Kind = 'UMLClassView') or
     (Kind = 'UMLInterfaceView') or
     (Kind = 'UMLEnumerationView') or
     (Kind = 'UMLSignalView') or
     (Kind = 'UMLExceptionView') or
     (Kind = 'UMLActorView') or
     (Kind = 'UMLUseCaseView') or
     (Kind = 'UMLComponentView') or
     (Kind = 'UMLNodeView') or
     (Kind = 'UMLComponentInstanceView') or
     (Kind = 'UMLNodeInstanceView') or
     (Kind = 'UMLColObjectView') or
     (Kind = 'UMLCollaborationView') or
     (Kind = 'UMLCollaborationInstanceSetView') or
     (Kind = 'UMLAssociationView') or
     (Kind = 'UMLGeneralizationView') or
     (Kind = 'UMLDependencyView') or
     (Kind = 'UMLRealizationView') or
     (Kind = 'UMLAssociationClassView') or
     (Kind = 'UMLIncludeView') or
     (Kind = 'UMLExtendView') or
     (Kind = 'UMLLinkView') then
    Result := True
  else
    Result := inherited CanOwnViewKind(Kind);
end;

function PUMLUseCaseDiagramView.CanAcceptModel(Model: PModel): Boolean;
begin
  if (Model is PUMLProject) then
    Result := False
  else if (Model is PUMLModel) or
    (Model is PUMLSubsystem) or
    (Model is PUMLPackage) or
    (Model is PUMLClass) or
    (Model is PUMLInterface) or
    (Model is PUMLEnumeration) or
    (Model is PUMLSignal) or
    (Model is PUMLException) or
    (Model is PUMLUseCase) or
    (Model is PUMLActor) or
    (Model is PUMLComponent) or
    (Model is PUMLNode) or
    (Model is PUMLComponentInstance) or
    (Model is PUMLNodeInstance) or
    (Model is PUMLObject) or
    (Model is PUMLCollaboration) or
    (Model is PUMLCollaborationInstanceSet) or
    (Model is PUMLArtifact) or
    (Model is PUMLAttribute) or
    (Model is PUMLPort) or

    (Model is PUMLDependency) or
    (Model is PUMLGeneralization) or
    (Model is PUMLAssociation) or
    (Model is PUMLAssociationClass) or
    (Model is PUMLLink) or
    (Model is PUMLInclude) or
    (Model is PUMLExtend) or
    (Model is PUMLRealization) or
    (Model is PUMLConnector) then

    Result := True
  else
    Result := inherited CanAcceptModel(Model);
end;

function PUMLUseCaseDiagramView.CanPasteViews(Kind, CopyContext: string): Boolean;
begin
  if (Kind = 'UMLClassDiagramView') or
     (Kind = 'UMLUseCaseDiagramView') or
     (Kind = 'UMLComponentDiagramView') or
     (Kind = 'UMLDeploymentDiagramView') or
     (Kind = 'UMLCompositeStructureDiagramView') then
    Result := True
  else
    Result := False;
end;

// PUMLUseCaseDiagramView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSequenceDiagramView

procedure PUMLSequenceDiagramView.ArrangeObject(Canvas: PCanvas);
var
  L: TList;
  I: Integer;
begin
  // Regulate sequence number of stimulus view
  L := TList.Create;
  for I := 0 to OwnedViewCount - 1 do
    if OwnedView[I] is PUMLCustomSeqMessageView then
      L.Add(OwnedView[I]);
  for I := 0 to L.Count - 1 do
    PUMLCustomSeqMessageView(L.Items[I]).RegulateSequenceNumber;
  L.Free;

  ReorderByViewKind([PUMLFrameView, PUMLCombinedFragmentView, PUMLSeqObjectView]);

  // Following code may be needless.
  for I := 0 to OwnedViewCount - 1 do
    OwnedView[I].Arrange(Canvas);
end;

function PUMLSequenceDiagramView.CanOwnViewKind(Kind: string): Boolean;
begin
  if (Kind = 'UMLSeqObjectView') or
     (Kind = 'UMLSeqStimulusView') then
    Result := True
  else
    Result := inherited CanOwnViewKind(Kind);
end;

function PUMLSequenceDiagramView.CanAcceptModel(Model: PModel): Boolean;
var
  VN, VN2: PModel;
begin
  if (Model is PUMLClass) or
     (Model is PUMLInterface) or
     (Model is PUMLComponent) or
     (Model is PUMLNode) or
     (Model is PUMLActor) then begin
    Result := True;
  end else if (Model is PUMLObject) then begin
    VN := Model.VirtualNamespace;
    VN2 := Self.Diagram.VirtualNamespace;
    if VN2 <> nil then VN2 := VN2.VirtualNamespace;
    if VN = VN2 then Result := True
    else Result := False;
  end else begin
    Result := inherited CanAcceptModel(Model);
  end;
end;

function PUMLSequenceDiagramView.CanPasteViews(Kind, CopyContext: string): Boolean;
begin
  Result := False;
end;

// PUMLSequenceDiagramView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSequenceRoleDiagramView

procedure PUMLSequenceRoleDiagramView.ArrangeObject(Canvas: PCanvas);
var
  L: TList;
  I: Integer;
begin
  // Regulate sequence number of stimulus view
  L := TList.Create;
  for I := 0 to OwnedViewCount - 1 do
    if OwnedView[I] is PUMLCustomSeqMessageView then
      L.Add(OwnedView[I]);
  for I := 0 to L.Count - 1 do
    PUMLCustomSeqMessageView(L.Items[I]).RegulateSequenceNumber;
  L.Free;

  ReorderByViewKind([PUMLFrameView, PUMLCombinedFragmentView, PUMLSeqClassifierRoleView]);

  // Following code may be needless.
  for I := 0 to OwnedViewCount - 1 do
    OwnedView[I].Arrange(Canvas);
end;

function PUMLSequenceRoleDiagramView.CanOwnViewKind(Kind: string): Boolean;
begin
  if (Kind = 'UMLSeqClassifierRoleView') or
     (Kind = 'UMLSeqMessageView') then
    Result := True
  else
    Result := inherited CanOwnViewKind(Kind);
end;

function PUMLSequenceRoleDiagramView.CanAcceptModel(Model: PModel): Boolean;
var
  VN, VN2: PModel;
begin
  if (Model is PUMLClass) or
     (Model is PUMLInterface) or
     (Model is PUMLComponent) or
     (Model is PUMLNode) or
     (Model is PUMLActor) then begin
    Result := True;
  end else if (Model is PUMLClassifierRole) then begin
    VN := Model.VirtualNamespace;
    VN2 := Self.Diagram.VirtualNamespace;
    if VN2 <> nil then VN2 := VN2.VirtualNamespace;
    if VN = VN2 then Result := True
    else Result := False;
  end else begin
    Result := inherited CanAcceptModel(Model);
  end;
end;

function PUMLSequenceRoleDiagramView.CanPasteViews(Kind, CopyContext: string): Boolean;
begin
  Result := False;
end;

// PUMLSequenceRoleDiagramView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCollaborationDiagramView

procedure PUMLCollaborationDiagramView.ArrangeObject(Canvas: PCanvas);
begin
  ReorderByViewKind([PUMLFrameView]);
end;

function PUMLCollaborationDiagramView.CanOwnViewKind(Kind: string): Boolean;
begin
  if (Kind = 'UMLColObjectView') or
     (Kind = 'UMLColStimulusView') then
    Result := True
  else
    Result := inherited CanOwnViewKind(Kind);
end;

function PUMLCollaborationDiagramView.CanAcceptModel(Model: PModel): Boolean;
var
  VN, VN2: PModel;
begin
  if (Model is PUMLClass) or
     (Model is PUMLInterface) or
     (Model is PUMLComponent) or
     (Model is PUMLNode) or
     (Model is PUMLActor) or

     (Model is PUMLLink) then begin

    Result := True;
  end else if (Model is PUMLObject) then begin
    VN := Model.VirtualNamespace;
    VN2 := Self.Diagram.VirtualNamespace;
    if VN2 <> nil then VN2 := VN2.VirtualNamespace;
    if VN = VN2 then Result := True
    else Result := False;
  end else begin
    Result := inherited CanAcceptModel(Model);
  end;
end;

function PUMLCollaborationDiagramView.CanPasteViews(Kind, CopyContext: string): Boolean;
begin
  Result := False;
end;

// PUMLCollaborationDiagramView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCollaborationRoleDiagramView

procedure PUMLCollaborationRoleDiagramView.ArrangeObject(Canvas: PCanvas);
begin
  ReorderByViewKind([PUMLFrameView]);
end;

function PUMLCollaborationRoleDiagramView.CanOwnViewKind(Kind: string): Boolean;
begin
  if (Kind = 'UMLColClassifierRoleView') or
     (Kind = 'UMLColMessageView') then
    Result := True
  else
    Result := inherited CanOwnViewKind(Kind);
end;

function PUMLCollaborationRoleDiagramView.CanAcceptModel(Model: PModel): Boolean;
var
  VN, VN2: PModel;
begin
  if (Model is PUMLClass) or
     (Model is PUMLInterface) or
     (Model is PUMLComponent) or
     (Model is PUMLNode) or
     (Model is PUMLActor) or

     (Model is PUMLAssociationRole) then begin

    Result := True;
  end else if (Model is PUMLClassifierRole) then begin
    VN := Model.VirtualNamespace;
    VN2 := Self.Diagram.VirtualNamespace;
    if VN2 <> nil then VN2 := VN2.VirtualNamespace;
    if VN = VN2 then Result := True
    else Result := False;
  end else begin
    Result := inherited CanAcceptModel(Model);
  end;
end;

function PUMLCollaborationRoleDiagramView.CanPasteViews(Kind, CopyContext: string): Boolean;
begin
  Result := False;
end;

// PUMLCollaborationRoleDiagramView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLStatechartDiagramView

procedure PUMLStatechartDiagramView.ArrangeObject(Canvas: PCanvas);
begin
  ReorderByViewKind([PUMLFrameView]);
end;

function PUMLStatechartDiagramView.CanOwnViewKind(Kind: string): Boolean;
begin
  if (Kind = 'UMLStateView') or
     (Kind = 'UMLSubmachineStateView') or
     (Kind = 'UMLPseudostateView') or
     (Kind = 'UMLFinalStateView') or

     (Kind = 'UMLTransitionView') then

    Result := True
  else
    Result := inherited CanOwnViewKind(Kind);
end;

function PUMLStatechartDiagramView.CanAcceptModel(Model: PModel): Boolean;
begin
  if (Model is PUMLCompositeState) or
    (Model is PUMLSubmachineState) or
    (Model is PUMLPseudostate) or
    (Model is PUMLFinalState) or
    (Model is PUMLStateMachine) or
    (Model is PUMLFlowFinalState) or

    (Model is PUMLTransition) then

    Result := True
  else
    Result := inherited CanAcceptModel(Model);
end;

function PUMLStatechartDiagramView.CanPasteViews(Kind, CopyContext: string): Boolean;
var
  K, G: string;
begin
  K := MetaClass.Name;
  G := Diagram.DiagramOwner.GUID;
  if (Kind = K) and (CopyContext = G) then
    Result := True
  else
    Result := False;
end;

// PUMLStatechartDiagramView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActivityDiagramView

{
procedure PUMLActivityDiagramView.ArrangeObject(Canvas: PCanvas);

  function GetSwimlaneExcludedBouningBox: TRect;
  var
    V: PView;
    R: TRect;
    I: Integer;
  begin
    R := Rect(10000, 10000, -10000, -10000);
    for I := 0 to OwnedViewCount - 1 do begin
      V := OwnedViews[I];
      if V.Visible and not (V is PUMLSwimlaneView) then
        UnionRect(R, R, V.GetBoundingBox(Canvas));
    end;
    Result := R;
  end;

var
  V: PUMLSwimlaneView;
  R: TRect;
  I: Integer;
begin
  for I := 0 to OwnedViewCount - 1 do begin
    OwnedViews[I].Arrange(Canvas);
  end;
  // Retry looping to arrange PUMLSwimlaneView additionally.
  R := GetSwimlaneExcludedBouningBox;
  for I := 0 to OwnedViewCount - 1 do
    if OwnedViews[I] is PUMLSwimlaneView then begin
      V := OwnedViews[I] as PUMLSwimlaneView;
      V.Top := SWIMLANE_TOP;
      V.Bottom := R.Bottom + SWIMLANE_BOTTOM_MARGIN;
    end;
end;
}

procedure PUMLActivityDiagramView.ArrangeObject(Canvas: PCanvas);
begin
  ReorderByViewKind([PUMLFrameView, PUMLSwimlaneView]);
end;

function PUMLActivityDiagramView.CanOwnViewKind(Kind: string): Boolean;
begin
  if (Kind = 'UMLActionStateView') or
     (Kind = 'UMLSubactivityStateView') or
     (Kind = 'UMLPseudostateView') or
     (Kind = 'UMLFinalStateView') or
     (Kind = 'UMLSwimlaneView') or
     (Kind = 'UMLTransitionView') then
    Result := True
  else
    Result := inherited CanOwnViewKind(Kind);
end;

function PUMLActivityDiagramView.CanAcceptModel(Model: PModel): Boolean;
begin
  if (Model is PUMLActionState) or
     (Model is PUMLSubactivityState) or
     (Model is PUMLPseudostate) or
     (Model is PUMLFinalState) or
     (Model is PUMLPartition) or
     (Model is PUMLActivityGraph) or
     (Model is PUMLObjectFlowState) or
     (Model is PUMLFlowFinalState) or
     (Model is PUMLSignalAcceptState) or
     (Model is PUMLSignalSendState) or

     (Model is PUMLTransition) then

    Result := True
  else
    Result := inherited CanAcceptModel(Model);
end;

function PUMLActivityDiagramView.CanPasteViews(Kind, CopyContext: string): Boolean;
var
  K, G: string;
begin
  K := MetaClass.Name;
  G := Diagram.DiagramOwner.GUID;
  if (Kind = K) and (CopyContext = G) then
    Result := True
  else
    Result := False;
end;

// PUMLActivityDiagramView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLComponentDiagramView

function PUMLComponentDiagramView.CanOwnViewKind(Kind: string): Boolean;
begin
  if (Kind = 'UMLModelView') or
     (Kind = 'UMLSubsystemView') or
     (Kind = 'UMLPackageView') or
     (Kind = 'UMLClassView') or
     (Kind = 'UMLInterfaceView') or
     (Kind = 'UMLEnumerationView') or
     (Kind = 'UMLSignalView') or
     (Kind = 'UMLExceptionView') or
     (Kind = 'UMLActorView') or
     (Kind = 'UMLUseCaseView') or
     (Kind = 'UMLComponentView') or
     (Kind = 'UMLNodeView') or
     (Kind = 'UMLComponentInstanceView') or
     (Kind = 'UMLNodeInstanceView') or
     (Kind = 'UMLColObjectView') or
     (Kind = 'UMLCollaborationView') or
     (Kind = 'UMLCollaborationInstanceSetView') or
     (Kind = 'UMLAssociationView') or
     (Kind = 'UMLGeneralizationView') or
     (Kind = 'UMLDependencyView') or
     (Kind = 'UMLRealizationView') or
     (Kind = 'UMLAssociationClassView') or
     (Kind = 'UMLIncludeView') or
     (Kind = 'UMLExtendView') or
     (Kind = 'UMLLinkView') then
    Result := True
  else
    Result := inherited CanOwnViewKind(Kind);
end;

function PUMLComponentDiagramView.CanAcceptModel(Model: PModel): Boolean;
begin
  if (Model is PUMLProject) then
    Result := False
  else if (Model is PUMLModel) or
    (Model is PUMLSubsystem) or
    (Model is PUMLPackage) or
    (Model is PUMLClass) or
    (Model is PUMLInterface) or
    (Model is PUMLEnumeration) or
    (Model is PUMLSignal) or
    (Model is PUMLException) or
    (Model is PUMLUseCase) or
    (Model is PUMLActor) or
    (Model is PUMLComponent) or
    (Model is PUMLNode) or
    (Model is PUMLComponentInstance) or
    (Model is PUMLNodeInstance) or
    (Model is PUMLObject) or
    (Model is PUMLCollaboration) or
    (Model is PUMLCollaborationInstanceSet) or
    (Model is PUMLArtifact) or
    (Model is PUMLAttribute) or
    (Model is PUMLPort) or

    (Model is PUMLDependency) or
    (Model is PUMLGeneralization) or
    (Model is PUMLAssociation) or
    (Model is PUMLAssociationClass) or
    (Model is PUMLLink) or
    (Model is PUMLInclude) or
    (Model is PUMLExtend) or
    (Model is PUMLRealization) or
    (Model is PUMLConnector) then

    Result := True
  else
    Result := inherited CanAcceptModel(Model);
end;

function PUMLComponentDiagramView.CanPasteViews(Kind, CopyContext: string): Boolean;
begin
  if (Kind = 'UMLClassDiagramView') or
     (Kind = 'UMLUseCaseDiagramView') or
     (Kind = 'UMLComponentDiagramView') or
     (Kind = 'UMLDeploymentDiagramView') or
     (Kind = 'UMLCompositeStructureDiagramView') then
    Result := True
  else
    Result := False;
end;

// PUMLComponentDiagramView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDeploymentDiagramView

function PUMLDeploymentDiagramView.CanOwnViewKind(Kind: string): Boolean;
begin
  if (Kind = 'UMLModelView') or
     (Kind = 'UMLSubsystemView') or
     (Kind = 'UMLPackageView') or
     (Kind = 'UMLClassView') or
     (Kind = 'UMLInterfaceView') or
     (Kind = 'UMLEnumerationView') or
     (Kind = 'UMLSignalView') or
     (Kind = 'UMLExceptionView') or
     (Kind = 'UMLActorView') or
     (Kind = 'UMLUseCaseView') or
     (Kind = 'UMLComponentView') or
     (Kind = 'UMLNodeView') or
     (Kind = 'UMLComponentInstanceView') or
     (Kind = 'UMLNodeInstanceView') or
     (Kind = 'UMLColObjectView') or
     (Kind = 'UMLCollaborationView') or
     (Kind = 'UMLCollaborationInstanceSetView') or
     (Kind = 'UMLAssociationView') or
     (Kind = 'UMLGeneralizationView') or
     (Kind = 'UMLDependencyView') or
     (Kind = 'UMLRealizationView') or
     (Kind = 'UMLAssociationClassView') or
     (Kind = 'UMLIncludeView') or
     (Kind = 'UMLExtendView') or
     (Kind = 'UMLLinkView') then
    Result := True
  else
    Result := inherited CanOwnViewKind(Kind);
end;

function PUMLDeploymentDiagramView.CanAcceptModel(Model: PModel): Boolean;
begin
  if (Model is PUMLProject) then
    Result := False
  else if (Model is PUMLModel) or
    (Model is PUMLSubsystem) or
    (Model is PUMLPackage) or
    (Model is PUMLClass) or
    (Model is PUMLInterface) or
    (Model is PUMLEnumeration) or
    (Model is PUMLSignal) or
    (Model is PUMLException) or
    (Model is PUMLUseCase) or
    (Model is PUMLActor) or
    (Model is PUMLComponent) or
    (Model is PUMLNode) or
    (Model is PUMLComponentInstance) or
    (Model is PUMLNodeInstance) or
    (Model is PUMLObject) or
    (Model is PUMLCollaboration) or
    (Model is PUMLCollaborationInstanceSet) or
    (Model is PUMLArtifact) or
    (Model is PUMLAttribute) or
    (Model is PUMLPort) or

    (Model is PUMLDependency) or
    (Model is PUMLGeneralization) or
    (Model is PUMLAssociation) or
    (Model is PUMLAssociationClass) or
    (Model is PUMLLink) or
    (Model is PUMLInclude) or
    (Model is PUMLExtend) or
    (Model is PUMLRealization) or
    (Model is PUMLConnector) then

    Result := True
  else
    Result := inherited CanAcceptModel(Model);
end;

function PUMLDeploymentDiagramView.CanPasteViews(Kind, CopyContext: string): Boolean;
begin
  if (Kind = 'UMLClassDiagramView') or
     (Kind = 'UMLUseCaseDiagramView') or
     (Kind = 'UMLComponentDiagramView') or
     (Kind = 'UMLDeploymentDiagramView') or
     (Kind = 'UMLCompositeStructureDiagramView') then
    Result := True
  else
    Result := False;
end;

// PUMLDeploymentDiagramView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCompositeStructureDiagramView

function PUMLCompositeStructureDiagramView.CanOwnViewKind(Kind: string): Boolean;
begin
  if (Kind = 'UMLModelView') or
     (Kind = 'UMLSubsystemView') or
     (Kind = 'UMLPackageView') or
     (Kind = 'UMLClassView') or
     (Kind = 'UMLInterfaceView') or
     (Kind = 'UMLEnumerationView') or
     (Kind = 'UMLSignalView') or
     (Kind = 'UMLExceptionView') or
     (Kind = 'UMLActorView') or
     (Kind = 'UMLUseCaseView') or
     (Kind = 'UMLComponentView') or
     (Kind = 'UMLNodeView') or
     (Kind = 'UMLComponentInstanceView') or
     (Kind = 'UMLNodeInstanceView') or
     (Kind = 'UMLColObjectView') or
     (Kind = 'UMLCollaborationView') or
     (Kind = 'UMLCollaborationInstanceSetView') or
     (Kind = 'UMLAssociationView') or
     (Kind = 'UMLGeneralizationView') or
     (Kind = 'UMLDependencyView') or
     (Kind = 'UMLRealizationView') or
     (Kind = 'UMLAssociationClassView') or
     (Kind = 'UMLIncludeView') or
     (Kind = 'UMLExtendView') or
     (Kind = 'UMLLinkView') then
    Result := True
  else
    Result := inherited CanOwnViewKind(Kind);
end;

function PUMLCompositeStructureDiagramView.CanAcceptModel(Model: PModel): Boolean;
begin
  if (Model is PUMLProject) then
    Result := False
  else if (Model is PUMLModel) or
    (Model is PUMLSubsystem) or
    (Model is PUMLPackage) or
    (Model is PUMLClass) or
    (Model is PUMLInterface) or
    (Model is PUMLEnumeration) or
    (Model is PUMLSignal) or
    (Model is PUMLException) or
    (Model is PUMLUseCase) or
    (Model is PUMLActor) or
    (Model is PUMLComponent) or
    (Model is PUMLNode) or
    (Model is PUMLComponentInstance) or
    (Model is PUMLNodeInstance) or
    (Model is PUMLObject) or
    (Model is PUMLCollaboration) or
    (Model is PUMLCollaborationInstanceSet) or
    (Model is PUMLArtifact) or
    (Model is PUMLAttribute) or
    (Model is PUMLPort) or

    (Model is PUMLDependency) or
    (Model is PUMLGeneralization) or
    (Model is PUMLAssociation) or
    (Model is PUMLAssociationClass) or
    (Model is PUMLLink) or
    (Model is PUMLInclude) or
    (Model is PUMLExtend) or
    (Model is PUMLRealization) or
    (Model is PUMLConnector) then

    Result := True
  else
    Result := inherited CanAcceptModel(Model);
end;

function PUMLCompositeStructureDiagramView.CanPasteViews(Kind, CopyContext: string): Boolean;
begin
  if (Kind = 'UMLClassDiagramView') or
     (Kind = 'UMLUseCaseDiagramView') or
     (Kind = 'UMLComponentDiagramView') or
     (Kind = 'UMLDeploymentDiagramView') or
     (Kind = 'UMLCompositeStructureDiagramView') then
    Result := True
  else
    Result := False;
end;

// PUMLDeploymentDiagramView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Enumeration Convertion Routines

function UMLStereotypeDisplayKindToString(Value: PUMLStereotypeDisplayKind): string;
begin
  if Value = sdkNone then
    Result := 'sdkNone'
  else if Value = sdkLabel then
    Result := 'sdkLabel'
  else if Value = sdkIcon then
    Result := 'sdkIcon'
  else if Value = sdkDecoration then
    Result := 'sdkDecoration'
  else
    Result := 'sdkLabel';
end;

function StringToUMLStereotypeDisplayKind(Value: string): PUMLStereotypeDisplayKind;
begin
  if Value = 'sdkNone' then
    Result := sdkNone
  else if Value = 'sdkLabel' then
    Result := sdkLabel
  else if Value = 'sdkIcon' then
    Result := sdkIcon
  else if Value = 'sdkDecoration' then
    Result := sdkDecoration
  else
    Result := sdkLabel;
end;

function UMLSwimlaneDirectionKindToString(Value: PUMLSwimlaneDirectionKind): string;
begin
  if Value = slkVertical then
    Result := 'slkVertical'
  else if Value = slkHorizontal then
    Result := 'slkHorizontal'
  else
    Result := 'slkVertical';
end;

function StringToUMLSwimlaneDirectionKind(Value: string): PUMLSwimlaneDirectionKind;
begin
  if Value = 'slkVertical' then
    Result := slkVertical
  else if Value = 'slkHorizontal' then
    Result := slkHorizontal
  else
    Result := slkVertical;
end;

function LineKindToString(Value: PLineKind): string;
begin
  if Value = lkSolid then
    Result := 'lkSolid'
  else if Value = lkDash then
    Result := 'lkDash'
  else if Value = lkDot then
    Result := 'lkDot'
  else if Value = lkDashDot then
    Result := 'lkDashDot'
  else if Value = lkDashDotDot then
    Result := 'lkDashDotDot'
  else if Value = lkInsideFrame then
    Result := 'lkInsideFrame'
  else
    Result := 'lkSolid';
end;

function StringToLineKind(Value: string): PLineKind;
begin
  if Value = 'lkSolid' then
    Result := lkSolid
  else if Value = 'lkDash' then
    Result := lkDash
  else if Value = 'lkDot' then
    Result := lkDot
  else if Value = 'lkDashDot' then
    Result := lkDashDot
  else if Value = 'lkDashDotDot' then
    Result := lkDashDotDot
  else if Value = 'lkInsideFrame' then
    Result := lkInsideFrame
  else
    Result := lkSolid;
end;

function ArrowheadStyleKindToString(Value: PArrowheadStyleKind): string;
begin
  if Value = askNone then
    Result := 'askNone'
  else if Value = askTriangle then
    Result := 'askTriangle'
  else if Value = askOpen then
    Result := 'askOpen'
  else if Value = askStealth then
    Result := 'askStealth'
  else if Value = askDiamond then
    Result := 'askDiamond'
  else if Value = askOval then
    Result := 'askOval'
  else
    Result := 'askNone';
end;

function StringToArrowheadStyleKind(Value: string): PArrowheadStyleKind;
begin
  if Value = 'askNone' then
    Result := askNone
  else if Value = 'askTriangle' then
    Result := askTriangle
  else if Value = 'askOpen' then
    Result := askOpen
  else if Value = 'askStealth' then
    Result := askStealth
  else if Value = 'askDiamond' then
    Result := askDiamond
  else if Value = 'askOval' then
    Result := askOval
  else
    Result := askNone;
end;

function ImageKindToString(Value: PImageKind): string;
begin
  if Value = ikNone then
    Result := 'ikNone'
  else if Value = ikBitmap then
    Result := 'ikBitmap'
  else if Value = ikMetafile then
    Result := 'ikMetafile'
  else
    Result := 'ikNone';
end;

function StringToImageKind(Value: string): PImageKind;
begin
  if Value = 'ikNone' then
    Result := ikNone
  else if Value = 'ikBitmap' then
    Result := ikBitmap
  else if Value = 'ikMetafile' then
    Result := ikMetafile
  else
    Result := ikNone;
end;

// Enumeration Convertion Routines
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Label Text Taking Routines

function GetPropertyString(M: PExtensibleModel; PresetProps: TStringList = nil): string;

  function IsUpperCaseLetter(C: Char): Boolean;
  begin
    Result := (C >= 'A') and (C <= 'Z');
  end;

  function GetBooleanTagName(Origin: string): string;
  var
    Prefix: string;
  begin
    Result := Origin;
    if Length(Origin) >= 3 then begin
      Prefix := Copy(Origin, 1, 2);
      if (Prefix = 'is') or (Prefix = 'Is') then
        if IsUpperCaseLetter(Origin[3]) then
          Result := Copy(Origin, 3, Length(Origin) - 2);
    end;
  end;

  function GetCondensedString(Value: string): string;
  var
    SL: TStringList;
  begin
    Result := Value;
    SL := TStringList.Create;
    try
      SL.Text := Value;
      if SL.Count = 1 then begin
        if Length(SL[0]) > 20 then
          Result := Copy(SL[0], 1, 20) + '...'
        else
          Result := SL[0];
      end
      else if SL.Count >= 2 then begin
        if Length(SL[0]) > 20 then
          Result := Copy(SL[0], 1, 20) + '...'
        else
          Result := SL[0] + '...';
      end;
    finally
      SL.Free;
    end;
  end;

var
  TagDef: PTagDefinition;
  Tag: PTaggedValue;
  S, V: string;
  I, J: Integer;
begin
  S := '';
  if PresetProps <> nil then
    for I := 0 to PresetProps.Count - 1 do begin
      if S <> '' then
        S := S + ', ';
      S := S + PresetProps[I];
    end;
  for I := 0 to M.TaggedValueCount - 1 do begin
    Tag := M.TaggedValues[I];
    TagDef := Tag.GetTagDefinition;
    if TagDef <> nil then begin
      if S <> '' then
        S := S + ', ';
      case TagDef.TagType of
        tkInteger, tkReal:
          S := S + Format('%s = %s', [Tag.Name, Tag.DataValue]);
        tkString:
          S := S + Format('%s = %s', [Tag.Name, GetCondensedString(Tag.DataValue)]);
        tkBoolean:
          if Tag.DataValue = 'True' then
            S := S + Format('%s', [GetBooleanTagName(Tag.Name)])
          else
            S := S + Format('%s = %s', [GetBooleanTagName(Tag.Name), Tag.DataValue]);
        tkEnumeration:
          S := S + Format('%s = %s', [Tag.Name, Tag.DataValue]);
        tkReference:
          if (Tag.ReferenceValueCount = 1) and (Tag.ReferenceValues[0] <> nil) then
            S := S + Format('%s = %s', [Tag.Name, Tag.ReferenceValues[0].Name]);
        tkCollection:
          begin
            V := '';
            for J := 0 to Tag.ReferenceValueCount - 1 do
              if Tag.ReferenceValues[J] <> nil then begin
                if V <> '' then
                  V := V + '; ';
                V := V + Tag.ReferenceValues[J].Name;
              end;
            if V <> '' then
              S := S + Format('%s = %s', [Tag.Name, V]);
          end;
      end;
    end;
  end;
  if S <> '' then
    S := '{' + S + '}';
  Result := S;
end;

// Label Text Taking Routines
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Graphic Image Making Routines

function MetafileFromDiagram(ADiagramView: PDiagramView; SelectedViewsOnly, Enhanced: Boolean): TMetafile;
var
  AMetafile: TMetafile;
  ARect: TRect;
  AMetafileCanvas: TMetafileCanvas;
  ACanvas: PCanvas;
  AView: PView;
  I: Integer;
begin
  Result := nil;
  if not Assigned(ADiagramView) or (ADiagramView.OwnedViewCount <= 0) then Exit;
  if SelectedViewsOnly and (ADiagramView.SelectedViewCount <= 0) then Exit;

  AMetafile := TMetafile.Create;
  AMetafile.Enhanced := Enhanced;
  try
    if SelectedViewsOnly then
      ARect := ADiagramView.GetSelectedBoundingBox(ADiagramView.Canvas)
    else ARect := ADiagramView.GetBoundingBox(ADiagramView.Canvas);

    with ARect do begin
      GraphicClasses.NormalizeRect(Left, Top, Right, Bottom);
      ARect := Rect(Left - 20, ARect.Top - 20, ARect.Right + 20, ARect.Bottom + 20);
      AMetafile.Width := Right - Left;
      AMetafile.Height := Bottom - Top;
    end;
    
    AMetafileCanvas := TMetafileCanvas.Create(AMetafile, AMetafile.Handle);
    ACanvas := PCanvas.Create(AMetafileCanvas);
    try
      ACanvas.ZoomFactor := ZoomFactor(100, 100);
      ACanvas.Font.Height := -13;
      ACanvas.Font.Name := 'Verdana';
      ACanvas.OriginX := - ARect.Left;
      ACanvas.OriginY := - ARect.Top;
      if SelectedViewsOnly then begin
        for I := 0 to ADiagramView.SelectedViewCount - 1 do begin
          AView := ADiagramView.SelectedViews[I] as PView;
          if AView is PParasiticView then Continue;
          AView.Draw(ACanvas);
        end;
      end else ADiagramView.Draw(ACanvas);
      Result := AMetafile;
    finally
      ACanvas.Free;
      AMetafileCanvas.Free;
    end;

  except on Exception do
    AMetafile.Free;
  end;
end;

function BitmapFromDiagram(ADiagramView: PDiagramView; SelectedViewsOnly: Boolean = False): Graphics.TBitmap;
var
  ABitmap: Graphics.TBitmap;
  ARect: TRect;
  ACanvas: PCanvas;
begin
  Result := nil;
  if not Assigned(ADiagramView) or (ADiagramView.OwnedViewCount <= 0) then Exit;

  ABitmap := Graphics.TBitmap.Create;
  try
    if SelectedViewsOnly then
      ARect := ADiagramView.GetSelectedBoundingBox(ADiagramView.Canvas)
    else ARect := ADiagramView.GetBoundingBox(ADiagramView.Canvas);

    with ARect do begin
      GraphicClasses.NormalizeRect(Left, Top, Right, Bottom);
      ARect := Rect(Left - 20, ARect.Top - 20, ARect.Right + 20, ARect.Bottom + 20);
      ABitmap.Width := Right - Left;
      ABitmap.Height := Bottom - Top;
    end;

    ACanvas := PCanvas.Create(ABitmap.Canvas);
    try
      ACanvas.ZoomFactor := ZoomFactor(100, 100);
      ACanvas.Font.Height := -13;
      ACanvas.Font.Name := 'Verdana';
      ACanvas.OriginX := - ARect.Left;
      ACanvas.OriginY := - ARect.Top;
      ADiagramView.Draw(ACanvas);
      Result := ABitmap;
    finally
      ACanvas.Free;
    end;
  except on Exception do
    ABitmap.Free;
  end;
end;

// Graphic Image Making Routines
////////////////////////////////////////////////////////////////////////////////

procedure RegisterClasses;
begin
  ClassRegistry.RegisterClass(PUMLGeneralNodeView);
  ClassRegistry.RegisterClass(PUMLCustomStateView);
  ClassRegistry.RegisterClass(PUMLStateView);
  ClassRegistry.RegisterClass(PUMLSubmachineStateView);
  ClassRegistry.RegisterClass(PUMLCollaborationView);
  ClassRegistry.RegisterClass(PUMLCustomComponentView);
  ClassRegistry.RegisterClass(PUMLComponentInstanceView);
  ClassRegistry.RegisterClass(PUMLComponentView);
  ClassRegistry.RegisterClass(PUMLEnumerationView);
  ClassRegistry.RegisterClass(PUMLCustomNodeView);
  ClassRegistry.RegisterClass(PUMLNodeInstanceView);
  ClassRegistry.RegisterClass(PUMLNodeView);
  ClassRegistry.RegisterClass(PUMLCollaborationInstanceSetView);
  ClassRegistry.RegisterClass(PUMLCustomSeqObjectView);
  ClassRegistry.RegisterClass(PUMLSeqObjectView);
  ClassRegistry.RegisterClass(PUMLSeqClassifierRoleView);
  ClassRegistry.RegisterClass(PUMLCustomColObjectView);
  ClassRegistry.RegisterClass(PUMLColClassifierRoleView);
  ClassRegistry.RegisterClass(PUMLColObjectView);
  ClassRegistry.RegisterClass(PUMLPackageView);
  ClassRegistry.RegisterClass(PUMLModelView);
  ClassRegistry.RegisterClass(PUMLSubsystemView);
  ClassRegistry.RegisterClass(PUMLClassifierView);
  ClassRegistry.RegisterClass(PUMLInterfaceView);
  ClassRegistry.RegisterClass(PUMLClassView);
  ClassRegistry.RegisterClass(PUMLActorView);
  ClassRegistry.RegisterClass(PUMLSignalView);
  ClassRegistry.RegisterClass(PUMLExceptionView);
  ClassRegistry.RegisterClass(PUMLUseCaseView);
  ClassRegistry.RegisterClass(PUMLActionStateView);
  ClassRegistry.RegisterClass(PUMLSubactivityStateView);
  ClassRegistry.RegisterClass(PUMLPseudostateView);
  ClassRegistry.RegisterClass(PUMLFinalStateView);
  ClassRegistry.RegisterClass(PUMLSwimlaneView);
  ClassRegistry.RegisterClass(PUMLNoteView);
  ClassRegistry.RegisterClass(PUMLTextView);
  ClassRegistry.RegisterClass(PUMLNoteLinkView);
  ClassRegistry.RegisterClass(PUMLGeneralEdgeView);
  ClassRegistry.RegisterClass(PUMLLinkView);
  ClassRegistry.RegisterClass(PUMLGeneralizationView);
  ClassRegistry.RegisterClass(PUMLIncludeView);
  ClassRegistry.RegisterClass(PUMLDependencyView);
  ClassRegistry.RegisterClass(PUMLTransitionView);
  ClassRegistry.RegisterClass(PUMLRealizationView);
  ClassRegistry.RegisterClass(PUMLExtendView);
  ClassRegistry.RegisterClass(PUMLAssociationView);
  ClassRegistry.RegisterClass(PUMLAssociationRoleView);
  ClassRegistry.RegisterClass(PUMLListCompartmentView);
  ClassRegistry.RegisterClass(PUMLOperationCompartmentView);
  ClassRegistry.RegisterClass(PUMLAttributeCompartmentView);
  ClassRegistry.RegisterClass(PUMLQualifierCompartmentView);
  ClassRegistry.RegisterClass(PUMLInternalTransitionCompartmentView);
  ClassRegistry.RegisterClass(PUMLTemplateParameterCompartmentView);
  ClassRegistry.RegisterClass(PUMLEnumerationLiteralCompartmentView);
  ClassRegistry.RegisterClass(PUMLNameCompartmentView);
  ClassRegistry.RegisterClass(PUMLLifeLineView);
  ClassRegistry.RegisterClass(PUMLActivationView);
  ClassRegistry.RegisterClass(PUMLCustomSeqMessageView);
  ClassRegistry.RegisterClass(PUMLSeqMessageView);
  ClassRegistry.RegisterClass(PUMLSeqStimulusView);
  ClassRegistry.RegisterClass(PUMLCustomColMessageView);
  ClassRegistry.RegisterClass(PUMLColMessageView);
  ClassRegistry.RegisterClass(PUMLColStimulusView);
  ClassRegistry.RegisterClass(PUMLDiagramView);
  ClassRegistry.RegisterClass(PUMLSequenceDiagramView);
  ClassRegistry.RegisterClass(PUMLClassDiagramView);
  ClassRegistry.RegisterClass(PUMLSequenceRoleDiagramView);
  ClassRegistry.RegisterClass(PUMLActivityDiagramView);
  ClassRegistry.RegisterClass(PUMLCollaborationDiagramView);
  ClassRegistry.RegisterClass(PUMLStatechartDiagramView);
  ClassRegistry.RegisterClass(PUMLDeploymentDiagramView);
  ClassRegistry.RegisterClass(PUMLComponentDiagramView);
  ClassRegistry.RegisterClass(PUMLCollaborationRoleDiagramView);
  ClassRegistry.RegisterClass(PUMLUseCaseDiagramView);
  ClassRegistry.RegisterClass(PUMLAssociationClassView);
  ClassRegistry.RegisterClass(PUMLObjectFlowStateView);
  ClassRegistry.RegisterClass(PUMLFlowFinalStateView);
  ClassRegistry.RegisterClass(PUMLSignalAcceptStateView);
  ClassRegistry.RegisterClass(PUMLSignalSendStateView);
  ClassRegistry.RegisterClass(PUMLArtifactView);
  ClassRegistry.RegisterClass(PUMLResidentCompartmentView);
  ClassRegistry.RegisterClass(PUMLDeployedComponentCompartmentView);
  ClassRegistry.RegisterClass(PUMLDeployedArtifactCompartmentView);
  ClassRegistry.RegisterClass(PUMLSlotCompartmentView);
  ClassRegistry.RegisterClass(PUMLCompositeStructureDiagramView);
  ClassRegistry.RegisterClass(PUMLPortView);
  ClassRegistry.RegisterClass(PUMLPartView);
  ClassRegistry.RegisterClass(PUMLConnectorView);
  ClassRegistry.RegisterClass(PUMLCustomFrameView);
  ClassRegistry.RegisterClass(PUMLFrameView);
  ClassRegistry.RegisterClass(PUMLCombinedFragmentView);
  ClassRegistry.RegisterClass(PUMLInteractionOperandView);
  ClassRegistry.RegisterClass(PUMLExtensionPointCompartmentView);
  ClassRegistry.RegisterClass(PShapeView);
  ClassRegistry.RegisterClass(PRectangleView);
  ClassRegistry.RegisterClass(PEllipseView);
  ClassRegistry.RegisterClass(PRoundRectView);
  ClassRegistry.RegisterClass(PLineView);
  ClassRegistry.RegisterClass(PImageView);
end;

procedure RegisterMetaClasses;
var
  E: PMetaEnumeration;
  M: PMetaClass;
begin
  // Enumerations
  E := MetaModel.DefineMetaEnumeration('UMLStereotypeDisplayKind');
  MetaModel.DefineMetaLiteral(E, 'sdkLabel');
  MetaModel.DefineMetaLiteral(E, 'sdkIcon');
  MetaModel.DefineMetaLiteral(E, 'sdkNone');
  MetaModel.DefineMetaLiteral(E, 'sdkDecoration');
  E := MetaModel.DefineMetaEnumeration('UMLSwimlaneDirectionKind');
  MetaModel.DefineMetaLiteral(E, 'slkVertical');
  MetaModel.DefineMetaLiteral(E, 'slkHorizontal');
  E := MetaModel.DefineMetaEnumeration('LineKind');
  MetaModel.DefineMetaLiteral(E, 'lkSolid');
  MetaModel.DefineMetaLiteral(E, 'lkDash');
  MetaModel.DefineMetaLiteral(E, 'lkDot');
  MetaModel.DefineMetaLiteral(E, 'lkDashDot');
  MetaModel.DefineMetaLiteral(E, 'lkDashDotDot');
  MetaModel.DefineMetaLiteral(E, 'lkInsideFrame');
  E := MetaModel.DefineMetaEnumeration('ArrowheadStyleKind');
  MetaModel.DefineMetaLiteral(E, 'askNone');
  MetaModel.DefineMetaLiteral(E, 'askTriangle');
  MetaModel.DefineMetaLiteral(E, 'askOpen');
  MetaModel.DefineMetaLiteral(E, 'askStealth');
  MetaModel.DefineMetaLiteral(E, 'askDiamond');
  MetaModel.DefineMetaLiteral(E, 'askOval');
  E := MetaModel.DefineMetaEnumeration('ImageKind');
  MetaModel.DefineMetaLiteral(E, 'ikNull');
  MetaModel.DefineMetaLiteral(E, 'ikBitmap');
  MetaModel.DefineMetaLiteral(E, 'ikMetafile');

  // Meta Classes
  MetaModel.DefineMetaClass(PUMLNameCompartmentView, 'UMLNameCompartmentView', True);
  MetaModel.DefineMetaClass(PUMLListCompartmentView, 'UMLListCompartmentView', True);
  MetaModel.DefineMetaClass(PUMLGeneralNodeView, 'UMLGeneralNodeView', True);
  MetaModel.DefineMetaClass(PUMLGeneralEdgeView, 'UMLGeneralEdgeView', True);
  MetaModel.DefineMetaClass(PUMLAttributeCompartmentView, 'UMLAttributeCompartmentView', False);
  MetaModel.DefineMetaClass(PUMLOperationCompartmentView, 'UMLOperationCompartmentView', False);
  MetaModel.DefineMetaClass(PUMLEnumerationLiteralCompartmentView, 'UMLEnumerationLiteralCompartmentView', False);
  MetaModel.DefineMetaClass(PUMLTemplateParameterCompartmentView, 'UMLTemplateParameterCompartmentView', False);
  MetaModel.DefineMetaClass(PUMLQualifierCompartmentView, 'UMLQualifierCompartmentView', False);
  MetaModel.DefineMetaClass(PUMLInternalTransitionCompartmentView, 'UMLInternalTransitionCompartmentView', False);
  MetaModel.DefineMetaClass(PUMLClassifierView, 'UMLClassifierView', True);
  MetaModel.DefineMetaClass(PUMLPackageView, 'UMLPackageView', False);
  MetaModel.DefineMetaClass(PUMLSubsystemView, 'UMLSubsystemView', False);
  MetaModel.DefineMetaClass(PUMLModelView, 'UMLModelView', False);
  MetaModel.DefineMetaClass(PUMLEnumerationView, 'UMLEnumerationView', False);
  MetaModel.DefineMetaClass(PUMLClassView, 'UMLClassView', False);
  MetaModel.DefineMetaClass(PUMLInterfaceView, 'UMLInterfaceView', False);
  MetaModel.DefineMetaClass(PUMLSignalView, 'UMLSignalView', False);
  MetaModel.DefineMetaClass(PUMLExceptionView, 'UMLExceptionView', False);
  MetaModel.DefineMetaClass(PUMLGeneralizationView, 'UMLGeneralizationView', False);
  MetaModel.DefineMetaClass(PUMLRealizationView, 'UMLRealizationView', False);
  MetaModel.DefineMetaClass(PUMLDependencyView, 'UMLDependencyView', False);
  MetaModel.DefineMetaClass(PUMLAssociationView, 'UMLAssociationView', False);
  MetaModel.DefineMetaClass(PUMLAssociationClassView, 'UMLAssociationClassView', False);
  MetaModel.DefineMetaClass(PUMLCustomComponentView, 'UMLCustomComponentView', False);
  MetaModel.DefineMetaClass(PUMLComponentView, 'UMLComponentView', False);
  MetaModel.DefineMetaClass(PUMLComponentInstanceView, 'UMLComponentInstanceView', False);
  MetaModel.DefineMetaClass(PUMLCustomNodeView, 'UMLCustomNodeView', False);
  MetaModel.DefineMetaClass(PUMLNodeView, 'UMLNodeView', False);
  MetaModel.DefineMetaClass(PUMLNodeInstanceView, 'UMLNodeInstanceView', False);
  MetaModel.DefineMetaClass(PUMLActorView, 'UMLActorView', False);
  MetaModel.DefineMetaClass(PUMLUseCaseView, 'UMLUseCaseView', False);
  MetaModel.DefineMetaClass(PUMLIncludeView, 'UMLIncludeView', False);
  MetaModel.DefineMetaClass(PUMLExtendView, 'UMLExtendView', False);
  MetaModel.DefineMetaClass(PUMLLifeLineView, 'UMLLifeLineView', False);
  MetaModel.DefineMetaClass(PUMLCustomSeqObjectView, 'UMLCustomSeqObjectView', True);
  MetaModel.DefineMetaClass(PUMLSeqObjectView, 'UMLSeqObjectView', False);
  MetaModel.DefineMetaClass(PUMLSeqClassifierRoleView, 'UMLSeqClassifierRoleView', False);
  MetaModel.DefineMetaClass(PUMLActivationView, 'UMLActivationView', False);
  MetaModel.DefineMetaClass(PUMLCustomSeqMessageView, 'UMLCustomSeqMessageView', True);
  MetaModel.DefineMetaClass(PUMLSeqMessageView, 'UMLSeqMessageView', False);
  MetaModel.DefineMetaClass(PUMLSeqStimulusView, 'UMLSeqStimulusView', False);
  MetaModel.DefineMetaClass(PUMLCollaborationView, 'UMLCollaborationView', False);
  MetaModel.DefineMetaClass(PUMLCollaborationInstanceSetView, 'UMLCollaborationInstanceSetView', False);
  MetaModel.DefineMetaClass(PUMLCustomColObjectView, 'UMLCustomColObjectView', True);
  MetaModel.DefineMetaClass(PUMLColObjectView, 'UMLColObjectView', False);
  MetaModel.DefineMetaClass(PUMLColClassifierRoleView, 'UMLColClassifierRoleView', False);
  MetaModel.DefineMetaClass(PUMLCompositeStructureDiagramView, 'UMLCompositeStructureDiagramView', False);

  MetaModel.DefineMetaClass(PUMLLinkView, 'UMLLinkView', False);
  MetaModel.DefineMetaClass(PUMLAssociationRoleView, 'UMLAssociationRoleView', False);
  MetaModel.DefineMetaClass(PUMLCustomColMessageView, 'UMLCustomColMessageView', True);
  MetaModel.DefineMetaClass(PUMLColMessageView, 'UMLColMessageView', False);
  MetaModel.DefineMetaClass(PUMLColStimulusView, 'UMLColStimulusView', False);

  MetaModel.DefineMetaClass(PUMLCustomStateView, 'UMLCustomStateView', True);

  MetaModel.DefineMetaClass(PUMLStateView, 'UMLStateView', False);
  MetaModel.DefineMetaClass(PUMLSubmachineStateView, 'UMLSubmachineStateView', False);
  MetaModel.DefineMetaClass(PUMLPseudostateView, 'UMLPseudostateView', False);
  MetaModel.DefineMetaClass(PUMLFinalStateView, 'UMLFinalStateView', False);
  MetaModel.DefineMetaClass(PUMLActionStateView, 'UMLActionStateView', False);
  MetaModel.DefineMetaClass(PUMLSubactivityStateView, 'UMLSubactivityStateView', False);
  MetaModel.DefineMetaClass(PUMLSwimlaneView, 'UMLSwimlaneView', False);
  MetaModel.DefineMetaClass(PUMLTransitionView, 'UMLTransitionView', False);
  MetaModel.DefineMetaClass(PUMLDiagramView, 'UMLDiagramView', False);
  MetaModel.DefineMetaClass(PUMLClassDiagramView, 'UMLClassDiagramView', False);
  MetaModel.DefineMetaClass(PUMLUseCaseDiagramView, 'UMLUseCaseDiagramView', False);
  MetaModel.DefineMetaClass(PUMLSequenceDiagramView, 'UMLSequenceDiagramView', False);
  MetaModel.DefineMetaClass(PUMLSequenceRoleDiagramView, 'UMLSequenceRoleDiagramView', False);
  MetaModel.DefineMetaClass(PUMLCollaborationDiagramView, 'UMLCollaborationDiagramView', False);
  MetaModel.DefineMetaClass(PUMLCollaborationRoleDiagramView, 'UMLCollaborationRoleDiagramView', False);
  MetaModel.DefineMetaClass(PUMLStatechartDiagramView, 'UMLStatechartDiagramView', False);
  MetaModel.DefineMetaClass(PUMLActivityDiagramView, 'UMLActivityDiagramView', False);
  MetaModel.DefineMetaClass(PUMLComponentDiagramView, 'UMLComponentDiagramView', False);
  MetaModel.DefineMetaClass(PUMLDeploymentDiagramView, 'UMLDeploymentDiagramView', False);

  MetaModel.DefineMetaClass(PUMLCustomTextView, 'UMLCustomTextView', True);
  MetaModel.DefineMetaClass(PUMLTextView, 'UMLTextView', False);
  MetaModel.DefineMetaClass(PUMLNoteView, 'UMLNoteView', False);
  MetaModel.DefineMetaClass(PUMLNoteLinkView, 'UMLNoteLinkView', False);

  MetaModel.DefineMetaClass(PUMLObjectFlowStateView, 'UMLObjectFlowStateView', False);
  MetaModel.DefineMetaClass(PUMLFlowFinalStateView, 'UMLFlowFinalStateView', False);
  MetaModel.DefineMetaClass(PUMLSystemBoundaryView, 'UMLSystemBoundaryView', False);
  MetaModel.DefineMetaClass(PUMLSignalAcceptStateView, 'UMLSignalAcceptStateView', False);
  MetaModel.DefineMetaClass(PUMLSignalSendStateView, 'UMLSignalSendStateView', False);
  MetaModel.DefineMetaClass(PUMLArtifactView, 'UMLArtifactView', False);
  MetaModel.DefineMetaClass(PUMLResidentCompartmentView, 'UMLResidentCompartmentView', False);
  MetaModel.DefineMetaClass(PUMLDeployedComponentCompartmentView, 'UMLDeployedComponentCompartmentView', False);
  MetaModel.DefineMetaClass(PUMLDeployedArtifactCompartmentView, 'UMLDeployedArtifactCompartmentView', False);
  MetaModel.DefineMetaClass(PUMLSlotCompartmentView, 'UMLSlotCompartmentView', False);
  MetaModel.DefineMetaClass(PUMLPortView, 'UMLPortView', False);
  MetaModel.DefineMetaClass(PUMLPartView, 'UMLPartView', False);
  MetaModel.DefineMetaClass(PUMLConnectorView, 'UMLConnectorView', False);
  MetaModel.DefineMetaClass(PUMLCustomFrameView, 'UMLCustomFrameView', True);
  MetaModel.DefineMetaClass(PUMLFrameView, 'UMLFrameView', False);
  MetaModel.DefineMetaClass(PUMLCombinedFragmentView, 'UMLCombinedFragmentView', False);
  MetaModel.DefineMetaClass(PUMLInteractionOperandView, 'UMLInteractionOperandView', False);
  MetaModel.DefineMetaClass(PUMLExtensionPointCompartmentView, 'UMLExtensionPointCompartmentView', False);
  MetaModel.DefineMetaClass(PShapeView, 'ShapeView', True);
  MetaModel.DefineMetaClass(PRectangleView, 'RectangleView', False);
  MetaModel.DefineMetaClass(PEllipseView, 'EllipseView', False);
  MetaModel.DefineMetaClass(PRoundRectView, 'RoundRectView', False);
  MetaModel.DefineMetaClass(PLineView, 'LineView', False);
  MetaModel.DefineMetaClass(PImageView, 'ImageView', False);

  // UMLNameCompartmentView
  M := MetaModel.FindMetaClass('UMLNameCompartmentView');
  MetaModel.DefineMetaReference(M, 'NameLabel', 'LabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'StereotypeLabel', 'LabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'PropertyLabel', 'LabelView', True, False, makComposite);
  // UMLGeneralNodeView
  M := MetaModel.FindMetaClass('UMLGeneralNodeView');
  MetaModel.DefineMetaAttribute(M, 'StereotypeDisplay', 'UMLStereotypeDisplayKind', False, False, 'sdkLabel');
  MetaModel.DefineMetaAttribute(M, 'ShowParentName', 'Boolean', False, False);
  MetaModel.DefineMetaAttribute(M, 'ShowProperty', 'Boolean', False, False);
  MetaModel.DefineMetaReference(M, 'NameCompartment', 'UMLNameCompartmentView', True, False, makComposite);
  MetaModel.DefineMetaAttribute(M, 'WordWrap', 'Boolean', False, False);
  // UMLGeneralEdgeView
  M := MetaModel.FindMetaClass('UMLGeneralEdgeView');
  MetaModel.DefineMetaAttribute(M, 'ShowProperty', 'Boolean', False, False);
  MetaModel.DefineMetaReference(M, 'NameLabel', 'LabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'StereotypeLabel', 'LabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'PropertyLabel', 'LabelView', True, False, makComposite);
  // UMLAttributeCompartmentView
  // UMLOperationCompartmentView
  // UMLEnumerationLiteralCompartmentView
  // UMLTemplateParameterCompartmentView
  // UMLQualifierCompartmentView
  // UMLClassifierView
  M := MetaModel.FindMetaClass('UMLClassifierView');
  MetaModel.DefineMetaAttribute(M, 'SuppressAttributes', 'Boolean', False, True);
  MetaModel.DefineMetaAttribute(M, 'SuppressOperations', 'Boolean', False, True);
  MetaModel.DefineMetaAttribute(M, 'ShowOperationSignature', 'Boolean', False, False, 'True');
  MetaModel.DefineMetaAttribute(M, 'ShowCompartmentStereotype', 'Boolean', False, False, 'True');
  MetaModel.DefineMetaAttribute(M, 'ShowCompartmentVisibility', 'Boolean', False, False, 'True');
  MetaModel.DefineMetaReference(M, 'AttributeCompartment', 'UMLAttributeCompartmentView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'OperationCompartment', 'UMLOperationCompartmentView', True, False, makComposite);
  // UMLPackageView
  // UMLSubsystemView
  M := MetaModel.FindMetaClass('UMLSubsystemView');
  MetaModel.DefineMetaAttribute(M, 'SuppressOperations', 'Boolean', False, True);
  MetaModel.DefineMetaAttribute(M, 'ShowOperationSignature', 'Boolean', False, False, 'True');
  MetaModel.DefineMetaAttribute(M, 'ShowCompartmentStereotype', 'Boolean', False, False, 'True');
  MetaModel.DefineMetaAttribute(M, 'ShowCompartmentVisibility', 'Boolean', False, False, 'True');
  MetaModel.DefineMetaReference(M, 'OperationCompartment', 'UMLOperationCompartmentView', True, False, makComposite);
  // UMLModelView
  // UMLEnumerationView
  M := MetaModel.FindMetaClass('UMLEnumerationView');
  MetaModel.DefineMetaAttribute(M, 'SuppressLiterals', 'Boolean', False, True);
  MetaModel.DefineMetaAttribute(M, 'SuppressOperations', 'Boolean', False, True);
  MetaModel.DefineMetaAttribute(M, 'ShowOperationSignature', 'Boolean', False, False, 'True');
  MetaModel.DefineMetaAttribute(M, 'ShowCompartmentStereotype', 'Boolean', False, False, 'True');
  MetaModel.DefineMetaAttribute(M, 'ShowCompartmentVisibility', 'Boolean', False, False, 'True');
  MetaModel.DefineMetaReference(M, 'EnumerationLiteralCompartment', 'UMLEnumerationLiteralCompartmentView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'OperationCompartment', 'UMLOperationCompartmentView', True, False, makComposite);
  // UMLClassView
  M := MetaModel.FindMetaClass('UMLClassView');
  MetaModel.DefineMetaReference(M, 'TemplateParameterCompartment', 'UMLTemplateParameterCompartmentView', True, False, makComposite);
  // UMLInterfaceView
  // UMLSignalView
  // UMLExceptionView
  // UMLGeneralizationView
  // UMLRealizationView
  // UMLDependencyView
  // UMLAssociationView
  M := MetaModel.FindMetaClass('UMLAssociationView');
  MetaModel.DefineMetaAttribute(M, 'ShowCompartmentStereotype', 'Boolean', False, False, 'True');
  MetaModel.DefineMetaAttribute(M, 'ShowCompartmentVisibility', 'Boolean', False, False, 'True');
  MetaModel.DefineMetaReference(M, 'HeadRoleNameLabel', 'EdgeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'TailRoleNameLabel', 'EdgeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'HeadMultiplicityLabel', 'EdgeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'TailMultiplicityLabel', 'EdgeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'HeadPropertyLabel', 'EdgeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'TailPropertyLabel', 'EdgeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'HeadQualifierCompartment', 'UMLQualifierCompartmentView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'TailQualifierCompartment', 'UMLQualifierCompartmentView', True, False, makComposite);
  // UMLCustomComponentView
  // UMLComponentView
  M := MetaModel.FindMetaClass('UMLComponentView');
  MetaModel.DefineMetaReference(M, 'ResidentCompartment', 'UMLResidentCompartmentView', True, False, makComposite);
  // UMLComponentInstanceView
  // UMLCustomNodeView
  // UMLNodeView
  M := MetaModel.FindMetaClass('UMLNodeView');
  MetaModel.DefineMetaReference(M, 'DeployedComponentCompartment', 'UMLDeployedComponentCompartmentView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'DeployedArtifactCompartment', 'UMLDeployedArtifactCompartmentView', True, False, makComposite);
  // UMLNodeInstanceView
  // UMLActorView
  // UMLUseCaseView
  M := MetaModel.FindMetaClass('UMLUseCaseView');
  MetaModel.DefineMetaReference(M, 'ExtensionPointCompartment', 'UMLExtensionPointCompartmentView', True, False, makComposite);
  // UMLIncludeView
  // UMLExtendView

  // UMLLifeLineView
  // UMLCustomSeqObjectView
  M := MetaModel.FindMetaClass('UMLCustomSeqObjectView');
  MetaModel.DefineMetaReference(M, 'LifeLine', 'UMLLifeLineView', True, False, makComposite);
  // UMLSeqObjectView
  // UMLSeqClassifierRoleView
  // UMLActivationView
  // UMLCustomSeqMessageView
  M := MetaModel.FindMetaClass('UMLCustomSeqMessageView');
  MetaModel.DefineMetaAttribute(M, 'ShowProperty', 'Boolean', False, False);
  MetaModel.DefineMetaReference(M, 'NameLabel', 'EdgeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'StereotypeLabel', 'EdgeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'PropertyLabel', 'EdgeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'Activation', 'UMLActivationView', True, False, makComposite);
  // UMLSeqMessageView
  // UMLSeqStimulusView

  // UMLCollaborationView
  M := MetaModel.FindMetaClass('UMLCollaborationView');
  MetaModel.DefineMetaReference(M, 'TemplateParameterCompartment', 'UMLTemplateParameterCompartmentView', True, False, makComposite);
  // UMLCollaborationInstanceSetView
  // UMLCustomColObjectView
  // UMLColObjectView
  M := MetaModel.FindMetaClass('UMLColObjectView');
  MetaModel.DefineMetaReference(M, 'SlotCompartment', 'UMLSlotCompartmentView', True, False, makComposite);

  // UMLColClassifierRoleView
  // UMLLinkView
  M := MetaModel.FindMetaClass('UMLLinkView');
  MetaModel.DefineMetaReference(M, 'HeadEndLabel', 'EdgeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'TailEndLabel', 'EdgeLabelView', True, False, makComposite);
  // UMLAssociationRoleView
  // UMLCustomColMessageView
  M := MetaModel.FindMetaClass('UMLCustomColMessageView');
  MetaModel.DefineMetaAttribute(M, 'ShowProperty', 'Boolean', False, False);
  MetaModel.DefineMetaReference(M, 'NameLabel', 'NodeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'StereotypeLabel', 'NodeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'PropertyLabel', 'NodeLabelView', True, False, makComposite);
  // UMLColMessageView
  // UMLColStimulusView
  // UMLCustomStateView
  M := MetaModel.FindMetaClass('UMLCustomStateView');
  MetaModel.DefineMetaReference(M, 'InternalTransitionCompartment', 'UMLInternalTransitionCompartmentView', True, False, makComposite);
  // UMLStateView
  // UMLSubmachineStateView
  M := MetaModel.FindMetaClass('UMLSubmachineStateView');
  MetaModel.DefineMetaReference(M, 'IncludeLabel', 'LabelView', True, False, makComposite);
  // UMLActionStateView
  // UMLSubactivityStateView
  M := MetaModel.FindMetaClass('UMLSubactivityStateView');
  MetaModel.DefineMetaReference(M, 'IncludeLabel', 'LabelView', True, False, makComposite);
  // UMLPseudostateView
  // UMLFinalStateView
  // UMLSwimlaneView
  M := MetaModel.FindMetaClass('UMLSwimlaneView');
  MetaModel.DefineMetaReference(M, 'NameLabel', 'NodeLabelView', True, False, makComposite);
  MetaModel.DefineMetaAttribute(M, 'Direction', 'UMLSwimlaneDirectionKind', False, False, 'slkVertical');
  // UMLTransitionView

  // UMLCustomTextView
  M := MetaModel.FindMetaClass('UMLCustomTextView');
  MetaModel.DefineMetaAttribute(M, 'Text', 'String', True, False);
  // UMLTextView
  // UMLNoteView
  // UMLNoteLinkView
  // UMLDiagramView
  // UMLObjectFlowStateView
  // UMLFlowFinalStateView
  // UMLSystemBoundaryView
  M := MetaModel.FindMetaClass('UMLSystemBoundaryView');
  MetaModel.DefineMetaAttribute(M, 'Caption', 'String', True, False);
  // UMLSignalAcceptStateView
  // UMLSignalSendStateView
  // UMLArtifactView
  // UMLResidentCompartmentView
  // UMLDeployedComponentCompartmentView
  // UMLDeployedArtifactCompartmentView
  // UMLSlotCompartmentView
  // UMLPortView
  M := MetaModel.FindMetaClass('UMLPortView');
  MetaModel.DefineMetaAttribute(M, 'ShowProperty', 'Boolean', False, False);
  MetaModel.DefineMetaReference(M, 'NameLabel', 'NodeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'StereotypeLabel', 'NodeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'PropertyLabel', 'NodeLabelView', True, False, makComposite);
  // PUMLPartView
  // PUMLConnectorView
  M := MetaModel.FindMetaClass('UMLConnectorView');
  MetaModel.DefineMetaReference(M, 'HeadRoleNameLabel', 'EdgeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'TailRoleNameLabel', 'EdgeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'HeadMultiplicityLabel', 'EdgeLabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'TailMultiplicityLabel', 'EdgeLabelView', True, False, makComposite);
  // PUMLCustomFragmentView
  M := MetaModel.FindMetaClass('UMLCustomFrameView');
  MetaModel.DefineMetaReference(M, 'NameLabel', 'LabelView', True, False, makComposite);
  MetaModel.DefineMetaReference(M, 'FrameTypeLabel', 'LabelView', True, False, makComposite);
  // PUMLFrameView
  // PUMLCombinedFragmentView
  // PUMLInteractionOperandView
  M := MetaModel.FindMetaClass('UMLInteractionOperandView');
  MetaModel.DefineMetaReference(M, 'GuardLabel', 'LabelView', True, False, makComposite);
  // PUMLExtensionPointCompartmentview
  // PShapeView
  M := MetaModel.FindMetaClass('ShapeView');
  MetaModel.DefineMetaAttribute(M, 'LineWidth', 'Integer', False, False);
  MetaModel.DefineMetaAttribute(M, 'LineKind', 'LineKind', False, False);
  // PRectangleView
  // PEllipseView
  // PRoundRectView
  // PLineView
  M := MetaModel.FindMetaClass('LineView');
  MetaModel.DefineMetaAttribute(M, 'Points', 'Points', True, False);
  MetaModel.DefineMetaAttribute(M, 'BeginArrowheadStyle', 'ArrowheadStyleKind', False, False);
  MetaModel.DefineMetaAttribute(M, 'EndArrowheadStyle', 'ArrowheadStyleKind', False, False);
  // PImageView
  M := MetaModel.FindMetaClass('ImageView');
  MetaModel.DefineMetaAttribute(M, 'Type_', 'ImageKind', False, False);
  MetaModel.DefineMetaAttribute(M, 'ImageData', 'String', False, False);
  MetaModel.DefineMetaAttribute(M, 'MaintainAspectRatio', 'Boolean', False, False);

  // Inheritance Relations
  MetaModel.DefineMetaInheritance('NodeView', 'UMLNameCompartmentView');
  MetaModel.DefineMetaInheritance('NodeView', 'UMLListCompartmentView');
  MetaModel.DefineMetaInheritance('NodeView', 'UMLGeneralNodeView');
  MetaModel.DefineMetaInheritance('EdgeView', 'UMLGeneralEdgeView');
  MetaModel.DefineMetaInheritance('UMLListCompartmentView', 'UMLAttributeCompartmentView');
  MetaModel.DefineMetaInheritance('UMLListCompartmentView', 'UMLOperationCompartmentView');
  MetaModel.DefineMetaInheritance('UMLListCompartmentView', 'UMLEnumerationLiteralCompartmentView');
  MetaModel.DefineMetaInheritance('UMLListCompartmentView', 'UMLTemplateParameterCompartmentView');
  MetaModel.DefineMetaInheritance('UMLListCompartmentView', 'UMLQualifierCompartmentView');
  MetaModel.DefineMetaInheritance('UMLListCompartmentView', 'UMLInternalTransitionCompartmentView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLClassifierView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLPackageView');
  MetaModel.DefineMetaInheritance('UMLPackageView', 'UMLSubsystemView');
  MetaModel.DefineMetaInheritance('UMLPackageView', 'UMLModelView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLEnumerationView');
  MetaModel.DefineMetaInheritance('UMLClassifierView', 'UMLClassView');
  MetaModel.DefineMetaInheritance('UMLClassifierView', 'UMLInterfaceView');
  MetaModel.DefineMetaInheritance('UMLClassifierView', 'UMLSignalView');
  MetaModel.DefineMetaInheritance('UMLSignalView', 'UMLExceptionView');
  MetaModel.DefineMetaInheritance('UMLGeneralEdgeView', 'UMLGeneralizationView');
  MetaModel.DefineMetaInheritance('UMLGeneralEdgeView', 'UMLRealizationView');
  MetaModel.DefineMetaInheritance('UMLGeneralEdgeView', 'UMLDependencyView');
  MetaModel.DefineMetaInheritance('UMLGeneralEdgeView', 'UMLAssociationView');
  MetaModel.DefineMetaInheritance('EdgeView', 'UMLAssociationClassView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLCustomComponentView');
  MetaModel.DefineMetaInheritance('UMLCustomComponentView', 'UMLComponentView');
  MetaModel.DefineMetaInheritance('UMLCustomComponentView', 'UMLComponentInstanceView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLCustomNodeView');
  MetaModel.DefineMetaInheritance('UMLCustomNodeView', 'UMLNodeView');
  MetaModel.DefineMetaInheritance('UMLCustomNodeView', 'UMLNodeInstanceView');
  MetaModel.DefineMetaInheritance('UMLClassifierView', 'UMLActorView');
  MetaModel.DefineMetaInheritance('UMLClassifierView', 'UMLUseCaseView');
  MetaModel.DefineMetaInheritance('UMLGeneralEdgeView', 'UMLIncludeView');
  MetaModel.DefineMetaInheritance('UMLGeneralEdgeView', 'UMLExtendView');
  MetaModel.DefineMetaInheritance('NodeView', 'UMLLifeLineView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLCustomSeqObjectView');
  MetaModel.DefineMetaInheritance('UMLCustomSeqObjectView', 'UMLSeqObjectView');
  MetaModel.DefineMetaInheritance('UMLCustomSeqObjectView', 'UMLSeqClassifierRoleView');
  MetaModel.DefineMetaInheritance('NodeView', 'UMLActivationView');
  MetaModel.DefineMetaInheritance('EdgeView', 'UMLCustomSeqMessageView');
  MetaModel.DefineMetaInheritance('UMLCustomSeqMessageView', 'UMLSeqMessageView');
  MetaModel.DefineMetaInheritance('UMLCustomSeqMessageView', 'UMLSeqStimulusView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLCustomColObjectView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLCollaborationView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLCollaborationInstanceSetView');
  MetaModel.DefineMetaInheritance('UMLCustomColObjectView', 'UMLColObjectView');
  MetaModel.DefineMetaInheritance('UMLCustomColObjectView', 'UMLColClassifierRoleView');
  MetaModel.DefineMetaInheritance('UMLGeneralEdgeView', 'UMLLinkView');
  MetaModel.DefineMetaInheritance('UMLAssociationView', 'UMLAssociationRoleView');
  MetaModel.DefineMetaInheritance('EdgeNodeView', 'UMLCustomColMessageView');
  MetaModel.DefineMetaInheritance('UMLCustomColMessageView', 'UMLColMessageView');
  MetaModel.DefineMetaInheritance('UMLCustomColMessageView', 'UMLColStimulusView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLCustomStateView');
  MetaModel.DefineMetaInheritance('UMLCustomStateView', 'UMLStateView');
  MetaModel.DefineMetaInheritance('UMLCustomStateView', 'UMLSubmachineStateView');
  MetaModel.DefineMetaInheritance('NodeView', 'UMLPseudostateView');
  MetaModel.DefineMetaInheritance('NodeView', 'UMLFinalStateView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLActionStateView');
  MetaModel.DefineMetaInheritance('UMLActionStateView', 'UMLSubactivityStateView');
  MetaModel.DefineMetaInheritance('NodeView', 'UMLSwimlaneView');
  MetaModel.DefineMetaInheritance('UMLGeneralEdgeView', 'UMLTransitionView');
  MetaModel.DefineMetaInheritance('NodeView', 'UMLCustomTextView');
  MetaModel.DefineMetaInheritance('UMLCustomTextView', 'UMLTextView');
  MetaModel.DefineMetaInheritance('UMLCustomTextView', 'UMLNoteView');
  MetaModel.DefineMetaInheritance('EdgeView', 'UMLNoteLinkView');
  MetaModel.DefineMetaInheritance('DiagramView', 'UMLDiagramView');
  MetaModel.DefineMetaInheritance('UMLDiagramView', 'UMLClassDiagramView');
  MetaModel.DefineMetaInheritance('UMLDiagramView', 'UMLUseCaseDiagramView');
  MetaModel.DefineMetaInheritance('UMLDiagramView', 'UMLSequenceDiagramView');
  MetaModel.DefineMetaInheritance('UMLDiagramView', 'UMLSequenceRoleDiagramView');
  MetaModel.DefineMetaInheritance('UMLDiagramView', 'UMLCollaborationDiagramView');
  MetaModel.DefineMetaInheritance('UMLDiagramView', 'UMLCollaborationRoleDiagramView');
  MetaModel.DefineMetaInheritance('UMLDiagramView', 'UMLStatechartDiagramView');
  MetaModel.DefineMetaInheritance('UMLDiagramView', 'UMLActivityDiagramView');
  MetaModel.DefineMetaInheritance('UMLDiagramView', 'UMLComponentDiagramView');
  MetaModel.DefineMetaInheritance('UMLDiagramView', 'UMLDeploymentDiagramView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLObjectFlowStateView');
  MetaModel.DefineMetaInheritance('NodeView', 'UMLFlowFinalStateView');
  MetaModel.DefineMetaInheritance('NodeView', 'UMLSystemBoundaryView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLSignalAcceptStateView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLSignalSendStateView');
  MetaModel.DefineMetaInheritance('UMLClassifierView', 'UMLArtifactView');
  MetaModel.DefineMetaInheritance('UMLListCompartmentView', 'UMLResidentCompartmentView');
  MetaModel.DefineMetaInheritance('UMLListCompartmentView', 'UMLDeployedComponentCompartmentView');
  MetaModel.DefineMetaInheritance('UMLListCompartmentView', 'UMLDeployedArtifactCompartmentView');
  MetaModel.DefineMetaInheritance('UMLListCompartmentView', 'UMLSlotCompartmentView');
  MetaModel.DefineMetaInheritance('UMLDiagramView', 'UMLCompositeStructureDiagramView');
  MetaModel.DefineMetaInheritance('NodeView', 'UMLPortView');
  MetaModel.DefineMetaInheritance('UMLGeneralNodeView', 'UMLPartView');
  MetaModel.DefineMetaInheritance('UMLGeneralEdgeView', 'UMLConnectorView');
  MetaModel.DefineMetaInheritance('NodeView', 'UMLCustomFrameView');
  MetaModel.DefineMetaInheritance('UMLCustomFrameView', 'UMLFrameView');
  MetaModel.DefineMetaInheritance('UMLCustomFrameView', 'UMLCombinedFragmentView');
  MetaModel.DefineMetaInheritance('NodeView', 'UMLInteractionOperandView');
  MetaModel.DefineMetaInheritance('UMLListCompartmentView', 'UMLExtensionPointCompartmentView');
  MetaModel.DefineMetaInheritance('NodeView', 'ShapeView');
  MetaModel.DefineMetaInheritance('ShapeView', 'RectangleView');
  MetaModel.DefineMetaInheritance('ShapeView', 'EllipseView');
  MetaModel.DefineMetaInheritance('ShapeView', 'RoundRectView');
  MetaModel.DefineMetaInheritance('ShapeView', 'LineView');
  MetaModel.DefineMetaInheritance('ShapeView', 'ImageView');
end;

initialization
  RegisterClasses;
  RegisterMetaClasses;
end.

