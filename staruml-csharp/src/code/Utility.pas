unit Utility;

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
  Classes, WhiteStarUML_TLB;

function GetDllDirectory: string;
function SetQualifiedFileName(var FileName: string): Boolean;
function GetProgramName: string;

  type
// PStringWriter
  PStringWriter = class
  private
    Buffer: TStringList;
    OnCurLine: Boolean;
    FTabToSpace: Boolean;
    FSpaceCnt: Integer;
    FIndentationCount: Integer;
    FHeader: string;
    FFooter: string;
    function GetIntentationStr: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Indent(Count: Integer); overload;
    procedure Outdent(Count: Integer); overload;
    procedure Indent; overload;
    procedure Outdent; overload;
    procedure Clear;
    procedure WriteLine(const S: string); overload;
    procedure WriteLine(const FormatStr: string; const Args: array of const); overload;
    procedure WriteLine; overload;
    procedure Write(const S: string); overload;
    procedure Write(const FormatStr: string; const Args: array of const); overload;
    procedure Append(Writer: PStringWriter);
    procedure SaveToFile(FileName: string; DirectoryCreation: Boolean = True);
    property IndentationCount: Integer read FIndentationCount write FIndentationCount;
    property TabToSpace: Boolean read FTabToSpace write FTabToSpace ;
    property SpaceCnt: Integer read FSpaceCnt write FSpaceCnt;

    property Header: string read FHeader write FHeader;
    property Footer: string read FFooter write FFooter; 
  end;

implementation

uses
  Windows, SysUtils, Forms, Symbols;

////////////////////////////////////////////////////////////////////////////////
//  PStringWriter

constructor PStringWriter.Create;
begin
  inherited;
  Buffer := TStringList.Create;
  FSpaceCnt := 4;
  FIndentationCount := 0;
end;

destructor PStringWriter.Destroy;
begin
  Buffer.Free;
  Buffer := nil;
  inherited;
end;

procedure PStringWriter.Indent(Count: Integer);
begin
  FIndentationCount := FIndentationCount + Count;
  if FIndentationCount < 0 then
    FIndentationCount := 0;
end;

procedure PStringWriter.Outdent(Count: Integer);
begin
  FIndentationCount := FIndentationCount - Count;
  if FIndentationCount < 0 then
    FIndentationCount := 0;
end;

procedure PStringWriter.Indent;
begin
  Indent(1);
end;

procedure PStringWriter.Outdent;
begin
  Outdent(1);
end;

procedure PStringWriter.Clear;
begin
  Buffer.Clear;
  OnCurLine := False;
  FSpaceCnt := 4;
  FIndentationCount := 0;
end;

procedure PStringWriter.WriteLine(const S: string);
begin
  if OnCurLine then
    Buffer[Buffer.Count - 1] := Buffer[Buffer.Count - 1] + S
  else
    Buffer.Add(GetIntentationStr + S);

  OnCurLine := False;
end;

function PStringWriter.GetIntentationStr: string;
begin
  if FTabToSpace then
    Result := StringOfChar(#32, FSpaceCnt * FIndentationCount)
  else
    Result := StringOfChar(#9, FIndentationCount);
end;

procedure PStringWriter.WriteLine(const FormatStr: string; const Args: array of const);
var
  S : string;
begin
  S := TrimLeft(Format(FormatStr, Args));
  while S <> StringReplace(S, '  ', ' ', [rfReplaceAll]) do
    S := StringReplace(S, '  ', ' ', [rfReplaceAll]);
  WriteLine(S);
end;

procedure PStringWriter.WriteLine;
begin
  WriteLine('');
end;

procedure PStringWriter.Write(const S: string);
var
  XStr : string;
begin

  if not OnCurLine then
    Buffer.Add(GetIntentationStr + S)
  else begin
    Buffer[Buffer.Count - 1] := Buffer[Buffer.Count - 1] + S;
  end;
  OnCurLine := True;
end;

procedure PStringWriter.Write(const FormatStr: string; const Args: array of const);
var
  S : string;
begin
  S := TrimLeft(Format(FormatStr, Args));
  while S <> StringReplace(S, '  ', ' ', [rfReplaceAll]) do
    S := StringReplace(S, '  ', ' ', [rfReplaceAll]);
  Write(S);
end;

procedure PStringWriter.Append(Writer: PStringWriter);
var
  I: Integer;
begin
  for I := 0 to Writer.Buffer.Count - 1 do
    WriteLine(Writer.Buffer[I]);
end;

procedure PStringWriter.SaveToFile(FileName: string; DirectoryCreation: Boolean = True);
var
  Dir: string;
begin
 Dir := ExtractFilePath(FileName);
  if DirectoryCreation and not DirectoryExists(Dir) then
    if not ForceDirectories(Dir) then
      raise Exception.Create('Directory Create Error');

  Buffer.SaveToFile(FileName);
end;

//  PStringWriter
////////////////////////////////////////////////////////////////////////////////


function GetDllDirectory: string;
var
  ModuleName : array[0..1023] of char;
  Path: string;
begin
  FillChar(ModuleName, Sizeof(ModuleName), #10);
  GetModuleFileName(HInstance, ModuleName, Sizeof(ModuleName));
  Path := ExtractFileDir(ModuleName);
  Result := Path;
end;

function SetQualifiedFileName(var FileName: string): Boolean;
var
  QualifiedFileName: string;
begin
  Result := False;

  QualifiedFileName := GetDllDirectory + '\' + CSHARP_GRAMMAR_FILE_LOCATION
    + '\' + FileName;
  if not FileExists(QualifiedFileName) then begin
    QualifiedFileName := GetDllDirectory + '\' + FileName;
    if not FileExists(QualifiedFileName) then
      Exit;
  end;

  FileName := QualifiedFileName;
  Result := True;

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
