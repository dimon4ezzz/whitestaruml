object BatchRegisterForm: TBatchRegisterForm
  Left = 468
  Top = 316
  BorderStyle = bsDialog
  Caption = 'Register Batch'
  ClientHeight = 219
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = 14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object HeaderLabel: TLabel
    Left = 8
    Top = 8
    Width = 200
    Height = 14
    Caption = 'Input Registering Batch Infromation.'
  end
  object NameLabel: TLabel
    Left = 8
    Top = 35
    Width = 70
    Height = 14
    Caption = 'Batch Name:'
  end
  object DescLabel: TLabel
    Left = 8
    Top = 73
    Width = 64
    Height = 14
    Caption = 'Description:'
  end
  object Bevel: TBevel
    Left = 8
    Top = 176
    Width = 289
    Height = 9
    Shape = bsTopLine
  end
  object NameEdit: TEdit
    Left = 8
    Top = 48
    Width = 289
    Height = 22
    ImeName = 'Microsoft IME 2003'
    TabOrder = 0
    OnChange = NameEditChange
  end
  object DescMemo: TMemo
    Left = 8
    Top = 88
    Width = 289
    Height = 81
    ImeName = 'Microsoft IME 2003'
    TabOrder = 1
  end
  object AcceptButton: TButton
    Left = 108
    Top = 188
    Width = 90
    Height = 23
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object CancelButton: TButton
    Left = 204
    Top = 188
    Width = 90
    Height = 23
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
