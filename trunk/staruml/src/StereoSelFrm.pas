unit StereoSelFrm;

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
  BasicClasses, Core, ExtCore, UMLModels,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, FlatPanel, ComCtrls;

type
  TStereotypeSelectorForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    DescLabel: TLabel;
    IconLabel: TLabel;
    IconPanel: TPanel;
    IconPreviewImage: TImage;
    StereotypeLabel: TLabel;
    DescPanel: TFlatPanel;
    DescMemo: TMemo;
    StereotypeEdit: TEdit;
    StereotypeListView: TListView;
    StereotypeTitleLabel: TLabel;
    Bevel: TBevel;
    HelpButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure StereotypeListViewSelectItem(Sender: TObject;
      Item: TListItem; Selected: Boolean);
    procedure StereotypeEditChange(Sender: TObject);
    procedure StereotypeEditKeyPress(Sender: TObject; var Key: Char);
    procedure StereotypeEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HelpButtonClick(Sender: TObject);
  private
    ModelSet: PExtensibleModelOrderedSet;
    FStereotypeName, FOldStereotypeName: string;
    FProfileName, FOldProfileName: string;
    AlphaKeyPressed: Boolean;
    EditLocked: Boolean;
    ListViewLocked: Boolean;
    procedure Initialize;
    procedure SetupStereotypeListView;
    procedure AddStereotypeToListView(AStereotype: string; AProfile: string);
    function GetStereotype: PStereotype;
    procedure SetStereotype(AStereotype, AProfile: string);
    procedure SelectStereotype(AStereotype, AProfile: string);
    procedure ShowStereotypeDescription(AProfile, AStereotype: string);
    procedure ShowStereotypeIcon(AProfile, AStereotype: string);
    procedure ScrollToSelectedItem;
    procedure UpdateUIState;
  public
    function Execute(AModelSet: PElementOrderedSet): Boolean;
    property ProfileName: string read FProfileName;
    property StereotypeName: string read FStereotypeName;
  end;

  // Utilities
  function CaretPos(Edit: TEdit): Integer;

var
  StereotypeSelectorForm: TStereotypeSelectorForm;

implementation

{$R *.dfm}

uses
  NLS, NLS_StarUML, HtmlHlp;

const
  DEFAULT_ICONSIZE = 90;
  EMF_FILE = '.emf';
  WMF_FILE = '.wmf';
  BMP_FILE = '.bmp';
  NO_PROFILE = '';

////////////////////////////////////////////////////////////////////////////////
// TStereotypeSelectorForm

procedure TStereotypeSelectorForm.FormCreate(Sender: TObject);
begin
  ModelSet := PExtensibleModelOrderedSet.Create;
  EditLocked := False;
  ListViewLocked := False;
  AlphaKeyPressed := False;
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\STERESEL.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

procedure TStereotypeSelectorForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ModelSet)
end;

procedure TStereotypeSelectorForm.Initialize;
var
  M: PExtensibleModel;
  S, P: string;
  FirstModel: Boolean;
begin
  // PRECONDITION
  Assert(not ModelSet.IsEmpty);
  // PRECONDITION

  // initialize user interface
  StereotypeEdit.Text := '';
  StereotypeListView.Clear;
  IconPreviewImage.Canvas.Brush.Color := clWhite;
  IconPreviewImage.Canvas.FillRect(Rect(0, 0, IconPreviewImage.Width, IconPreviewImage.Height));
  StereotypeTitleLabel.Caption := '';
  DescMemo.Text := '';

  // acquire stereotype name and profile name from parameters
  // clear them if not consistent over selected models
  FirstModel := True;
  for M in ModelSet do begin
    if FirstModel then begin
      S := M.StereotypeName;
      P := M.StereotypeProfile;
      if (M.StereotypeName = '') and (M.StereotypeProfile = '') then
        Break; // No need to continue the loop
      FirstModel := False;
    end
    else
    if (M.StereotypeName <> S) or (M.StereotypeProfile <> P) then begin
      S := '';  P := '';
      Break; // Inconsistency found
    end;
  end;

  FOldStereotypeName := S;
  FOldProfileName := P;

  FStereotypeName := S;
  FProfileName := P;

  // set up user interface by stereotype name and profile name
  SetupStereotypeListView;
  SetStereotype(FStereotypeName, FProfileName);
  SelectStereotype(FStereotypeName, FProfileName);
end;

procedure TStereotypeSelectorForm.SetupStereotypeListView;
var
  P: PProfile;
  S: PStereotype;
begin
  StereotypeListView.Clear;
  for P in ExtensionManager.IncludedProfiles do begin
    for S in P.Stereotypes do begin
      if S.CanApplyTo((ModelSet.Items[0]).MetaClass.Name) then
        AddStereotypeToListView(S.Name, S.Profile.Name);
    end;
  end;
  if (FStereotypeName <> '') and (GetStereotype = nil) then begin
    AddStereotypeToListView(FStereotypeName, FProfileName);
  end;
end;

procedure TStereotypeSelectorForm.AddStereotypeToListView(AStereotype: string; AProfile: string);
var
  S: PStereotype;
  L: TListItem;
begin
  if AStereotype = '' then Exit;

  L := StereotypeListView.Items.Add;
  L.Caption := AStereotype;
  if AProfile = '' then begin
    L.SubItems.Add(NO_PROFILE);
    L.SubItems.Add('');
    L.Data := nil;
  end
  else begin
    S := ExtensionManager.FindStereotype(AProfile, AStereotype, (ModelSet.Items[0]).MetaClass.Name);
    L.SubItems.Add('(' + AProfile + ')');
    L.SubItems.Add(AProfile);
    L.Data := S;  // can be nil
  end;
end;

function TStereotypeSelectorForm.GetStereotype: PStereotype;
begin
  Result := ExtensionManager.FindStereotype(FProfileName, FStereotypeName, (ModelSet.Items[0]).MetaClass.Name);
end;

procedure TStereotypeSelectorForm.SetStereotype(AStereotype, AProfile: string);
begin
  FStereotypeName := AStereotype;
  FProfileName := AProfile;
  ShowStereotypeDescription(FProfileName, FStereotypeName);
  ShowStereotypeIcon(FProfileName, FStereotypeName);
  UpdateUIState;
end;

procedure TStereotypeSelectorForm.SelectStereotype(AStereotype, AProfile: string);
var
  L: TListItem;
  I: Integer;
begin
  for I := 0 to StereotypeListView.Items.Count - 1 do begin
    L := StereotypeListView.Items.Item[I];
    if (L.Caption = AStereotype) and (L.SubItems[1] = AProfile) then begin
      L.Selected := True;
      L.Focused := True;
      ScrollToSelectedItem;
      UpdateUIState;
      Exit;
    end;
  end;
end;

procedure TStereotypeSelectorForm.ShowStereotypeDescription(AProfile, AStereotype: string);
var
  S: PStereotype;
begin
  if AStereotype = '' then begin
    StereotypeTitleLabel.Caption := TXT_NO_STEREOTYPE;
    DescMemo.Lines.Text := TXT_DESC_NO_STEREOTYPE;
  end
  else if AProfile = '' then begin
    StereotypeTitleLabel.Caption := AStereotype + ' ' + TXT_NOT_DEFINED_STEREOTYPE;
    DescMemo.Lines.Text := TXT_DESC_NOT_DEFINED_STEREOTYPE;
  end
  else begin
    StereotypeTitleLabel.Caption := AStereotype + ' (' + AProfile + ')';
    S := ExtensionManager.FindStereotype(AProfile, AStereotype, (ModelSet.Items[0]).MetaClass.Name);
    if S = nil then
      DescMemo.Lines.Text := TXT_DESC_PRIFILE_EXCLUDED_STEREOTYPE
    else
      DescMemo.Lines.Text := S.Description;
  end;
end;

procedure TStereotypeSelectorForm.ShowStereotypeIcon(AProfile, AStereotype: string);
var
  S: PStereotype;
  Icon: TGraphic;
  W, H: Integer;
  CX, CY: Integer;
  Ext: string;
  R: Integer;
begin
  IconPreviewImage.Canvas.Brush.Color := clWhite;
  IconPreviewImage.Canvas.FillRect(Rect(0, 0, IconPreviewImage.Width, IconPreviewImage.Height));

  S := ExtensionManager.FindStereotype(AProfile, AStereotype, (ModelSet.Items[0]).MetaClass.Name);
  if (S <> nil) and FileExists(S.IconFile) then begin
    Ext := LowerCase(ExtractFileExt(S.IconFile));
    Icon := nil;
    if (Ext = WMF_FILE) or (Ext = EMF_FILE) then
      Icon := TMetaFile.Create
    else if Ext = BMP_FILE then
      Icon := TBitmap.Create;
    if Icon <> nil then begin
      try
        Icon.LoadFromFile(S.IconFile);
        R := Icon.Width * 100 div Icon.Height;
        if R >= 100 then begin
          W := DEFAULT_ICONSIZE;
          H := DEFAULT_ICONSIZE * 100 div R;
        end
        else begin
          H := DEFAULT_ICONSIZE;
          W := DEFAULT_ICONSIZE * R div 100;
        end;
        CX := IconPreviewImage.Width div 2;
        CY := IconPreviewImage.Height div 2;
        IconPreviewImage.Canvas.StretchDraw(Rect(CX - W div 2, CY - H div 2, CX + W div 2, CY + H div 2), Icon);
      finally
        Icon.Free;
      end;
    end;
  end;
end;

procedure TStereotypeSelectorForm.ScrollToSelectedItem;
var
  ITop, CTop: Integer;
  IBottom, CBottom: Integer;
  H: Integer;
begin
  if StereotypeListView.Selected <> nil then begin
    H := StereotypeListView.Selected.DisplayRect(drBounds).Bottom
      - StereotypeListView.Selected.DisplayRect(drBounds).Top;
    ITop := StereotypeListView.Selected.Top;
    IBottom := ITop + H;
    CTop := StereotypeListView.TopItem.Top;
    CBottom := CTop + StereotypeListView.ClientHeight - H;
    if ITop < CTop then
      StereotypeListView.Scroll(0, ITop - CTop)
    else if IBottom > CBottom then
    StereotypeListView.Scroll(0, IBottom - CBottom);
  end;
end;

procedure TStereotypeSelectorForm.UpdateUIState;
begin
  if (FProfileName = '') and (FOldProfileName = '') then
    OkButton.Enabled := (FStereotypeName <> FOldStereotypeName)
  else
    OkButton.Enabled := (FStereotypeName <> FOldStereotypeName) or (FProfileName <> FOldProfileName);
end;

function TStereotypeSelectorForm.Execute(AModelSet: PElementOrderedSet): Boolean;
var
  Element: PElement;
  ParametersValid: Boolean;
begin
  ParametersValid := True; // Initial assumtion
  // check if parameter values are suitable for executing dialog
  if AModelSet.Count < 1 then
    ParametersValid := False
  else begin
    ModelSet.Clear;
    for Element in AModelSet do begin
      if (Element is PExtensibleModel) then
        ModelSet.Add(PExtensibleModel(Element))
      else begin
        ModelSet.Clear;
        ParametersValid := False;
        Break;
      end;
    end;
  end;

  if ParametersValid then begin
    Initialize; // initialize dialog form
    Result := (ShowModal = mrOk); // show dialog
  end
  else
    Result := False;
end;

// Event Handlers
procedure TStereotypeSelectorForm.StereotypeListViewSelectItem(
  Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  if (Item <> nil) and Selected then
    SetStereotype(Item.Caption, Item.SubItems[1]);

  if not ListViewLocked then begin
    EditLocked := True;
    if StereotypeListView.Selected <> nil then
      StereotypeEdit.Text := StereotypeListView.Selected.Caption;
    EditLocked := False;
  end;
end;

procedure TStereotypeSelectorForm.StereotypeEditChange(Sender: TObject);
var
  L: TListItem;
  W: Integer;
begin
  if (not EditLocked) then begin
    EditLocked := True;
    ListViewLocked := True;
    if AlphaKeyPressed then begin
      if StereotypeEdit.Text = '' then
        StereotypeListView.Selected := nil
      else begin
        L := StereotypeListView.FindCaption(0, StereotypeEdit.Text, True, True, True);
        StereotypeListView.Selected := L;
        StereotypeListView.ItemFocused := L;
        if L <> nil then begin
          W := CaretPos(StereotypeEdit);
          if W = Length(StereotypeEdit.Text) then begin
            StereotypeEdit.Text := StereotypeEdit.Text + Copy(L.Caption, W + 1, Length(L.Caption) - W);
            StereotypeEdit.SelStart := W;
            StereotypeEdit.SelLength := Length(L.Caption) - W;
            ScrollToSelectedItem;
          end;
        end;
      end;
    end
    else begin
      StereotypeListView.Selected := StereotypeListView.FindCaption(0, StereotypeEdit.Text, False, True, True);
      ScrollToSelectedItem;
    end;
    ListViewLocked := False;
    EditLocked := False;
  end;
  if StereotypeListView.Selected = nil then
    SetStereotype(StereotypeEdit.Text, '')
  else
    SetStereotype(StereotypeListView.Selected.Caption, StereotypeListView.Selected.SubItems[1]);
end;

procedure TStereotypeSelectorForm.StereotypeEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  AlphaKeyPressed := False;
end;

procedure TStereotypeSelectorForm.StereotypeEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  AlphaKeyPressed := (Key >= #32) and (Key <= #255);
end;

// TStereotypeSelectorForm
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Utilities

function CaretPos(Edit: TEdit): Integer;
var
  P: TPoint;
begin
  Windows.GetCaretPos(P);
  Result := SendMessage(Edit.Handle, EM_CHARFROMPOS, 0, MakeLong(P.X, P.Y));
end;

// Utilities
////////////////////////////////////////////////////////////////////////////////

procedure TStereotypeSelectorForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

end.
