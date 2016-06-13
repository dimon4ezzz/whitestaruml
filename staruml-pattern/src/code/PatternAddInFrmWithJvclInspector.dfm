inherited PatternAddInFormWithJvclInspector: TPatternAddInFormWithJvclInspector
  PixelsPerInch = 96
  TextHeight = 13
  inherited PatternGenWizard: TJvWizard
    inherited PatternParameterPage: TJvWizardInteriorPage
      object PatternInspector: TJvInspector
        Left = 5
        Top = 97
        Width = 455
        Height = 169
        Divider = 160
        ItemHeight = 16
        TabStop = True
        TabOrder = 1
        OnItemEdit = PatternInspectorItemEdit
      end
    end
  end
end
