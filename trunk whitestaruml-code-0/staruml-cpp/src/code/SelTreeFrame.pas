unit SelTreeFrame;

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
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ElXPThemedControl, ElTree, WhiteStarUML_TLB;

type
  // PElementImageKind
  PElementImageKind = (ikProject, ikModel, ikSubsystem, ikPackage, ikClass, ikInterface, ikEnumeration);

  // PMetaTreeNode
  PMetaTreeNode = class(TObject)
  private
    FModelElement: IUMLModelElement;
    FElTreeItem: TElTreeitem;
  public
    constructor Create(Elem: IUMLModelElement);
    destructor Destroy; override;
    property ModelElement: IUMLModelElement read FModelElement write FModelElement;
    property ElTreeItem: TElTreeitem read FElTreeItem write FElTreeItem;
  end;

  // Event types
  PTVItemCheckedEvent = procedure (Sender: TObject) of object;
  PTVItemSelectedChangeEvent = procedure (Sender: TObject; Item: TElTreeItem) of object;

  // TSelectTreeFrame
  TSelectTreeFrame = class(TFrame)
    procedure SelectTreeItemChecked(Sender: TObject; Item: TElTreeItem);
    procedure SelectTreeItemSelectedChange(Sender: TObject;
      Item: TElTreeItem);
  published
    SelectTree: TElTree;
  private
    FRootElement: IUMLModelElement;
    FFilteredModels: TStringList;
    FSelectableModels: TStringList;
    FImages: TImageList;
    FShowRoot: Boolean;
    FShowRootCheckBox: Boolean;
    FAllowSingleCheckBox: Boolean;
    FOnTVItemChecked: PTVItemCheckedEvent;
    FOnTVItemSelectedChange: PTVItemSelectedChangeEvent;
  private
    procedure SetImages(Value: TImageList);
    function GetShowCheckBox: Boolean;
    procedure SetShowCheckBox(Value: Boolean);
    function GetCheckedItemCount: Integer;
    function GetSelectedItem: TElTreeItem;
  private
    function IsFiltered(const ElemKind: string): Boolean;
    procedure AddTreeNode(ParentNode: TElTreeItem; Elem: IUMLModelElement);
    function GetImageIndex(const ElemKind: string): Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Filter(const ElemKind: string); overload;
    procedure Filter(const ElemKind: array of string); overload;
    procedure AddSelectableModel(const ElemKind: string); overload; { unused }
    procedure AddSelectableModel(const ElemKind: array of string); overload; { unused }
    function IsSelectableModel(TN: TElTreeItem): Boolean;
    procedure ClearAll;
    procedure BuildTree;
    procedure SelectTreeNode(Elem: IModel);
    function GetFirstChecked: IUMLModelElement;
    function GetRootElement: IUMLModelElement;
    procedure CheckAll;
    procedure UncheckAll;
    procedure CheckAllChildren(TN: TElTreeItem);
    procedure UnCheckAllChildren(TN: TElTreeItem);
    procedure CheckParentAuto(TN: TElTreeItem);
    procedure UnCheckParentAuto(TN: TElTreeItem);
  public
    property RootElement: IUMLModelElement read FRootElement write FRootElement;
    property Images: TImageList read FImages write SetImages;
    property ShowRoot: Boolean read FShowRoot write FShowRoot;
    property ShowCheckBox: Boolean read GetShowCheckBox write SetShowCheckBox;
    property ShowRootCheckBox: Boolean read FShowRootCheckBox write FShowRootCheckBox;
    property AllowSingleCheckBox: Boolean read FAllowSingleCheckBox write FAllowSingleCheckBox;
    property CheckedItemCount: Integer read GetCheckedItemCount;
    property SelectedItem: TElTreeItem read GetSelectedItem;
    property OnTVItemChecked: PTVItemCheckedEvent read FOnTVItemChecked write FOnTVItemChecked;
    property OnTVItemSelectedChange: PTVItemSelectedChangeEvent read FOnTVItemSelectedChange
        write FOnTVItemSelectedChange;
  end;

implementation

uses
  Registry, XMLDoc, XMLIntf,
  Symbols;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// PMetaTreeNode

constructor PMetaTreeNode.Create(Elem: IUMLModelElement);
begin
  inherited Create;
  ModelElement := Elem;
  ElTreeItem := nil;
end;

destructor PMetaTreeNode.Destroy;
begin
  ModelElement := nil;
  ElTreeItem := nil;
  inherited;
end;

// PMetaTreeNode
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TSelectTreeFrame

constructor TSelectTreeFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRootElement := nil;
  FImages := nil;
  FShowRoot := True;
  FShowRootCheckBox := True;
  FAllowSingleCheckBox := False;
  FFilteredModels := TStringList.Create;
  FSelectableModels := TStringList.Create;
  Filter(ELEM_PROJECT);
end;

destructor TSelectTreeFrame.Destroy;
begin
  FRootElement := nil;
  FFilteredModels.Clear;
  FSelectableModels.Clear;
  FFilteredModels.Free;
  FSelectableModels.Free;
  inherited;
end;

procedure TSelectTreeFrame.SetImages(Value: TImageList);
begin
  if Assigned(Value) then begin
    FImages := Value;
    SelectTree.Images := Value;
  end;
end;

function TSelectTreeFrame.GetShowCheckBox: Boolean;
begin
  Result := SelectTree.ShowCheckboxes;
end;

procedure TSelectTreeFrame.SetShowCheckBox(Value: Boolean);
begin
  SelectTree.ShowCheckboxes := Value;
end;

function TSelectTreeFrame.GetCheckedItemCount: Integer;
var
  TN: TElTreeItem;
  I, C: Integer;  
begin
  C := 0;
  for I := 0 to SelectTree.Items.Count - 1 do begin
    TN := SelectTree.Items.Item[I];
    if TN.Checked then Inc(C);
  end;
  Result := C;
end;

function TSelectTreeFrame.GetSelectedItem: TElTreeItem;
begin
  Result := SelectTree.Selected;
end;

function TSelectTreeFrame.IsFiltered(const ElemKind: string): Boolean;
var
  I: Integer;
  Str: string;
begin
  Result := False;
  for I := 0 to FFilteredModels.Count - 1 do begin
    Str := FFilteredModels.Strings[I];
    if ElemKind = Str then begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TSelectTreeFrame.AddTreeNode(ParentNode: TElTreeItem; Elem: IUMLModelElement);
var
  Name: string;
  Meta: PMetaTreeNode;
  I: Integer;
  SubElem: IUMLModelElement;
  NS: IUMLNamespace;
  ElemKind: string;
  TN: TElTreeItem;
begin
  Name := Elem.Name;
  ElemKind := Elem.GetClassName;

  Meta := PMetaTreeNode.Create(Elem);
  TN := SelectTree.Items.AddChildObject(ParentNode, Name, Meta);
  Meta.ElTreeItem := TN;
  TN.ImageIndex := GetImageIndex(ElemKind);
  if ShowCheckBox then begin
    TN.ShowCheckBox := True;
    TN.CheckBoxEnabled := True;
    TN.CheckBoxType := ectCheckBox;
  end;
  //if (ParentNode <> nil) and (ParentNode.ShowCheckBox) then
  //  ParentNode.CheckBoxType := ect3SCheckBox;
  if Elem.IsKindOf(ELEM_NAMESPACE) and
     not (Elem.IsKindOf(ELEM_CLASS)) and
     not (Elem.IsKindOf(ELEM_INTERFACE)) then
  begin
    NS := Elem as IUMLNamespace;
    for I := 0 to NS.GetOwnedElementCount - 1 do begin
      SubElem := NS.GetOwnedElementAt(I);
      ElemKind := SubElem.GetClassName;
      if IsFiltered(ElemKind) then AddTreeNode(TN, SubElem);
    end;
  end;
end;

function TSelectTreeFrame.GetImageIndex(const ElemKind: string): Integer;
begin
  Result := -1;
       if ElemKind = ELEM_PROJECT   then Result := Ord(ikProject)
  else if ElemKind = ELEM_MODEL     then Result := Ord(ikModel)
  else if ElemKind = ELEM_SUBSYSTEM then Result := Ord(ikSubsystem)
  else if ElemKind = ELEM_PACKAGE   then Result := Ord(ikPackage)
  else if ElemKind = ELEM_CLASS     then Result := Ord(ikClass)
  else if ElemKind = ELEM_INTERFACE then Result := Ord(ikInterface)
  else if ElemKind = ELEM_ENUMERATION then Result := Ord(ikEnumeration);
end;

procedure TSelectTreeFrame.Filter(const ElemKind: string);
begin
  FFilteredModels.Add(ElemKind);
end;

procedure TSelectTreeFrame.Filter(const ElemKind: array of string);
var I: Integer;
begin
  for I := 0 to Length(ElemKind) - 1 do Filter(ElemKind[I]);
end;

procedure TSelectTreeFrame.AddSelectableModel(const ElemKind: string);
begin
  FSelectableModels.Add(ElemKind);
end;

procedure TSelectTreeFrame.AddSelectableModel(const ElemKind: array of string);
var I: Integer;
begin
  for I := 0 to Length(ElemKind) - 1 do AddSelectableModel(ElemKind[I]);
end;

function TSelectTreeFrame.IsSelectableModel(TN: TElTreeItem): Boolean;
var
  Meta: PMetaTreeNode;
  Mdl: IUMLModelElement;
  I: Integer;
  ElemKind, Str: string;
begin
  Result := False;

  Meta := TN.Data;
  if Meta <> nil then begin
    Mdl := Meta.ModelElement;
    if Mdl <> nil then begin
      ElemKind := Mdl.GetClassName;
      for I := 0 to FSelectableModels.Count - 1 do begin
        Str := FSelectableModels.Strings[I];
        if ElemKind = Str then begin
          Result := True;
          Break;
        end;
      end;
    end;
  end;
end;

procedure TSelectTreeFrame.ClearAll;
var
  I: Integer;
  TN: TElTreeItem;
  Meta: PMetaTreeNode;
begin
  SelectTree.Items.BeginUpdate;
  try
    for I := 0 to SelectTree.Items.Count - 1 do begin
      TN := SelectTree.Items.Item[I];
      Meta := TN.Data;
      if Meta <> nil then Meta.Free;
    end;
    SelectTree.Items.Clear;
    if RootElement <> nil then RootElement := nil; 
  finally
    SelectTree.Items.EndUpdate;
  end;
end;

procedure TSelectTreeFrame.BuildTree;
var
  I: Integer;
  Name: string;
  Meta: PMetaTreeNode;
  RootNode: TElTreeItem;
  Elem: IUMLModelElement;
  ElemKind: string;
  NS: IUMLNamespace;
begin
  if SelectTree.Items.Count > 0 then ClearAll;
  if RootElement = nil then Exit;
  RootNode := nil;
  
  SelectTree.Items.BeginUpdate;
  try
    if ShowRoot then begin
      Meta := PMetaTreeNode.Create(RootElement);
      ElemKind := RootElement.GetClassName;
      if ElemKind = ELEM_PROJECT then Name := (RootElement as IUMLProject).Title
      else Name := RootElement.Name;
      RootNode := SelectTree.Items.AddChildObject(nil, Name, Meta);
      Meta.ElTreeItem := RootNode;
      RootNode.ImageIndex := GetImageIndex(ElemKind);

      if ShowCheckBox and ShowRootCheckBox then begin
        RootNode.ShowCheckBox := True;
        RootNode.CheckBoxEnabled := True;
        RootNode.CheckBoxType := ectCheckBox;
      end;
    end;

    if RootElement.IsKindOf(ELEM_NAMESPACE) and
       not (RootElement.IsKindOf(ELEM_CLASS)) and
       not (RootElement.IsKindOf(ELEM_INTERFACE)) then
    begin
      NS := RootElement as IUMLNamespace;
      for I := 0 to NS.GetOwnedElementCount - 1 do begin
        Elem := NS.GetOwnedElementAt(I);
        ElemKind := Elem.GetClassName;
        if IsFiltered(ElemKind) then AddTreeNode(RootNode, Elem);
      end;
    end;
  finally
    SelectTree.Items.EndUpdate;
  end;
end;

procedure TSelectTreeFrame.SelectTreeNode(Elem: IModel);
var
  I: Integer;
  Meta: PMetaTreeNode;
  TN: TElTreeItem;
begin
  SelectTree.Selected := nil;
  if Elem = nil then Exit;
  for I := 0 to SelectTree.Items.Count - 1 do begin
    TN := SelectTree.Items.Item[I];
    Meta := TN.Data;
    if Meta.ModelElement.Pathname = Elem.Pathname then begin
      SelectTree.Selected := TN;
      if ShowCheckBox and TN.ShowCheckBox then begin
        if (AllowSingleCheckBox and (not TN.Checked)) then UncheckAll;
        TN.Checked := True;
      end;
      Break;
    end;
  end;
end;

function TSelectTreeFrame.GetFirstChecked: IUMLModelElement;
var
  I: Integer;
  Meta: PMetaTreeNode;
  TN: TElTreeItem;
begin
  Result := nil;

  for I := 0 to SelectTree.Items.Count - 1 do begin
    TN := SelectTree.Items.Item[I];
    if TN.Checked then begin
      Meta := TN.Data;
      if Assigned(Meta) then Result := Meta.ModelElement;
      Break;
    end;
  end;
end;

function TSelectTreeFrame.GetRootElement: IUMLModelElement;
var
  I: Integer;
  TN: TElTreeItem;
  Meta: PMetaTreeNode;
begin
  Result := nil;
  for I := 0 to SelectTree.Items.Count - 1 do begin
    TN := SelectTree.Items.Item[I];
    if TN.Parent = nil then begin
      Meta := TN.Data;
      if Assigned(Meta) then Result := Meta.ModelElement;
    end;
  end;
end;

procedure TSelectTreeFrame.CheckAll;
var
  I: Integer;
  TN: TElTreeItem;
begin
  SelectTree.Items.BeginUpdate;
  try
    for I := 0 to SelectTree.Items.Count - 1 do begin
      TN := SelectTree.Items.Item[I];
      if (TN.ShowCheckBox and (not TN.Checked)) then TN.Checked := True;
    end;
  finally
    SelectTree.Items.EndUpdate;
  end;
end;

procedure TSelectTreeFrame.UncheckAll;
var
  I: Integer;
  TN: TElTreeItem;
begin
  SelectTree.Items.BeginUpdate;
  try
    for I := 0 to SelectTree.Items.Count - 1 do begin
      TN := SelectTree.Items.Item[I];
      if (TN.ShowCheckBox and (TN.Checked)) then TN.Checked := False;
    end;
  finally
    SelectTree.Items.EndUpdate;
  end;
end;

procedure TSelectTreeFrame.CheckAllChildren(TN: TElTreeItem);
var
  I: Integer;
  SubTN: TElTreeItem;
begin
  SelectTree.Items.BeginUpdate;
  try
    for I := 0 to TN.Count - 1 do begin
      SubTN := TN.Item[I];
      if (SubTN.ShowCheckBox) and (not SubTN.Checked) then SubTN.Checked := True;
      if SubTN.HasChildren then CheckAllChildren(SubTN);
    end;
  finally
    SelectTree.Items.EndUpdate;
  end;
end;

procedure TSelectTreeFrame.UnCheckAllChildren(TN: TElTreeItem);
var
  I: Integer;
  SubTN: TElTreeItem;
begin
  SelectTree.Items.BeginUpdate;
  try
    for I := 0 to TN.Count - 1 do begin
      SubTN := TN.Item[I];
      if (SubTN.ShowCheckBox) and (SubTN.Checked) then SubTN.Checked := False;
      if SubTN.HasChildren then UnCheckAllChildren(SubTN);
    end;
  finally
    SelectTree.Items.EndUpdate;
  end;
end;

procedure TSelectTreeFrame.CheckParentAuto(TN: TElTreeItem);
var
  Parent: TElTreeItem;
begin
  Parent := TN.Parent;
  if (Parent <> nil) and
     (Parent.ShowCheckBox) and
     (not Parent.Checked) then
  begin
    SelectTree.Items.BeginUpdate;
    try
      Parent.Checked := True;
      CheckParentAuto(Parent);
    finally
      SelectTree.Items.EndUpdate;
    end;
  end;
end;

procedure TSelectTreeFrame.UnCheckParentAuto(TN: TElTreeItem);
var
  Parent: TElTreeItem;
  B: Boolean;
  I: Integer;
begin
  Parent := TN.Parent;
  B := True;
  if (Parent <> nil) and
     (Parent.ShowCheckBox) and
     (Parent.Checked) then
  begin
    SelectTree.Items.BeginUpdate;
    try
      for I := 0 to Parent.Count - 1 do begin
        if Parent.Item[I].Checked then begin
          B := False;
          Break;
        end;
      end;
      if B then Parent.Checked := False;
      UnCheckParentAuto(Parent);
    finally
      SelectTree.Items.EndUpdate;
    end;
  end;
end;

// TSelectTreeFrame
////////////////////////////////////////////////////////////////////////////////

procedure TSelectTreeFrame.SelectTreeItemChecked(Sender: TObject;
  Item: TElTreeItem);
begin
  { // unused
  if (AllowSingleCheckBox and Item.Checked) then begin
    SelectTree.Items.BeginUpdate;
    try
      UncheckAll;
      Item.Checked := True;
    finally
      SelectTree.Items.EndUpdate;
    end;
  end;
  }
  if Assigned(OnTVItemChecked) then OnTVItemChecked(Item);
end;

procedure TSelectTreeFrame.SelectTreeItemSelectedChange(Sender: TObject;
  Item: TElTreeItem);
begin
  if Assigned(OnTVItemSelectedChange) then OnTVItemSelectedChange(Sender, Item);
end;

end.
