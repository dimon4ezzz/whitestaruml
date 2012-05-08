unit PropEdtWithTdxInspector;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, Generics.Collections,
  dxInspct, dxExEdtr, dxCntner,
  PropEdt, FlatPanel, BasicClasses, Core, ExtCtrls, ImgList;

type

  TPropertyEditorWithTdxInspector = class(TPropertyEditor)
    Inspector: TdxInspector;
  private
  { Private types }
  type
    TRowList = TList<TdxInspectorRow>;
  private
   { Private declarations }
    RowList: TRowList; // Cache of rows representing properties
    procedure InitializeGUI;
    procedure ClearRows;
    procedure InspectorCustomDraw(Sender: TdxInspectorRow; ACanvas: TCanvas;
      ARect: TRect; var AText: string; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure InspectorChangeNode(Sender: TObject;
      OldNode, Node: TdxInspectorNode);
    procedure InspectorEdited(Sender: TObject; Node: TdxInspectorNode;
      Row: TdxInspectorRow);
    procedure ImageRowCloseUp(Sender: TObject; var Value: string;
      var Accept: Boolean);
    procedure PickRowCloseUp(Sender: TObject; var Value: Variant;
      var Accept: Boolean);
    procedure CheckRowToggleClick(Sender: TObject; const Text: string;
      State: TdxCheckBoxState);
    procedure PropertyModified(Sender: TObject; Node: TdxInspectorNode;
      Row: TdxInspectorRow);
    procedure RowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure EnterHandler(Sender: TObject);

  protected
    procedure SetEnabled(Value: Boolean); override;
    procedure SetupRows; override;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateProperties; override;
    procedure ApplyChanges; override;


  end; // class TPropertyEditorWithTdxInspector

var
  PropertyEditorWithTdxInspector: TPropertyEditorWithTdxInspector;

implementation

{$R *.dfm}

uses
  dxInspRw;

constructor TPropertyEditorWithTdxInspector.Create(AOwner: TComponent);
begin
  inherited;
  RowList := TRowList.Create;
  InitializeGUI;
end;

destructor TPropertyEditorWithTdxInspector.Destroy;
begin
  RowList.Free;
  RowList := nil;
  inherited;
end;

procedure TPropertyEditorWithTdxInspector.InitializeGUI;
begin
  Inspector.OnEdited := InspectorEdited;
  Inspector.OnEnter := EnterHandler;
  Inspector.OnChangeNode := InspectorChangeNode;
  Inspector.OnDrawValue := InspectorCustomDraw;
end;

procedure TPropertyEditorWithTdxInspector.ClearRows;
begin
  if Inspector <> nil then
    Inspector.ClearRows;
  RowList.Clear;
end;

procedure TPropertyEditorWithTdxInspector.SetupRows;
var
  P: PProperty; // Iterated property from PropertyList
  SuperNode: TdxInspectorRowNode; // Root node for given category
  SubNode: TdxInspectorRowNode; // Property node
  CategoryRows: TStringList; // Cache of names of already defined category nodes

  // Returns or creates category (group) node for given property category
  function GetCategoryRow(Category: string): TdxInspectorRowNode;
  var
    Index: Integer;
  begin
    Index := CategoryRows.IndexOf(Category);
    if Index = -1 then
    begin
      Result := Inspector.AddEx(TdxInspectorTextRow);
      Result.Row.Caption := Category;
      Result.Row.IsCategory := True;
      CategoryRows.AddObject(Category, Result);
    end
    else
    begin
      Result := TdxInspectorRowNode(CategoryRows.Objects[Index]);
    end;
  end;

begin
  Inspector.BeginUpdate;
  ClearRows;
  CategoryRows := TStringList.Create;
  for P in PropertyList do // Create a corresponding row for every property
  begin
    SuperNode := GetCategoryRow(P.Category); // Identify category node for given property
    // Row creation
    case P.RowKind of
      rkTextRow:
        begin
          SubNode := SuperNode.AddChildEx(TdxInspectorTextRow);
          SubNode.Row.Hint := P.Key; // put Property's Key in Row's Hint
          SubNode.Row.Caption := P.Caption;
          SubNode.Row.ReadOnly := (not P.RowEditable) or FReadOnly;
          SubNode.Row.ImageIndex := P.ImageIndex;
          RowList.Add(SubNode.Row);
        end;
      rkTextButtonRow:
        begin
          SubNode := SuperNode.AddChildEx(TdxInspectorTextButtonRow);
          SubNode.Row.Hint := P.Key; // put Property's Key in Row's Hint
          SubNode.Row.Caption := P.Caption;
          SubNode.Row.ReadOnly := (not P.RowEditable) or FReadOnly;
          SubNode.Row.ImageIndex := P.ImageIndex;
(SubNode.Row as TdxInspectorTextButtonRow)
          .OnButtonClick := RowButtonClick;
          RowList.Add(SubNode.Row);
        end;
      rkChoiceRow:
        begin
          SubNode := SuperNode.AddChildEx(TdxInspectorTextImageRow);
          SubNode.Row.Hint := P.Key; // put Property's Key in Row's Hint
          SubNode.Row.Caption := P.Caption;
          SubNode.Row.ReadOnly := FReadOnly;
          SubNode.Row.ImageIndex := P.ImageIndex;
          with SubNode.Row as TdxInspectorTextImageRow do
          begin
            ShowDescription := True;
            Values.Assign(P.RowItemValues);
            Descriptions.Assign(P.RowItemValues);
            Images := P.RowItemImages;
            ImageIndexes.Assign(P.RowItemImageIndexes);
            if not FReadOnly then
              OnCloseUp := ImageRowCloseUp;
          end;
          RowList.Add(SubNode.Row);
        end;
      rkCheckRow:
        begin
          SubNode := SuperNode.AddChildEx(TdxInspectorTextCheckRow);
          SubNode.Row.Hint := P.Key; // put Property's Key in Row's Hint
          SubNode.Row.Caption := P.Caption;
          SubNode.Row.ReadOnly := (not P.RowEditable) or FReadOnly;
          SubNode.Row.ImageIndex := P.ImageIndex;
          if not FReadOnly then (SubNode.Row as TdxInspectorTextCheckRow)
            .OnToggleClick := CheckRowToggleClick;
          RowList.Add(SubNode.Row);
        end;
      rkTextChoiceRow:
        begin
          SubNode := SuperNode.AddChildEx(TdxInspectorTextPickRow);
          SubNode.Row.Hint := P.Key; // put Property's Key in Row's Hint
          SubNode.Row.Caption := P.Caption;
          SubNode.Row.ReadOnly := (not P.RowEditable) or FReadOnly;
          SubNode.Row.ImageIndex := P.ImageIndex;
          with SubNode.Row as TdxInspectorTextPickRow do
          begin
            Items.Assign(P.RowItemValues);
            if not FReadOnly then
              OnCloseUp := PickRowCloseUp;
          end;
          RowList.Add(SubNode.Row);
        end;
    end;
  end;
  CategoryRows.Free;
  Inspector.FullExpand;
  Inspector.EndUpdate;
end;

procedure TPropertyEditorWithTdxInspector.InspectorCustomDraw(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: string; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  if FReadOnly then
    AFont.Color := clGrayText
  else
    AFont.Color := clWindowText;
end;

procedure TPropertyEditorWithTdxInspector.InspectorChangeNode(Sender: TObject;
  OldNode, Node: TdxInspectorNode);
begin
  if not(Node as TdxInspectorRowNode).Row.IsCategory then
    if Assigned(FOnPropertySelected) then
    begin
      FOnPropertySelected(Self, (Node as TdxInspectorRowNode).Row.Caption);
    end;
end;

procedure TPropertyEditorWithTdxInspector.InspectorEdited(Sender: TObject;
  Node: TdxInspectorNode; Row: TdxInspectorRow);
begin
  if ((Row is TdxInspectorCheckRow) or (Row is TdxInspectorPickRow)) and
    (Row.ReadOnly) then
    Exit;
  PropertyModified(Sender, Node, Row);
end;

procedure TPropertyEditorWithTdxInspector.ImageRowCloseUp(Sender: TObject; var Value: string;
  var Accept: Boolean);
var
  Row: TdxInspectorRow;
begin
  Row := Sender as TdxInspectorRow; (Row as TdxInspectorTextImageRow)
  .Text := Value;
  PropertyModified(Sender, Row.Node, Row);
end;

procedure TPropertyEditorWithTdxInspector.PickRowCloseUp(Sender: TObject; var Value: Variant;
  var Accept: Boolean);
var
  Row: TdxInspectorRow;
begin
  Row := Sender as TdxInspectorRow; (Row as TdxInspectorTextPickRow)
  .Text := Value;
  PropertyModified(Sender, Row.Node, Row);
end;

procedure TPropertyEditorWithTdxInspector.CheckRowToggleClick(Sender: TObject;
  const Text: string; State: TdxCheckBoxState);
var
  Row: TdxInspectorRow;
begin
  Row := Sender as TdxInspectorRow; (Row as TdxInspectorTextCheckRow)
  .Text := Text;
  PropertyModified(Sender, Row.Node, Row);
end;

procedure TPropertyEditorWithTdxInspector.PropertyModified(Sender: TObject;
  Node: TdxInspectorNode; Row: TdxInspectorRow);
var
  RowKey: string;
  RowValue: string;
begin
  RowKey := Row.Hint;
  //RowKey := Row.Caption;
  RowValue := '';
  if Row is TdxInspectorTextRow then
    RowValue := (Row as TdxInspectorTextRow).Text
  else if Row is TdxInspectorTextCheckRow then
    RowValue := (Row as TdxInspectorTextCheckRow).Text
  else if Row is TdxInspectorTextPickRow then
    RowValue := (Row as TdxInspectorTextPickRow).Text
  else if Row is TdxInspectorTextButtonRow then
    RowValue := (Row as TdxInspectorTextButtonRow).Text
  else if Row is TdxInspectorTextImageRow then
    RowValue := (Row as TdxInspectorTextImageRow).Text;

  PropertyAdaptor.SetPropertyValue(FInspectingElements, RowKey, RowValue);
end;

procedure TPropertyEditorWithTdxInspector.RowButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  PropertyAdaptor.PropertyButtonClicked(FInspectingElements,
    (Sender as TdxInspectorTextButtonRow).Hint);
end;

procedure TPropertyEditorWithTdxInspector.EnterHandler(Sender: TObject);
begin
  if Assigned(OnEnter) then
    OnEnter(Sender);
end;

procedure TPropertyEditorWithTdxInspector.SetEnabled(Value: Boolean);
begin
  inherited;
  if Value then
    Inspector.Color := clWindow
  else
    Inspector.Color := clBtnFace;
end;



procedure TPropertyEditorWithTdxInspector.UpdateProperties;
var
  //I: Integer;
  Row: TdxInspectorRow;
  E: PElement;
  Val: string;

begin
  Inspector.BeginUpdate;
  // Update PropertyEditor according to single element
  if FInspectingElements.Count = 1 then
  begin
    for Row in RowList do
    begin
      //Row := RowList[I];
      E := FInspectingElements[0] as PElement;
      Val := PropertyAdaptor.GetPropertyValue(E, Row.Hint);
      if Row is TdxInspectorTextRow then (Row as TdxInspectorTextRow)
        .Text := Val
      else if Row is TdxInspectorTextCheckRow then
  (Row as TdxInspectorTextCheckRow)
        .Text := Val
      else if Row is TdxInspectorTextPickRow then
  (Row as TdxInspectorTextPickRow)
        .Text := Val
      else if Row is TdxInspectorTextButtonRow then
  (Row as TdxInspectorTextButtonRow)
        .Text := Val
      else if Row is TdxInspectorTextImageRow then
  (Row as TdxInspectorTextImageRow)
        .Text := Val;
    end;
  end
  // Update PropertyEditor according to multiple elements
  else if FInspectingElements.Count > 1 then
  begin
    for Row in RowList do
    begin
      //Row := RowList[I];
      Val := MixPropertyValue(Row.Hint);
      if Row is TdxInspectorTextRow then (Row as TdxInspectorTextRow)
        .Text := Val
      else if Row is TdxInspectorTextCheckRow then
  (Row as TdxInspectorTextCheckRow)
        .Text := Val
      else if Row is TdxInspectorTextPickRow then
  (Row as TdxInspectorTextPickRow)
        .Text := Val
      else if Row is TdxInspectorTextButtonRow then
  (Row as TdxInspectorTextButtonRow)
        .Text := Val
      else if Row is TdxInspectorTextImageRow then
  (Row as TdxInspectorTextImageRow)
        .Text := Val;
    end;
  end;
  Inspector.EndUpdate;
end;

procedure TPropertyEditorWithTdxInspector.ApplyChanges;
begin
  Inspector.PostEditor;
end;




end.
