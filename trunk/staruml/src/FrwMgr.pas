unit FrwMgr;

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
  UMLModels,
  Classes, XMLDoc, XMLIntf;

const
  EXT_DIR = 'modules';
  FRAMEWORK_EXTENSION = 'frw';
  ICON_EXTENSION = 'ico';

type
  // PFramework
  PFramework = class
  private
    FName: string;
    FDisplayName: string;
    FDescription: string;
    FPath: string;
    FFileName: string;
    FIconFileName: string;
    FUnits: TStringList;
    FImportProfiles: TStringList;
    function GetUnitCount: Integer;
    function GetUnit(Index: Integer): string;
    function GetImportProfileCount: Integer;
    function GetImportProfile(Index: Integer): string;
  public
    constructor Create;
    destructor Destroy; override;
    property Name: string read FName;
    property DisplayName: string read FDisplayName;
    property Description: string read FDescription;
    property Path: string read FPath;
    property FileName: string read FFileName;
    property IconFileName: string read FIconFileName;
    property UnitCount: Integer read GetUnitCount;
    property Units[Index: Integer]: string read GetUnit;
    property ImportProfileCount: Integer read GetImportProfileCount;
    property ImportProfiles[Index: Integer]: string read GetImportProfile;

  end;

  // PFrameworkReader
  PFrameworkReader = class
  private
    procedure Report(Msg: string);
    function ReadStringValue(Node: IXMLNode; DefaultValue: string = ''): string;
    function ReadChildStringValue(ParentNode: IXMLNode; ChildNodeName: string; DefaultValue: string = ''): string;
    function ReadHeader(Node: IXMLNode; AFramework: PFramework): Boolean;
    function ReadBody(Node: IXMLNode; AFramework: PFramework): Boolean;
    function ReadImportProfiles(Node: IXMLNode; AFramework: PFramework): Boolean;
    function ReadFrameworkModels(Node: IXMLNode; AFramework: PFramework): Boolean;
  public
    function ReadFramework(AFramework: PFramework): Boolean;
  end;

  // PFrameworkManager
  PFrameworkManager = class
  private
    FFrameworks: TList;
    FFrameworkReader: PFrameworkReader;
    function GetFrameworkCount: Integer;
    function GetFramework(Index: Integer): PFramework;
    function AppendFramework(FrameworkName, Path, FileName, IconFileName: string): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadFrameworks;
    procedure CloseFrameworks;
    function GetFrameworkByName(FrameworkName: string): PFramework;
    property FrameworkCount: Integer read GetFrameworkCount;
    property Frameworks[Index: Integer]: PFramework read GetFramework;
  end;

var
  FrameworkManager: PFrameworkManager;

implementation

uses
  LogMgr,
  Windows, SysUtils, Forms, Variants, Registry, ActiveX, Dialogs, NLS_StarUML;

const
  FRAMEWORKS_REGPATH = '\Software\StarUML\Frameworks';
  REG_FRAMEWORK_PATH = 'Path';
  REG_FRAMEWORK_FILENAME = 'FileName';
  REG_FRAMEWORK_ICONFILENAME = 'IconFileName';

  FRW_FRAMEWORK = 'FRAMEWORK';
  FRW_HEADER = 'HEADER';
  FRW_BODY = 'BODY';
  FRW_NAME = 'NAME';
  FRW_DISPLAYNAME = 'DISPLAYNAME';
  FRW_DESCRIPTION = 'DESCRIPTION';
  FRW_IMPORTPROFILES = 'IMPORTPROFILES';
  FRW_PROFILE = 'PROFILE';
  FRW_FRAMEWORKMODELS = 'FRAMEWORKMODELS';
  FRW_UNIT = 'UNIT';

////////////////////////////////////////////////////////////////////////////////
// PFramework

constructor PFramework.Create;
begin
  inherited;
  FUnits := TStringList.Create;
  FImportProfiles := TStringList.Create;
end;

destructor PFramework.Destroy;
begin
  FUnits.Free;
  FImportProfiles.Free;
  inherited;
end;

function PFramework.GetUnitCount: Integer;
begin
  Result := FUnits.Count;
end;

function PFramework.GetUnit(Index: Integer): string;
begin
  Result := FUnits.Strings[Index];
end;

function PFramework.GetImportProfileCount: Integer;
begin
  Result := FImportProfiles.Count;
end;

function PFramework.GetImportProfile(Index: Integer): string;
begin
  Result := FImportProfiles[Index];
end;

// PFramework
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PFrameworkReader

procedure PFrameworkReader.Report(Msg: string);
begin
  // Log messsage or raise event.
  // call this method when need to report error or information on file reading
end;

function PFrameworkReader.ReadStringValue(Node: IXMLNode; DefaultValue: string = ''): string;
begin
  if VarIsStr(Node.NodeValue) then
    Result := Node.NodeValue
  else
    Result := DefaultValue;
end;

function PFrameworkReader.ReadChildStringValue(ParentNode: IXMLNode; ChildNodeName: string; DefaultValue: string = ''): string;
begin
  if VarIsStr(ParentNode.ChildValues[ChildNodeName]) then
    Result := ParentNode.ChildValues[ChildNodeName]
  else
    Result := DefaultValue;
end;

function PFrameworkReader.ReadHeader(Node: IXMLNode; AFramework: PFramework): Boolean;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(AFramework <> nil, 'Framework needed');
  // PRECONDITION

  Result := True;
  if Node.LocalName <> FRW_HEADER then begin
    Result := False;
    Exit;
  end;

  AFramework.FName := ReadChildStringValue(Node, FRW_NAME);
  if AFramework.FName = '' then begin
    Result := False;
    Exit;
  end;

  AFramework.FDisplayName := ReadChildStringValue(Node, FRW_DISPLAYNAME);
  if AFramework.FDisplayName = '' then begin
    Result := False;
    Exit;
  end;

  AFramework.FDescription := ReadChildStringValue(Node, FRW_DESCRIPTION);
end;

function PFrameworkReader.ReadBody(Node: IXMLNode; AFramework: PFramework): Boolean;
var
  IPR: IXMLNode;
  FWM: IXMLNode;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(AFramework <> nil, 'Framework needed');
  // PRECONDITION

  Result := True;
  if Node.LocalName <> FRW_BODY then begin
    Result := False;
    Exit;
  end;

  IPR := Node.ChildNodes[FRW_IMPORTPROFILES];
  if IPR <> nil then
    ReadImportProfiles(IPR, AFramework);

  FWM := Node.ChildNodes[FRW_FRAMEWORKMODELS];
  if FWM <> nil then
    ReadFrameworkModels(FWM, AFramework);
end;

function PFrameWorkReader.ReadImportProfiles(Node: IXMLNode; AFrameWork: PFrameWork): Boolean;
var
  N: IXMLNode;
  I: Integer;
  P: string;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(AFrameWork <> nil, 'FrameWork needed');
  // PRECONDITION

  Result := True;
  if Node.LocalName <> FRW_IMPORTPROFILES then begin
    Result := False;
    Exit;
  end;

  AFrameWork.FImportProfiles.Clear;
  for I := 0 to Node.ChildNodes.Count - 1 do begin
    N := Node.ChildNodes[I];
    if N.LocalName = FRW_PROFILE then begin
      P := ReadStringValue(N);
      if P <> '' then
        AFrameWork.FImportProfiles.Add(P);
    end;
  end;
end;

function PFrameworkReader.ReadFrameworkModels(Node: IXMLNode; AFramework: PFramework): Boolean;
var
  N: IXMLNode;
  I: Integer;
  P: string;
begin
  // PRECONDITION
  Assert(Node <> nil, 'Invalid XMLNode');
  Assert(AFramework <> nil, 'Framework needed');
  // PRECONDITION

  Result := True;
  if Node.LocalName <> FRW_FRAMEWORKMODELS then begin
    Result := False;
    Exit;
  end;

  AFramework.FUnits.Clear;
  for I := 0 to Node.ChildNodes.Count - 1 do begin
    N := Node.ChildNodes[I];
    if N.LocalName = FRW_UNIT then begin
      P := ReadStringValue(N);
      if P <> '' then
        AFramework.FUnits.Add(AFramework.Path + '\' + P);
    end;
  end;
end;

function PFrameworkReader.ReadFramework(AFramework: PFramework): Boolean;
var
  XMLDoc: TXMLDocument;
  RootNode: IXMLNode;
  HNode, BNode: IXMLNode;
begin
  // PRECONDITION
  Assert(AFramework <> nil, 'Framework needed');
  // PRECONDITION

  XMLDoc := TXMLDocument.Create(Application);
  try
    try
      XMLDoc.LoadFromFile(AFramework.FileName);
      // check AsyncLoadState
      if XMLDoc.IsEmptyDoc then begin
        Result := False;
        Exit;
      end;
      RootNode := XMLDoc.DocumentElement;
      if RootNode.LocalName <> FRW_FRAMEWORK then begin
        Result := False;
        Exit;
      end;
      HNode := RootNode.ChildNodes.Nodes[FRW_HEADER];
      BNode := RootNode.ChildNodes.Nodes[FRW_BODY];
      if (HNode = nil) or (BNode = nil) then begin
        Result := False;
        Exit;
      end
      else
        Result := ReadHeader(HNode, AFramework) and ReadBody(BNode, AFramework);
    except
      Result := False;
    end;
  finally
    XMLDoc.Free;
  end;
end;

// PFrameworkReader
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PFrameworkManager

constructor PFrameworkManager.Create;
begin
  inherited;
  CoInitialize(nil);
  FFrameworks := TList.Create;
  FFrameworkReader := PFrameworkReader.Create;
end;

destructor PFrameworkManager.Destroy;
begin
  CloseFrameworks;
  FFrameworks.Free;
  FFrameworkReader.Free;
  CoUninitialize;
  inherited;
end;

function PFrameworkManager.GetFrameworkCount: Integer;
begin
  Result := FFrameworks.Count;
end;

function PFrameworkManager.GetFramework(Index: Integer): PFramework;
begin
  Result := PFramework(FFrameworks.Items[Index]);
end;

function PFrameworkManager.AppendFramework(FrameworkName, Path, FileName, IconFileName: string): Boolean;
var
  F: PFramework;
begin
  if not FileExists(FileName) then begin
    Result := False;
    Exit;
  end;
  F := PFramework.Create;
  F.FName := FrameworkName; // will be overwrited in ReadFramework
  F.FPath := Path;
  F.FFileName := FileName;
  F.FIconFileName := IconFileName;
  if not FFrameworkReader.ReadFramework(F) then begin
    F.Free;
    Result := False;
    Exit;
  end;
  FFrameworks.Add(F);
  Result := True;
end;

procedure PFrameworkManager.LoadFrameworks;

  procedure LoadFiles(Path: String);
  var
    SearchRec: TSearchRec;
    FrameworkName, FolderPath, FileName, IconFileName: string;
  begin
    // files
    if FindFirst(Path + '\*' + FRAMEWORK_EXTENSION, faArchive, SearchRec) = 0 then begin
      repeat
        FrameworkName := Copy(SearchRec.Name, 1, Length(SearchRec.Name)-Length('.'+FRAMEWORK_EXTENSION));
        FolderPath := Path;
        FileName := Path + '\' + FrameworkName + '.' + FRAMEWORK_EXTENSION;
        IconFileName := Path + '\' + FrameworkName + '.' + ICON_EXTENSION;

        if AppendFramework(FrameworkName, FolderPath, FileName, IconFileName) then
          LogManager.Log(Format(MSG_FRAMEWORK_LOADED,[FrameworkName]))
        else
          LogManager.Log(Format(ERR_FRAMEWORK_LOAD_FAILED, [FrameworkName]));
      until FindNext(SearchRec) <> 0;
    end;

    // folders
    if FindFirst(Path + '\*', faDirectory, SearchRec) = 0 then begin
      repeat
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
          LoadFiles(Path + '\' + SearchRec.Name);
      until FindNext(SearchRec) <> 0;
    end;
  end;
begin
  LoadFiles(ExtractFileDir(Application.ExeName) + '\' + EXT_DIR);
end;


procedure PFrameworkManager.CloseFrameworks;
var
  I: Integer;
begin
  for I := FrameworkCount - 1 downto 0 do
    Frameworks[I].Free;
end;

function PFrameworkManager.GetFrameworkByName(FrameworkName: string): PFramework;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FrameworkCount - 1 do
    if Frameworks[I].Name = FrameworkName then begin
      Result := Frameworks[I];
      Exit;
    end;
end;

// PFrameworkManager
////////////////////////////////////////////////////////////////////////////////

initialization
  FrameworkManager := PFrameworkManager.Create;
finalization
  FrameworkManager.Free;
end.
