unit OptionDialogFrmWithJvclInspector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OptionDialogFrm, ImgList, StdCtrls, ExtCtrls, FlatPanel, ComCtrls,
  OptionMgr, OptionNodes, JvExControls, JvInspector, JvclExtensions,
  Generics.Collections, OptionRowsJvclImpl;

type
  TOptionDialogFormWithJvclInspector = class(TOptionDialogForm)
    OptionInspector: TJvInspector;
  private
    { Private declarations }

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

  POptionDialogWithJvclInspector = class(POptionDialog)

  private type
    TOptionItemFromInspectorItem = TDictionary<TJvCustomInspectorItem,POptionItemRow>;

    TOptionDialogInspectorPainter = class (TJvInspectorBorlandPainter)
    private
      FOptionDialog: POptionDialogWithJvclInspector;

    public
      constructor Create(Owner: TComponent;
        OptionDialog: POptionDialogWithJvclInspector);
      //constructor Create(AOwner: TComponent); reintroduce;
      procedure ApplyNameFont; override;
    end;


  private
    FInspector:  TJvInspector;
    FElemsHolder: TInspectorElemsHolder;
    FOptionItemFromInspectorItem: TOptionItemFromInspectorItem;
    function FindOptionRow(Row: TJvCustomInspectorItem): POptionItemRow;
    procedure OptionInspectorItemSelected(Sender: TObject);
    procedure OptionInspectorItemEdit(Sender: TJvCustomInspector;
      Item: TJvCustomInspectorItem; var DisplayStr: string);

    //procedure OptionInspectorDataValueChanged(Sender: TObject;
    //  Data: TJvCustomInspectorData);

  protected
    procedure ClearInspectorRows; override;
    procedure BuildOptionCategoryInspector(AOptionCategory: POptionCategory); override;
    procedure HandleInspectorExit(Sender: TObject); override;
    procedure RestoreValue; override;
  public
    constructor Create(AOptionManager: POptionManager);
    destructor Destroy; override;
  end;


var
  OptionDialogFormWithJvclInspector: TOptionDialogFormWithJvclInspector;

implementation

uses
  OptionRowsBase, OptionMgrAux, OptMgr_TLB, NLS;

{$R *.dfm}

constructor TOptionDialogFormWithJvclInspector.Create(AOwner: TComponent);
begin
  inherited;
end;


constructor POptionDialogWithJvclInspector.Create(AOptionManager: POptionManager);
var
  Form: TOptionDialogFormWithJvclInspector;
begin
  Form := TOptionDialogFormWithJvclInspector.Create(Application);
  FInspector := Form.OptionInspector;
  FInspector.Root.SortKind := iskNone;
  FInspector.Painter := TOptionDialogInspectorPainter.Create(Form,self);
  FInspector.OnItemEdit := OptionInspectorItemEdit;
  FElemsHolder := TInspectorElemsHolder.Create(FInspector);
  FOptionItemFromInspectorItem := TOptionItemFromInspectorItem.Create;
  DialogForm := Form;

  inherited;

  {FInspector.OnEdited := HandleInspectorEdited;
  FInspector.OnKeyPress := HandleInspectorKeyPress;
  FInspector.OnExit := HandleInspectorExit;
  FInspector.OnChangeNode := HandleInspectorChangeNode;}
  FInspector.OnItemSelected := OptionInspectorItemSelected;
  TJvInspectorStringEnumItem.RegisterAsDefaultItem;
  TJvInspectorMultilineStringItem.RegisterAsDefaultItem;
  TJvInspectorNamedColorItem.RegisterAsDefaultItem;
  //FInspector.OnDataValueChanged := OptionInspectorDataValueChanged;
end;

destructor POptionDialogWithJvclInspector.Destroy;
begin
  inherited;
  FOptionItemFromInspectorItem.Free;
  FreeAndNil(FElemsHolder);
  TJvInspectorStringEnumItem.UnregisterAsDefaultItem;
  TJvInspectorMultilineStringItem.UnregisterAsDefaultItem;
  TJvInspectorNamedColorItem.UnregisterAsDefaultItem;
end;

procedure POptionDialogWithJvclInspector.BuildOptionCategoryInspector(AOptionCategory: POptionCategory);
var
  ClassificationRow: TJvInspectorCustomCategoryItem;
  OL: POptionClassification;
  OI: POptionItem;
  OptionRow: POptionItemRow;
 begin
  FInspector.BeginUpdate;
  FOptionItemFromInspectorItem.Clear;
  ClearOptionRows;
  for OL in AOptionCategory do begin
    ClassificationRow := TJvInspectorCustomCategoryItem.Create(FInspector.Root, nil);
    ClassificationRow.SortKind := iskNone;
    ClassificationRow.Name := OL.Caption;
    ClassificationRow.DisplayName := OL.Caption;
    for OI in OL do begin
      case OI.Type_ of
        otInteger:
          OptionRow := PIntegerOptionItemRow.Create(OI,
            ClassificationRow, FElemsHolder);
        otReal:
          OptionRow := PRealOptionItemRow.Create(OI, ClassificationRow,
            FElemsHolder);
        otString:
          OptionRow := PStringOptionItemRow.Create(OI, ClassificationRow,
            FElemsHolder);
        otBoolean:
          OptionRow := PBooleanOptionItemRow.Create(OI,
            ClassificationRow, FElemsHolder);
        otText:
          OptionRow := PTextOptionItemRow.Create(OI, ClassificationRow,
            FElemsHolder);
        otEnumeration:
          OptionRow := PEnumerationOptionItemRow.Create(OI,
            ClassificationRow, FElemsHolder);
        otFontName:
          OptionRow := PFontNameOptionItemRow.Create(OI, ClassificationRow,
            FElemsHolder);
        otFileName:
          OptionRow := PFileNameOptionItemRow.Create(OI, ClassificationRow,
             FElemsHolder);
        otPathName:
          OptionRow := PPathNameOptionItemRow.Create(OI, ClassificationRow,
            FElemsHolder);
        otColor:
          OptionRow := PColorOptionItemRow.Create(OI, ClassificationRow,
            FElemsHolder);
        otRange:
          {OptionRow := PRangeOptionItemRow.Create(OI, ClassificationRow);}
          OptionRow := PIntegerOptionItemRow.Create(OI, ClassificationRow,
            FElemsHolder);
        else
          {OptionRow := PIntegerOptionItemRow.Create(OI, ClassificationRow);}
          OptionRow := nil;
      end;
      if OptionRow <> nil then begin
        OptionRows.Add(OptionRow);
        FOptionItemFromInspectorItem.Add(OptionRow.InspectorRow.Item,OptionRow);
      end;
    end;
  end;
  FInspector.Root.ExpandItems(true);
  FInspector.EndUpdate;
end;

procedure POptionDialogWithJvclInspector.HandleInspectorExit(Sender: TObject);
var
  OptionRow: POptionItemRowBase;
begin
  for OptionRow in OptionRows do
    with OptionRow as POptionItemRow do begin
      if FInspector.Selected = InspectorRow.Item then begin
        OptionRow.HandleValueChange;
        Exit;
      end;
    end;
end;

procedure POptionDialogWithJvclInspector.RestoreValue;
var
  CurNode: TJvCustomInspectorItem;
  //CurRowNode: TdxInspectorRowNode;
  CurOptionRow: POptionItemRow;
begin
  CurNode := FInspector.Selected;
  if CurNode = nil then
    Exit;
  //if CurNode is TdxInspectorRowNode then begin
    //CurRowNode := CurNode as TdxInspectorRowNode;
  //if CurNode is TJvInspectorCustomCategoryItem then
  //  Exit;

  CurOptionRow := FindOptionRow(CurNode);
  if CurOptionRow <> nil then
  begin
    CurOptionRow.OptionItem.RestoreValue;
    CurOptionRow.Refresh;
  end;
  //end;
end;

procedure POptionDialogWithJvclInspector.ClearInspectorRows;
begin
  if FInspector <> nil then
    FInspector.Clear;
  if FElemsHolder <> nil then
    FElemsHolder.EmptyElemList;
end;

function POptionDialogWithJvclInspector.FindOptionRow(Row: TJvCustomInspectorItem)
  : POptionItemRow;
var
  OptionRow: POptionItemRow;
begin

  if (FOptionItemFromInspectorItem <> nil) and
      FOptionItemFromInspectorItem.TryGetValue(Row, OptionRow) then
    Result := OptionRow
  else
    Result := nil;
end;

procedure POptionDialogWithJvclInspector.OptionInspectorItemSelected(
  Sender: TObject);

 var
  Inspector: TJvInspector;
  OptionRow: POptionItemRow;

begin
  inherited;

  //if Sender is TJvCustomInspectorItem then begin
    Inspector := Sender as TJvInspector;
    OptionRow := FindOptionRow(Inspector.Selected);
    if OptionRow <> nil then
      ShowDescription(OptionRow.OptionItem);
 end;

{procedure POptionDialogWithJvclInspector.OptionInspectorDataValueChanged(
  Sender: TObject; Data: TJvCustomInspectorData);
var
  OptionRow: POptionItemRowBase;
  Inspector: TJvInspector;
begin
  inherited;
  Inspector := Sender as TJvInspector;
  for OptionRow in OptionRows do
    with OptionRow as POptionItemRow do
    begin
      if Inspector.Selected = InspectorRow.Item then
      begin
        HandleValueChange;
        Exit;
      end;
    end;
end;}

constructor POptionDialogWithJvclInspector.TOptionDialogInspectorPainter.Create(
  Owner: TComponent; OptionDialog: POptionDialogWithJvclInspector);
begin
  inherited Create(Owner);
  FOptionDialog := OptionDialog;
end;

procedure POptionDialogWithJvclInspector.TOptionDialogInspectorPainter.ApplyNameFont;
var
  OptionRow: POptionItemRow;
begin
  inherited ApplyNameFont;
  if Assigned(Item) and not (Item is TJvInspectorCustomCategoryItem) then begin
    OptionRow := FOptionDialog.FindOptionRow(Item);
    if (OptionRow <> nil) and OptionRow.OptionItem.Changed then
      Canvas.Font.Style := Canvas.Font.Style + [fsBold];
  end;
end;

procedure POptionDialogWithJvclInspector.OptionInspectorItemEdit(
  Sender: TJvCustomInspector; Item: TJvCustomInspectorItem;
  var DisplayStr: string);
var
  OptionRow: POptionItemRow;
begin
  inherited;
  OptionRow := FindOptionRow(Item);
  OptionRow.RowButtonClick(DisplayStr);
end;

end.
