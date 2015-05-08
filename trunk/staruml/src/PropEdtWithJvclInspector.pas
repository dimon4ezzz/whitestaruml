unit PropEdtWithJvclInspector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PropEdt, ImgList, ExtCtrls, FlatPanel, JvExControls, JvInspector,
  JvclExtensions, BasicClasses, Core, MenuManager, Generics.Collections;

type
  TPropertyEditorWithJvclInspector = class(TPropertyEditor, ILookAndFeelChangedListener)
    Inspector: TJvInspector;
    procedure InspectorItemEdit(Sender: TJvCustomInspector;
      Item: TJvCustomInspectorItem; var DisplayStr: string);
  private
    FElemsHolder: TInspectorElemsHolder;
    FUpdating: Boolean;
private
    procedure ClearRows;
    procedure ItemDataValueChanged(Sender: TObject);
    function SetUpTextRow(SuperNode: TJvInspectorCustomCategoryItem;
       P:PProperty; AFlags:TInspectorItemFlags = []): TJvInspectorElemBase;
    function SetUpTextButtonRow(SuperNode: TJvInspectorCustomCategoryItem;
      P:PProperty): TJvInspectorElemBase;

    function SetUpCheckRow(SuperNode: TJvInspectorCustomCategoryItem;
      P:PProperty): TJvInspectorElemBase;
    function SetUpChoiceRow(SuperNode: TJvInspectorCustomCategoryItem;
      P:PProperty; ShowValueImages: Boolean = true ): TJvInspectorElemBase;
    function SetUpTextChoiceRow(SuperNode: TJvInspectorCustomCategoryItem;
      P:PProperty): TJvInspectorElemBase;

    procedure SetLookAndFeel(ALookAndFeelManager: TLookAndFeelManager);


  protected
    procedure SetEnabled(Value: Boolean); override;
    procedure SetupRows; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateProperties; override;
    procedure ApplyChanges; override;

    procedure MainFormReady; override;

    // Interface ILookAndFeelChangedListener
    procedure LookAndFeelChanged(ALookAndFeelManager: TLookAndFeelManager);

  end;


implementation

uses
  StarUMLApp;

{$R *.dfm}

constructor TPropertyEditorWithJvclInspector.Create(AOwner: TComponent);
begin
  inherited;
  TJvInspectorTImageTextItem.RegisterAsDefaultItem;
  TJvInspectorStringItemWithNameImage.RegisterAsDefaultItem;
  TJvInspectorBooleanItemWithNameImage.RegisterAsDefaultItem;
  TJvInspectorMultiStringItemWithNameImage.RegisterAsDefaultItem;
  FElemsHolder := TInspectorElemsHolder.Create(Inspector);

  Inspector.ActivePainter.HideSelectColor := clWebLightBlue;
  //SetLookAndFeel(StarUMLApplication.LookAndFeelManager);
  //StarUMLApplication.LookAndFeelManager.RegisterLookAndFeelChangedListener(self);
end;

destructor TPropertyEditorWithJvclInspector.Destroy;
begin
  TJvInspectorTImageTextItem.UnregisterAsDefaultItem;
  TJvInspectorStringItemWithNameImage.UnregisterAsDefaultItem;
  TJvInspectorBooleanItemWithNameImage.UnregisterAsDefaultItem;
  TJvInspectorMultiStringItemWithNameImage.UnregisterAsDefaultItem;

  FreeAndNil(FElemsHolder);
  inherited;
end;

procedure TPropertyEditorWithJvclInspector.InspectorItemEdit(
  Sender: TJvCustomInspector; Item: TJvCustomInspectorItem;
  var DisplayStr: string);
begin
  //inherited;
  PropertyAdaptor.PropertyButtonClicked(FInspectingElements,
    Item.Name);
  DisplayStr := Item.Data.AsString;
  Sender.SetFocus;

end;

procedure TPropertyEditorWithJvclInspector.ItemDataValueChanged(Sender: TObject);
var
  InspectorItem: TJvCustomInspectorItem;
  ElementsToUpdate: POrderedSet;
  Element: PElement;
  PropertyKey: string;
  PropertyValue: string;
  I: Integer;
begin

  if not FUpdating then begin // If being updated programatically (without direct user action) do not propagate event
    InspectorItem := Sender as TJvCustomInspectorItem;
    PropertyKey := InspectorItem.Name;
    PropertyValue := InspectorItem.DisplayValue;
    ElementsToUpdate := POrderedSet.Create;
    try
      for I := 0 to FInspectingElements.Count - 1 do begin
        Element := FInspectingElements[I] as PElement;
        if PropertyAdaptor.GetPropertyValue(Element,PropertyKey) <> PropertyValue then
          ElementsToUpdate.Add(Element);
      end;

      if ElementsToUpdate.Count > 0 then
        PropertyAdaptor.SetPropertyValue(ElementsToUpdate, PropertyKey, PropertyValue);

    finally
      ElementsToUpdate.Free;
    end;

  end;  // not FUpdating
end;


procedure TPropertyEditorWithJvclInspector.ClearRows;
begin
  if Inspector <> nil then
    Inspector.Clear;
  //EmptyRowList(RowList);
  FElemsHolder.EmptyElemList;
end;

procedure TPropertyEditorWithJvclInspector.SetupRows;
var
  P: PProperty; // Iterated property from PropertyList
  SuperNode: TJvInspectorCustomCategoryItem; // Root node for given category
  CategoryRows: TStringList; // Cache of names of already defined category nodes

  // Returns or creates category (group) node for given property category
  function GetCategoryRow(Category: string): TJvInspectorCustomCategoryItem;
  var
    Index: Integer;
  begin
    Index := CategoryRows.IndexOf(Category);
    if Index = -1 then
    begin
      Result := TJvInspectorCustomCategoryItem.Create(Inspector.Root, nil);
      Result.SortKind := iskNone;
      Result.Name := Category;
      Result.DisplayName := Category;
      CategoryRows.AddObject(Category, Result);
    end
    else
    begin
      Result := TJvInspectorCustomCategoryItem(CategoryRows.Objects[Index]);
    end;
  end;

begin
  Inspector.BeginUpdate;
  ClearRows;
  Inspector.Root.SortKind := iskNone;
  CategoryRows := TStringList.Create;
  for P in PropertyList do // Create a corresponding row for every property
  begin
    SuperNode := GetCategoryRow(P.Category); // Identify category node for given property

    // Row creation
    case P.RowKind of
      rkTextRow:
          SetUpTextRow(SuperNode,P);
      rkTextButtonRow:
          SetUpTextButtonRow(SuperNode,P);
      rkChoiceRow:
          SetUpChoiceRow(SuperNode,P);
      rkCheckRow:
        SetUpCheckRow(SuperNode,P);
      rkTextChoiceRow:
        SetUpTextChoiceRow(SuperNode,P);
    end; // case P.RowKind

  end; // for P in PropertyList
  CategoryRows.Free;
  Inspector.Root.ExpandItems(true);
  Inspector.EndUpdate;
end;

function TPropertyEditorWithJvclInspector.SetUpTextRow(SuperNode: TJvInspectorCustomCategoryItem;
  P:PProperty; AFlags:TInspectorItemFlags): TJvInspectorElemBase;
begin
  Result := TJvInspectorElem<TStringItemWithNameImage>.CreateElem(SuperNode, P.Key);
  if Result <> nil then
  begin
    FElemsHolder.AddElem(Result);
    with Result.Item do
    begin
      Flags := Flags + AFlags;
      DisplayName := P.Caption;
      ReadOnly := FReadOnly;

      if P.RowEditable and (not ReadOnly) then
        OnValueChanged := ItemDataValueChanged
      else
       Flags := Flags + [iifEditFixed];
    end;
    with Result.Item as TJvInspectorStringItemWithNameImage do
    begin
      NameImages := RowImageList;
      NameImageIdx := P.ImageIndex;
    end;
  end;
end;

function TPropertyEditorWithJvclInspector.SetUpTextButtonRow
  (SuperNode: TJvInspectorCustomCategoryItem; P:PProperty): TJvInspectorElemBase;
var
  ItemFlags: TInspectorItemFlags;
begin
  ItemFlags := [iifEditButton];
  //if not P.RowEditable then
  //   ItemFlags := ItemFlags + [iifEditFixed];
  Result := SetUpTextRow(SuperNode,P,ItemFlags);
end;

function TPropertyEditorWithJvclInspector.SetUpChoiceRow(SuperNode: TJvInspectorCustomCategoryItem;
  P:PProperty; ShowValueImages: Boolean): TJvInspectorElemBase;
begin
  Result := TJvInspectorElem<TImageText>.CreateElem(SuperNode, P.Key);
  if Result <> nil then
  begin
    FElemsHolder.AddElem(Result);
    with Result.Item do
    begin
      DisplayName := P.Caption;
      ReadOnly := FReadOnly;
      if not ReadOnly then
        OnValueChanged := ItemDataValueChanged;
    end;
    with Result.Item as TJvInspectorTImageTextItem do
    begin
      NameImages := RowImageList;
      NameImageIdx := P.ImageIndex;
      ValueTexts := TStringList.Create;
      ValueTexts.Assign(P.RowItemValues);
      if ShowValueImages then
        ValueImages := P.RowItemImages
      else
        ValueImages := nil;
    end;
  end;
end;

function TPropertyEditorWithJvclInspector.SetUpTextChoiceRow(SuperNode: TJvInspectorCustomCategoryItem;
  P:PProperty): TJvInspectorElemBase;
begin
  Result := SetUpChoiceRow(SuperNode,P,false);
end;

function TPropertyEditorWithJvclInspector.SetUpCheckRow(SuperNode: TJvInspectorCustomCategoryItem;
  P:PProperty): TJvInspectorElemBase;
begin
  Result := TJvInspectorElem<TBooleanItemWithNameImage>.CreateElem(SuperNode, P.Key);
  if Result <> nil then
  begin
    FElemsHolder.AddElem(Result);
    with Result.Item do
    begin
      DisplayName := P.Caption;
      ReadOnly := (not P.RowEditable) or FReadOnly;
      if not ReadOnly then
        OnValueChanged := ItemDataValueChanged;
    end;
    with Result.Item as TJvInspectorBooleanItemWithNameImage do
    begin
      NameImages := RowImageList;
      NameImageIdx := P.ImageIndex;
      ShowAsCheckBox := True;
    end;
  end;
end;

procedure TPropertyEditorWithJvclInspector.UpdateProperties;
var
  //I: Integer;
  Row: TJvInspectorElemBase;
  E: PElement;
  RowName: string;
  Val: string;

begin
  FUpdating := True;
  Inspector.BeginUpdate;
  // Update PropertyEditor according to single element
  if FInspectingElements.Count = 1 then
  begin
    for Row in FElemsHolder do
    begin
      E := FInspectingElements[0] as PElement;
      RowName := Row.Item.Name;
      Val := PropertyAdaptor.GetPropertyValue(E, RowName);
      Row.Item.DisplayValue := Val;
    end
  end
  // Update PropertyEditor according to multiple elements
  else if FInspectingElements.Count > 1 then
  begin
    for Row in FElemsHolder do
    begin
      try
        Val := MixPropertyValue(Row.Item.Name);
        Row.Item.DisplayValue := Val;
      except
      end;
    end;
  end;
  Inspector.EndUpdate;
  FUpdating := False;
end;

procedure TPropertyEditorWithJvclInspector.ApplyChanges;
begin
  // Empty
end;

procedure TPropertyEditorWithJvclInspector.SetEnabled(Value: Boolean);
begin
  inherited;
end;

procedure TPropertyEditorWithJvclInspector.LookAndFeelChanged
  (ALookAndFeelManager: TLookAndFeelManager);
begin
    SetLookAndFeel(ALookAndFeelManager)
end;

procedure TPropertyEditorWithJvclInspector.SetLookAndFeel
  (ALookAndFeelManager: TLookAndFeelManager);
var
  Painter: TJvInspectorPainter;
begin
  Painter := Inspector.ActivePainter;
  Painter.CategoryColor := ALookAndFeelManager.WindowLightColor;
end;

procedure TPropertyEditorWithJvclInspector.MainFormReady;
begin
  StarUMLApplication.LookAndFeelManager.RegisterLookAndFeelChangedListener(self);
end;


end.
