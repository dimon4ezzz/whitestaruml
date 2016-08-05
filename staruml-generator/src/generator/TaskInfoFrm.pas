unit TaskInfoFrm;

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
  Dialogs, StdCtrls,  ExtCtrls, ImgList, ComCtrls,
  WhiteStarUML_TLB, Generics.Collections, DirectMDAObjects,
  NxInspectorNode6, NxControls6, NxInspector6;

const
  TXT_SELECT_DIR = 'Select Directory';
  TXT_NONE = 'No description available';
  ERR_CANNOT_RUN_FILE = 'Selected file can''t be excuted.'
    + #13#10 + 'Filename: %s';

const
  IMG_WORD = 0;
  IMG_EXCEL = 1;
  IMG_POWERPOINT = 2;
  IMG_TEXT = 3;
  IMG_COM = 4;
  IMG_SCRIPT = 5;
  IMG_EXE = 6;

  MAX_IMAGE_WIDTH = 130;
  MAX_IMAGE_HEIGHT = 140;
  IMAGE_INTERVAL = 30;

type
  // PParameterRow
  PParameterRow = class
  private
    FParameter: PParameter;
    FInspectorRow: TNxInspectorNode6;
  public
    constructor Create(AParameter: PParameter; AInspectorRow: TNxInspectorNode6);
    property Parameter: PParameter read FParameter;
    property InspectorRow: TNxInspectorNode6 read FInspectorRow;
  end;

  // TTaskInformationForm
  TTaskInformationForm = class(TForm)
    CloseButton: TButton;
    DocTypeImageList: TImageList;
    HeaderPanel: TPanel;
    DocTypeImage: TImage;
    GenUnitNameLabel: TLabel;
    TaskPageControl: TPageControl;
    PropertyTabSheet: TTabSheet;
    PreviewTabSheet: TTabSheet;
    ParameterTabSheet: TTabSheet;
    UpperBevel: TBevel;
    CaptionGroupLabel: TLabel;
    CaptionCategoryLabel: TLabel;
    CaptionDocTypeLabel: TLabel;
    CaptionFormatLabel: TLabel;
    CaptionVersionLabel: TLabel;
    CaptionTranslatorTypeLabel: TLabel;
    CaptionTranslatorNameLabel: TLabel;
    CaptionProfilesLabel: TLabel;
    CaptionApproachLabel: TLabel;
    CaptionSampleLabel: TLabel;
    CaptionValidatorLabel: TLabel;
    LowerBevel: TBevel;
    SetAsDefaultButton: TButton;
    ParameterLabel: TLabel;
    PreviewLabel: TLabel;
    CaptionDescLabel: TLabel;
    DescriptionMemo: TMemo;
    AttachFileLabel: TLabel;
    PreviewScrollBox: TScrollBox;
    GroupLabel: TLabel;
    CategoryLabel: TLabel;
    DocTypeLabel: TLabel;
    FormatLabel: TLabel;
    VersionLabel: TLabel;
    TranslatorTypeLabel: TLabel;
    TranslatorNameLabel: TLabel;
    ProfilesLabel: TLabel;
    ApproachLabel: TLabel;
    SampleLabel: TLabel;
    ValidatorLabel: TLabel;
    OpenDialog: TOpenDialog;
    AttachFileListBox: TListBox;
    PathLabel: TLabel;
    HeaderShape: TShape;
    FolderImageList: TImageList;
    ParameterInspector: TNextInspector6;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure SetAsDefaultButtonClick(Sender: TObject);
    procedure SampleLabelClick(Sender: TObject);
    procedure ValidatorLabelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private type
    ParameterRowsList = TObjectList<PParameterRow>;
  private
    FStarUMLApp: IStarUMLApplication;
    FTask: PTask;
    ParameterRows: ParameterRowsList;
    { initialization / finalization }
    procedure Initialize;
    procedure Finalize;
    function Initialized: Boolean;
    { parameter handling methods }
    procedure Clear;
    function FindParameterRow(InspectorRow: TNxInspectorNode6): PParameterRow;
    procedure AddParameterRow(AParameterInspector: TNextInspector6;
      ParentRow: TNxInspectorNode6; AParameter: PParameter);
    procedure SetupParameterRows;
    procedure SetSelectedParameterAsDefault;
    procedure UpdateInspectorRow(InspectorRow: TNxInspectorNode6; Value: string);
    { row handling methods }
    procedure HandleElementTypeRowButtonClicked(Sender: TObject);
    procedure HandleFileNameTypeRowButtonClicked(Sender: TObject);
    procedure HandlePathNameTypeRowButtonClicked(Sender: TObject);
    procedure HandleInspectorNodeValueChanged(Sender: TNxInspectorNode6);
    { task information presentation methods }
    function GetHeaderImageIndex(AGenerationUnit: PGenerationUnit): Integer;
    procedure SetupHeader;
    procedure AutoSizeImage(AImage: TImage);
    procedure ShowPreviews;
    procedure ShowAttachFiles;
    function LabeledStr(Value: string): string;
    procedure SetLabelAsLinked(ALabel: TLabel; Url: string);
    procedure SetLabelAsNormal(ALabel: TLabel);
    procedure ExecuteLabel(ALabel: TLabel);
    procedure ShowTaskInformation;
  public
    procedure Execute(ActivateParameters: Boolean = False);
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
    property Task: PTask read FTask write FTask;
  end;

implementation

{$R *.dfm}

uses
  Utilities, Symbols, NxEdit, PieFrm, PreviewFrm, NxEdit6, NxInspectorNodeClasses6;

////////////////////////////////////////////////////////////////////////////////
// PParameterRow

constructor PParameterRow.Create(AParameter: PParameter; AInspectorRow: TNxInspectorNode6);
begin
  FParameter := AParameter;
  FInspectorRow := AInspectorRow;
end;

// PParameterRow
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// TTaskInformationForm


//////////////////////////////////////////////////////////
// General form management

procedure TTaskInformationForm.FormCreate(Sender: TObject);
begin
  Initialize;
end;

procedure TTaskInformationForm.FormDestroy(Sender: TObject);
begin
  Finalize;
end;

procedure TTaskInformationForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTaskInformationForm.FormShow(Sender: TObject);
var
  Path: String;
  L: Integer;
begin
  Path := Task.GenerationUnit.Path;
  L := Length(GetDirectMDAPath);
  PathLabel.Caption := Copy(Path, L+2, Length(Path)-L-1);
end;

procedure TTaskInformationForm.Initialize;
begin
  ParameterRows := ParameterRowsList.Create;
  FTask := nil;
  FStarUMLApp := nil;
end;

procedure TTaskInformationForm.Finalize;
begin
  Clear;
  ParameterRows.Free;
end;

function TTaskInformationForm.Initialized: Boolean;
begin
  Result := Assigned(FStarUMLApp) and Assigned (FTask);
end;

procedure TTaskInformationForm.Clear;
begin
  ParameterRows.Clear;
end;

procedure TTaskInformationForm.Execute(ActivateParameters: Boolean = False);
begin
  if not Initialized then
    raise EIntializationException.Create(ERR_NOT_INITIALIZED);
  Clear;
  SetupHeader;
  ShowTaskInformation;
  SetupParameterRows;
  if ActivateParameters then
    TaskPageControl.ActivePage := ParameterTabSheet
  else
    TaskPageControl.ActivePage := PropertyTabSheet;
  ShowModal;
end;

procedure TTaskInformationForm.ShowTaskInformation;
var
  GenUnit: PGenerationUnit;
begin
  GenUnit := FTask.GenerationUnit;
  GroupLabel.Caption := LabeledStr(GenUnit.Group);
  CategoryLabel.Caption := LabeledStr(GenUnit.Category);
  DocTypeLabel.Caption := LabeledStr(DocumentTypeKindToString(GenUnit.DocumentType));
  FormatLabel.Caption := LabeledStr(GenUnit.Format);
  VersionLabel.Caption := LabeledStr(GenUnit.Version);
  TranslatorTypeLabel.Caption := LabeledStr(TranslatorTypeKindToString(GenUnit.TranslatorType));
  TranslatorNameLabel.Caption := LabeledStr(GenUnit.TranslatorName);
  ProfilesLabel.Caption := LabeledStr(GetProfilesString(GenUnit));
  ApproachLabel.Caption := LabeledStr(GenUnit.Approach);
  SampleLabel.Caption := LabeledStr(ExtractFileName(GenUnit.Sample));
  if GenUnit.Sample = '' then
    SetLabelAsNormal(SampleLabel)
  else
    SetLabelAsLinked(SampleLabel, RegulatedPath(GenUnit.Sample, GenUnit.Path));
  ValidatorLabel.Caption := LabeledStr(ExtractFileName(GenUnit.Validator));
  if GenUnit.Validator = '' then
    SetLabelAsNormal(ValidatorLabel)
  else
    SetLabelAsLinked(ValidatorLabel, RegulatedPath(GenUnit.Validator, GenUnit.Path));
  if GenUnit.Description = '' then
    DescriptionMemo.Lines.Text := TXT_NONE
  else
    DescriptionMemo.Lines.Text := GenUnit.Description;

  // NOT WORKING AND HIDDEN!
  //ShowPreviews;
  //ShowAttachFiles;
end;

// General form management
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Handling Parameters page

function TTaskInformationForm.FindParameterRow(InspectorRow: TNxInspectorNode6): PParameterRow;
var
  P: PParameterRow;
begin
  Result := nil;
  if Assigned(InspectorRow) then begin
    for P in ParameterRows do
      if P.InspectorRow = InspectorRow then begin
        Result := P;
        Exit;
      end;
  end;
end;

procedure TTaskInformationForm.AddParameterRow(AParameterInspector: TNextInspector6; ParentRow: TNxInspectorNode6; AParameter: PParameter);
var
  Row: TNxInspectorNode6;
  ButtonEditRow: TNxButtonInspectorNode6;
  P: PParameterRow;
begin
  Row := nil;
  ButtonEditRow := nil;
  case AParameter.Type_ of
    ptString:
      begin
        Row := AParameterInspector.Nodes.Add(ParentRow, TNxInspectorNode6);
      end;
    ptInteger:
      begin
        Row := AParameterInspector.Nodes.Add(ParentRow, TNxInspectorNode6);
      end;
    ptBoolean:
      begin
        Row := AParameterInspector.Nodes.Add(ParentRow, TNxCheckBoxInspectorNode6);
      end;
    ptElement:
      begin
        ButtonEditRow := AParameterInspector.Nodes.Add(ParentRow, TNxButtonInspectorNode6)
          as TNxButtonInspectorNode6;
        ButtonEditRow.OnButtonClick := HandleElementTypeRowButtonClicked;
      end;
    ptFileName:
      begin
        ButtonEditRow := AParameterInspector.Nodes.Add(ParentRow, TNxButtonInspectorNode6)
          as TNxButtonInspectorNode6;
        ButtonEditRow.OnButtonClick := HandleFileNameTypeRowButtonClicked;
        FolderImageList.GetBitmap(0,ButtonEditRow.ButtonGlyph.Bitmap);
       end;
    ptPathName:
      begin
        ButtonEditRow := AParameterInspector.Nodes.Add(ParentRow, TNxButtonInspectorNode6)
          as TNxButtonInspectorNode6;
        ButtonEditRow.OnButtonClick := HandlePathNameTypeRowButtonClicked;
        FolderImageList.GetBitmap(0,ButtonEditRow.ButtonGlyph.Bitmap);
      end;
    ptDate:
      begin
        Row := AParameterInspector.Nodes.Add(ParentRow, TNxDateInspectorNode6);
      end;
    else
      assert(False, 'Unexpected parameter type');
  end;

  if Assigned(ButtonEditRow) then
    Row := ButtonEditRow;

  if Assigned(Row) then begin
    Row.Caption := AParameter.Name;
    Row.AsString := AParameter.Value;
    Row.OnValueChanged := HandleInspectorNodeValueChanged;
    P := PParameterRow.Create(AParameter, Row);
    ParameterRows.Add(P);
  end;
end;

procedure TTaskInformationForm.SetupParameterRows;
var
  GenUnitNameRow: TNxInspectorNode6;
  I: Integer;
begin
  Assert(FTask <> nil);
  GenUnitNameRow := ParameterInspector.Nodes.Add(nil, TNxInspectorNode6);
  GenUnitNameRow.Caption := FTask.GenerationUnit.Name;
  GenUnitNameRow.ReadOnly := True;
  for I := 0 to FTask.ParameterCount - 1 do
    AddParameterRow(ParameterInspector, GenUnitNameRow, FTask.Parameters[I]);
end;

procedure TTaskInformationForm.SetSelectedParameterAsDefault;
var
  Row: TNxInspectorNode6;
  P: PParameterRow;
  Def: PParameter;
begin
  Row := ParameterInspector.SelectedNode;
  P := FindParameterRow(Row);
  if Assigned(P) then begin
    Def := FTask.GenerationUnit.FindParameter(P.Parameter.Name);
    if Assigned(Def) then begin
      P.Parameter.Value := Def.Value;
      UpdateInspectorRow(Row, Def.Value);
    end;
  end;
end;

procedure TTaskInformationForm.UpdateInspectorRow(InspectorRow: TNxInspectorNode6; Value: string);
begin
  InspectorRow.AsString := Value
end;

procedure TTaskInformationForm.HandleInspectorNodeValueChanged(
  Sender: TNxInspectorNode6);
var
  P: PParameterRow;
begin
  P := FindParameterRow(Sender);
  if Assigned(P) then
    P.Parameter.Value := Sender.AsString;

end;

procedure TTaskInformationForm.HandleElementTypeRowButtonClicked(Sender: TObject);
var
  P: PParameterRow;
  ButtonEdit: TNxButtonEdit6;
  M: IModel;
  I: Integer;
begin
  ButtonEdit := Sender as TNxButtonEdit6;
  P := FindParameterRow(ParameterInspector.SelectedNode);
  Assert(P <> nil);
  for I := 0 to Length(DEFAULT_FILTERINGSET) - 1 do
    FStarUMLApp.ElementSelector.AddSelectableModel(DEFAULT_FILTERINGSET[I]);
  if FStarUMLApp.ElementSelector.Execute(P.Parameter.Name) then begin
    M := FStarUMLApp.ElementSelector.GetSelectedModel;
    if M = nil then
      P.Parameter.Value := ''
    else
      P.Parameter.Value := M.Pathname;
    ButtonEdit.AsString := P.Parameter.Value;
  end;
end;

procedure TTaskInformationForm.HandleFileNameTypeRowButtonClicked(Sender: TObject);
var
  P: PParameterRow;
  ButtonEdit: TNxButtonEdit6;
begin
  ButtonEdit := Sender as TNxButtonEdit6;
    P := FindParameterRow(ParameterInspector.SelectedNode);
    Assert(P <> nil);
    if OpenDialog.Execute then begin
      P.Parameter.Value := OpenDialog.FileName;
      ButtonEdit.AsString := P.Parameter.Value;
    end;
end;

procedure TTaskInformationForm.HandlePathNameTypeRowButtonClicked(Sender: TObject);
var
  DirDialog: PDirectoryDialog;
  P: PParameterRow;
  ButtonEdit: TNxButtonEdit6;
begin
  ButtonEdit := Sender as TNxButtonEdit6;

  P := FindParameterRow(ParameterInspector.SelectedNode);
  Assert(P <> nil);
  DirDialog := PDirectoryDialog.Create(Self);
  try
    DirDialog.Title := TXT_SELECT_DIR;
    if DirDialog.Execute then begin
      P.Parameter.Value := DirDialog.DirName;
      ButtonEdit.AsString := P.Parameter.Value;
    end;
  finally
    DirDialog.Free;
  end;
end;

// Handling Parameters page
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Handling Header panel

function TTaskInformationForm.GetHeaderImageIndex(AGenerationUnit: PGenerationUnit): Integer;
begin
  case AGenerationUnit.TranslatorType of
    ttWord: Result := IMG_WORD;
    ttExcel: Result := IMG_EXCEL;
    ttPowerPoint: Result := IMG_POWERPOINT;
    ttText: Result := IMG_TEXT;
    ttCom: Result := IMG_COM;
    ttScript: Result := IMG_SCRIPT;
    ttExe: Result := IMG_EXE;
    else
      Result := IMG_WORD;
  end;
end;

procedure TTaskInformationForm.SetupHeader;
var
  Img: TBitmap;
begin
  GenUnitNameLabel.Caption := FTask.GenerationUnit.Name;
  Img := TBitmap.Create;
  try
    DocTypeImageList.GetBitmap(GetHeaderImageIndex(FTask.GenerationUnit), Img);
    DocTypeImage.Picture.Bitmap.Assign(Img);
  finally
    Img.Free;
  end;
end;

//////////////////////////////////////////////////////////
// Handling Header panel


//////////////////////////////////////////////////////////
// Handling Preview page - NOT WORKING AND HIDDEN!

procedure TTaskInformationForm.AutoSizeImage(AImage: TImage);
var
  W, H: Integer;
begin
  W := AImage.Picture.Width;
  H := AImage.Picture.Height;

  if W > MAX_IMAGE_WIDTH then begin
    H := MAX_IMAGE_WIDTH * H div W;
    W := MAX_IMAGE_WIDTH;
  end;
  if H > MAX_IMAGE_HEIGHT then begin
    W := MAX_IMAGE_HEIGHT * W div H;
    H := MAX_IMAGE_HEIGHT;
  end;

  AImage.Width := W;
  AImage.Height := H;
  AImage.Stretch := True;
end;

procedure TTaskInformationForm.ShowPreviews;
var
  GenUnit: PGenerationUnit;
  Img: TImage;
  H, VC: Integer;
  I: Integer;
begin
  GenUnit := FTask.GenerationUnit;
  VC := PreviewScrollBox.ClientHeight div 2;
  H := IMAGE_INTERVAL;
  for I := 0 to GenUnit.PreviewCount - 1 do begin
    Img := TImage.Create(Self);
    Img.Parent := PreviewScrollBox;
    try
      Img.Picture.LoadFromFile(RegulatedPath(GenUnit.Previews[I], GenUnit.Path));
      AutoSizeImage(Img);
    except
      on E: Exception do begin
        Img.Width := IMAGE_INTERVAL;
        Img.Height := IMAGE_INTERVAL;
      end;
    end;
    Img.Left := H;
    Img.Top := VC - Img.Height div 2;
    H := H + Img.Width + IMAGE_INTERVAL;
  end;
  Img := TImage.Create(Self);
  Img.Parent := PreviewScrollBox;
  Img.Left := H;
  Img.Top := 1;
  Img.Width := 1;
  Img.Height := 1;
end;

procedure TTaskInformationForm.ShowAttachFiles;
var
  GenUnit: PGenerationUnit;
  I: Integer;
begin
  GenUnit := FTask.GenerationUnit;
  AttachFileListBox.Clear;
  for I := 0 to GenUnit.AttachFileCount - 1 do
    AttachFileListBox.Items.Add(RegulatedPath(GenUnit.AttachFiles[I], GenUnit.Path));
end;

// Handling Preview page
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Handling Properties page

function TTaskInformationForm.LabeledStr(Value: string): string;
begin
  if Value = '' then
    Result := '-'
  else
    Result := Value;
end;

procedure TTaskInformationForm.SetLabelAsLinked(ALabel: TLabel; Url: string);
begin
  ALabel.Font.Style := [fsUnderline];
  ALabel.Font.Color := clBlue;
  ALabel.Cursor := crHandPoint;
  ALabel.Hint := Url;
end;

procedure TTaskInformationForm.SetLabelAsNormal(ALabel: TLabel);
begin
  ALabel.Font.Style := [];
  ALabel.Font.Color := clWindowText;
  ALabel.Cursor := crDefault;
end;

procedure TTaskInformationForm.ExecuteLabel(ALabel: TLabel);
begin
  if ALabel.Hint <> '' then begin
    try
      ExecuteFile(ALabel.Hint);
    except
      on E: Exception do
        ErrorMessage(Format(ERR_CANNOT_RUN_FILE, [ALabel.Hint]));
    end;  
  end;
end;


procedure TTaskInformationForm.SetAsDefaultButtonClick(Sender: TObject);
begin
  SetSelectedParameterAsDefault;
end;

procedure TTaskInformationForm.SampleLabelClick(Sender: TObject);
begin
  if Sender is TLabel then
    ExecuteLabel(Sender as TLabel);
end;

procedure TTaskInformationForm.ValidatorLabelClick(Sender: TObject);
begin
  if Sender is TLabel then
    ExecuteLabel(Sender as TLabel);
end;

// Handling Properties page
//////////////////////////////////////////////////////////


// TTaskInformationForm
////////////////////////////////////////////////////////////////////////////////


end.
