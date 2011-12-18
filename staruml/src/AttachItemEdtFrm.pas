unit AttachItemEdtFrm;

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
  Dialogs, StdCtrls, Buttons;

type
  TAttachmentItemEditForm = class(TForm)
    Caption: TLabel;
    LocationEdit: TEdit;
    OpenDialogButton: TSpeedButton;
    CancelButton: TButton;
    OKButton: TButton;
    OpenDialog: TOpenDialog;
    ElementSelectButton: TSpeedButton;
    procedure OpenDialogButtonClick(Sender: TObject);
    procedure LocationEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ElementSelectButtonClick(Sender: TObject);
  private
    OldValue: string;
    FLocation: string;
    procedure SetLocation(Value: string);
  public
    function Execute: Boolean;
    property Location: string read FLocation write SetLocation;
  end;

var
  AttachmentItemEditForm: TAttachmentItemEditForm;

implementation

uses
  NLS, ModelExplorerFrame, ElemSelFrm, Core;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TAttachmentItemEditForm

procedure TAttachmentItemEditForm.SetLocation(Value: string);
begin
  OldValue := Value;
  FLocation := Value;
end;

procedure TAttachmentItemEditForm.OpenDialogButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then begin
    FLocation := OpenDialog.FileName;
    LocationEdit.Text := FLocation;
  end;
  OkButton.Enabled := (OldValue <> FLocation) and (FLocation <> '');
end;

procedure TAttachmentItemEditForm.LocationEditChange(Sender: TObject);
begin
  FLocation := LocationEdit.Text;
  OkButton.Enabled := (OldValue <> FLocation) and (FLocation <> '');
end;

function TAttachmentItemEditForm.Execute: Boolean;
begin
  LocationEdit.Text := FLocation;
  Result := (ShowModal = mrOk);
end;

// TAttachmentItemEditForm
////////////////////////////////////////////////////////////////////////////////

procedure TAttachmentItemEditForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\ATTCHITM.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

procedure TAttachmentItemEditForm.ElementSelectButtonClick(
  Sender: TObject);
begin
  ElementSelectorForm.Filter(FULL_FILTERINGSET);
  ElementSelectorForm.ClearSelectableModels;
  ElementSelectorForm.AddSelectableModels(FULL_FILTERINGSET);
  if ElementSelectorForm.Execute('Select Element') then
  begin
    FLocation := 'element://' + ExtractTailPath(ElementSelectorForm.SelectedModel.Pathname);
    LocationEdit.Text := FLocation;
  end;
  OkButton.Enabled := (OldValue <> FLocation) and (FLocation <> '');
end;

end.
