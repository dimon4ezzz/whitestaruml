object CompactFontDialogForm: TCompactFontDialogForm
  Left = 342
  Top = 316
  BorderStyle = bsDialog
  Caption = 'Font'
  ClientHeight = 229
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object FontNameLabel: TLabel
    Left = 8
    Top = 7
    Width = 26
    Height = 13
    Caption = '&Font:'
    FocusControl = FontNameEdit
  end
  object FontStyleLabel: TLabel
    Left = 174
    Top = 7
    Width = 52
    Height = 13
    Caption = 'Font st&yle:'
    FocusControl = FontStyleEdit
  end
  object FontSizeLabel: TLabel
    Left = 299
    Top = 7
    Width = 23
    Height = 13
    Caption = '&Size:'
    FocusControl = FontSizeEdit
  end
  object FontStyleEdit: TEdit
    Left = 172
    Top = 22
    Width = 114
    Height = 21
    TabOrder = 1
  end
  object FontSizeEdit: TEdit
    Left = 297
    Top = 22
    Width = 52
    Height = 21
    TabOrder = 2
  end
  object FontEffectGoupBox: TGroupBox
    Left = 8
    Top = 137
    Width = 153
    Height = 84
    Caption = 'Effects'
    TabOrder = 5
    object ColorLabel: TLabel
      Left = 8
      Top = 59
      Width = 29
      Height = 13
      Caption = '&Color:'
    end
    object StrikeOutCheckBox: TCheckBox
      Left = 11
      Top = 15
      Width = 78
      Height = 17
      Caption = 'Stri&keout'
      TabOrder = 0
    end
    object UnderlineCheckbox: TCheckBox
      Left = 11
      Top = 34
      Width = 70
      Height = 17
      Caption = '&Underline'
      TabOrder = 1
    end
    object FontColorBox: TColorBox
      Left = 48
      Top = 54
      Width = 97
      Height = 22
      Style = [cbStandardColors, cbIncludeNone, cbIncludeDefault, cbCustomColor, cbPrettyNames]
      TabOrder = 2
    end
  end
  object PreviewGoupBox: TGroupBox
    Left = 172
    Top = 137
    Width = 179
    Height = 84
    Caption = 'Sample'
    TabOrder = 6
    object PreviewPanel: TPanel
      Left = 13
      Top = 19
      Width = 153
      Height = 54
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWindow
      TabOrder = 0
      object PreviewLabel: TLabel
        Left = 24
        Top = 16
        Width = 60
        Height = 13
        Caption = '                    '
        Color = clWindow
        ParentColor = False
      end
    end
  end
  object AcceptButton: TButton
    Left = 362
    Top = 7
    Width = 91
    Height = 21
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 7
  end
  object CancelButton: TButton
    Left = 362
    Top = 34
    Width = 91
    Height = 21
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 8
  end
  object FontSizeListBox: TListBox
    Left = 297
    Top = 43
    Width = 52
    Height = 86
    ItemHeight = 13
    Items.Strings = (
      '8'
      '9'
      '10'
      '11'
      '12'
      '14'
      '16'
      '18'
      '20'
      '22'
      '24'
      '26'
      '28'
      '36'
      '48')
    TabOrder = 4
  end
  object FontStyleListBox: TListBox
    Left = 172
    Top = 43
    Width = 114
    Height = 86
    ItemHeight = 13
    Items.Strings = (
      'Regular'
      'Bold'
      'Italic'
      'Bold Italic')
    TabOrder = 3
  end
  object FontNameEdit: TEdit
    Left = 8
    Top = 22
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object ApplyButton: TButton
    Left = 362
    Top = 61
    Width = 91
    Height = 21
    Caption = 'Accept(&A)'
    TabOrder = 9
  end
  object FontNameListBox: TListBox
    Left = 8
    Top = 43
    Width = 153
    Height = 86
    ItemHeight = 13
    TabOrder = 10
  end
end
