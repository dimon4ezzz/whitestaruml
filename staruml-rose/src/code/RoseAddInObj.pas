unit RoseAddInObj;

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
  Windows, ActiveX, Classes, ComObj,
  WhiteStarUML_TLB, StdVcl;

type
  // TRoseAddInObj
  TRoseAddInObj = class(TTypedComObject, IStarUMLAddIn)
  private
    StarUMLApp: IStarUMLApplication;
  protected
    function InitializeAddIn: HResult; stdcall;
    function FinalizeAddIn: HResult; stdcall;
    function DoMenuAction(ActionID: Integer): HResult; stdcall;
  public
    procedure Initialize; override;
    destructor Destroy; override;
  end;

//const
//  Class_RoseAddInObj: TGUID = '{FB02F93C-D561-4A9E-A991-3013F2EB5FAD}';

implementation

uses
  SysUtils, ComServ, Forms, RoseImportFrm, Dialogs, WSRoseAddIn_TLB;

////////////////////////////////////////////////////////////////////////////////
// TRoseAddInObj

procedure TRoseAddInObj.Initialize;
var
  NameInput: array [1 .. MAX_PATH] of WideChar;
  FileName: string;
  FileNameLength: Cardinal;
begin
  inherited;
  try
    FileNameLength := GetModuleFileName(0, @NameInput, MAX_PATH);
    if FileNameLength > 0 then
      FileName := ExtractFileName(WideCharToString(@NameInput));

    if FileName = 'WhiteStarUML.exe' then
      StarUMLApp := CoWhiteStarUMLApplication.Create
    else
      StarUMLApp := CreateOleObject('StarUML.StarUMLApplication')
        as IStarUMLApplication;

    Application.Handle := StarUMLApp.Handle;

  except
    assert(False,'Could not instantiate Application Object')
  end;
end;

destructor TRoseAddInObj.Destroy;
begin
  StarUMLApp := nil;
  inherited;
end;

function TRoseAddInObj.InitializeAddIn: HResult;
begin
  Result := S_OK;
end;

function TRoseAddInObj.FinalizeAddIn: HResult;
begin
  Result := S_OK;
end;

function TRoseAddInObj.DoMenuAction(ActionID: Integer): HResult;
begin
  Result := S_OK;
  if ActionID <> 1 then Exit;

  try
    RoseImportForm := TRoseImportForm.Create(Application);
    RoseImportForm.StarUMLApp := StarUMLApp;
    RoseImportForm.ShowModal;
  finally
    RoseImportForm.Free;
  end;
end;

// TRoseAddInObj
////////////////////////////////////////////////////////////////////////////////

initialization
 // TComObjectFactory.Create(ComServer, TRoseAddInObj, Class_RoseAddInObj,
 //   'RoseAddInObj', '', ciMultiInstance, tmApartment);
  TTypedComObjectFactory.Create(ComServer, TRoseAddInObj, CLASS_RoseAddInObj,
    ciMultiInstance, tmApartment);
end.
