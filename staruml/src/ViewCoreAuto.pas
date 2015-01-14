unit ViewCoreAuto;

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

{$HINTS OFF}

uses
  GraphicClasses, BasicClasses, Core, CoreAuto, ViewCore, WhiteStarUML_TLB;

type
  // Forward Declaration
  PNodeViewAuto = class;
  PParasiticViewAuto = class;
  PEdgeParasiticViewAuto = class;
  PEdgeLabelViewAuto = class;
  PEdgeNodeViewAuto = class;
  PNodeParasiticViewAuto = class;
  PNodeLabelViewAuto = class;
  PNodeNodeViewAuto = class;
  PLabelViewAuto = class;
  PEdgeViewAuto = class;
  PPointsAuto = class;

  // Class Definitions
  // PNodeViewAuto
  PNodeViewAuto = class(PViewAuto, INodeView)
  protected
    function Get_Left: Integer; safecall;
    procedure Set_Left(Value: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(Value: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(Value: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(Value: Integer); safecall;
    function Get_MinWidth: Integer; safecall;
    function Get_MinHeight: Integer; safecall;
    function Get_AutoResize: WordBool; safecall;
    procedure Set_AutoResize(Value: WordBool); safecall;
  end;

  // PParasiticViewAuto
  PParasiticViewAuto = class(PNodeViewAuto, IParasiticView)
  protected
    function Get_Alpha: Double; safecall;
    procedure Set_Alpha(Value: Double); safecall;
    function Get_Distance: Double; safecall;
    procedure Set_Distance(Value: Double); safecall;
  end;

  // PEdgeParasiticViewAuto
  PEdgeParasiticViewAuto = class(PParasiticViewAuto, IEdgeParasiticView)
  protected
    function Get_EdgePosition: EdgePositionKind; safecall;
    function Get_HostEdge: IEdgeView; safecall;
  end;

  // PEdgeLabelViewAuto
  PEdgeLabelViewAuto = class(PEdgeParasiticViewAuto, IEdgeLabelView)
  protected
    function Get_Text: WideString; safecall;
  end;

  // PEdgeNodeViewAuto
  PEdgeNodeViewAuto = class(PEdgeParasiticViewAuto, IEdgeNodeView)
  protected
  end;

  // PNodeParasiticViewAuto
  PNodeParasiticViewAuto = class(PParasiticViewAuto, INodeParasiticView)
  protected
    function Get_HostNode: INodeView; safecall;
  end;

  // PNodeLabelViewAuto
  PNodeLabelViewAuto = class(PNodeParasiticViewAuto, INodeLabelView)
  protected
    function Get_Text: WideString; safecall;
  end;

  // PNodeNodeViewAuto
  PNodeNodeViewAuto = class(PNodeParasiticViewAuto, INodeNodeView)
  protected
  end;

  // PLabelViewAuto
  PLabelViewAuto = class(PNodeViewAuto, ILabelView)
  protected
    function Get_Text: WideString; safecall;
  end;

  // PEdgeViewAuto
  PEdgeViewAuto = class(PViewAuto, IEdgeView)
  private
    FPointsAuto: PPointsAuto;
  protected
    function Get_LineStyle: LineStyleKind; safecall;
    procedure Set_LineStyle(Value: LineStyleKind); safecall;
    function Get_Points: IPoints; safecall;
    function Get_Tail: IView; safecall;
    function Get_Head: IView; safecall;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

  // PPointsAuto
  PPointsAuto = class(PAutoObject, IPoints)
  private
    Points: PPoints;
    LockUpdate: Boolean;
    EdgeView: PEdgeView;
  protected
    procedure ClearPoints; safecall;
    procedure AddPoint(X: Integer; Y: Integer); safecall;
    procedure InsertPoint(Index: Integer; X: Integer; Y: Integer); safecall;
    procedure DeletePoint(Index: Integer); safecall;
    procedure BeginUpdate; safecall;
    procedure EndUpdate; safecall;
    function GetPointX(Index: Integer): Integer; safecall;
    function GetPointY(Index: Integer): Integer; safecall;
    function GetPointCount: Integer; safecall;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

implementation

uses
  StarUMLApp,
  Types, ComServ;

////////////////////////////////////////////////////////////////////////////////
// PNodeViewAuto

function PNodeViewAuto.Get_Left: Integer;
begin
  Result := (TheObject as PNodeView).Left;
end;

procedure PNodeViewAuto.Set_Left(Value: Integer);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'Left', IntegerToString(Value));
end;

function PNodeViewAuto.Get_Top: Integer;
begin
  Result := (TheObject as PNodeView).Top;
end;

procedure PNodeViewAuto.Set_Top(Value: Integer);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'Top', IntegerToString(Value));
end;

function PNodeViewAuto.Get_Width: Integer;
begin
  Result := (TheObject as PNodeView).Width;
end;

procedure PNodeViewAuto.Set_Width(Value: Integer);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'Width', IntegerToString(Value));
end;

function PNodeViewAuto.Get_Height: Integer;
begin
  Result := (TheObject as PNodeView).Height;
end;

procedure PNodeViewAuto.Set_Height(Value: Integer);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'Height', IntegerToString(Value));
end;

function PNodeViewAuto.Get_MinWidth: Integer;
begin
  Result := (TheObject as PNodeView).MinWidth;
end;

function PNodeViewAuto.Get_MinHeight: Integer;
begin
  Result := (TheObject as PNodeView).MinHeight;
end;

function PNodeViewAuto.Get_AutoResize: WordBool;
begin
  Result := (TheObject as PNodeView).AutoResize;
end;

procedure PNodeViewAuto.Set_AutoResize(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'AutoResize', BooleanToString(Value));
end;

// PNodeViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PParasiticViewAuto

function PParasiticViewAuto.Get_Alpha: Double;
begin
  Result := (TheObject as PParasiticView).Alpha;
end;

procedure PParasiticViewAuto.Set_Alpha(Value: Double);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'Alpha', RealToString(Value));
end;

function PParasiticViewAuto.Get_Distance: Double;
begin
  Result := (TheObject as PParasiticView).Distance;
end;

procedure PParasiticViewAuto.Set_Distance(Value: Double);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'Distance', RealToString(Value));
end;

// PParasiticViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PEdgeParasiticViewAuto

function PEdgeParasiticViewAuto.Get_EdgePosition: EdgePositionKind;
begin
  Result := Ord((TheObject as PEdgeParasiticView).EdgePosition);
end;

function PEdgeParasiticViewAuto.Get_HostEdge: IEdgeView;
var
  E: PEdgeView;
begin
  E := (TheObject as PEdgeParasiticView).HostEdge;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PEdgeViewAuto;
end;

// PEdgeParasiticViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PEdgeLabelViewAuto

function PEdgeLabelViewAuto.Get_Text: WideString;
begin
  Result := (TheObject as PEdgeLabelView).Text;
end;

// PEdgeLabelViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PEdgeNodeViewAuto

// PEdgeNodeViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PNodeParasiticViewAuto

function PNodeParasiticViewAuto.Get_HostNode: INodeView;
var
  E: PNodeView;
begin
  E := (TheObject as PNodeParasiticView).HostNode;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PNodeViewAuto;
end;

// PNodeParasiticViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PNodeLabelViewAuto

function PNodeLabelViewAuto.Get_Text: WideString;
begin
  Result := (TheObject as PNodeLabelView).Text;
end;

// PNodeLabelViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PNodeNodeViewAuto

// PNodeNodeViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PLabelViewAuto

function PLabelViewAuto.Get_Text: WideString;
begin
  Result := (TheObject as PLabelView).Text;
end;

// PLabelViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PEdgeViewAuto

function PEdgeViewAuto.Get_LineStyle: LineStyleKind;
begin
  Result := Ord((TheObject as PEdgeView).LineStyle);
end;

procedure PEdgeViewAuto.Set_LineStyle(Value: LineStyleKind);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'LineStyle', LineStyleKindToString(PLineStyleKind(Value)));
end;

function PEdgeViewAuto.Get_Points: IPoints;
begin
  if FPointsAuto = nil then begin
    FPointsAuto := PPointsAuto.Create(ComServer.TypeLib, IID_IPoints);
    FPointsAuto.EdgeView := TheObject as PEdgeView;
    FPointsAuto._AddRef;
  end;
  Result := FPointsAuto;
end;

function PEdgeViewAuto.Get_Tail: IView;
var
  E: PView;
begin
  E := (TheObject as PEdgeView).Tail;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PViewAuto;
end;

function PEdgeViewAuto.Get_Head: IView;
var
  E: PView;
begin
  E := (TheObject as PEdgeView).Head;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PViewAuto;
end;

procedure PEdgeViewAuto.AfterConstruction;
begin
  inherited;
  FPointsAuto := nil;
end;

procedure PEdgeViewAuto.BeforeDestruction;
begin
  if FPointsAuto <> nil then begin
    FPointsAuto._Release;
    FPointsAuto := nil;
  end;
  inherited;
end;

// PEdgeViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PPointsAuto

procedure PPointsAuto.ClearPoints;
var
  I: Integer;
begin
  if LockUpdate then
  begin
    Points.Clear;
  end
  else begin
    if EdgeView.Points.Count > 2 then begin
      Points.Clear;
      Points.Assign(EdgeView.Points);
      for I := EdgeView.Points.Count - 2 downto 1 do
        Points.Remove(I);
      StarUMLApplication.ReshapeEdge(EdgeView, Points);
    end;
  end;
end;

procedure PPointsAuto.AddPoint(X: Integer; Y: Integer);
begin
  if LockUpdate then
  begin
    Points.Add(Point(X, Y));
  end
  else begin
    Points.Clear;
    Points.Assign(EdgeView.Points);
    Points.Add(Point(X, Y));
    StarUMLApplication.ReshapeEdge(EdgeView, Points);
  end;
end;

procedure PPointsAuto.InsertPoint(Index: Integer; X: Integer; Y: Integer);
begin
  if LockUpdate then
  begin
    Points.Insert(Index, Point(X, Y));
  end
  else begin
    Points.Clear;
    Points.Assign(EdgeView.Points);
    Points.Insert(Index, Point(X, Y));
    StarUMLApplication.ReshapeEdge(EdgeView, Points);
  end;
end;

procedure PPointsAuto.DeletePoint(Index: Integer);
begin
  if LockUpdate then
  begin
    Points.Remove(Index);
  end
  else begin
    Points.Clear;
    Points.Assign(EdgeView.Points);
    Points.Remove(Index);
    StarUMLApplication.ReshapeEdge(EdgeView, Points);
  end;
end;

procedure PPointsAuto.BeginUpdate;
begin
  LockUpdate := True;
  Points.Clear;
  Points.Assign(EdgeView.Points);
end;

procedure PPointsAuto.EndUpdate;
begin
  LockUpdate := False;
  StarUMLApplication.ReshapeEdge(EdgeView, Points);
end;

function PPointsAuto.GetPointX(Index: Integer): Integer;
begin
  if LockUpdate then
    Result := Points.PointData[Index].X
  else
    Result := EdgeView.Points.PointData[Index].X;
end;

function PPointsAuto.GetPointY(Index: Integer): Integer;
begin
  if LockUpdate then
    Result := Points.PointData[Index].Y
  else
    Result := EdgeView.Points.PointData[Index].Y;
end;

function PPointsAuto.GetPointCount: Integer;
begin
  if LockUpdate then
    Result := Points.Count
  else
    Result := EdgeView.Points.Count;
end;

procedure PPointsAuto.AfterConstruction;
begin
  inherited;
  Points := PPoints.Create;
  LockUpdate := False;
end;

procedure PPointsAuto.BeforeDestruction;
begin
  Points.Free;
  inherited;
end;

// PPointsAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// AutomationClass Register Function

procedure RegisterAutomationClasses;
begin
  ClassRegistry.RegisterAutomationClass(PNodeView, PNodeViewAuto, IID_INodeView);
  ClassRegistry.RegisterAutomationClass(PParasiticView, PParasiticViewAuto, IID_IParasiticView);
  ClassRegistry.RegisterAutomationClass(PEdgeParasiticView, PEdgeParasiticViewAuto, IID_IEdgeParasiticView);
  ClassRegistry.RegisterAutomationClass(PEdgeLabelView, PEdgeLabelViewAuto, IID_IEdgeLabelView);
  ClassRegistry.RegisterAutomationClass(PEdgeNodeView, PEdgeNodeViewAuto, IID_IEdgeNodeView);
  ClassRegistry.RegisterAutomationClass(PNodeParasiticView, PNodeParasiticViewAuto, IID_INodeParasiticView);
  ClassRegistry.RegisterAutomationClass(PNodeLabelView, PNodeLabelViewAuto, IID_INodeLabelView);
  ClassRegistry.RegisterAutomationClass(PNodeNodeView, PNodeNodeViewAuto, IID_INodeNodeView);
  ClassRegistry.RegisterAutomationClass(PLabelView, PLabelViewAuto, IID_ILabelView);
  ClassRegistry.RegisterAutomationClass(PEdgeView, PEdgeViewAuto, IID_IEdgeView);
end;

// AutomationClass Register Function
////////////////////////////////////////////////////////////////////////////////

initialization
  RegisterAutomationClasses;
end.

