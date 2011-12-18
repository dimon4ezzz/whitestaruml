object AddInMgrForm: TAddInMgrForm
  Left = 325
  Top = 250
  BorderStyle = bsDialog
  Caption = 'Add-In Manager'
  ClientHeight = 220
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    396
    220)
  PixelsPerInch = 96
  TextHeight = 13
  object DescLabel: TLabel
    Left = 13
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Add-Ins'
  end
  object SepBevel: TBevel
    Left = 9
    Top = 176
    Width = 378
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object AddInListView: TListView
    Left = 9
    Top = 24
    Width = 379
    Height = 145
    Anchors = [akLeft, akTop, akRight]
    Checkboxes = True
    Columns = <
      item
        AutoSize = True
        Caption = 'Name'
      end
      item
        AutoSize = True
        Caption = 'Version'
      end>
    ReadOnly = True
    ParentShowHint = False
    ShowHint = True
    SmallImages = AddInImages
    TabOrder = 0
    ViewStyle = vsReport
  end
  object OKButton: TButton
    Left = 115
    Top = 188
    Width = 88
    Height = 23
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 208
    Top = 188
    Width = 88
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object HelpButton: TButton
    Left = 301
    Top = 188
    Width = 88
    Height = 23
    Caption = '&Help'
    TabOrder = 3
    OnClick = HelpButtonClick
  end
  object AddInImages: TImageList
    Left = 64
    Top = 184
  end
end
