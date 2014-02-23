unit Utilities;

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
  PetalElements,
  Classes, PGMR101Lib_TLB;

type
  // RTimeChecker - for check delay
  RTimeChecker = class
  private
    TimeList: TStringList;
    Current: TDateTime;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Start;
    procedure CheckPoint(Msg: string);
    procedure Finish;
    procedure SaveToFile(FileName: string);
  end;

function StringToNotationKind(Value: string): RNotationKind;
function StringToTimePointKind(Value: string): RTimePointKind;
function StringToConcurrencyKind(Value: string): RConcurrencyKind;
function StringToPersistenceKind(Value: string): RPersistenceKind;
function StringToContainmentKind(Value: string): RContainmentKind;
function StringToExportControlKind(Value: string): RExportControlKind;
function StringToLinkVisibilityKind(Value: string): RLinkVisibilityKind;
function StringToMessageDirectionKind(Value: string): RMessageDirectionKind;
function StringToMessageFrequencyKind(Value: string): RMessageFrequencyKind;
function StringToMessageSynchronizationKind(Value: string): RMessageSynchronizationKind;
function StringToProcessorSchedulingKind(Value: string): RProcessorSchedulingKind;
function StringToStateKind(Value: string): RStateKind;
function StringToIconStyleKind(Value: string): RIconStyleKind;
function IntegerToLineStyleKind(Value: Integer): RLineStyleKind;
function IntegerToDataFlowDirectionKind(Value: Integer): RDataFlowDirectionKind;
function IntegerToSynchFlowDirectionKind(Value: Integer): RSynchFlowDirectionKind;
function IntegerToMessViewDirectionKind(Value: Integer): RMessViewDirectionKind;
function Vertex(X, Y: Integer): RPoint;
procedure DelimitText(Text: string; Delimiter: string; SL: TStrings);
function GetDllPath: string;
function GetProgramName: string;

implementation

uses
  Windows, SysUtils;

const
  MAX_INTEGER = 2147483647;
  NOT_EXISTS = 0;

////////////////////////////////////////////////////////////////////////////////
//  RTimeChecker

constructor RTimeChecker.Create;
begin
  TimeList := TStringList.Create;
end;

destructor RTimeChecker.Destroy;
begin
  TimeList.Free;
end;

procedure RTimeChecker.Start;
begin
  Current := Time;
  TimeList.Add('[Start]');
end;

procedure RTimeChecker.CheckPoint(Msg: string);
var
  Interval: Integer;
begin
  Interval := DateTimeToTimeStamp(Time).Time - DateTimeToTimeStamp(Current).Time;
  TimeList.Add(Format('(%d ms) %s', [Interval, Msg]));
  Current := Time;
end;

procedure RTimeChecker.Finish;
begin
  TimeList.Add('[Finish]');
end;

procedure RTimeChecker.SaveToFile(FileName: string);
begin
  TimeList.SaveToFile(FileName);
end;

//  RTimeChecker
////////////////////////////////////////////////////////////////////////////////

function StringToNotationKind(Value: string): RNotationKind;
begin
  if Value = 'Unified' then Result := nkUnified
  else if Value = 'Booch' then Result := nkBooch
  else if Value = 'OMT' then Result := nkOMT
  else Result := nkUnified;
end;

function StringToTimePointKind(Value: string): RTimePointKind;
begin
  if Value = 'Entry' then Result := tkEntry
  else if Value = 'Exit' then Result := tkExit
  else if Value = 'Activity' then Result := tkActivity
  else if Value = 'UponEvent' then Result := tkUponEvent
  else Result := tkEntry;
end;

function StringToConcurrencyKind(Value: string): RConcurrencyKind;
begin
  if Value = 'Sequential' then Result := ckSequential
  else if Value = 'Guarded' then Result := ckGuarded
  else if Value = 'Synchronous' then Result := ckSynchronous
  else if Value = 'Active' then Result := ckActive
  else Result := ckSequential;
end;

function StringToPersistenceKind(Value: string): RPersistenceKind;
begin
  if Value = 'Persistent' then Result := pkPersistent
  else if Value = 'Static' then Result := pkStatic
  else if Value = 'Transient' then Result := pkTransient
  else Result := pkTransient;
end;

function StringToContainmentKind(Value: string): RContainmentKind;
begin
  if Value = 'By Value' then Result := ckByValue
  else if Value = 'By Reference' then Result := ckByReference
  else Result := ckUnspecifed;
end;

function StringToExportControlKind(Value: string): RExportControlKind;
begin
  if Value = 'Public' then Result := ekPublic
  else if Value = 'Protected' then Result := ekProtected
  else if Value = 'Private' then Result := ekPrivate
  else if Value = 'Implementation' then Result := ekImplementation
  else Result := ekPublic;
end;

function StringToLinkVisibilityKind(Value: string): RLinkVisibilityKind;
begin
  if Value = 'FIELD' then Result := vkField
  else if Value = 'PARAMETER' then Result := vkParameter
  else if Value = 'LOCAL' then Result := vkLocal
  else if Value = 'GLOBAL' then Result := vkGlobal
  else Result := vkField;
end;

function StringToMessageDirectionKind(Value: string): RMessageDirectionKind;
begin
  if Value = 'ToClientFromSupplier' then Result := dkSupplierToClient
  else if Value = 'FromClientToSupplier' then Result := dkClientToSupplier
  else Result := dkSupplierToClient;
end;

function StringToMessageFrequencyKind(Value: string): RMessageFrequencyKind;
begin
  if Value = 'Periodic' then Result := fkPeriodic
  else if Value = 'Aperiodic' then Result := fkAperiodic
  else Result := fkPeriodic;
end;

function StringToMessageSynchronizationKind(Value: string): RMessageSynchronizationKind;
begin
  if Value = 'Simple' then Result := skSimple
  else if Value = 'Synchronous' then Result := skSynchronous
  else if Value = 'Balking' then Result := skBalking
  else if Value = 'Timeout' then Result := skTimeout
  else if Value = 'ProcedureCall' then Result := skProcedureCall
  else if Value = 'Asynchronous' then Result := skAsynchronous
  else if Value = 'Return' then Result := skReturn
  else Result := skSimple;
end;

function StringToProcessorSchedulingKind(Value: string): RProcessorSchedulingKind;
begin
  if Value = 'Preemptive' then Result := skPreemptive
  else if Value = 'NonPreemptive' then Result := skNonPreemptive
  else if Value = 'Cyclic' then Result := skCyclic
  else if Value = 'Executive' then Result := skExecutive
  else if Value = 'Manual' then Result := skManual
  else Result := skPreemptive;
end;

function StringToStateKind(Value: string): RStateKind;
begin
  if Value = 'Normal' then Result := skNormal
  else if Value = 'StartState' then Result := skStartState
  else if Value = 'EndState' then Result := skEndState
  else if Value = 'History' then Result := skHistory
  else if Value = 'HistoryAll' then Result := skHistoryAll
  else Result := skNormal;
end;

function StringToIconStyleKind(Value: string): RIconStyleKind;
begin
  if Value = 'None' then Result := ikNone
  else if Value = 'Label' then Result := ikLabel
  else if Value = 'Decoration' then Result := ikDecoration
  else if Value = 'Icon' then Result := ikIcon
  else Result := ikLabel;
end;

function IntegerToLineStyleKind(Value: Integer): RLineStyleKind;
begin
  case Value of
    0: Result := lkOblique;
    3: Result := lkRectlinear;
    4: Result := lkSelf;
    else Result := lkOblique;
  end;
end;

function IntegerToDataFlowDirectionKind(Value: Integer): RDataFlowDirectionKind;
begin
  if Value = -1 then Result := dkReverse
  else if Value = 1 then Result := dkForward
  else Result := dkForward;
end;

function IntegerToSynchFlowDirectionKind(Value: Integer): RSynchFlowDirectionKind;
begin
  if Value = 1 then Result := dkVertical
  else if Value = 2 then Result := dkHorizontal
  else Result := dkVertical;
end;

function IntegerToMessViewDirectionKind(Value: Integer): RMessViewDirectionKind;
begin
  if Value = -1 then Result := mdkReverse
  else if Value = 1 then Result := mdkForward
  else Result := mdkForward;
end;

function Vertex(X, Y: Integer): RPoint;
var
  P: RPoint;
begin
  P := RPoint.Create;
  P.X := X;
  P.Y := Y;
  Result := P;
end;

procedure DelimitText(Text: string; Delimiter: string; SL: TStrings);
var
  S: string;
  P: Integer;
begin
  SL.Clear;
  S := Text;
  P := Pos(Delimiter, S);
  while P > 0 do begin
    SL.Add(Copy(S, 1, P - 1));
    S := Copy(S, P + Length(Delimiter), Length(S) - P - Length(Delimiter) + 1);
    P := Pos(Delimiter, S);
  end;
  SL.Add(S);
end;

function GetDllPath: string;
var
  ModuleName : array[0..1023] of char;
  Path: string;
begin
  FillChar(ModuleName, Sizeof(ModuleName), #10);
  GetModuleFileName(HInstance, ModuleName, Sizeof(ModuleName));
  Path := ExtractFileDir(ModuleName);
  Result := Path;
end;

function GetProgramName: string;
const
  CallingProcessHandle = 0;
var
  NameInput: array [1 .. MAX_PATH] of WideChar;
  FileNameLength: Cardinal;
begin
    FileNameLength := GetModuleFileName(CallingProcessHandle, @NameInput, MAX_PATH);
    if FileNameLength > 0 then
      Result := ExtractFileName(WideCharToString(@NameInput));
end;

end.

