unit ProjectMgr;

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
  Core, ExtCore, UMLModels, UMLAux,
  Classes, Forms;

const
  DEFAULT_PROJECTFILE_EXT = '.uml';
  BACKUP_PROJECTFILE_EXT = '.~ml';
  DEFAULT_UNITFILE_EXT = '.unt';
  BACKUP_UNITFILE_EXT = '.~nt';

type
  // Enumeration Types
  PProjectStatusKind = (psOpened, psClosed);

  // PEvent Types
  PUnitEvent = procedure(Sender: TObject; APackage: PUMLPackage) of object;

  // PProjectManager
  PProjectManager = class
  private
    FProject: PUMLProject;
    FProjectDocument: PUMLProjectDocument;
    FUnitDocuments: TList;
    FProjectStatus: PProjectStatusKind;
    FCreateBackupFile: Boolean;
    FOnDocumentModified: PDocumentEvent;
    FOnDocumentSaved: PDocumentEvent;
    FOnProjectOpened: TNotifyEvent;
    FOnProjectSaved: TNotifyEvent;
    FOnProjectClosing: TNotifyEvent;
    FOnProjectCloseQuery: TCloseQueryEvent;
    FOnProjectClosed: TNotifyEvent;
    FOnUnitSeparated: PUnitEvent;
    FOnUnitMerged: PUnitEvent;
    FOnUnitOpened: PUnitEvent;
    FOnProfileIncluded: PProfileEvent;
    FOnProfileExcluded: PProfileEvent;
    FOnSavingProgress: PProgressEvent;
    FOnLoadingProgress: PProgressEvent;
    FOnResolvingProgress: PProgressEvent;
    function GetUnitDocument(Index: Integer): PUMLUnitDocument;
    function GetUnitDocumentCount: Integer;
    function GetDocumentElement(Index: Integer): PElement;
    function GetDocumentElementCount: Integer;
    function GetIncludedProfile(Index: Integer): string;
    function GetIncludedProfileCount: Integer;
    function GetModified: Boolean;
    function GetUnitsModified: Boolean;
    procedure SetCreateBackupFile(Value: Boolean);
    procedure ChangeFileReadOnlyAttr(AFileName: string);
    procedure DocumentModified(Sender: TObject; Document: PDocument);
    procedure DocumentSaved(Sender: TObject; Document: PDocument);
    procedure ProjectOpened;
    procedure ProjectSaved;
    procedure ProjectClosing;
    procedure ProjectCloseQuery(var CanClose: Boolean);
    procedure ProjectClosed;
    procedure SavingProgressHandler(Sender: TObject; Info: string; Max, Progress: Integer);
    procedure LoadingProgressHandler(Sender: TObject; Info: string; Max, Progress: Integer);
    procedure ResolvingProgressHandler(Sender: TObject; Info: string; Max, Progress: Integer);
    procedure MakeBackupFile(TargetFileName, DefaultExt, BackupExt: string);
    function LoadUnit(AParentUnit: PUMLUnitDocument; OwnerGuid: string; OwnedIndex: string; AFileName: string; AReferenceResolver: PReferenceResolver): PUMLUnitDocument;
    procedure SaveProjectDocument(AProjectDoc: PUMLProjectDocument);
    procedure SaveUnitDocument(AUnitDoc: PUMLUnitDocument);
    procedure AutoIncludeProfiles;
  public
    constructor Create;
    destructor Destroy; override;
    procedure NewProject(ApproachName: string = '');
    procedure SaveProject;
    procedure SaveProjectAs(FileName: string);
    procedure OpenProject(FileName: string; AFileAccessType: PFileAccessType);
    function ProjectCanClose: Boolean;
    function CloseProject: Boolean;
    function SeparateUnit(APackage: PUMLPackage; AFileName: string): PUMLUnitDocument;
    procedure MergeUnit(APackage: PUMLPackage);
    function OpenUnit(ABasePackage: PUMLPackage; AFileName: string): PUMLUnitDocument;
    procedure SaveUnit(APackage: PUMLPackage);
    procedure SaveUnitAs(APackage: PUMLPackage; AFileName: string);
    procedure SaveAllUnits;
    procedure ImportFramework(AOwner: PUMLPackage; FrameworkName: string);
    procedure ExportModelFragment(APackage: PUMLPackage; AFileName: string);
    function ImportModelFragment(AOwner: PUMLPackage; AFileName: string): PUMLPackage;
    procedure IncludeProfile(AProfileName: string);
    procedure ExcludeProfile(AProfileName: string);
    procedure UpdateDocuments;
    property Project: PUMLProject read FProject;
    property ProjectDocument: PUMLProjectDocument read FProjectDocument;
    property UnitDocuments[Index: Integer]: PUMLUnitDocument read GetUnitDocument;
    property UnitDocumentCount: Integer read GetUnitDocumentCount;
    property DocumentElements[Index: Integer]: PElement read GetDocumentElement;
    property DocumentElementCount: Integer read GetDocumentElementCount;
    property IncludedProfiles[Index: Integer]: string read GetIncludedProfile;
    property IncludedProfileCount: Integer read GetIncludedProfileCount;
    property Modified: Boolean read GetModified;
    property UnitsModified: Boolean read GetUnitsModified;
    property ProjectStatus: PProjectStatusKind read FProjectStatus;
    property CreackBackupFile: Boolean read FCreateBackupFile write SetCreateBackupFile;
    property OnDocumentModified: PDocumentEvent read FOnDocumentModified write FOnDocumentModified;
    property OnDocumentSaved: PDocumentEvent read FOnDocumentSaved write FOnDocumentSaved;
    property OnProjectOpened: TNotifyEvent read FOnProjectOpened write FOnProjectOpened;
    property OnProjectSaved: TNotifyEvent read FOnProjectSaved write FOnProjectSaved;
    property OnProjectClosing: TNotifyEvent read FOnProjectClosing write FOnProjectClosing;
    property OnProjectCloseQuery: TCloseQueryEvent read FOnProjectCloseQuery write FOnProjectCloseQuery;
    property OnProjectClosed: TNotifyEvent read FOnProjectClosed write FOnProjectClosed;
    property OnUnitSeparated: PUnitEvent read FOnUnitSeparated write FOnUnitSeparated;
    property OnUnitMerged: PUnitEvent read FOnUnitMerged write FOnUnitMerged;
    property OnUnitOpened: PUnitEvent read FOnUnitOpened write FOnUnitOpened;
    property OnProfileIncluded: PProfileEvent read FOnProfileIncluded write FOnProfileIncluded;
    property OnProfileExcluded: PProfileEvent read FOnProfileExcluded write FOnProfileExcluded;
    property OnSavingProgress: PProgressEvent read FOnSavingProgress write FOnSavingProgress;
    property OnLoadingProgress: PProgressEvent read FOnLoadingProgress write FOnLoadingProgress;
    property OnResolvingProgress: PProgressEvent read FOnResolvingProgress write FOnResolvingProgress;
  end;

implementation

uses
  FrwMgr, ApprMgr, UMLFacto, LogMgr, NLS_StarUML,
  SysUtils, Variants, Dialogs, Windows;

////////////////////////////////////////////////////////////////////////////////
// PProjectManager

constructor PProjectManager.Create;
begin
  inherited;
  FProject := nil;
  FProjectDocument := nil;
  FProjectStatus := psClosed;
  FUnitDocuments := TList.Create;
  FCreateBackupFile := True;
end;

destructor PProjectManager.Destroy;
begin
  FProject := nil;
  FProjectDocument := nil;
  FProjectStatus := psClosed;
  FUnitDocuments.Free;
  inherited;
end;

function PProjectManager.GetUnitDocument(Index: Integer): PUMLUnitDocument;
begin
  Result := FUnitDocuments.Items[Index];
end;

function PProjectManager.GetUnitDocumentCount: Integer;
begin
  Result := FUnitDocuments.Count;
end;

function PProjectManager.GetDocumentElement(Index: Integer): PElement;
begin
  if (Index = 0) then
    Result := FProject
  else
    Result := UnitDocuments[Index - 1].DocumentElement;
end;

function PProjectManager.GetDocumentElementCount: Integer;
begin
  if FProjectDocument <> nil then
    Result := FUnitDocuments.Count + 1
  else Result := 0;
end;

function PProjectManager.GetIncludedProfile(Index: Integer): string;
begin
  Result := ExtensionManager.IncludedProfiles[Index].Name;
end;

function PProjectManager.GetIncludedProfileCount: Integer;
begin
  Result := ExtensionManager.IncludedProfileCount;
end;

function PProjectManager.GetModified: Boolean;
var
  M: Boolean;
  I: Integer;
begin
  M := False;
  if FProjectDocument <> nil then
    M := M or FProjectDocument.Modified;
  for I := 0 to UnitDocumentCount - 1 do
    M := M or UnitDocuments[I].Modified;
  Result := M;
end;

function PProjectManager.GetUnitsModified: Boolean;
var
  M: Boolean;
  I: Integer;
begin
  M := False;
  for I := 0 to UnitDocumentCount - 1 do
    M := M or UnitDocuments[I].Modified;
  Result := M;
end;

procedure PProjectManager.SetCreateBackupFile(Value: Boolean);
begin
  if FCreateBackupFile <> Value then
  begin
    FCreateBackupFile := Value;
  end;
end;

procedure PProjectManager.ChangeFileReadOnlyAttr(AFileName: string);
var
  Attr: Integer;
begin
  Attr := FileGetAttr(AFileName);
  if FileExists(AFileName) and ((Attr and faReadOnly) = faReadOnly) then begin
    Attr := Attr and not faReadOnly;
    FileSetAttr(AFileName, Attr);
  end;
end;

procedure PProjectManager.DocumentModified(Sender: TObject; Document: PDocument);
begin
  if Assigned(FOnDocumentModified) then
    FOnDocumentModified(Self, Document);
end;

procedure PProjectManager.DocumentSaved(Sender: TObject; Document: PDocument);
begin
  if Assigned(FOnDocumentSaved) then
    FOnDocumentSaved(Self, Document);
end;

procedure PProjectManager.ProjectOpened;
begin
  if Assigned(FOnProjectOpened) then FOnProjectOpened(Self);
end;

procedure PProjectManager.ProjectSaved;
begin
  if Assigned(FOnProjectSaved) then FOnProjectSaved(Self);
end;

procedure PProjectManager.ProjectClosing;
begin
  if Assigned(FOnProjectClosing) then FOnProjectClosing(Self);
end;

function PProjectManager.ProjectCanClose: Boolean;
begin
  Result := True;
  ProjectCloseQuery(Result);
end;



procedure PProjectManager.ProjectCloseQuery(var CanClose: Boolean);
begin
  if Assigned(FOnProjectCloseQuery) then
    FOnProjectCloseQuery(Self, CanClose);
end;

procedure PProjectManager.ProjectClosed;
begin
  if Assigned(FOnProjectClosed) then FOnProjectClosed(Self);
end;

procedure PProjectManager.SavingProgressHandler(Sender: TObject; Info: string; Max, Progress: Integer);
begin
  if Assigned(FOnSavingProgress) then
    FOnSavingProgress(Self, Info, Max, Progress);
end;

procedure PProjectManager.LoadingProgressHandler(Sender: TObject; Info: string; Max, Progress: Integer);
begin
  if Assigned(FOnLoadingProgress) then
    FOnLoadingProgress(Self, Info, Max, Progress);
end;

procedure PProjectManager.ResolvingProgressHandler(Sender: TObject; Info: string; Max, Progress: Integer);
begin
  if Assigned(FOnResolvingProgress) then
    FOnResolvingProgress(Self, Info, Max, Progress);
end;

procedure PProjectManager.MakeBackupFile(TargetFileName, DefaultExt, BackupExt: string);
var
  BkFileName: string;
begin
  if FileExists(TargetFileName) then
  begin
    BkFileName := ExtractFilePath(TargetFileName) +
      StringReplace(ExtractFileName(TargetFileName),
        DefaultExt, BackupExt, [rfReplaceAll, rfIgnoreCase]);
    if FileExists(BkFileName) then
      SysUtils.DeleteFile(BkFileName);
    CopyFile(PChar(TargetFileName), PChar(BkFileName), False);
  end;
end;

function PProjectManager.LoadUnit(AParentUnit: PUMLUnitDocument; OwnerGuid: string;
  OwnedIndex: string; AFileName: string; AReferenceResolver: PReferenceResolver): PUMLUnitDocument;
var
  S: PUMLUnitDocumentInputStream;
  AUnit: PUMLUnitDocument;
  Owner: PUMLPackage;
  Index: Integer;
  I: Integer;
  ParentPath, UnitFileName: string;
  CurDir: string;
begin
  // PRECONDITIONS
  Assert(AParentUnit <> nil);
  Assert(AReferenceResolver <> nil);
  // PRECONDITIONS
  If not FileExists(AFileName) then
    raise EFileNotFound.Create(AFileName);
  S := PUMLUnitDocumentInputStream.Create(AFileName, AReferenceResolver);
  S.OnLoadingProgress := LoadingProgressHandler;
  try
    AUnit := S.ReadDocument(fatNormal) as PUMLUnitDocument;
    AUnit.ParentUnitDocument := AParentUnit;
    AUnit.OnModified := DocumentModified;
    AUnit.OnSaved := DocumentSaved;
    FUnitDocuments.Add(AUnit);
    CurDir := GetCurrentDir;
    ChDir(ExtractFilePath(AUnit.FileName));
    // load all sub units
    with S.HeaderSubUnitTable do
    begin
      SortByColumn('Index', True);
      for I := 0 to S.HeaderSubUnitTable.RowCount - 1 do
      begin
        UnitFileName := GetValueAt(I, 'FileName');
        if AUnit.ParentUnitDocument <> nil then
          ParentPath := ExtractFilePath(AUnit.ParentUnitDocument.FileName)
        else
          ParentPath := '';
        try
          // if path doesn't exist, search in ParentUnit's path
          if not FileExists(UnitFileName) then
            UnitFileName := ParentPath + ExtractFileName(UnitFileName);
          LoadUnit(AUnit, GetValueAt(I, 'Owner'), GetValueAt(I, 'Index'),
            UnitFileName, AReferenceResolver);
        except
          on E: EFileNotFound do
          begin
            LogManager.Log(Format(ERR_FILE_LOADING_FAILED, [UnitFileName]));
            MessageDlg(Format(ERR_FILE_LOADING_FAILED, [UnitFileName]), mtError, [mbOK], 0);
          end;
        end;
      end;
    end;
    ChDir(CurDir);
    // add unit element(DocumentElement) at Owner's indexed position
    Owner := MetaModel.FindInstanceByGuid(OwnerGuid) as PUMLPackage;
    try
      Index := StrToInt(OwnedIndex);
    except
      Index := -1;
    end;
    if Owner <> nil then
    begin
      if Index < 0 then
        Owner.AddOwnedElement(AUnit.DocumentElement as PUMLModelElement)
      else
        Owner.InsertOwnedElement(Index, AUnit.DocumentElement as PUMLModelElement);
    end;
  finally
    S.Free;
  end;
  Result := AUnit;
end;

procedure PProjectManager.SaveProjectDocument(AProjectDoc: PUMLProjectDocument);
var
  S: PUMLProjectDocumentOutputStream;
begin
  S := PUMLProjectDocumentOutputStream.Create(AProjectDoc.FileName);
  S.OnSavingProgress := SavingProgressHandler;
  try
    S.WriteDocument(AProjectDoc);
    S.Close(AProjectDoc);
  finally
    S.Free;
  end;
end;

procedure PProjectManager.SaveUnitDocument(AUnitDoc: PUMLUnitDocument);
var
  Pkg: PUMLPackage;
  Owner: PUMLNamespace;
  Idx: Integer;
  S: PUMLUnitDocumentOutputStream;
begin
  if (AUnitDoc <> nil) and (AUnitDoc.DocumentElement <> nil) then
  begin
    // memorize Unit package's Namespace temporarily
    Pkg := AUnitDoc.DocumentElement as PUMLPackage;
    Owner := Pkg.Namespace;
    Idx := Owner.IndexOfOwnedElement(Pkg);
    // separate Unit's Namespace
    Pkg.Namespace := nil;
    // save Unit
    try
      S := PUMLUnitDocumentOutputStream.Create(AUnitDoc.FileName);
      S.OnSavingProgress := SavingProgressHandler;
      try
        S.WriteDocument(AUnitDoc);
        S.Close(AUnitDoc);
      finally
        S.Free;
      end;
    finally
      // restore temporary memorized Namespace
      Owner.InsertOwnedElement(Idx, Pkg);
    end;
  end;
end;

procedure PProjectManager.AutoIncludeProfiles;
var
  I: Integer;
  P: PProfile;
begin
  for I := 0 to ExtensionManager.AvailableProfileCount - 1 do
  begin
    P := ExtensionManager.AvailableProfiles[I];
    if P.AutoInclude then
      IncludeProfile(P.Name);
  end;
end;

procedure PProjectManager.NewProject(ApproachName: string = '');

  procedure SetStereotype(APackage: PUMLPackage; AElemNode: PModelElementNode);
  begin
    if AElemNode.StereotypeName <> '' then begin
      if AElemNode.StereotypeProfile <> '' then
        APackage.SetStereotype(AElemNode.StereotypeProfile, AElemNode.StereotypeName)
      else
        APackage.SetStereotype(AElemNode.StereotypeName)
    end;
  end;

  procedure BuildModelStrNode(AApproach: PApproach; AModelStrNode: PModelStructureNode; APackage: PUMLPackage);
  var
    Node: PModelStructureNode;
    ElemNode: PModelElementNode;
    DgmNode: PDiagramNode;
    ModelFragNode: PImportModelFragmentNode;
    Pkg: PUMLPackage;
    Dgm: PDiagram;
    DgmModel: PModel;
    DT: PDiagramType;
    Path: string;
    I: Integer;
  begin
    for I := 0 to AModelStrNode.ChildNodeCount - 1 do begin
      Node := AModelStrNode.ChildNodes[I];
      if Node is PModelElementNode then begin
        ElemNode := Node as PModelElementNode;
        case ElemNode.Kind of
          nkModel:
            Pkg := UMLFactory.CreateModel(APackage, 'Model') as PUMLPackage;
          nkSubsystem:
            Pkg := UMLFactory.CreateModel(APackage, 'Subsystem') as PUMLPackage;
          nkPackage:
            Pkg := UMLFactory.CreateModel(APackage, 'Package') as PUMLPackage;
          else
            Pkg := nil;
        end;
        if Pkg <> nil then begin
          Pkg.Name := Node.Name;
          SetStereotype(Pkg, ElemNode);
          BuildModelStrNode(AApproach, Node, Pkg);
        end;          
      end
      else if Node is PImportFrameworkNode then begin
        ImportFramework(APackage, Node.Name);
      end
      else if Node is PImportModelFragmentNode then begin
        ModelFragNode := Node as PImportModelFragmentNode;
        if ModelFragNode.FileName <> '' then begin
          Path := AApproach.Path + '\' + ModelFragNode.FileName;
          if FileExists(Path) then
            ImportModelFragment(APackage, Path);
        end;  
      end
      else if Node is PDiagramNode then begin
        Dgm := nil;
        DgmNode := Node as PDiagramNode;
        if (DgmNode.DiagramTypeProfile <> '') and (DgmNode.DiagramTypeName <> '') then begin
          DT := ExtensionManager.FindDiagramType(DgmNode.DiagramTypeProfile, DgmNode.DiagramTypeName);
          if DT <> nil then begin
            Dgm := UMLFactory.CreateDiagram(APackage, DT.BaseDiagram, DT.Name, DgmModel);
            if Dgm <> nil then
              Dgm.DiagramType := DgmNode.DiagramTypeName;
          end;
        end;
        if Dgm = nil then begin
          case DgmNode.DiagramType of
            dkClass:      Dgm := UMLFactory.CreateDiagram(APackage, 'ClassDiagram', DgmModel);
            dkUsecase:    Dgm := UMLFactory.CreateDiagram(APackage, 'UseCaseDiagram', DgmModel);
            dkComponent:  Dgm := UMLFactory.CreateDiagram(APackage, 'ComponentDiagram', DgmModel);
            dkDeployment: Dgm := UMLFactory.CreateDiagram(APackage, 'DeploymentDiagram', DgmModel);
          end;
        end;
        if Dgm <> nil then begin
          Dgm.DefaultDiagram := DgmNode.DefaultDiagram;
          Dgm.Name := Node.Name;
        end;
      end;
    end;
  end;

var
  Approach: PApproach;
  I: Integer;
begin
  if CloseProject then
  begin
    FProject := MetaModel.CreateInstance('UMLProject') as PUMLProject;
    FProject.Title := 'Untitled';
    FProjectDocument := PUMLProjectDocument.Create;
    FProjectDocument.DocumentElement := FProject;
    FProjectDocument.OnModified := DocumentModified;
    FProjectDocument.OnSaved := DocumentSaved;
    if ApproachName <> '' then begin
      Approach := ApproachManager.GetApproachByName(ApproachName);
      if Approach <> nil then begin
        AutoIncludeProfiles;      
        for I := 0 to Approach.ImportProfileCount - 1 do
          ExtensionManager.IncludeProfile(Approach.ImportProfiles[I]);
        BuildModelStrNode(Approach, Approach.RootNode, FProject);
      end;
    end;
    FProjectStatus := psOpened;
    ProjectOpened;
  end;
end;

procedure PProjectManager.SaveProject;
begin
  if (FProjectDocument <> nil) and (FProjectDocument.Modified) then
  begin
    if FCreateBackupFile then
      MakeBackupFile(FProjectDocument.FileName,
        DEFAULT_PROJECTFILE_EXT, BACKUP_PROJECTFILE_EXT);
    SaveProjectDocument(FProjectDocument);
  end;
  ProjectSaved;
end;

procedure PProjectManager.SaveProjectAs(FileName: string);
begin
  ChangeFileReadOnlyAttr(FileName);
  if FProjectDocument <> nil then
  begin
    // Renaming a project with exclusive file access drops exclusive status
    FProjectDocument.RemoveExclusiveFileAccess;

    FProjectDocument.FileName := FileName;
    if FCreateBackupFile then
      MakeBackupFile(FProjectDocument.FileName,
        DEFAULT_PROJECTFILE_EXT, BACKUP_PROJECTFILE_EXT);

    SaveProjectDocument(FProjectDocument);
  end;
  ProjectSaved;
end;

procedure PProjectManager.OpenProject(FileName: string; AFileAccessType: PFileAccessType);
var
  S: PUMLProjectDocumentInputStream;
  Resolver: PReferenceResolver;
  I: Integer;
  FN, PN: string;
  CurDir: string;
begin
  if CloseProject then
  begin
    // create ReferenceResolver
    Resolver := PReferenceResolver.Create;
    Resolver.OnResolvingProgress := ResolvingProgressHandler;
    Resolver.Clear;
    // exclude all current loaded profiles
    ExtensionManager.ClearIncludedProfiles;
    // load Project file
    S := PUMLProjectDocumentInputStream.Create(FileName, Resolver);
    S.OnLoadingProgress := LoadingProgressHandler;
    try
      FProjectDocument := S.ReadDocument(AFileAccessType) as PUMLProjectDocument;
      FProjectDocument.OnModified := DocumentModified;
      FProjectDocument.OnSaved := DocumentSaved;
      FProject := FProjectDocument.DocumentElement as PUMLProject;
      // load all sub Units of Project
      CurDir := GetCurrentDir;
      ChDir(ExtractFilePath(FileName));
      with S.HeaderSubUnitTable do
      begin
        SortByColumn('Index', True);
        for I := 0 to S.HeaderSubUnitTable.RowCount - 1 do
        begin
          try
            FN := GetValueAt(I, 'FileName');
            LoadUnit(FProjectDocument, GetValueAt(I, 'Owner'), GetValueAt(I, 'Index'), FN, Resolver);
          except
            on E: EFileNotFound do
            begin
              LogManager.Log(Format(ERR_FILE_LOADING_FAILED, [FN]));
              MessageDlg(Format(ERR_FILE_LOADING_FAILED, [FN]), mtError, [mbOK], 0);
            end;
          end
        end;
      end;
      ChDir(CurDir);
      // load all Profiles used in Project
      for I := 0 to S.HeaderProfiles.Count - 1 do
      begin
        try
          PN := S.HeaderProfiles[I];
          IncludeProfile(PN);
        except
          on E: EProfileNotFound do
          begin
            LogManager.Log(Format(ERR_PROFILE_NOT_FOUND, [PN]));
            MessageDlg(Format(ERR_PROFILE_NOT_FOUND, [PN]), mtError, [mbOK], 0);
          end;
        end;
      end;
      // resolve all references
      Resolver.ResolveAll;
      Resolver.Free;
      FProjectStatus := psOpened;
      ProjectOpened;
    finally
      S.Free;
    end;
    UpdateDocuments;
  end;
end;

function PProjectManager.CloseProject: Boolean;
var
  CanClose: Boolean;
begin
  CanClose := True;
  if FProjectStatus = psOpened then
  begin
    //ProjectCloseQuery(CanClose);
    if CanClose then
    begin
      ProjectClosing;
      if FProjectDocument <> nil then
      begin
        FProjectDocument.Free;
        FProjectDocument := nil;
      end;
      if FProject <> nil then
      begin
        FProject.Free;
        FProject := nil;
      end;
      FProjectStatus := psClosed;
      FUnitDocuments.Clear;
      MetaModel.ClearInstances;
      ExtensionManager.ExcludeAllProfiles;
      ProjectClosed;
    end;
  end;
  Result := CanClose;
end;

function PProjectManager.SeparateUnit(APackage: PUMLPackage; AFileName: string): PUMLUnitDocument;
var
  D: PUMLUnitDocument;
  AUnit, MUnit: PUMLUnitDocument;
  RC: PReferenceCollectionVisitor;
  I: Integer;
  M: PModel;
begin
  // PRECONDITIONS
  Assert(not APackage.IsDocumentElement);
  // PRECONDITIONS
  ChangeFileReadOnlyAttr(AFileName);
  D := APackage.GetContainingDocument as PUMLUnitDocument;
  AUnit := PUMLUnitDocument.Create;
  AUnit.DocumentElement := APackage;
  AUnit.FileName := AFileName;
  AUnit.OnModified := DocumentModified;
  AUnit.OnSaved := DocumentSaved;
  RC := PReferenceCollectionVisitor.Create;
  APackage.Accept(RC);
  for I := 0 to RC.ReferenceCount - 1 do begin
    if RC.References[I] is PModel then begin
      M := RC.References[I] as PModel;
      if M.IsDocumentElement then begin
        MUnit := M.Document as PUMLUnitDocument;
        if MUnit.ParentUnitDocument = D then
          MUnit.ParentUnitDocument := AUnit;
      end;
    end;
  end;
  D.AddSubUnitDocument(AUnit);
  FUnitDocuments.Add(AUnit);
  Result := AUnit;
  if Assigned(FOnUnitSeparated) then FOnUnitSeparated(Self, APackage);
end;

procedure PProjectManager.MergeUnit(APackage: PUMLPackage);
var
  AUnit: PUMLUnitDocument;
  ParentDoc: PUMLUnitDocument;
  I: Integer;
begin
  // PRECONDITION
  Assert(APackage.IsDocumentElement);
  // PRECONDITION
  AUnit := APackage.Document as PUMLUnitDocument;
  ParentDoc := AUnit.ParentUnitDocument;
  for I := AUnit.SubUnitDocumentCount - 1 downto 0 do begin
    AUnit.SubUnitDocuments[I].ParentUnitDocument := ParentDoc;
  end;
  APackage.Document := nil;
  ParentDoc.RemoveSubUnitDocument(AUnit);
  FUnitDocuments.Remove(AUnit);
  AUnit.ParentUnitDocument := nil;
  AUnit.Free;
  if Assigned(FOnUnitMerged) then FOnUnitMerged(Self, APackage);
end;

function PProjectManager.OpenUnit(ABasePackage: PUMLPackage; AFileName: string): PUMLUnitDocument;
var
  AUnit, ParentUnit: PUMLUnitDocument;
  Resolver: PReferenceResolver;
begin
  ParentUnit := ABasePackage.GetContainingDocument as PUMLUnitDocument;
  Resolver := PReferenceResolver.Create;
  Resolver.OnResolvingProgress := ResolvingProgressHandler;
  Resolver.Clear;
  try
    AUnit := LoadUnit(ParentUnit, ABasePackage.GUID, '-1', AFileName, Resolver);
    if (AUnit <> nil) and (AUnit.DocumentElement <> nil) then
    begin
      Resolver.ReassignGUIDs(AUnit.DocumentElement);
      Resolver.BlockedResolveAll(AUnit.DocumentElement);
    end;
  finally
    Resolver.Free;
  end;
  if Assigned(FOnUnitOpened) then
    FOnUnitOpened(Self, AUnit.DocumentElement as PUMLPackage);
  Result := AUnit;
end;

procedure PProjectManager.SaveUnit(APackage: PUMLPackage);
var
  AUnit: PUMLUnitDocument;
begin
  if APackage.IsDocumentElement then begin
    AUnit := APackage.Document as PUMLUnitDocument;
    if AUnit.Modified then
    begin
      if FCreateBackupFile then
        MakeBackupFile(AUnit.FileName, DEFAULT_UNITFILE_EXT, BACKUP_UNITFILE_EXT);
      SaveUnitDocument(AUnit);
    end;
  end;
end;

procedure PProjectManager.SaveUnitAs(APackage: PUMLPackage; AFileName: string);
var
  AUnit: PUMLUnitDocument;
begin
  if APackage.IsDocumentElement then begin
    ChangeFileReadOnlyAttr(AFileName);
    AUnit := APackage.Document as PUMLUnitDocument;
    AUnit.FileName := AFileName;
    AUnit.Modified := True;
    SaveUnit(APackage);
  end;
end;

procedure PProjectManager.SaveAllUnits;
var
  D: PUMLUnitDocument;
  I: Integer;
begin
  for I := 0 to FUnitDocuments.Count - 1 do
  begin
    D := FUnitDocuments.Items[I];
    SaveUnit(D.DocumentElement as PUMLPackage);
  end;
end;

procedure PProjectManager.ImportFramework(AOwner: PUMLPackage; FrameworkName: string);
var
  Framework: PFramework;
  Doc: PUMLUnitDocument;
  Resolver: PReferenceResolver;
  I: Integer;
  Index: string;
  CurDir: string;
begin
  Framework := FrameworkManager.GetFrameworkByName(FrameworkName);
  // Import Profiles used in Framework.
  for I := 0 to Framework.ImportProfileCount - 1 do
    IncludeProfile(Framework.ImportProfiles[I]);
  // Import Framework Units.
  if Framework <> nil then
  begin
    Doc := AOwner.GetContainingDocument as PUMLUnitDocument;
    Resolver := PReferenceResolver.Create;
    Resolver.OnResolvingProgress := ResolvingProgressHandler;
    Resolver.Clear;
    GetDir(0, CurDir);
    ChDir(Framework.Path);
    for I := 0 to Framework.UnitCount - 1 do
    begin
      Index := IntToStr(AOwner.OwnedElementCount);
      LoadUnit(Doc, AOwner.GUID, Index, Framework.Units[I], Resolver);
    end;
    ChDir(CurDir);
    Resolver.ResolveAll;
    Resolver.Free;
    UpdateDocuments;
  end;
end;

procedure PProjectManager.ExportModelFragment(APackage: PUMLPackage; AFileName: string);
var
  Owner: PUMLNamespace;
  Idx: Integer;
  OldDoc: PDocument;
  Frag: PUMLModelFragmentDocument;
  S: PUMLModelFragmentDocumentOutputStream;
begin
  if (APackage <> nil) and (AFileName <> '') then
  begin
    ChangeFileReadOnlyAttr(AFileName);
    // memorize APackage's Document and Namespace
    OldDoc := APackage.Document;
    Owner := APackage.Namespace;
    Idx := Owner.IndexOfOwnedElement(APackage);
    // create new ModelFragment Document
    Frag := PUMLModelFragmentDocument.Create;
    Frag.FileName := AFileName;
    try
      // set APackage's Document to Frag, disconnect relationship to Namespace
      APackage.Document := Frag;
      APackage.Namespace := nil;
      // store Frag document
      S := PUMLModelFragmentDocumentOutputStream.Create(AFileName);
      try
        S.WriteDocument(Frag);
        S.Close(Frag);
      finally
        S.Free;
      end;
    finally
      // restore original APackage status
      APackage.Document := OldDoc;
      Owner.InsertOwnedElement(Idx, APackage);
      Frag.Free;
    end;
  end;
end;

function PProjectManager.ImportModelFragment(AOwner: PUMLPackage; AFileName: string): PUMLPackage;
var
  Frag: PUMLModelFragmentDocument;
  ImportedElement: PUMLModelElement;
  Resolver: PReferenceResolver;
  S: PUMLModelFragmentDocumentInputStream;
begin
  // PRECONDITIONS
  Assert(AOwner <> nil);
  Assert(AFileName <> '');
  // PRECONDITIONS
  Resolver := PReferenceResolver.Create;
  Resolver.OnResolvingProgress := ResolvingProgressHandler;
  S := PUMLModelFragmentDocumentInputStream.Create(AFileName, Resolver);
  S.OnLoadingProgress := LoadingProgressHandler;
  try
    // Loading ModelFragment.
    Frag := S.ReadDocument(fatNormal) as PUMLModelFragmentDocument;
    ImportedElement := Frag.DocumentElement as PUMLModelElement;
    // Reassigning GUIDs.
    Resolver.ReassignGUIDs(ImportedElement);
    // Resolve references and Add to Owner.
    Resolver.BlockedResolveAll(ImportedElement);
    AOwner.AddOwnedElement(ImportedElement);
    Frag.DocumentElement := nil;
    Frag.Free;
  finally
    S.Free;
  end;
  Resolver.Free;
  Result := ImportedElement as PUMLPackage;
end;

procedure PProjectManager.IncludeProfile(AProfileName: string);
begin
  if FProjectDocument <> nil then
  begin
    ExtensionManager.IncludeProfile(AProfileName);
    FProjectDocument.AddProfile(AProfileName);
    if Assigned(FOnProfileIncluded) then
      FOnProfileIncluded(Self, AProfileName);
  end;
end;

procedure PProjectManager.ExcludeProfile(AProfileName: string);
begin
  if FProjectDocument <> nil then
  begin
    ExtensionManager.ExcludeProfile(AProfileName);
    FProjectDocument.RemoveProfile(AProfileName);
    if Assigned(FOnProfileIncluded) then
      FOnProfileIncluded(Self, AProfileName);
  end;
end;

procedure PProjectManager.UpdateDocuments;
var
  I: Integer;
begin
  if FProjectDocument <> nil then
    FProjectDocument.UpdateFileAttr;
  for I := 0 to UnitDocumentCount - 1 do
    UnitDocuments[I].UpdateFileAttr;
end;

// PProjectManager
////////////////////////////////////////////////////////////////////////////////
end.


