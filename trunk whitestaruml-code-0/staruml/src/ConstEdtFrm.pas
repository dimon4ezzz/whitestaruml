unit ConstEdtFrm;

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
  ExtCore, UMLModels,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  PConstraintCreateEvent = procedure(Sender: TObject; AModelElement: PUMLModelElement; AName: string; ABody: string) of object;
  PConstraintEvent = procedure(Sender: TObject; AModelElement: PUMLModelElement; AConstraint: PConstraint) of object;
  PConstraintChangeEvent = procedure(Sender: TObject; AModelElement: PUMLModelElement; AConstraint: PConstraint; AName: string; ABody: string) of object;
  PConstraintOrderChangeEvent = procedure(Sender: TObject; AModelElement: PUMLModelElement;
    AConstraint: PConstraint; NewIdx: Integer) of object;

  TConstraintEditorForm = class(TForm)
    CloseButton: TButton;
    AddButton: TButton;
    DeleteButton: TButton;
    EditButton: TButton;
    MoveUpButton: TButton;
    MoveDownButton: TButton;
    ConstraintsListView: TListView;
    ConstraintsLabel: TLabel;
    Bevel1: TBevel;
    HelpButton: TButton;
    procedure ConstraintsListViewSelectItem(Sender: TObject;
      Item: TListItem; Selected: Boolean);
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure MoveUpButtonClick(Sender: TObject);
    procedure MoveDownButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ConstraintsListViewDblClick(Sender: TObject);
  private
    FConstrainedElement: PUMLModelElement;
    FReadOnly: Boolean;
    FOnConstraintCreate: PConstraintCreateEvent;
    FOnConstraintDelete: PConstraintEvent;
    FOnConstraintChange: PConstraintChangeEvent;
    FOnConstraintOrderChange: PConstraintOrderChangeEvent;
    procedure SetReadOnly(Value: Boolean);
    procedure UpdateUIStates;
    procedure UpdateFormTitle;
    procedure AddConstraint;
    procedure DeleteConstraint;
    procedure EditConstraint;
    procedure MoveUpConstraint;
    procedure MoveDownConstraint;
  public
    procedure ShowConstraints(Element: PUMLModelElement);
    procedure UpdateConstraints;
    procedure Inspect;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property ConstrainedElement: PUMLModelElement read FConstrainedElement write FConstrainedElement;
    property OnConstraintCreate: PConstraintCreateEvent read FOnConstraintCreate write FOnConstraintCreate;
    property OnConstraintDelete: PConstraintEvent read FOnConstraintDelete write FOnConstraintDelete;
    property OnConstraintChange: PConstraintChangeEvent read FOnConstraintChange write FOnConstraintChange;
    property OnConstraintOrderChange: PConstraintOrderChangeEvent read FOnConstraintOrderChange write FOnConstraintOrderChange;
  end;

var
  ConstraintEditorForm: TConstraintEditorForm;

implementation

{$R *.dfm}

uses
  ConstItemEdtFrm, HtmlHlp, NLS, NLS_StarUML;

////////////////////////////////////////////////////////////////////////////////
// TConstraintEditorForm

procedure TConstraintEditorForm.ConstraintsListViewSelectItem(
  Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  UpdateUIStates;
end;

procedure TConstraintEditorForm.ConstraintsListViewDblClick(Sender: TObject);
begin
  EditConstraint;
end;

procedure TConstraintEditorForm.AddButtonClick(Sender: TObject);
begin
  AddConstraint;
end;

procedure TConstraintEditorForm.DeleteButtonClick(Sender: TObject);
begin
  DeleteConstraint;
end;

procedure TConstraintEditorForm.EditButtonClick(Sender: TObject);
begin
  EditConstraint;
end;

procedure TConstraintEditorForm.MoveUpButtonClick(Sender: TObject);
begin
  MoveUpConstraint;
end;

procedure TConstraintEditorForm.MoveDownButtonClick(Sender: TObject);
begin
  MoveDownConstraint;
end;

procedure TConstraintEditorForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TConstraintEditorForm.SetReadOnly(Value: Boolean);
begin
  FReadOnly := Value;
  UpdateUIStates;
end;

procedure TConstraintEditorForm.UpdateUIStates;
var
  C: Boolean;
  S: Boolean;
begin
  C := (FConstrainedElement <> nil);
  S := (ConstraintsListView.Selected <> nil);
  ConstraintsListView.Enabled := C;
  AddButton.Enabled := C and (not FReadOnly);
  DeleteButton.Enabled := C and S and (not FReadOnly);
  EditButton.Enabled := C and S and (not FReadOnly);
  MoveUpButton.Enabled := C and S and (ConstraintsListView.ItemIndex > 0) and (not FReadOnly);
  MoveDownButton.Enabled := C and S and (ConstraintsListView.ItemIndex < ConstraintsListView.Items.Count - 1) and (not FReadOnly);
end;

procedure TConstraintEditorForm.UpdateFormTitle;
begin
  if FConstrainedElement = nil then
    Caption := TXT_CONSTREDIT_TITILE + ' - (' + TXT_CONSTREDIT_NO_MODEL + ')'
  else
    Caption := TXT_CONSTREDIT_TITILE + ' - ('
      + Copy(FConstrainedElement.ClassName, 2, Length(FConstrainedElement.ClassName) - 1) + ') ' + FConstrainedElement.Name;
end;

procedure TConstraintEditorForm.AddConstraint;
begin
  with ConstraintItemEditForm do begin
    ConstraintName := '';
    ConstraintBody := '';
    if Execute then
      if Assigned(FOnConstraintCreate) then
        FOnConstraintCreate(Self, ConstrainedElement, ConstraintName, ConstraintBody);
  end;
end;

procedure TConstraintEditorForm.DeleteConstraint;
var
  C: PConstraint;
begin
  if ConstraintsListView.ItemIndex <> -1 then begin
    C := ConstraintsListView.Selected.Data;
    if Assigned(FOnConstraintDelete) then
      FOnConstraintDelete(Self, ConstrainedElement, C);
  end;
end;

procedure TConstraintEditorForm.EditConstraint;
var
  C: PConstraint;
begin
  if ConstraintsListView.ItemIndex <> -1 then begin
    C := ConstraintsListView.Selected.Data;
    with ConstraintItemEditForm do begin
      ConstraintName := C.Name;
      ConstraintBody := C.Body;
      if Execute then
        if Assigned(FOnConstraintChange) then
          FOnConstraintChange(Self, ConstrainedElement, C, ConstraintName, ConstraintBody);
    end;
  end;
end;

procedure TConstraintEditorForm.MoveUpConstraint;
var
  C: PConstraint;
begin
  if (ConstraintsListView.ItemIndex <> -1) and (ConstraintsListView.ItemIndex > 0) then begin
    C := ConstraintsListView.Selected.Data;
    if Assigned(FOnConstraintOrderChange) then
      FOnConstraintOrderChange(Self, ConstrainedElement, C, ConstraintsListView.ItemIndex - 1);
  end;
end;

procedure TConstraintEditorForm.MoveDownConstraint;
var
  C: PConstraint;
begin
  if (ConstraintsListView.ItemIndex <> -1) and (ConstraintsListView.ItemIndex < ConstraintsListView.Items.Count - 1) then begin
    C := ConstraintsListView.Selected.Data;
    if Assigned(FOnConstraintOrderChange) then
      FOnConstraintOrderChange(Self, ConstrainedElement, C, ConstraintsListView.ItemIndex + 1);
  end;
end;

procedure TConstraintEditorForm.ShowConstraints(Element: PUMLModelElement);
begin
  // PRECONDITIONS
  Assert(Element <> nil);
  // PRECONDITIONS;
  FConstrainedElement := Element;
  UpdateConstraints;
  Show;
end;

procedure TConstraintEditorForm.UpdateConstraints;
var
  ListItem: TListItem;
  SL: TStringList;
  C: PConstraint;
  S: string;
  I: Integer;
begin
  ConstraintsListView.Items.BeginUpdate;
  ConstraintsListView.Clear;
  if FConstrainedElement <> nil then begin
    for I := 0 to FConstrainedElement.ConstraintCount - 1 do
    begin
      C := FConstrainedElement.Constraints[I];
      ListItem := ConstraintsListView.Items.Add;
      ListItem.Data := C;
      ListItem.Caption := C.Name;
      SL := TStringList.Create;
      try
        SL.Text := C.Body;
        S := '';
        if SL.Count > 0 then begin
          S := SL[0];
          if SL.Count > 1 then
            S := TXT_CONSTREDIT_MULTILINE + ' ' + S + '...';
        end;
      finally
        SL.Free;
      end;
      ListItem.SubItems.Add(S)
    end;
  end;
  ConstraintsListView.Items.EndUpdate;
  if ConstrainedElement <> nil then
    ReadOnly := ConstrainedElement.ReadOnly
  else
    ReadOnly := True;
  UpdateFormTitle;
  UpdateUIStates;
end;

procedure TConstraintEditorForm.Inspect;
begin
  UpdateConstraints;
end;

// TConstraintEditorForm
////////////////////////////////////////////////////////////////////////////////

procedure TConstraintEditorForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

procedure TConstraintEditorForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\CONSTEDT.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

end.
