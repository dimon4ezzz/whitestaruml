unit CompactFontDlg;

{$R CompactFontDlg.dcr}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

const
  PREVIEW_STR = 'AaBbYyZz123';
  DEFAULT_COLORSTR = 'Default';
  CUSTOM_COLORSTR = 'Custom...';

type
  // Enumerations
  TCompactFontDialogParts = set of (fpFontName, fpFontSize, fpFontColor, fpFontStyle, fpFontEffect);
  TCompactFontDialogOptions = set of (foNoPreview, foLimitSize, foApplyButton);

  // Event
  TCompactFontDialogApplyEvent = procedure(Sender: TObject; AFont: TFont;
    AIndeterminateParts: TCompactFontDialogParts) of object;

  // TCompactFontDialogForm
  TCompactFontDialogForm = class(TForm)
    FontNameLabel: TLabel;
    FontStyleLabel: TLabel;
    FontSizeLabel: TLabel;
    FontStyleEdit: TEdit;
    FontSizeEdit: TEdit;
    FontEffectGoupBox: TGroupBox;
    PreviewGoupBox: TGroupBox;
    PreviewPanel: TPanel;
    AcceptButton: TButton;
    CancelButton: TButton;
    FontSizeListBox: TListBox;
    FontStyleListBox: TListBox;
    FontNameEdit: TEdit;
    PreviewLabel: TLabel;
    ApplyButton: TButton;
    StrikeOutCheckBox: TCheckBox;
    UnderlineCheckbox: TCheckBox;
    FontNameListBox: TListBox;
    ColorLabel: TLabel;
    FontColorBox: TColorBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TCompactFontDialog = class(TComponent)
  private
    DialogForm: TCompactFontDialogForm;
    // properties
    FFont: TFont;
    FMinFontSize: Integer;
    FMaxFontSize: Integer;
    FDisableParts: TCompactFontDialogParts;
    FIndeterminateParts: TCompactFontDialogParts;
    FOptions: TCompactFontDialogOptions;
    FPreviewString: string;
    FDefaultColorString: string;
    FCustomColorString: string;
    FColorNameBlack: string;
    FColorNameMaroon: string;
    FColorNameGreen: string;
    FColorNameOlive: string;
    FColorNameNavy: string;
    FColorNamePurple: string;
    FColorNameTeal: string;
    FColorNameGray: string;
    FColorNameSilver: string;
    FColorNameRed: string;
    FColorNameLime: string;
    FColorNameYellow: string;
    FColorNameBlue: string;
    FColorNameFuchsia: string;
    FColorNameAqua: string;
    FColorNameWhite: string;

    // internal variables
    CFont: TFont;
    CIndeterminateParts: TCompactFontDialogParts;
    // Event variable
    FOnShow: TNotifyEvent;
    FOnClose: TNotifyEvent;
    FOnApply: TCompactFontDialogApplyEvent;
    procedure SetFont(Value: TFont);
    procedure SetIndeterminateParts(Value: TCompactFontDialogParts);
    procedure InitializeDialog;
    procedure UpdateFontDialogEdits(AFont: TFont; AIndeterminateParts: TCompactFontDialogParts);
    procedure UpdateFontDialog(AFont: TFont; AIndeterminateParts: TCompactFontDialogParts);
    procedure Preview(AFont: TFont);
    // Event Handlers
    procedure HandleDialogFormShow(Sender: TObject);
    procedure HandleDialogFormClose(Sender: TObject; var Action: TCloseAction);
    procedure HandleFontNameEditChange(Sender: TObject);
    procedure HandleFontNameListBoxClick(Sender: TObject);
    procedure HandleFontStyleEditChange(Sender: TObject);
    procedure HandleFontStyleListBoxClick(Sender: TObject);
    procedure HandleFontSizeEditChange(Sender: TObject);
    procedure HandleFontSizeListBoxClick(Sender: TObject);
    procedure HandleStrikeOutCheckBoxClick(Sender: TObject);
    procedure HandleUnderlineCheckboxClick(Sender: TObject);
    procedure HandleFontColorBoxChange(Sender: TObject);
    procedure HandleAcceptButtonClick(Sender: TObject);
    procedure HandleCancelButtonClick(Sender: TObject);
    procedure HandleApplyButtonClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;
  published
    property Name;
    property Tag;
    property Font: TFont read FFont write SetFont;
    property MinFontSize: Integer read FMinFontSize write FMinFontSize default 1;
    property MaxFontSize: Integer read FMaxFontSize write FMaxFontSize default 48;
    property DisableParts: TCompactFontDialogParts read FDisableParts write FDisableParts;
    property IndeterminateParts: TCompactFontDialogParts read FIndeterminateParts write SetIndeterminateParts;
    property Options: TCompactFontDialogOptions read FOptions write FOptions;
    property PreviewString: string read FPreviewString write FPreviewString;
    property ColorNameBlack: string read FColorNameBlack write FColorNameBlack;
    property ColorNameMaroon: string read FColorNameMaroon write FColorNameMaroon;
    property ColorNameGreen: string read FColorNameGreen write FColorNameGreen;
    property ColorNameOlive: string read FColorNameOlive write FColorNameOlive;
    property ColorNameNavy: string read FColorNameNavy write FColorNameNavy;
    property ColorNamePurple: string read FColorNamePurple write FColorNamePurple;
    property ColorNameTeal: string read FColorNameTeal write FColorNameTeal;
    property ColorNameGray: string read FColorNameGray write FColorNameGray;
    property ColorNameSilver: string read FColorNameSilver write FColorNameSilver;
    property ColorNameRed: string read FColorNameRed write FColorNameRed;
    property ColorNameLime: string read FColorNameLime write FColorNameLime;
    property ColorNameYellow: string read FColorNameYellow write FColorNameYellow;
    property ColorNameBlue: string read FColorNameBlue write FColorNameBlue;
    property ColorNameFuchsia: string read FColorNameFuchsia write FColorNameFuchsia;
    property ColorNameAqua: string read FColorNameAqua write FColorNameAqua;
    property ColorNameWhite: string read FColorNameWhite write FColorNameWhite;
    property DefaultColorString: string read FDefaultColorString write FDefaultColorString;
    property CustomColorString: string read FCustomColorString write FCustomColorString;
    property OnShow: TNotifyEvent read FOnShow write FOnShow;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnApply: TCompactFontDialogApplyEvent read FOnApply write FOnApply;
  end;

  // Utilities
  procedure SetCheckBoxState(ACheckBox: TCheckBox; Value: TCheckBoxState);
  procedure SetColorBoxSelectionColor(AColorBox: TColorBox; Value: TColor);
  function CompareFont(FontA, FontB: TFont): Boolean;

procedure Register;

implementation

{$R *.dfm}

uses
  Printers;

const
  IDX_STYLE_NONE = 0;
  IDX_STYLE_BOLD = 1;
  IDX_STYLE_ITALIC = 2;
  IDX_STYLE_BOLDITALIC = 3;
  DEFAULT_FONT_SIZE = 8;

procedure Register;
begin
  RegisterComponents('PlasticComponents', [TCompactFontDialog]);
end;

////////////////////////////////////////////////////////////////////////////////
// TCompactFontDialog

constructor TCompactFontDialog.Create(AOwner: TComponent);
begin
  inherited;
  FFont := TFont.Create;
  CFont := TFont.Create;
  DialogForm := TCompactFontDialogForm.Create(Self);
  FPreviewString := PREVIEW_STR;
  FDefaultColorString := DEFAULT_COLORSTR;
  FCustomColorString := CUSTOM_COLORSTR;
  FColorNameBlack := 'Black';
  FColorNameMaroon := 'Maroon';
  FColorNameGreen := 'Green';
  FColorNameOlive := 'Olive';
  FColorNameNavy := 'Navy';
  FColorNamePurple := 'Purple';
  FColorNameTeal := 'Teal';
  FColorNameGray := 'Gray';
  FColorNameSilver := 'Silver';
  FColorNameRed := 'Red';
  FColorNameLime := 'Lime';
  FColorNameYellow := 'Yellow';
  FColorNameBlue := 'Blue';
  FColorNameFuchsia := 'Fuchsia';
  FColorNameAqua := 'Aqua';
  FColorNameWhite := 'White';
end;

destructor TCompactFontDialog.Destroy;
begin
  FFont.Free;
  CFont.Free;
  DialogForm.Free;
  inherited;
end;

procedure TCompactFontDialog.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
  CFont.Assign(Value);
end;

procedure TCompactFontDialog.SetIndeterminateParts(Value: TCompactFontDialogParts);
begin
  FIndeterminateParts := Value;
  CIndeterminateParts := Value;
end;

procedure TCompactFontDialog.InitializeDialog;
var
  N, C: TColor;
begin
  with DialogForm do begin
    // Set ColorNames
    FontColorBox.Items[0] := FCustomColorString;
    FontColorBox.Items[1] := FColorNameBlack;
    FontColorBox.Items[2] := FColorNameMaroon;
    FontColorBox.Items[3] := FColorNameGreen;
    FontColorBox.Items[4] := FColorNameOlive;
    FontColorBox.Items[5] := FColorNameNavy;
    FontColorBox.Items[6] := FColorNamePurple;
    FontColorBox.Items[7] := FColorNameTeal;
    FontColorBox.Items[8] := FColorNameGray;
    FontColorBox.Items[9] := FColorNameSilver;
    FontColorBox.Items[10] := FColorNameRed;
    FontColorBox.Items[11] := FColorNameLime;
    FontColorBox.Items[12] := FColorNameYellow;
    FontColorBox.Items[13] := FColorNameBlue;
    FontColorBox.Items[14] := FColorNameFuchsia;
    FontColorBox.Items[15] := FColorNameAqua;
    FontColorBox.Items[16] := FColorNameWhite;
    if FontColorBox.Items.Count <= 17 then begin
      N := clNone;
      FontColorBox.Items.AddObject(FDefaultColorString, TObject(N));
    end;
    C := clDefault;
    FontColorBox.Items.Objects[0] := TObject(C);
    // Set Apply button visibility
    ApplyButton.Visible := (foApplyButton in FOptions);
    // Set controls enable-state
    FontNameEdit.Enabled := not (fpFontName in FDisableParts);
    FontStyleEdit.Enabled := not (fpFontStyle in FDisableParts);
    FontStyleListBox.Enabled := not (fpFontStyle in FDisableParts);
    FontSizeEdit.Enabled := not (fpFontSize in FDisableParts);
    FontSizeListBox.Enabled := not (fpFontSize in FDisableParts);
    FontColorBox.Enabled := not (fpFontColor in FDisableParts);
    StrikeOutCheckBox.Enabled := not (fpFontEffect in FDisableParts);
    UnderlineCheckBox.Enabled := not (fpFontEffect in FDisableParts);
    PreviewPanel.Enabled := not (foNoPreview in FOptions);
    // Get font list
    FontNameListBox.Items.Assign(Screen.Fonts);
    // Set Event Handlers
    DialogForm.OnShow := HandleDialogFormShow;
    DialogForm.OnClose := HandleDialogFormClose;
    FontNameEdit.OnChange := HandleFontNameEditChange;
    FontNameListBox.OnClick := HandleFontNameListBoxClick;
    FontStyleEdit.OnChange := HandleFontStyleEditChange;
    FontStyleListBox.OnClick := HandleFontStyleListBoxClick;
    FontSizeEdit.OnChange := HandleFontSizeEditChange;
    FontSizeListBox.OnClick := HandleFontSizeListBoxClick;
    StrikeOutCheckBox.OnClick := HandleStrikeOutCheckBoxClick;
    UnderlineCheckBox.OnClick := HandleUnderlineCheckBoxClick;
    FontColorBox.OnChange := HandleFontColorBoxChange;
    AcceptButton.OnClick := HandleAcceptButtonClick;
    CancelButton.OnClick := HandleCancelButtonClick;
    ApplyButton.OnClick := HandleApplyButtonClick;
  end;
  CFont.Assign(FFont);
  CIndeterminateParts := FIndeterminateParts;
end;

procedure TCompactFontDialog.UpdateFontDialogEdits(AFont: TFont; AIndeterminateParts: TCompactFontDialogParts);
begin
  with DialogForm do begin
    if not (fpFontName in FDisableParts) then begin
      if fpFontName in AIndeterminateParts then
        FontNameEdit.Text := ''
      else
        FontNameEdit.Text := AFont.Name;
    end;
    if not (fpFontSize in FDisableParts) then begin
      if fpFontSize in AIndeterminateParts then
        FontSizeEdit.Text := ''
      else
        FontSizeEdit.Text := IntToStr(AFont.Size);
    end;
    if not (fpFontStyle in FDisableParts) then begin
      if fpFontStyle in AIndeterminateParts then
        FontStyleEdit.Text := ''
      else
        FontStyleEdit.Text := FontStyleListBox.Items[FontStyleListBox.ItemIndex];
    end;
  end;
  if not (foNoPreview in FOptions) then
    Preview(AFont);
end;

procedure TCompactFontDialog.UpdateFontDialog(AFont: TFont; AIndeterminateParts: TCompactFontDialogParts);
begin
  with DialogForm do begin
    if not (fpFontName in FDisableParts) then begin
      if fpFontName in AIndeterminateParts then
        FontNameListBox.ItemIndex := -1
      else
        FontNameListBox.ItemIndex := FontNameListBox.Items.IndexOf(AFont.Name);
    end;
    if not (fpFontSize in FDisableParts) then begin
      if fpFontSize in AIndeterminateParts then
        FontSizeListBox.ItemIndex := -1
      else
        FontSizeListBox.ItemIndex := FontSizeListBox.Items.IndexOf(IntToStr(AFont.Size));
    end;
    if not (fpFontStyle in FDisableParts) then begin
      if fpFontStyle in AIndeterminateParts then
        FontStyleListBox.ItemIndex := -1
      else begin
        if (fsBold in AFont.Style) and (fsItalic in AFont.Style) then
          FontStyleListBox.ItemIndex := IDX_STYLE_BOLDITALIC
        else if (fsBold in AFont.Style) then
          FontStyleListBox.ItemIndex := IDX_STYLE_BOLD
        else if (fsItalic in AFont.Style) then
          FontStyleListBox.ItemIndex := IDX_STYLE_ITALIC
        else
          FontStyleListBox.ItemIndex := IDX_STYLE_NONE;
      end;
    end;
    if not (fpFontColor in FDisableParts) then begin
      if fpFontColor in AIndeterminateParts then begin
        SetColorBoxSelectionColor(FontColorBox, clNone);
      end
      else begin
        SetColorBoxSelectionColor(FontColorBox, AFont.Color);
      end;
    end;
    if not (fpFontEffect in FDisableParts) then begin
      if fpFontEffect in AIndeterminateParts then begin
        SetCheckBoxState(StrikeOutCheckBox, cbGrayed);
        SetCheckBoxState(UnderlineCheckBox, cbGrayed);
      end
      else begin
        if (fsStrikeOut in AFont.Style) then
          SetCheckBoxState(StrikeOutCheckBox, cbChecked)
        else
          SetCheckBoxState(StrikeOutCheckBox, cbUnchecked);
        if (fsUnderline in AFont.Style) then
          SetCheckBoxState(UnderlineCheckBox, cbChecked)
        else
          SetCheckBoxState(UnderlineCheckBox, cbUnchecked);
      end;
    end;
    AcceptButton.Enabled := (not CompareFont(FFont, CFont)) or (FIndeterminateParts <> CIndeterminateParts);
    ApplyButton.Enabled := AcceptButton.Enabled;
  end;
  if not (foNoPreview in FOptions) then
    Preview(AFont);
end;

procedure TCompactFontDialog.Preview(AFont: TFont);
begin
  with DialogForm do begin
    PreviewLabel.Caption := FPreviewString;
    PreviewLabel.Font.Assign(AFont);
    PreviewLabel.Left := (PreviewPanel.Width div 2) - (PreviewLabel.Width div 2);
    PreviewLabel.Top := (PreviewPanel.Height div 2) - (PreviewLabel.Height div 2);
  end;
end;

function TCompactFontDialog.Execute: Boolean;
begin
  InitializeDialog;
  UpdateFontDialog(CFont, CIndeterminateParts);
  UpdateFontDialogEdits(CFont, CIndeterminateParts);
  Result := (DialogForm.ShowModal = mrOk);
end;

// Event Handlers
procedure TCompactFontDialog.HandleDialogFormShow(Sender: TObject);
begin
  if Assigned(FOnShow) then
    FOnShow(Self);
end;

procedure TCompactFontDialog.HandleDialogFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FOnClose) then
    FOnClose(Self);
end;

procedure TCompactFontDialog.HandleFontNameEditChange(Sender: TObject);
var
  Idx: Integer;
begin
  with DialogForm do begin
    if FontNameEdit.Text = '' then begin
      CIndeterminateParts := CIndeterminateParts + [fpFontName];
      UpdateFontDialog(CFont, CIndeterminateParts);
    end
    else begin
      Idx := FontNameListBox.Items.IndexOf(FontNameEdit.Text);
      if Idx <> -1 then begin
        FontNameListBox.ItemIndex := Idx;
        CFont.Name := FontNameEdit.Text;
        CIndeterminateParts := CIndeterminateParts - [fpFontName];
        UpdateFontDialog(CFont, CIndeterminateParts);
      end;
    end;
  end;
end;

procedure TCompactFontDialog.HandleFontNameListBoxClick(Sender: TObject);
begin
  CFont.Name := DialogForm.FontNameListBox.Items[DialogForm.FontNameListBox.ItemIndex];
  CIndeterminateParts := CIndeterminateParts - [fpFontName];
  UpdateFontDialog(CFont, CIndeterminateParts);
  UpdateFontDialogEdits(CFont, CIndeterminateParts);
end;

procedure TCompactFontDialog.HandleFontStyleEditChange(Sender: TObject);
var
  Idx: Integer;
begin
  with DialogForm do begin
    if FontStyleEdit.Text = '' then begin
      CIndeterminateParts := CIndeterminateParts + [fpFontStyle];
      UpdateFontDialog(CFont, CIndeterminateParts);
    end
    else begin
      Idx := FontStyleListBox.Items.IndexOf(FontStyleEdit.Text);
      if Idx <> -1 then begin
        FontStyleListBox.ItemIndex := Idx;
        CFont.Style := CFont.Style - [fsBold, fsItalic];
        case Idx of
          IDX_STYLE_BOLD : CFont.Style := CFont.Style + [fsBold];
          IDX_STYLE_ITALIC : CFont.Style := CFont.Style + [fsItalic];
          IDX_STYLE_BOLDITALIC : CFont.Style := CFont.Style + [fsBold, fsItalic];
        end;
        CIndeterminateParts := CIndeterminateParts - [fpFontStyle];
        UpdateFontDialog(CFont, CIndeterminateParts);
      end;
    end;
  end;
end;

procedure TCompactFontDialog.HandleFontStyleListBoxClick(Sender: TObject);
begin
  CFont.Style := CFont.Style - [fsBold, fsItalic];
  case DialogForm.FontStyleListBox.ItemIndex of
    // IDX_STYLE_NONE(do noting)
    IDX_STYLE_BOLD : CFont.Style := CFont.Style + [fsBold];
    IDX_STYLE_ITALIC : CFont.Style := CFont.Style + [fsItalic];
    IDX_STYLE_BOLDITALIC : CFont.Style := CFont.Style + [fsBold, fsItalic];
  end;
  CIndeterminateParts := CIndeterminateParts - [fpFontStyle];
  UpdateFontDialog(CFont, CIndeterminateParts);
  UpdateFontDialogEdits(CFont, CIndeterminateParts);
end;

procedure TCompactFontDialog.HandleFontSizeEditChange(Sender: TObject);
var
  Idx: Integer;
begin
  with DialogForm do begin
    if FontSizeEdit.Text = '' then begin
      CIndeterminateParts := CIndeterminateParts + [fpFontSize];
      UpdateFontDialog(CFont, CIndeterminateParts);
    end
    else begin
      Idx := FontSizeListBox.Items.IndexOf(FontSizeEdit.Text);
      if Idx <> -1 then begin
        FontSizeListBox.ItemIndex := Idx;
      end;
      CFont.Size := StrToIntDef(FontSizeEdit.Text, DEFAULT_FONT_SIZE);
      if foLimitSize in FOptions then begin
        if CFont.Size < FMinFontSize then
          CFont.Size := FMinFontSize
        else if CFont.Size > FMaxFontSize then
          CFont.Size := FMaxFontSize;
      end;
      CIndeterminateParts := CIndeterminateParts - [fpFontSize];
      UpdateFontDialog(CFont, CIndeterminateParts);
    end;
  end;
end;

procedure TCompactFontDialog.HandleFontSizeListBoxClick(Sender: TObject);
begin
  CFont.Size := StrToIntDef(DialogForm.FontSizeListBox.Items[DialogForm.FontSizeListBox.ItemIndex], 8);
  if foLimitSize in FOptions then begin
    if CFont.Size < FMinFontSize then
      CFont.Size := FMinFontSize
    else if CFont.Size > FMaxFontSize then
      CFont.Size := FMaxFontSize;
  end;
  CIndeterminateParts := CIndeterminateParts - [fpFontSize];
  UpdateFontDialog(CFont, CIndeterminateParts);
  UpdateFontDialogEdits(CFont, CIndeterminateParts);
end;

procedure TCompactFontDialog.HandleStrikeOutCheckBoxClick(Sender: TObject);
begin
  case DialogForm.StrikeOutCheckBox.State of
    cbGrayed:
      CIndeterminateParts := CIndeterminateParts + [fpFontEffect];
    cbChecked:
      begin
        CFont.Style := CFont.Style + [fsStrikeOut];
        CIndeterminateParts := CIndeterminateParts - [fpFontEffect];
      end;
    cbUnchecked:
      begin
        CFont.Style := CFont.Style - [fsStrikeOut];
        CIndeterminateParts := CIndeterminateParts - [fpFontEffect];
      end;
  end;
  UpdateFontDialog(CFont, CIndeterminateParts);
end;

procedure TCompactFontDialog.HandleUnderlineCheckboxClick(Sender: TObject);
begin
  case DialogForm.UnderlineCheckBox.State of
    cbGrayed:
      CIndeterminateParts := CIndeterminateParts + [fpFontEffect];
    cbChecked:
      begin
        CFont.Style := CFont.Style + [fsUnderline];
        CIndeterminateParts := CIndeterminateParts - [fpFontEffect];
      end;
    cbUnchecked:
      begin
        CFont.Style := CFont.Style - [fsUnderline];
        CIndeterminateParts := CIndeterminateParts - [fpFontEffect];
      end;
  end;
  UpdateFontDialog(CFont, CIndeterminateParts);
end;

procedure TCompactFontDialog.HandleFontColorBoxChange(Sender: TObject);
begin
  if DialogForm.FontColorBox.Selected = clNone then
    CIndeterminateParts := CIndeterminateParts + [fpFontColor]
  else begin
    CFont.Color := DialogForm.FontColorBox.Selected;
    CIndeterminateParts := CIndeterminateParts - [fpFontColor];
  end;
  UpdateFontDialog(CFont, CIndeterminateParts);
end;

procedure TCompactFontDialog.HandleAcceptButtonClick(Sender: TObject);
begin
  FFont.Assign(CFont);
  FIndeterminateParts := CIndeterminateParts;
end;

procedure TCompactFontDialog.HandleCancelButtonClick(Sender: TObject);
begin
  CFont.Assign(FFont);
  CIndeterminateParts := FIndeterminateParts;
end;

procedure TCompactFontDialog.HandleApplyButtonClick(Sender: TObject);
begin
  FFont.Assign(CFont);
  FIndeterminateParts := CIndeterminateParts;
  if Assigned(FOnApply) then
    FOnApply(Self, FFont, FIndeterminateParts);
end;

// TCompactFontDialog
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Utilites

procedure SetCheckBoxState(ACheckBox: TCheckBox; Value: TCheckBoxState);
var
  ClickHandleProc: TNotifyEvent;
begin
  ClickHandleProc := ACheckBox.OnClick;
  ACheckBox.OnClick := nil;
  ACheckBox.State := Value;
  ACheckBox.OnClick := ClickHandleProc;
end;

procedure SetColorBoxSelectionColor(AColorBox: TColorBox; Value: TColor);
var
  ChangeHandleProc: TNotifyEvent;
begin
  ChangeHandleProc := AColorBox.OnChange;
  AColorBox.OnChange := nil;
  AColorBox.Selected := Value;
  AColorBox.OnChange := ChangeHandleProc;
end;

function CompareFont(FontA, FontB: TFont): Boolean;
begin
  Result := (FontA.Name = FontB.Name) and (FontA.Size = FontB.Size) and
    (FontA.Style = FontB.Style) and (FontA.Color = FontB.Color);
end;

// Utilites
////////////////////////////////////////////////////////////////////////////////

end.
