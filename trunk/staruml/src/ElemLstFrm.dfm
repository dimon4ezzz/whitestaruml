object ElementListForm: TElementListForm
  Left = 263
  Top = 201
  BorderStyle = bsDialog
  Caption = 'Element List'
  ClientHeight = 253
  ClientWidth = 516
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
  DesignSize = (
    516
    253)
  PixelsPerInch = 96
  TextHeight = 13
  object SepBevel: TBevel
    Left = 8
    Top = 216
    Width = 497
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object OKButton: TButton
    Left = 231
    Top = 224
    Width = 88
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 324
    Top = 224
    Width = 88
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object NotSpecCheckBox: TCheckBox
    Left = 8
    Top = 196
    Width = 125
    Height = 17
    Caption = 'Do &not specify'
    TabOrder = 0
    OnClick = NotSpecCheckBoxClick
  end
  object HelpButton: TButton
    Left = 417
    Top = 224
    Width = 88
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = '&Help'
    TabOrder = 3
    OnClick = HelpButtonClick
  end
  object ElementListView: TListView
    Left = 9
    Top = 9
    Width = 495
    Height = 179
    BorderWidth = 3
    Columns = <>
    ReadOnly = True
    RowSelect = True
    TabOrder = 4
    ViewStyle = vsList
    OnClick = ElementListViewClick
    OnDblClick = ElementListViewDblClick
  end
end
