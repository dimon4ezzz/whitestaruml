unit ContributorMgr;

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
  Core, Classes, XMLIntf;

type
  // PContributorManager
  PContributorManager = class
  private
    FContributorList: TStringList;
    FPartList: TStringList;
    FAppliableElementList: TStringList;
    FCurrentContributor: Integer;
    function GetContributorCount: Integer;
    function GetContributor(Index: Integer): string;
    function GetPart(Index: Integer): string;
    function GetAppliableElementCount: Integer;
    function GetAppliableElement(Index: Integer): string;
    function ReadStringAttribute(Node: IXMLNode; AttrName: string; DefaultValue: string = ''): string;
    procedure ReadContributorList(Node: IXMLNode);
    procedure ReadAppliableElementList(Node: IXMLNode);
    function IsContributorNamingElement(Model: PModel): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ReadContributorsFile;
    procedure LoadFromRegistry;
    procedure SaveToRegistry;
    function IssueElementNamePrefix(Model: PModel; DefaultNamePrefix: string): string;
    property ContributorCount: Integer read GetContributorCount;
    property Contributors[Index: Integer]: string read GetContributor;
    property Parts[Index: Integer]: string read GetPart;
    property AppliableElementCount: Integer read GetAppliableElementCount;
    property AppliableElements[Index: Integer]: string read GetAppliableElement;
    property CurrentContributor: Integer read FCurrentContributor;
  end;

var
  ContributorManager: PContributorManager;

implementation

uses
  LogMgr, NLS_StarUML,
  Windows, Forms, SysUtils, XMLDoc, Variants, Registry;

const
  FILENAME_CONTRIBUTOR = 'Contributors.xml';
  //RK_CONTRIBUTORS = '\SOFTWARE\StarUML\Contributors';
  RK_CONTRIBUTORS = RK_BASE_LOCATION + 'Contributors';
  RV_CURRENT = 'CurrentIndex';
  CTR_CONTRIBUTORMANAGEMENT = 'CONTRIBUTORMANAGEMENT';
  CTR_CONTRIBUTORLIST = 'CONTRIBUTORLIST';
  CTR_CONTRIBUTOR = 'CONTRIBUTOR';
  CTR_APPLIABLEELEMENTLIST = 'APPLIABLEELEMENTLIST';
  CTR_APPLIABLEELEMENT = 'APPLIABLEELEMENT';
  CTR_PART = 'part';

////////////////////////////////////////////////////////////////////////////////
// PContributorManager

constructor PContributorManager.Create;
begin
  FContributorList := TStringList.Create;
  FPartList := TStringList.Create;
  FAppliableElementList := TStringList.Create;
  FCurrentContributor := 0;
end;

destructor PContributorManager.Destroy;
begin
  FContributorList.Free;
  FPartList.Free;
  FAppliableElementList.Free;
  inherited;
end;

function PContributorManager.GetContributorCount: Integer;
begin
  Result := FContributorList.Count;
end;

function PContributorManager.GetContributor(Index: Integer): string;
begin
  Result := FContributorList[Index];
end;

function PContributorManager.GetPart(Index: Integer): string;
begin
  Result := FPartList[Index];
end;

function PContributorManager.GetAppliableElementCount: Integer;
begin
  Result := FAppliableElementList.Count;
end;

function PContributorManager.GetAppliableElement(Index: Integer): string;
begin
  Result := FAppliableElementList[Index];
end;

function PContributorManager.ReadStringAttribute(Node: IXMLNode; AttrName: string; DefaultValue: string = ''): string;
begin
  Result := DefaultValue;
  if Node.HasAttribute(AttrName) and VarIsStr(Node.Attributes[AttrName]) then
    Result := Node.Attributes[AttrName];
end;

procedure PContributorManager.ReadContributorList(Node: IXMLNode);
var
  N: IXMLNode;
  I: Integer;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do begin
    N := Node.ChildNodes[I];
    if (N.LocalName = CTR_CONTRIBUTOR) and VarIsStr(N.NodeValue) then begin
      FContributorList.Add(N.NodeValue);
      FPartList.Add(ReadStringAttribute(N, CTR_PART));
    end;
  end;
end;

procedure PContributorManager.ReadAppliableElementList(Node: IXMLNode);
var
  N: IXMLNode;
  I: Integer;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do begin
    N := Node.ChildNodes[I];
    if (N.LocalName = CTR_APPLIABLEELEMENT) and VarIsStr(N.NodeValue) then
      FAppliableElementList.Add(N.NodeValue);
  end;
end;

function PContributorManager.IsContributorNamingElement(Model: PModel): Boolean;
var
  S: string;
  I: Integer;
begin
  Result := False;
  S := Model.MetaClass.Name;
  for I := 0 to AppliableElementCount - 1 do
    if AppliableElements[I] = S then begin
      Result := True;
      Exit;
    end;
end;

procedure PContributorManager.ReadContributorsFile;
var
  XMLDoc: TXMLDocument;
  FileName: string;
  RootNode, ContListNode, ElemListNode: IXMLNode;
begin
  FContributorList.Clear;
  FPartList.Clear;
  FAppliableElementList.Clear;
  XMLDoc := TXMLDocument.Create(Application);
  try
    FileName := ExtractFileDir(Application.ExeName) + '\' + FILENAME_CONTRIBUTOR;
    if FileExists(FileName) then begin
      try
        XMLDoc.LoadFromFile(FileName);
        if not XMLDoc.IsEmptyDoc then begin
          RootNode := XMLDoc.DocumentElement;
          if RootNode.LocalName = CTR_CONTRIBUTORMANAGEMENT then begin
            ContListNode := RootNode.ChildNodes.Nodes[CTR_CONTRIBUTORLIST];
            if ContListNode <> nil then
              ReadContributorList(ContListNode);
            ElemListNode := RootNode.ChildNodes.Nodes[CTR_APPLIABLEELEMENTLIST];
            if ElemListNode <> nil then
              ReadAppliableElementList(ElemListNode);
          end;
        end;
      except
        LogManager.Log(ERR_INVALID_CONTRIBUTORS_FILE);
      end;
    end;
  finally
    XMLDoc.Free;
  end;
end;

procedure PContributorManager.LoadFromRegistry;
var
  Reg: TRegistry;
begin
  FCurrentContributor := 0;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(RK_CONTRIBUTORS, False) then begin
      try
        FCurrentContributor := Reg.ReadInteger(RV_CURRENT);
      except
        // do nothing. (FCurrentContributor is set to 0)
      end;
      Reg.CloseKey;
    end;
  finally
    Reg.Free;    
  end;
end;

procedure PContributorManager.SaveToRegistry;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(RK_CONTRIBUTORS, True) then begin
      try
        Reg.WriteInteger(RV_CURRENT, FCurrentContributor);
      except
        // do nothing. ignore saving.
      end;
      Reg.CloseKey;
    end;
  finally
    Reg.Free;    
  end;
end;

function PContributorManager.IssueElementNamePrefix(Model: PModel; DefaultNamePrefix: string): string;
begin
  if IsContributorNamingElement(Model) and (ContributorCount > 0) then begin
    Result := Contributors[FCurrentContributor];
    Inc(FCurrentContributor);
    if FCurrentContributor > ContributorCount - 1 then
      FCurrentContributor := 0;
  end
  else
    Result := DefaultNamePrefix;
end;

// PContributorManager
////////////////////////////////////////////////////////////////////////////////

initialization
  ContributorManager := PContributorManager.Create;
finalization
  ContributorManager.Free;
end.
