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
  DirectMDAObjects,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxInspRw, dxInspct, dxCntner, ExtCtrls, ImgList,
  ComCtrls, STARUML_TLB, dxExEdtr;

const
  TXT_SELECT_DIR = 'Select Directory';
  TXT_NONE = '¾øÀ½';
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
    FInspectorRow: TdxInspectorRow;
  public
    constructor Create(AParameter: PParameter; AInspectorRow: TdxInspectorRow);
    property Parameter: PParameter read FParameter;
    property InspectorRow: TdxInspectorRow read FInspectorRow;
  end;

  // TTaskInformationForm
  TTaskInformationForm = class(TForm)
    CloseButton: TButton;
    DocTypeImageList: TImageList;
    Panel1: TPanel;
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
    Label26: TLabel;
    ParameterInspector: TdxInspector;
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
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure SetAsDefaultButtonClick(Sender: TObject);
    procedure SampleLabelClick(Sender: TObject);
    procedure ValidatorLabelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FStarUMLApp: IStarUMLApplication;
    FTask: PTask;
    ParameterRows: TList;
    { initialization / finalization }
    procedure Initialize;
    procedure Finalize;
    function Initialized: Boolean;
    { parameter handling methods }
    procedure Clear;
    function FindParameterRow(InspectorRow: TdxInspectorRow): PParameterRow;
    procedure AddParameterRow(ParentRow: TdxInspectorRow; AParameter: PParameter);
    procedure SetupParameterRows;
    procedure SetSelectedParameterAsDefault;
    procedure UpdateInspectorRow(InspectorRow: TdxInspectorRow; Value: string);
    { row handling methods }
    procedure HandleInspectorEdited(Sender: TObject; Node: TdxInspectorNode; Row: TdxInspectorRow);
    procedure HandleElementTypeRowButtonClicked(Sender: TObject; AbsoluteIndex: Integer);
    procedure HandleFileNameTypeRowButtonClicked(Sender: TObject; AbsoluteIndex: Integer);
    procedure HandlePathNameTypeRowButtonClicked(Sender: TObject; AbsoluteIndex: Integer);
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
  PreviewFrm, Utilities, Symbols;

////////////////////////////////////////////////////////////////////////////////
// PParameterRow

constructor PParameterRow.Create(AParameter: PParameter; AInspectorRow: TdxInspectorRow);
begin
  FParameter := AParameter;
  FInspectorRow := AInspectorRow;
end;

// PParameterRow
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TTaskInformationForm

procedure TTaskInformationForm.Initialize;
begin
  ParameterRows := TList.Create;
  FTask := nil;
  FStarUMLApp := nil;
  ParameterInspector.OnEdited := HandleInspectorEdited;
end;

procedure TTaskInformationForm.Finalize;
begin
  Clear;
  ParameterRows.Clear;
end;

function TTaskInformationForm.Initialized: Boolean;
begin
  Result := (FStarUMLApp <> nil) and (FTask <> nil);
end;

procedure TTaskInformationForm.Clear;
var
  I: Integer;
begin
  for I := ParameterRows.Count - 1 downto 0 do
    PParameterRow(ParameterRows.Items[I]).Free;
  ParameterRows.Clear;
  ParameterInspector.ClearRows;
end;

function TTaskInformationForm.FindParameterRow(InspectorRow: TdxInspectorRow): PParameterRow;
var
  P: PParameterRow;
  I: Integer;
begin
  Result := nil;
  for I := 0 to ParameterRows.Count - 1 do begin
    P := ParameterRows.Items[I];
    if P.InspectorRow = InspectorRow then begin
      Result := P;
      Exit;
    end;
  end;
end;

procedure TTaskInformationForm.AddParameterRow(ParentRow: TdxInspectorRow; AParameter: PParameter);
var
  Row: TdxInspectorRow;
  P: PParameterRow;
begin
  case AParameter.Type_ of
    ptString:
      begin
        Row := ParentRow.Node.AddChildEx(TdxInspectorTextRow).Row;
        Row.Caption := AParameter.Name;
        (Row as TdxInspectorTextRow).Text := AParameter.Value;
      end;
    ptInteger:
      begin
        Row := ParentRow.Node.AddChildEx(TdxInspectorTextRow).Row;
        Row.Caption := AParameter.Name;
        (Row as TdxInspectorTextRow).Text := AParameter.Value;
      end;
    ptBoolean:
      begin
        Row := ParentRow.Node.AddChildEx(TdxInspectorTextCheckRow).Row;
        Row.Caption := AParameter.Name;
        (Row as TdxInspectorTextCheckRow).Text := AParameter.Value;
      end;
    ptElement:
      begin
        Row := ParentRow.Node.AddChildEx(TdxInspectorTextButtonRow).Row;
        Row.Caption := AParameter.Name;
        (Row as TdxInspectorTextButtonRow).Text := AParameter.Value;
        (Row as TdxInspectorTextButtonRow).OnButtonClick := HandleElementTypeRowButtonClicked;
      end;
    ptFileName:
      begin
        Row := ParentRow.Node.AddChildEx(TdxInspectorTextButtonRow).Row;
        Row.Caption := AParameter.Name;
        (Row as TdxInspectorTextButtonRow).Text := AParameter.Value;
        (Row as TdxInspectorTextButtonRow).OnButtonClick := HandleFileNameTypeRowButtonClicked;
      end;
    ptPathName:
      begin
        Row := ParentRow.Node.AddChildEx(TdxInspectorTextButtonRow).Row;
        Row.Caption := AParameter.Name;
        (Row as TdxInspectorTextButtonRow).Text := AParameter.Value;
        (Row as TdxInspectorTextButtonRow).OnButtonClick := HandlePathNameTypeRowButtonClicked;
      end;
    ptDate:
      begin
        Row := ParentRow.Node.AddChildEx(TdxInspectorTextDateRow).Row;
        Row.Caption := AParameter.Name;
        (Row as TdxInspectorTextDateRow).Text := AParameter.Value;
      end;
  end;
  if Row <> nil then begin
    P := PParameterRow.Create(AParameter, Row);
    ParameterRows.Add(P);
  end;    
end;

procedure TTaskInformationForm.SetupParameterRows;
var
  GenUnitNameRow: TdxInspectorTextRow;
  I: Integer;
begin
  Assert(FTask <> nil);
  GenUnitNameRow := ParameterInspector.AddEx(TdxInspectorTextRow).Row as TdxInspectorTextRow;
  GenUnitNameRow.Caption := FTask.GenerationUnit.Name;
  GenUnitNameRow.IsCategory := True;
  for I := 0 to FTask.ParameterCount - 1 do
    AddParameterRow(GenUnitNameRow, FTask.Parameters[I]);
  GenUnitNameRow.Node.Expand(True);
end;

procedure TTaskInformationForm.SetSelectedParameterAsDefault;
var
  Row: TdxInspectorRow;
  P: PParameterRow;
  Def: PParameter;
begin
  if ParameterInspector.FocusedNode <> nil then begin
    Row := (ParameterInspector.FocusedNode as TdxInspectorRowNode).Row;
    P := FindParameterRow(Row);
    if P <> nil then begin
      Def := FTask.GenerationUnit.FindParameter(P.Parameter.Name);
      if Def <> nil then begin
        P.Parameter.Value := Def.Value;
        UpdateInspectorRow(Row, Def.Value);
      end;
    end;
  end;  
end;

procedure TTaskInformationForm.UpdateInspectorRow(InspectorRow: TdxInspectorRow; Value: string);
begin
  if InspectorRow is TdxInspectorTextRow then
    (InspectorRow as TdxInspectorTextRow).Text := Value
  else if InspectorRow is TdxInspectorTextCheckRow then
    (InspectorRow as TdxInspectorTextCheckRow).Text := Value
  else if InspectorRow is TdxInspectorTextButtonRow then
    (InspectorRow as TdxInspectorTextButtonRow).Text := Value
  else if InspectorRow is TdxInspectorTextDateRow then
    (InspectorRow as TdxInspectorTextDateRow).Text := Value;
end;

procedure TTaskInformationForm.HandleInspectorEdited(Sender: TObject; Node: TdxInspectorNode; Row: TdxInspectorRow);
var
  P: PParameterRow;
begin
  P := FindParameterRow(Row as TdxInspectorRow);
  if P <> nil then begin
    if Row is TdxInspectorTextRow then
      P.Parameter.Value := (Row as TdxInspectorTextRow).Text
    else if Row is TdxInspectorTextCheckRow then
      P.Parameter.Value := (Row as TdxInspectorTextCheckRow).Text
    else if Row is TdxInspectorTextButtonRow then
      P.Parameter.Value := (Row as TdxInspectorTextButtonRow).Text
    else if Row is TdxInspectorTextDateRow then
      P.Parameter.Value := (Row as TdxInspectorTextDateRow).Text;
  end;
end;

procedure TTaskInformationForm.HandleElementTypeRowButtonClicked(Sender: TObject; AbsoluteIndex: Integer);
var
  P: PParameterRow;
  M: IModel;
  I: Integer;
begin
  if Sender is TdxInspectorTextButtonRow then begin
    P := FindParameterRow(Sender as TdxInspectorTextButtonRow);
    Assert(P <> nil);
    for I := 0 to Length(DEFAULT_FILTERINGSET) - 1 do
      FStarUMLApp.ElementSelector.AddSelectableModel(DEFAULT_FILTERINGSET[I]);
    if FStarUMLApp.ElementSelector.Execute(P.Parameter.Name) then begin
      M := FStarUMLApp.ElementSelector.GetSelectedModel;
      if M = nil then
        P.Parameter.Value := ''
      else
        P.Parameter.Value := M.Pathname;
      (Sender as TdxInspectorTextButtonRow).Text := P.Parameter.Value;
    end;
  end;
end;

procedure TTaskInformationForm.HandleFileNameTypeRowButtonClicked(Sender: TObject; AbsoluteIndex: Integer);
var
  P: PParameterRow;
begin
  if Sender is TdxInspectorTextButtonRow then begin
    P := FindParameterRow(Sender as TdxInspectorTextButtonRow);
    Assert(P <> nil);
    if OpenDialog.Execute then begin
      P.Parameter.Value := OpenDialog.FileName;
      (Sender as TdxInspectorTextButtonRow).Text := P.Parameter.Value;
    end;
  end;
end;

procedure TTaskInformationForm.HandlePathNameTypeRowButtonClicked(Sender: TObject; AbsoluteIndex: Integer);
var
  DirDialog: PDirectoryDialog;
  P: PParameterRow;
begin
  if Sender is TdxInspectorTextButtonRow then begin
    P := FindParameterRow(Sender as TdxInspectorTextButtonRow);
    Assert(P <> nil);
    DirDialog := PDirectoryDialog.Create(Self);
    try
      DirDialog.Title := TXT_SELECT_DIR;
      if DirDialog.Execute then begin
        P.Parameter.Value := DirDialog.DirName;
        (Sender as TdxInspectorTextButtonRow).Text := P.Parameter.Value;
      end;
    finally
      DirDialog.Free;
    end;
  end;
end;

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
  ShowPreviews;
  ShowAttachFiles;
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

// TTaskInformationForm
////////////////////////////////////////////////////////////////////////////////

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

procedure TTaskInformationForm.FormShow(Sender: TObject);
var
  Path: String;
  L: Integer;
begin
  Path := Task.GenerationUnit.Path;
  L := Length(GetDirectMDAPath);
  PathLabel.Caption := Copy(Path, L+2, Length(Path)-L-1);
end;

end.
