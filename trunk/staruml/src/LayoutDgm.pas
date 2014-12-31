unit LayoutDgm;

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
  GraphicClasses, Core, ViewCore, UMLViews, {WINGRAPHVIZLib_TLB,}
  Classes;

const
  PIXELS_PER_INCH = 72;
  LAYOUT_LEFT_MARGIN = 10;
  LAYOUT_TOP_MARGIN = 0;

type
  // Enumeration Types
  PRankDirKind = (rkTopBottom, rkLeftRight);

  // PGraphvizNode
  PGraphvizNode = class
  private
    FName: string;
    FLeft: Integer;
    FTop: Integer;
    FWidth: Integer;
    FHeight: Integer;
  public
    property Name: string read FName;
    property Left: Integer read FLeft;
    property Top: Integer read FTop;
    property Width: Integer read FWidth;
    property Height: Integer read FHeight;
  end;

  // PGraphvizEdge
  PGraphvizEdge = class
  private
    FName: string;
    FHead: string;
    FTail: string;
    FPoints: PPoints;
  public
    constructor Create;
    destructor Destroy; override;
    property Name: string read FName;
    property Head: string read FHead;
    property Tail: string read FTail;
    property Points: PPoints read FPoints;
  end;

  // PGraphvizGraph
  PGraphvizGraph = class
  private
    FWidth: Integer;
    FHeight: Integer;
    FNodes: TList;
    FEdges: TList;
    function GetNode(Index: Integer): PGraphvizNode;
    function GetNodeCount: Integer;
    function GetEdge(Index: Integer): PGraphvizEdge;
    function GetEdgeCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    property Width: Integer read FWidth;
    property Height: Integer read FHeight;
    property Nodes[Index: Integer]: PGraphvizNode read GetNode;
    property NodeCount: Integer read GetNodeCount;
    property Edges[Index: Integer]: PGraphvizEdge read GetEdge;
    property EdgeCount: Integer read GetEdgeCount;
  end;

  // PGraphvizPlainOutputParser
  PGraphvizPlainOutputParser = class
  private
    TempStrings: TStringList;
    function InchToPixel(Inch: Extended): Integer;
    function InchStrToPixel(Inch: string): Integer;
    procedure ParseLine(Line: string; Output: TStrings);
    function ParseGraphLine(GraphLine: string): PGraphvizGraph;
    function ParseNodeLine(NodeLine: string): PGraphvizNode;
    function ParseEdgeLine(EdgeLine: string): PGraphvizEdge;
  public
    constructor Create;
    destructor Destroy; override;
    function Parse(PlainOutputText: WideString): PGraphvizGraph;
  end;

  // PDiagramLayout
  PDiagramLayout = class
  private type
  PLayoutGraphFunc = function ( const layoutType: PAnsiChar; inputGraph: PAnsiChar;
   outputGraph: PPAnsiChar): Integer; cdecl;
  PDeleteOutputGraphFunc = procedure ( outputGraph: PAnsiChar); cdecl;
  const
    GvcIntfDll = 'gvc_intf';
    LayoutGraphFuncName = 'LayoutGraph';
    DeleteOutputGraphFuncName = 'DeleteOutputGraph';

  private
    //DOT: TDOT;
    //NEATO: TNEATO;
    FGvcIntfDllHandle : HModule;
    FLayoutGraphFunc: PLayoutGraphFunc;
    FDeleteOutputGraphFunc: PDeleteOutputGraphFunc;
    GraphvizPlainOutputParser: PGraphvizPlainOutputParser;
    function ValidateGvcIntfDllBindings: Boolean;
    procedure SmoothPoints(APoints: PPoints; Times: Integer = 1);
    procedure RoughPoints(APoints: PPoints; Epsilon: Real = 1.1);
    function GetNodeId(ANode: PNodeView): string;
    function GetEdgeId(AEdge: PEdgeView): string;
    function GetNodeString(ANode: PNodeView): string;
    function GetEdgeString(AEdge: PEdgeView; Directed: Boolean = True; Reversed: Boolean = False): string;
    procedure GenerateGraphRep(ADiagramView: PDiagramView; OutputGraph: TStrings; IsDigraph: Boolean = True; RankDir: PRankDirKind = rkTopBottom; Reversed: Boolean = False);
    procedure ApplyToDiagramView(AGraphvizGraph: PGraphvizGraph; ADiagramView: PDiagramView);
  public
    constructor Create;
    destructor Destroy; override;
    procedure LayoutDiagram(ADiagramView: PDiagramView; IsDigraph: Boolean = True; RankDir:PRankDirKind = rkTopBottom; Reversed: Boolean = False);
  end;

var
  DiagramLayout: PDiagramLayout;

implementation

uses
  Windows, Types, SysUtils, Forms, Dialogs, NLS_StarUML {,GraphVizInterface};


////////////////////////////////////////////////////////////////////////////////
// PGraphvizNode


// PGraphvizNode
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PGraphvizEdge

constructor PGraphvizEdge.Create;
begin
  inherited;
  FPoints := PPoints.Create;
end;

destructor PGraphvizEdge.Destroy;
begin
  FPoints.Free;
  inherited;
end;

// PGraphvizEdge
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PGraphvizGraph

constructor PGraphvizGraph.Create;
begin
  inherited;
  FNodes := TList.Create;
  FEdges := TList.Create;
end;

destructor PGraphvizGraph.Destroy;
begin
  FNodes.Free;
  FEdges.Free;
  inherited;
end;

function PGraphvizGraph.GetNode(Index: Integer): PGraphvizNode;
begin
  Result := FNodes.Items[Index];
end;

function PGraphvizGraph.GetNodeCount: Integer;
begin
  Result := FNodes.Count;
end;

function PGraphvizGraph.GetEdge(Index: Integer): PGraphvizEdge;
begin
  Result := FEdges.Items[Index];
end;

function PGraphvizGraph.GetEdgeCount: Integer;
begin
  Result := FEdges.Count;
end;

// PGraphvizGraph
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PGraphvizPlainOutputParser

constructor PGraphvizPlainOutputParser.Create;
begin
  inherited;
  TempStrings := TStringList.Create;
end;

destructor PGraphvizPlainOutputParser.Destroy;
begin
  TempStrings.Free;
  inherited;
end;

function PGraphvizPlainOutputParser.InchToPixel(Inch: Extended): Integer;
begin
  Result := Round(Inch * PIXELS_PER_INCH);
end;

function PGraphvizPlainOutputParser.InchStrToPixel(Inch: string): Integer;
var
  FormatSettings: TFormatSettings;
begin
  FormatSettings.DecimalSeparator := TXT_DECIMAL_SEPARATOR[1];
  Result := InchToPixel(StrToFloat(Inch,FormatSettings));
end;

procedure PGraphvizPlainOutputParser.ParseLine(Line: string; Output: TStrings);
const
  SEPARATOR = ' ';
var
  P: Integer;
begin
  Output.Clear;
  Line := Trim(Line);
  repeat
    P := Pos(SEPARATOR, Line);
    if P <> 0 then
      Output.Add(Copy(Line, 1, P-1))
    else
      Output.Add(Trim(Line));
    Line := Trim(Copy(Line, P+1, Length(Line)-P))
  until P = 0;
end;

function PGraphvizPlainOutputParser.ParseGraphLine(GraphLine: string): PGraphvizGraph;
var
  Graph: PGraphvizGraph;
begin
  TempStrings.Clear;
  ParseLine(GraphLine, TempStrings);
  Graph := PGraphvizGraph.Create;
  Graph.FWidth := InchStrToPixel(TempStrings[2]);
  Graph.FHeight := InchStrToPixel(TempStrings[3]);
  Result := Graph;
end;

function PGraphvizPlainOutputParser.ParseNodeLine(NodeLine: string): PGraphvizNode;
var
  Node: PGraphvizNode;
begin
  TempStrings.Clear;
  ParseLine(NodeLine, TempStrings);
  Node := PGraphvizNode.Create;
  Node.FName := TempStrings[1];
  Node.FLeft := InchStrToPixel(TempStrings[2]);
  Node.FTop := InchStrToPixel(TempStrings[3]);
  Node.FWidth := InchStrToPixel(TempStrings[4]);
  Node.FHeight := InchStrToPixel(TempStrings[5]);
  Result := Node;
end;

function PGraphvizPlainOutputParser.ParseEdgeLine(EdgeLine: string): PGraphvizEdge;
var
  Edge: PGraphvizEdge;
  C, I, X, Y: Integer;
begin
  TempStrings.Clear;
  ParseLine(EdgeLine, TempStrings);
  Edge := PGraphvizEdge.Create;
  Edge.FTail := TempStrings[1];
  Edge.FHead := TempStrings[2];
  C := StrToInt(TempStrings[3]);
  Edge.FPoints.Clear;
  for I := 0 to C - 1 do begin
    X := InchStrToPixel(TempStrings[4+(I*2)]);
    Y := InchStrToPixel(TempStrings[4+((I*2)+1)]);
    Edge.FPoints.Add(Point(X, Y));
  end;
  Edge.FName := TempStrings[4+(C*2)];
  Result := Edge;
end;

function PGraphvizPlainOutputParser.Parse(PlainOutputText: WideString): PGraphvizGraph;
const
  TOKEN4_NODE  = 'node';
  TOKEN4_EDGE  = 'edge';
var
  PlainOutput: TStringList;
  Graph: PGraphvizGraph;
  Node: PGraphvizNode;
  Edge: PGraphvizEdge;
  Token4: string;
  I, J: Integer;
begin
  PlainOutput := TStringList.Create;
  PlainOutput.Text := PlainOutputText;
  // Graph 구성.
  Graph := ParseGraphLine(PlainOutput.Strings[0]);
  for I := 1 to PlainOutput.Count - 1 do begin
    Token4 := LowerCase(Copy(PlainOutput.Strings[I], 1, 4));
    if Token4 = TOKEN4_NODE then
      Graph.FNodes.Add(ParseNodeLine(PlainOutput.Strings[I]))
    else if Token4 = TOKEN4_EDGE then
      Graph.FEdges.Add(ParseEdgeLine(PlainOutput.Strings[I]));
  end;
  // 좌표계 변환.
  for I := 0 to Graph.NodeCount - 1 do begin
    Node := Graph.Nodes[I];
    Node.FLeft := Node.FLeft - (Node.FWidth div 2);
    Node.FTop := Node.FTop - (Node.FHeight div 2);
//    Node.FTop := Graph.FHeight - Node.FTop;
  end;
  for I := 0 to Graph.EdgeCount - 1 do begin
    Edge := Graph.Edges[I];
//    for J := 0 to Edge.Points.Count - 1 do
//      Edge.Points.Points[J] := Point(Edge.Points.Points[J].X, Graph.FHeight - Edge.Points.Points[J].Y);
  end;
  PlainOutput.Free;
  Result := Graph;
end;

// PGraphvizPlainOutputParser
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PDiagramLayout

constructor PDiagramLayout.Create;
begin
  inherited;
  //DOT := TDOT.Create(Application);
  //NEATO := TNEATO.Create(Application);
  GraphvizPlainOutputParser := PGraphvizPlainOutputParser.Create;
end;

destructor PDiagramLayout.Destroy;
begin
  //DOT := nil;
  //NEATO := nil;
  GraphvizPlainOutputParser.Free;
  FreeLibrary(FGvcIntfDllHandle);
  FGvcIntfDllHandle := 0;
  inherited;
end;

function PDiagramLayout.ValidateGvcIntfDllBindings: Boolean;
begin
  if FGvcIntfDllHandle = 0 then begin // Try to load the dll
    Result := False;
    FGvcIntfDllHandle := LoadLibrary(GvcIntfDll);
    if FGvcIntfDllHandle <> 0 then
    begin
      @FLayoutGraphFunc := GetProcAddress(FGvcIntfDllHandle, LayoutGraphFuncName);
      if Assigned (FLayoutGraphFunc) then begin
        @FDeleteOutputGraphFunc := GetProcAddress(FGvcIntfDllHandle, DeleteOutputGraphFuncName);
        if Assigned (FDeleteOutputGraphFunc) then
          Result := True;
      end;
    end;

 end // End of if
 else
  Result := True; // Dll already loaded

  if (Result = False) and (FGvcIntfDllHandle <> 0) then begin// Unload dll if binding not successful
    FreeLibrary(FGvcIntfDllHandle);
    FGvcIntfDllHandle := 0;
  end;


end;

procedure PDiagramLayout.SmoothPoints(APoints: PPoints; Times: Integer = 1);
var
  I: Integer;

  function MidPoint(P1, P2: TPoint): TPoint;
  var
    P: TPoint;
  begin
    P.X := Round((P1.X + P2.X) / 2);
    P.Y := Round((P1.Y + P2.Y) / 2);
    Result := P;
  end;

  procedure SmoothPointsOnce(Ps: PPoints);
  var
    I: Integer;
    NewPoints: PPoints;
  begin
    NewPoints := PPoints.Create;
    NewPoints.Clear;
    if Ps.Count >= 3 then
    begin
      NewPoints.Add(Ps.Points[0]);
      for I := 1 to Ps.Count - 1 do
        NewPoints.Add(MidPoint(Ps.Points[I - 1], Ps.Points[I]));
      NewPoints.Add(Ps.Points[Ps.Count - 1]);
    end;
    Ps.Assign(NewPoints);
    NewPoints.Free;
  end;

begin
  for I := 1 to Times do
    SmoothPointsOnce(APoints);
end;

procedure PDiagramLayout.RoughPoints(APoints: PPoints; Epsilon: Real = 1.1);
var
  Idx: Integer;
  P0, P1, P2: TPoint;
  Rate: Real;

  function Distance(PT1, PT2: TPoint): Real;
  var
    A, B: Integer;
  begin
    A := Abs(PT1.X - PT2.X);
    B := Abs(PT1.Y - PT2.Y);
    Result := Sqrt((A * A) + (B * B));
  end;

begin
  if APoints.Count >= 3 then
  begin
    Idx := 1;
    repeat
      P0 := APoints.Points[Idx - 1];
      P1 := APoints.Points[Idx];
      P2 := APoints.Points[Idx + 1];
      if Distance(P0, P2) <> 0 then
      begin
        Rate := (Distance(P0, P1) + Distance(P1, P2)) / Distance(P0, P2);
        if Rate < Epsilon then
          APoints.Remove(Idx)
        else
         Inc(Idx);
      end
      else begin
        APoints.Remove(Idx);
      end;
    until Idx = (APoints.Count - 1);
  end;
end;

function PDiagramLayout.GetNodeId(ANode: PNodeView): string;
begin
  Result := 'n' + IntToStr(ANode.OwnerDiagramView.IndexOfOwnedView(ANode));
end;

function PDiagramLayout.GetEdgeId(AEdge: PEdgeView): string;
begin
  Result := 'e' + IntToStr(AEdge.OwnerDiagramView.IndexOfOwnedView(AEdge));
end;

function PDiagramLayout.GetNodeString(ANode: PNodeView): string;
var
  S: string;
begin
  S := GetNodeId(ANode);
  S := S + ' [shape=box';
  S := S + ',width=' + FloatToStrF(ANode.Width / PIXELS_PER_INCH, ffGeneral, 7, 4);
  S := S + ',height=' + FloatToStrF(ANode.Height / PIXELS_PER_INCH, ffGeneral, 7, 4);
  S := S + '];';
  Result := S;
end;

//function PDiagramLayout.GetEdgeString(AEdge: PEdgeView; Directed: Boolean = True): string;
function PDiagramLayout.GetEdgeString(AEdge: PEdgeView; Directed: Boolean = True; Reversed: Boolean = False): string;
var
  S: string;
begin
  if Reversed then
    S := GetNodeId(AEdge.Head as PNodeView)
  else
    S := GetNodeId(AEdge.Tail as PNodeView);

  if Directed then
    S := S + ' -> '
  else
    S := S + ' -- ';

  if Reversed then
    S := S + GetNodeId(AEdge.Tail as PNodeView)
  else
    S := S + GetNodeId(AEdge.Head as PNodeView);

  S := S + ' [label="' + GetEdgeId(AEdge) + '"];';
  Result := S;
end;

procedure PDiagramLayout.GenerateGraphRep(ADiagramView: PDiagramView;
  OutputGraph: TStrings; IsDigraph: Boolean = True; RankDir: PRankDirKind = rkTopBottom; Reversed: Boolean = False);
var
  I: Integer;
  V: PView;
begin
  // Generates Header
  OutputGraph.Clear;
  if IsDigraph then begin
    OutputGraph.Add('digraph G {');
    OutputGraph.Add('  ordering=out;');
    if RankDir = rkTopBottom then
      OutputGraph.Add(' rankdir=TB;')
    else
      OutputGraph.Add(' rankdir=LR;');
  end
  else begin
    OutputGraph.Add('graph G {');
  end;
  // Generates Nodes
  for I := 0 to ADiagramView.OwnedViewCount - 1 do begin
    V := ADiagramView.OwnedView[I];
    if V is PNodeView then
      OutputGraph.Add(GetNodeString(V as PNodeView));
  end;
  // Generates Edges
  for I := 0 to ADiagramView.OwnedViewCount - 1 do begin
    V := ADiagramView.OwnedView[I];
    if V is PEdgeView then
    begin
      with V as PEdgeView do
        if ((Tail is PNodeView) and (Tail.OwnerDiagramView <> nil)) and
           ((Head is PNodeView) and (Head.OwnerDiagramView <> nil)) then
          OutputGraph.Add(GetEdgeString(V as PEdgeView, IsDigraph, Reversed));
    end;
  end;
  // Generates Tailer
  OutputGraph.Add('}');
end;

procedure PDiagramLayout.ApplyToDiagramView(AGraphvizGraph: PGraphvizGraph; ADiagramView: PDiagramView);
var
  I, J: Integer;
  Node: PGraphvizNode;
  NodeView: PNodeView;
  Edge: PGraphvizEdge;
  EdgeView: PEdgeView;

  function ExtractIndex(NodeOrEdgeName: string): Integer;
  begin
    Result := StrToInt(Copy(NodeOrEdgeName, 2, Length(NodeOrEdgeName) - 1));
  end;

begin
  for I := 0 to AGraphvizGraph.NodeCount - 1 do begin
    Node := AGraphvizGraph.Nodes[I];
    NodeView := ADiagramView.OwnedView[ExtractIndex(Node.Name)] as PNodeView;
    NodeView.Left := Node.Left + LAYOUT_LEFT_MARGIN;
    NodeView.Top := Node.Top + LAYOUT_TOP_MARGIN;
  end;
  for I := 0 to AGraphvizGraph.EdgeCount - 1 do begin
    Edge:= AGraphvizGraph.Edges[I];
    EdgeView := ADiagramView.OwnedView[ExtractIndex(Edge.Name)] as PEdgeView;
    if EdgeView.Head <> EdgeView.Tail then
    begin
      EdgeView.LineStyle := lsOblique;
      EdgeView.Points.Clear;
      for J := 0 to Edge.Points.Count - 1 do
        EdgeView.Points.Add(
          Point(Edge.Points.Points[J].X + LAYOUT_LEFT_MARGIN,
                Edge.Points.Points[J].Y + LAYOUT_TOP_MARGIN));
      SmoothPoints(EdgeView.Points, 10);
      RoughPoints(EdgeView.Points, 1.015);
      EdgeView.RecalcPoints(ADiagramView.Canvas);
    end
    else begin
      EdgeView.Points.Clear;
      EdgeView.Initialize(ADiagramView.Canvas, 0, 0, 0, 0);
      EdgeView.RecalcPoints(ADiagramView.Canvas);
    end;
  end;
end;

procedure PDiagramLayout.LayoutDiagram(ADiagramView: PDiagramView; IsDigraph: Boolean = True; RankDir: PRankDirKind = rkTopBottom; Reversed: Boolean = False);
var
  Output: TStringList;
  PlainOutput: string;
  Graph: PGraphvizGraph;
  OutputGraph: PAnsiChar;
  ResultOp: Integer;
  LayoutAlgorithm: AnsiString;
begin
  Output := TStringList.Create;
  GenerateGraphRep(ADiagramView, Output, IsDigraph, RankDir, Reversed);
  if IsDigraph then
    LayoutAlgorithm := 'dot'
  else
    LayoutAlgorithm := 'neato';

  if not ValidateGvcIntfDllBindings then
     ShowMessage('Function not available: Could not initialize GraphViz DLL library (Have you installed VC++ 2008 SP1 Redistribuable?)')

  else begin
    ResultOp := FLayoutGraphFunc(PAnsiChar(LayoutAlgorithm),
      PAnsiChar(AnsiString(Output.Text)), @outputGraph);
    assert(ResultOp = 0);
    PlainOutput := string(outputGraph);
    FDeleteOutputGraphFunc(outputGraph);
    // PlainOutput := DOT.ToPlain(Output.Text)

    Graph := GraphvizPlainOutputParser.Parse(PlainOutput);
    ApplyToDiagramView(Graph, ADiagramView);
    Output.Free;
  end;
end;

// PDiagramLayout
////////////////////////////////////////////////////////////////////////////////

initialization
  DiagramLayout := PDiagramLayout.Create;
finalization
  DiagramLayout.Free;
end.
