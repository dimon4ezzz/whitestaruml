unit DocuEdt;

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

// =============================================================================
//
// GUI component development notice
// --------------------------------
//
//   (1) GUI component inherits from TCustomPanel.
//   (2) OnEnter, OnExit Event visibility is public.
//   (3) catch OnEnter, OnExit events of all controls in GUI component
//       forward to self's OnEnter, OnExit
//   (4) set BevelInner, BevelOuter to 'bvNone'
//
// =============================================================================

interface

uses
  Core,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, FlatPanel;

type
  // Event Types
  PDocumentationEvent = procedure(Sender: TObject; Element: PModel; Documentation: string) of Object;

  // TDocumentationEditor
  TDocumentationEditor = class(TFrame)
    DocumentationMemo: TMemo;
    ClientPanel: TFlatPanel;
    procedure DocumentationMemoEnter(Sender: TObject);
    procedure DocumentationMemoExit(Sender: TObject);
    procedure DocumentationMemoKeyPress(Sender: TObject; var Key: Char);
    procedure DocumentationMemoMouseLeave(Sender: TObject);
  private
    FInspectingElement: PModel;
    FMultiSelected: Boolean;
    FNothingSelected: Boolean;
    FOnDocumentationChange: PDocumentationEvent;
    FReadOnly: Boolean;
    procedure DocumentationChange;
    procedure SetInspectingElement(Value: PModel);
    procedure SetReadOnly(Value: Boolean);
  protected
    procedure SetEnabled(Value: Boolean); override;
  public
    procedure Inspect;
    procedure UpdateDocumentation;
    procedure ApplyChanges;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property InspectingElement: PModel read FInspectingElement write SetInspectingElement;
    property OnDocumentationChange: PDocumentationEvent read FOnDocumentationChange write FOnDocumentationChange;
  end;

implementation

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// PDocumentationEditor

procedure TDocumentationEditor.DocumentationMemoEnter(Sender: TObject);
begin
  if Assigned(OnEnter) then OnEnter(Sender);
end;

procedure TDocumentationEditor.DocumentationMemoExit(Sender: TObject);
begin
  DocumentationChange;
end;

procedure TDocumentationEditor.DocumentationChange;
begin
  if Assigned(FOnDocumentationChange) and Assigned(FInspectingElement) and
    (FInspectingElement.Documentation <> DocumentationMemo.Lines.Text) then
    FOnDocumentationChange(Self, FInspectingElement, DocumentationMemo.Lines.Text);
end;

procedure TDocumentationEditor.SetInspectingElement(Value: PModel);
begin
  if Visible then begin
    if FInspectingElement <> Value then
      FInspectingElement := Value;
  end
  else
    FInspectingElement := nil;
end;

procedure TDocumentationEditor.DocumentationMemoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #1 then
    DocumentationMemo.SelectAll;
end;

procedure TDocumentationEditor.DocumentationMemoMouseLeave(Sender: TObject);
begin
  ApplyChanges;
end;

procedure TDocumentationEditor.SetReadOnly(Value: Boolean);
begin
  FReadOnly := Value;
  DocumentationMemo.ReadOnly := Value;
end;

procedure TDocumentationEditor.SetEnabled(Value: Boolean);
begin
  inherited;
  DocumentationMemo.Enabled := Value;
  if Value then
    DocumentationMemo.Color := clWindow
  else
    DocumentationMemo.Color := clBtnFace;
end;

procedure TDocumentationEditor.Inspect;
begin
  if Visible then begin
    UpdateDocumentation;
  end;
end;

procedure TDocumentationEditor.UpdateDocumentation;
begin
  if Assigned(FInspectingElement) then begin
    DocumentationMemo.Lines.Text := FInspectingElement.Documentation;
    ReadOnly := FInspectingElement.ReadOnly
  end
  else
    ReadOnly := True;
end;

procedure TDocumentationEditor.ApplyChanges;
begin
  if Visible then
    DocumentationChange;
end;

// PDocumentationEditor
////////////////////////////////////////////////////////////////////////////////

end.
