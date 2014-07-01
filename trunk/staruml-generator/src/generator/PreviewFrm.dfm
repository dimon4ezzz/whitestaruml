object PreviewForm: TPreviewForm
  Left = 313
  Top = 228
  BorderStyle = bsDialog
  Caption = 'Preview'
  ClientHeight = 290
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PreviewScrollBox: TScrollBox
    Left = 0
    Top = 0
    Width = 430
    Height = 249
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clAppWorkSpace
    ParentColor = False
    TabOrder = 0
  end
  object CloseButton: TButton
    Left = 164
    Top = 260
    Width = 90
    Height = 23
    Cancel = True
    Caption = '&Close'
    Default = True
    ModalResult = 2
    TabOrder = 1
  end
end
