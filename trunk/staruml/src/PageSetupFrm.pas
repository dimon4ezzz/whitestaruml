unit PageSetupFrm;

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
  Dialogs, StdCtrls, ExtCtrls, Printers;

type
  // Enumeration type
  PDirectionKind = (dkPortrait, dkLandscape);
  PPrintingOptionType = (ptHeader, ptFooter, ptNone);

  // TPageSetupForm
  TPageSetupForm = class(TForm)
    OptionGroupBox: TGroupBox;
    MarginGroupBox: TGroupBox;
    LeftMarginEdit: TLabeledEdit;
    RightMarginEdit: TLabeledEdit;
    TopMarginEdit: TLabeledEdit;
    BottomMarginEdit: TLabeledEdit;
    OKButton: TButton;
    CancelButton: TButton;
    DirectionGroupBox: TGroupBox;
    PortraitRButton: TRadioButton;
    LandscapeRButton: TRadioButton;
    DiagramNameCheckBox: TCheckBox;
    ProjectNameCheckBox: TCheckBox;
    TypeNameCheckBox: TCheckBox;
    DateTimeCheckBox: TCheckBox;
    HeaderRButton: TRadioButton;
    FooterRButton: TRadioButton;
    BordersGroupBox: TGroupBox;
    LeftBorderCheckBox: TCheckBox;
    BorderWidthLabel: TLabel;
    BorderWidthCombo: TComboBox;
    RightBorderCheckBox: TCheckBox;
    TopBorderCheckBox: TCheckBox;
    BottomBorderCheckBox: TCheckBox;
    ApplyButton: TButton;
    PageNumberCheckBox: TCheckBox;
    OptionNoneRButton: TRadioButton;
    HelpButton: TButton;
    
    procedure FormCreate(Sender: TObject);
    procedure HeaderRButtonClick(Sender: TObject);
    procedure FooterRButtonClick(Sender: TObject);
    procedure OptionNoneRButtonClick(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    //FPrinterResol: Integer;    // Printer's resolution
    FDeviceWidth: Integer;       // Paper's real width
    FDeviceHeight: Integer;      // Paper's real height
    FPageWidth: Integer;         // Paper's available width
    FPageHeight: Integer;        // Paper's available height
    FDeviceLeftMargin: Integer;  // Printer's physical margin (Left)
    FDeviceRightMargin: Integer; // Printer's physical margin (Right)
    FDeviceTopMargin: Integer;   // Printer's physical margin (Top)
    FDeviceBottomMargin: Integer;// Printer's physical margin (Bottom)
    FLeftMargin: Integer;        // Distance from DeviceLeftMargin to printable area
    FRightMargin: Integer;       // Distance form printable area to DeviceRightMargin
    FTopMargin: Integer;         // Distance from DeviceTopMargin to printable area
    FBottomMargin: Integer;      // Distance form printable area to DeviceBottomMargin
    FPageWorkingWidth: Integer;  // Printable area width
    FPageWorkingHeight: Integer; // Printable area height 
    FOrientation: PDirectionKind;
    FBorderWidth: Integer;
    FLeftBorder: Boolean;
    FRightBorder: Boolean;
    FTopBorder: Boolean;
    FBottomBorder: Boolean;
    FOptionType: PPrintingOptionType;
    FDiagramName: Boolean;
    FProjectName: Boolean;
    FTypeName: Boolean;
    FDateTime: Boolean;
    FPageNumber: Boolean;
    FPrintingZoom: PZoomFactor;

    procedure SetPrintingZoom;
    procedure SetPrinterDeviceValues;
    procedure SetDefaultMargin;
    procedure SetUserMargin;
    procedure RollbackUserMargin;
    procedure SetPageWorkingSize;
    procedure SetDefaultOrientation;
    procedure SetOrientation(Value: PDirectionKind);
    procedure SetBorderWidth(Value: Integer);
    procedure SetLeftBorder(Value: Boolean);
    procedure SetRightBorder(Value: Boolean);
    procedure SetTopBorder(Value: Boolean);
    procedure SetBottomBorder(Value: Boolean);
    procedure SetOptionType(Value: PPrintingOptionType);
    procedure SetDiagramName(Value: Boolean);
    procedure SetProjectName(Value: Boolean);
    procedure SetTypeName(Value: Boolean);
    procedure SetDateTime(Value: Boolean);
    procedure SetPageNumber(Value: Boolean);
    function GetPrintingBorderRect: Boolean;
    function GetPrintingHeaderFooter: Boolean;
    function GetHeaderFooterHeight: Integer;
    procedure ApplyUserInputs;
  public
    procedure UpdatePageSetup;

    property DeviceWidth: Integer read FDeviceWidth;
    property DeviceHeight: Integer read FDeviceHeight;
    property DeviceLeftMargin: Integer read FDeviceLeftMargin;
    property DeviceRightMargin: Integer read FDeviceRightMargin;
    property DeviceTopMargin: Integer read FDeviceTopMargin;
    property DeviceBottomMargin: Integer read FDeviceBottomMargin;
    property LeftMargin: Integer read FLeftMargin;
    property RightMargin: Integer read FRightMargin;
    property TopMargin: Integer read FTopMargin;
    property BottomMargin: Integer read FBottomMargin;
    property PageWorkingWidth: Integer read FPageWorkingWidth;
    property PageWorkingHeight: Integer read FPageWorkingHeight;
    property Orientation: PDirectionKind read FOrientation;
    property BorderWidth: Integer read FBorderWidth;
    property LeftBorder: Boolean read FLeftBorder;
    property RightBorder: Boolean read FRightBorder;
    property TopBorder: Boolean read FTopBorder;
    property BottomBorder: Boolean read FBottomBorder;
    property PrintingBorderRect: Boolean read GetPrintingBorderRect;
    property OptionType: PPrintingOptionType read FOptionType;
    property DiagramName: Boolean read FDiagramName;
    property ProjectName: Boolean read FProjectName;
    property TypeName: Boolean read FTypeName;
    property DateTime: Boolean read FDateTime;
    property PageNumber: Boolean read FPageNumber;
    property PrintingHeaderFooter: Boolean read GetPrintingHeaderFooter;
    property HeaderFooterHeight: Integer read GetHeaderFooterHeight;
    property PrintingZoom: PZoomFactor read FPrintingZoom;
  end;

const
  DEFAULT_LEFT_MARGIN: Real = 6;   // milimeter
  DEFAULT_RIGHT_MARGIN: Real = 6;  // milimeter
  DEFAULT_TOP_MARGIN: Real = 6;    // milimeter
  DEFAULT_BOTTOM_MARGIN: Real = 6; // milimeter
  MILIMETER_PER_INCH: Real = 25.4; // milimeter
  HEADER_FOOTER_FONT_NAME: TFontName = 'Verdana';
  HEADER_FOOTER_FONT_SIZE: Integer = 8;
  // When there is no system printer, below settings are used
  ARBITRARY_PRINTER_RESOL: Integer = 600;
  ARBITRARY_DEV_WIDTH: Integer = 4960;
  ARBITRARY_DEV_HEIGHT: Integer = 7015;
  ARBITRARY_PAGE_WIDTH: Integer = 4756;
  ARBITRARY_PAGE_HEIGHT: Integer = 6811;
  ARBITRARY_DEV_LMARGIN: Integer = 102;
  ARBITRARY_DEV_RMARGIN: Integer = 102;
  ARBITRARY_DEV_TMARGIN: Integer = 102;
  ARBITRARY_DEV_BMARGIN: Integer = 102;

var
  PageSetupForm: TPageSetupForm;

  // Utility functions
  function MilimeterToPixel(APrinter: TPrinter; X: Boolean; Value: Real): Integer;
  function PixelToMilimeter(APrinter: TPrinter; X: Boolean; Value: Integer): Real;
  function MilimeterToInch(Value: Real): Real;
  function InchToMilimeter(Value: Real): Real;
  function DetermineMargin(UserValue, DeviceValue: Integer): Integer;
  function GetZoomRate(AZoomFactor: PZoomFactor): Real;
  function GetReverseZoomRate(AZoomFactor: PZoomFactor): Real;

implementation

uses
  System.Types, System.UITypes, Math,
  NLS, NLS_StarUML, HtmlHlp;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// Utility functions

function MilimeterToPixel(APrinter: TPrinter; X: Boolean; Value: Real): Integer;
var
  PrinterResol: Integer;
  InchValue: Real;
begin
  // pixels per logical inch along the screen width, e.g. 300 dpi, 600 dpi
  try
    if X then PrinterResol := GetDeviceCaps(APrinter.Handle, LOGPIXELSX)
    else PrinterResol := GetDeviceCaps(APrinter.Handle, LOGPIXELSY);
  except on Exception do PrinterResol := ARBITRARY_PRINTER_RESOL;
  end;

  InchValue := MilimeterToInch(Value);
  Result := Round(InchValue * PrinterResol);
end;

function PixelToMilimeter(APrinter: TPrinter; X: Boolean; Value: Integer): Real;
var
  PrinterResol: Integer;
  InchValue: Real;
begin
  // pixels per logical inch along the screen width, e.g. 300 dpi, 600 dpi
  try
    if X then PrinterResol := GetDeviceCaps(APrinter.Handle, LOGPIXELSX)
    else PrinterResol := GetDeviceCaps(APrinter.Handle, LOGPIXELSY);
  except on Exception do PrinterResol := ARBITRARY_PRINTER_RESOL;
  end;

  InchValue := Value / PrinterResol;
  Result := InchToMilimeter(InchValue);
end;

function MilimeterToInch(Value: Real): Real;
begin
  Result := Value / MILIMETER_PER_INCH;
end;

function InchToMilimeter(Value: Real): Real;
begin
  Result := Value * MILIMETER_PER_INCH;
end;

function DetermineMargin(UserValue, DeviceValue: Integer): Integer;
begin
  Result := 0;
  if UserValue > DeviceValue then Result := UserValue - DeviceValue;
end;

function GetZoomRate(AZoomFactor: PZoomFactor): Real;
var
  Numer, Denom: Integer;
begin
  Result := 1.0;
  Numer := AZoomFactor.Numer;
  Denom := AZoomFactor.Denom;
  Result := Numer / Denom;
end;

function GetReverseZoomRate(AZoomFactor: PZoomFactor): Real;
var
  Numer, Denom: Integer;
begin
  Result := 1.0;
  Numer := AZoomFactor.Numer;
  Denom := AZoomFactor.Denom;
  Result := Denom / Numer;
end;

// Utility functions
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TPageSetupForm

procedure TPageSetupForm.SetPrintingZoom;
var
  PrinterResol: Integer;
  ScreenResol: Integer;
  ZoomNumer: Integer;
begin
  try
    // pixels per logical inch along the screen width (Printer's)
    PrinterResol := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
  except on EPrinter do
    PrinterResol := ARBITRARY_PRINTER_RESOL;
  end;

  // pixels per logical inch along the screen width (Monitor's)
  ScreenResol := Screen.PixelsPerInch;
  ZoomNumer := Trunc((PrinterResol * 100) / ScreenResol);//Temp + 1;
  FPrintingZoom := ZoomFactor(ZoomNumer, 100);
end;

procedure TPageSetupForm.SetPrinterDeviceValues;
begin
  try
    FDeviceWidth := GetDeviceCaps(Printer.Handle, PHYSICALWIDTH);  // eg. 5100px
    FDeviceHeight := GetDeviceCaps(Printer.Handle, PHYSICALHEIGHT);// eg. 6600px
    FPageWidth := GetDeviceCaps(Printer.Handle, HORZRES);          // eg. 4896px
    FPageHeight := GetDeviceCaps(Printer.Handle, VERTRES);         // eg. 6396px
    // Device Margins
    FDeviceLeftMargin := GetDeviceCaps(Printer.Handle, PHYSICALOFFSETX);  // eg. 102
    FDeviceRightMargin := FDeviceWidth - FDeviceLeftMargin - FPageWidth;  // eg. 102
    FDeviceTopMargin := GetDeviceCaps(Printer.Handle, PHYSICALOFFSETY);   // eg. 102
    FDeviceBottomMargin := FDeviceHeight - FDeviceTopMargin - FPageHeight;// eg. 102
    // ASSERTIONS
    // Assert(FDeviceLeftMargin + FDeviceRightMargin + FPageWidth = FDeviceWidth);
    // Assert(FDeviceTopMargin + FDeviceBottomMargin + FPageHeight = FDeviceHeight);
    // ASSERTIONS
  except on EPrinter do
    begin
      FDeviceWidth := ARBITRARY_DEV_WIDTH;
      FDeviceHeight := ARBITRARY_DEV_HEIGHT;
      FPageWidth := ARBITRARY_PAGE_WIDTH;
      FPageHeight := ARBITRARY_PAGE_HEIGHT;
      FDeviceLeftMargin := ARBITRARY_DEV_LMARGIN;
      FDeviceRightMargin := ARBITRARY_DEV_RMARGIN;
      FDeviceTopMargin := ARBITRARY_DEV_TMARGIN;
      FDeviceBottomMargin := ARBITRARY_DEV_BMARGIN;
    end;
  end;
end;

procedure TPageSetupForm.SetDefaultMargin;
var
  TempMargin, LMargin, RMargin, TMargin, BMargin: Real; // milimeter
begin
  { set default space values }
  SetPrinterDeviceValues;

  // Left Margin
  TempMargin := PixelToMilimeter(Printer, True, FDeviceLeftMargin);// milimeters
  LMargin := Max(TempMargin, DEFAULT_LEFT_MARGIN);
  LeftMarginEdit.Text := FormatFloat('0.#', LMargin);
  FLeftMargin := DetermineMargin(MilimeterToPixel(Printer, True, LMargin), FDeviceLeftMargin);// eg. 40px
  // Right Margin
  TempMargin := PixelToMilimeter(Printer, True, FDeviceRightMargin);
  RMargin := Max(TempMargin, DEFAULT_RIGHT_MARGIN);
  RightMarginEdit.Text := FormatFloat('0.#', RMargin);
  FRightMargin := DetermineMargin(MilimeterToPixel(Printer, True, RMargin), FDeviceRightMargin);// eg. 40px
  // Top Margin
  TempMargin := PixelToMilimeter(Printer, False, FDeviceTopMargin);
  TMargin := Max(TempMargin, DEFAULT_TOP_MARGIN);
  TopMarginEdit.Text := FormatFloat('0.#', TMargin);
  FTopMargin := DetermineMargin(MilimeterToPixel(Printer, False, TMargin), FDeviceTopMargin);// eg. 63px
  // Bottom Margin
  TempMargin := PixelToMilimeter(Printer, False, FDeviceBottomMargin);
  BMargin := Max(TempMargin, DEFAULT_BOTTOM_MARGIN);
  BottomMarginEdit.Text := FormatFloat('0.#', BMargin);
  FBottomMargin := DetermineMargin(MilimeterToPixel(Printer, False, BMargin), FDeviceBottomMargin);// eg. 63px
end;

procedure TPageSetupForm.SetUserMargin;
var
  TempMargin: Real;
  LMargin, RMargin, TMargin, BMargin: Integer;
  EditValue: string;
begin
  { set default space values }
  SetPrinterDeviceValues;

  // Left Margin
  try
    if LeftMarginEdit.Text <> '' then begin
      EditValue := FormatFloat('0.#', StrToFloat(LeftMarginEdit.Text));
      LeftMarginEdit.Text := EditValue;
      TempMargin := StrToFloat(EditValue);
      LMargin := MilimeterToPixel(Printer, True, TempMargin);
      FLeftMargin := DetermineMargin(LMargin, FDeviceLeftMargin);
    end else begin
      LeftMarginEdit.Text := '0';
      FLeftMargin := 0;
    end;
  except on Exception do
    begin
      LeftMarginEdit.Text := '0';
      FLeftMargin := 0;
    end;
  end;
  // Right Margin
  try
    if RightMarginEdit.Text <> '' then begin
      EditValue := FormatFloat('0.#', StrToFloat(RightMarginEdit.Text));
      RightMarginEdit.Text := EditValue;
      TempMargin := StrToFloat(EditValue);
      RMargin := MilimeterToPixel(Printer, True, TempMargin);
      FRightMargin := DetermineMargin(RMargin, FDeviceRightMargin);
    end else begin
      RightMarginEdit.Text := '0';
      FRightMargin := 0;
    end;
  except on Exception do
    begin
      RightMarginEdit.Text := '0';
      FRightMargin := 0;
    end;
  end;
  // Top Margin
  try
    if TopMarginEdit.Text <> '' then begin
      EditValue := FormatFloat('0.#', StrToFloat(TopMarginEdit.Text));
      TopMarginEdit.Text := EditValue;
      TempMargin := StrToFloat(EditValue);
      TMargin := MilimeterToPixel(Printer, False, TempMargin);
      FTopMargin := DetermineMargin(TMargin, FDeviceTopMargin);
    end else begin
      TopMarginEdit.Text := '0';
      FTopMargin := 0;
    end;
  except on Exception do
    begin
      TopMarginEdit.Text := '0';
      FTopMargin := 0;
    end;
  end;
  // Bottom Margin
  try
    if BottomMarginEdit.Text <> '' then begin
      EditValue := FormatFloat('0.#', StrToFloat(BottomMarginEdit.Text));
      BottomMarginEdit.Text := EditValue;
      TempMargin := StrToFloat(EditValue);
      BMargin := MilimeterToPixel(Printer, False, TempMargin);
      FBottomMargin := DetermineMargin(BMargin, FDeviceBottomMargin);
    end else begin
      BottomMarginEdit.Text := '0';
      FBottomMargin := 0;
    end;
  except on Exception do
    begin
      BottomMarginEdit.Text := '0';
      FBottomMargin := 0;
    end;
  end;
end;

procedure TPageSetupForm.RollbackUserMargin;
begin
  LeftMarginEdit.Text := FormatFloat('0.#', PixelToMilimeter(Printer, True, FLeftMargin + FDeviceLeftMargin));
  RightMarginEdit.Text := FormatFloat('0.#', PixelToMilimeter(Printer, True, FRightMargin + FDeviceRightMargin));
  TopMarginEdit.Text := FormatFloat('0.#', PixelToMilimeter(Printer, False, FTopMargin + FDeviceTopMargin));
  BottomMarginEdit.Text := FormatFloat('0.#', PixelToMilimeter(Printer, False, FBottomMargin + FDeviceBottomMargin));
end;

procedure TPageSetupForm.SetPageWorkingSize;
begin
  // calculate available page size
  FPageWorkingWidth := FPageWidth - (FLeftMargin + FRightMargin);
  if FPageWorkingWidth <= 0 then raise Exception.Create(ERR_INVALID_VALUE);

  if PrintingHeaderFooter then
    FPageWorkingHeight := FPageHeight - (FTopMargin + FBottomMargin + HeaderFooterHeight)
  else FPageWorkingHeight := FPageHeight - (FTopMargin + FBottomMargin);
  if FPageWorkingHeight <= 0 then raise Exception.Create(ERR_INVALID_VALUE);
end;

procedure TPageSetupForm.SetDefaultOrientation;
begin
  try
    if Printer.Orientation = poPortrait then SetOrientation(dkPortrait)
    else SetOrientation(dkLandscape);
  except on EPrinter do
    begin
      PortraitRButton.Checked := True;
      FOrientation := dkPortrait;
    end;
  end;
end;

procedure TPageSetupForm.SetOrientation(Value: PDirectionKind);
begin
  case Value of
    dkPortrait: begin
      if Ord(Printer.Orientation) <> Ord(Value) then Printer.Orientation := poPortrait;
      PortraitRButton.Checked := True;
      FOrientation := dkPortrait;
    end;
    dkLandscape: begin
      if Ord(Printer.Orientation) <> Ord(Value) then Printer.Orientation := poLandscape;
      LandscapeRButton.Checked := True;
      FOrientation := dkLandscape;
    end;
  end;
end;

procedure TPageSetupForm.SetBorderWidth(Value: Integer);
begin
  // PRECONDITIONS
  Assert((Value >= 1) and (Value <= 5));
  // PRECONDITIONS

  FBorderWidth := Value;
  BorderWidthCombo.ItemIndex := Value - 1;
end;

procedure TPageSetupForm.SetLeftBorder(Value: Boolean);
begin
  FLeftBorder := Value;
  LeftBorderCheckBox.Checked := Value;
end;

procedure TPageSetupForm.SetRightBorder(Value: Boolean);
begin
  FRightBorder := Value;
  RightBorderCheckBox.Checked := Value;
end;

procedure TPageSetupForm.SetTopBorder(Value: Boolean);
begin
  FTopBorder := Value;
  TopBorderCheckBox.Checked := Value;
end;

procedure TPageSetupForm.SetBottomBorder(Value: Boolean);
begin
  FBottomBorder := Value;
  BottomBorderCheckBox.Checked := Value;
end;

procedure TPageSetupForm.SetOptionType(Value: PPrintingOptionType);
begin
  FOptionType := Value;
  if Value = ptHeader then HeaderRButton.Checked := True
  else if Value = ptFooter then FooterRButton.Checked := True
  else OptionNoneRButton.Checked := True;
end;

procedure TPageSetupForm.SetDiagramName(Value: Boolean);
begin
  FDiagramName := Value;
  DiagramNameCheckBox.Checked := Value;
end;

procedure TPageSetupForm.SetProjectName(Value: Boolean);
begin
  FProjectName := Value;
  ProjectNameCheckBox.Checked := Value;
end;

procedure TPageSetupForm.SetTypeName(Value: Boolean);
begin
  FTypeName := Value;
  TypeNameCheckBox.Checked := Value;
end;

procedure TPageSetupForm.SetDateTime(Value: Boolean);
begin
  FDateTime := Value;
  DateTimeCheckBox.Checked := Value;
end;

procedure TPageSetupForm.SetPageNumber(Value: Boolean);
begin
  FPageNumber := Value;
  PageNumberCheckBox.Checked := Value;
end;

function TPageSetupForm.GetPrintingBorderRect: Boolean;
begin
  Result := False;
  if LeftBorder or RightBorder or TopBorder or BottomBorder then Result := True;
end;

function TPageSetupForm.GetPrintingHeaderFooter: Boolean;
begin
  Result := False;
  if OptionNoneRButton.Checked then Exit;
  if DiagramNameCheckBox.Checked or
     ProjectNameCheckBox.Checked or
     TypeNameCheckBox.Checked or
     DateTimeCheckBox.Checked or
     PageNumberCheckBox.Checked then Result := True;
end;

function TPageSetupForm.GetHeaderFooterHeight: Integer;
var
  OldFontName: TFontName;
  OldFontSize: Integer;
begin
  try
    OldFontName := Printer.Canvas.Font.Name;
    OldFontSize := Printer.Canvas.Font.Size;
    Printer.Canvas.Font.Name := HEADER_FOOTER_FONT_NAME;
    Printer.Canvas.Font.Size := HEADER_FOOTER_FONT_SIZE;
    try
      Result := Printer.Canvas.TextHeight('^_');
    finally
      Printer.Canvas.Font.Name := OldFontName;
      Printer.Canvas.Font.Size := OldFontSize;
    end;
  except on EPrinter do
    Result := Self.Canvas.TextHeight('^_');
  end;
end;

procedure TPageSetupForm.ApplyUserInputs;
begin
  // Orientation
  if LandscapeRButton.Checked then SetOrientation(dkLandscape)
  else SetOrientation(dkPortrait);
  // Borders
  SetLeftBorder(LeftBorderCheckBox.Checked);
  SetRightBorder(RightBorderCheckBox.Checked);
  SetTopBorder(TopBorderCheckBox.Checked);
  SetBottomBorder(BottomBorderCheckBox.Checked);
  SetBorderWidth(BorderWidthCombo.ItemIndex + 1);
  // Option type
  if HeaderRButton.Checked then SetOptionType(ptHeader)
  else if FooterRButton.Checked then SetOptionType(ptFooter)
  else SetOptionType(ptNone);
  SetDiagramName(DiagramNameCheckBox.Checked);
  SetProjectName(ProjectNameCheckBox.Checked);
  SetTypeName(TypeNameCheckBox.Checked);
  SetDateTime(DateTimeCheckBox.Checked);
  SetPageNumber(PageNumberCheckBox.Checked);

  // Margins and Workable size
  try
    SetUserMargin;
    SetPageWorkingSize;
  except on Exception do
    begin
      MessageDlg(ERR_MARGIN_OVERFLOW, mtError, [mbOk], 0);
      SetDefaultMargin;
      SetPageWorkingSize;
    end;
  end;
end;

procedure TPageSetupForm.UpdatePageSetup;
begin
  // Set the printing-zoom value (because of gap between screen and printer)
  SetPrintingZoom;
  // Orientation
  SetOrientation(FOrientation);
  // Margins and Workable size
  // SetPrinterDeviceValues; redundent code
  
  try
    SetUserMargin;
    SetPageWorkingSize;
  except on Exception do
    begin
      MessageDlg(ERR_MARGIN_OVERFLOW, mtError, [mbOk], 0);
      SetDefaultMargin;
      SetPageWorkingSize;
    end;
  end;
end;

// TPageSetupForm
////////////////////////////////////////////////////////////////////////////////

procedure TPageSetupForm.FormCreate(Sender: TObject);
begin
  // Set the printing-zoom value (because of gap between screen and printer)
  SetPrintingZoom;
  // Set the default margins information
  SetDefaultMargin;
  // Set the workable-space information
  SetPageWorkingSize;
  // Set direction kind
  SetDefaultOrientation;
  // Set borders
  SetLeftBorder(False);
  SetRightBorder(False);
  SetTopBorder(False);
  SetBottomBorder(False);
  SetBorderWidth(1);
  // Set options
  SetOptionType(ptNone);
  SetDiagramName(True);
  SetProjectName(True);
  SetTypeName(False);
  SetDateTime(False);
  SetPageNumber(False);

  try
    Printer.Handle;
  except on EPrinter do
    begin
      HeaderRButton.Enabled := False;
      FooterRButton.Enabled := False;
      DiagramNameCheckBox.Enabled := False;
      ProjectNameCheckBox.Enabled := False;
      PageNumberCheckBox.Enabled := False;
      TypeNameCheckBox.Enabled := False;
      DateTimeCheckBox.Enabled := False;
      TopMarginEdit.Enabled := False;
      BottomMarginEdit.Enabled := False;
      LeftMarginEdit.Enabled := False;
      RightMarginEdit.Enabled := False;
      PortraitRButton.Enabled := False;
      LandscapeRButton.Enabled := False;
      TopBorderCheckBox.Enabled := False;
      BottomBorderCheckBox.Enabled := False;
      LeftBorderCheckBox.Enabled := False;
      RightBorderCheckBox.Enabled := False;
      BorderWidthCombo.Enabled := False;
      ApplyButton.Enabled := False;
      OKButton.Enabled := False;
      //MessageDlg(ERR_CANNOT_READ_PRINTINFO,
      //            mtInformation, [mbOK], 0);
      //
      Self.Caption := ERR_CANNOT_READ_PRINTINFO;
    end;
  end;
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\PAGESET.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

procedure TPageSetupForm.FormShow(Sender: TObject);
begin
  // Fix index value getting lost
  if BorderWidthCombo.ItemIndex < 0 then
    BorderWidthCombo.ItemIndex := 0;

end;

procedure TPageSetupForm.HeaderRButtonClick(Sender: TObject);
begin
  if not DiagramNameCheckBox.Enabled then begin
    DiagramNameCheckBox.Enabled := True;
    ProjectNameCheckBox.Enabled := True;
    PageNumberCheckBox.Enabled := True;
    TypeNameCheckBox.Enabled := True;
    DateTimeCheckBox.Enabled := True;
  end;
end;

procedure TPageSetupForm.FooterRButtonClick(Sender: TObject);
begin
  if not DiagramNameCheckBox.Enabled then begin
    DiagramNameCheckBox.Enabled := True;
    ProjectNameCheckBox.Enabled := True;
    PageNumberCheckBox.Enabled := True;
    TypeNameCheckBox.Enabled := True;
    DateTimeCheckBox.Enabled := True;
  end;
end;

procedure TPageSetupForm.OptionNoneRButtonClick(Sender: TObject);
begin
  DiagramNameCheckBox.Enabled := False;
  ProjectNameCheckBox.Enabled := False;
  PageNumberCheckBox.Enabled := False;
  TypeNameCheckBox.Enabled := False;
  DateTimeCheckBox.Enabled := False;
end;

procedure TPageSetupForm.ApplyButtonClick(Sender: TObject);
begin
  ApplyUserInputs;
end;

procedure TPageSetupForm.OKButtonClick(Sender: TObject);
begin
  ApplyUserInputs;
  Close;
end;

procedure TPageSetupForm.CancelButtonClick(Sender: TObject);
begin
  // Roll-back changed status
  try
    RollbackUserMargin;
    SetOrientation(FOrientation);
    SetLeftBorder(FLeftBorder);
    SetRightBorder(FRightBorder);
    SetTopBorder(FTopBorder);
    SetBottomBorder(FBottomBorder);
    SetBorderWidth(FBorderWidth);
    SetOptionType(FOptionType);
    SetDiagramName(FDiagramName);
    SetProjectName(FProjectName);
    SetTypeName(FTypeName);
    SetDateTime(FDateTime);
    SetPageNumber(FPageNumber);
  except on EPrinter do // do nothing
  end;

  Close;
end;

procedure TPageSetupForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

end.
