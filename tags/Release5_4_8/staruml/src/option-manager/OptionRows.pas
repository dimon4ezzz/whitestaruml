unit OptionRows;

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
  OptionNodes, OptionRowsBase,
  Classes, Controls, Types, Graphics, StdCtrls, dxInspct, dxInspRw, dxExEdtr;

const
  COLOR_CUSTOM = 'Custom';

type
  // forward declaration
  POptionItemRow = class;

  // POptionItemRowChangeEvent
  POptionItemRowChangeEvent = procedure(OptionItemRow: POptionItemRow);

  // POptionItemRow
  POptionItemRow = class(POptionItemRowBase)
  protected
    FInspectorRow: TdxInspectorRow;
    FParentRow: TdxInspectorRow;
    // override this procedure to create TdxInspectorRow and define event handlers of TdxInspectorRow
    //procedure CreateInspectorRow; virtual; abstract;
    //procedure DrawInspector; virtual; abstract;
    procedure HandleDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect;
      var AText: string; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  public
    constructor Create(AOptionItem: POptionItem; ParentRow: TdxInspectorRow);
    //procedure Refresh;
    //procedure HandleKeyPress(var Key: Char); virtual;
    //procedure HandleValueChange; virtual;
    property InspectorRow: TdxInspectorRow read FInspectorRow;
    //property OptionItem: POptionItem read FOptionItem;
    //property OnOptionItemRowChange: POptionItemRowChangeEvent read FOnOptionItemRowChange write FOnOptionItemRowChange;
  end;

  // PIntegerOptionItemRow
  PIntegerOptionItemRow = class(POptionItemRow)
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure HandleKeyPress(var Key: Char); override;
    procedure HandleValueChange; override;
  end;

  // PRealOptionItemRow
  PRealOptionItemRow = class(POptionItemRow)
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure HandleKeyPress(var Key: Char); override;
    procedure HandleValueChange; override;
  end;

  // PStringOptionItemRow
  PStringOptionItemRow = class(POptionItemRow)
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure HandleValueChange; override;
  end;

  // PBooleanOptionItemRow
  PBooleanOptionItemRow = class(POptionItemRow)
  private
    procedure RowToggleClick(Sender: TObject; const Text: string; State: TdxCheckBoxState);
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  end;

  // PTextOptionItemRow
  PTextOptionItemRow = class(POptionItemRow)
  private
    TextMemo: TMemo;
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
    procedure RowPopup(Sender: TObject; const EditText: string);
    procedure RowCloseUp(Sender: TObject; var Text: string; var Accept: Boolean);
  public
    destructor Destroy; override;
  end;

  // PEnumerationOptionItemRow
  PEnumerationOptionItemRow = class(POptionItemRow)
  private
    procedure RowCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  end;

  // PFontNameOptionItemRow
  PFontNameOptionItemRow = class(POptionItemRow)
  private
    procedure RowCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  end;

  // PFileNameOptionItemRow
  PFileNameOptionItemRow = class(POptionItemRow)
  private
    procedure RowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure HandleValueChange; override;
  end;

  // PPathNameOptionItemRow
  PPathNameOptionItemRow = class(POptionItemRow)
  private
    procedure RowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public    
    procedure HandleValueChange; override;
  end;

  // PColorOptionItemRow
  PColorOptionItemRow = class(POptionItemRow)
  private
    ColorImages: TImageList;
    function GetColorIndex(ColorStr: string): Integer;
    procedure AddColor(ColorStr: string);
    procedure RowCloseUp(Sender: TObject; var Value: string; var Accept: Boolean);
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    destructor Destroy; override;
  end;

  // PRangeOptionItemRow
  PRangeOptionItemRow = class(POptionItemRow)
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure HandleValueChange; override;
  end;

implementation

uses
  OptionMgrAux, PVariants, NLS_OPTMGR,
  Forms, Dialogs, SysUtils, dxCntner;

////////////////////////////////////////////////////////////////////////////////
// POptionItemRow

constructor POptionItemRow.Create(AOptionItem: POptionItem; ParentRow: TdxInspectorRow);
begin
  inherited Create(AOptionItem);
  FParentRow := ParentRow;
  CreateInspectorRow;
  FInspectorRow.OnDrawCaption := HandleDrawCaption;
end;



procedure POptionItemRow.HandleDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect;
  var AText: string; AFont: TFont; var AColor: TColor; var ADone: Boolean);
begin
  if FOptionItem.Changed then
    AFont.Style := [fsBold]
  else
    AFont.Style := [];
end;

// POptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PIntegerOptionItemRow

procedure PIntegerOptionItemRow.CreateInspectorRow;
begin
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextRow).Row;
  DrawInspector;
end;

procedure PIntegerOptionItemRow.DrawInspector;
var
  TextRow: TdxInspectorTextRow;
begin
  FInspectorRow.Caption := FOptionItem.Caption;
  TextRow := FInspectorRow as TdxInspectorTextRow;
  TextRow.Text := FOptionItem.Value;
end;

procedure PIntegerOptionItemRow.HandleKeyPress(var Key: Char);
begin
  if (Key < '0') or (Key > '9') then
    Key := #0;
end;

procedure PIntegerOptionItemRow.HandleValueChange;
var
  CurText: string;
begin
  CurText := (FInspectorRow as TdxInspectorTextRow).Text;
  try
    if StrToInt(CurText) <> FOptionItem.Value then begin
      FOptionItem.Value := StrToInt(CurText);
      Refresh;
      if Assigned(FOnOptionItemRowChange) then
        FOnOptionItemRowChange(Self);
    end;
  except
    on EConvertError do begin
      POptionManagerMessages.InvalidValue(FOptionItem.Caption);
      (FInspectorRow as TdxInspectorTextRow).Text := IntToStr(FOptionItem.Value);
    end;
  end;
end;

// PIntegerOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PRealOptionItemRow

procedure PRealOptionItemRow.CreateInspectorRow;
begin
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextRow).Row;
  DrawInspector;
end;

procedure PRealOptionItemRow.DrawInspector;
var
  TextRow: TdxInspectorTextRow;
begin
  FInspectorRow.Caption := FOptionItem.Caption;
  TextRow := FInspectorRow as TdxInspectorTextRow;
  TextRow.Text := FOptionItem.Value;
end;

procedure PRealOptionItemRow.HandleKeyPress(var Key: Char);
begin
  if not (((Key >= '0') and (Key <= '9')) or (Key = '.')) then
    Key := #0;
end;

procedure PRealOptionItemRow.HandleValueChange;
var
  CurText: string;
begin
  CurText := (FInspectorRow as TdxInspectorTextRow).Text;
  try
    if StrToFloat(CurText) <> FOptionItem.Value then begin
      FOptionItem.Value := StrToFloat(CurText);
      Refresh;
      if Assigned(FOnOptionItemRowChange) then
        FOnOptionItemRowChange(Self);
    end;
  except
    on EConvertError do begin
      POptionManagerMessages.InvalidValue(FOptionItem.Caption);
      (FInspectorRow as TdxInspectorTextRow).Text := FloatToStr(FOptionItem.Value);
    end;
  end;
end;

// PRealOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PStringOptionItemRow

procedure PStringOptionItemRow.CreateInspectorRow;
begin
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextRow).Row;
  DrawInspector;
end;

procedure PStringOptionItemRow.DrawInspector;
var
  TextRow: TdxInspectorTextRow;
begin
  FInspectorRow.Caption := FOptionItem.Caption;
  TextRow := FInspectorRow as TdxInspectorTextRow;
  TextRow.Text := FOptionItem.Value;
end;

procedure PStringOptionItemRow.HandleValueChange;
var
  CurText: string;
begin
  CurText := (FInspectorRow as TdxInspectorTextRow).Text;
  if CurText <> FOptionItem.Value then begin
    FOptionItem.Value := CurText;
    Refresh;
    if Assigned(FOnOptionItemRowChange) then
      FOnOptionItemRowChange(Self);
  end;
end;

// PStringOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PBooleanOptionItemRow

procedure PBooleanOptionItemRow.RowToggleClick(Sender: TObject; const Text: string; State: TdxCheckBoxState);
begin
  if State = cbsChecked then
    FOptionItem.Value := True
  else if State = cbsUnChecked then
    FOptionItem.Value := False;
  Refresh;
  if Assigned(FOnOptionItemRowChange) then
    FOnOptionItemRowChange(Self);
end;

procedure PBooleanOptionItemRow.CreateInspectorRow;
var
  CheckRow: TdxInspectorTextCheckRow;
begin
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextCheckRow).Row;
  CheckRow := FInspectorRow as TdxInspectorTextCheckRow;
  CheckRow.ValueChecked := VALUE_TRUE;
  CheckRow.ValueUnchecked := VALUE_FALSE;
  DrawInspector;
end;

procedure PBooleanOptionItemRow.DrawInspector;
var
  CheckRow: TdxInspectorTextCheckRow;
begin
  FInspectorRow.Caption := FOptionItem.Caption;
  CheckRow := FInspectorRow as TdxInspectorTextCheckRow;
  CheckRow.Text := FOptionItem.Value;
  CheckRow.OnToggleClick := RowToggleClick;
end;

// PBooleanOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PTextOptionItemRow

destructor PTextOptionItemRow.Destroy;
begin
  TextMemo.Free;
  inherited;
end;

procedure PTextOptionItemRow.CreateInspectorRow;
var
  PopupRow: TdxInspectorTextPopupRow;
begin
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextPopupRow).Row;
  TextMemo := TMemo.Create(Application);
  TextMemo.Width := 300;
  TextMemo.Height := 200;
  TextMemo.WantReturns := True;
  TextMemo.WantTabs := True;
  TextMemo.Font.Name := 'Tahoma';
  PopupRow := FInspectorRow as TdxInspectorTextPopupRow;
  PopupRow.PopupControl := TextMemo;
  PopupRow.ReadOnly := True;
  PopupRow.PopupFormCaption := TXT_EDIT_VALUE;
  PopupRow.OnPopup := RowPopup;
  PopupRow.OnCloseUp := RowCloseUp;
  DrawInspector;
end;

procedure PTextOptionItemRow.DrawInspector;
var
  PopupRow: TdxInspectorTextPopupRow;
begin
  FInspectorRow.Caption := FOptionItem.Caption;
  PopupRow := FInspectorRow as TdxInspectorTextPopupRow;
  if (Pos(#10, FOptionItem.Value) > 0) or (Pos(#13, FOptionItem.Value) > 0) then
    PopupRow.Text := TXT_TEXT
  else
    PopupRow.Text := FOptionItem.Value;
end;

procedure PTextOptionItemRow.RowPopup(Sender: TObject; const EditText: string);
begin
  TextMemo.Lines.Text := FOptionItem.Value;
end;

procedure PTextOptionItemRow.RowCloseUp(Sender: TObject; var Text: string; var Accept: Boolean);
begin
  FOptionItem.Value := TextMemo.Lines.Text;
  Refresh;
  if Assigned(FOnOptionItemRowChange) then
    FOnOptionItemRowChange(Self);
end;

// PTextOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PEnumerationOptionItemRow

procedure PEnumerationOptionItemRow.RowCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
var
  Idx: Integer;
begin
  Idx := (FOptionItem as PEnumerationOptionItem).IndexOfItem(Value);
  if Idx <> FOptionItem.Value then begin
    FOptionItem.Value := Idx;
    Refresh;
    if Assigned(FOnOptionItemRowChange) then
      FOnOptionItemRowChange(Self);
  end;
end;

procedure PEnumerationOptionItemRow.CreateInspectorRow;
var
  PickRow: TdxInspectorTextPickRow;
  EOI: PEnumerationOptionItem;
  I: Integer;
begin
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextPickRow).Row;
  PickRow := FInspectorRow as TdxInspectorTextPickRow;
  EOI := FOptionItem as PEnumerationOptionItem;
  for I := 0 to EOI.EnumerationItemCount - 1 do
    PickRow.Items.Add(EOI.EnumerationItems[I]);
  PickRow.DropDownListStyle := True;
  PickRow.PopupBorder := pbFlat;
  PickRow.OnCloseUp := RowCloseUp;
  DrawInspector;
end;

procedure PEnumerationOptionItemRow.DrawInspector;
var
  PickRow: TdxInspectorTextPickRow;
begin
  FInspectorRow.Caption := FOptionItem.Caption;
  PickRow := FInspectorRow as TdxInspectorTextPickRow;
  PickRow.Text := (FOptionItem as PEnumerationOptionItem).EnumerationItems[FOptionItem.Value];
end;

// PEnumerationOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PFontNameOptionItemRow

procedure PFontNameOptionItemRow.RowCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
begin
  if Value <> FOptionItem.Value then begin
    FOptionItem.Value := Value;
    Refresh;
    if Assigned(FOnOptionItemRowChange) then
      FOnOptionItemRowChange(Self);
  end;
end;

procedure PFontNameOptionItemRow.CreateInspectorRow;
var
  PickRow: TdxInspectorTextPickRow;
begin
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextPickRow).Row;
  PickRow := FInspectorRow as TdxInspectorTextPickRow;
  PickRow.Items.Assign(Screen.Fonts);
  PickRow.DropDownListStyle := True;
  PickRow.PopupBorder := pbFlat;
  PickRow.OnCloseUp := RowCloseUp;
  DrawInspector;
end;

procedure PFontNameOptionItemRow.DrawInspector;
var
  PickRow: TdxInspectorTextPickRow;
begin
  FInspectorRow.Caption := FOptionItem.Caption;
  PickRow := FInspectorRow as TdxInspectorTextPickRow;
  PickRow.Text := FOptionItem.Value;
end;

// PFontNameOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PFileNameOptionItemRow

procedure PFileNameOptionItemRow.RowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
var
  OpenDialog: TOpenDialog;
begin
  OpenDialog := TOpenDialog.Create(Application);
  if OpenDialog.Execute then begin
    FOptionItem.Value := OpenDialog.FileName;
    Refresh;
    if Assigned(FOnOptionItemRowChange) then
      FOnOptionItemRowChange(Self);
  end;
  OpenDialog.Free;
end;

procedure PFileNameOptionItemRow.CreateInspectorRow;
var
  ButtonRow: TdxInspectorTextButtonRow;
begin
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextButtonRow).Row;
  ButtonRow := FInspectorRow as TdxInspectorTextButtonRow;
  ButtonRow.OnButtonClick := RowButtonClick;
  DrawInspector;
end;

procedure PFileNameOptionItemRow.DrawInspector;
var
  ButtonRow: TdxInspectorTextButtonRow;
begin
  FInspectorRow.Caption := FOptionItem.Caption;
  ButtonRow := FInspectorRow as TdxInspectorTextButtonRow;
  ButtonRow.Text := FOptionItem.Value;
end;

procedure PFileNameOptionItemRow.HandleValueChange;
var
  CurText: string;
begin
  CurText := (FInspectorRow as TdxInspectorTextButtonRow).Text;
  if CurText <> FOptionItem.Value then begin
    FOptionItem.Value := CurText;
    Refresh;
    if Assigned(FOnOptionItemRowChange) then
      FOnOptionItemRowChange(Self);
  end;
end;

// PFileNameOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PPathNameOptionItemRow

procedure PPathNameOptionItemRow.RowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
var
  DirDialog: PDirectoryDialog;
begin
  DirDialog := PDirectoryDialog.Create(Application);
  if DirDialog.Execute then begin
    FOptionItem.Value := DirDialog.DirName;
    Refresh;
    if Assigned(FOnOptionItemRowChange) then
      FOnOptionItemRowChange(Self);
  end;
  DirDialog.Free;
end;

procedure PPathNameOptionItemRow.CreateInspectorRow;
var
  ButtonRow: TdxInspectorTextButtonRow;
begin
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextButtonRow).Row;
  ButtonRow := FInspectorRow as TdxInspectorTextButtonRow;
  ButtonRow.OnButtonClick := RowButtonClick;
  DrawInspector;
end;

procedure PPathNameOptionItemRow.DrawInspector;
var
  ButtonRow: TdxInspectorTextButtonRow;
begin
  FInspectorRow.Caption := FOptionItem.Caption;
  ButtonRow := FInspectorRow as TdxInspectorTextButtonRow;
  ButtonRow.Text := FOptionItem.Value;
end;

procedure PPathNameOptionItemRow.HandleValueChange;
var
  CurText: string;
begin
  CurText := (FInspectorRow as TdxInspectorTextButtonRow).Text;
  if CurText <> FOptionItem.Value then begin
    FOptionItem.Value := CurText;
    Refresh;
    if Assigned(FOnOptionItemRowChange) then
      FOnOptionItemRowChange(Self);
  end;
end;

// PPathNameOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PColorOptionItemRow

destructor PColorOptionItemRow.Destroy;
begin
  ColorImages.Free;
  inherited;
end;

function PColorOptionItemRow.GetColorIndex(ColorStr: string): Integer;
var
  ImageRow: TdxInspectorTextImageRow;
  I: Integer;
begin
  Result := -1;
  ImageRow := FInspectorRow as TdxInspectorTextImageRow;
  for I := 0 to ImageRow.Values.Count - 1 do
    if ImageRow.Values[I] = ColorStr then begin
      Result := I;
      Exit;
    end;
end;

procedure PColorOptionItemRow.AddColor(ColorStr: string);
var
  ImageRow: TdxInspectorTextImageRow;
  Bitmap: Graphics.TBitmap;
  Index: Integer;
begin
  if GetColorIndex(ColorStr) = -1 then begin
    ImageRow := FInspectorRow as TdxInspectorTextImageRow;
    Bitmap := Graphics.TBitmap.Create;
    Bitmap.Width := 12; Bitmap.Height := 12;
    Bitmap.Canvas.Brush.Color := ColorValue(ColorStr);
    Bitmap.Canvas.Pen.Color := clGray;
    Bitmap.Canvas.FillRect(Rect(0, 0, 12, 12));
    Bitmap.Canvas.Rectangle(0, 0, 12, 12);
    ImageRow.Images.AddMasked(Bitmap, clNone);
    Index := ImageRow.Values.Count - 1;
    ImageRow.Values.Insert(Index, ColorStr);
    ImageRow.Descriptions.Insert(Index, ColorStr);
  end;
end;

procedure PColorOptionItemRow.RowCloseUp(Sender: TObject; var Value: string; var Accept: Boolean);
var
  ColorDialog: TColorDialog;
  ColorStr: string;
begin
  if Value = COLOR_CUSTOM then begin
    ColorDialog := TColorDialog.Create(Application);
    if ColorDialog.Execute then begin
      ColorStr := ColorToStr(ColorDialog.Color);
      if GetColorIndex(ColorStr) = -1 then
        AddColor(ColorStr);
      FOptionItem.Value := ColorStr;
    end;
    Accept := False;
    ColorDialog.Free;
  end
  else
    FOptionItem.Value := Value;
  Refresh;
  if Assigned(FOnOptionItemRowChange) then
    FOnOptionItemRowChange(Self);
end;

procedure PColorOptionItemRow.CreateInspectorRow;
var
  ImageRow: TdxInspectorTextImageRow;
  Bitmap: Graphics.TBitmap;
  I: Integer;
begin
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextImageRow).Row;
  ColorImages := TImageList.Create(Application);
  ColorImages.Width := 12;
  ColorImages.Height := 12;
  for I := 0 to Length(Colors) - 1 do begin
    Bitmap := Graphics.TBitmap.Create;
    Bitmap.Width := 12; Bitmap.Height := 12;
    Bitmap.Canvas.Brush.Color := Colors[I];
    Bitmap.Canvas.Pen.Color := clGray;
    Bitmap.Canvas.FillRect(Rect(0, 0, 12, 12));
    Bitmap.Canvas.Rectangle(0, 0, 12, 12);
    ColorImages.AddMasked(Bitmap, clNone);
  end;

  ImageRow := FInspectorRow as TdxInspectorTextImageRow;
  ImageRow.Images := ColorImages;
  for I := 0 to Length(ColorNames) - 1 do begin
    ImageRow.Values.Add(ColorToStr(Colors[I]));
    ImageRow.Descriptions.Add(ColorNames[I]);
  end;
  ImageRow.Values.Add(COLOR_CUSTOM);
  ImageRow.Descriptions.Add(TXT_COLOR_CUSTOM);
  ImageRow.OnCloseUp := RowCloseUp;

  DrawInspector;
end;

procedure PColorOptionItemRow.DrawInspector;
var
  ImageRow: TdxInspectorTextImageRow;
begin
  FInspectorRow.Caption := FOptionItem.Caption;
  ImageRow := FInspectorRow as TdxInspectorTextImageRow;
  if GetColorIndex(FOptionItem.Value) = -1 then
    AddColor(FOptionItem.Value);
  ImageRow.Text := FOptionItem.Value;
end;

// PColorOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PRangeOptionItemRow

procedure PRangeOptionItemRow.CreateInspectorRow;
var
  SpinRow: TdxInspectorTextSpinRow;
begin
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextSpinRow).Row;
  SpinRow := FInspectorRow as TdxInspectorTextSpinRow;
  SpinRow.Text := FOptionItem.Value;
  SpinRow.MinValue := (FOptionItem as PRangeOptionItem).MinValue;
  SpinRow.MaxValue := (FOptionItem as PRangeOptionItem).MaxValue;
  SpinRow.Increment := (FOptionItem as PRangeOptionItem).Step;
  DrawInspector;
end;

procedure PRangeOptionItemRow.DrawInspector;
var
  SpinRow: TdxInspectorTextSpinRow;
begin
  FInspectorRow.Caption := FOptionItem.Caption;
  SpinRow := FInspectorRow as TdxInspectorTextSpinRow;
  SpinRow.Text := FOptionItem.Value;
end;

procedure PRangeOptionItemRow.HandleValueChange;
begin
  FOptionItem.Value := (FInspectorRow as TdxInspectorTextSpinRow).Text;
  Refresh;
  if Assigned(FOnOptionItemRowChange) then
    FOnOptionItemRowChange(Self);
end;

// PRangeOptionItemRow
////////////////////////////////////////////////////////////////////////////////

end.
