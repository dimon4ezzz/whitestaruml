unit ConstItemEdtFrm;

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
  UMLModels,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  // TConstraintItemEditForm
  TConstraintItemEditForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    BodyMemo: TMemo;
    NameEdit: TEdit;
    NameLabel: TLabel;
    BodyLabel: TLabel;
    Bevel1: TBevel;
    procedure NameEditChange(Sender: TObject);
    procedure BodyMemoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FConstraintName, FConstraintBody: string;
    OldConstraintName, OldConstraintBody: string;
    procedure SetConstraintName(Value: string);
    procedure SetConstraintBody(Value: string);
  public
    function Execute: Boolean;
    property ConstraintName: string read FConstraintName write SetConstraintName;
    property ConstraintBody: string read FConstraintBody write SetConstraintBody;
  end;

var
  ConstraintItemEditForm: TConstraintItemEditForm;

implementation

uses
  NLS;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TConstItemEdtForm

procedure TConstraintItemEditForm.NameEditChange(Sender: TObject);
begin
  FConstraintName := NameEdit.Text;
  OkButton.Enabled := ((OldConstraintName <> FConstraintName) or (OldConstraintBody <> FConstraintBody))
    and (FConstraintName <> '');
end;

procedure TConstraintItemEditForm.BodyMemoChange(Sender: TObject);
begin
  FConstraintBody := BodyMemo.Text;
  OkButton.Enabled := ((OldConstraintName <> FConstraintName) or (OldConstraintBody <> FConstraintBody))
    and (FConstraintName <> '');
end;

procedure TConstraintItemEditForm.SetConstraintName(Value: string);
begin
  OldConstraintName := Value;
  FConstraintName := Value;
end;

procedure TConstraintItemEditForm.SetConstraintBody(Value: string);
begin
  OldConstraintBody := Value;
  FConstraintBody := Value;
end;

function TConstraintItemEditForm.Execute: Boolean;
begin
  NameEdit.Text := FConstraintName;
  BodyMemo.Lines.Text := FConstraintBody;
  Result := (ShowModal = mrOk);
end;

// TConstItemEdtForm
////////////////////////////////////////////////////////////////////////////////

procedure TConstraintItemEditForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\CONSTITM.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

end.
