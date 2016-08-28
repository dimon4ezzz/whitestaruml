unit ModelExpFilterFrm;

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
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ImgList, Generics.Collections,
  BasicClasses, ModelExplorerFrame;
type
  // TModelExplorerFilterForm
  TModelExplorerFilterForm = class(TForm)
    HorizonBevel: TBevel;
    OKButton: TButton;
    CancelButton: TButton;
    SelectAllButton: TButton;
    DeselectAllButton: TButton;
    FilterItemsListView: TListView;
    DescLabel: TLabel;
    DefaultSettingButton: TButton;
    SelectRelationsButton: TButton;
    DeselectRelationsButton: TButton;
    HelpButton: TButton;
    procedure SelectAllButtonClick(Sender: TObject);
    procedure DeselectAllButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SelectRelationsButtonClick(Sender: TObject);
    procedure DeselectRelationsButtonClick(Sender: TObject);
    procedure DefaultSettingButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
  private type
    PNodeToItemMap = TDictionary<string,TListItem>;
  private
    FModelExplorer: TModelExplorerPanel;
    FNodeToItemMap: PNodeToItemMap;
    procedure SetModelExplorer(Value: TModelExplorerPanel);
    procedure BuildFilterItems;
    procedure UpdateFilterChecks; overload;
    procedure UpdateFilterChecks(const Classes: array of PClass; State: Boolean); overload;
    procedure SetAllChecks(State: Boolean);
  public
    function Execute: Boolean;
    procedure ApplyFilterChecks;
    property ModelExplorer: TModelExplorerPanel read FModelExplorer write SetModelExplorer;
  end;

var
  ModelExplorerFilterForm: TModelExplorerFilterForm;

implementation

uses
  Core, UMLModels, HtmlHlp, NLS;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TModelExplorerFilterForm

procedure TModelExplorerFilterForm.SetModelExplorer(Value: TModelExplorerPanel);
begin
  if FModelExplorer <> Value then
  begin
    FModelExplorer := Value;
    if Assigned(FModelExplorer) then
      FilterItemsListView.SmallImages := FModelExplorer.ImageList;
  end;
end;

procedure TModelExplorerFilterForm.UpdateFilterChecks(const Classes: array of PClass; State: Boolean);
var
  MetaNode: PMetaNode;
  Item: TListItem;
  NodeClass: PClass;
begin
  if Assigned(FModelExplorer) then begin
    for NodeClass in Classes do begin
      MetaNode := FModelExplorer.FindMetaNodeByClass(NodeClass);
      Item := FNodeToItemMap[MetaNode.Caption];
      Item.Checked := State;
    end;
  end;
end;

procedure TModelExplorerFilterForm.BuildFilterItems;
var
  MetaNode: PMetaNode;
  Item: TListItem;
begin
  if Assigned(FModelExplorer) then
  begin
    FilterItemsListView.Clear;
    FilterItemsListView.Items.BeginUpdate;
    for MetaNode in FModelExplorer.MetaNodes do
    begin
      if MetaNode.ModelClass <> PUMLProject then
      begin
        Item := FilterItemsListView.Items.Add;
        Item.Caption := MetaNode.Caption;
        Item.Data := MetaNode;
        Item.ImageIndex := MetaNode.ImageIndex;
        FNodeToItemMap.Add(MetaNode.Caption,Item);
      end;
    end;
    FilterItemsListView.Items.EndUpdate;
  end;
end;

procedure TModelExplorerFilterForm.UpdateFilterChecks;
var
  MetaNode: PMetaNode;
  Item: TListItem;
begin
  if Assigned(FModelExplorer) then
  begin
    for Item in FilterItemsListView.Items do
    begin
      MetaNode := Item.Data;
      if MetaNode <> nil then
        Item.Checked := MetaNode.Filtered;
    end;
  end;
end;

function TModelExplorerFilterForm.Execute: Boolean;
begin
  FNodeToItemMap := PNodeToItemMap.Create;
  BuildFilterItems;
  UpdateFilterChecks;
  Result := (ShowModal = mrOK);
  FreeAndNil(FNodeToItemMap);
end;

procedure TModelExplorerFilterForm.ApplyFilterChecks;
var
  MetaNode: PMetaNode;
  Item: TListItem;
begin
  if Assigned(FModelExplorer) then
  begin
    for Item in FilterItemsListView.Items do begin
      MetaNode := Item.Data;
      if Assigned(MetaNode) then
        MetaNode.Filtered := Item.Checked;
    end;
  end;
end;

// TModelExplorerFilterForm
////////////////////////////////////////////////////////////////////////////////

procedure TModelExplorerFilterForm.SelectAllButtonClick(Sender: TObject);
begin
  SetAllChecks(True);
end;

procedure TModelExplorerFilterForm.DeselectAllButtonClick(Sender: TObject);
begin
  SetAllChecks(False);
end;

procedure TModelExplorerFilterForm.SetAllChecks(State: Boolean);
var
  AnItem: TListItem;
begin
  for AnItem in FilterItemsListView.Items do
    AnItem.Checked := State;
end;

procedure TModelExplorerFilterForm.FormCreate(Sender: TObject);
begin
  FModelExplorer := nil;
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\MDLFILT.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

procedure TModelExplorerFilterForm.SelectRelationsButtonClick(
  Sender: TObject);
begin
  if Assigned(FModelExplorer) then
    UpdateFilterChecks(RELATION_FILTERINGSET, True);
end;

procedure TModelExplorerFilterForm.DeselectRelationsButtonClick(
  Sender: TObject);
begin
  if Assigned(FModelExplorer) then
    UpdateFilterChecks(RELATION_FILTERINGSET, False);
end;

procedure TModelExplorerFilterForm.DefaultSettingButtonClick(
  Sender: TObject);
begin
  if Assigned(FModelExplorer) then begin
    SetAllChecks(False);
    UpdateFilterChecks(DEFAULT_FILTERINGSET, True);
  end;
end;

procedure TModelExplorerFilterForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

end.
