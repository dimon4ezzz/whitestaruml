unit TasksGridFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  NxColumns6, NxGridView6, NxControls6, NxCustomGrid6, NxVirtualGrid6, NxGrid6, NxCells6,
  DirectMDAObjects, WhiteStarUML_TLB, FlatPanel, Vcl.ImgList, Vcl.StdCtrls, Vcl.Menus;

type
  TTasksGrid = class(TFrame)
    TasksGrid: TNextGrid6;
    TasksGridView: TNxReportGridView6;
    CheckColumn: TNxCheckBoxColumn6;
    GroupColumn: TNxTextColumn6;
    CategoryColumn: TNxTextColumn6;
    PreviewColumn: TNxIconColumn6;
    NameColumn: TNxTextColumn6;
    DocTypeColumn: TNxTextColumn6;
    FormatColumn: TNxTextColumn6;
    TutorialColumn: TNxIconColumn6;
    ParametersColumn: TNxIconColumn6;
    GenerationUnitDescLabel: TLabel;
    GenerationUnitDescPanel: TFlatPanel;
    GenerationUnitDescMemo: TMemo;
    CellValueImages: TImageList;
    procedure TasksGridDblClick(Sender: TObject);
    procedure TasksGridCellClick(Sender: TObject; ACol, ARow: Integer;
      Button: TMouseButton);
    procedure TasksGridCellChange(Sender: TObject; ACol, ARow: Integer);
  private type
    TasksColumn = (TasksColumnCheck, TasksColumnGroup, TasksColumnCategory,
      TasksColumnPreview, TasksColumnName, TasksColumnDocType, TasksColumnFormat,
      TasksColumnTutorial, TasksColumnParameters);

  private
    { Private declarations }
    FStarUMLApp: IStarUMLApplication;
    FOnUpdateUIStates: TNotifyEvent;

    procedure AttachTaskToGridRow(Task: PTask; Row: InxRow);
    function GetTaskFromGridRow(RowIdx: Integer): PTask;
    function GetTaskFromSelectedRow(): PTask;
    procedure ShowTaskProperties;
    procedure ShowTaskDescription;
    procedure PreviewTemplate;
    procedure EditTaskParameters;
    procedure RequestUpdateUIStates;

  public
    { Public declarations }
    procedure SetupTaskRow(ATask: PTask);
    procedure Inititialize(StarUMLApp: IStarUMLApplication;
      OnUpdateUIStates: TNotifyEvent);
    procedure ClearRows;
    procedure Refresh;
    function IsRowSelected: Boolean;
    procedure ClearDescription;
    procedure SelectAllTasks;
    procedure DeselectAllTasks;
    procedure CopySelectedTasksToBatch(ABatch: PBatch);
    function GetGenerationUnitForSelectedRow: PGenerationUnit;


  end;

implementation

{$R *.dfm}

uses
  TaskInfoFrm, PreviewFrm, Utilities;

{ TTasksGrid }

procedure TTasksGrid.AttachTaskToGridRow(Task: PTask; Row: InxRow);
begin
    Row.Data := Task;
end;

procedure TTasksGrid.ClearDescription;
begin
  GenerationUnitDescMemo.Clear;
  TasksGrid.PopupMenu := nil;
end;

procedure TTasksGrid.ClearRows;
begin
  TasksGrid.ClearRows;
end;

procedure TTasksGrid.CopySelectedTasksToBatch(ABatch: PBatch);
var
  I: Integer;
  T: PTask;
begin
  for I := 0 to TasksGrid.RowCount - 1 do begin
    if TasksGrid.Cell[Ord(TasksColumnCheck), I].AsBoolean = True then begin
      T := GetTaskFromGridRow(I);
      if Assigned(T) then
        ABatch.AddTask(T.Clone);
    end;
  end;
end;

function TTasksGrid.GetTaskFromGridRow(RowIdx: Integer): PTask;
begin
  if RowIdx < TasksGrid.RowCount then
    Result := PTask(TasksGrid.Row[RowIdx].Data)
  else
    Result := nil;
end;

function TTasksGrid.GetTaskFromSelectedRow: PTask;
begin
  Result := GetTaskFromGridRow(TasksGrid.SelectedRow)
end;

function TTasksGrid.GetGenerationUnitForSelectedRow: PGenerationUnit;
var
  T: PTask;
begin
  if IsRowSelected then begin
    T := GetTaskFromSelectedRow;
    Result := T.GenerationUnit;
  end
  else
    Result := nil
end;

procedure TTasksGrid.Inititialize(StarUMLApp: IStarUMLApplication;
  OnUpdateUIStates: TNotifyEvent);
begin
  FStarUMLApp :=  StarUMLApp;
  FOnUpdateUIStates := OnUpdateUIStates;
end;

function TTasksGrid.IsRowSelected: Boolean;
begin
  Result := (TasksGrid.SelectedCount = 1) and (TasksGrid.SelectedRow <> -1)
end;

procedure TTasksGrid.Refresh;
begin
  TasksGrid.Refresh;
end;

procedure TTasksGrid.SelectAllTasks;
var
  T: PTask;
  I: Integer;
begin
  for I := 0 to TasksGrid.RowCount - 1 do begin
    T := GetTaskFromGridRow(I);
    if Assigned(T) then
      T.Selected := True;
  end;
end;

procedure TTasksGrid.DeselectAllTasks;
var
  T: PTask;
  I: Integer;
begin
  for I := 0 to TasksGrid.RowCount - 1 do begin
    T := GetTaskFromGridRow(I);
    T.Selected := False;
  end;
end;


procedure TTasksGrid.SetupTaskRow(ATask: PTask);
var
  GenUnit: PGenerationUnit;
  Row: InxCellsRow;
begin
  GenUnit := ATask.GenerationUnit;
  if Assigned(GenUnit) then begin
    Row := TasksGrid.AddRow;
    Row.Cells[Ord(TasksColumnCheck)].AsBoolean := ATask.Selected;
    Row.Cells[Ord(TasksColumnGroup)].AsString := GenUnit.Group;
    Row.Cells[Ord(TasksColumnCategory)].AsString := GenUnit.Category;
    if GenUnit.PreviewCount > 0 then
      Row.Cells[Ord(TasksColumnPreview)].AsInteger := 2
    else
      Row.Cells[Ord(TasksColumnPreview)].AsInteger := -1;
    Row.Cells[Ord(TasksColumnName)].AsString := GenUnit.Name;
    Row.Cells[Ord(TasksColumnDocType)].AsString := DocumentTypeKindToLocalizedString(GenUnit.DocumentType);
    Row.Cells[Ord(TasksColumnFormat)].AsString := GenUnit.Format;
    Row.Cells[Ord(TasksColumnTutorial)].AsInteger := 1;
    Row.Cells[Ord(TasksColumnParameters)].AsInteger := 0;

    AttachTaskToGridRow(ATask,Row);
  end
end;

procedure TTasksGrid.TasksGridCellChange(Sender: TObject; ACol, ARow: Integer);
var
  Task: PTask;
begin
  if TasksColumn(ACol) = TasksColumnCheck then begin
    Task := GetTaskFromGridRow(ARow);
    if Assigned(Task) then begin
      Task.Selected := TasksGrid.Cell[Ord(TasksColumnCheck), ARow].AsBoolean;
      RequestUpdateUIStates;
    end;
  end;
end;

procedure TTasksGrid.TasksGridCellClick(Sender: TObject; ACol, ARow: Integer;
  Button: TMouseButton);
begin
  ShowTaskDescription;
  if (TasksGrid.Columns.Item[ACol] = PreviewColumn)
    and (TasksGrid.Cell[Ord(TasksColumnPreview), ARow].AsInteger <> -1) then begin
     PreviewTemplate;
  end
  else if TasksGrid.Columns.Item[ACol] = ParametersColumn then begin
    EditTaskParameters;
  end;
end;

procedure TTasksGrid.TasksGridDblClick(Sender: TObject);
begin
  ShowTaskProperties;
end;

procedure TTasksGrid.ShowTaskProperties;
var
  TaskInfoForm: TTaskInformationForm;
  T: PTask;
begin
  T := GetTaskFromSelectedRow;
  Assert(T <> nil);

  TaskInfoForm := TTaskInformationForm.Create(Self);
  try
    TaskInfoForm.StarUMLApp := FStarUMLApp;
    TaskInfoForm.Task := T;
    TaskInfoForm.Execute;
  finally
    TaskInfoForm.Free;
  end;
end;

procedure TTasksGrid.ShowTaskDescription;
var
  GenUnit: PGenerationUnit;
begin
  if IsRowSelected then begin
    GenUnit := GetGenerationUnitForSelectedRow;
    Assert(Assigned(GenUnit));
    GenerationUnitDescMemo.Lines.Text := GenUnit.Description;
  end;
end;

procedure TTasksGrid.PreviewTemplate;
var
  PreviewForm: TPreviewForm;
  Images: TStringList;
  GenUnit: PGenerationUnit;
  I: Integer;
begin
  GenUnit := GetGenerationUnitForSelectedRow;
  if Assigned(GenUnit) then begin
    PreviewForm := TPreviewForm.Create(Self);
    Images := TStringList.Create;
    try
      for I := 0 to GenUnit.PreviewCount - 1 do
        Images.Add(RegulatedPath(GenUnit.Previews[I], GenUnit.Path));
      PreviewForm.Preview(Images);
    finally
      PreviewForm.Free;
      Images.Free;
    end;
  end;
end;

procedure TTasksGrid.EditTaskParameters;
var
  TaskInfoForm: TTaskInformationForm;
  T: PTask;
begin
  if IsRowSelected then begin
    T := GetTaskFromSelectedRow;
    Assert(T <> nil);
    TaskInfoForm := TTaskInformationForm.Create(Self);
    try
      TaskInfoForm.StarUMLApp := FStarUMLApp;
      TaskInfoForm.Task := T;
      TaskInfoForm.Execute(True);
    finally
      TaskInfoForm.Free;
    end;
  end;
end;

procedure TTasksGrid.RequestUpdateUIStates;
begin
  if Assigned(FOnUpdateUIStates) then
    FOnUpdateUIStates(Self);
end;

end.
