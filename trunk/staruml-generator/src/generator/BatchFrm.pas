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
  StdCtrls, ImgList, ExtCtrls, FlatPanel,
  TasksGridFrame, WhiteStarUML_TLB;

const
  QUERY_DELETE_SELECTED_TASKS = 'Do you want to remove selected templates from current batch?';

type
  // TBatchFrame
  TBatchFrame = class(TFrame)
    DeleteTasksButton: TButton;
    TasksGrid: TTasksGrid;
    procedure DeleteTasksButtonClick(Sender: TObject);
  private
    Processor: TGeneratorProcessor;
    Batch: PBatch;
    FStarUMLApp: IStarUMLApplication;
    FOnUpdateUIStates: TNotifyEvent;
    procedure DeleteSelectedTasks;
    procedure RequestUpdateUIStates;
    procedure HandleRequestUpdateUIStates(Sender: TObject);
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

procedure TBatchFrame.DeleteSelectedTasks;
begin
  if Batch.GetSelectedTaskCount > 0 then
    if QueryMessage(QUERY_DELETE_SELECTED_TASKS) then begin
      Batch.DeleteSelectedTasks;
      UpdateTasksGrid(Batch);
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
  TasksGrid.Inititialize(StarUMLApp,HandleRequestUpdateUIStates);
  UpdateTasksGrid(Batch);
end;

procedure TBatchFrame.UpdateTasksGrid(ABatch: PBatch);
var
  I: Integer;
begin
  TasksGrid.ClearRows;
  for I := 0 to Batch.TaskCount - 1 do
    TasksGrid.SetupTaskRow(Batch.Task[I]);
  TasksGrid.Refresh;
end;

procedure TBatchFrame.UpdateUIStates;
begin
  DeleteTasksButton.Enabled := (Batch.GetSelectedTaskCount > 0);
end;

procedure TBatchFrame.DeleteTasksButtonClick(Sender: TObject);
begin
  DeleteSelectedTasks;
  RequestUpdateUIStates;
end;

procedure TBatchFrame.HandleRequestUpdateUIStates(Sender: TObject);
begin
  RequestUpdateUIStates;
end;

// TBatchFrame
////////////////////////////////////////////////////////////////////////////////



end.
