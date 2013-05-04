inherited TaggedValueEditorFormWithJvclInspector: TTaggedValueEditorFormWithJvclInspector
  Caption = 'TaggedValueEditorForm1'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited TaggedValueTabControl: TTabControl
    object Inspector: TJvInspector
      Left = 8
      Top = 94
      Width = 380
      Height = 204
      Divider = 150
      ItemHeight = 16
      TabStop = True
      TabOrder = 2
      OnItemEdit = InspectorItemEdit
    end
  end
end
