unit PatternAddInFrmWithTdxInspector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PatternAddInFrm, dxExEdtr, ImgList, ComCtrls, dxCntner, dxInspct,
  StdCtrls, ExtCtrls, JvWizard, JvExControls, StarUML_TLB, PatternDef;

type
  PPatternItemRow = class;

  TPatternAddInFormWithTdxInspector = class(TPatternAddInForm)
    PatternInspector: TdxInspector;

    procedure PatternInspectorChangeNode(Sender: TObject; OldNode, Node: TdxInspectorNode);
  private
    { Private declarations }
    function FindPatternRow(Row: TdxInspectorRow): PPatternItemRow;
  protected
    procedure BuildPatternInspectorView(PPN: PPatternNode); override;
    procedure ClearInspectorRows; override;
  public
    { Public declarations }
  end;


    // PPatternItemRow
  PPatternItemRow = class(PPatternItemRowBase)
  protected
    FInspector: TdxInspector;
    FPatternParameter: PPatternParameter;
    FInspectorRow: TdxInspectorRow;
    FParentRow: TdxInspectorRow;
    //procedure CreateInspectorRow; virtual; abstract;
    //procedure DrawInspector; virtual; abstract;
    //function FindExistElement(ElemName: string): IUMLElement;
  public
    constructor Create(AInspector: TdxInspector; APatternParameter: PPatternParameter;
      ParentRow: TdxInspectorRow);
    //procedure AssignParameterValue; virtual;
    property InspectorRow: TdxInspectorRow read FInspectorRow;
  end;

    // PIntegerPatternItemRow
  PIntegerPatternItemRow = class(PPatternItemRow)
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure AssignParameterValue; override;
  end;

  // PBooleanPatternItemRow
  PBooleanPatternItemRow = class(PPatternItemRow)
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure AssignParameterValue; override;
  end;

  // PStringPatternItemRow
  PStringPatternItemRow = class(PPatternItemRow)
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure AssignParameterValue; override;
  end;

  // PEnumerationPatternItemRow
  PEnumerationPatternItemRow = class(PPatternItemRow)
  private
    procedure PickRowCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure AssignParameterValue; override;
  end;

  // PElementPatternItemRow
  PElementPatternItemRow = class(PPatternItemRow)
  private
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure HandleBtnClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure AssignParameterValue; override;
  end;

  // PElementListPatternItemRow
  PElementListPatternItemRow = class(PPatternItemRow)
  protected
    procedure CreateInspectorRow; override;
    procedure DrawInspector; override;
  public
    procedure HandleBtnListClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure AssignParameterValue; override;
  end;


var
  PatternAddInFormWithTdxInspector: TPatternAddInFormWithTdxInspector;
  //PatternAddInForm: TPatternAddInFormWithTdxInspector;

implementation

uses
  ShellAPI,
  Symbols, NLS, NLS_PatternAddIn, PatternParamColEditForm,
  dxInspRw;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// PPatternItemRow

constructor PPatternItemRow.Create(AInspector: TdxInspector;
  APatternParameter: PPatternParameter; ParentRow: TdxInspectorRow);
begin
  inherited Create;
  FInspector := AInspector;
  FPatternParameter := APatternParameter;
  FParentRow := ParentRow;
  CreateInspectorRow;
end;

// PPatternItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PIntegerPatternItemRow

procedure PIntegerPatternItemRow.CreateInspectorRow;
begin
  inherited;
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextRow).Row;
  DrawInspector;
end;

procedure PIntegerPatternItemRow.DrawInspector;
var
  TextRow: TdxInspectorTextRow;
begin
  inherited;
  FInspectorRow.Caption := FPatternParameter.Caption;
  TextRow := FInspectorRow as TdxInspectorTextRow;
  TextRow.Text := FPatternParameter.DefaultValue;
  FPatternParameter.Value := TextRow.Text;
end;

procedure PIntegerPatternItemRow.AssignParameterValue;
var
  Str: string;
  V, Code: Integer;
begin
  inherited;
  Str := Trim((FInspectorRow as TdxInspectorTextRow).Text);
  if Str = '' then
    raise EInvalidParameterValue.Create(Format(ERR_EMPTY_PARAM_VALUE, [FPatternParameter.Caption]));
  Val(Str, V, Code);
  if Code <> 0 then
    raise EInvalidParameterValue.Create(Format(ERR_INVALID_PARAM_VALUE, [FPatternParameter.Caption, 'Integer']));
  FPatternParameter.Value := Str;
end;

// PIntegerPatternItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PBooleanPatternItemRow

procedure PBooleanPatternItemRow.CreateInspectorRow;
var
  CheckRow: TdxInspectorTextCheckRow;
begin
  inherited;
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextCheckRow).Row;
  CheckRow := FInspectorRow as TdxInspectorTextCheckRow;
  CheckRow.ValueChecked := VALUE_TRUE;
  CheckRow.ValueUnchecked := VALUE_FALSE;
  DrawInspector;
end;

procedure PBooleanPatternItemRow.DrawInspector;
var
  CheckRow: TdxInspectorTextCheckRow;
begin
  inherited;
  FInspectorRow.Caption := FPatternParameter.Caption;
  CheckRow := FInspectorRow as TdxInspectorTextCheckRow;
  CheckRow.Text := FPatternParameter.DefaultValue;
  FPatternParameter.Value := CheckRow.Text;
end;

procedure PBooleanPatternItemRow.AssignParameterValue;
begin
  inherited;
  FPatternParameter.Value := (FInspectorRow as TdxInspectorTextCheckRow).Text;
end;

// PBooleanPatternItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PStringPatternItemRow

procedure PStringPatternItemRow.CreateInspectorRow;
begin
  inherited;
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextRow).Row;
  DrawInspector;
end;

procedure PStringPatternItemRow.DrawInspector;
var
  TextRow: TdxInspectorTextRow;
begin
  inherited;
  FInspectorRow.Caption := FPatternParameter.Caption;
  TextRow := FInspectorRow as TdxInspectorTextRow;
  TextRow.Text := FPatternParameter.DefaultValue;
  FPatternParameter.Value := TextRow.Text;
end;

procedure PStringPatternItemRow.AssignParameterValue;
var
  Str: string;
begin
  inherited;
  Str := Trim((FInspectorRow as TdxInspectorTextRow).Text);
  if Str = '' then
    raise EInvalidParameterValue.Create(Format(ERR_EMPTY_PARAM_VALUE, [FPatternParameter.Caption]));
  FPatternParameter.Value := Str;
end;

// PStringPatternItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PEnumerationPatternItemRow

procedure PEnumerationPatternItemRow.PickRowCloseUp(Sender: TObject; var Value: Variant;
  var Accept: Boolean);
begin
  if (Sender as TdxInspectorTextPickRow).Text <> Value then
    (Sender as TdxInspectorTextPickRow).Text := Value;
end;

procedure PEnumerationPatternItemRow.CreateInspectorRow;
begin
  inherited;
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextPickRow).Row;
  DrawInspector;
end;

procedure PEnumerationPatternItemRow.DrawInspector;
var
  TextPickRow: TdxInspectorTextPickRow;
  I: Integer;
begin
  inherited;
  FInspectorRow.Caption := FPatternParameter.Caption;
  TextPickRow := FInspectorRow as TdxInspectorTextPickRow;
  for I := 0 to FPatternParameter.EnumerationLiterals.Count - 1 do
    TextPickRow.Items.Add(FPatternParameter.EnumerationLiterals.Strings[I]);
  TextPickRow.Text := FPatternParameter.DefaultValue;
  TextPickRow.DropDownListStyle := True;
  TextPickRow.ReadOnly := True;
  TextPickRow.OnCloseUp := PickRowCloseUp;
  FPatternParameter.Value := TextPickRow.Text;
end;

procedure PEnumerationPatternItemRow.AssignParameterValue;
var
  Str: string;
begin
  inherited;
  Str := Trim((FInspectorRow as TdxInspectorTextPickRow).Text);
  FPatternParameter.Value := Str;
end;

// PEnumerationPatternItemRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PElementPatternItemRow

procedure PElementPatternItemRow.CreateInspectorRow;
begin
  inherited;
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextButtonRow).Row;
  DrawInspector;
end;

procedure PElementPatternItemRow.DrawInspector;
var
  TextBtRow: TdxInspectorTextButtonRow;
begin
  inherited;
  FInspectorRow.Caption := FPatternParameter.Caption;
  TextBtRow := FInspectorRow as TdxInspectorTextButtonRow;
  TextBtRow.OnButtonClick := HandleBtnClick;
  if (FPatternParameter.ElementKind = pkModel) or
     (FPatternParameter.ElementKind = pkSubsystem) or
     (FPatternParameter.ElementKind = pkPackage) or
     (FPatternParameter.ElementKind = pkClass) or
     (FPatternParameter.ElementKind = pkInterface)
  then
    TextBtRow.Text := FPatternParameter.DefaultValue
  else begin
    TextBtRow.Text := '';
    TextBtRow.ReadOnly := True;
  end;

  FPatternParameter.Value := TextBtRow.Text;
end;

procedure PElementPatternItemRow.HandleBtnClick(Sender: TObject; AbsoluteIndex: Integer);
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
    (FInspectorRow as TdxInspectorTextButtonRow).Text := ElemName;
    FPatternParameter.AddElementValue(Elem);
  end;
end;

procedure PElementPatternItemRow.AssignParameterValue;
var
  Str: string;
  Elem: IUMLElement;
begin
  inherited;
  Str := Trim((FInspectorRow as TdxInspectorTextButtonRow).Text);
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
  FInspectorRow := FParentRow.Node.AddChildEx(TdxInspectorTextButtonRow).Row;
  DrawInspector;
end;

procedure PElementListPatternItemRow.DrawInspector;
var
  TextBtRow: TdxInspectorTextButtonRow;
begin
  inherited;
  FInspectorRow.Caption := FPatternParameter.Caption;
  TextBtRow := FInspectorRow as TdxInspectorTextButtonRow;
  TextBtRow.OnButtonClick := HandleBtnListClick;
  if (FPatternParameter.ElementKind = pkModel) or
     (FPatternParameter.ElementKind = pkSubsystem) or
     (FPatternParameter.ElementKind = pkPackage) or
     (FPatternParameter.ElementKind = pkClass) or
     (FPatternParameter.ElementKind = pkInterface)
  then
    TextBtRow.Text := FPatternParameter.DefaultValue
  else begin
    TextBtRow.Text := '';
    TextBtRow.ReadOnly := True;
  end;
end;

procedure PElementListPatternItemRow.HandleBtnListClick(Sender: TObject;
  AbsoluteIndex: Integer);
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
        (FInspectorRow as TdxInspectorTextButtonRow).Text := '';
        FPatternParameter.ClearElementValues;
        Str := '';
        for I := 0 to PatternParamColEditFrm.ElementCount - 1 do begin
          Elem := PatternParamColEditFrm.Element[I];
          FPatternParameter.AddElementValue(Elem);
          Str := Str + Elem.Name;
          if I < PatternParamColEditFrm.ElementCount - 1 then Str := Str + ', ';
        end;
        if str <> '' then begin
          (FInspectorRow as TdxInspectorTextButtonRow).Text := Str;
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
  Str := Trim((FInspectorRow as TdxInspectorTextButtonRow).Text);
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
// TPatternAddInFormWithTdxInspector

procedure TPatternAddInFormWithTdxInspector.ClearInspectorRows;
begin
   PatternInspector.ClearRows;
end;

procedure TPatternAddInFormWithTdxInspector.BuildPatternInspectorView(PPN: PPatternNode);
var
  ParameterRow: TdxInspectorTextRow;
  PatternRef: PatternDef.PPattern;
  ParameterRef: PatternDef.PPatternParameter;
  PatternRow : PPatternItemRow;
  I: Integer;
  Inspector: TdxInspector;
begin
  Inspector := PatternInspector;
  ClearPatternRows;
  PatternRef := PPN as PPattern;
  ParameterRow := Inspector.AddEx(TdxInspectorTextRow).Row as TdxInspectorTextRow;
  ParameterRow.IsCategory := True;
  ParameterRow.Caption := PatternRef.Name;
  for I := 0 to PatternRef.PatternParameterCount - 1 do begin
    PatternRow := nil;
    ParameterRef := PatternRef.Parameters[I];
    case ParameterRef.ParamType of
      ptInteger:
        PatternRow := PIntegerPatternItemRow.Create(Inspector, ParameterRef, ParameterRow);
      ptBoolean:
        PatternRow := PBooleanPatternItemRow.Create(Inspector, ParameterRef, ParameterRow);
      ptString:
        PatternRow := PStringPatternItemRow.Create(Inspector, ParameterRef, ParameterRow);
      ptEnumeration:
        PatternRow := PEnumerationPatternItemRow.Create(Inspector, ParameterRef, ParameterRow);
      ptElement:
        PatternRow := PElementPatternItemRow.Create(Inspector, ParameterRef, ParameterRow);
      ptElementList:
        PatternRow := PElementListPatternItemRow.Create(Inspector, ParameterRef, ParameterRow);
    end;
    if PatternRow <> nil then PatternRows.Add(PatternRow);
  end;
  Inspector.FullExpand;
end;


function TPatternAddInFormWithTdxInspector.FindPatternRow(Row: TdxInspectorRow): PPatternItemRow;
var
  PatternRowBase: PPatternItemRowBase;
  PatternRow: PPatternItemRow;
begin
  Result := nil;
  for PatternRowBase in PatternRows do begin
    PatternRow := PatternRowBase as PPatternItemRow;
    if PatternRow.InspectorRow = Row then
      Result := PatternRow;
  end;
end;

procedure TPatternAddInFormWithTdxInspector.PatternInspectorChangeNode(Sender: TObject;
  OldNode, Node: TdxInspectorNode);
var
  PatternRow: PPatternItemRow;
  PD: PPatternParameter;
begin
  if Node is TdxInspectorRowNode then begin
    PatternRow := FindPatternRow((Node as TdxInspectorRowNode).Row);
    if PatternRow <> nil then begin
      PD:= PatternRow.FPatternParameter;
      PatternMemo.Clear;
      PatternMemo.Lines.Add(PD.Description);
      PatternMemo.SelStart := 0;
      PatternMemo.SelLength := 0;
    end;
  end;
end;


// TPatternAddInFormWithTdxInspector
////////////////////////////////////////////////////////////////////////////////

end.
