unit UMLAux;

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
  BasicClasses, Core, ViewCore, UMLModels,
  Classes, XMLIntf, SysUtils;

const
  XPD_UNIT = 'UNIT';
  XPD_PROJECT = 'PROJECT';
  XPD_SUBUNITS = 'SUBUNITS';
  XPD_PROFILES = 'PROFILES';
  XPD_PROFILE = 'PROFILE';
  XPD_MODELFRAGMENT = 'MODELFRAGMENT';
  XPD_UNIT_OWNER = 'owner';
  XPD_UNIT_INDEX = 'index';

  // Element image index in MainForm.TotalImage
  IMG_INDEX_UNKNOWN = -1;
  IMG_INDEX_PROJECT = 5;
  IMG_INDEX_PROJECT_LOCKED = 6;
  IMG_INDEX_MODEL = 7;
  IMG_INDEX_MODEL_SEPERATED = 8;
  IMG_INDEX_MODEL_SEPERATED_LOCKED = 9;
  IMG_INDEX_SUBSYSTEM = 10;
  IMG_INDEX_SUBSYSTEM_SEPERATED = 11;
  IMG_INDEX_SUBSYSTEM_SEPERATED_LOCKED = 12;
  IMG_INDEX_PACKAGE = 13;
  IMG_INDEX_PACKAGE_SEPERATED = 14;
  IMG_INDEX_PACKAGE_SEPERATED_LOCKED = 15;
  IMG_INDEX_CLASS = 16;
  IMG_INDEX_INTERFACE = 17;
  IMG_INDEX_ENUMERATION = 18;
  IMG_INDEX_SIGNAL = 19;
  IMG_INDEX_EXCEPTION = 20;
  IMG_INDEX_COMPONENT = 21;
  IMG_INDEX_COMPONENTINSTANCE = 22;
  IMG_INDEX_NODE = 23;
  IMG_INDEX_NODEINSTANCE = 24;
  IMG_INDEX_USECASE = 25;
  IMG_INDEX_ACTOR = 26;
  IMG_INDEX_ACTIVITYGRAPH = 27;
  IMG_INDEX_STATEMACHINE = 28;
  IMG_INDEX_COMPOSITESTATE = 29;
  IMG_INDEX_COLLABORATION = 30;
  IMG_INDEX_COLLABORATIONINSTANCESET = 31;
  IMG_INDEX_INTERACTION = 32;
  IMG_INDEX_INTERACTIONINSTANCESET = 33;
  IMG_INDEX_ACTIONSTATE = 34;
  IMG_INDEX_SUBACTIVITYSTATE = 35;
  IMG_INDEX_PSEUDOSTATE_DECISION = 36;
  IMG_INDEX_PSEUDOSTATE_INITIALSTATE = 37;
  IMG_INDEX_PSEUDOSTATE_SYNCHRONIZATION = 38;
  IMG_INDEX_PSEUDOSTATE_JUNCTIONPOINT = 39;
  IMG_INDEX_PSEUDOSTATE_CHOICEPOINT = 40;
  IMG_INDEX_PSEUDOSTATE_SHALLOWHISTORY = 41;
  IMG_INDEX_PSEUDOSTATE_DEEPHISTORY = 42;
  IMG_INDEX_FINALSTATE = 43;
  IMG_INDEX_PARTITION = 44;
  IMG_INDEX_SUBMACHINESTATE = 45;
  IMG_INDEX_ATTRIBUTE_PUBLIC = 46;
  IMG_INDEX_ATTRIBUTE_PROTECTED = 47;
  IMG_INDEX_ATTRIBUTE_PRIVATE = 48;
  IMG_INDEX_ATTRIBUTE_PACKAGE = 49;
  IMG_INDEX_OPERATION_PUBLIC = 50;
  IMG_INDEX_OPERATION_PROTECTED = 51;
  IMG_INDEX_OPERATION_PRIVATE = 52;
  IMG_INDEX_OPERATION_PACKAGE = 53;
  IMG_INDEX_PARAMETER = 54;
  IMG_INDEX_TEMPLATEPARAMETER = 55;
  IMG_INDEX_ENUMERATIONLITERAL = 56;
  IMG_INDEX_TRANSITION = 57;
  IMG_INDEX_TRANSITION_SELF = 58;
  IMG_INDEX_CALLACTION = 59;
  IMG_INDEX_SENDACTION = 60;
  IMG_INDEX_CREATEACTION = 61;
  IMG_INDEX_DESTROYACTION = 62;
  IMG_INDEX_RETURNACTION = 63;
  IMG_INDEX_UNINTERPRETEDACTION = 64;
  IMG_INDEX_UNINTERPRETEDACTION_ENTRY = 65;
  IMG_INDEX_UNINTERPRETEDACTION_DO = 66;
  IMG_INDEX_UNINTERPRETEDACTION_EXIT = 67;
  IMG_INDEX_SIGNALEVENT = 68;
  IMG_INDEX_CALLEVENT = 69;
  IMG_INDEX_TIMEEVENT = 70;
  IMG_INDEX_CHANGEEVENT = 71;
  IMG_INDEX_CLASSIFIERROLE = 72;
  IMG_INDEX_OBJECT = 73;
  IMG_INDEX_DEPENDENCY = 74;
  IMG_INDEX_ASSOCIATION = 75;
  IMG_INDEX_ASSOCIATIONCLASS = 76;
  IMG_INDEX_GENERALIZATION = 77;
  IMG_INDEX_LINK = 78;
  IMG_INDEX_LINE_SELF = 79;
  IMG_INDEX_ASSOCIATIONROLE = 80;
  IMG_INDEX_ASSOCIATIONROLE_SELF = 81;
  IMG_INDEX_STIMULUS = 82;
  IMG_INDEX_STIMULUS_REVERSE = 83;
  IMG_INDEX_STIMULUS_SELF = 84;
  IMG_INDEX_MESSAGE = 85;
  IMG_INDEX_MESSAGE_REVERSE = 86;
  IMG_INDEX_MESSAGE_SELF = 87;
  IMG_INDEX_INCLUDE = 88;
  IMG_INDEX_EXTEND = 89;
  IMG_INDEX_REALIZATION = 90;
  IMG_INDEX_CLASS_DIAGRAM = 91;
  IMG_INDEX_USECASE_DIAGRAM = 92;
  IMG_INDEX_SEQUENCE_DIAGRAM = 93;
  IMG_INDEX_SEQUENCE_ROLE_DIAGRAM = 94;
  IMG_INDEX_COLLABORATION_DIAGRAM = 95;
  IMG_INDEX_COLLABORATION_ROLE_DIAGRAM = 96;
  IMG_INDEX_STATECHART_DIAGRAM = 97;
  IMG_INDEX_ACTIVITY_DIAGRAM = 98;
  IMG_INDEX_COMPONENT_DIAGRAM = 99;
  IMG_INDEX_DEPLOYMENT_DIAGRAM = 100;
  IMG_INDEX_SIGNALACCEPTSTATE = 159;
  IMG_INDEX_SIGNALSENDSTATE = 160;
  IMG_INDEX_COMBINEDFRAGMENT = 163;
  IMG_INDEX_CONNECTOR = 164;
  IMG_INDEX_FLOWFINALSTATE = 166;
  IMG_INDEX_FRAME = 167;
  IMG_INDEX_INTERACTIONOPERAND = 169;
  IMG_INDEX_OBJECTFLOWSTATE = 171;
  IMG_INDEX_PORT = 173;
  IMG_INDEX_ARTIFACT = 176;
  IMG_INDEX_EXTENSIONPOINT = 177;
  IMG_INDEX_ATTRIBUTELINK = 178;
  IMG_INDEX_COMPOSITESTRUCTURE_DIAGRAM = 179;

type
  // Exceptions
  ENameConflict = class(Exception);

  // Forward Declarations
  PUMLProjectDocument = class;

  // PUMLDocument
  PUMLDocument = class(PDocument)
  end;

  // PUMLDocumentInputStream
  PUMLDocumentInputStream = class(PDocumentInputStream)
  end;

  // PUMLDocumentOutputStream
  PUMLDocumentOutputStream = class(PDocumentOutputStream)
  protected
    procedure IsFiltered(Obj: PObject; Key: string; var CanFilter: Boolean); override;
  end;

  // PUnitDocument
  PUMLUnitDocument = class(PUMLDocument)
  private
    FParentUnitDocument: PUMLUnitDocument;
    FSubUnitDocuments: TList;
    procedure SetParentUnitDocument(Value: PUMLUnitDocument);
    function GetSubUnitDocument(Index: Integer): PUMLUnitDocument;
    function GetSubUnitDocumentCount: Integer;
  public
    constructor Create; override;
    destructor Destroy; override;
    function GetDocumentSymbol: string; override;
    procedure AddSubUnitDocument(AUnitDocument: PUMLUnitDocument);
    procedure RemoveSubUnitDocument(AUnitDocument: PUMLUnitDocument);
    property ParentUnitDocument: PUMLUnitDocument read FParentUnitDocument write SetParentUnitDocument;
    property SubUnitDocuments[Index: Integer]: PUMLUnitDocument read GetSubUnitDocument;
    property SubUnitDocumentCount: Integer read GetSubUnitDocumentCount;
  end;

  // PUnitStubDocument
  PUMLUnitStubDocument = class(PUMLDocument)
  private
    FParentUnitDocument: PUMLUnitDocument;
    FPackageStub: PUMLPackage;
    FPackageStubOwner: PUMLPackage;
    FFileDir: string;
    procedure SetParentUnitDocument(Value: PUMLUnitDocument);
    function GetParentUnitDocument: PUMLUnitDocument;
    function GetFilePath: string;
  public
    constructor Create; override;
    procedure Setup(AOwner: PUMLPackage; AParentUnit: PUMLUnitDocument;
      AFileName: string; AFileDir: string);
    destructor Destroy; override;
    property PackageStub: PUMLPackage read FPackageStub;
    property PackageStubOwner: PUMLPackage read FPackageStubOwner;
    property ParentUnitDocument: PUMLUnitDocument read GetParentUnitDocument write SetParentUnitDocument;
    property FullFilePath: string read GetFilePath;
  end;
              
  // PProjectDocument
  PUMLProjectDocument = class(PUMLUnitDocument)
  private
    FProfiles: TStringList;
    function GetProfile(Index: Integer): string;
    function GetProfileCount: Integer;
  public
    constructor Create; override;
    destructor Destroy; override;
    function GetDocumentSymbol: string; override;
    procedure ClearProfiles;
    procedure AddProfile(AProfileName: string);
    procedure RemoveProfile(AProfileName: string);
    function IndexOfProfile(AProfileName: string): Integer;
    property Profiles[Index: Integer]: string read GetProfile;
    property ProfileCount: Integer read GetProfileCount;
  end;

  // PModelFragmentDocument
  PUMLModelFragmentDocument = class(PUMLDocument)
  public
    function GetDocumentSymbol: string; override;
  end;

  // PUnitDocumentInputStream
  PUMLUnitDocumentInputStream = class(PUMLDocumentInputStream)
  private
    FHeaderSubUnitTable: PTable;
  protected
    function CreateDocument: PDocument; override;
    procedure ReadHeader(HeaderNode: IXMLNode); override;
  public
    constructor Create(AFileName: string; AReferenceResolver: PReferenceResolver); override;
    destructor Destroy; override;
    property HeaderSubUnitTable: PTable read FHeaderSubUnitTable;
  end;

  // PUnitDocumentOutputStream_
  PUMLUnitDocumentOutputStream = class(PUMLDocumentOutputStream)
  private
    function GetSubUnitsStartNode: string;
    function GetSubUnitsEndNode: string;
    function GetUnitStartNode(Owner, Index: string): string;
    function GetUnitEndNode: string;
  protected
    function GetDocumentSymbol: string; override;
    function GetDocumentVersion: Integer; override;
    procedure WriteHeader(ADocument: PDocument); override;
  end;

  // PUnitDocumentOutputStream__
  {
  PUnitDocumentOutputStream__ = class(PDocumentOutputStream__)
  protected
    function GetDocumentSymbol: string; override;
    function GetDocumentVersion: Integer; override;
    procedure WriteHeader(HeaderNode: IXMLNode; ADocument: PDocument); override;
  end;
  }

  // PProjectDocumentInputStream
  PUMLProjectDocumentInputStream = class(PUMLUnitDocumentInputStream)
  private
    FHeaderProfiles: TStringList;
  protected
    function CreateDocument: PDocument; override;
    procedure ReadHeader(HeaderNode: IXMLNode); override;
  public
    constructor Create(AFileName: string; AReferenceResolver: PReferenceResolver); override;
    destructor Destroy; override;
    property HeaderProfiles: TStringList read FHeaderProfiles;
  end;

  // PProjectDocumentOutputStream_
  PUMLProjectDocumentOutputStream = class(PUMLUnitDocumentOutputStream)
  private
    function GetProfilesStartNode: string;
    function GetProfilesEndNode: string;
    function GetProfileStartNode: string;
    function GetProfileEndNode: string;
  protected
    function GetDocumentSymbol: string; override;
    function GetDocumentVersion: Integer; override;
    procedure WriteHeader(ADocument: PDocument); override;
  end;

{
  // PProjectDocumentOutputStream__
  PProjectDocumentOutputStream__ = class(PUnitDocumentOutputStream__)
  protected
    function GetDocumentSymbol: string; override;
    function GetDocumentVersion: Integer; override;
    procedure WriteHeader(HeaderNode: IXMLNode; ADocument: PDocument); override;
  end;
}

  // PModelFragmentDocumentInputStream
  PUMLModelFragmentDocumentInputStream = class(PUMLDocumentInputStream)
  protected
    function CreateDocument: PDocument; override;
  end;

  // PModelFragmentDocumentOutputStream_
  PUMLModelFragmentDocumentOutputStream = class(PUMLDocumentOutputStream)
  protected
    function GetDocumentSymbol: string; override;
    function GetDocumentVersion: Integer; override;
  end;

{
  // PModelFragmentDocumentOutputStream__
  PModelFragmentDocumentOutputStream__ = class(PDocumentOutputStream__)
  protected
    function GetDocumentSymbol: string; override;
    function GetDocumentVersion: Integer; override;
  end;
}
  // Procedures and functions
  function UMLElementToExpression(AModel: PUMLElement;
    ShowStereotype: Boolean = True; ShowVisibility: Boolean = True;
    ShowParentName: Boolean = False; FullExpression: Boolean = True): string;
  procedure CollectAllAncestors(StartModel: PUMLGeneralizableElement; Ancestors: PModelOrderedSet);
  procedure CollectAllItems(AModel: PModel; CollectionName: string; ResultItems: PModelOrderedSet);
  procedure CollectAllInheritedItems(AModel: PUMLGeneralizableElement; CollectionName: string; ResultItems: PModelOrderedSet);
  procedure CheckNameConflict(Model: PModel; Name: string);
  procedure PreinspectClassifierNameConflict(Owner: PUMLNamespace; Name: string);
  function IncludeRelationsOf(AModel: PModel; ModelSet: PModelOrderedSet): Boolean;
  function GetOwnerPackage(M: PModel): PUMLPackage;
  function GetOwnerDiagramView(AView: PView): PDiagramView;
  function SearchElement(SearchFrom: PUMLElement; Name: string; TypeName: string = 'UMLClassifier'): PUMLElement;
  function GetUMLElementImageIndex(AModel: PModel; PackageState: Boolean = True;
    FeatureVisibility: Boolean = True; UninterpretedActionState: Boolean = True): Integer;
  function CheckLinkable(DiagramView: PDiagramView; ElementKind: string; End1, End2: PView; var Msg: string): Boolean;
  function IsValidConnection(Edge: PEdgeView; End1, End2: PView): Boolean;

implementation

uses
  System.Types, Variants, UMLViews, NLS_StarUML, UMLFacto;

procedure PUMLDocumentOutputStream.IsFiltered(Obj: PObject; Key: string; var CanFilter: Boolean);
begin
  inherited;
  if Obj is PView then begin
    if (Key = 'LineColor') and (Obj as PView).ParentLineColor then CanFilter := True;
    if (Key = 'FillColor') and (Obj as PView).ParentFillColor then CanFilter := True;
    if (Key = 'FontFace') and (Obj as PView).ParentFontFace then CanFilter := True;
    if (Key = 'FontSize') and (Obj as PView).ParentFontSize then CanFilter := True;
    if (Key = 'FontColor') and (Obj as PView).ParentFontColor then CanFilter := True;
    if (Key = 'FontStyle') and (Obj as PView).ParentFontStyle then CanFilter := True;
    if (Key = 'Left') and not (Obj as PView).Selectable then CanFilter := True;
    if (Key = 'Top') and not (Obj as PView).Selectable then CanFilter := True;
    if (Key = 'Width') or (Key = 'Height') then begin
      if (Obj is PLabelView) then
        CanFilter := not (Obj as PLabelView).WordWrap // Don't filter dims of a wrapped label
      else
        CanFilter := not (Obj as PView).Selectable;
    end;
    //if (Key = 'Width') and not (Obj as PView).Selectable then
    //if (Key = 'Height') and not (Obj as PView).Selectable then CanFilter := True;
     if (Key = 'OwnerDiagramView') then CanFilter := True;
  end;
  if Obj is PParasiticView then begin
    if Key = 'Left' then CanFilter := True;
    if Key = 'Top' then CanFilter := True;
  end;
  if Obj is PEdgeLabelView then begin
    if Key = 'Width' then CanFilter := True;
    if Key = 'Height' then CanFilter := True;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
// PUnitDocument

constructor PUMLUnitDocument.Create;
begin
  inherited;
  FParentUnitDocument := nil;
  FSubUnitDocuments := TList.Create;
end;

destructor PUMLUnitDocument.Destroy;
var
  I: Integer;
  D: PUMLUnitDocument;
begin
  ParentUnitDocument := nil;
  for I := FSubUnitDocuments.Count - 1 downto 0 do begin
    D := FSubUnitDocuments.Items[I];
    D.Free;
  end;
  FSubUnitDocuments.Free;
  inherited;
end;

function PUMLUnitDocument.GetDocumentSymbol: string;
begin
  Result := XPD_UNIT;
end;

procedure PUMLUnitDocument.SetParentUnitDocument(Value: PUMLUnitDocument);
begin
  if FParentUnitDocument <> Value then begin
    if FParentUnitDocument <> nil then FParentUnitDocument.FSubUnitDocuments.Remove(Self);
    FParentUnitDocument := Value;
    if Value <> nil then Value.FSubUnitDocuments.Add(Self);
  end;
end;

function PUMLUnitDocument.GetSubUnitDocument(Index: Integer): PUMLUnitDocument;
begin
  Result := FSubUnitDocuments.Items[Index];
end;

function PUMLUnitDocument.GetSubUnitDocumentCount: Integer;
begin
  Result := FSubUnitDocuments.Count;
end;

procedure PUMLUnitDocument.AddSubUnitDocument(AUnitDocument: PUMLUnitDocument);
begin
  if AUnitDocument <> nil then begin
    if AUnitDocument.FParentUnitDocument <> nil then
      AUnitDocument.FParentUnitDocument.FSubUnitDocuments.Remove(AUnitDocument);
    FSubUnitDocuments.Add(AUnitDocument);
    AUnitDocument.FParentUnitDocument := Self;
  end;
end;

procedure PUMLUnitDocument.RemoveSubUnitDocument(AUnitDocument: PUMLUnitDocument);
begin
  if AUnitDocument <> nil then begin
    FSubUnitDocuments.Remove(AUnitDocument);
    AUnitDocument.FParentUnitDocument := nil;
  end;
end;

// PUnitDocument
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUnitStubDocument

constructor PUMLUnitStubDocument.Create;
begin
  inherited;
  FParentUnitDocument := nil;
end;

procedure PUMLUnitStubDocument.Setup(AOwner: PUMLPackage; AParentUnit: PUMLUnitDocument;
  AFileName: string; AFileDir: string);
begin
  ParentUnitDocument := AParentUnit;
  FileName := AFileName;
  FFileDir := AFileDir;
  FPackageStubOwner := AOwner;
  FPackageStub := UMLFactory.CreateModel(AOwner, 'Package') as PUMLPackage;
  FPackageStub.Name := Format('Unloaded unit: %s',[AFileName]);
  FPackageStub.Document := Self;
  DocumentElement := PackageStub;


end;

destructor PUMLUnitStubDocument.Destroy;
begin
  ParentUnitDocument := nil;
  FreeAndNil(FPackageStub);
  DocumentElement := nil;
  inherited;
end;

function PUMLUnitStubDocument.GetFilePath: string;
begin
  Result := FFileDir + FileName;
end;

function PUMLUnitStubDocument.GetParentUnitDocument: PUMLUnitDocument;
begin
  Result := FParentUnitDocument;
end;

procedure PUMLUnitStubDocument.SetParentUnitDocument(Value: PUMLUnitDocument);
begin
  if FParentUnitDocument <> Value then begin
    // Clear existing parent unit doc
    if Assigned(FParentUnitDocument) then
      FParentUnitDocument.FSubUnitDocuments.Remove(Self);
    // Set new value of parent unit doc
    FParentUnitDocument := Value;
    if Assigned(Value) then
      Value.FSubUnitDocuments.Add(Self);
  end;
end;

// PUnitStubDocument
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// PProjectDocument

constructor PUMLProjectDocument.Create;
begin
  inherited;
  FProfiles := TStringList.Create;
end;

destructor PUMLProjectDocument.Destroy;
begin
  FProfiles.Free;
  inherited;
end;

function PUMLProjectDocument.GetProfile(Index: Integer): string;
begin
  Result := FProfiles[Index];
end;

function PUMLProjectDocument.GetProfileCount: Integer;
begin
  Result := FProfiles.Count;
end;

function PUMLProjectDocument.GetDocumentSymbol: string;
begin
  Result := XPD_PROJECT;
end;

procedure PUMLProjectDocument.ClearProfiles;
begin
  FProfiles.Clear;
end;

procedure PUMLProjectDocument.AddProfile(AProfileName: string);
begin
  if IndexOfProfile(AProfileName) < 0 then
    FProfiles.Add(AProfileName);
end;

procedure PUMLProjectDocument.RemoveProfile(AProfileName: string);
var
  Idx: Integer;
begin
  Idx := IndexOfProfile(AProfileName);
  if  Idx > -1 then FProfiles.Delete(Idx);
end;

function PUMLProjectDocument.IndexOfProfile(AProfileName: string): Integer;
begin
  Result := FProfiles.IndexOf(AProfileName);
end;

// PProjectDocument
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PModelFragmentDocument

function PUMLModelFragmentDocument.GetDocumentSymbol: string;
begin
  Result := XPD_MODELFRAGMENT;
end;

// PModelFragmentDocument
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUnitDocumentInputStream

constructor PUMLUnitDocumentInputStream.Create(AFileName: string; AReferenceResolver: PReferenceResolver);
begin
  inherited Create(AFileName, AReferenceResolver);
  FHeaderSubUnitTable := PTable.Create(['FileName', 'Owner', 'Index']);
end;

destructor PUMLUnitDocumentInputStream.Destroy;
begin
  FHeaderSubUnitTable.Free;
  inherited;
end;

function PUMLUnitDocumentInputStream.CreateDocument: PDocument;
begin
  Result := PUMLUnitDocument.Create;
end;

procedure PUMLUnitDocumentInputStream.ReadHeader(HeaderNode: IXMLNode);
var
  I: Integer;
  UnitFileName, Owner, Index: string;
  SubUnitsNode: IXMLNode;
begin
  FHeaderSubUnitTable.Clear;
  SubUnitsNode := HeaderNode.ChildNodes.Nodes[XPD_SUBUNITS];
  with SubUnitsNode.ChildNodes do
    for I := 0 to Count - 1 do
    begin
      if Nodes[I].NodeType = ntComment then
        Continue; // Ignore comments

      if VarIsNull(Nodes[I].NodeValue) then
        UnitFileName := ''
      else
        UnitFileName := Nodes[I].NodeValue;
      if VarIsNull(Nodes[I].Attributes[XPD_UNIT_OWNER]) then
        Owner := ''
      else
        Owner := Nodes[I].Attributes[XPD_UNIT_OWNER];
      if VarIsNull(Nodes[I].Attributes[XPD_UNIT_INDEX]) then
        Index := ''
      else
        Index := Nodes[I].Attributes[XPD_UNIT_INDEX];
      FHeaderSubUnitTable.AddRow([UnitFileName, Owner, Index]);
    end;
end;

// PUnitDocumentInputStream
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUnitDocumentOutputStream

function PUMLUnitDocumentOutputStream.GetSubUnitsStartNode: string;
begin
  Result := '<' + XPD_PREFIX + ':' + XPD_SUBUNITS + '>';
end;

function PUMLUnitDocumentOutputStream.GetSubUnitsEndNode: string;
begin
  Result := '</' + XPD_PREFIX + ':' + XPD_SUBUNITS + '>';
end;

function PUMLUnitDocumentOutputStream.GetUnitStartNode(Owner, Index: string): string;
var
  S: string;
begin
  S := '<' + XPD_PREFIX + ':' + XPD_UNIT;
  if Owner <> '' then
    S := S + ' ' + XPD_UNIT_OWNER + '="' + Owner + '"';
  if Index <> '' then
    S := S + ' ' + XPD_UNIT_INDEX + '="' + Index + '"';
  S := S + '>';
  Result := S;
end;

function PUMLUnitDocumentOutputStream.GetUnitEndNode: string;
begin
  Result := '</' + XPD_PREFIX + ':' + XPD_UNIT + '>';
end;

function PUMLUnitDocumentOutputStream.GetDocumentSymbol: string;
begin
  Result := XPD_UNIT;
end;

function PUMLUnitDocumentOutputStream.GetDocumentVersion: Integer;
begin
  Result := 1;
end;

procedure PUMLUnitDocumentOutputStream.WriteHeader(ADocument: PDocument);
var
  I: Integer;
  S: string;
  OwnerGuid: string;
  Index: string;
  M: PUMLPackage;
begin
  XMLStrings.Add(GetSubUnitsStartNode);
  with ADocument as PUMLUnitDocument do
  begin
    for I := 0 to SubUnitDocumentCount - 1 do
    begin
      OwnerGuid := '';
      Index := '';
      if SubUnitDocuments[I].DocumentElement is PUMLPackage then
      begin
        M := SubUnitDocuments[I].DocumentElement as PUMLPackage;
        if M.Namespace <> nil then
        begin
          OwnerGuid := M.Namespace.GUID;
          Index := IntToStr(M.Namespace.IndexOfOwnedElement(M));
        end;
      end;
      S := GetUnitStartNode(OwnerGuid, Index)
        + ExtractRelativePath(ADocument.FileName, SubUnitDocuments[I].FileName)
        + GetUnitEndNode;
      XMLStrings.Add(S);
    end;
  end;
  XMLStrings.Add(GetSubUnitsEndNode);
end;

// PUnitDocumentOutputStream
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUnitDocumentOutputStream__

{
function PUnitDocumentOutputStream__.GetDocumentSymbol: string;
begin
  Result := XPD_UNIT;
end;

function PUnitDocumentOutputStream__.GetDocumentVersion: Integer;
begin
  Result := 1;
end;

procedure PUnitDocumentOutputStream__.WriteHeader(HeaderNode: IXMLNode; ADocument: PDocument);
var
  I: Integer;
  SubUnitsNode: IXMLNode;
  N: IXMLNode;
begin
  SubUnitsNode := HeaderNode.AddChild(XPD_SUBUNITS);
  with ADocument as PUnitDocument do begin
    for I := 0 to SubUnitDocumentCount - 1 do begin
      N := SubUnitsNode.AddChild(XPD_UNIT);
      N.NodeValue := SubUnitDocuments[I].FileName;
    end;
  end;
end;
}

// PUnitDocumentOutputStream__
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PProjectDocumentInputStream

constructor PUMLProjectDocumentInputStream.Create(AFileName: string; AReferenceResolver: PReferenceResolver);
begin
  inherited Create(AFileName, AReferenceResolver);
  FHeaderProfiles := TStringList.Create;
end;

destructor PUMLProjectDocumentInputStream.Destroy;
begin
  FHeaderProfiles.Free;
  inherited;
end;

function PUMLProjectDocumentInputStream.CreateDocument: PDocument;
begin
  Result := PUMLProjectDocument.Create;
end;

procedure PUMLProjectDocumentInputStream.ReadHeader(HeaderNode: IXMLNode);
var
  I: Integer;
  S: string;
  ProfilesNode: IXMLNode;
begin
  inherited;
  FHeaderProfiles.Clear;
  ProfilesNode := HeaderNode.ChildNodes.Nodes[XPD_PROFILES];
  for I := 0 to ProfilesNode.ChildNodes.Count - 1 do begin
    S := ProfilesNode.ChildNodes.Nodes[I].NodeValue;
    FHeaderProfiles.Add(S);
  end;
end;

// PProjectDocumentInputStream
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PProjectDocumentOutputStream

function PUMLProjectDocumentOutputStream.GetProfilesStartNode: string;
begin
  Result := '<' + XPD_PREFIX + ':' + XPD_PROFILES + '>';
end;

function PUMLProjectDocumentOutputStream.GetProfilesEndNode: string;
begin
  Result := '</' + XPD_PREFIX + ':' + XPD_PROFILES + '>';
end;

function PUMLProjectDocumentOutputStream.GetProfileStartNode: string;
begin
  Result := '<' + XPD_PREFIX + ':' + XPD_PROFILE + '>';
end;

function PUMLProjectDocumentOutputStream.GetProfileEndNode: string;
begin
  Result := '</' + XPD_PREFIX + ':' + XPD_PROFILE + '>';
end;

function PUMLProjectDocumentOutputStream.GetDocumentSymbol: string;
begin
  Result := XPD_PROJECT;
end;

function PUMLProjectDocumentOutputStream.GetDocumentVersion: Integer;
begin
  Result := 1;
end;

procedure PUMLProjectDocumentOutputStream.WriteHeader(ADocument: PDocument);
var
  I: Integer;
  S: string;
begin
  inherited;
  // Writing included profiles.
  XMLStrings.Add(GetProfilesStartNode);
  with ADocument as PUMLProjectDocument do begin
    for I := 0 to ProfileCount - 1 do begin
      S := GetProfileStartNode + Profiles[I] + GetProfileEndNode;
      XMLStrings.Add(S);
    end;
  end;
  XMLStrings.Add(GetProfilesEndNode);
end;

// PProjectDocumentOutputStream
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PProjectDocumentOutputStream__

{
function PProjectDocumentOutputStream__.GetDocumentSymbol: string;
begin
  Result := XPD_PROJECT;
end;

function PProjectDocumentOutputStream__.GetDocumentVersion: Integer;
begin
  Result := 1;
end;

procedure PProjectDocumentOutputStream__.WriteHeader(HeaderNode: IXMLNode; ADocument: PDocument);
var
  I: Integer;
  ProfilesNode: IXMLNode;
  N: IXMLNode;
begin
  inherited;
  ProfilesNode := HeaderNode.AddChild(XPD_PROFILES);
  with ADocument as PProjectDocument do begin
    for I := 0 to ProfileCount - 1 do begin
      N := ProfilesNode.AddChild(XPD_PROFILE);
      N.NodeValue := Profiles[I];
    end;
  end;
end;
}

// PProjectDocumentOutputStream__
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PModelFragmentDocumentInputStream

function PUMLModelFragmentDocumentInputStream.CreateDocument: PDocument;
begin
  Result := PUMLModelFragmentDocument.Create;
end;

// PModelFragmentDocumentInputStream
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PModelFragmentDocumentOutputStream

function PUMLModelFragmentDocumentOutputStream.GetDocumentSymbol: string;
begin
  Result := XPD_MODELFRAGMENT;
end;

function PUMLModelFragmentDocumentOutputStream.GetDocumentVersion: Integer;
begin
  Result := 1;
end;

// PModelFragmentDocumentOutputStream
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PModelFragmentDocumentOutputStream__

{
function PModelFragmentDocumentOutputStream__.GetDocumentSymbol: string;
begin
  Result := XPD_MODELFRAGMENT;
end;

function PModelFragmentDocumentOutputStream__.GetDocumentVersion: Integer;
begin
  Result := 1;
end;
}

// PModelFragmentDocumentOutputStream__
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Procedures and functions

function UMLElementToExpression(AModel: PUMLElement;
  ShowStereotype: Boolean = True; ShowVisibility: Boolean = True;
  ShowParentName: Boolean = False; FullExpression: Boolean = True): string;
var
  S, ParentName: string;

  function VisibilityNotation(VK: PUMLVisibilityKind): string;
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

  function GetAttributeRestExpr(M: PUMLAttribute): string;
  var
    S: string;
  begin
    S := '';
    if Assigned(M.Type_) then S := S + ': ' + M.Type_.Name
    else if Trim(M.TypeExpression) <> '' then S := S + ': ' + Trim(M.TypeExpression);
    if Trim(M.InitialValue) <> '' then S := S + ' = ' + Trim(M.InitialValue);
    Result := S;
  end;

  function GetOperationSignature(M: PUMLOperation): string;
  var
    MParam: PUMLParameter;
    S: string;
    RetStr: string;
    Sig, Ret: Boolean;
    I: Integer;
  begin
    S := '';
    // Signature
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
    if RetStr <> '' then S := S + ': ' + RetStr;
    Result := S;
  end;

  function GetTemplateParameterRestExpr(M: PUMLTemplateParameter): string;
  var
    S: string;
  begin
    S := '';
    if M.ParameterType <> '' then
      S := S + ': ' + M.ParameterType;
    if M.DefaultValue <> '' then
      S := S + ' = ' + M.DefaultValue;
    Result := S;
  end;

begin
  S := '';
  // Stereotype
  if ShowStereotype then begin
    if AModel.StereotypeName <> '' then
      S := S + '<<' + AModel.StereotypeName + '>> ';
  end;
  // Visibility Symbol
  if (AModel is PUMLModelElement) and ShowVisibility then begin
    S := S + VisibilityNotation((AModel as PUMLModelElement).Visibility);
  end;
  // ParentName and Name
  if ShowParentName then
  begin
    if AModel.VirtualNamespace <> nil then
      ParentName := AModel.VirtualNamespace.Name + '::'
    else
      ParentName := '';
    S := S + ParentName + AModel.Name;
  end
  else begin
    S := S + AModel.Name;
  end;
  // FullExpression
  if FullExpression then
  begin
    if AModel is PUMLAttribute then begin
      S := S + GetAttributeRestExpr(AModel as PUMLAttribute);
    end
    else if AModel is PUMLOperation then begin
      S := S + GetOperationSignature(AModel as PUMLOperation);
    end
    else if AModel is PUMLTemplateParameter then begin
      S := S + GetTemplateParameterRestExpr(AModel as PUMLTemplateParameter);
    end;
  end
  else begin
    if AModel is PUMLOperation then
    begin
      S := S + '()';
    end;
  end;
  Result := S;
end;

procedure CollectAllAncestors(StartModel: PUMLGeneralizableElement; Ancestors: PModelOrderedSet);
var
  I, J, C: Integer;
  M: PUMLGeneralizableElement;
  D: PUMLDependency;
begin
  Ancestors.Add(StartModel);
  repeat
    C := Ancestors.Count;
    for I := 0 to Ancestors.Count - 1 do
    begin
      M := Ancestors.Items[I] as PUMLGeneralizableElement;
      for J := 0 to M.GeneralizationCount - 1 do
        Ancestors.Add(M.Generalizations[J].Parent);
      for J := 0 to M.ClientDependencyCount - 1 do
      begin
        D := M.ClientDependencies[J];
        if (D is PUMLRealization) and (D.Supplier is PUMLGeneralizableElement) then
          Ancestors.Add(M.ClientDependencies[J].Supplier);
      end;
    end;
  until (Ancestors.Count = C);
end;

procedure CollectAllItems(AModel: PModel; CollectionName: string; ResultItems: PModelOrderedSet);
var
  I: Integer;
  Model: PModel;
begin
  for I := 0 to AModel.MOF_GetCollectionCount(CollectionName) - 1 do begin
    Model := AModel.MOF_GetCollectionItem(CollectionName, I) as PModel;
    Assert((Model <> nil), 'Collection item is not of type PModel');
    ResultItems.Add(Model);
  end;
end;

procedure CollectAllInheritedItems(AModel: PUMLGeneralizableElement; CollectionName: string; ResultItems: PModelOrderedSet);
var
  I, J: Integer;
  BaseModels: PModelOrderedSet;
  E, E2: PModel;

begin
  BaseModels := PModelOrderedSet.Create;
  BaseModels.Clear;
  try
    CollectAllAncestors(AModel, BaseModels);
    for E in BaseModels do
    begin
      if E.MetaClass.ExistsCollection(CollectionName) then
        for J := 0 to E.MOF_GetCollectionCount(CollectionName) - 1 do
        begin
          E2 := E.MOF_GetCollectionItem(CollectionName, J) as PModel;
          ResultItems.Add(E2);
        end;
    end;
  finally
    BaseModels.Free;
  end;
end;

// -----------------------------------------------------------------------------
// - detect Name collision in only Namespace and consider collision
// - for only the Classifier type
// -----------------------------------------------------------------------------
procedure CheckNameConflict(Model: PModel; Name: string);
var
  I: Integer;
  M: PModel;
begin
  if (Name <> '') and
     (Model is PUMLClassifier) and
     ((Model as PUMLModelElement).Namespace <> nil) then
  begin
    for I := 0 to (Model as PUMLClassifier).Namespace.OwnedElementCount - 1 do
    begin
      M := (Model as PUMLClassifier).Namespace.OwnedElements[I];
      if M.Name = Name then
        raise ENameConflict.Create(ERR_NAME_CONFLICT);
    end;
  end;
end;

// -----------------------------------------------------------------------------
// inspect model whose name is same in Namespace to exist
// -----------------------------------------------------------------------------
procedure PreinspectClassifierNameConflict(Owner: PUMLNamespace; Name: string);
var
  I: Integer;
  M: PModel;
begin
  for I := 0 to Owner.OwnedElementCount - 1 do
    M := Owner.OwnedElements[I];
    if (M is PUMLClassifier) and (M.Name = Name) then
      raise ENameConflict.Create(ERR_NAME_CONFLICT);
end;

// ---------------------------------------------------------------------------
// add relation models connected to model into set
// ---------------------------------------------------------------------------
function IncludeRelationsOf(AModel: PModel; ModelSet: PModelOrderedSet): Boolean;
var
  C, I: Integer;
begin
  C := ModelSet.Count;
  // for Dependency
  if AModel is PUMLModelElement then begin
    with AModel as PUMLModelElement do begin
      for I := 0 to ClientDependencyCount - 1 do
        ModelSet.Add(ClientDependencies[I]);
      for I := 0 to SupplierDependencyCount - 1 do
        ModelSet.Add(SupplierDependencies[I]);
    end;
  end;
  // for Generalization
  if AModel is PUMLGeneralizableElement then begin
    with AModel as PUMLGeneralizableElement do begin
      for I := 0 to GeneralizationCount - 1 do
        ModelSet.Add(Generalizations[I]);
      for I := 0 to SpecializationCount - 1 do
        ModelSet.Add(Specializations[I]);
    end;
  end;
  // for Association, AssociationRole
  if AModel is PUMLClassifier then begin
    with AModel as PUMLClassifier do begin
      for I := 0 to AssociationCount - 1 do
        ModelSet.Add(Associations[I].Association);
    end;
  end;
  // for Message
  if AModel is PUMLClassifierRole then begin
    with AModel as PUMLClassifierRole do begin
      for I := 0 to SenderClientMessageCount - 1 do
        ModelSet.Add(SenderClientMessages[I]);
      for I := 0 to ReceiverClientMessageCount - 1 do
        ModelSet.Add(ReceiverClientMessages[I]);
    end;
  end;
  // for Link, Stimulus
  if AModel is PUMLInstance then begin
    with AModel as PUMLInstance do begin
      for I := 0 to LinkEndCount - 1 do
        ModelSet.Add(LinkEnds[I].Link);
      for I := 0 to SendingStimulusCount - 1 do
        ModelSet.Add(SendingStimuli[I]);
      for I := 0 to ReceivingStimulusCount - 1 do
        ModelSet.Add(ReceivingStimuli[I]);
    end;
  end;
  // for Include, Extend
  if AModel is PUMLUseCase then begin
    with AModel as PUMLUseCase do begin
      for I := 0 to ExtenderCount - 1 do
        ModelSet.Add(Extenders[I]);
      for I := 0 to ExtendCount - 1 do
        ModelSet.Add(Extends[I]);
      for I := 0 to IncluderCount - 1 do
        ModelSet.Add(Includers[I]);
      for I := 0 to IncludeCount - 1 do
        ModelSet.Add(Includes[I]);
    end;
  end;
  // for AssociationClass
  if AModel is PUMLClass then begin
    if (AModel as PUMLClass).AssociationClass <> nil then
      ModelSet.Add((AModel as PUMLClass).AssociationClass);
  end;
  // for AssociationClass
  if AModel is PUMLAssociation then begin
    if (AModel as PUMLAssociation).AssociationClass <> nil then
      ModelSet.Add((AModel as PUMLAssociation).AssociationClass);
  end;
  // for Transition
  if AModel is PUMLStateVertex then begin
    with AModel as PUMLStateVertex do begin
      for I := 0 to IncomingCount - 1 do
        ModelSet.Add(Incomings[I]);
      for I := 0 to OutgoingCount - 1 do
        ModelSet.Add(Outgoings[I]);
    end;
  end;
  // for Connector
  if AModel is PUMLFeature then begin
    with AModel as PUMLFeature do begin
      for I := 0 to ConnectorEndCount - 1 do
        ModelSet.Add(ConnectorEnds[I].Connector);
    end;
  end;
  Result := (ModelSet.Count <> C);
end;


// -----------------------------------------------------------------------------
// get Package element containing model M
// -----------------------------------------------------------------------------
function GetOwnerPackage(M: PModel): PUMLPackage;
begin
  if M = nil then
    Result := nil
  else if M.VirtualNamespace is PUMLPackage then
    Result := M.VirtualNamespace as PUMLPackage
  else
    Result := GetOwnerPackage(M.VirtualNamespace);
end;

// -----------------------------------------------------------------------------
// function to get owner diagramview
// -----------------------------------------------------------------------------
function GetOwnerDiagramView(AView: PView): PDiagramView;
begin
  Result := nil;
  if AView.OwnerDiagramView <> nil then begin
    Result := AView.OwnerDiagramView;
    Exit;
  end;
  if AView.ContainerView <> nil then
    Result := GetOwnerDiagramView(AView.ContainerView)
  else if AView.Parent <> nil then
    Result := GetOwnerDiagramView(AView.Parent);
end;

// -----------------------------------------------------------------------------
// function to search element at some position
// -----------------------------------------------------------------------------
function SearchElement(SearchFrom: PUMLElement; Name: string; TypeName: string = 'UMLClassifier'): PUMLElement;
var
  I: Integer;
  D: PUMLDependency;
  P: PUMLPackage;
  MetaClassOfType: PMetaClass;
  M, Base: PModel;

  function FindInNamespace(N: string; ANamespace: PUMLNamespace; var FoundElement: PUMLElement): Boolean;
  var
    I: Integer;
    E: PUMLElement;
  begin
    Result := False;
    for I := 0 to ANamespace.OwnedElementCount - 1 do
    begin
      E := ANamespace.OwnedElements[I];
      if E.Name = N then
      begin
        FoundElement := E;
        Result := True;
        Exit;
      end;
    end;
  end;

begin
  // (1) Search in Namespace of SearchFrom
  if SearchFrom is PUMLNamespace then
  begin
    if FindInNamespace(Name, SearchFrom as PUMLNamespace, Result) then Exit;
  end;
  // (2) Search in Package containing SearchFrom
  P := GetOwnerPackage(SearchFrom);
  if P <> nil then
  begin
    if FindInNamespace(Name, P, Result) then Exit;
  end;
  // (3) for <<access>>, <<import>> dependencies of Package containing SearchFrom
  //     - if Supplier is a Package: Find by element's name in Package
  //       (e.g. in case of importing Package)
  //     - if Supplier is not a Package but a Classifier: Find by current element's Name
  //       (e.g. in case of importing Class directly)
  if P <> nil then
  begin
    for I := 0 to P.ClientDependencyCount - 1 do
    begin
      D := P.ClientDependencies[I];
      if (LowerCase(D.StereotypeName) = 'access') or (LowerCase(D.StereotypeName) = 'import') then
      begin
        if D.Supplier is PUMLPackage then
        begin
          if FindInNamespace(Name, D.Supplier as PUMLPackage, Result) then Exit;
        end
        else if D.Supplier is PUMLClassifier then
        begin
          if D.Supplier.Name = Name then
          begin
            Result := D.Supplier;
            Exit;
          end;
        end;
      end;
    end;
  end;
  // (4) find in instaces of MetaClass corresponding to TypeName in MetaModel
  MetaClassOfType := MetaModel.FindMetaClass(TypeName);
  if MetaClassOfType <> nil then
  begin
    for I := 0 to MetaClassOfType.InclusiveInstanceCount - 1 do
      if (MetaClassOfType.InclusiveInstances[I] as PUMLElement).Name = Name then
      begin
        Result := MetaClassOfType.InclusiveInstances[I] as PUMLElement;
        Exit;
      end;
  end;
  // (5) regard Name as Fullpath Name and  find in RootModel,that is, Project
  //     (Fullpath Name is starting with "::", "::" is optional
  if not (Copy(Name, 1, 2) = '::') then Name := '::' + Name;
  Base := SearchFrom.RootModel;
  if Base <> nil then
  begin
    M := Base.FindByRelativePathname(ExtractTailPath(Name));
    if (M <> nil) and (M is PUMLElement) then
    begin
      Result := M as PUMLElement;
      Exit;
    end;
  end;
  // if after all not found, nil
  Result := nil;
end;

function GetUMLElementImageIndex(AModel: PModel; PackageState: Boolean = True;
  FeatureVisibility: Boolean = True; UninterpretedActionState: Boolean = True): Integer;
begin
  Result := IMG_INDEX_UNKNOWN;
  if AModel is PUMLProject then begin
    if PackageState and (AModel as PUMLPackage).Document.ReadOnly then
      Result := IMG_INDEX_PROJECT_LOCKED
    else
      Result := IMG_INDEX_PROJECT
  end
  else if AModel is PUMLModel then begin
    if PackageState and (AModel as PUMLModel).IsDocumentElement then begin
      if (AModel as PUMLModel).Document.ReadOnly then
        Result := IMG_INDEX_MODEL_SEPERATED_LOCKED
      else
        Result := IMG_INDEX_MODEL_SEPERATED;
    end
    else
      Result := IMG_INDEX_MODEL;
  end
  else if AModel is PUMLSubsystem then begin
    if PackageState and (AModel as PUMLSubSystem).IsDocumentElement then begin
      if (AModel as PUMLSubSystem).Document.ReadOnly then
        Result := IMG_INDEX_SUBSYSTEM_SEPERATED_LOCKED
      else
        Result := IMG_INDEX_SUBSYSTEM_SEPERATED;
    end
    else
      Result := IMG_INDEX_SUBSYSTEM;
  end
  else if AModel is PUMLPackage then begin
    if PackageState and (AModel as PUMLPackage).IsDocumentElement then begin
      if (AModel as PUMLPackage).Document.ReadOnly then
        Result := IMG_INDEX_PACKAGE_SEPERATED_LOCKED
      else
        Result := IMG_INDEX_PACKAGE_SEPERATED;
    end
    else
      Result := IMG_INDEX_PACKAGE;
  end
  else if AModel is PUMLClass then
    Result := IMG_INDEX_CLASS
  else if AModel is PUMLInterface then
    Result := IMG_INDEX_INTERFACE
  else if AModel is PUMLEnumeration then
    Result := IMG_INDEX_ENUMERATION
  else if AModel is PUMLException then
    Result := IMG_INDEX_EXCEPTION
  else if AModel is PUMLSignal then
    Result := IMG_INDEX_SIGNAL

  else if AModel is PUMLComponent then
    Result := IMG_INDEX_COMPONENT
  else if AModel is PUMLComponentInstance then
    Result := IMG_INDEX_COMPONENTINSTANCE
  else if AModel is PUMLNode then
    Result := IMG_INDEX_NODE
  else if AModel is PUMLNodeInstance then
    Result := IMG_INDEX_NODEINSTANCE

  else if AModel is PUMLUsecase then
    Result := IMG_INDEX_USECASE
  else if AModel is PUMLActor then
    Result := IMG_INDEX_ACTOR

  else if AModel is PUMLActivityGraph then
    Result := IMG_INDEX_ACTIVITYGRAPH
  else if AModel is PUMLStateMachine then
    Result := IMG_INDEX_STATEMACHINE

  else if AModel is PUMLSubActivityState then
    Result := IMG_INDEX_SUBACTIVITYSTATE
  else if AModel is PUMLSubmachineState then
    Result := IMG_INDEX_SUBMACHINESTATE
  else if AModel is PUMLCompositeState then
    Result := IMG_INDEX_COMPOSITESTATE

  else if AModel is PUMLCollaboration then
    Result := IMG_INDEX_COLLABORATION
  else if AModel is PUMLCollaborationInstanceSet then
    Result := IMG_INDEX_COLLABORATIONINSTANCESET
  else if AModel is PUMLInteraction then
    Result := IMG_INDEX_INTERACTION
  else if AModel is PUMLInteractionInstanceSet then
    Result := IMG_INDEX_INTERACTIONINSTANCESET

  else if AModel is PUMLActionState then
    Result := IMG_INDEX_ACTIONSTATE
  else if AModel is PUMLPseudostate then
    case (AModel as PUMLPseudostate).PseudostateKind of
      pkChoice:           Result := IMG_INDEX_PSEUDOSTATE_CHOICEPOINT;
      pkDeepHistory:      Result := IMG_INDEX_PSEUDOSTATE_DEEPHISTORY;
      pkSynchronization:  Result := IMG_INDEX_PSEUDOSTATE_SYNCHRONIZATION;
      pkInitial:          Result := IMG_INDEX_PSEUDOSTATE_INITIALSTATE;
      pkJunction:         Result := IMG_INDEX_PSEUDOSTATE_JUNCTIONPOINT;
      pkShallowHistory:   Result := IMG_INDEX_PSEUDOSTATE_SHALLOWHISTORY;
      pkDecision:         Result := IMG_INDEX_PSEUDOSTATE_DECISION;
    end
  else if AModel is PUMLFlowFinalState then
    Result := IMG_INDEX_FLOWFINALSTATE    
  else if AModel is PUMLFinalState then
    Result := IMG_INDEX_FINALSTATE
  else if AModel is PUMLPartition then
    Result := IMG_INDEX_PARTITION

  else if AModel is PUMLAttribute then begin
    if FeatureVisibility then
      case (AModel as PUMLAttribute).Visibility of
        vkPublic:     Result := IMG_INDEX_ATTRIBUTE_PUBLIC;
        vkProtected:  Result := IMG_INDEX_ATTRIBUTE_PROTECTED;
        vkPrivate:    Result := IMG_INDEX_ATTRIBUTE_PRIVATE;
        vkPackage:    Result := IMG_INDEX_ATTRIBUTE_PACKAGE;
      end
    else
      Result := IMG_INDEX_ATTRIBUTE_PUBLIC;
  end
  else if AModel is PUMLOperation then begin
    if FeatureVisibility then
      case (AModel as PUMLOperation).Visibility of
        vkPublic:     Result := IMG_INDEX_OPERATION_PUBLIC;
        vkProtected:  Result := IMG_INDEX_OPERATION_PROTECTED;
        vkPrivate:    Result := IMG_INDEX_OPERATION_PRIVATE;
        vkPackage:    Result := IMG_INDEX_OPERATION_PACKAGE;
      end
    else
      Result := IMG_INDEX_OPERATION_PUBLIC;
  end
  else if AModel is PUMLParameter then
    Result := IMG_INDEX_PARAMETER
  else if AModel is PUMLTemplateParameter then
    Result := IMG_INDEX_TEMPLATEPARAMETER
  else if AModel is PUMLEnumerationLiteral then
    Result := IMG_INDEX_ENUMERATIONLITERAL

  else if AModel is PUMLTransition then
    Result := IMG_INDEX_TRANSITION
  else if AModel is PUMLCallAction then
    Result := IMG_INDEX_CALLACTION
  else if AModel is PUMLSendAction then
    Result := IMG_INDEX_SENDACTION
  else if AModel is PUMLCreateAction then
    Result := IMG_INDEX_CREATEACTION
  else if AModel is PUMLDestroyAction then
    Result := IMG_INDEX_DESTROYACTION
  else if AModel is PUMLReturnAction then
    Result := IMG_INDEX_RETURNACTION
  else if AModel is PUMLUninterpretedAction then begin
    Result := IMG_INDEX_UNINTERPRETEDACTION;
    if UninterpretedActionState then begin
      if (AModel as PUMLUninterpretedAction).EntryState <> nil then
        Result := IMG_INDEX_UNINTERPRETEDACTION_ENTRY
      else if (AModel as PUMLUninterpretedAction).DoActivityState <> nil then
        Result := IMG_INDEX_UNINTERPRETEDACTION_DO
      else if (AModel as PUMLUninterpretedAction).ExitState <> nil then
        Result := IMG_INDEX_UNINTERPRETEDACTION_EXIT;
    end;
  end
  else if AModel is PUMLSignalEvent then
    Result := IMG_INDEX_SIGNALEVENT
  else if AModel is PUMLCallEvent then
    Result := IMG_INDEX_CALLEVENT
  else if AModel is PUMLTimeEvent then
    Result := IMG_INDEX_TIMEEVENT
  else if AModel is PUMLChangeEvent then
    Result := IMG_INDEX_CHANGEEVENT
  else if AModel is PUMLClassifierRole then
    Result := IMG_INDEX_CLASSIFIERROLE
  else if AModel is PUMLObject then
    Result := IMG_INDEX_OBJECT

  else if AModel is PUMLRealization then
    Result := IMG_INDEX_REALIZATION
  else if AModel is PUMLDependency then
    Result := IMG_INDEX_DEPENDENCY
  else if AModel is PUMLAssociationRole then
    Result := IMG_INDEX_ASSOCIATIONROLE
  else if AModel is PUMLAssociation then
    Result := IMG_INDEX_ASSOCIATION
  else if AModel is PUMLAssociationClass then
    Result := IMG_INDEX_ASSOCIATIONCLASS
  else if AModel is PUMLGeneralization then
    Result := IMG_INDEX_GENERALIZATION
  else if AModel is PUMLLink then
    Result := IMG_INDEX_LINK
  else if AModel is PUMLStimulus then
    Result := IMG_INDEX_STIMULUS
  else if AModel is PUMLMessage then
    Result := IMG_INDEX_MESSAGE
  else if AModel is PUMLInclude then
    Result := IMG_INDEX_INCLUDE
  else if AModel is PUMLExtend then
    Result := IMG_INDEX_EXTEND

  else if AModel is PUMLSignalAcceptState then
    Result := IMG_INDEX_SIGNALACCEPTSTATE
  else if AModel is PUMLSignalSendState then
    Result := IMG_INDEX_SIGNALSENDSTATE
  else if AModel is PUMLCombinedFragment then
    Result := IMG_INDEX_COMBINEDFRAGMENT
  else if AModel is PUMLConnector then
    Result := IMG_INDEX_CONNECTOR
  else if AModel is PUMLObjectFlowState then
    Result := IMG_INDEX_OBJECTFLOWSTATE
  else if AModel is PUMLPort then
    Result := IMG_INDEX_PORT
  else if AModel is PUMLArtifact then
    Result := IMG_INDEX_ARTIFACT
  else if AModel is PUMLExtensionPoint then
    Result := IMG_INDEX_EXTENSIONPOINT
  else if AModel is PUMLAttributeLink then
    Result := IMG_INDEX_ATTRIBUTELINK
  else if AModel is PUMLFrame then
    Result := IMG_INDEX_FRAME
  else if AModel is PUMLCompositeStructureDiagram then
    Result := IMG_INDEX_COMPOSITESTRUCTURE_DIAGRAM;
end;

function CheckLinkable(DiagramView: PDiagramView; ElementKind: string; End1, End2: PView; var Msg: string): Boolean;

  function GetInfoMessage(End1, End2: PView; RelationStr: string): string;
  var
    M1, M2: PModel;
    Str1, Str2: string;
  begin
    if (End1 = nil) or (End2 = nil) then
      Result := ''
    else begin
      M1 := End1.Model;
      M2 := End2.Model;

      if M1 = nil then
        Str1 := '(' + End1.MetaClass.Name + ')'
      else if M1.Name = '' then
        Str1 := '(' + M1.MetaClass.Name + ')'
      else
        Str1 := M1.Name;
      if M2 = nil then
        Str2 := '(' + End2.MetaClass.Name + ')'
      else if M2.Name = '' then
        Str2 := '(' + M2.MetaClass.Name + ')'
      else
        Str2 := M2.Name;
      Result := Format(ERR_CANNOT_CREATE_RELATION, [RelationStr])
        + #13 + '[ ' + Str1 + ' , ' + Str2 + ' ]';
    end;
  end;

var
  Linkable: Boolean;
  M1, M2: PModel;
begin
  Linkable := False;
  M1 := nil;  M2 := nil;
  if End1 <> nil then
    M1 := End1.Model;
  if End2 <> nil then
    M2 := End2.Model;
  if ElementKind = 'NoteLink' then begin
    Linkable := ((End1 <> nil) and (End2 is PUMLNoteView))
      or ((End1 is PUMLNoteView) and (End2 <> nil));
    if not Linkable and ((End1 <> nil) and (End2 <> nil))then
      Msg := ERR_INVALID_RELATION;
  end
  else if ElementKind = 'Transition' then begin
    Linkable := (M1 is PUMLStateVertex) and (M2 is PUMLStateVertex);
    if not Linkable then
      Msg := GetInfoMessage(End1, End2, TXT_REL_TRANSITION);
  end
  else if ElementKind = 'Dependency' then begin
    Linkable := (M1 is PUMLModelElement) and (M2 is PUMLModelElement);
    if not Linkable then
      Msg := GetInfoMessage(End1, End2, TXT_REL_DEPENDENCY);
  end
  else if ElementKind = 'Association' then begin
    Linkable := (M1 is PUMLClassifier) and (M2 is PUMLClassifier);
    if not Linkable then
      Msg := GetInfoMessage(End1, End2, TXT_REL_ASSOCIATION);
  end
  else if ElementKind = 'AssociationClass' then begin
    Linkable := ((M1 is PUMLAssociation) and (M2 is PUMLClass)) or ((M1 is PUMLClass) and (M2 is PUMLAssociation));
    if not Linkable then
      Msg := GetInfoMessage(End1, End2, TXT_REL_ASSOCIATIONCLASS);
  end
  else if ElementKind = 'Generalization' then begin
    Linkable := (M1 is PUMLGeneralizableElement) and (M2 is PUMLGeneralizableElement);
    if not Linkable then
      Msg := GetInfoMessage(End1, End2, TXT_REL_GENERALIZATION);
  end
  else if ElementKind = 'Link' then begin
    Linkable := (M1 is PUMLInstance) and (M2 is PUMLInstance);
    if not Linkable then
      Msg := GetInfoMessage(End1, End2, TXT_REL_LINK);
  end
  else if ElementKind = 'AssociationRole' then begin
    Linkable := (M1 is PUMLClassifierRole) and (M2 is PUMLClassifierRole);
    if not Linkable then
      Msg := GetInfoMessage(End1, End2, TXT_REL_ASSOCIATION_ROLE);
  end
  else if ElementKind = 'Stimulus' then begin
    if DiagramView is PUMLSequenceDiagramView then begin
      Linkable := (M1 is PUMLInstance) and (M2 is PUMLInstance);
      if not Linkable then
        Msg := GetInfoMessage(End1, End2, TXT_REL_STIMULUS);
    end
    else if DiagramView is PUMLCollaborationDiagramView then begin
      Linkable := (M1 is PUMLLink) or (M2 is PUMLLink);
      if not Linkable then
        Msg := ERR_CANNOT_CREATE_STIMULUS;
    end;
  end
  else if ElementKind = 'Message' then begin
    if DiagramView is PUMLSequenceRoleDiagramView then begin
      Linkable := (M1 is PUMLClassifierRole) and (M2 is PUMLClassifierRole);
      if not Linkable then
        Msg := GetInfoMessage(End1, End2, TXT_REL_MESSSAGE);
    end
    else if DiagramView is PUMLCollaborationRoleDiagramView then begin
      Linkable := (M1 is PUMLAssociationRole) or (M2 is PUMLAssociationRole);
      if not Linkable then
        Msg := ERR_CANNOT_CREATE_MESSAGE;
    end;
  end
  else if ElementKind = 'Include' then begin
    Linkable := (M1 is PUMLUseCase) and (M2 is PUMLUseCase);
    if not Linkable then
      Msg := GetInfoMessage(End1, End2, TXT_REL_INCLUDE);
  end
  else if ElementKind = 'Extend' then begin
    Linkable := (M1 is PUMLUseCase) and (M2 is PUMLUseCase);
    if not Linkable then
      Msg := GetInfoMessage(End1, End2, TXT_REL_EXTEND);
  end
  else if ElementKind = 'Realization' then begin
    Linkable := (M1 is PUMLModelElement) and (M2 is PUMLModelElement);
    if not Linkable then
      Msg := GetInfoMessage(End1, End2, TXT_REL_REALIZATION);
  end
  else if ElementKind = 'Connector' then begin
    Linkable := (M1 is PUMLFeature) and (M2 is PUMLFeature);
    if not Linkable then
      Msg := GetInfoMessage(End1, End2, TXT_REL_CONNECTOR);
  end;
  Result := Linkable;
end;

function IsValidConnection(Edge: PEdgeView; End1, End2: PView): Boolean;
var
  M1, M2: PModel;
begin
  M1 := nil;
  M2 := nil;
  if End1 <> nil then M1 := End1.Model;
  if End2 <> nil then M2 := End2.Model;

  Result := False;
  if Edge is PUMLAssociationView then
    Result := (M1 is PUMLClassifier) and (M2 is PUMLClassifier)
  else if Edge is PUMLAssociationClassView then
    Result := ((M1 is PUMLClass) and (M2 is PUMLAssociation))
      or ((M1 is PUMLAssociation) and (M2 is PUMLClass))
  else if Edge is PUMLAssociationRoleView then
    Result := (M1 is PUMLClassifierRole) and (M2 is PUMLClassifierRole)
  else if Edge is PUMLDependencyView then
    Result := (M1 is PUMLModelElement) and (M2 is PUMLModelElement)
  else if Edge is PUMLExtendView then
    Result := (M1 is PUMLUseCase) and (M2 is PUMLUseCase)
  else if Edge is PUMLGeneralizationView then
    Result := (M1 is PUMLGeneralizableElement) and (M2 is PUMLGeneralizableElement)
  else if Edge is PUMLIncludeView then
    Result := (M1 is PUMLUseCase) and (M2 is PUMLUseCase)
  else if Edge is PUMLSeqMessageView then
    Result := (M1 is PUMLClassifierRole) and (M2 is PUMLClassifierRole)
  else if Edge is PUMLNoteLinkView then
    Result := ((End1 <> nil) and (End2 is PUMLNoteView))
      or ((End2 <> nil) and (End1 is PUMLNoteView))
  else if Edge is PUMLLinkView then
    Result := (M1 is PUMLInstance) and (M2 is PUMLInstance)
  else if Edge is PUMLRealizationView then
    Result := (M1 is PUMLModelElement) and (M2 is PUMLModelElement)
  else if Edge is PUMLSeqStimulusView then
    Result := (M1 is PUMLInstance) and (M2 is PUMLInstance)
  else if Edge is PUMLTransitionView then
    Result := (M1 is PUMLStateVertex) and (M2 is PUMLStateVertex)
  else if Edge is PUMLConnectorView then
    Result := (M1 is PUMLFeature) and (M2 is PUMLFeature);
end;

// Procedures and functions
////////////////////////////////////////////////////////////////////////////////

procedure RegisterClasses;
begin
  ClassRegistry.RegisterClass(PUMLDocument);
  ClassRegistry.RegisterClass(PUMLModelFragmentDocument);
  ClassRegistry.RegisterClass(PUMLProjectDocument);
  ClassRegistry.RegisterClass(PUMLUnitDocument);
end;

initialization
  RegisterClasses;
end.
