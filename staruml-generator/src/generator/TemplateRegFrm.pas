unit TemplateRegFrm;

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
  DirectMDAProc, DirectMDAObjects,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxInspRw, dxInspct, dxCntner, ExtCtrls, StdCtrls,
  WhiteStarUML_TLB, ImgList, Buttons, FlatPanel, dxExEdtr;

const
  TXT_PREVIEW = 'Preview';
  TXT_ATTACH_FILE = 'Attach files';

  TXT_BASIC_INFO = 'Set basic informations of template.';
  TXT_DETAIL_INTO = 'Set detail informations of template.';
  TXT_DESC_NAME = 'Input template''s name.';
  TXT_DESC_GROUP = 'Select group to contain template. (New group is available except existing group)';
  TXT_DESC_CATEGORY = 'Select category to contain template. (New category is available except existing category)';
  TXT_DESC_DESCRIPTION = 'Fill overall descriptions for template.';
  TXT_DESC_DOCTYPE = 'Select a document type of DOCUMENT, REPORT, and CODE for template.';
  TXT_DESC_FORMAT = 'Select format of document to going to be generated.';
  TXT_DESC_VERSION = 'Fill version information of template. (eg. 1.0)';
  TXT_DESC_APPROACH = 'Select a approach apply to model for generation.';
  TXT_DESC_PROFILES = 'Selece profile to apply to model for generation.';
  TXT_DESC_TRANSLATOR_TYPE = 'Specify type of document translator. Select one of the followings.'
      + 'WORD(Word document translator), EXCEL(Excel document translator), POWERPOINT(Powerpoint document translator), TEXT(Text document translator)'
      + ', COM(COM-based translator made by user), SCRIPT(Script based translator made by user)'
      + ', EXE(EXE-based translator made by user)';
  TXT_DESC_TRANSLATOR_NAME = 'Specify name of document translator. It is not specified for built-in translator(WORD, EXCEL, POWERPOINT, TEXT).'
      + ' Input filename for translator made by user.';
  TXT_DESC_SAMPLE = 'Select example model file for generating document.';
  TXT_DESC_TUTORIAL = 'Select tutorial file for generating document.';
  TXT_DESC_VALIDATOR = 'Select model validator to chech appropriate model.';
  TXT_DESC_PREVIEWS = 'Select preview result images for template.';
  TXT_DESC_PARAMETERS = 'Set required parameters for generating document.';
  TXT_DESC_ATTACHFILES = 'Select attached files for generating document.';

type
  // TTemplateRegisterForm
  TTemplateRegisterForm = class(TForm)
    PropertyInspector: TdxInspector;
    NameRow: TdxInspectorTextRow;
    GroupRow: TdxInspectorTextPickRow;
    CategoryRow: TdxInspectorTextPickRow;
    VersionRow: TdxInspectorTextRow;
    DescriptionRow: TdxInspectorTextPopupRow;
    DocumentTypeRow: TdxInspectorTextPickRow;
    FormatRow: TdxInspectorTextPickRow;
    TranslatorTypeRow: TdxInspectorTextPickRow;
    TranslatorNameRow: TdxInspectorTextButtonRow;
    SampleRow: TdxInspectorTextButtonRow;
    TutorialRow: TdxInspectorTextButtonRow;
    ValidatorRow: TdxInspectorTextButtonRow;
    PreviewsRow: TdxInspectorTextButtonRow;
    ParametersRow: TdxInspectorTextButtonRow;
    AttachFilesRow: TdxInspectorTextButtonRow;
    DetailInfoRow: TdxInspectorTextRow;
    TitleLabel: TLabel;
    AcceptButton: TButton;
    CancelButton: TButton;
    Bevel: TBevel;
    StandardInfoRow: TdxInspectorTextRow;
    ApproachRow: TdxInspectorTextPickRow;
    ProfilesRow: TdxInspectorTextButtonRow;
    OpenDialog: TOpenDialog;
    DescMemo: TMemo;
    PathLabel: TLabel;
    PathEdit: TEdit;
    PathButton: TSpeedButton;
    SaveDialog: TSaveDialog;
    OpenScriptDialog: TOpenDialog;
    OpenExeDialog: TOpenDialog;
    Label1: TLabel;
    GenerationUnitDescPanel: TFlatPanel;
    GenerationUnitDescMemo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ProfilesRowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure PreviewsRowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure AttachFilesRowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure SampleRowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure TutorialRowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure ValidatorRowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure DescriptionRowCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure DescriptionRowPopup(Sender: TObject; const EditText: String);
    procedure ParametersRowButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure PathButtonClick(Sender: TObject);
    procedure PropertyInspectorEdited(Sender: TObject;
      Node: TdxInspectorNode; Row: TdxInspectorRow);
    procedure FormShow(Sender: TObject);
    procedure TranslatorTypeRowCloseUp(Sender: TObject; var Value: Variant;
      var Accept: Boolean);
    procedure TranslatorNameRowButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure PropertyInspectorChangeNode(Sender: TObject; OldNode,
      Node: TdxInspectorNode);
  private
    FStarUMLApp: IStarUMLApplication;
    FDirectMDAProcessor: TGeneratorProcessor;
    FGenerationUnit: PGenerationUnit;
    { initializing / finalizing methods }
    procedure Initialize;
    procedure Finalize;
    function Initialized: Boolean;
    { getter }
    function GetGenerationUnitPath: string;
    { inspector setting methods }
    procedure SetupGroupRow;
    procedure SetupCategoryRow;
    procedure SetupFormatRow;
    procedure SetupApproachRow;
    procedure SetupInspector;
    { property editing methods }
    function GetProfilesString: string;
    function GetPreviewsString: string;
    function GetAttachFilesString: string;
    function GetParametersString: string;
    function GetDescriptionString: string;
    procedure EditProfiles;
    procedure EditPreviews;
    procedure EditAttachFiles;
    procedure EditParameters;
    procedure ApplyChanges;
    function GetPresuppositionedFileName: string;
    { UI updating methods }
    function IsBuiltInGenerator(GeneratorType: string): Boolean;
    function RequisiteInputed: Boolean;
    function GetItemDescription(Row: TdxInspectorRow): string;
    procedure UpdateUIStates;
    { etc methods }
    procedure RegulateFilesPath;
    procedure SetGenerationUnitPath(const Value: string);
  public
    function Execute: Boolean;
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
    property DirectMDAProcessor: TGeneratorProcessor read FDirectMDAProcessor write FDirectMDAProcessor;
    property GenerationUnit: PGenerationUnit read FGenerationUnit;
    property GenerationUnitPath: string read GetGenerationUnitPath write SetGenerationUnitPath;
  end;

implementation

{$R *.dfm}

uses
  ProfileSelFrm, ColEdtFrm, ParamDefFrm, Serializers, Utilities, Symbols;

////////////////////////////////////////////////////////////////////////////////
// TTemplateRegisterForm

procedure TTemplateRegisterForm.Initialize;
begin
  StarUMLApp := nil;
  FGenerationUnit := nil;
end;

procedure TTemplateRegisterForm.Finalize;
begin
  StarUMLApp := nil;
end;

function TTemplateRegisterForm.Initialized: Boolean;
begin
  Result := (FStarUMLApp <> nil) and (FDirectMDAProcessor <> nil);
end;

function TTemplateRegisterForm.GetGenerationUnitPath: string;
begin
  Result := PathEdit.Text;
end;

procedure TTemplateRegisterForm.SetGenerationUnitPath(const Value: string);
begin
  PathEdit.Text := Value;
end;

procedure TTemplateRegisterForm.SetupGroupRow;
var
  GenUnit: PGenerationUnit;
  I: Integer;
begin
  GroupRow.Items.Clear;
  for I := 0 to FDirectMDAProcessor.GenerationUnitCount - 1 do begin
    GenUnit := FDirectMDAProcessor.GenerationUnits[I];
    if GroupRow.Items.IndexOf(GenUnit.Group) = -1 then
      GroupRow.Items.Add(GenUnit.Group);
  end;
end;

procedure TTemplateRegisterForm.SetupCategoryRow;
var
  GenUnit: PGenerationUnit;
  I: Integer;
begin
  CategoryRow.Items.Clear;
  for I := 0 to FDirectMDAProcessor.GenerationUnitCount - 1 do begin
    GenUnit := FDirectMDAProcessor.GenerationUnits[I];
    if CategoryRow.Items.IndexOf(GenUnit.Category) = -1 then
      CategoryRow.Items.Add(GenUnit.Category);
  end;
end;

procedure TTemplateRegisterForm.SetupFormatRow;
var
  GenUnit: PGenerationUnit;
  I: Integer;
begin
  FormatRow.Items.Clear;
  for I := 0 to FDirectMDAProcessor.GenerationUnitCount - 1 do begin
    GenUnit := FDirectMDAProcessor.GenerationUnits[I];
    if FormatRow.Items.IndexOf(UpperCase(GenUnit.Format)) = -1 then
      FormatRow.Items.Add(UpperCase(GenUnit.Format));
  end;
end;

procedure TTemplateRegisterForm.SetupApproachRow;
var
  I: Integer;
begin
  ApproachRow.Items.Clear;
  for I := 0 to StarUMLApp.ProjectManager.GetAvailableApproachCount - 1 do
    ApproachRow.Items.Add(StarUMLApp.ProjectManager.GetAvailableApproachAt(I));
end;

procedure TTemplateRegisterForm.SetupInspector;
begin
  SetupGroupRow;
  SetupCategoryRow;
  SetupFormatRow;
  SetupApproachRow;
end;

function TTemplateRegisterForm.GetProfilesString: string;
begin
  Result := Format('(Collection)[%d]', [FGenerationUnit.ProfileCount]);
end;

function TTemplateRegisterForm.GetPreviewsString: string;
begin
  Result := Format('(Collection)[%d]', [FGenerationUnit.PreviewCount]);
end;

function TTemplateRegisterForm.GetAttachFilesString: string;
begin
  Result := Format('(Collection)[%d]', [FGenerationUnit.AttachFileCount]);
end;

function TTemplateRegisterForm.GetParametersString: string;
begin
  Result := Format('(Collection)[%d]', [FGenerationUnit.ParameterCount]);
end;

function TTemplateRegisterForm.GetDescriptionString: string;
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.Text := FGenerationUnit.Description;
    if SL.Count = 0 then
      Result := ''
    else if SL.Count = 1 then
      Result := SL[0]
    else
      Result := '(Text)...';
  finally
    SL.Free;
  end;
end;

procedure TTemplateRegisterForm.EditProfiles;
var
  ProfileSelForm: TProfileSelectorForm;
  I: Integer;
begin
  ProfileSelForm := TProfileSelectorForm.Create(Self);
  try
    ProfileSelForm.StarUMLApp := StarUMLApp;
    for I := 0 to FGenerationUnit.ProfileCount - 1 do
      ProfileSelForm.AddSelectedProfiles(FGenerationUnit.Profiles[I]);
    if ProfileSelForm.Execute then begin
      FGenerationUnit.ClearProfiles;
      for I := 0 to ProfileSelForm.SelectedProfileCount - 1 do
        FGenerationUnit.AddProfile(ProfileSelForm.SelectedProfiles[I]);
      ProfilesRow.Text := GetProfilesString;
    end;
  finally
    ProfileSelForm.Free;
  end;
end;

procedure TTemplateRegisterForm.EditPreviews;
var
  ColEditForm: TCollectionEditorForm;
  I: Integer;
begin
  ColEditForm := TCollectionEditorForm.Create(Self);
  try
    ColEditForm.Title := TXT_PREVIEW;
    ColEditForm.CollectionName := TXT_PREVIEW;
    ColEditForm.ItemType := itImageFile;
    for I := 0 to FGenerationUnit.PreviewCount - 1 do
      ColEditForm.AddItem(FGenerationUnit.Previews[I]);
    if ColEditForm.Execute then begin
      FGenerationUnit.ClearPreviews;
      for I := 0 to ColEditForm.ItemCount - 1 do
        FGenerationUnit.AddPreview(ColEditForm.Items[I]);
      PreviewsRow.Text := GetPreviewsString;
    end;
  finally
    ColEditForm.Free;
  end;
end;

procedure TTemplateRegisterForm.EditAttachFiles;
var
  ColEditForm: TCollectionEditorForm;
  I: Integer;
begin
  ColEditForm := TCollectionEditorForm.Create(Self);
  try
    ColEditForm.Title := TXT_ATTACH_FILE;
    ColEditForm.CollectionName := TXT_ATTACH_FILE;
    ColEditForm.ItemType := itFile;
    for I := 0 to FGenerationUnit.AttachFileCount - 1 do
      ColEditForm.AddItem(FGenerationUnit.AttachFiles[I]);
    if ColEditForm.Execute then begin
      FGenerationUnit.ClearAttachFiles;
      for I := 0 to ColEditForm.ItemCount - 1 do
        FGenerationUnit.AddAttachFile(ColEditForm.Items[I]);
      AttachFilesRow.Text := GetAttachFilesString;
    end;
  finally
    ColEditForm.Free;
  end;
end;

procedure TTemplateRegisterForm.EditParameters;
var
  ParamDefForm: TParameterDefinitionForm;
begin
  ParamDefForm := TParameterDefinitionForm.Create(Self);
  try
    ParamDefForm.GenerationUnit := FGenerationUnit;
    ParamDefForm.Execute;
    ParametersRow.Text := GetParametersString;
  finally
    ParamDefForm.Free;
  end;
end;

procedure TTemplateRegisterForm.ApplyChanges;
begin
  FGenerationUnit.Name := NameRow.Text;
  FGenerationUnit.Group := GroupRow.Text;
  FGenerationUnit.Category := CategoryRow.Text;
  FGenerationUnit.DocumentType := StringToDocumentTypeKind(DocumentTypeRow.Text);
  FGenerationUnit.Format := FormatRow.Text;
  FGenerationUnit.Version := VersionRow.Text;
  FGenerationUnit.Approach := ApproachRow.Text;
  FGenerationUnit.TranslatorType := StringToTranslatorTypeKind(TranslatorTypeRow.Text);
  FGenerationUnit.TranslatorName := TranslatorNameRow.Text;
  FGenerationUnit.Sample := SampleRow.Text;
  FGenerationUnit.Tutorial := TutorialRow.Text;
  FGenerationUnit.Validator := ValidatorRow.Text;
end;

function TTemplateRegisterForm.GetPresuppositionedFileName: string;
var
  Dir: string;
begin
  if GroupRow.Text <> '' then
    Dir := GetDirectMDAPath + '\' + GroupRow.Text + '\' + NameRow.Text
  else
    Dir := GetDirectMDAPath + '\' + NameRow.Text;
  Result := Dir + '\' + NameRow.Text + EXT_TDF;
end;

function TTemplateRegisterForm.IsBuiltInGenerator(GeneratorType: string): Boolean;
begin
  Result := (GeneratorType = VALUE_TRANSTYPE_WORD) or (GeneratorType = VALUE_TRANSTYPE_EXCEL)
    or (GeneratorType = VALUE_TRANSTYPE_POWERPOINT) or (GeneratorType = VALUE_TRANSTYPE_TEXT);
end;

function TTemplateRegisterForm.RequisiteInputed: Boolean;
begin
  Result := (NameRow.Text <> '') and (GroupRow.Text <> '') and (CategoryRow.Text <> '')
    and (DocumentTypeRow.Text <> '') and (FormatRow.Text <> '') and (TranslatorTypeRow.Text <> '')
    and (IsBuiltInGenerator(TranslatorTypeRow.Text) or (not IsBuiltInGenerator(TranslatorTypeRow.Text) and (TranslatorNameRow.Text <> '')));
end;

function TTemplateRegisterForm.GetItemDescription(Row: TdxInspectorRow): string;
begin
  if Row = StandardInfoRow then
    Result := TXT_BASIC_INFO
  else if Row = NameRow then
    Result := TXT_DESC_NAME
  else if Row = GroupRow then
    Result := TXT_DESC_GROUP
  else if Row = CategoryRow then
    Result := TXT_DESC_CATEGORY
  else if Row = DescriptionRow then
    Result := TXT_DESC_DESCRIPTION
  else if Row = DocumentTypeRow then
    Result := TXT_DESC_DOCTYPE
  else if Row = FormatRow then
    Result := TXT_DESC_FORMAT
  else if Row = VersionRow then
    Result := TXT_DESC_VERSION
  else if Row = ApproachRow then
    Result := TXT_DESC_APPROACH
  else if Row = ProfilesRow then
    Result := TXT_DESC_PROFILES
  else if Row = TranslatorTypeRow then
    Result := TXT_DESC_TRANSLATOR_TYPE
  else if Row = TranslatorNameRow then
    Result := TXT_DESC_TRANSLATOR_NAME
  else if Row = SampleRow then
    Result := TXT_DESC_SAMPLE
  else if Row = TutorialRow then
    Result := TXT_DESC_TUTORIAL
  else if Row = ValidatorRow then
    Result := TXT_DESC_VALIDATOR
  else if Row = PreviewsRow then
    Result := TXT_DESC_PREVIEWS
  else if Row = ParametersRow then
    Result := TXT_DESC_PARAMETERS
  else if Row = AttachFilesRow then
    Result := TXT_DESC_ATTACHFILES
  else if Row = DetailInfoRow then
    Result := TXT_DETAIL_INTO
  else
    Result := '';
end;

procedure TTemplateRegisterForm.UpdateUIStates;
begin
  AcceptButton.Enabled := (PathEdit.Text <> '') and RequisiteInputed;
  TranslatorNameRow.ReadOnly := IsBuiltInGenerator(TranslatorTypeRow.Text);
  TranslatorNameRow.Buttons[0].Visible := (TranslatorTypeRow.Text = VALUE_TRANSTYPE_SCRIPT)
    or (TranslatorTypeRow.Text = VALUE_TRANSTYPE_EXE);
end;

procedure TTemplateRegisterForm.RegulateFilesPath;
var
  TemplateDir: string;
  I: Integer;
begin
  TemplateDir := ExtractFileDir(GenerationUnitPath);
  if (FGenerationUnit.Sample <> '') and (ExtractFileDir(FGenerationUnit.Sample) = TemplateDir) then
    FGenerationUnit.Sample := ExtractFileName(FGenerationUnit.Sample);
  for I := 0 to FGenerationUnit.PreviewCount - 1 do begin
    if ExtractFileDir(FGenerationUnit.Previews[I]) = TemplateDir then
      FGenerationUnit.Previews[I] := ExtractFileName(FGenerationUnit.Previews[I]);
  end;
  if (FGenerationUnit.Validator <> '') and (ExtractFileDir(FGenerationUnit.Validator) = TemplateDir) then
    FGenerationUnit.Validator := ExtractFileName(FGenerationUnit.Validator);
  for I := 0 to FGenerationUnit.AttachFileCount - 1 do begin
    if ExtractFileDir(FGenerationUnit.AttachFiles[I]) = TemplateDir then
      FGenerationUnit.AttachFiles[I] := ExtractFileName(FGenerationUnit.AttachFiles[I]);
  end;
  if (FGenerationUnit.TranslatorType = ttScript) or (FGenerationUnit.TranslatorType = ttExe) then begin
    if (FGenerationUnit.TranslatorName <> '') and (ExtractFileDir(FGenerationUnit.TranslatorName) = TemplateDir) then
      FGenerationUnit.TranslatorName := ExtractFileName(FGenerationUnit.TranslatorName);
  end;
end;

function TTemplateRegisterForm.Execute: Boolean;
var
  Serializer: PGenerationUnitSerializer;
  Accepted: Boolean;
begin
  if not Initialized then
    raise EIntializationException.Create(ERR_NOT_INITIALIZED);
  SetupInspector;

  if GenerationUnitPath = '' then
    FGenerationUnit := PGenerationUnit.Create
  else begin
    Serializer := PGenerationUnitSerializer.Create;
    try
      FGenerationUnit := PGenerationUnit.Create;
      try
        Serializer.ReadGenerationUnit(FGenerationUnit, GenerationUnitPath);
      except
        FGenerationUnit.Free;
      end;
    finally
      Serializer.Free;
    end;
  end;

  try
    FGenerationUnit.Date := DateToStr(Date);
    Accepted := (ShowModal = mrOk);
  except
    Accepted := False;
  end;
  if Accepted then
    RegulateFilesPath
  else begin
    FGenerationUnit.Free;
    FGenerationUnit := nil;
  end;
  Result := Accepted;
end;

// TTemplateRegisterForm
////////////////////////////////////////////////////////////////////////////////

procedure TTemplateRegisterForm.FormCreate(Sender: TObject);
begin
  Initialize;
end;

procedure TTemplateRegisterForm.FormDestroy(Sender: TObject);
begin
  Finalize;
end;

procedure TTemplateRegisterForm.ProfilesRowButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  EditProfiles;
  ApplyChanges;
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.PreviewsRowButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  EditPreviews;
  ApplyChanges;
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.AttachFilesRowButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  EditAttachFiles;
  ApplyChanges;
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.SampleRowButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if OpenDialog.Execute then begin
    SampleRow.Text := OpenDialog.FileName;
    ApplyChanges;
    UpdateUIStates;
  end;
end;

procedure TTemplateRegisterForm.TutorialRowButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if OpenDialog.Execute then begin
    TutorialRow.Text := OpenDialog.FileName;
    ApplyChanges;
    UpdateUIStates;
  end;
end;

procedure TTemplateRegisterForm.ValidatorRowButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if OpenDialog.Execute then begin
    ValidatorRow.Text := OpenDialog.FileName;
    ApplyChanges;
    UpdateUIStates;
  end;
end;

procedure TTemplateRegisterForm.DescriptionRowCloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
  FGenerationUnit.Description := DescMemo.Text;
  DescriptionRow.Text := GetDescriptionString;
  ApplyChanges;
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.DescriptionRowPopup(Sender: TObject;
  const EditText: String);
begin
  DescMemo.Lines.Text := FGenerationUnit.Description;
  ApplyChanges;
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.ParametersRowButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  EditParameters;
  ApplyChanges;
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.PathButtonClick(Sender: TObject);
begin
  SaveDialog.InitialDir := GetDirectMDAPath + '\' + DIR_GENERATION_UNITS;
  if SaveDialog.Execute then begin
    PathEdit.Text := SaveDialog.FileName;
    UpdateUIStates;
  end;
end;

procedure TTemplateRegisterForm.PropertyInspectorEdited(Sender: TObject;
  Node: TdxInspectorNode; Row: TdxInspectorRow);
begin
  ApplyChanges;
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.FormShow(Sender: TObject);
begin
  UpdateUIStates;

  if GenerationUnitPath <> '' then begin
    Caption := 'Modify template';
    PathEdit.ReadOnly := true;
    PathButton.Visible := false;
    NameRow.Text := FGenerationUnit.Name;
    GroupRow.Text := FGenerationUnit.Group;
    CategoryRow.Text := FGenerationUnit.Category;
    DocumentTypeRow.Text := DocumentTypeKindToString(FGenerationUnit.DocumentType);
    FormatRow.Text := FGenerationUnit.Format;
    VersionRow.Text := FGenerationUnit.Version;
    ApproachRow.Text := FGenerationUnit.Approach;
    TranslatorTypeRow.Text := TranslatorTypeKindToString(FGenerationUnit.TranslatorType);
    TranslatorNameRow.Text := FGenerationUnit.TranslatorName;
    SampleRow.Text := FGenerationUnit.Sample;
    TutorialRow.Text := FGenerationUnit.Tutorial;
    ValidatorRow.Text := FGenerationUnit.Validator;
  end;
end;

procedure TTemplateRegisterForm.TranslatorTypeRowCloseUp(Sender: TObject;
  var Value: Variant; var Accept: Boolean);
begin
  TranslatorTypeRow.Text := Value;
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.TranslatorNameRowButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  if TranslatorTypeRow.Text = VALUE_TRANSTYPE_SCRIPT then begin
    if OpenScriptDialog.Execute then
      TranslatorNameRow.Text := OpenScriptDialog.FileName;
  end
  else if TranslatorTypeRow.Text = VALUE_TRANSTYPE_EXE then begin
    if OpenExeDialog.Execute then
      TranslatorNameRow.Text := OpenExeDialog.FileName;
  end
end;

procedure TTemplateRegisterForm.PropertyInspectorChangeNode(
  Sender: TObject; OldNode, Node: TdxInspectorNode);
begin
  if Node <> nil then
    GenerationUnitDescMemo.Text := GetItemDescription((Node as TdxInspectorRowNode).Row);
end;

end.
