unit OptionDialogFrm;

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
  OptionMgr, OptionNodes, OptionRowsBase,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, ImgList, FlatPanel, Generics.Collections;

type
  // TOptionDialog
  TOptionDialogForm = class(TForm)
    AcceptButton: TButton;
    CancelButton: TButton;
    CategoryImageList: TImageList;
    LoadDefaultButton: TButton;
    RestoreValueButton: TButton;
    OptionTreeView: TTreeView;
    CategoryTreeLabel: TLabel;
    DesciptionLabel: TLabel;
    OptionItemsLabel: TLabel;
    DescLabel: TLabel;
    Bevel: TBevel;
    DescFlatPanel: TFlatPanel;
    DescriptionMemo: TMemo;
    procedure FormCreate(Sender: TObject);
  end;

  // POptionDialog
  POptionDialog = class
  private type
    TOptionRowsList = TList<POptionItemRowBase>;

  private
    OptionManager: POptionManager;
  private
     // event handler
    procedure HandleTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure HandleAcceptChangeButtonClick(Sender: TObject);
    procedure HandleCancelChangeButtonClick(Sender: TObject);
    procedure HandleLoadDefualtButtonClick(Sender: TObject);
    procedure HandleRestoreValueButtonClick(Sender: TObject);

  protected
    OptionRows: TOptionRowsList;
    DialogForm: TOptionDialogForm;

  protected
    procedure ClearOptionRows;
    //function FindOptionRow(Row: TdxInspectorRow): POptionItemRow;
    procedure BuildOptionTreeView(TreeView: TTreeView);
    procedure BuildOptionCategoryInspector(AOptionCategory: POptionCategory);  virtual; abstract;
    procedure AcceptChange;
    procedure CancelChange;
    procedure LoadDefault;
    procedure RestoreValue; virtual; abstract;
    procedure ShowDescription(OS: POptionSchema); overload;
    procedure ShowDescription(OC: POptionCategory); overload;
    procedure ShowDescription(OL: POptionClassification); overload;
    procedure ShowDescription(OI: POptionItem); overload;

    procedure HandleInspectorExit(Sender: TObject); virtual; abstract;
    procedure ClearInspectorRows;  virtual; abstract;

  public
    constructor Create(AOptionManager: POptionManager);
    destructor Destroy; override;
    function Execute: Boolean;
  end;

implementation

uses
  OptionMgrAux, OptMgr_TLB, NLS;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TOptionDialogForm

// TOptionDialogForm
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// POptionDialog

constructor POptionDialog.Create(AOptionManager: POptionManager);
begin
  inherited Create;
  OptionManager := AOptionManager;
  OptionRows := TOptionRowsList.Create;
  DialogForm.OptionTreeView.OnChange := HandleTreeViewChange;
  DialogForm.AcceptButton.OnClick := HandleAcceptChangeButtonClick;
  DialogForm.CancelButton.OnClick := HandleCancelChangeButtonClick;
  DialogForm.LoadDefaultButton.OnClick := HandleLoadDefualtButtonClick;
  DialogForm.RestoreValueButton.OnClick := HandleRestoreValueButtonClick;
end;

destructor POptionDialog.Destroy;
begin
  ClearOptionRows;
  OptionRows.Free;
  DialogForm.Free;
  inherited Destroy;
end;

procedure POptionDialog.ClearOptionRows;
var
  OptionRow: POptionItemRowBase;
begin
  for OptionRow in OptionRows do
    OptionRow.Free;

  ClearInspectorRows;
  OptionRows.Clear;
end;



procedure POptionDialog.BuildOptionTreeView(TreeView: TTreeView);
var
  DefaultOS, OS: POptionSchema;
  I: Integer;

  procedure BuildOptionSchemaNode(OS: POptionSchema);
  var
    OC: POptionCategory;
    SchemaNode, CategoryNode: TTreeNode;
    J: Integer;
  begin
    SchemaNode := TreeView.Items.AddChild(nil, OS.Caption);
    SchemaNode.Data := OS;
    SchemaNode.ImageIndex := SCHEMA_IMAGE;
    SchemaNode.SelectedIndex := SCHEMA_OPEN_IMAGE;
    SchemaNode.StateIndex := SCHEMA_OPEN_IMAGE;
    for J := 0 to OS.OptionCategoryCount - 1 do begin
      OC := OS.OptionCategories[J];
      CategoryNode := TreeView.Items.AddChild(SchemaNode, OC.Caption);
      CategoryNode.Data := OC;
      CategoryNode.ImageIndex := -1;
      CategoryNode.SelectedIndex := CATEGORY_OPEN_IMAGE;
      if OS = DefaultOS then
        if J = 0 then
          CategoryNode.Selected := True;
    end;
    if OS = DefaultOS then begin
      SchemaNode.Expanded := True;
    end;
  end;

begin
  DefaultOS := OptionManager.FindOptionSchema(OptionManager.DefaultSchemaID);
  if DefaultOS <> nil then
    BuildOptionSchemaNode(DefaultOS);
  for I := 0 to OptionManager.OptionSchemaCount - 1 do begin
    OS := OptionManager.OptionSchemata[I];
    if OS <> DefaultOS then
      BuildOptionSchemaNode(OS);
  end;
end;

procedure POptionDialog.AcceptChange;
begin
  OptionManager.SaveOptions;
end;

procedure POptionDialog.CancelChange;
begin
  OptionManager.RestoreValues;
end;

procedure POptionDialog.LoadDefault;
begin
  OptionManager.SetToDefaultValues;
  HandleTreeViewChange(DialogForm.OptionTreeView, DialogForm.OptionTreeView.Selected);
end;

procedure POptionDialog.ShowDescription(OS: POptionSchema);
begin
  DialogForm.DesciptionLabel.Caption := ': ' + OS.Caption;
  DialogForm.DescriptionMemo.Lines.Text := OS.Description;
end;

procedure POptionDialog.ShowDescription(OC: POptionCategory);
begin
  DialogForm.DesciptionLabel.Caption := ': ' + OC.Caption;
  DialogForm.DescriptionMemo.Lines.Text := OC.Description;
end;

procedure POptionDialog.ShowDescription(OL: POptionClassification);
begin
  DialogForm.DesciptionLabel.Caption := ': ' + OL.Caption;
  DialogForm.DescriptionMemo.Lines.Text := OL.Description;
end;

procedure POptionDialog.ShowDescription(OI: POptionItem);
begin
  DialogForm.DesciptionLabel.Caption := ': ' + OI.Caption;
  DialogForm.DescriptionMemo.Lines.Text := OI.Description;
end;

procedure POptionDialog.HandleTreeViewChange(Sender: TObject; Node: TTreeNode);
begin
  if DialogForm.Visible and DialogForm.OptionTreeView.Visible then
    DialogForm.OptionTreeView.SetFocus;
  if Node.Level = 0 then begin
    if Node.Count > 0 then begin
      Node.Item[0].Selected := True;
    end
    else begin
      ClearOptionRows;
      ShowDescription(POptionSchema(Node.Data));
    end;
  end
  else if Node.Level = 1 then begin
    if Node.Data <> nil then begin
      HandleInspectorExit(nil);
      BuildOptionCategoryInspector(POptionCategory(Node.Data));
      ShowDescription(POptionCategory(Node.Data));
    end
    else
      ClearOptionRows;
  end;
end;


procedure POptionDialog.HandleAcceptChangeButtonClick;
begin
  AcceptChange;
end;

procedure POptionDialog.HandleCancelChangeButtonClick(Sender: TObject);
begin
  CancelChange;
end;

procedure POptionDialog.HandleLoadDefualtButtonClick(Sender: TObject);
begin
  LoadDefault;
end;

procedure POptionDialog.HandleRestoreValueButtonClick(Sender: TObject);
begin
  RestoreValue;
end;

function POptionDialog.Execute: Boolean;
begin
  BuildOptionTreeView(DialogForm.OptionTreeView);
  Result := (DialogForm.ShowModal = mrOk);
end;

// POptionDialog
////////////////////////////////////////////////////////////////////////////////

procedure TOptionDialogForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(GetDllPath + '\OPTMGR.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

end.
