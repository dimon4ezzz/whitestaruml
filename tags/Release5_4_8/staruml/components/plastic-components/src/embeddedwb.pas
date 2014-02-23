{$DEFINE USE_IOLECOMMANDTARGET}
//***********************************************************
//               EmbeddedWb ver 1.16b (Oct. 15 , 2001)      *
//                                                          *
//                     For Delphi 4, 5 and 6                *
//                     Freeware Component                   *
//                            by                            *
//                     Per Lindsø Larsen                    *
//                 per.lindsoe@larsen.mail.dk               *
//                                                          *
//                                                          *
//       Contributors:                                      *
//                                                          *
//            Mathias Walter (walter@coint.de)              *
//              -  all messagehandling code                 *
//                                                          *
//            Neil Moss (NeilM@BuchananInternational.com)   *
//              -  code for setting downloadoptions         *
//                                                          *
//       Documentation and updated versions:                *
//                                                          *
//               http://www.euromind.com/iedelphi           *
//***********************************************************


unit EmbeddedWB;

interface

uses
{$IFDEF VER140}Variants, {$ENDIF}
  IEConst, IEUtils, Registry, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EXTCtrls, OleCtrls, Mshtml_tlb, SHDocVw_tlb, ActiveX, shlObj, Wininet, Urlmon, shellapi;


type
{$IFDEF USE_IOLECOMMANDTARGET}
  TScriptErrorEvent = procedure(Sender: TObject; ErrorLine, ErrorCharacter, ErrorCode, ErrorMessage, ErrorUrl: string;
    var ContinueScript: Boolean; var Showdialog: Boolean) of object;
  TRefreshEvent = procedure(Sender: TObject; CmdID: Integer; var Cancel: Boolean) of object;
  TUnloadEvent = procedure(Sender: TObject) of object;
{$ENDIF}

  TGetOverrideKeyPathEvent = function(pchKey: POLESTR; dw: DWORD): HRESULT of object;
  TShowContextMenuEvent = function(const dwID: DWORD; const ppt: PPOINT;
    const pcmdtReserved: IUnknown; const pdispReserved: IDispatch): HRESULT of object;
  TGetHostInfoEvent = function(var pInfo: TDOCHOSTUIINFO): HRESULT of object;
  TShowUIEvent = function(const dwID: DWORD; const pActiveObject: IOleInPlaceActiveObject;
    const pCommandTarget: IOleCommandTarget; const pFrame: IOleInPlaceFrame;
    const pDoc: IOleInPlaceUIWindow): HRESULT of object;
  THideUIEvent = function: HRESULT of object;
  TUpdateUIEvent = function: HRESULT of object;
  TEnableModelessEvent = function(const fEnable: BOOL): HRESULT of object;
  TOnDocWindowActivateEvent = function(const fActivate: BOOL): HRESULT of object;
  TOnFrameWindowActivateEvent = function(const fActivate: BOOL): HRESULT of object;
  TResizeBorderEvent = function(const prcBorder: PRECT;
    const pUIWindow: IOleInPlaceUIWindow;
    const fRameWindow: BOOL): HRESULT of object;
  TTranslateAcceleratorEvent = function(const lpMsg: PMSG; const pguidCmdGroup: PGUID;
    const nCmdID: DWORD): HRESULT of object;
  TGetOptionKeyPathEvent = function(var pchKey: POLESTR; const dw: DWORD): HRESULT of object;
  TGetDropTargetEvent = function(const pDropTarget: IDropTarget;
    out ppDropTarget: IDropTarget): HRESULT of object;
  TGetExternalEvent = function(out ppDispatch: IDispatch): HRESULT of object;
  TTranslateUrlEvent = function(const dwTranslate: DWORD; const pchURLIn: POLESTR;
    var ppchURLOut: POLESTR): HRESULT of object;
  TFilterDataObjectEvent = function(const pDO: IDataObject;
    out ppDORet: IDataObject): HRESULT of object;
  TShowMessageEvent = function(hwnd: THandle;
    lpstrText: POLESTR; lpstrCaption: POLESTR; dwType: longint; lpstrHelpFile: POLESTR;
    dwHelpContext: longint; var plResult: LRESULT): HRESULT of object;
  TShowHelpEvent = function(hwnd: THandle; pszHelpFile: POLESTR; uCommand: integer;
    dwData: longint; ptMouse: TPoint;
    var pDispatchObjectHit: IDispatch): HRESULT of object;
  TGetTypeInFoCountEvent = function(out Count: Integer): HResult of object;
  TGetTypeInfoEvent = function(Index, LocaleID: Integer; out TypeInfo: ITypeInfo): HResult of object;
  TGetIDsOfNamesEvent = function(const IID: TGUID; Names: Pointer;
    NameCount, LocaleID: Integer; DispIDs: Pointer): HResult of object;
  TInvokeEvent = function(DispID: Integer; const IID: TGUID; LocaleID: Integer;
    Flags: Word; var Params: TagDispParams; VarResult, ExcepInfo, ArgErr: Pointer): HResult of object;
  TQueryServiceEvent = function(const rsid, iid: TGuid; out Obj: IUnknown): HResult of object;
  TShowDialogEvent = procedure(Sender: TObject; h: THandle) of object;


  TDownloadControlOption = (DLCTL_DLIMAGES, DLCTL_VIDEOS, DLCTL_BGSOUNDS,
    DLCTL_NO_SCRIPTS, DLCTL_NO_JAVA, DLCTL_NO_RUNACTIVEXCTLS, DLCTL_NO_DLACTIVEXCTLS,
    DLCTL_DOWNLOADONLY, DLCTL_NO_FRAMEDOWNLOAD, DLCTL_RESYNCHRONIZE, DLCTL_PRAGMA_NO_CACHE,
    DLCTL_NO_BEHAVIORS, DLCTL_NO_METACHARSET, DLCTL_URL_ENCODING_DISABLE_UTF8,
    DLCTL_URL_ENCODING_ENABLE_UTF8, DLCTL_FORCEOFFLINE, DLCTL_NO_CLIENTPULL,
    DLCTL_SILENT, DLCTL_OFFLINE);

  TDownloadControlOptions = set of TDownloadControlOption;

  TUserInterfaceOption = (DIALOG, DISABLE_HELP_MENU, NO3DBORDER,
    SCROLL_NO, DISABLE_SCRIPT_INACTIVE, OPENNEWWIN, DISABLE_OFFSCREEN,
    FLAT_SCROLLBAR, DIV_BLOCKDEFAULT, ACTIVATE_CLIENTHIT_ONLY, OVERRIDEBEHAVIORFACTORY,
    CODEPAGELINKEDFONTS, URL_ENCODING_DISABLE_UTF8, URL_ENCODING_ENABLE_UTF8,
    ENABLE_FORMS_AUTOCOMPLETE, ENABLE_INPLACE_NAVIGATION, IME_ENABLE_RECONVERSION);

  TUserInterfaceOptions = set of TUserInterfaceOption;

type

  TMeasure = (mMetric, mUS);

  TPrintOrientationOption = (poPortrait, poLandscape);

  TMargins = class(TPersistent)
  private
    FLeft: Real;
    FRight: Real;
    FTop: Real;
    FBottom: real;
  published
    property Left: Real read FLeft write FLeft;
    property Right: Real read FRight write FRight;
    property Top: Real read FTop write FTop;
    property Bottom: Real read FBottom write FBottom;
  end;

  TPrintOptions = class(TPersistent)
  private
    FHTMLHeader: TStrings;
    FHeader: string;
    FFooter: string;
    FMargins: TMargins;
    FOrientation: TPrintOrientationOption;
    FMeasure: TMeasure;
    procedure SetHTMLHeader(const Value: Tstrings);
    property Measure: TMeasure read FMeasure;
  published
    property Margins: TMargins read FMargins write FMargins;
    property Header: string read FHeader write FHeader;
    property HTMLHeader: TStrings read FHTMLHeader write SetHTMLHeader;
    property Footer: string read FFooter write FFooter;
    property Orientation: TPrintOrientationOption read FOrientation write FOrientation;
  end;

  TEmbeddedWB = class(TWebbrowser, IDocHostShowUI, IDocHostUIHandler,
      IDocHostUIHandler2, IDispatch, IServiceProvider
{$IFDEF USE_IOLECOMMANDTARGET}, IOleCommandTarget{$ENDIF})
  private
{$IFDEF VER120}
    SaveMessage: TMessageEvent;
{$ENDIF}
    FUserAgent: string;
    FReplaceCaption: Boolean;
    FPrintOptions: TPrintOPtions;
    FDownloadControlOptions: TDownloadControlOptions;
    FUserInterfaceOptions: TUserInterfaceOptions;
{$IFDEF USE_IOLECOMMANDTARGET}
    FOnUnload: TUnloadEvent;
    FOnRefresh: TRefreshEvent;
    FOnScriptError: TScriptErrorEvent;
{$ENDIF}
    FOnGetOverrideKeyPath: TGetOverrideKeypathEvent;
    FOnShowContextMenu: TShowcontextmenuEvent;
    FOnGetHostInfo: TGetHostInfoEvent;
    FOnShowUI: TShowUIEvent;
    FOnHideUI: THideUIEvent;
    FOnUpdateUI: TUpdateUIEvent;
    FOnEnableModeless: TEnableModelessEvent;
    FOnOnDocWindowActivate: TOnDocWindowActivateEvent;
    FOnOnFrameWindowActivate: TOnFrameWindowActivateEvent;
    FOnResizeBorder: TResizeBorderEvent;
    FOnTranslateAccelerator: TTranslateAcceleratorEvent;
    FOnGetOptionKeyPath: TGetOptionKeyPathEvent;
    FOnGetDropTarget: TGetDropTargetEvent;
    FOnGetExternal: TGetExternalEvent;
    FOnTranslateUrL: TTranslateUrlEvent;
    FOnFilterDataObject: TFilterDataObjectEvent;
    FHelpFile: string;
    FOnShowMessage: TShowMessageEvent;
    FOnShowHelp: TShowHelpEvent;
    FOnGetTypeInfoCount: TGetTypeInfoCountEvent;
    FOnGetTypeInfo: TGetTypeInfoEvent;
    FOnGetIDsOfNames: TGetIDsOfNamesEvent;
    FOnInvoke: TInvokeEvent;
    FOnQueryService: TQueryServiceEvent;
    FOldWindowProc: TWndMethod;
    FParentForm: TForm;
    FDownloadOptionValue: Longint;
    FUserInterfaceValue: Cardinal;
    FOnCloseQuery: TCloseQueryEvent;
    FOnShowDialog: TShowDialogEvent;
    OldWBWndProc: TWndMethod;
    RuntimeMeasure: TMeasure;
    DDEHWnd: THandle;
    FEnableDDE: Boolean;
    FfpExceptions: Boolean;
    procedure SetUserAgent;
    procedure RemoveUserAgent;
    procedure GetPrintValues;
    procedure Hook;
    procedure UnHook;
    procedure FormWndProc(var AMsg: TMessage);
    procedure DDEWndProc(var AMsg: TMessage);
    procedure WBWndProc(var Message: TMessage);
    procedure SetDownloadOptions(const Value: TDownloadControlOptions);
    procedure SetUserInterfaceOptions(const Value: TUserInterfaceOptions);
    procedure SetfpExceptions(const Value: Boolean);

    procedure UpdateDownloadControlValue;
    procedure UpdateUserInterfaceValue;
  protected
    function DDETerminate(iwParam: WPARAM; ilParam: LPARAM): BOOL;
    function DDEInitiate(iwParam: WPARAM; ilParam: LPARAM): LRESULT;
    function DDEExecute(iwParam: WPARAM; ilParam: LPARAM): LRESULT;
    function GetOverrideKeyPath(pchKey: POLESTR; dw: DWORD): HRESULT; stdcall;

{$IFDEF USE_IOLECOMMANDTARGET}
    function QueryStatus(CmdGroup: PGUID; cCmds: Cardinal;
      prgCmds: POleCmd; CmdText: POleCmdText): HResult; stdcall;
    function Exec(CmdGroup: PGUID; nCmdID, nCmdexecopt: DWORD;
      const vaIn: OleVariant; var vaOut: OleVariant): HResult; stdcall;
{$ENDIF}
    function ShowContextMenu(const dwID: DWORD; const ppt: PPOINT;
      const pcmdtReserved: IUnknown; const pdispReserved: IDispatch): HRESULT; stdcall;
    function GetHostInfo(var pInfo: TDOCHOSTUIINFO): HRESULT; stdcall;
    function ShowUI(const dwID: DWORD; const pActiveObject: IOleInPlaceActiveObject;
      const pCommandTarget: IOleCommandTarget; const pFrame: IOleInPlaceFrame;
      const pDoc: IOleInPlaceUIWindow): HRESULT; stdcall;
    function HideUI: HRESULT; stdcall;
    function UpdateUI: HRESULT; stdcall;
    function EnableModeless(const fEnable: BOOL): HRESULT; stdcall;
    function OnDocWindowActivate(const fActivate: BOOL): HRESULT; stdcall;
    function OnFrameWindowActivate(const fActivate: BOOL): HRESULT; stdcall;
    function ResizeBorder(const prcBorder: PRECT;
      const pUIWindow: IOleInPlaceUIWindow;
      const FrameWindow: BOOL): HRESULT; stdcall;
    function TranslateAccelerator(const lpMsg: PMSG; const pguidCmdGroup: PGUID;
      const nCmdID: DWORD): HRESULT; stdcall;
    function GetOptionKeyPath(var pchKey: POLESTR; const dw: DWORD): HRESULT; stdcall;
    function GetDropTarget(const pDropTarget: IDropTarget;
      out ppDropTarget: IDropTarget): HRESULT; stdcall;
    function GetExternal(out ppDispatch: IDispatch): HRESULT; stdcall;
    function TranslateUrl(const dwTranslate: DWORD; const pchURLIn: POLESTR;
      var ppchURLOut: POLESTR): HRESULT; stdcall;
    function FilterDataObject(const pDO: IDataObject;
      out ppDORet: IDataObject): HRESULT; stdcall;
    function ShowMessage(hwnd: THandle;
      lpstrText: POLESTR; lpstrCaption: POLESTR; dwType: longint; lpstrHelpFile: POLESTR;
      dwHelpContext: longint; var plResult: LRESULT): HRESULT; stdcall;
    function ShowHelp(hwnd: THandle; pszHelpFile: POLESTR; uCommand: integer;
      dwData: longint; ptMouse: TPoint;
      var pDispatchObjectHit: IDispatch): HRESULT; stdcall;
    function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;
    function GetIDsOfNames(const IID: TGUID; Names: Pointer;
      NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
      Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;
{$IFDEF VER120}
    procedure IEMessageHandler(var Msg: TMsg; var Handled: Boolean);
{$ENDIF}
    function QueryService(const rsid, iid: TGuid; out Obj): HResult; stdcall;
    function OpenClient(Client: string): Boolean;
    function PrintMarginStr(M: Real): PChar;
  public
    SecurityManager: IInternetSecurityManager;
    ZoneManager: IInternetZoneManager;
    function ShowMailClient: Boolean;
    function ShowNewsClient: Boolean;
    function ShowAddressBook: Boolean;
    function ShowCalendar: Boolean;
    function ShowInternetCall: Boolean;
    procedure AssignDocument;
    procedure SetFocusToDoc;
    procedure InvokeCMD(InvokeIE: Boolean; Value1, Value2: Integer; var vaIn, vaOut: OleVariant);
    procedure Go(Url: string);
    procedure Print;
    procedure OpenDialog;
    procedure SaveDialog;
    procedure PrintSetup;
    procedure PageSetup(UsePrintOptions: Boolean);
    procedure ViewSource;
    procedure Properties;
    procedure Options;
    procedure Find;
{$IFDEF VER120}
    procedure EnableMessagehandler;
    procedure DisableMessagehandler;
{$ENDIF}
    procedure Copy;
    procedure SelectAll;
    procedure Zoom(ZoomValue: Integer);
    function ZoomRangeHigh: Integer;
    function ZoomRangeLow: Integer;
    function ZoomValue: Integer;
    procedure NavigatePidl(pidl: PItemIdlist);
    procedure NavigateFolder(CSIDL: Integer);
    procedure SetGlobalOffline(Value: Boolean);
    function IsGlobalOffline: boolean;
    function LoadFrameFromStrings(Frameno: Integer; const AStrings: TStrings): HResult;
    function LoadFrameFromStream(FrameNo: Integer; AStream: TStream): HRESULT;
    function SaveFrameToFile(FrameNo: Integer; const Fname: string): HRESULT;
    function SaveFrameToStream(FrameNo: Integer; AStream: TStream): HRESULT;
    function SaveFrameToStrings(FrameNo: Integer; AStrings: TStrings): HRESULT;
    function LoadFromStream(const AStream: TStream): HRESULT;
    function LoadFromStrings(const AStrings: TStrings): HRESULT;
    function SaveToStrings(AStrings: TStrings): HRESULT;
    function SaveToStream(AStream: TStream): HRESULT;
    function SaveToFile(const Fname: string): HRESULT;
    constructor Create(Owner: TComponent); override;
    procedure Loaded; override;
    destructor Destroy; override;
    procedure PrintPreView;
    procedure PrintWithOptions;
    function GetFrame(FrameNo: Integer): IWebbrowser2;
    function FrameCount: LongInt;
    procedure GetThumbnail(var Image: TImage);
    procedure ClearHistory;
    procedure ClearCache;
  published
    property DownloadOptions: TDownloadControlOptions read FDownloadControlOptions write SetDownloadOptions;
    property UserInterfaceOptions: TUserInterfaceOptions read FUserInterfaceOptions write SetUserInterfaceOptions;
{$IFDEF USE_IOLECOMMANDTARGET}
    property OnRefresh: TRefreshEvent read FOnRefresh write FOnRefresh;
    property OnScriptError: TScriptErrorEvent read FOnScriptError write FOnScriptError;
    property OnUnload: TUnloadEvent read FOnUnload write FOnUnload;
{$ENDIF}
    property OnGetOverrideKeyPath: TGetOVerrideKeypathEvent read FOnGetOverrideKeyPath write FOnGetOverrideKeyPath;
    property OnShowContextMenu: TShowContextMenuEvent read FOnShowContextmenu write FOnShowContextmenu;
    property OnGetHostInfo: TGetHostInfoEvent read FOnGethostinfo write fongethostinfo;
    property OnShowUI: TShowUIEvent read FOnShowUI write FOnShowUI;
    property OnHideUI: THideUIEvent read FOnHideUI write FOnHideUI;
    property OnUpdateUI: TUpdateUIEvent read FOnUpdateUI write FOnUpdateUI;
    property OnEnableModeless: TEnableModelessEvent read FOnEnableModeless write FOnEnableModeless;
    property OnOnDocWindowActivate: TOnDocWindowActivateEvent read FOnOnDocWindowActivate write FOnOnDocWindowActivate;
    property OnOnFrameWindowActivate: TOnFrameWindowActivateEvent read FOnOnFrameWindowActivate write FOnOnFrameWindowActivate;
    property OnResizeBorder: TResizeBorderEvent read FOnResizeBorder write FOnResizeBorder;
    property OnTranslateAccelerator: TTranslateAcceleratorEvent read FOnTranslateAccelerator write FOnTranslateAccelerator;
    property OnGetOptionKeyPath: TGetOptionKeyPathEvent read FOnGetOptionKeyPath write FOnGetOptionKeyPath;
    property OnGetDropTarget: TGetDropTargetEvent read FOnGetDropTarget write FOnGetDropTarget;
    property OnGetExternal: TGetExternalEvent read FOnGetExternal write FOnGetExternal;
    property OnTranslateUrl: TTranslateUrlEvent read FOnTranslateUrL write FOnTranslateUrL;
    property OnFilterDataObject: TFilterDataObjectEvent read FOnFilterDataObject write FOnFilterDataObject;
    property HelpFile: string read FHelpFile write FHelpFile;
    property OnShowMessage: TShowMessageEvent read FOnShowMessage write FOnShowMessage;
    property OnShowHelp: TShowHelpEvent read FOnShowHelp write FOnShowHelp;
    property OnGetTypeInfoCount: TGetTypeInfoCountEvent read FonGetTypeInfoCount write FOnGetTypeInfoCount;
    property OnGetTypeInfo: TGetTypeInfoEvent read FonGetTypeInfo write FOnGetTypeInfo;
    property OnGetIDsOfNames: TGetIDsOfNamesEvent read FOnGetIDsOfNames write FOnGetIdsOfNames;
    property OnInvoke: TInvokeEvent read FOnInvoke write FOnInvoke;
    property OnQueryService: TQueryServiceEvent read FOnQueryService write FOnQueryService;
    property OnCloseQuery: TCloseQueryEvent read FOnCloseQuery write FOnCloseQuery;
    property OnShowDialog: TShowDialogEvent read FOnShowDialog write FOnShowDialog;
    property PrintOptions: TPrintOptions read FPrintOptions write FPrintOptions;
    property UserAgent: string read FUserAgent write FUserAgent;
    property ReplaceCaption: Boolean read FReplaceCaption write FReplaceCaption;
    property EnableDDE: Boolean read FEnableDDE write FEnableDDE;
    property fpExceptions: Boolean read FfpExceptions write SetfpExceptions;
  end;

function RegisterMIMEFilter(clsid: TGUID; MIME: PWideChar): HRESULT;
function UnregisterMIMEFilter(MIME: PWideChar): HRESULT;
function RegisterNameSpace(clsid: TGUID): HRESULT;
function UnregisterNameSpace: HRESULT;



procedure Register;

implementation

uses comobj;


var
  Saved8087CW: Word;
  PrintingWithOptions: Boolean;
  InvokingPagesetup: Boolean;
  MimeFactory, NSFactory: IClassFactory;
  MimeInternetSession, NSInternetSession: IInternetSession;
  DontRespond: Boolean;
  OpenFolder, ExploreFolder: string;
  FoldersApp, FoldersTopic: string;
  FindFolder: string;
  HtmlFileApp, HtmlFileTopic: string;
  fHtmlCommand: Boolean;
{$IFDEF VER120}
  bMsgHandler: Boolean;
{$ENDIF}



procedure TEmbeddedWB.GetThumbnail(var Image: TImage);
var
  DrawRect: TRect;
begin
  if Image = nil then exit;
  DrawRect := Rect(0, 0, Image.Height, Image.width);
  Image.Picture.Bitmap.Height := image.height;
  Image.Picture.Bitmap.Width := image.Width;
  ({$IFDEF VER120}Application_{$ELSE}Application{$ENDIF} as IviewObject).Draw(DVASPECT_DOCPRINT, 0, nil, nil, 0,
    image.Canvas.Handle, @DrawRect, nil, nil, 0);
  Image.Refresh;
end;



procedure TEmbeddedWB.SetfpExceptions(const Value: Boolean);
begin
  if not Value then begin
    Set8087CW($133F);
    FfpExceptions := False;
  end
  else
  begin
    Set8087CW(Saved8087CW);
    FfpExceptions := True;
  end;
end;


function TEmbeddedwb.GetFrame(FrameNo: Integer): IWebbrowser2;
var
  OleContainer: IOleContainer;
  enum: IEnumUnknown;
  unk: IUnknown;
  Fetched: PLongint;
begin
  while ReadyState <> READYSTATE_COMPLETE do
    Forms.Application.ProcessMessages;
  if Assigned(document) then
  begin
    Fetched := nil;
    OleContainer := Document as IOleContainer;
    OleContainer.EnumObjects(OLECONTF_EMBEDDINGS, Enum);
    Enum.Skip(FrameNo);
    Enum.Next(1, Unk, Fetched);
    Result := Unk as IWebbrowser2;
  end else Result := nil;
end;


{
Ver. 1.16:
Thanks to Brian Lowe for Fixing OLE-problem in function FrameCount:
http://groups.yahoo.com/group/delphi-webbrowser/message/4194
}

function TEmbeddedWB.FrameCount: LongInt;
var
  OleContainer: IOleContainer;
  enum: IEnumUnknown;
  unk: array[0..99] of IUnknown; // CHANGED from "unk: IUnknown;"
  EnumResult: HRESULT;
begin
  while ReadyState <> READYSTATE_COMPLETE do
    Forms.Application.ProcessMessages;
  if Assigned(document) then
  begin
    OleContainer := Document as IOleContainer;
    EnumResult := OleContainer.EnumObjects(OLECONTF_EMBEDDINGS, Enum);
    if EnumResult = S_OK then // Added per OLE help
      Enum.Next(100, Unk, @Result)
    else // Added per OLE help
      Enum := nil;
  end else
    Result := 0;
end;


procedure TEmbeddedWB.SetUserAgent;
var
  reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings\User Agent\Post Platform', True)
      then Reg.WriteString(FUserAgent, '');
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TEmbeddedWB.RemoveUserAgent;
var
  reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings\User Agent\Post Platform', FALSE)
      then reg.DeleteValue(FUseragent);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;


function GetDDEVariables: Boolean;
var
  s: string;
  Reg: TRegistry;
begin
  Reg := Tregistry.Create;
  with Reg do try
    RootKey := HKEY_CLASSES_ROOT;
    OpenKey('htmlfile\shell\open\ddeexec\application', False);
    HtmlFileApp := Readstring('');
    CloseKey;
    OpenKey('htmlfile\shell\open\ddeexec\topic', FALSE);
    HtmlFileTopic := ReadString('');
    CloseKey;
    OpenKey('Folder\shell\open\ddeexec\application', False);
    FoldersApp := Readstring('');
    CloseKey;
    OpenKey('Folder\shell\open\ddeexec\topic', FALSE);
    FoldersTopic := ReadString('');
    CloseKey;
    OpenKey('Folder\shell\open\ddeexec', False);
    s := readString('');
    CloseKey;
    S := Copy(S, Pos('[', S) + 1, length(S));
    OpenFolder := Copy(s, 1, Pos('(', S) - 1);
    OpenKey('Folder\shell\explore\ddeexec', False);
    s := readString('');
    CloseKey;
    S := Copy(S, Pos('[', S) + 1, length(S));
    ExploreFolder := Copy(s, 1, Pos('(', S) - 1);
    OpenKey('Directory\shell\find\ddeexec', False);
    s := readString('');
    CloseKey;
    S := Copy(S, Pos('[', S) + 1, length(S));
    FindFolder := Copy(s, 1, Pos('(', S) - 1);
    Result := True;
  except
    Result := False;
  end;
  Reg.Free;
end;


function GetCommandTypeFromDDEString(szCommand: string): UINT;
begin
  szCommand := Copy(szCommand, Pos('[', szCommand) + 1, length(szCommand));
  szCommand := Copy(szCommand, 1, Pos('(', szCommand) - 1);
  if szCommand = Openfolder then Result := VIEW_COMMAND else
    if szCommand = Explorefolder then Result := EXPLORE_COMMAND else
      if szCommand = Findfolder then Result := FIND_COMMAND else
        Result := NO_COMMAND;
end;

function GetPathFromDDEString(szCommand: string; var szFolder: string): Boolean;
begin
  szCommand := Copy(szCommand, Pos('"', szCommand) + 1, length(szCommand));
  szFolder := Copy(szCommand, 1, Pos('"', szCommand) - 1);
  Result := (szFolder <> '');
end;




function GetPidlFromDDEString(szCommand: string): PItemIDList;
var
  pidlShared, pidlGlobal: PItemIDList;
  dwProcessID: Integer;
  hShared: THandle;
  s: string;
  ProcessID: string;
  i: Integer;
begin
  s := Copy(szCommand, Pos(',', szCommand) + 1, length(szCommand));
  i := 1;
  while not (s[i] in IsDigit) and (i <= Length(s)) do Inc(i);
  processID := Copy(s, i, Length(S));
  s := copy(S, i, length(s) - 1);
  i := 1;
  while (s[i] in IsDigit) and (i <= Length(s)) do Inc(i);
  s := copy(S, 1, i - 1);

  while not ((ProcessID[i] = ':') or (ProcessID[i] = ',')) and (i <= Length(processID)) do Inc(i);
  if ProcessID[i] = ':' then
  begin
    ProcessID := Copy(ProcessID, i, Length(ProcessID));
    i := 1;
    while not (ProcessID[i] in IsDigit) and (i <= Length(ProcessID)) do Inc(i);
    ProcessID := Copy(ProcessID, i, Length(ProcessID));
    i := 1;
    while (ProcessID[i] in IsDigit) and (i <= Length(ProcessID)) do Inc(i);
    if not (ProcessID[i] in IsDigit) then ProcessID := Copy(ProcessID, 1, i - 1);
  end else ProcessID := '0';
  dwProcessID := StrToInt(ProcessID);
  if dwProcessID <> 0 then begin
    hShared := StrToInt(s);
    pidlShared := ShLockShared(hShared, dwProcessId);
    if PidlShared <> nil then
    begin
      Result := CopyPidl(PidlShared);
      ShUnlockShared(pidlShared);
    end else Result := nil;
    ShFreeShared(hShared, dwProcessID);
  end else
  begin
    pidlGlobal := PItemIDList(StrToInt(s));
    Result := CopyPidl(pidlGlobal);
    _Free(pidlGlobal);
  end;
end;

function GetShowCmdFromDDEString(szCommand: string): Integer;
var
  i: Integer;
begin
  i := 1;
  while szCommand[i] <> ',' do Inc(i);
  Inc(i);
  while szCommand[i] <> ',' do Inc(i);
  szCommand := Copy(szCommand, i, Length(szCommand));
  i := 0;
  repeat
    inc(i)
  until (i > Length(szCommand)) or (szCommand[i] in IsDigit);
  if i <= length(szCommand) then result := StrtoInt(szCommand[i]) else
    result := 1;
end;


function ParseDDECommand(szCommand: string; var szFolder: string; var pidl: PItemIDList; var show: Integer): UINT;
begin
  Result := GetCommandTypeFromDDEString(szCommand);
  if Result <> NO_COMMAND then begin
    GetPathFromDDEString(szCommand, szFolder);
    pidl := GetPidlFromDDEString(szCommand);
    Show := GetShowCmdFromDDEString(szCommand);
  end;
end;


function TEmbeddedwb.DDETerminate(iwParam: WPARAM; ilParam: LPARAM): BOOL;
begin
  Result := PostMessage(THandle(iwParam), WM_DDE_TERMINATE, handle, 0);
end;



function TEmbeddedWB.DDEInitiate(iwParam: WPARAM; ilParam: LPARAM): LRESULT;
var
  dwThreadID: DWORD;
  dwProcessID: DWORD;
  hwndClient: Integer;
  aInApp,
    aInTopic,
    aOutApp,
    aOutTopic: ATOM;
  szInAppName,
    szInAppTopic: array[0..255] of Char;
begin

  FillChar(szInAppName, SizeOf(szInAppName), 0);
  FillChar(szInAppTopic, SizeOf(szInAppTopic), 0);

  if DontRespond then
  begin
    result := 0;
    exit;
  end;

  hwndClient := THandle(iwParam);
  dwThreadID := GetWindowThreadProcessId(hwndClient, @dwProcessID);
  if (GetCurrentProcessId() <> dwProcessID) or (GetCurrentThreadID() <> dwThreadID) then
  begin
    result := 0;
    exit;
  end;
  aInApp := LOWORD(ilParam);
  aInTopic := HIWORD(ilParam);
  GlobalGetAtomName(aInApp, szInAppName, SizeOf(szInAppName));
  GlobalGetAtomName(aInTopic, szInAppTopic, SizeOf(szInAppTopic));
  if szInAppName = HtmlFileApp then
  begin
    fHtmlCommand := True;
    aOutApp := GlobalAddAtom(PChar(HtmlFileApp));
    aOutTopic := GlobalAddAtom(PChar(HtmlFileTopic));
    if ((aOutApp <> 0) and (aOutTopic <> 0) and (aOutApp = aInApp) and (aOutTopic = aInTopic)) then
      SendMessage(hwndClient, WM_DDE_ACK, WPARAM(handle), MAKELPARAM(aOutApp, aOutTopic));
    if (aOutApp <> 0) then GlobalDeleteAtom(aOutApp);
    if (aOutTopic <> 0) then GlobalDeleteAtom(aOutTopic);
  end
  else
  begin
    fHtmlCommand := False;
    aOutApp := GlobalAddAtom(PChar(FoldersApp));
    aOutTopic := GlobalAddAtom(PChar(FoldersTopic));
    if ((aOutApp <> 0) and (aOutTopic <> 0) and (aOutApp = aInApp) and (aOutTopic = aInTopic)) then
      SendMessage(HWNDClient, WM_DDE_ACK, WPARAM(Handle), MAKELPARAM(aOutApp, aOutTopic));
    if (aOutApp <> 0) then GlobalDeleteAtom(aOutApp);
    if (aOutTopic <> 0) then GlobalDeleteAtom(aOutTopic);
  end;
  result := 0;
end;

function TEmbeddedwb.DDEExecute(iwParam: WPARAM; ilParam: LPARAM): LRESULT;
var
  szFolder: string;
  szCommand: LPTSTR;
  uLo: PUINT;
  hgMem: HGLOBAL;
  ack: DDEACK;
  lpTemp: PUINT;
  uCommand: Cardinal;
  show: Integer;
  pidl: PITEMIDLIST;
  sei: TShellExecuteInfo;
  szTmp: string;
begin
  ulo := nil;
  if UnpackDDElParam(WM_DDE_EXECUTE, ilParam, uLo, @hgMem)
    then begin
    szCommand := GlobalLock(hgmem);
    ZeroMemory(@Ack, sizeof(ddeAck));
    if (szCommand <> nil) then
    begin
      if fHtmlCommand then
      begin
        szTmp := szCommand;
        if Pos('"', szTmp) = 1 then
        begin
          Delete(szTmp, 1, 1);
          szTmp := System.Copy(szTmp, 1, Pos('"', szTmp) - 1);
        end;
        Go(szTmp);
        Ack.flags := 1;
      end
      else
      begin
        uCommand := ParseDDECommand(szCommand, szFolder, pidl, Show);
        case uCommand of
          VIEW_COMMAND:
            begin

              if (szFolder <> '') then Go(szFolder)
              else
                if (pidl <> nil) then NavigatePidl(pidl);
              DisposePidl(pidl);
              Ack.flags := 1;
            end;
          EXPLORE_COMMAND:
            begin
              DontRespond := TRUE;
              ZeroMemory(@sei, sizeof(SHELLEXECUTEINFO));
              sei.cbSize := sizeof(SHELLEXECUTEINFO);
              if szFolder <> '' then begin
                sei.fMask := SEE_MASK_CLASSNAME;
                sei.lpFile := Pchar(szFolder);
              end else
              begin
                sei.fMask := SEE_MASK_IDLIST or SEE_MASK_CLASSNAME;
                sei.lpIDList := pidl;
              end;
              sei.lpClass := 'folder';
              sei.Wnd := 0;
              sei.nShow := Show;
              sei.lpVerb := 'explore';
              ShellExecuteEx(@sei);
              DontRespond := FALSE;
              DisposePidl(pidl);
              Ack.flags := 1;
            end;
          FIND_COMMAND:
            begin
              DontRespond := TRUE;
              ZeroMemory(@sei, sizeof(SHELLEXECUTEINFO));
              sei.cbSize := sizeof(SHELLEXECUTEINFO);
              if (szFolder <> '')
                then begin
                sei.fMask := 0;
                sei.lpFile := PChar(szFolder);
              end
              else
              begin
                sei.fMask := SEE_MASK_IDLIST;
                sei.lpIDList := pidl;
              end;
              sei.wnd := 0;
              sei.nShow := Show;
              sei.lpVerb := 'find';
              ShellExecuteEx(@sei);
              DontRespond := FALSE;
              DisposePidl(pidl);
              Ack.flags := 1;
            end;
        end;
      end;
      GlobalUnlock(hgMem);
      lpTemp := @Ack;
      PostMessage(Thandle(iwParam),
        WM_DDE_ACK,
        WPARAM(handle),
        ReuseDDElParam(ilParam, WM_DDE_EXECUTE, WM_DDE_ACK, lpTemp^, hgMem));
    end;
  end;
  Result := 0;
end;


procedure TEmbeddedwb.PrintWithOptions;
begin
  PrintingWithOptions := True;
  Pagesetup(TRUE);
  Print;
end;


procedure TembeddedWB.GetPrintValues;
var
  S: string;
  regWinRegistry: TRegistry;

  function ReadMargin(key: string): Real;
  begin
    S := RegwinRegistry.ReadString(key);
    S := Stringreplace(S, ' ', '', [rfReplaceAll]);
    if DecimalSeparator <> '.' then
      S := Stringreplace(S, '.', DecimalSeparator, []);
    if Printoptions.Measure = mMetric then
      result := StrtoFloat(S) * InchToMetric else
      result := StrtoFloat(S);
  end;

begin
  regWinRegistry := TRegistry.Create;
  try
    with regWinRegistry do begin
      RootKey := HKEY_CURRENT_USER;
      if OpenKey('Software\Microsoft\Internet Explorer\PageSetup', False) then
      begin
        PrintOptions.Header := Readstring('header');
        PrintOptions.Footer := ReadString('footer');
        PrintOptions.Margins.left := ReadMargin('margin_left');
        PrintOptions.Margins.right := ReadMargin('margin_right');
        PrintOptions.Margins.top := ReadMargin('margin_top');
        PrintOptions.Margins.bottom := ReadMargin('margin_bottom');
      end;
    end;
  finally
    regWinRegistry.Free;
  end;
end;


procedure TEmbeddedWB.Loaded;
begin
  inherited Loaded;
  CoInternetCreateSecuritymanager(self, SecurityManager, 0);
  CoInternetCreateZoneManager(self, ZoneManager, 0);
  UpdateDownloadControlValue;
  UpdateUserInterfaceValue;
  hook;
  if not (csDesigning in ComponentState) then
  begin
    OldWBWndProc := WindowProc;
    WindowProc := WBWndProc;
    SetUserAgent;
  end else
  begin
    PrintOptions.FMeasure := RunTimeMeasure;
    GetPrintValues;
  end;

end;

function TEmbeddedWB.PrintMarginStr(M: Real): PChar;
var
  S: string;
begin
  if printOptions.Measure <> RuntimeMeasure
    then begin
    if RuntimeMeasure = mMetric then
      s := FloatToStr(M * InchToMetric) else
      s := FloatToStr(M / InchToMetric);
    Result := PChar(S);
  end else Result := PChar(FloatToStr(M));
end;


constructor TEmbeddedWb.Create(Owner: TComponent);
var
  Buf: array[1..10] of Char;
begin
  FfpExceptions := True;
  inherited;
{$IFDEF VER120}
  enablemessagehandler;
{$ENDIF}
  GetDDEVariables;
  DDEHWnd := AllocateHWnd(DDEWndProc);
  FPrintOptions := TPrintOptions.Create;
  FPrintOptions.Margins := TMargins.Create;
  FPrintOptions.FHTMLHeader := TStringlist.Create;
  FPrintOptions.FHTMLHeader.Add('<HTML></HTML>');
  FillChar(Buf, SizeOf(Buf), 0);
  GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_IMEASURE, @Buf[1], SizeOf(Buf));
  if Buf[1] = '1' then RunTimeMeasure := mUS else
    RunTimeMeasure := mMetric;
  DownloadOptions := [DLCTL_DLIMAGES, DLCTL_BGSOUNDS, DLCTL_VIDEOS];
  UserInterfaceOptions := [];
  FEnableDDE := False;
end;


destructor TEmbeddedWb.Destroy;
begin
  DeAllocateHWnd(DDEHwnd);
  FPrintOptions.HTMLHeader.Free;
  FPrintoptions.Margins.Free;
  FPrintoptions.Free;
  unhook;
  RemoveUserAgent;
{$IFDEF VER120}
  disablemessagehandler;
{$ENDIF}
  inherited;
end;


function RegisterMIMEFilter(clsid: TGUID; MIME: PWideChar): HRESULT;
begin
  CoGetClassObject(Clsid, CLSCTX_SERVER, nil, IClassFactory, MimeFactory);
  CoInternetGetSession(0, MimeInternetSession, 0);
  Result := MIMEInternetSession.RegisterMimeFilter(MimeFactory, Clsid, MIME);
end;

function UnregisterMIMEFilter(MIME: PWideChar): HRESULT;
begin
  Result := MIMEInternetSession.UnregisterMimeFilter(MIMEFactory, MIME);
end;


function RegisterNameSpace(clsid: TGUID): HRESULT;
begin
  CoGetClassObject(Clsid, CLSCTX_SERVER, nil, IClassFactory, NSFactory);
  CoInternetGetSession(0, NSInternetSession, 0);
  Result := NSInternetSession.RegisterNameSpace(NSFactory, Clsid, 'http', 0, nil, 0);
end;

function UnregisterNameSpace: HRESULT;
begin
  Result := NSInternetSession.UnregisterNameSpace(NSFactory, 'http');
end;


procedure TEmbeddedWB.Hook;
begin
  if (csDesigning in ComponentState) then exit;
  FParentform := TForm(Owner);
  if (FParentForm <> nil) and (FParentForm.HandleAllocated) then
  begin
    FOldWindowProc := FParentForm.WindowProc;
    FParentForm.WindowProc := FormWndProc;
  end;
end;

procedure TEmbeddedWB.UnHook;
begin
  if (csDesigning in ComponentState) then exit;
  if (FParentForm <> nil) and (FParentForm.HandleAllocated) then
    FParentForm.WindowProc := FOldWindowProc;
//  FOldWindowProc := nil;
  FParentform := nil;
end;


procedure TEmbeddedWB.DDEWndProc(var AMsg: TMessage);
begin
  with AMsg do
    if (Msg = WM_DDE_INITIATE) and FEnableDDE
      then DDEInitiate(wparam, lparam)
    else
      Result := DefWindowProc(DDEHWND, msg, wParam, lParam);
end;


procedure TEmbeddedWB.FormWndProc(var AMsg: TMessage);
var
  i: Integer;
  wnd: Integer;
  S: string;
  Msg: TWmActivate;
begin
  if AMsg.Msg = WM_ACTIVATE then begin
    Msg := TWmActivate(AMsg);
    if Msg.Active = 0 then
    begin
      wnd := Msg.ActiveWindow;
      SetLength(S, 80);
      SetLength(S, GetClassName(Wnd, PChar(S), Length(S)));
      if (S = '#32770') then
      begin
        if ReplaceCaption then
        begin
          SendMessage(wnd, WM_SETICON, ICON_SMALL, Forms.Application.Icon.Handle);
          I := GetWindowTextLength(wnd);
          SetLength(S, I + 1);
          GetWindowText(Wnd, PChar(S), I + 1);
          S := StringReplace(S, 'Microsoft ', '', []);
          S := StringReplace(S, 'Internet Explorer', Forms.Application.Title, []);
          SetWindowText(Wnd, Pchar(S));
        end;
        if InvokingPageSetup then
        begin
          InvokingPagesetup := False;
          if PrintingWithOptions then
          begin
            SetWindowPos(Wnd, 0, -600, 0, 0, 0, 0);
            PrintingWithOptions := False;
          end;
          if PrintOptions.Orientation = poPortrait then
            SendDlgItemMessage(Wnd, $0420, BM_CLICK, 0, 0) else
            SendDlgItemMessage(Wnd, $0421, BM_CLICK, 0, 0);
          SetDlgItemText(wnd, $1FD3, PChar(PrintOptions.Header));
          SetDlgItemText(wnd, $1FD5, PChar(PrintOptions.Footer));
          SetDlgItemText(wnd, $0483, PrintMarginStr(PrintOptions.Margins.Left));
          SetDlgItemText(wnd, $0484, PrintMarginStr(PrintOptions.Margins.top));
          SetDlgItemText(wnd, $0485, PrintMarginStr(PrintOptions.Margins.Right));
          SetDlgItemText(wnd, $0486, PrintMarginStr(PrintOptions.Margins.Bottom));
          if (Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4) then
            PostMessage(FindWindowEx(wnd, 0, Pchar('Button'), nil), BM_CLICK, 0, 0) //Win2000
          else SendDlgItemMessage(Wnd, 1, BM_CLICK, 0, 0);
        end;
      end;
      if not PrintingWithOptions and (wnd <> 0) and Assigned(FOnShowDialog) then FOnShowDialog(self, Wnd);
    end;
  end;
  FOldWindowProc(AMsg);
end;

function TEmbeddedWB.QueryService(const rsid, iid: TGuid; out Obj): HResult;
begin
  if Assigned(FOnQueryService) then
    Result := FOnQueryService(rsid, iid, IUnknown(obj)) else
    Result := E_NOINTERFACE;
end;


function TEmbeddedWB.ShowMailClient: Boolean;
begin
  result := OpenClient('Mail');
end;

function TEmbeddedWB.ShowNewsClient: Boolean;
begin
  result := OpenClient('News');
end;

function TEmbeddedWB.ShowAddressBook: Boolean;
begin
  result := OpenClient('Contacts');
end;

function TEmbeddedWB.ShowCalendar: Boolean;
begin
  result := OpenClient('Calendar');
end;

function TEmbeddedWB.ShowInternetCall: Boolean;
begin
  result := OpenClient('Internet Call');
end;


function TEmbeddedWB.OpenClient(Client: string): Boolean;
var
  s, params, Exec: string;
begin
  Result := FALSE;
  with TRegistry.Create do
  try
    RootKey := HKEY_LOCAL_MACHINE;
    OpenKey('Software\Clients\' + Client, FALSE);
    S := ReadString('');
    CloseKey;
    OpenKey('Software\Clients\' + Client + '\' + S + '\shell\open\command', FALSE);
    S := ReadString('');
    CloseKey;
    if S <> '' then begin
      if Pos('/', S) > 0 then begin
        Exec := system.Copy(S, 1, Pos('/', S) - 2);
        Params := system.Copy(s, Length(exec) + 1, length(S));
      end else begin
        Exec := S;
        Params := '';
      end;
      Result := TRUE;
      shellExecute(handle, 'open', Pchar(Exec), pChar(Params), '', SW_SHOW);
    end;
  finally
    Free;
  end;
end;


procedure TEmbeddedWB.PrintPreView;
// IE 5.5 only
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(FALSE, OLECMDID_PRINTPREVIEW, OLECMDEXECOPT_DODEFAULT, vaIn, vaOut);
end;


procedure TEmbeddedWB.SetDownloadOptions(const Value:
  TDownloadControlOptions);
begin
  FDownloadControlOptions := Value;
  UpdateDownloadControlValue;
{$IFDEF VER120}
  (Application_ as IOleControl).OnAmbientPropertyChange(DISPID_AMBIENT_DLCONTROL);
{$ELSE}
  (Application as IOleControl).OnAmbientPropertyChange(DISPID_AMBIENT_DLCONTROL);
{$ENDIF}
end;

procedure TEmbeddedWB.SetUserInterfaceOptions(const Value:
  TUserInterfaceOptions);
begin
  FUserInterfaceOptions := Value;
  UpdateUserInterfaceValue;
{$IFDEF VER120}
  (Application_ as IOleControl).OnAmbientPropertyChange(DISPID_AMBIENT_DLCONTROL);
{$ELSE}
  (Application as IOleControl).OnAmbientPropertyChange(DISPID_AMBIENT_DLCONTROL);
{$ENDIF}
end;

procedure TEmbeddedWB.UpdateDownloadControlValue;
const
  acardDownloadControlValues: array[TDownloadControlOption] of Cardinal =
  ($00000010, $00000020, $00000040, $00000080,
    $00000100, $00000200, $00000400, $00000800,
    $00001000, $00002000, $00004000, $00008000,
    $00010000, $00020000, $00040000, $10000000,
    $20000000, $40000000, $80000000);
var
  i: TDownloadControlOption;
begin
  FDownloadOptionValue := 0;
  if (FDownloadControlOptions <> []) then
    for i := Low(TDownloadControlOption) to High(TDownloadControlOption)
      do
      if (i in FDownloadControlOptions) then
        Inc(FDownloadOptionValue, acardDownloadControlValues[i]);
end;

procedure TEmbeddedWB.UpdateUserInterfaceValue;
const
  acardUserInterfaceValues: array[TUserInterfaceOption] of Cardinal =
  ($00000001, $00000002, $00000004, $00000008,
    $00000010, $00000020, $00000040, $00000080,
    $00000100, $00000200, $00000400, $00000800,
    $00001000, $00002000, $00004000, $00010000, $00020000);
var
  i: TUserInterfaceOption;
begin
  FUserInterfaceValue := 0;
  if (FUserInterfaceOptions <> []) then
    for i := Low(TUserInterfaceOption) to High(TUserInterfaceOption) do
      if (i in FUserInterfaceOptions) then
        Inc(FUserInterfaceValue, acardUserInterfaceValues[i]);
end;


function TEmbeddedWB.IsGlobalOffline: boolean;
var
  dwState: DWORD;
  dwSize: DWORD;
begin
  dwState := 0;
  dwSize := SizeOf(dwState);
  result := false;
  if (InternetQueryOption(nil, INTERNET_OPTION_CONNECTED_STATE, @dwState,
    dwSize)) then
    if ((dwState and INTERNET_STATE_DISCONNECTED_BY_USER) <> 0) then
      result := true;
end;

procedure TEmbeddedWB.SetGlobalOffline(Value: Boolean);
const
  INTERNET_STATE_DISCONNECTED_BY_USER = $10;
  ISO_FORCE_DISCONNECTED = $1;
  INTERNET_STATE_CONNECTED = $1;
var
  ci: TInternetConnectedInfo;
  dwSize: DWORD;
begin
  dwSize := SizeOf(ci);
  if (Value) then begin
    ci.dwConnectedState := INTERNET_STATE_DISCONNECTED_BY_USER;
    ci.dwFlags := ISO_FORCE_DISCONNECTED;
  end else begin
    ci.dwFlags := 0;
    ci.dwConnectedState := INTERNET_STATE_CONNECTED;
  end;
  InternetSetOption(nil, INTERNET_OPTION_CONNECTED_STATE, @ci, dwSize);
end;


function SaveDocToStream(Doc: IDispatch; var AStream: TStream): HResult;
var
  IpStream: IPersistStreamInit;
begin
  if Doc <> nil then begin
    IpStream := Doc as IPersistStreamInit;
    Result := IpStream.save(TStreamAdapter.Create(AStream), TRUE);
  end else Result := S_FALSE;
end;


function TEmbeddedWB.SaveToStream(AStream: TStream): HRESULT;
begin
  while ReadyState <> READYSTATE_COMPLETE do
    Forms.Application.ProcessMessages;
  if Assigned(Document) then
    Result := SaveDocToStream(Document, AStream)
  else Result := S_FALSE;
end;




function SaveDocToStrings(Doc: IDispatch; var AStrings: TStrings): HResult;
var
  IpStream: IPersistStreamInit;
  AStream: TMemoryStream;
begin
  AStream := TMemoryStream.Create;
  try
    IpStream := doc as IPersistStreamInit;
    if not Assigned(IpStream) then Result := S_FALSE else
      if Succeeded(IpStream.save(TStreamadapter.Create(AStream), TRUE))
        then begin
        AStream.Seek(0, 0);
        AStrings.LoadFromStream(AStream);
        Result := S_OK;
      end else Result := S_FALSE;
  except
    Result := S_FALSE;
  end;
  AStream.Free;
end;

function TEmbeddedwb.SaveFrameToStream(FrameNo: Integer; AStream: TStream): HRESULT;
var
  iw: IWebbrowser2;
begin
  Result := S_FALSE;
  iw := Getframe(frameNo);
  if (iw <> nil) and assigned(iw.Document) then
    Result := SaveDocToStream(iw.Document, AStream)
end;



function TEmbeddedwb.SaveFrameToStrings(FrameNo: Integer; AStrings: TStrings): HRESULT;
var
  iw: Iwebbrowser2;
begin
  Result := S_FALSE;
  iw := Getframe(frameNo);
  if (iw <> nil) and assigned(iw.Document) then
    Result := SaveDocToStrings(iw.Document, AStrings);
end;

function TEmbeddedwb.SaveFrameToFile(FrameNo: Integer; const Fname: string): HRESULT;
var
  Iw: IWebbrowser2;
  PFile: IPersistFile;
begin
  iw := Getframe(frameNo);
  if (iw <> nil) and assigned(iw.Document) then begin
    PFile := iw.Document as IPersistFile;
    Result := PFile.Save(StringToOleStr(FName), False);
  end else Result := S_FALSE;
end;


function SaveDocToFile(Doc: IDispatch; const Fname: string): HResult;
var
  PFile: IPersistFile;
begin
  PFile := Doc as IPersistFile;
  Result := PFile.Save(StringToOleStr(FName), False);
end;


function TEmbeddedWB.SaveToFile(const Fname: string): HRESULT;
begin
  while ReadyState <> READYSTATE_COMPLETE do
    Forms.Application.ProcessMessages;
  if Assigned(Document) then
  begin
    Result := SaveDocToFile(Document, FName);
  end else Result := S_FALSE;
end;



function TEmbeddedWB.SaveToStrings(AStrings: TStrings): HRESULT;
begin
  while ReadyState <> READYSTATE_COMPLETE do
    Forms.Application.ProcessMessages;
  if Assigned(document) then
    Result := SaveDocToStrings(Document, AStrings)
  else Result := S_FALSE;
end;

function TEmbeddedWb.LoadFrameFromStrings(Frameno: Integer; const AStrings: TStrings): HResult;
var
  iw: IWebbrowser2;
  M: TMemoryStream;
begin
  Result := S_FALSE;
  iw := GetFrame(Frameno);
  if (iw <> nil) and assigned(iw.document) then begin
    M := TMemoryStream.Create;
    try
      AStrings.SaveToStream(M);
      M.seek(0, 0);
      Result := (iw.Document as IPersistStreamInit).Load(TStreamadapter.Create(M));
    except
      Result := S_FALSE;
    end;
    M.free;
  end;
end;

function TEmbeddedWb.LoadFromStrings(const AStrings: TStrings): HResult;
var
  M: TMemoryStream;
begin
  if not Assigned(document) then AssignDocument;
  M := TMemoryStream.Create;
  try
    AStrings.SaveToStream(M);
    Result := LoadFromStream(M);
  except
    Result := S_FALSE;
  end;
  M.free;
end;


function TEmbeddedWb.LoadFrameFromStream(FrameNo: Integer; AStream: TStream): HRESULT;
var
  iw: IWebbrowser2;
begin
  Result := S_FALSE;
  iw := Getframe(frameNo);
  if (iw <> nil) then if Assigned(iw.Document) then
    begin
      AStream.seek(0, 0);
      Result := (iw.Document as IPersistStreamInit).Load(TStreamadapter.Create(AStream));
    end;
end;

function TEmbeddedWb.LoadFromStream(const AStream: TStream): HRESULT;
begin
  if not Assigned(Document) then AssignDocument;
  AStream.seek(0, 0);
  Result := (Document as IPersistStreamInit).Load(TStreamadapter.Create(AStream));
end;

procedure TEmbeddedWb.AssignDocument;
begin
  Go('about:blank');
  while readystate <> READYSTATE_COMPLETE do Forms.Application.ProcessMessages;
end;

procedure TEmbeddedWb.SetFocusToDoc;
begin
  if Document <> nil then
    with {$IFDEF VER120}Application_{$ELSE}Application{$ENDIF} as IOleobject do
      DoVerb(OLEIVERB_UIACTIVATE, nil, Self, 0, Handle, GetClientRect);
end;

{$IFDEF VER120}

procedure TEmbeddedWb.EnableMessagehandler;
begin
  if not bMsgHandler then
  begin
    SaveMessage := Forms.Application.OnMessage;
    Forms.Application.OnMessage := IeMessagehandler;
    bMsgHandler := True;
  end;
end;


procedure TEmbeddedWB.DisableMessageHandler;
begin
  if bMsgHandler then
  begin
    Forms.Application.onMessage := Savemessage;
    bMsgHandler := False;
  end;
end;
{$ENDIF}


///BEGIN >>>>> Messagehandler by Mathias Walter - walter@coint.de >>>>>///

procedure TEmbeddedWB.WBWndProc(var Message: TMessage);
const
  StdKeys = [VK_RETURN, VK_BACK]; { standard keys }
  ExtKeys = [VK_LEFT, VK_RIGHT]; { extended keys }
  fExtended = $01000000; { extended key flag }
var
  bClose: Boolean;
{$IFNDEF VER120}
  WinMsg: TMsg;
{$ENDIF}
begin
  with Message do
  begin
{$IFNDEF VER120}
    if (Msg >= (CN_BASE + WM_KEYFIRST)) and (Msg <= (CN_BASE + WM_DEADCHAR)) then
    begin
      WinMsg.hwnd := Handle;
      WinMsg.message := Msg - CN_BASE;
      WinMsg.wParam := wParam;
      WinMsg.lParam := lParam;
      WinMsg.time := GetMessageTime;
      WinMsg.pt.x := $115DE1F1;
      WinMsg.pt.y := $115DE1F1;
      if not ((wParam in StdKeys) or
        (wParam in ExtKeys) and ((lParam and fExtended) = fExtended)) then
        with Application as IOleInPlaceActiveObject do
          Result := Integer(TranslateAccelerator(WinMsg) = S_OK);
    end
    else
{$ENDIF}
      case Msg of
        WM_MOUSEACTIVATE:
            SetFocus;
        WM_CLOSE: begin
            bClose := True;
            if Assigned(FOnCloseQuery) then
              FOnCloseQuery(Self, bClose);
            if bClose then
              OldWBWndProc(Message);
          end;
        WM_DDE_EXECUTE: DDEExecute(wparam, lparam);
        WM_DDE_TERMINATE: DDETerminate(wparam, lparam);
      else
        OldWBWndProc(Message);
      end;
  end;
end;

{$IFDEF VER120}

procedure TEmbeddedWB.IEMessageHandler(var Msg: TMsg; var Handled: Boolean);
{ fixes the malfunction of some keys within webbrowser control }
const
  StdKeys = [VK_TAB, VK_RETURN]; { standard keys }
  ExtKeys = [VK_DELETE, VK_BACK, VK_LEFT, VK_RIGHT]; { extended keys }
  fExtended = $01000000; { extended key flag }
begin
  Handled := False;
  with Msg do
    if ((Message >= WM_KEYFIRST) and (Message <= WM_KEYLAST)) and
      ((wParam in StdKeys) or (GetKeyState(VK_CONTROL) < 0) or
      (wParam in ExtKeys) and ((lParam and fExtended) = fExtended)) then
    try
      if IsChild(Handle, hWnd) then
      { handles all browser related messages }
      begin
        with Application_ as IOleInPlaceActiveObject do
          Handled := TranslateAccelerator(Msg) = S_OK;
        if not Handled then
        begin
          Handled := True;
          TranslateMessage(Msg);
          DispatchMessage(Msg);
        end;
      end;
    except end;
end; // IEMessageHandler
{$ENDIF}

///END <<<<<< Messagehandler by Mathias Walter - walter@coint.de <<<<<///


procedure TEmbeddedWb.NavigateFolder(CSIDL: Integer);
var
  sFolder: PITemIdList;
begin
  SHGetSpecialFolderLocation(0, CSIDL, SFolder);
  NavigatePidl(SFolder);
  CoTaskMemFree(SFolder);
end;


procedure TEmbeddedWB.NavigatePidl(pidl: PItemIdList);
var
  VaEmpty, vaPidl: Olevariant;
  psa: PSafeArray;
  cbData: UINT;
begin
  cbdata := GetPidlSize(pidl);
  psa := SafeArrayCreateVector(VT_UI1, 0, cbData);
  if (psa <> nil) then begin
    CopyMemory(psa.pvData, pidl, cbData);
    VariantInit(vaPidl);
    TVariantArg(vaPidl).vt := VT_ARRAY or VT_UI1;
    TVariantArg(vaPidl).parray := psa;
    Navigate2(vaPidl, vaEmpty, vaEmpty, vaEmpty, vaEmpty);
    VariantClear(vaPidl);
  end;
end;

procedure TEmbeddedWB.Go(Url: string);
var
  _URL, Flags, TargetFrameName, PostData, Headers: Olevariant;
begin
  _URL := Url;
  Flags := 0; TargetFrameName := 0; Postdata := 0; Headers := 0;
  Navigate2(_URL, Flags, TargetFrameName, PostData, Headers);
end;


procedure TEmbeddedWB.InvokeCMD(InvokeIE: Boolean; Value1, Value2: Integer; var vaIn, vaOut: OleVariant);
var
  CmdTarget: IOleCommandTarget;
  PtrGUID: PGUID;
begin
  New(PtrGUID);
  if InvokeIE then PtrGUID^ := CLSID_WebBrowser else
    PtrGuid := PGUID(nil);
  if Document <> nil then
  try
    Document.QueryInterface(IOleCommandTarget, CmdTarget);
    if CmdTarget <> nil then
    try
      CmdTarget.Exec(PtrGuid, Value1, Value2, vaIn, vaOut);
    finally
      CmdTarget._Release;
    end;
  except end;
  Dispose(PtrGUID);
end;


procedure TEmbeddedWB.Print;
var
  vaIn, vaOut: Olevariant;
  HtmlText: string;
  Stream: IStream;
  Dummy: Int64;
  Psa: PSafeArray;
begin
  HtmlText := PrintOptions.HtmlHeader.Text;
  CreateStreamOnHGlobal(0, TRUE, Stream);
  Stream.Write(Pchar(HTMLText), length(HTMLText), @Dummy);
  Stream.Seek(0, STREAM_SEEK_SET, Dummy);
  SafeArrayCopy(PSafeArray(TVarData(VarArrayOf([FPrintOptions.Header, FPrintOptions.Footer, Stream as IUnknown])).VArray), psa);
  TVarData(VaIn).VType := varArray or varByRef;
  SafeArrayCopy(psa, PSafeArray(TVarData(VaIn).VArray));
  InvokeCmd(FALSE, OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER, vaIn, vaOut);
end;

procedure TEmbeddedWB.PrintSetup;
var
  vaIn, vaOut: Olevariant;
  HtmlText: string;
  Stream: IStream;
  Dummy: Int64;
  Psa: PSafeArray;
begin
  HtmlText := PrintOptions.HtmlHeader.Text;
  CreateStreamOnHGlobal(0, TRUE, Stream);
  Stream.Write(Pchar(HTMLText), length(HTMLText), @Dummy);
  Stream.Seek(0, STREAM_SEEK_SET, Dummy);
  SafeArrayCopy(PSafeArray(TVarData(VarArrayOf([FPrintOptions.Header, FPrintOptions.Footer, Stream as IUnknown])).VArray), psa);
  TVarData(VaIn).VType := varArray or varByRef;
  SafeArrayCopy(psa, PSafeArray(TVarData(VaIn).VArray));
  InvokeCmd(FALSE, OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, vaIn, vaOut);
end;

procedure TEmbeddedWB.PageSetup(UsePrintOptions: Boolean);
var
  vaIn, vaOut: Olevariant;
begin
  if UsePrintOptions then InvokingPageSetup := True;
  InvokeCmd(FALSE, OLECMDID_PAGESETUP, OLECMDEXECOPT_DODEFAULT, vaIn, vaOut);
end;

procedure TEmbeddedWB.OpenDialog;
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(FALSE, OLECMDID_OPEN, OLECMDEXECOPT_DODEFAULT, vaIn, vaOut);
end;

procedure TEmbeddedWB.SaveDialog;
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(FALSE, OLECMDID_SAVEAS, OLECMDEXECOPT_DODEFAULT, vaIn, vaOut);
end;

procedure TEmbeddedWB.ViewSource;
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(TRUE, HTMLID_VIEWSOURCE, 0, vaIn, vaOut);
end;

procedure TEmbeddedWB.Options;
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(TRUE, HTMLID_OPTIONS, 0, vaIn, vaOut);
end;

procedure TEmbeddedWB.Properties;
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(FALSE, OLECMDID_PROPERTIES, OLECMDEXECOPT_DODEFAULT, vaIn, vaOut);
end;

procedure TEmbeddedWB.Find;
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(TRUE, HTMLID_FIND, 0, vaIn, vaOut);
end;

procedure TEmbeddedWB.Copy;
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(FALSE, OLECMDID_COPY, OLECMDEXECOPT_DODEFAULT, vaIn, vaOut);
end;

procedure TEmbeddedWB.SelectAll;
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(FALSE, OLECMDID_SELECTALL, OLECMDEXECOPT_DODEFAULT, vaIn, vaOut);
end;


procedure TEmbeddedWB.Zoom(ZoomValue: Integer);
var
  vaIn, vaOut: Olevariant;
begin
  if ZoomValue < ZoomRangeLow then vaIn := ZoomRangeLow else
    if ZoomValue > ZoomRangeHigh then vaIn := ZoomRangeHigh else
      vaIn := ZoomValue;
  InvokeCmd(FALSE, OLECMDID_ZOOM, OLECMDEXECOPT_DONTPROMPTUSER, vaIn, vaOut);
end;

function TEmbeddedWB.ZoomRangeLow: Integer;
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(FALSE, OLECMDID_GETZOOMRANGE, OLECMDEXECOPT_DONTPROMPTUSER, vaIn, vaOut);
  result := LoWord(Dword(vaOut));
end;

function TEmbeddedWB.ZoomRangeHigh: Integer;
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(FALSE, OLECMDID_GETZOOMRANGE, OLECMDEXECOPT_DONTPROMPTUSER, vaIn, vaOut);
  result := HiWord(Dword(vaOut));
end;

function TEmbeddedWB.ZoomValue: Integer;
var
  vaIn, vaOut: Olevariant;
begin
  vaIn := null;
  InvokeCmd(FALSE, OLECMDID_ZOOM, OLECMDEXECOPT_DONTPROMPTUSER, vaIn, vaOut);
  result := vaOut;
end;

// IDOCHOSTUIHANDLER

function TEmbeddedWB.ShowContextMenu(const dwID: DWORD; const ppt: PPOINT;
  const pcmdtReserved: IUnknown; const pdispReserved: IDispatch): HRESULT;
begin
  if Assigned(FOnShowContextmenu) then RESULT := FOnSHowContextmenu(dwID, ppt,
      pcmdtreserved, pdispreserved) else
    RESULT := S_FALSE;
end;

function TEmbeddedWB.GetHostInfo(var pInfo: TDOCHOSTUIINFO): HRESULT;
begin
  pInfo.cbSize := SizeOf(pInfo);
  pInfo.dwFlags := FUserInterfaceValue;
  pInfo.dwDoubleClick := DOCHOSTUIDBLCLK_DEFAULT;
  if Assigned(FOnGetHostInfo) then
    Result := FOnGetHostInfo(pInfo) else
    Result := S_OK;
end;

function TEmbeddedWB.ShowUI(const dwID: DWORD;
  const pActiveObject: IOleInPlaceActiveObject;
  const pCommandTarget: IOleCommandTarget; const pFrame: IOleInPlaceFrame;
  const pDoc: IOleInPlaceUIWindow): HRESULT;
begin
  if Assigned(FOnShowUI) then
    Result := FOnShowUI(dwID, pActiveObject, pCommandTarget, pFrame, pDoc)
  else
    Result := S_FALSE;
end;

function TEmbeddedWB.HideUI: HRESULT;
begin
  if Assigned(FOnHideUI) then
    Result := FOnHideUI else
    Result := S_FALSE;
end;

function TEmbeddedWB.UpdateUI: HRESULT;
begin
  if Assigned(FOnUpdateUI) then
    Result := FOnUpdateUI else
    Result := S_FALSE;
end;

function TEmbeddedWB.EnableModeless(const fEnable: BOOL): HRESULT;
begin
  if Assigned(FOnEnableModeless) then
    Result := FOnEnableModeless(fEnable) else
    Result := S_FALSE;
end;

function TEmbeddedWB.OnDocWindowActivate(const fActivate: BOOL): HRESULT;
begin
  if Assigned(FOnOnDocWindowActivate) then
    Result := FOnOnDocWindowActivate(fActivate) else
    Result := S_FALSE;
end;

function TEmbeddedWB.OnFrameWindowActivate(const fActivate: BOOL): HRESULT;
begin
  if Assigned(FOnOnFrameWindowActivate) then
    Result := FOnOnFrameWindowActivate(fActivate) else
    Result := S_FALSE;
end;

function TEmbeddedWB.ResizeBorder(const prcBorder: PRECT;
  const pUIWindow: IOleInPlaceUIWindow; const fRameWindow: BOOL): HRESULT;
begin
  if Assigned(FOnResizeBorder) then
    Result := FOnResizeBorder(prcBorder, pUIWindow, fRameWindow) else
    Result := S_FALSE;
end;

function TEmbeddedWB.TranslateAccelerator(const lpMsg: PMSG;
  const pguidCmdGroup: PGUID; const nCmdID: DWORD): HRESULT;
begin
  if Assigned(FOnTranslateAccelerator) then
    Result := FOnTranslateAccelerator(lpMsg, pguidCmdGroup, nCmdID) else
    Result := S_FALSE;
end;

function TEmbeddedWB.GetOptionKeyPath(var pchKey: POLESTR; const dw: DWORD): HRESULT;
begin
  if Assigned(FOnGetOptionKeyPath) then
    Result := FOnGetOptionKeyPath(pchKey, dw) else
    Result := S_FALSE;
end;

function TEmbeddedWB.GetDropTarget(const pDropTarget: IDropTarget;
  out ppDropTarget: IDropTarget): HRESULT;
begin
  if Assigned(FOnGetDropTarget) then
    Result := FOnGetDropTarget(pDropTarget, ppDropTarget) else
    Result := S_OK;
end;

function TEmbeddedWB.GetExternal(out ppDispatch: IDispatch): HRESULT;
begin
  if Assigned(FOnGetExternal) then
    Result := FOnGetExternal(ppDispatch) else
    Result := S_FALSE;
end;

function TEmbeddedWB.TranslateUrl(const dwTranslate: DWORD;
  const pchURLIn: POLESTR; var ppchURLOut: POLESTR): HRESULT;
begin
  if Assigned(FOnTranslateUrl) then
    Result := FOnTranslateUrl(dwTranslate, pchUrlIn, ppchUrlOut) else
    Result := S_FALSE;
end;

function TEmbeddedWB.FilterDataObject(const pDO: IDataObject;
  out ppDORet: IDataObject): HRESULT;
begin
  if Assigned(FOnFilterDataObject) then
    Result := FOnFilterDataObject(pDO, ppDORet) else
    Result := S_FALSE;
end;



// IDOCHOSTSHOWUI

function TEmbeddedWB.ShowMessage(hwnd: THandle; lpstrText: POLESTR;
  lpstrCaption: POLESTR; dwType: longint; lpstrHelpFile: POLESTR;
  dwHelpContext: longint; var plResult: LRESULT): HRESULT;
begin
  if Assigned(FOnShowMessage) then
    Result := FOnShowMessage(hwnd, lpstrText, lpStrCaption, dwType, lpStrHelpFile, dwHelpContext, plResult) else
    Result := S_FALSE;
end;

function TEmbeddedWB.ShowHelp(hwnd: THandle; pszHelpFile: POLESTR;
  uCommand: integer; dwData: longint; ptMouse: TPoint;
  var pDispatchObjectHit: IDispatch): HRESULT;
begin
  Result := S_OK;
  if Assigned(FOnShowHelp) then
    Result := FOnShowHelp(hwnd, pszHelpFile, uCommand, dwData, ptMouse, pDispatchObjectHit) else
    if FHelpFile <> '' then HtmlHelp(hwnd, Pchar(FHelpFile), ucommand, dwData) else
      Result := S_FALSE;
end;

// IDISPATCH methods

function TEmbeddedWB.GetIDsOfNames(const IID: TGUID; Names: Pointer;
  NameCount, LocaleID: Integer; DispIDs: Pointer): HResult;
begin

  if Assigned(FOnGetIdsofNames) then
    Result := FOnGetIdsofNames(IID, Names, NameCount, LocaleID, DispIds) else
    result := E_NotImpl;

end;

function TEmbeddedWB.GetTypeInfo(Index, LocaleID: Integer;
  out TypeInfo): HResult;
begin
  if Assigned(FOnGetTypeInfo) then
    Result := FOnGetTypeInfo(Index, LocaleID, ITypeInfo(TypeInfo)) else
  begin
    Result := E_NOTIMPL;
    pointer(TypeInfo) := nil;
  end;
end;

function TEmbeddedWB.GetTypeInfoCount(out Count: Integer): HResult;
begin
  if Assigned(FOnGetTypeInfoCount) then
    Result := FOnGetTypeInfoCount(Count) else
  begin
    Result := E_NOTIMPL;
    Count := 0;
  end;
end;

function TEmbeddedWB.Invoke(DispID: Integer;
  const IID: TGUID;
  LocaleID: Integer;
  Flags: Word;
  var Params;
  VarResult, ExcepInfo,
  ArgErr: Pointer): HResult;
begin
  Result := S_OK;
  if (Flags and DISPATCH_PROPERTYGET <> 0) and (VarResult <> nil) and
    (DispId = DISPID_AMBIENT_DLCONTROL) then
    PVariant(VarResult)^ := FDownloadOptionValue
  else
    if Assigned(FOnInvoke) then
      Result := FOnInvoke(DispId, IID, LocaleID, Flags, TagDispParams(Params),
        VarResult, ExcepInfo, ArgErr)
    else
      Result := inherited Invoke(DispID, IID, LocaleID, Flags, Params,
        VarResult, ExcepInfo, ArgErr);
end;


procedure Register;
begin
  RegisterComponents({$IFDEF VER120} 'ActiveX'{$ELSE} 'Internet'{$ENDIF}, [TEmbeddedWB]);
end;


{ TPrintOptions }

procedure TPrintOptions.SetHTMLHeader(const Value: Tstrings);
begin
  FHTMLHeader.Assign(Value);
end;



function DeleteFirstCacheEntry(var H: THandle): DWORD;
var
  T: PInternetCacheEntryInfo;
  D: DWord;
begin
  Result := S_OK;
  H := 0;
  D := 0;
  FindFirstUrlCacheEntryEx(nil, 0, URLCACHE_FIND_DEFAULT_FILTER, 0, nil, @D, nil, nil, nil);
  GetMem(T, D);
  try
    H := FindFirstUrlCacheEntryEx(nil, 0, URLCACHE_FIND_DEFAULT_FILTER, 0, T, @D, nil, nil, nil);
    if (H = 0) then Result := GetLastError else DeleteUrlCacheEntry(T^.lpszSourceUrlname);
  finally
    FreeMem(T, D)
  end;
end;

function DeleteNextCacheEntry(H: THandle): DWORD;
var
  T: PInternetCacheEntryInfo;
  D: DWORD;
begin
  Result := S_OK;
  D := 0;
  FindnextUrlCacheEntryEx(H, nil, @D, nil, nil, nil);
  GetMem(T, D);
  try
    if not FindNextUrlCacheEntryEx(H, T, @D, nil, nil, nil)
      then Result := GetLastError else DeleteUrlCacheEntry(T^.lpszSourceUrlname);
  finally
    FreeMem(T, D)
  end;
end;


procedure TEmbeddedWB.ClearCache;
var
  H: THandle;
begin
  if DeleteFirstCacheEntry(H) = S_OK then
    repeat
    until DeleteNextCacheEntry(H) = ERROR_NO_MORE_ITEMS;
  FindCloseUrlCache(H)
end;

procedure TEmbeddedWB.ClearHistory;
var
  HistoryStg: IUrlHistoryStg2;
begin
  HistoryStg := CreateComObject(CLSID_CUrlHistory) as IUrlHistoryStg2;
  HistoryStg.ClearHistory;
end;

function TEmbeddedWB.GetOverrideKeyPath(pchKey: POLESTR;
  dw: DWORD): HRESULT;
begin
  if Assigned(FOnGetOverrideKeyPath) then RESULT := FOnGetOverrideKeyPath(pchkey, dw) else
    Result := S_OK;
end;

{$IFDEF USE_IOLECOMMANDTARGET}

function TEmbeddedWB.Exec(CmdGroup: PGUID; nCmdID, nCmdexecopt: DWORD;
  const vaIn: OleVariant; var vaOut: OleVariant): HResult;
var
  FCancel, FContinueScript, FShowDialog: Boolean;
  pEventObj: IHTMLEventObj;
  function GetProperty(const PropName: WideString): OLEVariant;
  var
    Dispparams: TDispParams;
    Disp, Status: Integer;
    ExcepInfo: TExcepInfo;
    PPropName: PWideChar;
  begin
    Dispparams.rgvarg := nil;
    Dispparams.rgdispidNamedArgs := nil;
    Dispparams.cArgs := 0;
    Dispparams.cNamedArgs := 0;
    PPropName := PWideChar(PropName);
    Status := pEventObj.GetIDsOfNames(GUID_NULL, @PPropname, 1,
      LOCALE_SYSTEM_DEFAULT, @Disp);
    if Status = 0 then
    begin
      Status := pEventObj.Invoke(disp, GUID_NULL, LOCALE_SYSTEM_DEFAULT, DISPATCH_PROPERTYGET,
        Dispparams, @Result, @ExcepInfo, nil);
      if Status <> 0 then DispatchInvokeError(Status, ExcepInfo);
    end else
      if Status = DISP_E_UNKNOWNNAME then
        raise EOleError.CreateFmt('''%s'' not supported.', [PropName])
      else
        OleCheck(Status);
  end;
begin
  if (CmdGroup = nil) then
  begin
    Result := OLECMDERR_E_UNKNOWNGROUP;
    exit;
  end;
  Result := OLECMDERR_E_NOTSUPPORTED;
  if (ncmdID = OLECMDID_ONUNLOAD) and IsEqualGuid(cmdGroup^, CGID_EXPLORER) and
    Assigned(FOnUnload) then FOnUnload(Self);

  if IsEqualGuid(cmdGroup^, CGID_DocHostCommandHandler) then
  begin
    if Assigned(FOnRefresh) and ((nCmdID = 6041 {F5}) or (nCmdID = 6042 {ContextMenu}) or (nCmdID = 2300)) then
    begin
      FCancel := False;
      FOnRefresh(self, nCmdID, FCancel);
      if FCancel then Result := S_OK;
    end else
      case nCmdID of
        OLECMDID_SHOWSCRIPTERROR:
          if Assigned(FOnScriptError)
            then begin
            pEventObj := (Document as IHTMLDocument2).parentWindow.event;
            if pEventObj <> nil then
            begin
              FContinueScript := True;
              FShowDialog := True;
              FOnScriptError(self,
                GetProperty('errorline'),
                GetProperty('errorCharacter'),
                GetProperty('errorCode'),
                GetProperty('errorMessage'),
                GetProperty('errorUrl'),
                FContinueScript, FShowDialog);
              TVariantArg(vaOut).vt := VT_BOOL;
              TVariantArg(vaOut).vbool := FContinueScript;
              if not FShowDialog then Result := S_OK;
            end;
          end;
      end;
  end;
end;


function TEmbeddedWB.QueryStatus(CmdGroup: PGUID; cCmds: Cardinal;
  prgCmds: POleCmd; CmdText: POleCmdText): HResult;
begin
  result := S_OK;
end;
{$ENDIF}


initialization
  Saved8087CW := Default8087CW;
{$IFDEF VER120}
  bMsgHandler := False;
{$ENDIF}
  OleInitialize(nil);
finalization
  Set8087CW(Saved8087CW);
  try
    OleUninitialize;
  except end;
end.

