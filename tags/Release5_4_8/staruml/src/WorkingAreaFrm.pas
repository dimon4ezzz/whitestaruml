unit WorkingAreaFrm;

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
  Core, DiagramEditors,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, ComCtrls, Forms, Dialogs,
  dxBar, ExtCtrls, FlatPanel, Menus, ImgList, Generics.Collections;

type
  // Event Types.
  PDiagramEditorEvent = procedure(Sender: TObject; DiagramEditor: PDiagramEditor) of object;

  // TWorkingAreaFrame
  TWorkingAreaFrame = class(TFrame)
    DiagramPageControl: TPageControl;
    MapButtonImage: TImage;
    ClientPanel: TFlatPanel;
    DiagramTabPopupMenu: TPopupMenu;
    ViewDiagramPages: TMenuItem;
    N1: TMenuItem;
    ViewCloseDiagram: TMenuItem;
    ViewCloseAllDiagrams: TMenuItem;
    FormatLayoutDiagram: TMenuItem;
    N2: TMenuItem;
    ViewRefresh: TMenuItem;
    procedure DiagramPageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure DiagramPageControlChange(Sender: TObject);
    procedure DiagramPageControlContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure ViewMenuClick(Sender: TObject);
    procedure DiagramTabPopupMenuPopupHandler(Sender: TObject);

  private type
    TDiagramFromMenuItem = TDictionary<TMenuItem,PDiagram>;

  private
    TabList: TList;
    DiagramEditorList: TList;
    FDiagramWidth: Integer;
    FDiagramHeight: Integer;
    FGridWidth: Integer;
    FGridHeight: Integer;
    FShowGrid: Boolean;
    FActiveDiagramEditor: PDiagramEditor;
    FDiagramPopupMenu: TdxBarPopupMenu;
    FTabPopupMenu: TdxBarPopupMenu;
    FOnMouseUp: TMouseEvent;
    FOnMouseMove: TMouseMoveEvent;
    FOnMouseDown: TMouseEvent;
    FOnDragOver: PDiagramViewDragOverEvent;
    FOnDragDrop: PDiagramViewDragDropEvent;
    FOnDiagramOpen: PDiagramEvent;
    FOnDiagramClose: PDiagramEvent;
    FOnActiveDiagramEditorChanged: PDiagramEditorEvent;
    FOnViewMenuClicked: TNotifyEvent;
    //FImageList: TCustomImageList;
    FDiagramFromMenuItem: TDiagramFromMenuItem;
    FLastContextSelectedTab: Integer;

    procedure DiagramEditorMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DiagramEditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DiagramEditorMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure DiagramEditorDragOver(Sender, Source: TObject; var Accept: Boolean; var Msg: string);
    procedure DiagramEditorDragDrop(X, Y: Integer);
    procedure SetDiagramWidth(Value: Integer);
    procedure SetDiagramHeight(Value: Integer);
    procedure SetGridWidth(Value: Integer);
    procedure SetGridHeight(Value: Integer);
    procedure SetShowGrid(Value: Boolean);
    function GetOpenedDiagram(Index: Integer): PDiagram;
    function GetOpenedDiagramCount: Integer;
    procedure SetActiveDiagramEditor(Value: PDiagramEditor);
    function GetActiveDiagramIndex: Integer;
    function GetActiveDiagram: PDiagram;
    function GetDiagramEditorOfTab(Tab: TTabSheet): PDiagramEditor;
    function GetDiagramEditorOfDiagram(ADiagram: PDiagram): PDiagramEditor;
    function GetTabOfDiagram(ADiagram: PDiagram): TTabSheet;
    function GetDiagramOfTabIdx(TabIdx: Integer): PDiagram;
    function AddDiagramEditor(ADiagram: PDiagram): PDiagramEditor;
    procedure RemoveDiagramEditor(ADiagramEditor: PDiagramEditor);
    procedure SetImageList(Value: TCustomImageList);
    procedure DiagramOpen(ADiagram: PDiagram);
    procedure DiagramClose(ADiagram: PDiagram);
    procedure UpdateActiveDiagramEditor;

    procedure ViewDiagramPagesClickHandler(Sender: TObject);


  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure OpenDiagram(ADiagram: PDiagram);
    procedure CloseDiagram(ADiagram: PDiagram);
    procedure ExecuteViewDiagramPageList(ABarItem: TMenuItem);
    procedure CloseActiveDiagram;
    procedure CloseAllDiagrams;
    procedure UpdateAllDiagrams;
    procedure UpdateActiveDiagram;
    procedure RedrawActiveDiagram;
    procedure OpenAllDefaultDiagrams;
    procedure UpdateDiagramTabs;
    property DiagramWidth: Integer read FDiagramWidth write SetDiagramWidth;
    property DiagramHeight: Integer read FDiagramHeight write SetDiagramHeight;
    property GridWidth: Integer read FGridWidth write SetGridWidth;
    property GridHeight: Integer read FGridHeight write SetGridHeight;
    property ShowGrid: Boolean read FShowGrid write SetShowGrid;
    property OpenedDiagrams[Index: Integer]: PDiagram read GetOpenedDiagram;
    property OpenedDiagramCount: Integer read GetOpenedDiagramCount;
    property ActiveDiagramIndex: Integer read GetActiveDiagramIndex;
    property ActiveDiagram: PDiagram read GetActiveDiagram;
    property ActiveDiagramEditor: PDiagramEditor read FActiveDiagramEditor;
    property DiagramPopupMenu: TdxBarPopupMenu read FDiagramPopupMenu write FDiagramPopupMenu;
    property TabPopupMenu: TdxBarPopupMenu read FTabPopupMenu write FTabPopupMenu;
    property ImageList: TCustomImageList write SetImageList;
    property OnMouseUp: TMouseEvent read FOnMouseUp write FOnMouseUp;
    property OnMouseMove: TMouseMoveEvent read FOnMouseMove write FOnMouseMove;
    property OnMouseDown: TMouseEvent read FOnMouseDown write FOnMouseDown;
    property OnDragOver: PDiagramViewDragOverEvent read FOnDragOver write FOnDragOver;
    property OnDragDrop: PDiagramViewDragDropEvent read FOnDragDrop write FOnDragDrop;
    property OnDiagramOpen: PDiagramEvent read FOnDiagramOpen write FOnDiagramOpen;
    property OnDiagramClose: PDiagramEvent read FOnDiagramClose write FOnDiagramClose;
    property OnActiveDiagramEditorChanged: PDiagramEditorEvent read FOnActiveDiagramEditorChanged write FOnActiveDiagramEditorChanged;
    property OnViewMenuClicked: TNotifyEvent write FOnViewMenuClicked;

  end;


implementation

uses
  GraphicClasses, StarUMLApp;

{$R *.dfm}

constructor TWorkingAreaFrame.Create(AOwner: TComponent);
begin
  inherited;
  TabList := TList.Create;
  DiagramEditorList := TList.Create;
  FActiveDiagramEditor := nil;
  FDiagramPopupMenu := nil;
  FTabPopupMenu := nil;
  FDiagramWidth := 5000;
  FDiagramHeight := 5000;
  FGridWidth := 5;
  FGridHeight := 5;
  FShowGrid := True;

  FDiagramFromMenuItem := TDiagramFromMenuItem.Create(20);

end;

destructor TWorkingAreaFrame.Destroy;
begin
  TabList.Free;
  DiagramEditorList.Free;
  FDiagramFromMenuItem.Free;
  inherited;
end;

procedure TWorkingAreaFrame.DiagramEditorMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(FOnMouseUp) then FOnMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TWorkingAreaFrame.DiagramEditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(FOnMouseDown) then FOnMouseDown(Sender, Button, Shift, X, Y);
end;

procedure TWorkingAreaFrame.DiagramEditorMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(FOnMouseMove) then FOnMouseMove(Sender, Shift, X, Y);
end;

procedure TWorkingAreaFrame.DiagramEditorDragOver(Sender, Source: TObject; var Accept: Boolean; var Msg: string);
begin
  if Assigned(FOnDragOver) then FOnDragOver(Sender, Source, Accept, Msg);
end;

procedure TWorkingAreaFrame.DiagramEditorDragDrop(X, Y: Integer);
begin
  if Assigned(FOnDragDrop) then FOnDragDrop(X, Y);
end;

procedure TWorkingAreaFrame.SetDiagramWidth(Value: Integer);
var
  I: Integer;
  DE: PDiagramEditor;
begin
  if FDiagramWidth <> Value then
  begin
    FDiagramWidth := Value;
    for I := 0 to DiagramEditorList.Count - 1 do
    begin
      DE := DiagramEditorList.Items[I];
      DE.DiagramWidth := FDiagramWidth;
    end;
  end;
end;

procedure TWorkingAreaFrame.SetDiagramHeight(Value: Integer);
var
  I: Integer;
  DE: PDiagramEditor;
begin
  if FDiagramHeight <> Value then
  begin
    FDiagramHeight := Value;
    for I := 0 to DiagramEditorList.Count - 1 do
    begin
      DE := DiagramEditorList.Items[I];
      DE.DiagramHeight := FDiagramHeight;
    end;
  end;
end;

procedure TWorkingAreaFrame.SetGridWidth(Value: Integer);
var
  I: Integer;
  DE: PDiagramEditor;
begin
  if FGridWidth <> Value then
  begin
    FGridWidth := Value;
    for I := 0 to DiagramEditorList.Count - 1 do
    begin
      DE := DiagramEditorList.Items[I];
      DE.GridFactor := GridFactor(GridWidth, DE.GridFactor.Height);
    end;
  end;
end;

procedure TWorkingAreaFrame.SetGridHeight(Value: Integer);
var
  I: Integer;
  DE: PDiagramEditor;
begin
  if FGridHeight <> Value then
  begin
    FGridHeight := Value;
    for I := 0 to DiagramEditorList.Count - 1 do
    begin
      DE := DiagramEditorList.Items[I];
      DE.GridFactor := GridFactor(DE.GridFactor.Width, GridHeight);
    end;
  end;
end;

procedure TWorkingAreaFrame.SetShowGrid(Value: Boolean);
var
  I: Integer;
  DE: PDiagramEditor;
begin
  if FShowGrid <> Value then
  begin
    FShowGrid := Value;
    for I := 0 to DiagramEditorList.Count - 1 do
    begin
      DE := DiagramEditorList.Items[I];
      DE.ShowGrid := ShowGrid;
    end;
  end;
end;

function TWorkingAreaFrame.GetOpenedDiagram(Index: Integer): PDiagram;
var
  E: PDiagramEditor;
begin
  E := DiagramEditorList.Items[Index];
  Result := E.DiagramView.Diagram;
end;

function TWorkingAreaFrame.GetOpenedDiagramCount: Integer;
begin
  Result := DiagramEditorList.Count;
end;

procedure TWorkingAreaFrame.SetActiveDiagramEditor(Value: PDiagramEditor);
begin
  if {(Value <> nil) and} (FActiveDiagramEditor <> Value) then
  begin
    FActiveDiagramEditor := Value;
    if Assigned(FOnActiveDiagramEditorChanged) then
      FOnActiveDiagramEditorChanged(Self, FActiveDiagramEditor);
  end;
end;

function TWorkingAreaFrame.GetActiveDiagramIndex: Integer;
begin
  Result := DiagramEditorList.IndexOf(FActiveDiagramEditor)
end;

function TWorkingAreaFrame.GetActiveDiagram: PDiagram;
begin
  if FActiveDiagramEditor <> nil then
    Result := FActiveDiagramEditor.DiagramView.Diagram
  else
    Result := nil;
end;

function TWorkingAreaFrame.GetDiagramEditorOfTab(Tab: TTabSheet): PDiagramEditor;
var
  Idx: Integer;
begin
  Idx := TabList.IndexOf(Tab);
  if Idx > -1 then Result := DiagramEditorList.Items[Idx]
  else Result := nil;
end;

function TWorkingAreaFrame.GetDiagramEditorOfDiagram(ADiagram: PDiagram): PDiagramEditor;
var
  I: Integer;
  DE: PDiagramEditor;
begin
  for I := 0 to DiagramEditorList.Count - 1 do
  begin
    DE := DiagramEditorList.Items[I];
    if (DE <> nil) and (DE.DiagramView.Diagram = ADiagram) then
    begin
      Result := DE;
      Exit;
    end;
  end;
  Result := nil;
end;

function TWorkingAreaFrame.GetTabOfDiagram(ADiagram: PDiagram): TTabSheet;
var
  I, Idx: Integer;
  DE: PDiagramEditor;
begin
  Idx := -1;
  for I := 0 to DiagramEditorList.Count - 1 do begin
    DE := DiagramEditorList.Items[I];
    if DE.DiagramView = ADiagram.DiagramView then begin
      Idx := I;
      break;
    end;
  end;
  if Idx > -1 then Result := TabList.Items[Idx]
  else Result := nil;
end;

function TWorkingAreaFrame.GetDiagramOfTabIdx(TabIdx: Integer): PDiagram;
var
  DE: PDiagramEditor;
begin
  DE := DiagramEditorList.Items[TabIdx];
  Result := DE.DiagramView.Diagram;
end;

function TWorkingAreaFrame.AddDiagramEditor(ADiagram: PDiagram): PDiagramEditor;
var
  Tab: TTabSheet;
  DiagramEditor: PDiagramEditor;
begin
  // Making Tab.
  Tab := TTabSheet.Create(DiagramPageControl);
  Tab.Parent := DiagramPageControl;
  TabList.Add(Tab);
  // Making DiagramEditor.
  DiagramEditor := PDiagramEditor.Create(Tab, ADiagram.DiagramView);
  DiagramEditor.Parent := Tab;
  DiagramEditor.DiagramWidth := DiagramWidth;
  DiagramEditor.DiagramHeight := DiagramHeight;
  DiagramEditor.GridFactor := GridFactor(GridWidth, GridHeight);
  DiagramEditor.ShowGrid := ShowGrid;
  DiagramEditor.ScrollBox.Ctl3D := False;
  DiagramEditor.ScrollBox.BorderStyle := bsNone;
  DiagramEditor.OnMouseUp := DiagramEditorMouseUp;
  DiagramEditor.OnMouseDown := DiagramEditorMouseDown;
  DiagramEditor.OnMouseMove := DiagramEditorMouseMove;
  DiagramEditor.OnDragOver := DiagramEditorDragOver;
  DiagramEditor.OnDragDrop := DiagramEditorDragDrop;
  DiagramEditor.PopupMenu := FDiagramPopupMenu;
  DiagramEditor.MapButtonImage := MapButtonImage;
  DiagramEditorList.Add(DiagramEditor);
  // Initialze Tab.
  Tab.ImageIndex := DiagramEditor.DiagramImageIndex;
  Tab.Caption := ADiagram.Name;
  Tab.PageControl := DiagramPageControl;
  //Tab.OnContextPopup := TabPopupMenu;
  DiagramPageControl.ActivePage := Tab;
  Result := DiagramEditor;
end;

procedure TWorkingAreaFrame.RemoveDiagramEditor(ADiagramEditor: PDiagramEditor);
var
  Idx: Integer;
  Tab: TTabSheet;
begin
  Idx := DiagramEditorList.IndexOf(ADiagramEditor);
  if Idx > -1 then begin
    Tab := TabList.Items[Idx];
    DiagramEditorList.Delete(Idx);
    TabList.Delete(Idx);
    Tab.PageControl := nil;
    ADiagramEditor.DiagramView.Canvas := nil;
    ADiagramEditor.Free;
    Tab.Free;
  end;
end;

procedure TWorkingAreaFrame.SetImageList(Value: TCustomImageList);
begin
  DiagramPageControl.Images := Value;
  DiagramTabPopupMenu.Images := Value;
end;

procedure TWorkingAreaFrame.DiagramOpen(ADiagram: PDiagram);
begin
  if Assigned(FOnDiagramOpen) then
    FOnDiagramOpen(Self, ADiagram);
end;

procedure TWorkingAreaFrame.DiagramClose(ADiagram: PDiagram);
begin
  if Assigned(FOnDiagramClose) then
    FOnDiagramClose(Self, ADiagram);
end;

procedure TWorkingAreaFrame.OpenDiagram(ADiagram: PDiagram);
var
  Tab: TTabSheet;
begin
  Tab := GetTabOfDiagram(ADiagram);
  if Tab <> nil then begin
    if DiagramPageControl.ActivePage <> Tab then
    begin
      DiagramPageControl.ActivePage := Tab;
      UpdateActiveDiagramEditor;
      DiagramOpen(ADiagram);
    end;
  end
  else begin
    SetActiveDiagramEditor(AddDiagramEditor(ADiagram));
    //AddDiagramEditor(ADiagram);
    DiagramOpen(ADiagram);
  end;
end;

procedure TWorkingAreaFrame.CloseDiagram(ADiagram: PDiagram);
var
  DE: PDiagramEditor;
begin
  DE := GetDiagramEditorOfDiagram(ADiagram);
  if DE <> nil then
  begin
    DiagramClose(ADiagram);
    RemoveDiagramEditor(DE);
    UpdateActiveDiagramEditor;
  end;
end;

procedure TWorkingAreaFrame.CloseActiveDiagram;
begin
  if FActiveDiagramEditor <> nil then begin
    CloseDiagram(FActiveDiagramEditor.DiagramView.Diagram);
    //UpdateActiveDiagramEditor;
  end;
end;

procedure TWorkingAreaFrame.CloseAllDiagrams;
var
  I: Integer;
  DE: PDiagramEditor;
begin
  for I := TabList.Count - 1 downto 0 do
  begin
    DE := DiagramEditorList.Items[I];
    CloseDiagram(DE.DiagramView.Diagram);
  end;

  //UpdateActiveDiagramEditor;
end;

procedure TWorkingAreaFrame.UpdateAllDiagrams;
var
  I: Integer;
  D: PDiagram;
  MC: PMetaClass;
begin
  MC := MetaModel.FindMetaClass('Diagram');
  if MC <> nil then
  begin
    for I := 0 to MC.InclusiveInstanceCount - 1 do
    begin
      D := MC.InclusiveInstances[I] as PDiagram;
      D.DiagramView.Update;
    end;
  end;
end;

procedure TWorkingAreaFrame.UpdateActiveDiagram;
begin
  if (OpenedDiagramCount > 0) and
     ((FActiveDiagramEditor = nil) or
     (FActiveDiagramEditor.DiagramView = nil) or
     (FActiveDiagramEditor.DiagramView.Diagram = nil) or
     (FActiveDiagramEditor.DiagramView.MetaClass = nil)) then
  begin
    CloseActiveDiagram;
    Exit;
  end;
  if FActiveDiagramEditor <> nil then
    FActiveDiagramEditor.UpdateDiagramView;
end;

procedure TWorkingAreaFrame.RedrawActiveDiagram;
begin
  if FActiveDiagramEditor <> nil then
    FActiveDiagramEditor.RedrawDiagramView;
end;

procedure TWorkingAreaFrame.OpenAllDefaultDiagrams;
var
  I: Integer;
  D: PDiagram;
  MC: PMetaClass;
begin
  MC := MetaModel.FindMetaClass('Diagram');
  if MC <> nil then
  begin
    for I := 0 to MC.InclusiveInstanceCount - 1 do
    begin
      D := MC.InclusiveInstances[I] as PDiagram;
      if D.DefaultDiagram then
        OpenDiagram(D);
    end;
  end;
end;

procedure TWorkingAreaFrame.UpdateDiagramTabs;
var
  I: Integer;
  Tab: TTabSheet;
  DE: PDiagramEditor;
begin
  for I := 0 to TabList.Count - 1 do
  begin
    Tab := TabList.Items[I];
    DE := DiagramEditorList.Items[I];
    if Tab.Caption <> DE.DiagramView.Diagram.Name then
      Tab.Caption := DE.DiagramView.Diagram.Name;
  end;
end;

procedure TWorkingAreaFrame.DiagramPageControlChanging(Sender: TObject;
  var AllowChange: Boolean);
var
  DiagramEditor: PDiagramEditor;
begin

  //DiagramEditor := DiagramEditorList.Items[DiagramPageControl.TabIndex];
  //if DiagramEditor <> nil then
    //SetActiveDiagramEditor(DiagramEditor);
end;

procedure TWorkingAreaFrame.DiagramPageControlChange(Sender: TObject);
begin
  UpdateActiveDiagramEditor
end;

procedure TWorkingAreaFrame.DiagramPageControlContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  FLastContextSelectedTab := DiagramPageControl.IndexOfTabAt(MousePos.X,MousePos.Y);
  Handled := False;
end;

procedure TWorkingAreaFrame.ViewMenuClick(Sender: TObject);
begin
  if Sender = ViewCloseDiagram then begin
    CloseDiagram(GetDiagramOfTabIdx(FLastContextSelectedTab));
    //CloseActiveDiagram;
    //UpdateActiveDiagramEditor;
  end

  else if Sender = ViewCloseAllDiagrams then begin
    CloseAllDiagrams;
  end

  else if Sender = FormatLayoutDiagram then
    StarUMLApplication.LayoutActiveDiagramWithValidation;

  if Assigned(FOnViewMenuClicked) then
    FOnViewMenuClicked(Sender);
end;

procedure TWorkingAreaFrame.DiagramTabPopupMenuPopupHandler(Sender: TObject);
var
  I: Integer;
  D: PDiagram;
  NewMenuItem: TMenuItem;
begin
  ViewDiagramPages.Clear;
  FDiagramFromMenuItem.Clear;
  for I := 0 to OpenedDiagramCount - 1 do
  begin
    D := OpenedDiagrams[I];
    NewMenuItem := TMenuItem.Create(ViewDiagramPages);
    NewMenuItem.OnClick := ViewDiagramPagesClickHandler;
    NewMenuItem.RadioItem := True;
    NewMenuItem.Caption := D.Name + ' (' + ExtractTailPath(D.DiagramOwner.Pathname) + ')';
    FDiagramFromMenuItem.Add(NewMenuItem,D);
    ViewDiagramPages.Add(NewMenuItem);
    if ActiveDiagram = D then
      NewMenuItem.Checked := True;
  end;
end;

procedure TWorkingAreaFrame.ViewDiagramPagesClickHandler(Sender: TObject);
begin
  ExecuteViewDiagramPageList(Sender as TMenuItem);
  DiagramPageControlChange(Sender);
end;

procedure TWorkingAreaFrame.ExecuteViewDiagramPageList(ABarItem: TMenuItem);
begin
  OpenDiagram(FDiagramFromMenuItem[ABarItem]);
end;

procedure TWorkingAreaFrame.UpdateActiveDiagramEditor;
var
  ActiveDiagramEditor: PDiagramEditor;
begin
  if (DiagramEditorList.Count > 0) and
    (DiagramPageControl.TabIndex > -1) then begin
    ActiveDiagramEditor := DiagramEditorList.Items[DiagramPageControl.TabIndex];
  end
  else
    ActiveDiagramEditor := nil;

  SetActiveDiagramEditor(ActiveDiagramEditor);

end;

end.
