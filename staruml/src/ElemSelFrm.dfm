object ElementSelectorForm: TElementSelectorForm
  Left = 510
  Top = 315
  BorderStyle = bsDialog
  Caption = 'Select Element'
  ClientHeight = 365
  ClientWidth = 406
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    406
    365)
  PixelsPerInch = 96
  TextHeight = 13
  object SepBevel: TBevel
    Left = 7
    Top = 324
    Width = 390
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object DataTypeLabel: TLabel
    Left = 8
    Top = 232
    Width = 59
    Height = 13
    Caption = '&Data Types:'
    FocusControl = DataTypeComboBox
  end
  object OKButton: TButton
    Left = 124
    Top = 336
    Width = 88
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 3
  end
  object CancelButton: TButton
    Left = 217
    Top = 336
    Width = 88
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object ElementTreeViewPanel: TPanel
    Left = 8
    Top = 8
    Width = 389
    Height = 217
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 5
    inline ModelExplorer: TModelExplorerPanel
      Left = 0
      Top = 0
      Width = 389
      Height = 217
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 389
      ExplicitHeight = 217
      inherited ClientPanel: TFlatPanel
        Width = 389
        Height = 191
        ExplicitWidth = 389
        ExplicitHeight = 217
        inherited ModelTree: TVirtualStringTree
          Width = 387
          Height = 189
          ExplicitWidth = 387
          ExplicitHeight = 189
        end
      end
      inherited ModelExplorerToolbar: TToolBar
        Width = 389
        ExplicitWidth = 387
      end
    end
  end
  object NotSpecCheckBox: TCheckBox
    Left = 8
    Top = 276
    Width = 121
    Height = 17
    Caption = 'Do &not specify'
    TabOrder = 1
    OnClick = NotSpecCheckBoxClick
  end
  object DataTypeComboBox: TComboBox
    Left = 8
    Top = 248
    Width = 389
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ImeName = 'Korean(Hangul) (MS-IME98)'
    TabOrder = 0
    OnChange = DataTypeComboBoxChange
  end
  object StaticText: TStaticText
    Left = 8
    Top = 300
    Width = 389
    Height = 16
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BevelKind = bkFlat
    TabOrder = 2
  end
  object HelpButton: TButton
    Left = 310
    Top = 336
    Width = 88
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = '&Help'
    TabOrder = 6
    OnClick = HelpButtonClick
  end
end
