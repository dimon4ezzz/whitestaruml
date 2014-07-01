object TemplateRegisterForm: TTemplateRegisterForm
  Left = 272
  Top = 135
  BorderStyle = bsDialog
  Caption = 'Register Template'
  ClientHeight = 410
  ClientWidth = 376
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
    Height = 9
    Shape = bsTopLine
  end
  object PathLabel: TLabel
    Left = 8
    Top = 16
    Width = 56
    Height = 14
    Caption = 'File Name:'
  end
  object PathButton: TSpeedButton
    Left = 347
    Top = 12
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
  object Label1: TLabel
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
    Default = True
    ModalResult = 1
    TabOrder = 0
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
  object DescMemo: TMemo
    Left = -56
    Top = 384
    Width = 225
    Height = 161
    ImeName = 'Microsoft IME 2003'
    TabOrder = 2
    Visible = False
    WantTabs = True
  end
  object PathEdit: TEdit
    Left = 80
    Top = 13
    Width = 265
    Height = 22
    ImeName = 'Microsoft IME 2003'
    TabOrder = 4
  end
  object GenerationUnitDescPanel: TFlatPanel
    Left = 7
    Top = 313
    Width = 362
    Height = 49
    TabOrder = 3
    object GenerationUnitDescMemo: TMemo
      Left = 7
      Top = 5
      Width = 346
      Height = 39
      BorderStyle = bsNone
      Color = clBtnFace
      Ctl3D = True
      ImeName = 'Microsoft IME 2003'
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object PropertyInspector: TNextInspector
    Left = 8
    Top = 57
    Width = 361
    Height = 233
    SplitterPosition = 150
    TabOrder = 5
    OnSelectItem = PropertyInspectorSelectItem
    object StandardInfoRow: TNxTextItem
      Caption = 'Basic'
      ReadOnly = True
      ParentIndex = -1
      object NameRow: TNxTextItem
        Caption = 'Template Name'
        ParentIndex = 0
      end
      object GroupRow: TNxComboBoxItem
        Caption = 'Group'
        ParentIndex = 0
      end
      object CategoryRow: TNxComboBoxItem
        Caption = 'Category'
        ParentIndex = 0
      end
      object DescriptionRow: TNxMemoItem
        Caption = 'Description'
        ItemHeight = 48
        TransparentColor = clNone
        ParentIndex = 0
      end
    end
    object DetailInfoRow: TNxTextItem
      Caption = 'Detail'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ReadOnly = True
      ValueFont.Charset = ANSI_CHARSET
      ValueFont.Color = clWindowText
      ValueFont.Height = -12
      ValueFont.Name = #44404#47548
      ValueFont.Style = []
      ParentIndex = -1
      object DocumentTypeRow: TNxComboBoxItem
        Caption = 'Document Type'
        Value = 'DOCUMENT'
        Lines.Strings = (
          'DOCUMENT'
          'REPORT'
          'CODE')
        ParentIndex = 5
      end
      object FormatRow: TNxComboBoxItem
        Caption = 'Format'
        ParentIndex = 5
      end
      object VersionRow: TNxTextItem
        Caption = 'Version'
        ParentIndex = 5
      end
      object ProfilesRow: TNxButtonItem
        Caption = 'Related Profile'
        EditOptions = [epDisablePaste, epDisableTyping]
        TransparentColor = clNone
        OnButtonClick = ProfilesRowButtonClick
        ParentIndex = 5
      end
      object ApproachRow: TNxComboBoxItem
        Caption = 'Related Approach'
        ParentIndex = 5
      end
      object TranslatorTypeRow: TNxComboBoxItem
        Caption = 'Translator Type'
        Lines.Strings = (
          'WORD'
          'EXCEL'
          'POWERPOINT'
          'TEXT'
          'COM'
          'SCRIPT'
          'EXE')
        ParentIndex = 5
      end
      object TranslatorNameRow: TNxButtonItem
        Caption = 'Translator'
        TransparentColor = clNone
        ParentIndex = 5
      end
      object SampleRow: TNxButtonItem
        Caption = 'Example'
        TransparentColor = clNone
        OnButtonClick = SampleRowButtonClick
        ParentIndex = 5
      end
      object TutorialRow: TNxButtonItem
        Caption = 'Tutorial'
        Visible = False
        TransparentColor = clNone
        OnButtonClick = TutorialRowButtonClick
        ParentIndex = 5
      end
      object ValidatorRow: TNxButtonItem
        Caption = 'Model Validator'
        Visible = False
        TransparentColor = clNone
        ParentIndex = 5
      end
      object PreviewsRow: TNxButtonItem
        Caption = 'Preview'
        ReadOnly = True
        Visible = False
        EditOptions = [epDisablePaste, epDisableTyping]
        TransparentColor = clNone
        OnButtonClick = PreviewsRowButtonClick
        ParentIndex = 5
      end
      object ParametersRow: TNxButtonItem
        Caption = 'Parameters'
        Value = '(Collection)[0]'
        EditOptions = [epDisablePaste, epDisableTyping]
        TransparentColor = clNone
        OnButtonClick = ParametersRowButtonClick
        ParentIndex = 5
      end
      object AttachFilesRow: TNxButtonItem
        Caption = 'Related files'
        Value = '(Collection)[0]'
        EditOptions = [epDisablePaste, epDisableTyping]
        TransparentColor = clNone
        OnButtonClick = AttachFilesRowButtonClick
        ParentIndex = 5
      end
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'All files(*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = #54028#51068' '#50676#44592
    Left = 128
    Top = 32
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'tdf'
    Filter = 'Template files(*.tdf)|*.tdf|All files(*.*)|*.*'
    Left = 224
    Top = 32
  end
  object OpenScriptDialog: TOpenDialog
    DefaultExt = 'js'
    Filter = 'Script files(*.js;*.vbs)|*.js;*.vbs|All files(*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = #49373#49457#44592' '#51648#51221
    Left = 160
    Top = 32
  end
  object OpenExeDialog: TOpenDialog
    DefaultExt = 'js'
    Filter = 'Executables(*.exe)|*.exe|All files(*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = #49373#49457#44592' '#51648#51221
    Left = 192
    Top = 32
  end
end
