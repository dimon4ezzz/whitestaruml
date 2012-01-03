unit PatternParamColEditForm;

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
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  PatternDef, WhiteStarUML_TLB;

type
  // PElemListItemWrapper
  PElemListItemWrapper = class
  private
    StarUMLElem: IUMLElement;
  public
    destructor Destroy; override;
  end;

  // TPatternParamColEditFrm
  TPatternParamColEditFrm = class(TForm)
    ElementListView: TListView;
    CloseButton: TButton;
    AddButton: TButton;
    RemoveButton: TButton;
    BasePanel: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure RemoveButtonClick(Sender: TObject);
  private
    FStarUMLApp: IStarUMLApplication;
    FElementList: TList;
    FElemKind: PPatternParameterElemKind;
    FElementSelectorCaption: string;
    function GetElement(Index: Integer): IUMLElement;
    function GetElementCount: Integer;
    procedure RemoveListItem(Value: PElemListItemWrapper);
  public
    Changed: Boolean;
    function Execute: Boolean;
    function AddElement(Value: IUMLElement): PElemListItemWrapper;
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
    property Element[Index: Integer]: IUMLElement read GetElement;
    property ElementCount: Integer read GetElementCount;
    property ElemKind: PPatternParameterElemKind read FElemKind write FElemKind;
    property ElementSelectorCaption: string write FElementSelectorCaption;
  end;

var
  PatternParamColEditFrm: TPatternParamColEditFrm;

implementation

uses
  NLS, NLS_PatternAddIn;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// PElemListItemWrapper

destructor PElemListItemWrapper.Destroy;
begin
  StarUMLElem := nil;
  inherited;
end;

// PElemListItemWrapper
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TPatternParamColEditFrm

function TPatternParamColEditFrm.GetElement(Index: Integer): IUMLElement;
var
  ListItem: PElemListItemWrapper;
begin
  Result := nil;
  ListItem := FElementList.Items[Index];
  if ListItem <> nil then Result := ListItem.StarUMLElem;
end;

function TPatternParamColEditFrm.GetElementCount: Integer;
begin
  Result := FElementList.Count;
end;

procedure TPatternParamColEditFrm.RemoveListItem(Value: PElemListItemWrapper);
var
  I: Integer;
  ListItem: PElemListItemWrapper;
begin
  for I := 0 to FElementList.Count - 1 do begin
    ListItem := FElementList.Items[I];
    if ListItem = Value then begin
      FElementList.Delete(I);
      ListItem.Free;
      Break;
    end;
  end;
end;

function TPatternParamColEditFrm.Execute: Boolean;
var
  ListItem: PElemListItemWrapper;
  ListViewItem: TListItem;
  I: Integer;
begin
  ElementListView.Clear;

  for I := 0 to FElementList.Count - 1 do begin
    ListItem := FElementList.Items[I];
    ListViewItem := ElementListView.Items.Add;
    ListViewItem.Caption := ListItem.StarUMLElem.Name;
    ListViewItem.Data := ListItem;
    ListViewItem.SubItems.Add(ListItem.StarUMLElem.Pathname);
  end;

  Result := (ShowModal = mrOK);
end;

function TPatternParamColEditFrm.AddElement(Value: IUMLElement): PElemListItemWrapper;
var
  ListItem: PElemListItemWrapper;
begin
  ListItem := PElemListItemWrapper.Create;
  ListItem.StarUMLElem := Value;
  FElementList.Add(ListItem);
  Result := ListItem;
end;

// TPatternParamColEditFrm
////////////////////////////////////////////////////////////////////////////////

procedure TPatternParamColEditFrm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(GetDllPath + '\' + NLS_FILE_NAME);
  NLSManager.TranslateComponent(Self, []);
  FElementList := TList.Create;
  Changed := False;
end;

procedure TPatternParamColEditFrm.FormDestroy(Sender: TObject);
var
  I: Integer;
  AWrapper: PElemListItemWrapper;
begin
  for I := FElementList.Count - 1 downto 0 do begin
    AWrapper := FElementList.Items[I];
    AWrapper.Free;
  end;
  FElementList.Free;
  StarUMLApp := nil;
end;

procedure TPatternParamColEditFrm.AddButtonClick(Sender: TObject);
var
  ElemSel: IElementSelector;
  Elem: IUMLElement;
  ListItem: PElemListItemWrapper;
  ListViewItem: TListItem;
  Str: string;
  I: Integer;
begin
  ElemSel := StarUMLApp.ElementSelector;
  ElemSel.AllowNull := False;
  // filtering
  if (ElemKind = pkPackage) or (ElemKind = pkModel) or (ElemKind = pkSubsystem)
  then ElemSel.Filter(fkPackages)
  else if (ElemKind = pkClass) or (ElemKind = pkInterface)
  then ElemSel.Filter(fkClassifiers)
  else ElemSel.Filter(fkAll);
  // set selectable model
  ElemSel.ClearSelectableModels;
  case ElemKind of
    pkPackage: ElemSel.AddSelectableModel('UMLPackage');
    pkModel: ElemSel.AddSelectableModel('UMLModel');
    pkSubsystem: ElemSel.AddSelectableModel('UMLSubsystem');
    pkClass: ElemSel.AddSelectableModel('UMLClass');
    pkInterface: ElemSel.AddSelectableModel('UMLInterface');
    pkAttribute: ElemSel.AddSelectableModel('UMLAttribute');
    pkOperation: ElemSel.AddSelectableModel('UMLOperation');
    pkLiteral: ElemSel.AddSelectableModel('UMLEnumerationLiteral');
    pkParameter: ElemSel.AddSelectableModel('UMLParameter');
  end;
  // execute
  Str := Format(TXT_SELECT_PARAM_ELEM_LIST, [FElementSelectorCaption]);
  if ElemSel.Execute(Str) then begin
    Elem := ElemSel.GetSelectedModel as IUMLElement;
    for I := 0 to ElementCount - 1 do begin
      if Element[I].Pathname = Elem.Pathname then Exit; 
    end;
    ListItem := AddElement(Elem);
    ListViewItem := ElementListView.Items.Add;
    ListViewItem.Caption := Elem.Name;
    ListViewItem.Data := ListItem;
    ListViewItem.SubItems.Add(Elem.Pathname);
    Changed := True;
  end;
end;

procedure TPatternParamColEditFrm.RemoveButtonClick(Sender: TObject);
var
  ListViewItem: TListItem;
  ListItem: PElemListItemWrapper;
begin
  ListViewItem := ElementListView.Selected;
  if ListViewItem <> nil then begin
    ListItem := ListViewItem.Data;
    RemoveListItem(ListItem);
    ElementListView.DeleteSelected;
    Changed := True;
  end;
end;

end.
