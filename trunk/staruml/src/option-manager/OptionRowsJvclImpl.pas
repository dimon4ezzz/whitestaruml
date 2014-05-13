unit OptionRowsJvclImpl;

interface

uses
  OptionNodes, OptionRowsBase, JvExControls, JvInspector, JvclExtensions,
  Classes, Controls, Types, Graphics, StdCtrls, Variants;

type

  POptionItemRow = class(POptionItemRowBase)
  protected
    FInspectorRow: TJvInspectorElemBase; // Inspector row encapsulated by current OptionItemRow
    FParentRow: TJvInspectorCustomCategoryItem;
    //procedure CreateInspectorRow; virtual; abstract;
    procedure ValueChanged(Sender: TObject);
  public
    constructor Create(AOptionItem: POptionItem;
      ParentRow: TJvInspectorCustomCategoryItem; AElemsHolder: TInspectorElemsHolder);
    //procedure DrawName(const ACanvas: TCanvas);
    procedure RowButtonClick(var DisplayStr: string); virtual; // To be used by Inspector handler
    property InspectorRow: TJvInspectorElemBase read FInspectorRow;
  end;

  // PIntegerOptionItemRow
  PIntegerOptionItemRow = class(POptionItemRow)
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure HandleKeyPress(var Key: Char); override;
    //procedure HandleValueChange; override;
  end;

   PRealOptionItemRow = class(POptionItemRow)
  protected
     procedure CreateInspectorRow; override;
     procedure DrawInspector; override;
  public

    procedure HandleKeyPress(var Key: Char); override;
    //procedure HandleValueChange; override;
  end;

   // PBooleanOptionItemRow
  PBooleanOptionItemRow = class(POptionItemRow)
  //private
    //procedure RowToggleClick(Sender: TObject; const Text: string; State: TdxCheckBoxState);
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    //procedure HandleValueChange(Sender: TObject); override;
  end;

  // PStringOptionItemRow
  PStringOptionItemRow = class(POptionItemRow)
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    //procedure HandleValueChange; override;
  end;

   // PTextOptionItemRow
  PTextOptionItemRow = class(POptionItemRow)
  private
    procedure TextChanged(NewText: string);
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
    //procedure RowPopup(Sender: TObject; const EditText: string);
    //procedure RowCloseUp(Sender: TObject; var Text: string; var Accept: Boolean);
  public
    destructor Destroy; override;
  end;

  // PEnumerationOptionItemRow
  PEnumerationOptionItemRow = class(POptionItemRow)
  private
    //procedure RowCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  end;

  // PFontNameOptionItemRow
  PFontNameOptionItemRow = class(POptionItemRow)
  private
    //procedure RowCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  end;

  // PFileNameOptionItemRow
  PFileNameOptionItemRow = class(POptionItemRow)
  private
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    //procedure HandleValueChange; override;
    procedure RowButtonClick(var DisplayStr: string); override;

  end;

  // PPathNameOptionItemRow
  PPathNameOptionItemRow = class(POptionItemRow)
  //private
    //procedure RowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    //procedure HandleValueChange; override;
    procedure RowButtonClick(var DisplayStr: string); override;
  end;

  // PColorOptionItemRow
  PColorOptionItemRow = class(POptionItemRow)
  private
    //ColorImages: TImageList;
    //function GetColorIndex(ColorStr: string): Integer;
    //procedure AddColor(ColorStr: string);
    //procedure RowCloseUp(Sender: TObject; var Value: string; var Accept: Boolean);
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    //destructor Destroy; override;
  end;




implementation

uses
  OptionMgrAux, PVariants, NLS_OPTMGR,
  Forms, Dialogs, SysUtils;

////////////////////////////////////////////////////////////////////////////////
// POptionItemRow

constructor POptionItemRow.Create(AOptionItem: POptionItem;
  ParentRow: TJvInspectorCustomCategoryItem; AElemsHolder: TInspectorElemsHolder);
begin
  inherited Create(AOptionItem);
  FParentRow := ParentRow;
  CreateInspectorRow;
  if FInspectorRow <> nil then begin
    FInspectorRow.Item.OnValueChanged := ValueChanged;
    AElemsHolder.AddElem(FInspectorRow);
  end;

  //FInspectorRow.OnDrawCaption := HandleDrawCaption;
end;

procedure POptionItemRow.ValueChanged(Sender: TObject);
var
  CurValue: string;
  CurValueIdx: Integer;
  ValueModified: Boolean;
begin
  ValueModified := False;
  try
    if VarIsNumeric(FOptionItem.Value) and (FOptionItem is PEnumerationOptionItem) then begin
        CurValueIdx := (FOptionItem as PEnumerationOptionItem).IndexOfItem(FInspectorRow.Item.DisplayValue);
        ValueModified := CurValueIdx <> FOptionItem.Value;
        if  ValueModified then
         FOptionItem.Value := CurValueIdx;
      end
    else {if VarIsStr(FOptionItem.Value) then} begin
      CurValue := FInspectorRow.Item.DisplayValue;
      ValueModified := CurValue <> FOptionItem.Value;
      if ValueModified then
        FOptionItem.Value := CurValue;
      if Assigned(FOnOptionItemRowChange) then
          FOnOptionItemRowChange(Self);
    end;

  except
    on EConvertError do begin
      POptionManagerMessages.InvalidValue(FOptionItem.Caption);
        FInspectorRow.Item.DisplayValue := FOptionItem.Value;
    end;
  end;
end;

procedure POptionItemRow.RowButtonClick(var DisplayStr: string);
begin
end;


// POptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PIntegerOptionItemRow

procedure PIntegerOptionItemRow.CreateInspectorRow;
//var
  //Row: TJvInspectorElemBase;
begin
  //FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextRow).Row;
  FInspectorRow :=  TJvInspectorElem<Integer>.CreateElem(FParentRow, FOptionItem.Caption);
  if FInspectorRow <> nil then
    //FInspectorRow.Item.Data.AsOrdinal := StrToInt(FOptionItem.Value);
    FInspectorRow.Item.DisplayValue := FOptionItem.Value;
end;

procedure PIntegerOptionItemRow.DrawInspector;
begin
  FInspectorRow.Item.DisplayName := FOptionItem.Caption;
  FInspectorRow.Item.DisplayValue := FOptionItem.Value;
end;

procedure PIntegerOptionItemRow.HandleKeyPress(var Key: Char);
begin
  if (Key < '0') or (Key > '9') then
    Key := #0;
end;


// PIntegerOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PRealOptionItemRow

procedure PRealOptionItemRow.CreateInspectorRow;
begin
  FInspectorRow :=  TJvInspectorElem<Real>.CreateElem(FParentRow, FOptionItem.Caption);
  if FInspectorRow <> nil then
    //FInspectorRow.Item.Data.AsFloat := StrToFloat(FOptionItem.Value);
    FInspectorRow.Item.DisplayValue := FOptionItem.Value;
end;

procedure PRealOptionItemRow.DrawInspector;
begin
  FInspectorRow.Item.DisplayName := FOptionItem.Caption;
  FInspectorRow.Item.DisplayValue := FOptionItem.Value;
end;

procedure PRealOptionItemRow.HandleKeyPress(var Key: Char);
begin
  if not (((Key >= '0') and (Key <= '9')) or (Key = '.')) then
    Key := #0;
end;



// PRealOptionItemRow
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// PBooleanOptionItemRow


procedure PBooleanOptionItemRow.CreateInspectorRow;
begin
  FInspectorRow :=  TJvInspectorElem<Boolean>.CreateElem(FParentRow, FOptionItem.Caption);
  if FInspectorRow <> nil then begin
    FInspectorRow.Item.DisplayValue := FOptionItem.Value;
   (FInspectorRow.Item as TJvInspectorBooleanItem).ShowAsCheckBox := True;
  end;
end;

procedure PBooleanOptionItemRow.DrawInspector;
begin
  FInspectorRow.Item.DisplayName := FOptionItem.Caption;
  FInspectorRow.Item.DisplayValue := FOptionItem.Value;
end;


// PBooleanOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PStringOptionItemRow

procedure PStringOptionItemRow.CreateInspectorRow;
begin
  FInspectorRow :=  TJvInspectorElem<string>.CreateElem(FParentRow, FOptionItem.Caption);
  if FInspectorRow <> nil then begin
    FInspectorRow.Item.DisplayValue := FOptionItem.Value;
  end;
  //DrawInspector;
end;

procedure PStringOptionItemRow.DrawInspector;
begin
  FInspectorRow.Item.DisplayName := FOptionItem.Caption;
  FInspectorRow.Item.DisplayValue := FOptionItem.Value;

end;

// PStringOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PTextOptionItemRow

procedure PTextOptionItemRow.CreateInspectorRow;
begin
  FInspectorRow :=  TJvInspectorElem<TMultilineStringItem>.CreateElem(FParentRow, FOptionItem.Caption);
  if FInspectorRow <> nil then begin
    with FInspectorRow.Item as TJvInspectorMultilineStringItem do begin
      //RawData := FOptionItem.Value;
      //RawData := TStringList.Create;
      //RawData.Text := FOptionItem.Value;
      NewString := FOptionItem.Value;
      OnTextModifiedWithEditor := TextChanged;
      OnTextModifiedInline := TextChanged;
    end;
  end;
  DrawInspector;
end;

procedure PTextOptionItemRow.DrawInspector;
begin
  FInspectorRow.Item.DisplayName := FOptionItem.Caption;
end;

destructor PTextOptionItemRow.Destroy;
begin
  //(FInspectorRow as TJvInspectorElem<TStrings>).RawData.Free;
  inherited;
end;

procedure PTextOptionItemRow.TextChanged(NewText: string);
begin
  FOptionItem.Value := NewText;
end;

// PTextOptionItemRow
////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////
// PEnumerationOptionItemRow


procedure PEnumerationOptionItemRow.CreateInspectorRow;
begin
  FInspectorRow :=  TJvInspectorElem<TStringEnumItem>.CreateElem(FParentRow, FOptionItem.Caption);
  if FInspectorRow <> nil then begin
    FInspectorRow.Item.DisplayValue := FOptionItem.Value;
    with FInspectorRow.Item as TJvInspectorStringEnumItem do begin
      ValueTexts.Assign((FOptionItem as PEnumerationOptionItem).EnumerationItemValues);
    end;
  end;
  DrawInspector;
end;


procedure PEnumerationOptionItemRow.DrawInspector;
begin
  FInspectorRow.Item.DisplayName := FOptionItem.Caption;
  FInspectorRow.Item.DisplayValue := (FOptionItem as PEnumerationOptionItem).EnumerationItems[FOptionItem.Value];
end;

// PEnumerationOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PFontNameOptionItemRow

procedure PFontNameOptionItemRow.CreateInspectorRow;
begin
  FInspectorRow :=  TJvInspectorElem<TStringEnumItem>.CreateElem(FParentRow, FOptionItem.Caption);
  if FInspectorRow <> nil then begin
    FInspectorRow.Item.DisplayValue := FOptionItem.Value;
    with FInspectorRow.Item as TJvInspectorStringEnumItem do begin
      ValueTexts.Assign(Screen.Fonts);
    end;
  end;
  DrawInspector;
end;

procedure PFontNameOptionItemRow.DrawInspector;
begin
  FInspectorRow.Item.DisplayName := FOptionItem.Caption;
  FInspectorRow.Item.DisplayValue := FOptionItem.Value;
end;

// PFontNameOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PFileNameOptionItemRow

procedure PFileNameOptionItemRow.RowButtonClick(var DisplayStr: string);
var
  OpenDialog: TOpenDialog;
begin
  if FInspectorRow.Item = FInspectorRow.Item.Inspector.FocusedItem then begin
    OpenDialog := TOpenDialog.Create(Application);
    if OpenDialog.Execute then
    begin
      FOptionItem.Value := OpenDialog.FileName;
      DisplayStr := OpenDialog.FileName;
      Refresh;
      if Assigned(FOnOptionItemRowChange) then
        FOnOptionItemRowChange(Self);
    end;
    OpenDialog.Free;
  end;
end;


procedure PFileNameOptionItemRow.CreateInspectorRow;
begin
  FInspectorRow :=  TJvInspectorElem<string>.CreateElem(FParentRow, FOptionItem.Caption);
  if FInspectorRow <> nil then begin
    FInspectorRow.Item.Flags := FInspectorRow.Item.Flags + [iifEditButton];
  end;
  DrawInspector;
end;

procedure PFileNameOptionItemRow.DrawInspector;
begin
  FInspectorRow.Item.DisplayName := FOptionItem.Caption;
  FInspectorRow.Item.DisplayValue := FOptionItem.Value;

end;

// PFileNameOptionItemRow
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// PPathNameOptionItemRow

procedure PPathNameOptionItemRow.RowButtonClick(var DisplayStr: string);
var
  DirDialog: PDirectoryDialog;
begin
  if FInspectorRow.Item = FInspectorRow.Item.Inspector.FocusedItem then begin
    DirDialog := PDirectoryDialog.Create(Application);
    if DirDialog.Execute then
    begin
      FOptionItem.Value := DirDialog.DirName;
      DisplayStr := DirDialog.DirName;
      Refresh;
      if Assigned(FOnOptionItemRowChange) then
        FOnOptionItemRowChange(Self);
    end;
    DirDialog.Free;
  end;
end;

procedure PPathNameOptionItemRow.CreateInspectorRow;
begin
  FInspectorRow :=  TJvInspectorElem<string>.CreateElem(FParentRow, FOptionItem.Caption);
  if FInspectorRow <> nil then begin
    FInspectorRow.Item.Flags := FInspectorRow.Item.Flags + [iifEditButton];
  end;
  DrawInspector;
end;

procedure PPathNameOptionItemRow.DrawInspector;
begin
  FInspectorRow.Item.DisplayName := FOptionItem.Caption;
  FInspectorRow.Item.DisplayValue := FOptionItem.Value;

end;

// PPathNameOptionItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PColorOptionItemRow


procedure PColorOptionItemRow.CreateInspectorRow;
var
  I: Integer;
begin
  FInspectorRow :=  TJvInspectorElem<TNamedColor>.CreateElem(FParentRow, FOptionItem.Caption);
  with FInspectorRow.Item as TJvInspectorNamedColorItem do
    for I := Low(Colors) to High(Colors) do
      AddColor(ColorNames[i], Colors[i]);
  DrawInspector;
end;

procedure PColorOptionItemRow.DrawInspector;
begin
  FInspectorRow.Item.DisplayName := FOptionItem.Caption;
  FInspectorRow.Item.DisplayValue := FOptionItem.Value;
end;

// PColorOptionItemRow
////////////////////////////////////////////////////////////////////////////////


end.
