unit DirectMDADlg;

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
  ComObj, WSGenerator_TLB, WhiteStarUML_TLB;

type
  TGeneratorApplication = class(TAutoObject, IGeneratorApplication, IStarUMLAddIn)
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
var
  IsPersonalEdition: Boolean;
  IsTrialEdition: Boolean;
//  Expire: PExpiredCoder;
//  RegInfo: PRegistrationInfo;

implementation

uses
  Forms, ComServ, Dialogs, Symbols,
  PieFrm, Utilities;

procedure TGeneratorApplication.Initialize;
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

destructor TGeneratorApplication.Destroy;
begin
  StarUMLApp := nil;
  inherited;
end;

function TGeneratorApplication.InitializeAddIn: HResult;
begin
  Result := S_OK;
end;

function TGeneratorApplication.FinalizeAddIn: HResult;
begin
  Result := S_OK;
end;

function TGeneratorApplication.DoMenuAction(ActionID: Integer): HResult;
var
  PieForm: TPieForm;
//  RegInfo: PRegistrationInfo;
//  RegPlasticInfo: PPlasticRegistrationInfo;
begin
(*
  try
    RegInfo := ReadRegistrationInfo;
//    RegPlasticInfo := ReadPlasticRegisterationInfo;

//    IsPersonalEdition := (RegInfo.ProductID = PID_AGORA_GENERATOR_PERSONAL);
    IsTrialEdition := (RegInfo.ProductID = PID_AGORA_GENERATOR_TRIAL);
//    ISPersonalEdition := (RegPlasticInfo.ProductID = PID_AGORA_PLASTIC_2005_PERSONAL);
    if not RegInfo.IsValidRegistration then begin
      ShowMessage(C_ERR_INVALID_REGISTRATION);
      Result := S_OK;
      Exit;
    end;
{
    if IsPersonalEdition then begin
      ShowMessage(C_ERR_PERSONAL_EDITION);
      Result := S_OK;
      Exit;
    end;

}   if IsTrialEdition then begin
    try
      Expire := PExpiredCoder.create;
      if (Expire.GetExpirationCode() <= 0) or (Expire.GetExpirationCode > 31) then begin
        ShowMessage(C_ERR_TRIAL_EDITION);
        Result := S_OK;
        Exit;
      end;
    finally
      Expire.Free;
    end;
    end;

  except
    on E: EInvalidRegistrationData do begin
      ShowMessage(C_ERR_INVALID_REGISTRATION);
      Result := S_OK;
      Exit;
    end;
  end;
*)
  Result := S_OK;
  if ActionID = 1 then begin
    PieForm := TPieForm.Create(Application);
    try
      PieForm.StarUMLApp := StarUMLApp;
      PieForm.ShowModal;
    finally
      PieForm.Free;
    end;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TGeneratorApplication, Class_GeneratorApplication,
    ciMultiInstance, tmApartment);
end.
