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
  NxInspectorNode6, NxControls6, NxInspector6, NxEdit6, NxInspectorNodeClasses6;

const
  TXT_PREVIEW = 'Preview';
  TXT_ATTACH_FILE = 'Attach files';

  TXT_BASIC_INFO = 'Set basic information about template.';
  TXT_DETAIL_INTO = 'Set detailed information about template.';
  TXT_DESC_NAME = 'Specify template name.';
  TXT_DESC_GROUP = 'Create or select group for template.';
  TXT_DESC_CATEGORY = 'Create or select category for template.';
  TXT_DESC_DESCRIPTION = 'Overall description of template.';
  TXT_DESC_DOCTYPE = 'Select document type of DOCUMENT, REPORT, and CODE for template.';
  TXT_DESC_FORMAT = 'Select format of document going to be generated with current template.';
  TXT_DESC_VERSION = 'Fill version information of template. (eg. 1.0)';
  TXT_DESC_APPROACH = 'Select approach to be applied to the model during document generation.';
  TXT_DESC_PROFILES = 'Select profiles to be applied to the model during document generation.';
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
    PathLabel: TLabel;
    PathEdit: TEdit;
    PathButton: TSpeedButton;
    SaveDialog: TSaveDialog;
    OpenScriptDialog: TOpenDialog;
    OpenExeDialog: TOpenDialog;
    DescriptionLabel: TLabel;
    GenerationUnitDescPanel: TFlatPanel;
    GenerationUnitDescMemo: TMemo;
    PropertyInspector: TNextInspector6;
    StandardInfoRow: TNxInspectorNode6;
    DetailInfoRow: TNxInspectorNode6;
    NameRow: TNxInspectorNode6;
    GroupRow: TNxComboBoxInspectorNode6;
    CategoryRow: TNxComboBoxInspectorNode6;
    DescriptionRow: TNxMemoInspectorNode6;
    DocumentTypeRow: TNxComboBoxInspectorNode6;
    FormatRow: TNxComboBoxInspectorNode6;
    VersionRow: TNxInspectorNode6;
    ProfilesRow: TNxButtonInspectorNode6;
    ApproachRow: TNxComboBoxInspectorNode6;
    TranslatorTypeRow: TNxComboBoxInspectorNode6;
    TranslatorNameRow: TNxButtonInspectorNode6;
    SampleRow: TNxButtonInspectorNode6;
    TutorialRow: TNxButtonInspectorNode6;
    ValidatorRow: TNxButtonInspectorNode6;
    PreviewsRow: TNxButtonInspectorNode6;
    ParametersRow: TNxButtonInspectorNode6;
    AttachFilesRow: TNxButtonInspectorNode6;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PathButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PropertyInspectorSelect(Sender: TObject);
    procedure AcceptButtonClick(Sender: TObject);
    procedure PathEditChange(Sender: TObject);
    procedure NameOrGroupRowValueChanged(Sender: TNxInspectorNode6);
    procedure AnyRowValueChanged(Sender: TNxInspectorNode6);
    procedure TranslatorTypeRowValueChanged(Sender: TNxInspectorNode6);
    procedure ProfilesRowButtonClick(Sender: TObject);
    procedure TranslatorNameRowButtonClick(Sender: TObject);
    procedure SampleRowButtonClick(Sender: TObject);
    procedure TutorialRowButtonClick(Sender: TObject);
    procedure ValidatorRowButtonClick(Sender: TObject);
    procedure PreviewsRowButtonClick(Sender: TObject);
    procedure ParametersRowButtonClick(Sender: TObject);
    procedure AttachFilesRowButtonClick(Sender: TObject);
    procedure PropertyInspectorVerticalScroll(Sender: TObject);
  private
    FStarUMLApp: IStarUMLApplication;
    FDirectMDAProcessor: TGeneratorProcessor;
    FGenerationUnit: PGenerationUnit;
    FFixedGenerationUnitPath: Boolean;
    FCorrectionMode: Boolean;
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
    function GetCollectionString(CollectionCount: Integer): string;
    function GetProfilesString: string;
    function GetPreviewsString: string;
    function GetAttachFilesString: string;
    function GetParametersString: string;
    procedure EditProfiles;
    procedure EditPreviews;
    procedure EditAttachFiles;
    procedure EditParameters;
    procedure ApplyChanges;
    function GetPresuppositionedFileName: string;
    { UI updating methods }
    function IsBuiltInGenerator(GeneratorType: string): Boolean;
    function GetItemDescription(Row: TnxInspectorNode6): string;
    procedure UpdateUIStates;
    function SetHints: Boolean;
    { etc methods }
    procedure RegulateFilesPath;
    procedure SetGenerationUnitPath(const Value: string);
    procedure SetTranslatorNameEditState;
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
  ProfileSelFrm, ColEdtFrm, ParamDefFrm, Serializers, Utilities, Symbols,
  Generics.Collections;

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

procedure TTemplateRegisterForm.SetTranslatorNameEditState;
begin
  TranslatorNameRow.Enabled := (TranslatorTypeRow.Value <> '')
    and not IsBuiltInGenerator(TranslatorTypeRow.Value);
  if not TranslatorNameRow.Enabled then
    TranslatorNameRow.Value := '';
end;

procedure TTemplateRegisterForm.SampleRowButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    SampleRow.Value := OpenDialog.FileName;
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

function TTemplateRegisterForm.GetCollectionString(CollectionCount: Integer): string;
begin
  Result := Format('(Collection)[%d]', [CollectionCount]);
end;

function TTemplateRegisterForm.GetProfilesString: string;
begin
  Result := GetCollectionString(FGenerationUnit.ProfileCount);
end;


function TTemplateRegisterForm.GetPreviewsString: string;
begin
  Result := GetCollectionString(FGenerationUnit.PreviewCount);
end;

function TTemplateRegisterForm.GetAttachFilesString: string;
begin
  Result := GetCollectionString(FGenerationUnit.AttachFileCount);
end;

function TTemplateRegisterForm.GetParametersString: string;
begin
  Result := GetCollectionString(FGenerationUnit.ParameterCount);
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

procedure TTemplateRegisterForm.AcceptButtonClick(Sender: TObject);
begin
  ApplyChanges;
  ModalResult := mrOK;
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
  FGenerationUnit.Path := GenerationUnitPath;
  FGenerationUnit.Description := DescriptionRow.Value;
end;

function TTemplateRegisterForm.GetPresuppositionedFileName: string;
var
  Dir: string;
  GroupSubdir: string;
begin
  if NameRow.Value <> '' then begin

    GroupSubdir := GroupRow.Value;
    if GroupSubdir <> '' then
      GroupSubdir := IncludeTrailingPathDelimiter(GroupSubdir);

    Dir := IncludeTrailingPathDelimiter(GetDirectMDAPath)
      + IncludeTrailingPathDelimiter(DIR_GENERATION_UNITS)
      + GroupSubdir + NameRow.Value;

    Result := IncludeTrailingPathDelimiter(Dir) + NameRow.Value + EXT_TDF;
  end
  else
    Result := '';
end;

function TTemplateRegisterForm.IsBuiltInGenerator(GeneratorType: string): Boolean;
begin
  Result := (GeneratorType = VALUE_TRANSTYPE_WORD)
    or (GeneratorType = VALUE_TRANSTYPE_EXCEL)
    or (GeneratorType = VALUE_TRANSTYPE_POWERPOINT)
    or (GeneratorType = VALUE_TRANSTYPE_TEXT);
end;

procedure TTemplateRegisterForm.AnyRowValueChanged(Sender: TNxInspectorNode6);
begin
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.NameOrGroupRowValueChanged(Sender: TNxInspectorNode6);
begin
  if not FFixedGenerationUnitPath then
    GenerationUnitPath := GetPresuppositionedFileName;
  AnyRowValueChanged(Sender);
end;

procedure TTemplateRegisterForm.TranslatorTypeRowValueChanged(
  Sender: TNxInspectorNode6);
begin
  SetTranslatorNameEditState;
  AnyRowValueChanged(Sender);
end;

function TTemplateRegisterForm.SetHints: Boolean;
type
  TNodeList = TList<TnxInspectorNode6>;
const
  HintColor = clMoneyGreen;
  StandardCaptionNodeColor = clWindow;
var
  VerifiedNodes: TNodeList;
  Node: TnxInspectorNode6;
  HintSet: Boolean;

  procedure SetupHintForNode(Node: TnxInspectorNode6);
  begin
    if (Node.Value = '') then begin
      Node.CaptionColor := HintColor;
      Node.Hint := C_FIELD_CANNOT_BE_EMPTY;
      HintSet := True; // Sets value for outer function
    end
    else begin
      Node.CaptionColor := StandardCaptionNodeColor;
      Node.Hint := '';
    end;
  end;

begin
  HintSet := False;
  // Standard rows
  VerifiedNodes := TNodeList.Create();
  try
    VerifiedNodes.AddRange([NameRow,GroupRow,CategoryRow,DocumentTypeRow,
      FormatRow,TranslatorTypeRow]);
    for Node in VerifiedNodes do
      SetupHintForNode(Node);
  finally
    VerifiedNodes.Free;
  end;

  // Special cases

  // Translator row
  if TranslatorNameRow.Enabled then
    SetupHintForNode(TranslatorNameRow)
  else begin // Uncheck if disabled
    TranslatorNameRow.CaptionColor := StandardCaptionNodeColor;
    TranslatorNameRow.Hint := '';
  end;

  // Template file name
  if (PathEdit.Text = '') then begin
      PathLabel.Color := HintColor;
      if FFixedGenerationUnitPath then
        PathLabel.Hint := C_FIELD_CANNOT_BE_EMPTY
      else
        PathLabel.Hint := C_FIELD_AUTO_DERIVE;
      PathLabel.Transparent := False;
      HintSet := True;
    end
    else begin
      PathLabel.Color := Self.Color;
      PathLabel.Hint := '';
      PathLabel.Transparent := True;
    end;

  Result := HintSet;
end;

function TTemplateRegisterForm.GetItemDescription(Row: TnxInspectorNode6): string;
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
  AcceptButton.Enabled := not SetHints;
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


  if Assigned(FGenerationUnit) then
    FCorrectionMode := True
  else begin // Creating a new gen unit or keep existing
    FGenerationUnit := PGenerationUnit.Create;
    if GenerationUnitPath <> '' then begin // There exists a saved one
      Serializer := PGenerationUnitSerializer.Create;
      try
        Serializer.ReadGenerationUnit(FGenerationUnit, GenerationUnitPath);
      finally
        Serializer.Free;
      end;
    end;
  end;

  try
    // Set calculated fields
    FGenerationUnit.Date := DateToStr(Date);
    ParametersRow.Value := GetParametersString;
    AttachFilesRow.Value := GetAttachFilesString;
    ProfilesRow.Value := GetProfilesString;
    PreviewsRow.Value := GetPreviewsString;

    // Execute dialog
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

procedure TTemplateRegisterForm.FormCreate(Sender: TObject);
begin
  Initialize;
end;

procedure TTemplateRegisterForm.FormDestroy(Sender: TObject);
begin
  Finalize;
end;

procedure TTemplateRegisterForm.PreviewsRowButtonClick(Sender: TObject);
begin
  EditPreviews;
end;

procedure TTemplateRegisterForm.ValidatorRowButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    ValidatorRow.Value := OpenDialog.FileName;
end;

procedure TTemplateRegisterForm.AttachFilesRowButtonClick(Sender: TObject);
begin
  EditAttachFiles;
end;

procedure TTemplateRegisterForm.ParametersRowButtonClick(Sender: TObject);
begin
  EditParameters;
end;

procedure TTemplateRegisterForm.PathButtonClick(Sender: TObject);
begin
  SaveDialog.InitialDir := IncludeTrailingPathDelimiter(GetDirectMDAPath) + DIR_GENERATION_UNITS;
  if SaveDialog.Execute then begin
    PathEdit.Text := SaveDialog.FileName;
  end;
end;

procedure TTemplateRegisterForm.PathEditChange(Sender: TObject);
begin
  if (Sender as TWinControl).Focused then
    FFixedGenerationUnitPath := True;
  UpdateUIStates;
end;

procedure TTemplateRegisterForm.FormShow(Sender: TObject);
begin
  SetTranslatorNameEditState;
  UpdateUIStates;

  if GenerationUnitPath <> '' then begin

    if FCorrectionMode then begin
      Caption := 'Correct template';
      GenerationUnitPath := '';
      FFixedGenerationUnitPath := False;
    end
    else begin
      Caption := 'Modify template';
      PathEdit.ReadOnly := True;
      PathButton.Visible := false;
      FFixedGenerationUnitPath := True;
    end;

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
    ValidatorRow.Value := FGenerationUnit.Validator;
    DescriptionRow.Value := FGenerationUnit.Description;
  end;

{$IFDEF DEBUG}
  if GenerationUnitPath = '' then begin
    GroupRow.Value := GroupRow.Lines[0];
    CategoryRow.Value := CategoryRow.Lines[0];
    DocumentTypeRow.Value := DocumentTypeRow.Lines[0];
    FormatRow.Value := FormatRow.Lines[0];
    TranslatorTypeRow.Value := TranslatorTypeRow.Lines[0];
  end;
{$ENDIF DEBUG}

end;

procedure TTemplateRegisterForm.TranslatorNameRowButtonClick(Sender: TObject);
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

procedure TTemplateRegisterForm.TutorialRowButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    TutorialRow.Value := OpenDialog.FileName;
end;

procedure TTemplateRegisterForm.ProfilesRowButtonClick(Sender: TObject);
begin
   EditProfiles;
end;

procedure TTemplateRegisterForm.PropertyInspectorSelect(Sender: TObject);
var
  SelectedNode: TNxInspectorNode6;
begin
  SelectedNode := (Sender as TNxCustomInspector6).SelectedNode;
  if Assigned(SelectedNode) then
    GenerationUnitDescMemo.Text := GetItemDescription(SelectedNode);
end;

// Currently (ver 6.5.16) there is a glitch with scrolling inspector
procedure TTemplateRegisterForm.PropertyInspectorVerticalScroll(
  Sender: TObject);
begin
  (Sender as TNxCustomInspector6).Repaint;
end;


// TTemplateRegisterForm
////////////////////////////////////////////////////////////////////////////////


end.
