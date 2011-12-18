unit OptionDialogFrmWithTdxInspector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OptionDialogFrm, dxExEdtr, ImgList, StdCtrls, ExtCtrls, FlatPanel,
  ComCtrls, dxCntner, dxInspct, OptionMgr, OptionNodes,
  OptionRowsBase, OptionRowsTdxImpl;

type
  TOptionDialogFormWithTdxInspector = class(TOptionDialogForm)
    OptionInspector: TdxInspector;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  POptionDialogWithTdxInspector = class(POptionDialog)
  private
    //DialogForm: TOptionDialogFormWithTdxInspector;
    FInspector:  TdxInspector;
    procedure HandleInspectorEdited(Sender: TObject; Node: TdxInspectorNode; Row: TdxInspectorRow);
    procedure HandleInspectorKeyPress(Sender: TObject; var Key: Char);
    procedure HandleInspectorChangeNode(Sender: TObject; OldNode, Node: TdxInspectorNode);
    function FindOptionRow(Row: TdxInspectorRow): POptionItemRow;
  protected
    procedure HandleInspectorExit(Sender: TObject); override;
    procedure BuildOptionCategoryInspector(AOptionCategory: POptionCategory); override;
    procedure ClearInspectorRows; override;
    procedure RestoreValue; override;

  public
    constructor Create(AOptionManager: POptionManager);

  end;

var
  OptionDialogFormWithTdxInspector: TOptionDialogFormWithTdxInspector;

implementation

uses
  OptionMgrAux, OptMgr_TLB, NLS,
  dxInspRw;

{$R *.dfm}

constructor POptionDialogWithTdxInspector.Create(AOptionManager: POptionManager);
var
  Form: TOptionDialogFormWithTdxInspector;
begin
  Form := TOptionDialogFormWithTdxInspector.Create(Application);
  FInspector := Form.OptionInspector;
  DialogForm := Form;

  inherited;

  FInspector.OnEdited := HandleInspectorEdited;
  FInspector.OnKeyPress := HandleInspectorKeyPress;
  FInspector.OnExit := HandleInspectorExit;
  FInspector.OnChangeNode := HandleInspectorChangeNode;
end;

procedure POptionDialogWithTdxInspector.HandleInspectorEdited(Sender: TObject; Node: TdxInspectorNode; Row: TdxInspectorRow);
var
  OptionRow: POptionItemRowBase;
begin
  for OptionRow in OptionRows do
    with OptionRow as POptionItemRow do begin
      if Node = InspectorRow.Node then begin
        HandleValueChange;
        Exit;
      end;
    end;
end;

procedure POptionDialogWithTdxInspector.HandleInspectorKeyPress(Sender: TObject; var Key: Char);
var
  OptionRow: POptionItemRowBase;
begin
  for OptionRow in OptionRows do
    with OptionRow as POptionItemRow do begin
      if FInspector.FocusedNode = InspectorRow.Node then begin
        HandleKeyPress(Key);
        Exit;
      end;
    end;
end;

procedure POptionDialogWithTdxInspector.HandleInspectorExit(Sender: TObject);
var
  OptionRow: POptionItemRowBase;
begin
  for OptionRow in OptionRows do
    with OptionRow as POptionItemRow do begin
      if FInspector.FocusedNode = InspectorRow.Node then begin
        OptionRow.HandleValueChange;
        Exit;
      end;
    end;
end;

procedure POptionDialogWithTdxInspector.HandleInspectorChangeNode(Sender: TObject; OldNode, Node: TdxInspectorNode);
var
  OptionRow: POptionItemRow;
begin
  if OldNode is TdxInspectorRowNode then begin
    OptionRow := FindOptionRow((OldNode as TdxInspectorRowNode).Row);
    if OptionRow <> nil then
      OptionRow.HandleValueChange;
  end;
  if Node is TdxInspectorRowNode then begin
    OptionRow := FindOptionRow((Node as TdxInspectorRowNode).Row);
    if OptionRow <> nil then begin
      ShowDescription(OptionRow.OptionItem);
    end;
  end;
end;

procedure POptionDialogWithTdxInspector.BuildOptionCategoryInspector(AOptionCategory: POptionCategory);
var
  ClassificationRow: TdxInspectorTextRow;
  OL: POptionClassification;
  OI: POptionItem;
  OptionRow: POptionItemRow;
 begin
  ClearOptionRows;
  for OL in AOptionCategory do begin
   ClassificationRow := FInspector.AddEx(TdxInspectorTextRow).Row as TdxInspectorTextRow;
    ClassificationRow.IsCategory := True;
    ClassificationRow.Caption := OL.Caption;
     for OI in OL do begin
      case OI.Type_ of
        otInteger:
          OptionRow := PIntegerOptionItemRow.Create(OI, ClassificationRow);
        otReal:
          OptionRow := PRealOptionItemRow.Create(OI, ClassificationRow);
        otString:
          OptionRow := PStringOptionItemRow.Create(OI, ClassificationRow);
        otBoolean:
          OptionRow := PBooleanOptionItemRow.Create(OI, ClassificationRow);
        otText:
          OptionRow := PTextOptionItemRow.Create(OI, ClassificationRow);
        otEnumeration:
          OptionRow := PEnumerationOptionItemRow.Create(OI, ClassificationRow);
        otFontName:
          OptionRow := PFontNameOptionItemRow.Create(OI, ClassificationRow);
        otFileName:
          OptionRow := PFileNameOptionItemRow.Create(OI, ClassificationRow);
        otPathName:
          OptionRow := PPathNameOptionItemRow.Create(OI, ClassificationRow);
        otColor:
          OptionRow := PColorOptionItemRow.Create(OI, ClassificationRow);
        otRange:
          OptionRow := PRangeOptionItemRow.Create(OI, ClassificationRow);
        else
          OptionRow := PIntegerOptionItemRow.Create(OI, ClassificationRow);
          OptionRow := nil;
      end;
      if OptionRow <> nil then
        OptionRows.Add(OptionRow);
    end;
  end;
  FInspector.FullExpand;
end;

procedure POptionDialogWithTdxInspector.RestoreValue;
var
  CurNode: TdxInspectorNode;
  CurRowNode: TdxInspectorRowNode;
  CurOptionRow: POptionItemRow;
begin
  CurNode := FInspector.FocusedNode;
  if CurNode = nil then
    Exit;
  if CurNode is TdxInspectorRowNode then begin
    CurRowNode := CurNode as TdxInspectorRowNode;
    if CurRowNode.Row.IsCategory then
      Exit;
    CurOptionRow := FindOptionRow(CurRowNode.Row);
    if CurOptionRow <> nil then begin
      CurOptionRow.OptionItem.RestoreValue;
      CurOptionRow.Refresh;
    end;
  end;
end;

procedure POptionDialogWithTdxInspector.ClearInspectorRows;
begin
  FInspector.ClearRows;
end;

function POptionDialogWithTdxInspector.FindOptionRow(Row: TdxInspectorRow): POptionItemRow;
var
  OptionRow: POptionItemRowBase;
begin
  Result := nil;
  for OptionRow in OptionRows do begin
    if (OptionRow as POptionItemRow).InspectorRow = Row then begin
      Result := OptionRow as POptionItemRow;
      Exit;
    end;
  end;
end;

end.
