unit TagEdtFrm;

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
  ExtCore, UMLModels, TagColEdtFrm,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ImgList;



type
  // Events
  PDataTaggedValueChangeEvent = procedure(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
    ATagDefinitionSetName: string; AName: string; Value: string) of object;

  PReferenceTaggedValueChangeEvent = procedure(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
    ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel) of object;

  PTaggedValueEvent = procedure(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
    ATagDefinitionSetName: string; AName: string) of object;

  PTagDefinitionSetInspector = class
  protected const
    CATEGORY_LEVEL = 0;
    TAGGEDVALUEITEM_LEVEL = 1;
  private
    FModel: PExtensibleModel;
  protected
    TextMemo: TMemo;
    FOwner: TComponent;
    FTagDefinitionSet: PTagDefinitionSet;
    FReadOnly: Boolean;
    FOnInspectorChange: TNotifyEvent;
    FOnDataTaggedValueChange: PDataTaggedValueChangeEvent;
    FOnReferenceTaggedValueChange: PReferenceTaggedValueChangeEvent;
    FOnAddCollectionTaggedValue: PCollectionTaggedValueEvent;
    FOnRemoveCollectionTaggedValue: PCollectionTaggedValueEvent;
    FOnChangeCollectionTaggedValueOrder: PChangeCollectionTaggedValueOrderEvent;
    FOnSetTaggedValueAsDefault: PTaggedValueEvent;
  protected
    procedure SetReadOnly(Value: Boolean);
    function GetProfile: PProfile;
    function GetFocusedTagDefinition: PTagDefinition; virtual; abstract;
    procedure ClearRows; virtual; abstract;
    procedure SetupRows; virtual; abstract;
    procedure FinalizeEditingCurrentModel; virtual; abstract;
    function IsDefaultValue(ATagDefinition: PTagDefinition): Boolean;
    procedure SetModel(Value: PExtensibleModel);
    procedure SetTagDefinitionSet(Value: PTagDefinitionSet);

    // event handlers
    procedure HandleAddCollectionTaggedValue(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
      ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel);
    procedure HandleRemoveCollectionTaggedValue(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
      ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel);
    procedure HandleChangeCollectionTaggedValueIndex(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
      ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel; NewIdx: Integer);

    constructor Create(AOwner: TComponent); // Call only from a derived class

  protected
    class function GetParentTagDefinitionSet(TS: PTagDefinitionSet): PTagDefinitionSet;

  public
    destructor Destroy; override;

    procedure Setup;
    procedure UpdateTaggedValues; virtual; abstract;
    procedure SetFocusedTaggedValueAsDefault; virtual; abstract;

    property Model: PExtensibleModel read FModel write SetModel;
    property TagDefinitionSet: PTagDefinitionSet read FTagDefinitionSet write SetTagDefinitionSet;
    property Profile: PProfile read GetProfile;
    property FocusedTagDefinition: PTagDefinition read GetFocusedTagDefinition;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property OnDataTaggedValueChange: PDataTaggedValueChangeEvent read FOnDataTaggedValueChange write FOnDataTaggedValueChange;
    property OnReferenceTaggedValueChange: PReferenceTaggedValueChangeEvent read FOnReferenceTaggedValueChange write FOnReferenceTaggedValueChange;
    property OnInspectorChange: TNotifyEvent read FOnInspectorChange write FOnInspectorChange;
    property OnAddCollectionTaggedValue: PCollectionTaggedValueEvent
      read FOnAddCollectionTaggedValue write FOnAddCollectionTaggedValue;
    property OnRemoveCollectionTaggedValue: PCollectionTaggedValueEvent
      read FOnRemoveCollectionTaggedValue write FOnRemoveCollectionTaggedValue;
    property OnChangeCollectionTaggedValueOrder: PChangeCollectionTaggedValueOrderEvent
      read FOnChangeCollectionTaggedValueOrder write FOnChangeCollectionTaggedValueOrder;
    property OnSetTaggedValueAsDefault: PTaggedValueEvent read FOnSetTaggedValueAsDefault write FOnSetTaggedValueAsDefault;
  end;

  // TTaggedValueEditorForm
  TTaggedValueEditorForm = class(TForm)
    CloseButton: TButton;
    TaggedValueTabControl: TTabControl;
    TagDefinitionSetLabel: TLabel;
    TagDefinitionSetComboBox: TComboBox;
    TaggedValueLabel: TLabel;
    DefaultButton: TButton;
    RowImageList: TImageList;
    HelpButton: TButton;
    //procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TaggedValueTabControlChange(Sender: TObject);
    procedure TagDefinitionSetComboBoxSelect(Sender: TObject);
    procedure DefaultButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);

  protected const
    TAGGEDVALUEEDITORFORM_NOMODEL = 'Nothing Selected';

  protected
    TagDefinitionSetInspector: PTagDefinitionSetInspector;
    FModel: PExtensibleModel;
    FReadOnly: Boolean;
    FOnDataTaggedValueChange: PDataTaggedValueChangeEvent;
    FOnReferenceTaggedValueChange: PReferenceTaggedValueChangeEvent;
    FOnAddCollectionTaggedValue: PCollectionTaggedValueEvent;
    FOnRemoveCollectionTaggedValue: PCollectionTaggedValueEvent;
    FOnChangeCollectionTaggedValueOrder: PChangeCollectionTaggedValueOrderEvent;
    FOnSetTaggedValueAsDefault: PTaggedValueEvent;

    procedure FormCreate(Sender: TObject); // Call only from a derived class

    procedure SetModel(Value: PExtensibleModel);
    procedure SetReadOnly(Value: Boolean);
    function CurrentProfile: PProfile;
    function CurrentTagDefinitionSet: PTagDefinitionSet;
    procedure SetupTaggedValueTab(AProfile: PProfile; DefaultTagDefinitionSetName: string = '');
    procedure SetupTaggedTabControl;
    procedure UpdateFormTitle;
    procedure UpdateUIState;

    // event handlers
    procedure HandleDataTaggedValueChange(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
      ATagDefinitionSetName: string; AName: string; Value: string);
    procedure HandleReferenceTaggedValueChange(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
      ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel);
    procedure HandleInspectorChange(Sender: TObject);
    procedure HandleAddCollectionTaggedValue(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
      ATagDefintionSetName: string; AName: string; Value: PExtensibleModel);
    procedure HandleRemoveCollectionTaggedValue(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
      ATagDefintionSetName: string; AName: string; Value: PExtensibleModel);
    procedure HandleChangeCollectionTaggedValueIndex(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
      ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel; NewIdx: Integer);
    procedure HandleSetTaggedValueAsDefault(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
      ATagDefinitionSetName: string; AName: string);
  public
    procedure UpdateTaggedValues;
    procedure Inspect;
    procedure ShowTaggedValues(AModel: PExtensibleModel);

    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property Model: PExtensibleModel read FModel write SetModel;
    property OnDataTaggedValueChange: PDataTaggedValueChangeEvent read FOnDataTaggedValueChange write FOnDataTaggedValueChange;
    property OnReferenceTaggedValueChange: PReferenceTaggedValueChangeEvent read FOnReferenceTaggedValueChange write FOnReferenceTaggedValueChange;
    property OnAddCollectionTaggedValue: PCollectionTaggedValueEvent
      read FOnAddCollectionTaggedValue write FOnAddCollectionTaggedValue;
    property OnRemoveCollectionTaggedValue: PCollectionTaggedValueEvent
      read FOnRemoveCollectionTaggedValue write FOnRemoveCollectionTaggedValue;
    property OnChangeCollectionTaggedValueOrder: PChangeCollectionTaggedValueOrderEvent
      read FOnChangeCollectionTaggedValueOrder write FOnChangeCollectionTaggedValueOrder;
    property OnSetTaggedValueAsDefault: PTaggedValueEvent read FOnSetTaggedValueAsDefault write FOnSetTaggedValueAsDefault;
  end;

var
  TaggedValueEditorForm: TTaggedValueEditorForm;

implementation

uses
  ElemLstFrm, NLS, NLS_StarUML,
  HtmlHlp;

{$R *.dfm}

/////////////////////////////////////////
// Helper functions
class function PTagDefinitionSetInspector.GetParentTagDefinitionSet(TS: PTagDefinitionSet): PTagDefinitionSet;
begin
  Result := nil;
  if (TS.Stereotype <> nil) and (TS.Stereotype.Parent <> nil) and
    (TS.Stereotype.Parent.TagDefinitionSet <> nil) then
    Result := TS.Stereotype.Parent.TagDefinitionSet;
end;


////////////////////////////////////////////////////////////////////////////////
// PTagDefinitionSetInspector

constructor PTagDefinitionSetInspector.Create(AOwner: TComponent);
begin
  FOwner := AOwner;
  //Inspector := AInspector;
  TextMemo := TMemo.Create(FOwner);
  TextMemo.WantReturns := True;
  TextMemo.WantTabs := True;
  TaggedValueCollectionEditorForm.OnAddCollectionTaggedValue := HandleAddCollectionTaggedValue;
  TaggedValueCollectionEditorForm.OnRemoveCollectionTaggedValue := HandleRemoveCollectionTaggedValue;
  TaggedValueCollectionEditorForm.OnChangeCollectionTaggedValueOrder := HandleChangeCollectionTaggedValueIndex;
end;

destructor PTagDefinitionSetInspector.Destroy;
begin
  TextMemo.Free;
  inherited;
end;

procedure PTagDefinitionSetInspector.SetReadOnly(Value: Boolean);
begin
  FReadOnly := Value;
  TaggedValueCollectionEditorForm.ReadOnly := FReadOnly;
end;

procedure PTagDefinitionSetInspector.SetTagDefinitionSet(
  Value: PTagDefinitionSet);
begin
  FTagDefinitionSet := Value;
end;

function PTagDefinitionSetInspector.GetProfile: PProfile;
begin
  if FTagDefinitionSet = nil then
    Result := nil
  else
    Result := FTagDefinitionSet.Profile;
end;

function PTagDefinitionSetInspector.IsDefaultValue(ATagDefinition: PTagDefinition): Boolean;
begin
  Result := (Model.FindTaggedValue(Profile.Name, ATagDefinition.TagDefinitionSet.Name, ATagDefinition.Name) = nil);
end;

 procedure PTagDefinitionSetInspector.SetModel(Value: PExtensibleModel);
 begin
  if FModel <> nil then
    FinalizeEditingCurrentModel;
  FModel := Value;
 end;

procedure PTagDefinitionSetInspector.HandleAddCollectionTaggedValue(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
  ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel);
begin
  if Assigned(FOnAddCollectionTaggedValue) then
    FOnAddCollectionTaggedValue(Self, AModel, AProfileName, ATagDefinitionSetName, AName, Value);
end;

procedure PTagDefinitionSetInspector.HandleRemoveCollectionTaggedValue(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
  ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel);
begin
  if Assigned(FOnRemoveCollectionTaggedValue) then
    FOnRemoveCollectionTaggedValue(Self, AModel, AProfileName, ATagDefinitionSetName, AName, Value);
end;

procedure PTagDefinitionSetInspector.HandleChangeCollectionTaggedValueIndex(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
  ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel; NewIdx: Integer);
begin
  if Assigned(FOnChangeCollectionTaggedValueOrder) then
    FOnChangeCollectionTaggedValueOrder(Self, AModel, AProfileName, ATagDefinitionSetName, AName, Value, NewIdx);
end;



procedure PTagDefinitionSetInspector.Setup;
begin
  SetupRows;
end;

// PTagDefinitionSetInspector
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TTaggedValueEditorForm

procedure TTaggedValueEditorForm.FormCreate(Sender: TObject);
begin
  //TagDefinitionSetInspector := PTagDefinitionSetInspector.Create(Self, Inspector);
  TagDefinitionSetInspector.OnInspectorChange := HandleInspectorChange;
  TagDefinitionSetInspector.OnDataTaggedValueChange := HandleDataTaggedValueChange;
  TagDefinitionSetInspector.OnReferenceTaggedValueChange := HandleReferenceTaggedValueChange;
  TagDefinitionSetInspector.OnAddCollectionTaggedValue := HandleAddCollectionTaggedValue;
  TagDefinitionSetInspector.OnRemoveCollectionTaggedValue := HandleRemoveCollectionTaggedValue;
  TagDefinitionSetInspector.OnChangeCollectionTaggedValueOrder := HandleChangeCollectionTaggedValueIndex;
  TagDefinitionSetInspector.OnSetTaggedValueAsDefault := HandleSetTaggedValueAsDefault;
  NLSManager.SetFile(ExtractFilePath(Application.ExeName) + 'NLS\TAGVALED.LNG');
  NLSManager.TranslateComponent(Self, []);
end;

procedure TTaggedValueEditorForm.FormDestroy(Sender: TObject);
begin
  TagDefinitionSetInspector.Free;
end;

procedure TTaggedValueEditorForm.SetModel(Value: PExtensibleModel);
begin
  TagDefinitionSetInspector.Model := Value;
  FModel := Value;
end;

procedure TTaggedValueEditorForm.SetReadOnly(Value: Boolean);
begin
  FReadOnly := Value;
  TagDefinitionSetInspector.ReadOnly := Value;
end;

function TTaggedValueEditorForm.CurrentProfile: PProfile;
begin
  Result := nil;
  if TaggedValueTabControl.TabIndex <> -1 then
    Result := TaggedValueTabControl.Tabs.Objects[TaggedValueTabControl.TabIndex] as PProfile;
end;

function TTaggedValueEditorForm.CurrentTagDefinitionSet: PTagDefinitionSet;
begin
  Result := nil;
  if TagDefinitionSetComboBox.ItemIndex <> -1 then
    Result := TagDefinitionSetComboBox.Items.Objects[TagDefinitionSetComboBox.ItemIndex] as PTagDefinitionSet;
end;

procedure TTaggedValueEditorForm.SetupTaggedValueTab(AProfile: PProfile; DefaultTagDefinitionSetName: string = '');
var
  Idx: Integer;
  I: Integer;
begin
  TagDefinitionSetComboBox.Clear;
  for I := 0 to AProfile.TagDefinitionSetCount - 1 do
    if AProfile.TagDefinitionSets[I].CanApplyTo(Model.MetaClass.Name) then
      TagDefinitionSetComboBox.Items.AddObject(AProfile.TagDefinitionSets[I].Name,
        AProfile.TagDefinitionSets[I]);
  if TagDefinitionSetComboBox.Items.Count > 0 then begin

    // Finish any operation related to the previously selected tag tab
    if Assigned(TagDefinitionSetInspector.TagDefinitionSet) then
      TagDefinitionSetInspector.ClearRows; // This forces finalizing old rows

    Idx := TagDefinitionSetComboBox.Items.IndexOf(DefaultTagDefinitionSetName);
    if (DefaultTagDefinitionSetName <> '') and (Idx <> -1) then begin
      TagDefinitionSetComboBox.ItemIndex := Idx;
      TagDefinitionSetInspector.TagDefinitionSet := TagDefinitionSetComboBox.Items.Objects[Idx] as PTagDefinitionSet;
      TagDefinitionSetInspector.Setup;
    end
    else begin
      TagDefinitionSetComboBox.ItemIndex := 0;
      TagDefinitionSetInspector.TagDefinitionSet := TagDefinitionSetComboBox.Items.Objects[0] as PTagDefinitionSet;
      TagDefinitionSetInspector.Setup;
    end;
  end;
end;

procedure TTaggedValueEditorForm.SetupTaggedTabControl;

  function ExistsAvailableTagDefinitionSet(AProfile: PProfile): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 0 to AProfile.TagDefinitionSetCount - 1 do
      if AProfile.TagDefinitionSets[I].CanApplyTo(Model.MetaClass.Name) then begin
        Result := True;
        Exit;
      end;
  end;

var
  S: PStereotype;
  Idx: Integer;
  I: Integer;
begin
  TaggedValueTabControl.Tabs.Clear;
  TagDefinitionSetComboBox.Items.Clear;
  TagDefinitionSetInspector.ClearRows;

  if Model <> nil then begin
    // append tab sheets for include profiles
    for I := 0 to ExtensionManager.IncludedProfileCount - 1 do begin
      if ExistsAvailableTagDefinitionSet(ExtensionManager.IncludedProfiles[I]) then
        TaggedValueTabControl.Tabs.AddObject(ExtensionManager.IncludedProfiles[I].Name,
          ExtensionManager.IncludedProfiles[I]);
    end;
    // set active tab sheet
    if (TaggedValueTabControl.Tabs.Count > 0) then begin
      if (FModel.StereotypeProfile = '') then begin
        Idx := -1;
        S := nil;
      end
      else begin
        Idx := TaggedValueTabControl.Tabs.IndexOf(Model.StereotypeProfile);
        S := ExtensionManager.FindStereotype(Model.StereotypeProfile, Model.StereotypeName, FModel.MetaClass.Name);
      end;
      if (Idx > -1) and Assigned(S) then begin
        TaggedValueTabControl.TabIndex := Idx;
        if Assigned(S.TagDefinitionSet) then
          SetupTaggedValueTab(TaggedValueTabControl.Tabs.Objects[Idx] as PProfile, S.TagDefinitionSet.Name)
        else
          SetupTaggedValueTab(TaggedValueTabControl.Tabs.Objects[Idx] as PProfile)
      end
      else begin
        TaggedValueTabControl.TabIndex := 0;
        SetupTaggedValueTab(TaggedValueTabControl.Tabs.Objects[0] as PProfile);
      end;
    end;
  end;
end;

procedure TTaggedValueEditorForm.UpdateFormTitle;
begin
  if Model = nil then
    Caption := TXT_TITLE_TAGGEDVALUEEDITORFORM + ' - (' + TAGGEDVALUEEDITORFORM_NOMODEL + ')'
  else
    Caption := TXT_TITLE_TAGGEDVALUEEDITORFORM + ' - ('
      + Copy(Model.ClassName, 2, Length(Model.ClassName) - 1) + ') ' + Model.Name;
end;

procedure TTaggedValueEditorForm.UpdateUIState;
var
  FD: PTagDefinition;
begin
  FD := TagDefinitionSetInspector.FocusedTagDefinition;
  DefaultButton.Enabled := (Model <> nil) and (not FReadOnly) and (FD <> nil)
    and (not FD.Lock) and (CurrentProfile <> nil)
    and (Model.FindTaggedValue(CurrentProfile.Name, FD.TagDefinitionSet.Name, FD.Name) <> nil);
end;

procedure TTaggedValueEditorForm.HandleDataTaggedValueChange(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
  ATagDefinitionSetName: string; AName: string; Value: string);
begin
  if Assigned(FOnDataTaggedValueChange) then
    FOnDataTaggedValueChange(Self, AModel, AProfileName, ATagDefinitionSetName, AName, Value);
end;

procedure TTaggedValueEditorForm.HandleReferenceTaggedValueChange(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
  ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel);
begin
  if Assigned(FOnReferenceTaggedValueChange) then
    FOnReferenceTaggedValueChange(Self, AModel, AProfileName, ATagDefinitionSetName, AName, Value);
end;

procedure TTaggedValueEditorForm.HandleInspectorChange(Sender: TObject);
begin
  UpdateUIState;
end;

procedure TTaggedValueEditorForm.HandleAddCollectionTaggedValue(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
  ATagDefintionSetName: string; AName: string; Value: PExtensibleModel);
begin
  if Assigned(FOnAddCollectionTaggedValue) then
    FOnAddCollectionTaggedValue(Self, AModel, AProfileName, ATagDefintionSetName, AName, Value);
end;

procedure TTaggedValueEditorForm.HandleRemoveCollectionTaggedValue(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
  ATagDefintionSetName: string; AName: string; Value: PExtensibleModel);
begin
  if Assigned(FOnRemoveCollectionTaggedValue) then
    FOnRemoveCollectionTaggedValue(Self, AModel, AProfileName, ATagDefintionSetName, AName, Value);
end;

procedure TTaggedValueEditorForm.HandleChangeCollectionTaggedValueIndex(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
  ATagDefinitionSetName: string; AName: string; Value: PExtensibleModel; NewIdx: Integer);
begin
  if Assigned(FOnChangeCollectionTaggedValueOrder) then
    FOnChangeCollectionTaggedValueOrder(Self, AModel, AProfileName, ATagDefinitionSetName, AName, Value, NewIdx);
end;

procedure TTaggedValueEditorForm.HandleSetTaggedValueAsDefault(Sender: TObject; AModel: PExtensibleModel; AProfileName: string;
  ATagDefinitionSetName: string; AName: string);
begin
  if Assigned(FOnSetTaggedValueAsDefault) then
    FOnSetTaggedValueAsDefault(Self, AModel, AProfileName, ATagDefinitionSetName, AName);
end;

procedure TTaggedValueEditorForm.UpdateTaggedValues;
begin
  if not Visible then
    Exit;
  TagDefinitionSetInspector.UpdateTaggedValues;
  if TaggedValueCollectionEditorForm.Visible then
    TaggedValueCollectionEditorForm.UpdateTaggedValueCollection;
  UpdateFormTitle;
  UpdateUIState;
end;

procedure TTaggedValueEditorForm.Inspect;
begin
  if not Visible then
    Exit;
  SetupTaggedTabControl;
  UpdateTaggedValues;
end;

procedure TTaggedValueEditorForm.ShowTaggedValues(AModel: PExtensibleModel);
begin
  Model := AModel;
  Show;
  Inspect;
end;

// event handlers
procedure TTaggedValueEditorForm.TaggedValueTabControlChange(Sender: TObject);
begin
  SetupTaggedValueTab(CurrentProfile);
  UpdateTaggedValues;
end;

procedure TTaggedValueEditorForm.TagDefinitionSetComboBoxSelect(Sender: TObject);
begin
  TagDefinitionSetInspector.TagDefinitionSet := CurrentTagDefinitionSet;
  TagDefinitionSetInspector.Setup;
  UpdateTaggedValues;
end;

procedure TTaggedValueEditorForm.DefaultButtonClick(Sender: TObject);
begin
  TagDefinitionSetInspector.SetFocusedTaggedValueAsDefault;
end;

procedure TTaggedValueEditorForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

// TTaggedValueEditorForm
////////////////////////////////////////////////////////////////////////////////

procedure TTaggedValueEditorForm.HelpButtonClick(Sender: TObject);
begin
  ShowStarUMLHelpPage;
end;

end.
