object QuickDialogFormTdxBase: TQuickDialogFormTdxBase
  Left = 0
  Top = 0
  Caption = 'QuickDialogFormTdxBase'
  ClientHeight = 170
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object QuickDialogBarManager: TdxBarManager
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'Default'
      'PopupMenus')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.StretchGlyphs = False
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = False
    Left = 51
    Top = 61
    DockControlHeights = (
      0
      0
      0
      0)
    object VisibilityPrivate: TdxBarButton
      Caption = 'Private'
      Category = 1
      Hint = 'Private'
      Visible = ivNever
      ImageIndex = 2
    end
    object VisibilityProtected: TdxBarButton
      Caption = 'Protected'
      Category = 1
      Hint = 'Protected'
      Visible = ivNever
      ImageIndex = 1
    end
    object VisibilityPublic: TdxBarButton
      Caption = 'Public'
      Category = 1
      Hint = 'Public'
      Visible = ivNever
      ImageIndex = 0
    end
    object VisibilityPackage: TdxBarButton
      Caption = 'Package'
      Category = 1
      Hint = 'Package'
      Visible = ivNever
      ImageIndex = 3
    end
    object ActionCall: TdxBarButton
      Caption = 'Call'
      Category = 1
      Hint = 'Call Action'
      Visible = ivNever
    end
    object ActionSend: TdxBarButton
      Caption = 'Send'
      Category = 1
      Hint = 'Send Action'
      Visible = ivNever
    end
    object ActionCreate: TdxBarButton
      Caption = 'Create'
      Category = 1
      Hint = 'Create Action'
      Visible = ivNever
    end
    object ActionDestroy: TdxBarButton
      Caption = 'Destroy'
      Category = 1
      Hint = 'Destroy Action'
      Visible = ivNever
    end
    object ActionReturn: TdxBarButton
      Caption = 'Return'
      Category = 1
      Hint = 'Return Action'
      Visible = ivNever
    end
    object Association: TdxBarButton
      Caption = 'Association'
      Category = 1
      Hint = 'Association'
      Visible = ivNever
      ImageIndex = 4
    end
    object Aggregation: TdxBarButton
      Caption = 'Aggregation'
      Category = 1
      Hint = 'Aggregation'
      Visible = ivNever
      ImageIndex = 5
    end
    object Composition: TdxBarButton
      Caption = 'Composition'
      Category = 1
      Hint = 'Composition'
      Visible = ivNever
      ImageIndex = 6
    end
    object Navigable: TdxBarButton
      Caption = 'Navigable'
      Category = 1
      Hint = 'Navigable'
      Visible = ivNever
      ButtonStyle = bsChecked
    end
    object VisibilityGroup: TdxBarGroup
      Visible = ivNever
      Items = (
        'VisibilityPublic'
        'VisibilityProtected'
        'VisibilityPrivate'
        'VisibilityPackage')
    end
    object ActionGroup: TdxBarGroup
      Visible = ivNever
      Items = (
        'ActionCall'
        'ActionSend'
        'ActionCreate'
        'ActionDestroy'
        'ActionReturn')
    end
    object AssociationGroup: TdxBarGroup
      Visible = ivNever
      Items = (
        'Association'
        'Aggregation'
        'Composition'
        'Navigable')
    end
  end
  object QuickDialogPopup: TdxBarPopupMenu
    BarManager = QuickDialogBarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'VisibilityPublic'
      end
      item
        Visible = True
        ItemName = 'VisibilityProtected'
      end
      item
        Visible = True
        ItemName = 'VisibilityPrivate'
      end
      item
        Visible = True
        ItemName = 'VisibilityPackage'
      end
      item
        Visible = True
        ItemName = 'ActionCall'
      end
      item
        Visible = True
        ItemName = 'ActionSend'
      end
      item
        Visible = True
        ItemName = 'ActionCreate'
      end
      item
        Visible = True
        ItemName = 'ActionDestroy'
      end
      item
        Visible = True
        ItemName = 'ActionReturn'
      end
      item
        Visible = True
        ItemName = 'Association'
      end
      item
        Visible = True
        ItemName = 'Aggregation'
      end
      item
        Visible = True
        ItemName = 'Composition'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'Navigable'
      end>
    UseOwnFont = False
    Left = 168
    Top = 61
  end
end
