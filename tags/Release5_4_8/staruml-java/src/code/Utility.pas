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
  Classes, SysUtils;

const
  ERR_CANNOT_CREATE_DIRECTORY = 'cannot create directory';

  function GetProgramName: string;

type
  // exceptions
  ENotInitialized = class(Exception);

  // PStringWriter
  PStringWriter = class
  private
    Buffer: TStringList;
    OnCurLine: Boolean;
    FIndentationSize: Integer;
    FIndentationCount: Integer;
    FUseTab: Boolean;
    function SpaceChar: Char;
    function SpaceCount: Integer;
    function GetWrited: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure Indent(Count: Integer); overload;
    procedure Outdent(Count: Integer); overload;
    procedure Indent; overload;
    procedure Outdent; overload;
    procedure WriteLine(const S: string); overload;
    procedure WriteLine(const FormatStr: string; const Args: array of const); overload;
    procedure WriteLine; overload;
    procedure Write(const S: string); overload;
    procedure Write(const FormatStr: string; const Args: array of const); overload;
    procedure Append(Writer: PStringWriter);
    procedure SaveToFile(FileName: string; DirectoryCreation: Boolean = True);
    property IndentationSize: Integer read FIndentationSize write FIndentationSize;
    property IndentationCount: Integer read FIndentationCount write FIndentationCount;
    property UseTab: Boolean read FUseTab write FUseTab;
    property Writed: Boolean read GetWrited;
  end;

implementation

uses
  Windows;

////////////////////////////////////////////////////////////////////////////////
//  PStringWriter

constructor PStringWriter.Create;
begin
  inherited;
  Buffer := TStringList.Create;
  FIndentationSize := 2;
  FIndentationCount := 0;
end;

destructor PStringWriter.Destroy;
begin
  Buffer.Free;
  Buffer := nil;
  inherited;
end;

procedure PStringWriter.Clear;
begin
  Buffer.Clear;
  OnCurLine := False;
  FIndentationCount := 0;
end;

function PStringWriter.SpaceChar: Char;
begin
  if FUseTab then Result := #9
  else Result := #32;
end;

function PStringWriter.SpaceCount: Integer;
begin
  if FUseTab then Result := 1
  else Result := FIndentationSize;
end;

function PStringWriter.GetWrited: Boolean;
begin
  Result := (Buffer.Text <> '');
end;

procedure PStringWriter.Indent(Count: Integer);
begin
  FIndentationCount := FIndentationCount + Count;
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

procedure PStringWriter.WriteLine(const S: string);
begin
  if OnCurLine then
    Buffer[Buffer.Count - 1] := Buffer[Buffer.Count - 1] + S
  else
    Buffer.Add(StringOfChar(SpaceChar, SpaceCount * FIndentationCount) + S);
  OnCurLine := False;
end;

procedure PStringWriter.WriteLine(const FormatStr: string; const Args: array of const);
begin
  WriteLine(Format(FormatStr, Args));
end;

procedure PStringWriter.WriteLine;
begin
  WriteLine('');
end;

procedure PStringWriter.Write(const S: string);
begin
  if OnCurLine then
    Buffer[Buffer.Count - 1] := Buffer[Buffer.Count - 1] + S
  else
    Buffer.Add(StringOfChar(SpaceChar, SpaceCount * FIndentationCount) + S);
  OnCurLine := True;
end;

procedure PStringWriter.Write(const FormatStr: string; const Args: array of const);
begin
  Write(Format(FormatStr, Args));
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
      raise Exception.Create(ERR_CANNOT_CREATE_DIRECTORY);
  Buffer.SaveToFile(FileName);
end;

//  PStringWriter
////////////////////////////////////////////////////////////////////////////////

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
