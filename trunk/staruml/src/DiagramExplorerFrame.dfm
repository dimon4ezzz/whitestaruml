object DiagramExplorerPanel: TDiagramExplorerPanel
  Left = 0
  Top = 0
  Width = 320
  Height = 240
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
    Width = 320
    Height = 240
    Align = alClient
    TabOrder = 0
    object DiagramTree: TVirtualStringTree
      Left = 1
      Top = 1
      Width = 318
      Height = 238
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
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
      OnChange = DiagramTreeChange
      OnDblClick = DiagramTreeDblClick
      OnEditCancelled = DiagramTreeEditCancelled
      OnEdited = DiagramTreeEdited
      OnEditing = DiagramTreeEditing
      OnGetText = DiagramTreeGetText
      OnGetImageIndex = DiagramTreeGetImageIndex
      OnKeyDown = DiagramTreeKeyDown
      OnMouseDown = DiagramTreeMouseDown
      OnNewText = DiagramTreeNewText
      Columns = <>
    end
  end
end
