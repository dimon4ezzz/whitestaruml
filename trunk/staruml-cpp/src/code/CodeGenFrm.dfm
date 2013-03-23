object CodeGenForm: TCodeGenForm
  Left = 384
  Top = 210
  ActiveControl = OptionPageControl
  BorderStyle = bsDialog
  Caption = 'C++ Code Generation'
  ClientHeight = 419
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CodeGenWizard: TJvWizard
    Left = 0
    Top = 0
    Width = 585
    Height = 419
    ActivePage = SetOptionPage
    ButtonBarHeight = 42
    ButtonStart.Caption = 'To &Start Page'
    ButtonStart.NumGlyphs = 1
    ButtonStart.Width = 85
    ButtonLast.Caption = 'To &Last Page'
    ButtonLast.NumGlyphs = 1
    ButtonLast.Width = 85
    ButtonBack.Caption = '< &Back'
    ButtonBack.NumGlyphs = 1
    ButtonBack.Width = 75
    ButtonNext.Caption = '&Next >'
    ButtonNext.NumGlyphs = 1
    ButtonNext.Width = 75
    ButtonFinish.Caption = '&Finish'
    ButtonFinish.NumGlyphs = 1
    ButtonFinish.Width = 75
    ButtonCancel.Caption = '&Cancel'
    ButtonCancel.NumGlyphs = 1
    ButtonCancel.ModalResult = 2
    ButtonCancel.Width = 75
    ButtonHelp.Caption = '&Help'
    ButtonHelp.NumGlyphs = 1
    ButtonHelp.Width = 75
    ShowRouteMap = False
    DesignSize = (
      585
      419)
    object SelectRootElemPage: TJvWizardInteriorPage
      Header.ParentFont = False
      Header.Title.Color = clNone
      Header.Title.Text = 'Select Starting Package Location'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = ANSI_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'Select the starting package for C++ code generation.'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Indent = 20
      Header.Subtitle.Font.Charset = ANSI_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -12
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      VisibleButtons = [bkNext, bkCancel]
      OnEnterPage = SelectRootElemPageEnterPage
      OnNextButtonClick = SelectRootElemPageNextButtonClick
      OnCancelButtonClick = WizardPageCancelButtonClick
      object SelectRootElemLabel: TLabel
        Left = 8
        Top = 80
        Width = 95
        Height = 13
        Caption = 'Select the &Package:'
        FocusControl = SelectRootElemFrame.SelectTree
      end
      inline SelectRootElemFrame: TSelectTreeFrame
        Left = 8
        Top = 96
        Width = 568
        Height = 271
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 96
        ExplicitWidth = 568
        ExplicitHeight = 271
        inherited SelectTree: TElTree
          Width = 568
          Height = 271
          HeaderSections.Data = {F4FFFFFF00000000}
          ExplicitWidth = 568
          ExplicitHeight = 271
        end
      end
    end
    object SelectElemPage: TJvWizardInteriorPage
      Header.ParentFont = False
      Header.Title.Color = clNone
      Header.Title.Text = 'Select the code generation element(s)'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = ANSI_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'Select elements to generate by C++ code.'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Indent = 20
      Header.Subtitle.Font.Charset = ANSI_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -12
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      OnEnterPage = SelectElemPageEnterPage
      OnNextButtonClick = SelectElemPageNextButtonClick
      OnCancelButtonClick = WizardPageCancelButtonClick
      object SelectElemLabel: TLabel
        Left = 8
        Top = 80
        Width = 126
        Height = 13
        Caption = 'Code Generation &Element:'
        FocusControl = SelectElemFrame.SelectTree
      end
      inline SelectElemFrame: TSelectTreeFrame
        Left = 8
        Top = 96
        Width = 568
        Height = 242
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 96
        ExplicitWidth = 568
        ExplicitHeight = 242
        inherited SelectTree: TElTree
          Width = 568
          Height = 242
          HeaderSections.Data = {F4FFFFFF00000000}
          ExplicitWidth = 568
          ExplicitHeight = 242
        end
      end
      object SelectAllButton: TButton
        Left = 8
        Top = 346
        Width = 97
        Height = 25
        Caption = 'Select &All'
        TabOrder = 1
        OnClick = SelectAllButtonClick
      end
      object DeselectAllButton: TButton
        Left = 112
        Top = 346
        Width = 97
        Height = 25
        Caption = '&Deselect All'
        TabOrder = 2
        OnClick = DeselectAllButtonClick
      end
    end
    object SelectTargetDirPage: TJvWizardInteriorPage
      Header.ParentFont = False
      Header.Title.Color = clNone
      Header.Title.Text = 'Output Directory Setup'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = ANSI_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'Specify the directory to save generated codes.'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Indent = 20
      Header.Subtitle.Font.Charset = ANSI_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -12
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      OnEnterPage = SelectTargetDirPageEnterPage
      OnNextButtonClick = SelectTargetDirPageNextButtonClick
      OnCancelButtonClick = WizardPageCancelButtonClick
      object SelectTargetLabel: TLabel
        Left = 8
        Top = 80
        Width = 85
        Height = 13
        Caption = 'Output &Directory:'
        FocusControl = SelectTargetDirTreeView
      end
      object SelectTargetDirTreeView: TShellTreeView
        Left = 8
        Top = 96
        Width = 568
        Height = 271
        AutoContextMenus = False
        ObjectTypes = [otFolders]
        Root = 'rfDesktop'
        UseShellImages = True
        AutoRefresh = False
        ChangeDelay = 5000
        HideSelection = False
        Indent = 19
        ParentColor = False
        RightClickSelect = True
        ShowRoot = False
        TabOrder = 0
        OnClick = SelectTargetDirTreeViewClick
      end
    end
    object SetOptionPage: TJvWizardInteriorPage
      Header.ParentFont = False
      Header.Title.Color = clNone
      Header.Title.Text = 'Option Setup'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = ANSI_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'Configure options for code generation.'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Indent = 20
      Header.Subtitle.Font.Charset = ANSI_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -12
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      OnEnterPage = SetOptionPageEnterPage
      OnNextButtonClick = SetOptionPageNextButtonClick
      OnCancelButtonClick = WizardPageCancelButtonClick
      object OptionPageControl: TPageControl
        Left = 0
        Top = 70
        Width = 585
        Height = 307
        ActivePage = CommentTabSheet
        Align = alClient
        TabOrder = 0
        TabPosition = tpBottom
        object OptionTabSheet: TTabSheet
          Caption = 'Code Generation Options'
          object CodingStyleGroupBox: TGroupBox
            Left = 3
            Top = 128
            Width = 278
            Height = 145
            Caption = ' Code Style '
            TabOrder = 0
            object IndentSizeLabel: TLabel
              Left = 32
              Top = 57
              Width = 51
              Height = 13
              Caption = 'Tab width:'
            end
            object NamingLabel: TLabel
              Left = 16
              Top = 115
              Width = 91
              Height = 13
              Caption = 'Blank of the Name:'
              Visible = False
            end
            object UseSpaceCheckBox: TCheckBox
              Left = 16
              Top = 25
              Width = 225
              Height = 17
              Caption = 'Insert tab as space'
              TabOrder = 0
              OnClick = UseSpaceCheckBoxClick
            end
            object IndentSizeSpinEdit: TSpinEdit
              Left = 120
              Top = 53
              Width = 89
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 1
              Value = 4
            end
            object BraceCheckBox: TCheckBox
              Left = 16
              Top = 81
              Width = 241
              Height = 17
              Caption = 'Place opening curly brace "{" in the new line'
              TabOrder = 2
            end
            object NamingComboBox: TComboBox
              Left = 116
              Top = 111
              Width = 133
              Height = 21
              Style = csDropDownList
              ItemIndex = 0
              TabOrder = 3
              Text = 'Replace with '#39'_'#39' symbol'
              Visible = False
              Items.Strings = (
                'Replace with '#39'_'#39' symbol'
                'Delete blank'
                'Print as it is')
            end
          end
          object CodeGenGroup: TGroupBox
            Left = 4
            Top = 4
            Width = 568
            Height = 117
            Caption = ' Generation file Setup '
            TabOrder = 1
            object HeaderExtLabel: TLabel
              Left = 16
              Top = 26
              Width = 59
              Height = 13
              Caption = 'Header file: '
            end
            object BodyExtLabel: TLabel
              Left = 16
              Top = 58
              Width = 98
              Height = 13
              Caption = 'Implementation file: '
            end
            object FileNameFormatLabel: TLabel
              Left = 16
              Top = 88
              Width = 49
              Height = 13
              Caption = 'File name:'
            end
            object HeaderExtComboBox: TComboBox
              Left = 124
              Top = 22
              Width = 101
              Height = 21
              TabOrder = 0
              Text = '.h'
              Items.Strings = (
                '.h'
                '.hpp'
                '.hh'
                '.hxx')
            end
            object BodyExtComboBox: TComboBox
              Left = 124
              Top = 54
              Width = 101
              Height = 21
              ItemIndex = 0
              TabOrder = 1
              Text = '.cpp'
              Items.Strings = (
                '.cpp'
                '.c'
                '.cc'
                '.cxx')
            end
            object HeaderDirEdit: TEdit
              Left = 432
              Top = 22
              Width = 121
              Height = 21
              TabOrder = 2
            end
            object BodyDirEdit: TEdit
              Left = 432
              Top = 54
              Width = 121
              Height = 21
              TabOrder = 3
            end
            object FileNameFormatComboBox: TComboBox
              Left = 124
              Top = 87
              Width = 101
              Height = 21
              Style = csDropDownList
              ItemIndex = 0
              TabOrder = 4
              Text = 'Same as Model'
              Items.Strings = (
                'Same as Model'
                'Lowercase'
                'Uppercase'
                'Lowercase with '#39'_'#39)
            end
            object HeaderDirCheckBox: TCheckBox
              Left = 248
              Top = 24
              Width = 153
              Height = 17
              Caption = 'Header file subdirectory:'
              TabOrder = 5
              OnClick = HeaderDirCheckBoxClick
            end
            object BodyDirCheckBox: TCheckBox
              Left = 248
              Top = 56
              Width = 177
              Height = 17
              Caption = 'Implementation file subdirectory:'
              TabOrder = 6
              OnClick = BodyDirCheckBoxClick
            end
            object CreateSubDirForNamespaceCheckBox: TCheckBox
              Left = 248
              Top = 88
              Width = 225
              Height = 17
              Caption = 'Generate Namespace to subdirectory'
              TabOrder = 7
            end
          end
          object CodeGenGroupBox: TGroupBox
            Left = 290
            Top = 128
            Width = 281
            Height = 145
            Caption = ' Code Generation '
            TabOrder = 2
            object MemberOrderLabel: TLabel
              Left = 13
              Top = 116
              Width = 82
              Height = 13
              Caption = 'Member in order:'
            end
            object PackageAsNamesapceCheckBox: TCheckBox
              Left = 16
              Top = 20
              Width = 225
              Height = 17
              Caption = 'Generate Package to Namespace'
              TabOrder = 0
            end
            object MemberOrderComboBox: TComboBox
              Left = 104
              Top = 112
              Width = 153
              Height = 21
              Style = csDropDownList
              ItemIndex = 0
              TabOrder = 1
              Text = 'Public member first'
              Items.Strings = (
                'Public member first'
                'Private member first'
                'Unorder')
            end
            object MsSpecificCheckBox: TCheckBox
              Left = 16
              Top = 42
              Width = 225
              Height = 17
              Caption = 'Use Microsoft Visual C++ grammar'
              TabOrder = 2
              OnClick = MsSpecificCheckBoxClick
            end
            object ManagedCppCheckBox: TCheckBox
              Left = 16
              Top = 64
              Width = 225
              Height = 17
              Caption = 'Support .NET Managed C++'
              TabOrder = 3
            end
            object GenerateCommentCheckBox: TCheckBox
              Left = 16
              Top = 88
              Width = 225
              Height = 17
              Caption = 'Generate documentation to comment'
              TabOrder = 4
            end
          end
        end
        object CommentTabSheet: TTabSheet
          Caption = 'File Header Comment and Default Include'
          ImageIndex = 1
          object HeaderCommentLabel: TLabel
            Left = 8
            Top = 8
            Width = 106
            Height = 13
            Caption = '&File Header Comment:'
            FocusControl = HeaderCommentMemo
          end
          object DefaultIncludeLabel: TLabel
            Left = 8
            Top = 192
            Width = 116
            Height = 13
            Caption = 'Initial &header #includes:'
            FocusControl = DefaultHeaderIncludeMemo
          end
          object CommentDescLabel: TLabel
            Left = 448
            Top = 8
            Width = 57
            Height = 13
            Caption = 'Description:'
            FocusControl = HeaderCommentMemo
          end
          object BodyIncludeLabel: TLabel
            Left = 296
            Top = 192
            Width = 154
            Height = 13
            Caption = 'Initial &implementation #includes:'
            FocusControl = DefaultBodyIncludeMemo
          end
          object HeaderCommentMemo: TMemo
            Left = 4
            Top = 24
            Width = 429
            Height = 153
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
            WantTabs = True
          end
          object DefaultHeaderIncludeMemo: TMemo
            Left = 4
            Top = 208
            Width = 280
            Height = 65
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            WantTabs = True
          end
          object DefaultBodyIncludeMemo: TMemo
            Left = 290
            Top = 208
            Width = 280
            Height = 65
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            WantTabs = True
          end
          object CommentFlatPanel: TFlatPanel
            Left = 439
            Top = 24
            Width = 132
            Height = 153
            TabOrder = 3
            object HeaderDescMemo: TMemo
              Left = 7
              Top = 8
              Width = 118
              Height = 137
              BorderStyle = bsNone
              Color = clBtnFace
              Lines.Strings = (
                '@p : Title'
                '@d : Date'
                '@c : Company'
                '@a : Author'
                '@r : Copyright'
                '@f : File name'
                '@e : Element name'
                '@@ : Character@')
              ReadOnly = True
              TabOrder = 0
            end
          end
        end
      end
    end
    object ExecuteActionPage: TJvWizardInteriorPage
      Header.ParentFont = False
      Header.Title.Color = clNone
      Header.Title.Text = 'Code Generation'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = ANSI_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'Generate codes.'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Indent = 20
      Header.Subtitle.Font.Charset = ANSI_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -12
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      VisibleButtons = [bkFinish]
      OnPage = ExecuteActionPagePage
      OnCancelButtonClick = WizardPageCancelButtonClick
      OnFinishButtonClick = ExecuteActionPageFinishButtonClick
      object CodeGenElemLabel: TLabel
        Left = 8
        Top = 80
        Width = 130
        Height = 13
        Caption = 'Code generation &elements:'
        FocusControl = CodeGenReportListView
      end
      object FileNumInfoLabel: TLabel
        Left = 449
        Top = 80
        Width = 128
        Height = 13
        Alignment = taRightJustify
        Caption = '( Information of progress )'
      end
      object CodeGenLabel: TLabel
        Left = 8
        Top = 296
        Width = 81
        Height = 13
        Caption = '( Main Message )'
      end
      object Bevel1: TBevel
        Left = 16
        Top = 280
        Width = 545
        Height = 9
        Shape = bsTopLine
      end
      object MessageSubLabel: TLabel
        Left = 8
        Top = 312
        Width = 77
        Height = 13
        Caption = '( Sub message )'
      end
      object CodeGenReportListView: TListView
        Left = 8
        Top = 96
        Width = 569
        Height = 169
        Columns = <
          item
            Caption = 'Element'
            Width = 180
          end
          item
            Caption = 'Location'
            Width = 265
          end
          item
            Caption = 'Status'
            Width = 90
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        SmallImages = StateMarkImageList
        TabOrder = 0
        ViewStyle = vsReport
      end
      object CodeGenProgressbar: TProgressBar
        Left = 8
        Top = 336
        Width = 553
        Height = 25
        TabOrder = 1
      end
    end
  end
  object StateMarkImageList: TImageList
    Left = 104
    Top = 384
    Bitmap = {
      494C0101040009000C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5A5A500A5A5A500A5A5A500A5A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000EFF70000EFF70000EFF70000EFF700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000088C0000088C0000088C0000088C0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5009494940094949400A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      000000EFF70000EFF70000EFF70000EFF70000EFF70000BDC60000BDC60000EF
      F700000000000000000000000000000000000000000000000000000000000000
      0000088C0000088C0000088C0000088C0000088C00000873000008730000088C
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000CE000000CE000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500949494009494
      9400000000000000000000000000000000000000000000000000000000000000
      000000EFF70000EFF70000EFF70000EFF70000EFF70000EFF70000BDC60000BD
      C600000000000000000000000000000000000000000000000000000000000000
      0000088C0000088C0000088C0000088C0000088C0000088C0000087300000873
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000CE000000
      CE0000000000000000000000000000000000000000000000000000000000A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5009494
      9400A5A5A50000000000000000000000000000000000000000000000000000EF
      F70000EFF70000EFF70000EFF70000EFF70000EFF70000EFF70000EFF70000BD
      C60000EFF700000000000000000000000000000000000000000000000000088C
      0000088C0000088C0000088C0000088C0000088C0000088C0000088C00000873
      0000088C00000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      CE000000FF00000000000000000000000000000000000000000000000000A5A5
      A50000000000A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5009494
      9400A5A5A50000000000000000000000000000000000000000000000000000EF
      F7000000000000EFF70000EFF70000EFF70000EFF70000EFF70000EFF70000BD
      C60000EFF700000000000000000000000000000000000000000000000000088C
      000000000000088C0000088C0000088C0000088C0000088C0000088C00000873
      0000088C00000000000000000000000000000000000000000000000000000000
      FF00CECEFF000000FF000000FF000000FF000000FF000000FF000000FF000000
      CE000000FF00000000000000000000000000000000000000000000000000A5A5
      A5000000000000000000A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A50000000000000000000000000000000000000000000000000000EF
      F700000000000000000000EFF70000EFF70000EFF70000EFF70000EFF70000EF
      F70000EFF700000000000000000000000000000000000000000000000000088C
      00000000000000000000088C0000088C0000088C0000088C0000088C0000088C
      0000088C00000000000000000000000000000000000000000000000000000000
      FF00CECEFF00CECEFF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000000000000000000000000000000000000000000000000A5A5
      A5000000000000000000A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A50000000000000000000000000000000000000000000000000000EF
      F700000000000000000000EFF70000EFF70000EFF70000EFF70000EFF70000EF
      F70000EFF700000000000000000000000000000000000000000000000000088C
      00000000000000000000088C0000088C0000088C0000088C0000088C0000088C
      0000088C00000000000000000000000000000000000000000000000000000000
      FF00CECEFF00CECEFF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000A5A5A5000000000000000000A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      000000EFF700000000000000000000EFF70000EFF70000EFF70000EFF70000EF
      F700000000000000000000000000000000000000000000000000000000000000
      0000088C00000000000000000000088C0000088C0000088C0000088C0000088C
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00CECEFF00CECEFF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000A5A5A500A5A5A5000000000000000000A5A5A500A5A5A500A5A5A500A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      000000EFF70000EFF700000000000000000000EFF70000EFF70000EFF70000EF
      F700000000000000000000000000000000000000000000000000000000000000
      0000088C0000088C00000000000000000000088C0000088C0000088C0000088C
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00CECEFF00CECEFF00CECEFF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5A5A500A5A5A500A5A5A500A5A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000EFF70000EFF70000EFF70000EFF700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000088C0000088C0000088C0000088C0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FC3FFC3FFC3FFC3FF00FF00FF00FF00FE007E007E007E007E007E007E007E007
      C003C003C003C003C803C803C803C003CC03CC03CC03C003CC03CC03CC03C003
      E607E607E607E007E307E307E307E007F00FF00FF00FF00FFC3FFC3FFC3FFC3F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object SelectTreeImageList: TImageList
    Left = 72
    Top = 384
    Bitmap = {
      494C0101070009000C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000000000008484840000FF
      FF00848400008484000000FFFF00848484008484840084848400848484008484
      840000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF00848400008484000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF00848400008484000000FFFF00848484008484840084848400848484008484
      840000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF00848400008484000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
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
      0000000000000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF00848484008400000084000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF00848484008400000084000000840000008400
      0000848484000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00848484008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00848484008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00848484008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FFFF0000FF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00848484008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00848484008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF008484840084848400000084008484840084848400840000008400
      000084000000840000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000FFFF0000FFFF008484
      8400848484000000840000008400000084000000840000008400848484008484
      840084000000840000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400848484000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400848484008484840000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000008400000084000000
      8400000084000000840000008400000084000000840000008400000084000000
      840000008400000084000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000840000008400000084000000840000008400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000084008484840000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFC0030000
      C003FFFFC0030000C003FF8FC0030000C003FF07C0030000C003FE03C0030000
      C003FC01C0030000C0038001C0030000C003FC01C0030000C003FE03C0030000
      C003FF07C0030000C003FF8FC0030000C003FFFFC0030000FFFFFFFFC0030000
      FFFFFFFFFFFF0000FFFFFFFFFFFF0000FC7FFFFFFFFFFFFFF01FFFFFFFFFFFFF
      C007800380038003800380038003800380038003800380038003800380038003
      8003800380038003800380038003800380038003800380038003800380038003
      80038003800380038003807F807F807FC007807F807F807FF01FFFFFFFFFFFFF
      FC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
