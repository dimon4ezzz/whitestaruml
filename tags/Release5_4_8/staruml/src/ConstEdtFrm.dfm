object ConstraintEditorForm: TConstraintEditorForm
  Left = 339
  Top = 272
  BorderStyle = bsSingle
  Caption = 'Constraint Editor'
  ClientHeight = 252
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    509
    252)
  PixelsPerInch = 96
  TextHeight = 13
  object ConstraintsLabel: TLabel
    Left = 8
    Top = 8
    Width = 59
    Height = 13
    Caption = '&Constraints:'
    FocusControl = ConstraintsListView
  end
  object Bevel1: TBevel
    Left = 8
    Top = 212
    Width = 497
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object CloseButton: TButton
    Left = 323
    Top = 220
    Width = 88
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    Default = True
    TabOrder = 6
    OnClick = CloseButtonClick
  end
  object AddButton: TButton
    Left = 8
    Top = 180
    Width = 96
    Height = 23
    Caption = '&Add'
    TabOrder = 1
    OnClick = AddButtonClick
  end
  object DeleteButton: TButton
    Left = 108
    Top = 180
    Width = 96
    Height = 23
    Caption = '&Delete'
    TabOrder = 2
    OnClick = DeleteButtonClick
  end
  object EditButton: TButton
    Left = 208
    Top = 180
    Width = 96
    Height = 23
    Caption = '&Edit'
    TabOrder = 3
    OnClick = EditButtonClick
  end
  object MoveUpButton: TButton
    Left = 308
    Top = 180
    Width = 96
    Height = 23
    Caption = 'Move &Up'
    TabOrder = 4
    OnClick = MoveUpButtonClick
  end
  object MoveDownButton: TButton
    Left = 408
    Top = 180
    Width = 96
    Height = 23
    Caption = 'Move &Down'
    TabOrder = 5
    OnClick = MoveDownButtonClick
  end
  object ConstraintsListView: TListView
    Left = 8
    Top = 24
    Width = 493
    Height = 149
    Anchors = [akLeft, akTop, akRight]
    Columns = <
      item
        Caption = 'Name'
        Width = 150
      end
      item
        AutoSize = True
        Caption = 'Body'
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ConstraintsListViewDblClick
    OnSelectItem = ConstraintsListViewSelectItem
  end
  object HelpButton: TButton
    Left = 416
    Top = 220
    Width = 88
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = '&Help'
    TabOrder = 7
    OnClick = HelpButtonClick
  end
end
