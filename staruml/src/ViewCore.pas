unit ViewCore;

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
  Types, Classes, Graphics, BasicClasses, Core, GraphicClasses;

const
  SELECTION_COLOR = clBlack;
  BACKGROUND_COLOR = clWhite;

  SELF_EDGE_HORIZ_INTERVAL = 30;
  SELF_EDGE_VERTI_INTERVAL = 20;

type
  // Forward Declarations
  PLabelView = class;

  // Enumeration Types
  PEdgePositionKind = (epHead, epMiddle, epTail);
  PLineStyleKind = (lsRectilinear, lsOblique);

  PSizableMode = (szNone, szHorz, szVert, szRatio, szFree);
  PMovableMode = (mmNone, mmHorz, mmVert, mmFree);
  PHorzAlignmentKind = (haLeft, haCenter, haRight);
  PVertAlignmentKind = (vaTop, vaMiddle, vaBottom);
  PLineMode = (lmSolid, lmDot);
  PEdgeEndStyle = (esFlat, esStickArrow, esSolidArrow, esTriangle, esFilledTriangle,
    esDiamond, esFilledDiamond, esArrowDiamond, esArrowFilledDiamond);
  PDirectionKind = (dkHorizontal, dkVertical);

  // PExtensibleView
  PExtensibleView = class(PView)
  private
    FShowExtendedNotation: Boolean;
    procedure SetShowExtendedNotation(Value: Boolean);
  protected
    procedure ArrangeExtendedView(Canvs: PCanvas); virtual;
    procedure DrawExtendedView(Canvas: PCanvas); virtual;
  public
    constructor Create; override;
    // edited by hskim 2005.08.09 begin
    function IsExtendedView: Boolean;
    // edited by hskim 2005.08.09 end
    procedure Draw(Canvas: PCanvas); override;
    procedure Arrange(Canvas: PCanvas); override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    property ShowExtendedNotation: Boolean read FShowExtendedNotation write SetShowExtendedNotation;
  end;

  // PNodeView
  // ---------------------------------------------------------------------------
  // Sizable and Moveable property are moved to protected part.
  // Because they don't need to be stored and are set once in Sub class's constructor.
  // But, the movement occurs some problem.
  // ---------------------------------------------------------------------------
  PNodeView = class(PExtensibleView)
  private
    FLeft, FTop, FWidth, FHeight: Integer;
    FMinWidth, FMinHeight: Integer;
    FSizable: PSizableMode;
    FMovable: PMovableMode;
    FAutoResize: Boolean;
    function GetRight: Integer;
    function GetBottom: Integer;
    procedure SetRight(Value: Integer);
    procedure SetBottom(Value: Integer);
    procedure SetMinWidth(Value: Integer);
    procedure SetMinHeight(Value: Integer);
    procedure SetSizable(Value: PSizableMode);
    procedure SetMovable(Value: PMovableMode);
    procedure SetAutoResize(Value: Boolean);
  protected
    procedure SetLeft(Value: Integer); virtual;
    procedure SetTop(Value: Integer); virtual;
    procedure SetWidth(Value: Integer); virtual;
    procedure SetHeight(Value: Integer); virtual;
    procedure DrawSelection(Canvas: PCanvas); override;
    procedure MovePosition(Canvas: PCanvas; DX, DY: Integer); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    procedure Initialize(Canvas: PCanvas; X1, Y1, X2, Y2: Integer); override;
    function GetBoundingBox(Canvas: PCanvas): TRect; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    property Left: Integer read FLeft write SetLeft;
    property Top: Integer read FTop write SetTop;
    property Width: Integer read FWidth write SetWidth;
    property Height: Integer read FHeight write SetHeight;
    property Right: Integer read GetRight write SetRight;
    property Bottom: Integer read GetBottom write SetBottom;
    property MinWidth: Integer read FMinWidth write SetMinWidth;
    property MinHeight: Integer read FMinHeight write SetMinHeight;
    property Movable: PMovableMode read FMovable write SetMovable; // TRANSIENT //
    property Sizable: PSizableMode read FSizable write SetSizable; // TRANSIENT //
    property AutoResize: Boolean read FAutoResize write SetAutoResize;
  end;

  IModifiableEdge = interface
    function GetPoints: PPoints;
    procedure SetPoints(Value: PPoints);
    property Points: PPoints read GetPoints write SetPoints;
  end;

  // PEdgeView
  // ---------------------------------------------------------------------------
  // LinMode, HeadEndStyle, and TailEndStyle property must be moved to protected part.
  // Because they are set once in Sub class's constructor without storing.
  // But, the movement occurs some problem.
  // ---------------------------------------------------------------------------
  PEdgeView = class(PExtensibleView, IModifiableEdge)
  private
    FHead, FTail: PView;
    FLineMode: PLineMode;
    FLineStyle: PLineStyleKind;
    FPoints: PPoints;
    FHeadEndStyle, FTailEndStyle: PEdgeEndStyle;
    procedure SetHead(Value: PView);
    procedure SetTail(Value: PView);
    procedure SetLineMode(Value: PLineMode);
    procedure SetLineStyle(Value: PLineStyleKind);
    function GetPoints: PPoints;
    procedure SetPoints(Value: PPoints);
    procedure SetHeadEndStyle(Value: PEdgeEndStyle);
    procedure SetTailEndStyle(Value: PEdgeEndStyle);
  protected
    procedure DrawSelection(Canvas: PCanvas); override;
    procedure MovePosition(Canvas: PCanvas; DX, DY: Integer); override;
    procedure ChangePoints(APoints: PPoints); virtual;
    procedure RecalcOblique(Canvas: PCanvas); virtual;
    procedure RecalcRectilinear(Canvas: PCanvas); virtual;
    procedure ReducePoints(Canvas: PCanvas); virtual;
    procedure Clipping(Canvas: PCanvas); virtual;
    procedure DrawLineEnd(Canvas: PCanvas; Value: PEdgeEndStyle; IsHead: Boolean);
    procedure DrawObject(Canvas: PCanvas); override;
    procedure DrawNoModeledMark(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    // IInterface functions
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    constructor Create; override;
    destructor Destroy; override;
    procedure Initialize(Canvas: PCanvas; X1, Y1, X2, Y2: Integer); override;
    procedure FitToGrid(GF: PGridFactor);
    procedure RecalcPoints(Canvas: PCanvas);
    function GetBoundingBox(Canvas: PCanvas): TRect; override;
    function ContainsPoint(Canvas: PCanvas; P: TPoint): Boolean; override;
    function OverlapRect(Canvas: PCanvas; R: TRect): Boolean; override;
    function ContainedIndex(Canvas: PCanvas; P: TPoint): Integer;
    function SelectedPoint(Canvas: PCanvas; P: TPoint): Integer;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property Head: PView read FHead write SetHead;
    property Tail: PView read FTail write SetTail;
    property LineMode: PLineMode read FLineMode write SetLineMode; // TRANSIENT //
    property LineStyle: PLineStyleKind read FLineStyle write SetLineStyle;
    property Points: PPoints read GetPoints write SetPoints;
    property HeadEndStyle: PEdgeEndStyle read FHeadEndStyle write SetHeadEndStyle; // TRANSIENT //
    property TailEndStyle: PEdgeEndStyle read FTailEndStyle write SetTailEndStyle; // TRANSIENT //
  end;

  // PLabelView
  PLabelView = class(PNodeView)
  private
    FText: string;
    FHorzAlignment: PHorzAlignmentKind;
    FVertAlignment: PVertAlignmentKind;
    FDirection: PDirectionKind;
    FWordWrap: Boolean;
    procedure SetText(Value: string);
    procedure SetHorzAlignment(Value: PHorzAlignmentKind);
    procedure SetVertAlignment(Value: PVertAlignmentKind);
    procedure SetDirection(Value: PDirectionKind);
    procedure SetWordWrap(Value: Boolean);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    function IsDrawDeferred: Boolean; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    property Text: string read FText write SetText;
    property HorzAlignment: PHorzAlignmentKind read FHorzAlignment write SetHorzAlignment; // TRANSIENT //
    property VertAlignment: PVertAlignmentKind read FVertAlignment write SetVertAlignment; // TRANSIENT //
    property Direction: PDirectionKind read FDirection write SetDirection;  // TRANSIENT //
    property WordWrap: Boolean read FWordWrap write SetWordWrap;  // TRANSIENT //
  end;

  // PParasiticView
  PParasiticView = class(PNodeView)
  private
    FAlpha: Extended;
    FDistance: Extended;
    procedure SetAlpha(Value: Extended);
    procedure SetDistance(Value: Extended);
  public
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    property Alpha: Extended read FAlpha write SetAlpha;
    property Distance: Extended read FDistance write SetDistance;
  end;

  // PNodeParasiticView
  PNodeParasiticView = class(PParasiticView)
  private
    FHostNode: PNodeView;
    procedure SetHostNode(Value: PNodeView);
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property HostNode: PNodeView read FHostNode write SetHostNode;
  end;

  // PEdgeParasiticView
  PEdgeParasiticView = class(PParasiticView)
  private
    FHostEdge: PEdgeView;
    FEdgePosition: PEdgePositionKind;
    procedure SetEdgePosition(Value: PEdgePositionKind);
    procedure SetHostEdge(Value: PEdgeView);
  protected
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    function MOF_GetReference(Name: string): PElement; override;
    procedure MOF_SetReference(Name: string; Value: PElement); override;
    property EdgePosition: PEdgePositionKind read FEdgePosition write SetEdgePosition;
    property HostEdge: PEdgeView read FHostEdge write SetHostEdge;
  end;

  // PNodeLabelView
  PNodeLabelView = class(PNodeParasiticView)
  private
    FText: string;
    FHorzAlignment: PHorzAlignmentKind;
    FVertAlignment: PVertAlignmentKind;
    procedure SetText(Value: string);
    procedure SetHorzAlignment(Value: PHorzAlignmentKind);
    procedure SetVertAlignment(Value: PVertAlignmentKind);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    property Text: string read FText write SetText;
    property HorzAlignment: PHorzAlignmentKind read FHorzAlignment write SetHorzAlignment; // TRANSIENT //
    property VertAlignment: PVertAlignmentKind read FVertAlignment write SetVertAlignment; // TRANSIENT //
  end;

  // PEdgeLabelView
  PEdgeLabelView = class(PEdgeParasiticView)
  private
    FText: string;
    FHorzAlignment: PHorzAlignmentKind;
    FVertAlignment: PVertAlignmentKind;
    procedure SetText(Value: string);
    procedure SetHorzAlignment(Value: PHorzAlignmentKind);
    procedure SetVertAlignment(Value: PVertAlignmentKind);
  protected
    procedure DrawObject(Canvas: PCanvas); override;
    procedure ArrangeObject(Canvas: PCanvas); override;
  public
    constructor Create; override;
    function MOF_GetAttribute(Name: string): string; override;
    procedure MOF_SetAttribute(Name, Value: string); override;
    property Text: string read FText write SetText;
    property HorzAlignment: PHorzAlignmentKind read FHorzAlignment write SetHorzAlignment; // TRANSIENT //
    property VertAlignment: PVertAlignmentKind read FVertAlignment write SetVertAlignment; // TRANSIENT //
  end;

  // PNodeNodeView
  PNodeNodeView = class(PNodeParasiticView)
  end;

  // PEdgeNodeView
  PEdgeNodeView = class(PEdgeParasiticView)
  end;

  // Enumeration Conversion Routines
  function LineStyleKindToString(Value: PLineStyleKind): string;
  function StringToLineStyleKind(Value: string): PLineStyleKind;
  function EdgePositionKindToString(Value: PEdgePositionKind): string;
  function StringToEdgePositionKind(Value: string): PEdgePositionKind;

  // DataType Conversion Routines
  function PointsToString(Value: PPoints): string;
  procedure StringToPoints(Value: string; Data: PPoints);

implementation

uses
  ExtCore, NXMgr, SysUtils, Math;

////////////////////////////////////////////////////////////////////////////////
// PExtensibleView

constructor PExtensibleView.Create;
begin
  inherited;
  FShowExtendedNotation := False;
end;

procedure PExtensibleView.SetShowExtendedNotation(Value: Boolean);
begin
  if Value <> FShowExtendedNotation then begin
    FShowExtendedNotation := Value;
  end;
end;

procedure PExtensibleView.ArrangeExtendedView(Canvs: PCanvas);
begin
  // write down arranging procedures
end;

procedure PExtensibleView.DrawExtendedView(Canvas: PCanvas);
begin
  // edited by hskim 2005.08.09 begin
  NXManager.DrawExpr(Canvas, Self,
    (Model as PExtensibleModel).GetStereotype.NotationExpr
  );
  // edited by hskim 2005.08.09 end
end;

function PExtensibleView.IsExtendedView: Boolean;
var
  Stereotype: PStereotype;
begin
  try
    Stereotype := (Model as PExtensibleModel).GetStereotype;
    if Stereotype = nil then
      Result := false
    else
      Result := (Stereotype.NotationExpr <> nil);
  except
    Result := false;
  end;
end;

procedure PExtensibleView.Draw(Canvas: PCanvas);
var
  SubView: PView;
  TopLevelDiagramView: PDiagramView;
  //I: Integer;
begin
  if Visible then begin
    Arrange(Canvas);
    // edited by hskim 2005.08.09 begin
//    if FShowExtendedNotation then
    if FShowExtendedNotation and IsExtendedView then
    // edited by hskim 2005.08.09 end
      DrawExtendedView(Canvas)
    else begin
      DrawObject(Canvas);
      for SubView in SubViews do begin
        if SubView.IsDrawDeferred then begin
          TopLevelDiagramView := GetTopLevelDiagramView;
          if Assigned(TopLevelDiagramView) then
            TopLevelDiagramView.AddDeferredDrawView(SubView)
        end
        else
          SubView.Draw(Canvas)
      end
    end;

    if Model = nil then
      DrawNoModeledMark(Canvas)

  end;
end;

procedure PExtensibleView.Arrange(Canvas: PCanvas);
var
  I: Integer;
begin
  // edited by hskim 2005.08.09 begin
  if FShowExtendedNotation and IsExtendedView and (not (Self is PEdgeView)) then
  // edited by hskim 2005.08.09 end
    ArrangeExtendedView(Canvas)
  else begin
    for I := 0 to SubViewCount - 1 do
      SubView[I].Arrange(Canvas);
    DelimitContainingBoundary(Canvas);
    ArrangeObject(Canvas);
  end;    
end;

function PExtensibleView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'ShowExtendedNotation' then begin
    Result := BooleanToString(ShowExtendedNotation);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PExtensibleView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'ShowExtendedNotation' then begin
    ShowExtendedNotation := StringToBoolean(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

// PExtensibleView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PNodeView

constructor PNodeView.Create;
begin
  inherited;
  FLeft := -1000; FTop := -1000; FWidth := 50; FHeight := 50;
  FMovable := mmFree; FSizable := szFree; FAutoResize := False;
  FMinWidth := 5;
  FMinHeight := 5;
end;

procedure PNodeView.Initialize(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
begin
  NormalizeRect(X1, Y1, X2, Y2);
  FLeft := X1;
  FTop := Y1;
  FWidth := Max(FMinWidth, X2 - X1);
  FHeight := Max(FMinHeight, Y2 - Y1);
end;

procedure PNodeView.SetLeft(Value: Integer);
begin
  if Value <> FLeft then begin
    FLeft := Value;
  end;
end;

procedure PNodeView.SetTop(Value: Integer);
begin
  if Value <> FTop then begin
    FTop := Value;
  end;
end;

procedure PNodeView.SetWidth(Value: Integer);
begin
  if Value <> FWidth then begin
    FWidth := Value;
    if FWidth < FMinWidth then FWidth := FMinWidth;
  end;
end;

procedure PNodeView.SetHeight(Value: Integer);
begin
  if Value <> FHeight then begin
    FHeight := Value;
    if FHeight < FMinHeight then FHeight := FMinHeight;
  end;
end;

function PNodeView.GetRight: Integer;
begin
  Result := FLeft + FWidth - 1;
end;

function PNodeView.GetBottom: Integer;
begin
  Result := FTop + FHeight - 1;
end;

procedure PNodeView.SetRight(Value: Integer);
var
  W: Integer;
begin
  W := Value - FLeft + 1;
  SetWidth(W);
end;

procedure PNodeView.SetBottom(Value: Integer);
var
  H: Integer;
begin
  H := Value - FTop + 1;
  SetHeight(H);
end;

procedure PNodeView.SetMinWidth(Value: Integer);
begin
  if FMinWidth <> Value then begin
    FMinWidth := Value;
    if FWidth < FMinWidth then SetWidth(FMinWidth);
  end;
end;

procedure PNodeView.SetMinHeight(Value: Integer);
begin
  if FMinHeight <> Value then begin
    FMinHeight := Value;
    if FHeight < FMinHeight then SetHeight(FMinHeight);
  end;
end;

procedure PNodeView.SetSizable(Value: PSizableMode);
begin
  // This is transient property.
  if Value <> FSizable then begin
    FSizable := Value;
  end;
end;

procedure PNodeView.SetMovable(Value: PMovableMode);
begin
  // This is transient property.
  if Value <> FMovable then begin
    FMovable := Value;
  end;
end;

procedure PNodeView.SetAutoResize(Value: Boolean);
begin
  if Value <> FAutoResize then begin
    FAutoResize := Value;
  end;
end;

procedure PNodeView.DrawSelection(Canvas: PCanvas);
var
  Retouch: Boolean;
  X1, Y1, X2, Y2: Integer;
begin
  Retouch := not((Sizable = szFree) or (Sizable = szRatio));

  // draw top line
  X1 := FLeft - 1; Y1 := FTop - 1; X2 := Right; Y2 := FTop - 1;
  DrawSelectionLine(Canvas, X1, Y1, X2, Y2, DEFAULT_SELECTIONLINE_WIDTH, nwseN, Retouch);

  // draw left line
  X1 := FLeft - 1; Y1 := FTop - 1; X2 := FLeft - 1; Y2 := Bottom;
  DrawSelectionLine(Canvas, X1, Y1, X2, Y2, DEFAULT_SELECTIONLINE_WIDTH, nwseW, Retouch);

  // draw right line
  X1 := Right; Y1 := FTop - 1; X2 := Right; Y2 := Bottom;
  DrawSelectionLine(Canvas, X1, Y1, X2, Y2, DEFAULT_SELECTIONLINE_WIDTH, nwseE, Retouch);

  // draw bottom line
  X1 := FLeft - 1; Y1 := Bottom; X2 := Right; Y2 := Bottom;
  DrawSelectionLine(Canvas, X1, Y1, X2, Y2, DEFAULT_SELECTIONLINE_WIDTH, nwseS, Retouch);

  if Sizable = szNone then begin
    // No draw Highlighter
  end
  else begin
    if (Sizable = szFree) or (Sizable = szRatio) then begin
      DrawHighlighter2(Canvas, FLeft, FTop, Right, Bottom, DEFAULT_HIGHLIGHTER_SIZE, ctLT, not ReadOnly, SELECTION_COLOR);
      DrawHighlighter2(Canvas, FLeft, FTop, Right, Bottom, DEFAULT_HIGHLIGHTER_SIZE, ctRT, not ReadOnly, SELECTION_COLOR);
      DrawHighlighter2(Canvas, FLeft, FTop, Right, Bottom, DEFAULT_HIGHLIGHTER_SIZE, ctLB, not ReadOnly, SELECTION_COLOR);
      DrawHighlighter2(Canvas, FLeft, FTop, Right, Bottom, DEFAULT_HIGHLIGHTER_SIZE, ctRB, not ReadOnly, SELECTION_COLOR);
    end;
    if (Sizable = szFree) or (Sizable = szVert) then begin
      DrawHighlighter2(Canvas, FLeft, FTop, Right, Bottom, DEFAULT_HIGHLIGHTER_SIZE, ctMT, not ReadOnly, SELECTION_COLOR);
      DrawHighlighter2(Canvas, FLeft, FTop, Right, Bottom, DEFAULT_HIGHLIGHTER_SIZE, ctMB, not ReadOnly, SELECTION_COLOR);
    end;
    if (Sizable = szFree) or (Sizable = szHorz) then begin
      DrawHighlighter2(Canvas, FLeft, FTop, Right, Bottom, DEFAULT_HIGHLIGHTER_SIZE, ctLM, not ReadOnly, SELECTION_COLOR);
      DrawHighlighter2(Canvas, FLeft, FTop, Right, Bottom, DEFAULT_HIGHLIGHTER_SIZE, ctRM, not ReadOnly, SELECTION_COLOR);
    end;
  end;
end;

procedure PNodeView.MovePosition(Canvas: PCanvas; DX, DY: Integer);
begin
  if (DX <> 0) or (DY <> 0) then begin
    FLeft := FLeft + DX; FTop := FTop + DY;
  end;
end;

procedure PNodeView.ArrangeObject(Canvas: PCanvas);
begin
  if FAutoResize then begin
    Width := FMinWidth;
    Height := FMinHeight;
  end;
end;

function PNodeView.GetBoundingBox(Canvas: PCanvas): TRect;
begin
  Result := Rect(FLeft, FTop, Right, Bottom);
end;

function PNodeView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'Left' then begin
    Result := IntegerToString(Left);
  end
  else if Name = 'Top' then begin
    Result := IntegerToString(Top);
  end
  else if Name = 'Width' then begin
    Result := IntegerToString(Width);
  end
  else if Name = 'Height' then begin
    Result := IntegerToString(Height);
  end
  else if Name = 'MinWidth' then begin
    Result := IntegerToString(MinWidth);
  end
  else if Name = 'MinHeight' then begin
    Result := IntegerToString(MinHeight);
  end
  else if Name = 'AutoResize' then begin
    Result := BooleanToString(AutoResize);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PNodeView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'Left' then begin
    Left := StringToInteger(Value);
  end
  else if Name = 'Top' then begin
    Top := StringToInteger(Value);
  end
  else if Name = 'Width' then begin
    Width := StringToInteger(Value);
  end
  else if Name = 'Height' then begin
    Height := StringToInteger(Value);
  end
  else if Name = 'MinWidth' then begin
    // Nothing to do.
  end
  else if Name = 'MinHeight' then begin
    // Nothing to do.
  end
  else if Name = 'AutoResize' then begin
    AutoResize := StringToBoolean(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

// PNodeView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PEdgeView


// Implementation of IInterface functions
function PEdgeView.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function PEdgeView._AddRef: Integer;
begin
  Result := 1;
end;

function PEdgeView._Release: Integer;
begin
  Result := 0;
end;

constructor PEdgeView.Create;
begin
  inherited Create;
  FHead := nil;
  FTail := nil;
  FPoints := PPoints.Create;
  FLineStyle := lsOblique;
  FHeadEndStyle := esFlat; FTailEndStyle := esFlat;
end;

destructor PEdgeView.Destroy;
begin
  FPoints.Free;
  FPoints := nil;
  inherited;
end;

procedure PEdgeView.Initialize(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
begin
  FPoints.Clear;
  FPoints.Add(Junction(Tail.GetBoundingBox(Canvas), GetCenter(Head.GetBoundingBox(Canvas))));
  FPoints.Add(Junction(Head.GetBoundingBox(Canvas), GetCenter(Tail.GetBoundingBox(Canvas))));
  if FLineStyle = lsRectilinear then
    FPoints.ConvObliqueToRectilinear;
end;

procedure PEdgeView.SetHead(Value: PView);
begin
  if Value <> FHead then begin
    FHead := Value;
  end;
end;

procedure PEdgeView.SetTail(Value: PView);
begin
  if Value <> FTail then begin
    FTail := Value;
  end;
end;

procedure PEdgeView.SetLineMode(Value: PLineMode);
begin
  // This is transient property.
  if Value <> FLineMode then begin
    FLineMode := Value;
  end;
end;

procedure PEdgeView.SetLineStyle(Value: PLineStyleKind);
begin
  if Value <> FLineStyle then begin
    if Value = lsRectilinear then
      FPoints.ConvObliqueToRectilinear;
    FLineStyle := Value;
  end;
end;

function PEdgeView.GetPoints: PPoints;
begin
  Result := FPoints;
end;

procedure PEdgeView.SetPoints(Value: PPoints);
begin
  if (Value <> FPoints) and (Value <> nil) then begin
    ChangePoints(Value);
  end;
end;

procedure PEdgeView.SetHeadEndStyle(Value: PEdgeEndStyle);
begin
  if Value <> FHeadEndStyle then begin
    FHeadEndStyle := Value;
  end;
end;

procedure PEdgeView.SetTailEndStyle(Value: PEdgeEndStyle);
begin
  if Value <> FTailEndStyle then begin
    FTailEndStyle := Value;
  end;
end;

procedure PEdgeView.DrawSelection(Canvas: PCanvas);
var
  I: Integer;
begin
  for I := 0 to FPoints.Count-1 do
    DrawHighlighter(Canvas, FPoints.Points[I].X, FPoints.Points[I].Y, DEFAULT_HALF_HIGHLIGHTER_SIZE, not ReadOnly, SELECTION_COLOR);
end;

procedure PEdgeView.MovePosition(Canvas: PCanvas; DX, DY: Integer);
var
  I: Integer;
begin
  // move all points so much DX, DY
  for I := 0 to FPoints.Count-1 do
    FPoints.Points[I] := Point( FPoints.Points[I].X + DX,
                                FPoints.Points[I].Y + DY );
end;

procedure PEdgeView.ChangePoints(APoints: PPoints);
begin
  FPoints.Assign(APoints);
end;

procedure PEdgeView.RecalcOblique(Canvas: PCanvas);
var
  HB, TB: TRect;
  I: Integer;
begin
  ReducePoints(Canvas);

  if not (Tail is PEdgeView) then
    TB := Tail.GetBoundingBox(Canvas)
  else
    with (Tail as PEdgeView).FPoints do begin
      I := (Count-1) div 2;
      TB := Rect(Points[I].X, Points[I].Y, Points[I+1].X, Points[I+1].Y);
    end;
  FPoints.Points[0] := GetCenter(TB);
   if not (Head is PEdgeView) then
    HB := Head.GetBoundingBox(Canvas)
  else
    with (Head as PEdgeView).FPoints do begin
      I := (Count-1) div 2;
      HB := Rect(Points[I].X, Points[I].Y, Points[I+1].X, Points[I+1].Y);
    end;
  Points.Points[Points.Count-1] := GetCenter(HB);
   if not (Tail is PEdgeView) then
    Points.Points[0] := Junction(TB, Points.Points[1]);
   if not (Head is PEdgeView) then
    Points.Points[Points.Count-1] := Junction(HB, Points.Points[FPoints.Count-2]);
end;

procedure PEdgeView.RecalcRectilinear(Canvas: PCanvas);
var
  BB, BT, BH: TRect;
  P: TPoint;
  I, W, H: Integer;
begin
  if Head = Tail then begin
    with Points do
      // If number of points is not enough to draw rectilinear edge, re-assign points
      if Count <= 3 then begin
        Clear;
        BB := Head.GetBoundingBox(Canvas);
        W := BB.Right - BB.Left;
        H := BB.Bottom - BB.Top;
        Add(GetCenter(BB));
        Add(Point(Points[0].X, Points[0].Y-(H div 2)-SELF_EDGE_VERTI_INTERVAL));
        Add(Point(Points[0].X+(W div 2)+SELF_EDGE_HORIZ_INTERVAL, Points[0].Y-(H div 2)-SELF_EDGE_VERTI_INTERVAL));
        Add(Point(Points[0].X+(W div 2)+SELF_EDGE_HORIZ_INTERVAL, Points[0].Y));
        Add(GetCenter(BB));
      end;
  end;

  // Estimate bounding coordinates of HeadView and TailView
  if not (Tail is PEdgeView) then
    BT := Tail.GetBoundingBox(Canvas)
  else
    with (Tail as PEdgeView).FPoints do begin
      I := (Count-1) div 2;
      BT := Rect(Points[I].X, Points[I].Y, Points[I+1].X, Points[I+1].Y);
      BT := Rect(GetCenter(BT).X, GetCenter(BT).Y, GetCenter(BT).X, GetCenter(BT).Y);
    end;
  if not (Head is PEdgeView) then
    BH := Head.GetBoundingBox(Canvas)
  else
    with (Head as PEdgeView).FPoints do begin
      I := (Count-1) div 2;
      BH := Rect(Points[I].X, Points[I].Y, Points[I+1].X, Points[I+1].Y);
      BH := Rect(GetCenter(BH).X, GetCenter(BH).Y, GetCenter(BH).X, GetCenter(BH).Y);
    end;

  with FPoints do begin
    // Add new point, if have not enough points.
    if Count = 2 then begin
      P := OrthoJunction(BT, Points[1]);
      if (P.X = -100) and (P.Y = -100) then
        Insert(0, OrthoJunction(BT, Points[0]))
      else
        Points[0] := P;
      P := OrthoJunction(BH, Points[Count-2]);
      if (P.X = -100) and (P.Y = -100) then
        Add(OrthoJunction(BH, Points[Count-1]))
      else
        Points[Count-1] := P;
    end;

    // Replace 0-indexed point with junction point to TailView
    P := OrthoJunction(BT, Points[1]);
    if (P.X = -100) and (P.Y = -100) then
      if Points[1].Y = Points[2].Y then
        Points[1] := Point(GetCenter(BT).X, Points[1].Y)
      else
        Points[1] := Point(Points[1].X, GetCenter(BT).Y);
    Points[0] := OrthoJunction(BT, Points[1]);

    // Replace highest-indexed point with junction point to HeadView
    P := OrthoJunction(BH, Points[Count-2]);
    if (P.X = -100) and (P.Y = -100) then
      if Points[Count-2].Y = Points[Count-3].Y then
        Points[Count-2] := Point(GetCenter(BH).X, Points[Count-2].Y)
      else
        Points[Count-2] := Point(Points[Count-2].X, GetCenter(BH).Y);
    Points[Count-1] := OrthoJunction(BH, Points[Count-2]);

    // Must be removed, and calculate this in another module (Handlers)
    // FitToGrid(GraphicClasses.GridFactor(5, 5));
    ReduceOrthoLine;
    ReducePoints(Canvas);

    P := Points[0];
    Points[0] := OrthoJunction(BT, Points[1]);
    if (Points[0].X = -100) or (Points[0].Y = -100) then
      Points[0] := P;

    P := Points[Count-1];
    Points[Count-1] := OrthoJunction(BH, Points[Count-2]);
    if (Points[Count-1].X = -100) or (Points[Count-1].Y = -100) then
      Points[Count-1] := P;
  end;
end;

procedure PEdgeView.ReducePoints(Canvas: PCanvas);
var
  I, J: Integer;
  B: TRect;
begin
  if not (Tail is PEdgeView) then begin
    // reduce points in Tail.boundingBox
    B := Tail.GetBoundingBox(Canvas);
    I := 1;
    while I < FPoints.Count-1 do begin
      if PointInRect(B, FPoints.Points[I]) then begin
        // remove previous
        for J := 1 to I do
          FPoints.Remove(1);
        I := 1;
      end else
        Inc(I);
    end;
  end;

  if not (Head is PEdgeView) then begin
    // reduce points in Head.boundingBox
    B := Head.GetBoundingBox(Canvas);
    I := 1;
    while I < FPoints.Count-1 do begin
      if PointInRect(B, FPoints.Points[I]) then begin
        // remove nexts
        for J := 1 to FPoints.Count-I-1 do
          FPoints.Remove(I);
      end else
        Inc(I);
    end;
  end;
end;

procedure PEdgeView.Clipping(Canvas: PCanvas);
var
  I: Integer;
  B: TRect;
begin
  if not (Tail is PEdgeView) then begin
    // reduce points in Tail.boundingBox
    B := Tail.GetBoundingBox(Canvas);
    I := 0;
    while I <= FPoints.Count-1 do begin
      if PointInRect(B, FPoints.Points[I]) then
        FPoints.Remove(I)
      else
        Inc(I);
    end;
  end;
end;

procedure PEdgeView.DrawLineEnd(Canvas: PCanvas; Value: PEdgeEndStyle; IsHead: Boolean);
var
  RT: TRect;
  P0, P1, P2, P3, P4, P5, P6, P7: TPoint;
  A, B, TH, TH1, TH2: Extended;
begin
  if Value = esFlat then Exit;
  with Points do begin
    if IsHead then
      RT := Rect(Points[Count-1].X, Points[Count-1].Y,
                 Points[Count-2].X, Points[Count-2].Y)
    else
      RT := Rect(Points[0].X, Points[0].Y,
                 Points[1].X, Points[1].Y);

    A := RT.Bottom - RT.Top;
    B := (RT.Right - RT.Left + 0.00001);
    TH := ArcTan(A / B);
    if ((A < 0) and (B < 0)) or ((A > 0) and (B < 0)) or ((A = 0) and (B < 0)) THen
      TH := TH + 3.141592;
    TH1 := TH - 3.141592 / 8;
    TH2 := TH + 3.141592 / 8;

    P0 := Point(RT.Left, RT.Top);
    P1 := Point(Trunc(11 * Cos(TH1)) + RT.Left, Trunc(11 * Sin(TH1)) + RT.Top);
    P2 := Point(Trunc(11 * Cos(TH2)) + RT.Left, Trunc(11 * Sin(TH2)) + RT.Top);
    P3 := Point(Trunc(22 * Cos(TH)) + RT.Left, Trunc(22 * Sin(TH)) + RT.Top);
    P4 := Point(Trunc(22 * Cos(TH1)) + RT.Left, Trunc(22 * Sin(TH1)) + RT.Top);
    P5 := Point(Trunc(22 * Cos(TH2)) + RT.Left, Trunc(22 * Sin(TH2)) + RT.Top);
    P6 := Point(Trunc(11 * Cos(TH1)) + P3.X, Trunc(11 * Sin(TH1)) + P3.Y);
    P7 := Point(Trunc(11 * Cos(TH2)) + P3.X, Trunc(11 * Sin(TH2)) + P3.Y);

    Canvas.Pen.Color := LineColor;
    Canvas.Brush.Color := clWhite;
    Canvas.Pen.Style := psSolid;
    case Value of
      esStickArrow: begin
        Canvas.Polyline([P1, P0, P2]);
      end;
      esSolidArrow: begin
        Canvas.Brush.Color := LineColor;
        Canvas.Polygon([P1, P0, P2]);
      end;
      esTriangle: begin
        Canvas.Polygon([P4, P0, P5]);
      end;
      esFilledTriangle: begin
        Canvas.Brush.Color := LineColor;
        Canvas.Polygon([P4, P0, P5]);
      end;
      esDiamond: begin
        Canvas.Polygon([P1, P0, P2, P3]);
      end;
      esFilledDiamond: begin
        Canvas.Brush.Color := LineColor;
        Canvas.Polygon([P1, P0, P2, P3]);
      end;
      esArrowDiamond: begin
        Canvas.Polygon([P1, P0, P2, P3]);
        Canvas.Polyline([P6, P3, P7]);
      end;
      esArrowFilledDiamond: begin
        Canvas.Brush.Color := LineColor;
        Canvas.Polygon([P1, P0, P2, P3]);
        Canvas.Polyline([P6, P3, P7]);
      end;
    end;
  end;
end;

procedure PEdgeView.DrawObject(Canvas: PCanvas);
begin
  AssignStyleToCanvas(Canvas);
  if FLineMode = lmSolid then
    Canvas.Pen.Style := psSolid
  else
    Canvas.Pen.Style := psDot;
  Canvas.Brush.Color := BACKGROUND_COLOR;    
  FPoints.Draw(Canvas);
  Canvas.Pen.Style := psSolid;
  DrawLineEnd(Canvas, FHeadEndStyle, True);
  DrawLineEnd(Canvas, FTailEndStyle, False);
end;

procedure PEdgeView.DrawNoModeledMark(Canvas: PCanvas);
var
  X, Y: Integer;
begin
  if (Points.Count mod 2) = 0 then begin
    X := (Points.Points[Points.Count div 2 - 1].X + Points.Points[Points.Count div 2].X) div 2;
    Y := (Points.Points[Points.Count div 2 - 1].Y + Points.Points[Points.Count div 2].Y) div 2;
  end
  else begin
    X := Points.Points[Points.Count div 2].X;
    Y := Points.Points[Points.Count div 2].Y;
  end;
  DrawModelExcludedMark(Canvas, X, Y);
end;

procedure PEdgeView.ArrangeObject(Canvas: PCanvas);
begin
  inherited;
  if Head = Tail then
    LineStyle := lsRectilinear;
  if LineStyle = lsOblique then RecalcOblique(Canvas)
                           else RecalcRectilinear(Canvas);
end;

procedure PEdgeView.FitToGrid(GF: PGridFactor);
var
  I: Integer;
begin
  // Modified because end of edge must be fit to BoundingBox of node
  for I := 1 to FPoints.Count - 2 do
    with FPoints do
      Points[I] := Point(Points[I].X - Points[I].X mod GF.Width,
                         Points[I].Y - Points[I].Y mod GF.Height);
end;

procedure PEdgeView.RecalcPoints(Canvas: PCanvas);
begin
  if FLineStyle = lsOblique then
    RecalcOblique(Canvas)
  else
    RecalcRectilinear(Canvas);
end;

function PEdgeView.GetBoundingBox(Canvas: PCanvas): TRect;
var
  I: Integer;
  R: TRect;
begin
  R := Rect(FPoints.Points[0].X, FPoints.Points[0].Y,
            FPoints.Points[0].X, FPoints.Points[0].Y);
  for I := 1 to FPoints.Count - 1 do
    R := GraphicClasses.UnionRect(R, Rect(FPoints.Points[I].X, FPoints.Points[I].Y,
                                          FPoints.Points[I].X+1, FPoints.Points[I].Y+1));
  for I := 0 to SubViewCount - 1 do
    if SubView[I].Visible then
      R := GraphicClasses.UnionRect(R, SubView[I].GetBoundingBox(Canvas));
  Result := R;
end;

function PEdgeView.ContainsPoint(Canvas: PCanvas; P: TPoint): Boolean;
begin
  if ContainedIndex(Canvas, P) > -1 then
    Result := True
  else
    Result := False;
end;

function PEdgeView.OverlapRect(Canvas: PCanvas; R: TRect): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := 0 to FPoints.Count - 2 do
    if RectInLine(R, Point(FPoints.Points[I].X, FPoints.Points[I].Y),
                     Point(FPoints.Points[I+1].X, FPoints.Points[I+1].Y)) then begin
      Result := True;
      Exit;
    end;
end;

function PEdgeView.ContainedIndex(Canvas: PCanvas; P: TPoint): Integer;

  function DisToPoint(P1, P2: TPoint): Real;
  begin
    Result := Sqrt(Sqr(P1.X - P2.X) + Sqr(P1.Y - P2.Y));
  end;

  function DisToOthoLine(LH, LT: TPoint; P: TPoint): Real;
  var
    L1, L2: TPoint;
  begin
    // horizontal line
    if LH.Y = LT.Y then begin
      if LH.X > LT.X then begin
        L1 := LT; L2 := LH;
      end
      else begin
        L1 := LH; L2 := LT;
      end;
      if P.X > L2.X then
        Result := DisToPoint(P, L2)
      else if P.X < L1.X then
        Result := DisToPoint(P, L1)
      else
        Result := Abs(P.Y - L1.Y);
    end
    // vertical line (ie. LH.X = LT.X)
    else begin
      if LH.Y > LT.Y then begin
        L1 := LT; L2 := LH;
      end
      else begin
        L1 := LH; L2 := LT;
      end;
      if P.Y > L2.Y then
        Result := DisToPoint(P, L2)
      else if P.Y < L1.Y then
        Result := DisToPoint(P, L1)
      else
        Result := Abs(P.X - L1.X);
    end;
  end;

const
  RECOG_MIN_DIS = 5;
var
  I: Integer;
  PT, PH: TPoint;
  D, MinDis: Real;
  MinDisIndex: Integer;
begin
  // Rectilinear
  if LineStyle = lsRectilinear then begin
    MinDis := RECOG_MIN_DIS;
    MinDisIndex := -1;
    for I := 0 to FPoints.Count-2 do begin
      PT := FPoints.Points[I];
      PH := FPoints.Points[I+1];

      D := DisToOthoLine(PH, PT, P);
      if D <= MinDis then begin
        MinDis := D;
        MinDisIndex := I;
      end;
    end;
    Result := MinDisIndex;
  end
  // Oblique ?
  else begin
    Result := -1;
    for I := 0 to FPoints.Count-2 do begin
      PT := FPoints.Points[I];
      PH := FPoints.Points[I+1];
      if PtInLine(Rect(PT.X, PT.Y, PH.X, PH.Y), P) then
        Result := I;
    end;
  end;
end;

function PEdgeView.SelectedPoint(Canvas: PCanvas; P: TPoint): Integer;
var
  I: Integer;
begin
  Result := -1;
// Removed. (why call RecalcPoints?)
// RecalcPoints(Canvas);
//  for I := 1 to FPoints.Count-2 do begin
// Replaced with following
  for I := 0 to FPoints.Count - 1 do begin
    if EqualPt(FPoints.Points[I], P) then
      Result := I;
  end;
end;

function PEdgeView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'LineStyle' then begin
    Result := LineStyleKindToString(LineStyle);
  end
  else if Name = 'Points' then begin
    Result := PointsToString(FPoints);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PEdgeView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'LineStyle' then begin
    LineStyle := StringToLineStyleKind(Value);
  end
  else if Name = 'Points' then begin
    StringToPoints(Value, FPoints);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PEdgeView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'Head' then begin
    Result := Head;
  end
  else if Name = 'Tail' then begin
    Result := Tail;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PEdgeView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'Head' then begin
    Head := Value as PView;
  end
  else if Name = 'Tail' then begin
    Tail := Value as PView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PEdgeView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PLabelView

constructor PLabelView.Create;
begin
  inherited;
  Enabled := True;
  Selectable := False;
  Movable := mmNone;
  Sizable := szNone;
  FText := '';
  FHorzAlignment := haLeft;
  FVertAlignment := vaTop;
  FWordWrap := False;
end;

procedure PLabelView.SetText(Value: string);
begin
  if FText <> Value then begin
    FText := Value;
  end;
end;

procedure PLabelView.SetHorzAlignment(Value: PHorzAlignmentKind);
begin
  if FHorzAlignment <> Value then begin
    FHorzAlignment := Value;
  end;
end;

procedure PLabelView.SetVertAlignment(Value: PVertAlignmentKind);
begin
  if FVertAlignment <> Value then begin
    FVertAlignment := Value;
  end;
end;

procedure PLabelView.SetDirection(Value: PDirectionKind);
begin
  if FDirection <> Value then begin
    FDirection := Value;
  end;
end;

procedure PLabelView.SetWordWrap(Value: Boolean);
begin
  if FWordWrap <> Value then begin
    FWordWrap := Value;
  end;
end;

procedure PLabelView.DrawObject(Canvas: PCanvas);

  function GetTextOutArguments: PTextOutArguments;
  var
    Args: PTextOutArguments;
  begin
    Args := [];
    case FHorzAlignment of
      haLeft:   Args := Args + [taAlignLeft];
      haCenter: Args := Args + [taAlignCenter];
      haRight:  Args := Args + [taAlignRight];
    end;
    case FVertAlignment of
      vaTop:    Args := Args + [PTextOutArgument.taAlignTop];
      vaMiddle: Args := Args + [taAlignMiddle];
      vaBottom: Args := Args + [PTextOutArgument.taAlignBottom];
    end;
    if FWordWrap then
      Args := Args + [taWordBreak];
    Result := Args;
  end;

var
  R: TRect;
  S: TSize;
  X, Y: Integer;
begin
  X := 0; Y := 0;
  AssignFontToCanvas(Canvas);
  AssignStyleToCanvas(Canvas);

  if FDirection = dkHorizontal then begin
    R := Rect(Left, Top, Right, Bottom);
    if FWordWrap then
      S := Canvas.GetTextSize(FText, Width - 1)
    else
      S := Canvas.GetTextSize(FText, -1);
    case FHorzAlignment of
      haLeft:   R.Left := Left;
      haCenter: R.Left := Left + (Width - S.CX) div 2;
      haRight:  R.Left := Right - S.CX;
    end;
    case FVertAlignment of
      vaTop:    R.Top := Top;
      vaMiddle: R.Top := Top + (Height - S.CY) div 2;
      vaBottom: R.Top := Bottom - S.CY;
    end;
    R.Right := R.Left + S.CX;
    R.Bottom := R.Top + S.CY;
    if FWordWrap then
      Canvas.TextOut(R, Text, False, GetTextOutArguments)
    else
      Canvas.TextOut(R.Left, R.Top, FText);
  end
  else begin
    if Canvas.TextWidth(FText) > Height then Y := Top
    else begin
      case FHorzAlignment of
        haLeft: Y := Bottom;
        haCenter: Y := Bottom - (Height - Canvas.TextWidth(FText)) div 2;
        haRight: Y := Top + Canvas.TextWidth(FText);
      end;
    end;
    case FVertAlignment of
      vaTop: X := Left;
      vaMiddle: X := Left - (Width - Canvas.TextHeight('^_')) div 2;
      vaBottom: X := Right - Canvas.TextHeight('^_');
    end;
    Canvas.TextOut(X, Y, Text, True);
  end;
end;

function PLabelView.IsDrawDeferred: Boolean;
begin
  Result := True;
end;

procedure PLabelView.ArrangeObject(Canvas: PCanvas);
var
  MinW, MinH, W, H: Integer;
  Size: TSize;
begin
  AssignFontToCanvas(Canvas);
  if FWordWrap and (FDirection = dkHorizontal) then begin
    Size := Canvas.GetTextSize(FText, 1);
    MinW := Size.CX;
    MinH := Canvas.TextHeight('^_');
    Size := Canvas.GetTextSize(FText, Width - 1);
    W := Size.CX;
    H := Size.CY;
  end
  else begin
    MinW := Canvas.TextWidth(FText);
    MinH := Canvas.TextHeight('^_');
    W := MinW;
    H := MinH;
  end;

  if FDirection = dkHorizontal then begin
    MinWidth := MinW;
    MinHeight := MinH;
    Height := H;
  end
  else begin
    MinWidth := MinH;
    MinHeight := MinW;
    Width := W;
  end;
end;

function PLabelView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'Text' then begin
    Result := Text;
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PLabelView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'Text' then begin
    Text := Value;
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

// PLabelView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PParasiticView

procedure PParasiticView.SetAlpha(Value: Extended);
begin
  if FAlpha <> Value then begin
    FAlpha := Value;
  end;
end;

procedure PParasiticView.SetDistance(Value: Extended);
begin
  if FDistance <> Value then begin
    FDistance := Value;
  end;
end;

function PParasiticView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'Alpha' then begin
    Result := RealToString(Alpha);
  end
  else if Name = 'Distance' then begin
    Result := RealToString(Distance);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PParasiticView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'Alpha' then begin
    Alpha := StringToReal(Value);
  end
  else if Name = 'Distance' then begin
    Distance := StringToReal(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

// PParasiticView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PNodeParasiticView

procedure PNodeParasiticView.SetHostNode(Value: PNodeView);
begin
  if FHostNode <> Value then begin
    FHostNode := Value;
  end;
end;

procedure PNodeParasiticView.ArrangeObject(Canvas: PCanvas);
var
  P, P1: TPoint;
  Node: PNodeView;
begin
  inherited;
  // if HostNode exists, determin position on the basis of it
  if HostNode <> nil then begin
    Node := HostNode
  end
  // if HostNode doen't exist, determin position on the basis of parent
  else if Parent is PNodeView then begin
    Node := (Parent as PNodeView);
  end
  // if Parent is not PNodeView, can't determine position
  else begin
    Exit;
  end;
  P1.X := (Node.Left + Node.Right) div 2;
  P1.Y := (Node.Top + Node.Bottom) div 2;
  P := GetPointAwayLine(P1, P1, FAlpha, FDistance);
  Left := P.X + P1.X - Width div 2;
  Top := P.Y + P1.Y - Height div 2;
end;

function PNodeParasiticView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'HostNode' then begin
    Result := HostNode;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PNodeParasiticView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'HostNode' then begin
    HostNode := Value as PNodeView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PNodeParasiticView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PEdgeParasiticView

procedure PEdgeParasiticView.SetEdgePosition(Value: PEdgePositionKind);
begin
  if FEdgePosition <> Value then begin
    FEdgePosition := Value;
  end;
end;

procedure PEdgeParasiticView.SetHostEdge(Value: PEdgeView);
begin
  if FHostEdge <> Value then begin
    FHostEdge := Value;
  end;
end;

procedure PEdgeParasiticView.ArrangeObject(Canvas: PCanvas);
var
  MidPointIndex : Integer;
  P1, P2, P: TPoint;
  Edge: PEdgeView;
begin
  inherited;
  // if HostEdge exists, determin position on the basis of it
  if FHostEdge <> nil then begin
    Edge := HostEdge;
  end
  // if HostEdge doesn't exist, determin position on the basis of Parent
  else if Parent is PEdgeView then begin
    Edge := Parent as PEdgeView;
  end
  // if Parent is not PEdgeView, can't determine position
  else begin
    Exit;
  end;
  with Edge.Points do begin
    case FEdgePosition of
      epHead: begin
        P1 := Points[Count-1];
        P2 := Points[Count-2];
      end;
      epTail: begin
        P1 := Points[0];
        P2 := Points[1];
      end;
      epMiddle: begin
        MidPointIndex := Count div 2;
        if Count mod 2 = 0 then MidPointIndex := MidPointIndex - 1;

        P1 := Points[MidPointIndex];
        P2 := Points[MidPointIndex+1];

        if Count mod 2 = 0 then begin
          P1.X := Trunc((P1.X + P2.X) / 2);
          P1.Y := Trunc((P1.Y + P2.Y) / 2);
        end
      end;
    end;
  end;
  P := GetPointAwayLine(P1, P2, FAlpha, FDistance);

  Left := P.X + P1.X - Width div 2;
  Top := P.Y + P1.Y - Height div 2;
end;

function PEdgeParasiticView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'EdgePosition' then begin
    Result := EdgePositionKindToString(EdgePosition);
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PEdgeParasiticView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'EdgePosition' then begin
    EdgePosition := StringToEdgePositionKind(Value);
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

function PEdgeParasiticView.MOF_GetReference(Name: string): PElement;
begin
  if Name = 'HostEdge' then begin
    Result := HostEdge;
  end
  else begin
    Result := inherited MOF_GetReference(Name);
  end;
end;

procedure PEdgeParasiticView.MOF_SetReference(Name: string; Value: PElement);
begin
  if Name = 'HostEdge' then begin
    HostEdge := Value as PEdgeView;
  end
  else begin
    inherited MOF_SetReference(Name, Value);
  end;
end;

// PEdgeParasiticView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PNodeLabelView

constructor PNodeLabelView.Create;
begin
  inherited;
  Enabled := True;
  Movable := mmFree;
  Sizable := szNone;
  FText := '';
  FHorzAlignment := haLeft;
  FVertAlignment := vaTop;
end;

procedure PNodeLabelView.SetText(Value: string);
begin
  if FText <> Value then begin
    FText := Value;
  end;
end;

procedure PNodeLabelView.SetHorzAlignment(Value: PHorzAlignmentKind);
begin
  if FHorzAlignment <> Value then begin
    FHorzAlignment := Value;
  end;
end;

procedure PNodeLabelView.SetVertAlignment(Value: PVertAlignmentKind);
begin
  if FVertAlignment <> Value then begin
    FVertAlignment := Value;
  end;
end;

procedure PNodeLabelView.DrawObject(Canvas: PCanvas);
var
  X, Y: Integer;
begin
  inherited;
  X := 0; Y := 0;
  AssignFontToCanvas(Canvas);
  AssignStyleToCanvas(Canvas);
  if Canvas.TextWidth(FText) > Width then X := Left
  else begin
    case FHorzAlignment of
      haLeft: X := Left;
      haCenter: X := Left + (Width - Canvas.TextWidth(FText)) div 2;
      haRight: X := Right - Canvas.TextWidth(FText);
    end;
  end;
  case FVertAlignment of
    vaTop: Y := Top;
    vaMiddle: Y := Top - (Height - Canvas.TextHeight('^_')) div 2;
    vaBottom: Y := Bottom - Canvas.TextHeight('^_');
  end;
  // Canvas.TextOutWithLen(X, Y, Width, Text);
  // Replaced with following
  Canvas.TextOut(X, Y, Text);
end;

procedure PNodeLabelView.ArrangeObject(Canvas: PCanvas);
var
  W, H: Integer;
begin
  inherited;
  AssignFontToCanvas(Canvas);
  // Setting Minimum Size
  W := Canvas.TextWidth(FText);
  H := Canvas.TextHeight('^_');
  MinWidth := W;
  MinHeight := H;
  Width := MinWidth;
  Height := MinHeight;
end;

function PNodeLabelView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'Text' then begin
    Result := Text;
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PNodeLabelView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'Text' then begin
    Text := Value;
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

// PNodeLabelView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PEdgeLabelView

constructor PEdgeLabelView.Create;
begin
  inherited;
  Enabled := True;
  Movable := mmFree;
  Sizable := szNone;
  FText := '';
  FHorzAlignment := haLeft;
  FVertAlignment := vaTop;
end;

procedure PEdgeLabelView.SetText(Value: string);
begin
  if FText <> Value then begin
    FText := Value;
  end;
end;

procedure PEdgeLabelView.SetHorzAlignment(Value: PHorzAlignmentKind);
begin
  if FHorzAlignment <> Value then begin
    FHorzAlignment := Value;
  end;
end;

procedure PEdgeLabelView.SetVertAlignment(Value: PVertAlignmentKind);
begin
  if FVertAlignment <> Value then begin
    FVertAlignment := Value;
  end;
end;

procedure PEdgeLabelView.DrawObject(Canvas: PCanvas);
var
  X, Y: Integer;
begin
  X := 0; Y := 0;
  AssignFontToCanvas(Canvas);
  AssignStyleToCanvas(Canvas);
  if Canvas.TextWidth(FText) > Width then X := Left
  else begin
    case FHorzAlignment of
      haLeft: X := Left;
      haCenter: X := Left + (Width - Canvas.TextWidth(FText)) div 2;
      haRight: X := Right - Canvas.TextWidth(FText);
    end;
  end;
  case FVertAlignment of
    vaTop: Y := Top;
    vaMiddle: Y := Top - (Height - Canvas.TextHeight('^_')) div 2;
    vaBottom: Y := Bottom - Canvas.TextHeight('^_');
  end;
  // Canvas.TextOutWithLen(X, Y, Width, Text);
  // Replaced with following
  Canvas.TextOut(X, Y, Text);
end;

procedure PEdgeLabelView.ArrangeObject(Canvas: PCanvas);
var
  W, H: Integer;
begin
  inherited;
  AssignFontToCanvas(Canvas);
  // Setting Minimum Size
  W := Canvas.TextWidth(FText);
  H := Canvas.TextHeight('^_');
  MinWidth := W;
  MinHeight := H;
  Width := MinWidth;
  Height := MinHeight;
end;

function PEdgeLabelView.MOF_GetAttribute(Name: string): string;
begin
  if Name = 'Text' then begin
    Result := Text;
  end
  else begin
    Result := inherited MOF_GetAttribute(Name);
  end;
end;

procedure PEdgeLabelView.MOF_SetAttribute(Name, Value: string);
begin
  if Name = 'Text' then begin
    Text := Value;
  end
  else begin
    inherited MOF_SetAttribute(Name, Value);
  end;
end;

// PEdgeLabelView
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Enumeration Conversion Routines

function LineStyleKindToString(Value: PLineStyleKind): string;
begin
  if Value = lsRectilinear then
    Result := 'lsRectilinear'
  else if Value = lsOblique then
    Result := 'lsOblique'
  else
    Result := '';
end;

function StringToLineStyleKind(Value: string): PLineStyleKind;
begin
  if Value = 'lsRectilinear' then
    Result := lsRectilinear
  else if Value = 'lsOblique' then
    Result := lsOblique
  else
    Result := lsRectilinear;
end;

function EdgePositionKindToString(Value: PEdgePositionKind): string;
begin
  if Value = epHead then
    Result := 'epHead'
  else if Value = epMiddle then
    Result := 'epMiddle'
  else if Value = epTail then
    Result := 'epTail'
  else
    Result := '';
end;

function StringToEdgePositionKind(Value: string): PEdgePositionKind;
begin
  if Value = 'epHead' then
    Result := epHead
  else if Value = 'epMiddle' then
    Result := epMiddle
  else if Value = 'epTail' then
    Result := epTail
  else
    Result := epHead;
end;

// Enumeration Conversion Routines
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// DataType Conversion Routines

function PointsToString(Value: PPoints): string;
var
  I: Integer;
  S: string;

  function PtToStr(P: TPoint): string;
  begin
    Result := IntToStr(P.X) + ',' + IntToStr(P.Y);
  end;

begin
  S := '';
  if Value.Count > 0 then begin
    S := PtToStr(Value.Points[0]);
    for I := 1 to Value.Count - 1 do
      S := S + ';' + PtToStr(Value.Points[I]);
  end;
  Result := S;
end;

procedure StringToPoints(Value: string; Data: PPoints);

  function StrToPt(PtStr: string): TPoint;
  var
    SI: Integer;
    SP: TPoint;
  begin
    SI := Pos(',', PtStr);
    SP.X := StrToInt(Copy(PtStr, 0, SI - 1));
    SP.Y := StrToInt(Copy(PtStr, SI + 1, Length(PtStr) - SI));
    Result := SP;
  end;

  procedure RecursiveStringToPoints(PointsStr: string; PointsObj: PPoints);
  var
    Idx: Integer;
    Hd, Tl: string;
  begin
    if Trim(PointsStr) <> '' then begin
      Idx := Pos(';', PointsStr);
      if Idx = 0 then begin
        Hd := PointsStr;
        Tl := '';
      end
      else begin
        Hd := Copy(PointsStr, 0, Idx - 1);
        Tl := Copy(PointsStr, Idx + 1, Length(PointsStr) - Idx);
      end;
      PointsObj.Add(StrToPt(Hd));
      RecursiveStringToPoints(Tl, PointsObj);
    end;
  end;

begin
  Data.Clear;
  RecursiveStringToPoints(Value, Data);
end;

// DataType Conversion Routines
////////////////////////////////////////////////////////////////////////////////

procedure RegisterClasses;
begin
  ClassRegistry.RegisterClass(PExtensibleView);
  ClassRegistry.RegisterClass(PNodeView);
  ClassRegistry.RegisterClass(PEdgeView);
  ClassRegistry.RegisterClass(PLabelView);
  ClassRegistry.RegisterClass(PParasiticView);
  ClassRegistry.RegisterClass(PNodeParasiticView);
  ClassRegistry.RegisterClass(PEdgeParasiticView);
  ClassRegistry.RegisterClass(PNodeLabelView);
  ClassRegistry.RegisterClass(PEdgeLabelView);
  ClassRegistry.RegisterClass(PNodeNodeView);
  ClassRegistry.RegisterClass(PEdgeNodeView);
end;

procedure RegisterMetaClasses;
var
  E: PMetaEnumeration;
  M: PMetaClass;
begin
  // Enumerations
  E := MetaModel.DefineMetaEnumeration('LineStyleKind');
  MetaModel.DefineMetaLiteral(E, 'lsRectilinear');
  MetaModel.DefineMetaLiteral(E, 'lsOblique');
  E := MetaModel.DefineMetaEnumeration('EdgePositionKind');
  MetaModel.DefineMetaLiteral(E, 'epHead');
  MetaModel.DefineMetaLiteral(E, 'epMiddle');
  MetaModel.DefineMetaLiteral(E, 'epTail');
  // DataTypes
  MetaModel.DefineMetaDataType('Points');
  // Meta Classes
  MetaModel.DefineMetaClass(PExtensibleView, 'ExtensibleView', True);
  MetaModel.DefineMetaClass(PNodeView, 'NodeView', True);
  MetaModel.DefineMetaClass(PEdgeView, 'EdgeView', True);
  MetaModel.DefineMetaClass(PLabelView, 'LabelView', False);
  MetaModel.DefineMetaClass(PParasiticView, 'ParasiticView', True);
  MetaModel.DefineMetaClass(PNodeParasiticView, 'NodeParasiticView', True);
  MetaModel.DefineMetaClass(PEdgeParasiticView, 'EdgeParasiticView', True);
  MetaModel.DefineMetaClass(PNodeLabelView, 'NodeLabelView', False);
  MetaModel.DefineMetaClass(PEdgeLabelView, 'EdgeLabelView', False);
  MetaModel.DefineMetaClass(PNodeNodeView, 'NodeNodeView', True);
  MetaModel.DefineMetaClass(PEdgeNodeView, 'EdgeNodeView', True);
  // ExtensibleView
  M := MetaModel.FindMetaClass('ExtensibleView');
  MetaModel.DefineMetaAttribute(M, 'ShowExtendedNotation', 'Boolean', False, False);
  // NodeView
  M := MetaModel.FindMetaClass('NodeView');
  MetaModel.DefineMetaAttribute(M, 'Left', 'Integer', False, False);
  MetaModel.DefineMetaAttribute(M, 'Top', 'Integer', False, False);
  MetaModel.DefineMetaAttribute(M, 'Width', 'Integer', False, False);
  MetaModel.DefineMetaAttribute(M, 'Height', 'Integer', False, False);
  MetaModel.DefineMetaAttribute(M, 'MinWidth', 'Integer', True, True);
  MetaModel.DefineMetaAttribute(M, 'MinHeight', 'Integer', True, True);
  MetaModel.DefineMetaAttribute(M, 'AutoResize', 'Boolean', False, False);
  // EdgeView
  M := MetaModel.FindMetaClass('EdgeView');
  MetaModel.DefineMetaAttribute(M, 'LineStyle', 'LineStyleKind', False, False, 'lsOblique');
  MetaModel.DefineMetaAttribute(M, 'Points', 'Points', True, False);
  MetaModel.DefineMetaReference(M, 'Head', 'View', True, False, makNone);
  MetaModel.DefineMetaReference(M, 'Tail', 'View', True, False, makNone);
  // LabelView
  M := MetaModel.FindMetaClass('LabelView');
  MetaModel.DefineMetaAttribute(M, 'Text', 'String', True, False);
  // ParasiticView
  M := MetaModel.FindMetaClass('ParasiticView');
  MetaModel.DefineMetaAttribute(M, 'Alpha', 'Real', False, False);
  MetaModel.DefineMetaAttribute(M, 'Distance', 'Real', False, False);
  // NodeParasiticView
  M := MetaModel.FindMetaClass('NodeParasiticView');
  MetaModel.DefineMetaReference(M, 'HostNode', 'PNodeView', True, False, makNone);
  // EdgeParasiticView
  M := MetaModel.FindMetaClass('EdgeParasiticView');
  MetaModel.DefineMetaAttribute(M, 'EdgePosition', 'EdgePositionKind', True, False, 'epMiddle');
  MetaModel.DefineMetaReference(M, 'HostEdge', 'PEdgeView', True, False, makNone);
  // EdgeLabelView
  M := MetaModel.FindMetaClass('EdgeLabelView');
  MetaModel.DefineMetaAttribute(M, 'Text', 'String', True, False);
  // NodeLabelView
  M := MetaModel.FindMetaClass('NodeLabelView');
  MetaModel.DefineMetaAttribute(M, 'Text', 'String', True, False);
  // NodeNodeView
  // EdgeNodeView
  // Inheritance Relations
  MetaModel.DefineMetaInheritance('View', 'ExtensibleView');
  MetaModel.DefineMetaInheritance('ExtensibleView', 'NodeView');
  MetaModel.DefineMetaInheritance('ExtensibleView', 'EdgeView');
  MetaModel.DefineMetaInheritance('NodeView', 'LabelView');
  MetaModel.DefineMetaInheritance('NodeView', 'ParasiticView');
  MetaModel.DefineMetaInheritance('ParasiticView', 'NodeParasiticView');
  MetaModel.DefineMetaInheritance('ParasiticView', 'EdgeParasiticView');
  MetaModel.DefineMetaInheritance('NodeParasiticView', 'NodeLabelView');
  MetaModel.DefineMetaInheritance('EdgeParasiticView', 'EdgeLabelView');
  MetaModel.DefineMetaInheritance('NodeParasiticView', 'NodeNodeView');
  MetaModel.DefineMetaInheritance('EdgeParasiticView', 'EdgeNodeView');
end;

initialization
  RegisterClasses;
  RegisterMetaClasses;
end.

