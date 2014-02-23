object MainForm: TMainForm
  Left = 57
  Top = 64
  Caption = 'WhiteStarUML'
  ClientHeight = 519
  ClientWidth = 924
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object DockSite: TdxDockSite
    Left = 0
    Top = 77
    Width = 924
    Height = 420
    ManagerFont = False
    ParentFont = True
    Align = alClient
    DockingType = 5
    OriginalWidth = 924
    OriginalHeight = 420
    object dxLayoutDockSite1: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 656
      Height = 420
      ManagerFont = False
      ParentFont = True
      DockingType = 0
      OriginalWidth = 300
      OriginalHeight = 200
      object dxLayoutDockSite4: TdxLayoutDockSite
        Left = 0
        Top = 0
        Width = 656
        Height = 280
        ManagerFont = False
        ParentFont = True
        DockingType = 0
        OriginalWidth = 300
        OriginalHeight = 200
        object dxLayoutDockSite3: TdxLayoutDockSite
          Left = 167
          Top = 0
          Width = 489
          Height = 280
          DockingType = 0
          OriginalWidth = 300
          OriginalHeight = 200
          object dxLayoutDockSite2: TdxLayoutDockSite
            Left = 0
            Top = 0
            Width = 489
            Height = 280
            ManagerFont = False
            ParentFont = True
            DockingType = 0
            OriginalWidth = 300
            OriginalHeight = 200
          end
          object WorkingAreaDockPanel: TdxDockPanel
            Left = 0
            Top = 0
            Width = 489
            Height = 280
            ManagerFont = False
            ParentFont = True
            AllowDock = [dtClient]
            AllowDockClients = []
            AllowFloating = False
            AutoHide = False
            CaptionButtons = [cbMaximize]
            CustomCaptionButtons.Buttons = <>
            Dockable = False
            TabsProperties.CustomButtons.Buttons = <>
            DockingType = 0
            OriginalWidth = 419
            OriginalHeight = 273
            inline WorkingAreaFrame: TWorkingAreaFrame
              Left = 0
              Top = 0
              Width = 485
              Height = 256
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ExplicitWidth = 485
              ExplicitHeight = 256
              inherited ClientPanel: TFlatPanel
                Width = 485
                Height = 256
                ExplicitWidth = 485
                ExplicitHeight = 256
                inherited DiagramPageControl: TPageControl
                  Width = 483
                  Height = 254
                  OnChange = WorkingAreaFrameDiagramPageControlChange
                  ExplicitWidth = 483
                  ExplicitHeight = 254
                end
              end
              inherited DiagramTabPopupMenu: TPopupMenu
                Left = 160
                Top = 176
              end
            end
          end
        end
        object ToolBoxDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 167
          Height = 280
          ManagerFont = False
          ParentFont = True
          OnVisibleChanged = DockPanelVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Toolbox'
          CustomCaptionButtons.Buttons = <>
          TabsProperties.CustomButtons.Buttons = <>
          DockingType = 1
          OriginalWidth = 167
          OriginalHeight = 140
          inline PaletteNavBarFrame: TPaletteNavBarFrameVclImpl
            Left = 0
            Top = 0
            Width = 163
            Height = 256
            Align = alClient
            TabOrder = 0
            inherited PaletteNavBar: TCategoryButtons
              Width = 157
              Height = 250
              Categories = <
                item
                  Caption = 'Annotation'
                  Color = 16053492
                  Collapsed = False
                  Items = <
                    item
                      Action = PaletteNavBarFrame.SelectAction
                    end
                    item
                      Action = PaletteNavBarFrame.TextAction
                    end
                    item
                      Action = PaletteNavBarFrame.NoteAction
                    end
                    item
                      Action = PaletteNavBarFrame.NoteLinkAction
                    end
                    item
                      Action = PaletteNavBarFrame.RectangleAction
                    end
                    item
                      Action = PaletteNavBarFrame.EllipseAction
                    end
                    item
                      Action = PaletteNavBarFrame.RoundedRectangleAction
                    end
                    item
                      Action = PaletteNavBarFrame.LineAction
                    end
                    item
                      Action = PaletteNavBarFrame.ImageAction
                    end>
                end
                item
                  Caption = 'Class'
                  Color = 16771839
                  Collapsed = False
                  Items = <
                    item
                      Action = PaletteNavBarFrame.SelectAction
                    end
                    item
                      Action = PaletteNavBarFrame.SubsystemAction
                    end
                    item
                      Action = PaletteNavBarFrame.PackageAction
                    end
                    item
                      Action = PaletteNavBarFrame.ClassAction
                    end
                    item
                      Action = PaletteNavBarFrame.InterfaceAction
                    end
                    item
                      Action = PaletteNavBarFrame.EnumerationAction
                    end
                    item
                      Action = PaletteNavBarFrame.SignalAction
                    end
                    item
                      Action = PaletteNavBarFrame.ExceptionAction
                    end
                    item
                      Action = PaletteNavBarFrame.PortAction
                    end
                    item
                      Action = PaletteNavBarFrame.PartAction
                    end
                    item
                      Action = PaletteNavBarFrame.AssociationAction
                    end
                    item
                      Action = PaletteNavBarFrame.DirectedAssociationAction
                    end
                    item
                      Action = PaletteNavBarFrame.AggregationAction
                    end
                    item
                      Action = PaletteNavBarFrame.CompositionAction
                    end
                    item
                      Action = PaletteNavBarFrame.GeneralizationAction
                    end
                    item
                      Action = PaletteNavBarFrame.DependencyAction
                    end
                    item
                      Action = PaletteNavBarFrame.RealizationAction
                    end
                    item
                      Action = PaletteNavBarFrame.AssociationClassAction
                    end
                    item
                      Action = PaletteNavBarFrame.ConnectorAction
                    end
                    item
                      Action = PaletteNavBarFrame.ObjectAction
                    end
                    item
                      Action = PaletteNavBarFrame.LinkAction
                    end>
                end
                item
                  Caption = 'BuiltIn'
                  Color = 16053492
                  Collapsed = False
                  Items = <
                    item
                      Action = PaletteNavBarFrame.ActionStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.ActorAction
                    end
                    item
                      Action = PaletteNavBarFrame.AggregationAction
                    end
                    item
                      Action = PaletteNavBarFrame.ArtifactAction
                    end
                    item
                      Action = PaletteNavBarFrame.AssociationAction
                    end
                    item
                      Action = PaletteNavBarFrame.AssociationClassAction
                    end
                    item
                      Action = PaletteNavBarFrame.AssociationRoleAction
                    end
                    item
                      Action = PaletteNavBarFrame.ChoicePointAction
                    end
                    item
                      Action = PaletteNavBarFrame.ClassAction
                    end
                    item
                      Action = PaletteNavBarFrame.ClassifierRoleAction
                    end
                    item
                      Action = PaletteNavBarFrame.CombinedFragmentAction
                    end
                    item
                      Action = PaletteNavBarFrame.ComponentAction
                    end
                    item
                      Action = PaletteNavBarFrame.ComponentInstanceAction
                    end
                    item
                      Action = PaletteNavBarFrame.CompositionAction
                    end
                    item
                      Action = PaletteNavBarFrame.ConnectorAction
                    end
                    item
                      Action = PaletteNavBarFrame.DecisionAction
                    end
                    item
                      Action = PaletteNavBarFrame.DeepHistoryAction
                    end
                    item
                      Action = PaletteNavBarFrame.DependencyAction
                    end
                    item
                      Action = PaletteNavBarFrame.DirectedAssociationAction
                    end
                    item
                      Action = PaletteNavBarFrame.EllipseAction
                    end
                    item
                      Action = PaletteNavBarFrame.EnumerationAction
                    end
                    item
                      Action = PaletteNavBarFrame.ExceptionAction
                    end
                    item
                      Action = PaletteNavBarFrame.ExtendAction
                    end
                    item
                      Action = PaletteNavBarFrame.FinalStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.FlowFinalStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.ForwardMessageAction
                    end
                    item
                      Action = PaletteNavBarFrame.ForwardStimulusAction
                    end
                    item
                      Action = PaletteNavBarFrame.FrameAction
                    end
                    item
                      Action = PaletteNavBarFrame.GeneralizationAction
                    end
                    item
                      Action = PaletteNavBarFrame.HorizontalSwimlaneAction
                    end
                    item
                      Action = PaletteNavBarFrame.ImageAction
                    end
                    item
                      Action = PaletteNavBarFrame.IncludeAction
                    end
                    item
                      Action = PaletteNavBarFrame.InitialStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.InteractionOperandAction
                    end
                    item
                      Action = PaletteNavBarFrame.InterfaceAction
                    end
                    item
                      Action = PaletteNavBarFrame.JunctionPointAction
                    end
                    item
                      Action = PaletteNavBarFrame.LineAction
                    end
                    item
                      Action = PaletteNavBarFrame.LinkAction
                    end
                    item
                      Action = PaletteNavBarFrame.MessageAction
                    end
                    item
                      Action = PaletteNavBarFrame.NodeAction
                    end
                    item
                      Action = PaletteNavBarFrame.NodeInstanceAction
                    end
                    item
                      Action = PaletteNavBarFrame.NoteAction
                    end
                    item
                      Action = PaletteNavBarFrame.NoteLinkAction
                    end
                    item
                      Action = PaletteNavBarFrame.ObjectAction
                    end
                    item
                      Action = PaletteNavBarFrame.ObjectFlowStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.PackageAction
                    end
                    item
                      Action = PaletteNavBarFrame.PartAction
                    end
                    item
                      Action = PaletteNavBarFrame.PortAction
                    end
                    item
                      Action = PaletteNavBarFrame.RealizationAction
                    end
                    item
                      Action = PaletteNavBarFrame.RectangleAction
                    end
                    item
                      Action = PaletteNavBarFrame.ReverseMessageAction
                    end
                    item
                      Action = PaletteNavBarFrame.ReverseStimulusAction
                    end
                    item
                      Action = PaletteNavBarFrame.RoundedRectangleAction
                    end
                    item
                      Action = PaletteNavBarFrame.SelectAction
                    end
                    item
                      Action = PaletteNavBarFrame.SelfAssociationRoleAction
                    end
                    item
                      Action = PaletteNavBarFrame.SelfLinkAction
                    end
                    item
                      Action = PaletteNavBarFrame.SelfMessageAction
                    end
                    item
                      Action = PaletteNavBarFrame.SelfStimulusAction
                    end
                    item
                      Action = PaletteNavBarFrame.SelfTransitionAction
                    end
                    item
                      Action = PaletteNavBarFrame.ShallowHistoryAction
                    end
                    item
                      Action = PaletteNavBarFrame.SignalAcceptStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.SignalAction
                    end
                    item
                      Action = PaletteNavBarFrame.SignalSendStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.StateAction
                    end
                    item
                      Action = PaletteNavBarFrame.StimulusAction
                    end
                    item
                      Action = PaletteNavBarFrame.SubactivityStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.SubmachineStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.SubsystemAction
                    end
                    item
                      Action = PaletteNavBarFrame.SynchronizationAction
                    end
                    item
                      Action = PaletteNavBarFrame.SystemBoundaryAction
                    end
                    item
                      Action = PaletteNavBarFrame.TextAction
                    end
                    item
                      Action = PaletteNavBarFrame.TransitionAction
                    end
                    item
                      Action = PaletteNavBarFrame.UseCaseAction
                    end
                    item
                      Action = PaletteNavBarFrame.VerticalSwimlaneAction
                    end>
                end
                item
                  Caption = 'Use Case'
                  Color = 16777194
                  Collapsed = False
                  Items = <
                    item
                      Action = PaletteNavBarFrame.SelectAction
                    end
                    item
                      Action = PaletteNavBarFrame.PackageAction
                    end
                    item
                      Action = PaletteNavBarFrame.UseCaseAction
                    end
                    item
                      Action = PaletteNavBarFrame.ActorAction
                    end
                    item
                      Action = PaletteNavBarFrame.AssociationAction
                    end
                    item
                      Action = PaletteNavBarFrame.DirectedAssociationAction
                    end
                    item
                      Action = PaletteNavBarFrame.GeneralizationAction
                    end
                    item
                      Action = PaletteNavBarFrame.DependencyAction
                    end
                    item
                      Action = PaletteNavBarFrame.IncludeAction
                    end
                    item
                      Action = PaletteNavBarFrame.ExtendAction
                    end
                    item
                      Action = PaletteNavBarFrame.SystemBoundaryAction
                    end>
                end
                item
                  Caption = 'Component'
                  Color = 15395839
                  Collapsed = False
                  Items = <
                    item
                      Action = PaletteNavBarFrame.SelectAction
                    end
                    item
                      Action = PaletteNavBarFrame.PackageAction
                    end
                    item
                      Action = PaletteNavBarFrame.InterfaceAction
                    end
                    item
                      Action = PaletteNavBarFrame.ComponentAction
                    end
                    item
                      Action = PaletteNavBarFrame.ComponentInstanceAction
                    end
                    item
                      Action = PaletteNavBarFrame.ArtifactAction
                    end
                    item
                      Action = PaletteNavBarFrame.PortAction
                    end
                    item
                      Action = PaletteNavBarFrame.PartAction
                    end
                    item
                      Action = PaletteNavBarFrame.AssociationAction
                    end
                    item
                      Action = PaletteNavBarFrame.DependencyAction
                    end
                    item
                      Action = PaletteNavBarFrame.RealizationAction
                    end
                    item
                      Action = PaletteNavBarFrame.LinkAction
                    end
                    item
                      Action = PaletteNavBarFrame.ConnectorAction
                    end>
                end
                item
                  Caption = 'Deployment'
                  Color = 15395839
                  Collapsed = False
                  Items = <
                    item
                      Action = PaletteNavBarFrame.SelectAction
                    end
                    item
                      Action = PaletteNavBarFrame.PackageAction
                    end
                    item
                      Action = PaletteNavBarFrame.NodeAction
                    end
                    item
                      Action = PaletteNavBarFrame.NodeInstanceAction
                    end
                    item
                      Action = PaletteNavBarFrame.ArtifactAction
                    end
                    item
                      Action = PaletteNavBarFrame.PortAction
                    end
                    item
                      Action = PaletteNavBarFrame.PartAction
                    end
                    item
                      Action = PaletteNavBarFrame.AssociationAction
                    end
                    item
                      Action = PaletteNavBarFrame.DirectedAssociationAction
                    end
                    item
                      Action = PaletteNavBarFrame.DependencyAction
                    end
                    item
                      Action = PaletteNavBarFrame.LinkAction
                    end
                    item
                      Action = PaletteNavBarFrame.ConnectorAction
                    end>
                end
                item
                  Caption = 'Sequence'
                  Color = 16053492
                  Collapsed = False
                  Items = <
                    item
                      Action = PaletteNavBarFrame.SelectAction
                    end
                    item
                      Action = PaletteNavBarFrame.ObjectAction
                    end
                    item
                      Action = PaletteNavBarFrame.StimulusAction
                    end
                    item
                      Action = PaletteNavBarFrame.SelfStimulusAction
                    end
                    item
                      Action = PaletteNavBarFrame.CombinedFragmentAction
                    end
                    item
                      Action = PaletteNavBarFrame.InteractionOperandAction
                    end
                    item
                      Action = PaletteNavBarFrame.FrameAction
                    end>
                end
                item
                  Caption = 'Sequence (Role)'
                  Color = 15395839
                  Collapsed = False
                  Items = <
                    item
                      Action = PaletteNavBarFrame.SelectAction
                    end
                    item
                      Action = PaletteNavBarFrame.ClassifierRoleAction
                    end
                    item
                      Action = PaletteNavBarFrame.MessageAction
                    end
                    item
                      Action = PaletteNavBarFrame.SelfMessageAction
                    end
                    item
                      Action = PaletteNavBarFrame.CombinedFragmentAction
                    end
                    item
                      Action = PaletteNavBarFrame.InteractionOperandAction
                    end
                    item
                      Action = PaletteNavBarFrame.FrameAction
                    end>
                end
                item
                  Caption = 'Collaboration (Role)'
                  Color = 16771839
                  Collapsed = False
                  Items = <
                    item
                      Action = PaletteNavBarFrame.SelectAction
                    end
                    item
                      Action = PaletteNavBarFrame.ClassifierRoleAction
                    end
                    item
                      Action = PaletteNavBarFrame.AssociationRoleAction
                    end
                    item
                      Action = PaletteNavBarFrame.SelfAssociationRoleAction
                    end
                    item
                      Action = PaletteNavBarFrame.ForwardMessageAction
                    end
                    item
                      Action = PaletteNavBarFrame.ReverseMessageAction
                    end
                    item
                      Action = PaletteNavBarFrame.FrameAction
                    end>
                end
                item
                  Caption = 'Collaboration'
                  Color = 16771839
                  Collapsed = False
                  Items = <
                    item
                      Action = PaletteNavBarFrame.SelectAction
                    end
                    item
                      Action = PaletteNavBarFrame.ObjectAction
                    end
                    item
                      Action = PaletteNavBarFrame.LinkAction
                    end
                    item
                      Action = PaletteNavBarFrame.SelfLinkAction
                    end
                    item
                      Action = PaletteNavBarFrame.ForwardStimulusAction
                    end
                    item
                      Action = PaletteNavBarFrame.ReverseStimulusAction
                    end
                    item
                      Action = PaletteNavBarFrame.FrameAction
                    end>
                end
                item
                  Caption = 'Statechart'
                  Color = 16771839
                  Collapsed = False
                  Items = <
                    item
                      Action = PaletteNavBarFrame.SelectAction
                    end
                    item
                      Action = PaletteNavBarFrame.StateAction
                    end
                    item
                      Action = PaletteNavBarFrame.SubmachineStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.InitialStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.FinalStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.JunctionPointAction
                    end
                    item
                      Action = PaletteNavBarFrame.ChoicePointAction
                    end
                    item
                      Action = PaletteNavBarFrame.ShallowHistoryAction
                    end
                    item
                      Action = PaletteNavBarFrame.DeepHistoryAction
                    end
                    item
                      Action = PaletteNavBarFrame.SynchronizationAction
                    end
                    item
                      Action = PaletteNavBarFrame.FlowFinalStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.TransitionAction
                    end
                    item
                      Action = PaletteNavBarFrame.SelfTransitionAction
                    end>
                end
                item
                  Caption = 'Activity'
                  Color = 16771839
                  Collapsed = False
                  Items = <
                    item
                      Action = PaletteNavBarFrame.SelectAction
                    end
                    item
                      Action = PaletteNavBarFrame.ActionStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.SubactivityStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.InitialStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.FinalStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.SynchronizationAction
                    end
                    item
                      Action = PaletteNavBarFrame.DecisionAction
                    end
                    item
                      Action = PaletteNavBarFrame.FlowFinalStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.ObjectFlowStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.SignalAcceptStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.SignalSendStateAction
                    end
                    item
                      Action = PaletteNavBarFrame.TransitionAction
                    end
                    item
                      Action = PaletteNavBarFrame.SelfTransitionAction
                    end
                    item
                      Action = PaletteNavBarFrame.VerticalSwimlaneAction
                    end
                    item
                      Action = PaletteNavBarFrame.HorizontalSwimlaneAction
                    end>
                end
                item
                  Caption = 'Composite Structure'
                  Color = 15466474
                  Collapsed = False
                  Items = <
                    item
                      Action = PaletteNavBarFrame.SelectAction
                    end
                    item
                      Action = PaletteNavBarFrame.ClassAction
                    end
                    item
                      Action = PaletteNavBarFrame.InterfaceAction
                    end
                    item
                      Action = PaletteNavBarFrame.PortAction
                    end
                    item
                      Action = PaletteNavBarFrame.PartAction
                    end
                    item
                      Action = PaletteNavBarFrame.DependencyAction
                    end
                    item
                      Action = PaletteNavBarFrame.RealizationAction
                    end
                    item
                      Action = PaletteNavBarFrame.ConnectorAction
                    end>
                end>
            end
          end
        end
      end
      object dxTabContainerDockSite2: TdxTabContainerDockSite
        Left = 0
        Top = 280
        Width = 656
        Height = 140
        ManagerFont = False
        ParentFont = True
        ActiveChildIndex = 1
        AllowFloating = True
        AutoHide = False
        CustomCaptionButtons.Buttons = <>
        TabsProperties.CustomButtons.Buttons = <>
        DockingType = 4
        OriginalWidth = 695
        OriginalHeight = 140
        object OutputDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 652
          Height = 91
          ManagerFont = False
          ParentFont = True
          OnVisibleChanged = DockPanelVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Output'
          CustomCaptionButtons.Buttons = <>
          ImageIndex = 5
          TabsProperties.CustomButtons.Buttons = <>
          DockingType = 0
          OriginalWidth = 185
          OriginalHeight = 140
          inline OutputPanel: TOutputPanel
            Left = 0
            Top = 0
            Width = 652
            Height = 91
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 652
            ExplicitHeight = 91
            inherited ClientPanel: TFlatPanel
              Width = 652
              Height = 91
              ExplicitWidth = 652
              ExplicitHeight = 91
              inherited OutputMemo: TMemo
                Width = 650
                Height = 89
                ExplicitWidth = 650
                ExplicitHeight = 89
              end
            end
          end
        end
        object MessageDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 652
          Height = 91
          ManagerFont = False
          ParentFont = True
          OnVisibleChanged = DockPanelVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Messages'
          CustomCaptionButtons.Buttons = <>
          ImageIndex = 6
          TabsProperties.CustomButtons.Buttons = <>
          DockingType = 0
          OriginalWidth = 185
          OriginalHeight = 140
          inline MessagePanel: TMessagePanel
            Left = 0
            Top = 0
            Width = 652
            Height = 91
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 652
            ExplicitHeight = 91
            inherited ClientPanel: TFlatPanel
              Width = 652
              Height = 91
              ExplicitWidth = 652
              ExplicitHeight = 91
              inherited MessageListView: TListView
                Width = 650
                Height = 89
                ExplicitWidth = 650
                ExplicitHeight = 89
              end
            end
            inherited MessageImageList: TImageList
              Left = 44
            end
            inherited SaveMessagesDialog: TSaveDialogEx
              Left = 168
            end
          end
        end
      end
    end
    object dxVertContainerDockSite2: TdxVertContainerDockSite
      Left = 656
      Top = 0
      Width = 268
      Height = 420
      ManagerFont = False
      ParentFont = True
      ActiveChildIndex = -1
      AllowFloating = True
      AutoHide = False
      CustomCaptionButtons.Buttons = <>
      DockingType = 3
      OriginalWidth = 268
      OriginalHeight = 284
      object dxTabContainerDockSite1: TdxTabContainerDockSite
        Left = 0
        Top = 0
        Width = 268
        Height = 237
        ManagerFont = False
        ParentFont = True
        ActiveChildIndex = 0
        AllowFloating = True
        AutoHide = False
        CustomCaptionButtons.Buttons = <>
        TabsProperties.CustomButtons.Buttons = <>
        DockingType = 2
        OriginalWidth = 268
        OriginalHeight = 237
        object ModelExplorerDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 264
          Height = 188
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ManagerFont = False
          OnVisibleChanged = DockPanelVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Model Explorer'
          CustomCaptionButtons.Buttons = <>
          ImageIndex = 0
          TabsProperties.CustomButtons.Buttons = <>
          DockingType = 0
          OriginalWidth = 268
          OriginalHeight = 237
          inline ModelExplorer: TModelExplorerPanel
            Left = 0
            Top = 0
            Width = 264
            Height = 188
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 264
            ExplicitHeight = 188
            inherited ClientPanel: TFlatPanel
              Width = 264
              Height = 162
              ExplicitWidth = 264
              ExplicitHeight = 162
              inherited ModelTree: TVirtualStringTree
                Width = 262
                Height = 160
                ExplicitWidth = 262
                ExplicitHeight = 160
              end
            end
            inherited ModelExplorerToolbar: TToolBar
              Width = 264
              ExplicitWidth = 264
            end
            inherited DragTimeTimer: TTimer
              Left = 172
            end
            inherited ModelExplorerImageList: TImageList
              Top = 72
            end
          end
        end
        object DiagramExplorerDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 264
          Height = 188
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ManagerFont = False
          OnVisibleChanged = DockPanelVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Diagram Explorer'
          CustomCaptionButtons.Buttons = <>
          ImageIndex = 1
          TabsProperties.CustomButtons.Buttons = <>
          DockingType = 0
          OriginalWidth = 268
          OriginalHeight = 237
          inline DiagramExplorer: TDiagramExplorerPanel
            Left = 0
            Top = 0
            Width = 264
            Height = 188
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 264
            ExplicitHeight = 188
            inherited ClientPanel: TFlatPanel
              Width = 264
              Height = 188
              ExplicitWidth = 264
              ExplicitHeight = 188
              inherited DiagramTree: TVirtualStringTree
                Width = 262
                Height = 186
                ExplicitWidth = 262
                ExplicitHeight = 186
              end
            end
          end
        end
      end
      object dxTabContainerDockSite3: TdxTabContainerDockSite
        Left = 0
        Top = 237
        Width = 268
        Height = 183
        ManagerFont = False
        ParentFont = True
        ActiveChildIndex = 0
        AllowFloating = True
        AutoHide = False
        CustomCaptionButtons.Buttons = <>
        TabsProperties.CustomButtons.Buttons = <>
        DockingType = 2
        OriginalWidth = 268
        OriginalHeight = 183
        object PropertiesDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 264
          Height = 134
          ManagerFont = False
          ParentFont = True
          OnVisibleChanged = DockPanelVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Properties'
          CustomCaptionButtons.Buttons = <>
          ImageIndex = 2
          TabsProperties.CustomButtons.Buttons = <>
          DockingType = 0
          OriginalWidth = 268
          OriginalHeight = 183
          inline InspectorFrame: TInspectorFrame
            Left = 0
            Top = 0
            Width = 264
            Height = 134
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 264
            ExplicitHeight = 134
            inherited ClientPanel: TPanel
              Width = 264
              Height = 134
              ExplicitWidth = 264
              ExplicitHeight = 134
              inherited InspectorTitleBarGapPanel: TPanel
                Width = 264
                ExplicitWidth = 264
              end
              inherited SelectionTextGapPanel: TPanel
                Width = 264
                ExplicitWidth = 264
              end
              inherited PropertyEditor: TPropertyEditorWithJvclInspector
                Width = 264
                Height = 113
                ExplicitWidth = 264
                ExplicitHeight = 113
                inherited ClientPanel: TFlatPanel
                  Width = 264
                  Height = 113
                  ExplicitWidth = 264
                  ExplicitHeight = 113
                  inherited Inspector: TJvInspector
                    Left = 1
                    Top = 1
                    Width = 262
                    Height = 111
                    Align = alClient
                    Divider = 130
                    ExplicitLeft = 1
                    ExplicitTop = 1
                    ExplicitWidth = 262
                    ExplicitHeight = 111
                  end
                end
                inherited RowImageList: TImageList
                  Left = 52
                  Top = 40
                end
                inherited AggregationImageList: TImageList
                  Left = 48
                  Top = 96
                end
                inherited VisibilityImageList: TImageList
                  Left = 128
                end
                inherited PsedostatsImageList: TImageList
                  Top = 96
                end
                inherited ActionKindImageList: TImageList
                  Left = 208
                end
              end
              inherited SelectionTextPanel: TFlatPanel
                Width = 264
                ExplicitWidth = 264
                inherited SelectionText: TLabel
                  Width = 262
                  Height = 15
                end
              end
            end
          end
        end
        object DocumentationDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 264
          Height = 134
          ManagerFont = False
          ParentFont = True
          OnVisibleChanged = DockPanelVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Documentation'
          CustomCaptionButtons.Buttons = <>
          ImageIndex = 3
          TabsProperties.CustomButtons.Buttons = <>
          DockingType = 0
          OriginalWidth = 268
          OriginalHeight = 183
          inline DocumentationEditor: TDocumentationEditor
            Left = 0
            Top = 0
            Width = 264
            Height = 134
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 264
            ExplicitHeight = 134
            inherited ClientPanel: TFlatPanel
              Width = 264
              Height = 134
              ExplicitWidth = 264
              ExplicitHeight = 134
              inherited DocumentationMemo: TMemo
                Width = 262
                Height = 132
                ExplicitWidth = 262
                ExplicitHeight = 132
              end
            end
          end
        end
        object AttachmentsDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 264
          Height = 134
          ManagerFont = False
          ParentFont = True
          OnVisibleChanged = DockPanelVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Attachments'
          CustomCaptionButtons.Buttons = <>
          ImageIndex = 4
          TabsProperties.CustomButtons.Buttons = <>
          DockingType = 0
          OriginalWidth = 268
          OriginalHeight = 183
          inline AttachmentEditor: TAttachmentEditor
            Left = 0
            Top = 0
            Width = 264
            Height = 134
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 264
            ExplicitHeight = 134
            inherited ClientPanel: TFlatPanel
              Width = 264
              Height = 110
              ExplicitWidth = 264
              ExplicitHeight = 110
              inherited AttachmentListView: TListView
                Width = 262
                Height = 108
                ExplicitWidth = 262
                ExplicitHeight = 108
              end
            end
            inherited AttachmentsToolbar: TToolBar
              Width = 264
              ExplicitWidth = 264
            end
          end
        end
      end
    end
  end
  object BarManager: TdxBarManager
    AllowCallFromAnotherForm = True
    AutoHideEmptyBars = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default'
      'Menus'
      'File'
      'Edit'
      'Model'
      'View'
      'Tools'
      'Help'
      'Status'
      'Attachments(Inspector)'
      'Messages(Information)'
      'Format')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True
      True
      True
      True
      True
      True
      True)
    ImageOptions.Images = TotalImageList
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    MenusShowRecentItemsFirst = False
    PopupMenuLinks = <>
    UseFullReset = True
    UseSystemFont = False
    OnBarVisibleChange = BarManagerBarVisibleChange
    OnClickItem = BarManagerClickItem
    Left = 460
    Top = 208
    DockControlHeights = (
      0
      0
      77
      22)
    object BarManagerBar1: TdxBar
      Caption = 'Main Menu'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 0
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FileMenu'
        end
        item
          Visible = True
          ItemName = 'EditMenu'
        end
        item
          Visible = True
          ItemName = 'FormatMenu'
        end
        item
          Visible = True
          ItemName = 'ModelMenu'
        end
        item
          Visible = True
          ItemName = 'ViewMenu'
        end
        item
          Visible = True
          ItemName = 'ToolsMenu'
        end
        item
          Visible = True
          ItemName = 'HelpMenu'
        end>
      MultiLine = True
      OldName = 'Main Menu'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BarManagerBar2: TdxBar
      Caption = 'Standard'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 25
      DockingStyle = dsTop
      FloatLeft = 766
      FloatTop = 351
      FloatClientWidth = 240
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FileNew'
        end
        item
          Visible = True
          ItemName = 'FileOpen'
        end
        item
          Visible = True
          ItemName = 'FileSave'
        end
        item
          Visible = True
          ItemName = 'FilePrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'EditCut'
        end
        item
          Visible = True
          ItemName = 'EditCopy'
        end
        item
          Visible = True
          ItemName = 'EditPaste'
        end
        item
          Visible = True
          ItemName = 'EditDelete'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'EditUndo'
        end
        item
          Visible = True
          ItemName = 'EditRedo'
        end
        item
          Visible = True
          ItemName = 'EditFind'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelCollectionEditor'
        end
        item
          Visible = True
          ItemName = 'ModelConstraints'
        end
        item
          Visible = True
          ItemName = 'ModelTaggedValues'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelProfiles'
        end
        item
          Visible = True
          ItemName = 'ModelModelVerification'
        end>
      OldName = 'StandardToolbar'
      OneOnRow = False
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object BarManagerBar3: TdxBar
      Caption = 'Format'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 51
      DockingStyle = dsTop
      FloatLeft = 404
      FloatTop = 344
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FormatFontNameCombo'
        end
        item
          Visible = True
          ItemName = 'FormatFontSizeCombo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatFont'
        end
        item
          Visible = True
          ItemName = 'FormatLineColor'
        end
        item
          Visible = True
          ItemName = 'FormatFillColor'
        end
        item
          Visible = True
          ItemName = 'FormatAnnotationLineStyle'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatAutoResize'
        end
        item
          Visible = True
          ItemName = 'FormatStereotypeDisplay'
        end
        item
          Visible = True
          ItemName = 'FormatShowExtendedNotation'
        end
        item
          Visible = True
          ItemName = 'FormatLineStyle'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatSuppressAttributes'
        end
        item
          Visible = True
          ItemName = 'FormatSuppressOperations'
        end
        item
          Visible = True
          ItemName = 'FormatSuppressEnumerationLiterals'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatWordWrap'
        end
        item
          Visible = True
          ItemName = 'FormatShowParentName'
        end
        item
          Visible = True
          ItemName = 'FormatShowOperationSignature'
        end
        item
          Visible = True
          ItemName = 'FormatShowProperty'
        end
        item
          Visible = True
          ItemName = 'FormatShowCompartmentVisibility'
        end
        item
          Visible = True
          ItemName = 'FormatShowCompartmentStereotype'
        end>
      OldName = 'Format'
      OneOnRow = False
      Row = 2
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object BarManagerBar4: TdxBar
      Caption = 'View'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 413
      DockedTop = 25
      DockingStyle = dsTop
      FloatLeft = 404
      FloatTop = 344
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ViewZoomCombo'
        end
        item
          Visible = True
          ItemName = 'ViewZoomZoomIn'
        end
        item
          Visible = True
          ItemName = 'ViewZoomZoomOut'
        end
        item
          Visible = True
          ItemName = 'ViewZoomFitInWindow'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ViewRefresh'
        end>
      OldName = 'View'
      OneOnRow = False
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object BarManagerBar5: TdxBar
      Caption = 'Alignment'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 641
      DockedTop = 51
      DockingStyle = dsTop
      FloatLeft = 404
      FloatTop = 344
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FormatLayoutDiagram'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatAlignmentBringToFront'
        end
        item
          Visible = True
          ItemName = 'FormatAlignmentSendToBack'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatAlignmentLeft'
        end
        item
          Visible = True
          ItemName = 'FormatAlignmentRight'
        end
        item
          Visible = True
          ItemName = 'FormatAlignmentMiddle'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatAlignmentTop'
        end
        item
          Visible = True
          ItemName = 'FormatAlignmentBottom'
        end
        item
          Visible = True
          ItemName = 'FormatAlignmentCenter'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatAlignmentSpaceEvenlyHorizontally'
        end
        item
          Visible = True
          ItemName = 'FormatAlignmentSpaceEvenlyVertically'
        end>
      OldName = 'Alignment'
      OneOnRow = False
      Row = 2
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object BarManagerBar6: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      BorderStyle = bbsNone
      Caption = 'Status Bar'
      CaptionButtons = <>
      DockedDockingStyle = dsBottom
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsBottom
      FloatLeft = 404
      FloatTop = 344
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'StatusBarModifiedInfo'
        end
        item
          Visible = True
          ItemName = 'StatusBarProgress'
        end
        item
          Visible = True
          ItemName = 'StatusBarInfo'
        end>
      OldName = 'StatusBar'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object FileMenu: TdxBarSubItem
      Caption = '&File'
      Category = 1
      Hint = 'File'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FileNew'
        end
        item
          Visible = True
          ItemName = 'FileSelectProject'
        end
        item
          Visible = True
          ItemName = 'FileOpen'
        end
        item
          Visible = True
          ItemName = 'ExclusiveFileOpen'
        end
        item
          Visible = True
          ItemName = 'FileSave'
        end
        item
          Visible = True
          ItemName = 'FileSaveAs'
        end
        item
          Visible = True
          ItemName = 'FileClose'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FileUnits'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FileImport'
        end
        item
          Visible = True
          ItemName = 'FileExport'
        end
        item
          Visible = True
          ItemName = 'FileExportDiagram'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FilePageSetup'
        end
        item
          Visible = True
          ItemName = 'FilePrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FileRecentFiles'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FileExit'
        end>
    end
    object EditMenu: TdxBarSubItem
      Caption = '&Edit'
      Category = 1
      Hint = 'Edit'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'EditUndo'
        end
        item
          Visible = True
          ItemName = 'EditRedo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'EditCut'
        end
        item
          Visible = True
          ItemName = 'EditCopy'
        end
        item
          Visible = True
          ItemName = 'EditCopyDiagram'
        end
        item
          Visible = True
          ItemName = 'EditCopyDiagramAsBitmap'
        end
        item
          Visible = True
          ItemName = 'EditPaste'
        end
        item
          Visible = True
          ItemName = 'EditDelete'
        end
        item
          Visible = True
          ItemName = 'EditDeleteFromModel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'EditFind'
        end
        item
          Visible = True
          ItemName = 'EditGoTo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'EditSelectAll'
        end>
    end
    object FormatMenu: TdxBarSubItem
      Caption = 'F&ormat'
      Category = 1
      Hint = 'Format'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FormatFont'
        end
        item
          Visible = True
          ItemName = 'FormatLineColor'
        end
        item
          Visible = True
          ItemName = 'FormatFillColor'
        end
        item
          Visible = True
          ItemName = 'FormatAnnotationLineStyle'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatLineStyle'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatStereotypeDisplay'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatSuppressAttributes'
        end
        item
          Visible = True
          ItemName = 'FormatSuppressOperations'
        end
        item
          Visible = True
          ItemName = 'FormatSuppressEnumerationLiterals'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatWordWrap'
        end
        item
          Visible = True
          ItemName = 'FormatShowParentName'
        end
        item
          Visible = True
          ItemName = 'FormatShowOperationSignature'
        end
        item
          Visible = True
          ItemName = 'FormatShowProperty'
        end
        item
          Visible = True
          ItemName = 'FormatShowCompartmentVisibility'
        end
        item
          Visible = True
          ItemName = 'FormatShowCompartmentStereotype'
        end
        item
          Visible = True
          ItemName = 'FormatShowExtendedNotation'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatAutoResize'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatAlignment'
        end
        item
          Visible = True
          ItemName = 'FormatLayoutDiagram'
        end>
    end
    object ModelMenu: TdxBarSubItem
      Caption = '&Model'
      Category = 1
      Hint = 'Model'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ModelAdd'
        end
        item
          Visible = True
          ItemName = 'ModelAddDiagram'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelCollectionEditor'
        end
        item
          Visible = True
          ItemName = 'ModelConstraints'
        end
        item
          Visible = True
          ItemName = 'ModelTaggedValues'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelProfiles'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelModelVerification'
        end>
    end
    object ViewMenu: TdxBarSubItem
      Caption = '&View'
      Category = 1
      Hint = 'View'
      Visible = ivAlways
      OnClick = ViewMenuClick
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ViewCloseDiagram'
        end
        item
          Visible = True
          ItemName = 'ViewCloseAllDiagrams'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ViewSelectInModelExplorer'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ViewRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ViewModelExplorer'
        end
        item
          Visible = True
          ItemName = 'ViewDiagramExplorer'
        end
        item
          Visible = True
          ItemName = 'ViewPropertyEditor'
        end
        item
          Visible = True
          ItemName = 'ViewDocumentationEditor'
        end
        item
          Visible = True
          ItemName = 'ViewAttachmentEditor'
        end
        item
          Visible = True
          ItemName = 'ViewOutputWindow'
        end
        item
          Visible = True
          ItemName = 'ViewMessageWindow'
        end
        item
          Visible = True
          ItemName = 'ViewToolbox'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ViewZoom'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ViewToolbars'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ViewUITheme'
        end>
    end
    object ToolsMenu: TdxBarSubItem
      Caption = '&Tools'
      Category = 1
      Hint = 'Tools'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ToolsOptions'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ToolsAddInManager'
        end>
    end
    object HelpMenu: TdxBarSubItem
      Caption = '&Help'
      Category = 1
      Hint = 'Help'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'HelpContents'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'HelpAbout'
        end>
    end
    object FileNew: TdxBarButton
      Caption = '&New Project'
      Category = 2
      Hint = 'New Project'
      Visible = ivAlways
      ImageIndex = 101
      ShortCut = 16462
      OnClick = FileMenuClick
    end
    object FileOpen: TdxBarButton
      Caption = '&Open...'
      Category = 2
      Hint = 'Open'
      Visible = ivAlways
      ImageIndex = 102
      ShortCut = 16463
      OnClick = FileMenuClick
    end
    object FileSave: TdxBarButton
      Caption = '&Save'
      Category = 2
      Hint = 'Save'
      Visible = ivAlways
      ImageIndex = 103
      ShortCut = 16467
      OnClick = FileMenuClick
    end
    object FileSaveAs: TdxBarButton
      Caption = 'Save &As...'
      Category = 2
      Hint = 'Save As'
      Visible = ivAlways
      ShortCut = 24659
      OnClick = FileMenuClick
    end
    object FileClose: TdxBarButton
      Caption = '&Close'
      Category = 2
      Hint = 'Close'
      Visible = ivAlways
      OnClick = FileMenuClick
    end
    object FileUnits: TdxBarSubItem
      Caption = 'Uni&t'
      Category = 2
      Hint = 'Unit'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FileUnitsSeparateUnit'
        end
        item
          Visible = True
          ItemName = 'FileUnitsMergeUnit'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FileUnitsDeleteUnit'
        end
        item
          Visible = True
          ItemName = 'FileUnitsSave'
        end
        item
          Visible = True
          ItemName = 'FileUnitsSaveAs'
        end>
    end
    object FileUnitsSeparateUnit: TdxBarButton
      Caption = '&Control Unit...'
      Category = 2
      Hint = 'Control Unit'
      Visible = ivAlways
      OnClick = FileMenuClick
    end
    object FileUnitsMergeUnit: TdxBarButton
      Caption = '&Uncontrol Unit'
      Category = 2
      Hint = 'Uncontrol Unit'
      Visible = ivAlways
      OnClick = FileMenuClick
    end
    object FileUnitsDeleteUnit: TdxBarButton
      Caption = '&Delete Unit'
      Category = 2
      Hint = 'Delete Unit'
      Visible = ivAlways
      OnClick = FileMenuClick
    end
    object FileUnitsSave: TdxBarButton
      Caption = '&Save Unit...'
      Category = 2
      Hint = 'Save Unit'
      Visible = ivAlways
      OnClick = FileMenuClick
    end
    object FileUnitsSaveAs: TdxBarButton
      Caption = 'Save Unit &As...'
      Category = 2
      Hint = 'Save Unit As'
      Visible = ivAlways
      OnClick = FileMenuClick
    end
    object FileImport: TdxBarSubItem
      Caption = '&Import'
      Category = 2
      Hint = 'Import'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FileImportFramework'
        end
        item
          Visible = True
          ItemName = 'FileImportModelFragment'
        end>
    end
    object FileImportModelFragment: TdxBarButton
      Caption = '&Model Fragment...'
      Category = 2
      Hint = 'Model Fragment'
      Visible = ivAlways
      OnClick = FileMenuClick
    end
    object FileImportFramework: TdxBarButton
      Caption = '&Framework...'
      Category = 2
      Hint = 'Framework'
      Visible = ivAlways
      OnClick = FileMenuClick
    end
    object FileExport: TdxBarSubItem
      Caption = '&Export'
      Category = 2
      Hint = 'Export'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FileExportModelFragment'
        end>
    end
    object FileExportModelFragment: TdxBarButton
      Caption = '&Model Fragment...'
      Category = 2
      Hint = 'Model Fragment'
      Visible = ivAlways
      OnClick = FileMenuClick
    end
    object FileExportDiagram: TdxBarButton
      Caption = 'Export &Diagram...'
      Category = 2
      Hint = 'Export Diagram'
      Visible = ivAlways
      ShortCut = 24644
      OnClick = FileMenuClick
    end
    object FilePrint: TdxBarButton
      Caption = '&Print...'
      Category = 2
      Hint = 'Print'
      Visible = ivAlways
      ImageIndex = 104
      ShortCut = 16464
      OnClick = FileMenuClick
    end
    object FilePageSetup: TdxBarButton
      Caption = 'Page Set&up...'
      Category = 2
      Hint = 'Page Setup'
      Visible = ivAlways
      OnClick = FileMenuClick
    end
    object FileRecentFiles: TdxBarSubItem
      Caption = '&Recent Files'
      Category = 2
      Hint = 'Recent Files'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FileRecentFilesMRU'
        end>
    end
    object FileRecentFilesMRU: TdxBarMRUListItem
      Caption = 'Recent Files'
      Category = 2
      Visible = ivAlways
      OnClick = FileRecentFilesMRUClick
    end
    object FileExit: TdxBarButton
      Caption = 'E&xit'
      Category = 2
      Hint = 'Exit'
      Visible = ivAlways
      OnClick = FileMenuClick
    end
    object FileCreate: TdxBarButton
      Caption = 'New'
      Category = 2
      Hint = 'New'
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = FileCreatePopupMenu
      ImageIndex = 101
      OnClick = FileMenuClick
    end
    object FileSelectProject: TdxBarButton
      Caption = 'New Project By Approach...'
      Category = 2
      Hint = 'New Project By Approach'
      Visible = ivAlways
      ShortCut = 16457
      OnClick = FileMenuClick
    end
    object ExclusiveFileOpen: TdxBarButton
      Caption = 'Open File in Exclusive Mode...'
      Category = 2
      Hint = 'Open File in Exclusive Mode...'
      Visible = ivAlways
      OnClick = ExclusiveFileOpenClick
    end
    object EditUndo: TdxBarButton
      Caption = '&Undo'
      Category = 3
      Hint = 'Undo'
      Visible = ivAlways
      ImageIndex = 109
      ShortCut = 16474
      OnClick = EditMenuClick
    end
    object EditRedo: TdxBarButton
      Caption = '&Redo'
      Category = 3
      Hint = 'Redo'
      Visible = ivAlways
      ImageIndex = 110
      ShortCut = 16473
      OnClick = EditMenuClick
    end
    object EditCut: TdxBarButton
      Caption = 'Cu&t'
      Category = 3
      Hint = 'Cut'
      Visible = ivAlways
      ImageIndex = 105
      ShortCut = 16472
      OnClick = EditMenuClick
    end
    object EditCopy: TdxBarButton
      Caption = '&Copy'
      Category = 3
      Hint = 'Copy'
      Visible = ivAlways
      ImageIndex = 106
      ShortCut = 16451
      OnClick = EditMenuClick
    end
    object EditCopyDiagram: TdxBarButton
      Caption = 'Copy Dia&gram'
      Category = 3
      Hint = 'Copy Diagram'
      Visible = ivAlways
      ShortCut = 24643
      OnClick = EditMenuClick
    end
    object EditCopyDiagramAsBitmap: TdxBarButton
      Caption = 'Copy Diagram As &Bitmap'
      Category = 3
      Hint = 'Copy Diagram As Bitmap'
      Visible = ivAlways
      ShortCut = 24642
      OnClick = EditMenuClick
    end
    object EditPaste: TdxBarButton
      Caption = '&Paste'
      Category = 3
      Hint = 'Paste'
      Visible = ivAlways
      ImageIndex = 107
      ShortCut = 16470
      OnClick = EditMenuClick
    end
    object EditDelete: TdxBarButton
      Caption = '&Delete'
      Category = 3
      Hint = 'Delete'
      Visible = ivAlways
      ImageIndex = 108
      ShortCut = 46
      OnClick = EditMenuClick
    end
    object EditDeleteFromModel: TdxBarButton
      Caption = 'Delete From &Model'
      Category = 3
      Hint = 'Delete From Model'
      Visible = ivAlways
      ShortCut = 16430
      OnClick = EditMenuClick
    end
    object EditFind: TdxBarButton
      Caption = '&Find...'
      Category = 3
      Hint = 'Find'
      Visible = ivAlways
      ImageIndex = 111
      ShortCut = 16454
      OnClick = EditMenuClick
    end
    object EditFindDiagramsWithSelectedModel: TdxBarButton
      Caption = 'Find Diagrams With Selected Model'
      Category = 3
      Hint = 'Find Diagrams With Selected Model'
      Visible = ivAlways
      OnClick = EditFindDiagramsWithSelectedModelClick
    end
    object EditSelectAll: TdxBarButton
      Caption = 'Select &All'
      Category = 3
      Hint = 'Select All'
      Visible = ivAlways
      ShortCut = 16449
      OnClick = EditMenuClick
    end
    object EditGoTo: TdxBarSubItem
      Caption = 'G&o To'
      Category = 3
      Hint = 'Go To'
      Visible = ivNever
      ItemLinks = <
        item
          Visible = True
          ItemName = 'EditGoToItemList'
        end>
    end
    object EditGoToItemList: TdxBarListItem
      Caption = 'Go To Items'
      Category = 3
      Visible = ivAlways
    end
    object ModelAdd: TdxBarSubItem
      Caption = '&Add'
      Category = 4
      Hint = 'Add'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ModelAddAttribute'
        end
        item
          Visible = True
          ItemName = 'ModelAddOperation'
        end
        item
          Visible = True
          ItemName = 'ModelAddParameter'
        end
        item
          Visible = True
          ItemName = 'ModelAddEnumerationLiteral'
        end
        item
          Visible = True
          ItemName = 'ModelAddTemplateParameter'
        end
        item
          Visible = True
          ItemName = 'ModelAddAttributeLink'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelAddEntryAction'
        end
        item
          Visible = True
          ItemName = 'ModelAddDoAction'
        end
        item
          Visible = True
          ItemName = 'ModelAddExitAction'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelAddSignalEvent'
        end
        item
          Visible = True
          ItemName = 'ModelAddCallEvent'
        end
        item
          Visible = True
          ItemName = 'ModelAddTimeEvent'
        end
        item
          Visible = True
          ItemName = 'ModelAddChangeEvent'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelAddEffect'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelAddModel'
        end
        item
          Visible = True
          ItemName = 'ModelAddSubsystem'
        end
        item
          Visible = True
          ItemName = 'ModelAddPackage'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelAddClass'
        end
        item
          Visible = True
          ItemName = 'ModelAddInterface'
        end
        item
          Visible = True
          ItemName = 'ModelAddUseCase'
        end
        item
          Visible = True
          ItemName = 'ModelAddActor'
        end
        item
          Visible = True
          ItemName = 'ModelAddSignal'
        end
        item
          Visible = True
          ItemName = 'ModelAddException'
        end
        item
          Visible = True
          ItemName = 'ModelAddObject'
        end
        item
          Visible = True
          ItemName = 'ModelAddEnumeration'
        end
        item
          Visible = True
          ItemName = 'ModelAddComponent'
        end
        item
          Visible = True
          ItemName = 'ModelAddComponentInstance'
        end
        item
          Visible = True
          ItemName = 'ModelAddNode'
        end
        item
          Visible = True
          ItemName = 'ModelAddNodeInstance'
        end
        item
          Visible = True
          ItemName = 'ModelAddArtifact'
        end
        item
          Visible = True
          ItemName = 'ModelAddPort'
        end
        item
          Visible = True
          ItemName = 'ModelAddExtensionPoint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelAddCollaboration'
        end
        item
          Visible = True
          ItemName = 'ModelAddCollaborationInstanceSet'
        end
        item
          Visible = True
          ItemName = 'ModelAddClassifierRole'
        end
        item
          Visible = True
          ItemName = 'ModelAddInteraction'
        end
        item
          Visible = True
          ItemName = 'ModelAddInteractionInstanceSet'
        end
        item
          Visible = True
          ItemName = 'ModelAddStateMachine'
        end
        item
          Visible = True
          ItemName = 'ModelAddActivityGraph'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelAddCombinedFragment'
        end
        item
          Visible = True
          ItemName = 'ModelAddInteractionOperand'
        end
        item
          Visible = True
          ItemName = 'ModelAddFrame'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelAddState'
        end
        item
          Visible = True
          ItemName = 'ModelAddSubmachineState'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ModelAddActionState'
        end
        item
          Visible = True
          ItemName = 'ModelAddSubactivityState'
        end
        item
          Visible = True
          ItemName = 'ModelAddInitialState'
        end
        item
          Visible = True
          ItemName = 'ModelAddFinalState'
        end
        item
          Visible = True
          ItemName = 'ModelAddDecision'
        end
        item
          Visible = True
          ItemName = 'ModelAddJunctionPoint'
        end
        item
          Visible = True
          ItemName = 'ModelAddChoicePoint'
        end
        item
          Visible = True
          ItemName = 'ModelAddObjectFlowState'
        end
        item
          Visible = True
          ItemName = 'ModelAddFlowFinalState'
        end
        item
          Visible = True
          ItemName = 'ModelAddSignalAcceptState'
        end
        item
          Visible = True
          ItemName = 'ModelAddSignalSendState'
        end
        item
          Visible = True
          ItemName = 'ModelAddShallowHistory'
        end
        item
          Visible = True
          ItemName = 'ModelAddDeepHistory'
        end
        item
          Visible = True
          ItemName = 'ModelAddSynchronization'
        end
        item
          Visible = True
          ItemName = 'ModelAddSwimlane'
        end>
    end
    object ModelAddDiagram: TdxBarSubItem
      Caption = 'Add &Diagram'
      Category = 4
      Hint = 'Add Diagram'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ModelAddDiagramClassDiagram'
        end
        item
          Visible = True
          ItemName = 'ModelAddDiagramUsecaseDiagram'
        end
        item
          Visible = True
          ItemName = 'ModelAddDiagramSequenceDiagram'
        end
        item
          Visible = True
          ItemName = 'ModelAddDiagramSequenceRoleDiagram'
        end
        item
          Visible = True
          ItemName = 'ModelAddDiagramCollaborationDiagram'
        end
        item
          Visible = True
          ItemName = 'ModelAddDiagramCollaborationRoleDiagram'
        end
        item
          Visible = True
          ItemName = 'ModelAddDiagramStatechartDiagram'
        end
        item
          Visible = True
          ItemName = 'ModelAddDiagramActivityDiagram'
        end
        item
          Visible = True
          ItemName = 'ModelAddDiagramComponentDiagram'
        end
        item
          Visible = True
          ItemName = 'ModelAddDiagramDeploymentDiagram'
        end
        item
          Visible = True
          ItemName = 'ModelAddDiagramCompositeStructureDiagram'
        end>
    end
    object ModelAddModel: TdxBarButton
      Caption = 'Model'
      Category = 4
      Hint = 'Model'
      Visible = ivAlways
      ImageIndex = 7
      OnClick = ModelAddMenuClick
    end
    object ModelAddSubsystem: TdxBarButton
      Caption = 'Subsystem'
      Category = 4
      Hint = 'Subsystem'
      Visible = ivAlways
      ImageIndex = 10
      OnClick = ModelAddMenuClick
    end
    object ModelAddPackage: TdxBarButton
      Caption = 'Package'
      Category = 4
      Hint = 'Package'
      Visible = ivAlways
      ImageIndex = 13
      OnClick = ModelAddMenuClick
    end
    object ModelAddClass: TdxBarButton
      Caption = 'Class'
      Category = 4
      Hint = 'Class'
      Visible = ivAlways
      ImageIndex = 16
      OnClick = ModelAddMenuClick
    end
    object ModelAddInterface: TdxBarButton
      Caption = 'Interface'
      Category = 4
      Hint = 'Interface'
      Visible = ivAlways
      ImageIndex = 17
      OnClick = ModelAddMenuClick
    end
    object ModelAddEnumeration: TdxBarButton
      Caption = 'Enumeration'
      Category = 4
      Hint = 'Enumeration'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = ModelAddMenuClick
    end
    object ModelAddComponent: TdxBarButton
      Caption = 'Component'
      Category = 4
      Hint = 'Component'
      Visible = ivAlways
      ImageIndex = 21
      OnClick = ModelAddMenuClick
    end
    object ModelAddComponentInstance: TdxBarButton
      Caption = 'Component Instance'
      Category = 4
      Hint = 'Component Instance'
      Visible = ivAlways
      ImageIndex = 22
      OnClick = ModelAddMenuClick
    end
    object ModelAddNode: TdxBarButton
      Caption = 'Node'
      Category = 4
      Hint = 'Node'
      Visible = ivAlways
      ImageIndex = 23
      OnClick = ModelAddMenuClick
    end
    object ModelAddNodeInstance: TdxBarButton
      Caption = 'Node Instance'
      Category = 4
      Hint = 'Node Instance'
      Visible = ivAlways
      ImageIndex = 24
      OnClick = ModelAddMenuClick
    end
    object ModelAddUseCase: TdxBarButton
      Caption = 'Use Case'
      Category = 4
      Hint = 'Use Case'
      Visible = ivAlways
      ImageIndex = 25
      OnClick = ModelAddMenuClick
    end
    object ModelAddActor: TdxBarButton
      Caption = 'Actor'
      Category = 4
      Hint = 'Actor'
      Visible = ivAlways
      ImageIndex = 26
      OnClick = ModelAddMenuClick
    end
    object ModelAddAttribute: TdxBarButton
      Caption = 'Attribute'
      Category = 4
      Hint = 'Attribute'
      Visible = ivAlways
      ImageIndex = 46
      OnClick = ModelAddMenuClick
    end
    object ModelAddOperation: TdxBarButton
      Caption = 'Operation'
      Category = 4
      Hint = 'Operation'
      Visible = ivAlways
      ImageIndex = 50
      OnClick = ModelAddMenuClick
    end
    object ModelAddParameter: TdxBarButton
      Caption = 'Parameter'
      Category = 4
      Hint = 'Parameter'
      Visible = ivAlways
      ImageIndex = 54
      OnClick = ModelAddMenuClick
    end
    object ModelAddTemplateParameter: TdxBarButton
      Caption = 'Template Parameter'
      Category = 4
      Hint = 'Template Parameter'
      Visible = ivAlways
      ImageIndex = 55
      OnClick = ModelAddMenuClick
    end
    object ModelAddEnumerationLiteral: TdxBarButton
      Caption = 'Enumeration Literal'
      Category = 4
      Hint = 'Enumeration Literal'
      Visible = ivAlways
      ImageIndex = 56
      OnClick = ModelAddMenuClick
    end
    object ModelAddSignal: TdxBarButton
      Caption = 'Signal'
      Category = 4
      Hint = 'Signal'
      Visible = ivAlways
      ImageIndex = 19
      OnClick = ModelAddMenuClick
    end
    object ModelAddObject: TdxBarButton
      Caption = 'Object'
      Category = 4
      Hint = 'Object'
      Visible = ivAlways
      ImageIndex = 73
      OnClick = ModelAddMenuClick
    end
    object ModelAddCollaboration: TdxBarButton
      Caption = 'Collaboration'
      Category = 4
      Hint = 'Collaboration'
      Visible = ivAlways
      ImageIndex = 30
      OnClick = ModelAddMenuClick
    end
    object ModelAddCollaborationInstanceSet: TdxBarButton
      Caption = 'Collaboration Instance Set'
      Category = 4
      Hint = 'Collaboration Instance Set'
      Visible = ivAlways
      ImageIndex = 31
      OnClick = ModelAddMenuClick
    end
    object ModelAddClassifierRole: TdxBarButton
      Caption = 'Classifier Role'
      Category = 4
      Hint = 'Classifier Role'
      Visible = ivAlways
      ImageIndex = 72
      OnClick = ModelAddMenuClick
    end
    object ModelAddInteraction: TdxBarButton
      Caption = 'Interaction'
      Category = 4
      Hint = 'Interaction'
      Visible = ivAlways
      ImageIndex = 32
      OnClick = ModelAddMenuClick
    end
    object ModelAddInteractionInstanceSet: TdxBarButton
      Caption = 'Interaction Instance Set'
      Category = 4
      Hint = 'Interaction Instance Set'
      Visible = ivAlways
      ImageIndex = 33
      OnClick = ModelAddMenuClick
    end
    object ModelAddStateMachine: TdxBarButton
      Caption = 'State Machine'
      Category = 4
      Hint = 'State Machine'
      Visible = ivAlways
      ImageIndex = 28
      OnClick = ModelAddMenuClick
    end
    object ModelAddState: TdxBarButton
      Caption = 'State'
      Category = 4
      Hint = 'State'
      Visible = ivAlways
      ImageIndex = 29
      OnClick = ModelAddMenuClick
    end
    object ModelAddSubmachineState: TdxBarButton
      Caption = 'Submachine State'
      Category = 4
      Hint = 'Submachine State'
      Visible = ivAlways
      ImageIndex = 45
      OnClick = ModelAddMenuClick
    end
    object ModelAddInitialState: TdxBarButton
      Caption = 'Initial State'
      Category = 4
      Hint = 'Initial State'
      Visible = ivAlways
      ImageIndex = 37
      OnClick = ModelAddMenuClick
    end
    object ModelAddFinalState: TdxBarButton
      Caption = 'Final State'
      Category = 4
      Hint = 'Final State'
      Visible = ivAlways
      ImageIndex = 43
      OnClick = ModelAddMenuClick
    end
    object ModelAddDecision: TdxBarButton
      Caption = 'Decision'
      Category = 4
      Hint = 'Decision'
      Visible = ivAlways
      ImageIndex = 36
      OnClick = ModelAddMenuClick
    end
    object ModelAddSynchronization: TdxBarButton
      Caption = 'Synchronization'
      Category = 4
      Hint = 'Synchronization'
      Visible = ivAlways
      ImageIndex = 38
      OnClick = ModelAddMenuClick
    end
    object ModelAddJunctionPoint: TdxBarButton
      Caption = 'Junction Point'
      Category = 4
      Hint = 'Junction Point'
      Visible = ivAlways
      ImageIndex = 39
      OnClick = ModelAddMenuClick
    end
    object ModelAddChoicePoint: TdxBarButton
      Caption = 'Choice Point'
      Category = 4
      Hint = 'Choice Point'
      Visible = ivAlways
      ImageIndex = 40
      OnClick = ModelAddMenuClick
    end
    object ModelAddShallowHistory: TdxBarButton
      Caption = 'Shallow History'
      Category = 4
      Hint = 'Shallow History'
      Visible = ivAlways
      ImageIndex = 41
      OnClick = ModelAddMenuClick
    end
    object ModelAddDeepHistory: TdxBarButton
      Caption = 'Deep History'
      Category = 4
      Hint = 'Deep History'
      Visible = ivAlways
      ImageIndex = 42
      OnClick = ModelAddMenuClick
    end
    object ModelAddSwimlane: TdxBarButton
      Caption = 'Swimlane'
      Category = 4
      Hint = 'Swimlane'
      Visible = ivAlways
      ImageIndex = 44
      OnClick = ModelAddMenuClick
    end
    object ModelAddEffect: TdxBarButton
      Caption = 'Effect'
      Category = 4
      Hint = 'Effect'
      Visible = ivAlways
      ImageIndex = 64
      OnClick = ModelAddMenuClick
    end
    object ModelAddEntryAction: TdxBarButton
      Caption = 'Entry Action'
      Category = 4
      Hint = 'Entry Action'
      Visible = ivAlways
      ImageIndex = 65
      OnClick = ModelAddMenuClick
    end
    object ModelAddDoAction: TdxBarButton
      Caption = 'Do Action'
      Category = 4
      Hint = 'Do Action'
      Visible = ivAlways
      ImageIndex = 66
      OnClick = ModelAddMenuClick
    end
    object ModelAddExitAction: TdxBarButton
      Caption = 'Exit Action'
      Category = 4
      Hint = 'Exit Action'
      Visible = ivAlways
      ImageIndex = 67
      OnClick = ModelAddMenuClick
    end
    object ModelAddActivityGraph: TdxBarButton
      Caption = 'Activity Graph'
      Category = 4
      Hint = 'Activity Graph'
      Visible = ivAlways
      ImageIndex = 27
      OnClick = ModelAddMenuClick
    end
    object ModelAddActionState: TdxBarButton
      Caption = 'Action State (Activity)'
      Category = 4
      Hint = 'Action State (Activity)'
      Visible = ivAlways
      ImageIndex = 34
      OnClick = ModelAddMenuClick
    end
    object ModelAddSubactivityState: TdxBarButton
      Caption = 'Subactivity State'
      Category = 4
      Hint = 'Subactivity State'
      Visible = ivAlways
      ImageIndex = 35
      OnClick = ModelAddMenuClick
    end
    object ModelAddSignalEvent: TdxBarButton
      Caption = 'Signal Event'
      Category = 4
      Hint = 'Signal Event'
      Visible = ivAlways
      ImageIndex = 68
      OnClick = ModelAddMenuClick
    end
    object ModelAddCallEvent: TdxBarButton
      Caption = 'Call Event'
      Category = 4
      Hint = 'Call Event'
      Visible = ivAlways
      ImageIndex = 69
      OnClick = ModelAddMenuClick
    end
    object ModelAddTimeEvent: TdxBarButton
      Caption = 'Time Event'
      Category = 4
      Hint = 'Time Event'
      Visible = ivAlways
      ImageIndex = 70
      OnClick = ModelAddMenuClick
    end
    object ModelAddChangeEvent: TdxBarButton
      Caption = 'ChangeEvent'
      Category = 4
      Hint = 'Change Event'
      Visible = ivAlways
      ImageIndex = 71
      OnClick = ModelAddMenuClick
    end
    object ModelAddException: TdxBarButton
      Caption = 'Exception'
      Category = 4
      Hint = 'Exception'
      Visible = ivAlways
      ImageIndex = 20
      OnClick = ModelAddMenuClick
    end
    object ModelAddObjectFlowState: TdxBarButton
      Caption = 'Object Flow State'
      Category = 4
      Hint = 'Object Flow State'
      Visible = ivAlways
      ImageIndex = 171
      OnClick = ModelAddMenuClick
    end
    object ModelAddFlowFinalState: TdxBarButton
      Caption = 'Flow Final State'
      Category = 4
      Hint = 'Flow Final State'
      Visible = ivAlways
      ImageIndex = 166
      OnClick = ModelAddMenuClick
    end
    object ModelAddSignalAcceptState: TdxBarButton
      Caption = 'Signal Accept State'
      Category = 4
      Hint = 'Signal Accept State'
      Visible = ivAlways
      ImageIndex = 159
      OnClick = ModelAddMenuClick
    end
    object ModelAddSignalSendState: TdxBarButton
      Caption = 'Signal Send State'
      Category = 4
      Hint = 'Signal Send State'
      Visible = ivAlways
      ImageIndex = 160
      OnClick = ModelAddMenuClick
    end
    object ModelAddArtifact: TdxBarButton
      Caption = 'Artifact'
      Category = 4
      Hint = 'Artifact'
      Visible = ivAlways
      ImageIndex = 176
      OnClick = ModelAddMenuClick
    end
    object ModelAddAttributeLink: TdxBarButton
      Caption = 'Attribute Link'
      Category = 4
      Hint = 'Attribute Link'
      Visible = ivAlways
      ImageIndex = 178
      OnClick = ModelAddMenuClick
    end
    object ModelAddPort: TdxBarButton
      Caption = 'Port'
      Category = 4
      Hint = 'Port'
      Visible = ivAlways
      ImageIndex = 173
      OnClick = ModelAddMenuClick
    end
    object ModelAddExtensionPoint: TdxBarButton
      Caption = 'Extension Point'
      Category = 4
      Hint = 'Extension Point'
      Visible = ivAlways
      ImageIndex = 177
      OnClick = ModelAddMenuClick
    end
    object ModelAddCombinedFragment: TdxBarButton
      Caption = 'Combined Fragment'
      Category = 4
      Hint = 'Combined Fragment'
      Visible = ivAlways
      ImageIndex = 163
      OnClick = ModelAddMenuClick
    end
    object ModelAddInteractionOperand: TdxBarButton
      Caption = 'Interaction Operand'
      Category = 4
      Hint = 'Interaction Operand'
      Visible = ivAlways
      ImageIndex = 169
      OnClick = ModelAddMenuClick
    end
    object ModelAddFrame: TdxBarButton
      Caption = 'Frame'
      Category = 4
      Hint = 'Frame'
      Visible = ivAlways
      ImageIndex = 167
      OnClick = ModelAddMenuClick
    end
    object ModelAddDiagramUsecaseDiagram: TdxBarButton
      Tag = 1
      Caption = 'Use Case Diagram'
      Category = 4
      Hint = 'Use Case Diagram'
      Visible = ivAlways
      ImageIndex = 92
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramClassDiagram: TdxBarButton
      Tag = 2
      Caption = 'Class Diagram'
      Category = 4
      Hint = 'Class Diagram'
      Visible = ivAlways
      ImageIndex = 91
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramSequenceRoleDiagram: TdxBarButton
      Caption = 'Sequence Diagram (Role)'
      Category = 4
      Hint = 'Sequence Diagram (Role)'
      Visible = ivAlways
      ImageIndex = 94
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramSequenceDiagram: TdxBarButton
      Tag = 3
      Caption = 'Sequence Diagram'
      Category = 4
      Hint = 'Sequence Diagram'
      Visible = ivAlways
      ImageIndex = 93
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramCollaborationRoleDiagram: TdxBarButton
      Caption = 'Collaboration Diagram (Role)'
      Category = 4
      Hint = 'Collaboration Diagram (Role)'
      Visible = ivAlways
      ImageIndex = 96
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramCollaborationDiagram: TdxBarButton
      Tag = 4
      Caption = 'Collaboration Diagram'
      Category = 4
      Hint = 'Collaboration Diagram'
      Visible = ivAlways
      ImageIndex = 95
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramStatechartDiagram: TdxBarButton
      Tag = 5
      Caption = 'Statechart Diagram'
      Category = 4
      Hint = 'Statechart Diagram'
      Visible = ivAlways
      ImageIndex = 97
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramActivityDiagram: TdxBarButton
      Tag = 6
      Caption = 'Activity Diagram'
      Category = 4
      Hint = 'Activity Diagram'
      Visible = ivAlways
      ImageIndex = 98
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramComponentDiagram: TdxBarButton
      Tag = 7
      Caption = 'Component Diagram'
      Category = 4
      Hint = 'Component Diagram'
      Visible = ivAlways
      ImageIndex = 99
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramDeploymentDiagram: TdxBarButton
      Tag = 8
      Caption = 'Deployment Diagram'
      Category = 4
      Hint = 'Deployment Diagram'
      Visible = ivAlways
      ImageIndex = 100
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramCompositeStructureDiagram: TdxBarButton
      Tag = 9
      Caption = 'Composite Structure Diagram'
      Category = 4
      Hint = 'Composite Structure Diagram'
      Visible = ivAlways
      ImageIndex = 179
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelCollectionEditor: TdxBarButton
      Caption = 'C&ollection Editor...'
      Category = 4
      Hint = 'Collection Editor'
      Visible = ivAlways
      ImageIndex = 148
      ShortCut = 16500
      OnClick = ModelMenuClick
    end
    object ModelConstraints: TdxBarButton
      Caption = '&Constraints...'
      Category = 4
      Hint = 'Constraints'
      Visible = ivAlways
      ImageIndex = 149
      ShortCut = 16501
      OnClick = ModelMenuClick
    end
    object ModelTaggedValues: TdxBarButton
      Caption = '&Tagged Values...'
      Category = 4
      Hint = 'Tagged Values'
      Visible = ivAlways
      ImageIndex = 150
      ShortCut = 16502
      OnClick = ModelMenuClick
    end
    object ModelProfiles: TdxBarButton
      Caption = '&Profiles...'
      Category = 4
      Hint = 'Profiles'
      Visible = ivAlways
      ImageIndex = 146
      ShortCut = 16503
      OnClick = ModelMenuClick
    end
    object ModelModelVerification: TdxBarButton
      Caption = '&Verify Model...'
      Category = 4
      Hint = 'Verify Model'
      Visible = ivAlways
      ImageIndex = 145
      ShortCut = 120
      OnClick = ModelMenuClick
    end
    object ModelProperty: TdxBarButton
      Caption = 'Properties'
      Category = 4
      Hint = 'Properties'
      Visible = ivAlways
      ShortCut = 121
      OnClick = ModelMenuClick
    end
    object ViewCloseDiagram: TdxBarButton
      Caption = '&Close Diagram'
      Category = 5
      Hint = 'Close Diagram'
      Visible = ivAlways
      ShortCut = 16499
      OnClick = ViewMenuClick
    end
    object ViewCloseAllDiagrams: TdxBarButton
      Caption = 'Close &All Diagrams'
      Category = 5
      Hint = 'Close All Diagrams'
      Visible = ivAlways
      ShortCut = 24691
      OnClick = ViewMenuClick
    end
    object ViewSelectInModelExplorer: TdxBarButton
      Caption = '&Select In Model Explorer'
      Category = 5
      Hint = 'Select In Model Explorer'
      Visible = ivAlways
      ShortCut = 16461
      OnClick = ViewMenuClick
    end
    object ViewRefresh: TdxBarButton
      Caption = '&Refresh'
      Category = 5
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 136
      ShortCut = 116
      OnClick = ViewMenuClick
    end
    object ViewZoom: TdxBarSubItem
      Caption = '&Zoom'
      Category = 5
      Hint = 'Zoom'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ViewZoomZoomIn'
        end
        item
          Visible = True
          ItemName = 'ViewZoomZoomOut'
        end
        item
          Visible = True
          ItemName = 'ViewZoomFitInWindow'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ViewZoom50'
        end
        item
          Visible = True
          ItemName = 'ViewZoom75'
        end
        item
          Visible = True
          ItemName = 'ViewZoom100'
        end
        item
          Visible = True
          ItemName = 'ViewZoom125'
        end
        item
          Visible = True
          ItemName = 'ViewZoom150'
        end
        item
          Visible = True
          ItemName = 'ViewZoom175'
        end
        item
          Visible = True
          ItemName = 'ViewZoom200'
        end>
    end
    object ViewZoomZoomIn: TdxBarButton
      Caption = 'Zoom &In'
      Category = 5
      Hint = 'Zoom In'
      Visible = ivAlways
      ImageIndex = 133
      OnClick = ViewMenuClick
    end
    object ViewZoomZoomOut: TdxBarButton
      Caption = 'Zoom &Out'
      Category = 5
      Hint = 'Zoom Out'
      Visible = ivAlways
      ImageIndex = 134
      OnClick = ViewMenuClick
    end
    object ViewZoomFitInWindow: TdxBarButton
      Caption = '&Fit To Window'
      Category = 5
      Hint = 'Fit To Window'
      Visible = ivAlways
      ImageIndex = 135
      OnClick = ViewMenuClick
    end
    object ViewZoom50: TdxBarButton
      Caption = '50%'
      Category = 5
      Hint = '50%'
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewZoom75: TdxBarButton
      Caption = '75%'
      Category = 5
      Hint = '75%'
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewZoom100: TdxBarButton
      Caption = '100%'
      Category = 5
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewZoom125: TdxBarButton
      Caption = '125%'
      Category = 5
      Hint = '125%'
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewZoom150: TdxBarButton
      Caption = '150%'
      Category = 5
      Hint = '150%'
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewZoom175: TdxBarButton
      Caption = '175%'
      Category = 5
      Hint = '175%'
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewZoom200: TdxBarButton
      Caption = '200%'
      Category = 5
      Hint = '200%'
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewToolbars: TdxBarSubItem
      Caption = '&Toolbars'
      Category = 5
      Hint = 'Toolbars'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ViewToolbarsStandard'
        end
        item
          Visible = True
          ItemName = 'ViewToolbarsFormat'
        end
        item
          Visible = True
          ItemName = 'ViewToolbarsView'
        end
        item
          Visible = True
          ItemName = 'ViewToolbarsAlignment'
        end
        item
          Visible = True
          ItemName = 'ViewToolbarsStatusBar'
        end>
    end
    object ViewToolbarsStandard: TdxBarButton
      Caption = '&Standard'
      Category = 5
      Hint = 'Standard'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuMainFormOnlyClick
    end
    object ViewToolbarsFormat: TdxBarButton
      Caption = '&Format'
      Category = 5
      Hint = 'Format'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuMainFormOnlyClick
    end
    object ViewToolbarsView: TdxBarButton
      Caption = '&View'
      Category = 5
      Hint = 'View'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuMainFormOnlyClick
    end
    object ViewToolbarsAlignment: TdxBarButton
      Caption = '&Alignment'
      Category = 5
      Hint = 'Alignment'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuMainFormOnlyClick
    end
    object ViewToolbarsStatusBar: TdxBarButton
      Caption = 'Status &Bar'
      Category = 5
      Hint = 'Status Bar'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuMainFormOnlyClick
    end
    object ViewZoomCombo: TdxBarCombo
      Caption = 'Zoom'
      Category = 5
      Hint = 'Zoom'
      Visible = ivAlways
      OnChange = ViewZoomComboChange
      Items.Strings = (
        '50%'
        '75%'
        '100%'
        '125%'
        '150%'
        '175%'
        '200%')
      ItemIndex = -1
    end
    object ViewModelExplorer: TdxBarButton
      Caption = 'Model Explorer'
      Category = 5
      Hint = 'Model Explorer'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewDiagramExplorer: TdxBarButton
      Caption = 'Diagram Explorer'
      Category = 5
      Hint = 'Diagram Explorer'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewPropertyEditor: TdxBarButton
      Caption = 'Properties'
      Category = 5
      Hint = 'Properties'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewDocumentationEditor: TdxBarButton
      Caption = 'Documentations'
      Category = 5
      Hint = 'Documentations'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewAttachmentEditor: TdxBarButton
      Caption = 'Attachments'
      Category = 5
      Hint = 'Attachments'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewOutputWindow: TdxBarButton
      Caption = 'Output'
      Category = 5
      Hint = 'Output'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewMessageWindow: TdxBarButton
      Caption = 'Messages'
      Category = 5
      Hint = 'Messages'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewToolbox: TdxBarButton
      Caption = 'Toolbox'
      Category = 5
      Hint = 'Toolbox'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewDiagramPages: TdxBarSubItem
      Caption = 'Pages'
      Category = 5
      Hint = 'Pages'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ViewDiagramPageList'
        end>
    end
    object ViewDiagramPageList: TdxBarListItem
      Caption = 'Diagram Page List'
      Category = 5
      Visible = ivAlways
      OnClick = ViewMenuClick
      ShowCheck = True
      ShowNumbers = False
    end
    object ViewUITheme: TdxBarSubItem
      Caption = '&UI Theme'
      Category = 5
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ViewUIThemeModern'
        end
        item
          Visible = True
          ItemName = 'ViewUIThemeClassic'
        end
        item
          Visible = True
          ItemName = 'ViewUIThemeNative'
        end>
    end
    object ViewUIThemeModern: TdxBarButton
      Caption = '&Modern (Office 2003)'
      Category = 5
      Hint = 'Modern (Office 2003)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 10
      OnClick = ViewUIThemeModernClick
    end
    object ViewUIThemeClassic: TdxBarButton
      Caption = '&Classic (StarUML)'
      Category = 5
      Hint = 'Classic (StarUML)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 10
      OnClick = ViewUIThemeClassicClick
    end
    object ViewUIThemeNative: TdxBarButton
      Caption = '&Native'
      Category = 5
      Hint = 'Native'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 10
      OnClick = ViewUIThemeNativeClick
    end
    object ToolsOptions: TdxBarButton
      Caption = '&Options...'
      Category = 6
      Hint = 'Options'
      Visible = ivAlways
      OnClick = ToolsMenuClick
    end
    object ToolsAddInManager: TdxBarButton
      Caption = '&Add-In Manager...'
      Category = 6
      Hint = 'Add-In Manager'
      Visible = ivAlways
      OnClick = ToolsMenuClick
    end
    object HelpContents: TdxBarButton
      Caption = '&Contents...'
      Category = 7
      Hint = 'Contents'
      Visible = ivAlways
      ImageIndex = 143
      ShortCut = 112
      OnClick = HelpMenuClick
    end
    object HelpAbout: TdxBarButton
      Caption = '&About...'
      Category = 7
      Hint = 'About'
      Visible = ivAlways
      OnClick = HelpMenuClick
    end
    object StatusBarInfo: TdxBarStatic
      Align = iaClient
      Category = 8
      Visible = ivAlways
      Alignment = taLeftJustify
      BorderStyle = sbsLowered
    end
    object StatusBarProgress: TdxBarProgressItem
      Category = 8
      Visible = ivAlways
      RightIndent = 2
      ShowCaption = False
      Width = 100
    end
    object StatusBarModifiedInfo: TdxBarStatic
      Category = 8
      Visible = ivAlways
      BorderStyle = sbsLowered
      RightIndent = 2
      Width = 70
    end
    object InspectorAttachmentOpen: TdxBarButton
      Caption = '&Open'
      Category = 9
      Hint = 'Open'
      Visible = ivAlways
      ImageIndex = 137
      OnClick = InspectorAttachmentButtonClick
    end
    object InspectorAttachmentAdd: TdxBarButton
      Caption = '&Add...'
      Category = 9
      Hint = 'Add'
      Visible = ivAlways
      ImageIndex = 138
      OnClick = InspectorAttachmentButtonClick
    end
    object InspectorAttachmentDelete: TdxBarButton
      Caption = '&Delete'
      Category = 9
      Hint = 'Delete'
      Visible = ivAlways
      ImageIndex = 139
      OnClick = InspectorAttachmentButtonClick
    end
    object InspectorAttachmentEdit: TdxBarButton
      Caption = '&Edit...'
      Category = 9
      Hint = 'Edit'
      Visible = ivAlways
      ImageIndex = 140
      OnClick = InspectorAttachmentButtonClick
    end
    object InspectorAttachmentMoveUp: TdxBarButton
      Caption = 'Move &Up'
      Category = 9
      Hint = 'Move Up'
      Visible = ivAlways
      ImageIndex = 141
      OnClick = InspectorAttachmentButtonClick
    end
    object InspectorAttachmentMoveDown: TdxBarButton
      Caption = 'Move &Down'
      Category = 9
      Hint = 'Move Down'
      Visible = ivAlways
      ImageIndex = 142
      OnClick = InspectorAttachmentButtonClick
    end
    object MessagesClearAll: TdxBarButton
      Caption = '&Clear Messages'
      Category = 10
      Hint = 'Clear Messages'
      Visible = ivAlways
      OnClick = InformationMessagesButtonClick
    end
    object MessagesClearFindResults: TdxBarButton
      Caption = 'Clear &Search Results'
      Category = 10
      Hint = 'Clear Search Results'
      Visible = ivAlways
      OnClick = InformationMessagesButtonClick
    end
    object MessagesClearVerificationResults: TdxBarButton
      Caption = 'Clear &Verification Results'
      Category = 10
      Hint = 'Clear Verification Results'
      Visible = ivAlways
      OnClick = InformationMessagesButtonClick
    end
    object MessagesSaveMessages: TdxBarButton
      Caption = '&Save Messages...'
      Category = 10
      Hint = 'Save Messages'
      Visible = ivAlways
      OnClick = InformationMessagesButtonClick
    end
    object FormatFont: TdxBarButton
      Caption = '&Font...'
      Category = 11
      Hint = 'Font'
      Visible = ivAlways
      ImageIndex = 112
      OnClick = FormatMenuClick
    end
    object FormatLineColor: TdxBarButton
      Caption = 'Lin&e Color...'
      Category = 11
      Hint = 'Line Color'
      Visible = ivAlways
      ImageIndex = 113
      OnClick = FormatMenuClick
    end
    object FormatFillColor: TdxBarButton
      Caption = 'Fill &Color...'
      Category = 11
      Hint = 'Fill Color'
      Visible = ivAlways
      ImageIndex = 114
      OnClick = FormatMenuClick
    end
    object FormatLineStyle: TdxBarSubItem
      Caption = 'Line &Style'
      Category = 11
      Hint = 'Line Style'
      Visible = ivAlways
      ImageIndex = 115
      ShowCaption = False
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FormatLineStyleRectilinear'
        end
        item
          Visible = True
          ItemName = 'FormatLineStyleOblique'
        end>
    end
    object FormatLineStyleRectilinear: TdxBarButton
      Caption = '&Rectlinear'
      Category = 11
      Hint = 'Rectlinear'
      Visible = ivAlways
      AllowAllUp = True
      ButtonStyle = bsChecked
      GroupIndex = 9
      ShortCut = 16460
      OnClick = FormatMenuClick
    end
    object FormatLineStyleOblique: TdxBarButton
      Caption = '&Oblique'
      Category = 11
      Hint = 'Oblique'
      Visible = ivAlways
      AllowAllUp = True
      ButtonStyle = bsChecked
      GroupIndex = 9
      ShortCut = 16450
      OnClick = FormatMenuClick
    end
    object FormatStereotypeDisplay: TdxBarSubItem
      Caption = 'Stereotype &Display'
      Category = 11
      Hint = 'Stereotype Display'
      Visible = ivAlways
      ImageIndex = 153
      ShowCaption = False
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FormatStereotypeDisplayNone'
        end
        item
          Visible = True
          ItemName = 'FormatStereotypeDisplayText'
        end
        item
          Visible = True
          ItemName = 'FormatStereotypeDisplayIcon'
        end
        item
          Visible = True
          ItemName = 'FormatStereotypeDisplayDecoration'
        end>
    end
    object FormatStereotypeDisplayNone: TdxBarButton
      Caption = '&None'
      Category = 11
      Hint = 'None'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ShortCut = 24654
      OnClick = FormatMenuClick
    end
    object FormatStereotypeDisplayText: TdxBarButton
      Caption = '&Textual'
      Category = 11
      Hint = 'Textual'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ShortCut = 24660
      OnClick = FormatMenuClick
    end
    object FormatStereotypeDisplayIcon: TdxBarButton
      Caption = '&Iconic'
      Category = 11
      Hint = 'Iconic'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ShortCut = 24649
      OnClick = FormatMenuClick
    end
    object FormatStereotypeDisplayDecoration: TdxBarButton
      Caption = 'D&ecoration'
      Category = 11
      Hint = 'Decoration'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ShortCut = 24645
      OnClick = FormatMenuClick
    end
    object FormatShowExtendedNotation: TdxBarButton
      Caption = 'Show As Extended Notation'
      Category = 11
      Hint = 'Show As Extended Notation'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 158
      OnClick = FormatCheckTypeMenuClick
    end
    object FormatSuppressAttributes: TdxBarButton
      Caption = 'Suppress &Attributes'
      Category = 11
      Hint = 'Suppress Attributes'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 116
      ShortCut = 24641
      OnClick = FormatCheckTypeMenuClick
    end
    object FormatSuppressOperations: TdxBarButton
      Caption = 'Suppress &Operations'
      Category = 11
      Hint = 'Suppress Operations'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 117
      ShortCut = 24655
      OnClick = FormatCheckTypeMenuClick
    end
    object FormatSuppressEnumerationLiterals: TdxBarButton
      Caption = 'Suppress &Literals'
      Category = 11
      Hint = 'Suppress Literals'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 118
      ShortCut = 24652
      OnClick = FormatCheckTypeMenuClick
    end
    object FormatWordWrap: TdxBarButton
      Caption = 'Word &Wrap Name'
      Category = 11
      Hint = 'Word Wrap Name'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 180
      OnClick = FormatCheckTypeMenuClick
    end
    object FormatShowParentName: TdxBarButton
      Caption = 'Show Parent &Name'
      Category = 11
      Hint = 'Show Parent Name'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 119
      OnClick = FormatCheckTypeMenuClick
    end
    object FormatShowOperationSignature: TdxBarButton
      Caption = 'Show Operation S&ignature'
      Category = 11
      Hint = 'Show Operation Signature'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 120
      OnClick = FormatCheckTypeMenuClick
    end
    object FormatShowProperty: TdxBarButton
      Caption = 'Show &Properties'
      Category = 11
      Hint = 'Show Properties'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 157
      OnClick = FormatCheckTypeMenuClick
    end
    object FormatShowCompartmentVisibility: TdxBarButton
      Caption = 'Show Compartment &Visibility'
      Category = 11
      Hint = 'Show Compartment Visibility'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 121
      OnClick = FormatCheckTypeMenuClick
    end
    object FormatShowCompartmentStereotype: TdxBarButton
      Caption = 'Show Compartment S&tereotype'
      Category = 11
      Hint = 'Show Compartment Stereotype'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 122
      OnClick = FormatCheckTypeMenuClick
    end
    object FormatAutoResize: TdxBarButton
      Caption = 'Auto &Resize'
      Category = 11
      Hint = 'Auto Resize'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 152
      OnClick = FormatCheckTypeMenuClick
    end
    object FormatAlignment: TdxBarSubItem
      Caption = 'Ali&gnment'
      Category = 11
      Hint = 'Alignment'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FormatAlignmentBringToFront'
        end
        item
          Visible = True
          ItemName = 'FormatAlignmentSendToBack'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatAlignmentLeft'
        end
        item
          Visible = True
          ItemName = 'FormatAlignmentRight'
        end
        item
          Visible = True
          ItemName = 'FormatAlignmentMiddle'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatAlignmentTop'
        end
        item
          Visible = True
          ItemName = 'FormatAlignmentBottom'
        end
        item
          Visible = True
          ItemName = 'FormatAlignmentCenter'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'FormatAlignmentSpaceEvenlyHorizontally'
        end
        item
          Visible = True
          ItemName = 'FormatAlignmentSpaceEvenlyVertically'
        end>
    end
    object FormatAlignmentSendToBack: TdxBarButton
      Caption = 'Send to Bac&k'
      Category = 11
      Hint = 'Send to Back'
      Visible = ivAlways
      ImageIndex = 124
      OnClick = FormatMenuClick
    end
    object FormatAlignmentBringToFront: TdxBarButton
      Caption = 'Bring to Fron&t'
      Category = 11
      Hint = 'Bring to Front'
      Visible = ivAlways
      ImageIndex = 123
      OnClick = FormatMenuClick
    end
    object FormatAlignmentLeft: TdxBarButton
      Caption = 'Align &Left'
      Category = 11
      Hint = 'Align Left'
      Visible = ivAlways
      ImageIndex = 125
      OnClick = FormatMenuClick
    end
    object FormatAlignmentRight: TdxBarButton
      Caption = 'Align &Right'
      Category = 11
      Hint = 'Align Right'
      Visible = ivAlways
      ImageIndex = 126
      OnClick = FormatMenuClick
    end
    object FormatAlignmentMiddle: TdxBarButton
      Caption = 'Align &Middle'
      Category = 11
      Hint = 'Align Middle'
      Visible = ivAlways
      ImageIndex = 127
      OnClick = FormatMenuClick
    end
    object FormatAlignmentTop: TdxBarButton
      Caption = 'Align &Top'
      Category = 11
      Hint = 'Align Top'
      Visible = ivAlways
      ImageIndex = 128
      OnClick = FormatMenuClick
    end
    object FormatAlignmentBottom: TdxBarButton
      Caption = 'Align &Bottom'
      Category = 11
      Hint = 'Align Bottom'
      Visible = ivAlways
      ImageIndex = 129
      OnClick = FormatMenuClick
    end
    object FormatAlignmentCenter: TdxBarButton
      Caption = 'Align &Center'
      Category = 11
      Hint = 'Align Center'
      Visible = ivAlways
      ImageIndex = 130
      OnClick = FormatMenuClick
    end
    object FormatAlignmentSpaceEvenlyHorizontally: TdxBarButton
      Caption = 'Space Equally, &Horizontally'
      Category = 11
      Hint = 'Space Equally, Horizontally'
      Visible = ivAlways
      ImageIndex = 131
      OnClick = FormatMenuClick
    end
    object FormatAlignmentSpaceEvenlyVertically: TdxBarButton
      Caption = 'Space Equally, &Vertically'
      Category = 11
      Hint = 'Space Equally, Vertically'
      Visible = ivAlways
      ImageIndex = 132
      OnClick = FormatMenuClick
    end
    object FormatFontNameCombo: TdxBarFontNameCombo
      Caption = 'Font Face'
      Category = 11
      Hint = 'Font Face'
      Visible = ivAlways
      OnChange = FormatFontNameComboChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888444488844444488887488888744
        7888888448888744888888874888844788888888444444488888888874884478
        8888888884484488888888888744478888888888884448888888888888747888
        8888888888848888888888888888888888888888888888888888}
      Width = 160
      DropDownCount = 12
    end
    object FormatFontSizeCombo: TdxBarCombo
      Caption = 'Font Size'
      Category = 11
      Hint = 'Font Size'
      Visible = ivAlways
      OnChange = FormatFontSizeComboChange
      Width = 50
      DropDownCount = 12
      Items.Strings = (
        '8'
        '9'
        '10'
        '11'
        '12'
        '14'
        '16'
        '18'
        '20'
        '22'
        '24'
        '26'
        '28'
        '36'
        '48')
      ItemIndex = -1
    end
    object FormatLayoutDiagram: TdxBarButton
      Caption = 'La&yout Diagram'
      Category = 11
      Hint = 'Layout Diagram'
      Visible = ivAlways
      ImageIndex = 147
      OnClick = FormatMenuClick
    end
    object FormatAnnotationLineStyle: TdxBarSubItem
      Caption = '&Annotation Line Style'
      Category = 11
      Hint = 'Annotation Line Style'
      Visible = ivAlways
      ImageIndex = 183
      ShowCaption = False
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FormatAnnotationLineStyleSolid'
        end
        item
          Visible = True
          ItemName = 'FormatAnnotationLineStyleDash'
        end
        item
          Visible = True
          ItemName = 'FormatAnnotationLineStyleDot'
        end
        item
          Visible = True
          ItemName = 'FormatAnnotationLineStyleDashDot'
        end
        item
          Visible = True
          ItemName = 'FormatAnnotationLineStyleDashDotDot'
        end>
    end
    object FormatAnnotationLineStyleSolid: TdxBarButton
      Caption = 'Solid'
      Category = 11
      Hint = 'Solid Line'
      Visible = ivAlways
      AllowAllUp = True
      ButtonStyle = bsChecked
      DropDownEnabled = False
      GroupIndex = 11
      OnClick = FormatMenuClick
    end
    object FormatAnnotationLineStyleDash: TdxBarButton
      Caption = 'Dash'
      Category = 11
      Hint = 'Dash Line'
      Visible = ivAlways
      AllowAllUp = True
      ButtonStyle = bsChecked
      DropDownEnabled = False
      GroupIndex = 11
      OnClick = FormatMenuClick
    end
    object FormatAnnotationLineStyleDot: TdxBarButton
      Caption = 'Dot'
      Category = 11
      Hint = 'Dot'
      Visible = ivAlways
      AllowAllUp = True
      ButtonStyle = bsChecked
      DropDownEnabled = False
      GroupIndex = 11
      OnClick = FormatMenuClick
    end
    object FormatAnnotationLineStyleDashDot: TdxBarButton
      Caption = 'Dash-Dot'
      Category = 11
      Hint = 'Dash-Dot'
      Visible = ivAlways
      AllowAllUp = True
      ButtonStyle = bsChecked
      DropDownEnabled = False
      GroupIndex = 11
      OnClick = FormatMenuClick
    end
    object FormatAnnotationLineStyleDashDotDot: TdxBarButton
      Caption = 'Dash-Dot-Dot'
      Category = 11
      Hint = 'Dash-Dot-Dot'
      Visible = ivAlways
      AllowAllUp = True
      ButtonStyle = bsChecked
      DropDownEnabled = False
      GroupIndex = 11
      OnClick = FormatMenuClick
    end
    object AllModelsGroup: TdxBarGroup
      Items = (
        'ModelAddParameter'
        'ModelAddTemplateParameter'
        'ModelAddEnumerationLiteral'
        'ModelAddClassifierRole'
        'ModelAddInteraction'
        'ModelAddInteractionInstanceSet'
        'ModelAddState'
        'ModelAddSubmachineState'
        'ModelAddInitialState'
        'ModelAddFinalState'
        'ModelAddDecision'
        'ModelAddSynchronization'
        'ModelAddJunctionPoint'
        'ModelAddChoicePoint'
        'ModelAddShallowHistory'
        'ModelAddDeepHistory'
        'ModelAddSwimlane'
        'ModelAddActionState'
        'ModelAddSubactivityState'
        'NamespacesGroup'
        'ClassifiersGroup'
        'InstancesGroup'
        'BehaviorsGroup'
        'EventsGroup'
        'FeaturesGroup'
        'ActionsGroup'
        'ModelAddEffect'
        'ModelAddObjectFlowState'
        'ModelAddFlowFinalState'
        'ModelAddSignalAcceptState'
        'ModelAddSignalSendState'
        'ModelAddAttributeLink'
        'ModelAddPort'
        'ModelAddExtensionPoint'
        'ModelAddCombinedFragment'
        'ModelAddInteractionOperand'
        'ModelAddFrame')
    end
    object NamespacesGroup: TdxBarGroup
      Items = (
        'ModelAddModel'
        'ModelAddSubsystem'
        'ModelAddPackage')
    end
    object ClassifiersGroup: TdxBarGroup
      Items = (
        'ModelAddClass'
        'ModelAddInterface'
        'ModelAddEnumeration'
        'ModelAddComponent'
        'ModelAddNode'
        'ModelAddUseCase'
        'ModelAddActor'
        'ModelAddSignal'
        'ModelAddException'
        'ModelAddArtifact')
    end
    object InstancesGroup: TdxBarGroup
      Items = (
        'ModelAddComponentInstance'
        'ModelAddNodeInstance'
        'ModelAddObject')
    end
    object BehaviorsGroup: TdxBarGroup
      Items = (
        'ModelAddCollaboration'
        'ModelAddCollaborationInstanceSet'
        'ModelAddStateMachine'
        'ModelAddActivityGraph')
    end
    object FeaturesGroup: TdxBarGroup
      Items = (
        'ModelAddAttribute'
        'ModelAddOperation')
    end
    object ActionsGroup: TdxBarGroup
      Items = (
        'ModelAddEntryAction'
        'ModelAddDoAction'
        'ModelAddExitAction')
    end
    object EventsGroup: TdxBarGroup
      Items = (
        'ModelAddSignalEvent'
        'ModelAddCallEvent'
        'ModelAddTimeEvent'
        'ModelAddChangeEvent')
    end
    object AllDiagramsGroup: TdxBarGroup
      Items = (
        'ModelAddDiagramUsecaseDiagram'
        'ModelAddDiagramClassDiagram'
        'ModelAddDiagramComponentDiagram'
        'ModelAddDiagramDeploymentDiagram'
        'ModelAddDiagramCompositeStructureDiagram'
        'BehavioralDiagramsGroup')
    end
    object BehavioralDiagramsGroup: TdxBarGroup
      Items = (
        'ModelAddDiagramSequenceRoleDiagram'
        'ModelAddDiagramSequenceDiagram'
        'ModelAddDiagramCollaborationRoleDiagram'
        'ModelAddDiagramCollaborationDiagram'
        'ModelAddDiagramStatechartDiagram'
        'ModelAddDiagramActivityDiagram')
    end
    object AlwaysGroup: TdxBarGroup
      Items = (
        'FileNew'
        'FileSelectProject'
        'FileOpen'
        'FileImport'
        'FilePageSetup'
        'FileRecentFiles'
        'FileRecentFilesMRU'
        'FileExit'
        'ViewToolbars'
        'ViewToolbarsStandard'
        'ViewToolbarsFormat'
        'ViewToolbarsView'
        'ViewToolbarsAlignment'
        'ViewToolbarsStatusBar'
        'ToolsOptions'
        'ToolsAddInManager'
        'HelpContents'
        'HelpAbout'
        'FileCreate'
        'ViewUITheme'
        'ViewUIThemeModern'
        'ViewUIThemeClassic'
        'ViewUIThemeNative')
    end
    object ProjectOpenedGroup: TdxBarGroup
      Items = (
        'FileSave'
        'FileSaveAs'
        'FileClose'
        'FileUnits'
        'FileImportModelFragment'
        'FileImportFramework'
        'FileExport'
        'FilePrint'
        'EditFind'
        'ModelProfiles'
        'ModelModelVerification')
    end
    object DiagramActivatedGroup: TdxBarGroup
      Items = (
        'FileExportDiagram'
        'FormatLayoutDiagram'
        'ViewCloseDiagram'
        'ViewCloseAllDiagrams'
        'ViewRefresh'
        'ViewZoom'
        'ViewZoomZoomIn'
        'ViewZoomZoomOut'
        'ViewZoomFitInWindow'
        'ViewZoom50'
        'ViewZoom75'
        'ViewZoom100'
        'ViewZoom125'
        'ViewZoom150'
        'ViewZoom175'
        'ViewZoom200'
        'ViewZoomCombo')
    end
    object ViewSelectedGroup: TdxBarGroup
      Items = (
        'FormatFont'
        'FormatLineColor'
        'FormatFillColor'
        'FormatAlignment'
        'FormatAlignmentSendToBack'
        'FormatAlignmentBringToFront'
        'FormatFontNameCombo'
        'FormatFontSizeCombo')
    end
    object ModelSelectedGroup: TdxBarGroup
      Items = (
        'ModelCollectionEditor'
        'ModelConstraints'
        'ModelTaggedValues'
        'ViewSelectInModelExplorer')
    end
    object UnitSelectedGroup: TdxBarGroup
      Items = (
        'FileUnitsMergeUnit'
        'FileUnitsSave'
        'FileUnitsSaveAs'
        'FileUnitsDeleteUnit')
    end
    object ViewUIThemeGroup: TdxBarGroup
      Items = (
        'ViewUIThemeModern'
        'ViewUIThemeClassic'
        'ViewUIThemeNative')
    end
  end
  object SaveDialog: TSaveDialogEx
    DefaultExt = 'uml'
    Filter = 'StarUML Project File(*.uml)|*.uml'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save As'
    Left = 436
    Top = 104
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'uml'
    Filter = 'StarUML Project File(*.uml)|*.uml|All Files(*.*)|*.*'
    Options = [ofHideReadOnly, ofShareAware, ofEnableSizing]
    Title = 'Open'
    Left = 436
    Top = 152
  end
  object TotalImageList: TImageList
    Left = 492
    Top = 304
    Bitmap = {
      494C0101B800BD00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000F0020000010020000000000000F0
      0200000000000000000000000000000000000000000000000000000000000000
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
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00004080FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00004080FF004080FF000000FF00FFFFFF000000BB000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00004080FF004080FF004080FF00FFFFFF000000BB000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      8400848484008484840000000000000000000000000000000000000000000000
      00004080FF004080FF004080FF004080FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      840000FFFF000000000000000000000000000000000000000000000000000000
      00004080FF004080FF004080FF004080FF004080FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000004080FF000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004080FF000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004080FF004080FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400848484008484840084848400848484000000000000000000000000000000
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
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400808080008080
      80008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080400000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00C6C6C6000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF0000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000804000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00C6C6C6000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF00000080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF0000008040000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C6000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF00000080400000000000000000
      000000000000000000000000000000000000000000008484840000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00C6C6C6000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF0000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000804000000000
      000000000000000000000000000000000000000000008484840000FFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00C6C6C6000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484840000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600C6C6C600C6C6C6000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00808080000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
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
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF0000FFFF0084848400848484008484840084848400848484000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000848484008484
      840084848400848484000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000008000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      80000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00000080000000800000008000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF0000FFFFFF000080000000800000008000000080
      00000080000000800000008000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000008000000080
      00000080000000800000008000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFF
      FF000080000000800000008000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF000000800000000000000000000000000000848484008484
      840000FFFF00848484008484840000FFFF00848484008484840000FFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000FFFF00808080008080800080808000808080008080
      80008080800000FFFF00000000000000000000000000FFFFFF00FFFF0000FFFF
      FF00FFFF0000D8E9EC00D8E9EC00FFFFFF00FFFF0000FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF00000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      0000D8E9EC00FFFFFF0000FFFF00D8E9EC00FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000FFFFFF00FFFF0000FFFF
      FF00D8E9EC0000FFFF00FFFFFF00D8E9EC00FFFF0000FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF00000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      0000FFFFFF00D8E9EC00D8E9EC00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF00000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080008080
      80008080800080808000808080000000000000000000FFFFFF00FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0084848400848484008484840084848400848484000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      84008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0084848400848484008484840084848400848484000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000848484008484
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
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000848484008484
      840000FFFF00848484008484840000FFFF00848484008484840000FFFF008484
      840084848400000000000000000000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000848484008484
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      00008000000080000000800000008000000000000000FFFFFF00D8E9EC00FFFF
      FF00D8E9EC00FFFFFF00D8E9EC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      00008000000080000000800000008000000000000000D8E9EC00FFFFFF00D8E9
      EC00FFFFFF00D8E9EC00FFFFFF000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      000000000000FFFFFF00D8E9EC00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000D8E9EC00FFFFFF00000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400000000008484840000000000848484000000
      0000000000000000000000000000000000000000000000000000800000008000
      00008000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000099A8AC00FFFFFF00D8E9EC00000000000000000000000000000000000000
      00008080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00D8E9EC00FFFFFF00000000000000000000000000000000008080
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099A8AC0000000000FFFFFF00FFFFFF00FFFFFF000000000099A8
      AC00D8E9EC00FFFFFF00D8E9EC000000000000000000000000008080800000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000000099A8
      AC00000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099A8AC0000000000FFFFFF000000000099A8AC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000099A8AC000000000099A8AC00000000000000
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
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF0000000084
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF00000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF000000FFFF0000FFFF00FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF000000FFFF0000FFFF00FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
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
      0000848484000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400000000000000000000000000840000000000
      0000000000008400000084000000000000008400000000000000840000008400
      0000000000000000000084000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400000000
      0000000000008484840000000000848484000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      840000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000848400008484
      0000000000000000000084848400000000000000000000000000000000008400
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00008484
      0000848400000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000084848400C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084840000000000FFFF
      00000000000000000000848484000000000084848400C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFF
      FF000000000000000000000000000000000084848400C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00FFFFFF00000000000084840000848400008484000000
      00000000000084848400000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00FFFFFF0000000000FFFFFF0084848400FFFFFF00FFFF
      FF000000000000000000000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000848400008484000084
      84000000000000000000848484000000000084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000008484000000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000008484000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00FFFFFF000000000000FFFF0000FFFF00008484000084
      84000084840000000000000000008484840084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C60000000000FFFF0000848400008484000000000000FFFFFF00FFFF
      FF000000000000000000000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C60000000000FFFF0000848400008484000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FFFF000084
      84000000000000000000848484000000000084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFF0000848400008484000000000000FFFF
      FF000000000000000000000000000000000084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFF0000848400008484000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      84008484840084848400000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF000000
      0000FFFFFF0084848400000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00FFFFFF0000000000FFFF000000000000FFFFFF00FFFF
      FF000000000000000000000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00FFFFFF0000000000FFFF000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF008484840000000000000000000000000084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
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
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C60000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000848400000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF00000000000000FF000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FF000000FF000000FFFFFF0000FFFF00FFFF
      FF00C6C6C600000000000000000000000000000000000000FF000000FF000000
      00000000FF000000FF00000000000000000000000000FFFF0000848400008484
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FF00000000000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FF000000000000000000000000000000000000000000000084848400FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF0000000000000000000000000000000000FFFF00008484
      000084840000000000000000000000000000000000000000000084848400FFFF
      FF0084000000FFFFFF0084000000FFFFFF0084000000FFFFFF0084000000FFFF
      FF00000000000000000000000000000000000000000000000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FF00000000000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FF000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000848484008484840000000000FFFF
      0000000000000000000000000000000000000000000000000000848484008400
      0000FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF008400
      0000000000000000000000000000000000000000000000000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FF00000000000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FF000000000000000000000000000000000000000000000084848400FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      0000FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF008400
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF00000000000000FF000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FF000000FF00000000FFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF008484840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF0084000000FFFFFF0084000000FFFFFF0084000000FFFFFF0084000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FF000000FF000000FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      00000084840000000000000000000000FF008484840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FFFF
      FF00C6C6C60000000000000000000000000000000000000000000000000000FF
      FF00008484000084840000000000848484000000FF0084848400000000008400
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF0000FFFF00FF000000FF000000FFFFFF0000FFFF00FF000000FF000000FFFF
      FF00C6C6C600000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000084840000848400000000000000000000000000FF0000008400
      000084000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF00000000FFFF00FFFF
      FF00C6C6C60000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF000084840000848400000000000000000000000000FF00
      000084000000840000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000FF000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000840084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400840084008400008484008400840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      84008400840000848400FFFFFF00C6C6C600FFFFFF0084008400000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000084008400840084000084
      8400FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600FFFFFF00840084000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000008400840000848400FFFFFF00FFFF
      FF00C6C6C600C6C6C600848484008400840084848400C6C6C600FFFFFF008400
      8400000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00840000008400000084000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      00000000000000000000000000000000000084008400C6C6C600C6C6C600C6C6
      C600848484008400840084008400C621E7000000000084848400C6C6C600FFFF
      FF00840084000000000000000000000000000000000000000000FFFFFF008484
      000084000000008400000000840084840000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      00000000000000000000000000000000000084008400C6C6C600848484008400
      840084008400C621E700C621E700C621E700840084000000000084848400C6C6
      C600FFFFFF008400840000000000000000000000000000000000FFFFFF008484
      0000000000000084000000840000008484000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      000000000000000000000000000000000000840084008400840084008400C621
      E700C621E7008400840084008400C621E700C621E70084008400000000008484
      8400C6C6C600FFFFFF0084008400000000000000000000000000FFFFFF008484
      0000FFFFFF000000000084000000008484008484000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      00000000000000000000000000000000000084008400C6C6C600C621E700C621
      E700C621E70000FFFF00C6C6C6000084840084008400C621E700840084000000
      000084848400C6C6C60084008400000000000000000000000000FFFFFF00FFFF
      FF00848400008484000084840000FFFFFF008484840084840000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000084008400C6C6C600C621
      E700C621E700C621E700C621E70000FFFF0000FFFF00C6C6C600008484008400
      8400000000008484840084008400000000000000000000000000FFFFFF0000FF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0084848400848400008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      000000000000000000000000000000000000000000000000000084008400C6C6
      C600C621E700C621E700C621E700C621E700C621E700C6C6C60000FFFF008400
      8400840084000000000084008400000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000000000848484008484
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      8400C6C6C600C621E700C621E70000FFFF0000FFFF0000FFFF00008484008400
      8400C621E7008400840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848400008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084008400C6C6C600C621E700C621E700008484000084840084008400C621
      E700840084008400840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084008400C6C6C600C621E700C621E700C621E700C621E7008400
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084008400C6C6C600C621E70084008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000084000000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF0000FF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000084000000840000FFFFFF00FFFFFF000084
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00840000008400000084000000FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF000084
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF008484
      000084000000008400008484840084840000FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00840000008400000084000000FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00840000008400000084000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF008484
      000000000000008400000084000084840000FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF008484000084000000008400008484840084840000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF008484000084000000008400008484840084840000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0000840000FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF008484
      0000FFFFFF000000000084000000848400008484840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF008484000000000000008400000084000084840000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF008484000000000000008400000084000084840000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0000840000FFFFFF00FFFFFF000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00848400008484000084840000FFFFFF0084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF0084840000FFFFFF00000000008400000084840000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0084840000FFFFFF00000000008400000084840000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF0000FF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00848400008484000084840000FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00848400008484000084840000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000FFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
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
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      840084848400FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000848484008484
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000008484840084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C60084848400C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C60000000000C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000C6C6
      C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      840000000000000000000000000084848400C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      840000000000000000000000000084848400C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000C6C6
      C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00C6C6C60000000000C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000C6C6
      C600C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600FFFFFF0084848400C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000008400000084000000840000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000008400000000FF0000840000008400
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      000084000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000FFFFFF00FFFFFF0000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      000000000000C6C6C600000000000000000000000000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      000084000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000848484008484840000000000FFFFFF00FFFFFF0000000000848484008484
      840000000000FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      000084000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600000000000000000000000000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000848484008484840000000000FFFFFF00FFFFFF0000000000848484008484
      840000000000FFFFFF00FFFFFF0000000000000000000000000000000000C6C6
      C600000000000000000000000000FFFFFF00FFFFFF0000000000000000008400
      000084000000840000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
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
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840084848400848484000000000000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00C6C6C600FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00C6C6C600FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF00C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400C6C6C60084848400848484000000000000000000000000000000
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
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000C6C6C6008484
      8400C6C6C6008484840084848400000000000000000000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000084848400848484000000
      00008484840084848400000000000000FF000000FF000000FF000000FF000000
      8400000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF00000084000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000840000000000000000000000000084848400848484008484
      8400848484008484840000000000000000008484840000000000000000008484
      8400000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400000000000000000084848400000000008484
      8400000000000000000000000000000000000000000084848400848484000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000848484008484
      8400C6C6C6008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60084848400C6C6
      C600848484008484840000000000000000000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000FFFF00000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000FFFF00000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000848400000000
      0000000000000000000000000000000000008484840084848400000000008484
      840084848400000000000000FF000000FF000000FF000000FF00000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF0000008400000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00008484
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FF000000FF000000FF00000084
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000FFFF00000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF00000084000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000FF000000FF00000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000FFFF00000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
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
      0000000000000000000000000000D6C6C6000000000000000000000000000000
      000000000000D6C6C600D6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6C6C600000000000000000000000000000000000000
      00000000000000000000D6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6C6C60000000000000000000000000000000000000000000000
      00000000000000000000D6C6C600000000000000000000000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000000000008400000084000000848400000000
      0000000000000000000084000000840000008400000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6C6C6000000000000000000D6C6C60000000000D6C6C600000000000000
      00000000000000000000D6C6C600000000000000000000000000000000008484
      8400840000000000000000000000000000000000000000000000848484008400
      0000840000008484840000000000000000008400000084000000840000008484
      0000000000000000000000000000FFFFFF008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000000000000000
      000084848400000000000000000000000000000000000000000000000000D6C6
      C6000000000000000000D6C6C60008006B000000000008006B00D6C6C6000000
      00000000000000000000D6C6C600000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000848484008400
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600848484008484840000000000000000000000
      0000840000008484840000000000000000000000000000000000D6C6C6000000
      000000000000D6C6C60008006B00D6C6C600D6C6C600D6C6C60008006B00D6C6
      C6000000000000000000D6C6C600000000000000000000000000000000000000
      0000848484008400000000000000000000000000000000000000840000008400
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840084848400000000000000
      000084000000840000000000000000000000000000000000000000000000D6C6
      C6000000000008006B0008006B0008006B0008006B0008006B0008006B000800
      6B000000000000000000D6C6C600000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00840000008400
      0000840000008400000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C60084848400848484008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000D6C6C6000000000008006B000000000000000000D6C6C60008006B000000
      00000000000000000000D6C6C600000000000000000000000000000000000000
      0000000000008484840084000000000000000000000084000000840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF008400
      000084000000840000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00FFFFFF00C6C6C60000000000C6C6C600C6C6C600848484008400
      0000840000008400000000000000000000000000000000000000000000000000
      000000000000D6C6C6000000000008006B000000000008006B00000000000000
      00000000000000000000D6C6C600000000000000000000000000000000000000
      0000000000000000000084000000840000000000000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00000000008400000000000000C6C6C600840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      00000000000000000000D6C6C600000000000000000000000000000000000000
      00000000000000000000D6C6C600000000000000000000000000000000000000
      0000000000000000000084848400840000008400000084000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000C6C6C600FFFFFF0084000000C6C6C60084848400840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6C6C6000000000000000000D6C6C600D6C6
      C6000000000000000000D6C6C600000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008400000000000000C6C6C600840000008484840000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6C6C600D6C6C60000000000D6C6
      C6000000000000000000D6C6C600000000000000000000000000000000000000
      0000000000000000000000000000848484008400000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6C6
      C6000000000000000000D6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000840000000000000000000000840000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6C6
      C6000000000000000000D6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008400000084000000848484000000000000000000000000000000
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
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400840000000000000000000000000000000000000000000000000000008400
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000840000008484840000000000000000000000000000000000848484008400
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000840000008484840000000000000000000000000000000000848484008400
      0000000000000000000000000000000000008400000084000000000000000000
      000000000000840000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000848484000000000000000000000000000000000000000000000000008484
      8400840000008400000084000000840000000000000000000000000000000000
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
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
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
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C6000000000000000000000000000000000000000000000000008400
      0000000000000000000084000000000000000000000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000008400
      0000000000000000000084000000000000008400000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF008400000084000000840000008400
      00008400000084000000FFFFFF008400000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FFFF00C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000008400
      0000000000000000000084000000000000008400000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0084000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008400000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400C6C6C600C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      0000840000008400000084000000000000008400000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00840000008400000084000000FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000084000000000000008400000084000000840000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0084000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF00840000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C60000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000084000000000000008400000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFFFF008400
      0000840000008400000084000000000000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      000084000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C60000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000FFFFFF008400000000000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000008484
      8400008484000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
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
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000084840000000000000000000000000084848400FFFFFF00FFFF
      FF008484840084848400848484008484840000FFFF0000FFFF0000FFFF000000
      000000000000FFFFFF00C6C6C60000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000084840000000000000000000000000084848400FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF008484840000FFFF0000FFFF0000FFFF000000
      000000FFFF0000000000C6C6C60000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000084840000000000000000000000000084848400FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00848484008484840084848400848484008484
      840000FFFF0000000000C6C6C60000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000084848400FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF008484840000FFFF0000FFFF0000FF
      FF0000FFFF0000000000C6C6C60000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000084848400FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400848484008484
      84008484840084848400C6C6C60000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000084840000000000000000000000000084848400FFFFFF008484
      840000FFFF0000FFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000084840000000000000000000000000084848400FFFFFF008484
      840000FFFF0000FFFF0000FFFF000000000000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000084840000000000000000000000000084848400FFFFFF008484
      84008484840084848400848484008484840000FFFF0000000000FFFFFF00FFFF
      FF00C6C6C600C6C6C600C6C6C60000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000084840000000000000000000000000084848400FFFFFF00FFFF
      FF008484840000FFFF0000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF008484840084848400848484008484840084848400FFFFFF00FFFF
      FF0084848400C6C6C6008484840000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60000000000C6C6C60000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000084000000
      8400000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00FFFFFF000000
      FF00FFFFFF0000008400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF0000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000000000000000FF00FFFFFF00FFFF
      FF000000FF0000008400FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF008484840084848400848484008484840084848400848484008484
      84008484840000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C60000000000000000000000FF00FFFFFF000000
      FF00FFFFFF00000084008484840084848400848484000000000000FFFF0000FF
      FF0000FFFF0000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF0000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000FFFFFF00C6C6C60000000000000000000000FF00FFFFFF00FFFF
      FF00FFFFFF0000008400FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF008484840084848400848484000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000C6C6C600000000000000000084848400FFFFFF000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000000000FFFFFF00C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000000000C6C6C600000000000000000084848400FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000FFFFFF0000000000C6C6C600000000000000000084848400FFFFFF008484
      840000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000000000FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000C6C6C600000000000000000084848400FFFFFF008484
      84008484840084848400848484008484840000FFFF0000FFFF0000FFFF0000FF
      FF0000000000FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFF
      FF00FFFFFF0000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400FFFF
      FF00FFFFFF0000000000C6C6C600000000000000000084848400FFFFFF000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000000000FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFF
      FF00FFFFFF0000000000C6C6C600000000000000000084848400FFFFFF008484
      840000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000000000FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF008484840084848400848484008484840084848400FFFFFF00FFFF
      FF00FFFFFF0000000000C6C6C600000000000000000084848400FFFFFF008484
      84008484840084848400848484008484840000FFFF0000FFFF0000FFFF0000FF
      FF0000000000FFFFFF00C6C6C600000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600C6C6C600C6C6C600000000000000000084848400FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00C6C6C600C6C6C600C6C6C600000000000000000084848400FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600C6C6C600C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000C6C6C600C6C6C600000000000000000084848400FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400C6C6C60084848400000000000000000084848400FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400C6C6C60084848400000000000000000084848400FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400C6C6C60084848400000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400C6C6C60084848400000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000084000000
      8400000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000000000000000FF00FFFFFF000000
      FF00FFFFFF0000008400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF00FFFFFF00C6C6C60000000000000000000000FF00FFFFFF00FFFF
      FF000000FF0000008400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000C6C6C60000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF00FFFFFF00C6C6C60000000000000000000000FF00FFFFFF000000
      FF00FFFFFF0000008400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00848484008484840084848400848484000000000000FFFF0000FF
      FF0000FFFF0000000000C6C6C600000000000000000084848400FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000000000000000
      00000000000000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C60000000000000000000000FF00FFFFFF00FFFF
      FF00FFFFFF0000008400FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFF
      FF0084848400FFFFFF00C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFF
      FF0084848400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFF
      FF0084848400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFF
      FF0084848400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000848484008484
      840084848400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000848484008484
      840084848400FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000000000C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000084848400FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF0084848400FFFFFF00FFFF
      FF00C6C6C600C6C6C600C6C6C600000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      00000000000000000000C6C6C600000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      00000000000000000000C6C6C600000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600C6C6C600C6C6C600000000000000000084848400FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400C6C6C60084848400000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400C6C6C60084848400000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400C6C6C60084848400000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400C6C6C60084848400000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000848484000000
      0000848484000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      00000000000000000000C6C6C600000000000000000084848400000000008484
      8400000000000000000000000000848484000000000084848400000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000848484000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000000000C6C6C600000000000000000000000000848484000000
      0000848484000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF008484840084848400848484008484840084848400848484008484
      8400FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF0084848400C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF008484840000FFFF0000FFFF000000000000FFFF000000
      000000FFFF0000000000000000000000000000000000000000008484840000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF008484840000FFFF0000FFFF00000000000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF008484840000FFFF000000000000FFFF000000
      000000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF008484840000FFFF00000000000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
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
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
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
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000084848400FFFFFF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF00C6C6C600FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
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
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF0000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FF000000FF000000FF00000084
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
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
      0000000000000000000000000000000000000000000000000000848484008484
      8400C6C6C6008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400C6C6C6008484840084848400000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000C6C6C60084848400C6C6
      C600848484008484840000000000000000000000840000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60084848400C6C6
      C600848484008484840000000000000000000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000008484
      840084848400000000000000FF000000FF000000FF0000009C00000084000000
      0000000000000000000000000000000000008484840084848400000000008484
      840084848400000000000000FF000000FF000000FF000000FF00000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000FF000000FF000000FF000000
      FF00000084000000000000000000000000000000000084848400000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000084000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C60000000000C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF0000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000FFFF0084848400848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      00000000000000000000C6C6C6000000000000000000000000000000FF000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      00008484840000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      00008484840000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000848484008484
      8400C6C6C6008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400C6C6C6008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60084848400C6C6
      C600848484008484840000000000000000000000840000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60084848400C6C6
      C600848484008484840000000000000000000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000848400000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000848400000000
      0000000000000000000000000000000000008484840084848400000000008484
      840084848400000000000000FF000000FF000000FF000000FF00000084000000
      0000000000000000000000000000000000008484840084848400000000008484
      840084848400000000000000FF000000FF000000FF000000FF00000084000000
      0000000000000000000000000000000000000000000084848400000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00008484
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00008484
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      8400000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C60000000000FFFF0000FFFF0000FFFF0000FFFF
      0000848400000000000000000000000000000000000084848400000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF00000084000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000FF000000FF000000FF000000
      FF00000084000000000000000000000000000000000084848400FFFFFF00C6C6
      C60000000000C6C6C600C6C6C6000000000000000000FFFF0000FFFF0000FFFF
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000000000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF00C6C6C6000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000084848400FFFFFF000000
      00000000000000000000C6C6C600000000000000000000000000FFFF00000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      840000FFFF00C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00C6C6C60000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C60000000000C6C6C60000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C60000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400000000000084840000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000FFFF00000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000848400000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000848400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00008484
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00008484
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000FFFF00000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000848400000000000000000000000000000000000000000000000000000000
      0000C6C6C600000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00C6C6C600000000000000000000000000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      840000FFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00C6C6C60000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C60000000000C6C6C60000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C60000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400000000000084840000000000000000000000000000000000000000000000
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
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000848484000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000848484000000000000000000000000008484840000000000000000008484
      8400000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000848484000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000848484000000000000000000000000000000000000000000848484000000
      0000848484008484840000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000848484000000000000000000000000008484840000000000000000008484
      8400000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000848484000000000000000000000000008484840000000000000000008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
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
      000000000000848484008484840000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400000000000000
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
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF00000000000000000000FFFF00000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      840000FFFF000000000084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      840000FFFF000000000084848400848484008484840084848400848484008484
      84008484840000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000FFFF00000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      84000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      84000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      84008484840084848400848484008484840084848400848484008484840000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      84008484840084848400848484008484840084848400848484008484840000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
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
      0000000000000000000000000000000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000084848400848484008484
      840084848400848484000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF008484
      8400848484008484840084848400848484008484840084848400848484008484
      840000FFFF000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0084848400000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000000000008484840000FFFF0000FF
      FF008484840000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      84008484840000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000008484
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF00848484008484840084848400848484008484840000FFFF000000000000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000FFFF000000000000000000000000000000000000000000000000008484
      84008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000000000000000000000
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
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0084848400848484008484840084848400848484008484
      840000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000
      000000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000848484008484
      84008484840084848400848484000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000848484008484
      84008484840084848400848484000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      FF0000FFFF000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000848484008484
      84008484840084848400848484000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000848484008484
      84008484840084848400848484000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
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
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000000000008484840000FF
      FF00848400008484000000FFFF00848484008484840084848400848484008484
      840000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF00848400008484000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF00848400008484000000FFFF00848484008484840084848400848484008484
      840000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF00848400008484000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000848484008484
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
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0084840000FF000000FF00
      0000FF000000FF000000FF000000FF000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0084840000FF000000FF00
      0000FF000000FF000000FF000000FF000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484000084840000FF00
      0000FFFFFF0084000000FF000000FF000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0084848400FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484000084840000FF00
      0000FFFFFF0084000000FF000000FF0000000000000084848400848484008484
      8400848484008484840084848400848484008484840084840000848400008484
      0000FFFFFF0084000000FF000000FF0000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084840000848400008484
      0000FFFFFF0084000000FF000000FF000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000084840000848400008484
      000084840000FF000000FF000000FF000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000084848400FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000084840000848400008484
      000084840000FF000000FF000000FF0000000000000084848400848484008484
      8400848484008484840084848400848484008484840084840000848400008484
      00008484000084840000FF000000FF0000000000000084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084840000848400008484
      00008484000084840000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      000084840000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      000084840000FF00000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0084840000FF000000FF00
      0000FF000000FF000000FF000000FF000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0084848400FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484000084840000FF00
      0000FFFFFF0084000000FF000000FF000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0084848400FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084840000848400008484
      0000FFFFFF0084000000FF000000FF0000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0084848400FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000084840000848400008484
      000084840000FF000000FF000000FF000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000084848400FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084840000848400008484
      00008484000084840000FF000000FF0000000000000084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      000084840000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000FFFF0000FFFF00C6C6C6008400000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000FFFF0000FFFF00C6C6C6008400000084000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C60000FF
      FF0000FFFF0000FFFF0000FFFF00C6C6C6008400000084000000840000008400
      0000C6C6C6000000000000000000000000000000000000000000C6C6C60000FF
      FF0000FFFF0000FFFF0000FFFF00C6C6C6008400000084000000840000008400
      0000C6C6C6000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00C6C6C6008400000084000000840000008400
      0000840000008400000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00C6C6C6008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00C6C6C6008400000084000000840000008400
      0000840000008400000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00C6C6C6008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00C6C6C6008400000084000000840000008400
      0000840000008400000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00C6C6C6008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FFFF0000FF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00C6C6C6008400000084000000840000008400
      000084000000840000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000840000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00C6C6C6008400000084000000840000008400
      000084000000840000000000000000000000FFFFFF0084840000FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF0084000000840000008400
      000084000000840000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF00C6C6C600C6C6C60000008400C6C6C600C6C6C600840000008400
      000084000000840000000000000000000000FFFFFF008484000084840000FF00
      0000FFFFFF0084000000FF000000FF000000FFFFFF00C6C6C600840000008400
      000084000000840000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000FFFF0000FFFF00C6C6
      C600C6C6C6000000840000008400000084000000840000008400C6C6C600C6C6
      C60084000000840000000000000000000000FFFFFF0084840000848400008484
      0000FFFFFF0084000000FF000000FF000000FFFFFF0000008400C6C6C600C6C6
      C60084000000840000000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400C6C6C600C6C6C6000000000000000000FFFFFF0084840000848400008484
      000084840000FF000000FF000000FF000000FFFFFF0000008400000084000000
      8400C6C6C600C6C6C60000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000008400000084000000
      8400000084000000840000008400000084000000840000008400000084000000
      840000008400000084000000000000000000FFFFFF0084840000848400008484
      00008484000084840000FF000000FF000000FFFFFF0000008400000084000000
      840000008400000084000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400C6C6C600000000000000000000000000FFFFFF00FFFFFF0084840000FFFF
      FF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF0000008400000084000000
      8400C6C6C6000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000840000008400000084000000840000008400C6C6C6000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0084840000FFFF
      FF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF0000008400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60000008400C6C6C60000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF008484
      000084840000FF000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
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
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C6000000000000000000C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600FFFFFF00C6C6C600FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C60000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00C6C6C600FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000C6C6C600FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400848484000000000000000000C6C6C600000000000000
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
      2800000040000000F00200000100010000000000801700000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF801FFFFFFFFFFDFF801FFFFFFFF
      FF9FF801FFFFFFFFFF07F801FFFFFFFFFF9BF801F01FFFFFC0DBF801F01F9999
      FFFBF801F01F9999FFFBF801F01FFFFFC01BF803F01FFFFFFFFFF807FBBF8001
      FFFFF80FFBBF8001C003DFFFFC7FFFFFFFFF80FFFFFFFFFFFFFF80FFFFFFFFFF
      FFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000C007FFFFFFFF8000
      C007FFFFFFFF8000C007FDFFFDFF8000C007F8FFF8FF8000C007F07FF07F8000
      C007E03FE03F8000C007F01FF01F8000C007F80FF80F8000C007FC1FFC1F8000
      C007FE3FFE3F8000C00FFF7FFF7F8000C01FFFFFFFFF8000C03FFFFFFFFF8001
      FFFFFFFFFFFF8003FFFFFFFFFFFF8007FFFFFFFFFFFFFFFFC003F003FFFFFFFF
      C003F003FFFFFFFFC003F0038001E007C003F0038001C003C003F00380018001
      C003F00380018001C003F00380018001C003C00380018001C003C00380018001
      C003C00380018001C003F0038001C003C003F0038001E007C003F003FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000FFFFFFFFFFFF8000C003FFF3FFDF
      8000C003FFF3FF8F8000C003FFE7FFDF8000C003FFCFFFDF8000C003FF9FF801
      8000C003FF3FF8018000C003FE7FF8018000C003FCFFE8018000C003F9FF8001
      8000C003F3FFE8018000C003E7FFF8018000C003CFFFF8018000C003CFFFFFFF
      8000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003FFFFFFFFC003
      C003FFFFFC3FC003C003F81FF00FC003C003E007F3CFC003C003C003E187C003
      C0038001E427C003C0038001E667C003C0038001E427C003C0038001E187C003
      C003C003F3CFC003C003E007F00FC003C003F81FFC3FC003C003FFFFFFFFC003
      C003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003C003
      FFFFFFFFC003C003FFFFFFFFC003C003800FFFFFC003C0038007FFFFC003C003
      8003FFFFC003C00380018001C003C00380018001C003C0038003FFFFC003C003
      8007FFFFC003C003800FFFFFC003C003FFFFFFFFC003C003FFFFFFFFC003C003
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF801FFFFFC3FFFFFF
      FFDFFFFF81FFFFFFFFDFEFEF0000FFFFFFDFDFF700008001FFDFDFF70000C001
      FFDFDFF70000E001FFDFDFF78000F001FFDFB55BC000F001FF8FDFF7F800E001
      FF07DFF7F800C001FE03DFF7FC008001FF07DFF7FC1FFFFFFF8FEFEFFE3FFFFF
      FFDFFFFFFE3FFFFFFFFFFFFFFF7FFFFFFFFFF800FFFFFFFFD551F800801F801F
      FFF9F800FFDFFFDFDFD5F800FFDFFFDFFFCFF800FFDFFFDFDFC5F800FFDFFFDF
      803FF800FFDFFFDFBFBDF800FFDFFFDFBFBFF800FFDFFFDFBFBDFFFFFFDFFFAF
      BFBFAEBFFDDDFF77BFBDAEBFFEDBFEFBBFBF5F5FFF57FF77BF95AEBFFF8FFFAF
      803FAEBFFFDFFFDFFFFFFFFFFFFFFFFFFFF7EFFBFFFFF801FFEBEFFBFFE3F801
      FFD5D94DFFC1E001FF8AEFFBFFC1E001FF05EFBBFFC1E001000200070001F801
      000500070001E001000B00070003E001000500070007E001000200070007F801
      000500070007F801000300070007DFFF00070007000780FF00070007000780FF
      000700070007DFFF000700070007FFFFFFFFFFFFFFFFFFFFC003F7FFFFFFFFFF
      C003E7DFC007FFFFC003C78FC007C107C0039307C007C107C0033B83C007C107
      C003F907C007C107C003FD6FC007C107C003F47FC007FFFFC003E26FC007F83F
      C003C007C007F83FC0038083C007F83FC003C041C00FF83FC003E0E3C01FF83F
      C007F1F7C03FFFFFC00FFBFFFFFFFFFFFFFFFFFFFFFFFE7FFFFFFFFFFFFFF83F
      803FFC3FFE7FE01F803FFC3FFC3F800F803FFC3FF81F0007803FFC3FF00F0003
      803FFC3FE0070001883FFC3FFC3F0000843FFC3FFC3F0000801FE007FC3F8001
      800FF00FFC3FC0018007F81FFC3FE0008023FC3FFC3FF001FFF3FE7FFC3FF807
      FFFFFFFFFFFFFC1FFFFFFFFFFFFFFE7F8000FFFFFFFFFFFF8000FFFFFFFFFFFF
      8000803FFFFFFFFF8000803FC01FC01F8000803FC01FC01F8000803FC01FC01F
      8000803FC01FC01F8000883FC01FC01F80008401C41FC41F80008001C21BC21F
      80008001C01BC01F80008001C000C00080008001C01BC01F8000FF01C01BC01F
      8000FF01FFFFFFFF8000FFFFFFFFFFFFF81FFFFFFFFFFFFBF81FFFFFFFFFFFF7
      F81FFFEFFFEF0002F81FFFC7FFC70001FE7FFF83FF830003FE7FFF07FF070003
      F00FE00FE00F0003F00FC01FC01F0003F00F803F803F0003F00F803F803F0003
      FE7F803F803F0003FE7F803F803F0003FC3F803F803F0003FC3FC07FC07F0003
      FC3FE0FFE0FF0003FC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FC3FC003FFFFFFFFFC3FC003FF0FFFFFFC37FFFFFF0FFC3FC437C437F10F0C3F
      C437C423F10F0C30C437C437C0030000C437C437C0030000C423C437F10F0C30
      C437C437F10F0C3FFFFFFC37FF0FFC3FC003FC3FFF0FFFFFC003FC3FFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF01FFFFFFFFFFFF
      FF01CDFFFFB3FE7FFF01C80FF013FE7FE001CDFFFFB3E007E001CFFFFFF3E007
      E001C803C013E007E001C803C013E007000FC803C013FE7F000FC803C013F81F
      000FCFFFFFF3F81F000FC81FF813F81F000FC81FF813FE7F01FFC81FF813FE7F
      01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0FFFFFFFFFFFF01
      FFBF80018001FF01C11FFFFFFFFFFF01FE0FFFFFFFFFE0019007EFAFF5AFE001
      FE03EF07EBD7E001FF01836FD7EBE001FF83EE0FEBD7000FDF47EF5FF5AF000F
      BFAFFFFFFFFF000FAABFFFFFFFFF000FBFBF80018001000FDF7FFFFFFFFF01FF
      FFFFFFFFFFFF01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800180018001FFFF
      FFFFC1FFFFFF8003FF7FFF7FFFFF8003FE3F823FFFBF8003FC1FFC1FFF1F8003
      F80F200FFE0F8003FC07FC07FC078003FE03FE03FE0F8003D707D707D71F8003
      EF8FEF8FEFBF8003D7DFD7DFD7FF807FFFFFFFFFFFFF807F800180018001FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF9FFFFFFFFFFFFFCF9
      FFFFFFFFFDFFF9F9C381183FF8FFF2B9E7C30C1FF077E499F3C7FE0FE033C809
      F3C7FE07C013C809F80FFF038003E599F98FFF03C003F2B9FC9FFF83E003F9F9
      FC1FFFC3F007FCC9FE3FFFC1F01FFE09FE3FFFE1F43FFF09FF7FFFF0F67FFF09
      FFFFFFFFF0FFFE1BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      EFFDFFFFFFFF07C1C7FFFFFFFFFF07C1C3FBFFFFFFFF07C1E3F7FFE7E7FF0101
      F1E7C1F3CF830001F8CFC3FBDFC30201FC1FC7FBDFE30201FE3FCBFBDFD38003
      FC1FDCF3CF3BC107F8CFFF07E0FFC107E1E7FFFFFFFFE38FC3F3FFFFFFFFE38F
      C7FDFFFFFFFFE38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC007F3FFFFFFFC00
      8003ED9FFC0180000001ED6FFC0100000001ED6FFC0100000001F16F00010000
      0000FD1F000100010000FC7F000100038000FEFF00010003C000FC7F00030003
      E001FD7F00070003E007F93F000F0003F007FBBF00FF0003F003FBBF01FF8007
      F803FBBF03FFF87FFFFFFFFFFFFFFFFF8000FFFFFFFFFFFF8000FFFFFFFFC001
      8000C007001F80018000C007000F80018000C007000780018000C00700038001
      8000C007000180018000C007000080018000C007001F80018000C007001F8001
      8000C007001F80018000C0078FF180018000C00FFFF980018001C01FFF758001
      8003C03FFF8F80018007FFFFFFFFFFFF80008000800080008000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000800080008000800080008000800080008001800180018001
      8003800380038003800780078007800780008000800080008000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000800080008000800080008000800080008001800180018001
      80038003800380038007800780078007FFFFFFFFFFFF8000925F925F925F8000
      FFDFFFDFFFDF8000D57FD57FFFFF8000AE9FAE9FFFDF8000D55FD55FFFDF8000
      FFFFFFFFFFFF8000C7DFC7DFFFDF8000EFDFDFDFFFDF8000EFFFC7FFFFFF8000
      EFDFDFDFFC018000C6FBC6FBFEFB8000FF57FF57FF778000FF8FFF8FFFAF8001
      FFDFFFDFFFDF8003FFFFFFFFFFFF8007FFFFFFFFFFFFFFFFFBFFFFFFFFFFFBFF
      F3FFFFFFFFFFF3FFE3FFFFFFFFFFE3FFC007FFFFFFFFC007E3F7FFEFF7FFE3F7
      F3F7FFE7E7FFF3F7FBF7FFE3C7FFFBF7FFF780018001FFF7FFF7FFE3C7FFFFF7
      FFF7FFE7E7FFFFF7FFF7FFEFF7FFFFF7E007FFFFFFFFE007FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      E007E01FFFFFFFFFFFF7FFEFFFFFFFFFEBF7EBF7FFFFFFFFE7F7E7F7FFEFF7FF
      EBF7EBF7FFE7E7FFE3F7E3F7FFE3C7FFFFF7FFF780018001FFF7FFF7FFE3C7FF
      FFF7FFF7FFE7E7FFFFF7FFEFFFEFF7FFFFF7E01FFFFFFFFFFFF7FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8001801FFFFFFFFF
      FFEFFFDFC003E01FFFFFFFDFFFFBFFEFFFEFFFDFC7FBE3F7FFEFFFDFDFFBEFF7
      FFFFFFDFDFFBEFF7FFEFFFDFDFFBEFF780EFFFDFFFFBFFF780FFFFDFFFFBFFF7
      80EFFC01FFFBFFF7802FFEFBFFFBFFEF80FFFF77FFFBE01F80FFFFAFFFFBFFFF
      80FFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF925FFFFF
      FFFFFFFFFFDFE007FFFFFFFFFFFFFFF7C003C003FFDFFFF7C003C003FFDFFFF7
      C003C003FFFFFFF7C003C003FFDFFFF7C003C003FFDFFFF7C003C003FFFFFFF7
      C003C003FDDDFFF7C003C003FEFBFFF7FFFFFFFFFF57FFF7FFFFFFFFFF8FFFF7
      FFFFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      EEFFEEFFEEFFEEFFF1FFF1FFF1FFF1FFC07FC07FC07FC07FF1FFF1FFF1FFF1FF
      EAFFEAFFEAFFEAFFDB7FDB7FDB7FDB7BFBFFFBFFFB8FFBFBFB7FFBEFFB77FB7B
      FF3FFFF7FEFBFE3BFB5BFC03FEC3FD5BFD6BFFF7FEDBFF7BFE73FFEFFF57FF7B
      FF43FFFFFF8FFF87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      DFFFDFFFDFFFDFFFC7FFC7FFC7FFC7FFC1FFC1FFC1FFC1FFC07FC07FC07FC07F
      C1FFC1FFC1FFC1FFC7FFC7FFC7A3C7FFDE03DFDBDF67DFFFFE03FDDBFEEBFAFB
      FE03FEDBFEFBFADBFE03C05BFEFBFAEBFE03FEDBFF77FB03FE07FDDBFF8FFBEB
      FE0FFFDBFFFFFBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      DFFFDFFFDFFFDFFFC7FFC7FFC7FFC7FFC1FFC1FFC1FFC1FFC07FC07FC07FC07F
      C1FFC1FFC1FFC1FFC7FFC7F7C7FFC7FFDFFFDFB7DFFFDFFFFFCFFDD5FFEFFFFF
      FFF7FCE3FFE7FBFFE003C040F003F3FFFFF7FCE3FFE7E2ABFFCFFDD5FFEFF3FF
      FFFFFFB6FFFFFBFFFFFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFF801FFFFFFFFF
      FFFFFFDFE01FDFFFFFBFFFDFFFEFC7FFFF1FFFDFFFF7C1FFFE0FFFDFFFF7C07F
      FC07FFDFFFF7C1FFFE0FFFDFFFF7C7FFFF1FFFDFFDF7DFFFFFBFFFDFFBF7FFDF
      FFFFFFDFF7EFFFC7FFFFFEDBE01FF003FFFFFF57F7FFFFC7FFFFFF8FFBFFFFDF
      FFFFFFDFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1FFC1FFFFFFFFFF
      FF7FFF7FFFFFFFFF823F823FFFFFFFFFFC1FFC1FFFBFFFFF200F200FFF3FFAAB
      8007FC07FE07FFFF80038003FC03FBFB80078007FE01FFFF808F800FFF31FAAB
      80DF805FFFB1FFFF80FF807FFFF1FFFFCDFF83FFFFF1FFFFC1FF83FFFFFFFFFF
      E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1FFC1FF
      FF7FFF7FFF7FFF7FFE3FFE3F823F823FFC1FFC1FFC1FFC1FF80FF80F200F200F
      8007FC07FC07F40780038003FE03E20380078007FF07E107808F800FFF8FE38F
      80DF805FFFDFC1DF80FF807FFFFF80FFCDFF83FFFFFF80FFC1FF83FFFFFFC1FF
      E3FFFFFFFFFFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7FFFFFFFFFFFFF
      FE7FFFFFFF7FFF7FFE7FE00FFE3FFE3FFE7FC007FC1FFC1FFE7F8003F80FF80F
      FE7F8003FC07F407FE7F8003FE03E203FE7F8003FF07E107FE7F8003FF8FE38F
      FE7F8003FFDFC1DFFE7FC007FFFF80FFFE7FE00FFFFF80FFFE7FFFFFFFFFC1FF
      FE7FFFFFFFFFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FF81FFFFF
      FFFFF7EFF7EFFC3FFFFFEFF7EFF7F3CFFFFFDFFBDFFBEC37FE7FB99DB33DE817
      FC3FB99DB32DD00BF81FB81DB005D00BF81FB81DB001D00BFC3FB99DB305D00B
      FE7FB99DB32DE817FFFFDFFBDFFBEC37FFFFEFF7EFF7F3CFFFFFF7EFF7EFFC3F
      FFFFF81FF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7FFFFF
      FFFFFFFFFC7FFFFFFEFFFFFFBC7FFFFFF83FFC3FD47FFFFFE00FF81FE47BFE7F
      8003F00FC47DFC3F0001F00FFC40F81F8003F00FC47DF81FE00FF00FE47BFC3F
      F83FF81FD47FFE7FFEFFFC3FBC7FFFFFFFFFFFFFFC7FFFFFFFFFFFFFFC7FFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FBFFFA07FFFFFFFFF3FFF3FFFFFFE00FE007E007E00FC007C007C007C007C007
      E007E007C0078003F3FFF3FF80038003FBDFE01F80038003FFCFFFCFC007C007
      E007E007C007C007E003E003E00FE00FE007E007FFFFFFFFFFCFFFCFFFFFFFFF
      FFDFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF83FFFFFFFFFFFFFF01E00FFFFFFFFFF001C007F93FF93FF7018003C007C007
      F7838003C007C007E3FF800380038003F7CF800380038003C1878003C007C007
      8087C007C007C00780CFE00FF93FF93F80FFFFFFFFFFFFFFC1FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DFFFED
      C01FFFFFFBBFFC05C00FF81FFD7FFDEDC007E007FEFFFDFDC003C003FEFFF01D
      C0038001E00FE00DC0038001FEFFF01DC0038001FEFFFF7DC003C003FC7FFE3D
      E003E007F83FFF7DF003F81FF83FE07DF803FFFFF83FDFFDFFFFFFFFFC7F8FFD
      FFFFFFFFFFFFDFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003F003F003FFFF
      C003F003F003C01FC003F003F003C00FC003C003F003C007C003C003C003C003
      C003C003C003C003C003F003C003C003C003C003F003C003C003C003C003C003
      C003C003C003E003C003F003C003F003C003F003F003F803C003F003F003FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003C003
      C003FFFFC003C003C003FF8FC003C003C003FF07C003C003C003FE03C003C003
      C003FC01C003C003C0038001C003C003C003FC01C003C003C003FE03C003C003
      C003FF07C003C003C003FF8FC003C003C003FFFFC003C003FFFFFFFFC003C003
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      8003800380038003800380038003800380038003800380038003800380038003
      8003800380038003800380038003800380008003800080008000800380008000
      80008003800080008000807F800080008000807F80008000FFDDFFFFFF80FFDD
      FFDDFFFFFF81FFDDFFE3FFFFFF83FFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      8003800380038003800380038003800380038003800380038003800380038003
      8003800380038003800380038003800380008000800380008000800080038000
      800080008003800080008000807F800080008000807F8000FF80FFDDFFFFFF80
      FF81FFDDFFFFFF81FF83FFE3FFFFFF83FFFFFC7FFC7FFFFFFFFFF01FF01FFFFF
      87E0C007C0078003CFF1800380038003E7F3800380038003E7E3800380038003
      F007800300038003F3C7800300038003F9CF800300038003F98F800300038003
      FC9F800300038003FC1F80030003807FFE3FC0070007807FFE3FF01F001FFFFF
      FF7FFC7F007FFFFFFFFFFFFF007FFFFFFF9FFFFFFFFFFFFFFF8FFF7FFFFFFFFF
      F70FFE3FFFFFDFFFF31FFC1FC001DFFFF01FF80FC001FFFFF03FF007C001DFFF
      F003E003C001DFFFF007C001C001FFFFF00FE000C001DFFFF01FC001C001DFFF
      F03FC803C003FFFFF07FCC07C007DFFFF0FFC60FC00FD249F1FFE01FFFFFFFFF
      F3FFF0BFFFFFFFFFF7FFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object SaveUnitDialog: TSaveDialogEx
    DefaultExt = 'unt'
    Filter = 'StarUML Unit File(*.unt)|*.unt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save Unit'
    Left = 476
    Top = 104
  end
  object SaveModelFragmentDialog: TSaveDialogEx
    DefaultExt = 'mfg'
    Filter = 'StarUML Model Fragment File(*.mfg)|*.mfg'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save Model Fragment'
    Left = 516
    Top = 104
  end
  object ImportModelFragmentDialog: TOpenDialog
    DefaultExt = 'mfg'
    Filter = 'StarUML Model Fragment File(*.mfg)|*.mfg'
    Title = 'Open Model Fragment'
    Left = 476
    Top = 152
  end
  object AttachmentsPopupMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'InspectorAttachmentOpen'
      end
      item
        Visible = True
        ItemName = 'InspectorAttachmentAdd'
      end
      item
        Visible = True
        ItemName = 'InspectorAttachmentDelete'
      end
      item
        Visible = True
        ItemName = 'InspectorAttachmentEdit'
      end
      item
        Visible = True
        ItemName = 'InspectorAttachmentMoveUp'
      end
      item
        Visible = True
        ItemName = 'InspectorAttachmentMoveDown'
      end>
    UseOwnFont = False
    Left = 332
    Top = 172
  end
  object MessagesPopupMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'MessagesClearAll'
      end
      item
        Visible = True
        ItemName = 'MessagesClearFindResults'
      end
      item
        Visible = True
        ItemName = 'MessagesClearVerificationResults'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'MessagesSaveMessages'
      end>
    UseOwnFont = False
    Left = 212
    Top = 276
  end
  object ModelExplorerPopupMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'ModelAdd'
      end
      item
        Visible = True
        ItemName = 'ModelAddDiagram'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'EditCut'
      end
      item
        Visible = True
        ItemName = 'EditCopy'
      end
      item
        Visible = True
        ItemName = 'EditPaste'
      end
      item
        Visible = True
        ItemName = 'EditDeleteFromModel'
      end
      item
        Visible = True
        ItemName = 'EditFindDiagramsWithSelectedModel'
      end
      item
        Visible = True
        ItemName = 'EditGoTo'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'FileUnits'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'ModelCollectionEditor'
      end
      item
        Visible = True
        ItemName = 'ModelConstraints'
      end
      item
        Visible = True
        ItemName = 'ModelTaggedValues'
      end>
    UseOwnFont = False
    Left = 332
    Top = 228
  end
  object DiagramTabPopupMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'ViewDiagramPages'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'ViewCloseDiagram'
      end
      item
        Visible = True
        ItemName = 'ViewCloseAllDiagrams'
      end
      item
        Visible = True
        ItemName = 'FormatLayoutDiagram'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'ViewRefresh'
      end>
    UseOwnFont = False
    Left = 212
    Top = 116
  end
  object DiagramExplorerPopupMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'EditCut'
      end
      item
        Visible = True
        ItemName = 'EditCopy'
      end
      item
        Visible = True
        ItemName = 'EditDeleteFromModel'
      end>
    UseOwnFont = False
    Left = 212
    Top = 164
  end
  object ExportDiagramDialog: TSaveDialogEx
    DefaultExt = 'jpg'
    Filter = 
      'JPEG Image(*.jpg)|*.jpg|JPEG Image(*.jpeg)|*.jpeg|Bitmap Image(*' +
      '.bmp)|*.bmp|Enhanced Metafile(*.emf)|*.emf|Metafile(*.wmf)|*.wmf'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Export Diagram'
    Left = 556
    Top = 104
  end
  object OpenUnitDialog: TOpenDialog
    DefaultExt = 'unt'
    Filter = 'StarUML Unit File(*.unt)|*.unt'
    Title = 'Open Unit'
    Left = 516
    Top = 152
  end
  object DiagramEditorPopupMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'ModelAddDiagram'
      end
      item
        Visible = True
        ItemName = 'ModelAdd'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'ViewSelectInModelExplorer'
      end
      item
        Visible = True
        ItemName = 'ViewCloseDiagram'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'FormatMenu'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'EditGoTo'
      end
      item
        Visible = True
        ItemName = 'EditMenu'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'ModelCollectionEditor'
      end
      item
        Visible = True
        ItemName = 'ModelConstraints'
      end
      item
        Visible = True
        ItemName = 'ModelTaggedValues'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'ModelProperty'
      end>
    UseOwnFont = False
    Left = 211
    Top = 212
  end
  object FontDialog: TCompactFontDialog
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    DisableParts = []
    IndeterminateParts = []
    Options = []
    PreviewString = 'AaBb123'
    ColorNameBlack = 'Black'
    ColorNameMaroon = 'Maroon'
    ColorNameGreen = 'Green'
    ColorNameOlive = 'Olive'
    ColorNameNavy = 'Navy'
    ColorNamePurple = 'Purple'
    ColorNameTeal = 'Teal'
    ColorNameGray = 'Gray'
    ColorNameSilver = 'Silver'
    ColorNameRed = 'Red'
    ColorNameLime = 'Lime'
    ColorNameYellow = 'Yellow'
    ColorNameBlue = 'Blue'
    ColorNameFuchsia = 'Fuchsia'
    ColorNameAqua = 'Aqua'
    ColorNameWhite = 'White'
    DefaultColorString = 'Default'
    CustomColorString = '(Custom)..'
    Left = 592
    Top = 152
  end
  object ColorDialog: TColorDialog
    Color = clWindow
    Left = 600
    Top = 256
  end
  object FileCreatePopupMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'FileNew'
      end
      item
        Visible = True
        ItemName = 'FileSelectProject'
      end>
    UseOwnFont = False
    Left = 332
    Top = 116
  end
  object DockingManager: TdxDockingManager
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.TabsProperties.CustomButtons.Buttons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Images = DockPanelImageList
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    Options = [doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doTabContainerHasCaption, doTabContainerCanAutoHide, doSideContainerCanClose, doSideContainerCanAutoHide, doTabContainerCanInSideContainer]
    Left = 540
    Top = 206
    PixelsPerInch = 96
  end
  object DockPanelImageList: TImageList
    Left = 584
    Top = 302
    Bitmap = {
      494C010109000D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000084000000FF00000084000000FF00000084000000FF0000000000
      000000000000848484000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      0000008400000084000000000000FF00000084000000FF000000840000008400
      0000848484000000FF000000FF00000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000840000C6C6
      C60000FF00000084000000840000000000008484840000000000000000008484
      8400FFFFFF000000FF0000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000840000C6C6
      C6000084000000FF00000084000084848400C6C6C600FFFF0000C6C6C6000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000FFFFFF00C6C6
      C60000FF00000084000084848400FFFFFF00FFFF0000C6C6C600FFFF0000C6C6
      C600000000000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000FFFFFF00C6C6
      C60000840000FF00000084848400FFFFFF00FFFFFF00FFFF0000C6C6C600FFFF
      0000000000000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008400000084
      000084840000FF00000084848400FFFFFF00FFFF0000FFFFFF00FFFF0000C6C6
      C600000000000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FF000000FF00
      0000FF000000FF000000FF00000084848400FFFFFF00FFFF0000FFFFFF000000
      0000C6C6C6000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FF000000FF00
      00000084000000840000FF000000FF000000848484008484840000000000FF00
      000000840000C6C6C60000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000084
      000000FF000000840000FF000000FF000000FF00000084000000FF0000008400
      0000FF0000000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000084
      0000C6C6C60000FF00000084000000840000FF0000000084000000840000FF00
      000084000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00C6C6C60000FF0000008400000084000000840000008400000084
      0000FF0000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF0000FF000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
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
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000808080008000000080000000800000008000000080000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF008000000000FFFF008000000000FF
      FF008000000000FFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF0080000000800000008000
      000000FFFF00FFFFFF0000FFFF0000000000000000000000000000000000FFFF
      FF00808080008080800080808000808080008080800080808000FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF0000008000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000800000008000
      0000FF00000080000000FFFFFF00FFFFFF008080800080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00800000008000000000FFFF008000
      00008000000000FFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00000080000000800000008000C0C0C000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000008080800080000000FF00
      000080000000FF000000FFFFFF00FFFFFF0080808000FF000000800000008000
      00008000000080808000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF0080000000800000008000
      000000FFFF00FFFFFF0000FFFF0000000000000000000000000000000000FFFF
      FF0080808000808080008080800080808000808080008080800080808000FFFF
      FF0000000000000000000000000000000000000000000000000080808000FFFF
      FF000000800000008000FFFFFF000000800000008000C0C0C000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000080000000FF0000008000
      0000FF00000080000000FF000000FF000000FF00000080000000FF0000008000
      00008000000080000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF00FFFFFF0000FFFF008000000000FFFF008000000000FF
      FF008000000000FFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000008000C0C0C000C0C0C000FFFF
      FF00FFFFFF0000000000000000000000000000000000FF000000FF000000FF00
      000080000000FF000000FFFFFF00FFFFFF0080808000FF00000080000000FF00
      00008000000080000000000000000000000000000000FFFFFF0000FFFF008000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF0000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000008000C0C0C000C0C0
      C000FFFFFF0000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF00FFFFFF0080808000FF0000008000
      0000FF00000080000000000000000000000000000000FFFFFF0080800000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000008000C0C0
      C000FFFFFF0000000000000000000000000000000000FF000000FF000000FF00
      0000FF00000080808000FF000000FF000000FFFFFF00FFFFFF0080000000FF00
      00008000000080000000000000000000000000000000FFFFFF00808000008080
      8000008000000000000000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0080808000808080008080800080808000808080008080800080808000FFFF
      FF0000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      8000FFFFFF0000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FF0000008000
      0000FF00000080000000000000000000000000000000FFFFFF0080800000FFFF
      FF00808080008000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000080808000FF000000FF00
      0000FF00000080808000FFFFFF00FFFFFF00FFFFFF008080800080000000FF00
      00008000000080808000000000000000000000000000FFFFFF0000FFFF008080
      0000808000008080000000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      000080000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00808080008080800080808000808080008080800080808000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000808080008080800080808000FF000000FF0000008000
      00008000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000008080
      80008080800080808000FFFFFF00C0C0C000C0C0C000C0C0C000808080008080
      800080808000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000800000008000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FF000000FF000000FF000000FF00000080808000808080000000
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
      0000000000000000000000000000000000000000000000000000000000008080
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00008080
      0000808000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF00FFFFFF00FFFFFF00808080008080800080808000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000808000008080000000000000000000000000000000000000000000000000
      000080808000FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF0080808000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000FFFF00000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF00FFFFFF00FFFFFF00808080008080800080808000FFFF
      FF000000000000FFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF00808080008080800080808000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000FFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF008080800080808000808080008080800080808000FFFFFF00FFFF
      FF000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF0080808000FFFFFF0080808000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00000000000080800000000000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF00808080008080800080808000FFFFFF00000000000000
      000000000000FFFFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF008080800080808000808080008080800080808000FFFFFF00FFFF
      FF000000000000000000000000000000000080808000FFFFFF00FFFFFF000000
      000000FFFF000080800000808000000000008080800080808000808080000000
      00000000800000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      8000FFFFFF0000FFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000C0C0C00000000000FFFFFF000000
      000000000000000000000000000080000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000080808000FFFFFF000000000000FF
      FF0000FFFF0000FFFF00008080000080800000000000FFFFFF00000000000000
      FF000000800000008000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF0080808000808080008080800080808000808080008080800080808000FFFF
      FF0000FFFF00FFFFFF0000FFFF000000000000000000FFFFFF0000000000C0C0
      C00000000000FFFFFF0000000000C0C0C00000000000C0C0C000000000000000
      000000000000000000008000000080000000000000000000000080808000FFFF
      FF00FFFFFF008080800080808000808080008080800080808000FFFFFF00FFFF
      FF000000000000000000000000000000000080808000FFFFFF00FFFFFF000000
      000000FFFF0000FFFF0000FFFF00008080000080800000000000FFFFFF000000
      00000000FF0000008000000080000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0C000C0C0
      C000C0C0C000000000008000000080000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000FF00000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008080800000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF008080800080808000000000000000000000000000000000000000
      000000000000C0C0C00000000000C0C0C00000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C0008000000080000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      00000000000000000000C0C0C00000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C0008000000080000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000C0C0C0008080
      80000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000008000000080000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FC1C000000000000F000000000000000
      E000000000000000C001000000000000C0010000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      C001000000000000C001000000000000E003000000000000F007000000000000
      FC1F000000000000FFFF000000000000FFFFFFFFFFFFFFFFF000FFFFE007FFFF
      F000C007C003F01FF000C007C003E00FF000C007C003C0070000C007C0038003
      0000C007C00380030000C007C00380030000C007C00380030000C007C0038003
      001FC007C0038003003BC007C0038003007BC007C003C0070060C007E007E00F
      007BFFFFFC3FF01F007BFFFFFFFFFFFFFFEFF007FFFFFFFFFFC7F007000FFFFF
      FF83F007000FC007FFC1F000000FC00700030000000FC00700010000000FC007
      00010000000FC00700010000000FC00700030000000EC007000100000004C007
      000000000000C007000100010000C00700030001F800C00F00010001FC00C01F
      00010001FE04C03F00010001FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object DocumentStateImageList: TImageList
    Width = 8
    Left = 388
    Top = 304
    Bitmap = {
      494C010104000900040008001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000200000002000000001002000000000000010
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
      00000000000000000000000000000000000084840000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000008484000084840000FF000000FFFF
      FF0084000000FF000000FF00000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000848400008484000084840000FFFF
      FF0084000000FF000000FF000000000000000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000008484000084840000848400008484
      0000FF000000FF000000FF000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000008484000084840000848400008484
      000084840000FF000000FF000000000000000000FF000000FF00000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084840000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000084840000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000848400008484
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
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
      2800000020000000200000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0101CFFF010187FF010103FF010103FF010121FF01BBF1FF03BBF9FF07C7FD
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object DesktopAlert: TJvDesktopAlert
    Options = [daoCanMove, daoCanMoveAnywhere, daoCanClose]
    Location.Position = dapActiveFormCenter
    Location.Top = 0
    Location.Left = 0
    Location.Width = 0
    Location.Height = 0
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -12
    HeaderFont.Name = 'Segoe UI'
    HeaderFont.Style = [fsBold]
    ShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Buttons = <>
    Image.Data = {
      055449636F6E0000010001002020000001001800A80C00001600000028000000
      2000000040000000010018000000000000000000960000009600000000000000
      00000000CECE00CECE00CECE00CDCD00CDCD00CDCD00B2C534CCCC01CDCD00CD
      CD00CECE00CDCD00CECE00CECE00CECE00CDCD00CECE00CECE00CECE00CDCD00
      CECE00CDCD00CDCD00CCCC00C4D23EB8CD51CDCD00CDCD00CECE00CECE00CECE
      00CDCD00CDCD00CDCD00CDCD00CDCD00CCCC00CCCC00C1D7A1A0BC96C8CC14CD
      CD00CDCD00CCCC00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00
      CDCD00CDCD00CECE06D3E18AC5D7DEC8D46ACDCD00CDCD00CDCD00CDCD00CDCD
      00CDCD00CECE00CECE00CECE00CDCD00CDCD00CDCD00D0DB64D6E1E4C2CAB2C9
      CC25CDCD00CCCC00CDCD00CECE00CECE00CDCD00CECE00CECE00CECE00CDCD00
      CDCD00CCCD06D2DF9BDCE4E2ABC3D3CED119CDCD00CDCD00CECE00CECE00CECE
      00CDCD00CDCD00CDCD00CDCD00CDCD00CCCC00CCCC00CED11ED8E6E1D1DADDCA
      D0CDC6CE68CCCC00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00
      CFD536D3E5C8E3E7E5CFD3D4C5CFA4CCCC00CDCD00CDCD00CDCD00CDCD00CDCD
      00CDCD00CECE00CECE00CECE00CDCD00CDCD00CDCD00CDCD00D0E2BADFE5E6CF
      D5D7CACFCEC3CFA9CDD01FCDCD00CDCD00CCCC00CDCD00CDCD00CDCD00C8D445
      D8E6E1E7E8E7DBDCDAC5CCD0BED077CCCD00CDCD00CDCD00CECE00CECE00CECE
      00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDD96DE5E8E6DD
      E4E6CDD1D1CFD1D0C6CEBCC8CC1FCCCC00CDCC00CDCD00CCCC00CFDC82DFE8E8
      E7E9E7E0E3E1D0D1D0BFCBD0CED32ACECE00CFCF00CDCD00CDCD00CDCD00CDCD
      00CDCD00CECE00CECE00CECE00CDCD00CDCD00CDCD00CDCD00CACE0FE1E7E4E7
      E9E8D6DDDECDD1CFCFD0D0CACEBFC8D26CCDCD02CCCE0CD6DFA2E5E8E8E8E8E8
      E6E7E7D0D3D3CFD0D0C3CFB4CDCD00CECE00CECE00CDCD00CECE00CECE00CECE
      00CDCD00CDCD00CDCD00CDCD00CDCD00CCCC00CCCC00CCCC00CCCC00D6E2BAE8
      E9E8E5E8E8CFD5D8D0D1CFCFD1CFCBCFCFC4CD87D9E4CCE7E8E8E8E8E8E8E8E8
      D8DADACED0D0CED0CFC6D385CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD
      00CDCD00CECE00CECE00CECE00CDCD00CDCD00CDCD00CDCD00CCCC00CED96CE7
      E9E7E8E9E8DFE5E6CED1D3CFD1CFCFD1D0D2D8D9E7E9E8E8E9E8E9E9E9E0E0E0
      CFD0D0D0D0D0C8CECFCDD331CDCD00CDCD00CECE00CDCD00CECE00CECE00CECE
      00CDCD00CDCD00CDCD00CDCD00CDCD00CCCC00CCCC00CCCC00CCCC00CED74ADF
      E8E7E8E9E8E7E8E7D8E0E0CED1D0CFD1D0D4D7D7E7E9E8E8E9E8E7E7E7D2D2D2
      D0D0D0D0D0D0C4CEABCCCC00CCCC00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD
      00CDCD00CECE00CECE00CECE00CDCD00CDCD00CDCD00CDCD00CCCC00CDD013D2
      E7EAE8E9E7E8E9E7E6E8E7CFD7DACFD1CFD3D7D7E6E9E8E7E9E8D8D9D8CFD0D0
      D0D1D0CFD0D1C4CE79CCCC00CDCD00CDCD00CDCD00CDCD00CECE00CECE00CECE
      00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CECD00CDCD00CCCC00D0
      E6C0E8E9E8E7E9E8E8E9E8E2E6E7CDD2D3D1D7D6E7E8E7E0E1E1D0D0CFCFD1D0
      D0D1CFC0CAD0CCD348CCCC00CCCC00CDCD00CCCC00CDCD00CDCD00CDCD00CDCD
      00CDCD00CECE00CECE00CECE00CDCD00CDCD00CDCD00CDCD00CDCD00CECE0AC3
      D6B2DCE1E2E5E8E7E8E9E8E7E9E8DBE2E4D0D6D7E5E9E7D1D7D8CFD1D0CDD1D0
      D1D7D8CBDBE1CEE08ACCCC00CDCD00CDCD00CDCD00CDCD00CECE00CECE00CECE
      00CDCD00CDCD00CDCD00CDCD00CDCD00CCCC00CCCC00CCCC00CBCD11C8CF9CCE
      CFD0D0D0D0CED3D2D4D9DBDAE1E2E3E7E7D4DDE2D8E0E3D2D7D8D9DFDFE2E6E6
      E8E9E8E8E9E8DDE7E8D4E39FCDCF0ECCCC00CCCC00CDCD00CDCD00CDCD00CDCD
      00CDCD00CECE00CECE00CECE00CDCD00CDCD00CDCD00CBD34EC7CEB3D0D0D0D1
      D1D1D1D1D1CED1CECDD0CECBD0D0CED7DBD8E2E6DFE6E6E6E9E8E6E9E7E8E9E8
      E9E9E9E9E9E9E8E8E8E2E8E6D0E0AFCDD017CDCD00CDCD00CECE00CECE00CECE
      00CDCD00CDCD00CDCD00CDCD00CCCC00CCCD00C4D281C5CED2CFD0CFCFD1CFCF
      D0D0CED0D0D2D6D6D8DEDFE0E6E6E6E8E8D1DCDFDCE2E3CED4D6D7DDDDDFE4E5
      E8E9E8E8E9E8E8E9E7E7E9E9E3E8EAD2DFB2CBD024CCCC00CDCD00CDCD00CDCE
      00CDCD00CECE00CDCD00CDCD00CDD018C8D4ADC7CECECED0CFCED1D0CED5D5D8
      DEDEE0E5E6E5E9E7E7E9E8E8E9E8D9DFE1D0D5D7E5E9E7D3DADBCDD0CECED1CF
      D1D6D5D6DDDEE2E5E6E7E9E8E7E9E8E7E9E7D9E5E0CCD661CBCC04CDCD00CDCD
      00CDCD00CDCD00CCCC00C8CF31C7D1BDCCD1CFCDD3D4D6DCDCE0E5E5E6E9E7E8
      E9E8E8E9E8E7E9E8E7E9E8DFE5E5CDD1D1D1D6D7E7E9E7E1E7E7CFD3D4CFD1D0
      D0D1D0CED0CFCED1CFCFD5D6D6DCDEE2E6E6E4E7EBDFE7EBD2DE96CBCD12CCCD
      00CDCD00CDCD00C8D368C3D1D2D6DBDEDEE3E5E7E8E8E9E9E8E9E9E7E9E9E7E9
      E9E7E9E9E7E8E9E8E3E8E6CED5D7CFD1CFD3D7D7E7E9E7E7E9E8DCE2E2CDD1D0
      D0D1D0D0D1D0D0D1D0D0D1D0CFD1CECDD1D0CED5D7D9DFDFE2E6E6DBE7DCD5DA
      54CCCC00BBD167B7D8DBD0E7DAD5E7D1D8E4BAD8E3BCD3E3D4CFE5E0CFE5E0D0
      E4DAD5E2C1D3E4D8D2DBDBCED1D0CFD1D0D3D7D7E7E8E7E7E9E8E6E9E8CBD8DD
      CAD1D2CAD1D2CAD1D2CAD1D2CAD1D2CBD1D2CAD1D2CBD1D2C7D1D5BFD1E1C3DA
      E7CCD03DCDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CD
      CD00CDCD00CCCC00C7CC7DCFD0D0D1D1D0D3D6D7E7E9E7E3E7E8E0E7E7CDDC85
      D8D93DD9DA40D9DA40D9DA40D9DA40D9DA40D9DA40D9DA41D8DA41D4D941D6D7
      40D0D321CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CD
      CD00CDCD00CCCC00C1C952CECFD1D0D0D0D3D6D7E7E8E7E7E9E7DFE7E7CED643
      CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD
      00CDCD00CECE00CECE00CECE00CDCD00CECE00CECE00CECE00CDCD00CECE00CE
      CE00CDCD00CCCC00C7CA0CCCCFC5D0D1D0D3D6D7E7E9E7E7E9E8DAE1ACCDCD00
      CDCD00CECE00CECE00CDCD00CECE00CECE00CECE00CDCD00CECE00CECE00CECE
      00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CD
      CD00CDCD00CBCC02CCCC00C8CDA6CFD1D0D3D6D7E7E8E7E6E8E8D1DB79CDCD00
      CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD
      00CDCD00CECE00CECE00CECE00CDCD00CECE00CECE00CECE00CDCD00CECE00CE
      CE00CDCD00CCCC01CCCC00BCC76ECED1CFD2D7D7E7E9E7E6E8E7CAD12BCDCD00
      CDCD00CECE00CECE00CDCD00CECE00CECE00CECE00CDCD00CECE00CECE00CECE
      00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CD
      CD00CDCD00CDCD00CDCD00C7CB2DCCCFCFD2D6D7E6E9E6DBE9E9CDCF0FCCCC00
      CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD
      00CDCD00CECE00CECE00CECE00CDCD00CECE00CECE00CECE00CDCD00CECE00CE
      CE00CECE00CDCD00CDCD00CCCE10C3CDCBD1D6D8E6E8E6D2E2ABCDCD00CCCC00
      CDCD00CECE00CECE00CDCD00CECE00CECE00CECE00CDCD00CECE00CECE00CECE
      00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CD
      CD00CDCD00CDCD00CDCD00CCCC00C1CEA4CED5D7E4E7E6D1DE77CDCD00CDCD00
      CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD
      00CDCD00CECE00CECE00CECE00CDCD00CECE00CECE00CECE00CDCD00CECE00CE
      CE00CECE00CDCD00CDCD00CDCD00BFCA51D2D7D6DDE8E8D0D531CECE00CDCD00
      CECE00CECE00CECE00CDCD00CECE00CECE00CECE00CDCD00CECE00CECE00CECE
      00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CD
      CD00CDCD00CDCD00CDCD00CDCD00CACF1EC0CFD8D4DFA3CDCD00CDCD00CDCD00
      CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD
      00CDCD00CECE00CECE00CECE00CDCD00CECE00CECE00CECE00CDCD00CECE00CE
      CE00CECE00CDCD00CDCD00CDCD00CCCD00C1D3C2CBD863CDCD00CDCD00CDCD00
      CECE00CECE00CECE00CDCD00CECE00CECE00CECE00CDCD00CECE00CECE00CECE
      00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CD
      CD00CDCD00CDCD00CDCD00CDCD00CCCC00B9CB5DCCD532CDCD00CDCD00CDCD00
      CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD00CDCD
      00CDCD0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000}
    Left = 536
    Top = 256
  end
end
