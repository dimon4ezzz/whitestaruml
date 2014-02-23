unit FlatPanel;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, ExtCtrls;

type
  { TFlatPanel }

  TFlatPanel = class(TCustomPanel)
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    property DockManager;
  published
    property Align;
    property Alignment;
    property Anchors;
    property AutoSize;
    property BiDiMode;
    property Color;
    property Constraints;
    property UseDockManager default True;
    property DockSite;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FullRepaint;
    property Font;
    property Locked;
    property ParentBiDiMode;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDockDrop;
    property OnDockOver;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetSiteInfo;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('PlasticComponents', [TFlatPanel]);
end;

constructor TFlatPanel.Create(AOwner: TComponent);
begin
  inherited;
  Ctl3D := False;
  BevelInner := bvNone;
  BevelOuter := bvNone;
  BorderStyle := bsNone;
  BorderWidth := 1;
end;

procedure TFlatPanel.Paint;
var
  Rect: TRect;
begin
  Rect := GetClientRect;
  with Canvas do
  begin
    Brush.Color := Color;
    FillRect(Rect);
    Pen.Color := clBtnShadow;
    Rectangle(Rect);
  end;
end;


end.
 