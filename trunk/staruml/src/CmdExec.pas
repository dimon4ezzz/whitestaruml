unit CmdExec;

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
  BasicClasses, GraphicClasses, Core, ExtCore, ViewCore, UMLModels, UMLFacto,
  Classes, Types, UMLViews, Graphics, Generics.Collections;

type
  // Enumeration Types
  PAlignmentKind = (akLeft, akRight, akMiddle, akTop, akBottom, akCenter,
    akSpaceEvenlyHorizontally, akSpaceEvenlyVertically);
  PFontItemKinds = set of (fiName, fiSize, fiStyle, fiEffect, fiColor);

  // Event Types
  PErrorEvent = procedure(Sender: TObject; ErrorMessage: string) of object;

  // PCommandExecutor
  PCommandExecutor = class
  private
    ModelSet: PModelOrderedSet;
    ViewSet: PViewOrderedSet;
    Engine: PEngine;
    FOnElementsCreated: PModelsViewsEvent;
    FOnElementsDeleting: PModelsViewsEvent;
    FOnElementsDeleted: TNotifyEvent;
    FOnModelsChanged: PModelsEvent;
    FOnViewsChanged: PViewsEvent;
    FOnError: PErrorEvent;
    FOnCommandExecuted: PCommandEvent;
    FOnCommandUnexecuted: PCommandEvent;
    FOnCommandHistoryChanged: TNotifyEvent;
    function GetUndoLevel: Integer;
    procedure SetUndoLevel(Value: Integer);
    procedure ElementsCreated(Sender: TObject; Models: PModelOrderedSet; Views: PViewOrderedSet);
    procedure ElementsDeleting(Sender: TObject; Models: PModelOrderedSet; Views: PViewOrderedSet);
    procedure ElementsDeleted(Sender: TObject);
    procedure ModelsChanged(Sender: TObject; Models: PModelOrderedSet);
    procedure ViewsChanged(Sender: TObject; Views: PViewOrderedSet);
    procedure ErrorOccurred(Sender: TObject; ErrorMessage: string);
    procedure EngineCommandExecutedHandler(Sender: TObject; Command: PCommand);
    procedure EngineCommandUnexecutedHandler(Sender: TObject; Command: PCommand);
    procedure CommandHistoryChanged;
  public
    constructor Create;
    destructor Destroy; override;
    procedure BeginGrouping;
    procedure EndGrouping;
    function IsGroupingMode: Boolean;
    function ToUndoIsGroup: Boolean;
    function ToRedoIsGroup: Boolean;
    // Elements Creating Functions.
    function NewModel(Owner: PModel; ModelKind: string; Argument: Integer = 0; End1: PModel = nil; End2: PModel = nil; InsertIndex: Integer = -1; AuxArg: PModel = nil): PModel;
    function NewExtendedModel(Owner: PModel; Profile: string; ModelPrototype: string; End1: PModel = nil; End2: PModel = nil; InsertIndex: Integer = -1; AuxArg: PModel = nil): PModel;
    function NewModelWithName(Owner: PModel; ModelKind: string; Name: string = ''): PModel;
    function NewView(DiagramView: PDiagramView; Model: PModel; ViewKind: string = ''; End1: PView = nil; End2: PView = nil): PView; overload;
    function NewView(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer; Model: PModel; ViewKind: string = ''): PView; overload;
    function NewDiagram(Owner: PModel; DiagramKind: string): PDiagram;
    function NewExtendedDiagram(Owner: PModel; Profile: string; DiagramType: string): PDiagram;
    function NewElement(DiagramView: PDiagramView; ElementKind: string; Argument: Integer = 0; End1: PView = nil; End2: PView = nil): PView; overload;
    function NewElement(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer; ElementKind: string; Argument: Integer = 0): PView; overload;
    function NewExtendedElement(DiagramView: PDiagramView; Profile, ElementPrototype: string; End1: PView = nil; End2: PView = nil): PView; overload;
    function NewExtendedElement(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer; Profile, PaletteElement: string): PView; overload;
    function NewViewByDragDrop(DiagramView: PDiagramView; Model: PModel; X, Y: Integer): PView;
    procedure NewModelByCopyPaste(AModel, ATarget: PModel);
    function NewViewsByCopyPaste(Views: PViewOrderedSet; Target: PDiagramView): PViewOrderedSet;
    procedure DeleteElements(Models: PModelOrderedSet; Views: PViewOrderedSet);
    // Models Changing Functions.
    procedure ChangeModelsAttribute(Models: PModelOrderedSet; Key: string; Value: string);
    procedure ChangeModelsReference(Models: PModelOrderedSet; Key: string; Value: PModel);
    procedure ClearCollection(AElement: PModel; Key: string);
    procedure AddCollectionItem(AElement: PElement; Key: string; Value: PElement);
    procedure RemoveCollectionItem(AElement: PElement; Key: string; Value: PElement);
    procedure InsertCollectionItem(AElement: PElement; Key: string; Index: Integer; Value: PElement);
    procedure DeleteCollectionItem(AElement: PElement; Key: string; Index: Integer);
    procedure ChangeCollectionItemOrder(AElement: PElement; ACollectionItem: PElement; Key: string; NewIndex: Integer);
    procedure ChangeTypeExpression(AModel: PModel; TypeExpr: string; TypeRef: PModel);
    procedure ChangeValueExpression(AModel: PModel; ValueExpr: string; ValueRef: PModel);
    procedure ChangeActionKind(AModel: PModel; ActionKind: string);
    procedure ChangeDocumentation(AModel: PModel; Documentation: string);
    procedure RelocateModels(Models: PModelOrderedSet; ATarget: PModel);
    procedure ChangeModelsStereotype(Models: PModelOrderedSet; AStereotypeProfile: string; AStereotype: string);
    function AddConstraint(AExtensibleModel: PExtensibleModel; AName: string; ABody: string): PConstraint;
    procedure DeleteConstraint(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint);
    procedure ChangeConstraint(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint; AName: string; ABody: string);
    procedure SetDataTaggedValue(AExtensibleModel: PExtensibleModel; Profile: string; TagDefinitionSet: string; Name: string; Value: string);
    procedure SetReferenceTaggedValue(AExtensibleModel: PExtensibleModel; Profile, TagDefinitionSet, Name: string; Value: PExtensibleModel);
    procedure AddCollectionTaggedValue(AExtensibleModel: PExtensibleModel; Profile: string; TagDefinitionSet: string; Name: string; Value: PExtensibleModel);
    procedure RemoveCollectionTaggedValue(AExtensibleModel: PExtensibleModel; Profile: string; TagDefinitionSet: string; Name: string; Value: PExtensibleModel);
    procedure InsertCollectionTaggedValue(AExtensibleModel: PExtensibleModel; Profile: string; TagDefinitionSet: string; Name: string; Idx: Integer; Value: PExtensibleModel);
    procedure DeleteCollectionTaggedValue(AExtensibleModel: PExtensibleModel; Profile: string; TagDefinitionSet: string; Name: string; Idx: Integer);
    procedure SetTaggedValueAsDefault(AExtensibleModel: PExtensibleModel; Profile: string; TagDefinitionSet: string; Name: string);
    procedure ChangeCollectionTaggedValueOrder(AExtensibleModel: PExtensibleModel; Profile: string; TagDefinitionSet: string; Name: string; Value: PExtensibleModel; NewIdx: Integer);
    procedure ClearAttachments(AModel: PModel);
    procedure AddAttachment(AModel: PModel; Attach: string);
    procedure InsertAttachment(AModel: PModel; Attach: string; Index: Integer);
    procedure DeleteAttachment(AModel: PModel; Index: Integer);
    procedure ChangeAttachment(AModel: PModel; Index: Integer; Attach: string);
    procedure ChangeAttachmentOrder(AModel: PModel; Index: Integer; NewIndex: Integer);
    function ApplyGeneralNameExpression(Models: PModelOrderedSet; Value: string; var Msg: string): Boolean;
    function ApplyClassifierRoleExpression(Models: PModelOrderedSet; Value: string; var Msg: string): Boolean;
    function ApplyInstanceExpression(Models: PModelOrderedSet; Value: string; var Msg: string): Boolean;
    function ApplyAttributeExpression(Models: PModelOrderedSet; Value: string; var Msg: string): Boolean;
    function ApplyOperationExpression(Models: PModelOrderedSet; Value: string; var Msg: string): Boolean;
    function ApplyMessageExpression(Models: PModelOrderedSet; Value: string; var Msg: string): Boolean;
    procedure ChangeModelReferenceWithNamedModelCreating(AModel: PModel; Key: string; Owner: PModel; ModelKind: string; Name: string = '');
    // Views Changing Functions.
    procedure MoveViews(ADiagramView: PDiagramView; Views: PViewOrderedSet; DX, DY: Integer);
    procedure MoveParasiticView(AParasiticView: PParasiticView; Alpha, Distance: Extended);
    procedure ResizeNode(ANode: PNodeView; ARect: TRect);
    procedure ResizeFragmentedNode(ANode: PNodeView; ARect: TRect);
    procedure ReshapeEdge(AEdge: IModifiableEdge; APoints: PPoints);
    procedure ReconnectEdge(AEdge: PEdgeView; APoints: PPoints; NewParticipant: PView; IsTailSide: Boolean);
    procedure ChangeViewsAttribute(Views: PViewOrderedSet; Key: string; Value: string);
    procedure ChangeViewsLineColor(Views: PViewOrderedSet; LineColor: TColor);
    procedure ChangeViewsFillColor(Views: PViewOrderedSet; FillColor: TColor);
    procedure ChangeViewsFont(Views: PViewOrderedSet; Font: TFont; AChangedFontItems: PFontItemKinds);
    procedure ChangeEdgesLineStyle(Views: PViewOrderedSet; LineStyle: PLineStyleKind);
    procedure ChangeAnnotationLineStyle(Views: PViewOrderedSet; LineStyle: PLineKind);
    procedure ChangeNoteViewStrings(Views: PViewOrderedSet; Strs: string);
    procedure SendToBackViews(Views: PViewOrderedSet);
    procedure BringToFrontViews(Views: PViewOrderedSet);
    procedure AlignViews(Views: PViewOrderedSet; AlignmentKind: PAlignmentKind);
    procedure LayoutDiagram(ADiagramView: PDiagramView);
    procedure MoveViewsChangeContainer(ADiagramView: PDiagramView; Views: PViewOrderedSet; DX, DY: Integer; AContainerView: PView = nil);
    procedure ClearHistory;
    procedure Undo;
    procedure Redo;
    function CanUndo: Boolean;
    function CanRedo: Boolean;
    function GetUndoName: string;
    function GetRedoName: string;
    property UndoLevel: Integer read GetUndoLevel write SetUndoLevel;
    property OnElementsCreated: PModelsViewsEvent read FOnElementsCreated write FOnElementsCreated;
    property OnElementsDeleting: PModelsViewsEvent read FOnElementsDeleting write FOnElementsDeleting;
    property OnElementsDeleted: TNotifyEvent read FOnElementsDeleted write FOnElementsDeleted;
    property OnModelsChanged: PModelsEvent read FOnModelsChanged write FOnModelsChanged;
    property OnViewsChanged: PViewsEvent read FOnViewsChanged write FOnViewsChanged;
    property OnCommandExecuted: PCommandEvent read FOnCommandExecuted write FOnCommandExecuted;
    property OnCommandUnexecuted: PCommandEvent read FOnCommandUnexecuted write FOnCommandUnexecuted;
    property OnCommandHistoryChanged: TNotifyEvent read FOnCommandHistoryChanged write FOnCommandHistoryChanged;
  end;

implementation

uses
  System.UITypes, UMLAux, ExprParsers, LayoutDgm,
  SysUtils, Generics.Defaults, NLS_StarUML;

type
  // PAbstractChangeCommand
  // ---------------------------------------------------------------------------
  // is abstract class for commands related to change.
  // because changes of view or model affect size,
  // this class has the functionality of storing and restoring view's size.
  // ---------------------------------------------------------------------------
  PAbstractCommand = class(PCommand)
  private
    FSizePreservingViews: PViewOrderedSet;
    FWidthArray: TStringList;
    FHeightArray: TStringList;
  protected
    procedure StoreViewSizes;
    procedure RestoreViewSizes;
    procedure CollectSizesFromModel(AModel: PModel);
    procedure CollectSizesFromView(AView: PView);
    procedure CollectSizesFromModelSet(AModelSet: PModelOrderedSet);
    procedure CollectSizesFromViewSet(AViewSet: PViewOrderedSet);
  public
    constructor Create; override;
    destructor Destroy; override;
    property SizePreservingViews: PViewOrderedSet read FSizePreservingViews;
  end;

  // PAbstractCreateDeleteElementsCommand
  // ---------------------------------------------------------------------------
  // is abstract class for commands related to creation and deletion of element
  // ---------------------------------------------------------------------------
  PAbstractCreateDeleteElementsCommand = class(PAbstractCommand)
  private type
    PMementoList = TList<PMemento>;
  private
    FModelSet: PModelOrderedSet;
    FViewSet: PViewOrderedSet;
    FModelReferences, FViewReferences: PElementOrderedSet;
    FModelMementos, FViewMementos: PMementoList;
    FOnElementsCreated: PModelsViewsEvent;
    FOnElementsDeleting: PModelsViewsEvent;
    FOnElementsDeleted: TNotifyEvent;
  protected
    procedure FreeAll;
    procedure Preprocess; override;
    procedure ElementsCreated;
    procedure ElementsDeleting;
    procedure ElementsDeleted;
  public
    constructor Create; override;
    destructor Destroy; override;
    property ModelSet: PModelOrderedSet read FModelSet;
    property ViewSet: PViewOrderedSet read FViewSet;
    property OnElementsCreated: PModelsViewsEvent read FOnElementsCreated write FOnElementsCreated;
    property OnElementsDeleting: PModelsViewsEvent read FOnElementsDeleting write FOnElementsDeleting;
    property OnElementsDeleted: TNotifyEvent read FOnElementsDeleted write FOnElementsDeleted;
  end;

  // PAbstractCreateElementsCommand
  // ---------------------------------------------------------------------------
  // is abstract class for commands related to creation of element
  // ---------------------------------------------------------------------------
  PAbstractCreateElementsCommand = class(PAbstractCreateDeleteElementsCommand)
  protected
    procedure Preprocess; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Execute; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PAbstractChangeModelsCommand
  // ---------------------------------------------------------------------------
  // is abstract class for commands related to change of Model element
  // ---------------------------------------------------------------------------
  PAbstractChangeModelsCommand = class(PAbstractCommand)
  private
    FModelSet: PModelOrderedSet;
    FOnModelsChanged: PModelsEvent;
  protected
    procedure ModelsChanged;
  public
    constructor Create; override;
    destructor Destroy; override;
    property ModelSet: PModelOrderedSet read FModelSet;
    property OnModelsChanged: PModelsEvent read FOnModelsChanged write FOnModelsChanged;
  end;

  // PAbstractChangeViewsCommand
  // ---------------------------------------------------------------------------
  // is abstract class for commands related to change of View element
  // ---------------------------------------------------------------------------
  PAbstractChangeViewsCommand = class(PAbstractCommand)
  private
    FViewSet: PViewOrderedSet;
    FSizePreservingViews: PViewOrderedSet;
    FWidthArray: TStringList;
    FHeightArray: TStringList;
    FOnViewsChanged: PViewsEvent;
  protected
    procedure ViewsChanged;
  public
    constructor Create; override;
    destructor Destroy; override;
    property ViewSet: PViewOrderedSet read FViewSet;
    property OnViewsChanged: PViewsEvent read FOnViewsChanged write FOnViewsChanged;
  end;

  // PAbstractChangeModelsViewsCommand
  // ---------------------------------------------------------------------------
  // is abstract class for commands related to simultaneous change of Model and View element
  // ---------------------------------------------------------------------------
  PAbstractChangeModelsViewsCommand = class(PAbstractCommand)
  private
    FModelSet: PModelOrderedSet;
    FViewSet: PViewOrderedSet;
    FOnModelsChanged: PModelsEvent;
    FOnViewsChanged: PViewsEvent;
  protected
    procedure ModelsChanged;
    procedure ViewsChanged;
  public
    constructor Create; override;
    destructor Destroy; override;
    property ModelSet: PModelOrderedSet read FModelSet;
    property ViewSet: PViewOrderedSet read FViewSet;
    property OnModelsChanged: PModelsEvent read FOnModelsChanged write FOnModelsChanged;
    property OnViewsChanged: PViewsEvent read FOnViewsChanged write FOnViewsChanged;
  end;

  // ---------------------------------------------------------------------------
  // PCreateModelCommand
  // ---------------------------------------------------------------------------
  // is a command for creating Model Element
  // ---------------------------------------------------------------------------
  PCreateModelCommand = class(PAbstractCreateElementsCommand)
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(Owner: PModel; ModelKind: string; Argument: Integer = 0;
      End1: PModel = nil; End2: PModel = nil; InsertIndex: Integer = -1;
      AuxArg: PModel = nil);
  end;

  // ---------------------------------------------------------------------------
  // PCreateExtendedModelCommand
  // ---------------------------------------------------------------------------
  // is a command for creating Model Element named "ModelPrototype"
  // ---------------------------------------------------------------------------
  PCreateExtendedModelCommand = class(PAbstractCreateElementsCommand)
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(Owner: PModel; Profile: string; ModelPrototype: string;
      End1: PModel = nil; End2: PModel = nil; InsertIndex: Integer = -1;
      AuxArg: PModel = nil);
  end;

  // ---------------------------------------------------------------------------
  // PCreateModelWithNameCommand
  // ---------------------------------------------------------------------------
  // is a command for creating a Model Element
  // ---------------------------------------------------------------------------
  PCreateModelWithNameCommand = class(PCreateModelCommand)
  public
    procedure SetParameter(Owner: PModel; ModelKind: string; Name: string = '');
  end;

  // PCreateDiagramCommand
  // ---------------------------------------------------------------------------
  // is command for creating a diagram element
  // ---------------------------------------------------------------------------
  PCreateDiagramCommand = class(PAbstractCreateElementsCommand)
  private
    function GetDiagram: PDiagram;
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(Owner: PModel; DiagramKind: string);
    property Diagram: PDiagram read GetDiagram;
  end;

  // PCreateExtendedDiagramCommand
  // ---------------------------------------------------------------------------
  // is command for creating diagram element which has DiagramType property
  // ---------------------------------------------------------------------------
  PCreateExtendedDiagramCommand = class(PAbstractCreateElementsCommand)
  private
    function GetDiagram: PDiagram;
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(Owner: PModel; Profile: string; DiagramType: string);
    property Diagram: PDiagram read GetDiagram;
  end;

  // PCreateViewCommand
  // ---------------------------------------------------------------------------
  // is command for creating View Element
  // which has no Model Reference like Note, Text.
  // ---------------------------------------------------------------------------
  PCreateViewCommand = class(PAbstractCreateElementsCommand)
  private
    procedure ComplementEdgeViews(DiagramView: PDiagramView; AView: PView);
    procedure FindViewByModel(DiagramView: PDiagramView; AModel: PModel; ASet: PViewOrderedSet);
    procedure SetViewProperties(V: PView; EP: PElementPrototype); overload;
    procedure SetViewProperties(V: PView); overload;
protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(DiagramView: PDiagramView; Model: PModel;
      ViewKind: string = ''; End1: PView = nil; End2: PView = nil); overload;
    procedure SetParameter(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
      Model: PModel; ViewKind: string = ''); overload;
  end;

  // PCreateElementCommand
  // ---------------------------------------------------------------------------
  // is command for creating View and Model Element simultaneously
  // - when to create element in Palette
  // ---------------------------------------------------------------------------
  PCreateElementCommand = class(PAbstractCreateElementsCommand)
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(DiagramView: PDiagramView; ElementKind: string;
      Argument: Integer = 0; End1: PView = nil; End2: PView = nil); overload;
    procedure SetParameter(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
      ElementKind: string; Argument: Integer = 0); overload;
  end;

  // PCreateExtendedElementCommand
  // ---------------------------------------------------------------------------
  // is command for creating View and Model Element extended from ElementPrototype simultaneously
  // - when to create element in Palette
  // ---------------------------------------------------------------------------
  PCreateExtendedElementCommand = class(PAbstractCreateElementsCommand)
  private
    procedure SetModelProperties(M: PModel; EP: PElementPrototype);
    procedure SetViewProperties(V: PView; EP: PElementPrototype);
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(DiagramView: PDiagramView; Profile: string;
      ElementPrototype: string; End1: PView = nil; End2: PView = nil); overload;
    procedure SetParameter(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
      Profile: string; ElementPrototype: string); overload;
  end;

  // PCreateViewByDragDropCommand
  // ---------------------------------------------------------------------------
  // is command for creating View Element by drag-and-drop to diagram
  // ---------------------------------------------------------------------------
  PNewViewByDragDropCommand = class(PCreateViewCommand)
  private
    function FindContainedView(ContainerView: PView; Model: PModel): PView;
    function FindViewInDiagramView(DiagramView: PDiagramView; Model: PModel; X, Y: Integer): PView;
    procedure SetParameterGeneralElem(DiagramView: PDiagramView; Model: PModel; X, Y: Integer);
    procedure SetParameterEdgeTypeElem(DiagramView: PDiagramView; Model: PModel; X, Y: Integer);
  public
    procedure SetParameter(DiagramView: PDiagramView; Model: PModel; X, Y: Integer);
  end;

  // PNewViewsByCopyPasteCommand
  // ---------------------------------------------------------------------------
  // is command for pasting  from Clipboard and creating View Element
  // ---------------------------------------------------------------------------
  PNewViewsByCopyPasteCommand = class(PCreateViewCommand)
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(Views: PViewOrderedSet; Target: PDiagramView);
  end;

  // PDeleteElementsCommand
  // ---------------------------------------------------------------------------
  // is command for deleting elements(Model and View)
  // ---------------------------------------------------------------------------
  PDeleteElementsCommand = class(PAbstractCreateDeleteElementsCommand)
  private
    ModelTable: PTable;
    ViewTable: PTable;
  protected
    function Precondition: Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(AModelSet: PModelOrderedSet; AViewSet: PViewOrderedSet);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PChangeModelsAttributeCommand
  // ---------------------------------------------------------------------------
  // is command for changing the attritues of Model elements
  // - all models must have changable property(key).
  // ---------------------------------------------------------------------------
  PChangeModelsAttributeCommand = class(PAbstractChangeModelsCommand)
  private
    OldValues: TStringList;
    Key: string;
    NewValue: string;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AModelSet: PModelOrderedSet; AKey: string; ANewValue: string);
  end;

  // PChangeModelsReferenceCommand
  // ---------------------------------------------------------------------------
  // is command for changing the Reference of Model elements
  // - All models must have changing reference(key)
  // ---------------------------------------------------------------------------
  PChangeModelsReferenceCommand = class(PAbstractChangeModelsCommand)
  private type
    PElementList = TList<PElement>;
  private
    OldValues: PElementList;
    Key: string;
    NewValue: PModel;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AModelSet: PModelOrderedSet; AKey: string; ANewValue: PModel);
  end;

  // PClearCollectionCommand
  // ---------------------------------------------------------------------------
  // remove all items in some collection of Model element
  // ---------------------------------------------------------------------------
  PClearCollectionCommand = class(PAbstractChangeModelsCommand)
  private
    Items: PElementOrderedSet;
    Element: PElement;
    Key: string;
  protected
    function Precondition: Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AElement: PModel; AKey: string);
  end;

  // PAddCollectionItemCommand
  // ---------------------------------------------------------------------------
  // is command for adding new item to some collection of Model element
  // ---------------------------------------------------------------------------
  PAddCollectionItemCommand = class(PAbstractChangeModelsCommand)
  private
    Element: PElement;
    Key: string;
    Value: PElement;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AElement: PElement; AKey: string; AValue: PElement);
  end;

  // PRemoveCollectionItemCommand
  // ---------------------------------------------------------------------------
  // is the command for removing item from some collection of Model element
  // ---------------------------------------------------------------------------
  PRemoveCollectionItemCommand = class(PAbstractChangeModelsCommand)
  private
    Element: PElement;
    Key: string;
    Value: PElement;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AElement: PElement; AKey: string; AValue: PElement);
  end;

  // PInsertCollectionItemCommand
  // ---------------------------------------------------------------------------
  // is command for adding item at the indexed position in some collection of Model element
  // ---------------------------------------------------------------------------
  PInsertCollectionItemCommand = class(PAbstractChangeModelsCommand)
  private
    Element: PElement;
    Key: string;
    Value: PElement;
    Index: Integer;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AElement: PElement; AKey: string; AIndex: Integer; AValue: PElement);
  end;

  // PDeleteCollectionItemCommand
  // ---------------------------------------------------------------------------
  // is the command to remove the item existing at indexed position from collection of Model element
  // ---------------------------------------------------------------------------
  PDeleteCollectionItemCommand = class(PAbstractChangeModelsCommand)
  private
    Element: PElement;
    Key: string;
    Index: Integer;
    Value: PElement;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AElement: PElement; AKey: string; AIndex: Integer);
  end;

  // PChangeCollectionItemOrderCommand
  // ---------------------------------------------------------------------------
  // is the command to change the indexed item in some collection of Model element
  // ---------------------------------------------------------------------------
  PChangeCollectionItemOrderCommand = class(PAbstractChangeModelsCommand)
  private
    Element: PElement;
    FCollectionItem: PElement;
    Key: string;
    OldIndex: Integer;
    NewIndex: Integer;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AElement: PElement; ACollectionItem: PElement; AKey: string; ANewIndex: Integer);
    property CollectionItem: PElement read FCollectionItem;
  end;

  // PChangeTypeExpressionCommand
  // ---------------------------------------------------------------------------
  // is the command to change the Type/TypeExpression property of
  // StructuralFeature or Parameter model
  // ---------------------------------------------------------------------------
  PChangeTypeExpressionCommand = class(PAbstractChangeModelsCommand)
  private
    Model: PModel;
    OldTypeExpr: string;
    OldTypeRef: PModel;
    NewTypeExpr: string;
    NewTypeRef: PModel;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AModel: PModel; TypeExpr: string; TypeRef: PModel);
  end;

  // PChangeValueExpressionCommand
  // ---------------------------------------------------------------------------
  // is the command to change the Value/ValueExpression of AttributeLink Model
  // ---------------------------------------------------------------------------
  PChangeValueExpressionCommand = class(PAbstractChangeModelsCommand)
  private
    Model: PModel;
    OldValueExpr: string;
    OldValueRef: PModel;
    NewValueExpr: string;
    NewValueRef: PModel;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AModel: PModel; ValueExpr: string; ValueRef: PModel);
  end;

  // PChangeActionKindCommand
  // ---------------------------------------------------------------------------
  // is the command to change the Action property of Stimulus or Message model
  // ---------------------------------------------------------------------------
  PChangeActionKindCommand = class(PAbstractCreateDeleteElementsCommand)
  private
    Model: PModel;
    OldAction: PUMLAction;
    NewAction: PUMLAction;
    OldActionMemento: PMemento;
    NewActionMemento: PMemento;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AModel: PModel; ActionKind: string);
  end;

  // PChangeDocumentationCommand
  // ---------------------------------------------------------------------------
  // is the command to change model element's documentation
  // ---------------------------------------------------------------------------
  PChangeDocumentationCommand = class(PAbstractChangeModelsCommand)
  private
    Model: PModel;
    OldDocumentation: string;
    NewDocumentation: string;
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(AModel: PModel; ANewDocumentation: string);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PChangeContainmentCommand
  // ---------------------------------------------------------------------------
  // is the command for a model element to relocate
  // - when to drag from ModelExplorer and drop to another model
  // ---------------------------------------------------------------------------
  PRelocateModelsCommand = class(PAbstractCreateDeleteElementsCommand)
  private
    ContainmentTable: PTable;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(AModelSet: PModelOrderedSet; ContainerModel: PModel);
    procedure Execute; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PNewModelByCopyPasteCommand
  // ---------------------------------------------------------------------------
  // is the command to paste Model element into some model element
  // ---------------------------------------------------------------------------
  PNewModelByCopyPasteCommand = class(PAbstractCreateElementsCommand)
  private
    Model: PModel;
    Owner: PModel;
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(AModel, ATarget: PModel);
  end;

  // PAddConstraintCommand
  // ---------------------------------------------------------------------------
  // is the command to add new constraint to model element
  // ---------------------------------------------------------------------------
  PAddConstraintCommand = class(PAbstractChangeModelsCommand)
  private
    ExtensibleModel: PExtensibleModel;
    FConstraint: PConstraint;
  protected
    function Precondition: Boolean; override;
  public
    destructor Destroy; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint);
    property Constraint: PConstraint read FConstraint;
  end;

  // PDeleteConstraintCommand
  // ---------------------------------------------------------------------------
  // is the command to remove a constraint from model element
  // ---------------------------------------------------------------------------
  PDeleteConstraintCommand = class(PAbstractChangeModelsCommand)
  private
    ExtensibleModel: PExtensibleModel;
    Constraint: PConstraint;
  protected
    function Precondition: Boolean; override;
  public
    destructor Destroy; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint);
  end;

  // PChangeConstraintCommand
  // ---------------------------------------------------------------------------
  // is the command to change model element's contraint
  // ---------------------------------------------------------------------------
  PChangeConstraintCommand = class(PAbstractChangeModelsCommand)
  private
    ExtensibleModel: PExtensibleModel;
    Constraint: PConstraint;
    OldConstraintName: string;
    OldConstraintBody: string;
    NewConstraintName: string;
    NewConstraintBody: string;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint; AName: string; ABody: string);
  end;

  // PSetDataTaggedValueCommand
  // ---------------------------------------------------------------------------
  // is the command to change TaggedValue's contents of Model element
  // - if TaggedValue exists, it changes only value(DataValue)
  // - if not exists, it creates new TaggedValue and assign value(DataValue)
  // ---------------------------------------------------------------------------
  PSetDataTaggedValueCommand = class(PAbstractChangeModelsCommand)
  private
    ExtensibleModel: PExtensibleModel;
    ProfileName: string;
    TagDefinitionSetName: string;
    TagName: string;
    TaggedValue: PTaggedValue;
    OldDataValue: string;
    NewDataValue: string;
    NeedToCreate: Boolean;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string; AValue: string);
  end;

  // PSetReferenceTaggedValueCommand
  // ---------------------------------------------------------------------------
  // is the command to change TaggedValue's contents of Reference type of Model element
  // ---------------------------------------------------------------------------
  PSetReferenceTaggedValueCommand = class(PAbstractChangeModelsCommand)
  private
    ExtensibleModel: PExtensibleModel;
    ProfileName: string;
    TagDefinitionSetName: string;
    TagName: string;
    TaggedValue: PTaggedValue;
    NewReferenceValue: PExtensibleModel;
    OldReferenceValue: PExtensibleModel;
    NeedToCreate: Boolean;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string; AValue: PExtensibleModel);
  end;

  // PSetTaggedValueAsDefaultCommand
  // ---------------------------------------------------------------------------
  // sets Model element's TaggedValue to default value
  // - delete appropriate TaggedValue instance if there exists
  // ---------------------------------------------------------------------------
  PSetTaggedValueAsDefaultCommand = class(PAbstractChangeModelsCommand)
  private
    Items: PExtensibleModelOrderedSet;
    ExtensibleModel: PExtensibleModel;
    ProfileName: string;
    TagDefinitionSetName: string;
    TagName: string;
    TaggedValue: PTaggedValue;
  protected
    function Precondition: Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string);
  end;

  // PAddCollectionTaggedValueCommand
  // ---------------------------------------------------------------------------
  // is the command to add collection item of Collection-typed TaggedValue of Model element
  // ---------------------------------------------------------------------------
  PAddCollectionTaggedValueCommand = class(PAbstractChangeModelsCommand)
  private
    ExtensibleModel: PExtensibleModel;
    ProfileName: string;
    TagDefinitionSetName: string;
    TagName: string;
    TaggedValue: PTaggedValue;
    ReferenceValue: PExtensibleModel;
    NeedToCreate: Boolean;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string; AValue: PExtensibleModel);
  end;

  // PRemoveCollectionTaggedValueCommand
  // ---------------------------------------------------------------------------
  // is the command to remove collection item of collection-typed TaggedValue of model element
  // ---------------------------------------------------------------------------
  PRemoveCollectionTaggedValueCommand = class(PAbstractChangeModelsCommand)
  private
    ExtensibleModel: PExtensibleModel;
    ProfileName: string;
    TagDefinitionSetName: string;
    TagName: string;
    TaggedValue: PTaggedValue;
    ReferenceValue: PExtensibleModel;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string; AValue: PExtensibleModel);
  end;

  // PInsertCollectionTaggedValueCommand
  // ---------------------------------------------------------------------------
  // is the command to insert collection item of collection-typed TaggedValue
  // of model element at indexed position
  // ---------------------------------------------------------------------------
  PInsertCollectionTaggedValueCommand = class(PAbstractChangeModelsCommand)
  private
    ExtensibleModel: PExtensibleModel;
    ProfileName: string;
    TagDefinitionSetName: string;
    TagName: string;
    TaggedValue: PTaggedValue;
    ReferenceValue: PExtensibleModel;
    NeedToCreate: Boolean;
    Index: Integer;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string; Idx: Integer; AValue: PExtensibleModel);
  end;

  // PDeleteCollectionTaggedValueCommand
  // ---------------------------------------------------------------------------
  // is the command to remove collection item of collection-typed TaggedValue
  // of model element at indexd position
  // ---------------------------------------------------------------------------
  PDeleteCollectionTaggedValueCommand = class(PAbstractChangeModelsCommand)
  private
    ExtensibleModel: PExtensibleModel;
    ProfileName: string;
    TagDefinitionSetName: string;
    TagName: string;
    TaggedValue: PTaggedValue;
    ReferenceValue: PExtensibleModel;
    Index: Integer;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string; Idx: Integer);
  end;

  // PChangeCollectionTaggedValueOrderCommand
  // ---------------------------------------------------------------------------
  // is the command to change collection item order of collection-typed TaggedValue
  // ---------------------------------------------------------------------------
  PChangeCollectionTaggedValueOrderCommand = class(PAbstractChangeModelsCommand)
  private
    ExtensibleModel: PExtensibleModel;
    ProfileName: string;
    TagDefinitionSetName: string;
    TagName: string;
    TaggedValue: PTaggedValue;
    ReferenceValue: PExtensibleModel;
    OldIndex: Integer;
    NewIndex: Integer;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string;
      AValue: PExtensibleModel; NewIdx: Integer);
  end;

  // PClearAttachmentsCommand
  // ---------------------------------------------------------------------------
  // is the command to delete all attachments of model element
  // ---------------------------------------------------------------------------
  PClearAttachmentsCommand = class(PAbstractChangeModelsCommand)
  private
    Model: PModel;
    Attachments: string;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AModel: PModel);
  end;

  // PAddAttachmentCommand
  // ---------------------------------------------------------------------------
  // is the command to add new attachment(URL or File, etc) to model element
  // ---------------------------------------------------------------------------
  PAddAttachmentCommand = class(PAbstractChangeModelsCommand)
  private
    Model: PModel;
    Attachment: string;
    Index: Integer;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AModel: PModel; Attach: string);
  end;

  // PInsertAttachmentCommand
  // ---------------------------------------------------------------------------
  // is the command to insert new attachment(URL or File, etc) at indexed
  // position of model element
  // ---------------------------------------------------------------------------
  PInsertAttachmentCommand = class(PAbstractChangeModelsCommand)
  private
    Model: PModel;
    Attachment: string;
    Index: Integer;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AModel: PModel; Attach: string; AIndex: Integer);
  end;

  // PDeleteAttachmentCommand
  // ---------------------------------------------------------------------------
  // is the command to delete attachement from model element
  // ---------------------------------------------------------------------------
  PDeleteAttachmentCommand = class(PAbstractChangeModelsCommand)
  private
    Model: PModel;
    Attachment: string;
    Index: Integer;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AModel: PModel; Idx: Integer);
  end;

  // PChangeAttachmentCommand
  // ---------------------------------------------------------------------------
  // is the command to change attachment's contents of model element
  // ---------------------------------------------------------------------------
  PChangeAttachmentCommand = class(PAbstractChangeModelsCommand)
  private
    Model: PModel;
    Attachment: string;
    Index: Integer;
    OldAttachment: string;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AModel: PModel; Idx: Integer; Attach: string);
  end;

  // PChangeAttachmentOrderCommand
  // ---------------------------------------------------------------------------
  // is the command to change attachment order in model element
  // ---------------------------------------------------------------------------
  PChangeAttachmentOrderCommand = class(PAbstractChangeModelsCommand)
  private
    Model: PModel;
    OldIndex: Integer;
    NewIndex: Integer;
  protected
    function Precondition: Boolean; override;
  public
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AModel: PModel; Idx: Integer; NewIdx: Integer);
  end;

  // PMoveViewsCommand
  // ---------------------------------------------------------------------------
  // is the command to move views
  // ---------------------------------------------------------------------------
  PMoveViewsCommand = class(PAbstractChangeViewsCommand)
  private
    DiagramView: PDiagramView;
    DX: Integer;
    DY: Integer;
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(ADiagramView: PDiagramView; AViewSet: PViewOrderedSet; ADX, ADY: Integer);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PMoveParasiticViewCommand
  // ---------------------------------------------------------------------------
  // is the command to move view(Parasitic View)
  // ---------------------------------------------------------------------------
  PMoveParasiticViewCommand = class(PAbstractChangeViewsCommand)
  private
    ParasiticView: PParasiticView;
    OldAlpha: Extended;
    OldDistance: Extended;
    NewAlpha: Extended;
    NewDistance: Extended;
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(AParasiticView: PParasiticView; Alpha, Distance: Extended);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PResizeNodeCommand
  // ---------------------------------------------------------------------------
  // is the command to change Node View's size
  // ---------------------------------------------------------------------------
  PResizeNodeCommand = class(PAbstractChangeViewsCommand)
  private
    Node: PNodeView;
    NewRect: TRect;
    OldRect: TRect;
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(ANode: PNodeView; ARect: TRect);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PReshapeEdgeCommand
  // ---------------------------------------------------------------------------
  // is the command to change edge view's shape(line bend form)
  // ---------------------------------------------------------------------------
  PReshapeEdgeCommand = class(PAbstractChangeViewsCommand)
  private
    Edge: IModifiableEdge;
    NewPoints: PPoints;
    OldPoints: PPoints;
  protected
    function Precondition: Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(AEdge: IModifiableEdge; APoints: PPoints);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PChangeViewsAttributeCommand
  // ---------------------------------------------------------------------------
  // is the command to change Attribute Value of view elements
  // - if view has no attribute(Key), it's ignored
  // ---------------------------------------------------------------------------
  PChangeViewsAttributeCommand = class(PAbstractChangeViewsCommand)
  private
    OldValues: TStringList;
    Key: string;
    NewValue: string;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
    procedure SetParameter(AViewSet: PViewOrderedSet; AKey: string; ANewValue: string);
  end;

  // PChangeViewsLineColorCommand
  // ---------------------------------------------------------------------------
  // is the command to change the color of line of view elements
  // ---------------------------------------------------------------------------
  PChangeViewsLineColorCommand = class(PAbstractChangeViewsCommand)
  private
    OldLineColors: TStringList;
    NewLineColor: TColor;
  protected
    function Precondition: Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(AViewSet: PViewOrderedSet; ANewLineColor: TColor);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PChangeViewsFillColorCommand
  // ---------------------------------------------------------------------------
  // is the command to change the fill color or view elements
  // ---------------------------------------------------------------------------
  PChangeViewsFillColorCommand = class(PAbstractChangeViewsCommand)
  private
    OldFillColors: TStringList;
    NewFillColor: TColor;
  protected
    function Precondition: Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(AViewSet: PViewOrderedSet; ANewFillColor: TColor);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PChangeViewsFontCommand
  // ---------------------------------------------------------------------------
  // is the command to change the font of view elements
  // ---------------------------------------------------------------------------
  PChangeViewsFontCommand = class(PAbstractChangeViewsCommand)
  private type
    PFontList = TList<TFont>;
  private
    ChangedFontItems: PFontItemKinds;
    OldFonts: PFontList;
    NewFont: TFont;
    procedure StoreOldFonts(AViewSet: PViewOrderedSet);
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(AViewSet: PViewOrderedSet; ANewFont: TFont; AChangedFontItems: PFontItemKinds);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PChangeEdgesLineStyleCommand
  // ---------------------------------------------------------------------------
  // is the command to change the line style(Rectilinear, Oblique) of edge view elements
  // ---------------------------------------------------------------------------
  PChangeEdgesLineStyleCommand = class(PAbstractChangeViewsCommand)
  private type
    POldLineStylesList = TList<PLineStyleKind>;
    PPointsList = TList<PPoints>;
  private
    OldLineStyles: POldLineStylesList;
    OldPoints: PPointsList;
    NewLineStyle: PLineStyleKind;
  protected
    function Precondition: Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(AEdgeSet: PViewOrderedSet; ANewLineStyle: PLineStyleKind);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

    // PChangeAnnotationLineStyleCommand
  // ---------------------------------------------------------------------------
  // is the command to change the annotation line style(Solid, Dash etc.) of Annotation view elements
  // ---------------------------------------------------------------------------
  PChangeAnnotationLineStyleCommand = class(PAbstractChangeViewsCommand)
  private type
    POldLineStylesList = TList<PLineKind>;
  private
    OldLineStyles: POldLineStylesList;
    NewLineStyle: PLineKind;
  protected
    function Precondition: Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(AEdgeSet: PViewOrderedSet; ANewLineStyle: PLineKind);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;


  // PChangeNoteViewStringsCommand
  // ---------------------------------------------------------------------------
  // is the command to change the text data of elements like note and text view
  // ---------------------------------------------------------------------------
  PChangeNoteViewStringsCommand = class(PAbstractChangeViewsCommand)
  private
    OldText: string;
    NewText: string;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    procedure SetParameter(Views: PViewOrderedSet; Strs: string);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PSendToBackViewsCommand
  // ---------------------------------------------------------------------------
  // is the command to send selected views to last of depth
  // ---------------------------------------------------------------------------
  PSendToBackViewsCommand = class(PAbstractChangeViewsCommand)
  private
    OldIndices: TStringList;
  protected
    function Precondition: Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(Views: PViewOrderedSet);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PBringToFrontViewsCommand
  // ---------------------------------------------------------------------------
  // is the command to send selected views in front of depth
  // ---------------------------------------------------------------------------
  PBringToFrontViewsCommand = class(PAbstractChangeViewsCommand)
  private
    OldIndices: TStringList;
  protected
    function Precondition: Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(Views: PViewOrderedSet);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PAlignViewsCommand
  // ---------------------------------------------------------------------------
  // is the command to arrange Views(Node View)
  // ---------------------------------------------------------------------------
  PAlignViewsCommand = class(PAbstractChangeViewsCommand)
  private
    OldPositions: PPoints;
    AlignmentKind: PAlignmentKind;
  protected
    function Precondition: Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(Views: PViewOrderedSet; Alignment: PAlignmentKind);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PLayoutDiagramCommand
  // ---------------------------------------------------------------------------
  // is the command to arrange diagram's views automatically
  // ---------------------------------------------------------------------------
  PLayoutDiagramCommand = class(PAbstractChangeViewsCommand)
  private type
    PNodeViewOrderedSet = POrderedSet<PNodeView>;
    PEdgeViewOrderedSet = POrderedSet<PEdgeView>;
    PPointsList = TList<PPoints>;
  private
    DiagramView: PDiagramView;
    Nodes: PNodeViewOrderedSet;
    Edges: PEdgeViewOrderedSet;
    OldNodePositions: PPoints;
    OldEdgeLineStyles: TStringList;
    OldEdgePoints: PPointsList;
  protected
    function Precondition: Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(ADiagramView: PDiagramView);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PAbstractApplyExpressionCommand
  // ---------------------------------------------------------------------------
  // is the abstract class for command to process change of text value
  // in Quick-Dialog
  // ---------------------------------------------------------------------------
  PAbstractApplyExpressionCommand = class(PAbstractChangeModelsCommand)
  protected
    FModel: PUMLModelElement;
    FOldProfile: string;
    FOldStereotype: string;
    FOldVisibility: PUMLVisibilityKind;
    FOldName: string;
    FNewProfile: string;
    FNewStereotype: string;
    FNewVisibility: PUMLVisibilityKind;
    FNewName: string;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
    function SymbolToUMLVisibilityKind(Value: string): PUMLVisibilityKind;
    function GetProfile(M: PExtensibleModel; StereotypeStr: string): string;
  public
    procedure SetParameter(AModelSet: PModelOrderedSet; Value: string); virtual;
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PApplyGeneralNameExpressionCommand
  // ---------------------------------------------------------------------------
  // is the command to change the Stereotype and Name property of model
  // ---------------------------------------------------------------------------
  PApplyGeneralNameExpressionCommand = class(PAbstractApplyExpressionCommand)
  public
    procedure SetParameter(AModelSet: PModelOrderedSet; Value: string); override;
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PApplyClassifierRoleExpressionCommand
  // ---------------------------------------------------------------------------
  // is the command to change the Stereotype, Name property, and Base Reference
  // of ClassifierRole type Model
  // ---------------------------------------------------------------------------
  PApplyClassifierRoleExpressionCommand = class(PAbstractApplyExpressionCommand)
  private
    FOldBase: PUMLClassifier;
    FNewBase: PUMLClassifier;
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(AModelSet: PModelOrderedSet; Value: string); override;
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PApplyObjectExpressionCommand
  // ---------------------------------------------------------------------------
  // is the command to change the Stereotype, Name property, Classifier Reference
  // of Object type Model
  // ---------------------------------------------------------------------------
  PApplyInstanceExpressionCommand = class(PAbstractApplyExpressionCommand)
  private
    FOldClassifier: PUMLClassifier;
    FNewClassifier: PUMLClassifier;
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(AModelSet: PModelOrderedSet; Value: string); override;
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PApplyAttributeExpressionCommand
  // ---------------------------------------------------------------------------
  // is the command to change Stereotype, Name, InitialValue property, and
  // Type Information of Attribute type Model
  // ---------------------------------------------------------------------------
  PApplyAttributeExpressionCommand = class(PAbstractApplyExpressionCommand)
  private
    FOldTypeExpression: string;
    FOldType: PUMLClassifier;
    FOldMultiplicity: string;
    FOldOrdering: PUMLOrderingKind;
    FOldInitialValue: string;
    FNewTypeExpression: string;
    FNewType: PUMLClassifier;
    FNewMultiplicity: string;
    FNewOrdering: PUMLOrderingKind;
    FNewInitialValue: string;
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(AModelSet: PModelOrderedSet; Value: string); override;
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PApplyOperationExpressionCommnad
  // ---------------------------------------------------------------------------
  // is the command to change the Stereotype, Name property, and Parameter
  // information of Operation type Model
  // ---------------------------------------------------------------------------
  PApplyOperationExpressionCommnad = class(PAbstractCreateDeleteElementsCommand)
  private
    FOldVisibility: PUMLVisibilityKind;
    FOldProfile: string;
    FOldStereotype: string;
    FOldName: string;
    FOldParameters: PModelOrderedSet;
    FNewVisibility: PUMLVisibilityKind;
    FNewProfile: string;
    FNewStereotype: string;
    FNewName: string;
    FNewParameters: PModelOrderedSet;
    FIsParameterChanged: Boolean;
    // Events
    FOnModelsChanged: PModelsEvent;
    function MakeParameterModel(AKind, AName, AType, AInitValue: string): PUMLParameter;
    function CheckNameExisting(Value: string): Boolean;
    function AssignNewParameterName: string;
    function GetProfile(M: PExtensibleModel; StreotypeStr: string): string;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
    procedure ModelsChanged;
    procedure ElementsCreated(IsUnexecuting: Boolean); reintroduce;
    procedure ElementsDeleting(IsUnexecuting: Boolean); reintroduce;
    procedure ElementsDeleted; reintroduce;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(AModelSet: PModelOrderedSet; Value: string);
    procedure Reexecute; override;
    procedure Unexecute; override;
    property OnModelsChanged: PModelsEvent read FOnModelsChanged write FOnModelsChanged;
  end;

  // PApplyMessageExpressionCommnad
  // ---------------------------------------------------------------------------
  // is the command to change Message/Stimulus type Model's Stereotype,
  // Iteration, Branch, Return, Arguments property, and Name or Action's
  // Operation/Signal/Instantiation reference
  // ---------------------------------------------------------------------------
  PApplyMessageExpressionCommnad = class(PAbstractApplyExpressionCommand)
  private
    FOldIteration: string;
    FOldBranch: string;
    FOldReturn: string;
    FOldArguments: string;
    FOldOperation: PUMLOperation;
    FOldSignal: PUMLSignal;
    FOldInstantiation: PUMLClassifier;
    FNewIteration: string;
    FNewBranch: string;
    FNewReturn: string;
    FNewArguments: string;
    FNewOperation: PUMLOperation;
    FNewSignal: PUMLSignal;
    FNewInstantiation: PUMLClassifier;
    function GetTargetClassifierModel(AModel: PModel): PUMLClassifier;
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(AModelSet: PModelOrderedSet; Value: string); override;
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PMoveViewsChangingContainerViewCommand
  PMoveViewsChaningContainerViewCommand = class(PRelocateModelsCommand)
  private
    FViewSet: PViewOrderedSet;
    FOnViewsChanged: PViewsEvent;
    ViewTable: PTable;
    DiagramView: PDiagramView;
    DX, DY: Integer;
  protected
    function Precondition: Boolean; override;
    procedure ViewsChanged;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(ADiagramView: PDiagramView; AViewSet: PViewOrderedSet; ADX, ADY: Integer; AContainerView: PView);
    procedure Reexecute; override;
    procedure Unexecute; override;
    property ViewSet: PViewOrderedSet read FViewSet;
    property OnViewsChanged: PViewsEvent read FOnViewsChanged write FOnViewsChanged;
  end;

  // PChangeModelsStereotypeCommand
  // ---------------------------------------------------------------------------
  // is the command to change model element's sterotype
  // ---------------------------------------------------------------------------
  PChangeModelsStereotypeCommand = class(PAbstractChangeModelsCommand)
  private
    OldProfiles: TStringList;
    OldStereotypes: TStringList;
    NewProfile: string;
    NewStereotype: string;
  protected
    function Precondition: Boolean; override;
    procedure Preprocess; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(AModelSet: PModelOrderedSet; ANewProfile: string; ANewStereotype: string);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PAbstractChangeCreateDeleteElementsCommand
  // ---------------------------------------------------------------------------
  // is the abstract class for the command to affect creation and deletion of other element
  // ---------------------------------------------------------------------------
  PAbstractChangeCreateDeleteElementsCommand = class(PAbstractCreateDeleteElementsCommand)
  private
    FChangingModels: PModelOrderedSet;
    FChangingViews: PViewOrderedSet;
    FOnModelsChanged: PModelsEvent;
    FOnViewsChanged: PViewsEvent;
  protected
    procedure ModelsChanged;
    procedure ViewsChanged;
  public
    constructor Create; override;
    destructor Destroy; override;
    property ChangingModels: PModelOrderedSet read FChangingModels;
    property ChangingViews: PViewOrderedSet read FChangingViews;
    property OnModelsChanged: PModelsEvent read FOnModelsChanged write FOnModelsChanged;
    property OnViewsChanged: PViewsEvent read FOnViewsChanged write FOnViewsChanged;
  end;

  // PAbstractChangeCreateElementsCommand
  // ---------------------------------------------------------------------------
  // is the abstract class for command to affect creating other element from changing element
  // ---------------------------------------------------------------------------
  PAbstractChangeCreateElementsCommand = class(PAbstractCreateElementsCommand)
  private
    FChangingModels: PModelOrderedSet;
    FChangingViews: PViewOrderedSet;
    FOnModelsChanged: PModelsEvent;
    FOnViewsChanged: PViewsEvent;
  protected
    procedure ModelsChanged;
    procedure ViewsChanged;
  public
    constructor Create; override;
    destructor Destroy; override;
    property ChangingModels: PModelOrderedSet read FChangingModels;
    property ChangingViews: PViewOrderedSet read FChangingViews;
    property OnModelsChanged: PModelsEvent read FOnModelsChanged write FOnModelsChanged;
    property OnViewsChanged: PViewsEvent read FOnViewsChanged write FOnViewsChanged;
  end;

  // PReconnectEdgeCommand
  // ---------------------------------------------------------------------------
  // is the command to change line sytle connected to view
  // ---------------------------------------------------------------------------
  PReconnectEdgeCommand = class(PAbstractChangeCreateDeleteElementsCommand)
  private
    Edge: PEdgeView;
    NewPoints: PPoints;
    OldPoints: PPoints;
    NewPartView: PView;
    OldPartView: PView;
    NewLineStyle: PLineStyleKind;
    OldLineStyle: PLineStyleKind;
    IsTailSide: Boolean;
    ViewTable: PTable;
  protected
    function Precondition: Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetParameter(AEdge: PEdgeView; APoints: PPoints; ANewParicipant: PView; AIsTailSide: Boolean);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PChangeModelReferenceWithNamedModelCreatingCommand
  // ---------------------------------------------------------------------------
  // is the command to assign reference value to other element's reference value
  // after creation (ClassifierRole, Object's Classifier / Message, Stimulus's Operation)
  // ---------------------------------------------------------------------------
  PChangeModelReferenceWithNamedModelCreatingCommand = class(PAbstractChangeCreateElementsCommand)
  private
    Key: string;
    OldValue, NewValue: PModel;
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(AModel: PModel; AKey: string; Owner: PModel; ModelKind: string; Name: string = '');
    procedure Execute; override;
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;

  // PResizeFragmentedNodeCommand
  // ---------------------------------------------------------------------------
  // is the command to change the size of view elements of Fragmented node
  // like PUMLInteractionOperand
  // ---------------------------------------------------------------------------
  PResizeFragmentedNodeCommand = class(PAbstractChangeViewsCommand)
  private
    Node: PNodeView;
    NewRect: TRect;
    OldRect: TRect;
    ResizeContainer: Boolean;
    function GetLowestContainedNodeView(AContainerView: PView): PNodeView;
  protected
    function Precondition: Boolean; override;
  public
    procedure SetParameter(ANode: PNodeView; ARect: TRect);
    procedure Reexecute; override;
    procedure Unexecute; override;
  end;



  ///////////////////////////////////////////////////////////////////////////
  // Reusable helper functions

procedure SetViewPropertiesImpl(V: PView; EP: PElementPrototype);
var
  I: Integer;
begin
  if (V is PUMLGeneralNodeView) and (EP.StereotypeDisplay <> '') then begin
    V.MOF_SetAttribute('StereotypeDisplay', EP.StereotypeDisplay);
    if EP.StereotypeDisplay = 'sdkIcon' then begin
      if V is PUMLClassifierView then begin
        V.MOF_SetAttribute('SuppressAttributes', 'True');
        V.MOF_SetAttribute('SuppressOperations', 'True');
      end
      else if V is PUMLSubSystemView then
        V.MOF_SetAttribute('SuppressOperations', 'True')
      else if V is PUMLEnumerationView then
        V.MOF_SetAttribute('SuppressLieterals', 'True');
    end;
  end;
  V.MOF_SetAttribute('ShowExtendedNotation', BoolToStr(EP.ShowExtendedNotation, True));
  for I := 0 to EP.ViewPropertyCount - 1 do
    V.MOF_SetAttribute(EP.ViewPropertyNames[I], EP.ViewPropertyValues[I]);
end;



////////////////////////////////////////////////////////////////////////////////
// PCommandExecutor

constructor PCommandExecutor.Create;
begin
  inherited;
  ModelSet := PModelOrderedSet.Create;
  ViewSet := PViewOrderedSet.Create;
  Engine := PEngine.Create;
  Engine.OnCommandExecuted := EngineCommandExecutedHandler;
  Engine.OnCommandUnexecuted := EngineCommandUnexecutedHandler;
  UndoLevel := 100;
end;

destructor PCommandExecutor.Destroy;
begin
  ModelSet.Free;
  ViewSet.Free;
  Engine.Free;
  inherited;
end;

procedure PCommandExecutor.BeginGrouping;
begin
  Engine.BeginGrouping;
end;

procedure PCommandExecutor.EndGrouping;
begin
  Engine.EndGrouping;
end;

function PCommandExecutor.IsGroupingMode: Boolean;
begin
  Result := Engine.IsGroupingMode;
end;

function PCommandExecutor.ToUndoIsGroup: Boolean;
begin
  Result := Engine.ToUnexecuteIsGroup;
end;

function PCommandExecutor.ToRedoIsGroup: Boolean;
begin
  Result := Engine.ToReexecuteIsGroup;
end;

function PCommandExecutor.GetUndoLevel: Integer;
begin
 Result := Engine.Capacity;
end;

procedure PCommandExecutor.SetUndoLevel(Value: Integer);
begin
  if Engine.Capacity <> Value then
  begin
    Engine.Capacity := Value;
  end;
end;

procedure PCommandExecutor.ElementsCreated(Sender: TObject; Models: PModelOrderedSet; Views: PViewOrderedSet);
begin
  if Assigned(FOnElementsCreated) then
    FOnElementsCreated(Self, Models, Views);
end;

procedure PCommandExecutor.ElementsDeleting(Sender: TObject; Models: PModelOrderedSet; Views: PViewOrderedSet);
begin
  if Assigned(FOnElementsDeleting) then
    FOnElementsDeleting(Self, Models, Views);
end;

procedure PCommandExecutor.ElementsDeleted(Sender: TObject);
begin
  if Assigned(FOnElementsDeleted) then
    FOnElementsDeleted(Self);
end;

procedure PCommandExecutor.ModelsChanged(Sender: TObject; Models: PModelOrderedSet);
begin
  if Assigned(FOnModelsChanged) then
    FOnModelsChanged(Self, Models);
end;

procedure PCommandExecutor.ViewsChanged(Sender: TObject; Views: PViewOrderedSet);
begin
  if Assigned(FOnViewsChanged) then
    FOnViewsChanged(Self, Views);
end;

procedure PCommandExecutor.ErrorOccurred(Sender: TObject; ErrorMessage: string);
begin
  if Assigned(FOnError) then
    FOnError(Self, ErrorMessage);
end;

procedure PCommandExecutor.EngineCommandExecutedHandler(Sender: TObject; Command: PCommand);
begin
  if Assigned(FOnCommandExecuted) then
    FOnCommandExecuted(Self, Command);
  CommandHistoryChanged;
end;

procedure PCommandExecutor.EngineCommandUnexecutedHandler(Sender: TObject; Command: PCommand);
begin
  if Assigned(FOnCommandUnexecuted) then
    FOnCommandUnexecuted(Self, Command);
  CommandHistoryChanged;
end;

procedure PCommandExecutor.CommandHistoryChanged;
begin
  if Assigned(FOnCommandHistoryChanged) then
    FOnCommandHistoryChanged(Self);
end;

function PCommandExecutor.NewModel(Owner: PModel; ModelKind: string;
  Argument: Integer = 0; End1: PModel = nil; End2: PModel = nil;
  InsertIndex: Integer = -1; AuxArg: PModel = nil): PModel;
var
  Cmd: PCreateModelCommand;
begin
  Cmd := PCreateModelCommand.Create;
  Cmd.SetParameter(Owner, ModelKind, Argument, End1, End2, InsertIndex, AuxArg);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.ModelSet[0];
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Result := nil;
  end;
end;

function PCommandExecutor.NewExtendedModel(Owner: PModel; Profile: string;
  ModelPrototype: string; End1: PModel = nil; End2: PModel = nil;
  InsertIndex: Integer = -1; AuxArg: PModel = nil): PModel;
var
  Cmd: PCreateExtendedModelCommand;
begin
  Cmd := PCreateExtendedModelCommand.Create;
  Cmd.SetParameter(Owner, Profile, ModelPrototype, End1, End2, InsertIndex, AuxArg);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.ModelSet[0];
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Result := nil;
  end;
end;

function PCommandExecutor.NewModelWithName(Owner: PModel; ModelKind: string; Name: string = ''): PModel;
var
  Cmd: PCreateModelWithNameCommand;
begin
  Cmd := PCreateModelWithNameCommand.Create;
  Cmd.SetParameter(Owner, ModelKind, Name);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.ModelSet[0];
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Result := nil;
  end;
end;

function PCommandExecutor.NewView(DiagramView: PDiagramView; Model: PModel;
  ViewKind: string = ''; End1: PView = nil; End2: PView = nil): PView;
var
  Cmd: PCreateViewCommand;
begin
  Cmd := PCreateViewCommand.Create;
  Cmd.SetParameter(DiagramView, Model, ViewKind, End1, End2);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.ViewSet[0];
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Result := nil;
  end;
end;

function PCommandExecutor.NewView(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
  Model: PModel; ViewKind: string = ''): PView;
var
  Cmd: PCreateViewCommand;
begin
  Cmd := PCreateViewCommand.Create;
  Cmd.SetParameter(DiagramView, X1, Y1, X2, Y2, Model, ViewKind);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.ViewSet[0];
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Result := nil;
  end;
end;

function PCommandExecutor.NewDiagram(Owner: PModel; DiagramKind: string): PDiagram;
var
  Cmd: PCreateDiagramCommand;
begin
  Cmd := PCreateDiagramCommand.Create;
  Cmd.SetParameter(Owner, DiagramKind);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.Diagram;
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Result := nil;
  end;
end;

function PCommandExecutor.NewExtendedDiagram(Owner: PModel; Profile: string; DiagramType: string): PDiagram;
var
  Cmd: PCreateExtendedDiagramCommand;
begin
  Cmd := PCreateExtendedDiagramCommand.Create;
  Cmd.SetParameter(Owner, Profile, DiagramType);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.Diagram;
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Result := nil;
  end;
end;

function PCommandExecutor.NewElement(DiagramView: PDiagramView; ElementKind: string;
  Argument: Integer = 0; End1: PView = nil; End2: PView = nil): PView;
var
  Cmd: PCreateElementCommand;
begin
  Cmd := PCreateElementCommand.Create;
  Cmd.SetParameter(DiagramView, ElementKind, Argument, End1, End2);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.ViewSet[0];
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Result := nil;
  end;
end;

function PCommandExecutor.NewElement(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
  ElementKind: string; Argument: Integer = 0): PView;
var
  Cmd: PCreateElementCommand;
begin
  Cmd := PCreateElementCommand.Create;
  Cmd.SetParameter(DiagramView, X1, Y1, X2, Y2, ElementKind, Argument);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.ViewSet[0];
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Result := nil;
  end;
end;

function PCommandExecutor.NewExtendedElement(DiagramView: PDiagramView;
  Profile, ElementPrototype: string; End1: PView = nil; End2: PView = nil): PView;
var
  Cmd: PCreateExtendedElementCommand;
begin
  Cmd := PCreateExtendedElementCommand.Create;
  Cmd.SetParameter(DiagramView, Profile, ElementPrototype, End1, End2);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.ViewSet[0];
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Result := nil;
  end;
end;

function PCommandExecutor.NewExtendedElement(DiagramView: PDiagramView;
  X1, Y1, X2, Y2: Integer; Profile, PaletteElement: string): PView;
var
  Cmd: PCreateExtendedElementCommand;
begin
  Cmd := PCreateExtendedElementCommand.Create;
  Cmd.SetParameter(DiagramView, X1, Y1, X2, Y2, Profile, PaletteElement);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.ViewSet[0];
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Result := nil;
  end;
end;

function PCommandExecutor.NewViewByDragDrop(DiagramView: PDiagramView;
  Model: PModel; X, Y: Integer): PView;
var
  Cmd: PNewViewByDragDropCommand;
begin
  Cmd := PNewViewByDragDropCommand.Create;
  Cmd.SetParameter(DiagramView, Model, X, Y);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.ViewSet[0];
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Result := nil;
  end;
end;

procedure PCommandExecutor.NewModelByCopyPaste(AModel, ATarget: PModel);
var
  Cmd: PNewModelByCopyPasteCommand;
begin
  Cmd := PNewModelByCopyPasteCommand.Create;
  Cmd.SetParameter(AModel, ATarget);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

//procedure PCommandExecutor.NewViewsByCopyPaste(Views: PViewsOrderedSet; Target: PDiagramView);
function PCommandExecutor.NewViewsByCopyPaste(Views: PViewOrderedSet; Target: PDiagramView): PViewOrderedSet;
var
  Cmd: PNewViewsByCopyPasteCommand;
begin
  Result := nil;
  Cmd := PNewViewsByCopyPasteCommand.Create;
  Cmd.SetParameter(Views, Target);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.ViewSet
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.DeleteElements(Models: PModelOrderedSet; Views: PViewOrderedSet);
var
  Cmd: PDeleteElementsCommand;
begin
  Cmd := PDeleteElementsCommand.Create;
  Cmd.SetParameter(Models, Views);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeModelsAttribute(Models: PModelOrderedSet; Key: string; Value: string);
var
  Cmd: PChangeModelsAttributeCommand;
begin
  Cmd := PChangeModelsAttributeCommand.Create;
  Cmd.SetParameter(Models, Key, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeModelsReference(Models: PModelOrderedSet; Key: string; Value: PModel);
var
  Cmd: PChangeModelsReferenceCommand;
begin
  Cmd := PChangeModelsReferenceCommand.Create;
  Cmd.SetParameter(Models, Key, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ClearCollection(AElement: PModel; Key: string);
var
  Cmd: PClearCollectionCommand;
begin
  Cmd := PClearCollectionCommand.Create;
  Cmd.SetParameter(AElement, Key);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
    // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;


procedure PCommandExecutor.AddCollectionItem(AElement: PElement; Key: string; Value: PElement);
var
  Cmd: PAddCollectionItemCommand;
begin
  Cmd := PAddCollectionItemCommand.Create;
  Cmd.SetParameter(AElement, Key, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.RemoveCollectionItem(AElement: PElement; Key: string; Value: PElement);
var
  Cmd: PRemoveCollectionItemCommand;
begin
  Cmd := PRemoveCollectionItemCommand.Create;
  Cmd.SetParameter(AElement, Key, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.InsertCollectionItem(AElement: PElement; Key: string; Index: Integer; Value: PElement);
var
  Cmd: PInsertCollectionItemCommand;
begin
  Cmd := PInsertCollectionItemCommand.Create;
  Cmd.SetParameter(AElement, Key, Index, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.DeleteCollectionItem(AElement: PElement; Key: string; Index: Integer);
var
  Cmd: PDeleteCollectionItemCommand;
begin
  Cmd := PDeleteCollectionItemCommand.Create;
  Cmd.SetParameter(AElement, Key, Index);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeCollectionItemOrder(AElement: PElement; ACollectionItem: PElement; Key: string; NewIndex: Integer);
var
  Cmd: PChangeCollectionItemOrderCommand;
begin
  Cmd := PChangeCollectionItemOrderCommand.Create;
  Cmd.SetParameter(AElement, ACollectionItem, Key, NewIndex);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeTypeExpression(AModel: PModel; TypeExpr: string; TypeRef: PModel);
var
  Cmd: PChangeTypeExpressionCommand;
begin
  Cmd := PChangeTypeExpressionCommand.Create;
  Cmd.SetParameter(AModel, TypeExpr, TypeRef);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeValueExpression(AModel: PModel; ValueExpr: string; ValueRef: PModel);
var
  Cmd: PChangeValueExpressionCommand;
begin
  Cmd := PChangeValueExpressionCommand.Create;
  Cmd.SetParameter(AModel, ValueExpr, ValueRef);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeActionKind(AModel: PModel; ActionKind: string);
var
  Cmd: PChangeActionKindCommand;
begin
  Cmd := PChangeActionKindCommand.Create;
  Cmd.SetParameter(AModel, ActionKind);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeDocumentation(AModel: PModel; Documentation: string);
var
  Cmd: PChangeDocumentationCommand;
begin
  Cmd := PChangeDocumentationCommand.Create;
  Cmd.SetParameter(AModel, Documentation);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.RelocateModels(Models: PModelOrderedSet; ATarget: PModel);
var
  Cmd: PRelocateModelsCommand;
begin
  Cmd := PRelocateModelsCommand.Create;
  Cmd.SetParameter(Models, ATarget);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeModelsStereotype(Models: PModelOrderedSet; AStereotypeProfile: string; AStereotype: string);
var
  Cmd: PChangeModelsStereotypeCommand;
begin
  Cmd := PChangeModelsStereotypeCommand.Create;
  Cmd.SetParameter(Models, AStereotypeProfile, AStereotype);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

function PCommandExecutor.AddConstraint(AExtensibleModel: PExtensibleModel; AName: string; ABody: string): PConstraint;
var
  Cmd: PAddConstraintCommand;
  C: PConstraint;
begin
  Cmd := PAddConstraintCommand.Create;
  C := MetaModel.CreateInstance('Constraint') as PConstraint;
  C.Name := AName;
  C.Body := ABody;
  Cmd.SetParameter(AExtensibleModel, C);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
    Result := Cmd.Constraint;
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Result := nil;
  end;
end;

procedure PCommandExecutor.DeleteConstraint(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint);
var
  Cmd: PDeleteConstraintCommand;
begin
  Cmd := PDeleteConstraintCommand.Create;
  Cmd.SetParameter(AExtensibleModel, AConstraint);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeConstraint(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint; AName: string; ABody: string);
var
  Cmd: PChangeConstraintCommand;
begin
  Cmd := PChangeConstraintCommand.Create;
  Cmd.SetParameter(AExtensibleModel, AConstraint, AName, ABody);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.SetDataTaggedValue(AExtensibleModel: PExtensibleModel;
  Profile: string; TagDefinitionSet: string; Name: string; Value: string);
var
  Cmd: PSetDataTaggedValueCommand;
begin
  Cmd := PSetDataTaggedValueCommand.Create;
  Cmd.SetParameter(AExtensibleModel, Profile, TagDefinitionSet, Name, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.SetReferenceTaggedValue(AExtensibleModel: PExtensibleModel; Profile, TagDefinitionSet, Name: string; Value: PExtensibleModel);
var
  Cmd: PSetReferenceTaggedValueCommand;
begin
  Cmd := PSetReferenceTaggedValueCommand.Create;
  Cmd.SetParameter(AExtensibleModel, Profile, TagDefinitionSet, Name, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.AddCollectionTaggedValue(AExtensibleModel: PExtensibleModel; Profile: string; TagDefinitionSet: string; Name: string; Value: PExtensibleModel);
var
  Cmd: PAddCollectionTaggedValueCommand;
begin
  Cmd := PAddCollectionTaggedValueCommand.Create;
  Cmd.SetParameter(AExtensibleModel, Profile, TagDefinitionSet, Name, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.RemoveCollectionTaggedValue(AExtensibleModel: PExtensibleModel; Profile: string; TagDefinitionSet: string; Name: string; Value: PExtensibleModel);
var
  Cmd: PRemoveCollectionTaggedValueCommand;
begin
  Cmd := PRemoveCollectionTaggedValueCommand.Create;
  Cmd.SetParameter(AExtensibleModel, Profile, TagDefinitionSet, Name, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.InsertCollectionTaggedValue(AExtensibleModel: PExtensibleModel; Profile: string; TagDefinitionSet: string; Name: string; Idx: Integer; Value: PExtensibleModel);
var
  Cmd: PInsertCollectionTaggedValueCommand;
begin
  Cmd := PInsertCollectionTaggedValueCommand.Create;
  Cmd.SetParameter(AExtensibleModel, Profile, TagDefinitionSet, Name, Idx, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.DeleteCollectionTaggedValue(AExtensibleModel: PExtensibleModel; Profile: string; TagDefinitionSet: string; Name: string; Idx: Integer);
var
  Cmd: PDeleteCollectionTaggedValueCommand;
begin
  Cmd := PDeleteCollectionTaggedValueCommand.Create;
  Cmd.SetParameter(AExtensibleModel, Profile, TagDefinitionSet, Name, Idx);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.SetTaggedValueAsDefault(AExtensibleModel: PExtensibleModel; Profile: string; TagDefinitionSet: string; Name: string);
var
  Cmd: PSetTaggedValueAsDefaultCommand;
begin
  Cmd := PSetTaggedValueAsDefaultCommand.Create;
  Cmd.SetParameter(AExtensibleModel, Profile, TagDefinitionSet, Name);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeCollectionTaggedValueOrder(AExtensibleModel: PExtensibleModel; Profile: string; TagDefinitionSet: string; Name: string; Value: PExtensibleModel; NewIdx: Integer);
var
  Cmd: PChangeCollectionTaggedValueOrderCommand;
begin
  Cmd := PChangeCollectionTaggedValueOrderCommand.Create;
  Cmd.SetParameter(AExtensibleModel, Profile, TagDefinitionSet, Name, Value, NewIdx);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ClearAttachments(AModel: PModel);
var
  Cmd: PClearAttachmentsCommand;
begin
  Cmd := PClearAttachmentsCommand.Create;
  Cmd.SetParameter(AModel);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.AddAttachment(AModel: PModel; Attach: string);
var
  Cmd: PAddAttachmentCommand;
begin
  Cmd := PAddAttachmentCommand.Create;
  Cmd.SetParameter(AModel, Attach);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.InsertAttachment(AModel: PModel; Attach: string; Index: Integer);
var
  Cmd: PInsertAttachmentCommand;
begin
  Cmd := PInsertAttachmentCommand.Create;
  Cmd.SetParameter(AModel, Attach, Index);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.DeleteAttachment(AModel: PModel; Index: Integer);
var
  Cmd: PDeleteAttachmentCommand;
begin
  Cmd := PDeleteAttachmentCommand.Create;
  Cmd.SetParameter(AModel, Index);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeAttachment(AModel: PModel; Index: Integer; Attach: string);
var
  Cmd: PChangeAttachmentCommand;
begin
  Cmd := PChangeAttachmentCommand.Create;
  Cmd.SetParameter(AModel, Index, Attach);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeAttachmentOrder(AModel: PModel; Index: Integer; NewIndex: Integer);
var
  Cmd: PChangeAttachmentOrderCommand;
begin
  Cmd := PChangeAttachmentOrderCommand.Create;
  Cmd.SetParameter(AModel, Index, NewIndex);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

function PCommandExecutor.ApplyGeneralNameExpression(Models: PModelOrderedSet; Value: string; var Msg: string): Boolean;
var
  Cmd: PApplyGeneralNameExpressionCommand;
begin
  Cmd := PApplyGeneralNameExpressionCommand.Create;
  Cmd.SetParameter(Models, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then Result := True
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Msg := Engine.ErrorMessage;
    Result := False;
  end;
end;

function PCommandExecutor.ApplyClassifierRoleExpression(Models: PModelOrderedSet; Value: string; var Msg: string): Boolean;
var
  Cmd: PApplyClassifierRoleExpressionCommand;
begin
  Cmd := PApplyClassifierRoleExpressionCommand.Create;
  Cmd.SetParameter(Models, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then Result := True
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Msg := Engine.ErrorMessage;
    Result := False;
  end;
end;

function PCommandExecutor.ApplyInstanceExpression(Models: PModelOrderedSet; Value: string; var Msg: string): Boolean;
var
  Cmd: PApplyInstanceExpressionCommand;
begin
  Cmd := PApplyInstanceExpressionCommand.Create;
  Cmd.SetParameter(Models, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then Result := True
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Msg := Engine.ErrorMessage;
    Result := False;
  end;
end;

function PCommandExecutor.ApplyAttributeExpression(Models: PModelOrderedSet; Value: string; var Msg: string): Boolean;
var
  Cmd: PApplyAttributeExpressionCommand;
begin
  Cmd := PApplyAttributeExpressionCommand.Create;
  Cmd.SetParameter(Models, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then Result := True
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Msg := Engine.ErrorMessage;
    Result := False;
  end;
end;

function PCommandExecutor.ApplyOperationExpression(Models: PModelOrderedSet; Value: string; var Msg: string): Boolean;
var
  Cmd: PApplyOperationExpressionCommnad;
begin
  Cmd := PApplyOperationExpressionCommnad.Create;
  Cmd.SetParameter(Models, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then Result := True
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Msg := Engine.ErrorMessage;
    Result := False;
  end;
end;

function PCommandExecutor.ApplyMessageExpression(Models: PModelOrderedSet; Value: string; var Msg: string): Boolean;
var
  Cmd: PApplyMessageExpressionCommnad;
begin
  Cmd := PApplyMessageExpressionCommnad.Create;
  Cmd.SetParameter(Models, Value);
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then Result := True
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
    Msg := Engine.ErrorMessage;
    Result := False;
  end;
end;

procedure PCommandExecutor.ChangeModelReferenceWithNamedModelCreating(AModel: PModel; Key: string; Owner: PModel; ModelKind: string; Name: string = '');
var
  Cmd: PChangeModelReferenceWithNamedModelCreatingCommand;
begin
  Cmd := PChangeModelReferenceWithNamedModelCreatingCommand.Create;
  Cmd.SetParameter(AModel, Key, Owner, ModelKind, Name);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  Cmd.OnModelsChanged := ModelsChanged;
  if Engine.Execute(Cmd) then begin
    // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.MoveViews(ADiagramView: PDiagramView; Views: PViewOrderedSet; DX, DY: Integer);
var
  Cmd: PMoveViewsCommand;
begin
  Cmd := PMoveViewsCommand.Create;
  Cmd.SetParameter(ADiagramView, Views, DX, DY);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.MoveParasiticView(AParasiticView: PParasiticView; Alpha, Distance: Extended);
var
  Cmd: PMoveParasiticViewCommand;
begin
  Cmd := PMoveParasiticViewCommand.Create;
  Cmd.SetParameter(AParasiticView, Alpha, Distance);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ResizeNode(ANode: PNodeView; ARect: TRect);
var
  Cmd: PResizeNodeCommand;
begin
  Cmd := PResizeNodeCommand.Create;
  Cmd.SetParameter(ANode, ARect);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ResizeFragmentedNode(ANode: PNodeView; ARect: TRect);
var
  Cmd: PResizeFragmentedNodeCommand;
begin
  Cmd := PResizeFragmentedNodeCommand.Create;
  Cmd.SetParameter(ANode, ARect);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ReshapeEdge(AEdge: IModifiableEdge; APoints: PPoints);
var
  Cmd: PReshapeEdgeCommand;
begin
  Cmd := PReshapeEdgeCommand.Create;
  Cmd.SetParameter(AEdge, APoints);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ReconnectEdge(AEdge: PEdgeView; APoints: PPoints; NewParticipant: PView; IsTailSide: Boolean);
var
  Cmd: PReconnectEdgeCommand;
begin
  Cmd := PReconnectEdgeCommand.Create;
  Cmd.SetParameter(AEdge, APoints, NewParticipant, IsTailSide);
  Cmd.OnModelsChanged := ModelsChanged;
  Cmd.OnViewsChanged := ViewsChanged;
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeViewsAttribute(Views: PViewOrderedSet; Key: string; Value: string);
var
  Cmd: PChangeViewsAttributeCommand;
begin
  Cmd := PChangeViewsAttributeCommand.Create;
  Cmd.SetParameter(Views, Key, Value);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeViewsLineColor(Views: PViewOrderedSet; LineColor: TColor);
var
  Cmd: PChangeViewsLineColorCommand;
begin
  Cmd := PChangeViewsLineColorCommand.Create;
  Cmd.SetParameter(Views, LineColor);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeViewsFillColor(Views: PViewOrderedSet; FillColor: TColor);
var
  Cmd: PChangeViewsFillColorCommand;
begin
  Cmd := PChangeViewsFillColorCommand.Create;
  Cmd.SetParameter(Views, FillColor);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeViewsFont(Views: PViewOrderedSet; Font: TFont; AChangedFontItems: PFontItemKinds);
var
  Cmd: PChangeViewsFontCommand;
begin
  Cmd := PChangeViewsFontCommand.Create;
  Cmd.SetParameter(Views, Font, AChangedFontItems);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeEdgesLineStyle(Views: PViewOrderedSet; LineStyle: PLineStyleKind);
var
  Cmd: PChangeEdgesLineStyleCommand;
begin
  Cmd := PChangeEdgesLineStyleCommand.Create;
  Cmd.SetParameter(Views, LineStyle);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeAnnotationLineStyle(Views: PViewOrderedSet; LineStyle: PLineKind);
var
  Cmd: PChangeAnnotationLineStyleCommand;
begin
  Cmd := PChangeAnnotationLineStyleCommand.Create;
  Cmd.SetParameter(Views, LineStyle);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ChangeNoteViewStrings(Views: PViewOrderedSet; Strs: string);
var
  Cmd: PChangeNoteViewStringsCommand;
begin
  Cmd := PChangeNoteViewStringsCommand.Create;
  Cmd.SetParameter(Views, Strs);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.SendToBackViews(Views: PViewOrderedSet);
var
  Cmd: PSendToBackViewsCommand;
begin
  Cmd := PSendToBackViewsCommand.Create;
  Cmd.SetParameter(Views);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.BringToFrontViews(Views: PViewOrderedSet);
var
  Cmd: PBringToFrontViewsCommand;
begin
  Cmd := PBringToFrontViewsCommand.Create;
  Cmd.SetParameter(Views);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.AlignViews(Views: PViewOrderedSet; AlignmentKind: PAlignmentKind);
var
  Cmd: PAlignViewsCommand;
begin
  Cmd := PAlignViewsCommand.Create;
  Cmd.SetParameter(Views, AlignmentKind);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.LayoutDiagram(ADiagramView: PDiagramView);
var
  Cmd: PLayoutDiagramCommand;
begin
  Cmd := PLayoutDiagramCommand.Create;
  Cmd.SetParameter(ADiagramView);
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.MoveViewsChangeContainer(ADiagramView: PDiagramView; Views: PViewOrderedSet; DX, DY: Integer; AContainerView: PView = nil);
{
var
  Cmd: PMoveViewsChangeContainerCommand;
begin
  Cmd := PMoveViewsChangeContainerCommand.Create;
  Cmd.SetParameter(ADiagramView, Views, DX, DY, AContainerView);
  Cmd.OnModelsChanged := ModelsChanged;
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
}
var
  Cmd: PMoveViewsChaningContainerViewCommand;
begin
  Cmd := PMoveViewsChaningContainerViewCommand.Create;
  Cmd.SetParameter(ADiagramView, Views, DX, DY, AContainerView);
  Cmd.OnElementsCreated := ElementsCreated;
  Cmd.OnElementsDeleting := ElementsDeleting;
  Cmd.OnElementsDeleted := ElementsDeleted;
  Cmd.OnViewsChanged := ViewsChanged;
  if Engine.Execute(Cmd) then begin
   // Nothing to do.
  end
  else begin
    ErrorOccurred(Self, Engine.ErrorMessage);
  end;
end;

procedure PCommandExecutor.ClearHistory;
begin
  if (Engine.UnexecuteCommandCount > 0) or (Engine.ReexecuteCommandCount > 0) then
  begin
    Engine.Clear;
    CommandHistoryChanged;
  end;
end;

procedure PCommandExecutor.Undo;
begin
  Engine.ToUnexecuteCommand;
  Engine.Unexecute;
end;

procedure PCommandExecutor.Redo;
begin
  Engine.ToReexecuteCommand;
  Engine.Reexecute;
end;

function PCommandExecutor.CanUndo: Boolean;
begin
  Result := Engine.CanUnexecute;
end;

function PCommandExecutor.CanRedo: Boolean;
begin
  Result := Engine.CanReexecute;
end;

function PCommandExecutor.GetUndoName: string;
begin
  if Engine.ToUnexecuteCommand <> nil then
    Result := Engine.ToUnexecuteCommand.Name
  else
    Result := '';
end;

function PCommandExecutor.GetRedoName: string;
begin
  if Engine.ToReexecuteCommand <> nil then
    Result := Engine.ToReexecuteCommand.Name
  else
    Result := '';
end;

// PCommandExecutor
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAbstractCommand

constructor PAbstractCommand.Create;
begin
  inherited;
  FSizePreservingViews := PViewOrderedSet.Create;
  FWidthArray := TStringList.Create;
  FHeightArray := TStringList.Create;
end;

destructor PAbstractCommand.Destroy;
begin
  FSizePreservingViews.Free;
  FWidthArray.Free;
  FHeightArray.Free;
  inherited;
end;

procedure PAbstractCommand.StoreViewSizes;
var
  I: Integer;
  N: PNodeView;
  View: PView;
begin
  // Remove from list if the view is not NodeView or is a subview of something.
  for I := FSizePreservingViews.Count - 1 downto 0 do begin
    View := FSizePreservingViews[I];
    if (not (View is PNodeView)) or
      (View.OwnerDiagramView = nil) then
     FSizePreservingViews.Remove(View);
  end;

  // Store all sizes of size-preserving views.
  FWidthArray.Clear;
  FHeightArray.Clear;
  //for I := 0 to FSizePreservingViews.Count - 1 do
  for View in FSizePreservingViews do
  begin
    if View is PNodeView then begin
      N := View as PNodeView;
      FWidthArray.Add(IntToStr(N.Width));
      FHeightArray.Add(IntToStr(N.Height));
    end;
  end;
end;

procedure PAbstractCommand.RestoreViewSizes;
var
  I: Integer;
  N: PNodeView;
begin
  // Restore sizes of all size-preserving views.
  for I := 0 to FSizePreservingViews.Count - 1 do
  begin
    N := FSizePreservingViews.Items[I] as PNodeView;
    N.Update;
    if (N.GetDiagramView <> nil) and (N.GetDiagramView.Canvas <> nil) then
      N.Arrange(N.GetDiagramView.Canvas);
    N.Width := StrToInt(FWidthArray.Strings[I]);
    N.Height := StrToInt(FHeightArray.Strings[I]);
  end;
end;

procedure PAbstractCommand.CollectSizesFromModel(AModel: PModel);
var
  I: Integer;
begin
  if AModel.ViewCount > 0 then
  begin
    for I := 0 to AModel.ViewCount - 1 do
      CollectSizesFromView(AModel.View[I]);
  end
  else if AModel.VirtualNamespace <> nil then
  begin
    for I := 0 to AModel.VirtualNamespace.ViewCount - 1 do
      CollectSizesFromView(AModel.VirtualNamespace.View[I]);
  end;
end;

procedure PAbstractCommand.CollectSizesFromView(AView: PView);
var
  V: PView;
begin
  if Assigned(AView) then begin
    V := AView;
    SizePreservingViews.Add(V);
    while Assigned(V) and not Assigned(V.OwnerDiagramView) do
      V := V.Parent;
    if Assigned(V) then
      SizePreservingViews.Add(V);
  end;
end;

procedure PAbstractCommand.CollectSizesFromModelSet(AModelSet: PModelOrderedSet);
var
  Model: PModel;
begin
  for Model in AModelSet do
    CollectSizesFromModel(Model);
end;

procedure PAbstractCommand.CollectSizesFromViewSet(AViewSet: PViewOrderedSet);
var
  View: PView;
begin
  for View in AViewSet do
    CollectSizesFromView(View);
end;

// PAbstractCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAbstractCreateDeleteElementsCommand

constructor PAbstractCreateDeleteElementsCommand.Create;
begin
  inherited;
  FModelSet := PModelOrderedSet.Create;
  FViewSet := PViewOrderedSet.Create;
  FModelReferences := PElementOrderedSet.Create;
  FViewReferences := PElementOrderedSet.Create;
  FModelMementos := PMementoList.Create;
  FViewMementos := PMementoList.Create;
end;

destructor PAbstractCreateDeleteElementsCommand.Destroy;
var
  AMemento: PMemento;
begin
  FModelSet.Free;
  FViewSet.Free;
  FModelReferences.Free;
  FViewReferences.Free;

  for AMemento in FModelMementos do
    AMemento.Free;
  FModelMementos.Free;

  for AMemento in FViewMementos do
    AMemento.Free;
  FViewMementos.Free;

  inherited;
end;

procedure PAbstractCreateDeleteElementsCommand.FreeAll;
var
  Model: PModel;
  View: PView;
begin
  for Model in FModelSet do
    Model.Free;
  for View in FViewSet do
    View.Free;
end;

procedure PAbstractCreateDeleteElementsCommand.Preprocess;
var
  AElement: PElement;
  RC: PReferenceCollectionVisitor;
begin
  RC := PReferenceCollectionVisitor.Create;
  RC.Clear;

  // Collecting references and mementos of all Model (including Diagram) objects.

  for AElement in FModelSet do
     AElement.Accept(RC);

  FModelReferences.Clear;
  for AElement in RC do begin
    if AElement is PModel then
      FModelReferences.Add(AElement);
  end;

  FModelMementos.Clear;
  for AElement in FModelReferences do
     FModelMementos.Add(AElement.CreateMemento);

  // Collecting references and mementos of all View (including DiagramView) objects.
  RC.Clear;

  // - Collecting DiagramView object.
  for AElement in FModelSet do begin
    if AElement is PDiagram then
      (AElement as PDiagram).DiagramView.Accept(RC);
  end;

  // - Collecting View object.
  for AElement in FViewSet do
    AElement.Accept(RC);

  for AElement in RC do
    FViewReferences.Add(AElement);

  FViewMementos.Clear;
  for AElement in FViewReferences do
    FViewMementos.Add(AElement.CreateMemento);
  RC.Free;
end;

procedure PAbstractCreateDeleteElementsCommand.ElementsCreated;
begin
  if Assigned(FOnElementsCreated) then
    FOnElementsCreated(Self, FModelSet, FViewSet);
end;

procedure PAbstractCreateDeleteElementsCommand.ElementsDeleting;
begin
  if Assigned(FOnElementsDeleting) then
    FOnElementsDeleting(Self, FModelSet, FViewSet);
end;

procedure PAbstractCreateDeleteElementsCommand.ElementsDeleted;
begin
  if Assigned(FOnElementsDeleted) then
    FOnElementsDeleted(Self);
end;

// PAbstractCreateDeleteElementsCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAbstractCreateElementsCommand

constructor PAbstractCreateElementsCommand.Create;
begin
  inherited;
end;

destructor PAbstractCreateElementsCommand.Destroy;
begin
  if CommandPos = cpReexecuteStack then FreeAll;
  inherited;
end;

procedure PAbstractCreateElementsCommand.Preprocess;
begin
  inherited;
  // Store size of views
  StoreViewSizes;
end;

procedure PAbstractCreateElementsCommand.Execute;
begin
  Preprocess;
  // OnElementsCreated event occurs.
  ElementsCreated;
end;

procedure PAbstractCreateElementsCommand.Reexecute;
var
  I: Integer;
begin
  // Restore states of all models using mementos.
  for I := 0 to FModelReferences.Count - 1 do
    FModelReferences[I].SetMemento(FModelMementos.Items[I]);
  // Restore states of all views using mementos.
  for I := 0 to FViewReferences.Count - 1 do
    FViewReferences[I].SetMemento(FViewMementos.Items[I]);
  // OnElementsCreated event occurs.
  ElementsCreated;
end;

procedure PAbstractCreateElementsCommand.Unexecute;
var
  Element: PElement;
begin
  // OnElementsDeleting event occurs.
  ElementsDeleting;

  // Isolate all model objects.
  for Element in FModelReferences do
    Element.Isolate;


  // Isolate all view objects.
  for Element in FViewReferences do
    Element.Isolate;

  // Restore size of views.
  RestoreViewSizes;
  // OnElementsDeleted event occurs.
  ElementsDeleted;
end;

// PAbstractCreateElementsCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAbstractChangeModelsCommand

constructor PAbstractChangeModelsCommand.Create;
begin
  inherited;
  FModelSet := PModelOrderedSet.Create;
end;

destructor PAbstractChangeModelsCommand.Destroy;
begin
  FModelSet.Free;
  inherited;
end;

procedure PAbstractChangeModelsCommand.ModelsChanged;
begin
  if Assigned(FOnModelsChanged) then FOnModelsChanged(Self, FModelSet);
end;

// PAbstractChangeModelsCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAbstractChangeViewsCommand

constructor PAbstractChangeViewsCommand.Create;
begin
  inherited;
  FViewSet := PViewOrderedSet.Create;
  FSizePreservingViews := PViewOrderedSet.Create;
  FWidthArray := TStringList.Create;
  FHeightArray := TStringList.Create;
end;

destructor PAbstractChangeViewsCommand.Destroy;
begin
  FViewSet.Free;
  FSizePreservingViews.Free;
  FWidthArray.Free;
  FHeightArray.Free;
  inherited;
end;

procedure PAbstractChangeViewsCommand.ViewsChanged;
begin
  if Assigned(FOnViewsChanged) then FOnViewsChanged(Self, FViewSet);
end;

// PAbstractChangeViewsCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAbstractChangeModelsViewsCommand

constructor PAbstractChangeModelsViewsCommand.Create;
begin
  inherited;
  FModelSet := PModelOrderedSet.Create;
  FViewSet := PViewOrderedSet.Create;
end;

destructor PAbstractChangeModelsViewsCommand.Destroy;
begin
  FModelSet.Free;
  FViewSet.Free;
  inherited;
end;

procedure PAbstractChangeModelsViewsCommand.ModelsChanged;
begin
  if Assigned(FOnModelsChanged) then FOnModelsChanged(Self, FModelSet);
end;

procedure PAbstractChangeModelsViewsCommand.ViewsChanged;
begin
  if Assigned(FOnViewsChanged) then FOnViewsChanged(Self, FViewSet);
end;

// PAbstractChangeModelsViewsCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PCreateModelCommand

function PCreateModelCommand.Precondition: Boolean;
begin
  Result := True;
end;

procedure PCreateModelCommand.SetParameter(Owner: PModel; ModelKind: string;
  Argument: Integer = 0; End1: PModel = nil; End2: PModel = nil;
  InsertIndex: Integer = -1; AuxArg: PModel = nil);
var
  M: PModel;
begin
  M := UMLFactory.CreateModel(Owner, ModelKind, Argument, End1, End2, InsertIndex, AuxArg);
  ModelSet.Clear;
  ViewSet.Clear;
  if M <> nil then ModelSet.Add(M);
  SizePreservingViews.Clear;
  CollectSizesFromModel(Owner);
end;

// PCreateModelCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PCreateExtendedModelCommand

function PCreateExtendedModelCommand.Precondition: Boolean;
begin
  Result := (ModelSet.Count > 0);
end;

procedure PCreateExtendedModelCommand.SetParameter(Owner: PModel; Profile: string;
  ModelPrototype: string; End1: PModel = nil; End2: PModel = nil;
  InsertIndex: Integer = -1; AuxArg: PModel = nil);
var
  MP: PModelPrototype;
  M: PModel;
  I: Integer;
begin
  ModelSet.Clear;
  ViewSet.Clear;
  MP := ExtensionManager.FindModelPrototype(Profile, ModelPrototype);
  if MP <> nil then begin
    // Maybe Argument must be removing or attribute value of MP
    M := UMLFactory.CreateModel(Owner, MP.BaseModel, MP.Name, MP.Argument, End1, End2, InsertIndex, AuxArg);
    if M <> nil then begin
      if MP.StereotypeName <> '' then begin
        M.MOF_SetAttribute('StereotypeProfile', MP.Profile.Name);
        M.MOF_SetAttribute('StereotypeName', MP.StereotypeName);
      end;
      for I := 0 to MP.PropertyCount - 1 do
        M.MOF_SetAttribute(MP.PropertyNames[I], MP.PropertyValues[I]);
      ModelSet.Add(M);
    end;
  end;
  SizePreservingViews.Clear;
  CollectSizesFromModel(Owner);
end;

// PCreateExtendedModelCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PCreateModelWithNameCommand

procedure PCreateModelWithNameCommand.SetParameter(Owner: PModel; ModelKind: string;
  Name: string = '');
var
  M: PModel;
begin
  M := UMLFactory.CreateModel(Owner, ModelKind, 0, nil, nil, -1, nil);
  ModelSet.Clear;
  ViewSet.Clear;
  if M <> nil then begin
    if Name <> '' then M.Name := Name;
    ModelSet.Add(M);
  end;
  SizePreservingViews.Clear;
  CollectSizesFromModel(Owner);
end;

// PCreateModelWithNameCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PCreateDiagramCommand

function PCreateDiagramCommand.GetDiagram: PDiagram;
begin
  Result := ModelSet.Items[0] as PDiagram;
end;

function PCreateDiagramCommand.Precondition: Boolean;
begin
  Result := True;
end;

procedure PCreateDiagramCommand.SetParameter(Owner: PModel; DiagramKind: string);
var
  D: PDiagram;
  M: PModel;
begin
  M := nil;
  D := UMLFactory.CreateDiagram(Owner, DiagramKind, M);
  ModelSet.Clear;
  ViewSet.Clear;
  if D <> nil then ModelSet.Add(D);
  if M <> nil then ModelSet.Add(M);
  // Testing
  if M is PUMLCollaboration then
    ModelSet.Add((M as PUMLCollaboration).Interactions[0]);
  // Testing
end;

// PCreateDiagramCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PCreateExtendedDiagramCommand

function PCreateExtendedDiagramCommand.GetDiagram: PDiagram;
begin
  Result := ModelSet.Items[0] as PDiagram;
end;

function PCreateExtendedDiagramCommand.Precondition: Boolean;
begin
  Result := (ModelSet.Count > 0) and (ModelSet.Items[0] is PDiagram);
end;

procedure PCreateExtendedDiagramCommand.SetParameter(Owner: PModel; Profile: string; DiagramType: string);
var
  DT: PDiagramType;
  D: PDiagram;
  M: PModel;
begin
  ModelSet.Clear;
  ViewSet.Clear;
  DT := ExtensionManager.FindDiagramType(Profile, DiagramType);
  if DT <> nil then begin
    M := nil;
    D := UMLFactory.CreateDiagram(Owner, DT.BaseDiagram, DT.Name, M);
    D.DiagramType := DiagramType;
    if D <> nil then ModelSet.Add(D);
    if M <> nil then ModelSet.Add(M);
  end;
end;

// PCreateExtendedDiagramCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PCreateViewCommand

procedure PCreateViewCommand.ComplementEdgeViews(DiagramView: PDiagramView; AView: PView);
var
  M: PModel;
  V: PView;
  I: Integer;
  ATransition: PUMLTransition;
  ADependency: PUMLDependency;
  AAssociation: PUMLAssociation;
  AGeneralization: PUMLGeneralization;
  ALink: PUMLLink;
  AInclude: PUMLInclude;
  AExtend: PUMLExtend;
  TempModel: PModel;
  ModelView: PView;
  ModelViewSet: PViewOrderedSet;
  AAssociationClass: PUMLAssociationClass;
  AssociationEnd: PUMLAssociationEnd;
  OppositeAssociationEnd: PUMLAssociationEnd;
  IsDuplicated: Boolean;
begin
  // in case of creating View Element (Node Type) using Drag-and-drop/Copy-and-paste
  // restore relationship among the this view element and other view elements in the diagram

  if not Assigned(AView) or not Assigned(AView.Model) then Exit;
  if (DiagramView is PUMLSequenceDiagramView) or
     (DiagramView is PUMLSequenceRoleDiagramView)
  then Exit;
  M := AView.Model;

  ModelViewSet := PViewOrderedSet.Create;
  try
    // Transition
    if M is PUMLStateVertex then begin
      for I := 0 to (M as PUMLStateVertex).OutgoingCount - 1 do begin

        // get outgoing transition
        ATransition := (M as PUMLStateVertex).Outgoings[I];
        //  get outgoing transition's target model element
        TempModel := ATransition.Target;
        // get all view elements of target state vertex in diagram
        FindViewByModel(DiagramView, TempModel, ModelViewSet);
        // create transition view among created view element and all target vertex
        for ModelView in ModelViewSet do begin
          if (ModelView <> AView) and (ModelView.Model = M) then Continue;
          V := UMLFactory.CreateView(DiagramView, ATransition, '', AView, ModelView);
          if Assigned(V) then ViewSet.Add(V);
        end;
      end;
      for I := 0 to (M as PUMLStateVertex).IncomingCount - 1 do begin
        ATransition := (M as PUMLStateVertex).Incomings[I];
        TempModel := ATransition.Source;
        FindViewByModel(DiagramView, TempModel, ModelViewSet);
        for ModelView in ModelViewSet do begin
          if (ModelView <> AView) and (ModelView.Model = M) then Continue;
          if ModelView = AView then Continue;
          V := UMLFactory.CreateView(DiagramView, ATransition, '', ModelView, AView);
          if Assigned(V) then ViewSet.Add(V);
        end;
      end;
    end;
    // Dependency, Realization
    if M is PUMLModelElement then begin
      for I := 0 to (M as PUMLModelElement).SupplierDependencyCount - 1 do begin
        ADependency := (M as PUMLModelElement).SupplierDependencies[I];
        TempModel := ADependency.Client;
        FindViewByModel(DiagramView, TempModel, ModelViewSet);
        for ModelView in ModelViewSet do begin
          if (ModelView <> AView) and (ModelView.Model = M) then Continue;
          V := UMLFactory.CreateView(DiagramView, ADependency, '', ModelView, AView);
          if Assigned(V) then ViewSet.Add(V);
        end;
      end;
      for I := 0 to (M as PUMLModelElement).ClientDependencyCount - 1 do begin
        ADependency := (M as PUMLModelElement).ClientDependencies[I];
        TempModel := ADependency.Supplier;
        FindViewByModel(DiagramView, TempModel, ModelViewSet);
        for ModelView in ModelViewSet do begin
          if (ModelView <> AView) and (ModelView.Model = M) then Continue;
          if ModelView = AView then Continue;
          V := UMLFactory.CreateView(DiagramView, ADependency, '', AView, ModelView);
          if Assigned(V) then ViewSet.Add(V);
        end;
      end;
    end;

    // Association
    if M is PUMLClassifier then begin
      IsDuplicated := False;
      for AssociationEnd in (M as PUMLClassifier).Associations do begin
        AAssociation := AssociationEnd.Association;
        if AAssociation.Connections[0].Participant = M then begin // Model is attached to tail node
          // Case M is Tail
          OppositeAssociationEnd := AAssociation.Connections[1];
          FindViewByModel(DiagramView, OppositeAssociationEnd.Participant, ModelViewSet);
          for ModelView in ModelViewSet do begin
            if (ModelView <> AView) and (ModelView.Model = M) then Continue;
            if ModelView = AView then begin
              if not IsDuplicated then IsDuplicated := True
              else begin IsDuplicated := False; Continue; end;
            end;
            V := UMLFactory.CreateView(DiagramView, AAssociation, '', AView, ModelView );
            if Assigned(V) then ViewSet.Add(V);
          end;
        end
        else begin
          if AAssociation.Connections[1].Participant = M then begin // Model is attached to head node
            // Case M is Head
            OppositeAssociationEnd := AAssociation.Connections[0];
            FindViewByModel(DiagramView, OppositeAssociationEnd.Participant, ModelViewSet);
            for ModelView in ModelViewSet do begin
            if (ModelView <> AView) and (ModelView.Model = M) then Continue;
              if ModelView = AView then begin
                if not IsDuplicated then IsDuplicated := True
                else begin IsDuplicated := False; Continue; end;
              end;
              V := UMLFactory.CreateView(DiagramView, AAssociation, '', ModelView, AView);
              if Assigned(V) then ViewSet.Add(V);
            end;
          end;
        end;
      end;
    end;
    // Generalization
    if M is PUMLGeneralizableElement then begin
      // Case M is Child
      for I := 0 to (M as PUMLGeneralizableElement).GeneralizationCount - 1 do begin
        AGeneralization := (M as PUMLGeneralizableElement).Generalizations[I];
        // ASSERTION
        Assert(AGeneralization.Child = M);
        // ASSERTION
        TempModel := AGeneralization.Parent;
        FindViewByModel(DiagramView, TempModel, ModelViewSet);
        for ModelView in ModelViewSet do begin
          if (ModelView <> AView) and (ModelView.Model = M) then Continue;
          V := UMLFactory.CreateView(DiagramView, AGeneralization, '', AView, ModelView);
          if Assigned(V) then ViewSet.Add(V);
        end;
      end;
      // Case M is Parent
      for I := 0 to (M as PUMLGeneralizableElement).SpecializationCount - 1 do begin
        AGeneralization := (M as PUMLGeneralizableElement).Specializations[I];
        // ASSERTION
        Assert(AGeneralization.Parent = M);
        // ASSERTION
        TempModel := AGeneralization.Child;
        FindViewByModel(DiagramView, TempModel, ModelViewSet);
        for ModelView in ModelViewSet do begin
          if (ModelView <> AView) and (ModelView.Model = M) then Continue;
          if ModelView = AView then Continue;
          V := UMLFactory.CreateView(DiagramView, AGeneralization, '', ModelView, AView);
          if Assigned(V) then ViewSet.Add(V);
        end;
      end;
    end;
    // Link, Stimulus
    if M is PUMLInstance then begin
      IsDuplicated := False;
      for I := 0 to (M as PUMLInstance).LinkEndCount - 1 do begin
        TempModel := (M as PUMLInstance).LinkEnds[I];
        ALink := (TempModel as PUMLLinkEnd).Link;
        // Case M is Tail
        //if TempModel = ALink.Connections[0] then Continue;
        TempModel := ALink.Connections[0];
        if (TempModel as PUMLLinkEnd).Instance = M then begin
          TempModel := ALink.Connections[1];
          FindViewByModel(DiagramView, (TempModel as PUMLLinkEnd).Instance, ModelViewSet);
          for ModelView in ModelViewSet do begin
            if (ModelView <> AView) and (ModelView.Model = M) then Continue;
            if ModelView = AView then begin
              if not IsDuplicated then IsDuplicated := True
              else begin IsDuplicated := False; Continue; end;
            end;
            V := UMLFactory.CreateView(DiagramView, ALink, '', AView, ModelView);
            if Assigned(V) then ViewSet.Add(V);
          end;
        end else begin
        // Case M is Head
          TempModel := ALink.Connections[1];
          if (TempModel as PUMLLinkEnd).Instance = M then begin
            TempModel := ALink.Connections[0];
            FindViewByModel(DiagramView, (TempModel as PUMLLinkEnd).Instance, ModelViewSet);
            for ModelView in ModelViewSet do begin
              if (ModelView <> AView) and (ModelView.Model = M) then Continue;
              if ModelView = AView then begin
                if not IsDuplicated then IsDuplicated := True
                else begin IsDuplicated := False; Continue; end;
              end;
              V := UMLFactory.CreateView(DiagramView, ALink, '', ModelView, AView);
              if Assigned(V) then ViewSet.Add(V);
            end;
          end;
        end;
      end;
    end;
    // Include, Extend
    if M is PUMLUseCase then begin
      // (Include) Case M is Base
      for I := 0 to (M as PUMLUseCase).IncludeCount - 1 do begin
        AInclude := (M as PUMLUseCase).Includes[I];
        TempModel := AInclude.Addition;
        FindViewByModel(DiagramView, TempModel, ModelViewSet);
        for ModelView in ModelViewSet do begin
          if (ModelView <> AView) and (ModelView.Model = M) then Continue;
          V := UMLFactory.CreateView(DiagramView, AInclude, '', AView, ModelView);
          if Assigned(V) then ViewSet.Add(V);
        end;
      end;
      // (Include) Case M is Addition
      for I := 0 to (M as PUMLUseCase).IncluderCount - 1 do begin
        AInclude := (M as PUMLUseCase).Includers[I];
        TempModel := AInclude.Base;
        FindViewByModel(DiagramView, TempModel, ModelViewSet);
        for ModelView in ModelViewSet do begin
          if (ModelView <> AView) and (ModelView.Model = M) then Continue;
          if ModelView = AView then Continue;
          V := UMLFactory.CreateView(DiagramView, AInclude, '', ModelView, AView);
          if Assigned(V) then ViewSet.Add(V);
        end;
      end;
      // (Extend) Case M is Base
      for I := 0 to (M as PUMLUseCase).ExtenderCount - 1 do begin
        AExtend := (M as PUMLUseCase).Extenders[I];
        TempModel := AExtend.Extension;
        FindViewByModel(DiagramView, TempModel, ModelViewSet);
        for ModelView in ModelViewSet do begin
          if (ModelView <> AView) and (ModelView.Model = M) then Continue;
          V := UMLFactory.CreateView(DiagramView, AExtend, '', ModelView, AView);
          if Assigned(V) then ViewSet.Add(V);
        end;
      end;
      // (Extend) Case M is Extension
      for I := 0 to (M as PUMLUseCase).ExtendCount - 1 do begin
        AExtend := (M as PUMLUseCase).Extends[I];
        TempModel := AExtend.Base;
        FindViewByModel(DiagramView, TempModel, ModelViewSet);
        for ModelView in ModelViewSet do begin
          if (ModelView <> AView) and (ModelView.Model = M) then Continue;
          if ModelView = AView then Continue;
          V := UMLFactory.CreateView(DiagramView, AExtend, '', AView, ModelView);
          if Assigned(V) then ViewSet.Add(V);
        end;
      end;
    end;
    // AssociationClass
    if M is PUMLClass then begin
      AAssociationClass := (M as PUMLClass).AssociationClass;
      if Assigned(AAssociationClass) then begin
        FindViewByModel(DiagramView, AAssociationClass.AssociationSide, ModelViewSet);
        for ModelView in ModelViewSet do begin
          V := UMLFactory.CreateView(DiagramView, AAssociationClass, '', ModelView, AView);
          if Assigned(V) then ViewSet.Add(V);
        end;
      end;
    end;
  finally
    ModelViewSet.Free;
  end;
end;

procedure PCreateViewCommand.FindViewByModel(DiagramView: PDiagramView; AModel: PModel; ASet: PViewOrderedSet);
var
  I: Integer;
  AView: PView;
begin
  ASet.Clear;
  for I := 0 to DiagramView.OwnedViewCount - 1 do begin
  //for OwnedView in DiagramView do begin
    AView := DiagramView.OwnedView[I];
    if (AView.Model = AModel) then ASet.Add(AView);
  end;
end;


procedure PCreateViewCommand.SetViewProperties(V: PView; EP: PElementPrototype);
begin
  SetViewPropertiesImpl(V,EP);
end;

// Finds element prototype and sets properties for view
procedure PCreateViewCommand.SetViewProperties(V: PView);
var
  VM: PExtensibleModel;
  Stereotype: PStereotype;
  Profile: PProfile;
  EP: PElementPrototype;
  ProtoName: string;
begin
  if V is PExtensibleView then begin
    VM := V.Model as PExtensibleModel;
    if Assigned(VM) then begin
      Stereotype := VM.GetStereotype;
      if Assigned(Stereotype) then begin
        Profile := Stereotype.Profile;
        Assert(Assigned(Profile),'Stereotype has no profile');
        ProtoName := Profile.FindPrototypeNameForStereotype(Stereotype.Name);
        EP := ExtensionManager.FindElementPrototype(Stereotype.Profile.Name, ProtoName);
        if Assigned(EP) then
          SetViewProperties(V, EP);
      end;
    end;
  end;

end;


function PCreateViewCommand.Precondition: Boolean;
begin
  Result := True;
end;

procedure PCreateViewCommand.SetParameter(DiagramView: PDiagramView; Model: PModel;
  ViewKind: string = ''; End1: PView = nil; End2: PView = nil);
var
  V: PView;
begin
  V := UMLFactory.CreateView(DiagramView, Model, ViewKind, End1, End2);
  ModelSet.Clear;
  ViewSet.Clear;
  if V <> nil then ViewSet.Add(V);
end;

procedure PCreateViewCommand.SetParameter(DiagramView: PDiagramView; X1, Y1, X2, Y2: Integer;
  Model: PModel; ViewKind: string = '');
var
  V: PView;
begin
  V := UMLFactory.CreateView(DiagramView, X1, Y1, X2, Y2, Model, ViewKind);
  ModelSet.Clear;
  ViewSet.Clear;
  if V <> nil then ViewSet.Add(V);
end;


// PCreateViewCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PCreateElementCommand

function PCreateElementCommand.Precondition: Boolean;
begin
  Result := True;
end;

procedure PCreateElementCommand.SetParameter(DiagramView: PDiagramView;
  ElementKind: string; Argument: Integer = 0; End1: PView = nil; End2: PView = nil);
var
  M: PModel;
  V: PView;
begin
  V := UMLFactory.CreateElement(DiagramView, ElementKind, Argument, End1, End2);
  M := V.Model;
  ModelSet.Clear;
  ViewSet.Clear;
  if M <> nil then ModelSet.Add(M);
  if V <> nil then ViewSet.Add(V);
end;

procedure PCreateElementCommand.SetParameter(DiagramView: PDiagramView;
  X1, Y1, X2, Y2: Integer; ElementKind: string; Argument: Integer = 0);
var
  M: PModel;
  V: PView;
begin
  V := UMLFactory.CreateElement(DiagramView, X1, Y1, X2, Y2, ElementKind, Argument);
  M := V.Model;
  ModelSet.Clear;
  ViewSet.Clear;
  if M <> nil then ModelSet.Add(M);
  if V <> nil then ViewSet.Add(V);
end;

// PCreateElementCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PCreateExtendedElementCommand

procedure PCreateExtendedElementCommand.SetModelProperties(M: PModel; EP: PElementPrototype);
var
  I: Integer;
begin
  if (M is PExtensibleModel) and (EP.StereotypeName <> '') then begin
    M.MOF_SetAttribute('StereotypeProfile', EP.Profile.Name);
    M.MOF_SetAttribute('StereotypeName', EP.StereotypeName);
  end;
  for I := 0 to EP.ModelPropertyCount - 1 do
    M.MOF_SetAttribute(EP.ModelPropertyNames[I], EP.ModelPropertyValues[I]);
end;

procedure PCreateExtendedElementCommand.SetViewProperties(V: PView; EP: PElementPrototype);
begin
  SetViewPropertiesImpl(V,EP);
end;

function PCreateExtendedElementCommand.Precondition: Boolean;
begin
  Result := (ViewSet.Count > 0);
end;

procedure PCreateExtendedElementCommand.SetParameter(DiagramView: PDiagramView;
  Profile: string; ElementPrototype: string; End1: PView = nil; End2: PView = nil);
var
  EP: PElementPrototype;
  M: PModel;
  V: PView;
begin
  ModelSet.Clear;
  ViewSet.Clear;
  EP := ExtensionManager.FindElementPrototype(Profile, ElementPrototype);
  if EP <> nil then begin
    V := UMLFactory.CreateElement(DiagramView, EP.BaseElement, EP.Argument, End1, End2);
    if V <> nil then begin
      M := V.Model;
      if M <> nil then begin
        SetModelProperties(M, EP);
        ModelSet.Add(M);
      end;
      SetViewProperties(V, EP);
      ViewSet.Add(V);
    end;
  end;
end;

procedure PCreateExtendedElementCommand.SetParameter(DiagramView: PDiagramView;
  X1, Y1, X2, Y2: Integer; Profile: string; ElementPrototype: string);
var
  EP: PElementPrototype;
  M: PModel;
  V: PView;
begin
  ModelSet.Clear;
  ViewSet.Clear;
  EP := ExtensionManager.FindElementPrototype(Profile, ElementPrototype);
  if EP <> nil then begin
    V := UMLFactory.CreateElement(DiagramView, X1, Y1, X2, Y2, EP.BaseElement, EP.Name, EP.Argument);
    if V <> nil then begin
      M := V.Model;
      if M <> nil then begin
        SetModelProperties(M, EP);
        ModelSet.Add(M);
      end;
      SetViewProperties(V, EP);
      ViewSet.Add(V);
    end;
  end;
end;

// PCreateExtendedElementCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PNewViewByDragDropCommand

function PNewViewByDragDropCommand.FindContainedView(ContainerView: PView; Model: PModel): PView;
var
  V: PView;
  I: Integer;
begin
  Result := nil;
  for I := 0 to ContainerView.ContainedViewCount - 1 do begin
    V := ContainerView.ContainedViews[I];
    if V.Model = Model then begin
      Result := ContainerView.ContainedViews[I];
      Exit;
    end;
    V := FindContainedView(V, Model);
    if V <> nil then begin
      Result := V;
      Exit;
    end;
  end;
end;

function PNewViewByDragDropCommand.FindViewInDiagramView(DiagramView: PDiagramView; Model: PModel; X, Y: Integer): PView;
var
  V: PView;
  I: Integer;
begin
  Result := nil;
  V := DiagramView.GetViewAt(DiagramView.Canvas, X, Y);
  if (V <> nil) and (V.Model = Model) then begin
    Result := V;
    Exit;
  end;
  for I := 0 to DiagramView.OwnedViewCount - 1 do begin
    V := DiagramView.OwnedView[I];
    if V.Model = Model then begin
      Result := DiagramView.OwnedView[I];
      Exit;
    end;
    V := FindContainedView(V, Model);
    if V <> nil then begin
      Result := V;
      Exit;
    end;
  end;
end;

procedure PNewViewByDragDropCommand.SetParameterGeneralElem(DiagramView: PDiagramView;
  Model: PModel; X, Y: Integer);
var
  M: PModel;
  V, ContainerView: PView;
  S: PStereotype;
  R: TRect;
  C: TPoint;

begin
  M := nil;
  V := nil;
  ModelSet.Clear;
  ViewSet.Clear;
  { When a activitygraph model element is dropped on an activity-diagram }
  // if Model is PUMLActivityGraph then
  // begin
  //   V := UMLFactory.CreateElement(DiagramView, X, Y, X, Y, 'SubactivityState');
  //   M := V.Model;
  //   if M <> nil then (M as PUMLSubactivityState).Submachine := Model as PUMLStatemachine;
  // end
  { When a statemachine model element is dropped on a statechart-diagram }
  if Model is PUMLStatemachine then
  begin
    if DiagramView is PUMLStatechartDiagramView then begin
      V := UMLFactory.CreateElement(DiagramView, X, Y, X, Y, 'SubmachineState');
      M := V.Model;
      if M <> nil then (M as PUMLSubmachineState).Submachine := Model as PUMLStatemachine;
    end else if DiagramView is PUMLActivityDiagramView then begin
      V := UMLFactory.CreateElement(DiagramView, X, Y, X, Y, 'SubactivityState');
      M := V.Model;
      if M <> nil then (M as PUMLSubactivityState).Submachine := Model as PUMLStatemachine;
    end;
  end
  { When a class|actor|component|node model element is dropped on an instance-type diagram }
  else if ((DiagramView is PUMLSequenceDiagramView) or (DiagramView is PUMLCollaborationDiagramView)) and
          (Model is PUMLClassifier) then
  begin
    V := UMLFactory.CreateElement(DiagramView, X, Y, X, Y, 'Object');
    M := V.Model;
    if M <> nil then begin
      (M as PUMLObject).Classifier := Model as PUMLClassifier;
      (M as PUMLObject).Name := '';
      S := (Model as PUMLClassifier).GetStereotype;
      if (S <> nil) and S.CanApplyTo('UMLObject') then
        (M as PUMLObject).SetStereotype(S.Profile.Name, S.Name);
    end;
  end
  { When a class|actor|component|node model element is dropped on an role-type diagram }
  else if ((DiagramView is PUMLSequenceRoleDiagramView) or (DiagramView is PUMLCollaborationRoleDiagramView)) and
          (Model is PUMLClassifier) and not (Model is PUMLClassifierRole) then
  begin
    V := UMLFactory.CreateElement(DiagramView, X, Y, X, Y, 'ClassifierRole');
    M := V.Model;
    if M <> nil then begin
      (M as PUMLClassifierRole).Base := Model as PUMLClassifier;
      (M as PUMLClassifierRole).Name := '';
      S := (Model as PUMLClassifier).GetStereotype;
      if (S <> nil) and S.CanApplyTo('UMLClassifierRole') then
        (M as PUMLClassifierRole).SetStereotype(S.Profile.Name, S.Name);
    end;
  end
  { When a port model element is dropped on structural diagram }
  else if Model is PUMLPort then
  begin
    ContainerView := FindViewInDiagramView(DiagramView, (Model as PUMLPort).Owner, X, Y);
    if ContainerView = nil then begin
      ContainerView := UMLFactory.CreateView(DiagramView, X, Y, X, Y, (Model as PUMLPort).Owner);
      ViewSet.Add(ContainerView);
    end;
    R := ContainerView.GetBoundingBox(DiagramView.Canvas);
    if PointInRect(R, Point(X, Y)) then
      V := UMLFactory.CreateView(DiagramView, X, Y, X, Y, Model)
    else begin
      C := GetCenter(R);
      V := UMLFactory.CreateView(DiagramView, C.X, C.Y, C.X, C.Y, Model);
    end;
  end
  else if Model is PUMLAttribute then
  begin
    ContainerView := FindViewInDiagramView(DiagramView, (Model as PUMLAttribute).Owner, X, Y);
    if ContainerView = nil then begin
      ContainerView := UMLFactory.CreateView(DiagramView, X, Y, X, Y, (Model as PUMLAttribute).Owner);
      ViewSet.Add(ContainerView);
    end;
    R := ContainerView.GetBoundingBox(DiagramView.Canvas);
    if PointInRect(R, Point(X, Y)) then
      V := UMLFactory.CreateView(DiagramView, X, Y, X, Y, Model)
    else begin
      C := GetCenter(R);
      V := UMLFactory.CreateView(DiagramView, C.X, C.Y, C.X, C.Y, Model);
    end;
  end
  { When a general-type model element is dropped on a diagram }
  else begin
    V := UMLFactory.CreateView(DiagramView, X, Y, X, Y, Model);
  end;
  if Assigned(M) then ModelSet.Add(M);
  if Assigned(V) then
    ViewSet.Add(V);

  if (M = nil) and (V <> nil) then ComplementEdgeViews(DiagramView, V);
end;

procedure PNewViewByDragDropCommand.SetParameterEdgeTypeElem(DiagramView: PDiagramView;
  Model: PModel; X, Y: Integer);

  procedure CreateEdgeTypeView(ElemKind: PClass; Tail, Head: PUMLModelElement);
  var
    TailView, HeadView: PView;
    TempTailView, TempHeadView: PView;
    AView: PView;
    TailViewSet, HeadViewSet: PViewOrderedSet;
    K: Integer;
    B: Boolean;
    V: PView;
  begin
    TailViewSet := PViewOrderedSet.Create;
    HeadViewSet := PViewOrderedSet.Create;
    try
      FindViewByModel(DiagramView, Tail, TailViewSet);
      FindViewByModel(DiagramView, Head, HeadViewSet);
      for TailView in TailViewSet do begin
        for HeadView in HeadViewSet do begin
          B := True;
          for K := 0 to Model.ViewCount - 1 do begin
            AView := Model.View[K];
            if AView is ElemKind then begin
              TempTailView := (AView as PEdgeView).Tail;
              TempHeadView := (AView as PEdgeView).Head;
              if (TempTailView = TailView) and (TempHeadView = HeadView) then begin
                B := False;
                Break;
              end;
            end;
          end;
          if B then begin
            V := UMLFactory.CreateView(DiagramView, Model, '', TailView, HeadView);
            if Assigned(V) then
              ViewSet.Add(V);
          end;
        end;
      end;
    finally
      TailViewSet.Free;
      HeadViewSet.Free;
    end;
  end;
var
  Tail, Head: PUMLModelElement;
begin
  ModelSet.Clear;
  ViewSet.Clear;

  // UMLRealization
  if Model is PUMLRealization then begin
    Tail := (Model as PUMLRealization).Client;
    Head := (Model as PUMLRealization).Supplier;
    CreateEdgeTypeView(PUMLRealizationView, Tail, Head);
  end
  // UMLDependency
  else if Model is PUMLDependency then begin
    Tail := (Model as PUMLDependency).Client;
    Head := (Model as PUMLDependency).Supplier;
    CreateEdgeTypeView(PUMLDependencyView, Tail, Head);
  end
  // UMLGeneralization
  else if Model is PUMLGeneralization then begin
    Tail := (Model as PUMLGeneralization).Child;
    Head := (Model as PUMLGeneralization).Parent;
    CreateEdgeTypeView(PUMLGeneralizationView, Tail, Head);
  end
  // UMLAssociationClass
  else if Model is PUMLAssociationClass then begin
    Tail := (Model as PUMLAssociationClass).AssociationSide;
    Head := (Model as PUMLAssociationClass).ClassSide;
    CreateEdgeTypeView(PUMLAssociationClassView, Tail, Head);
  end
  // UMLAssociation
  else if Model is PUMLAssociation then begin
    Tail := (Model as PUMLAssociation).Connections[0].Participant;
    Head := (Model as PUMLAssociation).Connections[1].Participant;
    CreateEdgeTypeView(PUMLAssociationView, Tail, Head);
  end
  // UMLLink
  else if Model is PUMLLink then begin
    Tail := (Model as PUMLLink).Connections[0].Instance;
    Head := (Model as PUMLLink).Connections[1].Instance;
    CreateEdgeTypeView(PUMLLinkView, Tail, Head);
  end
  // UMLAssociationRole
  else if Model is PUMLAssociationRole then begin
    Tail := (Model as PUMLAssociationRole).Connections[0].Participant;
    Head := (Model as PUMLAssociationRole).Connections[1].Participant;
    CreateEdgeTypeView(PUMLAssociationRoleView, Tail, Head);
  end
  // UMLInclude
  else if Model is PUMLInclude then begin
    Tail := (Model as PUMLInclude).Base;
    Head := (Model as PUMLInclude).Addition;
    CreateEdgeTypeView(PUMLIncludeView, Tail, Head);
  end
  // UMLExtend
  else if Model is PUMLExtend then begin
    Tail := (Model as PUMLExtend).Extension;
    Head := (Model as PUMLExtend).Base;
    CreateEdgeTypeView(PUMLExtendView, Tail, Head);
  end
  // UMLTransition
  else if Model is PUMLTransition then begin
    Tail := (Model as PUMLTransition).Source;
    Head := (Model as PUMLTransition).Target;
    CreateEdgeTypeView(PUMLTransitionView, Tail, Head);
  end
  else if Model is PUMLConnector then begin
    Tail := (Model as PUMLConnector).Ends[0];
    Head := (Model as PUMLConnector).Ends[1];
    CreateEdgeTypeView(PUMLConnectorView, Tail, Head);
  end;
  // UMLStimulus
  // UMLMessage
end;

procedure PNewViewByDragDropCommand.SetParameter(DiagramView: PDiagramView; Model: PModel; X, Y: Integer);
var
  V: PView;
begin
  if (Model is PUMLDependency) or (Model is PUMLGeneralization) or
     (Model is PUMLAssociation) or (Model is PUMLAssociationClass) or
     (Model is PUMLLink) or (Model is PUMLAssociationRole) or
     (Model is PUMLStimulus) or (Model is PUMLMessage) or
     (Model is PUMLInclude) or (Model is PUMLExtend) or
     (Model is PUMLRealization) or (Model is PUMLTransition) or
     (Model is PUMLConnector) then
  begin
    SetParameterEdgeTypeElem(DiagramView, Model, X, Y);
  end
  else begin
    SetParameterGeneralElem(DiagramView, Model, X, Y);
  end;
  for V in ViewSet do
    SetViewProperties(V);
end;

// PNewViewByDragDropCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PNewViewsByCopyPasteCommand

function PNewViewsByCopyPasteCommand.Precondition: Boolean;
begin
  Result := not (ViewSet.IsEmpty);
end;

procedure PNewViewsByCopyPasteCommand.SetParameter(Views: PViewOrderedSet; Target: PDiagramView);
var
  J: Integer;
  AView: PView;
  ANodeView: PNodeView;
  AEdgeView: PEdgeView;
  Point: TPoint;
begin
  ModelSet.Clear;
  ViewSet.Clear;
  Target.DeselectAll;

  for AView in Views do begin

    if AView is PNodeView then begin
      ANodeView := AView as PNodeView;
      ANodeView.Left := ANodeView.Left + 10;
      ANodeView.Top := ANodeView.Top + 10;
      //ComplementEdgeViews(Target, AView);
    end
    else if AView is PEdgeView then begin
      AEdgeView := AView as PEdgeView;
      for J := 0 to AEdgeView.Points.Count - 1 do begin
        Point := AEdgeView.Points[J];
        Point.X := Point.X + 10;
        Point.Y := Point.Y + 10;
      end;
    end;
    Target.AddOwnedView(AView);
    //AView.Selected := True;
    ViewSet.Add(AView);
    //if AView <> nil then
      //ComplementEdgeViews(Target, AView);
  end; // End of for
end;

// PNewViewsByCopyPasteCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PDeleteElementsCommand

constructor PDeleteElementsCommand.Create;
begin
  inherited;
  ModelTable := PTable.Create(['MODEL', 'OWNER', 'IDX', 'RELATION']);
  ViewTable := PTable.Create(['VIEW', 'DIAGRAM', 'IDX']);
end;

destructor PDeleteElementsCommand.Destroy;
begin
  if CommandPos = cpUnexecuteStack then FreeAll;
  ModelTable.Free;
  ViewTable.Free;
  inherited;
end;

function PDeleteElementsCommand.Precondition: Boolean;
begin
  Result := (ModelSet.Count + ViewSet.Count) > 0;
end;

procedure PDeleteElementsCommand.SetParameter(AModelSet: PModelOrderedSet; AViewSet: PViewOrderedSet);
var
  I, Idx: Integer;
  R, OtherSide: PMetaAssociationEnd;
  M, Owner: PModel;
  V: PView;
  Dgm: PDiagramView;
begin
  ModelSet.Clear;
  ViewSet.Clear;
  ModelSet.Assign(AModelSet);
  ViewSet.Assign(AViewSet);
  // Store index of each model object.
  ModelTable.Clear;
  for I := 0 to ModelSet.Count - 1 do
  begin
    M := ModelSet.Items[I] as PModel;
    Owner := M.VirtualNamespace;
    R := M.GetContainerRelation(Owner);
    if (Owner <> nil) and (R <> nil) and (R.GetOtherSideEnd is PMetaCollection) then
    begin
      OtherSide := R.GetOtherSideEnd;
      Idx := Owner.MOF_IndexOfCollectionItem(OtherSide.Name, M);
      ModelTable.AddRow(
        ['', '', IntToStr(Idx), OtherSide.Name],
        [M, Owner, nil, nil]);
    end;
  end;
  // Store index of each view object.
  ViewTable.Clear;
  for I := 0 to ViewSet.Count - 1 do
  begin
    V := ViewSet.Items[I] as PView;
    Dgm := V.OwnerDiagramView;
    if Dgm <> nil then
    begin
      Idx := Dgm.IndexOfOwnedView(V);
      ViewTable.AddRow(['', '', IntToStr(Idx)], [V, Dgm, nil]);
    end;
  end;
end;

procedure PDeleteElementsCommand.Reexecute;
var
  I: Integer;
begin
  // OnElementsDeleting event occurs.
  ElementsDeleting;
  // Isolate all model objects.
  for I := 0 to FModelReferences.Count - 1 do
    (FModelReferences.Items[I] as PElement).Isolate;
  // Isolate all view objects.
  for I := 0 to FViewReferences.Count - 1 do
    (FViewReferences.Items[I] as PElement).Isolate;
  // OnElementsDeleted event occurs.
  ElementsDeleted;
end;

procedure PDeleteElementsCommand.Unexecute;
var
  I: Integer;
  M, Owner: PModel;
  V: PView;
  Dgm: PDiagramView;
  R: string;
  Idx: Integer;
begin
  // Restore states of all models using mementos.
  for I := 0 to FModelReferences.Count - 1 do
    (FModelReferences.Items[I] as PElement).SetMemento(FModelMementos.Items[I]);
  // return to original index of deleted model
  for I := 0 to ModelTable.RowCount - 1 do
  begin
    M := ModelTable.GetObjectAt(I, 'MODEL') as PModel;
    Owner := ModelTable.GetObjectAt(I, 'OWNER') as PModel;
    R := ModelTable.GetValueAt(I, 'RELATION');
    if (Owner <> nil) and (R <> '') then
      Owner.MOF_RemoveCollectionItem(R, M);
  end;
  ModelTable.SortByColumn('IDX', True);
  for I := 0 to ModelTable.RowCount - 1 do
  begin
    M := ModelTable.GetObjectAt(I, 'MODEL') as PModel;
    Owner := ModelTable.GetObjectAt(I, 'OWNER') as PModel;
    R := ModelTable.GetValueAt(I, 'RELATION');
    Idx := StrToInt(ModelTable.GetValueAt(I, 'IDX'));
    if (Owner <> nil) and (Idx > -1) and (R <> '') then
      Owner.MOF_InsertCollectionItem(R, Idx, M);
  end;
  // Restore states of all views using mementos.
  for I := 0 to FViewReferences.Count - 1 do
    (FViewReferences.Items[I] as PElement).SetMemento(FViewMementos.Items[I]);
  // return to original index of deleted view
  for I := 0 to ViewTable.RowCount - 1 do
  begin
    V := ViewTable.GetObjectAt(I, 'VIEW') as PView;
    Dgm := ViewTable.GetObjectAt(I, 'DIAGRAM') as PDiagramView;
    if Dgm <> nil then Dgm.RemoveOwnedView(V);
  end;
  ViewTable.SortByColumn('IDX', True);
  for I := 0 to ViewTable.RowCount - 1 do
  begin
    V := ViewTable.GetObjectAt(I, 'VIEW') as PView;
    Dgm := ViewTable.GetObjectAt(I, 'DIAGRAM') as PDiagramView;
    Idx := StrToInt(ViewTable.GetValueAt(I, 'IDX'));
    if (Dgm <> nil) and (Idx > -1) then
      Dgm.InsertOwnedView(Idx, V);
  end;
  // OnElementsCreated event occurs.
  ElementsCreated;
end;

// PDeleteElementsCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeModelsAttributeCommand

constructor PChangeModelsAttributeCommand.Create;
begin
  inherited;
  OldValues := TStringList.Create;
end;

destructor PChangeModelsAttributeCommand.Destroy;
begin
  OldValues.Free;
  inherited;
end;

function PChangeModelsAttributeCommand.Precondition: Boolean;
begin
  Result := not ModelSet.IsEmpty;
end;

procedure PChangeModelsAttributeCommand.Preprocess;
begin
  inherited;
  // Store sizes of views
  StoreViewSizes;
end;

procedure PChangeModelsAttributeCommand.Reexecute;
var
  I: Integer;
  M: PModel;
begin
  // set all model's key property's value to NewValue
  for I := 0 to ModelSet.Count - 1 do
  begin
    M := ModelSet.Items[I] as PModel;
    M.MOF_SetAttribute(Key, NewValue);
  end;
  // fire Models Change Event
  ModelsChanged;
end;

procedure PChangeModelsAttributeCommand.Unexecute;
var
  I: Integer;
  M: PModel;
begin
  // restore all model's key property value to previous value(OldValues)
  for I := 0 to ModelSet.Count - 1 do
  begin
    M := ModelSet.Items[I] as PModel;
    M.MOF_SetAttribute(Key, OldValues[I]);
  end;
  // Restore sizes of views
  RestoreViewSizes;
  // fire models change event
  ModelsChanged;
end;

procedure PChangeModelsAttributeCommand.SetParameter(AModelSet: PModelOrderedSet; AKey: string; ANewValue: string);
var
  I: Integer;
  M: PModel;
begin
  ModelSet.Assign(AModelSet);
  Key := AKey;
  NewValue := ANewValue;
  OldValues.Clear;
  for I := 0 to ModelSet.Count - 1 do
  begin
    M := ModelSet.Items[I] as PModel;
    if M.MetaClass.ExistsAttribute(Key) then
      OldValues.Add(M.MOF_GetAttribute(Key))
    else
      OldValues.Add('');
  end;
  SizePreservingViews.Clear;
  CollectSizesFromModelSet(AModelSet);
end;

// PChangeModelsAttributeCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeModelsReferenceCommand

constructor PChangeModelsReferenceCommand.Create;
begin
  inherited;
  OldValues := PElementList.Create;
end;

destructor PChangeModelsReferenceCommand.Destroy;
begin
  OldValues.Free;
  inherited;
end;

function PChangeModelsReferenceCommand.Precondition: Boolean;
begin
  Result := not ModelSet.IsEmpty;
end;

procedure PChangeModelsReferenceCommand.Preprocess;
begin
  inherited;
  // Store sizes of views
  StoreViewSizes;
end;

procedure PChangeModelsReferenceCommand.Reexecute;
var
  Model: PModel;
begin
  for Model in ModelSet do
    Model.MOF_SetReference(Key, NewValue);
  // fire model change event
  ModelsChanged;
end;

procedure PChangeModelsReferenceCommand.Unexecute;
var
  I: Integer;
begin
  for I := 0 to ModelSet.Count - 1 do begin
    ModelSet[I].MOF_SetReference(Key, OldValues[I]);
  end;
  // Restore sizes of views
  RestoreViewSizes;
  // fire model change event
  ModelsChanged;
end;

procedure PChangeModelsReferenceCommand.SetParameter(AModelSet: PModelOrderedSet; AKey: string; ANewValue: PModel);
var
  I: Integer;
begin
  ModelSet.Assign(AModelSet);
  Key := AKey;
  NewValue := ANewValue;
  OldValues.Clear;
  // Using explicit iterator to be sure that indices for ModelSet and OldValues match.
  for I := 0 to ModelSet.Count - 1 do
    OldValues.Add(ModelSet[I].MOF_GetReference(Key));
  SizePreservingViews.Clear;
  CollectSizesFromModelSet(AModelSet);
end;

// PChangeModelsReferenceCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PClearCollectionCommand

constructor PClearCollectionCommand.Create;
begin
  inherited;
  Items := PElementOrderedSet.Create;
end;

destructor PClearCollectionCommand.Destroy;
begin
  Items.Free;
  inherited;
end;

function PClearCollectionCommand.Precondition: Boolean;
begin
  Result := (Element <> nil);
end;

procedure PClearCollectionCommand.Reexecute;
begin
  Element.MOF_ClearCollection(Key);
  // fire model change event
  ModelsChanged;
end;

procedure PClearCollectionCommand.Unexecute;
var
  I: Integer;
begin
  for I := 0 to Items.Count - 1 do
    Element.MOF_AddCollectionItem(Key, Items[I]);
  // fire model change event
  ModelsChanged;
end;

procedure PClearCollectionCommand.SetParameter(AElement: PModel; AKey: string);
var
  I: Integer;
begin
  ModelSet.Clear;
  ModelSet.Add(AElement);
  Element := AElement;
  Key := AKey;
  // preserve collection's items
  Items.Clear;
  for I := 0 to Element.MOF_GetCollectionCount(Key) - 1 do
    Items.Add(Element.MOF_GetCollectionItem(Key, I));
end;

// PClearCollectionCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAddCollectionItemCommand

function PAddCollectionItemCommand.Precondition: Boolean;
begin
  Result := (Value <> nil);
end;

procedure PAddCollectionItemCommand.Reexecute;
begin
  Element.MOF_AddCollectionItem(Key, Value);
  // fire model change event
  ModelsChanged;
end;

procedure PAddCollectionItemCommand.Unexecute;
begin
  Element.MOF_RemoveCollectionItem(Key, Value);
  // fire model change event
  ModelsChanged;
end;

procedure PAddCollectionItemCommand.SetParameter(AElement: PElement; AKey: string; AValue: PElement);
begin
  ModelSet.Clear;
  ModelSet.Add(AElement as PModel);
  Element := AElement;
  Key := AKey;
  Value := AValue;
end;

// PAddCollectionItemCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PRemoveCollectionItemCommand

function PRemoveCollectionItemCommand.Precondition: Boolean;
begin
  Result := (Value <> nil);
end;

procedure PRemoveCollectionItemCommand.Reexecute;
begin
  Element.MOF_RemoveCollectionItem(Key, Value);
  // fire model change event
  ModelsChanged;
end;

procedure PRemoveCollectionItemCommand.Unexecute;
begin
  Element.MOF_AddCollectionItem(Key, Value);
  // fire model change event
  ModelsChanged;
end;

procedure PRemoveCollectionItemCommand.SetParameter(AElement: PElement; AKey: string; AValue: PElement);
begin
  ModelSet.Clear;
  ModelSet.Add(AElement as PModel);
  Element := AElement;
  Key := AKey;
  Value := AValue;
end;

// PRemoveCollectionItemCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PInsertCollectionItemCommand

function PInsertCollectionItemCommand.Precondition: Boolean;
begin
  Result := (Value <> nil);
end;

procedure PInsertCollectionItemCommand.Reexecute;
begin
  Element.MOF_InsertCollectionItem(Key, Index, Value);
  // fire model change event
  ModelsChanged;
end;

procedure PInsertCollectionItemCommand.Unexecute;
begin
  Element.MOF_RemoveCollectionItem(Key, Value);
  // fire model change event
  ModelsChanged;
end;

procedure PInsertCollectionItemCommand.SetParameter(AElement: PElement; AKey: string; AIndex: Integer; AValue: PElement);
begin
  ModelSet.Clear;
  ModelSet.Add(AElement as PModel);
  Element := AElement;
  Key := AKey;
  Value := AValue;
  Index := AIndex;
end;

// PInsertCollectionItemCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PDeleteCollectionItemCommand

function PDeleteCollectionItemCommand.Precondition: Boolean;
begin
  Result := (Value <> nil);
end;

procedure PDeleteCollectionItemCommand.Reexecute;
begin
  Element.MOF_DeleteCollectionItem(Key, Index);
  // fire model change event
  ModelsChanged;
end;

procedure PDeleteCollectionItemCommand.Unexecute;
begin
  Element.MOF_InsertCollectionItem(Key, Index, Value);
  // fire model change event
  ModelsChanged;
end;

procedure PDeleteCollectionItemCommand.SetParameter(AElement: PElement; AKey: string; AIndex: Integer);
begin
  ModelSet.Clear;
  ModelSet.Add(AElement as PModel);
  Element := AElement;
  Key := AKey;
  Index := AIndex;
  Value := Element.MOF_GetCollectionItem(Key, Index) as PModel;
end;

// PDeleteCollectionItemCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeCollectionItemOrderCommand

function PChangeCollectionItemOrderCommand.Precondition: Boolean;
begin
  Result := (NewIndex > -1) and (NewIndex < Element.MOF_GetCollectionCount(Key));
end;

procedure PChangeCollectionItemOrderCommand.Reexecute;
begin
  Element.MOF_RemoveCollectionItem(Key, FCollectionItem);
  Element.MOF_InsertCollectionItem(Key, NewIndex, FCollectionItem);
  // fire model change event
  ModelsChanged;
end;

procedure PChangeCollectionItemOrderCommand.Unexecute;
begin
  Element.MOF_RemoveCollectionItem(Key, FCollectionItem);
  Element.MOF_InsertCollectionItem(Key, OldIndex, FCollectionItem);
  // fire model change event
  ModelsChanged;
end;

procedure PChangeCollectionItemOrderCommand.SetParameter(AElement: PElement; ACollectionItem: PElement; AKey: string; ANewIndex: Integer);
begin
  ModelSet.Clear;
  ModelSet.Add(AElement as PModel);
  Element := AElement;
  FCollectionItem := ACollectionItem;
  Key := AKey;
  OldIndex := Element.MOF_IndexOfCollectionItem(Key, ACollectionItem);
  NewIndex := ANewIndex;
end;

// PChangeCollectionItemOrderCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeTypeExpressionCommand

function PChangeTypeExpressionCommand.Precondition: Boolean;
begin
  Result := ((Model is PUMLStructuralFeature) or (Model is PUMLParameter));
end;

procedure PChangeTypeExpressionCommand.Preprocess;
begin
  inherited;
  // Store sizes of views
  StoreViewSizes;
end;

procedure PChangeTypeExpressionCommand.Reexecute;
begin
  if Model is PUMLStructuralFeature then begin
    (Model as PUMLStructuralFeature).TypeExpression := NewTypeExpr;
    (Model as PUMLStructuralFeature).Type_ := NewTypeRef as PUMLClassifier;
  end
  else if Model is PUMLParameter then begin
    (Model as PUMLParameter).TypeExpression := NewTypeExpr;
    (Model as PUMLParameter).Type_ := NewTypeRef as PUMLClassifier;
  end;
  // fire model change event
  ModelsChanged;
end;

procedure PChangeTypeExpressionCommand.Unexecute;
begin
  if Model is PUMLStructuralFeature then begin
    (Model as PUMLStructuralFeature).TypeExpression := OldTypeExpr;
    (Model as PUMLStructuralFeature).Type_ := OldTypeRef as PUMLClassifier;
  end
  else if Model is PUMLParameter then begin
    (Model as PUMLParameter).TypeExpression := OldTypeExpr;
    (Model as PUMLParameter).Type_ := OldTypeRef as PUMLClassifier;
  end;
  // Restore sizes of views
  RestoreViewSizes;
  // fire model change event
  ModelsChanged;
end;

procedure PChangeTypeExpressionCommand.SetParameter(AModel: PModel; TypeExpr: string; TypeRef: PModel);
begin
  ModelSet.Clear;
  ModelSet.Add(AModel);
  Model := AModel;
  if AModel is PUMLStructuralFeature then begin
    OldTypeExpr := (AModel as PUMLStructuralFeature).TypeExpression;
    OldTypeRef := (AModel as PUMLStructuralFeature).Type_;
  end
  else if AModel is PUMLParameter then begin
    OldTypeExpr := (AModel as PUMLParameter).TypeExpression;
    OldTypeRef := (AModel as PUMLParameter).Type_;
  end;
  NewTypeExpr := TypeExpr;
  NewTypeRef := TypeRef;
  if NewTypeRef <> nil then begin
    NewTypeExpr := NewTypeRef.Name;
  end
  else begin
    if TypeExpr <> '' then begin
      NewTypeRef := SearchElement(AModel as PUMLElement, NewTypeExpr);
      if not (NewTypeRef is PUMLClassifier) then NewTypeRef := nil;
      if NewTypeRef <> nil then NewTypeExpr := NewTypeRef.Name;
    end;
  end;
  SizePreservingViews.Clear;
  CollectSizesFromModel(AModel);
end;

// PChangeTypeExpressionCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeValueExpressionCommand

function PChangeValueExpressionCommand.Precondition: Boolean;
begin
  Result := (Model is PUMLAttributeLink);
end;

procedure PChangeValueExpressionCommand.Preprocess;
begin
  inherited;
  // Store sizes of views
  StoreViewSizes;
end;

procedure PChangeValueExpressionCommand.Reexecute;
begin
  (Model as PUMLAttributeLink).ValueExpression := NewValueExpr;
  (Model as PUMLAttributeLink).Value_ := NewValueRef as PUMLInstance;
  // fire model change event
  ModelsChanged;
end;

procedure PChangeValueExpressionCommand.Unexecute;
begin
  (Model as PUMLAttributeLink).ValueExpression := OldValueExpr;
  (Model as PUMLAttributeLink).Value_ := OldValueRef as PUMLInstance;
  // Restore sizes of views
  RestoreViewSizes;
  // fire model change event
  ModelsChanged;
end;

procedure PChangeValueExpressionCommand.SetParameter(AModel: PModel; ValueExpr: string; ValueRef: PModel);
begin
  ModelSet.Clear;
  ModelSet.Add(AModel);
  Model := AModel;
  if AModel is PUMLAttributeLink then begin
    OldValueExpr := (AModel as PUMLAttributeLink).ValueExpression;
    OldValueRef := (AModel as PUMLAttributeLink).Value_;
  end;
  NewValueExpr := ValueExpr;
  NewValueRef := ValueRef;
  if NewValueRef <> nil then begin
    NewValueExpr := NewValueRef.Name;
  end
  else begin
    if ValueExpr <> '' then begin
      NewValueRef := SearchElement(AModel as PUMLElement, NewValueExpr);
      if not (NewValueRef is PUMLInstance) then NewValueRef := nil;
      if NewValueRef <> nil then NewValueExpr := NewValueRef.Name;
    end;
  end;
  SizePreservingViews.Clear;
  CollectSizesFromModel(AModel);
end;

// PChangeValueExpressionCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeActionKindCommand

constructor PChangeActionKindCommand.Create;
begin
  inherited;
  Model := nil;
  OldAction := nil;
  NewAction := nil;
  OldActionMemento := nil;
  NewActionMemento := nil;
end;

destructor PChangeActionKindCommand.Destroy;
begin
  if CommandPos = cpReexecuteStack then NewAction.Free
  else if CommandPos = cpUnexecuteStack then OldAction.Free;
  if OldActionMemento <> nil then
    OldActionMemento.Free;
  inherited;
end;

function PChangeActionKindCommand.Precondition: Boolean;
begin
  Result := ((Model is PUMLStimulus) or (Model is PUMLMessage));
end;

procedure PChangeActionKindCommand.Preprocess;
begin
  OldActionMemento := OldAction.CreateMemento;
  NewActionMemento := NewAction.CreateMemento;
end;

procedure PChangeActionKindCommand.Reexecute;
begin
  // Trigger ElementsDeleting, ElementDeleted events.
  ModelSet.Clear;
  ModelSet.Add(OldAction);
  ElementsDeleting;
  //ElementsDeleted; // The control will update itself
  // Change to NewAction.
  OldAction.Isolate;
  NewAction.SetMemento(NewActionMemento);
  if Model is PUMLStimulus then
    (Model as PUMLStimulus).Action := NewAction
  else if Model is PUMLMessage then
    (Model as PUMLMessage).Action := NewAction;
  // Tigger ElementsCreated event
  ModelSet.Clear;
  ModelSet.Add(NewAction);
  ElementsCreated;
end;

procedure PChangeActionKindCommand.Unexecute;
begin
  // Trigger ElementsDeleting, ElementDeleted events.
  ModelSet.Clear;
  ModelSet.Add(NewAction);
  ElementsDeleting;
  ElementsDeleted;
  // Change to OldAction.
  NewAction.Isolate;
  OldAction.SetMemento(OldActionMemento);
  // Tigger ElementsCreated event.
  ModelSet.Clear;
  ModelSet.Add(OldAction);
  ElementsCreated;
end;

procedure PChangeActionKindCommand.SetParameter(AModel: PModel; ActionKind: string);
begin
  Model := AModel;
  ModelSet.Clear;
  ModelSet.Add(AModel);
  if AModel is PUMLStimulus then
    OldAction := (AModel as PUMLStimulus).Action
  else if AModel is PUMLMessage then
    OldAction := (AModel as PUMLMessage).Action;
  if ActionKind = 'CALL' then
    NewAction := MetaModel.CreateInstance('UMLCallAction') as PUMLCallAction
  else if ActionKind = 'SEND' then
    NewAction := MetaModel.CreateInstance('UMLSendAction') as PUMLSendAction
  else if ActionKind = 'RETURN' then
    NewAction := MetaModel.CreateInstance('UMLReturnAction') as PUMLReturnAction
  else if ActionKind = 'CREATE' then
    NewAction := MetaModel.CreateInstance('UMLCreateAction') as PUMLCreateAction
  else if ActionKind = 'DESTROY' then
    NewAction := MetaModel.CreateInstance('UMLDestroyAction') as PUMLDestroyAction;
end;

// PChangeActionKindCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PMoveViewsCommand

function PMoveViewsCommand.Precondition: Boolean;
begin
  if FViewSet.Count <= 0 then begin
    Result := False;
    Exit;
  end;
  Result := not ((DX = 0) and (DY = 0));
end;

procedure PMoveViewsCommand.SetParameter(ADiagramView: PDiagramView; AViewSet: PViewOrderedSet; ADX, ADY: Integer);
var
  V: PView;
  E: PEdgeView;
  I, J: Integer;
begin
  ViewSet.Assign(AViewSet);
  DiagramView := ADiagramView;
  DX := ADX;
  DY := ADY;
  // Include Self-EdgeView in ViewSet
  for I := ViewSet.Count - 1 downto 0 do begin
    V := ViewSet.Items[I] as PView;
    if V is PNodeView then
      for J := 0 to ADiagramView.OwnedViewCount - 1 do
        if ADiagramView.OwnedView[J] is PEdgeView then begin
          E := ADiagramView.OwnedView[J] as PEdgeView;
          if (E.Head = V) and (E.Tail = V) and not(ViewSet.Contains(E)) then
            ViewSet.Add(E);
        end;
  end;
end;

procedure PMoveViewsCommand.Reexecute;
var
  I: Integer;
begin
  for I := 0 to FViewSet.Count - 1 do
    (ViewSet.Items[I] as PView).Move(DiagramView.Canvas, DX, DY);
  ViewsChanged;
end;

procedure PMoveViewsCommand.Unexecute;
var
  I: Integer;
begin
  for I := 0 to ViewSet.Count - 1 do
    (ViewSet.Items[I] as PView).Move(DiagramView.Canvas, -DX, -DY);
  ViewsChanged;
end;

// PMoveViewsCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PMoveParasiticViewCommand

function PMoveParasiticViewCommand.Precondition: Boolean;
begin
  Result := (NewAlpha <> OldAlpha) or (NewDistance <> OldDistance);
end;

procedure PMoveParasiticViewCommand.SetParameter(AParasiticView: PParasiticView; Alpha, Distance: Extended);
begin
  ViewSet.Clear;
  ViewSet.Add(ParasiticView);
  ParasiticView := AParasiticView;
  OldAlpha := AParasiticView.Alpha;
  OldDistance := AParasiticView.Distance;
  NewAlpha := Alpha;
  NewDistance := Distance;
end;

procedure PMoveParasiticViewCommand.Reexecute;
begin
  ParasiticView.Alpha := NewAlpha;
  ParasiticView.Distance := NewDistance;
  // fire view change event
  ViewsChanged;
end;

procedure PMoveParasiticViewCommand.Unexecute;
begin
  ParasiticView.Alpha := OldAlpha;
  ParasiticView.Distance := OldDistance;
  // fire view change event
  ViewsChanged;
end;

// PMoveParasiticViewCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PResizeNodeCommand

function PResizeNodeCommand.Precondition: Boolean;
begin
  Result := not EqualRect(OldRect, NewRect);
end;

procedure PResizeNodeCommand.SetParameter(ANode: PNodeView; ARect: TRect);
begin
  ViewSet.Clear;
  ViewSet.Add(ANode);
  Node := ANode;
  NewRect := ARect;
  OldRect.Left := Node.Left;
  OldRect.Top := Node.Top;
  OldRect.Right := Node.Right;
  OldRect.Bottom := Node.Bottom;
end;

procedure PResizeNodeCommand.Reexecute;
begin
  Node.Left := NewRect.Left;
  Node.Top := NewRect.Top;
  Node.Right := NewRect.Right;
  Node.Bottom := NewRect.Bottom;
  // fire view change event
  ViewsChanged;
end;

procedure PResizeNodeCommand.Unexecute;
begin
  Node.Left := OldRect.Left;
  Node.Top := OldRect.Top;
  Node.Right := OldRect.Right;
  Node.Bottom := OldRect.Bottom;
  // fire view change event
  ViewsChanged;
end;

// PResizeNodeCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PReshapeEdgeCommand

constructor PReshapeEdgeCommand.Create;
begin
  inherited;
  NewPoints := PPoints.Create;
  OldPoints := PPoints.Create;
end;

destructor PReshapeEdgeCommand.Destroy;
begin
  NewPoints.Free;
  OldPoints.Free;
  inherited;
end;

function PReshapeEdgeCommand.Precondition: Boolean;
begin
  Result := not OldPoints.Equal(NewPoints);
end;

procedure PReshapeEdgeCommand.SetParameter(AEdge: IModifiableEdge; APoints: PPoints);
begin
  ViewSet.Clear;
  ViewSet.Add(AEdge as PView);
  Edge := AEdge;
  NewPoints.Assign(APoints);
  OldPoints.Assign(Edge.Points);
end;

procedure PReshapeEdgeCommand.Reexecute;
begin
  Edge.Points := NewPoints;
  // fire view change event
  ViewsChanged;
end;

procedure PReshapeEdgeCommand.Unexecute;
begin
  Edge.Points := OldPoints;
  // fire view change event
  ViewsChanged;
end;

// PReshapeEdgeCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeViewsAttributeCommand

constructor PChangeViewsAttributeCommand.Create;
begin
  inherited;
  OldValues := TStringList.Create;
end;

destructor PChangeViewsAttributeCommand.Destroy;
begin
  OldValues.Free;
  inherited;
end;

function PChangeViewsAttributeCommand.Precondition: Boolean;
begin
  Result := not ViewSet.IsEmpty;
end;

procedure PChangeViewsAttributeCommand.Preprocess;
begin
  inherited;
  // Store sizes of views
  StoreViewSizes;
end;

procedure PChangeViewsAttributeCommand.Reexecute;
var
  View: PView;
begin
  for View in ViewSet do begin
    if View.MetaClass.ExistsAttribute(Key) then
      View.MOF_SetAttribute(Key, NewValue);
  end;
  // fire view change event
  ViewsChanged;
end;

procedure PChangeViewsAttributeCommand.Unexecute;
var
  I: Integer;
  V: PView;
begin
  for I := 0 to ViewSet.Count - 1 do
  begin
    V := ViewSet[I];
    if V.MetaClass.ExistsAttribute(Key) then V.MOF_SetAttribute(Key, OldValues[I]);
  end;
  // Restore sizes of views
  RestoreViewSizes;
  // fire view change event
  ViewsChanged;
end;

procedure PChangeViewsAttributeCommand.SetParameter(AViewSet: PViewOrderedSet; AKey: string; ANewValue: string);
var
  I: Integer;
  V: PView;
begin
  ViewSet.Assign(AViewSet);
  Key := AKey;
  NewValue := ANewValue;
  OldValues.Clear;
  for I := 0 to ViewSet.Count - 1 do
  begin
    V := ViewSet[I];
    if V.MetaClass.ExistsAttribute(Key) then
      OldValues.Add(V.MOF_GetAttribute(Key))
    else
      OldValues.Add('');
  end;
  SizePreservingViews.Clear;
  CollectSizesFromViewSet(AViewSet);
end;

// PChangeViewsAttributeCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeViewsLineColorCommand

constructor PChangeViewsLineColorCommand.Create;
begin
  inherited;
  OldLineColors := TStringList.Create;
end;

destructor PChangeViewsLineColorCommand.Destroy;
begin
  OldLineColors.Free;
  inherited;
end;

function PChangeViewsLineColorCommand.Precondition: Boolean;
begin
  Result := not ViewSet.IsEmpty;
end;

procedure PChangeViewsLineColorCommand.SetParameter(AViewSet: PViewOrderedSet; ANewLineColor: TColor);
var
  View: PView;
begin
  ViewSet.Assign(AViewSet);
  NewLineColor := ANewLineColor;
  OldLineColors.Clear;
  for View in ViewSet do
     OldLineColors.Add(ColorToString(View.LineColor));
end;

procedure PChangeViewsLineColorCommand.Reexecute;
var
  View: PView;
begin
  for View in ViewSet do
    View.LineColor := NewLineColor;
  // fire view change event
  ViewsChanged;
end;

procedure PChangeViewsLineColorCommand.Unexecute;
var
  I: Integer;
  View: PView;
begin
  for I := 0 to ViewSet.Count - 1 do begin
    View := FViewSet[I];
    View.LineColor := StringToColor(OldLineColors[I]);
  end;
  // fire view change event
  ViewsChanged;
end;

// PChangeViewsLineColorCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeViewsFillColorCommand

constructor PChangeViewsFillColorCommand.Create;
begin
  inherited;
  OldFillColors := TStringList.Create;
end;

destructor PChangeViewsFillColorCommand.Destroy;
begin
  OldFillColors.Free;
  inherited;
end;

function PChangeViewsFillColorCommand.Precondition: Boolean;
begin
  Result := not ViewSet.IsEmpty;
end;

procedure PChangeViewsFillColorCommand.SetParameter(AViewSet: PViewOrderedSet; ANewFillColor: TColor);
var
  I: Integer;
begin
  ViewSet.Assign(AViewSet);
  NewFillColor := ANewFillColor;
  OldFillColors.Clear;
  for I := 0 to ViewSet.Count - 1 do
    OldFillColors.Add(ColorToString(ViewSet[I].FillColor));
end;

procedure PChangeViewsFillColorCommand.Reexecute;
var
  I: Integer;
begin
  for I := 0 to ViewSet.Count - 1 do
    ViewSet[I].FillColor := NewFillColor;
  // fire view change event
  ViewsChanged;
end;

procedure PChangeViewsFillColorCommand.Unexecute;
var
  I: Integer;
begin
  for I := 0 to ViewSet.Count - 1 do
    ViewSet[I].FillColor := StringToColor(OldFillColors[I]);
  // fire view change event
  ViewsChanged;
end;

// PChangeViewsFillColorCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeViewsFontCommand

constructor PChangeViewsFontCommand.Create;
begin
  inherited;
  OldFonts := PFontList.Create;
  NewFont := TFont.Create;
  ChangedFontItems := [];
end;

destructor PChangeViewsFontCommand.Destroy;
var
  F: TFont;
begin
  for F in OldFonts do
    F.Free;
  OldFonts.Free;
  NewFont.Free;
  inherited;
end;

procedure PChangeViewsFontCommand.StoreOldFonts(AViewSet: PViewOrderedSet);
var
  I: Integer;
  F: TFont;
  V: PView;
begin
  OldFonts.Clear;
  for I := 0 to AViewSet.Count - 1 do begin
    V := AViewSet[I];
    F := TFont.Create;
    F.Color := V.FontColor;
    F.Name := V.FontFace;
    F.Size := V.FontSize;
    F.Style := V.FontStyle;
    OldFonts.Add(F);
  end;
end;

function PChangeViewsFontCommand.Precondition: Boolean;
begin
  Result := (not ViewSet.IsEmpty) and (ChangedFontItems <> []);
end;

procedure PChangeViewsFontCommand.Preprocess;
begin
  inherited;
  // Store sizes of views
  StoreViewSizes;
end;

procedure PChangeViewsFontCommand.SetParameter(AViewSet: PViewOrderedSet; ANewFont: TFont; AChangedFontItems: PFontItemKinds);
begin
  ViewSet.Assign(AViewSet);
  NewFont.Assign(ANewFont);
  ChangedFontItems := AChangedFontItems;
  StoreOldFonts(ViewSet);
  SizePreservingViews.Clear;
  CollectSizesFromViewSet(AViewSet);
end;

procedure PChangeViewsFontCommand.Reexecute;
var
  V: PView;
begin
  for V in ViewSet do begin
    if fiName in ChangedFontItems then
      V.FontFace := NewFont.Name;
    if fiSize in ChangedFontItems then
      V.FontSize := NewFont.Size;
    if fiStyle in ChangedFontItems then begin
      V.FontStyle := V.FontStyle - [fsBold, fsItalic];
      V.FontStyle := V.FontStyle + NewFont.Style;
    end;
    if fiEffect in ChangedFontItems then begin
      V.FontStyle := V.FontStyle - [fsUnderline, fsStrikeOut];
      V.FontStyle := V.FontStyle + NewFont.Style;
    end;
    if fiColor in ChangedFontItems then
      V.FontColor := NewFont.Color;
  end;
  // fire view change event
  ViewsChanged;
end;

procedure PChangeViewsFontCommand.Unexecute;
var
  I: Integer;
  F: TFont;
  V: PView;
begin
  for I := 0 to ViewSet.Count - 1 do begin
    V := ViewSet[I];
    F := OldFonts.Items[I];
    if fiName in ChangedFontItems then
      V.FontFace := F.Name;
    if fiSize in ChangedFontItems then
      V.FontSize := F.Size;
    if fiStyle in ChangedFontItems then
      V.FontSize := F.Size;
    if fiColor in ChangedFontItems then
      V.FontColor := F.Color;
  end;
  // Restore sizes of views
  RestoreViewSizes;
  // fire view change event
  ViewsChanged;
end;

// PChangeViewsFontCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeEdgesLineStyleCommand

constructor PChangeEdgesLineStyleCommand.Create;
begin
  inherited;
  OldLineStyles := POldLineStylesList.Create;
  OldPoints := PPointsList.Create;
end;

destructor PChangeEdgesLineStyleCommand.Destroy;
var
  P: PPoints;
begin
  OldLineStyles.Free;
  for P in OldPoints do
    P.Free;
  OldPoints.Free;
  inherited;
end;

function PChangeEdgesLineStyleCommand.Precondition: Boolean;
begin
  Result := not ViewSet.IsEmpty;
end;

procedure PChangeEdgesLineStyleCommand.SetParameter(AEdgeSet: PViewOrderedSet; ANewLineStyle: PLineStyleKind);
var
  I: Integer;
  E: PEdgeView;
  P: PPoints;
begin
  ViewSet.Assign(AEdgeSet);
  NewLineStyle := ANewLineStyle;
  OldPoints.Clear;
  OldLineStyles.Clear;
  for I := 0 to ViewSet.Count - 1 do begin
    E := ViewSet[I] as PEdgeView;
    P := PPoints.Create;
    P.Assign(E.Points);
    OldPoints.Add(P);
    OldLineStyles.Add(E.LineStyle)
  end;
end;

procedure PChangeEdgesLineStyleCommand.Reexecute;
var
  V: PView;
  E: PEdgeView;
begin
  for V in ViewSet do begin
    E := V as PEdgeView;
    E.LineStyle := NewLineStyle;
  end;
  // fire view change event
  ViewsChanged;
end;

procedure PChangeEdgesLineStyleCommand.Unexecute;
var
  I: Integer;
  E: PEdgeView;
  P: PPoints;
begin
  for I := 0 to ViewSet.Count - 1 do begin
    E := ViewSet[I] as PEdgeView;
    E.LineStyle := OldLineStyles[I];
    P := OldPoints.Items[I];
    E.Points.Assign(P);
  end;
  // fire view change event
  ViewsChanged;
end;

// PChangeEdgesLineStyleCommand
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// PChangeAnnotationLineStyleCommand

constructor PChangeAnnotationLineStyleCommand.Create;
begin
  inherited;
  OldLineStyles := POldLineStylesList.Create;
end;

destructor PChangeAnnotationLineStyleCommand.Destroy;
begin
  OldLineStyles.Free;
  inherited;
end;

function PChangeAnnotationLineStyleCommand.Precondition: Boolean;
begin
  Result := not ViewSet.IsEmpty;
end;

procedure PChangeAnnotationLineStyleCommand.SetParameter(AEdgeSet: PViewOrderedSet; ANewLineStyle: PLineKind);
var
  I: Integer;
  ShapeView: PShapeView;
begin
  ViewSet.Assign(AEdgeSet);
  NewLineStyle := ANewLineStyle;
  OldLineStyles.Clear;
  for I := 0 to ViewSet.Count - 1 do begin
    ShapeView := ViewSet[I] as PShapeView;
    OldLineStyles.Add(ShapeView.LineKind)
  end;
end;

procedure PChangeAnnotationLineStyleCommand.Reexecute;
var
  V: PView;
  ShapeView: PShapeView;
begin
  for V in ViewSet do begin
    ShapeView := V as PShapeView;
    ShapeView.LineKind := NewLineStyle;
  end;
  // fire view change event
  ViewsChanged;
end;

procedure PChangeAnnotationLineStyleCommand.Unexecute;
var
  I: Integer;
  ShapeView: PShapeView;
begin
  for I := 0 to ViewSet.Count - 1 do begin
    ShapeView := ViewSet[I] as PShapeView;
    ShapeView.LineKind := OldLineStyles[I];
  end;
  // fire view change event
  ViewsChanged;
end;

// PChangeAnnotationLineStyleCommand
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// PChangeNoteViewStringsCommand

function PChangeNoteViewStringsCommand.Precondition: Boolean;
begin
  Result := not ViewSet.IsEmpty;
end;

procedure PChangeNoteViewStringsCommand.Preprocess;
begin
  inherited;
  // Store sizes of views
  StoreViewSizes;
end;

procedure PChangeNoteViewStringsCommand.SetParameter(Views: PViewOrderedSet; Strs: string);
var
  AView: PUMLCustomTextView;
begin
  // PRECONDITION
  Assert(Views <> nil);
  Assert(Views.Count = 1);
  // PRECONDITION

  // Error protection code
  if Views.Count <> 1 then begin
    Views.Clear;
    FErrorMessage := 'Internal Error';
    Exit;
  end;

  ViewSet.Assign(Views);
  AView := ViewSet.Items[0] as PUMLCustomTextView;
  OldText := AView.Text;
  NewText := StringReplace(Strs, #9, '        '{8 indention}, [rfReplaceAll]);

  SizePreservingViews.Clear;
  CollectSizesFromViewSet(Views);
end;

procedure PChangeNoteViewStringsCommand.Reexecute;
var
  AView: PUMLCustomTextView;
begin
  AView := ViewSet.Items[0] as PUMLCustomTextView;
  AView.Text := NewText;
  // fire view change event
  ViewsChanged;
end;

procedure PChangeNoteViewStringsCommand.Unexecute;
var
  AView: PUMLCustomTextView;
begin
  AView := ViewSet.Items[0] as PUMLCustomTextView;
  AView.Text := OldText;
  // Restore sizes of views
  RestoreViewSizes;
  // fire view change event
  ViewsChanged;
end;

// PChangeNoteViewStringsCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PSendToBackViewsCommand

constructor PSendToBackViewsCommand.Create;
begin
  inherited;
  OldIndices := TStringList.Create;
end;

destructor PSendToBackViewsCommand.Destroy;
begin
  OldIndices.Free;
  inherited;
end;

function PSendToBackViewsCommand.Precondition: Boolean;
begin
  Result := not ViewSet.IsEmpty;
end;

// -----------------------------------------------------------------------------
// - takes two arguments with view, compares with its index
// - declares this function in global
// - to use this function in POrderedSet.Sort's Compare function
// -----------------------------------------------------------------------------
function CompareIndex(const V1, V2: PView): Integer;
var
  VI1, VI2: Integer;
begin
  VI1 := V1.OwnerDiagramView.IndexOfOwnedView(V1);
  VI2 := V2.OwnerDiagramView.IndexOfOwnedView(V2);
  if VI1 < VI2 then
    Result := -1
  else if VI1 > VI2 then
    Result := 1
  else
    Result := 0;
end;

procedure PSendToBackViewsCommand.SetParameter(Views: PViewOrderedSet);
var
  I: Integer;
  V: PView;
begin
  // gather the views which are contained in DiagramView directly
  ViewSet.Clear;
  for I := 0 to Views.Count - 1 do begin
    V := Views.Items[I] as PView;
    if V.OwnerDiagramView <> nil then ViewSet.Add(V);
  end;
  ViewSet.Sort(TComparer<PView>.Construct(CompareIndex));
  // preserve indices of views
  OldIndices.Clear;
  for I := 0 to ViewSet.Count - 1 do begin
    V := ViewSet.Items[I] as PView;
    OldIndices.Add(IntToStr(V.OwnerDiagramView.IndexOfOwnedView(V)));
  end;
end;

procedure PSendToBackViewsCommand.Reexecute;
var
  I: Integer;
  V: PView;
begin
  for I := ViewSet.Count - 1 downto 0 do begin
    V := ViewSet.Items[I] as PView;
    V.SendToBack;
  end;
  // fire view change event
  ViewsChanged;
end;

procedure PSendToBackViewsCommand.Unexecute;
var
  I: Integer;
  Idx: Integer;
  Owner: PDiagramView;
  V: PView;
begin
  for I := ViewSet.Count - 1 downto 0 do begin
    V := ViewSet.Items[I] as PView;
    Idx := StrToInt(OldIndices.Strings[I]);
    Owner := V.OwnerDiagramView;
    Owner.RemoveOwnedView(V);
    Owner.InsertOwnedView(Idx, V);
  end;
  // fire view change event
  ViewsChanged;
end;

// PSendToBackViewsCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PBringToFrontViewsCommand

constructor PBringToFrontViewsCommand.Create;
begin
  inherited;
  OldIndices := TStringList.Create;
end;

destructor PBringToFrontViewsCommand.Destroy;
begin
  OldIndices.Free;
  inherited;
end;

function PBringToFrontViewsCommand.Precondition: Boolean;
begin
  Result := not ViewSet.IsEmpty;
end;

procedure PBringToFrontViewsCommand.SetParameter(Views: PViewOrderedSet);
var
  I: Integer;
  V: PView;
begin
  // gather the views which are contained in DiagramView directly
  ViewSet.Clear;
  for I := 0 to Views.Count - 1 do begin
    V := Views.Items[I] as PView;
    if V.OwnerDiagramView <> nil then ViewSet.Add(V);
  end;
  ViewSet.Sort(TComparer<PView>.Construct(CompareIndex));
  // preserve views indices
  OldIndices.Clear;
  for I := 0 to ViewSet.Count - 1 do begin
    V := ViewSet.Items[I] as PView;
    OldIndices.Add(IntToStr(V.OwnerDiagramView.IndexOfOwnedView(V)));
  end;
end;

procedure PBringToFrontViewsCommand.Reexecute;
var
  I: Integer;
  V: PView;
begin
  for I := 0 to ViewSet.Count - 1 do begin
    V := ViewSet.Items[I] as PView;
    V.BringToFront;
  end;
  // fire view change event
  ViewsChanged;
end;

procedure PBringToFrontViewsCommand.Unexecute;
var
  I: Integer;
  Idx: Integer;
  Owner: PDiagramView;
  V: PView;
begin
  for I := 0 to ViewSet.Count - 1 do begin
    V := ViewSet.Items[I] as PView;
    Idx := StrToInt(OldIndices.Strings[I]);
    Owner := V.OwnerDiagramView;
    Owner.RemoveOwnedView(V);
    Owner.InsertOwnedView(Idx, V);
  end;
  // fire view change event
  ViewsChanged;
end;

// PBringToFrontViewsCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAlignViewsCommand

constructor PAlignViewsCommand.Create;
begin
  inherited;
  OldPositions := PPoints.Create;
end;

destructor PAlignViewsCommand.Destroy;
begin
  OldPositions.Free;
  inherited;
end;

function PAlignViewsCommand.Precondition: Boolean;
begin
  Result := not ViewSet.IsEmpty;
end;

procedure PAlignViewsCommand.SetParameter(Views: PViewOrderedSet; Alignment: PAlignmentKind);
var
  I: Integer;
  V: PView;
begin
  ViewSet.Clear;
  OldPositions.Clear;
  for I := 0 to Views.Count - 1 do begin
    V := Views.Items[I] as PView;
    if V is PNodeView then begin
      ViewSet.Add(V);
      OldPositions.Add(Point((V as PNodeView).Left, (V as PNodeView).Top));
    end;
  end;
  AlignmentKind := Alignment;
end;

// -----------------------------------------------------------------------------
// - takes two NodeView arguments and compares the sizes according to X-Position
// - declare this function for global function to use for comapre function
// - in POrderedSet.Sort
// -----------------------------------------------------------------------------
function CompareXPosition(const Item1, Item2: PView): Integer;
var
  N1, N2: PNodeView;
begin
  N1 := Item1 as PNodeView;
  N2 := Item2 as PNodeView;

  if N1.Left < N2.Left then
    Result := -1
  else if N1.Left > N2.Left then
    Result := 1
  else
    Result := 0;
end;

// -----------------------------------------------------------------------------
// - takes two NodeView arguments and compares the sized according to Y-Position
// - declare this function for global function to use for comapre function
// - in POrderedSet.Sort
// -----------------------------------------------------------------------------
function CompareYPosition(const Item1, Item2: PView): Integer;
var
  N1, N2: PNodeView;
begin
  N1 := Item1 as PNodeView;
  N2 := Item2 as PNodeView;

  if N1.Top < N2.Top then
    Result := -1
  else if N1.Top > N2.Top then
    Result := 1
  else
    Result := 0;
end;

procedure PAlignViewsCommand.Reexecute;
var
  I, V: Integer;
  Node: PNodeView;
  TempSet: PViewOrderedSet;

  function GetLeftMost(Nodes: PViewOrderedSet): Integer;
  var
    I, R: Integer;
  begin
    R := 0;
    if Nodes.Count > 0 then begin
      R := (Nodes.Items[0] as PNodeView).Left;
      for I := 1 to Nodes.Count - 1 do
        if (Nodes.Items[I] as PNodeView).Left < R then
          R := (Nodes.Items[I] as PNodeView).Left;
    end;
    Result := R;
  end;

  function GetRightMost(Nodes: PViewOrderedSet): Integer;
  var
    I, R: Integer;
  begin
    R := 0;
    if Nodes.Count > 0 then begin
      R := (Nodes.Items[0] as PNodeView).Right;
      for I := 1 to Nodes.Count - 1 do
        if (Nodes.Items[I] as PNodeView).Right > R then
          R := (Nodes.Items[I] as PNodeView).Right;
    end;
    Result := R;
  end;

  function GetTopMost(Nodes: PViewOrderedSet): Integer;
  var
    I, R: Integer;
  begin
    R := 0;
    if Nodes.Count > 0 then begin
      R := (Nodes.Items[0] as PNodeView).Top;
      for I := 1 to Nodes.Count - 1 do
        if (Nodes.Items[I] as PNodeView).Top < R then
          R := (Nodes.Items[I] as PNodeView).Top;
    end;
    Result := R;
  end;

  function GetBottomMost(Nodes: PViewOrderedSet): Integer;
  var
    I, R: Integer;
  begin
    R := 0;
    if Nodes.Count > 0 then begin
      R := (Nodes.Items[0] as PNodeView).Bottom;
      for I := 1 to Nodes.Count - 1 do
        if (Nodes.Items[I] as PNodeView).Bottom > R then
          R := (Nodes.Items[I] as PNodeView).Bottom;
    end;
    Result := R;
  end;

  function GetHorzInterval(Nodes: PViewOrderedSet): Integer;
  var
    I, S: Integer;
  begin
    S := 0;
    for I := 0 to Nodes.Count - 1 do
      S := S + (Nodes.Items[I] as PNodeView).Width - 1;
    Result := ((GetRightMost(Nodes) - GetLeftMost(Nodes)) - S) div (Nodes.Count - 1);
  end;

  function GetVertInterval(Nodes: PViewOrderedSet): Integer;
  var
    I, S: Integer;
  begin
    S := 0;
    for I := 0 to Nodes.Count - 1 do
      S := S + (Nodes.Items[I] as PNodeView).Height - 1;
    Result := ((GetBottomMost(Nodes) - GetTopMost(Nodes)) - S) div (Nodes.Count - 1);
  end;

begin
  case AlignmentKind of
    akLeft: begin
      V := GetLeftMost(ViewSet);
      for I := 0 to ViewSet.Count - 1 do begin
        Node := (ViewSet.Items[I] as PNodeView);
        Node.Left := V;
      end;
    end;
    akRight: begin
      V := GetRightMost(ViewSet);
      for I := 0 to ViewSet.Count - 1 do begin
        Node := (ViewSet.Items[I] as PNodeView);
        Node.Left := V - Node.Width;
      end;
    end;
    akMiddle: begin
      V := (GetLeftMost(ViewSet) + GetRightMost(ViewSet)) div 2;
      for I := 0 to ViewSet.Count - 1 do begin
        Node := (ViewSet.Items[I] as PNodeView);
        Node.Left := V - (Node.Width div 2);
      end;
    end;
    akTop: begin
      V := GetTopMost(ViewSet);
      for I := 0 to ViewSet.Count - 1 do begin
        Node := (ViewSet.Items[I] as PNodeView);
        Node.Top := V;
      end;
    end;
    akBottom: begin
      V := GetBottomMost(ViewSet);
      for I := 0 to ViewSet.Count - 1 do begin
        Node := (ViewSet.Items[I] as PNodeView);
        Node.Top := V - Node.Height;
      end;
    end;
    akCenter: begin
      V := (GetTopMost(ViewSet) + GetBottomMost(ViewSet)) div 2;
      for I := 0 to ViewSet.Count - 1 do begin
        Node := (ViewSet.Items[I] as PNodeView);
        Node.Top := V - (Node.Height div 2);
      end;
    end;
    akSpaceEvenlyHorizontally: begin
      TempSet := PViewOrderedSet.Create;
      TempSet.Assign(ViewSet);
      TempSet.Sort(TComparer<PView>.Construct(CompareXPosition));
      V := GetHorzInterval(TempSet);
      for I := 1 to TempSet.Count - 1 do begin
        Node := TempSet.Items[I] as PNodeView;
        Node.Left := (TempSet.Items[I-1] as PNodeView).Right + V;
      end;
      TempSet.Free;
    end;
    akSpaceEvenlyVertically: begin
      TempSet := PViewOrderedSet.Create;
      TempSet.Assign(ViewSet);
      TempSet.Sort(TComparer<PView>.Construct(CompareYPosition));
      V := GetVertInterval(TempSet);
      for I := 1 to TempSet.Count - 1 do begin
        Node := TempSet.Items[I] as PNodeView;
        Node.Top := (TempSet.Items[I-1] as PNodeView).Bottom + V;
      end;
      TempSet.Free;
    end;
  end;
  // fire view change event
  ViewsChanged;
end;

procedure PAlignViewsCommand.Unexecute;
var
  I: Integer;
  Node: PNodeView;
begin
  for I := 0 to ViewSet.Count - 1 do begin
    Node := ViewSet.Items[I] as PNodeView;
    Node.Left := OldPositions.PointData[I].X;
    Node.Top := OldPositions.PointData[I].Y;
  end;
  // fire view change event
  ViewsChanged;
end;

// PAlignViewsCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PLayoutDiagramCommand

constructor PLayoutDiagramCommand.Create;
begin
  inherited;
  Nodes := PNodeViewOrderedSet.Create;
  Edges := PEdgeViewOrderedSet.Create;
  OldNodePositions := PPoints.Create;
  OldEdgeLineStyles := TStringList.Create;
  OldEdgePoints := PPointsList.Create;
end;

destructor PLayoutDiagramCommand.Destroy;
var
  Ps: PPoints;
begin
  for Ps in OldEdgePoints do
    Ps.Free;
  Nodes.Free;
  Edges.Free;
  OldNodePositions.Free;
  OldEdgeLineStyles.Free;
  OldEdgePoints.Free;
  inherited;
end;

function PLayoutDiagramCommand.Precondition: Boolean;
begin
  Result := not ViewSet.IsEmpty;
end;

procedure PLayoutDiagramCommand.SetParameter(ADiagramView: PDiagramView);
var
  I: Integer;
  V: PView;
  NodeView: PNodeView;
  EdgeView: PEdgeView;
  Ps: PPoints;
begin
  DiagramView := ADiagramView;
  Nodes.Clear;
  Edges.Clear;
  OldNodePositions.Clear;
  OldEdgePoints.Clear;
  // Storing Nodes
  for I := 0 to ADiagramView.OwnedViewCount - 1 do begin
    V := ADiagramView.OwnedView[I];
    if V is PNodeView then begin
      NodeView := V as PNodeView;
      Nodes.Add(NodeView);
      OldNodePositions.Add(Point(NodeView.Left, NodeView.Top));
      ViewSet.Add(V);
    end;
  end;
  // Storing Edges
  for I := 0 to ADiagramView.OwnedViewCount - 1 do begin
    V := ADiagramView.OwnedView[I];
    if V is PEdgeView then begin
      EdgeView := V as PEdgeView;
      if (EdgeView.Tail is PNodeView) and
         (EdgeView.Head is PNodeView) then
      begin
        Edges.Add(EdgeView);
        OldEdgeLineStyles.Add(V.MOF_GetAttribute('LineStyle'));
        Ps := PPoints.Create;
        Ps.Assign(EdgeView.Points);
        OldEdgePoints.Add(Ps);
        ViewSet.Add(V);
      end;
    end;
  end;
end;

procedure PLayoutDiagramCommand.Reexecute;
begin
  if DiagramView is PUMLClassDiagramView then
    DiagramLayout.LayoutDiagram(DiagramView)
  else if DiagramView is PUMLUseCaseDiagramView then
    DiagramLayout.LayoutDiagram(DiagramView)
  else if DiagramView is PUMLSequenceDiagramView then
    // Can not layout Sequence Diagram.
  else if DiagramView is PUMLSequenceRoleDiagramView then
    // Can not layout Sequence Diagram (Role).
  else if DiagramView is PUMLCollaborationDiagramView then
    DiagramLayout.LayoutDiagram(DiagramView)
  else if DiagramView is PUMLCollaborationRoleDiagramView then
    DiagramLayout.LayoutDiagram(DiagramView)
  else if DiagramView is PUMLStatechartDiagramView then
    DiagramLayout.LayoutDiagram(DiagramView, True, rkTopBottom, True)
  else if DiagramView is PUMLActivityDiagramView then
    DiagramLayout.LayoutDiagram(DiagramView, True, rkTopBottom, True)
  else if DiagramView is PUMLComponentDiagramView then
    DiagramLayout.LayoutDiagram(DiagramView)
  else if DiagramView is PUMLDeploymentDiagramView then
    DiagramLayout.LayoutDiagram(DiagramView);
  // fire view change event
  ViewsChanged;
end;

procedure PLayoutDiagramCommand.Unexecute;
var
  I: Integer;
  N: PNodeView;
  E: PEdgeView;
  Ps: PPoints;
begin
  (*for I := 0 to Nodes.Count - 1 do begin
    N := Nodes.Items[I] as PNodeView;
    N.Left := OldNodePositions.Points[I].X;
    N.Top := OldNodePositions.Points[I].Y;
  end;*)

  for I := 0 to Nodes.Count - 1 do begin
    N := Nodes[I];
    N.Left := OldNodePositions.PointData[I].X;
    N.Top := OldNodePositions.PointData[I].Y;
  end;

  for I := 0 to Edges.Count - 1 do begin
    E := Edges[I];
    E.MOF_SetAttribute('LineStyle', OldEdgeLineStyles.Strings[I]);
    Ps := OldEdgePoints[I];
    E.Points.Assign(Ps);
  end;
  // fire view change event
  ViewsChanged;
end;

// PLayoutDiagramCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAbstractApplyExpressionCommand

function PAbstractApplyExpressionCommand.Precondition: Boolean;
var
  B: Boolean;
begin
  B := not ModelSet.IsEmpty;
  if B then begin
    if (FOldStereotype = FNewStereotype) and
       (FOldVisibility = FNewVisibility) and
       (FOldName = FNewName)
    then B := False;
  end;
  Result := B;
end;

procedure PAbstractApplyExpressionCommand.Preprocess;
begin
  inherited;
  StoreViewSizes;
end;

function PAbstractApplyExpressionCommand.SymbolToUMLVisibilityKind(Value: string): PUMLVisibilityKind;
begin
  if Value = '+' then Result := vkPublic
  else if Value = '-' then Result := vkPrivate
  else if Value = '#' then Result := vkProtected
  else if Value = '~' then Result := vkPackage
  else raise Exception.Create(ERR_CMD_EXPRESSION_PARSING);
end;

function PAbstractApplyExpressionCommand.GetProfile(M: PExtensibleModel; StereotypeStr: string): string;
var
  S: PStereotype;
begin
  Result := '';
  if M.StereotypeProfile <> '' then begin // Find stereotype in the same profile
    S := ExtensionManager.FindStereotype(M.StereotypeProfile, StereotypeStr, M.MetaClass.Name);
    if Assigned(S) then
      Result := S.Profile.Name
  end
  else begin
    if StereotypeStr <> '' then begin  // Search all profiles
      S := ExtensionManager.FindFirstStereotype(StereotypeStr, M.MetaClass.Name);
      if Assigned(S) then
        Result := S.Profile.Name
    end;
  end;
end;

procedure PAbstractApplyExpressionCommand.SetParameter(AModelSet: PModelOrderedSet; Value: string);
var
  B: Boolean;
begin
  B := True;
  // Error protection code
  if AModelSet.Count <> 1 then B := False;
  if B then B := AModelSet.Items[0] is PUMLModelElement;
  if not B then begin
    ModelSet.Clear;
    FErrorMessage := 'Internal Error';
    Exit;
  end;

  ModelSet.Assign(AModelSet);
  SizePreservingViews.Clear;
  CollectSizesFromModelSet(ModelSet);
  FModel := ModelSet.Items[0] as PUMLModelElement;
  // Set variables for UnExecute operation
  FOldProfile := FModel.StereotypeProfile;
  FOldStereotype := FModel.StereotypeName;
  FOldVisibility := FModel.Visibility;
  FOldName := FModel.Name;
end;

procedure PAbstractApplyExpressionCommand.Reexecute;
begin
  if FNewProfile <> FOldProfile then FModel.StereotypeProfile := FNewProfile;
  if FNewStereotype <> FOldStereotype then FModel.MOF_SetAttribute('StereotypeName', FNewStereotype);
  if FNewVisibility <> FOldVisibility then
    FModel.MOF_SetAttribute('Visibility', UMLVisibilityKindToString(FNewVisibility));
  if FNewName <> FOldName then FModel.MOF_SetAttribute('Name', FNewName);
end;

procedure PAbstractApplyExpressionCommand.Unexecute;
begin
  if FNewProfile <> FOldProfile then FModel.StereotypeProfile := FOldProfile;
  if FNewStereotype <> FOldStereotype then FModel.MOF_SetAttribute('StereotypeName', FOldStereotype);
  if FNewVisibility <> FOldVisibility then
    FModel.MOF_SetAttribute('Visibility', UMLVisibilityKindToString(FOldVisibility));
  if FNewName <> FOldName then FModel.MOF_SetAttribute('Name', FOldName);
end;

// PAbstractApplyExpressionCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PApplyGeneralNameExpressionCommand

procedure PApplyGeneralNameExpressionCommand.SetParameter(AModelSet: PModelOrderedSet; Value: string);
var
  AParser: PGeneralNameExpressionParser;
  R: PParseStatus;
begin
  inherited;
  AParser := PGeneralNameExpressionParser.Create;
  if not AParser.Initialized then begin
    AParser.Free;
    FNewName := Value
  end
  else
  try
    R := AParser.Parse(Value);
    if (R <> psNotIntialized) and (R <> psError) then begin
      try
        FNewStereotype := AParser.StereoType;
        FNewName := AParser.Name;
        //FNewName := Value;
        if AParser.Visibility <> '' then
          FNewVisibility := SymbolToUMLVisibilityKind(AParser.Visibility)
        else FNewVisibility := FOldVisibility;
        CheckNameValidity(FNewStereotype);
        FNewProfile := GetProfile(FModel, FNewStereotype);
        if FNewName <> FOldName then CheckNameConflict(FModel, FNewName);
        CheckNameValidity(FNewName);
      except
        on E: Exception do begin
          ModelSet.Clear;
          FErrorMessage := E.Message;
        end;
      end;
    end else begin
      ModelSet.Clear;
      FErrorMessage := ERR_CMD_EXPRESSION_PARSING + ' ' + AParser.LastErrorMsg;
    end;
  finally
    AParser.Free;
  end;
end;

procedure PApplyGeneralNameExpressionCommand.Reexecute;
begin
  inherited;
  ModelsChanged;
end;

procedure PApplyGeneralNameExpressionCommand.Unexecute;
begin
  inherited;
  RestoreViewSizes;
  ModelsChanged;
end;

// PApplyGeneralNameExpressionCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PApplyClassifierRoleExpressionCommand

function PApplyClassifierRoleExpressionCommand.Precondition: Boolean;
var
  B: Boolean;
begin
  B := inherited Precondition;
  if not B then begin
    if not(ModelSet.IsEmpty) and (FOldBase <> FNewBase) then B := True;
  end;
  Result := B;
end;

procedure PApplyClassifierRoleExpressionCommand.SetParameter(AModelSet: PModelOrderedSet; Value: string);
var
  AParser: PClassifierRoleExpressionParser;
  TempModel: PModel;
  BaseName: string;
  R: PParseStatus;
begin
  inherited;
  if not(FModel is PUMLClassifierRole) then begin
    ModelSet.Clear;
    FErrorMessage := 'Internal Error';
    Exit;
  end;
  // Set variables for UnExecute operation
  FOldBase := (FModel as PUMLClassifierRole).Base;
  // Parsing
  AParser := PClassifierRoleExpressionParser.Create;
  if not AParser.Initialized then begin
    AParser.Free;
    FNewName := Value
  end
  else
  try
    R := AParser.Parse(Value);
    if (R <> psNotIntialized) and (R <> psError) then begin
      try
        FNewStereotype := AParser.StereoType;
        FNewName := AParser.RoleName;
        //FNewName :=  Value;
        if AParser.Visibility <> '' then
          FNewVisibility := SymbolToUMLVisibilityKind(AParser.Visibility)
        else FNewVisibility := FOldVisibility;
        BaseName := AParser.ClassifierName;
        CheckNameValidity(FNewStereotype);
        FNewProfile := GetProfile(FModel, FNewStereotype);
        if FNewName <> FOldName then begin
          CheckNameValidity(FNewName);
          CheckNameConflict(FModel, FNewName);
        end;
        if BaseName <> '' then begin
          CheckNameValidity(BaseName);
          if (FOldBase <> nil) and (FOldBase.Name = BaseName) then
            FNewBase := FOldBase
          else begin
            TempModel := SearchElement(FModel, BaseName);
            if TempModel <> nil then FNewBase := TempModel as PUMLClassifier
            else raise Exception.Create(Format(ERR_CMD_CANNOT_FIND_BASEELEMENT,[BaseName]));
          end;
        end else FNewBase := nil;
      except
        on E: Exception do begin
          ModelSet.Clear;
          FErrorMessage := E.Message;
        end;
      end;
    end else begin
      ModelSet.Clear;
      FErrorMessage := ERR_CMD_EXPRESSION_PARSING + ' ' + AParser.LastErrorMsg;
    end;
  finally
    AParser.Free;
  end;
end;

procedure PApplyClassifierRoleExpressionCommand.Reexecute;
begin
  inherited;
  if FOldBase <> FNewBase then FModel.MOF_SetReference('Base', FNewBase);
  ModelsChanged;
end;

procedure PApplyClassifierRoleExpressionCommand.Unexecute;
begin
  inherited;
  if FOldBase <> FNewBase then FModel.MOF_SetReference('Base', FOldBase);
  RestoreViewSizes;
  ModelsChanged;
end;

// PApplyClassifierRoleExpressionCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PApplyObjectExpressionCommand

function PApplyInstanceExpressionCommand.Precondition: Boolean;
var
  B: Boolean;
begin
  B := inherited Precondition;
  if not B then begin
    if not(ModelSet.IsEmpty) and (FOldClassifier <> FNewClassifier) then B := True;
  end;
  Result := B;
end;

procedure PApplyInstanceExpressionCommand.SetParameter(AModelSet: PModelOrderedSet; Value: string);
var
  AParser: PObjectExpressionParser;
  TempModel: PModel;
  ClassifierName: string;
  R: PParseStatus;
begin
  inherited;
  if not(FModel is PUMLInstance) then begin
    ModelSet.Clear;
    FErrorMessage := 'Internal Error';
    Exit;
  end;
  // Set variables for UnExecute operation
  FOldClassifier := (FModel as PUMLInstance).Classifier;
  // Parsing
  AParser := PObjectExpressionParser.Create;
  if not AParser.Initialized then begin
    AParser.Free;
    FNewName := Value
  end
  else
  try
    R := AParser.Parse(Value);
    if (R <> psNotIntialized) and (R <> psError) then begin
      FNewStereotype := AParser.StereoType;
      FNewName := AParser.ObjectName;
      //FNewName := Value;
      if AParser.Visibility <> '' then
        FNewVisibility := SymbolToUMLVisibilityKind(AParser.Visibility)
      else FNewVisibility := FOldVisibility;
      ClassifierName := AParser.ClassifierName;
      try
        CheckNameValidity(FNewStereotype);
        FNewProfile := GetProfile(FModel, FNewStereotype);
        if FNewName <> FOldName then begin
          CheckNameValidity(FNewName);
          CheckNameConflict(FModel, FNewName);
        end;
        if ClassifierName <> '' then begin
          CheckNameValidity(ClassifierName);
          if (FOldClassifier <> nil) and (FOldClassifier.Name = ClassifierName) then
            FNewClassifier := FOldClassifier
          else begin
            TempModel := SearchElement(FModel, ClassifierName);
            if TempModel <> nil then FNewClassifier := TempModel as PUMLClassifier
            else Raise Exception.Create(Format(ERR_CMD_CANNOT_FIND_CLASSIFIER,[ClassifierName]));
          end;
        end else FNewClassifier := nil;
      except
        on E: Exception do begin
          ModelSet.Clear;
          FErrorMessage := E.Message;
        end;
      end;
    end else begin
      ModelSet.Clear;
      FErrorMessage := ERR_CMD_EXPRESSION_PARSING + ' ' + AParser.LastErrorMsg;
    end;
  finally
    AParser.Free;
  end;
end;

procedure PApplyInstanceExpressionCommand.Reexecute;
begin
  inherited;
  if FNewClassifier <> FOldClassifier then
    FModel.MOF_SetReference('Classifier', FNewClassifier);
  ModelsChanged;
end;

procedure PApplyInstanceExpressionCommand.Unexecute;
begin
  inherited;
  if FNewClassifier <> FOldClassifier then
    FModel.MOF_SetReference('Classifier', FOldClassifier);
  RestoreViewSizes;
  ModelsChanged;
end;

// PApplyObjectExpressionCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PApplyAttributeExpressionCommand

function PApplyAttributeExpressionCommand.Precondition: Boolean;
var
  B: Boolean;
begin
  B := inherited Precondition;
  if not B then begin
    if not(ModelSet.IsEmpty) then begin
      if (FOldMultiplicity <> FNewMultiplicity) or
         (FOldOrdering <> FNewOrdering) or
         (FOldInitialValue <> FNewInitialValue) or
         (FOldTypeExpression <> FNewTypeExpression) or
         (FOldType <> FNewType)
      then B := True;
    end;
  end;
  Result := B;
end;

procedure PApplyAttributeExpressionCommand.SetParameter(AModelSet: PModelOrderedSet; Value: string);
var
  AParser: PAttributeExpressionParser;
  TypeExpression: string;
  R: PParseStatus;
  TempModel: PModel;
begin
  inherited;
  if not(FModel is PUMLAttribute) then begin
    ModelSet.Clear;
    FErrorMessage := 'Internal Error';
    Exit;
  end;
  // Set variables for UnExecute operation
  FOldTypeExpression := (FModel as PUMLAttribute).TypeExpression;
  FOldType := (FModel as PUMLAttribute).Type_;
  FOldMultiplicity := (FModel as PUMLAttribute).Multiplicity;
  FOldOrdering := (FModel as PUMLAttribute).Ordering;
  FOldInitialValue := (FModel as PUMLAttribute).InitialValue;
  // Parsing
  AParser := PAttributeExpressionParser.Create;
  if not AParser.Initialized then begin
    AParser.Free;
    FNewName := Value
  end
  else
  try
    R := AParser.Parse(Value);
    if (R <> psNotIntialized) and (R <> psError) then begin
      try
        FNewStereotype := AParser.Stereotype;
        FNewName := AParser.Name;
        //FNewName := Value;
        if AParser.Visibility <> '' then
          FNewVisibility := SymbolToUMLVisibilityKind(AParser.Visibility)
        else FNewVisibility := FOldVisibility;
        FNewInitialValue := AParser.InitialValue;
        FNewMultiplicity := AParser.Multiplicity;
        if Lowercase(AParser.Ordering) = 'ordered' then
          FNewOrdering := okOrdered
        else if Lowercase(AParser.Ordering) = 'unordered' then
          FNewOrdering := okUnordered
        else FNewOrdering := FOldOrdering;
        TypeExpression := AParser.TypeExpression;
        CheckNameValidity(FNewStereotype);
        FNewProfile := GetProfile(FModel, FNewStereotype);
        if FNewName <> FOldName then begin
          CheckNameValidity(FNewName);
          CheckNameConflict(FModel, FNewName);
        end;
        if TypeExpression = FOldTypeExpression then begin
          FNewTypeExpression := FOldTypeExpression;
          FNewType := FOldType;
        end else if TypeExpression <> '' then begin
          CheckNameValidity(TypeExpression);
          FNewTypeExpression := TypeExpression;
          TempModel := SearchElement(FModel, TypeExpression);
          if TempModel <> nil then FNewType := TempModel as PUMLClassifier
          else FNewType := nil;
        end else begin
          FNewTypeExpression := '';
          FNewType := nil;
        end;
      except
        on E: Exception do begin
          ModelSet.Clear;
          FErrorMessage := E.Message;
        end;
      end;
    end else begin
      ModelSet.Clear;
      FErrorMessage := ERR_CMD_EXPRESSION_PARSING + ' ' + AParser.LastErrorMsg;
    end;
  finally
    AParser.Free;
  end;
end;

procedure PApplyAttributeExpressionCommand.Reexecute;
begin
  inherited;
  if FNewMultiplicity <> FOldMultiplicity then
    FModel.MOF_SetAttribute('Multiplicity', FNewMultiplicity);
  if FNewOrdering <> FOldOrdering then begin
    if FNewOrdering = okUnordered then FModel.MOF_SetAttribute('Ordering', 'okUnordered')
    else if FNewOrdering = okOrdered then FModel.MOF_SetAttribute('Ordering', 'okOrdered');
  end;
  if FNewInitialValue <> FOldInitialValue then
    FModel.MOF_SetAttribute('InitialValue', FNewInitialValue);
  if FNewTypeExpression <> FOldTypeExpression then
    FModel.MOF_SetAttribute('TypeExpression', FNewTypeExpression);
  if FNewType <> FOldType then
    FModel.MOF_SetReference('Type_', FNewType);

  ModelsChanged;
end;

procedure PApplyAttributeExpressionCommand.Unexecute;
begin
  inherited;
  if FNewMultiplicity <> FOldMultiplicity then
    FModel.MOF_SetAttribute('Multiplicity', FOldMultiplicity);
  if FNewOrdering <> FOldOrdering then begin
    if FOldOrdering = okUnordered then FModel.MOF_SetAttribute('Ordering', 'okUnordered')
    else if FOldOrdering = okOrdered then FModel.MOF_SetAttribute('Orderring', 'okrdered');
  end;
  if FNewInitialValue <> FOldInitialValue then
    FModel.MOF_SetAttribute('InitialValue', FOldInitialValue);
  if FNewTypeExpression <> FOldTypeExpression then
    FModel.MOF_SetAttribute('TypeExpression', FOldTypeExpression);
  if FNewType <> FOldType then
    FModel.MOF_SetReference('Type_', FOldType);
  // Restore sizes of views
  RestoreViewSizes;
  ModelsChanged;
end;

// PApplyAttributeExpressionCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PApplyOperationExpressionCommnad

constructor PApplyOperationExpressionCommnad.Create;
begin
  inherited;
  FOldParameters := PModelOrderedSet.Create;
  FNewParameters := PModelOrderedSet.Create;
  FIsParameterChanged := False;
  FViewSet.Clear;
end;

destructor PApplyOperationExpressionCommnad.Destroy;
begin
  FOldParameters.Free;
  FNewParameters.Free;
  inherited;
end;

function PApplyOperationExpressionCommnad.MakeParameterModel(AKind, AName, AType,
  AInitValue: string): PUMLParameter;
var
  AModel: PUMLOperation;
  Param: PUMLParameter;
  TempModel: PModel;
begin
  AModel := ModelSet.Items[0] as PUMLOperation;
  Param := MetaModel.CreateInstance('UMLParameter') as PUMLParameter;
  // Direction Kind
  if LowerCase(AKind) = 'return' then Param.DirectionKind := pdkReturn
  else if LowerCase(AKind) = 'in' then Param.DirectionKind := pdkIn
  else if LowerCase(AKind) = 'out' then Param.DirectionKind := pdkOut
  else if LowerCase(AKind) = 'inout' then Param.DirectionKind := pdkInout;
  // Name
  Param.Name := AName;
  // Type or TypeExpression
  if AType <> '' then begin
    TempModel := SearchElement(AModel, AType);
    if TempModel <> nil then Param.Type_ := TempModel as PUMLClassifier
    else Param.TypeExpression := AType;
  end;
  // InitialValue
  Param.DefaultValue := AInitValue;
  Result := Param;
end;

function PApplyOperationExpressionCommnad.CheckNameExisting(Value: string): Boolean;
var
  I: Integer;
  AModel: PUMLOperation;
begin
  Result := False;
  AModel := ModelSet.Items[0] as PUMLOperation;
  for I := 0 to AModel.VirtualOwnedModelCount - 1 do
    if AModel.VirtualOwnedModel[I].Name = Value then begin
      Result := True;
      Exit;
    end;
end;

function PApplyOperationExpressionCommnad.AssignNewParameterName: string;
var
  Name: string;
  I: Integer;
begin
  I := 1;
  Name := 'parameter' + IntToStr(I);
  while CheckNameExisting(Name) do begin
    Inc(I);
    Name := 'parameter' + IntToStr(I);
  end;
  Result := Name;
end;

function PApplyOperationExpressionCommnad.GetProfile(M: PExtensibleModel; StreotypeStr: string): string;
var
  S: PStereotype;
begin
  Result := '';
  if StreotypeStr <> '' then begin
    S := ExtensionManager.FindFirstStereotype(StreotypeStr, M.MetaClass.Name);
    if S <> nil then Result := S.Profile.Name;
  end;
end;

function PApplyOperationExpressionCommnad.Precondition: Boolean;
begin
  Result := not(ModelSet.IsEmpty);
end;

procedure PApplyOperationExpressionCommnad.Preprocess;
begin
  inherited;
  // Store sizes of views
  StoreViewSizes;
end;

procedure PApplyOperationExpressionCommnad.ModelsChanged;
begin
  if Assigned(FOnModelsChanged) then FOnModelsChanged(Self, FModelSet);
end;

procedure PApplyOperationExpressionCommnad.ElementsCreated(IsUnexecuting: Boolean);
begin
  if Assigned(FOnElementsCreated) then begin
    if not IsUnexecuting then FOnElementsCreated(Self, FNewParameters, FViewSet)
    else FOnElementsCreated(Self, FOldParameters, FViewSet)
  end;
end;

procedure PApplyOperationExpressionCommnad.ElementsDeleting(IsUnexecuting: Boolean);
begin
  if Assigned(FOnElementsDeleting) then begin
    if not IsUnexecuting then FOnElementsDeleting(Self, FOldParameters, FViewSet)
    else FOnElementsDeleting(Self, FNewParameters, FViewSet)
  end;
end;

procedure PApplyOperationExpressionCommnad.ElementsDeleted;
begin
  if Assigned(FOnElementsDeleted) then FOnElementsDeleted(Self);
end;

procedure PApplyOperationExpressionCommnad.SetParameter(AModelSet: PModelOrderedSet; Value: string);
var
  AModel: PModel;
  AParser: POperationExpressionParser;
  I: Integer;
  R: PParseStatus;
  ParamKind: string;
  ParamName: string;
  ParamType: string;
  ParamInitValue: string;
  TempModel: PUMLParameter;
begin
  // PRECONDITION
  Assert(AModelSet <> nil);
  Assert(AModelSet.Count = 1);
  // PRECONDITION

  // Error protection code
  if AModelSet.Count <> 1 then begin
    ModelSet.Clear;
    FErrorMessage := 'Internal Error';
    Exit;
  end;

  ModelSet.Assign(AModelSet);
  AModel := ModelSet.Items[0] as PModel;
  // ASSERTION
  Assert(AModel is PUMLOperation);
  // ASSERTION

  // Error protection code
  if not(AModel is PUMLOperation) then begin
    ModelSet.Clear;
    FErrorMessage := 'Internal Error';
    Exit;
  end;

  // Set variables for UnExecute operation
  FOldVisibility := (AModel as PUMLOperation).Visibility;
  FOldProfile := (AModel as PUMLOperation).StereotypeProfile;
  FOldStereotype := (AModel as PUMLOperation).StereotypeName;
  FOldName := (AModel as PUMLOperation).Name;
  for I := 0 to (AModel as PUMLOperation).ParameterCount - 1 do
    FOldParameters.Add((AModel as PUMLOperation).Parameters[I]);

  // Parsing
  AParser := POperationExpressionParser.Create;
  if not AParser.Initialized then begin
    AParser.Free;
    FNewName := Value
  end
  else
  try
    R := AParser.Parse(Value);
    // Parsing completed: Fill the FNewParamters set
    if (R <> psNotIntialized) and (R <> psError) then begin
      try
        if Aparser.Visibility = '+' then FNewVisibility := vkPublic
        else if Aparser.Visibility = '-' then FNewVisibility := vkPrivate
        else if Aparser.Visibility = '#' then FNewVisibility := vkProtected
        else if Aparser.Visibility = '~' then FNewVisibility := vkPackage
        else if Aparser.Visibility = '' then FNewVisibility := FOldVisibility
        else Exception.Create(ERR_CMD_EXPRESSION_PARSING);
        FNewStereotype := AParser.StereoType;
        FNewName := AParser.Name;
        //FNewName := Value;
        CheckNameValidity(FNewStereotype);
        if FNewStereotype <> FOldStereotype then
          FNewProfile := GetProfile(AModel as PExtensibleModel, FNewStereotype);
        if FNewName <> FOldName then begin
          CheckNameValidity(FNewName);
          CheckNameConflict(AModel, FNewName);
        end;
        // Return parameter
        ParamType := AParser.ReturnTypeExpression;
        if ParamType <> '' then begin
          CheckNameValidity(ParamType);
          ParamName := '';
          ParamKind := 'return';
          TempModel := MakeParameterModel(ParamKind, ParamName, ParamType, '');
          if TempModel <> nil then FNewParameters.Add(TempModel);
        end;
        // General parameters
        for I := 0 to AParser.ParameterCount - 1 do begin
          ParamKind := AParser.ParameterKinds[I];
          ParamName := AParser.ParameterNames[I];
          CheckNameValidity(ParamName);
          ParamType := AParser.ParameterTypeExpressions[I];
          CheckNameValidity(ParamType);
          ParamInitValue := AParser.ParameterDefaultValues[I];
          TempModel := MakeParameterModel(ParamKind, ParamName, ParamType, ParamInitValue);
          if TempModel <> nil then FNewParameters.Add(TempModel);
        end;
      except
        on E: Exception do begin
          ModelSet.Clear;
          FErrorMessage := E.Message;
        end;
      end;
    // Parsing Error
    end else begin
      ModelSet.Clear;
      FErrorMessage := ERR_CMD_EXPRESSION_PARSING + ' ' + AParser.LastErrorMsg;
    end;
  finally
    AParser.Free;
  end;
  SizePreservingViews.Clear;
  CollectSizesFromModelSet(AModelSet);
end;

procedure PApplyOperationExpressionCommnad.Reexecute;
var
  AModel: PUMLOperation;
  Param: PUMLParameter;
  I: Integer;
begin
  AModel := ModelSet.Items[0] as PUMLOperation;

  if FNewVisibility <> FOldVisibility then
    AModel.MOF_SetAttribute('Visibility', UMLVisibilityKindToString(FNewVisibility));
  if FNewProfile <> FOldProfile then
    AModel.StereotypeProfile := FNewProfile;
  if FNewStereotype <> FOldStereotype then
    AModel.MOF_SetAttribute('StereotypeName', FNewStereotype);
  if FNewName <> FOldName then
    AModel.MOF_SetAttribute('Name', FNewName);
  if FOldParameters.Count > 0 then begin
    ElementsDeleting(False);
    AModel.ClearParameters;
    ElementsDeleted;
  end;

  for I := 0 to FNewParameters.Count - 1 do begin
    Param := FNewParameters.Items[I] as PUMLParameter;
    AModel.AddParameter(Param);
    //AModel.MOF_AddCollectionItem('Parameters', Param);
  end;

  ModelsChanged;
  if FNewParameters.Count > 0 then ElementsCreated(False);
end;

procedure PApplyOperationExpressionCommnad.Unexecute;
var
  AModel: PUMLOperation;
  Param: PUMLParameter;
  I: Integer;
begin
  AModel := ModelSet.Items[0] as PUMLOperation;

  if FNewVisibility <> FOldVisibility then
    AModel.MOF_SetAttribute('Visibility', UMLVisibilityKindToString(FOldVisibility));
  if FNewProfile <> FOldProfile then
    AModel.StereotypeProfile := FOldProfile;
  if FNewStereotype <> FOldStereotype then
    AModel.MOF_SetAttribute('StereotypeName', FOldStereotype);
  if FNewName <> FOldName then
    AModel.MOF_SetAttribute('Name', FOldName);
  if FNewParameters.Count > 0 then begin
    ElementsDeleting(True);
    AModel.ClearParameters;
    ElementsDeleted;
  end;

  for I := 0 to FOldParameters.Count - 1 do begin
    Param := FOldParameters.Items[I] as PUMLParameter;
    //AModel.MOF_AddCollectionItem('Parameters', Param);
    AModel.AddParameter(Param);
  end;

  // Restore sizes of views
  RestoreViewSizes;

  ModelsChanged;
  if FOldParameters.Count > 0 then ElementsCreated(True);
end;

// PApplyOperationExpressionCommnad
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PApplyMessageExpressionCommnad

function PApplyMessageExpressionCommnad.GetTargetClassifierModel(AModel: PModel): PUMLClassifier;
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

function PApplyMessageExpressionCommnad.Precondition: Boolean;
var
  B: Boolean;
begin
  B := inherited Precondition;
  if not B then begin
    if not(ModelSet.IsEmpty) then begin
      if (FOldIteration <> FNewIteration) or
         (FOldBranch <> FNewBranch) or
         (FOldReturn <> FNewReturn) or
         (FOldArguments <> FNewArguments) or
         (FOldOperation <> FNewOperation) or
         (FOldSignal <> FNewSignal) or
         (FOldInstantiation <> FNewInstantiation)
      then B := True;
    end;
  end;
  Result := B;
end;

procedure PApplyMessageExpressionCommnad.SetParameter(AModelSet: PModelOrderedSet; Value: string);
var
  AMessage: PUMLMessage;
  AStimulus: PUMLStimulus;
  AAction: PUMLAction;
  AParser: PMessageExpressionParser;
  R: PParseStatus;
  NameStr: string;
  AClassifier: PUMLClassifier;
  AModel: PModel;
  OpList: PModelOrderedSet;
  B: Boolean;
begin
  inherited;
  if not(FModel is PUMLMessage) and not(FModel is PUMLStimulus) then begin
    ModelSet.Clear;
    FErrorMessage := 'Internal Error';
    Exit;
  end;
  // Set variables for UnExecute operation
  FOldOperation := nil;
  FOldSignal := nil;
  FOldInstantiation := nil;
  if FModel is PUMLMessage then begin
    AMessage := FModel as PUMLMessage;
    FOldIteration := AMessage.Iteration;
    FOldBranch := AMessage.Branch;
    FOldReturn := AMessage.Return;
    FOldArguments := AMessage.Arguments;
    AAction := AMessage.Action;
    if Assigned(AAction) then begin
      if AAction is PUMLCallAction then FOldOperation := (AAction as PUMLCallAction).Operation
      else if AAction is PUMLSendAction then FOldSignal := (AAction as PUMLSendAction).Signal
      else if AAction is PUMLCreateAction then FOldInstantiation := (AAction as PUMLCreateAction).Instantiation;
    end;
  end else begin
    AStimulus := FModel as PUMLStimulus;
    FOldIteration := AStimulus.Iteration;
    FOldBranch := AStimulus.Branch;
    FOldReturn := AStimulus.Return;
    FOldArguments := AStimulus.Arguments;
    AAction := AStimulus.Action;
    if Assigned(AAction) then begin
      if AAction is PUMLCallAction then FOldOperation := (AAction as PUMLCallAction).Operation
      else if AAction is PUMLSendAction then FOldSignal := (AAction as PUMLSendAction).Signal
      else if AAction is PUMLCreateAction then FOldInstantiation := (AAction as PUMLCreateAction).Instantiation;
    end;
  end;
  // Parsing
  AParser := PMessageExpressionParser.Create;
  if not AParser.Initialized then begin
    AParser.Free;
    FNewName := Value
  end
  else
  try
    R := AParser.Parse(Value);
    if (R <> psNotIntialized) and (R <> psError) then begin
      try
        FNewStereotype := AParser.Stereotype;
        NameStr := AParser.MessageName;
        //if AParser.Visibility <> '' then
        //  FNewVisibility := SymbolToUMLVisibilityKind(AParser.Visibility)
        //else FNewVisibility := FOldVisibility;
        FNewVisibility := FOldVisibility;
        FNewIteration := AParser.Iteration;
        FNewBranch := AParser.Branch;
        FNewReturn := AParser.Return;
        FNewArguments := AParser.Arguments;
        B := False;
        if (NameStr <> '') and (Assigned(AAction)) then begin
          if AAction is PUMLCallAction then begin
            AClassifier := GetTargetClassifierModel(FModel);
            if Assigned(AClassifier) then begin
              if Assigned(FOldOperation) and (NameStr = FOldOperation.Name) then begin
                FNewOperation := FOldOperation;
                B := True;
              end else begin
                OpList := PModelOrderedSet.Create;
                try
                  OpList.Clear;
                  UMLAux.CollectAllInheritedItems(AClassifier, 'Operations', OpList);
                  for AModel in OpList do begin
                    if AModel.Name = NameStr then begin
                      FNewOperation := AModel as PUMLOperation;
                      B := True;
                      Break;
                    end;
                  end;
                finally
                  OpList.Free;
                end;
              end;
            end;
          end else if AAction is PUMLSendAction then begin
            if Assigned(FOldSignal) and (FOldSignal.Name = NameStr) then begin
              FNewSignal := FOldSignal;
              B := True;
            end else begin
              AModel := SearchElement(FModel, NameStr, 'UMLSignal');
              if AModel <> nil then begin
                FNewSignal := AModel as PUMLSignal;
                B := True;
              end;
            end;
          end else if AAction is PUMLCreateAction then begin
            if Assigned(FOldInstantiation) and (FOldInstantiation.Name = NameStr) then begin
              FNewInstantiation := FOldInstantiation;
              B := True;
            end else begin
              AModel := SearchElement(FModel, NameStr);
              if AModel <> nil then begin
                FNewInstantiation := AModel as PUMLClassifier;
                B := True;
              end;
            end;
          end;
        end;
        if B then FNewName := FOldName
        else FNewName := NameStr;

        if FNewStereotype <> FOldStereotype then CheckNameValidity(FNewStereotype);
        FNewProfile := GetProfile(FModel, FNewStereotype);
        if FNewName <> FOldName then CheckNameValidity(FNewName);
      except
        on E: Exception do begin
          ModelSet.Clear;
          FErrorMessage := E.Message;
        end;
      end;
    end else begin
      ModelSet.Clear;
      FErrorMessage := ERR_CMD_EXPRESSION_PARSING + ' ' + AParser.LastErrorMsg;
    end;
  finally
    AParser.Free;
  end;
end;

procedure PApplyMessageExpressionCommnad.Reexecute;
var
  AMessage: PUMLMessage;
  AStimulus: PUMLStimulus;
  AAction: PUMLAction;
begin
  inherited;
  with FModel do begin
    if FOldIteration <> FNewIteration then MOF_SetAttribute('Iteration', FNewIteration);
    if FOldBranch <> FNewBranch then MOF_SetAttribute('Branch', FNewBranch);
    if FOldReturn <> FNewReturn then MOF_SetAttribute('Return', FNewReturn);
    if FOldArguments <> FNewArguments then MOF_SetAttribute('Arguments', FNewArguments);
    if FModel is PUMLMessage then begin
      AMessage := FModel as PUMLMessage;
      AAction := AMessage.Action;
      if Assigned(AAction) then begin
        if AAction is PUMLCallAction then begin
          if FOldOperation <> FNewOperation then
            AAction.MOF_SetReference('Operation', FNewOperation);
        end else if AAction is PUMLSendAction then begin
          if FOldSignal <> FNewSignal then
            AAction.MOF_SetReference('Signal', FNewSignal);
        end else if AAction is PUMLCreateAction then begin
          if FOldInstantiation <> FNewInstantiation then
            AAction.MOF_SetReference('Instantiation', FNewInstantiation);
        end;
      end;
    end else begin
      AStimulus := FModel as PUMLStimulus;
      AAction := AStimulus.Action;
      if Assigned(AAction) then begin
        if AAction is PUMLCallAction then begin
          if FOldOperation <> FNewOperation then
            AAction.MOF_SetReference('Operation', FNewOperation);
        end else if AAction is PUMLSendAction then begin
          if FOldSignal <> FNewSignal then
            AAction.MOF_SetReference('Signal', FNewSignal);
        end else if AAction is PUMLCreateAction then begin
          if FOldInstantiation <> FNewInstantiation then
            AAction.MOF_SetReference('Instantiation', FNewInstantiation);
        end;
      end;
    end;
  end;
  ModelsChanged;
end;

procedure PApplyMessageExpressionCommnad.Unexecute;
var
  AMessage: PUMLMessage;
  AStimulus: PUMLStimulus;
  AAction: PUMLAction;
begin
  inherited;
  with FModel do begin
    if FOldIteration <> FNewIteration then MOF_SetAttribute('Iteration', FOldIteration);
    if FOldBranch <> FNewBranch then MOF_SetAttribute('Branch', FOldBranch);
    if FOldReturn <> FNewReturn then MOF_SetAttribute('Return', FOldReturn);
    if FOldArguments <> FNewArguments then MOF_SetAttribute('Arguments', FOldArguments);
    if FModel is PUMLMessage then begin
      AMessage := FModel as PUMLMessage;
      AAction := AMessage.Action;
      if Assigned(AAction) then begin
        if AAction is PUMLCallAction then begin
          if FOldOperation <> FNewOperation then
            AAction.MOF_SetReference('Operation', FOldOperation);
        end else if AAction is PUMLSendAction then begin
          if FOldSignal <> FNewSignal then
            AAction.MOF_SetReference('Signal', FOldSignal);
        end else if AAction is PUMLCreateAction then begin
          if FOldInstantiation <> FNewInstantiation then
            AAction.MOF_SetReference('Instantiation', FOldInstantiation);
        end;
      end;
    end else begin
      AStimulus := FModel as PUMLStimulus;
      AAction := AStimulus.Action;
      if Assigned(AAction) then begin
        if AAction is PUMLCallAction then begin
          if FOldOperation <> FNewOperation then
            AAction.MOF_SetReference('Operation', FOldOperation);
        end else if AAction is PUMLSendAction then begin
          if FOldSignal <> FNewSignal then
            AAction.MOF_SetReference('Signal', FOldSignal);
        end else if AAction is PUMLCreateAction then begin
          if FOldInstantiation <> FNewInstantiation then
            AAction.MOF_SetReference('Instantiation', FOldInstantiation);
        end;
      end;
    end;
  end;
  RestoreViewSizes;
  ModelsChanged;
end;

// PApplyMessageExpressionCommnad
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeDocumentationCommand

function PChangeDocumentationCommand.Precondition: Boolean;
begin
  Result := Model <> nil;
end;

procedure PChangeDocumentationCommand.SetParameter(AModel: PModel; ANewDocumentation: string);
begin
  ModelSet.Clear;
  ModelSet.Add(AModel);
  Model := AModel;
  OldDocumentation := Model.Documentation;
  NewDocumentation := ANewDocumentation;
end;

procedure PChangeDocumentationCommand.Reexecute;
begin
  Model.Documentation := NewDocumentation;
  // fire model change event
  ModelsChanged;
end;

procedure PChangeDocumentationCommand.Unexecute;
begin
  Model.Documentation := OldDocumentation;
  // fire model change event
  ModelsChanged;
end;

// PChangeDocumentationCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeContainmentCommand

constructor PRelocateModelsCommand.Create;
begin
  inherited;
  ContainmentTable := PTable.Create(['Model', 'OldOwner', 'NewOwner',
    'OldCollection', 'NewCollection', 'OldIdx', 'OldName', 'NewName']);
end;

destructor PRelocateModelsCommand.Destroy;
begin
  ContainmentTable.Free;
  inherited;
end;

function PRelocateModelsCommand.Precondition: Boolean;
var
  I: Integer;
  M, NewOwner: PModel;
begin
  Result := True;
  for I := 0 to ContainmentTable.RowCount - 1 do
  begin
    M := ContainmentTable.GetObjectAt(I, 'Model') as PModel;
    NewOwner := ContainmentTable.GetObjectAt(I, 'NewOwner') as PModel;
    if not NewOwner.CanContain(M) then
    begin
      Result := False;
      Exit;
    end;
  end;
end;

procedure PRelocateModelsCommand.Preprocess;
begin
  // Store sizes of views
  StoreViewSizes;
end;

procedure PRelocateModelsCommand.SetParameter(AModelSet: PModelOrderedSet; ContainerModel: PModel);
var
  I: Integer;
  R: PMetaAssociationEnd;
  M, OldOwner, NewOwner: PModel;
  OldName, NewName, OldCollection, NewCollection: string;
  OldIdx: Integer;
begin
  ModelSet.Assign(AModelSet);
  ContainmentTable.Clear;
  SizePreservingViews.Clear;
  for I := 0 to ModelSet.Count - 1 do
  begin
    M := ModelSet.Items[I] as PModel;
    OldOwner := M.VirtualNamespace;
    NewOwner := ContainerModel;
    OldName := M.Name;
    NewName := NewOwner.GenerateAvailableName(M);
    OldCollection := '';
    R := M.GetContainerRelation(OldOwner);
    if (R <> nil) and (R.GetOtherSideEnd <> nil) then
    begin
      OldCollection := R.GetOtherSideEnd.Name;
      OldIdx := OldOwner.MOF_IndexOfCollectionItem(OldCollection, M);
    end
    else begin
      OldCollection := '';
      OldIdx := 0;
    end;
    NewCollection := '';
    R := M.GetContainerRelation(NewOwner);
    if (R <> nil) and (R.GetOtherSideEnd <> nil) then
      NewCollection := R.GetOtherSideEnd.Name;
    ContainmentTable.AddRow(['', '', '', OldCollection, NewCollection, IntToStr(OldIdx), OldName, NewName],
                            [M, OldOwner, NewOwner, nil, nil, nil, nil, nil]);
    CollectSizesFromModel(OldOwner);
    CollectSizesFromModel(NewOwner);
  end;
  ContainmentTable.SortByColumn('OldIdx', True);
end;

procedure PRelocateModelsCommand.Execute;
begin
  Preprocess;
  Reexecute;
end;

procedure PRelocateModelsCommand.Reexecute;
var
  I: Integer;
  M, OldOwner, NewOwner: PModel;
  OldCollection, NewCollection, NewName: string;
begin
  // Deleting from Old Owner.
  ElementsDeleting;
  for I := 0 to ContainmentTable.RowCount - 1 do
  begin
    M := ContainmentTable.GetObjectAt(I, 'Model') as PModel;
    OldOwner := ContainmentTable.GetObjectAt(I, 'OldOwner') as PModel;
    OldCollection := ContainmentTable.GetValueAt(I, 'OldCollection');
    OldOwner.MOF_RemoveCollectionItem(OldCollection, M);
  end;
  ElementsDeleted;
  // Adding to New Owner.
  for I := 0 to ContainmentTable.RowCount - 1 do
  begin
    M := ContainmentTable.GetObjectAt(I, 'Model') as PModel;
    NewOwner := ContainmentTable.GetObjectAt(I, 'NewOwner') as PModel;
    NewCollection := ContainmentTable.GetValueAt(I, 'NewCollection');
    NewName := ContainmentTable.GetValueAt(I, 'NewName');
    M.Name := NewName;
    NewOwner.MOF_AddCollectionItem(NewCollection, M);
  end;
  ElementsCreated;
end;

procedure PRelocateModelsCommand.Unexecute;
var
  I: Integer;
  M, OldOwner, NewOwner: PModel;
  OldCollection, NewCollection, OldName: string;
  OldIdx: Integer;
begin
  // Deleting from New Owner.
  ElementsDeleting;
  for I := 0 to ContainmentTable.RowCount - 1 do
  begin
    M := ContainmentTable.GetObjectAt(I, 'Model') as PModel;
    NewOwner := ContainmentTable.GetObjectAt(I, 'NewOwner') as PModel;
    NewCollection := ContainmentTable.GetValueAt(I, 'NewCollection');
    NewOwner.MOF_RemoveCollectionItem(NewCollection, M);
  end;
  ElementsDeleted;
  // Adding to Old Owner.
  for I := 0 to ContainmentTable.RowCount - 1 do
  begin
    M := ContainmentTable.GetObjectAt(I, 'Model') as PModel;
    OldOwner := ContainmentTable.GetObjectAt(I, 'OldOwner') as PModel;
    OldCollection := ContainmentTable.GetValueAt(I, 'OldCollection');
    OldIdx := StrToInt(ContainmentTable.GetValueAt(I, 'OldIdx'));
    OldName := ContainmentTable.GetValueAt(I, 'OldName');
    M.Name := OldName;
    OldOwner.MOF_InsertCollectionItem(OldCollection, OldIdx, M);
  end;
  ElementsCreated;
  // Restore sizes of views
  RestoreViewSizes;
end;

// PChangeContainmentCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PNewModelByCopyPasteCommand

function PNewModelByCopyPasteCommand.Precondition: Boolean;
begin
  Result := (Model <> nil) and (Owner <> nil);
end;

procedure PNewModelByCopyPasteCommand.SetParameter(AModel, ATarget: PModel);
var
  R: PMetaAssociationEnd;
begin
  Model := AModel;
  Owner := ATarget;
  // couple with new container
  R := Model.GetContainerRelation(Owner);
  Model.Name := Owner.GenerateAvailableName(Model);
  Model.MOF_SetReference(R.Name, Owner);
  ModelSet.Clear;
  ModelSet.Add(Model);
  SizePreservingViews.Clear;
  CollectSizesFromModel(ATarget);
end;

// PNewModelByCopyPasteCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAddConstraintCommand

destructor PAddConstraintCommand.Destroy;
begin
  if CommandPos = cpReexecuteStack then Constraint.Free;
  inherited;
end;

function PAddConstraintCommand.Precondition: Boolean;
begin
  Result := (ExtensibleModel <> nil) and (FConstraint <> nil);
end;

procedure PAddConstraintCommand.Reexecute;
begin
  ExtensibleModel.AddConstraint(FConstraint);
  // fire model change event
  ModelsChanged;
end;

procedure PAddConstraintCommand.Unexecute;
begin
  ExtensibleModel.RemoveConstraint(FConstraint);
  // fire model change event
  ModelsChanged;
end;

procedure PAddConstraintCommand.SetParameter(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint);
begin
  ModelSet.Clear;
  ModelSet.Add(AExtensibleModel);
  ExtensibleModel := AExtensibleModel;
  FConstraint := AConstraint;
end;

// PAddConstraintCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PDeleteConstraintCommand

destructor PDeleteConstraintCommand.Destroy;
begin
  if CommandPos = cpUnexecuteStack then Constraint.Free;
  inherited;
end;

function PDeleteConstraintCommand.Precondition: Boolean;
begin
  Result := (ExtensibleModel <> nil) and (Constraint <> nil);
end;

procedure PDeleteConstraintCommand.Reexecute;
begin
  ExtensibleModel.RemoveConstraint(Constraint);
  // fire model change event
  ModelsChanged;
end;

procedure PDeleteConstraintCommand.Unexecute;
begin
  ExtensibleModel.AddConstraint(Constraint);
  // fire model change event
  ModelsChanged;
end;

procedure PDeleteConstraintCommand.SetParameter(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint);
begin
  ModelSet.Clear;
  ModelSet.Add(AExtensibleModel);
  ExtensibleModel := AExtensibleModel;
  Constraint := AConstraint;
end;

// PDeleteConstraintCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeConstraintCommand

function PChangeConstraintCommand.Precondition: Boolean;
begin
  Result := (Constraint <> nil) and (NewConstraintName <> '');
end;

procedure PChangeConstraintCommand.Reexecute;
begin
  Constraint.Name := NewConstraintName;
  Constraint.Body := NewConstraintBody;
  // fire model change event
  ModelsChanged;
end;

procedure PChangeConstraintCommand.Unexecute;
begin
  Constraint.Name := OldConstraintName;
  Constraint.Body := OldConstraintBody;
  // fire model change event
  ModelsChanged;
end;

procedure PChangeConstraintCommand.SetParameter(AExtensibleModel: PExtensibleModel; AConstraint: PConstraint; AName: string; ABody: string);
begin
  ModelSet.Clear;
  ModelSet.Add(AExtensibleModel);
  ExtensibleModel := AExtensibleModel;
  Constraint := AConstraint;
  OldConstraintName := AConstraint.Name;
  OldConstraintBody := AConstraint.Body;
  NewConstraintName := AName;
  NewConstraintBody := ABody;
end;

// PChangeConstraintCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PSetDataTaggedValueCommand

constructor PSetDataTaggedValueCommand.Create;
begin
  TaggedValue := nil;
  inherited;
end;

destructor PSetDataTaggedValueCommand.Destroy;
begin
  if (CommandPos = cpReexecuteStack) and NeedToCreate then begin
    TaggedValue.Free;
    TaggedValue := nil;
  end;
  inherited;
end;

function PSetDataTaggedValueCommand.Precondition: Boolean;
var
  T: PTagDefinition;
begin
  T := ExtensionManager.FindTagDefinition(ProfileName, TagDefinitionSetName, TagName);
  Result := (ExtensibleModel <> nil) and (T <> nil) and IsDataTagType(T.TagType) and
    ExtensibleModel.IsApplicableTagDefinition(ProfileName, TagDefinitionSetName, TagName);
end;

procedure PSetDataTaggedValueCommand.Preprocess;
begin
  inherited;
  // Store sizes of views
  StoreViewSizes;
end;

procedure PSetDataTaggedValueCommand.Reexecute;
begin
  if NeedToCreate then begin
    if TaggedValue = nil then begin
      TaggedValue := MetaModel.CreateInstance('TaggedValue') as PTaggedValue;
      TaggedValue.Name := TagName;
      TaggedValue.ProfileName := ProfileName;
      TaggedValue.TagDefinitionSetName := TagDefinitionSetName;
    end;
    ExtensibleModel.AddTaggedValue(TaggedValue);
  end;
  TaggedValue.DataValue := NewDataValue;
  // fire model change event
  ModelsChanged;
end;

procedure PSetDataTaggedValueCommand.Unexecute;
begin
  if NeedToCreate then
    ExtensibleModel.RemoveTaggedValue(TaggedValue)
  else
    TaggedValue.DataValue := OldDataValue;
  // Restore sizes of views
  RestoreViewSizes;
  // fire model change event
  ModelsChanged;
end;

procedure PSetDataTaggedValueCommand.SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string; AValue: string);
begin
  ExtensibleModel := AExtensibleModel;
  ModelSet.Clear;
  ModelSet.Add(ExtensibleModel);
  ProfileName := AProfile;
  TagDefinitionSetName := ATagDefinitionSet;
  TagName := AName;
  TaggedValue := ExtensibleModel.FindTaggedValue(ProfileName, TagDefinitionSetName, TagName);
  if TaggedValue <> nil then begin
    OldDataValue := TaggedValue.DataValue;
    NeedToCreate := False;
  end
  else begin
    OldDataValue := '';
    NeedToCreate := True;
  end;
  NewDataValue := AValue;
  SizePreservingViews.Clear;
  CollectSizesFromModelSet(ModelSet);
end;

// PSetDataTaggedValueCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PSetReferenceTaggedValueCommand

constructor PSetReferenceTaggedValueCommand.Create;
begin
  TaggedValue := nil;
  inherited;
end;

destructor PSetReferenceTaggedValueCommand.Destroy;
begin
  if (CommandPos = cpReexecuteStack) and NeedToCreate then begin
    TaggedValue.Free;
    TaggedValue := nil;
  end;
  inherited;
end;

function PSetReferenceTaggedValueCommand.Precondition: Boolean;
var
  T: PTagDefinition;
begin
  T := ExtensionManager.FindTagDefinition(ProfileName, TagDefinitionSetName, TagName);
  Result := (ExtensibleModel <> nil) and (T <> nil) and (T.TagType = tkReference) and
    ExtensibleModel.IsApplicableTagDefinition(ProfileName, TagDefinitionSetName, TagName);
end;

procedure PSetReferenceTaggedValueCommand.Preprocess;
begin
  inherited;
  // Store sizes of views
  StoreViewSizes;
end;

procedure PSetReferenceTaggedValueCommand.Reexecute;
begin
  if NeedToCreate then begin
    if TaggedValue = nil then begin
      TaggedValue := MetaModel.CreateInstance('TaggedValue') as PTaggedValue;
      TaggedValue.Name := TagName;
      TaggedValue.ProfileName := ProfileName;
      TaggedValue.TagDefinitionSetName := TagDefinitionSetName;
    end;
    ExtensibleModel.AddTaggedValue(TaggedValue);
  end;
  if TaggedValue.ReferenceValueCount > 0 then
    TaggedValue.DeleteReferenceValue(0);
  if NewReferenceValue <> nil then
    TaggedValue.InsertReferenceValue(0, NewReferenceValue);
  // fire model change event
  ModelsChanged;
end;

procedure PSetReferenceTaggedValueCommand.Unexecute;
begin
  if TaggedValue.ReferenceValueCount > 0 then
    TaggedValue.DeleteReferenceValue(0);
  if OldReferenceValue <> nil then
    TaggedValue.InsertReferenceValue(0, OldReferenceValue);
  if NeedToCreate then
    ExtensibleModel.RemoveTaggedValue(TaggedValue);
  // Restore sizes of views
  RestoreViewSizes;
  // fire model change event
  ModelsChanged;
end;

procedure PSetReferenceTaggedValueCommand.SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string; AValue: PExtensibleModel);
begin
  ExtensibleModel := AExtensibleModel;
  ProfileName := AProfile;
  TagDefinitionSetName := ATagDefinitionSet;
  TagName := AName;
  TaggedValue := ExtensibleModel.FindTaggedValue(ProfileName, TagDefinitionSetName, TagName);
  NeedToCreate := (TaggedValue = nil);
  NewReferenceValue := AValue;
  if TaggedValue = nil then
    OldReferenceValue := nil
  else if TaggedValue.ReferenceValueCount = 0 then
    OldReferenceValue := nil
  else
    OldReferenceValue := TaggedValue.ReferenceValue[0];

  ModelSet.Clear;
  ModelSet.Add(ExtensibleModel);
  if OldReferenceValue <> nil then
    ModelSet.Add(OldReferenceValue);
  if NewReferenceValue <> nil then
    ModelSet.Add(NewReferenceValue);
  SizePreservingViews.Clear;
  CollectSizesFromModelSet(ModelSet);
end;

// PSetReferenceTaggedValueCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PSetTaggedValueAsDefaultCommand

constructor PSetTaggedValueAsDefaultCommand.Create;
begin
  inherited;
  Items := PExtensibleModelOrderedSet.Create;
end;

destructor PSetTaggedValueAsDefaultCommand.Destroy;
begin
  if CommandPos = cpUnexecuteStack then
    TaggedValue.Free;
  Items.Free;
  inherited;
end;

function PSetTaggedValueAsDefaultCommand.Precondition: Boolean;
begin
  Result := (ExtensibleModel <> nil) and (TaggedValue <> nil) and
    ExtensibleModel.IsApplicableTagDefinition(ProfileName, TagDefinitionSetName, TagName);
end;

procedure PSetTaggedValueAsDefaultCommand.Reexecute;
var
  I: Integer;
begin
  for I := TaggedValue.ReferenceValueCount - 1 downto 0 do
    TaggedValue.DeleteReferenceValue(I);
  ExtensibleModel.RemoveTaggedValue(TaggedValue);
  // fire model change event
  ModelsChanged;
end;

procedure PSetTaggedValueAsDefaultCommand.Unexecute;
var
  ExtModel: PExtensibleModel;
begin
  ExtensibleModel.AddTaggedValue(TaggedValue);
  for ExtModel in Items do
    TaggedValue.AddReferenceValue(ExtModel);
  // fire model change event
  ModelsChanged;
end;

procedure PSetTaggedValueAsDefaultCommand.SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string);
var
  Ref: PExtensibleModel;
begin
  ExtensibleModel := AExtensibleModel;
  ProfileName := AProfile;
  TagDefinitionSetName := ATagDefinitionSet;
  TagName := AName;
  TaggedValue := ExtensibleModel.FindTaggedValue(ProfileName, TagDefinitionSetName, TagName);
  ModelSet.Clear;
  ModelSet.Add(ExtensibleModel);
  Items.Clear;
  if Assigned(TaggedValue) then
    for Ref in TaggedValue.ReferenceValues do begin
      Items.Add(Ref);
      ModelSet.Add(Ref);
    end;
end;

// PSetTaggedValueAsDefaultCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAddCollectionTaggedValueCommand

constructor PAddCollectionTaggedValueCommand.Create;
begin
  TaggedValue := nil;
  inherited;
end;

destructor PAddCollectionTaggedValueCommand.Destroy;
begin
  if (CommandPos = cpReexecuteStack) and NeedToCreate then begin
    TaggedValue.Free;
    TaggedValue := nil;
  end;
  inherited;
end;

function PAddCollectionTaggedValueCommand.Precondition: Boolean;
var
  T: PTagDefinition;
begin
  T := ExtensionManager.FindTagDefinition(ProfileName, TagDefinitionSetName, TagName);
  Result := (ExtensibleModel <> nil) and (ReferenceValue <> nil) and (T <> nil) and (T.TagType = tkCollection) and
    ExtensibleModel.IsApplicableTagDefinition(ProfileName, TagDefinitionSetName, TagName);
end;

procedure PAddCollectionTaggedValueCommand.Preprocess;
begin
  inherited;
  // Store sizes of views
  StoreViewSizes;
end;

procedure PAddCollectionTaggedValueCommand.Reexecute;
begin
  if NeedToCreate then begin
    if TaggedValue = nil then begin
      TaggedValue := MetaModel.CreateInstance('TaggedValue') as PTaggedValue;
      TaggedValue.Name := TagName;
      TaggedValue.ProfileName := ProfileName;
      TaggedValue.TagDefinitionSetName := TagDefinitionSetName;
    end;
    ExtensibleModel.AddTaggedValue(TaggedValue);
  end;
  TaggedValue.AddReferenceValue(ReferenceValue);
  // fire model change event
  ModelsChanged;
end;

procedure PAddCollectionTaggedValueCommand.Unexecute;
begin
  TaggedValue.RemoveReferenceValue(ReferenceValue);
  if NeedToCreate then
    ExtensibleModel.RemoveTaggedValue(TaggedValue);
  // Restore sizes of views
  RestoreViewSizes;
  // fire model change event
  ModelsChanged;
end;

procedure PAddCollectionTaggedValueCommand.SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string; AValue: PExtensibleModel);
begin
  ExtensibleModel := AExtensibleModel;
  ProfileName := AProfile;
  TagDefinitionSetName := ATagDefinitionSet;
  TagName := AName;
  TaggedValue := ExtensibleModel.FindTaggedValue(ProfileName, TagDefinitionSetName, TagName);
  ReferenceValue := AValue;
  NeedToCreate := (TaggedValue = nil);
  ModelSet.Clear;
  ModelSet.Add(ExtensibleModel);
  ModelSet.Add(ReferenceValue);
  SizePreservingViews.Clear;
  CollectSizesFromModelSet(ModelSet);
end;

// PAddCollectionTaggedValueCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PRemoveCollectionTaggedValueCommand

function PRemoveCollectionTaggedValueCommand.Precondition: Boolean;
var
  T: PTagDefinition;
begin
  T := ExtensionManager.FindTagDefinition(ProfileName, TagDefinitionSetName, TagName);
  Result := (ExtensibleModel <> nil) and (ReferenceValue <> nil) and (T <> nil) and (T.TagType = tkCollection) and
    ExtensibleModel.IsApplicableTagDefinition(ProfileName, TagDefinitionSetName, TagName);
end;

procedure PRemoveCollectionTaggedValueCommand.Reexecute;
begin
  TaggedValue.RemoveReferenceValue(ReferenceValue);
  // fire model change event
  ModelsChanged;
end;

procedure PRemoveCollectionTaggedValueCommand.Unexecute;
begin
  TaggedValue.AddReferenceValue(ReferenceValue);
  // fire model change event
  ModelsChanged;
end;

procedure PRemoveCollectionTaggedValueCommand.SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string; AValue: PExtensibleModel);
begin
  ExtensibleModel := AExtensibleModel;
  ProfileName := AProfile;
  TagDefinitionSetName := ATagDefinitionSet;
  TagName := AName;
  TaggedValue := ExtensibleModel.FindTaggedValue(ProfileName, TagDefinitionSetName, TagName);
  ReferenceValue := AValue;
  ModelSet.Clear;
  ModelSet.Add(ExtensibleModel);
  ModelSet.Add(ReferenceValue);
end;

// PRemoveCollectionTaggedValueCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PInsertCollectionTaggedValueCommand

constructor PInsertCollectionTaggedValueCommand.Create;
begin
  TaggedValue := nil;
  inherited;
end;

destructor PInsertCollectionTaggedValueCommand.Destroy;
begin
  if (CommandPos = cpReexecuteStack) and NeedToCreate then begin
    TaggedValue.Free;
    TaggedValue := nil;
  end;
  inherited;
end;

function PInsertCollectionTaggedValueCommand.Precondition: Boolean;
var
  T: PTagDefinition;
begin
  T := ExtensionManager.FindTagDefinition(ProfileName, TagDefinitionSetName, TagName);
  Result := (ExtensibleModel <> nil) and (ReferenceValue <> nil) and (T <> nil) and (T.TagType = tkCollection) and
    ExtensibleModel.IsApplicableTagDefinition(ProfileName, TagDefinitionSetName, TagName);
end;

procedure PInsertCollectionTaggedValueCommand.Preprocess;
begin
  inherited;
  // Store sizes of views
  StoreViewSizes;
end;

procedure PInsertCollectionTaggedValueCommand.Reexecute;
begin
  if NeedToCreate then begin
    if TaggedValue = nil then begin
      TaggedValue := MetaModel.CreateInstance('TaggedValue') as PTaggedValue;
      TaggedValue.Name := TagName;
      TaggedValue.ProfileName := ProfileName;
      TaggedValue.TagDefinitionSetName := TagDefinitionSetName;
    end;
    ExtensibleModel.AddTaggedValue(TaggedValue);
  end;
  TaggedValue.InsertReferenceValue(Index, ReferenceValue);
  // fire model change event
  ModelsChanged;
end;

procedure PInsertCollectionTaggedValueCommand.Unexecute;
begin
  TaggedValue.RemoveReferenceValue(ReferenceValue);
  if NeedToCreate then
    ExtensibleModel.RemoveTaggedValue(TaggedValue);
  // Restore sizes of views
  RestoreViewSizes;
  // fire model change event
  ModelsChanged;
end;

procedure PInsertCollectionTaggedValueCommand.SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string; Idx: Integer; AValue: PExtensibleModel);
begin
  ExtensibleModel := AExtensibleModel;
  ProfileName := AProfile;
  TagDefinitionSetName := ATagDefinitionSet;
  TagName := AName;
  TaggedValue := ExtensibleModel.FindTaggedValue(ProfileName, TagDefinitionSetName, TagName);
  ReferenceValue := AValue;
  NeedToCreate := (TaggedValue = nil);
  Index := Idx;
  ModelSet.Clear;
  ModelSet.Add(ExtensibleModel);
  ModelSet.Add(ReferenceValue);
  SizePreservingViews.Clear;
  CollectSizesFromModelSet(ModelSet);
end;

// PInsertCollectionTaggedValueCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PDeleteCollectionTaggedValueCommand

function PDeleteCollectionTaggedValueCommand.Precondition: Boolean;
var
  T: PTagDefinition;
begin
  T := ExtensionManager.FindTagDefinition(ProfileName, TagDefinitionSetName, TagName);
  Result := (ExtensibleModel <> nil) and (ReferenceValue <> nil) and (T <> nil) and (T.TagType = tkCollection) and
    ExtensibleModel.IsApplicableTagDefinition(ProfileName, TagDefinitionSetName, TagName);
end;

procedure PDeleteCollectionTaggedValueCommand.Reexecute;
begin
  TaggedValue.RemoveReferenceValue(ReferenceValue);
  // fire model change event
  ModelsChanged;
end;

procedure PDeleteCollectionTaggedValueCommand.Unexecute;
begin
  TaggedValue.InsertReferenceValue(Index, ReferenceValue);
  // fire model change event
  ModelsChanged;
end;

procedure PDeleteCollectionTaggedValueCommand.SetParameter(AExtensibleModel: PExtensibleModel; AProfile: string; ATagDefinitionSet: string; AName: string; Idx: Integer);
begin
  ExtensibleModel := AExtensibleModel;
  ProfileName := AProfile;
  TagDefinitionSetName := ATagDefinitionSet;
  TagName := AName;
  TaggedValue := ExtensibleModel.FindTaggedValue(ProfileName, TagDefinitionSetName, TagName);
  Index := Idx;
  ReferenceValue := TaggedValue.ReferenceValue[Index];
  ModelSet.Clear;
  ModelSet.Add(ExtensibleModel);
  ModelSet.Add(ReferenceValue);
end;

// PDeleteCollectionTaggedValueCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeCollectionTaggedValueOrderCommand

function PChangeCollectionTaggedValueOrderCommand.Precondition: Boolean;
var
  T: PTagDefinition;
begin
  T := ExtensionManager.FindTagDefinition(ProfileName, TagDefinitionSetName, TagName);
  Result := (ExtensibleModel <> nil) and (ReferenceValue <> nil) and (T <> nil) and (T.TagType = tkCollection) and
    ExtensibleModel.IsApplicableTagDefinition(ProfileName, TagDefinitionSetName, TagName) and
    (NewIndex > -1) and (NewIndex < TaggedValue.ReferenceValueCount);
end;

procedure PChangeCollectionTaggedValueOrderCommand.Reexecute;
begin
  TaggedValue.RemoveReferenceValue(ReferenceValue);
  TaggedValue.InsertReferenceValue(NewIndex, ReferenceValue);
  // fire model change event
  ModelsChanged;
end;

procedure PChangeCollectionTaggedValueOrderCommand.Unexecute;
begin
  TaggedValue.RemoveReferenceValue(ReferenceValue);
  TaggedValue.InsertReferenceValue(OldIndex, ReferenceValue);
  // fire model change event
  ModelsChanged;
end;

procedure PChangeCollectionTaggedValueOrderCommand.SetParameter(AExtensibleModel: PExtensibleModel; AProfile, ATagDefinitionSet, AName: string;
  AValue: PExtensibleModel; NewIdx: Integer);
begin
  ExtensibleModel := AExtensibleModel;
  ProfileName := AProfile;
  TagDefinitionSetName := ATagDefinitionSet;
  TagName := AName;
  TaggedValue := ExtensibleModel.FindTaggedValue(ProfileName, TagDefinitionSetName, TagName);
  ReferenceValue := AValue;
  OldIndex := TaggedValue.IndexOfReferenceValue(ReferenceValue);
  NewIndex := NewIdx;
  ModelSet.Clear;
  ModelSet.Add(ExtensibleModel);
end;

// PRemoveCollectionTaggedValueCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PClearAttachmentsCommand

function PClearAttachmentsCommand.Precondition: Boolean;
begin
  Result := (Model <> nil);
end;

procedure PClearAttachmentsCommand.Reexecute;
begin
  Model.Attachments.Text := '';
  // fire model change event
  ModelsChanged;
end;

procedure PClearAttachmentsCommand.Unexecute;
begin
  Model.Attachments.Text := Attachments;
  // fire model change event
  ModelsChanged;
end;

procedure PClearAttachmentsCommand.SetParameter(AModel: PModel);
begin
  ModelSet.Clear;
  ModelSet.Add(AModel);
  Model := AModel;
  Attachments := Model.Attachments.Text;
end;

// PAddAttachmentCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAddAttachmentCommand

function PAddAttachmentCommand.Precondition: Boolean;
begin
  Result := (Model <> nil) and (Attachment <> '');
end;

procedure PAddAttachmentCommand.Reexecute;
begin
  Model.AddAttachment(Attachment);
  Index := Model.Attachments.Count - 1;
  // fire model change event
  ModelsChanged;
end;

procedure PAddAttachmentCommand.Unexecute;
begin
  Model.DeleteAttachment(Index);
  // fire model change event
  ModelsChanged;
end;

procedure PAddAttachmentCommand.SetParameter(AModel: PModel; Attach: string);
begin
  ModelSet.Clear;
  ModelSet.Add(AModel);
  Model := AModel;
  Attachment := Attach;
end;

// PAddAttachmentCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PInsertAttachmentCommand

function PInsertAttachmentCommand.Precondition: Boolean;
begin
  Result := (Model <> nil) and (Attachment <> '') and (Index > -1) and (Index < Model.Attachments.Count);
end;

procedure PInsertAttachmentCommand.Reexecute;
begin
  Model.InsertAttachment(Index, Attachment);
  // fire model change event
  ModelsChanged;
end;

procedure PInsertAttachmentCommand.Unexecute;
begin
  Model.DeleteAttachment(Index);
  // fire model change event
  ModelsChanged;
end;

procedure PInsertAttachmentCommand.SetParameter(AModel: PModel; Attach: string; AIndex: Integer);
begin
  ModelSet.Clear;
  ModelSet.Add(AModel);
  Model := AModel;
  Attachment := Attach;
  Index := AIndex;
end;

// PInsertAttachmentCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PDeleteAttachmentCommand

function PDeleteAttachmentCommand.Precondition: Boolean;
begin
  Result := (Model <> nil) and (Index > -1) and (Index < Model.Attachments.Count);
end;

procedure PDeleteAttachmentCommand.Reexecute;
begin
  Attachment := Model.Attachments[Index];
  Model.DeleteAttachment(Index);
  // fire model change event
  ModelsChanged;
end;

procedure PDeleteAttachmentCommand.Unexecute;
begin
  Model.Attachments.Insert(Index, Attachment);
  // fire model change event
  ModelsChanged;
end;

procedure PDeleteAttachmentCommand.SetParameter(AModel: PModel; Idx: Integer);
begin
  ModelSet.Clear;
  ModelSet.Add(AModel);
  Model := AModel;
  Index := Idx;
end;

// PDeleteAttachmentCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeAttachmentCommand

function PChangeAttachmentCommand.Precondition: Boolean;
begin
  Result := (Model <> nil) and (Index > -1) and (Index < Model.Attachments.Count);
end;

procedure PChangeAttachmentCommand.Reexecute;
begin
  OldAttachment := Model.Attachments[Index];
  Model.Attachments[Index] := Attachment;
  // fire model change event
  ModelsChanged;
end;

procedure PChangeAttachmentCommand.Unexecute;
begin
  Model.Attachments[Index] := OldAttachment;
  // fire model change event
  ModelsChanged;
end;

procedure PChangeAttachmentCommand.SetParameter(AModel: PModel; Idx: Integer; Attach: string);
begin
  ModelSet.Clear;
  ModelSet.Add(AModel);
  Model := AModel;
  Index := Idx;
  Attachment := Attach;
end;

// PChangeAttachmentCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeAttachmentOrderCommand

function PChangeAttachmentOrderCommand.Precondition: Boolean;
begin
  Result := (Model <> nil) and (OldIndex > -1) and (OldIndex < Model.Attachments.Count)
    and (NewIndex > -1) and (NewIndex < Model.Attachments.Count);
end;

procedure PChangeAttachmentOrderCommand.Reexecute;
var
  A: string;
begin
  A := Model.Attachments[OldIndex];
  Model.DeleteAttachment(OldIndex);
  Model.InsertAttachment(NewIndex, A);
  // fire model change event
  ModelsChanged;
end;

procedure PChangeAttachmentOrderCommand.Unexecute;
var
  A: string;
begin
  A := Model.Attachments[NewIndex];
  Model.DeleteAttachment(NewIndex);
  Model.InsertAttachment(OldIndex, A);
  // fire model change event
  ModelsChanged;
end;

procedure PChangeAttachmentOrderCommand.SetParameter(AModel: PModel; Idx: Integer; NewIdx: Integer);
begin
  ModelSet.Clear;
  ModelSet.Add(AModel);
  Model := AModel;
  OldIndex := Idx;
  NewIndex := NewIdx;
end;

// PChangeAttachmentOrderCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PMoveViewsChangingContainerViewCommand

constructor PMoveViewsChaningContainerViewCommand.Create;
begin
  inherited;
  FViewSet := PViewOrderedSet.Create;
  ViewTable := PTable.Create(['View', 'OldContainer', 'OldIdx', 'OldLeft', 'OldTop', 'NewContainer']);
end;

destructor PMoveViewsChaningContainerViewCommand.Destroy;
begin
  FViewSet.Free;
  ViewTable.Free;
  inherited;
end;

function PMoveViewsChaningContainerViewCommand.Precondition: Boolean;
var
  I: Integer;
  V, NewContainer: PView;
begin
  Result := inherited Precondition;
  if Result then
    for I := 0 to ViewTable.RowCount - 1 do
    begin
      V := ViewTable.GetObjectAt(I, 'View') as PView;
      NewContainer := ViewTable.GetObjectAt(I, 'NewContainer') as PView;
      if (NewContainer <> nil) and (not NewContainer.CanContainView(V)) then
      begin
        Result := False;
        Exit;
      end
    end;
end;

procedure PMoveViewsChaningContainerViewCommand.SetParameter(ADiagramView: PDiagramView; AViewSet: PViewOrderedSet; ADX, ADY: Integer; AContainerView: PView);
var
  I: Integer;
  TempSet: PModelOrderedSet;
  V, OldContainer, NewContainer: PView;
  OldIdx, OldLeft, OldTop: Integer;
  ContainerModel: PModel;

  function GetOwnerByDiagramView(DV: PDiagramView): PModel;
  begin
    if DV is PUMLStatechartDiagramView then
      Result := (DV.Diagram.DiagramOwner as PUMLStateMachine).Top
    else
      Result := DV.Diagram.DiagramOwner;
  end;

begin
  // Setting Models to be relocated.
  TempSet := PModelOrderedSet.Create;
  TempSet.Clear;
  try
    for I := 0 to AViewSet.Count - 1 do
      TempSet.Add((AViewSet.Items[I] as PView).Model);
    if AContainerView = nil then
      ContainerModel := GetOwnerByDiagramView(ADiagramView)
    else
      ContainerModel := AContainerView.Model;
    inherited SetParameter(TempSet, ContainerModel);
  finally
    TempSet.Free;
  end;
  // Setting Views to be contained in new ContainerView.
  ViewSet.Assign(AViewSet);
  DX := ADX; DY := ADY;
  DiagramView := ADiagramView;
  for I := 0 to ViewSet.Count - 1 do
  begin
    V := ViewSet.Items[I] as PView;
    OldContainer := V.ContainerView;
    NewContainer := AContainerView;
    if OldContainer <> nil then
      OldIdx := OldContainer.IndexOfContainedView(V)
    else
      OldIdx := 0;
    OldLeft := (V as PNodeView).Left;
    OldTop := (V as PNodeView).Top;
    ViewTable.AddRow(['', '', IntToStr(OldIdx), IntToStr(OldLeft), IntToStr(OldTop), ''],
                     [V, OldContainer, nil, nil, nil, NewContainer])
  end;
  ViewSet.Add(AContainerView);
  ViewTable.SortByColumn('OldIdx', True);
end;

procedure PMoveViewsChaningContainerViewCommand.ViewsChanged;
begin
  if Assigned(FOnViewsChanged) then FOnViewsChanged(Self, FViewSet);
end;

procedure PMoveViewsChaningContainerViewCommand.Reexecute;
var
  I: Integer;
  V, OldContainer, NewContainer: PView;
begin
  for I := 0 to ViewTable.RowCount - 1 do
  begin
    V := ViewTable.GetObjectAt(I, 'View') as PView;
    OldContainer := ViewTable.GetObjectAt(I, 'OldContainer') as PView;
    NewContainer := ViewTable.GetObjectAt(I, 'NewContainer') as PView;
    if (OldContainer = nil) and (V.OwnerDiagramView <> nil) then
      V.OwnerDiagramView.RemoveOwnedView(V)
    else if OldContainer <> nil then
      OldContainer.RemoveContainedView(V);
    if NewContainer = nil then
      DiagramView.AddOwnedView(V)
    else
      NewContainer.AddContainedView(V);
    V.Move(DiagramView.Canvas, DX, DY);
  end;
  inherited;
  ViewsChanged;
end;

procedure PMoveViewsChaningContainerViewCommand.Unexecute;
var
  I: Integer;
  V, OldContainer, NewContainer: PView;
  OldIdx, OldLeft, OldTop: Integer;
begin
  for I := 0 to ViewTable.RowCount - 1 do
  begin
    V := ViewTable.GetObjectAt(I, 'View') as PView;
    OldContainer := ViewTable.GetObjectAt(I, 'OldContainer') as PView;
    NewContainer := ViewTable.GetObjectAt(I, 'NewContainer') as PView;
    OldIdx := StrToInt(ViewTable.GetValueAt(I, 'OldIdx'));
    OldLeft := StrToInt(ViewTable.GetValueAt(I, 'OldLeft'));
    OldTop := StrToInt(ViewTable.GetValueAt(I, 'OldTop'));
    if NewContainer <> nil then NewContainer.RemoveContainedView(V);
    (V as PNodeView).Left := OldLeft;
    (V as PNodeView).Top := OldTop;
    if OldContainer = nil then
      DiagramView.AddOwnedView(V)
    else
      OldContainer.InsertContainedView(OldIdx, V);
  end;
  inherited;
  ViewsChanged;
end;

// PMoveViewsChangingContainerViewCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeModelsStereotypeCommand

constructor PChangeModelsStereotypeCommand.Create;
begin
  inherited;
  OldProfiles := TStringList.Create;
  OldStereotypes := TStringList.Create;
end;

destructor PChangeModelsStereotypeCommand.Destroy;
begin
  OldProfiles.Free;
  OldStereotypes.Free;
  inherited;
end;

function PChangeModelsStereotypeCommand.Precondition: Boolean;
var
  MClass: string;
  I: Integer;
begin
  if ModelSet.IsEmpty then
    Result := False
  else begin
    Result := True;
    MClass := (ModelSet.Items[0] as PExtensibleModel).MetaClass.Name;
    for I := 1 to ModelSet.Count - 1 do
      if (ModelSet.Items[I] as PExtensibleModel).MetaClass.Name <> MClass then begin
        Result := False;
        Exit;
      end;
  end;
end;

procedure PChangeModelsStereotypeCommand.Preprocess;
begin
  inherited;
  // Store sizes of views
  StoreViewSizes;
end;

procedure PChangeModelsStereotypeCommand.SetParameter(AModelSet: PModelOrderedSet; ANewProfile: string; ANewStereotype: string);
var
  M: PExtensibleModel;
  S: PStereotype;
  I: Integer;
begin
  ModelSet.Assign(AModelSet);
  if ANewProfile = '' then
    S := ExtensionManager.FindFirstStereotype(ANewStereotype, (AModelSet.Items[0] as PExtensibleModel).MetaClass.Name)
  else
    S := ExtensionManager.FindStereotype(ANewProfile, ANewStereotype, (AModelSet.Items[0] as PExtensibleModel).MetaClass.Name);
  if S <> nil then begin
    NewProfile := S.Profile.Name;
    NewStereotype := S.Name;
  end
  else begin
    NewProfile := '';
    NewStereotype := ANewStereotype;
  end;

  for I := 0 to ModelSet.Count - 1 do
  begin
    // ASSERTION
    Assert(ModelSet.Items[I] is PExtensibleModel);
    // ASSERTION
    M := ModelSet.Items[I] as PExtensibleModel;
    OldProfiles.Add(M.StereotypeProfile);
    OldStereotypes.Add(M.StereotypeName);
  end;

  SizePreservingViews.Clear;
  CollectSizesFromModelSet(AModelSet);
end;

procedure PChangeModelsStereotypeCommand.Reexecute;
var
  M: PExtensibleModel;
  I: Integer;
begin
  for I := 0 to ModelSet.Count - 1 do begin
    M := ModelSet.Items[I] as PExtensibleModel;
    M.StereotypeProfile := NewProfile;
    M.StereotypeName := NewStereotype;
  end;
  ModelsChanged;
end;

procedure PChangeModelsStereotypeCommand.Unexecute;
var
  M: PExtensibleModel;
  I: Integer;
begin
  for I := 0 to ModelSet.Count - 1 do begin
    M := ModelSet.Items[I] as PUMLModelElement;
    M.StereotypeProfile := OldProfiles[I];
    M.StereotypeName := OldStereotypes[I];
  end;

  RestoreViewSizes;
  ModelsChanged;
end;

// PChangeModelsStereotypeCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAbstractChangeCreateDeleteElementsCommand

constructor PAbstractChangeCreateDeleteElementsCommand.Create;
begin
  inherited;
  FChangingModels := PModelOrderedSet.Create;
  FChangingViews := PViewOrderedSet.Create;
end;

destructor PAbstractChangeCreateDeleteElementsCommand.Destroy;
begin
  FChangingModels.Free;
  FChangingViews.Free;
  inherited;
end;

procedure PAbstractChangeCreateDeleteElementsCommand.ModelsChanged;
begin
  if Assigned(FOnModelsChanged) then FOnModelsChanged(Self, FChangingModels);
end;

procedure PAbstractChangeCreateDeleteElementsCommand.ViewsChanged;
begin
  if Assigned(FOnViewsChanged) then FOnViewsChanged(Self, FChangingViews);
end;

// PAbstractChangeCreateDeleteElementsCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAbstractChangeCreateElementsCommand

constructor PAbstractChangeCreateElementsCommand.Create;
begin
  inherited;
  FChangingModels := PModelOrderedSet.Create;
  FChangingViews := PViewOrderedSet.Create;
end;

destructor PAbstractChangeCreateElementsCommand.Destroy;
begin
  FChangingModels.Free;
  FChangingViews.Free;
  inherited;
end;

procedure PAbstractChangeCreateElementsCommand.ModelsChanged;
begin
  if Assigned(FOnModelsChanged) then FOnModelsChanged(Self, FChangingModels);
end;

procedure PAbstractChangeCreateElementsCommand.ViewsChanged;
begin
  if Assigned(FOnViewsChanged) then FOnViewsChanged(Self, FChangingViews);
end;

// PAbstractChangeCreateElementsCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PReconnectEdgeCommand

constructor PReconnectEdgeCommand.Create;
begin
  inherited;
  NewPoints := PPoints.Create;
  OldPoints := PPoints.Create;
  ViewTable := PTable.Create(['VIEW', 'DIAGRAM', 'IDX']);
end;

destructor PReconnectEdgeCommand.Destroy;
begin
  NewPoints.Free;
  OldPoints.Free;
  ViewTable.Free;
  inherited;
end;

function PReconnectEdgeCommand.Precondition: Boolean;
var
  C: Boolean;
begin
  if IsTailSide then
    C := IsValidConnection(Edge, NewPartView, Edge.Head)
  else
    C := IsValidConnection(Edge, Edge.Tail, NewPartView);
  Result := C and not OldPoints.Equal(NewPoints);
end;

procedure PReconnectEdgeCommand.SetParameter(AEdge: PEdgeView; APoints: PPoints; ANewParicipant: PView; AIsTailSide: Boolean);
var
  Dgm: PDiagramView;
  V: PView;
  Idx, I: Integer;
begin
  ChangingModels.Clear;
  ChangingViews.Clear;
  ModelSet.Clear;
  ViewSet.Clear;

  // set variables
  Edge := AEdge;
  IsTailSide := AIsTailSide;
  NewPoints.Assign(APoints);
  OldPoints.Assign(Edge.Points);
  NewPartView := ANewParicipant;
  OldLineStyle := Edge.LineStyle;
  NewLineStyle := Edge.LineStyle;
  if IsTailSide then begin
    OldPartView := Edge.Tail;
    if Edge.Head = NewPartView then
      NewLineStyle := lsRectilinear;
  end
  else begin
    OldPartView := Edge.Head;
    if Edge.Tail = NewPartView then
      NewLineStyle := lsRectilinear;
  end;

  // set models set and views set
  FChangingViews.Add(Edge);
  if Edge.Model <> nil then begin
    FChangingModels.Add(Edge.Model);
    if Edge.Model is PUMLLink then
      for I := 0 to (Edge.Model as PUMLLink).StimulusCount - 1 do
        FChangingModels.Add((Edge.Model as PUMLLink).Stimuli[I])
    else if Edge.Model is PUMLAssociationRole then
      for I := 0 to (Edge.Model as PUMLAssociationRole).MessageCount - 1 do
        FChangingModels.Add((Edge.Model as PUMLAssociationRole).Messages[I]);
    for I := 0 to Edge.Model.ViewCount - 1 do begin
      V := Edge.Model.View[I];
      // if V.MetaClass <> Edge.MetaClass ?
      if (V.MetaClass = Edge.MetaClass) and (V <> Edge) then
        FViewSet.Add(V);
    end;
  end;

  // store index of each view object.
  ViewTable.Clear;
  for I := 0 to ViewSet.Count - 1 do begin
    V := ViewSet.Items[I] as PView;
    Dgm := V.OwnerDiagramView;
    if Dgm <> nil then begin
      Idx := Dgm.IndexOfOwnedView(V);
      ViewTable.AddRow(['', '', IntToStr(Idx)], [V, Dgm, nil]);
    end;
  end;
end;

procedure PReconnectEdgeCommand.Reexecute;
var
  UM: PUMLMessage;
  US: PUMLStimulus;
  I: Integer;
begin
  inherited;

  // delete views that affected by changing connection of edge
  ElementsDeleting;
  for I := 0 to FViewReferences.Count - 1 do
    (FViewReferences.Items[I] as PElement).Isolate;
  ElementsDeleted;

  // set participant-related property
  if Edge is PUMLAssociationRoleView then begin
    if IsTailSide then begin
      for I := 0 to (Edge.Model as PUMLAssociationRole).MessageCount - 1 do begin
        UM := (Edge.Model as PUMLAssociationRole).Messages[I];
        if UM.Sender = (Edge.Model as PUMLAssociationRole).Connections[0].Participant then // forward
          UM.Sender := (NewPartView.Model as PUMLClassifierRole)
        else if UM.Receiver = (Edge.Model as PUMLAssociationRole).Connections[0].Participant then // reverse
          UM.Receiver := (NewPartView.Model as PUMLClassifierRole);
      end;
      (Edge.Model as PUMLAssociationRole).Connections[0].Participant := (NewPartView.Model as PUMLClassifierRole);
    end
    else begin
      for I := 0 to (Edge.Model as PUMLAssociationRole).MessageCount - 1 do begin
        UM := (Edge.Model as PUMLAssociationRole).Messages[I];
        if UM.Sender = (Edge.Model as PUMLAssociationRole).Connections[1].Participant then // forward
          UM.Sender := (NewPartView.Model as PUMLClassifierRole)
        else if UM.Receiver = (Edge.Model as PUMLAssociationRole).Connections[1].Participant then // reverse
          UM.Receiver := (NewPartView.Model as PUMLClassifierRole);
      end;
      (Edge.Model as PUMLAssociationRole).Connections[1].Participant := (NewPartView.Model as PUMLClassifierRole);
    end;
  end
  else if Edge is PUMLAssociationView then begin
    if IsTailSide then
      (Edge.Model as PUMLAssociation).Connections[0].Participant := (NewPartView.Model as PUMLClassifier)
    else
      (Edge.Model as PUMLAssociation).Connections[1].Participant := (NewPartView.Model as PUMLClassifier);
  end
  else if Edge is PUMLAssociationClassView then begin
    if NewPartView.Model is PUMLClass then
      (Edge.Model as PUMLAssociationClass).ClassSide := (NewPartView.Model as PUMLClass)
    else if NewPartView.Model is PUMLAssociation then
      (Edge.Model as PUMLAssociationClass).AssociationSide := (NewPartView.Model as PUMLAssociation);
  end
  else if (Edge is PUMLDependencyView) or (Edge is PUMLRealizationView) then begin
    if IsTailSide then
      (Edge.Model as PUMLDependency).Client := (NewPartView.Model as PUMLModelElement)
    else
      (Edge.Model as PUMLDependency).Supplier := (NewPartView.Model as PUMLModelElement);
  end
  else if Edge is PUMLExtendView then begin
    if IsTailSide then
      (Edge.Model as PUMLExtend).Extension := (NewPartView.Model as PUMLUseCase)
    else
      (Edge.Model as PUMLExtend).Base := (NewPartView.Model as PUMLUseCase);
  end
  else if Edge is PUMLGeneralizationView then begin
    if IsTailSide then
      (Edge.Model as PUMLGeneralization).Child := (NewPartView.Model as PUMLGeneralizableElement)
    else
      (Edge.Model as PUMLGeneralization).Parent := (NewPartView.Model as PUMLGeneralizableElement);
  end
  else if Edge is PUMLIncludeView then begin
    if IsTailSide then
      (Edge.Model as PUMLInclude).Base := (NewPartView.Model as PUMLUseCase)
    else
      (Edge.Model as PUMLInclude).Addition := (NewPartView.Model as PUMLUseCase);
  end
  else if Edge is PUMLLinkView then begin
    if IsTailSide then begin
      for I := 0 to (Edge.Model as PUMLLink).StimulusCount - 1 do begin
        US := (Edge.Model as PUMLLink).Stimuli[I];
        if US.Sender = (Edge.Model as PUMLLink).Connections[0].Instance then // forward
          US.Sender := (NewPartView.Model as PUMLInstance)
        else if US.Receiver = (Edge.Model as PUMLLink).Connections[0].Instance then // reverse
          US.Receiver := (NewPartView.Model as PUMLInstance);
      end;
      (Edge.Model as PUMLLink).Connections[0].Instance := (NewPartView.Model as PUMLInstance);
    end
    else begin
      for I := 0 to (Edge.Model as PUMLLink).StimulusCount - 1 do begin
        US := (Edge.Model as PUMLLink).Stimuli[I];
        if US.Sender = (Edge.Model as PUMLLink).Connections[1].Instance then // forward
          US.Sender := (NewPartView.Model as PUMLInstance)
        else if US.Receiver = (Edge.Model as PUMLLink).Connections[1].Instance then // reverse
          US.Receiver := (NewPartView.Model as PUMLInstance);
      end;
      (Edge.Model as PUMLLink).Connections[1].Instance := (NewPartView.Model as PUMLInstance);
    end;
  end
  else if Edge is PUMLSeqMessageView then begin
    if IsTailSide then
      (Edge.Model as PUMLMessage).Sender := (NewPartView.Model as PUMLClassifierRole)
    else
      (Edge.Model as PUMLMessage).Receiver := (NewPartView.Model as PUMLClassifierRole)
  end
  else if Edge is PUMLSeqStimulusView then begin
    if IsTailSide then
      (Edge.Model as PUMLStimulus).Sender := (NewPartView.Model as PUMLInstance)
    else
      (Edge.Model as PUMLStimulus).Receiver := (NewPartView.Model as PUMLInstance)
  end
  else if Edge is PUMLTransitionView then begin
    if IsTailSide then
      (Edge.Model as PUMLTransition).Source := (NewPartView.Model as PUMLStateVertex)
    else
      (Edge.Model as PUMLTransition).Target := (NewPartView.Model as PUMLStateVertex);
  end
  else if Edge is PUMLConnectorView then begin
    if IsTailSide then
      (Edge.Model as PUMLConnector).Ends[0].Role := (NewPartView.Model as PUMLFeature)
    else
      (Edge.Model as PUMLConnector).Ends[1].Role := (NewPartView.Model as PUMLFeature);
  end;

  // set edge view information with new participant
  Edge.Points := NewPoints;
  if IsTailSide then
    Edge.Tail := NewPartView
  else
    Edge.Head := NewPartView;
  Edge.LineStyle := NewLineStyle;

  ModelsChanged;
  ViewsChanged;
end;

procedure PReconnectEdgeCommand.Unexecute;
var
  Dgm: PDiagramView;
  V: PView;
  US: PUMLStimulus;
  UM: PUMLMessage;
  Idx, I: Integer;
begin
  inherited;

  // restore edge view information
  Edge.Points := OldPoints;
  if IsTailSide then
    Edge.Tail := OldPartView
  else
    Edge.Head := OldPartView;
  Edge.LineStyle := OldLineStyle;

  // restore participant-related property
  if Edge is PUMLAssociationRoleView then begin
    if IsTailSide then begin
      for I := 0 to (Edge.Model as PUMLAssociationRole).MessageCount - 1 do begin
        UM := (Edge.Model as PUMLAssociationRole).Messages[I];
        if UM.Sender = (Edge.Model as PUMLAssociationRole).Connections[0].Participant then // forward
          UM.Sender := (OldPartView.Model as PUMLClassifierRole)
        else if UM.Receiver = (Edge.Model as PUMLAssociationRole).Connections[0].Participant then // reverse
          UM.Receiver := (OldPartView.Model as PUMLClassifierRole);
      end;
      (Edge.Model as PUMLAssociationRole).Connections[0].Participant := (OldPartView.Model as PUMLClassifierRole);
    end
    else begin
      for I := 0 to (Edge.Model as PUMLAssociationRole).MessageCount - 1 do begin
        UM := (Edge.Model as PUMLAssociationRole).Messages[I];
        if UM.Sender = (Edge.Model as PUMLAssociationRole).Connections[1].Participant then // forward
          UM.Sender := (OldPartView.Model as PUMLClassifierRole)
        else if UM.Receiver = (Edge.Model as PUMLAssociationRole).Connections[1].Participant then // reverse
          UM.Receiver := (OldPartView.Model as PUMLClassifierRole);
      end;
      (Edge.Model as PUMLAssociationRole).Connections[1].Participant := (OldPartView.Model as PUMLClassifierRole);
    end;
  end
  else if Edge is PUMLAssociationView then begin
    if IsTailSide then
      (Edge.Model as PUMLAssociation).Connections[0].Participant := (OldPartView.Model as PUMLClassifier)
    else
      (Edge.Model as PUMLAssociation).Connections[1].Participant := (OldPartView.Model as PUMLClassifier);
  end
  else if Edge is PUMLAssociationClassView then begin
    if OldPartView.Model is PUMLClass then
      (Edge.Model as PUMLAssociationClass).ClassSide := (OldPartView.Model as PUMLClass)
    else if OldPartView.Model is PUMLAssociation then
      (Edge.Model as PUMLAssociationClass).AssociationSide := (OldPartView.Model as PUMLAssociation);
  end
  else if (Edge is PUMLDependencyView) or (Edge is PUMLRealizationView) then begin
    if IsTailSide then
      (Edge.Model as PUMLDependency).Client := (OldPartView.Model as PUMLModelElement)
    else
      (Edge.Model as PUMLDependency).Supplier := (OldPartView.Model as PUMLModelElement);
  end
  else if Edge is PUMLExtendView then begin
    if IsTailSide then
      (Edge.Model as PUMLExtend).Extension := (OldPartView.Model as PUMLUseCase)
    else
      (Edge.Model as PUMLExtend).Base := (OldPartView.Model as PUMLUseCase);
  end
  else if Edge is PUMLGeneralizationView then begin
    if IsTailSide then
      (Edge.Model as PUMLGeneralization).Child := (OldPartView.Model as PUMLGeneralizableElement)
    else
      (Edge.Model as PUMLGeneralization).Parent := (OldPartView.Model as PUMLGeneralizableElement);
  end
  else if Edge is PUMLIncludeView then begin
    if IsTailSide then
      (Edge.Model as PUMLInclude).Base := (OldPartView.Model as PUMLUseCase)
    else
      (Edge.Model as PUMLInclude).Addition := (OldPartView.Model as PUMLUseCase);
  end
  else if Edge is PUMLLinkView then begin
    if IsTailSide then begin
      for I := 0 to (Edge.Model as PUMLLink).StimulusCount - 1 do begin
        US := (Edge.Model as PUMLLink).Stimuli[I];
        if US.Sender = (Edge.Model as PUMLLink).Connections[0].Instance then // forward
          US.Sender := (OldPartView.Model as PUMLInstance)
        else if US.Receiver = (Edge.Model as PUMLLink).Connections[0].Instance then // reverse
          US.Receiver := (OldPartView.Model as PUMLInstance);
      end;
      (Edge.Model as PUMLLink).Connections[0].Instance := (OldPartView.Model as PUMLInstance);
    end
    else begin
      for I := 0 to (Edge.Model as PUMLLink).StimulusCount - 1 do begin
        US := (Edge.Model as PUMLLink).Stimuli[I];
        if US.Sender = (Edge.Model as PUMLLink).Connections[1].Instance then // forward
          US.Sender := (OldPartView.Model as PUMLInstance)
        else if US.Receiver = (Edge.Model as PUMLLink).Connections[1].Instance then // reverse
          US.Receiver := (OldPartView.Model as PUMLInstance);
      end;
      (Edge.Model as PUMLLink).Connections[1].Instance := (OldPartView.Model as PUMLInstance);
    end;
  end
  else if Edge is PUMLSeqMessageView then begin
    if IsTailSide then
      (Edge.Model as PUMLMessage).Sender := (OldPartView.Model as PUMLClassifierRole)
    else
      (Edge.Model as PUMLMessage).Receiver := (OldPartView.Model as PUMLClassifierRole)
  end
  else if Edge is PUMLSeqStimulusView then begin
    if IsTailSide then
      (Edge.Model as PUMLStimulus).Sender := (OldPartView.Model as PUMLInstance)
    else
      (Edge.Model as PUMLStimulus).Receiver := (OldPartView.Model as PUMLInstance)
  end
  else if Edge is PUMLTransitionView then begin
    if IsTailSide then
      (Edge.Model as PUMLTransition).Source := (OldPartView.Model as PUMLStateVertex)
    else
      (Edge.Model as PUMLTransition).Target := (OldPartView.Model as PUMLStateVertex);
  end;

  ViewsChanged;
  ModelsChanged;

  // restore states of all views using mementos.
  for I := 0 to FViewReferences.Count - 1 do
    (FViewReferences.Items[I] as PElement).SetMemento(FViewMementos.Items[I]);

  // restore index of each view object.
  for I := 0 to ViewTable.RowCount - 1 do begin
    V := ViewTable.GetObjectAt(I, 'VIEW') as PView;
    Dgm := ViewTable.GetObjectAt(I, 'DIAGRAM') as PDiagramView;
    if Dgm <> nil then Dgm.RemoveOwnedView(V);
  end;
  ViewTable.SortByColumn('IDX', True);
  for I := 0 to ViewTable.RowCount - 1 do begin
    V := ViewTable.GetObjectAt(I, 'VIEW') as PView;
    Dgm := ViewTable.GetObjectAt(I, 'DIAGRAM') as PDiagramView;
    Idx := StrToInt(ViewTable.GetValueAt(I, 'IDX'));
    if (Dgm <> nil) and (Idx > -1) then
      Dgm.InsertOwnedView(Idx, V);
  end;
  ElementsCreated;
end;

// PReconnectEdgeCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PChangeModelReferenceWithNamedModelCreatingCommand

function PChangeModelReferenceWithNamedModelCreatingCommand.Precondition: Boolean;
begin
  Result := (ModelSet.Count = 1) and (ChangingModels.Count = 1);
end;

procedure PChangeModelReferenceWithNamedModelCreatingCommand.SetParameter(AModel: PModel;
  AKey: string; Owner: PModel; ModelKind: string; Name: string = '');
var
  M: PModel;
begin
  ChangingModels.Clear;
  ChangingViews.Clear;
  ModelSet.Clear;
  ViewSet.Clear;

  M := UMLFactory.CreateModel(Owner, ModelKind);
  if M <> nil then begin
    M.Name := Name;
    ModelSet.Add(M);
  end;

  Key := AKey;
  OldValue := AModel.MOF_GetReference(Key) as PModel;
  NewValue := M;
  ChangingModels.Add(AModel);

  SizePreservingViews.Clear;
  CollectSizesFromModelSet(ChangingModels);
  CollectSizesFromModel(Owner);
end;

procedure PChangeModelReferenceWithNamedModelCreatingCommand.Execute;
begin
  inherited;
  ChangingModels[0].MOF_SetReference(Key, NewValue);
  // fire model change event
  ModelsChanged;
end;

procedure PChangeModelReferenceWithNamedModelCreatingCommand.Reexecute;
begin
  inherited;
  ChangingModels[0].MOF_SetReference(Key, NewValue);
  // fire model change event
  ModelsChanged;
end;

procedure PChangeModelReferenceWithNamedModelCreatingCommand.Unexecute;
begin
  inherited;
  ChangingModels[0].MOF_SetReference(Key, OldValue);

  // Restore sizes of views
  RestoreViewSizes;
  // fire model change event
  ModelsChanged;
end;

// PChangeModelReferenceWithNamedModelCreatingCommand
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PResizeFragmentedNodeCommand

function PResizeFragmentedNodeCommand.GetLowestContainedNodeView(AContainerView: PView): PNodeView;
var
  V, LowestView: PNodeView;
  MaxBottom: Integer;
  I: Integer;
begin
  MaxBottom := Low(Integer);
  LowestView := nil;
  for I := 0 to AContainerView.ContainedViewCount - 1 do
    if AContainerView.ContainedViews[I] is PNodeView then begin
      V := AContainerView.ContainedViews[I] as PNodeView;
      if V.Bottom > MaxBottom then begin
        LowestView := V;
        MaxBottom := V.Bottom;
      end;
    end;
  Result := LowestView;
end;

function PResizeFragmentedNodeCommand.Precondition: Boolean;
begin
  Result := not EqualRect(OldRect, NewRect) and (Node is PUMLInteractionOperandView);
end;

procedure PResizeFragmentedNodeCommand.SetParameter(ANode: PNodeView; ARect: TRect);
var
  ContView: PView;
begin
  Node := ANode;
  ContView := Node.ContainerView;
  ResizeContainer := (ContView <> nil) and (Node = GetLowestContainedNodeView(ContView));
  ViewSet.Clear;
  ViewSet.Add(Node);
  if ResizeContainer then
    ViewSet.Add(Node.ContainerView);
  NewRect := ARect;
  OldRect.Left := Node.Left;
  OldRect.Top := Node.Top;
  OldRect.Right := Node.Right;
  OldRect.Bottom := Node.Bottom;
end;

procedure PResizeFragmentedNodeCommand.Reexecute;
begin
  Node.Left := NewRect.Left;
  Node.Top := NewRect.Top;
  Node.Right := NewRect.Right;
  Node.Bottom := NewRect.Bottom;
  if ResizeContainer then
    (Node.ContainerView as PNodeView).Bottom := NewRect.Bottom;
  // fire view change event
  ViewsChanged;
end;

procedure PResizeFragmentedNodeCommand.Unexecute;
begin
  Node.Left := OldRect.Left;
  Node.Top := OldRect.Top;
  Node.Right := OldRect.Right;
  Node.Bottom := OldRect.Bottom;
  if ResizeContainer then
    (Node.ContainerView as PNodeView).Bottom := OldRect.Bottom;
  // fire view change event
  ViewsChanged;
end;

// PResizeFragmentedNodeCommand
////////////////////////////////////////////////////////////////////////////////

end.
