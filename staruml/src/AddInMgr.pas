unit AddInMgr;

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
  Classes, XMLDoc, XMLIntf, ComCtrls, Windows, Registry, dxBar,
  SysUtils, Graphics, Core, WhiteStarUML_TLB;

const
  EXT_DIR = 'modules';
  ADDIN_DESCRIPTION_EXTENSION = 'aid';
  COM_EXTENSION = 'dll';
  ICON_EXTENSION = 'ico';
  ERR_EMPTY_DOCUMENT = 'The File is Empty Document.';

type
  // Event type
  PAddInRelMsgOccuredEvent = procedure (str: string) of object;

  // Exception type
  EAddInLoadingValuesException = class(Exception);
  EAddInMenuFileInvalidException = class(Exception);
  // Enumeration types
  PAddInFrameWindowParent = (pwError, pwBrowser, pwInspector, pwInformation);

  // PAddIn
  PAddIn = class
  protected
    FMenusList: TList;            // List Storing MenuItems
    FRegKey: string;              // Registry Key
    FAddInName: string;           // Add-In's Name
    FDisplayName: string;         // Add-In's Display Name
    FCompany: string;             // Add-In's Company Name
    FCopyright: string;           // Add-In's Copyright Information
    FVersion: string;             // Add-In's Version Information
    FCOMObjName: string;          // Add-In COM Server Programmatic Identifier
    FInstalledDir: string;        // Add-In Installed Directory Path
    FMenuFileName: string;        // Add-In Menu File's Name
    FHelpFileName: string;        // Add-In Help File's Name
    FIconFileName: string;        // Add-In Icon File's Name
    FIsActive: Boolean;           // Add-In Status whether it is active or not
    FMenuItemIconList: TList;
    FIcon: TIcon;
    FFilename: String;
    FModulePath: TStringList;
    FOnMessage: PAddInRelMsgOccuredEvent;
    procedure SetupMainMenus(XMLNode: IXMLNode);
    procedure SetupPopupMenus(XMLNode: IXMLNode);
    procedure SetupTopLevelMainMenuItem(MainMenu: TdxBar; XMLNode: IXMLNode);
    procedure SetupTopLevelPopupMenuItem(PopupMenu: TdxBarPopupMenu; XMLNode: IXMLNode);
    procedure SetupSubMenuItem(XMLNode: IXMLNode; ParentItem: TdxBarSubItem);
    procedure SetupHelpMenu;
    procedure SetAllMenuItemsVisibility(IsVisible: Boolean);
    { utility methods }
    function GetRegValue(Reg: TRegistry; RegValues: TStringList; Str: string): string;
    function GetBase(XMLNode: IXMLNode):string;
    function GetExistingBase(Base: string): TdxBarSubItem;
    function GetCaption(XMLNode: IXMLNode): string;
    function GetScript(XMLNode: IXMLNode): string;
    function GetItemID(XMLNode: IXMLNode): Integer;
    function GetItemIndex(XMLNode: IXMLNode): Integer;
    function GetAvailableTime(XMLNode: IXMLNode): string;
    function GetLocation(XMLNode: IXMLNode): string;
    function GetBeginGroup(XMLNode: IXMLNode): Boolean;
    function GetItemIcon(XMLNode: IXMLNode): TIcon;
    function HasSubMenuItemNode(XMLNode: IXMLNode; NodeName: string): Boolean;
    procedure AddMenuItemToList(dxSubItem: TdxBarSubItem; AvailableTime: string); overload;
    procedure AddMenuItemToList(dxItem: TdxBarButton; AvailableTime: string); overload;
  protected
    procedure SetupAddInInfo(XMLNode: IXMLNode; Path: String); virtual;
    procedure SetupAuxiliaryData;//(XMLNode: IXMLNode; Path: String);
    { Properties Get/Set Methods }
    procedure SetIsActive(Value: Boolean); virtual;
    { Event Handler }
    procedure MenuItemClickedHandler(Sender: TObject); virtual;
    procedure HelpMenuItemClickedHandler(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadXMLValues(XMLNode: IXMLNode; Path: String); virtual;
    procedure SetupMenus; virtual;
    { properties }
    property AddInName: string read FAddInName;
    property DisplayName: string read FDisplayName;
    property Company: string read FCompany;
    property Copyright: string read FCopyright;
    property Version: string read FVersion;
    property COMSvrName: string read FCOMObjName;
    property InstalledDir: string read FInstalledDir;
    property IsActive: Boolean read FIsActive write SetIsActive;
    property Icon: TIcon read FIcon;
    property OnMessage: PAddInRelMsgOccuredEvent write FOnMessage;
  end;

  // PStarUMLAddIn
  PStarUMLAddIn = class(PAddIn)
  private
    FStarUMLAddIn: IStarUMLAddIn; // COM Object which implements IStarUMLAddIn Interface
    procedure SetupCOMObject(ActiveFlag: Boolean);
  protected
    procedure SetupAddInInfo(XMLNode: IXMLNode; Path: String); override;
    { Properties Get/Set Methods }
    procedure SetIsActive(Value: Boolean); override;
    { Event Handler }
    procedure MenuItemClickedHandler(Sender: TObject); override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadXMLValues(XMLNode: IXMLNode; Path: String); override;
    property COMInterface: IStarUMLAddIn read FStarUMLAddIn;
  end;

  // PFrameWindowAddIn
  PFrameWindowAddIn = class(PAddIn)
  private
    FFrameWindowAddIn: IUnknown;                 // COM Object
    FFrameWindowParent: PAddInFrameWindowParent; // Add-In Frame Window's Parent Window
    FTab: TTabSheet;
    FTabImageIndex: Integer;
    procedure SetupFrameWindow(ActiveFlag: Boolean);
  protected
    procedure SetupAddInInfo(XMLNode: IXMLNode; Path: String); override;
    { Properties Get/Set Methods }
    procedure SetIsActive(Value: Boolean); override;
    { Event Handler }
    procedure MenuItemClickedHandler(Sender: TObject); override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadXMLValues(XMLNode: IXMLNode; Path: String); override;
    procedure SetupMenus; override;
  end;

  // PAddInManager
  PAddInManager = class
  private
    FAddIns: TList;
    FOnMessage: PAddInRelMsgOccuredEvent;
    procedure MessageProc(str: string); overload;
    procedure MessageProc(str: string; const arr: array of const); overload;
    { properties get/set methods }
    function GetAddIn(Index: Integer): PAddIn;
    function GetAddInsCount: Integer;
  private
    procedure SetupAddIns;
    procedure SetupMenus;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadAddIns;
    function FindAddIn(COMObjectName: string): PAddIn;
    { properties }
    property AddInsCount: Integer read GetAddInsCount;
    property AddIn[Index: Integer]: PAddIn read GetAddIn;
    property OnMessage: PAddInRelMsgOccuredEvent write FOnMessage;
  end;

const
  { Registry-related: Prefix 'VN' means Registry Value Name }
  //ROOTKEY: HKEY = HKEY_LOCAL_MACHINE;
  ROOTKEY: HKEY = HKEY_CURRENT_USER;
  //ADDINSKEY: string = '\SOFTWARE\StarUML\AddIns';
  ADDINSKEY: string = RK_BASE_LOCATION + 'AddIns';
  VN_ADDINNAME: string = 'AddInName';
  VN_DISPLAYNAME: string = 'DisplayName';
  VN_COMPANY: string = 'Company';
  VN_COPYRIGHT: string = 'Copyright';
  VN_VERSION: string = 'Version';
  VN_ISACTIVE: string = 'IsActive';
  VN_COMOBJ: string = 'COMObj';
  VN_INSTALLED_DIR: string = 'InstalledDir';
  VN_MENUFILE: string = 'MenuFile';
  VN_HELPFILE: string = 'HelpFile';
  VN_ICONFILE: string = 'IconFile';
  VN_FRAME_WINDOW: string = 'IsFrameWindow';
  VN_FRAME_PARENT: string = 'FrameWindowPlace';
  { Menu File-related: Prefix 'XE' means XML Element, 'XA' means XML Attribute }
  XE_ROOT: string = 'ADDINMENU';
  XE_BODY: string = 'BODY';
  XE_MAINMENU: string = 'MAINMENU';
  XE_POPUPMENU: string = 'POPUPMENU';
  XE_MAINITEM: string = 'MAINITEM';
  XE_POPUPITEM: string = 'POPUPITEM';
  XA_BASE: string = 'base';
  XA_LOCATION: string = 'location';
  XA_CAPTION: string = 'caption';
  XA_INDEX: string = 'index';
  XA_BEGIN_GROUP: string = 'beginGroup';
  XA_SCRIPT: string = 'script';
  XA_ACTIONID: string = 'actionId';
  XA_AVAILABLE_WHEN: string = 'availableWhen';
  XA_ICON_FILE: string = 'iconFile';
  { Main Menu SubItem-related: Prefix 'TN' means TdxBarSubItem Name }
  TN_FILE: string = 'FILE';
  TN_EDIT: string = 'EDIT';
  TN_FORMAT: string = 'FORMAT';
  TN_MODEL: string = 'MODEL';
  TN_VIEW: string = 'VIEW';
  TN_TOOLS: string = 'TOOLS';
  TN_HELP: string = 'HELP';
  TN_UNITS: string = 'UNITS';
  TN_IMPORT: string = 'IMPORT';
  TN_EXPORT: string = 'EXPORT';
  TN_EXPORT_DIAGRAM: string = 'EXPORT_DIAGRAM';
  TN_NEW_TOP: string = 'NEW_TOP';
  { Menu Item Available Time-related}
  AT_ALWAYS: string = 'ALWAYS';
  AT_PROJECT_OPENED: string = 'PROJECT_OPENED';
  AT_MODEL_SELECTED: string = 'MODEL_SELECTED';
  AT_VIEW_SELECTED: string = 'VIEW_SELECTED';
  AT_UNIT_SELECTED: string = 'UNIT_SELECTED';
  AT_DIAGRAM_ACTIVATED: string = 'DIAGRAM_ACTIVATED';
  { Popup Menu Item Location-related }
  PL_EXPLORER: string = 'EXPLORER';
  PL_DIAGRAM: string = 'DIAGRAM';
  PL_BOTH: string = 'BOTH';

var
  AddInManager: PAddInManager;

implementation

uses
  System.UITypes, Dialogs, Variants, xmldom, Forms, ShellAPI, OleCtnrs, Controls, ExtCtrls,
  System.Win.ComObj, MainFrm, HtmlHlp, NLS_StarUML;

////////////////////////////////////////////////////////////////////////////////

function ReadChildStringValue(Node: IXMLNode; Key: string; DefaultValue: string = ''): string;
begin
  if VarIsStr(Node.ChildValues[Key]) then
    Result := Node.ChildValues[Key]
  else
    Result := DefaultValue;
end;

////////////////////////////////////////////////////////////////////////////////
// PAddIn

constructor PAddIn.Create;
begin
  inherited;
  FIcon := nil;
  FMenusList := TList.Create;
  FMenuItemIconList := TList.Create;
  FModulePath := TStringList.Create;
end;

destructor PAddIn.Destroy;
    procedure SaveToRegistry;
    var
      Reg: TRegistry;
      RegKey: string;
    begin
      Reg := TRegistry.Create;
      try
        Reg.RootKey := ROOTKEY;
        RegKey := ADDINSKEY + '\' + FRegKey;
        if Reg.OpenKey(RegKey, True) then begin
          if FIsActive then Reg.WriteString(VN_ISACTIVE, 'True')
          else Reg.WriteString(VN_ISACTIVE, 'False');
        end;
      finally
        Reg.CloseKey;
        Reg.Free;
      end;
    end;
    procedure ClearMenusList;
    var
      I: Integer;
      Obj: TObject;
    begin
      for I := FMenusList.Count - 1 downto 0 do begin
        Obj := FMenusList.Items[I];
        Obj.Free;
      end;
    end;
    procedure ClearMenuItemIconList;
    var
      I: Integer;
      AIcon: TIcon;
    begin
      for I := FMenuItemIconList.Count - 1 downto 0 do begin
        AIcon := FMenuItemIconList.Items[I];
        AIcon.Free;
      end;
    end;
begin
  if Assigned(FIcon) then FIcon.Free;
(*
  SaveToRegistry;
*)  
  ClearMenusList;
  FMenusList.Free;
  ClearMenuItemIconList;
  FMenuItemIconList.Free;
  FModulePath.Free;
  inherited;
end;

procedure PAddIn.SetupMainMenus(XMLNode: IXMLNode);
var
  MainMenu: TdxBar;
  XMLNodeList: IXMLNodeList;
  dxSubItem: TdxBarSubItem;
  I: Integer;
  Base, Msg: string;
begin
  MainMenu := MainForm.BarManager.Bars[MENU_BAR];
  XMLNodeList := XMLNode.ChildNodes;
  for I := 0 to XMLNodeList.Count - 1 do begin
    XMLNode := XMLNodeList.Nodes[I];
    if XMLNode.NodeName = XE_MAINITEM then begin
      Base := GetBase(XMLNode);
      // when to create a new top menu item
      if UpperCase(Base) = TN_NEW_TOP then begin
        if HasSubMenuItemNode(XMLNode, XE_MAINITEM) then begin
          SetupTopLevelMainMenuItem(MainMenu, XMLNode);
        end else begin
          Msg := Format(ERR_ADDIN_MENUFILE_INVALID, [FMenuFileName]);
          raise EAddInMenuFileInvalidException.Create(Msg);
        end;
      // when to add a menu item at existing top menu item
      end else begin
        dxSubItem := GetExistingBase(Base);
        SetupSubMenuItem(XMLNode, dxSubItem);
      end;
    end;
  end;
end;

procedure PAddIn.SetupPopupMenus(XMLNode: IXMLNode);
var
  XMLNodeList: IXMLNodeList;
  Location: string;
  I: Integer;
begin
  XMLNodeList := XMLNode.ChildNodes;
  for I := 0 to XMLNodeList.Count - 1 do begin
    XMLNode := XMLNodeList.Nodes[I];
    if XMLNode.NodeName = XE_POPUPITEM then begin
      Location := GetLocation(XMLNode);
      if (Location = PL_EXPLORER) or (Location = PL_BOTH) then
        SetupTopLevelPopupMenuItem(MainForm.ModelExplorerPopupMenu, XMLNode);
    end;
  end;
  for I := 0 to XMLNodeList.Count - 1 do begin
    XMLNode := XMLNodeList.Nodes[I];
    if XMLNode.NodeName = XE_POPUPITEM then begin
      Location := GetLocation(XMLNode);
      if (Location = PL_DIAGRAM) or (Location = PL_BOTH) then
        SetupTopLevelPopupMenuItem(MainForm.DiagramEditorPopupMenu, XMLNode);
    end;
  end;
end;

procedure PAddIn.SetupTopLevelMainMenuItem(MainMenu: TdxBar; XMLNode: IXMLNode);
var
  MICaption: string;
  MIIndex: Integer;
  MITag: Integer;
  MIScript: string;
  MIAvailableTime: string;
  MIIcon: TIcon;
  ImageIdx: Integer;
  dxSubItem: TdxBarSubItem;
  dxLink: TdxBarItemLink;
  XMLNodeList: IXMLNodeList;
  XMLSubNode: IXMLNode;
  Msg: string;
  I: Integer;
begin
  // gathering data for menu file
  MICaption := GetCaption(XMLNode);
  if MICaption = '-' then begin
    Msg := Format(ERR_ADDIN_MENUFILE_INVALID, [FMenuFileName]);
    raise EAddInMenuFileInvalidException.Create(Msg);
  end;
  MITag := GetItemID(XMLNode);
  if MITag = -1 then begin
    Msg := Format(ERR_ADDIN_MENUFILE_INVALID, [FMenuFileName]);
    raise EAddInMenuFileInvalidException.Create(Msg);
  end;
  MIIndex := GetItemIndex(XMLNode);
  MIScript := GetScript(XMLNode);
  MIAvailableTime := GetAvailableTime(XMLNode);
  MIIcon := GetItemIcon(XMLNode);
  if Assigned(MIIcon) then begin
    ImageIdx := MainForm.TotalImageList.AddIcon(MIIcon);
    FMenuItemIconList.Add(MIIcon);
  end else ImageIdx := -1;
  // create TdxBarSubItem Type Menu Item and assign the data to menu item
  dxSubItem := TdxBarSubItem.Create(MainMenu.BarManager);
  dxSubItem.Caption := MICaption;
  dxSubItem.Tag := MITag;
  dxSubItem.Enabled := False;
  dxSubItem.OnClick := MenuItemClickedHandler;
  if MIScript <> '' then dxSubItem.Description := MIScript;
  if ImageIdx >= 0 then dxSubItem.ImageIndex := ImageIdx;
  AddMenuItemToList(dxSubItem, MIAvailableTime);
  dxLink := MainMenu.ItemLinks.Add;
  if (MIIndex >= 0) and (MIIndex <= MainMenu.ItemLinks.Count - 1) then
    dxLink.Index := MIIndex;
  dxLink.Item := dxSubItem;
  MainMenu.ItemLinks.Items[dxLink.Index].CreateControl;
  // create a sub menu item (assure than it has a MENUITEM Node)
  XMLNodeList := XMLNode.ChildNodes;
  try
    for I := 0 to XMLNodeList.Count - 1 do begin
      XMLSubNode := XMLNodeList.Nodes[I];
      if XMLSubNode.NodeName = XE_MAINITEM then
        SetupSubMenuItem(XMLSubNode, dxSubItem);
    end;
    if dxSubItem.ItemLinks.Count <= 0 then raise EAddInMenuFileInvalidException.Create('');
  except on E: EAddInMenuFileInvalidException do
    begin
      dxLink.Free;
      dxSubItem.Free;
      Msg := Format(ERR_ADDIN_MENUFILE_INVALID, [FMenuFileName]);
      raise EAddInMenuFileInvalidException.Create(Msg);
    end;
  end;
end;

procedure PAddIn.SetupTopLevelPopupMenuItem(PopupMenu: TdxBarPopupMenu; XMLNode: IXMLNode);
var
  XMLNodeList: IXMLNodeList;
  XMLSubNode: IXMLNode;
  I: Integer;
  MICaption: string;
  MIIndex: Integer;
  MIScript: string;
  MITag: Integer;
  MIAvailableTime: string;
  MIBeginGroup: Boolean;
  MIIcon: TIcon;
  ImageIdx: Integer;
  dxSubItem: TdxBarSubItem;
  dxItem: TdxBarButton;
  dxLink: TdxBarItemLink;
  Msg: string;
begin
  // gathering data for menu file
  MICaption := GetCaption(XMLNode);
  MITag := GetItemID(XMLNode);
  if MITag = -1 then begin
    Msg := Format(ERR_ADDIN_MENUFILE_INVALID, [FMenuFileName]);
    raise EAddInMenuFileInvalidException.Create(Msg);
  end;
  MIScript := GetScript(XMLNode);
  MIAvailableTime := GetAvailableTime(XMLNode);
  MIIndex := GetItemIndex(XMLNode);
  MIBeginGroup := GetBeginGroup(XMLNode);
  MIIcon := GetItemIcon(XMLNode);
  if Assigned(MIIcon) then begin
    ImageIdx := MainForm.TotalImageList.AddIcon(MIIcon);
    FMenuItemIconList.Add(MIIcon);
  end else ImageIdx := -1;
  // create menu item
  // (when to have no menuitem)
  if not HasSubMenuItemNode(XMLNode, XE_POPUPITEM) then begin
    dxItem := TdxBarButton.Create(PopupMenu.BarManager);
    dxItem.Caption := MICaption;
    if MIScript <> '' then dxItem.Description := MIScript;
    dxItem.Tag := MITag;
    dxItem.Enabled := False;
    dxItem.OnClick := MenuItemClickedHandler;
    if ImageIdx >= 0 then dxItem.ImageIndex := ImageIdx;
    AddMenuItemToList(dxItem, MIAvailableTime);
    dxLink := PopupMenu.ItemLinks.Add;
    if (MIIndex >= 0) and (MIIndex <= PopupMenu.ItemLinks.Count - 1) then
      dxLink.Index := MIIndex;
    dxLink.Item := dxItem;
    if MIBeginGroup then dxLink.BeginGroup := True;
  // (when to have menuitem)
  end else begin
    dxSubItem := TdxBarSubItem.Create(PopupMenu.BarManager);
    dxSubItem.Caption := MICaption;
    if MIScript <> '' then dxSubItem.Description := MIScript;
    dxSubItem.Tag := MITag;
    dxSubItem.Enabled := False;
    dxSubItem.OnClick := MenuItemClickedHandler;
    if ImageIdx >= 0 then dxSubItem.ImageIndex := ImageIdx;
    AddMenuItemToList(dxSubItem, MIAvailableTime);
    dxLink := PopupMenu.ItemLinks.Add;
    if (MIIndex >= 0) and (MIIndex <= PopupMenu.ItemLinks.Count - 1) then
      dxLink.Index := MIIndex;
    dxLink.Item := dxSubItem;
    if MIBeginGroup then dxLink.BeginGroup := True;
    // Recursion: assure to exist sub MenuItem Node
    XMLNodeList := XMLNode.ChildNodes;
    try
      for I := 0 to XMLNodeList.Count - 1 do begin
        XMLSubNode := XMLNodeList.Nodes[I];
        if XMLSubNode.NodeName = XE_POPUPITEM then begin
          SetupSubMenuItem(XMLSubNode, dxSubItem);
        end;
      end;
      if dxSubItem.ItemLinks.Count <= 0 then Raise EAddInMenuFileInvalidException.Create('');
    except on E: EAddInMenuFileInvalidException do
      begin
        dxLink.Free;
        dxSubItem.Free;
        Msg := Format(ERR_ADDIN_MENUFILE_INVALID, [FMenuFileName]);
        raise EAddInMenuFileInvalidException.Create(Msg);
      end;
    end;
  end;
end;

procedure PAddIn.SetupSubMenuItem(XMLNode: IXMLNode; ParentItem: TdxBarSubItem);
var
  MICaption: string;
  MITag: Integer;
  MIScript: string;
  MIAvailableTime: string;
  MIIndex: Integer;
  MIBeginGroup: Boolean;
  MIIcon: TIcon;
  ImageIdx: Integer;
  dxSubItem: TdxBarSubItem;
  dxItem: TdxBarButton;
  dxLink: TdxBarItemLink;
  XMLNodeList: IXMLNodeList;
  XMLSubNode: IXMLNode;
  Msg: string;
  I: Integer;
begin
  // gather data for File Menu
  MICaption := GetCaption(XMLNode);
  MITag := GetItemID(XMLNode);
  if MITag = -1 then begin
    Msg := Format(ERR_ADDIN_MENUFILE_INVALID, [FMenuFileName]);
    raise EAddInMenuFileInvalidException.Create(Msg);
  end;
  MIScript := GetScript(XMLNode);
  MIAvailableTime := GetAvailableTime(XMLNode);
  MIIndex := GetItemIndex(XMLNode);
  MIBeginGroup := GetBeginGroup(XMLNode);
  MIIcon := GetItemIcon(XMLNode);
  if Assigned(MIIcon) then begin
    ImageIdx := MainForm.TotalImageList.AddIcon(MIIcon);
    FMenuItemIconList.Add(MIIcon);
  end else ImageIdx := -1;
  // create Menu item
  // (when to have no sub menu item)
  if not HasSubMenuItemNode(XMLNode, XE_MAINITEM) then begin
    dxItem := TdxBarButton.Create(ParentItem.BarManager);
    dxItem.Caption := MICaption;
    if MIScript <> '' then dxItem.Description := MIScript;
    dxItem.Tag := MITag;
    dxItem.Enabled := False;
    dxItem.OnClick := MenuItemClickedHandler;
    if ImageIdx >= 0 then dxItem.ImageIndex := ImageIdx;
    AddMenuItemToList(dxItem, MIAvailableTime);
    dxLink := ParentItem.ItemLinks.Add;
    if (MIIndex >= 0) and (MIIndex <= ParentItem.ItemLinks.Count - 1) then
      dxLink.Index := MIIndex;
    dxLink.Item := dxItem;
    if MIBeginGroup then dxLink.BeginGroup := True;
    // (when to hava sub menu item)
  end else begin
    dxSubItem := TdxBarSubItem.Create(ParentItem.BarManager);
    dxSubItem.Caption := MICaption;
    if MIScript <> '' then dxSubItem.Description := MIScript;
    dxSubItem.OnClick := MenuItemClickedHandler;
    AddMenuItemToList(dxSubItem, MIAvailableTime);
    dxSubItem.Tag := MITag;
    dxSubItem.Enabled := False;
    dxLink := ParentItem.ItemLinks.Add;
    if (MIIndex >= 0) and (MIIndex <= ParentItem.ItemLinks.Count - 1) then
      dxLink.Index := MIIndex;
    dxLink.Item := dxSubItem;
    if MIBeginGroup then dxLink.BeginGroup := True;
    if ImageIdx >= 0 then dxSubItem.ImageIndex := ImageIdx;
    // (Recursion: assure to exist sub MenuItem Node)
    XMLNodeList := XMLNode.ChildNodes;
    try
      for I := 0 to XMLNodeList.Count - 1 do begin
        XMLSubNode := XMLNodeList.Nodes[I];
        if XMLSubNode.NodeName = XE_MAINITEM then
          SetupSubMenuItem(XMLSubNode, dxSubItem);
      end;
      if dxSubItem.ItemLinks.Count <= 0 then Raise EAddInMenuFileInvalidException.Create('');
    except on E: EAddInMenuFileInvalidException do
      begin
        dxLink.Free;
        dxSubItem.Free;
        Msg := Format(ERR_ADDIN_MENUFILE_INVALID, [FMenuFileName]);
        raise EAddInMenuFileInvalidException.Create(Msg);
      end;
    end;
  end;
end;

procedure PAddIn.SetupHelpMenu;
var
  dxItem: TdxBarButton;
  dxLink: TdxBarItemLink;
  Idx: Integer;
begin
  if FHelpFileName <> '' then begin
    dxLink := MainForm.HelpMenu.ItemLinks.Add;
    dxItem := TdxBarButton.Create(MainForm.BarManager);
    try
      dxItem.Caption := Format(TXT_ADDIN_HELPFILE_DISPLAYNAME, [FDisplayName]);
      dxItem.Enabled := False;
      dxItem.OnClick := HelpMenuItemClickedHandler;
      dxItem.ImageIndex := 143;
      //Idx := MainForm.HelpMenu.ItemLinks.IndexOf(MainForm.HelpStarUMLOnTheWeb.Links[0]);
      Idx := MainForm.HelpMenu.ItemLinks.IndexOf(MainForm.HelpAbout.Links[0]);
      dxLink.Index := Idx;
      dxLink.Item := dxItem;
      AddMenuItemToList(dxItem, AT_AlWAYS);
    except
      begin
        if FMenusList.IndexOf(dxItem) >= 0 then FMenusList.Remove(dxItem);
        if Assigned(dxLink) then dxLink.Free;
        if Assigned(dxItem) then dxItem.Free;
      end;
    end;
  end;
end;

procedure PAddIn.SetAllMenuItemsVisibility(IsVisible: Boolean);
    function BooleanToTdxVisible(Value: Boolean): TdxBarItemVisible;
    begin
      if Value = True then Result := ivAlways
      else Result := ivNever;
    end;
var
  I: Integer;
  Obj: TObject;
begin
  for I := 0 to FMenusList.Count - 1 do begin
    Obj := FMenusList.Items[I];
    if Obj is TdxBarSubItem then (Obj as TdxBarSubItem).Visible := BooleanToTdxVisible(IsVisible)
    else if Obj is TdxBarButton then (Obj as TdxBarButton).Visible := BooleanToTdxVisible(IsVisible);
  end;
end;

function PAddIn.GetRegValue(Reg: TRegistry; RegValues: TStringList; Str: string): string;
begin
  Result := '';
  if RegValues.IndexOf(Str) >= 0 then begin
    try Result := Reg.ReadString(Str);
    except on Exception do end;
  end;
end;

function PAddIn.GetBase(XMLNode: IXMLNode): string;
begin
  if XMLNode.HasAttribute(XA_BASE) then
    Result := XMLNode.Attributes[XA_BASE]
  else Result := TN_TOOLS;
end;

function PAddIn.GetExistingBase(Base: string): TdxBarSubItem;
begin
  if Base = TN_FILE then Result := MainForm.FileMenu
  else if Base = TN_EDIT then Result := MainForm.EditMenu
  else if Base = TN_FORMAT then Result := MainForm.FormatMenux
  else if Base = TN_MODEL then Result := MainForm.ModelMenu
  else if Base = TN_VIEW then Result := MainForm.ViewMenu
  else if Base = TN_TOOLS then Result := MainForm.ToolsMenu
  else if Base = TN_HELP then Result := MainForm.HelpMenu
  else if Base = TN_UNITS then Result := MainForm.FileUnits
  else if Base = TN_IMPORT then Result := MainForm.FileImport
  else if Base = TN_EXPORT then Result := MainForm.FileExport
  else Result := MainForm.ToolsMenu;
end;

function PAddIn.GetCaption(XMLNode: IXMLNode): string;
var
  Msg: string;
begin
  Result := '';
  try
    Result := XMLNode.Attributes[XA_CAPTION];
  except on EVariantTypeCastError do
    begin
      Msg := Format(ERR_ADDIN_MENUFILE_INVALID, [FMenuFileName]);
      raise EAddInMenuFileInvalidException.Create(Msg);
    end;
  end;
end;

function PAddIn.GetScript(XMLNode: IXMLNode): string;
begin
  if XMLNode.HasAttribute(XA_SCRIPT) then
    Result := XMLNode.Attributes[XA_SCRIPT]
  else Result := '';
end;

function PAddIn.GetItemID(XMLNode: IXMLNode): Integer;
var
  Str: string;
  T: Integer;
begin
  if XMLNode.HasAttribute(XA_ACTIONID) then begin
    try
      Str := XMLNode.Attributes[XA_ACTIONID];
      T := StrToInt(Str);
      Result := T;
    except
      on EVariantTypeCastError do Result := 0;
      on EConvertError do Result := -1;
    end;
  end else Result := 0;
end;

function PAddIn.GetItemIndex(XMLNode: IXMLNode): Integer;
var
  Str: string;
  T: Integer;
begin
  if XMLNode.HasAttribute(XA_INDEX) then begin
    try
      Str := XMLNode.Attributes[XA_INDEX];
      T := StrToInt(Str);
      Result := T;
    except on Exception do Result := -1;
    end;
  end else Result := -1;
end;

function PAddIn.GetAvailableTime(XMLNode: IXMLNode): string;
begin
  if XMLNode.HasAttribute(XA_AVAILABLE_WHEN) then
    Result := XMLNode.Attributes[XA_AVAILABLE_WHEN]
  else Result := AT_PROJECT_OPENED;
end;

function PAddIn.GetLocation(XMLNode: IXMLNode): string;
begin
  if XMLNode.HasAttribute(XA_LOCATION) then
    Result := XMLNode.Attributes[XA_LOCATION]
  else Result := PL_BOTH;
end;

function PAddIn.GetBeginGroup(XMLNode: IXMLNode): Boolean;
var
  Str: string;
begin
  Result := False;
  if XMLNode.HasAttribute(XA_BEGIN_GROUP) then begin
    try
      Str := XMLNode.Attributes[XA_BEGIN_GROUP];
      Str := LowerCase(Trim(Str));
      if (Str = 'true') or (Str = 'yes') then Result := True;
    except on Exception do
    end;
  end;
end;

function PAddIn.GetItemIcon(XMLNode: IXMLNode): TIcon;
var
  Str, Ext: string;
  AIcon: TIcon;
  ABitmap: TBitmap;
  ImgList: TImageList;
  Idx: Integer;
begin
  Result := nil;
  if XMLNode.HasAttribute(XA_ICON_FILE) then begin
    AIcon := TIcon.Create;
    try
      Str := XMLNode.Attributes[XA_ICON_FILE];
      if Str <> '' then begin
        Ext := LowerCase(ExtractFileExt(Str));
        if Ext = '.ico' then begin
          AIcon.LoadFromFile(FInstalledDir + '\' + Str);
          Result := AIcon;
        end else if Ext = '.bmp' then begin
          ABitmap := TBitmap.Create;
          ImgList := TImageList.Create(nil);
          try
            ABitmap.LoadFromFile(FInstalledDir + '\' + Str);
            Idx := ImgList.Add(ABitmap, nil);
            if Idx >= 0 then begin
              ImgList.GetIcon(Idx, AIcon);
              Result := AIcon;
            end;
          finally
            ABitmap.Free;
            ImgList.Free;
          end;
        end else Raise Exception.Create('');
      end;
    except on Exception do
      begin
        AIcon.Free;
        Result := nil;
      end;
    end;
  end;
end;

function PAddIn.HasSubMenuItemNode(XMLNode: IXMLNode; NodeName: string): Boolean;
var
  XMLNodeList: IXMLNodeList;
  I: Integer;
begin
  Result := False;
  XMLNodeList := XMLNode.ChildNodes;
  for I := 0 to XMLNodeList.Count - 1 do begin
    XMLNode := XMLNodeList.Nodes[I];
    if XMLNode.NodeName = NodeName then begin
      Result := True;
      Break;
    end;
  end;
end;

procedure PAddIn.AddMenuItemToList(dxSubItem: TdxBarSubItem; AvailableTime: string);
begin
  FMenusList.Add(dxSubItem);
  if AvailableTime = AT_ALWAYS then begin
    dxSubItem.Enabled := True;
    MainForm.AlwaysGroup.Add(dxSubItem);
  end
  else if AvailableTime = AT_PROJECT_OPENED then MainForm.ProjectOpenedGroup.Add(dxSubItem)
  else if AvailableTime = AT_MODEL_SELECTED then MainForm.ModelSelectedGroup.Add(dxSubItem)
  else if AvailableTime = AT_VIEW_SELECTED then MainForm.ViewSelectedGroup.Add(dxSubItem)
  else if AvailableTime = AT_UNIT_SELECTED then MainForm.UnitSelectedGroup.Add(dxSubItem)
  else if AvailableTime = AT_DIAGRAM_ACTIVATED then MainForm.DiagramActivatedGroup.Add(dxSubItem);
end;

procedure PAddIn.AddMenuItemToList(dxItem: TdxBarButton; AvailableTime: string);
begin
  FMenusList.Add(dxItem);
  if AvailableTime = AT_ALWAYS then begin
    dxItem.Enabled := True;
    MainForm.AlwaysGroup.Add(dxItem);
  end
  else if AvailableTime = AT_PROJECT_OPENED then MainForm.ProjectOpenedGroup.Add(dxItem)
  else if AvailableTime = AT_MODEL_SELECTED then MainForm.ModelSelectedGroup.Add(dxItem)
  else if AvailableTime = AT_VIEW_SELECTED then MainForm.ViewSelectedGroup.Add(dxItem)
  else if AvailableTime = AT_UNIT_SELECTED then MainForm.UnitSelectedGroup.Add(dxItem)
  else if AvailableTime = AT_DIAGRAM_ACTIVATED then MainForm.DiagramActivatedGroup.Add(dxItem);
end;

procedure PAddIn.SetupAddInInfo(XMLNode: IXMLNode; Path: String);
var
  I: Integer;
  RootNode: IXMLNode;
begin
  FAddInName := ReadChildStringValue(XMLNode, 'NAME', '');
  FRegKey := FAddInName;
  FDisplayName := ReadChildStringValue(XMLNode, 'DISPLAYNAME', '');
  FCompany := ReadChildStringValue(XMLNode, 'COMPANY', '');
  FCopyright := ReadChildStringValue(XMLNode, 'COPYRIGHT', '');
  FVersion := ReadChildStringValue(XMLNode, 'VERSION', '');
  FHelpFileName := ReadChildStringValue(XMLNode, 'HELPFILE', '');
  FIconFileName := ReadChildStringValue(XMLNode, 'ICONFILE', '');
  FCOMObjName := ReadChildStringValue(XMLNode, 'COMOBJ', '');
  FFilename := ReadChildStringValue(XMLNode, 'FILENAME', '');

  RootNode := XMLNode.ChildNodes.FindNode('MODULES');
  if RootNode <> nil then
    for I := 0 to RootNode.ChildNodes.Count-1 do
      FModulePath.Add(RootNode.ChildNodes.Nodes[I].Text);

  FIsActive := LowerCase(ReadChildStringValue(XMLNode, 'ISACTIVE', 'True')) = 'true';
end;

procedure PAddIn.SetupAuxiliaryData;
var
  Ext: string;
  ABitmap: TBitmap;
  ImgList: TImageList;
  Idx: Integer;
begin
  // Icon
  if FIconFileName <> '' then begin
    try
      Ext := LowerCase(ExtractFileExt(FIconFileName));
      if Ext = '.ico' then begin
        FIcon := TIcon.Create;
        FIcon.LoadFromFile(FInstalledDir + '\' + FIconFileName);
      end else if Ext = '.bmp' then begin
        ABitmap := TBitmap.Create;
        ImgList := TImageList.Create(nil);
        try
          ABitmap.LoadFromFile(FInstalledDir + '\' + FIconFileName);
          Idx := ImgList.Add(ABitmap, nil);
          if Idx >= 0 then begin
            FIcon := TIcon.Create;
            ImgList.GetIcon(Idx, FIcon);
          end;
        finally
          ABitmap.Free;
          ImgList.Free;
        end;
      end else Raise Exception.Create('');
    except on Exception do
      begin
        //Msg := Format(ERR_ICONFILE_NOT_FOUND, [FIconFileName]);
        //if Assigned(FOnMessage) then FOnMessage(Msg);
        if Assigned(FIcon) then FIcon.Free;
        FIcon := nil;
      end;
    end;
  end;
end;

procedure PAddIn.SetIsActive(Value: Boolean);
var
  Msg: string;
begin
  if FIsActive <> Value then begin
    try
      FIsActive := Value;
      MainForm.BarManager.LockUpdate := True;
      SetAllMenuItemsVisibility(FIsActive);
      MainForm.BarManager.LockUpdate := False;
      if Assigned(FOnMessage) then begin
        if FIsActive then begin
          Msg := Format(MSG_ADDIN_ACTIVATED, [FAddInName]);
          FOnMessage(Msg);
        end else begin
          Msg := Format(MSG_ADDIN_DEACTIVATED, [FAddInName]);
          FOnMessage(Msg);
        end;
      end;
    except on E: Exception do
      begin
        Msg := Format(ERR_ADDIN_MENU_CONFIG_FAILED, [FAddInName, E.Message]);
        if Assigned(FOnMessage) then FOnMessage(Msg);
      end;
    end;
  end;
end;

procedure PAddIn.MenuItemClickedHandler(Sender: TObject);
const
  // Values returned by ShellExecute up to 32 are error codes
  ShellExecuteErrorTreshold = 32;
var
  dxItem: TdxBarItem;
  script: string;
  shellExecuteStatus: Cardinal;
begin
    dxItem := Sender as TdxBarItem;
    if dxItem <> nil then begin
      script := dxItem.Description;
      if script <> '' then begin
        shellExecuteStatus := ShellExecute(0, 'open', pchar(script), '', pchar(FInstalledDir), SW_SHOWNORMAL);
        if (shellExecuteStatus <= ShellExecuteErrorTreshold) and Assigned(FOnMessage) then
          FOnMessage(Format(ERR_ADDIN_SCRIPT_EXECUTION, [script]));
      end;
    end
    else
      Assert(False, 'Type of sender object was not recoginized!');

end;

procedure PAddIn.HelpMenuItemClickedHandler(Sender: TObject);
begin
  if FHelpFileName <> '' then begin
    ShowHtmlHelp(FHelpFileName);
  end;

  // Later on, must support all help file types.
  // Refer following code.
{
  if FHelpFileName <> '' then begin
    FileExt := LowerCase(ExtractFileExt(FHelpFileName));
    FileFullName := FInstalledDir + '\' + FHelpFileName;
    if Not FileExists(FileFullName) then begin
      MessageDlg(Format(ERR_FILE_NOT_FOUND, [FHelpFileName]), mtError, [mbOK], 0);
      Exit;
    end;
    if FileExt = '.chm' then begin
      ShowHelpContents(FileFullName);
    end else if FileExt = '.hlp' then begin
      OldHelpFileName := Application.HelpFile;
      try
        Application.HelpFile := FileFullName;
        Application.HelpCommand(HELP_FINDER, 0);
      finally
        Application.HelpFile := OldHelpFileName;
      end;
    end else if (FileExt = '.htm') or (FileExt = '.html') then begin
      if ShellExecute(0, 'open', pchar(FHelpFileName), '', pchar(FInstalledDir), SW_SHOWNORMAL) <= 32 then
        MessageDlg(Format(ERR_ADDIN_HELPFILE_CANNOT_OPEN, [FHelpFileName]), mtError, [mbOK], 0);
    end else begin
      MessageDlg(Format(ERR_ADDIN_HELPFILE_INVALID, [FHelpFileName]), mtError, [mbOK], 0);
    end;
  end;
}
end;

procedure PAddIn.LoadXMLValues(XMLNode: IXMLNode; Path: String);
(*
var
  Reg: TRegistry;
  RegKey: string;
  RegValues: TStringList;
begin
  FRegKey := Key;
  FAddInName := Key;
  RegValues := TStringList.Create;
  RegValues.Clear;
  Reg := TRegistry.Create;
  Reg.RootKey := ROOTKEY;
  RegKey := ADDINSKEY + '\' + Key;
  try
    try
      if Reg.OpenKey(RegKey, True) then begin
        Reg.GetValueNames(RegValues);
        SetupAddInInfo(Reg, RegValues);
        SetupAuxiliaryData;
      end else
        raise EAddInLoadingValuesException.Create(ERR_ADDIN_ITEM_REGKEY);
    finally
      Reg.CloseKey;
    end;
  finally
    begin
      Reg.Free;
      RegValues.Free;
    end;
  end;
end;
*)
begin
  SetupAddInInfo(XMLNode, Path);
  SetupAuxiliaryData;//(XMLNode, Path);
end;

procedure PAddIn.SetupMenus;
    function GetMenuFile: TXMLDocument;
    var
      XMLDoc: TXMLDocument;
      FilePath: string;
      Msg: string;
    begin
      Result := nil;
      FilePath := FInstalledDir + '\' + FMenuFileName;
      XMLDoc := TXMLDocument.Create(Application);
      try
        XMLDoc.LoadFromFile(FilePath);
        Result := XMLDoc;
      except on EDOMParseError do
        begin
          XMLDoc.Free;
          Msg := Format(ERR_ADDIN_MENUFILE_NOT_EXIST, [FilePath]);
          raise EAddInMenuFileInvalidException.Create(Msg);
        end;
      end;
    end;
var
  XMLDoc: TXMLDocument;
  XMLNode, XMLSubNode: IXMLNode;
  Msg: string;
begin
  XMLDoc := GetMenuFile;
  if not Assigned(XMLDoc) then Exit;

  XMLDoc.Active := True;
  try
    Msg := Format(ERR_ADDIN_MENUFILE_INVALID, [FMenuFileName]);
    XMLNode := XMLDoc.DocumentElement;
    if XMLNode = nil then raise EAddInMenuFileInvalidException.Create(Msg);
    if XMLNode.NodeName <> XE_ROOT then raise EAddInMenuFileInvalidException.Create(Msg);
    XMLNode := XMLNode.ChildNodes.FindNode(XE_BODY);
    if XMLNode = nil then raise EAddInMenuFileInvalidException.Create(Msg);
    // Setup Main Menu Items
    XMLSubNode := XMLNode.ChildNodes.FindNode(XE_MAINMENU);
    if XMLSubNode <> nil then SetupMainMenus(XMLSubNode);
    // Setup Popup Menu Items
    XMLSubNode := nil;
    XMLSubNode := XMLNode.ChildNodes.FindNode(XE_POPUPMENU);
    if XMLSubNode <> nil then SetupPopupMenus(XMLSubNode);
    // Setup Help Menu Item
    SetupHelpMenu;
    SetAllMenuItemsVisibility(FIsActive);

    if IsActive then begin
      Msg := Format(MSG_ADDIN_MENU_CONFIGURED, [FAddInName]);
      if Assigned(FOnMessage) then FOnMessage(Msg);
    end;
  finally
    XMLDoc.Active := False;
    XMLDoc.Free;
  end;
end;

// PAddIn
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PStarUMLAddIn

constructor PStarUMLAddIn.Create;
begin
  inherited;
  FStarUMLAddin := nil;
end;

destructor PStarUMLAddIn.Destroy;
begin
  if Assigned(FStarUMLAddin) then FStarUMLAddin.FinalizeAddIn;
  FStarUMLAddin := nil;
  inherited;
end;

procedure PStarUMLAddIn.SetupCOMObject(ActiveFlag: Boolean);

  function ExecAndWait(const ExecuteFile, ParamString : string): boolean;
  var
    SEInfo: TShellExecuteInfo;
    ExitCode: DWORD;
  begin
    FillChar(SEInfo, SizeOf(SEInfo), 0);
    SEInfo.cbSize := SizeOf(TShellExecuteInfo);
    with SEInfo do begin
      fMask := SEE_MASK_NOCLOSEPROCESS;
      Wnd := Application.Handle;
      lpFile := PChar(ExecuteFile);
      lpParameters := PChar(ParamString);
      nShow := SW_HIDE;
    end;
    if ShellExecuteEx(@SEInfo) then
    begin
      repeat
        Application.ProcessMessages;
        GetExitCodeProcess(SEInfo.hProcess, ExitCode);
      until (ExitCode <> STILL_ACTIVE) or Application.Terminated;
      Result:=True;
    end
    else Result:=False;
  end;

var
  Msg: string;
  R: Boolean;
  ClassID: TGUID;
  Module: string;
begin
  if FCOMObjName <> '' then begin
  try
    try

      ClassID := StringToGUID(FCOMObjName); // First attempt of getting ClassID

    except // Initial error handling, try to register DLLs if they can be found
      R := ExecAndWait('regsvr32','/s "' + InstalledDir + '\' + FFilename + '"');
      if Assigned(FOnMessage) then
        if R then
          FOnMessage(Format('AddIn "%s" is registered successfully.', [FAddInName]))
        else
          FOnMessage(Format('AddIn "%s" registeration is failed.', [FAddInName]));

      for Module in FModulePath do begin
        R := ExecAndWait('regsvr32','/s "' + InstalledDir + '\' + Module + '"');
        if Assigned(FOnMessage) then
          if R then
            FOnMessage(Format('AddIn sub module "%s" is registered successfully.', [ExtractFileName(Module)]))
          else
            FOnMessage(Format('AddIn sub module "%s" registeration is failed.', [ExtractFileName(Module)]));
      end;

      ClassID := StringToGUID(FCOMObjName); // Second attempt, exception will be handled now by top level block


    end; // End of inner try block

    // If ClassID was obtained, try to create COM object
    if ActiveFlag then begin
      FStarUMLAddIn := CreateCOMObject(ClassID) as IStarUMLAddIn;
      FStarUMLAddIn.InitializeAddIn;
    end
    else begin // or finalize COM object if inactive
      if Assigned(FStarUMLAddIn) then
        FStarUMLAddIn.FinalizeAddIn;
      FStarUMLAddIn := nil;
    end;

    except on Exception do // Final exception handling
      begin
        Msg := Format(ERR_ADDIN_COMOBJ_CREATION, [FCOMObjName]);
        raise EAddInLoadingValuesException.Create(Msg);
      end;
    end;
  end;
end;

procedure PStarUMLAddIn.SetupAddInInfo(XMLNode: IXMLNode; Path: String);
var
  Msg: string;
begin
  inherited;
  // InstalledDir
  FInstalledDir := Path;
  if FInstalledDir = '' then begin
    Msg := Format(ERR_ADDIN_ITEM_REGVALUE, ['InstalledDir']);
    raise EAddInLoadingValuesException.Create(Msg);
  end;
  // MenuFile
  FMenuFileName := ReadChildStringValue(XMLNode, 'MENUFILE', '');
  if FMenuFileName = '' then begin
    Msg := Format(ERR_ADDIN_ITEM_REGVALUE, ['MenuFile']);
    raise EAddInLoadingValuesException.Create(Msg);
  end;
end;

procedure PStarUMLAddIn.SetIsActive(Value: Boolean);
var
  Msg: string;
begin
  if FIsActive <> Value then begin
    try
      SetupCOMObject(Value);
      inherited;
    except on E: Exception do
      begin
        Msg := Format(ERR_ADDIN_MENU_CONFIG_FAILED, [FAddInName, E.Message]);
        if Assigned(FOnMessage) then FOnMessage(Msg);
      end;
    end;
  end;
end;

procedure PStarUMLAddIn.MenuItemClickedHandler(Sender: TObject);
var
  dxSubItem: TdxBarSubItem;
  dxItem: TdxBarItem;
begin
  inherited;
  if Sender is TdxBarSubItem then begin
    dxSubItem := Sender as TdxBarSubItem;
    if Assigned(FStarUMLAddIn) and (dxSubItem.Tag >= 1) then begin
      try
        if FStarUMLAddIn.DoMenuAction(dxSubItem.Tag) <> S_OK then
          if Assigned(FOnMessage) then FOnMessage(Format(ERR_ADDIN_COMOBJ_MSG_SENDING, [FComObjName]));
      except on Exception do
        if Assigned(FOnMessage) then FOnMessage(Format(ERR_ADDIN_COMOBJ_MSG_SENDING, [FComObjName]));
      end;
    end;
  end else if Sender is TdxBarButton then begin
    dxItem := Sender as TdxBarButton;
    if Assigned(FStarUMLAddIn) and (dxItem.Tag >= 1)  then begin
      try
        if FStarUMLAddIn.DoMenuAction(dxItem.Tag) <> S_OK then
          if Assigned(FOnMessage) then FOnMessage(Format(ERR_ADDIN_COMOBJ_MSG_SENDING, [FComObjName]));
      except on Exception do
        if Assigned(FOnMessage) then FOnMessage(Format(ERR_ADDIN_COMOBJ_MSG_SENDING, [FComObjName]));
      end;
    end;
  end;
end;

procedure PStarUMLAddIn.LoadXMLValues(XMLNode: IXMLNode; Path: String);
begin
  inherited;
  SetupCOMObject(FIsActive);
end;

// PStarUMLAddIn
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PFrameWindowAddIn

constructor PFrameWindowAddIn.Create;
begin
  inherited;
  FFrameWindowAddIn := nil;
  FTab := nil;
end;

destructor PFrameWindowAddIn.Destroy;
var
  TempAddIn: IStarUMLAddIn;
begin
  if Assigned(FFrameWindowAddIn) then begin
    if FFrameWindowAddIn.QueryInterface(IID_IStarUMLAddIn, TempAddIn) = S_OK then begin
      TempAddIn.FinalizeAddIn;
      TempAddIn := nil;
    end;
  end;
  FFrameWindowAddIn := nil;
  if Assigned(FTab) then begin
    FTab.PageControl := nil;
    FTab.Free;
  end;
  inherited;
end;

procedure PFrameWindowAddIn.SetupFrameWindow(ActiveFlag: Boolean);
    function CreateContainerWindow(ParentControl: TPageControl): TTabSheet;
    var
      Tab: TTabSheet;
      Container: TOleContainer;
      OleObj: Variant;
      Msg: string;
    begin
      Result := nil;
      Tab := TTabSheet.Create(ParentControl);
      Tab.Parent := ParentControl;
      Tab.PageControl := ParentControl;
      Container := TOleContainer.Create(Tab);
      Container.Parent := Tab;
      Container.Align := alClient;
      try
        Container.AllowInPlace := True;
        Container.CreateObject(FCOMObjName, False);
        OleObj := Container.OleObject;
        FFrameWindowAddIn := IUnknown(OleObj);
        //Container.AllowActiveDoc := False;
        //Container.SizeMode := smStretch;
        //Container.AutoActivate := aaGetFocus;
        //Container.DoVerb(ovShow);
        //Container.DoVerb(ovPrimary);
        //Container.DoVerb(ovInplaceActivate);
        Result := Tab;
      except on E: Exception do
        begin
          if Assigned(Tab) then Tab.Free;
          Msg := Format(ERR_ADDIN_COMOBJ_CREATION, [FCOMObjName]);
          raise EAddInLoadingValuesException.Create(Msg);
        end;
      end;
    end;
var
  PageControl: TPageControl;
  Msg: string;
begin
  if FFrameWindowParent = pwError then Exit;
  if FCOMObjName = '' then begin
    Msg := ERR_ADDIN_COMOBJ_INVALID_PROGID;
    raise EAddInLoadingValuesException.Create(Msg);
  end;
  if ActiveFlag then begin
    // if FFrameWindowParent = pwInformation then
    //   PageControl := MainForm.InformationFrame.InformationPageControl
    // else if FFrameWindowParent = pwBrowser then
    //   PageControl := MainForm.BrowserFrame.BrowserPageControl
    // if FFrameWindowParent = pwInspector then
    //   PageControl := MainForm.InspectorFrame.InspectorPageControl;
    FTab := CreateContainerWindow(PageControl);
    if Assigned(FTab) then begin
      FTab.Caption := Self.DisplayName;
      if Assigned(FIcon) then begin
        FTabImageIndex := PageControl.Images.AddIcon(FIcon);
        FTab.ImageIndex := FTabImageIndex;
      end;
    end;
  end else begin
    FFrameWindowAddIn := nil;
    if Assigned(FTab) then begin
      FTab.PageControl := nil;
      FTab.Free;
      FTab := nil;
    end;
  end;
end;

procedure PFrameWindowAddIn.SetupAddInInfo(XMLNode: IXMLNode; Path: String);
var
  Str, Msg: string;
begin
  inherited;
  // InstalledDir
  FInstalledDir := Path;
  if FInstalledDir = '' then begin
    Msg := Format(ERR_ADDIN_ITEM_REGVALUE, ['InstalledDir']);
    raise EAddInLoadingValuesException.Create(Msg);
  end;
  // MenuFile
  FMenuFileName := ReadChildStringValue(XMLNode, 'MENUFILE', '');
  if FMenuFileName = '' then begin
    Msg := Format(ERR_ADDIN_ITEM_REGVALUE, ['MenuFile']);
    raise EAddInLoadingValuesException.Create(Msg);
  end;

  // IsFrameWindow
  Str := ReadChildStringValue(XMLNode, 'FRAMEWINDOWPLACE', '');

  if Str = 'browser' then FFrameWindowParent := pwBrowser
  else if Str = 'inspector' then FFrameWindowParent := pwInspector
  else if Str = 'information' then FFrameWindowParent := pwInformation
  else begin
    FFrameWindowParent := pwError;
    Msg := Format(ERR_ADDIN_ITEM_REGVALUE, ['FrameWindowPlace']);
    raise EAddInLoadingValuesException.Create(Msg);
  end;
end;

procedure PFrameWindowAddIn.SetIsActive(Value: Boolean);
var
  Msg: string;
begin
  if FIsActive <> Value then begin
    try
      SetupFrameWindow(Value);
      inherited;
    except on E: Exception do
      begin
        Msg := Format(ERR_ADDIN_MENU_CONFIG_FAILED, [FAddInName, E.Message]);
        if Assigned(FOnMessage) then FOnMessage(Msg);
      end;
    end;
  end;
end;

procedure PFrameWindowAddIn.MenuItemClickedHandler(Sender: TObject);
var
  TempAddIn: IStarUMLAddIn;
  dxSubItem: TdxBarSubItem;
  dxItem: TdxBarItem;
begin
  inherited;
  if Assigned(FFrameWindowAddIn) and
     (FFrameWindowAddIn.QueryInterface(IID_IStarUMLAddIn, TempAddIn) = S_OK) then
  begin
    try
      if Sender is TdxBarSubItem then begin
        dxSubItem := Sender as TdxBarSubItem;
        if dxSubItem.Tag >= 1 then begin
          try
            if TempAddIn.DoMenuAction(dxSubItem.Tag) <> S_OK then
              if Assigned(FOnMessage) then FOnMessage(Format(ERR_ADDIN_COMOBJ_MSG_SENDING, [FComObjName]));
          except on Exception do
            if Assigned(FOnMessage) then FOnMessage(Format(ERR_ADDIN_COMOBJ_MSG_SENDING, [FComObjName]));
          end;
        end;
      end else if Sender is TdxBarButton then begin
        dxItem := Sender as TdxBarButton;
        if dxItem.Tag >= 1  then begin
          try
            if TempAddIn.DoMenuAction(dxItem.Tag) <> S_OK then
              if Assigned(FOnMessage) then FOnMessage(Format(ERR_ADDIN_COMOBJ_MSG_SENDING, [FComObjName]));
          except on Exception do
            if Assigned(FOnMessage) then FOnMessage(Format(ERR_ADDIN_COMOBJ_MSG_SENDING, [FComObjName]));
          end;
        end;
      end;
    finally
      TempAddIn := nil;
    end;
  end;
end;

procedure PFrameWindowAddIn.LoadXMLValues(XMLNode: IXMLNode; Path: String);
begin
  inherited;
  SetupFrameWindow(FIsActive);
end;

procedure PFrameWindowAddIn.SetupMenus;
begin
  if FMenuFileName <> '' then inherited;
end;

// PFrameWindowAddIn
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAddInManager

constructor PAddInManager.Create;
begin
  inherited;
  FAddIns := TList.Create;
  FAddIns.Clear;
end;

destructor PAddInManager.Destroy;
var
  I: Integer;
  AddIn: PAddIn;
begin
  try
    for I := FAddIns.Count - 1 downto 0 do begin
      AddIn := FAddIns.Items[I];
      if Assigned(AddIn) then AddIn.Free;
    end;
  finally
    FAddIns.Free;
  end;
  inherited;
end;

procedure PAddInManager.MessageProc(str: string);
begin
  if Assigned(FOnMessage) then FOnMessage(str);
end;

procedure PAddInManager.MessageProc(str: string; const arr: array of const);
begin
  if Assigned(FOnMessage) then FOnMessage(Format(str, arr));
end;

function PAddInManager.GetAddIn(Index: Integer): PAddIn;
begin
  Result := nil;
  if (Index >= 0) and (Index < FAddIns.Count) then
    Result := FAddIns.Items[Index];
end;

function PAddInManager.GetAddInsCount: Integer;
begin
  Result := FAddIns.Count;
end;

procedure PAddInManager.SetupAddIns;
(*
    function IsFrameWindowAddIn(Key: string): Boolean;
    var
      Reg: TRegistry;
      Val: string;
    begin
      Result := False;
      Reg := TRegistry.Create;
      try
        Reg.RootKey := ROOTKEY;
        if Reg.OpenKeyReadOnly(ADDINSKEY + '\' + Key) then begin
          try
            if Reg.ValueExists(VN_FRAME_WINDOW) then begin
              Val := LowerCase(Trim(Reg.ReadString(VN_FRAME_WINDOW)));
              if (Val = 'true') or (Val = 'yes') then  Result := True;
            end;
          finally
            Reg.CloseKey;
          end;
        end;
      finally
        Reg.Free;
      end;
    end;
    procedure AddAddIn(Key: string);
    var
      AddIn: PAddIn;
    begin
      if IsFrameWindowAddIn(Key) then AddIn := PFrameWindowAddIn.Create
      else AddIn := PStarUMLAddIn.Create;
      try
        AddIn.OnMessage := MessageProc;
        AddIn.LoadXMLValues(Key);
        FAddIns.Add(AddIn);
        MessageProc(MSG_ADDIN_LOADED, [Key]);
      except on E: EAddInLoadingValuesException do
        begin
          MessageProc(ERR_ADDIN_LOAD_FAILED, [Key, E.Message]);
          AddIn.Free;
        end;
      end;
    end;
var
  StrList: TStringList;
  Reg: TRegistry;
  I: Integer;
begin
  StrList := TStringList.Create;
  StrList.Clear;
  Reg := TRegistry.Create;
  Reg.RootKey := ROOTKEY;
  try
    //MessageProc(MSG_ADDIN_START_LOADING);
    if Reg.OpenKeyReadOnly(ADDINSKEY) then begin
      try if Reg.HasSubKeys then Reg.GetKeyNames(StrList);
      finally Reg.CloseKey;
      end;
      for I := 0 to StrList.Count - 1 do begin
        //MessageProc(MSG_ADDIN_ITEM + StrList.Strings[I]);
        AddAddIn(StrList.Strings[I]);
      end;
    end else MessageProc(ERR_ADDIN_REGKEY);
  finally
    //MessageProc(MSG_ADDIN_END_LOADING);
    Reg.Free;
    StrList.Free;
  end;
*)

  function IsFrameWindowAddIn(Node: IXMLNode): Boolean;
  begin
    Result := (LowerCase(ReadChildStringValue(Node, 'ISFRAMEWINDOW', 'false')) = 'true');
  end;

  function AddAddIn(Path, FilePath: String): Boolean;
  var
    XMLDoc: TXMLDocument;
    RootNode: IXMLNode;
    AddIn: PAddIn;
    IsFrameWindow: Boolean;
  begin
    Result := true;

    XMLDoc := TXMLDocument.Create(Application);
    XMLDoc.LoadFromFile(FilePath);
    XMLDoc.Active := True;

    if XMLDoc.IsEmptyDoc then raise Exception.Create(ERR_EMPTY_DOCUMENT);
    RootNode := XMLDoc.DocumentElement;
    try
      if IsFrameWindowAddIn(RootNode) then AddIn := PFrameWindowAddIn.Create
      else AddIn := PStarUMLAddIn.Create;

      AddIn.OnMessage := MessageProc;
      AddIn.LoadXMLValues(RootNode, Path);
      FAddIns.Add(AddIn);
    except
      on E: Exception do begin
        if XMLDoc <> nil then XMLDoc.Free;
        Result := false;
      end;
    end;
  end;

  procedure LoadFiles(Path: String);
  var
    SearchRec: TSearchRec;
    AddInDescName, FileName: string;
  begin
    // files
    if FindFirst(Path + '\*' + ADDIN_DESCRIPTION_EXTENSION, faArchive, SearchRec) = 0 then begin
      repeat
        AddInDescName := Copy(SearchRec.Name, 1, Length(SearchRec.Name)-Length('.'+ADDIN_DESCRIPTION_EXTENSION));
        FileName := Path + '\' + AddInDescName + '.' + ADDIN_DESCRIPTION_EXTENSION;

        if AddAddIn(Path, FileName) then begin
          MessageProc(MSG_ADDIN_LOADED, [AddInDescName]);
        end
        else
          MessageProc(ERR_ADDIN_LOAD_FAILED, [AddInDescName, '']);
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

procedure PAddInManager.SetupMenus;
var
  I: Integer;
  AddIn: PAddIn;
begin
  if FAddIns.Count > 0 then begin
    try
      //MessageProc(MSG_START_MENUCONFIG);
      I := 0;
      while I < FAddIns.Count do begin
        AddIn := FAddIns.Items[I];
        //MessageProc(MSG_ADDIN_NAME + AddIn.DisplayName);
        try
          AddIn.SetupMenus;
        except on E: EAddInMenuFileInvalidException do
          begin
            MessageProc(ERR_ADDIN_MENU_CONFIG_FAILED, [AddIn.AddInName, E.Message]);
            FAddIns.Delete(I);
            Dec(I);
            AddIn.Free;
          end;
        end;
        Inc(I);
      end;
    finally
      //MessageProc(MSG_END_MENUCONFIG);
    end;
  end;
end;

procedure PAddInManager.LoadAddIns;
begin
  SetupAddIns;
  SetupMenus;
end;

function PAddInManager.FindAddIn(COMObjectName: string): PAddIn;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to AddInsCount - 1 do
    if AddIn[I].COMSvrName = COMObjectName then begin
      Result := AddIn[I];
      Exit;
    end;
end;

// PAddInManager
////////////////////////////////////////////////////////////////////////////////

end.

