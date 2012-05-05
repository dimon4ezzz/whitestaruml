unit JavaAddInObj;

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
  Windows, ActiveX, Classes, ComObj, WhiteStarUML_TLB, WSJavaAddIn15_TLB, StdVcl;

type
  TJavaAddInObj = class(TTypedComObject, IStarUMLAddIn)
  private
    StarUMLApp: IStarUMLApplication;
    function ProfileLoaded: Boolean;
    function NoProfileChecked: Boolean;
    function CheckJavaProfileImported: Boolean;
    procedure CreateJavaCode;
    procedure ReverseJavaCode;
  protected
    { IStarUMLAddIn }
    function InitializeAddIn: HResult; stdcall;
    function FinalizeAddIn: HResult; stdcall;
    function DoMenuAction(ActionID: Integer): HResult; stdcall;
  public
    procedure Initialize; override;
    destructor Destroy; override;
  end;

  function GetStarUMLApplication: IStarUMLApplication;


//const
//  Class_JavaAddInObj: TGUID = '{4FA40CFC-5C5D-4D58-AEF6-9042CBC09301}';

implementation

uses
  ComServ, Dialogs, Forms, SysUtils,
  CodeGenWizardFrm, RevEngWizardFrm, Symbols, NLS_JavaAddIn;


function GetStarUMLApplication: IStarUMLApplication;
var
  NameInput: array [1 .. MAX_PATH] of WideChar;
  FileName: string;
  FileNameLength: Cardinal;
begin
 try
    FileNameLength := GetModuleFileName(0, @NameInput, MAX_PATH);
    if FileNameLength > 0 then
      FileName := ExtractFileName(WideCharToString(@NameInput));

    if FileName = 'WhiteStarUML.exe' then
      Result := CoWhiteStarUMLApplication.Create
    else
      Result := CreateOleObject('StarUML.StarUMLApplication')
        as IStarUMLApplication;
  except
    assert(False,'Could not instantiate Application Object')

  end;

end;

////////////////////////////////////////////////////////////////////////////////
// TJavaAddInObj

procedure TJavaAddInObj.Initialize;
begin
  inherited;
  StarUMLApp := GetStarUMLApplication;
  Application.Handle := StarUMLApp.Handle;
end;

destructor TJavaAddInObj.Destroy;
begin
  StarUMLApp := nil;
  inherited;
end;

function TJavaAddInObj.ProfileLoaded: Boolean;
var
  ExtMgr: IExtensionManager;
begin
  Result := False;
  try
    ExtMgr := StarUMLApp.ExtensionManager;
    if ExtMgr.FindIncludedProfile(PROFILE_JAVA15) <> nil
    then Result := True;
  except
  end;
end;

function TJavaAddInObj.NoProfileChecked: Boolean;
begin
  Result := False;
  try
    if StarUMLApp.GetOptionValue(OPTION_SCHEMA, OPTION_KEY_NO_PROFILE)
    then Result := True;
  except
  end;
end;

function TJavaAddInObj.CheckJavaProfileImported: Boolean;
var
  ExtMgr: IExtensionManager;
  P: IProfile;
begin
  Result := False;
  try
    if not ProfileLoaded then begin
      ExtMgr := StarUMLApp.ExtensionManager;
      P := ExtMgr.FindAvailableProfile(PROFIlE_JAVA15);
      if P <> nil then begin
        if Application.MessageBox(PChar(QUERY_REVERSE_PROFILE_LOAD), PChar(Application.Title),
          MB_YESNO + MB_ICONQUESTION) = IDYES then begin
          ExtMgr.IncludeProfile(PROFILE_JAVA15);
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
  except
  end;
end;

procedure TJavaAddInObj.CreateJavaCode;
var
  Msg: string;
  Wizard: TCodeGenWizardForm;
begin
  if (not ProfileLoaded) and (not NoProfileChecked) then begin
    Msg := ERR_CODE_GEN_PROFILE_NOT_LOADED;
    MessageDlg(Msg, mtError, [mbOK], 0);
    Exit;
  end;

  Wizard := TCodeGenWizardForm.Create(Application);
  try
    Wizard.StarUMLApp := StarUMLApp;
    Wizard.ShowModal;
  finally
    Wizard.Free;
  end;
end;

procedure TJavaAddInObj.ReverseJavaCode;
var
  Wizard: TRevEngWizardForm;
begin
  if CheckJavaProfileImported then begin
    Wizard := TRevEngWizardForm.Create(Application);
    try
      Wizard.StarUMLApp := StarUMLApp;
      Wizard.ShowModal;
    finally
      Wizard.Free;
    end;
  end
  else
    Application.MessageBox(PChar(MSG_DLG_REVERSE_CANCEL), PChar(Application.Title),
      MB_OK + MB_ICONINFORMATION);
end;

function TJavaAddInObj.InitializeAddIn: HResult;
begin
  Result := S_OK;
end;

function TJavaAddInObj.FinalizeAddIn: HResult;
begin
  Result := S_OK;
end;

function TJavaAddInObj.DoMenuAction(ActionID: Integer): HResult;
begin
  Result := S_OK;
  if ActionID = 1 then { reserved for Java syntax checking }
  else if ActionID = 2 then CreateJavaCode
  else if ActionID = 3 then ReverseJavaCode;
end;

// TJavaAddInObj
////////////////////////////////////////////////////////////////////////////////

initialization
 // TComObjectFactory.Create(ComServer, TJavaAddInObj, Class_JavaAddInObj,
 //   'JavaAddInObj', '', ciMultiInstance, tmApartment);
   TTypedComObjectFactory.Create(ComServer, TJavaAddInObj, CLASS_JavaAddInObj,
    ciMultiInstance, tmApartment);
end.
