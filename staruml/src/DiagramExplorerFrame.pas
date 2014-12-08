unit DiagramExplorerFrame;

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
  Dialogs, ExtCtrls, Generics.Collections, VirtualTrees, Menus,
  BasicClasses, Core, UMLModels, FlatPanel, MenuManager;

type
  // PDiagramNodeData
  PDiagramNodeData = ^TDiagramNodeData;
  TDiagramNodeData = record
    Text: string;
    ImageIndex: Integer;
    Diagram: PUMLDiagram;
  end;

  // TDiagramExplorerPanel2
  TDiagramExplorerPanel = class(TFrame)
    ClientPanel: TFlatPanel;
    DiagramTree: TVirtualStringTree;
    procedure DiagramTreeGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure DiagramTreeGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure DiagramTreeChange(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure DiagramTreeEditing(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
    procedure DiagramTreeEdited(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex);
    procedure DiagramTreeEditCancelled(Sender: TBaseVirtualTree;
      Column: TColumnIndex);
    procedure DiagramTreeDblClick(Sender: TObject);
    procedure DiagramTreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DiagramTreeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DiagramTreeNewText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; NewText: string);
    procedure PopupCutClick(Sender: TObject);
    procedure PopupCopyClick(Sender: TObject);
    procedure PopupDeleteFromModeClick(Sender: TObject);
  private type
    PNodeHashTable = TDictionary<string,PVirtualNode>;
  private
    NodeHashTable: PNodeHashTable;
    ClassDiagramGroupNode: PVirtualNode;
    UseCaseDiagramGroupNode: PVirtualNode;
    SequenceDiagramGroupNode: PVirtualNode;
    SequenceRoleDiagramGroupNode: PVirtualNode;
    CollaborationDiagramGroupNode: PVirtualNode;
    CollaborationRoleDiagramGroupNode: PVirtualNode;
    StatechartDiagramGroupNode: PVirtualNode;
    ActivityDiagramGroupNode: PVirtualNode;
    ComponentDiagramGroupNode: PVirtualNode;
    DeploymentDiagramGroupNode: PVirtualNode;
    CompositeStructureDiagramGroupNode: PVirtualNode;
    //FPopupMenu: TdxBarPopupMenu;
    FPopupMenu: TContextMenuHandle;
    FProject: PUMLProject;
    FRootNode: PVirtualNode;
    FOnElementSelected: PModelEvent;
    FOnBrowseDiagram: PDiagramEvent;
    FOnModelNameChange: PModelNameEvent;
    FOnEnableGeneralEditMenu: TNotifyEvent;
    FOnDisableGeneralEditMenu: TNotifyEvent;
    procedure InitializeNodes;
    function MakeGroupNode(Root: PVirtualNode; Text: string; Idx: Integer): PVirtualNode;
    function FindGroupNode(ADiagram: PUMLDiagram): PVirtualNode;
    function FindDiagramNode(ADiagram: PUMLDiagram): PVirtualNode;
    procedure CreateDiagramNode(DiagramGroupNode: PVirtualNode; ADiagram: PUMLDiagram);
    procedure DeleteDiagramNode(ADiagram: PUMLDiagram);
    procedure UpdateDiagramNode(ADiagram: PUMLDiagram);
    function GetDiagramNodeImageIndex(ADiagram: PUMLDiagram): Integer;
    procedure SetImageList(Value: TImageList);
    procedure SetProject(Value: PUMLProject);
    procedure ClearNodes;
    procedure SelectionChanged(Model: PModel);
    procedure EnableGeneralEditMenu;
    procedure DisableGeneralEditMenu;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure RebuildAll;
    procedure AddDiagram(ADiagram: PUMLDiagram);
    procedure DeleteDiagram(ADiagram: PUMLDiagram);
    procedure UpdateDiagram(ADiagram: PUMLDiagram);
    property ImageList: TImageList write SetImageList;
    //property PopupMenu: TdxBarPopupMenu read FPopupMenu write FPopupMenu;
    property PopupMenu: TContextMenuHandle read FPopupMenu write FPopupMenu;
    property Project: PUMLProject read FProject write SetProject;
    property RootNode: PVirtualNode read FRootNode;
    property OnElementSelected: PModelEvent read FOnElementSelected write FOnElementSelected;
    property OnBrowseDiagram: PDiagramEvent read FOnBrowseDiagram write FOnBrowseDiagram;
    property OnModelNameChange: PModelNameEvent read FOnModelNameChange write FOnModelNameChange;
    property OnEnableGeneralEditMenu: TNotifyEvent read FOnEnableGeneralEditMenu write FOnEnableGeneralEditMenu;
    property OnDisableGeneralEditMenu: TNotifyEvent read FOnDisableGeneralEditMenu write FOnDisableGeneralEditMenu;
  end;

implementation

{$R *.dfm}

uses
  StarUMLApp;

const
  DK_CLASS: string = 'Class Diagrams';
  DK_USECASE: string = 'UseCase Diagrams';
  DK_SEQ: string = 'Sequence Diagrams';
  DK_SEQ_ROLE: string = 'Sequence Diagrams (Role)';
  DK_COL: string = 'Collaboration Diagrams';
  DK_COL_ROLE: string = 'Collaboration Diagrams (Role)';
  DK_STATE: string = 'Statechart Diagrams';
  DK_ACT: string = 'Activity Diagrams';
  DK_COM: string = 'Component Diagrams';
  DK_DEP: string = 'Deployment Diagrams';
  DK_COMSTR: string = 'CompositeStructure Diagrams';

constructor TDiagramExplorerPanel.Create(AOwner: TComponent);
begin
  inherited;
  { create common nodes of Tree View }
  DiagramTree.NodeDataSize := SizeOf(TDiagramNodeData);
  DiagramTree.DoubleBuffered := True;
  InitializeNodes;
  NodeHashTable := PNodeHashTable.Create;
  NodeHashTable.Clear;
end;

destructor TDiagramExplorerPanel.Destroy;
begin
  ClearNodes;
  NodeHashTable.Free;
  inherited;
end;

procedure TDiagramExplorerPanel.InitializeNodes;
var
  RootData: PDiagramNodeData;
begin
  DiagramTree.BeginUpdate;
  FRootNode := DiagramTree.AddChild(nil);
  RootData := DiagramTree.GetNodeData(FRootNode);
  RootData.Text := 'Diagrams';
  RootData.ImageIndex := 13;
  RootData.Diagram := nil;
  ClassDiagramGroupNode := MakeGroupNode(FRootNode, DK_CLASS, 13);
  UseCaseDiagramGroupNode := MakeGroupNode(FRootNode, DK_USECASE, 13);
  SequenceDiagramGroupNode := MakeGroupNode(FRootNode, DK_SEQ, 13);
  SequenceRoleDiagramGroupNode := MakeGroupNode(FRootNode, DK_SEQ_ROLE, 13);
  CollaborationDiagramGroupNode := MakeGroupNode(FRootNode, DK_COL, 13);
  CollaborationRoleDiagramGroupNode := MakeGroupNode(FRootNode, DK_COL_ROLE, 13);
  StatechartDiagramGroupNode := MakeGroupNode(FRootNode, DK_STATE, 13);
  ActivityDiagramGroupNode := MakeGroupNode(FRootNode, DK_ACT, 13);
  ComponentDiagramGroupNode := MakeGroupNode(FRootNode, DK_COM, 13);
  DeploymentDiagramGroupNode := MakeGroupNode(FRootNode, DK_DEP, 13);
  CompositeStructureDiagramGroupNode := MakeGroupNode(FRootNode, DK_COMSTR, 13);
  DiagramTree.Expanded[FRootNode] := True;
  DiagramTree.EndUpdate;
end;

function TDiagramExplorerPanel.MakeGroupNode(Root: PVirtualNode; Text: string; Idx: Integer): PVirtualNode;
var
  Node: PVirtualNode;
  NodeData: PDiagramNodeData;
begin
  Node := DiagramTree.AddChild(Root);
  NodeData := DiagramTree.GetNodeData(Node);
  NodeData.Text := Text;
  NodeData.ImageIndex := Idx;
  NodeData.Diagram := nil;
  Result := Node;
end;

procedure TDiagramExplorerPanel.PopupCutClick(Sender: TObject);
begin
  StarUMLApplication.Cut;
end;

function TDiagramExplorerPanel.FindGroupNode(ADiagram: PUMLDiagram): PVirtualNode;
begin
  if ADiagram is PUMLClassDiagram              then Result := ClassDiagramGroupNode
  else if ADiagram is PUMLUseCaseDiagram            then Result := UseCaseDiagramGroupNode
  else if ADiagram is PUMLSequenceDiagram           then Result := SequenceDiagramGroupNode
  else if ADiagram is PUMLSequenceRoleDiagram       then Result := SequenceRoleDiagramGroupNode
  else if ADiagram is PUMLCollaborationDiagram      then Result := CollaborationDiagramGroupNode
  else if ADiagram is PUMLCollaborationRoleDiagram  then Result := CollaborationRoleDiagramGroupNode
  else if ADiagram is PUMLStatechartDiagram         then Result := StatechartDiagramGroupNode
  else if ADiagram is PUMLActivityDiagram           then Result := ActivityDiagramGroupNode
  else if ADiagram is PUMLComponentDiagram          then Result := ComponentDiagramGroupNode
  else if ADiagram is PUMLDeploymentDiagram         then Result := DeploymentDiagramGroupNode
  else if ADiagram is PUMLCompositeStructureDiagram then Result := CompositeStructureDiagramGroupNode
                                                    else Result := nil;
end;


function TDiagramExplorerPanel.FindDiagramNode(ADiagram: PUMLDiagram): PVirtualNode;
begin
  Result := nil;
  if Assigned(ADiagram) then
    NodeHashTable.TryGetValue(ADiagram.GUID, Result);
end;

procedure TDiagramExplorerPanel.CreateDiagramNode(DiagramGroupNode: PVirtualNode; ADiagram: PUMLDiagram);
var
  Node: PVirtualNode;
  NodeData: PDiagramNodeData;
begin
  if (DiagramGroupNode <> nil) and (ADiagram <> nil) then
  begin
    Node := DiagramTree.AddChild(DiagramGroupNode);
    NodeData := DiagramTree.GetNodeData(Node);
    NodeData.Text := ADiagram.Name;
    NodeData.ImageIndex := GetDiagramNodeImageIndex(ADiagram);
    NodeData.Diagram := ADiagram;
    NodeHashTable.Add(ADiagram.GUID, Node);
  end;
end;

procedure TDiagramExplorerPanel.DeleteDiagramNode(ADiagram: PUMLDiagram);
var
  Node: PVirtualNode;
begin
  Node := FindDiagramNode(ADiagram);
  DiagramTree.DeleteNode(Node);
  NodeHashTable.Remove(ADiagram.GUID);
end;

procedure TDiagramExplorerPanel.PopupDeleteFromModeClick(Sender: TObject);
begin
  StarUMLApplication.DeleteSelectedViewsWithModels;
end;

procedure TDiagramExplorerPanel.UpdateDiagramNode(ADiagram: PUMLDiagram);
var
  Node: PVirtualNode;
  NodeData: PDiagramNodeData;
begin
  Node := FindDiagramNode(ADiagram);
  NodeData := DiagramTree.GetNodeData(Node);
  NodeData.Text := ADiagram.Name;
  NodeData.ImageIndex := GetDiagramNodeImageIndex(ADiagram);
  NodeData.Diagram := ADiagram;
  DiagramTree.InvalidateNode(Node);
end;

function TDiagramExplorerPanel.GetDiagramNodeImageIndex(ADiagram: PUMLDiagram): Integer;
begin
  if ADiagram is PUMLClassDiagram then Result := 91
  else if ADiagram is PUMLUseCaseDiagram then Result := 92
  else if ADiagram is PUMLSequenceDiagram then Result := 93
  else if ADiagram is PUMLSequenceRoleDiagram then Result := 94
  else if ADiagram is PUMLCollaborationDiagram then Result := 95
  else if ADiagram is PUMLCollaborationRoleDiagram then Result := 96
  else if ADiagram is PUMLStatechartDiagram then Result := 97
  else if ADiagram is PUMLActivityDiagram then Result := 98
  else if ADiagram is PUMLComponentDiagram then Result := 99
  else if ADiagram is PUMLDeploymentDiagram then Result := 100
  else if ADiagram is PUMLCompositeStructureDiagram then Result := 179
  else
  begin
    Result := -1;
    Assert(False)
  end;
end;

procedure TDiagramExplorerPanel.SetImageList(Value: TImageList);
begin
  if Assigned(DiagramTree) then
    DiagramTree.Images := Value;
  //DiagExplorerPopupMenu.Images := Value;
end;

procedure TDiagramExplorerPanel.SetProject(Value: PUMLProject);
begin
  if FProject <> Value then
    FProject := Value;
end;

procedure TDiagramExplorerPanel.ClearNodes;
begin
  DiagramTree.Clear;
  NodeHashTable.Clear;
  InitializeNodes;
end;

procedure TDiagramExplorerPanel.PopupCopyClick(Sender: TObject);
begin
  StarUMLApplication.Copy;
end;

procedure TDiagramExplorerPanel.SelectionChanged(Model: PModel);
begin
  if Assigned(FOnElementSelected) then
    FOnElementSelected(Self, Model);
end;

procedure TDiagramExplorerPanel.EnableGeneralEditMenu;
begin
  if Assigned(FOnEnableGeneralEditMenu) then
    FOnEnableGeneralEditMenu(Self);
end;

procedure TDiagramExplorerPanel.DisableGeneralEditMenu;
begin
  if Assigned(FOnDisableGeneralEditMenu) then
    FOnDisableGeneralEditMenu(Self);
end;

procedure TDiagramExplorerPanel.Clear;
begin
  DiagramTree.ClearSelection;
  ClearNodes;
end;

procedure TDiagramExplorerPanel.RebuildAll;

  procedure AddNodes(AModel: PModel);
  var
    I: Integer;
    M: PModel;
    GroupNode: PVirtualNode;
  begin
    if AModel <> nil then
    begin
      for I := 0 to AModel.VirtualOwnedModelCount - 1 do
      begin
        M := AModel.VirtualOwnedModel[I];
        if M is PUMLDiagram then
        begin
          GroupNode := FindGroupNode(M as PUMLDiagram);
          CreateDiagramNode(GroupNode, M as PUMLDiagram);
        end
        else begin
          AddNodes(M);
        end;
      end;
    end;
  end;

begin
  if FProject <> nil then
  begin
    DiagramTree.BeginUpdate;
    ClearNodes;
    AddNodes(FProject);
    DiagramTree.EndUpdate;
  end;
end;

procedure TDiagramExplorerPanel.AddDiagram(ADiagram: PUMLDiagram);
var
  TargetNode: PVirtualNode;
begin
  TargetNode := FindGroupNode(ADiagram);
  if TargetNode <> nil then begin
    CreateDiagramNode(TargetNode, ADiagram);
    DiagramTree.Expanded[TargetNode] := True;
  end;
end;

procedure TDiagramExplorerPanel.DeleteDiagram(ADiagram: PUMLDiagram);
begin
  DeleteDiagramNode(ADiagram);
end;

procedure TDiagramExplorerPanel.UpdateDiagram(ADiagram: PUMLDiagram);
begin
  UpdateDiagramNode(ADiagram);
end;

procedure TDiagramExplorerPanel.DiagramTreeGetText(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType; var CellText: string);
var
  NodeData: PDiagramNodeData;
begin
  NodeData := DiagramTree.GetNodeData(Node);
  CellText := UnicodeString(NodeData.Text);
end;

procedure TDiagramExplorerPanel.DiagramTreeGetImageIndex(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
  Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
var
  NodeData: PDiagramNodeData;
begin
  NodeData := DiagramTree.GetNodeData(Node);
  case Kind of
    ikState: begin
      ImageIndex := -1;
    end;
    ikNormal, ikSelected: begin
      ImageIndex := NodeData.ImageIndex;
    end;
  end;
end;

procedure TDiagramExplorerPanel.DiagramTreeChange(
  Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  NodeData: PDiagramNodeData;
begin
  if Node <> nil then
  begin
    NodeData := DiagramTree.GetNodeData(Node);
    if NodeData.Diagram <> nil then
      SelectionChanged(NodeData.Diagram)
    //else
    //  Selectionchanged(nil);
  end;
end;

procedure TDiagramExplorerPanel.DiagramTreeEditing(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
  var Allowed: Boolean);
var
  NodeData: PDiagramNodeData;
begin
  NodeData := DiagramTree.GetNodeData(Node);
  if NodeData.Diagram <> nil then
  begin
    Allowed := True;
    DisableGeneralEditMenu;
  end
  else
    Allowed := False;
end;

procedure TDiagramExplorerPanel.DiagramTreeEdited(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
begin
  EnableGeneralEditMenu;
end;

procedure TDiagramExplorerPanel.DiagramTreeNewText(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
  NewText: string);
var
  NodeData: PDiagramNodeData;
begin
  if Node <> nil then
  begin
    NodeData := DiagramTree.GetNodeData(Node);
    if (NodeData.Diagram <> nil) and Assigned(FOnModelNameChange) then
      FOnModelNameChange(Self, NodeData.Diagram, NewText);
  end;
  EnableGeneralEditMenu;
end;

procedure TDiagramExplorerPanel.DiagramTreeEditCancelled(
  Sender: TBaseVirtualTree; Column: TColumnIndex);
begin
  EnableGeneralEditMenu;
end;

procedure TDiagramExplorerPanel.DiagramTreeDblClick(Sender: TObject);
var
  NodeData: PDiagramNodeData;
begin
  if DiagramTree.FocusedNode <> nil then
  begin
    NodeData := DiagramTree.GetNodeData(DiagramTree.FocusedNode);
    if (NodeData.Diagram <> nil) and Assigned(FOnBrowseDiagram) then
      FOnBrowseDiagram(Self, NodeData.Diagram);
  end;
end;

procedure TDiagramExplorerPanel.DiagramTreeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then DiagramTreeDblClick(Self)
end;

procedure TDiagramExplorerPanel.DiagramTreeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node: PVirtualNode;
begin
  if Button = mbRight then begin
    Node := DiagramTree.GetNodeAt(X, Y);
    if Node <> nil then begin
      if DiagramTree.FocusedNode <> Node then
      begin
        DiagramTree.Selected[Node] := True;
        DiagramTree.FocusedNode := Node;
      end;
      if Assigned(FPopupMenu) then
        FPopupMenu.PopupFromCursorPos;
    end;
  end;
end;


end.
