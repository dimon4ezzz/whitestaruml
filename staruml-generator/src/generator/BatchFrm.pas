unit BatchFrm;

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
  DirectMDAObjects, DirectMDAProc,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, ImgList, ExtCtrls, FlatPanel,
  WhiteStarUML_TLB;

const
  QUERY_DELETE_SELECTED_TASKS = 'Do you want to delete the selected templates from current batch?';

type
  // TBatchFrame
  TBatchFrame = class(TFrame)
    DeleteTasksButton: TButton;
    BatchGenUnitDescLabel: TLabel;
    CellValueImages: TImageList;
    GenerationUnitDescPanel: TFlatPanel;
    GenerationUnitDescMemo: TMemo;
    TasksGrid: TNextGrid;
    CheckColumn: TNxCheckBoxColumn;
    GroupColumn: TNxTextColumn;
    CategoryColumn: TNxTextColumn;
    PreviewColumn: TNxImageColumn;
    NameColumn: TNxTextColumn;
    DocTypeColumn: TNxTextColumn;
    FormatColumn: TNxTextColumn;
    TutorialColumn: TNxImageColumn;
    ParametersColumn: TNxImageColumn;
    procedure DeleteTasksButtonClick(Sender: TObject);
    procedure TasksGridChange(Sender: TObject; ACol, ARow: Integer);
    procedure TasksGridCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure TasksGridDblClick(Sender: TObject);
  private
    Processor: TGeneratorProcessor;
    Batch: PBatch;
    FStarUMLApp: IStarUMLApplication;
    FOnUpdateUIStates: TNotifyEvent;
    procedure AddTaskRow(ATask: PTask);
    procedure DeleteSelectedTasks;
    procedure ShowTaskProperties;
    procedure ShowTaskDescription;
    procedure PreviewTemplate;
    procedure EditTaskParameters;
    procedure RequestUpdateUIStates;
  public
    procedure Initialize(AProcessor: TGeneratorProcessor; ABatch: PBatch);
    procedure UpdateTasksGrid(ABatch: PBatch);
    procedure UpdateUIStates;
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
    property OnUpdateUIStates: TNotifyEvent read FOnUpdateUIStates write FOnUpdateUIStates;
  end;

implementation

{$R *.dfm}

uses
  TaskInfoFrm, PreviewFrm, Utilities, Symbols;

////////////////////////////////////////////////////////////////////////////////
// TBatchFrame

procedure TBatchFrame.AddTaskRow(ATask: PTask);
var
  GenUnit: PGenerationUnit;
  R: Integer;
begin
  GenUnit := ATask.GenerationUnit;
  if GenUnit <> nil then begin
    TasksGrid.AddRow;
    R := TasksGrid.RowCount - 1;
    TasksGrid.CellByName[COL_CHECK, R].AsBoolean := ATask.Selected;
    TasksGrid.CellByName[COL_GROUP, R].AsString := GenUnit.Group;
    TasksGrid.CellByName[COL_CATEGORY, R].AsString := GenUnit.Category;
    if GenUnit.PreviewCount > 0 then
      TasksGrid.CellByName[COL_PREVIEW, R].AsInteger := 2
    else
      TasksGrid.CellByName[COL_PREVIEW, R].AsInteger := -1;
    TasksGrid.CellByName[COL_NAME, R].AsString := GenUnit.Name;
    TasksGrid.CellByName[COL_NAME, R].ObjectReference := ATask;
    TasksGrid.CellByName[COL_DOC_TYPE, R].AsString := DocumentTypeKindToLocalizedString(GenUnit.DocumentType);
    TasksGrid.CellByName[COL_FORMAT, R].AsString := GenUnit.Format;
    TasksGrid.CellByName[COL_TUTORIAL, R].AsInteger := 1;
    TasksGrid.CellByName[COL_PARAMETERS, R].AsInteger := 0;
  end;
end;

procedure TBatchFrame.DeleteSelectedTasks;
begin
  if Batch.GetSelectedTaskCount > 0 then
    if QueryMessage(QUERY_DELETE_SELECTED_TASKS) then begin
      Batch.DeleteSelectedTasks;
      UpdateTasksGrid(Batch);
    end;
end;

procedure TBatchFrame.ShowTaskProperties;
var
  TaskInfoForm: TTaskInformationForm;
  T: PTask;
begin
  T := TasksGrid.CellByName[COL_NAME, TasksGrid.SelectedRow].ObjectReference as PTask;
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

procedure TBatchFrame.ShowTaskDescription;
var
  T: PTask;
  GenUnit: PGenerationUnit;
begin
  T := TasksGrid.CellByName[COL_NAME, TasksGrid.SelectedRow].ObjectReference as PTask;
  GenUnit := T.GenerationUnit;
  if GenUnit <> nil then
    GenerationUnitDescMemo.Lines.Text := GenUnit.Description;
end;

procedure TBatchFrame.PreviewTemplate;
var
  PreviewForm: TPreviewForm;
  Images: TStringList;
  GenUnit: PGenerationUnit;
  T: PTask;
  I: Integer;
begin
  T := TasksGrid.CellByName[COL_NAME, TasksGrid.SelectedRow].ObjectReference as PTask;
  GenUnit := T.GenerationUnit;
  if GenUnit <> nil then begin
    PreviewForm := TPreviewForm.Create(Self);
    Images := TStringList.Create;
    try
      for I := 0 to GenUnit.PreviewCount - 1 do
        Images.Add(ExtractFileDir(GenUnit.Path) + '\' + GenUnit.Previews[I]);
      PreviewForm.Preview(Images);
    finally
      PreviewForm.Free;
      Images.Free;
    end;
  end;
end;

procedure TBatchFrame.EditTaskParameters;
var
  TaskInfoForm: TTaskInformationForm;
  T: PTask;
begin
  T := TasksGrid.CellByName[COL_NAME, TasksGrid.SelectedRow].ObjectReference as PTask;
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

procedure TBatchFrame.RequestUpdateUIStates;
begin
  if Assigned(FOnUpdateUIStates) then
    OnUpdateUIStates(Self);
  UpdateUIStates;    
end;

procedure TBatchFrame.Initialize(AProcessor: TGeneratorProcessor; ABatch: PBatch);
begin
  Processor := AProcessor;
  Batch := ABatch;
  UpdateTasksGrid(Batch);
end;

procedure TBatchFrame.UpdateTasksGrid(ABatch: PBatch);
var
  I: Integer;
begin
  TasksGrid.ClearRows;
  for I := 0 to Batch.TaskCount - 1 do
    AddTaskRow(Batch.Task[I]);
end;

procedure TBatchFrame.UpdateUIStates;
begin
  DeleteTasksButton.Enabled := (Batch.GetSelectedTaskCount > 0);
end;

// TBatchFrame
////////////////////////////////////////////////////////////////////////////////

procedure TBatchFrame.DeleteTasksButtonClick(Sender: TObject);
begin
  DeleteSelectedTasks;
  RequestUpdateUIStates;
end;

procedure TBatchFrame.TasksGridChange(Sender: TObject; ACol, ARow: Integer);
var
  RefObj: TObject;
begin
  if TasksGrid.Columns.Item[ACol].Name = COL_CHECK then begin
    RefObj := TasksGrid.CellByName[COL_NAME, ARow].ObjectReference;
    if (RefObj <> nil) and (RefObj is PTask) then
      (RefObj as PTask).Selected := TasksGrid.CellByName[COL_CHECK, ARow].AsBoolean;
    RequestUpdateUIStates;
  end;
end;

procedure TBatchFrame.TasksGridCellClick(Sender: TObject; ACol, ARow: Integer);
begin
  ShowTaskDescription;
  if (TasksGrid.Columns.Item[ACol] = PreviewColumn)
    and (TasksGrid.CellByName[COL_PREVIEW, ARow].AsInteger <> -1) then begin
    PreviewTemplate;
  end
  else if TasksGrid.Columns.Item[ACol] = ParametersColumn then begin
    EditTaskParameters;
  end;
end;

procedure TBatchFrame.TasksGridDblClick(Sender: TObject);
begin
  ShowTaskProperties;
end;

end.
