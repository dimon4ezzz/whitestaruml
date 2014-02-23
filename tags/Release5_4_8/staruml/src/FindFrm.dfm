object FindForm: TFindForm
  Left = 329
  Top = 308
  ActiveControl = FindComboBox
  BorderStyle = bsDialog
  Caption = 'Find'
  ClientHeight = 142
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    454
    142)
  PixelsPerInch = 96
  TextHeight = 13
  object TextToFindLabel: TLabel
    Left = 8
    Top = 8
    Width = 64
    Height = 13
    Caption = '&Text To Find:'
    FocusControl = FindComboBox
  end
  object OKButton: TButton
    Left = 173
    Top = 112
    Width = 88
    Height = 23
    Anchors = [akTop, akRight]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object CancelButton: TButton
    Left = 266
    Top = 112
    Width = 88
    Height = 23
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object OptionGroupBox: TGroupBox
    Left = 8
    Top = 52
    Width = 438
    Height = 53
    Anchors = [akLeft, akTop, akRight]
    Caption = '&Option'
    TabOrder = 1
    object ElementTypeLabel: TLabel
      Left = 20
      Top = 24
      Width = 69
      Height = 13
      Caption = '&Element Type:'
      FocusControl = ElementTypeComboBox
    end
    object ElementTypeComboBox: TComboBox
      Left = 104
      Top = 20
      Width = 105
      Height = 21
      Style = csDropDownList
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      TabOrder = 0
      Items.Strings = (
        'All'
        'Model'
        'Subsystem'
        'Package'
        'Class'
        'Interface'
        'Enumeration'
        'Signal'
        'Exception'
        'Component'
        'Node'
        'Instance'
        'UseCase'
        'Actor')
    end
    object CaseSensitiveCheckBox: TCheckBox
      Left = 236
      Top = 20
      Width = 129
      Height = 17
      Caption = 'Case &Sensitive'
      TabOrder = 1
    end
  end
  object FindComboBox: TComboBox
    Left = 8
    Top = 24
    Width = 438
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
    TabOrder = 0
  end
  object HelpButton: TButton
    Left = 359
    Top = 112
    Width = 88
    Height = 23
    Anchors = [akTop, akRight]
    Caption = '&Help'
    TabOrder = 4
    OnClick = HelpButtonClick
  end
end
