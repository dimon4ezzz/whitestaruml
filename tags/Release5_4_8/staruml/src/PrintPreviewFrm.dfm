object PrintPreviewForm: TPrintPreviewForm
  Left = 265
  Top = 118
  Caption = 'Print Preview'
  ClientHeight = 562
  ClientWidth = 784
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PreviewScrollBox: TScrollBox
    Left = 0
    Top = 27
    Width = 784
    Height = 535
    Align = alClient
    Color = clAppWorkSpace
    ParentColor = False
    TabOrder = 0
    object LeftImage: TImage
      Left = 10
      Top = 10
      Width = 103
      Height = 151
      AutoSize = True
      Constraints.MinHeight = 10
      Constraints.MinWidth = 10
      ParentShowHint = False
      Proportional = True
      ShowHint = False
    end
    object RightImage: TImage
      Left = 122
      Top = 10
      Width = 103
      Height = 151
      AutoSize = True
      Constraints.MinHeight = 10
      Constraints.MinWidth = 10
      ParentShowHint = False
      Proportional = True
      ShowHint = False
    end
  end
  object MenusPanel: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object PageLabel: TLabel
      Left = 241
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Page: '
    end
    object TotalPageNumLabel: TLabel
      Left = 446
      Top = 8
      Width = 4
      Height = 13
      Caption = '/'
    end
    object PrintButton: TButton
      Left = 1
      Top = 2
      Width = 75
      Height = 23
      Caption = '&Print'
      TabOrder = 0
      OnClick = PrintButtonClick
      OnKeyDown = FormKeyDown
    end
    object ZoomInButton: TButton
      Left = 640
      Top = 2
      Width = 91
      Height = 23
      Caption = 'Zoom In (Unused)'
      Enabled = False
      TabOrder = 9
      TabStop = False
      Visible = False
      OnClick = ZoomInButtonClick
    end
    object ZoomOutButton: TButton
      Left = 734
      Top = 2
      Width = 87
      Height = 23
      Caption = 'Zoom Out (Unused)'
      Enabled = False
      TabOrder = 10
      TabStop = False
      Visible = False
      OnClick = ZoomOutButtonClick
    end
    object PageNumberCombo: TComboBox
      Left = 393
      Top = 4
      Width = 51
      Height = 21
      TabOrder = 7
      OnChange = PageNumberComboChange
      OnKeyDown = FormKeyDown
    end
    object CloseButton: TButton
      Left = 482
      Top = 2
      Width = 76
      Height = 23
      Cancel = True
      Caption = 'Close'
      Default = True
      TabOrder = 8
      OnClick = CloseButtonClick
      OnKeyDown = FormKeyDown
    end
    object OnePageButton: TButton
      Left = 78
      Top = 2
      Width = 75
      Height = 23
      Caption = '&One page'
      TabOrder = 1
      OnClick = OnePageButtonClick
      OnKeyDown = FormKeyDown
    end
    object TwoPagesButton: TButton
      Left = 155
      Top = 2
      Width = 75
      Height = 23
      Caption = '&Two pages'
      TabOrder = 2
      OnClick = TwoPagesButtonClick
      OnKeyDown = FormKeyDown
    end
    object HelpButton: TButton
      Left = 562
      Top = 2
      Width = 75
      Height = 23
      Caption = '&Help'
      TabOrder = 11
      OnClick = HelpButtonClick
    end
    object FirstPageButton: TButton
      Left = 284
      Top = 2
      Width = 26
      Height = 23
      Caption = '<<'
      TabOrder = 3
      OnClick = FirstPageButtonClick
    end
    object PrevPageButton: TButton
      Left = 311
      Top = 2
      Width = 26
      Height = 23
      Caption = '<'
      TabOrder = 4
      OnClick = PrevPageButtonClick
    end
    object NextPageButton: TButton
      Left = 338
      Top = 2
      Width = 26
      Height = 23
      Caption = '>'
      TabOrder = 5
      OnClick = NextPageButtonClick
    end
    object LastPageButton: TButton
      Left = 365
      Top = 2
      Width = 26
      Height = 23
      Caption = '>>'
      TabOrder = 6
      OnClick = LastPageButtonClick
    end
  end
end
