unit ParamDefFrm;

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
  DirectMDAObjects,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, ComCtrls, ToolWin;

type
  // TParameterDefinitionForm
  TParameterDefinitionForm = class(TForm)
    CollectionPageControl: TPageControl;
    CollectionTabSheet: TTabSheet;
    TagColToolBar: TToolBar;
    AddButton: TToolButton;
    DeleteButton: TToolButton;
    MoveUpButton: TToolButton;
    ColImageList: TImageList;
    CloseButton: TButton;
    MoveDownButton: TToolButton;
    ParametersListView: TListView;
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ParametersListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ParametersListViewDblClick(Sender: TObject);
  private
    FGenerationUnit: PGenerationUnit;
    procedure UpdateParametersListView;
    procedure AddParameter;
    procedure RemoveSelectedParameter;
    procedure EditeSelectedParameter;
    procedure UpdateUIStates;
  public
    procedure Execute;
    property GenerationUnit: PGenerationUnit read FGenerationUnit write FGenerationUnit;
  end;

implementation

{$R *.dfm}

uses
  NewParamFrm, Symbols;

////////////////////////////////////////////////////////////////////////////////
// TParameterDefinitionForm

procedure TParameterDefinitionForm.UpdateParametersListView;
var
  L: TListItem;
  I: Integer;
begin
  ParametersListView.Clear;
  for I := 0 to FGenerationUnit.ParameterCount - 1 do begin
    L := ParametersListView.Items.Add;
    L.Caption := FGenerationUnit.Parameters[I].Name;
    L.SubItems.Add(ParameterTypeKindToString(FGenerationUnit.Parameters[I].Type_));
    L.SubItems.Add(FGenerationUnit.Parameters[I].Value);
    L.Data := FGenerationUnit.Parameters[I];
  end;
end;

procedure TParameterDefinitionForm.AddParameter;
var
  NewParamForm: TNewParameterForm;
  P: PParameter;
begin
  NewParamForm := TNewParameterForm.Create(Self);
  try
    if NewParamForm.Execute then begin
      P := PParameter.Create;
      P.Name := NewParamForm.ParameterName;
      P.Type_ := NewParamForm.ParameterType;
      P.Value := NewParamForm.ParameterDefaultValue;
      FGenerationUnit.AddParameter(P);
      UpdateParametersListView;
    end;
  finally
    NewParamForm.Free;
  end;
end;

procedure TParameterDefinitionForm.RemoveSelectedParameter;
var
  P: PParameter;
begin
  if ParametersListView.Selected <> nil then begin
    P := FGenerationUnit.FindParameter(ParametersListView.Selected.Caption);
    if P <> nil then begin
      FGenerationUnit.RemoveParameter(P);
      UpdateParametersListView;
    end;
  end;
end;

procedure TParameterDefinitionForm.EditeSelectedParameter;
var
  P: PParameter;
  EditParamForm: TNewParameterForm;
begin
  if ParametersListView.Selected <> nil then begin
    P := FGenerationUnit.FindParameter(ParametersListView.Selected.Caption);
    if P <> nil then begin
      EditParamForm := TNewParameterForm.Create(Self);
      try
        EditParamForm.ParameterName := P.Name;
        EditParamForm.ParameterType := P.Type_;
        EditParamForm.ParameterDefaultValue := P.Value;

        if EditParamForm.Execute then begin
          P.Name := EditParamForm.ParameterName;
          P.Type_ := EditParamForm.ParameterType;
          P.Value := EditParamForm.ParameterDefaultValue;
          UpdateParametersListView;
        end;
      finally
        EditParamForm.Free;
      end;
    end;
  end;
end;

procedure TParameterDefinitionForm.UpdateUIStates;
begin
  DeleteButton.Enabled := (ParametersListView.Selected <> nil);
end;

procedure TParameterDefinitionForm.Execute;
begin
  UpdateParametersListView;
  ShowModal;
end;

// TParameterDefinitionForm
////////////////////////////////////////////////////////////////////////////////

procedure TParameterDefinitionForm.AddButtonClick(Sender: TObject);
begin
  AddParameter;
end;

procedure TParameterDefinitionForm.DeleteButtonClick(Sender: TObject);
begin
  RemoveSelectedParameter;
end;

procedure TParameterDefinitionForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TParameterDefinitionForm.FormShow(Sender: TObject);
begin
  UpdateUIStates;
end;

procedure TParameterDefinitionForm.ParametersListViewChange(
  Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  UpdateUIStates;
end;

procedure TParameterDefinitionForm.ParametersListViewDblClick(
  Sender: TObject);
begin
  EditeSelectedParameter;
end;

end.
