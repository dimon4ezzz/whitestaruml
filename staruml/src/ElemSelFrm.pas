unit ElemSelFrm;

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
  BasicClasses, Core, ModelExplorerFrame, UMLModels,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Generics.Collections;

type
  TElementSelectorForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    ElementTreeViewPanel: TPanel;
    NotSpecCheckBox: TCheckBox;
    SepBevel: TBevel;
    DataTypeLabel: TLabel;
    DataTypeComboBox: TComboBox;
    StaticText: TStaticText;
    HelpButton: TButton;
    ModelExplorer: TModelExplorerPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NotSpecCheckBoxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataTypeComboBoxChange(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
  private type
   TClassList = TList<PClass>;
  private
    FSelectableModels: TClassList;
    FSelectedModel: PModel;
    FSelectedName: string;
    FProject: PUMLProject;
    FDataTypeVisible: Boolean;
    FAllowNull: Boolean;
    FReservedModelToSelect: PModel;
    function NotSpecified: Boolean;
    procedure SetProject(Value: PUMLProject);
    procedure SetImageList(Value: TImageList);
    function GetSelectableModel(Index: Integer): PClass;
    function GetSelectableModelCount: Integer;
    procedure SetDataTypeEnabled(Value: Boolean);
    procedure SetDataTypeVisible(Value: Boolean);
    procedure SetAllowNull(Value: Boolean);
    procedure ElementSelected(Sender: TObject; Element: PModel);
    procedure ArrangeChildControls;
    procedure UpdateDataTypes;
    procedure UpdateUIStates;
  public
    procedure Filter(const Classes: array of PClass);
    procedure ClearSelectableModels;
    procedure AddSelectableModel(AModelClass: PClass);
    procedure AddSelectableModels(const AModelClasses: array of PClass);
    procedure RemoveSelectableModel(AModelClass: PClass);
    procedure SetReservedModelToSelect(AModel: PModel);
    function Execute(Title: string = ''; ShowDataType: Boolean = False): Boolean;
    property SelectedModel: PModel read FSelectedModel;
    property SelectedName: string read FSelectedName;
    property Project: PUMLProject read FProject write SetProject;
    property ImageList: TImageList write SetImageList;
    property SelectableModels[Index: Integer]: PClass read GetSelectableModel;
    property SelectableModelCount: Integer read GetSelectableModelCount;
    property DataTypeVisible: Boolean read FDataTypeVisible write SetDataTypeVisible;
    property AllowNull: Boolean read FAllowNull write SetAllowNull;
  end;

var
  ElementSelectorForm: TElementSelectorForm;

implementation

uses
  System.Types, StarUMLApp, MainFrm, HtmlHlp, NLS, NLS_StarUML, ExtCore;

const
  ELEMENTTREEVIEWPANEL_DEFAULT_HEIGHT = 217;
  ELEMENTTREEVIEWPANEL_EXPANDED_HEIGHT = 258;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TSelectBrowserForm

procedure TElementSelectorForm.FormCreate(Sender: TObject);
begin
  FProject := nil;
  FSelectedModel := nil;
  FReservedModelToSelect := nil;
  FSelectedName := '';
  FDataTypeVisible := True;
  FAllowNull := True;
  FSelectableModels := TClassList.Create;
  ModelExplorer.Project := nil;
  ModelExplorer.SortType := stStorage;
  ModelExplorer.ClearFilter;
  ModelExplorer.AddToFilter([PUMLProject, PUMLModel, PUMLSubsystem, PUMLPackage, PUMLClass]);
  ModelExplorer.OnElementSelected := ElementSelected;
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\ELEMSEL.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

procedure TElementSelectorForm.FormDestroy(Sender: TObject);
begin
  FSelectableModels.Free;
end;

procedure TElementSelectorForm.FormShow(Sender: TObject);
begin
  NotSpecCheckBox.Checked := False;
  if FReservedModelToSelect <> nil then begin
    ModelExplorer.SetFocus;
    ModelExplorer.SelectWithFocus(FReservedModelToSelect);
    FReservedModelToSelect := nil;
  end;
end;

procedure TElementSelectorForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ModelExplorer.Clear;
end;

procedure TElementSelectorForm.NotSpecCheckBoxClick(Sender: TObject);
begin
  if NotSpecified then
  begin
    FSelectedModel := nil;
    FSelectedName := '';
  end;
  UpdateUIStates;
end;

function TElementSelectorForm.NotSpecified: Boolean;
begin
  Result := NotSpecCheckBox.Checked;
end;

procedure TElementSelectorForm.SetProject(Value: PUMLProject);
begin
  if FProject <> Value then
  begin
    FProject := Value;
    ModelExplorer.Project := FProject;
  end;
end;

procedure TElementSelectorForm.SetImageList(Value: TImageList);
begin
  ModelExplorer.ImageList := Value;
end;

function TElementSelectorForm.GetSelectableModel(Index: Integer): PClass;
begin
  Result := FSelectableModels.Items[Index];
end;

function TElementSelectorForm.GetSelectableModelCount: Integer;
begin
  Result := FSelectableModels.Count;
end;

procedure TElementSelectorForm.SetDataTypeEnabled(Value: Boolean);
begin
  DataTypeLabel.Enabled := Value;
  DataTypeComboBox.Enabled := Value;
  if Value then
    DataTypeComboBox.Color := clWindow
  else
    DataTypeComboBox.Color := clBtnFace;
end;

procedure TElementSelectorForm.SetDataTypeVisible(Value: Boolean);
begin
  if FDataTypeVisible <> Value then begin
    FDataTypeVisible := Value;
    DataTypeLabel.Visible := FDataTypeVisible;
    DataTypeComboBox.Visible := FDataTypeVisible;
  end;
end;

procedure TElementSelectorForm.SetAllowNull(Value: Boolean);
begin
  if FAllowNull <> Value then begin
    FAllowNull := Value;
    NotSpecCheckBox.Visible := FAllowNull;
  end;
end;

procedure TElementSelectorForm.ElementSelected(Sender: TObject; Element: PModel);
begin
  FSelectedModel := Element;
  FSelectedName := Element.Pathname;
  UpdateUIStates;
end;

procedure TElementSelectorForm.ArrangeChildControls;
begin
  if FDataTypeVisible then
    ElementTreeViewPanel.Height := ELEMENTTREEVIEWPANEL_DEFAULT_HEIGHT
  else
    ElementTreeViewPanel.Height := ELEMENTTREEVIEWPANEL_EXPANDED_HEIGHT;
end;

procedure TElementSelectorForm.UpdateDataTypes;
var
  I, J: Integer;
  P: PProfile;
  S: string;
begin
  DataTypeComboBox.Items.Clear;
  for I := 0 to ExtensionManager.IncludedProfileCount - 1 do
  begin
    P := ExtensionManager.IncludedProfiles[I];
    for J := 0 to P.DataTypeCount - 1 do
    begin
      S := P.DataTypes[J].Name + '  (' + P.Name + ')';
      DataTypeComboBox.Items.AddObject(S, P.DataTypes[J]);
    end;
  end;
end;

procedure TElementSelectorForm.UpdateUIStates;
var
  I: Integer;
  C: PClass;
begin
  ModelExplorer.Enabled := not NotSpecified;
  if DataTypeVisible then SetDataTypeEnabled(not NotSpecified);
  StaticText.Caption := FSelectedName;
  if FSelectedModel <> nil then DataTypeComboBox.Text := '';
  if NotSpecified then begin
    OKButton.Enabled := True;
  end
  else begin
    if (FSelectedModel = nil) and (FSelectedName = '') then
      OKButton.Enabled := False
    else if FSelectedModel <> nil then begin
      OKButton.Enabled := False;
      for I := 0 to SelectableModelCount - 1 do begin
        C := SelectableModels[I];
        if FSelectedModel.ClassName = C.ClassName then begin
          OKButton.Enabled := True;
          Break;
        end;
      end;
    end
    else if FSelectedName <> '' then begin
      OKButton.Enabled := True;
    end;
  end;
end;

procedure TElementSelectorForm.Filter(const Classes: array of PClass);
begin
  ModelExplorer.ClearFilter;
  ModelExplorer.AddToFilter(Classes);
end;

procedure TElementSelectorForm.ClearSelectableModels;
begin
  FSelectableModels.Clear;
end;

procedure TElementSelectorForm.AddSelectableModel(AModelClass: PClass);
begin
  FSelectableModels.Add(AModelClass);
end;

procedure TElementSelectorForm.AddSelectableModels(const AModelClasses: array of PClass);
var
  I: Integer;
begin
  for I := 0 to Length(AModelClasses) - 1 do begin
    AddSelectableModel(AModelClasses[I]);
  end;
end;

procedure TElementSelectorForm.RemoveSelectableModel(AModelClass: PClass);
begin
  FSelectableModels.Remove(AModelClass);
end;

procedure TElementSelectorForm.SetReservedModelToSelect(AModel: PModel);
begin
  if FReservedModelToSelect <> AModel then FReservedModelToSelect := AModel;
end;

function TElementSelectorForm.Execute(Title: string = ''; ShowDataType: Boolean = False): Boolean;
begin
  FSelectedModel := nil;
  FSelectedName := '';
  DataTypeVisible := ShowDataType;
  ModelExplorer.RebuildAll;
  ModelExplorer.Expand(Project);
  if Title = '' then Caption := MSG_ELEMSELECTOR_DEFAULT_TITLE
                else Caption := Title;
  if DataTypeVisible then UpdateDataTypes;
  ArrangeChildControls;
  UpdateUIStates;
  Result := (ShowModal = mrOK);
end;

// TSelectBrowserForm
////////////////////////////////////////////////////////////////////////////////

procedure TElementSelectorForm.DataTypeComboBoxChange(Sender: TObject);
begin
  if DataTypeVisible and (DataTypeComboBox.ItemIndex > -1) then
  begin
    FSelectedModel := nil;
    FSelectedName := (DataTypeComboBox.Items.Objects[DataTypeComboBox.ItemIndex] as PDataType).Name;
    UpdateUIStates;
  end;
end;

procedure TElementSelectorForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

end.

