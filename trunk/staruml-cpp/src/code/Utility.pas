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
  CppElements, Symbols,
  Classes, SysUtils, WhiteStarUML_TLB, PGMR101Lib_TLB;

type
  // exceptions
  EInvalidWritingPosition = class(Exception);
  EFileNotFound = class(Exception);
  EInvalidNode = class(Exception);
  ENotInitialized = class(Exception);

  // events
  PLogEvent = procedure(Sender: TObject; Msg: string) of object;

  // Aliases
  TGmrNode = Integer;
  TGmrSearchID = Integer;

  // TPgmrExt
  TPgmrExt = class(TPgmr)
  public
    { Public Methods }
    function IsNull(Node: TGmrNode): Boolean;
    function ExistsNode(Node: TGmrNode; Path: string): Boolean;
    function GetNodeName(Node: TGmrNode): string;
    function GetNodeValue(Node: TGmrNode; Path: string): string;
    function GetLengthOfNodes(NodeFrom, NodeTo: TGmrNode): Integer;
    function GetStringOfNodes(NodeFrom, NodeTo: TGmrNode): string;
  end;

  // PGmrNodeList
  PGmrNodeList = class
  private
    FNodes: TStringList;
    function GetCount: Integer;
    function GetNode(Index: Integer): TGmrNode;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure Add(Node: TGmrNode);
    procedure Remove(Node: TGmrNode);
    property Count: Integer read GetCount;
    property Nodes[Index: Integer]: TGmrNode read GetNode;
  end;

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
  end;

  // PColumnedText
  PColumnedText = class
  private
    Buffer: TStringList;
    Row, Col: Integer;
    function GetText: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure Write(ARow, ACol: Integer; Value: string);
    procedure SaveToFile(FileName: string);
    property Text: string read GetText;
  end;

// Utility Functions
function GetDllDirectory: string;
function StringToAccessSpecifierKind(Value: string): PCppAccessSpecifierKind;
function StringToClassKeyKind(Value: string): PCppClassKeyKind;
function StringToTypeParameterKind(Value: string): PCppTypeParameterKind;
function UMLTemplateParamTypeToCppType(Value: string): string;

implementation

uses
  NLS_CppAddIn,
  Windows, FileCtrl;

////////////////////////////////////////////////////////////////////////////////
// TPgmrExt

function TPgmrExt.IsNull(Node: TGmrNode): Boolean;
begin
  Result := (Node = PGMR_NODE_NOT_EXISTS);
end;

function TPgmrExt.ExistsNode(Node: TGmrNode; Path: string): Boolean;
begin
  Result := (Find(Path, Node) <> PGMR_NODE_NOT_EXISTS);
end;

function TPgmrExt.GetNodeName(Node: TGmrNode): string;
begin
  Result := GetSymbolName(GetNodeSymbolID(Node));
end;

function TPgmrExt.GetNodeValue(Node: TGmrNode; Path: string): string;
var
  N: TGmrNode;
begin
  N := Find(Path, Node);
  if N = PGMR_NODE_NOT_EXISTS then
    Result := ''
  else
    Result := GetValue(N);
end;

function TPgmrExt.GetLengthOfNodes(NodeFrom, NodeTo: TGmrNode): Integer;
begin
  Result := GetValuePos(NodeTo) + GetValueSize(NodeTo) - GetValuePos(NodeFrom);
end;

function TPgmrExt.GetStringOfNodes(NodeFrom, NodeTo: TGmrNode): string;
begin
  Result := GetInputBuffer(GetValuePos(NodeFrom), GetLengthOfNodes(NodeFrom, NodeTo));
end;

// TPgmrExt
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//  PGmrNodeList

constructor PGmrNodeList.Create;
begin
  FNodes := TStringList.Create;
end;

destructor PGmrNodeList.Destroy;
begin
  FNodes.Free;
  inherited;
end;

function PGmrNodeList.GetCount: Integer;
begin
  Result := FNodes.Count;
end;

function PGmrNodeList.GetNode(Index: Integer): TGmrNode;
begin
  Result := StrToIntDef(FNodes[Index], 0);
end;

procedure PGmrNodeList.Clear;
begin
  FNodes.Clear;
end;

procedure PGmrNodeList.Add(Node: TGmrNode);
begin
  if (Node <> PGMR_NODE_NOT_EXISTS) and (FNodes.IndexOf(IntToStr(Node)) = -1) then
    FNodes.Add(IntToStr(Node));
end;

procedure PGmrNodeList.Remove(Node: TGmrNode);
var
  Idx: Integer;
begin
  if Node <> PGMR_NODE_NOT_EXISTS then begin
    Idx := FNodes.IndexOf(IntToStr(Node));
    if Idx <> -1 then
      FNodes.Delete(Idx);
  end;
end;

//  PGmrNodeList
////////////////////////////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////////////////////////////
// PColumnedText

constructor PColumnedText.Create;
begin
  Buffer := TStringList.Create;
  Clear;
end;

destructor PColumnedText.Destroy;
begin
  Buffer.Free;
  inherited;
end;

function PColumnedText.GetText: string;
begin
  Result := Buffer.Text;
end;

procedure PColumnedText.Clear;
begin
  Buffer.Clear;
  Buffer.Add('');
  Row := 0;
  Col := 0;
end;

procedure PColumnedText.Write(ARow, ACol: Integer; Value: string);
var
  SL: TStringList;
  I: Integer;
begin
  if ARow < Row then
    raise EInvalidWritingPosition.Create(ERR_INVALID_ROW)
  else if (ARow = Row) and (ACol < Col) then
    raise EInvalidWritingPosition.Create(ERR_INVALID_COLUMN);

  SL := TStringList.Create;
  try
    SL.Text := Value;
    if ARow > Row then begin
      for I := Row to ARow - 1 do
        Buffer.Add('');
      Row := ARow;
      Col := 0;
    end;
    Buffer[Buffer.Count - 1] := Buffer[Buffer.Count - 1] + StringOfChar(#32, ACol - Col) + SL[0];
    for I := 1 to SL.Count - 1 do
      Buffer.Add(SL[I]);
    Col := Length(Buffer[Buffer.Count - 1]);
  finally
    SL.Free;
  end;
end;

procedure PColumnedText.SaveToFile(FileName: string);
begin
  Buffer.SaveToFile(FileName);
end;

// PColumnedText
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//  Utility Functions

function GetDllDirectory: string;
var
  ModuleName : array[0..1023] of Char;
  Path: string;
begin
  FillChar(ModuleName, Sizeof(ModuleName), #10);
  GetModuleFileName(HInstance, ModuleName, Sizeof(ModuleName));
  Path := ExtractFileDir(ModuleName);
  Result := Path;
end;

function StringToAccessSpecifierKind(Value: string): PCppAccessSpecifierKind;
begin
  if Value = PGMR_TOKEN_PUBLIC then
    Result := akPublic
  else if Value = PGMR_TOKEN_PROTECTED then
    Result := akProtected
  else if Value = PGMR_TOKEN_PRIVATE then
    Result := akPrivate
  else
    Result := akNotDefined;
end;

function StringToClassKeyKind(Value: string): PCppClassKeyKind;
begin
  if Value = PGMR_TOKEN_CLASS then
    Result := ckClass
  else if Value = PGMR_TOKEN_STRUCT then
    Result := ckStruct
  else if Value = PGMR_TOKEN_UNION then
    Result := ckUnion
  else if (Value = PGMR_TOKEN_INTERFACE) or (Value = PGMR_TOKEN__INTERFACE)
    or (Value = PGMR_TOKEN___INTERFACE) then
    Result := ckInterface
  else
    Result := ckClass;
end;

function StringToTypeParameterKind(Value: string): PCppTypeParameterKind;
begin
  if Value = PGMR_TOKEN_CLASS then
    Result := tkClass
  else if Value = PGMR_TOKEN_TYPENAME then
    Result := tkTypeName
  else
    Result := tkTypeName;
end;

function UMLTemplateParamTypeToCppType(Value: string): string;
begin
  if Value = TYPE_INTEGER then
    Result := 'int'
  else if Value = TYPE_BOOLEAN then
    Result := 'bool'
  else if Value = TYPE_REAL then
    Result := 'float'
  else if Value = TYPE_STRING then
    Result := 'char*'
  else if Value = TYPE_PACKAGE then
    Result := 'class'
  else if Value = TYPE_CLASS then
    Result := 'class'
  else if Value = TYPE_INTERFACE then
    Result := 'class'
  else if Value = TYPE_TYPE then
    Result := 'typename'
  else
    Result := Value;
end;

//  Utility Functions
////////////////////////////////////////////////////////////////////////////////

end.
