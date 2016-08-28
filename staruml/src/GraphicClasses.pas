unit GraphicClasses;

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
  Types, Classes, Windows, Forms, Graphics, Math, ExtCtrls,
  Controls, Generics.Collections;

const
  MAXPOINTS = 1024;
  DEFAULT_HIGHLIGHTER_SIZE = 7;
  DEFAULT_HALF_HIGHLIGHTER_SIZE = 3;
  DEFAULT_SELECTIONLINE_WIDTH = DEFAULT_HIGHLIGHTER_SIZE - 1;

type
  // Forward Declarations
  PPoints = class;
  PCanvas = class;

  // Enumeration Types
  PCornerType = (ctLT, ctLM, ctLB, ctMT, ctMB, ctRT, ctRM, ctRB, ctElse);
  PNWSEType = (nwseN, nwseS, nwseW, nwseE);
  PTextOutArgument = (taAlignLeft, taAlignCenter, taAlignRight, taAlignTop, taAlignMiddle, taAlignBottom, taWordBreak);
  PTextOutArguments = set of PTextOutArgument;

  // PZoomFactor
  PZoomFactor = record
    Numer, Denom: Integer;
  end;

  // PGridFactor
  PGridFactor = record
    Width, Height: Integer;
  end;

  // PPointArr
  PPointArr = array[0..MAXPOINTS - 1] of TPoint;

  // PPenBrushRec
  PPenBrushRec = record
    PenWidth: Integer;
    PenColor: TColor;
    PenMode: TPenMode;
    PenStyle: TPenStyle;
    BrushColor: TColor;
    BrushStyle: TBrushStyle;
  end;

  // PFontRect
  PFontRec = record
    Name: TFontName;
    Size: Integer;
    Color: TColor;
    Style: TFontStyles;
  end;

  // PPoints
  PPoints = class
  private
    FCount: Integer;
    FPoints: PPointArr;
    function GetPoint(Index: Integer): TPoint;
    procedure SetPoint(Index: Integer; P: TPoint);
  public
    constructor Create;
    procedure Clear;
    procedure Add(P: TPoint);
    procedure Insert(Index: Integer; P: TPoint);
    procedure Remove(Index: Integer);
    procedure Draw(Canvas: PCanvas);
    procedure DrawDot(Canvas: PCanvas);
    procedure DrawBezier(Canvas: PCanvas);
    procedure Assign(Ps: PPoints);
    procedure ReduceLine;
    procedure ReduceOrthoLine;
//    procedure FitToGrid;
    procedure ConvObliqueToRectilinear;
    function InPoint(X, Y: Integer): Boolean;
    function InRect(X1, Y1, X2, Y2: Integer): Boolean;
    function GetEncloseRange: TRect;
    function Equal(Points: PPoints): Boolean;
    property PointData[Index: Integer]: TPoint read GetPoint write SetPoint; default;
    property Points: PPointArr read FPoints;
    property Count: Integer read FCount;
  end;

  // PCanvas
  PCanvas = class
  private
    FCanvas: TCanvas;
    FZoomFactor: PZoomFactor;
    FOriginX: Integer;
    FOriginY: Integer;
    FDeviceFactor: Real;
    FViewPort: TRect; // Represents clipping rectangle for Direct2D drawing
    FUseDirect2D: Boolean;
    function GetPen: TPen;
    function GetBrush: TBrush;
    function GetFont: TFont;
    procedure SetZoomFactor(Value: PZoomFactor);
  public
    constructor Create(ACanvas: TCanvas);
    destructor Destroy; override;
    procedure StretchDraw(R: TRect; G: TGraphic);
    procedure Draw(X, Y: Integer; G: TGraphic);
    procedure LineTo(X, Y: Integer);
    procedure MoveTo(X, Y: Integer);
    procedure LineDot(X1, Y1, X2, Y2: Integer);
    procedure Arc(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer);
    procedure Ellipse(X1, Y1, X2, Y2: Integer);
    procedure Pie(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer);
    procedure FloodFill(X, Y: Integer; const C: TColor; const FS: TFillStyle);
    procedure FillRect(R: TRect);
    procedure FrameRect(R: TRect);
    procedure Rectangle(X1, Y1, X2, Y2: Integer);
    procedure RoundRect(X1, Y1, X2, Y2, X3, Y3: Integer);
    procedure PolyBezier(Points: array of TPoint);
    procedure PolyBezierTo(Points: array of TPoint);
    procedure Polygon(Points: array of TPoint);
    procedure PolyLine(Points: array of TPoint);
    procedure TextOut(X, Y: Integer; const Text: string; IsVertical: Boolean = False); overload;
    procedure TextOut(R: TRect; const Text: string; IsVertical: Boolean = False; Args: PTextOutArguments = []); overload;
    function GetTextSize(Text: string; WordWrapWidth: Integer = -1): TSize;
    function TextExtent(const Text: string): TSize;
    function TextHeight(const Text: string): Integer;
    function TextWidth(const Text: string): Integer;
    procedure DrawAntialiasedLine(const AX1, AY1, AX2, AY2: real);
    procedure StartDrawing (AViewPort: TRect);

    // recommended functions not to use
    procedure TextRect(R: TRect; X, Y: Integer; const Text: string);
    procedure TextOutWithLen(X, Y, Len: Integer; const Text: string);
    procedure TextBound(X1, Y1, X2, Y2, Space: Integer; Text: string; Clipping: Boolean);// overload;
    property Pen: TPen read GetPen;
    property Brush: TBrush read GetBrush;
    property Font: TFont read GetFont;
    property ZoomFactor: PZoomFactor read FZoomFactor write SetZoomFactor;
    property DeviceFactor: Real read FDeviceFactor write FDeviceFactor;
    property Canvas: TCanvas read FCanvas write FCanvas;
    property OriginX: Integer read FOriginX write FOriginX;
    property OriginY: Integer read FOriginY write FOriginY;
    property UseDirect2D: Boolean read FUseDirect2D write FUseDirect2D;
  end;

  // procedures and  functions
  function ZoomFactor(const N, D: Integer): PZoomFactor;
  function GridFactor(const W, H: Integer): PGridFactor;

  procedure DrawRange(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
  procedure DrawRangeBox(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
  procedure DrawDottedLine(Canvas: PCanvas; X1, Y1, X2, Y2: Integer); overload;
  procedure DrawDottedLine(Canvas: PCanvas; Points: PPoints); overload;
  procedure DrawHighlighter(Canvas: PCanvas; X, Y, Size: Integer; Enabled: Boolean; Color: TColor);
  procedure DrawHighlighter2(Canvas: PCanvas; X1, Y1, X2, Y2, Width: Integer; CornerType: PCornerType; Enabled: Boolean; Color: TColor);
  procedure DrawSelectionLine(Canvas: PCanvas; X1, Y1, X2, Y2, Len: Integer; NWSE: PNWSEType; Retouch: Boolean = False);
  procedure DrawModelExcludedMark(Canvas: PCanvas; X, Y: Integer);

  procedure CoordTransform(const ZF: PZoomFactor; const GF: PGridFactor; var X, Y: Integer); overload;
  procedure CoordTransform(const ZF: PZoomFactor; const GF: PGridFactor; var P: TPoint); overload; inline;
  procedure CoordTransform(const ZF: PZoomFactor; const GF: PGridFactor; var R: TRect); overload; inline;
  procedure CoordRevTransform(const ZF: PZoomFactor; const GF: PGridFactor; var X, Y: Integer); overload;
  procedure CoordRevTransform(const ZF: PZoomFactor; const GF: PGridFactor; var P: TPoint); overload;
  procedure CoordRevTransform(const ZF: PZoomFactor; const GF: PGridFactor; var R: TRect); overload;

  procedure NormalizeRect(var AX1, AY1, AX2, AY2: Integer);
  function UnionRect(R1, R2: TRect): TRect;
  function Junction(R: TRect; P: TPoint): TPoint;
  function OrthoJunction(R: TRect; P: TPoint): TPoint;
  function GetCenter(R: TRect): TPoint;
  function RectInRect(BR, TR: TRect): Boolean;
  function EqualRect(R1, R2: TRect): Boolean;

  function EqualPt(P1, P2: TPoint): boolean; overload;
  function EqualPt(P1, P2: TPoint; D: Integer): boolean; overload;
  function PtInLine(line: TRect; p: TPoint): boolean;
  function PtsInLine(P1, P2, P3: TPoint): boolean;
  function PointInLine(P, P1, P2: TPoint): Boolean;
  function RectInLine(R: TRect; P1, P2: TPoint): Boolean;
  function IsEqualPoints(P1, P2: TPoint): Boolean;
  function MakeOrthoPt(P1, P2: TPoint): TPoint;
  function PointInRect(R: TRect; P: TPoint): Boolean;
  function GetPointAwayLine(TailPoint, HeadPoint: TPoint; Alpha, Distance : Extended): TPoint;
  procedure GetPolar(Line: TRect; P: TPoint; var Alpha, Distance: Extended);

  procedure TextOutWithAlign(Canvas: PCanvas; X1, X2, Y: Integer; S: string; Align: TAlignment);
  // not used.
  procedure AdjustDelta(BoundingBox: TRect; var DX, DY: Integer);

  procedure StorePenBrush(Canvas: PCanvas; var PenBrushRec: PPenBrushRec);
  procedure RestorePenBrush(Canvas: PCanvas; PenBrushRec: PPenBrushRec);
  procedure StoreFont(Canvas: PCanvas; var FontRec: PFontRec);
  procedure RestoreFont(Canvas: PCanvas; FontRec: PFontRec);

var
  NOGRID: PGridFactor;
  DEFAULT_ZOOM: PZoomFactor;

implementation

uses
  System.UITypes, ComCtrls, SysUtils, Vcl.Direct2D, Winapi.D2D1;

////////////////////////////////////////////////////////////////////////////////
// PPoints

constructor PPoints.Create;
begin
  inherited Create;
  FCount := 0;
end;

function PPoints.GetPoint(Index: Integer): TPoint;
begin
  if MAXPOINTS > Index then Result := FPoints[Index];
end;

procedure PPoints.SetPoint(Index: Integer; P: TPoint);
begin
  if MAXPOINTS > Index then FPoints[Index] := P;
end;

procedure PPoints.Clear;
begin
  FCount := 0;
end;

procedure PPoints.Add(P: TPoint);
begin
  Insert(FCount, P);
end;

procedure PPoints.Insert(Index: Integer; P: TPoint);
var
  I: Integer;
begin
  for I := FCount - 1 downto Index do FPoints[I + 1] := FPoints[I];
  FPoints[Index] := P;
  FCount := FCount + 1;
end;

procedure PPoints.Remove(Index: Integer);
var
  I: Integer;
begin
  for I := Index + 1 to FCount - 1 do FPoints[I - 1] := FPoints[I];
  FCount := FCount - 1;
end;

procedure PPoints.Draw(Canvas: PCanvas);
begin
  if Count > 1 then
    Canvas.PolyLine(Slice(FPoints, FCount))
end;

procedure PPoints.DrawDot(Canvas: PCanvas);
var
  I: Integer;
begin
  if Count > 1 then begin
    Canvas.Pen.Style := psSolid;
    for I := 0 to Count-2 do
      Canvas.LineDot( FPoints[I].X, FPoints[I].Y,
                      FPoints[I+1].X, FPoints[I+1].Y );
  end;
end;

procedure PPoints.DrawBezier(Canvas: PCanvas);
begin
  if Count > 1 then
    Canvas.PolyBezier(Slice(FPoints, FCount));
end;

procedure PPoints.Assign(Ps: PPoints);
var
  I: Integer;
begin
  if Ps <> nil then begin
    for I := 0 to Ps.Count - 1 do
      FPoints[I] := Ps.PointData[I];
    FCount := Ps.Count;
  end;
end;

procedure PPoints.ReduceLine;
var
  I: Integer;
  P1, P2, P3: TPoint;
begin
  I := 0;
  while I < FCount-2 do begin
    P1 := FPoints[I];
    P2 := FPoints[I+1];
    P3 := FPoints[I+2];
    if EqualPt(P1, P2) then
      Remove(I)
    else if PtsInLine(P1, P2, P3) then
      Remove(I+1)
    else
      Inc(I);
  end;
end;

procedure PPoints.ReduceOrthoLine;
var
  I: Integer;
  P1, P2, P3: TPoint;
begin
  I := 0;
  while I < FCount-2 do begin
    P1 := FPoints[I];
    P2 := FPoints[I+1];
    P3 := FPoints[I+2];
    if (P1.X = P2.X) and (P1.Y = P2.Y) then
      Remove(I)
    else if ((P1.X = P2.X) and (P2.X = P3.X)) or
            ((P1.Y = P2.Y) and (P2.Y = P3.Y)) then
      Remove(I+1)
    else
      Inc(I);
  end;
end;

{
procedure PPoints.FitToGrid;
var
  I: Integer;
begin
// for I := 0 to Count-1 do
// Modified because end of edge must be fit to BoundingBox of node
  for I := 1 to Count - 2 do
    FPoints[I] := Point(FPoints[I].X - FPoints[I].X mod 5,
                        FPoints[I].Y - FPoints[I].Y mod 5);
end;
}

procedure PPoints.ConvObliqueToRectilinear;
var
  I: Integer;
begin
  I := 0;
  while I < FCount-1 do begin
    Insert(I+1, MakeOrthoPt(FPoints[I], FPoints[I+1]));
    I := I + 2;
  end;
end;

function PPoints.InPoint(X, Y: Integer): Boolean;
var
  I: Integer;
  B: Boolean;
begin
  B := False;
  for I := 0 to FCount - 2 do
    if PointInLine(Point(X, Y), FPoints[I], FPoints[I + 1]) then B := True;
  Result := B;
end;

function PPoints.InRect(X1, Y1, X2, Y2: Integer): Boolean;
var
  I: Integer;
  B: Boolean;
begin
  B := False;
  for I := 0 to FCount - 2 do
    if RectInLine(Rect(X1, Y1, X2, Y2), FPoints[I], FPoints[I + 1]) then B := True;
  Result := B;
end;

function PPoints.GetEncloseRange: TRect;
var
  R: TRect;
  I: Integer;
begin
  R.TopLeft := FPoints[0];
  R.BottomRight := FPoints[1];
  NormalizeRect(R.Left, R.Top, R.Right, R.Bottom);
  for I := 2 to FCount - 1 do begin
    if FPoints[I].X < R.Left then R.Left := FPoints[I].X;
    if FPoints[I].X > R.Right then R.Right := FPoints[I].X;
    if FPoints[I].Y < R.Top then R.Top := FPoints[I].Y;
    if FPoints[I].Y > R.Bottom then R.Bottom := FPoints[I].Y;
  end;
  Result := R;
end;


function PPoints.Equal(Points: PPoints): Boolean;
var
  I: Integer;
begin
  if Count <> Points.Count then begin
    Result := False;
    Exit;
  end;

  for I := 0 to Count do
    if not IsEqualPoints(FPoints[I], Points.PointData[I]) then begin
      Result := False;
      Exit;
    end;

  Result := True;
end;

// PPoints
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PCanvas

function PCanvas.GetPen: TPen;
begin
  Result := FCanvas.Pen;
end;

function PCanvas.GetBrush: TBrush;
begin
  Result := FCanvas.Brush;
end;

function PCanvas.GetFont: TFont;
begin
  Result := FCanvas.Font;
end;

procedure PCanvas.SetZoomFactor(Value: PZoomFactor);
begin
  FZoomFactor := Value;
end;

constructor PCanvas.Create(ACanvas: TCanvas);
begin
  inherited Create;
  FZoomFactor := GraphicClasses.ZoomFactor(100, 100);
  FCanvas := ACanvas;
  OriginX := 0;
  OriginY := 0;
  DeviceFactor := 1.0;
end;

destructor PCanvas.Destroy;
begin
  inherited Destroy;
end;

procedure PCanvas.StretchDraw(R: TRect; G: TGraphic);
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), R);
  R.Left := R.Left + OriginX;
  R.Right := R.Right + OriginX;
  R.Top := R.Top + OriginY;
  R.Bottom := R.Bottom + OriginY;

  FCanvas.StretchDraw(R, G);
end;

procedure PCanvas.Draw(X, Y: Integer; G: TGraphic);
var
  W, H: Integer;
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), X, Y);

  W := G.Width;
  H := G.Height;
  CoordTransform(FZoomFactor, GridFactor(1, 1), W, H);

  X := X + OriginX;
  Y := Y + OriginY;

  FCanvas.StretchDraw(Rect(X, Y, X+W, Y+H), G);
end;

procedure PCanvas.LineTo(X, Y: Integer);
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), X, Y);
  X := X + OriginX;
  Y := Y + OriginY;
  FCanvas.LineTo(X, Y);
end;

procedure PCanvas.MoveTo(X, Y: Integer);
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), X, Y);
  X := X + OriginX;
  Y := Y + OriginY;
  FCanvas.MoveTo(X, Y);
end;

procedure PCanvas.LineDot(X1, Y1, X2, Y2: Integer);
var
  I: Integer;
  C, IX, IY, DX, DY: Extended;
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), X1, Y1);
  CoordTransform(FZoomFactor, GridFactor(1, 1), X2, Y2);

  X1 := X1 + OriginX;   Y1 := Y1 + OriginY;
  X2 := X2 + OriginX;   Y2 := Y2 + OriginY;

  if Abs(X1-X2) > Abs(Y1-Y2) then begin
    C := Abs(X1-X2) / 10.0;
    if C = 0 then c := 1;
    DX := Abs(X1-X2) / (C * 2.0);
    DY := Abs(Y1-Y2) / (C * 2.0);
  end
  else begin
    C := Abs(Y1-Y2) div 10;
    if C = 0 then c := 1;
    DX := Abs(X1-X2) / (C * 2.0);
    DY := Abs(Y1-Y2) / (C * 2.0);
  end;

  if X2-X1 > 0 then DX := DX else DX := -DX;
  if Y2-Y1 > 0 then DY := DY else DY := -DY;

  IX := X1; IY := Y1;

  for I := 0 to Round(C-1) do begin
    FCanvas.MoveTo(Trunc(IX), Trunc(IY));
    FCanvas.LineTo(Trunc(IX+DX), Trunc(IY+DY));

    if I = Round(C-1) then begin
      FCanvas.MoveTo(Trunc((IX+DX+X2) / 2.0), Trunc((IY+DY+Y2)/ 2.0));
      FCanvas.LineTo(Round(X2), Round(Y2));
    end;
    IX := IX + DX + DX;
    IY := IY + DY + DY;
  end;
end;

procedure PCanvas.Arc(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer);
var
  D2DCanvas: TDirect2DCanvas;
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), X1, Y1);
  CoordTransform(FZoomFactor, GridFactor(1, 1), X2, Y2);
  CoordTransform(FZoomFactor, GridFactor(1, 1), X3, Y3);
  CoordTransform(FZoomFactor, GridFactor(1, 1), X4, Y4);
  X1 := X1 + OriginX;
  Y1 := Y1 + OriginY;
  X2 := X2 + OriginX;
  Y2 := Y2 + OriginY;
  X3 := X3 + OriginX;
  Y3 := Y3 + OriginY;
  X4 := X4 + OriginX;
  Y4 := Y4 + OriginY;

  if UseDirect2D and (FCanvas.Pen.Style in [psSolid,psDash]) then begin
    D2DCanvas := TDirect2DCanvas.Create(Canvas, FViewPort);
    try
      D2DCanvas.RenderTarget.BeginDraw;
      D2DCanvas.Arc(X1, Y1, X2, Y2, X3, Y3, X4, Y4);
      D2DCanvas.RenderTarget.EndDraw;
    finally
      D2DCanvas.Free;
    end;
  end
  else
    FCanvas.Arc(X1, Y1, X2, Y2, X3, Y3, X4, Y4);


end;

procedure PCanvas.Ellipse(X1, Y1, X2, Y2: Integer);
var
  D2DCanvas: TDirect2DCanvas;
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), X1, Y1);
  CoordTransform(FZoomFactor, GridFactor(1, 1), X2, Y2);
  X1 := X1 + OriginX;
  Y1 := Y1 + OriginY;
  X2 := X2 + OriginX;
  Y2 := Y2 + OriginY;

  if UseDirect2D and (FCanvas.Pen.Style in [psSolid,psDash]) then begin
    D2DCanvas := TDirect2DCanvas.Create(Canvas, FViewPort);
    try
      D2DCanvas.RenderTarget.BeginDraw;
      D2DCanvas.Ellipse(X1, Y1, X2, Y2);
      D2DCanvas.RenderTarget.EndDraw;
    finally
      D2DCanvas.Free;
    end;
  end
  else
    FCanvas.Ellipse(X1, Y1, X2, Y2);
end;

procedure PCanvas.Pie(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer);
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), X1, Y1);
  CoordTransform(FZoomFactor, GridFactor(1, 1), X2, Y2);
  CoordTransform(FZoomFactor, GridFactor(1, 1), X3, Y3);
  CoordTransform(FZoomFactor, GridFactor(1, 1), X4, Y4);
  X1 := X1 + OriginX;
  Y1 := Y1 + OriginY;
  X2 := X2 + OriginX;
  Y2 := Y2 + OriginY;
  X3 := X3 + OriginX;
  Y3 := Y3 + OriginY;
  X4 := X4 + OriginX;
  Y4 := Y4 + OriginY;
  FCanvas.Pie(X1, Y1, X2, Y2, X3, Y3, X4, Y4);
end;

procedure PCanvas.FloodFill(X, Y: Integer; const C: TColor; const FS: TFillStyle);
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), X, Y);
  X := X + OriginX;
  Y := Y + OriginY;
  FCanvas.FloodFill(X, Y, C, FS);
end;

procedure PCanvas.FillRect(R: TRect);
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), R);
  R.Left := R.Left + OriginX;
  R.Right := R.Right + OriginX;
  R.Top := R.Top + OriginY;
  R.Bottom := R.Bottom + OriginY;
  FCanvas.FillRect(R);
end;

procedure PCanvas.FrameRect(R: TRect);
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), R);
  R.Left := R.Left + OriginX;
  R.Right := R.Right + OriginX;
  R.Top := R.Top + OriginY;
  R.Bottom := R.Bottom + OriginY;
  FCanvas.FillRect(R);
end;

procedure PCanvas.Rectangle(X1, Y1, X2, Y2: Integer);
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), X1, Y1);
  CoordTransform(FZoomFactor, GridFactor(1, 1), X2, Y2);
  X1 := X1 + OriginX;
  Y1 := Y1 + OriginY;
  X2 := X2 + OriginX;
  Y2 := Y2 + OriginY;
  FCanvas.Rectangle(X1, Y1, X2, Y2);
end;

procedure PCanvas.RoundRect(X1, Y1, X2, Y2, X3, Y3: Integer);
var
  D2DCanvas: TDirect2DCanvas;
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), X1, Y1);
  CoordTransform(FZoomFactor, GridFactor(1, 1), X2, Y2);
  CoordTransform(FZoomFactor, GridFactor(1, 1), X3, Y3);
  X1 := X1 + OriginX;
  Y1 := Y1 + OriginY;
  X2 := X2 + OriginX;
  Y2 := Y2 + OriginY;

  if UseDirect2D then begin
    D2DCanvas := TDirect2DCanvas.Create(Canvas, FViewPort);
    try
      D2DCanvas.RenderTarget.BeginDraw;
      D2DCanvas.RoundRect(X1, Y1, X2, Y2, X3, Y3);
      D2DCanvas.RenderTarget.EndDraw;
    finally
      D2DCanvas.Free;
    end;
  end
  else
    FCanvas.RoundRect(X1, Y1, X2, Y2, X3, Y3);
end;

procedure PCanvas.PolyBezier(Points: array of TPoint);
var
  I: Integer;
begin
  for I := 0 to High(Points) do begin
    CoordTransform(FZoomFactor, GridFactor(1, 1), Points[I]);
    Points[I].X := Points[I].X + OriginX;
    Points[I].Y := Points[I].Y + OriginY;
  end;
  FCanvas.PolyBezier(Points);
end;

procedure PCanvas.PolyBezierTo(Points: array of TPoint);
var I: Integer;
begin
  for I := 0 to High(Points) do begin
    CoordTransform(FZoomFactor, GridFactor(1, 1), Points[I]);
    Points[I].X := Points[I].X + OriginX;
    Points[I].Y := Points[I].Y + OriginY;
  end;
  FCanvas.PolyBezierTo(Points);
end;

procedure PCanvas.Polygon(Points: array of TPoint);
var
  I: Integer;
  D2DCanvas: TDirect2DCanvas;
begin
  for I := 0 to High(Points) do begin
    CoordTransform(FZoomFactor, GridFactor(1, 1), Points[I]);
    Points[I].X := Points[I].X + OriginX;
    Points[I].Y := Points[I].Y + OriginY;
  end;

  if UseDirect2D and (FCanvas.Pen.Style in [psSolid,psDash]) then begin
    D2DCanvas := TDirect2DCanvas.Create(Canvas, FViewPort);
    try
      D2DCanvas.RenderTarget.BeginDraw;
      D2DCanvas.Polygon(Points);
      D2DCanvas.RenderTarget.EndDraw;
    finally
      D2DCanvas.Free;
    end;
  end
  else
    FCanvas.Polygon(Points)
end;

procedure PCanvas.PolyLine(Points: array of TPoint);
var
  I: Integer;
  D2DCanvas: TDirect2DCanvas;
begin
  for I := 0 to High(Points) do begin
    CoordTransform(FZoomFactor, GridFactor(1, 1), Points[I]);
    Points[I].X := Points[I].X + OriginX;
    Points[I].Y := Points[I].Y + OriginY;
  end;

  if UseDirect2D and (FCanvas.Pen.Style = psSolid) then begin
    D2DCanvas := TDirect2DCanvas.Create(Canvas, FViewPort);
    try
      D2DCanvas.RenderTarget.BeginDraw;
      D2DCanvas.Polyline(Points);
      D2DCanvas.RenderTarget.EndDraw;
    finally
      D2DCanvas.Free;
    end;
  end
  else
    FCanvas.PolyLine(Points);
end;

function GetLOGFONT(AFont: TFont; Handle: HDC): LOGFONT;
var
  F: LOGFONT;
begin
  ZeroMemory(Addr(F), SizeOf(F));
  F.lfHeight := -MulDiv(AFont.Size, GetDeviceCaps(Handle, LOGPIXELSY), 72);
  F.lfCharSet := AFont.Charset;
  StrPCopy(F.lfFaceName, AFont.Name);
  if fsBold in AFont.Style then F.lfWeight := FW_BOLD else F.lfWeight := FW_NORMAL;
  if fsItalic in AFont.Style then F.lfItalic := 1 else F.lfItalic := 0;
  if fsUnderline in AFont.Style then F.lfUnderline := 1 else F.lfUnderline := 0;
  if fsStrikeOut in AFont.Style then F.lfStrikeOut := 1 else F.lfStrikeOut := 0;
  Result := F;
end;

procedure PCanvas.TextOut(X, Y: Integer; const Text: string; IsVertical: Boolean = False);
var
  OriginFont: TFont;
  LF: LogFont;
  F: HFONT;
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), X, Y);

  X := X + OriginX;
  Y := Y + OriginY;
  SetBkMode(FCanvas.Handle, TRANSPARENT);

  OriginFont := TFont.Create;
  OriginFont.Assign(FCanvas.Font);
  try
    FCanvas.Font.Size := Trunc(DeviceFactor * FCanvas.Font.Size * (FZoomFactor.Numer / FZoomFactor.Denom));
    if IsVertical then begin
      LF := GetLOGFONT(FCanvas.Font, FCanvas.Handle);
      LF.lfEscapement := 10 * 90;
      LF.lfOrientation := 10 * 90;
      F := CreateFontIndirect(LF);
      try
        Canvas.Font.Handle := F;
        if FCanvas.Font.Size > 0 then
          FCanvas.TextOut(X, Y, Text);
      finally
        DeleteObject(F);
      end;
    end
    else begin
      if FCanvas.Font.Size > 0 then
        FCanvas.TextOut(X, Y, Text);
    end;
  finally
    FCanvas.Font.Assign(OriginFont);
    OriginFont.Free;
  end;
end;

procedure PCanvas.TextOut(R: TRect; const Text: string; IsVertical: Boolean = False; Args: PTextOutArguments = []);
var
  Flag: Cardinal;
  TR: TRect;
begin
  TR := R;
  CoordTransform(FZoomFactor, GridFactor(1, 1), R);
  TR.Left := R.Left + OriginX;
  TR.Right := R.Right + OriginX;
  TR.Top := R.Top + OriginY;
  TR.Bottom := R.Bottom + OriginY;

  SetBkMode(FCanvas.Handle, TRANSPARENT);

  FCanvas.Font.Size := Trunc(DeviceFactor * FCanvas.Font.Size * (FZoomFactor.Numer / FZoomFactor.Denom));
  if IsVertical then begin
    TextOut(TR.Left, TR.Top, Text, True);
  end
  else begin
    Flag := 0;
    if taAlignLeft in Args then Flag := Flag + DT_LEFT;
    if taAlignCenter in Args then Flag := Flag + DT_CENTER;
    if taAlignRight in Args then Flag := Flag + DT_RIGHT;
    if taAlignTop in Args then Flag := Flag + DT_TOP;
    if taAlignMiddle in Args then Flag := Flag + DT_VCENTER;
    if taAlignBottom in Args then Flag := Flag + DT_BOTTOM;
    if taWordBreak in Args then Flag := Flag + DT_WORDBREAK;
    if FCanvas.Font.Size > 0 then
      Windows.DrawText(Canvas.Handle, PChar(Text), Length(Text), TR, Flag);
  end;
end;

function PCanvas.GetTextSize(Text: string; WordWrapWidth: Integer = -1): TSize;
var
  R: TRect;
  S: TSize;
  XCanvasLogical, YCanvasLogical: Integer;
  //XScreenLogical : Integer;
  Dpi : Integer;
  //ScreenWindow: HWND;
begin
  if WordWrapWidth = -1 then begin
    S.CX := TextWidth(Text);
    S.CY := TextHeight(Text);
  end
  else begin
    //ScreenWindow := MainForm.Handle;
    //XScreenLogical := Windows.GetDeviceCaps(ScreenWindow, LOGPIXELSX);
    XCanvasLogical := Windows.GetDeviceCaps(Canvas.Handle, LOGPIXELSX);
    YCanvasLogical := Windows.GetDeviceCaps(Canvas.Handle, LOGPIXELSY);
    R := Rect(0, 0, WordWrapWidth + 1, 1);
    Windows.DrawText(Canvas.Handle, PChar(Text), Length(Text), R, DT_CALCRECT + DT_WORDBREAK);
    Dpi := Screen.PixelsPerInch;
    S.CX := R.Right * Dpi div XCanvasLogical;
    S.CY := R.Bottom * Dpi div YCanvasLogical;
  end;
  Result := S;
end;

function PCanvas.TextExtent(const Text: string): TSize;
begin
  Result := FCanvas.TextExtent(Text);
end;

function PCanvas.TextHeight(const Text: string): Integer;
begin
  Result := Trunc(FCanvas.TextHeight(Text) * DeviceFactor);
end;

function PCanvas.TextWidth(const Text: string): Integer;
begin
  Result := Trunc(FCanvas.TextWidth(Text) * DeviceFactor);
end;

procedure PCanvas.StartDrawing(AViewPort: TRect);
begin
  FViewPort := AViewPort;

  // Adjust Vieport for Direct2D drawing
  if FViewPort.Left > 0 then begin
    FViewPort.Left := 0;
    FViewPort.Right := FViewPort.Right - FViewPort.Left;
  end;
  if FViewPort.Top > 0 then begin
    FViewPort.Top := 0;
    FViewPort.Bottom := FViewPort.Bottom - FViewPort.Top;
  end;
end;

// Follwing functions are recommended not to use
procedure PCanvas.TextRect(R: TRect; X, Y: Integer; const Text: string);
begin
  CoordTransform(FZoomFactor, GridFactor(1, 1), R);
  CoordTransform(FZoomFactor, GridFactor(1, 1), X, Y);

  R.Left := R.Left + OriginX;
  R.Right := R.Right + OriginX;
  R.Top := R.Top + OriginY;
  R.Bottom := R.Bottom + OriginY;

  X := X + OriginX;
  Y := Y + OriginY;

  FCanvas.TextRect(R, X, Y, Text);
end;

procedure PCanvas.TextOutWithLen(X, Y, Len: Integer; const Text: string);
var
  B: Boolean;
  Size: TSize;
  L, C: Integer;
begin
  Len := Trunc(Len * (FZoomFactor.Numer / FZoomFactor.Denom));

  if TextWidth(Text) <= Len then TextOut(X, Y, Text)
  else begin
    L := Length(Text);
    B := GetTextExtentExPoint(
         FCanvas.Handle, PChar(Text), L, Len - TextWidth('¡¦'), @C, nil, Size);
    if B then TextOut(X, Y, Copy(Text, 1, C) + '¡¦')
    else TextOut(X, Y, '.');
  end;
end;

procedure PCanvas.TextBound(X1, Y1, X2, Y2, Space: Integer; Text: string; Clipping: Boolean);// overload;
var
  B: Boolean;
  Size: TSize;
  L, C, Len: Integer;
begin
  Len := Trunc((X2-X1) * (FZoomFactor.Numer / FZoomFactor.Denom));
//  Y := Y1;

  if TextWidth(Text) <= Len then TextOut(X1, Y1, Text)
  else begin
    while Text <> '' do begin
      L := Length(Text);
      B := GetTextExtentExPoint(
           FCanvas.Handle, PChar(Text), L, Len, @C, nil, Size);
      if B then begin
        if Clipping then
          TextRect(Rect(X1, Y1, X2, Y2), X1, Y1, Copy(Text, 1, C))
        else
          Textout(X1, Y1, Copy(Text, 1, C));
        Text := Copy(Text, C+1, L-C);
      end
      else
        if Clipping then
          TextRect(Rect(X1, Y1, X2, Y2), X1, Y1, Text)
        else
          Textout(X1, Y1, Text);
      Y1 := Y1 + TextHeight(Text) + Space;
      if (Y1 >= Y2) and Clipping then break;
    end;
  end;
end;

procedure PCanvas.DrawAntialiasedLine(const AX1, AY1, AX2, AY2: real);

var
  swapped: boolean;

  procedure plot(const x, y, c: Extended);
  var
    resclr: TColor;
  begin
    if swapped then
      resclr := FCanvas.Pixels[round(y), round(x)]
    else
      resclr := FCanvas.Pixels[round(x), round(y)];

    resclr := RGB(round(GetRValue(resclr) * (1-c) + GetRValue(FCanvas.Pen.Color) * c),
                  round(GetGValue(resclr) * (1-c) + GetGValue(FCanvas.Pen.Color) * c),
                  round(GetBValue(resclr) * (1-c) + GetBValue(FCanvas.Pen.Color) * c));
    if swapped then
      FCanvas.Pixels[round(y), round(x)] := resclr
    else
      FCanvas.Pixels[round(x), round(y)] := resclr;
  end;

  function rfrac(const x: real): real; inline;
  begin
    rfrac := 1 - frac(x);
  end;

  procedure swap(var a, b: real);
  var
    tmp: real;
  begin
    tmp := a;
    a := b;
    b := tmp;
  end;

var
  x1, x2, y1, y2, dx, dy, gradient, xend, yend, xgap, xpxl1, ypxl1,
  xpxl2, ypxl2, intery: real;
  x: integer;

begin

//  x1 := AX1 + OriginX;
//  x2 := AX2 + OriginX;
//  y1 := AY1 + OriginY;
//  y2 := AY2 + OriginY;

  x1 := AX1;
  x2 := AX2;
  y1 := AY1;
  y2 := AY2;

  dx := x2 - x1;
  dy := y2 - y1;
  swapped := abs(dx) < abs(dy);
  if swapped then
  begin
    swap(x1, y1);
    swap(x2, y2);
    swap(dx, dy);
  end;
  if x2 < x1 then
  begin
    swap(x1, x2);
    swap(y1, y2);
  end;

  gradient := dy / dx;

  xend := round(x1);
  yend := y1 + gradient * (xend - x1);
  xgap := rfrac(x1 + 0.5);
  xpxl1 := xend;
  ypxl1 := floor(yend);
  plot(xpxl1, ypxl1, rfrac(yend) * xgap);
  plot(xpxl1, ypxl1 + 1, frac(yend) * xgap);
  intery := yend + gradient;

  xend := round(x2);
  yend := y2 + gradient * (xend - x2);
  xgap := frac(x2 + 0.5);
  xpxl2 := xend;
  ypxl2 := floor(yend);
  plot(xpxl2, ypxl2, rfrac(yend) * xgap);
  plot(xpxl2, ypxl2 + 1, frac(yend) * xgap);

  for x := round(xpxl1) + 1 to round(xpxl2) - 1 do
  begin
    plot(x, floor(intery), rfrac(intery));
    plot(x, floor(intery) + 1, frac(intery));
    intery := intery + gradient;
  end;

end;

// PCanvas
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Procedures and functions

function ZoomFactor(const N, D: Integer): PZoomFactor;
var
  ZF: PZoomFactor;
begin
  ZF.Numer := N; ZF.Denom := D;
  Result := ZF;
end;

function GridFactor(const W, H: Integer): PGridFactor;
var
  GF: PGridFactor;
begin
  GF.Width := W; GF.Height := H;
  Result := GF;
end;

procedure DrawRange(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
var
  PB: PPenBrushRec;
begin
  StorePenBrush(Canvas, PB);
  Canvas.Pen.Mode := pmNotXOR;
  Canvas.Pen.Style := psDot;
  Canvas.Pen.Width := 1;
  Canvas.Pen.Color := clBlack;
  Canvas.Brush.Color := clWhite;
  Canvas.Rectangle(X1, Y1, X2, Y2);
  RestorePenBrush(Canvas, PB);
end;

procedure DrawRangeBox(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
var
  PB: PPenBrushRec;
begin
  StorePenBrush(Canvas, PB);
  Canvas.Pen.Mode := pmNotXOR;
  Canvas.Pen.Style := psDash;
  Canvas.Pen.Width := 1;
  Canvas.Pen.Color := clBlack;
  Canvas.Brush.Color := clWhite;
  Canvas.Rectangle(X1 - 2, Y1 - 2, X2 + 3, Y2 + 3);
  RestorePenBrush(Canvas, PB);
end;

procedure DrawDottedLine(Canvas: PCanvas; X1, Y1, X2, Y2: Integer);
var
  PB: PPenBrushRec;
begin
  StorePenBrush(Canvas, PB);
  Canvas.Pen.Mode := pmNotXOR;
  Canvas.Pen.Style := psDot;
  Canvas.Pen.Width := 1;
//  Inverted color used because handling of dotted edge(ex. Dependency)
//  Canvas.Pen.Color := clBlack;
//  Canvas.Brush.Color := clWhite;
  Canvas.Pen.Color := clWhite;
  Canvas.Brush.Color := clBlack;
  Canvas.MoveTo(X1, Y1);
  Canvas.LineTo(X2, Y2);
  RestorePenBrush(Canvas, PB);
end;

procedure DrawDottedLine(Canvas: PCanvas; Points: PPoints);
var
  PB: PPenBrushRec;
begin
  StorePenBrush(Canvas, PB);
  Canvas.Pen.Mode := pmNotXOR;
  Canvas.Pen.Style := psDot;
  Canvas.Pen.Width := 1;
//  Inverted color used because handling of dotted edge(ex. Dependency)
//  Canvas.Pen.Color := clBlack;
//  Canvas.Brush.Color := clWhite;
  Canvas.Pen.Color := clWhite;
  Canvas.Brush.Color := clBlack;
  Points.Draw(Canvas);
  RestorePenBrush(Canvas, PB);
end;

procedure DrawHighlighter(Canvas: PCanvas; X, Y, Size: Integer; Enabled: Boolean; Color: TColor);
var
  PB: PPenBrushRec;
  OX, OY: Integer;
begin
  StorePenBrush(Canvas, PB);
  Canvas.Pen.Color := Color;
  Canvas.Brush.Color := Color;
  Canvas.Pen.Width := 1;

  // It needs to transform coordinates and use Canvas.Canvas.
  OX := Canvas.OriginX;
  OY := Canvas.OriginY;
  CoordTransform(Canvas.FZoomFactor, NOGRID, X, Y);

  Canvas.Canvas.Rectangle(X + OX - Size, Y + OY - Size, X + OX + Size, Y + OY + Size);

  RestorePenBrush(Canvas, PB);
end;

procedure DrawHighlighter2(Canvas: PCanvas; X1, Y1, X2, Y2, Width: Integer; CornerType: PCornerType; Enabled: Boolean; Color: TColor);
var
  PB: PPenBrushRec;
  P: TPoint;
  OX, OY: Integer;
  CX, CY, HalfW: Integer;
begin
  StorePenBrush(Canvas, PB);
  Canvas.Pen.Color := Color;
  Canvas.Pen.Style := psSolid;
  Canvas.Pen.Width := 1;

  OX := Canvas.OriginX;
  OY := Canvas.OriginY;
  CoordTransform(Canvas.FZoomFactor, NOGRID, X1, Y1);
  CoordTransform(Canvas.FZoomFactor, NOGRID, X2, Y2);

  P := Point(-100, -100);
  CX := (X1 + X2) div 2; CY := (Y1 + Y2) div 2;
  HalfW := Width div 2;
  case CornerType of
    ctLT: P := Point(X1 - Width, Y1 - Width);
    ctLM: P := Point(X1 - Width, CY - HalfW);
    ctLB: P := Point(X1 - Width, Y2);
    ctMT: P := Point(CX - HalfW, Y1 - Width);
    ctMB: P := Point(CX - HalfW, Y2);
    ctRT: P := Point(X2, Y1 - Width);
    ctRM: P := Point(X2, CY - HalfW);
    ctRB: P := Point(X2, Y2);
  end;
  if Enabled then
    Canvas.Brush.Color := clWhite
  else
    Canvas.Brush.Color := TColor($D0D0D0);
  Canvas.Canvas.Rectangle(P.X + OX, P.Y + OY, P.X  + OX + Width, P.Y + OY + Width);

  RestorePenBrush(Canvas, PB);
end;

procedure DrawSelectionLine(Canvas: PCanvas; X1, Y1, X2, Y2, Len: Integer; NWSE: PNWSEType; Retouch: Boolean = False);
var
  OX, OY: Integer;
  R: TRect;
  RX1, RY1, RX2, RY2: Integer;
  I, J: Integer;
begin
  OX := Canvas.OriginX;
  OY := Canvas.OriginY;
  RX1 := X1; RY1 := Y1; RX2 := X2; RY2 := Y2;
  CoordTransform(Canvas.FZoomFactor, NOGRID, RX1, RY1);
  CoordTransform(Canvas.FZoomFactor, NOGRID, RX2, RY2);

  if Retouch and ((RX1 + OX - Len) mod 2 = 1) then
    RX1 := RX1 + 1;
  if Retouch and ((RX2 + OX) mod 2 = 1) then
    RX2 := RX2 - 1;

  case NWSE of
    nwseN: R := Rect(RX1 + OX, RY1 + OY - Len, RX2 + OX, RY1 + OY);
    nwseW: R := Rect(RX1 + OX - Len, RY1 + OY - Len, RX1 + OX, RY2 + OY + Len);
    nwseS: R := Rect(RX1 + OX, RY2 + OY, RX2 + OX, RY2 + OY + Len);
    nwseE: R := Rect(RX2 + OX, RY1 + OY - Len, RX2 + OX + Len, RY2 + OY + Len);
  end;

  if Retouch then begin
    for I := R.Left to R.Right do
      for J := R.Top to R.Bottom do
        if ((I mod 4 = 0) and (J mod 2 = 0))
          or ((I mod 4 = 2) and (J mod 2 = 1)) then
          Canvas.Canvas.Pixels[I, J] := clDkGray;
  end
  else begin
    for I := R.Left to R.Right do
      for J := R.Top to R.Bottom do
        if (((I - R.Left) mod 4 = 0) and ((J - R.Top) mod 2 = 0))
          or (((I - R.Left) mod 4 = 2) and ((J - R.Top) mod 2 = 1)) then
          Canvas.Canvas.Pixels[I, J] := clDkGray;
  end;
end;

procedure DrawModelExcludedMark(Canvas: PCanvas; X, Y: Integer);
var
  W, H, M: Integer;
  F: Integer;
  PB: PPenBrushRec;
  TF: TFont;
begin
  TF := TFont.Create;
  TF.Assign(Canvas.Font);
  StorePenBrush(Canvas, PB);
  Canvas.Pen.Color := clBlack; Canvas.Pen.Width := 1; Canvas.Pen.Style := psSolid;
  Canvas.Brush.Color := clWhite; Canvas.Brush.Style := bsSolid;
  Canvas.Font.Name := ''; Canvas.Font.Size := 10; Canvas.Font.Style := [];
  W := Canvas.TextWidth('M');
  H := Canvas.TextHeight('M');
  M := Max(W, H);
  F := Round(M * Sqrt(2) / 2);
  Canvas.Ellipse(X - F, Y - F, X + F, Y + F);
  Canvas.TextOut(X - W div 2, Y - H div 2, 'M');
  RestorePenBrush(Canvas, PB);
  Canvas.Font.Assign(TF);
  TF.Free;
end;

procedure CoordTransform(const ZF: PZoomFactor; const GF: PGridFactor; var X, Y: Integer); overload;
var
 f: Double;
begin
  // fit to grid.
  X := X - (X mod GF.Width);
  Y := Y - (Y mod GF.Height);
  // zoom
  f := ZF.Numer / ZF.Denom;
  X := Round(f * X);
  Y := Round(f * Y);
end;

procedure CoordTransform(const ZF: PZoomFactor; const GF: PGridFactor; var P: TPoint); overload; inline;
begin
  CoordTransform(ZF, GF, P.X, P.Y);
end;

procedure CoordTransform(const ZF: PZoomFactor; const GF: PGridFactor; var R: TRect); overload; inline;
begin
  CoordTransform(ZF, GF, R.TopLeft);
  CoordTransform(ZF, GF, R.BottomRight);
end;

procedure CoordRevTransform(const ZF: PZoomFactor; const GF: PGridFactor; var X, Y: Integer); overload;
var
  F: Real;
begin
  // zoom
  F := ZF.Numer / ZF.Denom;
  X := Round(X / F);
  Y := Round(Y / F);
  // fit to grid
  X := X - X mod GF.Width;
  Y := Y - Y mod GF.Height;
end;

procedure CoordRevTransform(const ZF: PZoomFactor; const GF: PGridFactor; var P: TPoint); overload;
begin
  CoordRevTransform(ZF, GF, P.X, P.Y);
end;

procedure CoordRevTransform(const ZF: PZoomFactor; const GF: PGridFactor; var R: TRect); overload;
begin
  CoordRevTransform(ZF, GF, R.TopLeft);
  CoordRevTransform(ZF, GF, R.BottomRight);
end;

function LineToRect(P1, P2: TPoint): TRect;
var
  R: TRect;
begin
  if P1.X = P2.X then begin // <<< Vert Line.
    R.Left := P1.X - 1; R.Right := P1.X + 1;
    if P1.Y < P2.Y then begin R.Top := P1.Y; R.Bottom := P2.Y; end
    else begin R.Top := P2.Y; R.Bottom := P1.Y; end;
  end
  else begin // <<< Horz Line.
    R.Top := P1.Y - 1; R.Bottom := P1.Y + 1;
    if P1.X < P2.X then begin R.Left := P1.X; R.Right := P2.X; end
    else begin R.Left := P2.X; R.Right := P1.X; end;
  end;
  Result := R;
end;

procedure NormalizeRect(var AX1, AY1, AX2, AY2: Integer);
var
  X1, Y1, X2, Y2: Integer;
begin
  if AX1 > AX2 then begin X1 := AX2; X2 := AX1; end else begin X1 := AX1; X2 := AX2; end;
  if AY2 < AY1 then begin Y1 := AY2; Y2 := AY1; end else begin Y1 := AY1; Y2 := AY2; end;
  AX1 := X1; AX2 := X2; AY1 := Y1; AY2 := Y2;
end;

function UnionRect(R1, R2: TRect): TRect;
var
  R: TRect;
begin
  R := R1;
  if R2.Left < R.Left then R.Left := R2.Left;
  if R2.Top < R.Top then R.Top := R2.Top;
  if R2.Right > R.Right then R.Right := R2.Right;
  if R2.Bottom > R.Bottom then R.Bottom := R2.Bottom;
  Result := R;
end;

function Junction(R: TRect; P: TPoint): TPoint;
var
  C: TPoint;
  PS: Array[1..4] of TPoint;
  Lean: Real;
  I: Integer;
begin
  C.X := (R.Left + R.Right) div 2;
  C.Y := (R.Top + R.Bottom) div 2;

  // Inserted instead of follwoing
  if (C.X = P.X) or (C.Y = P.Y) then begin
    Result := OrthoJunction(R, P);
    Exit;
  end;
{
  if C.X = P.X then inc(C.X);
  if C.Y = P.Y then inc(C.Y);
}

  Lean := (P.Y - C.Y) / (P.X - C.X);

  // P1
  PS[1].Y := Round(lean * (R.Left - C.X) + C.Y);
  PS[1].X := R.Left;

  // P2
  PS[2].Y := Round(lean * (R.Right - C.X) + C.Y);
  PS[2].X := R.Right;

  // P3
  PS[3].X := Round((R.Top - C.Y) / lean + C.X);
  PS[3].Y := R.Top;

  // P4
  PS[4].X := Round((R.Bottom - C.Y) / lean + C.X);
  PS[4].Y := R.Bottom;

  NormalizeRect(C.X, C.Y, P.X, P.Y);
  I := 0;
  repeat
    inc(I);
  until (
          (I > 4) or
          ((R.Left <= PS[i].X) and (PS[i].X <= R.Right) and
          (R.Top <= PS[i].Y) and (PS[i].Y <= R.Bottom) and
          (C.X <= PS[i].X) and (PS[i].X <= P.X) and
          (C.Y <= PS[i].Y) and (PS[i].Y <= P.Y))
        );

  if I > 4 then
    Result := Point((R.Left + R.Right) div 2, (R.Top + R.Bottom) div 2)
  else
    Result := PS[i];
end;

// Inserted instead of following
{
function OrthoJunction(R: TRect; P: TPoint): TPoint;
begin
  Result := Point(-100, -100);
  if (R.Left = P.X) or (R.Right = P.X) then begin
    if (R.Top <= P.Y) and (P.Y <= R.Bottom) then
      Result := P;
  end
  else if (R.Top = P.Y) or (R.Bottom = P.Y) then begin
    if (R.Left <= P.X) and (P.X <= R.Right) then
      Result := P;
  end
  else if (R.Left = R.Right) then
    Result := Point(R.Left, P.Y)
  else if (R.Top = R.Bottom) then
    Result := Point(P.X, R.Top)
  else if (R.Left < P.X) and (P.X < R.Right) then
    if R.Top >= P.Y then
      Result := Point(P.X, R.Top)
    else
      Result := Point(P.X, R.Bottom)
  else if (R.Top < P.Y) and (P.Y < R.Bottom) then
    if R.Left >= P.X then
      Result := Point(R.Left, P.Y)
    else
      Result := Point(R.Right, P.Y);
end;
}
function OrthoJunction(R: TRect; P: TPoint): TPoint;
begin
  if (R.Left < P.X) and (P.X < R.Right) then
    if R.Top >= P.Y then
      Result := Point(P.X, R.Top)
    else
      Result := Point(P.X, R.Bottom)
  else if (R.Top < P.Y) and (P.Y < R.Bottom) then
    if R.Left >= P.X then
      Result := Point(R.Left, P.Y)
    else
      Result := Point(R.Right, P.Y)
  else if (R.Left = P.X) or (R.Right = P.X) then
    if R.Top >= P.Y then
      Result := Point(P.X, R.Top)
    else
      Result := Point(P.X, R.Bottom)
  else if (R.Top = P.Y) or (R.Bottom = P.y) then
    if R.Left >= P.X then
      Result := Point(R.Left, P.Y)
    else
      Result := Point(R.Right, P.Y)
  else
    Result := Point(-100, -100);
end;


function PtInLine(line: TRect; p: TPoint): boolean;
var
  left, right, top, bottom,
  a, b, r, c, s,
  ox, oy, tx, ty,
  x1, x2, y1, y2: Double;
begin
  Result := false;

  left := Min(line.Left, line.Right) - 5;
  right := Max(line.Left, line.Right) + 5;
  top := Min(line.Top, line.Bottom) - 5;
  bottom := Max(line.Top, line.Bottom) + 5;

  if ((left <= p.X) and (right >= p.X) and (top <= p.Y) and (bottom >= p.Y)) then
  begin
	a := line.Right - line.Left;
	b := line.Bottom - line.Top;
	r := Sqrt(a * a + b * b + 0.000001);

	c := b / r;
	s := a / r;

	ox := p.X - line.Left;
	oy := p.Y - line.Top;

	tx := c * ox - s * oy;
	ty := s * ox + c * oy;

	x1 := -5;
	x2 := 5;
	y1 := -5;
	y2 := r + 5;

	if ((x1 <= tx) and (x2 >= tx) and (y1 <= ty) and (y2 >= ty)) then
      Result := true
    else
      Result := false;
  end;
end;

function EqualRect(R1, R2: TRect): Boolean;
begin
  if (R1.Left = R2.Left) and (R1.Right = R2.Right) and
     (R1.Top = R2.Top) and (R1.Bottom = R2.Bottom) then
   Result := True
  else
    Result := False;
end;

function EqualPt(P1, P2: TPoint): boolean; overload;
begin
  Result := EqualPt(P1, P2, 5);
end;

function EqualPt(P1, P2: TPoint; D: Integer): boolean; overload;
begin
  Result := PtInRect(Rect(P1.X-D, P1.Y-D, P1.X+D, P1.Y+D), P2);
end;

function PtsInLine(P1, P2, P3: TPoint): boolean;
begin
  if PtInLine(Rect(P1.X, P1.Y, P3.X, P3.Y), P2) or
    PtInLine(Rect(P1.X, P1.Y, P2.X, P2.Y), P3) or
    PtInLine(Rect(P2.X, P2.Y, P3.X, P3.Y), P1) then
    Result := True
  else
    Result := False;
end;

function GetCenter(R: TRect): TPoint;
begin
  Result := Point((R.Left + R.Right) div 2, (R.Top + R.Bottom) div 2);
end;

function PointInLine(P, P1, P2: TPoint): Boolean;
begin
  Result := PtInRect(LineToRect(P1, P2), P);
end;

function RectInLine(R: TRect; P1, P2: TPoint): Boolean;
var
  Rgn: HRgn;
  R1: TRect;
begin
  R1 := LineToRect(P1, P2);
  Rgn := CreateRectRgn(R1.Left, R1.Top, R1.Right, R1.Bottom);
  Result := Windows.RectInRegion(Rgn, R);
  DeleteObject(Rgn);
end;

function IsEqualPoints(P1, P2: TPoint): Boolean;
begin
  Result := (P1.X = P2.X) and (P1.Y = P2.Y);
end;

function MakeOrthoPt(P1, P2: TPoint): TPoint;
begin
  Result := Point(P1.X, Max(P1.Y, P2.Y));
  if Result.Y = P1.Y then
    Result.X := P2.X;
end;

procedure TextOutWithAlign(Canvas: PCanvas; X1, X2, Y: Integer; S: string; Align: TAlignment);
var
  X: Integer;
begin
  X := X1;
  case Align of
    taLeftJustify: X := X1;
    taRightJustify: X := X2 - Canvas.TextWidth(S) - 1 - 2;
    taCenter: X := ((X1 + X2) - Canvas.TextWidth(S)) div 2;
  end;
  Canvas.TextOut(X, Y, S);
end;

function GetPointAwayLine(TailPoint, HeadPoint: TPoint; Alpha, Distance : Extended): TPoint;
var
 A, B, th, X, Y : Extended;
begin
  A := TailPoint.X - HeadPoint.X;
  B := TailPoint.Y - HeadPoint.Y;
  th := ArcTan(Abs(B)/(Abs(A) + 0.000001));
  //th := th - pi;
  if (A > 0) then
    if (B > 0) then
      th := pi - th
    else
      th := th + pi
  else
    if (B < 0) then
        th := 2 * pi - th;

  X := Distance * Cos(th + Alpha);
  Y := Distance * Sin(th + Alpha);

  Result := Point(Trunc(X),Trunc(-Y));
end;

procedure GetPolar(Line: TRect; P: TPoint; var Alpha, Distance: Extended);
var
  a, b, th1, th2: Double;
  P1, P2: TPoint;
begin
  P1 := Point(Line.Left, Line.Top);
  P2 := Point(Line.Right, Line.Bottom);

  a := P2.Y - P1.Y;
  b := (P2.X - P1.X + 0.00001);
  th1 := ArcTan(a / b);
  if ((a < 0) and (b < 0)) or ((a > 0) and (b < 0)) or ((a = 0) and (b < 0)) then
    th1 := th1 + 3.141592;

  a := P.Y - P1.Y;
  b := (P.X - P1.X + 0.00001);
  th2 := ArcTan(a / b);
  if ((a < 0) and (b < 0)) or ((a > 0) and (b < 0)) or ((a = 0) and (b < 0)) then
    th2 := th2 + 3.141592;

  Alpha := th1 - th2;
  Distance := sqrt(sqr(P1.X - P.X) + sqr(P1.Y - P.Y));
end;

function PointInRect(R: TRect; P: TPoint): Boolean;
begin
  if (R.Left <= P.X) and (P.X <= R.Right) and
     (R.Top <= P.Y) and (P.Y <= R.Bottom) then
   Result := true
  else
   Result := false;
end;

function RectInRect(BR, TR: TRect): Boolean;
var
  R: Boolean;
begin
  if (BR.Left <= TR.Left) and (BR.Right >= TR.Right) and
     (BR.Top <= TR.Top) and (BR.Bottom >= TR.Bottom) then
    R := true
  else
    R := false;
  Result := R;
end;

procedure AdjustDelta(BoundingBox: TRect; var DX, DY: Integer);
begin
{
  // not used.

  if (BoundingBox.Left + DX) < CanvasLeftMost then DX := -BoundingBox.Left;

  if (BoundingBox.Right + DX) > CanvasRightMost then DX := CanvasRightMost - BoundingBox.Right;

  if (BoundingBox.Top + DY) < CanvasTopMost then DY := -BoundingBox.Top;

  if (BoundingBox.Bottom + DY) > CanvasBottomMost then DY := CanvasBottomMost - BoundingBox.Bottom;
}
end;

procedure StorePenBrush(Canvas: PCanvas; var PenBrushRec: PPenBrushRec);
begin
  with PenBrushRec do begin
    PenWidth := Canvas.Pen.Width;
    PenColor := Canvas.Pen.Color;
    PenMode := Canvas.Pen.Mode;
    PenStyle := Canvas.Pen.Style;
    BrushColor := Canvas.Brush.Color;
    BrushStyle := Canvas.Brush.Style;
  end;
end;

procedure RestorePenBrush(Canvas: PCanvas; PenBrushRec: PPenBrushRec);
begin
  with PenBrushRec do begin
    Canvas.Pen.Width := PenWidth;
    Canvas.Pen.Color := PenColor;
    Canvas.Pen.Mode := PenMode;
    Canvas.Pen.Style := PenStyle;
    Canvas.Brush.Color := BrushColor;
    Canvas.Brush.Style := BrushStyle;
  end;
end;

procedure StoreFont(Canvas: PCanvas; var FontRec: PFontRec);
begin
  with FontRec do begin
    Name := Canvas.Font.Name;
    Size := Canvas.Font.Size;
    Color := Canvas.Font.Color;
    Style := Canvas.Font.Style;
  end;
end;

procedure RestoreFont(Canvas: PCanvas; FontRec: PFontRec);
begin
  with FontRec do begin
    Canvas.Font.Name := Name;
    Canvas.Font.Size := Size;
    Canvas.Font.Color := Color;
    Canvas.Font.Style := Style;
  end;
end;

// Procedures and funtions
////////////////////////////////////////////////////////////////////////////////

initialization
  NOGRID := GridFactor(1, 1);
  DEFAULT_ZOOM := ZoomFactor(100, 100);
end.

