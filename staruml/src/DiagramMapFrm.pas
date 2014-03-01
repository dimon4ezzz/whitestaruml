unit DiagramMapFrm;

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
  GraphicClasses, DiagramEditors,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AreaTitleBar, StdCtrls;

type
  // Event
  PDiagramMapMoveEvent = procedure(Sender: TObject; DX, DY: Integer) of object;

  // Exception
  EInvalidDiagramEditor = class(Exception);

  // TDiagramMapForm
  TDiagramMapForm = class(TForm)
    PaintBox: TPaintBox;
    procedure HandleCreate(Sender: TObject);
    procedure HandleDestory(Sender: TObject);
    procedure HandleShow(Sender: TObject);
    procedure HandlePaintBoxPaint(Sender: TObject);
    procedure HandlePaintBoxMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure HandlePaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure HandlePaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure HandleHide(Sender: TObject);
  private
    FTargetEditor: PDiagramEditor;
    FCanvas: PCanvas;
    FX, FY: Integer;
    FCanvasMappedRect: TRect;
    FMapRect: TRect;
    FMouseDownFlag: Boolean;
    FPrevCursor: TCursor;
    FOnDiagramMapMove: PDiagramMapMoveEvent;
    function GetCanvasMappedRect: TRect;
    function ReducedScale: Integer;
    function FocusedMapRect: TRect;
    procedure Clear(Canvas: PCanvas; R: TRect);
    procedure DrawMapRect(Rect: TRect);
    procedure DrawDiagram;
    procedure SetupForm;
  public
    procedure ShowForm(CX, CY: Integer);
    property TargetEditor: PDiagramEditor read FTargetEditor write FTargetEditor;
    property OnDiagramMapMove: PDiagramMapMoveEvent read FOnDiagramMapMove write FOnDiagramMapMove;
  end;

var
  DiagramMapForm: TDiagramMapForm;

implementation

{$R *.dfm}

uses
  System.Types,
  LogMgr,
  Math, NLS;

const
  PAINTBOX_MIN_SIZE = 50;
  PAINTBOX_BASE_SIZE = 200;
  MAP_CANVAS_MARGIN = 100;
  REDUCES_SCALE_MIN = 1;

function TDiagramMapForm.GetCanvasMappedRect: TRect;
var
  W, H: Integer;
  R: TRect;
begin
  if FTargetEditor = nil then
    raise EInvalidDiagramEditor.Create('Target diagram editor not found.');
  R := FTargetEditor.DiagramView.GetBoundingBox(FCanvas);
  CoordTransform(FTargetEditor.ZoomFactor, NOGRID, R);
  W := Max(R.Right + MAP_CANVAS_MARGIN, FTargetEditor.ViewPort.Right);
  W := Min(W, FTargetEditor.PaintBox.Width);
  H := Max(R.Bottom + MAP_CANVAS_MARGIN, FTargetEditor.ViewPort.Bottom);
  H := Min(H, FTargetEditor.PaintBox.Height);
  Result := Rect(0, 0, W, H);
end;

// get reduced scale by percent
function TDiagramMapForm.ReducedScale: Integer;
var
  R: TRect;
begin
  R := FCanvasMappedRect;
  Result := Max(PaintBox.Width * 100 div (R.Right - R.Left), REDUCES_SCALE_MIN);
end;

function TDiagramMapForm.FocusedMapRect: TRect;
begin
  Result := Rect(TargetEditor.ViewPort.Left * ReducedScale div 100,
    TargetEditor.ViewPort.Top * ReducedScale div 100,
    TargetEditor.ViewPort.Right * ReducedScale div 100,
    TargetEditor.ViewPort.Bottom * ReducedScale div 100);
end;

procedure TDiagramMapForm.Clear(Canvas: PCanvas; R: TRect);
var
  PB: PPenBrushRec;
begin
  StorePenBrush(Canvas, PB);
  Canvas.Pen.Color := clWhite;
  Canvas.Brush.Color := clWhite;
  Canvas.Canvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
  RestorePenBrush(Canvas, PB);
end;

procedure TDiagramMapForm.DrawMapRect(Rect: TRect);
var
  PB: PPenBrushRec;
  C: TPoint;
begin
  StorePenBrush(FCanvas, PB);
  FCanvas.Canvas.Pen.Color := clNavy;
  FCanvas.Canvas.Pen.Style := psSolid;
  FCanvas.Canvas.Pen.Mode := pmNotXOR;
  FCanvas.Canvas.Brush.Style := bsClear;
  FCanvas.Canvas.Rectangle(Rect);
  C := GetCenter(Rect);
  FCanvas.Canvas.MoveTo(C.X - 5, C.Y);
  FCanvas.Canvas.LineTo(C.X + 5, C.Y);
  FCanvas.Canvas.MoveTo(C.X, C.Y - 5);
  FCanvas.Canvas.LineTo(C.X, C.Y + 5);
  RestorePenBrush(FCanvas, PB);
end;

procedure TDiagramMapForm.DrawDiagram;
begin
  if FTargetEditor = nil then
    Exit;
  Clear(FCanvas, Rect(0, 0, PaintBox.Width, PaintBox.Height));
  FTargetEditor.DiagramView.Draw(FCanvas);
end;

procedure TDiagramMapForm.SetupForm;
var
  P: TPoint;
  R: TRect;
  Ratio: Real;
  W, H: Real;
  BaseSize, L: Integer;
begin
  if FTargetEditor = nil then
    Exit;

  FCanvasMappedRect := GetCanvasMappedRect;

  // reassign paintbox base size
  L := Max(FCanvasMappedRect.Right - FCanvasMappedRect.Left,
    FCanvasMappedRect.Bottom - FCanvasMappedRect.Top);
  BaseSize := PAINTBOX_BASE_SIZE;
  if BaseSize * 100 div L < REDUCES_SCALE_MIN then
    BaseSize := L * REDUCES_SCALE_MIN div 100;

  // recalc size of PaintBox
  P := Point(PAINTBOX_MIN_SIZE, PAINTBOX_MIN_SIZE);
  R := FCanvasMappedRect;
  Ratio := (R.Right - R.Left) / (R.Bottom - R.Top);
  if Ratio > 1 then begin
    W := BaseSize;
    H := W / Ratio;
  end
  else begin
    H := BaseSize;
    W := Ratio * H;
  end;
  P := Point(Trunc(W), Trunc(H));
  PaintBox.Width := P.X;
  PaintBox.Height := P.Y;

  FCanvas.ZoomFactor := ZoomFactor(ReducedScale * TargetEditor.ZoomPercent div 100, 100);
end;

procedure TDiagramMapForm.ShowForm(CX, CY: Integer);
var
  P: TPoint;
  RParam: LongInt;
begin
  if FTargetEditor = nil then
    Exit;
  SetupForm;

  // for realign of Form
  AutoSize := False;
  AutoSize := True;

  // set form's position
  Left := CX - Width div 2;
  Top := CY - Height div 2;
  if Left + Width > Screen.WorkAreaWidth then
    Left := Screen.WorkAreaWidth - Width;
  if Top + Height > Screen.WorkAreaHeight then
    Top := Screen.WorkAreaHeight - Height;
  Show;

  // raise mouse-down event intentionally
  P := GetCenter(FocusedMapRect);
  Mouse.CursorPos := ClientToScreen(P);
  RParam := P.Y * $10000 + P.X;
  SendMessage(Handle, WM_LBUTTONDOWN, MK_LBUTTON, RParam);
end;

procedure TDiagramMapForm.HandleCreate(Sender: TObject);
begin
  FCanvas := PCanvas.Create(PaintBox.Canvas);
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\DGMMAP.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

procedure TDiagramMapForm.HandleDestory(Sender: TObject);
begin
  FCanvas.Free;
end;

procedure TDiagramMapForm.HandleShow(Sender: TObject);
begin
  FPrevCursor := Screen.Cursor;
  Screen.Cursor := crNone;
end;

procedure TDiagramMapForm.HandleHide(Sender: TObject);
var
  P: TPoint;
begin
  P := GetCenter(FocusedMapRect);
  Mouse.CursorPos := ClientToScreen(P);
  Screen.Cursor := FPrevCursor;
end;

procedure TDiagramMapForm.HandlePaintBoxPaint(Sender: TObject);
begin
  DrawDiagram;
  if FMouseDownFlag then begin
    DrawMapRect(FMapRect);
    FMouseDownFlag := False;
  end;
end;

procedure TDiagramMapForm.HandlePaintBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FX := X;  FY := Y;
  FMapRect := FocusedMapRect;
  FMouseDownFlag := True;
end;

procedure TDiagramMapForm.HandlePaintBoxMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);

  function GetScaledCanvasWidth: Integer;
  begin
    Result := (TargetEditor.DiagramWidth * TargetEditor.ZoomPercent div 100)
      * ReducedScale div 100;
  end;

  function GetScaledCanvasHeight: Integer;
  begin
    Result := (TargetEditor.DiagramHeight * TargetEditor.ZoomPercent div 100)
      * ReducedScale div 100;
  end;

var
  DX, DY: Integer;
begin
  if ssLeft in Shift then begin
    DrawMapRect(FMapRect);
    if not EqualRect(FMapRect, FocusedMapRect) then
      FMapRect := FocusedMapRect;
    DX := X - FX;
    DY := Y - FY;
    if FMapRect.Left + DX < 0 then
      DX := -FMapRect.Left;
    if FMapRect.Top + DY < 0 then
      DY := -FMapRect.Top;
    if FMapRect.Right + DX > GetScaledCanvasWidth then
      DX := GetScaledCanvasWidth - FMapRect.Right;
    if FMapRect.Bottom + DY > GetScaledCanvasHeight then
      DY := GetScaledCanvasHeight - FMapRect.Bottom;

    FMapRect := Rect(FMapRect.Left + DX, FMapRect.Top + DY,
      FMapRect.Right + DX, FMapRect.Bottom + DY);
    FX := X;
    FY := Y;
    DrawMapRect(FMapRect);

    if Assigned(FOnDiagramMapMove) then
      FOnDiagramMapMove(Self, DX * 100 div ReducedScale, DY * 100 div ReducedScale);
  end;
end;

procedure TDiagramMapForm.HandlePaintBoxMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DrawMapRect(FMapRect);
  Close;
end;

end.
