unit DirectMDAObjects;

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
  Classes, SysUtils;

const
  TXT_DOCTYPE_DOCUMENT = 'DOCUMENT';
  TXT_DOCTYPE_REPORT = 'REPORT';
  TXT_DOCTYPE_SOURCE = 'SOURCE';

  ERR_UNEXPECTED_DOCUMENTYPE = 'Document type is Unknown';
  ERR_UNEXPECTED_TRANSLATOR_TYPE = 'Translator type is improperly.';
  ERR_UNEXPECTED_PARAMETER_TYPE = 'Parameter type is improperly.';

type
  // forward declarations
  PParameter = class;
  PTask = class;

  // exceptions
  EConversionException = class(Exception);

  // Enumerations
  PDocumentTypeKind = (dtDocument, dtReport, dtSource);
  PTranslatorTypeKind = (ttWord, ttExcel, ttPowerPoint, ttText, ttCOM, ttScript, ttEXE);
  PParameterTypeKind = (ptString, ptInteger, ptBoolean, ptElement, ptFileName, ptPathName, ptDate);

  // PGenerationUnit
  PGenerationUnit = class
  private
    FName: string;
    FGroup: string;
    FCategory: string;
    FDescription: string;
    FDocumentType: PDocumentTypeKind;
    FFormat: string;
    FDate: string;
    FVersion: string;
    FProfiles: TStringList;
    FApproach: string;
    FTranslatorType: PTranslatorTypeKind;
    FTranslatorName: string;
    FSample: string;
    FTutorial: string;
    FPreviews: TStringList;
    FValidator: string;
    FParameters: TList;
    FAttachFiles: TStringList;
    FPath: string;
    function GetProfileCount: Integer;
    function GetProfile(Index: Integer): string;
    function GetPreviewCount: Integer;
    function GetPreview(Index: Integer): string;
    procedure SetPreview(Index: Integer; Value: string);
    function GetParameterCount: Integer;
    function GetParameter(Index: Integer): PParameter;
    function GetAttachFileCount: Integer;
    function GetAttachFile(Index: Integer): string;
    procedure SetAttachFile(Index: Integer; Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure ClearProfiles;
    procedure AddProfile(Value: string);
    procedure RemoveProfile(Value: string);
    procedure ClearPreviews;
    procedure AddPreview(Value: string);
    procedure RemovePreview(Value: string);
    procedure ClearParameters;
    procedure AddParameter(Value: PParameter);
    procedure RemoveParameter(Value: PParameter);
    procedure ClearAttachFiles;
    procedure AddAttachFile(Value: string);
    procedure RemoveAttachFile(Value: string);
    function FindParameter(ParamName: string): PParameter;
    function GetNormalizedString(Str: string): string;
    property Name: string read FName write FName;
    property Group: string read FGroup write FGroup;
    property Category: string read FCategory write FCategory;
    property Description: string read FDescription write FDescription;
    property DocumentType: PDocumentTypeKind read FDocumentType write FDocumentType;
    property Format: string read FFormat write FFormat;
    property Date: string read FDate write FDate;
    property Version: string read FVersion write FVersion;
    property ProfileCount: Integer read GetProfileCount;
    property Profiles[Index: Integer]: string read GetProfile;
    property Approach: string read FApproach write FApproach;
    property TranslatorType: PTranslatorTypeKind read FTranslatorType write FTranslatorType;
    property TranslatorName: string read FTranslatorName write FTranslatorName;
    property Sample: string read FSample write FSample;
    property Tutorial: string read FTutorial write FTutorial;
    property PreviewCount: Integer read GetPreviewCount;
    property Previews[Index: Integer]: string read GetPreview write SetPreview;
    property Validator: string read FValidator write FValidator;
    property AttachFileCount: Integer read GetAttachFileCount;
    property AttachFiles[Index: Integer]: string read GetAttachFile write SetAttachFile;
    property ParameterCount: Integer read GetParameterCount;
    property Parameters[Index: Integer]: PParameter read GetParameter;
    property Path: string read FPath write FPath;
  end;

  // PBatch
  PBatch = class
  private
    FName: string;
    FDescription: string;
    FTasks: TList;
    FPath: string;
    function GetTaskCount: Integer;
    function GetTask(Index: Integer): PTask;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ClearTasks;
    procedure AddTask(Value: PTask);
    procedure RemoveTask(Value: PTask);
    function GetNormalizedString(Str: string): string;
    function HasTask(AGenerationUnit: PGenerationUnit): Boolean;
    function FindTask(AGenerationUnit: PGenerationUnit): PTask;
    function GetSelectedTaskCount: Integer;
    procedure DeleteSelectedTasks;
    procedure CopySelectedTasksToBatch(ABatch: PBatch);
    procedure SelectAllTasks;
    procedure DeselectAllTasks;
    property Name: string read FName write FName;
    property Description: string read FDescription write FDescription;
    property TaskCount: Integer read GetTaskCount;
    property Tasks[Index: Integer]: PTask read GetTask;
    property Path: string read FPath write FPath;
  end;

  // PTask
  PTask = class
  private
    FGenerationUnit: PGenerationUnit;
    FParameters: TList;
    FSelected: Boolean;
    function GetParameterCount: Integer;
    function GetParameter(Index: Integer): PParameter;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ClearParameters;
    procedure AddParameter(Value: PParameter);
    function Clone: PTask;
    property GenerationUnit: PGenerationUnit read FGenerationUnit write FGenerationUnit;
    property ParameterCount: Integer read GetParameterCount;
    property Parameters[Index: Integer]: PParameter read GetParameter;
    property Selected: Boolean read FSelected write FSelected;
  end;

  // PParameter
  PParameter = class
  private
    FName: string;
    FType: PParameterTypeKind;
    FValue: string;
  public
    function Clone: PParameter;
    property Name: string read FName write FName;
    property Type_: PParameterTypeKind read FType write FType;
    property Value: string read FValue write FValue;
  end;

  // utility functions
  function StringToDocumentTypeKind(Value: string): PDocumentTypeKind;
  function DocumentTypeKindToString(Value: PDocumentTypeKind): string;
  function StringToTranslatorTypeKind(Value: string): PTranslatorTypeKind;
  function TranslatorTypeKindToString(Value: PTranslatorTypeKind): string;
  function StringToParameterTypeKind(Value: string): PParameterTypeKind;
  function ParameterTypeKindToString(Value: PParameterTypeKind): string;
  function GetProfilesString(AGenerationUnit: PGenerationUnit): string;
  function DocumentTypeKindToLocalizedString(Value: PDocumentTypeKind): string;
  function LocalizedStringToDocumentTypeKind(Value: string): PDocumentTypeKind;

implementation

uses
  Symbols, Utilities;

////////////////////////////////////////////////////////////////////////////////
// PGenerationUnit

constructor PGenerationUnit.Create;
begin
  FProfiles := TStringList.Create;
  FPreviews := TStringList.Create;
  FParameters := TList.Create;
  FAttachFiles := TStringList.Create;
end;

destructor PGenerationUnit.Destroy;
begin
  ClearParameters;
  FProfiles.Free;
  FPreviews.Free;
  FParameters.Free;
  FAttachFiles.Free;
  inherited;
end;

function PGenerationUnit.GetProfileCount: Integer;
begin
  Result := FProfiles.Count;
end;

function PGenerationUnit.GetProfile(Index: Integer): string;
begin
  Result := FProfiles[Index];
end;

function PGenerationUnit.GetPreviewCount: Integer;
begin
  Result := FPreviews.Count;
end;

function PGenerationUnit.GetPreview(Index: Integer): string;
begin
  Result := FPreviews[Index];
end;

procedure PGenerationUnit.SetPreview(Index: Integer; Value: string);
begin
  FPreviews[Index] := Value;
end;

function PGenerationUnit.GetParameterCount: Integer;
begin
  Result := FParameters.Count;
end;

function PGenerationUnit.GetParameter(Index: Integer): PParameter;
begin
  Result := FParameters.Items[Index];
end;

function PGenerationUnit.GetAttachFileCount: Integer;
begin
  Result := FAttachFiles.Count;
end;

function PGenerationUnit.GetAttachFile(Index: Integer): string;
begin
  Result := FAttachFiles[Index];
end;

procedure PGenerationUnit.SetAttachFile(Index: Integer; Value: string);
begin
  FAttachFiles[Index] := Value;
end;

procedure PGenerationUnit.ClearProfiles;
begin
  FProfiles.Clear;
end;

procedure PGenerationUnit.AddProfile(Value: string);
begin
  FProfiles.Add(Value);
end;

procedure PGenerationUnit.RemoveProfile(Value: string);
var
  Idx: Integer;
begin
  Idx := FProfiles.IndexOf(Value);
  if Idx <> -1 then
    FProfiles.Delete(Idx);
end;

procedure PGenerationUnit.ClearPreviews;
begin
  FPreviews.Clear;
end;

procedure PGenerationUnit.AddPreview(Value: string);
begin
  FPreviews.Add(Value);
end;

procedure PGenerationUnit.RemovePreview(Value: string);
var
  Idx: Integer;
begin
  Idx := FPreviews.IndexOf(Value);
  if Idx <> -1 then
    FPreviews.Delete(Idx);
end;

procedure PGenerationUnit.ClearAttachFiles;
begin
  FAttachFiles.Clear;
end;

procedure PGenerationUnit.AddAttachFile(Value: string);
begin
  FAttachFiles.Add(Value);
end;

procedure PGenerationUnit.RemoveAttachFile(Value: string);
var
  Idx: Integer;
begin
  Idx := FAttachFiles.IndexOf(Value);
  if Idx <> -1 then
    FAttachFiles.Delete(Idx);
end;

procedure PGenerationUnit.ClearParameters;
var
  I: Integer;
begin
  for I := FParameters.Count - 1 downto 0 do
    PParameter(FParameters.Items[I]).Free;
  FParameters.Clear;
end;

procedure PGenerationUnit.AddParameter(Value: PParameter);
begin
  FParameters.Add(Value);
end;

procedure PGenerationUnit.RemoveParameter(Value: PParameter);
begin
  FParameters.Remove(Value);
end;

function PGenerationUnit.FindParameter(ParamName: string): PParameter;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ParameterCount - 1 do
    if Parameters[I].Name = ParamName then begin
      Result := Parameters[I];
      Exit;
    end;
end;

function PGenerationUnit.GetNormalizedString(Str: string): string;
var
  S: string;
begin
  S := StringReplace(Str, SYMBOL_DIRECTMDA, GetDirectMDAPath, [rfReplaceAll]);
  S := StringReplace(S, SYMBOL_GROUP, FGroup, [rfReplaceAll]);
  S := StringReplace(S, SYMBOL_CATEGORY, FCategory, [rfReplaceAll]);
  S := StringReplace(S, SYMBOL_NAME, FName, [rfReplaceAll]);
  Result := S;
end;

// PGenerationUnit
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PBatch

constructor PBatch.Create;
begin
  FTasks := TList.Create;
end;

destructor PBatch.Destroy;
begin
  ClearTasks;
  inherited;
end;

function PBatch.GetTaskCount: Integer;
begin
  Result := FTasks.Count;
end;

function PBatch.GetTask(Index: Integer): PTask;
begin
  Result := FTasks.Items[Index];
end;

procedure PBatch.ClearTasks;
var
  I: Integer;
begin
  for I := FTasks.Count - 1 downto 0 do
    PTask(FTasks.Items[I]).Free;
  FTasks.Clear;  
end;

procedure PBatch.AddTask(Value: PTask);
begin
  FTasks.Add(Value);
end;

procedure PBatch.RemoveTask(Value: PTask);
begin
  FTasks.Remove(Value);
end;

function PBatch.GetNormalizedString(Str: string): string;
var
  S: string;
begin
  S := StringReplace(Str, SYMBOL_DIRECTMDA, GetDirectMDAPath, [rfReplaceAll]);
  S := StringReplace(S, SYMBOL_NAME, FName, [rfReplaceAll]);
  Result := S;
end;

function PBatch.HasTask(AGenerationUnit: PGenerationUnit): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to TaskCount - 1 do
    if Tasks[I].GenerationUnit = AGenerationUnit then begin
      Result := True;
      Exit;
    end;
end;

function PBatch.FindTask(AGenerationUnit: PGenerationUnit): PTask;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to TaskCount - 1 do
    if Tasks[I].GenerationUnit = AGenerationUnit then begin
      Result := Tasks[I];
      Exit;
    end;
end;

function PBatch.GetSelectedTaskCount: Integer;
var
  Count, I: Integer;
begin
  Count := 0;
  for I := 0 to TaskCount - 1 do
    if Tasks[I].Selected then
      Inc(Count);
  Result := Count;
end;

procedure PBatch.DeleteSelectedTasks;
var
  I: Integer;
begin
  for I := TaskCount - 1 downto 0 do
    if Tasks[I].Selected then
      RemoveTask(Tasks[I]);
end;

procedure PBatch.CopySelectedTasksToBatch(ABatch: PBatch);
var
  I: Integer;
begin
  for I := TaskCount - 1 downto 0 do
    if Tasks[I].Selected and not ABatch.HasTask(Tasks[I].GenerationUnit) then
      ABatch.AddTask(Tasks[I].Clone);
end;

procedure PBatch.SelectAllTasks;
var
  I: Integer;
begin
  for I := 0 to TaskCount - 1 do
    Tasks[I].Selected := True;
end;

procedure PBatch.DeselectAllTasks;
var
  I: Integer;
begin
  for I := 0 to TaskCount - 1 do
    Tasks[I].Selected := False;
end;

// PBatch
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PTask

constructor PTask.Create;
begin
  FParameters := TList.Create;
  FGenerationUnit := nil;
end;

destructor PTask.Destroy;
begin
  FParameters.Free;
  inherited;
end;

function PTask.GetParameterCount: Integer;
begin
  Result := FParameters.Count;
end;

function PTask.GetParameter(Index: Integer): PParameter;
begin
  Result := FParameters.Items[Index];
end;

procedure PTask.ClearParameters;
var
  I: Integer;
begin
  for I := FParameters.Count - 1 downto 0 do
    PParameter(FParameters.Items[I]).Free;
  FParameters.Clear;
end;

procedure PTask.AddParameter(Value: PParameter);
begin
  FParameters.Add(Value);
end;

function PTask.Clone: PTask;
var
  T: PTask;
  I: Integer;
begin
  T := PTask.Create;
  T.GenerationUnit := FGenerationUnit;
  T.Selected := FSelected;
  for I := 0 to ParameterCount - 1 do
    T.AddParameter(Parameters[I].Clone);
  Result := T;
end;

// PTask
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PParameter

function PParameter.Clone: PParameter;
var
  P: PParameter;
begin
  P := PParameter.Create;
  P.Name := FName;
  P.Type_ := FType;
  P.Value := FValue;
  Result := P;
end;

// PParameter
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Untility functions

function StringToDocumentTypeKind(Value: string): PDocumentTypeKind;
begin
  if Value = VALUE_DOCTYPE_DOCUMENT then
    Result := dtDocument
  else if Value = VALUE_DOCTYPE_REPORT then
    Result := dtReport
  else if Value = VALUE_DOCTYPE_SOURCE then
    Result := dtSource
  else
    raise EConversionException.Create(ERR_UNEXPECTED_DOCUMENTYPE);
end;

function DocumentTypeKindToString(Value: PDocumentTypeKind): string;
begin
  case Value of
    dtDocument: Result := VALUE_DOCTYPE_DOCUMENT;
    dtReport: Result := VALUE_DOCTYPE_REPORT;
    dtSource: Result := VALUE_DOCTYPE_SOURCE;
  end;
end;

function StringToTranslatorTypeKind(Value: string): PTranslatorTypeKind;
begin
  if Value = VALUE_TRANSTYPE_WORD then
    Result := ttWord
  else if Value = VALUE_TRANSTYPE_EXCEL then
    Result := ttExcel
  else if Value = VALUE_TRANSTYPE_POWERPOINT then
    Result := ttPowerPoint
  else if Value = VALUE_TRANSTYPE_TEXT then
    Result := ttText
  else if Value = VALUE_TRANSTYPE_COM then
    Result := ttCOM
  else if Value = VALUE_TRANSTYPE_SCRIPT then
    Result := ttScript
  else if Value = VALUE_TRANSTYPE_EXE then
    Result := ttEXE
  //else if Value = '' then // Value not set yet
  //  Result := ttWord
  else
    raise EConversionException.Create(ERR_UNEXPECTED_TRANSLATOR_TYPE);
end;

function TranslatorTypeKindToString(Value: PTranslatorTypeKind): string;
begin
  case Value of
    ttWord: Result := VALUE_TRANSTYPE_WORD;
    ttExcel: Result := VALUE_TRANSTYPE_EXCEL;
    ttPowerPoint: Result := VALUE_TRANSTYPE_POWERPOINT;
    ttText: Result := VALUE_TRANSTYPE_TEXT;
    ttCOM: Result := VALUE_TRANSTYPE_COM;
    ttScript: Result := VALUE_TRANSTYPE_SCRIPT;
    ttEXE: Result := VALUE_TRANSTYPE_EXE;
  end;
end;

function StringToParameterTypeKind(Value: string): PParameterTypeKind;
begin
  if Value = VALUE_PARAM_STRING then
    Result := ptString
  else if Value = VALUE_PARAM_INTEGER then
    Result := ptInteger
  else if Value = VALUE_PARAM_BOOLEAN then
    Result := ptBoolean
  else if Value = VALUE_PARAM_ELEMENT then
    Result := ptElement
  else if Value = VALUE_PARAM_FILENAME then
    Result := ptFileName
  else if Value = VALUE_PARAM_PATHNAME then
    Result := ptPathName
  else if Value = VALUE_PARAM_DATE then
    Result := ptDate
  else
    raise EConversionException.Create(ERR_UNEXPECTED_PARAMETER_TYPE);
end;

function ParameterTypeKindToString(Value: PParameterTypeKind): string;
begin
  case Value of
    ptString: Result := VALUE_PARAM_STRING;
    ptInteger: Result := VALUE_PARAM_INTEGER;
    ptBoolean: Result := VALUE_PARAM_BOOLEAN;
    ptElement: Result := VALUE_PARAM_ELEMENT;
    ptFileName: Result := VALUE_PARAM_FILENAME;
    ptPathName: Result := VALUE_PARAM_PATHNAME;
    ptDate: Result := VALUE_PARAM_DATE;
  end;
end;

function GetProfilesString(AGenerationUnit: PGenerationUnit): string;
var
  S: string;
  I: Integer;
begin
  S := '';
  if AGenerationUnit.ProfileCount > 1 then
    S := AGenerationUnit.Profiles[0];
  for I := 1 to AGenerationUnit.ProfileCount - 1 do
    S := S + ', ' + AGenerationUnit.Profiles[I];
  Result := S;
end;

function DocumentTypeKindToLocalizedString(Value: PDocumentTypeKind): string;
begin
  case Value of
    dtDocument: Result := TXT_DOCTYPE_DOCUMENT;
    dtReport: Result := TXT_DOCTYPE_REPORT;
    dtSource: Result := TXT_DOCTYPE_SOURCE;
  end;
end;

function LocalizedStringToDocumentTypeKind(Value: string): PDocumentTypeKind;
begin
  if Value = TXT_DOCTYPE_DOCUMENT then
    Result := dtDocument
  else if Value = TXT_DOCTYPE_REPORT then
    Result := dtReport
  else if Value = TXT_DOCTYPE_SOURCE then
    Result := dtSource
  else
    raise EConversionException.Create(ERR_UNEXPECTED_DOCUMENTYPE);
end;

// Untility functions
////////////////////////////////////////////////////////////////////////////////

end.
