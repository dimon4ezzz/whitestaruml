object XMIExportForm: TXMIExportForm
  Left = 349
  Top = 235
  BorderStyle = bsDialog
  Caption = 'Export to XMI'
  ClientHeight = 264
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    410
    264)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 223
    Width = 405
    Height = 6
    Anchors = [akRight, akBottom]
    Shape = bsTopLine
  end
  object ProgressMessageLabel: TLabel
    Left = 10
    Top = 180
    Width = 41
    Height = 13
    Caption = 'Progress'
  end
  object FileNameLabel: TLabel
    Left = 10
    Top = 16
    Width = 48
    Height = 13
    Caption = '&File name:'
    FocusControl = FileNameEdit
  end
  object ExecuteButton: TButton
    Left = 205
    Top = 234
    Width = 95
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = '&OK'
    Default = True
    TabOrder = 2
    OnClick = ExecuteButtonClick
  end
  object CancelButton: TButton
    Left = 304
    Top = 234
    Width = 95
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancel'
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object XMIVersionGroupBox: TGroupBox
    Left = 8
    Top = 40
    Width = 393
    Height = 41
    Caption = ' XMI Version '
    TabOrder = 0
    object XMI13RadioButton: TRadioButton
      Left = 10
      Top = 16
      Width = 145
      Height = 17
      Caption = 'XMI 1.1 for UML 1.3'
      TabOrder = 0
      TabStop = True
      OnClick = XMI13RadioButtonClick
    end
    object XMI13RoseRadioButton: TRadioButton
      Left = 160
      Top = 16
      Width = 225
      Height = 17
      Caption = 'XMI 1.1 for UML 1.3 Rose Extended'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = XMI13RoseRadioButtonClick
    end
  end
  object OptionGroupBox: TGroupBox
    Left = 8
    Top = 88
    Width = 393
    Height = 81
    Caption = ' Options '
    TabOrder = 1
    object ExportViewsCheckBox: TCheckBox
      Left = 15
      Top = 16
      Width = 217
      Height = 17
      Caption = 'Generate &diagram and view elements'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object UUIDCheckBox: TCheckBox
      Left = 15
      Top = 36
      Width = 217
      Height = 17
      Caption = 'Generate &UUID'
      TabOrder = 1
    end
    object TimestampCheckBox: TCheckBox
      Left = 15
      Top = 56
      Width = 217
      Height = 17
      Caption = 'Generate &Timestamp'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object ProgressBar: TProgressBar
    Left = 10
    Top = 197
    Width = 390
    Height = 18
    TabOrder = 4
  end
  object FileNameEdit: TEdit
    Left = 74
    Top = 12
    Width = 255
    Height = 21
    TabOrder = 5
    OnChange = FileNameEditChange
  end
  object FileSaveButton: TButton
    Left = 336
    Top = 11
    Width = 63
    Height = 23
    Caption = '&Browse...'
    TabOrder = 6
    OnClick = FileSaveButtonClick
  end
  object FileSaveDialog: TSaveDialog
    DefaultExt = 'xml'
    Filter = 'XMI Files (*.xml;*.xmi)|*.xml;*.xmi|'#47784#46304' '#54028#51068' (*.*)|*.*'
    Left = 8
    Top = 240
  end
end
