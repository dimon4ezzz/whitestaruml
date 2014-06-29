unit ShortenSyntaxMgr;

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
  SysUtils, Classes, Types, Windows,
  StarUMLApp, UMLFacto, Core, ViewCore, UMLModels, UMLViews, GraphicClasses;

const
  H_INT = 50;
  V_INT = 50;

type

  // PArrangeType
  PArrangeType = (atUp, atDown, atLeft, atRight);

  // PMsgTuple
  PMsgTuple = class
  public
    MsgView, ReturnMsgView: PEdgeView;
    ActivationView: PUMLActivationView;
    constructor Create(MsgView, ReturnMsgView: PEdgeView; ActivationView: PUMLActivationView);
  end;

  // PShortenSyntaxManager
  PShortenSyntaxManager = class
  private
    function ExecuteClassifier(FModel: PModel; Value: String): Boolean;
    function ExecuteState(FModel: PModel; Value: String): Boolean;
    function ExecuteObject(FModel: PModel; Value: String): Boolean;
    function ExecuteMessage(FModel: PModel; Value: String): Boolean;

    function HasRelation(Value: String; Relations: Array of String): Boolean;
    function GetViewInDiagram(DiagramView: PDiagramView; Name: String): PView; overload;
    function GetViewInDiagram(DiagramView: PDiagramView; Model: PModel): PView; overload;

    procedure ArrangeView(DiagramView: PDiagramView;
      TargetView, SourceView: PNodeView; ArrangeType: PArrangeType);
    procedure ArrangeSeqView(SourceView, TargetView: PNodeView; EdgeView, ReturnEdgeView: PEdgeView; OutGoing: Boolean);
    function GetMultStr(var Str: String): String;
    procedure SetMultiplicity(EdgeView: PEdgeView; OutGoing: Boolean; MultStr1, MultStr2: String);

    function MakeView(Model: PModel;
      Rel1, Rel2, ShortenStr, NodeType1, NodeType2, EdgeType: String;
      IsLeftRight: Boolean;
      NodeArgument: Integer = 0; EdgeArgument: Integer = 0): PView;

    function GetTargetNames(TargetName: String): TStringList;
    function CreateView(DiagramView: PDiagramView; TargetName: String): PNodeView;
    function CreateViewWithModel(DiagramView: PDiagramView; TargetName: String;
      OutGoing: Boolean; NodeType1, NodeType2: String; NodeArgument: Integer): PNodeView;
    procedure ArrangeNodeView(DiagramView: PDiagramView;
      TargetView, SourceView: PNodeView; OutGoing, IsLeftRight: Boolean);

    function MakeStateView(Model: PModel;
      Rel1, Rel2, ShortenStr, NodeType1, NodeType2, EdgeType: String;
      IsLeftRight: Boolean;
      NodeArgument: Integer = 0; EdgeArgument: Integer = 0): PView;
    function CreateStateView(DiagramView: PDiagramView; TargetName: String): PNodeView;

    function MakeSeqView(Model: PModel;
      Rel1, Rel2, ShortenStr, NodeType1, NodeType2, EdgeType: String;
      IsVertical: Boolean;
      NodeArgument: Integer = 0; EdgeArgument: Integer = 0; HasReturn: Boolean = false): PView;
    function CreateSeqView(DiagramView: PDiagramView; TargetName: String): PNodeView;

    function MakeColView(Model: PModel;
      Rel1, Rel2, ShortenStr, NodeType1, NodeType2, EdgeType: String;
      IsLeftRight: Boolean;
      NodeArgument: Integer = 0; EdgeArgument: Integer = 0): PView;
    function GetLinkView(SourceView, TargetView: PNodeView): PEdgeView;
    function CreateLinkView(OutGoing: Boolean; SourceView, TargetView: PNodeView): PEdgeView;

    function MakeSeqMsgView(Model: PModel;
      Rel1, Rel2, ShortenStr, NodeType1, NodeType2, EdgeType: String;
      IsVertical: Boolean;
      NodeArgument: Integer = 0; EdgeArgument: Integer = 0; HasReturn: Boolean = false): PView;
    function GetReturnMsgView(DiagramView: PDiagramView; MsgView: PEdgeView): PEdgeView;
    procedure MoveDown(DiagramView: PDiagramView; CurMsgView: PEdgeView; SpaceCount: Integer; LastMsgView: PEdgeView; HasReturn: Boolean = false);
    function GetNextMessagePosY(DiagramView: PDiagramView; CurMsgView, LastMsgView: PEdgeView): Integer;
    function GetLastMessageView(DiagramView: PDiagramView; CurMsgView: PEdgeView): PEdgeView;
    procedure ArrangeActivation(DiagramView: PDiagramView; CurMsgView, ReturnMsgView: PEdgeView; PY: Integer; LastMsgView, EdgeView: PEdgeView; HasReturn: Boolean = false);
    function GetActivation(LifeLineView: PNodeView; Value: Integer): PUMLActivationView;
    function GetActivationView(MsgView: PView): PUMLActivationView;

    function MakeSeqMsgView2(Model: PModel;
      Rel1, Rel2, ShortenStr, NodeType1, NodeType2, EdgeType: String;
      IsVertical: Boolean;
      NodeArgument: Integer = 0; EdgeArgument: Integer = 0; HasReturn: Boolean = false): PView;


  public
    function Execute(FModel: PModel; Value: String): Boolean;
  end;

implementation

////////////////////////////////////////////////////////////////////////////////

{ Utilities }

function Tokenize(SourceStr, Delimiter: String): TStringList;
var
  ResultList: TStringList;
  P, DL: Integer;
begin
    ResultList := TStringList.Create;
    DL := Length(Delimiter);
    while Length(SourceStr) > 0 do begin
      P := Pos(Delimiter, SourceStr);
      if P = 0 then begin
        ResultList.Add(Trim(SourceStr));
        break;
      end;
      ResultList.Add(Trim(Copy(SourceStr, 1, P-1)));
      SourceStr := Copy(SourceStr, P+DL, Length(SourceStr)-P-DL+1);
    end;
    Result := ResultList;
end;

function Overlap(R1, R2: TRect): Boolean;
var
  Rgn: HRgn;
  RT: TRect;
begin
  RT := R1;
  Rgn := CreateRectRgn(RT.Left, RT.Top, RT.Right, RT.Bottom);
  Result := RectInRegion(Rgn, R2);
  DeleteObject(Rgn);
end;

{ PShortenSyntaxManager }

function PShortenSyntaxManager.HasRelation(Value: String; Relations: Array of String): Boolean;
var I: Integer;
begin
  for I := 0 to 1 do begin
    if Pos(Relations[I], Value) > 0 then begin
      Result := true;
      Exit;
    end;
  end;
  Result := false;
end;

function PShortenSyntaxManager.GetTargetNames(TargetName: String): TStringList;
var
  TargetNames: TStringList;
  I, C, Code: Integer;
begin
  // targets are many
  TargetNames := Tokenize(TargetName, ',');

  // target is one
  Val(TargetName, C, Code);
  if Code = 0 then begin
    TargetNames.Clear;
    for I := 0 to C-1 do
      TargetNames.Add('');
  end;

  // if target name is null, add anonymous name
  if TargetNames.Count = 0 then
    TargetNames.Add('');

  Result := TargetNames;
end;

function PShortenSyntaxManager.CreateView(DiagramView: PDiagramView; TargetName: String): PNodeView;
var I: Integer;
begin
  Result := nil;
  with DiagramView.Diagram.DiagramOwner as PUMLNamespace do
    for I := 0 to OwnedElementCount-1 do
      if OwnedElements[I].Name = TargetName then
        if (OwnedElements[I] is PUMLClassifier) and (not (OwnedElements[I] is PUMLClassifierRole)) then begin
          Result := StarUMLApplication.NewView(DiagramView, 0, 0, 0, 0, OwnedElements[I]) as PNodeView;
          Exit;
        end;
end;

function PShortenSyntaxManager.CreateStateView(DiagramView: PDiagramView; TargetName: String): PNodeView;
var I: Integer;
begin
  Result := nil;

  if DiagramView is PUMLStateChartDiagramView then begin
    with ((DiagramView.Diagram.DiagramOwner as PUMLStateMachine).Top as PUMLCompositeState) do
      for I := 0 to SubvertexCount-1 do
        if Subvertices[I].Name = TargetName then begin
          Result := StarUMLApplication.NewView(DiagramView, 0, 0, 0, 0, Subvertices[I]) as PNodeView;
          Exit;
        end;
  end
  else begin
    with ((DiagramView.Diagram.DiagramOwner as PUMLActivityGraph).Top as PUMLCompositeState) do
      for I := 0 to SubvertexCount-1 do
        if Subvertices[I].Name = TargetName then begin
          Result := StarUMLApplication.NewView(DiagramView, 0, 0, 0, 0, Subvertices[I]) as PNodeView;
          Exit;
        end;
  end;
end;

function PShortenSyntaxManager.CreateSeqView(DiagramView: PDiagramView; TargetName: String): PNodeView;
var I: Integer;
begin
  Result := nil;

  if (DiagramView is PUMLSequenceDiagramView) or (DiagramView is PUMLCollaborationDiagramView) then begin
    with ((DiagramView.Diagram.DiagramOwner as PUMLInteractionInstanceSet).Context as PUMLCollaborationInstanceSet) do
      for I := 0 to ParticipatingInstanceCount-1 do
        if ParticipatingInstances[I].Name = TargetName then begin
          Result := StarUMLApplication.NewView(DiagramView, 0, 0, 0, 0, ParticipatingInstances[I]) as PNodeView;
          Exit;
        end;
  end
  else begin
    with ((DiagramView.Diagram.DiagramOwner as PUMLInteraction).Context as PUMLCollaboration) do
      for I := 0 to OwnedElementCount-1 do
        if OwnedElements[I].Name = TargetName then begin
          Result := StarUMLApplication.NewView(DiagramView, 0, 0, 0, 0, OwnedElements[I]) as PNodeView;
          Exit;
        end;
  end;
end;

function PShortenSyntaxManager.CreateViewWithModel(DiagramView: PDiagramView; TargetName: String;
      OutGoing: Boolean; NodeType1, NodeType2: String; NodeArgument: Integer): PNodeView;
var TargetView: PNodeView;
begin
  TargetView := nil;
  if not OutGoing then
    TargetView := StarUMLApplication.NewElement(
                    DiagramView, 0, 0, 0, 0, NodeType1, NodeArgument) as PNodeView
  else
    TargetView := StarUMLApplication.NewElement(
                    DiagramView, 0, 0, 0, 0, NodeType2, NodeArgument) as PNodeView;

  if TargetName <> '' then
    StarUMLApplication.ChangeModelName(TargetView.Model, TargetName);

  TargetView.Arrange(DiagramView.Canvas);

  Result := TargetView;
end;

procedure PShortenSyntaxManager.ArrangeNodeView(DiagramView: PDiagramView;
  TargetView, SourceView: PNodeView; OutGoing, IsLeftRight: Boolean);
begin
  if not IsLeftRight then begin
    if OutGoing then
      ArrangeView(DiagramView, TargetView, SourceView, atUp)
    else
      ArrangeView(DiagramView, TargetView, SourceView, atDown);
  end
  else begin
    if OutGoing then
      ArrangeView(DiagramView, TargetView, SourceView, atRight)
    else
      ArrangeView(DiagramView, TargetView, SourceView, atLeft);
  end;
end;

procedure PShortenSyntaxManager.ArrangeSeqView(
  SourceView, TargetView: PNodeView; EdgeView, ReturnEdgeView: PEdgeView; OutGoing: Boolean);
var
  DiagramView: PDiagramView;
  View: PView;
  MsgView: PEdgeView;
  I, C, H: Integer;
  PS: PPoints;

begin
  PS := PPoints.Create;
  PS.Assign(EdgeView.Points);
  PS.Points[0] := Point(EdgeView.Points.Points[0].X, SourceView.Top + (V_INT));
  PS.Points[1] := Point(EdgeView.Points.Points[1].X, SourceView.Top + (V_INT));
  StarUMLApplication.ChangeViewAttribute(EdgeView, 'Points', PointsToString(PS));
  PS.Free;

  DiagramView := SourceView.OwnerDiagramView;

  // find the bottom message of DiagramView and locate a message under the message
  C := DiagramView.OwnedViewCount;
  for I := 0 to C-1 do begin
    View := DiagramView.OwnedView[I];
    if (View is PUMLSeqMessageView) or (View is PUMLSeqStimulusView) then

      if View <> ReturnEdgeView then begin

        MsgView := View as PEdgeView;

        if EdgeView.Points.Points[0].Y <= MsgView.Points.Points[0].Y then begin
(*
          EdgeView.Points.Points[0] := Point(EdgeView.Points.Points[0].X, MsgView.Points.Points[0].Y + (V_INT div 2));
          EdgeView.Points.Points[1] := Point(EdgeView.Points.Points[1].X, MsgView.Points.Points[0].Y + (V_INT div 2));
*)

          PS := PPoints.Create;
          PS.Assign(EdgeView.Points);
          PS.Points[0] := Point(EdgeView.Points.Points[0].X, MsgView.Points.Points[0].Y + (V_INT div 2));
          PS.Points[1] := Point(EdgeView.Points.Points[1].X, MsgView.Points.Points[0].Y + (V_INT div 2));
          StarUMLApplication.ChangeViewAttribute(EdgeView, 'Points', PointsToString(PS));
          PS.Free;
        end;

      end;
  end;

  if ReturnEdgeView <> nil then begin
    EdgeView.Arrange(DiagramView.Canvas);
    H := GetActivationView(EdgeView).Height - 2;
(*
    ReturnEdgeView.Points.Points[0] := Point(EdgeView.Points.Points[1].X, EdgeView.Points.Points[0].Y+H);
    ReturnEdgeView.Points.Points[1] := Point(EdgeView.Points.Points[0].X, EdgeView.Points.Points[0].Y+H);
*)

    PS := PPoints.Create;
    PS.Assign(ReturnEdgeView.Points);
    PS.Points[0] := Point(EdgeView.Points.Points[1].X, EdgeView.Points.Points[0].Y+H);
    PS.Points[1] := Point(EdgeView.Points.Points[0].X, EdgeView.Points.Points[0].Y+H);
    StarUMLApplication.ChangeViewAttribute(ReturnEdgeView, 'Points', PointsToString(PS));
    PS.Free;
  end;

end;

function PShortenSyntaxManager.GetMultStr(var Str: String): String;
var
  Mults: Array[0..4] of String;
  I, L: Integer;
begin
  // 0..1, 0..*, 1..*, *, +
  Mults[0] := '0..1';
  Mults[1] := '0..*';
  Mults[2] := '1..*';
  Mults[3] := '*';
  Mults[4] := '+';

  for I := 0 to 4 do
    if Pos(Mults[I], Str) = 1 then begin
      Result := Mults[I];
      L := Length(Mults[I]);
      Str := Copy(Str, L+1, Length(Str)-L);
      Exit;
    end;
  Result := '';
end;


procedure PShortenSyntaxManager.SetMultiplicity(EdgeView: PEdgeView;
  OutGoing: Boolean; MultStr1, MultStr2: String);
begin
  if (MultStr1 <> '') or (MultStr2 <> '') then
    if OutGoing then
      with EdgeView.Model as PUMLAssociation do begin
        StarUMLApplication.ChangeModelAttribute(Connections[0], 'Multiplicity', MultStr1);
        StarUMLApplication.ChangeModelAttribute(Connections[1], 'Multiplicity', MultStr2);
      end
    else
      with EdgeView.Model as PUMLAssociation do begin
        StarUMLApplication.ChangeModelAttribute(Connections[1], 'Multiplicity', MultStr1);
        StarUMLApplication.ChangeModelAttribute(Connections[0], 'Multiplicity', MultStr2);
      end;
end;

function PShortenSyntaxManager.MakeView(Model: PModel;
  Rel1, Rel2, ShortenStr, NodeType1, NodeType2, EdgeType: String;
  IsLeftRight: Boolean; NodeArgument: Integer = 0; EdgeArgument: Integer = 0): PView;
var
  TargetName: String;
  Rel: String;
  OutGoing: Boolean;
  EdgeView: PView;
  SourceView, TargetView: PNodeView;
  DiagramView: PDiagramView;
  TargetNames: TStringList;
  I : Integer;
  MultStr1, MultStr2: String;
begin
  // Tail multiplicity
  // 0..1, 0..*, 1..*, *, +
  MultStr1 := GetMultStr(ShortenStr);

  // direction
  Rel := Copy(ShortenStr, 1, Length(Rel1));
  if Rel = Rel2 then
    OutGoing := true
  else if Rel = Rel1 then
    OutGoing := false
  else begin
    Result := nil;
    Exit;
  end;

  // target name
  TargetName := Copy(ShortenStr, Length(Rel1)+1, Length(ShortenStr)-Length(Rel1));

  // Head multiplicity
  // 0..1, 0..*, 1..*, *, +
  MultStr2 := GetMultStr(TargetName);

  // current selected diagram
  DiagramView := StarUMLApplication.ActiveDiagram;

  // current selected view
  SourceView := GetViewInDiagram(DiagramView, Model.Name) as PNodeView;

  // target names
  TargetNames := GetTargetNames(TargetName);

  // create view with target name
  for I := 0 to TargetNames.Count-1 do begin
    TargetName := TargetNames.Strings[I];

    // get target view in current diagram
    if TargetName = '' then
      TargetView := nil
    else
      TargetView := GetViewInDiagram(DiagramView, TargetName) as PNodeView;

    // try to create view from model if there doesn't exist target view.
    if TargetView = nil then
      TargetView := CreateView(DiagramView, TargetName);

    // if there is not view, create model and view together
    if TargetView = nil then
      TargetView := CreateViewWithModel(DiagramView, TargetName, OutGoing, NodeType1, NodeType2, NodeArgument);

    // create edge with two views
    if OutGoing then
      EdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, EdgeArgument, SourceView, TargetView)
    else
      EdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, EdgeArgument, TargetView, SourceView);

    // set multiplicity
    if EdgeView.Model is PUMLAssociation then
      SetMultiplicity(EdgeView as PEdgeView, OutGoing, MultStr1, MultStr2);

    // arrange views vertically or horizontally
    ArrangeNodeView(DiagramView, TargetView, SourceView, OutGoing, IsLeftRight);
  end;

  TargetNames.Free;

  Result := TargetView;
end;

function PShortenSyntaxManager.MakeStateView(Model: PModel;
  Rel1, Rel2, ShortenStr, NodeType1, NodeType2, EdgeType: String;
  IsLeftRight: Boolean; NodeArgument: Integer = 0; EdgeArgument: Integer = 0): PView;
var
  TargetName: String;
  Rel: String;
  OutGoing: Boolean;
  EdgeView: PView;
  SourceView, TargetView: PNodeView;
  DiagramView: PDiagramView;
  TargetNames: TStringList;
  I : Integer;
begin
  // direction
  Rel := Copy(ShortenStr, 1, Length(Rel1));
  if Rel = Rel2 then
    OutGoing := true
  else if Rel = Rel1 then
    OutGoing := false
  else begin
    Result := nil;
    Exit;
  end;

  // target name
  TargetName := Copy(ShortenStr, Length(Rel1)+1, Length(ShortenStr)-Length(Rel1));

  // current selected diagram
  DiagramView := StarUMLApplication.ActiveDiagram;

  // current selected view
  SourceView := GetViewInDiagram(DiagramView, Model.Name) as PNodeView;

  // target names
  TargetNames := GetTargetNames(TargetName);

  // creat view with target name
  for I := 0 to TargetNames.Count-1 do begin
    TargetName := TargetNames.Strings[I];

    // get target view in current diagram
    if TargetName = '' then
      TargetView := nil
    else
      TargetView := GetViewInDiagram(DiagramView, TargetName) as PNodeView;

    // if there is not target view, try to create view with model
    if TargetView = nil then
      TargetView := CreateStateView(DiagramView, TargetName);

    // if there is not view, create model and view together
    if TargetView = nil then
      TargetView := CreateViewWithModel(DiagramView, TargetName, OutGoing, NodeType1, NodeType2, NodeArgument);

    // create edge with two views
    if OutGoing then
      EdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, EdgeArgument, SourceView, TargetView)
    else
      EdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, EdgeArgument, TargetView, SourceView);

    // arrange views vertically or horizontally (vertical-reversed)
    ArrangeNodeView(DiagramView, TargetView, SourceView, not OutGoing, IsLeftRight);

  end;

  TargetNames.Free;

  Result := TargetView;
end;

function PShortenSyntaxManager.MakeSeqView(Model: PModel; Rel1, Rel2,
  ShortenStr, NodeType1, NodeType2, EdgeType: String; IsVertical: Boolean;
  NodeArgument: Integer = 0; EdgeArgument: Integer = 0; HasReturn: Boolean = false): PView;
var
  TargetName, MsgName: String;
  Rel: String;
  OutGoing: Boolean;
  EdgeView, ReturnEdgeView: PView;
  SourceView, TargetView: PNodeView;
  DiagramView: PDiagramView;
  TargetNames: TStringList;
  I, L, T, P : Integer;
begin
  // direction
  Rel := Copy(ShortenStr, 1, Length(Rel1));
  if Rel = Rel2 then
    OutGoing := true
  else if Rel = Rel1 then
    OutGoing := false
  else begin
    Result := nil;
    Exit;
  end;

  // parent or child name
  TargetName := Copy(ShortenStr, Length(Rel1)+1, Length(ShortenStr)-Length(Rel1));

  // current selected diagram
  DiagramView := StarUMLApplication.ActiveDiagram;

  // current selected view
  SourceView := GetViewInDiagram(DiagramView, Model.Name) as PNodeView;

  // target names
  TargetNames := TStringList.Create;
  TargetNames.Add(TargetName);

  // create view with target name
  for I := 0 to TargetNames.Count-1 do begin
    TargetName := TargetNames.Strings[I];

    // get target name and message name
    P := Pos('.', TargetName);
    if P > 0 then begin
      MsgName := Copy(TargetName, P+1, Length(TargetName)-P);
      TargetName := Copy(TargetName, 1, P-1);
    end
    else
      MsgName := '';

    // get target view in current diagram
    if TargetName = '' then
      TargetView := nil
    else
      TargetView := GetViewInDiagram(DiagramView, TargetName) as PNodeView;

    // get right most position of TargeView(Object) to be created
    if TargetView = nil then begin
      L := DiagramView.GetBoundingBox(DiagramView.Canvas).Right + (H_INT);
      T := DiagramView.GetBoundingBox(DiagramView.Canvas).Top;
    end;

    // if there is not target view, try to create view from model
    if TargetView = nil then begin
      TargetView := CreateSeqView(DiagramView, TargetName);

      // unless, create model and view together
      if TargetView = nil then
        TargetView := CreateViewWithModel(DiagramView, TargetName, OutGoing, NodeType1, NodeType2, NodeArgument);

      // move TargetView(Object) at right most position of curent range
//      TargetView.Left := L;
//      TargetView.Top := T;
      StarUMLApplication.ChangeViewAttribute(TargetView, 'Left', IntToStr(L));
      StarUMLApplication.ChangeViewAttribute(TargetView, 'Top', IntToStr(T));
    end;

    // create edge with two views
    if OutGoing then
      EdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, EdgeArgument, SourceView, TargetView)
    else
      EdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, EdgeArgument, TargetView, SourceView);

    // message name
    if MsgName <> '' then begin
      StarUMLApplication.ChangeModelName(EdgeView.Model, MsgName);
    end;

    // in case of existing return message
    if HasReturn then begin
      // create edge with two views
      if OutGoing then
        ReturnEdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, FA_STIMULUS_RETURNACTION, TargetView, SourceView)
      else
        ReturnEdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, FA_STIMULUS_RETURNACTION, SourceView, TargetView);
    end
    else
      ReturnEdgeView := nil;

    // arrange views
    ArrangeSeqView(SourceView as PNodeView, TargetView as PNodeView, EdgeView as PEdgeView, ReturnEdgeView as PEdgeView, OutGoing);
  end;

  TargetNames.Free;

  Result := TargetView;
end;

function PShortenSyntaxManager.MakeSeqMsgView(Model: PModel; Rel1, Rel2,
  ShortenStr, NodeType1, NodeType2, EdgeType: String; IsVertical: Boolean;
  NodeArgument: Integer = 0; EdgeArgument: Integer = 0;
  HasReturn: Boolean = false): PView;
var
  TargetName, MsgName: String;
  Rel: String;
  OutGoing: Boolean;
  EdgeView, ReturnEdgeView: PView;
  CurMsgView, ReturnMsgView: PEdgeView;
  LastMsgView: PEdgeView;
  SourceView, TargetView: PNodeView;
  DiagramView: PDiagramView;
  TargetNames: TStringList;
  I, L, T, P, Y, H : Integer;
  NextMsgY: Integer;
  Activation: PUMLActivationView;
  PS: PPoints;
begin
  // 방향
  Rel := Copy(ShortenStr, 1, Length(Rel1));
  if Rel = Rel2 then
    OutGoing := true
  else if Rel = Rel1 then
    OutGoing := false
  else begin
    Result := nil;
    Exit;
  end;

  // targe name
  TargetName := Copy(ShortenStr, Length(Rel1)+1, Length(ShortenStr)-Length(Rel1));

  // get current selected diagram
  DiagramView := StarUMLApplication.ActiveDiagram;

  // get current seleced view
  CurMsgView := GetViewInDiagram(DiagramView, Model) as PEdgeView;
  ReturnMsgView := GetReturnMsgView(DiagramView, CurMsgView);

  // get new message Y and last message reference
  LastMsgView := GetLastMessageView(DiagramView, CurMsgView);
  NextMsgY := GetNextMessagePosY(DiagramView, CurMsgView, LastMsgView);

  // get current view's head
  if Model is PUMLStimulus then
    SourceView := GetViewInDiagram(DiagramView, (Model as PUMLStimulus).Receiver) as PNodeView
  else
    SourceView := GetViewInDiagram(DiagramView, (Model as PUMLMessage).Receiver) as PNodeView;

  // get target name
  TargetNames := GetTargetNames(TargetName);

  // insert spaces by target number to current selected view(message) and under that
  MoveDown(DiagramView, CurMsgView, TargetNames.Count, LastMsgView, HasReturn);

  // create view by target name
  for I := 0 to TargetNames.Count-1 do begin
    TargetName := TargetNames.Strings[I];

    // get target name and message name
    P := Pos('.', TargetName);
    if P > 0 then begin
      MsgName := Copy(TargetName, P+1, Length(TargetName)-P);
      TargetName := Copy(TargetName, 1, P-1);
    end
    else
      MsgName := '';

    // get target view in current diagram
    if TargetName = '' then
      TargetView := nil
    else
      TargetView := GetViewInDiagram(DiagramView, TargetName) as PNodeView;

    // get right most position of TargetView(Object) to be created
    if TargetView = nil then begin
      L := DiagramView.GetBoundingBox(DiagramView.Canvas).Right + (H_INT);
      T := DiagramView.GetBoundingBox(DiagramView.Canvas).Top;
    end;

    // if there is not target view, try to create view from model
    if TargetView = nil then begin
      TargetView := CreateSeqView(DiagramView, TargetName);

      // if there is not view, create model and view
      if TargetView = nil then
        TargetView := CreateViewWithModel(DiagramView, TargetName, OutGoing, NodeType1, NodeType2, NodeArgument);

      // move TargetView(Object) at right most position of range
//      TargetView.Left := L;
//      TargetView.Top := T;
      StarUMLApplication.ChangeViewAttribute(TargetView, 'Left', IntToStr(L));
      StarUMLApplication.ChangeViewAttribute(TargetView, 'Top', IntToStr(T));
    end;

    // create edge with two views
    if OutGoing then
      EdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, EdgeArgument, SourceView, TargetView)
    else
      EdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, EdgeArgument, TargetView, SourceView);

    // set message name
    if MsgName <> '' then begin
      StarUMLApplication.ChangeModelName(EdgeView.Model, MsgName);
    end;

    // in case of having return
    if HasReturn then begin
      // create edge with 2 views
      if OutGoing then
        ReturnEdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, FA_STIMULUS_RETURNACTION, TargetView, SourceView)
      else
        ReturnEdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, FA_STIMULUS_RETURNACTION, SourceView, TargetView);
    end
    else
      ReturnEdgeView := nil;

    // arrange view
    with EdgeView as PEdgeView do begin
(*
      Points.Points[0] := Point(Points.Points[0].X, NextMsgY + (V_INT) * (I+1));
      Points.Points[1] := Point(Points.Points[1].X, NextMsgY + (V_INT) * (I+1));
*)

      PS := PPoints.Create;
      PS.Assign(Points);
      PS.Points[0] := Point(Points.Points[0].X, NextMsgY + (V_INT) * (I+1));
      PS.Points[1] := Point(Points.Points[1].X, NextMsgY + (V_INT) * (I+1));
      StarUMLApplication.ChangeViewAttribute(EdgeView, 'Points', PointsToString(PS));
      PS.Free;
    end;

    // in case of self message, move down
    if SourceView = TargetView then begin
      MoveDown(DiagramView, CurMsgView, TargetNames.Count, EdgeView as PEdgeView, HasReturn);
    end;

    if HasReturn then begin
      with ReturnEdgeView as PEdgeView do begin
        EdgeView.Arrange(DiagramView.Canvas);
        H := GetActivationView(EdgeView).Height - 2;
(*
        Points.Points[0] := Point((EdgeView as PEdgeView).Points.Points[1].X, (EdgeView as PEdgeView).Points.Points[1].Y+H);
        Points.Points[1] := Point((EdgeView as PEdgeView).Points.Points[0].X, (EdgeView as PEdgeView).Points.Points[0].Y+H);
*)
        PS := PPoints.Create;
        PS.Assign(Points);
        PS.Points[0] := Point((EdgeView as PEdgeView).Points.Points[1].X, (EdgeView as PEdgeView).Points.Points[1].Y+H);
        PS.Points[1] := Point((EdgeView as PEdgeView).Points.Points[0].X, (EdgeView as PEdgeView).Points.Points[0].Y+H);
        StarUMLApplication.ChangeViewAttribute(ReturnEdgeView, 'Points', PointsToString(PS));
        PS.Free;
      end;
    end;

    // extends Activation
    EdgeView.Arrange(DiagramView.Canvas);
    // extends height of all message's activation in CurMsgView.Points.Points[0].Y range to V_INT
    ArrangeActivation(DiagramView, CurMsgView, ReturnMsgView, NextMsgY,
      LastMsgView, EdgeView as PEdgeView, HasReturn);

    // process Activation length for self message
    if (SourceView = TargetView) and (ReturnMsgView <> nil) then begin
      Activation := GetActivationView(EdgeView);
      Activation.Arrange(DiagramView.Canvas);
      H := Activation.Bottom+2;
(*
      ReturnMsgView.Points.Points[0] := Point(ReturnMsgView.Points.Points[0].X, H);
      ReturnMsgView.Points.Points[1] := Point(ReturnMsgView.Points.Points[1].X, H);
*)
      PS := PPoints.Create;
      PS.Assign(ReturnMsgView.Points);
      PS.Points[0] := Point(ReturnMsgView.Points.Points[0].X, H);
      PS.Points[1] := Point(ReturnMsgView.Points.Points[1].X, H);
      StarUMLApplication.ChangeViewAttribute(ReturnMsgView, 'Points', PointsToString(PS));
      PS.Free;
    end;

  end;

  TargetNames.Free;

  Result := TargetView;
end;

function PShortenSyntaxManager.GetLinkView(SourceView, TargetView: PNodeView): PEdgeView;
var I: Integer;
begin
  with SourceView.OwnerDiagramView do
    for I := 0 to OwnedViewCount-1 do
      if OwnedView[I] is PUMLLinkView then
        with (OwnedView[I] as PUMLLinkView) do
          if ((Head = SourceView) and (Tail = TargetView)) or
             ((Tail = SourceView) and (Head = TargetView)) then begin
            Result := OwnedView[I] as PEdgeView;
            Exit;
          end;
  Result := nil;
end;

function PShortenSyntaxManager.CreateLinkView(OutGoing: Boolean;
  SourceView, TargetView: PNodeView): PEdgeView;
var EdgeView: PEdgeView;
begin
  if OutGoing then
    EdgeView := StarUMLApplication.NewElement(
      SourceView.OwnerDiagramView, 'Link', 0, SourceView, TargetView) as PEdgeView
  else
    EdgeView := StarUMLApplication.NewElement(
      SourceView.OwnerDiagramView, 'Link', 0, TargetView, SourceView) as PEdgeView;

  EdgeView.Arrange(SourceView.OwnerDiagramView.Canvas);

  Result := EdgeView;
end;

function PShortenSyntaxManager.MakeColView(Model: PModel; Rel1, Rel2,
  ShortenStr, NodeType1, NodeType2, EdgeType: String; IsLeftRight: Boolean;
  NodeArgument, EdgeArgument: Integer): PView;
var
  TargetName, MsgName: String;
  Rel: String;
  OutGoing: Boolean;
  EdgeView: PView;
  LinkView: PEdgeView;
  SourceView, TargetView: PNodeView;
  DiagramView: PDiagramView;
  TargetNames: TStringList;
  I, L, T, P : Integer;
begin
  // 방향
  Rel := Copy(ShortenStr, 1, Length(Rel1));
  if Rel = Rel2 then
    OutGoing := true
  else if Rel = Rel1 then
    OutGoing := false
  else begin
    Result := nil;
    Exit;
  end;

  // parent or child name
  TargetName := Copy(ShortenStr, Length(Rel1)+1, Length(ShortenStr)-Length(Rel1));

  // get current selected diagram
  DiagramView := StarUMLApplication.ActiveDiagram;

  // get current selected view
  SourceView := GetViewInDiagram(DiagramView, Model.Name) as PNodeView;

  // get target name
  TargetNames := GetTargetNames(TargetName);

  // create view by target name
  for I := 0 to TargetNames.Count-1 do begin
    TargetName := TargetNames.Strings[I];

    // get target name and message name
    P := Pos('.', TargetName);
    if P > 0 then begin
      MsgName := Copy(TargetName, P+1, Length(TargetName)-P);
      TargetName := Copy(TargetName, 1, P-1);
    end
    else
      MsgName := '';

    // get target view in current diagram
    if TargetName = '' then
      TargetView := nil
    else
      TargetView := GetViewInDiagram(DiagramView, TargetName) as PNodeView;

    // if there is not target view, try to create view from model
    if TargetView = nil then
      TargetView := CreateSeqView(DiagramView, TargetName);

    // but if there is not view, create model and view
    if TargetView = nil then
      TargetView := CreateViewWithModel(DiagramView, TargetName, OutGoing, NodeType1, NodeType2, NodeArgument);

    // get link with 2 views
    LinkView := GetLinkView(SourceView, TargetView);

    // if there is not Link, create Link
    if LinkView = nil then
      LinkView := CreateLinkView(OutGoing, SourceView, TargetView);

    // attach Stimulus or Message to Link
    with LinkView do
      EdgeView := StarUMLApplication.NewElement(
        DiagramView,
        Points.Points[0].X, Points.Points[0].Y,
        Points.Points[1].X, Points.Points[1].Y,
        EdgeType, EdgeArgument);

    if OutGoing then begin
      StarUMLApplication.ChangeModelReference(EdgeView.Model, 'Sender', SourceView.Model);
      StarUMLApplication.ChangeModelReference(EdgeView.Model, 'Receiver', TargetView.Model);
    end
    else begin
      StarUMLApplication.ChangeModelReference(EdgeView.Model, 'Sender', TargetView.Model);
      StarUMLApplication.ChangeModelReference(EdgeView.Model, 'Receiver', SourceView.Model);
    end;

    // set message name
    if MsgName <> '' then begin
      StarUMLApplication.ChangeModelName(EdgeView.Model, MsgName);
    end;

    // arrange view vertically or horizontally (vertiacl-reversed)
    ArrangeNodeView(DiagramView, TargetView, SourceView, OutGoing, IsLeftRight);
  end;

  TargetNames.Free;

  Result := TargetView;
end;

function PShortenSyntaxManager.GetViewInDiagram(DiagramView: PDiagramView;
  Name: String): PView;
var
  I, C: Integer;
  View: PView;
begin
  C := DiagramView.OwnedViewCount;
  for I := 0 to C-1 do begin
    View := DiagramView.OwnedView[I];
    if Assigned(View.Model) and (View.Model.Name = Name) then begin
      Result := View;
      Exit;
    end;
  end;
  Result := nil;
end;

function PShortenSyntaxManager.GetViewInDiagram(DiagramView: PDiagramView;
  Model: PModel): PView;
var
  I, C: Integer;
  View: PView;
begin
  C := DiagramView.OwnedViewCount;
  for I := 0 to C-1 do begin
    View := DiagramView.OwnedView[I];
    if View.Model = Model then begin
      Result := View;
      Exit;
    end;
  end;
  Result := nil;
end;

procedure PShortenSyntaxManager.ArrangeView(DiagramView: PDiagramView;
  TargetView, SourceView: PNodeView; ArrangeType: PArrangeType);

var _H_INT, _V_INT: Integer;

  function OverlapRect(Left, Top, Right, Bottom: Integer): Boolean;
  var I, C: Integer;
  begin
    if (Left < 0) or (Top < 0) or (Right < 0) or (Bottom < 0) then begin
      Result := true;
      Exit;
    end;

    C := DiagramView.OwnedViewCount;
    for I := 0 to C-1 do
      if DiagramView.OwnedView[I] is PNodeView then
        if DiagramView.OwnedView[I].
          OverlapRect(DiagramView.Canvas, Left, Top, Right, Bottom) then begin
            Result := true;
            Exit;
        end;
    Result := false;
  end;

  procedure SetBound(Left, Top, Right, Bottom: Integer);
  begin
    StarUMLApplication.ChangeViewAttribute(TargetView, 'Left', IntToStr(Left));
    StarUMLApplication.ChangeViewAttribute(TargetView, 'Top', IntToStr(Top));
    StarUMLApplication.ChangeViewAttribute(TargetView, 'Right', IntToStr(Right));
    StarUMLApplication.ChangeViewAttribute(TargetView, 'Bottom', IntToStr(Bottom));
  end;

  procedure ArrangeRect(Left, Top, Right, Bottom, Interval: Integer);
  var I, C: Integer;
  begin
    if Left < 0 then Left := 0;
    if Top < 0 then Top := 0;
    if Right < 0 then Right := 0;
    if Bottom < 0 then Bottom := 0;

    // give center rect and interval
    if (ArrangeType = atUp) or (ArrangeType = atDown) then begin
      // compare right
      if not OverlapRect(Left+Interval, Top, Right+Interval, Bottom) then begin
        SetBound(Left+Interval, Top, Right+Interval, Bottom);
        exit;
      end;

      // compare left
      if not OverlapRect(Left-Interval, Top, Right-Interval, Bottom) then begin
        SetBound(Left-Interval, Top, Right-Interval, Bottom);
        exit;
      end;

      // increase interval and arrange recursively
      ArrangeRect(Left, Top, Right, Bottom, Interval+_H_INT+TargetView.Width);
    end
    else begin
      // compare bottom
      if not OverlapRect(Left, Top+Interval, Right, Bottom+Interval) then begin
        SetBound(Left, Top+Interval, Right, Bottom+Interval);
        exit;
      end;

      // compare top
      if not OverlapRect(Left, Top-Interval, Right, Bottom-Interval) then begin
        SetBound(Left, Top-Interval, Right, Bottom-Interval);
        exit;
      end;

      // increase interval and arrange recursively
      ArrangeRect(Left, Top, Right, Bottom, Interval+_V_INT+TargetView.Height);
    end;
  end;

begin
  if (SourceView.OwnerDiagramView is PUMLCollaborationDiagramView) or
     (SourceView.OwnerDiagramView is PUMLCollaborationDiagramView) then begin
    _V_INT := V_INT*2;
    _H_INT := H_INT*2;
  end
  else begin
    _V_INT := V_INT;
    _H_INT := H_INT;
  end;

  if (TargetView.Left <> 0) and (TargetView.Top <> 0) then Exit;

  case ArrangeType of
    atUp:
      ArrangeRect(
        SourceView.Left       +((SourceView.Width - TargetView.Width) div 2),
        SourceView.Top-_V_INT-TargetView.Height,
        SourceView.Right      -((SourceView.Width - TargetView.Width) div 2),
        SourceView.Top-_V_INT,
        0);
    atDown:
      ArrangeRect(
        SourceView.Left       +((SourceView.Width - TargetView.Width) div 2),
        SourceView.Bottom+_V_INT,
        SourceView.Right      -((SourceView.Width - TargetView.Width) div 2),
        SourceView.Bottom+_V_INT+TargetView.Height,
        0);
    atLeft:
      ArrangeRect(
        SourceView.Left-_H_INT-TargetView.Width,
        SourceView.Top        +((SourceView.Height - TargetView.Height) div 2),
        SourceView.Left-_H_INT,
        SourceView.Bottom     -((SourceView.Height - TargetView.Height) div 2),
        0);
    atRight:
      ArrangeRect(
        SourceView.Right+_H_INT,
        SourceView.Top        +((SourceView.Height - TargetView.Height) div 2),
        SourceView.Right+_H_INT+TargetView.Width,
        SourceView.Bottom     -((SourceView.Height - TargetView.Height) div 2),
        0);
  end;
end;

function PShortenSyntaxManager.Execute(FModel: PModel; Value: String): Boolean;
begin
  // start command block
  StarUMLApplication.BeginGrouping;

  try
    if (FModel is PUMLClassifier) and (not (FModel is PUMLClassifierRole)) then begin
      Result := ExecuteClassifier(FModel, Value)
    end
    else if FModel is PUMLState then begin
      Result := ExecuteState(FModel, Value)
    end
    else if (FModel is PUMLObject) or (FModel is PUMLClassifierRole) then begin
      Result := ExecuteObject(FModel, Value)
    end
    else if (FModel is PUMLStimulus) or (FModel is PUMLMessage) then begin
      Result := ExecuteMessage(FModel, Value)
    end
    else
      Result := false;
  finally
    // end command block
    StarUMLApplication.EndGrouping;
  end;
end;

function PShortenSyntaxManager.ExecuteClassifier(FModel: PModel; Value: String): Boolean;
var
  NodeType: String;
  View: PView;
begin
  NodeType := Copy(FModel.MetaClass.Name, 4, Length(FModel.MetaClass.Name)-3);
  // generalization
  if HasRelation(Value, ['<=', '=>']) then
    View := MakeView(FModel, '<=', '=>', Value, NodeType, NodeType, 'Generalization', false)
  // communication (usecase)
  else if HasRelation(Value, ['()-', '-()']) then
    View := MakeView(FModel, '()-', '-()', Value, 'Actor', 'UseCase', 'Association', true)
  // dependency 1
  else if HasRelation(Value, ['<--', '-->']) then
    View := MakeView(FModel, '<--', '-->', Value, NodeType, NodeType, 'Dependency', true)
  // dependency 2
  else if HasRelation(Value, [')-', '-(']) then
    View := MakeView(FModel, ')-', '-(', Value, NodeType, 'Interface', 'Dependency', false)

  // realization
  else if HasRelation(Value, ['@-', '-@']) then begin
    if NodeType <> 'Interface' then
      View := MakeView(FModel, '@-', '-@', Value, 'Interface', 'Interface', 'Realization', false)
    else
      View := MakeView(FModel, '@-', '-@', Value, NodeType, NodeType, 'Realization', false)
  end

  // assoication
  else if HasRelation(Value, ['--', '--']) then
    View := MakeView(FModel, '--', '--', Value, NodeType, NodeType, 'Association', true)
  // directed assoication
  else if HasRelation(Value, ['<-', '->']) then
    View := MakeView(FModel, '<-', '->', Value, NodeType, NodeType, 'Association', true, 0, FA_DIRECTED_ASSOCIATION)
  // aggregation
  else if HasRelation(Value, ['<>-', '-<>']) then
    View := MakeView(FModel, '<>-', '-<>', Value, NodeType, NodeType, 'Association', false, 0, FA_AGGREGATION)
  // compositoin
  else if HasRelation(Value, ['<*>-', '-<*>']) then
    View := MakeView(FModel, '<*>-', '-<*>', Value, NodeType, NodeType, 'Association', false, 0, FA_COMPOSITION)
  // Include (usecase)
  else if HasRelation(Value, ['<i-', '-i>']) then
    View := MakeView(FModel, '<i-', '-i>', Value, 'UseCase', 'UseCase', 'Include', true)
  // Extends (usecase)
  else if HasRelation(Value, ['<e-', '-e>']) then
    View := MakeView(FModel, '<e-', '-e>', Value, 'UseCase', 'UseCase', 'Extend', true)
  // else
  else
    View := nil;

  Result := (View <> nil);
end;

function PShortenSyntaxManager.ExecuteState(FModel: PModel; Value: String): Boolean;
var
  NodeType: String;
  Rel, ArgStr: String;
  View, SyncView: PView;
  Args: TStringList;
  I, C, Code: Integer;
begin
  NodeType := Copy(FModel.MetaClass.Name, 4, Length(FModel.MetaClass.Name)-3);

  // decision
  if HasRelation(Value, ['<-<>', '-><>']) then
    View := MakeStateView(FModel, '<-<>', '-><>', Value, 'Pseudostate', 'Pseudostate', 'Transition', false, FA_PSEUDOSTATE_DECISION)
  // synchronization
  else if HasRelation(Value, ['<-|', '->|']) then begin
    Rel := Copy(Value, 1, 2);
    ArgStr := Copy(Value, 4, Length(Value)-3);
    SyncView := MakeStateView(FModel, '<-', '->', Rel, 'Pseudostate', 'Pseudostate', 'Transition', false, FA_PSEUDOSTATE_SYNCHRONIZATION);

    Args := Tokenize(ArgStr, ',');

    Val(ArgStr, C, Code);
    if Code = 0 then begin
      Args.Clear;
      for I := 0 to C-1 do
        Args.Add('');
    end;

    for I := 0 to Args.Count-1 do begin
      if StarUMLApplication.ActiveDiagram is PUMLStateChartDiagramView then
        View := MakeStateView(SyncView.Model, '<-', '->', Rel+Args.Strings[I], 'State', 'State', 'Transition', false)
      else
        View := MakeStateView(SyncView.Model, '<-', '->', Rel+Args.Strings[I], 'ActionState', 'ActionState', 'Transition', false)
    end;

    Args.Free;
  end
  // transition
  else if HasRelation(Value, ['<-', '->']) then begin
    if StarUMLApplication.ActiveDiagram is PUMLStateChartDiagramView then
      View := MakeStateView(FModel, '<-', '->', Value, 'State', 'State', 'Transition', false)
    else
      View := MakeStateView(FModel, '<-', '->', Value, 'ActionState', 'ActionState', 'Transition', false)
  end
  // start state
  else if HasRelation(Value, ['-*', '**']) then
    View := MakeStateView(FModel, '-*', '**', Value, 'Pseudostate', 'Pseudostate', 'Transition', false, FA_PSEUDOSTATE_INITIALSTATE)
  // shallow history state
  else if HasRelation(Value, ['****', '-(H)']) then
    View := MakeStateView(FModel, '****', '-(H)', Value, 'Pseudostate', 'Pseudostate', 'Transition', false, FA_PSEUDOSTATE_SHALLOWHISTORY)
  // shallow history state
  else if HasRelation(Value, ['****', '-(h)']) then
    View := MakeStateView(FModel, '****', '-(h)', Value, 'Pseudostate', 'Pseudostate', 'Transition', false, FA_PSEUDOSTATE_SHALLOWHISTORY)
  // deep history state
  else if HasRelation(Value, ['*****', '-(H*)']) then
    View := MakeStateView(FModel, '*****', '-(H*)', Value, 'Pseudostate', 'Pseudostate', 'Transition', false, FA_PSEUDOSTATE_DEEPHISTORY)
  // shallow history state
  else if HasRelation(Value, ['*****', '-(h*)']) then
    View := MakeStateView(FModel, '*****', '-(h*)', Value, 'Pseudostate', 'Pseudostate', 'Transition', false, FA_PSEUDOSTATE_DEEPHISTORY)
  // end state
  else if HasRelation(Value, ['@@', '-@']) then
    View := MakeStateView(FModel, '@@', '-@', Value, 'Pseudostate', 'FinalState', 'Transition', false)
  else
    View := nil;

  Result := (View <> nil);
end;

function PShortenSyntaxManager.ExecuteObject(FModel: PModel;
  Value: String): Boolean;
var
  View: PView;
begin
  if StarUMLApplication.ActiveDiagram is PUMLSequenceDiagramView then begin
    if HasRelation(Value, ['<->', '<->']) then
      View := MakeSeqView(FModel, '<->', '<->', Value, 'Object', 'Object', 'Stimulus', true, 0, 0, true)
    else if HasRelation(Value, ['<-', '->']) then
      View := MakeSeqView(FModel, '<-', '->', Value, 'Object', 'Object', 'Stimulus', true)
    else
      View := nil;
  end
  else if StarUMLApplication.ActiveDiagram is PUMLSequenceRoleDiagramView then begin
    if HasRelation(Value, ['<->', '<->']) then
      View := MakeSeqView(FModel, '<->', '<->', Value, 'ClassifierRole', 'ClassifierRole', 'Message', true, 0, 0, true)
    else if HasRelation(Value, ['<-', '->']) then
      View := MakeSeqView(FModel, '<-', '->', Value, 'ClassifierRole', 'ClassifierRole', 'Message', true)
    else
      View := nil;
  end
  else if StarUMLApplication.ActiveDiagram is PUMLCollaborationDiagramView then begin
    if HasRelation(Value, ['<-', '->']) then
      View := MakeColView(FModel, '<-', '->', Value, 'Object', 'Object', 'Stimulus', true)
    else
      View := nil;
  end
  else if StarUMLApplication.ActiveDiagram is PUMLCollaborationDiagramView then begin
    if HasRelation(Value, ['<-', '->']) then
      View := MakeColView(FModel, '<-', '->', Value, 'ClassifierRole', 'ClassifierRole', 'Message', true)
    else
      View := nil;
  end
  else
    View := nil;

  Result := (View <> nil);
end;

function PShortenSyntaxManager.ExecuteMessage(FModel: PModel;
  Value: String): Boolean;
var
  View: PView;
begin
  if StarUMLApplication.ActiveDiagram is PUMLSequenceDiagramView then begin
    if HasRelation(Value, ['<->', '<->']) then
      View := MakeSeqMsgView2(FModel, '<->', '<->', Value, 'Object', 'Object', 'Stimulus', true, 0, 0, true)
    else if HasRelation(Value, ['<-', '->']) then
      View := MakeSeqMsgView2(FModel, '<-', '->', Value, 'Object', 'Object', 'Stimulus', true)
    else if HasRelation(Value, ['<~', '~>']) then
      View := MakeSeqMsgView2(FModel, '<~', '~>', Value, 'Object', 'Object', 'Stimulus', true)
    else if HasRelation(Value, ['<_', '_>']) then
      View := MakeSeqMsgView2(FModel, '<_', '_>', Value, 'Object', 'Object', 'Stimulus', true)
    else
      View := nil;
  end
  else if StarUMLApplication.ActiveDiagram is PUMLSequenceRoleDiagramView then begin
    if HasRelation(Value, ['<->', '<->']) then
      View := MakeSeqMsgView2(FModel, '<->', '<->', Value, 'ClassifierRole', 'ClassifierRole', 'Message', true, 0, 0, true)
    else if HasRelation(Value, ['<-', '->']) then
      View := MakeSeqMsgView2(FModel, '<-', '->', Value, 'ClassifierRole', 'ClassifierRole', 'Message', true)
    else if HasRelation(Value, ['<~', '~>']) then
      View := MakeSeqMsgView2(FModel, '<~', '~>', Value, 'ClassifierRole', 'ClassifierRole', 'Message', true)
    else if HasRelation(Value, ['<_', '_>']) then
      View := MakeSeqMsgView2(FModel, '<_', '_>', Value, 'ClassifierRole', 'ClassifierRole', 'Message', true)
    else
      View := nil;
  end
  else
    View := nil;

  Result := (View <> nil);
end;

function PShortenSyntaxManager.GetReturnMsgView(DiagramView: PDiagramView; MsgView: PEdgeView): PEdgeView;
var
  I: Integer;
  ActivationView: PUMLActivationView;
  ReturnMsgView: PEdgeView;
  EdgeView: PEdgeView;
begin
  ReturnMsgView := nil;
  if MsgView <> nil then begin
    ActivationView := GetActivationView(MsgView);
    with DiagramView do
      for I := 0 to OwnedViewCount-1 do
        if (OwnedView[I] is PUMLSeqStimulusView) or
           (OwnedView[I] is PUMLSeqMessageView) then begin

          EdgeView := OwnedView[I] as PEdgeView;
          if (EdgeView.Model.MOF_GetReference('Action') is PUMLReturnAction) and
             (GetActivation(EdgeView.Tail as PNodeView, EdgeView.Points.Points[0].Y) = ActivationView) then
            ReturnMsgView := EdgeView;
        end;
  end;
  Result := ReturnMsgView;
end;

procedure PShortenSyntaxManager.MoveDown(DiagramView: PDiagramView;
  CurMsgView: PEdgeView; SpaceCount: Integer; LastMsgView: PEdgeView; HasReturn: Boolean = false);
var
  Top, I: Integer;
  ActivationView: PUMLActivationView;
  ReturnMsgView, LastReturnMsgView: PEdgeView;
  EdgeView: PEdgeView;
begin
  // put spaces for target which is current slected view(message) and under it

  // current selected message height
  Top := Self.GetNextMessagePosY(DiagramView, CurMsgView, LastMsgView);

  // deselect all in diagram
  DiagramView.DeselectAll;

  // get ReturnMsgView
  ReturnMsgView := GetReturnMsgView(DiagramView, CurMsgView);
  LastReturnMsgView := GetReturnMsgView(DiagramView, LastMsgView);

  // compare and select
  with DiagramView do
    for I := 0 to OwnedViewCount-1 do
      if (OwnedView[I] is PUMLSeqStimulusView) or
         (OwnedView[I] is PUMLSeqMessageView) then
        if ((OwnedView[I] as PEdgeView).Points.Points[0].Y > Top) and
           (LastReturnMsgView <> OwnedView[I]) then
          OwnedView[I].Selected := True;
//          StarUMLApplication.ChangeViewAttribute(OwnedViews[I], 'Selected', BooleanToString(True));

  // Move
  StarUMLApplication.MoveSelectedViews(0, (V_INT) * SpaceCount);
  DiagramView.DeselectAll;

  // restore original status
  CurMsgView.Selected := True;
//  StarUMLApplication.ChangeViewAttribute(CurMsgView, 'Selected', BooleanToString(True));
end;

function PShortenSyntaxManager.GetNextMessagePosY(
  DiagramView: PDiagramView; CurMsgView, LastMsgView: PEdgeView): Integer;
begin
  // if doesn't exist, return CurMsgView's Y
  if LastMsgView <> nil then begin
//    if LastMsgView.Head = LastMsgView.Tail then
//      Result := GetActivationView(LastMsgView).Top
//    else
    Result := LastMsgView.Points.Points[0].Y
  end
  else
    Result := CurMsgView.Points.Points[0].Y;
end;

function PShortenSyntaxManager.GetLastMessageView(
  DiagramView: PDiagramView; CurMsgView: PEdgeView): PEdgeView;
var
  ActivationView, AV: PNodeView;
  ReturnMsgView: PEdgeView;
  I, Value: Integer;
  L, T, R, B: Integer;
begin
  // exclude ReturnMsgView correspond to CurMsgView

  // if doesn't exist, return CurMsgView's Y
  Value := CurMsgView.Points.Points[0].Y;
  Result := nil;

  // get Activation connected to current selected message
  ActivationView := GetActivation(CurMsgView.Head as PNodeView, Value);

  // get CurMsgView's ReturnMsgView
  ReturnMsgView := GetReturnMsgView(DiagramView, CurMsgView);

  // find the most bottom message of all Message whose Tail in diagram is ActivationView
  if ActivationView <> nil then
    with DiagramView do
      for I := 0 to OwnedViewCount-1 do
        if (OwnedView[I] is PUMLSeqStimulusView) or
           (OwnedView[I] is PUMLSeqMessageView) then

          if OwnedView[I] <> ReturnMsgView then begin

            AV := GetActivation(
                  (OwnedView[I] as PEdgeView).Tail as PNodeView,
                  (OwnedView[I] as PEdgeView).Points.Points[0].Y);

            if (AV <> nil) and Overlap(
//                  Rect(ActivationView.Left-20, ActivationView.Top, ActivationView.Right+20, ActivationView.Bottom),
                  Rect(ActivationView.Left, ActivationView.Top, ActivationView.Right, ActivationView.Bottom),
                  Rect(AV.Left, AV.Top, AV.Right, AV.Bottom)
                ) then

              if (OwnedView[I] as PEdgeView).Points.Points[0].Y > Value then begin
                Value := (OwnedView[I] as PEdgeView).Points.Points[0].Y;
                Result := (OwnedView[I] as PEdgeView);
              end;


            AV := GetActivation(
                  (OwnedView[I] as PEdgeView).Head as PNodeView,
                  (OwnedView[I] as PEdgeView).Points.Points[0].Y);

            if (AV <> nil) and
               (not (OwnedView[I].Model.MOF_GetReference('Action') is PUMLReturnAction)) and
                Overlap(
//                  Rect(ActivationView.Left-20, ActivationView.Top, ActivationView.Right+20, ActivationView.Bottom),
                  Rect(ActivationView.Left, ActivationView.Top, ActivationView.Right, ActivationView.Bottom),
                  Rect(AV.Left, AV.Top, AV.Right, AV.Bottom)
                ) then

              if (OwnedView[I] as PEdgeView).Points.Points[0].Y > Value then begin
                Value := (OwnedView[I] as PEdgeView).Points.Points[0].Y;
                Result := (OwnedView[I] as PEdgeView);
              end;

          end;
end;

function PShortenSyntaxManager.GetActivation(LifeLineView: PNodeView;
  Value: Integer): PUMLActivationView;
begin
  if LifeLineView is PUMLLifeLineView then
    Result := (LifeLineView as PUMLLifeLineView).GetActivationAt(Value)
  else
    Result := nil;
end;

procedure PShortenSyntaxManager.ArrangeActivation(
  DiagramView: PDiagramView; CurMsgView, ReturnMsgView: PEdgeView;
  PY: Integer; LastMsgView, EdgeView: PEdgeView; HasReturn: Boolean = false);
var
  I, B, B1, B2: Integer;
  View: PView;
  ActivationView: PUMLActivationView;
  PS: PPoints;
//  ReturnMsgView: PEdgeView;
begin
  // extend size of parent Activation of CurMsgView
  ActivationView := GetActivationView(CurMsgView);
  StarUMLApplication.ChangeViewAttribute(
    ActivationView, 'Height', IntToStr(ActivationView.Height+V_INT));

  ActivationView.Arrange(DiagramView.Canvas);

  // locate ReturnMsgView opposite CurMsgView at end of ActivationView
  if ReturnMsgView <> nil then begin
    B1 := ActivationView.Bottom;
    B2 := GetActivationView(EdgeView).Bottom;
    if B1 > B2 then B := B1
    else B := B2;
(*
    ReturnMsgView.Points.Points[0] := Point(ReturnMsgView.Points.Points[0].X, B-1);
    ReturnMsgView.Points.Points[1] := Point(ReturnMsgView.Points.Points[1].X, B-1);
*)
    PS := PPoints.Create;
    PS.Assign(ReturnMsgView.Points);
    PS.Points[0] := Point(ReturnMsgView.Points.Points[0].X, B-1);
    PS.Points[1] := Point(ReturnMsgView.Points.Points[1].X, B-1);
    StarUMLApplication.ChangeViewAttribute(ReturnMsgView, 'Points', PointsToString(PS));
    PS.Free;

  end;

  // extend height to V_INT for all Activation in CurMsgView.Points.Points[0].Y of range
  for I := 0 to DiagramView.OwnedViewCount-1 do begin
    View := DiagramView.OwnedView[I];
    if (CurMsgView <> View) and (LastMsgView <> View) and ((View is PUMLSeqStimulusView) or (View is PUMLSeqMessageView)) then begin
      ActivationView := GetActivationView(View);
      if (ActivationView.Top <= PY) and (PY <= ActivationView.Bottom) then
        StarUMLApplication.ChangeViewAttribute(
          ActivationView, 'Height', IntToStr(ActivationView.Height+V_INT));
    end;
  end;
end;

function PShortenSyntaxManager.GetActivationView(MsgView: PView): PUMLActivationView;
begin
  Result := MsgView.MOF_GetReference('Activation') as PUMLActivationView;
end;

function PShortenSyntaxManager.MakeSeqMsgView2(Model: PModel; Rel1,
  Rel2, ShortenStr, NodeType1, NodeType2, EdgeType: String;
  IsVertical: Boolean; NodeArgument, EdgeArgument: Integer;
  HasReturn: Boolean): PView;


  function GetReturnMessageView(DiagramView: PDiagramView; CurMsgView: PEdgeView): PEdgeView;
  var
    ActivationView: PNodeView;
    EdgeView: PEdgeView;
    Value, I, Y: Integer;
  begin
    Result := nil;

    // get activation connected to current selected message
    ActivationView := CurMsgView.MOF_GetReference('Activation') as PUMLActivationView;

    if ActivationView <> nil then
      with DiagramView do
        for I := 0 to OwnedViewCount-1 do
          if (OwnedView[I] is PUMLSeqStimulusView) or
             (OwnedView[I] is PUMLSeqMessageView) then begin

            EdgeView := OwnedView[I] as PEdgeView;

            // exclude ReturnMsgView corresponding to CurMsgView
            if (EdgeView.Model.MOF_GetReference('Action') is PUMLReturnAction) and
               (EdgeView.Tail = CurMsgView.Head) then
              Result := EdgeView;
          end;
  end;

  function GetLastMessageView(DiagramView: PDiagramView; CurMsgView: PEdgeView): PEdgeView;
  var
    ActivationView: PNodeView;
    EdgeView: PEdgeView;
    Value, I, Y: Integer;
  begin
    // exclude ReturnMsgView corresponding to CurMsgView
    Result := CurMsgView;

    // get Activation connected to current selected message
    ActivationView := CurMsgView.MOF_GetReference('Activation') as PUMLActivationView;

    if ActivationView <> nil then
      with DiagramView do
        for I := 0 to OwnedViewCount-1 do
          if (OwnedView[I] is PUMLSeqStimulusView) or
             (OwnedView[I] is PUMLSeqMessageView) then begin

            EdgeView := OwnedView[I] as PEdgeView;

            // exclude CurMsgView
            if (EdgeView <> CurMsgView) then

              // exclude ReturnMsgView corresponding to CurMsgView
              if not ((EdgeView.Model.MOF_GetReference('Action') is PUMLReturnAction) and
                      (EdgeView.Tail = CurMsgView.Head)) then
(*
                // exclude ReturnMsgView
                if not (EdgeView.Model.MOF_GetReference('Action') is PUMLReturnAction) then
*)
                  // MsgView connected to ActivationView
                  if (CurMsgView.Head = EdgeView.Head) or (CurMsgView.Head = EdgeView.Tail) then begin
                    Y := EdgeView.Points.Points[0].Y;

                    // MsgView in ActivaitonView's range
                    if (ActivationView.Top <= Y) and (Y <= ActivationView.Bottom) then
                      Result := EdgeView;
                  end;

          end;
  end;


  function GetCurTopPos(
    DiagramView: PDiagramView; CurMsgView: PEdgeView; Relation: String): Integer;
  begin
    if Pos('~', Relation)>0 then
//      Result := (CurMsgView.MOF_GetReference('Activation') as PUMLActivationView).Top - 1
      Result := CurMsgView.Points.Points[0].Y - 1
    else if Pos('_', Relation)>0 then
//      Result := (CurMsgView.MOF_GetReference('Activation') as PUMLActivationView).Top
      Result := (GetLastMessageView(DiagramView, CurMsgView).MOF_GetReference('Activation') as PUMLActivationView).Top
    else if Pos('-', Relation)>0 then
      Result := (GetLastMessageView(DiagramView, CurMsgView).MOF_GetReference('Activation') as PUMLActivationView).Top;
  end;

  function GetInsertPos(
    DiagramView: PDiagramView; CurMsgView: PEdgeView; Relation: String; IsSelf: Boolean): Integer;
  var LastMsgView: PEdgeView;
  begin
    if Pos('~', Relation)>0 then
//      Result := (CurMsgView.MOF_GetReference('Activation') as PUMLActivationView).Top
      Result := CurMsgView.Points.Points[0].Y
    else if Pos('_', Relation)>0 then
//      Result := (CurMsgView.MOF_GetReference('Activation') as PUMLActivationView).Top + V_INT
      Result := (GetLastMessageView(DiagramView, CurMsgView).MOF_GetReference('Activation') as PUMLActivationView).Top + V_INT
    else if Pos('-', Relation)>0 then
      Result := (GetLastMessageView(DiagramView, CurMsgView).MOF_GetReference('Activation') as PUMLActivationView).Top + V_INT;
  end;

  function GetRearrangeActivations(DiagramView: PDiagramView; Top: Integer): TList;
  var
    Activations: TList;
    I: Integer;
    EdgeView: PEdgeView;
    ActivationView: PUMLActivationView;
  begin
    Activations := TList.Create;

    with DiagramView do
      for I := 0 to OwnedViewCount-1 do
        if (OwnedView[I] is PUMLSeqStimulusView) or (OwnedView[I] is PUMLSeqMessageView) then begin
          EdgeView := OwnedView[I] as PEdgeView;

//          if not (EdgeView.Model.MOF_GetReference('Action') is PUMLReturnAction) then begin

            // compare Activation's Top, Bottom
            ActivationView := EdgeView.MOF_GetReference('Activation') as PUMLActivationView;

            if (ActivationView <> nil) and (Activations.IndexOf(ActivationView) = -1) and
               (ActivationView.Top <= Top) and (Top <= ActivationView.Bottom) then
              Activations.Add(ActivationView);

//          end;
        end;

    Result := Activations;
  end;

  procedure MoveDown(DiagramView: PDiagramView; Top, DY: Integer);
  var
    I: Integer;
    ActivationView: PUMLActivationView;
    ReturnMsgView, LastReturnMsgView: PEdgeView;
    EdgeView: PEdgeView;
  begin
    // put spaces for messages which is under current selected view(message)

    // Deselect all in diagram
    DiagramView.DeselectAll;

    // compare and select
    with DiagramView do
      for I := 0 to OwnedViewCount-1 do
        if (OwnedView[I] is PUMLSeqStimulusView) or (OwnedView[I] is PUMLSeqMessageView) then
          if ((OwnedView[I] as PEdgeView).Points.Points[0].Y > Top) then
            OwnedView[I].Selected := True;
//            StarUMLApplication.ChangeViewAttribute(OwnedViews[I], 'Selected', BoolToStr(True));


    // Move
    StarUMLApplication.MoveSelectedViews(0, DY);
    DiagramView.DeselectAll;
  end;

  procedure RearrangeActivations(Activations: TList; DY: Integer);
  var
    I: Integer;
    ReturnMsgView: PEdgeView;
    ActivationView: PUMLActivationView;
    PS: PPoints;
  begin
    for I := 0 to Activations.Count-1 do begin
      ActivationView := PUMLActivationView(Activations.Items[I]);
      StarUMLApplication.ChangeViewAttribute(ActivationView, 'Height', IntToStr(ActivationView.Height+DY));
    end;
  end;

var
  Rel: String;
  OutGoing: Boolean;
  TargetName: String;
  DiagramView: PDiagramView;
  CurMsgView: PEdgeView;
  Top: Integer;
  InsertPos: Integer;
  Activations: TList;
  SourceView, TargetView: PNodeView;
  TargetNames: TStringList;
  P: Integer;
  MsgName: String;
  IsSelfMsg: Boolean;
  DY: Integer;
  L, T: Integer;
  EdgeView: PView;
  Activation: PUMLActivationView;
  PS: PPoints;


  ReturnEdgeView: PView;
  ReturnMsgView: PEdgeView;
  LastMsgView: PEdgeView;
  I, Y, H : Integer;



begin
  // direction
  Rel := Copy(ShortenStr, 1, Length(Rel1));
  if Rel = Rel2 then
    OutGoing := true
  else if Rel = Rel1 then
    OutGoing := false
  else begin
    Result := nil;
    Exit;
  end;

  // target name
  TargetName := Copy(ShortenStr, Length(Rel1)+1, Length(ShortenStr)-Length(Rel1));

  // get current selected diagram
  DiagramView := StarUMLApplication.ActiveDiagram;

  // get current selected view
  CurMsgView := GetViewInDiagram(DiagramView, Model) as PEdgeView;

  // get current selected view's head
  if (Pos('~', Rel) > 0) or (Pos('_', Rel)> 0) then
    SourceView := GetViewInDiagram(DiagramView, Model.MOF_GetReference('Sender') as PModel) as PNodeView
  else
    SourceView := GetViewInDiagram(DiagramView, Model.MOF_GetReference('Receiver') as PModel) as PNodeView;

  // get taget names
  TargetNames := TStringList.Create;
  TargetNames.Add(TargetName);

  // create view with target name
  for I := 0 to TargetNames.Count-1 do begin

    // get target namd and message name
    TargetName := TargetNames.Strings[I];

    P := Pos('.', TargetName);
    if P > 0 then begin
      MsgName := Copy(TargetName, P+1, Length(TargetName)-P);
      TargetName := Copy(TargetName, 1, P-1);
    end
    else
      MsgName := '';

    // get target view contained in current diagram
    if TargetName = '' then
      TargetView := nil
    else
      TargetView := GetViewInDiagram(DiagramView, TargetName) as PNodeView;

    // get right most position of TargetView(Object) to be created
    if TargetView = nil then begin
      L := DiagramView.GetBoundingBox(DiagramView.Canvas).Right + (H_INT);
      T := DiagramView.GetBoundingBox(DiagramView.Canvas).Top;
    end;

    // if there is not target view, try to create view from model
    if TargetView = nil then begin
      TargetView := CreateSeqView(DiagramView, TargetName);

      // if there is not target view, create model and view
      if TargetView = nil then
        TargetView := CreateViewWithModel(DiagramView, TargetName, OutGoing, NodeType1, NodeType2, NodeArgument);

      // move TargetView(Object) at right most of range
//      TargetView.Left := L;
//      TargetView.Top := T;

      StarUMLApplication.ChangeViewAttribute(TargetView, 'Left', IntToStr(L));
      StarUMLApplication.ChangeViewAttribute(TargetView, 'Top', IntToStr(T));

    end;

    // create edge with 2 views
    if OutGoing then
      EdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, EdgeArgument, SourceView, TargetView)
    else
      EdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, EdgeArgument, TargetView, SourceView);

    // set message name
    if MsgName <> '' then begin
      StarUMLApplication.ChangeModelName(EdgeView.Model, MsgName);
    end;

    // in case of having return
    if HasReturn then begin
      // create edge with 2 views
      if OutGoing then
        ReturnEdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, FA_STIMULUS_RETURNACTION, TargetView, SourceView)
      else
        ReturnEdgeView := StarUMLApplication.NewElement(DiagramView, EdgeType, FA_STIMULUS_RETURNACTION, SourceView, TargetView);
    end
    else
      ReturnEdgeView := nil;




    // set top to move down messages which are under top message
    Top := GetCurTopPos(DiagramView, CurMsgView, Rel);

    // insertion position
    InsertPos := GetInsertPos(DiagramView, CurMsgView, Rel, (CurMsgView.Head = CurMsgView.Tail));

    // insert extending Activation into list
    Activations := GetRearrangeActivations(DiagramView, Top);

    if Pos('_', Rel)>0 then
      Activations.Remove(
        CurMsgView.MOF_GetReference('Activation'))
    else if Pos('-', Rel)>0 then begin
      Activation := GetLastMessageView(DiagramView, CurMsgView).MOF_GetReference('Activation') as PUMLActivationView;
      if CurMsgView.MOF_GetReference('Activation') <> Activation then
        Activations.Remove(Activation);
    end;


    // determine moving interval
    if (SourceView = TargetView) then DY := V_INT + ACTIVATION_MINHEIGHT
    else DY := V_INT;

    // move down messages which are under top message
    MoveDown(DiagramView, Top, DY);



    // arrange views
    with EdgeView as PEdgeView do begin
(*
      Points.Points[0] := Point(Points.Points[0].X, InsertPos);
      Points.Points[1] := Point(Points.Points[1].X, InsertPos);
*)
      PS := PPoints.Create;
      PS.Assign(Points);
      PS.Points[0] := Point(Points.Points[0].X, InsertPos);
      PS.Points[1] := Point(Points.Points[1].X, InsertPos);
      StarUMLApplication.ChangeViewAttribute(EdgeView, 'Points', PointsToString(PS));
      PS.Free;
    end;

    if HasReturn then begin
      with ReturnEdgeView as PEdgeView do begin
        EdgeView.Arrange(DiagramView.Canvas);
        H := GetActivationView(EdgeView).Bottom-1;
(*
        Points.Points[0] := Point((EdgeView as PEdgeView).Points.Points[1].X, H);
*)

        PS := PPoints.Create;
        PS.Assign(Points);
        PS.Points[0] := Point((EdgeView as PEdgeView).Points.Points[1].X, H);
        StarUMLApplication.ChangeViewAttribute(ReturnEdgeView, 'Points', PointsToString(PS));
        PS.Free;

//        Points.Points[0] := Point((EdgeView as PEdgeView).Points.Points[1].X, (EdgeView as PEdgeView).Points.Points[1].Y+H);
//        Points.Points[1] := Point((EdgeView as PEdgeView).Points.Points[0].X, (EdgeView as PEdgeView).Points.Points[0].Y+H);
      end;
    end;


    // extend Activation's length in Activations
    RearrangeActivations(Activations, DY);

  end;

  Activations.Free;
  TargetNames.Free;

  // restore original selection status
  DiagramView.DeselectAll;
  CurMsgView.Selected := True;
//  StarUMLApplication.ChangeViewAttribute(CurMsgView, 'Selected', BooleanToString(True));
  Result := TargetView;
end;



{ PMsgTuple }

constructor PMsgTuple.Create(MsgView, ReturnMsgView: PEdgeView;
  ActivationView: PUMLActivationView);
begin
  Self.MsgView := MsgView;
  Self.ReturnMsgView := ReturnMsgView;
  Self.ActivationView := ActivationView;
end;

end.
