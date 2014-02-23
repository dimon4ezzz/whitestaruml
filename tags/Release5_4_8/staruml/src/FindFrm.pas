unit FindFrm;

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
  Core,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  // TFindForm
  TFindForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    TextToFindLabel: TLabel;
    OptionGroupBox: TGroupBox;
    ElementTypeLabel: TLabel;
    ElementTypeComboBox: TComboBox;
    CaseSensitiveCheckBox: TCheckBox;
    FindComboBox: TComboBox;
    HelpButton: TButton;
    procedure HelpButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FOnFindStarted: TNotifyEvent;
    FOnFindFinished: TNotifyEvent;
    FOnModelElementFound: PModelEvent;
    FFoundedElementCount: Integer;
    procedure FindStarted;
    procedure FindFinished;
    procedure ModelElementFound(AModel: PModel);
    procedure FindModelElements(TextToFind: string; ModelElementType: string; CaseSensitive: Boolean);
  public
    function Execute: Boolean;
    property FoundedElementCount: Integer read FFoundedElementCount;
    property OnFindStarted: TNotifyEvent read FOnFindStarted write FOnFindStarted;
    property OnFindFinished: TNotifyEvent read FOnFindFinished write FOnFindFinished;
    property OnModelElementFound: PModelEvent read FOnModelElementFound write FOnModelElementFound;
  end;

var
  FindForm: TFindForm;

implementation

{$R *.dfm}

uses
  HtmlHlp, NLS;

////////////////////////////////////////////////////////////////////////////////
// TFindForm

procedure TFindForm.FindStarted;
begin
  if Assigned(FOnFindStarted) then FOnFindStarted(Self);
end;

procedure TFindForm.FindFinished;
begin
  if Assigned(FOnFindFinished) then FOnFindFinished(Self);
end;

procedure TFindForm.ModelElementFound(AModel: PModel);
begin
  if Assigned(FOnModelElementFound) then FOnModelElementFound(Self, AModel);
end;

procedure TFindForm.FindModelElements(TextToFind: string; ModelElementType: string; CaseSensitive: Boolean);
var
  MetaClass: PMetaClass;
  I: Integer;
  M: PModel;
  E: PElement;
  S, Substr: string;
begin
  MetaClass := MetaModel.FindMetaClass('UML' + ModelElementType);

  // search in some element typed instances
  if MetaClass <> nil then begin
    for E in MetaClass.Instances do begin
      if E is PModel then begin
        M := E as PModel;
        if CaseSensitive then begin
          S := M.Name;
          Substr := TextToFind;
        end
        else begin
          S := LowerCase(M.Name);
          Substr := LowerCase(TextToFind);
        end;
        if Pos(Substr, S) > 0 then begin
          ModelElementFound(M);
          Inc(FFoundedElementCount);
        end;
      end;
    end;
  end

  // search in all model's instances
  else begin
    MetaClass := MetaModel.FindMetaClass('Model');
    for I := 0 to MetaClass.InclusiveInstanceCount - 1 do begin
      if MetaClass.InclusiveInstances[I] is PModel then begin
        M := MetaClass.InclusiveInstances[I] as PModel;
        if CaseSensitive then begin
          S := M.Name;
          Substr := TextToFind;
        end
        else begin
          S := LowerCase(M.Name);
          Substr := LowerCase(TextToFind);
        end;
        if Pos(Substr, S) > 0 then begin
          ModelElementFound(M);
          Inc(FFoundedElementCount);
        end;
      end;
    end;
  end;
end;

function TFindForm.Execute: Boolean;
begin
  Result := False;
  FFoundedElementCount := 0;

  if ShowModal = mrOK then begin
    FindStarted;
    FindModelElements(FindComboBox.Text, ElementTypeComboBox.Text, CaseSensitiveCheckBox.Checked);
    FindComboBox.Items.Insert(0, FindComboBox.Text);
    FindFinished;
    Close;
    Result := True;
  end

end;


procedure TFindForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

procedure TFindForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\FINDFRM.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

// TFindForm
////////////////////////////////////////////////////////////////////////////////

end.
