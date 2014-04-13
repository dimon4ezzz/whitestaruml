{ PLASTIC UTILITY COMPONENT : AreaTitleBar v1.0}
{ AUTHOR: Minkyu Lee }
{ DATE : 2002-12-12 }

unit AreaTitleBar;

interface

uses
  Windows, Classes, Types, Graphics, Controls, ExtCtrls, Forms, Buttons;

const
  DEFAULT_TITLEBAR_THICK = 16;
  DEFAULT_HORZ_LEFTMARGIN = 3;
  DEFAULT_HORZ_TOPMARGIN = 1;
  DEFAULT_VERT_LEFTMARGIN = 1;
  DEFAULT_VERT_BOTTOMMARGIN = 3;

type
  { TAreaTitleBar }

  TAreaTitleCloseButton = class(TSpeedButton)
  protected
    FColor: TColor;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    property Color: TColor read FColor write FColor;
  end;

  TAreaTitleBar = class(TCustomPanel)
  private
    CloseButton: TAreaTitleCloseButton;
    FTitle: string;
    FActivated: Boolean;
    FThick: Integer;
    FHorzLeftMargin: Integer;
    FHorzTopMargin: Integer;
    FVertLeftMargin: Integer;
    FVertBottomMargin: Integer;
    FOnCloseClick: TNotifyEvent;
    procedure SetTitle(Value: string);
    procedure SetActivated(Value: Boolean);
    procedure SetThick(Value: Integer);
    procedure SetHorzLeftMargin(Value: Integer);
    procedure SetHorzTopMargin(Value: Integer);
    procedure SetVertLeftMargin(Value: Integer);
    procedure SetVertBottomMargin(Value: Integer);
    procedure LayoutSetting;
    procedure VerticalText(Canvas: TCanvas; Rect: TRect; AText: string);
    procedure CloseClick(Sender: TObject);
  protected
    procedure Paint; override;
    procedure RequestAlign; override;
    procedure Resize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Title: string read FTitle write SetTitle;
    property Activated: Boolean read FActivated write SetActivated default True;
    property Thick: Integer read FThick write SetThick default DEFAULT_TITLEBAR_THICK;
    property HorzLeftMargin: Integer read FHorzLeftMargin write SetHorzLeftMargin default DEFAULT_HORZ_LEFTMARGIN;
    property HorzTopMargin: Integer read FHorzTopMargin write SetHorzTopMargin default DEFAULT_HORZ_TOPMARGIN;
    property VertLeftMargin: Integer read FVertLeftMargin write SetVertLeftMargin default DEFAULT_VERT_LEFTMARGIN;
    property VertBottomMargin: Integer read FVertBottomMargin write SetVertBottomMargin default DEFAULT_VERT_BOTTOMMARGIN;
    property Left;
    property Top;
    property Font;
    property ParentFont;
    property Align;
    property Enabled;
    property Visible;
    property Hint;
    property ShowHint;
    property Name;
    property Tag;
    property OnCloseClick: TNotifyEvent read FOnCloseClick write FOnCloseClick;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
  end;

procedure Register;

implementation

uses
  SysUtils, System.UITypes;

const
  CLOSEBUTTON_SIZE = 13;
  CLOSEBUTTON_MARGIN = 2;

procedure Register;
begin
  RegisterComponents('PlasticComponents', [TAreaTitleBar]);
end;

{ TAreaTitleCloseButton }

constructor TAreaTitleCloseButton.Create(AOwner: TComponent);
begin
  inherited;
  Width := CLOSEBUTTON_SIZE;
  Height := CLOSEBUTTON_SIZE;
  Flat := True;
end;

procedure TAreaTitleCloseButton.Paint;
begin
  inherited;
  Canvas.Pen.Color := Color;
  Canvas.MoveTo(3, 3);
  Canvas.LineTo(10, 10);
  Canvas.MoveTo(3, 9);
  Canvas.LineTo(10, 2);

  // Canvas.Polyline([Point(3, 3), Point(9, 9)]);
  // Canvas.Polyline([Point(8, 3), Point(2, 9)]);
end;

{ TAreaTitleBar }

constructor TAreaTitleBar.Create(AOwner: TComponent);
begin
  inherited;
  BevelInner := bvNone;
  BevelOuter := bvNone;
  Caption := '';
  BorderWidth := 0;
  BorderStyle := bsNone;
  Color := clActiveCaption;
  Ctl3D := True;
  Ctl3D := False;
  CloseButton := TAreaTitleCloseButton.Create(Self);
  CloseButton.Parent := Self;
  CloseButton.Color := clWhite;
  CloseButton.OnClick := CloseClick;
  Align := alTop;

  FActivated := True;
  FTitle := '';
  FThick := DEFAULT_TITLEBAR_THICK;
  FHorzLeftMargin := DEFAULT_HORZ_LEFTMARGIN;
  FHorzTopMargin := DEFAULT_HORZ_TOPMARGIN;
  FVertLeftMargin := DEFAULT_VERT_LEFTMARGIN;
  FVertBottomMargin := DEFAULT_VERT_BOTTOMMARGIN;
end;

destructor TAreaTitleBar.Destroy;
begin
  inherited;
end;

procedure TAreaTitleBar.SetTitle(Value: string);
begin
  if FTitle <> Value then
  begin
    FTitle := Value;
    Repaint;
  end;
end;

procedure TAreaTitleBar.SetActivated(Value: Boolean);
begin
  if FActivated <> Value then
  begin
    FActivated := Value;
    Repaint;
  end;
end;

procedure TAreaTitleBar.SetThick(Value: Integer);
begin
  if FThick <> Value then
  begin
    FThick := Value;
    Repaint;
  end;
end;

procedure TAreaTitleBar.SetHorzLeftMargin(Value: Integer);
begin
  if FHorzLeftMargin <> Value then
  begin
    FHorzLeftMargin := Value;
    Repaint;
  end;
end;

procedure TAreaTitleBar.SetHorzTopMargin(Value: Integer);
begin
  if FHorzTopMargin <> Value then
  begin
    FHorzTopMargin := Value;
    Repaint;
  end;
end;

procedure TAreaTitleBar.SetVertLeftMargin(Value: Integer);
begin
  if FVertLeftMargin <> Value then
  begin
    FVertLeftMargin := Value;
    Repaint;
  end;
end;

procedure TAreaTitleBar.SetVertBottomMargin(Value: Integer);
begin
  if FVertBottomMargin <> Value then
  begin
    FVertBottomMargin := Value;
    Repaint;
  end;
end;

procedure TAreaTitleBar.LayoutSetting;
begin
  case Align of
    alTop, alBottom: begin
      Height := FThick;
      CloseButton.Left := Width - CloseButton.Width - CLOSEBUTTON_MARGIN;
      CloseButton.Top := CLOSEBUTTON_MARGIN;
    end;
    alLeft, alRight: begin
      Width := Thick;
      CloseButton.Left := CLOSEBUTTON_MARGIN;
      CloseButton.Top := CLOSEBUTTON_MARGIN;
    end
    else begin
      CloseButton.Left := Width - CloseButton.Width - CLOSEBUTTON_MARGIN;
      CloseButton.Top := CLOSEBUTTON_MARGIN;
    end;
  end;
end;

procedure TAreaTitleBar.VerticalText(Canvas: TCanvas; Rect: TRect; AText: string);
var
  lf: TLogFont;
  hfnt, holdfnt: HFont;
begin
  With Canvas do begin
      GetObject(Font.Handle, SizeOf(lf), Addr(lf));  //get the LogFont control
      FillChar(lf, SizeOf(lf), 0);  // initialize the TLogFont structure
      If Font.Name = 'MS Sans Serif' then  //cannot be painted vertically
        StrPCopy(lf.lfFaceName, 'Arial')  //change the font to Arial
      else  //the font MAY be able to be painted vertically
        StrPCopy(lf.lfFaceName, Font.Name);  //set the font name
      lf.lfCharSet := Font.Charset;  //set the character set
      lf.lfHeight := Font.Height;  //set the height
      if fsBold in Font.Style then  //the font is bold
        lf.lfWeight := fw_Bold  //set the weight to Bold
      else  //the font is not bold
        lf.lfWeight := fw_Normal;  //set the weight to Normal
      lf.lfItalic := Integer(fsItalic in Font.Style);  //set italics
      lf.lfUnderline := Integer(fsUnderline in Font.Style);  //set underline
      lf.lfStrikeOut := Integer(fsStrikeout in Font.Style);  //set strike out
      lf.lfEscapement := 900;  //rotate 90 degrees
      lf.lfOrientation := 900;  //rotate 90 degrees
      hfnt := CreateFontIndirect(lf);  //create a font
      holdfnt := SelectObject(Handle, hfnt);  //select the font
      SetTextColor(Handle, ColorToRgb(Font.Color));  //set the text color
      SetBkMode(Handle, Transparent);  //set the background mode to transparent
      TextRect(Rect, Rect.Left + FVertLeftMargin, Rect.Bottom - FVertBottomMargin, AText);  //paint the text
      SelectObject(Handle, holdfnt);  //select the font
      DeleteObject(hfnt);  //delete the font object
  end;
end;

procedure TAreaTitleBar.CloseClick(Sender: TObject);
begin
  if Assigned(FOnCloseClick) then FOnCloseClick(Self);
end;

procedure TAreaTitleBar.Paint;
var
  R: TRect;
begin
  inherited;
  R := Rect(0, 0, Width, Height);
  Canvas.Brush.Color := clBtnFace;
  Canvas.Pen.Color := clBtnFace;
  Canvas.Rectangle(R);
  LayoutSetting;
  if FActivated then
  begin
    Canvas.Brush.Color := clActiveCaption;
    Canvas.Pen.Color := clActiveCaption;
    Canvas.Font.Color := clCaptionText;
    CloseButton.Color := clCaptionText;
    Canvas.Rectangle(R);
  end
  else begin
    Canvas.Brush.Color := clBtnFace;
    Canvas.Pen.Color := clGray;
    Canvas.Font.Color := clBtnText;
    CloseButton.Color := clBtnText;
    Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, 3, 3);
  end;
  case Align of
    alLeft, alRight: begin
      R := Rect(R.Left+1, R.Top+1, R.Right-1, R.Bottom-1);
      VerticalText(Canvas, R, FTitle);
    end;
    else begin
      R := Rect(R.Left+1, R.Top+1, R.Right-1, R.Bottom-1);
      Canvas.TextRect(R, FHorzLeftMargin, FHorzTopMargin, Title);
    end;
  end;
end;

procedure TAreaTitleBar.RequestAlign;
begin
  inherited;
  Repaint;
end;

procedure TAreaTitleBar.Resize;
begin
  inherited;
  LayoutSetting;
end;

end.
