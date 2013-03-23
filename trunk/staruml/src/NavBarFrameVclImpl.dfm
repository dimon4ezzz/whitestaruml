inherited PaletteNavBarFrameVclImpl: TPaletteNavBarFrameVclImpl
  object PaletteNavBar: TCategoryButtons
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 445
    Height = 298
    Align = alClient
    ButtonFlow = cbfVertical
    ButtonOptions = [boFullSize, boGradientFill, boShowCaptions, boVerticalCategoryCaptions, boBoldCaptions, boCaptionOnlyBorder]
    Categories = <
      item
        Caption = 'Annotation'
        Color = 16053492
        Collapsed = False
        Items = <
          item
            Action = SelectAction
          end
          item
            Action = TextAction
          end
          item
            Action = NoteAction
          end
          item
            Action = NoteLinkAction
          end
          item
            Action = RectangleAction
          end
          item
            Action = EllipseAction
          end
          item
            Action = RoundedRectangleAction
          end
          item
            Action = LineAction
          end
          item
            Action = ImageAction
          end>
      end
      item
        Caption = 'Class'
        Color = 16771839
        Collapsed = False
        Items = <
          item
            Action = SelectAction
          end
          item
            Action = SubsystemAction
          end
          item
            Action = PackageAction
          end
          item
            Action = ClassAction
          end
          item
            Action = InterfaceAction
          end
          item
            Action = EnumerationAction
          end
          item
            Action = SignalAction
          end
          item
            Action = ExceptionAction
          end
          item
            Action = PortAction
          end
          item
            Action = PartAction
          end
          item
            Action = AssociationAction
          end
          item
            Action = DirectedAssociationAction
          end
          item
            Action = AggregationAction
          end
          item
            Action = CompositionAction
          end
          item
            Action = GeneralizationAction
          end
          item
            Action = DependencyAction
          end
          item
            Action = RealizationAction
          end
          item
            Action = AssociationClassAction
          end
          item
            Action = ConnectorAction
          end
          item
            Action = ObjectAction
          end
          item
            Action = LinkAction
          end>
      end
      item
        Caption = 'BuiltIn'
        Color = 16053492
        Collapsed = False
        Items = <
          item
            Action = ActionStateAction
          end
          item
            Action = ActorAction
          end
          item
            Action = AggregationAction
          end
          item
            Action = ArtifactAction
          end
          item
            Action = AssociationAction
          end
          item
            Action = AssociationClassAction
          end
          item
            Action = AssociationRoleAction
          end
          item
            Action = ChoicePointAction
          end
          item
            Action = ClassAction
          end
          item
            Action = ClassifierRoleAction
          end
          item
            Action = CombinedFragmentAction
          end
          item
            Action = ComponentAction
          end
          item
            Action = ComponentInstanceAction
          end
          item
            Action = CompositionAction
          end
          item
            Action = ConnectorAction
          end
          item
            Action = DecisionAction
          end
          item
            Action = DeepHistoryAction
          end
          item
            Action = DependencyAction
          end
          item
            Action = DirectedAssociationAction
          end
          item
            Action = EllipseAction
          end
          item
            Action = EnumerationAction
          end
          item
            Action = ExceptionAction
          end
          item
            Action = ExtendAction
          end
          item
            Action = FinalStateAction
          end
          item
            Action = FlowFinalStateAction
          end
          item
            Action = ForwardMessageAction
          end
          item
            Action = ForwardStimulusAction
          end
          item
            Action = FrameAction
          end
          item
            Action = GeneralizationAction
          end
          item
            Action = HorizontalSwimlaneAction
          end
          item
            Action = ImageAction
          end
          item
            Action = IncludeAction
          end
          item
            Action = InitialStateAction
          end
          item
            Action = InteractionOperandAction
          end
          item
            Action = InterfaceAction
          end
          item
            Action = JunctionPointAction
          end
          item
            Action = LineAction
          end
          item
            Action = LinkAction
          end
          item
            Action = MessageAction
          end
          item
            Action = NodeAction
          end
          item
            Action = NodeInstanceAction
          end
          item
            Action = NoteAction
          end
          item
            Action = NoteLinkAction
          end
          item
            Action = ObjectAction
          end
          item
            Action = ObjectFlowStateAction
          end
          item
            Action = PackageAction
          end
          item
            Action = PartAction
          end
          item
            Action = PortAction
          end
          item
            Action = RealizationAction
          end
          item
            Action = RectangleAction
          end
          item
            Action = ReverseMessageAction
          end
          item
            Action = ReverseStimulusAction
          end
          item
            Action = RoundedRectangleAction
          end
          item
            Action = SelectAction
          end
          item
            Action = SelfAssociationRoleAction
          end
          item
            Action = SelfLinkAction
          end
          item
            Action = SelfMessageAction
          end
          item
            Action = SelfStimulusAction
          end
          item
            Action = SelfTransitionAction
          end
          item
            Action = ShallowHistoryAction
          end
          item
            Action = SignalAcceptStateAction
          end
          item
            Action = SignalAction
          end
          item
            Action = SignalSendStateAction
          end
          item
            Action = StateAction
          end
          item
            Action = StimulusAction
          end
          item
            Action = SubactivityStateAction
          end
          item
            Action = SubmachineStateAction
          end
          item
            Action = SubsystemAction
          end
          item
            Action = SynchronizationAction
          end
          item
            Action = SystemBoundaryAction
          end
          item
            Action = TextAction
          end
          item
            Action = TransitionAction
          end
          item
            Action = UseCaseAction
          end
          item
            Action = VerticalSwimlaneAction
          end>
      end
      item
        Caption = 'Use Case'
        Color = 16777194
        Collapsed = False
        Items = <
          item
            Action = SelectAction
          end
          item
            Action = PackageAction
          end
          item
            Action = UseCaseAction
          end
          item
            Action = ActorAction
          end
          item
            Action = AssociationAction
          end
          item
            Action = DirectedAssociationAction
          end
          item
            Action = GeneralizationAction
          end
          item
            Action = DependencyAction
          end
          item
            Action = IncludeAction
          end
          item
            Action = ExtendAction
          end
          item
            Action = SystemBoundaryAction
          end>
      end
      item
        Caption = 'Component'
        Color = 15395839
        Collapsed = False
        Items = <
          item
            Action = SelectAction
          end
          item
            Action = PackageAction
          end
          item
            Action = InterfaceAction
          end
          item
            Action = ComponentAction
          end
          item
            Action = ComponentInstanceAction
          end
          item
            Action = ArtifactAction
          end
          item
            Action = PortAction
          end
          item
            Action = PartAction
          end
          item
            Action = AssociationAction
          end
          item
            Action = DependencyAction
          end
          item
            Action = RealizationAction
          end
          item
            Action = LinkAction
          end
          item
            Action = ConnectorAction
          end>
      end
      item
        Caption = 'Deployment'
        Color = 15395839
        Collapsed = False
        Items = <
          item
            Action = SelectAction
          end
          item
            Action = PackageAction
          end
          item
            Action = NodeAction
          end
          item
            Action = NodeInstanceAction
          end
          item
            Action = ArtifactAction
          end
          item
            Action = PortAction
          end
          item
            Action = PartAction
          end
          item
            Action = AssociationAction
          end
          item
            Action = DirectedAssociationAction
          end
          item
            Action = DependencyAction
          end
          item
            Action = LinkAction
          end
          item
            Action = ConnectorAction
          end>
      end
      item
        Caption = 'Sequence'
        Color = 16053492
        Collapsed = False
        Items = <
          item
            Action = SelectAction
          end
          item
            Action = ObjectAction
          end
          item
            Action = StimulusAction
          end
          item
            Action = SelfStimulusAction
          end
          item
            Action = CombinedFragmentAction
          end
          item
            Action = InteractionOperandAction
          end
          item
            Action = FrameAction
          end>
      end
      item
        Caption = 'Sequence (Role)'
        Color = 15395839
        Collapsed = False
        Items = <
          item
            Action = SelectAction
          end
          item
            Action = ClassifierRoleAction
          end
          item
            Action = MessageAction
          end
          item
            Action = SelfMessageAction
          end
          item
            Action = CombinedFragmentAction
          end
          item
            Action = InteractionOperandAction
          end
          item
            Action = FrameAction
          end>
      end
      item
        Caption = 'Collaboration (Role)'
        Color = 16771839
        Collapsed = False
        Items = <
          item
            Action = SelectAction
          end
          item
            Action = ClassifierRoleAction
          end
          item
            Action = AssociationRoleAction
          end
          item
            Action = SelfAssociationRoleAction
          end
          item
            Action = ForwardMessageAction
          end
          item
            Action = ReverseMessageAction
          end
          item
            Action = FrameAction
          end>
      end
      item
        Caption = 'Collaboration'
        Color = 16771839
        Collapsed = False
        Items = <
          item
            Action = SelectAction
          end
          item
            Action = ObjectAction
          end
          item
            Action = LinkAction
          end
          item
            Action = SelfLinkAction
          end
          item
            Action = ForwardStimulusAction
          end
          item
            Action = ReverseStimulusAction
          end
          item
            Action = FrameAction
          end>
      end
      item
        Caption = 'Statechart'
        Color = 16771839
        Collapsed = False
        Items = <
          item
            Action = SelectAction
          end
          item
            Action = StateAction
          end
          item
            Action = SubmachineStateAction
          end
          item
            Action = InitialStateAction
          end
          item
            Action = FinalStateAction
          end
          item
            Action = JunctionPointAction
          end
          item
            Action = ChoicePointAction
          end
          item
            Action = ShallowHistoryAction
          end
          item
            Action = DeepHistoryAction
          end
          item
            Action = SynchronizationAction
          end
          item
            Action = FlowFinalStateAction
          end
          item
            Action = TransitionAction
          end
          item
            Action = SelfTransitionAction
          end>
      end
      item
        Caption = 'Activity'
        Color = 16771839
        Collapsed = False
        Items = <
          item
            Action = SelectAction
          end
          item
            Action = ActionStateAction
          end
          item
            Action = SubactivityStateAction
          end
          item
            Action = InitialStateAction
          end
          item
            Action = FinalStateAction
          end
          item
            Action = SynchronizationAction
          end
          item
            Action = DecisionAction
          end
          item
            Action = FlowFinalStateAction
          end
          item
            Action = ObjectFlowStateAction
          end
          item
            Action = SignalAcceptStateAction
          end
          item
            Action = SignalSendStateAction
          end
          item
            Action = TransitionAction
          end
          item
            Action = SelfTransitionAction
          end
          item
            Action = VerticalSwimlaneAction
          end
          item
            Action = HorizontalSwimlaneAction
          end>
      end
      item
        Caption = 'Composite Structure'
        Color = 15466474
        Collapsed = False
        Items = <
          item
            Action = SelectAction
          end
          item
            Action = ClassAction
          end
          item
            Action = InterfaceAction
          end
          item
            Action = PortAction
          end
          item
            Action = PartAction
          end
          item
            Action = DependencyAction
          end
          item
            Action = RealizationAction
          end
          item
            Action = ConnectorAction
          end>
      end>
    RegularButtonColor = clWhite
    SelectedButtonColor = clAqua
    TabOrder = 0
    OnCategoryClicked = PaletteNavBarCategoryClicked
    OnSelectedCategoryChange = PaletteNavBarCategoryClicked
  end
  object NavBarActions: TActionList
    Left = 320
    Top = 232
    object TextAction: TAction
      Caption = 'Text'
      ImageIndex = 4
      OnExecute = HandleButtonClicked
    end
    object NoteAction: TAction
      Caption = 'Note'
      ImageIndex = 2
      OnExecute = HandleButtonClicked
    end
    object NoteLinkAction: TAction
      Caption = 'Note Link'
      ImageIndex = 3
      OnExecute = HandleButtonClicked
    end
    object SubsystemAction: TAction
      Caption = 'Subsystem'
      ImageIndex = 10
      OnExecute = HandleButtonClicked
    end
    object PackageAction: TAction
      Caption = 'Package'
      ImageIndex = 13
      OnExecute = HandleButtonClicked
    end
    object UseCaseAction: TAction
      Caption = 'Use Case'
      ImageIndex = 25
      OnExecute = HandleButtonClicked
    end
    object ActorAction: TAction
      Caption = 'Actor'
      ImageIndex = 26
      OnExecute = HandleButtonClicked
    end
    object ClassAction: TAction
      Caption = 'Class'
      ImageIndex = 16
      OnExecute = HandleButtonClicked
    end
    object InterfaceAction: TAction
      Caption = 'Interface'
      ImageIndex = 17
      OnExecute = HandleButtonClicked
    end
    object EnumerationAction: TAction
      Caption = 'Enumeration'
      ImageIndex = 18
      OnExecute = HandleButtonClicked
    end
    object SignalAction: TAction
      Caption = 'Signal'
      ImageIndex = 19
      OnExecute = HandleButtonClicked
    end
    object ExceptionAction: TAction
      Caption = 'Exception'
      ImageIndex = 20
      OnExecute = HandleButtonClicked
    end
    object ComponentAction: TAction
      Caption = 'Component'
      ImageIndex = 21
      OnExecute = HandleButtonClicked
    end
    object ComponentInstanceAction: TAction
      Caption = 'Component Instance'
      ImageIndex = 22
      OnExecute = HandleButtonClicked
    end
    object NodeAction: TAction
      Caption = 'Node'
      ImageIndex = 23
      OnExecute = HandleButtonClicked
    end
    object NodeInstanceAction: TAction
      Caption = 'Node Instance'
      ImageIndex = 24
      OnExecute = HandleButtonClicked
    end
    object AssociationAction: TAction
      Caption = 'Association'
      ImageIndex = 75
      OnExecute = HandleButtonClicked
    end
    object DirectedAssociationAction: TAction
      Caption = 'Directed Association'
      ImageIndex = 154
      OnExecute = HandleButtonClicked
    end
    object AggregationAction: TAction
      Caption = 'Aggregation'
      ImageIndex = 155
      OnExecute = HandleButtonClicked
    end
    object CompositionAction: TAction
      Caption = 'Composition'
      ImageIndex = 156
      OnExecute = HandleButtonClicked
    end
    object GeneralizationAction: TAction
      Caption = 'Generalization'
      ImageIndex = 77
      OnExecute = HandleButtonClicked
    end
    object DependencyAction: TAction
      Caption = 'Dependency'
      ImageIndex = 74
      OnExecute = HandleButtonClicked
    end
    object RealizationAction: TAction
      Caption = 'Realization'
      ImageIndex = 90
      OnExecute = HandleButtonClicked
    end
    object AssociationClassAction: TAction
      Caption = 'Association Class'
      ImageIndex = 76
      OnExecute = HandleButtonClicked
    end
    object IncludeAction: TAction
      Caption = 'Include'
      ImageIndex = 88
      OnExecute = HandleButtonClicked
    end
    object ExtendAction: TAction
      Caption = 'Extend'
      ImageIndex = 89
      OnExecute = HandleButtonClicked
    end
    object ObjectAction: TAction
      Caption = 'Object'
      ImageIndex = 73
      OnExecute = HandleButtonClicked
    end
    object ClassifierRoleAction: TAction
      Caption = 'Classifier Role'
      ImageIndex = 72
      OnExecute = HandleButtonClicked
    end
    object AssociationRoleAction: TAction
      Caption = 'Association Role'
      ImageIndex = 80
      OnExecute = HandleButtonClicked
    end
    object SelfAssociationRoleAction: TAction
      Caption = 'Self Association Role'
      ImageIndex = 81
      OnExecute = HandleButtonClicked
    end
    object LinkAction: TAction
      Caption = 'Link'
      ImageIndex = 78
      OnExecute = HandleButtonClicked
    end
    object SelfLinkAction: TAction
      Caption = 'Self Link'
      ImageIndex = 79
      OnExecute = HandleButtonClicked
    end
    object MessageAction: TAction
      Caption = 'Message'
      ImageIndex = 85
      OnExecute = HandleButtonClicked
    end
    object ForwardMessageAction: TAction
      Caption = 'Forward Message'
      ImageIndex = 85
      OnExecute = HandleButtonClicked
    end
    object ReverseMessageAction: TAction
      Caption = 'Reverse Message'
      ImageIndex = 86
      OnExecute = HandleButtonClicked
    end
    object SelfMessageAction: TAction
      Caption = 'Self Message'
      ImageIndex = 87
      OnExecute = HandleButtonClicked
    end
    object StimulusAction: TAction
      Caption = 'Stimulus'
      ImageIndex = 82
      OnExecute = HandleButtonClicked
    end
    object ForwardStimulusAction: TAction
      Caption = 'Forward Stimulus'
      ImageIndex = 82
      OnExecute = HandleButtonClicked
    end
    object ReverseStimulusAction: TAction
      Caption = 'Reverse Stimulus'
      ImageIndex = 83
      OnExecute = HandleButtonClicked
    end
    object SelfStimulusAction: TAction
      Caption = 'Self Stimulus'
      ImageIndex = 84
      OnExecute = HandleButtonClicked
    end
    object StateAction: TAction
      Caption = 'State'
      ImageIndex = 29
      OnExecute = HandleButtonClicked
    end
    object SubmachineStateAction: TAction
      Caption = 'Submachine State'
      ImageIndex = 45
      OnExecute = HandleButtonClicked
    end
    object ActionStateAction: TAction
      Caption = 'Action State'
      ImageIndex = 34
      OnExecute = HandleButtonClicked
    end
    object SubactivityStateAction: TAction
      Caption = 'Subactivity State'
      ImageIndex = 35
      OnExecute = HandleButtonClicked
    end
    object InitialStateAction: TAction
      Caption = 'Initial State'
      ImageIndex = 37
      OnExecute = HandleButtonClicked
    end
    object FinalStateAction: TAction
      Caption = 'Final State'
      ImageIndex = 43
      OnExecute = HandleButtonClicked
    end
    object JunctionPointAction: TAction
      Caption = 'Junction Point'
      ImageIndex = 39
      OnExecute = HandleButtonClicked
    end
    object ChoicePointAction: TAction
      Caption = 'Choice Point'
      ImageIndex = 40
      OnExecute = HandleButtonClicked
    end
    object ShallowHistoryAction: TAction
      Caption = 'Shallow History'
      ImageIndex = 41
      OnExecute = HandleButtonClicked
    end
    object DeepHistoryAction: TAction
      Caption = 'Deep History'
      ImageIndex = 42
      OnExecute = HandleButtonClicked
    end
    object SynchronizationAction: TAction
      Caption = 'Synchronization'
      ImageIndex = 38
      OnExecute = HandleButtonClicked
    end
    object DecisionAction: TAction
      Caption = 'Decision'
      ImageIndex = 36
      OnExecute = HandleButtonClicked
    end
    object TransitionAction: TAction
      Caption = 'Transition'
      ImageIndex = 57
      OnExecute = HandleButtonClicked
    end
    object SelfTransitionAction: TAction
      Caption = 'Self Transition'
      ImageIndex = 58
      OnExecute = HandleButtonClicked
    end
    object VerticalSwimlaneAction: TAction
      Caption = 'Vertical Swimlane'
      ImageIndex = 44
      OnExecute = HandleButtonClicked
    end
    object HorizontalSwimlaneAction: TAction
      Caption = 'Horizontal Swimlane'
      ImageIndex = 161
      OnExecute = HandleButtonClicked
    end
    object ObjectFlowStateAction: TAction
      Caption = 'Object Flow State'
      ImageIndex = 171
      OnExecute = HandleButtonClicked
    end
    object FlowFinalStateAction: TAction
      Caption = 'Flow Final State'
      ImageIndex = 166
      OnExecute = HandleButtonClicked
    end
    object SystemBoundaryAction: TAction
      Caption = 'System Boundary'
      ImageIndex = 162
      OnExecute = HandleButtonClicked
    end
    object SignalAcceptStateAction: TAction
      Caption = 'Signal Accept State'
      ImageIndex = 159
      OnExecute = HandleButtonClicked
    end
    object SignalSendStateAction: TAction
      Caption = 'Signal Send State'
      ImageIndex = 160
      OnExecute = HandleButtonClicked
    end
    object ArtifactAction: TAction
      Caption = 'Artifact'
      ImageIndex = 176
      OnExecute = HandleButtonClicked
    end
    object PortAction: TAction
      Caption = 'Port'
      ImageIndex = 173
      OnExecute = HandleButtonClicked
    end
    object PartAction: TAction
      Caption = 'Part'
      ImageIndex = 172
      OnExecute = HandleButtonClicked
    end
    object ConnectorAction: TAction
      Caption = 'Connector'
      ImageIndex = 164
      OnExecute = HandleButtonClicked
    end
    object CombinedFragmentAction: TAction
      Caption = 'Combined Fragment'
      ImageIndex = 163
      OnExecute = HandleButtonClicked
    end
    object InteractionOperandAction: TAction
      Caption = 'Interaction Operand'
      ImageIndex = 169
      OnExecute = HandleButtonClicked
    end
    object RectangleAction: TAction
      Caption = 'Rectangle'
      ImageIndex = 174
      OnExecute = HandleButtonClicked
    end
    object EllipseAction: TAction
      Caption = 'Ellipse'
      ImageIndex = 165
      OnExecute = HandleButtonClicked
    end
    object RoundedRectangleAction: TAction
      Caption = 'Rounded Rectangle'
      ImageIndex = 175
      OnExecute = HandleButtonClicked
    end
    object LineAction: TAction
      Caption = 'Line'
      ImageIndex = 170
      OnExecute = HandleButtonClicked
    end
    object ImageAction: TAction
      Caption = 'Image'
      ImageIndex = 168
      OnExecute = HandleButtonClicked
    end
    object FrameAction: TAction
      Caption = 'Frame'
      ImageIndex = 167
      OnExecute = HandleButtonClicked
    end
    object SelectAction: TAction
      Caption = 'Select'
      ImageIndex = 0
      OnExecute = HandleButtonClicked
    end
  end
end
