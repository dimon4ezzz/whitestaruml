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
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object TitleLabel: TLabel
    Left = 8
    Top = 40
    Width = 61
    Height = 12
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
    Width = 62
    Height = 12
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
    Width = 70
    Height = 12
    Caption = 'Descriptions'
  end
  object PropertyInspector: TdxInspector
    Left = 8
    Top = 56
    Width = 361
    Height = 233
    Color = clWindow
    TabOrder = 0
    DividerPos = 159
    GridColor = clBtnFace
    PaintStyle = ipsNET
    OnChangeNode = PropertyInspectorChangeNode
    OnEdited = PropertyInspectorEdited
    Data = {
      BE0100000200000008000000040000000F0000005374616E64617264496E666F
      526F770800000000000000070000004E616D65526F7708000000000000000800
      000047726F7570526F7708000000000000000B00000043617465676F7279526F
      7708000000000000000E0000004465736372697074696F6E526F77080000000A
      0000000D00000044657461696C496E666F526F7708000000000000000F000000
      446F63756D656E7454797065526F77080000000000000009000000466F726D61
      74526F7708000000000000000A00000056657273696F6E526F77080000000000
      00000B00000050726F66696C6573526F7708000000000000000B000000417070
      726F616368526F770800000000000000110000005472616E736C61746F725479
      7065526F770800000000000000110000005472616E736C61746F724E616D6552
      6F7708000000000000000900000053616D706C65526F7708000000000000000D
      000000506172616D6574657273526F7708000000000000000E00000041747461
      636846696C6573526F7702000000080000001890C00D0F0000005374616E6461
      7264496E666F526F77080000001890C00D0D00000044657461696C496E666F52
      6F77}
    object NameRow: TdxInspectorTextRow
      Caption = 'Template Name'
    end
    object GroupRow: TdxInspectorTextPickRow
      Caption = 'Group'
    end
    object CategoryRow: TdxInspectorTextPickRow
      Caption = 'Category'
    end
    object VersionRow: TdxInspectorTextRow
      Caption = 'Version'
    end
    object DescriptionRow: TdxInspectorTextPopupRow
      Caption = 'Description'
      ReadOnly = True
      PopupControl = DescMemo
      OnCloseUp = DescriptionRowCloseUp
      OnPopup = DescriptionRowPopup
    end
    object DocumentTypeRow: TdxInspectorTextPickRow
      Caption = 'Document Type'
      DropDownListStyle = True
      Items.Strings = (
        'DOCUMENT'
        'REPORT'
        'CODE')
      ImmediateDropDown = False
      Text = 'DOCUMENT'
    end
    object FormatRow: TdxInspectorTextPickRow
      Caption = 'Format'
      ImmediateDropDown = False
    end
    object TranslatorTypeRow: TdxInspectorTextPickRow
      Caption = 'Translator Type'
      DropDownListStyle = True
      Items.Strings = (
        'WORD'
        'EXCEL'
        'POWERPOINT'
        'TEXT'
        'COM'
        'SCRIPT'
        'EXE')
      ImmediateDropDown = False
      OnCloseUp = TranslatorTypeRowCloseUp
      Text = 'WORD'
    end
    object TranslatorNameRow: TdxInspectorTextButtonRow
      Caption = 'Translator'
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = TranslatorNameRowButtonClick
    end
    object SampleRow: TdxInspectorTextButtonRow
      Caption = 'Example'
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = SampleRowButtonClick
    end
    object TutorialRow: TdxInspectorTextButtonRow
      Caption = #53916#53664#47532#50620
      Visible = False
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = TutorialRowButtonClick
    end
    object ValidatorRow: TdxInspectorTextButtonRow
      Caption = 'Model Validator'
      Visible = False
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = ValidatorRowButtonClick
    end
    object PreviewsRow: TdxInspectorTextButtonRow
      Caption = 'Preview'
      ReadOnly = True
      Visible = False
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = PreviewsRowButtonClick
      Text = '(Collection)[0]'
    end
    object ParametersRow: TdxInspectorTextButtonRow
      Caption = 'Parameters'
      ReadOnly = True
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = ParametersRowButtonClick
      Text = '(Collection)[0]'
    end
    object AttachFilesRow: TdxInspectorTextButtonRow
      Caption = 'Related files'
      ReadOnly = True
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = AttachFilesRowButtonClick
      Text = '(Collection)[0]'
    end
    object DetailInfoRow: TdxInspectorTextRow
      Caption = 'Detail'
      IsCategory = True
    end
    object StandardInfoRow: TdxInspectorTextRow
      Caption = 'Basic'
      IsCategory = True
    end
    object ApproachRow: TdxInspectorTextPickRow
      Caption = 'Related Approach'
      ImmediateDropDown = False
    end
    object ProfilesRow: TdxInspectorTextButtonRow
      Caption = 'Related Profile'
      ReadOnly = True
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = ProfilesRowButtonClick
      Text = '(Collection)[0]'
    end
  end
  object AcceptButton: TButton
    Left = 180
    Top = 380
    Width = 90
    Height = 23
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 276
    Top = 380
    Width = 90
    Height = 23
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object DescMemo: TMemo
    Left = -56
    Top = 384
    Width = 225
    Height = 161
    ImeName = 'Microsoft IME 2003'
    TabOrder = 3
    Visible = False
    WantTabs = True
  end
  object PathEdit: TEdit
    Left = 80
    Top = 13
    Width = 265
    Height = 20
    ImeName = 'Microsoft IME 2003'
    TabOrder = 4
  end
  object GenerationUnitDescPanel: TFlatPanel
    Left = 7
    Top = 313
    Width = 362
    Height = 49
    TabOrder = 5
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
  object OpenDialog: TOpenDialog
    Filter = #47784#46304' '#54028#51068'(*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = #54028#51068' '#50676#44592
    Left = 128
    Top = 32
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'tdf'
    Filter = #53596#54540#47551' '#51221#51032' '#54028#51068'(*.tdf)|*.tdf|'#47784#46304' '#54028#51068'(*.*)|*.*'
    Left = 224
    Top = 32
  end
  object OpenScriptDialog: TOpenDialog
    DefaultExt = 'js'
    Filter = #49828#53356#47549#53944' '#54028#51068'(*.js;*.vbs)|*.js;*.vbs|'#47784#46304' '#54028#51068'(*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = #49373#49457#44592' '#51648#51221
    Left = 160
    Top = 32
  end
  object OpenExeDialog: TOpenDialog
    DefaultExt = 'js'
    Filter = #49892#54665' '#54028#51068'(*.exe)|*.exe|'#47784#46304' '#54028#51068'(*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = #49373#49457#44592' '#51648#51221
    Left = 192
    Top = 32
  end
end
