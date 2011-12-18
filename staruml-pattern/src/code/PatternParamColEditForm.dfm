object PatternParamColEditFrm: TPatternParamColEditFrm
  Left = 307
  Top = 320
  BorderStyle = bsDialog
  Caption = 'Element List'
  ClientHeight = 193
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object CloseButton: TButton
    Left = 320
    Top = 164
    Width = 95
    Height = 23
    Cancel = True
    Caption = '&Close'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object BasePanel: TPanel
    Left = 5
    Top = 5
    Width = 420
    Height = 151
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 1
    object AddButton: TButton
      Left = 7
      Top = 7
      Width = 66
      Height = 23
      Caption = '&Add'
      TabOrder = 0
      OnClick = AddButtonClick
    end
    object RemoveButton: TButton
      Left = 7
      Top = 33
      Width = 66
      Height = 23
      Caption = '&Remove'
      TabOrder = 1
      OnClick = RemoveButtonClick
    end
    object ElementListView: TListView
      Left = 80
      Top = 7
      Width = 333
      Height = 137
      Columns = <
        item
          Caption = 'Element name'
          Width = 100
        end
        item
          Caption = 'Path'
          Width = 225
        end>
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
    end
  end
end
