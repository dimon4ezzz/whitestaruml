unit ColEdtFrm;

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
  Core,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, StdCtrls, ImgList, Menus;

type
  // Event Types
  PCollectionItemEvent = procedure(Sender: TObject; AOwner: PModel; ACollectionName: string; AModel: PModel) of object;
  PCollectionItemCreateEvent = procedure(Sender: TObject; AOwner: PModel; ACollectionName: string; AModelType: string; Argument: Integer = 0) of object;
  PCollectionItemOrderChangeEvent = procedure(Sender: TObject; AOwner: PModel; ACollectionName: string; AModel: PModel; NewIdx: Integer) of object;
  PCollectionItemNameChangeEvent = procedure(Sender: TObject; AModel: PModel; Value: string) of object;

  // Enumerations
  PCollectionKind = (ckNone, ckAttributes, ckOperations, ckParameters, ckTemplateParameters,
    ckExtensionPoints, ckLiterals, ckQualifiers, ckDeployedComponents, ckDeployedArtifacts,
    ckResidents, ckSlots, ckEntryActions, ckDoActivities, ckExitActions, ckRaisedSignals,
    ckEffects, ckTriggers, ckEnd1Qualifiers, ckEnd2Qualifiers, ckRelations);

  // TCollectionEdtForm
  TCollectionEditorForm = class(TForm)
    CollectionPageControl: TPageControl;
    AttributesPage: TTabSheet;
    OperationsPage: TTabSheet;
    TemplateParametersPage: TTabSheet;
    AttributesPanel: TPanel;
    CloseButton: TButton;
    AttributesListView: TListView;
    AttributesToolbar: TToolBar;
    AttributeInsert: TToolButton;
    AttributeDelete: TToolButton;
    AttributeMoveUp: TToolButton;
    AttributeMoveDown: TToolButton;
    OperationsPanel: TPanel;
    OperationsListView: TListView;
    OperationsToolbar: TToolBar;
    OperationInsert: TToolButton;
    OperationDelete: TToolButton;
    OperationMoveUp: TToolButton;
    OperationMoveDown: TToolButton;
    TemplateParametersPanel: TPanel;
    TemplateParametersListView: TListView;
    TemplateParametersToolbar: TToolBar;
    TemplateParameterInsert: TToolButton;
    TemplateParameterDelete: TToolButton;
    TemplateParameterMoveUp: TToolButton;
    TemplateParameterMoveDown: TToolButton;
    ParametersPage: TTabSheet;
    LiteralsPage: TTabSheet;
    QualifiersPage: TTabSheet;
    DeployedComponentsPage: TTabSheet;
    ResidentsPage: TTabSheet;
    EntryActionsPage: TTabSheet;
    DoActivitiesPage: TTabSheet;
    ExitActionsPage: TTabSheet;
    RaisedSignalsPage: TTabSheet;
    EffectsPage: TTabSheet;
    TriggersPage: TTabSheet;
    End1QualifiersPage: TTabSheet;
    End2QualifiersPage: TTabSheet;
    RelationsPage: TTabSheet;
    ParametersPanel: TPanel;
    ParametersListView: TListView;
    ParametersToolbar: TToolBar;
    ParameterInsert: TToolButton;
    ParameterDelete: TToolButton;
    ParameterMoveUp: TToolButton;
    ParameterMoveDown: TToolButton;
    LiteralsPanel: TPanel;
    LiteralsListView: TListView;
    LiteralsToolbar: TToolBar;
    LiteralInsert: TToolButton;
    LiteralDelete: TToolButton;
    LiteralMoveUp: TToolButton;
    LiteralMoveDown: TToolButton;
    QualifiersPanel: TPanel;
    QualifiersListView: TListView;
    QualifiersToolbar: TToolBar;
    QualifierInsert: TToolButton;
    QualifierDelete: TToolButton;
    QualifierMoveUp: TToolButton;
    QualifierMoveDown: TToolButton;
    DeployedComponentsPanel: TPanel;
    DeployedComponentsListView: TListView;
    DeployedComponentsToolbar: TToolBar;
    DeployedComponentInsert: TToolButton;
    DeployedComponentDelete: TToolButton;
    DeployedComponentMoveUp: TToolButton;
    DeployedComponentMoveDown: TToolButton;
    ResidentsPanel: TPanel;
    ResidentsListView: TListView;
    ResidentsToolbar: TToolBar;
    ResidentInsert: TToolButton;
    ResidentDelete: TToolButton;
    ResidentMoveUp: TToolButton;
    ResidentMoveDown: TToolButton;
    EntryActionsPanel: TPanel;
    EntryActionsListView: TListView;
    EntryActionsToolbar: TToolBar;
    EntryActionInsert: TToolButton;
    EntryActionDelete: TToolButton;
    EntryActionMoveUp: TToolButton;
    EntryActionMoveDown: TToolButton;
    DoActivitiesPanel: TPanel;
    DoActivitiesListView: TListView;
    DoActivitiesToolbar: TToolBar;
    DoActivityInsert: TToolButton;
    DoActivityDelete: TToolButton;
    DoActivityMoveUp: TToolButton;
    DoActivityMoveDown: TToolButton;
    ExitActionsPanel: TPanel;
    ExitActionsListView: TListView;
    ExitActionsToolbar: TToolBar;
    ExitActionInsert: TToolButton;
    ExitActionDelete: TToolButton;
    ExitActionMoveUp: TToolButton;
    ExitActionMoveDown: TToolButton;
    RaisedSignalsPanel: TPanel;
    RaisedSignalsListView: TListView;
    RaisedSignalsToolbar: TToolBar;
    RaisedSignalInsert: TToolButton;
    RaisedSignalDelete: TToolButton;
    RaisedSignalMoveUp: TToolButton;
    RaisedSignalMoveDown: TToolButton;
    EffectsPanel: TPanel;
    EffectsListView: TListView;
    EffectsToolbar: TToolBar;
    EffectInsert: TToolButton;
    EffectDelete: TToolButton;
    EffectMoveUp: TToolButton;
    EffectMoveDown: TToolButton;
    TriggersPanel: TPanel;
    TriggersListView: TListView;
    TriggersToolbar: TToolBar;
    SignalEventInsert: TToolButton;
    TriggerDelete: TToolButton;
    TriggerMoveUp: TToolButton;
    TriggerMoveDown: TToolButton;
    End1QualifiersPanel: TPanel;
    End1QualifiersListView: TListView;
    End1QualifiersToolbar: TToolBar;
    End1QualifierInsert: TToolButton;
    End1QualifierDelete: TToolButton;
    End1QualifierMoveUp: TToolButton;
    End1QualifierMoveDown: TToolButton;
    End2QualifiersPanel: TPanel;
    End2QualifiersListView: TListView;
    End2QualifiersToolbar: TToolBar;
    End2QualifierInsert: TToolButton;
    End2QualifierDelete: TToolButton;
    End2QualifierMoveUp: TToolButton;
    End2QualifierMoveDown: TToolButton;
    RelationsPanel: TPanel;
    RelationsListView: TListView;
    RelationsToolbar: TToolBar;
    RelationDelete: TToolButton;
    CallEventInsert: TToolButton;
    TimeEventInsert: TToolButton;
    ChangeEventInsert: TToolButton;
    CollectionEditorPopupMenu: TPopupMenu;
    InsertMenu: TMenuItem;
    InsertSignalEventMenu: TMenuItem;
    InsertCallEventMenu: TMenuItem;
    InsertChangeEventMenu: TMenuItem;
    InsertTimeEventMenu: TMenuItem;
    DeleteMenu: TMenuItem;
    MoveUpMenu: TMenuItem;
    MoveDownMenu: TMenuItem;
    EditNameMenu: TMenuItem;
    Seperator: TMenuItem;
    UndoMenu: TMenuItem;
    RedoMenu: TMenuItem;
    HelpButton: TButton;
    DeployedArtifactsPage: TTabSheet;
    DeployedArtifactsPanel: TPanel;
    DeployedArtifactsListView: TListView;
    DeployedArtifactsToolBar: TToolBar;
    DeployedArtifactInsert: TToolButton;
    DeployedArtifactDelete: TToolButton;
    DeployedArtifactMoveUp: TToolButton;
    DeployedArtifactMoveDown: TToolButton;
    SlotsPage: TTabSheet;
    SlotsPanel: TPanel;
    SlotsListView: TListView;
    SlotsToolBar: TToolBar;
    SlotInsert: TToolButton;
    SlotDelete: TToolButton;
    SlotMoveUp: TToolButton;
    SlotMoveDown: TToolButton;
    ExtensionPointsPage: TTabSheet;
    ExtensionPointsPanel: TPanel;
    ExtensionPointsListView: TListView;
    ExtensionPointsToolBar: TToolBar;
    ExtensionPointInsert: TToolButton;
    ExtensionPointDelete: TToolButton;
    ExtensionPointMoveUp: TToolButton;
    ExtensionPointMoveDown: TToolButton;
    // Event handlers
    procedure FormCreate(Sender: TObject);
    // Editing event handlers
    procedure HandleListViewSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure HandleUndoAction(Sender: TObject);
    procedure HandleRedoAction(Sender: TObject);
    procedure HandleEditNameAction(Sender: TObject);
    procedure HandleInsertAction(Sender: TObject);
    procedure HandleDeleteAction(Sender: TObject);
    procedure HandleMoveUpAction(Sender: TObject);
    procedure HandleMoveDownAction(Sender: TObject);
    procedure HandleListViewEditing(Sender: TObject; Item: TListItem; var AllowEdit: Boolean);
    procedure HandleListViewEdited(Sender: TObject; Item: TListItem; var S: string);
    procedure HandleListViewDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure HandleListViewEndDrag(Sender, Target: TObject; X, Y: Integer);
    // Element specific event handlers
    procedure HandleDeployedComponentInsertAction(Sender: TObject);
    procedure HandleDeployedArtifactInsertAction(Sender: TObject);
    procedure HandleResidentInsertAction(Sender: TObject);
    procedure HandleRaisedSignalInsertAction(Sender: TObject);
    procedure HandleRelationDeleteAction(Sender: TObject);
    // other event handlers
    procedure CloseButtonClick(Sender: TObject);
    procedure HandleListViewContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure CollectionPageControlChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
  private
    FModel: PModel;
    FReadOnly: Boolean;
    FShowNameOnly: Boolean;
    FShowStereotype: Boolean;
    FShowVisibilityIcon: Boolean;
    FImageList: TImageList;
    // Event variables
    FOnCollectionItemCreate: PCollectionItemCreateEvent;
    FOnCollectionItemDelete: PCollectionItemEvent;
    FOnCollectionItemAdd: PCollectionItemEvent;
    FOnCollectionItemRemove: PCollectionItemEvent;
    FOnCollectionItemOrderChange: PCollectionItemOrderChangeEvent;
    FOnCollectionItemSelected: PCollectionItemEvent;
    FOnCollectionItemNameChanged: PCollectionItemNameChangeEvent;

    procedure SetModel(AModel: PModel);
    procedure SetReadOnly(Value: Boolean);
    procedure SetShowNameOnly(Value: Boolean);
    procedure SetShowStereotype(Value: Boolean);
    procedure SetShowVisibilityIcon(Value: Boolean);

    function ActiveTabSheet: TTabSheet;
    function ActiveCollection: PCollectionKind;
    function GetCollectionOwner(Collection: PCollectionKind): PModel;
    function GetCollectionName(Collection: PCollectionKind): string;
    function GetCollectionListView(Collection: PCollectionKind): TListView;
    function GetCreatingModelType(Collection: PCollectionKind; Factor: TObject): string;
    function GetCreatingModelArgument(Collection: PCollectionKind; Factor: TObject): Integer;

    procedure ListItemEndEdit(L: TListView);
    procedure ComposePopupMenu(Collection: PCollectionKind);
    procedure UpdateCollectionListView(AModel: PModel; ACollectionName: string; AListView: TListView);

    // Relation listview update procedures
    procedure UpdateAssociationListItem(ListItem: TListItem);
    procedure UpdateAssociationClassListItem(ListItem: TListItem);
    procedure UpdateGeneralizationListItem(ListItem: TListItem);
    procedure UpdateDependencyListItem(ListItem: TListItem);
    procedure UpdateRealizationListItem(ListItem: TListItem);
    procedure UpdateIncludeListItem(ListItem: TListItem);
    procedure UpdateExtendListItem(ListItem: TListItem);
    procedure UpdateAssociationRoleListItem(ListItem: TListItem);
    procedure UpdateLinkListItem(ListItem: TListItem);
    procedure UpdateTransitionListItem(ListItem: TListItem);
    procedure UpdateConnectorListItem(ListItem: TListItem);
    procedure UpdateRelationItem(ListItem: TListItem);
    procedure UpdateRelationsListView(AModel: PModel; AListView: TListView);

    procedure HideAllTabSheets;
    procedure ShowTabSheetsByModel(AModel: PModel);
    procedure ClearAllListViews;
    procedure ActivateTabSheet(PageName: string);
    procedure SetSelectedListItem(AListView: TListView; Idx: Integer);

    procedure UpdateUIStatePage(Page: TTabSheet; ListView: TListView; InsertButtons: array of TToolButton;
      DeleteButton: TToolButton; MoveUpButton: TToolButton; MoveDownButton: TToolButton);
    procedure UpdateUIStateRelationsPage;
    procedure UpdatePopupMenuState;
    procedure UpdateUIStates;
    procedure UpdateFormTitle;

    procedure CreateCollectionItem(AOwner: PModel; ACollectionName: string; AModelType: string; Argument: Integer = 0);
    procedure DeleteCollectionItem(AOwner: PModel; ACollectionName: string; AModel: PModel);
    procedure AddCollectionItem(AOwner: PModel; ACollectionName: string; AModel: PModel);
    procedure RemoveCollectionItem(AOwner: PModel; ACollectionName: string; AModel: PModel);
    procedure ChangeCollectionItemOrder(AOwner: PModel; ACollectionName: string; AModel: PModel; NewIdx: Integer);
    procedure SelectCollectionItem(AOwner: PModel; ACollectionName: string; AModel: PModel);
    procedure ChangeCollectionItemName(AModel: PModel; Name: string);
  public
    procedure ShowCollection(AModel: PModel; ActivePage: string = '');
    procedure UpdateCollection;
    procedure ClearCollection;
    procedure Inspect;

    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property Model: PModel read FModel write SetModel;
    property ShowNameOnly: Boolean read FShowNameOnly write SetShowNameOnly;
    property ShowStereotype: Boolean read FShowStereotype write SetShowStereotype;
    property ShowVisibilityIcon: Boolean read FShowVisibilityIcon write SetShowVisibilityIcon;
    property ImageList: TImageList read FImageList write FImageList;

    // Event properties
    property OnCollectionItemCreate: PCollectionItemCreateEvent read FOnCollectionItemCreate write FOnCollectionItemCreate;
    property OnCollectionItemDelete: PCollectionItemEvent read FOnCollectionItemDelete write FOnCollectionItemDelete;
    property OnCollectionItemAdd: PCollectionItemEvent read FOnCollectionItemAdd write FOnCollectionItemAdd;
    property OnCollectionItemRemove: PCollectionItemEvent read FOnCollectionItemRemove write FOnCollectionItemRemove;
    property OnCollectionItemOrderChange: PCollectionItemOrderChangeEvent read FOnCollectionItemOrderChange write FOnCollectionItemOrderChange;
    property OnCollectionItemSelected: PCollectionItemEvent read FOnCollectionItemSelected write FOnCollectionItemSelected;
    property OnCollectionItemNameChanged: PCollectionItemNameChangeEvent read FOnCollectionItemNameChanged write FOnCollectionItemNameChanged;
  end;

var
  CollectionEditorForm: TCollectionEditorForm;

implementation

{$R *.dfm}

uses
  BasicClasses, UMLAux, UMLModels, StarUMLApp,
  ElemLstFrm, ElemSelFrm, ModelExplorerFrame,
  CommCtrl, HtmlHlp, NLS, NLS_StarUML;

////////////////////////////////////////////////////////////////////////////////
// TCollectionEdtForm

procedure TCollectionEditorForm.FormCreate(Sender: TObject);
begin
  FModel := nil;
  FShowNameOnly := False;
  FShowStereotype := True;
  FShowVisibilityIcon := True;
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\COLEDT.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

procedure TCollectionEditorForm.FormShow(Sender: TObject);
begin
  AttributesToolbar.Images := FImageList;
  OperationsToolbar.Images := FImageList;
  ParametersToolbar.Images := FImageList;
  TemplateParametersToolbar.Images := FImageList;
  LiteralsToolbar.Images := FImageList;
  ExtensionPointsToolbar.Images := FImageList;
  QualifiersToolbar.Images := FImageList;
  DeployedComponentsToolbar.Images := FImageList;
  DeployedArtifactsToolbar.Images := FImageList;
  ResidentsToolbar.Images := FImageList;
  SlotsToolbar.Images := FImageList;
  EntryActionsToolbar.Images := FImageList;
  DoActivitiesToolbar.Images := FImageList;
  ExitActionsToolbar.Images := FImageList;
  RaisedSignalsToolbar.Images := FImageList;
  EffectsToolbar.Images := FImageList;
  TriggersToolbar.Images := FImageList;
  End1QualifiersToolbar.Images := FImageList;
  End2QualifiersToolbar.Images := FImageList;
  RelationsToolbar.Images := FImageList;
  AttributesListView.SmallImages := FImageList;
  OperationsListView.SmallImages := FImageList;
  ParametersListView.SmallImages := FImageList;
  TemplateParametersListView.SmallImages := FImageList;
  LiteralsListView.SmallImages := FImageList;
  ExtensionPointsListView.SmallImages := FImageList;
  QualifiersListView.SmallImages := FImageList;
  DeployedComponentsListView.SmallImages := FImageList;
  DeployedArtifactsListView.SmallImages := FImageList;
  ResidentsListView.SmallImages := FImageList;
  SlotsListView.SmallImages := FImageList;
  EntryActionsListView.SmallImages := FImageList;
  DoActivitiesListView.SmallImages := FImageList;
  ExitActionsListView.SmallImages := FImageList;
  RaisedSignalsListView.SmallImages := FImageList;
  EffectsListView.SmallImages := FImageList;
  TriggersListView.SmallImages := FImageList;
  End1QualifiersListView.SmallImages := FImageList;
  End2QualifiersListView.SmallImages := FImageList;
  RelationsListView.SmallImages := FImageList;
end;

procedure TCollectionEditorForm.SetModel(AModel: PModel);
begin
  FModel := AModel;
end;

procedure TCollectionEditorForm.SetReadOnly(Value: Boolean);
begin
  FReadOnly := Value;
  UpdateUIStates;
end;

procedure TCollectionEditorForm.SetShowNameOnly(Value: Boolean);
begin
  FShowNameOnly := Value;
  UpdateCollection;
end;

procedure TCollectionEditorForm.SetShowStereotype(Value: Boolean);
begin
  FShowStereotype := Value;
  UpdateCollection;
end;

procedure TCollectionEditorForm.SetShowVisibilityIcon(Value: Boolean);
begin
  FShowVisibilityIcon := Value;
  UpdateCollection;
end;

function TCollectionEditorForm.ActiveTabSheet: TTabSheet;
begin
  Result := CollectionPageControl.ActivePage;
end;

function TCollectionEditorForm.ActiveCollection: PCollectionKind;
begin
  if ActiveTabSheet = nil then
    Result := ckNone
  else if ActiveTabSheet = AttributesPage then
    Result := ckAttributes
  else if ActiveTabSheet = OperationsPage then
    Result := ckOperations
  else if ActiveTabSheet = ParametersPage then
    Result := ckParameters
  else if ActiveTabSheet = TemplateParametersPage then
    Result := ckTemplateParameters
  else if ActiveTabSheet = LiteralsPage then
    Result := ckLiterals
  else if ActiveTabSheet = ExtensionPointsPage then
    Result := ckExtensionPoints
  else if ActiveTabSheet = QualifiersPage then
    Result := ckQualifiers
  else if ActiveTabSheet = DeployedComponentsPage then
    Result := ckDeployedComponents
  else if ActiveTabSheet = DeployedArtifactsPage then
    Result := ckDeployedArtifacts
  else if ActiveTabSheet = ResidentsPage then
    Result := ckResidents
  else if ActiveTabSheet = SlotsPage then
    Result := ckSlots
  else if ActiveTabSheet = EntryActionsPage then
    Result := ckEntryActions
  else if ActiveTabSheet = DoActivitiesPage then
    Result := ckDoActivities
  else if ActiveTabSheet = ExitActionsPage then
    Result := ckExitActions
  else if ActiveTabSheet = RaisedSignalsPage then
    Result := ckRaisedSignals
  else if ActiveTabSheet = EffectsPage then
    Result := ckEffects
  else if ActiveTabSheet = TriggersPage then
    Result := ckTriggers
  else if ActiveTabSheet = End1QualifiersPage then
    Result := ckEnd1Qualifiers
  else if ActiveTabSheet = End2QualifiersPage then
    Result := ckEnd2Qualifiers
  else if ActiveTabSheet = RelationsPage then
    Result := ckRelations
  else
    Result := ckRelations;
end;

function TCollectionEditorForm.GetCollectionOwner(Collection: PCollectionKind): PModel;
begin
  case Collection of
    ckEnd1Qualifiers: Result := (FModel as PUMLAssociation).Connections[0];
    ckEnd2Qualifiers: Result := (FModel as PUMLAssociation).Connections[1];
    else Result := FModel;
  end;
end;

function TCollectionEditorForm.GetCollectionName(Collection: PCollectionKind): string;
begin
  case Collection of
    ckNone: Result := '';
    ckAttributes: Result := 'Attributes';
    ckOperations: Result := 'Operations';
    ckParameters: Result := 'Parameters';
    ckTemplateParameters: Result := 'TemplateParameters';
    ckLiterals: Result := 'Literals';
    ckExtensionPoints: Result := 'ExtensionPoints';
    ckQualifiers: Result := 'Qualifiers';
    ckDeployedComponents: Result := 'DeployedComponents';
    ckDeployedArtifacts: Result := 'DeployedArtifacts';
    ckResidents: Result := 'Residents';
    ckSlots: Result := 'Slots';
    ckEntryActions: Result := 'EntryActions';
    ckDoActivities: Result := 'DoActivities';
    ckExitActions: Result := 'ExitActions';
    ckRaisedSignals: Result := 'RaisedSignals';
    ckEffects: Result := 'Effects';
    ckTriggers: Result := 'Triggers';
    ckEnd1Qualifiers: Result := 'Qualifiers';
    ckEnd2Qualifiers: Result := 'Qualifiers';
    ckRelations: Result := 'Relations';
    else Result := '';
  end;
end;

function TCollectionEditorForm.GetCollectionListView(Collection: PCollectionKind): TListView;
begin
  case Collection of
    ckNone: Result := nil;
    ckAttributes: Result := AttributesListView;
    ckOperations: Result := OperationsListView;
    ckParameters: Result := ParametersListView;
    ckTemplateParameters: Result := TemplateParametersListView;
    ckLiterals: Result := LiteralsListView;
    ckExtensionPoints: Result := ExtensionPointsListView;
    ckQualifiers: Result := QualifiersListView;
    ckDeployedComponents: Result := DeployedComponentsListView;
    ckDeployedArtifacts: Result := DeployedArtifactsListView;
    ckResidents: Result := ResidentsListView;
    ckSlots: Result := SlotsListView;
    ckEntryActions: Result := EntryActionsListView;
    ckDoActivities: Result := DoActivitiesListView;
    ckExitActions: Result := ExitActionsListView;
    ckRaisedSignals: Result := RaisedSignalsListView;
    ckEffects: Result := EffectsListView;
    ckTriggers: Result := TriggersListView;
    ckEnd1Qualifiers: Result := End1QualifiersListView;
    ckEnd2Qualifiers: Result := End2QualifiersListView;
    ckRelations: Result := RelationsListView;
    else Result := nil;
  end;
end;

function TCollectionEditorForm.GetCreatingModelType(Collection: PCollectionKind; Factor: TObject): string;
begin
  Result := '';
  case Collection of
    ckAttributes: Result := 'Attribute';
    ckOperations: Result := 'Operation';
    ckParameters: Result := 'Parameter';
    ckTemplateParameters: Result := 'TemplateParameter';
    ckLiterals: Result := 'EnumerationLiteral';
    ckExtensionPoints: Result := 'ExtensionPoint';
    ckQualifiers: Result := 'Attribute';
    ckSlots: Result := 'AttributeLink';
    ckEntryActions: Result := 'UninterpretedAction';
    ckDoActivities: Result := 'UninterpretedAction';
    ckExitActions: Result := 'UninterpretedAction';
    ckEffects: Result := 'UninterpretedAction';
    ckTriggers:
      begin
        if (Factor = SignalEventInsert) or (Factor = InsertSignalEventMenu) then
          Result := 'SignalEvent'
        else if (Factor = CallEventInsert) or (Factor = InsertCallEventMenu) then
          Result := 'CallEvent'
        else if (Factor = TimeEventInsert) or (Factor = InsertTimeEventMenu) then
          Result := 'TimeEvent'
        else if (Factor = ChangeEventInsert) or (Factor = InsertChangeEventMenu) then
          Result := 'ChangeEvent'
      end;
    ckEnd1Qualifiers: Result := 'Attribute';
    ckEnd2Qualifiers: Result := 'Attribute';
    // not available following.
    // ckNone, ckDeployedComponents, ckDeployedArtifacts, ckResidents, ckRaisedSignals, ckRelations;
  end;
end;

function TCollectionEditorForm.GetCreatingModelArgument(Collection: PCollectionKind; Factor: TObject): Integer;
begin
  Result := 0;
  case Collection of
    ckEntryActions: Result := 0;
    ckDoActivities: Result := 1;
    ckExitActions: Result := 2;
  end;
end;

procedure TCollectionEditorForm.ListItemEndEdit(L: TListView);
var
  C: TWinControl;
begin
  C := ActiveControl;
  if L.IsEditing then
    CloseButton.SetFocus;
  C.SetFocus;
end;

procedure TCollectionEditorForm.ComposePopupMenu(Collection: PCollectionKind);
  procedure SetMenuItemVisible(MenuItems: array of TMenuItem);
  var
    I: Integer;
  begin
    for I := 0 to CollectionEditorPopupMenu.Items.Count - 1 do
      CollectionEditorPopupMenu.Items.Items[I].Visible := False;
    for I := 0 to Length(MenuItems) - 1 do
      MenuItems[I].Visible := True;
  end;
begin
  case Collection of
    ckNone: SetMenuItemVisible([]);
    ckTriggers: SetMenuItemVisible([UndoMenu, RedoMenu, EditNameMenu, Seperator,
        InsertSignalEventMenu, InsertCallEventMenu, InsertTimeEventMenu,
        InsertChangeEventMenu, DeleteMenu, MoveUpMenu, MoveDownMenu]);
    ckRelations: SetMenuItemVisible([UndoMenu, RedoMenu, EditNameMenu, Seperator, DeleteMenu]);
    else SetMenuItemVisible([UndoMenu, RedoMenu, EditNameMenu, Seperator,
      InsertMenu, DeleteMenu, MoveUpMenu, MoveDownMenu]);
  end;
end;

procedure TCollectionEditorForm.UpdateCollectionListView(AModel: PModel; ACollectionName: string; AListView: TListView);
var
  M: PUMLElement;
  L, NL: TListItem;
  S: Boolean;
  I: Integer;
begin
  if AModel = nil then Exit;

  AListView.Items.BeginUpdate;
  for I := 0 to AModel.MOF_GetCollectionCount(ACollectionName) - 1 do begin
    // ASSERTION
    Assert(AModel.MOF_GetCollectionItem(ACollectionName, I) is PUMLElement);
    // ASSERTION
    M := AModel.MOF_GetCollectionItem(ACollectionName, I) as PUMLElement;

    if (AListView.Items.Count - 1 >= I) and (AListView.Items.Item[I].Data = M) then begin
      AListView.Items[I].Caption := UMLElementToExpression(M, FShowStereotype, not FShowVisibilityIcon, False, not FShowNameOnly);
      AListView.Items[I].ImageIndex := GetUMLElementImageIndex(M);
    end
    else begin
      S := False;
      L := AListView.FindData(I, M, False, False);
      if L <> nil then begin
        S := L.Selected;
        AListView.Items.Delete(AListView.Items.IndexOf(L));
      end;
      NL := AListView.Items.Insert(I);
      NL.Caption := UMLElementToExpression(M, FShowStereotype, not FShowVisibilityIcon, False, not FShowNameOnly);
      NL.Data := M;
      NL.ImageIndex := GetUMLElementImageIndex(M);
      NL.Selected := S;
      NL.Focused := S;
    end;
  end;
  for I := AListView.Items.Count - 1 downto AModel.MOF_GetCollectionCount(ACollectionName) do
    AListView.Items.Delete(I);
  if AListView.Selected = nil then
    AListView.ItemFocused := nil;
  AListView.Items.EndUpdate;
end;

procedure TCollectionEditorForm.UpdateAssociationListItem(ListItem: TListItem);
var
  Association: PUMLAssociation;
begin
  // PRECONDITION
  Assert(ListItem <> nil);
  Assert(ListItem.Data <> nil);
  // PRECONDITION
  Association := ListItem.Data;
  ListItem.SubItems.Clear;
  if Association.Name = '' then
    ListItem.Caption := '(Association)'
  else
    ListItem.Caption := Association.Name;
  if Association.StereotypeName <> '' then
    ListItem.Caption := '<<' + Association.StereotypeName + '>>' + ListItem.Caption;
  ListItem.ImageIndex := IMG_INDEX_ASSOCIATION;
  if Association.Connections[0].Participant = FModel then begin
    if Association.Connections[0].Name = '' then
      ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME)
    else
      ListItem.SubItems.Add(Association.Connections[0].Name);
    if Association.Connections[1].Participant <> nil then begin
      if Association.Connections[1].Name = '' then
        ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME + ' : ' + Association.Connections[1].Participant.Name)
      else
        ListItem.SubItems.Add(Association.Connections[1].Name + ' : ' + Association.Connections[1].Participant.Name)
    end;
  end
  else if Association.Connections[1].Participant = FModel then begin
    if Association.Connections[1].Name = '' then
      ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME)
    else
      ListItem.SubItems.Add(Association.Connections[1].Name);
    if Association.Connections[0].Participant <> nil then begin
      if Association.Connections[0].Name = '' then
        ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME + ' : ' + Association.Connections[0].Participant.Name)
      else
        ListItem.SubItems.Add(Association.Connections[0].Name + ' : ' + Association.Connections[0].Participant.Name)
    end;
  end;
end;

procedure TCollectionEditorForm.UpdateAssociationClassListItem(ListItem: TListItem);

  function GetAssociationStr(Assoc: PUMLAssociation): string;
  var
    S: string;
  begin
    S := Assoc.Name + '(';
    if Assoc.Connections[0] <> nil then
      S := S + Assoc.Connections[0].Participant.Name;
    S := S + ':';
    if Assoc.Connections[1] <> nil then
      S := S + Assoc.Connections[1].Participant.Name;
    S := S + ')';
    Result := S;
  end;

var
  AssociationClass: PUMLAssociationClass;
begin
  // PRECONDITION
  Assert(ListItem <> nil);
  Assert(ListItem.Data <> nil);
  // PRECONDITION
  // PRECONDITION
  AssociationClass := ListItem.Data;
  ListItem.SubItems.Clear;
  if AssociationClass.Name = '' then
    ListItem.Caption := '(AssociationClass)'
  else
    ListItem.Caption := AssociationClass.Name;
  if AssociationClass.StereotypeName <> '' then
    ListItem.Caption := '<<' + AssociationClass.StereotypeName + '>>' + ListItem.Caption;
  ListItem.ImageIndex := IMG_INDEX_ASSOCIATIONCLASS;
  if AssociationClass.ClassSide = FModel then begin
    ListItem.SubItems.Add('Class');
    if AssociationClass.AssociationSide <> nil then
      ListItem.SubItems.Add('Association : ' + GetAssociationStr(AssociationClass.AssociationSide));
  end
  else if AssociationClass.AssociationSide = FModel then begin
    ListItem.SubItems.Add('Association');
    if AssociationClass.ClassSide <> nil then
      ListItem.SubItems.Add('Class : ' + AssociationClass.ClassSide.Name);
  end;
end;

procedure TCollectionEditorForm.UpdateGeneralizationListItem(ListItem: TListItem);
var
  Generalization: PUMLGeneralization;
begin
  // PRECONDITION
  Assert(ListItem <> nil);
  Assert(ListItem.Data <> nil);
  // PRECONDITION
  Generalization := ListItem.Data;
  ListItem.SubItems.Clear;
  if Generalization.Name = '' then
    ListItem.Caption := '(Generalization)'
  else
    ListItem.Caption := Generalization.Name;
  if Generalization.StereotypeName <> '' then
    ListItem.Caption := '<<' + Generalization.StereotypeName + '>>' + ListItem.Caption;
  ListItem.ImageIndex := IMG_INDEX_GENERALIZATION;
  if Generalization.Parent = FModel then begin
    ListItem.SubItems.Add('Parent');
    if Generalization.Child <> nil then
      ListItem.SubItems.Add('Child : ' + Generalization.Child.Name);
  end
  else if Generalization.Child = FModel then begin
    ListItem.SubItems.Add('Child');
    if Generalization.Parent <> nil then
      ListItem.SubItems.Add('Parent : ' + Generalization.Parent.Name);
  end;
end;

procedure TCollectionEditorForm.UpdateDependencyListItem(ListItem: TListItem);
var
  Dependency: PUMLDependency;
begin
  // PRECONDITION
  Assert(ListItem <> nil);
  Assert(ListItem.Data <> nil);
  // PRECONDITION
  Dependency := ListItem.Data;
  ListItem.SubItems.Clear;
  if Dependency.Name = '' then
    ListItem.Caption := '(Dependency)'
  else
    ListItem.Caption := Dependency.Name;
  if Dependency.StereotypeName <> '' then
    ListItem.Caption := '<<' + Dependency.StereotypeName + '>>' + ListItem.Caption;
  ListItem.ImageIndex := IMG_INDEX_DEPENDENCY;
  if Dependency.Supplier = FModel then begin
    ListItem.SubItems.Add('Supplier');
    if Dependency.Client <> nil then
      ListItem.SubItems.Add('Client : ' + Dependency.Client.Name);
  end
  else if Dependency.Client = FModel then begin
    ListItem.SubItems.Add('Client');
    if Dependency.Supplier <> nil then
      ListItem.SubItems.Add('Supplier : ' + Dependency.Supplier.Name);
  end;
end;

procedure TCollectionEditorForm.UpdateRealizationListItem(ListItem: TListItem);
var
  Realization: PUMLRealization;
begin
  // PRECONDITION
  Assert(ListItem <> nil);
  Assert(ListItem.Data <> nil);
  // PRECONDITION
  Realization := ListItem.Data;
  ListItem.SubItems.Clear;
  if Realization.Name = '' then
    ListItem.Caption := '(Realization)'
  else
    ListItem.Caption := Realization.Name;
  if Realization.StereotypeName <> '' then
    ListItem.Caption := '<<' + Realization.StereotypeName + '>>' + ListItem.Caption;
  ListItem.ImageIndex := IMG_INDEX_REALIZATION;
  if Realization.Supplier = FModel then begin
    ListItem.SubItems.Add('Specification');
    if Realization.Client <> nil then
      ListItem.SubItems.Add('Implementation : ' + Realization.Client.Name);
  end
  else if Realization.Client = FModel then begin
    ListItem.SubItems.Add('Implementation');
    if Realization.Supplier <> nil then
      ListItem.SubItems.Add('Specification : ' + Realization.Supplier.Name);
  end;
end;

procedure TCollectionEditorForm.UpdateIncludeListItem(ListItem: TListItem);
var
  Include: PUMLInclude;
begin
  // PRECONDITION
  Assert(ListItem <> nil);
  Assert(ListItem.Data <> nil);
  // PRECONDITION
  Include := ListItem.Data;
  ListItem.SubItems.Clear;
  if Include.Name = '' then
    ListItem.Caption := '(Include)'
  else
    ListItem.Caption := Include.Name;
  if Include.StereotypeName <> '' then
    ListItem.Caption := '<<' + Include.StereotypeName + '>>' + ListItem.Caption;
  ListItem.ImageIndex := IMG_INDEX_INCLUDE;
  if Include.Base = FModel then begin
    ListItem.SubItems.Add('Base');
    if Include.Addition <> nil then
      ListItem.SubItems.Add('Addition : ' + Include.Addition.Name);
  end
  else if Include.Addition = FModel then begin
    ListItem.SubItems.Add('Addition');
    if Include.Base <> nil then
      ListItem.SubItems.Add('Base : ' + Include.Base.Name);
  end;
end;

procedure TCollectionEditorForm.UpdateExtendListItem(ListItem: TListItem);
var
  Extend: PUMLExtend;
begin
  // PRECONDITION
  Assert(ListItem <> nil);
  Assert(ListItem.Data <> nil);
  // PRECONDITION
  Extend := ListItem.Data;
  ListItem.SubItems.Clear;
  if Extend.Name = '' then
    ListItem.Caption := '(Extend)'
  else
    ListItem.Caption := Extend.Name;
  if Extend.StereotypeName <> '' then
    ListItem.Caption := '<<' + Extend.StereotypeName + '>>' + ListItem.Caption;
  ListItem.ImageIndex := IMG_INDEX_EXTEND;
  if Extend.Base = FModel then begin
    ListItem.SubItems.Add('Base');
    if Extend.Extension <> nil then
      ListItem.SubItems.Add('Extension : ' + Extend.Extension.Name);
  end
  else if Extend.Extension = FModel then begin
    ListItem.SubItems.Add('Extension');
    if Extend.Base <> nil then
      ListItem.SubItems.Add('Base  : ' + Extend.Base.Name);
  end;
end;

procedure TCollectionEditorForm.UpdateAssociationRoleListItem(ListItem: TListItem);
var
  AssociationRole: PUMLAssociationRole;
begin
  // PRECONDITION
  Assert(ListItem <> nil);
  Assert(ListItem.Data <> nil);
  // PRECONDITION
  AssociationRole := ListItem.Data;
  ListItem.SubItems.Clear;
  if AssociationRole.Name = '' then
    ListItem.Caption := '(AssociationRole)'
  else
    ListItem.Caption := AssociationRole.Name;
  if AssociationRole.StereotypeName <> '' then
    ListItem.Caption := '<<' + AssociationRole.StereotypeName + '>>' + ListItem.Caption;
  ListItem.ImageIndex := IMG_INDEX_ASSOCIATIONROLE;
  if AssociationRole.Connections[0].Participant = FModel then begin
    if AssociationRole.Connections[0].Name = '' then
      ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME)
    else
      ListItem.SubItems.Add(AssociationRole.Connections[0].Name);
    if AssociationRole.Connections[1].Participant <> nil then begin
      if AssociationRole.Connections[1].Name = '' then
        ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME + ' : ' + AssociationRole.Connections[1].Participant.Name)
      else
        ListItem.SubItems.Add(AssociationRole.Connections[1].Name + ' : ' + AssociationRole.Connections[1].Participant.Name)
    end;
  end
  else if AssociationRole.Connections[1].Participant = FModel then begin
    if AssociationRole.Connections[1].Name = '' then
      ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME)
    else
      ListItem.SubItems.Add(AssociationRole.Connections[1].Name);
    if AssociationRole.Connections[0].Participant <> nil then begin
      if AssociationRole.Connections[0].Name = '' then
        ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME + ' : ' + AssociationRole.Connections[0].Participant.Name)
      else
        ListItem.SubItems.Add(AssociationRole.Connections[0].Name + ' : ' + AssociationRole.Connections[0].Participant.Name)
    end;
  end;
end;

procedure TCollectionEditorForm.UpdateLinkListItem(ListItem: TListItem);
var
  Link: PUMLLink;
begin
  // PRECONDITION
  Assert(ListItem <> nil);
  Assert(ListItem.Data <> nil);
  // PRECONDITION
  Link := ListItem.Data;
  ListItem.SubItems.Clear;
  if Link.Name = '' then
    ListItem.Caption := '(Link)'
  else
    ListItem.Caption := Link.Name;
  if Link.StereotypeName <> '' then
    ListItem.Caption := '<<' + Link.StereotypeName + '>>' + ListItem.Caption;
  ListItem.ImageIndex := IMG_INDEX_LINK;
  if Link.Connections[0].Instance = FModel then begin
    if Link.Connections[0].Name = '' then
      ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME)
    else
      ListItem.SubItems.Add(Link.Connections[0].Name);
    if Link.Connections[1].Instance <> nil then begin
      if Link.Connections[1].Name = '' then
        ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME + ' : ' + Link.Connections[1].Instance.Name)
      else
        ListItem.SubItems.Add(Link.Connections[1].Name + ' : ' + Link.Connections[1].Instance.Name);
    end;
  end
  else if Link.Connections[1].Instance = FModel then begin
    if Link.Connections[1].Name = '' then
      ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME)
    else
      ListItem.SubItems.Add(Link.Connections[1].Name);
    if Link.Connections[0].Instance <> nil then begin
      if Link.Connections[0].Name = '' then
        ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME + ' : ' + Link.Connections[0].Instance.Name)
      else
        ListItem.SubItems.Add(Link.Connections[0].Name + ' : ' + Link.Connections[0].Instance.Name);
    end;
  end;
end;

procedure TCollectionEditorForm.UpdateTransitionListItem(ListItem: TListItem);
var
  Transition: PUMLTransition;
begin
  // PRECONDITION
  Assert(ListItem <> nil);
  Assert(ListItem.Data <> nil);
  // PRECONDITION
  Transition := ListItem.Data;
  ListItem.SubItems.Clear;
  if Transition.Name = '' then
    ListItem.Caption := '(Transition)'
  else
    ListItem.Caption := Transition.Name;
  if Transition.StereotypeName <> '' then
    ListItem.Caption := '<<' + Transition.StereotypeName + '>>' + ListItem.Caption;
  ListItem.ImageIndex := IMG_INDEX_TRANSITION;
  if Transition.Source = FModel then begin
    ListItem.SubItems.Add('Source');
    if Transition.Target <> nil then
      ListItem.SubItems.Add('Target : ' + Transition.Target.Name);
  end
  else if Transition.Target = FModel then begin
    ListItem.SubItems.Add('Target');
    if Transition.Source <> nil then
      ListItem.SubItems.Add('Source : ' + Transition.Source.Name);
  end;
end;

procedure TCollectionEditorForm.UpdateConnectorListItem(ListItem: TListItem);
var
  Connector: PUMLConnector;
begin
  // PRECONDITION
  Assert(ListItem <> nil);
  Assert(ListItem.Data <> nil);
  // PRECONDITION
  Connector := ListItem.Data;
  ListItem.SubItems.Clear;
  if Connector.Name = '' then
    ListItem.Caption := '(Connector)'
  else
    ListItem.Caption := Connector.Name;
  if Connector.StereotypeName <> '' then
    ListItem.Caption := '<<' + Connector.StereotypeName + '>>' + ListItem.Caption;
  ListItem.ImageIndex := -1;
  if Connector.Ends[0].Role = FModel then begin
    if Connector.Ends[0].Name = '' then
      ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME)
    else
      ListItem.SubItems.Add(Connector.Ends[0].Name);
    if Connector.Ends[1].Role <> nil then begin
      if Connector.Ends[1].Name = '' then
        ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME + ' : ' + Connector.Ends[1].Role.Name)
      else
        ListItem.SubItems.Add(Connector.Ends[1].Name + ' : ' + Connector.Ends[1].Role.Name);
    end;
  end
  else if Connector.Ends[1].Role = FModel then begin
    if Connector.Ends[1].Name = '' then
      ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME)
    else
      ListItem.SubItems.Add(Connector.Ends[1].Name);
    if Connector.Ends[0].Role <> nil then begin
      if Connector.Ends[0].Name = '' then
        ListItem.SubItems.Add(TXT_COLLEDIT_NO_ROLENAME + ' : ' + Connector.Ends[0].Role.Name)
      else
        ListItem.SubItems.Add(Connector.Ends[0].Name + ' : ' + Connector.Ends[0].Role.Name);
    end;
  end;
end;

procedure TCollectionEditorForm.UpdateRelationItem(ListItem: TListItem);
var
  M: PUMLModelElement;
begin
  M := ListItem.Data;
  if M is PUMLAssociationRole then
    UpdateAssociationRoleListItem(ListItem)
  else if M is PUMLRealization then
    UpdateRealizationListItem(ListItem)
  else if M is PUMLAssociation then
    UpdateAssociationListItem(ListItem)
  else if M is PUMLAssociationClass then
    UpdateAssociationClassListItem(ListItem)
  else if M is PUMLGeneralization then
    UpdateGeneralizationListItem(ListItem)
  else if M is PUMLDependency then
    UpdateDependencyListItem(ListItem)
  else if M is PUMLInclude then
    UpdateIncludeListItem(ListItem)
  else if M is PUMLExtend then
    UpdateExtendListItem(ListItem)
  else if M is PUMLLink then
    UpdateLinkListItem(ListItem)
  else if M is PUMLTransition then
    UpdateTransitionListItem(ListItem)
  else if M is PUMLConnector then
    UpdateConnectorListItem(ListItem);
end;

procedure TCollectionEditorForm.UpdateRelationsListView(AModel: PModel; AListView: TListView);

  procedure CollectRelations(AList: POrderedSet);
  var
    I: Integer;
  begin
    if AModel is PUMLClassifier then begin
      for I := 0 to (AModel as PUMLClassifier).AssociationCount - 1 do
        AList.Add((AModel as PUMLClassifier).Associations[I].Association); // Included AssociationRole
    end;
    if AModel is PUMLClass then begin
      if (AModel as PUMLClass).AssociationClass <> nil then
        AList.Add((AModel as PUMLClass).AssociationClass);
    end;
    if AModel is PUMLAssociation then begin
      if (AModel as PUMLAssociation).AssociationClass <> nil then
        AList.Add((AModel as PUMLAssociation).AssociationClass);
    end;
    if AModel is PUMLGeneralizableElement then begin
      for I := 0 to (AModel as PUMLGeneralizableElement).GeneralizationCount - 1 do
        AList.Add((AModel as PUMLGeneralizableElement).Generalizations[I]);
      for I := 0 to (AModel as PUMLGeneralizableElement).SpecializationCount - 1 do
        AList.Add((AModel as PUMLGeneralizableElement).Specializations[I]);
    end;
    if AModel is PUMLModelElement then begin
      for I := 0 to (AModel as PUMLModelElement).SupplierDependencyCount - 1 do
        AList.Add((AModel as PUMLModelElement).SupplierDependencies[I]);
      for I := 0 to (AModel as PUMLModelElement).ClientDependencyCount - 1 do
        AList.Add((AModel as PUMLModelElement).ClientDependencies[I]); // Included Realization
    end;
    if AModel is PUMLUsecase then begin
      for I := 0 to (AModel as PUMLUsecase).IncluderCount - 1 do
        AList.Add((AModel as PUMLUsecase).Includers[I]);
      for I := 0 to (AModel as PUMLUsecase).IncludeCount - 1 do
        AList.Add((AModel as PUMLUsecase).Includes[I]);
      for I := 0 to (AModel as PUMLUsecase).ExtenderCount - 1 do
        AList.Add((AModel as PUMLUsecase).Extenders[I]);
      for I := 0 to (AModel as PUMLUsecase).ExtendCount - 1 do
        AList.Add((AModel as PUMLUsecase).Extends[I]);
    end;
    if AModel is PUMLInstance then begin
      for I := 0 to (AModel as PUMLInstance).LinkEndCount - 1 do
        AList.Add((AModel as PUMLInstance).LinkEnds[I].Link);
    end;
    if AModel is PUMLStateVertex then begin
      for I := 0 to (AModel as PUMLStateVertex).IncomingCount - 1 do
        AList.Add((AModel as PUMLStateVertex).Incomings[I]);
      for I := 0 to (AModel as PUMLStateVertex).OutgoingCount - 1 do
        AList.Add((AModel as PUMLStateVertex).Outgoings[I]);
    end;
    if AModel is PUMLFeature then begin
      for I := 0 to (AModel as PUMLFeature).ConnectorEndCount - 1 do
        AList.Add((AModel as PUMLFeature).ConnectorEnds[I].Connector);
    end;
  end; // End of inner procedure CollectRelations

var
  M: PUMLElement;
  L, NL: TListItem;
  RL: POrderedSet;
  S: Boolean;
  I: Integer;
begin
  if AModel = nil then Exit;

  RL := POrderedSet.Create;
  CollectRelations(RL);

  AListView.Items.BeginUpdate;
  for I := 0 to RL.Count - 1 do begin
    M := PUMLModelElement(RL.Items[I]);
    if (AListView.Items.Count - 1 >= I) and (AListView.Items.Item[I].Data = M) then
      UpdateRelationItem(AListView.Items.Item[I])
    else begin
      S := False;
      L := AListView.FindData(I, M, False, False);
      if L <> nil then begin
        S := L.Selected;
        AListView.Items.Delete(AListView.Items.IndexOf(L));
      end;
      NL := AListView.Items.Insert(I);
      NL.Data := M;
      NL.Selected := S;
      NL.Focused := S;
      NL.Checked := True;
      UpdateRelationItem(NL);
    end;
  end;
  for I := AListView.Items.Count - 1 downto RL.Count do
    AListView.Items.Delete(I);
  if AListView.Selected = nil then
    AListView.ItemFocused := nil;
  AListView.Items.EndUpdate;

  RL.Free;
end;

procedure TCollectionEditorForm.HideAllTabSheets;
var
  I: Integer;
begin
  for I := CollectionPageControl.PageCount - 1 downto 0 do
    CollectionPageControl.Pages[I].TabVisible := False;
end;

procedure TCollectionEditorForm.ShowTabSheetsByModel(AModel: PModel);

  procedure SetTabSheetTabVisible(TabSheet: TTabSheet; AvailableModels: array of PClass);
  var
    I: Integer;
  begin
    for I := 0 to Length(AvailableModels) - 1 do
      if AModel is AvailableModels[I] then begin
        TabSheet.TabVisible := True;
        Exit;
      end;
    TabSheet.TabVisible := False;
  end;

begin
  SetTabSheetTabVisible(AttributesPage, [PUMLClass, PUMLInterface, PUMLSignal,
    PUMLException, PUMLComponent, PUMLNode, PUMLUsecase, PUMLActor, PUMLArtifact]);
  SetTabSheetTabVisible(OperationsPage, [PUMLClass, PUMLInterface, PUMLEnumeration, PUMLSignal,
    PUMLException, PUMLComponent, PUMLUsecase, PUMLActor, PUMLSubsystem, PUMLArtifact]);
  SetTabSheetTabVisible(TemplateParametersPage, [PUMLClass, PUMLCollaboration]);
  SetTabSheetTabVisible(LiteralsPage, [PUMLEnumeration]);
  SetTabSheetTabVisible(ExtensionPointsPage, [PUMLUseCase]);
  SetTabSheetTabVisible(ResidentsPage, [PUMLComponent]);
  SetTabSheetTabVisible(DeployedComponentsPage, [PUMLNode]);
  SetTabSheetTabVisible(DeployedArtifactsPage, [PUMLNode]);
  SetTabSheetTabVisible(SlotsPage, [PUMLInstance]);
  SetTabSheetTabVisible(EntryActionsPage, [PUMLSubmachineState, PUMLSubActivityState, PUMLCompositeState,
    PUMLFinalState, PUMLActionState]);
  SetTabSheetTabVisible(DoActivitiesPage, [PUMLSubmachineState, PUMLSubActivityState, PUMLCompositeState,
    PUMLFinalState, PUMLActionState]);
  SetTabSheetTabVisible(ExitActionsPage, [PUMLSubmachineState, PUMLSubActivityState, PUMLCompositeState,
    PUMLFinalState, PUMLActionState]);
  SetTabSheetTabVisible(ParametersPage, [PUMLOperation]);
  SetTabSheetTabVisible(RaisedSignalsPage, [PUMLOperation]);
  SetTabSheetTabVisible(EffectsPage, [PUMLTransition]);
  SetTabSheetTabVisible(TriggersPage, [PUMLTransition]);
  SetTabSheetTabVisible(QualifiersPage, [PUMLAssociationEnd, PUMLAssociationEndRole]);
  SetTabSheetTabVisible(End1QualifiersPage, [PUMLAssociation, PUMLAssociationRole]);
  SetTabSheetTabVisible(End2QualifiersPage, [PUMLAssociation, PUMLAssociationRole]);
  SetTabSheetTabVisible(RelationsPage, [PUMLModelElement]);
end;

procedure TCollectionEditorForm.ActivateTabSheet(PageName: string);
var
  I: Integer;
begin
  if PageName = 'Attributes' then
    CollectionPageControl.ActivePage := AttributesPage
  else if PageName = 'Operations' then
    CollectionPageControl.ActivePage := OperationsPage
  else if PageName = 'Parameters' then
    CollectionPageControl.ActivePage := ParametersPage
  else if PageName = 'TemplateParameters' then
    CollectionPageControl.ActivePage := TemplateParametersPage
  else if PageName = 'Literals' then
    CollectionPageControl.ActivePage := LiteralsPage
  else if PageName = 'ExtensionPoints' then
    CollectionPageControl.ActivePage := ExtensionPointsPage    
  else if PageName = 'DeployedComponents' then
    CollectionPageControl.ActivePage := DeployedComponentsPage
  else if PageName = 'DeployedArtifacts' then
    CollectionPageControl.ActivePage := DeployedArtifactsPage
  else if PageName = 'Residents' then
    CollectionPageControl.ActivePage := ResidentsPage
  else if PageName = 'Slots' then
    CollectionPageControl.ActivePage := SlotsPage
  else if PageName = 'EntryActions' then
    CollectionPageControl.ActivePage := EntryActionsPage
  else if PageName = 'DoActivities' then
    CollectionPageControl.ActivePage := DoActivitiesPage
  else if PageName = 'ExitActions' then
    CollectionPageControl.ActivePage := ExitActionsPage
  else if PageName = 'RaisedSignals' then
    CollectionPageControl.ActivePage := RaisedSignalsPage
  else if PageName = 'Effects' then
    CollectionPageControl.ActivePage := EffectsPage
  else if PageName = 'Triggers' then
    CollectionPageControl.ActivePage := TriggersPage
  else if PageName = 'End1.Qualifiers' then
    CollectionPageControl.ActivePage := End1QualifiersPage
  else if PageName = 'End2.Qualifiers' then
    CollectionPageControl.ActivePage := End2QualifiersPage
  else if PageName = 'Qualifiers' then
    CollectionPageControl.ActivePage := QualifiersPage
  else begin
    for I := 0 to CollectionPageControl.PageCount - 1 do
      if CollectionPageControl.Pages[I].TabVisible then begin
        CollectionPageControl.ActivePageIndex := I;
        Break;
      end;
  end;
  ComposePopupMenu(ActiveCollection);
end;

procedure TCollectionEditorForm.SetSelectedListItem(AListView: TListView; Idx: Integer);
var
  I: Integer;
begin
  if AListView.Items.Count > 0 then begin
    I := Idx;
    if I < 0 then I := 0
    else if I > AListView.Items.Count - 1 then I := AListView.Items.Count - 1;
    AListView.Selected := AListView.Items.Item[I];
    AListView.ItemFocused := AListView.Items.Item[I];
  end;
end;

procedure TCollectionEditorForm.UpdateUIStatePage(Page: TTabSheet; ListView: TListView; InsertButtons: array of TToolButton;
  DeleteButton: TToolButton; MoveUpButton: TToolButton; MoveDownButton: TToolButton);
var
  I: Integer;
begin
  if not Page.TabVisible then Exit;
  ListView.ReadOnly := FReadOnly;
  for I := 0 to Length(InsertButtons) - 1 do
    InsertButtons[I].Enabled := (not FReadOnly);
  DeleteButton.Enabled := (ListView.Selected <> nil) and (not FReadOnly);
  MoveUpButton.Enabled := (ListView.Selected <> nil) and (ListView.ItemIndex > 0) and (not FReadOnly);
  MoveDownButton.Enabled := (ListView.Selected <> nil) and (ListView.ItemIndex < ListView.Items.Count - 1) and (not FReadOnly);
end;

procedure TCollectionEditorForm.UpdateUIStateRelationsPage;
begin
  if not RelationsPage.TabVisible then Exit;
  RelationDelete.Enabled := (RelationsListView.Selected <> nil) and (not FReadOnly);
end;

procedure TCollectionEditorForm.UpdatePopupMenuState;
var
  L: TListView;
begin
  L := GetCollectionListView(ActiveCollection);
  if L <> nil then begin
    UndoMenu.Enabled := UndoMenu.Visible and StarUMLApplication.CanUndo;
    RedoMenu.Enabled := RedoMenu.Visible and StarUMLApplication.CanRedo;
    EditNameMenu.Enabled := EditNameMenu.Visible and (L.Selected <> nil) and (not PModel(L.Selected.Data).ReadOnly) and (not FReadOnly);
    InsertMenu.Enabled := InsertMenu.Visible and (not FReadOnly);
    InsertSignalEventMenu.Enabled := InsertSignalEventMenu.Visible and (not FReadOnly);
    InsertCallEventMenu.Enabled := InsertCallEventMenu.Visible and (not FReadOnly);
    InsertChangeEventMenu.Enabled := InsertChangeEventMenu.Visible and (not FReadOnly);
    InsertTimeEventMenu.Enabled := InsertTimeEventMenu.Visible and (not FReadOnly);
    DeleteMenu.Enabled := DeleteMenu.Visible and (L.Selected <> nil) and (not FReadOnly);
    MoveUpMenu.Enabled := MoveUpMenu.Visible and (L.Selected <> nil) and (L.ItemIndex > 0) and (not FReadOnly);
    MoveDownMenu.Enabled := MoveDownMenu.Visible and (L.Selected <> nil) and (L.ItemIndex < L.Items.Count - 1) and (not FReadOnly);
  end;
end;

procedure TCollectionEditorForm.UpdateUIStates;
begin
  UpdateUIStatePage(AttributesPage, AttributesListView, [AttributeInsert],
    AttributeDelete, AttributeMoveUp, AttributeMoveDown);
  UpdateUIStatePage(OperationsPage, OperationsListView, [OperationInsert],
    OperationDelete, OperationMoveUp, OperationMoveDown);
  UpdateUIStatePage(ParametersPage, ParametersListView, [ParameterInsert],
    ParameterDelete, ParameterMoveUp, ParameterMoveDown);
  UpdateUIStatePage(TemplateParametersPage, TemplateParametersListView, [TemplateParameterInsert],
    TemplateParameterDelete, TemplateParameterMoveUp, TemplateParameterMoveDown);
  UpdateUIStatePage(LiteralsPage, LiteralsListView, [LiteralInsert],
    LiteralDelete, LiteralMoveUp, LiteralMoveDown);
  UpdateUIStatePage(ExtensionPointsPage, ExtensionPointsListView, [ExtensionPointInsert],
    ExtensionPointDelete, ExtensionPointMoveUp, ExtensionPointMoveDown);
  UpdateUIStatePage(QualifiersPage, QualifiersListView, [QualifierInsert],
    QualifierDelete, QualifierMoveUp, QualifierMoveDown);
  UpdateUIStatePage(DeployedComponentsPage, DeployedComponentsListView, [DeployedComponentInsert],
    DeployedComponentDelete, DeployedComponentMoveUp, DeployedComponentMoveDown);
  UpdateUIStatePage(DeployedArtifactsPage, DeployedArtifactsListView, [DeployedArtifactInsert],
    DeployedArtifactDelete, DeployedArtifactMoveUp, DeployedArtifactMoveDown);
  UpdateUIStatePage(ResidentsPage, ResidentsListView, [ResidentInsert],
    ResidentDelete, ResidentMoveUp, ResidentMoveDown);
  UpdateUIStatePage(SlotsPage, SlotsListView, [SlotInsert], SlotDelete,
    SlotMoveUp, SlotMoveDown);
  UpdateUIStatePage(EntryActionsPage, EntryActionsListView, [EntryActionInsert],
    EntryActionDelete, EntryActionMoveUp, EntryActionMoveDown);
  UpdateUIStatePage(DoActivitiesPage, DoActivitiesListView, [DoActivityInsert],
    DoActivityDelete, DoActivityMoveUp, DoActivityMoveDown);
  UpdateUIStatePage(ExitActionsPage, ExitActionsListView, [ExitActionInsert],
    ExitActionDelete, ExitActionMoveUp, ExitActionMoveDown);
  UpdateUIStatePage(RaisedSignalsPage, RaisedSignalsListView, [RaisedSignalInsert],
    RaisedSignalDelete, RaisedSignalMoveUp, RaisedSignalMoveDown);
  UpdateUIStatePage(EffectsPage, EffectsListView, [EffectInsert],
    EffectDelete, EffectMoveUp, EffectMoveDown);
  UpdateUIStatePage(TriggersPage, TriggersListView, [SignalEventInsert, CallEventInsert, TimeEventInsert, ChangeEventInsert],
    TriggerDelete, TriggerMoveUp, TriggerMoveDown);
  UpdateUIStatePage(End1QualifiersPage, End1QualifiersListView, [End1QualifierInsert],
    End1QualifierDelete, End1QualifierMoveUp, End1QualifierMoveDown);
  UpdateUIStatePage(End2QualifiersPage, End2QualifiersListView, [End2QualifierInsert],
    End2QualifierDelete, End2QualifierMoveUp, End2QualifierMoveDown);
  UpdateUIStateRelationsPage;
  UpdatePopupMenuState;
end;

procedure TCollectionEditorForm.UpdateFormTitle;
begin
  if FModel = nil then
    Caption := TXT_COLLEDIT_TITLE + ' - (' + TXT_COLLEDIT_NO_MODEL + ')'
  else
    Caption := TXT_COLLEDIT_TITLE + ' - ('
      + Copy(FModel.ClassName, 2, Length(FModel.ClassName) - 1) + ') ' + FModel.Name;
end;

procedure TCollectionEditorForm.ClearAllListViews;
begin
  AttributesListView.Clear;
  OperationsListView.Clear;
  ParametersListView.Clear;
  TemplateParametersListView.Clear;
  LiteralsListView.Clear;
  ExtensionPointsListView.Clear;
  QualifiersListView.Clear;
  DeployedComponentsListView.Clear;
  DeployedArtifactsListView.Clear;
  ResidentsListView.Clear;
  SlotsListView.Clear;
  EntryActionsListView.Clear;
  DoActivitiesListView.Clear;
  ExitActionsListView.Clear;
  RaisedSignalsListView.Clear;
  EffectsListView.Clear;
  TriggersListView.Clear;
  QualifiersListView.Clear;
  QualifiersListView.Clear;
  RelationsListView.Clear;
end;

procedure TCollectionEditorForm.CreateCollectionItem(AOwner: PModel; ACollectionName: string; AModelType: string; Argument: Integer = 0);
begin
  if Assigned(FOnCollectionItemCreate) then
    FOnCollectionItemCreate(Self, AOwner, ACollectionName, AModelType, Argument);
end;

procedure TCollectionEditorForm.DeleteCollectionItem(AOwner: PModel; ACollectionName: string; AModel: PModel);
begin
  if Assigned(FOnCollectionItemDelete) then
    FOnCollectionItemDelete(Self, AOwner, ACollectionName, AModel);
end;

procedure TCollectionEditorForm.AddCollectionItem(AOwner: PModel; ACollectionName: string; AModel: PModel);
begin
  if Assigned(FOnCollectionItemAdd) then
    FOnCollectionItemAdd(Self, AOwner, ACollectionName, AModel);
end;

procedure TCollectionEditorForm.RemoveCollectionItem(AOwner: PModel; ACollectionName: string; AModel: PModel);
begin
  if Assigned(FOnCollectionItemRemove) then
    FOnCollectionItemRemove(Self, AOwner, ACollectionName, AModel);
end;

procedure TCollectionEditorForm.ChangeCollectionItemOrder(AOwner: PModel; ACollectionName: string; AModel: PModel; NewIdx: Integer);
begin
  if Assigned(FOnCollectionItemOrderChange) then
    FOnCollectionItemOrderChange(Self, AOwner, ACollectionName, AModel, NewIdx);
end;

procedure TCollectionEditorForm.SelectCollectionItem(AOwner: PModel; ACollectionName: string; AModel: PModel);
begin
  if Assigned(FOnCollectionItemSelected) then
    FOnCollectionItemSelected(Self, AOwner, ACollectionName, AModel);
end;

procedure TCollectionEditorForm.ChangeCollectionItemName(AModel: PModel; Name: string);
begin
  if Assigned(FOnCollectionItemNameChanged) then
    FOnCollectionItemNameChanged(Self, AModel, Name);
end;

procedure TCollectionEditorForm.ShowCollection(AModel: PModel; ActivePage: string = '');
begin
  // PRECONDITIONS
  Assert(AModel <> nil);
  // PRECONDITIONS
  ClearAllListViews;
  ShowTabSheetsByModel(AModel);
  ActivateTabSheet(ActivePage);
  SetModel(AModel);
  Show;
  Update;
  UpdateCollection;
end;

procedure TCollectionEditorForm.ClearCollection;
begin
  FModel := nil;
  UpdateCollection;
end;

procedure TCollectionEditorForm.Inspect;
begin
  UpdateCollection;
end;

procedure TCollectionEditorForm.UpdateCollection;
begin
  if not Visible then Exit;

  if (FModel <> nil) and (FModel.MetaClass = nil) then
    FModel := nil;
  if FModel = nil then
    HideAllTabSheets;

  if FModel <> nil then
    ReadOnly := FModel.ReadOnly
  else
    ReadOnly := True;

  if AttributesPage.TabVisible then
    UpdateCollectionListView(FModel, 'Attributes', AttributesListView);
  if OperationsPage.TabVisible then
    UpdateCollectionListView(FModel, 'Operations', OperationsListView);
  if ParametersPage.TabVisible then
    UpdateCollectionListView(FModel, 'Parameters', ParametersListView);
  if TemplateParametersPage.TabVisible then
    UpdateCollectionListView(FModel, 'TemplateParameters', TemplateParametersListView);
  if LiteralsPage.TabVisible then
    UpdateCollectionListView(FModel, 'Literals', LiteralsListView);
  if ExtensionPointsPage.TabVisible then
    UpdateCollectionListView(FModel, 'ExtensionPoints', ExtensionPointsListView);    
  if QualifiersPage.TabVisible then
    UpdateCollectionListView(FModel, 'Qualifiers', QualifiersListView);
  if DeployedComponentsPage.TabVisible then
    UpdateCollectionListView(FModel, 'DeployedComponents', DeployedComponentsListView);
  if DeployedArtifactsPage.TabVisible then
    UpdateCollectionListView(FModel, 'DeployedArtifacts', DeployedArtifactsListView);    
  if ResidentsPage.TabVisible then
    UpdateCollectionListView(FModel, 'Residents', ResidentsListView);
  if SlotsPage.TabVisible then
    UpdateCollectionListView(FModel, 'Slots', SlotsListView);    
  if EntryActionsPage.TabVisible then
    UpdateCollectionListView(FModel, 'EntryActions', EntryActionsListView);
  if DoActivitiesPage.TabVisible then
    UpdateCollectionListView(FModel, 'DoActivities', DoActivitiesListView);
  if ExitActionsPage.TabVisible then
    UpdateCollectionListView(FModel, 'ExitActions', ExitActionsListView);
  if RaisedSignalsPage.TabVisible then
    UpdateCollectionListView(FModel, 'RaisedSignals', RaisedSignalsListView);
  if EffectsPage.TabVisible then
    UpdateCollectionListView(FModel, 'Effects', EffectsListView);
  if TriggersPage.TabVisible then
    UpdateCollectionListView(FModel, 'Triggers', TriggersListView);
  if End1QualifiersPage.TabVisible then begin
    UpdateCollectionListView((FModel as PUMLAssociation).Connections[0],
    'Qualifiers', End1QualifiersListView);
  end;
  if End2QualifiersPage.TabVisible then begin
    UpdateCollectionListView((FModel as PUMLAssociation).Connections[1],
    'Qualifiers', End2QualifiersListView);
  end;
  if RelationsPage.TabVisible then
    UpdateRelationsListView(FModel, RelationsListView);
  UpdateFormTitle;
  UpdateUIStates;
end;

procedure TCollectionEditorForm.HandleListViewSelectItem(
  Sender: TObject; Item: TListItem; Selected: Boolean);
var
  C: PCollectionKind;
begin
  C := ActiveCollection;
  if Selected then SelectCollectionItem(GetCollectionOwner(C), GetCollectionName(C), Item.Data);
  UpdateUIStates;
end;

procedure TCollectionEditorForm.HandleUndoAction(Sender: TObject);
var
  L: TListView;
begin
  if StarUMLApplication.CanUndo then begin
    L := GetCollectionListView(ActiveCollection);
    if (L <> nil) and L.IsEditing then
      SendMessage(ListView_GetEditControl(L.Handle), WM_UNDO, 0, 0)
    else
      StarUMLApplication.Undo;
  end;
end;

procedure TCollectionEditorForm.HandleRedoAction(Sender: TObject);
begin
  if StarUMLApplication.CanRedo then
    StarUMLApplication.Redo;
end;

procedure TCollectionEditorForm.HandleEditNameAction(Sender: TObject);
var
  C: PCollectionKind;
begin
  C := ActiveCollection;
  if C <> ckNone then
    GetCollectionListView(C).Selected.EditCaption;
end;

procedure TCollectionEditorForm.HandleInsertAction(Sender: TObject);
var
  C: PCollectionKind;
  L: TListView;
begin
  C := ActiveCollection;
  case C of
    ckDeployedComponents: HandleDeployedComponentInsertAction(Sender);
    ckDeployedArtifacts: HandleDeployedArtifactInsertAction(Sender);
    ckResidents: HandleResidentInsertAction(Sender);
    ckRaisedSignals: HandleRaisedSignalInsertAction(Sender);
    else begin
      L := GetCollectionListView(C);
      ListItemEndEdit(L);
      CreateCollectionItem(GetCollectionOwner(C), GetCollectionName(C), GetCreatingModelType(C, Sender),
        GetCreatingModelArgument(C, Sender));
      SetSelectedListItem(L, L.Items.Count - 1);
      L.SetFocus;
      UpdateUIStates;
    end;
  end;
end;

procedure TCollectionEditorForm.HandleDeleteAction(Sender: TObject);
var
  C: PCollectionKind;
  L: TListView;
  I: Integer;
begin
  C := ActiveCollection;
  L := GetCollectionListView(C);
  if L.Selected <> nil then begin
    I := L.ItemIndex;
    case C of
      ckDeployedComponents, ckDeployedArtifacts, ckResidents, ckRaisedSignals:
        RemoveCollectionItem(GetCollectionOwner(C), GetCollectionName(C), L.Selected.Data);
      else
        DeleteCollectionItem(GetCollectionOwner(C), GetCollectionName(C), L.Selected.Data);
    end;
    SetSelectedListItem(L, I);
    L.SetFocus;
    UpdateUIStates;
  end;
end;

procedure TCollectionEditorForm.HandleMoveUpAction(Sender: TObject);
var
  C: PCollectionKind;
  L: TListView;
  I: Integer;
begin
  C := ActiveCollection;
  L := GetCollectionListView(C);
  ListItemEndEdit(L);
  if (L.Selected <> nil) and (L.ItemIndex > 0) then begin
    I := L.Selected.Index - 1;
    ChangeCollectionItemOrder(GetCollectionOwner(C), GetCollectionName(C), L.Selected.Data, I);
    SetSelectedListItem(L, I);
    L.SetFocus;
    UpdateUIStates;
  end;
end;

procedure TCollectionEditorForm.HandleMoveDownAction(Sender: TObject);
var
  C: PCollectionKind;
  L: TListView;
  I: Integer;
begin
  C := ActiveCollection;
  L := GetCollectionListView(C);
  ListItemEndEdit(L);
  if (L.Selected <> nil) and (L.ItemIndex < L.Items.Count - 1) then begin
    I := L.Selected.Index + 1;
    ChangeCollectionItemOrder(GetCollectionOwner(C), GetCollectionName(C), L.Selected.Data, I);
    SetSelectedListItem(L, I);
    L.SetFocus;
    UpdateUIStates;
  end;
end;

procedure TCollectionEditorForm.HandleListViewEditing(Sender: TObject;
  Item: TListItem; var AllowEdit: Boolean);
var
  EditHandle: Hwnd;
begin
  // PRECONDITIONS
  Assert(Sender is TListView);
  // PRECONDITIONS
  EditHandle := ListView_GetEditControl((Sender as TListView).Handle);
  SendMessage(EditHandle, EM_SETSEL, 0, Length(Item.Caption));
  SendMessage(EditHandle, EM_REPLACESEL, 0, Longint(PChar(PUMLModelElement(Item.Data).Name)));
end;

procedure TCollectionEditorForm.HandleListViewEdited(Sender: TObject; Item: TListItem; var S: string);
begin
  if (Item <> nil) and (PModel(Item.Data).Name <> S) then begin
    ChangeCollectionItemName(Item.Data, S);
    S := Item.Caption;
  end;
end;

procedure TCollectionEditorForm.HandleListViewDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := (Sender = Source) and (not FReadOnly);
end;

procedure TCollectionEditorForm.HandleListViewEndDrag(Sender, Target: TObject; X, Y: Integer);
var
  C: PCollectionKind;
  L: TListView;
  LI: TListItem;
  Idx: Integer;
begin
  if (Sender = Target) and (not FReadOnly) then begin
    C := ActiveCollection;
    L := Sender as TListView;
    LI := L.GetItemAt(X, Y);
    if (L.Selected <> nil) and (LI <> nil) and (L.Selected <> LI) then begin
      Idx := LI.Index;
      ChangeCollectionItemOrder(GetCollectionOwner(C), GetCollectionName(C), L.Selected.Data, Idx);
      SetSelectedListItem(L, Idx);
      L.SetFocus;
      UpdateUIStates;
    end;
  end;
end;

procedure TCollectionEditorForm.HandleDeployedComponentInsertAction(Sender: TObject);
begin
  ListItemEndEdit(DeployedComponentsListView);
  ElementListForm.ClearListElements;
  ElementListForm.AddListElementsByClass('UMLComponent');
  ElementListForm.AllowNull := False;
  if ElementListForm.Execute(MSG_COLLEDIT_SELECT_COMPONENT) then
    if ElementListForm.SelectedModel <> nil then begin
      AddCollectionItem(FModel, 'DeployedComponents', ElementListForm.SelectedModel);
      SetSelectedListItem(DeployedComponentsListView, DeployedComponentsListView.Items.Count - 1);
      DeployedComponentsListView.SetFocus;
      UpdateUIStates;
    end;
end;

procedure TCollectionEditorForm.HandleDeployedArtifactInsertAction(Sender: TObject);
begin
  ListItemEndEdit(DeployedArtifactsListView);
  ElementListForm.ClearListElements;
  ElementListForm.AddListElementsByClass('UMLArtifact');
  ElementListForm.AllowNull := False;
  if ElementListForm.Execute(MSG_COLLEDIT_SELECT_ARTIFACT) then
    if ElementListForm.SelectedModel <> nil then begin
      AddCollectionItem(FModel, 'DeployedArtifacts', ElementListForm.SelectedModel);
      SetSelectedListItem(DeployedArtifactsListView, DeployedArtifactsListView.Items.Count - 1);
      DeployedArtifactsListView.SetFocus;
      UpdateUIStates;
    end;
end;

procedure TCollectionEditorForm.HandleResidentInsertAction(Sender: TObject);
begin
  ListItemEndEdit(ResidentsListView);
  ElementSelectorForm.Filter(BASIC_FILTERINGSET);
  ElementSelectorForm.ClearSelectableModels;
  ElementSelectorForm.AddSelectableModels(BASIC_FILTERINGSET);
  if ElementSelectorForm.Execute(MSG_COLLEDIT_SELECT_RESIDENT) then
    if ElementSelectorForm.SelectedModel <> nil then begin
      AddCollectionItem(FModel, 'Residents', ElementSelectorForm.SelectedModel);
      SetSelectedListItem(ResidentsListView, ResidentsListView.Items.Count - 1);
      ResidentsListView.SetFocus;
      UpdateUIStates;
    end;
end;

procedure TCollectionEditorForm.HandleRaisedSignalInsertAction(Sender: TObject);
begin
  ListItemEndEdit(RaisedSignalsListView);
  ElementListForm.ClearListElements;
  ElementListForm.AddListElementsByClass('UMLSignal', True);
  ElementListForm.AllowNull := False;
  if ElementListForm.Execute(MSG_COLLEDIT_SELECT_SIGNAL) then
    if ElementListForm.SelectedModel <> nil then begin
      AddCollectionItem(FModel, 'RaisedSignals', ElementListForm.SelectedModel);
      SetSelectedListItem(RaisedSignalsListView, RaisedSignalsListView.Items.Count - 1);
      RaisedSignalsListView.SetFocus;
      UpdateUIStates;
    end;
end;

procedure TCollectionEditorForm.HandleRelationDeleteAction(Sender: TObject);
var
  I: Integer;
begin
  ListItemEndEdit(RelationsListView);
  if RelationsListView.Selected <> nil then begin
    I := RelationsListView.ItemIndex;
    // CollectionName is ommitted and FModel is not needed,
    // because this procedure call StarUMLApplication.DeleteModel that do not need 'CollectionName'
    // This point is open to further review.
    DeleteCollectionItem(FModel, '', RelationsListView.Selected.Data);
    SetSelectedListItem(RelationsListView, I);
    RelationsListView.SetFocus;
    UpdateUIStates;
  end;
end;

procedure TCollectionEditorForm.HandleListViewContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
//  ComposePopupMenu(ActiveCollection);
end;

procedure TCollectionEditorForm.CollectionPageControlChange(Sender: TObject);
begin
  ComposePopupMenu(ActiveCollection);
  if GetCollectionListView(ActiveCollection) <> nil then begin
    GetCollectionListView(ActiveCollection).Selected := nil;
    GetCollectionListView(ActiveCollection).ItemFocused := nil;
  end;
  UpdateUIStates;
end;

procedure TCollectionEditorForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

// TCollectionEdtForm
////////////////////////////////////////////////////////////////////////////////

procedure TCollectionEditorForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

end.
