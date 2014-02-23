object PageSetupForm: TPageSetupForm
  Left = 253
  Top = 150
  BorderStyle = bsDialog
  Caption = 'Page Setup'
  ClientHeight = 298
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OptionGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 413
    Height = 101
    Caption = 'Option'
    TabOrder = 0
    object DiagramNameCheckBox: TCheckBox
      Left = 16
      Top = 52
      Width = 129
      Height = 17
      Caption = '&Diagram Name'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 3
    end
    object ProjectNameCheckBox: TCheckBox
      Left = 156
      Top = 52
      Width = 115
      Height = 17
      Caption = 'Pro&ject Title'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 4
    end
    object TypeNameCheckBox: TCheckBox
      Left = 16
      Top = 72
      Width = 133
      Height = 17
      Caption = 'Diagram &Kind'
      Enabled = False
      TabOrder = 6
    end
    object DateTimeCheckBox: TCheckBox
      Left = 156
      Top = 72
      Width = 97
      Height = 17
      Caption = 'Dat&e/Time'
      Enabled = False
      TabOrder = 7
    end
    object HeaderRButton: TRadioButton
      Left = 16
      Top = 20
      Width = 133
      Height = 17
      Caption = 'On Header'
      TabOrder = 0
      OnClick = HeaderRButtonClick
    end
    object FooterRButton: TRadioButton
      Left = 156
      Top = 20
      Width = 133
      Height = 17
      Caption = 'On Footer'
      TabOrder = 1
      OnClick = FooterRButtonClick
    end
    object PageNumberCheckBox: TCheckBox
      Left = 280
      Top = 52
      Width = 109
      Height = 17
      Caption = 'Page &Number'
      Enabled = False
      TabOrder = 5
    end
    object OptionNoneRButton: TRadioButton
      Left = 296
      Top = 20
      Width = 68
      Height = 17
      Caption = 'None'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = OptionNoneRButtonClick
    end
  end
  object MarginGroupBox: TGroupBox
    Left = 8
    Top = 116
    Width = 293
    Height = 83
    Caption = 'Margin (in milimeters[mm])'
    TabOrder = 1
    object LeftMarginEdit: TLabeledEdit
      Left = 64
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 23
      EditLabel.Height = 13
      EditLabel.Caption = '&Left:'
      LabelPosition = lpLeft
      TabOrder = 2
    end
    object RightMarginEdit: TLabeledEdit
      Left = 208
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = '&Right:'
      LabelPosition = lpLeft
      TabOrder = 3
    end
    object TopMarginEdit: TLabeledEdit
      Left = 64
      Top = 20
      Width = 65
      Height = 21
      EditLabel.Width = 22
      EditLabel.Height = 13
      EditLabel.Caption = '&Top:'
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object BottomMarginEdit: TLabeledEdit
      Left = 208
      Top = 20
      Width = 65
      Height = 21
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = '&Bottom:'
      LabelPosition = lpLeft
      TabOrder = 1
    end
  end
  object OKButton: TButton
    Left = 52
    Top = 268
    Width = 88
    Height = 23
    Caption = 'OK'
    Default = True
    TabOrder = 5
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 237
    Top = 268
    Width = 88
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 6
    OnClick = CancelButtonClick
  end
  object DirectionGroupBox: TGroupBox
    Left = 312
    Top = 116
    Width = 109
    Height = 83
    Caption = 'Page orientation'
    TabOrder = 2
    object PortraitRButton: TRadioButton
      Left = 8
      Top = 24
      Width = 69
      Height = 17
      Caption = 'Portrait'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object LandscapeRButton: TRadioButton
      Left = 8
      Top = 48
      Width = 73
      Height = 17
      Caption = 'Landscape'
      TabOrder = 1
    end
  end
  object BordersGroupBox: TGroupBox
    Left = 8
    Top = 208
    Width = 413
    Height = 49
    Caption = 'Border'
    TabOrder = 3
    object BorderWidthLabel: TLabel
      Left = 264
      Top = 20
      Width = 50
      Height = 13
      Caption = 'Thickness:'
      FocusControl = BorderWidthCombo
    end
    object BorderWidthCombo: TComboBox
      Left = 317
      Top = 17
      Width = 62
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
    object BottomBorderCheckBox: TCheckBox
      Left = 76
      Top = 20
      Width = 57
      Height = 17
      Caption = 'Bottom'
      TabOrder = 1
    end
    object LeftBorderCheckBox: TCheckBox
      Left = 136
      Top = 20
      Width = 49
      Height = 17
      Caption = 'Left'
      TabOrder = 2
    end
    object RightBorderCheckBox: TCheckBox
      Left = 196
      Top = 20
      Width = 49
      Height = 17
      Caption = 'Right'
      TabOrder = 3
    end
    object TopBorderCheckBox: TCheckBox
      Left = 12
      Top = 20
      Width = 49
      Height = 17
      Caption = 'Top'
      TabOrder = 0
    end
  end
  object ApplyButton: TButton
    Left = 145
    Top = 268
    Width = 88
    Height = 23
    Caption = '&Apply'
    TabOrder = 4
    OnClick = ApplyButtonClick
  end
  object HelpButton: TButton
    Left = 330
    Top = 268
    Width = 88
    Height = 23
    Caption = '&Help'
    TabOrder = 7
    OnClick = HelpButtonClick
  end
end
