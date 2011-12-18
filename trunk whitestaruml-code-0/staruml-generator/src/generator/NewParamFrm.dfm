object NewParameterForm: TNewParameterForm
  Left = 453
  Top = 339
  BorderStyle = bsDialog
  Caption = 'New Parameter'
  ClientHeight = 141
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object ParameterLabel: TLabel
    Left = 16
    Top = 20
    Width = 38
    Height = 12
    Caption = 'Name:'
  end
  object TypeLabel: TLabel
    Left = 16
    Top = 44
    Width = 33
    Height = 12
    Caption = 'Type:'
  end
  object ValueLabel: TLabel
    Left = 16
    Top = 68
    Width = 78
    Height = 12
    Caption = 'Default Value:'
  end
  object Bevel: TBevel
    Left = 8
    Top = 96
    Width = 233
    Height = 9
    Shape = bsTopLine
  end
  object NameEdit: TEdit
    Left = 96
    Top = 16
    Width = 137
    Height = 20
    ImeName = 'Microsoft IME 2003'
    TabOrder = 0
    OnChange = NameEditChange
  end
  object ValueEdit: TEdit
    Left = 96
    Top = 64
    Width = 137
    Height = 20
    ImeName = 'Microsoft IME 2003'
    TabOrder = 1
  end
  object TypeComboBox: TComboBox
    Left = 96
    Top = 40
    Width = 137
    Height = 20
    Style = csDropDownList
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 12
    ItemIndex = 0
    TabOrder = 2
    Text = 'STRING'
    Items.Strings = (
      'STRING'
      'INTEGER'
      'BOOLEAN'
      'ELEMENT'
      'FILENAME'
      'PATHNAME'
      'DATE')
  end
  object AcceptButton: TButton
    Left = 52
    Top = 109
    Width = 90
    Height = 23
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object CancelButton: TButton
    Left = 148
    Top = 109
    Width = 90
    Height = 23
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
