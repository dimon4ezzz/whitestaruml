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
{ modified versions of such code, with unchange license). You may copy and    }
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
  Dialogs, ExtCtrls, StdCtrls, ImgList, Buttons, FlatPanel, WhiteStarUML_TLB,
  NxPropertyItemClasses, NxPropertyItems, NxScrollControl, NxInspector;

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
  TXT_DESC_APPROACH = 'Select a approach to apply to model for generation.';
  TXT_DESC_PROFILES = 'Select profile to apply to model for generation.';
  TXT_DESC_TRANSLATOR_TYPE = 'Specify type of document translator. Select one of the followings.'
      + 'WORD(Word document translator), EXCEL(Excel document translator), POWERPOINT(Powerpoint document translator), TEXT(Text document translator)'
      + ', COM(COM-based translator made by user), SCRIPT(Script based translator made by user)'
      + ', EXE(EXE-based translator made by user)';
  TXT_DESC_TRANSLATOR_NAME = 'Specify name of document translator. It is not specified for built-in translator(WORD, EXCEL, POWERPOINT, TEXT).'
      + ' Input filename for translator made by user.';
  TXT_DESC_SAMPLE = 'Select example model file for generating document.';
  TXT_DESC_TUTORIAL = 'Select tutorial file for generating document.';
  TXT_DESC_VALIDATOR = 'Select model validator to check appropriate model.';
  TXT_DESC_PREVIEWS = 'Select preview result images for template.';
  TXT_DESC_PARAMETERS = 'Set required parameters for generating document.';
  TXT_DESC_ATTACHFILES = 'Select attached files for generating document.';

type
  // TTemplateRegisterForm
  TTemplateRegisterForm = class(TForm)
    TitleLabel: TLabel;
    AcceptButton: TButton;
    CancelButton: TButton;
    Bevel: TBevel;
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
    PropertyInspector: TNextInspector;
    StandardInfoRow: TNxTextItem;
    NameRow: TNxTextItem;
    GroupRow: TNxComboBoxItem;
    CategoryRow: TNxComboBoxItem;
    DescriptionRow: TNxMemoItem;
    DetailInfoRow: TNxTextItem;
    DocumentTypeRow: TNxComboBoxItem;
    FormatRow: TNxComboBoxItem;
    VersionRow: TNxTextItem;
    ApproachRow: TNxComboBoxItem;
    TranslatorNameRow: TNxButtonItem;
    SampleRow: TNxButtonItem;
    TutorialRow: TNxButtonItem;
    ValidatorRow: TNxButtonItem;
    PreviewsRow: TNxButtonItem;
    AttachFilesRow: TNxButtonItem;
    TranslatorTypeRow: TNxComboBoxItem;
    ProfilesRow: TNxButtonItem;
    ParametersRow: TNxButtonItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ValidatorRowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure DescriptionRowCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure DescriptionRowPopup(Sender: TObject; const EditText: String);
    procedure PathButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TranslatorNameRowButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure PropertyInspectorChange(Sender: TObject; Item: TNxPropertyItem;
      Value: WideString);
    procedure PropertyInspectorSelectItem(Sender: TObject;
      Item: TNxPropertyItem);
    procedure SampleRowButtonClick(Sender: TNxPropertyItem);
    procedure TutorialRowButtonClick(Sender: TNxPropertyItem);
    procedure PreviewsRowButtonClick(Sender: TNxPropertyItem);
    procedure ParametersRowButtonClick(Sender: TNxPropertyItem);
    procedure AttachFilesRowButtonClick(Sender: TNxPropertyItem);
    procedure ProfilesRowButtonClick(Sender: TNxPropertyItem);
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
    function GetItemDescription(Row: TNxPropertyItem): string;
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

procedure TTemplateRegisterForm.SampleRowButtonClick(Sender: TNxPropertyItem);
begin
  if OpenDialog.Execute then begin
    SampleRow.Value := OpenDialog.FileName;
    ApplyChanges;
    UpdateUIStates;
  end;
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
  GroupRow.Lines.Clear;
  for I := 0 to FDirectMDAProcessor.GenerationUnitCount - 1 do begin
    GenUnit := FDirectMDAProcessor.GenerationUnits[I];
    if GroupRow.Lines.IndexOf(GenUnit.Group) = -1 then
      GroupRow.Lines.Add(GenUnit.Group);
  end;
end;

procedure TTemplateRegisterForm.SetupCategoryRow;
var
  GenUnit: PGenerationUnit;
  I: Integer;
begin
  CategoryRow.Lines.Clear;
  for I := 0 to FDirectMDAProcessor.GenerationUnitCount - 1 do begin
    GenUnit := FDirectMDAProcessor.GenerationUnits[I];
    if CategoryRow.Lines.IndexOf(GenUnit.Category) = -1 then
      CategoryRow.Lines.Add(GenUnit.Category);
  end;
end;

procedure TTemplateRegisterForm.SetupFormatRow;
var
  GenUnit: PGenerationUnit;
  I: Integer;
begin
  FormatRow.Lines.Clear;
  for I := 0 to FDirectMDAProcessor.GenerationUnitCount - 1 do begin
    GenUnit := FDirectMDAProcessor.GenerationUnits[I];
    if FormatRow.Lines.IndexOf(UpperCase(GenUnit.Format)) = -1 then
      FormatRow.Lines.Add(UpperCase(GenUnit.Format));
  end;
end;

procedure TTemplateRegisterForm.SetupApproachRow;
var
  I: Integer;
begin
  ApproachRow.Lines.Clear;
  for I := 0 to StarUMLApp.ProjectManager.GetAvailableApproachCount - 1 do
    ApproachRow.Lines.Add(StarUMLApp.ProjectManager.GetAvailableApproachAt(I));
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
      ProfilesRow.Value := GetProfilesString;
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
      PreviewsRow.Value := GetPreviewsString;
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
      AttachFilesRow.Value := GetAttachFilesString;
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
    ParametersRow.Value := GetParametersString;
  finally
    ParamDefForm.Free;
  end;
end;

procedure TTemplateRegisterForm.ApplyChanges;
begin
  FGenerationUnit.Name := NameRow.Value;
  FGenerationUnit.Group := GroupRow.Value;
  FGenerationUnit.Category := CategoryRow.Value;
  FGenerationUnit.DocumentType := StringToDocumentTypeKind(DocumentTypeRow.Value);
  FGenerationUnit.Format := FormatRow.Value;
  FGenerationUnit.Version := VersionRow.Value;
  FGenerationUnit.Approach := ApproachRow.Value;
  FGenerationUnit.TranslatorType := StringToTranslatorTypeKind(TranslatorTypeRow.Value);
  FGenerationUnit.TranslatorName := TranslatorNameRow.Value;
  FGenerationUnit.Sample := SampleRow.Value;
  FGenerationUnit.Tutorial := TutorialRow.Value;
  FGenerationUnit.Validator := ValidatorRow.Value;
end;

function TTemplateRegisterForm.GetPresuppositionedFileName: string;
var
  Dir: string;
begin
  if GroupRow.Value <> '' then
    Dir := GetDirectMDAPath + '\' + GroupRow.Value + '\' + NameRow.Value
  else
    Dir := GetDirectMDAPath + '\' + NameRow.Value;
  Result := Dir + '\' + NameRow.Value + EXT_TDF;
end;

function TTemplateRegisterForm.IsBuiltInGenerator(GeneratorType: string): Boolean;
begin
  Result := (GeneratorType = VALUE_TRANSTYPE_WORD) or (GeneratorType = VALUE_TRANSTYPE_EXCEL)
    or (GeneratorType = VALUE_TRANSTYPE_POWERPOINT) or (GeneratorType = VALUE_TRANSTYPE_TEXT);
end;

function TTemplateRegisterForm.RequisiteInputed: Boolean;
begin
  Result := (NameRow.Value <> '') and (GroupRow.Value <> '') and (CategoryRow.Value <> '')
    and (DocumentTypeRow.Value <> '') and (FormatRow.Value <> '') and (TranslatorTypeRow.Value <> '')
    and (IsBuiltInGenerator(TranslatorTypeRow.Value) or (not IsBuiltInGenerator(TranslatorTypeRow.Value) and (TranslatorNameRow.Value <> '')));
end;

function TTemplateRegisterForm.GetItemDescription(Row: TNxPropertyItem): string;
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
  TranslatorNameRow.ReadOnly := IsBuiltInGenerator(TranslatorTypeRow.Value);
  TranslatorNameRow.Visible := (TranslatorTypeRow.Value = VALUE_TRANSTYPE_SCRIPT)
    or (TranslatorTypeRow.Value = VALUE_TRANSTYPE_EXE);
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

procedure TTemplateRegisterForm.PreviewsRowButtonClick(Sender: TNxPropertyItem);
begin
  EditPreviews;
  ApplyChanges;
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.ValidatorRowButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if OpenDialog.Execute then begin
    ValidatorRow.Value := OpenDialog.FileName;
    ApplyChanges;
    UpdateUIStates;
  end;
end;

procedure TTemplateRegisterForm.AttachFilesRowButtonClick(
  Sender: TNxPropertyItem);
begin
  EditAttachFiles;
  ApplyChanges;
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.DescriptionRowCloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
  FGenerationUnit.Description := DescMemo.Text;
  DescriptionRow.Value := GetDescriptionString;
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

procedure TTemplateRegisterForm.ParametersRowButtonClick(
  Sender: TNxPropertyItem);
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

procedure TTemplateRegisterForm.FormShow(Sender: TObject);
begin
  UpdateUIStates;

  if GenerationUnitPath <> '' then begin
    Caption := 'Modify template';
    PathEdit.ReadOnly := true;
    PathButton.Visible := false;
    NameRow.Value := FGenerationUnit.Name;
    GroupRow.Value := FGenerationUnit.Group;
    CategoryRow.Value := FGenerationUnit.Category;
    DocumentTypeRow.Value := DocumentTypeKindToString(FGenerationUnit.DocumentType);
    FormatRow.Value := FGenerationUnit.Format;
    VersionRow.Value := FGenerationUnit.Version;
    ApproachRow.Value := FGenerationUnit.Approach;
    TranslatorTypeRow.Value := TranslatorTypeKindToString(FGenerationUnit.TranslatorType);
    TranslatorNameRow.Value := FGenerationUnit.TranslatorName;
    SampleRow.Value := FGenerationUnit.Sample;
    TutorialRow.Value := FGenerationUnit.Tutorial;

    PropertyInspector.OnChange := PropertyInspectorChange;

    ValidatorRow.Value := FGenerationUnit.Validator;

  end;
end;

procedure TTemplateRegisterForm.TranslatorNameRowButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  if TranslatorTypeRow.Value = VALUE_TRANSTYPE_SCRIPT then begin
    if OpenScriptDialog.Execute then
      TranslatorNameRow.Value := OpenScriptDialog.FileName;
  end
  else if TranslatorTypeRow.Value = VALUE_TRANSTYPE_EXE then begin
    if OpenExeDialog.Execute then
      TranslatorNameRow.Value := OpenExeDialog.FileName;
  end
end;

procedure TTemplateRegisterForm.TutorialRowButtonClick(Sender: TNxPropertyItem);
begin
  if OpenDialog.Execute then begin
    TutorialRow.Value := OpenDialog.FileName;
    ApplyChanges;
    UpdateUIStates;
  end;

end;

procedure TTemplateRegisterForm.ProfilesRowButtonClick(Sender: TNxPropertyItem);
begin
  EditProfiles;
  ApplyChanges;
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.PropertyInspectorChange(Sender: TObject;
  Item: TNxPropertyItem; Value: WideString);
begin
  ApplyChanges;
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.PropertyInspectorSelectItem(Sender: TObject;
  Item: TNxPropertyItem);
begin
    if Item <> nil then
    GenerationUnitDescMemo.Text := GetItemDescription(Item);
end;

end.
