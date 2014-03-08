unit TreeViewEx;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, ComCtrls, CommCtrl;

type
  { TTreeViewEx }

  TTVXEnterEditEvent = procedure(Sender: TObject; Node: TTreeNode; var SelText: string) of object;
  TTVXExitEditEvent = procedure(Sender: TObject; Node: TTreeNode) of object;

  TTreeViewEx = class(TTreeView)
  private
    FOnEnterEdit: TTVXEnterEditEvent;
    FOnExitEdit: TTVXExitEditEvent;
    EditingNode: TTreeNode;
    OldEditWndHandler, NewEditWndHandler: Pointer;
    EditHandle: THandle;
    procedure NewEditWndProc(var Message: TMessage);
    procedure SetEditWndProc(Node: TTreeNode);
    procedure RestoreEditWndProc;
  protected
    function CanEdit(Node: TTreeNode): Boolean; override;
    procedure Edit(const Item: TTVItem); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property OnEnterEdit: TTVXEnterEditEvent read FOnEnterEdit write FOnEnterEdit;
    property OnExitEdit: TTVXExitEditEvent read FOnExitEdit write FOnExitEdit;
  end;

procedure Register;

implementation

constructor TTreeViewEx.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TTreeViewEx.Destroy;
begin
  inherited;
end;

procedure TTreeViewEx.NewEditWndProc(var Message: TMessage);
var
  SelText: string;
begin
  with Message do
  begin
    case Msg of
      WM_SETFOCUS: begin
        SelText := EditingNode.Text;
        if Assigned(FOnEnterEdit) then
        begin
          FOnEnterEdit(Self, EditingNode, SelText);
          SendMessage(EditHandle, EM_SETSEL, 0, Length(EditingNode.Text));
          SendMessage(EditHandle, EM_REPLACESEL, 0, Longint(PChar(SelText)));
        end;
      end;
      WM_KILLFOCUS: begin
        if Assigned(FOnExitEdit) then FOnExitEdit(Self, EditingNode);
      end;
    end;
    Result := CallWindowProc(OldEditWndHandler, EditHandle, Msg, wParam, lParam);
  end;
end;

procedure TTreeViewEx.SetEditWndProc(Node: TTreeNode);
begin
  EditingNode := Node;
  OldEditWndHandler := Pointer(GetWindowLong(EditHandle, GWL_WNDPROC));
  NewEditWndHandler:= MakeObjectInstance(NewEditWndProc);
  SetWindowLong(EditHandle, GWL_WNDPROC, Longint(NewEditWndHandler));
end;

procedure TTreeViewEx.RestoreEditWndProc;
begin
  EditingNode := nil;
  if OldEditWndHandler <> nil then
  SetWindowLong(EditHandle, GWL_WNDPROC, Longint(OldEditWndHandler));
  if NewEditWndHandler <> nil then FreeObjectInstance(NewEditWndHandler);
end;

function TTreeViewEx.CanEdit(Node: TTreeNode): Boolean;
begin
  Result := inherited CanEdit(Node);
  if Result then begin
    EditHandle := TreeView_GetEditControl(Self.Handle);
    SetEditWndProc(Node);
  end;
end;

procedure TTreeViewEx.Edit(const Item: TTVItem);
begin
  inherited;
  RestoreEditWndProc;
end;

procedure Register;
begin
  RegisterComponents('PlasticComponents', [TTreeViewEx]);
end;

end.
