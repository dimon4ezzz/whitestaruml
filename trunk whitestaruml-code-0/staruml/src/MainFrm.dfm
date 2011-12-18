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
    Top = 76
    Width = 924
    Height = 422
    ManagerFont = False
    ParentFont = True
    Align = alClient
    DockingType = 5
    OriginalWidth = 924
    OriginalHeight = 422
    object dxLayoutDockSite1: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 656
      Height = 422
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
          ManagerFont = False
          ParentFont = True
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
            Dockable = False
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
                  ExplicitWidth = 483
                  ExplicitHeight = 254
                end
              end
              inherited DiagramTabPopupMenu: TPopupMenu
                Left = 384
                Top = 40
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
                      Action = PaletteNavBarFrame.ObjectAction
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
                      Action = PaletteNavBarFrame.ObjectAction
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
        Height = 142
        ManagerFont = False
        ParentFont = True
        ActiveChildIndex = 1
        AllowFloating = True
        AutoHide = False
        DockingType = 4
        OriginalWidth = 695
        OriginalHeight = 142
        object OutputDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 652
          Height = 93
          ManagerFont = False
          ParentFont = True
          OnVisibleChanged = DockPanelVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Output'
          ImageIndex = 5
          DockingType = 0
          OriginalWidth = 185
          OriginalHeight = 142
          inline OutputPanel: TOutputPanel
            Left = 0
            Top = 0
            Width = 652
            Height = 93
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 652
            ExplicitHeight = 93
            inherited ClientPanel: TFlatPanel
              Width = 652
              Height = 93
              ExplicitWidth = 652
              ExplicitHeight = 93
              inherited OutputMemo: TMemo
                Width = 650
                Height = 91
                ExplicitWidth = 650
                ExplicitHeight = 91
              end
            end
          end
        end
        object MessageDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 652
          Height = 93
          ManagerFont = False
          ParentFont = True
          OnVisibleChanged = DockPanelVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Message'
          ImageIndex = 6
          DockingType = 0
          OriginalWidth = 185
          OriginalHeight = 142
          inline MessagePanel: TMessagePanel
            Left = 0
            Top = 0
            Width = 652
            Height = 93
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 652
            ExplicitHeight = 93
            inherited ClientPanel: TFlatPanel
              Width = 652
              Height = 93
              ExplicitWidth = 652
              ExplicitHeight = 93
              inherited MessageListView: TListView
                Width = 650
                Height = 91
                ExplicitWidth = 650
                ExplicitHeight = 91
              end
            end
            inherited MessageImageList: TImageList
              Bitmap = {
                494C010103000400400210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
                0000000000003600000028000000400000001000000001002000000000000010
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FF000000FF000000FF000000FF000000000000000000
                0000000000000000000000000000000000000000000000000000848400008484
                0000848400008484000084840000848400008484000084840000848400008484
                00008484000084840000000000000000000000000000000000000000FF000000
                FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
                FF000000FF000000FF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
                0000000000000000000000000000000000000000000000000000848400008484
                0000848400008484000084840000848400008484000084840000848400008484
                00008484000084840000000000000000000000000000000000000000FF000000
                FF000000FF000000FF000000FF000000FF00FFFFFF000000FF000000FF000000
                FF000000FF000000FF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FF00
                0000FF000000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF00
                0000FF0000000000000000000000000000000000000000000000848400008484
                00008484000084840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF0084840000000000000000000000000000000000000000FF000000
                FF000000FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000
                FF000000FF000000FF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FF00
                0000FF000000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF00
                0000FF0000000000000000000000000000000000000000000000848400008484
                00008484000084840000FFFFFF00848400008484000084840000848400008484
                0000FFFFFF0084840000000000000000000000000000000000000000FF000000
                FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
                FF000000FF000000FF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FF000000FF00
                0000FF000000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF00
                0000FF000000FF00000000000000000000000000000000000000848400008484
                00008484000084840000FFFFFF00848400008484000084840000848400008484
                0000FFFFFF0084840000000000000000000000000000000000000000FF000000
                FF000000FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF000000
                FF000000FF000000FF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FF000000FF00
                0000FF000000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF00
                0000FF000000FF0000000000000000000000000000000000000084840000FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00848400008484000084840000848400008484
                0000FFFFFF0084840000000000000000000000000000000000000000FF000000
                FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF000000FF000000
                FF000000FF000000FF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FF000000FF00
                0000FF000000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF00
                0000FF000000FF0000000000000000000000000000000000000084840000FFFF
                FF008484000084840000FFFFFF00848400008484000084840000848400008484
                0000FFFFFF0084840000000000000000000000000000000000000000FF000000
                FF000000FF000000FF000000FF000000FF000000FF00FFFFFF00FFFFFF000000
                FF000000FF000000FF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FF000000FF00
                0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
                0000FF000000FF0000000000000000000000000000000000000084840000FFFF
                FF008484000084840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF0084840000000000000000000000000000000000000000FF000000
                FF000000FF000000FF000000FF000000FF000000FF000000FF00FFFFFF000000
                FF000000FF000000FF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FF00
                0000FF000000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF00
                0000FF000000000000000000000000000000000000000000000084840000FFFF
                FF0084840000848400008484000084840000FFFFFF0084840000848400008484
                00008484000084840000000000000000000000000000000000000000FF000000
                FF000000FF000000FF000000FF000000FF000000FF000000FF00FFFFFF00FFFF
                FF000000FF000000FF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FF00
                0000FF000000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF00
                0000FF000000000000000000000000000000000000000000000084840000FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084840000848400008484
                00008484000084840000000000000000000000000000000000000000FF000000
                FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00FFFF
                FF000000FF000000FF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
                0000000000000000000000000000000000000000000000000000848400008484
                0000848400008484000084840000848400008484000084840000848400008484
                00008484000084840000000000000000000000000000000000000000FF000000
                FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
                FF00FFFFFF000000FF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FF000000FF000000FF000000FF000000000000000000
                0000000000000000000000000000000000000000000000000000848400008484
                0000848400008484000084840000848400008484000084840000848400008484
                00008484000084840000000000000000000000000000000000000000FF000000
                FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
                FF000000FF000000FF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
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
                2800000040000000100000000100010000000000800000000000000000000000
                000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
                FC3FC003C0030000F00FC003C0030000E007C003C0030000E007C003C0030000
                C003C003C0030000C003C003C0030000C003C003C0030000C003C003C0030000
                E007C003C0030000E007C003C0030000F00FC003C0030000FC3FC003C0030000
                FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
                000000000000}
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
      Height = 422
      ManagerFont = False
      ParentFont = True
      ActiveChildIndex = -1
      AllowFloating = True
      AutoHide = False
      DockingType = 3
      OriginalWidth = 268
      OriginalHeight = 284
      object dxTabContainerDockSite1: TdxTabContainerDockSite
        Left = 0
        Top = 0
        Width = 268
        Height = 217
        ManagerFont = False
        ParentFont = True
        ActiveChildIndex = 0
        AllowFloating = True
        AutoHide = False
        DockingType = 2
        OriginalWidth = 268
        OriginalHeight = 217
        object ModelExplorerDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 264
          Height = 168
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
          ImageIndex = 0
          DockingType = 0
          OriginalWidth = 268
          OriginalHeight = 217
          inline ModelExplorer: TModelExplorerPanel
            Left = 0
            Top = 0
            Width = 264
            Height = 168
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 264
            ExplicitHeight = 168
            inherited ClientPanel: TFlatPanel
              Width = 264
              Height = 142
              ExplicitWidth = 264
              ExplicitHeight = 142
              inherited ModelTree: TVirtualStringTree
                Width = 262
                Height = 140
                ExplicitWidth = 262
                ExplicitHeight = 140
              end
            end
            inherited ModelExplorerToolbar: TToolBar
              Width = 264
              ExplicitWidth = 264
            end
            inherited ModelExplorerImageList: TImageList
              Top = 64
              Bitmap = {
                494C010105000900440210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
                000000000000000000000000000000000000C6C6C60000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000008400000084000000C6C6C600000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000084840000FFFF0000FFFF0000FFFF0000FFFF000084000000C6C6
                C600000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008400
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084840000848400008484000084000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084848400000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084848400C6C6C6000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000008400
                0000840000008400000000000000848484008484840000000000000000000000
                0000000000000000000000000000000000000000000000000000840000008400
                0000840000000000000000000000848484008484840000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084848400C6C6C600C6C6C60000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000008400
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000840000000000
                0000000000008400000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084848400C6C6C6008484840000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084000000840000008400000084000000C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000008400
                0000840000008400000000000000848484008484840000000000000000000000
                0000000000000000000000000000000000000000000000000000840000008400
                0000840000008400000000000000848484008484840000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000084848400C6C6C600C6C6C600C6C6C60000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000008400000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000840000000000
                0000000000008400000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000084848400C6C6C600C6C6C600C6C6C60084848400C6C6C600000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000008400
                0000840000008400000000000000848484008484840000000000000000000000
                0000000000000000000000000000000000000000000000000000840000008400
                0000840000000000000000000000848484008484840000000000000000000000
                0000000000000000000000000000000000000000000000000000000000008484
                8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000084848400C6C6
                C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400C6C6
                C600000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000008400
                0000840000008400000000000000848484008484840000000000000000000000
                0000000000000000000000000000000000000000000000000000840000000000
                0000000000008400000000000000848484008484840000000000000000000000
                0000000000000000000000000000000000000000000000000000848484008484
                8400000000008484840084848400848484008484840084848400848484008484
                8400000000000000000000000000000000000000000000000000000000000000
                000000000000C6C6C60084840000FFFF0000FFFF000084000000C6C6C600C6C6
                C600C6C6C6000000000000000000000000000000000000000000000000000000
                0000840000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000840000008400
                0000840000008400000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000008484000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00008400000084000000FFFF0000FFFF0000FFFF000084000000840000008400
                0000C6C6C6000000000000000000000000000000000000000000000000000000
                0000840000000000000000000000848484008484840000000000000000000000
                0000000000000000000000000000000000000000000000000000840000000000
                0000000000008400000000000000848484008484840000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000FF
                FF00008484000084840000000000000000000000000000000000000000000000
                8400000000000000000000000000000000000000000000000000000000000000
                00000000000084840000FFFF0000FFFF0000FFFF0000FFFF000084000000C6C6
                C600000000000000000000000000000000000000000000000000000000008400
                0000840000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000008400
                0000840000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000FFFF0000FF
                FF0000FFFF0000848400008484000000000000000000000000000000FF000000
                8400000084000000000000000000000000000000000000000000000000000000
                0000000000000000000084840000FFFF0000FFFF000084000000C6C6C6000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000840000000000000000000000848484008484840000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000848484008484840000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000FF
                FF0000FFFF0000FFFF0000848400008484000000000000000000000000000000
                FF00000084000000840000000000000000000000000000000000000000000000
                00000000000000000000000000008484000084840000C6C6C600000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
                00000000FF000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400848484008484
                8400848484008484840084848400848484008484840000000000000000000000
                0000000000000000000000000000000000000000000000000000848484008484
                8400848484008484840084848400848484008484840000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000FFFF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
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
                000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
                FF7F000000000000FE3F000000000000FC1F000000000000F80F000000000000
                F00F000000000000FC1F000000000000FC1F000000000000FC1F000000000000
                FC1F000000000000FC1F000000000000FC3F000000000000FFFF000000000000
                FFFF000000000000FFFF000000000000FFFFFFFFFCFFFFFFFFFFFFFFFC3FFFFF
                E277C677FC3FFE1FEFE3DBE3FC3FFC1FE241C241F83FFC1FFBF7DBF7F01FFC1F
                E277C677E00FFC1FFFF7FFF7C007FC1FE277DA77C007F807F7F7C3F7E3EFF007
                F677DA77C1C7F80FE7F7E7F78083FC1FF677FE77C041FE3FFFF7FFF7E0E3FFFF
                807FC07FF1F7FFFFFFFFFFFFFBFFFFFF00000000000000000000000000000000
                000000000000}
            end
          end
        end
        object DiagramExplorerDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 264
          Height = 168
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
          ImageIndex = 1
          DockingType = 0
          OriginalWidth = 268
          OriginalHeight = 217
          inline DiagramExplorer: TDiagramExplorerPanel
            Left = 0
            Top = 0
            Width = 264
            Height = 168
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 264
            ExplicitHeight = 168
            inherited ClientPanel: TFlatPanel
              Width = 264
              Height = 168
              ExplicitWidth = 264
              ExplicitHeight = 168
              inherited DiagramTree: TVirtualStringTree
                Width = 262
                Height = 166
                ExplicitWidth = 262
                ExplicitHeight = 166
              end
            end
          end
        end
      end
      object dxTabContainerDockSite3: TdxTabContainerDockSite
        Left = 0
        Top = 217
        Width = 268
        Height = 205
        ManagerFont = False
        ParentFont = True
        ActiveChildIndex = 0
        AllowFloating = True
        AutoHide = False
        DockingType = 2
        OriginalWidth = 268
        OriginalHeight = 205
        object PropertiesDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 264
          Height = 156
          ManagerFont = False
          ParentFont = True
          OnVisibleChanged = DockPanelVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Properties'
          ImageIndex = 2
          DockingType = 0
          OriginalWidth = 268
          OriginalHeight = 205
          inline InspectorFrame: TInspectorFrame
            Left = 0
            Top = 0
            Width = 264
            Height = 156
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 264
            ExplicitHeight = 156
            inherited ClientPanel: TPanel
              Width = 264
              Height = 156
              ExplicitWidth = 264
              ExplicitHeight = 156
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
                Height = 135
                ExplicitWidth = 264
                ExplicitHeight = 135
                inherited ClientPanel: TFlatPanel
                  Width = 264
                  Height = 135
                  ExplicitWidth = 264
                  ExplicitHeight = 135
                  inherited Inspector: TJvInspector
                    Left = 1
                    Top = 1
                    Width = 262
                    Height = 133
                    Align = alClient
                    Divider = 130
                    ExplicitLeft = 1
                    ExplicitTop = 1
                    ExplicitWidth = 262
                    ExplicitHeight = 133
                  end
                end
                inherited RowImageList: TImageList
                  Bitmap = {
                    494C010104000900200210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    000084840000FF000000FF000000FF000000FF000000FF000000FF0000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000848400000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    00008484000084840000FF0000000000000084000000FF000000FF0000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000840000008400000084000000840000008400000084000000840000008400
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000084840000848400008484000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    00008484000084840000848400000000000084000000FF000000FF0000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000840000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000840000000000000000000000000000000000000000000000000000008400
                    0000000000000000000000000000000000000000000000000000000000000000
                    000000000000FFFF000084840000848400008484000084840000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    000084840000848400008484000084840000FF000000FF000000FF0000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000084000000840000008400000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000840000000000000000000000000000000000000000000000000000008400
                    0000000000000000000000000000000000000000000000000000000000000000
                    00000000000000000000FFFF0000848400008484000084840000848400000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    00008484000084840000848400008484000084840000FF000000FF0000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000008400000084000000840000008400000084000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000840000000000000000000000000000000000000000000000000000008400
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000FFFF00008484000084840000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    00000000000084840000000000000000000000000000FF000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000840000008400000084000000840000008400000084000000840000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000840000000000000000000000000000000000000000000000000000008400
                    0000000000000000000000000000000000000000000000000000000000000000
                    000000000000000000000000000000000000FFFF000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    00000000000084840000000000000000000000000000FF000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    000084000000FF000000FF000000FF000000FF000000FF000000FF0000008400
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    000000000000000000008484000084840000FF00000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000840000008400000084000000840000008400000084000000840000008400
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
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
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFF01FFFFFFFFFFC7FF11FFFFFF00F
                    F83FF11FFEFFF7EFF01FF01FFC7FF7EFF80FF01FF83FF7EFFC1FFBBFF01FF7EF
                    FE3FFBBFFFFFF00FFF7FFC7FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
                    000000000000}
                end
                inherited AggregationImageList: TImageList
                  Bitmap = {
                    494C010103000400200210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
                    0000000000003600000028000000400000001000000001002000000000000010
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000840000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000840000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000084000000000000008400
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000084000000840000008400
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000008400000000000000000000000000
                    0000840000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000008400000084000000840000008400
                    0000840000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000008400
                    0000840000008400000084000000840000008400000084000000840000008400
                    0000840000000000000000000000000000000000000000000000840000008400
                    0000840000008400000084000000840000000000000000000000000000000000
                    0000000000008400000000000000000000000000000000000000840000008400
                    0000840000008400000084000000840000008400000084000000840000008400
                    0000840000008400000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000008400000000000000000000000000
                    0000840000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000008400000084000000840000008400
                    0000840000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000084000000000000008400
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000084000000840000008400
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000840000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000840000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
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
                    2800000040000000100000000100010000000000800000000000000000000000
                    000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
                    FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFDFFFDF0000
                    FFFFFFAFFF8F0000FFFFFF77FF070000E007C0FBC0030000FFFFFF77FF070000
                    FFFFFFAFFF8F0000FFFFFFDFFFDF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000
                    FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
                    000000000000}
                end
                inherited VisibilityImageList: TImageList
                  Bitmap = {
                    494C010104000900200210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
                    0000000000000000840000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    000000000000C6C6C60000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000848484000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000848484000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    00000000FF000000FF0000008400000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    00000000000000FFFF00C6C6C600000000000000000000000000000000000000
                    000000000000000000000000000000000000000000000000000084848400FFFF
                    FF00C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
                    00000000000000000000000000000000000000000000000000008484840000FF
                    FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000FF000000FF00000084000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    00000000000000FFFF0000000000000000000000000000000000000000000000
                    000000000000000000000000000000000000000000000000000084848400FFFF
                    FF00C6C6C60000000000C6C6C600C6C6C6000000000000000000000000000000
                    00000000000000000000000000000000000000000000000000008484840000FF
                    FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    000084840000000000000000FF00000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    00000084840000FFFF00C6C6C600000000000000000000000000000000000000
                    000000000000000000000000000000000000000000000000000084848400FFFF
                    FF00000000000000000000000000C6C6C6000000000000000000000000000000
                    00000000000000000000000000000000000000000000000000008484840000FF
                    FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
                    000000000000000000000000000000000000000000000000000000000000FFFF
                    0000FFFF00008484000000000000000000000000000000000000000000000000
                    00000000000000000000000000000000000000000000000000000000000000FF
                    FF0000FFFF00C6C6C60000FFFF0000FFFF000000000000000000000000000000
                    000000000000000000000000000000000000000000000000000084848400FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000848484008484
                    8400848484008484840084848400848484000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000FFFF0000FFFF000084840000000000000000000000000000000000000000
                    00000000000000000000000000000000000000000000000000000000000000FF
                    FF00C6C6C60000000000C6C6C60000FFFF000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000C6C6C6008484
                    8400848484008484840084848400848484008484840000000000000000000000
                    00000000000000000000000000000000000000000000000000008484840000FF
                    FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    000000000000FFFF000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    000000FFFF00C6C6C60000FFFF00000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000008484
                    8400C6C6C6000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000848484008484
                    8400848484008484840000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000008484000000000000848400000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000848484008484840084848400000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000848484000000000084848400000000008484
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
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000848484000000000084848400000000008484
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
                    FBFFFBFFFFFFFFFFF1FFF1FFC07FC07FE0FFF0FFC07FC07FF07FF1FFC07FC07F
                    E0FFE0FFC07FC07FC1FFC07FC07FC07FE0FFC07FC07FC1FFF1FFE0FFE6FFC1FF
                    FB7FF15FF1FFFFFFFF7FFE0FFFFFFFFFFC1FFF5FFF07FECFFF7FFE0FFFFFFF37
                    FF7FFF5FFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
                    000000000000}
                end
                inherited PsedostatsImageList: TImageList
                  Bitmap = {
                    494C010107000900200210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
                    0000000000000000000000000000000000000000000084848400000000000000
                    0000000000008484840000000000000000000000000084848400000000000000
                    0000000000000000000000000000000000000000000084848400000000000000
                    0000848484000000000000000000000000008484840000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    000000000000000000000000000000FFFF0000FFFF0000000000000000000000
                    0000000000000000000000000000000000000000000084848400000000000000
                    0000000000008484840000000000000000000000000084848400000000000000
                    0000000000000000000000000000000000000000000084848400000000000000
                    0000848484000000000000000000000000008484840000000000000000008484
                    8400000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF00000000000000
                    0000000000000000000000000000000000000000000084848400000000000000
                    0000000000008484840000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000084848400000000000000
                    0000848484000000000000000000000000000000000000000000000000008484
                    8400000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000008484840000FFFF0000FFFF0000FFFF0000FFFF00000000000000
                    0000000000000000000000000000000000000000000084848400000000000000
                    0000000000008484840000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000084848400000000000000
                    0000848484000000000000000000000000000000000000000000848484000000
                    0000848484008484840000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    000000000000000000008484840000FFFF0000FFFF0000000000000000000000
                    0000000000000000000000000000000000000000000084848400000000000000
                    0000000000008484840000000000000000000000000084848400000000000000
                    0000000000000000000000000000000000000000000084848400000000000000
                    0000848484000000000000000000000000008484840000000000000000008484
                    8400000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000848484008484840000000000000000000000
                    0000000000000000000000000000000000000000000084848400000000000000
                    0000000000008484840000000000000000000000000084848400000000000000
                    0000000000000000000000000000000000000000000084848400000000000000
                    0000848484000000000000000000000000008484840000000000000000008484
                    8400000000000000000000000000000000000000000000000000000000000000
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
                    0000000000000000000000000000000000000000000000000000000000008484
                    8400000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000008484
                    8400000000000000000000000000000000000000000000000000000000000000
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
                    000000000000000000000000000000000000424D3E000000000000003E000000
                    2800000040000000200000000100010000000000000100000000000000000000
                    000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFF81FF81F0000
                    FFFFF7EFF7EF0000FFFFEFF7EFF70000FFFFDFFBDFFB0000FE7FB99DB33D0000
                    FC3FB99DB32D0000F81FB81DB0050000F81FB81DB0010000FC3FB99DB3050000
                    FE7FB99DB32D0000FFFFDFFBDFFB0000FFFFEFF7EFF70000FFFFF7EFF7EF0000
                    FFFFF81FF81F0000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFC7FFFFF
                    FFFFFFFFFC7FFFFFFEFFFFFFBC7FFFFFF83FFC3FD47FFFFFE00FF81FE47BFE7F
                    8003F00FC47DFC3F0001F00FFC40F81F8003F00FC47DF81FE00FF00FE47BFC3F
                    F83FF81FD47FFE7FFEFFFC3FBC7FFFFFFFFFFFFFFC7FFFFFFFFFFFFFFC7FFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
                    000000000000}
                end
                inherited ActionKindImageList: TImageList
                  Bitmap = {
                    494C010105000900200210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
                    FF000000FF000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    FF000000FF000000FF000000FF00000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
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
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
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
                    000000000000000000000000000000000000424D3E000000000000003E000000
                    2800000040000000200000000100010000000000000100000000000000000000
                    000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
                    DFFF000000000000C7FF000000000000C1FF000000000000C07F000000000000
                    C1FF000000000000C7FF000000000000DFFF000000000000FFEF000000000000
                    FFE7000000000000F003000000000000FFE7000000000000FFEF000000000000
                    FFFF000000000000FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    DFFFDFFFDFFFDFFFC7FFC7FFC7FFC7FFC1FFC1FFC1FFC1FFC07FC07FC07FC07F
                    C1FFC1FFC1FFC1FFC7FFC7FFC7FFC7F7DFFFDFFFDFFFDFB7FFDFFFCFFFFFFDD5
                    FFC7FFF7FBFFFCE3F003E003F3FFC040FFC7FFF7E2ABFCE3FFDFFFCFF3FFFDD5
                    FFFFFFFFFBFFFFB6FFFFFFFFFFFFFFF700000000000000000000000000000000
                    000000000000}
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
            inherited PageControlImageList: TImageList
              Bitmap = {
                494C0101030004001C0210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
                0000000000003600000028000000400000001000000001002000000000000010
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
                FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF00000000000000
                0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
                000000000000000000000000000000000000000000000000000084848400FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00000000000000000000000000000000000000000000000000000000000000
                00000000000000FFFF00FFFFFF0000FFFF008400000000FFFF008400000000FF
                FF008400000000FFFF00FFFFFF00000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
                000000000000000000000000000000000000000000000000000084848400FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF0000FFFF00FFFFFF0000FFFF0084000000840000008400
                000000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF00000000000000
                0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
                000000000000000000000000000000000000000000000000000084848400FFFF
                FF00FFFFFF008484840084848400848484008484840084848400FFFFFF00FFFF
                FF00000000000000000000000000000000000000000000000000000000000000
                00000000000000FFFF00FFFFFF0000FFFF00840000008400000000FFFF008400
                00008400000000FFFF00FFFFFF00000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
                000000000000000000000000000000000000000000000000000084848400FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
                FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF0084000000840000008400
                000000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
                000000000000000000000000000000000000000000000000000084848400FFFF
                FF00FFFFFF008484840084848400848484008484840084848400FFFFFF00FFFF
                FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
                FF000000000000FFFF00FFFFFF0000FFFF008400000000FFFF008400000000FF
                FF008400000000FFFF00FFFFFF00000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF00000000000000
                0000FFFFFF00FFFFFF00FFFFFF0000000000C6C6C60000000000FFFFFF000000
                000000000000000000000000000084000000000000000000000084848400FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF000000000000000000000000000000000000000000FFFFFF0000FFFF008400
                000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
                FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF0000000000C6C6
                C60000000000FFFFFF0000000000C6C6C60000000000C6C6C600000000000000
                000000000000000000008400000084000000000000000000000084848400FFFF
                FF00FFFFFF008484840084848400848484008484840084848400FFFFFF00FFFF
                FF000000000000000000000000000000000000000000FFFFFF0084840000FF00
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
                0000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6C600C6C6
                C600C6C6C600000000008400000084000000000000000000000084848400FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF000000000000000000000000000000000000000000FFFFFF00848400008484
                8400008400000000000000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000C6C6C60000000000C6C6C60000000000C6C6C600C6C6C600C6C6
                C600C6C6C600C6C6C6008400000084000000000000000000000084848400FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF0084840000FFFF
                FF00848484008400000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000C6C6C60000000000C6C6C600C6C6C600C6C6C600C6C6
                C600C6C6C600C6C6C6008400000084000000000000000000000084848400FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C6008484
                84000000000000000000000000000000000000000000FFFFFF0000FFFF008484
                0000848400008484000000FFFF00FFFFFF000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
                C600C6C6C600000000008400000084000000000000000000000084848400FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400848484000000
                00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
                FF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000084000000840000000000000000000000848484008484
                8400848484008484840084848400848484008484840084848400000000000000
                00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
                FF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
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
                2800000040000000100000000100010000000000800000000000000000000000
                000000000000000000000000FFFFFF00FFFFFFFFFFFF0000000FFFFFF0000000
                000FC007F0000000000FC007F0000000000FC007F0000000000FC00700000000
                000FC00700000000000FC00700000000000EC007000000000004C00700000000
                0000C007001F00000000C007003B0000F800C00F007B0000FC00C01F00600000
                FE04C03F007B0000FFFFFFFF007B000000000000000000000000000000000000
                000000000000}
            end
          end
        end
        object DocumentationDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 264
          Height = 156
          ManagerFont = False
          ParentFont = True
          OnVisibleChanged = DockPanelVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Documentation'
          ImageIndex = 3
          DockingType = 0
          OriginalWidth = 268
          OriginalHeight = 205
          inline DocumentationEditor: TDocumentationEditor
            Left = 0
            Top = 0
            Width = 264
            Height = 156
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 264
            ExplicitHeight = 156
            inherited ClientPanel: TFlatPanel
              Width = 264
              Height = 156
              ExplicitWidth = 264
              ExplicitHeight = 156
              inherited DocumentationMemo: TMemo
                Width = 262
                Height = 154
                ExplicitWidth = 262
                ExplicitHeight = 154
              end
            end
          end
        end
        object AttachmentsDockPanel: TdxDockPanel
          Left = 0
          Top = 0
          Width = 264
          Height = 156
          ManagerFont = False
          ParentFont = True
          OnVisibleChanged = DockPanelVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Attachments'
          ImageIndex = 4
          DockingType = 0
          OriginalWidth = 268
          OriginalHeight = 205
          inline AttachmentEditor: TAttachmentEditor
            Left = 0
            Top = 0
            Width = 264
            Height = 156
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 264
            ExplicitHeight = 156
            inherited ClientPanel: TFlatPanel
              Width = 264
              Height = 132
              ExplicitWidth = 264
              ExplicitHeight = 132
              inherited AttachmentListView: TListView
                Width = 262
                Height = 130
                ExplicitWidth = 262
                ExplicitHeight = 130
              end
            end
            inherited AttachmentsToolbar: TToolBar
              Width = 264
              ExplicitWidth = 264
            end
            inherited AttachmentsImageList: TImageList
              Bitmap = {
                494C010106000900680210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFF0000FFFF000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
                FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
                FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF0000FF
                FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF0000FF
                FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
                FF00840000008400000084000000FFFFFF00FFFFFF0000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
                FF00840000008400000084000000FFFFFF00FFFFFF0000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF008484
                000084000000008400008484840084840000FFFFFF0000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF00FFFFFF00840000008400000084000000FFFFFF00FFFFFF00000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF00FFFFFF00840000008400000084000000FFFFFF00FFFFFF00000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF008484
                000084000000008400000000840084840000FFFFFF0000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF008484
                000000000000008400000084000084840000FFFFFF0000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF008484000084000000008400008484840084840000FFFFFF00000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF008484000084000000008400008484840084840000FFFFFF00000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF008484
                0000000000000084000000840000008484000084840000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF008484
                0000FFFFFF000000000084000000848400008484840000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF008484000000000000008400000084000084840000FFFFFF00000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF008484000000000000008400000084000084840000FFFFFF00000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF008484
                0000FFFFFF000000000084000000008484008484000084848400000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
                FF00848400008484000084840000FFFFFF0084848400FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
                FF0084840000FFFFFF00000000008400000084840000FFFFFF00000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF0084840000FFFFFF00000000008400000084840000FFFFFF00000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
                FF00848400008484000084840000FFFFFF008484840084840000848484000000
                0000000000000000000000000000000000000000000000000000FFFFFF0000FF
                FF00FFFFFF00FFFFFF00FFFFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
                FF00FFFFFF00848400008484000084840000FFFFFF00FFFFFF00000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF00FFFFFF00848400008484000084840000FFFFFF00FFFFFF00000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF0000FF
                FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0084848400848400008484
                8400000000000000000000000000000000000000000000000000FFFFFF00FFFF
                FF00FFFFFF0000FFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
                FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
                FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000000000848484008484
                0000848484000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
                FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000008484
                8400848400008484840000000000000000000000000000000000000000000000
                0000000000000000000000000000000000008400000084000000840000008400
                0000840000008400000084000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000848484008484840000000000000000000000000000000000000000000000
                0000000000000000000000000000000000008400000084000000840000008400
                0000840000008400000084000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
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
                000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
                FC3FFE7F00000000FC3FFC3F00000000FC3FF81F00000000FC3FF00F00000000
                FC3FE00700000000FC3FFC3F00000000FC3FFC3F00000000E007FC3F00000000
                F00FFC3F00000000F81FFC3F00000000FC3FFC3F00000000FE7FFC3F00000000
                FFFFFFFF00000000FFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                803FFFFFFFFF803F803FC01FC01F803F803FC01FC01F803F803FC01FC01F803F
                803FC01FC01F803F883FC01FC01F883F8401C41FC41F843F8001C21BC21F801F
                8001C01BC01F800F8001C000C00080078001C01BC01F8023FF01C01BC01FFFF3
                FF01FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
                000000000000}
            end
            inherited BasicFileIconImageList: TImageList
              Bitmap = {
                494C010103000400680210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
                0000000000003600000028000000400000001000000001002000000000000010
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400C6C6C600C6C6
                C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
                C600C6C6C6000000000000000000000000000000000000000000000000007373
                7300525252005252520052525200525252005252520052525200525252005252
                5200525252005252520052525200000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00C6C6C6000000000000000000000000000000000000000000000000007373
                7300CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
                CE00CECECE00CECECE0052525200000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00C6C6C6000000000000000000000000000000000000000000CE3131007373
                7300FFFFFF00EFEFEF00EFEFEF00D6E7E700D6E7E700EFEFEF00D6E7E700D6E7
                E700D6E7E700CECECE0052525200000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000008080
                8000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
                FF00000000000000000084848400C6C6C600FFFFFF00C6C6C60000000000FFFF
                FF00C6C6C60000000000000000000000000000000000CE313100000000000000
                0000000000009C6300009C6300009C630000EFEFEF00D6E7E700EFEFEF00D6E7
                E700D6E7E700CECECE0052525200000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000808080000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400FFFFFF000000
                0000FFFFFF00C6C6C6000000000000000000000000000000000000000000FFFF
                FF00C6C6C60000000000000000000000000000848400CE31310063313100CE31
                3100FF633100FF633100FF633100FF6331009C630000EFEFEF00D6E7E700EFEF
                EF00D6E7E700CECECE0052525200000000000000000080808000000000008080
                8000000000008080800000000000808080000000000080808000000000008080
                8000000000008080800000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
                FF00FF000000FF00000000000000FF0000000000000000FFFF0000000000FFFF
                FF00C6C6C6000000000000000000000000005A5A5A00639C9C009C310000FF63
                3100FF633100C6C6C600C6C6C600CE313100FF6331009C630000EFEFEF00D6E7
                E700D6E7E700CECECE0052525200000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000808080000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400FFFFFF00FF00
                0000FFFFFF00C6C6C6000000000000000000000000000000000000000000FFFF
                FF00C6C6C60000000000000000000000000073737300639CCE00CE633100FF63
                3100CE630000F7FFFF00F7FFFF00F7F7F700F7FFFF00EFEFEF00D6E7E700EFEF
                EF00D6E7E700CECECE0052525200000000000000000080808000000000000000
                0000000000000000000000000000000000000000000000000000000000008080
                8000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
                FF000000FF000000FF00000000000000FF00000000000084000000000000FFFF
                FF00C6C6C60000000000000000000000000000000000737373009CCEFF00FF63
                3100CE630000CE630000CE630000CE630000CE630000CE630000EFEFEF00D6E7
                E700D6E7E700CECECE0052525200000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400FFFFFF000000
                FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
                FF00C6C6C6000000000000000000000000000000000084000000639C9C009CFF
                FF00CE630000F7FFFF00F7FFFF00CE313100FFCE0000CE630000F7F7F700EFEF
                EF00D6E7E700CECECE0052525200000000000000000080808000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00C6C6C6000000000000000000000000000000000000000000840000009C9C
                6300CECE9C00CE313100CE313100FFFF6300CE630000F7F7F700F7FFFF00EFEF
                EF00CECECE009C9C9C0052525200000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00C6C6C6000000000000000000000000000000000000000000000000008400
                0000CE630000CE630000CE630000CE630000F7FFFF00FF633100F7F7F700CECE
                CE009C9C9C007373730052525200000000000000000080808000000000008080
                8000000000008080800000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
                0000000000000000000000000000000000000000000000000000000000008484
                8400FFFFFF00F7FFFF00F7FFFF00CE630000CE630000F7FFFF00F7FFFF005252
                5200313131003131310031313100000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
                FF00848484000000000000000000000000000000000000000000000000008484
                8400FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF009C9C
                9C00FFFFFF005252520000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6008484
                8400000000000000000000000000000000000000000000000000000000008484
                8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C
                9C00525252000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000084848400848484008484
                8400848484008484840084848400848484008484840084848400848484000000
                0000000000000000000000000000000000000000000000000000000000008484
                8400848484008484840084848400848484008484840084848400848484008484
                8400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000424D3E000000000000003E000000
                2800000040000000100000000100010000000000800000000000000000000000
                000000000000000000000000FFFFFF008003FFFFFFFF00008003E001FFFF0000
                8003E001FFFF00008003C001FFEF00008003A001FFF7000080030001AAAB0000
                80030001FFF7000080030001BFEF000080038001FFFF000080038001BFFF0000
                8003C001FFFF00008003E001ABFF00008003E001FFFF00008007E003FFFF0000
                800FE007FFFF0000801FE00FFFFF000000000000000000000000000000000000
                000000000000}
            end
          end
        end
      end
    end
  end
  object BarManager: TdxBarManager
    AllowCallFromAnotherForm = True
    AutoHideEmptyBars = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
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
    Style = bmsOffice11
    UseFullReset = True
    UseSystemFont = False
    OnClickItem = BarManagerClickItem
    Left = 412
    Top = 176
    DockControlHeights = (
      0
      0
      76
      21)
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
      DockedTop = 24
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
      DockedTop = 50
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
      DockedLeft = 411
      DockedTop = 24
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
      DockedLeft = 630
      DockedTop = 50
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
          ItemName = 'HelpStarUMLOnTheWeb'
        end
        item
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
    object ViewZoomCombo: TdxBarCombo
      Caption = 'Zoom'
      Category = 5
      Hint = 'Zoom'
      Visible = ivAlways
      OnChange = ViewZoomComboChange
      Width = 100
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
    object HelpStarUMLOnTheWeb: TdxBarButton
      Caption = 'StarUML on the &Web'
      Category = 7
      Hint = 'StarUML on the Web'
      Visible = ivAlways
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
        'ToolsOptions'
        'ToolsAddInManager'
        'HelpContents'
        'HelpStarUMLOnTheWeb'
        'HelpAbout'
        'FileCreate')
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
  end
  object SaveDialog: TSaveDialogEx
    DefaultExt = 'uml'
    Filter = 'StarUML Project File(*.uml)|*.uml'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save As'
    Left = 444
    Top = 88
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'uml'
    Filter = 'StarUML Project File(*.uml)|*.uml|All Files(*.*)|*.*'
    Title = 'Open'
    Left = 444
    Top = 120
  end
  object TotalImageList: TImageList
    Left = 452
    Top = 264
    Bitmap = {
      494C0101B700B800100210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000E0020000010020000000000000E0
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
      EC00FFFFFF00D8E9EC00FFFFFF0000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      000000000000FFFFFF00D8E9EC0000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000D8E9EC00FFFFFF0000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400000000008484840000000000848484000000
      0000000000000000000000000000000000000000000000000000800000008000
      00008000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000099A8AC00FFFFFF00D8E9EC0000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00D8E9EC00FFFFFF0000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099A8AC0000000000FFFFFF00FFFFFF00FFFFFF000000000099A8
      AC00D8E9EC00FFFFFF00D8E9EC0000000000000000008080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF008080800000000000000000000000000000000000000000000000
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
      2800000040000000E00200000100010000000000001700000000000000000000
      000000000000000000000000FFFFFF00FFFFF801FFFF0000FFDFF801FFFF0000
      FF9FF801FFFF0000FF07F801FFFF0000FF9BF801F01F0000C0DBF801F01F0000
      FFFBF801F01F0000FFFBF801F01F0000C01BF803F01F0000FFFFF807FBBF0000
      FFFFF80FFBBF0000C003DFFFFC7F0000FFFF80FFFFFF0000FFFF80FFFFFF0000
      FFFFDFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF8000C007FFFFFFFF8000
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
      FFDFFFFF81FFFFFFFFDFEFEF0000FFFFFFDFDFF700008001FFDFDFF700008003
      FFDFDFF700008007FFDFDFF78000800FFFDFB55BC000800FFF8FDFF7F8008007
      FF07DFF7F8008003FE03DFF7FC008001FF07DFF7FC1FFFFFFF8FEFEFFE3FFFFF
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
    Top = 88
  end
  object SaveModelFragmentDialog: TSaveDialogEx
    DefaultExt = 'mfg'
    Filter = 'StarUML Model Fragment File(*.mfg)|*.mfg'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save Model Fragment'
    Left = 508
    Top = 88
  end
  object ImportModelFragmentDialog: TOpenDialog
    DefaultExt = 'mfg'
    Filter = 'StarUML Model Fragment File(*.mfg)|*.mfg'
    Title = 'Open Model Fragment'
    Left = 476
    Top = 120
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
    Left = 324
    Top = 204
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
    Left = 324
    Top = 276
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
    Left = 284
    Top = 148
  end
  object ExportDiagramDialog: TSaveDialogEx
    DefaultExt = 'jpg'
    Filter = 
      'JPEG Image(*.jpg)|*.jpg|JPEG Image(*.jpeg)|*.jpeg|Bitmap Image(*' +
      '.bmp)|*.bmp|Enhanced Metafile(*.emf)|*.emf|Metafile(*.wmf)|*.wmf'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Export Diagram'
    Left = 540
    Top = 88
  end
  object OpenUnitDialog: TOpenDialog
    DefaultExt = 'unt'
    Filter = 'StarUML Unit File(*.unt)|*.unt'
    Title = 'Open Unit'
    Left = 508
    Top = 120
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
    Left = 203
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
    Left = 608
    Top = 120
  end
  object ColorDialog: TColorDialog
    Color = clWindow
    Left = 600
    Top = 224
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
    Left = 356
    Top = 116
  end
  object DockingManager: TdxDockingManager
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Images = DockPanelImageList
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    Options = [doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doTabContainerHasCaption, doTabContainerCanAutoHide, doSideContainerCanClose, doSideContainerCanAutoHide, doTabContainerCanInSideContainer]
    Left = 484
    Top = 174
    PixelsPerInch = 96
  end
  object DockPanelImageList: TImageList
    Left = 544
    Top = 302
    Bitmap = {
      494C010109000E00100210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object XPManifest: TXPManifest
    Left = 404
    Top = 294
  end
  object DocumentStateImageList: TImageList
    Width = 8
    Left = 524
    Top = 240
    Bitmap = {
      494C010104000900100208001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
end
