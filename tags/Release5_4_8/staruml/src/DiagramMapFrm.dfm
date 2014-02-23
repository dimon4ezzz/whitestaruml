object DiagramMapForm: TDiagramMapForm
  Left = 476
  Top = 241
  AutoSize = True
  BorderStyle = bsToolWindow
  Caption = 'Diagram Overview'
  ClientHeight = 280
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = HandleCreate
  OnDestroy = HandleDestory
  OnHide = HandleHide
  OnShow = HandleShow
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox: TPaintBox
    Left = 0
    Top = 0
    Width = 353
    Height = 280
    Color = clBtnFace
    ParentColor = False
    OnMouseDown = HandlePaintBoxMouseDown
    OnMouseMove = HandlePaintBoxMouseMove
    OnMouseUp = HandlePaintBoxMouseUp
    OnPaint = HandlePaintBoxPaint
  end
end
