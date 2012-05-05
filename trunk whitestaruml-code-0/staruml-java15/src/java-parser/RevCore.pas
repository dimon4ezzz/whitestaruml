unit RevCore;

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
  Classes, ComObj, ActiveX, IniFiles, SysUtils, WSJavaParser15_TLB;

type
  PAutoObject = class;

  PObject = class
  private
    FAutomationObject: PAutoObject;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property AutomationObject: PAutoObject read FAutomationObject;
  end;

  PAutoObject = class(TAutoIntfObject)
  protected
    FTargetObject: PObject;
  public
    property TargetObject: PObject read FTargetObject;
  end;

  PClass = class of PObject;
  PAutoClass = class of PAutoObject;

  EUnregistedClass = class(Exception);

  // PClassRegistryEntry
  PClassRegistryEntry = class
  private
    FClassRef: PClass;
    FAutoClassRef: PAutoClass;
    FDispatchID: TGUID;
  public
    constructor Create(AClass: PClass; AAutoClass: PAutoClass; ADispID: TGUID);
    property ClassRef: PClass read FClassRef;
    property AutoClassRef: PAutoClass read FAutoClassRef;
    property DispatchID: TGUID read FDispatchID;
  end;

  // PClassRegistry
  PClassRegistry = class
  private
    FEntryList: THashedStringList;
    function GetEntry(Index: Integer): PClassRegistryEntry;
    function GetEntryCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RegisterClass(AClass: PClass; AAutoClass: PAutoClass; ADispID: TGUID);
    function FindEntry(AClass: PClass): PClassRegistryEntry; overload;
    function FindEntry(AClassName: string): PClassRegistryEntry; overload;
    property Entries[Index: Integer]: PClassRegistryEntry read GetEntry;
    property EntryCount: Integer read GetEntryCount;
  end;

var
  ClassRegistry: PClassRegistry;

implementation

uses
  ComServ;

////////////////////////////////////////////////////////////////////////////////
//  PObject

constructor PObject.Create;
var
  AEntry: PClassRegistryEntry;
begin
  inherited;
  AEntry := ClassRegistry.FindEntry(ClassName);
  if AEntry = nil then
    raise EUnregistedClass.Create('create unregisted class')
  else begin
    FAutomationObject := AEntry.FAutoClassRef.Create(ComServer.TypeLib, AEntry.DispatchID);
    FAutomationObject.FTargetObject := Self;
    FAutomationObject._AddRef;
  end;
end;

destructor PObject.Destroy;
begin
  if FAutomationObject <> nil then
    FAutomationObject._Release;
  FAutomationObject := nil;
  inherited;
end;

//  PObject
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PClassRegistryEntry

constructor PClassRegistryEntry.Create(AClass: PClass; AAutoClass: PAutoClass; ADispID: TGUID);
begin
  FClassRef := AClass;
  FAutoClassRef := AAutoClass;
  FDispatchID := ADispID;
end;

// PClassRegistryEntry
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PClassRegistry

constructor PClassRegistry.Create;
begin
  inherited;
  FEntryList := THashedStringList.Create;
  FEntryList.CaseSensitive := True;
end;

destructor PClassRegistry.Destroy;
var
  I: Integer;
  E: PClassRegistryEntry;
begin
  for I := FEntryList.Count - 1 downto 0 do begin
    E := FEntryList.Objects[I] as PClassRegistryEntry;
    E.Free;
  end;
  inherited;
end;

function PClassRegistry.GetEntry(Index: Integer): PClassRegistryEntry;
begin
  Result := FEntryList.Objects[Index] as PClassRegistryEntry;
end;

function PClassRegistry.GetEntryCount: Integer;
begin
  Result := FEntryList.Count;
end;

procedure PClassRegistry.RegisterClass(AClass: PClass; AAutoClass: PAutoClass; ADispID: TGUID);
var
  AEntry: PClassRegistryEntry;
begin
  AEntry := FindEntry(AClass);
  if AEntry = nil then begin
    AEntry := PClassRegistryEntry.Create(AClass, AAutoClass, ADispID);
    FEntryList.AddObject(AEntry.ClassRef.ClassName, AEntry);
  end;
end;

function PClassRegistry.FindEntry(AClass: PClass): PClassRegistryEntry;
var
  Idx: Integer;
begin
  Idx := FEntryList.IndexOf(AClass.ClassName);
  if Idx < 0 then
    Result := nil
  else
    Result := FEntryList.Objects[Idx] as PClassRegistryEntry;
end;

function PClassRegistry.FindEntry(AClassName: string): PClassRegistryEntry;
var
  Idx: Integer;
begin
  Idx := FEntryList.IndexOf(AClassName);
  if Idx < 0 then
    Result := nil
  else
    Result := FEntryList.Objects[Idx] as PClassRegistryEntry;
end;

// PClassRegistry
////////////////////////////////////////////////////////////////////////////////

initialization
  ClassRegistry := PClassRegistry.Create;

finalization
  ClassRegistry.Free;
  ClassRegistry := nil;
end.
