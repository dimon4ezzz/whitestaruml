unit JvclExtensions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, JvExControls,
  JvInspector, JvInspExtraEditors, StdCtrls, ImgList,Generics.Collections;

type

  TStringEnumItem = type string;

  TJvInspectorStringEnumItem = class(TJvInspectorEnumItem)
  private
    FValueTextList : TStringList;
  protected
    function GetDisplayValue: string; override;
    procedure GetValueList(const Strings: TStrings); override;
    procedure SetDisplayValue(const Value: string); override;
  public
    constructor Create(const AParent: TJvCustomInspectorItem;
      const AData: TJvCustomInspectorData); override;
    destructor Destroy; override;
    class procedure RegisterAsDefaultItem;
    class procedure UnregisterAsDefaultItem;
    property ValueTexts: TStringList read FValueTextList write FValueTextList;
  end;

  TMultilineStringItem = class
  end;

  TJvInspectorMultilineStringItem = class(TJvInspectorTStringsItem)
  public type
    TStringModifiedEvent = procedure(ModifiedString: String) of object;
  protected
    const EmptyLineDisplayText = '(empty)';
    const MultiLineDisplayText = '(multiline)';

  private
    FLongLine : String;
    FMultilineText : TStringList;
    FOnTextModifiedWithEditor: TStringModifiedEvent;
    FOnTextModifiedInline: TStringModifiedEvent;
    procedure SetNewString(NewString: string);
    procedure UpdateFlags();
  protected
    procedure Edit; override;
    function GetDisplayValue: string; override;
    procedure SetDisplayValue(const Value: string); override;
  public
    constructor Create(const AParent: TJvCustomInspectorItem;
    const AData: TJvCustomInspectorData); override;
    destructor Destroy; override;
    procedure InvokeOnTextModifiedInlineHandler();
    class procedure RegisterAsDefaultItem;
    class procedure UnregisterAsDefaultItem;
    property NewString: string write SetNewString;
    property OnTextModifiedWithEditor: TStringModifiedEvent read FOnTextModifiedWithEditor write FOnTextModifiedWithEditor;
    property OnTextModifiedInline: TStringModifiedEvent read FOnTextModifiedInline write FOnTextModifiedInline;
  end;




  TImageText = type string;

{ TImageList image text editor. Will render the image next to the value }
  TJvInspectorTImageTextItem = class(TJvCustomInspectorItem)
  private
    FValueImageList: TCustomImageList;
    FValueTextList : TStringList;
    FNameImageList: TCustomImageList;
    FNameImageIdx: Integer;
  protected
    {procedure PaintAreaContent(const ImgNum: Integer; const ImgName: string; const ACanvas: TCanvas;
      const ARect: TRect; const AreaType: TInspectorPaintRect; const ImageList: TCustomImageList );}
    procedure DoDrawListItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState); override;

    procedure DoMeasureListItem(Control: TWinControl; Index: Integer; var Height: Integer); override;
    procedure DoMeasureListItemWidth(Control: TWinControl; Index: Integer; var Width: Integer); override;
    function GetDisplayValue: string; override;
    procedure GetValueList(const Strings: TStrings); override;
    procedure SetDisplayValue(const Value: string); override;
    procedure SetFlags(const Value: TInspectorItemFlags); override;
    procedure SetRects(const RectKind: TInspectorPaintRect; Value: TRect); override;
  public
    //constructor Create(const AParent: TJvCustomInspectorItem; const AData: TJvCustomInspectorData); override;
    destructor Destroy; override;
    procedure DrawName(const ACanvas: TCanvas); override;
    procedure DrawValue(const ACanvas: TCanvas); override;
    class procedure RegisterAsDefaultItem;
    class procedure UnregisterAsDefaultItem;
    property ValueImages: TCustomImageList read FValueImageList write FValueImageList;
    property ValueTexts: TStringList read FValueTextList write FValueTextList;
    property NameImages: TCustomImageList read FNameImageList write FNameImageList;
    property NameImageIdx: Integer read FNameImageIdx write FNameImageIdx;
  end;

  TStringItemWithNameImage = type string;

  TJvInspectorStringItemWithNameImage = class(TJvInspectorStringItem)
  private
    FNameImageList: TCustomImageList;
    FNameImageIdx: Integer;
  public
    procedure DrawName(const ACanvas: TCanvas); override;
    class procedure RegisterAsDefaultItem;
    class procedure UnregisterAsDefaultItem;
    property NameImages: TCustomImageList read FNameImageList write FNameImageList;
    property NameImageIdx: Integer read FNameImageIdx write FNameImageIdx;
  end;

  TMultiStringItemWithNameImage = class
  end;

  TJvInspectorMultiStringItemWithNameImage = class(TJvInspectorMultilineStringItem)
  private
    FNameImageList: TCustomImageList;
    FNameImageIdx: Integer;
  public
    procedure DrawName(const ACanvas: TCanvas); override;
    class procedure RegisterAsDefaultItem;
    class procedure UnregisterAsDefaultItem;
    property NameImages: TCustomImageList read FNameImageList write FNameImageList;
    property NameImageIdx: Integer read FNameImageIdx write FNameImageIdx;
  end;

  TBooleanItemWithNameImage = type Boolean;

  TJvInspectorBooleanItemWithNameImage = class(TJvInspectorBooleanItem)
  private
    FNameImageList: TCustomImageList;
    FNameImageIdx: Integer;
  public
    procedure DrawName(const ACanvas: TCanvas); override;
    class procedure RegisterAsDefaultItem;
    class procedure UnregisterAsDefaultItem;
    property NameImages: TCustomImageList read FNameImageList write FNameImageList;
    property NameImageIdx: Integer read FNameImageIdx write FNameImageIdx;
  end;

  // Container connecting TJvCustomInspectorItem with its data storage
  TJvInspectorElemBase = class
  private
    FItem: TJvCustomInspectorItem;
  public
    property Item: TJvCustomInspectorItem read FItem write FItem;
  end;

  TJvInspectorElem<T> = class(TJvInspectorElemBase)
  private
    FData: T;
  public
    class function CreateElem(CategoryNode: TJvInspectorCustomCategoryItem;
      Name: string): TJvInspectorElem<T>;
    property RawData: T read FData write FData;
  end;

  // TJvCustomInspector does not manage storage for its item values
  // InspectorElemsHolder manages a list of pairs item - value storage
  TInspectorElemsHolder = class(TEnumerable<TJvInspectorElemBase>)
  //TInspectorElemsHolder = class(TEnumerable<TPair<TJvCustomInspectorItem,TJvInspectorElemBase>>)
  private type
    TElemList = TList<TJvInspectorElemBase>;
    //TElemList = TDictionary<TJvCustomInspectorItem, TJvInspectorElemBase>;
  private
    FInspector: TJvCustomInspector;
    FElemList: TElemList;
  protected
    function DoGetEnumerator: TEnumerator<TJvInspectorElemBase>; override;
    //function DoGetEnumerator: TEnumerator<TPair<TJvCustomInspectorItem,TJvInspectorElemBase>>; override;
  public
    constructor Create(Inspector: TJvCustomInspector);
    destructor Destroy; override;
    procedure AddElem(Elem: TJvInspectorElemBase);
    procedure EmptyElemList;
    //function FindElem(Item: TJvCustomInspectorItem): TJvInspectorElemBase;
  end;

   { TColor item editor. Will render the color in a box, together with the name/value }
  TNamedColor = type TColor;
  TJvInspectorNamedColorItem = class(TJvCustomInspectorItem)
  private
    FColors: TStringList;
  protected
    function BorderColor(const ABackgroundColor, AInternalColor: TColor): TColor;
    procedure PaintValue(const Color: TColor; const ColorName: string; const ACanvas: TCanvas;
      const ARect: TRect);
    procedure DoDrawListItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState); override;

    procedure DoMeasureListItem(Control: TWinControl; Index: Integer; var Height: Integer); override;
    procedure DoMeasureListItemWidth(Control: TWinControl; Index: Integer; var Width: Integer); override;
    function GetDisplayValue: string; override;
    procedure GetValueList(const Strings: TStrings); override;
    procedure SetDisplayValue(const Value: string); override;
    procedure SetFlags(const Value: TInspectorItemFlags); override;
    procedure SetRects(const RectKind: TInspectorPaintRect; Value: TRect); override;
  public
    constructor Create(const AParent: TJvCustomInspectorItem;
      const AData: TJvCustomInspectorData); override;
    procedure AddColor(const ColorName: string; const ColorValue: TColor);
    procedure BeforeDestruction; override;
    procedure DrawValue(const ACanvas: TCanvas); override;
    class procedure RegisterAsDefaultItem;
    class procedure UnregisterAsDefaultItem;
  end;



implementation

uses
  System.UITypes,
  System.TypInfo,
  JclRTTI,
  JvResources;

type

  TColorQuad = packed record
    Red: Byte;
    Green: Byte;
    Blue: Byte;
    Alpha: Byte;
  end;



class procedure TJvInspectorStringEnumItem.RegisterAsDefaultItem;
begin
  with TJvCustomInspectorData.ItemRegister do
  begin
    if IndexOf(Self) = -1 then
      Add(TJvInspectorTypeInfoRegItem.Create(Self, TypeInfo(TStringEnumItem)));
  end;
end;

class procedure TJvInspectorStringEnumItem.UnregisterAsDefaultItem;
begin
  TJvCustomInspectorData.ItemRegister.Delete(Self);
end;

function TJvInspectorStringEnumItem.GetDisplayValue: string;
begin
  if Data.AsString = '' then
    Result := ValueTexts[0]
  else
    Result := Data.AsString;
end;

procedure TJvInspectorStringEnumItem.GetValueList(const Strings: TStrings);
begin
  Strings.AddStrings(ValueTexts);
end;

procedure TJvInspectorStringEnumItem.SetDisplayValue(const Value: string);
begin
  Data.AsString := Value;
end;

constructor TJvInspectorStringEnumItem.Create(const AParent: TJvCustomInspectorItem;
      const AData: TJvCustomInspectorData);

begin
  inherited Create(AParent,AData);
  FValueTextList := TStringList.Create;
end;

destructor TJvInspectorStringEnumItem.Destroy;
begin
  FValueTextList.Free;
  inherited;
end;


constructor TJvInspectorMultilineStringItem.Create(const AParent: TJvCustomInspectorItem;
      const AData: TJvCustomInspectorData);

begin
  FMultilineText := TStringList.Create;
  AData.AsOrdinal := Integer(FMultilineText);
  inherited Create(AParent,AData);
end;

destructor TJvInspectorMultilineStringItem.Destroy;
begin
  FMultilineText.Free;
  inherited;
end;

class procedure TJvInspectorMultilineStringItem.RegisterAsDefaultItem;
begin
  with TJvCustomInspectorData.ItemRegister do
  begin
    if IndexOf(Self) = -1 then
      Add(TJvInspectorTypeInfoRegItem.Create(Self, TypeInfo(TMultilineStringItem)));
  end;
end;

class procedure TJvInspectorMultilineStringItem.UnregisterAsDefaultItem;
begin
  TJvCustomInspectorData.ItemRegister.Delete(Self);
end;

procedure TJvInspectorMultilineStringItem.UpdateFlags;
begin
  // Update flags to reflect multiline tate
  if FMultilineText.Count > 1 then
    Flags := Flags + [iifEditFixed]
  else
    Flags := Flags - [iifEditFixed];
end;

procedure TJvInspectorMultilineStringItem.SetDisplayValue(const Value: string);
begin
  if not (iifEditFixed in Flags) then begin
    case FMultilineText.Count of
      0:
          FMultilineText.Add(Value);
      1:
          begin
            if (Value = '') then
              FMultilineText.Delete(0)
            else
              FMultilineText[0] := Value;
          end;
    end;
  end;
end;


procedure TJvInspectorMultilineStringItem.SetNewString(NewString: string);
begin
  FLongLine := NewString;
  FMultilineText.Text := NewString;
  UpdateFlags;
end;

procedure TJvInspectorMultilineStringItem.Edit;
var
  SelectedIdx: Integer;
begin
  // Line was updated before launching dialog
  if (FMultilineText.Count = 0)
    and (EditCtrl.Text <> EmptyLineDisplayText) and (EditCtrl.Text <> '') then
    FMultilineText.Add(EditCtrl.Text)
  else if (FMultilineText.Count = 1) and (EditCtrl.Text <> FMultilineText[0]) then
    FMultilineText[0] := EditCtrl.Text;

  inherited; // Process text input dialog

  if FMultilineText.Text <> FLongLine then begin
    FLongLine := TrimRight(FMultilineText.Text); // Get rid of trailing line separators

    if Assigned(FOnTextModifiedWithEditor) then
      FOnTextModifiedWithEditor(FLongLine);

    UpdateFlags;

    EditCtrl.Text := GetDisplayValue; // Update text in input control

    // Force refresh of item flags with deselecting/reselecting current item
    SelectedIdx := (GetInspector() as TJvInspector).SelectedIndex;
    (GetInspector() as TJvInspector).SelectedIndex := -1; // Dummy selection
    (GetInspector() as TJvInspector).SelectedIndex := SelectedIdx;

  end;

end;

function TJvInspectorMultilineStringItem.GetDisplayValue: string;
begin
  case FMultilineText.Count of
    0: Result := EmptyLineDisplayText;
    1: Result := FMultilineText[0];
    else
      Result := MultiLineDisplayText;
  end;
end;

procedure TJvInspectorMultilineStringItem.InvokeOnTextModifiedInlineHandler;
begin
  if Assigned(FOnTextModifiedWithEditor) then
      FOnTextModifiedWithEditor(TrimRight(FMultilineText.Text));
end;

procedure PaintAreaContent(const ImgNum: Integer; const ImgName: string;
  const ACanvas: TCanvas; const ARect: TRect; const ImageList: TCustomImageList);
var
  TH: Integer;
  BoxRect: TRect;
  Bmp: TBitmap;
begin

  TH := ARect.Bottom - ARect.Top - 0;
  BoxRect.Left := ARect.Left + (ARect.Bottom - ARect.Top - TH); //div 2;
  BoxRect.Top := ARect.Top + BoxRect.Left - ARect.Left;
  BoxRect.Right := BoxRect.Left + TH + 5;
  BoxRect.Bottom := BoxRect.Top + TH + 2;
  with ACanvas do
  begin
    if (ImgNum > -1) and (ImageList <> nil) and (ImgNum < ImageList.Count) then
    begin
      Bmp := TBitmap.Create;
      try
        ImageList.GetBitmap(ImgNum, Bmp);
        Bmp.Transparent := True;
        StretchDraw(BoxRect, Bmp);
      finally
        Bmp.Free;
      end;
    end;
    TextOut(ARect.Left + (ARect.Bottom - ARect.Top) + 5, BoxRect.Top, ImgName);
  end;
end;

class function TJvInspectorElem<T>.CreateElem(CategoryNode: TJvInspectorCustomCategoryItem;
      Name: string): TJvInspectorElem<T>;
begin
  Result := TJvInspectorElem<T>.Create;
  if Result <> nil then
    Result.Item := TJvInspectorVarData.New(CategoryNode, Name,TypeInfo(T),
      @Result.FData);
end;

function TInspectorElemsHolder.DoGetEnumerator: TEnumerator<TJvInspectorElemBase>;
begin
  Result := FElemList.GetEnumerator;
end;

constructor TInspectorElemsHolder.Create(Inspector: TJvCustomInspector);
begin
  //inherited;
  FInspector := Inspector;
  FElemList := TElemList.Create;
end;

destructor TInspectorElemsHolder.Destroy;
begin
   EmptyElemList;
   FElemList.Free;
   inherited;
end;

procedure TInspectorElemsHolder.AddElem(Elem: TJvInspectorElemBase);
begin
   FElemList.Add(Elem);
   //FElemList.Add(Elem.Item, Elem);
end;

procedure TInspectorElemsHolder.EmptyElemList;
var
  RowListElem: TJvInspectorElemBase;
begin
  for RowListElem in FElemList do
    RowListElem.Free;
  FElemList.Clear;
end;


destructor TJvInspectorTImageTextItem.Destroy;
begin
  FValueTextList.Free;
  inherited Destroy;
end;

procedure TJvInspectorTImageTextItem.DoDrawListItem(Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);


begin
  with TListBox(Control) do
  begin
    if odSelected in State then
      Canvas.Brush.Color := clHighlight;
    Canvas.FillRect(Rect);
    Rect.Top := Rect.Top + 1;
    Rect.Bottom := Rect.Bottom - 1;
    PaintAreaContent(Index, Items[Index], Canvas, Rect, ValueImages);
  end;
end;

procedure TJvInspectorTImageTextItem.DoMeasureListItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
begin
  with Rects[iprValueArea] do
    Height := Bottom - Top + 2;
end;

procedure TJvInspectorTImageTextItem.DoMeasureListItemWidth(Control: TWinControl; Index: Integer;
  var Width: Integer);
begin
  with Rects[iprValueArea] do
    Width := Width + Bottom - Top + 2;
end;

function TJvInspectorTImageTextItem.GetDisplayValue: string;
begin
  Result := Data.AsString;
end;

procedure TJvInspectorTImageTextItem.GetValueList(const Strings: TStrings);
begin
  Strings.AddStrings(ValueTexts);
end;

procedure TJvInspectorTImageTextItem.SetDisplayValue(const Value: string);
begin
  Data.AsString := Value;
end;

procedure TJvInspectorTImageTextItem.SetFlags(const Value: TInspectorItemFlags);
begin
  inherited SetFlags(Value + [iifValueList, iifAllowNonListValues, iifOwnerDrawListVariable] -
    [iifOwnerDrawListFixed]);
end;

procedure TJvInspectorTImageTextItem.SetRects(const RectKind: TInspectorPaintRect; Value: TRect);
begin
  if RectKind = iprValue then
    Value.Left := Value.Left + (Value.Bottom  -Value.Top) + 2;
  inherited SetRects(RectKind, Value);
end;

procedure TJvInspectorTImageTextItem.DrawValue(const ACanvas: TCanvas);
var
  Idx: Integer;
  S: string;
  ARect: TRect;
  SafeColor: TColor;
begin
  Idx := -1;
  if Data = nil then
    S := RsJvInspItemUnInitialized
  else
  try
    if not Data.IsInitialized then
      S := RsJvInspItemUnInitialized
    else
    if not Data.HasValue then
      S := RsJvInspItemNoValue
    else
    if not Data.IsAssigned then
      S := RsJvInspItemUnassigned
    else
    begin
      S := DisplayValue;
      Idx := ValueTexts.IndexOf(S);
    end;
  except
    S := RsJvInspItemValueException + ExceptObject.ClassName + ': ' +
      Exception(ExceptObject).Message;
  end;
  ARect := Rects[iprValueArea];
  SafeColor := ACanvas.Brush.Color;
  if Editing then
    ACanvas.Brush.Color := clWindow;
  try
    ACanvas.FillRect(ARect);
    PaintAreaContent(Idx, S, ACanvas, ARect, ValueImages);
    if Editing then
      DrawEditor(ACanvas);
  finally
    if Editing then
      ACanvas.Brush.Color := SafeColor;
  end;
end;

class procedure TJvInspectorTImageTextItem.RegisterAsDefaultItem;
begin
  with TJvCustomInspectorData.ItemRegister do
  begin
    if IndexOf(Self) = -1 then
      Add(TJvInspectorTypeInfoRegItem.Create(Self, TypeInfo(TImageText)));
  end;
end;

class procedure TJvInspectorTImageTextItem.UnregisterAsDefaultItem;
begin
  TJvCustomInspectorData.ItemRegister.Delete(Self);
end;

procedure TJvInspectorTImageTextItem.DrawName(const ACanvas: TCanvas);
var
  ARect: TRect;
begin
  ARect := Rects[iprName];
  ACanvas.FillRect(ARect);
  PaintAreaContent(NameImageIdx, DisplayName, ACanvas, ARect, NameImages);
end;

//////////////////////////////////////
// TJvInspectorStringItemWithNameImage

class procedure TJvInspectorStringItemWithNameImage.RegisterAsDefaultItem;
begin
  with TJvCustomInspectorData.ItemRegister do
  begin
    if IndexOf(Self) = -1 then
      Add(TJvInspectorTypeInfoRegItem.Create(Self, TypeInfo(TStringItemWithNameImage)));
  end;
end;

class procedure TJvInspectorStringItemWithNameImage.UnregisterAsDefaultItem;
begin
  TJvCustomInspectorData.ItemRegister.Delete(Self);
end;

procedure TJvInspectorStringItemWithNameImage.DrawName(const ACanvas: TCanvas);
var
  ARect: TRect;
begin
  ARect := Rects[iprName];
  ACanvas.FillRect(ARect);
  PaintAreaContent(NameImageIdx, DisplayName, ACanvas, ARect, NameImages);
end;

// TJvInspectorStringItemWithNameImage
//////////////////////////////////////

/////////////////////////////////////////////
// TJvInspectorMultiStringItemWithNameImage

class procedure TJvInspectorMultiStringItemWithNameImage.RegisterAsDefaultItem;
begin
  with TJvCustomInspectorData.ItemRegister do
  begin
    if IndexOf(Self) = -1 then
      Add(TJvInspectorTypeInfoRegItem.Create(Self, TypeInfo(TMultiStringItemWithNameImage)));
  end;
end;

class procedure TJvInspectorMultiStringItemWithNameImage.UnregisterAsDefaultItem;
begin
  TJvCustomInspectorData.ItemRegister.Delete(Self);
end;

procedure TJvInspectorMultiStringItemWithNameImage.DrawName(const ACanvas: TCanvas);
var
  ARect: TRect;
begin
  ARect := Rects[iprName];
  ACanvas.FillRect(ARect);
  PaintAreaContent(NameImageIdx, DisplayName, ACanvas, ARect, NameImages);
end;






// TJvInspectorMultiStringItemWithNameImage
/////////////////////////////////////////////



class procedure TJvInspectorBooleanItemWithNameImage.RegisterAsDefaultItem;
begin
  with TJvCustomInspectorData.ItemRegister do
  begin
    if IndexOf(Self) = -1 then
      Add(TJvInspectorTypeInfoRegItem.Create(Self, TypeInfo(TBooleanItemWithNameImage)));
  end;
end;

class procedure TJvInspectorBooleanItemWithNameImage.UnregisterAsDefaultItem;
begin
  TJvCustomInspectorData.ItemRegister.Delete(Self);
end;

procedure TJvInspectorBooleanItemWithNameImage.DrawName(const ACanvas: TCanvas);
var
  ARect: TRect;
begin
  ARect := Rects[iprName];
  ACanvas.FillRect(ARect);
  PaintAreaContent(NameImageIdx, DisplayName, ACanvas, ARect, NameImages);
end;

//=== { TJvInspectorColorItem } ==============================================

constructor TJvInspectorNamedColorItem.Create(const AParent: TJvCustomInspectorItem;
  const AData: TJvCustomInspectorData);
begin
  inherited Create(AParent, AData);
  FColors := TStringList.Create;
  Flags := [iifVisible, iifValueList, iifAllowNonListValues, iifOwnerDrawListVariable];
end;

procedure TJvInspectorNamedColorItem.AddColor(const ColorName: string; const ColorValue: TColor);
begin
  FColors.AddObject(ColorName, TObject(ColorValue));
end;

function TJvInspectorNamedColorItem.BorderColor(const ABackgroundColor, AInternalColor: TColor): TColor;
var
  BckRGB: TColor;
  ColRGB: TColor;

  function IsLightColor(const RGB: TColor): Boolean;
  begin
    with TColorQuad(RGB) do
      Result := (Red > 192) or (Green > 192) or (Blue > 192);
  end;

begin
  BckRGB := ColorToRGB(ABackgroundColor);
  ColRGB := ColorToRGB(AInternalColor);
  if IsLightColor(BckRGB) and IsLightColor(ColRGB) then
    Result := clBlack
  else
  if not IsLightColor(BckRGB) and not IsLightColor(ColRGB) then
    Result := clWhite
  else
    Result := AInternalColor;
end;

procedure TJvInspectorNamedColorItem.PaintValue(const Color: TColor; const ColorName: string;
  const ACanvas: TCanvas; const ARect: TRect);
var
  TH: Integer;
  BoxRect: TRect;
  bc: TColor;
  pc: TColor;
  txtRect: TRect;
begin
  TH := Rects[iprValue].Bottom - Rects[iprValue].Top - 2;
  BoxRect.Left := ARect.Left + (ARect.Bottom - ARect.Top - TH) div 2;
  BoxRect.Top := ARect.Top + BoxRect.Left - ARect.Left;
  BoxRect.Right := BoxRect.Left + TH;
  BoxRect.Bottom := BoxRect.Top + TH;
  with ACanvas do
  begin
    if Color <> clNone then
    begin
      bc := Brush.Color;
      pc := Pen.Color;
      try
        Brush.Color := Color;
        Pen.Color := BorderColor(bc, Color);
        Rectangle(BoxRect);
      finally
        Pen.Color := pc;
        Brush.Color := bc;
      end;
    end;
   txtRect := ARect;
   txtRect.Left := txtRect.Left + (txtRect.Bottom-txtRect.Top)+ 1;
   TextRect(txtRect, txtRect.Left, BoxRect.Top, ColorName);
  end;
end;


procedure TJvInspectorNamedColorItem.DoDrawListItem(Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);


begin
  with TListBox(Control) do
  begin
    if odSelected in State then
      Canvas.Brush.Color := clHighlight;
    Canvas.FillRect(Rect);
    Rect.Top := Rect.Top + 1;
    Rect.Bottom := Rect.Bottom - 1;
    PaintValue(TColor(Items.Objects[Index]), Items[Index], Canvas, Rect);
  end;
end;

procedure TJvInspectorNamedColorItem.DoMeasureListItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
begin
  with Rects[iprValueArea] do
    Height := Bottom - Top + 2;
end;

procedure TJvInspectorNamedColorItem.DoMeasureListItemWidth(Control: TWinControl; Index: Integer;
  var Width: Integer);
begin
  with Rects[iprValueArea] do
    Width := Width + Bottom - Top + 2;
end;

function TJvInspectorNamedColorItem.GetDisplayValue: string;
var
  TempSL: TStringList;
  I: Integer;
begin
  TempSL := TStringList.Create;
  try
    GetValueList(TempSL);
    I := TempSL.IndexOfObject(TObject(Data.AsOrdinal));
    if I = -1 then
      Result := JclTypedIntToStr(Data.AsOrdinal, TypeInfo(TColor))
    else
      Result := TempSL[I];
  finally
    TempSL.Free;
  end;
end;

procedure TJvInspectorNamedColorItem.GetValueList(const Strings: TStrings);
var
  TempSL: TStringList;
begin
  TempSL := TStringList.Create;
  try
    TempSL.AddStrings(FColors);
    DoGetValueList(Strings);
    TempSL.AddStrings(Strings);
    TempSL.Sort;
    Strings.Assign(TempSL);
  finally
    TempSL.Free;
  end;
end;

procedure TJvInspectorNamedColorItem.SetDisplayValue(const Value: string);
var
  SL: TStringList;
  I: Integer;
begin
  SL := TStringList.Create;
  try
    GetValueList(SL);
    I := SL.IndexOf(Value);
    if I > -1 then
      I := Integer(SL.Objects[I])
    else
      I := JclStrToTypedInt(Value, TypeInfo(TColor));
    Data.AsOrdinal := I;
  finally
    SL.Free;
  end;
end;

procedure TJvInspectorNamedColorItem.SetFlags(const Value: TInspectorItemFlags);
begin
  inherited SetFlags(Value + [iifValueList, iifAllowNonListValues, iifOwnerDrawListFixed] -
    [iifOwnerDrawListVariable]);
end;

procedure TJvInspectorNamedColorItem.SetRects(const RectKind: TInspectorPaintRect; Value: TRect);
begin
  if RectKind = iprValue then
    Value.Left := Value.Left + (Value.Bottom - Value.Top) + 2;
  inherited SetRects(RectKind, Value);
end;

procedure TJvInspectorNamedColorItem.BeforeDestruction;
begin
  FColors.Free;
  inherited BeforeDestruction;
end;

procedure TJvInspectorNamedColorItem.DrawValue(const ACanvas: TCanvas);
var
  Color: TColor;
  S: string;
  ARect: TRect;
  SafeColor: TColor;
begin
  Color := clNone;
  if Data = nil then
    S := RsJvInspItemUnInitialized
  else
  try
    if not Data.IsInitialized then
      S := RsJvInspItemUnInitialized
    else
    if not Data.HasValue then
      S := RsJvInspItemNoValue
    else
    if not Data.IsAssigned then
      S := RsJvInspItemUnassigned
    else
    begin
      S := DisplayValue;
      Color := Data.AsOrdinal;
    end;
  except
    S := RsJvInspItemValueException + ExceptObject.ClassName + ': ' +
      Exception(ExceptObject).Message;
  end;
  ARect := Rects[iprValueArea];
  SafeColor := ACanvas.Brush.Color;
  if Editing then
    ACanvas.Brush.Color := clWindow;
  try
    ACanvas.FillRect(ARect);
    PaintValue(Color, S, ACanvas, ARect);
    if Editing then
      DrawEditor(ACanvas);
  finally
    if Editing then
      ACanvas.Brush.Color := SafeColor;
  end;
end;

class procedure TJvInspectorNamedColorItem.RegisterAsDefaultItem;
begin
  with TJvCustomInspectorData.ItemRegister do
    if IndexOf(Self) = -1 then
      Add(TJvInspectorTypeInfoRegItem.Create(Self, TypeInfo(TNamedColor)));
end;

class procedure TJvInspectorNamedColorItem.UnregisterAsDefaultItem;
begin
  TJvCustomInspectorData.ItemRegister.Delete(Self);
end;

end.
