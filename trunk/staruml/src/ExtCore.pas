unit ExtCore;

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
  BasicClasses, Core, NxMgr,
  Classes, Graphics, SysUtils, XMLDoc, XMLIntf;

const
  EXT_DIR = 'modules';
  PROFILE_EXTENSION = 'prf';
  ICON_EXTENSION = 'ico';

type
  // Forward Declarations
  PConstraint = class;
  PTaggedValue = class;
  PStereotype = class;
  PTagDefinition = class;
  PTagDefinitionSet = class;
  PDiagramType = class;
  PElementPrototype = class;
  PModelPrototype = class;
  PPalette = class;
  PProfile = class;

  // Enumerations
  PTagTypeKind = (tkInteger, tkBoolean, tkString, tkReal, tkEnumeration, tkReference, tkCollection);
  PDragTypeKind = (dkRect, dkLine);

  // Exception
  EProfileNotFound = class(Exception);
  ETagDefinitionNotFound = class(Exception);
  EInvalidTaggedValueType = class(Exception);
  EInvalidProfileFileFormat = class(Exception);
  EUnableSetTaggedValue = class(Exception);
  ECannotExcludeProfile = class(Exception);

  // Event Types
  PProfileEvent = procedure(Sender: TObject; AProfileName: string) of object;

  // PExtensibleModel
  PExtensibleModel = class(PModel)
  private
    FStereotypeProfile: string;
    FStereotypeName: string;
    FConstraints: POrderedSet;
    FTaggedValues: POrderedSet;
    FReferencingTags: POrderedSet;
    procedure SetStereotypeProfile(Value: string);
    procedure SetStereotypeName(Value: string);
    function GetConstraint(Index: Integer): PConstraint;
    function GetConstraintCount:Integer;
    function GetTaggedValue(Index: Integer): PTaggedValue;
    function GetTaggedValueCount:Integer;
    function GetReferencingTag(Index: Integer): PTaggedValue;
    function GetReferencingTagCount: Integer;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Accept(Visitor: PVisitor); override;
    function GetStereotype: PStereotype;
    procedure SetStereotype(Name: string); overload;
    procedure SetStereotype(Profile: string; Name: string); overload;
    procedure ClearConstraints;
    procedure AddConstraint(AConstraint: PConstraint);
    procedure RemoveConstraint(AConstraint: PConstraint);
    procedure InsertConstraint(Index: Integer; AConstraint: PConstraint);
    procedure DeleteConstraint(Index: Integer);
    function IndexOfConstraint(AConstraint: PConstraint): Integer;
    function GetConstraintByGuid(AGuid: string): PConstraint;
    procedure ClearTaggedValues;
    procedure AddTaggedValue(ATaggedValue: PTaggedValue);
    procedure RemoveTaggedValue(ATaggedValue: PTaggedValue);
    procedure InsertTaggedValue(Index: Integer; ATaggedValue: PTaggedValue);
    procedure DeleteTaggedValue(Index: Integer);
    function IndexOfTaggedValue(ATaggedValue: PTaggedValue): Integer;
    procedure ClearReferencingTags;
    procedure AddReferencingTag(ATaggedValue: PTaggedValue);
    procedure RemoveReferencingTag(ATaggedValue: PTaggedValue);
    procedure InsertReferencingTag(Index: Integer; ATaggedValue: PTaggedValue);
    procedure DeleteReferencingTag(Index: Integer);
    function IndexOfReferencingTag(ATaggedValue: PTaggedValue): Integer;
    function FindTaggedValue(Profile: string; TagDefinitionSet: string; Name: string): PTaggedValue;
    function QueryDataTaggedValue(Profile: string; TagDefinitionSet: string; Name: string): string;
    function QueryReferenceTaggedValue(Profile: string; TagDefinitionSet: string; Name: string): PExtensibleModel;
    function IsApplicableTagDefinition(Profile: string; TagDefinitionSet: string; Name: string): Boolean;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    procedure MOF_AddCollectionItem(Name: string; Value: PElement); override;
    procedure MOF_RemoveCollectionItem(Name: string; Value: PElement); override;
    procedure MOF_InsertCollectionItem(Name: string; Index: Integer; Value: PElement); override;
    procedure MOF_DeleteCollectionItem(Name: string; Index: Integer); override;
    procedure MOF_ClearCollection(Name: string); override;
    function MOF_IndexOfCollectionItem(Name: string; Value: PElement): Integer; override;
    function MOF_GetCollectionItem(Name: string; Index: Integer): PElement; override;
    function MOF_GetCollectionCount(Name: string): Integer; override;
    property StereotypeProfile: string read FStereotypeProfile write SetStereotypeProfile;
    property StereotypeName: string read FStereotypeName write SetStereotypeName;
    property Constraints[Index: Integer]: PConstraint read GetConstraint;
    property ConstraintCount: Integer read GetConstraintCount;
    property TaggedValues[Index: Integer]: PTaggedValue read GetTaggedValue;
    property TaggedValueCount: Integer read GetTaggedValueCount;
    property ReferencingTags[Index: Integer]: PTaggedValue read GetReferencingTag;
    property ReferencingTagCount: Integer read GetReferencingTagCount;
  end;

  // PConstraint
  PConstraint = class(PElement)
  private
    FName: string;
    FBody: string;
    FConstrainedModel: PExtensibleModel;
    procedure SetName(Value: string);
    procedure SetBody(Value: string);
    procedure SetConstrainedModel(Value: PExtensibleModel);
  public
    constructor Create; override;
    function GetContainingDocument: PDocument; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property ConstrainedModel: PExtensibleModel read FConstrainedModel write SetConstrainedModel;
    property Name: string read FName write SetName;
    property Body: string read FBody write SetBody;
  end;

  // PTaggedValue
  PTaggedValue = class(PElement)
  private
    FProfileName: string;
    FTagDefinitionSetName: string;
    FName: string;
    FDataValue: string;
    FTaggedModel: PExtensibleModel;
    FReferenceValues: POrderedSet;
    procedure SetProfileName(Value: string);
    procedure SetTagDefinitionSetName(Value: string);
    procedure SetName(Value: string);
    procedure SetTaggedModel(Value: PExtensibleModel);
    function GetDataValue: string;
    procedure SetDataValue(Value: string);
    function GetReferenceValueCount: Integer;
    function GetReferenceValue(Index: Integer): PExtensibleModel;
  public
    constructor Create; override;
    destructor Destroy; override;
    function GetTagDefinition: PTagDefinition;
    function GetTagDefinitionSet: PTagDefinitionSet;
    function GetProfile: PProfile;
    function GetContainingDocument: PDocument; override;
    procedure ClearReferenceValues;
    procedure AddReferenceValue(Value: PExtensibleModel);
    procedure RemoveReferenceValue(Value: PExtensibleModel);
    procedure InsertReferenceValue(Index: Integer; Value: PExtensibleModel);
    procedure DeleteReferenceValue(Index: Integer);
    function IndexOfReferenceValue(Value: PExtensibleModel): Integer;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    procedure MOF_AddCollectionItem(Name: string; Value: PElement); override;
    procedure MOF_RemoveCollectionItem(Name: string; Value: PElement); override;
    procedure MOF_InsertCollectionItem(Name: string; Index: Integer; Value: PElement); override;
    procedure MOF_DeleteCollectionItem(Name: string; Index: Integer); override;
    procedure MOF_ClearCollection(Name: string); override;
    function MOF_IndexOfCollectionItem(Name: string; Value: PElement): Integer; override;
    function MOF_GetCollectionItem(Name: string; Index: Integer): PElement; override;
    function MOF_GetCollectionCount(Name: string): Integer; override;
    property TaggedModel: PExtensibleModel read FTaggedModel write SetTaggedModel;
    property ProfileName: string read FProfileName write SetProfileName;
    property TagDefinitionSetName: string read FTagDefinitionSetName write SetTagDefinitionSetName;
    property Name: string read FName write SetName;
    property DataValue: string read GetDataValue write SetDataValue;
    property ReferenceValueCount: Integer read GetReferenceValueCount;
    property ReferenceValues[Index: Integer]: PExtensibleModel read GetReferenceValue;
  end;

  // PTagDefinition
  PTagDefinition = class(BasicClasses.PObject)
  private
    FName: string;
    FTagType: PTagTypeKind;
    FReferenceType: string;
    FDefaultValue: string;
    FLock: Boolean;
    FTagDefinitionSet: PTagDefinitionSet;
    FLiterals: TStringList;
    function GetReferenceType: string;
    function GetLiteral(Index: Integer): string;
    function GetLiteralCount: Integer;
  public
    constructor Create; override;
    destructor Destroy; override;
    function IndexOfLiteral(ALiteral: string): Integer;
    property Name: string read FName;
    property TagType: PTagTypeKind read FTagType;
    property ReferenceType: string read GetReferenceType;
    property DefaultValue: string read FDefaultValue;
    property Lock: Boolean read FLock;
    property LiteralCount: Integer read GetLiteralCount;
    property Literals[Index: Integer]: string read GetLiteral;
    property TagDefinitionSet: PTagDefinitionSet read FTagDefinitionSet;
  end;


  // PTagDefinitionSet
  PTagDefinitionSet = class(BasicClasses.PObject{,IEnumerable<PTagDefinition>})

  private type
    TTagDefinitionSetEnumerator = class
    private
      FIndex: Integer;
      FTagDefinitionSet: PTagDefinitionSet;
    public
      constructor Create(ATagDefinitionSet: PTagDefinitionSet);
      function GetCurrent: PTagDefinition; inline;
      function MoveNext: Boolean;
      property Current: PTagDefinition read GetCurrent;
    end;


  private
    FName: string;
    FBaseClasses: TStringList;
    FTagDefinitions: POrderedSet;
    FProfile: PProfile;
    FStereotype: PStereotype;
    function GetBaseClassCount: Integer;
    function GetBaseClass(Index: Integer): string;
    function GetTagDefinitionCount: Integer;
    function GetTagDefinition(Index: Integer): PTagDefinition;
  public
    constructor Create; override;
    destructor Destroy; override;
    function FindTagDefinition(AName: string): PTagDefinition;
    function CanApplyTo(AClassName: string): Boolean;
    function GetEnumerator: TTagDefinitionSetEnumerator;
    property Name: string read FName;
    property BaseClassCount: Integer read GetBaseClassCount;
    property BaseClasses[Index: Integer]: string read GetBaseClass;
    property TagDefinitionCount: Integer read GetTagDefinitionCount;
    property TagDefinitions[Index: Integer]: PTagDefinition read GetTagDefinition;
    property Profile: PProfile read FProfile;
    property Stereotype: PStereotype read FStereotype;
  {type
    TEnumerator = class(IEnumerator<PTagDefinition>)
    public
      function GetCurrent: PTagDefinition;
    end;

    function GetEnumerator: IEnumerator<PTagDefinition>;}
  end;

  // PStereotype
  PStereotype = class(BasicClasses.PObject)
  private
    FName: string;
    FIconFile: string;
    FIconMinWidth: Integer;
    FIconMinHeight: Integer;
    FSmallIconFile: string;
    FDescription: string;
    FBaseClasses: TStringList;
    FProfile: PProfile;
    FParent: PStereotype;
    FChildren: TList;
    FTagDefinitionSet: PTagDefinitionSet;
    FImageIndex: Integer;
    FNotationExpr: PNXExpr;
    FIcon: TGraphic;
    function GetBaseClassCount: Integer;
    function GetBaseClass(Index: Integer): string;
    function GetChildCount: Integer;
    function GetChild(Index: Integer): PStereotype;
    function GetDerivedTagDefinitionSet: PTagDefinitionSet;
    function GetNotationExpr: PNXExpr;
    procedure LoadIconFile;
  public
    constructor Create; override;
    destructor Destroy; override;
    function CanApplyTo(AClassName: string): Boolean;
    property Name: string read FName;
    property IconFile: string read FIconFile;
    property IconMinWidth: Integer read FIconMinWidth;
    property IconMinHeight: Integer read FIconMinHeight;
    property SmallIconFile: string read FSmallIconFile write FSmallIconFile;
    property Description: string read FDescription;
    property BaseClassCount: Integer read GetBaseClassCount;
    property BaseClasses[Index: Integer]: string read GetBaseClass;
    property Profile: PProfile read FProfile;
    property Parent: PStereotype read FParent;
    property ChildCount: Integer read GetChildCount;
    property Children[Index: Integer]: PStereotype read GetChild;
    property TagDefinitionSet: PTagDefinitionSet read FTagDefinitionSet;
    property DerivedTagDefinitionSet: PTagDefinitionSet read GetDerivedTagDefinitionSet;
    property ImageIndex: Integer read FImageIndex write FImageIndex;
    property NotationExpr: PNXExpr read GetNotationExpr;
    property Icon: TGraphic read FIcon;
  end;

  // PDataType
  PDataType = class(BasicClasses.PObject)
  private
    FName: string;
    FProfile: PProfile;
  public
    constructor Create; override;
    property Name: string read FName;
    property Profile: PProfile read FProfile;
  end;

  // PElementPrototype
  PElementPrototype = class(BasicClasses.PObject)
  private
    FName: string;
    FDisplayName: string;
    FBaseElement: string;
    FArgument: Integer;
    FIconFile: string;
    FDragType: PDragTypeKind;
    FStereotypeName: string;
    FStereotypeDisplay: string;
    FShowExtendedNotation: Boolean;
    FModelProperties: TStringList;
    FViewProperties: TStringList;
    FTaggedValues: TStringList;
    FImageIndex: Integer;
    FProfile: PProfile;
    function GetModelPropertyCount: Integer;
    function GetModelPropertyName(Index: Integer): string;
    function GetModelPropertyValue(Index: Integer): string;
    function GetViewPropertyCount: Integer;
    function GetViewPropertyName(Index: Integer): string;
    function GetViewPropertyValue(Index: Integer): string;
    function GetTaggedValueCount: Integer;
    function GetTaggedValue(Profile: string; TagDefinitionSet: string; TagDefinition: string): string;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure AddModelProperty(Name: string; Value: string);
    procedure AddViewProperty(Name: string; Value: string);
    procedure AddTaggedValue(Profile: string; TagDefinitionSet: string; TagDefinition: string; Value: string);
    property Name: string read FName write FName;
    property DisplayName: string read FDisplayName write FDisplayName;
    property BaseElement: string read FBaseElement write FBaseElement;
    property Argument: Integer read FArgument write FArgument;
    property IconFile: string read FIconFile write FIconFile;
    property DragType: PDragTypeKind read FDragType write FDragType;
    property StereotypeName: string read FStereotypeName write FStereotypeName;
    property StereotypeDisplay: string read FStereotypeDisplay write FStereotypeDisplay;
    property ShowExtendedNotation: Boolean read FShowExtendedNotation write FShowExtendedNotation;
    property ModelPropertyCount: Integer read GetModelPropertyCount;
    property ModelPropertyNames[Index: Integer]: string read GetModelPropertyName;
    property ModelPropertyValues[Index: Integer]: string read GetModelPropertyValue;
    property ViewPropertyCount: Integer read GetViewPropertyCount;
    property ViewPropertyNames[Index: Integer]: string read GetViewPropertyName;
    property ViewPropertyValues[Index: Integer]: string read GetViewPropertyValue;
    property TaggedValueCount: Integer read GetTaggedValueCount;
    property TaggedValues[Profile: string; TagDefinitionSet: string; TagDefinition: string]: string read GetTaggedValue;
    property ImageIndex: Integer read FImageIndex write FImageIndex;
    property Profile: PProfile read FProfile;
  end;

  // PModelPrototype
  PModelPrototype = class(BasicClasses.PObject)
  private
    FName: string;
    FDisplayName: string;
    FBaseModel: string;
    FArgument: Integer;
    FIconFile: string;
    FStereotypeName: string;
    FProperties: TStringList;
    FTaggedValues: TStringList;
    FContainerModels: TStringList;
    FContainerModelStereotypes: TStringList;
    FImageIndex: Integer;
    FProfile: PProfile;
    function GetPropertyCount: Integer;
    function GetPropertyName(Index: Integer): string;
    function GetPropertyValue(Index: Integer): string;
    function GetTaggedValueCount: Integer;
    function GetTaggedValue(Profile: string; TagDefinitionSet: string; TagDefinition: string): string;
    function GetContainerModelCount: Integer;
    function GetContainerModel(Index: Integer): string;
    function GetContainerModelStereotype(Index: Integer): string;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure AddProperty(Name: string; Value: string);
    procedure AddTaggedValue(Profile: string; TagDefinitionSet: string; TagDefinition: string; Value: string);
    procedure AddContainerModel(ModelKind: string; StereotypeName: string);
    property Name: string read FName write FName;
    property DisplayName: string read FDisplayName write FDisplayName;
    property BaseModel: string read FBaseModel write FBaseModel;
    property Argument: Integer read FArgument write FArgument;
    property IconFile: string read FIconFile write FIconFile;
    property StereotypeName: string read FStereotypeName write FStereotypeName;
    property PropertyCount: Integer read GetPropertyCount;
    property PropertyNames[Index: Integer]: string read GetPropertyName;
    property PropertyValues[Index: Integer]: string read GetPropertyValue;
    property ContainerModelCount: Integer read GetContainerModelCount;
    property ContainerModels[Index: Integer]: string read GetContainerModel;
    property ContainerModelStereotypes[Index: Integer]: string read GetContainerModelStereotype; 
    property ImageIndex: Integer read FImageIndex write FImageIndex;
    property Profile: PProfile read FProfile;
  end;

  // PPalette
  PPalette = class(BasicClasses.PObject)
  private
    FName: string;
    FDisplayName: string;
    FPaletteItems: TStringList;
    FProfile: PProfile;
    function GetPaletteItemCount: Integer;
    function GetPaletteItem(Index: Integer): string;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure AddPaletteItem(Value: string);
    property Name: string read FName write FName;
    property DisplayName: string read FDisplayName write FDisplayName;
    property PaletteItemCount: Integer read GetPaletteItemCount;
    property PaletteItems[Index: Integer]: string read GetPaletteItem;
    property Profile: PProfile read FProfile;
  end;

  // PDiagramType
  PDiagramType = class(BasicClasses.PObject)
  private
    FName: string;
    FDisplayName: string;
    FBaseDiagram: string;
    FIconFile: string;
    FAvailablePalettes: TStringList;
    FProfile: PProfile;
    FImageIndex: Integer;
    function GetAvailablePaletteCount: Integer;
    function GetAvailablePalette(Index: Integer): string;
  public
    constructor Create; override;
    destructor Destroy; override;
    property Name: string read FName write FName;
    property DisplayName: string read FDisplayName write FDisplayName;
    property BaseDiagram: string read FBaseDiagram write FBaseDiagram;
    property IconFile: string read FIconFile write FIconFile;
    property AvailablePaletteCount: Integer read GetAvailablePaletteCount;
    property AvailablePalettes[Index: Integer]: string read GetAvailablePalette;
    property Profile: PProfile read FProfile;
    property ImageIndex: Integer read FImageIndex write FImageIndex;
  end;

  // PProfile
  PProfile = class(BasicClasses.PObject)
  private
    FName: string;
    FDisplayName: string;
    FPath: string;
    FFileName: string;
    FIconFile: string;
    FDescription: string;
    FAutoInclude: Boolean;
    FStereotypes: POrderedSet;
    FTagDefinitionSets: POrderedSet;
    FDataTypes: POrderedSet;
    FElementPrototypes: POrderedSet;
    FModelPrototypes: POrderedSet;
    FDiagramTypes: POrderedSet;
    FPalettes: POrderedSet;
    function GetStereotypeCount: Integer;
    function GetStereotype(Index: Integer): PStereotype;
    function GetTagDefinitionSetCount: Integer;
    function GetTagDefinitionSet(Index: Integer): PTagDefinitionSet;
    function GetDataTypeCount: Integer;
    function GetDataType(Index: Integer): PDataType;
    function GetElementPrototypeCount: Integer;
    function GetElementPrototype(Index: Integer): PElementPrototype;
    function GetModelPrototypeCount: Integer;
    function GetModelPrototype(Index: Integer): PModelPrototype;
    function GetDiagramTypeCount: Integer;
    function GetDiagramType(Index: Integer): PDiagramType;
    function GetPaletteCount: Integer;
    function GetPalette(Index: Integer): PPalette;
  public
    constructor Create; override;
    destructor Destroy; override;
    function FindTagDefinition(ATagDefinitionSetName, AName: string): PTagDefinition;
    function FindTagDefinitionSet(AName: string): PTagDefinitionSet;
    function FindStereotype(AName: string; BaseClass: string): PStereotype;
    function FindDataType(AName: string): PDataType;
    function FindElementPrototype(AName: string): PElementPrototype;
    function FindModelPrototype(AName: string): PModelPrototype;
    function FindDiagramType(AName: string): PDiagramType;
    function FindPalette(AName: string): PPalette;
    property Name: string read FName;
    property DisplayName: string read FDisplayName;
    property Path: string read FPath;
    property FileName: string read FFileName;
    property IconFile: string read FIconFile;
    property Description: string read FDescription;
    property AutoInclude: Boolean read FAutoInclude;
    property StereotypeCount: Integer read GetStereotypeCount;
    property Stereotypes[Index: Integer]: PStereotype read GetStereotype;
    property TagDefinitionSetCount: Integer read GetTagDefinitionSetCount;
    property TagDefinitionSets[Index: Integer]: PTagDefinitionSet read GetTagDefinitionSet;
    property DataTypeCount: Integer read GetDataTypeCount;
    property DataTypes[Index: Integer]: PDataType read GetDataType;
    property ElementPrototypeCount: Integer read GetElementPrototypeCount;
    property ElementPrototypes[Index: Integer]: PElementPrototype read GetElementPrototype;
    property ModelPrototypeCount: Integer read GetModelPrototypeCount;
    property ModelPrototypes[Index: Integer]: PModelPrototype read GetModelPrototype;
    property DiagramTypeCount: Integer read GetDiagramTypeCount;
    property DiagramTypes[Index: Integer]: PDiagramType read GetDiagramType;
    property PaletteCount: Integer read GetPaletteCount;
    property Palettes[Index: Integer]: PPalette read GetPalette;
  end;

  // PStereotypeTableItem
  PStereotypeTableItem = class
  private
    Stereotype: string;
    Parent: string;
    TagDefinitionSet: string;
  end;

  // PProfileReader
  PProfileReader = class
  private
    StereotypeTable: TList;
    procedure Report(Msg: string);
    procedure ClearStereotypeTable;
    function FindChild(Node: IXMLNode; Key: string): IXMLNode;
    function FindSibling(Node: IXMLNode; Key: string): IXMLNode;
    function ReadStringNodeValue(Node: IXMLNode; DefaultValue: string = ''): string;
    function ReadChildStringValue(OwnerNode: IXMLNode; Key: string; DefaultValue: string = ''): string;
    function ReadChildIntegerValue(OwnerNode: IXMLNode; Key: string; DefaultValue: Integer = 0): Integer;
    function ReadChildBooleanValue(OwnerNode: IXMLNode; Key: string; DefaultValue: Boolean = False): Boolean;
    function GetStringAttribute(Node: IXMLNode; AttrName: string; DefaultValue: string = ''): string;
    function GetIntegerAttribute(Node: IXMLNode; AttrName: string; DefaultValue: Integer = 0): Integer;
    function GetBooleanAttribute(Node: IXMLNode; AttrName: string; DefaultValue: Boolean = False): Boolean;
    function ReadHeader(Node: IXMLNode; AProfile: PProfile): Boolean;
    function ReadBody(Node: IXMLNode; AProfile: PProfile): Boolean;
    function ReadStereotype(Node: IXMLNode; AProfile: PProfile; AStereotype: PStereotype;
      AStereotypeTableItem: PStereotypeTableItem): Boolean;
    function ReadTagDefinitionSet(Node: IXMLNode; AProfile: PProfile; ATagDefinitionSet: PTagDefinitionSet): Boolean;
    function ReadTagDefinition(Node: IXMLNode; ATagDefinition: PTagDefinition): Boolean;
    function ReadDataType(Node: IXMLNode; ADataType: PDataType): Boolean;
    function ReadElementPrototype(Node: IXMLNode; AProfile: PProfile; AElementPrototype: PElementPrototype): Boolean;
    function ReadModelPrototype(Node: IXMLNode; AProfile: PProfile; AModelPrototype: PModelPrototype): Boolean;
    function ReadDiagramType(Node: IXMLNode; AProfile: PProfile; ADiagramType: PDiagramType): Boolean;
    function ReadPalette(Node: IXMLNode; AProfile: PProfile; APalette: PPalette): Boolean;
    procedure Compansate(AProfile: PProfile);
  public
    constructor Create;
    destructor Destroy; override;
    function ReadProfile(AProfile: PProfile): Boolean;
  end;

  // PExtensionManager
  PExtensionManager = class(BasicClasses.PObject)
  private
    FAvailableProfiles: POrderedSet;
    FIncludedProfiles: POrderedSet;
    function GetAvailableProfileCount: Integer;
    function GetAvailableProfile(Index: Integer): PProfile;
    function GetIncludedProfileCount: Integer;
    function GetIncludedProfile(Index: Integer): PProfile;
    function CanExcludeProfile(AProfile: PProfile): Boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure ClearIncludedProfiles;
    procedure IncludeProfile(AProfile: string);
    procedure ExcludeProfile(AProfile: string);
    procedure ExcludeAllProfiles;
    function IsIncluded(AProfile: PProfile): Boolean;
    function FindAvailableProfile(AName: string): PProfile;
    function FindIncludedProfile(AName: string): PProfile;
    function FindStereotype(AProfile, AName: string; BaseClass: string): PStereotype;
    function FindFirstStereotype(Name: string; BaseClass: string): PStereotype;
    function FindTagDefinition(AProfile, ATagDefinitionSetName, AName: string): PTagDefinition;
    function FindTagDefinitionSet(AProfile, AName: string): PTagDefinitionSet;
    function FindDiagramType(AProfile, AName: string): PDiagramType;
    function FindElementPrototype(AProfile, AName: string): PElementPrototype;
    function FindModelPrototype(AProfile, AName: string): PModelPrototype;
    procedure LoadProfiles;
    property AvailableProfileCount: Integer read GetAvailableProfileCount;
    property AvailableProfiles[Index: Integer]: PProfile read GetAvailableProfile;
    property IncludedProfileCount: Integer read GetIncludedProfileCount;
    property IncludedProfiles[Index: Integer]: PProfile read GetIncludedProfile;
  end;

  // Utilities
  function IsValidTagTypeStr(T: string): Boolean;
  function TagTypeToStr(T: PTagTypeKind): string;
  function StrToTagType(T: string): PTagTypeKind;
  function IsDataTagType(T: PTagTypeKind): Boolean;
  function IsReferenceTagType(T: PTagTypeKind): Boolean;
  function StrToDragType(T: string): PDragTypeKind;

var
  ExtensionManager: PExtensionManager;

implementation

uses
  LogMgr,
  Windows, Variants, Forms, Registry, NLS_StarUML;

const
  PROFILES_REGPATH = '\Software\StarUML\Profiles';
  REG_PROFILE_PATH = 'Path';
  REG_PROFILE_FILENAME = 'FileName';
  REG_PROFILE_ICONFILENAME = 'IconFileName';
  REG_PROFILE_AUTOINCLUDE = 'AutoInclude';

  CURRENT_PRF_VERSION = '2.0';

  PRF_PROFILE = 'PROFILE';
  PRF_HEAD = 'HEADER';
  PRF_BODY = 'BODY';
  PRF_NAME = 'NAME';
  PRF_DISPLAYNAME = 'DISPLAYNAME';
  PRF_DESCRIPTION = 'DESCRIPTION';
  PRF_AUTOINCLUDE = 'AUTOINCLUDE';
  PRF_STEREOTYPELIST = 'STEREOTYPELIST';
  PRF_STEREOTYPE = 'STEREOTYPE';
  PRF_STEREOTYPE_NAME = 'NAME';
  PRF_STEREOTYPE_DESCRIPTION = 'DESCRIPTION';
  PRF_STEREOTYPE_BASECLASSES = 'BASECLASSES';
  PRF_STEREOTYPE_BASECLASS = 'BASECLASS';
  PRF_STEREOTYPE_PARENT = 'PARENT';
  PRF_STEREOTYPE_TAGDEFINITIONSET = 'RELATEDTAGDEFINITIONSET';
  PRF_STEREOTYPE_ICON = 'ICON';
  PRF_STEREOTYPE_SMALLICON = 'SMALLICON';
  PRF_STEREOTYPE_NOTATION = 'NOTATION';
  PRF_TAGDEFINITIONSETLIST = 'TAGDEFINITIONSETLIST';
  PRF_TAGDEFINITIONSET = 'TAGDEFINITIONSET';
  PRF_TAGDEFINITIONSET_NAME = 'NAME';
  PRF_TAGDEFINITIONSET_BASECLASSES = 'BASECLASSES';
  PRF_TAGDEFINITIONSET_BASECLASS = 'BASECLASS';
  PRF_TAGDEFINITIONSET_TAGDEFINITIONLIST = 'TAGDEFINITIONLIST';
  PRF_TAGDEFINITIONSET_TAGDEFINITION = 'TAGDEFINITION';

  PRF_TAGDEFINITION_NAME = 'NAME';
  PRF_TAGDEFINITION_TAGTYPE = 'TAGTYPE';
  PRF_TAGDEFINITION_DEFAULTVALUE = 'DEFAULTDATAVALUE';
  PRF_TAGDEFINITION_LITERALS = 'LITERALS';
  PRF_TAGDEFINITION_LITERAL = 'LITERAL';
  PRF_TAGDEFINITION_REFERENCETYPE = 'REFERENCETYPE';

  PRF_DATATYPELIST = 'DATATYPELIST';
  PRF_DATATYPE = 'DATATYPE';
  PRF_DATATYPE_NAME = 'NAME';

  PRF_DIAGRAMTYPELIST = 'DIAGRAMTYPELIST';
  PRF_DIAGRAMTYPE = 'DIAGRAMTYPE';
  PRF_DIAGRAMTYPE_NAME = 'NAME';
  PRF_DIAGRAMTYPE_DISPLAYNAME = 'DISPLAYNAME';
  PRF_DIAGRAMTYPE_BASEDIAGRAM = 'BASEDIAGRAM';
  PRF_DIAGRAMTYPE_ICON = 'ICON';
  PRF_DIAGRAMTYPE_AVAILABLEPALETTELIST = 'AVAILABLEPALETTELIST';
  PRF_DIAGRAMTYPE_AVAILABLEPALETTE = 'AVAILABLEPALETTE';

  PRF_ELEMENTPROTOTYPELIST = 'ELEMENTPROTOTYPELIST';
  PRF_ELEMENTPROTOTYPE = 'ELEMENTPROTOTYPE';
  PRF_ELEMENTPROTOTYPE_NAME = 'NAME';
  PRF_ELEMENTPROTOTYPE_DISPLAYNAME = 'DISPLAYNAME';
  PRF_ELEMENTPROTOTYPE_ICON = 'ICON';
  PRF_ELEMENTPROTOTYPE_DRAGTYPE = 'DRAGTYPE';
  PRF_ELEMENTPROTOTYPE_BASEELEMENT = 'BASEELEMENT';
  PRF_ELEMENTPROTOTYPE_STEREOTYPENAME = 'STEREOTYPENAME';
  PRF_ELEMENTPROTOTYPE_STEREOTYPEDISPLAY = 'STEREOTYPEDISPLAY';
  PRF_ELEMENTPROTOTYPE_SHOWEXTENDEDNOTATION = 'SHOWEXTENDEDNOTATION';
  PRF_ELEMENTPROTOTYPE_MODELPROPERTYLIST = 'MODELPROPERTYLIST';
  PRF_ELEMENTPROTOTYPE_MODELPROPERTY = 'MODELPROPERTY';
  PRF_ELEMENTPROTOTYPE_VIEWPROPERTYLIST = 'VIEWPROPERTYLIST';
  PRF_ELEMENTPROTOTYPE_VIEWPROPERTY = 'VIEWPROPERTY';
  PRF_ELEMENTPROTOTYPE_PROPERTYNAME = 'NAME';
  PRF_ELEMENTPROTOTYPE_PROPERTYVALUE = 'VALUE';
  PRF_ELEMENTPROTOTYPE_TAGGEDVALUELIST = 'TAGGEDVALUELIST';
  PRF_ELEMENTPROTOTYPE_TAGGEDVALUE = 'TAGGEDVALUE';

  PRF_MODELPROTOTYPELIST = 'MODELPROTOTYPELIST';
  PRF_MODELPROTOTYPE = 'MODELPROTOTYPE';
  PRF_MODELPROTOTYPE_NAME = 'NAME';
  PRF_MODELPROTOTYPE_DISPLAYNAME = 'DISPLAYNAME';
  PRF_MODELPROTOTYPE_ICON = 'ICON';
  PRF_MODELPROTOTYPE_BASEMODEL = 'BASEMODEL';
  PRF_MODELPROTOTYPE_STEREOTYPENAME = 'STEREOTYPENAME';
  PRF_MODELPROTOTYPE_PROPERTYLIST = 'PROPERTYLIST';
  PRF_MODELPROTOTYPE_PROPERTY = 'PROPERTY';
  PRF_MODELPROTOTYPE_PROPERTYNAME = 'NAME';
  PRF_MODELPROTOTYPE_PROPERTYVALUE = 'VALUE';
  PRF_MODELPROTOTYPE_TAGGEDVALUELIST = 'TAGGEDVALUELIST';
  PRF_MODELPROTOTYPE_TAGGEDVALUE = 'TAGGEDVALUE';
  PRF_MODELPROTOTYPE_CONTAINERMODELLIST = 'CONTAINERMODELLIST';
  PRF_MODELPROTOTYPE_CONTAINERMODEL = 'CONTAINERMODEL';

  PRF_PALETTELIST = 'PALETTELIST';
  PRF_PALETTE = 'PALETTE';
  PRF_PALETTE_NAME = 'NAME';
  PRF_PALETTE_DISPLAYNAME = 'DISPLAYNAME';
  PRF_PALETTE_PALETTEITEMLIST = 'PALETTEITEMLIST';
  PRF_PALETTE_PALETTEITEM = 'PALETTEITEM';

  PRF_ATTR_LOCK = 'lock';
  PRF_ATTR_ICON_MINWIDTH = 'minWidth';
  PRF_ATTR_ICON_MINHEIGHT = 'minHeight';
  PRF_ATTR_TYPE = 'type';
  PRF_ATTR_STEREOTYPE = 'stereotype';
  PRF_ATTR_PROFILE = 'profile';
  PRF_ATTR_TAGDEFINITIONSET = 'tagDefintionSet';
  PRF_ATTR_TAGDEFINITION = 'tagDefinition';
  PRF_ATTR_NAME = 'name';
  PRF_ATTR_ARGUMENT = 'argument';

  // must be remove
  PRF_ATTR_COMOBJECTNAME = 'COMObjectName';
  PRF_ATTR_ACTIONID = 'ActionID';

  DEFAULT_ICON_MINWIDTH = 24;
  DEFAULT_ICON_MINHEIGHT = 24;

  EMF_FILE = '.emf';
  WMF_FILE = '.wmf';
  BMP_FILE = '.bmp';

////////////////////////////////////////////////////////////////////////////////
// PExtensibleModel

constructor PExtensibleModel.Create;
begin
  inherited;
  FStereotypeProfile := '';
  FStereotypeName := '';
  FConstraints := POrderedSet.Create;
  FTaggedValues := POrderedSet.Create;
  FReferencingTags := POrderedSet.Create;
end;

destructor PExtensibleModel.Destroy;
begin
  FConstraints.Free;
  FConstraints := nil;
  FTaggedValues.Free;
  FTaggedValues := nil;
  FReferencingTags.Free;
  FReferencingTags := nil;
  inherited;
end;

procedure PExtensibleModel.SetStereotypeProfile(Value: string);
begin
  if FStereotypeProfile <> Value then
    FStereotypeProfile := Value;
end;

procedure PExtensibleModel.SetStereotypeName(Value: string);
begin
  if FStereotypeName <> Value then
    FStereotypeName := Value;
end;

function PExtensibleModel.GetConstraint(Index: Integer): PConstraint;
begin
  Result := FConstraints.Items[Index] as PConstraint;
end;

function PExtensibleModel.GetConstraintCount:Integer;
begin
  Result := FConstraints.Count;
end;

function PExtensibleModel.GetTaggedValue(Index: Integer): PTaggedValue;
begin
  Result := FTaggedValues.Items[Index] as PTaggedValue;
end;

function PExtensibleModel.GetTaggedValueCount:Integer;
begin
  Result := FTaggedValues.Count;
end;

function PExtensibleModel.GetReferencingTag(Index: Integer): PTaggedValue;
begin
  Result := FReferencingTags.Items[Index] as PTaggedValue;
end;

function PExtensibleModel.GetReferencingTagCount: Integer;
begin
  Result := FReferencingTags.Count;
end;

procedure PExtensibleModel.Accept(Visitor: PVisitor);
var
  I: Integer;
begin
  inherited;
  for I := 0 to ConstraintCount - 1 do
    Constraints[I].Accept(Visitor);
  for I := 0 to TaggedValueCount - 1 do
    TaggedValues[I].Accept(Visitor);
end;

function PExtensibleModel.GetStereotype: PStereotype;
var
  P: PProfile;
begin
  Result := nil;
  P := ExtensionManager.FindIncludedProfile(FStereotypeProfile);
  if P <> nil then begin
    if MetaClass = nil then
      Result := P.FindStereotype(FStereotypeName, '')
    else
      Result := P.FindStereotype(FStereotypeName, MetaClass.Name);
  end;
end;

procedure PExtensibleModel.SetStereotype(Name: string);
var
  S: PStereotype;
begin
  S := nil;
  if MetaClass <> nil then
    S := ExtensionManager.FindFirstStereotype(Name, MetaClass.Name);
  if S = nil then begin
    FStereotypeProfile := '';
    FStereotypeName := Name;
  end
  else begin
    FStereotypeProfile := S.Profile.Name;
    FStereotypeName := S.Name;
  end;
end;

procedure PExtensibleModel.SetStereotype(Profile: string; Name: string);
var
  S: PStereotype;
begin
  S := nil;
  if MetaClass <> nil then
    S := ExtensionManager.FindStereotype(Profile, Name, MetaClass.Name);
  if S = nil then begin
    FStereotypeProfile := '';
    FStereotypeName := Name;
  end
  else begin
    FStereotypeProfile := S.Profile.Name;
    FStereotypeName := S.Name;
  end;
end;

procedure PExtensibleModel.ClearConstraints;
var
  I: Integer;
begin
  for I := FConstraints.Count - 1 downto 0 do
    DeleteConstraint(I);
end;

procedure PExtensibleModel.AddConstraint(AConstraint: PConstraint);
begin
  if (AConstraint <> nil) and (not FConstraints.Contains(AConstraint)) then begin
    if AConstraint.FConstrainedModel <> nil then
      AConstraint.FConstrainedModel.FConstraints.Remove(AConstraint);
    FConstraints.Add(AConstraint);
    AConstraint.FConstrainedModel := Self;
  end;
end;

procedure PExtensibleModel.RemoveConstraint(AConstraint: PConstraint);
begin
  if AConstraint <> nil then begin
    FConstraints.Remove(AConstraint);
    AConstraint.FConstrainedModel := nil;
  end;
end;

procedure PExtensibleModel.InsertConstraint(Index: Integer; AConstraint: PConstraint);
begin
  if (AConstraint <> nil) and (not FConstraints.Contains(AConstraint)) then begin
    if AConstraint.FConstrainedModel <> nil then
      AConstraint.FConstrainedModel.FConstraints.Remove(AConstraint);
    FConstraints.Insert(Index, AConstraint);
    AConstraint.FConstrainedModel := Self;
  end;
end;

procedure PExtensibleModel.DeleteConstraint(Index: Integer);
begin
  RemoveConstraint(FConstraints.Items[Index] as PConstraint);
end;

function PExtensibleModel.IndexOfConstraint(AConstraint: PConstraint): Integer;
begin
  Result := FConstraints.IndexOf(AConstraint);
end;

function PExtensibleModel.GetConstraintByGuid(AGuid: string): PConstraint;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ConstraintCount - 1 do
    if Constraints[I].GUID = AGuid then
    begin
      Result := Constraints[I];
      Exit;
    end;
end;

procedure PExtensibleModel.ClearTaggedValues;
var
  I: Integer;
begin
  for I := FTaggedValues.Count - 1 downto 0 do
    DeleteTaggedValue(I);
end;

procedure PExtensibleModel.AddTaggedValue(ATaggedValue: PTaggedValue);
begin
  if (ATaggedValue <> nil) and (not FTaggedValues.Contains(ATaggedValue)) then begin
    if ATaggedValue.FTaggedModel <> nil then
      ATaggedValue.FTaggedModel.FTaggedValues.Remove(ATaggedValue);
    FTaggedValues.Add(ATaggedValue);
    ATaggedValue.FTaggedModel := Self;
  end;
end;

procedure PExtensibleModel.RemoveTaggedValue(ATaggedValue: PTaggedValue);
begin
  if ATaggedValue <> nil then begin
    FTaggedValues.Remove(ATaggedValue);
    ATaggedValue.FTaggedModel := nil;
  end;
end;

procedure PExtensibleModel.InsertTaggedValue(Index: Integer; ATaggedValue: PTaggedValue);
begin
  if (ATaggedValue <> nil) and (not FTaggedValues.Contains(ATaggedValue)) then begin
    if ATaggedValue.FTaggedModel <> nil then
      ATaggedValue.FTaggedModel.FTaggedValues.Remove(ATaggedValue);
    FTaggedValues.Insert(Index, ATaggedValue);
    ATaggedValue.FTaggedModel := Self;
  end;
end;

procedure PExtensibleModel.DeleteTaggedValue(Index: Integer);
begin
  RemoveTaggedValue(FTaggedValues.Items[Index] as PTaggedValue);
end;

function PExtensibleModel.IndexOfTaggedValue(ATaggedValue: PTaggedValue): Integer;
begin
  Result := FTaggedValues.IndexOf(ATaggedValue);
end;

procedure PExtensibleModel.ClearReferencingTags;
var
  I: Integer;
begin
  for I := FReferencingTags.Count - 1 downto 0 do
    DeleteReferencingTag(I);
end;

procedure PExtensibleModel.AddReferencingTag(ATaggedValue: PTaggedValue);
begin
  if ATaggedValue <> nil then begin
    FReferencingTags.Add(ATaggedValue);
    ATaggedValue.FReferenceValues.Add(Self);
  end;
end;

procedure PExtensibleModel.RemoveReferencingTag(ATaggedValue: PTaggedValue);
begin
  if ATaggedValue <> nil then begin
    FReferencingTags.Remove(ATaggedValue);
    ATaggedValue.FReferenceValues.Remove(Self);
  end;
end;

procedure PExtensibleModel.InsertReferencingTag(Index: Integer; ATaggedValue: PTaggedValue);
begin
  if ATaggedValue <> nil then begin
    FReferencingTags.Insert(Index, ATaggedValue);
    ATaggedValue.FReferenceValues.Add(Self);
  end;
end;

procedure PExtensibleModel.DeleteReferencingTag(Index: Integer);
begin
  RemoveReferencingTag(FReferencingTags.Items[Index] as PTaggedValue);
end;

function PExtensibleModel.IndexOfReferencingTag(ATaggedValue: PTaggedValue): Integer;
begin
  Result := FReferencingTags.IndexOf(ATaggedValue);
end;

function PExtensibleModel.FindTaggedValue(Profile: string; TagDefinitionSet: string; Name: string): PTaggedValue;
var
  I: Integer;
  T: PTaggedValue;
begin
  Result := nil;
  for I := 0 to TaggedValueCount - 1 do begin
    T := TaggedValues[I];
    if (T.ProfileName = Profile) and (T.TagDefinitionSetName = TagDefinitionSet) and (T.Name = Name) then begin
      Result := T;
      Exit;
    end;
  end;
end;

function PExtensibleModel.QueryDataTaggedValue(Profile: string; TagDefinitionSet: string; Name: string): string;
var
  T: PTaggedValue;
  TD: PTagDefinition;
begin
  T := FindTaggedValue(Profile, TagDefinitionSet, Name);
  if T <> nil then
    Result := T.DataValue
  else begin
    TD := ExtensionManager.FindTagDefinition(Profile, TagDefinitionSet, Name);
    if TD = nil then
      raise ETagDefinitionNotFound.Create('TagDefinition "' + Name + '" is not found in Profile "' + Profile + '".');
    Result := TD.DefaultValue;
  end;
end;

function PExtensibleModel.QueryReferenceTaggedValue(Profile: string; TagDefinitionSet: string; Name: string): PExtensibleModel;
var
  T: PTaggedValue;
  TD: PTagDefinition;
begin
  T := FindTaggedValue(Profile, TagDefinitionSet, Name);
  if T <> nil then
  begin
    TD := T.GetTagDefinition;
    if (TD <> nil) and (TD.TagType = tkReference) then
    begin
      if T.ReferenceValueCount > 0 then
        Result := T.ReferenceValues[0]
      else
        Result := nil;
    end
    else begin
      raise EInvalidTaggedValueType.Create('TaggedValue "' + Name + '" does not have Reference type.');
    end;
  end
  else begin
    TD := ExtensionManager.FindTagDefinition(Profile, TagDefinitionSet, Name);
    if TD = nil then
      raise ETagDefinitionNotFound.Create('TagDefinition "' + Name + '" is not found in Profile "' + Profile + '".');
    Result := nil;
  end;
end;

function PExtensibleModel.IsApplicableTagDefinition(Profile: string; TagDefinitionSet: string; Name: string): Boolean;
var
  T: PTagDefinition;
begin
  T := ExtensionManager.FindTagDefinition(Profile, TagDefinitionSet, Name);
  if T <> nil then
    Result := T.TagDefinitionSet.CanApplyTo(MetaClass.Name)
  else
    Result := False;
end;

function PExtensibleModel.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'StereotypeProfile' then begin
    Result := StereotypeProfile;
  end
  else if Name = 'StereotypeName' then begin
    Result := StereotypeName;
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PExtensibleModel.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'StereotypeProfile' then begin
    StereotypeProfile := Value;
  end
  else if Name = 'StereotypeName' then begin
    StereotypeName := Value;
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

procedure PExtensibleModel.MOF_AddCollectionItem(Name: string; Value: PElement);
begin
  if Name = 'Constraints' then begin
    AddConstraint(Value as PConstraint);
  end
  else if Name = 'TaggedValues' then begin
    AddTaggedValue(Value as PTaggedValue);
  end
  else if Name = 'ReferencingTags' then begin
    AddReferencingTag(Value as PTaggedValue);
  end
  else begin
    inherited MOF_AddCollectionItem(Name, Value);
  end;
end;

procedure PExtensibleModel.MOF_RemoveCollectionItem(Name: string; Value: PElement);
begin
  if Name = 'Constraints' then begin
    RemoveConstraint(Value as PConstraint);
  end
  else if Name = 'TaggedValues' then begin
    RemoveTaggedValue(Value as PTaggedValue);
  end
  else if Name = 'ReferencingTags' then begin
    RemoveReferencingTag(Value as PTaggedValue);
  end
  else begin
    inherited MOF_RemoveCollectionItem(Name, Value);
  end;
end;

procedure PExtensibleModel.MOF_InsertCollectionItem(Name: string; Index: Integer; Value: PElement);
begin
  if Name = 'Constraints' then begin
    InsertConstraint(Index, Value as PConstraint);
  end
  else if Name = 'TaggedValues' then begin
    InsertTaggedValue(Index, Value as PTaggedValue);
  end
  else if Name = 'ReferencingTags' then begin
    InsertReferencingTag(Index, Value as PTaggedValue);
  end
  else begin
    inherited MOF_InsertCollectionItem(Name, Index, Value);
  end;
end;

procedure PExtensibleModel.MOF_DeleteCollectionItem(Name: string; Index: Integer);
begin
  if Name = 'Constraints' then begin
    DeleteConstraint(Index);
  end
  else if Name = 'TaggedValues' then begin
    DeleteTaggedValue(Index);
  end
  else if Name = 'ReferencingTags' then begin
    DeleteReferencingTag(Index);
  end
  else begin
    inherited MOF_DeleteCollectionItem(Name, Index);
  end;
end;

procedure PExtensibleModel.MOF_ClearCollection(Name: string);
begin
  if Name = 'Constraints' then begin
    ClearConstraints;
  end
  else if Name = 'TaggedValues' then begin
    ClearTaggedValues;
  end
  else if Name = 'ReferencingTags' then begin
    ClearReferencingTags;
  end
  else begin
    inherited MOF_ClearCollection(Name);
  end;
end;

function PExtensibleModel.MOF_IndexOfCollectionItem(Name: string; Value: PElement): Integer;
begin
  if Name = 'Constraints' then begin
    Result := IndexOfConstraint(Value as PConstraint);
  end
  else if Name = 'TaggedValues' then begin
    Result := IndexOfTaggedValue(Value as PTaggedValue);
  end
  else if Name = 'ReferencingTags' then begin
    Result := IndexOfReferencingTag(Value as PTaggedValue);
  end
  else begin
    Result := inherited MOF_IndexOfCollectionItem(Name, Value);
  end;
end;

function PExtensibleModel.MOF_GetCollectionItem(Name: string; Index: Integer): PElement;
begin
  if Name = 'Constraints' then begin
    Result := Constraints[Index];
  end
  else if Name = 'TaggedValues' then begin
    Result := TaggedValues[Index];
  end
  else if Name = 'ReferencingTags' then begin
    Result := ReferencingTags[Index];
  end
  else begin
    Result := inherited MOF_GetCollectionItem(Name, Index);
  end;
end;

function PExtensibleModel.MOF_GetCollectionCount(Name: string): Integer;
begin
  if Name = 'Constraints' then begin
    Result := ConstraintCount;
  end
  else if Name = 'TaggedValues' then begin
    Result := TaggedValueCount;
  end
  else if Name = 'ReferencingTags' then begin
    Result := ReferencingTagCount;
  end
  else begin
    Result := inherited MOF_GetCollectionCount(Name);
  end;
end;

// PExtensibleModel
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PConstraint

constructor PConstraint.Create;
begin
  inherited;
  FName := '';
  FBody := '';
  FConstrainedModel := nil;
end;

procedure PConstraint.SetName(Value: string);
begin
  if FName <> Value then
  begin
    FName := Value;
  end;
end;

procedure PConstraint.SetBody(Value: string);
begin
  if FBody <> Value then
  begin
    FBody := Value;
  end;
end;

procedure PConstraint.SetConstrainedModel(Value: PExtensibleModel);
begin
  if FConstrainedModel <> Value then begin
    if FConstrainedModel <> nil then FConstrainedModel.RemoveConstraint(Self);
    FConstrainedModel := Value;
    if FConstrainedModel <> nil then FConstrainedModel.AddConstraint(Self);
  end;
end;

function PConstraint.GetContainingDocument: PDocument;
begin
  if FConstrainedModel = nil then
    Result := nil
  else
    Result := FConstrainedModel.GetContainingDocument;
end;

function PConstraint.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'Name' then begin
    Result := Self.Name;
  end
  else if Name = 'Body' then begin
    Result := Body;
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PConstraint.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'Name' then begin
    Self.Name := Value;
  end
  else if Name = 'Body' then begin
    Body := Value;
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PConstraint.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'ConstrainedModel' then begin
    Result := ConstrainedModel;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PConstraint.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'ConstrainedModel' then begin
    ConstrainedModel := Value as PExtensibleModel;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PConstraint
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PTaggedValue

constructor PTaggedValue.Create;
begin
  inherited;
  FProfileName := '';
  FName := '';
  FDataValue := '';
  FTaggedModel := nil;
  FReferenceValues := POrderedSet.Create;
end;

destructor PTaggedValue.Destroy;
begin
  ClearReferenceValues;
  FReferenceValues.Free;
  FReferenceValues := nil;
  inherited;
end;

procedure PTaggedValue.SetProfileName(Value: string);
begin
  if FProfileName <> Value then begin
    FProfileName := Value;
  end;
end;

procedure PTaggedValue.SetTagDefinitionSetName(Value: string);
begin
  if FTagDefinitionSetName <> Value then begin
    FTagDefinitionSetName := Value;
  end;
end;

procedure PTaggedValue.SetName(Value: string);
begin
  if FName <> Value then begin
    FName := Value;
  end;
end;

procedure PTaggedValue.SetTaggedModel(Value: PExtensibleModel);
begin
  if FTaggedModel <> Value then begin
    if FTaggedModel <> nil then FTaggedModel.RemoveTaggedValue(Self);
    FTaggedModel := Value;
    if FTaggedModel <> nil then FTaggedModel.AddTaggedValue(Self);
  end;
end;

function PTaggedValue.GetDataValue: string;
begin
  Result := FDataValue;
end;

procedure PTaggedValue.SetDataValue(Value: string);
begin
  if FDataValue <> Value then begin
    FDataValue := Value;
  end;
end;

function PTaggedValue.GetReferenceValueCount: Integer;
begin
  Result := FReferenceValues.Count;
end;

function PTaggedValue.GetReferenceValue(Index: Integer): PExtensibleModel;
begin
  Result := FReferenceValues.Items[Index] as PExtensibleModel;
end;

function PTaggedValue.GetTagDefinition: PTagDefinition;
begin
  Result := ExtensionManager.FindTagDefinition(FProfileName, FTagDefinitionSetName, FName);
end;

function PTaggedValue.GetTagDefinitionSet: PTagDefinitionSet;
begin
  Result := ExtensionManager.FindTagDefinitionSet(FProfileName, FTagDefinitionSetName);
end;

function PTaggedValue.GetProfile: PProfile;
begin
  Result := ExtensionManager.FindIncludedProfile(FProfileName);
end;

function PTaggedValue.GetContainingDocument: PDocument;
begin
  if FTaggedModel = nil then
    Result := nil
  else
    Result := FTaggedModel.GetContainingDocument;
end;

procedure PTaggedValue.ClearReferenceValues;
var
  I: Integer;
begin
  for I := FReferenceValues.Count - 1 downto 0 do
    DeleteReferenceValue(I);
end;

procedure PTaggedValue.AddReferenceValue(Value: PExtensibleModel);
begin
  if Value <> nil then begin
    FReferenceValues.Add(Value);
    Value.FReferencingTags.Add(Self);
  end;
end;

procedure PTaggedValue.RemoveReferenceValue(Value: PExtensibleModel);
begin
  if Value <> nil then begin
    FReferenceValues.Remove(Value);
    Value.FReferencingTags.Remove(Self);
  end;
end;

procedure PTaggedValue.InsertReferenceValue(Index: Integer; Value: PExtensibleModel);
begin
  if Value <> nil then begin
    FReferenceValues.Insert(Index, Value);
    Value.FReferencingTags.Add(Self);
  end;
end;

procedure PTaggedValue.DeleteReferenceValue(Index: Integer);
begin
  RemoveReferenceValue(FReferenceValues.Items[Index] as PExtensibleModel);
end;

function PTaggedValue.IndexOfReferenceValue(Value: PExtensibleModel): Integer;
begin
  Result := FReferenceValues.IndexOf(Value);
end;

function PTaggedValue.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'ProfileName' then begin
    Result := ProfileName;
  end
  else if Name = 'TagDefinitionSetName' then begin
    Result := TagDefinitionSetName;
  end
  else if Name = 'Name' then begin
    Result := Self.Name;
  end
  else if Name = 'DataValue' then begin
    Result := DataValue;
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PTaggedValue.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'ProfileName' then begin
    ProfileName := Value;
  end
  else if Name = 'TagDefinitionSetName' then begin
    TagDefinitionSetName := Value;
  end
  else if Name = 'Name' then begin
    Self.Name := Value;
  end
  else if Name = 'DataValue' then begin
    DataValue := Value;
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PTaggedValue.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'TaggedModel' then begin
    Result := TaggedModel;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PTaggedValue.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'TaggedModel' then begin
    TaggedModel := Value as PExtensibleModel;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

procedure PTaggedValue.MOF_AddCollectionItem(Name: string; Value: PElement);
begin
  if Name = 'ReferenceValues' then begin
    AddReferenceValue(Value as PExtensibleModel);
  end
  else begin
    inherited MOF_AddCollectionItem(Name, Value);
  end;
end;

procedure PTaggedValue.MOF_RemoveCollectionItem(Name: string; Value: PElement);
begin
  if Name = 'ReferenceValues' then begin
    RemoveReferenceValue(Value as PExtensibleModel);
  end
  else begin
    inherited MOF_RemoveCollectionItem(Name, Value);
  end;
end;

procedure PTaggedValue.MOF_InsertCollectionItem(Name: string; Index: Integer; Value: PElement);
begin
  if Name = 'ReferenceValues' then begin
    InsertReferenceValue(Index, Value as PExtensibleModel);
  end
  else begin
    inherited MOF_InsertCollectionItem(Name, Index, Value);
  end;
end;

procedure PTaggedValue.MOF_DeleteCollectionItem(Name: string; Index: Integer);
begin
  if Name = 'ReferenceValues' then begin
    DeleteReferenceValue(Index);
  end
  else begin
    inherited MOF_DeleteCollectionItem(Name, Index);
  end;
end;

procedure PTaggedValue.MOF_ClearCollection(Name: string);
begin
  if Name = 'ReferenceValues' then begin
    ClearReferenceValues;
  end
  else begin
    inherited MOF_ClearCollection(Name);
  end;
end;

function PTaggedValue.MOF_IndexOfCollectionItem(Name: string; Value: PElement): Integer;
begin
  if Name = 'ReferenceValues' then begin
    Result := IndexOfReferenceValue(Value as PExtensibleModel);
  end
  else begin
    Result := inherited MOF_IndexOfCollectionItem(Name, Value);
  end;
end;

function PTaggedValue.MOF_GetCollectionItem(Name: string; Index: Integer): PElement;
begin
  if Name = 'ReferenceValues' then begin
    Result := ReferenceValues[Index];
  end
  else begin
    Result := inherited MOF_GetCollectionItem(Name, Index);
  end;
end;

function PTaggedValue.MOF_GetCollectionCount(Name: string): Integer;
begin
  if Name = 'ReferenceValues' then begin
    Result := ReferenceValueCount;
  end
  else begin
    Result := inherited MOF_GetCollectionCount(Name);
  end;
end;

// PTaggedValue
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PTagDefinition

constructor PTagDefinition.Create;
begin
  inherited;
  FLiterals := TStringList.Create;
  FTagDefinitionSet := nil;
  FReferenceType := '';
  FLock := False;
  FDefaultValue := '';
end;

destructor PTagDefinition.Destroy;
begin
  FLiterals.Free;
  inherited;
end;

function PTagDefinition.GetReferenceType: string;
begin
  Result := FReferenceType;
end;

function PTagDefinition.GetLiteral(Index: Integer): string;
begin
  Result := FLiterals.Strings[Index];
end;

function PTagDefinition.GetLiteralCount: Integer;
begin
  Result := FLiterals.Count;
end;

function PTagDefinition.IndexOfLiteral(ALiteral: string): Integer;
begin
  Result := FLiterals.IndexOf(ALiteral);
end;

// PTagDefinition
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PTagDefinitionSet

{ TCollectionEnumerator }

constructor PTagDefinitionSet.TTagDefinitionSetEnumerator.Create(ATagDefinitionSet: PTagDefinitionSet);
begin
  inherited Create;
  FIndex := -1;
  FTagDefinitionSet := ATagDefinitionSet;
end;

function PTagDefinitionSet.TTagDefinitionSetEnumerator.GetCurrent: PTagDefinition;
begin
  Result := FTagDefinitionSet.TagDefinitions[FIndex];
end;

function PTagDefinitionSet.TTagDefinitionSetEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTagDefinitionSet.TagDefinitionCount - 1;
  if Result then
    Inc(FIndex);
end;


function PTagDefinitionSet.GetEnumerator: TTagDefinitionSetEnumerator;
begin
  Result := TTagDefinitionSetEnumerator.Create(self);
end;



constructor PTagDefinitionSet.Create;
begin
  inherited;
  FBaseClasses := TStringList.Create;
  FTagDefinitions := POrderedSet.Create;
  FProfile := nil;
  FStereotype := nil;
end;

destructor PTagDefinitionSet.Destroy;
var
  I: Integer;
begin
  FBaseClasses.Free;
  FBaseClasses := nil;
  for I := FTagDefinitions.Count - 1 downto 0 do
    (FTagDefinitions.Items[I] as PTagDefinition).Free;
  FTagDefinitions.Free;
  FTagDefinitions := nil;
  inherited;
end;

function PTagDefinitionSet.GetBaseClassCount: Integer;
begin
  Result := FBaseClasses.Count;
end;

function PTagDefinitionSet.GetBaseClass(Index: Integer): string;
begin
  Result := FBaseClasses.Strings[Index];
end;

function PTagDefinitionSet.GetTagDefinitionCount: Integer;
begin
  Result := FTagDefinitions.Count;
end;

function PTagDefinitionSet.GetTagDefinition(Index: Integer): PTagDefinition;
begin
  Result := FTagDefinitions.Items[Index] as PTagDefinition;
end;

function PTagDefinitionSet.FindTagDefinition(AName: string): PTagDefinition;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FTagDefinitions.Count - 1 do
    if GetTagDefinition(I).Name = AName then begin
      Result := GetTagDefinition(I);
      Exit;
    end;
end;

function PTagDefinitionSet.CanApplyTo(AClassName: string): Boolean;
var
  MC: PMetaClass;
  I: Integer;
begin
  Result := False;
  MC := MetaModel.FindMetaClass(AClassName);
  if MC = nil then
    raise EMetaClassifierNotExist.Create(MSG_INVALID_CLASS_NAME + ' (' + AClassName + ')');
  for I := 0 to FBaseClasses.Count - 1 do
    if MC.IsKindOf(GetBaseClass(I)) then begin
      Result := True;
      Exit;
    end;
end;

// PTagDefinitionSet
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PStereotype

constructor PStereotype.Create;
begin
  inherited;
  FBaseClasses := TStringList.Create;
  FProfile := nil;
  FParent := nil;
  FChildren := TList.Create;
  FTagDefinitionSet := nil;
  FImageIndex := -1;
  FNotationExpr := nil;
  FIcon := nil;
end;

destructor PStereotype.Destroy;
begin
  FBaseClasses.Free;
  FBaseClasses := nil;
  FChildren.Free;
  FChildren := nil;
  FNotationExpr.Free;
  FNotationExpr := nil;
  if FIcon <> nil then
    FIcon.Free;
  inherited;
end;

function PStereotype.GetBaseClassCount: Integer;
begin
  Result := FBaseClasses.Count;
end;

function PStereotype.GetBaseClass(Index: Integer): string;
begin
  Result := FBaseClasses.Strings[Index];
end;

function PStereotype.GetChildCount: Integer;
begin
  Result := FChildren.Count;
end;

function PStereotype.GetChild(Index: Integer): PStereotype;
begin
  Result := PStereotype(FChildren.Items[Index]);
end;

function PStereotype.GetDerivedTagDefinitionSet: PTagDefinitionSet;
begin
  if FTagDefinitionSet <> nil then
    Result := FTagDefinitionSet
  else if FParent <> nil then
    Result := FParent.DerivedTagDefinitionSet
  else
    Result := nil;
end;

function PStereotype.CanApplyTo(AClassName: string): Boolean;
var
  MC: PMetaClass;
  I: Integer;
begin
  Result := False;
  MC := MetaModel.FindMetaClass(AClassName);
  if MC = nil then
    raise EMetaClassifierNotExist.Create(MSG_INVALID_CLASS_NAME + ' (' + AClassName + ')');
  for I := 0 to FBaseClasses.Count - 1 do
    if MC.IsKindOf(GetBaseClass(I)) then begin
      Result := True;
      Exit;
    end;
end;

function PStereotype.GetNotationExpr: PNXExpr;
begin
  if FNotationExpr <> nil then
    Result := FNotationExpr
  else if FParent <> nil then
    Result := FParent.NotationExpr
  else
    Result := nil;
end;

procedure PStereotype.LoadIconFile;
var
  Ext: string;
begin
  if (FIconFile <> '') and FileExists(FIconFile) then begin
    Ext := LowerCase(ExtractFileExt(FIconFile));
    if (Ext = WMF_FILE) or (Ext = EMF_FILE) then begin
      FIcon := TMetaFile.Create;
      try
        FIcon.LoadFromFile(FIconFile);
      except
        FIcon.Free;
        FIcon := nil;
      end;
    end
    else if (Ext = BMP_FILE) then begin
      FIcon := Graphics.TBitmap.Create;
      try
        FIcon.LoadFromFile(FIconFile);
      except
        FIcon.Free;
        FIcon := nil;
      end;
    end;
  end;
end;


// PStereotype
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PDataType

constructor PDataType.Create;
begin
  inherited;
  FProfile := nil;
end;

// PDataType
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PElementPrototype

constructor PElementPrototype.Create;
begin
  inherited;
  FModelProperties := TStringList.Create;
  FViewProperties := TStringList.Create;
  FTaggedValues := TStringList.Create;
  FImageIndex := -1;
  FProfile := nil;
end;

destructor PElementPrototype.Destroy;
begin
  FModelProperties.Free;
  FModelProperties := nil;
  FViewProperties.Free;
  FViewProperties := nil;
  FTaggedValues.Free;
  FTaggedValues := nil;
  FProfile := nil;
  inherited;
end;

function PElementPrototype.GetModelPropertyCount: Integer;
begin
  Result := FModelProperties.Count;
end;

function PElementPrototype.GetModelPropertyName(Index: Integer): string;
begin
  Result := FModelProperties.Names[Index];
end;

function PElementPrototype.GetModelPropertyValue(Index: Integer): string;
begin
  Result := FModelProperties.Values[GetModelPropertyName(Index)];
end;

function PElementPrototype.GetViewPropertyCount: Integer;
begin
  Result := FViewProperties.Count;
end;

function PElementPrototype.GetViewPropertyName(Index: Integer): string;
begin
  Result := FViewProperties.Names[Index];
end;

function PElementPrototype.GetViewPropertyValue(Index: Integer): string;
begin
  Result := FViewProperties.Values[GetViewPropertyName(Index)];
end;

function PElementPrototype.GetTaggedValueCount: Integer;
begin
  Result := FTaggedValues.Count;
end;

function PElementPrototype.GetTaggedValue(Profile: string; TagDefinitionSet: string; TagDefinition: string): string;
begin
  Result := FTaggedValues.Values[Format('%s,%s,%s', [Profile, TagDefinitionSet, TagDefinition])];
end;

procedure PElementPrototype.AddModelProperty(Name: string; Value: string);
begin
  FModelProperties.Add(Name + '=' + Value);
end;

procedure PElementPrototype.AddViewProperty(Name: string; Value: string);
begin
  FViewProperties.Add(Name + '=' + Value);
end;

procedure PElementPrototype.AddTaggedValue(Profile: string; TagDefinitionSet: string; TagDefinition: string; Value: string);
begin
  FTaggedValues.Add(Format('%s,%s,%s=%s', [Profile, TagDefinitionSet, TagDefinition, Value]))
end;

// PPaletteElement
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PModelPrototype

constructor PModelPrototype.Create;
begin
  inherited;
  FProperties := TStringList.Create;
  FTaggedValues := TStringList.Create;
  FContainerModels := TStringList.Create;
  FContainerModelStereotypes := TStringList.Create;
  FImageIndex := -1;
  FProfile := nil;
end;

destructor PModelPrototype.Destroy;
begin
  FProperties.Free;
  FProperties := nil;
  FTaggedValues.Free;
  FTaggedValues := nil;
  FContainerModels.Free;
  FContainerModels := nil;
  FContainerModelStereotypes.Free;
  FContainerModelStereotypes := nil;
  FProfile := nil;
  inherited;
end;

function PModelPrototype.GetPropertyCount: Integer;
begin
  Result := FProperties.Count;
end;

function PModelPrototype.GetPropertyName(Index: Integer): string;
begin
  Result := FProperties.Names[Index];
end;

function PModelPrototype.GetPropertyValue(Index: Integer): string;
begin
  Result := FProperties.Values[GetPropertyName(Index)];
end;

function PModelPrototype.GetTaggedValueCount: Integer;
begin
  Result := FTaggedValues.Count;
end;

function PModelPrototype.GetTaggedValue(Profile: string; TagDefinitionSet: string; TagDefinition: string): string;
begin
  Result := FTaggedValues.Values[Format('%s,%s,%s', [Profile, TagDefinitionSet, TagDefinition])];
end;

function PModelPrototype.GetContainerModelCount: Integer;
begin
  Result := FContainerModels.Count;
end;

function PModelPrototype.GetContainerModel(Index: Integer): string;
begin
  Result := FContainerModels[Index];
end;

function PModelPrototype.GetContainerModelStereotype(Index: Integer): string;
begin
  Result := FContainerModelStereotypes[Index];
end;

procedure PModelPrototype.AddProperty(Name: string; Value: string);
begin
  FProperties.Add(Name + '=' + Value);
end;

procedure PModelPrototype.AddTaggedValue(Profile: string; TagDefinitionSet: string; TagDefinition: string; Value: string);
begin
  FTaggedValues.Add(Format('%s,%s,%s=%s', [Profile, TagDefinitionSet, TagDefinition, Value]))
end;

procedure PModelPrototype.AddContainerModel(ModelKind: string; StereotypeName: string);
begin
  FContainerModels.Add(ModelKind);
  FContainerModelStereotypes.Add(StereotypeName);
end;

// PModelPrototype
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PPalette

constructor PPalette.Create;
begin
  inherited;
  FPaletteItems := TStringList.Create;
  FProfile := nil;
end;

destructor PPalette.Destroy;
begin
  FPaletteItems.Free;
  FPaletteItems := nil;
  FProfile := nil;
  inherited;
end;

function PPalette.GetPaletteItemCount: Integer;
begin
  Result := FPaletteItems.Count;
end;

function PPalette.GetPaletteItem(Index: Integer): string;
begin
  Result := FPaletteItems[Index];
end;

procedure PPalette.AddPaletteItem(Value: string);
begin
  FPaletteItems.Add(Value);
end;

// PPalette
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PDiagramType

constructor PDiagramType.Create;
begin
  inherited;
  FAvailablePalettes := TStringList.Create;
  FProfile := nil;
  FImageIndex := -1;
end;

destructor PDiagramType.Destroy;
begin
  FAvailablePalettes.Free;
  FAvailablePalettes := nil;
  FProfile := nil;
  inherited;
end;

function PDiagramType.GetAvailablePaletteCount: Integer;
begin
  Result := FAvailablePalettes.Count;
end;

function PDiagramType.GetAvailablePalette(Index: Integer): string;
begin
  Result := FAvailablePalettes[Index];
end;

// PDiagramType
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PPRofile

constructor PProfile.Create;
begin
  inherited;
  FStereotypes := POrderedSet.Create;
  FTagDefinitionSets := POrderedSet.Create;
  FDataTypes := POrderedSet.Create;
  FElementPrototypes := POrderedSet.Create;
  FModelPrototypes := POrderedSet.Create;
  FDiagramTypes := POrderedSet.Create;
  FPalettes := POrderedSet.Create;
end;

destructor PProfile.Destroy;
var
  I: Integer;
begin
  for I := FStereotypes.Count - 1 downto 0 do
    GetStereotype(I).Free;
  FStereotypes.Free;
  FStereotypes := nil;
  for I := FTagDefinitionSets.Count - 1 downto 0 do
    GetTagDefinitionSet(I).Free;
  FTagDefinitionSets.Free;
  FTagDefinitionSets := nil;
  for I := FDataTypes.Count - 1 downto 0 do
    GetDataType(I).Free;
  FDataTypes.Free;
  FDataTypes := nil;
  for I := FElementPrototypes.Count - 1 downto 0 do
    GetElementPrototype(I).Free;
  FElementPrototypes.Free;
  FElementPrototypes := nil;
  for I := FModelPrototypes.Count - 1 downto 0 do
    GetModelPrototype(I).Free;
  FModelPrototypes.Free;
  FModelPrototypes := nil;
  for I := FDiagramTypes.Count - 1 downto 0 do
    GetDiagramType(I).Free;
  FDiagramTypes.Free;
  FDiagramTypes := nil;
  for I := FPalettes.Count - 1 downto 0 do
    GetPalette(I).Free;
  FPalettes.Free;
  FPalettes := nil;
  inherited;
end;

function PProfile.GetStereotypeCount: Integer;
begin
  Result := FStereotypes.Count;
end;

function PProfile.GetStereotype(Index: Integer): PStereotype;
begin
  Result := FStereotypes.Items[Index] as PStereotype;
end;

function PProfile.GetTagDefinitionSetCount: Integer;
begin
  Result := FTagDefinitionSets.Count;
end;

function PProfile.GetTagDefinitionSet(Index: Integer): PTagDefinitionSet;
begin
  Result := FTagDefinitionSets.Items[Index] as PTagDefinitionSet;
end;

function PProfile.GetDataTypeCount: Integer;
begin
  Result := FDataTypes.Count;
end;

function PProfile.GetDataType(Index: Integer): PDataType;
begin
  Result := FDataTypes.Items[Index] as PDataType;
end;

function PProfile.GetElementPrototypeCount: Integer;
begin
  Result := FElementPrototypes.Count;
end;

function PProfile.GetElementPrototype(Index: Integer): PElementPrototype;
begin
  Result := FElementPrototypes.Items[Index] as PElementPrototype;
end;

function PProfile.GetModelPrototypeCount: Integer;
begin
  Result := FModelPrototypes.Count;
end;

function PProfile.GetModelPrototype(Index: Integer): PModelPrototype;
begin
  Result := FModelPrototypes.Items[Index] as PModelPrototype;
end;

function PProfile.GetDiagramTypeCount: Integer;
begin
  Result := FDiagramTypes.Count;
end;

function PProfile.GetDiagramType(Index: Integer): PDiagramType;
begin
  Result := FDiagramTypes.Items[Index] as PDiagramType;
end;

function PProfile.GetPaletteCount: Integer;
begin
  Result := FPalettes.Count;
end;

function PProfile.GetPalette(Index: Integer): PPalette;
begin
  Result := FPalettes.Items[Index] as PPalette;
end;

function PProfile.FindTagDefinition(ATagDefinitionSetName, AName: string): PTagDefinition;
var
  TS: PTagDefinitionSet;
begin
  Result := nil;
  TS := FindTagDefinitionSet(ATagDefinitionSetName);
  if TS <> nil then
    Result := TS.FindTagDefinition(AName);
end;

function PProfile.FindTagDefinitionSet(AName: string): PTagDefinitionSet;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FTagDefinitionSets.Count - 1 do
    if GetTagDefinitionSet(I).Name = AName then begin
      Result := GetTagDefinitionSet(I);
      Exit;
    end;
end;

function PProfile.FindStereotype(AName: string; BaseClass: string): PStereotype;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FStereotypes.Count - 1 do
    if (GetStereotype(I).Name = AName) then begin
      if BaseClass = '' then begin
        Result := GetStereotype(I);
        Exit;
      end
      else if GetStereotype(I).CanApplyTo(BaseClass) then begin
        Result := GetStereotype(I);
        Exit;
      end;
    end;
end;

function PProfile.FindDataType(AName: string): PDataType;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FDataTypes.Count - 1 do
    if GetDataType(I).Name = AName then begin
      Result := GetDataType(I);
      Exit;
    end;
end;

function PProfile.FindElementPrototype(AName: string): PElementPrototype;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FElementPrototypes.Count - 1 do
    if GetElementPrototype(I).Name = AName then begin
      Result := GetElementPrototype(I);
      Exit;
    end;
end;

function PProfile.FindModelPrototype(AName: string): PModelPrototype;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FModelPrototypes.Count - 1 do
    if GetModelPrototype(I).Name = AName then begin
      Result := GetModelPrototype(I);
      Exit;
    end;
end;

function PProfile.FindDiagramType(AName: string): PDiagramType;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FDiagramTypes.Count - 1 do
    if GetDiagramType(I).Name = AName then begin
      Result := GetDiagramType(I);
      Exit;
    end;
end;

function PProfile.FindPalette(AName: string): PPalette;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FPalettes.Count - 1 do
    if GetPalette(I).Name = AName then begin
      Result := GetPalette(I);
      Exit;
    end;
end;

// PPRofile
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PProfileReader

constructor PProfileReader.Create;
begin
  StereotypeTable := TList.Create;
end;

destructor PProfileReader.Destroy;
begin
  ClearStereotypeTable;
  StereotypeTable.Free;
  StereotypeTable := nil;
  inherited;
end;

procedure PProfileReader.Report(Msg: string);
begin
  // Log messsage or raise event.
  // call this method when need to report error or information on file reading
end;

procedure PProfileReader.ClearStereotypeTable;
var
  I: Integer;
begin
  for I := StereotypeTable.Count - 1 downto 0 do
    PStereotypeTableItem(StereotypeTable.Items[I]).Free;
end;

function PProfileReader.FindChild(Node: IXMLNode; Key: string): IXMLNode;
begin
  Result := Node.ChildNodes.FindNode(Key);
end;

function PProfileReader.FindSibling(Node: IXMLNode; Key: string): IXMLNode;
var
  N: IXMLNode;
begin
  Result := nil;
  N := Node;
  while N.NextSibling <> nil do begin
    N := N.NextSibling;
    if N.GetLocalName = Key then begin
      Result := N;
      Exit;
    end;
  end;
end;

function PProfileReader.ReadStringNodeValue(Node: IXMLNode; DefaultValue: string = ''): string;
begin
  if VarIsStr(Node.NodeValue) then
    Result := Node.NodeValue
  else
    Result := DefaultValue;
end;

function PProfileReader.ReadChildStringValue(OwnerNode: IXMLNode; Key: string; DefaultValue: string = ''): string;
begin
  if VarIsStr(OwnerNode.ChildValues[Key]) then
    Result := OwnerNode.ChildValues[Key]
  else
    Result := DefaultValue;
end;

function PProfileReader.ReadChildIntegerValue(OwnerNode: IXMLNode; Key: string; DefaultValue: Integer = 0): Integer;
begin
  if VarIsOrdinal(OwnerNode.ChildValues[Key]) then
    Result := OwnerNode.ChildValues[Key]
  else if VarIsStr(OwnerNode.ChildValues[Key]) then
    Result := StrToIntDef(OwnerNode.ChildValues[Key], DefaultValue)
  else
    Result := DefaultValue;
end;

function PProfileReader.ReadChildBooleanValue(OwnerNode: IXMLNode; Key: string; DefaultValue: Boolean = False): Boolean;
begin
  if VarIsType(OwnerNode.ChildValues[Key], varBoolean) then
    Result := OwnerNode.ChildValues[Key]
  else if VarIsStr(OwnerNode.ChildValues[Key]) then
    Result := StrToBoolDef(OwnerNode.ChildValues[Key], DefaultValue)
  else
    Result := DefaultValue;
end;

function PProfileReader.GetStringAttribute(Node: IXMLNode; AttrName: string; DefaultValue: string = ''): string;
begin
  Result := DefaultValue;
  if Node.HasAttribute(AttrName) then
    if VarIsStr(Node.Attributes[AttrName]) then
      Result := Node.Attributes[AttrName];
end;

function PProfileReader.GetIntegerAttribute(Node: IXMLNode; AttrName: string; DefaultValue: Integer = 0): Integer;
begin
  Result := DefaultValue;
  if Node.HasAttribute(AttrName) then begin
    if VarIsOrdinal(Node.Attributes[AttrName]) then // is not exact currently
      Result := Node.Attributes[AttrName]
    else if VarIsStr(Node.Attributes[AttrName]) then
      Result := StrToIntDef(Node.Attributes[AttrName], DefaultValue);
  end;
end;

function PProfileReader.GetBooleanAttribute(Node: IXMLNode; AttrName: string; DefaultValue: Boolean = False): Boolean;
begin
  Result := DefaultValue;
  if Node.HasAttribute(AttrName) then begin
    if VarIsType(Node.Attributes[AttrName], varBoolean) then
      Result := Node.Attributes[AttrName]
    else if VarIsStr(Node.Attributes[AttrName]) then
      try
        Result := StrToBool(Node.Attributes[AttrName]);
      except
        Result := DefaultValue;
      end;
  end;
end;

function PProfileReader.ReadHeader(Node: IXMLNode; AProfile: PProfile): Boolean;
var S: String;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(Node.LocalName = PRF_HEAD, 'Invalid XMLNode');
  Assert(AProfile <> nil, 'Profile is not created');
  // PRECONDITION

  Result := True;

  AProfile.FName := ReadChildStringValue(Node, PRF_NAME);
  if AProfile.FName = '' then begin
    Result := False;
    Exit;
  end;

  AProfile.FDisplayName := ReadChildStringValue(Node, PRF_DISPLAYNAME);
  if AProfile.FDisplayName = '' then begin
    Result := False;
    Exit;
  end;

  AProfile.FDescription := ReadChildStringValue(Node, PRF_DESCRIPTION);

  S := ReadChildStringValue(Node, PRF_AUTOINCLUDE);
  if S <> '' then
    AProfile.FAutoInclude := StrToBool(S)
  else
    AProfile.FAutoInclude := false;

end;

function PProfileReader.ReadBody(Node: IXMLNode; AProfile: PProfile): Boolean;
var
  L, N: IXMLNode;
  S: PStereotype;
  SI: PStereotypeTableItem;
  TS: PTagDefinitionSet;
  D: PDataType;
  Dgm: PDiagramType;
  EP: PElementPrototype;
  MP: PModelPrototype;
  P: PPalette;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(Node.LocalName = PRF_BODY, 'Invalid XMLNode');
  Assert(AProfile <> nil, 'Profile not created');
  // PRECONDITION

  Result := True;

  L := FindChild(Node, PRF_STEREOTYPELIST);
  if L <> nil then begin
    N := FindChild(L, PRF_STEREOTYPE);
    while N <> nil do begin
      S := PStereotype.Create;
      SI := PStereotypeTableItem.Create;
      if ReadStereotype(N, AProfile, S, SI) then begin
        AProfile.FStereotypes.Add(S);
        S.FProfile := AProfile;
        StereotypeTable.Add(SI);
      end
      else begin
        S.Free;
        SI.Free;
      end;
      N := FindSibling(N, PRF_STEREOTYPE);
    end;
  end;

  L := FindChild(Node, PRF_TAGDEFINITIONSETLIST);
  if L <> nil then begin
    N := FindChild(L, PRF_TAGDEFINITIONSET);
    while N <> nil do begin
      TS := PTagDefinitionSet.Create;
      if ReadTagDefinitionSet(N, AProfile, TS) then begin
        AProfile.FTagDefinitionSets.Add(TS);
        TS.FProfile := AProfile;
      end
      else
        TS.Free;
      N := FindSibling(N, PRF_TAGDEFINITIONSET);
    end;
  end;

  L := FindChild(Node, PRF_DATATYPELIST);
  if L <> nil then begin
    N := FindChild(L, PRF_DATATYPE);
    while N <> nil do begin
      D := PDataType.Create;
      if ReadDataType(N, D) then begin
        AProfile.FDataTypes.Add(D);
        D.FProfile := AProfile;
      end
      else
        D.Free;
      N := FindSibling(N, PRF_DATATYPE);
    end;
  end;

  L := FindChild(Node, PRF_ELEMENTPROTOTYPELIST);
  if L <> nil then begin
    N := FindChild(L, PRF_ELEMENTPROTOTYPE);
    while N <> nil do begin
      EP := PElementPrototype.Create;
      if ReadElementPrototype(N, AProfile, EP) then begin
        AProfile.FElementPrototypes.Add(EP);
        EP.FProfile := AProfile;
      end
      else
        EP.Free;
      N := FindSibling(N, PRF_ELEMENTPROTOTYPE);
    end;
  end;

  L := FindChild(Node, PRF_MODELPROTOTYPELIST);
  if L <> nil then begin
    N := FindChild(L, PRF_MODELPROTOTYPE);
    while N <> nil do begin
      MP := PModelPrototype.Create;
      if ReadModelPrototype(N, AProfile, MP) then begin
        AProfile.FModelPrototypes.Add(MP);
        MP.FProfile := AProfile;
      end
      else
        MP.Free;
      N := FindSibling(N, PRF_MODELPROTOTYPE);
    end;
  end;

  L := FindChild(Node, PRF_DIAGRAMTYPELIST);
  if L <> nil then begin
    N := FindChild(L, PRF_DIAGRAMTYPE);
    while N <> nil do begin
      Dgm := PDiagramType.Create;
      if ReadDiagramType(N, AProfile, Dgm) then begin
        AProfile.FDiagramTypes.Add(Dgm);
        Dgm.FProfile := AProfile;
      end
      else
        Dgm.Free;
      N := FindSibling(N, PRF_DIAGRAMTYPE);        
    end;
  end;

  L := FindChild(Node, PRF_PALETTELIST);
  if L <> nil then begin
    N := FindChild(L, PRF_PALETTE);
    while N <> nil do begin
      P := PPalette.Create;
      if ReadPalette(N, AProfile, P) then begin
        AProfile.FPalettes.Add(P);
        P.FProfile := AProfile;
      end
      else
        P.Free;
      N := FindSibling(N, PRF_PALETTE);
    end;
  end;
end;

function PProfileReader.ReadStereotype(Node: IXMLNode; AProfile: PProfile;
  AStereotype: PStereotype; AStereotypeTableItem: PStereotypeTableItem): Boolean;
var
  L, N: IXMLNode;
  F: string;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(Node.LocalName = PRF_STEREOTYPE, 'Invalid XMLNode');
  Assert(AStereotype <> nil, 'Stereotype not created');
  // PRECONDITION

  Result := True;

  AStereotype.FName := ReadChildStringValue(Node, PRF_STEREOTYPE_NAME);
  if AStereotype.FName = '' then begin
    Result := False;
    Exit;
  end;
  AStereotypeTableItem.Stereotype := AStereotype.FName;
  AStereotype.FDescription := ReadChildStringValue(Node, PRF_STEREOTYPE_DESCRIPTION);

  L := FindChild(Node, PRF_STEREOTYPE_BASECLASSES);
  if L <> nil then begin
    N := FindChild(L, PRF_STEREOTYPE_BASECLASS);
    while N <> nil do begin
      if VarIsStr(N.NodeValue) then
        AStereotype.FBaseClasses.Add(N.NodeValue);
      N := FindSibling(N, PRF_STEREOTYPE_BASECLASS);
    end;
  end;

  AStereotypeTableItem.Parent := ReadChildStringValue(Node, PRF_STEREOTYPE_PARENT);
  AStereotypeTableItem.TagDefinitionSet := ReadChildStringValue(Node, PRF_STEREOTYPE_TAGDEFINITIONSET);

  N := FindChild(Node, PRF_STEREOTYPE_ICON);
  if N <> nil then begin
    AStereotype.FIconMinWidth := GetIntegerAttribute(N, PRF_ATTR_ICON_MINWIDTH, DEFAULT_ICON_MINWIDTH);
    AStereotype.FIconMinHeight := GetIntegerAttribute(N, PRF_ATTR_ICON_MINHEIGHT, DEFAULT_ICON_MINHEIGHT);
    F := ReadChildStringValue(Node, PRF_STEREOTYPE_ICON);
    if (F <> '') and (FileExists(AProfile.Path + '\' + F)) then begin
      AStereotype.FIconFile := AProfile.Path + '\' + F;
      AStereotype.LoadIconFile;
    end;
  end;

  F := ReadChildStringValue(Node, PRF_STEREOTYPE_SMALLICON);
  if (F <> '') and (FileExists(AProfile.Path + '\' + F)) then begin
    AStereotype.FSmallIconFile := AProfile.Path + '\' + F;
  end;

  // edited by hskim 2005.08.09 begin
  N := FindChild(Node, PRF_STEREOTYPE_NOTATION);
  if N <> nil then begin
    F := ReadChildStringValue(Node, PRF_STEREOTYPE_NOTATION);
    if (F <> '') and (FileExists(AProfile.Path + '\' + F)) then begin
      AStereotype.FNotationExpr := NXManager.ReadExpr(AProfile.Path + '\' + F);
    end;
  end;
  // edited by hskim 2005.08.09 end
end;

function PProfileReader.ReadTagDefinitionSet(Node: IXMLNode; AProfile: PProfile; ATagDefinitionSet: PTagDefinitionSet): Boolean;
var
  L, N: IXMLNode;
  T: PTagDefinition;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(Node.LocalName = PRF_TAGDEFINITIONSET, 'Invalid XMLNode');
  Assert(ATagDefinitionSet <> nil, 'TagDefinitionSet not created');
  // PRECONDITION

  Result := True;

  ATagDefinitionSet.FName := ReadChildStringValue(Node, PRF_TAGDEFINITIONSET_NAME);
  if ATagDefinitionSet.FName = '' then begin
    Result := False;
    Exit;
  end;

  L := FindChild(Node, PRF_TAGDEFINITIONSET_BASECLASSES);
  if L <> nil then begin
    N := FindChild(L, PRF_TAGDEFINITIONSET_BASECLASS);
    while N <> nil do begin
      if VarIsStr(N.NodeValue) then
        ATagDefinitionSet.FBaseClasses.Add(N.NodeValue);
      N := FindSibling(N, PRF_TAGDEFINITIONSET_BASECLASS);
    end;
  end;

  L := FindChild(Node, PRF_TAGDEFINITIONSET_TAGDEFINITIONLIST);
  if L <> nil then begin
    N := FindChild(L, PRF_TAGDEFINITIONSET_TAGDEFINITION);
    while N <> nil do begin
      T := PTagDefinition.Create;
      if ReadTagDefinition(N, T) then begin
        ATagDefinitionSet.FTagDefinitions.Add(T);
        T.FTagDefinitionSet := ATagDefinitionSet;
      end
      else
        T.Free;
      N := FindSibling(N, PRF_TAGDEFINITIONSET_TAGDEFINITION);
    end;
  end;
end;

function PProfileReader.ReadTagDefinition(Node: IXMLNode; ATagDefinition: PTagDefinition): Boolean;
var
  L, N: IXMLNode;
  TK: string;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(Node.LocalName = PRF_TAGDEFINITIONSET_TAGDEFINITION, 'Invalid XMLNode');
  Assert(ATagDefinition <> nil, 'TagDefinition not created');
  // PRECONDITION

  Result := True;

  ATagDefinition.FName := ReadChildStringValue(Node, PRF_TAGDEFINITION_NAME);
  if ATagDefinition.FName = '' then begin
    Result := False;
    Exit;
  end;

  TK := ReadChildStringValue(Node, PRF_TAGDEFINITION_TAGTYPE);
  if not IsValidTagTypeStr(TK) then begin
    Result := False;
    Exit;
  end;

  ATagDefinition.FTagType := StrToTagType(TK);
  ATagDefinition.FLock := GetBooleanAttribute(Node, PRF_ATTR_LOCK, False);
  // Need to check validness of default value by Tag type?
  case ATagDefinition.TagType of
    tkInteger: ATagDefinition.FDefaultValue := ReadChildStringValue(Node, PRF_TAGDEFINITION_DEFAULTVALUE, '0');
    tkBoolean: ATagDefinition.FDefaultValue := ReadChildStringValue(Node, PRF_TAGDEFINITION_DEFAULTVALUE, 'False');
    tkReal: ATagDefinition.FDefaultValue := ReadChildStringValue(Node, PRF_TAGDEFINITION_DEFAULTVALUE, '0');
    else
      ATagDefinition.FDefaultValue := ReadChildStringValue(Node, PRF_TAGDEFINITION_DEFAULTVALUE);
  end;
  L := FindChild(Node, PRF_TAGDEFINITION_LITERALS);
  if L <> nil then begin
    N := FindChild(L, PRF_TAGDEFINITION_LITERAL);
    while N <> nil do begin
      if VarIsStr(N.NodeValue) then
        ATagDefinition.FLiterals.Add(N.NodeValue);
      N := FindSibling(N, PRF_TAGDEFINITION_LITERAL);
    end;
  end;
  ATagDefinition.FReferenceType := ReadChildStringValue(Node, PRF_TAGDEFINITION_REFERENCETYPE);
end;


function PProfileReader.ReadDataType(Node: IXMLNode; ADataType: PDataType): Boolean;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(Node.LocalName = PRF_DATATYPE, 'Invalid XMLNode');
  Assert(ADataType <> nil, 'DataType not created');
  // PRECONDITION

  Result := True;
  ADataType.FName := ReadChildStringValue(Node, PRF_DATATYPE_NAME);
  if ADataType.FName = '' then begin
    Result := False;
    Exit;
  end;
end;

function PProfileReader.ReadElementPrototype(Node: IXMLNode; AProfile: PProfile; AElementPrototype: PElementPrototype): Boolean;
var
  L, N: IXMLNode;
  F, PropName, PropValue: string;
  Prf, Tds, Td, TagValue: string;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(Node.LocalName = PRF_ELEMENTPROTOTYPE, 'Invalid XMLNode');
  Assert(AElementPrototype <> nil, 'ElementPrototype not created');
  // PRECONDITION

  Result := True;
  AElementPrototype.FName := ReadChildStringValue(Node, PRF_ELEMENTPROTOTYPE_NAME);
  if AElementPrototype.FName = '' then begin
    Result := False;
    Exit;
  end;
  AElementPrototype.FDisplayName := ReadChildStringValue(Node, PRF_ELEMENTPROTOTYPE_DISPLAYNAME);
  if AElementPrototype.FDisplayName = '' then begin
    Result := False;
    Exit;
  end;

  N := FindChild(Node, PRF_ELEMENTPROTOTYPE_BASEELEMENT);
  if N <> nil then begin
    AElementPrototype.FBaseElement := ReadStringNodeValue(N);
    AElementPrototype.FArgument := GetIntegerAttribute(N, PRF_ATTR_ARGUMENT);
  end;  
  if AElementPrototype.FBaseElement = '' then begin
    Result := False;
    Exit;
  end;

  F := ReadChildStringValue(Node, PRF_ELEMENTPROTOTYPE_ICON);
  if (F <> '') and (FileExists(AProfile.Path + '\' + F)) then
    AElementPrototype.FIconFile := AProfile.Path + '\' + F;

  AElementPrototype.FDragType := StrToDragType(ReadChildStringValue(Node, PRF_ELEMENTPROTOTYPE_DRAGTYPE));
  AElementPrototype.FStereotypeName := ReadChildStringValue(Node, PRF_ELEMENTPROTOTYPE_STEREOTYPENAME);
  AElementPrototype.FStereotypeDisplay := ReadChildStringValue(Node, PRF_ELEMENTPROTOTYPE_STEREOTYPEDISPLAY);
  AElementPrototype.FShowExtendedNotation := ReadChildBooleanValue(Node, PRF_ELEMENTPROTOTYPE_SHOWEXTENDEDNOTATION);

  L := FindChild(Node, PRF_ELEMENTPROTOTYPE_MODELPROPERTYLIST);
  if L <> nil then begin
    N := FindChild(L, PRF_ELEMENTPROTOTYPE_MODELPROPERTY);
    while N <> nil do begin
      PropName := GetStringAttribute(N, PRF_ATTR_NAME);
      PropValue := ReadStringNodeValue(N);
      if PropName <> '' then
        AElementPrototype.AddModelProperty(PropName, PropValue);
      N := FindSibling(N, PRF_ELEMENTPROTOTYPE_MODELPROPERTY);
    end;
  end;

  L := FindChild(Node, PRF_ELEMENTPROTOTYPE_VIEWPROPERTYLIST);
  if L <> nil then begin
    N := FindChild(L, PRF_ELEMENTPROTOTYPE_VIEWPROPERTY);
    while N <> nil do begin
      PropName := GetStringAttribute(N, PRF_ATTR_NAME);
      PropValue := ReadStringNodeValue(N);
      if PropName <> '' then
        AElementPrototype.AddViewProperty(PropName, PropValue);
      N := FindSibling(N, PRF_ELEMENTPROTOTYPE_VIEWPROPERTY);
    end;
  end;

  L := FindChild(Node, PRF_ELEMENTPROTOTYPE_TAGGEDVALUELIST);
  if L <> nil then begin
    N := FindChild(L, PRF_ELEMENTPROTOTYPE_TAGGEDVALUE);
    while N <> nil do begin
      Prf := GetStringAttribute(N, PRF_ATTR_PROFILE);
      Tds := GetStringAttribute(N, PRF_ATTR_TAGDEFINITIONSET);
      Td := GetStringAttribute(N, PRF_ATTR_TAGDEFINITION);
      TagValue := ReadStringNodeValue(N);
      if (Tds = '') or (Td = '') then begin
        Result := False;
        Exit;
      end;
      AElementPrototype.AddTaggedValue(Prf, Tds, Td, TagValue);
      N := FindSibling(N, PRF_ELEMENTPROTOTYPE_TAGGEDVALUE);
    end;
  end;
end;

function PProfileReader.ReadModelPrototype(Node: IXMLNode; AProfile: PProfile; AModelPrototype: PModelPrototype): Boolean;
var
  L, N: IXMLNode;
  F, PropName, PropValue: string;
  E, ES: string;
  Prf, Tds, Td, TagValue: string;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(Node.LocalName = PRF_MODELPROTOTYPE, 'Invalid XMLNode');
  Assert(AModelPrototype <> nil, 'ModelPrototype not created');
  // PRECONDITION

  Result := True;
  AModelPrototype.FName := ReadChildStringValue(Node, PRF_MODELPROTOTYPE_NAME);
  if AModelPrototype.FName = '' then begin
    Result := False;
    Exit;
  end;
  AModelPrototype.FDisplayName := ReadChildStringValue(Node, PRF_MODELPROTOTYPE_DISPLAYNAME);
  if AModelPrototype.FDisplayName = '' then begin
    Result := False;
    Exit;
  end;
  N := FindChild(Node, PRF_MODELPROTOTYPE_BASEMODEL);
  if N <> nil then begin
    AModelPrototype.FBaseModel := ReadStringNodeValue(N);
    AModelPrototype.FArgument := GetIntegerAttribute(N, PRF_ATTR_ARGUMENT);
  end;
  if AModelPrototype.FBaseModel = '' then begin
    Result := False;
    Exit;
  end;

  F := ReadChildStringValue(Node, PRF_MODELPROTOTYPE_ICON);
  if (F <> '') and (FileExists(AProfile.Path + '\' + F)) then
    AModelPrototype.FIconFile := AProfile.Path + '\' + F;

  AModelPrototype.FStereotypeName := ReadChildStringValue(Node, PRF_MODELPROTOTYPE_STEREOTYPENAME);

  L := FindChild(Node, PRF_MODELPROTOTYPE_PROPERTYLIST);
  if L <> nil then begin
    N := FindChild(L, PRF_MODELPROTOTYPE_PROPERTY);
    while N <> nil do begin
      PropName := GetStringAttribute(N, PRF_ATTR_NAME);
      PropValue := ReadStringNodeValue(N);
      if PropName <> '' then
        AModelPrototype.AddProperty(PropName, PropValue);
      N := FindSibling(N, PRF_MODELPROTOTYPE_PROPERTY);
    end;
  end;

  L := FindChild(Node, PRF_MODELPROTOTYPE_TAGGEDVALUELIST);
  if L <> nil then begin
    N := FindChild(L, PRF_MODELPROTOTYPE_TAGGEDVALUE);
    while N <> nil do begin
      Prf := GetStringAttribute(N, PRF_ATTR_PROFILE);
      Tds := GetStringAttribute(N, PRF_ATTR_TAGDEFINITIONSET);
      Td := GetStringAttribute(N, PRF_ATTR_TAGDEFINITION);
      TagValue := ReadStringNodeValue(N);
      if (Tds = '') or (Td = '') then begin
        Result := False;
        Exit;
      end;
      AModelPrototype.AddTaggedValue(Prf, Tds, Td, TagValue);
      N := FindSibling(N, PRF_MODELPROTOTYPE_TAGGEDVALUE);
    end;
  end;

  L := FindChild(Node, PRF_MODELPROTOTYPE_CONTAINERMODELLIST);
  if L <> nil then begin
    N := FindChild(L, PRF_MODELPROTOTYPE_CONTAINERMODEL);
    while N <> nil do begin
      E := GetStringAttribute(N, PRF_ATTR_TYPE);
      ES := GetStringAttribute(N, PRF_ATTR_STEREOTYPE);
      if E = '' then begin
        Result := False;
        Exit;
      end;
      AModelPrototype.AddContainerModel(E, ES);
      N := FindSibling(N, PRF_MODELPROTOTYPE_CONTAINERMODEL);
    end;
  end;
end;

function PProfileReader.ReadDiagramType(Node: IXMLNode; AProfile: PProfile; ADiagramType: PDiagramType): Boolean;
var
  L, N: IXMLNode;
  F: string;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(Node.LocalName = PRF_DIAGRAMTYPE, 'Invalid XMLNode');
  Assert(ADiagramType <> nil, 'DiagramType not created');
  // PRECONDITION

  Result := True;
  ADiagramType.FName := ReadChildStringValue(Node, PRF_DIAGRAMTYPE_NAME);
  if ADiagramType.FName = '' then begin
    Result := False;
    Exit;
  end;
  ADiagramType.FDisplayName := ReadChildStringValue(Node, PRF_DIAGRAMTYPE_DISPLAYNAME);
  if ADiagramType.FDisplayName = '' then begin
    Result := False;
    Exit;
  end;
  ADiagramType.FBaseDiagram := ReadChildStringValue(Node, PRF_DIAGRAMTYPE_BASEDIAGRAM);
  if ADiagramType.FBaseDiagram = '' then begin
    Result := False;
    Exit;
  end;

  F := ReadChildStringValue(Node, PRF_DIAGRAMTYPE_ICON);
  if (F <> '') and (FileExists(AProfile.Path + '\' + F)) then
    ADiagramType.FIconFile := AProfile.Path + '\' + F;

  L := FindChild(Node, PRF_DIAGRAMTYPE_AVAILABLEPALETTELIST);
  if L <> nil then begin
    N := FindChild(L, PRF_DIAGRAMTYPE_AVAILABLEPALETTE);
    while N <> nil do begin
      if VarIsStr(N.NodeValue) then
        ADiagramType.FAvailablePalettes.Add(N.NodeValue);
      N := FindSibling(N, PRF_DIAGRAMTYPE_AVAILABLEPALETTE);
    end;
  end;
end;

function PProfileReader.ReadPalette(Node: IXMLNode; AProfile: PProfile; APalette: PPalette): Boolean;
var
  L, N: IXMLNode;
  PI: string;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(Node.LocalName = PRF_PALETTE, 'Invalid XMLNode');
  Assert(APalette <> nil, 'Palette not created');
  // PRECONDITION

  Result := True;
  APalette.FName := ReadChildStringValue(Node, PRF_PALETTE_NAME);
  if APalette.FName = '' then begin
    Result := False;
    Exit;
  end;
  APalette.FDisplayName := ReadChildStringValue(Node, PRF_PALETTE_DISPLAYNAME);
  if APalette.FDisplayName = '' then begin
    Result := False;
    Exit;
  end;

  L := FindChild(Node, PRF_PALETTE_PALETTEITEMLIST);
  if L <> nil then begin
    N := FindChild(L, PRF_PALETTE_PALETTEITEM);
    while N <> nil do begin
      PI := ReadStringNodeValue(N);
      if PI <> '' then
        APalette.AddPaletteItem(PI);
      N := FindSibling(N, PRF_PALETTE_PALETTEITEM);
    end;
  end;
end;

procedure PProfileReader.Compansate(AProfile: PProfile);
var
  SI: PStereotypeTableItem;
  S, P: PStereotype;
  T: PTagDefinitionSet;
  I: Integer;
begin
  // link parent-child and stereotype-tagdefinitionset relation
  for I := 0 to StereotypeTable.Count - 1 do begin
    SI := PStereotypeTableItem(StereotypeTable.Items[I]);
    S := AProfile.FindStereotype(SI.Stereotype, '');
    if SI.Parent <> '' then begin
      P := AProfile.FindStereotype(SI.Parent, '');
      if P <> nil then begin
        S.FParent := P;
        P.FChildren.Add(S);
      end;
    end;
    if SI.TagDefinitionSet <> '' then begin
      T := AProfile.FindTagDefinitionSet(SI.TagDefinitionSet);
      if T <> nil then begin
        S.FTagDefinitionSet := T;
        T.FStereotype := S;
      end;
    end;
  end;
  // set tagdefinitionset's baseclasses as stereotype's baseclasses
  for I := 0 to AProfile.TagDefinitionSetCount - 1 do
    if AProfile.TagDefinitionSets[I].Stereotype <> nil then
      AProfile.TagDefinitionSets[I].FBaseClasses.Assign(AProfile.TagDefinitionSets[I].Stereotype.FBaseClasses);
end;

function PProfileReader.ReadProfile(AProfile: PProfile): Boolean;
var
  XMLDoc: TXMLDocument;
  RootNode: IXMLNode;
  HNode, BNode: IXMLNode;
begin
  // PRECONDITION
  Assert(AProfile <> nil, 'Profile not created');
  // PRECONDITION

  ClearStereotypeTable;
  XMLDoc := TXMLDocument.Create(Application);
  try
    try
      XMLDoc.LoadFromFile(AProfile.FileName);
      // check AsyncLoadState
      if XMLDoc.IsEmptyDoc then begin
        Result := False;
        Exit;
      end;
      RootNode := XMLDoc.DocumentElement;
      if RootNode.LocalName <> PRF_PROFILE then begin
        Result := False;
        Exit;
      end;
      HNode := FindChild(RootNode, PRF_HEAD);
      if HNode = nil then begin
        Result := False;
        Exit;
      end;
      BNode := FindChild(RootNode, PRF_BODY);
      if BNode = nil then begin
        Result := False;
        Exit;
      end;
      Result := ReadHeader(HNode, AProfile) and ReadBody(BNode, AProfile);
      if Result then
        Compansate(AProfile);
    except
      Result := False;
    end;
  finally
    XMLDoc.Free;
  end;
end;

// PProfileReader
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PExtensionManager

constructor PExtensionManager.Create;
begin
  inherited;
  FAvailableProfiles := POrderedSet.Create;
  FIncludedProfiles := POrderedSet.Create;
end;

destructor PExtensionManager.Destroy;
var
  I: Integer;
begin
  for I := FAvailableProfiles.Count - 1 downto 0 do
    GetAvailableProfile(I).Free;
  FAvailableProfiles.Free;
  FAvailableProfiles := nil;
  FIncludedProfiles.Free;
  FIncludedProfiles := nil;
  inherited;
end;

function PExtensionManager.GetAvailableProfileCount: Integer;
begin
  Result := FAvailableProfiles.Count;
end;

function PExtensionManager.GetAvailableProfile(Index: Integer): PProfile;
begin
  Result := FAvailableProfiles.Items[Index] as PProfile;
end;

function PExtensionManager.GetIncludedProfileCount: Integer;
begin
  Result := FIncludedProfiles.Count;
end;

function PExtensionManager.GetIncludedProfile(Index: Integer): PProfile;
begin
  Result := FIncludedProfiles.Items[Index] as PProfile;
end;

function PExtensionManager.CanExcludeProfile(AProfile: PProfile): Boolean;
var
  MC: PMetaClass;
  T: PTaggedValue;
  I: Integer;
begin
  Result := True;
  MC := MetaModel.FindMetaClass('TaggedValue');
  for I := MC.InstanceCount - 1 downto 0 do begin
    T := MC.Instances[I] as PTaggedValue;
    if T.ProfileName = AProfile.Name then begin
      if (T.TaggedModel <> nil) and T.TaggedModel.ReadOnly then begin
        Result := False;
        Exit;
      end;
    // need not to check TTaggedValue.ReferenceValues
    end;
  end;
end;

procedure PExtensionManager.ClearIncludedProfiles;
begin
  ExcludeAllProfiles;
end;

procedure PExtensionManager.IncludeProfile(AProfile: string);
var
  P: PProfile;
begin
  P := FindAvailableProfile(AProfile);
  if P = nil then raise EProfileNotFound.Create(MSG_PROFILE_NOT_FOUND + ' (' + AProfile + ')');
  FIncludedProfiles.Add(P);
end;

procedure PExtensionManager.ExcludeProfile(AProfile: string);
var
  P: PProfile;
  MC: PMetaClass;
  T: PTaggedValue;
  I: Integer;
begin
  P := FindAvailableProfile(AProfile);
  if P = nil then raise EProfileNotFound.Create(MSG_PROFILE_NOT_FOUND + ' (' + AProfile + ')');

  // Check whether can exclude the profile.
  if not CanExcludeProfile(P) then
    raise ECannotExcludeProfile.Create(MSG_PROFILE_CANNOT_EXCLUDE + ' (' + AProfile + ')');

  // Delete all TaggedValues related to the Profile.
  MC := MetaModel.FindMetaClass('TaggedValue');
  for I := MC.InstanceCount - 1 downto 0 do begin
    T := MC.Instances[I] as PTaggedValue;
    if T.ProfileName = AProfile then begin
      T.Isolate;
      T.Free;
    end;
  end;
  FIncludedProfiles.Remove(P);
end;

procedure PExtensionManager.ExcludeAllProfiles;
var
  I: Integer;
  P: PProfile;
begin
  for I := IncludedProfileCount - 1 downto 0 do begin
    P := IncludedProfiles[I];
    ExcludeProfile(P.Name);
  end;
end;

function PExtensionManager.IsIncluded(AProfile: PProfile): Boolean;
begin
  Result := (FIncludedProfiles.IndexOf(AProfile) <> -1);
end;

function PExtensionManager.FindAvailableProfile(AName: string): PProfile;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FAvailableProfiles.Count - 1 do
    if GetAvailableProfile(I).Name = AName then begin
      Result := GetAvailableProfile(I);
      Exit;
    end;
end;

function PExtensionManager.FindIncludedProfile(AName: string): PProfile;
var
  I: Integer;
  Profile: PProfile;
begin
  Result := nil;
  for I := 0 to FIncludedProfiles.Count - 1 do begin
    Profile := GetIncludedProfile(I);
    if Profile.Name = AName then begin
      Result := GetIncludedProfile(I);
      Exit;
    end;
  end;
end;

function PExtensionManager.FindStereotype(AProfile, AName: string; BaseClass: string): PStereotype;
var
  P: PProfile;
begin
  Result := nil;
  P := FindIncludedProfile(AProfile);
  if P <> nil then
    Result := P.FindStereotype(AName, BaseClass);
end;

function PExtensionManager.FindFirstStereotype(Name: string; BaseClass: string): PStereotype;
var
  I: Integer;
  P: PProfile;
  S: PStereotype;
begin
  Result := nil;
  for I := 0 to IncludedProfileCount - 1 do begin
    P := IncludedProfiles[I];
    S := P.FindStereotype(Name, BaseClass);
    if S <> nil then begin
      Result := S;
      Exit;
    end;
  end;
end;

function PExtensionManager.FindTagDefinition(AProfile, ATagDefinitionSetName, AName: string): PTagDefinition;
var
  P: PProfile;
begin
  Result := nil;
  P := FindIncludedProfile(AProfile);
  if P <> nil then
    Result := P.FindTagDefinition(ATagDefinitionSetName, AName);
end;

function PExtensionManager.FindTagDefinitionSet(AProfile, AName: string): PTagDefinitionSet;
var
  P: PProfile;
begin
  Result := nil;
  P := FindIncludedProfile(AProfile);
  if P <> nil then
    Result := P.FindTagDefinitionSet(AName);
end;

function PExtensionManager.FindDiagramType(AProfile, AName: string): PDiagramType;
var
  P: PProfile;
begin
  Result := nil;
  P := FindIncludedProfile(AProfile);
  if P <> nil then
    Result := P.FindDiagramType(AName);
end;

function PExtensionManager.FindElementPrototype(AProfile, AName: string): PElementPrototype;
var
  P: PProfile;
begin
  Result := nil;
  P := FindIncludedProfile(AProfile);
  if P <> nil then
    Result := P.FindElementPrototype(AName);
end;

function PExtensionManager.FindModelPrototype(AProfile, AName: string): PModelPrototype;
var
  P: PProfile;
begin
  Result := nil;
  P := FindIncludedProfile(AProfile);
  if P <> nil then
    Result := P.FindModelPrototype(AName);
end;

procedure PExtensionManager.LoadProfiles;

  function StringToBoolean(Value: string): Boolean;
  begin
    Result := (LowerCase(Value) = 'true');
  end;

  function AppendProfile(ProfileName, Path, FileName, IconFileName: string; AutoInclude: Boolean = False): Boolean;
  var
    PR: PProfileReader;
    P: PProfile;
  begin
    if not FileExists(FileName) then begin
      Result := False;
      Exit;
    end;
    P := PProfile.Create;
    P.FName := ProfileName; // will be overwrited in ReadProfile
    P.FPath := Path;
    P.FFileName := FileName;
    P.FIconFile := IconFileName;
    P.FAutoInclude := AutoInclude;
    PR := PProfileReader.Create;
    try
      if PR.ReadProfile(P) then begin
        FAvailableProfiles.Add(P);
        Result := True;
      end
      else begin
        P.Free;
        Result := False;
      end;
    finally
      PR.Free;
    end;
  end;

  procedure LoadFiles(Path: String);
  var
    SearchRec: TSearchRec;
    ProfileName, FolderPath, FileName, IconFileName: string;
    AutoInclude: Boolean;
  begin
    // files
    if FindFirst(Path + '\*' + PROFILE_EXTENSION, faArchive, SearchRec) = 0 then begin
      repeat
        ProfileName := Copy(SearchRec.Name, 1, Length(SearchRec.Name)-Length('.'+PROFILE_EXTENSION));
        FolderPath := Path;
        FileName := Path + '\' + ProfileName + '.' + PROFILE_EXTENSION;
        IconFileName := Path + '\' + ProfileName + '.' + ICON_EXTENSION;
        AutoInclude := false;

        if AppendProfile(ProfileName, FolderPath, FileName, IconFileName, AutoInclude) then
          LogManager.Log(Format(MSG_PROFILE_LOADED,[ProfileName]))
        else
          LogManager.Log(Format(ERR_PROFILE_LOAD_FAILED, [ProfileName]));
      until FindNext(SearchRec) <> 0;
    end;

    // folders
    if FindFirst(Path + '\*', faDirectory, SearchRec) = 0 then begin
      repeat
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
          LoadFiles(Path + '\' + SearchRec.Name);
      until FindNext(SearchRec) <> 0;
    end;
  end;

begin
  FAvailableProfiles.Clear;
  LoadFiles(ExtractFileDir(Application.ExeName) + '\' + EXT_DIR);
end;

// PExtensionManager
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Utilities

function IsValidTagTypeStr(T: string): Boolean;
begin
  Result := (T = 'Integer') or (T = 'Boolean') or (T = 'String')
    or (T = 'Real') or (T = 'Enumeration') or (T = 'Reference') or (T = 'Collection');
end;

function TagTypeToStr(T: PTagTypeKind): string;
begin
  case T of
    tkInteger: Result := 'Integer';
    tkBoolean: Result := 'Boolean';
    tkString: Result := 'String';
    tkReal: Result := 'Real';
    tkEnumeration: Result := 'Enumeration';
    tkReference: Result := 'Reference';
    tkCollection: Result := 'Collection';
    else
      Result := 'String';
  end;
end;

function StrToTagType(T: string): PTagTypeKind;
begin
  if T = 'Integer' then
    Result := tkInteger
  else if T = 'Boolean' then
    Result := tkBoolean
  else if T = 'String' then
    Result := tkString
  else if T = 'Real' then
    Result := tkReal
  else if T = 'Enumeration' then
    Result := tkEnumeration
  else if T = 'Reference' then
    Result := tkReference
  else if T = 'Collection' then
    Result := tkCollection
  else
    Result := tkString;
end;

function IsDataTagType(T: PTagTypeKind): Boolean;
begin
  Result := (T = tkInteger) or (T = tkBoolean) or (T = tkString)
    or (T = tkReal) or (T = tkEnumeration);
end;

function IsReferenceTagType(T: PTagTypeKind): Boolean;
begin
  Result := (T = tkReference) or (T = tkCollection);
end;

function StrToDragType(T: string): PDragTypeKind;
begin
  if T = 'Rect' then
    Result := dkRect
  else if T = 'Line' then
    Result := dkLine
  else
    Result := dkRect;
end;

// Utilities
////////////////////////////////////////////////////////////////////////////////

procedure RegisterClasses;
begin
  ClassRegistry.RegisterClass(PExtensibleModel);
  ClassRegistry.RegisterClass(PConstraint);
  ClassRegistry.RegisterClass(PTaggedValue);
  ClassRegistry.RegisterClass(PProfile);
  ClassRegistry.RegisterClass(PTagDefinition);
  ClassRegistry.RegisterClass(PTagDefinitionSet);
  ClassRegistry.RegisterClass(PStereotype);
  ClassRegistry.RegisterClass(PDataType);
  ClassRegistry.RegisterClass(PElementPrototype);
  ClassRegistry.RegisterClass(PModelPrototype);
  ClassRegistry.RegisterClass(PPalette);
  ClassRegistry.RegisterClass(PDiagramType);
  ClassRegistry.RegisterClass(PExtensionManager);
end;

procedure RegisterMetaClasses;
var
  M: PMetaClass;
begin
  // Meta Classes
  MetaModel.DefineMetaClass(PExtensibleModel, 'ExtensibleModel', True);
  MetaModel.DefineMetaClass(PConstraint, 'Constraint', False);
  MetaModel.DefineMetaClass(PTaggedValue, 'TaggedValue', False);
  // ExtensibleModel
  M := MetaModel.FindMetaClass('ExtensibleModel');
  MetaModel.DefineMetaAttribute(M, 'StereotypeProfile', 'String', False, False);
  MetaModel.DefineMetaAttribute(M, 'StereotypeName', 'String', False, False);
  MetaModel.DefineMetaCollection(M, 'Constraints', 'Constraint', True, False, makComposite, 'ConstrainedModel', maeReference);
  MetaModel.DefineMetaCollection(M, 'TaggedValues', 'TaggedValue', True, False, makComposite, 'TaggedModel', maeReference);
  MetaModel.DefineMetaCollection(M, 'ReferencingTags', 'TaggedValue', True, False, makNone, 'ReferenceValues', maeCollection);
  // Constraint
  M := MetaModel.FindMetaClass('Constraint');
  MetaModel.DefineMetaAttribute(M, 'Name', 'String', False, False);
  MetaModel.DefineMetaAttribute(M, 'Body', 'String', False, False);
  MetaModel.DefineMetaReference(M, 'ConstrainedModel', 'ExtensibleModel', True, False, makNone, 'Constraints', maeCollection);
  // TaggedValue
  M := MetaModel.FindMetaClass('TaggedValue');
  MetaModel.DefineMetaAttribute(M, 'ProfileName', 'String', True, False);
  MetaModel.DefineMetaAttribute(M, 'TagDefinitionSetName', 'String', True, False);
  MetaModel.DefineMetaAttribute(M, 'Name', 'String', True, False);
  MetaModel.DefineMetaAttribute(M, 'DataValue', 'String', False, False);
  MetaModel.DefineMetaReference(M, 'TaggedModel', 'ExtensibleModel', True, False, makNone, 'TaggedValues', maeCollection);
  MetaModel.DefineMetaCollection(M, 'ReferenceValues', 'ExtensibleModel', True, False, makNone, 'ReferencingTags', maeCollection);
  // Inheritance Relations
  MetaModel.DefineMetaInheritance('Model', 'ExtensibleModel');
  MetaModel.DefineMetaInheritance('Element', 'Constraint');
  MetaModel.DefineMetaInheritance('Element', 'TaggedValue');
end;

initialization
  RegisterClasses;
  RegisterMetaClasses;
  ExtensionManager := PExtensionManager.Create;
finalization
  ExtensionManager.Free;
end.
