inherited PropertyEditorWithJvclInspector: TPropertyEditorWithJvclInspector
  inherited ClientPanel: TFlatPanel
    object Inspector: TJvInspector
      Left = 0
      Top = 0
      Width = 316
      Height = 334
      Style = isDotNet
      Divider = 150
      ItemHeight = 16
      TabStop = True
      TabOrder = 0
      OnItemEdit = InspectorItemEdit
    end
  end
  inherited ActionKindImageList: TImageList
    Left = 240
    Top = 40
  end
end
