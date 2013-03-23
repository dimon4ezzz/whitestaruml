unit PetalDoc;

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
  PetalElements, GmrNodes, PetalObjFacto, Utilities,
  Classes, Types, SysUtils, PGMR101Lib_TLB;

const
  NOT_EXISTS = 0;   // node not exists

  PETAL_GMR_FILE = 'RosePetal.gmr';

  NODE_DESIGN = 'design_part';
  NODE_HEADER = 'header_part';
  NODE_NAME = 'name';
  NODE_OBJECT = 'object';
  NODE_PETAL_DOC = 'petal_document';
  NODE_PROP = 'property';
  NODE_PROP_LIST = 'property_list';
  NODE_STRING = 'string';
  NODE_INTEGER = 'integer';
  NODE_TAG = 'tag';
  NODE_VALUE = 'value';
  NODE_MULTISTRING = 'multistring';
  NODE_LOCATION = 'location';
  NODE_TUPLE = 'tuple';
  NODE_STRING_LITERAL = 'string_literal';
  NODE_FLOAT = 'float';
  NODE_BOOLEAN = 'boolean';
  NODE_NODE = 'node';
  NODE_LITERAL = 'literal';
  NODE_LIST = 'list';

  PATH_OBJ_TAG_VALUE = 'tag.integer';
  PATH_PROPERTY = 'property_list.property';
  PATH_LIST = 'node.list';
  PATH_INTEGER_VALUE = 'node.literal.integer';
  PATH_REAL_VALUE = 'node.literal.float';
  PATH_STRING_VALUE = 'node.literal.string_literal.string';
  PATH_MULTISTRING_VALUE = 'node.literal.string_literal.multistring';
  PATH_BOOLEAN_VALUE = 'node.literal.boolean';
  PATH_VALUE_STRING_VALUE = 'node.literal.value.string_literal.string';
  PATH_VALUE_MULTISTRING_VALUE = 'node.literal.value.string_literal.multistring';
  PATH_LOCATION_VALUE = 'node.literal.location';
  PATH_TAG_VALUE = 'node.literal.tag.integer';
  PATH_TUPLE_VALUE = 'node.literal.tuple';
  PATH_OBJECT_VALUE = 'node.object';
  PATH_OBJECT_VALUE_IN_LIST = 'node.list.node_list.node.object';
  PATH_LOCATION_VALUE_IN_LIST = 'node.list.node_list.node.literal.location';
  PATH_TEXT_OF_MULTISTRING = 'text';

  OBJ_ACTION_TIME = 'ActionTime';
  OBJ_ACTIVITY_DIAGRAM = 'ActivityDiagram';
  OBJ_ACTIVITY_STATE = 'ActivityState';
  OBJ_ACTIVITY_STATE_VIEW = 'ActivityStateView';
  OBJ_ASSOC_ATTACH_VIEW = 'AssocAttachView';
  OBJ_ASSOCIATION = 'Association';
  OBJ_ASSOCIATION_VIEW_NEW = 'AssociationViewNew';
  OBJ_ATTACH_VIEW = 'AttachView';
  OBJ_ATTRIBUTE = 'Attribute';
  OBJ_CATEGORY_VIEW = 'CategoryView';
  OBJ_CLASS = 'Class';
  OBJ_CLASS_ATTRIBUTE = 'ClassAttribute';
  OBJ_CLASS_DIAGRAM = 'ClassDiagram';
  OBJ_CLASS_INSTANCE_VIEW = 'ClassInstanceView';
  OBJ_CLASS_VIEW = 'ClassView';
  OBJ_CLASS_CATEGORY = 'Class_Category';
  OBJ_CLASS_UTILITY = 'Class_Utility';
  OBJ_COMPARTMENT = 'Compartment';
  OBJ_CONNECTION_VIEW = 'ConnectionView';
  OBJ_CONNECTION_RELATIONSHIP = 'Connection_Relationship';
  OBJ_DATA_FLOW_VIEW = 'DataFlowView';
  OBJ_DECISION = 'Decision';
  OBJ_DECISION_VIEW = 'DecisionView';
  OBJ_DEPENDENCY_VIEW = 'DependencyView';
  OBJ_DEPENDENCY_RELATIONSHIP = 'Dependency_Relationship';
  OBJ_DESIGN = 'Design';
  OBJ_DESTRUCTION_MARKER = 'Destruction_Marker';
  OBJ_DEVICE = 'Device';
  OBJ_DEVICE_VIEW = 'DeviceView';
  OBJ_EVENT = 'Event';
  OBJ_FOCUS_OF_CONTROL = 'Focus_Of_Control';
  OBJ_FONT = 'Font';
  OBJ_IMPORT_VIEW = 'ImportView';
  OBJ_INHERIT_TREE_VIEW = 'InheritTreeView';
  OBJ_INHERIT_VIEW = 'InheritView';
  OBJ_INHERITANCE_RELATIONSHIP = 'Inheritance_Relationship';
  OBJ_INSTANTIATED_CLASS = 'Instantiated_Class';
  OBJ_INSTANTIATED_CLASS_UTILITY = 'Instantiated_Class_Utility';
  OBJ_INTER_MESS_VIEW = 'InterMessView';
  OBJ_INTER_OBJ_VIEW = 'InterObjView';
  OBJ_INTERACTION_DIAGRAM = 'InteractionDiagram';
  OBJ_INTERFACE_VIEW = 'InterfaceView';
  OBJ_ITEM_LABEL = 'ItemLabel';
  OBJ_LABEL = 'Label';
  OBJ_LINK = 'Link';
  OBJ_LINK_SELF_VIEW = 'LinkSelfView';
  OBJ_LINK_VIEW = 'LinkView';
  OBJ_MECHANISM = 'Mechanism';
  OBJ_MESS_VIEW = 'MessView';
  OBJ_MESSAGE = 'Message';
  OBJ_METACLASS = 'Metaclass';
  OBJ_MOD_VIEW = 'ModView';
  OBJ_MOD_VIS_VIEW = 'ModVisView';
  OBJ_MODULE_DIAGRAM = 'Module_Diagram';
  OBJ_MODULE_VISIBILITY_RELATIONSHIP = 'Module_Visibility_Relationship';
  OBJ_NOTE_VIEW = 'NoteView';
  OBJ_OBJECT = 'Object';
  OBJ_OBJECT_DIAGRAM = 'ObjectDiagram';
  OBJ_OBJECT_VIEW = 'ObjectView';
  OBJ_OPERATION = 'Operation';
  OBJ_PARAMETER = 'Parameter';
  OBJ_PARAMETERIZED_CLASS = 'Parameterized_Class';
  OBJ_PARAMETERIZED_CLASS_UTILITY = 'Parameterized_Class_Utility';
  OBJ_PARTITION = 'Partition';
  OBJ_PETAL = 'Petal';
  OBJ_PROCESS = 'Process';
  OBJ_PROCESS_DIAGRAM = 'Process_Diagram';
  OBJ_PROCESSES = 'Processes';
  OBJ_PROCESSOR = 'Processor';
  OBJ_PROCESSOR_VIEW = 'ProcessorView';
  OBJ_PROPERTIES = 'Properties';
  OBJ_REALIZE_VIEW = 'RealizeView';
  OBJ_REALIZE_RELATIONSHIP = 'Realize_Relationship';
  OBJ_ROLE = 'Role';
  OBJ_ROLE_VIEW = 'RoleView';
  OBJ_SEG_LABEL = 'SegLabel';
  OBJ_SELF_MESS_VIEW = 'SelfMessView';
  OBJ_SELF_TRANS_VIEW = 'SelfTransView';
  OBJ_SEMANTIC_INFO = 'Semantic_Info';
  OBJ_STATE = 'State';
  OBJ_STATE_VIEW = 'StateView';
  OBJ_STATE_DIAGRAM = 'State_Diagram';
  OBJ_STATE_MACHINE = 'State_Machine';
  OBJ_STATE_TRANSITION = 'State_Transition';
  OBJ_SUBSYS_VIEW = 'SubSysView';
  OBJ_SUBSYSTEM = 'SubSystem';
  OBJ_SWIMLANE = 'Swimlane';
  OBJ_SYNCHRONIZATION_STATE = 'SynchronizationState';
  OBJ_SYNCHRONIZATION_VIEW = 'SynchronizationView';
  OBJ_TIER_VIEW = 'TierView';
  OBJ_TIER_DIAGRAM = 'Tier_Diagram';
  OBJ_TRANS_VIEW = 'TransView';
  OBJ_USE_CASE = 'UseCase';
  OBJ_USE_CASE_DIAGRAM = 'UseCaseDiagram';
  OBJ_USE_CASE_VIEW = 'UseCaseView';
  OBJ_USES_VIEW = 'UsesView';
  OBJ_USES_RELATIONSHIP = 'Uses_Relationship';
  OBJ_VISIBILITY_RELATIONSHIP = 'Visibility_Relationship';
  OBJ_ACTION = 'action';
  OBJ_DEFAULTS = 'defaults';
  OBJ_EXTERNAL_DOC = 'external_doc';
  OBJ_MODULE = 'module';
  OBJ_SEND_EVENT = 'sendEvent';

  // property name constants
  PROP_ABSTRACT = 'abstract';
  PROP_ACTION = 'action';
  PROP_ACTIONS = 'actions';
  PROP_ACTION_TIME = 'ActionTime';
  PROP_ANCHOR = 'anchor';
  PROP_ANCHOR_LOC = 'anchor_loc';
  PROP_ANNOTATION = 'annotation';
  PROP_ASSOCIATION = 'Association';
  PROP_ASSOCIATIONCLASS = 'AssociationClass';
  PROP_ATTRIBUTES = 'attributes';
  PROP_AUTO_RESIZE = 'autoResize';
  PROP_BOLD = 'bold';
  PROP_BOTTOM_MARGIN = 'bottomMargin';
  PROP_CARDINALITY = 'cardinality';
  PROP_CHARSET = 'charSet';
  PROP_CHARACTERISTICS = 'characteristics';
  PROP_CLASS = 'class';
  PROP_CLASS_ATTRIBUTES = 'class_attributes';
  PROP_CLIENT = 'client';
  PROP_CLIENT_CARDINALITY = 'client_cardinality';
  PROP_CLIENT_CONTAINMENT = 'client_containment';
  PROP_CLIENT_VISIBILITY = 'client_visibility';
  PROP_CLIP_ICON_LABELS = 'clipIconLabels';
  PROP_COLLABORATORS = 'collaborators';
  PROP_COLOR = 'color';
  PROP_COMPARTMENT = 'compartment';
  PROP_COMPARTMENT_ITEMS = 'compartmentItems';
  PROP_CONCURRENCY = 'concurrency';
  PROP_CONDITION = 'condition';
  PROP_CONNECTIONS = 'connections';
  PROP_CONSTRAINTS = 'Constraints';
  PROP_CONTAINMENT = 'Containment';
  PROP_CREATION = 'creation';
  PROP_CREATION_OBJ = 'creationObj';
  PROP_DATA_FLOW_VIEW = 'DataFlowView';
  PROP_DRAW_SUPPLIER = 'drawSupplier';
  PROP_DECLARATIONS = 'declarations';
  PROP_DEFAULT_COLOR = 'default_color';
  PROP_DEFAULT_FONT = 'defaultFont';
  PROP_DEFAULTS = 'defaults';
  PROP_DERIVED = 'derived';
  PROP_DIAGRAM_REF = 'diagram_ref';
  PROP_DIR = 'dir';
  PROP_DOCUMENTATION = 'documentation';
  PROP_EXTERNAL_DOCS = 'external_docs';
  PROP_EVENT = 'Event';
  PROP_EXCEPTIONS = 'exceptions';
  PROP_EXPORT_CONTROL = 'exportControl';
  PROP_EXTERNAL_DOC_PATH = 'external_doc_path';
  PROP_EXTERNAL_DOC_URL = 'external_doc_url';
  PROP_FACE = 'face';
  PROP_FILL_COLOR = 'fill_color';
  PROP_FOCUS_ENTRY = 'Focus_Entry';
  PROP_FOCUS_OF_CONTROL = 'Focus_Of_Control';
  PROP_FOCUS_SRC = 'Focus_Src';
  PROP_FONT = 'font';
  PROP_FREQUENCY = 'frequency';
  PROP_FRIEND = 'friend';
  PROP_GLOBAL = 'global';
  PROP_GRID_X = 'gridX';
  PROP_GRID_Y = 'gridY';
  PROP_HIDDEN = 'hidden';
  PROP_HEIGHT = 'height';
  PROP_ICON = 'icon';
  PROP_ICON_HEIGHT = 'icon_height';
  PROP_ICON_STYLE = 'icon_style';
  PROP_ICON_WIDTH = 'icon_width';
  PROP_ICON_Y_OFFSET = 'icon_y_offset';
  PROP_INCLUDE_ATTRIBUTE = 'IncludeAttribute';
  PROP_INCLUDE_OPERATION = 'IncludeOperation';
  PROP_INITV = 'initv';
  PROP_INTER_OBJ_VIEW = 'InterObjView';
  PROP_IS_AGGREGATE = 'is_aggregate';
  PROP_IS_LOADED = 'is_loaded';
  PROP_IS_NAVIGABLE = 'is_navigable';
  PROP_IS_PRICIPAL = 'is_principal';
  PROP_IS_UNIT = 'is_unit';
  PROP_ITALICS = 'italics';
  PROP_ITEMS = 'items';
  PROP_JUSTIFY = 'justify';
  PROP_KEYS = 'keys';
  PROP_LABEL = 'label';   // is object type
  PROP_LABEL2 = 'label';   // is string type
  PROP_LANGUAGE = 'language';
  PROP_LEFT_MARGIN = 'leftMargin';
  PROP_LINE_COLOR = 'line_color';
  PROP_LINE_STYLE = 'line_style';
  PROP_LOCATION = 'location';
  PROP_LOGICAL_MODELS = 'logical_models';
  PROP_LOGICAL_PRESENTATIONS = 'logical_presentations';
  PROP_MAX_HEIGHT = 'max_height';
  PROP_MAX_WIDTH = 'max_width';
  PROP_MECHANISM_REF = 'mechanism_ref';
  PROP_MESSAGES = 'messages';
  PROP_MODULE = 'module';
  PROP_MULTI = 'multi';
  PROP_NAME = 'name';
  PROP_NESTED = 'Nested';
  PROP_NESTED_CLASSES = 'nestedClasses';
  PROP_NLINES = 'nlines';
  PROP_NOTATION = 'notation';
  PROP_OBJECT_ARC = 'object_arc';
  PROP_OBJECTS = 'objects';
  PROP_OPERATION = 'Operation';
  PROP_OPERATIONS = 'operations';
  PROP_OP_EXPORT_CONTROL = 'opExportControl';
  PROP_ORDINAL = 'ordinal';
  PROP_ORIENTATION = 'orientation';
  PROP_ORIGIN = 'origin';
  PROP_ORIGIN_X = 'origin_x';
  PROP_ORIGIN_Y = 'origin_y';
  PROP_ORIGIN_ATTACHMENT = 'origin_attachment';
  PROP_PAGE_OVERLAP = 'pageOverlap';
  PROP_PARENT_VIEW = 'Parent_View';
  PROP_RANK = 'rank';
  PROP_PARAM = 'param';
  PROP_PARAMETERS = 'parameters';   // is list of object
  PROP_PARAMETERS2 = 'parameters';   // is string type
  PROP_PARTITIONS = 'partitions';
  PROP_PCT_DIST = 'pctDist';
  PROP_PDL = 'PDL';
  PROP_PERSISTENCE = 'persistence';
  PROP_PHYSICAL_MODELS = 'physical_models';
  PROP_PHYSICAL_PRESENTATIONS = 'physical_presentations';
  PROP_POST_CONDITION = 'post_condition';
  PROP_PRE_CONDITION = 'pre_condition';
  PROP_PRIORITY = 'priority';
  PROP_PROCESS_STRUCTURE = 'process_structure';
  PROP_PROCESSES = 'processes';
  PROP_PROCS_N_DEVS = 'ProcsNDevs';
  PROP_PROPERTIES = 'properties';
  PROP_PROTOCOL = 'protocol';
  PROP_QUID = 'quid';
  PROP_QUIDU = 'quidu';
  PROP_REALIZED_INTERFACES = 'realized_interfaces';
  PROP_RESULT = 'result';
  PROP_RIGHT_MARGIN = 'rightMargin';
  PROP_ROLES = 'roles';
  PROP_ROLEVIEW_LIST = 'roleview_list';
  PROP_ROOT_CATEGORY = 'root_category';
  PROP_ROOT_SUBSYSTEM = 'root_subsystem';
  PROP_ROOT_USECASE_PACKAGE = 'root_usecase_package';
  PROP_SCHEDULING = 'scheduling';
  PROP_SEMANTICS = 'semantics';
  PROP_SEND_EVENT = 'sendEvent';
  PROP_SEQUENCE = 'sequence';
  PROP_SHOW_CLASS_OF_OBJECT = 'showClassOfObject';
  PROP_SHOW_COMPARTMENT_STEREOTYPES = 'ShowCompartmentStereotypes';
  PROP_SHOW_MESSAGE_NUM = 'showMessageNum';
  PROP_SHOW_OPERATION_SIGNATURE = 'ShowOperationSignature';
  PROP_SIZE = 'size';
  PROP_SNAP_TO_GRID = 'snapToGrid';
  PROP_SPACE = 'space';
  PROP_STATES = 'states';
  PROP_STATE_DIAGRAMS = 'statediagrams';
  PROP_STATE_MACHINE = 'statemachine';
  PROP_STATIC = 'static';
  PROP_STEREOTYPE1 = 'stereotype';  // is string type
  PROP_STEREOTYPE2 = 'stereotype';  // is object type
  PROP_STEREOTYPE3 = 'stereotype';  // is boolean type
  PROP_STRIKE = 'strike';
  PROP_SUBOBJECTS = 'subobjects';
  PROP_SUBSYSTEM = 'subsystem';
  PROP_SUPER_CLASSES = 'superclasses';
  PROP_SUPPLIER = 'supplier';
  PROP_SUPPLIER_CARDINALITY = 'supplier_cardinality';
  PROP_SUPPLIER_CONTAINMENT = 'supplier_containment';
  PROP_SUPPLIER_VISIBILITY = 'supplier_visibility';
  PROP_SUPPLIER_IS_DEVICE = 'supplier_is_device';
  PROP_SUPPLIER_IS_SPEC = 'supplier_is_spec';
  PROP_SUPPLIER_IS_SUBSYSTEM = 'supplier_is_subsystem';
  PROP_SUPPRESS_ATTRIBUTE = 'SuppressAttribute';
  PROP_SUPPRESS_OPERATION = 'SuppressOperation';
  PROP_SYNCHRONIZATION = 'synchronization';
  PROP_SYNC_FLOW_DIRECTION = 'sync_flow_direction';
  PROP_SYNC_IS_HORIZONTAL = 'sync_is_horizontal';
  PROP_TARGET = 'target';
  PROP_TERMINAL_ATTACHMENT = 'terminal_attachment';
  PROP_TERMINUS = 'terminus';
  PROP_TIME_COMPLEXITY = 'time_complexity';
  PROP_TITLE = 'title';
  PROP_TOOL = 'tool';
  PROP_TOP_MARGIN = 'topMargin';
  PROP_TRANSITIONS = 'transitions';
  PROP_TYPE = 'type';   // is type
  PROP_TYPE2 = 'type';   // is state type kind
  PROP_UID = 'uid';
  PROP_UNDERLINE = 'underline';
  PROP_USED_NODES = 'used_nodes';
  PROP_VALUE = 'value';
  PROP_VERSION = 'version';
  PROP_VERTICES = 'vertices';
  PROP_VIRTUAL = 'virtual';
  PROP_VISIBLE_CATEGORIES = 'visible_categories';
  PROP_VISIBLE_MODULES = 'visible_modules';
  PROP_WHEN = 'when';
  PROP_WIDTH = 'width';
  PROP_WRITTEN = '_written';
  PROP_X_OFFSET = 'x_offset';   // is real type
  PROP_X_OFFSET2 = 'x_offset';  // is boolean type
  PROP_Y_COORD = 'y_coord';
  PROP_Y_OFFSET = 'y_offset';
  PROP_ZOOM = 'zoom';

  VALUE_PERSISTENT = 'Persisitent';

  TYPE_INTEGER = 'Integer';
  TYPE_REAL = 'Real';
  TYPE_STRING = 'String';
  TYPE_BOOLEAN = 'Boolean';
  TYPE_LOCATION = 'Location';          
  TYPE_VALUE = 'Value';
  TYPE_OBJECT = 'Object';
  TYPE_TAG = 'Tag';
  TYPE_LIST = 'List';

type
  // exceptions
  ENodeNotFound = class(Exception);
  EInvalidPropertyStruct = class(Exception);
  EInvalidPropertyType = class(Exception);
  EPropertyNotFound = class(Exception);
  EInvalidReference = class(Exception);
  EUnknownObject = class(Exception);
  EStackIsEmpty = class(Exception);

  // RPropertyTypeKind
  RPropertyTypeKind = (tkDefault, tkString, tkInteger, tkReal, tkBoolean, tkObject,
    tkList, tkTuple, tkTag, tkLocation, tkValue);

  NASTNodeClass = class of NASTNode;

  // Events
  RProgressEvent = procedure(Sender: TObject; Pos, Max: Integer; Msg: string) of object;
  RLogEvent = procedure(Sender: TObject; Msg: string) of object;

  // RPetalASTStack
  RPetalASTStack = class
  private
    List: TList;
    function GetCount: Integer;
    function GetTop: NASTNode;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Flush;
    function IsEmpty: Boolean;
    procedure Push(Node: NASTNode);
    function Pop: NASTNode;
    property Count: Integer read GetCount;
    property Top: NASTNode read GetTop;
  end;

  // RPetalASTBuilder
  RPetalASTBuilder = class
  private
    Pgmr: TPgmr;
    Stack: RPetalASTStack;
    FHeaderNode: NHeader;
    FDesignNode: NDesign;
    FObjectNodeCount: Integer;
    FOnLog: RLogEvent;
    FOnProgress: RProgressEvent;
    function FindChildNode(BaseNode: Integer; NodeName: string): Integer;
    procedure BuildHeader(Node: Integer);
    procedure BuildDesign(Node: Integer);
    procedure BuildObject(Node: Integer);
    procedure BuildProperty(Node: Integer);
    procedure BuildNode(Node: Integer);
    procedure BuildList(Node: Integer);
    procedure BuildLiteral(Node: Integer);
    procedure Log(Msg: string);
  public
    constructor Create(APgmr: TPgmr);
    destructor Destroy; override;
    procedure Clear;
    function BuildAST(FileName: string): Boolean;
    property HeaderNode: NHeader read FHeaderNode;
    property DesignNode: NDesign read FDesignNode;
    property ObjectNodeCount: Integer read FObjectNodeCount;
    property OnProgress: RProgressEvent read FOnProgress write FOnProgress;
    property OnLog: RLogEvent read FOnLog write FOnLog;
  end;

  // RPetalDocument
  RPetalDocument = class
  private
    { Member Fields }
    Pgmr: TPgmr;
    ObjFactory: RPetalObjectFactory;
    FPetal: RPetal;
    FDesign: RDesign;
    FOnProgress: RProgressEvent;
    FOnLog: RLogEvent;
    { Private Methods }
    procedure Clear;
    procedure SetPetal(APetal: RPetal);
    procedure SetDesign(ADesign: RDesign);
    procedure HandleProgress(Sender: TObject; Pos, Max: Integer; Msg: string);
    procedure HandleLog(Sender: TObject; Msg: string);
  public
    { Constructor/Destructor }
    constructor Create;
    destructor Destroy; override;
    { Public Methods }
    procedure ReadFromFile(FN: string);
		{ Properties }
    property Petal: RPetal read FPetal write SetPetal;
    property Design: RDesign read FDesign write SetDesign;
    property OnProgress: RProgressEvent read FOnProgress write FOnProgress;
    property OnLog: RLogEvent read FOnLog write FOnLog;
  end;

  // RPetalReader
  RPetalReader = class
  private
    Document: RPetalDocument;
    Factory: RPetalObjectFactory;
    Pgmr: TPgmr;
    ASTBuilder: RPetalASTBuilder;
    IdentifierList: TList;
    ViewList: TList;
    MechanismList: TList;
    FOnProgress: RProgressEvent;
    FOnLog: RLogEvent;

    { Global Variables }
    ObjectNodeCount: Integer;
    CurObjNodeIdx: Integer;

    { Property Node Related Functions }
    function ExistsProperty(ObjNode: NObject; PropName: string; PropClass: NASTNodeClass): Boolean;
    function GetPropertyNode(ObjNode: NObject; PropName: string; PropClass: NASTNodeClass): NProperty;
    function GetPropChildClass(PropNode: NProperty): NASTNodeClass;
    function GetIntegerPropValue(ObjNode: NObject; PropName: string): Integer;
    function GetRealPropValue(ObjNode: NObject; PropName: string): Real;
    function GetBooleanPropValue(ObjNode: NObject; PropName: string): Boolean;
    function GetStringPropValue(ObjNode: NObject; PropName: string): string;
    function GetValuePropValue(ObjNode: NObject; PropName: string): string;
    function GetLocationPropValue(ObjNode: NObject; PropName: string): TPoint;
    function GetObjectPropValue(ObjNode: NObject; PropName: string): NObject;
    function GetListPropValue(ObjNode: NObject; PropName: string): NList;
    function GetStringValue(ObjNode: NObject; Prop: NProperty): string;
    function GetTagValue(ObjNode: NObject; Prop: NProperty): Integer;

    { Searching Functions }
    function FindIdentifier(Base: RPetalObject; Name: string): RPetalIdentifier;
    function FindIdentifierWithPathName(Base: RPetalObject; Path: string): RPetalIdentifier;
    function FindIdentifierWithQuid(Base: RPetalObject; Quid: string): RPetalIdentifier;
    function FindIdentifierWithTag(Base: RPetalObject; Tag: Integer): RPetalIdentifier;
    function GetReferencePropValue(APetalObj: RPetalObject; ObjNode: NObject; PropName: string): RPetalObject;
    function GetIdReferencePropValue(APetalObj: RPetalObject; ObjNode: NObject; PropName: string): RPetalObject; overload;
    function GetIdReferencePropValue(APetalObj: RPetalObject; ObjNode: NObject; PropName: string; IdPropName: string): RPetalObject; overload;
    function GetAdjacentIdReferencePropValue(APetalObj: RPetalObject; ObjNode: NObject; PropName: string; IdPropName: string): RPetalObject;
    function GetTagReferencePropValue(APetalObj: RPetalObject; ObjNode: NObject; PropName: string): RPetalObject;

    { Etc }
    procedure Progress(Pos, Max: Integer; Msg: string);
    procedure Log(Msg: string);
    procedure ReferenceNotFound(ObjName: string; PropName: string);
    procedure HandleLog(Sender: TObject; Msg: string);
    procedure HandleProgress(Sender: TObject; Pos, Max: Integer; Msg: string);

    { 1st step - Construct Models }
    function GetPetalObjectClass(PetalObjName: string): RPetalObjectClass;
    procedure ConstructDocument;
    procedure ComposeElement(ObjNode: NObject; APetalObj: RPetalObject);

    procedure ComposeAction(ObjNode: NObject; AAction: RAction);
    procedure ComposeActionTime(ObjNode: NObject; AActionTime: RActionTime);
    procedure ComposeActivityState(ObjNode: NObject; AActivityState: RActivityState);
    procedure ComposeActivityStateView(ObjNode: NObject; AActivityStateView: RActivityStateView);
    procedure ComposeAssociation(ObjNode: NObject; AAssociation: RAssociation);
    procedure ComposeAssociationViewNew(ObjNode: NObject; AAssociationViewNew: RAssociationViewNew);
    procedure ComposeClass(ObjNode: NObject; AClass: RClass);
    procedure ComposeClassCategory(ObjNode: NObject; AClassCategory: RClass_Category);
    procedure ComposeClassView(ObjNode: NObject; AClassView: RClassView);
    procedure ComposeCompartment(ObjNode: NObject; ACompartment: RCompartment);
    procedure ComposeDefaults(ObjNode: NObject; ADefaults: RDefaults);
    procedure ComposeDesign(ObjNode: NObject; ADesign: RDesign);
    procedure ComposeInterObjView(ObjNode: NObject; AInterObjView: RInterObjView);
    procedure ComposeLink(ObjNode: NObject; ALink: RLink);
    procedure ComposeMechanism(ObjNode: NObject; AMechanism: RMechanism);
    procedure ComposeModule(ObjNode: NObject; AModule: RModule);
    procedure ComposeObject(ObjNode: NObject; AObject: RObject);
    procedure ComposeObjectView(ObjNode: NObject; AObjectView: RObjectView);
    procedure ComposeOperation(ObjNode: NObject; AOperation: ROperation);
    procedure ComposeParameterizedClass(ObjNode: NObject; AParameterizedClass: RParameterized_Class);
    procedure ComposePetalDeploymentNode(ObjNode: NObject; APetalDeploymentNode: RPetalDeploymentNode);
    procedure ComposePetalDiagram(ObjNode: NObject; APetalDiagram: RPetalDiagram);
    procedure ComposePetalIdentifier(ObjNode: NObject; APetalIdentifier: RPetalIdentifier);
    procedure ComposePetalModel(ObjNode: NObject; APetalModel: RPetalModel);
    procedure ComposePetalStateVertex(ObjNode: NObject; AStateVertex: RPetalStateVertex);
    procedure ComposePetalView(ObjNode: NObject; APetalView: RPetalView);
    procedure ComposeProcesses(ObjNode: NObject; AProcesses: RProcesses);
    procedure ComposeProcessor(ObjNode: NObject; AProcessor: RProcessor);
    procedure ComposeProperties(ObjNode: NObject; AProperties: RProperties);
    procedure ComposeRole(ObjNode: NObject; ARole: RRole);
    procedure ComposeSendEvent(ObjNode: NObject; ASendEvent: RSendEvent);
    procedure ComposeState(ObjNode: NObject; AState: RState);
    procedure ComposeStateMachine(ObjNode: NObject; AStateMachine: RState_Machine);
    procedure ComposeStateTansition(ObjNode: NObject; AStateTransition: RState_Transition);
    procedure ComposeStateView(ObjNode: NObject; AStateView: RStateView);
    procedure ComposeSubSystem(ObjNode: NObject; ASubSystem: RSubSystem);
    procedure ComposeUseCase(ObjNode: NObject; AUseCase: RUseCase);

    { 2nd step - Set properties }
    procedure SetProperties;
    procedure SetProperty(APetalObject: RPetalObject);
    procedure SetPropertyElement(ObjNode: NObject;APetalObject: RPetalObject);

    procedure SetPropertyPetalIdentifier(ObjNode: NObject;APetalIdentifier: RPetalIdentifier);
    procedure SetPropertyPetalModel(ObjNode: NObject;APetalModel: RPetalModel);
    procedure SetPropertyPetalView(ObjNode: NObject;APetalView: RPetalView);
    procedure SetPropertyPetalRelationship(ObjNode: NObject;APetalRelationship: RPetalRelationship);
    procedure SetPropertyPetalDiagram(ObjNode: NObject;APetalDiagram: RPetalDiagram);
    procedure SetPropertyPetalNodeView(ObjNode: NObject;APetalNodeView: RPetalNodeView);
    procedure SetPropertyPetalEdgeView(ObjNode: NObject;APetalEdgeView: RPetalEdgeView);
    procedure SetPropertyPetalLabelView(ObjNode: NObject;APetalLabelView: RPetalLabelView);
    procedure SetPropertyPetalStateVertex(ObjNode: NObject;APetalStateVertex: RPetalStateVertex);
    procedure SetPropertyPetalDeploymentNode(ObjNode: NObject;APetalDeploymentNode: RPetalDeploymentNode);
    procedure SetPropertyAbstractStateDiagaram(ObjNode: NObject;AAbstractStateDiagaram: RAbstractStateDiagaram);
    procedure SetPropertyAction(ObjNode: NObject;AAction: RAction);
    procedure SetPropertyActionTime(ObjNode: NObject;AActionTime: RActionTime);
    procedure SetPropertyActivityDiagram(ObjNode: NObject;AActivityDiagram: RActivityDiagram);
    procedure SetPropertyActivityState(ObjNode: NObject;AActivityState: RActivityState);
    procedure SetPropertyActivityStateView(ObjNode: NObject;AActivityStateView: RActivityStateView);
    procedure SetPropertyAssocAttachView(ObjNode: NObject;AAssocAttachView: RAssocAttachView);
    procedure SetPropertyAssociation(ObjNode: NObject;AAssociation: RAssociation);
    procedure SetPropertyAssociationViewNew(ObjNode: NObject;AAssociationViewNew: RAssociationViewNew);
    procedure SetPropertyAttachView(ObjNode: NObject;AAttachView: RAttachView);
    procedure SetPropertyAttribute(ObjNode: NObject;AAttribute: RAttribute);
    procedure SetPropertyCategoryView(ObjNode: NObject;ACategoryView: RCategoryView);
    procedure SetPropertyClass(ObjNode: NObject;AClass: RClass);
    procedure SetPropertyClass_Category(ObjNode: NObject;AClass_Category: RClass_Category);
    procedure SetPropertyClass_Utility(ObjNode: NObject;AClass_Utility: RClass_Utility);
    procedure SetPropertyClassAttribute(ObjNode: NObject;AClassAttribute: RClassAttribute);
    procedure SetPropertyClassDiagram(ObjNode: NObject;AClassDiagram: RClassDiagram);
    procedure SetPropertyClassInstanceView(ObjNode: NObject;AClassInstanceView: RClassInstanceView);
    procedure SetPropertyClassView(ObjNode: NObject;AClassView: RClassView);
    procedure SetPropertyCompartment(ObjNode: NObject;ACompartment: RCompartment);
    procedure SetPropertyConnection_Relationship(ObjNode: NObject;AConnection_Relationship: RConnection_Relationship);
    procedure SetPropertyConnectionView(ObjNode: NObject;AConnectionView: RConnectionView);
    procedure SetPropertyDataFlowView(ObjNode: NObject;ADataFlowView: RDataFlowView);
    procedure SetPropertyDecision(ObjNode: NObject;ADecision: RDecision);
    procedure SetPropertyDecisionView(ObjNode: NObject;ADecisionView: RDecisionView);
    procedure SetPropertyDefaults(ObjNode: NObject;ADefaults: RDefaults);
    procedure SetPropertyDependency_Relationship(ObjNode: NObject;ADependency_Relationship: RDependency_Relationship);
    procedure SetPropertyDependencyView(ObjNode: NObject;ADependencyView: RDependencyView);
    procedure SetPropertyDesign(ObjNode: NObject;ADesign: RDesign);
    procedure SetPropertyDestruction_Marker(ObjNode: NObject;ADestruction_Marker: RDestruction_Marker);
    procedure SetPropertyDevice(ObjNode: NObject;ADevice: RDevice);
    procedure SetPropertyDeviceView(ObjNode: NObject;ADeviceView: RDeviceView);
    procedure SetPropertyEvent(ObjNode: NObject;AEvent: REvent);
    procedure SetPropertyExternal_doc(ObjNode: NObject;AExternal_doc: RExternal_doc);
    procedure SetPropertyFocus_Of_Control(ObjNode: NObject;AFocus_Of_Control: RFocus_Of_Control);
    procedure SetPropertyFont(ObjNode: NObject;AFont: RFont);
    procedure SetPropertyImportView(ObjNode: NObject;AImportView: RImportView);
    procedure SetPropertyInheritance_Relationship(ObjNode: NObject;AInheritance_Relationship: RInheritance_Relationship);
    procedure SetPropertyInheritTreeView(ObjNode: NObject;AInheritView: RInheritTreeView);
    procedure SetPropertyInheritView(ObjNode: NObject;AInheritView: RInheritView);
    procedure SetPropertyInstantiated_Class(ObjNode: NObject;AInstantiated_Class: RInstantiated_Class);
    procedure SetPropertyInstantiated_Class_Utility(ObjNode: NObject;AInstantiated_Class_Utility: RInstantiated_Class_Utility);
    procedure SetPropertyInteractionDiagram(ObjNode: NObject;AInteractionDiagram: RInteractionDiagram);
    procedure SetPropertyInterfaceView(ObjNode: NObject;AInterfaceView: RInterfaceView);
    procedure SetPropertyInterMessView(ObjNode: NObject;AInterMessView: RInterMessView);
    procedure SetPropertyInterObjView(ObjNode: NObject;AInterObjView: RInterObjView);
    procedure SetPropertyItemLabel(ObjNode: NObject;AItemLabel: RItemLabel);
    procedure SetPropertyLabel(ObjNode: NObject;ALabel: RLabel);
    procedure SetPropertyLink(ObjNode: NObject;ALink: RLink);
    procedure SetPropertyLinkSelfView(ObjNode: NObject;ALinkSelfView: RLinkSelfView);
    procedure SetPropertyLinkView(ObjNode: NObject;ALinkView: RLinkView);
    procedure SetPropertyMechanism(ObjNode: NObject;AMechanism: RMechanism);
    procedure SetPropertyMessage(ObjNode: NObject;AMessage: RMessage);
    procedure SetPropertyMessView(ObjNode: NObject;AMessView: RMessView);
    procedure SetPropertyMetaclass(ObjNode: NObject;AMetaclass: RMetaclass);
    procedure SetPropertyModule(ObjNode: NObject;AModule: RModule);
    procedure SetPropertyModule_Diagram(ObjNode: NObject;AModule_Diagram: RModule_Diagram);
    procedure SetPropertyModule_Visibility_Relationship(ObjNode: NObject;AModule_Visibility_Relationship: RModule_Visibility_Relationship);
    procedure SetPropertyModView(ObjNode: NObject;AModView: RModView);
    procedure SetPropertyModVisView(ObjNode: NObject;AModVisView: RModVisView);
    procedure SetPropertyNoteView(ObjNode: NObject;ANoteView: RNoteView);
    procedure SetPropertyObject(ObjNode: NObject;AObject: RObject);
    procedure SetPropertyObjectDiagram(ObjNode: NObject;AObjectDiagram: RObjectDiagram);
    procedure SetPropertyObjectView(ObjNode: NObject;AObjectView: RObjectView);
    procedure SetPropertyOperation(ObjNode: NObject;AOperation: ROperation);
    procedure SetPropertyParameter(ObjNode: NObject;AParameter: RParameter);
    procedure SetPropertyParameterized_Class(ObjNode: NObject;AParameterized_Class: RParameterized_Class);
    procedure SetPropertyParameterized_Class_Utility(ObjNode: NObject;AParameterized_Class_Utility: RParameterized_Class_Utility);
    procedure SetPropertyPartition(ObjNode: NObject;APartition: RPartition);
    procedure SetPropertyPetal(ObjNode: NObject;APetal: RPetal);
    procedure SetPropertyProcess(ObjNode: NObject;AProcess: RProcess);
    procedure SetPropertyProcess_Diagram(ObjNode: NObject;AProcess_Diagram: RProcess_Diagram);
    procedure SetPropertyProcesses(ObjNode: NObject;AProcesses: RProcesses);
    procedure SetPropertyProcessor(ObjNode: NObject;AProcessor: RProcessor);
    procedure SetPropertyProcessorView(ObjNode: NObject;AProcessorView: RProcessorView);
    procedure SetPropertyProperties(ObjNode: NObject;AProperties: RProperties);
    procedure SetPropertyRealize_Relationship(ObjNode: NObject;ARealize_Relationship: RRealize_Relationship);
    procedure SetPropertyRealizeView(ObjNode: NObject;ARealizeView: RRealizeView);
    procedure SetPropertyRole(ObjNode: NObject;ARole: RRole);
    procedure SetPropertyRoleView(ObjNode: NObject;ARoleView: RRoleView);
    procedure SetPropertySegLabel(ObjNode: NObject;ASegLabel: RSegLabel);
    procedure SetPropertySelfMessView(ObjNode: NObject;ASelfMessView: RSelfMessView);
    procedure SetPropertySelfTransView(ObjNode: NObject;ASelfTransView: RSelfTransView);
    procedure SetPropertySemantic_Info(ObjNode: NObject;ASemantic_Info: RSemantic_Info);
    procedure SetPropertySendEvent(ObjNode: NObject;ASendEvent: RSendEvent);
    procedure SetPropertyState(ObjNode: NObject;AState: RState);
    procedure SetPropertyState_Diagram(ObjNode: NObject;AState_Diagram: RState_Diagram);
    procedure SetPropertyState_Machine(ObjNode: NObject;AState_Machine: RState_Machine);
    procedure SetPropertyState_Transition(ObjNode: NObject;AState_Transition: RState_Transition);
    procedure SetPropertyStateView(ObjNode: NObject;AStateView: RStateView);
    procedure SetPropertySubSystem(ObjNode: NObject;ASubSystem: RSubSystem);
    procedure SetPropertySubSysView(ObjNode: NObject;ASubSysView: RSubSysView);
    procedure SetPropertySwimlane(ObjNode: NObject;ASwimlane: RSwimlane);
    procedure SetPropertySynchronizationState(ObjNode: NObject;ASynchronizationState: RSynchronizationState);
    procedure SetPropertySynchronizationView(ObjNode: NObject;ASynchronizationView: RSynchronizationView);
    procedure SetPropertyTier_Diagram(ObjNode: NObject;ATier_Diagram: RTier_Diagram);
    procedure SetPropertyTierView(ObjNode: NObject;ATierView: RTierView);
    procedure SetPropertyTransView(ObjNode: NObject;ATransView: RTransView);
    procedure SetPropertyUseCase(ObjNode: NObject;AUseCase: RUseCase);
    procedure SetPropertyUseCaseDiagram(ObjNode: NObject;AUseCaseDiagram: RUseCaseDiagram);
    procedure SetPropertyUseCaseView(ObjNode: NObject;AUseCaseView: RUseCaseView);
    procedure SetPropertyUses_Relationship(ObjNode: NObject;AUses_Relationship: RUses_Relationship);
    procedure SetPropertyUsesView(ObjNode: NObject;AUsesView: RUsesView);
    procedure SetPropertyVisibility_Relationship(ObjNode: NObject;AVisibility_Relationship: RVisibility_Relationship);
  public
    { Constructor/Destructor }
    constructor Create(ADocument: RPetalDocument);
    destructor Destroy; override;
    { Public Methods }
    function ReadFromFile(FN: string): Boolean;
    { Properties }
    property OnProgress: RProgressEvent read FOnProgress write FOnProgress;
    property OnLog: RLogEvent read FOnLog write FOnLog;
  end;

implementation

uses
  Forms, NLS_RoseAddIn;

////////////////////////////////////////////////////////////////////////////////
// RPetalASTStack

constructor RPetalASTStack.Create;
begin
  List := TList.Create;
end;

destructor RPetalASTStack.Destroy;
begin
  List.Free;
end;

function RPetalASTStack.GetCount: Integer;
begin
  Result := List.Count;
end;

function RPetalASTStack.GetTop: NASTNode;
var
  N: NASTNode;
begin
  if List.Count = 0 then
    raise EStackIsEmpty.Create(ERR_STACK_IS_EMPTY);
  N := List.Items[List.Count - 1];
  Result := N;
end;

procedure RPetalASTStack.Flush;
begin
  List.Clear;
end;

function RPetalASTStack.IsEmpty: Boolean;
begin
  Result := (List.Count = 0);
end;

procedure RPetalASTStack.Push(Node: NASTNode);
begin
  if Node <> nil then
    List.Add(Node);
end;

function RPetalASTStack.Pop: NASTNode;
var
  N: NASTNode;
begin
  if List.Count = 0 then
    raise EStackIsEmpty.Create(ERR_STACK_IS_EMPTY);
  N := List.Items[List.Count - 1];
  List.Remove(N);
  Result := N;
end;

// RPetalASTStack
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// RPetalASTBuilder

constructor RPetalASTBuilder.Create(APgmr: TPgmr);
begin
  Pgmr := APgmr;
  Stack := RPetalASTStack.Create;
  FHeaderNode := NHeader.Create;
  FDesignNode := NDesign.Create;
end;

destructor RPetalASTBuilder.Destroy;
begin
  Stack.Free;
  FHeaderNode.Free;
  FDesignNode.Free;
  inherited;
end;

function RPetalASTBuilder.FindChildNode(BaseNode: Integer; NodeName: string): Integer;
var
  N: Integer;
  I: Integer;
begin
  Result := NOT_EXISTS;
  for I := 0 to Pgmr.GetNumChildren(BaseNode) - 1 do begin
    N := Pgmr.GetChild(BaseNode, I);
    if Pgmr.GetSymbolName(Pgmr.GetNodeSymbolID(N)) = NodeName then begin
      Result := N;
      Exit;
    end;
  end;
end;

procedure RPetalASTBuilder.BuildHeader(Node: Integer);
var
  AN: NASTNode;
begin
  Assert(Stack.GetCount = 1);
  AN := Stack.Top;
  Assert((AN <> nil) and (AN is NObject));
  FHeaderNode.Object_ := AN as NObject;
  FHeaderNode.Level := Pgmr.GetNodeDepth(Node);
  Stack.Pop;
end;

procedure RPetalASTBuilder.BuildDesign(Node: Integer);
var
  AN: NASTNode;
begin
  Assert(Stack.GetCount = 1);
  AN := Stack.Top;
  Assert((AN <> nil) and (AN is NObject));
  FDesignNode.Object_ := AN as NObject;
  FDesignNode.Level := Pgmr.GetNodeDepth(Node);
  Stack.Pop;
end;

procedure RPetalASTBuilder.BuildObject(Node: Integer);
var
  Obj: NObject;
  AN: NASTNode;
  N, NT: Integer;
  Sym: string;
  I: Integer;
begin
  Obj := NObject.Create;
  Obj.Level := Pgmr.GetNodeDepth(Node);
  try
    // set attributes
    for I := 0 to Pgmr.GetNumChildren(Node) - 1 do begin
      N := Pgmr.GetChild(Node, I);
      Sym := Pgmr.GetSymbolName(Pgmr.GetNodeSymbolID(N));
      if Sym = NODE_NAME then
        Obj.Name := Pgmr.GetValue(N)
      else if Sym = NODE_STRING then
        Obj.Add_Param(Copy(Pgmr.GetValue(N), 2, Length(Pgmr.GetValue(N)) - 2))
      else if Sym = NODE_TAG then begin
        NT := FindChildNode(N, NODE_INTEGER);
        if NT <> NOT_EXISTS then
          Obj.Tag := StrToInt(Pgmr.GetValue(NT));
      end;
    end;

    // add properties
    if not Stack.IsEmpty then begin
      AN := Stack.GetTop;
      while (AN <> nil) and (AN is NProperty) and (AN.Level > Obj.Level) do begin
        Obj.Add_Property(AN as NProperty);
        //Obj.Insert_Property(0, AN as NProperty);
        Stack.Pop;
        if Stack.IsEmpty then AN := nil
        else AN := Stack.GetTop;
      end;
    end;
    Stack.Push(Obj);
  except
    Obj.Free;
  end;
end;

procedure RPetalASTBuilder.BuildProperty(Node: Integer);
var
  Prop: NProperty;
  AN: NASTNode;
  Sym: string;
  N: Integer;
  I: Integer;
begin
  Prop := NProperty.Create;
  Prop.Level := Pgmr.GetNodeDepth(Node);
  try
    // set attributes
    for I := 0 to Pgmr.GetNumChildren(Node) - 1 do begin
      N := Pgmr.GetChild(Node, I);
      Sym := Pgmr.GetSymbolName(Pgmr.GetNodeSymbolID(N));
      if Sym = NODE_NAME then
        Prop.Name := Pgmr.GetValue(N)
    end;

    // set node
    if not Stack.IsEmpty then begin
      AN := Stack.GetTop;
      Assert(AN is NNode);
      if AN is NNode then begin
        Prop.Node := AN as NNode;
        Stack.Pop;
      end;
    end;
    Stack.Push(Prop);
  except
    Prop.Free;
  end;
end;

procedure RPetalASTBuilder.BuildNode(Node: Integer);
var
  Nde: NNode;
  AN: NASTNode;
begin
  Nde := NNode.Create;
  Nde.Level := Pgmr.GetNodeDepth(Node);
  try
    if not Stack.IsEmpty then begin
      AN := Stack.GetTop;
      Assert(AN is NNodeChild);
      if AN is NNodeChild then begin
        Nde.Child := AN as NNodeChild;
        Stack.Pop;
      end;
    end;
    Stack.Push(Nde);
  except
    Nde.Free;
  end;
end;

procedure RPetalASTBuilder.BuildList(Node: Integer);
var
  Lst: NList;
  AN: NASTNode;
begin
  Lst := NList.Create;
  Lst.Level := Pgmr.GetNodeDepth(Node);
  try
    if not Stack.IsEmpty then begin
      AN := Stack.GetTop;
      while (AN <> nil) and (AN is NNode) and (AN.Level > Lst.Level) do begin
        //Lst.Add_Item(AN as NNode);
        Lst.Insert_Item(0, AN as NNode);
        Stack.Pop;
        if Stack.IsEmpty then AN := nil
        else AN := Stack.GetTop;
      end;
    end;
    Stack.Push(Lst);
  except
    Lst.Free;
  end;
end;

procedure RPetalASTBuilder.BuildLiteral(Node: Integer);
var
  Lit: NLiteral;
  Val: NValue;
  Loc: NLocation;
  Tup: NTuple;
  Tag: NTag;
  StrLit: NStringLiteral;
  Float: NFloat;
  Bool: NBoolean;
  Int: NInteger;
  Sym, SymC: string;
  N, NC, NC2: Integer;
  S: string;
  I: Integer;
begin
  Lit := NLiteral.Create;
  Lit.Level := Pgmr.GetNodeDepth(Node);
  try
    N := Pgmr.GetChild(Node, 0);
    Sym := Pgmr.GetSymbolName(Pgmr.GetNodeSymbolID(N));
    if Sym = NODE_VALUE then begin
      Val := NValue.Create;
      NC := Pgmr.GetChild(N, 1);
      SymC := Pgmr.GetSymbolName(Pgmr.GetNodeSymbolID(NC));
      if SymC = NODE_STRING then
        Val.Value := Copy(Pgmr.GetValue(NC), 2, Length(Pgmr.GetValue(NC)) - 2)
      else if SymC = NODE_MULTISTRING then begin
        S := '';
        for I := 0 to Pgmr.GetNumChildren(NC) - 1 do begin
          NC2 := Pgmr.GetChild(NC, I);
          if I > 0 then S := #10#13 + S;
          S := S + Pgmr.GetValue(NC2);
        end;
        Val.Value := S;
      end;
      Lit.Child := Val;
    end
    else if Sym = NODE_LOCATION then begin
      Loc := NLocation.Create;
      NC := Pgmr.GetChild(N, 0);
      Loc.X := StrToInt(Pgmr.GetValue(NC));
      NC := Pgmr.GetChild(N, 1);
      Loc.Y := StrToInt(Pgmr.GetValue(NC));
      Lit.Child := Loc;
    end
    else if Sym = NODE_TUPLE then begin
      Tup := NTuple.Create;
      NC := Pgmr.GetChild(N, 0);
      Tup.StrValue := Copy(Pgmr.GetValue(NC), 2, Length(Pgmr.GetValue(NC)) - 2);
      NC := Pgmr.GetChild(N, 1);
      Tup.IntValue := StrToInt(Pgmr.GetValue(NC));
      Lit.Child := Tup;
    end
    else if Sym = NODE_TAG then begin
      Tag := NTag.Create;
      NC := Pgmr.GetChild(N, 0);
      Tag.Value := StrToInt(Pgmr.GetValue(NC));
      Lit.Child := Tag;
    end
    else if Sym = NODE_STRING_LITERAL then begin
      StrLit := NStringLiteral.Create;
      NC := Pgmr.GetChild(N, 0);
      SymC := Pgmr.GetSymbolName(Pgmr.GetNodeSymbolID(NC));
      if SymC = NODE_STRING then
        StrLit.Value := Copy(Pgmr.GetValue(NC), 2, Length(Pgmr.GetValue(NC)) - 2)
      else if SymC = NODE_MULTISTRING then begin
        S := '';
        for I := 0 to Pgmr.GetNumChildren(NC) - 1 do begin
          NC2 := Pgmr.GetChild(NC, I);
          if I > 0 then S := S + #10#13;
          S := S + Pgmr.GetValue(NC2);
        end;
        StrLit.Value := S;
      end;
      Lit.Child := StrLit;
    end
    else if Sym = NODE_FLOAT then begin
      Float := NFloat.Create;
      Float.Value := StrToFloat(Pgmr.GetValue(N));
      Lit.Child := Float;
    end
    else if Sym = NODE_BOOLEAN then begin
      Bool := NBoolean.Create;
      Bool.Value := StrToBool(Pgmr.GetValue(N));
      Lit.Child := Bool;
    end
    else if Sym = NODE_INTEGER then begin
      Int := NInteger.Create;
      Int.Value := StrToInt(Pgmr.GetValue(N));
      Lit.Child := Int;
    end;
    Stack.Push(Lit);
  except
    Lit.Free;
  end;
end;

procedure RPetalASTBuilder.Log(Msg: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg);
end;

procedure RPetalASTBuilder.Clear;
begin
  FObjectNodeCount := 0;
  FHeaderNode.Object_.Free;
  FHeaderNode.Object_ := nil;
  FDesignNode.Object_.Free;
  FDesignNode.Object_ := nil;
end;

function RPetalASTBuilder.BuildAST(FileName: string): Boolean;
var
  NodeName: string;
  BPPush: Integer;
  TotalLen, CurPos: Integer;
begin
  Result := False;
  try
    Clear;
    Pgmr.SetInputFilename(FileName);
    Pgmr.RemoveAllBreakPoints;
    Pgmr.SetBreakpoint(pgEventParse, Pgmr.GetSymbolID(NODE_HEADER));
    Pgmr.SetBreakpoint(pgEventParse, Pgmr.GetSymbolID(NODE_DESIGN));
    Pgmr.SetBreakpoint(pgEventParse, Pgmr.GetSymbolID(NODE_OBJECT));
    Pgmr.SetBreakpoint(pgEventParse, Pgmr.GetSymbolID(NODE_PROP));
    Pgmr.SetBreakpoint(pgEventParse, Pgmr.GetSymbolID(NODE_NODE));
    Pgmr.SetBreakpoint(pgEventParse, Pgmr.GetSymbolID(NODE_LITERAL));
    Pgmr.SetBreakpoint(pgEventParse, Pgmr.GetSymbolID(NODE_LIST));
    BPPush := Pgmr.SetBreakpoint(pgEventPush, Pgmr.GetSymbolID(NODE_OBJECT));

    TotalLen := Pgmr.GetInputLength;
    while Pgmr.Parse = pgStatusBreak do begin
      if Pgmr.GetCurrBreakpointID = BPPush then begin
        CurPos := Pgmr.GetCurrInputPos;
        if (CurPos mod 100 = 0) or (CurPos = TotalLen) then
          if Assigned(FOnProgress) then
            FOnProgress(Self, CurPos, TotalLen, MSG_ON_PARSING);
      end
      else begin
        NodeName := Pgmr.GetSymbolName(Pgmr.GetCurrSymbolID);
        if NodeName = NODE_HEADER then
          BuildHeader(Pgmr.GetCurrNodeID)
        else if NodeName = NODE_DESIGN then
          BuildDesign(Pgmr.GetCurrNodeID)
        else if NodeName = NODE_OBJECT then begin
          BuildObject(Pgmr.GetCurrNodeID);
          Inc(FObjectNodeCount);
        end
        else if NodeName = NODE_PROP then
          BuildProperty(Pgmr.GetCurrNodeID)
        else if NodeName = NODE_NODE then
          BuildNode(Pgmr.GetCurrNodeID)
        else if NodeName = NODE_LIST then
          BuildList(Pgmr.GetCurrNodeID)
        else if NodeName = NODE_LITERAL then
          BuildLiteral(Pgmr.GetCurrNodeID);
      end;
    end;
    Result := (Pgmr.Status = pgStatusComplete) and (Pgmr.GetNumErrors = 0);
  except
    on E: Exception do begin
      Log(E.Message);
    end;
  end;
end;

// RPetalASTBuilder
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// RPetalReader

constructor RPetalReader.Create(ADocument: RPetalDocument);
begin
  Document := ADocument;
  Factory := RPetalObjectFactory.Create;
  Pgmr := TPgmr.Create(Application);
  Pgmr.SetGrammar(GetDllPath + '\' + PETAL_GMR_FILE);
  ASTBuilder := RPetalASTBuilder.Create(Pgmr);
  ASTBuilder.OnProgress := HandleProgress;
  ASTBuilder.OnLog := HandleLog;
  IdentifierList := TList.Create;
  ViewList := TList.Create;
  MechanismList := TList.Create;
end;

destructor RPetalReader.Destroy;
begin
  Factory.Free;
  Pgmr.Free;
  ASTBuilder.Free;
  IdentifierList.Free;
  ViewList.Free;
  MechanismList.Free;
  inherited;
end;

function RPetalReader.ReadFromFile(FN: string): Boolean;
begin
  Result := False;
  Document.Clear;
  IdentifierList.Clear;
  ViewList.Clear;
  try
    if ASTBuilder.BuildAST(FN) then begin
      ObjectNodeCount := ASTBuilder.ObjectNodeCount;
      CurObjNodeIdx := 0;
      ConstructDocument;
      CurObjNodeIdx := 0;
      SetProperties;
      Result := True;
    end;
  except
    on E: Exception do
      Log(E.Message);
  end;
end;

function RPetalReader.ExistsProperty(ObjNode: NObject; PropName: string; PropClass: NASTNodeClass): Boolean;
begin
  Result := (GetPropertyNode(ObjNode, PropName, PropClass) <> nil);
end;

function RPetalReader.GetPropChildClass(PropNode: NProperty): NASTNodeClass;
var
  C: NLiteralChild;
begin
  Result := nil;
  if PropNode.Node.Child is NObject then Result := NObject
  else if PropNode.Node.Child is NList then Result := NList
  else if PropNode.Node.Child is NLiteral then begin
    C := (PropNode.Node.Child as NLiteral).Child;
    if C is NBoolean then Result := NBoolean
    else if C is NValue then Result := NValue
    else if C is NLocation then Result := NLocation
    else if C is NTuple then Result := NTuple
    else if C is NInteger then Result := NInteger
    else if C is NStringLiteral then Result := NStringLiteral
    else if C is NFloat then Result := NFloat
    else if C is NTag then Result := NTag
  end;
end;

function RPetalReader.GetPropertyNode(ObjNode: NObject; PropName: string; PropClass: NASTNodeClass): NProperty;
var
  PropNode: NProperty;
  I: Integer;
begin
  Result := nil;
  for I := 0 to ObjNode.PropertyCount - 1 do begin
    PropNode := ObjNode.Properties[I];
    Assert(PropNode.Node <> nil);
    if PropNode.Name = PropName then
      if (PropClass = nil) or ((PropClass <> nil) and (GetPropChildClass(PropNode) = PropClass)) then begin
        Result := PropNode;
        Exit;
      end
  end;
end;

function RPetalReader.GetIntegerPropValue(ObjNode: NObject; PropName: string): Integer;
var
  Prop: NProperty;
begin
  Prop := GetPropertyNode(ObjNode, PropName, NInteger);
  if Prop = nil then
    raise EPropertyNotFound.Create(Format(ERR_PROPERTY_NOT_FOUND, [ObjNode.Name, PropName, TYPE_INTEGER]));
  Result := ((Prop.Node.Child as NLiteral).Child as NInteger).Value;
end;

function RPetalReader.GetRealPropValue(ObjNode: NObject; PropName: string): Real;
var
  Prop: NProperty;
begin
  Prop := GetPropertyNode(ObjNode, PropName, NFloat);
  if Prop = nil then
    raise EPropertyNotFound.Create(Format(ERR_PROPERTY_NOT_FOUND, [ObjNode.Name, PropName, TYPE_REAL]));
  Result := ((Prop.Node.Child as NLiteral).Child as NFloat).Value;
end;

function RPetalReader.GetBooleanPropValue(ObjNode: NObject; PropName: string): Boolean;
var
  Prop: NProperty;
begin
  Prop := GetPropertyNode(ObjNode, PropName, NBoolean);
  if Prop = nil then
    raise EPropertyNotFound.Create(Format(ERR_PROPERTY_NOT_FOUND, [ObjNode.Name, PropName, TYPE_BOOLEAN]));
  Result := ((Prop.Node.Child as NLiteral).Child as NBoolean).Value;
end;

function RPetalReader.GetStringPropValue(ObjNode: NObject; PropName: string): string;
var
  Prop: NProperty;
begin
  Prop := GetPropertyNode(ObjNode, PropName, NStringLiteral);
  if Prop = nil then
    raise EPropertyNotFound.Create(Format(ERR_PROPERTY_NOT_FOUND, [ObjNode.Name, PropName, TYPE_STRING]));
  Result := ((Prop.Node.Child as NLiteral).Child as NStringLiteral).Value;
end;

function RPetalReader.GetValuePropValue(ObjNode: NObject; PropName: string): string;
var
  Prop: NProperty;
begin
  Prop := GetPropertyNode(ObjNode, PropName, NValue);
  if Prop = nil then
    raise EPropertyNotFound.Create(Format(ERR_PROPERTY_NOT_FOUND, [ObjNode.Name, PropName, TYPE_VALUE]));
  Result := ((Prop.Node.Child as NLiteral).Child as NValue).Value;
end;

function RPetalReader.GetLocationPropValue(ObjNode: NObject; PropName: string): TPoint;
var
  Prop: NProperty;
  Loc: NLocation;
begin
  Prop := GetPropertyNode(ObjNode, PropName, NLocation);
  if Prop = nil then
    raise EPropertyNotFound.Create(Format(ERR_PROPERTY_NOT_FOUND, [ObjNode.Name, PropName, TYPE_LOCATION]));
  Loc := ((Prop.Node.Child as NLiteral).Child as NLocation);
  Result := Point(Loc.X, Loc.Y);
end;

function RPetalReader.GetObjectPropValue(ObjNode: NObject; PropName: string): NObject;
var
  Prop: NProperty;
begin
  Prop := GetPropertyNode(ObjNode, PropName, NObject);
  if Prop = nil then
    raise EPropertyNotFound.Create(Format(ERR_PROPERTY_NOT_FOUND, [ObjNode.Name, PropName, TYPE_OBJECT]));
  Result := Prop.Node.Child as NObject;
end;

function RPetalReader.GetListPropValue(ObjNode: NObject; PropName: string): NList;
var
  Prop: NProperty;
begin
  Prop := GetPropertyNode(ObjNode, PropName, NList);
  if Prop = nil then
    raise EPropertyNotFound.Create(Format(ERR_PROPERTY_NOT_FOUND, [ObjNode.Name, PropName, TYPE_LIST]));
  Result := Prop.Node.Child as NList;
end;

function RPetalReader.GetStringValue(ObjNode: NObject; Prop: NProperty): string;
begin
  if GetPropChildClass(Prop) <> NStringLiteral then
    raise EInvalidPropertyType.Create(Format(ERR_INALID_TYPE, [ObjNode.Name, Prop.Name, TYPE_STRING]));
  Result := ((Prop.Node.Child as NLiteral).Child as NStringLiteral).Value
end;

function RPetalReader.GetTagValue(ObjNode: NObject; Prop: NProperty): Integer;
begin
  if GetPropChildClass(Prop) <> NTag then
    raise EInvalidPropertyType.Create(Format(ERR_INALID_TYPE, [ObjNode.Name, Prop.Name, TYPE_TAG]));
  Result := ((Prop.Node.Child as NLiteral).Child as NTag).Value
end;

function RPetalReader.FindIdentifier(Base: RPetalObject; Name: string): RPetalIdentifier;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Base.ChildCount - 1 do begin
    if (Base.Children[I] is RPetalIdentifier) and ((Base.Children[I] as RPetalIdentifier).Name = Name) then begin
      Result := Base.Children[I] as RPetalIdentifier;
      Exit;
    end;
  end;
end;

function RPetalReader.FindIdentifierWithPathName(Base: RPetalObject; Path: string): RPetalIdentifier;
var
  Obj: RPetalObject;
  SL: TStringList;
  I: Integer;
begin
  Result := nil;

  SL := TStringList.Create;
  try
    DelimitText(Path, '::', SL);
    if SL.Count = 1 then begin
      if Base.Parent <> nil then
        for I := 0 to Base.Parent.ChildCount - 1 do
          if (Base.Parent.Children[I] is RPetalIdentifier)
            and ((Base.Parent.Children[I] as RPetalIdentifier).Name = Path) then begin
            Result := Base.Parent.Children[I] as RPetalIdentifier;
            Exit;
          end;
      for I := 0 to Base.ChildCount - 1 do
        if (Base.Children[I] is RPetalIdentifier) and ((Base.Children[I] as RPetalIdentifier).Name = Path) then begin
          Result := Base.Children[I] as RPetalIdentifier;
          Exit;
        end;
    end
    else begin
      Obj := Document.Design;
      for I := 0 to SL.Count - 1 do begin
        Obj := FindIdentifier(Obj, SL[I]);
        if Obj = nil then Exit;
      end;
      Result := Obj as RPetalIdentifier;
    end;
  finally
    SL.Free;
  end;
end;

function RPetalReader.FindIdentifierWithQuid(Base: RPetalObject; Quid: string): RPetalIdentifier;
var
  Ident: RPetalIdentifier;
  I: Integer;
begin
  Result := nil;
  for I := 0 to IdentifierList.Count - 1 do begin
    Ident := RPetalIdentifier(IdentifierList.Items[I]);
    if Ident.Quid = Quid then begin
      Result := Ident;
      Exit;
    end;
  end;
end;

function RPetalReader.FindIdentifierWithTag(Base: RPetalObject; Tag: Integer): RPetalIdentifier;
var
  View: RPetalView;
  Mecha: RMechanism;
  I: Integer;
begin
  Result := nil;
  for I := 0 to MechanismList.Count - 1 do begin
    Mecha := RMechanism(MechanismList.Items[I]);
    if Mecha.Tag = Tag then begin
      Result := Mecha;
      Exit;
    end;
  end;
  for I := 0 to ViewList.Count - 1 do begin
    View := RPetalView(ViewList.Items[I]);
    if View.Tag = Tag then begin
      Result := View;
      Exit;
    end;
  end;
end;

function RPetalReader.GetReferencePropValue(APetalObj: RPetalObject; ObjNode: NObject; PropName: string): RPetalObject;
begin
  Result := nil;
  if ExistsProperty(ObjNode, PropName, NStringLiteral) then
    Result := FindIdentifierWithPathName(APetalObj, GetStringPropValue(ObjNode, PropName));
end;

function RPetalReader.GetIdReferencePropValue(APetalObj: RPetalObject; ObjNode: NObject; PropName: string): RPetalObject;
begin
  Result := nil;
  if ExistsProperty(ObjNode, PropName, NStringLiteral) then
    Result := FindIdentifierWithQuid(APetalObj, GetStringPropValue(ObjNode, PropName));
end;

function RPetalReader.GetIdReferencePropValue(APetalObj: RPetalObject; ObjNode: NObject; PropName: string; IdPropName: string): RPetalObject;
begin
  Result := nil;
  if ExistsProperty(ObjNode, PropName, NStringLiteral) and ExistsProperty(ObjNode, IdPropName, NStringLiteral) then
    Result := FindIdentifierWithQuid(APetalObj, GetStringPropValue(ObjNode, IdPropName));
end;

function RPetalReader.GetAdjacentIdReferencePropValue(APetalObj: RPetalObject; ObjNode: NObject; PropName: string; IdPropName: string): RPetalObject;

  function GetSiblingProperty(Obj: NObject; Prop: NProperty): NProperty;
  var
    Idx: Integer;
    I: Integer;
  begin
    Result := nil;
    Idx := -1;
    for I := 0 to Obj.PropertyCount - 1 do
      if Obj.Properties[I] = Prop then begin
        Idx := I;
        Break;
      end;
    if Idx > 0 then
      Result := Obj.Properties[Idx - 1];
  end;

var
  Prop, PropNext: NProperty;
begin
  Result := nil;
  Prop := GetPropertyNode(ObjNode, PropName, NStringLiteral);
  if Prop <> nil then begin
    PropNext := GetSiblingProperty(ObjNode, Prop);
    if (PropNext <> nil) and (PropNext.Name = IdPropName) and (GetPropChildClass(PropNext) = NStringLiteral) then
      Result := FindIdentifierWithQuid(APetalObj, GetStringValue(ObjNode, PropNext));
  end;
end;

function RPetalReader.GetTagReferencePropValue(APetalObj: RPetalObject; ObjNode: NObject; PropName: string): RPetalObject;
var
  Prop: NProperty;
begin
  Prop := GetPropertyNode(ObjNode, PropName, NTag);
  if Prop = nil then
    raise EPropertyNotFound.Create(Format(ERR_PROPERTY_NOT_FOUND, [ObjNode.Name, PropName, TYPE_TAG]));
  Result := FindIdentifierWithTag(APetalObj, ((Prop.Node.Child as NLiteral).Child as NTag).Value);
end;

procedure RPetalReader.Progress(Pos, Max: Integer; Msg: string);
begin
  if Assigned(FOnProgress) then
    FOnProgress(Self, Pos, Max, Msg);
end;

procedure RPetalReader.Log(Msg: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg);
end;

procedure RPetalReader.ReferenceNotFound(ObjName: string; PropName: string);
begin
  Log(Format(ERR_REFERENCE_NOT_FOUND, [ObjName, PropName]));
end;

procedure RPetalReader.HandleLog(Sender: TObject; Msg: string);
begin
  Log(Msg);
end;

procedure RPetalReader.HandleProgress(Sender: TObject; Pos, Max: Integer; Msg: string);
begin
  Progress(Pos, Max, Msg);
end;

function RPetalReader.GetPetalObjectClass(PetalObjName: string): RPetalObjectClass;
begin
	if PetalObjName = OBJ_ACTION then Result := RAction
	else if PetalObjName = OBJ_ACTION_TIME then Result := RActionTime
	else if PetalObjName = OBJ_ACTIVITY_DIAGRAM then Result := RActivityDiagram
	else if PetalObjName = OBJ_ACTIVITY_STATE then Result := RActivityState
	else if PetalObjName = OBJ_ACTIVITY_STATE_VIEW then Result := RActivityStateView
	else if PetalObjName = OBJ_ASSOC_ATTACH_VIEW then Result := RAssocAttachView
	else if PetalObjName = OBJ_ASSOCIATION then Result := RAssociation
	else if PetalObjName = OBJ_ASSOCIATION_VIEW_NEW then Result := RAssociationViewNew
	else if PetalObjName = OBJ_ATTACH_VIEW then Result := RAttachView
	else if PetalObjName = OBJ_ATTRIBUTE then Result := RAttribute
	else if PetalObjName = OBJ_CATEGORY_VIEW then Result := RCategoryView
	else if PetalObjName = OBJ_CLASS then Result := RClass
	else if PetalObjName = OBJ_CLASS_CATEGORY then Result := RClass_Category
	else if PetalObjName = OBJ_CLASS_UTILITY then Result := RClass_Utility
	else if PetalObjName = OBJ_CLASS_ATTRIBUTE then Result := RClassAttribute
	else if PetalObjName = OBJ_CLASS_DIAGRAM then Result := RClassDiagram
	else if PetalObjName = OBJ_CLASS_INSTANCE_VIEW then Result := RClassInstanceView
	else if PetalObjName = OBJ_CLASS_VIEW then Result := RClassView
	else if PetalObjName = OBJ_COMPARTMENT then Result := RCompartment
	else if PetalObjName = OBJ_CONNECTION_RELATIONSHIP then Result := RConnection_Relationship
	else if PetalObjName = OBJ_CONNECTION_VIEW then Result := RConnectionView
	else if PetalObjName = OBJ_DATA_FLOW_VIEW then Result := RDataFlowView
	else if PetalObjName = OBJ_DECISION then Result := RDecision
	else if PetalObjName = OBJ_DECISION_VIEW then Result := RDecisionView
	else if PetalObjName = OBJ_DEFAULTS then Result := RDefaults
	else if PetalObjName = OBJ_DEPENDENCY_RELATIONSHIP then Result := RDependency_Relationship
	else if PetalObjName = OBJ_DEPENDENCY_VIEW then Result := RDependencyView
	else if PetalObjName = OBJ_DESIGN then Result := RDesign
	else if PetalObjName = OBJ_DESTRUCTION_MARKER then Result := RDestruction_Marker
	else if PetalObjName = OBJ_DEVICE then Result := RDevice
	else if PetalObjName = OBJ_DEVICE_VIEW then Result := RDeviceView
	else if PetalObjName = OBJ_EVENT then Result := REvent
	else if PetalObjName = OBJ_EXTERNAL_DOC then Result := RExternal_doc
	else if PetalObjName = OBJ_FOCUS_OF_CONTROL then Result := RFocus_Of_Control
	else if PetalObjName = OBJ_FONT then Result := RFont
	else if PetalObjName = OBJ_IMPORT_VIEW then Result := RImportView
	else if PetalObjName = OBJ_INHERITANCE_RELATIONSHIP then Result := RInheritance_Relationship
	else if PetalObjName = OBJ_INHERIT_TREE_VIEW then Result := RInheritTreeView
	else if PetalObjName = OBJ_INHERIT_VIEW then Result := RInheritView
	else if PetalObjName = OBJ_INSTANTIATED_CLASS then Result := RInstantiated_Class
	else if PetalObjName = OBJ_INSTANTIATED_CLASS_UTILITY then Result := RInstantiated_Class_Utility
	else if PetalObjName = OBJ_INTERACTION_DIAGRAM then Result := RInteractionDiagram
	else if PetalObjName = OBJ_INTERFACE_VIEW then Result := RInterfaceView
	else if PetalObjName = OBJ_INTER_MESS_VIEW then Result := RInterMessView
	else if PetalObjName = OBJ_INTER_OBJ_VIEW then Result := RInterObjView
	else if PetalObjName = OBJ_ITEM_LABEL then Result := RItemLabel
	else if PetalObjName = OBJ_LABEL then Result := RLabel
	else if PetalObjName = OBJ_LINK then Result := RLink
	else if PetalObjName = OBJ_LINK_SELF_VIEW then Result := RLinkSelfView
	else if PetalObjName = OBJ_LINK_VIEW then Result := RLinkView
	else if PetalObjName = OBJ_MECHANISM then Result := RMechanism
	else if PetalObjName = OBJ_MESSAGE then Result := RMessage
	else if PetalObjName = OBJ_MESS_VIEW then Result := RMessView
	else if PetalObjName = OBJ_METACLASS then Result := RMetaclass
	else if PetalObjName = OBJ_MODULE then Result := RModule
	else if PetalObjName = OBJ_MODULE_DIAGRAM then Result := RModule_Diagram
	else if PetalObjName = OBJ_MODULE_VISIBILITY_RELATIONSHIP then Result := RModule_Visibility_Relationship
	else if PetalObjName = OBJ_MOD_VIEW then Result := RModView
	else if PetalObjName = OBJ_MOD_VIS_VIEW then Result := RModVisView
	else if PetalObjName = OBJ_NOTE_VIEW then Result := RNoteView
	else if PetalObjName = OBJ_OBJECT then Result := RObject
	else if PetalObjName = OBJ_OBJECT_DIAGRAM then Result := RObjectDiagram
	else if PetalObjName = OBJ_OBJECT_VIEW then Result := RObjectView
	else if PetalObjName = OBJ_OPERATION then Result := ROperation
	else if PetalObjName = OBJ_PARAMETER then Result := RParameter
	else if PetalObjName = OBJ_PARAMETERIZED_CLASS then Result := RParameterized_Class
	else if PetalObjName = OBJ_PARAMETERIZED_CLASS_UTILITY then Result := RParameterized_Class_Utility
	else if PetalObjName = OBJ_PARTITION then Result := RPartition
	else if PetalObjName = OBJ_PETAL then Result := RPetal
	else if PetalObjName = OBJ_PROCESS then Result := RProcess
	else if PetalObjName = OBJ_PROCESS_DIAGRAM then Result := RProcess_Diagram
	else if PetalObjName = OBJ_PROCESSES then Result := RProcesses
	else if PetalObjName = OBJ_PROCESSOR then Result := RProcessor
	else if PetalObjName = OBJ_PROCESSOR_VIEW then Result := RProcessorView
	else if PetalObjName = OBJ_PROPERTIES then Result := RProperties
	else if PetalObjName = OBJ_REALIZE_RELATIONSHIP then Result := RRealize_Relationship
	else if PetalObjName = OBJ_REALIZE_VIEW then Result := RRealizeView
	else if PetalObjName = OBJ_ROLE then Result := RRole
	else if PetalObjName = OBJ_ROLE_VIEW then Result := RRoleView
	else if PetalObjName = OBJ_SEG_LABEL then Result := RSegLabel
	else if PetalObjName = OBJ_SELF_MESS_VIEW then Result := RSelfMessView
	else if PetalObjName = OBJ_SELF_TRANS_VIEW then Result := RSelfTransView
	else if PetalObjName = OBJ_SEMANTIC_INFO then Result := RSemantic_Info
	else if PetalObjName = OBJ_SEND_EVENT then Result := RSendEvent
	else if PetalObjName = OBJ_STATE then Result := RState
	else if PetalObjName = OBJ_STATE_DIAGRAM then Result := RState_Diagram
	else if PetalObjName = OBJ_STATE_MACHINE then Result := RState_Machine
	else if PetalObjName = OBJ_STATE_TRANSITION then Result := RState_Transition
	else if PetalObjName = OBJ_STATE_VIEW then Result := RStateView
	else if PetalObjName = OBJ_SUBSYSTEM then Result := RSubSystem
	else if PetalObjName = OBJ_SUBSYS_VIEW then Result := RSubSysView
	else if PetalObjName = OBJ_SWIMLANE then Result := RSwimlane
	else if PetalObjName = OBJ_SYNCHRONIZATION_STATE then Result := RSynchronizationState
	else if PetalObjName = OBJ_SYNCHRONIZATION_VIEW then Result := RSynchronizationView
	else if PetalObjName = OBJ_TIER_DIAGRAM then Result := RTier_Diagram
	else if PetalObjName = OBJ_TIER_VIEW then Result := RTierView
	else if PetalObjName = OBJ_TRANS_VIEW then Result := RTransView
	else if PetalObjName = OBJ_USE_CASE then Result := RUseCase
	else if PetalObjName = OBJ_USE_CASE_DIAGRAM then Result := RUseCaseDiagram
	else if PetalObjName = OBJ_USE_CASE_VIEW then Result := RUseCaseView
	else if PetalObjName = OBJ_USES_RELATIONSHIP then Result := RUses_Relationship
	else if PetalObjName = OBJ_USES_VIEW then Result := RUsesView
	else if PetalObjName = OBJ_VISIBILITY_RELATIONSHIP then Result := RVisibility_Relationship
  else
    raise EUnknownObject.Create(Format(ERR_UNKNOWN_OBJECT, [PetalObjName]));
end;

procedure RPetalReader.ConstructDocument;
var
  P: RPetal;
  D: RDesign;
begin
  // preconditions
  Assert(Document.Petal = nil);
  Assert(Document.Design = nil);

  P := RPetal.Create;
  P.ASTObject := ASTBuilder.HeaderNode.Object_;
  Document.Petal := P;
  ComposeElement(ASTBuilder.HeaderNode.Object_, P);

  D := RDesign.Create;
  D.ASTObject := ASTBuilder.DesignNode.Object_;
  Document.Design := D;
  ComposeElement(ASTBuilder.DesignNode.Object_, D);
end;

procedure RPetalReader.ComposeElement(ObjNode: NObject; APetalObj: RPetalObject);
begin
  Inc(CurObjNodeIdx);
//  Progress(CurObjNodeIdx, ObjectNodeCount, Format('%s : %d', [APetalObj.ClassName, CurObjNodeIdx]));
  Progress(CurObjNodeIdx, ObjectNodeCount, MSG_MAKE_NODE);

  try
    if APetalObj is RPetalDeploymentNode then ComposePetalDeploymentNode(ObjNode, APetalObj as RPetalDeploymentNode);
    if APetalObj is RClass then ComposeClass(ObjNode, APetalObj as RClass);
    if APetalObj is RPetalDiagram then ComposePetalDiagram(ObjNode, APetalObj as RPetalDiagram);
    if APetalObj is RPetalIdentifier then ComposePetalIdentifier(ObjNode, APetalObj as RPetalIdentifier);
    if APetalObj is RPetalModel then ComposePetalModel(ObjNode, APetalObj as RPetalModel);
    if APetalObj is RPetalStateVertex then ComposePetalStateVertex(ObjNode, APetalObj as RPetalStateVertex);
    if APetalObj is RPetalView then ComposePetalView(ObjNode, APetalObj as RPetalView);

    if APetalObj is RAction then ComposeAction(ObjNode, APetalObj as RAction)
    else if APetalObj is RActionTime then ComposeActionTime(ObjNode, APetalObj as RActionTime)
    else if APetalObj is RActivityState then ComposeActivityState(ObjNode, APetalObj as RActivityState)
    else if APetalObj is RActivityStateView then ComposeActivityStateView(ObjNode, APetalObj as RActivityStateView)
    else if APetalObj is RAssociation then ComposeAssociation(ObjNode, APetalObj as RAssociation)
    else if APetalObj is RAssociationViewNew then ComposeAssociationViewNew(ObjNode, APetalObj as RAssociationViewNew)
    else if APetalObj is RClass_Category then ComposeClassCategory(ObjNode, APetalObj as RClass_Category)
    else if APetalObj is RClassView then ComposeClassView(ObjNode, APetalObj as RClassView)
    else if APetalObj is RCompartment then ComposeCompartment(ObjNode, APetalObj as RCompartment)
    else if APetalObj is RDefaults then ComposeDefaults(ObjNode, APetalObj as RDefaults)
    else if APetalObj is RDesign then ComposeDesign(ObjNode, APetalObj as RDesign)
    else if APetalObj is RInterObjView then ComposeInterObjView(ObjNode, APetalObj as RInterObjView)
    else if APetalObj is RLink then ComposeLink(ObjNode, APetalObj as RLink)
    else if APetalObj is RMechanism then ComposeMechanism(ObjNode, APetalObj as RMechanism)
    else if APetalObj is RModule then ComposeModule(ObjNode, APetalObj as RModule)
    else if APetalObj is RObject then ComposeObject(ObjNode, APetalObj as RObject)
    else if APetalObj is RObjectView then ComposeObjectView(ObjNode, APetalObj as RObjectView)
    else if APetalObj is ROperation then ComposeOperation(ObjNode, APetalObj as ROperation)
    else if APetalObj is RParameterized_Class then ComposeParameterizedClass(ObjNode, APetalObj as RParameterized_Class)
    else if APetalObj is RProcesses then ComposeProcesses(ObjNode, APetalObj as RProcesses)
    else if APetalObj is RProcessor then ComposeProcessor(ObjNode, APetalObj as RProcessor)
    else if APetalObj is RProperties then ComposeProperties(ObjNode, APetalObj as RProperties)
    else if APetalObj is RRole then ComposeRole(ObjNode, APetalObj as RRole)
    else if APetalObj is RSendEvent then ComposeSendEvent(ObjNode, APetalObj as RSendEvent)
    else if APetalObj is RState then ComposeState(ObjNode, APetalObj as RState)
    else if APetalObj is RState_Machine then ComposeStateMachine(ObjNode, APetalObj as RState_Machine)
    else if APetalObj is RState_Transition then ComposeStateTansition(ObjNode, APetalObj as RState_Transition)
    else if APetalObj is RStateView then ComposeStateView(ObjNode, APetalObj as RStateView)
    else if APetalObj is RSubSystem then ComposeSubSystem(ObjNode, APetalObj as RSubSystem)
    else if APetalObj is RUseCase then ComposeUseCase(ObjNode, APetalObj as RUseCase);
  except
    on e: Exception do begin
      Log(e.Message);
    end;
  end;
end;

procedure RPetalReader.ComposeAction(ObjNode: NObject; AAction: RAction);
var
  UA: RActionTime;
  ObjVal: NObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ACTION);

  // property 'ActionTime'
  if ExistsProperty(ObjNode, PROP_ACTION_TIME, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_ACTION_TIME);
    UA := Factory.Create_ActionTime(AAction, ObjVal);
    ComposeElement(ObjVal, UA);
  end;
end;

procedure RPetalReader.ComposeActionTime(ObjNode: NObject; AActionTime: RActionTime);
var
  UE: REvent;
  ObjVal: NObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ACTION_TIME);

  // property 'Event'
  if ExistsProperty(ObjNode, PROP_EVENT, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_EVENT);
    UE := Factory.Create_Event(AActionTime, ObjVal);
    ComposeElement(ObjVal, UE);
  end;
end;

procedure RPetalReader.ComposeActivityState(ObjNode: NObject; AActivityState: RActivityState);
var
  UA: RAction;
  US: RState_Machine;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ACTIVITY_STATE);

  // property 'actions'
  if ExistsProperty(ObjNode, PROP_ACTIONS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_ACTIONS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UA := Factory.Create_Action(AActivityState, ObjVal);
        ComposeElement(ObjVal, UA);
      end;
  end;

  // property 'statemachine'
  if ExistsProperty(ObjNode, PROP_STATE_MACHINE, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_STATE_MACHINE);
    US := Factory.Create_State_Machine(AActivityState, ObjVal);
    ComposeElement(ObjVal, US);
  end;
end;

procedure RPetalReader.ComposeActivityStateView(ObjNode: NObject; AActivityStateView: RActivityStateView);
var
  UC: RCompartment;
  ObjVal: NObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ACTIVITY_STATE_VIEW);

  // property 'compartment'
  if ExistsProperty(ObjNode, PROP_COMPARTMENT, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_COMPARTMENT);
    UC := Factory.Create_Compartment(AActivityStateView, ObjVal);
    ComposeElement(ObjVal, UC);
  end;
end;

procedure RPetalReader.ComposeAssociation(ObjNode: NObject; AAssociation: RAssociation);
var
  UR: RRole;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ASSOCIATION);

  // property 'roles'
  if ExistsProperty(ObjNode, PROP_ROLES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_ROLES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UR := Factory.Create_Role(AAssociation, ObjVal);
        ComposeElement(ObjVal, UR);
      end;
  end;
end;

procedure RPetalReader.ComposeAssociationViewNew(ObjNode: NObject; AAssociationViewNew: RAssociationViewNew);
var
  UR: RRoleView;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ASSOCIATION_VIEW_NEW);

  // property 'roleview_list'
  if ExistsProperty(ObjNode, PROP_ROLEVIEW_LIST, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_ROLEVIEW_LIST);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UR := Factory.Create_RoleView(AAssociationViewNew, ObjVal);
        ComposeElement(ObjVal, UR);
      end;
  end;
end;

procedure RPetalReader.ComposeClass(ObjNode: NObject; AClass: RClass);
var
  UA: RClassAttribute;
  UO: ROperation;
  UR: RRealize_Relationship;
  UI: RInheritance_Relationship;
  US: RState_Machine;
  UU: RUses_Relationship;
  PClass: RPetalObjectClass;
  UObj: RPetalObject;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // property 'class_attributes'
  if ExistsProperty(ObjNode, PROP_CLASS_ATTRIBUTES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_CLASS_ATTRIBUTES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UA := Factory.Create_ClassAttribute(AClass, ObjVal);
        ComposeElement(ObjVal, UA);
      end;
  end;

  // property 'operations'
  if ExistsProperty(ObjNode, PROP_OPERATIONS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_OPERATIONS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UO := Factory.Create_Operation(AClass, ObjVal);
        ComposeElement(ObjVal, UO);
      end;
  end;

  // property 'realized_interfaces'
  if ExistsProperty(ObjNode, PROP_REALIZED_INTERFACES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_REALIZED_INTERFACES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UR := Factory.Create_Realize_Relationship(AClass, ObjVal);
        ComposeElement(ObjVal, UR);
      end;
  end;

  // property 'superclasses'
  if ExistsProperty(ObjNode, PROP_SUPER_CLASSES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_SUPER_CLASSES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UI := Factory.Create_Inheritance_Relationship(AClass, ObjVal);
        ComposeElement(ObjVal, UI);
      end;
  end;

  // property 'statemachine'
  if ExistsProperty(ObjNode, PROP_STATE_MACHINE, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_STATE_MACHINE);
    US := Factory.Create_State_Machine(AClass, ObjVal);
    ComposeElement(ObjVal, US);
  end;

  // property 'used_nodes'
  if ExistsProperty(ObjNode, PROP_USED_NODES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_USED_NODES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UU := Factory.Create_Uses_Relationship(AClass, ObjVal);
        ComposeElement(ObjVal, UU);
      end;
  end;

  // property 'nestedClasses'
  if ExistsProperty(ObjNode, PROP_NESTED_CLASSES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_NESTED_CLASSES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        PClass := GetPetalObjectClass(ObjVal.Name);
        UObj := Factory.Create_Class(PClass, AClass, ObjVal);
        ComposeElement(ObjVal, UObj);
      end;
  end;
end;

procedure RPetalReader.ComposeClassCategory(ObjNode: NObject; AClassCategory: RClass_Category);
var
  UD: RDependency_Relationship;
  US: RState_Machine;
  UV: RVisibility_Relationship;
  UO: RPetalObject;
  PClass: RPetalObjectClass;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_CLASS_CATEGORY);

  // property 'logical_models'
  if ExistsProperty(ObjNode, PROP_LOGICAL_MODELS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_LOGICAL_MODELS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        PClass := GetPetalObjectClass(ObjVal.Name);
        UO := Factory.Create_PetalModel(PClass, AClassCategory, ObjVal);
        ComposeElement(ObjVal, UO);
      end;
  end;

  // property 'logical_presentations'
  if ExistsProperty(ObjNode, PROP_LOGICAL_PRESENTATIONS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_LOGICAL_PRESENTATIONS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        PClass := GetPetalObjectClass(ObjVal.Name);
        UO := Factory.Create_PetalDiagram(PClass, AClassCategory, ObjVal);
        ComposeElement(ObjVal, UO);
      end;
  end;

  // property 'visible_modules'
  if ExistsProperty(ObjNode, PROP_VISIBLE_MODULES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_VISIBLE_MODULES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UD := Factory.Create_Dependency_Relationship(AClassCategory, ObjVal);
        ComposeElement(ObjVal, UD);
      end;
  end;

  // property 'visible_categories'
  if ExistsProperty(ObjNode, PROP_VISIBLE_CATEGORIES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_VISIBLE_CATEGORIES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UV := Factory.Create_Visibility_Relationship(AClassCategory, ObjVal);
        ComposeElement(ObjVal, UV);
      end;
  end;

  // property 'statemachine'
  if ExistsProperty(ObjNode, PROP_STATE_MACHINE, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_STATE_MACHINE);
    US := Factory.Create_State_Machine(AClassCategory, ObjVal);
    ComposeElement(ObjVal, US);
  end;
end;

procedure RPetalReader.ComposeClassView(ObjNode: NObject; AClassView: RClassView);
var
  UC: RCompartment;
  ObjVal: NObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_CLASS_VIEW);

  // property 'compartment'
  if ExistsProperty(ObjNode, PROP_COMPARTMENT, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_COMPARTMENT);
    UC := Factory.Create_Compartment(AClassView, ObjVal);
    ComposeElement(ObjVal, UC);
  end;
end;

procedure RPetalReader.ComposeCompartment(ObjNode: NObject; ACompartment: RCompartment);
var
  UC: RCompartment;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_COMPARTMENT);

  // property 'compartmentItems'
  if ExistsProperty(ObjNode, PROP_COMPARTMENT_ITEMS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_COMPARTMENT_ITEMS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UC := Factory.Create_Compartment(ACompartment, ObjVal);
        ComposeElement(ObjVal, UC);
      end;
  end;
end;

procedure RPetalReader.ComposeDefaults(ObjNode: NObject; ADefaults: RDefaults);
var
  UF: RFont;
  ObjVal: NObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_DEFAULTS);

  // property 'defaultFont'
  if ExistsProperty(ObjNode, PROP_DEFAULT_FONT, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_DEFAULT_FONT);
    UF := Factory.Create_Font(ADefaults, ObjVal);
    ComposeElement(ObjVal, UF);
  end;
end;

procedure RPetalReader.ComposeDesign(ObjNode: NObject; ADesign: RDesign);
var
  UC: RClass_Category;
  UD: RDefaults;
  UP: RProcesses;
  UPR: RProperties;
  US: RSubsystem;
  ObjVal: NObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_DESIGN);

  // property 'attributes' omitted

  // property 'defaults'
  if ExistsProperty(ObjNode, PROP_DEFAULTS, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_DEFAULTS);
    UD := Factory.Create_Defaults(ADesign, ObjVal);
    ComposeElement(ObjVal, UD);
  end;

  // property 'process_structure'
  if ExistsProperty(ObjNode, PROP_PROCESS_STRUCTURE, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_PROCESS_STRUCTURE);
    UP := Factory.Create_Processes(ADesign, ObjVal);
    ComposeElement(ObjVal, UP);
  end;

  // property 'properties'
  if ExistsProperty(ObjNode, PROP_PROPERTIES, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_PROPERTIES);
    UPR := Factory.Create_Properties(ADesign, ObjVal);
    ComposeElement(ObjVal, UPR);
  end;

  // property 'root_category'
  if ExistsProperty(ObjNode, PROP_ROOT_CATEGORY, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_ROOT_CATEGORY);
    UC := Factory.Create_Class_Category_As_Root_category(ADesign, ObjVal);
    ComposeElement(ObjVal, UC);
  end;

  // property 'root_subsystem'
  if ExistsProperty(ObjNode, PROP_ROOT_SUBSYSTEM, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_ROOT_SUBSYSTEM);
    US := Factory.Create_SubSystem(ADesign, ObjVal);
    ComposeElement(ObjVal, US);
  end;

  // property 'root_usecase_pacakage'
  if ExistsProperty(ObjNode, PROP_ROOT_USECASE_PACKAGE, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_ROOT_USECASE_PACKAGE);
    UC := Factory.Create_Class_Category_As_Root_usecase_package(ADesign, ObjVal);
    ComposeElement(ObjVal, UC);
  end;
end;

procedure RPetalReader.ComposeInterObjView(ObjNode: NObject; AInterObjView: RInterObjView);
var
  UF: RFocus_Of_Control;
  Prop: NProperty;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_INTER_OBJ_VIEW);

  // property 'Focus_Of_Control'
  for I := 0 to ObjNode.PropertyCount - 1 do begin
    Prop := ObjNode.Properties[I];
    if Prop.Name = PROP_FOCUS_OF_CONTROL then
      if Prop.Node.Child is NObject then begin
        ObjVal := (Prop.Node.Child as NObject);
        UF := Factory.Create_Focus_Of_Control(AInterObjView, ObjVal);
        ComposeElement(ObjVal, UF);
      end;
  end;
end;

procedure RPetalReader.ComposeLink(ObjNode: NObject; ALink: RLink);
var
  UM: RMessage;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_LINK);

  // property 'messages'
  if ExistsProperty(ObjNode, PROP_MESSAGES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_MESSAGES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UM := Factory.Create_Message(ALink, ObjVal);
        ComposeElement(ObjVal, UM);
      end;
  end;
end;

procedure RPetalReader.ComposeMechanism(ObjNode: NObject; AMechanism: RMechanism);
var
  UO: RObject;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_MECHANISM);

  // property 'logical_models'
  if ExistsProperty(ObjNode, PROP_LOGICAL_MODELS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_LOGICAL_MODELS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UO := Factory.Create_Object(AMechanism, ObjVal);
        ComposeElement(ObjVal, UO);
      end;
  end;

  // tag
  AMechanism.Tag := ObjNode.Tag;
  MechanismList.Add(AMechanism);
end;

procedure RPetalReader.ComposeModule(ObjNode: NObject; AModule: RModule);
var
  UM: RModule_Visibility_Relationship;
  UR: RRealize_Relationship;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_MODULE);

  // property 'visible_modules'
  if ExistsProperty(ObjNode, PROP_VISIBLE_MODULES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_VISIBLE_MODULES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UM := Factory.Create_Module_Visibility_Relationship(AModule, ObjVal);
        ComposeElement(ObjVal, UM);
      end;
  end;

  // property 'realized_interfaces'
  if ExistsProperty(ObjNode, PROP_REALIZED_INTERFACES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_REALIZED_INTERFACES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UR := Factory.Create_Realize_Relationship(AModule, ObjVal);
        ComposeElement(ObjVal, UR);
      end;
  end;
end;

procedure RPetalReader.ComposeObject(ObjNode: NObject; AObject: RObject);
var
  UL: RLink;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_OBJECT);

  // property 'collaborators'
  if ExistsProperty(ObjNode, PROP_COLLABORATORS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_COLLABORATORS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UL := Factory.Create_Link(AObject, ObjVal);
        ComposeElement(ObjVal, UL);
      end;
  end;
end;

procedure RPetalReader.ComposeObjectView(ObjNode: NObject; AObjectView: RObjectView);
var
  UC: RCompartment;
  ObjVal: NObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_OBJECT_VIEW);

  // property 'compartment'
  if ExistsProperty(ObjNode, PROP_COMPARTMENT, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_COMPARTMENT);
    UC := Factory.Create_Compartment(AObjectView, ObjVal);
    ComposeElement(ObjVal, UC);
  end;
end;

procedure RPetalReader.ComposeOperation(ObjNode: NObject; AOperation: ROperation);
var
  UP: RParameter;
  US: RSemantic_Info;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_OPERATION);

  // property 'parameters'
  if ExistsProperty(ObjNode, PROP_PARAMETERS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_PARAMETERS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UP := Factory.Create_Parameter(AOperation, ObjVal);
        ComposeElement(ObjVal, UP);
      end;
  end;

  // property 'post_condition'
  if ExistsProperty(ObjNode, PROP_POST_CONDITION, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_POST_CONDITION);
    US := Factory.Create_Semantic_Info_As_PostCondition(AOperation, ObjVal);
    ComposeElement(ObjVal, US);
  end;

  // property 'pre_condition'
  if ExistsProperty(ObjNode, PROP_PRE_CONDITION, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_PRE_CONDITION);
    US := Factory.Create_Semantic_Info_As_PreCondition(AOperation, ObjVal);
    ComposeElement(ObjVal, US);
  end;

  // property 'semantics'
  if ExistsProperty(ObjNode, PROP_SEMANTICS, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_SEMANTICS);
    US := Factory.Create_Semantic_Info_As_Semantics(AOperation, ObjVal);
    ComposeElement(ObjVal, US);
  end;
end;

procedure RPetalReader.ComposeParameterizedClass(ObjNode: NObject; AParameterizedClass: RParameterized_Class);
var
  UP: RParameter;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert((ObjNode.Name = OBJ_PARAMETERIZED_CLASS) or (ObjNode.Name = OBJ_PARAMETERIZED_CLASS_UTILITY));

  // property 'parameters'
  if ExistsProperty(ObjNode, PROP_PARAMETERS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_PARAMETERS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UP := Factory.Create_Parameter(AParameterizedClass, ObjVal);
        ComposeElement(ObjVal, UP);
      end;
  end;
end;

procedure RPetalReader.ComposePetalDeploymentNode(ObjNode: NObject; APetalDeploymentNode: RPetalDeploymentNode);
var
  UC: RConnection_Relationship;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // property 'connections'
  if ExistsProperty(ObjNode, PROP_CONNECTIONS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_CONNECTIONS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UC := Factory.Create_Connection_Relationship(APetalDeploymentNode, ObjVal);
        ComposeElement(ObjVal, UC);
      end;
  end;
end;

procedure RPetalReader.ComposePetalDiagram(ObjNode: NObject; APetalDiagram: RPetalDiagram);
var
  UV: RPetalView;
  PClass: RPetalObjectClass;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // property 'items'
  if ExistsProperty(ObjNode, PROP_ITEMS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_ITEMS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        PClass := GetPetalObjectClass(ObjVal.Name);
        UV := Factory.Create_PetalView(PClass, APetalDiagram, ObjVal);
        ComposeElement(ObjVal, UV);
      end;
  end;
end;

procedure RPetalReader.ComposePetalIdentifier(ObjNode: NObject; APetalIdentifier: RPetalIdentifier);
begin
  // name
  if ObjNode.ParamCount > 0 then
    APetalIdentifier.Name := ObjNode.Params[0]
  else
    APetalIdentifier.Name := '';

  // property 'quid'
  if ExistsProperty(ObjNode, PROP_QUID, NStringLiteral) then begin
    APetalIdentifier.Quid := GetStringPropValue(ObjNode, PROP_QUID);
    IdentifierList.Add(APetalIdentifier);
  end;
end;

procedure RPetalReader.ComposePetalModel(ObjNode: NObject; APetalModel: RPetalModel);
var
  UE: RExternal_doc;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // property 'attributes' omitted

  // property 'external_docs'
  if ExistsProperty(ObjNode, PROP_EXTERNAL_DOCS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_EXTERNAL_DOCS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UE := Factory.Create_External_doc(APetalModel, ObjVal);
        ComposeElement(ObjVal, UE);
      end;
  end;
end;

procedure RPetalReader.ComposePetalStateVertex(ObjNode: NObject; AStateVertex: RPetalStateVertex);
var
  UT: RState_Transition;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // property 'transitions'
  if ExistsProperty(ObjNode, PROP_TRANSITIONS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_TRANSITIONS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UT := Factory.Create_Transition(AStateVertex, ObjVal);
        ComposeElement(ObjVal, UT);
      end;
  end;
end;

procedure RPetalReader.ComposePetalView(ObjNode: NObject; APetalView: RPetalView);
var
  UF: RFont;
  UO: RPetalObject;
  PClass: RPetalObjectClass;
  Prop: NProperty;
  ObjVal: NObject;
  I: Integer;
begin
  // property 'font'
  if ExistsProperty(ObjNode, PROP_FONT, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_FONT);
    UF := Factory.Create_Font(APetalView, ObjVal);
    ComposeElement(ObjVal, UF);
  end;

  // property 'label'
  for I := 0 to ObjNode.PropertyCount - 1 do begin
    Prop := ObjNode.Properties[I];
    if Prop.Name = PROP_LABEL then
      if Prop.Node.Child is NObject then begin
        ObjVal := (Prop.Node.Child as NObject);
        PClass := GetPetalObjectClass(ObjVal.Name);
        UO := Factory.Create_PetalLabelViewAsLabel(PClass, APetalView, ObjVal);
        ComposeElement(ObjVal, UO);
      end;
  end;

  // property 'stereotype'
  if ExistsProperty(ObjNode, PROP_STEREOTYPE2, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_STEREOTYPE2);
    PClass := GetPetalObjectClass(ObjVal.Name);
    UO := Factory.Create_PetalLabelViewAsStereotype(PClass, APetalView, ObjVal);
    ComposeElement(ObjVal, UO);
  end;

  // tag
  APetalView.Tag := ObjNode.Tag;
  ViewList.Add(APetalView);
end;

procedure RPetalReader.ComposeProcesses(ObjNode: NObject; AProcesses: RProcesses);
var
  PClass: RPetalObjectClass;
  UM: RPetalModel;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_PROCESSES);

  // property 'ProcsNDevs'
  if ExistsProperty(ObjNode, PROP_PROCS_N_DEVS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_PROCS_N_DEVS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        PClass := GetPetalObjectClass(ObjVal.Name);
        UM := Factory.Create_PetalModel(PClass, AProcesses, ObjVal);
        ComposeElement(ObjVal, UM);
      end;
  end;
{
    SID := Finder.StartSearch(PATH_OBJECT_VALUE_IN_LIST, GetPropertyNode(ObjNode, PROP_PROCS_N_DEVS));
    N := Finder.FindNext(SID);
    while N <> NOT_EXISTS do begin
      PClass := GetPetalObjectClass(GetObjectName(N));
      UM := Factory.Create_PetalModel(PClass, AProcesses, N);
      ComposeElement(N, UM);
      N := Finder.FindNext(SID);
    end;
  end;
}
end;

procedure RPetalReader.ComposeProcessor(ObjNode: NObject; AProcessor: RProcessor);
var
  UP: RProcess;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_PROCESSOR);

  // property 'processes'
  if ExistsProperty(ObjNode, PROP_PROCESSES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_PROCESSES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UP := Factory.Create_Process(AProcessor, ObjVal);
        ComposeElement(ObjVal, UP);
      end;
  end;
end;

procedure RPetalReader.ComposeProperties(ObjNode: NObject; AProperties: RProperties);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_PROPERTIES);

  // property 'attributes' omitted
end;

procedure RPetalReader.ComposeRole(ObjNode: NObject; ARole: RRole);
var
  UA: RClassAttribute;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ROLE);

  // property 'keys'
  if ExistsProperty(ObjNode, PROP_KEYS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_KEYS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UA := Factory.Create_ClassAttribute(ARole, ObjVal);
        ComposeElement(ObjVal, UA);
      end;
  end;
end;

procedure RPetalReader.ComposeSendEvent(ObjNode: NObject; ASendEvent: RSendEvent);
var
  UA: RActionTime;
  UE: REvent;
  ObjVal: NObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_SEND_EVENT);

  // property 'ActionTime'
  if ExistsProperty(ObjNode, PROP_ACTION_TIME, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_ACTION_TIME);
    UA := Factory.Create_ActionTime(ASendEvent, ObjVal);
    ComposeElement(ObjVal, UA);
  end;

  // property 'Event'
  if ExistsProperty(ObjNode, PROP_EVENT, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_EVENT);
    UE := Factory.Create_Event(ASendEvent, ObjVal);
    ComposeElement(ObjVal, UE);
  end;
end;

procedure RPetalReader.ComposeState(ObjNode: NObject; AState: RState);
var
  UA: RAction;
  US: RState_Machine;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_STATE);

  // property 'actions'
  if ExistsProperty(ObjNode, PROP_ACTIONS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_ACTIONS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        // sendEvent is not considered.
        if ObjVal.Name = OBJ_ACTION then begin
          UA := Factory.Create_Action(AState, ObjVal);
          ComposeElement(ObjVal, UA);
        end;
      end;
  end;

  // property 'statemachine'
  if ExistsProperty(ObjNode, PROP_STATE_MACHINE, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_STATE_MACHINE);
    US := Factory.Create_State_Machine(AState, ObjVal);
    ComposeElement(ObjVal, US);
  end;
end;

procedure RPetalReader.ComposeStateMachine(ObjNode: NObject; AStateMachine: RState_Machine);
var
  UA: RActivityDiagram;
  US: RState_Diagram;
  UO: RObject;
  UP: RPartition;
  PClass: RPetalObjectClass;
  UObj: RPetalObject;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_STATE_MACHINE);

  // property 'statediagrams'
  if ExistsProperty(ObjNode, PROP_STATE_DIAGRAMS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_STATE_DIAGRAMS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        if ObjVal.Name = OBJ_STATE_DIAGRAM then begin
          US := Factory.Create_State_Diagram(AStateMachine, ObjVal);
          ComposeElement(ObjVal, US);
        end
        else begin
          UA := Factory.Create_ActivityDiagram(AStateMachine, ObjVal);
          ComposeElement(ObjVal, UA);
        end;
      end;
  end;

  // property 'objects'
  if ExistsProperty(ObjNode, PROP_OBJECTS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_OBJECTS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UO := Factory.Create_Object(AStateMachine, ObjVal);
        ComposeElement(ObjVal, UO);
      end;
  end;

  // property 'partitions'
  if ExistsProperty(ObjNode, PROP_PARTITIONS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_PARTITIONS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UP := Factory.Create_Partition(AStateMachine, ObjVal);
        ComposeElement(ObjVal, UP);
      end;
  end;

  // property 'states'
  if ExistsProperty(ObjNode, PROP_STATES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_STATES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        PClass := GetPetalObjectClass(ObjVal.Name);
        UObj := Factory.Create_PetalStateVertex(PClass, AStateMachine, ObjVal);
        ComposeElement(ObjVal, UObj);
      end;
  end;
end;

procedure RPetalReader.ComposeStateTansition(ObjNode: NObject; AStateTransition: RState_Transition);
var
  UA: RAction;
  UE: REvent;
  US: RSendEvent;
  ObjVal: NObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_STATE_TRANSITION);

  // property 'action'
  if ExistsProperty(ObjNode, PROP_ACTION, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_ACTION);
    UA := Factory.Create_Action(AStateTransition, ObjVal);
    ComposeElement(ObjVal, UA);
  end;

  // property 'Event'
  if ExistsProperty(ObjNode, PROP_EVENT, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_EVENT);
    UE := Factory.Create_Event(AStateTransition, ObjVal);
    ComposeElement(ObjVal, UE);
  end;

  // property 'sendEvent'
  if ExistsProperty(ObjNode, PROP_SEND_EVENT, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_SEND_EVENT);
    US := Factory.Create_SendEvent(AStateTransition, ObjVal);
    ComposeElement(ObjVal, US);
  end;
end;

procedure RPetalReader.ComposeStateView(ObjNode: NObject; AStateView: RStateView);
var
  UC: RCompartment;
  ObjVal: NObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_STATE_VIEW);

  // property 'compartment'
  if ExistsProperty(ObjNode, PROP_COMPARTMENT, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_COMPARTMENT);
    UC := Factory.Create_Compartment(AStateView, ObjVal);
    ComposeElement(ObjVal, UC);
  end;
end;

procedure RPetalReader.ComposeSubSystem(ObjNode: NObject; ASubSystem: RSubSystem);
var
  UO: RPetalObject;
  UMV: RModule_Visibility_Relationship;
  PClass: RPetalObjectClass;
  UM: RModule_Diagram;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_SUBSYSTEM);

  // property 'physical_models'
  if ExistsProperty(ObjNode, PROP_PHYSICAL_MODELS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_PHYSICAL_MODELS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        PClass := GetPetalObjectClass(ObjVal.Name);
        UO := Factory.Create_PetalModel(PClass, ASubSystem, ObjVal);
        ComposeElement(ObjVal, UO);
      end;
  end;

  // property 'physical_presentations'
  if ExistsProperty(ObjNode, PROP_PHYSICAL_PRESENTATIONS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_PHYSICAL_PRESENTATIONS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UM := Factory.Create_Module_Diagram(ASubSystem, ObjVal);
        ComposeElement(ObjVal, UM);
      end;
  end;

  // property 'visible_modules'
  if ExistsProperty(ObjNode, PROP_VISIBLE_MODULES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_VISIBLE_MODULES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UMV := Factory.Create_Module_Visibility_Relationship(ASubSystem, ObjVal);
        ComposeElement(ObjVal, UMV);
      end;
  end;
end;

procedure RPetalReader.ComposeUseCase(ObjNode: NObject; AUseCase: RUseCase);
var
  UD: RDependency_Relationship;
  UI: RInheritance_Relationship;
  US: RState_Machine;
  UO: RPetalObject;
  PClass: RPetalObjectClass;
  ObjList: NList;
  ObjVal: NObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_USE_CASE);

  // property 'logical_models'
  if ExistsProperty(ObjNode, PROP_LOGICAL_MODELS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_LOGICAL_MODELS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        PClass := GetPetalObjectClass(ObjVal.Name);
        UO := Factory.Create_PetalModel(PClass, AUseCase, ObjVal);
        ComposeElement(ObjVal, UO);
      end;
  end;

  // property 'logical_presentations'
  if ExistsProperty(ObjNode, PROP_LOGICAL_PRESENTATIONS, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_LOGICAL_PRESENTATIONS);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        PClass := GetPetalObjectClass(ObjVal.Name);
        UO := Factory.Create_PetalDiagram(PClass, AUseCase, ObjVal);
        ComposeElement(ObjVal, UO);
      end;
  end;

  // property 'visible_modules'
  if ExistsProperty(ObjNode, PROP_VISIBLE_MODULES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_VISIBLE_MODULES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UD := Factory.Create_Dependency_Relationship(AUSeCase, ObjVal);
        ComposeElement(ObjVal, UD);
      end;
  end;

  // property 'superclasses'
  if ExistsProperty(ObjNode, PROP_SUPER_CLASSES, NList) then begin
    ObjList := GetListPropValue(ObjNode, PROP_SUPER_CLASSES);
    for I := 0 to ObjList.ItemCount - 1 do
      if ObjList.Items[I].Child is NObject then begin
        ObjVal := ObjList.Items[I].Child as NObject;
        UI := Factory.Create_Inheritance_Relationship(AUseCase, ObjVal);
        ComposeElement(ObjVal, UI);
      end;
  end;

  // property 'statemachine'
  if ExistsProperty(ObjNode, PROP_STATE_MACHINE, NObject) then begin
    ObjVal := GetObjectPropValue(ObjNode, PROP_STATE_MACHINE);
    US := Factory.Create_State_Machine(AUseCase, ObjVal);
    ComposeElement(ObjVal, US);
  end;
end;

procedure RPetalReader.SetProperties;
begin
  if Document.Petal <> nil then
    SetProperty(Document.Petal);
  if Document.Design <> nil then
    SetProperty(Document.Design);
end;

procedure RPetalReader.SetProperty(APetalObject: RPetalObject);
var
  I: Integer;
begin
  Assert(APetalObject.ASTObject <> nil);

  Inc(CurObjNodeIdx);
//  Progress(CurObjNodeIdx, ObjectNodeCount, APetalObject.ClassName);
  Progress(CurObjNodeIdx, ObjectNodeCount, MSG_MAKE_NODE);

  SetPropertyElement(APetalObject.ASTObject, APetalObject);
  for I := 0 to APetalObject.ChildCount - 1 do
    SetProperty(APetalObject.Children[I]);
end;

procedure RPetalReader.SetPropertyElement(ObjNode: NObject; APetalObject: RPetalObject);
begin
  try
    APetalObject.ObjectName := ObjNode.Name;
    if APetalObject is RPetalIdentifier then SetPropertyPetalIdentifier(ObjNode, APetalObject as RPetalIdentifier);
    if APetalObject is RPetalModel then SetPropertyPetalModel(ObjNode, APetalObject as RPetalModel);
    if APetalObject is RPetalView then SetPropertyPetalView(ObjNode, APetalObject as RPetalView);
    if APetalObject is RPetalRelationship then SetPropertyPetalRelationship(ObjNode, APetalObject as RPetalRelationship);
    if APetalObject is RPetalDiagram then SetPropertyPetalDiagram(ObjNode, APetalObject as RPetalDiagram);
    if APetalObject is RPetalNodeView then SetPropertyPetalNodeView(ObjNode, APetalObject as RPetalNodeView);
    if APetalObject is RPetalEdgeView then SetPropertyPetalEdgeView(ObjNode, APetalObject as RPetalEdgeView);
    if APetalObject is RPetalLabelView then SetPropertyPetalLabelView(ObjNode, APetalObject as RPetalLabelView);
    if APetalObject is RPetalStateVertex then SetPropertyPetalStateVertex(ObjNode, APetalObject as RPetalStateVertex);
    if APetalObject is RPetalDeploymentNode then SetPropertyPetalDeploymentNode(ObjNode, APetalObject as RPetalDeploymentNode);
    if APetalObject is RAbstractStateDiagaram then SetPropertyAbstractStateDiagaram(ObjNode, APetalObject as RAbstractStateDiagaram);
    if APetalObject is RAction then SetPropertyAction(ObjNode, APetalObject as RAction);
    if APetalObject is RActionTime then SetPropertyActionTime(ObjNode, APetalObject as RActionTime);
    if APetalObject is RActivityDiagram then SetPropertyActivityDiagram(ObjNode, APetalObject as RActivityDiagram);
    if APetalObject is RActivityState then SetPropertyActivityState(ObjNode, APetalObject as RActivityState);
    if APetalObject is RActivityStateView then SetPropertyActivityStateView(ObjNode, APetalObject as RActivityStateView);
    if APetalObject is RAssocAttachView then SetPropertyAssocAttachView(ObjNode, APetalObject as RAssocAttachView);
    if APetalObject is RAssociation then SetPropertyAssociation(ObjNode, APetalObject as RAssociation);
    if APetalObject is RAssociationViewNew then SetPropertyAssociationViewNew(ObjNode, APetalObject as RAssociationViewNew);
    if APetalObject is RAttachView then SetPropertyAttachView(ObjNode, APetalObject as RAttachView);
    if APetalObject is RAttribute then SetPropertyAttribute(ObjNode, APetalObject as RAttribute);
    if APetalObject is RCategoryView then SetPropertyCategoryView(ObjNode, APetalObject as RCategoryView);
    if APetalObject is RClass then SetPropertyClass(ObjNode, APetalObject as RClass);
    if APetalObject is RClass_Category then SetPropertyClass_Category(ObjNode, APetalObject as RClass_Category);
    if APetalObject is RClass_Utility then SetPropertyClass_Utility(ObjNode, APetalObject as RClass_Utility);
    if APetalObject is RClassAttribute then SetPropertyClassAttribute(ObjNode, APetalObject as RClassAttribute);
    if APetalObject is RClassDiagram then SetPropertyClassDiagram(ObjNode, APetalObject as RClassDiagram);
    if APetalObject is RClassInstanceView then SetPropertyClassInstanceView(ObjNode, APetalObject as RClassInstanceView);
    if APetalObject is RClassView then SetPropertyClassView(ObjNode, APetalObject as RClassView);
    if APetalObject is RCompartment then SetPropertyCompartment(ObjNode, APetalObject as RCompartment);
    if APetalObject is RConnection_Relationship then SetPropertyConnection_Relationship(ObjNode, APetalObject as RConnection_Relationship);
    if APetalObject is RConnectionView then SetPropertyConnectionView(ObjNode, APetalObject as RConnectionView);
    if APetalObject is RDataFlowView then SetPropertyDataFlowView(ObjNode, APetalObject as RDataFlowView);
    if APetalObject is RDecision then SetPropertyDecision(ObjNode, APetalObject as RDecision);
    if APetalObject is RDecisionView then SetPropertyDecisionView(ObjNode, APetalObject as RDecisionView);
    if APetalObject is RDefaults then SetPropertyDefaults(ObjNode, APetalObject as RDefaults);
    if APetalObject is RDependency_Relationship then SetPropertyDependency_Relationship(ObjNode, APetalObject as RDependency_Relationship);
    if APetalObject is RDependencyView then SetPropertyDependencyView(ObjNode, APetalObject as RDependencyView);
    if APetalObject is RDesign then SetPropertyDesign(ObjNode, APetalObject as RDesign);
    if APetalObject is RDestruction_Marker then SetPropertyDestruction_Marker(ObjNode, APetalObject as RDestruction_Marker);
    if APetalObject is RDevice then SetPropertyDevice(ObjNode, APetalObject as RDevice);
    if APetalObject is RDeviceView then SetPropertyDeviceView(ObjNode, APetalObject as RDeviceView);
    if APetalObject is REvent then SetPropertyEvent(ObjNode, APetalObject as REvent);
    if APetalObject is RExternal_doc then SetPropertyExternal_doc(ObjNode, APetalObject as RExternal_doc);
    if APetalObject is RFocus_Of_Control then SetPropertyFocus_Of_Control(ObjNode, APetalObject as RFocus_Of_Control);
    if APetalObject is RFont then SetPropertyFont(ObjNode, APetalObject as RFont);
    if APetalObject is RImportView then SetPropertyImportView(ObjNode, APetalObject as RImportView);
    if APetalObject is RInheritance_Relationship then SetPropertyInheritance_Relationship(ObjNode, APetalObject as RInheritance_Relationship);
    if APetalObject is RInheritTreeView then SetPropertyInheritTreeView(ObjNode, APetalObject as RInheritTreeView);
    if APetalObject is RInheritView then SetPropertyInheritView(ObjNode, APetalObject as RInheritView);
    if APetalObject is RInstantiated_Class then SetPropertyInstantiated_Class(ObjNode, APetalObject as RInstantiated_Class);
    if APetalObject is RInstantiated_Class_Utility then SetPropertyInstantiated_Class_Utility(ObjNode, APetalObject as RInstantiated_Class_Utility);
    if APetalObject is RInteractionDiagram then SetPropertyInteractionDiagram(ObjNode, APetalObject as RInteractionDiagram);
    if APetalObject is RInterfaceView then SetPropertyInterfaceView(ObjNode, APetalObject as RInterfaceView);
    if APetalObject is RInterMessView then SetPropertyInterMessView(ObjNode, APetalObject as RInterMessView);
    if APetalObject is RInterObjView then SetPropertyInterObjView(ObjNode, APetalObject as RInterObjView);
    if APetalObject is RItemLabel then SetPropertyItemLabel(ObjNode, APetalObject as RItemLabel);
    if APetalObject is RLabel then SetPropertyLabel(ObjNode, APetalObject as RLabel);
    if APetalObject is RLink then SetPropertyLink(ObjNode, APetalObject as RLink);
    if APetalObject is RLinkSelfView then SetPropertyLinkSelfView(ObjNode, APetalObject as RLinkSelfView);
    if APetalObject is RLinkView then SetPropertyLinkView(ObjNode, APetalObject as RLinkView);
    if APetalObject is RMechanism then SetPropertyMechanism(ObjNode, APetalObject as RMechanism);
    if APetalObject is RMessage then SetPropertyMessage(ObjNode, APetalObject as RMessage);
    if APetalObject is RMessView then SetPropertyMessView(ObjNode, APetalObject as RMessView);
    if APetalObject is RMetaclass then SetPropertyMetaclass(ObjNode, APetalObject as RMetaclass);
    if APetalObject is RModule then SetPropertyModule(ObjNode, APetalObject as RModule);
    if APetalObject is RModule_Diagram then SetPropertyModule_Diagram(ObjNode, APetalObject as RModule_Diagram);
    if APetalObject is RModule_Visibility_Relationship then SetPropertyModule_Visibility_Relationship(ObjNode, APetalObject as RModule_Visibility_Relationship);
    if APetalObject is RModView then SetPropertyModView(ObjNode, APetalObject as RModView);
    if APetalObject is RModVisView then SetPropertyModVisView(ObjNode, APetalObject as RModVisView);
    if APetalObject is RNoteView then SetPropertyNoteView(ObjNode, APetalObject as RNoteView);
    if APetalObject is RObject then SetPropertyObject(ObjNode, APetalObject as RObject);
    if APetalObject is RObjectDiagram then SetPropertyObjectDiagram(ObjNode, APetalObject as RObjectDiagram);
    if APetalObject is RObjectView then SetPropertyObjectView(ObjNode, APetalObject as RObjectView);
    if APetalObject is ROperation then SetPropertyOperation(ObjNode, APetalObject as ROperation);
    if APetalObject is RParameter then SetPropertyParameter(ObjNode, APetalObject as RParameter);
    if APetalObject is RParameterized_Class then SetPropertyParameterized_Class(ObjNode, APetalObject as RParameterized_Class);
    if APetalObject is RParameterized_Class_Utility then SetPropertyParameterized_Class_Utility(ObjNode, APetalObject as RParameterized_Class_Utility);
    if APetalObject is RPartition then SetPropertyPartition(ObjNode, APetalObject as RPartition);
    if APetalObject is RPetal then SetPropertyPetal(ObjNode, APetalObject as RPetal);
    if APetalObject is RProcess then SetPropertyProcess(ObjNode, APetalObject as RProcess);
    if APetalObject is RProcess_Diagram then SetPropertyProcess_Diagram(ObjNode, APetalObject as RProcess_Diagram);
    if APetalObject is RProcesses then SetPropertyProcesses(ObjNode, APetalObject as RProcesses);
    if APetalObject is RProcessor then SetPropertyProcessor(ObjNode, APetalObject as RProcessor);
    if APetalObject is RProcessorView then SetPropertyProcessorView(ObjNode, APetalObject as RProcessorView);
    if APetalObject is RProperties then SetPropertyProperties(ObjNode, APetalObject as RProperties);
    if APetalObject is RRealize_Relationship then SetPropertyRealize_Relationship(ObjNode, APetalObject as RRealize_Relationship);
    if APetalObject is RRealizeView then SetPropertyRealizeView(ObjNode, APetalObject as RRealizeView);
    if APetalObject is RRole then SetPropertyRole(ObjNode, APetalObject as RRole);
    if APetalObject is RRoleView then SetPropertyRoleView(ObjNode, APetalObject as RRoleView);
    if APetalObject is RSegLabel then SetPropertySegLabel(ObjNode, APetalObject as RSegLabel);
    if APetalObject is RSelfMessView then SetPropertySelfMessView(ObjNode, APetalObject as RSelfMessView);
    if APetalObject is RSelfTransView then SetPropertySelfTransView(ObjNode, APetalObject as RSelfTransView);
    if APetalObject is RSemantic_Info then SetPropertySemantic_Info(ObjNode, APetalObject as RSemantic_Info);
    if APetalObject is RSendEvent then SetPropertySendEvent(ObjNode, APetalObject as RSendEvent);
    if APetalObject is RState then SetPropertyState(ObjNode, APetalObject as RState);
    if APetalObject is RState_Diagram then SetPropertyState_Diagram(ObjNode, APetalObject as RState_Diagram);
    if APetalObject is RState_Machine then SetPropertyState_Machine(ObjNode, APetalObject as RState_Machine);
    if APetalObject is RState_Transition then SetPropertyState_Transition(ObjNode, APetalObject as RState_Transition);
    if APetalObject is RStateView then SetPropertyStateView(ObjNode, APetalObject as RStateView);
    if APetalObject is RSubSystem then SetPropertySubSystem(ObjNode, APetalObject as RSubSystem);
    if APetalObject is RSubSysView then SetPropertySubSysView(ObjNode, APetalObject as RSubSysView);
    if APetalObject is RSwimlane then SetPropertySwimlane(ObjNode, APetalObject as RSwimlane);
    if APetalObject is RSynchronizationState then SetPropertySynchronizationState(ObjNode, APetalObject as RSynchronizationState);
    if APetalObject is RSynchronizationView then SetPropertySynchronizationView(ObjNode, APetalObject as RSynchronizationView);
    if APetalObject is RTier_Diagram then SetPropertyTier_Diagram(ObjNode, APetalObject as RTier_Diagram);
    if APetalObject is RTierView then SetPropertyTierView(ObjNode, APetalObject as RTierView);
    if APetalObject is RTransView then SetPropertyTransView(ObjNode, APetalObject as RTransView);
    if APetalObject is RUseCase then SetPropertyUseCase(ObjNode, APetalObject as RUseCase);
    if APetalObject is RUseCaseDiagram then SetPropertyUseCaseDiagram(ObjNode, APetalObject as RUseCaseDiagram);
    if APetalObject is RUseCaseView then SetPropertyUseCaseView(ObjNode, APetalObject as RUseCaseView);
    if APetalObject is RUses_Relationship then SetPropertyUses_Relationship(ObjNode, APetalObject as RUses_Relationship);
    if APetalObject is RUsesView then SetPropertyUsesView(ObjNode, APetalObject as RUsesView);
    if APetalObject is RVisibility_Relationship then SetPropertyVisibility_Relationship(ObjNode, APetalObject as RVisibility_Relationship);
  except
    on e: Exception do
      Log(e.Message);
  end;
end;

procedure RPetalReader.SetPropertyPetalIdentifier(ObjNode: NObject; APetalIdentifier: RPetalIdentifier);
var
  I: Integer;
begin
  // set properties
  for I := 0 to ObjNode.ParamCount - 1 do
    APetalIdentifier.Add_Param(ObjNode.Params[I]);
end;

procedure RPetalReader.SetPropertyPetalModel(ObjNode: NObject; APetalModel: RPetalModel);
begin
  // set properties
  if ExistsProperty(ObjNode, PROP_DOCUMENTATION, NStringLiteral) then
    APetalModel.Documentation := GetStringPropValue(ObjNode, PROP_DOCUMENTATION);
  if ExistsProperty(ObjNode, PROP_STEREOTYPE1, NStringLiteral) then
    APetalModel.Stereotype := GetStringPropValue(ObjNode, PROP_STEREOTYPE1);
  if ExistsProperty(ObjNode, PROP_UID, NInteger) then
    APetalModel.Uid := GetIntegerPropValue(ObjNode, PROP_UID);
  if ExistsProperty(ObjNode, PROP_EXPORT_CONTROL, NStringLiteral) then
    APetalModel.ExportControl := StringToExportControlKind(GetStringPropValue(ObjNode, PROP_EXPORT_CONTROL));
end;

procedure RPetalReader.SetPropertyPetalView(ObjNode: NObject; APetalView: RPetalView);
var
  Obj: RPetalObject;
begin
  // set properties
  if ExistsProperty(ObjNode, PROP_LINE_COLOR, NInteger) then
    APetalView.Line_color := GetIntegerPropValue(ObjNode, PROP_LINE_COLOR)
  else APetalView.Line_color := -1;
  if ExistsProperty(ObjNode, PROP_FILL_COLOR, NInteger) then
    APetalView.Fill_color := GetIntegerPropValue(ObjNode, PROP_FILL_COLOR)
  else APetalView.Fill_color := -1;
  if ExistsProperty(ObjNode, PROP_PARENT_VIEW, NTag) then begin
    Obj := GetTagReferencePropValue(APetalView, ObjNode, PROP_PARENT_VIEW);
    if (Obj = nil) or not (Obj is RPetalView) then
      ReferenceNotFound(ObjNode.Name, PROP_PARENT_VIEW)
    else
      APetalView.Parent_View := Obj as RPetalView;
  end;
  if ExistsProperty(ObjNode, PROP_QUIDU, NStringLiteral) then begin
    Obj := GetIdReferencePropValue(APetalView, ObjNode, PROP_QUIDU);
    if (Obj = nil) or not(Obj is RPetalModel) then
      ReferenceNotFound(ObjNode.Name, PROP_QUIDU)
    else
      APetalView.Model := Obj as RPetalModel;
  end;
end;

procedure RPetalReader.SetPropertyPetalRelationship(ObjNode: NObject; APetalRelationship: RPetalRelationship);
var
  Obj: RPetalObject;
begin
  // set properties
  if ExistsProperty(ObjNode, PROP_SUPPLIER, NStringLiteral) then begin
    Obj := GetAdjacentIdReferencePropValue(APetalRelationship, ObjNode, PROP_SUPPLIER, PROP_QUIDU);
    if (Obj = nil) or not(Obj is RPetalModel) then
      ReferenceNotFound(ObjNode.Name, PROP_SUPPLIER)
    else
      APetalRelationship.Supplier := Obj as RPetalModel;
  end;
  if ExistsProperty(ObjNode, PROP_LABEL2, NStringLiteral) then
    APetalRelationship.Label_ := GetStringPropValue(ObjNode, PROP_LABEL2);
end;

procedure RPetalReader.SetPropertyPetalDiagram(ObjNode: NObject; APetalDiagram: RPetalDiagram);
begin
  // set properties
  if ExistsProperty(ObjNode, PROP_TITLE, NStringLiteral) then
    APetalDiagram.Title := GetStringPropValue(ObjNode, PROP_TITLE);
  if ExistsProperty(ObjNode, PROP_MAX_HEIGHT, NInteger) then
    APetalDiagram.Max_height := GetIntegerPropValue(ObjNode, PROP_MAX_HEIGHT);
  if ExistsProperty(ObjNode, PROP_MAX_WIDTH, NInteger) then
    APetalDiagram.Max_width := GetIntegerPropValue(ObjNode, PROP_MAX_WIDTH);
  if ExistsProperty(ObjNode, PROP_ORIGIN_X, NInteger) then
    APetalDiagram.Origin_x := GetIntegerPropValue(ObjNode, PROP_ORIGIN_X);
  if ExistsProperty(ObjNode, PROP_ORIGIN_Y, NInteger) then
    APetalDiagram.Origin_y := GetIntegerPropValue(ObjNode, PROP_ORIGIN_Y);
  if ExistsProperty(ObjNode, PROP_ZOOM, NInteger) then
    APetalDiagram.Zoom := GetIntegerPropValue(ObjNode, PROP_ZOOM);
end;

procedure RPetalReader.SetPropertyPetalNodeView(ObjNode: NObject; APetalNodeView: RPetalNodeView);
begin
  // set properties
  if ExistsProperty(ObjNode, PROP_AUTO_RESIZE, NBoolean) then
    APetalNodeView.AutoResize := GetBooleanPropValue(ObjNode, PROP_AUTO_RESIZE);
  if ExistsProperty(ObjNode, PROP_ICON_STYLE, NStringLiteral) then
    APetalNodeView.Icon_style := StringToIconStyleKind(GetStringPropValue(ObjNode, PROP_ICON_STYLE));
  if ExistsProperty(ObjNode, PROP_LOCATION, NLocation) then
    APetalNodeView.Location := GetLocationPropValue(ObjNode, PROP_LOCATION);
  if ExistsProperty(ObjNode, PROP_WIDTH, NInteger) then
    APetalNodeView.Width := GetIntegerPropValue(ObjNode, PROP_WIDTH);
  if ExistsProperty(ObjNode, PROP_HEIGHT, NInteger) then
    APetalNodeView.Height := GetIntegerPropValue(ObjNode, PROP_HEIGHT);
end;

procedure RPetalReader.SetPropertyPetalEdgeView(ObjNode: NObject; APetalEdgeView: RPetalEdgeView);
var
  Obj: RPetalObject;
  List: NList;
  Lit: NLiteral;
  Loc: NLocation;
  I: Integer;
begin
  // set properties
  if ExistsProperty(ObjNode, PROP_CLIENT, NTag) then begin
    Obj := GetTagReferencePropValue(APetalEdgeView, ObjNode, PROP_CLIENT);
    if (Obj = nil) or not (Obj is RPetalView) then
      ReferenceNotFound(ObjNode.Name, PROP_CLIENT)
    else
      APetalEdgeView.Client := Obj as RPetalView;
  end;
  if ExistsProperty(ObjNode, PROP_SUPPLIER, NTag) then begin
    Obj := GetTagReferencePropValue(APetalEdgeView, ObjNode, PROP_SUPPLIER);
    if (Obj = nil) or not (Obj is RPetalView) then
      ReferenceNotFound(ObjNode.Name, PROP_SUPPLIER)
    else
      APetalEdgeView.Supplier := Obj as RPetalView;
  end;
  if ExistsProperty(ObjNode, PROP_LINE_STYLE, NInteger) then
    APetalEdgeView.Line_style := IntegerToLineStyleKind(GetIntegerPropValue(ObjNode, PROP_LINE_STYLE));
  if ExistsProperty(ObjNode, PROP_STEREOTYPE3, NBoolean) then
    APetalEdgeView.Stereotype := GetBooleanPropValue(ObjNode, PROP_STEREOTYPE3);
  if ExistsProperty(ObjNode, PROP_ORIGIN_ATTACHMENT, NLocation) then
    APetalEdgeView.Origin_attachment := GetLocationPropValue(ObjNode, PROP_ORIGIN_ATTACHMENT);
  if ExistsProperty(ObjNode, PROP_TERMINAL_ATTACHMENT, NLocation) then
    APetalEdgeView.Terminal_attachment := GetLocationPropValue(ObjNode, PROP_TERMINAL_ATTACHMENT);
  if ExistsProperty(ObjNode, PROP_VERTICES, NList) then begin
    List := GetListPropValue(ObjNode, PROP_VERTICES);
    for I := 0 to List.ItemCount - 1 do begin
      if not(List.Items[I].Child is NLiteral) then
        raise EInvalidPropertyStruct.Create(Format(ERR_INVALID_PROPERTY_STRUCT, [ObjNode.Name, PROP_VERTICES]));
      Lit := List.Items[I].Child as NLiteral;
      if not(Lit.Child is NLocation) then
        raise EInvalidPropertyStruct.Create(Format(ERR_INVALID_PROPERTY_STRUCT, [ObjNode.Name, PROP_VERTICES]));
      Loc := Lit.Child as NLocation;
      APetalEdgeView.Add_Vertex(Vertex(Loc.X, Loc.Y));
    end;
  end;
end;

procedure RPetalReader.SetPropertyPetalLabelView(ObjNode: NObject; APetalLabelView: RPetalLabelView);
begin
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyPetalStateVertex(ObjNode: NObject; APetalStateVertex: RPetalStateVertex);
begin
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyPetalDeploymentNode(ObjNode: NObject; APetalDeploymentNode: RPetalDeploymentNode);
begin
  // set properties
  if ExistsProperty(ObjNode, PROP_CHARACTERISTICS, NStringLiteral) then
    APetalDeploymentNode.Characteristics := GetStringPropValue(ObjNode, PROP_CHARACTERISTICS);
end;

procedure RPetalReader.SetPropertyAbstractStateDiagaram(ObjNode: NObject; AAbstractStateDiagaram: RAbstractStateDiagaram);
begin
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyAction(ObjNode: NObject; AAction: RAction);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ACTION);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyActionTime(ObjNode: NObject; AActionTime: RActionTime);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ACTION_TIME);
  // set properties
  if ExistsProperty(ObjNode, PROP_CONDITION, NStringLiteral) then
    AActionTime.Condition := GetStringPropValue(ObjNode, PROP_CONDITION);
  if ExistsProperty(ObjNode, PROP_WHEN, NStringLiteral) then
    AActionTime.When := StringToTimePointKind(GetStringPropValue(ObjNode, PROP_WHEN));
end;

procedure RPetalReader.SetPropertyActivityDiagram(ObjNode: NObject; AActivityDiagram: RActivityDiagram);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ACTIVITY_DIAGRAM);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyActivityState(ObjNode: NObject; AActivityState: RActivityState);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ACTIVITY_STATE);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyActivityStateView(ObjNode: NObject; AActivityStateView: RActivityStateView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ACTIVITY_STATE_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_ANNOTATION, NInteger) then
    AActivityStateView.Annotation := GetIntegerPropValue(ObjNode, PROP_ANNOTATION)
end;

procedure RPetalReader.SetPropertyAssocAttachView(ObjNode: NObject; AAssocAttachView: RAssocAttachView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ASSOC_ATTACH_VIEW);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyAssociation(ObjNode: NObject; AAssociation: RAssociation);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ASSOCIATION);
  // set properties
  if ExistsProperty(ObjNode, PROP_CONSTRAINTS, NStringLiteral) then
    AAssociation.Constraints := GetStringPropValue(ObjNode, PROP_CONSTRAINTS);
  if ExistsProperty(ObjNode, PROP_DERIVED, NBoolean) then
    AAssociation.Derived := GetBooleanPropValue(ObjNode, PROP_DERIVED);
  if ExistsProperty(ObjNode, PROP_ASSOCIATIONCLASS, NStringLiteral) then begin
    Obj := GetReferencePropValue(AAssociation, ObjNode, PROP_ASSOCIATIONCLASS);
    if (Obj = nil) or not(Obj is RClass) then
      ReferenceNotFound(ObjNode.Name, PROP_ASSOCIATIONCLASS)
    else
      AAssociation.AssociationClass := Obj as RClass;
  end;
end;

procedure RPetalReader.SetPropertyAssociationViewNew(ObjNode: NObject; AAssociationViewNew: RAssociationViewNew);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ASSOCIATION_VIEW_NEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_LOCATION, NLocation) then
    AAssociationViewNew.Location := GetLocationPropValue(ObjNode, PROP_LOCATION);
end;

procedure RPetalReader.SetPropertyAttachView(ObjNode: NObject; AAttachView: RAttachView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ATTACH_VIEW);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyAttribute(ObjNode: NObject; AAttribute: RAttribute);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ATTRIBUTE);
  // set properties
  if ExistsProperty(ObjNode, PROP_NAME, NStringLiteral) then
    AAttribute.Name := GetStringPropValue(ObjNode, PROP_NAME);
  if ExistsProperty(ObjNode, PROP_TOOL, NStringLiteral) then
    AAttribute.Tool := GetStringPropValue(ObjNode, PROP_TOOL);
  if ExistsProperty(ObjNode, PROP_VALUE, NStringLiteral) then
    AAttribute.Value := GetStringPropValue(ObjNode, PROP_VALUE);
end;

procedure RPetalReader.SetPropertyCategoryView(ObjNode: NObject; ACategoryView: RCategoryView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_CATEGORY_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_ICON, NStringLiteral) then
    ACategoryView.Icon := GetStringPropValue(ObjNode, PROP_ICON);
end;

procedure RPetalReader.SetPropertyClass(ObjNode: NObject; AClass: RClass);

  function GetSiblingProperty(Obj: NObject; Prop: NProperty): NProperty;
  var
    Idx: Integer;
    I: Integer;
  begin
    Result := nil;
    Idx := -1;
    for I := 0 to Obj.PropertyCount - 1 do
      if Obj.Properties[I] = Prop then begin
        Idx := I;
        Break;
      end;
    if Idx > 0 then
      Result := Obj.Properties[Idx - 1];
  end;

var
  Prop, PropNext: NProperty;
  Obj: RPetalObject;
  I: Integer;
begin
  // set properties
  for I := 1 to ObjNode.PropertyCount - 1 do begin
    Prop := ObjNode.Properties[I];
    PropNext := ObjNode.Properties[I - 1];
    if (Prop.Name = PROP_MODULE) and (PropNext.Name = PROP_QUID) then begin
      if GetPropChildClass(PropNext) = NStringLiteral then begin
        Obj := FindIdentifierWithQuid(AClass, GetStringValue(ObjNode, PropNext));
        if (Obj = nil) or not (Obj is RModule) then
          ReferenceNotFound(ObjNode.Name, PROP_MODULE)
        else
          AClass.Add_Module(Obj as RModule);
      end;
    end;
  end;
  if ExistsProperty(ObjNode, PROP_ABSTRACT, NBoolean) then
    AClass.Abstract := GetBooleanPropValue(ObjNode, PROP_ABSTRACT);
  if ExistsProperty(ObjNode, PROP_CARDINALITY, NValue) then
    AClass.Cardinality := GetValuePropValue(ObjNode, PROP_CARDINALITY);
  if ExistsProperty(ObjNode, PROP_CONCURRENCY, NStringLiteral) then
    AClass.Concurrency := StringToConcurrencyKind(GetStringPropValue(ObjNode, PROP_CONCURRENCY));
  if ExistsProperty(ObjNode, PROP_PERSISTENCE, NStringLiteral) then begin
    if GetStringPropValue(ObjNode, PROP_PERSISTENCE) = VALUE_PERSISTENT then
      AClass.Persistence := pkPersistent
    else
      AClass.Persistence := pkTransient;
  end;
  if ExistsProperty(ObjNode, PROP_LANGUAGE, NStringLiteral) then
    AClass.Language := GetStringPropValue(ObjNode, PROP_LANGUAGE);
  if ExistsProperty(ObjNode, PROP_SPACE, NStringLiteral) then
    AClass.Space := GetStringPropValue(ObjNode, PROP_SPACE);
end;

procedure RPetalReader.SetPropertyClass_Category(ObjNode: NObject; AClass_Category: RClass_Category);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_CLASS_CATEGORY);
  // set properties
  if ExistsProperty(ObjNode, PROP_GLOBAL, NBoolean) then
    AClass_Category.Global := GetBooleanPropValue(ObjNode, PROP_GLOBAL);
  if ExistsProperty(ObjNode, PROP_SUBSYSTEM, NStringLiteral) then begin
    Obj := GetAdjacentIdReferencePropValue(AClass_Category, ObjNode, PROP_SUBSYSTEM, PROP_QUIDU);
    if (Obj = nil) or not(Obj is RSubSystem) then
      ReferenceNotFound(ObjNode.Name, PROP_SUBSYSTEM)
    else
      AClass_Category.Subsystem := Obj as RSubSystem;
  end;
end;

procedure RPetalReader.SetPropertyClass_Utility(ObjNode: NObject; AClass_Utility: RClass_Utility);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_CLASS_UTILITY);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyClassAttribute(ObjNode: NObject; AClassAttribute: RClassAttribute);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_CLASS_ATTRIBUTE);
  // set properties
  if ExistsProperty(ObjNode, PROP_CONTAINMENT, NStringLiteral) then
    AClassAttribute.Containment := StringToContainmentKind(GetStringPropValue(ObjNode, PROP_CONTAINMENT))
  else
    AClassAttribute.Containment := ckUnspecifed;
  if ExistsProperty(ObjNode, PROP_DERIVED, NBoolean) then
    AClassAttribute.Derived := GetBooleanPropValue(ObjNode, PROP_DERIVED);
  if ExistsProperty(ObjNode, PROP_INITV, NStringLiteral) then
    AClassAttribute.Initv := GetStringPropValue(ObjNode, PROP_INITV);
  if ExistsProperty(ObjNode, PROP_STATIC, NBoolean) then
    AClassAttribute.Static := GetBooleanPropValue(ObjNode, PROP_STATIC);
  if ExistsProperty(ObjNode, PROP_TYPE, NStringLiteral) then begin
    Obj := nil;
    if ExistsProperty(ObjNode, PROP_QUIDU, NStringLiteral) then
      Obj := GetIdReferencePropValue(AClassAttribute, ObjNode, PROP_TYPE, PROP_QUIDU);
    if Obj = nil then begin
      AClassAttribute.Type_ := nil;
      AClassAttribute.TypeExpression := GetStringPropValue(ObjNode, PROP_TYPE);
    end
    else begin
      AClassAttribute.Type_ := Obj as RClass;
      AClassAttribute.TypeExpression := (Obj as RClass).Name;
    end;
  end;
end;

procedure RPetalReader.SetPropertyClassDiagram(ObjNode: NObject; AClassDiagram: RClassDiagram);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_CLASS_DIAGRAM);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyClassInstanceView(ObjNode: NObject; AClassInstanceView: RClassInstanceView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_CLASS_INSTANCE_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_ANNOTATION, NInteger) then
    AClassInstanceView.Annotation := GetIntegerPropValue(ObjNode, PROP_ANNOTATION);
  if ExistsProperty(ObjNode, PROP_ICON, NStringLiteral) then
    AClassInstanceView.Icon := GetStringPropValue(ObjNode, PROP_ICON);
end;

procedure RPetalReader.SetPropertyClassView(ObjNode: NObject; AClassView: RClassView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_CLASS_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_INCLUDE_ATTRIBUTE, NBoolean) then
    AClassView.IncludeAttribute := GetBooleanPropValue(ObjNode, PROP_INCLUDE_ATTRIBUTE);
  if ExistsProperty(ObjNode, PROP_INCLUDE_OPERATION, NBoolean) then
    AClassView.IncludeOperation := GetBooleanPropValue(ObjNode, PROP_INCLUDE_OPERATION);
  if ExistsProperty(ObjNode, PROP_SHOW_COMPARTMENT_STEREOTYPES, NBoolean) then
    AClassView.ShowCompartmentStereotypes := GetBooleanPropValue(ObjNode, PROP_SHOW_COMPARTMENT_STEREOTYPES);
  if ExistsProperty(ObjNode, PROP_SHOW_OPERATION_SIGNATURE, NBoolean) then
    AClassView.ShowOperationSignature := GetBooleanPropValue(ObjNode, PROP_SHOW_OPERATION_SIGNATURE);
  if ExistsProperty(ObjNode, PROP_ANNOTATION, NInteger) then
    AClassView.Annotation := GetIntegerPropValue(ObjNode, PROP_ANNOTATION);
  if ExistsProperty(ObjNode, PROP_ICON, NStringLiteral) then
    AClassView.Icon := GetStringPropValue(ObjNode, PROP_ICON);
  if ExistsProperty(ObjNode, PROP_SUPPRESS_ATTRIBUTE, NBoolean) then
    AClassView.SuppressAttribute := GetBooleanPropValue(ObjNode, PROP_SUPPRESS_ATTRIBUTE);
  if ExistsProperty(ObjNode, PROP_SUPPRESS_OPERATION, NBoolean) then
    AClassView.SuppressOperation := GetBooleanPropValue(ObjNode, PROP_SUPPRESS_OPERATION);
end;

procedure RPetalReader.SetPropertyCompartment(ObjNode: NObject; ACompartment: RCompartment);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_COMPARTMENT);
  // set properties
  if ExistsProperty(ObjNode, PROP_ANCHOR, NInteger) then
    ACompartment.Anchor := GetIntegerPropValue(ObjNode, PROP_ANCHOR);
  if ExistsProperty(ObjNode, PROP_JUSTIFY, NInteger) then
    ACompartment.Justify := GetIntegerPropValue(ObjNode, PROP_JUSTIFY);
  if ExistsProperty(ObjNode, PROP_MAX_WIDTH, NInteger) then
    ACompartment.Max_width := GetIntegerPropValue(ObjNode, PROP_MAX_WIDTH);
  if ExistsProperty(ObjNode, PROP_NLINES, NInteger) then
    ACompartment.Nlines := GetIntegerPropValue(ObjNode, PROP_NLINES);
end;

procedure RPetalReader.SetPropertyConnection_Relationship(ObjNode: NObject; AConnection_Relationship: RConnection_Relationship);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_CONNECTION_RELATIONSHIP);
  // set properties
  if ExistsProperty(ObjNode, PROP_SUPPLIER_IS_DEVICE, NBoolean) then
    AConnection_Relationship.Supplier_is_device := GetBooleanPropValue(ObjNode, PROP_SUPPLIER_IS_DEVICE);
  if ExistsProperty(ObjNode, PROP_CHARACTERISTICS, NStringLiteral) then
    AConnection_Relationship.Characteristics := GetStringPropValue(ObjNode, PROP_CHARACTERISTICS);
end;

procedure RPetalReader.SetPropertyConnectionView(ObjNode: NObject; AConnectionView: RConnectionView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_CONNECTION_VIEW);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyDataFlowView(ObjNode: NObject; ADataFlowView: RDataFlowView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_DATA_FLOW_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_DIR, NInteger) then
    ADataFlowView.Dir := IntegerToDataFlowDirectionKind(GetIntegerPropValue(ObjNode, PROP_DIR));
  if ExistsProperty(ObjNode, PROP_HEIGHT, NInteger) then
    ADataFlowView.Height := GetIntegerPropValue(ObjNode, PROP_HEIGHT);
end;

procedure RPetalReader.SetPropertyDecision(ObjNode: NObject; ADecision: RDecision);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_DECISION);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyDecisionView(ObjNode: NObject; ADecisionView: RDecisionView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_DECISION_VIEW);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyDefaults(ObjNode: NObject; ADefaults: RDefaults);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_DEFAULTS);
  // set properties
  if ExistsProperty(ObjNode, PROP_AUTO_RESIZE, NBoolean) then
    ADefaults.AutoResize := GetBooleanPropValue(ObjNode, PROP_AUTO_RESIZE);
  if ExistsProperty(ObjNode, PROP_BOTTOM_MARGIN, NFloat) then
    ADefaults.BottomMargin := GetRealPropValue(ObjNode, PROP_BOTTOM_MARGIN);
  if ExistsProperty(ObjNode, PROP_CLIP_ICON_LABELS, NBoolean) then
    ADefaults.ClipIconLabels := GetBooleanPropValue(ObjNode, PROP_CLIP_ICON_LABELS);
  if ExistsProperty(ObjNode, PROP_GRID_X, NInteger) then
    ADefaults.GridX := GetIntegerPropValue(ObjNode, PROP_GRID_X);
  if ExistsProperty(ObjNode, PROP_GRID_Y, NInteger) then
    ADefaults.GridY := GetIntegerPropValue(ObjNode, PROP_GRID_Y);
  if ExistsProperty(ObjNode, PROP_LEFT_MARGIN, NFloat) then
    ADefaults.LeftMargin := GetRealPropValue(ObjNode, PROP_LEFT_MARGIN);
  if ExistsProperty(ObjNode, PROP_NOTATION, NStringLiteral) then
    ADefaults.Notation := StringToNotationKind(GetStringPropValue(ObjNode, PROP_NOTATION));
  if ExistsProperty(ObjNode, PROP_PAGE_OVERLAP, NFloat) then
    ADefaults.PageOverlap := GetRealPropValue(ObjNode, PROP_PAGE_OVERLAP);
  if ExistsProperty(ObjNode, PROP_RIGHT_MARGIN, NFloat) then
    ADefaults.RightMargin := GetRealPropValue(ObjNode, PROP_RIGHT_MARGIN);
  if ExistsProperty(ObjNode, PROP_SHOW_CLASS_OF_OBJECT, NBoolean) then
    ADefaults.ShowClassOfObject := GetBooleanPropValue(ObjNode, PROP_SHOW_CLASS_OF_OBJECT);
  if ExistsProperty(ObjNode, PROP_SHOW_MESSAGE_NUM, NInteger) then
    ADefaults.ShowMessageNum := GetIntegerPropValue(ObjNode, PROP_SHOW_MESSAGE_NUM);
  if ExistsProperty(ObjNode, PROP_SNAP_TO_GRID, NBoolean) then
    ADefaults.SnapToGrid := GetBooleanPropValue(ObjNode, PROP_SNAP_TO_GRID);
  if ExistsProperty(ObjNode, PROP_TOP_MARGIN, NFloat) then
    ADefaults.TopMargin := GetRealPropValue(ObjNode, PROP_TOP_MARGIN);
end;

procedure RPetalReader.SetPropertyDependency_Relationship(ObjNode: NObject; ADependency_Relationship: RDependency_Relationship);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_DEPENDENCY_RELATIONSHIP);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyDependencyView(ObjNode: NObject; ADependencyView: RDependencyView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_DEPENDENCY_VIEW);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyDesign(ObjNode: NObject; ADesign: RDesign);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_DESIGN);
  // set properties
  if ExistsProperty(ObjNode, PROP_IS_LOADED, NBoolean) then
    ADesign.Is_loaded := GetBooleanPropValue(ObjNode, PROP_IS_LOADED);
  if ExistsProperty(ObjNode, PROP_IS_UNIT, NBoolean) then
    ADesign.Is_unit := GetBooleanPropValue(ObjNode, PROP_IS_UNIT);
end;

procedure RPetalReader.SetPropertyDestruction_Marker(ObjNode: NObject; ADestruction_Marker: RDestruction_Marker);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_DESTRUCTION_MARKER);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyDevice(ObjNode: NObject; ADevice: RDevice);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_DEVICE);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyDeviceView(ObjNode: NObject; ADeviceView: RDeviceView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_DEVICE_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_ANNOTATION, NInteger) then
    ADeviceView.Annotation := GetIntegerPropValue(ObjNode, PROP_ANNOTATION);
end;

procedure RPetalReader.SetPropertyEvent(ObjNode: NObject; AEvent: REvent);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_EVENT);
  // set properties
  if ExistsProperty(ObjNode, PROP_PARAMETERS2, NStringLiteral) then
    AEvent.Parameters := GetStringPropValue(ObjNode, PROP_PARAMETERS2);
end;

procedure RPetalReader.SetPropertyExternal_doc(ObjNode: NObject; AExternal_doc: RExternal_doc);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_EXTERNAL_DOC);
  // set properties
  if ExistsProperty(ObjNode, PROP_EXTERNAL_DOC_PATH, NStringLiteral) then
    AExternal_doc.External_doc_path := GetStringPropValue(ObjNode, PROP_EXTERNAL_DOC_PATH);
  if ExistsProperty(ObjNode, PROP_EXTERNAL_DOC_URL, NStringLiteral) then
    AExternal_doc.External_doc_url := GetStringPropValue(ObjNode, PROP_EXTERNAL_DOC_URL);
end;

procedure RPetalReader.SetPropertyFocus_Of_Control(ObjNode: NObject; AFocus_Of_Control: RFocus_Of_Control);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_FOCUS_OF_CONTROL);
  // set properties
  if ExistsProperty(ObjNode, PROP_NESTED, NBoolean) then
    AFocus_Of_Control.Nested := GetBooleanPropValue(ObjNode, PROP_NESTED);
  if ExistsProperty(ObjNode, PROP_Y_COORD, NInteger) then
    AFocus_Of_Control.Y_coord := GetIntegerPropValue(ObjNode, PROP_Y_COORD);
  if ExistsProperty(ObjNode, PROP_INTER_OBJ_VIEW, NTag) then begin
    Obj := GetTagReferencePropValue(AFocus_Of_Control, ObjNode, PROP_INTER_OBJ_VIEW);
    if (Obj = nil) or not (Obj is RInterObjView) then
      ReferenceNotFound(ObjNode.Name, PROP_INTER_OBJ_VIEW)
    else
      AFocus_Of_Control.InterObjView := Obj as RInterObjView;
  end;
end;

procedure RPetalReader.SetPropertyFont(ObjNode: NObject; AFont: RFont);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_FONT);
  // set properties
  if ExistsProperty(ObjNode, PROP_BOLD, NBoolean) then
    AFont.Bold := GetBooleanPropValue(ObjNode, PROP_BOLD);
  if ExistsProperty(ObjNode, PROP_CHARSET, NInteger) then
    AFont.CharSet := GetIntegerPropValue(ObjNode, PROP_CHARSET);
  if ExistsProperty(ObjNode, PROP_COLOR, NInteger) then
    AFont.Color := GetIntegerPropValue(ObjNode, PROP_COLOR);
  if ExistsProperty(ObjNode, PROP_DEFAULT_COLOR, NBoolean) then
    AFont.Default_color := GetBooleanPropValue(ObjNode, PROP_DEFAULT_COLOR);
  if ExistsProperty(ObjNode, PROP_FACE, NStringLiteral) then
    AFont.Face := GetStringPropValue(ObjNode, PROP_FACE);
  if ExistsProperty(ObjNode, PROP_ITALICS, NBoolean) then
    AFont.Italics := GetBooleanPropValue(ObjNode, PROP_ITALICS);
  if ExistsProperty(ObjNode, PROP_SIZE, NInteger) then
    AFont.Size := GetIntegerPropValue(ObjNode, PROP_SIZE);
  if ExistsProperty(ObjNode, PROP_STRIKE, NBoolean) then
    AFont.Strike := GetBooleanPropValue(ObjNode, PROP_STRIKE);
  if ExistsProperty(ObjNode, PROP_UNDERLINE, NBoolean) then
    AFont.Underline := GetBooleanPropValue(ObjNode, PROP_UNDERLINE);
end;

procedure RPetalReader.SetPropertyImportView(ObjNode: NObject; AImportView: RImportView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_IMPORT_VIEW);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyInheritance_Relationship(ObjNode: NObject; AInheritance_Relationship: RInheritance_Relationship);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_INHERITANCE_RELATIONSHIP);
  // set properties
  if ExistsProperty(ObjNode, PROP_FRIEND, NBoolean) then
    AInheritance_Relationship.Friend := GetBooleanPropValue(ObjNode, PROP_FRIEND);
  if ExistsProperty(ObjNode, PROP_VIRTUAL, NBoolean) then
    AInheritance_Relationship.Virtual := GetBooleanPropValue(ObjNode, PROP_VIRTUAL);
end;

procedure RPetalReader.SetPropertyInheritTreeView(ObjNode: NObject; AInheritView: RInheritTreeView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_INHERIT_TREE_VIEW);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyInheritView(ObjNode: NObject; AInheritView: RInheritView);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_INHERIT_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_DRAW_SUPPLIER, NTag) then begin
    Obj := GetTagReferencePropValue(AInheritView, ObjNode, PROP_DRAW_SUPPLIER);
    if (Obj = nil) or not (Obj is RInheritTreeView) then
      ReferenceNotFound(ObjNode.Name, PROP_DRAW_SUPPLIER)
    else
      AInheritView.drawSupplier := Obj as RInheritTreeView;
  end;
end;

procedure RPetalReader.SetPropertyInstantiated_Class(ObjNode: NObject; AInstantiated_Class: RInstantiated_Class);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_INSTANTIATED_CLASS);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyInstantiated_Class_Utility(ObjNode: NObject; AInstantiated_Class_Utility: RInstantiated_Class_Utility);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_INSTANTIATED_CLASS_UTILITY);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyInteractionDiagram(ObjNode: NObject; AInteractionDiagram: RInteractionDiagram);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_INTERACTION_DIAGRAM);
  // set properties
  if ExistsProperty(ObjNode, PROP_MECHANISM_REF, NTag) then begin
    Obj := GetTagReferencePropValue(AInteractionDiagram, ObjNode, PROP_MECHANISM_REF);
    if (Obj = nil) or not (Obj is RMechanism) then
      ReferenceNotFound(ObjNode.Name, PROP_MECHANISM_REF)
    else
      AInteractionDiagram.Mechanism_ref := Obj as RMechanism;
  end;
end;

procedure RPetalReader.SetPropertyInterfaceView(ObjNode: NObject; AInterfaceView: RInterfaceView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_INTERFACE_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_ICON, NStringLiteral) then
    AInterfaceView.Icon := GetStringPropValue(ObjNode, PROP_ICON);
end;

procedure RPetalReader.SetPropertyInterMessView(ObjNode: NObject; AInterMessView: RInterMessView);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_INTER_MESS_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_LOCATION, NLocation) then
    AInterMessView.Location := GetLocationPropValue(ObjNode, PROP_LOCATION);
  if ExistsProperty(ObjNode, PROP_ORDINAL, NInteger) then
    AInterMessView.Ordinal := GetIntegerPropValue(ObjNode, PROP_ORDINAL);
  if ExistsProperty(ObjNode, PROP_ORIGIN, NLocation) then
    AInterMessView.Origin := GetLocationPropValue(ObjNode, PROP_ORIGIN);
  if ExistsProperty(ObjNode, PROP_TERMINUS, NLocation) then
    AInterMessView.Terminus := GetLocationPropValue(ObjNode, PROP_TERMINUS);
  if ExistsProperty(ObjNode, PROP_FOCUS_ENTRY, NTag) then begin
    Obj := GetTagReferencePropValue(AInterMessView, ObjNode, PROP_FOCUS_ENTRY);
    if (Obj = nil) or not (Obj is RFocus_Of_Control) then
      ReferenceNotFound(ObjNode.Name, PROP_FOCUS_ENTRY)
    else
      AInterMessView.Focus_Entry := Obj as RFocus_Of_Control;
  end;
  if ExistsProperty(ObjNode, PROP_FOCUS_SRC, NTag) then begin
    Obj := GetTagReferencePropValue(AInterMessView, ObjNode, PROP_FOCUS_SRC);
    if (Obj = nil) or not (Obj is RFocus_Of_Control) then
      ReferenceNotFound(ObjNode.Name, PROP_FOCUS_SRC)
    else
      AInterMessView.Focus_Src := Obj as RFocus_Of_Control;
  end;
end;

procedure RPetalReader.SetPropertyInterObjView(ObjNode: NObject; AInterObjView: RInterObjView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_INTER_OBJ_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_ANNOTATION, NInteger) then
    AInterObjView.Annotation := GetIntegerPropValue(ObjNode, PROP_ANNOTATION);
  if ExistsProperty(ObjNode, PROP_ICON, NStringLiteral) then
    AInterObjView.Icon := GetStringPropValue(ObjNode, PROP_ICON);
  if ExistsProperty(ObjNode, PROP_ICON_HEIGHT, NInteger) then
    AInterObjView.Icon_height := GetIntegerPropValue(ObjNode, PROP_ICON_HEIGHT);
  if ExistsProperty(ObjNode, PROP_ICON_WIDTH, NInteger) then
    AInterObjView.Icon_width := GetIntegerPropValue(ObjNode, PROP_ICON_WIDTH);
  if ExistsProperty(ObjNode, PROP_ICON_Y_OFFSET, NInteger) then
    AInterObjView.Icon_y_offset := GetIntegerPropValue(ObjNode, PROP_ICON_Y_OFFSET);
end;

procedure RPetalReader.SetPropertyItemLabel(ObjNode: NObject; AItemLabel: RItemLabel);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ITEM_LABEL);
  // set properties
  if ExistsProperty(ObjNode, PROP_ANCHOR, NInteger) then
    AItemLabel.Anchor := GetIntegerPropValue(ObjNode, PROP_ANCHOR);
  if ExistsProperty(ObjNode, PROP_ANCHOR_LOC, NInteger) then
    AItemLabel.Anchor_loc := GetIntegerPropValue(ObjNode, PROP_ANCHOR_LOC);
  if ExistsProperty(ObjNode, PROP_HIDDEN, NBoolean) then
    AItemLabel.Hidden := GetBooleanPropValue(ObjNode, PROP_HIDDEN);
  if ExistsProperty(ObjNode, PROP_JUSTIFY, NInteger) then
    AItemLabel.Justify := GetIntegerPropValue(ObjNode, PROP_JUSTIFY);
  if ExistsProperty(ObjNode, PROP_LABEL2, NStringLiteral) then
    AItemLabel.Label_ := GetStringPropValue(ObjNode, PROP_LABEL2);
  if ExistsProperty(ObjNode, PROP_MAX_WIDTH, NInteger) then
    AItemLabel.Max_width := GetIntegerPropValue(ObjNode, PROP_MAX_WIDTH);
  if ExistsProperty(ObjNode, PROP_NLINES, NInteger) then
    AItemLabel.Nlines := GetIntegerPropValue(ObjNode, PROP_NLINES);
end;

procedure RPetalReader.SetPropertyLabel(ObjNode: NObject; ALabel: RLabel);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_LABEL);
  // set properties
  if ExistsProperty(ObjNode, PROP_LABEL2, NStringLiteral) then
    ALabel.Label_ := GetStringPropValue(ObjNode, PROP_LABEL2);
  if ExistsProperty(ObjNode, PROP_MAX_WIDTH, NInteger) then
    ALabel.Max_width := GetIntegerPropValue(ObjNode, PROP_MAX_WIDTH);
  if ExistsProperty(ObjNode, PROP_NLINES, NInteger) then
    ALabel.Nlines := GetIntegerPropValue(ObjNode, PROP_NLINES);
end;

procedure RPetalReader.SetPropertyLink(ObjNode: NObject; ALink: RLink);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_LINK);
  // set properties
  if ExistsProperty(ObjNode, PROP_CLIENT_CONTAINMENT, NStringLiteral) then
    ALink.Client_containment := StringToContainmentKind(GetStringPropValue(ObjNode, PROP_CLIENT_CONTAINMENT));
  if ExistsProperty(ObjNode, PROP_CLIENT_VISIBILITY, NStringLiteral) then
    ALink.Client_visibility := StringToLinkVisibilityKind(GetStringPropValue(ObjNode, PROP_CLIENT_VISIBILITY));
  if ExistsProperty(ObjNode, PROP_SUPPLIER_CONTAINMENT, NStringLiteral) then
    ALink.Supplier_containment := StringToContainmentKind(GetStringPropValue(ObjNode, PROP_SUPPLIER_CONTAINMENT));
  if ExistsProperty(ObjNode, PROP_SUPPLIER_VISIBILITY, NStringLiteral) then
    ALink.Supplier_visibility := StringToLinkVisibilityKind(GetStringPropValue(ObjNode, PROP_SUPPLIER_VISIBILITY));
  // property 'Association' is ommitted.
end;

procedure RPetalReader.SetPropertyLinkSelfView(ObjNode: NObject; ALinkSelfView: RLinkSelfView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_LINK_SELF_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_LOCATION, NLocation) then
    ALinkSelfView.Location := GetLocationPropValue(ObjNode, PROP_LOCATION);
end;

procedure RPetalReader.SetPropertyLinkView(ObjNode: NObject; ALinkView: RLinkView);
begin
  // preconditions
  Assert((ObjNode.Name = OBJ_LINK_VIEW) or (ObjNode.Name = OBJ_LINK_SELF_VIEW));
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyMechanism(ObjNode: NObject; AMechanism: RMechanism);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_MECHANISM);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyMessage(ObjNode: NObject; AMessage: RMessage);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_MESSAGE);
  // set properties
  if ExistsProperty(ObjNode, PROP_OPERATION, NStringLiteral) then begin
    Obj := GetAdjacentIdReferencePropValue(AMessage, ObjNode, PROP_OPERATION, PROP_QUIDU);
    if (Obj = nil) or not (Obj is ROperation) then
      ReferenceNotFound(ObjNode.Name, PROP_OPERATION)
    else
      AMessage.Operation := Obj as ROperation;
  end;
  if ExistsProperty(ObjNode, PROP_CREATION, NBoolean) then
    AMessage.Creation := GetBooleanPropValue(ObjNode, PROP_CREATION);
  if ExistsProperty(ObjNode, PROP_DIR, NStringLiteral) then
    AMessage.Dir := StringToMessageDirectionKind(GetStringPropValue(ObjNode, PROP_DIR));
  if ExistsProperty(ObjNode, PROP_FREQUENCY, NStringLiteral) then
    AMessage.Frequency := StringToMessageFrequencyKind(GetStringPropValue(ObjNode, PROP_FREQUENCY));
  if ExistsProperty(ObjNode, PROP_ORDINAL, NInteger) then
    AMessage.Ordinal := GetIntegerPropValue(ObjNode, PROP_ORDINAL);
  if ExistsProperty(ObjNode, PROP_SYNCHRONIZATION, NStringLiteral) then
    AMessage.Synchronization := StringToMessageSynchronizationKind(GetStringPropValue(ObjNode, PROP_SYNCHRONIZATION));
end;

procedure RPetalReader.SetPropertyMessView(ObjNode: NObject; AMessView: RMessView);
var
  Prop: NProperty;
  Obj: RPetalObject;
  I: Integer;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_MESS_VIEW);

  // set properties
  for I := 1 to ObjNode.PropertyCount - 1 do begin
    Prop := ObjNode.Properties[I];
    if Prop.Name = PROP_DATA_FLOW_VIEW then begin
      if GetPropChildClass(Prop) = NTag then begin
        Obj := FindIdentifierWithTag(AMessView, GetTagValue(ObjNode, Prop));
        if (Obj = nil) or not (Obj is RDataFlowView) then
          ReferenceNotFound(ObjNode.Name, PROP_DATA_FLOW_VIEW)
        else
          AMessView.Add_DataFlowView(Obj as RDataFlowView);
      end;
    end;
  end;

  if ExistsProperty(ObjNode, PROP_DIR, NInteger) then
    AMessView.Dir := IntegerToMessViewDirectionKind(GetIntegerPropValue(ObjNode, PROP_DIR));
  if ExistsProperty(ObjNode, PROP_OBJECT_ARC, NTag) then begin
    Obj := GetTagReferencePropValue(AMessView, ObjNode, PROP_OBJECT_ARC);
    if (Obj = nil) or not (Obj is RLinkView) then
      ReferenceNotFound(ObjNode.Name, PROP_OBJECT_ARC)
    else
      AMessView.Object_arc := Obj as RLinkView;
  end;
  if ExistsProperty(ObjNode, PROP_ORIENTATION, NInteger) then
    AMessView.Orientation := GetIntegerPropValue(ObjNode, PROP_ORIENTATION);
  if ExistsProperty(ObjNode, PROP_ORIGIN, NLocation) then
    AMessView.Origin := GetLocationPropValue(ObjNode, PROP_ORIGIN);
  if ExistsProperty(ObjNode, PROP_PCT_DIST, NFloat) then
    AMessView.PctDist := GetRealPropValue(ObjNode, PROP_PCT_DIST);
  if ExistsProperty(ObjNode, PROP_TERMINUS, NLocation) then
    AMessView.Terminus := GetLocationPropValue(ObjNode, PROP_TERMINUS);
end;

procedure RPetalReader.SetPropertyMetaclass(ObjNode: NObject; AMetaclass: RMetaclass);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_METACLASS);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyModule(ObjNode: NObject; AModule: RModule);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_MODULE);
  // set properties
  if ExistsProperty(ObjNode, PROP_DECLARATIONS, NStringLiteral) then
    AModule.Declarations := GetStringPropValue(ObjNode, PROP_DECLARATIONS);
  if ExistsProperty(ObjNode, PROP_LANGUAGE, NStringLiteral) then
    AModule.Language := GetStringPropValue(ObjNode, PROP_LANGUAGE);
end;

procedure RPetalReader.SetPropertyModule_Diagram(ObjNode: NObject; AModule_Diagram: RModule_Diagram);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_MODULE_DIAGRAM);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyModule_Visibility_Relationship(ObjNode: NObject; AModule_Visibility_Relationship: RModule_Visibility_Relationship);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_MODULE_VISIBILITY_RELATIONSHIP);
  // set properties
  if ExistsProperty(ObjNode, PROP_SUPPLIER_IS_SPEC, NBoolean) then
    AModule_Visibility_Relationship.Supplier_is_spec := GetBooleanPropValue(ObjNode, PROP_SUPPLIER_IS_SPEC);
  if ExistsProperty(ObjNode, PROP_SUPPLIER_IS_SUBSYSTEM, NBoolean) then
    AModule_Visibility_Relationship.Supplier_is_subsystem := GetBooleanPropValue(ObjNode, PROP_SUPPLIER_IS_SUBSYSTEM);
end;

procedure RPetalReader.SetPropertyModView(ObjNode: NObject; AModView: RModView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_MOD_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_ICON, NStringLiteral) then
    AModView.Icon := GetStringPropValue(ObjNode, PROP_ICON);
end;

procedure RPetalReader.SetPropertyModVisView(ObjNode: NObject; AModVisView: RModVisView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_MOD_VIS_VIEW);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyNoteView(ObjNode: NObject; ANoteView: RNoteView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_NOTE_VIEW);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyObject(ObjNode: NObject; AObject: RObject);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_OBJECT);
  // set properties
  if ExistsProperty(ObjNode, PROP_CLASS, NStringLiteral) then begin
    Obj := GetIdReferencePropValue(AObject, ObjNode, PROP_CLASS, PROP_QUIDU);
    if (Obj = nil) or not(Obj is RClass) then
      ReferenceNotFound(ObjNode.Name, PROP_CLASS)
    else
      AObject.Class_ := Obj as RClass;
  end;
  if ExistsProperty(ObjNode, PROP_CREATION_OBJ, NBoolean) then
    AObject.CreationObj := GetBooleanPropValue(ObjNode, PROP_CREATION_OBJ);
  if ExistsProperty(ObjNode, PROP_MULTI, NBoolean) then
    AObject.Multi := GetBooleanPropValue(ObjNode, PROP_MULTI);
  if ExistsProperty(ObjNode, PROP_PERSISTENCE, NStringLiteral) then
    AObject.Persistence := StringToPersistenceKind(GetStringPropValue(ObjNode, PROP_PERSISTENCE));
end;

procedure RPetalReader.SetPropertyObjectDiagram(ObjNode: NObject; AObjectDiagram: RObjectDiagram);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_OBJECT_DIAGRAM);
  // set properties
  if ExistsProperty(ObjNode, PROP_MECHANISM_REF, NTag) then begin
    Obj := GetTagReferencePropValue(AObjectDiagram, ObjNode, PROP_MECHANISM_REF);
    if (Obj = nil) or not (Obj is RMechanism) then
      ReferenceNotFound(ObjNode.Name, PROP_MECHANISM_REF)
    else
      AObjectDiagram.Mechanism_ref := Obj as RMechanism;
  end;
end;

procedure RPetalReader.SetPropertyObjectView(ObjNode: NObject; AObjectView: RObjectView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_OBJECT_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_ANNOTATION, NInteger) then
    AObjectView.Annotation := GetIntegerPropValue(ObjNode, PROP_ANNOTATION);
  if ExistsProperty(ObjNode, PROP_ICON, NStringLiteral) then
    AObjectView.Icon := GetStringPropValue(ObjNode, PROP_ICON);
  if ExistsProperty(ObjNode, PROP_SUBOBJECTS, NInteger) then
    AObjectView.Subobjects := GetIntegerPropValue(ObjNode, PROP_SUBOBJECTS);
  if ExistsProperty(ObjNode, PROP_X_OFFSET, NFloat) then
    AObjectView.X_offset := GetRealPropValue(ObjNode, PROP_X_OFFSET);
  if ExistsProperty(ObjNode, PROP_Y_OFFSET, NFloat) then
    AObjectView.Y_offset := GetRealPropValue(ObjNode, PROP_Y_OFFSET);
end;

procedure RPetalReader.SetPropertyOperation(ObjNode: NObject; AOperation: ROperation);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_OPERATION);
  // set properties
  if ExistsProperty(ObjNode, PROP_RESULT, NStringLiteral) then begin
    Obj := nil;
    if ExistsProperty(ObjNode, PROP_QUIDU, NStringLiteral) then
      Obj := GetIdReferencePropValue(AOperation, ObjNode, PROP_RESULT, PROP_QUIDU);
    if Obj = nil then begin
      AOperation.Result := nil;
      AOperation.ResultExpression := GetStringPropValue(ObjNode, PROP_RESULT);
    end
    else begin
      AOperation.Result := Obj as RClass;
      AOperation.ResultExpression := (Obj as RClass).Name;
    end;
  end;
  if ExistsProperty(ObjNode, PROP_ABSTRACT, NBoolean) then
    AOperation.Abstract := GetBooleanPropValue(ObjNode, PROP_ABSTRACT);
  if ExistsProperty(ObjNode, PROP_CONCURRENCY, NStringLiteral) then
    AOperation.Concurrency := StringToConcurrencyKind(GetStringPropValue(ObjNode, PROP_CONCURRENCY));
  if ExistsProperty(ObjNode, PROP_EXCEPTIONS, NStringLiteral) then
    AOperation.Exceptions := GetStringPropValue(ObjNode, PROP_EXCEPTIONS);
  if ExistsProperty(ObjNode, PROP_PROTOCOL, NStringLiteral) then
    AOperation.Protocol := GetStringPropValue(ObjNode, PROP_PROTOCOL);
  if ExistsProperty(ObjNode, PROP_SPACE, NStringLiteral) then
    AOperation.Space := GetStringPropValue(ObjNode, PROP_SPACE);
  if ExistsProperty(ObjNode, PROP_TIME_COMPLEXITY, NStringLiteral) then
    AOperation.Time_complexity := GetStringPropValue(ObjNode, PROP_TIME_COMPLEXITY);
  if ExistsProperty(ObjNode, PROP_OP_EXPORT_CONTROL, NStringLiteral) then
    AOperation.ExportControl := StringToExportControlKind(GetStringPropValue(ObjNode, PROP_OP_EXPORT_CONTROL));
end;

procedure RPetalReader.SetPropertyParameter(ObjNode: NObject; AParameter: RParameter);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_PARAMETER);
  // set properties
  if ExistsProperty(ObjNode, PROP_TYPE, NStringLiteral) then begin
    Obj := nil;
    if ExistsProperty(ObjNode, PROP_QUIDU, NStringLiteral) then
      Obj := GetIdReferencePropValue(AParameter, ObjNode, PROP_TYPE, PROP_QUIDU);
    if Obj = nil then begin
      AParameter.Type_ := nil;
      AParameter.TypeExpression := GetStringPropValue(ObjNode, PROP_TYPE);
    end
    else begin
      AParameter.Type_ := Obj as RClass;
      AParameter.TypeExpression := (Obj as RClass).Name;
    end;
  end;
  if ExistsProperty(ObjNode, PROP_INITV, NStringLiteral) then
    AParameter.Initv := GetStringPropValue(ObjNode, PROP_INITV);
end;

procedure RPetalReader.SetPropertyParameterized_Class(ObjNode: NObject; AParameterized_Class: RParameterized_Class);
begin
  // preconditions
   Assert((ObjNode.Name = OBJ_PARAMETERIZED_CLASS) or (ObjNode.Name = OBJ_PARAMETERIZED_CLASS_UTILITY));
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyParameterized_Class_Utility(ObjNode: NObject; AParameterized_Class_Utility: RParameterized_Class_Utility);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_PARAMETERIZED_CLASS_UTILITY);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyPartition(ObjNode: NObject; APartition: RPartition);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_PARTITION);
  // set properties
  if ExistsProperty(ObjNode, PROP_CLASS, NStringLiteral) then begin
    Obj := GetAdjacentIdReferencePropValue(APartition, ObjNode, PROP_CLASS, PROP_QUIDU);
    if (Obj = nil) or not (Obj is RClass) then
      ReferenceNotFound(ObjNode.Name, PROP_CLASS)
    else
      APartition.Class_ := Obj as RClass;
  end;
  if ExistsProperty(ObjNode, PROP_CREATION_OBJ, NBoolean) then
    APartition.CreationObj := GetBooleanPropValue(ObjNode, PROP_CREATION_OBJ);
  if ExistsProperty(ObjNode, PROP_MULTI, NBoolean) then
    APartition.Multi := GetBooleanPropValue(ObjNode, PROP_MULTI);
  if ExistsProperty(ObjNode, PROP_PERSISTENCE, NStringLiteral) then
    APartition.Persistence := StringToPersistenceKind(GetStringPropValue(ObjNode, PROP_PERSISTENCE));
end;

procedure RPetalReader.SetPropertyPetal(ObjNode: NObject; APetal: RPetal);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_PETAL);
  // set properties
  if ExistsProperty(ObjNode, PROP_WRITTEN, NStringLiteral) then
    APetal._written := GetStringPropValue(ObjNode, PROP_WRITTEN);
  if ExistsProperty(ObjNode, PROP_CHARSET, NInteger) then
    APetal.CharSet := GetIntegerPropValue(ObjNode, PROP_CHARSET);
  if ExistsProperty(ObjNode, PROP_VERSION, NInteger) then
    APetal.Version := GetIntegerPropValue(ObjNode, PROP_VERSION);
end;

procedure RPetalReader.SetPropertyProcess(ObjNode: NObject; AProcess: RProcess);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_PROCESS);
  // set properties
  if ExistsProperty(ObjNode, PROP_PRIORITY, NStringLiteral) then
    AProcess.Priority := GetStringPropValue(ObjNode, PROP_PRIORITY);
end;

procedure RPetalReader.SetPropertyProcess_Diagram(ObjNode: NObject; AProcess_Diagram: RProcess_Diagram);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_PROCESS_DIAGRAM);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyProcesses(ObjNode: NObject; AProcesses: RProcesses);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_PROCESSES);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyProcessor(ObjNode: NObject; AProcessor: RProcessor);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_PROCESSOR);
  // set properties
  if ExistsProperty(ObjNode, PROP_SCHEDULING, NStringLiteral) then
    AProcessor.Scheduling := StringToProcessorSchedulingKind(GetStringPropValue(ObjNode, PROP_SCHEDULING));
end;

procedure RPetalReader.SetPropertyProcessorView(ObjNode: NObject; AProcessorView: RProcessorView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_PROCESSOR_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_ANNOTATION, NInteger) then
    AProcessorView.Annotation := GetIntegerPropValue(ObjNode, PROP_ANNOTATION);
end;

procedure RPetalReader.SetPropertyProperties(ObjNode: NObject; AProperties: RProperties);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_PROPERTIES);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyRealize_Relationship(ObjNode: NObject; ARealize_Relationship: RRealize_Relationship);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_REALIZE_RELATIONSHIP);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyRealizeView(ObjNode: NObject; ARealizeView: RRealizeView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_REALIZE_VIEW);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyRole(ObjNode: NObject; ARole: RRole);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ROLE);
  // set properties
  if ExistsProperty(ObjNode, PROP_CONSTRAINTS, NStringLiteral) then
    ARole.Constraints := GetStringPropValue(ObjNode, PROP_CONSTRAINTS);
  if ExistsProperty(ObjNode, PROP_CONTAINMENT, NStringLiteral) then
    ARole.Containment := StringToContainmentKind(GetStringPropValue(ObjNode, PROP_CONTAINMENT));
  if ExistsProperty(ObjNode, PROP_CLIENT_CARDINALITY, NValue) then
    ARole.client_cardinality := GetValuePropValue(ObjNode, PROP_CLIENT_CARDINALITY);
  if ExistsProperty(ObjNode, PROP_IS_AGGREGATE, NBoolean) then
    ARole.Is_aggregate := GetBooleanPropValue(ObjNode, PROP_IS_AGGREGATE);
  if ExistsProperty(ObjNode, PROP_IS_NAVIGABLE, NBoolean) then
    ARole.Is_navigable := GetBooleanPropValue(ObjNode, PROP_IS_NAVIGABLE);
  if ExistsProperty(ObjNode, PROP_IS_PRICIPAL, NBoolean) then
    ARole.Is_principal := GetBooleanPropValue(ObjNode, PROP_IS_PRICIPAL);
  if ExistsProperty(ObjNode, PROP_STATIC, NBoolean) then
    ARole.Static := GetBooleanPropValue(ObjNode, PROP_STATIC);
end;

procedure RPetalReader.SetPropertyRoleView(ObjNode: NObject; ARoleView: RRoleView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_ROLE_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_LOCATION, NLocation) then
    ARoleView.Location := GetLocationPropValue(ObjNode, PROP_LOCATION);
end;

procedure RPetalReader.SetPropertySegLabel(ObjNode: NObject; ASegLabel: RSegLabel);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_SEG_LABEL);
  // set properties
  if ExistsProperty(ObjNode, PROP_ANCHOR, NInteger) then
    ASegLabel.Anchor := GetIntegerPropValue(ObjNode, PROP_ANCHOR);
  if ExistsProperty(ObjNode, PROP_ANCHOR_LOC, NInteger) then
    ASegLabel.Anchor_loc := GetIntegerPropValue(ObjNode, PROP_ANCHOR_LOC);
  if ExistsProperty(ObjNode, PROP_HIDDEN, NBoolean) then
    ASegLabel.Hidden := GetBooleanPropValue(ObjNode, PROP_HIDDEN);
  if ExistsProperty(ObjNode, PROP_JUSTIFY, NInteger) then
    ASegLabel.Justify := GetIntegerPropValue(ObjNode, PROP_JUSTIFY);
  if ExistsProperty(ObjNode, PROP_LABEL2, NStringLiteral) then
    ASegLabel.Label_ := GetStringPropValue(ObjNode, PROP_LABEL2);
  if ExistsProperty(ObjNode, PROP_MAX_WIDTH, NInteger) then
    ASegLabel.Max_width := GetIntegerPropValue(ObjNode, PROP_MAX_WIDTH);
  if ExistsProperty(ObjNode, PROP_NLINES, NInteger) then
    ASegLabel.Nlines := GetIntegerPropValue(ObjNode, PROP_NLINES);
  if ExistsProperty(ObjNode, PROP_ORIENTATION, NInteger) then
    ASegLabel.Orientation := GetIntegerPropValue(ObjNode, PROP_ORIENTATION);
  if ExistsProperty(ObjNode, PROP_PCT_DIST, NFloat) then
    ASegLabel.PctDist := GetRealPropValue(ObjNode, PROP_PCT_DIST);
end;

procedure RPetalReader.SetPropertySelfMessView(ObjNode: NObject; ASelfMessView: RSelfMessView);
var
  Obj: RPetalObject;
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_SELF_MESS_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_FOCUS_ENTRY, NTag) then begin
    Obj := GetTagReferencePropValue(ASelfMessView, ObjNode, PROP_FOCUS_ENTRY);
    if (Obj = nil) or not (Obj is RFocus_Of_Control) then
      ReferenceNotFound(ObjNode.Name, PROP_FOCUS_ENTRY)
    else
      ASelfMessView.Focus_Entry := Obj as RFocus_Of_Control;
  end;
  if ExistsProperty(ObjNode, PROP_FOCUS_SRC, NTag) then begin
    Obj := GetTagReferencePropValue(ASelfMessView, ObjNode, PROP_FOCUS_SRC);
    if (Obj = nil) or not (Obj is RFocus_Of_Control) then
      ReferenceNotFound(ObjNode.Name, PROP_FOCUS_SRC)
    else
      ASelfMessView.Focus_Src := Obj as RFocus_Of_Control;
  end;
  if ExistsProperty(ObjNode, PROP_ORDINAL, NInteger) then
    ASelfMessView.Ordinal := GetIntegerPropValue(ObjNode, PROP_ORDINAL);
  if ExistsProperty(ObjNode, PROP_ORIGIN, NLocation) then
    ASelfMessView.Origin := GetLocationPropValue(ObjNode, PROP_ORIGIN);
  if ExistsProperty(ObjNode, PROP_TERMINUS, NLocation) then
    ASelfMessView.Terminus := GetLocationPropValue(ObjNode, PROP_TERMINUS);
end;

procedure RPetalReader.SetPropertySelfTransView(ObjNode: NObject; ASelfTransView: RSelfTransView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_SELF_TRANS_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_LOCATION, NLocation) then
    ASelfTransView.Location := GetLocationPropValue(ObjNode, PROP_LOCATION);
end;

procedure RPetalReader.SetPropertySemantic_Info(ObjNode: NObject; ASemantic_Info: RSemantic_Info);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_SEMANTIC_INFO);
  // set properties
  if ExistsProperty(ObjNode, PROP_PDL, NStringLiteral) then
    ASemantic_Info.PDL := GetStringPropValue(ObjNode, PROP_PDL);
  // property 'diagram_ref' is ommitted.
end;

procedure RPetalReader.SetPropertySendEvent(ObjNode: NObject; ASendEvent: RSendEvent);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_SEND_EVENT);
  // set properties
  if ExistsProperty(ObjNode, PROP_PARAMETERS2, NStringLiteral) then
    ASendEvent.Parameters := GetStringPropValue(ObjNode, PROP_PARAMETERS2);
  if ExistsProperty(ObjNode, PROP_TARGET, NStringLiteral) then
    ASendEvent.Target := GetStringPropValue(ObjNode, PROP_TARGET);
end;

procedure RPetalReader.SetPropertyState(ObjNode: NObject; AState: RState);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_STATE);
  // set properties
  if ExistsProperty(ObjNode, PROP_TYPE2, NStringLiteral) then
    AState.Type_ := StringToStateKind(GetStringPropValue(ObjNode, PROP_TYPE2));
end;

procedure RPetalReader.SetPropertyState_Diagram(ObjNode: NObject; AState_Diagram: RState_Diagram);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_STATE_DIAGRAM);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyState_Machine(ObjNode: NObject; AState_Machine: RState_Machine);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_STATE_MACHINE);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyState_Transition(ObjNode: NObject; AState_Transition: RState_Transition);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_STATE_TRANSITION);
  // set properties
  if ExistsProperty(ObjNode, PROP_CONDITION, NStringLiteral) then
    AState_Transition.Condition := GetStringPropValue(ObjNode, PROP_CONDITION);
end;

procedure RPetalReader.SetPropertyStateView(ObjNode: NObject; AStateView: RStateView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_STATE_VIEW);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertySubSystem(ObjNode: NObject; ASubSystem: RSubSystem);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_SUBSYSTEM);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertySubSysView(ObjNode: NObject; ASubSysView: RSubSysView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_SUBSYS_VIEW);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertySwimlane(ObjNode: NObject; ASwimlane: RSwimlane);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_SWIMLANE);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertySynchronizationState(ObjNode: NObject; ASynchronizationState: RSynchronizationState);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_SYNCHRONIZATION_STATE);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertySynchronizationView(ObjNode: NObject; ASynchronizationView: RSynchronizationView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_SYNCHRONIZATION_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_SYNC_FLOW_DIRECTION, NInteger) then
    ASynchronizationView.Sync_flow_direction := IntegerToSynchFlowDirectionKind(GetIntegerPropValue(ObjNode, PROP_SYNC_FLOW_DIRECTION));
  if ExistsProperty(ObjNode, PROP_SYNC_IS_HORIZONTAL, NBoolean) then
    ASynchronizationView.Sync_is_horizontal := GetBooleanPropValue(ObjNode, PROP_SYNC_IS_HORIZONTAL);
end;

procedure RPetalReader.SetPropertyTier_Diagram(ObjNode: NObject; ATier_Diagram: RTier_Diagram);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_TIER_DIAGRAM);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyTierView(ObjNode: NObject; ATierView: RTierView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_TIER_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_HIDDEN, NBoolean) then
    ATierView.Hidden := GetBooleanPropValue(ObjNode, PROP_HIDDEN);
end;

procedure RPetalReader.SetPropertyTransView(ObjNode: NObject; ATransView: RTransView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_TRANS_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_X_OFFSET2, NBoolean) then
    ATransView.X_offset := GetBooleanPropValue(ObjNode, PROP_X_OFFSET2);
end;

procedure RPetalReader.SetPropertyUseCase(ObjNode: NObject; AUseCase: RUseCase);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_USE_CASE);
  // set properties
  if ExistsProperty(ObjNode, PROP_ABSTRACT, NBoolean) then
    AUseCase.Abstract := GetBooleanPropValue(ObjNode, PROP_ABSTRACT);
  if ExistsProperty(ObjNode, PROP_RANK, NStringLiteral) then
    AUseCase.Rank := GetStringPropValue(ObjNode, PROP_RANK);
end;

procedure RPetalReader.SetPropertyUseCaseDiagram(ObjNode: NObject; AUseCaseDiagram: RUseCaseDiagram);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_USE_CASE_DIAGRAM);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyUseCaseView(ObjNode: NObject; AUseCaseView: RUseCaseView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_USE_CASE_VIEW);
  // set properties
  if ExistsProperty(ObjNode, PROP_ICON, NStringLiteral) then
    AUseCaseView.Icon := GetStringPropValue(ObjNode, PROP_ICON);
end;

procedure RPetalReader.SetPropertyUses_Relationship(ObjNode: NObject; AUses_Relationship: RUses_Relationship);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_USES_RELATIONSHIP);
  // set properties
  if ExistsProperty(ObjNode, PROP_FRIEND, NBoolean) then
    AUses_Relationship.Friend := GetBooleanPropValue(ObjNode, PROP_FRIEND);
  if ExistsProperty(ObjNode, PROP_CLIENT_CARDINALITY, NValue) then
    AUses_Relationship.Client_cardinality := GetValuePropValue(ObjNode, PROP_CLIENT_CARDINALITY);
  if ExistsProperty(ObjNode, PROP_SUPPLIER_CARDINALITY, NValue) then
    AUses_Relationship.Supplier_cardinality := GetValuePropValue(ObjNode, PROP_SUPPLIER_CARDINALITY);
end;

procedure RPetalReader.SetPropertyUsesView(ObjNode: NObject; AUsesView: RUsesView);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_USES_VIEW);
  // set properties (nothing)
end;

procedure RPetalReader.SetPropertyVisibility_Relationship(ObjNode: NObject; AVisibility_Relationship: RVisibility_Relationship);
begin
  // preconditions
  Assert(ObjNode.Name = OBJ_VISIBILITY_RELATIONSHIP);
  // set properties (nothing)
end;

//  RPetalReader
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//  RPetalDocument

constructor RPetalDocument.Create;
begin
  Pgmr := TPgmr.Create(Application);
  ObjFactory := RPetalObjectFactory.Create;
end;

destructor RPetalDocument.Destroy;
begin
  Clear;
  Pgmr.Free;
  ObjFactory.Free;
  inherited;
end;

procedure RPetalDocument.Clear;
begin
  if FPetal <> nil then begin
    FPetal.Free;
    FPetal := nil;
  end;
  if FDesign <> nil then begin
    FDesign.Free;
    FDesign := nil;
  end;
end;

procedure RPetalDocument.SetPetal(APetal: RPetal);
begin
  if FPetal <> APetal then
    FPetal := APetal;
end;

procedure RPetalDocument.SetDesign(ADesign: RDesign);
begin
  if FDesign <> ADesign then
    FDesign := ADesign;
end;

procedure RPetalDocument.HandleProgress(Sender: TObject; Pos, Max: Integer; Msg: string);
begin
  if Assigned(FOnProgress) then
    FOnProgress(Self, Pos, Max, Msg);
end;

procedure RPetalDocument.HandleLog(Sender: TObject; Msg: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg);
end;

procedure RPetalDocument.ReadFromFile(FN: string);
var
  Reader: RPetalReader;
begin
  Reader := RPetalReader.Create(Self);
  Reader.OnProgress := HandleProgress;
  Reader.OnLog := HandleLog;    
  Reader.ReadFromFile(FN);
  Reader.Free;
end;

//  RPetalDocument
////////////////////////////////////////////////////////////////////////////////

end.
