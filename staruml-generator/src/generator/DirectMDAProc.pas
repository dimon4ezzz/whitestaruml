unit DirectMDAProc;

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

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Classes, ComObj, ExtCtrls, MSScriptControl_TLB,
  DirectMDAObjects, WSGenerator_TLB, StdVcl;

const
  FILE_EXT_JS = '.JS';
  FILE_EXT_VBS = '.VBS';
  SCRIPT_JS = 'JScript';
  SCRIPT_VBS = 'VBScript';

  TXT_DEFULT_BATCH = 'This is the default batch of StarUML.';
  ERR_CANNOT_CREATE_TRANSLATOR = 'Translator object creation is failed. (%s)';
  ERR_UNSPECIFIED_FAILURE = 'Fail reason is not displayed.';
  ERR_INVALID_TRANSLATOR = 'It is a improper document translator object. (%s)';
  ERR_GENERATION_ERROR = 'Error happens while generating document. (%s)';
  ERR_CANNOT_FIND_SCRIPT = 'The script file for generating document is not found. (%s)';
  ERR_SUBSTANDARD_SCRIPT = 'The function signature is not proper for StarUML Translator funcation signature.';
  ERR_EXE_NOT_FOUND = 'The executable file for generating document is not found. (%s)';
  MSG_GENERATION_START2 = 'Generation %s starts.';
  MSG_GENERATION_COMPLETE2 = 'Generation %s is done.';
  ERR_CANNOT_GENERATE = 'The following reason causes %s not to be created.' + #13#10 + 'Reason : %s';
  MSG_GENERATION_START = 'Document creation starts.(%d)';
  MSG_GENERATION_COMPLETE = 'Document creation is done. (Elapsed time : %d sec)';
  MSG_GENERATION_ABORTED = 'Document creation is canceled by user request.';

type
  // events
  PLogEvent = procedure(Sender: TObject; Msg: string; MsgKind: LogMessageKind) of object;
  PProgressEvent = procedure(Sender: TObject; Position, Max: Integer) of object;
  PTaskEvent = procedure(Sender: TObject; Task: PTask) of object;
  PTaskFinishEvent = procedure(Sender: TObject; Task: PTask; Success: Boolean; Items: TStringList) of object;
  PMessageEvent = procedure(Sender: TObject; Msg: string) of object;

  // PLogAdaptor
  PLogAdaptor = class(TAutoObject, ILogger)
  private
    FOnLog: PLogEvent;
    FOnProgress: PProgressEvent;
    FOnNotify: PMessageEvent;
  protected
    procedure Log(const Msg: WideString; MsgKind: LogMessageKind); safecall;
    procedure Progress(Position: Integer; Max: Integer); safecall;
    procedure Notify(const Msg: WideString); safecall;
  public
    property OnLog: PLogEvent read FOnLog write FOnLog;
    property OnProgress: PProgressEvent read FOnProgress write FOnProgress;
    property OnNotify: PMessageEvent read FOnNotify write FOnNotify;
  end;

  // TGeneratorProcessor
  TGeneratorProcessor = class(TAutoObject, IGeneratorProcessor)
  private
    FGenerationUnits: TList;
    FBatches: TList;
    FDefaultBatch: PBatch;
    FTargetDir: string;
    LogAdaptor: PLogAdaptor;
    ScriptCtrl: TScriptControl;
    GenerationUnitLoaded: Boolean;
    { internal variables }
    CurTask: PTask;
    CurGenerator: ITranslator;
    InGenerating: Boolean;
    { events }
    FOnLog: PLogEvent;
    FOnProgress: PProgressEvent;
    FOnNotify: PMessageEvent;
    FOnExecutingTask: PTaskEvent;
    FOnExecuteTask: PTaskFinishEvent;
    FOnAbortTask: PTaskEvent;
    FOnWarning: PMessageEvent;
    { clear / getter }
    procedure ClearGenerationUnits;
    procedure ClearBatches;
    function GetGenerationUnitCount: Integer;
    function GetGenerationUnit(Index: Integer): PGenerationUnit;
    function GetBatchCount: Integer;
    function GetBatch(Index: Integer): PBatch;
    { loading related methods }
    function LoadGenerationUnit(Path: string): PGenerationUnit;
    function LoadBatch(Path: string): PBatch;
    procedure NotifyAddingGenerationUnit(AGenerationUnit: PGenerationUnit);
    { task executing related methods }
    function RegulateString(ATask: PTask; Str: string): string;
    procedure AssignArguments(ATask: PTask; Args: IHashTable);
    function GetConsoleAgumentString(ATask: PTask): string;
    procedure ExecuteTask(ATask: PTask);
    { event handlers }
    procedure HandleLog(Sender: TObject; Msg: string; MsgKind: LogMessageKind);
    procedure HandleProgress(Sender: TObject; Position, Max: Integer);
    procedure HandleNotify(Sender: TObject; Msg: string);
    { miscellonouse }
    procedure Log(Msg: string; MsgKind: LogMessageKind);
    procedure Progress(Position, Max: Integer);
    procedure Notify(Msg: string);
    procedure HandleRequestGenerationUnit(Sender: TObject; Parameter: string; var Obj: TObject);
    procedure Warning(Msg: string);
  protected
    function ExecuteBatch(const Path: WideString): WordBool; safecall;
  public
    { constructor / destructor }
    destructor Destroy; override;
    procedure Initialize; override;
    { services }
    procedure AddGenerationUnit(AGenerationUnit: PGenerationUnit);
    procedure AddBatch(ABatch: PBatch);
    procedure RemoveBatch(ABatch: PBatch);
    procedure DeleteBatchFromFile(ABatch: PBatch);
    function FindGenerationUnitByPath(Path: string): PGenerationUnit;
    procedure LoadGenerationUnits;
    procedure LoadBatches;
    procedure SaveGenerationUnit(AGenerationUnit: PGenerationUnit; Path: string);
    procedure SaveBatch(ABatch: PBatch; Path: string = '');
    function FindBatchByName(Name: string): PBatch;
    function FindBatchByPath(Path: string): PBatch;
    procedure AquireBatchNames(SL: TStringList);
    procedure Execute(ABatch: PBatch);
    procedure Abort;
    { properties }
    property GenerationUnitCount: Integer read GetGenerationUnitCount;
    property GenerationUnits[Index: Integer]: PGenerationUnit read GetGenerationUnit;
    property BatchCount: Integer read GetBatchCount;
    property Batches[Index: Integer]: PBatch read GetBatch;
    property DefaultBatch: PBatch read FDefaultBatch;
    property TargetDir: string read FTargetDir write FTargetDir;
    { events }
    property OnLog: PLogEvent read FOnLog write FOnLog;
    property OnProgress: PProgressEvent read FOnProgress write FOnProgress;
    property OnExecutingTask: PTaskEvent read FOnExecutingTask write FOnExecutingTask;
    property OnExecuteTask: PTaskFinishEvent read FOnExecuteTask write FOnExecuteTask;
    property OnAbortTask: PTaskEvent read FOnAbortTask write FOnAbortTask;
    property OnWarning: PMessageEvent read FOnWarning write FOnWarning;
    property OnNotify: PMessageEvent read FOnNotify write FOnNotify;
  end;

implementation

uses
  Serializers, Symbols, Utilities,
  ComServ, SysUtils, Dialogs, Forms, DateUtils, ShellAPI, Windows,
  WSExcelTranslator_TLB, WSPowerPointTranslator_TLB,
  WSTextTranslator_TLB, WSWordTranslator_TLB;

////////////////////////////////////////////////////////////////////////////////
// PLogAdaptor

procedure PLogAdaptor.Log(const Msg: WideString; MsgKind: LogMessageKind);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg, MsgKind);
end;

procedure PLogAdaptor.Progress(Position: Integer; Max: Integer);
begin
  if Assigned(FOnProgress) then
    FOnProgress(Self, Position, Max);
end;

procedure PLogAdaptor.Notify(const Msg: WideString);
begin
  if Assigned(FOnNotify) then
    FOnNotify(Self, Msg);
end;

// PLogAdaptor
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TDirectMDAProcessor

procedure TGeneratorProcessor.Initialize;
begin
  inherited;
  FGenerationUnits := TList.Create;
  FBatches := TList.Create;
  FDefaultBatch := PBatch.Create;
  FDefaultBatch.Name := BATCH_DEFAULT;
  FDefaultBatch.Description := TXT_DEFULT_BATCH;
  LogAdaptor := PLogAdaptor.Create;
  LogAdaptor._AddRef;
  LogAdaptor.OnLog := HandleLog;
  LogAdaptor.OnProgress := HandleProgress;
  LogAdaptor.OnNotify := HandleNotify;
  ScriptCtrl := TScriptControl.Create(Application);
  ScriptCtrl.Timeout := -1;
  GenerationUnitLoaded := False;  
end;

destructor TGeneratorProcessor.Destroy;
begin
  ClearGenerationUnits;
  ClearBatches;
  FGenerationUnits.Free;
  FBatches.Free;
  FDefaultBatch.Free;
  LogAdaptor._Release;
  LogAdaptor := nil;
  ScriptCtrl.Free;
  inherited;
end;

procedure TGeneratorProcessor.ClearGenerationUnits;
var
  I: Integer;
begin
  for I := FGenerationUnits.Count - 1 downto 0 do
    PGenerationUnit(FGenerationUnits.Items[I]).Free;
  FGenerationUnits.Clear;
end;

procedure TGeneratorProcessor.ClearBatches;
var
  I: Integer;
begin
  for I := FBatches.Count - 1 downto 0 do
    PBatch(FBatches.Items[I]).Free;
  FBatches.Clear;
end;

function TGeneratorProcessor.GetGenerationUnitCount: Integer;
begin
  Result := FGenerationUnits.Count;
end;

function TGeneratorProcessor.GetGenerationUnit(Index: Integer): PGenerationUnit;
begin
  Result := FGenerationUnits.Items[Index];
end;

function TGeneratorProcessor.GetBatchCount: Integer;
begin
  Result := FBatches.Count;
end;

function TGeneratorProcessor.GetBatch(Index: Integer): PBatch;
begin
  Result := FBatches.Items[Index];
end;

procedure TGeneratorProcessor.AddGenerationUnit(AGenerationUnit: PGenerationUnit);
begin
  if FGenerationUnits.IndexOf(AGenerationUnit) = -1 then begin
    FGenerationUnits.Add(AGenerationUnit);
    NotifyAddingGenerationUnit(AGenerationUnit);
  end;
end;

procedure TGeneratorProcessor.AddBatch(ABatch: PBatch);
begin
  if FBatches.IndexOf(ABatch) = -1 then
    FBatches.Add(ABatch);
end;

procedure TGeneratorProcessor.RemoveBatch(ABatch: PBatch);
begin
  FBatches.Remove(ABatch);
  ABatch.Free;
end;

procedure TGeneratorProcessor.DeleteBatchFromFile(ABatch: PBatch);
begin
  SysUtils.DeleteFile(ABatch.Path);
  RemoveBatch(ABatch);
end;

function TGeneratorProcessor.FindGenerationUnitByPath(Path: string): PGenerationUnit;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to GenerationUnitCount - 1 do
    if GenerationUnits[I].Path = Path then begin
      Result := GenerationUnits[I];
      Exit;
    end;
end;

function TGeneratorProcessor.LoadGenerationUnit(Path: string): PGenerationUnit;
var
  Serializer: PGenerationUnitSerializer;
  GenUnit: PGenerationUnit;
begin
  Result := nil;
  Serializer := PGenerationUnitSerializer.Create;
  try
    GenUnit := PGenerationUnit.Create;
    try
      Serializer.ReadGenerationUnit(GenUnit, Path);
      AddGenerationUnit(GenUnit);
      Result := GenUnit;
    except
      GenUnit.Free;
    end;
  finally
    Serializer.Free;
  end;
end;

function TGeneratorProcessor.LoadBatch(Path: string): PBatch;
var
  Serializer: PBatchSerializer;
  Batch: PBatch;
begin
  Result := nil;
  Serializer := PBatchSerializer.Create;
  try
    Serializer.OnRequestGenerationUnit := HandleRequestGenerationUnit;
    Batch := PBatch.Create;
    try
      Serializer.ReadBatch(Batch, Path);
      AddBatch(Batch);
      Result := Batch;
    except
      Batch.Free;
    end;
  finally
    Serializer.Free;
  end;
end;

procedure TGeneratorProcessor.NotifyAddingGenerationUnit(AGenerationUnit: PGenerationUnit);
var
  Task: PTask;
  I: Integer;
begin
  Task := PTask.Create;
  FDefaultBatch.AddTask(Task);
  Task.GenerationUnit := AGenerationUnit;
  Task.Selected := False;
  for I := 0 to AGenerationUnit.ParameterCount - 1 do
    Task.AddParameter(AGenerationUnit.Parameters[I].Clone);
end;

function TGeneratorProcessor.RegulateString(ATask: PTask; Str: string): string;
var
  GenUnit: PGenerationUnit;
  S: string;
begin
  S := Str;
  GenUnit := ATask.GenerationUnit;
  if GenUnit <> nil then begin
    S := StringReplace(S, SYMBOL_DIRECTMDA, GetDirectMDAPath + '\' + DIR_GENERATION_UNITS, [rfReplaceAll]);
    S := StringReplace(S, SYMBOL_GROUP, GenUnit.Group, [rfReplaceAll]);
    S := StringReplace(S, SYMBOL_CATEGORY, GenUnit.Category, [rfReplaceAll]);
    S := StringReplace(S, SYMBOL_NAME, GenUnit.Name, [rfReplaceAll]);
    S := StringReplace(S, SYMBOL_PATH, ExtractFileDir(GenUnit.Path), [rfReplaceAll]);
    S := StringReplace(S, SYMBOL_TARGET, FTargetDir, [rfReplaceAll]);
  end;
  Result := S;
end;

procedure TGeneratorProcessor.AssignArguments(ATask: PTask; Args: IHashTable);
var
  P: PParameter;
  I: Integer;
begin
  for I := 0 to ATask.ParameterCount - 1 do begin
    P := ATask.Parameters[I];
    Args.Put(P.Name, RegulateString(ATask, P.Value));
  end;
end;

function TGeneratorProcessor.GetConsoleAgumentString(ATask: PTask): string;
var
  S: string;
  I: Integer;
begin
  S := '';
  for I := 0 to ATask.ParameterCount - 1 do
    S := S + ' -' + ATask.Parameters[I].Name + ':' + ATask.Parameters[I].Value;
  Result := S;
end;

procedure TGeneratorProcessor.ExecuteTask(ATask: PTask);

  function IsCOMBasedGenerator(GenUnit: PGenerationUnit): Boolean;
  begin
    Result := (GenUnit.TranslatorType = ttWord)
      or (GenUnit.TranslatorType = ttExcel)
      or (GenUnit.TranslatorType = ttPowerPoint)
      or (GenUnit.TranslatorType = ttText)
      or (GenUnit.TranslatorType = ttCOM);
  end;

  function GetCOMClassName(GenUnit: PGenerationUnit): string;
  begin
    Assert(IsCOMBasedGenerator(GenUnit));
    Result := '';
    case GenUnit.TranslatorType of
      ttWord: Result := GEN_WORD;
      ttExcel: Result := GEN_EXCEL;
      ttPowerPoint: Result := GEN_POWERPOINT;
      ttText: Result := GEN_TEXT;
      ttCOM: Result := GenUnit.TranslatorName;
    end;
  end;

  function GetCOMClass(GenUnit: PGenerationUnit): TGUID;
  begin
    Assert(IsCOMBasedGenerator(GenUnit));
    //Result := '';
    case GenUnit.TranslatorType of
      ttWord: Result := CLASS_WordTranslatorObj;
      ttExcel: Result := CLASS_ExcelTranslatorObj;
      ttPowerPoint: Result := CLASS_PowerPointTranslatorObj;
      ttText: Result := CLASS_TextTranslatorObj;
      else
       Assert(false);
    end;
  end;

  function ExecuteCOMBasedTask(ATask: PTask; SL: TStringList; var FailMsg: string): Boolean;
  var
    Generator: ITranslator;
    GenUnit: PGenerationUnit;
    InArgs, OutArgs: IHashTable;
    Intf: IInterface;
    Success: Boolean;
    I: Integer;
  begin
    Result := False;
    SL.Clear;
    GenUnit := ATask.GenerationUnit;
    Assert(GenUnit <> nil);
    try
      //Intf := CreateCOMObject(ProgIDToClassID(GetCOMClassName(GenUnit)));
      Intf := CreateCOMObject(GetCOMClass(GenUnit));
    except
      on E: EOleSysError do begin
        FailMsg := Format(ERR_CANNOT_CREATE_TRANSLATOR, [E.Message]);
        Exit;
      end;
    end;
    try
      if Intf.QueryInterface(ITranslator, Generator) = S_OK then begin
        CurGenerator := Generator;
        try
          Generator.SetLogger(LogAdaptor);
          InArgs := CoHashTable.Create;
          AssignArguments(ATask, InArgs);
          Success := Generator.Execute(InArgs, OutArgs);
          for I := 0 to Generator.GetGeneratedFileCount - 1 do
            SL.Add(Generator.GetGeneratedFileAt(I));
          if not Success then
            FailMsg := ERR_UNSPECIFIED_FAILURE;
          Result := Success;
        finally
          CurGenerator := nil;
        end;
      end
      else begin
        FailMsg := Format(ERR_INVALID_TRANSLATOR, [GetCOMClassName(GenUnit)]);
        Exit;
      end;
    except
      on E: EOleSysError do begin
        FailMsg := Format(ERR_GENERATION_ERROR, [E.Message]);
        Exit;
      end;
      on E: Exception do begin
        FailMsg := Format(ERR_GENERATION_ERROR, [E.Message]);
        Exit;
      end;
    end;
  end;

  function GetScriptLanguage(ScriptFile: string): string;
  var
    FileExt: string;
  begin
    FileExt := UpperCase(ExtractFileExt(ScriptFile));
    if FileExt = FILE_EXT_JS then
      Result := SCRIPT_JS
    else if FileExt = FILE_EXT_VBS then
      Result := SCRIPT_VBS
    else
      Result := SCRIPT_JS;
  end;

  function ExistingScriptFunction(FunctionName: string): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 1 to ScriptCtrl.Procedures.Count do
      if ScriptCtrl.Procedures.Item[I].Name = FunctionName then begin
        Result := True;
        Exit;
      end;
  end;

  function CheckScriptFunctions: Boolean;
  begin
    Result := ExistingScriptFunction('SetLogger') and ExistingScriptFunction('Execute')
      and ExistingScriptFunction('GetGeneratedFileCount') and ExistingScriptFunction('GetGeneratedFileAt')
      and ExistingScriptFunction('Abort');
  end;

  function ExecuteScriptTask(ATask: PTask; SL: TStringList; var FailMsg: string): Boolean;
  var
    ScriptCode: TStringList;
    ScriptPath: string;
    GenUnit: PGenerationUnit;
    InArgs: IHashTable;
    OutArgs: IHashTable;
    Success: Boolean;
  begin
    Result := False;
    SL.Clear;
    GenUnit := ATask.GenerationUnit;
    Assert(GenUnit <> nil);
    ScriptPath := ExtractFileDir(GenUnit.Path) + '\' + GenUnit.TranslatorName;
    if not FileExists(ScriptPath) then begin
      FailMsg := Format(ERR_CANNOT_FIND_SCRIPT, [ScriptPath]);
      Exit;
    end;
    try
      ScriptCtrl.Language := GetScriptLanguage(ScriptPath);
      ScriptCode := TStringList.Create;
      try
        ScriptCode.LoadFromFile(ScriptPath);
        ScriptCtrl.Reset;
        ScriptCtrl.AddCode('var _EXECUTION_OUT_ARGUMENTS = null;');
        ScriptCtrl.AddCode(ScriptCode.Text);
        if CheckScriptFunctions then begin
          ScriptCtrl.AddObject('_DIRECTMDA_LOGGER', LogAdaptor, True);
          ScriptCtrl.Eval('SetLogger(_DIRECTMDA_LOGGER)');
          InArgs := CoHashTable.Create;
          AssignArguments(ATask, InArgs);
          ScriptCtrl.AddObject('_EXECUTION_IN_ARGUMENTS', InArgs, True);
          Success := ScriptCtrl.Eval('Execute(_EXECUTION_IN_ARGUMENTS, _EXECUTION_OUT_ARGUMENTS)');
          if not Success then
            FailMsg := ERR_UNSPECIFIED_FAILURE;
        end
        else begin
          Success := False;
          FailMsg := ERR_SUBSTANDARD_SCRIPT;
        end;
      finally
        ScriptCode.Free;
      end;
    except
      on E: Exception do begin
        FailMsg := Format(ERR_GENERATION_ERROR, [E.Message]);
        Exit;
      end;
    end;
    Result := Success;
  end;

  function ExecuteExeTask(ATask: PTask; SL: TStringList; var FailMsg: string): Boolean;
  var
    GenUnit: PGenerationUnit;
    ExePath: string;
    Dir, FileName: string;
    Success: Boolean;
  begin
    Result := False;
    SL.Clear;
    GenUnit := ATask.GenerationUnit;
    Assert(GenUnit <> nil);
    ExePath := ExtractFileDir(GenUnit.Path) + '\' + GenUnit.TranslatorName;
    if not FileExists(ExePath) then begin
      FailMsg := Format(ERR_EXE_NOT_FOUND, [ExePath]);
      Exit;
    end;
    try
      Dir := ExtractFileDir(ExePath);
      FileName := ExtractFileName(ExePath);
      Success := ShellExecute(0, 'open', PChar(FileName), PChar(GetConsoleAgumentString(ATask)), PChar(Dir), SW_HIDE) > 32;
      if not Success then
        FailMsg := ERR_UNSPECIFIED_FAILURE;
      Result := Success;
    except
      on E: Exception do begin
        FailMsg := Format(ERR_GENERATION_ERROR, [E.Message]);
        Exit;
      end;
    end;
  end;

var
  GenUnit: PGenerationUnit;
  SL: TStringList;
  FailMsg: string;
  Success: Boolean;
begin
  GenUnit := ATask.GenerationUnit;
  Assert(GenUnit <> nil);
  if Assigned(FOnExecutingTask) then
    FOnExecutingTask(Self, ATask);
  Log(Format(MSG_GENERATION_START2, [GenUnit.Name]), lmNormal);
  SL := TStringList.Create;
  try
    Success := False;
    if IsCOMBasedGenerator(GenUnit) then
      Success := ExecuteCOMBasedTask(ATask, SL, FailMsg)
    else if GenUnit.TranslatorType = ttScript then
      Success := ExecuteScriptTask(ATask, SL, FailMsg)
    else if GenUnit.TranslatorType = ttEXE then
      Success := ExecuteExeTask(ATask, SL, FailMsg);
    if InGenerating then begin
      if Success then
        Log(Format(MSG_GENERATION_COMPLETE2, [GenUnit.Name]), lmNormal)
      else
        Log(Format(ERR_CANNOT_GENERATE, [GenUnit.Name, FailMsg]), lmError);
      if Assigned(FOnExecuteTask) then
        FOnExecuteTask(Self, ATask, Success, SL);
    end;
  finally
    SL.Free;
  end;
end;

procedure TGeneratorProcessor.HandleLog(Sender: TObject; Msg: string; MsgKind: LogMessageKind);
begin
  Log(Msg, MsgKind);
end;

procedure TGeneratorProcessor.HandleProgress(Sender: TObject; Position, Max: Integer);
begin
  Progress(Position, Max);
end;

procedure TGeneratorProcessor.HandleNotify(Sender: TObject; Msg: string);
begin
  Notify(Msg);
end;

procedure TGeneratorProcessor.Log(Msg: string; MsgKind: LogMessageKind);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg, MsgKind);
end;

procedure TGeneratorProcessor.Progress(Position, Max: Integer);
begin
  if Assigned(FOnProgress) then
    FOnProgress(Self, Position, Max);
end;

procedure TGeneratorProcessor.Notify(Msg: string);
begin
  if Assigned(FOnNotify) then
    FOnNotify(Self, Msg);
end;

procedure TGeneratorProcessor.HandleRequestGenerationUnit(Sender: TObject; Parameter: string; var Obj: TObject);
begin
  Obj := FindGenerationUnitByPath(Parameter);
end;

procedure TGeneratorProcessor.Warning(Msg: string);
begin
  if Assigned(FOnWarning) then
    FOnWarning(Self, Msg);
end;

function TGeneratorProcessor.ExecuteBatch(const Path: WideString): WordBool;
var
  Batch: PBatch;
begin
  LoadGenerationUnits;
  Batch := FindBatchByPath(Path);
  if Batch = nil then
    Batch := LoadBatch(Path);
  if Batch = nil then begin
    Result := False;
    Exit;
  end
  else begin
    try
      Execute(Batch);
      Result := True;
    except
      Result := False;
    end;
  end;    
end;

procedure TGeneratorProcessor.LoadGenerationUnits;

  procedure LoadGenerationUnitsInDirectory(Dir: string);
  var
    SearchRec: TSearchRec;
    GenUnitPath: string;
  begin
    if FindFirst(Dir + '\*' + EXT_TDF, faArchive ,SearchRec) = 0 then begin
      repeat
        GenUnitPath := Dir + '\' + SearchRec.Name;
        if GenUnitPath <> '' then
          LoadGenerationUnit(GenUnitPath);
      until FindNext(SearchRec) <> 0;
    end;
    if FindFirst(Dir + '\*', faDirectory, SearchRec) = 0 then begin
      repeat
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
          LoadGenerationUnitsInDirectory(Dir + '\' + SearchRec.Name);
      until FindNext(SearchRec) <> 0;
    end;
  end;

begin
  if not GenerationUnitLoaded then begin
    LoadGenerationUnitsInDirectory(GetDirectMDAPath + '\' + DIR_GENERATION_UNITS);
    GenerationUnitLoaded := True;
  end;      
end;

procedure TGeneratorProcessor.LoadBatches;
var
  SearchRec: TSearchRec;
  BatchesDir, BatchPath: string;
begin
  BatchesDir := GetDirectMDAPath + '\' + DIR_BATCHES;
  if FindFirst(BatchesDir + '\*' + EXT_BTF, faArchive, SearchRec) = 0 then begin
    repeat
      BatchPath := BatchesDir + '\' + SearchRec.Name;
      LoadBatch(BatchPath);
    until FindNext(SearchRec) <> 0;
  end;
end;

procedure TGeneratorProcessor.SaveGenerationUnit(AGenerationUnit: PGenerationUnit; Path: string);
var
  Serializer: PGenerationUnitSerializer;
begin
  Serializer := PGenerationUnitSerializer.Create;
  try
    Serializer.WriteGenerationUnit(AGenerationUnit, Path);
  finally
    Serializer.Free;
  end;
end;

procedure TGeneratorProcessor.SaveBatch(ABatch: PBatch; Path: string = '');
var
  Serializer: PBatchSerializer;
  BPath: string;
begin
  Serializer := PBatchSerializer.Create;
  try
    if Path = '' then
      BPath := GetDirectMDAPath + '\' + DIR_BATCHES + '\' + ABatch.Name + EXT_BTF
    else
      BPath := Path;
    Serializer.WriteBatch(ABatch, BPath);
    ABatch.Path := BPath;
  finally
    Serializer.Free;
  end;
end;

function TGeneratorProcessor.FindBatchByName(Name: string): PBatch;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to BatchCount - 1 do
    if Batches[I].Name = Name then begin
      Result := Batches[I];
      Exit;
    end;
end;

function TGeneratorProcessor.FindBatchByPath(Path: string): PBatch;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to BatchCount - 1 do
    if Batches[I].Path = Path then begin
      Result := Batches[I];
      Exit;
    end;
end;

procedure TGeneratorProcessor.AquireBatchNames(SL: TStringList);
var
  I: Integer;
begin
  for I := 0 to BatchCount - 1 do
    SL.Add(Batches[I].Name);
end;

procedure TGeneratorProcessor.Execute(ABatch: PBatch);
var
  STime: TDateTime;
  Elapsed: TTimeStamp;
  I: Integer;
begin
  Log(Format(MSG_GENERATION_START, [ABatch.GetSelectedTaskCount]), lmNormal);
  InGenerating := True;
  try
    STime := Time;
    for I := 0 to ABatch.TaskCount - 1 do begin
      if ABatch.Tasks[I].Selected and InGenerating then begin
        CurTask := ABatch.Tasks[I];
        ExecuteTask(ABatch.Tasks[I]);
      end;
    end;
    Elapsed := DateTimeToTimeStamp(Time - STime);
    if InGenerating then
      Log(Format(MSG_GENERATION_COMPLETE, [Elapsed.Time div 1000]), lmNormal);
  finally
    InGenerating := False;
    CurTask := nil;
  end;
end;

procedure TGeneratorProcessor.Abort;
begin
  Assert(CurTask <> nil);
  if CurGenerator <> nil then
    CurGenerator.Abort
  else if CurTask.GenerationUnit.TranslatorType = ttScript then
    ScriptCtrl.Eval('Abort();');
  InGenerating := False;
  Log(MSG_GENERATION_ABORTED, lmWarning);
  if Assigned(FOnAbortTask) then
    FOnAbortTask(Self, CurTask);
end;

// TDirectMDAProcessor
////////////////////////////////////////////////////////////////////////////////

initialization
  TAutoObjectFactory.Create(ComServer, TGeneratorProcessor, Class_GeneratorProcessor,
    ciMultiInstance, tmApartment);
  TAutoObjectFactory.Create(ComServer, PLogAdaptor, Class_LogAdaptor,
    ciInternal, tmApartment);
end.

