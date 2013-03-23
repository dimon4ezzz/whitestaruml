object XMIImportForm: TXMIImportForm
  Left = 236
  Top = 161
  BorderStyle = bsDialog
  Caption = 'Import from XMI'
  ClientHeight = 329
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressMessageLabel: TLabel
    Left = 10
    Top = 239
    Width = 41
    Height = 13
    Caption = 'Progress'
  end
  object FileLocationLabel: TLabel
    Left = 10
    Top = 15
    Width = 51
    Height = 13
    Caption = '&File name: '
    FocusControl = FileLocationEdit
  end
  object Bevel1: TBevel
    Left = 8
    Top = 287
    Width = 394
    Height = 9
    Shape = bsTopLine
  end
  object FileInfoGroup: TGroupBox
    Left = 8
    Top = 39
    Width = 394
    Height = 101
    Caption = ' File Information '
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    object XMIVerTitleLabel: TLabel
      Left = 10
      Top = 23
      Width = 66
      Height = 13
      Caption = 'XMI Version : '
    end
    object UMLVerTitleLabel: TLabel
      Left = 9
      Top = 43
      Width = 70
      Height = 13
      Caption = 'UML Version : '
    end
    object ExporterTitleLabel: TLabel
      Left = 10
      Top = 63
      Width = 72
      Height = 13
      Caption = 'Exporter Tool : '
    end
    object XMIVerLabel: TLabel
      Left = 65
      Top = 23
      Width = 280
      Height = 13
      AutoSize = False
    end
    object UMLVerLabel: TLabel
      Left = 68
      Top = 43
      Width = 280
      Height = 13
      AutoSize = False
    end
    object ExporterLabel: TLabel
      Left = 104
      Top = 63
      Width = 270
      Height = 13
      AutoSize = False
    end
    object FileInfoMemo: TMemo
      Left = 10
      Top = 80
      Width = 373
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      Visible = False
      WantReturns = False
    end
  end
  object OptionGroup: TGroupBox
    Left = 8
    Top = 144
    Width = 394
    Height = 86
    Caption = ' Options '
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 3
    object RationalApprRecommended: TLabel
      Left = 184
      Top = 62
      Width = 128
      Height = 13
      Caption = '(Recommended for this file)'
    end
    object RationalApprCheck: TCheckBox
      Left = 10
      Top = 60
      Width = 175
      Height = 17
      Caption = 'Using &Rational Approach'
      Enabled = False
      TabOrder = 2
    end
    object DiagramCheck: TCheckBox
      Left = 10
      Top = 20
      Width = 369
      Height = 17
      Caption = 'Generate &diagrams and view elements'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object NewProjectCheck: TCheckBox
      Left = 10
      Top = 40
      Width = 369
      Height = 17
      Caption = 'Generate as &new project'
      TabOrder = 1
      OnClick = NewProjectCheckClick
    end
  end
  object ExecuteButton: TButton
    Left = 204
    Top = 297
    Width = 95
    Height = 23
    Caption = '&OK'
    Default = True
    TabOrder = 5
    OnClick = ExecuteButtonClick
  end
  object CancelButton: TButton
    Left = 303
    Top = 297
    Width = 95
    Height = 23
    Cancel = True
    Caption = '&Cancel'
    TabOrder = 6
    OnClick = CancelButtonClick
  end
  object ProgressBar: TProgressBar
    Left = 10
    Top = 256
    Width = 390
    Height = 18
    TabOrder = 4
  end
  object FileLocationEdit: TEdit
    Left = 72
    Top = 12
    Width = 232
    Height = 21
    TabOrder = 0
    OnChange = FileLocationEditChange
  end
  object FileOpenButton: TButton
    Left = 307
    Top = 11
    Width = 95
    Height = 23
    Caption = '&Browse...'
    TabOrder = 1
    OnClick = FileOpenButtonClick
  end
  object OpenDialog: TOpenDialog
    Filter = 'XMI Files (*.xml;*.xmi)|*.xml;*.xmi'
    Title = 'XMI '#54028#51068' '#49440#53469
    Left = 8
    Top = 304
  end
  object XMLDocument: TXMLDocument
    Left = 46
    Top = 305
    DOMVendorDesc = 'MSXML'
  end
end
