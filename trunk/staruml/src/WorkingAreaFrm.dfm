object WorkingAreaFrame: TWorkingAreaFrame
  Left = 0
  Top = 0
  Width = 537
  Height = 388
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object ClientPanel: TFlatPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 388
    Align = alClient
    TabOrder = 0
    object MapButtonImage: TImage
      Left = -2
      Top = -1
      Width = 65
      Height = 41
      Picture.Data = {
        07544269746D6170C2010000424DC20100000000000036000000280000000B00
        00000B00000001001800000000008C010000120B0000120B0000000000000000
        00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000000000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000
        FF0000FF0000FF0000000000FF0000FF0000FF0000FF00000000000000000000
        00FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000FF000000
        0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000000000FF0000
        FF0000000000FF0000FF0000000000FF0000FF0000000000FF02020200000000
        00000000000000000000000000000000000000000000FF0000000000FF0000FF
        0808080000FF0000FF0000000000FF0000FF0000000000FF0000FF0000000000
        FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000FF00
        00000000FF0000FF0000FF0000FF0606060000000000000000FF0000FF0000FF
        0000FF0000000000FF0000FF0000FF0000FF0000FF0202020000FF0000FF0000
        FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF000000}
      Transparent = True
    end
    object DiagramPageControl: TPageControl
      Left = 1
      Top = 1
      Width = 535
      Height = 386
      Align = alClient
      PopupMenu = DiagramTabPopupMenu
      TabOrder = 0
      OnChange = DiagramPageControlChange
      OnContextPopup = DiagramPageControlContextPopup
    end
  end
  object DiagramTabPopupMenu: TPopupMenu
    OnPopup = DiagramTabPopupMenuPopupHandler
    Left = 376
    Top = 56
    object ViewDiagramPages: TMenuItem
      Caption = 'Pages'
      Hint = 'Pages'
      object TMenuItem
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ViewCloseDiagram: TMenuItem
      Caption = 'Close Diagram'
      Hint = 'Close Diagram'
      ShortCut = 16499
      OnClick = ViewMenuClick
    end
    object ViewCloseAllDiagrams: TMenuItem
      Caption = 'Close All Diagrams'
      Hint = 'Close All Diagrams'
      ShortCut = 24691
      OnClick = ViewMenuClick
    end
    object FormatLayoutDiagram: TMenuItem
      Caption = 'Layout Diagram'
      Hint = 'Layout Diagram'
      ImageIndex = 147
      OnClick = ViewMenuClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ViewRefresh: TMenuItem
      Caption = 'Refresh'
      Hint = 'Refresh'
      ImageIndex = 136
      ShortCut = 116
      OnClick = ViewMenuClick
    end
  end
end
