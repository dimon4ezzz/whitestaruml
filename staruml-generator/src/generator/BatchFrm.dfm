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
  object BatchGenUnitDescLabel: TLabel
    Left = 8
    Top = 274
    Width = 64
    Height = 14
    Caption = 'Description:'
  end
  object DeleteTasksButton: TButton
    Left = 16
    Top = 16
    Width = 100
    Height = 23
    Caption = '&Delete Item'
    TabOrder = 0
    OnClick = DeleteTasksButtonClick
  end
  object GenerationUnitDescPanel: TFlatPanel
    Left = 8
    Top = 289
    Width = 697
    Height = 49
    TabOrder = 1
    object GenerationUnitDescMemo: TMemo
      Left = 7
      Top = 5
      Width = 682
      Height = 39
      BorderStyle = bsNone
      Color = clBtnFace
      Ctl3D = True
      ImeName = 'Microsoft IME 2003'
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object TasksGrid: TNextGrid
    Left = 3
    Top = 51
    Width = 697
    Height = 217
    AppearanceOptions = [aoAlphaBlendedSelection, aoIndicateSortedColumn]
    AutoScroll = True
    Caption = ''
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    HighlightedTextColor = clWindowText
    Options = [goDisableColumnMoving, goGrid, goHeader, goSelectFullRow]
    RowSize = 18
    ParentFont = False
    TabOrder = 2
    TabStop = True
    Touch.InteractiveGestures = [igPan, igPressAndTap]
    Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
    OnCellClick = TasksGridCellClick
    OnChange = TasksGridChange
    OnDblClick = TasksGridDblClick
    object CheckColumn: TNxCheckBoxColumn
      Alignment = taCenter
      DefaultWidth = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = 12
      Font.Name = 'Tahoma'
      Font.Style = []
      Header.DisplayMode = dmImageOnly
      Options = [coCanClick, coCanInput, coEditing, coEditorAutoSelect, coFixedSize]
      ParentFont = False
      Position = 0
      SortKind = skDescending
      SortType = stBoolean
      Width = 23
    end
    object GroupColumn: TNxTextColumn
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      Header.Caption = 'Group'
      Options = [coCanClick, coCanInput, coCanSort, coEditorAutoSelect, coShowTextFitHint]
      ParentFont = False
      Position = 1
      Sorted = True
      SortType = stAlphabetic
      Width = 100
    end
    object CategoryColumn: TNxTextColumn
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      Header.Caption = 'Category'
      Options = [coCanClick, coCanInput, coCanSort, coEditorAutoSelect, coShowTextFitHint]
      ParentFont = False
      Position = 2
      SortKind = skDescending
      SortType = stAlphabetic
      Width = 100
    end
    object PreviewColumn: TNxImageColumn
      DefaultValue = '0'
      DefaultWidth = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 12
      Font.Name = 'Tahoma'
      Font.Style = []
      Header.DisplayMode = dmImageOnly
      Header.Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000A7ABAD838090
        BE9EA7C9CED2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D47AA2BF4A7AC7837DA4BE9EA7C9CED2C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D486C2EC50B4FE
        4C7BC7837DA4BE9EA7C9CED2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D47CBFEF53B7FE4C7BC7837DA4BE9EA7C9CED2C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        7CBFEF54B7FE4B7ECB837DA4C0B0B7C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D47BBDEF54B7FE578BD09BA0A5C4
        A79FCA9C86CA9981CB9B83CFA48FC4A49CC9D1D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D48CC3EBB9C1C7B98F81D7AB8EEDD6AFFAF4CCFAF5D4EDDCBDD9B6
        A1C6A293C9D1D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8ACA6D8A98CFF
        F5C4FFF6C3FFFFD9FFFFE9FFFFF8FFFFFFD9B6A0BD9C94C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4D0A28EEDD3AAFFE5B3FFF9C6FFFFDCFFFFECFFFFFBFFFF
        F6EDDCBDC99E89C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CC9A82FAEFC4FF
        DBA8FFF2BFFFFFD6FFFFE4FFFFEBFFFFE5FAF5D1C99981C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4CC9A82FAEFC4FFE7BCFFF3C1FFFFCDFFFFD4FFFFD6FFFF
        D5FAF3C9C99881C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CCA290EDD8B6FF
        F2DBFFE1B9FFEFBDFFF1BFFFF5C3FFF4C1EDD5ACC79A85C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8AFA8D7B097FFFFFFFFF9EEFFF1C8FFDAA7FFE6B4FFF5
        C6D6A88AC0A49EC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D4C8A497D6
        AF9BEDD8BFFAF1CCFAEDC2EDD5AED6A68AC39B8EC9D1D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C9D1D4C5AEA7C69B8ACA9982CC9B82CBA08EC6AC
        A6C9D1D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
      Options = [coCanClick, coCanInput, coEditorAutoSelect, coFixedSize]
      ParentFont = False
      Position = 3
      SortType = stNumeric
      Visible = False
      Width = 22
      Images = CellValueImages
    end
    object NameColumn: TNxTextColumn
      DefaultWidth = 270
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      Header.Caption = 'Document Name'
      Options = [coAutoSize, coCanClick, coCanInput, coCanSort, coEditorAutoSelect, coShowTextFitHint]
      ParentFont = False
      Position = 4
      SortKind = skDescending
      SortType = stAlphabetic
      Width = 270
    end
    object DocTypeColumn: TNxTextColumn
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      Header.Caption = 'Doc. Type'
      Options = [coCanClick, coCanInput, coCanSort, coEditorAutoSelect, coShowTextFitHint]
      ParentFont = False
      Position = 5
      SortType = stAlphabetic
      Width = 100
    end
    object FormatColumn: TNxTextColumn
      Alignment = taCenter
      DefaultWidth = 70
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      Header.Caption = 'Format'
      Options = [coCanClick, coCanInput, coCanSort, coEditorAutoSelect, coShowTextFitHint]
      ParentFont = False
      Position = 6
      SortType = stAlphabetic
      Width = 70
    end
    object TutorialColumn: TNxImageColumn
      Alignment = taCenter
      DefaultValue = '0'
      DefaultWidth = 60
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = 12
      Font.Name = 'Tahoma'
      Font.Style = []
      Header.Caption = 'Tutorial'
      Options = [coCanClick, coCanInput, coCanSort, coEditorAutoSelect, coFixedSize]
      ParentFont = False
      Position = 7
      SortType = stNumeric
      Visible = False
      Width = 60
      Images = CellValueImages
    end
    object ParametersColumn: TNxImageColumn
      Alignment = taCenter
      DefaultValue = '0'
      DefaultWidth = 30
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 12
      Font.Name = 'Tahoma'
      Font.Style = []
      Header.Caption = 'Opt.'
      Options = [coCanClick, coCanInput, coEditorAutoSelect, coFixedSize]
      ParentFont = False
      Position = 8
      SortType = stNumeric
      Width = 30
      Images = CellValueImages
    end
  end
  object CellValueImages: TImageList
    Left = 320
    Top = 13
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EDED
      ED00D6D6D600CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACA
      CA00CACACA00CACACA00CACACA00D6D6D600A7ABAD0083809000BE9EA700C9CE
      D200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6C6AD00845221007B42
      0000733900007B420000733900007B420000733900007B420000733900007B42
      00007339000084521800CEBDA500000000000000000000000000D8D9D9009875
      7100903027008E3027002B7B8C002B7A8C005E6669006F6F6F006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D00909090007AA2BF004A7AC700837DA400BE9E
      A700C9CED2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6C6AD008C633100BDB5AD00CED6
      DE00CED6DE00C6D6DE00CED6DE00CED6DE00CED6DE00C6D6DE00CED6DE00CED6
      DE00CED6DE00BDBDB5008C633100D6BDAD0000000000DCDADA00A14E3800B43A
      1600C4461F00C4461F002FC6EA0021C4EB0009A1C6005D6D7400946866009061
      5F008C5C5C0089595800865655006D6D6D0086C2EC0050B4FE004C7BC700837D
      A400BE9EA700C9CED20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B4A1000CECEC600EFEFEF00EFF7
      F700EFEFEF00EFF7F700EFEFEF00EFF7F700EFEFEF00EFF7F700EFEFEF00EFF7
      F700EFEFEF00EFF7F700BDBDB50084521800F1F2F200B46D5100C64D1100D371
      3200EDAF8B00E2D4C800A1E6F70060D0EB0036C8EA0007A2C800B1997100FFC6
      8E00FFD8CA00FFCEA900835252006D6D6D00000000007CBFEF0053B7FE004C7B
      C700837DA400BE9EA700C9CED200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B420000EFEFEF00F7F7F700EFF7
      F700F7F7F700EFF7F700F7F7F700EFF7F700F7F7F700EFF7F700F7F7F700EFF7
      F700F7F7F700DEE7E700DEE7EF0073390000D9C9C200CB601D00DF7D2700EDCD
      AF009E9E9E00D2D5D600FFFFFF00E9FDFF0064D2EB0024C3E90033879400FEBA
      6500FFDFBF00FFCDAB00835252006D6D6D0000000000000000007CBFEF0054B7
      FE004B7ECB00837DA400C0B0B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073390000F7F7F700EFF7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00F7F7F700FFFFFF00FFFFFF00FFFFFF00F7F7
      F700EFF7F700E7E7EF00DEE7E7007B420000DAAA8500F07A0500F9B55F00EDF3
      F600343536001C1C1C007F7F7E00E3DAD700E9FDFF0039CBF2001AA7C700FEBA
      6400FFE2C400FFCDAD00875656006D6D6D000000000000000000000000007BBD
      EF0054B7FE00578BD0009BA0A500C4A79F00CA9C8600CA998100CB9B8300CFA4
      8F00C4A49C00C9D1D40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B420000EFF7F700FFFFFF00FFFF
      FF00FFFFFF00F7F7F700FFFFFF00F7F7F700FFFFFF00F7F7F700F7FFFF00FFFF
      FF00F7FFFF00E7E7EF00E7EFEF0073390000A999B200DF7D2700F9B55F00EDF3
      F6006E6E6E00262626000101010069636300F6EBEF0024C3E9001AA7C700FEBC
      6800FFE5CC00FFCDB0008B5C5B006D6D6D000000000000000000000000000000
      00008CC3EB00B9C1C700B98F8100D7AB8E00EDD6AF00FAF4CC00FAF5D400EDDC
      BD00D9B6A100C6A29300C9D1D400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073390000F7FFFF00F7F7F700FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000F7F7F700E7EFEF00E7EFEF007B4200009BAEF3001749FC007693FF00EDF3
      F6006E6E6E00717171009E9E9E00F6EBEF0093CFB80014835B0020583D00FFBB
      6A00FFE9D300FFCCB400906361006D6D6D000000000000000000000000000000
      000000000000C8ACA600D8A98C00FFF5C400FFF6C300FFFFD900FFFFE900FFFF
      F800FFFFFF00D9B6A000BD9C9400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B420000F7FFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00EFEFF700EFF7F70073390000E4E8F5002F58F7005B7DFF009BAF
      F40092929000E2DCD600F8EBF000BDE1D30025AD7D0001785100617B6600FEC0
      7700FFEDDB00FFCCB700976A68006D6D6D000000000000000000000000000000
      000000000000D0A28E00EDD3AA00FFE5B300FFF9C600FFFFDC00FFFFEC00FFFF
      FB00FFFFF600EDDCBD00C99E8900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073390000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700EFEFF7007B420000F9F9F80096A9F6002752FC005F80
      FF00899BF50088B2DD005ADAAA000EBD7E0001925C001D775A00DDB78A00FFDA
      B000FFF2E400FFCABA009E726F006D6D6D000000000000000000000000000000
      000000000000CC9A8200FAEFC400FFDBA800FFF2BF00FFFFD600FFFFE400FFFF
      EB00FFFFE500FAF5D100C9998100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B420000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700F7FFFF007339000000000000F9F9F90092A5F6002C54
      F9002246FF002246FF0001C0730001A16400328F7000CFB99700FFD5A600FFF6
      EB00FFF5EC00FFCABD00A37874006D6D6D000000000000000000000000000000
      000000000000CC9A8200FAEFC400FFE7BC00FFF3C100FFFFCD00FFFFD400FFFF
      D600FFFFD500FAF3C900C9988100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073390000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F7007B4200000000000000000000F9F9F900EAB8
      9000909CEE00909CEE0063BB9400A8BEA500ECC9A400FFE5C900FFF9F300FFF8
      F300FFF9F300FFCABE00A77E7A00858585000000000000000000000000000000
      000000000000CCA29000EDD8B600FFF2DB00FFE1B900FFEFBD00FFF1BF00FFF5
      C300FFF4C100EDD5AC00C79A8500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C5A2900DED6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7D6C60084522100000000000000000000000000E8B5
      8F00FFFEFD00FFFCF900FFFCF800FFFCF900FFFCF900FFFCF800FFFCF9009B6B
      6A009B6B6A009B6B6A00AB817D00BFBFBF000000000000000000000000000000
      000000000000C8AFA800D7B09700FFFFFF00FFF9EE00FFF1C800FFDAA700FFE6
      B400FFF5C600D6A88A00C0A49E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEBDA500946B3900DECEC600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFE7DE0094633100D6BDAD00000000000000000000000000F0BD
      9200FFFEFD00FFFEFD00FFFEFD00FFFEFD00FFFEFD00FFFEFD00FFFEFD009B6B
      6A00FFCABE00E4954200BFBFBF00EDEDED000000000000000000000000000000
      000000000000C9D1D400C8A49700D6AF9B00EDD8BF00FAF1CC00FAEDC200EDD5
      AE00D6A68A00C39B8E00C9D1D400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BDAD008C5A29007339
      00007B420000733900007B420000733900007B420000733900007B4200007339
      00007B4200007B4A1000D6C6AD0000000000000000000000000000000000F5C2
      9500FFFEFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B280
      7400C8A37100BFBFBF00EDEDED00000000000000000000000000000000000000
      00000000000000000000C9D1D400C5AEA700C69B8A00CA998200CC9B8200CBA0
      8E00C6ACA600C9D1D40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DCA9
      8700DCA98700DCA98700DCA98700DCA98700DCA98700DEAB8800D6A38400B280
      7400D6D6D600EDEDED0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFE0000FFF00008001C00007FF0000
      0000800003FF00000000000081FF000000000000C1FF000000000000E0030000
      00000000F001000000000000F801000000000000F801000000000000F8010000
      00008000F80100000000C000F80100000000E000F80100000000E000F8010000
      8001E001FC030000FFFFE003FFFF000000000000000000000000000000000000
      000000000000}
  end
end
