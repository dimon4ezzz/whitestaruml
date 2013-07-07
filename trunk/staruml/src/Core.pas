unit Core;

{ ****************************************************************************** }
{ }
{ StarUML - The Open Source UML/MDA Platform. }
{ }
{ Copyright (C) 2002-2005 - Plastic Software, Inc. }
{ }
{ }
{ This program is free software; you can redistribute it and/or modify it }
{ under the terms of the GNU General Public License as published by the Free }
{ Software Foundation; either version 2 of the License, or (at your option) }
{ any later version. }
{ }
{ This program is distributed in the hope that it will be useful, but WITHOUT }
{ ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or }
{ FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for }
{ more details. }
{ }
{ You should have received a copy of the GNU General Public License along with }
{ this program; if not, write to the Free Software Foundation, Inc., 51 }
{ Franklin St, Fifth Floor, Boston, MA 02110-1301 USA }
{ }
{ Linking StarUML statically or dynamically with other modules is making a }
{ combined work based on StarUML. Thus, the terms and conditions of the GNU }
{ General Public License cover the whole combination. }
{ }
{ In addition, as a special exception, Plastic Software give you permission to }
{ combine StarUML program with free software programs or libraries that are }
{ released under the GNU LGPL/Mozilla/Apache/BSD and with code included in the }
{ standard release of ExpressBar, ExpressNavBar, ExpressInspector, }
{ ExpressPageControl, ProGrammar, NextGrid under the commercial license (or }
{ modified versions of such code, with unchanged license). You may copy and }
{ distribute such a system following the terms of the GNU GPL for StarUML and }
{ the licenses of the other code concerned, provided that you include the }
{ source code of that other code when and as the GNU GPL requires distribution }
{ of source code. Plastic Software also give you permission to combine StarUML }
{ program with dynamically linking plug-in (or add-in) programs that are }
{ released under the GPL-incompatible and proprietary license. }
{ }
{ Note that people who make modified versions of StarUML are not obligated to }
{ grant this special exception for their modified versions; it is their choice }
{ whether to do so. The GNU General Public License gives permission to release }
{ a modified version without this exception; this exception also makes it }
{ possible to release a modified version which carries forward this exception. }
{ ****************************************************************************** }

{ ******************************************************************************
  NOTE
  ------------------------------------------------------------------------------
  All Descendant of PElements satisfy below conditions (= Modeling Element)

  1. All attributes satisfy below coding convention.
  - property <Attr>:<Type> read Get...(or F...) write Set... (Getter/Setter)
  2. All references satisfy below coding convention.
  - property <Ref>:<Type> read Get... (or F...) write Set... (Getter/Setter)
  2. All collections satisfy below coding conventions.
  - property <Col>[Index: Integer]:<Type> read Get...; (only Getter)
  - property <Col>Count: Integer read Get...; (only Getter)
  - procedure Clear...
  - procedure Add...
  - procedure Remove...
  - procedure Insert...
  - procedure Delete...
  - function IndexOf...
  ****************************************************************************** }

interface

uses
  Graphics, Types, Classes, xmldom, XMLIntf, msxmldom, XMLDoc, ComObj, IniFiles,
  Generics.Collections, BasicClasses, GraphicClasses, Windows, SysUtils;

const
  PATH_DELIMITER = '::';

  XPD_PREFIX = 'XPD';
  XPD_NAMESPACE_URI = 'http://www.staruml.com';
  XPD_HEADER = 'HEADER';
  XPD_BODY = 'BODY';
  XPD_OBJECT = 'OBJ';
  XPD_ATTRIBUTE = 'ATTR';
  XPD_REFERENCE = 'REF';
  XPD_DOCUMENT_ELEMENT = 'DocumentElement';
  XPD_NAME = 'name';
  XPD_PATHNAME = 'pathname';
  XPD_GUID = 'guid';
  XPD_TYPE = 'type';
  XPD_VERSION = 'version';
  XPD_INTEGER = 'integer';
  XPD_BOOLEAN = 'boolean';
  XPD_STRING = 'string';
  XPD_REAL = 'real';

  XPD_ERR_ATTRIBUTE_REQUIRED = '<ATTR> is required';
  XPD_ERR_OBJECT_REQUIRED = '<OBJ> is required';
  XPD_ERR_REFERENCE_REQUIRED = '<REF> is required';
  XPD_ERR_INVALID_INTEGER_TYPE = 'Invalid integer type';
  XPD_ERR_INVALID_BOOLEAN_TYPE = 'Invalid boolean type';
  XPD_ERR_INVALID_REAL_TYPE = 'Invalid real type';
  XPD_ERR_INVALID_STRING_TYPE = 'Invalid string type';
  XPD_ERR_INVALID_USERDEFINED_TYPE = 'Invalid user-defined type';

  DEFAULT_XML_VERSION = '1.0';
  DEFAULT_XML_ENCODING = 'UTF-8';
  MAX_ASYNC_LOAD_STATE = 4;

  RK_BASE_LOCATION = '\SOFTWARE\WhiteStarUML\';

type
  // Forward Declarations
  PElement = class;
  PVisitor = class;
  PMemento = class;
  PModel = class;
  PView = class;
  PDiagram = class;
  PDiagramView = class;
  PDocument = class;

  // Parametrized collections of Core types
  PModelOrderedSet = POrderedSet<PModel>;
  PViewOrderedSet = POrderedSet<PView>;


  // Exceptions
  EInvalidFileFormat = class(Exception);
    EFileNotFound = class(Exception);
    EReadOnlyFile = class(Exception);
    EMetaException = class(Exception);
    EMetaAttributeNotExist = class(EMetaException);
    EMetaReferenceNotExist = class(EMetaException);
    EMetaCollectionNotExist = class(EMetaException);
    EMetaClassifierNotExist = class(EMetaException);
    EInvalidName = class(Exception);
    EReadOnlyDocument = class(Exception);

    // Enumeration Types
    PMetaAggregateKind = (makNone, makAggregate, makComposite);
    PMetaAssociationEndKind = (maeReference, maeCollection);
    PFileAccessType = (fatNormal,fatExclusive);

    // Event Types
    PXMLObjectWriterFilter = procedure(Sender: TObject; CurrentObject: PObject;
      Key: string; var CanFilter: Boolean) of object;
    PElementEvent = procedure(Sender: TObject; Element: PElement) of object;
    PElementAttributeEvent = procedure(Sender: TObject; Element: PElement;
      Key, Value: string) of object;
    PElementsAttributeEvent = procedure(Sender: TObject; Elements: POrderedSet;
      Key, Value: string) of object;
    PElementReferenceEvent = procedure(Sender: TObject; Element: PElement;
      Key: string; Value: PElement) of object;
    PElementsReferenceEvent = procedure(Sender: TObject; Elements: POrderedSet;
      Key: string; Value: PElement) of object;
    PModelEvent = procedure(Sender: TObject; Model: PModel) of object;
    PViewEvent = procedure(Sender: TObject; View: PView) of object;
    PDiagramEvent = procedure(Sender: TObject; Diagram: PDiagram) of object;
    PModelsEvent = procedure(Sender: TObject; Models: PModelOrderedSet) of object;
    PViewsEvent = procedure(Sender: TObject; Views: PViewOrderedSet) of object;
    PModelsViewsEvent = procedure(Sender: TObject; Models: PModelOrderedSet;
      Views: PViewOrderedSet) of object;
    PModelNameEvent = procedure(Sender: TObject; Model: PModel;
      Name: string) of object;
    PProgressEvent = procedure(Sender: TObject; Info: string;
      Max, Progress: Integer) of object;
    PDocumentEvent = procedure(Sender: TObject; Document: PDocument) of object;

    // Class Types
    PElementClass = class of PElement;

  // PMetaElement
  PMetaElement = class(PObject)
  private
    FName: string;
  public
    constructor Create; override;
    property Name: string read FName write FName;
  end;

  // PMetaClassifier
  PMetaClassifier = class(PMetaElement)
  end;

  // PMetaSlot
  PMetaSlot = class(PMetaElement)
  private
    FTypeRef: PMetaClassifier;
    FIsReadOnly: Boolean;
    FIsDerived: Boolean;
  public
    property TypeRef: PMetaClassifier read FTypeRef write FTypeRef;
    property IsReadOnly: Boolean read FIsReadOnly write FIsReadOnly;
    property IsDerived: Boolean read FIsDerived write FIsDerived;
  end;

  // PMetaAttribute
  PMetaAttribute = class(PMetaSlot)
  private
    FDefaultValue: string;
  public
    property DefaultValue: string read FDefaultValue write FDefaultValue;
  end;

  // PMetaAssociationEnd
  PMetaAssociationEnd = class(PMetaSlot)
  private
    FKind: PMetaAssociationEndKind;
    FAggregate: PMetaAggregateKind;
    FOtherSide: string;
    FOtherSideKind: PMetaAssociationEndKind;
  public
    constructor Create; override;
    function GetOtherSideEnd: PMetaAssociationEnd;
    property Kind: PMetaAssociationEndKind read FKind;
    property Aggregate: PMetaAggregateKind read FAggregate write FAggregate;
    property OtherSide: string read FOtherSide write FOtherSide;
    property OtherSideKind: PMetaAssociationEndKind read FOtherSideKind write
      FOtherSideKind;
  end;

  // PMetaReference
  PMetaReference = class(PMetaAssociationEnd)
  public
    constructor Create; override;
  end;

  // PMetaCollection
  PMetaCollection = class(PMetaAssociationEnd)
  public
    constructor Create; override;
  end;

  // PMetaClass
  PMetaClass = class(PMetaClassifier)
  private
    FInstances: TList;
    FElementClass: PElementClass;
    FIsAbstract: Boolean;
    FMetaAttributes: TList;
    FMetaReferences: TList;
    FMetaCollections: TList;
    FSuperclass: PMetaClass;
    FSubclasses: TList;
    function GetOwnMetaAttribute(Index: Integer): PMetaAttribute;
    function GetOwnMetaAttributeCount: Integer;
    function GetOwnMetaReference(Index: Integer): PMetaReference;
    function GetOwnMetaReferenceCount: Integer;
    function GetOwnMetaCollection(Index: Integer): PMetaCollection;
    function GetOwnMetaCollectionCount: Integer;
    function GetMetaAttribute(Index: Integer): PMetaAttribute;
    function GetMetaAttributeCount: Integer;
    function GetMetaReference(Index: Integer): PMetaReference;
    function GetMetaReferenceCount: Integer;
    function GetMetaCollection(Index: Integer): PMetaCollection;
    function GetMetaCollectionCount: Integer;
    function GetInstance(Index: Integer): PElement;
    function GetInstanceCount: Integer;
    function GetInclusiveInstance(Index: Integer): PElement;
    function GetInclusiveInstanceCount: Integer;
    procedure SetSuperclass(Value: PMetaClass);
    function GetSubclass(Index: Integer): PMetaClass;
    function GetSubclassCount: Integer;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure ClearInstances;
    function CreateInstance(AGuid: string = ''): PElement;
    procedure DeleteInstance(AElement: PElement);
    function FindInstanceByGuid(AGuid: string): PElement;
    function FindInstanceByGuidRecurse(AGuid: string): PElement;
    function IsKindOf(AName: string): Boolean;
    function ExistsAttribute(Name: string): Boolean;
    function ExistsReference(Name: string): Boolean;
    function ExistsCollection(Name: string): Boolean;
    function GetAttributeByName(Name: string): PMetaAttribute;
    function GetReferenceByName(Name: string): PMetaReference;
    function GetCollectionByName(Name: string): PMetaCollection;
    function GetContainerRelation(Container: PMetaClass): PMetaReference;
    procedure Empty;
    procedure AddMetaAttribute(AMetaAttribute: PMetaAttribute);
    procedure RemoveMetaAttribute(AMetaAttribute: PMetaAttribute);
    procedure AddMetaReference(AMetaReference: PMetaReference);
    procedure RemoveMetaReference(AMetaReference: PMetaReference);
    procedure AddMetaCollection(AMetaCollection: PMetaCollection);
    procedure RemoveMetaCollection(AMetaCollection: PMetaCollection);
    property ElementClass: PElementClass read FElementClass write FElementClass;
    property IsAbstract: Boolean read FIsAbstract write FIsAbstract;
    property OwnMetaAttributes[Index: Integer]
      : PMetaAttribute read GetOwnMetaAttribute;
    property OwnMetaAttributeCount: Integer read GetOwnMetaAttributeCount;
    property OwnMetaReferences[Index: Integer]
      : PMetaReference read GetOwnMetaReference;
    property OwnMetaReferenceCount: Integer read GetOwnMetaReferenceCount;
    property OwnMetaCollections[Index: Integer]
      : PMetaCollection read GetOwnMetaCollection;
    property OwnMetaCollectionCount: Integer read GetOwnMetaCollectionCount;
    property MetaAttributes[Index: Integer]
      : PMetaAttribute read GetMetaAttribute;
    property MetaAttributeCount: Integer read GetMetaAttributeCount;
    property MetaReferences[Index: Integer]
      : PMetaReference read GetMetaReference;
    property MetaReferenceCount: Integer read GetMetaReferenceCount;
    property MetaCollections[Index: Integer]
      : PMetaCollection read GetMetaCollection;
    property MetaCollectionCount: Integer read GetMetaCollectionCount;
    property Instances[Index: Integer]: PElement read GetInstance;
    property InstanceCount: Integer read GetInstanceCount;
    property InclusiveInstances[Index: Integer]
      : PElement read GetInclusiveInstance;
    property InclusiveInstanceCount: Integer read GetInclusiveInstanceCount;
    property Superclass: PMetaClass read FSuperclass write SetSuperclass;
    property Subclasses[Index: Integer]: PMetaClass read GetSubclass;
    property SubclassCount: Integer read GetSubclassCount;
  end;

  // PMetaLiteral
  PMetaLiteral = class(PMetaElement)
  end;

  // PMetaEnumeration
  PMetaEnumeration = class(PMetaClassifier)
  private
    FMetaLiterals: TList;
    function GetMetaLiteral(Index: Integer): PMetaLiteral;
    function GetMetaLiteralCount: Integer;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Empty;
    procedure AddMetaLiteral(AMetaLiteral: PMetaLiteral);
    procedure RemoveMetaLiteral(AMetaLiteral: PMetaLiteral);
    property MetaLiterals[Index: Integer]: PMetaLiteral read GetMetaLiteral;
    property MetaLiteralCount: Integer read GetMetaLiteralCount;
  end;

  // PMetaPrimitiveType
  PMetaPrimitiveType = class(PMetaClassifier)
  end;

  // PMetaDataType
  PMetaDataType = class(PMetaClassifier)
  end;

  // PMetaModel
  PMetaModel = class(PMetaElement)
  private
    FMetaClasses: THashedStringList;
    FMetaPrimitiveTypes: THashedStringList;
    FMetaDataTypes: THashedStringList;
    FMetaEnumerations: THashedStringList;
    function GetMetaClass(Index: Integer): PMetaClass;
    function GetMetaClassCount: Integer;
    function GetMetaPrimitiveType(Index: Integer): PMetaPrimitiveType;
    function GetMetaPrimitiveTypeCount: Integer;
    function GetMetaDataType(Index: Integer): PMetaDataType;
    function GetMetaDataTypeCount: Integer;
    function GetMetaEnumeration(Index: Integer): PMetaEnumeration;
    function GetMetaEnumerationCount: Integer;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Empty;
    function IsKindOf(SubName, SuperName: string): Boolean;
    procedure ClearInstances;
    function CreateInstance(AMetaClassName: string;
      AGuid: string = ''): PElement;
    function FindInstanceByGuid(AGuid: string): PElement;
    procedure AddMetaClass(AMetaClass: PMetaClass);
    procedure RemoveMetaClass(AMetaClass: PMetaClass);
    function IndexOfMetaClass(AMetaClass: PMetaClass): Integer;
    procedure AddMetaPrimitiveType(AMetaPrimitiveType: PMetaPrimitiveType);
    procedure RemoveMetaPrimitiveType(AMetaPrimitiveType: PMetaPrimitiveType);
    function IndexOfMetaPrimitiveType(AMetaPrimitiveType: PMetaPrimitiveType)
      : Integer;
    procedure AddMetaDataType(AMetaDataType: PMetaDataType);
    procedure RemoveMetaDataType(AMetaDataType: PMetaDataType);
    function IndexOfMetaDataType(AMetaDataType: PMetaDataType): Integer;
    procedure AddMetaEnumeration(AMetaEnumeration: PMetaEnumeration);
    procedure RemoveMetaEnumeration(AMetaEnumeration: PMetaEnumeration);
    function IndexOfMetaEnumeration(AMetaEnumeration: PMetaEnumeration)
      : Integer;
    function FindMetaClassifier(AName: string): PMetaClassifier;
    function FindMetaPrimitiveType(AName: string): PMetaPrimitiveType;
    function FindMetaDataType(AName: string): PMetaDataType;
    function FindMetaEnumeration(AName: string): PMetaEnumeration;
    function FindMetaClass(AName: string): PMetaClass;
    function DefineMetaPrimitiveType(AName: string): PMetaPrimitiveType;
    function DefineMetaDataType(AName: string): PMetaDataType;
    function DefineMetaEnumeration(AName: string): PMetaEnumeration;
    function DefineMetaClass(AElementClass: PElementClass; AName: string;
      Abst: Boolean): PMetaClass;
    procedure DefineMetaAttribute(AMetaClass: PMetaClass;
      AName, ATypeName: string; AReadOnly, ADerived: Boolean;
      ADefaultValue: string = '');
    procedure DefineMetaReference(AMetaClass: PMetaClass;
      AName, ATypeName: string; AReadOnly, ADerived: Boolean;
      Aggr: PMetaAggregateKind; OtherSide: string = '';
      OtherSideKind: PMetaAssociationEndKind = maeReference);
    procedure DefineMetaCollection(AMetaClass: PMetaClass;
      AName, ATypeName: string; AReadOnly, ADerived: Boolean;
      Aggr: PMetaAggregateKind; OtherSide: string = '';
      OtherSideKind: PMetaAssociationEndKind = maeReference);
    procedure DefineMetaLiteral(AMetaEnumeration: PMetaEnumeration;
      AName: string);
    procedure DefineMetaInheritance(SuperclassName, SubclassName: string);
    property MetaClasses[Index: Integer]: PMetaClass read GetMetaClass;
    property MetaClassCount: Integer read GetMetaClassCount;
    property MetaPrimitiveTypes[Index: Integer]
      : PMetaPrimitiveType read GetMetaPrimitiveType;
    property MetaPrimitiveTypeCount: Integer read GetMetaPrimitiveTypeCount;
    property MetaDataTypes[Index: Integer]: PMetaDataType read GetMetaDataType;
    property MetaDataTypeCount: Integer read GetMetaDataTypeCount;
    property MetaEnumerations[Index: Integer]
      : PMetaEnumeration read GetMetaEnumeration;
    property MetaEnumerationCount: Integer read GetMetaEnumerationCount;
  end;

  // PExtendedAttribute
  PExtendedAttribute = class
  private
    FKey: string;
    FValue: string;
    function GetAsInteger: Integer;
    function GetAsBoolean: Boolean;
    function GetAsFloat: Extended;
    procedure SetAsInteger(Value: Integer);
    procedure SetAsBoolean(Value: Boolean);
    procedure SetAsFloat(Value: Extended);
  public
    constructor Create(AKey, AValue: string);
    property Key: string read FKey write FKey;
    property Value: string read FValue write FValue;
    property AsString: string read FValue write FValue;
    property AsInteger: Integer read GetAsInteger write SetAsInteger;
    property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
    property AsFloat: Extended read GetAsFloat write SetAsFloat;
  end;

  // PElement
  PElement = class(PObject)
  private type
    PExtendedAttributeList = TList<PExtendedAttribute>;
  private
    FTag: string;
    FMetaClass: PMetaClass;
    FDocument: PDocument;
    FExtendedAttributeList: PExtendedAttributeList;
    procedure SetTag(Value: string);
    function GetReadOnly: Boolean;
    procedure SetMetaClass(Value: PMetaClass);
    procedure SetDocument(Value: PDocument);
    function FindExtendedAttribute(Key: string): PExtendedAttribute;
    function GetExtendedAttribute(Key: string): PExtendedAttribute;
  protected
    // Follwing method is provision for changement in next version
    procedure BeforeStore(Reader: PObjectWriter); virtual;
    procedure BeforeLoad(Reader: PObjectReader); virtual;
    procedure AfterStore(Reader: PObjectWriter); virtual;
    procedure AfterLoad(Reader: PObjectReader); virtual;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure BeforeDestruction; override;
    procedure Store(Writer: PObjectWriter); override;
    procedure Load(Reader: PObjectReader); override;
    procedure Isolate; virtual;
    procedure Accept(Visitor: PVisitor); virtual;
    function CreateMemento: PMemento; virtual;
    procedure SetMemento(Memento: PMemento);
    function IsDocumentElement: Boolean;
    function GetContainingDocument: PDocument; virtual;
    procedure ClearExtendedAttributes;
    function GetExtendedAttributeAt(Index: Integer): PExtendedAttribute;
    function GetExtendedAttributeCount: Integer;
    procedure AddExtendedAttribute(Key, Value: string);
    function MOF_GetAttribute(Name: string): string; virtual;
    procedure MOF_SetAttribute(Name, Value: string); virtual;
    function MOF_GetReference(Name: string): PElement; virtual;
    procedure MOF_SetReference(Name: string; Value: PElement); virtual;
    procedure MOF_AddCollectionItem(Name: string; Value: PElement); virtual;
    procedure MOF_RemoveCollectionItem(Name: string; Value: PElement); virtual;
    procedure MOF_InsertCollectionItem(Name: string; Index: Integer;
      Value: PElement); virtual;
    procedure MOF_DeleteCollectionItem(Name: string; Index: Integer); virtual;
    procedure MOF_ClearCollection(Name: string); virtual;
    function MOF_IndexOfCollectionItem(Name: string; Value: PElement): Integer;
      virtual;
    function MOF_GetCollectionItem(Name: string; Index: Integer): PElement;
      virtual;
    function MOF_GetCollectionCount(Name: string): Integer; virtual;
    property Tag: string read FTag write SetTag;
    property ReadOnly: Boolean read GetReadOnly;
    property MetaClass: PMetaClass read FMetaClass write SetMetaClass;
    property Document: PDocument read FDocument write SetDocument;
    property ExtendedAttribute[Key: string]
      : PExtendedAttribute read GetExtendedAttribute;
  end;

  // PMemento
  PMemento = class
  private
    FMetaClass: PMetaClass;
    FDocument: PDocument;
    Attributes: TList;
    References: TList;
    Collections: TList;
    AttributeValues: TStringList;
    ReferenceValues: TList;
    ReferenceIndexes: TStringList;
    CollectionValues: TList;
    ExtendedAttributeKeys: TStringList;
    ExtendedAttributeValues: TStringList;
  protected
    procedure AssignFrom(Element: PElement); virtual;
    procedure AssignTo(Element: PElement); virtual;
  public
    constructor Create(Element: PElement); virtual;
    destructor Destroy; override;
  end;

  // PVisitor
  PVisitor = class
  public
    procedure Visit(Element: PElement); virtual; abstract;
  end;

  // PReferenceCollectionVisitor
  PReferenceCollectionVisitor = class(PVisitor)
  private
    FReferences: POrderedSet;
    function GetReference(Index: Integer): PObject;
    function GetReferenceCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure Visit(Element: PElement); override;
    property References[Index: Integer]: PObject read GetReference;
    property ReferenceCount: Integer read GetReferenceCount;
  end;

  // PModel
  PModel = class(PElement)
  private type
    PViewOrderedSet = POrderedSet<PView>;
    PDiagramOrderedSet = POrderedSet<PDiagram>;
    PModelOrderedSet = POrderedSet<PModel>;
  private
    FName: string;
    FDocumentation: string;
    FAttachments: TStringList;
    FViews: PViewOrderedSet;
    FOwnedDiagrams: PDiagramOrderedSet;
    FVirtualOwnedModels: PModelOrderedSet;
    FVirtualNamespace: PModel;
    procedure SetName(Value: string);
    procedure SetDocumentation(Value: string);
    function GetPathname: string;
    function GetRootModel: PModel;
    function GetView(Index: Integer): PView;
    function GetViewCount: Integer;
    function GetOwnedDiagram(Index: Integer): PDiagram;
    function GetOwnedDiagramCount: Integer;
    function GetVirtualOwnedModel(Index: Integer): PModel;
    function GetVirtualOwnedModelCount: Integer;
    procedure SetVirtualNamespace(Value: PModel);
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Accept(Visitor: PVisitor); override;
    procedure ClearViews;
    procedure AddView(AView: PView);
    procedure RemoveView(AView: PView);
    procedure InsertView(Index: Integer; AView: PView);
    procedure DeleteView(Index: Integer);
    function IndexOfView(AView: PView): Integer;
    procedure UpdateViews;
    procedure ClearOwnedDiagrams;
    procedure AddOwnedDiagram(ADiagram: PDiagram);
    procedure RemoveOwnedDiagram(ADiagram: PDiagram);
    procedure InsertOwnedDiagram(Index: Integer; ADiagram: PDiagram);
    procedure DeleteOwnedDiagram(Index: Integer);
    function IndexOfOwnedDiagram(ADiagram: PDiagram): Integer;
    procedure AddVirtualOwnedModel(Model: PModel);
    procedure RemoveVirtualOwnedModel(Model: PModel);
    procedure InsertVirtualOwnedModel(Index: Integer; Model: PModel);
    function IndexOfVirtualOwnedModel(Model: PModel): Integer;
    function IsOneOfTheContainers(Model: PModel): Boolean;
    function GetContainerRelation(Container: PModel): PMetaReference; virtual;
    function CanContainKind(Kind: string): Boolean; virtual;
    function CanContain(Model: PModel): Boolean; virtual;
    function CanContainDiagramKind(Kind: string): Boolean; virtual;
    function CanContainDiagram(Diagram: PDiagram): Boolean; virtual;
    function CanRelocateTo(Model: PModel): Boolean; virtual;
    function CanCopy: Boolean; virtual;
    function CanDelete: Boolean; virtual;
    function CanPaste(Kind, CopyContext: string): Boolean; virtual;
    function ContainsName(AName: string): Boolean;
    function GenerateAvailableName(Model: PModel;
      Postfix: string = '_'): string;
    function FindByName(AName: string): PModel;
    function FindByRelativePathname(RelPath: string): PModel;
    function GetContainingDocument: PDocument; override;
    procedure ClearAttachments;
    procedure AddAttachment(Attach: string);
    procedure InsertAttachment(Index: Integer; Attach: string);
    procedure DeleteAttachment(Index: Integer);
    function GetAttachmentAt(Index: Integer): string;
    function GetAttachmentCount: Integer;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    procedure MOF_AddCollectionItem(Name: string; Value: PElement); override;
    procedure MOF_RemoveCollectionItem(Name: string; Value: PElement); override;
    procedure MOF_InsertCollectionItem(Name: string; Index: Integer;
      Value: PElement); override;
    procedure MOF_DeleteCollectionItem(Name: string; Index: Integer); override;
    procedure MOF_ClearCollection(Name: string); override;
    function MOF_IndexOfCollectionItem(Name: string; Value: PElement): Integer;
      override;
    function MOF_GetCollectionItem(Name: string; Index: Integer): PElement;
      override;
    function MOF_GetCollectionCount(Name: string): Integer; override;
    property Name: string read FName write SetName;
    property Documentation: string read FDocumentation write SetDocumentation;
    property Attachments: TStringList read FAttachments;
    property Pathname: string read GetPathname;
    property RootModel: PModel read GetRootModel;
    property View[Index: Integer]: PView read GetView;
    property Views: PViewOrderedSet read FViews;
    property ViewCount: Integer read GetViewCount;
    property OwnedDiagrams[Index: Integer]: PDiagram read GetOwnedDiagram;
    property OwnedDiagramCount: Integer read GetOwnedDiagramCount;
    property VirtualOwnedModels[Index: Integer]
      : PModel read GetVirtualOwnedModel;
    property VirtualOwnedModelCount: Integer read GetVirtualOwnedModelCount;
    property VirtualNamespace: PModel read FVirtualNamespace write
      SetVirtualNamespace;
  end;

  // PView
  // ---------------------------------------------------------------------------
  // Class for View
  // - use "OwnerDiagramView" property to get DiagramView
  // - use "GetDiagramView" function to get DiagramView in case which current view is Sub View
  // ---------------------------------------------------------------------------
  PView = class(PElement)
  private
    FModel: PModel;
    FParent: PView;
    FSubViews: POrderedSet;
    FContainerView: PView;
    FContainedViews: POrderedSet;
    FOwnerDiagramView: PDiagramView;
    FVisible: Boolean;
    FEnabled: Boolean;
    FSelected: Boolean;
    FSelectable: Boolean;
    FLineColor: TColor;
    FFillColor: TColor;
    FFontColor: TColor;
    FFontFace: string;
    FFontSize: Integer;
    FFontStyle: TFontStyles;
    FParentLineColor: Boolean;
    FParentFillColor: Boolean;
    FParentFontFace: Boolean;
    FParentFontSize: Boolean;
    FParentFontColor: Boolean;
    FParentFontStyle: Boolean;
    FContainerChangeable: Boolean;
    FContainerExtending: Boolean;
    procedure SetSelected(Value: Boolean);
    procedure SetVisible(Value: Boolean);
    procedure SetEnabled(Value: Boolean);
    procedure SetSelectable(Value: Boolean);
    function GetLineColor: TColor;
    procedure SetLineColor(Value: TColor);
    function GetFillColor: TColor;
    procedure SetFillColor(Value: TColor);
    function GetFontColor: TColor;
    procedure SetFontColor(Value: TColor);
    function GetFontFace: string;
    procedure SetFontFace(Value: string);
    function GetFontSize: Integer;
    procedure SetFontSize(Value: Integer);
    function GetFontStyle: TFontStyles;
    procedure SetFontStyle(Value: TFontStyles);
    procedure SetParentLineColor(Value: Boolean);
    procedure SetParentFillColor(Value: Boolean);
    procedure SetParentFontFace(Value: Boolean);
    procedure SetParentFontSize(Value: Boolean);
    procedure SetParentFontColor(Value: Boolean);
    procedure SetParentFontStyle(Value: Boolean);
    procedure SetModel(Value: PModel);
    procedure SetParent(Value: PView);
    function GetSubView(Index: Integer): PView;
    function GetSubViewCount: Integer;
    function GetContainedView(Index: Integer): PView;
    function GetContainedViewCount: Integer;
    procedure SetContainerView(Value: PView);
    procedure SetOwnerDiagramView(Value: PDiagramView);
    procedure SetContainerChangeable(Value: Boolean);
    procedure SetContainerExtending(Value: Boolean);
  protected
    procedure AssignStyleToCanvas(Canvas: PCanvas);
    procedure AssignFontToCanvas(Canvas: PCanvas);
    procedure DrawObject(Canvas: PCanvas); virtual;
    procedure DrawSelection(Canvas: PCanvas); virtual;
    procedure DrawNoModeledMark(Canvas: PCanvas); virtual;
    procedure MovePosition(Canvas: PCanvas; DX, DY: Integer); virtual;
    procedure ArrangeObject(Canvas: PCanvas); virtual;
    procedure DelimitContainingBoundary(Canvas: PCanvas); virtual;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Accept(Visitor: PVisitor); override;
    procedure Setup; virtual;
    procedure Initialize(Canvas: PCanvas; X1, Y1, X2, Y2: Integer); virtual;
    procedure Draw(Canvas: PCanvas); virtual;
    procedure Move(Canvas: PCanvas; DX, DY: Integer);
    procedure Arrange(Canvas: PCanvas); virtual;
    procedure Update; virtual;
    procedure BringToFront;
    procedure SendToBack;
    function GetContainingDocument: PDocument; override;
    function GetViewAt(Canvas: PCanvas; X, Y: Integer): PView; virtual;
    function GetDiagramView: PDiagramView;
    procedure ClearSubViews;
    procedure AddSubView(V: PView);
    procedure RemoveSubView(V: PView);
    procedure InsertSubView(Index: Integer; V: PView);
    procedure DeleteSubView(Index: Integer);
    function IndexOfSubView(V: PView): Integer;
    function IncludesSubView(V: PView): Boolean;
    procedure ClearContainedViews;
    procedure AddContainedView(V: PView);
    procedure RemoveContainedView(V: PView);
    procedure InsertContainedView(Index: Integer; V: PView);
    procedure DeleteContainedView(Index: Integer);
    function IndexOfContainedView(V: PView): Integer;
    function IsOneOfTheContainerViews(V: PView): Boolean;
    function CanContainViewKind(Kind: string): Boolean; virtual;
    function CanContainView(V: PView): Boolean;
    procedure DrawContainingBox(Canvas: PCanvas); virtual;
    procedure EraseContainingBox(Canvas: PCanvas); virtual;
    function GetBoundingBox(Canvas: PCanvas): TRect; virtual;
    function ContainsPoint(Canvas: PCanvas; P: TPoint): Boolean; overload;
      virtual;
    function ContainsPoint(Canvas: PCanvas; X, Y: Integer): Boolean; overload;
    function OverlapRect(Canvas: PCanvas; R: TRect): Boolean; overload; virtual;
    function OverlapRect(Canvas: PCanvas; X1, Y1, X2, Y2: Integer): Boolean;
      overload;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    procedure MOF_AddCollectionItem(Name: string; Value: PElement); override;
    procedure MOF_RemoveCollectionItem(Name: string; Value: PElement); override;
    procedure MOF_InsertCollectionItem(Name: string; Index: Integer;
      Value: PElement); override;
    procedure MOF_DeleteCollectionItem(Name: string; Index: Integer); override;
    procedure MOF_ClearCollection(Name: string); override;
    function MOF_IndexOfCollectionItem(Name: string; Value: PElement): Integer;
      override;
    function MOF_GetCollectionItem(Name: string; Index: Integer): PElement;
      override;
    function MOF_GetCollectionCount(Name: string): Integer; override;
    property Model: PModel read FModel write SetModel;
    property SubViews[Index: Integer]: PView read GetSubView;
    property SubViewCount: Integer read GetSubViewCount;
    property Parent: PView read FParent write SetParent;
    property ContainedViews[Index: Integer]: PView read GetContainedView;
    property ContainedViewCount: Integer read GetContainedViewCount;
    property ContainerView: PView read FContainerView write SetContainerView;
    property Visible: Boolean read FVisible write SetVisible;
    property Enabled: Boolean read FEnabled write SetEnabled;
    property Selected: Boolean read FSelected write SetSelected; // TRANSIENT //
    property Selectable: Boolean read FSelectable write SetSelectable;
    // TRANSIENT //
    property LineColor: TColor read GetLineColor write SetLineColor;
    property FillColor: TColor read GetFillColor write SetFillColor;
    property FontColor: TColor read GetFontColor write SetFontColor;
    property FontFace: string read GetFontFace write SetFontFace;
    property FontSize: Integer read GetFontSize write SetFontSize;
    property FontStyle: TFontStyles read GetFontStyle write SetFontStyle;
    property ParentLineColor: Boolean read FParentLineColor write
      SetParentLineColor; // TRANSIENT //
    property ParentFillColor: Boolean read FParentFillColor write
      SetParentFillColor; // TRANSIENT //
    property ParentFontFace
      : Boolean read FParentFontFace write SetParentFontFace;
    // TRANSIENT //
    property ParentFontSize
      : Boolean read FParentFontSize write SetParentFontSize;
    // TRANSIENT //
    property ParentFontColor: Boolean read FParentFontColor write
      SetParentFontColor; // TRANSIENT //
    property ParentFontStyle: Boolean read FParentFontStyle write
      SetParentFontStyle; // TRANSIENT //
    property OwnerDiagramView: PDiagramView read FOwnerDiagramView write
      SetOwnerDiagramView;
    property ContainerChangeable: Boolean read FContainerChangeable write
      SetContainerChangeable; // TRANSIENT //
    property ContainerExtending: Boolean read FContainerExtending write
      SetContainerExtending; // TRANSIENT //
  end;

  // PDiagram
  // ---------------------------------------------------------------------------
  // class plays Model role to contain diagram information
  // - don't use "Views" property but use "DiagramView" to get DiagramView
  // ---------------------------------------------------------------------------
  PDiagram = class(PModel)
  private
    FDefaultDiagram: Boolean;
    FDiagramType: string;
    FDiagramView: PDiagramView;
    FDiagramOwner: PModel;
    procedure SetDefaultDiagram(Value: Boolean);
    procedure SetDiagramType(Value: string);
    procedure SetDiagramView(Value: PDiagramView);
    procedure SetDiagramOwner(Value: PModel);
  public
    constructor Create; override;
    procedure Accept(Visitor: PVisitor); override;
    function GetContainingDocument: PDocument; override;
    function CanContainKind(Kind: string): Boolean; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property DefaultDiagram
      : Boolean read FDefaultDiagram write SetDefaultDiagram;
    property DiagramType: string read FDiagramType write FDiagramType;
    property DiagramView: PDiagramView read FDiagramView write SetDiagramView;
    property DiagramOwner: PModel read FDiagramOwner write SetDiagramOwner;
  end;

  // PDiagramView
  // ---------------------------------------------------------------------------
  // is class to manage Views.
  // - Use "OwnedViews" to manage Contained Views, don't use SubViews
  // - don't use "Model" property but use "Diagram" to get Diagram model
  // ---------------------------------------------------------------------------
  PDiagramView = class(PView)
  private
    FDiagram: PDiagram;
    FCanvas: PCanvas;
    FOwnedViews: POrderedSet;
    FSelectedViews: POrderedSet;
    procedure SetDiagram(Value: PDiagram);
    function GetSelectedView(Index: Integer): PView;
    function GetSelectedCount: Integer;
    function GetOwnedView(Index: Integer): PView;
    function GetOwnedViewCount: Integer;
  protected
    procedure DrawObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Accept(Visitor: PVisitor); override;
    procedure Draw(Canvas: PCanvas); override;
    procedure DrawDiagram(Canvas: PCanvas); virtual;
    procedure Update; override;
    function GetContainingDocument: PDocument; override;
    function GetViewAt(Canvas: PCanvas; X, Y: Integer): PView; override;
    function GetBottomViewAt(Canvas: PCanvas; X, Y: Integer): PView;
    function GetBoundingBox(Canvas: PCanvas): TRect; override;
    function GetSelectedBoundingBox(Canvas: PCanvas): TRect;
    function ContainsPoint(Canvas: PCanvas; P: TPoint): Boolean; override;
    function OverlapRect(Canvas: PCanvas; R: TRect): Boolean; override;
    procedure SelectAll;
    procedure DeselectAll;
    procedure SelectArea(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
    procedure ClearOwnedViews;
    procedure AddOwnedView(AView: PView);
    procedure RemoveOwnedView(AView: PView);
    procedure InsertOwnedView(Index: Integer; AView: PView);
    procedure DeleteOwnedView(Index: Integer);
    function IndexOfOwnedView(AView: PView): Integer;
    function CanOwnView(View: PView): Boolean; virtual;
    function CanOwnViewKind(Kind: string): Boolean; virtual;
    function CanCopyViews: Boolean; virtual;
    function CanDeleteViews: Boolean; virtual;
    function CanPasteViews(Kind, CopyContext: string): Boolean; virtual;
    function CanAcceptModel(Model: PModel): Boolean; virtual;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    procedure MOF_AddCollectionItem(Name: string; Value: PElement); override;
    procedure MOF_RemoveCollectionItem(Name: string; Value: PElement); override;
    procedure MOF_InsertCollectionItem(Name: string; Index: Integer;
      Value: PElement); override;
    procedure MOF_DeleteCollectionItem(Name: string; Index: Integer); override;
    procedure MOF_ClearCollection(Name: string); override;
    function MOF_IndexOfCollectionItem(Name: string; Value: PElement): Integer;
      override;
    function MOF_GetCollectionItem(Name: string; Index: Integer): PElement;
      override;
    function MOF_GetCollectionCount(Name: string): Integer; override;
    property Diagram: PDiagram read FDiagram write SetDiagram;
    property SelectedViews[Index: Integer]: PView read GetSelectedView;
    property SelectedViewCount: Integer read GetSelectedCount;
    property OwnedViews[Index: Integer]: PView read GetOwnedView;
    property OwnedViewCount: Integer read GetOwnedViewCount;
    property Canvas: PCanvas read FCanvas write FCanvas;
  end;

  // PReferenceResolveItem
  PReferenceResolveItem = class
  public
    Element: PElement;
    Name: string;
    GUID: string;
    Pathname: string;
    IsCollection: Boolean;
    constructor Create(AElement: PElement; AName, AGuid, APathname: string;
      AIsCollection: Boolean);
  end;

  // PReferenceResolver
  PReferenceResolver = class(TObject)
  private
    HashedGuidTable: THashedStringList;
    ResolveItemList: TList;
    CurProgress: Integer;
    ProgressMaxStep: Integer;
    FOnResolvingProgress: PProgressEvent;
    function GetResolveItem(Index: Integer): PReferenceResolveItem;
    function GetResolveItemCount: Integer;
    procedure ResolvingProgress(Info: string; Max, Progress: Integer);
    procedure BuildHashedGuidTable;
    function FindInstance(AGuid: string): PElement;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure AddResolveItem(AElement: PElement;
      AName, AGuid, APathname: string; AIsCollection: Boolean);
    procedure ResolveAll;
    procedure BlockedResolveAll(BaseElement: PElement);
    procedure ReplaceGUID(OldGUID, NewGUID: string);
    procedure ReassignGUIDs(BaseElement: PElement);
    property ResolveItems[Index: Integer]
      : PReferenceResolveItem read GetResolveItem;
    property ResolveItemCount: Integer read GetResolveItemCount;
    property OnResolvingProgress
      : PProgressEvent read FOnResolvingProgress write
      FOnResolvingProgress;
  end;

  // PXMLObjectReader
  PXMLObjectReader = class(PObjectReader)
  protected
    ReferenceResolver: PReferenceResolver;
    CurrentNode: IXMLNode;
    CurrentObject: PObject;
    CurrentKeyTable: THashedStringList;
    procedure CurrentBuildKeyTable(BaseNode: IXMLNode);
    function GetNodeByKey(Key: string): IXMLNode;
  public
    constructor Create(BaseNode: IXMLNode;
      AReferenceResolver: PReferenceResolver);
    destructor Destroy; override;
    function ReadInteger(Key: string; Default: Integer = 0): Integer; override;
    function ReadBoolean(Key: string; Default: Boolean = False): Boolean;
      override;
    function ReadReal(Key: string; Default: Real = 0.0): Real; override;
    function ReadString(Key: string; Default: string = ''): string; override;
    function ReadObject(Key: string; Default: PObject = nil): PObject; override;
    function ReadReference(Key: string; Default: PObject = nil): PObject;
      override;
    function ReadUserDefinedType(TypeName, Key: string;
      Default: string = ''): string; override;
  end;

  // PXMLObjectWriter
  PXMLObjectWriter = class(PObjectWriter)
  private
    FOnFilter: PXMLObjectWriterFilter;
    function GetAttrBeginNode(Name, TypeName: string): string;
    function GetAttrEndNode: string;
    function GetObjBeginNode(Name, TypeName, GUID: string): string;
    function GetObjEndNode: string;
  protected
    XMLStrings: TStrings;
    CurrentObject: PObject;
    CurrentDocument: PDocument;
    function GetRefBeginNode(Name: string; Pathname: string = ''): string;
    function GetRefEndNode: string;
    function IsFiltered(Key: string): Boolean;
  public
    constructor Create(AXMLStrings: TStrings);
    procedure WriteInteger(Key: string; Value: Integer; Default: Integer = 0);
      override;
    procedure WriteBoolean(Key: string; Value: Boolean;
      Default: Boolean = False); override;
    procedure WriteReal(Key: string; Value: Real; Default: Real = 0.0);
      override;
    procedure WriteString(Key: string; Value: string; Default: string = '');
      override;
    procedure WriteObject(Key: string; Value: PObject; Default: PObject = nil);
      override;
    procedure WriteReference(Key: string; Value: PObject;
      Default: PObject = nil); override;
    procedure WriteUserDefinedType(TypeName, Key, Value: string;
      Default: string = ''); override;
    property OnFilter: PXMLObjectWriterFilter read FOnFilter write FOnFilter;
  end;

  // PXMLDOMObjectWriter
  PXMLDOMObjectWriter = class(PObjectWriter)
  protected
    CurrentNode: IXMLNode;
    CurrentObject: PObject;
    CurrentDocument: PDocument;
  public
    constructor Create(BaseNode: IXMLNode);
    procedure WriteInteger(Key: string; Value: Integer; Default: Integer = 0);
      override;
    procedure WriteBoolean(Key: string; Value: Boolean;
      Default: Boolean = False); override;
    procedure WriteReal(Key: string; Value: Real; Default: Real = 0.0);
      override;
    procedure WriteString(Key: string; Value: string; Default: string = '');
      override;
    procedure WriteObject(Key: string; Value: PObject; Default: PObject = nil);
      override;
    procedure WriteReference(Key: string; Value: PObject;
      Default: PObject = nil); override;
    procedure WriteUserDefinedType(TypeName, Key, Value: string;
      Default: string = ''); override;
  end;

  // PDocument
  PDocument = class(PObject)
  public const
    SharedCopyExt = '.SHARED_COPY';
  private
    FFileName: string;
    FVersion: string;
    FFileStream: TFileStream;
    FReadOnly: Boolean;
    FModified: Boolean;
    FDocumentElement: PElement;
    FFileSavedTime: TDateTime;
    FExternallyModified: Boolean;
    FOnModified: PDocumentEvent;
    FOnSaved: PDocumentEvent;
    procedure SetModified(Value: Boolean);
    procedure SetDocumentElement(Value: PElement);
    function IsExclusiveFileAccess: Boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure UpdateFileAttr;
    function GetDocumentSymbol: string; virtual;
    procedure RemoveExclusiveFileAccess;
    property FileName: string read FFileName write FFileName;
    property Version: string read FVersion write FVersion;
    property FileStream: TFileStream read FFileStream write FFileStream;
    property ReadOnly: Boolean read FReadOnly;
    property ExclusiveFileAccess: Boolean read IsExclusiveFileAccess;
    property Modified: Boolean read FModified write SetModified;
    property FileSavedTime: TDateTime read FFileSavedTime write FFileSavedTime;
    property ExternallyModified
      : Boolean read FExternallyModified write FExternallyModified;
    property DocumentElement: PElement read FDocumentElement write
      SetDocumentElement;
    property OnModified: PDocumentEvent read FOnModified write FOnModified;
    property OnSaved: PDocumentEvent read FOnSaved write FOnSaved;
  end;

  // PDocumentInputStream
  PDocumentInputStream = class
  private const
    ExclusiveUserInfo = 'EXCLUSIVEUSERINFO';
    UserName = 'USERNAME';
    LockTime = 'LOCKTIME';
  private
    FFileName: string;
    FReferenceResolver: PReferenceResolver;
    FOnLoadingProgress: PProgressEvent;
    procedure AsyncLoadHandler(Sender: TObject; AsyncLoadState: Integer);
    procedure LoadingProgress(Info: string; Max, Progress: Integer);
    function LoadDocument(var AFileAccessType: PFileAccessType;
      var AFileStream: TFileStream): Boolean;
    function OpenFileAsReadOnly: Boolean;
    procedure CreateReadOnlyCopy;
  protected
    XMLDoc: TXMLDocument;
    DocumentElement: PElement;
    function CreateDocument: PDocument; virtual; abstract;
    procedure ReadHeader(HeaderNode: IXMLNode); virtual;
    procedure ReadBody(BodyNode: IXMLNode); virtual;
  public
    constructor Create(AFileName: string;
      AReferenceResolver: PReferenceResolver); virtual;
    destructor Destroy; override;
    function ReadDocument(AFileAccessType: PFileAccessType): PDocument;
    property FileName: string read FFileName;
    property ReferenceResolver: PReferenceResolver read FReferenceResolver;
    property OnLoadingProgress
      : PProgressEvent read FOnLoadingProgress write FOnLoadingProgress;
  end;

  // PDocumentOutputStream
  PDocumentOutputStream = class
  private
    FFileName: string;
    FOnSavingProgress: PProgressEvent;
    function GetDocBeginNode: string;
    function GetDocEndNode: string;
    function GetHeaderBeginNode: string;
    function GetHeaderEndNode: string;
    function GetBodyBeginNode: string;
    function GetBodyEndNode: string;
    procedure SavingProgress(Info: string; Max, Progress: Integer);
    procedure FilterHandler(Sender: TObject; CurrentObject: PObject;
      Key: string; var CanFilter: Boolean);
  protected
    XMLStrings: TStrings;
    function GetDocumentSymbol: string; virtual;
    function GetDocumentVersion: Integer; virtual;
    procedure IsFiltered(Obj: PObject; Key: string; var CanFilter: Boolean);
      virtual;
    procedure WriteHeader(ADocument: PDocument); virtual;
    procedure WriteBody(ADocument: PDocument); virtual;
  public
    constructor Create(AFileName: string); virtual;
    destructor Destroy; override;
    procedure Close(ADocument: PDocument);
    procedure WriteDocument(ADocument: PDocument); virtual;
    property FileName: string read FFileName;
    property OnSavingProgress
      : PProgressEvent read FOnSavingProgress write FOnSavingProgress;
  end;

  {
    // PDocumentOutputStream__
    PDocumentOutputStream__ = class
    private
    FFileName: string;
    protected
    XMLDoc: TXMLDocument;
    function GetDocumentSymbol: string; virtual;
    function GetDocumentVersion: Integer; virtual;
    procedure WriteHeader(HeaderNode: IXMLNode; ADocument: PDocument); virtual;
    procedure WriteBody(BodyNode: IXMLNode; ADocument: PDocument); virtual;
    public
    constructor Create(AFileName: string); virtual;
    destructor Destroy; override;
    procedure Close;
    procedure WriteDocument(ADocument: PDocument); virtual;
    property FileName: string read FFileName;
    end;
  }




// PrimitiveType Conversion Routines
function BooleanToString(B: Boolean): string;
function StringToBoolean(S: string): Boolean;
function IntegerToString(I: Integer): string;
function StringToInteger(S: string): Integer;
function RealToString(R: Real): string;
function StringToReal(S: string): Real;
function RectToString(ARect: TRect): string;
function StringToRect(RectStr: string): TRect;
function ExtractHeadName(Pathname: string): string;
function ExtractTailPath(Pathname: string): string;

// Utility Functions
procedure CheckNameValidity(Name: string);
procedure CheckReadOnly(ElementSet: POrderedSet); overload;
procedure CheckReadOnly(ElementSet: PModelOrderedSet); overload;
procedure CheckReadOnly(ElementSet: PViewOrderedSet); overload;
procedure CheckReadOnly(Element: PElement); overload;

var
  MetaModel: PMetaModel;

implementation

uses
  Dialogs, Controls, Variants, Forms, ComServ, {HTTPApp,} HTTPUtil, NLS_StarUML;

// -----------------------------------------------------------------------------
// IsCollectionKey
// - distincts that key is collection's key.
// e.g. "OwnedElements[3]" ==> TRUE
// "Classifier"       ==> FALSE
// -----------------------------------------------------------------------------
function IsCollectionKey(Key: string): Boolean;
begin
  Result := Copy(Trim(Key), Length(Trim(Key)), 1) = ']';
end;

// -----------------------------------------------------------------------------
// TrimCollectionKey
// e.g. "OwnedElements[3]" ==> "OwnedElements"
// -----------------------------------------------------------------------------
function TrimCollectionKey(Key: string): string;
begin
  Result := Copy(Key, 1, Pos('[', Key) - 1); // cut '[number]'
end;

// -----------------------------------------------------------------------------
// GetUserFromWindows
// Helper wrapping system function GetUserName
// -----------------------------------------------------------------------------
function GetUserFromWindows: string;
var
   UserName : string;
   UserNameLen : Dword;
begin
   UserNameLen := 255;
   SetLength(userName, UserNameLen);
   if GetUserName(PChar(UserName), UserNameLen) then
     Result := Copy(UserName,1,UserNameLen - 1)
   else
     Result := 'Unknown';
end;



/// /////////////////////////////////////////////////////////////////////////////
// PMetaElement

constructor PMetaElement.Create;
begin
  inherited;
  FName := '';
end;

// PMetaElement
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PMetaAssociationEnd

constructor PMetaAssociationEnd.Create;
begin
  inherited;
  FKind := maeReference;
  FAggregate := makNone;
  FOtherSide := '';
  FOtherSideKind := maeReference;
end;

function PMetaAssociationEnd.GetOtherSideEnd: PMetaAssociationEnd;
begin
  Result := nil;
  if TypeRef is PMetaClass then
    case OtherSideKind of
      maeReference:
        Result := (TypeRef as PMetaClass).GetReferenceByName(OtherSide);
      maeCollection:
        Result := (TypeRef as PMetaClass).GetCollectionByName(OtherSide);
    end;
end;

// PMetaAssociationEnd
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PMetaReference

constructor PMetaReference.Create;
begin
  inherited;
  FKind := maeReference;
end;

// PMetaReference
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PMetaCollection

constructor PMetaCollection.Create;
begin
  inherited;
  FKind := maeCollection;
end;

// PMetaCollection
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PMetaClass

constructor PMetaClass.Create;
begin
  inherited;
  FInstances := TList.Create;
  FMetaAttributes := TList.Create;
  FMetaReferences := TList.Create;
  FMetaCollections := TList.Create;
  FSubclasses := TList.Create;
  FSuperclass := nil;
  FElementClass := nil;
end;

destructor PMetaClass.Destroy;
begin
  FInstances.Free;
  FInstances := nil;
  Empty;
  FMetaAttributes.Free;
  FMetaAttributes := nil;
  FMetaReferences.Free;
  FMetaReferences := nil;
  FMetaCollections.Free;
  FMetaCollections := nil;
  FSubclasses.Free;
  FSubclasses := nil;
  FSuperclass := nil;
  inherited;
end;

procedure PMetaClass.ClearInstances;
begin
  FInstances.Clear;
end;

function PMetaClass.GetOwnMetaAttribute(Index: Integer): PMetaAttribute;
begin
  Result := FMetaAttributes.Items[Index];
end;

function PMetaClass.GetOwnMetaAttributeCount: Integer;
begin
  Result := FMetaAttributes.Count;
end;

function PMetaClass.GetOwnMetaReference(Index: Integer): PMetaReference;
begin
  Result := FMetaReferences.Items[Index];
end;

function PMetaClass.GetOwnMetaReferenceCount: Integer;
begin
  Result := FMetaReferences.Count;
end;

function PMetaClass.GetOwnMetaCollection(Index: Integer): PMetaCollection;
begin
  Result := FMetaCollections.Items[Index];
end;

function PMetaClass.GetOwnMetaCollectionCount: Integer;
begin
  Result := FMetaCollections.Count;
end;

function PMetaClass.GetMetaAttribute(Index: Integer): PMetaAttribute;
begin
  if FSuperclass = nil then
    Result := FMetaAttributes.Items[Index]
  else
  begin
    if Index < FSuperclass.MetaAttributeCount then
      Result := FSuperclass.MetaAttributes[Index]
    else
      Result := FMetaAttributes.Items[Index - FSuperclass.MetaAttributeCount];
  end;
end;

function PMetaClass.GetMetaAttributeCount: Integer;
begin
  if FSuperclass = nil then
    Result := FMetaAttributes.Count
  else
    Result := Superclass.MetaAttributeCount + FMetaAttributes.Count;
end;

function PMetaClass.GetMetaReference(Index: Integer): PMetaReference;
begin
  if FSuperclass = nil then
    Result := FMetaReferences.Items[Index]
  else
  begin
    if Index < FSuperclass.MetaReferenceCount then
      Result := FSuperclass.MetaReferences[Index]
    else
      Result := FMetaReferences.Items[Index - FSuperclass.MetaReferenceCount];
  end;
end;

function PMetaClass.GetMetaReferenceCount: Integer;
begin
  if FSuperclass = nil then
    Result := FMetaReferences.Count
  else
    Result := FSuperclass.MetaReferenceCount + FMetaReferences.Count;
end;

function PMetaClass.GetMetaCollection(Index: Integer): PMetaCollection;
begin
  if FSuperclass = nil then
    Result := FMetaCollections.Items[Index]
  else
  begin
    if Index < FSuperclass.MetaCollectionCount then
      Result := FSuperclass.MetaCollections[Index]
    else
      Result := FMetaCollections.Items[Index - FSuperclass.MetaCollectionCount];
  end;
end;

function PMetaClass.GetMetaCollectionCount: Integer;
begin
  if FSuperclass = nil then
    Result := FMetaCollections.Count
  else
    Result := FSuperclass.MetaCollectionCount + FMetaCollections.Count;
end;

function PMetaClass.GetInstance(Index: Integer): PElement;
begin
  Result := FInstances.Items[Index];
end;

function PMetaClass.GetInstanceCount: Integer;
begin
  Result := FInstances.Count;
end;

function PMetaClass.GetInclusiveInstance(Index: Integer): PElement;
var
  I: Integer;
begin
  if Index < FInstances.Count then
  begin
    Result := FInstances.Items[Index];
    Exit;
  end
  else
  begin
    Index := Index - FInstances.Count;
    for I := 0 to SubclassCount - 1 do
    begin
      if Index < Subclasses[I].InclusiveInstanceCount then
      begin
        Result := Subclasses[I].InclusiveInstances[Index];
        Exit;
      end
      else
      begin
        Index := Index - Subclasses[I].InclusiveInstanceCount;
      end;
    end;
  end;
  Result := nil;
end;

function PMetaClass.GetInclusiveInstanceCount: Integer;
var
  I, C: Integer;
begin
  C := FInstances.Count;
  for I := 0 to SubclassCount - 1 do
    C := C + Subclasses[I].InclusiveInstanceCount;
  Result := C;
end;

procedure PMetaClass.SetSuperclass(Value: PMetaClass);
begin
  if FSuperclass <> Value then
  begin
    if FSuperclass <> nil then
      FSuperclass.FSubclasses.Remove(Self);
    FSuperclass := Value;
    if FSuperclass <> nil then
      FSuperclass.FSubclasses.Add(Self);
  end;
end;

function PMetaClass.GetSubclass(Index: Integer): PMetaClass;
begin
  Result := FSubclasses.Items[Index];
end;

function PMetaClass.GetSubclassCount: Integer;
begin
  Result := FSubclasses.Count;
end;

function PMetaClass.CreateInstance(AGuid: string = ''): PElement;
var
  Elem: PElement;
begin
  Elem := FElementClass.Create;
  if AGuid <> '' then
    Elem.GUID := AGuid;
  Elem.MetaClass := Self;
  Result := Elem;
end;

procedure PMetaClass.DeleteInstance(AElement: PElement);
begin
  if AElement <> nil then
    AElement.MetaClass := nil;
end;

function PMetaClass.FindInstanceByGuid(AGuid: string): PElement;
var
  I: Integer;
  E: PElement;
begin
  Result := nil;
  for I := 0 to FInstances.Count - 1 do
  begin
    E := FInstances.Items[I];
    if E.GUID = AGuid then
    begin
      Result := E;
      Exit;
    end;
  end;
end;

function PMetaClass.FindInstanceByGuidRecurse(AGuid: string): PElement;
var
  E: PElement;
  I: Integer;
begin
  E := FindInstanceByGuid(AGuid);
  if E <> nil then
    Result := E
  else
  begin
    for I := 0 to SubclassCount - 1 do
    begin
      E := Subclasses[I].FindInstanceByGuidRecurse(AGuid);
      if E <> nil then
      begin
        Result := E;
        Exit;
      end;
    end;
    Result := nil;
  end;
end;

function PMetaClass.IsKindOf(AName: string): Boolean;
begin
  if Name = AName then
  begin
    Result := True;
  end
  else
  begin
    if Superclass = nil then
      Result := False
    else
      Result := Superclass.IsKindOf(AName);
  end;
end;

function PMetaClass.ExistsAttribute(Name: string): Boolean;
var
  I: Integer;
  A: PMetaAttribute;
begin
  for I := 0 to FMetaAttributes.Count - 1 do
  begin
    A := FMetaAttributes.Items[I];
    if A.Name = Name then
    begin
      Result := True;
      Exit;
    end;
  end;
  if FSuperclass <> nil then
    Result := FSuperclass.ExistsAttribute(Name)
  else
    Result := False;
end;

function PMetaClass.ExistsReference(Name: string): Boolean;
var
  I: Integer;
  R: PMetaReference;
begin
  for I := 0 to FMetaReferences.Count - 1 do
  begin
    R := FMetaReferences.Items[I];
    if R.Name = Name then
    begin
      Result := True;
      Exit;
    end;
  end;
  if FSuperclass <> nil then
    Result := FSuperclass.ExistsReference(Name)
  else
    Result := False;
end;

function PMetaClass.ExistsCollection(Name: string): Boolean;
var
  I: Integer;
  C: PMetaCollection;
begin
  for I := 0 to FMetaCollections.Count - 1 do
  begin
    C := FMetaCollections.Items[I];
    if C.Name = Name then
    begin
      Result := True;
      Exit;
    end;
  end;
  if FSuperclass <> nil then
    Result := FSuperclass.ExistsCollection(Name)
  else
    Result := False;
end;

function PMetaClass.GetAttributeByName(Name: string): PMetaAttribute;
var
  I: Integer;
  A: PMetaAttribute;
begin
  for I := 0 to FMetaAttributes.Count - 1 do
  begin
    A := FMetaAttributes.Items[I];
    if A.Name = Name then
    begin
      Result := A;
      Exit;
    end;
  end;
  if FSuperclass <> nil then
    Result := FSuperclass.GetAttributeByName(Name)
  else
    Result := nil;
end;

function PMetaClass.GetReferenceByName(Name: string): PMetaReference;
var
  I: Integer;
  R: PMetaReference;
begin
  for I := 0 to FMetaReferences.Count - 1 do
  begin
    R := FMetaReferences.Items[I];
    if R.Name = Name then
    begin
      Result := R;
      Exit;
    end;
  end;
  if FSuperclass <> nil then
    Result := FSuperclass.GetReferenceByName(Name)
  else
    Result := nil;
end;

function PMetaClass.GetCollectionByName(Name: string): PMetaCollection;
var
  I: Integer;
  C: PMetaCollection;
begin
  for I := 0 to FMetaCollections.Count - 1 do
  begin
    C := FMetaCollections.Items[I];
    if C.Name = Name then
    begin
      Result := C;
      Exit;
    end;
  end;
  if FSuperclass <> nil then
    Result := FSuperclass.GetCollectionByName(Name)
  else
    Result := nil;
end;

function PMetaClass.GetContainerRelation(Container: PMetaClass): PMetaReference;
var
  I: Integer;
  R: PMetaReference;
  OtherSide: PMetaAssociationEnd;
begin
  Result := nil;
  for I := 0 to OwnMetaReferenceCount - 1 do
  begin
    R := OwnMetaReferences[I];
    OtherSide := R.GetOtherSideEnd;
    if (OtherSide <> nil) and (OtherSide.Aggregate = makComposite)
      and Container.IsKindOf(R.TypeRef.Name) then
    begin
      Result := R;
      Exit;
    end;
  end;
  if Superclass <> nil then
    Result := Superclass.GetContainerRelation(Container);
end;

procedure PMetaClass.Empty;
var
  I: Integer;
  M: PMetaElement;
begin
  for I := FMetaAttributes.Count - 1 downto 0 do
  begin
    M := FMetaAttributes.Items[I];
    FMetaAttributes.Remove(M);
    M.Free;
  end;
  for I := FMetaReferences.Count - 1 downto 0 do
  begin
    M := FMetaReferences.Items[I];
    FMetaReferences.Remove(M);
    M.Free;
  end;
  for I := FMetaCollections.Count - 1 downto 0 do
  begin
    M := FMetaCollections.Items[I];
    FMetaCollections.Remove(M);
    M.Free;
  end;
end;

procedure PMetaClass.AddMetaAttribute(AMetaAttribute: PMetaAttribute);
begin
  FMetaAttributes.Add(AMetaAttribute);
end;

procedure PMetaClass.RemoveMetaAttribute(AMetaAttribute: PMetaAttribute);
begin
  FMetaAttributes.Remove(AMetaAttribute);
end;

procedure PMetaClass.AddMetaReference(AMetaReference: PMetaReference);
begin
  FMetaReferences.Add(AMetaReference);
end;

procedure PMetaClass.RemoveMetaReference(AMetaReference: PMetaReference);
begin
  FMetaReferences.Remove(AMetaReference);
end;

procedure PMetaClass.AddMetaCollection(AMetaCollection: PMetaCollection);
begin
  FMetaCollections.Add(AMetaCollection);
end;

procedure PMetaClass.RemoveMetaCollection(AMetaCollection: PMetaCollection);
begin
  FMetaCollections.Remove(AMetaCollection);
end;

// PMetaClass
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PMetaEnumeration

constructor PMetaEnumeration.Create;
begin
  inherited;
  FMetaLiterals := TList.Create;
end;

destructor PMetaEnumeration.Destroy;
begin
  Empty;
  FMetaLiterals.Free;
  FMetaLiterals := nil;
  inherited;
end;

function PMetaEnumeration.GetMetaLiteral(Index: Integer): PMetaLiteral;
begin
  Result := FMetaLiterals.Items[Index];
end;

function PMetaEnumeration.GetMetaLiteralCount: Integer;
begin
  Result := FMetaLiterals.Count;
end;

procedure PMetaEnumeration.Empty;
var
  I: Integer;
  M: PMetaElement;
begin
  for I := FMetaLiterals.Count - 1 downto 0 do
  begin
    M := FMetaLiterals.Items[I];
    FMetaLiterals.Remove(M);
    M.Free;
  end;
end;

procedure PMetaEnumeration.AddMetaLiteral(AMetaLiteral: PMetaLiteral);
begin
  FMetaLiterals.Add(AMetaLiteral)
end;

procedure PMetaEnumeration.RemoveMetaLiteral(AMetaLiteral: PMetaLiteral);
begin
  FMetaLiterals.Remove(AMetaLiteral);
end;

// PMetaEnumeration
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PMetaModel

constructor PMetaModel.Create;
begin
  inherited;
  FMetaClasses := THashedStringList.Create;
  FMetaClasses.CaseSensitive := True;
  FMetaPrimitiveTypes := THashedStringList.Create;
  FMetaPrimitiveTypes.CaseSensitive := True;
  FMetaDataTypes := THashedStringList.Create;
  FMetaDataTypes.CaseSensitive := True;
  FMetaEnumerations := THashedStringList.Create;
  FMetaEnumerations.CaseSensitive := True;
end;

destructor PMetaModel.Destroy;
begin
  Empty;
  FMetaClasses.Free;
  FMetaClasses := nil;
  FMetaPrimitiveTypes.Free;
  FMetaPrimitiveTypes := nil;
  FMetaDataTypes.Free;
  FMetaDataTypes := nil;
  FMetaEnumerations.Free;
  FMetaEnumerations := nil;
  inherited;
end;

function PMetaModel.GetMetaClass(Index: Integer): PMetaClass;
begin
  Result := FMetaClasses.Objects[Index] as PMetaClass;
end;

function PMetaModel.GetMetaClassCount: Integer;
begin
  Result := FMetaClasses.Count;
end;

function PMetaModel.GetMetaPrimitiveType(Index: Integer): PMetaPrimitiveType;
begin
  Result := FMetaPrimitiveTypes.Objects[Index] as PMetaPrimitiveType;
end;

function PMetaModel.GetMetaPrimitiveTypeCount: Integer;
begin
  Result := FMetaPrimitiveTypes.Count;
end;

function PMetaModel.GetMetaDataType(Index: Integer): PMetaDataType;
begin
  Result := FMetaDataTypes.Objects[Index] as PMetaDataType;
end;

function PMetaModel.GetMetaDataTypeCount: Integer;
begin
  Result := FMetaDataTypes.Count;
end;

function PMetaModel.GetMetaEnumeration(Index: Integer): PMetaEnumeration;
begin
  Result := FMetaEnumerations.Objects[Index] as PMetaEnumeration;
end;

function PMetaModel.GetMetaEnumerationCount: Integer;
begin
  Result := FMetaEnumerations.Count;
end;

procedure PMetaModel.Empty;
var
  I: Integer;
  M: PMetaElement;
begin
  for I := FMetaClasses.Count - 1 downto 0 do
  begin
    M := FMetaClasses.Objects[I] as PMetaElement;
    FMetaClasses.Delete(I);
    M.Free;
  end;
  for I := FMetaPrimitiveTypes.Count - 1 downto 0 do
  begin
    M := FMetaPrimitiveTypes.Objects[I] as PMetaElement;
    FMetaPrimitiveTypes.Delete(I);
    M.Free;
  end;
  for I := FMetaDataTypes.Count - 1 downto 0 do
  begin
    M := FMetaDataTypes.Objects[I] as PMetaElement;
    FMetaDataTypes.Delete(I);
    M.Free;
  end;
  for I := FMetaEnumerations.Count - 1 downto 0 do
  begin
    M := FMetaEnumerations.Objects[I] as PMetaElement;
    FMetaEnumerations.Delete(I);
    M.Free;
  end;
end;

function PMetaModel.IsKindOf(SubName, SuperName: string): Boolean;
var
  MC: PMetaClass;
begin
  MC := FindMetaClass(SubName);
  if MC <> nil then
    Result := MC.IsKindOf(SuperName)
  else
    Result := False;
end;

procedure PMetaModel.ClearInstances;
var
  I: Integer;
  M: PMetaClass;
begin
  for I := FMetaClasses.Count - 1 downto 0 do
  begin
    M := FMetaClasses.Objects[I] as PMetaClass;
    M.ClearInstances;
  end;
end;

function PMetaModel.CreateInstance(AMetaClassName: string;
  AGuid: string = ''): PElement;
var
  M: PMetaClass;
begin
  M := FindMetaClass(AMetaClassName);
  if M = nil then
    raise EMetaClassifierNotExist.Create
      ('MetaClass not found (' + AMetaClassName + ')');
  Result := M.CreateInstance(AGuid);
end;

function PMetaModel.FindInstanceByGuid(AGuid: string): PElement;
var
  I: Integer;
  Instance: PElement;
begin
  for I := 0 to MetaClassCount - 1 do
  begin
    Instance := MetaClasses[I].FindInstanceByGuid(AGuid);
    if Instance <> nil then
    begin
      Result := Instance;
      Exit;
    end;
  end;
  Result := nil;
end;

procedure PMetaModel.AddMetaClass(AMetaClass: PMetaClass);
begin
  FMetaClasses.AddObject(AMetaClass.Name, AMetaClass);
end;

procedure PMetaModel.RemoveMetaClass(AMetaClass: PMetaClass);
begin
  FMetaClasses.Delete(FMetaClasses.IndexOfObject(AMetaClass));
end;

function PMetaModel.IndexOfMetaClass(AMetaClass: PMetaClass): Integer;
begin
  Result := FMetaClasses.IndexOfObject(AMetaClass);
end;

procedure PMetaModel.AddMetaPrimitiveType
  (AMetaPrimitiveType: PMetaPrimitiveType);
begin
  FMetaPrimitiveTypes.AddObject(AMetaPrimitiveType.Name, AMetaPrimitiveType)
end;

procedure PMetaModel.RemoveMetaPrimitiveType
  (AMetaPrimitiveType: PMetaPrimitiveType);
begin
  FMetaPrimitiveTypes.Delete(FMetaPrimitiveTypes.IndexOfObject
      (AMetaPrimitiveType));
end;

function PMetaModel.IndexOfMetaPrimitiveType
  (AMetaPrimitiveType: PMetaPrimitiveType): Integer;
begin
  Result := FMetaPrimitiveTypes.IndexOfObject(AMetaPrimitiveType);
end;

procedure PMetaModel.AddMetaDataType(AMetaDataType: PMetaDataType);
begin
  FMetaDataTypes.AddObject(AMetaDataType.Name, AMetaDataType);
end;

procedure PMetaModel.RemoveMetaDataType(AMetaDataType: PMetaDataType);
begin
  FMetaDataTypes.Delete(FMetaDataTypes.IndexOfObject(AMetaDataType));
end;

function PMetaModel.IndexOfMetaDataType(AMetaDataType: PMetaDataType): Integer;
begin
  Result := FMetaDataTypes.IndexOfObject(AMetaDataType);
end;

procedure PMetaModel.AddMetaEnumeration(AMetaEnumeration: PMetaEnumeration);
begin
  FMetaEnumerations.AddObject(AMetaEnumeration.Name, AMetaEnumeration);
end;

procedure PMetaModel.RemoveMetaEnumeration(AMetaEnumeration: PMetaEnumeration);
begin
  FMetaEnumerations.Delete(FMetaEnumerations.IndexOfObject(AMetaEnumeration));
end;

function PMetaModel.IndexOfMetaEnumeration(AMetaEnumeration: PMetaEnumeration)
  : Integer;
begin
  Result := FMetaEnumerations.IndexOfObject(AMetaEnumeration);
end;

function PMetaModel.FindMetaClassifier(AName: string): PMetaClassifier;
var
  M: PMetaClassifier;
begin
  M := FindMetaPrimitiveType(AName);
  if M = nil then
    M := FindMetaDataType(AName);
  if M = nil then
    M := FindMetaEnumeration(AName);
  if M = nil then
    M := FindMetaClass(AName);
  Result := M;
end;

function PMetaModel.FindMetaPrimitiveType(AName: string): PMetaPrimitiveType;
var
  Idx: Integer;
begin
  Idx := FMetaPrimitiveTypes.IndexOf(AName);
  if Idx < 0 then
    Result := nil
  else
    Result := FMetaPrimitiveTypes.Objects[Idx] as PMetaPrimitiveType;
end;

function PMetaModel.FindMetaDataType(AName: string): PMetaDataType;
var
  Idx: Integer;
begin
  Idx := FMetaDataTypes.IndexOf(AName);
  if Idx < 0 then
    Result := nil
  else
    Result := FMetaDataTypes.Objects[Idx] as PMetaDataType;
end;

function PMetaModel.FindMetaEnumeration(AName: string): PMetaEnumeration;
var
  Idx: Integer;
begin
  Idx := FMetaEnumerations.IndexOf(AName);
  if Idx < 0 then
    Result := nil
  else
    Result := FMetaEnumerations.Objects[Idx] as PMetaEnumeration;
end;

function PMetaModel.FindMetaClass(AName: string): PMetaClass;
var
  Idx: Integer;
begin
  Idx := FMetaClasses.IndexOf(AName);
  if Idx < 0 then
    Result := nil
  else
    Result := FMetaClasses.Objects[Idx] as PMetaClass;
end;

function PMetaModel.DefineMetaPrimitiveType(AName: string): PMetaPrimitiveType;
var
  M: PMetaPrimitiveType;
begin
  M := PMetaPrimitiveType.Create;
  M.Name := AName;
  AddMetaPrimitiveType(M);
  Result := M;
end;

function PMetaModel.DefineMetaDataType(AName: string): PMetaDataType;
var
  M: PMetaDataType;
begin
  M := PMetaDataType.Create;
  M.Name := AName;
  AddMetaDataType(M);
  Result := M;
end;

function PMetaModel.DefineMetaEnumeration(AName: string): PMetaEnumeration;
var
  M: PMetaEnumeration;
begin
  M := PMetaEnumeration.Create;
  M.Name := AName;
  AddMetaEnumeration(M);
  Result := M;
end;

function PMetaModel.DefineMetaClass(AElementClass: PElementClass;
  AName: string; Abst: Boolean): PMetaClass;
var
  M: PMetaClass;
begin
  M := PMetaClass.Create;
  M.Name := AName;
  M.ElementClass := AElementClass;
  M.IsAbstract := Abst;
  AddMetaClass(M);
  Result := M;
end;

procedure PMetaModel.DefineMetaAttribute(AMetaClass: PMetaClass;
  AName, ATypeName: string; AReadOnly, ADerived: Boolean;
  ADefaultValue: string = '');
var
  M: PMetaAttribute;
begin
  M := PMetaAttribute.Create;
  M.Name := AName;
  M.TypeRef := FindMetaClassifier(ATypeName);
  M.IsReadOnly := AReadOnly;
  M.IsDerived := ADerived;
  if ADefaultValue = '' then
  begin
    if M.TypeRef.Name = 'Integer' then
      M.DefaultValue := '0'
    else if M.TypeRef.Name = 'Boolean' then
      M.DefaultValue := 'False'
    else if M.TypeRef.Name = 'String' then
      M.DefaultValue := ''
    else if M.TypeRef.Name = 'Real' then
      M.DefaultValue := '0'
    else
      M.DefaultValue := '';
  end
  else
    M.DefaultValue := ADefaultValue;
  AMetaClass.AddMetaAttribute(M);
end;

procedure PMetaModel.DefineMetaReference(AMetaClass: PMetaClass;
  AName, ATypeName: string; AReadOnly, ADerived: Boolean;
  Aggr: PMetaAggregateKind; OtherSide: string = '';
  OtherSideKind: PMetaAssociationEndKind = maeReference);
var
  M: PMetaReference;
begin
  M := PMetaReference.Create;
  M.Name := AName;
  M.TypeRef := FindMetaClassifier(ATypeName);
  M.IsReadOnly := AReadOnly;
  M.IsDerived := ADerived;
  M.Aggregate := Aggr;
  M.OtherSide := OtherSide;
  M.OtherSideKind := OtherSideKind;
  AMetaClass.AddMetaReference(M);
end;

procedure PMetaModel.DefineMetaCollection(AMetaClass: PMetaClass;
  AName, ATypeName: string; AReadOnly, ADerived: Boolean;
  Aggr: PMetaAggregateKind; OtherSide: string = '';
  OtherSideKind: PMetaAssociationEndKind = maeReference);
var
  M: PMetaCollection;
begin
  M := PMetaCollection.Create;
  M.Name := AName;
  M.TypeRef := FindMetaClassifier(ATypeName);
  M.IsReadOnly := AReadOnly;
  M.IsDerived := ADerived;
  M.Aggregate := Aggr;
  M.OtherSide := OtherSide;
  M.OtherSideKind := OtherSideKind;
  AMetaClass.AddMetaCollection(M);
end;

procedure PMetaModel.DefineMetaLiteral(AMetaEnumeration: PMetaEnumeration;
  AName: string);
var
  M: PMetaLiteral;
begin
  M := PMetaLiteral.Create;
  M.Name := AName;
  AMetaEnumeration.AddMetaLiteral(M);
end;

procedure PMetaModel.DefineMetaInheritance(SuperclassName,
  SubclassName: string);
begin
  FindMetaClass(SubclassName).Superclass := FindMetaClass(SuperclassName);
end;

// PMetaModel
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PExtendedAttribute

constructor PExtendedAttribute.Create(AKey, AValue: string);
begin
  inherited Create;
  FKey := AKey;
  FValue := AValue;
end;

function PExtendedAttribute.GetAsInteger: Integer;
var
  Val: Integer;
begin
  if Trim(FValue) = '' then
  begin
    Result := 0;
    Exit;
  end;
  try
    Val := StrToInt(FValue);
  except
    Val := 0;
  end;
  Result := Val;
end;

function PExtendedAttribute.GetAsBoolean: Boolean;
var
  Val: Boolean;
begin
  if Trim(FValue) = '' then
  begin
    Result := False;
    Exit;
  end;
  try
    Val := StrToBool(FValue);
  except
    Val := False;
  end;
  Result := Val;
end;

function PExtendedAttribute.GetAsFloat: Extended;
var
  Val: Extended;
begin
  if Trim(FValue) = '' then
  begin
    Result := 0.0;
    Exit;
  end;
  try
    Val := StrToFloat(FValue);
  except
    Val := 0.0;
  end;
  Result := Val;
end;

procedure PExtendedAttribute.SetAsInteger(Value: Integer);
begin
  FValue := IntToStr(Value);
end;

procedure PExtendedAttribute.SetAsBoolean(Value: Boolean);
begin
  FValue := BoolToStr(Value);
end;

procedure PExtendedAttribute.SetAsFloat(Value: Extended);
begin
  FValue := FloatToStr(Value);
end;

// PExtendedAttribute
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PElement

constructor PElement.Create;
begin
  inherited;
  FMetaClass := nil;
  FDocument := nil;
  FExtendedAttributeList := PExtendedAttributeList.Create;
end;

destructor PElement.Destroy;
begin
  Document := nil;
  MetaClass := nil;
  FExtendedAttributeList.Free;
  inherited;
end;

procedure PElement.BeforeDestruction;
var
  I, J: Integer;
  R: PMetaReference;
  C: PMetaCollection;
  E: PElement;
begin
  inherited;
  // Free sub objects
  if MetaClass <> nil then
  begin
    for I := 0 to MetaClass.MetaReferenceCount - 1 do
    begin
      R := MetaClass.MetaReferences[I];
      if R.Aggregate = makComposite then
      begin
        E := MOF_GetReference(R.Name);
        MOF_SetReference(R.Name, nil);
        E.Free;
      end
      else
      begin
        MOF_SetReference(R.Name, nil);
      end;
    end;
    for I := 0 to MetaClass.MetaCollectionCount - 1 do
    begin
      C := MetaClass.MetaCollections[I];
      if C.Aggregate = makComposite then
      begin
        for J := MOF_GetCollectionCount(C.Name) - 1 downto 0 do
        begin
          E := MOF_GetCollectionItem(C.Name, J);
          MOF_RemoveCollectionItem(C.Name, E);
          E.Free;
        end;
        MOF_ClearCollection(C.Name);
      end
      else
      begin
        MOF_ClearCollection(C.Name);
      end;
    end;
  end;
end;

procedure PElement.SetTag(Value: string);
begin
  if FTag <> Value then
  begin
    FTag := Value;
  end;
end;

function PElement.GetReadOnly: Boolean;
var
  D: PDocument;
begin
  D := GetContainingDocument;
  if D <> nil then
    Result := D.ReadOnly
  else
    Result := False;
end;

procedure PElement.SetMetaClass(Value: PMetaClass);
begin
  if FMetaClass <> Value then
  begin
    if FMetaClass <> nil then
      FMetaClass.FInstances.Remove(Self);
    FMetaClass := Value;
    if FMetaClass <> nil then
      FMetaClass.FInstances.Add(Self);
  end;
end;

procedure PElement.SetDocument(Value: PDocument);
begin
  if FDocument <> Value then
  begin
    if FDocument <> nil then
      FDocument.FDocumentElement := nil;
    FDocument := Value;
    if FDocument <> nil then
      FDocument.FDocumentElement := Self;
  end;
end;

function PElement.FindExtendedAttribute(Key: string): PExtendedAttribute;
var
  EA: PExtendedAttribute;
begin
  for EA in  FExtendedAttributeList do
  begin
    if Trim(EA.Key) = Trim(Key) then
    begin
      Result := EA;
      Exit;
    end;
  end;
  Result := nil;
end;

function PElement.GetExtendedAttribute(Key: string): PExtendedAttribute;
var
  EA: PExtendedAttribute;
begin
  EA := FindExtendedAttribute(Key);
  if EA <> nil then
    Result := EA
  else
  begin
    EA := PExtendedAttribute.Create(Key, '');
    FExtendedAttributeList.Add(EA);
    Result := EA;
  end;
end;

procedure PElement.BeforeStore(Reader: PObjectWriter);
begin
  // Reserved for next version.
end;

procedure PElement.BeforeLoad(Reader: PObjectReader);
begin
  // Reserved for next version.
end;

procedure PElement.AfterStore(Reader: PObjectWriter);
begin
  // Reserved for next version.
end;

procedure PElement.AfterLoad(Reader: PObjectReader);
begin
  // Reserved for next version.
end;

procedure PElement.Store(Writer: PObjectWriter);
var
  I, J, Cnt: Integer;
  A: PMetaAttribute;
  R: PMetaReference;
  C: PMetaCollection;
  E: PElement;
  L: TList;
  EA: PExtendedAttribute;
  DefaultInteger: Integer;
  DefaultBoolean: Boolean;
  DefaultReal: Extended;
  DefaultString: string;
  CollectionItem: PElement;
  StrIdx: string;
begin
  inherited;
  BeforeStore(Writer);
  // Store Attributes
  for I := 0 to MetaClass.MetaAttributeCount - 1 do
  begin
    A := MetaClass.MetaAttributes[I];
    if not A.IsDerived then
    begin
      // - Storing Integer Value
      if A.TypeRef.Name = 'Integer' then
      begin
        try
          DefaultInteger := StrToInt(A.DefaultValue);
        except
          DefaultInteger := 0;
        end;
        Writer.WriteInteger(A.Name, StringToInteger(MOF_GetAttribute(A.Name)),
          DefaultInteger);
      end
      // - Storing Boolean Value
      else if A.TypeRef.Name = 'Boolean' then
      begin
        try
          DefaultBoolean := StrToBool(A.DefaultValue);
        except
          DefaultBoolean := False;
        end;
        Writer.WriteBoolean(A.Name, StringToBoolean(MOF_GetAttribute(A.Name)),
          DefaultBoolean);
      end
      // - Storing Real Value
      else if A.TypeRef.Name = 'Real' then
      begin
        try
          DefaultReal := StrToFloat(A.DefaultValue);
        except
          DefaultReal := 0.0;
        end;
        Writer.WriteReal(A.Name, StringToReal(MOF_GetAttribute(A.Name)),
          DefaultReal);
      end
      // - Storing String Value
      else if A.TypeRef.Name = 'String' then
      begin
        DefaultString := A.DefaultValue;
        Writer.WriteString(A.Name, MOF_GetAttribute(A.Name), DefaultString);
      end
      // - Storing UserDefined Value
      else
      begin
        DefaultString := A.DefaultValue;
        Writer.WriteUserDefinedType(A.TypeRef.Name, A.Name,
          MOF_GetAttribute(A.Name), DefaultString);
      end;
    end;
  end;
  // Store References
  for I := 0 to MetaClass.MetaReferenceCount - 1 do
  begin
    R := MetaClass.MetaReferences[I];
    if not R.IsDerived then
    begin
      E := MOF_GetReference(R.Name);
      if R.Aggregate = makComposite then
      begin
        if (E <> nil) and E.IsDocumentElement then
        begin
          // if Stored Object is DocumentElement, don't save
        end
        else
        begin
          Writer.WriteObject(R.Name, MOF_GetReference(R.Name))
        end;
      end
      else
      begin
        Writer.WriteReference(R.Name, MOF_GetReference(R.Name));
      end;
    end;
  end;
  // Store Collections
  L := TList.Create;
  for I := 0 to MetaClass.MetaCollectionCount - 1 do
  begin
    C := MetaClass.MetaCollections[I];
    if not C.IsDerived then
    begin
      Cnt := MOF_GetCollectionCount(C.Name);
      if C.Aggregate = makComposite then
      begin
        // gather to list L objects which are not DocumentElement
        L.Clear;
        for J := 0 to Cnt - 1 do
        begin
          E := MOF_GetCollectionItem(C.Name, J);
          if (E <> nil) and (not E.IsDocumentElement) then
            L.Add(E);
        end;
        // Save objects gathered in list L
        Writer.WriteInteger('#' + C.Name, L.Count);
        for J := 0 to L.Count - 1 do
          Writer.WriteObject(C.Name + '[' + IntToStr(J) + ']', L.Items[J]);
      end
      else
      begin
        Writer.WriteInteger('#' + C.Name, Cnt);
        for J := 0 to Cnt - 1 do begin
          CollectionItem := MOF_GetCollectionItem(C.Name, J);
          StrIdx := C.Name + '[' + IntToStr(J) + ']';
          Writer.WriteReference(StrIdx, CollectionItem);
        end;
      end;
    end;
  end;
  L.Free;
  // Store extended attributes
  Writer.WriteInteger('ExtendedAttributeCount', GetExtendedAttributeCount);
  for I := 0 to GetExtendedAttributeCount - 1 do
  begin
    EA := GetExtendedAttributeAt(I);
    Writer.WriteString('ExtendedAttributeKey[' + IntToStr(I) + ']', EA.Key);
    Writer.WriteString('ExtendedAttributeValue[' + IntToStr(I) + ']', EA.Value);
  end;
  AfterStore(Writer);
end;

procedure PElement.Load(Reader: PObjectReader);
var
  I, J, Cnt: Integer;
  A: PMetaAttribute;
  R: PMetaReference;
  C: PMetaCollection;
  E: PElement;
  IntegerVal: Integer;
  BooleanVal: Boolean;
  RealVal: Real;
  StringVal: string;
  UserVal: string;
begin
  inherited;
  BeforeLoad(Reader);
  // Load attributes
  for I := 0 to MetaClass.MetaAttributeCount - 1 do
  begin
    A := MetaClass.MetaAttributes[I];
    if not A.IsDerived then
    begin
      if A.TypeRef.Name = 'Integer' then
      begin
        if A.DefaultValue = '' then
          IntegerVal := Reader.ReadInteger(A.Name)
        else
          IntegerVal := Reader.ReadInteger(A.Name,
            StringToInteger(A.DefaultValue));
        MOF_SetAttribute(A.Name, IntegerToString(IntegerVal));
      end
      else if A.TypeRef.Name = 'Boolean' then
      begin
        if A.DefaultValue = '' then
          BooleanVal := Reader.ReadBoolean(A.Name)
        else
          BooleanVal := Reader.ReadBoolean(A.Name,
            StringToBoolean(A.DefaultValue));
        MOF_SetAttribute(A.Name, BooleanToString(BooleanVal));
      end
      else if A.TypeRef.Name = 'Real' then
      begin
        if A.DefaultValue = '' then
          RealVal := Reader.ReadReal(A.Name)
        else
          RealVal := Reader.ReadReal(A.Name, StringToReal(A.DefaultValue));
        MOF_SetAttribute(A.Name, RealToString(RealVal));
      end
      else if A.TypeRef.Name = 'String' then
      begin
        StringVal := Reader.ReadString(A.Name, A.DefaultValue);
        MOF_SetAttribute(A.Name, StringVal);
      end
      else
      begin
        UserVal := Reader.ReadUserDefinedType(A.TypeRef.Name, A.Name,
          A.DefaultValue);
        MOF_SetAttribute(A.Name, UserVal);
      end;
    end;
  end;
  // Load references
  for I := 0 to MetaClass.MetaReferenceCount - 1 do
  begin
    R := MetaClass.MetaReferences[I];
    if not R.IsDerived then
    begin
      if R.Aggregate = makComposite then
        MOF_SetReference(R.Name, Reader.ReadObject(R.Name) as PElement)
      else
        MOF_SetReference(R.Name, Reader.ReadReference(R.Name) as PElement);
    end;
  end;
  // Load collections
  for I := 0 to MetaClass.MetaCollectionCount - 1 do
  begin
    C := MetaClass.MetaCollections[I];
    if not C.IsDerived then
    begin
      MOF_ClearCollection(C.Name);
      Cnt := Reader.ReadInteger('#' + C.Name);
      if C.Aggregate = makComposite then
        for J := 0 to Cnt - 1 do
        begin
          E := Reader.ReadObject(C.Name + '[' + IntToStr(J) + ']') as PElement;
          MOF_AddCollectionItem(C.Name, E);
        end
        else
          for J := 0 to Cnt - 1 do
          begin
            E := Reader.ReadReference(C.Name + '[' + IntToStr(J) + ']')
              as PElement;
            MOF_AddCollectionItem(C.Name, E);
          end;
    end;
  end;
  // Load extended attributes
  Cnt := Reader.ReadInteger('ExtendedAttributeCount');
  ClearExtendedAttributes;
  for I := 0 to Cnt - 1 do
  begin
    AddExtendedAttribute(Reader.ReadString('ExtendedAttributeKey[' + IntToStr
          (I) + ']'),
      Reader.ReadString('ExtendedAttributeValue[' + IntToStr(I) + ']'));
  end;
  AfterLoad(Reader);
end;

procedure PElement.Isolate;
var
  I: Integer;
  R: PMetaReference;
  C: PMetaCollection;
begin
  for I := 0 to MetaClass.MetaReferenceCount - 1 do
  begin
    R := MetaClass.MetaReferences[I];
    if not R.IsDerived then
      MOF_SetReference(R.Name, nil);
  end;
  for I := 0 to MetaClass.MetaCollectionCount - 1 do
  begin
    C := MetaClass.MetaCollections[I];
    if not C.IsDerived then
      MOF_ClearCollection(C.Name);
  end;
  Document := nil;
  MetaClass := nil;
end;

procedure PElement.Accept(Visitor: PVisitor);
begin
  Visitor.Visit(Self);
end;

function PElement.CreateMemento: PMemento;
begin
  Result := PMemento.Create(Self);
end;

procedure PElement.SetMemento(Memento: PMemento);
begin
  Memento.AssignTo(Self);
end;

function PElement.IsDocumentElement: Boolean;
begin
  Result := (FDocument <> nil);
end;

function PElement.GetContainingDocument: PDocument;
begin
  Result := FDocument;
end;

procedure PElement.ClearExtendedAttributes;
var
  EA: PExtendedAttribute;
begin
  for EA in FExtendedAttributeList do
    EA.Free;
  FExtendedAttributeList.Clear;
end;

function PElement.GetExtendedAttributeAt(Index: Integer): PExtendedAttribute;
begin
  Result := FExtendedAttributeList.Items[Index];
end;

function PElement.GetExtendedAttributeCount: Integer;
begin
  Result := FExtendedAttributeList.Count;
end;

procedure PElement.AddExtendedAttribute(Key, Value: string);
var
  EA: PExtendedAttribute;
begin
  EA := PExtendedAttribute.Create(Key, Value);
  FExtendedAttributeList.Add(EA);
end;

function PElement.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'Tag' then
    Result := Tag
  else
    raise EMetaAttributeNotExist.Create
      ('There is no such Attribute (' + Name + ')');
end;

procedure PElement.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'Tag' then
    Tag := Value
  else
    raise EMetaAttributeNotExist.Create
      ('There is no such Attribute (' + Name + ')');
end;

function PElement.MOF_GetReference(Name: string): PElement;
begin
  raise EMetaReferenceNotExist.Create
    ('There is no such Reference (' + Name + ')');
end;

procedure PElement.MOF_SetReference(Name: string; Value: PElement);
begin
  raise EMetaReferenceNotExist.Create
    ('There is no such Reference (' + Name + ')');
end;

procedure PElement.MOF_AddCollectionItem(Name: string; Value: PElement);
begin
  raise EMetaCollectionNotExist.Create
    ('There is no such Collection (' + Name + ')');
end;

procedure PElement.MOF_RemoveCollectionItem(Name: string; Value: PElement);
begin
  raise EMetaCollectionNotExist.Create
    ('There is no such Collection (' + Name + ')');
end;

procedure PElement.MOF_InsertCollectionItem(Name: string; Index: Integer;
  Value: PElement);
begin
  raise EMetaCollectionNotExist.Create
    ('There is no such Collection (' + Name + ')');
end;

procedure PElement.MOF_DeleteCollectionItem(Name: string; Index: Integer);
begin
  raise EMetaCollectionNotExist.Create
    ('There is no such Collection (' + Name + ')');
end;

procedure PElement.MOF_ClearCollection(Name: string);
begin
  raise EMetaCollectionNotExist.Create
    ('There is no such Collection (' + Name + ')');
end;

function PElement.MOF_IndexOfCollectionItem(Name: string;
  Value: PElement): Integer;
begin
  raise EMetaCollectionNotExist.Create
    ('There is no such Collection (' + Name + ')');
end;

function PElement.MOF_GetCollectionItem(Name: string; Index: Integer): PElement;
begin
  raise EMetaCollectionNotExist.Create
    ('There is no such Collection (' + Name + ')');
end;

function PElement.MOF_GetCollectionCount(Name: string): Integer;
begin
  raise EMetaCollectionNotExist.Create
    ('There is no such Collection (' + Name + ')');
end;

// PElement
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PMemento

constructor PMemento.Create(Element: PElement);
begin
  FMetaClass := nil;
  FDocument := nil;
  Attributes := TList.Create;
  References := TList.Create;
  Collections := TList.Create;
  AttributeValues := TStringList.Create;
  ReferenceValues := TList.Create;
  ReferenceIndexes := TStringList.Create;
  CollectionValues := TList.Create;
  ExtendedAttributeKeys := TStringList.Create;
  ExtendedAttributeValues := TStringList.Create;
  AssignFrom(Element);
end;

destructor PMemento.Destroy;
var
  I: Integer;
  L: TList;
begin
  Attributes.Free;
  References.Free;
  Collections.Free;
  AttributeValues.Free;
  ReferenceValues.Free;
  ReferenceIndexes.Free;
  for I := CollectionValues.Count - 1 downto 0 do
  begin
    L := CollectionValues.Items[I];
    L.Free;
  end;
  CollectionValues.Free;
  ExtendedAttributeKeys.Free;
  ExtendedAttributeValues.Free;
  inherited;
end;

procedure PMemento.AssignFrom(Element: PElement);
var
  I, J: Integer;
  A: PMetaAttribute;
  R: PMetaReference;
  C: PMetaCollection;
  OtherSide: PMetaAssociationEnd;
  V: PElement;
  EA: PExtendedAttribute;
  L: TList;
begin
  FMetaClass := Element.MetaClass;
  FDocument := Element.Document;
  // Assign attributes
  for I := 0 to Element.MetaClass.MetaAttributeCount - 1 do
  begin
    A := Element.MetaClass.MetaAttributes[I];
    if not A.IsDerived then
    begin
      Attributes.Add(A);
      AttributeValues.Add(Element.MOF_GetAttribute(A.Name));
    end;
  end;
  // Assign references
  for I := 0 to Element.MetaClass.MetaReferenceCount - 1 do
  begin
    R := Element.MetaClass.MetaReferences[I];
    OtherSide := R.GetOtherSideEnd;
    if not R.IsDerived then
    begin
      V := Element.MOF_GetReference(R.Name);
      References.Add(R);
      ReferenceValues.Add(V);
      if (OtherSide = nil) or OtherSide.IsDerived or
        (OtherSide.Kind = maeReference) or (V = nil) then
        ReferenceIndexes.Add(IntToStr(-1))
      else
        ReferenceIndexes.Add(IntToStr(V.MOF_IndexOfCollectionItem(R.OtherSide,
              Element)));
    end;
  end;
  // Assign collections
  for I := 0 to Element.MetaClass.MetaCollectionCount - 1 do
  begin
    C := Element.MetaClass.MetaCollections[I];
    if not C.IsDerived then
    begin
      Collections.Add(C);
      L := TList.Create;
      for J := 0 to Element.MOF_GetCollectionCount(C.Name) - 1 do
      begin
        L.Add(Element.MOF_GetCollectionItem(C.Name, J));
      end;
      CollectionValues.Add(L);
    end;
  end;
  // Assign extended attributes
  for I := 0 to Element.GetExtendedAttributeCount - 1 do
  begin
    EA := Element.GetExtendedAttributeAt(I);
    ExtendedAttributeKeys.Add(EA.Key);
    ExtendedAttributeValues.Add(EA.Value);
  end;
end;

procedure PMemento.AssignTo(Element: PElement);
var
  I, J: Integer;
  A: PMetaAttribute;
  R: PMetaReference;
  C: PMetaCollection;
  OtherSide: PMetaAssociationEnd;
  V: PElement;
  L: TList;
begin
  Element.MetaClass := FMetaClass;
  Element.Document := FDocument;
  // Assign attributes
  for I := 0 to Attributes.Count - 1 do
  begin
    A := Attributes.Items[I];
    Element.MOF_SetAttribute(A.Name, AttributeValues.Strings[I]);
  end;
  // Assign references
  for I := 0 to References.Count - 1 do
  begin
    R := References.Items[I];
    OtherSide := R.GetOtherSideEnd;
    V := ReferenceValues.Items[I];
    if (OtherSide = nil) or OtherSide.IsDerived or
      (OtherSide.Kind = maeReference) or (V = nil) then
      Element.MOF_SetReference(R.Name, ReferenceValues.Items[I])
    else
    begin
      if V.MOF_GetCollectionCount(OtherSide.Name) < StrToInt
        (ReferenceIndexes[I]) then
        V.MOF_AddCollectionItem(OtherSide.Name, Element)
      else
        V.MOF_InsertCollectionItem(OtherSide.Name,
          StrToInt(ReferenceIndexes[I]), Element);
    end;
  end;
  // Assign collections
  for I := 0 to Collections.Count - 1 do
  begin
    C := Collections.Items[I];
    L := CollectionValues.Items[I];
    Element.MOF_ClearCollection(C.Name);
    for J := 0 to L.Count - 1 do
    begin
      Element.MOF_AddCollectionItem(C.Name, L.Items[J]);
    end;
  end;
  // Assign extended attributes
  for I := 0 to ExtendedAttributeKeys.Count - 1 do
  begin
    Element.ClearExtendedAttributes;
    Element.ExtendedAttribute[ExtendedAttributeKeys.Strings[I]].Value :=
      ExtendedAttributeValues.Strings[I];
  end;
end;

// PMemento
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PReferenceCollectionVisitor

constructor PReferenceCollectionVisitor.Create;
begin
  FReferences := POrderedSet.Create;
end;

destructor PReferenceCollectionVisitor.Destroy;
begin
  FReferences.Free;
  FReferences := nil;
  inherited;
end;

function PReferenceCollectionVisitor.GetReference(Index: Integer): PObject;
begin
  Result := FReferences.Items[Index];
end;

function PReferenceCollectionVisitor.GetReferenceCount: Integer;
begin
  Result := FReferences.Count;
end;

procedure PReferenceCollectionVisitor.Clear;
begin
  FReferences.Clear;
end;

procedure PReferenceCollectionVisitor.Visit(Element: PElement);
begin
  FReferences.Add(Element);
end;

// PReferenceCollectionVisitor
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PModel

constructor PModel.Create;
begin
  inherited Create;
  FViews := PViewOrderedSet.Create;
  FOwnedDiagrams := PDiagramOrderedSet.Create;
  FVirtualOwnedModels := PModelOrderedSet.Create;
  FVirtualNamespace := nil;
  FAttachments := TStringList.Create;
end;

destructor PModel.Destroy;
begin
  FViews.Free;
  FViews := nil;
  FOwnedDiagrams.Free;
  FOwnedDiagrams := nil;
  FVirtualOwnedModels.Free;
  FVirtualOwnedModels := nil;
  FVirtualNamespace := nil;
  FAttachments.Free;
  FAttachments := nil;
  inherited;
end;

procedure PModel.Accept(Visitor: PVisitor);
var
  I: Integer;
begin
  inherited;
  for I := 0 to VirtualOwnedModelCount - 1 do
    VirtualOwnedModels[I].Accept(Visitor);
end;

procedure PModel.SetName(Value: string);
begin
  if FName <> Value then
  begin
    FName := Value;
  end;
end;

procedure PModel.SetDocumentation(Value: string);
begin
  if FDocumentation <> Value then
  begin
    FDocumentation := Value;
  end;
end;

function PModel.GetPathname: string;
begin
  if FVirtualNamespace = nil then
    Result := FName
  else
    Result := FVirtualNamespace.GetPathname + PATH_DELIMITER + FName;
end;

function PModel.GetRootModel: PModel;
begin
  if FVirtualNamespace = nil then
    Result := Self
  else
    Result := FVirtualNamespace.GetRootModel;
end;

function PModel.GetView(Index: Integer): PView;
begin
  Result := FViews[Index];
end;

function PModel.GetViewCount: Integer;
begin
  Result := FViews.Count;
end;

function PModel.GetOwnedDiagram(Index: Integer): PDiagram;
begin
  Result := FOwnedDiagrams[Index];
end;

function PModel.GetOwnedDiagramCount: Integer;
begin
  Result := FOwnedDiagrams.Count;
end;

function PModel.GetVirtualOwnedModel(Index: Integer): PModel;
begin
  Result := FVirtualOwnedModels[Index];
end;

function PModel.GetVirtualOwnedModelCount: Integer;
begin
  Result := FVirtualOwnedModels.Count;
end;

procedure PModel.SetVirtualNamespace(Value: PModel);
begin
  if FVirtualNamespace <> Value then
  begin
    if FVirtualNamespace <> nil then
      FVirtualNamespace.FVirtualOwnedModels.Remove(Self);
    FVirtualNamespace := Value;
    if Value <> nil then
      Value.FVirtualOwnedModels.Add(Self);
  end;
end;

procedure PModel.ClearViews;
var
  I: Integer;
begin
  for I := FViews.Count - 1 downto 0 do
    DeleteView(I);
end;

procedure PModel.AddView(AView: PView);
begin
  if (AView <> nil) and (not FViews.Contains(AView)) then
  begin
    if AView.FModel <> nil then
      AView.FModel.FViews.Remove(AView);
    FViews.Add(AView);
    AView.FModel := Self;
  end;
end;

procedure PModel.RemoveView(AView: PView);
begin
  if AView <> nil then
  begin
    FViews.Remove(AView);
    AView.FModel := nil;
  end;
end;

procedure PModel.InsertView(Index: Integer; AView: PView);
begin
  if (AView <> nil) and (not FViews.Contains(AView)) then
  begin
    if AView.FModel <> nil then
      AView.FModel.FViews.Remove(AView);
    FViews.Insert(Index, AView);
    AView.FModel := Self;
  end;
end;

procedure PModel.DeleteView(Index: Integer);
begin
  RemoveView(FViews[Index]);
end;

function PModel.IndexOfView(AView: PView): Integer;
begin
  Result := FViews.IndexOf(AView);
end;

procedure PModel.UpdateViews;
var
  View: PView;
  //I: Integer;
begin
  //for I := 0 to FViews.Count - 1 do
  //begin (FViews.Items[I])
  //  .Update;
  //end;

  for View in FViews do
    View.Update;

end;

procedure PModel.ClearOwnedDiagrams;
var
  I: Integer;
begin
  for I := FOwnedDiagrams.Count - 1 downto 0 do
    FOwnedDiagrams.Delete(I);
end;

procedure PModel.AddOwnedDiagram(ADiagram: PDiagram);
begin
  if (ADiagram <> nil) and (not FOwnedDiagrams.Contains(ADiagram)) then
  begin
    if ADiagram.FDiagramOwner <> nil then
    begin
      ADiagram.FDiagramOwner.FOwnedDiagrams.Remove(ADiagram);
      ADiagram.FDiagramOwner.RemoveVirtualOwnedModel(ADiagram);
      // Remove from VirtualOwnedModels
    end;
    FOwnedDiagrams.Add(ADiagram);
    ADiagram.FDiagramOwner := Self;
    AddVirtualOwnedModel(ADiagram); // Add to VirtualOwnedModels
  end;
end;

procedure PModel.RemoveOwnedDiagram(ADiagram: PDiagram);
begin
  if ADiagram <> nil then
  begin
    FOwnedDiagrams.Remove(ADiagram);
    if ADiagram.FDiagramOwner = Self then
      ADiagram.FDiagramOwner := nil;
    RemoveVirtualOwnedModel(ADiagram); // Remove from VirtualOwnedModels
  end;
end;

procedure PModel.InsertOwnedDiagram(Index: Integer; ADiagram: PDiagram);
begin
  if (ADiagram <> nil) and (not FOwnedDiagrams.Contains(ADiagram)) then
  begin
    if ADiagram.FDiagramOwner <> nil then
    begin
      ADiagram.FDiagramOwner.FOwnedDiagrams.Remove(ADiagram);
      ADiagram.FDiagramOwner.RemoveVirtualOwnedModel(ADiagram);
      // Remove from VirtualOwnedModels
    end;
    FOwnedDiagrams.Insert(Index, ADiagram);
    ADiagram.FDiagramOwner := Self;
    AddVirtualOwnedModel(ADiagram); // Add to VirtualOwnedModels
  end;
end;

procedure PModel.DeleteOwnedDiagram(Index: Integer);
begin
  RemoveOwnedDiagram(FOwnedDiagrams[Index]);
end;

function PModel.IndexOfOwnedDiagram(ADiagram: PDiagram): Integer;
begin
  Result := FOwnedDiagrams.IndexOf(ADiagram);
end;

procedure PModel.AddVirtualOwnedModel(Model: PModel);
begin
  if (Model <> nil) and (not FVirtualOwnedModels.Contains(Model)) then
  begin
    if Model.FVirtualNamespace <> nil then
      Model.FVirtualNamespace.FVirtualOwnedModels.Remove(Model);
    FVirtualOwnedModels.Add(Model);
    Model.FVirtualNamespace := Self;
  end;
end;

procedure PModel.RemoveVirtualOwnedModel(Model: PModel);
begin
  if Model <> nil then
  begin
    if Model.FVirtualNamespace = Self then
      Model.FVirtualNamespace := nil;
    FVirtualOwnedModels.Remove(Model);
  end;
end;

procedure PModel.InsertVirtualOwnedModel(Index: Integer; Model: PModel);
begin
  if (Model <> nil) and (not FVirtualOwnedModels.Contains(Model)) then
  begin
    if Model.FVirtualNamespace <> nil then
      Model.FVirtualNamespace.FVirtualOwnedModels.Remove(Model);
    FVirtualOwnedModels.Insert(Index, Model);
    Model.FVirtualNamespace := Self;
  end;
end;

function PModel.IndexOfVirtualOwnedModel(Model: PModel): Integer;
begin
  Result := FVirtualOwnedModels.IndexOf(Model);
end;

function PModel.IsOneOfTheContainers(Model: PModel): Boolean;
begin
  if (VirtualNamespace = nil) or (Model = Self) then
    Result := False
  else if Model = VirtualNamespace then
    Result := True
  else
    Result := VirtualNamespace.IsOneOfTheContainers(Model);
end;

function PModel.GetContainerRelation(Container: PModel): PMetaReference;
var
  I: Integer;
  R: PMetaReference;
  OtherSide: PMetaAssociationEnd;
begin
  Result := nil;
  for I := 0 to MetaClass.MetaReferenceCount - 1 do
  begin
    R := MetaClass.MetaReferences[I];
    OtherSide := R.GetOtherSideEnd;
    if (OtherSide <> nil) and (OtherSide.Aggregate = makComposite)
      and Container.MetaClass.IsKindOf(R.TypeRef.Name) and
      (MOF_GetReference(R.Name) = Container) then
    begin
      Result := R;
      Exit;
    end;
  end;
  Result := MetaClass.GetContainerRelation(Container.MetaClass);
end;

function PModel.CanContainKind(Kind: string): Boolean;
var
  MC: PMetaClass;
begin
  MC := MetaModel.FindMetaClass(Kind);
  if MC <> nil then
    Result := MC.GetContainerRelation(MetaClass) <> nil
  else
    Result := False;
end;

function PModel.CanContain(Model: PModel): Boolean;
begin
  if Model <> nil then
  begin
    if Model is PDiagram then
      Result := CanContainDiagram(Model as PDiagram)
    else
      Result := CanContainKind(Model.MetaClass.Name) and (Model <> Self) and
        (not IsOneOfTheContainers(Model))
  end
  else
    Result := False;
end;

function PModel.CanContainDiagramKind(Kind: string): Boolean;
begin
  Result := False;
end;

function PModel.CanContainDiagram(Diagram: PDiagram): Boolean;
begin
  Result := CanContainDiagramKind(Diagram.MetaClass.Name);
end;

function PModel.CanRelocateTo(Model: PModel): Boolean;
begin
  Result := Model.CanContain(Self);
end;

function PModel.CanCopy: Boolean;
begin
  Result := True;
end;

function PModel.CanDelete: Boolean;
begin
  Result := True;
end;

function PModel.CanPaste(Kind, CopyContext: string): Boolean;
begin
  Result := CanContainKind(Kind);
end;

function PModel.ContainsName(AName: string): Boolean;
begin
  Result := FindByName(AName) <> nil;
end;

function PModel.GenerateAvailableName(Model: PModel;
  Postfix: string = '_'): string;
var
  N: string;
  M: PModel;
begin
  N := Model.Name;
  if N <> '' then
  begin
    M := FindByName(N);
    while (M <> nil) and (M <> Model) do
    begin
      N := N + Postfix;
      M := FindByName(N);
    end;
  end;
  Result := N;
end;

function PModel.FindByName(AName: string): PModel;
var
  //I: Integer;
  M: PModel;
begin
  {for I := 0 to FVirtualOwnedModels.Count - 1 do
  begin
    M := FVirtualOwnedModels.Items[I] as PModel;
    if M.Name = AName then
    begin
      Result := M;
      Exit;
    end;
  end;}

  for M in FVirtualOwnedModels do begin
    if M.Name = AName then begin
      Result := M;
      Exit;
    end;
  end;

  Result := nil;

end;

function PModel.FindByRelativePathname(RelPath: string): PModel;
var
  M: PModel;
begin
  if ExtractTailPath(RelPath) = '' then
  begin
    Result := FindByName(RelPath);
  end
  else
  begin
    M := FindByName(ExtractHeadName(RelPath));
    if M = nil then
      Result := nil
    else
      Result := M.FindByRelativePathname(ExtractTailPath(RelPath));
  end;
end;

function PModel.GetContainingDocument: PDocument;
begin
  if IsDocumentElement then
    Result := Document
  else if VirtualNamespace <> nil then
    Result := VirtualNamespace.GetContainingDocument
  else
    Result := nil;
end;

procedure PModel.ClearAttachments;
begin
  FAttachments.Clear;
end;

procedure PModel.AddAttachment(Attach: string);
begin
  FAttachments.Add(Attach);
end;

procedure PModel.InsertAttachment(Index: Integer; Attach: string);
begin
  FAttachments.Insert(Index, Attach);
end;

procedure PModel.DeleteAttachment(Index: Integer);
begin
  FAttachments.Delete(Index);
end;

function PModel.GetAttachmentAt(Index: Integer): string;
begin
  Result := FAttachments.Strings[Index];
end;

function PModel.GetAttachmentCount: Integer;
begin
  Result := FAttachments.Count;
end;

function PModel.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'Name' then
  begin
    Result := Self.Name;
  end
  else if Name = 'Documentation' then
  begin
    Result := Documentation;
  end
  else if Name = 'Attachments' then
  begin
    Result := Attachments.Text;
  end
  else if Name = 'Pathname' then
  begin
    Result := Pathname;
  end
  else
  begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PModel.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'Name' then
  begin
    Self.Name := Value;
  end
  else if Name = 'Documentation' then
  begin
    Documentation := Value;
  end
  else if Name = 'Attachments' then
  begin
    Attachments.Text := Value;
  end
  else if Name = 'Pathname' then
  begin
    // Nothing to do.
  end
  else
  begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PModel.MOF_GetReference(Name: string): PElement;
begin
  Result := inherited MOF_GetReference(Name);
end;

procedure PModel.MOF_SetReference(Name: string; Value: PElement);
begin
  inherited MOF_SetReference(Name, Value);
end;

procedure PModel.MOF_AddCollectionItem(Name: string; Value: PElement);
begin
  if Name = 'Views' then
  begin
    AddView(Value as PView);
  end
  else if Name = 'OwnedDiagrams' then
  begin
    AddOwnedDiagram(Value as PDiagram);
  end
  else
  begin
    inherited MOF_AddCollectionItem(Name, Value);
  end;
end;

procedure PModel.MOF_RemoveCollectionItem(Name: string; Value: PElement);
begin
  if Name = 'Views' then
  begin
    RemoveView(Value as PView);
  end
  else if Name = 'OwnedDiagrams' then
  begin
    RemoveOwnedDiagram(Value as PDiagram);
  end
  else
  begin
    inherited MOF_RemoveCollectionItem(Name, Value);
  end;
end;

procedure PModel.MOF_InsertCollectionItem(Name: string; Index: Integer;
  Value: PElement);
begin
  if Name = 'Views' then
  begin
    InsertView(Index, Value as PView);
  end
  else if Name = 'OwnedDiagrams' then
  begin
    InsertOwnedDiagram(Index, Value as PDiagram);
  end
  else
  begin
    inherited MOF_InsertCollectionItem(Name, Index, Value);
  end;
end;

procedure PModel.MOF_DeleteCollectionItem(Name: string; Index: Integer);
begin
  if Name = 'Views' then
  begin
    DeleteView(Index);
  end
  else if Name = 'OwnedDiagrams' then
  begin
    DeleteOwnedDiagram(Index);
  end
  else
  begin
    inherited MOF_DeleteCollectionItem(Name, Index);
  end;
end;

procedure PModel.MOF_ClearCollection(Name: string);
begin
  if Name = 'Views' then
  begin
    ClearViews;
  end
  else if Name = 'OwnedDiagrams' then
  begin
    ClearOwnedDiagrams;
  end
  else
  begin
    inherited MOF_ClearCollection(Name);
  end;
end;

function PModel.MOF_IndexOfCollectionItem(Name: string;
  Value: PElement): Integer;
begin
  if Name = 'Views' then
  begin
    Result := IndexOfView(Value as PView);
  end
  else if Name = 'OwnedDiagrams' then
  begin
    Result := IndexOfOwnedDiagram(Value as PDiagram);
  end
  else
  begin
    Result := inherited MOF_IndexOfCollectionItem(Name, Value);
  end;
end;

function PModel.MOF_GetCollectionItem(Name: string; Index: Integer): PElement;
begin
  if Name = 'Views' then
  begin
    Result := View[Index];
  end
  else if Name = 'OwnedDiagrams' then
  begin
    Result := OwnedDiagrams[Index];
  end
  else
  begin
    Result := inherited MOF_GetCollectionItem(Name, Index);
  end;
end;

function PModel.MOF_GetCollectionCount(Name: string): Integer;
begin
  if Name = 'Views' then
  begin
    Result := ViewCount;
  end
  else if Name = 'OwnedDiagrams' then
  begin
    Result := OwnedDiagramCount;
  end
  else
  begin
    Result := inherited MOF_GetCollectionCount(Name);
  end;
end;

// PModel
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PView

constructor PView.Create;
begin
  inherited Create;
  FModel := nil;
  FParent := nil;
  FSubViews := POrderedSet.Create;
  FContainerView := nil;
  FContainedViews := POrderedSet.Create;
  FOwnerDiagramView := nil;
  FVisible := True;
  FEnabled := True;
  FSelected := False;
  FSelectable := True;
  FLineColor := clBlack;
  FFillColor := clWhite;
  FFontColor := clBlack;
  FFontFace := 'Tahoma';
  FFontSize := 8;
  FFontStyle := [];
  FContainerChangeable := True;
  FContainerExtending := True;
end;

destructor PView.Destroy;
begin
  FModel := nil;
  FParent := nil;
  FSubViews.Free;
  FSubViews := nil;
  FContainedViews.Free;
  FContainedViews := nil;
  inherited;
end;

procedure PView.Accept(Visitor: PVisitor);
var
  I: Integer;
begin
  inherited;
  for I := 0 to SubViewCount - 1 do
    SubViews[I].Accept(Visitor);
end;

procedure PView.SetSelected(Value: Boolean);
var
  DV: PDiagramView;
begin
  if FSelectable then
    if FSelected <> Value then
    begin
      DV := GetDiagramView;
      if DV <> nil then
      begin
        if Value then
          DV.FSelectedViews.Add(Self)
        else
          DV.FSelectedViews.Remove(Self);
      end;
      FSelected := Value;
    end;
end;

procedure PView.SetVisible(Value: Boolean);
begin
  if Value <> FVisible then
  begin
    FVisible := Value;
  end;
end;

procedure PView.SetEnabled(Value: Boolean);
begin
  if Value <> FEnabled then
  begin
    FEnabled := Value;
  end;
end;

procedure PView.SetSelectable(Value: Boolean);
begin
  if Value <> FSelectable then
  begin
    FSelectable := Value;
  end;
end;

function PView.GetLineColor: TColor;
begin
  if FParentLineColor and (FParent <> nil) then
    FLineColor := FParent.GetLineColor;
  Result := FLineColor;
end;

procedure PView.SetLineColor(Value: TColor);
begin
  if Value <> FLineColor then
  begin
    FLineColor := Value;
  end;
end;

function PView.GetFillColor: TColor;
begin
  if FParentFillColor and (FParent <> nil) then
    FFillColor := FParent.GetFillColor;
  Result := FFillColor;
end;

procedure PView.SetFillColor(Value: TColor);
begin
  if Value <> FFillColor then
  begin
    FFillColor := Value;
  end;
end;

function PView.GetFontColor: TColor;
begin
  if FParentFontColor and (FParent <> nil) then
    FFontColor := FParent.GetFontColor;
  Result := FFontColor;
end;

procedure PView.SetFontColor(Value: TColor);
begin
  if FFontColor <> Value then
  begin
    FFontColor := Value;
  end;
end;

function PView.GetFontFace: string;
begin
  if ParentFontFace and (FParent <> nil) then
    FFontFace := FParent.GetFontFace;
  Result := FFontFace;
end;

procedure PView.SetFontFace(Value: string);
begin
  if FFontFace <> Value then
  begin
    FFontFace := Value;
  end;
end;

function PView.GetFontSize: Integer;
begin
  if ParentFontSize and (FParent <> nil) then
    FFontSize := FParent.GetFontSize;
  Result := FFontSize;
end;

procedure PView.SetFontSize(Value: Integer);
begin
  if FFontSize <> Value then
  begin
    FFontSize := Value;
  end;
end;

function PView.GetFontStyle: TFontStyles;
begin
  if ParentFontStyle and (FParent <> nil) then
    FFontStyle := FParent.GetFontStyle;
  Result := FFontStyle;
end;

procedure PView.SetFontStyle(Value: TFontStyles);
begin
  if FFontStyle <> Value then
  begin
    FFontStyle := Value;
  end;
end;

procedure PView.SetParentLineColor(Value: Boolean);
begin
  if FParentLineColor <> Value then
  begin
    FParentLineColor := Value;
  end;
end;

procedure PView.SetParentFillColor(Value: Boolean);
begin
  if FParentFillColor <> Value then
  begin
    FParentFillColor := Value;
  end;
end;

procedure PView.SetParentFontFace(Value: Boolean);
begin
  if FParentFontFace <> Value then
  begin
    FParentFontFace := Value;
  end;
end;

procedure PView.SetParentFontSize(Value: Boolean);
begin
  if FParentFontSize <> Value then
  begin
    FParentFontSize := Value;
  end;
end;

procedure PView.SetParentFontColor(Value: Boolean);
begin
  if FParentFontColor <> Value then
  begin
    FParentFontColor := Value;
  end;
end;

procedure PView.SetParentFontStyle(Value: Boolean);
begin
  if FParentFontStyle <> Value then
  begin
    FParentFontStyle := Value;
  end;
end;

procedure PView.SetModel(Value: PModel);
begin
  if FModel <> Value then
  begin
    if FModel <> nil then
      FModel.RemoveView(Self);
    FModel := Value;
    if FModel <> nil then
      FModel.AddView(Self);
  end;
end;

procedure PView.SetParent(Value: PView);
begin
  if FParent <> Value then
  begin
    if FParent <> nil then
    begin
      FParent.RemoveSubView(Self);
      if FParent is PDiagramView then
        SetSelected(False);
    end;
    FParent := Value;
    if Value <> nil then
      FParent.AddSubView(Self);
  end;
end;

function PView.GetSubView(Index: Integer): PView;
begin
  if Index < FSubViews.Count then
    Result := FSubViews.Items[Index] as PView
  else
    Result := nil;
end;

function PView.GetSubViewCount: Integer;
begin
  Result := FSubViews.Count;
end;

function PView.GetContainedView(Index: Integer): PView;
begin
  Result := FContainedViews.Items[Index] as PView;
end;

function PView.GetContainedViewCount: Integer;
begin
  Result := FContainedViews.Count;
end;

procedure PView.SetContainerView(Value: PView);
begin
  if FContainerView <> Value then
  begin
    if FContainerView <> nil then
      FContainerView.RemoveContainedView(Self);
    if FOwnerDiagramView <> nil then
      FOwnerDiagramView.RemoveOwnedView(Self);
    FContainerView := Value;
    if FContainerView <> nil then
      FContainerView.AddContainedView(Self);
  end;
end;

procedure PView.SetOwnerDiagramView(Value: PDiagramView);
begin
  if FOwnerDiagramView <> Value then
  begin
    if FOwnerDiagramView <> nil then
      FOwnerDiagramView.RemoveOwnedView(Self);
    if FContainerView <> nil then
      FContainerView.RemoveContainedView(Self);
    FOwnerDiagramView := Value;
    if FOwnerDiagramView <> nil then
      FOwnerDiagramView.AddOwnedView(Self);
  end;
end;

procedure PView.SetContainerChangeable(Value: Boolean);
begin
  if FContainerChangeable <> Value then
  begin
    FContainerChangeable := Value;
  end;
end;

procedure PView.SetContainerExtending(Value: Boolean);
begin
  if FContainerExtending <> Value then
  begin
    FContainerExtending := Value;
  end;
end;

procedure PView.AssignStyleToCanvas(Canvas: PCanvas);
begin
  Canvas.Pen.Color := LineColor;
  Canvas.Pen.Style := psSolid;
  Canvas.Pen.Mode := pmCopy;
  Canvas.Pen.Width := 1;
  Canvas.Brush.Color := FillColor;
  Canvas.Brush.Style := bsSolid;
end;

procedure PView.AssignFontToCanvas(Canvas: PCanvas);
begin
  Canvas.Font.Name := FontFace;
  Canvas.Font.Color := FontColor;
  Canvas.Font.Size := FontSize;
  Canvas.Font.Style := FontStyle;
end;

procedure PView.DrawObject(Canvas: PCanvas);
begin
  // No Implementation.
end;

procedure PView.DrawSelection(Canvas: PCanvas);
begin
  // No Implementation.
end;

procedure PView.DrawNoModeledMark(Canvas: PCanvas);
begin
  // No Implementation.
end;

procedure PView.MovePosition(Canvas: PCanvas; DX, DY: Integer);
begin
  // No Implementation.
end;

procedure PView.ArrangeObject(Canvas: PCanvas);
begin
  // No Implementation.
end;

procedure PView.DelimitContainingBoundary(Canvas: PCanvas);
begin
  // No Implementation.
end;

procedure PView.Setup;
begin
  // No Implementation.
end;

procedure PView.Initialize(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
begin
  // No Implementaion.
end;

procedure PView.Draw(Canvas: PCanvas);
var
  I: Integer;
begin
  if FVisible then
  begin
    Arrange(Canvas);
    DrawObject(Canvas);
    for I := 0 to FSubViews.Count - 1 do (FSubViews.Items[I] as PView)
      .Draw(Canvas);
    if Model = nil then
      DrawNoModeledMark(Canvas);
  end;
end;

procedure PView.Move(Canvas: PCanvas; DX, DY: Integer);
var
  I: Integer;
begin
  if (DX <> 0) or (DY <> 0) then
  begin
    MovePosition(Canvas, DX, DY);
    for I := 0 to FSubViews.Count - 1 do (FSubViews.Items[I] as PView)
      .Move(Canvas, DX, DY);
  end;
end;

procedure PView.Arrange(Canvas: PCanvas);
var
  I: Integer;
  AView: PView;
begin
  for I := 0 to FSubViews.Count - 1 do
  begin
    AView := FSubViews.Items[I] as PView;
    AView.Arrange(Canvas);
  end;
  DelimitContainingBoundary(Canvas);
  ArrangeObject(Canvas);
end;

procedure PView.Update;
var
  I: Integer;
  AView: PView;
begin
  if Model = nil then
    Exit;
  for I := 0 to FContainedViews.Count - 1 do
  begin
    AView := FContainedViews.Items[I] as PView;
    AView.Update;
  end;
end;

procedure PView.BringToFront;
var
  Owner: PDiagramView;
begin
  if FOwnerDiagramView <> nil then
  begin
    Owner := FOwnerDiagramView;
    Owner.RemoveOwnedView(Self);
    Owner.AddOwnedView(Self);
  end;
end;

procedure PView.SendToBack;
var
  Owner: PDiagramView;
begin
  if FOwnerDiagramView <> nil then
  begin
    Owner := FOwnerDiagramView;
    Owner.RemoveOwnedView(Self);
    Owner.InsertOwnedView(0, Self);
  end;
end;

function PView.GetContainingDocument: PDocument;
var
  DV: PDiagramView;
begin
  if IsDocumentElement then
  begin
    Result := Document;
  end
  else
  begin
    DV := GetDiagramView;
    if (DV <> nil) then
      Result := DV.GetContainingDocument
    else
      Result := nil;
  end;
end;

function PView.GetViewAt(Canvas: PCanvas; X, Y: Integer): PView;
var
  I: Integer;
  V, SubView: PView;
begin
  Result := nil;
  for I := FSubViews.Count - 1 downto 0 do
  begin
    V := FSubViews.Items[I] as PView;
    if V.Visible and V.Selectable then
    begin
      SubView := V.GetViewAt(Canvas, X, Y);
      if SubView <> nil then
      begin
        Result := SubView;
        Exit;
      end;
    end;
  end;
  if ContainsPoint(Canvas, Point(X, Y)) then
    Result := Self;
end;

function PView.GetDiagramView: PDiagramView;
begin
  if FOwnerDiagramView <> nil then
  begin
    Result := FOwnerDiagramView;
  end
  else
  begin
    if FParent <> nil then
      Result := FParent.GetDiagramView
    else
      Result := nil;
  end;
end;

procedure PView.ClearSubViews;
var
  I: Integer;
begin
  for I := FSubViews.Count - 1 downto 0 do
    RemoveSubView(FSubViews.Items[I] as PView);
  FSubViews.Clear;
end;

procedure PView.AddSubView(V: PView);
begin
  if (V <> nil) and (not FSubViews.Contains(V)) then
  begin
    if V.FParent <> nil then
      V.FParent.FSubViews.Remove(V);
    FSubViews.Add(V);
    V.FParent := Self;
  end;
end;

procedure PView.RemoveSubView(V: PView);
begin
  if V <> nil then
  begin
    if V <> nil then
      V.FParent := nil;
    FSubViews.Remove(V);
  end;
end;

procedure PView.InsertSubView(Index: Integer; V: PView);
begin
  if (V <> nil) and (not FSubViews.Contains(V)) then
  begin
    if V.FParent <> nil then
      V.FParent.FSubViews.Remove(V);
    FSubViews.Insert(Index, V);
    V.FParent := Self;
  end;
end;

procedure PView.DeleteSubView(Index: Integer);
var
  V: PView;
begin
  V := FSubViews.Items[Index] as PView;
  FSubViews.Delete(Index);
  if V <> nil then
    V.FParent := nil;
end;

function PView.IndexOfSubView(V: PView): Integer;
begin
  Result := FSubViews.IndexOf(V);
end;

function PView.IncludesSubView(V: PView): Boolean;
var
  TV: PView;
begin
  TV := V;
  Result := False;
  while not(TV is PDiagramView) and (TV <> nil) do
  begin
    if TV = Self then
    begin
      Result := True;
      Exit;
    end;
    TV := TV.Parent;
  end;
end;

procedure PView.ClearContainedViews;
var
  I: Integer;
begin
  for I := FContainedViews.Count - 1 downto 0 do
    RemoveContainedView(FContainedViews.Items[I] as PView);
  FContainedViews.Clear;
end;

procedure PView.AddContainedView(V: PView);
begin
  if (V <> nil) and (not FContainedViews.Contains(V)) then
  begin
    if V.FOwnerDiagramView <> nil then
    begin
      V.FOwnerDiagramView.FOwnedViews.Remove(V);
      V.FOwnerDiagramView := nil;
    end;
    if V.FContainerView <> nil then
    begin
      V.FContainerView.FContainedViews.Remove(V);
      V.FContainerView.RemoveSubView(V);
    end;
    FContainedViews.Add(V);
    V.FContainerView := Self;
    AddSubView(V);
  end;
end;

procedure PView.RemoveContainedView(V: PView);
begin
  if V <> nil then
  begin
    if V <> nil then
      V.FContainerView := nil;
    FContainedViews.Remove(V);
    RemoveSubView(V);
  end;
end;

procedure PView.InsertContainedView(Index: Integer; V: PView);
begin
  if (V <> nil) and (not FContainedViews.Contains(V)) then
  begin
    if V.FOwnerDiagramView <> nil then
    begin
      V.FOwnerDiagramView.FOwnedViews.Remove(V);
      V.FOwnerDiagramView := nil;
    end;
    if V.FContainerView <> nil then
    begin
      V.FContainerView.FContainedViews.Remove(V);
      V.FContainerView.RemoveSubView(V);
    end;
    FContainedViews.Insert(Index, V);
    V.FContainerView := Self;
    AddSubView(V);
  end;
end;

procedure PView.DeleteContainedView(Index: Integer);
var
  V: PView;
begin
  V := FContainedViews.Items[Index] as PView;
  FContainedViews.Delete(Index);
  if V <> nil then
  begin
    V.FContainerView := nil;
    RemoveSubView(V);
  end;
end;

function PView.IndexOfContainedView(V: PView): Integer;
begin
  Result := FContainedViews.IndexOf(V);
end;

function PView.IsOneOfTheContainerViews(V: PView): Boolean;
begin
  if (ContainerView = nil) or (V = Self) then
    Result := False
  else if ContainerView = V then
    Result := True
  else
    Result := ContainerView.IsOneOfTheContainerViews(V);
end;

function PView.CanContainViewKind(Kind: string): Boolean;
begin
  Result := False;
end;

function PView.CanContainView(V: PView): Boolean;
begin
  Result := (V <> nil) and (V <> Self) and (not IsOneOfTheContainerViews(V))
    and CanContainViewKind(V.MetaClass.Name);
end;

procedure PView.DrawContainingBox(Canvas: PCanvas);
var
  ARect: TRect;
begin
  ARect := GetBoundingBox(Canvas);
  DrawRangeBox(Canvas, ARect.Left - 1, ARect.Top - 1, ARect.Right + 0,
    ARect.Bottom + 0);
end;

procedure PView.EraseContainingBox(Canvas: PCanvas);
var
  ARect: TRect;
begin
  ARect := GetBoundingBox(Canvas);
  DrawRangeBox(Canvas, ARect.Left - 1, ARect.Top - 1, ARect.Right + 0,
    ARect.Bottom + 0);
end;

function PView.GetBoundingBox(Canvas: PCanvas): TRect;
var
  R: TRect;
begin
  R.Left := High(Integer);
  R.Top := High(Integer);
  R.Right := - High(Integer);
  R.Bottom := - High(Integer);
  Result := R;
end;

function PView.ContainsPoint(Canvas: PCanvas; P: TPoint): Boolean;
var
  R, ZR: TRect;
  ZP: TPoint;
begin
  R := GetBoundingBox(Canvas);
  if FSelected then
  begin
    ZR := R;
    ZP := P;
    CoordTransform(Canvas.ZoomFactor, NOGRID, ZR);
    ZR := Rect(ZR.Left - DEFAULT_HIGHLIGHTER_SIZE,
      ZR.Top - DEFAULT_HIGHLIGHTER_SIZE, ZR.Right + DEFAULT_HIGHLIGHTER_SIZE,
      ZR.Bottom + DEFAULT_HIGHLIGHTER_SIZE);
    CoordTransform(Canvas.ZoomFactor, NOGRID, ZP);
    Result := PtInRect(ZR, ZP);
  end
  else
    Result := PtInRect(R, P);
end;

function PView.ContainsPoint(Canvas: PCanvas; X, Y: Integer): Boolean;
begin
  Result := ContainsPoint(Canvas, Point(X, Y));
end;

function PView.OverlapRect(Canvas: PCanvas; R: TRect): Boolean;
var
  Rgn: HRgn;
  RT: TRect;
begin
  RT := GetBoundingBox(Canvas);
  if FSelected then
    RT := Rect(RT.Left - 5, RT.Top - 5, RT.Right + 5, RT.Bottom + 5);
  Rgn := CreateRectRgn(RT.Left, RT.Top, RT.Right, RT.Bottom);
  Result := RectInRegion(Rgn, R);
  DeleteObject(Rgn);
end;

function PView.OverlapRect(Canvas: PCanvas; X1, Y1, X2, Y2: Integer): Boolean;
begin
  Result := OverlapRect(Canvas, Rect(X1, Y1, X2, Y2));
end;

function PView.MOF_GetAttribute(Name: string): string;
var
  Sty: Integer;
begin
  if Name = 'LineColor' then
  begin
    Result := ColorToString(LineColor);
  end
  else if Name = 'FillColor' then
  begin
    Result := ColorToString(FillColor);
  end
  else if Name = 'FontFace' then
  begin
    Result := FontFace;
  end
  else if Name = 'FontColor' then
  begin
    Result := ColorToString(FontColor);
  end
  else if Name = 'FontSize' then
  begin
    Result := IntegerToString(FontSize);
  end
  else if Name = 'FontStyle' then
  begin
    Sty := 0;
    if fsBold in FFontStyle then
      Sty := Sty + 1;
    if fsItalic in FFontStyle then
      Sty := Sty + 2;
    if fsUnderline in FFontStyle then
      Sty := Sty + 4;
    if fsStrikeOut in FFontStyle then
      Sty := Sty + 8;
    Result := IntegerToString(Sty);
  end
  else if Name = 'Visible' then
  begin
    Result := BooleanToString(Visible);
  end
  else if Name = 'Enabled' then
  begin
    Result := BooleanToString(Enabled);
  end
  else if Name = 'Selected' then
  begin
    Result := BooleanToString(Selected);
  end
  else
  begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PView.MOF_SetAttribute(Name, Value: string);
var
  Sty: Integer;
begin
  if Name = 'LineColor' then
  begin
    LineColor := StringToColor(Value);
  end
  else if Name = 'FillColor' then
  begin
    FillColor := StringToColor(Value);
  end
  else if Name = 'FontFace' then
  begin
    FontFace := Value;
  end
  else if Name = 'FontColor' then
  begin
    FontColor := StringToColor(Value);
  end
  else if Name = 'FontSize' then
  begin
    FontSize := StringToInteger(Value);
  end
  else if Name = 'FontStyle' then
  begin
    Sty := StringToInteger(Value);
    if (Sty and 1) <> 0 then
      FFontStyle := FFontStyle + [fsBold];
    if (Sty and 2) <> 0 then
      FFontStyle := FFontStyle + [fsItalic];
    if (Sty and 4) <> 0 then
      FFontStyle := FFontStyle + [fsUnderline];
    if (Sty and 8) <> 0 then
      FFontStyle := FFontStyle + [fsStrikeOut];
  end
  else if Name = 'Visible' then
  begin
    Visible := StringToBoolean(Value);
  end
  else if Name = 'Enabled' then
  begin
    Enabled := StringToBoolean(Value);
  end
  else if Name = 'Selected' then
  begin
    Selected := StringToBoolean(Value);
  end
  else
  begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'Model' then
  begin
    Result := Model;
  end
  else if Name = 'ContainerView' then
  begin
    Result := ContainerView;
  end
  else if Name = 'OwnerDiagramView' then
  begin
    Result := OwnerDiagramView;
  end
  else
  begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'Model' then
  begin
    Model := Value as PModel;
  end
  else if Name = 'ContainerView' then
  begin
    ContainerView := Value as PView;
  end
  else if Name = 'OwnerDiagramView' then
  begin
    OwnerDiagramView := Value as PDiagramView;
  end
  else
  begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

procedure PView.MOF_AddCollectionItem(Name: string; Value: PElement);
begin
  if Name = 'ContainedViews' then
  begin
    AddContainedView(Value as PView);
  end
  else
  begin
    inherited MOF_AddCollectionItem(Name, Value);
  end;
end;

procedure PView.MOF_RemoveCollectionItem(Name: string; Value: PElement);
begin
  if Name = 'ContainedViews' then
  begin
    RemoveContainedView(Value as PView);
  end
  else
  begin
    inherited MOF_RemoveCollectionItem(Name, Value);
  end;
end;

procedure PView.MOF_InsertCollectionItem(Name: string; Index: Integer;
  Value: PElement);
begin
  if Name = 'ContainedViews' then
  begin
    InsertContainedView(Index, Value as PView);
  end
  else
  begin
    inherited MOF_InsertCollectionItem(Name, Index, Value);
  end;
end;

procedure PView.MOF_DeleteCollectionItem(Name: string; Index: Integer);
begin
  if Name = 'ContainedViews' then
  begin
    DeleteContainedView(Index);
  end
  else
  begin
    inherited MOF_DeleteCollectionItem(Name, Index);
  end;
end;

procedure PView.MOF_ClearCollection(Name: string);
begin
  if Name = 'ContainedViews' then
  begin
    ClearContainedViews;
  end
  else
  begin
    inherited MOF_ClearCollection(Name);
  end;
end;

function PView.MOF_IndexOfCollectionItem(Name: string;
  Value: PElement): Integer;
begin
  if Name = 'ContainedViews' then
  begin
    Result := IndexOfContainedView(Value as PView);
  end
  else
  begin
    Result := inherited MOF_IndexOfCollectionItem(Name, Value);
  end;
end;

function PView.MOF_GetCollectionItem(Name: string; Index: Integer): PElement;
begin
  if Name = 'ContainedViews' then
  begin
    Result := ContainedViews[Index];
  end
  else
  begin
    Result := inherited MOF_GetCollectionItem(Name, Index);
  end;
end;

function PView.MOF_GetCollectionCount(Name: string): Integer;
begin
  if Name = 'ContainedViews' then
  begin
    Result := ContainedViewCount;
  end
  else
  begin
    Result := inherited MOF_GetCollectionCount(Name);
  end;
end;

// PView
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PDiagram

constructor PDiagram.Create;
begin
  inherited;
  FDefaultDiagram := False;
  FDiagramView := nil;
  FDiagramOwner := nil;
end;

procedure PDiagram.Accept(Visitor: PVisitor);
begin
  inherited;
  FDiagramView.Accept(Visitor);
end;

function PDiagram.GetContainingDocument: PDocument;
begin
  if IsDocumentElement then
  begin
    Result := Document;
  end
  else
  begin
    if DiagramOwner <> nil then
      Result := DiagramOwner.GetContainingDocument
    else
      Result := nil;
  end;
end;

procedure PDiagram.SetDefaultDiagram(Value: Boolean);
begin
  if FDefaultDiagram <> Value then
  begin
    FDefaultDiagram := Value;
  end;
end;

procedure PDiagram.SetDiagramType(Value: string);
begin
  if FDiagramType <> Value then
  begin
    FDiagramType := Value;
  end;
end;

procedure PDiagram.SetDiagramView(Value: PDiagramView);
begin
  if FDiagramView <> Value then
  begin
    if FDiagramView <> nil then
      FDiagramView.FDiagram := nil;
    FDiagramView := Value;
    if FDiagramView <> nil then
      FDiagramView.FDiagram := Self;
  end;
end;

procedure PDiagram.SetDiagramOwner(Value: PModel);
begin
  if FDiagramOwner <> Value then
  begin
    if FDiagramOwner <> nil then
    begin
      FDiagramOwner.FOwnedDiagrams.Remove(Self);
      FDiagramOwner.RemoveVirtualOwnedModel(Self);
      // Remove from VirtualOwnedModels
    end;
    FDiagramOwner := Value;
    if Value <> nil then
    begin
      Value.FOwnedDiagrams.Add(Self);
      Value.AddVirtualOwnedModel(Self); // Add to VirtualOwnedModels
    end;
  end;
end;

function PDiagram.CanContainKind(Kind: string): Boolean;
begin
  Result := False;
end;

function PDiagram.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'DefaultDiagram' then
  begin
    Result := BooleanToString(DefaultDiagram);
  end
  else if Name = 'DiagramType' then
  begin
    Result := DiagramType;
  end
  else
  begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PDiagram.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'DefaultDiagram' then
  begin
    DefaultDiagram := StringToBoolean(Value);
  end
  else if Name = 'DiagramType' then
  begin
    DiagramType := Value;
  end
  else
  begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PDiagram.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'DiagramOwner' then
  begin
    Result := DiagramOwner;
  end
  else if Name = 'DiagramView' then
  begin
    Result := DiagramView;
  end
  else
  begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PDiagram.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'DiagramOwner' then
  begin
    DiagramOwner := Value as PModel;
  end
  else if Name = 'DiagramView' then
  begin
    DiagramView := Value as PDiagramView;
  end
  else
  begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PDiagram
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PDiagramView

constructor PDiagramView.Create;
begin
  inherited;
  FDiagram := nil;
  FCanvas := nil;
  FOwnedViews := POrderedSet.Create;
  FSelectedViews := POrderedSet.Create;
end;

destructor PDiagramView.Destroy;
begin
  FDiagram := nil;
  FCanvas := nil;
  FOwnedViews.Free;
  FOwnedViews := nil;
  FSelectedViews.Free;
  FSelectedViews := nil;
  inherited;
end;

procedure PDiagramView.Accept(Visitor: PVisitor);
var
  I: Integer;
begin
  inherited;
  for I := 0 to OwnedViewCount - 1 do
    OwnedViews[I].Accept(Visitor);
end;

procedure PDiagramView.SetDiagram(Value: PDiagram);
begin
  if FDiagram <> Value then
  begin
    if FDiagram <> nil then
      FDiagram.FDiagramView := nil;
    FDiagram := Value;
    if FDiagram <> nil then
      FDiagram.FDiagramView := Self;
  end;
end;

function PDiagramView.GetSelectedView(Index: Integer): PView;
begin
  Result := FSelectedViews.Items[Index] as PView;
end;

function PDiagramView.GetSelectedCount: Integer;
begin
  if FSelectedViews <> nil then
    Result := FSelectedViews.Count
  else
    Result := 0;
end;

function PDiagramView.GetOwnedView(Index: Integer): PView;
begin
  Result := FOwnedViews.Items[Index] as PView;
end;

function PDiagramView.GetOwnedViewCount: Integer;
begin
  if Assigned(FOwnedViews) then
    Result := FOwnedViews.Count
  else
    Result := 0;
end;

procedure PDiagramView.DrawObject(Canvas: PCanvas);
var
  I: Integer;
  AView: PView;
begin
  for I := 0 to FOwnedViews.Count - 1 do
  begin
    AView := FOwnedViews.Items[I] as PView;
    AView.Arrange(Canvas);
    // (FOwnedViews.Items[I] as PView).Arrange(Canvas);
  end;
end;

procedure PDiagramView.Draw(Canvas: PCanvas);
var
  I: Integer;
begin
  if FVisible then
  begin
    Arrange(Canvas);
    DrawObject(Canvas);
    for I := 0 to FOwnedViews.Count - 1 do (FOwnedViews.Items[I] as PView)
      .Draw(Canvas);
  end;
end;

procedure PDiagramView.DrawDiagram(Canvas: PCanvas);
var
  I: Integer;
begin
  if FVisible then
  begin
    Draw(Canvas);
    for I := 0 to FSelectedViews.Count - 1 do (FSelectedViews.Items[I] as PView)
      .DrawSelection(Canvas);
  end;
end;

procedure PDiagramView.Update;
var
  I: Integer;
begin
  for I := 0 to OwnedViewCount - 1 do
    OwnedViews[I].Update;
end;

function PDiagramView.GetContainingDocument: PDocument;
begin
  if IsDocumentElement then
  begin
    Result := Document;
  end
  else
  begin
    if Diagram <> nil then
      Result := Diagram.GetContainingDocument
    else
      Result := nil;
  end;
end;

function PDiagramView.GetViewAt(Canvas: PCanvas; X, Y: Integer): PView;
var
  I: Integer;
  V, SubView: PView;
begin
  Result := nil;
  for I := FOwnedViews.Count - 1 downto 0 do
  begin
    V := FOwnedViews.Items[I] as PView;
    if V.Visible and V.Selectable then
    begin
      SubView := V.GetViewAt(Canvas, X, Y);
      if SubView <> nil then
      begin
        Result := SubView;
        Exit;
      end;
    end;
  end;
  if ContainsPoint(Canvas, Point(X, Y)) then
    Result := Self;
end;

function PDiagramView.GetBottomViewAt(Canvas: PCanvas; X, Y: Integer): PView;
var
  I: Integer;
  V: PView;
begin
  Result := nil;
  for I := FOwnedViews.Count - 1 downto 0 do
  begin
    V := FOwnedViews.Items[I] as PView;
    if V.Visible and V.Selectable and V.ContainsPoint(Canvas, X, Y) then
    begin
      Result := V;
      Exit;
    end;
  end;
  if ContainsPoint(Canvas, Point(X, Y)) then
    Result := Self;
end;

function PDiagramView.GetBoundingBox(Canvas: PCanvas): TRect;
var
  V: PView;
  I: Integer;
  R: TRect;
begin
  R := Rect(10000, 10000, -10000, -10000);
  for I := 0 to OwnedViewCount - 1 do
  begin
    V := OwnedViews[I];
    if V.Visible then
      UnionRect(R, R, V.GetBoundingBox(Canvas));
  end;
  Result := R;
end;

function PDiagramView.GetSelectedBoundingBox(Canvas: PCanvas): TRect;
var
  V: PView;
  I: Integer;
  R: TRect;
begin
  R := Rect(10000, 10000, -10000, -10000);
  for I := 0 to SelectedViewCount - 1 do
  begin
    V := SelectedViews[I];
    UnionRect(R, R, V.GetBoundingBox(Canvas));
  end;
  Result := R;
end;

function PDiagramView.ContainsPoint(Canvas: PCanvas; P: TPoint): Boolean;
begin
  Result := False;
end;

function PDiagramView.OverlapRect(Canvas: PCanvas; R: TRect): Boolean;
begin
  Result := False;
end;

procedure PDiagramView.SelectAll;

  procedure SelectView(V: PView);
  var
    I: Integer;
  begin
    if V.Visible and V.Enabled and V.Selectable then
      V.Selected := True;
    for I := 0 to V.SubViewCount - 1 do
      SelectView(V.SubViews[I]);
  end;

var
  I: Integer;
begin
  for I := 0 to FOwnedViews.Count - 1 do
    SelectView(FOwnedViews.Items[I] as PView);
end;

procedure PDiagramView.DeselectAll;
var
  I: Integer;
begin
  for I := FSelectedViews.Count - 1 downto 0
    do (FSelectedViews.Items[I] as PView)
    .Selected := False;
  FSelectedViews.Clear;
end;

procedure PDiagramView.SelectArea(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);

  procedure SelectView(V: PView; X1, Y1, X2, Y2: Integer);
  var
    I: Integer;
  begin
    if V.Visible and V.Enabled and V.Selectable then
      if V.OverlapRect(Canvas, Rect(X1, Y1, X2, Y2)) then
        V.Selected := True;
    for I := 0 to V.SubViewCount - 1 do
      SelectView(V.SubViews[I], X1, Y1, X2, Y2);
  end;

var
  I: Integer;
begin
  NormalizeRect(X1, Y1, X2, Y2);
  for I := 0 to FOwnedViews.Count - 1 do
    SelectView(FOwnedViews.Items[I] as PView, X1, Y1, X2, Y2);
end;

procedure PDiagramView.ClearOwnedViews;
var
  I: Integer;
begin
  for I := FOwnedViews.Count - 1 downto 0 do
    DeleteOwnedView(I);
end;

procedure PDiagramView.AddOwnedView(AView: PView);
begin
  if (AView <> nil) and (not FOwnedViews.Contains(AView)) then
  begin
    if AView.FContainerView <> nil then
    begin
      AView.FContainerView.FContainedViews.Remove(AView);
      AView.RemoveSubView(AView);
      AView.FContainerView := nil;
    end;
    if AView.FOwnerDiagramView <> nil then
      AView.FOwnerDiagramView.FOwnedViews.Remove(AView);
    FOwnedViews.Add(AView);
    AView.FOwnerDiagramView := Self;
  end;
end;

procedure PDiagramView.RemoveOwnedView(AView: PView);
begin
  if AView <> nil then
  begin
    FOwnedViews.Remove(AView);
    AView.FOwnerDiagramView := nil;
  end;
end;

procedure PDiagramView.InsertOwnedView(Index: Integer; AView: PView);
begin
  if (AView <> nil) and (not FOwnedViews.Contains(AView)) then
  begin
    if AView.FContainerView <> nil then
    begin
      AView.FContainerView.FContainedViews.Remove(AView);
      AView.RemoveSubView(AView);
      AView.FContainerView := nil;
    end;
    if AView.FOwnerDiagramView <> nil then
      AView.FOwnerDiagramView.FOwnedViews.Remove(AView);
    FOwnedViews.Insert(Index, AView);
    AView.FOwnerDiagramView := Self;
  end;
end;

procedure PDiagramView.DeleteOwnedView(Index: Integer);
begin
  RemoveOwnedView(FOwnedViews.Items[Index] as PView);
end;

function PDiagramView.IndexOfOwnedView(AView: PView): Integer;
begin
  Result := FOwnedViews.IndexOf(AView);
end;

function PDiagramView.CanOwnView(View: PView): Boolean;
begin
  Result := CanOwnViewKind(View.MetaClass.Name);
end;

function PDiagramView.CanOwnViewKind(Kind: string): Boolean;
begin
  Result := False;
end;

function PDiagramView.CanCopyViews: Boolean;
begin
  Result := (SelectedViewCount > 0);
end;

function PDiagramView.CanDeleteViews: Boolean;
begin
  Result := (SelectedViewCount > 0);
end;

function PDiagramView.CanPasteViews(Kind, CopyContext: string): Boolean;
begin
  Result := True;
end;

function PDiagramView.CanAcceptModel(Model: PModel): Boolean;
begin
  Result := False;
end;

function PDiagramView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'Diagram' then
  begin
    Result := Diagram;
  end
  else
  begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PDiagramView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'Diagram' then
  begin
    Diagram := Value as PDiagram;
  end
  else
  begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

procedure PDiagramView.MOF_AddCollectionItem(Name: string; Value: PElement);
begin
  if Name = 'SelectedViews' then
  begin
    // Nothing to do.
  end
  else if Name = 'OwnedViews' then
  begin
    AddOwnedView(Value as PView);
  end
  else
  begin
    inherited MOF_AddCollectionItem(Name, Value);
  end;
end;

procedure PDiagramView.MOF_RemoveCollectionItem(Name: string; Value: PElement);
begin
  if Name = 'SelectedViews' then
  begin
    // Nothing to do.
  end
  else if Name = 'OwnedViews' then
  begin
    RemoveOwnedView(Value as PView);
  end
  else
  begin
    inherited MOF_RemoveCollectionItem(Name, Value);
  end;
end;

procedure PDiagramView.MOF_InsertCollectionItem(Name: string; Index: Integer;
  Value: PElement);
begin
  if Name = 'SelectedViews' then
  begin
    // Nothing to do.
  end
  else if Name = 'OwnedViews' then
  begin
    InsertOwnedView(Index, Value as PView);
  end
  else
  begin
    inherited MOF_InsertCollectionItem(Name, Index, Value);
  end;
end;

procedure PDiagramView.MOF_DeleteCollectionItem(Name: string; Index: Integer);
begin
  if Name = 'SelectedViews' then
  begin
    // Nothing to do.
  end
  else if Name = 'OwnedViews' then
  begin
    DeleteOwnedView(Index);
  end
  else
  begin
    inherited MOF_DeleteCollectionItem(Name, Index);
  end;
end;

procedure PDiagramView.MOF_ClearCollection(Name: string);
begin
  if Name = 'SelectedViews' then
  begin
    // Nothing to do.
  end
  else if Name = 'OwnedViews' then
  begin
    ClearOwnedViews;
  end
  else
  begin
    inherited MOF_ClearCollection(Name);
  end;
end;

function PDiagramView.MOF_IndexOfCollectionItem(Name: string;
  Value: PElement): Integer;
begin
  if Name = 'SelectedViews' then
  begin
    Result := -1;
  end
  else if Name = 'OwnedViews' then
  begin
    Result := IndexOfOwnedView(Value as PView);
  end
  else
  begin
    Result := inherited MOF_IndexOfCollectionItem(Name, Value);
  end;
end;

function PDiagramView.MOF_GetCollectionItem(Name: string;
  Index: Integer): PElement;
begin
  if Name = 'SelectedViews' then
  begin
    Result := SelectedViews[Index];
  end
  else if Name = 'OwnedViews' then
  begin
    Result := OwnedViews[Index];
  end
  else
  begin
    Result := inherited MOF_GetCollectionItem(Name, Index);
  end;
end;

function PDiagramView.MOF_GetCollectionCount(Name: string): Integer;
begin
  if Name = 'SelectedViews' then
  begin
    Result := SelectedViewCount;
  end
  else if Name = 'OwnedViews' then
  begin
    Result := OwnedViewCount;
  end
  else
  begin
    Result := inherited MOF_GetCollectionCount(Name);
  end;
end;

// PDiagramView
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PReferenceResolveItem

constructor PReferenceResolveItem.Create(AElement: PElement;
  AName, AGuid, APathname: string; AIsCollection: Boolean);
begin
  Element := AElement;
  Name := AName;
  GUID := AGuid;
  Pathname := APathname;
  IsCollection := AIsCollection;
end;

// PReferenceResolveItem
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PReferenceResolver

constructor PReferenceResolver.Create;
begin
  inherited;
  ResolveItemList := TList.Create;
  HashedGuidTable := THashedStringList.Create;
  HashedGuidTable.CaseSensitive := True;
  ProgressMaxStep := 10;
end;

destructor PReferenceResolver.Destroy;
begin
  Clear;
  ResolveItemList.Free;
  HashedGuidTable.Free;
  inherited;
end;

function PReferenceResolver.GetResolveItem(Index: Integer)
  : PReferenceResolveItem;
begin
  Result := ResolveItemList.Items[Index];
end;

function PReferenceResolver.GetResolveItemCount: Integer;
begin
  Result := ResolveItemList.Count;
end;

procedure PReferenceResolver.ResolvingProgress(Info: string;
  Max, Progress: Integer);
var
  P: Integer;
begin
  if Max > 0 then
  begin
    if Progress = 0 then
      CurProgress := 0;
    P := Round((Progress / Max) * ProgressMaxStep);
    if Assigned(FOnResolvingProgress) and (P > CurProgress) then
    begin
      CurProgress := P;
      FOnResolvingProgress(Self, Info, ProgressMaxStep, CurProgress);
    end;
  end;
end;

procedure PReferenceResolver.BuildHashedGuidTable;
var
  I, J: Integer;
  MC: PMetaClass;
  E: PElement;
begin
  HashedGuidTable.Clear;
  for I := 0 to MetaModel.MetaClassCount - 1 do
  begin
    MC := MetaModel.MetaClasses[I];
    for J := 0 to MC.InstanceCount - 1 do
    begin
      E := MC.Instances[J];
      HashedGuidTable.AddObject(E.GUID, E);
    end;
  end;
end;

function PReferenceResolver.FindInstance(AGuid: string): PElement;
var
  Idx: Integer;
begin
  Idx := HashedGuidTable.IndexOf(AGuid);
  if Idx < 0 then
    Result := nil
  else
    Result := HashedGuidTable.Objects[Idx] as PElement;
end;

procedure PReferenceResolver.Clear;
var
  I: Integer;
  R: PReferenceResolveItem;
begin
  for I := ResolveItemList.Count - 1 downto 0 do
  begin
    R := ResolveItemList.Items[I];
    R.Free;
  end;
  ResolveItemList.Clear;
end;

procedure PReferenceResolver.AddResolveItem(AElement: PElement;
  AName, AGuid, APathname: string; AIsCollection: Boolean);
var
  R: PReferenceResolveItem;
begin
  R := PReferenceResolveItem.Create(AElement, AName, AGuid, APathname,
    AIsCollection);
  ResolveItemList.Add(R);
end;

procedure PReferenceResolver.ResolveAll;
var
  I: Integer;
  R: PReferenceResolveItem;
  Ref: PElement;
  MC: PMetaClass;
  RootModel: PModel;
begin
  // assign Project's instances to RootModel
  // (to find model by Pathname)
  RootModel := nil;
  MC := MetaModel.FindMetaClass('UMLProject');
  if MC <> nil then
    RootModel := MC.Instances[0] as PModel;
  // correct all references
  ResolvingProgress('', ResolveItemList.Count, 0);

  BuildHashedGuidTable;

  for I := 0 to ResolveItemList.Count - 1 do
  begin
    R := ResolveItemList.Items[I];

    // (1) find reference by GUID
    Ref := FindInstance(R.GUID);
    // (2) if not found by GUID, find by Pathname
    if Ref = nil then
    begin
      Ref := RootModel.FindByRelativePathname(ExtractTailPath(R.Pathname));
    end;

    // correct reference
    if R.IsCollection then
    begin
      R.Element.MOF_AddCollectionItem(R.Name, Ref);
    end
    else
    begin
      R.Element.MOF_SetReference(R.Name, Ref);
    end;
    ResolvingProgress('', ResolveItemList.Count, I + 1);
  end;
end;

procedure PReferenceResolver.BlockedResolveAll(BaseElement: PElement);
var
  I, J: Integer;
  R: PReferenceResolveItem;
  Ref: PElement;
  AVisitor: PReferenceCollectionVisitor;
  AnObj: PObject;
begin
  // correct all references
  // referece's target element is limited in BaseElement

  ResolvingProgress('', ResolveItemList.Count, 0);
  AVisitor := PReferenceCollectionVisitor.Create;
  try
    BaseElement.Accept(AVisitor);

    for I := 0 to ResolveItemList.Count - 1 do
    begin
      R := ResolveItemList.Items[I];

      // find reference by GUID
      Ref := nil;
      for J := 0 to AVisitor.ReferenceCount - 1 do
      begin
        AnObj := AVisitor.References[J];
        if R.GUID = AnObj.GUID then
        begin
          Ref := AnObj as PElement;
          Break;
        end;
      end;

      // correct reference
      if Ref <> nil then
      begin
        if R.IsCollection then
        begin
          R.Element.MOF_AddCollectionItem(R.Name, Ref);
        end
        else
        begin
          R.Element.MOF_SetReference(R.Name, Ref);
        end;
      end;

      ResolvingProgress('', ResolveItemList.Count, I + 1);
    end;
  finally
    AVisitor.Free;
  end;
end;

procedure PReferenceResolver.ReplaceGUID(OldGUID, NewGUID: string);
var
  I: Integer;
  AnItem: PReferenceResolveItem;
begin
  for I := 0 to ResolveItemCount - 1 do
  begin
    AnItem := ResolveItems[I] as PReferenceResolveItem;
    if AnItem.GUID = OldGUID then
      AnItem.GUID := NewGUID;
  end;
end;

procedure PReferenceResolver.ReassignGUIDs(BaseElement: PElement);
var
  AVisitor: PReferenceCollectionVisitor;
  AnObj: PObject;
  OldGUID, NewGUID: string;
  I: Integer;
begin
  AVisitor := PReferenceCollectionVisitor.Create;
  try
    BaseElement.Accept(AVisitor);
    for I := 0 to AVisitor.ReferenceCount - 1 do
    begin
      AnObj := AVisitor.References[I];
      OldGUID := AnObj.GUID;
      NewGUID := CreateGUIDBase64;
      AnObj.GUID := NewGUID;
      ReplaceGUID(OldGUID, NewGUID);
    end;
  finally
    AVisitor.Free;
  end;
end;

// PReferenceResolver
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PXMLObjectReader

constructor PXMLObjectReader.Create(BaseNode: IXMLNode;
  AReferenceResolver: PReferenceResolver);
begin
  CurrentNode := BaseNode;
  CurrentObject := nil;
  ReferenceResolver := AReferenceResolver;
  CurrentKeyTable := nil;
  CurrentBuildKeyTable(BaseNode);
end;

destructor PXMLObjectReader.Destroy;
begin
  if CurrentKeyTable <> nil then
    CurrentKeyTable.Free;
  inherited;
end;

procedure PXMLObjectReader.CurrentBuildKeyTable(BaseNode: IXMLNode);
var
  I: Integer;
  Node: IXMLNode;
  Key: string;
begin
  CurrentKeyTable := THashedStringList.Create;
  CurrentKeyTable.CaseSensitive := True;
  CurrentKeyTable.Clear;
  for I := 0 to BaseNode.ChildNodes.Count - 1 do
  begin
    Node := BaseNode.ChildNodes.Nodes[I];
    Key := Node.Attributes[XPD_NAME];
    CurrentKeyTable.Add(Key);
  end;
end;

function PXMLObjectReader.GetNodeByKey(Key: string): IXMLNode;
var
  Idx: Integer;
begin
  Idx := CurrentKeyTable.IndexOf(Key);
  if Idx < 0 then
    Result := nil
  else
    Result := CurrentNode.ChildNodes.Nodes[Idx];
end;

function PXMLObjectReader.ReadInteger(Key: string;
  Default: Integer = 0): Integer;
var
  Node: IXMLNode;
begin
  Node := GetNodeByKey(Key);
  // If Key is not found, return 0(zero).
  if Node = nil then
  begin
    Result := Default;
    Exit;
  end;
  // Check validation.
  if Node.LocalName <> XPD_ATTRIBUTE then
    raise EInvalidFileFormat.Create(XPD_ERR_ATTRIBUTE_REQUIRED);
  if Node.Attributes[XPD_TYPE] <> XPD_INTEGER then
    raise EInvalidFileFormat.Create(XPD_ERR_INVALID_INTEGER_TYPE);
  // Read stored value.
  if VarIsNull(Node.NodeValue) then
    Result := Default
  else
    Result := Node.NodeValue;
end;

function PXMLObjectReader.ReadBoolean(Key: string;
  Default: Boolean = False): Boolean;
var
  Node: IXMLNode;
begin
  Node := GetNodeByKey(Key);
  // If Key is not found, return False.
  if Node = nil then
  begin
    Result := Default;
    Exit;
  end;
  // Check validation.
  if Node.LocalName <> XPD_ATTRIBUTE then
    raise EInvalidFileFormat.Create(XPD_ERR_ATTRIBUTE_REQUIRED);
  if Node.Attributes[XPD_TYPE] <> XPD_BOOLEAN then
    raise EInvalidFileFormat.Create(XPD_ERR_INVALID_BOOLEAN_TYPE);
  // Read stored value.
  if VarIsNull(Node.NodeValue) then
    Result := Default
  else
    Result := Node.NodeValue;
end;

function PXMLObjectReader.ReadReal(Key: string; Default: Real = 0.0): Real;
var
  Node: IXMLNode;
begin
  Node := GetNodeByKey(Key);
  // If Key is not found, return 0.0.
  if Node = nil then
  begin
    Result := Default;
    Exit;
  end;
  // Check validation.
  if Node.LocalName <> XPD_ATTRIBUTE then
    raise EInvalidFileFormat.Create(XPD_ERR_ATTRIBUTE_REQUIRED);
  if Node.Attributes[XPD_TYPE] <> XPD_REAL then
    raise EInvalidFileFormat.Create(XPD_ERR_INVALID_REAL_TYPE);
  // Read stored value.
  if VarIsNull(Node.NodeValue) then
    Result := Default
  else
    Result := Node.NodeValue;
end;

function PXMLObjectReader.ReadString(Key: string; Default: string = ''): string;
var
  Node: IXMLNode;
begin
  Node := GetNodeByKey(Key);
  // If Key is not found, return ''(null string).
  if Node = nil then
  begin
    Result := Default;
    Exit;
  end;
  // Check validation.
  if Node.LocalName <> XPD_ATTRIBUTE then
    raise EInvalidFileFormat.Create(XPD_ERR_ATTRIBUTE_REQUIRED);
  if Node.Attributes[XPD_TYPE] <> XPD_STRING then
    raise EInvalidFileFormat.Create(XPD_ERR_INVALID_STRING_TYPE);
  // Read stored value.
  if VarIsNull(Node.NodeValue) then
    Result := Default
  else
    Result := Node.NodeValue;
end;

function PXMLObjectReader.ReadObject(Key: string;
  Default: PObject = nil): PObject;
var
  Node, TempNode: IXMLNode;
  TempObj: PObject;
  GUID, ClassName: string;
  Obj: PObject;
  TempKeyTable: THashedStringList;
begin
  Node := GetNodeByKey(Key);
  // If Key is not found, return nil.
  if Node = nil then
  begin
    Result := Default;
    Exit;
  end;
  // Check validation.
  if Node.LocalName <> XPD_OBJECT then
    raise EInvalidFileFormat.Create(XPD_ERR_OBJECT_REQUIRED);
  // Read GUID and ClassName
  GUID := Node.Attributes[XPD_GUID];
  ClassName := Node.Attributes[XPD_TYPE];
  // Create object of NewClass and set GUID.
  Obj := MetaModel.CreateInstance(ClassName, GUID);
  TempNode := CurrentNode;
  TempObj := CurrentObject;
  CurrentNode := Node;
  CurrentObject := Obj;
  TempKeyTable := CurrentKeyTable;
  CurrentBuildKeyTable(CurrentNode);
  // Load Obj recursively.
  Obj.Load(Self);
  CurrentNode := TempNode;
  CurrentObject := TempObj;
  if CurrentKeyTable <> nil then
    CurrentKeyTable.Free;
  CurrentKeyTable := TempKeyTable;
  Result := Obj;
end;

function PXMLObjectReader.ReadReference(Key: string;
  Default: PObject = nil): PObject;
var
  Node: IXMLNode;
  GUID, Pathname: string;
  Obj: PObject;
  RefName: string;
  IsCol: Boolean;
begin
  Obj := nil;
  Node := GetNodeByKey(Key);
  // If Key is not found, return nil.
  if Node = nil then
  begin
    Result := Default;
    Exit;
  end;
  // Check validation.
  if Node.LocalName <> XPD_REFERENCE then
    raise EInvalidFileFormat.Create(XPD_ERR_REFERENCE_REQUIRED);
  // Read GUID
  if VarIsNull(Node.NodeValue) then
    GUID := ''
  else
    GUID := Node.NodeValue;
  // Read Pathname
  if VarIsNull(Node.Attributes[XPD_PATHNAME]) then
    Pathname := ''
  else
    Pathname := Node.Attributes[XPD_PATHNAME];
  // decide whether reference which will be read is kind of collection or not
  if IsCollectionKey(Key) then
  begin
    IsCol := True;
    RefName := TrimCollectionKey(Key);
  end
  else
  begin
    IsCol := False;
    RefName := Key;
  end;
  // Add A ResolveItem to ReferenceResolver.
  ReferenceResolver.AddResolveItem(CurrentObject as PElement, RefName, GUID,
    Pathname, IsCol);
  Result := Obj;
end;

function PXMLObjectReader.ReadUserDefinedType(TypeName, Key: string;
  Default: string = ''): string;
var
  Node: IXMLNode;
begin
  Node := GetNodeByKey(Key);
  // If Key is not found, return ''(null string).
  if Node = nil then
  begin
    Result := Default;
    Exit;
  end;
  // Check validation.
  if Node.LocalName <> XPD_ATTRIBUTE then
    raise EInvalidFileFormat.Create(XPD_ERR_ATTRIBUTE_REQUIRED);
  if Node.Attributes[XPD_TYPE] <> TypeName then
    raise EInvalidFileFormat.Create
      (XPD_ERR_INVALID_USERDEFINED_TYPE + '(' + TypeName + ' is required)');
  // Read stored value.
  if VarIsNull(Node.NodeValue) then
    Result := Default
  else
    Result := Node.NodeValue;
end;

// PXMLObjectReader
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PXMLObjectWriter

constructor PXMLObjectWriter.Create(AXMLStrings: TStrings);
begin
  XMLStrings := AXMLStrings;
  CurrentObject := nil;
  CurrentDocument := nil;
end;

function PXMLObjectWriter.GetAttrBeginNode(Name, TypeName: string): string;
var
  S: string;
begin
  S := '<' + XPD_PREFIX + ':' + XPD_ATTRIBUTE;
  S := S + ' ' + XPD_NAME + '="' + Name + '"';
  S := S + ' ' + XPD_TYPE + '="' + TypeName + '"';
  S := S + '>';
  Result := S;
end;

function PXMLObjectWriter.GetAttrEndNode: string;
begin
  Result := '</' + XPD_PREFIX + ':' + XPD_ATTRIBUTE + '>'
end;

function PXMLObjectWriter.GetObjBeginNode(Name, TypeName, GUID: string): string;
var
  S: string;
begin
  S := '<' + XPD_PREFIX + ':' + XPD_OBJECT;
  S := S + ' ' + XPD_NAME + '="' + Name + '"';
  S := S + ' ' + XPD_TYPE + '="' + TypeName + '"';
  S := S + ' ' + XPD_GUID + '="' + GUID + '"';
  S := S + '>';
  Result := S;
end;

function PXMLObjectWriter.GetObjEndNode: string;
begin
  Result := '</' + XPD_PREFIX + ':' + XPD_OBJECT + '>'
end;

function PXMLObjectWriter.GetRefBeginNode(Name: string;
  Pathname: string = ''): string;
var
  S: string;
begin
  S := '<' + XPD_PREFIX + ':' + XPD_REFERENCE;
  S := S + ' ' + XPD_NAME + '="' + Name + '"';
  if Pathname <> '' then
    //S := S + ' ' + XPD_PATHNAME + '="' + HTMLEscape(UTF8Encode(Pathname)) + '"';
   S := S + ' ' + XPD_PATHNAME + '="' + HTMLEscape(Pathname) + '"';
  S := S + '>';
  Result := S;
end;

function PXMLObjectWriter.GetRefEndNode: string;
begin
  Result := '</' + XPD_PREFIX + ':' + XPD_REFERENCE + '>'
end;

function PXMLObjectWriter.IsFiltered(Key: string): Boolean;
var
  CanFilter: Boolean;
begin
  CanFilter := False;
  if Assigned(FOnFilter) then
    FOnFilter(Self, CurrentObject, Key, CanFilter);
  Result := CanFilter;
end;

procedure PXMLObjectWriter.WriteInteger(Key: string; Value: Integer;
  Default: Integer = 0);
var
  Attr: string;
begin
  if not IsFiltered(Key) then
  begin
    if Value <> Default then
    begin
      Attr := GetAttrBeginNode(Key, XPD_INTEGER) + IntegerToString(Value)
        + GetAttrEndNode;
      XMLStrings.Add(Attr);
    end;
  end;
end;

procedure PXMLObjectWriter.WriteBoolean(Key: string; Value: Boolean;
  Default: Boolean = False);
var
  Attr: string;
begin
  if not IsFiltered(Key) then
  begin
    if Value <> Default then
    begin
      Attr := GetAttrBeginNode(Key, XPD_BOOLEAN) + BooleanToString(Value)
        + GetAttrEndNode;
      XMLStrings.Add(Attr);
    end;
  end;
end;

procedure PXMLObjectWriter.WriteReal(Key: string; Value: Real;
  Default: Real = 0.0);
var
  Attr: string;
begin
  if not IsFiltered(Key) then
  begin
    if Value <> Default then
    begin
      Attr := GetAttrBeginNode(Key, XPD_REAL) + RealToString(Value)
        + GetAttrEndNode;
      XMLStrings.Add(Attr);
    end;
  end;
end;

procedure PXMLObjectWriter.WriteString(Key: string; Value: string;
  Default: string = '');
var
  Attr: string;
begin
  if not IsFiltered(Key) then
  begin
    if Value <> Default then
    begin
      //Attr := GetAttrBeginNode(Key, XPD_STRING) + HTMLEscape(UTF8Encode(Value))
      Attr := GetAttrBeginNode(Key, XPD_STRING) + HTMLEscape(Value)
        + GetAttrEndNode;


      XMLStrings.Add(Attr);
    end;
  end;
end;

procedure PXMLObjectWriter.WriteObject(Key: string; Value: PObject;
  Default: PObject = nil);
var
  TempObj: PObject;
begin
  if not IsFiltered(Key) then
  begin
    if Value <> Default then
    begin
      XMLStrings.Add(GetObjBeginNode(Key, (Value as PElement).MetaClass.Name,
          Value.GUID));
      TempObj := CurrentObject;
      CurrentObject := Value;
      if CurrentObject is PElement then
        CurrentDocument := (CurrentObject as PElement).GetContainingDocument;
      CurrentObject.Store(Self);
      CurrentObject := TempObj;
      if CurrentObject is PElement then
        CurrentDocument := (CurrentObject as PElement).GetContainingDocument;
      XMLStrings.Add(GetObjEndNode);
    end;
  end;
end;

procedure PXMLObjectWriter.WriteReference(Key: string; Value: PObject;
  Default: PObject = nil);
var
  Ref: string;
  D: PDocument;
begin
  D := nil;
  if not IsFiltered(Key) then
  begin
    if Value <> Default then
    begin
      if Value = nil then
      begin
        Ref := GetRefBeginNode(Key) + GetRefEndNode;
        XMLStrings.Add(Ref);
      end
      else
      begin
        if Value is PElement then
          D := (Value as PElement).GetContainingDocument;
        // if value is PModel and save value in different document, save with Pathname
        if (Value is PModel) and (CurrentDocument <> D) then
        begin
          Ref := GetRefBeginNode(Key, (Value as PModel).Pathname)
            + Value.GUID + GetRefEndNode;
          XMLStrings.Add(Ref);
        end
        else
        begin
          Ref := GetRefBeginNode(Key) + Value.GUID + GetRefEndNode;
          XMLStrings.Add(Ref);
        end;
      end;
    end;
  end;
end;

procedure PXMLObjectWriter.WriteUserDefinedType(TypeName, Key, Value: string;
  Default: string = '');
var
  Attr: string;
begin
  if not IsFiltered(Key) then
  begin
    if Value <> Default then
    begin
      Attr := GetAttrBeginNode(Key, TypeName) + Value + GetAttrEndNode;
      XMLStrings.Add(Attr);
    end;
  end;
end;

// PXMLObjectWriter
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PXMLDOMObjectWriter

constructor PXMLDOMObjectWriter.Create(BaseNode: IXMLNode);
begin
  CurrentNode := BaseNode;
  CurrentObject := nil;
  CurrentDocument := nil;
end;

procedure PXMLDOMObjectWriter.WriteInteger(Key: string; Value: Integer;
  Default: Integer = 0);
var
  AttrNode: IXMLNode;
begin
  if Value <> Default then
  begin
    AttrNode := CurrentNode.AddChild(XPD_ATTRIBUTE, XPD_NAMESPACE_URI);
    AttrNode.Attributes[XPD_NAME] := Key;
    AttrNode.Attributes[XPD_TYPE] := XPD_INTEGER;
    AttrNode.NodeValue := Value;
  end;
end;

procedure PXMLDOMObjectWriter.WriteBoolean(Key: string; Value: Boolean;
  Default: Boolean = False);
var
  AttrNode: IXMLNode;
begin
  if Value <> Default then
  begin
    AttrNode := CurrentNode.AddChild(XPD_ATTRIBUTE, XPD_NAMESPACE_URI);
    AttrNode.Attributes[XPD_NAME] := Key;
    AttrNode.Attributes[XPD_TYPE] := XPD_BOOLEAN;
    AttrNode.NodeValue := Value;
  end;
end;

procedure PXMLDOMObjectWriter.WriteReal(Key: string; Value: Real;
  Default: Real = 0.0);
var
  AttrNode: IXMLNode;
begin
  if Value <> Default then
  begin
    AttrNode := CurrentNode.AddChild(XPD_ATTRIBUTE, XPD_NAMESPACE_URI);
    AttrNode.Attributes[XPD_NAME] := Key;
    AttrNode.Attributes[XPD_TYPE] := XPD_REAL;
    AttrNode.NodeValue := Value;
  end;
end;

procedure PXMLDOMObjectWriter.WriteString(Key: string; Value: string;
  Default: string = '');
var
  AttrNode: IXMLNode;
begin
  if Value <> Default then
  begin
    AttrNode := CurrentNode.AddChild(XPD_ATTRIBUTE, XPD_NAMESPACE_URI);
    AttrNode.Attributes[XPD_NAME] := Key;
    AttrNode.Attributes[XPD_TYPE] := XPD_STRING;
    AttrNode.NodeValue := Value;
  end;
end;

procedure PXMLDOMObjectWriter.WriteObject(Key: string; Value: PObject;
  Default: PObject = nil);
var
  ObjNode: IXMLNode;
  TempNode: IXMLNode;
  TempObj: PObject;
begin
  if Value <> Default then
  begin
    ObjNode := CurrentNode.AddChild(XPD_OBJECT, XPD_NAMESPACE_URI);
    ObjNode.Attributes[XPD_NAME] := Key;
    ObjNode.Attributes[XPD_TYPE] := (Value as PElement).MetaClass.Name;
    ObjNode.Attributes[XPD_GUID] := Value.GUID;
    TempNode := CurrentNode;
    TempObj := CurrentObject;
    CurrentNode := ObjNode;
    CurrentObject := Value;
    if CurrentObject is PElement then
      CurrentDocument := (CurrentObject as PElement).GetContainingDocument;
    Value.Store(Self);
    CurrentNode := TempNode;
    CurrentObject := TempObj;
    if CurrentObject is PElement then
      CurrentDocument := (CurrentObject as PElement).GetContainingDocument;
  end;
end;

procedure PXMLDOMObjectWriter.WriteReference(Key: string; Value: PObject;
  Default: PObject = nil);
var
  AttrNode: IXMLNode;
  D: PDocument;
begin
  if Value <> Default then
  begin
    AttrNode := CurrentNode.AddChild(XPD_REFERENCE);
    AttrNode.Attributes[XPD_NAME] := Key;
    if Value = nil then
    begin
      AttrNode.NodeValue := '';
      AttrNode.Attributes[XPD_PATHNAME] := '';
    end
    else
    begin
      D := nil;
      if Value is PElement then
        D := (Value as PElement).GetContainingDocument;
      // if Value is PModel and save value in different Document, save with Pathname
      if (Value is PModel) and (CurrentDocument <> D) then
        AttrNode.Attributes[XPD_PATHNAME] := (Value as PModel).Pathname;
      AttrNode.NodeValue := Value.GUID;
    end;
  end;
end;

procedure PXMLDOMObjectWriter.WriteUserDefinedType(TypeName, Key,
  Value: string; Default: string = '');
var
  AttrNode: IXMLNode;
begin
  if Value <> Default then
  begin
    AttrNode := CurrentNode.AddChild(XPD_ATTRIBUTE, XPD_NAMESPACE_URI);
    AttrNode.Attributes[XPD_NAME] := Key;
    AttrNode.Attributes[XPD_TYPE] := TypeName;
    AttrNode.NodeValue := Value;
  end;
end;

// PXMLDOMObjectWriter
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PDocument

constructor PDocument.Create;
begin
  inherited;
  FFileName := '';
  FVersion := '1.0';
  FFileStream := nil;
  FModified := False;
  FReadOnly := False;
  FFileSavedTime := 0;
  FExternallyModified := False;
  FDocumentElement := nil;
  FOnModified := nil;
  FOnSaved := nil;
end;

destructor PDocument.Destroy;
begin
  DocumentElement := nil;
  RemoveExclusiveFileAccess;
  inherited;
end;

procedure PDocument.RemoveExclusiveFileAccess;
var
  CopyFileName: string;
begin
  if ExclusiveFileAccess then begin
    CopyFileName := FFileName + SharedCopyExt;
    if FileExists(CopyFileName) then begin
      FileSetAttr(CopyFileName, faNormal);
      DeleteFile(CopyFileName)
    end;
    FreeAndNil(FFileStream);
  end;
end;

procedure PDocument.UpdateFileAttr;
var
  DT: TDateTime;
  Attr: Integer;
begin
  if FileExists(FFileName) then
  begin
    DT := FileDateToDateTime(FileAge(FFileName));
    if (FFileSavedTime <> 0) and (FFileSavedTime <> DT) then
      FExternallyModified := True;
    FFileSavedTime := DT;
    Attr := FileGetAttr(FileName);
    FReadOnly := (Attr and faReadOnly) = faReadOnly;
  end
  else if FFileName <> '' then
  begin
    FModified := True;
    FReadOnly := False;
  end;
end;

function PDocument.GetDocumentSymbol: string;
begin
  Result := '';
end;

procedure PDocument.SetModified(Value: Boolean);
begin
  if FModified <> Value then
  begin
    FModified := Value;
    if FModified then
    begin
      if Assigned(FOnModified) then
        FOnModified(Self, Self);
    end
    else
    begin
      if Assigned(FOnSaved) then
        FOnSaved(Self, Self);
    end;
  end;
end;

procedure PDocument.SetDocumentElement(Value: PElement);
begin
  if FDocumentElement <> Value then
  begin
    if FDocumentElement <> nil then
      FDocumentElement.FDocument := nil;
    FDocumentElement := Value;
    if FDocumentElement <> nil then
      FDocumentElement.FDocument := Self;
  end;
end;

function PDocument.IsExclusiveFileAccess: Boolean;
begin
  Result := FFileStream <> nil;
end;

// PDocument
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PDocumentInputStream

constructor PDocumentInputStream.Create(AFileName: string;
  AReferenceResolver: PReferenceResolver);
begin
  FFileName := ExpandFileName(AFileName);
  XMLDoc := TXMLDocument.Create(Application);
  XMLDoc.ParseOptions := [poAsyncLoad];
  XMLDoc.OnAsyncLoad := AsyncLoadHandler;
  FReferenceResolver := AReferenceResolver;
end;

destructor PDocumentInputStream.Destroy;
begin
  XMLDoc.Free;
  FReferenceResolver := nil;
  inherited;
end;

procedure PDocumentInputStream.AsyncLoadHandler(Sender: TObject;
  AsyncLoadState: Integer);
begin
  LoadingProgress(FFileName, MAX_ASYNC_LOAD_STATE + 2, AsyncLoadState + 1);
end;

procedure PDocumentInputStream.LoadingProgress(Info: string;
  Max, Progress: Integer);
begin
  if Assigned(FOnLoadingProgress) then
    FOnLoadingProgress(Self, Info, Max, Progress);
end;

procedure PDocumentInputStream.ReadHeader(HeaderNode: IXMLNode);
begin
  // Nothing to read in header part
end;

procedure PDocumentInputStream.ReadBody(BodyNode: IXMLNode);
var
  Reader: PObjectReader;
begin
  // Read structure of objects.
  Reader := PXMLObjectReader.Create(BodyNode, FReferenceResolver);
  DocumentElement := Reader.ReadObject(XPD_DOCUMENT_ELEMENT) as PElement;
  Reader.Free;
end;

function PDocumentInputStream.ReadDocument(AFileAccessType: PFileAccessType): PDocument;
var
  DocumentSymbol: string;
  Version: string;
  HeaderNode: IXMLNode;
  BodyNode: IXMLNode;
  ADocument: PDocument;
  CurDir: string;
  FileStream: TFileStream;
begin
  // Check the file existence.
  if not FileExists(FFileName) then
   raise EFileNotFound.Create(Format(ERR_FILE_NOT_FOUND, [FFileName]));

   // Store CurrentDir and Change CurrentDir to path of the FileName.
  CurDir := GetCurrentDir;
  ChDir(ExtractFilePath(FFileName));

  FileStream := nil;
  if LoadDocument(AFileAccessType,FileStream) then begin

    DocumentSymbol := XMLDoc.DocumentElement.LocalName;
    Version := XMLDoc.DocumentElement.Attributes[XPD_VERSION];
    HeaderNode := XMLDoc.DocumentElement.ChildNodes.Nodes[XPD_HEADER];
    BodyNode := XMLDoc.DocumentElement.ChildNodes.Nodes[XPD_BODY];
    ReadHeader(HeaderNode);
    LoadingProgress(FFileName, MAX_ASYNC_LOAD_STATE + 2,
      MAX_ASYNC_LOAD_STATE + 1);
    ReadBody(BodyNode);

    // Set Up Document
    ADocument := CreateDocument;
    ADocument.FileName := FileName;
    ADocument.Version := Version;
    ADocument.DocumentElement := DocumentElement;
    ADocument.UpdateFileAttr;
    LoadingProgress(FFileName, MAX_ASYNC_LOAD_STATE + 2,
      MAX_ASYNC_LOAD_STATE + 2);

    if AFileAccessType = fatExclusive then begin
      ADocument.FileStream := FileStream;
    end
    else begin
      ADocument.FileStream := nil;
      FileStream.Free;
    end;

    ChDir(CurDir);
    Result := ADocument;
  end
  else begin
   ChDir(CurDir);
   raise EReadOnlyFile.Create('Operation aborted by user');
  end;

  // Restore CurrentDir

 end;

 // Loads XML document respecting eclusive access request
 function PDocumentInputStream.LoadDocument(var AFileAccessType: PFileAccessType;
  var AFileStream: TFileStream): Boolean;
const
  NormalFileAccess = fmOpenRead;
  ExclusiveFileAccess = fmOpenReadWrite + fmShareExclusive;
var
  FileStream: TFileStream;
  FileAccess: Cardinal;
  FileOpenError: Cardinal;
begin
  Result := False;
  // Check the file existence.
  if not FileExists(FFileName) then
    raise EFileNotFound.Create(Format(ERR_FILE_NOT_FOUND, [FFileName]));

  if AFileAccessType = fatNormal then
    FileAccess := NormalFileAccess
  else
    FileAccess := ExclusiveFileAccess;

  try
    FileStream := TFileStream.Create(FFileName, FileAccess);
  except on E:EFOpenError do begin // Collision with potentially locked file
    FileOpenError := GetLastError;
      if FileOpenError = ERROR_SHARING_VIOLATION then begin // If so try to open the copy
        Result := OpenFileAsReadOnly;
        AFileAccessType := fatNormal;
        Exit; // Possibly a read only file was accepted
      end
      else begin
        Result := False;
        AFileAccessType := fatNormal;
        Exit; // File reading exception could not be handled
      end;
    end;
  end;

  LoadingProgress(FFileName, MAX_ASYNC_LOAD_STATE + 2, 0);
  try
    XMLDoc.LoadFromStream(FileStream);
  except on Exception do begin
      FileStream.Free;
      raise;
  end;

  end;
  // Exclusive access creates a read only copy for other users
  if AFileAccessType = fatExclusive then begin
    CreateReadOnlyCopy;
    AFileStream := FileStream // With exclusive access stream must be preserved
  end
  else
    FileStream.Free;

  Result := True; // File was read correctly

end;


function PDocumentInputStream.OpenFileAsReadOnly: Boolean;
var
  ExclusiveUserInfoNode, UserNameNode, LockTimeNode: IXMLNode;
  ChildNodes: IXMLNodeList;
  Count: Integer;
  DeleteResult: Integer;
  ButtonSelected : Integer;
begin
  Result := False;

  FFileName := FFileName + PDocument.SharedCopyExt;
  if FileExists(FileName) then begin
    XMLDoc.LoadFromFile(FileName);
    ChildNodes := XMLDoc.DocumentElement.ChildNodes;
    Count := ChildNodes.GetCount;
    ExclusiveUserInfoNode := ChildNodes.First.ChildNodes.FindNode(ExclusiveUserInfo);
    UserNameNode := ExclusiveUserInfoNode.ChildNodes.FindNode(UserName);
    LockTimeNode := ExclusiveUserInfoNode.ChildNodes.FindNode(LockTime);

    ButtonSelected := MessageDlg('Do you want to read a copy of file locked by ' + UserNameNode.Text +
      ' on ' + LockTimeNode.Text ,mtConfirmation, mbYesNo, 0);

    Result := (buttonSelected = mrYes);

    DeleteResult := ChildNodes.First.ChildNodes.Delete(ExclusiveUserInfo);

  end
  else begin
    ShowMessage('File locked by another user and no info exists');
    FFileName := '';
    Result := False;
  end;

 end;



procedure PDocumentInputStream.CreateReadOnlyCopy;
var
  ExclusiveUserInfoNode,UserNameNode, LockTimeNode: IXMLNode;
  ChildNodes: IXMLNodeList;
  DeleteResult: Integer;
  CopyFileName: string;
begin
  ChildNodes := XMLDoc.DocumentElement.ChildNodes;
  ExclusiveUserInfoNode := ChildNodes.First.AddChild(ExclusiveUserInfo, -1);
  UserNameNode := ExclusiveUserInfoNode.AddChild(UserName, -1);
  UserNameNode.Text := GetUserFromWindows;
  LockTimeNode := ExclusiveUserInfoNode.AddChild(LockTime, -1);
  LockTimeNode.Text := DateTimeToStr(Now);

  CopyFileName := FFileName + PDocument.SharedCopyExt;

  // Clear readonly flag if present
  if FileExists(CopyFileName) then
      FileSetAttr(CopyFileName, faNormal);

  XMLDoc.SaveToFile(CopyFileName);
  FileSetAttr(CopyFileName, faReadOnly);

  // ExclusiveUserInfo node not needed anymore
  DeleteResult := ChildNodes.First.ChildNodes.Delete(ExclusiveUserInfo);
end;

// PDocumentInputStream
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PDocumentOutputStream

constructor PDocumentOutputStream.Create(AFileName: string);
var
  H: string;
begin
  FFileName := AFileName;
  H := '<?xml version="' + DEFAULT_XML_VERSION + '"' + ' encoding="' +
    DEFAULT_XML_ENCODING + '"?>';
  XMLStrings := TStringList.Create;
  XMLStrings.Add(H);
end;

destructor PDocumentOutputStream.Destroy;
begin
  XMLStrings.Free;
  inherited;
end;

function PDocumentOutputStream.GetDocBeginNode: string;
var
  S: string;
begin
  S := '<' + XPD_PREFIX + ':' + GetDocumentSymbol;
  S := S + ' xmlns:' + XPD_PREFIX + '="' + XPD_NAMESPACE_URI + '"';
  S := S + ' ' + XPD_VERSION + '="' + IntegerToString(GetDocumentVersion) + '"';
  S := S + '>';
  Result := S;
end;

function PDocumentOutputStream.GetDocEndNode: string;
begin
  Result := '</' + XPD_PREFIX + ':' + GetDocumentSymbol + '>';
end;

function PDocumentOutputStream.GetHeaderBeginNode: string;
begin
  Result := '<' + XPD_PREFIX + ':' + XPD_HEADER + '>';
end;

function PDocumentOutputStream.GetHeaderEndNode: string;
begin
  Result := '</' + XPD_PREFIX + ':' + XPD_HEADER + '>';
end;

function PDocumentOutputStream.GetBodyBeginNode: string;
begin
  Result := '<' + XPD_PREFIX + ':' + XPD_BODY + '>';
end;

function PDocumentOutputStream.GetBodyEndNode: string;
begin
  Result := '</' + XPD_PREFIX + ':' + XPD_BODY + '>';
end;

procedure PDocumentOutputStream.SavingProgress(Info: string;
  Max, Progress: Integer);
begin
  if Assigned(FOnSavingProgress) then
    FOnSavingProgress(Self, Info, Max, Progress);
end;

procedure PDocumentOutputStream.FilterHandler(Sender: TObject;
  CurrentObject: PObject; Key: string; var CanFilter: Boolean);
begin
  IsFiltered(CurrentObject, Key, CanFilter);
end;

function PDocumentOutputStream.GetDocumentSymbol: string;
begin
  Result := 'DOCUMENT';
end;

function PDocumentOutputStream.GetDocumentVersion: Integer;
begin
  Result := 1;
end;

procedure PDocumentOutputStream.IsFiltered(Obj: PObject; Key: string;
  var CanFilter: Boolean);
begin
end;

procedure PDocumentOutputStream.WriteHeader(ADocument: PDocument);
begin
  // Nothing to write in header part
end;

procedure PDocumentOutputStream.WriteBody(ADocument: PDocument);
var
  Writer: PXMLObjectWriter;
begin
  // PRECONDTIIONS
  Assert(ADocument <> nil);
  // PRECONDTIIONS
  Writer := PXMLObjectWriter.Create(XMLStrings);
  Writer.OnFilter := FilterHandler;
  Writer.WriteObject(XPD_DOCUMENT_ELEMENT, ADocument.DocumentElement);
  Writer.Free;
end;

procedure PDocumentOutputStream.Close(ADocument: PDocument);
begin
  if ADocument.ExclusiveFileAccess then begin
    ADocument.FileStream.Size := 0; // Overwrite existing content
    XMLStrings.SaveToStream(ADocument.FileStream)
  end
  else
    XMLStrings.SaveToFile(FFileName, TEncoding.UTF8);

  ADocument.FileSavedTime := FileDateToDateTime(FileAge(ADocument.FileName));
end;

procedure PDocumentOutputStream.WriteDocument(ADocument: PDocument);
var
  CurDir: string;
begin
  ADocument.UpdateFileAttr;
  if ADocument.ReadOnly then
    raise EReadOnlyFile.Create(Format(ERR_SAVE_READONLY_FILE,
        [ExtractFileName(ADocument.FileName)]));
  if ADocument <> nil then
  begin
    // Store CurrentDir and Move to path of the FileName
    CurDir := GetCurrentDir;
    ChDir(ExtractFilePath(FFileName));
    // Save the file
    SavingProgress(FFileName, 2, 0);
    XMLStrings.Add(GetDocBeginNode);
    XMLStrings.Add(GetHeaderBeginNode);
    WriteHeader(ADocument);
    XMLStrings.Add(GetHeaderEndNode);
    SavingProgress(FFileName, 2, 1);
    XMLStrings.Add(GetBodyBeginNode);
    WriteBody(ADocument);
    XMLStrings.Add(GetBodyEndNode);
    XMLStrings.Add(GetDocEndNode);
    ADocument.Modified := False;
    SavingProgress(FFileName, 2, 2);
    // Restore CurrentDir
    ChDir(CurDir);
  end;
end;

// PDocumentOutputStream
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PDocumentOutputStream__

{
  constructor PDocumentOutputStream__.Create(AFileName: string);
  begin
  FFileName := AFileName;
  XMLDoc := TXMLDocument.Create(Application);
  XMLDoc.Encoding := DEFAULT_XML_ENCODING;
  XMLDoc.Active := True;
  end;

  destructor PDocumentOutputStream__.Destroy;
  begin
  XMLDoc.Free;
  XMLDoc := nil;
  inherited;
  end;

  function PDocumentOutputStream__.GetDocumentSymbol: string;
  begin
  Result := 'DOCUMENT';
  end;

  function PDocumentOutputStream__.GetDocumentVersion: Integer;
  begin
  Result := 1;
  end;

  procedure PDocumentOutputStream__.WriteHeader(HeaderNode: IXMLNode; ADocument: PDocument);
  begin
  // Nothing to write in header part
  end;

  procedure PDocumentOutputStream__.WriteBody(BodyNode: IXMLNode; ADocument: PDocument);
  var
  Writer: PObjectWriter;
  begin
  // PRECONDTIIONS
  Assert(BodyNode <> nil);
  Assert(ADocument <> nil);
  // PRECONDTIIONS
  Writer := PXMLDOMObjectWriter.Create(BodyNode);
  Writer.WriteObject(XPD_DOCUMENT_ELEMENT, ADocument.DocumentElement);
  Writer.Free;
  end;

  procedure PDocumentOutputStream__.Close;
  begin
  XMLDoc.SaveToFile(FFileName);
  end;

  procedure PDocumentOutputStream__.WriteDocument(ADocument: PDocument);
  var
  HeaderNode: IXMLNode;
  BodyNode: IXMLNode;
  begin
  // PRECONDTIIONS
  Assert(ADocument <> nil);
  // PRECONDTIIONS
  XMLDoc.DocumentElement := XMLDoc.AddChild(XPD_PREFIX + ':' + GetDocumentSymbol);
  XMLDoc.DocumentElement.DeclareNamespace(XPD_PREFIX, XPD_NAMESPACE_URI);
  XMLDoc.DocumentElement.Attributes[XPD_VERSION] := GetDocumentVersion;
  HeaderNode := XMLDoc.DocumentElement.AddChild(XPD_HEADER, XPD_NAMESPACE_URI);
  BodyNode := XMLDoc.DocumentElement.AddChild(XPD_BODY, XPD_NAMESPACE_URI);
  WriteHeader(HeaderNode, ADocument);
  WriteBody(BodyNode, ADocument);
  end;
}

// PDocumentOutputStream__
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// PrimitiveType Conversion Routines

function BooleanToString(B: Boolean): string;
begin
  if B then
    Result := 'True'
  else
    Result := 'False';
end;

function StringToBoolean(S: string): Boolean;
begin
  if S = 'True' then
    Result := True
  else
    Result := False;
end;

function IntegerToString(I: Integer): string;
begin
  Result := IntToStr(I);
end;

function StringToInteger(S: string): Integer;
begin
  Result := StrToInt(S);
end;

function RealToString(R: Real): string;
begin
  Result := FloatToStr(R);
end;

function StringToReal(S: string): Real;
begin
  Result := StrToFloat(S);
end;

function RectToString(ARect: TRect): string;
const
  DELIMITER = ',';
begin
  Result := IntToStr(ARect.Left) + DELIMITER + IntToStr(ARect.Top)
    + DELIMITER + IntToStr(ARect.Right) + DELIMITER + IntToStr(ARect.Bottom);
end;

function StringToRect(RectStr: string): TRect;
const
  DELIMITER = ',';
var
  Fields: TStringList;
begin
  Fields := TStringList.Create;
  Fields.DELIMITER := DELIMITER;
  Fields.DelimitedText := RectStr;
  Result := Rect(StrToInt(Fields.Strings[0]), StrToInt(Fields.Strings[1]),
    StrToInt(Fields.Strings[2]), StrToInt(Fields.Strings[3]));
  Fields.Free;
end;

// PrimitiveType Conversion Routines
/// /////////////////////////////////////////////////////////////////////////////

/// /////////////////////////////////////////////////////////////////////////////
// Procedures and Functions

function ExtractHeadName(Pathname: string): string;
var
  Idx: Integer;
begin
  Idx := Pos(PATH_DELIMITER, Pathname);
  if Idx = 0 then
    Result := Pathname
  else
    Result := Copy(Pathname, 0, Idx - 1);
end;

function ExtractTailPath(Pathname: string): string;
var
  Idx: Integer;
begin
  Idx := Pos(PATH_DELIMITER, Pathname);
  if Idx = 0 then
    Result := ''
  else
    Result := Copy(Pathname, Idx + 2, Length(Pathname) - Idx - 1);
end;

procedure CheckNameValidity(Name: string);
begin
  if Pos('::', Name) > 0 then
  begin
    raise EInvalidName.Create(ERR_ELEM_INVALID_NAME);
  end;
end;

procedure CheckReadOnly(ElementSet: POrderedSet);
var
  I: Integer;
begin
  for I := 0 to ElementSet.Count - 1 do
    CheckReadOnly(ElementSet.Items[I] as PElement);
end;

procedure CheckReadOnly(ElementSet: PModelOrderedSet);
var
  Element: PElement;
begin
  for Element in  ElementSet do
    CheckReadOnly(Element);
end;

procedure CheckReadOnly(ElementSet: PViewOrderedSet);
var
  Element: PElement;
begin
  for Element in  ElementSet do
    CheckReadOnly(Element);
end;

procedure CheckReadOnly(Element: PElement);
var
  Doc: PDocument;
begin
  if Element <> nil then
  begin
    Doc := Element.GetContainingDocument;
    if (Doc <> nil) and (Doc.ReadOnly) then
      raise EReadOnlyDocument.Create(ERR_READONLY);
  end;
end;



// Procedures and Functions
/// /////////////////////////////////////////////////////////////////////////////

procedure RegisterClasses;
begin
  ClassRegistry.RegisterClass(PElement);
  ClassRegistry.RegisterClass(PModel);
  ClassRegistry.RegisterClass(PView);
  ClassRegistry.RegisterClass(PDiagram);
  ClassRegistry.RegisterClass(PDiagramView);
  ClassRegistry.RegisterClass(PMetaElement);
  ClassRegistry.RegisterClass(PMetaClassifier);
  ClassRegistry.RegisterClass(PMetaSlot);
  ClassRegistry.RegisterClass(PMetaAttribute);
  ClassRegistry.RegisterClass(PMetaAssociationEnd);
  ClassRegistry.RegisterClass(PMetaReference);
  ClassRegistry.RegisterClass(PMetaCollection);
  ClassRegistry.RegisterClass(PMetaClass);
  ClassRegistry.RegisterClass(PMetaLiteral);
  ClassRegistry.RegisterClass(PMetaEnumeration);
  ClassRegistry.RegisterClass(PMetaPrimitiveType);
  ClassRegistry.RegisterClass(PMetaDataType);
  ClassRegistry.RegisterClass(PMetaModel);
  ClassRegistry.RegisterClass(PDocument);
end;

procedure RegisterMetaClasses;
var
  M: PMetaClass;
begin
  // Meta Classes
  MetaModel.DefineMetaClass(PElement, 'Element', True);
  MetaModel.DefineMetaClass(PModel, 'Model', True);
  MetaModel.DefineMetaClass(PView, 'View', True);
  MetaModel.DefineMetaClass(PDiagram, 'Diagram', True);
  MetaModel.DefineMetaClass(PDiagramView, 'DiagramView', True);
  // Element
  M := MetaModel.FindMetaClass('Element');
  MetaModel.DefineMetaAttribute(M, 'Tag', 'String', False, False);
  M.Superclass := nil;
  // Model
  M := MetaModel.FindMetaClass('Model');
  MetaModel.DefineMetaAttribute(M, 'Name', 'String', False, False);
  MetaModel.DefineMetaAttribute(M, 'Documentation', 'String', False, False);
  MetaModel.DefineMetaAttribute(M, 'Attachments', 'String', True, False);
  MetaModel.DefineMetaAttribute(M, 'Pathname', 'String', True, True);
  MetaModel.DefineMetaCollection(M, 'Views', 'View', False, False, makNone,
    'Model', maeReference);
  MetaModel.DefineMetaCollection(M, 'OwnedDiagrams', 'Diagram', False, False,
    makComposite, 'DiagramOwner', maeReference);
  // View
  M := MetaModel.FindMetaClass('View');
  MetaModel.DefineMetaAttribute(M, 'LineColor', 'String', False, False,
    'clBlack');
  MetaModel.DefineMetaAttribute(M, 'FillColor', 'String', False, False,
    'clWhite');
  MetaModel.DefineMetaAttribute(M, 'FontFace', 'String', False, False,
    'Tahoma');
  MetaModel.DefineMetaAttribute(M, 'FontSize', 'Integer', False, False, '8');
  MetaModel.DefineMetaAttribute(M, 'FontColor', 'String', False, False,
    'clBlack');
  MetaModel.DefineMetaAttribute(M, 'FontStyle', 'Integer', True, False);
  MetaModel.DefineMetaAttribute(M, 'Visible', 'Boolean', True, False, 'True');
  MetaModel.DefineMetaAttribute(M, 'Enabled', 'Boolean', True, False, 'True');
  MetaModel.DefineMetaAttribute(M, 'Selected', 'Boolean', False, True);
  MetaModel.DefineMetaReference(M, 'Model', 'Model', False, False, makNone,
    'Views', maeCollection);
  MetaModel.DefineMetaReference(M, 'OwnerDiagramView', 'DiagramView', False,
    False, makNone, 'OwnedViews', maeCollection);
  MetaModel.DefineMetaReference(M, 'ContainerView', 'View', False, False,
    makNone, 'ContainedViews', maeCollection);
  MetaModel.DefineMetaCollection(M, 'ContainedViews', 'View', False, False,
    makComposite, 'ContainerView', maeReference);
  // Diagram
  M := MetaModel.FindMetaClass('Diagram');
  MetaModel.DefineMetaAttribute(M, 'DefaultDiagram', 'Boolean', False, False);
  MetaModel.DefineMetaAttribute(M, 'DiagramType', 'String', False, False);
  MetaModel.DefineMetaReference(M, 'DiagramOwner', 'Model', False, False,
    makNone, 'OwnedDiagrams', maeCollection);
  MetaModel.DefineMetaReference(M, 'DiagramView', 'DiagramView', True, False,
    makComposite, 'Diagram', maeReference);
  // DiagramView
  M := MetaModel.FindMetaClass('DiagramView');
  MetaModel.DefineMetaCollection(M, 'SelectedViews', 'View', True, True,
    makNone);
  MetaModel.DefineMetaReference(M, 'Diagram', 'Diagram', True, False, makNone,
    'DiagramView', maeReference);
  MetaModel.DefineMetaCollection(M, 'OwnedViews', 'View', False, False,
    makComposite, 'OwnerDiagramView', maeReference);
  // Inheritance Relations
  MetaModel.DefineMetaInheritance('Element', 'Model');
  MetaModel.DefineMetaInheritance('Element', 'View');
  MetaModel.DefineMetaInheritance('Model', 'Diagram');
  MetaModel.DefineMetaInheritance('View', 'DiagramView');
end;

initialization

RegisterClasses;
MetaModel := PMetaModel.Create;
MetaModel.Name := 'UML';
MetaModel.DefineMetaPrimitiveType('Integer');
MetaModel.DefineMetaPrimitiveType('Real');
MetaModel.DefineMetaPrimitiveType('Boolean');
MetaModel.DefineMetaPrimitiveType('String');
RegisterMetaClasses;

finalization

MetaModel.Free;

end.
