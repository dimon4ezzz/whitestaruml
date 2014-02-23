object OutputPanel: TOutputPanel
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
    object OutputMemo: TMemo
      Left = 1
      Top = 1
      Width = 318
      Height = 238
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      OnKeyPress = OutputMemoKeyPress
    end
  end
end
