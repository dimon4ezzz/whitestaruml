object InputBoxForm: TInputBoxForm
  Left = 335
  Top = 267
  ActiveControl = ValueEdit
  BorderStyle = bsDialog
  Caption = 'Title'
  ClientHeight = 97
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CaptionLabel: TLabel
    Left = 8
    Top = 13
    Width = 37
    Height = 13
    Caption = 'Caption'
  end
  object OkButton: TButton
    Left = 152
    Top = 64
    Width = 89
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 248
    Top = 64
    Width = 89
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object ValueEdit: TEdit
    Left = 8
    Top = 32
    Width = 329
    Height = 21
    ImeName = 'Microsoft IME 2003'
    TabOrder = 0
  end
end
