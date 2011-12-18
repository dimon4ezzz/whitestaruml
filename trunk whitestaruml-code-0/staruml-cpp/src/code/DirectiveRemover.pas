unit DirectiveRemover;

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
  Utility;

type
  // PDirectiveRemover
  PDirectiveRemover = class
  private
    Pgmr: TPgmrExt;
    procedure AssureNodeAs(Node: TGmrNode; NodeName: string);
    procedure WriteCompilationUnit(Writer: PColumnedText; Node: TGmrNode);
    procedure WriteAwarenessUnitList(Writer: PColumnedText; Node: TGmrNode);
    procedure WriteAwarenessUnit(Writer: PColumnedText; Node: TGmrNode);
    procedure WriteDirective(Writer: PColumnedText; Node: TGmrNode);
    procedure WriteNoDirectiveBlock(Writer: PColumnedText; Node: TGmrNode);
    procedure WriteConditional(Writer: PColumnedText; Node: TGmrNode);
    procedure WriteIfPart(Writer: PColumnedText; Node: TGmrNode);
  public
    constructor Create;
    destructor Destroy; override;
    function GetFiltedSource(SourceFileName: string): string;
  end;

implementation

uses
  Symbols,
  Classes, SysUtils, PGMR101Lib_TLB;

////////////////////////////////////////////////////////////////////////////////
// PDirectiveRemover

constructor PDirectiveRemover.Create;
begin
  Pgmr := TPgmrExt.Create(nil);
  Pgmr.SetGrammar(GetDllDirectory + '\' + PP_GRAMMAR_FILE_NAME);
end;

destructor PDirectiveRemover.Destroy;
begin
  Pgmr.Free;
  inherited;
end;

procedure PDirectiveRemover.AssureNodeAs(Node: TGmrNode; NodeName: string);
begin
  if Pgmr.GetNodeName(Node) <> NodeName then
    raise EInvalidNode.Create(Format(ERR_UNEXPECTED_NODE, [Pgmr.GetNodeName(Node), NodeName]));
end;

procedure PDirectiveRemover.WriteCompilationUnit(Writer: PColumnedText; Node: TGmrNode);
begin
  AssureNodeAs(Node, 'compilation_unit');
  if Pgmr.GetNumChildren(Node) = 1 then
    WriteAwarenessUnitList(Writer, Pgmr.GetChild(Node, 0));
end;

procedure PDirectiveRemover.WriteAwarenessUnitList(Writer: PColumnedText; Node: TGmrNode);
var
  I: Integer;
begin
  AssureNodeAs(Node, 'awareness_unit_list');
  for I := 0 to Pgmr.GetNumChildren(Node) - 1 do
    WriteAwarenessUnit(Writer, Pgmr.GetChild(Node, I));
end;

procedure PDirectiveRemover.WriteAwarenessUnit(Writer: PColumnedText; Node: TGmrNode);
var
  Child: TGmrNode;
begin
  AssureNodeAs(Node, 'awareness_unit');
  if Pgmr.GetNumChildren(Node) > 0 then begin
    Child := Pgmr.GetChild(Node, 0);
    if Pgmr.GetNodeName(Child) = 'directive' then
      WriteDirective(Writer, Child)
    else if Pgmr.GetNodeName(Child) = 'no_directive_block' then
      WriteNoDirectiveBlock(Writer, Child);
  end;
end;

procedure PDirectiveRemover.WriteDirective(Writer: PColumnedText; Node: TGmrNode);
var
  Child: TGmrNode;
begin
  AssureNodeAs(Node, 'directive');
  if Pgmr.GetNumChildren(Node) > 0 then begin
    Child := PGmr.GetChild(Node, 0);
    if Pgmr.GetNodeName(Child) = 'conditional' then
      WriteConditional(Writer, Child);
  end;
end;

procedure PDirectiveRemover.WriteNoDirectiveBlock(Writer: PColumnedText; Node: TGmrNode);
var
  Position, Row, Col: Integer;
begin
  AssureNodeAs(Node, 'no_directive_block');
  Position := Pgmr.GetValuePos(Node);
  Row := Pgmr.GetInputLineNumber(Position);
  Col := Position - Pgmr.GetInputLinePos(Row);
  Writer.Write(Row, Col, Pgmr.GetValue(Node));
end;

procedure PDirectiveRemover.WriteConditional(Writer: PColumnedText; Node: TGmrNode);
var
  Child: TGmrNode;
begin
  AssureNodeAs(Node, 'conditional');
  if Pgmr.GetNumChildren(Node) > 0 then begin
    Child := PGmr.GetChild(Node, 0);
    if Pgmr.GetNodeName(Child) = 'if_part' then
      WriteIfPart(Writer, Child);
  end;
end;

procedure PDirectiveRemover.WriteIfPart(Writer: PColumnedText; Node: TGmrNode);
var
  N: TGmrNode;
begin
  AssureNodeAs(Node, 'if_part');
  N := Pgmr.Find('awareness_unit_list', Node);
  if not Pgmr.IsNull(N) then
    WriteAwarenessUnitList(Writer, N);
end;

function PDirectiveRemover.GetFiltedSource(SourceFileName: string): string;
var
  Writer: PColumnedText;
  SL: TStringList;
begin
  if not FileExists(SourceFileName) then
    raise EFileNotFound.Create(ERR_FILE_NOT_FOUND);

  Pgmr.RemoveAllBreakpoints;
  Pgmr.SetInputFilename(SourceFileName);
  Pgmr.Parse;
  if (Pgmr.Status = pgStatusComplete) and (Pgmr.GetNumErrors = 0) then begin
    Writer := PColumnedText.Create;
    try
      WriteCompilationUnit(Writer, Pgmr.GetChild(Pgmr.GetRoot, 0));
      Result := Writer.Text;
    finally
      Writer.Free;
    end
  end
  else begin
    SL := TStringList.Create;
    try
      SL.LoadFromFile(SourceFileName);
      Result := SL.Text;
    finally
      SL.Free;
    end;
  end;
end;

// PDirectiveRemover
////////////////////////////////////////////////////////////////////////////////

end.
