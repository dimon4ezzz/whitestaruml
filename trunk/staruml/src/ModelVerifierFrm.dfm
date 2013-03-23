object ModelVerifierForm: TModelVerifierForm
  Left = 330
  Top = 266
  BorderStyle = bsDialog
  Caption = 'Verify Model'
  ClientHeight = 214
  ClientWidth = 519
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
  object ClientPanel: TPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 214
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      519
      214)
    object VerificationFailedLabel: TLabel
      Left = 12
      Top = 148
      Width = 89
      Height = 12
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Failed:'
    end
    object VerifyingRuleLabel: TLabel
      Left = 12
      Top = 76
      Width = 89
      Height = 12
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Verification Rule:'
    end
    object VerifyingElementLabel: TLabel
      Left = 12
      Top = 100
      Width = 89
      Height = 12
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Verifying Element:'
    end
    object VerificationProgressLabel: TLabel
      Left = 12
      Top = 124
      Width = 89
      Height = 12
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Progress:'
    end
    object Bevel1: TBevel
      Left = 0
      Top = 175
      Width = 519
      Height = 39
      Align = alBottom
      Shape = bsTopLine
    end
    object VerifyButton: TButton
      Left = 234
      Top = 185
      Width = 88
      Height = 23
      Anchors = [akRight, akBottom]
      Caption = 'Verify'
      Default = True
      TabOrder = 0
      OnClick = VerifyButtonClick
    end
    object VerificationProgressBar: TProgressBar
      Left = 108
      Top = 124
      Width = 401
      Height = 16
      Position = 35
      TabOrder = 3
    end
    object HelpButton: TButton
      Left = 420
      Top = 185
      Width = 88
      Height = 23
      Anchors = [akRight, akBottom]
      Caption = '&Help'
      TabOrder = 2
      OnClick = HelpButtonClick
    end
    object CloseButton: TButton
      Left = 327
      Top = 185
      Width = 88
      Height = 23
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Close'
      ModalResult = 2
      TabOrder = 1
      OnClick = CloseButtonClick
    end
    object VerificationFailedCountLabel: TStaticText
      Left = 108
      Top = 148
      Width = 401
      Height = 16
      AutoSize = False
      BevelKind = bkFlat
      TabOrder = 4
    end
    object VerifyingRuleNameLabel: TStaticText
      Left = 108
      Top = 76
      Width = 401
      Height = 16
      AutoSize = False
      BevelKind = bkFlat
      TabOrder = 5
    end
    object VerifyingElementNameLabel: TStaticText
      Left = 108
      Top = 100
      Width = 401
      Height = 16
      AutoSize = False
      BevelKind = bkFlat
      TabOrder = 6
    end
    object TopPicturePanel: TPanel
      Left = 0
      Top = 0
      Width = 519
      Height = 61
      Align = alTop
      Color = clWhite
      TabOrder = 7
      object TitleLabel: TLabel
        Left = 8
        Top = 12
        Width = 70
        Height = 13
        Caption = 'Verify Model'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DescLabel: TLabel
        Left = 8
        Top = 36
        Width = 402
        Height = 13
        Caption = 
          'Your model will be verified based on well-formedness rules in th' +
          'e UML specifications.'
      end
    end
  end
end
