object BatchFrame: TBatchFrame
  Left = 0
  Top = 0
  Width = 714
  Height = 340
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = 14
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object DeleteTasksButton: TButton
    Left = 11
    Top = 16
    Width = 100
    Height = 23
    Caption = '&Remove tasks'
    TabOrder = 0
    OnClick = DeleteTasksButtonClick
  end
  inline TasksGrid: TTasksGrid
    Left = 0
    Top = 45
    Width = 707
    Height = 270
    TabOrder = 1
    ExplicitTop = 45
    inherited GenerationUnitDescLabel: TLabel
      Width = 64
      Height = 14
      ExplicitWidth = 64
      ExplicitHeight = 14
    end
    inherited TasksGrid: TNextGrid6
      inherited CheckColumn: TNxCheckBoxColumn6
        InsertString = 'False'
      end
      inherited PreviewColumn: TNxIconColumn6
        InsertString = '0'
      end
      inherited TutorialColumn: TNxIconColumn6
        InsertString = '0'
      end
      inherited ParametersColumn: TNxIconColumn6
        InsertString = '0'
      end
    end
  end
end
