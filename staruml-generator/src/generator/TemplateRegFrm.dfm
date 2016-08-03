object TemplateRegisterForm: TTemplateRegisterForm
  Left = 272
  Top = 135
  BorderStyle = bsDialog
  Caption = 'Register Template'
  ClientHeight = 410
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = 14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object TitleLabel: TLabel
    Left = 8
    Top = 40
    Width = 59
    Height = 14
    Caption = 'Properties:'
  end
  object Bevel: TBevel
    Left = 8
    Top = 368
    Width = 361
    Height = 6
    Shape = bsTopLine
  end
  object PathLabel: TLabel
    Left = 8
    Top = 16
    Width = 56
    Height = 14
    Caption = 'File Name:'
    Color = clBtnFace
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
  end
  object PathButton: TSpeedButton
    Left = 344
    Top = 13
    Width = 23
    Height = 22
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C000000000000000000000000000000000000000000001F7C1F7C
      1F7C1F7C1F7C0000000000420042004200420042004200420042004200001F7C
      1F7C1F7C1F7C0000E07F00000042004200420042004200420042004200420000
      1F7C1F7C1F7C0000FF7FE07F0000004200420042004200420042004200420042
      00001F7C1F7C0000E07FFF7FE07F000000420042004200420042004200420042
      004200001F7C0000FF7FE07FFF7FE07F00000000000000000000000000000000
      0000000000000000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F00001F7C1F7C
      1F7C1F7C1F7C0000FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F00001F7C1F7C
      1F7C1F7C1F7C0000E07FFF7FE07F00000000000000000000000000001F7C1F7C
      1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
      000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C0000
      1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C}
    OnClick = PathButtonClick
  end
  object DescriptionLabel: TLabel
    Left = 8
    Top = 296
    Width = 65
    Height = 14
    Caption = 'Descriptions'
  end
  object AcceptButton: TButton
    Left = 180
    Top = 380
    Width = 90
    Height = 23
    Caption = '&OK'
    TabOrder = 0
    OnClick = AcceptButtonClick
  end
  object CancelButton: TButton
    Left = 276
    Top = 380
    Width = 90
    Height = 23
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object PathEdit: TEdit
    Left = 73
    Top = 13
    Width = 265
    Height = 22
    TabOrder = 3
    OnChange = PathEditChange
  end
  object GenerationUnitDescPanel: TFlatPanel
    Left = 7
    Top = 313
    Width = 362
    Height = 49
    TabOrder = 2
    object GenerationUnitDescMemo: TMemo
      Left = 1
      Top = 3
      Width = 346
      Height = 39
      BorderStyle = bsNone
      Color = clBtnFace
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object PropertyInspector: TNextInspector6
    Left = 8
    Top = 60
    Width = 361
    Height = 230
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    TabStop = True
    BorderSize = 1
    OnVerticalScroll = PropertyInspectorVerticalScroll
    Options = [ioCanSelectNone, ioPreviewPopup, ioSplitterMoving]
    OnSelect = PropertyInspectorSelect
    object StandardInfoRow: TNxInspectorNode6
      Caption = 'Basic'
      CaptionFont.Charset = ANSI_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = 14
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      Index = 0
      Padding.Left = 2
      Padding.Right = 2
      ParentCaptionFont = False
      ReadOnly = True
      ValueFont.Charset = ANSI_CHARSET
      ValueFont.Color = clWindowText
      ValueFont.Height = 14
      ValueFont.Name = 'Tahoma'
      ValueFont.Style = []
      object NameRow: TNxInspectorNode6
        Caption = 'Template Name'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 0
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnValueChanged = NameOrGroupRowValueChanged
      end
      object GroupRow: TNxComboBoxInspectorNode6
        Caption = 'Group'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 1
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnValueChanged = NameOrGroupRowValueChanged
      end
      object CategoryRow: TNxComboBoxInspectorNode6
        Caption = 'Category'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 2
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnValueChanged = AnyRowValueChanged
      end
      object DescriptionRow: TNxMemoInspectorNode6
        Caption = 'Description'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 3
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
      end
    end
    object DetailInfoRow: TNxInspectorNode6
      Caption = 'Detail'
      CaptionColor = clMoneyGreen
      CaptionFont.Charset = ANSI_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = 14
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      DefaultValue = '(must be filled)'
      Index = 1
      Padding.Left = 2
      Padding.Right = 2
      ParentCaptionFont = False
      ReadOnly = True
      ValueFont.Charset = ANSI_CHARSET
      ValueFont.Color = clWindowText
      ValueFont.Height = 14
      ValueFont.Name = 'Tahoma'
      ValueFont.Style = []
      object DocumentTypeRow: TNxComboBoxInspectorNode6
        Caption = 'Document Type'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 0
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnValueChanged = AnyRowValueChanged
        Lines.Strings = (
          'DOCUMENT'
          'REPORT'
          'CODE')
      end
      object FormatRow: TNxComboBoxInspectorNode6
        Caption = 'Format'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 1
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnValueChanged = AnyRowValueChanged
      end
      object VersionRow: TNxInspectorNode6
        Caption = 'Version'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 2
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
      end
      object ProfilesRow: TNxButtonInspectorNode6
        Caption = 'Related Profile'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 3
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnButtonClick = ProfilesRowButtonClick
      end
      object ApproachRow: TNxComboBoxInspectorNode6
        Caption = 'Related Approach'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 4
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
      end
      object TranslatorTypeRow: TNxComboBoxInspectorNode6
        Caption = 'Translator Type'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 5
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnValueChanged = TranslatorTypeRowValueChanged
        Lines.Strings = (
          'WORD'
          'EXCEL'
          'POWERPOINT'
          'TEXT'
          'COM'
          'SCRIPT'
          'EXE')
      end
      object TranslatorNameRow: TNxButtonInspectorNode6
        Caption = 'Translator'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 6
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnValueChanged = AnyRowValueChanged
        OnButtonClick = TranslatorNameRowButtonClick
      end
      object SampleRow: TNxButtonInspectorNode6
        Caption = 'Example'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 7
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnButtonClick = SampleRowButtonClick
      end
      object TutorialRow: TNxButtonInspectorNode6
        Caption = 'Tutorial'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 8
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnButtonClick = TutorialRowButtonClick
      end
      object ValidatorRow: TNxButtonInspectorNode6
        Caption = 'Model Validator'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 9
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnButtonClick = ValidatorRowButtonClick
      end
      object PreviewsRow: TNxButtonInspectorNode6
        Caption = 'Preview'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 10
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnButtonClick = PreviewsRowButtonClick
      end
      object ParametersRow: TNxButtonInspectorNode6
        Caption = 'Parameters'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 11
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnButtonClick = ParametersRowButtonClick
      end
      object AttachFilesRow: TNxButtonInspectorNode6
        Caption = 'Related files'
        CaptionFont.Charset = ANSI_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = 14
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Index = 12
        Padding.Left = 2
        Padding.Right = 2
        ParentCaptionFont = False
        ValueFont.Charset = ANSI_CHARSET
        ValueFont.Color = clWindowText
        ValueFont.Height = 14
        ValueFont.Name = 'Tahoma'
        ValueFont.Style = []
        OnButtonClick = AttachFilesRowButtonClick
      end
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'All files(*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Open file'
    Left = 96
    Top = 32
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'tdf'
    Filter = 'Template files(*.tdf)|*.tdf|All files(*.*)|*.*'
    Title = 'Save template'
    Left = 272
    Top = 32
  end
  object OpenScriptDialog: TOpenDialog
    DefaultExt = 'js'
    Filter = 'Script files(*.js;*.vbs)|*.js;*.vbs|All files(*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Open script'
    Left = 160
    Top = 32
  end
  object OpenExeDialog: TOpenDialog
    DefaultExt = 'js'
    Filter = 'Executables(*.exe)|*.exe|All files(*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Open executable'
    Left = 216
    Top = 32
  end
end
