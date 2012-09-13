object StereotypeSelectorForm: TStereotypeSelectorForm
  Left = 308
  Top = 269
  BorderStyle = bsDialog
  Caption = 'Select Stereotype'
  ClientHeight = 269
  ClientWidth = 417
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
  PixelsPerInch = 96
  TextHeight = 13
  object DescLabel: TLabel
    Left = 7
    Top = 148
    Width = 57
    Height = 13
    Caption = 'Description:'
  end
  object IconLabel: TLabel
    Left = 300
    Top = 13
    Width = 66
    Height = 13
    Caption = 'Icon preview:'
  end
  object StereotypeLabel: TLabel
    Left = 7
    Top = 12
    Width = 63
    Height = 13
    Caption = '&Stereotypes:'
    FocusControl = StereotypeEdit
  end
  object StereotypeTitleLabel: TLabel
    Left = 67
    Top = 148
    Width = 74
    Height = 13
    Caption = 'StereotypeTitle'
  end
  object Bevel: TBevel
    Left = 7
    Top = 232
    Width = 402
    Height = 9
    Shape = bsTopLine
  end
  object OKButton: TButton
    Left = 135
    Top = 240
    Width = 88
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 228
    Top = 240
    Width = 88
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object IconPanel: TPanel
    Left = 300
    Top = 28
    Width = 110
    Height = 110
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 3
    object IconPreviewImage: TImage
      Left = 2
      Top = 2
      Width = 106
      Height = 106
      Align = alClient
      Center = True
    end
  end
  object DescPanel: TFlatPanel
    Left = 7
    Top = 164
    Width = 402
    Height = 61
    TabOrder = 0
    DesignSize = (
      402
      61)
    object DescMemo: TMemo
      Left = 7
      Top = 6
      Width = 389
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
  end
  object StereotypeEdit: TEdit
    Left = 7
    Top = 28
    Width = 287
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvRaised
    TabOrder = 4
    OnChange = StereotypeEditChange
    OnKeyDown = StereotypeEditKeyDown
    OnKeyPress = StereotypeEditKeyPress
  end
  object StereotypeListView: TListView
    Left = 7
    Top = 52
    Width = 287
    Height = 86
    BevelInner = bvNone
    BevelOuter = bvRaised
    Columns = <
      item
        Caption = 'Stereotype'
        Width = 120
      end
      item
        Caption = 'Profile'
        Width = 130
      end>
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ShowColumnHeaders = False
    SortType = stText
    TabOrder = 5
    ViewStyle = vsReport
    OnSelectItem = StereotypeListViewSelectItem
  end
  object HelpButton: TButton
    Left = 321
    Top = 240
    Width = 88
    Height = 23
    Caption = '&Help'
    TabOrder = 6
    OnClick = HelpButtonClick
  end
end
