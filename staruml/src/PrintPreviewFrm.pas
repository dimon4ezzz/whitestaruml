unit PrintPreviewFrm;

{******************************************************************************}
{                                                                              }
{                StarUML - The Open Source UML/MDA Platform.                   }
{                                                                              }
{              Copyright (C) 2002-2005 - Plastic Software, Inc.                }
{                                                                              }
{                                                                              }
{ This program is free software; you can redistribute it and/or modify it      }
{ under the terms of the GNU General Public License as published by the Free   }
{ Software Foundation; either version 2 of the License, or (at your option)    }
{ any later version.                                                           }
{                                                                              }
{ This program is distributed in the hope that it will be useful, but WITHOUT  }
{ ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        }
{ FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     }
{ more details.                                                                }
{                                                                              }
{ You should have received a copy of the GNU General Public License along with }
{ this program; if not, write to the Free Software Foundation, Inc., 51        }
{ Franklin St, Fifth Floor, Boston, MA 02110-1301 USA                          }
{                                                                              }
{ Linking StarUML statically or dynamically with other modules is making a     }
{ combined work based on StarUML. Thus, the terms and conditions of the GNU    }
{ General Public License cover the whole combination.                          }
{                                                                              }
{ In addition, as a special exception, Plastic Software give you permission to }
{ combine StarUML program with free software programs or libraries that are    }
{ released under the GNU LGPL/Mozilla/Apache/BSD and with code included in the }
{ standard release of ExpressBar, ExpressNavBar, ExpressInspector,             }
{ ExpressPageControl, ProGrammar, NextGrid under the commercial license (or    }
{ modified versions of such code, with unchanged license). You may copy and    }
{ distribute such a system following the terms of the GNU GPL for StarUML and  }
{ the licenses of the other code concerned, provided that you include the      }
{ source code of that other code when and as the GNU GPL requires distribution }
{ of source code. Plastic Software also give you permission to combine StarUML }
{ program with dynamically linking plug-in (or add-in) programs that are       }
{ released under the GPL-incompatible and proprietary license.                 }
{                                                                              }
{ Note that people who make modified versions of StarUML are not obligated to  }
{ grant this special exception for their modified versions; it is their choice }
{ whether to do so. The GNU General Public License gives permission to release }
{ a modified version without this exception; this exception also makes it      }
{ possible to release a modified version which carries forward this exception. }
{******************************************************************************}

interface

uses
  GraphicClasses,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TPrintPreviewForm = class(TForm)
    PreviewScrollBox: TScrollBox;
    MenusPanel: TPanel;
    PrintButton: TButton;
    ZoomInButton: TButton;
    ZoomOutButton: TButton;
    PageLabel: TLabel;
    PageNumberCombo: TComboBox;
    TotalPageNumLabel: TLabel;
    CloseButton: TButton;
    OnePageButton: TButton;
    TwoPagesButton: TButton;
    LeftImage: TImage;
    RightImage: TImage;
    HelpButton: TButton;
    FirstPageButton: TButton;
    PrevPageButton: TButton;
    NextPageButton: TButton;
    LastPageButton: TButton;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ZoomInButtonClick(Sender: TObject);
    procedure ZoomOutButtonClick(Sender: TObject);
    procedure OnePageButtonClick(Sender: TObject);
    procedure TwoPagesButtonClick(Sender: TObject);
    procedure PageNumberComboChange(Sender: TObject);
    procedure FirstPageButtonClick(Sender: TObject);
    procedure PrevPageButtonClick(Sender: TObject);
    procedure NextPageButtonClick(Sender: TObject);
    procedure LastPageButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure HelpButtonClick(Sender: TObject);
  private
    FImageList: TList;
    FImageWidth, FImageHeight: Integer;
    FLeftMargin, FRightMargin, FTopMargin, FBottomMargin: Integer;
    FHeaderFooterHeight: Integer;
    FOffsetX, FOffsetY: Integer;
    FPageNumPerOnce: Integer;
    FImageIndex: Integer;
    FPreviewZoom: PZoomFactor;
    FOnPrintCommand: TNotifyEvent;
    // Utility methods
    procedure InitializePreviewForm;
    procedure SetPreviewingEnv;
    procedure SetPageNumPerOnce(Value: Integer);
    procedure DetermineZoomOnSingleImage;
    procedure DetermineZoomOnTwoImages;
    // Previewing methods
    procedure DisplayImages(Idx: Integer);
    procedure DisplaySingleImage(Img: TMetafile);
    procedure DisplayImageAsFirst(Img: TMetafile);
    procedure DisplayImageAsSecond(Img: TMetafile);
    // Properties getters/setters
    function GetWorkingWidth: Integer;
    function GetWorkingHeight: Integer;
  public
    procedure Clear;
    function NewPage: PCanvas;
    procedure EraseBorderOutArea(ACanvas: TCanvas);
    procedure DrawBorderRect(ACanvas: TCanvas);
    procedure DrawHeaderFooterText(ACanvas: TCanvas; Value: string);

    property ImageWidth: Integer read FImageWidth write FImageWidth;
    property ImageHeight: Integer read FImageHeight write FImageHeight;
    property WorkingWidth: Integer read GetWorkingWidth;
    property WorkingHeight: Integer read GetWorkingHeight;
    property LeftMargin: Integer read FLeftMargin write FLeftMargin;
    property RightMargin: Integer read FRightMargin write FRightMargin;
    property TopMargin: Integer read FTopMargin write FTopMargin;
    property BottomMargin: Integer read FBottomMargin write FBottomMargin;
    property HeaderFooterHeight: Integer read FHeaderFooterHeight write FHeaderFooterHeight;
    property OnPrintCommand: TNotifyEvent read FOnPrintCommand write FOnPrintCommand;
  end;

var
  PrintPreviewForm: TPrintPreviewForm;
const
  TXT_PAGE = '';

implementation

uses
  System.Types, System.UITypes, Math,
  NLS, NLS_StarUML, PageSetupFrm, HtmlHlp;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TPrintPreviewForm

procedure TPrintPreviewForm.InitializePreviewForm;
begin
  PrintButton.Enabled := False;
  ZoomInButton.Enabled := False;
  ZoomOutButton.Enabled := False;
  OnePageButton.Enabled := False;
  TwoPagesButton.Enabled := False;
  PageNumberCombo.Clear;
  PageNumberCombo.Enabled := False;
  FirstPageButton.Enabled := False;
  PrevPageButton.Enabled := False;
  NextPageButton.Enabled := False;
  LastPageButton.Enabled := False;
  FPageNumPerOnce := 1;
  TotalPageNumLabel.Caption := '/ 0 ' + TXT_PAGE;
  LeftImage.Picture.Metafile := nil;
  RightImage.Picture.Metafile := nil;
end;

procedure TPrintPreviewForm.SetPreviewingEnv;
var
  ImgTotal, I: Integer;
begin
  FPreviewZoom := ZoomFactor(100, 100);
  ImgTotal := FImageList.Count;
  if ImgTotal > 0 then begin
    if Assigned(FOnPrintCommand) then PrintButton.Enabled := True;
    // ZoomInButton.Enabled := True;
    // ZoomOutButton.Enabled := True;
    FImageIndex := 0;

    for I := 0 to ImgTotal - 1 do PageNumberCombo.Items.Add(IntToStr(I + 1));
    PageNumberCombo.ItemIndex := 0;
    if ImgTotal = 1 then TotalPageNumLabel.Caption := '/ 1 ' + TXT_PAGE
    else begin
      TotalPageNumLabel.Caption := '/ ' + IntToStr(ImgTotal) + ' ' + TXT_PAGE;
      PageNumberCombo.Enabled := True;
      TwoPagesButton.Enabled := True;
      FirstPageButton.Enabled := True;
      PrevPageButton.Enabled := True;
      NextPageButton.Enabled := True;
      LastPageButton.Enabled := True;
    end;
  end;
end;

procedure TPrintPreviewForm.DetermineZoomOnSingleImage;
var
  VirtualWidth, VirtualHeight: Integer;
  VertDiff, HorzDiff: Real;
begin
  VirtualWidth := PreviewScrollBox.Width - (FOffsetX * 2);
  VirtualHeight := PreviewScrollBox.Height - (FOffsetY * 2);
  HorzDiff := ImageWidth / VirtualWidth;
  VertDiff := ImageHeight / VirtualHeight;

  if (HorzDiff <= 1) and (VertDiff <= 1) then Exit;
  if HorzDiff >= VertDiff then FPreviewZoom.Denom := Trunc(FPreviewZoom.Denom * HorzDiff) + 1
  else FPreviewZoom.Denom := Trunc(FPreviewZoom.Denom * VertDiff) + 1
end;

procedure TPrintPreviewForm.DetermineZoomOnTwoImages;
var
  VirtualWidth, VirtualHeight: Integer;
  VertDiff, HorzDiff: Real;
begin
  VirtualWidth := PreviewScrollBox.Width - (FOffsetX * 3);
  VirtualHeight := PreviewScrollBox.Height - (FOffsetY * 2);
  HorzDiff := (ImageWidth * 2) / VirtualWidth;
  VertDiff := ImageHeight / VirtualHeight;

  if (HorzDiff <= 1) and (VertDiff <= 1) then Exit;
  if HorzDiff >= VertDiff then FPreviewZoom.Denom := Trunc(FPreviewZoom.Denom * HorzDiff) + 1
  else FPreviewZoom.Denom := Trunc(FPreviewZoom.Denom * VertDiff) + 1
end;

procedure TPrintPreviewForm.DisplayImages(Idx: Integer);
var
  AMetafile: TMetafile;
begin
  LeftImage.Picture.Metafile := nil;
  RightImage.Picture.Metafile := nil;

  try
    AMetafile := FImageList.Items[Idx];
    FImageIndex := Idx;
    if FPageNumPerOnce = 1 then begin
      DetermineZoomOnSingleImage;
      DisplaySingleImage(AMetafile);
    end else if FPageNumPerOnce = 2 then begin
      DetermineZoomOnTwoImages;
      DisplayImageAsFirst(AMetafile);
      if Idx + 1 < FImageList.Count then begin
        AMetafile := FImageList.Items[Idx + 1];
        DisplayImageAsSecond(AMetafile);
      end;
    end;
  except on Exception do ShowMessage(ERR_INTERNAL_ERROR);
  end;
end;

procedure TPrintPreviewForm.DisplaySingleImage(Img: TMetafile);
var
  ZoomRate: Real;
begin
  Img.Width := FImageWidth;
  Img.Height := FImageHeight;

  ZoomRate := FPreviewZoom.Numer / FPreviewZoom.Denom;
  Img.Width := Trunc(Img.Width * ZoomRate);
  Img.Height := Trunc(Img.Height * ZoomRate);

  LeftImage.Picture.Metafile := Img;

  LeftImage.Left := FOffsetX;
  LeftImage.Top := FOffsetY;
end;

procedure TPrintPreviewForm.DisplayImageAsFirst(Img: TMetafile);
begin
  DisplaySingleImage(Img);
end;

procedure TPrintPreviewForm.DisplayImageAsSecond(Img: TMetafile);
var
  ZoomRate: Real;
begin
  Img.Width := FImageWidth;
  Img.Height := FImageHeight;

  ZoomRate := FPreviewZoom.Numer / FPreviewZoom.Denom;
  Img.Width := Trunc(Img.Width * ZoomRate);
  Img.Height := Trunc(Img.Height * ZoomRate);

  RightImage.Picture.Metafile := Img;

  RightImage.Left := LeftImage.Left + LeftImage.Width + FOffsetX;
  RightImage.Top := FOffsetY;
end;

function TPrintPreviewForm.GetWorkingWidth: Integer;
begin
  Result := ImageWidth - (LeftMargin + RightMargin);
end;

function TPrintPreviewForm.GetWorkingHeight: Integer;
begin
  if PageSetupForm.PrintingHeaderFooter then
    Result := ImageHeight - (TopMargin + BottomMargin + HeaderFooterHeight)
  else
    Result := ImageHeight - (TopMargin + BottomMargin);
end;

procedure TPrintPreviewForm.SetPageNumPerOnce(Value: Integer);
begin
  // PRECONDITION
  Assert((Value = 1) or (Value = 2));
  // PRECONDITION

  OnePageButton.Enabled := False;
  TwoPagesButton.Enabled := False;

  FPageNumPerOnce := Value;
  if FPageNumPerOnce = 2 then OnePageButton.Enabled := True
  else {if FImageList.Count > 2 then} TwoPagesButton.Enabled := True;

  FPreviewZoom := ZoomFactor(100, 100);
  DisplayImages(FImageIndex);
end;

procedure TPrintPreviewForm.Clear;
var
  I: Integer;
  AMetafile: TMetafile;
begin
  for I := FImageList.Count - 1 downto 0 do begin
    AMetafile := FImageList.Items[I];
    AMetafile.Free;
  end;
  FImageList.Clear;
end;

function TPrintPreviewForm.NewPage: PCanvas;
  procedure ClearMetafileCanvas(AMetaCanvas: TMetafileCanvas);
  var
    OldBrushColor: TColor;
  begin
    OldBrushColor := AMetaCanvas.Brush.Color;
    AMetaCanvas.Brush.Color := clWhite;
    try
      AMetaCanvas.FillRect(Rect(0, 0, ImageWidth, ImageHeight));
    finally
      AMetaCanvas.Brush.Color := OldBrushColor;
    end;
  end;
  
var
  AMetafile: TMetafile;
  AMetafileCanvas: TMetafileCanvas;
begin
  Result := nil;
  AMetafile := TMetafile.Create;
  AMetafile.Width := ImageWidth;
  AMetafile.Height := ImageHeight;

  AMetafileCanvas := TMetafileCanvas.Create(AMetafile, AMetafile.Handle);
  ClearMetafileCanvas(AMetafileCanvas);
  FImageList.Add(AMetafile);
  Result := PCanvas.Create(AMetafileCanvas);
end;

procedure TPrintPreviewForm.EraseBorderOutArea(ACanvas: TCanvas);
var
  OldPenColor, OldBrushColor: TColor;
begin
  OldPenColor := ACanvas.Pen.Color;
  OldBrushColor := ACanvas.Brush.Color;

  ACanvas.Pen.Color := clWhite;
  ACanvas.Brush.Color := clWhite;
  try
    // erase left range of page space
    ACanvas.FillRect(Rect(0, 0, LeftMargin, ImageHeight));
    // erase top range of page space
    if ((PageSetupForm.PrintingHeaderFooter) and (PageSetupForm.OptionType = ptHeader)) then
      ACanvas.FillRect(Rect( -1, -1, ImageWidth + 2, TopMargin + HeaderFooterHeight))
    else ACanvas.FillRect(Rect( -1, -1, ImageWidth + 2, TopMargin));
    // erase right page space
    ACanvas.FillRect(Rect(ImageWidth - RightMargin, -1, ImageWidth + 1, ImageHeight + 1));
    // erase bottom page space
    if ((PageSetupForm.PrintingHeaderFooter) and (PageSetupForm.OptionType = ptFooter)) then
      ACanvas.FillRect(Rect( -1, ImageHeight - BottomMargin - HeaderFooterHeight, ImageWidth + 2, ImageHeight + 1))
    else
      ACanvas.FillRect(Rect( -1, ImageHeight - BottomMargin, ImageWidth + 2, ImageHeight + 1));
  finally
    ACanvas.Pen.Color := OldPenColor;
    ACanvas.Brush.Color := OldBrushColor;
  end;
end;

procedure TPrintPreviewForm.DrawBorderRect(ACanvas: TCanvas);
var
  LT, RT, LB, RB: TPoint;
  OldPenWidth: Integer;
  OldPenColor: TColor;
begin
  if not PageSetupForm.PrintingBorderRect then Exit;

  if ((PageSetupForm.PrintingHeaderFooter) and (PageSetupForm.OptionType = ptHeader)) then begin
    LT := Point(LeftMargin, TopMargin + HeaderFooterHeight);
    RT := Point(ImageWidth - RightMargin, LT.Y);
  end else begin
    LT := Point(LeftMargin, TopMargin);
    RT := Point(ImageWidth - RightMargin, LT.Y);
  end;
  if ((PageSetupForm.PrintingHeaderFooter) and (PageSetupForm.OptionType = ptFooter)) then begin
    LB := Point(LeftMargin, ImageHeight - BottomMargin - HeaderFooterHeight);
    RB := Point(ImageWidth - RightMargin, LB.Y);
  end else begin
    LB := Point(LeftMargin, ImageHeight - BottomMargin);
    RB := Point(ImageWidth - RightMargin, LB.Y);
  end;

  with ACanvas do begin
    OldPenWidth := Pen.Width;
    OldPenColor := Pen.Color;

    Pen.Width := PageSetupForm.BorderWidth;
    Pen.Color := clSilver;
    try
      // Left border line
      if PageSetupForm.LeftBorder then begin
        MoveTo(LT.X, LT.Y);
        LineTo(LB.X, LB.Y);
      end;
      // Top border line
      if PageSetupForm.TopBorder then begin
        MoveTo(LT.X, LT.Y);
        LineTo(RT.X, RT.Y);
      end;
      // Right border line
      if PageSetupForm.RightBorder then begin
        MoveTo(RT.X, RT.Y);
        LineTo(RB.X, RB.Y);
      end;
      // Bottom border line
      if PageSetupForm.BottomBorder then begin
        MoveTo(LB.X, LB.Y);
        LineTo(RB.X, RB.Y);
      end;
    finally
      Pen.Width := OldPenWidth;
      Pen.Color := OldPenColor;
    end;
  end;
end;

procedure TPrintPreviewForm.DrawHeaderFooterText(ACanvas: TCanvas; Value: string);
var
  OldName: TFontName;
  OldSize: Integer;
  OldStyle: TFontStyles;
begin
  OldName := ACanvas.Font.Name;
  OldSize := ACanvas.Font.Size;
  OldStyle := ACanvas.Font.Style;
  ACanvas.Font.Name := HEADER_FOOTER_FONT_NAME;
  ACanvas.Font.Size := HEADER_FOOTER_FONT_SIZE;
  //ACanvas.Font.Size := Round(ACanvas.Font.Size * GetReverseZoomRate(PageSetupForm.PrintingZoom));
  ACanvas.Font.Style := [];
  try
    if PageSetupForm.OptionType = ptHeader then ACanvas.TextOut(LeftMargin, TopMargin, Value)
    else ACanvas.TextOut(LeftMargin, TopMargin + WorkingHeight, Value);
  finally
    ACanvas.Font.Name := OldName;
    ACanvas.Font.Size := OldSize;
    ACanvas.Font.Style := OldStyle;
  end;
end;

// TPrintPreviewForm
////////////////////////////////////////////////////////////////////////////////

procedure TPrintPreviewForm.FormCreate(Sender: TObject);
begin
  FImageList := TList.Create;

  PreviewScrollBox.DoubleBuffered := True;
  FOffsetX := 10;
  FOffsetY := 10;

  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\PREVIEW.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

procedure TPrintPreviewForm.FormDestroy(Sender: TObject);
begin
  Clear;
  FImageList.Free;
end;

procedure TPrintPreviewForm.FormShow(Sender: TObject);
begin
  InitializePreviewForm;
  if FImageList.Count > 0 then begin
    SetPreviewingEnv;
    DisplayImages(FImageIndex);
  end;
end;

procedure TPrintPreviewForm.PrintButtonClick(Sender: TObject);
begin
  if Assigned(FOnPrintCommand) then FOnPrintCommand(Self);
  Close;
end;

procedure TPrintPreviewForm.ZoomInButtonClick(Sender: TObject);
begin
  //
end;

procedure TPrintPreviewForm.ZoomOutButtonClick(Sender: TObject);
begin
  //
end;

procedure TPrintPreviewForm.OnePageButtonClick(Sender: TObject);
begin
  SetPageNumPerOnce(1);
end;

procedure TPrintPreviewForm.TwoPagesButtonClick(Sender: TObject);
begin
  SetPageNumPerOnce(2);
end;

procedure TPrintPreviewForm.PageNumberComboChange(Sender: TObject);
var
  Idx : Integer;
begin
  Idx := PageNumberCombo.ItemIndex;
  FPreviewZoom := ZoomFactor(100, 100);
  DisplayImages(Idx);
end;

procedure TPrintPreviewForm.FirstPageButtonClick(Sender: TObject);
begin
  if (FImageList.Count > 0) and (FImageIndex <> 0) then begin
    PageNumberCombo.ItemIndex := 0;
    PageNumberComboChange(nil);
  end;
end;

procedure TPrintPreviewForm.PrevPageButtonClick(Sender: TObject);
begin
  if FImageIndex > 0 then begin
    PageNumberCombo.ItemIndex := FImageIndex - 1;
    PageNumberComboChange(nil);
  end;
end;

procedure TPrintPreviewForm.NextPageButtonClick(Sender: TObject);
begin
  if FImageList.Count > FImageIndex + 1 then begin
    PageNumberCombo.ItemIndex := FImageIndex + 1;
    PageNumberComboChange(nil);
  end;
end;

procedure TPrintPreviewForm.LastPageButtonClick(Sender: TObject);
var
  Cnt, Idx: Integer;
begin
  Cnt := FImageList.Count;
  if (Cnt > 0) and (FImageIndex <> Cnt - 1) then begin
    Idx := Cnt - 1;
    if (FPageNumPerOnce = 2) and (Cnt >= 2) then Dec(Idx);
    PageNumberCombo.ItemIndex := Idx;
    PageNumberComboChange(nil);
  end;
end;

procedure TPrintPreviewForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TPrintPreviewForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_HOME then FirstPageButtonClick(nil)
  else if Key = VK_END then LastPageButtonClick(nil)
  else if Key = VK_PRIOR then PrevPageButtonClick(nil)
  else if Key = VK_NEXT then NextPageButtonClick(nil);
end;

procedure TPrintPreviewForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

end.
