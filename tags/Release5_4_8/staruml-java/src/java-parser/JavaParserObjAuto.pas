unit JavaParserObjAuto;

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
  RevCore, JavaParserObj,
  ComObj, ActiveX, AxCtrls, Classes, WSJavaParser_TLB, StdVcl;

type
  PJavaParserObjAuto = class(TAutoObject, IConnectionPointContainer, IJavaParserObj)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: IJavaParserObjEvents;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
    Parser: PJavaParserObj;
  public
    procedure Initialize; override;
    destructor Destroy; override;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure Clear; safecall;
    function Parse(const FileName: WideString): WordBool; safecall;
    function GetPackageAt(Index: Integer): IJavaPackage; safecall;
    function GetPackageCount: Integer; safecall;
    function GetCompilationUnitAt(Index: Integer): IJavaCompilationUnit; safecall;
    function GetCompilationUnitCount: Integer; safecall;
    function Get_ErrorLine: Integer; safecall;
    function Get_ErrorLinePos: Integer; safecall;
    function Get_ErrorNumChar: Integer; safecall;
    function Get_ErrorDescription: WideString; safecall;
  end;

implementation

uses
  JavaElements,
  ComServ;

procedure PJavaParserObjAuto.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IJavaParserObjEvents;
end;

procedure PJavaParserObjAuto.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;

  Parser := PJavaParserObj.Create;
end;

destructor PJavaParserObjAuto.Destroy;
begin
  Parser.Free;
  inherited;
end;

procedure PJavaParserObjAuto.Clear;
begin
  Parser.Clear;
end;

function PJavaParserObjAuto.Parse(const FileName: WideString): WordBool;
begin
  Result := Parser.Parse(FileName);
end;

function PJavaParserObjAuto.GetPackageAt(Index: Integer): IJavaPackage;
begin
  Result := Parser.Packages[Index].AutomationObject as IJavaPackage;
end;

function PJavaParserObjAuto.GetPackageCount: Integer;
begin
  Result := Parser.PackageCount;
end;

function PJavaParserObjAuto.GetCompilationUnitAt(Index: Integer): IJavaCompilationUnit;
begin
  Result := Parser.CompilationUnits[Index].AutomationObject as IJavaCompilationUnit;
end;

function PJavaParserObjAuto.GetCompilationUnitCount: Integer;
begin
  Result := Parser.CompilationUnitCount;
end;

function PJavaParserObjAuto.Get_ErrorLine: Integer;
begin
  Result := Parser.ErrorLine;
end;

function PJavaParserObjAuto.Get_ErrorLinePos: Integer;
begin
  Result := Parser.ErrorLinePos;
end;

function PJavaParserObjAuto.Get_ErrorNumChar: Integer;
begin
  Result := Parser.ErrorNumChars;
end;

function PJavaParserObjAuto.Get_ErrorDescription: WideString;
begin
  Result := Parser.ErrorDescription;
end;

initialization
  TAutoObjectFactory.Create(ComServer, PJavaParserObjAuto, CLASS_JavaParserObj,
    ciMultiInstance, tmApartment);
end.
