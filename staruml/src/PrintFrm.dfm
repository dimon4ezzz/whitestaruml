object PrintForm: TPrintForm
  Left = 412
  Top = 175
  BorderStyle = bsDialog
  Caption = 'Print'
  ClientHeight = 483
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PrintPreviewButton: TButton
    Left = 8
    Top = 452
    Width = 95
    Height = 23
    Caption = 'P&review...'
    TabOrder = 3
    OnClick = PreviewButtonClick
  end
  object PrintButton: TButton
    Left = 240
    Top = 452
    Width = 88
    Height = 23
    Caption = 'Print'
    Default = True
    TabOrder = 4
    OnClick = PrintButtonClick
  end
  object CancelButton: TButton
    Left = 333
    Top = 452
    Width = 88
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  object PrinterGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 509
    Height = 85
    Caption = 'Printer'
    TabOrder = 0
    object PrinterNameLabel: TLabel
      Left = 12
      Top = 24
      Width = 31
      Height = 13
      Caption = '&Name:'
      FocusControl = PrinterComboBox
    end
    object PrinterStatusLabel: TLabel
      Left = 12
      Top = 48
      Width = 35
      Height = 13
      Caption = 'Status:'
    end
    object PrinterWhereLabel: TLabel
      Left = 12
      Top = 64
      Width = 44
      Height = 13
      Caption = 'Location:'
    end
    object PrinterStatusMsgLabel: TLabel
      Left = 52
      Top = 48
      Width = 3
      Height = 13
    end
    object PrinterWhereMsgLabel: TLabel
      Left = 52
      Top = 64
      Width = 3
      Height = 13
    end
    object PrinterComboBox: TComboBox
      Left = 64
      Top = 20
      Width = 329
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = PrinterComboBoxChange
    end
    object PrinterPropertyButton: TButton
      Left = 400
      Top = 48
      Width = 100
      Height = 23
      Caption = '&Properties...'
      Enabled = False
      TabOrder = 1
      Visible = False
      OnClick = PrinterPropertyButtonClick
    end
    object PageSetupButton: TButton
      Left = 400
      Top = 19
      Width = 100
      Height = 23
      Caption = 'Page Setup...'
      TabOrder = 2
      OnClick = PageSetupButtonClick
    end
  end
  object SizeGroupBox: TGroupBox
    Left = 8
    Top = 104
    Width = 509
    Height = 81
    Caption = 'Size'
    TabOrder = 1
    object SizeWideLabel: TLabel
      Left = 132
      Top = 58
      Width = 65
      Height = 13
      Caption = 'Wide(pages):'
    end
    object SizeTallLabel: TLabel
      Left = 264
      Top = 58
      Width = 57
      Height = 13
      Caption = 'Tall(pages):'
    end
    object AsInDiagramRButton: TRadioButton
      Left = 12
      Top = 16
      Width = 173
      Height = 17
      Caption = '&Diagram as is'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = SizeRadioButtonClick
    end
    object FitToPageRButton: TRadioButton
      Left = 12
      Top = 36
      Width = 113
      Height = 17
      Caption = '&Fit to page'
      TabOrder = 1
      OnClick = SizeRadioButtonClick
    end
    object TileRButton: TRadioButton
      Left = 12
      Top = 56
      Width = 129
      Height = 18
      Caption = 'T&ile:'
      TabOrder = 2
      OnClick = SizeRadioButtonClick
    end
    object SizeWideCombo: TComboBox
      Left = 200
      Top = 54
      Width = 49
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      Text = '1'
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
    object SizeTallCombo: TComboBox
      Left = 324
      Top = 54
      Width = 49
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 4
      Text = '1'
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
  end
  object RangeGroupBox: TGroupBox
    Left = 8
    Top = 196
    Width = 509
    Height = 245
    Caption = 'Print Range'
    TabOrder = 2
    object CurrentDiagramRButton: TRadioButton
      Left = 12
      Top = 17
      Width = 129
      Height = 17
      Caption = 'Curr&ent diagram'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RangeRadioButtonClick
    end
    object AllDiagramsRButton: TRadioButton
      Left = 12
      Top = 35
      Width = 133
      Height = 17
      Caption = '&All diagrams'
      TabOrder = 1
      OnClick = RangeRadioButtonClick
    end
    object SelectedDiagramsRButton: TRadioButton
      Left = 12
      Top = 52
      Width = 137
      Height = 17
      Caption = 'Selected dia&grams'
      TabOrder = 2
      OnClick = RangeRadioButtonClick
    end
    object DiagramsListView: TListView
      Left = 12
      Top = 72
      Width = 485
      Height = 133
      BevelInner = bvLowered
      Checkboxes = True
      Columns = <
        item
          AutoSize = True
          Caption = 'Name'
        end
        item
          AutoSize = True
          Caption = 'Path'
        end>
      ReadOnly = True
      TabOrder = 3
      ViewStyle = vsReport
    end
    object SelectAllButton: TButton
      Left = 316
      Top = 212
      Width = 88
      Height = 23
      Caption = 'Select All'
      TabOrder = 4
      OnClick = SelectAllButtonClick
    end
    object DeselectAllButton: TButton
      Left = 409
      Top = 212
      Width = 88
      Height = 23
      Caption = 'Deselect All'
      TabOrder = 5
      OnClick = DeselectAllButtonClick
    end
  end
  object HelpButton: TButton
    Left = 426
    Top = 452
    Width = 88
    Height = 23
    Caption = '&Help'
    TabOrder = 6
    OnClick = HelpButtonClick
  end
  object PrinterSetupDialog: TPrinterSetupDialog
    Left = 372
    Top = 52
  end
end
