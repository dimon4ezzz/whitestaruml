object ModelExplorerPanel: TModelExplorerPanel
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object ClientPanel: TFlatPanel
    Left = 0
    Top = 26
    Width = 451
    Height = 278
    Align = alClient
    TabOrder = 0
    object ModelTree: TVirtualStringTree
      Left = 1
      Top = 1
      Width = 449
      Height = 276
      Align = alClient
      BorderStyle = bsNone
      ChangeDelay = 50
      Ctl3D = False
      DragType = dtVCL
      EditDelay = 300
      Header.AutoSizeIndex = 0
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'MS Sans Serif'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = [hoColumnResize, hoDrag]
      ParentCtl3D = False
      TabOrder = 0
      TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
      OnChange = ModelTreeChange
      OnCollapsed = ModelTreeCollapsed
      OnCompareNodes = ModelTreeCompareNodes
      OnDblClick = ModelTreeDblClick
      OnDragOver = ModelTreeDragOver
      OnDragDrop = ModelTreeDragDrop
      OnEditCancelled = ModelTreeEditCancelled
      OnEdited = ModelTreeEdited
      OnEditing = ModelTreeEditing
      OnGetText = ModelTreeGetText
      OnGetImageIndex = ModelTreeGetImageIndex
      OnKeyDown = ModelTreeKeyDown
      OnMouseDown = ModelTreeMouseDown
      OnMouseUp = ModelTreeMouseUp
      OnNewText = ModelTreeNewText
      Columns = <>
    end
  end
  object ModelExplorerToolbar: TToolBar
    Left = 0
    Top = 0
    Width = 451
    Height = 26
    ButtonWidth = 25
    Caption = 'ModelExplorerToolbar'
    Images = ModelExplorerImageList
    TabOrder = 1
    object SortByStorageOrderItem: TToolButton
      Left = 0
      Top = 0
      Hint = 'Storage Order'
      Caption = 'Storage Order'
      Grouped = True
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = SortItemClick
    end
    object SortByAlphabeticOrderItem: TToolButton
      Left = 25
      Top = 0
      Hint = 'Alphabetic Order'
      Caption = 'Alphabetic Order'
      Grouped = True
      ImageIndex = 1
      OnClick = SortItemClick
    end
    object SeparatorItem1: TToolButton
      Left = 50
      Top = 0
      Width = 8
      Caption = 'SeparatorItem1'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object FilterElementsItem: TToolButton
      Left = 58
      Top = 0
      Hint = 'Filter Elements'
      Caption = 'Filter Elements'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = FilterElementsItemClick
    end
    object SeparatorItem2: TToolButton
      Left = 83
      Top = 0
      Width = 8
      Caption = 'SeparatorItem2'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object MoveUpItem: TToolButton
      Left = 91
      Top = 0
      Hint = 'Move Up'
      Caption = 'Move Up'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = MoveItemClick
    end
    object MoveDownItem: TToolButton
      Left = 116
      Top = 0
      Hint = 'Move Down'
      Caption = 'Move Down'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = MoveItemClick
    end
  end
  object DragTimeTimer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = DragTimeTimerTimer
    Left = 164
    Top = 76
  end
  object ModelExplorerImageList: TImageList
    Left = 64
    Top = 88
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008400000084000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084840000FFFF0000FFFF0000FFFF0000FFFF000084000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000848400008484000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C60084848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000008400000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084840000FFFF0000FFFF000084000000C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000084000000FFFF0000FFFF0000FFFF000084000000840000008400
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000008400000000000000848484008484840000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00008484000084840000000000000000000000000000000000000000000000
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000084840000FFFF0000FFFF0000FFFF0000FFFF000084000000C6C6
      C600000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000848400008484000000000000000000000000000000FF000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000848400008484000000000000000000000000000000
      FF00000084000000840000000000000000000000000000000000000000000000
      00000000000000000000000000008484000084840000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FF7FFFFF00000000FE3FFFFF00000000FC1FFFFF00000000F80FFFFF00000000
      F00FFFFF00000000FC1FFFFF00000000FC1FFFFF00000000FC1FFFFF00000000
      FC1FFFFF00000000FC1FFFFF00000000FC3FFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000FFFFFFFFFCFFFFFFFFFFFFFFFC3FFFFF
      E277C677FC3FFE1FEFE3DBE3FC3FFC1FE241C241F83FFC1FFBF7DBF7F01FFC1F
      E277C677E00FFC1FFFF7FFF7C007FC1FE277DA77C007F807F7F7C3F7E3EFF007
      F677DA77C1C7F80FE7F7E7F78083FC1FF677FE77C041FE3FFFF7FFF7E0E3FFFF
      807FC07FF1F7FFFFFFFFFFFFFBFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
