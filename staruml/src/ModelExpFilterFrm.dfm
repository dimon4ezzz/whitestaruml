object ModelExplorerFilterForm: TModelExplorerFilterForm
  Left = 374
  Top = 280
  BorderStyle = bsDialog
  Caption = 'Filter Elements'
  ClientHeight = 313
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    441
    313)
  PixelsPerInch = 96
  TextHeight = 13
  object HorizonBevel: TBevel
    Left = 8
    Top = 272
    Width = 426
    Height = 13
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object DescLabel: TLabel
    Left = 8
    Top = 8
    Width = 88
    Height = 13
    Caption = '&Elements to show:'
    FocusControl = FilterItemsListView
  end
  object OKButton: TButton
    Left = 159
    Top = 284
    Width = 88
    Height = 23
    Anchors = [akTop, akRight]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelButton: TButton
    Left = 252
    Top = 284
    Width = 88
    Height = 23
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object SelectAllButton: TButton
    Left = 239
    Top = 244
    Width = 95
    Height = 23
    Anchors = [akTop, akRight]
    Caption = 'Select &All'
    TabOrder = 2
    OnClick = SelectAllButtonClick
  end
  object DeselectAllButton: TButton
    Left = 339
    Top = 244
    Width = 95
    Height = 23
    Anchors = [akTop, akRight]
    Caption = 'De&select All'
    TabOrder = 3
    OnClick = DeselectAllButtonClick
  end
  object FilterItemsListView: TListView
    Left = 8
    Top = 24
    Width = 425
    Height = 209
    Anchors = [akLeft, akTop, akRight]
    Checkboxes = True
    Columns = <>
    TabOrder = 4
    ViewStyle = vsList
  end
  object DefaultSettingButton: TButton
    Left = 8
    Top = 284
    Width = 95
    Height = 23
    Caption = 'Set As &Default'
    TabOrder = 5
    OnClick = DefaultSettingButtonClick
  end
  object SelectRelationsButton: TButton
    Left = 8
    Top = 244
    Width = 101
    Height = 23
    Caption = 'Select &Relations'
    TabOrder = 6
    OnClick = SelectRelationsButtonClick
  end
  object DeselectRelationsButton: TButton
    Left = 116
    Top = 244
    Width = 101
    Height = 23
    Caption = 'Deselect Relatio&ns'
    TabOrder = 7
    OnClick = DeselectRelationsButtonClick
  end
  object HelpButton: TButton
    Left = 345
    Top = 284
    Width = 88
    Height = 23
    Anchors = [akTop, akRight]
    Caption = '&Help'
    TabOrder = 8
    OnClick = HelpButtonClick
  end
end
