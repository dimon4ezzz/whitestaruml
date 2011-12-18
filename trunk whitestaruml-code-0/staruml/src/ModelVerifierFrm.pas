unit ModelVerifierFrm;

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
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TModelVerifierForm = class(TForm)
    VerifyButton: TButton;
    CloseButton: TButton;
    HelpButton: TButton;
    VerificationProgressLabel: TLabel;
    VerificationProgressBar: TProgressBar;
    Bevel1: TBevel;
    VerifyingRuleLabel: TLabel;
    VerifyingElementLabel: TLabel;
    VerificationFailedLabel: TLabel;
    ClientPanel: TPanel;
    VerificationFailedCountLabel: TStaticText;
    VerifyingRuleNameLabel: TStaticText;
    VerifyingElementNameLabel: TStaticText;
    TopPicturePanel: TPanel;
    TitleLabel: TLabel;
    DescLabel: TLabel;
    procedure CloseButtonClick(Sender: TObject);
    procedure VerifyButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Verify;
  end;

var
  ModelVerifierForm: TModelVerifierForm;

implementation

uses
  UMLVerify, HtmlHlp, NLS;

{$R *.dfm}

procedure TModelVerifierForm.Verify;
begin
  UMLVerifier.VerifyAll;
end;

procedure TModelVerifierForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TModelVerifierForm.VerifyButtonClick(Sender: TObject);
begin
  Verify;
end;

procedure TModelVerifierForm.FormShow(Sender: TObject);
begin
  VerifyingRuleNameLabel.Caption := '';
  VerifyingElementNameLabel.Caption := '';
  VerificationFailedCountLabel.Caption := '0 item(s)';
  VerificationProgressBar.Position := 0;
  VerifyButton.SetFocus;
end;

procedure TModelVerifierForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

procedure TModelVerifierForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\MDLVERIF.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

end.
