unit PatternAddInFrmWithJvclInspector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PatternAddInFrm, ImgList, ComCtrls, StdCtrls, ExtCtrls, JvWizard,
  JvExControls, JvInspector, JvclExtensions, WhiteStarUML_TLB, PatternDef,
  Generics.Collections;

type
  PPatternItemRow = class;

  TPatternAddInFormWithJvclInspector = class(TPatternAddInForm)
    PatternInspector: TJvInspector;
    procedure PatternInspectorItemEdit(Sender: TJvCustomInspector;
      Item: TJvCustomInspectorItem; var DisplayStr: string);

  private type
    TPatternRowFromInspectorItem = TDictionary<TJvCustomInspectorItem,PPatternItemRow>;

  private
    { Private declarations }
    FElemsHolder: TInspectorElemsHolder;
    FPatternRowFromInspectorItem: TPatternRowFromInspectorItem;
    function FindPatternRow(Row: TJvCustomInspectorItem): PPatternItemRow;
  protected
    procedure BuildPatternInspectorView(PPN: PPatternNode); override;
    procedure ClearInspectorRows; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;


      // PPatternItemRow
  PPatternItemRow = class(PPatternItemRowBase)
  protected
    FInspector: TJvInspector;
    FPatternParameter: PPatternParameter;
    FInspectorRow: TJvInspectorElemBase;
    FParentRow: TJvInspectorCustomCategoryItem;
    procedure HandleBtnClick(var DisplayStr: string); virtual;

  public
    constructor Create(AInspector: TJvInspector; APatternParameter: PPatternParameter;
      ParentRow: TJvInspectorCustomCategoryItem;  AElemsHolder: TInspectorElemsHolder);
    property InspectorRow: TJvInspectorElemBase read FInspectorRow;
  end;

  // PElementPatternItemRow
  PElementPatternItemRow = class(PPatternItemRow)
  private
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure HandleBtnClick(var DisplayStr: string); override;
    procedure AssignParameterValue; override;
  end;

  // PElementListPatternItemRow
  PElementListPatternItemRow = class(PPatternItemRow)
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure HandleBtnClick(var DisplayStr: string); override;
    procedure AssignParameterValue; override;
  end;

var
  PatternAddInFormWithJvclInspector: TPatternAddInFormWithJvclInspector;

implementation

uses
  ShellAPI,
  Symbols, NLS, NLS_PatternAddIn, PatternParamColEditForm;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// PPatternItemRow

constructor PPatternItemRow.Create(AInspector: TJvInspector;
  APatternParameter: PPatternParameter; ParentRow: TJvInspectorCustomCategoryItem;
  AElemsHolder: TInspectorElemsHolder);
begin
  inherited Create;
  FInspector := AInspector;
  FPatternParameter := APatternParameter;
  FParentRow := ParentRow;
  CreateInspectorRow;

  if FInspectorRow <> nil then begin
    //FInspectorRow.Item.OnValueChanged := ValueChanged;
    AElemsHolder.AddElem(FInspectorRow);
  end;

end;

procedure PPatternItemRow.HandleBtnClick(var DisplayStr: string);
begin

end;

// PPatternItemRow
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// PElementPatternItemRow

procedure PElementPatternItemRow.CreateInspectorRow;
begin
  inherited;
    FInspectorRow :=  TJvInspectorElem<string>.CreateElem(FParentRow, FPatternParameter.Caption);
    if FInspectorRow <> nil then
      FInspectorRow.Item.Flags := FInspectorRow.Item.Flags + [iifEditButton];
   DrawInspector;
end;

procedure PElementPatternItemRow.DrawInspector;
var
  TextBtRow: TJvCustomInspectorItem;
begin
  inherited;
  TextBtRow := FInspectorRow.Item;
  if (FPatternParameter.ElementKind = pkModel) or
     (FPatternParameter.ElementKind = pkSubsystem) or
     (FPatternParameter.ElementKind = pkPackage) or
     (FPatternParameter.ElementKind = pkClass) or
     (FPatternParameter.ElementKind = pkInterface)
  then
    TextBtRow.DisplayValue := FPatternParameter.DefaultValue
  else begin
    TextBtRow.DisplayValue := '';
    TextBtRow.ReadOnly := True;
  end;

  FPatternParameter.Value := TextBtRow.DisplayValue;
end;

procedure PElementPatternItemRow.HandleBtnClick(var DisplayStr: string);
var
  ElementSelector: IElementSelector;
  Elem: IUMLElement;
  ElemName, Str: string;
begin
  ElementSelector := PatternAddInForm.StarUMLApp.ElementSelector;
  ElementSelector.AllowNull := False;
  // filtering
  if (FPatternParameter.ElementKind = pkPackage) or
     (FPatternParameter.ElementKind = pkModel) or
     (FPatternParameter.ElementKind = pkSubsystem)
  then ElementSelector.Filter(fkPackages)
  else if (FPatternParameter.ElementKind = pkClass) or
          (FPatternParameter.ElementKind = pkInterface)
  then ElementSelector.Filter(fkClassifiers)
  else ElementSelector.Filter(fkAll);
  // set selectable model
  ElementSelector.ClearSelectableModels;
  case FPatternParameter.ElementKind of
    pkPackage: ElementSelector.AddSelectableModel('UMLPackage');
    pkModel: ElementSelector.AddSelectableModel('UMLModel');
    pkSubsystem: ElementSelector.AddSelectableModel('UMLSubsystem');
    pkClass: ElementSelector.AddSelectableModel('UMLClass');
    pkInterface: ElementSelector.AddSelectableModel('UMLInterface');
    pkAttribute: ElementSelector.AddSelectableModel('UMLAttribute');
    pkOperation: ElementSelector.AddSelectableModel('UMLOperation');
    pkLiteral: ElementSelector.AddSelectableModel('UMLEnumerationLiteral');
    pkParameter: ElementSelector.AddSelectableModel('UMLParameter');
  end;
  // execute
  Str := Format(TXT_SELECT_PARAM_ELEM, [FPatternParameter.Caption]);
  if ElementSelector.Execute(Str) then begin
    Elem := ElementSelector.GetSelectedModel as IUMLElement;
    ElemName := Elem.Name;
    FPatternParameter.ClearElementValues;
    DisplayStr := ElemName;
    FPatternParameter.AddElementValue(Elem);
  end;
end;

procedure PElementPatternItemRow.AssignParameterValue;
var
  Str: string;
  Elem: IUMLElement;
begin
  inherited;
  Str := Trim(FInspectorRow.Item.DisplayValue);
  if Str = '' then
    raise EInvalidParameterValue.Create(Format(ERR_EMPTY_PARAM_VALUE, [FPatternParameter.Caption]));

  if FPatternParameter.ElementValueCount > 0 then begin
    Elem := FPatternParameter.ElementValues[0];
    if LowerCase(Trim(Elem.Name)) <> LowerCase(Str) then begin
      FPatternParameter.ClearElementValues;
    end;
  end;

  if FPatternParameter.ElementValueCount = 0 then begin
    Elem := FindExistElement(Str);
    if Elem <> nil then begin
      case FPatternParameter.ElementKind of
        pkPackage:
          if Elem.GetClassName <> 'UMLPackage' then
            raise EInvalidParameterValue.Create(Format(ERR_ELEM_NAME_CONFLICT,
                                                 [FPatternParameter.Caption]));
        pkModel:
          if Elem.GetClassName <> 'UMLModel' then
            raise EInvalidParameterValue.Create(Format(ERR_ELEM_NAME_CONFLICT,
                                                 [FPatternParameter.Caption]));
        pkSubsystem:
          if Elem.GetClassName <> 'UMLSubsystem' then
            raise EInvalidParameterValue.Create(Format(ERR_ELEM_NAME_CONFLICT,
                                                 [FPatternParameter.Caption]));
        pkClass:
          if Elem.GetClassName <> 'UMLClass' then
            raise EInvalidParameterValue.Create(Format(ERR_ELEM_NAME_CONFLICT,
                                                 [FPatternParameter.Caption]));
        pkInterface:
          if Elem.GetClassName <> 'UMLInterface' then
            raise EInvalidParameterValue.Create(Format(ERR_ELEM_NAME_CONFLICT,
                                                 [FPatternParameter.Caption]));
      end;
      FPatternParameter.AddElementValue(Elem);
    end;
  end;

  FPatternParameter.Value := Str;
end;

// PElementPatternItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PElementListPatternItemRow

procedure PElementListPatternItemRow.CreateInspectorRow;
begin
  inherited;
    FInspectorRow :=  TJvInspectorElem<string>.CreateElem(FParentRow, FPatternParameter.Caption);
    if FInspectorRow <> nil then
      FInspectorRow.Item.Flags := FInspectorRow.Item.Flags + [iifEditButton];

  DrawInspector;
end;

procedure PElementListPatternItemRow.DrawInspector;
var
  TextBtRow: TJvCustomInspectorItem;
begin
  inherited;
  TextBtRow := FInspectorRow.Item;
  if (FPatternParameter.ElementKind = pkModel) or
     (FPatternParameter.ElementKind = pkSubsystem) or
     (FPatternParameter.ElementKind = pkPackage) or
     (FPatternParameter.ElementKind = pkClass) or
     (FPatternParameter.ElementKind = pkInterface)
  then
    TextBtRow.DisplayValue := FPatternParameter.DefaultValue
  else begin
    TextBtRow.DisplayValue := '';
    TextBtRow.ReadOnly := True;
  end;
end;

procedure PElementListPatternItemRow.HandleBtnClick(var DisplayStr: string);
var
  I: Integer;
  Elem: IUMLElement;
  Str: string;
begin
  PatternParamColEditFrm := TPatternParamColEditFrm.Create(nil);
  try
    PatternParamColEditFrm.StarUMLApp := PatternAddInForm.StarUMLApp;
    PatternParamColEditFrm.ElemKind := FPatternParameter.ElementKind;
    PatternParamColEditFrm.ElementSelectorCaption := FPatternParameter.Caption;
    for I := 0 to FPatternParameter.ElementValueCount - 1 do begin
      Elem := FPatternParameter.ElementValues[I];
      PatternParamColEditFrm.AddElement(Elem);
    end;
    if PatternParamColEditFrm.Execute then begin
      if PatternParamColEditFrm.Changed then begin
        DisplayStr := '';
        FPatternParameter.ClearElementValues;
        Str := '';
        for I := 0 to PatternParamColEditFrm.ElementCount - 1 do begin
          Elem := PatternParamColEditFrm.Element[I];
          FPatternParameter.AddElementValue(Elem);
          Str := Str + Elem.Name;
          if I < PatternParamColEditFrm.ElementCount - 1 then Str := Str + ', ';
        end;
        if str <> '' then begin
          DisplayStr := Str;
        end;
      end;
    end;
  finally
    PatternParamColEditFrm.Free;
  end;
end;

procedure PElementListPatternItemRow.AssignParameterValue;
var
  SL: TStringList;
  Str, TempStr: string;
  I, J: Integer;
  B: Boolean;
  Elem: IUMLElement;
begin
  inherited;
  Str := Trim(FInspectorRow.Item.DisplayValue);
  if Str = '' then begin
    FPatternParameter.ClearElementValues;
    FPatternParameter.Value := '';
    Exit;
  end;
  if (FPatternParameter.ElementKind = pkAttribute) or
     (FPatternParameter.ElementKind = pkOperation) or
     (FPatternParameter.ElementKind = pkLiteral) or
     (FPatternParameter.ElementKind = pkParameter)
  then Exit;

  FPatternParameter.Value := '';
  SL := TStringList.Create;
  try
    SeparateStringByComma(Str, SL);
    Str := '';
    for I := 0 to SL.Count - 1 do begin
      TempStr := '';
      TempStr := SL.Strings[I];
      B := False;
      for J := 0 to FPatternParameter.ElementValueCount - 1 do begin
        if LowerCase(FPatternParameter.ElementValues[J].Name) = LowerCase(TempStr) then
        begin
          B := True;
          Break;
        end;
      end;
      if not B then begin
        Elem := FindExistElement(TempStr);
        if Elem <> nil then begin
          case FPatternParameter.ElementKind of
            pkPackage:
              if Elem.GetClassName <> 'UMLPackage' then
                raise EInvalidParameterValue.Create(Format(ERR_ELEM_NAME_CONFLICT,
                                                     [FPatternParameter.Caption]));
            pkModel:
              if Elem.GetClassName <> 'UMLModel' then
                raise EInvalidParameterValue.Create(Format(ERR_ELEM_NAME_CONFLICT,
                                                     [FPatternParameter.Caption]));
            pkSubsystem:
              if Elem.GetClassName <> 'UMLSubsystem' then
                raise EInvalidParameterValue.Create(Format(ERR_ELEM_NAME_CONFLICT,
                                                     [FPatternParameter.Caption]));
            pkClass:
              if Elem.GetClassName <> 'UMLClass' then
                raise EInvalidParameterValue.Create(Format(ERR_ELEM_NAME_CONFLICT,
                                                     [FPatternParameter.Caption]));
            pkInterface:
              if Elem.GetClassName <> 'UMLInterface' then
                raise EInvalidParameterValue.Create(Format(ERR_ELEM_NAME_CONFLICT,
                                                     [FPatternParameter.Caption]));
          end;
          FPatternParameter.AddElementValue(Elem);
        end else begin
          if Str <> '' then Str := Str + ', ' + TempStr
          else Str := TempStr;
        end;
      end;
    end;
    FPatternParameter.Value := Str;
  finally
    SL.Free;
  end;
end;

// PElementListPatternItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TPatternAddInFormWithJvclInspector

constructor TPatternAddInFormWithJvclInspector.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FElemsHolder := TInspectorElemsHolder.Create(PatternInspector);
  FPatternRowFromInspectorItem := TPatternRowFromInspectorItem.Create;

end;

destructor TPatternAddInFormWithJvclInspector.Destroy;
begin
  inherited;
  FPatternRowFromInspectorItem.Free;
  FreeAndNil(FElemsHolder);
  TJvInspectorStringEnumItem.UnregisterAsDefaultItem;
  TJvInspectorMultilineStringItem.UnregisterAsDefaultItem;
  TJvInspectorNamedColorItem.UnregisterAsDefaultItem;
end;


function TPatternAddInFormWithJvclInspector.FindPatternRow(Row: TJvCustomInspectorItem): PPatternItemRow;
var
  PatternRow: PPatternItemRow;
begin
  if (FPatternRowFromInspectorItem <> nil) and
      FPatternRowFromInspectorItem.TryGetValue(Row, PatternRow) then
    Result := PatternRow
  else
    Result := nil;
end;

procedure TPatternAddInFormWithJvclInspector.PatternInspectorItemEdit(
  Sender: TJvCustomInspector; Item: TJvCustomInspectorItem;
  var DisplayStr: string);
var
  PatternItemRow: PPatternItemRow;
begin
  inherited;
  PatternItemRow := FindPatternRow(Item);
  PatternItemRow.HandleBtnClick(DisplayStr);
end;

procedure TPatternAddInFormWithJvclInspector.BuildPatternInspectorView(PPN: PPatternNode);
var
  ParameterRow: TJvInspectorCustomCategoryItem;
  PatternRef: PatternDef.PPattern;
  ParameterRef: PatternDef.PPatternParameter;
  PatternRow : PPatternItemRow;
  I: Integer;
  Inspector: TJvInspector;
begin
  Inspector := PatternInspector;
  ClearPatternRows;
  PatternRef := PPN as PPattern;
  Inspector.BeginUpdate;
  ClearInspectorRows;
  FPatternRowFromInspectorItem.Clear;
  ParameterRow := TJvInspectorCustomCategoryItem.Create(Inspector.Root, nil);
  ParameterRow.SortKind := iskNone;
  ParameterRow.Name := PatternRef.Name;
  for I := 0 to PatternRef.PatternParameterCount - 1 do begin
    PatternRow := nil;
    ParameterRef := PatternRef.Parameters[I];
    case ParameterRef.ParamType of
      ptInteger:
        Assert(False);
      ptBoolean:
        Assert(False);
      ptString:
        Assert(False);
      ptEnumeration:
        Assert(False);
      ptElement:
        PatternRow := PElementPatternItemRow.Create(Inspector, ParameterRef, ParameterRow,
          FElemsHolder);
      ptElementList:
        PatternRow := PElementListPatternItemRow.Create(Inspector, ParameterRef, ParameterRow,
          FElemsHolder);
      else
        Assert(False);
    end; // End of case
    if PatternRow <> nil then begin
        PatternRows.Add(PatternRow);
        FPatternRowFromInspectorItem.Add(PatternRow.InspectorRow.Item, PatternRow);
      end;
  end; // End of for
  Inspector.Root.ExpandItems(true);
  Inspector.EndUpdate;

end;

procedure TPatternAddInFormWithJvclInspector.ClearInspectorRows;
begin
  if PatternInspector <> nil then
    PatternInspector.Clear;
  if FElemsHolder <> nil then
    FElemsHolder.EmptyElemList;
end;

// TPatternAddInFormWithJvclInspector
////////////////////////////////////////////////////////////////////////////////



end.

