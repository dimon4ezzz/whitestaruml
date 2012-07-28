object ProfileSelectorForm: TProfileSelectorForm
  Left = 408
  Top = 254
  BorderStyle = bsDialog
  Caption = 'Select Profile'
  ClientHeight = 233
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object HeaderLabel: TLabel
    Left = 8
    Top = 8
    Width = 99
    Height = 12
    Caption = 'Selected &Profiles:'
  end
  object Bevel: TBevel
    Left = 8
    Top = 196
    Width = 249
    Height = 9
    Shape = bsTopLine
  end
  object DefaultProfileIconImage: TImage
    Left = 8
    Top = 204
    Width = 32
    Height = 32
    AutoSize = True
    Picture.Data = {
      055449636F6E0000010001002020000001000800A80800001600000028000000
      2000000040000000010008000000000000040000000000000000000000000000
      00000000000000000041420042616300FFF7F70000FFFF0084E7E700F7FFFF00
      42868400C6C7C6008420210084A6A500C6C76300C6A66300C6C7840042860000
      42862100F7CFA5004261420042000000FFFFFF00004100008486000084610000
      C6614200C6A6000000007C0031FF310031CFFF003161FF00009EFF00FF9E0000
      00FF00000061FF00CE9E000000CF00000030CE00CE6100009C610000009E0000
      00309C0063610000008600000061CE00009ECE0084B6F700E7C7D600CEDFF700
      5296F7002951DE0084304A0000287300CECF8C00DEB6C6009C9E9C00F7F7CE00
      B5BE39006B6900004A491000BDC74A0000000000000000000000000000000000
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
      0000000003030303030303030303030303030303000035353503030303030303
      0303030303030303030303030303030303030300373800353535030303030303
      0303030303030303030303030303030303030037373838003535350303030303
      0303030303030303030303030303030303003737373838380035353503030303
      030303030303030303030303030335350037373937383A383800353535030303
      030303030303030303030303033535003737393937383A3A3838003535350303
      030303030303030303030303000000373737393937383A3A3838380035350303
      0303030303030303030303002F003737393739373738383A383A383800350303
      03030303030303030303002F2F0037393937373736333838383A3A3800030303
      030303030303030303002F2F2F0037393937373633333338383A3A3800350303
      0303030303030303002F2F322F003739373736333333333338383A3800353503
      03030303030303002F2F32322F00373737363333333333333338383800353535
      030303030303002F2F2F32322F00373736333333333333333333383800003535
      3503030303002F2F322F322F2F00373633333333333333333333333800310035
      3535030303002F32322F2F322F00363333333333333333333333333300313100
      3535030303002F32322F32322F30003333333333333333333333330031343131
      0035030303002F322F2F32322F30300033333333333333333333003131343431
      0003030303002F2F322F322F2F303030003333333333333333002D3131343431
      0003030303002F32322F2F2F2E2C30303000333333333333002D2D2D31313431
      0003030303002F32322F2F2E2C2C2C3030300033333333002D2D2D2D2D313131
      0003030303002F322F2F2E2C2C2C2C2C303030003333002D2D2D2D2D2D2D3131
      0003030303002F2F2F2E2C2C2C2C2C2C2C30303000002D2D2D2D2D2D2D2D2D31
      0003030303002F2F2E2C2C2C2C2C2C2C2C2C3030002D2D2D2D2D2D2D2D2D2D2D
      0003030303002F2E2C2C2C2C2C2C2C2C2C2C2C30002D2D2D2D2D2D2D2D2D2D00
      0303030303002E2C2C2C2C2C2C2C2C2C2C2C2C2C002D2D2D2D2D2D2D2D2D0003
      030303030303002C2C2C2C2C2C2C2C2C2C2C2C00002D2D2D2D2D2D2D2D000303
      03030303030303002C2C2C2C2C2C2C2C2C2C000303002D2D2D2D2D2D00030303
      0303030303030303002C2C2C2C2C2C2C2C0003030303002D2D2D2D0003030303
      030303030303030303002C2C2C2C2C2C00030303030303002D2D000303030303
      03030303030303030303002C2C2C2C0003030303030303030000030303030303
      0303030303030303030303002C2C000303030303030303030303030303030303
      0303030303030303030303030000030303030303030303030303030303030303
      0303030300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000}
    Visible = False
  end
  object ProfileGrid: TNextGrid
    Left = 8
    Top = 24
    Width = 249
    Height = 161
    AppearanceOptions = [aoAlphaBlendedSelection, aoHideFocus, aoHideSelection]
    AutoScroll = True
    HighlightedTextColor = clWindowText
    Options = [goSelectFullRow]
    TabOrder = 0
    TabStop = True
    object CheckColumn: TNxCheckBoxColumn
      Alignment = taCenter
      DefaultWidth = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = []
      Header.DisplayMode = dmImageOnly
      Header.Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480511C80511C80511C80511C80511C80
        511C80511C80511C80511C80511C80511C80511C80511CC8D0D4C8D0D4C8D0D4
        80511CF1F3F3F3F5F5F6F7F7F8F9F9F9FAFAFBFCFCFDFDFDFEFEFEFFFFFFFFFF
        FFFFFFFF80511CC8D0D4C8D0D4C8D0D480511CEFF1F1F1F3F3F3F5F5F6F7F7F8
        F9F9F9FAFAFBFCFCFDFDFDFEFEFEFFFFFFFFFFFF80511CC8D0D4C8D0D4C8D0D4
        80511CECEFEFEFF1F1F1F3F3F3F5F521A121F8F9F9F9FAFAFBFCFCFDFDFDFEFE
        FEFFFFFF80511CC8D0D4C8D0D4C8D0D480511CE9ECECECEFEFEFF1F121A12121
        A12121A121F8F9F9F9FAFAFBFCFCFDFDFDFEFEFE80511CC8D0D4C8D0D4C8D0D4
        80511CE6EAEAE9ECEC21A12121A12121A12121A12121A121F8F9F9F9FAFAFBFC
        FCFDFDFD80511CC8D0D4C8D0D4C8D0D480511CE3E7E7E6EAEA21A12121A121EF
        F1F121A12121A12121A121F8F9F9F9FAFAFBFCFC80511CC8D0D4C8D0D4C8D0D4
        80511CE1E5E5E3E7E721A121E9ECECECEFEFEFF1F121A12121A12121A121F8F9
        F9F9FAFA80511CC8D0D4C8D0D4C8D0D480511CDFE3E3E1E5E5E3E7E7E6EAEAE9
        ECECECEFEFEFF1F121A12121A121F6F7F7F8F9F980511CC8D0D4C8D0D4C8D0D4
        80511CDDE2E2DFE3E3E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F121A121F3F5
        F5F6F7F780511CC8D0D4C8D0D4C8D0D480511CDDE2E2DDE2E2DFE3E3E1E5E5E3
        E7E7E6EAEAE9ECECECEFEFEFF1F1F1F3F3F3F5F580511CC8D0D4C8D0D4C8D0D4
        80511CDDE2E2DDE2E2DDE2E2DFE3E3E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1
        F1F1F3F380511CC8D0D4C8D0D4C8D0D480511C80511C80511C80511C80511C80
        511C80511C80511C80511C80511C80511C80511C80511CC8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coEditorAutoSelect]
      ParentFont = False
      Position = 0
      SortType = stBoolean
      Width = 26
    end
    object ProfileIconColumn: TNxImageColumn
      DefaultValue = '0'
      DefaultWidth = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = []
      Options = [coCanClick, coCanInput, coCanSort, coEditorAutoSelect]
      ParentFont = False
      Position = 1
      SortKind = skDescending
      SortType = stNumeric
      Width = 22
      Images = ProfileIconImageList
    end
    object ProfileNameColumn: TNxTextColumn
      DefaultWidth = 199
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = []
      Header.Caption = #54532#47196#54028#51068#47749
      Options = [coAutoSize, coCanClick, coCanInput, coCanSort, coEditorAutoSelect, coShowTextFitHint]
      ParentFont = False
      Position = 2
      SortKind = skDescending
      SortType = stAlphabetic
      Width = 199
    end
  end
  object AcceptButton: TButton
    Left = 68
    Top = 206
    Width = 90
    Height = 23
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 164
    Top = 206
    Width = 90
    Height = 23
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object ProfileIconImageList: TImageList
    Left = 48
    Top = 208
  end
end
