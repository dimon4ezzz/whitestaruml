unit XMIImportFrm;

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
  Dialogs, StdCtrls, ComCtrls, xmldom, XMLIntf, msxmldom, XMLDoc,
  WhiteStarUML_TLB, ExtCtrls,
  XMIToStarUML, Buttons;

type
  // TXMIImportForm
  TXMIImportForm = class(TForm)
    FileLocationLabel: TLabel;
    FileLocationEdit: TEdit;
    FileInfoGroup: TGroupBox;
    OptionGroup: TGroupBox;
    ExecuteButton: TButton;
    CancelButton: TButton;
    OpenDialog: TOpenDialog;
    ProgressBar: TProgressBar;
    XMLDocument: TXMLDocument;
    ProgressMessageLabel: TLabel;
    XMIVerTitleLabel: TLabel;
    UMLVerTitleLabel: TLabel;
    ExporterTitleLabel: TLabel;
    XMIVerLabel: TLabel;
    UMLVerLabel: TLabel;
    ExporterLabel: TLabel;
    FileInfoMemo: TMemo;
    DiagramCheck: TCheckBox;
    NewProjectCheck: TCheckBox;
    Bevel1: TBevel;
    RationalApprCheck: TCheckBox;
    RationalApprRecommended: TLabel;
    FileOpenButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FileOpenButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure NewProjectCheckClick(Sender: TObject);
    procedure FileLocationEditChange(Sender: TObject);
    procedure ExecuteButtonClick(Sender: TObject);
  private
    procedure ProgressEventHandler(Pos: Integer; Max: Integer; Msg: string);
    procedure InitializeUI;
    procedure UpdateUIStates;
    procedure ShowFileInfoMessage(Msg: string);
    procedure SetXMIVersionInfo(Node: IXMLNode);
    procedure SetUMLVersionInfo(ParentNode: IXMLNode);
    procedure SetExporterInfo(ParentNode: IXMLNode);
    procedure SetRationalApprRecommended;
    function CheckXMIFileExistence(FN: string): Boolean;
    function CheckXMIFileValidation(Doc: TXMLDocument): Boolean;
    procedure SetXMIFileInformation(FN: string);
    function NewProjectAndRootElement: IUMLPackage;
    function ExecuteElementSelector: IUMLPackage;
    function GetRootElement: IUMLPackage;
    procedure InitializeXMIToStarUMLAdapter(Adapter: PXMIToStarUMLAdapter);
    procedure BeforeXMIImport;
    procedure AfterXMIImport;
  public
    StarUMLApp: IStarUMLApplication;
  end;

var
  XMIImportForm: TXMIImportForm;

implementation

uses
  Utilities, Symbols, NLS_XMIAddIn, NLS;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TXMIImportForm

procedure TXMIImportForm.ProgressEventHandler(Pos: Integer; Max: Integer; Msg: string);
begin
  if (ProgressMessageLabel.Caption <> Msg) and (Msg <> '') then
    ProgressMessageLabel.Caption := Msg;
  if Max <> 0 then begin
    if Pos > Max then Pos := Max;
    ProgressBar.Position := Trunc(Pos * 100 / Max);
  end else ProgressBar.Position := ProgressBar.Min;
  Application.ProcessMessages;
end;

procedure TXMIImportForm.InitializeUI;
begin
  ExecuteButton.Enabled := False;
  RationalApprRecommended.Visible := False;
  if not RationalApprRecommended.Enabled then
    RationalApprRecommended.Enabled := True;
  XMIVerLabel.Caption := TXT_COMMON_UNKNOWN;
  UMLVerLabel.Caption := TXT_COMMON_UNKNOWN;
  ExporterLabel.Caption := TXT_COMMON_UNKNOWN;
  FileInfoMemo.Visible := False;
  FileInfoMemo.Clear;
end;

procedure TXMIImportForm.UpdateUIStates;
begin
  ExecuteButton.Enabled := (FileLocationEdit.Text <> '');
end;

procedure TXMIImportForm.ShowFileInfoMessage(Msg: string);
begin
  FileInfoMemo.Clear;
  if not FileInfoMemo.Visible then FileInfoMemo.Visible := True;
  FileInfoMemo.Text := Msg;
  FileInfoMemo.SelStart := 0;
end;

procedure TXMIImportForm.SetXMIVersionInfo(Node: IXMLNode);
var Str: string;
begin
  if Assigned(XMLUtil) then begin
    Str := XMLUtil.GetAttributeValue(Node, ATTR_XMI_VERSION);
    if Str <> '' then begin
      XMIVerLabel.Caption := Str;
      if Str <> XMI_FIXED_VER then ShowFileInfoMessage(TXT_UNSUPPORT_XMI_VER);
    end;
  end;
end;

procedure TXMIImportForm.SetUMLVersionInfo(ParentNode: IXMLNode);
var
  Str: string;
  Node: IXMLNode;
begin
  if Assigned(XMLUtil) and (ParentNode <> nil) then begin
    Node := XMLUtil.FindFirstNode(ParentNode, NODE_XMI_METAMODEL);
    if Node <> nil then begin
      Str := XMLUtil.GetAttributeValue(Node, ATTR_XMI_VERSION);
      if Str <> '' then begin
        UMLVerLabel.Caption := Str;
        if Str <> UML_FIXED_VER then ShowFileInfoMessage(TXT_UNSUPPORT_XMI_VER);
      end;
    end;
  end;
end;

procedure TXMIImportForm.SetExporterInfo(ParentNode: IXMLNode);
var
  Str: string;
  Node: IXMLNode;
begin
  if Assigned(XMLUtil) and (ParentNode <> nil) then begin
    Node := XMLUtil.FindFirstNode(ParentNode, NODE_XMI_EXPORTER);
    if Node <> nil then begin
      Str := XMLUtil.GetNodeValue(Node);
      if Str <> '' then Str := Str + ' ';
    end;
    Node := XMLUtil.FindFirstNode(ParentNode, NODE_XMI_EXPORTER_VER);
    if Node <> nil then Str := Str + XMLUtil.GetNodeValue(Node);
    if Str <> '' then begin
      ExporterLabel.Caption := Str;
      if Pos(EXPORTER_UNISYS, Str) > 0 then SetRationalApprRecommended;
    end;
  end;
end;

procedure TXMIImportForm.SetRationalApprRecommended;
begin
  if not NewProjectCheck.Checked then NewProjectCheck.Checked := True;
  if not RationalApprCheck.Checked then RationalApprCheck.Checked := True;
  if not RationalApprRecommended.Visible then RationalApprRecommended.Visible := True;
end;

function TXMIImportForm.CheckXMIFileExistence(FN: string): Boolean;
var
  FileExt: string;
  Len: Integer;
begin
  Result := False;
  Len := Length(FN);
  if Len > 7 then begin
    FileExt := LowerCase(Copy(FN, Len - 2, 3));
    if (FileExt = XMI_FILE_EXT1) or (FileExt = XMI_FILE_EXT2) then begin
      Result := FileExists(FN);
    end;
  end;
end;

function TXMIImportForm.CheckXMIFileValidation(Doc: TXMLDocument): Boolean;
var
  Node, SubNode: IXMLNode;
  B: Boolean;
begin
  Result := False;
  if Assigned(Doc) then begin
    B := False;
    XMLUtil.XMLDocument := XMLDocument;
    Node := XMLUtil.RootNode;
    if Node <> nil then begin
      // Root node가 XMI
      B := (Node.NodeName = XMI_PREFIX);
      if not B then Exit;
      SubNode := XMLUtil.FindFirstNode(Node, NODE_XMI_HEADER);
      if SubNode <> nil then begin
        SubNode := XMLUtil.FindFirstNode(Node, NODE_XMI_METAMODEL);
        if SubNode <> nil then begin
          // XMI.metamodel이 UML
          B := (UpperCase(XMLUtil.GetAttributeValue(SubNode, ATTR_XMI_NAME)) = UML_PREFIX);
          if not B then Exit;
        end;
      end;
      // XMI.content가 존재
      SubNode := XMLUtil.FindFirstNode(Node, NODE_XMI_CONTENT);
      B := (SubNode <> nil);
      // 최상위 UML:Model 노드가 존재
      {
      if B then begin
        SubNode := XMLUtil.FindFirstNode(SubNode, NODE_UML_MODEL);
        B := (SubNode <> nil);
      end;
      }
    end;
    Result := B;
  end;
end;

procedure TXMIImportForm.SetXMIFileInformation(FN: string);
var Node: IXMLNode;
begin
  try
    XMLDocument.LoadFromFile(FN);
    XMLUtil.XMLDocument := XMLDocument;
    if CheckXMIFileValidation(XMLDocument) then begin
      ExecuteButton.Enabled := True;
      SetXMIVersionInfo(nil);
      Node := XMLUtil.FindFirstNode(nil, NODE_XMI_HEADER);
      if Node <> nil then SetUMLVersionInfo(Node);
      Node := XMLUtil.FindFirstNode(Node, NODE_XMI_DOC);
      if Node <> nil then SetExporterInfo(Node);
    end
    else ShowFileInfoMessage(TXT_INVALID_XMI_FILE);
  except on E: Exception do
    begin
      Application.MessageBox(PChar(Format(ERR_CANNOT_READ_FILE, [E.Message])),
        PChar(Application.Title), MB_ICONERROR + MB_OK);
    end;
  end;
end;

function TXMIImportForm.NewProjectAndRootElement: IUMLPackage;
var
  PjtMgr: IProjectManager;
  RootElem: IUMLPackage;
begin
  Result := nil;
  PjtMgr := StarUMLApp.ProjectManager;
  PjtMgr.CloseProject;
  if PjtMgr.Project <> nil then Exit; // 취소된 경우
  if RationalApprCheck.Checked then begin
    PjtMgr.NewProjectByApproach(APPROACH_RATIONAL);
    RootElem := PjtMgr.Project.FindByName(ROSE_LOGICAL_VIEW) as IUMLPackage;
    AppUtil.AddLog(MSG_NEW_PROJECT_WITH_APPR);
  end else begin
    PjtMgr.NewProject;
    AppUtil.AddLog(MSG_NEW_PROJECT);
    RootElem := StarUMLApp.UMLFactory.CreateModel(PjtMgr.Project);
    RootElem.Name := TXT_DUMMY_MODEL;
    AppUtil.AddLog(MSG_DUMMY_MODEL_CREATED);
  end;
  Result := RootElem;
end;

function TXMIImportForm.ExecuteElementSelector: IUMLPackage;
var
  Selector: IElementSelector;
begin
  Result := nil;
  Selector := StarUMLApp.ElementSelector;
  With Selector do begin
    AllowNull := False;
    Filter(fkPackages);
    ClearSelectableModels;
    AddSelectableModel(UML_MODEL);
    AddSelectableModel(UML_SUBSYSTEM);
    AddSelectableModel(UML_PACKAGE);
    if Execute(TXT_SELECT_PACKAGE) then
      Result := GetSelectedModel as IUMLPackage;
  end;
end;

function TXMIImportForm.GetRootElement: IUMLPackage;
begin
  Result := nil;
  if NewProjectCheck.Checked then begin
    Result := NewProjectAndRootElement;
  end else begin
    if StarUMLApp.ProjectManager.Project = nil then begin
      Application.MessageBox(PChar(ERR_PROJECT_NOT_FOUND),
        PChar(Application.Title), MB_ICONERROR + MB_OK);
      Exit;
    end;
    Result := ExecuteElementSelector;
  end;
end;

procedure TXMIImportForm.InitializeXMIToStarUMLAdapter(Adapter: PXMIToStarUMLAdapter);
begin
  if Adapter = nil then Exit;
  with Adapter do begin
    OnProgress := ProgressEventHandler;
    StarUMLApp := Self.StarUMLApp;
    XMLDocument := Self.XMLDocument;
    CreateDiagramMode := DiagramCheck.Checked;
    NewProjectMode := NewProjectCheck.Checked;
    RationalApproachMode := (RationalApprCheck.Enabled and RationalApprCheck.Checked);
  end;
end;

procedure TXMIImportForm.BeforeXMIImport;
begin
  ExecuteButton.Enabled := False;
  CancelButton.Enabled := False;
  Screen.Cursor := crHourGlass;
  StarUMLApp.BeginUpdate;
end;

procedure TXMIImportForm.AfterXMIImport;
begin
  StarUMLApp.EndUpdate2(True, True);
  Screen.Cursor := crDefault;
end;

// TXMIImportForm
////////////////////////////////////////////////////////////////////////////////

procedure TXMIImportForm.FormCreate(Sender: TObject);
begin
  NLSManager.SetFile(GetDllPath + '\' + NLS_FILE_NAME);
  NLSManager.TranslateComponent(Self, []);
  InitializeUI;
end;

procedure TXMIImportForm.FormShow(Sender: TObject);
var
  PjtMgr: IProjectManager;
begin
  if Assigned(StarUMLApp) then begin
    PjtMgr := StarUMLApp.ProjectManager;
    if PjtMgr.Project = nil then begin
      NewProjectCheck.Checked := True;
      NewProjectCheck.Enabled := False;
    end;
    AppUtil.StarUMLApp := StarUMLApp;
  end;
  UpdateUIStates;
end;

procedure TXMIImportForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AppUtil.StarUMLApp := nil;
  Action := caFree;
end;

procedure TXMIImportForm.FileLocationEditChange(Sender: TObject);
begin
  InitializeUI;
  if CheckXMIFileExistence(FileLocationEdit.Text) then
    SetXMIFileInformation(FileLocationEdit.Text);
  UpdateUIStates;    
end;

procedure TXMIImportForm.FileOpenButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    FileLocationEdit.Text := OpenDialog.FileName;
end;

procedure TXMIImportForm.CancelButtonClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TXMIImportForm.NewProjectCheckClick(Sender: TObject);
begin
  if NewProjectCheck.Checked then begin
    RationalApprCheck.Enabled := True;
    if not RationalApprRecommended.Enabled then
      RationalApprRecommended.Enabled := True;
  end else begin
    RationalApprCheck.Enabled := False;
    if RationalApprRecommended.Enabled then
      RationalApprRecommended.Enabled := False;
  end;
end;

procedure TXMIImportForm.ExecuteButtonClick(Sender: TObject);
var
  RootElem: IUMLPackage;
begin
  if not Assigned(StarUMLApp) then Exit;
  RootElem := GetRootElement;
  if RootElem = nil then Exit;

  XMIToStarUMLAdapter := PXMIToStarUMLAdapter.Create;
  try
    InitializeXMIToStarUMLAdapter(XMIToStarUMLAdapter);
    BeforeXMIImport;
    AppUtil.AddLog(Format(MSG_IMPORT_START, [FileLocationEdit.Text]));
    try
      XMIToStarUMLAdapter.ConvertXMIToStarUML(RootElem);
      AppUtil.AddLog(MSG_IMPORT_SUCCEEDE);
      Application.MessageBox(PChar(MSG_IMPORT_SUCCEEDE),
        PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    except on E: Exception do
      begin
        AppUtil.AddLog(Format(MSG_IMPORT_FAILED, [E.Message]));
        Application.MessageBox(PChar(MSG_IMPORT_FAILED2),
          PChar(Application.Title), MB_ICONERROR + MB_OK);
        CancelButton.Enabled := True;
      end;
    end;
  finally
    XMIToStarUMLAdapter.Free;
    AfterXMIImport;
    Self.Close;
  end;
end;

end.
