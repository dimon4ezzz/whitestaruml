unit HashTable;

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
  Classes, ComObj, ActiveX, WSGenerator_TLB, StdVcl, SysUtils, Generics.Collections;

const
  ERR_CANNOT_FIND_KEY = 'Key Value doesn''t exist.(%s)';

type
  // exceptions
  EHashTableError = class(Exception);

  // THashTable
  THashTable = class(TAutoObject, IHashTable)
  private type
    TStringDictionary = TDictionary<WideString,WideString>;
  private
    Dict: TStringDictionary;
  protected
    procedure Clear; safecall;
    function Get(const Key: WideString): WideString; safecall;
    procedure Put(const Key, Value: WideString); safecall;
  public
    procedure Initialize; override;
    destructor Destroy; override;
  end;

implementation

uses
  System.Win.ComServ;

////////////////////////////////////////////////////////////////////////////////
// THashTable

// (consider)
// Cant Recognize in case of multi-lined text ?

procedure THashTable.Initialize;
begin
  inherited;
  Dict := TStringDictionary.Create;
end;

destructor THashTable.Destroy;
begin
  Dict.Free;
  inherited;
end;

procedure THashTable.Clear;
begin
  Dict.Free;
end;

function THashTable.Get(const Key: WideString): WideString;
var
  Value: WideString;
begin
  if Dict.TryGetValue(Key,Value) then
    Result := Value
  else
    raise EHashTableError.Create(Format(ERR_CANNOT_FIND_KEY, [Key]))
end;

procedure THashTable.Put(const Key, Value: WideString);
begin
  Dict.AddOrSetValue(Key, Value)
end;

// THashTable
////////////////////////////////////////////////////////////////////////////////

initialization
  TAutoObjectFactory.Create(ComServer, THashTable, Class_HashTable,
    ciMultiInstance, tmApartment);
end.
