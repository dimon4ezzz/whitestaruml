unit ApprMgr;

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
  UMLModels,
  Classes, XMLDoc, XMLIntf;

const
  EXT_DIR = 'modules';
  APPROACH_EXTENSION = 'apr';
  ICON_EXTENSION = 'ico';

type
  // forward declaration
  PApproachReader = class;

  // Enumeration Types
  PApprModelElementKind = (nkModel, nkSubsystem, nkPackage);
  PApprDiagramKind = (dkClass, dkUsecase, dkComponent, dkDeployment, dkActivity);

  // PModelStructureNode
  PModelStructureNode = class
  private
    FName: string;
    FParentNode: PModelStructureNode;
    FChildNodes: TList;
    function GetChildNodeCount: Integer;
    function GetChildNode(Index: Integer): PModelStructureNode;
    procedure AddChildNode(Node: PModelStructureNode);
  public
    constructor Create;
    destructor Destroy; override;
    property Name: string read FName;
    property ParentNode: PModelStructureNode read FParentNode;
    property ChildNodeCount: Integer read GetChildNodeCount;
    property ChildNodes[Index: Integer]: PModelStructureNode read GetChildNode;
  end;

  // PModelElementNode
  PModelElementNode = class(PModelStructureNode)
  private
    FKind: PApprModelElementKind;
    FStereotypeProfile: string;
    FStereotypeName: string;
  public
    property Kind: PApprModelElementKind read FKind;
    property StereotypeProfile: string read FStereotypeProfile;
    property StereotypeName: string read FStereotypeName;
  end;

  // PImportFrameworkNode
  PImportFrameworkNode = class(PModelStructureNode);

  // PImportModelFragmentNode
  PImportModelFragmentNode = class(PModelStructureNode)
  private
    FFileName: string;
  public
    property FileName: string read FFileName;
  end;

  // PDiagramNode
  PDiagramNode = class(PModelStructureNode)
  private
    FDiagramType: PApprDiagramKind;
    FDiagramTypeProfile: string;
    FDiagramTypeName: string;
    FDefaultDiagram: Boolean;
  public
    property DiagramType: PApprDiagramKind read FDiagramType;
    property DiagramTypeProfile: string read FDiagramTypeProfile;
    property DiagramTypeName: string read FDiagramTypeName;
    property DefaultDiagram: Boolean read FDefaultDiagram;
  end;

  // PApproach
  PApproach = class
  private
    FName: string;
    FDisplayName: string;
    FDescription: string;
    FPath: string;
    FFileName: string;
    FIconFileName: string;
    FImportProfiles: TStringList;
    FRootNode: PModelStructureNode;
    function GetImportProfileCount: Integer;
    function GetImportProfile(Index: Integer): string;
  public
    constructor Create;
    destructor Destroy; override;
    property Name: string read FName;
    property DisplayName: string read FDisplayName;
    property Description: string read FDescription;
    property Path: string read FPath;
    property FileName: string read FFileName;
    property IconFileName: string read FIconFileName;
    property ImportProfileCount: Integer read GetImportProfileCount;
    property ImportProfiles[Index: Integer]: string read GetImportProfile;
    property RootNode: PModelStructureNode read FRootNode;
  end;

  // PApproachReader
  PApproachReader = class
  private
    procedure Report(Msg: string);
    function ReadStringValue(Node: IXMLNode; DefaultValue: string = ''): string;
    function ReadStringAttribute(Node: IXMLNode; AttrName: string; DefaultValue: string = ''): string;
    function ReadBooleanAttribute(Node: IXMLNode; AttrName: string; DefaultValue: Boolean = False): Boolean;
    function ReadChildStringValue(ParentNode: IXMLNode; ChildNodeName: string; DefaultValue: string = ''): string;
    function ReadHeader(Node: IXMLNode; AApproach: PApproach): Boolean;
    function ReadBody(Node: IXMLNode; AApproach: PApproach): Boolean;
    function ReadImportProfiles(Node: IXMLNode; AApproach: PApproach): Boolean;
    function ReadModelStructure(Node: IXMLNode; AApproach: PApproach): Boolean;
    function ReadModelElement(Node: IXMLNode; ParentModelStrNode: PModelStructureNode;
      CanIncludeDiagram: Boolean): Boolean;
    function ReadImportFramework(Node: IXMLNode; ParentModelStrNode: PModelStructureNode): Boolean;
    function ReadImportModelFragment(Node: IXMLNode; ParentModelStrNode: PModelStructureNode): Boolean;
    function ReadDiagram(Node: IXMLNode; ParentModelStrNode: PModelStructureNode): Boolean;
    function ReadModelExpressions(ParentNode: IXMLNode; ParentModelStrNode: PModelStructureNode;
      CanIncludeDiagram: Boolean): Boolean;
  public
    function ReadApproach(AApproach: PApproach): Boolean;
  end;

  // PApproachManager
  PApproachManager = class
  private
    FApproaches: TList;
    FApproachReader: PApproachReader;
    function GetApproachCount: Integer;
    function GetApproach(Index: Integer): PApproach;
    function AppendApproach(ApproachName, Path, FileName, IconFileName: string): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadApproaches;
    procedure CloseApproaches;
    function GetApproachByName(ApproachName: string): PApproach;
    property ApproachCount: Integer read GetApproachCount;
    property Approaches[Index: Integer]: PApproach read GetApproach;
  end;

  // Utilities
  function StrToApprDiagramKind(Value: string): PApprDiagramKind;

var
  ApproachManager: PApproachManager;

implementation

uses
  LogMgr, Windows, SysUtils, Forms, Variants, Registry, ActiveX, NLS_StarUML;

const
  APPROACHES_REGPATH = '\Software\StarUML\Approaches';
  REG_APPROACH_PATH = 'Path';
  REG_APPROACH_FILENAME = 'FileName';
  REG_APPROACH_ICONFILENAME = 'IconFileName';

  APR_APPROACH = 'APPROACH';
  APR_HEADER = 'HEADER';
  APR_BODY = 'BODY';
  APR_NAME = 'NAME';
  APR_DISPLAYNAME = 'DISPLAYNAME';
  APR_DESCRIPTION = 'DESCRIPTION';
  APR_IMPORTPROFILES = 'IMPORTPROFILES';
  APR_PROFILE = 'PROFILE';
  APR_MODELSTRUCTURE = 'MODELSTRUCTURE';
  APR_MODEL = 'MODEL';
  APR_SUBSYSTEM = 'SUBSYSTEM';
  APR_PACKAGE = 'PACKAGE';
  APR_IMPORTFRAMEWORK = 'IMPORTFRAMEWORK';
  APR_IMPORTMODELFRAGMENT = 'IMPORTMODELFRAGMENT';
  APR_DIAGRAM = 'DIAGRAM';
  APR_ATTR_NAME = 'name';
  APR_ATTR_TYPE = 'type';
  APR_ATTR_FILENAME = 'fileName';
  APR_ATTR_STEREOTYPEPROFILE = 'stereotypeProfile';
  APR_ATTR_STEREOTYPENAME = 'stereotypeName';
  APR_ATTR_DIAGRAMTYPEPROFILE = 'diagramTypeProfile';
  APR_ATTR_DIAGRAMTYPENAME = 'diagramTypeName';
  APR_ATTR_DEFAULTDIAGRAM = 'defaultDiagram';

////////////////////////////////////////////////////////////////////////////////
// PModelStructureNode

constructor PModelStructureNode.Create;
begin
  inherited;
  FChildNodes := TList.Create;
end;

destructor PModelStructureNode.Destroy;
var
  I: Integer;
begin
  for I := ChildNodeCount - 1 downto 0 do
    ChildNodes[I].Free;
  FChildNodes.Free;
  inherited;
end;

function PModelStructureNode.GetChildNodeCount: Integer;
begin
  Result := FChildNodes.Count;
end;

function PModelStructureNode.GetChildNode(Index: Integer): PModelStructureNode;
begin
  Result := PModelStructureNode(FChildNodes.Items[Index]);
end;

procedure PModelStructureNode.AddChildNode(Node: PModelStructureNode);
begin
  if FChildNodes.IndexOf(Node) = -1 then begin
    FChildNodes.Add(Node);
    Node.FParentNode := Self;
  end;
end;

// PModelStructureNode
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PApproach

constructor PApproach.Create;
begin
  inherited;
  FImportProfiles := TStringList.Create;
  FRootNode := PModelStructureNode.Create;
end;

destructor PApproach.Destroy;
begin
  FImportProfiles.Free;
  FRootNode.Free;
  inherited;
end;

function PApproach.GetImportProfileCount: Integer;
begin
  Result := FImportProfiles.Count;
end;

function PApproach.GetImportProfile(Index: Integer): string;
begin
  Result := FImportProfiles[Index];
end;

// PApproach
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PApproachReader

procedure PApproachReader.Report(Msg: string);
begin
  // Log messsage or raise event.
  // call this method when need to report error or information on file reading
end;

function PApproachReader.ReadStringValue(Node: IXMLNode; DefaultValue: string = ''): string;
begin
  if VarIsStr(Node.NodeValue) then
    Result := Node.NodeValue
  else
    Result := DefaultValue;
end;

function PApproachReader.ReadStringAttribute(Node: IXMLNode; AttrName: string; DefaultValue: string = ''): string;
begin
  Result := DefaultValue;
  if Node.HasAttribute(AttrName) then begin
    if VarIsStr(Node.Attributes[AttrName]) then
      Result := Node.Attributes[AttrName];
  end;
end;

function PApproachReader.ReadBooleanAttribute(Node: IXMLNode; AttrName: string; DefaultValue: Boolean = False): Boolean;
begin
  Result := DefaultValue;
  if Node.HasAttribute(AttrName) then begin
    if VarIsType(Node.Attributes[AttrName], varBoolean) then
      Result := Node.Attributes[AttrName]
    else if VarIsStr(Node.Attributes[AttrName]) then
      Result := StrToBool(Node.Attributes[AttrName]);
  end;
end;

function PApproachReader.ReadChildStringValue(ParentNode: IXMLNode; ChildNodeName: string; DefaultValue: string = ''): string;
begin
  if VarIsStr(ParentNode.ChildValues[ChildNodeName]) then
    Result := ParentNode.ChildValues[ChildNodeName]
  else
    Result := DefaultValue;
end;

function PApproachReader.ReadHeader(Node: IXMLNode; AApproach: PApproach): Boolean;
begin
  Result := True;
  if Node.LocalName <> APR_HEADER then begin
    Result := False;
    Exit;
  end;

  AApproach.FName := ReadChildStringValue(Node, APR_NAME);
  if AApproach.FName = '' then begin
    Result := False;
    Exit;
  end;

  AApproach.FDisplayName := ReadChildStringValue(Node, APR_DISPLAYNAME);
  if AApproach.FDisplayName = '' then begin
    Result := False;
    Exit;
  end;

  AApproach.FDescription := ReadChildStringValue(Node, APR_DESCRIPTION);
end;

function PApproachReader.ReadBody(Node: IXMLNode; AApproach: PApproach): Boolean;
var
  IPS, MS: IXMLNode;
begin
  Result := True;
  if Node.LocalName <> APR_BODY then begin
    Result := False;
    Exit;
  end;

  IPS := Node.ChildNodes[APR_IMPORTPROFILES];
  if IPS <> nil then
    if not ReadImportProfiles(IPS, AApproach) then begin
      Result := False;
      Exit;
    end;

  MS := Node.ChildNodes[APR_MODELSTRUCTURE];
  if MS <> nil then
    if not ReadModelStructure(MS, AApproach) then
      Result := False;
end;

function PApproachReader.ReadImportProfiles(Node: IXMLNode; AApproach: PApproach): Boolean;
var
  N: IXMLNode;
  I: Integer;
  P: string;
begin
  Result := True;
  if Node.LocalName <> APR_IMPORTPROFILES then begin
    Result := False;
    Exit;
  end;

  AApproach.FImportProfiles.Clear;
  for I := 0 to Node.ChildNodes.Count - 1 do begin
    N := Node.ChildNodes[I];
    if N.LocalName = APR_PROFILE then begin
      P := ReadStringValue(N);
      if P <> '' then
        AApproach.FImportProfiles.Add(P);
    end;
  end;
end;

function PApproachReader.ReadModelStructure(Node: IXMLNode; AApproach: PApproach): Boolean;
begin
  if Node.LocalName <> APR_MODELSTRUCTURE then begin
    Result := False;
    Exit;
  end;

  Result := ReadModelExpressions(Node, AApproach.RootNode, False);
end;

function PApproachReader.ReadModelElement(Node: IXMLNode; ParentModelStrNode: PModelStructureNode;
  CanIncludeDiagram: Boolean): Boolean;
var
  ModelElemNode: PModelElementNode;
begin
  Result := True;
  ModelElemNode := PModelElementNode.Create;
  ModelElemNode.FName := ReadStringAttribute(Node, APR_ATTR_NAME);
  ModelElemNode.FStereotypeProfile := ReadStringAttribute(Node, APR_ATTR_STEREOTYPEPROFILE);
  ModelElemNode.FStereotypeName := ReadStringAttribute(Node, APR_ATTR_STEREOTYPENAME);
  if Node.LocalName = APR_MODEL then ModelElemNode.FKind := nkModel
  else if Node.LocalName = APR_PACKAGE then ModelElemNode.FKind := nkPackage
  else if Node.LocalName = APR_SUBSYSTEM then ModelElemNode.FKind := nkSubsystem;
  ParentModelStrNode.AddChildNode(ModelElemNode);
  ReadModelExpressions(Node, ModelElemNode, True);
end;

function PApproachReader.ReadImportFramework(Node: IXMLNode; ParentModelStrNode: PModelStructureNode): Boolean;
var
  FrameworkNode: PImportFrameworkNode;
begin
  Result := True;
  FrameworkNode := PImportFrameworkNode.Create;
  FrameworkNode.FName := ReadStringAttribute(Node, APR_ATTR_NAME);
  ParentModelStrNode.AddChildNode(FrameworkNode);
end;

function PApproachReader.ReadImportModelFragment(Node: IXMLNode; ParentModelStrNode: PModelStructureNode): Boolean;
var
  ModelFmtNode: PImportModelFragmentNode;
begin
  Result := True;
  ModelFmtNode := PImportModelFragmentNode.Create;
  ModelFmtNode.FFileName := ReadStringAttribute(Node, APR_ATTR_FILENAME);
  ParentModelStrNode.AddChildNode(ModelFmtNode);
end;

function PApproachReader.ReadDiagram(Node: IXMLNode; ParentModelStrNode: PModelStructureNode): Boolean;
var
  DgmNode: PDiagramNode;
begin
  Result := True;
  DgmNode := PDiagramNode.Create;
  DgmNode.FName := ReadStringAttribute(Node, APR_ATTR_NAME);
  DgmNode.FDiagramType := StrToApprDiagramKind(ReadStringAttribute(Node, APR_ATTR_TYPE));
  DgmNode.FDiagramTypeProfile := ReadStringAttribute(Node, APR_ATTR_DIAGRAMTYPEPROFILE);
  DgmNode.FDiagramTypeName := ReadStringAttribute(Node, APR_ATTR_DIAGRAMTYPENAME);
  DgmNode.FDefaultDiagram := ReadBooleanAttribute(Node, APR_ATTR_DEFAULTDIAGRAM);
  ParentModelStrNode.AddChildNode(DgmNode);
end;

function PApproachReader.ReadModelExpressions(ParentNode: IXMLNode; ParentModelStrNode: PModelStructureNode;
  CanIncludeDiagram: Boolean): Boolean;
var
  Node: IXMLNode;
  NodeName: string;
  I: Integer;
begin
  Result := True;
  for I := 0 to ParentNode.ChildNodes.Count - 1 do begin
    Node := ParentNode.ChildNodes[I];
    NodeName := Node.LocalName;
    if (NodeName = APR_MODEL) or (NodeName = APR_PACKAGE) or (NodeName = APR_SUBSYSTEM) then
      ReadModelElement(Node, ParentModelStrNode, CanIncludeDiagram)
    else if NodeName = APR_IMPORTFRAMEWORK then
      ReadImportFramework(Node, ParentModelStrNode)
    else if NodeName = APR_IMPORTMODELFRAGMENT then
      ReadImportModelFragment(Node, ParentModelStrNode)
    else if NodeName = APR_DIAGRAM then begin
      if not CanIncludeDiagram then begin
        Result := False;
        Exit;
      end;
      ReadDiagram(Node, ParentModelStrNode);
    end;      
  end;
end;

function PApproachReader.ReadApproach(AApproach: PApproach): Boolean;
var
  XMLDoc: TXMLDocument;
  RootNode: IXMLNode;
  HNode, BNode: IXMLNode;
begin
  // PRECONDITION
  Assert(AApproach <> nil, 'Approach needed');
  // PRECONDITION

  XMLDoc := TXMLDocument.Create(Application);
  try
    try
      XMLDoc.LoadFromFile(AApproach.FileName);
      // check AsyncLoadState
      if XMLDoc.IsEmptyDoc then begin
        Result := False;
        Exit;
      end;
      RootNode := XMLDoc.DocumentElement;
      if RootNode.LocalName <> APR_APPROACH then begin
        Result := False;
        Exit;
      end;
      HNode := RootNode.ChildNodes.Nodes[APR_HEADER];
      BNode := RootNode.ChildNodes.Nodes[APR_BODY];
      if (HNode = nil) or (BNode = nil) then begin
        Result := False;
        Exit;
      end
      else
        Result := ReadHeader(HNode, AApproach) and ReadBody(BNode, AApproach);
    except
      Result := False;
    end;
  finally
    XMLDoc.Free;
  end;

end;

// PApproachReader
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PApproachManager

constructor PApproachManager.Create;
begin
  inherited;
  CoInitialize(nil);
  FApproaches := TList.Create;
  FApproachReader := PApproachReader.Create;
end;

destructor PApproachManager.Destroy;
begin
  CloseApproaches;
  FApproaches.Free;
  FApproachReader.Free;
  CoUninitialize;
  inherited;
end;

function PApproachManager.GetApproachCount: Integer;
begin
  Result := FApproaches.Count;
end;

function PApproachManager.GetApproach(Index: Integer): PApproach;
begin
  Result := PApproach(FApproaches.Items[Index]);
end;

function PApproachManager.AppendApproach(ApproachName, Path, FileName, IconFileName: string): Boolean;
var
  P: PApproach;
begin
  if not FileExists(FileName) then begin
    Result := False;
    Exit;
  end;
  P := PApproach.Create;
  P.FPath := Path;
  P.FName := ApproachName;   // Will be overwrited in ReadAppraoch.
  P.FFileName := FileName;
  P.FIconFileName := IconFileName;
  if not FApproachReader.ReadApproach(P) then begin
    P.Free;
    Result := False;
    Exit;
  end;
  FApproaches.Add(P);
  Result := True;
end;

procedure PApproachManager.LoadApproaches;

  procedure LoadFiles(Path: String);
  var
    SearchRec: TSearchRec;
    ApproachName, FolderPath, FileName, IconFileName: string;
  begin
    // files
    if FindFirst(Path + '\*' + APPROACH_EXTENSION, faArchive, SearchRec) = 0 then begin
      repeat
        ApproachName := Copy(SearchRec.Name, 1, Length(SearchRec.Name)-Length('.'+APPROACH_EXTENSION));
        FolderPath := Path;
        FileName := Path + '\' + ApproachName + '.' + APPROACH_EXTENSION;
        IconFileName := Path + '\' + ApproachName + '.' + ICON_EXTENSION;

        if AppendApproach(ApproachName, FolderPath, FileName, IconFileName) then
          LogManager.Log(Format(MSG_APPROACH_LOADED,[ApproachName]))
        else
          LogManager.Log(Format(ERR_APPROACH_LOAD_FAILED, [ApproachName]));
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
  LoadFiles(ExtractFileDir(Application.ExeName) + '\' + EXT_DIR);
end;

procedure PApproachManager.CloseApproaches;
var
  I: Integer;
begin
  for I := ApproachCount - 1 downto 0 do
    Approaches[I].Free;
end;

function PApproachManager.GetApproachByName(ApproachName: string): PApproach;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ApproachCount - 1 do
    if Approaches[I].Name = ApproachName then begin
      Result := Approaches[I];
      Exit;
    end;
end;

// PApproachManager
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Utilities

function StrToApprDiagramKind(Value: string): PApprDiagramKind;
begin
  if Value = 'Class' then Result := dkClass
  else if Value = 'UseCase' then Result := dkUsecase
  else if Value = 'Component' then Result := dkComponent
  else if Value = 'Deployment' then Result := dkDeployment
  else if Value = 'Activity' then Result := dkActivity
  else Result := dkClass;
end;

// Utilities
////////////////////////////////////////////////////////////////////////////////

initialization
  ApproachManager := PApproachManager.Create;
finalization
  ApproachManager.Free;
end.
