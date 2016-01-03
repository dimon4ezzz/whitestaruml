unit PrintFrm;

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
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Printers,
  Core, GraphicClasses, UMLModels;

type
  // Enumeration type
  PPrintingType = (ptCurrent, ptAll, ptSelected);
  PSizeType = (stDiagram, stFitToPage, stTile);

  // TPrintForm
  TPrintForm = class(TForm)
    PrintButton: TButton;
    CancelButton: TButton;
    PrinterGroupBox: TGroupBox;
    PrinterNameLabel: TLabel;
    PrinterComboBox: TComboBox;
    PrinterStatusLabel: TLabel;
    PrinterPropertyButton: TButton;
    PrinterSetupDialog: TPrinterSetupDialog;
    PrinterWhereLabel: TLabel;
    SizeGroupBox: TGroupBox;
    RangeGroupBox: TGroupBox;
    CurrentDiagramRButton: TRadioButton;
    AllDiagramsRButton: TRadioButton;
    SelectedDiagramsRButton: TRadioButton;
    DiagramsListView: TListView;
    SelectAllButton: TButton;
    DeselectAllButton: TButton;
    AsInDiagramRButton: TRadioButton;
    FitToPageRButton: TRadioButton;
    TileRButton: TRadioButton;
    SizeWideCombo: TComboBox;
    SizeTallCombo: TComboBox;
    SizeWideLabel: TLabel;
    SizeTallLabel: TLabel;
    PageSetupButton: TButton;
    HelpButton: TButton;
    PrinterStatusMsgLabel: TLabel;
    PrinterWhereMsgLabel: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PrinterComboBoxChange(Sender: TObject);
    procedure PrinterPropertyButtonClick(Sender: TObject);
    procedure PreviewButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure RangeRadioButtonClick(Sender: TObject);
    procedure SelectAllButtonClick(Sender: TObject);
    procedure DeselectAllButtonClick(Sender: TObject);
    procedure SizeRadioButtonClick(Sender: TObject);
    procedure PageSetupButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
  private
    FActiveDiagramView: PDiagramView;
    FPrintingType: PPrintingType;
    FSizeType: PSizeType;
    FProject: PUMLProject;
    FInvalidPrint: Boolean;

    // Utility methods
    procedure InitializePrintForm;
    function GetCurrentPrinterHandle: THandle;
    procedure SetPrinterStatus;
    procedure SetSizeType(Value: PSizeType);
    procedure SetPrintingType(Value: PPrintingType);
    procedure SetPrinterInfo;
    //procedure SetCopiesInfo;
    function DeterminePrintingZoom(ARect: TRect; NumXPages, NumYPages: Integer): PZoomFactor;
    function DeterminePreviewZoom(ARect: TRect; NumXPages, NumYPages: Integer): PZoomFactor;
    // Printing methods
    procedure PrintCurrentDiagram;
    procedure PrintAllDiagrams;
    procedure PrintSelectedDiagrams;
    procedure DoPrintingJob(ADiagramView: PDiagramView);
    procedure EraseBorderOutArea(ACanvas: TCanvas);
    function GetHeaderFooterText(ADiagramView: PDiagramView; PageNum: Integer): string;
    procedure DrawHeaderFooterText(ACanvas: TCanvas; Value: string);
    procedure DrawPrintingBorderRect(ACanvas: TCanvas);
    // Previewing methods
    procedure PreviewCurrentDiagram;
    procedure PreviewAllDiagrams;
    procedure PreviewSelectedDiagrams;
    procedure MakePreviewImage(ADiagramView: PDiagramView);
    // Event Handlers
    procedure PrintPreviewFormPrintCommandHandler(Sender: TObject);
    // Property Getters/Setters
    procedure SetActiveDiagramView(Value: PDiagramView);
  public
    procedure AddDiagram(ADiagramView: PDiagramView);
    procedure Print;
    procedure Preview;
    procedure Initialize;

    property ActiveDiagramView: PDiagramView read FActiveDiagramView write SetActiveDiagramView;
    property Project: PUMLProject read FProject write FProject;
  end;

const
  DK_CLASS: string = 'Class Diagram';
  DK_USECASE: string = 'UseCase Diagram';
  DK_SEQ: string = 'Sequence Diagram';
  DK_SEQ_ROLE: string = 'Sequence Diagram (Role)';
  DK_COL: string = 'Collaboration Diagram';
  DK_COL_ROLE: string = 'Collaboration Diagram (Role)';
  DK_STATE: string = 'Statechart Diagram';
  DK_ACT: string = 'Activity Diagram';
  DK_COM: string = 'Component Diagram';
  DK_DEP: string = 'Deployment Diagram';
  
var
  PrintForm: TPrintForm;

implementation

uses
  System.UITypes, ViewCore, PrintPreviewFrm, PageSetupFrm, NLS, NLS_StarUML,
  Math, Types, WinSpool, HtmlHlp;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TPrintForm

procedure TPrintForm.InitializePrintForm;
begin
  FInvalidPrint := False;
  Initialize;
  SetSizeType(stDiagram);
  SetPrintingType(ptCurrent);
  SetPrinterInfo;
  //SetCopiesInfo;
end;

function TPrintForm.GetCurrentPrinterHandle: THandle; // Code From http://www.delmadang.com
const
  Defaults: TPrinterDefaults = (
     pDatatype : nil;
     pDevMode  : nil;
     DesiredAccess : PRINTER_ACCESS_USE or PRINTER_ACCESS_ADMINISTER);
var
  Device, Driver, Port : array[0..255] of char;
  hDeviceMode: THandle;
begin
  Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
  OpenPrinter(@Device, Result, @Defaults);
end;

procedure TPrintForm.SetPrinterStatus; // Code From http://www.delmadang.com
var
  pInfo: PPrinterInfo2;
  bytesNeeded: DWORD;
  hPrinter: THandle;
  Status: string;
  PortName: string;
  Len: Integer;
  PrinterOk: Boolean;
begin
  hPrinter := 0;
  try
    hPrinter := GetCurrentPrinterHandle;
    if hPrinter = 0 then
      Exit;
    PrinterOk := GetPrinter(hPrinter, 2, nil, 0, @bytesNeeded);
    if not PrinterOk then begin
      ClosePrinter(hPrinter);
      Exit;
    end;

    pInfo := AllocMem(bytesNeeded);
    try
      GetPrinter(hPrinter, 2, pInfo, bytesNeeded, @bytesNeeded);
      case pInfo^.Status of
        0 :                               Status := TXT_PRINTER_STATUS_READY;
        PRINTER_STATUS_PAUSED:            Status := TXT_PRINTER_STATUS_PAUSED;
        PRINTER_STATUS_ERROR:             Status := TXT_PRINTER_STATUS_ERROR;
        PRINTER_STATUS_PENDING_DELETION:  Status := TXT_PRINTER_STATUS_PENDING_DELETION;
        PRINTER_STATUS_PAPER_JAM:         Status := TXT_PRINTER_STATUS_PAPER_JAM;
        PRINTER_STATUS_PAPER_OUT:         Status := TXT_PRINTER_STATUS_PAPER_OUT;
        PRINTER_STATUS_MANUAL_FEED:       Status := TXT_PRINTER_STATUS_MANUAL_FEED;
        PRINTER_STATUS_PAPER_PROBLEM:     Status := TXT_PRINTER_STATUS_PAPER_PROBLEM;
        PRINTER_STATUS_OFFLINE:           Status := TXT_PRINTER_STATUS_OFFLINE;
        PRINTER_STATUS_IO_ACTIVE:         Status := TXT_PRINTER_STATUS_IO_ACTIVE;
        PRINTER_STATUS_BUSY:              Status := TXT_PRINTER_STATUS_BUSY;
        PRINTER_STATUS_PRINTING:          Status := TXT_PRINTER_STATUS_PRINTING;
        PRINTER_STATUS_OUTPUT_BIN_FULL:   Status := TXT_PRINTER_STATUS_OUTPUT_BIN_FULL;
        PRINTER_STATUS_NOT_AVAILABLE:     Status := TXT_PRINTER_STATUS_NOT_AVAILABLE;
        PRINTER_STATUS_WAITING:           Status := TXT_PRINTER_STATUS_WAITING;
        PRINTER_STATUS_PROCESSING:        Status := TXT_PRINTER_STATUS_PROCESSING;
        PRINTER_STATUS_INITIALIZING:      Status := TXT_PRINTER_STATUS_INITIALIZING;
        PRINTER_STATUS_WARMING_UP:        Status := TXT_PRINTER_STATUS_WARMING_UP;
        PRINTER_STATUS_TONER_LOW:         Status := TXT_PRINTER_STATUS_TONER_LOW;
        PRINTER_STATUS_NO_TONER:          Status := TXT_PRINTER_STATUS_NO_TONER;
        PRINTER_STATUS_PAGE_PUNT:         Status := TXT_PRINTER_STATUS_PAGE_PUNT;
        PRINTER_STATUS_USER_INTERVENTION: Status := TXT_PRINTER_STATUS_USER_INTERVENTION;
        PRINTER_STATUS_OUT_OF_MEMORY:     Status := TXT_PRINTER_STATUS_OUT_OF_MEMORY;
        PRINTER_STATUS_DOOR_OPEN:         Status := TXT_PRINTER_STATUS_DOOR_OPEN;
        PRINTER_STATUS_SERVER_UNKNOWN:    Status := TXT_PRINTER_STATUS_SERVER_UNKNOWN;
        PRINTER_STATUS_POWER_SAVE:        Status := TXT_PRINTER_STATUS_POWER_SAVE;
        else Status := '';
      end;
      PrinterStatusLabel.Caption := TXT_PRINT_STATUS;
      PrinterStatusMsgLabel.Caption := Status;

      if pInfo^.pPortName <> nil then begin
        PortName := pInfo^.pPortName;
        Len := Length(PortName);
        if PortName[Len] = ':' then PortName := Copy(PortName, 0, Len - 1);
        PrinterWhereLabel.Caption := TXT_PRINT_LOCATION;
        PrinterWhereMsgLabel.Caption := PortName;
      end;
    finally
      FreeMem(pInfo);
    end;
  finally
    if hPrinter <> 0 then ClosePrinter(hPrinter);
  end;
end;

procedure TPrintForm.SetPrinterInfo;
var
  I: Integer;
begin
  PrinterComboBox.Clear;
  try
    for I := 0 to Printer.Printers.Count - 1 do begin
      PrinterComboBox.Items.Add(Printer.Printers[I]);
    end;
    try
      SetPrinterStatus;
    except on Exception do
      begin
        PrinterStatusLabel.Caption := TXT_PRINT_STATUS;
        PrinterStatusMsgLabel.Caption := TXT_PRINT_STATUS_ERROR;
        PrinterWhereLabel.Caption := TXT_PRINT_STATUS;
        PrinterWhereMsgLabel.Caption := TXT_PRINT_LOCATION_ERROR;
      end;
    end;
    PrinterComboBox.ItemIndex := Printer.PrinterIndex;
  except on EPrinter do
    begin
      PrinterComboBox.Enabled := False;
      PrinterPropertyButton.Enabled := False;
      PageSetupButton.Enabled := False;
      PrintButton.Enabled := False;
      FInvalidPrint := True;
    end;
  end;
end;
{
procedure TPrintForm.SetCopiesInfo;
begin
  try
    CopiesEdit.Text := IntToStr(Printer.Copies);
  except on EPrinter do
    begin
      CopiesEdit.Enabled := False;
      CollateCheckBox.Enabled := False;
    end;
  end;
end;
}
function TPrintForm.DeterminePrintingZoom(ARect: TRect; NumXPages, NumYPages: Integer): PZoomFactor;
var
  AZoomFactor: PZoomFactor;
  HorzDiff, VertDiff: Real;
  WidthVal, HeightVal: Integer;
  ZoomRate: Real;
begin
  AZoomFactor := PageSetupForm.PrintingZoom;
  Result := AZoomFactor;

  WidthVal := PageSetupForm.PageWorkingWidth;
  HeightVal := PageSetupForm.PageWorkingHeight;
  ZoomRate := GetZoomRate(PageSetupForm.PrintingZoom);

  case FSizeType of
    // in case of stDiagram, there is no change
    stDiagram: Exit;
    // in case of stFitToPage, minimize 1 by 1.
    // if ratio is 1 by 1, there is no change
    stFitToPage: begin
      if (ARect.Right * ZoomRate <= WidthVal) and (ARect.Bottom * ZoomRate <= HeightVal) then Exit;

      HorzDiff := (ARect.Right * ZoomRate) / WidthVal;
      VertDiff := (ARect.Bottom * ZoomRate) / HeightVal;
      if HorzDiff >= VertDiff then AZoomFactor.Denom := Trunc(AZoomFactor.Denom * HorzDiff) + 1
      else AZoomFactor.Denom := Trunc(AZoomFactor.Denom * VertDiff) + 1;
      Result := AZoomFactor;
    end;
    // in case of stTile, minimize or maximize according to page number
    // (if origin size is less than page size in case of ratio is 1 by 1, minimize)
    stTile: begin
      WidthVal := WidthVal * NumXPages;
      HeightVal := HeightVal * NumYPages;
      // maximize
      if (ARect.Right * ZoomRate <= WidthVal) and (ARect.Bottom * ZoomRate <= HeightVal) then begin
        HorzDiff := WidthVal / (ARect.Right * ZoomRate);
        VertDiff := HeightVal / (ARect.Bottom * ZoomRate);
        if HorzDiff <= VertDiff then AZoomFactor.Numer := Trunc(AZoomFactor.Numer * HorzDiff)
        else AZoomFactor.Numer := Trunc(AZoomFactor.Numer * VertDiff);
        Result := AZoomFactor;
      // minimize
      end else begin
        HorzDiff := (ARect.Right * ZoomRate) / WidthVal;
        VertDiff := (ARect.Bottom * ZoomRate) / HeightVal;
        if HorzDiff >= VertDiff then AZoomFactor.Denom := Trunc(AZoomFactor.Denom * HorzDiff) + 1
        else AZoomFactor.Denom := Trunc(AZoomFactor.Denom * VertDiff) + 1;
        Result := AZoomFactor;
      end;
    end;
  end;
end;

function TPrintForm.DeterminePreviewZoom(ARect: TRect; NumXPages, NumYPages: Integer): PZoomFactor;
var
  AZoomFactor: PZoomFactor;
  HorzDiff, VertDiff: Real;
  WidthVal, HeightVal: Integer;
begin
  AZoomFactor.Numer := 100;
  AZoomFactor.Denom := 100;
  Result := AZoomFactor;

  WidthVal := PrintPreviewForm.WorkingWidth;
  HeightVal := PrintPreviewForm.WorkingHeight;

  case FSizeType of
    // in case of stDiagram, there is no change. (ZoomFactor(100, 100))
    stDiagram: Exit;
    // in case of stFitToPage, minimize 1 by 1
    // if ratio is 1 by 1, there is no change.

    stFitToPage: begin
      if (ARect.Right <= WidthVal) and (ARect.Bottom <= HeightVal) then Exit;

      HorzDiff := ARect.Right / WidthVal;
      VertDiff := ARect.Bottom / HeightVal;
      if HorzDiff >= VertDiff then AZoomFactor.Denom := Trunc(HorzDiff * 100) + 1
      else AZoomFactor.Denom := Trunc(VertDiff * 100) + 1;
      Result := AZoomFactor;
    end;
    // in case of stTile, minimize or maximize according to page number
    // if original size is less than page size, maximize
    stTile: begin
      WidthVal := WidthVal * NumXPages;
      HeightVal := HeightVal * NumYPages;
      // maximize
      if (ARect.Right <= WidthVal) and (ARect.Bottom <= HeightVal) then begin
        HorzDiff := WidthVal / ARect.Right;
        VertDiff := HeightVal / ARect.Bottom;
        if HorzDiff <= VertDiff then AZoomFactor.Numer := Trunc(HorzDiff * 100)
        else AZoomFactor.Numer := Trunc(VertDiff * 100);
        Result := AZoomFactor;
      // minimize
      end else begin
        HorzDiff := ARect.Right / WidthVal;
        VertDiff := ARect.Bottom / HeightVal;
        if HorzDiff >= VertDiff then AZoomFactor.Denom := Trunc(HorzDiff * 100) + 1
        else AZoomFactor.Denom := Trunc(VertDiff * 100) + 1;
        Result := AZoomFactor;
      end;
    end;
  end;
end;

procedure TPrintForm.PrintCurrentDiagram;
begin
  // print Activated Diagram
  if Assigned(FActiveDiagramView) then begin
    Printer.Title := TXT_PROGRAM_NAME;
    Printer.BeginDoc;
    try
      DoPrintingJob(FActiveDiagramView);
    finally
      Printer.EndDoc;
    end;
  end;
end;

procedure TPrintForm.PrintAllDiagrams;
var
  I: Integer;
  ADiagramView: PDiagramView;
begin
  // print all Diagrams
  if DiagramsListView.Items.Count > 0 then begin
    Printer.Title := TXT_PROGRAM_NAME;
    Printer.BeginDoc;
    try
      for I := 0 To DiagramsListView.Items.Count - 1 Do begin
        try
          ADiagramView := nil;
          ADiagramView := DiagramsListView.Items[I].Data;
          if Assigned(ADiagramView) and (ADiagramView.OwnedViewCount > 0) then begin
            if I > 0 then Printer.NewPage;
            DoPrintingJob(ADiagramView);
          end;
        except on Exception do
          MessageDlg(ERR_INTERNAL_ERROR, mtError, [mbOK], 0);
        end;
      end;
    finally
      Printer.EndDoc;
    end;
  end;
end;

procedure TPrintForm.PrintSelectedDiagrams;
var
  IsSelected: Boolean;
  I: Integer;
  ADiagramView: PDiagramView;
  NewPageFlag: Boolean;
begin
  IsSelected := False;
  NewPageFlag := False;
  // check that there exists selected diagram
  for I := 0 to DiagramsListView.Items.Count - 1 do begin
    if DiagramsListView.Items[I].Checked then begin
      IsSelected := True;
      Break;
    end;
  end;
  if not IsSelected then Exit;
  // print all selected diagrams in current Form
  Printer.Title := TXT_PROGRAM_NAME;
  Printer.BeginDoc;
  try
    for I := 0 To DiagramsListView.Items.Count - 1 Do begin
      try
        if DiagramsListView.Items[I].Checked then begin
          ADiagramView := nil;
          ADiagramView := DiagramsListView.Items[I].Data;
          if Assigned(ADiagramView) and (ADiagramView.OwnedViewCount > 0) then begin
            if NewPageFlag then Printer.NewPage;
            DoPrintingJob(ADiagramView);
            NewPageFlag := True;
          end;
        end;
      except on Exception do
        MessageDlg(ERR_INTERNAL_ERROR, mtError, [mbOK], 0);
      end;
    end;
  finally
    Printer.EndDoc;
  end;
end;

procedure TPrintForm.DoPrintingJob(ADiagramView: PDiagramView);
var
  ARect: TRect;
  PrintCanvas: PCanvas;
  WidthVal, HeightVal, LeftMargin, TopMargin: Integer;
  PrintingNumX, PrintingNumY: Integer;
  PageX, PageY: Integer;
  ZoomRate: Real;
  ScreenTextWidth, PrinterTextWidth: Integer;
  Str: string;
  OldFont: TFont;
begin
  if not Assigned(ADiagramView) then Exit;
  if ADiagramView.OwnedViewCount <= 0 then Exit;

  WidthVal := PageSetupForm.PageWorkingWidth;
  HeightVal := PageSetupForm.PageWorkingHeight;
  LeftMargin := PageSetupForm.LeftMargin;
  TopMargin := PageSetupForm.TopMargin;

  // calculate the number of page(image) to need
  ZoomRate := GetZoomRate(PageSetupForm.PrintingZoom);
  ARect := ADiagramView.GetBoundingBox(ADiagramView.Canvas);
  with ARect do GraphicClasses.NormalizeRect(Left, Top, Right, Bottom);
  PrintingNumX := 1;
  PrintingNumY := 1;
  case FSizeType of
    stDiagram: begin
      PrintingNumX := Trunc((ARect.Right * ZoomRate) / WidthVal) + 1;
      PrintingNumY := Trunc((ARect.Bottom * ZoomRate) / HeightVal) + 1;
    end;
    stTile: begin
      PrintingNumX := SizeWideCombo.ItemIndex + 1;
      PrintingNumY := SizeTallCombo.ItemIndex + 1;
    end;
  end;
  // calculate to display Font(Text) properly
  ScreenTextWidth := Self.Canvas.TextWidth('^_');
  PrinterTextWidth := Printer.Canvas.TextWidth('^_');
  OldFont := Printer.Canvas.Font;
  Printer.Canvas.Font.Name := ADiagramView.FontFace;
  Printer.Canvas.Font.Size := ADiagramView.FontSize;
  Printer.Canvas.Font.Color := ADiagramView.FontColor;
  Printer.Canvas.Font.Style := ADiagramView.FontStyle;
  // create PCanvas object containing Printer Canvas (need to draw Diagram)
  PrintCanvas := PCanvas.Create(Printer.Canvas);
  try
    // set Device-Factor of PCanvas object to process Font
    PrintCanvas.DeviceFactor := ScreenTextWidth / PrinterTextWidth;
    // if setting is stFitToPage or stTile, determine Zoom-Factor to apply this setting
    // (in case of stDiagram, ignored)
    PrintCanvas.ZoomFactor := DeterminePrintingZoom(ARect, PrintingNumX, PrintingNumY);

    // print pages of number calculated
    for PageY := 1 to PrintingNumY do begin
      for PageX := 1 to PrintingNumX do begin
        // at every page change, OriginX/Y of  PCanvas object are changed
        PrintCanvas.OriginX := - (PageX - 1) * WidthVal + LeftMargin;
        if ((PageSetupForm.PrintingHeaderFooter) and (PageSetupForm.OptionType = ptHeader)) then
          PrintCanvas.OriginY := - (PageY - 1) * HeightVal + TopMargin + PageSetupForm.HeaderFooterHeight
        else PrintCanvas.OriginY := - (PageY - 1) * HeightVal + TopMargin;
        // draw diagram to Printer('s Canvas) actually
        ADiagramView.Draw(PrintCanvas);
        // erase shapes drawn out of page space
        EraseBorderOutArea(Printer.Canvas);
        // add Header|Footer
        if PageSetupForm.PrintingHeaderFooter then begin
          Str := Trim(GetHeaderFooterText(ADiagramView, (PrintingNumX * (PageY - 1)) + PageX));
          if Str <> '' then DrawHeaderFooterText(Printer.Canvas, Str);
        end;
        // draw Border-Rect
        DrawPrintingBorderRect(Printer.Canvas);
        // current page is done. if pages are remained, prepare next page
        if not ((PageY = (PrintingNumY)) and (PageX = (PrintingNumX))) then Printer.NewPage;
      end;
    end;
  finally
    PrintCanvas.Free;
    Printer.Canvas.Font.Assign(OldFont);
  end;
end;

procedure TPrintForm.EraseBorderOutArea(ACanvas: TCanvas);
var
  WidthVal, HeightVal: Integer;
  LMargin, RMargin, TMargin, BMargin: Integer;
  OldPenColor, OldBrushColor: TColor;
begin
  WidthVal := PageSetupForm.PageWorkingWidth;
  HeightVal := PageSetupForm.PageWorkingHeight;
  LMargin := PageSetupForm.LeftMargin;
  RMargin := PageSetupForm.RightMargin;
  if PageSetupForm.PrintingHeaderFooter then begin
    if PageSetupForm.OptionType = ptHeader then begin
      TMargin := PageSetupForm.TopMargin + PageSetupForm.HeaderFooterHeight;
      BMargin := PageSetupForm.BottomMargin;
    end else begin
      TMargin := PageSetupForm.TopMargin;
      BMargin := PageSetupForm.BottomMargin + PageSetupForm.HeaderFooterHeight;
    end;
  end else begin
    TMargin := PageSetupForm.TopMargin;
    BMargin := PageSetupForm.BottomMargin;
  end;

  OldPenColor := ACanvas.Pen.Color;
  OldBrushColor := ACanvas.Brush.Color;

  ACanvas.Pen.Color := clWhite;
  ACanvas.Brush.Color := clWhite;
  try
    // erase left range of space
    ACanvas.FillRect(Rect(0, 0, LMargin, HeightVal + TMargin + BMargin));
    // erase top range of space
    ACanvas.FillRect(Rect(0, 0, WidthVal + LMargin + RMargin, TMargin));
    // erase right range of space
    ACanvas.FillRect(Rect(WidthVal + LMargin, 0,
            WidthVal + LMargin + RMargin, HeightVal + TMargin + BMargin));
    // erase bottom range of space
    ACanvas.FillRect(Rect(0, HeightVal + TMargin,
                 WidthVal + LMargin + RMargin , HeightVal + TMargin + BMargin));
  finally
    ACanvas.Pen.Color := OldPenColor;
    ACanvas.Brush.Color := OldBrushColor;
  end;
end;

function TPrintForm.GetHeaderFooterText(ADiagramView: PDiagramView; PageNum: Integer): string;
    function GetDiagramName(AModel: PDiagram): string;
    begin
      if AModel is PUMLClassDiagram then Result := DK_CLASS
      else if AModel is PUMLUseCaseDiagram then Result := DK_USECASE
      else if AModel is PUMLSequenceDiagram then Result := DK_SEQ
      else if AModel is PUMLSequenceRoleDiagram then Result := DK_SEQ_ROLE
      else if AModel is PUMLCollaborationDiagram then Result := DK_COL
      else if AModel is PUMLCollaborationRoleDiagram then Result := DK_COL_ROLE
      else if AModel is PUMLStatechartDiagram then Result := DK_STATE
      else if AModel is PUMLActivityDiagram then Result := DK_ACT
      else if AModel is PUMLComponentDiagram then Result := DK_COM
      else if AModel is PUMLDeploymentDiagram then Result := DK_DEP;
    end;

var
  Str: string;
  AModel: PDiagram;
begin
  Result := '';
  Str := '';
  AModel := ADiagramView.Diagram;

  with PageSetupForm do begin
    if ProjectName then begin
      if FProject.Title <> '' then Str := '    ' + FProject.Title
      else Str := '    ' + TXT_UNTITILED_PRJ;
    end;
    if DiagramName then Str := Str + '   ' + AModel.Pathname;
    if TypeName then Str := Str + '  (' + GetDiagramName(AModel) + ')';
    if DateTime then Str := Str + '   ' + FormatDateTime('yyyy-mm-dd, hh-mm-ss', Now);
    if PageNumber then Str := Str + '   ' + TXT_PRINT_PAGE + ' ' + IntToStr(PageNum);
  end;

  Result := Str;
end;

procedure TPrintForm.DrawHeaderFooterText(ACanvas: TCanvas; Value: string);
var
  OldName: TFontName;
  OldSize: Integer;
begin
  OldName := ACanvas.Font.Name;
  OldSize := ACanvas.Font.Size;
  ACanvas.Font.Name := HEADER_FOOTER_FONT_NAME;
  ACanvas.Font.Size := HEADER_FOOTER_FONT_SIZE;
  try
    with PageSetupForm do begin
      if OptionType = ptHeader then ACanvas.TextOut(LeftMargin, TopMargin, Value)
      else ACanvas.TextOut(LeftMargin, TopMargin + PageWorkingHeight, Value);
    end;
  finally
    ACanvas.Font.Name := OldName;
    ACanvas.Font.Size := OldSize;
  end;
end;

procedure TPrintForm.DrawPrintingBorderRect(ACanvas: TCanvas);
var
  WidthVal, HeightVal, LMargin, TMargin: Integer;
  LT, RT, LB, RB: TPoint;
  OldPenWidth: Integer;
  OldColor: TColor;
begin
  if not PageSetupForm.PrintingBorderRect then Exit;

  LMargin := PageSetupForm.LeftMargin;
  WidthVal := PageSetupForm.PageWorkingWidth;
  if (PageSetupForm.PrintingHeaderFooter) and (PageSetupForm.OptionType = ptHeader) then
    TMargin := PageSetupForm.TopMargin + PageSetupForm.HeaderFooterHeight
  else TMargin := PageSetupForm.TopMargin;
  HeightVal := PageSetupForm.PageWorkingHeight;

  LT := Point(LMargin, TMargin); // Left-Top
  RT := Point(LMargin + WidthVal, TMargin); // Right-Top
  LB := Point(LMargin, TMargin + HeightVal); // Left-Bottom
  RB := Point(LMargin + WidthVal, TMargin + HeightVal); // Right-Bottom

  OldPenWidth := ACanvas.Pen.Width;
  OldColor := ACanvas.Pen.Color;
  ACanvas.Pen.Width := PageSetupForm.BorderWidth;
  ACanvas.Pen.Color := clBlack;
  try
    // Left border line
    if PageSetupForm.LeftBorder then begin
      ACanvas.MoveTo(LT.X, LT.Y);
      ACanvas.LineTo(LB.X, LB.Y);
    end;
    // Top border line
    if PageSetupForm.TopBorder then begin
      ACanvas.MoveTo(LT.X, LT.Y);
      ACanvas.LineTo(RT.X, RT.Y);
    end;
    // Right border line
    if PageSetupForm.RightBorder then begin
      ACanvas.MoveTo(RT.X, RT.Y);
      ACanvas.LineTo(RB.X, RB.Y);
    end;
    // Bottom border line
    if PageSetupForm.BottomBorder then begin
      ACanvas.MoveTo(LB.X, LB.Y);
      ACanvas.LineTo(RB.X, RB.Y);
    end;
  finally
    ACanvas.Pen.Width := OldPenWidth;
    ACanvas.Pen.Color := OldColor;
  end;
end;

procedure TPrintForm.PreviewCurrentDiagram;
begin
  if Assigned(FActiveDiagramView) then MakePreviewImage(FActiveDiagramView);
end;

procedure TPrintForm.PreviewAllDiagrams;
var
  I: Integer;
  ADiagramView: PDiagramView;
begin
  for I := 0 to DiagramsListView.Items.Count - 1 do begin
    try
      ADiagramView := nil;
      ADiagramView := DiagramsListView.Items[I].Data;
      MakePreviewImage(ADiagramView);
    except on Exception do
      MessageDlg(ERR_INTERNAL_ERROR, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TPrintForm.PreviewSelectedDiagrams;
var
  I: Integer;
  ADiagramView: PDiagramView;
begin
  for I := 0 to DiagramsListView.Items.Count - 1 do begin
    if DiagramsListView.Items[I].Checked then begin
      try
        ADiagramView := nil;
        ADiagramView := DiagramsListView.Items[I].Data;
        MakePreviewImage(ADiagramView);
      except on Exception do
        MessageDlg(ERR_INTERNAL_ERROR, mtError, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TPrintForm.MakePreviewImage(ADiagramView: PDiagramView);
var
  ARect: TRect;
  ACanvas: PCanvas;
  AMetaCanvas: TMetafileCanvas;
  WidthVal, HeightVal: Integer;
  LMargin, TMargin: Integer;
  PrintingNumX, PrintingNumY: Integer;
  PageX, PageY: Integer;
  PreviewZoom: PZoomFactor;
  HeaderFooterHeight: Integer;
  Str: string;
begin
  if not Assigned(ADiagramView) then Exit;
  if ADiagramView.OwnedViewCount <= 0 then Exit;

  WidthVal := PrintPreviewForm.WorkingWidth;
  HeightVal := PrintPreviewForm.WorkingHeight;
  LMargin := PrintPreviewForm.LeftMargin;
  TMargin := PrintPreviewForm.TopMargin;
  HeaderFooterHeight := PrintPreviewForm.HeaderFooterHeight;

  // calculate the number of pages to need
  ARect := ADiagramView.GetBoundingBox(ADiagramView.Canvas);
  PrintingNumX := 1;
  PrintingNumY := 1;
  with ARect do GraphicClasses.NormalizeRect(Left, Top, Right, Bottom);
  case FSizeType of
    stDiagram: begin
      PrintingNumX := Trunc(ARect.Right / WidthVal) + 1;
      PrintingNumY := Trunc(ARect.Bottom / HeightVal) + 1;
    end;
    stTile: begin
      PrintingNumX := SizeWideCombo.ItemIndex + 1;
      PrintingNumY := SizeTallCombo.ItemIndex + 1;
    end;
  end;

  // if setting is FitToPage or Tile, determine Zoom-Factor to apply the setting
  // (in case of stDiagram, ignored)
  PreviewZoom := DeterminePreviewZoom(ARect, PrintingNumX, PrintingNumY);

  // make the number of preview image to be calculated
  for PageY := 1 to PrintingNumY do begin
    for PageX := 1 to PrintingNumX do begin
      ACanvas := PrintPreviewForm.NewPage;
      if not Assigned(ACanvas) then Continue;
      AMetaCanvas := ACanvas.Canvas as TMetafileCanvas;
      try
        ACanvas.ZoomFactor := PreviewZoom;
        // at every page changes, change OriginX/Y of PCanvas object
        ACanvas.OriginX := - (PageX - 1) * WidthVal + LMargin;
        if ((PageSetupForm.PrintingHeaderFooter) and (PageSetupForm.OptionType = ptHeader)) then
          ACanvas.OriginY := - (PageY - 1) * HeightVal + TMargin + HeaderFooterHeight
        else ACanvas.OriginY := - (PageY - 1) * HeightVal + TMargin;
        // draw Diagram to Metafile('s Canvas) actually
        ADiagramView.Draw(ACanvas);
        // erase out of page space range
        PrintPreviewForm.EraseBorderOutArea(AMetaCanvas);
        // add Header|Footer
        if PageSetupForm.PrintingHeaderFooter then begin
          Str := Trim(GetHeaderFooterText(ADiagramView, (PrintingNumX * (PageY - 1)) + PageX));
          if Str <> '' then PrintPreviewForm.DrawHeaderFooterText(AMetaCanvas, Str);
        end;
        // draw Border-Rect
        PrintPreviewForm.DrawBorderRect(AMetaCanvas);
      finally
        AMetaCanvas.Free;
        ACanvas.Free;
      end;
    end;
  end;
end;

procedure TPrintForm.PrintPreviewFormPrintCommandHandler(Sender: TObject);
begin
  Print;
  Close;
end;

procedure TPrintForm.SetActiveDiagramView(Value: PDiagramView);
var
  I: Integer;
  AnItem: TListItem;
begin
  FActiveDiagramView := Value;

  for I := 0 to DiagramsListView.Items.Count - 1 do begin
    AnItem := DiagramsListView.Items[I];
    try
      if AnItem.Data = Value then AnItem.Checked := True; 
    except on Exception do // do nothing
    end;
  end;
end;

procedure TPrintForm.SetPrintingType(Value: PPrintingType);
begin
  FPrintingType := Value;
  case FPrintingType of
    ptCurrent, ptAll:
    begin
      DiagramsListView.Enabled := False;
      DiagramsListView.Color := clBtnFace;
      SelectAllButton.Enabled := False;
      DeselectAllButton.Enabled := False;
    end;
    ptSelected:
    begin
      DiagramsListView.Enabled := True;
      DiagramsListView.Color := clWindow;
      SelectAllButton.Enabled := True;
      DeselectAllButton.Enabled := True;
    end;
  end;
end;

procedure TPrintForm.SetSizeType(Value: PSizeType);
begin
  FSizeType := Value;
  case FSizeType of
    stDiagram, stFitToPage: begin
      SizeWideCombo.Enabled := False;
      SizeTallCombo.Enabled := False;
    end;
    stTile: begin
      SizeWideCombo.Enabled := True;
      SizeTallCombo.Enabled := True;
    end;
  end;
  if SizeWideCombo.ItemIndex = -1 then
    SizeWideCombo.ItemIndex := 0;
  if SizeTallCombo.ItemIndex = -1 then
    SizeTallCombo.ItemIndex := 0;
end;

procedure TPrintForm.AddDiagram(ADiagramView: PDiagramView);
var
  AnItem: TListItem;
begin
  if Assigned(ADiagramView) then begin
    AnItem := DiagramsListView.Items.Add;
    AnItem.Caption := ADiagramView.Diagram.Name;
    AnItem.SubItems.Add(ADiagramView.Diagram.Pathname);
    AnItem.Data := ADiagramView;
  end;
end;

procedure TPrintForm.Print;
begin
  case FPrintingType of
    ptCurrent: PrintCurrentDiagram;
    ptAll: PrintAllDiagrams;
    ptSelected: PrintSelectedDiagrams;
  end;
end;

procedure TPrintForm.Preview;
var
  RZoomRate: Real;
  WidthVal, HeightVal: Integer;
  LMargin, RMargin, TMargin, BMargin: Integer;
  HeaderFooterHeight: Integer;
begin
  // Clear preview form's preview images
  PrintPreviewForm.Clear;

  // Get the reverse zoom-rate of printing zoom-rate
  RZoomRate := GetReverseZoomRate(PageSetupForm.PrintingZoom);

  // Set the preview image's size and margins
  // (Preview's Margin contains Physical Margin (Device-Marge)
  WidthVal := PageSetupForm.DeviceWidth;
  HeightVal := PageSetupForm.DeviceHeight;
  LMargin := PageSetupForm.LeftMargin + PageSetupForm.DeviceLeftMargin;
  RMargin := PageSetupForm.RightMargin + PageSetupForm.DeviceRightMargin;
  TMargin := PageSetupForm.TopMargin + PageSetupForm.DeviceTopMargin;
  BMargin := PageSetupForm.BottomMargin + PageSetupForm.DeviceBottomMargin;
  HeaderFooterHeight := PageSetupForm.HeaderFooterHeight;

  PrintPreviewForm.ImageWidth := Round(WidthVal * RZoomRate);
  PrintPreviewForm.ImageHeight := Round(HeightVal * RZoomRate);
  PrintPreviewForm.LeftMargin := Round(LMargin * RZoomRate);
  PrintPreviewForm.RightMargin := Round(RMargin * RZoomRate);
  PrintPreviewForm.TopMargin := Round(TMargin * RZoomRate);
  PrintPreviewForm.BottomMargin := Round(BMargin * RZoomRate);
  PrintPreviewForm.HeaderFooterHeight := Round(HeaderFooterHeight * RZoomRate);

  case FPrintingType of
    ptCurrent: PreviewCurrentDiagram;
    ptAll: PreviewAllDiagrams;
    ptSelected: PreviewSelectedDiagrams;
  end;
  PrintPreviewForm.ShowModal;
end;

procedure TPrintForm.Initialize;
begin
  DiagramsListView.Clear;
end;

// TPrintForm
////////////////////////////////////////////////////////////////////////////////

procedure TPrintForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\PRTFRM.LNG');
  NLSManager.TranslateComponent(Self, []);
  InitializePrintForm;

  //PrintPreviewForm := TPrintPreviewForm.Create(Self);
  try
    if Printer.PrinterIndex >= 0 then
      if Assigned(PrintPreviewForm) then
        PrintPreviewForm.OnPrintCommand := PrintPreviewFormPrintCommandHandler;
  except on EPrinter do
    begin
      PrintPreviewForm.PrintButton.Enabled := False;
      Self.Caption := ERR_CANNOT_READ_PRINTINFO;
    end;
  end;
end;

procedure TPrintForm.FormShow(Sender: TObject);
begin
  if FInvalidPrint then begin
      MessageDlg(ERR_CANNOT_READ_PRINTINFO, mtInformation, [mbOK], 0);
  end;
end;

procedure TPrintForm.PrinterComboBoxChange(Sender: TObject);
begin
  try
    Printer.PrinterIndex := PrinterComboBox.ItemIndex;
    SetPrinterStatus;
  except on Exception do
    begin
      PrinterStatusLabel.Caption := TXT_PRINT_STATUS;
      PrinterStatusMsgLabel.Caption := TXT_PRINT_STATUS_UNKNOWN;
      PrinterWhereLabel.Caption := TXT_PRINT_LOCATION;
      PrinterWhereMsgLabel.Caption := TXT_PRINT_LOCATION_UNKNOWN;
    end;
  end;
  try
    PageSetupForm.UpdatePageSetup;
  except on E: Exception do
    MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TPrintForm.PrinterPropertyButtonClick(Sender: TObject);
begin
  try
    if PrinterSetupDialog.Execute then begin
      PageSetupForm.UpdatePageSetup;
    end;
  except on E: Exception do
    MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TPrintForm.PreviewButtonClick(Sender: TObject);
begin
  Preview;
end;

procedure TPrintForm.PrintButtonClick(Sender: TObject);
begin
  Print;
  Close;
end;

procedure TPrintForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TPrintForm.RangeRadioButtonClick(Sender: TObject);
begin
  if Sender = CurrentDiagramRButton then SetPrintingType(ptCurrent)
  else if Sender = AllDiagramsRButton then SetPrintingType(ptAll)
  else if Sender = SelectedDiagramsRButton then SetPrintingType(ptSelected);
end;

procedure TPrintForm.SelectAllButtonClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DiagramsListView.Items.Count - 1 do
    DiagramsListView.Items[I].Checked := True;
end;

procedure TPrintForm.DeselectAllButtonClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DiagramsListView.Items.Count - 1 do
    DiagramsListView.Items[I].Checked := False;
end;

procedure TPrintForm.SizeRadioButtonClick(Sender: TObject);
begin
 if Sender = AsInDiagramRButton then SetSizeType(stDiagram)
 else if Sender = FitToPageRButton then SetSizeType(stFitToPage)
 else if Sender = TileRButton then SetSizeType(stTile);
end;

procedure TPrintForm.PageSetupButtonClick(Sender: TObject);
begin
  PageSetupForm.ShowModal;
end;

procedure TPrintForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

end.
