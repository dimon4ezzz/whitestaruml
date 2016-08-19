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
          OnActivate = PropertiesDockPanelActivate
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
          OnActivate = DocumentationDockPanelActivate
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
          OnActivate = AttachmentsDockPanelActivate
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
      'Model'
      'View'
      'Edit'
      'Tools'
      'Status'
      'Help'
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
    ImageOptions.StretchGlyphs = False
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    MenusShowRecentItemsFirst = False
    PopupMenuLinks = <>
    UseFullReset = True
    UseSystemFont = False
    OnBarVisibleChange = BarManagerBarVisibleChange
    OnClickItem = BarManagerClickItem
    Left = 452
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
          ItemName = 'FormatMenux'
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
          ItemName = 'EditPasteFormat'
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
          BeginGroup = True
          Visible = True
          ItemName = 'EditSelectAll'
        end>
    end
    object FormatMenux: TdxBarSubItem
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
      OnClick = ModelMenuClick
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
          ItemName = 'FileUnitsUnloadUnit'
        end
        item
          Visible = True
          ItemName = 'FileUnitsOpenUnit'
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
    object FileUnitsUnloadUnit: TdxBarButton
      Caption = 'U&nload Unit'
      Category = 2
      Hint = 'Unload Unit'
      Visible = ivAlways
      OnClick = FileMenuClick
    end
    object FileUnitsOpenUnit: TdxBarButton
      Caption = '&Open Unit...'
      Category = 2
      Hint = 'Open Unit'
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
    object ModelAdd: TdxBarSubItem
      Caption = '&Add'
      Category = 3
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
      Category = 3
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
      Category = 3
      Hint = 'Model'
      Visible = ivAlways
      ImageIndex = 7
      OnClick = ModelAddMenuClick
    end
    object ModelAddSubsystem: TdxBarButton
      Caption = 'Subsystem'
      Category = 3
      Hint = 'Subsystem'
      Visible = ivAlways
      ImageIndex = 10
      OnClick = ModelAddMenuClick
    end
    object ModelAddPackage: TdxBarButton
      Caption = 'Package'
      Category = 3
      Hint = 'Package'
      Visible = ivAlways
      ImageIndex = 13
      OnClick = ModelAddMenuClick
    end
    object ModelAddClass: TdxBarButton
      Caption = 'Class'
      Category = 3
      Hint = 'Class'
      Visible = ivAlways
      ImageIndex = 16
      OnClick = ModelAddMenuClick
    end
    object ModelAddInterface: TdxBarButton
      Caption = 'Interface'
      Category = 3
      Hint = 'Interface'
      Visible = ivAlways
      ImageIndex = 17
      OnClick = ModelAddMenuClick
    end
    object ModelAddEnumeration: TdxBarButton
      Caption = 'Enumeration'
      Category = 3
      Hint = 'Enumeration'
      Visible = ivAlways
      ImageIndex = 18
      OnClick = ModelAddMenuClick
    end
    object ModelAddComponent: TdxBarButton
      Caption = 'Component'
      Category = 3
      Hint = 'Component'
      Visible = ivAlways
      ImageIndex = 21
      OnClick = ModelAddMenuClick
    end
    object ModelAddComponentInstance: TdxBarButton
      Caption = 'Component Instance'
      Category = 3
      Hint = 'Component Instance'
      Visible = ivAlways
      ImageIndex = 22
      OnClick = ModelAddMenuClick
    end
    object ModelAddNode: TdxBarButton
      Caption = 'Node'
      Category = 3
      Hint = 'Node'
      Visible = ivAlways
      ImageIndex = 23
      OnClick = ModelAddMenuClick
    end
    object ModelAddNodeInstance: TdxBarButton
      Caption = 'Node Instance'
      Category = 3
      Hint = 'Node Instance'
      Visible = ivAlways
      ImageIndex = 24
      OnClick = ModelAddMenuClick
    end
    object ModelAddUseCase: TdxBarButton
      Caption = 'Use Case'
      Category = 3
      Hint = 'Use Case'
      Visible = ivAlways
      ImageIndex = 25
      OnClick = ModelAddMenuClick
    end
    object ModelAddActor: TdxBarButton
      Caption = 'Actor'
      Category = 3
      Hint = 'Actor'
      Visible = ivAlways
      ImageIndex = 26
      OnClick = ModelAddMenuClick
    end
    object ModelAddAttribute: TdxBarButton
      Caption = 'Attribute'
      Category = 3
      Hint = 'Attribute'
      Visible = ivAlways
      ImageIndex = 46
      OnClick = ModelAddMenuClick
    end
    object ModelAddOperation: TdxBarButton
      Caption = 'Operation'
      Category = 3
      Hint = 'Operation'
      Visible = ivAlways
      ImageIndex = 50
      OnClick = ModelAddMenuClick
    end
    object ModelAddParameter: TdxBarButton
      Caption = 'Parameter'
      Category = 3
      Hint = 'Parameter'
      Visible = ivAlways
      ImageIndex = 54
      OnClick = ModelAddMenuClick
    end
    object ModelAddTemplateParameter: TdxBarButton
      Caption = 'Template Parameter'
      Category = 3
      Hint = 'Template Parameter'
      Visible = ivAlways
      ImageIndex = 55
      OnClick = ModelAddMenuClick
    end
    object ModelAddEnumerationLiteral: TdxBarButton
      Caption = 'Enumeration Literal'
      Category = 3
      Hint = 'Enumeration Literal'
      Visible = ivAlways
      ImageIndex = 56
      OnClick = ModelAddMenuClick
    end
    object ModelAddSignal: TdxBarButton
      Caption = 'Signal'
      Category = 3
      Hint = 'Signal'
      Visible = ivAlways
      ImageIndex = 19
      OnClick = ModelAddMenuClick
    end
    object ModelAddObject: TdxBarButton
      Caption = 'Object'
      Category = 3
      Hint = 'Object'
      Visible = ivAlways
      ImageIndex = 73
      OnClick = ModelAddMenuClick
    end
    object ModelAddCollaboration: TdxBarButton
      Caption = 'Collaboration'
      Category = 3
      Hint = 'Collaboration'
      Visible = ivAlways
      ImageIndex = 30
      OnClick = ModelAddMenuClick
    end
    object ModelAddCollaborationInstanceSet: TdxBarButton
      Caption = 'Collaboration Instance Set'
      Category = 3
      Hint = 'Collaboration Instance Set'
      Visible = ivAlways
      ImageIndex = 31
      OnClick = ModelAddMenuClick
    end
    object ModelAddClassifierRole: TdxBarButton
      Caption = 'Classifier Role'
      Category = 3
      Hint = 'Classifier Role'
      Visible = ivAlways
      ImageIndex = 72
      OnClick = ModelAddMenuClick
    end
    object ModelAddInteraction: TdxBarButton
      Caption = 'Interaction'
      Category = 3
      Hint = 'Interaction'
      Visible = ivAlways
      ImageIndex = 32
      OnClick = ModelAddMenuClick
    end
    object ModelAddInteractionInstanceSet: TdxBarButton
      Caption = 'Interaction Instance Set'
      Category = 3
      Hint = 'Interaction Instance Set'
      Visible = ivAlways
      ImageIndex = 33
      OnClick = ModelAddMenuClick
    end
    object ModelAddStateMachine: TdxBarButton
      Caption = 'State Machine'
      Category = 3
      Hint = 'State Machine'
      Visible = ivAlways
      ImageIndex = 28
      OnClick = ModelAddMenuClick
    end
    object ModelAddState: TdxBarButton
      Caption = 'State'
      Category = 3
      Hint = 'State'
      Visible = ivAlways
      ImageIndex = 29
      OnClick = ModelAddMenuClick
    end
    object ModelAddSubmachineState: TdxBarButton
      Caption = 'Submachine State'
      Category = 3
      Hint = 'Submachine State'
      Visible = ivAlways
      ImageIndex = 45
      OnClick = ModelAddMenuClick
    end
    object ModelAddInitialState: TdxBarButton
      Caption = 'Initial State'
      Category = 3
      Hint = 'Initial State'
      Visible = ivAlways
      ImageIndex = 37
      OnClick = ModelAddMenuClick
    end
    object ModelAddFinalState: TdxBarButton
      Caption = 'Final State'
      Category = 3
      Hint = 'Final State'
      Visible = ivAlways
      ImageIndex = 43
      OnClick = ModelAddMenuClick
    end
    object ModelAddDecision: TdxBarButton
      Caption = 'Decision'
      Category = 3
      Hint = 'Decision'
      Visible = ivAlways
      ImageIndex = 36
      OnClick = ModelAddMenuClick
    end
    object ModelAddSynchronization: TdxBarButton
      Caption = 'Synchronization'
      Category = 3
      Hint = 'Synchronization'
      Visible = ivAlways
      ImageIndex = 38
      OnClick = ModelAddMenuClick
    end
    object ModelAddJunctionPoint: TdxBarButton
      Caption = 'Junction Point'
      Category = 3
      Hint = 'Junction Point'
      Visible = ivAlways
      ImageIndex = 39
      OnClick = ModelAddMenuClick
    end
    object ModelAddChoicePoint: TdxBarButton
      Caption = 'Choice Point'
      Category = 3
      Hint = 'Choice Point'
      Visible = ivAlways
      ImageIndex = 40
      OnClick = ModelAddMenuClick
    end
    object ModelAddShallowHistory: TdxBarButton
      Caption = 'Shallow History'
      Category = 3
      Hint = 'Shallow History'
      Visible = ivAlways
      ImageIndex = 41
      OnClick = ModelAddMenuClick
    end
    object ModelAddDeepHistory: TdxBarButton
      Caption = 'Deep History'
      Category = 3
      Hint = 'Deep History'
      Visible = ivAlways
      ImageIndex = 42
      OnClick = ModelAddMenuClick
    end
    object ModelAddSwimlane: TdxBarButton
      Caption = 'Swimlane'
      Category = 3
      Hint = 'Swimlane'
      Visible = ivAlways
      ImageIndex = 44
      OnClick = ModelAddMenuClick
    end
    object ModelAddEffect: TdxBarButton
      Caption = 'Effect'
      Category = 3
      Hint = 'Effect'
      Visible = ivAlways
      ImageIndex = 64
      OnClick = ModelAddMenuClick
    end
    object ModelAddEntryAction: TdxBarButton
      Caption = 'Entry Action'
      Category = 3
      Hint = 'Entry Action'
      Visible = ivAlways
      ImageIndex = 65
      OnClick = ModelAddMenuClick
    end
    object ModelAddDoAction: TdxBarButton
      Caption = 'Do Action'
      Category = 3
      Hint = 'Do Action'
      Visible = ivAlways
      ImageIndex = 66
      OnClick = ModelAddMenuClick
    end
    object ModelAddExitAction: TdxBarButton
      Caption = 'Exit Action'
      Category = 3
      Hint = 'Exit Action'
      Visible = ivAlways
      ImageIndex = 67
      OnClick = ModelAddMenuClick
    end
    object ModelAddActivityGraph: TdxBarButton
      Caption = 'Activity Graph'
      Category = 3
      Hint = 'Activity Graph'
      Visible = ivAlways
      ImageIndex = 27
      OnClick = ModelAddMenuClick
    end
    object ModelAddActionState: TdxBarButton
      Caption = 'Action State (Activity)'
      Category = 3
      Hint = 'Action State (Activity)'
      Visible = ivAlways
      ImageIndex = 34
      OnClick = ModelAddMenuClick
    end
    object ModelAddSubactivityState: TdxBarButton
      Caption = 'Subactivity State'
      Category = 3
      Hint = 'Subactivity State'
      Visible = ivAlways
      ImageIndex = 35
      OnClick = ModelAddMenuClick
    end
    object ModelAddSignalEvent: TdxBarButton
      Caption = 'Signal Event'
      Category = 3
      Hint = 'Signal Event'
      Visible = ivAlways
      ImageIndex = 68
      OnClick = ModelAddMenuClick
    end
    object ModelAddCallEvent: TdxBarButton
      Caption = 'Call Event'
      Category = 3
      Hint = 'Call Event'
      Visible = ivAlways
      ImageIndex = 69
      OnClick = ModelAddMenuClick
    end
    object ModelAddTimeEvent: TdxBarButton
      Caption = 'Time Event'
      Category = 3
      Hint = 'Time Event'
      Visible = ivAlways
      ImageIndex = 70
      OnClick = ModelAddMenuClick
    end
    object ModelAddChangeEvent: TdxBarButton
      Caption = 'ChangeEvent'
      Category = 3
      Hint = 'Change Event'
      Visible = ivAlways
      ImageIndex = 71
      OnClick = ModelAddMenuClick
    end
    object ModelAddException: TdxBarButton
      Caption = 'Exception'
      Category = 3
      Hint = 'Exception'
      Visible = ivAlways
      ImageIndex = 20
      OnClick = ModelAddMenuClick
    end
    object ModelAddObjectFlowState: TdxBarButton
      Caption = 'Object Flow State'
      Category = 3
      Hint = 'Object Flow State'
      Visible = ivAlways
      ImageIndex = 171
      OnClick = ModelAddMenuClick
    end
    object ModelAddFlowFinalState: TdxBarButton
      Caption = 'Flow Final State'
      Category = 3
      Hint = 'Flow Final State'
      Visible = ivAlways
      ImageIndex = 166
      OnClick = ModelAddMenuClick
    end
    object ModelAddSignalAcceptState: TdxBarButton
      Caption = 'Signal Accept State'
      Category = 3
      Hint = 'Signal Accept State'
      Visible = ivAlways
      ImageIndex = 159
      OnClick = ModelAddMenuClick
    end
    object ModelAddSignalSendState: TdxBarButton
      Caption = 'Signal Send State'
      Category = 3
      Hint = 'Signal Send State'
      Visible = ivAlways
      ImageIndex = 160
      OnClick = ModelAddMenuClick
    end
    object ModelAddArtifact: TdxBarButton
      Caption = 'Artifact'
      Category = 3
      Hint = 'Artifact'
      Visible = ivAlways
      ImageIndex = 176
      OnClick = ModelAddMenuClick
    end
    object ModelAddAttributeLink: TdxBarButton
      Caption = 'Attribute Link'
      Category = 3
      Hint = 'Attribute Link'
      Visible = ivAlways
      ImageIndex = 178
      OnClick = ModelAddMenuClick
    end
    object ModelAddPort: TdxBarButton
      Caption = 'Port'
      Category = 3
      Hint = 'Port'
      Visible = ivAlways
      ImageIndex = 173
      OnClick = ModelAddMenuClick
    end
    object ModelAddExtensionPoint: TdxBarButton
      Caption = 'Extension Point'
      Category = 3
      Hint = 'Extension Point'
      Visible = ivAlways
      ImageIndex = 177
      OnClick = ModelAddMenuClick
    end
    object ModelAddCombinedFragment: TdxBarButton
      Caption = 'Combined Fragment'
      Category = 3
      Hint = 'Combined Fragment'
      Visible = ivAlways
      ImageIndex = 163
      OnClick = ModelAddMenuClick
    end
    object ModelAddInteractionOperand: TdxBarButton
      Caption = 'Interaction Operand'
      Category = 3
      Hint = 'Interaction Operand'
      Visible = ivAlways
      ImageIndex = 169
      OnClick = ModelAddMenuClick
    end
    object ModelAddFrame: TdxBarButton
      Caption = 'Frame'
      Category = 3
      Hint = 'Frame'
      Visible = ivAlways
      ImageIndex = 167
      OnClick = ModelAddMenuClick
    end
    object ModelAddDiagramUsecaseDiagram: TdxBarButton
      Tag = 1
      Caption = 'Use Case Diagram'
      Category = 3
      Hint = 'Use Case Diagram'
      Visible = ivAlways
      ImageIndex = 92
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramClassDiagram: TdxBarButton
      Tag = 2
      Caption = 'Class Diagram'
      Category = 3
      Hint = 'Class Diagram'
      Visible = ivAlways
      ImageIndex = 91
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramSequenceRoleDiagram: TdxBarButton
      Caption = 'Sequence Diagram (Role)'
      Category = 3
      Hint = 'Sequence Diagram (Role)'
      Visible = ivAlways
      ImageIndex = 94
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramSequenceDiagram: TdxBarButton
      Tag = 3
      Caption = 'Sequence Diagram'
      Category = 3
      Hint = 'Sequence Diagram'
      Visible = ivAlways
      ImageIndex = 93
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramCollaborationRoleDiagram: TdxBarButton
      Caption = 'Collaboration Diagram (Role)'
      Category = 3
      Hint = 'Collaboration Diagram (Role)'
      Visible = ivAlways
      ImageIndex = 96
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramCollaborationDiagram: TdxBarButton
      Tag = 4
      Caption = 'Collaboration Diagram'
      Category = 3
      Hint = 'Collaboration Diagram'
      Visible = ivAlways
      ImageIndex = 95
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramStatechartDiagram: TdxBarButton
      Tag = 5
      Caption = 'Statechart Diagram'
      Category = 3
      Hint = 'Statechart Diagram'
      Visible = ivAlways
      ImageIndex = 97
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramActivityDiagram: TdxBarButton
      Tag = 6
      Caption = 'Activity Diagram'
      Category = 3
      Hint = 'Activity Diagram'
      Visible = ivAlways
      ImageIndex = 98
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramComponentDiagram: TdxBarButton
      Tag = 7
      Caption = 'Component Diagram'
      Category = 3
      Hint = 'Component Diagram'
      Visible = ivAlways
      ImageIndex = 99
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramDeploymentDiagram: TdxBarButton
      Tag = 8
      Caption = 'Deployment Diagram'
      Category = 3
      Hint = 'Deployment Diagram'
      Visible = ivAlways
      ImageIndex = 100
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelAddDiagramCompositeStructureDiagram: TdxBarButton
      Tag = 9
      Caption = 'Composite Structure Diagram'
      Category = 3
      Hint = 'Composite Structure Diagram'
      Visible = ivAlways
      ImageIndex = 179
      OnClick = ModelAddDiagramMenuClick
    end
    object ModelCollectionEditor: TdxBarButton
      Caption = 'C&ollection Editor...'
      Category = 3
      Hint = 'Collection Editor'
      Visible = ivAlways
      ImageIndex = 148
      ShortCut = 16500
      OnClick = ModelMenuClick
    end
    object ModelConstraints: TdxBarButton
      Caption = '&Constraints...'
      Category = 3
      Hint = 'Constraints'
      Visible = ivAlways
      ImageIndex = 149
      ShortCut = 16501
      OnClick = ModelMenuClick
    end
    object ModelTaggedValues: TdxBarButton
      Caption = '&Tagged Values...'
      Category = 3
      Hint = 'Tagged Values'
      Visible = ivAlways
      ImageIndex = 150
      ShortCut = 16502
      OnClick = ModelMenuClick
    end
    object ModelProfiles: TdxBarButton
      Caption = '&Profiles...'
      Category = 3
      Hint = 'Profiles'
      Visible = ivAlways
      ImageIndex = 146
      ShortCut = 16503
      OnClick = ModelMenuClick
    end
    object ModelModelVerification: TdxBarButton
      Caption = '&Verify Model...'
      Category = 3
      Hint = 'Verify Model'
      Visible = ivAlways
      ImageIndex = 145
      ShortCut = 120
      OnClick = ModelMenuClick
    end
    object ModelProperty: TdxBarButton
      Caption = 'Show P&roperties'
      Category = 3
      Hint = 'Show Properties'
      Visible = ivAlways
      OnClick = ModelMenuClick
    end
    object ModelAttachments: TdxBarButton
      Caption = 'Show Attachments (&Links)'
      Category = 3
      Hint = 'Show Attachments (Links)'
      Visible = ivAlways
      OnClick = ModelMenuClick
    end
    object ViewCloseDiagram: TdxBarButton
      Caption = '&Close Diagram'
      Category = 4
      Hint = 'Close Diagram'
      Visible = ivAlways
      ShortCut = 16499
      OnClick = ViewMenuClick
    end
    object ViewCloseAllDiagrams: TdxBarButton
      Caption = 'Close &All Diagrams'
      Category = 4
      Hint = 'Close All Diagrams'
      Visible = ivAlways
      ShortCut = 24691
      OnClick = ViewMenuClick
    end
    object ViewSelectInModelExplorer: TdxBarButton
      Caption = '&Select In Model Explorer'
      Category = 4
      Hint = 'Select In Model Explorer'
      Visible = ivAlways
      ShortCut = 16461
      OnClick = ViewMenuClick
    end
    object ViewRefresh: TdxBarButton
      Caption = '&Refresh'
      Category = 4
      Hint = 'Refresh'
      Visible = ivAlways
      ImageIndex = 136
      ShortCut = 116
      OnClick = ViewMenuClick
    end
    object ViewZoom: TdxBarSubItem
      Caption = '&Zoom'
      Category = 4
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
      Category = 4
      Hint = 'Zoom In'
      Visible = ivAlways
      ImageIndex = 133
      OnClick = ViewMenuClick
    end
    object ViewZoomZoomOut: TdxBarButton
      Caption = 'Zoom &Out'
      Category = 4
      Hint = 'Zoom Out'
      Visible = ivAlways
      ImageIndex = 134
      OnClick = ViewMenuClick
    end
    object ViewZoomFitInWindow: TdxBarButton
      Caption = '&Fit To Window'
      Category = 4
      Hint = 'Fit To Window'
      Visible = ivAlways
      ImageIndex = 135
      OnClick = ViewMenuClick
    end
    object ViewZoom50: TdxBarButton
      Caption = '50%'
      Category = 4
      Hint = '50%'
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewZoom75: TdxBarButton
      Caption = '75%'
      Category = 4
      Hint = '75%'
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewZoom100: TdxBarButton
      Caption = '100%'
      Category = 4
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewZoom125: TdxBarButton
      Caption = '125%'
      Category = 4
      Hint = '125%'
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewZoom150: TdxBarButton
      Caption = '150%'
      Category = 4
      Hint = '150%'
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewZoom175: TdxBarButton
      Caption = '175%'
      Category = 4
      Hint = '175%'
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewZoom200: TdxBarButton
      Caption = '200%'
      Category = 4
      Hint = '200%'
      Visible = ivAlways
      OnClick = ViewZoomMenuClick
    end
    object ViewToolbars: TdxBarSubItem
      Caption = '&Toolbars'
      Category = 4
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
      Category = 4
      Hint = 'Standard'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuMainFormOnlyClick
    end
    object ViewToolbarsFormat: TdxBarButton
      Caption = '&Format'
      Category = 4
      Hint = 'Format'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuMainFormOnlyClick
    end
    object ViewToolbarsView: TdxBarButton
      Caption = '&View'
      Category = 4
      Hint = 'View'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuMainFormOnlyClick
    end
    object ViewToolbarsAlignment: TdxBarButton
      Caption = '&Alignment'
      Category = 4
      Hint = 'Alignment'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuMainFormOnlyClick
    end
    object ViewToolbarsStatusBar: TdxBarButton
      Caption = 'Status &Bar'
      Category = 4
      Hint = 'Status Bar'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuMainFormOnlyClick
    end
    object ViewZoomCombo: TdxBarCombo
      Caption = 'Zoom'
      Category = 4
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
      Category = 4
      Hint = 'Model Explorer'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewDiagramExplorer: TdxBarButton
      Caption = 'Diagram Explorer'
      Category = 4
      Hint = 'Diagram Explorer'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewPropertyEditor: TdxBarButton
      Caption = 'Properties'
      Category = 4
      Hint = 'Properties'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewDocumentationEditor: TdxBarButton
      Caption = 'Documentations'
      Category = 4
      Hint = 'Documentations'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewAttachmentEditor: TdxBarButton
      Caption = 'Attachments'
      Category = 4
      Hint = 'Attachments'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewOutputWindow: TdxBarButton
      Caption = 'Output'
      Category = 4
      Hint = 'Output'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewMessageWindow: TdxBarButton
      Caption = 'Messages'
      Category = 4
      Hint = 'Messages'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewToolbox: TdxBarButton
      Caption = 'Toolbox'
      Category = 4
      Hint = 'Toolbox'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = ViewCheckTypeMenuClick
    end
    object ViewDiagramPages: TdxBarSubItem
      Caption = 'Pages'
      Category = 4
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
      Category = 4
      Visible = ivAlways
      OnClick = ViewMenuClick
      ShowCheck = True
      ShowNumbers = False
    end
    object ViewUITheme: TdxBarSubItem
      Caption = '&UI Theme'
      Category = 4
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
      Category = 4
      Hint = 'Modern (Office 2003)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 10
      OnClick = ViewUIThemeModernClick
    end
    object ViewUIThemeClassic: TdxBarButton
      Caption = '&Classic (StarUML)'
      Category = 4
      Hint = 'Classic (StarUML)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 10
      OnClick = ViewUIThemeClassicClick
    end
    object ViewUIThemeNative: TdxBarButton
      Caption = '&Native'
      Category = 4
      Hint = 'Native'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 10
      OnClick = ViewUIThemeNativeClick
    end
    object EditUndo: TdxBarButton
      Caption = '&Undo'
      Category = 5
      Hint = 'Undo'
      Visible = ivAlways
      ImageIndex = 109
      ShortCut = 16474
      OnClick = EditMenuClick
    end
    object EditRedo: TdxBarButton
      Caption = '&Redo'
      Category = 5
      Hint = 'Redo'
      Visible = ivAlways
      ImageIndex = 110
      ShortCut = 16473
      OnClick = EditMenuClick
    end
    object EditCut: TdxBarButton
      Caption = 'Cu&t'
      Category = 5
      Hint = 'Cut'
      Visible = ivAlways
      ImageIndex = 105
      ShortCut = 16472
      OnClick = EditMenuClick
    end
    object EditCopy: TdxBarButton
      Caption = '&Copy'
      Category = 5
      Hint = 'Copy'
      Visible = ivAlways
      ImageIndex = 106
      ShortCut = 16451
      OnClick = EditMenuClick
    end
    object EditCopyDiagram: TdxBarButton
      Caption = 'Copy Dia&gram'
      Category = 5
      Hint = 'Copy Diagram'
      Visible = ivAlways
      ShortCut = 24643
      OnClick = EditMenuClick
    end
    object EditCopyDiagramAsBitmap: TdxBarButton
      Caption = 'Copy Diagram As &Bitmap'
      Category = 5
      Hint = 'Copy Diagram As Bitmap'
      Visible = ivAlways
      ShortCut = 24642
      OnClick = EditMenuClick
    end
    object EditPaste: TdxBarButton
      Caption = '&Paste'
      Category = 5
      Hint = 'Paste'
      Visible = ivAlways
      ImageIndex = 107
      ShortCut = 16470
      OnClick = EditMenuClick
    end
    object EditPasteFormat: TdxBarButton
      Caption = 'Paste Formatting'
      Category = 5
      Hint = 'Paste Formatting'
      Visible = ivAlways
      ShortCut = 24646
      OnClick = EditMenuClick
    end
    object EditDelete: TdxBarButton
      Caption = '&Delete'
      Category = 5
      Hint = 'Delete'
      Visible = ivAlways
      ImageIndex = 108
      ShortCut = 46
      OnClick = EditMenuClick
    end
    object EditDeleteFromModel: TdxBarButton
      Caption = 'Delete From &Model'
      Category = 5
      Hint = 'Delete From Model'
      Visible = ivAlways
      ShortCut = 16430
      OnClick = EditMenuClick
    end
    object EditFind: TdxBarButton
      Caption = '&Find...'
      Category = 5
      Hint = 'Find'
      Visible = ivAlways
      ImageIndex = 111
      ShortCut = 16454
      OnClick = EditMenuClick
    end
    object EditFindDiagramsWithSelectedModel: TdxBarButton
      Caption = 'Find Diagrams With Selected Model'
      Category = 5
      Hint = 'Find Diagrams With Selected Model'
      Visible = ivAlways
      OnClick = EditFindDiagramsWithSelectedModelClick
    end
    object EditSelectAll: TdxBarButton
      Caption = 'Select &All'
      Category = 5
      Hint = 'Select All'
      Visible = ivAlways
      ShortCut = 16449
      OnClick = EditMenuClick
    end
    object EditGoTo: TdxBarSubItem
      Caption = 'Go To'
      Category = 5
      Hint = 'Go To'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'EditGoToItemList'
        end>
      OnPopup = EditGoToPopup
    end
    object EditGoToItemList: TdxBarListItem
      Caption = 'Go To Items'
      Category = 5
      Visible = ivAlways
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
    object StatusBarInfo: TdxBarStatic
      Align = iaClient
      Category = 7
      Visible = ivAlways
      Alignment = taLeftJustify
      BorderStyle = sbsLowered
    end
    object StatusBarProgress: TdxBarProgressItem
      Category = 7
      Visible = ivAlways
      RightIndent = 2
      ShowCaption = False
      Width = 100
    end
    object StatusBarModifiedInfo: TdxBarStatic
      Category = 7
      Visible = ivAlways
      BorderStyle = sbsLowered
      RightIndent = 2
      Width = 70
    end
    object HelpContents: TdxBarButton
      Caption = '&Contents...'
      Category = 8
      Hint = 'Contents'
      Visible = ivAlways
      ImageIndex = 143
      ShortCut = 112
      OnClick = HelpMenuClick
    end
    object HelpAbout: TdxBarButton
      Caption = '&About...'
      Category = 8
      Hint = 'About'
      Visible = ivAlways
      OnClick = HelpMenuClick
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
        'ViewSelectInModelExplorer'
        'ModelProperty'
        'ModelAttachments')
    end
    object UnitSelectedGroup: TdxBarGroup
      Items = (
        'FileUnitsMergeUnit'
        'FileUnitsSave'
        'FileUnitsSaveAs'
        'FileUnitsDeleteUnit'
        'FileUnitsOpenUnit'
        'FileUnitsUnloadUnit')
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
    Left = 412
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
    Left = 524
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
      'JPEG Image(*.jpg)|*.jpg|JPEG Image(*.jpeg)|*.jpeg|PNG Image(*.pn' +
      'g)|*.png|Bitmap Image(*.bmp)|*.bmp|Enhanced Metafile(*.emf)|*.em' +
      'f|Metafile(*.wmf)|*.wmf'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Export Diagram'
    Left = 596
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
        ItemName = 'FormatMenux'
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
      end
      item
        Visible = True
        ItemName = 'ModelAttachments'
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
    Options = [doActivateAfterDocking, doDblClickDocking, doTabContainerHasCaption, doTabContainerCanAutoHide, doSideContainerCanClose, doSideContainerCanAutoHide, doTabContainerCanInSideContainer]
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
      055449636F6E0000010003004040000001002000284200003600000020200000
      01002000A81000005E4200001010000001002000680400000653000028000000
      4000000080000000010020000000000000420000000000000000000000000000
      00000000FFFF98FFFFFF92FFFFFF8CFFFFFF86FFFFFF80FFFFFF7BFFFFFF76FF
      FFFF71FFFFFF6DFFFFFF69FFFFFF65FFFFFF64FFFFFFD3FFFFFF7DFFFFFF5AFF
      FFFF57FFFFFF55FFFFFF53FFFFFE51FFFFFC4FFFFFF84EFFFFF34DFFFFF04BFF
      FFED4AFFFFEA4AFFFFE749FFFFE548FFFFE448FFFFE247FFFFE147FFFFE046FF
      FFE046FFFFE046FFFFE046FFFFE147FFFFE247FFFFE347FFFFE548FFFFE749FF
      FFE949FFFFEC4AFFFFEF4BFFFFF24CFFFFF74EFFFFFB4FFFFFFE51FFFFFF52FF
      FFFF54FFFFFF56FFFFFF65FFFFFFD3FFFFFF60FFFFFF61FFFFFF64FFFFFF68FF
      FFFF6CFFFFFF70FFFFFF74FFFFFF79FFFFFF7FFFFFFF84FFFFFF8AFFFFFF91FF
      FFFF97FFFFFF92FFFFFF8DFFFFFF87FFFFFF81FFFFFF7BFFFFFF76FFFFFF71FF
      FFFF6DFFFFFF69FFFFFF65FFFFFF61FFFFFF60FFFFFFF7FFFFFFF5FFFFFF87FF
      FFFF54FFFFFE52FFFFFC50FFFFF84EFFFFF34CFFFFEF4BFFFFEB4AFFFFE749FF
      FFE448FFFFE147FFFFDF46FFFFDD46FFFFDC45FFFFDA45FFFFD944FFFFD944FF
      FFD844FFFFD844FFFFD944FFFFD944FFFFDA45FFFFDB45FFFFDD45FFFFDF46FF
      FFE147FFFFE448FFFFE648FFFFEA4AFFFFEE4BFFFFF24CFFFFF74EFFFFFB4FFF
      FFFE52FFFFFF75FFFFFFEAFFFFFFFFFFFFFF7AFFFFFF5DFFFFFF60FFFFFF64FF
      FFFF68FFFFFF6CFFFFFF70FFFFFF75FFFFFF7AFFFFFF7FFFFFFF85FFFFFF8BFF
      FFFF91FFFFFF8CFFFFFF87FFFFFF80FFFFFF7BFFFFFF75FFFFFF70FFFFFF6CFF
      FFFF68FFFFFF64FFFFFF60FFFFFF5DFFFFFF5AFFFFFFC1FFFFFFFFFFFFFFFEFF
      FFFFB4FFFFFB52FFFFF24CFFFFED4BFFFFE949FFFFE448FFFFE147FFFFDE46FF
      FFDB45FFFFD844FFFFD643FFFFD443FFFFD342FFFFD142FFFFD142FFFFD041FF
      FFD041FFFFD041FFFFD041FFFFD142FFFFD142FFFFD242FFFFD443FFFFD543FF
      FFD844FFFFDA45FFFFDD45FFFFE046FFFFE347FFFFE849FFFFEC4AFFFFF24DFF
      FFFC9BFFFFFFFAFFFFFFFFFFFFFFFFFFFFFF58FFFFFF59FFFFFF5CFFFFFF5FFF
      FFFF63FFFFFF67FFFFFF6BFFFFFF6FFFFFFF74FFFFFF79FFFFFF7FFFFFFF85FF
      FFFF8AFFFFFF86FFFFFF81FFFFFF7BFFFFFF75FFFFFF70FFFFFF6BFFFFFF67FF
      FFFF63FFFFFF5FFFFFFF5CFFFFFF59FFFFFF56FFFFFF8AFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFDDCFFFFED61FFFFE448FFFFDF46FFFFDB45FFFFD844FFFFD543FF
      FFD242FFFFD041FFFFCE41FFFFCC40FFFFCB40FFFFCA3FFFFFC93FFFFFC83FFF
      FFC83FFFFFC83FFFFFC83FFFFFC93FFFFFC93FFFFFCA40FFFFCC40FFFFCD40FF
      FFCF41FFFFD142FFFFD443FFFFD744FFFFDA45FFFFDE46FFFFE44AFFFFF3B3FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFC9FFFFFF53FFFFFF55FFFFFF58FFFFFF5BFF
      FFFF5FFFFFFF62FFFFFF66FFFFFF6AFFFFFF6FFFFFFF74FFFFFF79FFFFFF7FFF
      FFFF84FFFFFF80FFFFFF7BFFFFFF75FFFFFF70FFFFFF6BFFFFFF67FFFFFF63FF
      FFFF5FFFFFFF5BFFFFFF58FFFFFF55FFFFFE52FFFFFE51FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFDF5FFFFE578FFFFD744FFFFD342FFFFD041FFFFCD40FF
      FFCA40FFFFC83FFFFFC63EFFFFC53EFFFFC33DFFFFC23DFFFFC23DFFFFC13DFF
      FFC13DFFFFC13DFFFFC13DFFFFC23DFFFFC23DFFFFC33DFFFFC43EFFFFC63EFF
      FFC83FFFFFCA3FFFFFCC40FFFFCF41FFFFD242FFFFDB57FFFFF5CEFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFF985FFFFFB4FFFFFFE51FFFFFF54FFFFFF57FF
      FFFF5AFFFFFF5EFFFFFF62FFFFFF66FFFFFF6AFFFFFF6FFFFFFF74FFFFFF7AFF
      FFFF7FFFFFFF7BFFFFFF76FFFFFF71FFFFFF6BFFFFFF67FFFFFF63FFFFFF5FFF
      FFFF5BFFFFFF57FFFFFF54FFFFFE51FFFFFA4FFFFFF54DFFFFFDDFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7A0FFFFCD42FFFFC83FFFFFC63EFF
      FFC33DFFFFC13DFFFFC03CFFFFBE3CFFFFBD3BFFFEBC3BFFFEBB3BFFFEBB3BFF
      FEBB3BFFFEBB3BFFFEBB3BFFFEBB3BFFFEBC3BFFFEBD3BFFFFBE3CFFFFBF3CFF
      FFC13DFFFFC33DFFFFC53EFFFFC83FFFFFD773FFFFFAEEFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFCEEFFFFEC4EFFFFF14CFFFFF84EFFFFFE51FFFFFF53FF
      FFFF57FFFFFF5AFFFFFF5EFFFFFF62FFFFFF66FFFFFF6AFFFFFF6FFFFFFF75FF
      FFFF79FFFFFF76FFFFFF71FFFFFF6CFFFFFF67FFFFFF63FFFFFF5FFFFFFF5BFF
      FFFF57FFFFFF54FFFFFE51FFFFF84EFFFFF14CFFFFEA4AFFFFF1A4FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDCEFFFFC84AFFFFC03CFF
      FFBD3BFFFEBB3BFFFDBA3AFFFBB93AFFFAB73AFFF9B739FFF8B639FFF7B639FF
      F7B539FFF7B539FFF7B539FFF8B639FFF9B639FFFAB73AFFFBB83AFFFDB93AFF
      FEBB3BFFFEBD3BFFFFC03DFFFFDA8BFFFFFBF9FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF2B6FFFFE248FFFFE849FFFFEF4BFFFFF74EFFFFFD50FF
      FFFF53FFFFFF56FFFFFF5AFFFFFF5EFFFFFF62FFFFFF66FFFFFF6BFFFFFF70FF
      FFFF74FFFFFF71FFFFFF6DFFFFFF68FFFFFF63FFFFFF5FFFFFFF5BFFFFFF57FF
      FFFF54FFFFFE51FFFFF74EFFFFEF4BFFFFE849FFFFE147FFFFDE5BFFFFFDFDFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E0FFFEC45BFF
      FBB83AFFF8B639FFF6B539FFF5B338FFF3B338FFF2B238FFF1B138FFF1B137FF
      F1B137FFF1B137FFF1B137FFF1B138FFF2B238FFF3B238FFF4B338FFF6B439FF
      F8B639FFFCB941FFFFE1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE486FFFFDA45FFFFE046FFFFE648FFFFEE4BFFFFF54DFF
      FFFD50FFFFFF53FFFFFF56FFFFFF5AFFFFFF5EFFFFFF62FFFFFF67FFFFFF6CFF
      FFFF70FFFFFF6DFFFFFF69FFFFFF64FFFFFF60FFFFFF5BFFFFFF57FFFFFF54FF
      FFFE51FFFFF74EFFFFEF4BFFFFE749FFFFE046FFFFDA44FFFFD543FFFFF2D4FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFCF7F6FF
      F7C778FFF2B238FFF0B037FFEFAF37FFEDAE37FFECAE36FFECAD36FFEBAD36FF
      EBAC36FFEBAC36FFEBAD36FFECAD36FFECAD36FFEDAE37FFEEAF37FFF0B037FF
      F5BD5AFFFDF1DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFD047FFFFD342FFFFD844FFFFDE46FFFFE548FFFFED4BFF
      FFF54DFFFFFD50FFFFFF53FFFFFF57FFFFFF5AFFFFFF5FFFFFFF63FFFFFF68FF
      FFFF6CFFFFFF69FFFFFF65FFFFFF60FFFFFF5CFFFFFF58FFFFFF54FFFFFE51FF
      FFF84EFFFFEF4BFFFFE749FFFFE046FFFFD944FFFFD342FFFFCD41FFFFE094FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFAFAFAFFF7F7F7FFF7F7F7FF
      F8F7F7FFF2CD9BFFECAD3DFFEAAB36FFE8AA35FFE7AA35FFE7A935FFE6A935FF
      E6A935FFE6A935FFE6A935FFE7A935FFE7AA35FFE8AA35FFEAAC36FFF3CC8CFF
      FDF9F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFEECBFFFFC83FFFFFCC40FFFFD242FFFFD744FFFFDE46FFFFE548FF
      FFED4BFFFFF54DFFFFFD50FFFFFF53FFFFFF57FFFFFF5BFFFFFF5FFFFFFF64FF
      FFFF68FFFFFF66FFFFFF62FFFFFF5DFFFFFF59FFFFFF55FFFFFE52FFFFF94EFF
      FFF04BFFFFE749FFFFE046FFFFD944FFFFD242FFFFCD40FFFFC83FFFFFCD5DFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF2F2F2FFEEEEEEFF
      EDEDEDFFEFEFEFFFEEDECBFFE6AD4DFFE4A735FFE3A734FFE2A634FFE2A634FF
      E2A634FFE2A634FFE2A634FFE2A634FFE3A734FFE5A839FFF3D9AEFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFF9F9F9FFFDFDFDFF
      FFFEFEFFFFD88EFFFFC23DFFFFC63EFFFFCB40FFFFD142FFFFD744FFFFDE46FF
      FFE548FFFFEE4BFFFFF74EFFFFFE51FFFFFF54FFFFFF58FFFFFF5CFFFFFF60FF
      FFFF64FFFFFF62FFFFFF5EFFFFFF5AFFFFFF56FFFFFF52FFFFFB4FFFFFF14CFF
      FFE849FFFFE047FFFFD944FFFFD242FFFFCD40FFFFC73FFFFFC23DFFFFBF3CFF
      FFF7E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFEEEEEEFFE9E9E9FF
      E8E8E8FFE7E7E7FFECECECFFEDE7E1FFE3B265FFE0A434FFDFA333FFDEA333FF
      DEA333FFDEA333FFDEA333FFDFA433FFE2AC4FFFF4E5CFFFFEFEFEFFFEFEFEFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFF2F2F2FFF3F3F3FFF9F9F9FF
      FDF9F9FFFDBD53FFFEBD3BFFFFC13DFFFFC63EFFFFCB40FFFFD142FFFFD744FF
      FFDE46FFFFE648FFFFEF4BFFFFF84EFFFFFE51FFFFFF55FFFFFF59FFFFFF5DFF
      FFFF61FFFFFF5FFFFFFF5BFFFFFF57FFFFFF53FFFFFD50FFFFF34DFFFFEA4AFF
      FFE247FFFFDA45FFFFD342FFFFCD40FFFFC73FFFFFC23DFFFFBE3CFFFDBA3AFF
      FEE5B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFF0F0F0FFE6E6E6FF
      E4E4E4FFE2E2E2FFE2E2E2FFE5E5E5FFE7E3E3FFE2C093FFDCA236FFDBA133FF
      DBA133FFDBA133FFDBA133FFE2B26AFFF7F2EBFFFBFBFBFFFAFAFAFFFBFBFBFF
      FCFCFCFFFEFEFEFFFFFFFFFFFCFCFCFFEDEDEDFFECECECFFEFEFEFFFF4F4F4FF
      F7DFCCFFF7B539FFFCB93AFFFEBD3BFFFFC13DFFFFC63EFFFFCB40FFFFD242FF
      FFD844FFFFE046FFFFE849FFFFF14CFFFFFB4FFFFFFF52FFFFFF56FFFFFF5AFF
      FFFF5EFFFFFF5CFFFFFF59FFFFFF55FFFFFE51FFFFF74EFFFFED4BFFFFE448FF
      FFDC45FFFFD443FFFFCE41FFFFC83FFFFFC33DFFFFBE3CFFFDBA3AFFF8B639FF
      F8C87AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFE6E6E6FF
      E0E0E0FFDFDFDFFFDEDEDEFFDDDDDDFFDEDEDEFFE7E7E7FFE0CDB4FFD9A341FF
      D99F32FFD9A036FFE4C291FFF4F2F2FFF7F7F7FFF5F5F5FFF6F6F6FFF7F7F7FF
      F9F9F9FFFBFBFBFFFCFCFCFFEDEDEDFFE7E7E7FFE8E8E8FFEBEBEBFFF0F0F0FF
      F2CD9DFFF2B238FFF7B539FFFBB93AFFFEBD3BFFFFC13DFFFFC63EFFFFCC40FF
      FFD342FFFFDA44FFFFE247FFFFEA4AFFFFF44DFFFFFD50FFFFFF54FFFFFF58FF
      FFFF5BFFFFFF5AFFFFFF56FFFFFF52FFFFFA4FFFFFF04CFFFFE749FFFFDE46FF
      FFD643FFFFCF41FFFFC93FFFFFC33DFFFFBE3CFFFDBA3AFFF8B639FFF3B238FF
      EFB140FFFCF4F2FFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFFBFBFBFFEDEDEDFF
      DFDFDFFFDDDDDDFFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDCDCDCFFDCD1C7FF
      DDBD8AFFEDDCCBFFF4F4F4FFF3F3F3FFF3F3F3FFF3F3F3FFF4F4F4FFF5F5F5FF
      F6F6F6FFF7F7F7FFEFEFEFFFE2E2E2FFE3E3E3FFE5E5E5FFE7E7E7FFEDEDEDFF
      ECB560FFEEAE37FFF2B238FFF7B539FFFCB93AFFFEBD3BFFFFC23DFFFFC73FFF
      FFCE41FFFFD443FFFFDC45FFFFE448FFFFED4BFFFFF84EFFFFFE51FFFFFF55FF
      FFFF59FFFFFF57FFFFFF54FFFFFD50FFFFF44DFFFFEA4AFFFFE147FFFFD944FF
      FFD142FFFFCB40FFFFC53EFFFFBF3CFFFDBB3BFFF8B639FFF3B338FFEFAF37FF
      EBAC36FFF6DBBFFFFFFFFFFFFEFEFEFFFCFCFCFFF9F9F9FFF8F8F8FFF4F4F4FF
      E4E4E4FFDBDBDBFFD9D9D9FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFDCDCDCFF
      EFEFEFFFF1F1F1FFF0F0F0FFF0F0F0FFF0F0F0FFF1F1F1FFF2F2F2FFF3F3F3FF
      F5F5F5FFF2F2F2FFDFDFDFFFDEDEDEFFDFDFDFFFE2E2E2FFE5E5E5FFE7DFD3FF
      E7AA37FFEAAC36FFEEAE37FFF2B238FFF7B539FFFCBA3AFFFFBE3CFFFFC33DFF
      FFC93FFFFFD041FFFFD743FFFFDF46FFFFE849FFFFF14CFFFFFC4FFFFFFF53FF
      FFFF56FFFFFF55FFFFFE52FFFFF94EFFFFEE4BFFFFE548FFFFDC45FFFFD443FF
      FFCD40FFFFC73EFFFFC13DFFFEBC3BFFFAB73AFFF4B338FFEFB037FFEBAC36FF
      E7AA35FFECBE79FFFEFEFEFFFBFBFBFFF9F9F9FFF7F7F7FFF5F5F5FFF4F4F4FF
      EFEFEFFFDCDCDCFFD8D8D8FFD7D7D7FFD6D6D6FFD6D6D6FFD7D7D7FFDADADAFF
      EDEDEDFFEFEFEFFFEEEEEEFFEEEEEEFFEEEEEEFFEFEFEFFFF0F0F0FFF2F2F2FF
      F1F1F1FFDFDFDFFFDBDBDBFFDBDBDBFFDDDDDDFFE0E0E0FFE4E4E4FFE5CA9EFF
      E4A734FFE7A935FFEAAC36FFEEAF37FFF3B238FFF8B639FFFDBA3BFFFFBF3CFF
      FFC53EFFFFCB40FFFFD242FFFFDA44FFFFE247FFFFEC4AFFFFF64DFFFFFE51FF
      FFFF54FFFFFF53FFFFFD50FFFFF44DFFFFE949FFFFE046FFFFD744FFFFD041FF
      FFC93FFFFFC33DFFFEBD3BFFFBB83AFFF6B439FFF0B037FFECAD36FFE8AA35FF
      E4A735FFE2A63AFFFBF7F5FFFAFAFAFFF7F7F7FFF4F4F4FFF3F3F3FFF2F2F2FF
      F1F1F1FFE6E6E6FFD7D7D7FFD6D6D6FFD5D5D5FFD5D5D5FFD4D4D4FFD5D5D5FF
      EAEAEAFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEEEEEEFFF0F0F0FF
      E3E3E3FFD8D8D8FFD8D8D8FFD9D9D9FFDBDBDBFFDEDEDEFFE3E3E3FFE1B76AFF
      E1A534FFE4A734FFE7A935FFEBAC36FFEFAF37FFF4B338FFFAB73AFFFEBC3BFF
      FFC13DFFFFC73FFFFFCE41FFFFD543FFFFDD46FFFFE749FFFFF14CFFFFFB4FFF
      FFFF52FFFFFF52FFFFF94FFFFFEE4BFFFFE448FFFFDB45FFFFD342FFFFCC40FF
      FFC53EFFFFBF3CFFFDBA3AFFF8B639FFF2B138FFEDAE37FFE9AB36FFE5A835FF
      E2A634FFDFA434FFF1DFBEFFF9F9F9FFF5F5F5FFF2F2F2FFF1F1F1FFF0F0F0FF
      F0F0F0FFEEEEEEFFDFDFDFFFD5D5D5FFD4D4D4FFD4D4D4FFD3D3D3FFD4D4D4FF
      E7E7E7FFECECECFFECECECFFECECECFFECECECFFECECECFFEDEDEDFFE9E9E9FF
      D7D7D7FFD6D6D6FFD7D7D7FFD8D8D8FFD9D9D9FFDCDCDCFFDEDBDBFFDCA238FF
      DEA333FFE1A534FFE4A735FFE8AA35FFECAD36FFF1B137FFF6B439FFFCB93AFF
      FFBE3CFFFFC43EFFFFCA40FFFFD142FFFFD944FFFFE247FFFFEC4AFFFFF74EFF
      FFFE51FFFFFD50FFFFF54DFFFFEA4AFFFFE046FFFFD744FFFFCF41FFFFC83FFF
      FFC23DFFFEBD3BFFFAB73AFFF4B338FFEFAF37FFEAAC36FFE6A935FFE2A634FF
      DFA433FFDDA233FFE4C07EFFF6F6F6FFF3F3F3FFF1F1F1FFEFEFEFFFEFEFEFFF
      EEEEEEFFEEEEEEFFEAEAEAFFD8D8D8FFD4D4D4FFD3D3D3FFD3D3D3FFD3D3D3FF
      E6E6E6FFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFECECECFFEBEBEBFFDADADAFF
      D5D5D5FFD5D5D5FFD5D5D5FFD6D6D6FFD8D8D8FFDCDCDCFFDBC9ADFFDAA033FF
      DCA233FFDFA333FFE2A634FFE5A835FFE9AB36FFEDAE37FFF3B238FFF8B639FF
      FEBB3BFFFFC13DFFFFC73FFFFFCE41FFFFD543FFFFDE46FFFFE849FFFFF24CFF
      FFFB4FFFFFF94EFFFFF04CFFFFE648FFFFDC45FFFFD443FFFFCC40FFFFC53EFF
      FFBF3CFFFDBA3AFFF7B539FFF1B138FFECAD36FFE8AA35FFE4A734FFE0A534FF
      DDA333FFDBA133FFDBA646FFF1F1F1FFF1F1F1FFEFEFEFFFEEEEEEFFEDEDEDFF
      ECECECFFECECECFFECECECFFE3E3E3FFD4D4D4FFD3D3D3FFD2D2D2FFD2D2D2FF
      E5E5E5FFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEBFFECECECFFDFDFDFFFD4D4D4FF
      D4D4D4FFD4D4D4FFD5D5D5FFD5D5D5FFD7D7D7FFDBDBDBFFD9B279FFD99F32FF
      DAA032FFDDA233FFE0A434FFE3A634FFE7A935FFEBAC36FFF0B037FFF5B439FF
      FBB93AFFFFBE3CFFFFC43EFFFFCA40FFFFD242FFFFDA45FFFFE347FFFFEE4BFF
      FFF74EFFFFF54DFFFFED4AFFFFE247FFFFD944FFFFD142FFFFC93FFFFFC33DFF
      FEBD3BFFFAB83AFFF4B338FFEEAF37FFEAAB36FFE5A835FFE2A634FFDEA333FF
      DCA133FFDAA032FFD89F32FFEAE0D9FFF1F1F1FFEEEEEEFFEDEDEDFFECECECFF
      EBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFDCDCDCFFD3D3D3FFD2D2D2FFD2D2D2FF
      E6E6E6FFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEBFFE6E6E6FFD4D4D4FFD3D3D3FF
      D3D3D3FFD3D3D3FFD4D4D4FFD5D5D5FFD6D6D6FFD9D6D4FFD69D41FFD79E32FF
      D99F32FFDBA133FFDEA333FFE1A534FFE4A735FFE8AB36FFEDAE37FFF2B238FF
      F9B639FFFEBB3BFFFFC13DFFFFC83FFFFFCF41FFFFD744FFFFE046FFFFEA4AFF
      FFF24CFFFFF24CFFFFE949FFFFDF46FFFFD643FFFFCE41FFFFC73EFFFFC03CFF
      FDBB3BFFF7B639FFF1B138FFECAD36FFE7AA35FFE3A734FFE0A434FFDDA233FF
      DAA032FFD89F32FFD79D32FFE1C59DFFF2F2F2FFEDEDEDFFECECECFFEBEBEBFF
      EBEBEBFFEBEBEBFFEAEAEAFFEBEBEBFFE9E9E9FFD8D8D8FFD2D2D2FFD2D2D2FF
      E6E6E6FFEAEAEAFFEAEAEAFFEBEBEBFFE9E9E9FFD6D6D6FFD2D2D2FFD2D2D2FF
      D2D2D2FFD3D3D3FFD3D3D3FFD5D5D5FFD6D6D6FFD7C5AFFFD59C31FFD69D32FF
      D89E32FFDAA032FFDCA233FFDFA433FFE2A634FFE6A935FFEBAC36FFF0B037FF
      F6B439FFFCB93AFFFFBF3CFFFFC53EFFFFCC40FFFFD443FFFFDD45FFFFE648FF
      FFEF4BFFFFEF4BFFFFE648FFFFDC45FFFFD342FFFFCC40FFFFC43EFFFFBE3CFF
      FCB93AFFF5B438FFEFB037FFEAAC36FFE6A835FFE2A634FFDEA333FFDCA133FF
      D99F32FFD79E32FFD59D31FFD7A354FFF1F1F1FFEDEDEDFFECECECFFEBEBEBFF
      EAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFE3E3E3FFD3D3D3FFD2D2D2FF
      E4E4E4FFE9E9E9FFE9E9E9FFEAEAEAFFE0E0E0FFD2D2D2FFD2D2D2FFD2D2D2FF
      D2D2D2FFD3D3D3FFD3D3D3FFD4D4D4FFD6D6D6FFD4B47DFFD49B31FFD59C31FF
      D79E32FFD99F32FFDBA133FFDEA333FFE1A534FFE5A835FFE9AB36FFEEAF37FF
      F3B338FFFAB73AFFFEBD3BFFFFC33DFFFFCA3FFFFFD142FFFFDA45FFFFE448FF
      FFEC4AFFFFEC4AFFFFE347FFFFDA44FFFFD142FFFFC93FFFFFC33DFFFEBC3BFF
      F9B739FFF3B238FFEDAE37FFE8AA36FFE4A735FFE0A534FFDDA233FFDAA032FF
      D89F32FFD69D32FFD59C31FFD4A154FFEEEEEEFFEDEDEDFFECECECFFEBEBEBFF
      EAEAEAFFEAEAEAFFEAEAEAFFE9E9E9FFE9E9E9FFE9E9E9FFDEDEDEFFD4D4D4FF
      E4E4E4FFE9E9E9FFE9E9E9FFE9E9E9FFD7D7D7FFD1D1D1FFD2D2D2FFD3D3D3FF
      D3D3D3FFD3D3D3FFD7D7D7FFDEDEDEFFE4E4E4FFD8B581FFD39B31FFD49C31FF
      D69D31FFD89E32FFDAA032FFDCA233FFDFA434FFE3A734FFE7AA35FFECAD36FF
      F1B138FFF8B639FFFEBB3BFFFFC13DFFFFC83FFFFFCF41FFFFD844FFFFE147FF
      FFE949FFFFE949FFFFE147FFFFD844FFFFCF41FFFFC83FFFFFC13DFFFEBB3BFF
      F7B639FFF1B138FFECAD36FFE7A935FFE3A634FFDFA433FFDCA133FFDAA032FF
      D79E32FFD69D32FFD5A24DFFD9D0CAFFDDDDDDFFE1E1E1FFE9E9E9FFEBEBEBFF
      EBEBEBFFEAEAEAFFEAEAEAFFE9E9E9FFE9E9E9FFE9E9E9FFE8E8E8FFDCDCDCFF
      E5E5E5FFE9E9E9FFE9E9E9FFE1E1E1FFD2D2D2FFD1D1D1FFD1D1D1FFD4D4D4FF
      DADADAFFE5E5E5FFEAEAEAFFEBEBEBFFECECECFFEDE9E7FFD8AE6AFFD49C31FF
      D59C31FFD79E32FFD99F32FFDBA133FFDEA333FFE2A634FFE6A935FFEAAC36FF
      F0B037FFF6B439FFFDB93AFFFFBF3CFFFFC63EFFFFCD40FFFFD543FFFFDF46FF
      FFE749FFFFE849FFFFDF46FFFFD643FFFFCE41FFFFC63EFFFFBF3CFFFDBA3AFF
      F6B439FFF0B037FFEAAC36FFE6A835FFE2A634FFDEA333FFDBA133FFD99F32FF
      D79E32FFD6AB6DFFDEDBD6FFD8D8D8FFD4D4D4FFD4D4D4FFD4D4D4FFDADADAFF
      E1E1E1FFE7E7E7FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFEAEAEAFFE6E6E6FF
      E8E8E8FFEAEAEAFFE7E7E7FFDBDBDBFFD5D5D5FFDBDBDBFFE3E3E3FFE7E7E7FF
      E9E9E9FFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEBFFEDEDEDFFF0F0F0FFE5CCA1FF
      D59C34FFD69D32FFD89F32FFDBA032FFDDA233FFE1A534FFE5A835FFE9AB36FF
      EEAF37FFF4B338FFFBB83AFFFFBE3CFFFFC43EFFFFCC40FFFFD443FFFFDD45FF
      FFE548FFFFE648FFFFDE46FFFFD543FFFFCC40FFFFC53EFFFFBE3CFFFCB93AFF
      F5B338FFEFAF37FFE9AB36FFE5A835FFE1A534FFDDA233FFDBA033FFD99F39FF
      D9BB95FFDADADAFFD7D7D7FFD4D4D4FFD3D3D3FFD3D3D3FFD2D2D2FFD2D2D2FF
      D3D3D3FFD3D3D3FFD8D8D8FFDEDEDEFFE6E6E6FFEAEAEAFFEBEBEBFFEAEAEAFF
      EAEAEAFFEAEAEAFFE8E8E8FFE6E6E6FFE8E8E8FFE9E9E9FFE9E9E9FFE9E9E9FF
      E9E9E9FFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEBFFECECECFFEDEDEDFFF3F3F3FF
      EDE2D1FFD8A342FFD89E32FFDAA032FFDDA233FFE0A434FFE4A734FFE8AA35FF
      EDAE37FFF3B238FFFAB73AFFFEBD3BFFFFC33DFFFFCA40FFFFD242FFFFDB45FF
      FFE347FFFFE548FFFFDC45FFFFD342FFFFCB40FFFFC43EFFFFBD3CFFFAB83AFF
      F4B338FFEEAE37FFE8AA36FFE4A735FFE0A434FFDDA233FFDBA64AFFE0D2C2FF
      DEDEDEFFD8D8D8FFD5D5D5FFD4D4D4FFD3D3D3FFD2D2D2FFD2D2D2FFD2D2D2FF
      D2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD3D3D3FFDCDCDCFFE8E8E8FFEAEAEAFF
      EBEBEBFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFE9E9E9FFE9E9E9FF
      E9E9E9FFE9E9E9FFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEBFFECECECFFEEEEEEFF
      F3F3F3FFF1EDE7FFDDB268FFDAA032FFDCA133FFDFA434FFE3A634FFE7AA35FF
      ECAD36FFF2B238FFF9B639FFFEBC3BFFFFC23DFFFFC93FFFFFD142FFFFDA45FF
      FFE247FFFFE347FFFFDC45FFFFD342FFFFCB40FFFFC33DFFFFBD3BFFFAB73AFF
      F3B238FFEDAE37FFE8AA35FFE3A734FFE0A434FFDEB166FFDDD7D2FFDDDDDDFF
      D8D8D8FFD6D6D6FFD5D5D5FFD4D4D4FFD3D3D3FFD2D2D2FFD2D2D2FFD3D3D3FF
      D2D2D2FFD2D2D2FFD2D2D2FFD3D3D3FFD8D8D8FFE2E2E2FFE9E9E9FFEAEAEAFF
      EBEBEBFFEAEAEAFFE9E9E9FFEAEAEAFFEAEAEAFFEAEAEAFFE9E9E9FFE9E9E9FF
      E9E9E9FFE9E9E9FFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEBFFECECECFFEDEDEDFF
      EEEEEEFFF2F2F2FFF5F4F4FFE1BF82FFDCA233FFDFA433FFE2A634FFE7A935FF
      ECAD36FFF1B138FFF8B639FFFEBB3BFFFFC23DFFFFC93FFFFFD142FFFFD944FF
      FFE147FFFFE347FFFFDB45FFFFD242FFFFCA40FFFFC33DFFFEBC3BFFF9B739FF
      F2B238FFEDAE36FFE7AA35FFE4A737FFE3C597FFE3E3E3FFDDDDDDFFDADADAFF
      D8D8D8FFD6D6D6FFD5D5D5FFD4D4D4FFD3D3D3FFD2D2D2FFD2D2D2FFD3D3D3FF
      D5D5D5FFD9D9D9FFE2E2E2FFE7E7E7FFEAEAEAFFEAEAEAFFEAEAEAFFE9E9E9FF
      E9E9E9FFEAEAEAFFE7E7E7FFE1E1E1FFE5E5E5FFE9E9E9FFE9E9E9FFE9E9E9FF
      E9E9E9FFE9E9E9FFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEBFFECECECFFEDEDEDFF
      EEEEEEFFF0F0F0FFF4F4F4FFF8F8F8FFEBD6B9FFDFA73DFFE2A634FFE6A935FF
      EBAD36FFF1B137FFF7B539FFFEBB3BFFFFC13DFFFFC83FFFFFD041FFFFD944FF
      FFE046FFFFE347FFFFDB45FFFFD242FFFFCA40FFFFC33DFFFEBC3BFFF9B739FF
      F2B238FFECAD36FFE9AF4AFFE9D8C2FFE6E6E6FFE1E1E1FFDCDCDCFFD9D9D9FF
      D8D8D8FFD6D6D6FFD5D5D5FFD5D5D5FFD4D4D4FFD4D4D4FFD8D8D8FFE2E2E2FF
      E8E8E8FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE2E2E2FF
      E6E6E6FFEAEAEAFFE8E8E8FFD9D9D9FFD3D3D3FFD7D7D7FFDDDDDDFFE3E3E3FF
      E9E9E9FFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEBFFEBEBEBFFECECECFFECECECFF
      EEEEEEFFF0F0F0FFF2F2F2FFF5F5F5FFFAFAFAFFF6EBDEFFE5B053FFE6A935FF
      EBAC36FFF1B137FFF7B539FFFEBB3BFFFFC13DFFFFC83FFFFFD041FFFFD844FF
      FFE046FFFFE347FFFFDB45FFFFD242FFFFCA40FFFFC33DFFFEBC3BFFF9B739FF
      F3B338FFEFBD68FFEFE8E0FFEBEBEBFFE3E3E3FFDFDFDFFFDCDCDCFFD9D9D9FF
      D7D7D7FFD6D6D6FFD6D6D6FFDBDBDBFFE2E2E2FFE8E8E8FFEBEBEBFFEBEBEBFF
      EAEAEAFFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE6E6E6FFD7D7D7FF
      E4E4E4FFE9E9E9FFE9E9E9FFE4E4E4FFD4D4D4FFD1D1D1FFD2D2D2FFD2D2D2FF
      D8D8D8FFE1E1E1FFE7E7E7FFEAEAEAFFECECECFFECECECFFECECECFFEDEDEDFF
      EEEEEEFFF0F0F0FFF2F2F2FFF4F4F4FFF8F8F8FFFDFDFDFFFBF6F2FFEDBD73FF
      ECAD36FFF1B137FFF7B539FFFEBB3BFFFFC13DFFFFC83FFFFFD041FFFFD844FF
      FFE046FFFFE347FFFFDB45FFFFD242FFFFCA40FFFFC33DFFFEBD3BFFFAB83AFF
      F7D19CFFF5F5F5FFEDEDEDFFE6E6E6FFE2E2E2FFDFDFDFFFDDDDDDFFDBDBDBFF
      DEDEDEFFE4E4E4FFE8E8E8FFEBEBEBFFEBEBEBFFEBEBEBFFEAEAEAFFEAEAEAFF
      EAEAEAFFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE8E8E8FFDADADAFFD2D2D2FF
      E4E4E4FFE9E9E9FFE9E9E9FFE9E9E9FFE0E0E0FFD2D2D2FFD2D2D2FFD1D1D1FF
      D1D1D1FFD1D1D1FFD4D4D4FFDADADAFFE1E1E1FFE9E9E9FFECECECFFEDEDEDFF
      EFEFEFFFF1F1F1FFF2F2F2FFF5F5F5FFF7F7F7FFFBFBFBFFFEFEFEFFFEFEFEFF
      F6D7ACFFF2B23DFFF8B639FFFEBB3BFFFFC13DFFFFC83FFFFFD041FFFFD944FF
      FFE046FFFFE448FFFFDC45FFFFD342FFFFCB40FFFFC43EFFFFC247FFFEE5C1FF
      FCFCFCFFF2F2F2FFEBEBEBFFE7E7E7FFE4E4E4FFE5E5E5FFEAEAEAFFEFEFEFFF
      F0F0F0FFF0F0F0FFEEEEEEFFECECECFFEBEBEBFFEBEBEBFFEAEAEAFFEAEAEAFF
      E9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFDFDFDFFFD2D2D2FFD2D2D2FF
      E4E4E4FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFD8D8D8FFD1D1D1FFD1D1D1FF
      D1D1D1FFD1D1D1FFD2D2D2FFD2D2D2FFD3D3D3FFD5D5D5FFDDDDDDFFE4E4E4FF
      ECECECFFF1F1F1FFF3F3F3FFF5F5F5FFF8F8F8FFFBFBFBFFFEFEFEFFFFFFFFFF
      FFFFFFFFFCE8D4FFFBBC4EFFFEBC3BFFFFC23DFFFFC93FFFFFD142FFFFD944FF
      FFE147FFFFE548FFFFDD45FFFFD443FFFFCC40FFFFD26FFFFFF7EEFFFFFFFFFF
      FAFAFAFFF4F4F4FFF4F4F4FFF3F3F3FFF6F6F6FFF8F8F8FFF6F6F6FFF4F4F4FF
      F2F2F2FFF0F0F0FFEEEEEEFFECECECFFEBEBEBFFEBEBEBFFEAEAEAFFEAEAEAFF
      EAEAEAFFE9E9E9FFE9E9E9FFE9E9E9FFE4E4E4FFD4D4D4FFD1D1D1FFD1D1D1FF
      E4E4E4FFE9E9E9FFE9E9E9FFE9E9E9FFEAEAEAFFE5E5E5FFD4D4D4FFD1D1D1FF
      D1D1D1FFD1D1D1FFD2D2D2FFD2D2D2FFD3D3D3FFD3D3D3FFD4D4D4FFD6D6D6FF
      D8D8D8FFDFDFDFFFEBEBEBFFF4F4F4FFF8F8F8FFFDFDFDFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF4E9FFFFCD75FFFFC43EFFFFCA3FFFFFD142FFFFDA45FF
      FFE247FFFFE648FFFFDE46FFFFD744FFFFDF8BFFFFFBFBFFFFFFFFFFFFFFFFFF
      FDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFAFAFAFFF6F6F6FFF4F4F4FF
      F2F2F2FFF0F0F0FFEEEEEEFFECECECFFECECECFFEBEBEBFFEAEAEAFFEAEAEAFF
      EAEAEAFFEAEAEAFFEAEAEAFFE7E7E7FFD6D6D6FFD1D1D1FFD1D1D1FFD1D1D1FF
      E4E4E4FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE0E0E0FFD2D2D2FF
      D2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD3D3D3FFD3D3D3FFD4D4D4FFD5D5D5FF
      D6D6D6FFD8D8D8FFDBDBDBFFE1E1E1FFE8E8E8FFF2F2F2FFFDFDFDFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0A1FFFFCC41FFFFD342FFFFDC45FF
      FFE448FFFFE849FFFFE355FFFFEFC2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFBFBFBFFF7F7F7FFF4F4F4FF
      F2F2F2FFF0F0F0FFEEEEEEFFEDEDEDFFECECECFFEBEBEBFFEAEAEAFFEAEAEAFF
      EAEAEAFFEAEAEAFFE9E9E9FFDCDCDCFFD2D2D2FFD1D1D1FFD1D1D1FFD1D1D1FF
      E4E4E4FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFEAEAEAFFE9E9E9FFD9D9D9FF
      D2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD3D3D3FFD3D3D3FFD4D4D4FFD5D5D5FF
      D7D7D7FFD9D9D9FFDBDBDBFFDEDEDEFFE1E1E1FFE5E5E5FFECECECFFF7F7F7FF
      FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEC5FFFFDA51FFFFDE46FF
      FFE548FFFFEF7DFFFFFBE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF9F9F9FFF6F6F6FF
      F3F3F3FFF1F1F1FFEFEFEFFFEEEEEEFFEDEDEDFFECECECFFEBEBEBFFEBEBEBFF
      EAEAEAFFEAEAEAFFE3E3E3FFD3D3D3FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FF
      E4E4E4FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFEAEAEAFFE7E7E7FF
      D8D8D8FFD2D2D2FFD2D2D2FFD2D2D2FFD3D3D3FFD4D4D4FFD5D5D5FFD6D6D6FF
      D7D7D7FFDADADAFFDCDCDCFFDFDFDFFFE2E2E2FFE5E5E5FFE9E9E9FFEEEEEEFF
      F6F6F6FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEBFFFFE972FF
      FFE949FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFBFBFBFFF8F8F8FF
      F5F5F5FFF3F3F3FFF1F1F1FFEFEFEFFFEEEEEEFFEDEDEDFFEDEDEDFFEDEDEDFF
      ECECECFFE6E6E6FFD7D7D7FFD2D2D2FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FF
      E4E4E4FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFEAEAEAFFEBEBEBFF
      E4E4E4FFD5D5D5FFD2D2D2FFD3D3D3FFD3D3D3FFD4D4D4FFD5D5D5FFD7D7D7FF
      D8D8D8FFDBDADAFFDDDDDDFFE0DFDFFFE3E3E3FFE7E7E7FFECEBEBFFF1F0F0FF
      F7F6F6FFFDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEFFF
      FFEE4BFFFFF679FFFFF077FFFFE571FFFFDD6DFFFFD368FFFFCB64FFFFC461FF
      FDBF5EFFF7B95BFFF1B559FFECB157FFE7AD56FFE3AA54FFE0A853FFDDA552FF
      DAA351FFD8A250FFD6A04FFFD59F4FFFD39E4EFFD29D4EFFD29D4EFFD19E4FFF
      D2AA79FFD6D4D4FFD4D4D4FFD2D2D2FFD2D2D2FFD1D1D1FFD1D1D1FFD1D1D1FF
      E4E4E4FFE9E9E9FFE9E9E9FFE9E9E9FFEAEAEAFFEAEAEAFFEBEBEBFFECECECFF
      D9B892FFD1994AFFD19A4AFFD29A4BFFD29A4BFFD39B4BFFD49C4BFFD69D4CFF
      D79E4CFFDAA04DFFDCA14EFFDFA44FFFE2A650FFE6A952FFEBAC53FFF0B055FF
      F6B557FFFCBA59FFFFC05DFFFFC761FFFFCE64FFFFD76AFFFFE06DFFFFE95DFF
      FFEF4BFFFFF34CFFFFEA4AFFFFE046FFFFD744FFFFCF41FFFFC73FFFFFC13DFF
      FEBB3BFFF8B639FFF2B238FFEDAE36FFE8AA35FFE4A734FFE0A534FFDDA233FF
      DBA033FFD99F32FFD79E32FFD59C31FFD49B31FFD39B31FFD29A31FFD19A31FF
      D19A31FFD3C0ACFFD4D4D4FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FF
      E5E5E5FFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEBFFECECECFFE8E2DBFF
      D19930FFD19930FFD19A31FFD29A31FFD39B31FFD49B31FFD59C31FFD69D32FF
      D89E32FFDAA032FFDDA233FFE0A434FFE3A634FFE7A935FFEBAD36FFF1B137FF
      F6B539FFFDBA3AFFFFBF3CFFFFC63EFFFFCD40FFFFD543FFFFDE46FFFFE749FF
      FFF04BFFFFF64DFFFFED4BFFFFE347FFFFDA44FFFFD242FFFFCA3FFFFFC33DFF
      FFBD3BFFFBB83AFFF5B438FFEFAF37FFEAAC36FFE6A935FFE2A634FFDFA433FF
      DCA233FFDAA032FFD89E32FFD69D32FFD59C31FFD49B31FFD39B31FFD29A31FF
      D19A31FFD2AF76FFD5D5D5FFD3D3D3FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FF
      E5E5E5FFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEBFFECECECFFE1CCA5FF
      D19A30FFD19A31FFD29A31FFD39B31FFD39B31FFD59C31FFD69D31FFD79E32FF
      D99F32FFDCA133FFDEA333FFE1A534FFE5A835FFE9AB36FFEEAE37FFF3B238FF
      F9B739FFFEBC3BFFFFC23DFFFFC83FFFFFD041FFFFD844FFFFE147FFFFEB4AFF
      FFF34DFFFFFB4FFFFFF14CFFFFE749FFFFDD46FFFFD543FFFFCD40FFFFC63EFF
      FFC03CFFFDBB3BFFF8B639FFF2B138FFEDAE36FFE8AA35FFE4A735FFE1A534FF
      DEA333FFDBA133FFD9A032FFD89E32FFD69D32FFD59C31FFD49B31FFD39B31FF
      D29A31FFD29E3DFFD5D3D3FFD3D3D3FFD3D3D3FFD2D2D2FFD2D2D2FFD2D2D2FF
      E5E5E5FFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEBFFECECECFFEEEEEEFFD8B472FF
      D29A31FFD29A31FFD39B31FFD39B31FFD59C31FFD69D31FFD79E32FFD99F32FF
      DBA133FFDDA233FFE0A434FFE3A734FFE7AA35FFEBAD36FFF0B037FFF6B539FF
      FCB93AFFFFBF3CFFFFC43EFFFFCB40FFFFD342FFFFDB45FFFFE448FFFFEF4BFF
      FFF84EFFFFFE50FFFFF64DFFFFEB4AFFFFE147FFFFD844FFFFD041FFFFC93FFF
      FFC33DFFFEBD3BFFFBB83AFFF5B438FFEFB037FFEBAC36FFE7A935FFE3A734FF
      E0A434FFDDA233FFDBA133FFD99F32FFD79E32FFD69D32FFD59C31FFD49B31FF
      D39B31FFD39B31FFD4C4B0FFD5D5D5FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FF
      E6E6E6FFEBEBEBFFEBEBEBFFEBEBEBFFECECECFFEDEDEDFFEAE8E8FFD29E41FF
      D29A31FFD39B31FFD49B31FFD59C31FFD69D31FFD79E32FFD99F32FFDAA032FF
      DDA233FFDFA433FFE2A634FFE6A935FFEAAC36FFEEAF37FFF3B338FFF9B739FF
      FEBC3BFFFFC13DFFFFC83FFFFFCE41FFFFD643FFFFDF46FFFFE949FFFFF34CFF
      FFFC4FFFFFFF52FFFFFB4FFFFFF04BFFFFE548FFFFDC45FFFFD443FFFFCD40FF
      FFC63EFFFFC03CFFFEBB3BFFF9B639FFF3B238FFEEAF37FFE9AB36FFE6A935FF
      E2A634FFDFA433FFDDA233FFDBA133FFD99F32FFD89E32FFD69D32FFD59C31FF
      D49C31FFD49B31FFD5B889FFD7D7D7FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FF
      E7E7E7FFECECECFFECECECFFECECECFFEDEDEDFFEEEEEEFFE3CCB7FFD39B31FF
      D39B31FFD49C31FFD59C31FFD69D31FFD79E32FFD99F32FFDAA032FFDCA233FF
      DFA333FFE2A534FFE5A835FFE8AB36FFEDAE37FFF1B138FFF7B539FFFDBA3AFF
      FFBF3CFFFFC53EFFFFCB40FFFFD242FFFFDA45FFFFE347FFFFED4BFFFFF84EFF
      FFFE51FFFFFF54FFFFFE51FFFFF54DFFFFEA4AFFFFE147FFFFD844FFFFD142FF
      FFCA3FFFFFC43DFFFFBE3CFFFCB93AFFF7B539FFF1B138FFEDAE37FFE9AB36FF
      E5A835FFE2A634FFDFA433FFDDA233FFDBA133FFD9A032FFD89E32FFD79E32FF
      D69D31FFD59C31FFD5A453FFD7D7D7FFD6D6D6FFD5D5D5FFD5D5D5FFD5D5D5FF
      E8E8E8FFEDEDEDFFEDEDEDFFEDEDEDFFEEEEEEFFF1F1F1FFDDB680FFD49C31FF
      D59C31FFD59D31FFD69D32FFD89E32FFD99F32FFDBA032FFDCA233FFDFA333FF
      E1A534FFE4A735FFE8AA35FFECAD36FFF0B037FFF5B438FFFBB83AFFFEBD3BFF
      FFC23DFFFFC83FFFFFCF41FFFFD643FFFFDF46FFFFE849FFFFF24CFFFFFC50FF
      FFFF53FFFFFF56FFFFFF53FFFFFA4FFFFFF04BFFFFE648FFFFDD45FFFFD543FF
      FFCE41FFFFC83FFFFFC23DFFFEBC3BFFFBB83AFFF5B438FFF0B037FFECAD36FF
      E8AA36FFE5A835FFE2A634FFDFA433FFDDA233FFDBA133FFDAA032FFD99F32FF
      D79E32FFD69D32FFD69D32FFD9CCC5FFDADADAFFD7D7D7FFD6D6D6FFD6D6D6FF
      E9E9E9FFEEEEEEFFEEEEEEFFEEEEEEFFEFEFEFFFF1F1F1FFD59D3EFFD59D31FF
      D69D32FFD79E32FFD89F32FFDAA032FFDBA133FFDDA233FFDFA433FFE1A534FF
      E4A735FFE7AA35FFEBAC36FFEFAF37FFF4B338FFF9B739FFFEBB3BFFFFC03CFF
      FFC63EFFFFCC40FFFFD342FFFFDB45FFFFE448FFFFED4BFFFFF84EFFFFFE52FF
      FFFF55FFFFFF58FFFFFF55FFFFFE51FFFFF64DFFFFEB4AFFFFE247FFFFDA44FF
      FFD342FFFFCC40FFFFC63EFFFFC03CFFFEBC3BFFF9B73AFFF4B338FFF0B037FF
      ECAD36FFE8AA36FFE5A835FFE2A634FFE0A434FFDEA333FFDCA233FFDBA033FF
      D9A032FFD89F32FFD89E32FFDBBC97FFDCDCDCFFD9D9D9FFD8D8D8FFD8D8D8FF
      EBEBEBFFF0F0F0FFF0F0F0FFF0F0F0FFF1F1F1FFE8D6B8FFD79E32FFD79E32FF
      D89F32FFD99F32FFDAA032FFDCA133FFDDA333FFDFA433FFE2A634FFE4A735FF
      E7AA35FFEBAC36FFEFAF37FFF3B238FFF8B639FFFDBA3BFFFFBF3CFFFFC43EFF
      FFCA40FFFFD142FFFFD844FFFFE046FFFFE949FFFFF34CFFFFFD50FFFFFF54FF
      FFFF57FFFFFF5AFFFFFF57FFFFFF53FFFFFC4FFFFFF24CFFFFE849FFFFDF46FF
      FFD844FFFFD042FFFFCA3FFFFFC43EFFFFBF3CFFFEBB3BFFF9B739FFF4B338FF
      F0B037FFECAD36FFE9AB36FFE6A935FFE3A734FFE1A534FFDFA433FFDDA233FF
      DCA133FFDBA033FFDAA032FFDAAB64FFDDDDDDFFDBDBDBFFDADADAFFDADADAFF
      EDEDEDFFF2F2F2FFF2F2F2FFF3F3F3FFF5F5F5FFE5C48CFFD99F32FFDAA032FF
      DAA032FFDCA133FFDDA233FFDEA333FFE0A534FFE2A634FFE5A835FFE8AA35FF
      EBAC36FFEFAF37FFF3B238FFF8B639FFFDBA3AFFFFBE3CFFFFC33DFFFFC93FFF
      FFCF41FFFFD643FFFFDD46FFFFE648FFFFEF4BFFFFF94EFFFFFE52FFFFFF56FF
      FFFF59FFFFFF5DFFFFFF59FFFFFF55FFFFFE52FFFFF84EFFFFEE4BFFFFE548FF
      FFDD46FFFFD643FFFFCF41FFFFC93FFFFFC43EFFFFBF3CFFFEBB3BFFF9B739FF
      F4B338FFF0B037FFEDAE37FFE9AB36FFE7A935FFE4A735FFE2A634FFE0A534FF
      DFA333FFDDA233FFDCA233FFDCA137FFDFD7D1FFDEDEDEFFDCDCDCFFDCDCDCFF
      EFEFEFFFF5F5F5FFF5F5F5FFF6F6F6FFFBFBFBFFE0B157FFDBA133FFDCA133FF
      DDA233FFDEA333FFE0A434FFE2A634FFE4A734FFE6A935FFE9AB36FFECAD36FF
      EFB037FFF3B338FFF8B639FFFDBA3AFFFFBE3CFFFFC23DFFFFC83FFFFFCD41FF
      FFD443FFFFDB45FFFFE347FFFFEC4AFFFFF64DFFFFFE51FFFFFF54FFFFFF58FF
      FFFF5CFFFFFF60FFFFFF5CFFFFFF58FFFFFF54FFFFFE50FFFFF54DFFFFEC4AFF
      FFE347FFFFDC45FFFFD543FFFFCE41FFFFC93FFFFFC33DFFFFBF3CFFFEBB3BFF
      F9B73AFFF5B438FFF1B138FFEEAF37FFEBAC36FFE8AA35FFE6A935FFE4A734FF
      E2A634FFE1A534FFDFA434FFDFA334FFE1CBA1FFE1E1E1FFDFDFDFFFDFDFDFFF
      F1F1F1FFF8F8F8FFF8F8F8FFFBFBFBFFF7EFE6FFDEA333FFDEA333FFDFA433FF
      E0A534FFE2A634FFE3A734FFE5A835FFE8AA35FFEAAC36FFEDAE37FFF0B037FF
      F4B338FFF8B639FFFDBA3AFFFFBE3CFFFFC23DFFFFC73FFFFFCD40FFFFD342FF
      FFDA44FFFFE147FFFFEA49FFFFF34CFFFFFC50FFFFFF53FFFFFF57FFFFFF5BFF
      FFFF5FFFFFFF63FFFFFF5FFFFFFF5BFFFFFF57FFFFFF53FFFFFC50FFFFF34CFF
      FFEA4AFFFFE247FFFFDB45FFFFD443FFFFCE41FFFFC93FFFFFC43EFFFFBF3CFF
      FEBC3BFFFBB83AFFF7B539FFF3B238FFEFB037FFEDAE36FFEAAC36FFE8AA35FF
      E6A935FFE4A835FFE3A734FFE2A634FFE3B96EFFE5E5E5FFE2E2E2FFE3E3E3FF
      F5F5F5FFFCFCFCFFFCFCFCFFFEFEFEFFECD3A8FFE1A534FFE2A634FFE3A634FF
      E4A735FFE6A835FFE7AA35FFEAAB36FFECAD36FFEFAF37FFF2B138FFF6B439FF
      FAB73AFFFDBB3BFFFFBE3CFFFFC33DFFFFC73FFFFFCD40FFFFD242FFFFD944FF
      FFE046FFFFE849FFFFF14CFFFFFA4FFFFFFE52FFFFFF56FFFFFF5AFFFFFF5EFF
      FFFF62FFFFFF66FFFFFF62FFFFFF5EFFFFFF5AFFFFFF56FFFFFF52FFFFFB4FFF
      FFF24CFFFFE949FFFFE147FFFFDA45FFFFD443FFFFCE41FFFFC93FFFFFC43EFF
      FFC03CFFFEBC3BFFFCB93AFFF9B639FFF5B438FFF2B138FFEFAF37FFEDAE36FF
      EBAC36FFE9AB36FFE7AA35FFE6A935FFE6AC3FFFE9E6E6FFE7E7E7FFE7E7E7FF
      F9F9F9FFFEFEFEFFFEFEFEFFFFFFFFFFE7B66AFFE5A835FFE6A835FFE7A935FF
      E8AA36FFEAAC36FFECAD36FFEEAF37FFF1B138FFF4B338FFF8B639FFFBB83AFF
      FEBC3BFFFFBF3CFFFFC33DFFFFC83FFFFFCD40FFFFD242FFFFD944FFFFE046FF
      FFE749FFFFEF4BFFFFF84EFFFFFE51FFFFFF55FFFFFF59FFFFFF5DFFFFFF61FF
      FFFF65FFFFFF6AFFFFFF66FFFFFF61FFFFFF5DFFFFFF59FFFFFF55FFFFFE52FF
      FFFA4FFFFFF14CFFFFE949FFFFE147FFFFDB45FFFFD543FFFFCF41FFFFCA3FFF
      FFC63EFFFFC23DFFFFBE3CFFFEBB3BFFFBB83AFFF8B639FFF5B438FFF2B238FF
      F0B037FFEEAF37FFECAD36FFEBAC36FFEAAC36FFECD5BAFFECECECFFECECECFF
      FBFBFBFFFFFFFFFFFFFFFFFFFCF5F5FFE9AC43FFE9AB36FFEAAC36FFECAD36FF
      EDAE37FFEFB037FFF1B138FFF4B338FFF7B539FFFAB73AFFFDBA3AFFFEBD3BFF
      FFC13DFFFFC53EFFFFC93FFFFFCE41FFFFD342FFFFD944FFFFE046FFFFE749FF
      FFEF4BFFFFF74EFFFFFE51FFFFFF54FFFFFF58FFFFFF5CFFFFFF60FFFFFF65FF
      FFFF69FFFFFF6EFFFFFF6AFFFFFF65FFFFFF60FFFFFF5CFFFFFF58FFFFFF55FF
      FFFE51FFFFF94FFFFFF14CFFFFE949FFFFE247FFFFDC45FFFFD643FFFFD042FF
      FFCC40FFFFC83FFFFFC43DFFFFC03CFFFEBD3BFFFDBB3BFFFBB83AFFF8B639FF
      F6B439FFF3B338FFF2B138FFF0B037FFEFAF37FFEFC386FFF3F3F3FFF2F2F2FF
      FCFCFCFFFFFFFFFFFFFFFFFFF9DCBBFFEEAF37FFEFAF37FFF0B037FFF1B138FF
      F3B238FFF5B438FFF7B639FFFAB83AFFFDBA3AFFFEBD3BFFFFBF3CFFFFC33DFF
      FFC73EFFFFCB40FFFFCF41FFFFD443FFFFDA45FFFFE047FFFFE749FFFFEF4BFF
      FFF74EFFFFFE51FFFFFF54FFFFFF57FFFFFF5BFFFFFF5FFFFFFF64FFFFFF69FF
      FFFF6DFFFFFF72FFFFFF6EFFFFFF69FFFFFF64FFFFFF60FFFFFF5CFFFFFF58FF
      FFFF55FFFFFE51FFFFFA4FFFFFF24CFFFFEA4AFFFFE347FFFFDD46FFFFD844FF
      FFD342FFFFCE41FFFFCA3FFFFFC63EFFFFC33DFFFFC03CFFFFBD3BFFFEBB3BFF
      FCB93AFFFAB73AFFF8B639FFF6B539FFF5B438FFF5B856FFFAF7F7FFFAFAFAFF
      FEFEFEFFFFFFFFFFFFFFFFFFF8C877FFF4B338FFF5B338FFF6B439FFF7B639FF
      F9B739FFFCB93AFFFDBB3BFFFEBD3BFFFFBF3CFFFFC23DFFFFC53EFFFFC93FFF
      FFCD40FFFFD142FFFFD643FFFFDC45FFFFE247FFFFE849FFFFF04BFFFFF84EFF
      FFFE51FFFFFF54FFFFFF57FFFFFF5BFFFFFF5FFFFFFF63FFFFFF68FFFFFF6DFF
      FFFF71FFFFFF77FFFFFF72FFFFFF6DFFFFFF68FFFFFF64FFFFFF60FFFFFF5CFF
      FFFF58FFFFFF55FFFFFE52FFFFFB4FFFFFF34CFFFFEC4AFFFFE548FFFFDF46FF
      FFDA44FFFFD543FFFFD142FFFFCD40FFFFC93FFFFFC63EFFFFC33DFFFFC13DFF
      FFBF3CFFFEBD3BFFFEBB3BFFFDBA3AFFFCB93AFFFBB93AFFFEE8D8FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFCB93CFFFAB83AFFFCB93AFFFDBA3AFFFEBB3BFF
      FEBC3BFFFFBE3CFFFFC03CFFFFC33DFFFFC53EFFFFC83FFFFFCC40FFFFD041FF
      FFD443FFFFD944FFFFDE46FFFFE448FFFFEA4AFFFFF14CFFFFF94EFFFFFE51FF
      FFFF54FFFFFF57FFFFFF5BFFFFFF5FFFFFFF63FFFFFF67FFFFFF6CFFFFFF71FF
      FFFF76FFFFFF7CFFFFFF77FFFFFF72FFFFFF6DFFFFFF68FFFFFF64FFFFFF60FF
      FFFF5CFFFFFF58FFFFFF55FFFFFF52FFFFFC50FFFFF54DFFFFEE4BFFFFE849FF
      FFE247FFFFDD45FFFFD844FFFFD443FFFFD041FFFFCD40FFFFCA3FFFFFC73FFF
      FFC53EFFFFC33DFFFFC13DFFFFC03CFFFFBF3CFFFFBE3CFFFFDA9CFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFEBCCFFFFBE3CFFFFBD3CFFFFBE3CFFFFBF3CFFFFC13DFF
      FFC33DFFFFC43EFFFFC73EFFFFC93FFFFFCC40FFFFCF41FFFFD342FFFFD744FF
      FFDC45FFFFE147FFFFE749FFFFED4BFFFFF34DFFFFFB4FFFFFFE52FFFFFF54FF
      FFFF57FFFFFF5BFFFFFF5FFFFFFF63FFFFFF67FFFFFF6BFFFFFF70FFFFFF76FF
      FFFF7BFFFFFF81FFFFFF7DFFFFFF77FFFFFF71FFFFFF6DFFFFFF68FFFFFF64FF
      FFFF60FFFFFF5CFFFFFF59FFFFFF56FFFFFF53FFFFFE50FFFFF84EFFFFF24CFF
      FFEB4AFFFFE648FFFFE147FFFFDC45FFFFD844FFFFD543FFFFD242FFFFCF41FF
      FFCC40FFFFCA3FFFFFC83FFFFFC63EFFFFC53EFFFFC43EFFFFD16EFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFDC90FFFFC43EFFFFC43EFFFFC53EFFFFC63EFFFFC83FFF
      FFC93FFFFFCC40FFFFCE41FFFFD142FFFFD443FFFFD744FFFFDB45FFFFE046FF
      FFE548FFFFEA4AFFFFF04CFFFFF74EFFFFFD50FFFFFF52FFFFFF55FFFFFF58FF
      FFFF5BFFFFFF5FFFFFFF63FFFFFF67FFFFFF6BFFFFFF70FFFFFF75FFFFFF7BFF
      FFFF80FFFFFF87FFFFFF82FFFFFF7CFFFFFF77FFFFFF71FFFFFF6DFFFFFF68FF
      FFFF64FFFFFF60FFFFFF5DFFFFFF5AFFFFFF57FFFFFF54FFFFFE52FFFFFC4FFF
      FFF64DFFFFF04BFFFFEA4AFFFFE548FFFFE147FFFFDD46FFFFDA44FFFFD744FF
      FFD443FFFFD242FFFFD041FFFFCE41FFFFCC40FFFFCB40FFFFCD43FFFFFCF3FF
      FFFFFFFFFFFFFFFFFFD055FFFFCB40FFFFCB40FFFFCC40FFFFCE41FFFFCF41FF
      FFD142FFFFD342FFFFD643FFFFD944FFFFDC45FFFFE046FFFFE448FFFFE949FF
      FFEE4BFFFFF44DFFFFFA4FFFFFFE51FFFFFF53FFFFFF56FFFFFF59FFFFFF5CFF
      FFFF60FFFFFF63FFFFFF67FFFFFF6BFFFFFF70FFFFFF75FFFFFF7BFFFFFF81FF
      FFFF86FFFFFF8DFFFFFF88FFFFFF82FFFFFF7CFFFFFF77FFFFFF72FFFFFF6DFF
      FFFF69FFFFFF65FFFFFF61FFFFFF5EFFFFFF5BFFFFFF58FFFFFF55FFFFFF53FF
      FFFE51FFFFFA4FFFFFF54DFFFFF04BFFFFEB4AFFFFE749FFFFE347FFFFE046FF
      FFDD45FFFFDA45FFFFD844FFFFD643FFFFD543FFFFD443FFFFD443FFFFF0B9FF
      FFFFFFFFFFF3D8FFFFD443FFFFD342FFFFD342FFFFD543FFFFD643FFFFD844FF
      FFDA44FFFFDC45FFFFDF46FFFFE247FFFFE648FFFFEA4AFFFFEE4BFFFFF44DFF
      FFF94EFFFFFD50FFFFFF52FFFFFF55FFFFFF57FFFFFF5AFFFFFF5DFFFFFF60FF
      FFFF64FFFFFF68FFFFFF6CFFFFFF71FFFFFF75FFFFFF7BFFFFFF80FFFFFF87FF
      FFFF8CFFFFFF94FFFFFF8FFFFFFF88FFFFFF82FFFFFF7DFFFFFF77FFFFFF72FF
      FFFF6EFFFFFF6AFFFFFF66FFFFFF62FFFFFF5FFFFFFF5CFFFFFF59FFFFFF57FF
      FFFF55FFFFFF53FFFFFE51FFFFFB4FFFFFF64DFFFFF14CFFFFED4BFFFFEA4AFF
      FFE749FFFFE448FFFFE247FFFFE046FFFFDE46FFFFDD45FFFFDC45FFFFEA87FF
      FFFFFFFFFFEBB1FFFFDB45FFFFDC45FFFFDC45FFFFDE46FFFFDF46FFFFE147FF
      FFE347FFFFE648FFFFE949FFFFED4AFFFFF04CFFFFF54DFFFFF94FFFFFFD50FF
      FFFE52FFFFFF54FFFFFF56FFFFFF59FFFFFF5BFFFFFF5EFFFFFF62FFFFFF65FF
      FFFF69FFFFFF6DFFFFFF71FFFFFF76FFFFFF7BFFFFFF81FFFFFF87FFFFFF8DFF
      FFFF92FFFFFF9AFFFFFF94FFFFFF8DFFFFFF87FFFFFF81FFFFFF7CFFFFFF77FF
      FFFF72FFFFFF6EFFFFFF6AFFFFFF66FFFFFF63FFFFFF60FFFFFF5DFFFFFF5AFF
      FFFF58FFFFFF56FFFFFF54FFFFFF52FFFFFE50FFFFFB4FFFFFF64DFFFFF34CFF
      FFEF4BFFFFED4AFFFFEA4AFFFFE849FFFFE648FFFFE548FFFFE448FFFFE766FF
      FFFFFFFFFFEA80FFFFE347FFFFE347FFFFE548FFFFE648FFFFE849FFFFE949FF
      FFEC4AFFFFEF4BFFFFF24CFFFFF54DFFFFF94EFFFFFD50FFFFFF52FFFFFF53FF
      FFFF55FFFFFF57FFFFFF5AFFFFFF5CFFFFFF5FFFFFFF62FFFFFF66FFFFFF69FF
      FFFF6DFFFFFF71FFFFFF76FFFFFF7BFFFFFF80FFFFFF86FFFFFF8CFFFFFF92FF
      FFFF98FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000028000000200000004000000001002000000000008010000000000000
      000000000000000000000000FFFF93FFFFFF86FFFFFF7BFFFFFF71FFFFFF69FF
      FFFF63FFFFFFCFFFFFFF63FFFFFE52FFFFF94FFFFFF14CFFFFEA4AFFFFE448FF
      FFE047FFFFDE46FFFFDC45FFFFDC45FFFFDD46FFFFE046FFFFE448FFFFE949FF
      FFF04BFFFFF84EFFFFFE52FFFFFF86FFFFFFABFFFFFF61FFFFFF68FFFFFF70FF
      FFFF7AFFFFFF85FFFFFF91FFFFFF86FFFFFF7BFFFFFF70FFFFFF67FFFFFF60FF
      FFFF59FFFFFFD2FFFFFFECFFFFF677FFFFE648FFFFDE46FFFFD844FFFFD342FF
      FFCF41FFFFCD40FFFFCC40FFFFCC40FFFFCD40FFFFCF41FFFFD242FFFFD744FF
      FFDD45FFFFE549FFFFF8A6FFFFFFFDFFFFFF9CFFFFFF58FFFFFF5FFFFFFF66FF
      FFFF6FFFFFFF79FFFFFF85FFFFFF7BFFFFFF70FFFFFF67FFFFFF5FFFFFFF58FF
      FFFD52FFFFFC9FFFFFFFFFFFFFFEFCFFFFE897FFFFCE41FFFFC83FFFFFC43EFF
      FFC13DFFFEBF3CFFFEBE3CFFFEBE3CFFFEBF3CFFFEC13CFFFFC33DFFFFC73FFF
      FFD04DFFFFF2C4FFFFFFFFFFFFFEFAFFFFF45BFFFFFD51FFFFFF57FFFFFF5EFF
      FFFF66FFFFFF6FFFFFFF7AFFFFFF71FFFFFF67FFFFFF5FFFFFFF57FFFFFC51FF
      FFF04BFFFFE664FFFFFEFEFFFFFFFFFFFFFFFFFFFFE9BEFFFEBE43FFFAB83AFF
      F7B539FFF5B438FFF4B338FFF4B338FFF5B438FFF7B539FFFAB83AFFFEC65AFF
      FFF5E0FFFFFFFFFFFFFFFFFFFFF5CEFFFFE147FFFFEE4BFFFFFB50FFFFFF56FF
      FFFF5EFFFFFF66FFFFFF70FFFFFF69FFFFFF60FFFFFF58FFFFFC51FFFFEF4BFF
      FFE046FFFFD443FFFFF4D9FFFFFFFFFFFEFEFEFFFBFBFBFFF8EBD7FFF0B752FF
      EBAD36FFEAAB36FFE9AB36FFE9AB36FFE9AB36FFEBAD36FFF5CD85FFFEFBF6FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFE194FFFFD242FFFFDE46FFFFED4BFFFFFB50FF
      FFFF57FFFFFF5FFFFFFF68FFFFFF62FFFFFF59FFFFFD52FFFFF04CFFFFE046FF
      FFD242FFFFC73FFFFFE0A0FFFFFFFFFFFFFFFFFFF4F4F4FFEBEBEBFFECE8E3FF
      E6BB72FFE1A534FFE0A434FFE0A434FFE2A73BFFF2D9ADFFFEFEFEFFFFFFFFFF
      FDFDFDFFF6F6F6FFFCFBFBFFFEC556FFFFC63EFFFFD142FFFFDE46FFFFEE4BFF
      FFFD51FFFFFF58FFFFFF61FFFFFF5CFFFFFE54FFFFF54DFFFFE347FFFFD443FF
      FFC83FFFFEBE3CFFFBC769FFFFFFFFFFFFFFFFFFF9F9F9FFE4E4E4FFE0E0E0FF
      E2E1E1FFE1C599FFDAA136FFDDA94BFFF1E3D0FFF8F8F8FFFAFAFAFFFDFDFDFF
      EFEFEFFFEBEBEBFFF3E4D3FFF7B539FFFEBD3BFFFFC63EFFFFD242FFFFE147FF
      FFF34CFFFFFE53FFFFFF5BFFFFFF57FFFFFA50FFFFE849FFFFD744FFFFCA3FFF
      FEBF3CFFF8B639FFEFB039FFFCF3ECFFFDFDFDFFFAFAFAFFE9E9E9FFDBDBDBFF
      D9D9D9FFDADADAFFE1D6C7FFF1EDE8FFF1F1F1FFF2F2F2FFF5F5F5FFEEEEEEFF
      E0E0E0FFE5E5E5FFEACB96FFEEAE37FFF7B539FFFEBE3CFFFFC83FFFFFD643FF
      FFE648FFFFF94FFFFFFF56FFFFFE53FFFFF14CFFFFDE46FFFFCE41FFFEC23DFF
      FAB83AFFF0B037FFE8AA35FFF2D6AAFFF9F9F9FFF5F5F5FFF2F2F2FFDCDCDCFF
      D6D6D6FFD5D5D5FFE2E2E2FFEEEEEEFFEDEDEDFFEFEFEFFFEEEEEEFFDADADAFF
      DBDBDBFFE1E1E1FFE2B35CFFE7A935FFEFAF37FFF9B739FFFEC03CFFFFCD40FF
      FFDC45FFFFEE4BFFFFFE52FFFFFB4FFFFFE749FFFFD543FFFFC73FFFFDBB3BFF
      F3B238FFE9AB36FFE2A634FFE4B968FFF5F5F5FFF1F1F1FFEFEFEFFFE9E9E9FF
      D5D5D5FFD3D3D3FFDDDDDDFFEBEBEBFFEBEBEBFFECECECFFDCDCDCFFD6D6D6FF
      D8D8D8FFDCD7D0FFDCA234FFE1A534FFE8AB36FFF2B138FFFCBA3AFFFFC53EFF
      FFD342FFFFE548FFFFF84EFFFFF34CFFFFDF46FFFFCF41FFFEC13DFFF8B639FF
      EDAE37FFE4A835FFDEA333FFDAA137FFEFEDEBFFEEEEEEFFECECECFFEBEBEBFF
      E0E0E0FFD2D2D2FFDCDCDCFFEAEAEAFFEAEAEAFFE1E1E1FFD4D4D4FFD4D4D4FF
      D6D6D6FFD9C09AFFD99F32FFDDA233FFE4A734FFECAD36FFF7B539FFFEC03CFF
      FFCD40FFFFDD45FFFFF04BFFFFEC4AFFFFD944FFFFC93FFFFEBC3BFFF3B238FF
      E9AB36FFE1A534FFDBA132FFD79E31FFE7D3B5FFECECECFFEBEBEBFFEAEAEAFF
      EAEAEAFFD8D8D8FFDBDBDBFFEAEAEAFFE7E7E7FFD3D3D3FFD2D2D2FFD3D3D3FF
      D5D5D5FFD5AC63FFD69D31FFDAA032FFE0A434FFE8AA35FFF2B138FFFDBB3BFF
      FFC73FFFFFD744FFFFE949FFFFE648FFFFD443FFFFC53EFFFBB93AFFEFB037FF
      E5A835FFDEA333FFD99F32FFD59E38FFDECFBAFFE9E9E9FFEBEBEBFFEAEAEAFF
      E9E9E9FFE6E6E6FFDEDEDEFFE9E9E9FFDDDDDDFFD1D1D1FFD5D5D5FFDEDEDEFF
      E6E6E6FFDCBA81FFD59C31FFD89F32FFDDA233FFE4A835FFEEAF37FFFAB83AFF
      FFC33DFFFFD242FFFFE448FFFFE347FFFFD142FFFFC23DFFF9B639FFECAD36FF
      E3A734FFDCA233FFD8A64CFFD9CEBDFFD5D5D5FFD3D3D3FFD8D8D8FFDFDFDFFF
      E6E6E6FFEAEAEAFFE9E9E9FFE9E9E9FFE0E0E0FFE4E4E4FFE8E8E8FFEAEAEAFF
      EAEAEAFFEEEEEEFFE6CFA6FFD79F36FFDCA133FFE2A634FFEBAD36FFF7B539FF
      FEC13CFFFFCF41FFFFE046FFFFE046FFFFCF41FFFFC03CFFF7B539FFEBAC36FF
      E2A634FFDDB46DFFDDD9D5FFD6D6D6FFD3D3D3FFD2D2D2FFD2D2D2FFD2D2D2FF
      D4D4D4FFE3E3E3FFEBEBEBFFEAEAEAFFEAEAEAFFE9E9E9FFE9E9E9FFE9E9E9FF
      EAEAEAFFEBEBEBFFEFEFEFFFEDE1CDFFDDA846FFE1A534FFE9AB36FFF5B438FF
      FEBF3CFFFFCD40FFFFDD46FFFFDF46FFFFCE41FFFEBF3CFFF6B439FFEAAD3BFF
      E5CA9DFFDFDFDFFFD9D9D9FFD5D5D5FFD4D4D4FFD4D4D4FFDCDCDCFFE3E3E3FF
      E9E9E9FFEAEAEAFFE7E7E7FFE9E9E9FFDCDCDCFFE1E1E1FFE7E7E7FFE9E9E9FF
      EAEAEAFFEBEBEBFFEDEDEDFFF2F2F2FFF4EFE8FFE7BA69FFE9AB36FFF4B338FF
      FEBE3CFFFFCC40FFFFDC45FFFFDF46FFFFCE41FFFEC03CFFF7BC52FFF0E2CAFF
      E5E5E5FFDEDEDEFFDBDBDBFFDEDEDEFFE5E5E5FFEAEAEAFFEAEAEAFFE9E9E9FF
      E9E9E9FFE4E4E4FFDCDCDCFFE9E9E9FFE0E0E0FFD1D1D1FFD3D3D3FFDBDBDBFF
      E4E4E4FFEBEBEBFFEEEEEEFFF1F1F1FFF6F6F6FFFCFBFAFFF3D095FFF4B33AFF
      FEBE3CFFFFCC40FFFFDC45FFFFE047FFFFCF41FFFFD478FFFDF6EDFFF1F1F1FF
      EDEDEDFFEFEFEFFFF1F1F1FFEFEFEFFFECECECFFEAEAEAFFE9E9E9FFE9E9E9FF
      E8E8E8FFD6D6D6FFDBDBDBFFE9E9E9FFE9E9E9FFD9D9D9FFD1D1D1FFD1D1D1FF
      D3D3D3FFD6D6D6FFE0E0E0FFEBEBEBFFF6F6F6FFFDFDFDFFFFFFFFFFFDE6C2FF
      FEC44BFFFFCD40FFFFDE46FFFFE44BFFFFE9A4FFFFFEFEFFFEFEFEFFFEFEFEFF
      FEFEFEFFF8F8F8FFF3F3F3FFEFEFEFFFECECECFFEAEAEAFFEAEAEAFFE9E9E9FF
      DBDBDBFFD1D1D1FFDADADAFFE9E9E9FFE9E9E9FFE7E7E7FFD4D4D4FFD2D2D2FF
      D2D2D2FFD4D4D4FFD6D6D6FFDADADAFFE2E2E2FFF0F0F0FFFCFCFCFFFFFFFFFF
      FFF7E7FFFFDA66FFFFE147FFFFFAD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFCFCFCFFF5F5F5FFF1F1F1FFEEEEEEFFECECECFFEBEBEBFFE3E3E3FF
      D2D2D2FFD1D1D1FFDADADAFFE9E9E9FFE9E9E9FFE9E9E9FFE3E3E3FFD3D3D3FF
      D3D3D3FFD5D5D5FFD7D7D7FFDBDBDBFFE1E1E1FFE8E8E8FFF3F3F3FFFEFEFEFF
      FFFFFFFFFFFDFAFFFFEF7DFFFFF161FFFFDE5AFFFFCD53FFFEC04EFFF5B549FF
      EAAD46FFE2A744FFDCA342FFD7A041FFD49D40FFD29C3FFFD19F4AFFD4CFCAFF
      D2D2D2FFD1D1D1FFDBDBDBFFE9E9E9FFEAEAEAFFEBEBEBFFDFC7A2FFD1993DFF
      D29A3EFFD49C3EFFD79E3FFFDBA140FFE1A542FFE9AB44FFF3B247FFFDBD4BFF
      FFCA51FFFFDA58FFFFEC4FFFFFF44DFFFFE046FFFFCF41FFFFC23DFFF9B739FF
      EEAE37FFE5A835FFDEA333FFDAA032FFD69D31FFD49B31FFD29A31FFD3BD97FF
      D3D3D3FFD2D2D2FFDBDBDBFFEAEAEAFFEAEAEAFFECECECFFD7AD5EFFD29A31FF
      D39B31FFD69D31FFD99F32FFDEA333FFE4A734FFEDAE36FFF8B639FFFEC03CFF
      FFCD40FFFFDE46FFFFF14CFFFFFB50FFFFE849FFFFD643FFFFC83FFFFDBC3BFF
      F4B338FFEAAC36FFE3A634FFDDA233FFD99F32FFD69D31FFD49C31FFD4AC67FF
      D5D5D5FFD3D3D3FFDDDDDDFFEBEBEBFFECECECFFEAE4DEFFD39C35FFD49B31FF
      D69D31FFD99F32FFDDA233FFE2A634FFE9AB36FFF3B238FFFDBB3BFFFFC63EFF
      FFD443FFFFE648FFFFF94FFFFFFE53FFFFF24CFFFFDF46FFFFCF41FFFFC33DFF
      FBB93AFFF1B137FFE8AA36FFE2A634FFDDA233FFDAA032FFD79E32FFD59F3AFF
      D8D5D3FFD6D6D6FFDFDFDFFFEEEEEEFFEEEEEEFFE5CDA8FFD59C31FFD79E31FF
      D99F32FFDDA233FFE1A534FFE7AA35FFF0B037FFFAB73AFFFEC13DFFFFCE41FF
      FFDD45FFFFF04BFFFFFE52FFFFFF57FFFFFB50FFFFEA4AFFFFD944FFFFCB40FF
      FEC03CFFF9B739FFF0B037FFE8AA36FFE3A634FFDEA333FFDBA132FFD99F32FF
      DCC8ADFFD9D9D9FFE2E2E2FFF1F1F1FFF2F2F2FFDFB66AFFD99F32FFDBA132FF
      DEA333FFE2A634FFE8AA35FFEFAF37FFF8B639FFFEBF3CFFFFC93FFFFFD744FF
      FFE749FFFFFA4FFFFFFF56FFFFFF5DFFFFFE55FFFFF64EFFFFE448FFFFD543FF
      FFC93FFFFEBF3CFFF9B739FFF1B137FFEAAC36FFE5A835FFE1A534FFDEA333FF
      DFBA77FFDEDEDEFFE7E7E7FFF7F7F7FFF9F7F4FFDEA63CFFDEA333FFE1A534FF
      E4A835FFE9AB36FFF0B037FFF8B639FFFEBE3CFFFFC73FFFFFD442FFFFE247FF
      FFF44DFFFFFE54FFFFFF5BFFFFFF63FFFFFF5AFFFFFE53FFFFF24CFFFFE247FF
      FFD443FFFFC93FFFFEC03CFFFBB93AFFF4B338FFEEAE37FFE9AB36FFE6A935FF
      E4AD45FFE6E5E5FFEEEEEEFFFDFDFDFFF4E1C4FFE3A734FFE5A835FFE9AB36FF
      EDAE37FFF3B238FFFAB83AFFFEBF3CFFFFC83FFFFFD242FFFFE046FFFFF04BFF
      FFFD52FFFFFF59FFFFFF62FFFFFF6AFFFFFF61FFFFFF59FFFFFD52FFFFF14CFF
      FFE247FFFFD543FFFFCB40FFFFC33DFFFDBC3BFFF9B739FFF4B338FFF0B037FF
      EDAE37FFEFDEC8FFF5F5F5FFFFFFFFFFF3CB8BFFECAD36FFEFB037FFF3B238FF
      F8B639FFFDBB3BFFFEC23DFFFFCA3FFFFFD443FFFFE046FFFFEF4BFFFFFC51FF
      FFFF58FFFFFF60FFFFFF69FFFFFF72FFFFFF68FFFFFF60FFFFFF58FFFFFD52FF
      FFF24CFFFFE448FFFFD944FFFFCF41FFFFC83FFFFFC23DFFFEBD3BFFFCB93AFF
      F9B739FFFAD498FFFDFDFDFFFFFFFFFFF8BB49FFF9B639FFFBB93AFFFEBC3BFF
      FEC13DFFFFC73FFFFFCE41FFFFD744FFFFE347FFFFF04CFFFFFC51FFFFFF57FF
      FFFF5FFFFFFF67FFFFFF71FFFFFF7CFFFFFF72FFFFFF68FFFFFF60FFFFFF59FF
      FFFE53FFFFF64EFFFFEA4AFFFFDF46FFFFD643FFFFCF41FFFFCA3FFFFFC63EFF
      FFC23DFFFFCB61FFFFFFFFFFFFF1D6FFFFC13DFFFFC23DFFFFC53EFFFFC93FFF
      FFCF41FFFFD543FFFFDE46FFFFE849FFFFF54DFFFFFD52FFFFFF58FFFFFF5FFF
      FFFF67FFFFFF70FFFFFF7BFFFFFF88FFFFFF7CFFFFFF72FFFFFF68FFFFFF61FF
      FFFF5AFFFFFE55FFFFFB50FFFFF24CFFFFE849FFFFE046FFFFDA44FFFFD543FF
      FFD142FFFFD042FFFFFAEAFFFFE59CFFFFCF41FFFFD142FFFFD443FFFFD944FF
      FFDF46FFFFE749FFFFF14CFFFFFA50FFFFFE54FFFFFF59FFFFFF60FFFFFF67FF
      FFFF70FFFFFF7BFFFFFF86FFFFFF94FFFFFF88FFFFFF7CFFFFFF72FFFFFF6AFF
      FFFF63FFFFFF5DFFFFFF57FFFFFE53FFFFFB50FFFFF44DFFFFED4AFFFFE749FF
      FFE347FFFFE047FFFFF3BAFFFFE56FFFFFE046FFFFE347FFFFE648FFFFEC4AFF
      FFF34CFFFFFB4FFFFFFE53FFFFFF57FFFFFF5CFFFFFF62FFFFFF69FFFFFF71FF
      FFFF7BFFFFFF86FFFFFF93FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000002800000010000000200000000100200000000000
      4004000000000000000000000000000000000000FFFF86FFFFFF71FFFFFF61FF
      FFFFBCFFFFF558FFFFE448FFFFDA44FFFFD543FFFFD543FFFFD944FFFFE347FF
      FFF564FFFFFFB3FFFFFF60FFFFFF70FFFFFF85FFFFFF71FFFFFF5FFFFFFA51FF
      FFF8C0FFFFF9E4FFFECF60FFFCBD3BFFF9B93AFFF9B93AFFFCBC3BFFFED472FF
      FFFBF0FFFFF29BFFFFF951FFFFFF5EFFFFFF70FFFFFF61FFFFFA52FFFFE047FF
      FFDC7FFFFEFEFEFFF5F1ECFFEBC277FFE5A835FFE5A836FFF4D49AFFFEFDFCFF
      FCFCFCFFFED05BFFFFDE46FFFFF951FFFFFF60FFFFFD56FFFFE648FFFEC93FFF
      F8BB46FFFEFBFAFFF0F0F0FFDEDDDDFFDDC69CFFECDABDFFF6F6F6FFEFEFEFFF
      EBE0CEFFF6B539FFFEC83FFFFFE448FFFFFD55FFFFF44EFFFFD242FFFABA3AFF
      E9AB36FFF1E0C0FFF1F1F1FFDCDCDCFFDADADAFFECECECFFE9E9E9FFD9D9D9FF
      DFC390FFE8AA35FFF9B93AFFFFD041FFFFF24DFFFFE648FFFEC53EFFF0B037FF
      E0A433FFE2C082FFECECECFFE8E8E8FFD8D8D8FFE9E9E9FFD6D6D6FFD4D4D4FF
      D7AA58FFDFA333FFEFAF37FFFEC43DFFFFE347FFFFDC45FFFCBE3CFFE9AB36FF
      DBA239FFD8C4A1FFE0E0E0FFE6E6E6FFE6E6E6FFE3E3E3FFDDDDDDFFE6E6E6FF
      E1C591FFDAA033FFE8AA35FFFBBC3BFFFFD944FFFFD743FFFABA3AFFE7B251FF
      DCD1BFFFD5D5D5FFD5D5D5FFDCDCDCFFE8E8E8FFE6E6E6FFE7E7E7FFEAEAEAFF
      EDEDEDFFECDBBBFFE6AD42FFF9B93AFFFFD543FFFFD744FFFCD17DFFEDE9E3FF
      E6E6E6FFE7E7E7FFEAEAEAFFE9E9E9FFDCDCDCFFE7E7E7FFD3D3D3FFD9D9D9FF
      E4E4E4FFF2F2F2FFFBF2E3FFFBC761FFFFD543FFFFF1B1FFFEFEFEFFFEFEFEFF
      F7F7F7FFEEEEEEFFEBEBEBFFDEDEDEFFD5D5D5FFE9E9E9FFE2E2E2FFD2D2D2FF
      D5D5D5FFDEDEDEFFF2F2F2FFFEFCF8FFFFEA89FFFFE954FFFEC748FFF1B240FF
      E0A53BFFD79E39FFD29C3BFFD3CCC1FFD6D6D6FFEAEAEAFFE3D3B6FFD29A37FF
      D69D38FFDFA43AFFF0B03FFFFEC546FFFFE54EFFFFF54EFFFFD342FFFBBB3BFF
      E9AB36FFDDA233FFD79E31FFD6BD92FFD9D9D9FFEDEDEDFFDEBA7BFFD69D31FF
      DDA233FFE9AB36FFFAB93AFFFFD142FFFFF34DFFFFFE56FFFFE749FFFECA40FF
      F8B739FFE9AB36FFE0A434FFDCB162FFE0E0E0FFF5F4F4FFDDA743FFE0A433FF
      E9AB36FFF7B639FFFEC93FFFFFE548FFFFFD55FFFFFF62FFFFFB52FFFFE247FF
      FECA40FFFBBB3BFFF1B138FFEAAD3AFFEEE9E4FFF9EAD2FFE9AB36FFF0B037FF
      FABA3AFFFEC93FFFFFE047FFFFFA51FFFFFF61FFFFFF72FFFFFF60FFFFFB52FF
      FFE749FFFFD342FFFEC63EFFFCBE3CFFFDE7BDFFFDDB97FFFCBE3CFFFEC53EFF
      FFD242FFFFE648FFFFFA52FFFFFF5FFFFFFF71FFFFFF88FFFFFF72FFFFFF62FF
      FFFE56FFFFF54EFFFFE748FFFFDC45FFFFE78BFFFFDE65FFFFDC45FFFFE648FF
      FFF44EFFFFFD56FFFFFF61FFFFFF71FFFFFF86FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000}
    Left = 536
    Top = 256
  end
end
