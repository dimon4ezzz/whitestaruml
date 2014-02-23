unit PatternAddInObj; 

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
  ComObj, WhiteStarUML_TLB;

type
  // PPatternAddIn
  PPatternAddIn = class(TTypedComObject, IStarUMLAddIn)
  private
    StarUMLApp: IStarUMLApplication;
    function CheckClassTypeDiagramActivated: Boolean;
  protected
    function InitializeAddIn: HResult; stdcall;
    function FinalizeAddIn: HResult; stdcall;
    function DoMenuAction(ActionID: Integer): HResult; stdcall;
  public
    procedure Initialize; override;
    destructor Destroy; override;
  end;

implementation

uses
  Windows, ComServ, Dialogs, Forms, SysUtils,
  NLS_PatternAddIn, PatternAddInFrm, PatternAddInFrmWithJvclInspector, WSPatternAddIn_TLB;

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

////////////////////////////////////////////////////////////////////////////////
// PPatternAddIn

procedure PPatternAddIn.Initialize;
begin
  inherited;
  try
    if GetProgramName = 'WhiteStarUML.exe' then
      StarUMLApp := CoWhiteStarUMLApplication.Create
    else
      StarUMLApp := CreateOleObject('StarUML.StarUMLApplication')
        as IStarUMLApplication;

    Application.Handle := StarUMLApp.Handle;

  except
    assert(False,'Could not instantiate Application Object')
  end;

  PatternAddInForm := TPatternAddInFormWithJvclInspector.Create(Application);
  PatternAddInForm.StarUMLApp := StarUMLApp;
end;

destructor PPatternAddIn.Destroy;
begin
  PatternAddInForm.StarUMLApp := nil;
  StarUMLApp := nil;
  if PatternAddInForm <> nil then PatternAddInForm.Free;
  inherited;
end;

function PPatternAddIn.CheckClassTypeDiagramActivated: Boolean;
var
  Dgm: IDiagram;
begin
  Result := False;
  Dgm := StarUMLApp.SelectionManager.ActiveDiagram;
  if Dgm <> nil then begin
    if Dgm.IsKindOf('UMLClassDiagram') or
       Dgm.IsKindOf('UMLUseCaseDiagram') or
       Dgm.IsKindOf('UMLComponentDiagram') or
       Dgm.IsKindOf('UMLDeploymentDiagram')
    then Result := True;  
  end;
end;

function PPatternAddIn.InitializeAddIn: HResult;
begin
  Result := S_OK;
end;

function PPatternAddIn.FinalizeAddIn: HResult;
begin
  Result := S_OK;
end;

function PPatternAddIn.DoMenuAction(ActionID: Integer): HResult;
begin
  Result := S_OK;
  if ActionID = 1 then begin
    try
      // Start message
      if CheckClassTypeDiagramActivated then begin
        PatternAddInForm.ShowModal
        // End message
      end else begin
        Application.MessageBox(PChar(ERR_NO_ACTIVE_DGM), PChar(Application.Title),
          MB_OK + MB_ICONERROR);
      end;
    except on E: Exception do
      // Exception message
    end;
  end;
end;

// PPatternAddIn
////////////////////////////////////////////////////////////////////////////////

initialization
  TTypedComObjectFactory.Create(ComServer, PPatternAddIn, CLASS_PatternAddInObj,
    ciMultiInstance, tmApartment);

end.
