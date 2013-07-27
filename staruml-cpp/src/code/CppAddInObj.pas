unit CppAddInObj;

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
  TCppAddInObj = class(TTypedComObject, IStarUMLAddIn)
  //TCppAddInObj = class(TComObject, IStarUMLAddIn)
  private
    StarUMLApp: IStarUMLApplication;
    function CheckCppProfileImported: Boolean;
    function AskCppProfileImported: Boolean;
    function ProfileLoaded: Boolean;
    function NoProfileChecked: Boolean;
  protected
    function InitializeAddIn: HResult; stdcall;
    function FinalizeAddIn: HResult; stdcall;
    function DoMenuAction(ActionID: Integer): HResult; stdcall;
  public
    procedure Initialize; override;
    destructor Destroy; override;
  end;

//const
//  Class_CppAddInObj: TGUID = '{34480074-9829-4543-B43D-FF0421F2C8DF}';

implementation

uses
  Windows, ComServ, Forms, Dialogs, Variants,
  RevEngineFrm, CodeGenFrm, Symbols, NLS_CppAddIn, Utility, WSCppAddIn_TLB;

procedure TCppAddInObj.Initialize;
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
end;

destructor TCppAddInObj.Destroy;
begin
  StarUMLApp := nil;
  inherited;
end;

function TCppAddInObj.CheckCppProfileImported: Boolean;
var
  Msg: string;
begin
  Result := True;
  if (not ProfileLoaded) and (not NoProfileChecked) then begin
    Result := False;
    Msg := ERR_CODE_GEN_PROFILE_NOT_LOADED;
    MessageDlg(Msg, mtError, [mbOK], 0);
  end;
end;

function TCppAddInObj.AskCppProfileImported: Boolean;
var
  ExtMgr: IExtensionManager;
  P: IProfile;
begin
  if not ProfileLoaded then begin
    ExtMgr := StarUMLApp.ExtensionManager;
    P := ExtMgr.FindAvailableProfile(PROFILE_CPP);
    if P <> nil then begin
      if Application.MessageBox(PChar(QUERY_REVERSE_PROFILE_LOAD), PChar(Application.Title),
        MB_YESNO + MB_ICONQUESTION) = IDYES then begin
        ExtMgr.IncludeProfile(PROFILE_CPP);
        Result := True;
      end
      else
        Result := False;
    end
    else begin
      Application.MessageBox(PChar(ERR_PROFILE_NOT_DEFINED), PChar(Application.Title),
        MB_OK + MB_ICONWARNING);
      Result := False;
    end;
  end
  else
    Result := True;
end;

function TCppAddInObj.ProfileLoaded: Boolean;
begin
  Result := (StarUMLApp.ExtensionManager.FindIncludedProfile(PROFILE_CPP) <> nil);
end;

function TCppAddInObj.NoProfileChecked: Boolean;
var
  B: Boolean;
begin
  Result := False;
  B := StarUMLApp.GetOptionValue(OPTION_SCHEMA_CPP, OPT_CREATE_WITH_NO_PROFILE);
  if not VarIsNull(B) then
    Result := B;
end;

function TCppAddInObj.InitializeAddIn: HResult;
begin
  Result := S_OK;
end;

function TCppAddInObj.FinalizeAddIn: HResult;
begin
  Result := S_OK;
end;

function TCppAddInObj.DoMenuAction(ActionID: Integer): HResult;
var
  RevEngForm: TRevEngineForm;
  CodeGenForm: TCodeGenForm;
begin
  Result := S_OK;
  if ActionID = 1 then begin

    { reserved for C++ syntax checking }

  end

  else if ActionID = 2 then begin
    if CheckCppProfileImported then begin
      CodeGenForm := TCodeGenForm.Create(Application);
      try
        CodeGenForm.StarUMLApp := StarUMLApp;
        CodeGenForm.ShowModal;
      finally
        CodeGenForm.Free;
      end;
    end;  
  end

  else if ActionID = 3 then begin
  if AskCppProfileImported then begin
    RevEngForm := TRevEngineForm.Create(Application);
    try
      RevEngForm.StarUMLApp := StarUMLApp;
      RevEngForm.ShowModal;
    finally
      RevEngForm.Free;
    end;
  end
  else
    Application.MessageBox(PChar(MSG_DLG_REVERSE_CANCEL), PChar(Application.Title),
      MB_OK + MB_ICONINFORMATION);
  end;
end;


initialization
  TTypedComObjectFactory.Create(ComServer, TCppAddInObj, CLASS_CppAddInObj,
    ciMultiInstance, tmApartment);

end.
