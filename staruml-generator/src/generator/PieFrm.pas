unit PieFrm;

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
  DirectMDAProc, DirectMDAObjects, BatchFrm, WSGenerator_TLB,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComObj, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, StdCtrls,
  JvWizard, ComCtrls, ShellCtrls, ImgList, ExtCtrls, WhiteStarUML_TLB, FlatPanel,
  Menus, ShellAPI, JvExControls, JvComponent, Winapi.ShlObj,
  Vcl.ButtonGroup, Vcl.Mask, JvExMask, JvToolEdit, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup;

const
  ERR_ERROR_ON_PROCESSOR = 'Error occured while executing document translator.'
        + #13#10 + 'Reason : %s';
  TXT_ALL_GROUP = '(all group)';
  TXT_ALL_CATEGORY = '(all category)';
  TXT_ALL_DOCTYPE = '(all doc. type)';
  TXT_ALL_FORMAT = '(all format)';
  TXT_WAITING = 'Standing by...';
  ERR_CANNOT_FOUND_TDF = 'Template definition file not found. (%s)';
  ERR_FAILED_TO_REGISTER_BATCH = 'Registering Batch failed.' + #13#10 + 'Reason : %s';
  ERR_FAILED_TO_ADD_BATCH_ITEM = 'Adding item failed.' + #13#10 + 'Reason : %s';
  ERR_REGISTER_TEMPLATE = 'Registering new template failed.' + #13#10 + 'Reason : %s';
  ERR_ON_GENERATING = 'Error occured while generating document.' + #13#10 + 'Reason : %s';
  MSG_GENERATION_COMPLETE = 'Document generation is done.';
  ERR_CANNOT_CREATE_NEW_FOLDER = 'New folder cannot be created.';
  ERR_FAILED_TO_NEW_BATCH = 'Creating new batch failed.' + #13#10 + 'Reason : %s';
  ERR_FAILED_TO_MODIFY_BATCH = 'Modifying batch failed.' + #13#10 + 'Reason : %s';
  ERR_FAILED_TO_DELETE_BATCH = 'Deleting batch failed.' + #13#10 + 'Reason : %s';
  QUERY_ABORT_GENERATING = 'Do you want to cancel document generation?'
    + #13#10 + 'Already generated documents will not be deleted.';
  MSG_GENERATION_ABORTED = 'Document generation is canceled by user request.';
  ERR_CANNOT_OPEN_FILE = '%s file can''t be opened.' + #13#10 + 'Reason : %s';
  TXT_ON_GENERATING = 'Generating...';
  TXT_EMPTY = '(Empty)';
  TXT_FAILED = '(Failed)';
  TXT_CANCLED = '(Canceled)';
  TXT_GENERATE = 'Generate';

type

  // TPieForm
  TPieForm = class(TForm)
    DirectMDAWizard: TJvWizard;
    TemplateSelectionPage: TJvWizardInteriorPage;
    BatchPageControl: TPageControl;
    MainTabSheet: TTabSheet;
    OutDirectorySelectionPage: TJvWizardInteriorPage;
    Label2: TLabel;
    ExecutionPage: TJvWizardInteriorPage;
    ExecTasksGrid: TNextGrid;
    GenerationItemsLabel: TLabel;
    ExecStateColumn: TNxImageColumn;
    ExecGroupColumn: TNxTextColumn;
    ExecCategoryColumn: TNxTextColumn;
    ExecDocNameColumn: TNxTextColumn;
    ExecPathColumn: TNxTextColumn;
    ProgressBar: TProgressBar;
    MainMessageLabel: TLabel;
    HeaderImageList: TImageList;
    ExecProgressColumn: TNxProgressColumn;
    RegisterBatchButton: TButton;
    AppendToBatchButton: TButton;
    RegisterTemplateButton: TButton;
    GenerationUnitDescLabel: TLabel;
    GroupComboBox: TComboBox;
    CategoryComboBox: TComboBox;
    DocTypeComboBox: TComboBox;
    FormatComboBox: TComboBox;
    CheckAllCheckBox: TCheckBox;
    LogLabel: TLabel;
    LogMemo: TMemo;
    StateMarkImageList: TImageList;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    CellValueImages: TImageList;
    HeartBeatTimer: TTimer;
    GenerationUnitDescPanel: TFlatPanel;
    GenerationUnitDescMemo: TMemo;
    ExecFullPathColumn: TNxTextColumn;
    MessageLabel: TLabel;
    CloneTemplateButton: TButton;
    ModifyTemplateButton: TButton;
    OpenTemplateButton: TButton;
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
    OutputDirEdit: TJvDirectoryEdit;
    GroupBox1: TGroupBox;
    QuickDirButtonGroup: TButtonGroup;
    PieActionList: TActionList;
    ActionModifyTemplate: TAction;
    ActionRegisterTemplate: TAction;
    ActionCloneTemplate: TAction;
    ActionOpenTemplate: TAction;
    ActionDeleteTemplate: TAction;
    TemplatePopupActionBar: TPopupActionBar;
    emplateProperties1: TMenuItem;
    OpenTemplate1: TMenuItem;
    N2: TMenuItem;
    RegisterTemplate1: TMenuItem;
    CloneTemplate1: TMenuItem;
    N3: TMenuItem;
    DeleteTemplate1: TMenuItem;
    ActionNewBatch: TAction;
    ActionModifyBatch: TAction;
    ActionDeleteBatch: TAction;
    BatchPopupActionBar: TPopupActionBar;
    NewBatch1: TMenuItem;
    ModifyBatch1: TMenuItem;
    DeleteBatch1: TMenuItem;
    ActionRegisterBatch: TAction;
    ActionAddToBatch: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TasksGridDblClick(Sender: TObject);
    procedure TasksGridChange(Sender: TObject; ACol, ARow: Integer);
    procedure RegisterTemplateButtonClick(Sender: TObject);
    procedure ExecutionPagePage(Sender: TObject);
    procedure TasksGridCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure BatchPageControlChange(Sender: TObject);
    procedure CheckAllCheckBoxClick(Sender: TObject);
    procedure GroupComboBoxChange(Sender: TObject);
    procedure CategoryComboBoxChange(Sender: TObject);
    procedure DocTypeComboBoxChange(Sender: TObject);
    procedure FormatComboBoxChange(Sender: TObject);
    procedure ExecutionPageFinishButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure HeartBeatTimerTimer(Sender: TObject);
    procedure ExecutionPageNextButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure FormShow(Sender: TObject);
    procedure AddBatchMenuClick(Sender: TObject);
    procedure EditBatchMenuClick(Sender: TObject);
    procedure DeleteBatchMenuClick(Sender: TObject);
    procedure DirectMDAWizardCancelButtonClick(Sender: TObject);
    procedure ExecTasksGridDblClick(Sender: TObject);
    procedure OutputDirShellTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure OutputDirEditMouseEnter(Sender: TObject);
    procedure OutputDirEditChange(Sender: TObject);
    procedure QuickDirButtonGroupItems0Click(Sender: TObject);
    procedure QuickDirButtonGroupItems1Click(Sender: TObject);
    procedure QuickDirButtonGroupItems2Click(Sender: TObject);
    procedure OutDirectorySelectionPageEnterPage(Sender: TObject;
      const FromPage: TJvWizardCustomPage);
    procedure OutDirectorySelectionPageExitPage(Sender: TObject;
      const FromPage: TJvWizardCustomPage);
    procedure ActionModifyTemplateExecute(Sender: TObject);
    procedure ActionRegisterTemplateExecute(Sender: TObject);
    procedure ActionCloneTemplateExecute(Sender: TObject);
    procedure ActionOpenTemplateExecute(Sender: TObject);
    procedure ActionDeleteTemplateExecute(Sender: TObject);
    procedure ActionRegisterBatchExecute(Sender: TObject);
    procedure ActionAddToBatchExecute(Sender: TObject);
  private
    DirectMDAProcessor: TGeneratorProcessor;
    SelectedBatch: PBatch;
    ActiveTask: PTask;
    ActiveTaskRow: Integer;
    InGenerating: Boolean;
    FStarUMLApp: IStarUMLApplication;
    class var LastOutputDir: string;

    { initialization & finalization methods }
    procedure Initialize;
    procedure Finalize;
    { page set up & finding methods - TemplateSelectionPage }
    function IsFiltered(AGenerationUnit: PGenerationUnit): Boolean;
    procedure AddTaskRow(ATask: PTask);
    function AddBatchPage(ABatch: PBatch): TTabSheet;
    procedure SetupBatches;
    procedure UpdateBatchPage(ABatch: PBatch);
    procedure UpdateTasksGrid;
    procedure UpdateDefaultBatchPage;
    function FindBatchPage(ABatch: PBatch): TTabSheet;
    function FindBatchFrame(ATabSheet: TTabSheet): TBatchFrame;
    function FindBatchOfPage(ABatchPage: TTabSheet): PBatch;
    procedure HandleBatchPageUpdateUIStates(Sender: TObject);

    procedure UpdateGroupComboBox;
    procedure UpdateCategoryComboBox;
    procedure UpdateDocTypeComboBox;
    procedure UpdateFormatComboBox;
    { page set up methods & finding - ExecutionPage }
    procedure AddExecTaskRow(ATask: PTask);
    procedure SetupExecTasks;
    function FindExecTaskRowIndex(ATask: PTask): Integer;
    { user actions processing methods }
    procedure RegisterBatch;
    procedure AppendSelectedTasksToBatch;
    procedure RegisterTemplate;
    procedure EditTaskParameters;
    procedure ExecuteTasks;
    procedure SelectAllTasks;
    procedure DeselectAllTasks;
    procedure ShowTaskProperties;
    procedure ShowTaskDescription;
    procedure PreviewTemplate;
    procedure CreateNewBatch;
    procedure EditBatch;
    procedure DeleteBatch;
    procedure AbortGeneration;
    procedure ExecuteDocument;
    procedure CloneTemplate;
    procedure ModifyTemplate;
    procedure DeleteTemplate;
    procedure OpenTemplate;
    procedure OpenTemplateFile(const ExeFilename: String; Filename: String);
    { event handlers }
    procedure HandleLog(Sender: TObject; Msg: string; MsgKind: LogMessageKind);
    procedure HandleProgress(Sender: TObject; Position, Max: Integer);
    procedure HandleNotify(Sender: TObject; Msg: string);
    procedure HandleExecutingTask(Sender: TObject; Task: PTask);
    procedure HandleExecuteTask(Sender: TObject; Task: PTask; Success: Boolean; Items: TStringList);
    procedure HandleAbortTask(Sender: TObject; Task: PTask);
    procedure HandleWarning(Sender: TObject; Msg: string);
    { log methods }
    procedure Log(Msg: string; MsgKind: LogMessageKind); overload;
    procedure Log(Msg: string; Args: array of const; MsgKind: LogMessageKind); overload;
    procedure Progress(Position, Max: Integer);
    procedure Notify(Msg: string);
    { UI updating methods }
    procedure UpdateUIStatesMainTabSheet;
    procedure UpdateUIStatesTemplateSelectionPage;
    procedure UpdateUIStatesOutDirectorySelectionPage;
    procedure UpdateUIStatesExecutionPage;
    procedure UpdateUIStates;

    function FolderIsValid: Boolean;
    procedure ValidateOutDirectorySelectionPageNextButton;
    procedure SelectSpecialFolderDesktop;
    procedure SelectSpecialFolderMyDocs;
    procedure SelectSpecialFolderHome;
  public
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
  end;

implementation

{$R *.dfm}

uses
  System.IOUtils,
  TaskInfoFrm, TemplateRegFrm, BatchRegisterFrm, BatchSelFrm, PreviewFrm,
  NewFolderFrm, Utilities, Symbols, NewTemplateDlg, Serializers;


////////////////////////////////////////////////////////////////////////////////
// TPieForm

procedure TPieForm.Initialize;
begin
  try
    DirectMDAProcessor := TGeneratorProcessor.Create;
    DirectMDAProcessor.OnLog := HandleLog;
    DirectMDAProcessor.OnProgress := HandleProgress;
    DirectMDAProcessor.OnNotify := HandleNotify;
    DirectMDAProcessor.OnExecutingTask := HandleExecutingTask;
    DirectMDAProcessor.OnExecuteTask := HandleExecuteTask;
    DirectMDAProcessor.OnAbortTask := HandleAbortTask;
    DirectMDAProcessor.OnWarning := HandleWarning;
    DirectMDAProcessor.LoadGenerationUnits;
    DirectMDAProcessor.LoadBatches;
    SelectedBatch := DirectMDAProcessor.DefaultBatch;

  except
    on E: Exception do begin
      ErrorMessage(Format(ERR_ERROR_ON_PROCESSOR, [E.Message]));
    end;
  end;
end;

procedure TPieForm.Finalize;
begin
  DirectMDAProcessor.Free;
end;

function TPieForm.IsFiltered(AGenerationUnit: PGenerationUnit): Boolean;
begin
  Result := True;
  if GroupComboBox.ItemIndex > 0 then
    if UpperCase(AGenerationUnit.Group) <> UpperCase(GroupComboBox.Items[GroupComboBox.ItemIndex]) then begin
      Result := False;
      Exit;
    end;
  if CategoryComboBox.ItemIndex > 0 then
    if UpperCase(AGenerationUnit.Category) <> UpperCase(CategoryComboBox.Items[CategoryComboBox.ItemIndex]) then begin
      Result := False;
      Exit;
    end;
  if DocTypeComboBox.ItemIndex > 0 then
    if DocumentTypeKindToLocalizedString(AGenerationUnit.DocumentType) <> DocTypeComboBox.Items[DocTypeComboBox.ItemIndex] then begin
      Result := False;
      Exit;
    end;
  if FormatComboBox.ItemIndex > 0 then
    if UpperCase(AGenerationUnit.Format) <> UpperCase(FormatComboBox.Items[FormatComboBox.ItemIndex]) then begin
      Result := False;
      Exit;
    end;
end;

procedure TPieForm.AddTaskRow(ATask: PTask);
var
  GenUnit: PGenerationUnit;
  R: Integer;
begin
  GenUnit := ATask.GenerationUnit;
  if (GenUnit <> nil) and IsFiltered(GenUnit) then begin
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
  end
  else
    ATask.Selected := False;
end;

function TPieForm.AddBatchPage(ABatch: PBatch): TTabSheet;

  function IssueFrameName: string;
  var
    S: string;
    C: Integer;
  begin
    C := 0;
    repeat
      C := C + 1;
      S := FRAME_PREFIX + IntToStr(C);
    until (Self.FindComponent(S) = nil);
    Result := S;
  end;

var
  BatchTabSheet: TTabSheet;
  BatchFrame: TBatchFrame;
begin
  BatchTabSheet := TTabSheet.Create(BatchPageControl);
  BatchTabSheet.PageControl := BatchPageControl;
  BatchTabSheet.Caption := ABatch.Name;
  BatchFrame := TBatchFrame.Create(BatchTabSheet);
  BatchFrame.Name := IssueFrameName;
  BatchFrame.Parent := BatchTabSheet;
  BatchFrame.StarUMLApp := FStarUMLApp;
  BatchFrame.OnUpdateUIStates := HandleBatchPageUpdateUIStates;
  BatchFrame.Initialize(DirectMDAProcessor, ABatch);
  Result := BatchTabSheet;
end;

procedure TPieForm.UpdateBatchPage(ABatch: PBatch);
var
  TabSheet: TTabSheet;
  Frame: TBatchFrame;
begin
  TabSheet := FindBatchPage(ABatch);
  if TabSheet <> nil then begin
    Frame := FindBatchFrame(TabSheet);
    Assert(Frame <> nil);
    Frame.UpdateTasksGrid(ABatch);
  end;
end;

procedure TPieForm.UpdateTasksGrid;
var
  I: Integer;
begin
  TasksGrid.ClearRows;
  for I := 0 to DirectMDAProcessor.DefaultBatch.TaskCount - 1 do
    AddTaskRow(DirectMDAProcessor.DefaultBatch.Tasks[I]);
  TasksGrid.Refresh;
end;

procedure TPieForm.UpdateDefaultBatchPage;
begin
  UpdateTasksGrid;
  UpdateGroupComboBox;
  UpdateCategoryComboBox;
  UpdateDocTypeComboBox;
  UpdateFormatComboBox;
end;

procedure TPieForm.SetupBatches;
var
  I: Integer;
  Batch: PBatch;
  TabSheet: TTabSheet;
begin
  UpdateDefaultBatchPage;
  for I := 0 to DirectMDAProcessor.BatchCount - 1 do begin
    Batch := DirectMDAProcessor.Batch[I];
    Assert(Batch <> nil,'Inconsistent batch number');
    TabSheet := FindBatchPage(Batch);
    if not Assigned(TabSheet) then
      AddBatchPage(Batch)
    else
      Assert(False,'Duplicated tabsheet');

  end;
end;

function TPieForm.FindBatchPage(ABatch: PBatch): TTabSheet;
var
  I: Integer;
begin
  Result := nil;
  for I := 1 to BatchPageControl.PageCount - 1 do
    if BatchPageControl.Pages[I].Caption = ABatch.Name then begin
      Result := BatchPageControl.Pages[I];
      Exit;
    end;
end;

function TPieForm.FindBatchFrame(ATabSheet: TTabSheet): TBatchFrame;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ATabSheet.ComponentCount - 1 do
    if ATabSheet.Components[I] is TBatchFrame then begin
      Result := ATabSheet.Components[I] as TBatchFrame;
      Exit;
    end;
end;

function TPieForm.FindBatchOfPage(ABatchPage: TTabSheet): PBatch;
var
  I: Integer;
begin
  Result := nil;
  if ABatchPage = MainTabSheet then
    Result := DirectMDAProcessor.DefaultBatch
  else begin
    for I := 0 to DirectMDAProcessor.BatchCount - 1 do
      if ABatchPage.Caption = DirectMDAProcessor.Batch[I].Name then begin
        Result := DirectMDAProcessor.Batch[I];
        Exit;
      end;
  end;
end;

procedure TPieForm.HandleBatchPageUpdateUIStates(Sender: TObject);
begin
  UpdateUIStates;
end;

procedure TPieForm.UpdateGroupComboBox;
var
  GenUnit: PGenerationUnit;
  I: Integer;
begin
  GroupComboBox.Clear;
  GroupComboBox.Items.Add(TXT_ALL_GROUP);
  for I := 0 to DirectMDAProcessor.GenerationUnitCount - 1 do begin
    GenUnit := DirectMDAProcessor.GenerationUnits[I];
    if GroupComboBox.Items.IndexOf(GenUnit.Group) = -1 then
      GroupComboBox.Items.Add(GenUnit.Group);
  end;
  GroupComboBox.ItemIndex := 0;
end;

procedure TPieForm.UpdateCategoryComboBox;
var
  GenUnit: PGenerationUnit;
  I: Integer;
begin
  CategoryComboBox.Clear;
  CategoryComboBox.Items.Add(TXT_ALL_CATEGORY);
  for I := 0 to DirectMDAProcessor.GenerationUnitCount - 1 do begin
    GenUnit := DirectMDAProcessor.GenerationUnits[I];
    if CategoryComboBox.Items.IndexOf(GenUnit.Category) = -1 then
      CategoryComboBox.Items.Add(GenUnit.Category);
  end;
  CategoryComboBox.ItemIndex := 0;
end;

procedure TPieForm.UpdateDocTypeComboBox;
var
  GenUnit: PGenerationUnit;
  I: Integer;
begin
  DocTypeComboBox.Clear;
  DocTypeComboBox.Items.Add(TXT_ALL_DOCTYPE);
  for I := 0 to DirectMDAProcessor.GenerationUnitCount - 1 do begin
    GenUnit := DirectMDAProcessor.GenerationUnits[I];
    if DocTypeComboBox.Items.IndexOf(DocumentTypeKindToLocalizedString(GenUnit.DocumentType)) = -1 then
      DocTypeComboBox.Items.Add(DocumentTypeKindToLocalizedString(GenUnit.DocumentType));
  end;
  DocTypeComboBox.ItemIndex := 0;
end;

procedure TPieForm.UpdateFormatComboBox;
var
  GenUnit: PGenerationUnit;
  I: Integer;
begin
  FormatComboBox.Clear;
  FormatComboBox.Items.Add(TXT_ALL_FORMAT);
  for I := 0 to DirectMDAProcessor.GenerationUnitCount - 1 do begin
    GenUnit := DirectMDAProcessor.GenerationUnits[I];
    if FormatComboBox.Items.IndexOf(GenUnit.Format) = -1 then
      FormatComboBox.Items.Add(GenUnit.Format);
  end;
  FormatComboBox.ItemIndex := 0;
end;

procedure TPieForm.AddExecTaskRow(ATask: PTask);
var
  GenUnit: PGenerationUnit;
  Idx: Integer;
begin
  GenUnit := ATask.GenerationUnit;
  if GenUnit <> nil then begin
    ExecTasksGrid.AddRow;
    Idx := ExecTasksGrid.RowCount - 1;
    ExecTasksGrid.CellByName[COL_EXEC_STATE, Idx].AsInteger := 0;
    ExecTasksGrid.CellByName[COL_EXEC_STATE, Idx].ObjectReference := ATask;
    ExecTasksGrid.CellByName[COL_EXEC_GROUP, Idx].AsString := GenUnit.Group;
    ExecTasksGrid.CellByName[COL_EXEC_CATEGORY, Idx].AsString := GenUnit.Category;
    ExecTasksGrid.CellByName[COL_EXEC_DOC_NAME, Idx].AsString := GenUnit.Name;
    ExecTasksGrid.CellByName[COL_EXEC_PATH, Idx].AsString := TXT_WAITING;
    ExecTasksGrid.CellByName[COL_EXEC_PROGRESS, Idx].AsInteger := 0;
    ExecTasksGrid.CellByName[COL_EXEC_FULL_PATH, Idx].AsString := '';
  end
  else
    Log(ERR_CANNOT_FOUND_TDF, [ATask.GenerationUnit], lmError);
end;

procedure TPieForm.SetupExecTasks;
var
  I: Integer;
begin
  ExecTasksGrid.ClearRows;
  for I := 0 to SelectedBatch.TaskCount - 1 do begin
    if SelectedBatch.Tasks[I].Selected then
      AddExecTaskRow(SelectedBatch.Tasks[I]);
    Application.ProcessMessages;
  end;
end;

function TPieForm.FindExecTaskRowIndex(ATask: PTask): Integer;
var
  T: PTask;
  I: Integer;
begin
  Result := -1;
  for I := 0 to ExecTasksGrid.RowCount - 1 do begin
    T := ExecTasksGrid.CellByName[COL_EXEC_STATE, I].ObjectReference as PTask;
    if T = ATask then begin
      Result := I;
      Exit;
    end;
  end;
end;

procedure TPieForm.RegisterBatch;
var
  BatchRegForm: TBatchRegisterForm;
  Batch: PBatch;
  RefObj: TObject;
  TabSheet: TTabSheet;
  T: PTask;
  I: Integer;
begin
  BatchRegForm := TBatchRegisterForm.Create(Self);
  try
    if BatchRegForm.Execute then begin
      try
        Batch := PBatch.Create;
        Batch.Name := BatchRegForm.BatchName;
        Batch.Description := BatchRegForm.BatchDescription;
        for I := 0 to TasksGrid.RowCount - 1 do
          if TasksGrid.CellByName[COL_CHECK, I].AsBoolean = True then begin
            RefObj := TasksGrid.CellByName[COL_NAME, I].ObjectReference;
            if (RefObj <> nil) and (RefObj is PTask) then begin
              T := RefObj as PTask;
              Batch.AddTask(T.Clone);
            end;
          end;
        DirectMDAProcessor.AddBatch(Batch);
        DirectMDAProcessor.SaveBatch(Batch);
        TabSheet := AddBatchPage(Batch);
        BatchPageControl.ActivePage := TabSheet;
        SelectedBatch := Batch;
      except
        on E: Exception do begin
          ErrorMessage(Format(ERR_FAILED_TO_REGISTER_BATCH, [E.Message]));
          BatchPageControl.ActivePage := MainTabSheet;
          SelectedBatch := DirectMDAProcessor.DefaultBatch;
        end;
      end;
    end;
  finally
    BatchRegForm.Free;
  end;
end;

procedure TPieForm.AppendSelectedTasksToBatch;
var
  BatchSelectionForm: TBatchSelectionForm;
  Batch: PBatch;
  SL: TStringList;
begin
  BatchSelectionForm := TBatchSelectionForm.Create(Self);
  SL := TStringList.Create;
  try
    DirectMDAProcessor.AquireBatchNames(SL);
    if BatchSelectionForm.Execute(SL) then begin
      try
        Batch := DirectMDAProcessor.FindBatchByName(BatchSelectionForm.SelectedBatch);
        Assert(Batch <> nil);
        DirectMDAProcessor.DefaultBatch.CopySelectedTasksToBatch(Batch);
        UpdateBatchPage(Batch);
        DirectMDAProcessor.SaveBatch(Batch);
        SelectedBatch := Batch;
        BatchPageControl.ActivePage := FindBatchPage(SelectedBatch);
      except
        on E: Exception do begin
          ErrorMessage(Format(ERR_FAILED_TO_ADD_BATCH_ITEM, [E.Message]));
          BatchPageControl.ActivePage := MainTabSheet;
          SelectedBatch := DirectMDAProcessor.DefaultBatch;
        end;
      end;
    end;
  finally
    SL.Free;
    BatchSelectionForm.Free;
  end;
end;

procedure TPieForm.RegisterTemplate;
var
  TemplateRegForm: TTemplateRegisterForm;
begin
  TemplateRegForm := TTemplateRegisterForm.Create(Self);
  try
    TemplateRegForm.StarUMLApp := FStarUMLApp;
    TemplateRegForm.DirectMDAProcessor := DirectMDAProcessor;
    if TemplateRegForm.Execute then begin
      try
        DirectMDAProcessor.AddGenerationUnit(TemplateRegForm.GenerationUnit);
        DirectMDAProcessor.SaveGenerationUnit(TemplateRegForm.GenerationUnit, TemplateRegForm.GenerationUnitPath);
        UpdateTasksGrid;
        BatchPageControl.ActivePage := MainTabSheet;
      except
        on E: Exception do begin
          ErrorMessage(Format(ERR_REGISTER_TEMPLATE, [E.Message]));
        end;
      end;
    end;
  finally
    TemplateRegForm.Free;
  end;
end;

procedure TPieForm.EditTaskParameters;
var
  TaskInfoForm: TTaskInformationForm;
  T: PTask;
begin

  if TasksGrid.SelectedRow > -1 then begin
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
end;

procedure TPieForm.ExecuteTasks;
begin
  HeartBeatTimer.Enabled := True;
  InGenerating := True;
  try
    try
      MessageLabel.Caption := '';
      DirectMDAProcessor.Execute(SelectedBatch);
    except
      on E: Exception do begin
        ErrorMessage(Format(ERR_ON_GENERATING, [E.Message]));
        InGenerating := False;
      end;
    end;
    if InGenerating then
      MessageLabel.Caption := MSG_GENERATION_COMPLETE;
  finally
    HeartBeatTimer.Enabled := False;
    InGenerating := False;
  end;
end;

procedure TPieForm.SelectAllTasks;
var
  T: PTask;
  I: Integer;
begin
  for I := 0 to TasksGrid.RowCount - 1 do begin
    T := TasksGrid.CellByName[COL_NAME, I].ObjectReference as PTask;
    T.Selected := True;
  end;
  UpdateTasksGrid;
end;

procedure TPieForm.SelectSpecialFolderDesktop;
const
  FOLDERID_Desktop : TGUID = '{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}';
begin
  OutputDirEdit.Directory := GetSpecialFolderPath(FOLDERID_Desktop);
end;

procedure TPieForm.SelectSpecialFolderHome;
const
  FOLDERID_Profile : TGUID = '{5E6C858F-0E22-4760-9AFE-EA3317B67173}';
begin
  // Home
  OutputDirEdit.Directory := GetSpecialFolderPath(FOLDERID_Profile);
end;

procedure TPieForm.SelectSpecialFolderMyDocs;
const
  FOLDERID_Documents : TGUID = '{FDD39AD0-238F-46AF-ADB4-6C85480369C7}';
begin
  OutputDirEdit.Directory := GetSpecialFolderPath(FOLDERID_Documents);
end;

procedure TPieForm.DeselectAllTasks;
var
  T: PTask;
  I: Integer;
begin
  for I := 0 to TasksGrid.RowCount - 1 do begin
    T := TasksGrid.CellByName[COL_NAME, I].ObjectReference as PTask;
    T.Selected := False;
  end;
  UpdateTasksGrid;
end;

procedure TPieForm.ShowTaskProperties;
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

procedure TPieForm.ShowTaskDescription;
var
  T: PTask;
  GenUnit: PGenerationUnit;
begin
  T := TasksGrid.CellByName[COL_NAME, TasksGrid.SelectedRow].ObjectReference as PTask;
  GenUnit := T.GenerationUnit;
  Assert(GenUnit <> nil);
  GenerationUnitDescMemo.Lines.Text := GenUnit.Description;
end;

procedure TPieForm.PreviewTemplate;
var
  PreviewForm: TPreviewForm;
  Images: TStringList;
  T: PTask;
  GenUnit: PGenerationUnit;
  I: Integer;
begin
  T := TasksGrid.CellByName[COL_NAME, TasksGrid.SelectedRow].ObjectReference as PTask;
  GenUnit := T.GenerationUnit;
  if GenUnit <> nil then begin
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

procedure TPieForm.CreateNewBatch;
var
  BatchRegForm: TBatchRegisterForm;
  Batch: PBatch;
  TabSheet: TTabSheet;
begin
  BatchRegForm := TBatchRegisterForm.Create(Self);
  try
    if BatchRegForm.Execute then begin
      try
        Batch := PBatch.Create;
        Batch.Name := BatchRegForm.BatchName;
        Batch.Description := BatchRegForm.BatchDescription;
        DirectMDAProcessor.AddBatch(Batch);
        DirectMDAProcessor.SaveBatch(Batch);
        TabSheet := AddBatchPage(Batch);
        BatchPageControl.ActivePage := TabSheet;
        SelectedBatch := Batch;
      except
        on E: Exception do begin
          ErrorMessage(Format(ERR_FAILED_TO_NEW_BATCH, [E.Message]));
          BatchPageControl.ActivePage := MainTabSheet;
          SelectedBatch := DirectMDAProcessor.DefaultBatch;
        end;
      end;
    end;
  finally
    BatchRegForm.Free;
  end;
end;

procedure TPieForm.EditBatch;
var
  BatchRegForm: TBatchRegisterForm;
  Page: TTabSheet;
begin
  if (SelectedBatch <> nil) and (SelectedBatch <> DirectMDAProcessor.DefaultBatch) then begin
    BatchRegForm := TBatchRegisterForm.Create(Self);
    try
      BatchRegForm.BatchName := SelectedBatch.Name;
      BatchRegForm.BatchDescription := SelectedBatch.Description;
      if BatchRegForm.Execute then begin
        try
          Page := FindBatchPage(SelectedBatch);
          Assert(Page <> nil);
          SelectedBatch.Name := BatchRegForm.BatchName;
          SelectedBatch.Description := BatchRegForm.BatchDescription;
          DirectMDAProcessor.SaveBatch(SelectedBatch, SelectedBatch.Path);
          Page.Caption := SelectedBatch.Name;
        except
          on E: Exception do begin
            ErrorMessage(Format(ERR_FAILED_TO_MODIFY_BATCH, [E.Message]));
          end;
        end;
      end;
    finally
      BatchRegForm.Free;
    end;
  end;
end;

procedure TPieForm.DeleteBatch;
var
  Page: TTabSheet;
  B: PBatch;
begin
  B := SelectedBatch;
  if (B <> nil) and (B <> DirectMDAProcessor.DefaultBatch) then begin
    if MessageDlg('Do you want to delete selected batch "' + B.Name +
      '" and all related files?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        Page := FindBatchPage(B);
        Assert(Page <> nil);
        BatchPageControl.RemoveControl(Page);
        Page.Free;
        DirectMDAProcessor.DeleteBatchFromFile(B);
        SelectedBatch := FindBatchOfPage(BatchPageControl.ActivePage);
      except
        on E: Exception do
        begin
          ErrorMessage(Format(ERR_FAILED_TO_DELETE_BATCH, [E.Message]));
        end;
      end;
    end;
  end;
end;

procedure TPieForm.AbortGeneration;
begin
  if QueryMessage(QUERY_ABORT_GENERATING) then begin
    DirectMDAProcessor.Abort;
    MessageLabel.Caption := MSG_GENERATION_ABORTED;
  end;
end;

procedure TPieForm.ExecuteDocument;
var
  S: string;
begin
  if ExecTasksGrid.SelectedRow > -1 then begin
    S := ExecTasksGrid.CellByName[COL_EXEC_FULL_PATH, ExecTasksGrid.SelectedRow].AsString;
    if S <> '' then
      try
        ExecuteFile(S);
      except
        on E: Exception do begin
          ErrorMessage(Format(ERR_CANNOT_OPEN_FILE, [ExtractFileName(S), E.Message]));
        end;
      end;
  end;
end;

procedure TPieForm.HandleLog(Sender: TObject; Msg: string; MsgKind: LogMessageKind);
begin
  Log(Msg, MsgKind);
end;

procedure TPieForm.HandleProgress(Sender: TObject; Position, Max: Integer);
begin
  Progress(Position, Max);
end;

procedure TPieForm.HandleNotify(Sender: TObject; Msg: string);
begin
  Notify(Msg);
end;

procedure TPieForm.HandleExecutingTask(Sender: TObject; Task: PTask);
begin
  ActiveTask := Task;
  ActiveTaskRow := FindExecTaskRowIndex(ActiveTask);
  ExecTasksGrid.CellByName[COL_EXEC_STATE, ActiveTaskRow].AsInteger := 1;
  ExecTasksGrid.CellByName[COL_EXEC_PATH, ActiveTaskRow].AsString := TXT_ON_GENERATING;
end;

procedure TPieForm.HandleExecuteTask(Sender: TObject; Task: PTask; Success: Boolean; Items: TStringList);
begin
  if Success then begin
    ExecTasksGrid.CellByName[COL_EXEC_STATE, ActiveTaskRow].AsInteger := 2;
    if Items.Count = 0 then
      ExecTasksGrid.CellByName[COL_EXEC_PATH, ActiveTaskRow].AsString := TXT_EMPTY
    else begin
      ExecTasksGrid.CellByName[COL_EXEC_PATH, ActiveTaskRow].AsString := ExtractFileName(Items[0]);
      ExecTasksGrid.CellByName[COL_EXEC_PATH, ActiveTaskRow].Hint := Items[0];
      ExecTasksGrid.CellByName[COL_EXEC_FULL_PATH, ActiveTaskRow].AsString := Items[0];
    end;
  end
  else begin
    ExecTasksGrid.CellByName[COL_EXEC_STATE, ActiveTaskRow].AsInteger := 3;
    ExecTasksGrid.CellByName[COL_EXEC_PATH, ActiveTaskRow].AsString := TXT_FAILED;
  end;
end;

procedure TPieForm.HandleAbortTask(Sender: TObject; Task: PTask);
begin
  ExecTasksGrid.CellByName[COL_EXEC_STATE, ActiveTaskRow].AsInteger := 1;
  ExecTasksGrid.CellByName[COL_EXEC_PATH, ActiveTaskRow].AsString := TXT_CANCLED;
end;

procedure TPieForm.HandleWarning(Sender: TObject; Msg: string);
begin
  WarningMessage(Msg);
end;

procedure TPieForm.Log(Msg: string; MsgKind: LogMessageKind);
begin
  LogMemo.Lines.Add(Format('[%s] %s', [TimeToStr(Time) ,Msg]));
  Application.ProcessMessages;
end;

procedure TPieForm.Log(Msg: string; Args: array of const; MsgKind: LogMessageKind);
begin
  Log(Format(Msg, Args), MsgKind);
end;

procedure TPieForm.Progress(Position, Max: Integer);
var
  Perc, TotalPerc: Integer;
begin
  Perc := Position * 100 div Max;
  ExecTasksGrid.CellByName[COL_EXEC_PROGRESS, ActiveTaskRow].AsInteger := Perc;
  TotalPerc := (ActiveTaskRow * 100 + Perc) div SelectedBatch.GetSelectedTaskCount;
  ProgressBar.Position := TotalPerc;
  Application.ProcessMessages;
end;

procedure TPieForm.Notify(Msg: string);
begin
  MessageLabel.Caption := Format('[%s] %s', [TimeToStr(Time) ,Msg]);
  Application.ProcessMessages;
end;

procedure TPieForm.UpdateUIStatesMainTabSheet;
var
  MainPageActivated: Boolean;
  TaskChecked: Boolean;
begin
  MainPageActivated := (BatchPageControl.ActivePage = MainTabSheet);
  TaskChecked := (DirectMDAProcessor.DefaultBatch.GetSelectedTaskCount > 0);

  // Batch actions
  ActionRegisterBatch.Enabled := MainPageActivated and TaskChecked;
  ActionAddToBatch.Enabled := MainPageActivated and TaskChecked;

  // Template actions, do not synchonize well
  (*ActionCloneTemplate.Enabled := (TasksGrid.SelectedCount = 1) and (TasksGrid.SelectedRow <> -1);
  ActionModifyTemplate.Enabled := ActionCloneTemplate.Enabled;
  ActionOpenTemplate.Enabled := ActionCloneTemplate.Enabled;*)

end;

procedure TPieForm.UpdateUIStatesTemplateSelectionPage;
var
  Frm: TBatchFrame;
begin
  if BatchPageControl.ActivePage = MainTabSheet then
    UpdateUIStatesMainTabSheet
  else begin
    Frm := FindBatchFrame(BatchPageControl.ActivePage);
    if Frm <> nil then
      Frm.UpdateUIStates;
  end;
  Assert(SelectedBatch <> nil);

  ActionModifyBatch.Enabled := (SelectedBatch <> nil) and (SelectedBatch <> DirectMDAProcessor.DefaultBatch);
  ActionDeleteBatch.Enabled := ActionModifyBatch.Enabled;

  if SelectedBatch.GetSelectedTaskCount > 0 then
    TemplateSelectionPage.EnabledButtons := TemplateSelectionPage.EnabledButtons + [bkNext]
  else
    TemplateSelectionPage.EnabledButtons := TemplateSelectionPage.EnabledButtons - [bkNext];
end;

procedure TPieForm.ValidateOutDirectorySelectionPageNextButton;
begin
  if FolderIsValid then
    OutDirectorySelectionPage.EnabledButtons := ExecutionPage.EnabledButtons + [bkNext]
  else
    OutDirectorySelectionPage.EnabledButtons := ExecutionPage.EnabledButtons - [bkNext];
end;

procedure TPieForm.UpdateUIStatesOutDirectorySelectionPage;
begin
  ValidateOutDirectorySelectionPageNextButton;
end;

procedure TPieForm.UpdateUIStatesExecutionPage;
begin
  // nothing to implement.
end;

procedure TPieForm.UpdateUIStates;
begin
  if DirectMDAWizard.ActivePage = TemplateSelectionPage then
    UpdateUIStatesTemplateSelectionPage
  else if DirectMDAWizard.ActivePage = OutDirectorySelectionPage then
    UpdateUIStatesOutDirectorySelectionPage
  else if DirectMDAWizard.ActivePage = ExecutionPage then
    UpdateUIStatesExecutionPage;
end;

procedure TPieForm.CloneTemplate;
var
  Serializer: PGenerationUnitSerializer;
  GenUnit: PGenerationUnit;
  SrcPath: string;
  TgtPath: String;
  T: PTask;
begin
  if (TasksGrid.SelectedCount = 1) and (TasksGrid.SelectedRow <> -1) then

    with TNewTemplateDialog.Create(Self) do begin

      RootDir := GetDirectMDAPath + '\' + DIR_GENERATION_UNITS;

      // request to user for new template name and path
      if Execute then begin
        try
          // copy selected template to new path
          T := TasksGrid.CellByName[COL_NAME, TasksGrid.SelectedRow].ObjectReference as PTask;
          Assert(T <> nil);
          SrcPath := T.GenerationUnit.Path;
          TDirectory.Copy(ExtractFileDir(SrcPath) + '\', Path);

          Serializer := PGenerationUnitSerializer.Create;
          try
            GenUnit := PGenerationUnit.Create;
            try
              Serializer.ReadGenerationUnit(GenUnit, SrcPath);
              GenUnit.Name := TemplateName;
              TgtPath := Path + '\' + ExtractFileName(SrcPath);
              GenUnit.Path := TgtPath;
              Serializer.WriteGenerationUnit(GenUnit, TgtPath);
              DirectMDAProcessor.AddGenerationUnit(GenUnit);
              Assert(DirectMDAProcessor.DefaultBatch.HasTask(GenUnit));
            except
              GenUnit.Free;
            end;
          finally
            Serializer.Free;
          end;

          // rearrange grid to contain the inserted template
          UpdateTasksGrid;
          UpdateUIStates;
        except on E:Exception do
          MessageDlg('Template cannot be copied: ' + E.Message, mtError, [mbOk], 0);
        end;
      end;
      Free;
    end
  else
    MessageDlg('Select template to be cloned.', mtWarning, [mbOk], 0);
end;

procedure TPieForm.DeleteTemplate;
var
  Batch: PBatch;
  GenUnit: PGenerationUnit;
begin
  if (TasksGrid.SelectedCount = 1) and (TasksGrid.SelectedRow <> -1) then begin
    GenUnit := DirectMDAProcessor.GenerationUnits[TasksGrid.SelectedRow];
    if MessageDlg('Do you want to delete selected template "' + GenUnit.Name +
    '" and all related files?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        TDirectory.Delete(ExtractFileDir(GenUnit.Path), True);
        DirectMDAProcessor.DeleteGenerationUnit(GenUnit);


        // rearrange grid
        UpdateTasksGrid;
        for Batch in  DirectMDAProcessor.Batches do
          UpdateBatchPage(Batch);
        UpdateUIStates;
      except
        MessageDlg('Template cannot be deleted.', mtError, [mbOk], 0);
      end;
    end;
  end;
end;

procedure TPieForm.ModifyTemplate;
var
  TemplateRegForm: TTemplateRegisterForm;
  T: PTask;
  TaskToRestore: PTask;
  Batch: PBatch;
  BatchesToRestore: PBatchList;
begin
  if (TasksGrid.SelectedCount = 1) and (TasksGrid.SelectedRow <> -1) then begin
    TemplateRegForm := TTemplateRegisterForm.Create(Self);
    try
      TemplateRegForm.StarUMLApp := FStarUMLApp;
      TemplateRegForm.DirectMDAProcessor := DirectMDAProcessor;

      T := TasksGrid.CellByName[COL_NAME, TasksGrid.SelectedRow].ObjectReference as PTask;
      Assert(T <> nil);

//      TemplateRegForm.GenerationUnitPath :=
//        DirectMDAProcessor.GenerationUnits[TasksGrid.SelectedRow].Path;
      TemplateRegForm.GenerationUnitPath := T.GenerationUnit.Path;

      // Path name - if pathname exists, modifing current template
      if TemplateRegForm.Execute then begin
        try

          // Clean older data

          //TDirectory.Delete(ExtractFileDir(T.GenerationUnit.Path), True);

          // Find modified task in batches
          BatchesToRestore := PBatchList.Create;
          for Batch in  DirectMDAProcessor.Batches do begin
            if Batch.HasTask(T.GenerationUnit) then
              BatchesToRestore.Add(Batch);
          end;

          DirectMDAProcessor.DeleteGenerationUnit(T.GenerationUnit);

          // Set new data
          DirectMDAProcessor.SaveGenerationUnit(TemplateRegForm.GenerationUnit, TemplateRegForm.GenerationUnitPath);
          DirectMDAProcessor.AddGenerationUnit(TemplateRegForm.GenerationUnit);

          // Restore changed tasks in batches
          for Batch in BatchesToRestore do begin
            TaskToRestore := DirectMDAProcessor.DefaultBatch.FindTask(TemplateRegForm.GenerationUnit);
            Batch.AddTask(TaskToRestore.Clone);
            UpdateBatchPage(Batch);
          end;
          BatchesToRestore.Free;

          UpdateTasksGrid;
          UpdateUIStates;
        except
          on E: Exception do begin
            ErrorMessage(Format(ERR_REGISTER_TEMPLATE, [E.Message]));
          end;
        end;
      end;
    finally
      TemplateRegForm.Free;
    end;
  end
  else
    MessageDlg('Select template to modify.', mtWarning, [mbOk], 0);
end;

procedure TPieForm.OpenTemplate;
var
  Path: String;
  GenUnit: PGenerationUnit;
  I: Integer;
//  A: array[0..1000] of Char;
  Ext: string;
  T: PTask;
begin
  if (TasksGrid.SelectedCount = 1) and (TasksGrid.SelectedRow <> -1) then begin

    T := TasksGrid.CellByName[COL_NAME, TasksGrid.SelectedRow].ObjectReference as PTask;
    Assert(T <> nil);

    try
//      GenUnit := DirectMDAProcessor.GenerationUnits[TasksGrid.SelectedRow];
      GenUnit := T.GenerationUnit;
      Path := '';
      for I := 0 to GenUnit.ParameterCount-1 do
        if LowerCase(GenUnit.Parameters[I].Name) = 'templatefile' then begin
          Path := GenUnit.Parameters[I].Value;
          break;
        end;

      if Path <> '' then begin
        Path := StringReplace(
                  Path, '$TEMPLATES$',
                  GetDirectMDAPath + '\' + DIR_GENERATION_UNITS,
                  [rfReplaceAll, rfIgnoreCase]);

        Path := StringReplace(
                  Path, '$PATH$',
                  ExtractFileDir(GenUnit.Path),
                  [rfReplaceAll, rfIgnoreCase]);

        Ext := LowerCase(Copy(Path, Length(Path)-3, 4));

        if (Ext = '.doc') or (Ext = '.dot') then
          OpenTemplateFile('\designers\WordTemplateDesigner.exe', path)
        else if (Ext = '.xls') or (Ext = '.xlt') then
          OpenTemplateFile('\designers\ExcelTemplateDesigner.exe', path)
        else if (Ext = '.ppt') or (Ext = '.pot') then
          OpenTemplateFile('\designers\PowerpointTemplateDesigner.exe', path)
        else
          OpenTemplateFile('\designers\CodeTemplateEditor.exe', path);
      end
      else
        raise Exception.Create('The selected template can''t be opened.');

      Path := DirectMDAProcessor.GenerationUnits[TasksGrid.SelectedRow].Path;
    except
      MessageDlg('The selected template can''t be opened.', mtError, [mbOk], 0);
    end;
  end
  else
    MessageDlg('Select template.', mtWarning, [mbOk], 0);
end;

procedure TPieForm.OpenTemplateFile(const ExeFilename: String; Filename: String);
var
  A: array[0..1000] of Char;
begin
  StarUMLApp.Log('Open template file: ' + Filename);

  try
    Filename := '"' + Filename + '"';
    StrPCopy(A, Filename);

    if FileExists(GetDirectMDAPath + ExeFilename) then
      ShellExecute(Handle, nil, PChar(GetDirectMDAPath + ExeFilename), A, nil, SW_SHOWNORMAL)
    else if Copy(Filename, Length(Filename)-4, 4) = '.cot' then
      ShellExecute(Handle, nil, PChar('c:\windows\notepad.exe'), A, nil, SW_MAXIMIZE)
    else
      ShellExecute(Handle, nil, PChar(Filename), nil, nil, SW_MAXIMIZE);
  except
    StarUMLApp.Log('Opening template file is failed.');
  end;
end;

// TPieForm
////////////////////////////////////////////////////////////////////////////////

procedure TPieForm.FormCreate(Sender: TObject);
begin
  Initialize;
end;

procedure TPieForm.FormDestroy(Sender: TObject);
begin
  Finalize;
end;

procedure TPieForm.FormShow(Sender: TObject);
begin
  SetupBatches;
  UpdateUIStates;
end;

procedure TPieForm.TasksGridDblClick(Sender: TObject);
begin
  ShowTaskProperties;
end;

procedure TPieForm.TasksGridChange(Sender: TObject; ACol, ARow: Integer);
var
  RefObj: TObject;
begin
  if TasksGrid.Columns.Item[ACol].Name = COL_CHECK then begin
    RefObj := TasksGrid.CellByName[COL_NAME, ARow].ObjectReference;
    if (RefObj <> nil) and (RefObj is PTask) then
      (RefObj as PTask).Selected := TasksGrid.CellByName[COL_CHECK, ARow].AsBoolean;
    UpdateUIStates;
  end;
end;

procedure TPieForm.RegisterTemplateButtonClick(Sender: TObject);
begin
  RegisterTemplate;
  UpdateUIStates;
end;

procedure TPieForm.OutDirectorySelectionPageEnterPage(Sender: TObject;
  const FromPage: TJvWizardCustomPage);
begin
  OutputDirEdit.Directory := LastOutputDir;
  ValidateOutDirectorySelectionPageNextButton;
end;

procedure TPieForm.OutDirectorySelectionPageExitPage(Sender: TObject;
  const FromPage: TJvWizardCustomPage);
begin
  LastOutputDir := OutputDirEdit.Directory;
  if FolderIsValid then
    DirectMDAProcessor.TargetDir := LastOutputDir;
end;

procedure TPieForm.OutputDirEditChange(Sender: TObject);
begin
  ValidateOutDirectorySelectionPageNextButton;
end;

procedure TPieForm.OutputDirEditMouseEnter(Sender: TObject);
begin
  if FolderIsValid then
    OutputDirEdit.Hint := 'Folder is valid'
  else
    OutputDirEdit.Hint := 'Folder is invalid';
end;

procedure TPieForm.OutputDirShellTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  UpdateUIStatesOutDirectorySelectionPage;
end;

procedure TPieForm.ExecutionPagePage(Sender: TObject);
begin
  DirectMDAWizard.ButtonNext.Caption := TXT_GENERATE;
  ExecutionPage.EnabledButtons := ExecutionPage.EnabledButtons - [bkFinish];
  SetupExecTasks;
  UpdateUIStates;
  ExecTasksGrid.Refresh;
end;

procedure TPieForm.ExecutionPageNextButtonClick(Sender: TObject; var Stop: Boolean);
begin
  ExecutionPage.EnabledButtons := ExecutionPage.EnabledButtons - [bkNext, bkFinish];
  ExecutionPage.EnabledButtons := ExecutionPage.EnabledButtons + [bkCancel];
  try
    ExecuteTasks;
  finally
    ExecutionPage.EnabledButtons := ExecutionPage.EnabledButtons + [bkFinish];
    ExecutionPage.EnabledButtons := ExecutionPage.EnabledButtons - [bkCancel];
  end;
end;

procedure TPieForm.TasksGridCellClick(Sender: TObject; ACol, ARow: Integer);
begin
  ShowTaskDescription;
  if (TasksGrid.Columns.Item[ACol] = PreviewColumn)
    and (TasksGrid.CellByName[COL_PREVIEW, ARow].AsInteger <> -1) then begin
     PreviewTemplate;
  end
  else if TasksGrid.Columns.Item[ACol] = ParametersColumn then begin
    UpdateUIStates;
    EditTaskParameters;
  end;

 end;

procedure TPieForm.BatchPageControlChange(Sender: TObject);
begin
  SelectedBatch := FindBatchOfPage(BatchPageControl.ActivePage);
  UpdateUIStates;
end;

procedure TPieForm.CheckAllCheckBoxClick(Sender: TObject);
begin
  if CheckAllCheckBox.Checked then
    SelectAllTasks
  else
    DeselectAllTasks;
  UpdateUIStates;
end;

procedure TPieForm.GroupComboBoxChange(Sender: TObject);
begin
  UpdateTasksGrid;
  UpdateUIStates;
end;

procedure TPieForm.CategoryComboBoxChange(Sender: TObject);
begin
  UpdateTasksGrid;
  UpdateUIStates;
end;

procedure TPieForm.DocTypeComboBoxChange(Sender: TObject);
begin
  UpdateTasksGrid;
  UpdateUIStates;
end;

function TPieForm.FolderIsValid: Boolean;
begin
  Result := System.SysUtils.DirectoryExists(OutputDirEdit.Directory);
end;

procedure TPieForm.FormatComboBoxChange(Sender: TObject);
begin
  UpdateTasksGrid;
  UpdateUIStates;
end;

procedure TPieForm.ExecutionPageFinishButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  Close;
  Stop := True;
end;

procedure TPieForm.HeartBeatTimerTimer(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TPieForm.QuickDirButtonGroupItems0Click(Sender: TObject);
begin
  SelectSpecialFolderDesktop;
end;

procedure TPieForm.QuickDirButtonGroupItems1Click(Sender: TObject);
begin
  SelectSpecialFolderMyDocs;
end;

procedure TPieForm.QuickDirButtonGroupItems2Click(Sender: TObject);
begin
  // Home
  SelectSpecialFolderHome;
end;

procedure TPieForm.ActionAddToBatchExecute(Sender: TObject);
begin
  AppendSelectedTasksToBatch;
  UpdateUIStates;
end;

procedure TPieForm.ActionCloneTemplateExecute(Sender: TObject);
begin
  CloneTemplate;
end;

procedure TPieForm.ActionDeleteTemplateExecute(Sender: TObject);
begin
  DeleteTemplate;
end;

procedure TPieForm.ActionModifyTemplateExecute(Sender: TObject);
begin
  ModifyTemplate;
end;

procedure TPieForm.ActionOpenTemplateExecute(Sender: TObject);
begin
  OpenTemplate;
end;

procedure TPieForm.ActionRegisterBatchExecute(Sender: TObject);
begin
  RegisterBatch;
  UpdateUIStates;
end;

procedure TPieForm.ActionRegisterTemplateExecute(Sender: TObject);
begin
  RegisterTemplate;
end;

procedure TPieForm.AddBatchMenuClick(Sender: TObject);
begin
  CreateNewBatch;
  UpdateUIStates;
end;

procedure TPieForm.EditBatchMenuClick(Sender: TObject);
begin
  EditBatch;
end;

procedure TPieForm.DeleteBatchMenuClick(Sender: TObject);
begin
  DeleteBatch;
  UpdateUIStates;
end;

procedure TPieForm.DirectMDAWizardCancelButtonClick(Sender: TObject);
begin
  if InGenerating then
    AbortGeneration;
end;

procedure TPieForm.ExecTasksGridDblClick(Sender: TObject);
begin
  ExecuteDocument;
end;

end.
