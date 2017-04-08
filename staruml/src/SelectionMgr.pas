unit SelectionMgr;

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
  BasicClasses, Core,
  Classes;

type
  PSelectionManager = class
  private
    FSelectedModels: PModelOrderedSet;
    FActiveDiagram: PDiagramView;
    FOnSelectionChanged: TNotifyEvent;
    FOnDiagramActivated: TNotifyEvent;
    function GetSelectedModel(Index: Integer): PModel;
    function GetSelectedModelCount: Integer;
    function GetSelectedView(Index: Integer): PView;
    function GetSelectedViewCount: Integer;
    function GetUniqueModelsFromSelectedViews: PModelOrderedSet;
    procedure SetActiveDiagram(Value: PDiagramView);
    procedure SelectionChanged;
    procedure DiagramActivated;
    function ClearSelectedModels: Boolean;
    function ClearSelectedViews: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SelectModel(AModel: PModel; AContextMenuLaunched: Boolean=False);
    procedure DeselectModel(AModel: PModel);
    procedure DeselectModels(Models: PModelOrderedSet);
    procedure SelectView(AView: PView);
    procedure SelectMultipleViews(Views: PViewOrderedSet);
    procedure DeselectView(AView: PView);
    procedure DeselectViews(Views: PViewOrderedSet);
    procedure DeselectAllModels;
    procedure DeselectAllViews;
    procedure DeselectModelsViews(Models: PModelOrderedSet; Views: PViewOrderedSet);
    procedure SelectArea(X1, Y1, X2, Y2: Integer);
    procedure SelectAdditionalView(AView: PView);
    procedure SelectAdditionalArea(X1, Y1, X2, Y2: Integer);
    procedure SelectAdditionalModel(AModel: PModel);
    procedure SelectAll;
    procedure DeselectAll;
    procedure CollectSelectedModels(AOrderedSet: PModelOrderedSet);
    procedure CollectSelectedModelsOfType(AOrderedSet: POrderedSet; OfType: PClass);
    procedure CollectSelectedViews(AOrderedSet: PViewOrderedSet);
    procedure CollectSelectedViewsOfType(AOrderedSet: PViewOrderedSet; OfType: PClass);
    function IsSelected(AModel: PModel): Boolean;
    property SelectedModels[Index: Integer]: PModel read GetSelectedModel;
    property SelectedModelCount: Integer read GetSelectedModelCount;
    property SelectedViews[Index: Integer]: PView read GetSelectedView;
    property SelectedViewCount: Integer read GetSelectedViewCount;
    property ActiveDiagram: PDiagramView read FActiveDiagram write SetActiveDiagram;
    property OnSelectionChanged: TNotifyEvent read FOnSelectionChanged write FOnSelectionChanged;
    property OnDiagramActivated: TNotifyEvent read FOnDiagramActivated write FOnDiagramActivated;
  end;

implementation

uses
  SysUtils, NLS_StarUML, ViewCore;


////////////////////////////////////////////////////////////////////////////////
// PSelectionManager

constructor PSelectionManager.Create;
begin
  inherited;
  FSelectedModels := PModelOrderedSet.Create;
end;

destructor PSelectionManager.Destroy;
begin
  FSelectedModels.Free;
  inherited;
end;

function PSelectionManager.GetSelectedModel(Index: Integer): PModel;
begin
  Result := FSelectedModels.Items[Index];
end;

function PSelectionManager.GetSelectedModelCount: Integer;
begin
  Result := FSelectedModels.Count;
end;

function PSelectionManager.GetSelectedView(Index: Integer): PView;
begin
  if FActiveDiagram <> nil then Result := FActiveDiagram.SelectedView[Index]
                           else raise ERangeError.Create(ERR_OUT_OF_RANGE);
end;

function PSelectionManager.GetSelectedViewCount: Integer;
begin
  if FActiveDiagram <> nil then Result := FActiveDiagram.SelectedViewCount
                           else Result := 0;
end;

function PSelectionManager.GetUniqueModelsFromSelectedViews: PModelOrderedSet;
var
  View: PView;
  Models: PModelOrderedSet;
begin
  Models := PModelOrderedSet.Create;
  for View in FActiveDiagram.SelectedViews do
    Models.Add(View.Model);
  Result := Models;
end;

procedure PSelectionManager.SetActiveDiagram(Value: PDiagramView);
var
 Models: PModelOrderedSet;
begin
  if FActiveDiagram <> Value then begin
    FActiveDiagram := Value;

    // Select diagram model if no element is selected
	  if Assigned(FActiveDiagram) then begin
      if (GetSelectedViewCount = 0) then begin
        ClearSelectedModels;
        FActiveDiagram.Selected := True;
        FSelectedModels.Add(FActiveDiagram.Diagram);
      end
      // If there are some views selected on the diagram
      // make sure that selected models are matching
      else if (GetSelectedViewCount > 0) then begin
        Models := GetUniqueModelsFromSelectedViews;
        ClearSelectedModels;
        FSelectedModels.Assign(Models);
        Models.Free;
      end;
    end;

    DiagramActivated;
  end;
end;

procedure PSelectionManager.SelectionChanged;
begin
  if Assigned(FOnSelectionChanged) then FOnSelectionChanged(Self);
end;

procedure PSelectionManager.DiagramActivated;
begin
  if Assigned(FOnDiagramActivated) then FOnDiagramActivated(Self);
end;

function PSelectionManager.ClearSelectedModels: Boolean;
begin
  if Assigned(FSelectedModels) and (FSelectedModels.Count > 0) then begin
    FSelectedModels.Clear;
    Result := True;
  end
  else
    Result := False;
end;

function PSelectionManager.ClearSelectedViews: Boolean;
begin
  if Assigned (FActiveDiagram) then
    Result := FActiveDiagram.DeselectAll
  else
    Result := False;
end;

procedure PSelectionManager.SelectModel(AModel: PModel; AContextMenuLaunched: Boolean=False);
var
  Changed: Boolean;
  View: PView;
  FirstViewSelected: Boolean;
begin
  // Initial setup
  FirstViewSelected := False;
  Changed := True;

  if (SelectedModelCount + SelectedViewCount = 0) and (AModel = nil) then
    Changed := False;

  if (SelectedModelCount = 1) and
     {(SelectedViewCount = 0) and}
     (SelectedModels[0] = AModel) then
     Changed := False
  else begin
    ClearSelectedModels;
    ClearSelectedViews;
    if AModel <> nil then
      FSelectedModels.Add(AModel);
  end;

  // Select corresponding view on the active diagram
  //if (not AContextMenuLaunched) and (SelectedViewCount = 0)
    if (AModel <> nil) then begin
      for View in AModel.Views do begin
        if View.OwnerDiagramView = ActiveDiagram then begin
          if not FirstViewSelected then begin
            SelectView(View);
            FirstViewSelected := True;
          end
          else
            SelectAdditionalView(View);
        end;
      end; // End of for

    end; // End of if

  if Changed and not FirstViewSelected then // No notifications sent so far
    SelectionChanged;
end;

procedure PSelectionManager.DeselectModel(AModel: PModel);
begin
  if IsSelected(AModel) then begin
    FSelectedModels.Remove(AModel);
    SelectionChanged;
  end;
end;

procedure PSelectionManager.DeselectModels(Models: PModelOrderedSet);
var
  I: Integer;
  SelectedModelsChanged: Boolean;
begin
  SelectedModelsChanged := False;
  for I := 0 to Models.Count - 1 do
    if FSelectedModels.Contains(Models.Items[I]) then begin
      FSelectedModels.Remove(Models.Items[I]);
      SelectedModelsChanged := True;
    end;
  if SelectedModelsChanged then SelectionChanged;
end;

procedure PSelectionManager.SelectView(AView: PView);
begin
  if FActiveDiagram <> nil then begin
    ClearSelectedModels;
    ClearSelectedViews;
    if AView <> nil then begin
      AView.Selected := True;
      if AView.Model <> nil then
        FSelectedModels.Add(AView.Model);
    end;
    SelectionChanged;
  end;
end;

procedure PSelectionManager.SelectMultipleViews(Views: PViewOrderedSet);
var
  View: PView;
begin
  if FActiveDiagram <> nil then begin
    ClearSelectedModels;
    ClearSelectedViews;
    for View in Views do begin
      if (View <> nil) and (View is PNodeView) then begin // Select only Node Views and skip Edge Views
        View.Selected := True;
        if View.Model <> nil then
          FSelectedModels.Add(View.Model);
      end;
    end;
    SelectionChanged;
  end;
end;

procedure PSelectionManager.DeselectView(AView: PView);
begin
  AView.Selected := False;
  if AView.Model <> nil then FSelectedModels.Remove(AView.Model);
  SelectionChanged;
end;

procedure PSelectionManager.DeselectViews(Views: PViewOrderedSet);
var
  Changed: Boolean;
  View: PView;
begin
  Changed := False;

  for View in Views do begin
    if View.Selected then
    begin
      View.Selected := False;
      Changed := True;
    end;
  end;

  if Changed then SelectionChanged;
end;

procedure PSelectionManager.DeselectAllModels;
begin
  if SelectedModelCount > 0 then begin
    ClearSelectedModels;
    SelectionChanged;
  end;
end;

procedure PSelectionManager.DeselectAllViews;
begin
  if FActiveDiagram <> nil then begin
    if FActiveDiagram.SelectedViewCount > 0 then begin
      ClearSelectedViews;
      SelectionChanged;
    end;
  end
end;

procedure PSelectionManager.DeselectModelsViews(Models: PModelOrderedSet; Views: PViewOrderedSet);
var
  I: Integer;
  Changed: Boolean;
begin
  Changed := False;
  // Deselect Models
  for I := 0 to Models.Count - 1 do
    if FSelectedModels.Contains(Models.Items[I]) then
    begin
      FSelectedModels.Remove(Models.Items[I]);
      Changed := True;
    end;
  // Deselect Views
  for I := 0 to Views.Count - 1 do
    if (Views.Items[I] as PView).Selected then
    begin
      (Views.Items[I] as PView).Selected := False;
      Changed := True;
    end;
  if Changed then SelectionChanged;
end;

procedure PSelectionManager.SelectArea(X1, Y1, X2, Y2: Integer);
var
  I: Integer;
begin
  if FActiveDiagram <> nil then begin
    FActiveDiagram.SelectArea(FActiveDiagram.Canvas, X1, Y1, X2, Y2);
    FSelectedModels.Clear;
    if FActiveDiagram.SelectedViewCount = 0 then
      FSelectedModels.Add(FActiveDiagram.Diagram)
    else
      for I := 0 to FActiveDiagram.SelectedViewCount - 1 do begin
        if FActiveDiagram.SelectedView[I].Model <> nil then
          FSelectedModels.Add(FActiveDiagram.SelectedView[I].Model);
      end;
    SelectionChanged;
  end;
end;

procedure PSelectionManager.SelectAdditionalView(AView: PView);
begin
  AView.Selected := True;
  if AView.Model <> nil then FSelectedModels.Add(AView.Model);
  SelectionChanged;
end;

procedure PSelectionManager.SelectAdditionalArea(X1, Y1, X2, Y2: Integer);
var
  I: Integer;
begin
  if FActiveDiagram <> nil then begin
    FActiveDiagram.SelectArea(FActiveDiagram.Canvas, X1, Y1, X2, Y2);
    for I := 0 to FActiveDiagram.SelectedViewCount - 1 do begin
      if FActiveDiagram.SelectedView[I].Model <> nil then
        FSelectedModels.Add(FActiveDiagram.SelectedView[I].Model);
    end;
    SelectionChanged;
  end;
end;

procedure PSelectionManager.SelectAdditionalModel(AModel: PModel);
begin
  if AModel <> nil then begin
    FSelectedModels.Add(AModel);
    SelectionChanged;
  end;
end;

// -----------------------------------------------------------------------------
// - select all element in current diagram(ActiveDiagram)
// -----------------------------------------------------------------------------
procedure PSelectionManager.SelectAll;
var
  I: Integer;
begin
  ClearSelectedViews;
  ClearSelectedModels;
  if FActiveDiagram <> nil then begin
    FActiveDiagram.SelectAll;
    for I := 0 to FActiveDiagram.SelectedViewCount - 1 do begin
      if FActiveDiagram.SelectedView[I].Model <> nil then
        FSelectedModels.Add(FActiveDiagram.SelectedView[I].Model);
    end;
  end;
  SelectionChanged;
end;

procedure PSelectionManager.DeselectAll;
var
  ElementsCleared: Boolean;
begin
  ElementsCleared := ClearSelectedModels;
  ElementsCleared := ClearSelectedViews or ElementsCleared;

  if ElementsCleared then
    SelectionChanged;
end;

procedure PSelectionManager.CollectSelectedModels(AOrderedSet: PModelOrderedSet);
begin
  AOrderedSet.Clear;
  AOrderedSet.Assign(FSelectedModels);
end;

procedure PSelectionManager.CollectSelectedModelsOfType(AOrderedSet: POrderedSet; OfType: PClass);
var
  I: Integer;
begin
  AOrderedSet.Clear;
  for I := 0 to FSelectedModels.Count - 1 do
    if FSelectedModels.Items[I] is OfType then
      AOrderedSet.Add(FSelectedModels.Items[I]);
end;

procedure PSelectionManager.CollectSelectedViews(AOrderedSet: PViewOrderedSet);
var
  I: Integer;
begin
  AOrderedSet.Clear;
  for I := 0 to SelectedViewCount - 1 do
    AOrderedSet.Add(SelectedViews[I]);
end;

procedure PSelectionManager.CollectSelectedViewsOfType(AOrderedSet: PViewOrderedSet; OfType: PClass);
var
  I: Integer;
begin
  AOrderedSet.Clear;
  for I := 0 to SelectedViewCount - 1 do
    if SelectedViews[I] is OfType then
      AOrderedSet.Add(SelectedViews[I]);
end;

function PSelectionManager.IsSelected(AModel: PModel): Boolean;
begin
  Result := FSelectedModels.Contains(AModel);
end;

// PSelectionManager
////////////////////////////////////////////////////////////////////////////////

end.
