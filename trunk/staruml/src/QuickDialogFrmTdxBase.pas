unit QuickDialogFrmTdxBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, MenuManager, MenuManagerTdxImpl, cxClasses;

const
  QUICK_DIALOG_POPUP = 'QuickDialogPopup';

type
  TQuickDialogFormTdxBase = class(TForm)
    QuickDialogBarManager: TdxBarManager;
    VisibilityPrivate: TdxBarButton;
    VisibilityProtected: TdxBarButton;
    VisibilityPublic: TdxBarButton;
    VisibilityPackage: TdxBarButton;
    ActionCall: TdxBarButton;
    ActionSend: TdxBarButton;
    ActionCreate: TdxBarButton;
    ActionDestroy: TdxBarButton;
    ActionReturn: TdxBarButton;
    Association: TdxBarButton;
    Aggregation: TdxBarButton;
    Composition: TdxBarButton;
    Navigable: TdxBarButton;
    VisibilityGroup: TdxBarGroup;
    ActionGroup: TdxBarGroup;
    AssociationGroup: TdxBarGroup;
    QuickDialogPopup: TdxBarPopupMenu;
    procedure FormCreate(Sender: TObject);

  protected
    { Protected declarations }
    MenuManager: TMenuHandlesManager;
    QuickDialogPopupHandle: TContextMenuHandle;
    VisibilityGroupHandle: TMenuElementGroup;
    ActionGroupHandle: TMenuElementGroup;
    AssociationGroupHandle: TMenuElementGroup;

  public
    { Public declarations }
    destructor Destroy; override;
  end;


implementation

{$R *.dfm}
destructor TQuickDialogFormTdxBase.Destroy;
begin
  MenuManager.Free;
  inherited;
end;

procedure TQuickDialogFormTdxBase.FormCreate(Sender: TObject);
var
  MenuManagerImpl: TMenuHandlesManagerTdxImpl;
begin
  MenuManagerImpl := TMenuHandlesManagerTdxImpl.Create;

  QuickDialogPopupHandle := MenuManagerImpl.CreateContextMenuWrapper(QUICK_DIALOG_POPUP, QuickDialogPopup);
  VisibilityGroupHandle := MenuManagerImpl.CreateGroupWrapper(VisibilityGroup);
  ActionGroupHandle := MenuManagerImpl.CreateGroupWrapper(ActionGroup);
  AssociationGroupHandle := MenuManagerImpl.CreateGroupWrapper(AssociationGroup);

  MenuManager := MenuManagerImpl;

end;

end.
