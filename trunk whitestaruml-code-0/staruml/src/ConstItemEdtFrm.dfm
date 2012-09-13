object ConstraintItemEditForm: TConstraintItemEditForm
  Left = 225
  Top = 188
  BorderStyle = bsDialog
  Caption = 'Constraint'
  ClientHeight = 246
  ClientWidth = 445
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
    445
    246)
  PixelsPerInch = 96
  TextHeight = 13
  object NameLabel: TLabel
    Left = 8
    Top = 12
    Width = 31
    Height = 13
    Caption = '&Name:'
    FocusControl = NameEdit
  end
  object BodyLabel: TLabel
    Left = 8
    Top = 56
    Width = 28
    Height = 13
    Caption = '&Body:'
    FocusControl = BodyMemo
  end
  object Bevel1: TBevel
    Left = 8
    Top = 204
    Width = 429
    Height = 9
    Shape = bsTopLine
  end
  object OKButton: TButton
    Left = 252
    Top = 214
    Width = 88
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 2
  end
  object CancelButton: TButton
    Left = 348
    Top = 214
    Width = 88
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object BodyMemo: TMemo
    Left = 8
    Top = 72
    Width = 429
    Height = 125
    TabOrder = 1
    OnChange = BodyMemoChange
  end
  object NameEdit: TEdit
    Left = 8
    Top = 28
    Width = 429
    Height = 21
    TabOrder = 0
    OnChange = NameEditChange
  end
end
