object RoseImportForm: TRoseImportForm
  Left = 395
  Top = 305
  BorderStyle = bsDialog
  Caption = 'Import Rational Rose File'
  ClientHeight = 219
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressMessageLabel: TLabel
    Left = 10
    Top = 131
    Width = 46
    Height = 13
    Caption = 'Progress:'
  end
  object FileLocationLabel: TLabel
    Left = 10
    Top = 14
    Width = 23
    Height = 13
    Caption = '&File: '
  end
  object DecoBevel: TBevel
    Left = 8
    Top = 177
    Width = 394
    Height = 9
    Shape = bsTopLine
  end
  object OptionGroup: TGroupBox
    Left = 8
    Top = 36
    Width = 393
    Height = 86
    Caption = 'Option'
    TabOrder = 1
    object AddToAttachmentCheck: TCheckBox
      Left = 10
      Top = 58
      Width = 369
      Height = 17
      Caption = '&Add the original file path to the project attachments list'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object InstanceToRoleCheck: TCheckBox
      Left = 10
      Top = 18
      Width = 369
      Height = 17
      Caption = 'Convert Instance elements to &Role elements (recommended)'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object MakeDiagramViewCheck: TCheckBox
      Left = 10
      Top = 38
      Width = 369
      Height = 17
      Caption = 'Generate &diagram and view elements'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object ExecuteButton: TButton
    Left = 207
    Top = 188
    Width = 95
    Height = 23
    Caption = '&OK'
    Default = True
    TabOrder = 3
    OnClick = ExecuteButtonClick
  end
  object CancelButton: TButton
    Left = 306
    Top = 188
    Width = 95
    Height = 23
    Cancel = True
    Caption = '&Cancel'
    TabOrder = 4
    OnClick = CancelButtonClick
  end
  object ProgressBar: TProgressBar
    Left = 8
    Top = 148
    Width = 393
    Height = 18
    TabOrder = 2
  end
  object FileLocationEdit: TEdit
    Left = 40
    Top = 10
    Width = 289
    Height = 21
    TabOrder = 0
    OnChange = FileLocationEditChange
  end
  object FileOpenButton: TButton
    Left = 332
    Top = 9
    Width = 69
    Height = 23
    Caption = '&Browse...'
    TabOrder = 5
    OnClick = FileOpenButtonClick
  end
  object OpenDialog: TOpenDialog
    Filter = 'Rational Rose Files(*.mdl;*.ptl)|*.mdl;*.ptl'
    Title = 'Open Rational Rose File'
    Left = 8
    Top = 185
  end
end
