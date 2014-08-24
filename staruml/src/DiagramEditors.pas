unit DiagramEditors;

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

// =============================================================================
//
// GUI component development notice
// --------------------------------
//
//   (1) GUI component inherits from TCustomPanel.
//   (2) OnEnter, OnExit Event visibility is public.
//   (3) catch OnEnter, OnExit events of all controls in GUI component
//       forward to self's OnEnter, OnExit
//   (4) set BevelInner, BevelOuter to 'bvNone'
//
// =============================================================================

interface

uses
  Core, GraphicClasses,
  Classes, Controls, StdCtrls, ExtCtrls, Forms, Buttons, Graphics, Types,
  dxBar, FlatPanel;

const
  DEFAULT_SCROLL_TIME_INTERVAL = 50; // milisec
  DEFAULT_WHEEL_DIVIDER = 5;

type
  // forawrd declare
  PScrollTimer = class;
  PDiagramEditor = class;

  // Event type
  PDiagramViewDragOverEvent = procedure (Sender, Source: TObject; var Accept: Boolean; var Msg: string) of object;
  PDiagramViewDragDropEvent = procedure (X, Y: Integer) of object;

  // PHandlingPaintProc
  PHandlingPaintProc = procedure(ADiagramEditor: PDiagramEditor; Canvas: PCanvas) of object;

  // PDiagramEditor component
  PDiagramEditor = class(TCustomPanel)
  private
    FDiagramView: PDiagramView;
    FCanvas: PCanvas;
    FScrollBox: TScrollBox;
    FPaintBox: TPaintBox;
    FMapButton: TFlatPanel;
    FMapButtonImage: TImage;
    FMapButtonShadow: TPanel;
    FPopupMenu: TdxBarPopupMenu;
    FGridFactor: PGridFactor;
    FZoomFactor: PZoomFactor;
    FScrollTimer: PScrollTimer;
    FHandlingPaintProc: PHandlingPaintProc;
    FScrolled: Boolean;
    FCanvasMoveHandled: Boolean;
    CMX, CMY: Integer;
    FDiagramWidth: Integer;
    FDiagramHeight: Integer;
    FShowGrid: Boolean;
    FOnMouseUp: TMouseEvent;
    FOnMouseMove: TMouseMoveEvent;
    FOnMouseDown: TMouseEvent;
    FOnDragOver: PDiagramViewDragOverEvent;
    FOnDragDrop: PDiagramViewDragDropEvent;
    procedure SetMapButtonImage(Value: TImage);
    procedure SetDiagramWidth(Value: Integer);
    procedure SetDiagramHeight(Value: Integer);
    procedure InitializeDiagramEditorEnv;
    procedure FinalizeDiagramEditorEnv;
    procedure DrawByDoubleBuffering(R: TRect);
    function GetDiagramImageIndex: Integer;
    procedure SetGridFactor(Value: PGridFactor);
    procedure SetZoomFactor(Value: PZoomFactor);
    function GetZoomPercent: Integer;
    procedure SetZoomPercent(Value: Integer);
    function GetViewPort: TRect;
    procedure SetShowGrid(Value: Boolean);
    procedure Clear(Canvas: PCanvas; R: TRect);
    procedure DrawGrid(Canvas: PCanvas; Area: TRect);
    procedure SetMapButtonLocation;
    procedure ResizeHandler(Sender: TObject);
    procedure MapButtonImageMouseDownHandler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SetCanvasMoveHandled(Value: Boolean);
    procedure PaintBoxPaintHandler(Sender: TObject);
    procedure PaintBoxDragOverHandler(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure PaintBoxDragDropHandler(Sender, Source: TObject; X, Y: Integer);
    procedure PaintBoxMouseDownHandler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseMoveHandler(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseUpHandler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ScrollTimerMouseMoveHandler(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  public
    constructor Create(AOwner: TComponent; ADiagramView: PDiagramView); reintroduce;
    destructor Destroy; override;
    procedure UpdateDiagramView;
    procedure RedrawDiagramView;
    procedure ScrollBy(DX, DY: Integer);
    procedure FocusOnView(View: PView; CenterOfViewPort: Boolean = False); overload;
    procedure FocusOnView(View: PView; BasePoint: TPoint); overload;
    property DiagramWidth: Integer read FDiagramWidth write SetDiagramWidth;
    property DiagramHeight: Integer read FDiagramHeight write SetDiagramHeight;
    property Canvas: PCanvas read FCanvas;
    property DiagramView: PDiagramView read FDiagramView;
    property DiagramImageIndex: Integer read GetDiagramImageIndex;
    property PopupMenu: TdxBarPopupMenu write FPopupMenu;
    property MapButtonImage: TImage write SetMapButtonImage;
    property ScrollBox: TScrollBox read FScrollBox;
    property PaintBox: TPaintBox read FPaintBox;
    property GridFactor: PGridFactor read FGridFactor write SetGridFactor;
    property ShowGrid: Boolean read FShowGrid write SetShowGrid;
    property ZoomFactor: PZoomFactor read FZoomFactor write SetZoomFactor;
    property ZoomPercent: Integer read GetZoomPercent write SetZoomPercent;
    property ViewPort: TRect read GetViewPort;
    property Scrolled: Boolean read FScrolled;
    property HandingPaintProc: PHandlingPaintProc read FHandlingPaintProc write FHandlingPaintProc;
    property OnMouseUp: TMouseEvent write FOnMouseUp;
    property OnMouseMove: TMouseMoveEvent write FOnMouseMove;
    property OnMouseDown: TMouseEvent write FOnMouseDown;
    property OnDragOver: PDiagramViewDragOverEvent write FOnDragOver;
    property OnDragDrop: PDiagramViewDragDropEvent write FOnDragDrop;
  end;

  // PScrollTimer
  PScrollTimer = class
  private
    Timer: TTimer;
    FOwner: PDiagramEditor;
    FX, FY: Integer;
    FactorX, FactorY: Integer;
    ShiftState: TShiftState;
    FOnMouseMove: TMouseMoveEvent;
    function GetInterval: Cardinal;
    procedure SetInterval(Value: Cardinal);
    procedure HandleTimer(Sender: TObject);
  public
    constructor Create(Owner: PDiagramEditor);
    destructor Destroy; override;
    procedure ResetTimer;
    procedure HandleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    property Interval: Cardinal read GetInterval write SetInterval;
    property OnMouseMove: TMouseMoveEvent read FOnMouseMove write FOnMouseMove;
  end;

implementation

uses
  UMLModels, UMLAux, OptionDeps, DiagramMapFrm, LogMgr,
  Windows, SysUtils, ComCtrls, Math, Messages;

var
  DoubleBufferingBitmap: Graphics.TBitmap;
  DoubleBufferingCanvas: PCanvas;

////////////////////////////////////////////////////////////////////////////////
// DiagramPanel component

constructor PDiagramEditor.Create(AOwner: TComponent; ADiagramView: PDiagramView);
begin
  // PRECONDITION
  Assert(ADiagramView <> nil);
  // PRECONDITION
  inherited Create(AOwner);
  InitializeDiagramEditorEnv;
  FDiagramView := ADiagramView;
  FDiagramView.Canvas := FCanvas;
end;

destructor PDiagramEditor.Destroy;
begin
  FinalizeDiagramEditorEnv;
  inherited;
end;

procedure PDiagramEditor.InitializeDiagramEditorEnv;
begin
  // DiagramEditor's properties
  FGridFactor := GraphicClasses.GridFactor(OptionDepository.GridWidth, OptionDepository.GridHeight);
  FZoomFactor := GraphicClasses.ZoomFactor(100, 100);
  FShowGrid := OptionDepository.ShowGrid;
  // DiagramEditor's UI properties
  Align := alClient;
  BevelInner := bvNone;
  BevelOuter := bvNone;
  // Create Objects
  FScrollBox := TScrollBox.Create(Self);
  FPaintBox := TPaintBox.Create(Self);
  FMapButtonShadow := TPanel.Create(Self);
  FMapButton := TFlatPanel.Create(Self);
  FMapButtonImage := TImage.Create(Self);
  FCanvas := PCanvas.Create(FPaintBox.Canvas);
  // Panel's properties
  OnResize := ResizeHandler;
  // ScrollBox's propeties
  FScrollBox.Parent := Self;
  FScrollBox.Align := alClient;
  FScrollBox.Color := clWhite;
  FScrollBox.HorzScrollBar.Tracking := True;
  FScrollBox.VertScrollBar.Tracking := True;
  // PaintBox's propeties
  FPaintBox.Parent := FScrollBox;
  FPaintBox.Top := 0;
  FPaintBox.Left := 0;
  FPaintBox.OnPaint := PaintBoxPaintHandler;
  FPaintBox.OnDragOver := PaintBoxDragOverHandler;
  FPaintBox.OnDragDrop := PaintBoxDragDropHandler;
  FPaintBox.OnMouseDown := PaintBoxMouseDownHandler;
  FPaintBox.OnMouseMove := PaintBoxMouseMoveHandler;
  FPaintBox.OnMouseUp := PaintBoxMouseUpHandler;
  // Set Width, Height
  DiagramWidth := OptionDepository.DefaultDiagramWidth;
  DiagramHeight := OptionDepository.DefaultDiagramHeight;
  // MapButton's properties
  FMapButtonShadow.Parent := Self;
  FMapButtonShadow.Width := 15;
  FMapButtonShadow.Height := 15;
  FMapButtonShadow.BevelInner := bvNone;
  FMapButtonShadow.BevelOuter := bvNone;
  FMapButtonShadow.Color := clGray;
  FMapButtonShadow.Visible := False;
  FMapButton.Parent := Self;
  FMapButton.Width := 15;
  FMapButton.Height := 15;
  FMapButton.Color := clWhite;
  FMapButtonImage.Parent := FMapButton;
  FMapButtonImage.Align := alClient;
  FMapButtonImage.Center := True;
  FMapButtonImage.Transparent := True;
  FMapButtonImage.OnMouseDown := MapButtonImageMouseDownHandler;
  // Canvas's properties
  FCanvas.ZoomFactor := FZoomFactor;
  // PScrollTimer's properties
  FScrollTimer := PScrollTimer.Create(Self);
  FScrollTimer.OnMouseMove := ScrollTimerMouseMoveHandler;
end;

procedure PDiagramEditor.FinalizeDiagramEditorEnv;
begin
  if FCanvas <> nil then FCanvas.Free;
  if FPaintBox <> nil then FPaintBox.Free;
  if FScrollBox <> nil then FScrollBox.Free;
  if FScrollTimer <> nil then FScrollTimer.Free;
end;

procedure PDiagramEditor.SetMapButtonImage(Value: TImage);
begin
  FMapButtonImage.Picture.Assign(Value.Picture);
end;

procedure PDiagramEditor.SetDiagramWidth(Value: Integer);
begin
  if Value <> FDiagramWidth then begin
    FDiagramWidth := Value;
    FPaintBox.Width := (Value * ZoomPercent div 100);
  end;
end;

procedure PDiagramEditor.SetDiagramHeight(Value: Integer);
begin
  if Value <> FDiagramHeight then begin
    FDiagramHeight := Value;
    FPaintBox.Height := (Value * ZoomPercent div 100);
  end;
end;

procedure PDiagramEditor.DrawByDoubleBuffering(R: TRect);
var
  W, H: Integer;
begin
  DoubleBufferingCanvas.OriginX := -R.Left;
  DoubleBufferingCanvas.OriginY := -R.Top;
  W := R.Right - R.Left;
  H := R.Bottom - R.Top;

  if (W > DoubleBufferingBitmap.Width) or (H > DoubleBufferingBitmap.Height) then begin
    DoubleBufferingBitmap.Width := Max(DoubleBufferingBitmap.Width, W);
    DoubleBufferingBitmap.Height := Max(DoubleBufferingBitmap.Height, H);
  end;

  Clear(DoubleBufferingCanvas, Rect(0, 0, W, H));
  DoubleBufferingCanvas.ZoomFactor := FDiagramView.Canvas.ZoomFactor;
  DrawGrid(DoubleBufferingCanvas, R);
  FDiagramView.DrawDiagram(DoubleBufferingCanvas);

  FDiagramView.Canvas.Canvas.CopyRect(R, DoubleBufferingCanvas.Canvas, Rect(0, 0, W, H));
end;

function PDiagramEditor.GetDiagramImageIndex: Integer;
var
  ADiagram: PDiagram;
begin
  // PRECONDITION
  Assert(FDiagramView <> nil);
  Assert(FDiagramView.Diagram <> nil);
  // PRECONDITION
  Result := -1;
  ADiagram := FDiagramView.Diagram;
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
  else if ADiagram is PUMLCompositeStructureDiagram then Result := 179;
end;

procedure PDiagramEditor.SetGridFactor(Value: PGridFactor);
begin
  if (FGridFactor.Width <> Value.Width) or (FGridFactor.Height <> Value.Height) then begin
    FGridFactor := Value;
    RedrawDiagramView;
  end;
end;

procedure PDiagramEditor.SetZoomFactor(Value: PZoomFactor);
begin
  if (Value.Numer <> FZoomFactor.Numer) or (Value.Denom <> FZoomFactor.Denom) then begin
    FZoomFactor := Value;
    Canvas.ZoomFactor := Value;
    FPaintBox.Width := (FDiagramWidth * ZoomPercent div 100);
    FPaintBox.Height := (FDiagramHeight * ZoomPercent div 100);
  end;    
end;

function PDiagramEditor.GetZoomPercent: Integer;
var
  Z: Real;
begin
  Z := (ZoomFactor.Numer / ZoomFactor.Denom) * 100;
  Result := Round(Z);
end;

procedure PDiagramEditor.SetZoomPercent(Value: Integer);
begin
  ZoomFactor := GraphicClasses.ZoomFactor(Value, 100);
end;

function PDiagramEditor.GetViewPort: TRect;
var
  L, T, R, B: Integer;
begin
  L := FScrollBox.HorzScrollBar.Position;
  T := FScrollBox.VertScrollBar.Position;
  R := L + FScrollBox.ClientWidth;
  B := T + FScrollBox.ClientHeight;
  Result := Rect(L, T, R, B);
end;

procedure PDiagramEditor.SetShowGrid(Value: Boolean);
begin
  if Value <> FShowGrid then begin
    FShowGrid := Value;
    RedrawDiagramView;
  end;
end;

procedure PDiagramEditor.Clear(Canvas: PCanvas; R: TRect);
var
  PB: PPenBrushRec;
begin
  StorePenBrush(Canvas, PB);
  Canvas.Pen.Color := clWhite;
  Canvas.Brush.Color := clWhite;
  Canvas.Canvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
  RestorePenBrush(Canvas, PB);
end;

procedure PDiagramEditor.DrawGrid(Canvas: PCanvas; Area: TRect);
const
  MIX_RANGE = 1;
  MAX_RANGE = 40;
  DOT_RATE = 10; 
var
  PB: PPenBrushRec;
  VP: TRect;    // Area
  PX: Double;
  PY: Double;
  ZP:Double;  
  GIX: Integer;  // Grid Line Interval
  GIY: Integer;  // Grid Line Interval
  P: TPoint;
  L, T, R, B: Integer;
  I, J: Integer;
begin
  if not FShowGrid then Exit;

  StorePenBrush(Canvas, PB);
  with Canvas.Pen do begin
    Width := 1;
    Style := psSolid;
    Mode := pmCopy;
  end;

  VP := Area;
  CoordRevTransform(FZoomFactor, FGridFactor, VP);

  // ASSERTION
  Assert(ZoomPercent > 0);
  // ASSERTION
  ZP := ZoomPercent / 100;

  PX := ZP * FGridFactor.Width;
  PY := ZP * FGridFactor.Height;

  GIX := Round(EnsureRange(DOT_RATE / PX, MIX_RANGE, MAX_RANGE));
  GIY := Round(EnsureRange(DOT_RATE / PY, MIX_RANGE, MAX_RANGE));

  L := VP.Left div (FGridFactor.Width * GIX);
  R := VP.Right div (FGridFactor.Width * GIX);
  T := VP.Top div (FGridFactor.Height * GIY);
  B := VP.Bottom div (FGridFactor.Height * GIY);

  for I := L to R do
    for J := T to B do begin
      P := Point(I * FGridFactor.Width * GIX, J * FGridFactor.Height * GIY);
      CoordTransform(FZoomFactor, FGridFactor, P);
      P := Point(P.X + Canvas.OriginX, P.Y + Canvas.OriginY);
      Canvas.Pen.Color := clSilver;
      Canvas.Canvas.MoveTo(P.X, P.Y);
      Canvas.Canvas.LineTo(P.X + 1, P.Y);
    end;

  RestorePenBrush(Canvas, PB);
end;

procedure PDiagramEditor.SetMapButtonLocation;
begin
  FMapButton.Left := FScrollBox.ClientWidth - FScrollBox.HorzScrollBar.ButtonSize - 18;
  FMapButton.Top := FScrollBox.ClientHeight - FScrollBox.VertScrollBar.ButtonSize - 18;
  FMapButtonShadow.Left := FScrollBox.ClientWidth - FScrollBox.HorzScrollBar.ButtonSize - 16;
  FMapButtonShadow.Top := FScrollBox.ClientHeight - FScrollBox.VertScrollBar.ButtonSize - 16;
end;

procedure PDiagramEditor.ResizeHandler(Sender: TObject);
begin
  SetMapButtonLocation;
end;

procedure PDiagramEditor.MapButtonImageMouseDownHandler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  SP: TPoint;
begin
  SP := FMapButton.ClientToScreen(Point(X, Y));
  DiagramMapForm.TargetEditor := Self;
  DiagramMapForm.ShowForm(SP.X, SP.Y);
end;

procedure PDiagramEditor.SetCanvasMoveHandled(Value: Boolean);
begin
  FCanvasMoveHandled := Value;
  if FCanvasMoveHandled then
    Screen.Cursor := crSizeAll
  else
    Screen.Cursor := crDefault;
end;

procedure PDiagramEditor.PaintBoxPaintHandler(Sender: TObject);
begin
  DrawGrid(FDiagramView.Canvas, ViewPort);
  FDiagramView.DrawDiagram(FDiagramView.Canvas);
  if FScrolled and Assigned(FHandlingPaintProc) then
    FHandlingPaintProc(Self, FCanvas);
end;

procedure PDiagramEditor.PaintBoxDragOverHandler(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  Msg: string;
begin
  Msg := '';
  if Assigned(FOnDragOver) then FOnDragOver(Sender, Source, Accept, MSg);
end;

procedure PDiagramEditor.PaintBoxDragDropHandler(Sender, Source: TObject; X, Y: Integer);
var
  ZX, ZY: Integer;
begin
  if Source is TFrame then begin
    ZX := X;
    ZY := Y;
    CoordRevTransform(Self.ZoomFactor, NOGRID, ZX, ZY);
    if Assigned(FOnDragDrop) then FOnDragDrop(ZX, ZY);
    SetFocus;
  end;
end;

procedure PDiagramEditor.PaintBoxMouseDownHandler(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
begin
  SetFocus;
  FScrolled := False;
  FHandlingPaintProc := nil;
  FScrollTimer.ResetTimer;
  SetCanvasMoveHandled([ssCtrl, ssLeft] <= Shift);
  if FCanvasMoveHandled then begin
    CMX := X;
    CMY := Y;
  end
  else begin
    if Assigned(FOnMouseDown) then FOnMouseDown(Self, Button, Shift, X, Y);
    if (Button = mbRight) and (FPopupMenu <> nil) then FPopupMenu.PopupFromCursorPos;
  end;
end;

procedure PDiagramEditor.PaintBoxMouseMoveHandler(Sender: TObject; Shift: TShiftState;
    X, Y: Integer);
var
  DX, DY: Integer;
begin
  if FCanvasMoveHandled and ([ssCtrl, ssLeft] <= Shift) then begin
    DX := CMX - X;
    DY := CMY - Y;
    CMX := X;
    CMY := Y;
    ScrollBy(DX, DY);
    CMX := CMX + DX;
    CMY := CMY + DY;
  end
  else begin
    if FCanvasMoveHandled then
      SetCanvasMoveHandled(False)
    else if ssLeft in Shift then begin
      if PointInRect(ViewPort, Point(X, Y)) then begin
        FScrollTimer.ResetTimer;
        if Assigned(FOnMouseMove) then FOnMouseMove(Self, Shift, X, Y);
      end
      else
        FScrollTimer.HandleMouseMove(Sender, Shift, X, Y);
    end
    else
      if Assigned(FOnMouseMove) then FOnMouseMove(Self, Shift, X, Y);
  end;
end;

procedure PDiagramEditor.PaintBoxMouseUpHandler(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
begin
  if FCanvasMoveHandled then
    SetCanvasMoveHandled(False)
  else begin
    FScrolled := False;
    FHandlingPaintProc := nil;
    FScrollTimer.ResetTimer;
    if Assigned(FOnMouseUp) then FOnMouseUp(Self, Button, Shift, X, Y);
  end;
end;

procedure PDiagramEditor.ScrollTimerMouseMoveHandler(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(FOnMouseMove) then
    FOnMouseMove(Self, Shift, X, Y);
end;

procedure PDiagramEditor.UpdateDiagramView;
begin
  // PRECONDITION
  Assert(FDiagramView <> nil);
  // PRECONDITION
  FDiagramView.Update;
end;

procedure PDiagramEditor.RedrawDiagramView;
begin
  // PRECONDITION
  Assert(FDiagramView <> nil);
  // PRECONDITION
  DrawByDoubleBuffering(ViewPort);
end;

procedure PDiagramEditor.ScrollBy(DX, DY: Integer);
begin
  ScrollBox.HorzScrollBar.Position := ScrollBox.HorzScrollBar.Position + DX;
  ScrollBox.VertScrollBar.Position := ScrollBox.VertScrollBar.Position + DY;
end;

procedure PDiagramEditor.FocusOnView(View: PView; CenterOfViewPort: Boolean = False);
var
  VR, R: TRect;
  VP, P: TPoint;
  DX, DY: Integer;
begin
  VR := ViewPort;
  R := View.GetBoundingBox(FDiagramView.Canvas);
  CoordTransform(ZoomFactor, NOGRID, R);
  DX := 0; DY := 0;
  if CenterOfViewPort then begin
    VP := GetCenter(VR);
    P := GetCenter(R);
    DX := P.X - VP.X;
    DY := P.Y - VP.Y;
  end
  else begin

    if (R.Left < VR.Left) or (R.Right > VR.Right) then
      DX := - (VR.Left - R.Left + 30);

    if (R.Top < VR.Top) or (R.Bottom > VR.Bottom) then
      DY := - (VR.Top - R.Top + 30);

  end;
  if (DX <> 0) or (DY <> 0) then
    ScrollBy(DX, DY);
end;

procedure PDiagramEditor.FocusOnView(View: PView; BasePoint: TPoint);
var
  R: TRect;
  VP, P: TPoint;
  DX, DY: Integer;
begin
  R := View.GetBoundingBox(FDiagramView.Canvas);
  VP := BasePoint;
  CoordTransform(ZoomFactor, NOGRID, R);
  CoordTransform(ZoomFactor, NOGRID, VP);
  P := GetCenter(R);
  DX := P.X - VP.X;
  DY := P.Y - VP.Y;
  if (DX <> 0) or (DY <> 0) then
    ScrollBy(DX, DY);
end;

// DiagramPanel component
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PScrollTimer

constructor PScrollTimer.Create(Owner: PDiagramEditor);
begin
  FOwner := Owner;
  Timer := TTimer.Create(FOwner);
  Timer.Interval := DEFAULT_SCROLL_TIME_INTERVAL;
  Timer.Enabled := False;
  Timer.OnTimer := HandleTimer;
  FactorX := 0; FactorY := 0;
end;

destructor PScrollTimer.Destroy;
begin
  Timer.Free;
  inherited;
end;

function PScrollTimer.GetInterval: Cardinal;
begin
  Result := Timer.Interval;
end;

procedure PScrollTimer.SetInterval(Value: Cardinal);
begin
  Timer.Interval := Value;
end;

procedure PScrollTimer.HandleTimer(Sender: TObject);
var
  X, Y: Integer;
begin
  // Notice. Scrolling Procedure of TScrollBox
  // ---------------------------------------
  // if you call procedure 'ScrollBox.ScrollBy()' or set variable 'ScrollBox.HorzScrollBar.Position'
  // then VCL take proceedings following sequence
  // a. Copy old area to new position
  // b. Set position variable and let user be able to proceed event
  // c. Fill out space result from scrolling (if defined PaintBox.OnPaint then call that.)

  FOwner.FScrolled := (FactorX <> 0) or (FactorY <> 0);
  if FactorX = 0 then
    X := FX
  else if FactorX > 0 then begin
    FOwner.ScrollBox.HorzScrollBar.Position := FOwner.ScrollBox.HorzScrollBar.Position + FactorX;
    X := FOwner.ViewPort.Right - 1;
  end
  else begin
    FOwner.ScrollBox.HorzScrollBar.Position := FOwner.ScrollBox.HorzScrollBar.Position + FactorX;
    X := FOwner.ViewPort.Left;
  end;
  if FactorY = 0 then
    Y := FY
  else if FactorY > 0 then begin
    FOwner.ScrollBox.VertScrollBar.Position := FOwner.ScrollBox.VertScrollBar.Position + FactorY;
    Y := FOwner.ViewPort.Bottom - 1;
  end
  else begin
    FOwner.ScrollBox.VertScrollBar.Position := FOwner.ScrollBox.VertScrollBar.Position + FactorY;
    Y := FOwner.ViewPort.Top;
  end;
  if Assigned(FOnMouseMove) then
    FOnMouseMove(Self, ShiftState, X, Y);
end;

procedure PScrollTimer.ResetTimer;
begin
  Timer.Enabled := False;
  FactorX := 0; FactorY := 0;
  ShiftState := [];
end;

procedure PScrollTimer.HandleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  Trigger: Boolean;
begin
  Trigger := False;
  if (FX <> X) or (FX <> Y) then begin
    FX := X; FY := Y;
    FactorX := 0;
    FactorY := 0;
  end;
  if X >= FOwner.ViewPort.Right - 1 then begin
    if not Timer.Enabled then
      Timer.Enabled := True;
    FactorX := (X - FOwner.ViewPort.Right) div 4;
    ShiftState := Shift;
    Trigger := True;
  end
  else if X < FOwner.ViewPort.Left then begin
    if not Timer.Enabled then
      Timer.Enabled := True;
    FactorX := (X - FOwner.ViewPort.Left) div 4;
    ShiftState := Shift;
    Trigger := True;
  end;

  if Y >= FOwner.ViewPort.Bottom - 1 then begin
    if not Timer.Enabled then
      Timer.Enabled := True;
    FactorY := (Y - FOwner.ViewPort.Bottom) div 4;
    ShiftState := Shift;
    Trigger := True;
  end
  else if Y < FOwner.ViewPort.Top then begin
    if not Timer.Enabled then
      Timer.Enabled := True;
    FactorY := (Y - FOwner.ViewPort.Top) div 4;
    ShiftState := Shift;
    Trigger := True;
  end;

  if not Trigger then begin
    if Timer.Enabled then Timer.Enabled := False;
    FactorX := 0;
    FactorY := 0;
    if Assigned(FOnMouseMove) then FOnMouseMove(Sender, Shift, X, Y);
  end;
end;

// PScrollTimer
////////////////////////////////////////////////////////////////////////////////

initialization
  DoubleBufferingBitmap := Graphics.TBitmap.Create;
  DoubleBufferingBitmap.Width := GetSystemMetrics(SM_CXSCREEN);
  DoubleBufferingBitmap.Height := GetSystemMetrics(SM_CYSCREEN);
  DoubleBufferingCanvas := PCanvas.Create(DoubleBufferingBitmap.Canvas);
  DoubleBufferingCanvas.ZoomFactor := ZoomFactor(100, 100);
finalization
  DoubleBufferingBitmap.Free;
  DoubleBufferingCanvas.Free;
end.
