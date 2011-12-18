unit CSharpAddInObj;

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
  StarUML_TLB, NLS_CSharpAddIn;

type
  TCSharpAddInObj = class(TComObject,IStarUMLAddIn)
  private
    StarUMLApp: IStarUMLApplication;
    procedure ReverseCSharpCode;
    procedure ForwareCSharpCode;
    function CheckReverseProfile: Boolean;
    function CheckProfeilIncluded: Boolean;
    function CheckProfileAvailable: Boolean;
    function NoProfileChecked: Boolean;
  protected
    function InitializeAddIn: HResult; stdcall;
    function FinalizeAddIn: HResult; stdcall;
    function DoMenuAction(ActionID: Integer): HResult; stdcall;
  public
    procedure Initialize; override;
    destructor Destroy; override;
  end;

const
  Class_CSharpAddInObj: TGUID = '{18936F35-F68E-4D92-AC51-CE481938A23A}';

implementation

uses
  ComServ, Dialogs, CSharpRevWizardFrm, CodeGenFrm, Forms, Symbols;

function TCSharpAddInObj.InitializeAddIn:HResult;
begin
  Result := S_OK;
end;

function TCSharpAddInObj.FinalizeAddIn:HResult;
begin
  Result := S_OK;
end;

function TCSharpAddInObj.DoMenuAction(ActionID: Integer):HResult;
begin
   Result := S_OK;
  if ActionID = 1 then { reserved for CSharp syntax checking }
  else if ActionID = 2 then begin
    ForwareCSharpCode;
  end
  else if ActionID = 3 then begin
    ReverseCSharpCode;
  end;
end;


procedure TCSharpAddInObj.Initialize;
begin
  inherited;
  StarUMLApp := CoStarUMLApplication.Create;
  Application.Handle := StarUMLApp.Handle;
end;

destructor TCSharpAddInObj.Destroy;
begin
  StarUMLApp := nil;
  inherited;
end;

procedure TCSharpAddInObj.ReverseCSharpCode;
var
  RevWizardForm: TRevEngineForm;
begin
    if CheckReverseProfile then
    begin
      RevWizardForm := TRevEngineForm.Create(Application);
      try
        RevWizardForm.StarUMLApp := StarUMLApp;
        RevWizardForm.ShowModal;
      finally
        RevWizardForm.StarUMLApp := nil;
        RevWizardForm.Free;
      end;
    end
    else
      Application.MessageBox(PChar(MSG_DLG_REVERSE_CANCEL), PChar(Application.Title),
        MB_OK + MB_ICONINFORMATION);
end;

procedure TCSharpAddInObj.ForwareCSharpCode;
var
  CodeGenForm:TCodeGenForm;
begin

  if CheckProfeilIncluded or NoProfileChecked then
  begin
    CodeGenForm := TCodeGenForm.Create(Application);
    try
      CodeGenForm.StarUMLApp := StarUMLApp;
      CodeGenForm.ShowModal;
    finally
      CodeGenForm.StarUMLApp := nil;
      CodeGenForm.Free;
    end;
  end
  else
    MessageDlg(ERR_CODE_GEN_PROFILE_NOT_LOADED, mtError, [mbOK], 0);
end;

function TCSharpAddInObj.NoProfileChecked: Boolean;
begin
  Result := False;
  try
    if StarUMLApp.GetOptionValue(OPTION_SCHEMA, OPTION_CREATE_WITH_NO_PROFILE)
    then Result := True;
  except
  end;
end;

function TCSharpAddInObj.CheckReverseProfile: Boolean;
begin   
  if CheckProfeilIncluded then
    Result := True
  else if CheckProfileAvailable then
    if Application.MessageBox(PChar(QUERY_REVERSE_PROFILE_LOAD), PChar(Application.Title),MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      try
        StarUMLApp.ExtensionManager.IncludeProfile(CSHARP_PROFILE_NAME);
      except
        Result := False;
      end;
      Result := True;
    end
    else
      Result := False
  else
  begin
    Application.MessageBox(PChar(ERR_PROFILE_NOT_DEFINED), PChar(Application.Title), MB_OK + MB_ICONWARNING);
    Result := False;
  end;
end;

function TCSharpAddInObj.CheckProfileAvailable: Boolean;
begin
  Result := False;
  try
    if StarUMLApp.ExtensionManager.FindAvailableProfile(CSHARP_PROFILE_NAME) = nil then
      Result := False
    else
      Result := True;
  except
  end;
end;

function TCSharpAddInObj.CheckProfeilIncluded: Boolean;
begin
  Result := False;
  try
    if StarUMLApp.ExtensionManager.FindIncludedProfile(CSHARP_PROFILE_NAME) = nil then
      Result := False
    else
      Result := True;
  except
  end;
end;

//############################################################################//
initialization
  TComObjectFactory.Create(ComServer, TCSharpAddInObj, Class_CSharpAddInObj,
    'CSharpAddInObj', '', ciMultiInstance, tmApartment);
end.
