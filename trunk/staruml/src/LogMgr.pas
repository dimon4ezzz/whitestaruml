unit LogMgr;

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
  Classes;

type
  // Event Types
  PLogEvent = procedure(Sender: TObject; Log: string) of object;

  // PLogManager
  PLogManager = class
  private
    FLogs: TStringList;
    FOnLog: PLogEvent;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ClearLogs;
    procedure Log(Msg: string);
    procedure SaveToFile(FileName: string);
    procedure LoadFromFile(FileName: string);
    property Logs: TStringList read FLogs;
    property OnLog: PLogEvent read FOnLog write FOnLog;
  end;

var
  LogManager: PLogManager;

implementation

uses
  SysUtils;

////////////////////////////////////////////////////////////////////////////////
// PLogManager

constructor PLogManager.Create;
begin
  inherited;
  FLogs := TStringList.Create;
  FOnLog := nil;
end;

destructor PLogManager.Destroy;
begin
  FLogs.Free;
  inherited;
end;

procedure PLogManager.ClearLogs;
begin
  FLogs.Clear;
end;

procedure PLogManager.Log(Msg: string);
var
  S: string;
begin
  S := '[' + TimeToStr(Time) + ']  ' + Msg;
  if Assigned(FOnLog) then FOnLog(Self, S);
end;

procedure PLogManager.SaveToFile(FileName: string);
begin
  FLogs.SaveToFile(FileName);
end;

procedure PLogManager.LoadFromFile(FileName: string);
begin
  FLogs.LoadFromFile(FileName);
end;

// PLogManager
////////////////////////////////////////////////////////////////////////////////

initialization
  LogManager := PLogManager.Create;
finalization
  LogManager.Free;
end.
