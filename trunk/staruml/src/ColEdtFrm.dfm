object CollectionEditorForm: TCollectionEditorForm
  Left = 381
  Top = 275
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Collection Editor'
  ClientHeight = 263
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    488
    263)
  PixelsPerInch = 96
  TextHeight = 13
  object CollectionPageControl: TPageControl
    Left = 3
    Top = 3
    Width = 489
    Height = 226
    ActivePage = DoActivitiesPage
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnChange = CollectionPageControlChange
    object AttributesPage: TTabSheet
      Hint = 'Attributes'
      Caption = 'Attributes'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object AttributesPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object AttributesListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object AttributesToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object AttributeInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 46
            Wrap = True
            OnClick = HandleInsertAction
          end
          object AttributeDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object AttributeMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object AttributeMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object OperationsPage: TTabSheet
      Caption = 'Operations'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object OperationsPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object OperationsListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object OperationsToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object OperationInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 50
            Wrap = True
            OnClick = HandleInsertAction
          end
          object OperationDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object OperationMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object OperationMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object ParametersPage: TTabSheet
      Caption = 'Parameters'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ParametersPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object ParametersListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object ParametersToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object ParameterInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 54
            Wrap = True
            OnClick = HandleInsertAction
          end
          object ParameterDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object ParameterMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object ParameterMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object TemplateParametersPage: TTabSheet
      Caption = 'TemplateParameters'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object TemplateParametersPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object TemplateParametersListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object TemplateParametersToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object TemplateParameterInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 55
            Wrap = True
            OnClick = HandleInsertAction
          end
          object TemplateParameterDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object TemplateParameterMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object TemplateParameterMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object LiteralsPage: TTabSheet
      Caption = 'Literals'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object LiteralsPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object LiteralsListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object LiteralsToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object LiteralInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 56
            Wrap = True
            OnClick = HandleInsertAction
          end
          object LiteralDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object LiteralMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object LiteralMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object ExtensionPointsPage: TTabSheet
      Caption = 'Extension Points'
      ImageIndex = 19
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ExtensionPointsPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object ExtensionPointsListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object ExtensionPointsToolBar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object ExtensionPointInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 177
            Wrap = True
            OnClick = HandleInsertAction
          end
          object ExtensionPointDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object ExtensionPointMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object ExtensionPointMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object QualifiersPage: TTabSheet
      Caption = 'Qualifiers'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object QualifiersPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object QualifiersListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object QualifiersToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object QualifierInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 46
            Wrap = True
            OnClick = HandleInsertAction
          end
          object QualifierDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object QualifierMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object QualifierMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object DeployedComponentsPage: TTabSheet
      Caption = 'Deployed Components'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DeployedComponentsPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object DeployedComponentsListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object DeployedComponentsToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object DeployedComponentInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 151
            Wrap = True
            OnClick = HandleInsertAction
          end
          object DeployedComponentDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object DeployedComponentMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object DeployedComponentMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object DeployedArtifactsPage: TTabSheet
      Caption = 'Deployed Artifacts'
      ImageIndex = 17
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DeployedArtifactsPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object DeployedArtifactsListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object DeployedArtifactsToolBar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object DeployedArtifactInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 181
            Wrap = True
            OnClick = HandleInsertAction
          end
          object DeployedArtifactDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object DeployedArtifactMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object DeployedArtifactMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object ResidentsPage: TTabSheet
      Caption = 'Residents'
      ImageIndex = 7
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ResidentsPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object ResidentsListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object ResidentsToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object ResidentInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 151
            Wrap = True
            OnClick = HandleInsertAction
          end
          object ResidentDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object ResidentMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object ResidentMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object SlotsPage: TTabSheet
      Caption = 'Slots'
      ImageIndex = 18
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object SlotsPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object SlotsListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object SlotsToolBar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object SlotInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 178
            Wrap = True
            OnClick = HandleInsertAction
          end
          object SlotDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object SlotMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object SlotMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object EntryActionsPage: TTabSheet
      Caption = 'Entry Actions'
      ImageIndex = 8
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object EntryActionsPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object EntryActionsListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object EntryActionsToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object EntryActionInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 65
            Wrap = True
            OnClick = HandleInsertAction
          end
          object EntryActionDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object EntryActionMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object EntryActionMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object DoActivitiesPage: TTabSheet
      Caption = 'Do Actions'
      ImageIndex = 9
      object DoActivitiesPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object DoActivitiesListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object DoActivitiesToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object DoActivityInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 66
            Wrap = True
            OnClick = HandleInsertAction
          end
          object DoActivityDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object DoActivityMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object DoActivityMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object ExitActionsPage: TTabSheet
      Caption = 'Exit Actions'
      ImageIndex = 10
      object ExitActionsPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object ExitActionsListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object ExitActionsToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object ExitActionInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 67
            Wrap = True
            OnClick = HandleInsertAction
          end
          object ExitActionDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object ExitActionMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object ExitActionMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object RaisedSignalsPage: TTabSheet
      Caption = 'Raised Signals'
      ImageIndex = 11
      object RaisedSignalsPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object RaisedSignalsListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object RaisedSignalsToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object RaisedSignalInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 19
            Wrap = True
            OnClick = HandleInsertAction
          end
          object RaisedSignalDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object RaisedSignalMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object RaisedSignalMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object EffectsPage: TTabSheet
      Caption = 'Effects'
      ImageIndex = 12
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object EffectsPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object EffectsListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object EffectsToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object EffectInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 64
            Wrap = True
            OnClick = HandleInsertAction
          end
          object EffectDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object EffectMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object EffectMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object TriggersPage: TTabSheet
      Caption = 'Triggers'
      ImageIndex = 13
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object TriggersPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object TriggersListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object TriggersToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object SignalEventInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert SignalEvent'
            Caption = 'Insert SignalEvent'
            ImageIndex = 68
            Wrap = True
            OnClick = HandleInsertAction
          end
          object CallEventInsert: TToolButton
            Left = 0
            Top = 22
            Hint = 'Insert CallEvent'
            Caption = 'Insert CallEvent'
            ImageIndex = 69
            Wrap = True
            OnClick = HandleInsertAction
          end
          object TimeEventInsert: TToolButton
            Left = 0
            Top = 44
            Hint = 'Insert TimeEvent'
            Caption = 'Insert'
            ImageIndex = 70
            Wrap = True
            OnClick = HandleInsertAction
          end
          object ChangeEventInsert: TToolButton
            Left = 0
            Top = 66
            Hint = 'Insert ChangeEvent'
            Caption = 'Insert ChangeEvent'
            ImageIndex = 71
            Wrap = True
            OnClick = HandleInsertAction
          end
          object TriggerDelete: TToolButton
            Left = 0
            Top = 88
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object TriggerMoveUp: TToolButton
            Left = 0
            Top = 110
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object TriggerMoveDown: TToolButton
            Left = 0
            Top = 132
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object End1QualifiersPage: TTabSheet
      Caption = 'End1 Qualifiers'
      ImageIndex = 14
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object End1QualifiersPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object End1QualifiersListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object End1QualifiersToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object End1QualifierInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 46
            Wrap = True
            OnClick = HandleInsertAction
          end
          object End1QualifierDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object End1QualifierMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object End1QualifierMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object End2QualifiersPage: TTabSheet
      Caption = 'End2 Qualifiers'
      ImageIndex = 15
      object End2QualifiersPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object End2QualifiersListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Collection Elements'
            end>
          DragMode = dmAutomatic
          FlatScrollBars = True
          HideSelection = False
          ParentShowHint = False
          PopupMenu = CollectionEditorPopupMenu
          ShowColumnHeaders = False
          ShowHint = False
          TabOrder = 0
          ViewStyle = vsReport
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnEndDrag = HandleListViewEndDrag
          OnDragOver = HandleListViewDragOver
          OnSelectItem = HandleListViewSelectItem
        end
        object End2QualifiersToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object End2QualifierInsert: TToolButton
            Left = 0
            Top = 0
            Hint = 'Insert'
            Caption = 'Insert'
            ImageIndex = 46
            Wrap = True
            OnClick = HandleInsertAction
          end
          object End2QualifierDelete: TToolButton
            Left = 0
            Top = 22
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            Wrap = True
            OnClick = HandleDeleteAction
          end
          object End2QualifierMoveUp: TToolButton
            Left = 0
            Top = 44
            Hint = 'Move Up'
            Caption = 'Move Up'
            ImageIndex = 141
            Wrap = True
            OnClick = HandleMoveUpAction
          end
          object End2QualifierMoveDown: TToolButton
            Left = 0
            Top = 66
            Hint = 'Move Down'
            Caption = 'Move Down'
            ImageIndex = 142
            OnClick = HandleMoveDownAction
          end
        end
      end
    end
    object RelationsPage: TTabSheet
      Caption = 'Relations'
      ImageIndex = 16
      object RelationsPanel: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object RelationsListView: TListView
          Left = 28
          Top = 2
          Width = 451
          Height = 194
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Columns = <
            item
              Caption = 'Name'
              Width = 180
            end
            item
              Caption = 'Role'
              Width = 100
            end
            item
              Caption = 'Other-side Element and Role'
              Width = 170
            end>
          HideSelection = False
          PopupMenu = CollectionEditorPopupMenu
          TabOrder = 0
          ViewStyle = vsReport
          OnColumnClick = RelationsListViewColumnClick
          OnCompare = RelationsListViewCompare
          OnContextPopup = HandleListViewContextPopup
          OnEdited = HandleListViewEdited
          OnEditing = HandleListViewEditing
          OnSelectItem = HandleListViewSelectItem
        end
        object RelationsToolbar: TToolBar
          Left = 2
          Top = 2
          Width = 23
          Height = 194
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          object RelationDelete: TToolButton
            Left = 0
            Top = 0
            Hint = 'Delete'
            Caption = 'Delete'
            ImageIndex = 108
            OnClick = HandleRelationDeleteAction
          end
        end
      end
    end
  end
  object CloseButton: TButton
    Left = 292
    Top = 235
    Width = 88
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    TabOrder = 1
    OnClick = CloseButtonClick
  end
  object HelpButton: TButton
    Left = 392
    Top = 235
    Width = 88
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = '&Help'
    TabOrder = 2
    OnClick = HelpButtonClick
  end
  object CollectionEditorPopupMenu: TPopupMenu
    Left = 84
    Top = 232
    object UndoMenu: TMenuItem
      Caption = '&Undo'
      ShortCut = 16474
      OnClick = HandleUndoAction
    end
    object RedoMenu: TMenuItem
      Caption = '&Redo'
      ShortCut = 16473
      OnClick = HandleRedoAction
    end
    object EditNameMenu: TMenuItem
      Caption = '&Edit'
      ShortCut = 113
      Visible = False
      OnClick = HandleEditNameAction
    end
    object Seperator: TMenuItem
      Caption = '-'
    end
    object InsertMenu: TMenuItem
      Caption = '&Insert'
      ShortCut = 16429
      OnClick = HandleInsertAction
    end
    object InsertSignalEventMenu: TMenuItem
      Caption = 'Insert &SignalEvent'
      OnClick = HandleInsertAction
    end
    object InsertCallEventMenu: TMenuItem
      Caption = 'Insert &CallEvent'
      OnClick = HandleInsertAction
    end
    object InsertTimeEventMenu: TMenuItem
      Caption = 'Insert &TimeEvent'
      OnClick = HandleInsertAction
    end
    object InsertChangeEventMenu: TMenuItem
      Caption = 'Insert C&hangeEvent'
      OnClick = HandleInsertAction
    end
    object DeleteMenu: TMenuItem
      Caption = '&Delete'
      ShortCut = 16430
      OnClick = HandleDeleteAction
    end
    object MoveUpMenu: TMenuItem
      Caption = 'Move U&p'
      ShortCut = 16422
      OnClick = HandleMoveUpAction
    end
    object MoveDownMenu: TMenuItem
      Caption = 'Move Dow&n'
      ShortCut = 16424
      OnClick = HandleMoveDownAction
    end
    object SelectRelatedMenu: TMenuItem
      Caption = 'Select Related Element'
      ShortCut = 16466
      OnClick = HandleSelectRelatedItemAction
    end
  end
end
