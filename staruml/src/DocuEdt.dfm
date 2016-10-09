object DocumentationEditor: TDocumentationEditor
  Left = 0
  Top = 0
  Width = 266
  Height = 260
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
    Width = 266
    Height = 260
    Align = alClient
    TabOrder = 0
    object DocumentationMemo: TMemo
      Left = 1
      Top = 1
      Width = 264
      Height = 258
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      WantTabs = True
      OnEnter = DocumentationMemoEnter
      OnExit = DocumentationMemoExit
      OnKeyPress = DocumentationMemoKeyPress
      OnMouseLeave = DocumentationMemoMouseLeave
    end
  end
end
